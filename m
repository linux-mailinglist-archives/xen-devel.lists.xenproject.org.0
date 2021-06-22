Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 202CB3B09C2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:00:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145950.268465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvipJ-0000gW-58; Tue, 22 Jun 2021 16:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145950.268465; Tue, 22 Jun 2021 16:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvipJ-0000da-1t; Tue, 22 Jun 2021 16:00:37 +0000
Received: by outflank-mailman (input) for mailman id 145950;
 Tue, 22 Jun 2021 16:00:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wlN=LQ=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1lvipH-0000dU-EN
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:00:35 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 67e9bdca-0f31-4b4b-a7d5-5672d0d329d1;
 Tue, 22 Jun 2021 16:00:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h17so14458770edw.11
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 09:00:34 -0700 (PDT)
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
X-Inumbo-ID: 67e9bdca-0f31-4b4b-a7d5-5672d0d329d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=EP9w62tNmtHNt+8DgW/leZX7ZZ1P63XzCfOLOGIqNlY=;
        b=Yw/FPpD+IFCjfSoDw8jH3eLU1eAgczG/d8yUXfr4QvdFS+Ozh/ZuwYq4Nx/Az3IL9h
         Pvv/tBGYSPoSXWe/gP91dYwu387OjcvR+U3zHqcmawFUz+QFOEHPyHOglbQuQ98f7dV+
         oqYXSjZ3Dj20m5xCsjNnGAgKxa765Fb9c8kRxayhR83GoLo+PkZnsLS4Zh31FFmU/Uak
         brLv0PDvB5YWt5rWGa7r2TfVMXH+SEPboKIZ4ZNNS5ID+f7p6cbgLLvNvqNJFf/dpd5H
         GQuI2YjBd8sWZ7MdLVKnGncuxQfOm0404VgnVxk5LjphNFDSXb2bS6u7dodpnKoL0gqy
         OMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=EP9w62tNmtHNt+8DgW/leZX7ZZ1P63XzCfOLOGIqNlY=;
        b=iQY6CjG6vfjbxYodF1Oo9ZUBEvwgeF3uCc2+snLr7c3tuIwfpd4NP+yr2Puq+TobKy
         RJcq72dIXAaiuCX9SGTRl1b3aMn6m2XAHeyxMFOKDJ6GrYJO7ZJaQL1YIRG/7ykMmBxp
         My6yiFo66mpQF9AnEwknXWxzL11JWyLZdGDb8YCUKHGVToVi71VGeyd7tYDNhEvwu7dG
         2yuxaNhzGrsDrATHAq48Txng4zPf8+kfuluyoKCwPoJ3JR9LSc36LAK3srtONdZ4DwUm
         t53mwt6KGYKMWHlDMpfndLP0Pt/seX3PI+ok3+rAmFevOXyWGaPubaYedDVx0h7eEURn
         1Khw==
X-Gm-Message-State: AOAM533MWaMTiPYMeqfgTokHaaZQcgHwAlSVLiYR0CygmfZEeu927LfR
	kcG/9LyJtM8mYTVglMcvB9hsJaXk5ptzUF/14ZumbYiyfAulbg==
X-Google-Smtp-Source: ABdhPJw+ihHJpO7jlFMgvZVJ3fjjT8YCfR0RIE146Ha1JVHNa0blKAdVVNV4fiYqHugywvLOFWXJ7C5jxff92QH75iw=
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr5970828edz.44.1624377633510;
 Tue, 22 Jun 2021 09:00:33 -0700 (PDT)
MIME-Version: 1.0
From: Neil Sikka <neilsikka@gmail.com>
Date: Tue, 22 Jun 2021 12:00:22 -0400
Message-ID: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
Subject: Windows 10 Kernel Debugging on Xen
To: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000d3973905c55ce399"

--000000000000d3973905c55ce399
Content-Type: text/plain; charset="UTF-8"

Hello,
Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger
attached when running the Windows10 debugger VM and the Windows10 debugee
VM on Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization
failed" error. I tried the suggestions in the discussion here (
https://bugzilla.redhat.com/show_bug.cgi?id=1947015):
-cpu
Skylake-Server-IBRS,ss=on,vmx=on,hypervisor=on,tsc-adjust=on,clflushopt=on,umip=on,pku=on,md-clear=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,ibpb=on,amd-ssbd=on,
\
skip-l1dfl-vmentry=on,mpx=off,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=0x1fff,hv-vendor-id=KVMKVMKVM

note: i had to remove the following 2 arguments due to errors from QEMU:
pschange-mc-no=on
hv_vpindex

Here was the error:
C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe

Network debugging is supported on the following NICs:
busparams=0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in.
The Microsoft hypervisor running this VM does not support KDNET.
Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or later.

KDNET initialization failed.  Status = 0xC0000182.
NIC hardware initialization failed.

I am using an Intel e1000 NIC emulated through QEMU because its supposedly
a supported NIC for Windows kernel NET debugging.

Thanks in Advance!

-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--000000000000d3973905c55ce399
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div>Has anyone gotten a Windows10 (Version 1709 of =
later) kernel debugger attached when running the Windows10 debugger VM and =
the Windows10 debugee VM on Xen 4.13.0 hypervisor? I am getting a &quot;NIC=
 hardware initialization failed&quot; error. I tried the suggestions in the=
 discussion=C2=A0here (<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1947015">https://bugzilla.redhat.com/show_bug.cgi?id=3D1947015</a>):<b=
r>-cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjust=3Don=
,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,arch-capabilit=
ies=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \<br>skip-l1dfl-vme=
ntry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=3D0x1fff,hv-ve=
ndor-id=3DKVMKVMKVM<br><br>note: i had to remove the following 2 arguments =
due to errors from QEMU:<br>pschange-mc-no=3Don<br>hv_vpindex<br><br>Here w=
as the error:<br>C:\Users\user\Desktop\oldDebuggers\x64&gt;kdnet.exe<br><br=
>Network debugging is supported on the following NICs:<br>busparams=3D0.4.0=
, Intel(R) PRO/1000 MT Network Connection, Plugged in.<br>The Microsoft hyp=
ervisor running this VM does not support KDNET.<br>Please upgrade to the hy=
pervisor shipped in Windows 8 or WS2012 or later.<br><br>KDNET initializati=
on failed.=C2=A0 Status =3D 0xC0000182.<br>NIC hardware initialization fail=
ed.<br><br>I am using an Intel e1000 NIC emulated through QEMU because its =
supposedly a supported NIC for Windows kernel NET debugging.<br><br>Thanks =
in Advance!<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div>My Blog: <a hr=
ef=3D"http://www.neilscomputerblog.blogspot.com/" target=3D"_blank">http://=
www.neilscomputerblog.blogspot.com/</a></div><div>Twitter: @neilsikka</div>=
</div></div></div>

--000000000000d3973905c55ce399--

