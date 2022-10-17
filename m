Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60155600872
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 10:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424159.671380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLFG-0001dd-Bb; Mon, 17 Oct 2022 08:13:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424159.671380; Mon, 17 Oct 2022 08:13:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okLFG-0001bK-8h; Mon, 17 Oct 2022 08:13:10 +0000
Received: by outflank-mailman (input) for mailman id 424159;
 Mon, 17 Oct 2022 08:13:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a+MA=2S=gmail.com=arthurborsboom@srs-se1.protection.inumbo.net>)
 id 1okLFE-0001bE-Qy
 for xen-devel@lists.xen.org; Mon, 17 Oct 2022 08:13:08 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86cb9991-4df3-11ed-91b4-6bf2151ebd3b;
 Mon, 17 Oct 2022 10:13:07 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id k9so9662629pll.11
 for <xen-devel@lists.xen.org>; Mon, 17 Oct 2022 01:13:06 -0700 (PDT)
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
X-Inumbo-ID: 86cb9991-4df3-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G+LMEQuyp9Kc6brexe+iAWaP1CuuHDUAFC/qtpZ7ejA=;
        b=eHY3L9JBx2SGftDjSLn31qcB/JsKI+9HTyHvect9hKYZNbUomo/WTKc/lGbm9ztBVT
         0exu9MasIJJ9MXRLCKLsZuAhgPtp//EkvU+J0GwSq0Ceb0dXlp0IavCrrR8Ly+C9uZ48
         TByazcalosZPHGZ6F4GZHt51+YUH/8o81GuHI56A/0oq+e98eR5a0BJ/oMQ4KcL8IsU7
         7k0TUl9yx1GjmDrbM4BJiW9q7mx1ryohDy9Vo4pniLXGfPSBKGcGL1R2zCRCM0duhqlE
         +RcPCxg17BAwvmWGPjh9jdbyeHLQPkpHKqkAAJoMCZJu4wEkewCt1d/MWK6nujuJUX3i
         Bgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G+LMEQuyp9Kc6brexe+iAWaP1CuuHDUAFC/qtpZ7ejA=;
        b=vhpKwTKVWNAUXCJKuF4zWy3fJn4dFeJ2wNv74GTjtAVcSMIH7Sw085oAJtF8c/taIV
         xosbosakB+BHll6skE7+oQ5+jfuV/d3un1ifz1NLhdcnV46Q+BlTDHjhRvfhA4i79gte
         O9rDLBXhu21uNpqLVBuuP6ab9BzUCMOjVIuY7COcrb3DTA1LPqkHJQrwS4TKREnqg5/W
         NnHX3RA7cWcTlTvx6iTGTJWgrpsd8GQm6+gLRVweSG3TzJWgQpTlET6Fg0ndi6usiO+K
         1Wt2ZusPfL/yKFDyADXySirDGa1itO9DeVLp4x2jsfEvlhNMKOlIS+2dtl9sdiG2/XZ+
         PG/A==
X-Gm-Message-State: ACrzQf3/tKTQ7EvVjtZA2KldsP1iUMog/lHHCcCCLoiLpG3oXIsEMTqh
	v9rwcdVYKOdXpYXU2WE//0MGn8/pjlLLR2FOlSrCTaPyccyaXQ==
X-Google-Smtp-Source: AMsMyM4AZmMAYiw7p/p2pNkJZMn34rxrPjEGRa4xEi09D2P9PWqHyv3ndENShvOmUCkQyU/L6gPigy2W8m1KZpd76xs=
X-Received: by 2002:a17:902:820b:b0:185:b9a:8ac1 with SMTP id
 x11-20020a170902820b00b001850b9a8ac1mr10788326pln.111.1665994384244; Mon, 17
 Oct 2022 01:13:04 -0700 (PDT)
MIME-Version: 1.0
From: Arthur Borsboom <arthurborsboom@gmail.com>
Date: Mon, 17 Oct 2022 10:12:48 +0200
Message-ID: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
Subject: [BUG] Xen build error - undefined reference to bpf_program__set_socket_filter
To: xen-devel <xen-devel@lists.xen.org>
Content-Type: multipart/alternative; boundary="0000000000007884a705eb368bf9"

