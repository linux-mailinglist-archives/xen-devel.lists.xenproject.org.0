Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBE78F3A8
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 21:52:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594080.927277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnhk-0006q4-Fx; Thu, 31 Aug 2023 19:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594080.927277; Thu, 31 Aug 2023 19:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnhk-0006nx-DC; Thu, 31 Aug 2023 19:51:48 +0000
Received: by outflank-mailman (input) for mailman id 594080;
 Thu, 31 Aug 2023 19:51:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTJh=EQ=dlsemc.com=D@srs-se1.protection.inumbo.net>)
 id 1qbnhi-0006md-57
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 19:51:46 +0000
Received: from mailhost.dlsemc.com (mailhost.dlsemc.com [70.225.236.130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd763883-4837-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 21:51:41 +0200 (CEST)
Received: from EXCHANGE-2019.DLSEMC.local (10.99.99.46) by
 EXCHANGE-2019.DLSEMC.local (10.99.99.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Thu, 31 Aug 2023 14:52:05 -0500
Received: from EXCHANGE-2019.DLSEMC.local ([fe80::8757:d05f:f5c5:c3d1]) by
 EXCHANGE-2019.DLSEMC.local ([fe80::8757:d05f:f5c5:c3d1%16]) with mapi id
 15.02.1258.012; Thu, 31 Aug 2023 14:52:05 -0500
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
X-Inumbo-ID: cd763883-4837-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; d=dlsemc.com; s=1; c=relaxed/relaxed;
	t=1693511526; h=from:subject:to:date:message-id;
	bh=J52LSx8nkpS5OnC4H1Vz4p/4idX7y5muL5sxERfFw80=;
	b=g0RYQtzMfSh8cMXIyh+lgaiAh4VmmzRCz2CZvxg5xgmf8NgfmoW51KUj/9aZEd/Q2k4uPbrCPKN
	0Z40qRTJDWGmmNZBtBYzvwNTPyCkQsjod/VQbmcTcH6gEnhyjyMKbL9xbQhk3iKeCeXqC8a0pDccF
	g4UprT9/2lYy9Vf802DCXS8kXbuYPS+exXqd/mnAG9tClY6RHUvaArMWVMiLwdEMTr96z2YXLSj/j
	flgFYacGuUu9dhKO7LUYtqCcdxIfclREl/CkV3yXqpg7q0W6++ch/hHRhX/AhqPPwJg9vMtjmMr87
	4lICndx3l9k8wnNqonVJvR1pXGitC/65EYnw==
From: Development <D@dlsemc.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Xens handling of MCE
Thread-Topic: Xens handling of MCE
Thread-Index: AQHZ3EO9T2w+QWWFXkyFcitIPlY3Pg==
Date: Thu, 31 Aug 2023 19:52:05 +0000
Message-ID: <521ab5aef01a4c64bef65435e7c284bd@dlsemc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.99.99.38]
Content-Type: multipart/alternative;
	boundary="_000_521ab5aef01a4c64bef65435e7c284bddlsemccom_"
MIME-Version: 1.0

--_000_521ab5aef01a4c64bef65435e7c284bddlsemccom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

We have been trying to find documentation on how to tell Xen to forward MCE=
 information to the linux kernel in Dom0 in order to let a system administr=
ator be able to get notified when his system has bad memory.  However from =
what I can tell this has not been documented anywhere.

If anyone knows of documentation (or knows the answer) of what someone is s=
upposed to do in order to monitor the corrected errors and monitor the unco=
rrected errors when they are running modern xen, it would be appreciated.


To clarify, (and for people not familiar):

    When running old xen ( example: Xen 4.1) on a system, linux in dom0 wou=
ld load the edac modules.  example: amd64_edac_mod , edac_mce_amd , and eda=
c_core
    Once the modules loaded, the error counts for ECC memory, and PCI, coul=
d be found in these "files":
               /sys/devices/system/edac/mc/mc0/ce_count
               /sys/devices/system/edac/mc/mc0/ue_count
               /sys/devices/system/edac/pci/pci0/npe_count
               /sys/devices/system/edac/pci/pci0/pe_count

    However, in 2009-02, "cegger" wrote MCA/MCE_in_Xen, a proposal for havi=
ng xen start checking the information
    Xen started accessing the EDAC information (now called "MCE") at some p=
oint after that, which blocks the linux kernel in dom0 from accessing it.
    (I also found what appears to be related sides from a presentation from=
 2012 at: https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE_=
design_%28v0_2%29.pdf )

    Now, The linux kernel compile option: CONFIG_XEN_MCE_LOG=3Dy is documen=
ted as: "Allow kernel fetching MCE error from Xen platform and converting i=
t into Linux mcelog format for mcelog tools".
       I imagine there must be some way on the xen side for this to work fo=
r CONFIG_XEN_MCE_LOG to have gotten into the linux kernel and be enabled by=
 default in distributions.
       (notes: mcelog seems to have been replaced with "ras daemon", but I =
believe that it pulls information using the same kernel APT as "mcelog") (s=
o I believe the final output of if you are having memory errors is pulled b=
y doing "ras-mc-ctl --errors" now instead of looking in /sys/devices/system=
/edac/mc and /sys/devices/system/edac/pci)
    I suspect that to check if it was working on a modern system, one would=
 do "ras-mc-ctl --status" and get something implying that the xen mce inter=
face is working instead of just saying "ras-mc-ctl: drivers not loaded."
    Somewhere it was said that adding the xen boot parameter "mce=3D1" to g=
rub would cause xen to forward the info to the linux kernel, but that confl=
icts with recent changes to the documentation.  Also, tested by setting "mc=
e=3D1" and nothing appears to change.


Any help is appreciated.


--_000_521ab5aef01a4c64bef65435e7c284bddlsemccom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p></p>
<div>We have been trying to find documentation on how to tell Xen to forwar=
d MCE information to the linux kernel in Dom0 in order to let a system admi=
nistrator be able to get notified when his system has bad memory.&nbsp; How=
ever from what I can tell this has not
 been documented anywhere.<br>
<br>
If anyone knows of documentation (or knows the answer) of what someone is s=
upposed to do in order to monitor the corrected errors and monitor the unco=
rrected errors when they are running modern xen, it would be appreciated.
<br>
<br>
<br>
To clarify, (and for people not familiar):</div>
<div><br>
</div>
<div>&nbsp;&nbsp;&nbsp; When running old xen ( example: Xen 4.1) on a syste=
m, linux in dom0 would load the edac modules.&nbsp; example: amd64_edac_mod=
 , edac_mce_amd , and edac_core</div>
<div>&nbsp;&nbsp;&nbsp; Once the modules loaded, the error counts for ECC m=
emory, and PCI, could be found in these &quot;files&quot;:<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys/devic=
es/system/edac/mc/mc0/ce_count<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys/devic=
es/system/edac/mc/mc0/ue_count<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys/devic=
es/system/edac/pci/pci0/npe_count<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /sys/devic=
es/system/edac/pci/pci0/pe_count<br>
&nbsp;&nbsp; &nbsp;<br>
&nbsp;&nbsp;&nbsp; However, in 2009-02, &quot;cegger&quot; wrote MCA/MCE_in=
_Xen, a proposal for having xen start checking the information<br>
&nbsp;&nbsp;&nbsp; Xen started accessing the EDAC information (now called &=
quot;MCE&quot;) at some point after that, which blocks the linux kernel in =
dom0 from accessing it.<br>
<div>&nbsp;&nbsp;&nbsp; (I also found what appears to be related sides from=
 a presentation from 2012 at:
<a href=3D"https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE=
_design_%28v0_2%29.pdf" class=3D"OWAAutoLink" id=3D"LPlnk452021">
https://lkml.iu.edu/hypermail/linux/kernel/1206.3/01304/xen_vMCE_design_%28=
v0_2%29.pdf</a> )<br>
</div>
&nbsp;&nbsp; &nbsp;<br>
&nbsp;&nbsp;&nbsp; Now, The linux kernel compile option: CONFIG_XEN_MCE_LOG=
=3Dy is documented as: &quot;Allow kernel fetching MCE error from Xen platf=
orm and converting it into Linux mcelog format for mcelog tools&quot;.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I imagine there must be some way on th=
e xen side for this to work for CONFIG_XEN_MCE_LOG to have gotten into the =
linux kernel and be enabled by default in distributions.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (notes: mcelog seems to have been repl=
aced with &quot;ras daemon&quot;, but I believe that it pulls information u=
sing the same kernel APT as &quot;mcelog&quot;) (so I believe the final out=
put of if you are having memory errors is pulled by doing &quot;ras-mc-ctl =
--errors&quot; now
 instead of looking in /sys/devices/system/edac/mc and /sys/devices/system/=
edac/pci)<br>
&nbsp;&nbsp;&nbsp; I suspect that to check if it was working on a modern sy=
stem, one would do &quot;ras-mc-ctl --status&quot; and get something implyi=
ng that the xen mce interface is working instead of just saying &quot;ras-m=
c-ctl: drivers not loaded.&quot;<br>
&nbsp;&nbsp;&nbsp; Somewhere it was said that adding the xen boot parameter=
 &quot;mce=3D1&quot; to grub would cause xen to forward the info to the lin=
ux kernel, but that conflicts with recent changes to the documentation.&nbs=
p; Also, tested by setting &quot;mce=3D1&quot; and nothing appears to chang=
e.<br>
<br>
<br>
Any help is appreciated.</div>
<br>
<p></p>
</div>
</body>
</html>

--_000_521ab5aef01a4c64bef65435e7c284bddlsemccom_--

