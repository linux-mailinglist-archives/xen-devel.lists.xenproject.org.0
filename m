Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FB63D599D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jul 2021 14:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160926.295484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7zmo-00033k-C1; Mon, 26 Jul 2021 12:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160926.295484; Mon, 26 Jul 2021 12:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7zmo-00031r-8I; Mon, 26 Jul 2021 12:32:46 +0000
Received: by outflank-mailman (input) for mailman id 160926;
 Mon, 26 Jul 2021 12:32:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c1XZ=MS=gmail.com=rob.townley@srs-us1.protection.inumbo.net>)
 id 1m7zmn-00031l-3B
 for xen-devel@lists.xenproject.org; Mon, 26 Jul 2021 12:32:45 +0000
Received: from mail-ua1-x934.google.com (unknown [2607:f8b0:4864:20::934])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44c457ff-ba19-4e53-973e-c0e242577d47;
 Mon, 26 Jul 2021 12:32:41 +0000 (UTC)
Received: by mail-ua1-x934.google.com with SMTP id w11so3464579uar.4
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jul 2021 05:32:41 -0700 (PDT)
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
X-Inumbo-ID: 44c457ff-ba19-4e53-973e-c0e242577d47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=1xdW/DMpA8cOYNesvQjkeu91ogoViPeft0cA7f+6ji0=;
        b=J7UeZpT6SyB/ArzDIdHNydAClAOVDtkw4c/Ha6Wr442331zlo+Jp2u0Hrgd1chZIPs
         RYwDWmK09/51qB/LsXsIhRG8E0i77rF0REvwweTmBSxhWTloRSKSv0a8tmQe2Kz3Xuss
         TOIuhzj5mTqVi3lRiT2mHQ+fOYHpf5F3DK/EhD5pERpw+28gP4ilLsp6YXpWwORXuZ2t
         ap0tk83HP/qCEbxysQ019RQEx3nBXCoCO+p+kZ8NWO/8yPTU1A6a/ZcihhQLOp1fqAM6
         crSncZAqMD2Una0eDLcsGIxSpR5MvTedIF8khoBtgGTUVvLd0HMCT2LmL6GMbWmSIINP
         HwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=1xdW/DMpA8cOYNesvQjkeu91ogoViPeft0cA7f+6ji0=;
        b=ONTpBeT41Vgj3wtpeojoU1l2qFk19x9t+OqWIM7ZOqqqPAqWhFd3ExVA8F/vI7xTyr
         xBiWZp2NjCEQow24ugWT+3GIh8mM9QCJV4ijuNZ44RZZadcm5dLEAhU67qHhx7g+67WY
         bxkaWMaYn0vByprxAJ9HNhtMePEePjMbwyNLq1Dqjqwoh4qF16KlSI1zMzBaKdS0XMGn
         lGghRL8lmrEvNKN1XpX6pNDoV/vS6KaWrUYtug9rL7W1dcKsVZH14lEUChXzXg75gNZQ
         eJLgdgW+IgeTvHdsYyoucHxpT/+zJOBTyLGVzqIy+DAD/EeaESbjIZ9owdkcpDjV6jwg
         fxDA==
X-Gm-Message-State: AOAM531tPJgI2lZFKwYLD9XuAZVoU9zp0y5eE08vJ653rxBywPAfsCPc
	BP6ttBF/6WTsyVn28/hwSpSFTeYT8uMaYrPJSUs=
X-Google-Smtp-Source: ABdhPJxFncG2PwfqosQw4+3hY0dYYKZ7TB63SWPjps3WyfPFAFnTjKm7SYXAfkf5pSnwyQRpvqulPsFf8HN3yfSZEcA=
X-Received: by 2002:ab0:20b0:: with SMTP id y16mr1457816ual.68.1627302761377;
 Mon, 26 Jul 2021 05:32:41 -0700 (PDT)
MIME-Version: 1.0
References: <001401d77de6$34ff5de0$9efe19a0$@comcast.net> <CA+VdTb-_L-7Zz31DoXiQjTycV8w7rjg0Df76MboDCqKC77ZGzg@mail.gmail.com>
 <007a01d780ff$5caff450$160fdcf0$@comcast.net>
