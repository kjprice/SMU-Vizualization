// https://introcs.cs.princeton.edu/java/97data/LinearRegression.java.html

public class LinearRegression { 
    float beta1;
    float beta0;
    LinearRegression(float[] x, float[] y) { 
        // first pass: read in data, compute xbar and ybar
        int n;
        double sumx = 0.0, sumy = 0.0, sumx2 = 0.0;
        for(n = 0; n < x.length; n++) {
            sumx  += x[n];
            sumx2 += x[n] * x[n];
            sumy  += y[n];
        }
        double xbar = sumx / n;
        double ybar = sumy / n;

        // second pass: compute summary statistics
        double xxbar = 0.0, yybar = 0.0, xybar = 0.0;
        for (int i = 0; i < n; i++) {
            xxbar += (x[i] - xbar) * (x[i] - xbar);
            yybar += (y[i] - ybar) * (y[i] - ybar);
            xybar += (x[i] - xbar) * (y[i] - ybar);
        }
        beta1 = (float)(xybar / xxbar);
        beta0 = (float)(ybar - beta1 * xbar);

        // print results
        println("y   = " + beta1 + " * x + " + beta0);

        // analyze results
        int df = n - 2;
        double rss = 0.0;      // residual sum of squares
        double ssr = 0.0;      // regression sum of squares
        for (int i = 0; i < n; i++) {
            double fit = beta1*x[i] + beta0;
            rss += (fit - y[i]) * (fit - y[i]);
            ssr += (fit - ybar) * (fit - ybar);
        }
        double R2    = ssr / yybar;
        double svar  = rss / df;
        double svar1 = svar / xxbar;
        double svar0 = svar/n + xbar*xbar*svar1;
        println("R^2                 = " + R2);
        println("std error of beta_1 = " + Math.sqrt(svar1));
        println("std error of beta_0 = " + Math.sqrt(svar0));
        svar0 = svar * sumx2 / (n * xxbar);
        println("std error of beta_0 = " + Math.sqrt(svar0));

        println("SSTO = " + yybar);
        println("SSE  = " + rss);
        println("SSR  = " + ssr);
    }
}