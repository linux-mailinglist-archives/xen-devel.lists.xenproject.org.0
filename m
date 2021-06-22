Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E91633B0CA2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 20:12:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146017.268596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvksw-0001dk-Pi; Tue, 22 Jun 2021 18:12:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146017.268596; Tue, 22 Jun 2021 18:12:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvksw-0001bE-MB; Tue, 22 Jun 2021 18:12:30 +0000
Received: by outflank-mailman (input) for mailman id 146017;
 Tue, 22 Jun 2021 18:12:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p8IA=LQ=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1lvksv-0001b8-8F
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 18:12:29 +0000
Received: from mail-wr1-x42d.google.com (unknown [2a00:1450:4864:20::42d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0db5ea3e-d579-44e5-b77e-958270f9ae8e;
 Tue, 22 Jun 2021 18:12:28 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id a13so2939013wrf.10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 11:12:28 -0700 (PDT)
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
X-Inumbo-ID: 0db5ea3e-d579-44e5-b77e-958270f9ae8e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=4PZYCRkIJVGeuNR28a/CBUMBUxrv4oHeXg5/uSnpCrg=;
        b=D2+8c9jcXg/0XCwyJBexw4loidOxz4r6AJA+WK5VIUeV1eSyr8eywAz/r+uXx0zlGT
         tr5BdU1NZIo7zrZAWmveJxwmIrOKrS4J9Latoso+zbVCCo5j9bkIgg9SlxA+c5soWzAv
         arYH7dLkOkROTMRcUGQHffbp+3K1a9y3c+0Tk89hDHfQ0Y0+6RMMmCfufiHC9rG+AzkI
         AQUPnE9bRagXby88CLgfEqBh6Tyl2sbwUCpcmRmkwR1TigQVko6tSoEpGZ5L6D+Bna1R
         6uIwVFmGbzYNV492d6CtGJdnLYroawUwdO1b0sCfFYdHUCMSzD0UaqFSpaNXtxc5ifWe
         0EXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=4PZYCRkIJVGeuNR28a/CBUMBUxrv4oHeXg5/uSnpCrg=;
        b=p3B/YnKMBQyzeEL+j1a+v74F2VYBZqVcdGl0YonnTMWiaanMPX4odavdO8gepJcg+y
         ED11ODPFyVNubW+tOTOTHyPc9FPxtjHJkIERIzJclebJ96DsLo1nHnYzxcApZkuX/0ty
         k/pgiiqlKCU2TMGmF+MGvoxzLazACrnIqbGLegf8AeM2+bCss4YAWCFoT07RezUvyu3y
         9ef4zoNTMgy54ZC/SrDvAL/GCQPaOfgm5DSXby7sxS2rdZjxVTYegFDykCpyf5tUrltY
         uryWd1MpiNDL9WNAxw+Q5czP29lZekQo5DfqBL2yhlCk9nhhMXojTdbXY/lnZ21VtJiH
         AiLA==
X-Gm-Message-State: AOAM531ccLNx3CeSGL6wwJndSOnVtcLn3tKeEAe/wVnlM2aOtoz3+rtN
	9VSaHHWv4rsPLdemO5WXSp2eqZeAzqhWtBQdtfE=
X-Google-Smtp-Source: ABdhPJxwaFkVpPfM+J+Qo41arge1t+mWtoN98JdQq/JPxFHbIDTUshywGFxyxpA+Ca0yygYbCTiGih8PoRyKh4YpAo0=
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr3539992wrt.259.1624385547416;
 Tue, 22 Jun 2021 11:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
 <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
 <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com>
 <CABfawh=W92ioejsZ-zu+WVofw_jfxVLteVieC2Ysfxd3Wrs+Og@mail.gmail.com> <CAHPMNWcfz+9zUv7gfwu5V6zPVBHiFc-EZDJ70-4DWHjOtyBOHg@mail.gmail.com>
In-Reply-To: <CAHPMNWcfz+9zUv7gfwu5V6zPVBHiFc-EZDJ70-4DWHjOtyBOHg@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Tue, 22 Jun 2021 14:11:51 -0400
Message-ID: <CABfawhkMb8Pnr6+NxsoaXKCyaBH8Tax8_1ABHjyGGp5j9hOkVA@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Neil Sikka <neilsikka@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Make sure windbg is already waiting for the connection from the
debugee by the time Windows starts booting. If you try to attach
windbg later it won't work. It worked for me but obviously YMMV.

Tamas

On Tue, Jun 22, 2021 at 2:07 PM Neil Sikka <neilsikka@gmail.com> wrote:
>
> I tried that, but it seems like I'm getting an interrupt storm on the deb=
ugger VM (CPU spends all its time in the kernel) when I try to attach the d=
ebugger. This observation furthers my suspicion that there is communication=
, but there is something wrong with the protocol...
>
> On Tue, Jun 22, 2021 at 12:43 PM Tamas K Lengyel <tamas.k.lengyel@gmail.c=
om> wrote:
>>
>> I used Xen 4.15 and a pretty new version of Windows 10. It is a bit
>> finicky, you have to run the debug commands on the debugee and then
>> reboot. When the VM is rebooting the domain ID changes so you have to
>> start the serial bridge then. Windbg will attach afterwards. Just make
>> sure both VMs have serial=3D'pty' set in their config file.
>>
>> Tamas
>>
>> On Tue, Jun 22, 2021 at 12:33 PM Neil Sikka <neilsikka@gmail.com> wrote:
>> >
>> > Thanks for the quick response, Tamas. I tried what you said and windbg=
 waits and the debugee hangs when I click the break button in windbg, but I=
 don't see any output in windbg. This means that there is SOME communicatio=
n over the serial port that causes the debugee to hang when I click break. =
Could it be a debugger protocol issue? I also tried the guidance here by ru=
nning the crlf program:
>> > https://www.qubes-os.org/doc/windows-debugging/
>> > But windbg waits and the debugee hangs in a similar manner.
>> >
>> > What versions of WIndows and Xen are you using?
>> >
>> > On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel <tamas.k.lengyel@gmai=
l.com> wrote:
>> >>
>> >> I have managed to get windbg working with a serial bridge between two
>> >> Win10 VMs using the following script:
>> >> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/sc=
ripts/serial-bridge.sh.
>> >> The debugee has to enable a couple options so that windbg can attach:
>> >> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/sc=
ripts/debug.cmd.
>> >>
>> >> Tamas
>> >>
>> >> On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com> wro=
te:
>> >> >
>> >> > Hello,
>> >> > Has anyone gotten a Windows10 (Version 1709 of later) kernel debugg=
er attached when running the Windows10 debugger VM and the Windows10 debuge=
e VM on Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization =
failed" error. I tried the suggestions in the discussion here (https://bugz=
illa.redhat.com/show_bug.cgi?id=3D1947015):
>> >> > -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjus=
t=3Don,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,arch-cap=
abilities=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \
>> >> > skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-sp=
inlocks=3D0x1fff,hv-vendor-id=3DKVMKVMKVM
>> >> >
>> >> > note: i had to remove the following 2 arguments due to errors from =
QEMU:
>> >> > pschange-mc-no=3Don
>> >> > hv_vpindex
>> >> >
>> >> > Here was the error:
>> >> > C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
>> >> >
>> >> > Network debugging is supported on the following NICs:
>> >> > busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged=
 in.
>> >> > The Microsoft hypervisor running this VM does not support KDNET.
>> >> > Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or =
later.
>> >> >
>> >> > KDNET initialization failed.  Status =3D 0xC0000182.
>> >> > NIC hardware initialization failed.
>> >> >
>> >> > I am using an Intel e1000 NIC emulated through QEMU because its sup=
posedly a supported NIC for Windows kernel NET debugging.
>> >> >
>> >> > Thanks in Advance!
>> >> >
>> >> > --
>> >> > My Blog: http://www.neilscomputerblog.blogspot.com/
>> >> > Twitter: @neilsikka
>> >
>> >
>> >
>> > --
>> > My Blog: http://www.neilscomputerblog.blogspot.com/
>> > Twitter: @neilsikka
>
>
>
> --
> My Blog: http://www.neilscomputerblog.blogspot.com/
> Twitter: @neilsikka