In-Reply-To: <007a01d780ff$5caff450$160fdcf0$@comcast.net>
Reply-To: Rob.Townley@gmail.com
From: Rob Townley <rob.townley@gmail.com>
Date: Mon, 26 Jul 2021 07:32:30 -0500
Message-ID: <CA+VdTb8xmKEe6QrZBwCH_4HrRY1EVTEX08H77A4oO_O+Wqrhdw@mail.gmail.com>
Subject: Re: Nested Virtualization of Hyper-V on Xen Not Working
To: Xentrigued <xentrigued@comcast.net>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000008b43105c805f37b"

--00000000000008b43105c805f37b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, definitely TooMuchInformation.

  I hope that single hardware test kit VHD download imports into xen, runs,
and gives us a starting point and clear work items.

On Sat, Jul 24, 2021 at 9:47 PM Xentrigued <xentrigued@comcast.net> wrote:

> First and foremost, many thanks for your thoughtful and thorough response
> and also for providing a multitude of genuinely helpful information!
>
>
>
> Secondly:  Wow, that=E2=80=99s quite a homework assignment!!
>
>
>
> I will absolutely begin to work my way through the resources you cited an=
d
> will report back once some of those tests have been completed.  You=E2=80=
=99ve
> given me an excellent starting point for further inquiry.
>
>
>
> To be very honest, I wasn=E2=80=99t sure where to turn next in the event =
that no
> member of this august body had anything to say about this.  (It=E2=80=99s=
 kind of
> intimidating and not unlike going before the Wizard of Oz.)
>
>
>
> So again, thank you so much for all of the good information and also for
> your kindness in reaching out.
>
>
>
> *From:* Rob Townley <rob.townley@gmail.com>
> *Sent:* Saturday, July 24, 2021 9:33 PM
> *To:* Xentrigued <xentrigued@comcast.net>
> *Cc:* xen-devel@lists.xenproject.org
> *Subject:* Re: Nested Virtualization of Hyper-V on Xen Not Working
>
>
>
> I encourage you to run the Windows Hardware Lab Kit 11/02/2018
> <https://docs.microsoft.com/en-us/windows-hardware/test/hlk/> or HLK or
> maybe try the VHLK.  The VHLK
> <https://docs.microsoft.com/en-us/windows-hardware/test/hlk/getstarted/ge=
tstarted-vhlk>is
> a free VHD file download of win2016 that has all the tests necessary
> built-in.  So you could manually download the test kit on your existing
> Windows VM or attempt the VHD.   "*Default login credentials are
> HLKAdminUser with password Testpassword,1"   *
>
>
>
> Please post the results.   Citrix 8.1 and 8.2 are listed as validated
> <https://www.windowsservercatalog.com/results.aspx?&bCatID=3D1521&cpID=3D=
2185&avc=3D0&ava=3D0&avt=3D0&avq=3D0&OR=3D1&PGS=3D25>
> and so would be very interesting to see any differences in test results
> running XCP-ng 8.2 and Citrix 8.2.
>
>
>
> Why run the hardware lab kit in a virtualized environment and directly on
> the underlying hardware?  Because those tests are used to validate for th=
e
> SVVP <https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.htm>=
.
> Microsoft has something similar to their Hardware Compatibility List, aka
> HCL.   SVVP
> <https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.htm> is
> Microsoft's Server Virtualization Validation Program.   SVVP validates th=
at
> Windows Operating Systems and APPS run on top of other hypervisors and on=
ce
> validated will receive technical support.  SVVP has been around for over =
a
> decade but has of course changed over the years.   Recently,  it has been
> making news because Win11 / Win2022 requires a TPM 2.0 chip, but XCP-NG
> XEN does not yet support that <https://github.com/xcp-ng/xcp/issues/471>.
>    If the hypervisor is SVVP certified, then running MS Hyper-V Windows o=
n
> top of any validated hypervisor would be much more likely to work and
> possibly supported directly by MS and tsanet.org.  Canonical and RedHat
> are in tsanet, but would like to see the Linux Foundation or Vates itself=
.
>
>
>
> Microsoft server software and supported virtualization
> environments 09/08/2020 6 minutes to read
> <https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/microsoft-server-software-support-policy>
> Support partners for non-Microsoft hardware virtualization software
> <https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/non-microsoft-hardware-virtualization-software>
>
> WindowsServerCatalog.com and then click on SVVP in the upper right and
> then Products
> <https://www.windowsservercatalog.com/results.aspx?&bCatID=3D1521&cpID=3D=
0&avc=3D0&ava=3D0&avq=3D0&OR=3D1&PGS=3D25>
>
>
>
> <https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/non-microsoft-hardware-virtualization-software>
>
> Design Session - Alternative vTPM 2.0 Backend to Comply with Upcoming SVV=
P
> Changes <https://www.youtube.com/watch?v=3DabkRRcoYWCQ>
>
> https://www.youtube.com/watch?v=3DabkRRcoYWCQ
>
>
>
> Enabling UEFI Secure Boot on Xen - Robert Eshleman, Vates SAS
> <https://www.youtube.com/watch?v=3DA_IhKjK7EgA>
>
> https://www.youtube.com/watch?v=3DA_IhKjK7EgA&t=3D388s
> Support vTPM for guests #471 https://github.com/xcp-ng/xcp/issues/471
> <https://github.com/xcp-ng/xcp/issues/471>
>
> https://github.com/xcp-ng/xcp/issues/471
>
> https://docs.microsoft.com/en-us/windows-hardware/test/hlk/
>
>
>
> On Tue, Jul 20, 2021 at 11:12 PM Xentrigued <xentrigued@comcast.net>
> wrote:
>
> RATIONALE: Features in recent versions of Windows now REQUIRE Hyper-V
> support to work.  In particular, Windows Containers, Sandbox, Docker
> Desktop
> and the Windows Subsystem for Linux version 2 (WSL2).  Running Windows in=
 a
