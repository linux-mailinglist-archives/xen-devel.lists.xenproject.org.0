Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE125063D3
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 07:16:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307289.523019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nggDz-00056Q-Jn; Tue, 19 Apr 2022 05:16:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307289.523019; Tue, 19 Apr 2022 05:16:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nggDz-00054Y-Gc; Tue, 19 Apr 2022 05:16:27 +0000
Received: by outflank-mailman (input) for mailman id 307289;
 Mon, 18 Apr 2022 15:41:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GwBk=U4=cartorioibate.com.br=yl.arkevznoae@srs-se1.protection.inumbo.net>)
 id 1ngTV2-0003aK-29
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 15:41:12 +0000
Received: from srv01.kosbit.com.br (srv01.kosbit.com.br [173.209.60.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f608c81a-bf2d-11ec-a405-831a346695d4;
 Mon, 18 Apr 2022 17:41:07 +0200 (CEST)
Received: from [38.134.28.85] (port=42984 helo=srv01.kosbit.com.br)
 by srv01.kosbit.com.br with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA (Exim 4.95)
 (envelope-from <yl.arkevznoae@cartorioibate.com.br>)
 id 1ngTUz-000K68-V8 for xen-devel@lists.xenproject.org;
 Mon, 18 Apr 2022 12:41:07 -0300
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
X-Inumbo-ID: f608c81a-bf2d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=cartorioibate.com.br; s=default; h=Message-ID:Subject:To:From:
	Content-Transfer-Encoding:Content-Type:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=tl5R69NF5tGRQ6GTbvEOL32J4T3YUjbNFugAGtnf3G0=; b=ncndpYcTxPKPfrRosJ+7rB50H1
	3tNPIqOcdppbPudaaZjmGmyAGBajXEyUoDea2Ui+hIkCOHYC4CVIDAA3rbbHaCSMdN4Oy2KD3K5xL
	KgCJarcH2aF5BfhBJYrxPR6fyjmbZrytcr+cSBja7FbJ1yBXuYK4bzycY9xGFq0AvR/NA0rBTcHxE
	M3cMdrR1C4mp/WC6dQaAIfHPtfa3NyW+gIwYW5EMaaP3Y7KYKKRrXuCJdD29GZoQnoJjA/wix56E2
	SeEuNKDb7aKq3P4K8yTPaXnTWQ1+dnzgvOZxT5VYgACm7Ed3ooA4v2F797BED4K7zwe3RMVlEk3C0
	ETZ7rbyQ==;
MIME-Version: 1.0
Date: Mon, 18 Apr 2022 07:41:01 -0800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
From: "John Simpson via Gcc-help" <yl.arkevznoae@cartorioibate.com.br>
To: xen-devel@lists.xenproject.org
Subject: Re: An error due to installation that require binutils package
Message-ID: <9qzinbu1rahwqveil1oqpwky3bmo78co@cartorioibate.com.br>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - srv01.kosbit.com.br
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cartorioibate.com.br
X-Get-Message-Sender-Via: srv01.kosbit.com.br: authenticated_id: yl.arkevznoae@cartorioibate.com.br
X-Authenticated-Sender: srv01.kosbit.com.br: yl.arkevznoae@cartorioibate.com.br
X-Source: 
X-Source-Args: 
X-Source-Dir: 

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body>Greetings,<br />=0A<br />=0AYou were searching for t=
his file we were focusing on the other day, i believe. Anyhow, right here i=
s link to this particular data down below:<br />=0A<br />=0A<br />=0Ahttps:=
//hitechwater.net/doi/iuetgtf<br />
<br />
Hello,
Kindly ask you to have a look at this bug.
Thank you for your replies.
On Mon, Mar 29, 2021 at 7:07 PM George Dunlap <George.Dunlap@citrix.com>
wrote:
> John,
>
> Thanks for your report.  Can you post your bug report
>  ?
>
> The bug is in the compilation of QEMU, which is an external project; so
> it=92s possible that we=92ll end up having to raise this with that commun=
ity as
> well.
>
> Thanks,
>  -George Dunlap
>
> > On Mar 28, 2021, at 2:26 PM, John Simpson  wrote:
> >
> > Hello,
> >
> > Just forwarding this message to you. Can you give some thoughs about
> this? Thanks a lot.
> >
> >
> > ---------- Forwarded message ---------
> > From: Alan Modra=20
> > Date: Sun, Mar 28, 2021 at 2:21 PM
> > Subject: Re: An error due to installation that require binutils package=
=2E
> > To: John Simpson=20
> > Cc:=20
> >
> >
> > On Sun, Mar 28, 2021 at 12:55:23PM +0300, John Simpson via Binutils
> wrote:
> > >   BUILD   pc-bios/optionrom/kvmvapic.img
> > > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> >
> > -no-pie is a gcc option.  Neither -no-pie nor --no-pie is a valid ld
> > option.  The fault lies with whatever passed -no-pie to ld.
> >
> > --
> > Alan Modra
> > Australia Development Lab, IBM
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: Andreas Schwab=20
> > Date: Sun, Mar 28, 2021 at 2:17 PM
> > Subject: Re: An error due to installation that require binutils package=
=2E
> > To: John Simpson via Binutils=20
> > Cc: John Simpson=20
> >
> >
> > Please report that to the xen project.  ld -no-pie doesn't have a usefu=
l
> > meaning.  It used to mean the same as ld -n -o-pie, which sets "-pie" a=
s
> > the output file name.
> >
> > Andreas.
> >
> > --
> > Andreas Schwab,=20
> > GPG Key fingerprint =3D 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA A=
EC1
> > "And now for something completely different."
> >
> >
> >
> > ---------- Forwarded message ---------
> > From: John Simpson=20
> > Date: Sun, Mar 28, 2021 at 12:55 PM
> > Subject: An error due to installation that require binutils package.
> > To:=20
> >
> >
> > Hello,
> >
> > Recently I got a following error due to installation xen on
> 5.11.6-1-MANJARO kernel:
> >
> >   GEN     target/riscv/trace.c
> >   GEN     target/s390x/trace.c
> >   GEN     target/sparc/trace.c
> >   GEN     util/trace.c
> >   GEN     config-all-devices.mak
> > make[1]: Entering directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> > make[1]: Nothing to be done for 'all'.
> > make[1]: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen/slirp'
> >   BUILD   pc-bios/optionrom/multiboot.img
> >   BUILD   pc-bios/optionrom/linuxboot.img
> >   BUILD   pc-bios/optionrom/linuxboot_dma.img
> >   BUILD   pc-bios/optionrom/kvmvapic.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: multiboot.img] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot_dma.img] Error 1
> >   BUILD   pc-bios/optionrom/pvh.img
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: linuxboot.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:53: kvmvapic.img] Error 1
> > ld: Error: unable to disambiguate: -no-pie (did you mean --no-pie ?)
> > make[1]: *** [Makefile:50: pvh.img] Error 1
> > make: *** [Makefile:581: pc-bios/optionrom/all] Error 2
> > make: Leaving directory
> '/home/username/xen/src/xen-4.14.1/tools/qemu-xen-build'
> > make[3]: *** [Makefile:218: subdir-all-qemu-xen-dir] Error 2
> > make[3]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[2]: ***
> [/home/username/xen/src/xen-4.14.1/tools/../tools/Rules.mk:235:
> subdirs-install] Error 2
> > make[2]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make[1]: *** [Makefile:72: install] Error 2
> > make[1]: Leaving directory '/home/username/xen/src/xen-4.14.1/tools'
> > make: *** [Makefile:134: install-tools] Error 2
> > =3D=3D> ERROR: A failure occurred in build().
> >     Aborting...
> >
> > Currently I have fresh binutils 2.36.1-2 and it seems to me that the
> issue is related to this part of code:
> >
> > github.com/bminor/binutils-gdb/blob/master/ld/lexsup.c#L451
> >
> > It seems to me that this could impact far more users than just me.
> >
>
></body></html>

