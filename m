Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 554103D4B06
	for <lists+xen-devel@lfdr.de>; Sun, 25 Jul 2021 04:48:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160544.295170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7UAd-0001Xw-5x; Sun, 25 Jul 2021 02:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160544.295170; Sun, 25 Jul 2021 02:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m7UAc-0001Ve-Us; Sun, 25 Jul 2021 02:47:14 +0000
Received: by outflank-mailman (input) for mailman id 160544;
 Sun, 25 Jul 2021 02:47:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qP3f=MR=comcast.net=xentrigued@srs-us1.protection.inumbo.net>)
 id 1m7UAa-0001VY-Ld
 for xen-devel@lists.xenproject.org; Sun, 25 Jul 2021 02:47:12 +0000
Received: from resqmta-po-04v.sys.comcast.net (unknown
 [2001:558:fe16:19:96:114:154:163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f3cd1f1-5528-463a-a757-9f820b0f5d31;
 Sun, 25 Jul 2021 02:47:10 +0000 (UTC)
Received: from resomta-po-16v.sys.comcast.net ([96.114.154.240])
 by resqmta-po-04v.sys.comcast.net with ESMTP
 id 7U6Dma5m7bVMM7UAXm6m2b; Sun, 25 Jul 2021 02:47:09 +0000
Received: from ASUSN550JK ([IPv6:2601:80:4203:a8a1:8422:6d3f:11dc:fd93])
 by resomta-po-16v.sys.comcast.net with ESMTPSA
 id 7UAVm9pyeQlkw7UAWmtAcS; Sun, 25 Jul 2021 02:47:09 +0000
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
X-Inumbo-ID: 1f3cd1f1-5528-463a-a757-9f820b0f5d31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=20190202a; t=1627181229;
	bh=vIEhIMU8BzmITAhbbJRTKgqnf0JMgEzwjNAy96B/4FQ=;
	h=Received:Received:From:To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type;
	b=kTsPhlsOAjAXhtPd9pHEWqSu/a/LQ9Le3OsfdwCLQjQLW/kSS4SIlkBsVCqRsdv5J
	 3yOvB6p/SGMBuCOotyuHLk06VeRj2w8qkT5piNWkzSEf0CrAja/qkeh8IfCWDHFDsD
	 G2u9OgIqLYOGJ7TO2GCX5xN47Sou3FF6mkKGr6F5/IbCSJSgXo81GKijLGYh4VS+++
	 spCm4/xFLX8MTaLQrx2cKYDwfZP802FGjfkEo+p7t4yI3dDodh7pAmTjZHL2t3YrB8
	 sOEcgbOmmcO4c9bEBIrBpI0zouNYn1U6IlDNkJFTQVYNanzW/hqraT1cxjkhdseJZ2
	 kZMyypUTPJJVQ==
X-Xfinity-VMeta: sc=0.00;st=legit
From: "Xentrigued" <xentrigued@comcast.net>
To: <Rob.Townley@gmail.com>
Cc: <xen-devel@lists.xenproject.org>
References: <001401d77de6$34ff5de0$9efe19a0$@comcast.net> <CA+VdTb-_L-7Zz31DoXiQjTycV8w7rjg0Df76MboDCqKC77ZGzg@mail.gmail.com>
In-Reply-To: <CA+VdTb-_L-7Zz31DoXiQjTycV8w7rjg0Df76MboDCqKC77ZGzg@mail.gmail.com>
Subject: RE: Nested Virtualization of Hyper-V on Xen Not Working
Date: Sat, 24 Jul 2021 22:47:06 -0400
Message-ID: <007a01d780ff$5caff450$160fdcf0$@comcast.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_007B_01D780DD.D5A33650"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQL3Fd3+iiQxDo+LxWnbDNTlihC0wQH+TtHMqQPSvJA=
Content-Language: en-us

This is a multipart message in MIME format.

------=_NextPart_000_007B_01D780DD.D5A33650
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

First and foremost, many thanks for your thoughtful and thorough =
response and also for providing a multitude of genuinely helpful =
information!

=20

Secondly:  Wow, that=E2=80=99s quite a homework assignment!!

=20

I will absolutely begin to work my way through the resources you cited =
and will report back once some of those tests have been completed.  =
You=E2=80=99ve given me an excellent starting point for further inquiry.

=20

To be very honest, I wasn=E2=80=99t sure where to turn next in the event =
that no member of this august body had anything to say about this.  =
(It=E2=80=99s kind of intimidating and not unlike going before the =
Wizard of Oz.)

=20

So again, thank you so much for all of the good information and also for =
your kindness in reaching out.

=20

From: Rob Townley <rob.townley@gmail.com>=20
Sent: Saturday, July 24, 2021 9:33 PM
To: Xentrigued <xentrigued@comcast.net>
Cc: xen-devel@lists.xenproject.org
Subject: Re: Nested Virtualization of Hyper-V on Xen Not Working

=20

I encourage you to run the Windows Hardware Lab Kit 11/02/2018 =
<https://docs.microsoft.com/en-us/windows-hardware/test/hlk/>  or HLK or =
maybe try the VHLK.  The VHLK  =
<https://docs.microsoft.com/en-us/windows-hardware/test/hlk/getstarted/ge=
tstarted-vhlk> is a free VHD file download of win2016 that has all the =
tests necessary built-in.  So you could manually download the test kit =
on your existing Windows VM or attempt the VHD.   "Default login =
credentials are HLKAdminUser with password Testpassword,1"   =20

=20

Please post the results.   Citrix 8.1 and 8.2 are listed as validated =
<https://www.windowsservercatalog.com/results.aspx?&bCatID=3D1521&cpID=3D=
2185&avc=3D0&ava=3D0&avt=3D0&avq=3D0&OR=3D1&PGS=3D25>  and so would be =
very interesting to see any differences in test results running XCP-ng =
8.2 and Citrix 8.2. =20

=20

Why run the hardware lab kit in a virtualized environment and directly =
on the underlying hardware?  Because those tests are used to validate =
for the SVVP =
<https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.htm> .   =
Microsoft has something similar to their Hardware Compatibility List, =
aka HCL.   SVVP =
<https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.htm>  is =
Microsoft's Server Virtualization Validation Program.   SVVP validates =
that Windows Operating Systems and APPS run on top of other hypervisors =
and once validated will receive technical support.  SVVP has been around =
for over a decade but has of course changed over the years.   Recently,  =
it has been making news because Win11 / Win2022 requires a TPM 2.0 chip, =
but XCP-NG XEN does not yet support that =
<https://github.com/xcp-ng/xcp/issues/471> .    If the hypervisor is =
SVVP certified, then running MS Hyper-V Windows on top of any validated =
hypervisor would be much more likely to work and possibly supported =
directly by MS and tsanet.org <http://tsanet.org> .  Canonical and =
RedHat are in tsanet, but would like to see the Linux Foundation or =
Vates itself. =20

=20

 =
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/microsoft-server-software-support-policy> Microsoft server software =
and supported virtualization environments 09/08/2020 6 minutes to read


 =
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/non-microsoft-hardware-virtualization-software> Support partners for =
non-Microsoft hardware virtualization software


WindowsServerCatalog.com and then click on SVVP in the upper right and =
then Products =
<https://www.windowsservercatalog.com/results.aspx?&bCatID=3D1521&cpID=3D=
0&avc=3D0&ava=3D0&avq=3D0&OR=3D1&PGS=3D25>=20

 =
<https://docs.microsoft.com/en-us/troubleshoot/windows-server/virtualizat=
ion/non-microsoft-hardware-virtualization-software>=20


Design Session - Alternative vTPM 2.0 Backend to Comply with Upcoming =
SVVP Changes <https://www.youtube.com/watch?v=3DabkRRcoYWCQ>=20

https://www.youtube.com/watch?v=3DabkRRcoYWCQ

=20

Enabling UEFI Secure Boot on Xen - Robert Eshleman, Vates SAS =
<https://www.youtube.com/watch?v=3DA_IhKjK7EgA>=20

https://www.youtube.com/watch?v=3DA_IhKjK7EgA =
<https://www.youtube.com/watch?v=3DA_IhKjK7EgA&t=3D388s> &t=3D388s


Support vTPM for guests #471 https://github.com/xcp-ng/xcp/issues/471 =
<https://github.com/xcp-ng/xcp/issues/471>=20


https://github.com/xcp-ng/xcp/issues/471

https://docs.microsoft.com/en-us/windows-hardware/test/hlk/

=20

On Tue, Jul 20, 2021 at 11:12 PM Xentrigued <xentrigued@comcast.net =
<mailto:xentrigued@comcast.net> > wrote:

RATIONALE: Features in recent versions of Windows now REQUIRE Hyper-V
support to work.  In particular, Windows Containers, Sandbox, Docker =
Desktop
and the Windows Subsystem for Linux version 2 (WSL2).  Running Windows =
in a
VM as a development and test platform is currently a common requirement =
for
various user segments and will likely become necessary for production in =
the
future.  Nested virtualization of Hyper-V currently works on VMware =
ESXi,
Microsoft Hyper-V and KVM-based hypervisors.  This puts Xen and its
derivatives at a disadvantage when choosing a hypervisor.

WHAT IS NOT WORKING?  Provided the requirements set forth in:
https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen have been =
met,
an hvm guest running Windows 10 PRO Version 21H1 x64 shows that all four
requirements for running Hyper-V are available using the msinfo32.exe or
systeminfo.exe commands.  More granular knowledge of the CPU =
capabilities
exposed to the guest can be observed using the Sysinternals =
Coreinfo64.exe
command.  CPUID flags present appear to mirror those on other working =
nested
hypervisor configurations.

Enabling Windows Features for Hyper-V, Virtual Machine Platform, etc. =
all
appear to work without error.  However, after the finishing reboot, =
Hyper-V
is simply not active.  This--despite the fact that vmcompute.exe =
(Hyper-V
host compute service) is running and there are no errors in the logs.  =
In
addition, all four Hyper-V prerequisites continue to show as available.

By contrast, after the finishing reboot of an analogous Windows VM =
running
on ESXi, the four prerequisites are reversed:  hypervisor is now active;
vmx, ept and urg (unrestricted guest) are all off as viewed with the
Coreinfo64.exe -v command.  Furthermore, all functions requiring Hyper-V =
are
now active and working as expected.

This deficiency has been observed in two test setups running Xen 4.15 =
from
source and XCP-ng 8.2, both running on Intel with all of the latest,
generally available patches.  We presume that the same behavior is =
present
on Citrix Hypervisor 8.2 as well.

SUMMATION:
Clearly, much effort has already been expended to support the Viridian
enlightenments that optimize running Windows on Xen.  It also looks like =
a
significant amount of effort has been put forth to advance nested
virtualization in general.

Therefore, if it would be helpful, I am willing to perform testing and
provide feedback and logs as appropriate in order to help get this =
working.

While my day job is managing a heterogeneous collection of systems =
running
on various hypervisors, I have learned the rudiments of integrating =
patches
and rebuilding Xen from source so could no doubt be useful in assisting =
you
with this worthwhile endeavor.





------=_NextPart_000_007B_01D780DD.D5A33650
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; charset=3Dutf-8"><meta =
name=3DGenerator content=3D"Microsoft Word 15 (filtered =
medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
h1
	{mso-style-priority:9;
	mso-style-link:"Heading 1 Char";
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:24.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.Heading1Char
	{mso-style-name:"Heading 1 Char";
	mso-style-priority:9;
	mso-style-link:"Heading 1";
	font-family:"Calibri Light",sans-serif;
	color:#2F5496;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Courier New";
	color:windowtext;
	font-weight:normal;
	font-style:normal;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue =
vlink=3Dpurple style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier New"'>First and foremost, =
many thanks for your thoughtful and thorough response and also for =
providing a multitude of genuinely helpful =
information!<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier New"'>Secondly:=C2=A0 =
Wow, that=E2=80=99s quite a homework =
assignment!!<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier New"'>I will absolutely =
begin to work my way through the resources you cited and will report =
back once some of those tests have been completed.=C2=A0 You=E2=80=99ve =
given me an excellent starting point for further =
inquiry.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier New"'>To be very honest, =
I wasn=E2=80=99t sure where to turn next in the event that no member of =
this august body had anything to say about this.=C2=A0 (It=E2=80=99s =
kind of intimidating and not unlike going before the Wizard of =
Oz.)<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier New"'>So again, thank you =
so much for all of the good information and also for your kindness in =
reaching out.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-size:12.0pt;font-family:"Courier =
New"'><o:p>&nbsp;</o:p></span></p><div =
style=3D'border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in'><p class=3DMsoNormal><b>From:</b> Rob Townley =
&lt;rob.townley@gmail.com&gt; <br><b>Sent:</b> Saturday, July 24, 2021 =
9:33 PM<br><b>To:</b> Xentrigued =
&lt;xentrigued@comcast.net&gt;<br><b>Cc:</b> =
xen-devel@lists.xenproject.org<br><b>Subject:</b> Re: Nested =
Virtualization of Hyper-V on Xen Not Working<o:p></o:p></p></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New Roman",serif'>I =
encourage you to run the&nbsp;<a =
href=3D"https://docs.microsoft.com/en-us/windows-hardware/test/hlk/">Wind=
ows Hardware Lab Kit 11/02/2018</a> or HLK or maybe try the VHLK.&nbsp; =
The <a =
href=3D"https://docs.microsoft.com/en-us/windows-hardware/test/hlk/getsta=
rted/getstarted-vhlk">VHLK </a>is a free VHD file download of win2016 =
that has all the tests necessary built-in.&nbsp; So you could manually =
download the test kit on your existing Windows VM or attempt the =
VHD.&nbsp;&nbsp; &quot;<i>Default login credentials are HLKAdminUser =
with password Testpassword,1&quot;&nbsp;&nbsp;&nbsp;</i> =
<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-family:"Times New =
Roman",serif'><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New =
Roman",serif'>Please post the results.&nbsp;&nbsp; <a =
href=3D"https://www.windowsservercatalog.com/results.aspx?&amp;bCatID=3D1=
521&amp;cpID=3D2185&amp;avc=3D0&amp;ava=3D0&amp;avt=3D0&amp;avq=3D0&amp;O=
R=3D1&amp;PGS=3D25">Citrix 8.1 and 8.2 are listed as validated</a> and =
so would be very interesting to see any differences in test results =
running XCP-ng 8.2 and Citrix 8.2. =
&nbsp;<o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-family:"Times New =
Roman",serif'><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New =
Roman",serif'>Why run the hardware lab kit in a virtualized environment =
and directly on the underlying hardware?&nbsp; Because those tests are =
used to validate for the <a =
href=3D"https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.ht=
m">SVVP</a>.&nbsp;&nbsp; Microsoft has something similar to their =
Hardware Compatibility List, aka HCL. &nbsp; <a =
href=3D"https://www.windowsservercatalog.com/svvp.aspx?svvppage=3Dsvvp.ht=
m">SVVP</a> is Microsoft's Server Virtualization Validation Program. =
&nbsp; SVVP validates that Windows Operating Systems and APPS run on top =
of other hypervisors and once validated will receive technical =
support.&nbsp; SVVP has been around for over a decade but has of course =
changed over the years. &nbsp; Recently,&nbsp; it has been making news =
because <a href=3D"https://github.com/xcp-ng/xcp/issues/471">Win11 / =
Win2022 requires a TPM 2.0 chip, but XCP-NG XEN does not yet support =
that</a>. &nbsp;&nbsp; If the hypervisor is SVVP certified, then running =
MS Hyper-V Windows on top of any validated hypervisor </span><span =
style=3D'font-size:10.0pt;font-family:"Times New Roman",serif'>would be =
much more likely to work and possibly supported directly by MS and <a =
href=3D"http://tsanet.org">tsanet.org</a></span><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>.&nbsp; =
Canonical and RedHat are in tsanet, but would like to see the Linux =
Foundation or Vates itself.&nbsp; </span><span =
style=3D'font-family:"Times New =
Roman",serif'><o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p =
class=3DMsoNormal><a =
href=3D"https://docs.microsoft.com/en-us/troubleshoot/windows-server/virt=
ualization/microsoft-server-software-support-policy"><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'>Microsoft =
server software and supported virtualization =
environments&nbsp;09/08/2020&nbsp;6 minutes to =
read</span></a><o:p></o:p></p></div><div><h1 =
id=3Dgmail-support-partners-for-non-microsoft-hardware-virtualization-sof=
tware><a =
href=3D"https://docs.microsoft.com/en-us/troubleshoot/windows-server/virt=
ualization/non-microsoft-hardware-virtualization-software"><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;font-weight:norm=
al'>Support partners for non-Microsoft hardware virtualization =
software</span></a><o:p></o:p></h1></div><div><p class=3DMsoNormal><a =
href=3D"https://www.windowsservercatalog.com/results.aspx?&amp;bCatID=3D1=
521&amp;cpID=3D0&amp;avc=3D0&amp;ava=3D0&amp;avq=3D0&amp;OR=3D1&amp;PGS=3D=
25">WindowsServerCatalog.com and then click on SVVP in the upper right =
and then Products</a><o:p></o:p></p></div><div><p class=3DMsoNormal><a =
href=3D"https://docs.microsoft.com/en-us/troubleshoot/windows-server/virt=
ualization/non-microsoft-hardware-virtualization-software"><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif'><br></span></a>=
<o:p></o:p></p></div><div><p class=3DMsoNormal><span =
style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ">Design Session - =
Alternative vTPM 2.0 Backend to Comply with Upcoming SVVP =
Changes</a><o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://www.youtube.com/watch?v=3DabkRRcoYWCQ">https://www.youtub=
e.com/watch?v=3DabkRRcoYWCQ</a><o:p></o:p></span></p></div><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New =
Roman",serif'><o:p>&nbsp;</o:p></span></p></div><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://www.youtube.com/watch?v=3DA_IhKjK7EgA">Enabling UEFI =
Secure Boot on Xen - Robert Eshleman, Vates =
SAS</a><o:p></o:p></span></p></div><div><p class=3DMsoNormal><span =
style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://www.youtube.com/watch?v=3DA_IhKjK7EgA&amp;t=3D388s">https=
://www.youtube.com/watch?v=3DA_IhKjK7EgA&amp;t=3D388s</a><o:p></o:p></spa=
n></p></div><div><h1><span =
style=3D'font-size:10.0pt;font-family:"Arial",sans-serif;font-weight:norm=
al'><a href=3D"https://github.com/xcp-ng/xcp/issues/471">Support vTPM =
for guests #471 https://github.com/xcp-ng/xcp/issues/471</a></span><span =
style=3D'font-family:"Times New Roman",serif'><o:p></o:p></span></h1><p =
class=3DMsoNormal><span style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://github.com/xcp-ng/xcp/issues/471">https://github.com/xcp-=
ng/xcp/issues/471</a><o:p></o:p></span></p><div><p =
class=3DMsoNormal><span style=3D'font-family:"Times New Roman",serif'><a =
href=3D"https://docs.microsoft.com/en-us/windows-hardware/test/hlk/">http=
s://docs.microsoft.com/en-us/windows-hardware/test/hlk/</a><o:p></o:p></s=
pan></p></div></div></div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal>On =
Tue, Jul 20, 2021 at 11:12 PM Xentrigued &lt;<a =
href=3D"mailto:xentrigued@comcast.net">xentrigued@comcast.net</a>&gt; =
wrote:<o:p></o:p></p></div><blockquote =
style=3D'border:none;border-left:solid #CCCCCC 1.0pt;padding:0in 0in 0in =
6.0pt;margin-left:4.8pt;margin-right:0in'><p class=3DMsoNormal =
style=3D'margin-bottom:12.0pt'>RATIONALE: Features in recent versions of =
Windows now REQUIRE Hyper-V<br>support to work.&nbsp; In particular, =
Windows Containers, Sandbox, Docker Desktop<br>and the Windows Subsystem =
for Linux version 2 (WSL2).&nbsp; Running Windows in a<br>VM as a =
development and test platform is currently a common requirement =
for<br>various user segments and will likely become necessary for =
production in the<br>future.&nbsp; Nested virtualization of Hyper-V =
currently works on VMware ESXi,<br>Microsoft Hyper-V and KVM-based =
hypervisors.&nbsp; This puts Xen and its<br>derivatives at a =
disadvantage when choosing a hypervisor.<br><br>WHAT IS NOT =
WORKING?&nbsp; Provided the requirements set forth in:<br><a =
href=3D"https://wiki.xenproject.org/wiki/Nested_Virtualization_in_Xen" =
target=3D"_blank">https://wiki.xenproject.org/wiki/Nested_Virtualization_=
in_Xen</a> have been met,<br>an hvm guest running Windows 10 PRO Version =
21H1 x64 shows that all four<br>requirements for running Hyper-V are =
available using the msinfo32.exe or<br>systeminfo.exe commands.&nbsp; =
More granular knowledge of the CPU capabilities<br>exposed to the guest =
can be observed using the Sysinternals Coreinfo64.exe<br>command.&nbsp; =
CPUID flags present appear to mirror those on other working =
nested<br>hypervisor configurations.<br><br>Enabling Windows Features =
for Hyper-V, Virtual Machine Platform, etc. all<br>appear to work =
without error.&nbsp; However, after the finishing reboot, Hyper-V<br>is =
simply not active.&nbsp; This--despite the fact that vmcompute.exe =
(Hyper-V<br>host compute service) is running and there are no errors in =
the logs.&nbsp; In<br>addition, all four Hyper-V prerequisites continue =
to show as available.<br><br>By contrast, after the finishing reboot of =
an analogous Windows VM running<br>on ESXi, the four prerequisites are =
reversed:&nbsp; hypervisor is now active;<br>vmx, ept and urg =
(unrestricted guest) are all off as viewed with the<br>Coreinfo64.exe -v =
command.&nbsp; Furthermore, all functions requiring Hyper-V are<br>now =
active and working as expected.<br><br>This deficiency has been observed =
in two test setups running Xen 4.15 from<br>source and XCP-ng 8.2, both =
running on Intel with all of the latest,<br>generally available =
patches.&nbsp; We presume that the same behavior is present<br>on Citrix =
Hypervisor 8.2 as well.<br><br>SUMMATION:<br>Clearly, much effort has =
already been expended to support the Viridian<br>enlightenments that =
optimize running Windows on Xen.&nbsp; It also looks like =
a<br>significant amount of effort has been put forth to advance =
nested<br>virtualization in general.<br><br>Therefore, if it would be =
helpful, I am willing to perform testing and<br>provide feedback and =
logs as appropriate in order to help get this working.<br><br>While my =
day job is managing a heterogeneous collection of systems running<br>on =
various hypervisors, I have learned the rudiments of integrating =
patches<br>and rebuilding Xen from source so could no doubt be useful in =
assisting you<br>with this worthwhile =
endeavor.<br><br><br><o:p></o:p></p></blockquote></div></div></body></htm=
l>
------=_NextPart_000_007B_01D780DD.D5A33650--