> VM as a development and test platform is currently a common requirement f=
or
> various user segments and will likely become necessary for production in
> the
> future.  Nested virtualization of Hyper-V currently works on VMware ESXi,
> Microsoft Hyper-V and KVM-based hypervisors.  This puts Xen and its
> derivatives at a disadvantage when choosing a hypervisor.
>
> WHAT IS NOT WORKING?  Provided the requirements set forth in:
> https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen have been
> met,
> an hvm guest running Windows 10 PRO Version 21H1 x64 shows that all four
> requirements for running Hyper-V are available using the msinfo32.exe or
> systeminfo.exe commands.  More granular knowledge of the CPU capabilities
> exposed to the guest can be observed using the Sysinternals Coreinfo64.ex=
e
> command.  CPUID flags present appear to mirror those on other working
> nested
> hypervisor configurations.
>
> Enabling Windows Features for Hyper-V, Virtual Machine Platform, etc. all
> appear to work without error.  However, after the finishing reboot, Hyper=
-V
> is simply not active.  This--despite the fact that vmcompute.exe (Hyper-V
> host compute service) is running and there are no errors in the logs.  In
> addition, all four Hyper-V prerequisites continue to show as available.
>
> By contrast, after the finishing reboot of an analogous Windows VM runnin=
g
> on ESXi, the four prerequisites are reversed:  hypervisor is now active;
> vmx, ept and urg (unrestricted guest) are all off as viewed with the
> Coreinfo64.exe -v command.  Furthermore, all functions requiring Hyper-V
> are
> now active and working as expected.
>
> This deficiency has been observed in two test setups running Xen 4.15 fro=
m
> source and XCP-ng 8.2, both running on Intel with all of the latest,
> generally available patches.  We presume that the same behavior is presen=
t
> on Citrix Hypervisor 8.2 as well.
>
> SUMMATION:
> Clearly, much effort has already been expended to support the Viridian
> enlightenments that optimize running Windows on Xen.  It also looks like =
a
> significant amount of effort has been put forth to advance nested
> virtualization in general.
>
> Therefore, if it would be helpful, I am willing to perform testing and
> provide feedback and logs as appropriate in order to help get this workin=
g.
>
> While my day job is managing a heterogeneous collection of systems runnin=
g
> on various hypervisors, I have learned the rudiments of integrating patch=
es
> and rebuilding Xen from source so could no doubt be useful in assisting y=
ou
> with this worthwhile endeavor.
>
>
>