--0000000000007884a705eb368bf9
Content-Type: text/plain; charset="UTF-8"

Xen 4.16.1, 4.16.2 and 4.17.0-rc1 don't build anymore in Arch Linux.

I believe it is caused by the missing function
bpf_program__set_socket_filter provided by libbpf.
This function has been deprecated in v0.8 and has been removed in v1.0.

Arch Linux uses libbpf v1.0.1 since October 2022.
A downgrade to libbpf v0.8.1 fixes the Xen build problem.

Source about the deprecation:
https://libbpf-test.readthedocs.io/en/latest/api.html

Build error:

/bin/ld: libcommon.fa.p/ebpf_ebpf_rss.c.o: in function `ebpf_rss_load':
/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/qemu-xen-build/../qemu-xen/ebpf/ebpf_rss.c:52:
undefined reference to `bpf_program__set_socket_filter'
collect2: error: ld returned 1 exit status
...
...
ninja: build stopped: subcommand failed.
make: *** [Makefile:156: run-ninja] Error 1
make: Leaving directory
'/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/qemu-xen-build'
make[3]: *** [Makefile:212: subdir-all-qemu-xen-dir] Error 2
make[3]: Leaving directory
'/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
make[2]: ***
[/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools/../tools/Rules.mk:161:
subdirs-install] Error 2
make[2]: Leaving directory
'/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
make[1]: *** [Makefile:66: install] Error 2
make[1]: Leaving directory
'/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools'
make: *** [Makefile:140: install-tools] Error 2
==> ERROR: A failure occurred in build().
Aborting...
-> error making: xen

--0000000000007884a705eb368bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Xen 4.16.1, 4.16.2 and 4.17.0-rc1 don&#39;t build anymore =
in Arch Linux.<br><br><div>I
 believe it is caused by the missing function=20
bpf_program__set_socket_filter provided by libbpf.</div><div>This function =
has been=20
deprecated in v0.8 and has been removed in v1.0.</div><br><div>Arch Linux u=
ses libbpf v1.0.1 since October 2022.</div><div>A downgrade to libbpf v0.8.=
1 fixes the Xen build problem.</div><div><br></div><div>Source about the de=
precation: <a rel=3D"nofollow" target=3D"_blank" href=3D"https://libbpf-tes=
t.readthedocs.io/en/latest/api.html">https://libbpf-test.readthedocs.io/en/=
latest/api.html</a><br></div><div><br></div>Build error:<br><br>/bin/ld: li=
bcommon.fa.p/ebpf_ebpf_rss.c.o: in function `ebpf_rss_load&#39;:<br><div>/h=
ome/arthur/.cache/yay/xen/src/xen-4.16.1/tools/qemu-xen-build/../qemu-xen/e=
bpf/ebpf_rss.c:52: undefined reference to `bpf_program__set_socket_filter&#=
39;</div>collect2: error: ld returned 1 exit status<br>...<br>...<br>ninja:=
 build stopped: subcommand failed.<br>make: *** [Makefile:156: run-ninja] E=
rror 1<br>make: Leaving directory &#39;/home/arthur/.cache/yay/xen/src/xen-=
4.16.1/tools/qemu-xen-build&#39;<br>make[3]: *** [Makefile:212: subdir-all-=
qemu-xen-dir] Error 2<br>make[3]: Leaving directory &#39;/home/arthur/.cach=
e/yay/xen/src/xen-4.16.1/tools&#39;<br>make[2]: *** [/home/arthur/.cache/ya=
y/xen/src/xen-4.16.1/tools/../tools/Rules.mk:161: subdirs-install] Error 2<=
br>make[2]: Leaving directory &#39;/home/arthur/.cache/yay/xen/src/xen-4.16=
.1/tools&#39;<br>make[1]: *** [Makefile:66: install] Error 2<br>make[1]: Le=
aving directory &#39;/home/arthur/.cache/yay/xen/src/xen-4.16.1/tools&#39;<=
br>make: *** [Makefile:140: install-tools] Error 2<br>=3D=3D&gt; ERROR: A f=
ailure occurred in build().<br>    Aborting...<br><div> -&gt; error making:=
 xen</div></div>

--0000000000007884a705eb368bf9--

