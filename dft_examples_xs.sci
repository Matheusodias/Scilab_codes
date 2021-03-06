function f=sinc_xs(M,N)
    clear f
    n=[-N/2:N/2-1]
    nn = n+0.001
    f=1/N*sin(2*%pi*nn*(M-0.5)/N)./sin(%pi*nn/N)
    subplot(211);
    plot2d3(n,f)
    m=[-N/2:N/2-1]
    subplot(212)
    plot2d3(m,fftshift(abs(fft(f))))
endfunction

function f=sinc_xs_hp(M,N)
    clear f
    n=[-N/2:N/2-1]
    nn = n+0.001
    f=1/N*sin(2*%pi*nn*(M-0.5)/N)./sin(%pi*nn/N).*(-1)^(n-1)
    subplot(211);
    plot2d3(n,f)
    m=[-N/2:N/2-1]
    subplot(212)
    plot2d3(m,fftshift(abs(fft(f))))
endfunction

function f=exp_xs(k,N)
    n=[0:N-1]';
    ns=[0:1/100:N-1]';
    if(modulo(N,2)) then
        m=[-(N-1)/2:(N-1)/2]';
    else
        m=[-N/2:N/2-1]';
    end
    ms=[-50*N:50*N-1]'/100;
    f=exp(%i*2*%pi*n*k/N);   
    fs=exp(%i*2*%pi*ns*k/N); 
    f_padded(1:100*N)=complex(0,0);
    f_padded(1:N)=f(1:N);
    F=fft(f);
    Fs=fft(f_padded);
    subplot(321)
    plot2d3(n,real(f))
    xtitle("Real(f(n))")
    xlabel("n")
    subplot(322)
    plot2d3(n,imag(f))
    xtitle("Imag(f(n)")
    xlabel("n")
    subplot(323)
    plot2d3(m,fftshift(abs(F)))
    xtitle("|F(m)|  - DFT")
    xlabel("m")
    subplot(324)
    plot(ns,imag(fs),'b')
    plot2d3(n,imag(f))
    xtitle("Imag(f(n)  e Imag(f(t))")
    xlabel("m")
    subplot(325)
    plot(ms,fftshift(abs(Fs)))
    plot2d3(m,fftshift(abs(F)))
    xtitle("|F(m)| e |Fs(jw)| - 1 período da DTFT")
    xlabel("jw")
    subplot(326)
    plot([ms-N ms ms+N],fftshift(abs([Fs Fs Fs])))
    xtitle("|Fs(jw)|     - 3 períodos da DTFT")
    xlabel("jw")
endfunction


function f=cosseno_xs(k,N)
    n=[0:N-1]';
    ns=[0:1/100:N-1]';
    if(modulo(N,2)) then
        m=[-(N-1)/2:(N-1)/2]';
    else
        m=[-N/2:N/2-1]';
    end
    ms=[-50*N:50*N-1]'/100;
    f=cos(2*%pi*n*k/N);   
    fs=cos(2*%pi*ns*k/N); 
    f_padded(1:100*N)=complex(0,0);
    f_padded(1:N)=f(1:N);
    F=fft(f);
    Fs=fft(f_padded);
    subplot(321)
    plot2d3(n,f)
    xtitle("f(n)")
    xlabel("n")
    subplot(322)
    plot2d3(n,f)
    plot(ns,fs) 
    xtitle("f(n) e f(t)")
    xlabel("n")
    subplot(323)
    plot2d3(m,fftshift(abs(F)))
    xtitle("|F(m)|  - DFT")
    xlabel("m")
    subplot(324)
    plot2d3(m,fftshift(phasemag(F,'c')))
    xtitle("Fase(F(m))  - DFT")
    xlabel("m")
    subplot(325)
    plot(ms,fftshift(abs(Fs)))
    plot2d3(m,fftshift(abs(F)))
    xtitle("|F(m)| e |Fs(jw)| - 1 período da DTFT")
    xlabel("jw")
    subplot(326)
    plot([ms-N ms ms+N],fftshift(abs([Fs Fs Fs])))
    xtitle("|Fs(jw)|     - 3 períodos da DTFT")
    xlabel("jw")
endfunction