--00000000000008b43105c805f37b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Yes, definitely TooMuchInformation.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">=C2=A0=C2=A0I hope that single hardware test =
kit VHD download imports into xen, runs, and gives us a starting point and =
clear work items. =C2=A0</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Jul 24, 2021 at 9:47 PM Xentrigued &l=
t;<a href=3D"mailto:xentrigued@comcast.net">xentrigued@comcast.net</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div lang=3D"EN-US" link=3D"=
blue" vlink=3D"purple" style=3D"word-wrap:break-word"><div class=3D"m_49114=
42955352881957WordSection1"><p class=3D"MsoNormal"><span style=3D"font-size=
:12.0pt;font-family:&quot;Courier New&quot;">First and foremost, many thank=
s for your thoughtful and thorough response and also for providing a multit=
ude of genuinely helpful information!<u></u><u></u></span></p><p class=3D"M=
soNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Courier New&quo=
t;"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNormal"><span style=3D"fo=
nt-size:12.0pt;font-family:&quot;Courier New&quot;">Secondly:=C2=A0 Wow, th=
at=E2=80=99s quite a homework assignment!!<u></u><u></u></span></p><p class=
=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Courier Ne=
w&quot;"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNormal"><span style=
=3D"font-size:12.0pt;font-family:&quot;Courier New&quot;">I will absolutely=
 begin to work my way through the resources you cited and will report back =
once some of those tests have been completed.=C2=A0 You=E2=80=99ve given me=
 an excellent starting point for further inquiry.<u></u><u></u></span></p><=
p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Cou=
rier New&quot;"><u></u>=C2=A0<u></u></span></p><p class=3D"MsoNormal"><span=
 style=3D"font-size:12.0pt;font-family:&quot;Courier New&quot;">To be very =
honest, I wasn=E2=80=99t sure where to turn next in the event that no membe=
r of this august body had anything to say about this.=C2=A0 (It=E2=80=99s k=
ind of intimidating and not unlike going before the Wizard of Oz.)<u></u><u=
></u></span></p><p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font=
-family:&quot;Courier New&quot;"><u></u>=C2=A0<u></u></span></p><p class=3D=
"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Courier New&q=
uot;">So again, thank you so much for all of the good information and also =
for your kindness in reaching out.<u></u><u></u></span></p></div></div><div=
 lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:break-wor=
d"><div class=3D"m_4911442955352881957WordSection1"><p class=3D"MsoNormal">=
<span style=3D"font-size:12.0pt;font-family:&quot;Courier New&quot;"><u></u=
>=C2=A0<u></u></span></p><div style=3D"border:none;border-top:solid #e1e1e1=
 1.0pt;padding:3.0pt 0in 0in 0in"><p class=3D"MsoNormal"><b>From:</b> Rob T=
