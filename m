Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8633B0A6C
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 18:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145977.268519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjLE-0006Ib-T1; Tue, 22 Jun 2021 16:33:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145977.268519; Tue, 22 Jun 2021 16:33:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvjLE-0006Gi-Pp; Tue, 22 Jun 2021 16:33:36 +0000
Received: by outflank-mailman (input) for mailman id 145977;
 Tue, 22 Jun 2021 16:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wlN=LQ=gmail.com=neilsikka@srs-us1.protection.inumbo.net>)
 id 1lvjLE-0006Gc-1S
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 16:33:36 +0000
Received: from mail-ed1-x533.google.com (unknown [2a00:1450:4864:20::533])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id def03ceb-54a3-4ed3-8bf3-7ddd2bdc0081;
 Tue, 22 Jun 2021 16:33:35 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s6so24479173edu.10
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jun 2021 09:33:34 -0700 (PDT)
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
X-Inumbo-ID: def03ceb-54a3-4ed3-8bf3-7ddd2bdc0081
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EuglMweKhcssS/9eQCqRk+a+i6CIroCO89mBFrjoy0c=;
        b=Ccz2H5UEbTOmSqA4fi1NzImuW9E++REFeGJiUj8urAcRMnPrGesURZau4g8Ya/DmVQ
         qP9KXy3TxYlFFepf2C8GCd6iBWH6woavULVaXIyZ3MTiogE2/HGZcaK5fDJxbP7Ucf0q
         ChW4Pf+vFbG31W6758yHEabWpUkN4UCGe6ryVRR3Ve2hvcP1bCKggTmAnuX56ia3O5C9
         8y9zpuNzfPL0fvrF8UK/p6+vtIII6TuvsNGqbcgOZUlvnqAxI6OeiLr1m0JwWHFz6tun
         A+TYcyBniAE3jkoqrW4AKHFlH+/1Ywar9LMkiGYwUZ3j68gkgUtjEqlvxK9R0O2v+NN2
         gV5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuglMweKhcssS/9eQCqRk+a+i6CIroCO89mBFrjoy0c=;
        b=Cx6f8TKzusK5q42USjiXW/YG7q2+ZlLYzlNSryS4vRoUuaCC4rKL5ecHG9VfLdWtFp
         i3KTfSRVFRyP9xkOZX+IQntwLhpGKP/XztqOYbGft6cu2ffkujdvPJ6obmDHFErPSZaj
         BFiWxS3qCyOXNesWzwJ+KCEu7tTWO3HP2l3/dLzOrr+WLbKwke9/DWFaYNYFVsf5sWo0
         DAloxHiOgYgooDiab6epkumJ/9oIS0cbB4Q7gG4Hz1nD8lLnCt/vL0aCorGT0z8eB7+w
         /xCt4/reArl0mC0+AxnJ1Pemm7+QdKS0gEhOFsUQfPPAssBx11ESN21tTtBocUTsOJ3U
         p+sQ==
X-Gm-Message-State: AOAM531njtU3C6Ia989fvUkPsgOCgxzWAVRn/lPUG/RSM2sCBjRVDbrr
	InsP7UCiXrqTG4ZEAXyPpodkZO64TpfXHMDgolg=
X-Google-Smtp-Source: ABdhPJyUReF+2Ti3QzyW55fra8U3V5rCRx9Y6H9k9c6cev5IpJgjuy69FPGtc49tqL4MqTohmxbBo5zevTGefhv+KOs=
X-Received: by 2002:a05:6402:848:: with SMTP id b8mr6198351edz.44.1624379614001;
 Tue, 22 Jun 2021 09:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHPMNWcQgUEvd7aYiNx1U+wphmuJr_Q8JXWw3mE812uN5hEARQ@mail.gmail.com>
 <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
