Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C223D501C53
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 22:04:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305110.519976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf5h3-0007sy-VD; Thu, 14 Apr 2022 20:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305110.519976; Thu, 14 Apr 2022 20:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf5h3-0007qw-RA; Thu, 14 Apr 2022 20:03:53 +0000
Received: by outflank-mailman (input) for mailman id 305110;
 Thu, 14 Apr 2022 20:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf5h1-0007qq-Qg
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 20:03:51 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0056c53f-bc2e-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 22:03:50 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id hu11so4978328qvb.7
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 13:03:50 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0056c53f-bc2e-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2pNaKHROdAKSL54wzL8nb03qQdEJLmJRk4/BgRLUAWc=;
        b=ftpbXYlrRYaJ8QQy2Zkaaj2oLnX/1pmRBi+IkSpNFBlOwK8/fSLN1rZwd3BokbFLFZ
         qNezLQJ3M7lcwb1dkzWiosVDlrpiWWJfRkfzlJLFF0p4KnS8+Cn5n/rY5l0VOQPtj+fL
         qxMmpxQhYXEpf8D5XJxrXKDZ1seKwqKZ5DkrXkt1h3v4443V5KjG30mDAH72EW/swD2F
         WFKZnHKRxAYITnNd6n+xj8F4kDZ1keCfaVzFmSspZJR5qAwaJ5z91WTfQad8VkBaYfoi
         +vgz34DB/aS0jLnqGr/azhqAFLx9v6SeUXKCp4+LO7qcQa4hHj18xNC/uILWETU7rsz6
         /IUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2pNaKHROdAKSL54wzL8nb03qQdEJLmJRk4/BgRLUAWc=;
        b=MqVfnTYRPWaPQXWLrBIAH7+Oel39Q7HxzGdfMmhMJuHN4+Or9yfvnRr15IlUcSD6MH
         RjiOvrM8yNpu7qoDIln4YuRYO8s5WN6aEtCHJ5dBss9sJ/AQEZfvN0zvW64UF1HN3Hok
         8pxhBlGMNcfdFucDa7SyN9ywOj2oJ10BYmUfCAGnjsMqcpL6ko8+jU54wKxoxH4f6KJ7
         uUjTIIMm+ZEIEo+B6sy4oN9RQn2XYUFhfrJ1rt+I0ANdaIJGgK0sBXn9fhITKU5YOPkq
         9qti+9J6OKZ/6yp4eCHs1wWn9V7GPvqnqktAm2EN/0lPFPlVi6L6EIzz7nrZ3Ro7kjht
         4Mvw==
X-Gm-Message-State: AOAM530xg698hmJE9qb85O3VL4S9f1SIRfgE8mksv/z/kwJ4g5XgQBed
	ZEl6cpNrAYZhqsQLVcVozP4yeaNfcFP5jdVa5Q7/YIhcxTU=
X-Google-Smtp-Source: ABdhPJzX2jSVS3FygLQp+MUraAjUTpufsH6dXQtH61r/dmx8+uTxzPCLPaIL1JQH3FbzxGBJfU9OZaj7+t+tZCHCogk=
X-Received: by 2002:a05:6214:5284:b0:444:10c8:ee59 with SMTP id
 kj4-20020a056214528400b0044410c8ee59mr4997174qvb.68.1649966629539; Thu, 14
 Apr 2022 13:03:49 -0700 (PDT)
MIME-Version: 1.0
References: <87pmsylywy.fsf@linaro.org> <YU5mW396S04IsCBr@mail-itl>
 <874ka68h96.fsf@linaro.org> <CACMJ4GbgnQVQbH1N3Duxmx10n-Qv+zzncqarNyuhmKhE-wqdqA@mail.gmail.com>
 <alpine.DEB.2.21.2109272323160.5022@sstabellini-ThinkPad-T480s>
 <CAPD2p-=MdGB_a+oEsFrPQpLo7GeKkMwYyAWcQt3z0qrGr3vR7w@mail.gmail.com>
 <alpine.DEB.2.21.2110011649220.3209@sstabellini-ThinkPad-T480s>
 <CAPD2p-m=hYbG1YjPZ9yZ7Qzs6KjCT2jSHpaDUPB0sFJoZfY4uw@mail.gmail.com>
 <alpine.DEB.2.21.2110041436070.3209@sstabellini-ThinkPad-T480s> <1d6382b6-ddf8-494c-4f7b-afc50a4269a4@gmail.com>