ownley &lt;<a href=3D"mailto:rob.townley@gmail.com" target=3D"_blank">rob.t=
ownley@gmail.com</a>&gt; <br><b>Sent:</b> Saturday, July 24, 2021 9:33 PM<b=
r><b>To:</b> Xentrigued &lt;<a href=3D"mailto:xentrigued@comcast.net" targe=
t=3D"_blank">xentrigued@comcast.net</a>&gt;<br><b>Cc:</b> <a href=3D"mailto=
:xen-devel@lists.xenproject.org" target=3D"_blank">xen-devel@lists.xenproje=
ct.org</a><br><b>Subject:</b> Re: Nested Virtualization of Hyper-V on Xen N=
ot Working<u></u><u></u></p></div><p class=3D"MsoNormal"><u></u>=C2=A0<u></=
u></p><div><div><p class=3D"MsoNormal"><span style=3D"font-family:&quot;Tim=
es New Roman&quot;,serif">I encourage you to run the=C2=A0<a href=3D"https:=
//docs.microsoft.com/en-us/windows-hardware/test/hlk/" target=3D"_blank">Wi=
ndows Hardware Lab Kit 11/02/2018</a> or HLK or maybe try the VHLK.=C2=A0 T=
he <a href=3D"https://docs.microsoft.com/en-us/windows-hardware/test/hlk/ge=
tstarted/getstarted-vhlk" target=3D"_blank">VHLK </a>is a free VHD file dow=
nload of win2016 that has all the tests necessary built-in.=C2=A0 So you co=
uld manually download the test kit on your existing Windows VM or attempt t=
he VHD.=C2=A0=C2=A0 &quot;<i>Default login credentials are HLKAdminUser wit=
h password Testpassword,1&quot;=C2=A0=C2=A0=C2=A0</i> <u></u><u></u></span>=
</p></div><div><p class=3D"MsoNormal"><span style=3D"font-family:&quot;Time=
s New Roman&quot;,serif"><u></u>=C2=A0<u></u></span></p></div><div><p class=
=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quot;,serif=
">Please post the results.=C2=A0=C2=A0 <a href=3D"https://www.windowsserver=
catalog.com/results.aspx?&amp;bCatID=3D1521&amp;cpID=3D2185&amp;avc=3D0&amp=
;ava=3D0&amp;avt=3D0&amp;avq=3D0&amp;OR=3D1&amp;PGS=3D25" target=3D"_blank"=
>Citrix 8.1 and 8.2 are listed as validated</a> and so would be very intere=
sting to see any differences in test results running XCP-ng 8.2 and Citrix =
8.2. =C2=A0<u></u><u></u></span></p></div><div><p class=3D"MsoNormal"><span=
 style=3D"font-family:&quot;Times New Roman&quot;,serif"><u></u>=C2=A0<u></=
u></span></p></div><div><p class=3D"MsoNormal"><span style=3D"font-family:&=
quot;Times New Roman&quot;,serif">Why run the hardware lab kit in a virtual=
ized environment and directly on the underlying hardware?=C2=A0 Because tho=
se tests are used to validate for the <a href=3D"https://www.windowsserverc=
atalog.com/svvp.aspx?svvppage=3Dsvvp.htm" target=3D"_blank">SVVP</a>.=C2=A0=
=C2=A0 Microsoft has something similar to their Hardware Compatibility List=
, aka HCL. =C2=A0 <a href=3D"https://www.windowsservercatalog.com/svvp.aspx=
?svvppage=3Dsvvp.htm" target=3D"_blank">SVVP</a> is Microsoft&#39;s Server =
Virtualization Validation Program. =C2=A0 SVVP validates that Windows Opera=
ting Systems and APPS run on top of other hypervisors and once validated wi=
ll receive technical support.=C2=A0 SVVP has been around for over a decade =
but has of course changed over the years. =C2=A0 Recently,=C2=A0 it has bee=
n making news because <a href=3D"https://github.com/xcp-ng/xcp/issues/471" =
target=3D"_blank">Win11 / Win2022 requires a TPM 2.0 chip, but XCP-NG XEN d=
oes not yet support that</a>. =C2=A0=C2=A0 If the hypervisor is SVVP certif=
ied, then running MS Hyper-V Windows on top of any validated hypervisor </s=
pan><span style=3D"font-size:10.0pt;font-family:&quot;Times New Roman&quot;=
,serif">would be much more likely to work and possibly supported directly b=
y MS and <a href=3D"http://tsanet.org" target=3D"_blank">tsanet.org</a></sp=
an><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif=
">.=C2=A0 Canonical and RedHat are in tsanet, but would like to see the Lin=
ux Foundation or Vates itself.=C2=A0 </span><span style=3D"font-family:&quo=
t;Times New Roman&quot;,serif"><u></u><u></u></span></p></div><div><p class=
=3D"MsoNormal"><u></u>=C2=A0<u></u></p></div><div><p class=3D"MsoNormal"><a=
 href=3D"https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtu=