In-Reply-To: <CABfawhk4D+30_DX5cwYG-=SthQ=CXLRLL7VeXeVK48Oj0efn2Q@mail.gmail.com>
From: Neil Sikka <neilsikka@gmail.com>
Date: Tue, 22 Jun 2021 12:33:22 -0400
Message-ID: <CAHPMNWd1QFYfbuPdEPZgwKrXE6dhi_X-bqZfPQj4zo4AioL81w@mail.gmail.com>
Subject: Re: Windows 10 Kernel Debugging on Xen
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000df7c3405c55d59a2"

--000000000000df7c3405c55d59a2
Content-Type: text/plain; charset="UTF-8"

Thanks for the quick response, Tamas. I tried what you said and windbg
waits and the debugee hangs when I click the break button in windbg, but I
don't see any output in windbg. This means that there is SOME communication
over the serial port that causes the debugee to hang when I click break.
Could it be a debugger protocol issue? I also tried the guidance here by
running the crlf program:
https://www.qubes-os.org/doc/windows-debugging/
But windbg waits and the debugee hangs in a similar manner.

What versions of WIndows and Xen are you using?

On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel <tamas.k.lengyel@gmail.com>
wrote:

> I have managed to get windbg working with a serial bridge between two
> Win10 VMs using the following script:
>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/serial-bridge.sh
> .
> The debugee has to enable a couple options so that windbg can attach:
>
> https://github.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/debug.cmd
> .
>
> Tamas
>
> On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka <neilsikka@gmail.com> wrote:
> >
> > Hello,
> > Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger
> attached when running the Windows10 debugger VM and the Windows10 debugee
> VM on Xen 4.13.0 hypervisor? I am getting a "NIC hardware initialization
> failed" error. I tried the suggestions in the discussion here (
> https://bugzilla.redhat.com/show_bug.cgi?id=1947015):
> > -cpu
> Skylake-Server-IBRS,ss=on,vmx=on,hypervisor=on,tsc-adjust=on,clflushopt=on,umip=on,pku=on,md-clear=on,stibp=on,arch-capabilities=on,ssbd=on,xsaves=on,ibpb=on,amd-ssbd=on,
> \
> >
> skip-l1dfl-vmentry=on,mpx=off,hv-time,hv-relaxed,hv-vapic,hv-spinlocks=0x1fff,hv-vendor-id=KVMKVMKVM
> >
> > note: i had to remove the following 2 arguments due to errors from QEMU:
> > pschange-mc-no=on
> > hv_vpindex
> >
> > Here was the error:
> > C:\Users\user\Desktop\oldDebuggers\x64>kdnet.exe
> >
> > Network debugging is supported on the following NICs:
> > busparams=0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in.
> > The Microsoft hypervisor running this VM does not support KDNET.
> > Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or later.
> >
> > KDNET initialization failed.  Status = 0xC0000182.
> > NIC hardware initialization failed.
> >
> > I am using an Intel e1000 NIC emulated through QEMU because its
> supposedly a supported NIC for Windows kernel NET debugging.
> >
> > Thanks in Advance!
> >
> > --
> > My Blog: http://www.neilscomputerblog.blogspot.com/
> > Twitter: @neilsikka
>


-- 
My Blog: http://www.neilscomputerblog.blogspot.com/
Twitter: @neilsikka

--000000000000df7c3405c55d59a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the quick response, Tamas. I tried what you sai=
d and windbg waits and the debugee hangs when I click the break button in w=
indbg, but I don&#39;t see any output in windbg. This means that there is S=
OME communication over the serial port that causes the debugee to hang when=
 I click break. Could it be a debugger protocol issue? I also tried the gui=
