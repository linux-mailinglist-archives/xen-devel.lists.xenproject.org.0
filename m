Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCBE3D4ADE
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jul 2021 03:34:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160537.295158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7T0p-0000tb-Ly; Sun, 25 Jul 2021 01:33:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160537.295158; Sun, 25 Jul 2021 01:33:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7T0p-0000qx-Eo; Sun, 25 Jul 2021 01:33:03 +0000
Received: by outflank-mailman (input) for mailman id 160537;
 Sun, 25 Jul 2021 01:33:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=td3s=MR=gmail.com=rob.townley@srs-us1.protection.inumbo.net>)
 id 1m7T0n-0000qr-Sw
 for xen-devel@lists.xenproject.org; Sun, 25 Jul 2021 01:33:01 +0000
Received: from mail-vk1-xa2e.google.com (unknown [2607:f8b0:4864:20::a2e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1ae74886-4437-48d6-9dde-b63172ca3235;
 Sun, 25 Jul 2021 01:33:00 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id x16so1273982vkn.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jul 2021 18:33:00 -0700 (PDT)
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
X-Inumbo-ID: 1ae74886-4437-48d6-9dde-b63172ca3235
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=i7Zyt8w3tV8oE/uo+YJ3vNPFZtsmV0Pmp2gZ0FSTG0c=;
        b=m6FOWBtyIKGftK1tlyGNazMt+7eaH0E+29II1U3uTBN74lkIh44aEhWlirTSFZfqdl
         iyAXVF5yUmnGo6zS6/uqlRqCI0+yBnflZz3a9YfZrJ5xr+YI34y52lX5Cx3+aZqhj3LZ
         lOKaR79U0ksNLNdTqnGP/fuNIvi1W1Xe2WflHHBCtNXdd81U6LkurRxW2xq1NzLr6Ix1
         9RDrFiuDXFYA284hzXa9v1PgtRaBUOtTN2x4qbCbFjQlk12xJEvKzQxJPVbaYctxB3Pz
         BZVPTBs3v5dKOxRCIl0L6dd9PsNl9Oi79Rx057M3dDnbw0Ky/n/H0AnAeOZRHQu1RprU
         V6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=i7Zyt8w3tV8oE/uo+YJ3vNPFZtsmV0Pmp2gZ0FSTG0c=;
        b=dg+0OVERzDtI9Akh8O0Txn5wMeWxspMv9XQHyGUteXt6dMOs+0hxp7zDMs5HY2Wq+5
         Ay8MxKcw6zi1pbQAvH94FEBocbwGOn/jhxvWyAI74Vq8QJqMURbMYllFyteLQ37T8uaw
         zyAJ9CPCMBSx01Eh+ktFXJgHrfzd3uL5W28H8qpD1pHzFD4APOndYoEPIJmbZ/jXElsp
         DaQTaDPKpqIz4y7D5scUH7awpvWs7i24ljm6DGEM090L1lM0tQMhI8+Fk8nbfljWgMYY
         JG7DfVqod2aWVXrtakiDOjrKhBhy+hRXpB2Z4PWh8cpTNB90ZA7E8eCThFOg2RmLbdmA
         RdKA==
X-Gm-Message-State: AOAM533mtLv0ROKZ4d93HhpaVpfWIRu0tfTY+0mx1GPPxp0drxT8QnqF
	+JsncvR4G2YqtoDIBIRC8Hmd8PKDmdskL+REH+Y=
X-Google-Smtp-Source: ABdhPJwK4hOQEMWUhCLf9JggbPk1LIohNCRAO5JREquYoIdL8HqFduE1AnS+e1cthHva4a8tc03OmyyvC3RxwO2VmVw=
X-Received: by 2002:a05:6122:92a:: with SMTP id j42mr1873389vka.22.1627176779647;
 Sat, 24 Jul 2021 18:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <001401d77de6$34ff5de0$9efe19a0$@comcast.net>
In-Reply-To: <001401d77de6$34ff5de0$9efe19a0$@comcast.net>
Reply-To: Rob.Townley@gmail.com
From: Rob Townley <rob.townley@gmail.com>
Date: Sat, 24 Jul 2021 20:32:48 -0500
Message-ID: <CA+VdTb-_L-7Zz31DoXiQjTycV8w7rjg0Df76MboDCqKC77ZGzg@mail.gmail.com>
Subject: Re: Nested Virtualization of Hyper-V on Xen Not Working
To: Xentrigued <xentrigued@comcast.net>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000f0135105c7e89dc4"

--000000000000f0135105c7e89dc4
Content-Type: text/plain; charset="UTF-8"

I encourage you to run the Windows Hardware Lab Kit 11/02/2018
<https://docs.microsoft.com/en-us/windows-hardware/test/hlk/> or HLK or
maybe try the VHLK.  The VHLK
<https://docs.microsoft.com/en-us/windows-hardware/test/hlk/getstarted/getstarted-vhlk>is
a free VHD file download of win2016 that has all the tests necessary
built-in.  So you could manually download the test kit on your existing
Windows VM or attempt the VHD.   "*Default login credentials are
HLKAdminUser with password Testpassword,1"   *

Please post the results.   Citrix 8.1 and 8.2 are listed as validated
<https://www.windowsservercatalog.com/results.aspx?&bCatID=1521&cpID=2185&avc=0&ava=0&avt=0&avq=0&OR=1&PGS=25>
and so would be very interesting to see any differences in test results
running XCP-ng 8.2 and Citrix 8.2.

Why run the hardware lab kit in a virtualized environment and directly on
the underlying hardware?  Because those tests are used to validate for the
SVVP <https://www.windowsservercatalog.com/svvp.aspx?svvppage=svvp.htm>.
Microsoft has something similar to their Hardware Compatibility List, aka
HCL.   SVVP
<https://www.windowsservercatalog.com/svvp.aspx?svvppage=svvp.htm> is
Microsoft's Server Virtualization Validation Program.   SVVP validates that
Windows Operating Systems and APPS run on top of other hypervisors and once
validated will receive technical support.  SVVP has been around for over a
decade but has of course changed over the years.   Recently,  it has been
making news because Win11 / Win2022 requires a TPM 2.0 chip, but XCP-NG XEN
does not yet support that <https://github.com/xcp-ng/xcp/issues/471>.    If
the hypervisor is SVVP certified, then running MS Hyper-V Windows on top of
any validated hypervisor would be much more likely to work and possibly
supported directly by MS and tsanet.org.  Canonical and RedHat are in
tsanet, but would like to see the Linux Foundation or Vates itself.
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualization/non-microsoft-hardware-virtualization-software>

Microsoft server software and supported virtualization
environments 09/08/2020 6 minutes to read
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualization/microsoft-server-software-support-policy>
Support partners for non-Microsoft hardware virtualization software
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualization/non-microsoft-hardware-virtualization-software>
WindowsServerCatalog.com and then click on SVVP in the upper right and then
Products
<https://www.windowsservercatalog.com/results.aspx?&bCatID=1521&cpID=0&avc=0&ava=0&avq=0&OR=1&PGS=25>

<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualization/non-microsoft-hardware-virtualization-software>
Design Session - Alternative vTPM 2.0 Backend to Comply with Upcoming SVVP
Changes <https://www.youtube.com/watch?v=abkRRcoYWCQ>
https://www.youtube.com/watch?v=abkRRcoYWCQ

Enabling UEFI Secure Boot on Xen - Robert Eshleman, Vates SAS
<https://www.youtube.com/watch?v=A_IhKjK7EgA>
https://www.youtube.com/watch?v=A_IhKjK7EgA&t=388s
Support vTPM for guests #471 https://github.com/xcp-ng/xcp/issues/471
<https://github.com/xcp-ng/xcp/issues/471>
https://github.com/xcp-ng/xcp/issues/471
https://docs.microsoft.com/en-us/windows-hardware/test/hlk/

On Tue, Jul 20, 2021 at 11:12 PM Xentrigued <xentrigued@comcast.net> wrote:

> RATIONALE: Features in recent versions of Windows now REQUIRE Hyper-V
> support to work.  In particular, Windows Containers, Sandbox, Docker
> Desktop
> and the Windows Subsystem for Linux version 2 (WSL2).  Running Windows in a
> VM as a development and test platform is currently a common requirement for
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
> exposed to the guest can be observed using the Sysinternals Coreinfo64.exe
> command.  CPUID flags present appear to mirror those on other working
> nested
> hypervisor configurations.
>
> Enabling Windows Features for Hyper-V, Virtual Machine Platform, etc. all
> appear to work without error.  However, after the finishing reboot, Hyper-V
> is simply not active.  This--despite the fact that vmcompute.exe (Hyper-V
> host compute service) is running and there are no errors in the logs.  In
> addition, all four Hyper-V prerequisites continue to show as available.
>
> By contrast, after the finishing reboot of an analogous Windows VM running
> on ESXi, the four prerequisites are reversed:  hypervisor is now active;
> vmx, ept and urg (unrestricted guest) are all off as viewed with the
> Coreinfo64.exe -v command.  Furthermore, all functions requiring Hyper-V
> are
> now active and working as expected.
>
> This deficiency has been observed in two test setups running Xen 4.15 from
> source and XCP-ng 8.2, both running on Intel with all of the latest,
> generally available patches.  We presume that the same behavior is present
> on Citrix Hypervisor 8.2 as well.
>
> SUMMATION:
> Clearly, much effort has already been expended to support the Viridian
> enlightenments that optimize running Windows on Xen.  It also looks like a
> significant amount of effort has been put forth to advance nested
> virtualization in general.
>
> Therefore, if it would be helpful, I am willing to perform testing and
> provide feedback and logs as appropriate in order to help get this working.
>
> While my day job is managing a heterogeneous collection of systems running
> on various hypervisors, I have learned the rudiments of integrating patches
> and rebuilding Xen from source so could no doubt be useful in assisting you
> with this worthwhile endeavor.
>
>
>
>

--000000000000f0135105c7e89dc4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:times ne=
w roman,serif">I encourage you to run the=C2=A0<a href=3D"https://docs.micr=
osoft.com/en-us/windows-hardware/test/hlk/">Windows Hardware Lab Kit 11/02/=
2018</a> or HLK or maybe try the VHLK.=C2=A0 The <a href=3D"https://docs.mi=
crosoft.com/en-us/windows-hardware/test/hlk/getstarted/getstarted-vhlk">VHL=
K </a>is a free VHD file download of win2016 that has all the tests necessa=
ry built-in.=C2=A0 So you could manually download the test kit on your exis=
ting Windows VM or attempt the VHD.=C2=A0=C2=A0
&quot;<i>Default login credentials are HLKAdminUser with password Testpassw=
ord,1&quot;=C2=A0=C2=A0=C2=A0</i> </div><div class=3D"gmail_default" style=
=3D"font-family:times new roman,serif"><br></div><div class=3D"gmail_defaul=
t" style=3D"font-family:times new roman,serif">Please post the results.=C2=
=A0=C2=A0 <a href=3D"https://www.windowsservercatalog.com/results.aspx?&amp=
;bCatID=3D1521&amp;cpID=3D2185&amp;avc=3D0&amp;ava=3D0&amp;avt=3D0&amp;avq=
=3D0&amp;OR=3D1&amp;PGS=3D25">Citrix 8.1 and 8.2 are listed as validated</a=
> and so would be very interesting to see any differences in test results r=
unning XCP-ng 8.2 and Citrix 8.2. =C2=A0<br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:times new roman,serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:times new roman,serif">Why run the hardwar=
e lab kit in a virtualized environment and directly on the underlying hardw=
are?=C2=A0 Because those tests are used to validate for the <a href=3D"http=
s://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.htm">SVVP</a>.=
=C2=A0=C2=A0 Microsoft has something similar to their Hardware Compatibilit=
y List, aka HCL. =C2=A0 <a href=3D"https://www.windowsservercatalog.com/svv=
p.aspx?svvppage=3Dsvvp.htm">SVVP</a> is Microsoft&#39;s Server Virtualizati=
on Validation Program. =C2=A0 SVVP validates that Windows Operating Systems=
 and APPS run on top of other hypervisors and once validated will receive t=
echnical support.=C2=A0 SVVP has been around for over a decade but has of c=
ourse changed over the years. =C2=A0 Recently,=C2=A0 it has been making new=
s because <a href=3D"https://github.com/xcp-ng/xcp/issues/471">Win11 / Win2=
022 requires a TPM 2.0 chip, but XCP-NG XEN does not yet support that</a>. =
=C2=A0=C2=A0 If the hypervisor is SVVP certified, then running MS Hyper-V W=
indows on top of any validated hypervisor <font size=3D"2">would be much mo=
re likely to work and possibly supported directly by MS and <a href=3D"http=
://tsanet.org">tsanet.org</a></font><font size=3D"2"><span style=3D"font-fa=
mily:arial,sans-serif">.=C2=A0 Canonical and RedHat are in tsanet, but woul=
d like to see the Linux Foundation or Vates itself.=C2=A0 <br></span></font=
><a href=3D"https://docs.microsoft.com/en-us/troubleshoot/windows-server/vi=
rtualization/non-microsoft-hardware-virtualization-software"><font size=3D"=
2"><span style=3D"font-family:arial,sans-serif"></span></font></a></div><di=
v class=3D"gmail_default"><br></div><div class=3D"gmail_default"><a href=3D=
"https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizatio=
n/microsoft-server-software-support-policy"><font size=3D"2"><span style=3D=
"font-family:arial,sans-serif">Microsoft server software and supported virt=
ualization environments=C2=A009/08/2020=C2=A06 minutes to read</span></font=
></a></div><div class=3D"gmail_default"><h1 id=3D"gmail-support-partners-fo=
r-non-microsoft-hardware-virtualization-software"><a href=3D"https://docs.m=
icrosoft.com/en-us/troubleshoot/windows-server/virtualization/non-microsoft=
-hardware-virtualization-software"><font size=3D"2"><span style=3D"font-fam=
ily:arial,sans-serif"><span style=3D"font-weight:normal">Support partners f=
or non-Microsoft hardware virtualization software</span></span></font></a><=
/h1>

</div><div class=3D"gmail_default"><a href=3D"https://www.windowsservercata=
log.com/results.aspx?&amp;bCatID=3D1521&amp;cpID=3D0&amp;avc=3D0&amp;ava=3D=
0&amp;avq=3D0&amp;OR=3D1&amp;PGS=3D25">WindowsServerCatalog.com and then cl=
ick on SVVP in the upper right and then Products</a></div><div class=3D"gma=
il_default"><a href=3D"https://docs.microsoft.com/en-us/troubleshoot/window=
s-server/virtualization/non-microsoft-hardware-virtualization-software"><fo=
nt size=3D"2"><span style=3D"font-family:arial,sans-serif"><br></span></fon=
t></a></div><div class=3D"gmail_default" style=3D"font-family:times new rom=
an,serif"><a href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ">Design =
Session - Alternative vTPM 2.0 Backend to Comply with Upcoming SVVP Changes=
</a></div><div class=3D"gmail_default" style=3D"font-family:times new roman=
,serif"><a href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ">https://w=
ww.youtube.com/watch?v=3DabkRRcoYWCQ</a><br></div><div class=3D"gmail_defau=
lt" style=3D"font-family:times new roman,serif"><br></div><div class=3D"gma=
il_default" style=3D"font-family:times new roman,serif"><a href=3D"https://=
www.youtube.com/watch?v=3DA_IhKjK7EgA">Enabling UEFI Secure Boot on Xen - R=
obert Eshleman, Vates SAS</a></div><div class=3D"gmail_default" style=3D"fo=
nt-family:times new roman,serif"><a href=3D"https://www.youtube.com/watch?v=
=3DA_IhKjK7EgA&amp;t=3D388s">https://www.youtube.com/watch?v=3DA_IhKjK7EgA&=
amp;t=3D388s</a></div><div class=3D"gmail_default" style=3D"font-family:tim=
es new roman,serif">
<h1 class=3D"gmail-gh-header-title gmail-mb-2 gmail-lh-condensed gmail-f1 g=
mail-mr-0 gmail-flex-auto gmail-break-word"><font size=3D"2"><span style=3D=
"font-family:arial,sans-serif"><span style=3D"font-weight:normal"><a href=
=3D"https://github.com/xcp-ng/xcp/issues/471">Support vTPM for guests      =
      #471       https://github.com/xcp-ng/xcp/issues/471</a></span></span>=
<span style=3D"font-family:arial,sans-serif"><span style=3D"font-weight:nor=
mal"></span></span></font></h1><a href=3D"https://github.com/xcp-ng/xcp/iss=
ues/471">https://github.com/xcp-ng/xcp/issues/471</a><div><a href=3D"https:=
//docs.microsoft.com/en-us/windows-hardware/test/hlk/">https://docs.microso=
ft.com/en-us/windows-hardware/test/hlk/</a></div></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jul 20, 2021=
 at 11:12 PM Xentrigued &lt;<a href=3D"mailto:xentrigued@comcast.net">xentr=
igued@comcast.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">RATIONALE: Features in recent versions of Windows now REQU=
IRE Hyper-V<br>
support to work.=C2=A0 In particular, Windows Containers, Sandbox, Docker D=
esktop<br>
and the Windows Subsystem for Linux version 2 (WSL2).=C2=A0 Running Windows=
 in a<br>
VM as a development and test platform is currently a common requirement for=
<br>
various user segments and will likely become necessary for production in th=
e<br>
future.=C2=A0 Nested virtualization of Hyper-V currently works on VMware ES=
Xi,<br>
Microsoft Hyper-V and KVM-based hypervisors.=C2=A0 This puts Xen and its<br=
>
derivatives at a disadvantage when choosing a hypervisor.<br>
<br>
WHAT IS NOT WORKING?=C2=A0 Provided the requirements set forth in:<br>
<a href=3D"https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen" r=
el=3D"noreferrer" target=3D"_blank">https://wiki.xenproject.org/wiki/Nested=
_Virtualization_in_Xen</a> have been met,<br>
an hvm guest running Windows 10 PRO Version 21H1 x64 shows that all four<br=
>
requirements for running Hyper-V are available using the msinfo32.exe or<br=
>
systeminfo.exe commands.=C2=A0 More granular knowledge of the CPU capabilit=
ies<br>
exposed to the guest can be observed using the Sysinternals Coreinfo64.exe<=
br>
command.=C2=A0 CPUID flags present appear to mirror those on other working =
nested<br>
hypervisor configurations.<br>
<br>
Enabling Windows Features for Hyper-V, Virtual Machine Platform, etc. all<b=
r>
appear to work without error.=C2=A0 However, after the finishing reboot, Hy=
per-V<br>
is simply not active.=C2=A0 This--despite the fact that vmcompute.exe (Hype=
r-V<br>
host compute service) is running and there are no errors in the logs.=C2=A0=
 In<br>
addition, all four Hyper-V prerequisites continue to show as available.<br>
<br>
By contrast, after the finishing reboot of an analogous Windows VM running<=
br>
on ESXi, the four prerequisites are reversed:=C2=A0 hypervisor is now activ=
e;<br>
vmx, ept and urg (unrestricted guest) are all off as viewed with the<br>
Coreinfo64.exe -v command.=C2=A0 Furthermore, all functions requiring Hyper=
-V are<br>
now active and working as expected.<br>
<br>
This deficiency has been observed in two test setups running Xen 4.15 from<=
br>
source and XCP-ng 8.2, both running on Intel with all of the latest,<br>
generally available patches.=C2=A0 We presume that the same behavior is pre=
sent<br>
on Citrix Hypervisor 8.2 as well.<br>
<br>
SUMMATION:<br>
Clearly, much effort has already been expended to support the Viridian<br>
enlightenments that optimize running Windows on Xen.=C2=A0 It also looks li=
ke a<br>
significant amount of effort has been put forth to advance nested<br>
virtualization in general.<br>
<br>
Therefore, if it would be helpful, I am willing to perform testing and<br>
provide feedback and logs as appropriate in order to help get this working.=
<br>
<br>
While my day job is managing a heterogeneous collection of systems running<=
br>
on various hypervisors, I have learned the rudiments of integrating patches=
<br>
and rebuilding Xen from source so could no doubt be useful in assisting you=
<br>
with this worthwhile endeavor.<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000f0135105c7e89dc4--