alization/microsoft-server-software-support-policy" target=3D"_blank"><span=
 style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif">Micros=
oft server software and supported virtualization environments=C2=A009/08/20=
20=C2=A06 minutes to read</span></a><u></u><u></u></p></div><div><h1 id=3D"=
m_4911442955352881957gmail-support-partners-for-non-microsoft-hardware-virt=
ualization-software"><a href=3D"https://docs.microsoft.com/en-us/troublesho=
ot/windows-server/virtualization/non-microsoft-hardware-virtualization-soft=
ware" target=3D"_blank"><span style=3D"font-size:10.0pt;font-family:&quot;A=
rial&quot;,sans-serif;font-weight:normal">Support partners for non-Microsof=
t hardware virtualization software</span></a><u></u><u></u></h1></div><div>=
<p class=3D"MsoNormal"><a href=3D"https://www.windowsservercatalog.com/resu=
lts.aspx?&amp;bCatID=3D1521&amp;cpID=3D0&amp;avc=3D0&amp;ava=3D0&amp;avq=3D=
0&amp;OR=3D1&amp;PGS=3D25" target=3D"_blank">WindowsServerCatalog.com and t=
hen click on SVVP in the upper right and then Products</a><u></u><u></u></p=
></div><div><p class=3D"MsoNormal"><a href=3D"https://docs.microsoft.com/en=
-us/troubleshoot/windows-server/virtualization/non-microsoft-hardware-virtu=
alization-software" target=3D"_blank"><span style=3D"font-size:10.0pt;font-=
family:&quot;Arial&quot;,sans-serif"><br></span></a><u></u><u></u></p></div=
><div><p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New Rom=
an&quot;,serif"><a href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ" t=
arget=3D"_blank">Design Session - Alternative vTPM 2.0 Backend to Comply wi=
th Upcoming SVVP Changes</a><u></u><u></u></span></p></div><div><p class=3D=
"MsoNormal"><span style=3D"font-family:&quot;Times New Roman&quot;,serif"><=
a href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ" target=3D"_blank">=
https://www.youtube.com/watch?v=3DabkRRcoYWCQ</a><u></u><u></u></span></p><=
/div><div><p class=3D"MsoNormal"><span style=3D"font-family:&quot;Times New=
 Roman&quot;,serif"><u></u>=C2=A0<u></u></span></p></div><div><p class=3D"M=
soNormal"><span style=3D"font-family:&quot;Times New Roman&quot;,serif"><a =
href=3D"https://www.youtube.com/watch?v=3DA_IhKjK7EgA" target=3D"_blank">En=
abling UEFI Secure Boot on Xen - Robert Eshleman, Vates SAS</a><u></u><u></=
u></span></p></div><div><p class=3D"MsoNormal"><span style=3D"font-family:&=
quot;Times New Roman&quot;,serif"><a href=3D"https://www.youtube.com/watch?=
v=3DA_IhKjK7EgA&amp;t=3D388s" target=3D"_blank">https://www.youtube.com/wat=
ch?v=3DA_IhKjK7EgA&amp;t=3D388s</a><u></u><u></u></span></p></div><div><h1>=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;fo=
nt-weight:normal"><a href=3D"https://github.com/xcp-ng/xcp/issues/471" targ=
et=3D"_blank">Support vTPM for guests #471 https://github.com/xcp-ng/xcp/is=
sues/471</a></span><span style=3D"font-family:&quot;Times New Roman&quot;,s=
erif"><u></u><u></u></span></h1><p class=3D"MsoNormal"><span style=3D"font-=
family:&quot;Times New Roman&quot;,serif"><a href=3D"https://github.com/xcp=
-ng/xcp/issues/471" target=3D"_blank">https://github.com/xcp-ng/xcp/issues/=
471</a><u></u><u></u></span></p><div><p class=3D"MsoNormal"><span style=3D"=
font-family:&quot;Times New Roman&quot;,serif"><a href=3D"https://docs.micr=
osoft.com/en-us/windows-hardware/test/hlk/" target=3D"_blank">https://docs.=
microsoft.com/en-us/windows-hardware/test/hlk/</a><u></u><u></u></span></p>=
</div></div></div><p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p><div><div>=
<p class=3D"MsoNormal">On Tue, Jul 20, 2021 at 11:12 PM Xentrigued &lt;<a h=
ref=3D"mailto:xentrigued@comcast.net" target=3D"_blank">xentrigued@comcast.=
net</a>&gt; wrote:<u></u><u></u></p></div><blockquote style=3D"border:none;=
border-left:solid #cccccc 1.0pt;padding:0in 0in 0in 6.0pt;margin-left:4.8pt=
;margin-right:0in"><p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">RA=
TIONALE: Features in recent versions of Windows now REQUIRE Hyper-V<br>supp=
ort to work.=C2=A0 In particular, Windows Containers, Sandbox, Docker Deskt=
op<br>and the Windows Subsystem for Linux version 2 (WSL2).=C2=A0 Running W=
indows in a<br>VM as a development and test platform is currently a common =
requirement for<br>various user segments and will likely become necessary f=
or production in the<br>future.=C2=A0 Nested virtualization of Hyper-V curr=
ently works on VMware ESXi,<br>Microsoft Hyper-V and KVM-based hypervisors.=
=C2=A0 This puts Xen and its<br>derivatives at a disadvantage when choosing=
 a hypervisor.<br><br>WHAT IS NOT WORKING?=C2=A0 Provided the requirements =