dance here by running the crlf program:<div><a href=3D"https://www.qubes-os=
.org/doc/windows-debugging/">https://www.qubes-os.org/doc/windows-debugging=
/</a><br></div><div>But windbg waits and the debugee hangs in a similar man=
ner.</div><div><br></div><div>What versions of WIndows and Xen are you usin=
g?</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Tue, Jun 22, 2021 at 12:10 PM Tamas K Lengyel &lt;<a href=3D"mai=
lto:tamas.k.lengyel@gmail.com">tamas.k.lengyel@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">I have managed to g=
et windbg working with a serial bridge between two<br>
Win10 VMs using the following script:<br>
<a href=3D"https://github.com/intel/kernel-fuzzer-for-xen-project/blob/mast=
er/scripts/serial-bridge.sh" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/serial-br=
idge.sh</a>.<br>
The debugee has to enable a couple options so that windbg can attach:<br>
<a href=3D"https://github.com/intel/kernel-fuzzer-for-xen-project/blob/mast=
er/scripts/debug.cmd" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/intel/kernel-fuzzer-for-xen-project/blob/master/scripts/debug.cmd</a>.<b=
r>
<br>
Tamas<br>
<br>
On Tue, Jun 22, 2021 at 12:01 PM Neil Sikka &lt;<a href=3D"mailto:neilsikka=
@gmail.com" target=3D"_blank">neilsikka@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hello,<br>
&gt; Has anyone gotten a Windows10 (Version 1709 of later) kernel debugger =
attached when running the Windows10 debugger VM and the Windows10 debugee V=
M on Xen 4.13.0 hypervisor? I am getting a &quot;NIC hardware initializatio=
n failed&quot; error. I tried the suggestions in the discussion here (<a hr=
ef=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1947015" rel=3D"norefer=
rer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D194701=
5</a>):<br>
&gt; -cpu Skylake-Server-IBRS,ss=3Don,vmx=3Don,hypervisor=3Don,tsc-adjust=
=3Don,clflushopt=3Don,umip=3Don,pku=3Don,md-clear=3Don,stibp=3Don,arch-capa=
bilities=3Don,ssbd=3Don,xsaves=3Don,ibpb=3Don,amd-ssbd=3Don, \<br>
&gt; skip-l1dfl-vmentry=3Don,mpx=3Doff,hv-time,hv-relaxed,hv-vapic,hv-spinl=
ocks=3D0x1fff,hv-vendor-id=3DKVMKVMKVM<br>
&gt;<br>
&gt; note: i had to remove the following 2 arguments due to errors from QEM=
U:<br>
&gt; pschange-mc-no=3Don<br>
&gt; hv_vpindex<br>
&gt;<br>
&gt; Here was the error:<br>
&gt; C:\Users\user\Desktop\oldDebuggers\x64&gt;kdnet.exe<br>
&gt;<br>
&gt; Network debugging is supported on the following NICs:<br>
&gt; busparams=3D0.4.0, Intel(R) PRO/1000 MT Network Connection, Plugged in=
.<br>
&gt; The Microsoft hypervisor running this VM does not support KDNET.<br>
&gt; Please upgrade to the hypervisor shipped in Windows 8 or WS2012 or lat=
er.<br>
&gt;<br>
&gt; KDNET initialization failed.=C2=A0 Status =3D 0xC0000182.<br>
&gt; NIC hardware initialization failed.<br>
&gt;<br>
&gt; I am using an Intel e1000 NIC emulated through QEMU because its suppos=
edly a supported NIC for Windows kernel NET debugging.<br>
&gt;<br>
&gt; Thanks in Advance!<br>
&gt;<br>
&gt; --<br>
&gt; My Blog: <a href=3D"http://www.neilscomputerblog.blogspot.com/" rel=3D=
"noreferrer" target=3D"_blank">http://www.neilscomputerblog.blogspot.com/</=
a><br>
&gt; Twitter: @neilsikka<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div>My Blog: <a href=3D"http://www.neilscompute=
rblog.blogspot.com/" target=3D"_blank">http://www.neilscomputerblog.blogspo=
t.com/</a></div><div>Twitter: @neilsikka</div></div>

--000000000000df7c3405c55d59a2--