In-Reply-To: <1d6382b6-ddf8-494c-4f7b-afc50a4269a4@gmail.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 14 Apr 2022 23:03:37 +0300
Message-ID: <CAPD2p-nftmTXQTaOw1kmkBDn96i8sgcaH21o7bsGK-fA+fYbaw@mail.gmail.com>
Subject: Re: [Stratos-dev] Xen Rust VirtIO demos work breakdown for Project Stratos
To: xen-devel <xen-devel@lists.xenproject.org>, 
	Rust-VMM Mailing List <rust-vmm@lists.opendev.org>, 
	Stratos Mailing List <stratos-dev@op-lists.linaro.org>
Cc: Christopher Clark <christopher.w.clark@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	Artem Mygaiev <Artem_Mygaiev@epam.com>, Sergio Lopez <slp@redhat.com>, Wei Liu <wl@xen.org>, 
	Stefan Hajnoczi <stefanha@gmail.com>, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd.bergmann@linaro.org>, 
	David Woodhouse <dwmw2@infradead.org>, Rich Persaud <persaur@gmail.com>, 
	Daniel Smith <dpsmith@apertussolutions.com>, Paul Durrant <paul@xen.org>, 
	openxt <openxt@googlegroups.com>, Julien Grall <julien@xen.org>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000d8536405dca2cafd"

--000000000000d8536405dca2cafd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all.

[Sorry for the possible format issues]

I have an update regarding (valid) concern which has been also raised in
current thread which is the virtio backend's ability (when using Xen
foreign mapping) to map any guest pages without guest "agreement" on that.
There is a PoC (with virtio-mmio on Arm) which is based on Juergen Gross=E2=
=80=99
work to reuse secure Xen grant mapping for the virtio communications.
All details are at:
https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-oleksty=
sh@gmail.com/
https://lore.kernel.org/xen-devel/1649964960-24864-1-git-send-email-oleksty=
sh@gmail.com/

--=20
Regards,

Oleksandr Tyshchenko

--000000000000d8536405dca2cafd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div class=3D"gmail_attr">Hello all.</div><div class=3D"gmail_attr"><br></d=
iv><div class=3D"gmail_attr">[Sorry for the possible format issues]</div><d=
iv class=3D"gmail_attr"><br></div><div class=3D"gmail_attr">I have an updat=
e regarding (valid) concern which has been also raised in current thread wh=
ich is the virtio backend&#39;s ability (when using Xen foreign mapping) to=
 map any guest pages without guest &quot;agreement&quot; on that.</div><div=
 class=3D"gmail_attr">There is a PoC (with virtio-mmio on Arm) which is bas=
ed on Juergen Gross=E2=80=99=C2=A0 work to reuse secure Xen grant mapping f=
or the virtio communications.</div><div class=3D"gmail_attr">All details ar=
e at:<br></div><div class=3D"gmail_attr"><a href=3D"https://lore.kernel.org=
/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/" target=
=3D"_blank">https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-e=
mail-olekstysh@gmail.com/</a><br></div><div class=3D"gmail_attr"><a href=3D=
"https://lore.kernel.org/xen-devel/1649964960-24864-1-git-send-email-olekst=
ysh@gmail.com/">https://lore.kernel.org/xen-devel/1649964960-24864-1-git-se=
nd-email-olekstysh@gmail.com/</a><br></div><div class=3D"gmail_attr"><br></=
div></div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><d=
iv><div dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font=
 size=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif=
">Regards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D=
"ltr"><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"=
2">Oleksandr Tyshchenko</font></span></div></div></div></div></div></div></=
div></div>

--000000000000d8536405dca2cafd--

