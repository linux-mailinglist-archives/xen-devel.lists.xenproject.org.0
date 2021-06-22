Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14433B09FB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:10:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145954.268475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviyd-00027D-3e; Tue, 22 Jun 2021 16:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145954.268475; Tue, 22 Jun 2021 16:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lviyd-00024T-0b; Tue, 22 Jun 2021 16:10:15 +0000
Received: by outflank-mailman (input) for mailman id 145954;
 Tue, 22 Jun 2021 16:10:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p8IA=LQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lviyc-00024N-0R
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:10:14 +0000
Received: from mail-wr1-x42e.google.com (unknown [2a00:1450:4864:20::42e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0812c552-472b-4020-85a0-27002685bddf;
 Tue, 22 Jun 2021 16:10:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id e22so20776265wrc.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 09:10:12 -0700 (PDT)
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
X-Inumbo-ID: 0812c552-472b-4020-85a0-27002685bddf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GhwNfhMVdQu8uAR13vpdnf7+TZvoJmIXHX9FI/JeEXE=;
        b=Vq5qatDmRcNaTLrAYjTpFZi0LOqn7RfpcNlh9F8xquRlKssG85rRksHbvnCMf+6A4l
         DeGIIdH5/3D3xh241pmm3kVXjHESKVfAwfIw+lQcym/rfb3TPHl4rf77Lhiy6gWLweVA
         EpOF66cvU3PVVaIzW6IkZ7jWZQ/Go8pmBk6LH9plp6h48LRAW3wmZASXhpUfaSIZj0py
         a3uPrxNb62wGw+HGKamCnRAf6mh7ErTgYeRH+VMPLg1JmX1NVjYBUYJBWRXd+9Dt5kYj
         tQ/qa0rJHF9Rg09Ix+tkYeohmDF+BZDHVJcTJ2O0lc6h2LXHLXqQVR3VrnLSh1o1VgF4
         iP9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GhwNfhMVdQu8uAR13vpdnf7+TZvoJmIXHX9FI/JeEXE=;
        b=OsSq1fPTHEzS5p7/eICVyz8U0rOlkQGLwDcCsneK0H8qs5G/P13JWgTtso2ODLkygC
         s6n607NFAaEKREqOfGzIrs1LIfPgpr0B5N1tqexsDF8tGgC8pj8GAFVpvoo+AVM9mXtf
         kXdAsopkZNi5ziadkf1Glf95zZTo/SIcC0oWvSy0FSNtYb+GKQxiCsVcp/ekR6rGNmIt
         F/QInVg+1v2dpCnYaeqj/IXwFq72X85ol1KHzudq45sXZhjVJuBvpWuSHo7lRDeLDxD4
         xEcjTg/wB8MNU+h517hTxB04tqczqHiRaattBjpI6RReV4gLMMELjU6Lh36/UldIWHlQ
         4dtg==
X-Gm-Message-State: AOAM533ItBoNFCmXUpLGwk7YOaMZEuxIKCyUyAwQnLBkncB8jvePbnWB
	OGKgvqub7F0s8mWsUaBQQ5QimUSDNwNxjcqbz04=
X-Google-Smtp-Source: ABdhPJwavLsZhKp1hvvIlXsomWdAciI4Xe4MueQSrZTmwa6v+QEOEP2fzY3NsRS1l7ShNrnSnWD4NLE2f+MB5GC8pO0=
X-Received: by 2002:adf:fb92:: with SMTP id a18mr5678539wrr.182.1624378212075;
 Tue, 22 Jun 2021 09:10:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
In-Reply-To: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 22 Jun 2021 12:09:36 -0400
Message-ID: <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Neil Sikka <neilsikka@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have managed to get windbg working with a serial bridge between two
Win10 VMs using the following script:
https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/=
serial-bridge.sh.
The debugee has to enable a couple options so that windbg can attach:
https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/=
debug.cmd.

Tamas

On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com> wrote:
>
> Hello,
> Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger att=
ached when running the Windows10 debugger VM and the Windows10 debugee VM o=
n Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization failed=
" error. I tried the suggestions in the discussion here (https://bugzilla.r=
edhat.com/show_bug.cgi?id=3D1947015):
> -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjust=3Don=
,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,arch-capabilit=
ies=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \
> skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-spinlock=
s=3D0x1fff,hv-vendor-id=3DKVMKVMKVM
>
> note: i had to remove the following 2 arguments due to errors from QEMU:
> pschange-mc-no=3Don
> hv_vpindex
>
> Here was the error:
> C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
>
> Network debugging is supported on the following NICs:
> busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in.
> The Microsoft hypervisor running this VM does not support KDNET.
> Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or later.
>
> KDNET initialization failed.  Status =3D 0xC0000182.
> NIC hardware initialization failed.
>
> I am using an Intel e1000 NIC emulated through QEMU because its supposedl=
y a supported NIC for Windows kernel NET debugging.
>
> Thanks in Advance!
>
> --
> My Blog: http://www.neilscomputerblog.blogspot.com/
> Twitter: @neilsikka