set forth in:<br><a href=3D"https://wiki.xenproject.org/wiki/Nested_Virtual=
ization_in_Xen" target=3D"_blank">https://wiki.xenproject.org/wiki/Nested_V=
irtualization_in_Xen</a> have been met,<br>an hvm guest running Windows 10 =
PRO Version 21H1 x64 shows that all four<br>requirements for running Hyper-=
V are available using the msinfo32.exe or<br>systeminfo.exe commands.=C2=A0=
 More granular knowledge of the CPU capabilities<br>exposed to the guest ca=
n be observed using the Sysinternals Coreinfo64.exe<br>command.=C2=A0 CPUID=
 flags present appear to mirror those on other working nested<br>hypervisor=
 configurations.<br><br>Enabling Windows Features for Hyper-V, Virtual Mach=
ine Platform, etc. all<br>appear to work without error.=C2=A0 However, afte=
r the finishing reboot, Hyper-V<br>is simply not active.=C2=A0 This--despit=
e the fact that vmcompute.exe (Hyper-V<br>host compute service) is running =
and there are no errors in the logs.=C2=A0 In<br>addition, all four Hyper-V=
 prerequisites continue to show as available.<br><br>By contrast, after the=
 finishing reboot of an analogous Windows VM running<br>on ESXi, the four p=
rerequisites are reversed:=C2=A0 hypervisor is now active;<br>vmx, ept and =
urg (unrestricted guest) are all off as viewed with the<br>Coreinfo64.exe -=
v command.=C2=A0 Furthermore, all functions requiring Hyper-V are<br>now ac=
tive and working as expected.<br><br>This deficiency has been observed in t=
wo test setups running Xen 4.15 from<br>source and XCP-ng 8.2, both running=
 on Intel with all of the latest,<br>generally available patches.=C2=A0 We =
presume that the same behavior is present<br>on Citrix Hypervisor 8.2 as we=
ll.<br><br>SUMMATION:<br>Clearly, much effort has already been expended to =
support the Viridian<br>enlightenments that optimize running Windows on Xen=
.=C2=A0 It also looks like a<br>significant amount of effort has been put f=
orth to advance nested<br>virtualization in general.<br><br>Therefore, if i=
t would be helpful, I am willing to perform testing and<br>provide feedback=
 and logs as appropriate in order to help get this working.<br><br>While my=
 day job is managing a heterogeneous collection of systems running<br>on va=
rious hypervisors, I have learned the rudiments of integrating patches<br>a=
nd rebuilding Xen from source so could no doubt be useful in assisting you<=
br>with this worthwhile endeavor.<br><br><br><u></u><u></u></p></blockquote=
></div></div></div></blockquote></div></div>

--00000000000008b43105c805f37b--

