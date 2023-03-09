Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF376B2E47
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 21:12:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508353.782975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paMbS-0003CU-Kd; Thu, 09 Mar 2023 20:11:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508353.782975; Thu, 09 Mar 2023 20:11:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paMbS-00039u-Gj; Thu, 09 Mar 2023 20:11:06 +0000
Received: by outflank-mailman (input) for mailman id 508353;
 Thu, 09 Mar 2023 19:34:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVQW=7B=web.de=tachyon_gun@srs-se1.protection.inumbo.net>)
 id 1paM24-0006en-19
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 19:34:32 +0000
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 687230c3-beb1-11ed-87f5-c1b5be75604c;
 Thu, 09 Mar 2023 20:34:29 +0100 (CET)
Received: from [92.76.123.40] ([92.76.123.40]) by web-mail.web.de
 (3c-app-webde-bap36.server.lan [172.19.172.36]) (via HTTP); Thu, 9 Mar 2023
 20:34:28 +0100
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
X-Inumbo-ID: 687230c3-beb1-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
	t=1678390468; i=tachyon_gun@web.de;
	bh=LZgbt2b26yDBi7kPMeW7LM5bpHl4P+7AhIR1DY8HQZ4=;
	h=X-UI-Sender-Class:From:To:Subject:Date;
	b=QKDici3Xx01rwa5Ri3sPvnG4AxeIm1QqRuXZ84vDhVF7VzpIjhCJi1ZuEC4Q2mIYm
	 jOpoMI0Yj7kLaqHLwz/9d66O8WzLMeGCl6FnLZ5cRafyVQSd3ag5kR+k+frVzwpwc9
	 ciNISjtzn9dHBtnEEAvudsjpRd5imdh5UGBw3KZckfg2wt0fguZFlmxblmE7NqORIO
	 xXvkRMuX8Rla5K/dSJJo5mH684t2UCz6v+2YVAZK53C9A03seS/TbVu7R04fXnoKqI
	 5vQW1tafD1PuiEXq6TrByyd04HuAbl5CXAVf8uLDrhSU3lolYEYzqfokiOnlkUvZ6X
	 WYqCDzZhJKZbg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
MIME-Version: 1.0
Message-ID: <trinity-8973751a-6742-4309-b02d-0b4c38f4206e-1678390468345@3c-app-webde-bap36>
From: tachyon_gun@web.de
To: xen-devel@lists.xenproject.org
Subject: [help] Xen 4.14.5 on Devuan 4.0 Chimaera
Content-Type: multipart/mixed;
 boundary=trekuen-ab685f02-5785-4d56-a853-463f105083b0
Date: Thu, 9 Mar 2023 20:34:28 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:YuZX1FcAraMmB/HMYILTapfyV4VmJ4EebLp9SI7dt8SlwFea9+XnumUGkjl8ny5nly5SU
 8R1MY4HwbQINIuUR6RiNoIX637poXU9uHUZAAUDJ6FhB1ZoecvEL+UfkdumF7XiaPTmIjgUUtD2p
 nDRuDaJqguMp+lt+ayBFXOdxWbztcpUxqdlmyHt//hi7GLR+UHFx1l+n1RRh6aiuB7pleRPc8Civ
 X+8131F0UJQhZ46BsASmhlxUY24X5saXgSGmNiXnMO56kSk07asLqIud1Zhw+IN4JFBr6IfdVjCE
 0w=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N/dOXG6r1IU=;SIVb6zGIcb73R9fSELMZYLTqIk6
 Y3zdd6MA0YCGf2h88qVyz1IptoooXHuqwbxkWFbw5aw7mx+MwtfIz58E8/aEufZa2E8mEBcfj
 0mzGk3tlsToyMEMyUXX6Nx/pTDiZsgGoRkOREH7WInG5uIRtlUsQ5gYbpZUOCWyPDD4W7R0Lb
 5CcuLDKM+LyD/jQ4ljQTWGxAfULVHGzvqqpSm+qu5Ib82x39kP84XGykdxPMlNGhQfUUHtB4Q
 INTuWKhM371oTfwZnHgAOmhcOF/QioPSelQkAqwBGoHDvZazf5Obl1u5BAp8hVFfRW4MxO172
 d5Oy3Pi0G7lBrykl+aHhyJ4wBlB2kgVz+LoXJb9EsHNmhCPZE3TTZxK/6IliZrNhRCcCV59xg
 qqYB0glWrBNVhJ6iFhKPXb0joYjitBgQ6xBZdp2oX00snL3awZNG8o5ZqpWU5W1v3xO+1M/VH
 USPllwZO8dBWbp1e93wGMd+rziiWpito+7ga6Hd8iF1ddYsxT9mYZVoF71r0EgZiI1kPiT6ZK
 41r/VLCRLk11OeLzcWQQr15ybTP2PYlsegFclZOdL2fOHvJw47LWOpOSNAUzmCaqRE+a5PwDT
 QmVoZWN8zM9NsILUhFbXTmqwiczTh/Ej3RVZTk7MbGxTPHtOg8fRmu6cEcr+rbXnKoT3LZwv7
 eUoa568wo2Vq6ns6z68m9burZW2k1bkSeeXB4fHlkzfcgsCzoSob6B+SfZSZvpEK92GEHbIMK
 sDMzYbpIMyn+fRknUEBokoHgA0gOA57t3Qat9DcmB9O6GejRuXECeSKjrqspuazqp+ISI95UH
 f512bDw64csaT2Ybibxhn5oYq70uJ4aZGKc/jga9PSGPY=

--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: text/html; charset=UTF-8

<html><head></head><body><div style="font-family: Verdana;font-size: 12.0px;"><div>Hello.<br/>
<br/>
Following the advice of Andrew Cooper (thanks for helping out) over on OFTC.net in #xen, I&#39;ll post this here.<br/>
If this is the wrong place, please move it to the right section of your mailing lists.</div>

<div>&nbsp;</div>

<div>I got some problems running Xen 4.14.5 on Devuan 4.0.</div>

<div>&nbsp;</div>

<div>The&nbsp;AMD-Vi and I/O virtualisation are&nbsp;not being enabled when booting up the host system with Xen.</div>

<div>&nbsp;</div>

<div>Hardware used:</div>

<div>Mainboard: Gigabyte GA-890FXA-UD5, BIOS&nbsp;version F6 (2010.11.24, the latest version)</div>

<div>CPU:&nbsp;AMD Phenom&nbsp;II X4 910e</div>

<div>Memory: 16GB</div>

<div>Storage: 2TB Crucial MX500</div>

<div>&nbsp;</div>

<div>A short snippet of what I see when invoking &quot;xl dmesg&quot;:</div>

<div>&nbsp;</div>

<div>(XEN) No southbridge IO-APIC found in IVRS table<br/>
(XEN) AMD-Vi: Error initialization<br/>
(XEN) I/O virtualisation disabled&nbsp;</div>

<div>&nbsp;</div>

<div>What I would like to see (taken from Xen&nbsp;4.0.1 running on Debian Squeeze, in use since 2011):</div>

<div>&nbsp;</div>

<div>(XEN) IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0-23<br/>
(XEN) Enabling APIC mode: &nbsp;Flat. &nbsp;Using 1 I/O APICs<br/>
(XEN) Using scheduler: SMP Credit Scheduler (credit)<br/>
(XEN) Detected 2611.936 MHz processor.<br/>
(XEN) Initing memory sharing.<br/>
(XEN) HVM: ASIDs enabled.<br/>
(XEN) HVM: SVM enabled<br/>
(XEN) HVM: Hardware Assisted Paging detected.<br/>
(XEN) AMD-Vi: IOMMU 0 Enabled.<br/>
(XEN) I/O virtualisation enabled</div>

<div>&nbsp;</div>

<div>My question would be if this is&nbsp;&quot;normal&quot; behaviour due to older hardware being used with newer versions of Xen (compared to the old 4.0.1) or if this is&nbsp;a bug.</div>

<div>If the latter, has this been addressed already in newer version (4.14+)?</div>

<div>&nbsp;</div>

<div>I&#39;ll attach some log files (hypervisor.log, dom0.log, xl_info.log, lspci_vvv.log, acpi.dmp, ivrs.dat, ivrs.dsl).</div>

<div>&nbsp;</div>

<div>Thank you for your time.</div>

<div>&nbsp;</div>

<div>Kind regards,&nbsp;</div>

<div>Denis</div></div></body></html>
--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=acpi.dmp
Content-Transfer-Encoding: quoted-printable

SSDT @ 0x0000000000000000
    0000: 53 53 44 54 8C 08 00 00 01 10 50 54 4C 54 44 20  SSDT......PTLTD
    0010: 50 4F 57 45 52 4E 4F 57 01 00 00 00 20 4C 54 50  POWERNOW.... LT=
P
    0020: 01 00 00 00 10 49 21 5C 2E 5F 50 52 5F 43 30 30  .....I!\._PR_C0=
0
    0030: 30 08 5F 50 43 54 12 2C 02 11 14 0A 11 82 0C 00  0._PCT.,.......=
.
    0040: 7F 40 00 00 62 00 01 C0 00 00 00 00 79 00 11 14  .@..b.......y..=
.
    0050: 0A 11 82 0C 00 7F 40 00 00 00 00 00 00 00 00 00  ......@........=
.
    0060: 00 79 00 08 5F 50 53 53 12 47 08 04 12 20 06 0C  .y.._PSS.G... .=
.
    0070: 28 0A 00 00 0C 2A 3F 00 00 0C 04 00 00 00 0C 04  (....*?........=
.
    0080: 00 00 00 0C 00 00 00 00 0C 00 00 00 00 12 20 06  .............. =
.
    0090: 0C 6C 07 00 00 0C C3 32 00 00 0C 04 00 00 00 0C  .l.....2.......=
.
    00A0: 04 00 00 00 0C 01 00 00 00 0C 01 00 00 00 12 20  ...............
    00B0: 06 0C 78 05 00 00 0C 8A 2A 00 00 0C 04 00 00 00  ..x.....*......=
.
    00C0: 0C 04 00 00 00 0C 02 00 00 00 0C 02 00 00 00 12  ...............=
.
    00D0: 20 06 0C 20 03 00 00 0C D3 18 00 00 0C 04 00 00   .. ...........=
.
    00E0: 00 0C 04 00 00 00 0C 03 00 00 00 0C 03 00 00 00  ...............=
.
    00F0: 08 58 50 53 53 12 43 12 04 12 47 04 08 0C 28 0A  .XPSS.C...G...(=
.
    0100: 00 00 0C 2A 3F 00 00 0C 04 00 00 00 0C 04 00 00  ...*?..........=
.
    0110: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    0120: 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    0130: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    0140: 00 12 47 04 08 0C 6C 07 00 00 0C C3 32 00 00 0C  ..G...l.....2..=
.
    0150: 04 00 00 00 0C 04 00 00 00 11 0B 0A 08 01 00 00  ...............=
.
    0160: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    0170: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    0180: 08 00 00 00 00 00 00 00 00 12 47 04 08 0C 78 05  ..........G...x=
.
    0190: 00 00 0C 8A 2A 00 00 0C 04 00 00 00 0C 04 00 00  ....*..........=
.
    01A0: 00 11 0B 0A 08 02 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    01B0: 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    01C0: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    01D0: 00 12 47 04 08 0C 20 03 00 00 0C D3 18 00 00 0C  ..G... ........=
.
    01E0: 04 00 00 00 0C 04 00 00 00 11 0B 0A 08 03 00 00  ...............=
.
    01F0: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    0200: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    0210: 08 00 00 00 00 00 00 00 00 08 5F 50 53 44 12 18  .........._PSD.=
.
    0220: 01 12 15 05 0A 05 0A 00 0C 00 00 00 00 0C FC 00  ...............=
.
    0230: 00 00 0C 04 00 00 00 08 5F 50 50 43 0A 00 10 49  ........_PPC...=
I
    0240: 21 5C 2E 5F 50 52 5F 43 30 30 31 08 5F 50 43 54  !\._PR_C001._PC=
T
    0250: 12 2C 02 11 14 0A 11 82 0C 00 7F 40 00 00 62 00  .,.........@..b=
.
    0260: 01 C0 00 00 00 00 79 00 11 14 0A 11 82 0C 00 7F  ......y........=
.
    0270: 40 00 00 00 00 00 00 00 00 00 00 79 00 08 5F 50  @..........y.._=
P
    0280: 53 53 12 47 08 04 12 20 06 0C 28 0A 00 00 0C 2A  SS.G... ..(....=
*
    0290: 3F 00 00 0C 04 00 00 00 0C 04 00 00 00 0C 00 00  ?..............=
.
    02A0: 00 00 0C 00 00 00 00 12 20 06 0C 6C 07 00 00 0C  ........ ..l...=
.
    02B0: C3 32 00 00 0C 04 00 00 00 0C 04 00 00 00 0C 01  .2.............=
.
    02C0: 00 00 00 0C 01 00 00 00 12 20 06 0C 78 05 00 00  ......... ..x..=
.
    02D0: 0C 8A 2A 00 00 0C 04 00 00 00 0C 04 00 00 00 0C  ..*............=
.
    02E0: 02 00 00 00 0C 02 00 00 00 12 20 06 0C 20 03 00  .......... .. .=
.
    02F0: 00 0C D3 18 00 00 0C 04 00 00 00 0C 04 00 00 00  ...............=
.
    0300: 0C 03 00 00 00 0C 03 00 00 00 08 58 50 53 53 12  ...........XPSS=
.
    0310: 43 12 04 12 47 04 08 0C 28 0A 00 00 0C 2A 3F 00  C...G...(....*?=
.
    0320: 00 0C 04 00 00 00 0C 04 00 00 00 11 0B 0A 08 00  ...............=
.
    0330: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    0340: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11  ...............=
.
    0350: 0B 0A 08 00 00 00 00 00 00 00 00 12 47 04 08 0C  ............G..=
.
    0360: 6C 07 00 00 0C C3 32 00 00 0C 04 00 00 00 0C 04  l.....2........=
.
    0370: 00 00 00 11 0B 0A 08 01 00 00 00 00 00 00 00 11  ...............=
.
    0380: 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    0390: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    03A0: 00 00 00 12 47 04 08 0C 78 05 00 00 0C 8A 2A 00  ....G...x.....*=
.
    03B0: 00 0C 04 00 00 00 0C 04 00 00 00 11 0B 0A 08 02  ...............=
.
    03C0: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    03D0: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11  ...............=
.
    03E0: 0B 0A 08 00 00 00 00 00 00 00 00 12 47 04 08 0C  ............G..=
.
    03F0: 20 03 00 00 0C D3 18 00 00 0C 04 00 00 00 0C 04   ..............=
.
    0400: 00 00 00 11 0B 0A 08 03 00 00 00 00 00 00 00 11  ...............=
.
    0410: 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    0420: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    0430: 00 00 00 08 5F 50 53 44 12 18 01 12 15 05 0A 05  ...._PSD.......=
.
    0440: 0A 00 0C 00 00 00 00 0C FC 00 00 00 0C 04 00 00  ...............=
.
    0450: 00 08 5F 50 50 43 0A 00 10 49 21 5C 2E 5F 50 52  .._PPC...I!\._P=
R
    0460: 5F 43 30 30 32 08 5F 50 43 54 12 2C 02 11 14 0A  _C002._PCT.,...=
.
    0470: 11 82 0C 00 7F 40 00 00 62 00 01 C0 00 00 00 00  .....@..b......=
.
    0480: 79 00 11 14 0A 11 82 0C 00 7F 40 00 00 00 00 00  y.........@....=
.
    0490: 00 00 00 00 00 79 00 08 5F 50 53 53 12 47 08 04  .....y.._PSS.G.=
.
    04A0: 12 20 06 0C 28 0A 00 00 0C 2A 3F 00 00 0C 04 00  . ..(....*?....=
.
    04B0: 00 00 0C 04 00 00 00 0C 00 00 00 00 0C 00 00 00  ...............=
.
    04C0: 00 12 20 06 0C 6C 07 00 00 0C C3 32 00 00 0C 04  .. ..l.....2...=
.
    04D0: 00 00 00 0C 04 00 00 00 0C 01 00 00 00 0C 01 00  ...............=
.
    04E0: 00 00 12 20 06 0C 78 05 00 00 0C 8A 2A 00 00 0C  ... ..x.....*..=
.
    04F0: 04 00 00 00 0C 04 00 00 00 0C 02 00 00 00 0C 02  ...............=
.
    0500: 00 00 00 12 20 06 0C 20 03 00 00 0C D3 18 00 00  .... .. .......=
.
    0510: 0C 04 00 00 00 0C 04 00 00 00 0C 03 00 00 00 0C  ...............=
.
    0520: 03 00 00 00 08 58 50 53 53 12 43 12 04 12 47 04  .....XPSS.C...G=
.
    0530: 08 0C 28 0A 00 00 0C 2A 3F 00 00 0C 04 00 00 00  ..(....*?......=
.
    0540: 0C 04 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    0550: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    0560: 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    0570: 00 00 00 00 00 12 47 04 08 0C 6C 07 00 00 0C C3  ......G...l....=
.
    0580: 32 00 00 0C 04 00 00 00 0C 04 00 00 00 11 0B 0A  2..............=
.
    0590: 08 01 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    05A0: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    05B0: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 12 47 04  ..............G=
.
    05C0: 08 0C 78 05 00 00 0C 8A 2A 00 00 0C 04 00 00 00  ..x.....*......=
.
    05D0: 0C 04 00 00 00 11 0B 0A 08 02 00 00 00 00 00 00  ...............=
.
    05E0: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A  ...............=
.
    05F0: 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    0600: 00 00 00 00 00 12 47 04 08 0C 20 03 00 00 0C D3  ......G... ....=
.
    0610: 18 00 00 0C 04 00 00 00 0C 04 00 00 00 11 0B 0A  ...............=
.
    0620: 08 03 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00  ...............=
.
    0630: 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00  ...............=
.
    0640: 00 11 0B 0A 08 00 00 00 00 00 00 00 00 08 5F 50  .............._=
P
    0650: 53 44 12 18 01 12 15 05 0A 05 0A 00 0C 00 00 00  SD.............=
.
    0660: 00 0C FC 00 00 00 0C 04 00 00 00 08 5F 50 50 43  ............_PP=
C
    0670: 0A 00 10 49 21 5C 2E 5F 50 52 5F 43 30 30 33 08  ...I!\._PR_C003=
.
    0680: 5F 50 43 54 12 2C 02 11 14 0A 11 82 0C 00 7F 40  _PCT.,.........=
@
    0690: 00 00 62 00 01 C0 00 00 00 00 79 00 11 14 0A 11  ..b.......y....=
.
    06A0: 82 0C 00 7F 40 00 00 00 00 00 00 00 00 00 00 79  ....@..........=
y
    06B0: 00 08 5F 50 53 53 12 47 08 04 12 20 06 0C 28 0A  .._PSS.G... ..(=
.
    06C0: 00 00 0C 2A 3F 00 00 0C 04 00 00 00 0C 04 00 00  ...*?..........=
.
    06D0: 00 0C 00 00 00 00 0C 00 00 00 00 12 20 06 0C 6C  ............ ..=
l
    06E0: 07 00 00 0C C3 32 00 00 0C 04 00 00 00 0C 04 00  .....2.........=
.
    06F0: 00 00 0C 01 00 00 00 0C 01 00 00 00 12 20 06 0C  ............. .=
.
    0700: 78 05 00 00 0C 8A 2A 00 00 0C 04 00 00 00 0C 04  x.....*........=
.
    0710: 00 00 00 0C 02 00 00 00 0C 02 00 00 00 12 20 06  .............. =
.
    0720: 0C 20 03 00 00 0C D3 18 00 00 0C 04 00 00 00 0C  . .............=
.
    0730: 04 00 00 00 0C 03 00 00 00 0C 03 00 00 00 08 58  ...............=
X
    0740: 50 53 53 12 43 12 04 12 47 04 08 0C 28 0A 00 00  PSS.C...G...(..=
.
    0750: 0C 2A 3F 00 00 0C 04 00 00 00 0C 04 00 00 00 11  .*?............=
.
    0760: 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    0770: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    0780: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 12  ...............=
.
    0790: 47 04 08 0C 6C 07 00 00 0C C3 32 00 00 0C 04 00  G...l.....2....=
.
    07A0: 00 00 0C 04 00 00 00 11 0B 0A 08 01 00 00 00 00  ...............=
.
    07B0: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11  ...............=
.
    07C0: 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    07D0: 00 00 00 00 00 00 00 12 47 04 08 0C 78 05 00 00  ........G...x..=
.
    07E0: 0C 8A 2A 00 00 0C 04 00 00 00 0C 04 00 00 00 11  ..*............=
.
    07F0: 0B 0A 08 02 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    0800: 00 00 00 00 00 00 00 11 0B 0A 08 00 00 00 00 00  ...............=
.
    0810: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 12  ...............=
.
    0820: 47 04 08 0C 20 03 00 00 0C D3 18 00 00 0C 04 00  G... ..........=
.
    0830: 00 00 0C 04 00 00 00 11 0B 0A 08 03 00 00 00 00  ...............=
.
    0840: 00 00 00 11 0B 0A 08 00 00 00 00 00 00 00 00 11  ...............=
.
    0850: 0B 0A 08 00 00 00 00 00 00 00 00 11 0B 0A 08 00  ...............=
.
    0860: 00 00 00 00 00 00 00 08 5F 50 53 44 12 18 01 12  ........_PSD...=
.
    0870: 15 05 0A 05 0A 00 0C 00 00 00 00 0C FC 00 00 00  ...............=
.
    0880: 0C 04 00 00 00 08 5F 50 50 43 0A 00              ......_PPC..

MCFG @ 0x0000000000000000
    0000: 4D 43 46 47 3C 00 00 00 01 34 47 42 54 20 20 20  MCFG<....4GBT
    0010: 47 42 54 55 41 43 50 49 31 2E 30 42 47 42 54 55  GBTUACPI1.0BGBT=
U
    0020: 01 01 01 01 00 00 00 00 00 00 00 00 00 00 00 E0  ...............=
.
    0030: 00 00 00 00 00 00 00 FF 00 00 00 00              ............

APIC @ 0x0000000000000000
    0000: 41 50 49 43 BC 00 00 00 01 B6 47 42 54 20 20 20  APIC......GBT
    0010: 47 42 54 55 41 43 50 49 31 2E 30 42 47 42 54 55  GBTUACPI1.0BGBT=
U
    0020: 01 01 01 01 00 00 E0 FE 01 00 00 00 00 08 00 00  ...............=
.
    0030: 01 00 00 00 00 08 01 01 01 00 00 00 00 08 02 02  ...............=
.
    0040: 01 00 00 00 00 08 03 03 01 00 00 00 00 08 04 04  ...............=
.
    0050: 00 00 00 00 00 08 05 05 00 00 00 00 00 08 06 06  ...............=
.
    0060: 00 00 00 00 00 08 07 07 00 00 00 00 01 0C 08 00  ...............=
.
    0070: 00 00 C0 FE 00 00 00 00 02 0A 00 00 02 00 00 00  ...............=
.
    0080: 00 00 02 0A 00 09 09 00 00 00 0F 00 04 06 00 00  ...............=
.
    0090: 00 01 04 06 01 00 00 01 04 06 02 00 00 01 04 06  ...............=
.
    00A0: 03 00 00 01 04 06 04 00 00 01 04 06 05 00 00 01  ...............=
.
    00B0: 04 06 06 00 00 01 04 06 07 00 00 01              ............

IVRS @ 0x0000000000000000
    0000: 49 56 52 53 C0 00 00 00 01 AC 41 4D 44 20 20 00  IVRS......AMD  =
.
    0010: 52 44 38 39 30 53 00 00 31 20 20 00 41 4D 44 20  RD890S..1  .AMD
    0020: 00 00 00 00 00 34 20 00 00 00 00 00 00 00 00 00  .....4 ........=
.
    0030: 10 3E 90 00 02 00 40 00 00 00 C3 FE 00 00 00 00  .>....@........=
.
    0040: 00 00 00 13 00 00 00 00 03 00 00 00 04 02 00 00  ...............=
.
    0050: 02 10 00 00 03 00 01 00 04 01 01 00 02 28 00 00  .............(.=
.
    0060: 02 30 00 00 02 38 00 00 02 00 04 00 02 68 00 00  .0...8.......h.=
.
    0070: 03 00 05 00 04 03 05 00 02 88 00 00 03 90 00 00  ...............=
.
    0080: 04 92 00 00 03 98 00 00 04 9A 00 00 02 A0 00 D7  ...............=
.
    0090: 02 A3 00 00 02 A4 00 00 43 00 06 00 00 A4 00 00  ........C......=
.
    00A0: 04 FF 06 00 02 A5 00 00 03 B0 00 00 04 B2 00 00  ...............=
.
    00B0: 48 00 00 D7 00 A0 00 02 48 00 00 00 08 01 00 01  H.......H......=
.

DSDT @ 0x0000000000000000
    0000: 44 53 44 54 E3 7B 00 00 01 CE 47 42 54 20 20 20  DSDT.{....GBT
    0010: 47 42 54 55 41 43 50 49 00 10 00 00 4D 53 46 54  GBTUACPI....MSF=
T
    0020: 00 00 00 03 10 4F 09 5C 5F 50 52 5F 5B 83 11 5C  .....O.\_PR_[..=
\
    0030: 2E 5F 50 52 5F 43 30 30 30 00 10 08 00 00 06 5B  ._PR_C000......=
[
    0040: 83 11 5C 2E 5F 50 52 5F 43 30 30 31 01 10 08 00  ..\._PR_C001...=
.
    0050: 00 06 5B 83 11 5C 2E 5F 50 52 5F 43 30 30 32 02  ..[..\._PR_C002=
.
    0060: 10 08 00 00 06 5B 83 11 5C 2E 5F 50 52 5F 43 30  .....[..\._PR_C=
0
    0070: 30 33 03 10 08 00 00 06 5B 83 11 5C 2E 5F 50 52  03......[..\._P=
R
    0080: 5F 43 30 30 34 04 10 08 00 00 06 5B 83 11 5C 2E  _C004......[..\=
.
    0090: 5F 50 52 5F 43 30 30 35 05 10 08 00 00 06 5B 83  _PR_C005......[=
.
    00A0: 11 5C 2E 5F 50 52 5F 43 30 30 36 06 10 08 00 00  .\._PR_C006....=
.
    00B0: 06 5B 83 11 5C 2E 5F 50 52 5F 43 30 30 37 07 10  .[..\._PR_C007.=
.
    00C0: 08 00 00 06 08 5C 5F 53 30 5F 12 0A 04 0A 00 0A  .....\_S0_.....=
.
    00D0: 00 0A 00 0A 00 08 5C 5F 53 33 5F 12 0A 04 0A 03  ......\_S3_....=
.
    00E0: 0A 01 0A 01 0A 01 08 5C 5F 53 34 5F 12 0A 04 0A  .......\_S4_...=
.
    00F0: 04 0A 04 0A 04 0A 04 08 5C 5F 53 35 5F 12 0A 04  ........\_S5_..=
.
    0100: 0A 05 0A 05 0A 05 0A 05 5B 80 5C 44 45 42 47 01  ........[.\DEBG=
.
    0110: 0A 80 0A 01 5B 81 0C 5C 44 45 42 47 01 44 42 47  ....[..\DEBG.DB=
G
    0120: 31 08 08 4F 53 54 59 FF 5B 80 41 43 4D 53 01 0A  1..OSTY.[.ACMS.=
.
    0130: 72 0A 10 5B 81 18 41 43 4D 53 01 49 43 4D 53 08  r..[..ACMS.ICMS=
.
    0140: 44 43 4D 53 08 00 40 06 50 38 30 5F 08 5B 86 15  DCMS..@.P80_.[.=
.
    0150: 49 43 4D 53 44 43 4D 53 01 00 08 00 18 00 20 42  ICMSDCMS...... =
B
    0160: 53 5F 41 20 5B 80 43 46 47 53 00 42 53 5F 41 0B  S_A [.CFGS.BS_A=
.
    0170: 00 01 5B 81 40 07 43 46 47 53 00 00 40 06 50 43  ..[.@.CFGS..@.P=
C
    0180: 49 45 20 00 48 37 00 05 47 47 4E 32 01 00 3A 47  IE .H7..GGN2..:=
G
    0190: 45 43 45 01 49 52 5F 45 01 00 4E 05 00 05 4F 53  ECE.IR_E..N...O=
S
    01A0: 43 46 01 00 42 05 50 52 53 30 01 44 45 54 30 01  CF..B.PRS0.DET0=
.
    01B0: 00 1E 50 52 53 31 01 44 45 54 31 01 00 1E 50 52  ..PRS1.DET1...P=
R
    01C0: 53 32 01 44 45 54 32 01 00 1E 50 52 53 33 01 44  S2.DET2...PRS3.=
D
    01D0: 45 54 33 01 00 3E 00 06 41 42 50 53 01 00 03 47  ET3..>..ABPS...=
G
    01E0: 50 50 53 01 5B 80 43 4D 50 54 01 0B 50 0C 0A 03  PPS.[.CMPT..P..=
.
    01F0: 5B 81 3A 43 4D 50 54 01 43 4D 49 44 08 00 06 47  [.:CMPT.CMID...=
G
    0200: 50 43 54 02 47 50 30 49 01 47 50 31 49 01 47 50  PCT.GP0I.GP1I.G=
P
    0210: 32 49 01 47 50 33 49 01 47 50 34 49 01 47 50 35  2I.GP3I.GP4I.GP=
5
    0220: 49 01 47 50 36 49 01 47 50 37 49 01 5B 80 50 43  I.GP6I.GP7I.[.P=
C
    0230: 46 47 00 50 43 49 45 0C 00 00 00 02 5B 81 49 0B  FG.PCIE.....[.I=
.
    0240: 50 43 46 47 00 00 C0 3C 00 01 00 10 50 4D 53 41  PCFG...<....PMS=
A
    0250: 01 00 8F FE 3F 00 10 50 4D 53 42 01 00 8F FE FF  ....?..PMSB....=
.
    0260: 00 10 50 4D 53 43 01 00 CF C7 FF 01 53 54 43 4C  ..PMSC......STC=
L
    0270: 10 00 40 78 52 4D 42 41 20 00 80 82 BF 53 4D 49  ..@xRMBA ....SM=
I
    0280: 45 01 53 4D 4D 45 01 00 1E 52 56 49 44 08 00 48  E.SMME...RVID..=
H
    0290: 05 53 4D 42 31 20 00 40 35 00 02 47 33 31 4F 01  .SMB1 .@5..G31O=
.
    02A0: 00 45 2F 00 06 41 43 49 52 01 00 81 91 1F 50 43  .E/..ACIR.....P=
C
    02B0: 4D 44 02 00 8E 3A 20 50 4D 53 30 01 00 4F 06 54  MD...: PMS0..O.=
T
    02C0: 4C 53 30 04 00 8C F8 07 50 4D 53 31 01 00 4F 06  LS0.....PMS1..O=
.
    02D0: 54 4C 53 31 04 00 8C F8 07 50 4D 53 32 01 00 4F  TLS1.....PMS2..=
O
    02E0: 06 54 4C 53 32 04 00 8C F8 07 50 4D 53 33 01 00  .TLS2.....PMS3.=
.
    02F0: 4F 06 54 4C 53 33 04 5B 80 52 4D 45 4D 00 52 4D  O.TLS3.[.RMEM.R=
M
    0300: 42 41 0B 00 02 5B 81 0D 52 4D 45 4D 00 00 20 52  BA...[..RMEM.. =
R
    0310: 4D 4C 4E 20 5B 80 50 4D 49 4F 01 0B D6 0C 0A 02  MLN [.PMIO.....=
.
    0320: 5B 81 10 50 4D 49 4F 01 49 4E 50 4D 08 44 41 50  [..PMIO.INPM.DA=
P
    0330: 4D 08 5B 86 1A 49 4E 50 4D 44 41 50 4D 01 00 40  M.[..INPMDAPM..=
@
    0340: 12 4D 4D 53 4F 20 00 40 1C 50 31 45 42 10 5B 80  .MMSO .@.P1EB.[=
.
    0350: 45 52 4D 4D 00 4D 4D 53 4F 0B 00 10 5B 81 43 0A  ERMM.MMSO...[.C=
.
    0360: 45 52 4D 4D 00 00 40 99 00 07 47 50 35 31 01 00  ERMM..@...GP51.=
.
    0370: 18 00 07 47 50 35 35 01 00 18 00 07 47 50 35 39  ...GP55.....GP5=
9
    0380: 01 00 10 47 50 36 32 08 00 08 00 07 47 50 36 34  ...GP62.....GP6=
4
    0390: 01 00 40 15 00 07 47 45 31 31 01 00 07 47 45 31  ..@...GE11...GE=
1
    03A0: 32 01 00 10 00 07 42 41 54 53 01 00 40 8C 00 01  2.....BATS..@..=
.
    03B0: 43 4C 50 53 01 00 46 08 00 07 47 31 35 41 01 00  CLPS..F...G15A.=
.
    03C0: 40 0B 00 02 53 4C 50 53 02 00 44 63 45 50 4E 4D  @...SLPS..DcEPN=
M
    03D0: 01 44 50 50 46 01 00 4E 21 00 06 50 57 44 45 01  .DPPF..N!..PWDE=
.
    03E0: 00 11 00 05 41 4C 4C 53 01 00 4A 18 50 48 59 44  ....ALLS..J.PHY=
D
    03F0: 01 00 01 00 01 55 53 35 52 01 00 2C 47 45 43 44  .....US5R..,GEC=
D
    0400: 01 5B 80 41 42 49 4F 01 0B D8 0C 0A 08 5B 81 10  .[.ABIO......[.=
.
    0410: 41 42 49 4F 03 49 4E 41 42 20 44 41 41 42 20 14  ABIO.INAB DAAB =
.
    0420: 11 52 44 41 42 01 70 68 49 4E 41 42 A4 44 41 41  .RDAB.phINAB.DA=
A
    0430: 42 14 12 57 54 41 42 02 70 68 49 4E 41 42 70 69  B..WTAB.phINABp=
i
    0440: 44 41 41 42 14 18 52 57 41 42 03 7B 52 44 41 42  DAAB..RWAB.{RDA=
B
    0450: 68 69 60 7D 60 6A 61 57 54 41 42 68 61 14 1A 43  hi`}`jaWTABha..=
C
    0460: 41 42 52 03 79 68 0A 05 60 72 60 69 61 79 61 0A  ABR.yh..`r`iaya=
.
    0470: 18 62 72 62 6A 63 A4 63 14 4B 15 47 48 50 53 02  .brbjc.c.K.GHPS=
.
    0480: A0 46 07 93 68 0A 00 A0 35 93 69 0A 00 52 57 41  .F..h...5.i..RW=
A
    0490: 42 43 41 42 52 0A 06 0A 00 0A C0 0C FF EF FF FF  BCABR..........=
.
    04A0: 0A 00 52 57 41 42 43 41 42 52 0A 01 0A 00 0A 65  ..RWABCABR.....=
e
    04B0: 0C FE FE FF FF 0A 00 70 01 44 45 54 30 A0 35 93  .......p.DET0.5=
.
    04C0: 69 0A 02 52 57 41 42 43 41 42 52 0A 06 0A 00 0A  i..RWABCABR....=
.
    04D0: C0 0C FF BF FF FF 0A 00 52 57 41 42 43 41 42 52  ........RWABCAB=
R
    04E0: 0A 01 0A 00 0A 65 0C FB FB FF FF 0A 00 70 01 44  .....e.......p.=
D
    04F0: 45 54 32 5B 21 0A C8 A0 4A 07 93 68 0A 01 A0 37  ET2[!...J..h...=
7
    0500: 93 69 0A 00 52 57 41 42 43 41 42 52 0A 06 0A 00  .i..RWABCABR...=
.
    0510: 0A C0 0C FF EF FF FF 0B 00 10 52 57 41 42 43 41  ..........RWABC=
A
    0520: 42 52 0A 01 0A 00 0A 65 0C FE FE FF FF 0B 01 01  BR.....e.......=
.
    0530: 70 00 44 45 54 30 A0 37 93 69 0A 02 52 57 41 42  p.DET0.7.i..RWA=
B
    0540: 43 41 42 52 0A 06 0A 00 0A C0 0C FF BF FF FF 0B  CABR...........=
.
    0550: 00 40 52 57 41 42 43 41 42 52 0A 01 0A 00 0A 65  .@RWABCABR.....=
e
    0560: 0C FB FB FF FF 0B 04 04 70 00 44 45 54 32 5B 21  ........p.DET2[=
!
    0570: 0A C8 A0 41 06 47 47 4E 32 A0 4A 05 93 68 0A 00  ...A.GGN2.J..h.=
.
    0580: 47 45 4E 32 70 52 44 41 42 43 41 42 52 0A 03 0A  GEN2pRDABCABR..=
.
    0590: 02 0A A5 60 7B 60 0A FF 60 70 0B F4 01 61 A2 2A  ...`{`..`p...a.=
*
    05A0: 90 94 61 0A 00 92 93 60 0A 10 70 52 44 41 42 43  ..a....`..pRDAB=
C
    05B0: 41 42 52 0A 03 0A 02 0A A5 60 7B 60 0A FF 60 76  ABR......`{`..`=
v
    05C0: 61 5B 21 0A C8 5B 21 0A C8 A0 0A 92 93 60 0A 10  a[!..[!......`.=
.
    05D0: 47 45 4E 31 14 4F 06 47 45 4E 32 00 70 0A 02 54  GEN1.O.GEN2.p..=
T
    05E0: 4C 53 32 52 57 41 42 43 41 42 52 0A 03 0A 02 0A  LS2RWABCABR....=
.
    05F0: A4 0C FE FF FF FF 0A 01 52 57 41 42 43 41 42 52  ........RWABCAB=
R
    0600: 0A 03 0A 02 0A A2 0C FF DF FF FF 0B 00 20 52 57  ............. R=
W
    0610: 41 42 43 41 42 52 0A 03 0A 02 0A C0 0C FF 7F FF  ABCABR.........=
.
    0620: FF 0B 00 80 52 57 41 42 43 41 42 52 0A 03 0A 02  ....RWABCABR...=
.
    0630: 0A A4 0C FF FF FF DF 0C 00 00 00 20 5B 21 0A C8  ........... [!.=
.
    0640: 5B 21 0A C8 14 41 04 47 45 4E 31 00 70 0A 01 54  [!...A.GEN1.p..=
T
    0650: 4C 53 32 52 57 41 42 43 41 42 52 0A 03 0A 02 0A  LS2RWABCABR....=
.
    0660: A4 0C FE FF FF FF 0A 00 52 57 41 42 43 41 42 52  ........RWABCAB=
R
    0670: 0A 03 0A 02 0A A2 0C FF DF FF FF 0B 00 20 5B 21  ............. [=
!
    0680: 0A C8 5B 21 0A C8 5B 80 50 31 45 30 01 50 31 45  ..[!..[.P1E0.P1=
E
    0690: 42 0A 04 5B 81 19 50 31 45 30 01 00 0E 50 45 57  B..[..P1E0...PE=
W
    06A0: 53 01 57 53 54 41 01 00 0E 50 45 57 44 01 14 24  S.WSTA...PEWD..=
$
    06B0: 53 50 54 53 01 70 0A 01 50 43 4D 44 7D 68 0A F0  SPTS.p..PCMD}h.=
.
    06C0: 50 38 30 5F 43 50 4D 53 43 50 4D 53 70 0A 01 50  P80_CPMSCPMSp..=
P
    06D0: 45 57 53 14 15 53 57 41 4B 01 43 50 4D 53 43 50  EWS..SWAK.CPMSC=
P
    06E0: 4D 53 70 0A 01 50 45 57 53 14 06 54 52 4D 44 01  MSp..PEWS..TRMD=
.
    06F0: 14 41 04 43 50 4D 53 00 A0 39 93 45 50 4E 4D 0A  .A.CPMS..9.EPNM=
.
    0700: 00 70 0A 01 50 4D 53 41 70 0A 01 50 4D 53 42 70  .p..PMSAp..PMSB=
p
    0710: 0A 01 50 4D 53 43 70 0A 01 50 4D 53 30 70 0A 01  ..PMSCp..PMS0p.=
.
    0720: 50 4D 53 31 70 0A 01 50 4D 53 32 70 0A 01 50 4D  PMS1p..PMS2p..P=
M
    0730: 53 33 10 06 5C 5F 47 50 45 10 82 BF 02 5C 00 08  S3..\_GPE....\.=
.
    0740: 53 42 41 31 0B 00 0B 08 53 42 41 32 0B 10 0B 08  SBA1....SBA2...=
.
    0750: 53 49 4F 50 0A 2E 08 47 49 4F 42 0B 20 02 08 43  SIOP...GIOB. ..=
C
    0760: 43 4D 53 0A F0 5B 80 4E 43 4C 4B 00 50 43 49 45  CMS..[.NCLK.PCI=
E
    0770: 0C 00 00 00 02 5B 81 43 0A 4E 43 4C 4B 00 00 40  .....[.C.NCLK..=
@
    0780: 26 43 4C 4B 45 01 00 8F FD 07 50 33 48 48 0C 00  &CLKE.....P3HH.=
.
    0790: 13 50 33 45 45 01 50 34 45 4E 01 50 34 4E 4D 0C  .P3EE.P4EN.P4NM=
.
    07A0: 50 34 48 49 0C 50 34 49 4F 01 00 06 50 35 45 4E  P4HI.P4IO...P5E=
N
    07B0: 01 50 35 4E 4D 0C 50 35 48 49 0C 50 35 49 4F 01  .P5NM.P5HI.P5IO=
.
    07C0: 00 06 50 36 45 4E 01 50 36 4E 4D 0C 50 36 48 49  ..P6EN.P6NM.P6H=
I
    07D0: 0C 50 36 49 4F 01 00 46 2C 50 31 4E 4D 0C 50 31  .P6IO..F,P1NM.P=
1
    07E0: 48 49 0C 50 31 45 4E 01 50 31 49 4F 01 00 06 50  HI.P1EN.P1IO...=
P
    07F0: 32 4E 4D 0C 50 32 48 49 0C 50 32 45 4E 01 50 32  2NM.P2HI.P2EN.P=
2
    0800: 49 4F 01 00 46 0A 50 33 45 4E 01 50 33 4E 4D 0C  IO..F.P3EN.P3NM=
.
    0810: 50 33 48 49 0C 50 33 49 4F 01 5B 80 53 4F 52 31  P3HI.P3IO.[.SOR=
1
    0820: 01 53 42 41 31 0A 10 5B 81 48 04 53 4F 52 31 01  .SBA1..[.H.SOR1=
.
    0830: 53 4D 53 41 08 53 53 53 41 08 53 42 43 41 08 53  SMSA.SSSA.SBCA.=
S
    0840: 48 43 41 08 53 42 41 41 08 53 44 30 41 08 53 44  HCA.SBAA.SD0A.S=
D
    0850: 31 41 08 53 42 44 41 08 53 53 43 41 08 53 4D 43  1A.SBDA.SSCA.SM=
C
    0860: 41 08 53 53 45 41 10 53 53 44 41 10 53 4D 54 41  A.SSEA.SSDA.SMT=
A
    0870: 08 5B 80 53 4F 52 32 01 53 42 41 32 0A 10 5B 81  .[.SOR2.SBA2..[=
.
    0880: 48 04 53 4F 52 32 01 53 4D 53 42 08 53 53 53 42  H.SOR2.SMSB.SSS=
B
    0890: 08 53 42 43 42 08 53 48 43 42 08 53 42 41 42 08  .SBCB.SHCB.SBAB=
.
    08A0: 53 44 30 42 08 53 44 31 42 08 53 42 44 42 08 53  SD0B.SD1B.SBDB.=
S
    08B0: 53 43 42 08 53 4D 43 42 08 53 53 45 42 10 53 53  SCB.SMCB.SSEB.S=
S
    08C0: 44 42 10 53 4D 54 42 08 5B 01 4D 53 4D 42 00 14  DB.SMTB.[.MSMB.=
.
    08D0: 40 15 52 57 42 4B 05 5B 23 4D 53 4D 42 FF FF A0  @.RWBK.[#MSMB..=
.
    08E0: 41 13 93 68 0A 00 70 53 4D 53 41 60 7B 60 0A 00  A..h..pSMSA`{`.=
.
    08F0: 60 7D 60 0A FF 60 70 60 53 4D 53 41 5B 22 0A 02  `}`..`p`SMSA[".=
.
    0900: 70 53 42 41 41 60 7B 60 0A 00 60 7D 60 69 60 70  pSBAA`{`..`}`i`=
p
    0910: 60 53 42 41 41 5B 22 0A 02 70 53 48 43 41 60 7B  `SBAA["..pSHCA`=
{
    0920: 60 0A 00 60 7D 60 6A 60 70 60 53 48 43 41 5B 22  `..`}`j`p`SHCA[=
"
    0930: 0A 02 70 53 42 43 41 60 7B 60 0A 00 60 7D 60 0A  ..pSBCA`{`..`}`=
.
    0940: 14 60 70 60 53 42 43 41 5B 22 0A 02 70 53 44 30  .`p`SBCA["..pSD=
0
    0950: 41 60 7B 60 0A 00 60 7D 60 6B 60 70 60 53 44 30  A`{`..`}`k`p`SD=
0
    0960: 41 5B 22 0A 02 7B 69 0A 01 61 A0 23 93 61 0A 00  A["..{i..a.#.a.=
.
    0970: 70 6B 62 70 6A 63 A2 17 62 70 83 88 6C 63 00 64  pkbpjc..bp..lc.=
d
    0980: 70 64 53 42 44 41 5B 22 0A 02 76 62 75 63 70 53  pdSBDA["..vbucp=
S
    0990: 42 43 41 60 7B 60 0A 00 60 7D 60 0A 54 60 70 60  BCA`{`..`}`.T`p=
`
    09A0: 53 42 43 41 5B 22 0A 02 70 53 4D 53 41 61 A2 29  SBCA["..pSMSAa.=
)
    09B0: 92 7B 61 0A 01 00 70 53 4D 53 41 61 A0 0F 7B 61  .{a...pSMSAa..{=
a
    09C0: 0A 1C 00 5B 27 4D 53 4D 42 A4 0A 01 A0 07 7B 61  ...['MSMB.....{=
a
    09D0: 0A 02 00 A5 5B 22 0A 02 70 53 4D 53 41 61 A2 10  ....["..pSMSAa.=
.
    09E0: 7B 61 0A 01 00 70 53 4D 53 41 61 5B 22 0A 02 7B  {a...pSMSAa["..=
{
    09F0: 69 0A 01 61 A0 1C 61 70 6A 61 70 6B 62 A2 13 62  i..a..apjapkb..=
b
    0A00: 70 53 42 44 41 88 6C 61 00 5B 22 0A 02 75 61 76  pSBDA.la.["..ua=
v
    0A10: 62 A0 05 93 68 0A 01 5B 27 4D 53 4D 42 A4 0A 00  b...h..['MSMB..=
.
    0A20: 5B 80 49 4F 4F 52 01 53 49 4F 50 0A 02 5B 81 10  [.IOOR.SIOP..[.=
.
    0A30: 49 4F 4F 52 01 49 4F 49 44 08 49 4F 44 54 08 5B  IOOR.IOID.IODT.=
[
    0A40: 80 47 42 4F 52 01 47 49 4F 42 0A 02 5B 81 14 47  .GBOR.GIOB..[..=
G
    0A50: 42 4F 52 01 00 08 00 05 47 50 32 35 01 47 50 32  BOR.....GP25.GP=
2
    0A60: 36 01 14 11 52 53 49 4F 01 70 68 49 4F 49 44 A4  6...RSIO.phIOID=
.
    0A70: 49 4F 44 54 14 12 57 53 49 4F 02 70 68 49 4F 49  IODT..WSIO.phIO=
I
    0A80: 44 70 69 49 4F 44 54 14 16 52 57 49 4F 03 57 53  DpiIODT..RWIO.W=
S
    0A90: 49 4F 68 7D 7B 52 53 49 4F 68 69 00 6A 00 08 49  IOh}{RSIOhi.j..=
I
    0AA0: 50 53 57 12 18 02 12 0A 04 0A 87 0A 01 0A 55 0A  PSW...........U=
.
    0AB0: 55 12 0A 04 0A 87 0A 01 0A 55 0A AA 14 4A 04 53  U........U...J.=
S
    0AC0: 4C 44 4E 01 70 0A 00 61 A0 0C 93 53 49 4F 50 0A  LDN.p..a...SIOP=
.
    0AD0: 2E 70 0A 00 61 A0 0C 93 53 49 4F 50 0A 4E 70 0A  .p..a...SIOP.Np=
.
    0AE0: 01 61 70 0A 00 60 A2 19 92 93 60 0A 04 70 83 88  .ap..`....`..p.=
.
    0AF0: 83 88 49 50 53 57 61 00 60 00 49 4F 49 44 75 60  ..IPSWa.`.IOIDu=
`
    0B00: 57 53 49 4F 0A 07 68 14 11 41 50 54 53 01 5C 2E  WSIO..h..APTS.\=
.
    0B10: 41 4F 44 5F 41 50 54 53 68 14 11 41 57 41 4B 01  AOD_APTSh..AWAK=
.
    0B20: 5C 2E 41 4F 44 5F 41 57 41 4B 68 5B 82 8F 7F 02  \.AOD_AWAKh[...=
.
    0B30: 41 4F 44 5F 08 44 42 47 5F 0A 01 08 4F 42 49 44  AOD_.DBG_...OBI=
D
    0B40: 12 41 09 1C 0A 07 0C 00 00 01 01 0C 00 00 02 01  .A.............=
.
    0B50: 0C 00 00 01 02 0C 00 00 02 02 0C 00 00 03 02 0C  ...............=
.
    0B60: 00 00 04 02 0C 00 00 05 02 0A 00 0A 00 0A 01 0A  ...............=
.
    0B70: 01 0A 00 0A 00 0A 00 0A 00 0A 00 0A FF 0A FF 0D  ...............=
.
    0B80: 43 50 55 20 43 6C 6F 63 6B 00 0D 50 43 49 45 20  CPU Clock..PCIE
    0B90: 43 6C 6F 63 6B 00 0D 56 43 43 31 38 20 43 6F 72  Clock..VCC18 Co=
r
    0BA0: 65 00 0D 53 42 20 43 6F 72 65 00 0D 4D 65 6D 6F  e..SB Core..Mem=
o
    0BB0: 72 79 20 43 6F 72 65 00 0D 56 44 44 41 32 35 20  ry Core..VDDA25
    0BC0: 43 6F 72 65 00 0D 4E 42 20 43 6F 72 65 00 0D 00  Core..NB Core..=
.
    0BD0: 0D 00 08 4F 42 49 54 12 49 0A 30 0C 00 00 01 01  ...OBIT.I.0....=
.
    0BE0: 0C 40 0D 03 00 0C 20 A1 07 00 0A 00 0B E8 03 0A  .@.... ........=
.
    0BF0: 00 0C 00 00 02 01 0C A0 86 01 00 0C F0 49 02 00  .............I.=
.
    0C00: 0A 00 0B E8 03 0A 00 0C 00 00 01 02 0C 20 BF 02  ............. .=
.
    0C10: 00 0C 50 34 03 00 0A 00 0B D0 07 0A 00 0C 00 00  ..P4...........=
.
    0C20: 02 02 0C C0 D4 01 00 0C 50 3A 02 00 0A 00 0B D0  ........P:.....=
.
    0C30: 07 0A 00 0C 00 00 03 02 0C D8 4D 02 00 0C 68 AD  ..........M...h=
.
    0C40: 03 00 0A 00 0B D0 07 0A 00 0C 00 00 04 02 0C 90  ...............=
.
    0C50: D0 03 00 0C F0 BA 04 00 0A 00 0B A0 0F 0A 00 0C  ...............=
.
    0C60: 00 00 05 02 0C 38 C1 01 00 0C 68 36 02 00 0A 00  .....8....h6...=
.
    0C70: 0B D0 07 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    0C80: 00 08 4F 42 44 54 12 04 01 0A 00 14 06 42 4D 30  ..OBDT.......BM=
0
    0C90: 31 00 14 06 58 49 4E 49 00 14 06 45 4D 30 31 00  1...XINI...EM01=
.
    0CA0: 14 06 42 4D 30 35 01 14 06 45 4D 30 35 01 14 06  ..BM05...EM05..=
.
    0CB0: 48 4D 30 36 00 14 06 48 4D 30 37 01 08 51 4C 53  HM06...HM07..QL=
S
    0CC0: 54 12 43 07 03 0A 02 12 35 06 0B CA 40 0D 42 61  T.C.....5...@.B=
a
    0CD0: 6E 6B 20 53 77 69 7A 7A 6C 65 20 4D 6F 64 65 00  nk Swizzle Mode=
.
    0CE0: 0A 00 0A 02 11 0C 0A 09 44 69 73 61 62 6C 65 64  ........Disable=
d
    0CF0: 00 11 0B 0A 08 45 6E 61 62 6C 65 64 00 12 37 06  .....Enabled..7=
.
    0D00: 0B CD 80 0D 44 44 52 33 20 4D 65 6D 6F 72 79 20  ....DDR3 Memory
    0D10: 50 72 6F 66 69 6C 65 00 0A 00 0A 02 11 0C 0A 09  Profile........=
.
    0D20: 44 69 73 61 62 6C 65 64 00 11 0B 0A 08 45 6E 61  Disabled.....En=
a
    0D30: 62 6C 65 64 00 5B 80 41 4F 44 54 00 0C F2 97 CF  bled.[.AODT....=
.
    0D40: CF 0B 00 01 5B 81 22 41 4F 44 54 00 41 53 43 44  ....[."AODT.ASC=
D
    0D50: 10 41 53 54 53 20 00 10 41 53 42 46 40 3C 47 46  .ASTS ..ASBF@<G=
F
    0D60: 58 4F 01 47 4D 4F 44 02 08 49 44 30 31 0A 00 08  XO.GMOD..ID01..=
.
    0D70: 49 44 30 32 0A 00 14 20 53 4F 49 44 01 7A 68 0A  ID02... SOID.zh=
.
    0D80: 18 49 44 30 31 7A 7B 68 0C 00 00 FF 00 00 0A 10  .ID01z{h.......=
.
    0D90: 49 44 30 32 A4 0A 00 14 4A 0B 57 52 4F 57 04 08  ID02....J.WROW.=
.
    0DA0: 49 46 50 4B 12 0E 06 0A 00 0A 00 0A 00 0A 00 0A  IFPK...........=
.
    0DB0: 00 0A 00 8A 68 0A 00 42 55 46 30 8A 68 0A 04 42  ....h..BUF0.h..=
B
    0DC0: 55 46 31 8A 68 0A 08 42 55 46 32 8A 68 0A 0C 42  UF1.h..BUF2.h..=
B
    0DD0: 55 46 33 8A 68 0A 10 42 55 46 34 8A 68 0A 14 42  UF3.h..BUF4.h..=
B
    0DE0: 55 46 35 70 42 55 46 30 88 49 46 50 4B 0A 00 00  UF5pBUF0.IFPK..=
.
    0DF0: 70 42 55 46 31 88 49 46 50 4B 0A 01 00 70 42 55  pBUF1.IFPK...pB=
U
    0E00: 46 32 88 49 46 50 4B 0A 02 00 70 42 55 46 33 88  F2.IFPK...pBUF3=
.
    0E10: 49 46 50 4B 0A 03 00 70 42 55 46 34 88 49 46 50  IFPK...pBUF4.IF=
P
    0E20: 4B 0A 04 00 70 42 55 46 35 88 49 46 50 4B 0A 05  K...pBUF5.IFPK.=
.
    0E30: 00 70 6B 60 70 0A 00 61 A2 19 60 70 83 88 49 46  .pk`p..a..`p..I=
F
    0E40: 50 4B 61 00 88 69 72 77 6A 6B 00 61 00 00 75 61  PKa..irwjk.a..u=
a
    0E50: 76 60 14 40 0C 47 52 4F 57 04 08 49 46 50 4B 12  v`.@.GROW..IFPK=
.
    0E60: 0E 06 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 70 6B  ..............p=
k
    0E70: 60 70 0A 00 61 A2 19 60 70 83 88 68 72 77 6A 6B  `p..a..`p..hrwj=
k
    0E80: 00 61 00 00 88 49 46 50 4B 61 00 75 61 76 60 8A  .a...IFPKa.uav`=
.
    0E90: 69 0A 00 42 55 46 30 8A 69 0A 04 42 55 46 31 8A  i..BUF0.i..BUF1=
.
    0EA0: 69 0A 08 42 55 46 32 8A 69 0A 0C 42 55 46 33 8A  i..BUF2.i..BUF3=
.
    0EB0: 69 0A 10 42 55 46 34 8A 69 0A 14 42 55 46 35 70  i..BUF4.i..BUF5=
p
    0EC0: 83 88 49 46 50 4B 0A 00 00 42 55 46 30 70 83 88  ..IFPK...BUF0p.=
.
    0ED0: 49 46 50 4B 0A 01 00 42 55 46 31 70 83 88 49 46  IFPK...BUF1p..I=
F
    0EE0: 50 4B 0A 02 00 42 55 46 32 70 83 88 49 46 50 4B  PK...BUF2p..IFP=
K
    0EF0: 0A 03 00 42 55 46 33 70 83 88 49 46 50 4B 0A 04  ...BUF3p..IFPK.=
.
    0F00: 00 42 55 46 34 70 83 88 49 46 50 4B 0A 05 00 42  .BUF4p..IFPK...=
B
    0F10: 55 46 35 14 4E 0C 43 50 54 42 02 08 4C 4F 49 44  UF5.N.CPTB..LOI=
D
    0F20: 0A 00 8A 69 0A 00 42 55 46 30 8A 69 0A 04 42 55  ...i..BUF0.i..B=
U
    0F30: 46 31 8A 69 0A 08 42 55 46 32 8A 69 0A 0C 42 55  F1.i..BUF2.i..B=
U
    0F40: 46 33 8A 69 0A 10 42 55 46 34 70 0A 00 60 70 83  F3.i..BUF4p..`p=
.
    0F50: 88 4F 42 49 54 60 00 4C 4F 49 44 A2 47 07 4C 4F  .OBIT`.LOID.G.L=
O
    0F60: 49 44 A0 4E 05 93 4C 4F 49 44 68 70 83 88 4F 42  ID.N..LOIDhp..O=
B
    0F70: 49 54 72 60 0A 00 00 00 42 55 46 30 70 83 88 4F  ITr`....BUF0p..=
O
    0F80: 42 49 54 72 60 0A 01 00 00 42 55 46 31 70 83 88  BITr`....BUF1p.=
.
    0F90: 4F 42 49 54 72 60 0A 02 00 00 42 55 46 32 70 83  OBITr`....BUF2p=
.
    0FA0: 88 4F 42 49 54 72 60 0A 03 00 00 42 55 46 33 70  .OBITr`....BUF3=
p
    0FB0: 83 88 4F 42 49 54 72 60 0A 04 00 00 42 55 46 34  ..OBITr`....BUF=
4
    0FC0: A5 72 60 0A 06 60 70 83 88 4F 42 49 54 60 00 4C  .r`..`p..OBIT`.=
L
    0FD0: 4F 49 44 A0 0B 93 4C 4F 49 44 0A 00 A4 0A FF A4  OID...LOID.....=
.
    0FE0: 0A 00 14 44 0E 43 42 54 50 01 08 4C 4F 49 44 0A  ...D.CBTP..LOID=
.
    0FF0: 00 8A 68 0A 00 42 55 46 30 8A 68 0A 04 42 55 46  ..h..BUF0.h..BU=
F
    1000: 31 8A 68 0A 08 42 55 46 32 8A 68 0A 0C 42 55 46  1.h..BUF2.h..BU=
F
    1010: 33 8A 68 0A 10 42 55 46 34 8A 68 0A 14 42 55 46  3.h..BUF4.h..BU=
F
    1020: 35 70 0A 00 60 70 83 88 4F 42 49 54 60 00 4C 4F  5p..`p..OBIT`.L=
O
    1030: 49 44 A2 45 08 4C 4F 49 44 A0 4C 06 93 4C 4F 49  ID.E.LOID.L..LO=
I
    1040: 44 42 55 46 30 70 42 55 46 30 88 4F 42 49 54 72  DBUF0pBUF0.OBIT=
r
    1050: 60 0A 00 00 00 70 42 55 46 31 88 4F 42 49 54 72  `....pBUF1.OBIT=
r
    1060: 60 0A 01 00 00 70 42 55 46 32 88 4F 42 49 54 72  `....pBUF2.OBIT=
r
    1070: 60 0A 02 00 00 70 42 55 46 33 88 4F 42 49 54 72  `....pBUF3.OBIT=
r
    1080: 60 0A 03 00 00 70 42 55 46 34 88 4F 42 49 54 72  `....pBUF4.OBIT=
r
    1090: 60 0A 04 00 00 70 42 55 46 35 88 4F 42 49 54 72  `....pBUF5.OBIT=
r
    10A0: 60 0A 05 00 00 A5 72 60 0A 06 60 70 83 88 4F 42  `.....r`..`p..O=
B
    10B0: 49 54 60 00 4C 4F 49 44 A0 0B 93 4C 4F 49 44 0A  IT`.LOID...LOID=
.
    10C0: 00 A4 0A FF A4 0A 00 14 17 41 42 53 5F 02 A0 09  .........ABS_..=
.
    10D0: 95 68 69 A4 74 69 68 00 A1 06 A4 74 68 69 00 08  .hi.tih....thi.=
.
    10E0: 45 58 42 46 11 03 0A 78 5B 80 41 43 4D 53 01 0A  EXBF...x[.ACMS.=
.
    10F0: 72 0A 02 5B 81 10 41 43 4D 53 01 50 37 32 5F 08  r..[..ACMS.P72_=
.
    1100: 50 37 33 5F 08 14 32 42 53 46 5F 01 08 42 49 54  P73_..2BSF_..BI=
T
    1110: 30 0A 01 70 0A 08 61 A2 1A 61 7B 68 42 49 54 30  0..p..a..a{hBIT=
0
    1120: 62 A0 03 62 A5 79 42 49 54 30 0A 01 42 49 54 30  b..b.yBIT0..BIT=
0
    1130: 76 61 A4 74 0A 08 61 00 14 4E 08 47 43 4D 53 01  va.t..a..N.GCMS=
.
    1140: 08 41 44 44 52 0A 00 08 4D 41 53 4B 0A 00 08 54  .ADDR...MASK...=
T
    1150: 45 4D 50 11 03 0A 06 8A 54 45 4D 50 0A 00 54 4D  EMP.....TEMP..T=
M
    1160: 50 31 8B 54 45 4D 50 0A 04 54 4D 50 32 70 0A 01  P1.TEMP..TMP2p.=
.
    1170: 41 53 43 44 8B 45 58 42 46 0A 00 43 4D 53 49 8B  ASCD.EXBF..CMSI=
.
    1180: 45 58 42 46 0A 02 43 4D 53 44 70 0A 00 45 58 42  EXBF..CMSDp..EX=
B
    1190: 46 70 68 43 4D 53 49 70 45 58 42 46 41 53 42 46  FphCMSIpEXBFASB=
F
    11A0: 70 0A 62 53 4D 49 50 70 41 53 42 46 45 58 42 46  p.bSMIPpASBFEXB=
F
    11B0: 70 41 53 54 53 54 4D 50 31 70 43 4D 53 44 54 4D  pASTSTMP1pCMSDT=
M
    11C0: 50 32 A4 54 45 4D 50 14 43 06 53 43 4D 53 02 08  P2.TEMP.C.SCMS.=
.
    11D0: 41 44 44 52 0A 00 08 4D 41 53 4B 0A 00 70 0A 02  ADDR...MASK..p.=
.
    11E0: 41 53 43 44 8B 45 58 42 46 0A 00 43 4D 53 49 8B  ASCD.EXBF..CMSI=
.
    11F0: 45 58 42 46 0A 02 43 4D 53 44 70 0A 00 45 58 42  EXBF..CMSDp..EX=
B
    1200: 46 70 68 43 4D 53 49 70 69 43 4D 53 44 70 45 58  FphCMSIpiCMSDpE=
X
    1210: 42 46 41 53 42 46 70 0A 62 53 4D 49 50 70 41 53  BFASBFp.bSMIPpA=
S
    1220: 42 46 45 58 42 46 A4 41 53 54 53 14 46 04 53 54  BFEXBF.ASTS.F.S=
T
    1230: 4E 56 02 70 0A 03 41 53 43 44 5B 13 45 58 42 46  NV.p..ASCD[.EXB=
F
    1240: 0A 00 69 4D 4F 50 44 70 0A 00 45 58 42 46 70 68  ..iMOPDp..EXBFp=
h
    1250: 4D 4F 50 44 70 45 58 42 46 41 53 42 46 70 0A 62  MOPDpEXBFASBFp.=
b
    1260: 53 4D 49 50 70 41 53 42 46 45 58 42 46 A4 41 53  SMIPpASBFEXBF.A=
S
    1270: 54 53 08 43 50 55 44 0A 00 08 47 46 58 44 0A 00  TS.CPUD...GFXD.=
.
    1280: 08 53 42 43 44 0A 00 14 4B 08 47 45 54 43 01 A0  .SBCD...K.GETC.=
.
    1290: 25 5C 52 57 42 4B 0A 00 0A D3 0A 00 0A 20 54 53  %\RWBK....... T=
S
    12A0: 42 46 70 0A 01 47 56 42 32 70 0A 00 47 56 42 31  BFp..GVB2p..GVB=
1
    12B0: A4 47 56 42 46 70 0A 00 47 56 42 32 70 43 43 4C  .GVBFp..GVB2pCC=
L
    12C0: 4B 68 47 56 42 31 A0 2A 93 68 0A 01 A0 16 92 94  KhGVB1.*.h.....=
.
    12D0: 47 56 42 31 0C 40 0D 03 00 70 0C 40 0D 03 00 47  GVB1.@...p.@...=
G
    12E0: 56 42 31 A1 0D 74 47 56 42 31 0B E8 03 47 56 42  VB1..tGVB1...GV=
B
    12F0: 31 A0 1C 93 68 0A 02 A0 16 92 94 47 56 42 31 0C  1...h......GVB1=
.
    1300: A0 86 01 00 70 0C A0 86 01 00 47 56 42 31 A4 47  ....p.....GVB1.=
G
    1310: 56 42 46 14 4E 0E 53 45 54 43 02 A0 15 5C 52 57  VBF.N.SETC...\R=
W
    1320: 42 4B 0A 00 0A D3 0A 00 0A 20 54 53 42 46 A4 0A  BK....... TSBF.=
.
    1330: 01 70 0A 01 63 A0 42 04 93 68 0A 01 A0 3B 92 95  .p..c.B..h...;.=
.
    1340: 69 0C 40 0D 03 00 70 47 44 49 56 0A 14 60 70 47  i.@...pGDIV..`p=
G
    1350: 43 43 58 0A 10 0A 11 0A 14 0B 50 C3 61 70 77 69  CCX.......P.apw=
i
    1360: 60 00 62 72 62 77 60 0B E8 03 00 62 70 52 4D 50  `.brbw`....bpRM=
P
    1370: 43 61 62 0B E8 03 68 63 A1 41 08 A0 49 05 93 68  Cab...hc.A..I..=
h
    1380: 0A 02 70 47 44 49 56 0A 1C 60 70 47 43 43 58 0A  ..pGDIV..`pGCCX=
.
    1390: 1A 0A 1B 0A 1C 0B EE 37 61 70 77 69 60 00 62 70  .......7apwi`.b=
p
    13A0: 52 4D 50 43 61 62 0B E8 03 68 63 7D 83 88 54 53  RMPCab...hc}..T=
S
    13B0: 42 46 0A 0C 00 0A 20 88 54 53 42 46 0A 0C 00 A0  BF.... .TSBF...=
.
    13C0: 15 5C 52 57 42 4B 0A 00 0A D2 0A 0C 0A 01 54 53  .\RWBK........T=
S
    13D0: 42 46 A4 0A 01 A1 24 A0 22 93 68 0A 03 70 47 44  BF....$.".h..pG=
D
    13E0: 49 56 0A 1F 60 70 47 43 43 58 0A 1D 0A 1E 0A 1F  IV..`pGCCX.....=
.
    13F0: 0B EE 37 61 70 77 69 60 00 62 A0 04 63 A4 63 A4  ..7apwi`.b..c.c=
.
    1400: 0A 00 14 48 11 43 49 4E 49 00 A0 15 5C 52 57 42  ...H.CINI...\RW=
B
    1410: 4B 0A 00 0A D3 0A 06 0A 03 54 53 42 46 A4 0A 01  K........TSBF..=
.
    1420: A0 1F 91 92 93 83 88 54 53 42 46 0A 08 00 0A 31  .......TSBF....=
1
    1430: 92 93 83 88 54 53 42 46 0A 07 00 0A 75 A4 0A 03  ....TSBF....u..=
.
    1440: 7B 83 88 54 53 42 46 0A 06 00 0A 1F 88 54 53 42  {..TSBF......TS=
B
    1450: 46 0A 06 00 A0 15 5C 52 57 42 4B 0A 00 0A D2 0A  F.....\RWBK....=
.
    1460: 06 0A 01 54 53 42 46 A4 0A 01 A0 15 5C 52 57 42  ...TSBF.....\RW=
B
    1470: 4B 0A 00 0A D3 0A 0C 0A 01 54 53 42 46 A4 0A 01  K........TSBF..=
.
    1480: 7A 7B 83 88 54 53 42 46 0A 0C 00 0A 20 00 0A 05  z{..TSBF.... ..=
.
    1490: 60 A0 46 08 93 60 0A 00 A0 15 5C 52 57 42 4B 0A  `.F..`....\RWBK=
.
    14A0: 00 0A D3 0A 1A 0A 03 54 53 42 46 A4 0A 01 70 0A  .......TSBF...p=
.
    14B0: D3 88 54 53 42 46 0A 1A 00 70 0A A5 88 54 53 42  ..TSBF...p...TS=
B
    14C0: 46 0A 1B 00 7D 83 88 54 53 42 46 0A 1C 00 0A 80  F...}..TSBF....=
.
    14D0: 88 54 53 42 46 0A 1C 00 A0 15 5C 52 57 42 4B 0A  .TSBF.....\RWBK=
.
    14E0: 00 0A D2 0A 1A 0A 03 54 53 42 46 A4 0A 01 7D 83  .......TSBF...}=
.
    14F0: 88 54 53 42 46 0A 0C 00 0A 20 88 54 53 42 46 0A  .TSBF.... .TSBF=
.
    1500: 0C 00 A0 15 5C 52 57 42 4B 0A 00 0A D2 0A 0C 0A  ....\RWBK......=
.
    1510: 01 54 53 42 46 A4 0A 01 A4 0A 00 14 46 06 47 43  .TSBF.......F.G=
C
    1520: 43 58 04 7B 83 88 54 53 42 46 6A 00 0A 80 60 7A  CX.{..TSBFj...`=
z
    1530: 60 0A 07 60 7B 83 88 54 53 42 46 68 00 0A C0 61  `..`{..TSBFh...=
a
    1540: 7A 61 0A 05 61 7B 83 88 54 53 42 46 69 00 0A FF  za..a{..TSBFi..=
.
    1550: 62 79 62 0A 03 62 7D 60 61 60 7D 60 62 60 7B 83  byb..b}`a`}`b`{=
.
    1560: 88 54 53 42 46 68 00 0A 3F 61 77 6B 60 62 78 62  .TSBFh..?awk`bx=
b
    1570: 61 00 63 78 63 0B E8 03 00 63 77 63 0B E8 03 63  a.cxc....cwc...=
c
    1580: A4 63 08 56 43 4F 4D 0A 00 08 56 43 4F 4E 0A 00  .c.VCOM...VCON.=
.
    1590: 14 4A 05 43 43 4D 4E 05 70 69 60 70 41 42 53 5F  .J.CCMN.pi`pABS=
_
    15A0: 68 69 61 70 6A 62 A2 44 04 95 62 6B 70 0B FF 07  hiapjb.D..bkp..=
.
    15B0: 63 70 6C 64 A2 34 92 94 64 63 70 78 77 69 64 00  cpld.4..dcpxwid=
.
    15C0: 62 00 00 60 70 41 42 53 5F 68 60 65 A0 1A 95 65  b..`pABS_h`e...=
e
    15D0: 61 70 64 56 43 4F 4E 70 62 56 43 4F 4D 70 65 61  apdVCONpbVCOMpe=
a
    15E0: A0 06 93 65 0A 00 A5 75 64 75 62 14 4A 0A 43 43  ...e...udub.J.C=
C
    15F0: 4C 4B 01 08 56 43 4F 56 0A 00 08 56 43 4F 44 0A  LK..VCOV...VCOD=
.
    1600: 00 A0 2B 93 68 0A 01 70 47 44 49 56 0A 14 43 50  ..+.h..pGDIV..C=
P
    1610: 55 44 70 43 50 55 44 56 43 4F 44 70 47 43 43 58  UDpCPUDVCODpGCC=
X
    1620: 0A 10 0A 11 0A 14 0B 50 C3 56 43 4F 56 A1 4C 05  .......P.VCOV.L=
.
    1630: A0 2B 93 68 0A 02 70 47 44 49 56 0A 1C 47 46 58  .+.h..pGDIV..GF=
X
    1640: 44 70 47 46 58 44 56 43 4F 44 70 47 43 43 58 0A  DpGFXDVCODpGCCX=
.
    1650: 1A 0A 1B 0A 1C 0B EE 37 56 43 4F 56 A1 2D A0 2B  .......7VCOV.-.=
+
    1660: 93 68 0A 03 70 47 44 49 56 0A 1F 53 42 43 44 70  .h..pGDIV..SBCD=
p
    1670: 53 42 43 44 56 43 4F 44 70 47 43 43 58 0A 1D 0A  SBCDVCODpGCCX..=
.
    1680: 1E 0A 1F 0B EE 37 56 43 4F 56 A4 78 56 43 4F 56  .....7VCOV.xVCO=
V
    1690: 56 43 4F 44 00 00 14 44 0A 53 43 43 58 07 70 0A  VCOD...D.SCCX.p=
.
    16A0: 00 56 43 4F 4D 70 0A 00 56 43 4F 4E A0 0B 93 6C  .VCOMp..VCON...=
l
    16B0: 0B 50 C3 70 0B 68 01 60 A1 0D A0 0B 93 6C 0B EE  .P.p.h.`.....l.=
.
    16C0: 37 70 0B BB 02 60 43 43 4D 4E 68 6C 6D 6E 60 70  7p...`CCMNhlmn`=
p
    16D0: 7D 7B 79 56 43 4F 4E 0A 05 00 0A C0 00 56 43 4F  }{yVCON......VC=
O
    16E0: 4D 00 88 54 53 42 46 69 00 70 7B 7A 56 43 4F 4E  M..TSBFi.p{zVCO=
N
    16F0: 0A 03 00 0A FF 00 88 54 53 42 46 6A 00 7D 7B 83  .......TSBFj.}{=
.
    1700: 88 54 53 42 46 6B 00 0A 7F 00 7B 79 56 43 4F 4E  .TSBFk....{yVCO=
N
    1710: 0A 07 00 0A 80 00 88 54 53 42 46 6B 00 A0 1A 5C  .......TSBFk...=
\
    1720: 52 57 42 4B 0A 00 0A D2 69 72 74 6B 69 00 0A 01  RWBK....irtki..=
.
    1730: 00 54 53 42 46 A4 0A 01 A4 0A 00 08 44 49 56 44  .TSBF.......DIV=
D
    1740: 11 13 0A 10 02 03 05 09 04 06 0A 12 08 0C 14 24  ...............=
$
    1750: 10 18 28 48 14 1A 47 44 49 56 01 A4 83 88 44 49  ..(H..GDIV....D=
I
    1760: 56 44 7B 83 88 54 53 42 46 68 00 0A 0F 00 00 14  VD{..TSBFh.....=
.
    1770: 44 09 57 54 43 58 02 70 69 60 A0 40 05 93 68 0A  D.WTCX.pi`.@..h=
.
    1780: 01 70 78 60 0B D0 07 00 00 61 70 43 43 4D 53 50  .px`.....apCCMS=
P
    1790: 37 32 5F 70 61 50 37 33 5F A0 1E 92 95 61 0B 00  72_paP73_....a.=
.
    17A0: 01 70 72 43 43 4D 53 0A 01 43 43 4D 53 50 37 32  .prCCMS..CCMSP7=
2
    17B0: 5F 70 0A 01 50 37 33 5F A4 53 43 43 58 60 0A 10  _p..P73_.SCCX`.=
.
    17C0: 0A 11 0A 14 0B 50 C3 0A 1E 0A 3F A1 35 A0 18 93  .....P....?.5..=
.
    17D0: 68 0A 02 A4 53 43 43 58 60 0A 1A 0A 1B 0A 1C 0B  h...SCCX`......=
.
    17E0: EE 37 0A 0A 0A 1E A1 1A A0 18 93 68 0A 03 A4 53  .7.........h...=
S
    17F0: 43 43 58 60 0A 1D 0A 1E 0A 1F 0B EE 37 0A 0A 0A  CCX`........7..=
.
    1800: 1E A4 0A 04 14 32 52 4D 50 43 04 08 53 54 41 54  .....2RMPC..STA=
T
    1810: 0A 00 70 68 60 70 69 61 A0 1B 92 93 60 61 70 57  ..ph`pia....`ap=
W
    1820: 54 43 58 6B 61 53 54 41 54 A0 0A 53 54 41 54 A4  TCXkaSTAT..STAT=
.
    1830: 53 54 41 54 A4 0A 00 08 55 50 36 32 11 09 0A 06  STAT....UP62...=
.
    1840: 00 00 00 00 00 00 14 06 56 49 4E 49 00 14 45 17  ........VINI..E=
.
    1850: 53 45 54 56 02 A0 47 04 93 68 0A 01 70 69 60 A0  SETV..G..h..pi`=
.
    1860: 10 92 95 60 0C 50 34 03 00 70 0C 20 BF 02 00 60  ...`.P4..p. ...=
`
    1870: 74 60 0C 20 BF 02 00 60 70 78 60 0B D0 07 00 00  t`. ...`px`....=
.
    1880: 60 70 72 0A 00 60 00 88 55 50 36 32 0A 00 00 52  `pr..`..UP62...=
R
    1890: 57 42 59 0A 2A 0A 01 55 50 36 32 0A 00 A0 47 04  WBY.*..UP62...G=
.
    18A0: 93 68 0A 02 70 69 60 A0 10 92 95 60 0C 50 3A 02  .h..pi`....`.P:=
.
    18B0: 00 70 0C C0 D4 01 00 60 74 60 0C C0 D4 01 00 60  .p.....`t`.....=
`
    18C0: 70 78 60 0B D0 07 00 00 60 70 72 0A 00 60 00 88  px`.....`pr..`.=
.
    18D0: 55 50 36 32 0A 01 00 52 57 42 59 0A 2A 0A 02 55  UP62...RWBY.*..=
U
    18E0: 50 36 32 0A 01 A0 47 04 93 68 0A 03 70 69 60 A0  P62...G..h..pi`=
.
    18F0: 10 92 95 60 0C 68 AD 03 00 70 0C D8 4D 02 00 60  ...`.h...p..M..=
`
    1900: 74 60 0C D8 4D 02 00 60 70 78 60 0B D0 07 00 00  t`..M..`px`....=
.
    1910: 60 70 72 0A 00 60 00 88 55 50 36 32 0A 02 00 52  `pr..`..UP62...=
R
    1920: 57 42 59 0A 2A 0A 03 55 50 36 32 0A 02 A0 47 04  WBY.*..UP62...G=
.
    1930: 93 68 0A 04 70 69 60 A0 10 92 95 60 0C F0 BA 04  .h..pi`....`...=
.
    1940: 00 70 0C 90 D0 03 00 60 74 60 0C 90 D0 03 00 60  .p.....`t`.....=
`
    1950: 70 78 60 0B A0 0F 00 00 60 70 72 0A C0 60 00 88  px`.....`pr..`.=
.
    1960: 55 50 36 32 0A 03 00 52 57 42 59 0A 20 0A 01 55  UP62...RWBY. ..=
U
    1970: 50 36 32 0A 03 A0 47 04 93 68 0A 05 70 69 60 A0  P62...G..h..pi`=
.
    1980: 10 92 95 60 0C 68 36 02 00 70 0C 38 C1 01 00 60  ...`.h6..p.8...=
`
    1990: 74 60 0C 38 C1 01 00 60 70 78 60 0B D0 07 00 00  t`.8...`px`....=
.
    19A0: 60 70 72 0A 00 60 00 88 55 50 36 32 0A 04 00 52  `pr..`..UP62...=
R
    19B0: 57 42 59 0A 20 0A 02 55 50 36 32 0A 04 A0 05 93  WBY. ..UP62....=
.
    19C0: 68 0A 06 14 48 14 47 45 54 56 01 A0 3B 93 68 0A  h...H.GETV..;.h=
.
    19D0: 01 52 57 42 59 0A 2B 0A 01 55 50 36 32 0A 00 70  .RWBY.+..UP62..=
p
    19E0: 83 88 55 50 36 32 0A 00 00 60 A0 0A 92 95 60 0A  ..UP62...`....`=
.
    19F0: 40 70 0A 00 60 70 72 0C 20 BF 02 00 77 60 0B D0  @p..`pr. ...w`.=
.
    1A00: 07 00 00 47 56 42 46 A0 3B 93 68 0A 02 52 57 42  ...GVBF.;.h..RW=
B
    1A10: 59 0A 2B 0A 02 55 50 36 32 0A 01 70 83 88 55 50  Y.+..UP62..p..U=
P
    1A20: 36 32 0A 01 00 60 A0 0A 92 95 60 0A 40 70 0A 00  62...`....`.@p.=
.
    1A30: 60 70 72 0C C0 D4 01 00 77 60 0B D0 07 00 00 47  `pr.....w`.....=
G
    1A40: 56 42 46 A0 3B 93 68 0A 03 52 57 42 59 0A 2B 0A  VBF.;.h..RWBY.+=
.
    1A50: 03 55 50 36 32 0A 02 70 83 88 55 50 36 32 0A 02  .UP62..p..UP62.=
.
    1A60: 00 60 A0 0A 92 95 60 0A 40 70 0A 00 60 70 72 0C  .`....`.@p..`pr=
.
    1A70: D8 4D 02 00 77 60 0B D0 07 00 00 47 56 42 46 A0  .M..w`.....GVBF=
.
    1A80: 45 04 93 68 0A 04 52 57 42 59 0A 21 0A 01 55 50  E..h..RWBY.!..U=
P
    1A90: 36 32 0A 03 70 83 88 55 50 36 32 0A 03 00 60 7B  62..p..UP62...`=
{
    1AA0: 60 0A C0 61 A0 09 93 61 0A 80 70 0A C0 60 7B 60  `..a...a..p..`{=
`
    1AB0: 0A 3F 60 70 72 0C 90 D0 03 00 77 60 0B A0 0F 00  .?`pr.....w`...=
.
    1AC0: 00 47 56 42 46 A0 3B 93 68 0A 05 52 57 42 59 0A  .GVBF.;.h..RWBY=
.
    1AD0: 21 0A 02 55 50 36 32 0A 04 70 83 88 55 50 36 32  !..UP62..p..UP6=
2
    1AE0: 0A 04 00 60 A0 0A 92 95 60 0A 40 70 0A 00 60 70  ...`....`.@p..`=
p
    1AF0: 72 0C 38 C1 01 00 77 60 0B D0 07 00 00 47 56 42  r.8...w`.....GV=
B
    1B00: 46 A0 05 93 68 0A 06 A4 47 56 42 46 14 49 09 52  F...h...GVBF.I.=
R
    1B10: 57 42 59 04 70 0A FF 60 70 60 53 4D 53 41 5B 22  WBY.p..`p`SMSA[=
"
    1B20: 0A 02 70 68 60 70 60 53 42 41 41 5B 22 0A 02 70  ..ph`p`SBAA["..=
p
    1B30: 69 60 70 60 53 48 43 41 5B 22 0A 02 7B 68 0A 01  i`p`SHCA["..{h.=
.
    1B40: 61 A0 12 93 61 0A 00 70 83 88 6A 6B 00 60 70 60  a...a..p..jk.`p=
`
    1B50: 53 44 30 41 70 0A 48 60 70 60 53 42 43 41 5B 22  SD0Ap.H`p`SBCA[=
"
    1B60: 0A 02 70 53 4D 53 41 61 A2 23 92 7B 61 0A 01 00  ..pSMSAa.#.{a..=
.
    1B70: 70 53 4D 53 41 61 A0 09 7B 61 0A 1C 00 A4 0A 01  pSMSAa..{a.....=
.
    1B80: A0 07 7B 61 0A 02 00 A5 5B 22 0A 02 7B 68 0A 01  ..{a....["..{h.=
.
    1B90: 61 A0 11 93 61 0A 01 70 53 44 30 41 60 70 60 88  a...a..pSD0A`p`=
.
    1BA0: 6A 6B 00 A4 0A 00 08 47 46 30 31 0A 00 08 4F 56  jk.....GF01...O=
V
    1BB0: 46 4C 0A 01 08 4F 43 46 4C 0A 01 08 54 53 42 46  FL...OCFL...TSB=
F
    1BC0: 11 44 04 0A 40 00 00 00 00 00 00 00 00 00 00 00  .D..@..........=
.
    1BD0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    1BE0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    1BF0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    1C00: 00 00 00 00 00 08 47 56 42 46 11 08 0A 05 00 00  ......GVBF.....=
.
    1C10: 00 00 00 8A 47 56 42 46 0A 00 47 56 42 31 8C 47  ....GVBF..GVB1.=
G
    1C20: 56 42 46 0A 04 47 56 42 32 14 47 04 41 4D 30 31  VBF..GVB2.G.AM0=
1
    1C30: 00 A0 0E 44 42 47 5F 70 0D 41 4D 30 31 00 5B 31  ...DBG_p.AM01.[=
1
    1C40: A0 2D 92 47 46 30 31 42 4D 30 31 A0 09 4F 43 46  .-.GF01BM01..OC=
F
    1C50: 4C 43 49 4E 49 A0 09 4F 56 46 4C 56 49 4E 49 58  LCINI..OVFLVINI=
X
    1C60: 49 4E 49 45 4D 30 31 70 0A 01 47 46 30 31 A4 0A  INIEM01p..GF01.=
.
    1C70: 00 14 21 41 4D 30 32 00 A0 15 44 42 47 5F 70 0D  ..!AM02...DBG_p=
.
    1C80: 41 4D 30 32 00 5B 31 70 4F 42 49 44 5B 31 A4 4F  AM02.[1pOBID[1.=
O
    1C90: 42 49 44 14 48 07 41 4D 30 33 01 A0 0E 44 42 47  BID.H.AM03...DB=
G
    1CA0: 5F 70 0D 41 4D 30 33 00 5B 31 53 4F 49 44 68 A0  _p.AM03.[1SOIDh=
.
    1CB0: 17 90 93 49 44 30 31 0A 01 4F 43 46 4C 70 47 45  ...ID01..OCFLpG=
E
    1CC0: 54 43 49 44 30 32 60 A1 2F A0 17 90 93 49 44 30  TCID02`./....ID=
0
    1CD0: 31 0A 02 4F 56 46 4C 70 47 45 54 56 49 44 30 32  1..OVFLpGETVID0=
2
    1CE0: 60 A1 15 70 0A 00 47 56 42 31 70 0A 04 47 56 42  `..p..GVB1p..GV=
B
    1CF0: 32 70 47 56 42 46 60 A0 12 44 42 47 5F 70 0D 47  2pGVBF`..DBG_p.=
G
    1D00: 56 42 46 00 5B 31 70 60 5B 31 A4 60 14 43 05 41  VBF.[1p`[1.`.C.=
A
    1D10: 4D 30 34 02 A0 0E 44 42 47 5F 70 0D 41 4D 30 34  M04...DBG_p.AM0=
4
    1D20: 00 5B 31 53 4F 49 44 68 A0 16 90 93 49 44 30 31  .[1SOIDh....ID0=
1
    1D30: 0A 01 4F 43 46 4C 53 45 54 43 49 44 30 32 69 A1  ..OCFLSETCID02i=
.
    1D40: 1D A0 16 90 93 49 44 30 31 0A 02 4F 56 46 4C 53  .....ID01..OVFL=
S
    1D50: 45 54 56 49 44 30 32 69 A1 04 A4 0A 04 A4 0A 00  ETVID02i.......=
.
    1D60: 14 48 0D 41 4D 30 35 01 08 49 4E 46 4F 11 17 0A  .H.AM05..INFO..=
.
    1D70: 14 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    1D80: 00 00 00 00 00 8A 49 4E 46 4F 0A 00 49 46 49 44  ......INFO..IFI=
D
    1D90: 8A 49 4E 46 4F 0A 04 49 46 4D 49 8A 49 4E 46 4F  .INFO..IFMI.INF=
O
    1DA0: 0A 08 49 46 4D 58 8A 49 4E 46 4F 0A 0C 49 46 53  ..IFMX.INFO..IF=
S
    1DB0: 50 5B 13 49 4E 46 4F 0A 80 0A 03 49 46 53 54 A0  P[.INFO....IFST=
.
    1DC0: 15 44 42 47 5F 70 0D 41 4D 30 35 00 5B 31 70 4F  .DBG_p.AM05.[1p=
O
    1DD0: 42 49 54 5B 31 53 4F 49 44 68 A0 1A 44 42 47 5F  BIT[1SOIDh..DBG=
_
    1DE0: 70 0D 49 44 00 5B 31 70 49 44 30 31 5B 31 70 49  p.ID.[1pID01[1p=
I
    1DF0: 44 30 32 5B 31 42 4D 30 35 68 A0 15 44 42 47 5F  D02[1BM05h..DBG=
_
    1E00: 70 0D 4F 42 49 54 00 5B 31 70 4F 42 49 54 5B 31  p.OBIT.[1pOBIT[=
1
    1E10: 43 50 54 42 68 49 4E 46 4F 45 4D 30 35 68 A0 15  CPTBhINFOEM05h.=
.
    1E20: 44 42 47 5F 70 0D 69 6E 66 6F 00 5B 31 70 49 4E  DBG_p.info.[1pI=
N
    1E30: 46 4F 5B 31 A4 49 4E 46 4F 14 0D 41 4D 30 36 00  FO[1.INFO..AM06=
.
    1E40: 48 4D 30 36 A4 0A 00 14 0E 41 4D 30 37 01 48 4D  HM06.....AM07.H=
M
    1E50: 30 37 68 A4 0A 00 14 41 0F 41 4D 30 38 01 08 4C  07h....A.AM08..=
L
    1E60: 4F 44 54 12 4B 06 34 0A 00 0A 00 0A 00 0A 00 0A  ODT.K.4........=
.
    1E70: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    1E80: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    1E90: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    1EA0: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    1EB0: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A  ...............=
.
    1EC0: 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 70  ...............=
p
    1ED0: 0A 00 60 A2 3A 0A 01 A0 10 93 83 88 4F 42 44 54  ..`.:.......OBD=
T
    1EE0: 60 00 68 70 0A 00 64 A5 A0 11 93 83 88 4F 42 44  `.hp..d......OB=
D
    1EF0: 54 60 00 0A 00 70 0A 04 64 A5 72 60 83 88 4F 42  T`...p..d.r`..O=
B
    1F00: 44 54 72 60 0A 01 00 00 60 72 60 0A 02 60 A0 02  DTr`....`r`..`.=
.
    1F10: 64 A1 31 70 83 88 4F 42 44 54 72 60 0A 01 00 00  d.1p..OBDTr`...=
.
    1F20: 61 72 61 0A 02 61 70 0A 00 62 A2 18 61 70 83 88  ara..ap..b..ap.=
.
    1F30: 4F 42 44 54 60 00 88 4C 4F 44 54 62 00 76 61 75  OBDT`..LODTb.va=
u
    1F40: 60 75 62 A4 4C 4F 44 54 08 4F 42 53 56 12 14 09  `ub.LODT.OBSV..=
.
    1F50: 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00 0A 00  ...............=
.
    1F60: 0A 00 14 4A 08 41 50 54 53 01 A0 42 08 90 47 46  ...J.APTS..B..G=
F
    1F70: 30 31 91 93 68 0A 04 93 68 0A 03 70 83 88 4F 42  01..h...h..p..O=
B
    1F80: 49 44 0A 00 00 60 70 0A 01 61 70 0A 00 62 A2 4E  ID...`p..ap..b.=
N
    1F90: 05 60 53 4F 49 44 83 88 4F 42 49 44 61 00 A0 1B  .`SOID..OBIDa..=
.
    1FA0: 90 93 49 44 30 31 0A 01 4F 43 46 4C 47 45 54 43  ..ID01..OCFLGET=
C
    1FB0: 49 44 30 32 70 47 56 42 31 63 A1 23 A0 1B 90 93  ID02pGVB1c.#...=
.
    1FC0: 49 44 30 31 0A 02 4F 56 46 4C 47 45 54 56 49 44  ID01..OVFLGETVI=
D
    1FD0: 30 32 70 47 56 42 31 63 A1 05 70 0A 00 63 70 63  02pGVB1c..p..cp=
c
    1FE0: 88 4F 42 53 56 62 00 76 60 75 61 75 62 14 44 07  .OBSVb.v`uaub.D=
.
    1FF0: 41 57 41 4B 01 A0 4C 06 90 47 46 30 31 91 93 68  AWAK..L..GF01..=
h
    2000: 0A 04 93 68 0A 03 70 83 88 4F 42 49 44 0A 00 00  ...h..p..OBID..=
.
    2010: 60 70 0A 01 61 70 0A 00 62 A2 48 04 60 70 83 88  `p..ap..b.H.`p.=
.
    2020: 4F 42 53 56 62 00 63 53 4F 49 44 83 88 4F 42 49  OBSVb.cSOID..OB=
I
    2030: 44 61 00 A0 16 90 93 49 44 30 31 0A 01 4F 43 46  Da.....ID01..OC=
F
    2040: 4C 53 45 54 43 49 44 30 32 63 A1 11 A0 0D 90 93  LSETCID02c.....=
.
    2050: 49 44 30 31 0A 02 4F 56 46 4C A1 01 76 60 75 61  ID01..OVFL..v`u=
a
    2060: 75 62 08 43 4D 44 56 0A 01 14 0B 41 4D 30 39 00  ub.CMDV....AM09=
.
    2070: A4 43 4D 44 56 08 4F 42 55 46 11 04 0B 00 04 14  .CMDV.OBUF.....=
.
    2080: 49 0F 41 4D 31 30 01 8A 68 0A 00 41 43 4D 44 5B  I.AM10..h..ACMD=
[
    2090: 13 4F 42 55 46 0A 00 0B 00 10 54 45 4D 50 70 0A  .OBUF.....TEMPp=
.
    20A0: 00 54 45 4D 50 8A 4F 42 55 46 0A 00 43 4D 44 53  .TEMP.OBUF..CMD=
S
    20B0: A0 0F 93 41 43 4D 44 0C 01 00 03 00 52 33 30 31  ...ACMD.....R30=
1
    20C0: A1 43 0B A0 10 93 41 43 4D 44 0C 02 00 03 00 52  .C....ACMD.....=
R
    20D0: 33 30 32 68 A1 4F 09 A0 10 93 41 43 4D 44 0C 03  302h.O....ACMD.=
.
    20E0: 00 03 00 52 33 30 33 68 A1 4B 08 A0 10 93 41 43  ...R303h.K....A=
C
    20F0: 4D 44 0C 04 00 03 00 52 33 30 34 68 A1 47 07 A0  MD.....R304h.G.=
.
    2100: 10 93 41 43 4D 44 0C 01 00 04 00 52 34 30 31 68  ..ACMD.....R401=
h
    2110: A1 43 06 A0 15 93 41 43 4D 44 0C 02 00 04 00 70  .C....ACMD.....=
p
    2120: 0C 00 00 01 00 43 4D 44 53 A1 4A 04 A0 15 93 41  .....CMDS.J....=
A
    2130: 43 4D 44 0C 03 00 04 00 70 0C 00 00 01 00 43 4D  CMD.....p.....C=
M
    2140: 44 53 A1 31 A0 10 93 41 43 4D 44 0C 04 00 04 00  DS.1...ACMD....=
.
    2150: 52 34 30 34 68 A1 1E A0 10 93 41 43 4D 44 0C 01  R404h.....ACMD.=
.
    2160: 00 05 00 52 35 30 31 68 A1 0B 70 0C 00 00 01 00  ...R501h..p....=
.
    2170: 43 4D 44 53 A4 4F 42 55 46 08 43 4D 44 4C 11 03  CMDS.OBUF.CMDL.=
.
    2180: 0A 54 14 4B 17 41 4D 31 31 00 08 54 45 4D 50 0A  .T.K.AM11..TEMP=
.
    2190: 00 8A 43 4D 44 4C 0A 00 43 4D 44 43 72 54 45 4D  ..CMDL..CMDCrTE=
M
    21A0: 50 0A 04 54 45 4D 50 8A 43 4D 44 4C 54 45 4D 50  P..TEMP.CMDLTEM=
P
    21B0: 43 4D 44 31 72 54 45 4D 50 0A 04 54 45 4D 50 70  CMD1rTEMP..TEMP=
p
    21C0: 0C 01 00 03 00 43 4D 44 31 8A 43 4D 44 4C 54 45  .....CMD1.CMDLT=
E
    21D0: 4D 50 43 4D 44 32 72 54 45 4D 50 0A 04 54 45 4D  MPCMD2rTEMP..TE=
M
    21E0: 50 70 0C 02 00 03 00 43 4D 44 32 8A 43 4D 44 4C  Pp.....CMD2.CMD=
L
    21F0: 54 45 4D 50 43 4D 44 33 72 54 45 4D 50 0A 04 54  TEMPCMD3rTEMP..=
T
    2200: 45 4D 50 70 0C 03 00 03 00 43 4D 44 33 8A 43 4D  EMPp.....CMD3.C=
M
    2210: 44 4C 54 45 4D 50 43 4D 44 34 72 54 45 4D 50 0A  DLTEMPCMD4rTEMP=
.
    2220: 04 54 45 4D 50 70 0C 04 00 03 00 43 4D 44 34 8A  .TEMPp.....CMD4=
.
    2230: 43 4D 44 4C 54 45 4D 50 43 4D 44 35 72 54 45 4D  CMDLTEMPCMD5rTE=
M
    2240: 50 0A 04 54 45 4D 50 70 0C 01 00 04 00 43 4D 44  P..TEMPp.....CM=
D
    2250: 35 8A 43 4D 44 4C 54 45 4D 50 43 4D 44 36 72 54  5.CMDLTEMPCMD6r=
T
    2260: 45 4D 50 0A 04 54 45 4D 50 70 0C 02 00 04 00 43  EMP..TEMPp.....=
C
    2270: 4D 44 36 8A 43 4D 44 4C 54 45 4D 50 43 4D 44 37  MD6.CMDLTEMPCMD=
7
    2280: 72 54 45 4D 50 0A 04 54 45 4D 50 70 0C 03 00 04  rTEMP..TEMPp...=
.
    2290: 00 43 4D 44 37 8A 43 4D 44 4C 54 45 4D 50 43 4D  .CMD7.CMDLTEMPC=
M
    22A0: 44 38 72 54 45 4D 50 0A 04 54 45 4D 50 70 0C 04  D8rTEMP..TEMPp.=
.
    22B0: 00 04 00 43 4D 44 38 8A 43 4D 44 4C 54 45 4D 50  ...CMD8.CMDLTEM=
P
    22C0: 43 4D 44 39 72 54 45 4D 50 0A 04 54 45 4D 50 70  CMD9rTEMP..TEMP=
p
    22D0: 0C 01 00 05 00 43 4D 44 39 74 54 45 4D 50 0A 04  .....CMD9tTEMP.=
.
    22E0: 54 45 4D 50 78 54 45 4D 50 0A 04 00 54 45 4D 50  TEMPxTEMP...TEM=
P
    22F0: 70 54 45 4D 50 43 4D 44 43 A4 43 4D 44 4C 14 37  pTEMPCMDC.CMDL.=
7
    2300: 52 33 30 31 00 70 83 88 51 4C 53 54 0A 00 00 60  R301.p..QLST...=
`
    2310: 8A 4F 42 55 46 0A 00 54 4D 50 31 8B 4F 42 55 46  .OBUF..TMP1.OBU=
F
    2320: 0A 04 54 4D 50 32 70 60 54 4D 50 32 70 0A 00 54  ..TMP2p`TMP2p..=
T
    2330: 4D 50 31 A4 0A 00 14 43 1E 52 33 30 32 01 08 43  MP1....C.R302..=
C
    2340: 49 44 58 0A 00 8B 68 0A 04 49 49 44 58 70 0A 01  IDX...h..IIDXp.=
.
    2350: 43 49 44 58 70 83 88 83 88 51 4C 53 54 49 49 44  CIDXp....QLSTII=
D
    2360: 58 00 43 49 44 58 00 60 75 43 49 44 58 70 0A 20  X.CIDX.`uCIDXp.
    2370: 61 5B 13 4F 42 55 46 61 0B 00 01 54 4D 50 31 70  a[.OBUFa...TMP1=
p
    2380: 60 54 4D 50 31 72 61 0B 00 01 61 70 83 88 83 88  `TMP1ra...ap...=
.
    2390: 51 4C 53 54 49 49 44 58 00 43 49 44 58 00 60 75  QLSTIIDX.CIDX.`=
u
    23A0: 43 49 44 58 5B 13 4F 42 55 46 61 0A 08 54 4D 50  CIDX[.OBUFa..TM=
P
    23B0: 32 70 60 54 4D 50 32 72 61 0A 08 61 70 60 62 78  2p`TMP2ra..ap`b=
x
    23C0: 61 0A 08 00 65 A2 49 05 94 62 0A 00 70 83 88 83  a...e.I..b..p..=
.
    23D0: 88 51 4C 53 54 49 49 44 58 00 43 49 44 58 00 60  .QLSTIIDX.CIDX.=
`
    23E0: 70 0A 05 64 70 0A 00 66 A2 2A 94 64 0A 00 A0 12  p..dp..f.*.d...=
.
    23F0: 95 66 87 60 70 83 88 60 66 00 88 4F 42 55 46 65  .f.`p..`f..OBUF=
e
    2400: 00 A1 0B 70 0A 00 88 4F 42 55 46 65 00 75 66 75  ...p...OBUFe.uf=
u
    2410: 65 76 64 72 61 0A 28 61 76 62 75 43 49 44 58 70  evdra.(avbuCIDX=
p
    2420: 0B 70 03 61 70 83 88 83 88 51 4C 53 54 49 49 44  .p.ap....QLSTII=
D
    2430: 58 00 43 49 44 58 00 60 75 43 49 44 58 5B 13 4F  X.CIDX.`uCIDX[.=
O
    2440: 42 55 46 61 0A 10 54 4D 50 33 70 60 54 4D 50 33  BUFa..TMP3p`TMP=
3
    2450: 72 61 0A 10 61 70 83 88 83 88 51 4C 53 54 49 49  ra..ap....QLSTI=
I
    2460: 44 58 00 43 49 44 58 00 66 A0 47 04 93 8E 66 0A  DX.CIDX.f.G...f=
.
    2470: 04 70 87 66 62 78 61 0A 08 00 65 70 0A 00 63 A2  .p.fbxa...ep..c=
.
    2480: 31 94 62 0A 00 70 83 88 66 63 00 60 70 87 60 64  1.b..p..fc.`p.`=
d
    2490: 70 0A 00 67 A2 18 94 64 0A 00 70 83 88 60 67 00  p..g...d..p..`g=
.
    24A0: 88 4F 42 55 46 65 00 75 67 75 65 76 64 76 62 75  .OBUFe.uguevdvb=
u
    24B0: 63 A1 43 05 70 60 62 78 61 0A 08 00 65 A2 47 04  c.C.p`bxa...e.G=
.
    24C0: 94 62 0A 00 70 83 88 83 88 51 4C 53 54 49 49 44  .b..p....QLSTII=
D
    24D0: 58 00 43 49 44 58 00 60 70 87 60 64 70 0A 00 66  X.CIDX.`p.`dp..=
f
    24E0: A2 18 94 64 0A 00 70 83 88 60 66 00 88 4F 42 55  ...d..p..`f..OB=
U
    24F0: 46 65 00 75 66 75 65 76 64 72 61 0A 80 00 76 62  Fe.ufuevdra...v=
b
    2500: 75 43 49 44 58 8A 4F 42 55 46 0A 00 54 4D 50 34  uCIDX.OBUF..TMP=
4
    2510: 70 0A 00 54 4D 50 34 A4 0A 00 14 43 06 52 33 30  p..TMP4....C.R3=
0
    2520: 33 01 8B 68 0A 04 49 49 54 4D 8A 4F 42 55 46 0A  3..h..IITM.OBUF=
.
    2530: 00 54 4D 50 31 8B 4F 42 55 46 0A 04 54 4D 50 32  .TMP1.OBUF..TMP=
2
    2540: 70 83 88 83 88 51 4C 53 54 49 49 54 4D 00 0A 00  p....QLSTIITM..=
.
    2550: 00 60 70 47 43 4D 53 60 61 8A 61 0A 00 54 4D 50  .`pGCMS`a.a..TM=
P
    2560: 33 8B 61 0A 04 54 4D 50 34 70 54 4D 50 33 54 4D  3.a..TMP4pTMP3T=
M
    2570: 50 31 70 54 4D 50 34 54 4D 50 32 A4 0A 00 14 45  P1pTMP4TMP2....=
E
    2580: 04 52 33 30 34 01 8B 68 0A 04 49 49 54 4D 8B 68  .R304..h..IITM.=
h
    2590: 0A 06 43 4D 53 44 8A 4F 42 55 46 0A 00 54 4D 50  ..CMSD.OBUF..TM=
P
    25A0: 31 70 83 88 83 88 51 4C 53 54 49 49 54 4D 00 0A  1p....QLSTIITM.=
.
    25B0: 00 00 60 70 53 43 4D 53 60 43 4D 53 44 54 4D 50  ..`pSCMS`CMSDTM=
P
    25C0: 31 A4 0A 00 08 56 45 4E 44 11 07 0A 04 47 42 54  1....VEND....GB=
T
    25D0: 00 14 21 52 34 30 31 01 5B 13 4F 42 55 46 0A 20  ..!R401.[.OBUF.
    25E0: 0B 00 02 54 4D 50 32 70 56 45 4E 44 54 4D 50 32  ...TMP2pVENDTMP=
2
    25F0: A4 0A 00 14 23 52 34 30 34 01 8A 4F 42 55 46 0A  ....#R404..OBUF=
.
    2600: 04 56 44 49 4F 47 45 54 56 0A 01 70 47 56 42 31  .VDIOGETV..pGVB=
1
    2610: 56 44 49 4F A4 0A 00 14 33 52 35 30 31 01 8C 68  VDIO....3R501..=
h
    2620: 0A 04 4D 4F 50 56 A0 0C 93 4D 4F 50 56 0A 01 70  ..MOPV...MOPV..=
p
    2630: 0A 1F 60 77 60 0A 08 61 5B 13 68 0A 20 61 4D 4F  ..`w`..a[.h. aM=
O
    2640: 50 44 53 54 4E 56 4D 4F 50 44 61 08 57 51 42 41  PDSTNVMOPDa.WQB=
A
    2650: 11 40 BC 0B BB 0B 46 4F 4D 42 01 00 00 00 AB 0B  .@....FOMB.....=
.
    2660: 00 00 20 4A 00 00 44 53 00 01 1A 7D DA 54 28 5B  .. J..DS...}.T(=
[
    2670: A4 00 01 06 18 42 10 15 10 22 21 04 12 01 A1 C8  .....B..."!....=
.
    2680: 2C 0C 86 10 38 2E 84 1C 40 48 1C 14 4A 08 84 FA  ,...8...@H..J..=
.
    2690: 13 C8 AF 00 84 0E 05 C8 14 60 50 80 53 04 11 F4  .........`P.S..=
.
    26A0: 2A C0 A6 00 93 02 2C 0A D0 2E C0 B2 00 DD 02 A4  *.....,........=
.
    26B0: C3 92 AD 08 1C 21 06 1C A5 13 5B B8 61 83 17 8A  .....!....[.a..=
.
    26C0: A2 19 44 49 50 B9 00 DF 08 02 2F 57 80 E4 09 48  ..DIP...../W...=
H
    26D0: B3 00 C3 02 AC 0B 90 3D 04 2A 75 08 28 39 43 40  .......=3D.*u.(=
9C@
    26E0: 0D A0 D5 09 08 BF D2 29 21 09 C2 19 AB 78 7C CD  .......)!....x|=
.
    26F0: A2 E9 39 C9 39 86 1C 8F 0B 3D 08 1E 47 03 08 93  ..9.9....=3D..G=
...
    2700: 3F 64 05 80 41 49 18 0B 75 31 6A D4 48 D9 80 0C  ?d..AI..u1j.H..=
.
    2710: 51 DA A8 D1 03 3A BF 23 39 BB A3 3B 92 04 46 3D  Q....:.#9..;..F=
=3D
    2720: A6 63 2C 6C 46 42 8D D1 1C 14 09 37 68 B4 44 58  .c,lFB.....7h.D=
X
    2730: 8D 2B F6 99 59 F8 B0 84 71 04 07 76 B0 16 0D 23  .+..Y...q..v...=
#
    2740: B4 82 E0 34 88 A3 88 12 86 E1 19 33 D0 51 32 A4  ...4.......3.Q2=
.
    2750: 30 41 4F 20 C8 C9 33 2C 43 9C 01 C7 8A 11 2A 24  0AO ..3,C.....*=
$
    2760: 66 20 C1 FF FF 27 D0 35 86 3C 03 91 7B C0 09 04  f ...'.5.<..{..=
.
    2770: 89 1E 25 B8 71 8D CA C6 74 36 B8 81 99 20 CE E1  ..%.q...t6... .=
.
    2780: 61 64 40 68 02 F1 63 87 4F 60 F7 C7 01 29 44 D0  ad@h..c.O`...)D=
.
    2790: 85 E0 4C 6B 14 60 ED EC 20 5B 10 3A 0B C4 6A 0C  ..Lk.`.. [.:..j=
.
    27A0: 45 10 11 82 46 31 5E 84 50 21 A2 44 3D E7 20 B5  E...F1^.P!.D=3D=
. .
    27B0: 09 50 06 22 B4 60 46 60 F6 07 41 24 58 80 F8 23  .P.".`F`..A$X..=
#
    27C0: B0 84 13 81 8C 8C 86 1E 16 7C 12 60 07 04 CF E7  .........|.`...=
.
    27D0: D4 4C E0 C0 10 E2 95 00 51 47 0B 4A 60 29 47 03  .L......QG.J`)G=
.
    27E0: 62 7B 60 BA 07 1C E1 B9 FB 72 70 6A FE 69 78 9A  b{`......rpj.ix=
.
    27F0: 0F 09 98 21 7A AC 07 11 F0 10 D9 29 C1 80 78 EF  ...!z......)..x=
.
    2800: D7 02 32 82 97 04 03 7A 12 0F 08 60 39 68 1C F8  ..2....z...`9h.=
.
    2810: 09 55 7C 07 A0 47 02 36 A3 F8 26 28 EB F8 80 9E  .U|..G.6..&(...=
.
    2820: 73 B4 67 87 97 85 66 AF 18 84 E0 35 C0 37 05 9F  s.g...f....5.7.=
.
    2830: 46 2C 69 75 72 B2 2A 8F 98 82 7B 08 5C 04 9C 86  F,iur.*...{.\..=
.
    2840: EE F1 82 43 C1 78 E9 FF 7F BC E0 3E 0F 1C 2F 58  ...C.x.....>../=
X
    2850: 4E 09 55 5D 36 34 87 F3 6D 1E 9F 1C 2D 3C 61 36  N.U]64..m...-<a=
6
    2860: 96 A3 62 C7 10 36 3A 3E 0A 0F F8 B5 A1 58 10 99  ..b..6:>.....X.=
.
    2870: 80 D0 91 E1 C0 C1 E2 EC 00 21 02 0B 1B 39 7A C4  .........!...9z=
.
    2880: 1E D4 3B 8C 31 1E 08 8C 7A 48 07 0F 3E 40 0F 1E  ..;.1...zH..>@.=
.
    2890: 70 FA FF 27 B0 A0 21 4B C4 E0 D1 A7 08 0F E7 DD  p..'..!K.......=
.
    28A0: 87 1F 44 12 38 3C 84 06 0F 9E B3 8F 07 0F 7E 79  ..D.8<........~=
y
    28B0: 83 07 D1 14 8E 0D 77 B0 F1 C0 C1 3D 5C FC 90 70  ......w....=3D\=
..p
    28C0: 67 2D 78 3E 27 4F 06 F0 12 84 3B 6C 01 97 11 70  g-x>'O....;l...=
p
    28D0: 99 AB A4 87 2A 0B 83 41 9D AB C0 FB FF 3F 57 01  ....*..A.....?W=
.
    28E0: F6 2F 53 EF 53 3E 57 81 3B DA 79 40 E7 16 72 9A  ./S.S>W.;.y@..r=
.
    28F0: 41 1F 0A 7C 06 78 92 01 DB A1 0A 38 9C 64 C0 73  A..|.x.....8.d.=
s
    2900: 2B 7B 92 61 FF FF 93 0C 38 0F 62 3E C9 80 EF E8  +{.a....8.b>...=
.
    2910: 85 3B 81 C0 F3 38 24 21 1F 42 F0 43 3A A6 67 10  .;...8$!.B.C:.g=
.
    2920: 60 28 E4 65 E0 03 08 8D 7E 06 01 B4 FF FF CF 20  `(.e....~......
    2930: C0 E5 AC F0 0C 02 76 F1 AF 3A 9D 07 1C 1C 42 4E  ......v..:....B=
N
    2940: 8E 8A A8 E1 58 EB 41 80 8C E7 45 C0 41 4F 8A 40  ....X.A...E.AO.=
@
    2950: F7 AC 81 3B 1F C0 3D 12 F2 73 07 F8 A2 43 E8 98  ...;..=3D..s...=
C..
    2960: 89 3F 51 79 88 3E 1B 98 C0 A3 05 D7 39 11 5C FF  .?Qy.>......9.\=
.
    2970: FF D1 C2 3B 69 E0 46 0B F7 00 FC 58 80 39 62 82  ...;i.F....X.9b=
.
    2980: EB D0 02 A6 EB 02 E6 D2 82 3F B4 00 1F A1 27 16  .........?....'=
.
    2990: 94 B4 43 0B A0 F9 FF 7F 68 01 6E 73 7D 68 01 7B  ..C.....h.ns}h.=
{
    29A0: B8 73 18 95 73 0E 83 76 68 F6 39 0C B8 1E 26 F0  .s..s..vh.9...&=
.
    29B0: 87 4A B8 B3 88 1F 27 DA 5B 80 CF A7 C0 ED B0 86  .J....'.[......=
.
    29C0: 3B 82 C0 BB 14 9C 96 A7 F6 D4 7F 70 8D 5F 41 C8  ;..........p._A=
.
    29D0: 3D C6 77 10 F6 FF 3F 88 01 37 19 07 31 54 F0 43  =3D.w...?..7..1=
T.C
    29E0: 08 40 A1 CB C2 43 08 D8 A5 1F C4 68 EC 83 18 EA  .@...C.....h...=
.
    29F0: FF 7F 82 C7 9F C3 00 A7 67 38 B8 51 8F 61 80 A2  ........g8.Q.a.=
.
    2A00: B3 28 70 82 78 0E 63 FF FF 73 18 F0 14 FC 12 F0  .(p.x.c..s.....=
.
    2A10: 81 85 4A 84 41 9D 59 00 DE 1C 90 9F 59 C0 1E F2  ..J.A.Y.....Y..=
.
    2A20: AD A1 1F 81 FF FF 67 16 C0 F5 99 DC 63 C5 1D 22  ......g.....c..=
"
    2A30: D8 48 42 BE 0A BC 15 98 C0 91 0F 2D 40 F7 6C 82  .HB........-@.l=
.
    2A40: 1B 2D DC E3 C8 39 9E D0 BB F9 EB 03 3B 4D B0 21  .-...9......;M.=
!
    2A50: 83 57 DE 21 10 F5 FF 1F B2 0F 24 9E C2 CB 0C 66  .W.!......$....=
f
    2A60: 26 31 0E 24 C2 B1 78 78 E4 28 08 AA 33 3F 19 35  &1.$..xx.(..3?.=
5
    2A70: E8 67 F7 84 0F 9E E9 BE E1 83 E1 30 08 73 CE 1E  .g.........0.s.=
.
    2A80: 3F F8 8E 3D B8 73 10 BC EB 8A 91 4F E8 25 00 73  ?..=3D.s.....O.=
%.s
    2A90: 6B C1 9E 05 81 93 AC 83 20 4A C8 59 10 54 FF FF  k....... J.Y.T.=
.
    2AA0: 83 10 C0 04 6F F7 20 5D 83 7C 1B 78 1A 78 F8 89  ....o. ].|.x.x.=
.
    2AB0: F2 20 E4 8B C4 0B 41 84 28 C7 7B 02 11 9E 86 3C  . ....A.(.{....=
<
    2AC0: E1 30 E1 4E 36 CA 4B 43 18 43 C7 0A 14 39 7E 08  .0.N6.KC.C...9~=
.
    2AD0: 1F 85 7C 10 62 51 CE B7 F4 FC 61 23 67 11 D4 49  ..|.bQ....a#g..=
I
    2AE0: C0 87 0E 0F EA 09 01 13 1A 42 47 5C E0 7A DA C0  .........BG\.z.=
.
    2AF0: FD FF 8F 42 E0 38 80 C0 7B 47 F8 B4 0E 2E 08 9F  ...B.8..{G.....=
.
    2B00: 3F E0 FB 44 16 EE 5B C0 0B 0D EE EC 01 7C E4 1E  ?..D..[......|.=
.
    2B10: 6B 51 02 61 50 67 0F C0 F9 FF FF EC 01 D6 81 3E  kQ.aPg.........=
>
    2B20: 7A 1C E8 31 06 89 11 C4 77 0E 1F 7C E2 BC 11 3C  z..1....w..|...=
<
    2B30: 7B F8 C8 71 5C 3E 80 F8 EC E1 2B 88 F1 C2 C4 7C  {..q\>....+....=
|
    2B40: 38 F2 35 21 5E E4 B0 61 22 FB EC C1 22 1E 6B A9  8.5!^..a"...".k=
.
    2B50: 94 83 19 FA 4C E0 5B C2 99 BD 71 44 38 AE 93 3B  ....L.[...qD8..=
;
    2B60: 9F 38 1E D2 49 FB 6C 06 BE E3 07 70 38 9B 81 67  .8..I.l....p8..=
g
    2B70: 74 70 0F 53 E0 93 75 36 43 0F CB E7 82 57 07 0F  tp.S..u6C....W.=
.
    2B80: 82 9D CB C0 75 B8 83 F3 FF 3F 97 01 AF 73 C7 91  ....u....?...s.=
.
    2B90: B1 53 05 47 3C A8 33 79 77 39 6B 1F 3C 02 9D E7  .S.G<.3yw9k.<..=
.
    2BA0: 29 FB 1C 03 73 84 1E 3B F8 0E 26 F8 83 0C 1C 98  )...s..;..&....=
.
    2BB0: 13 38 BA 40 A7 10 E7 14 9E 63 80 91 1C 4B 20 2C  .8.@.....c...K =
,
    2BC0: C0 B1 40 A2 96 49 61 7C 32 F0 39 06 AE 24 38 D4  ..@..Ia|2.9..$8=
.
    2BD0: F8 3C B2 97 BC E3 3C 91 37 04 8F FF 81 06 C6 C0  .<....<.7......=
.
    2BE0: 3D AD 93 F2 4D EE B1 C4 67 43 7E 5C 60 68 FC 74  =3D...M...gC~\`=
h.t
    2BF0: 03 86 FF FF E9 06 CE 9D C1 47 0D B0 5C 6D 30 58  .........G..\m0=
X
    2C00: A1 62 34 7A D7 23 A0 C7 D7 D7 45 9A 42 45 0C F1  .b4z.#....E.BE.=
.
    2C10: 42 60 97 C7 71 E4 59 17 5C D8 CF BA 60 0F 75 4E  B`..q.Y.\...`.u=
N
    2C20: A2 91 46 83 3A C8 F0 03 C1 63 90 4F 1E 06 39 D1  ..F.:....c.O..9=
.
    2C30: D3 7A 5C 78 1A F0 B8 D9 35 C1 1F 04 1F 0F F0 97  .z\x....5......=
.
    2C40: A0 80 27 FA F0 01 EB 10 82 3F 61 C0 1F 8F 8F 01  ..'......?a....=
.
    2C50: 3E D1 FA 48 45 06 81 3A BC F1 91 9E D6 DB 80 0F  >..HE..:.......=
.
    2C60: 09 87 C5 0E 1E 3E A3 80 63 3C F0 6F 9F 4F 07 FF  .....>..c<.o.O.=
.
    2C70: FF 08 AF 0C 9E AF 0F 66 60 B9 75 F8 D0 10 EA A9  .......f`.u....=
.
    2C80: C3 33 78 BF F0 09 04 98 04 36 34 48 26 73 9D B2  .3x......64H&s.=
.
    2C90: 71 DA A1 C3 B4 C8 03 82 8E 06 3E D2 F8 80 CB 0F  q.........>....=
.
    2CA0: 49 86 B0 30 0A 9D 7C 3C 1A 0F 8F C0 51 10 8F DC  I..0..|<....Q..=
.
    2CB0: 21 21 64 E4 10 80 3E 2C 30 88 87 2E 13 F8 D8 E0  !!d...>,0......=
.
    2CC0: F3 1A 9C E3 91 27 E3 69 78 DC B8 53 07 DC 71 E0  .....'.ix..S..q=
.
    2CD0: 0F 3A F8 53 20 3F 27 91 F3 1F A8 04 9E 0B 40 01  .:.S ?'.......@=
.
    2CE0: E4 AB 80 95 1E 07 E8 14 42 84 89 66 78 4C F0 D3  ........B..fxL.=
.
    2CF0: 17 1D 8F 87 E5 FF FF 20 F9 F1 85 61 3F 9D F8 D4  ....... ...a?..=
.
    2D00: 76 8C EF 05 8F 5F 18 58 0F 9B C3 1A 2D EC D1 3E  v...._.X....-..=
>
    2D10: 3E F8 EA E1 89 F9 16 E7 43 07 58 0E 52 C0 E3 FC  >.......C.X.R..=
.
    2D20: C3 E6 F0 02 F1 1C E6 83 07 3B F1 B1 53 1F D7 75  .........;..S..=
u
    2D30: 8E 43 9C 21 F8 20 1C 67 91 F2 38 53 72 95 7C E0  .C.!. .g..8Sr.|=
.
    2D40: A8 1A 45 F0 BE 15 B0 08 C7 08 94 78 0A 49 3F 46  ..E........x.I?=
F
    2D50: A0 C4 C2 51 10 1F 23 7C 90 B0 8D 63 04 6A 8C 3E  ...Q..#|...c.j.=
>
    2D60: 0C F2 A3 00 3F 45 C0 3F F1 E0 C6 0A 77 70 6C 85  ....?E.?....wpl=
.
    2D70: 2F 3D 87 76 76 0F 09 51 DE 5F 8D 18 21 60 D8 68  /=3D.vv..Q._..!=
`.h
    2D80: 1E 23 EE D8 CE 2E 45 9E 53 AC 47 25 7E A4 80 F7  .#....E.S.G%~..=
.
    2D90: FF 27 F0 31 0F 77 A4 80 33 93 F3 C0 A8 1B 8B E0  .'.1.w..3......=
.
    2DA0: 8D F6 92 8D 3D 58 00 8F 13 A3 0F 16 E0 3A 13 F8  ....=3DX.......=
:..
    2DB0: 60 01 5C CF 07 3E 1D 80 F5 F2 C3 EF 07 30 4E 18  `.\..>.......0N=
.
    2DC0: 30 CE 07 98 1B 86 C3 2C 59 27 0C 7E 5C 73 A4 D5  0......,Y'.~\s.=
.
    2DD0: 6A 20 EC 12 86 23 18 04 4C 27 0B 8F DA 11 28 24  j ...#..L'....(=
$
    2DE0: ED 80 81 12 73 C0 A0 20 06 74 52 08 9D 45 FD FF  ....s.. .tR..E.=
.
    2DF0: 3F 60 F0 83 9D 4F 0D EC 72 EB EB 85 E7 E9 29 73  ?`...O..r.....)=
s
    2E00: 3C 1F 43 0C EB 8B 09 78 6E 14 EC 34 8B B9 B8 B1  <.C....xn..4...=
.
    2E10: B3 1D 3B 15 18 E5 70 DF C0 AC E6 AA 80 9A 11 86  ..;...p........=
.
    2E20: C0 E3 F5 81 11 4C FA 2E 14 20 47 E7 32 47 8F 3A  .....L... G.2G.=
:
    2E30: 47 F9 24 C5 47 EF A3 B9 4F 2B 70 CF 52 3E 42 01  G.$.G...O+p.R>B=
.
    2E40: DF 81 F9 52 80 3B A0 80 E1 FA 80 FD FF C3 BC A2  ...R.;.........=
.
    2E50: E0 CF 28 C0 24 F0 59 0A 74 90 3E A3 00 D7 A1 E2  ..(.$.Y.t.>....=
.
    2E60: CE 28 E0 38 10 1E 3D 3F 47 B1 38 C7 12 74 A8 97  .(.8..=3D?G.8..=
t..
    2E70: 83 6E 9B EC 58 82 8D 72 2C 41 85 A0 D0 09 CA 27  .n..X..r,A.....=
'
    2E80: 09 7E C6 E3 20 06 74 F6 93 04 5A C5 49 02 19 F6  .~.. .t...Z.I..=
.
    2E90: 5C 02 84 FE FF E7 12 F0 9E 13 9F 26 C0 35 6B FC  \..........&.5k=
.
    2EA0: 69 02 7F 3E 01 16 47 46 C0 D9 41 90 1F 19 81 EF  i..>..GF..A....=
.
    2EB0: B9 84 FF FF CF 25 E0 19 B6 CF 25 80 93 9B 34 3F  .....%....%...4=
?
    2EC0: 97 C0 1D BA E3 9C BE 10 57 58 DF 33 E2 27 18 E3  ........WX.3.'.=
.
    2ED0: 58 82 0A 70 F8 02 B4 FF FF 4F 23 E0 3F 17 7B F4  X..p.....O#.?.{=
.
    2EE0: FC 40 E2 43 06 19 3D 8D 7C F8 82 1E F1 30 02 B4  .@.C..=3D.|....=
0..
    2EF0: 07 FA F0 05 C6 DB 03 3F 6E 02 AF D8 87 12 D0 C1  .......?n......=
.
    2F00: F2 43 09 F8 FF FF 87 12 F0 8C 1E 77 F6 02 C7 55  .C.........w...=
U
    2F10: C2 83 37 E0 31 3D 16 18 90 9D 4B 98 EC 73 09 FA  ..7.1=3D....K..=
s..
    2F20: 3C 62 AB B7 63 72 52 C7 08 3F 97 A0 24 9F 4B 00  <b..crR..?..$.K=
.
    2F30: DA 1C BA C0 F1 FF 3F 74 01 3C B8 06 FA 40 02 AE  ......?t.<...@.=
.
    2F40: 7B 82 0F 24 C0 F5 28 00 9E 23 08 FE C8 EC 03 3F  {..$..(..#.....=
?
    2F50: EE A4 EF 53 75 5C E3 1F F1 11 FC FF 1B 3F 7D 91  ...Su\.......?}=
.
    2F60: 7B 81 8F 25 3A F0 A3 04 53 48 EE 01 02 25 10 8E  {..%:...SH...%.=
.
    2F70: 82 F8 00 E1 F0 E7 24 E8 57 4B 7E 7E C0 5F 47 D8  ......$.WK~~._G=
.
    2F80: 28 D9 71 1E 37 4A B8 60 AF 0F 86 B8 C3 13 E1 67  (.q.7J.`.......=
g
    2F90: 5B CC 31 1F EE 51 E1 51 09 5C B3 86 75 58 02 3C  [.1..Q.Q.\..uX.=
<
    2FA0: 78 38 4C 00 AD FF FF 61 09 FC B3 E7 83 38 11 0F  x8L....a.....8.=
.
    2FB0: 1F 03 74 2C 6F 07 EC D8 AB C3 12 6A 0C 3E FA FA  ..t,o......j.>.=
.
    2FC0: E8 C4 20 1F 0F 31 C7 16 76 C2 07 F8 F6 FF 3F E1  .. ..1..v.....?=
.
    2FD0: 03 D6 CE 24 BE 3F 60 AF 2D F8 A3 09 F0 06 F7 D1  ...$.?`.-......=
.
    2FE0: 04 70 F5 FF 3F 9A E0 84 9E 9D 50 67 03 1F 98 6C  .p..?.....Pg...=
l
    2FF0: 14 95 40 BF 69 BC 9F 07 31 F4 49 F0 53 13 06 C2  ..@.i...1.I.S..=
.
    3000: 47 13 9F 24 7C 9C E0 52 E0 28 88 8F 13 8E 79 36  G..$|..R.(....y=
6
    3010: 41 9F 0A 7C 3F 38 09 6C A8 F3 04 50 19 07 FE E8  A..|?8.l...P...=
.
    3020: 04 57 D8 C9 04 64 27 72 60 6E E2 1C 01 94 FE FF  .W...d'r`n.....=
.
    3030: 27 72 E0 70 5A E5 A7 01 7C A0 A3 2A 3A D6 93 41  'r.pZ...|..*:..=
A
    3040: 23 7E 07 08 77 EA E7 F9 40 C0 8E E5 3E 2C F1 F3  #~..w...@...>,.=
.
    3050: 92 4F 11 3E 41 70 49 27 08 0A 62 40 E7 3D 5D 7A  .O.>ApI'..b@.=
=3D]z
    3060: 10 F4 7C C3 8F C5 BE B6 1C C5 23 51 82 F9 0E 01  ..|.......#Q...=
.
    3070: F4 B6 04 4F DE 6D 09 44 18 77 72 16 0C E1 28 7D  ...O.m.D.wr...(=
}
    3080: 80 80 31 C0 C7 84 62 DF 37 F4 BE 04 F3 8A 09 AE  ..1...b.7......=
.
    3090: F3 12 30 9E 89 FF FF 3E CF 21 E4 02 C0 4F E5 60  ..0....>.!...O.=
`
    30A0: 39 36 80 67 1C EC 0A 80 3F 32 C1 3E 35 E2 8E 4C  96.g....?2.>5..=
L
    30B0: 60 98 08 3B E7 1C 08 F6 60 02 BC 55 1C 4C 00 2D  `..;....`..U.L.=
-
    30C0: C3 0D 72 3E 8F E4 C6 79 C3 F3 89 84 9D C4 D9 FF  ..r>...y.......=
.
    30D0: FF 60 C2 25 41 48 FE 61 09 89 8D 9D FE 39 BC B9  .`.%AH.a.....9.=
.
    30E0: 32 82 62 8F 4B A8 C3 84 45 9E 26 50 A7 69 9F 90  2.b.K...E.&P.i.=
.
    30F0: C9 69 82 46 3E 4D A0 87 E6 89 9D 06 6E DC A7 C1  .i.F>M......n..=
.
    3100: 6F 87 FC C0 04 7C 0F 0F F8 D3 04 EC F3 0D 1B 74  o....|.........=
t
    3110: C8 77 87 17 59 1F 26 80 F9 C8 7D 98 00 FF FF FF  .w..Y.&...}....=
.
    3120: D0 04 5C 15 DA F4 A9 D1 A8 55 83 32 35 CA 34 A8  ..\......U.25.4=
.
    3130: D5 A7 52 63 C6 A4 9D 54 BD 54 8D D5 91 9E 0B 02  ..Rc...T.T.....=
.
    3140: 71 D4 05 0B C4 D1 9F 40 02 B1 B8 57 88 40 2C F5  q......@...W.@,=
.
    3150: 05 21 10 CB D4 01 C2 82 BC EF 05 E2 60 52 06 40  .!..........`R.=
@
    3160: AD 80 B0 78 CB 12 88 23 9A 39 01 50 37 20 4C A0  ...x...#.9.P7 L=
.
    3170: 1E 10 26 DC 10 08 8B A3 08 84 09 B6 04 C2 E2 82  ..&............=
.
    3180: 50 C1 9E 8E FD 4C 3E 88 80 1C DA 14 10 93 A0 0A  P....L>........=
.
    3190: 88 25 78 0C 08 C8 71 40 04 E4 50 B6 80 58 44 10  .%x...q@..P..XD=
.
    31A0: 01 59 CF 1B 4E 40 16 07 22 20 8B 36 06 C4 22 80  .Y..N@.." .6.."=
.
    31B0: 08 C8 C9 5E 70 81 48 4C 10 01 39 EC 8A 05 E4 E8  ...^p.HL..9....=
.
    31C0: 20 02 B2 4E 6F 40 4C 34 88 80 2C FE B1 21 20 47   ..No@L4..,..! =
G
    31D0: 01 11 90 03 3E 28 02 91 B8 20 02 B2 46 7B 40 4C  ....>(... ..F{@=
L
    31E0: 30 88 80 2C FB 07 25 20 87 00 D1 00 C9 EB 40 03  0..,..% ......@=
.
    31F0: 24 BF 89 40 44 E2 AB 22 10 D1 0B 22 20 FF FF A5  $..@D.."..." ..=
.
    3200: FF 38 04 E4 20 20 02 26 1A 81 E9 0B 21 10 F9 FF  .8..  .&....!..=
.
    3210: 03 08 5F 48 49 44 0C 41 D0 0C 14 08 5F 55 49 44  .._HID.A...._UI=
D
    3220: 0A 00 08 5F 57 44 47 11 2B 0A 28 6A 0F BC AB A1  ..._WDG.+.(j...=
.
    3230: 8E D1 11 00 A0 C9 06 29 10 00 00 41 41 01 02 21  .......)...AA..=
!
    3240: 12 90 05 66 D5 D1 11 B2 F0 00 A0 C9 06 29 10 42  ...f.........).=
B
    3250: 41 01 00 14 48 0D 57 4D 41 41 03 A0 40 0D 93 68  A...H.WMAA..@..=
h
    3260: 0A 00 A0 1A 91 91 92 93 69 0A 01 92 93 69 0A 02  ........i....i.=
.
    3270: 92 93 69 0A 06 8A 6A 0A 00 57 49 49 44 A0 0A 93  ..i...j..WIID..=
.
    3280: 69 0A 01 A4 41 4D 30 31 A1 43 0A A0 0A 93 69 0A  i...AM01.C....i=
.
    3290: 02 A4 41 4D 30 32 A1 45 09 A0 0E 93 69 0A 03 A4  ..AM02.E....i..=
.
    32A0: 41 4D 30 33 57 49 49 44 A1 43 08 A0 1A 93 69 0A  AM03WIID.C....i=
.
    32B0: 04 8A 6A 0A 04 49 56 41 4C A4 41 4D 30 34 57 49  ..j..IVAL.AM04W=
I
    32C0: 49 44 49 56 41 4C A1 45 06 A0 0E 93 69 0A 05 A4  IDIVAL.E....i..=
.
    32D0: 41 4D 30 35 57 49 49 44 A1 43 05 A0 0A 93 69 0A  AM05WIID.C....i=
.
    32E0: 06 A4 41 4D 30 36 A1 45 04 A0 0A 93 69 0A 07 41  ..AM06.E....i..=
A
    32F0: 4D 30 37 6A A1 37 A0 0D 93 69 0A 08 41 4D 30 38  M07j.7...i..AM0=
8
    3300: 57 49 49 44 A1 27 A0 0A 93 69 0A 09 A4 41 4D 30  WIID.'...i...AM=
0
    3310: 39 A1 1A A0 0B 93 69 0A 0A A4 41 4D 31 30 6A A1  9.....i...AM10j=
.
    3320: 0C A0 0A 93 69 0A 0B A4 41 4D 31 31 5B 80 45 58  ....i...AM11[.E=
X
    3330: 54 4D 00 0C 30 F8 0F 00 0A 12 5B 81 2E 45 58 54  TM..0.....[..EX=
T
    3340: 4D 02 52 4F 4D 31 10 52 4D 53 31 10 52 4F 4D 32  M.ROM1.RMS1.ROM=
2
    3350: 10 52 4D 53 32 10 52 4F 4D 33 10 52 4D 53 33 10  .RMS2.ROM3.RMS3=
.
    3360: 41 4D 45 4D 20 41 49 4E 46 08 5B 80 41 57 59 4D  AMEM AINF.[.AWY=
M
    3370: 00 0C EA FF 0F 00 0A 01 5B 81 19 41 57 59 4D 01  ........[..AWYM=
.
    3380: 00 01 00 01 41 57 4D 44 01 00 01 00 01 00 01 00  ....AWMD.......=
.
    3390: 01 00 01 5B 80 5C 50 30 31 5F 01 0B 01 08 0A 01  ...[.\P01_.....=
.
    33A0: 5B 81 0C 5C 50 30 31 5F 01 50 31 5F 5F 08 5B 80  [..\P01_.P1__.[=
.
    33B0: 5C 50 52 32 30 01 0B 20 08 0A 04 5B 81 0C 5C 50  \PR20.. ...[..\=
P
    33C0: 52 32 30 03 50 32 30 5F 20 08 4F 53 46 58 0A 01  R20.P20_ .OSFX.=
.
    33D0: 08 4C 49 4E 58 0A 00 08 41 4D 41 43 0A 00 08 4F  .LINX...AMAC...=
O
    33E0: 53 46 4C 0A 01 14 41 05 53 54 52 43 02 A0 0A 92  SFL...A.STRC...=
.
    33F0: 93 87 68 87 69 A4 0A 00 72 87 68 0A 01 60 08 42  ..h.i...r.h..`.=
B
    3400: 55 46 30 11 02 60 08 42 55 46 31 11 02 60 70 68  UF0..`.BUF1..`p=
h
    3410: 42 55 46 30 70 69 42 55 46 31 A2 1A 60 76 60 A0  BUF0piBUF1..`v`=
.
    3420: 15 92 93 83 88 42 55 46 30 60 00 83 88 42 55 46  .....BUF0`...BU=
F
    3430: 31 60 00 A4 00 A4 01 5B 80 49 4E 46 4F 00 0C 40  1`.....[.INFO..=
@
    3440: F8 0F 00 0A 01 5B 81 24 49 4E 46 4F 01 4B 42 44  .....[.$INFO.KB=
D
    3450: 49 01 52 54 43 57 01 50 53 32 46 01 49 52 46 4C  I.RTCW.PS2F.IRF=
L
    3460: 02 44 49 53 45 01 53 53 48 55 01 10 17 5C 00 08  .DISE.SSHU...\.=
.
    3470: 50 49 43 46 0A 00 14 0C 5F 50 49 43 01 70 68 50  PICF...._PIC.ph=
P
    3480: 49 43 46 14 28 5C 5F 50 54 53 01 7D 68 0A F0 60  ICF.(\_PTS.}h..=
`
    3490: 70 60 44 42 47 31 A0 05 93 68 0A 01 A0 05 93 68  p`DBG1...h.....=
h
    34A0: 0A 05 53 50 54 53 68 41 50 54 53 68 14 4B 0F 5C  ..SPTShAPTSh.K.=
\
    34B0: 5F 57 41 4B 01 70 0A FF 44 42 47 31 A0 4A 07 93  _WAK.p..DBG1.J.=
.
    34C0: 68 0A 04 A0 0F 93 4F 53 46 4C 0A 02 70 0A 57 53  h.....OSFL..p.W=
S
    34D0: 4D 49 50 A0 0F 93 4F 53 46 4C 0A 01 70 0A 56 53  MIP...OSFL..p.V=
S
    34E0: 4D 49 50 A0 33 93 4F 53 46 4C 0A 00 A0 0F 93 4F  MIP.3.OSFL.....=
O
    34F0: 53 46 58 0A 04 70 0A 59 53 4D 49 50 A1 1A A0 0F  SFX..p.YSMIP...=
.
    3500: 93 4F 53 46 58 0A 03 70 0A 59 53 4D 49 50 A1 08  .OSFX..p.YSMIP.=
.
    3510: 70 0A 58 53 4D 49 50 A0 0F 93 4F 53 46 58 0A 03  p.XSMIP...OSFX.=
.
    3520: 70 0A 59 53 4D 49 50 A0 0F 93 4F 53 46 58 0A 04  p.YSMIP...OSFX.=
.
    3530: 70 0A 59 53 4D 49 50 53 57 41 4B 68 41 57 41 4B  p.YSMIPSWAKhAWA=
K
    3540: 68 A0 15 93 4F 53 46 4C 0A 01 86 5C 2E 5F 53 42  h...OSFL...\._S=
B
    3550: 5F 50 57 52 42 0A 02 A1 3D A0 20 93 68 0A 01 7B  _PWRB...=3D. .h=
..{
    3560: 50 31 5F 5F 0A 04 60 A0 12 93 60 0A 00 86 5C 2E  P1__..`...`...\=
.
    3570: 5F 53 42 5F 50 57 52 42 0A 02 A0 1A 93 68 0A 03  _SB_PWRB.....h.=
.
    3580: A0 14 93 52 54 43 57 00 86 5C 2E 5F 53 42 5F 50  ...RTCW..\._SB_=
P
    3590: 57 52 42 0A 02 A0 12 93 68 0A 04 86 5C 2E 5F 53  WRB.....h...\._=
S
    35A0: 42 5F 50 57 52 42 0A 02 10 06 5C 5F 53 49 5F 10  B_PWRB....\_SI_=
.
    35B0: 4C 21 5C 5F 47 50 45 14 18 5F 4C 30 34 00 86 5C  L!\_GPE.._L04..=
\
    35C0: 2F 03 5F 53 42 5F 50 43 49 30 50 32 50 5F 0A 02  /._SB_PCI0P2P_.=
.
    35D0: 14 4D 0C 5F 4C 31 38 00 86 5C 2F 03 5F 53 42 5F  .M._L18..\/._SB=
_
    35E0: 50 43 49 30 50 43 45 32 0A 02 86 5C 2F 03 5F 53  PCI0PCE2...\/._=
S
    35F0: 42 5F 50 43 49 30 50 43 45 33 0A 02 86 5C 2F 03  B_PCI0PCE3...\/=
.
    3600: 5F 53 42 5F 50 43 49 30 50 43 45 34 0A 02 86 5C  _SB_PCI0PCE4...=
\
    3610: 2F 03 5F 53 42 5F 50 43 49 30 50 43 45 35 0A 02  /._SB_PCI0PCE5.=
.
    3620: 86 5C 2F 03 5F 53 42 5F 50 43 49 30 50 43 45 36  .\/._SB_PCI0PCE=
6
    3630: 0A 02 86 5C 2F 03 5F 53 42 5F 50 43 49 30 50 43  ...\/._SB_PCI0P=
C
    3640: 45 37 0A 02 86 5C 2F 03 5F 53 42 5F 50 43 49 30  E7...\/._SB_PCI=
0
    3650: 50 43 45 39 0A 02 86 5C 2F 03 5F 53 42 5F 50 43  PCE9...\/._SB_P=
C
    3660: 49 30 50 43 45 41 0A 02 86 5C 2F 03 5F 53 42 5F  I0PCEA...\/._SB=
_
    3670: 50 43 49 30 50 43 45 42 0A 02 86 5C 2F 03 5F 53  PCI0PCEB...\/._=
S
    3680: 42 5F 50 43 49 30 50 43 45 43 0A 02 86 5C 2F 03  B_PCI0PCEC...\/=
.
    3690: 5F 53 42 5F 50 43 49 30 50 43 45 44 0A 02 14 2A  _SB_PCI0PCED...=
*
    36A0: 5F 4C 30 33 00 86 5C 2F 03 5F 53 42 5F 50 43 49  _L03..\/._SB_PC=
I
    36B0: 30 50 53 32 4B 0A 02 86 5C 2F 03 5F 53 42 5F 50  0PS2K...\/._SB_=
P
    36C0: 43 49 30 50 53 32 4D 0A 02 14 45 08 5F 4C 30 42  CI0PS2M...E._L0=
B
    36D0: 00 86 5C 2F 03 5F 53 42 5F 50 43 49 30 55 53 42  ..\/._SB_PCI0US=
B
    36E0: 30 0A 02 86 5C 2F 03 5F 53 42 5F 50 43 49 30 55  0...\/._SB_PCI0=
U
    36F0: 53 42 31 0A 02 86 5C 2F 03 5F 53 42 5F 50 43 49  SB1...\/._SB_PC=
I
    3700: 30 55 53 42 32 0A 02 86 5C 2F 03 5F 53 42 5F 50  0USB2...\/._SB_=
P
    3710: 43 49 30 55 53 42 33 0A 02 86 5C 2F 03 5F 53 42  CI0USB3...\/._S=
B
    3720: 5F 50 43 49 30 55 53 42 34 0A 02 86 5C 2F 03 5F  _PCI0USB4...\/.=
_
    3730: 53 42 5F 50 43 49 30 55 53 42 35 0A 02 86 5C 2F  SB_PCI0USB5...\=
/
    3740: 03 5F 53 42 5F 50 43 49 30 55 53 42 36 0A 02 14  ._SB_PCI0USB6..=
.
    3750: 18 5F 4C 31 42 00 86 5C 2F 03 5F 53 42 5F 50 43  ._L1B..\/._SB_P=
C
    3760: 49 30 53 42 41 5A 0A 02 14 18 5F 4C 30 46 00 86  I0SBAZ...._L0F.=
.
    3770: 5C 2F 03 5F 53 42 5F 50 43 49 30 50 45 58 30 0A  \/._SB_PCI0PEX0=
.
    3780: 02 14 18 5F 4C 31 30 00 86 5C 2F 03 5F 53 42 5F  ..._L10..\/._SB=
_
    3790: 50 43 49 30 50 45 58 31 0A 02 14 18 5F 4C 31 31  PCI0PEX1...._L1=
1
    37A0: 00 86 5C 2F 03 5F 53 42 5F 50 43 49 30 50 45 58  ..\/._SB_PCI0PE=
X
    37B0: 32 0A 02 14 18 5F 4C 31 32 00 86 5C 2F 03 5F 53  2...._L12..\/._=
S
    37C0: 42 5F 50 43 49 30 50 45 58 33 0A 02 10 86 41 04  B_PCI0PEX3....A=
.
    37D0: 5C 5F 53 42 5F 5B 82 27 5C 41 57 59 5F 08 5F 48  \_SB_[.'\AWY_._=
H
    37E0: 49 44 0D 41 57 59 30 30 30 31 00 14 12 5F 53 54  ID.AWY0001..._S=
T
    37F0: 41 00 A0 08 41 57 4D 44 A4 0A 0F A4 0A 00 14 06  A...AWMD.......=
.
    3800: 53 4D 4F 44 01 5B 82 19 50 57 52 42 08 5F 48 49  SMOD.[..PWRB._H=
I
    3810: 44 0C 41 D0 0C 0C 14 09 5F 53 54 41 00 A4 0A 0B  D.A....._STA...=
.
    3820: 5B 82 88 11 04 50 43 49 30 08 5F 48 49 44 0C 41  [....PCI0._HID.=
A
    3830: D0 0A 03 08 5F 41 44 52 0A 00 10 1D 5C 00 5B 80  ...._ADR....\.[=
.
    3840: 5C 53 43 50 50 01 0A B0 0A 01 5B 81 0C 5C 53 43  \SCPP.....[..\S=
C
    3850: 50 50 01 53 4D 49 50 08 14 4C 15 5C 2F 03 5F 53  PP.SMIP..L.\/._=
S
    3860: 42 5F 50 43 49 30 5F 49 4E 49 00 A0 24 53 54 52  B_PCI0_INI..$ST=
R
    3870: 43 5C 5F 4F 53 5F 0D 4D 69 63 72 6F 73 6F 66 74  C\_OS_.Microsof=
t
    3880: 20 57 69 6E 64 6F 77 73 00 70 0A 56 53 4D 49 50   Windows.p.VSMI=
P
    3890: A1 4B 0E A0 42 0A 53 54 52 43 5C 5F 4F 53 5F 0D  .K..B.STRC\_OS_=
.
    38A0: 4D 69 63 72 6F 73 6F 66 74 20 57 69 6E 64 6F 77  Microsoft Windo=
w
    38B0: 73 20 4E 54 00 A0 40 07 5B 12 5C 5F 4F 53 49 60  s NT..@.[.\_OSI=
`
    38C0: 70 0A 00 62 A0 2A 5C 5F 4F 53 49 0D 57 69 6E 64  p..b.*\_OSI.Win=
d
    38D0: 6F 77 73 20 32 30 30 31 00 70 0A 00 4F 53 46 4C  ows 2001.p..OSF=
L
    38E0: 70 0A 59 61 70 0A 03 4F 53 46 58 70 0A 01 62 A0  p.Yap..OSFXp..b=
.
    38F0: 14 5C 5F 4F 53 49 0D 57 69 6E 64 6F 77 73 20 32  .\_OSI.Windows =
2
    3900: 30 30 36 00 A0 14 5C 5F 4F 53 49 0D 57 69 6E 64  006...\_OSI.Win=
d
    3910: 6F 77 73 20 32 30 30 39 00 A0 0C 92 93 62 0A 00  ows 2009.....b.=
.
    3920: 70 61 53 4D 49 50 A1 0F 70 0A 58 53 4D 49 50 70  paSMIP..p.XSMIP=
p
    3930: 0A 00 4F 53 46 4C A1 45 04 A0 34 5B 12 5C 5F 4F  ..OSFL.E..4[.\_=
O
    3940: 53 49 60 A0 14 5C 5F 4F 53 49 0D 4C 69 6E 75 78  SI`..\_OSI.Linu=
x
    3950: 00 70 0A 01 4C 49 4E 58 A0 15 5C 5F 4F 53 49 0D  .p..LINX..\_OSI=
.
    3960: 44 61 72 77 69 6E 00 70 0A 01 41 4D 41 43 70 0A  Darwin.p..AMACp=
.
    3970: 57 53 4D 49 50 70 0A 02 4F 53 46 4C 70 4F 53 46  WSMIPp..OSFLpOS=
F
    3980: 58 4F 53 54 59 A0 0F 93 4F 53 46 58 0A 00 70 0A  XOSTY...OSFX..p=
.
    3990: 04 4F 53 54 59 A0 0F 93 4F 53 46 58 0A 03 70 0A  .OSTY...OSFX..p=
.
    39A0: 05 4F 53 54 59 A0 0F 93 4F 53 46 58 0A 04 70 0A  .OSTY...OSFX..p=
.
    39B0: 06 4F 53 54 59 10 4D 04 5C 00 14 48 04 4F 53 54  .OSTY.M.\..H.OS=
T
    39C0: 50 00 A0 0F 93 4F 53 46 4C 0A 01 70 0A 56 53 4D  P....OSFL..p.VS=
M
    39D0: 49 50 A0 0F 93 4F 53 46 4C 0A 02 70 0A 57 53 4D  IP...OSFL..p.WS=
M
    39E0: 49 50 A0 20 93 4F 53 46 4C 0A 00 70 0A 58 61 A0  IP. .OSFL..p.Xa=
.
    39F0: 0D 92 95 4F 53 46 58 0A 03 70 0A 59 61 70 61 53  ...OSFX..p.Yapa=
S
    3A00: 4D 49 50 5B 82 43 08 53 59 53 52 08 5F 48 49 44  MIP[.C.SYSR._HI=
D
    3A10: 0C 41 D0 0C 02 08 5F 55 49 44 0A 01 08 5F 43 52  .A...._UID..._C=
R
    3A20: 53 11 46 06 0A 62 47 01 10 00 10 00 01 10 47 01  S.F..bG.......G=
.
    3A30: 22 00 22 00 01 1E 47 01 44 00 44 00 01 1C 47 01  "."...G.D.D...G=
.
    3A40: 62 00 62 00 01 02 47 01 65 00 65 00 01 0B 47 01  b.b...G.e.e...G=
.
    3A50: 74 00 74 00 01 0C 47 01 91 00 91 00 01 03 47 01  t.t...G.......G=
.
    3A60: A2 00 A2 00 01 1E 47 01 E0 00 E0 00 01 10 47 01  ......G.......G=
.
    3A70: D0 04 D0 04 01 02 47 01 20 02 20 02 01 06 47 01  ......G. . ...G=
.
    3A80: 90 02 90 02 01 05 79 00 5B 80 42 41 52 31 02 0A  ......y.[.BAR1.=
.
    3A90: 14 0A 04 5B 81 0B 42 41 52 31 01 4D 4D 49 4F 20  ...[..BAR1.MMIO
    3AA0: 14 17 5F 53 33 44 00 A0 0B 93 4F 53 46 4C 0A 02  .._S3D....OSFL.=
.
    3AB0: A4 0A 02 A1 04 A4 0A 03 14 09 5F 53 54 41 00 A4  .........._STA.=
.
    3AC0: 0A 0F 14 4C 0E 5F 43 52 53 00 08 42 55 46 30 11  ...L._CRS..BUF0=
.
    3AD0: 4C 08 0A 88 88 0D 00 02 01 00 00 00 00 00 FF 00  L..............=
.
    3AE0: 00 00 00 01 47 01 F8 0C F8 0C 01 08 88 0D 00 01  ....G..........=
.
    3AF0: 0C 03 00 00 00 00 F7 0C 00 00 F8 0C 88 0D 00 01  ...............=
.
    3B00: 0C 03 00 00 00 0D FF FF 00 00 00 F3 87 17 00 00  ...............=
.
    3B10: 0C 03 00 00 00 00 00 00 0A 00 FF FF 0B 00 00 00  ...............=
.
    3B20: 00 00 00 00 02 00 87 17 00 00 0C 03 00 00 00 00  ...............=
.
    3B30: 00 00 0C 00 FF FF 0D 00 00 00 00 00 00 00 02 00  ...............=
.
    3B40: 87 17 00 00 0C 03 00 00 00 00 00 00 10 00 FF FF  ...............=
.
    3B50: BF FE 00 00 00 00 00 00 F0 FF 79 00 8A 42 55 46  ..........y..BU=
F
    3B60: 30 0A 76 54 43 4D 4D 8A 42 55 46 30 0A 82 54 4F  0.vTCMM.BUF0..T=
O
    3B70: 4D 4D 72 41 4D 45 4D 0C 00 00 01 00 54 43 4D 4D  MMrAMEM.....TCM=
M
    3B80: 72 54 43 4D 4D 0C 00 00 10 00 54 43 4D 4D 72 54  rTCMM.....TCMMr=
T
    3B90: 43 4D 4D 0C 00 00 10 00 54 43 4D 4D 74 0C 00 00  CMM.....TCMMt..=
.
    3BA0: C0 FE 54 43 4D 4D 54 4F 4D 4D A4 42 55 46 30 08  ..TCMMTOMM.BUF0=
.
    3BB0: 50 49 43 4D 12 4F 83 44 12 1E 04 0C FF FF 02 00  PICM.O.D.......=
.
    3BC0: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    3BD0: 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF FF 02 00 0A  0LNKC..........=
.
    3BE0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    3BF0: 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 02 00 0A 02  LNKD...........=
.
    3C00: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    3C10: 4E 4B 41 0A 00 12 1E 04 0C FF FF 02 00 0A 03 5C  NKA............=
\
    3C20: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    3C30: 4B 42 0A 00 12 1E 04 0C FF FF 03 00 0A 00 5C 2F  KB............\=
/
    3C40: 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B  ._SB_PCI0LPC0LN=
K
    3C50: 44 0A 00 12 1E 04 0C FF FF 03 00 0A 01 5C 2F 04  D............\/=
.
    3C60: 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 41  _SB_PCI0LPC0LNK=
A
    3C70: 0A 00 12 1E 04 0C FF FF 03 00 0A 02 5C 2F 04 5F  ............\/.=
_
    3C80: 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A  SB_PCI0LPC0LNKB=
.
    3C90: 00 12 1E 04 0C FF FF 03 00 0A 03 5C 2F 04 5F 53  ...........\/._=
S
    3CA0: 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00  B_PCI0LPC0LNKC.=
.
    3CB0: 12 1E 04 0C FF FF 04 00 0A 00 5C 2F 04 5F 53 42  ..........\/._S=
B
    3CC0: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 41 0A 00 12  _PCI0LPC0LNKA..=
.
    3CD0: 1E 04 0C FF FF 04 00 0A 01 5C 2F 04 5F 53 42 5F  .........\/._SB=
_
    3CE0: 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1E  PCI0LPC0LNKB...=
.
    3CF0: 04 0C FF FF 04 00 0A 02 5C 2F 04 5F 53 42 5F 50  ........\/._SB_=
P
    3D00: 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00 12 1E 04  CI0LPC0LNKC....=
.
    3D10: 0C FF FF 04 00 0A 03 5C 2F 04 5F 53 42 5F 50 43  .......\/._SB_P=
C
    3D20: 49 30 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C  I0LPC0LNKD.....=
.
    3D30: FF FF 05 00 0A 00 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    3D40: 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1E 04 0C FF  0LPC0LNKB......=
.
    3D50: FF 05 00 0A 01 5C 2F 04 5F 53 42 5F 50 43 49 30  .....\/._SB_PCI=
0
    3D60: 4C 50 43 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF FF  LPC0LNKC.......=
.
    3D70: 05 00 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    3D80: 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 05  PC0LNKD........=
.
    3D90: 00 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    3DA0: 43 30 4C 4E 4B 41 0A 00 12 1E 04 0C FF FF 06 00  C0LNKA.........=
.
    3DB0: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    3DC0: 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF FF 06 00 0A  0LNKC..........=
.
    3DD0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    3DE0: 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 06 00 0A 02  LNKD...........=
.
    3DF0: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    3E00: 4E 4B 41 0A 00 12 1E 04 0C FF FF 06 00 0A 03 5C  NKA............=
\
    3E10: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    3E20: 4B 42 0A 00 12 1E 04 0C FF FF 07 00 0A 00 5C 2F  KB............\=
/
    3E30: 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B  ._SB_PCI0LPC0LN=
K
    3E40: 44 0A 00 12 1E 04 0C FF FF 07 00 0A 01 5C 2F 04  D............\/=
.
    3E50: 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 41  _SB_PCI0LPC0LNK=
A
    3E60: 0A 00 12 1E 04 0C FF FF 07 00 0A 02 5C 2F 04 5F  ............\/.=
_
    3E70: 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A  SB_PCI0LPC0LNKB=
.
    3E80: 00 12 1E 04 0C FF FF 07 00 0A 03 5C 2F 04 5F 53  ...........\/._=
S
    3E90: 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00  B_PCI0LPC0LNKC.=
.
    3EA0: 12 1E 04 0C FF FF 09 00 0A 00 5C 2F 04 5F 53 42  ..........\/._S=
B
    3EB0: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12  _PCI0LPC0LNKB..=
.
    3EC0: 1E 04 0C FF FF 09 00 0A 01 5C 2F 04 5F 53 42 5F  .........\/._SB=
_
    3ED0: 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00 12 1E  PCI0LPC0LNKC...=
.
    3EE0: 04 0C FF FF 09 00 0A 02 5C 2F 04 5F 53 42 5F 50  ........\/._SB_=
P
    3EF0: 43 49 30 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04  CI0LPC0LNKD....=
.
    3F00: 0C FF FF 09 00 0A 03 5C 2F 04 5F 53 42 5F 50 43  .......\/._SB_P=
C
    3F10: 49 30 4C 50 43 30 4C 4E 4B 41 0A 00 12 1E 04 0C  I0LPC0LNKA.....=
.
    3F20: FF FF 0A 00 0A 00 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    3F30: 30 4C 50 43 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF  0LPC0LNKC......=
.
    3F40: FF 0A 00 0A 01 5C 2F 04 5F 53 42 5F 50 43 49 30  .....\/._SB_PCI=
0
    3F50: 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF  LPC0LNKD.......=
.
    3F60: 0A 00 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    3F70: 50 43 30 4C 4E 4B 41 0A 00 12 1E 04 0C FF FF 0A  PC0LNKA........=
.
    3F80: 00 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    3F90: 43 30 4C 4E 4B 42 0A 00 12 1E 04 0C FF FF 0B 00  C0LNKB.........=
.
    3FA0: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    3FB0: 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 0B 00 0A  0LNKD..........=
.
    3FC0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    3FD0: 4C 4E 4B 41 0A 00 12 1E 04 0C FF FF 0B 00 0A 02  LNKA...........=
.
    3FE0: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    3FF0: 4E 4B 42 0A 00 12 1E 04 0C FF FF 0B 00 0A 03 5C  NKB............=
\
    4000: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    4010: 4B 43 0A 00 12 1E 04 0C FF FF 0C 00 0A 00 5C 2F  KC............\=
/
    4020: 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B  ._SB_PCI0LPC0LN=
K
    4030: 41 0A 00 12 1E 04 0C FF FF 0C 00 0A 01 5C 2F 04  A............\/=
.
    4040: 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42  _SB_PCI0LPC0LNK=
B
    4050: 0A 00 12 1E 04 0C FF FF 0C 00 0A 02 5C 2F 04 5F  ............\/.=
_
    4060: 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A  SB_PCI0LPC0LNKC=
.
    4070: 00 12 1E 04 0C FF FF 0C 00 0A 03 5C 2F 04 5F 53  ...........\/._=
S
    4080: 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 44 0A 00  B_PCI0LPC0LNKD.=
.
    4090: 12 1E 04 0C FF FF 0D 00 0A 00 5C 2F 04 5F 53 42  ..........\/._S=
B
    40A0: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12  _PCI0LPC0LNKB..=
.
    40B0: 1E 04 0C FF FF 0D 00 0A 01 5C 2F 04 5F 53 42 5F  .........\/._SB=
_
    40C0: 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00 12 1E  PCI0LPC0LNKC...=
.
    40D0: 04 0C FF FF 0D 00 0A 02 5C 2F 04 5F 53 42 5F 50  ........\/._SB_=
P
    40E0: 43 49 30 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04  CI0LPC0LNKD....=
.
    40F0: 0C FF FF 0D 00 0A 03 5C 2F 04 5F 53 42 5F 50 43  .......\/._SB_P=
C
    4100: 49 30 4C 50 43 30 4C 4E 4B 41 0A 00 12 1E 04 0C  I0LPC0LNKA.....=
.
    4110: FF FF 14 00 0A 00 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    4120: 30 4C 50 43 30 4C 4E 4B 41 0A 00 12 1E 04 0C FF  0LPC0LNKA......=
.
    4130: FF 14 00 0A 01 5C 2F 04 5F 53 42 5F 50 43 49 30  .....\/._SB_PCI=
0
    4140: 4C 50 43 30 4C 4E 4B 42 0A 00 12 1E 04 0C FF FF  LPC0LNKB.......=
.
    4150: 14 00 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    4160: 50 43 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF FF 14  PC0LNKC........=
.
    4170: 00 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    4180: 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 12 00  C0LNKD.........=
.
    4190: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    41A0: 30 4C 4E 4B 43 0A 00 12 1E 04 0C FF FF 12 00 0A  0LNKC..........=
.
    41B0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    41C0: 4C 4E 4B 42 0A 00 12 1E 04 0C FF FF 12 00 0A 02  LNKB...........=
.
    41D0: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    41E0: 4E 4B 41 0A 00 12 1E 04 0C FF FF 12 00 0A 03 5C  NKA............=
\
    41F0: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    4200: 4B 44 0A 00 12 1E 04 0C FF FF 13 00 0A 00 5C 2F  KD............\=
/
    4210: 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B  ._SB_PCI0LPC0LN=
K
    4220: 43 0A 00 12 1E 04 0C FF FF 13 00 0A 01 5C 2F 04  C............\/=
.
    4230: 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42  _SB_PCI0LPC0LNK=
B
    4240: 0A 00 12 1E 04 0C FF FF 13 00 0A 02 5C 2F 04 5F  ............\/.=
_
    4250: 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 41 0A  SB_PCI0LPC0LNKA=
.
    4260: 00 12 1E 04 0C FF FF 13 00 0A 03 5C 2F 04 5F 53  ...........\/._=
S
    4270: 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 44 0A 00  B_PCI0LPC0LNKD.=
.
    4280: 12 1E 04 0C FF FF 16 00 0A 00 5C 2F 04 5F 53 42  ..........\/._S=
B
    4290: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 43 0A 00 12  _PCI0LPC0LNKC..=
.
    42A0: 1E 04 0C FF FF 16 00 0A 01 5C 2F 04 5F 53 42 5F  .........\/._SB=
_
    42B0: 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1E  PCI0LPC0LNKB...=
.
    42C0: 04 0C FF FF 16 00 0A 02 5C 2F 04 5F 53 42 5F 50  ........\/._SB_=
P
    42D0: 43 49 30 4C 50 43 30 4C 4E 4B 41 0A 00 12 1E 04  CI0LPC0LNKA....=
.
    42E0: 0C FF FF 16 00 0A 03 5C 2F 04 5F 53 42 5F 50 43  .......\/._SB_P=
C
    42F0: 49 30 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C  I0LPC0LNKD.....=
.
    4300: FF FF 11 00 0A 00 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    4310: 30 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF  0LPC0LNKD......=
.
    4320: FF 11 00 0A 01 5C 2F 04 5F 53 42 5F 50 43 49 30  .....\/._SB_PCI=
0
    4330: 4C 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF  LPC0LNKD.......=
.
    4340: 11 00 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    4350: 50 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 11  PC0LNKD........=
.
    4360: 00 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    4370: 43 30 4C 4E 4B 44 0A 00 12 1E 04 0C FF FF 15 00  C0LNKD.........=
.
    4380: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    4390: 30 4C 4E 4B 42 0A 00 12 1E 04 0C FF FF 15 00 0A  0LNKB..........=
.
    43A0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    43B0: 4C 4E 4B 42 0A 00 12 1E 04 0C FF FF 15 00 0A 02  LNKB...........=
.
    43C0: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    43D0: 4E 4B 42 0A 00 12 1E 04 0C FF FF 15 00 0A 03 5C  NKB............=
\
    43E0: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    43F0: 4B 42 0A 00 08 41 50 49 43 12 4B 3B 44 12 0D 04  KB...APIC.K;D..=
.
    4400: 0C FF FF 02 00 0A 00 0A 00 0A 12 12 0D 04 0C FF  ...............=
.
    4410: FF 02 00 0A 01 0A 00 0A 13 12 0D 04 0C FF FF 02  ...............=
.
    4420: 00 0A 02 0A 00 0A 10 12 0D 04 0C FF FF 02 00 0A  ...............=
.
    4430: 03 0A 00 0A 11 12 0D 04 0C FF FF 03 00 0A 00 0A  ...............=
.
    4440: 00 0A 13 12 0D 04 0C FF FF 03 00 0A 01 0A 00 0A  ...............=
.
    4450: 10 12 0D 04 0C FF FF 03 00 0A 02 0A 00 0A 11 12  ...............=
.
    4460: 0D 04 0C FF FF 03 00 0A 03 0A 00 0A 12 12 0D 04  ...............=
.
    4470: 0C FF FF 04 00 0A 00 0A 00 0A 10 12 0D 04 0C FF  ...............=
.
    4480: FF 04 00 0A 01 0A 00 0A 11 12 0D 04 0C FF FF 04  ...............=
.
    4490: 00 0A 02 0A 00 0A 12 12 0D 04 0C FF FF 04 00 0A  ...............=
.
    44A0: 03 0A 00 0A 13 12 0D 04 0C FF FF 05 00 0A 00 0A  ...............=
.
    44B0: 00 0A 11 12 0D 04 0C FF FF 05 00 0A 01 0A 00 0A  ...............=
.
    44C0: 12 12 0D 04 0C FF FF 05 00 0A 02 0A 00 0A 13 12  ...............=
.
    44D0: 0D 04 0C FF FF 05 00 0A 03 0A 00 0A 10 12 0D 04  ...............=
.
    44E0: 0C FF FF 06 00 0A 00 0A 00 0A 12 12 0D 04 0C FF  ...............=
.
    44F0: FF 06 00 0A 01 0A 00 0A 13 12 0D 04 0C FF FF 06  ...............=
.
    4500: 00 0A 02 0A 00 0A 10 12 0D 04 0C FF FF 06 00 0A  ...............=
.
    4510: 03 0A 00 0A 11 12 0D 04 0C FF FF 07 00 0A 00 0A  ...............=
.
    4520: 00 0A 13 12 0D 04 0C FF FF 07 00 0A 01 0A 00 0A  ...............=
.
    4530: 10 12 0D 04 0C FF FF 07 00 0A 02 0A 00 0A 11 12  ...............=
.
    4540: 0D 04 0C FF FF 07 00 0A 03 0A 00 0A 12 12 0D 04  ...............=
.
    4550: 0C FF FF 09 00 0A 00 0A 00 0A 11 12 0D 04 0C FF  ...............=
.
    4560: FF 09 00 0A 01 0A 00 0A 12 12 0D 04 0C FF FF 09  ...............=
.
    4570: 00 0A 02 0A 00 0A 13 12 0D 04 0C FF FF 09 00 0A  ...............=
.
    4580: 03 0A 00 0A 10 12 0D 04 0C FF FF 0A 00 0A 00 0A  ...............=
.
    4590: 00 0A 12 12 0D 04 0C FF FF 0A 00 0A 01 0A 00 0A  ...............=
.
    45A0: 13 12 0D 04 0C FF FF 0A 00 0A 02 0A 00 0A 10 12  ...............=
.
    45B0: 0D 04 0C FF FF 0A 00 0A 03 0A 00 0A 11 12 0D 04  ...............=
.
    45C0: 0C FF FF 0B 00 0A 00 0A 00 0A 13 12 0D 04 0C FF  ...............=
.
    45D0: FF 0B 00 0A 01 0A 00 0A 10 12 0D 04 0C FF FF 0B  ...............=
.
    45E0: 00 0A 02 0A 00 0A 11 12 0D 04 0C FF FF 0B 00 0A  ...............=
.
    45F0: 03 0A 00 0A 12 12 0D 04 0C FF FF 0C 00 0A 00 0A  ...............=
.
    4600: 00 0A 10 12 0D 04 0C FF FF 0C 00 0A 01 0A 00 0A  ...............=
.
    4610: 11 12 0D 04 0C FF FF 0C 00 0A 02 0A 00 0A 12 12  ...............=
.
    4620: 0D 04 0C FF FF 0C 00 0A 03 0A 00 0A 13 12 0D 04  ...............=
.
    4630: 0C FF FF 0D 00 0A 00 0A 00 0A 11 12 0D 04 0C FF  ...............=
.
    4640: FF 0D 00 0A 01 0A 00 0A 12 12 0D 04 0C FF FF 0D  ...............=
.
    4650: 00 0A 02 0A 00 0A 13 12 0D 04 0C FF FF 0D 00 0A  ...............=
.
    4660: 03 0A 00 0A 10 12 0D 04 0C FF FF 14 00 0A 00 0A  ...............=
.
    4670: 00 0A 10 12 0D 04 0C FF FF 14 00 0A 01 0A 00 0A  ...............=
.
    4680: 11 12 0D 04 0C FF FF 14 00 0A 02 0A 00 0A 12 12  ...............=
.
    4690: 0D 04 0C FF FF 14 00 0A 03 0A 00 0A 13 12 0D 04  ...............=
.
    46A0: 0C FF FF 12 00 0A 00 0A 00 0A 12 12 0D 04 0C FF  ...............=
.
    46B0: FF 12 00 0A 01 0A 00 0A 11 12 0D 04 0C FF FF 12  ...............=
.
    46C0: 00 0A 02 0A 00 0A 10 12 0D 04 0C FF FF 12 00 0A  ...............=
.
    46D0: 03 0A 00 0A 13 12 0D 04 0C FF FF 13 00 0A 00 0A  ...............=
.
    46E0: 00 0A 12 12 0D 04 0C FF FF 13 00 0A 01 0A 00 0A  ...............=
.
    46F0: 11 12 0D 04 0C FF FF 13 00 0A 02 0A 00 0A 10 12  ...............=
.
    4700: 0D 04 0C FF FF 13 00 0A 03 0A 00 0A 13 12 0D 04  ...............=
.
    4710: 0C FF FF 16 00 0A 00 0A 00 0A 12 12 0D 04 0C FF  ...............=
.
    4720: FF 16 00 0A 01 0A 00 0A 11 12 0D 04 0C FF FF 16  ...............=
.
    4730: 00 0A 02 0A 00 0A 10 12 0D 04 0C FF FF 16 00 0A  ...............=
.
    4740: 03 0A 00 0A 13 12 0D 04 0C FF FF 11 00 0A 00 0A  ...............=
.
    4750: 00 0A 13 12 0D 04 0C FF FF 11 00 0A 01 0A 00 0A  ...............=
.
    4760: 13 12 0D 04 0C FF FF 11 00 0A 02 0A 00 0A 13 12  ...............=
.
    4770: 0D 04 0C FF FF 11 00 0A 03 0A 00 0A 13 12 0D 04  ...............=
.
    4780: 0C FF FF 15 00 0A 00 0A 00 0A 11 12 0D 04 0C FF  ...............=
.
    4790: FF 15 00 0A 01 0A 00 0A 11 12 0D 04 0C FF FF 15  ...............=
.
    47A0: 00 0A 02 0A 00 0A 11 12 0D 04 0C FF FF 15 00 0A  ...............=
.
    47B0: 03 0A 00 0A 11 14 19 5F 50 52 54 00 A0 0B 92 50  ......._PRT....=
P
    47C0: 49 43 46 A4 50 49 43 4D A1 06 A4 41 50 49 43 5B  ICF.PICM...APIC=
[
    47D0: 82 43 05 53 4D 42 30 08 5F 41 44 52 0C 00 00 14  .C.SMB0._ADR...=
.
    47E0: 00 5B 80 5C 2F 04 5F 53 42 5F 50 43 49 30 53 4D  .[.\/._SB_PCI0S=
M
    47F0: 42 30 48 45 54 54 02 0A 64 0A 02 10 28 5C 00 5B  B0HETT..d...(\.=
[
    4800: 81 23 5C 2F 04 5F 53 42 5F 50 43 49 30 53 4D 42  .#\/._SB_PCI0SM=
B
    4810: 30 48 45 54 54 01 48 50 30 5F 08 00 02 48 50 54  0HETT.HP0_...HP=
T
    4820: 46 01 00 05 5B 82 33 55 53 42 30 08 5F 41 44 52  F...[.3USB0._AD=
R
    4830: 0C 00 00 12 00 08 5F 50 52 57 12 06 02 0A 0B 0A  ......_PRW.....=
.
    4840: 03 14 17 5F 53 33 44 00 A0 0B 93 4F 53 46 4C 0A  ..._S3D....OSFL=
.
    4850: 02 A4 0A 02 A1 04 A4 0A 03 5B 82 33 55 53 42 31  .........[.3USB=
1
    4860: 08 5F 41 44 52 0C 02 00 12 00 08 5F 50 52 57 12  ._ADR......_PRW=
.
    4870: 06 02 0A 0B 0A 03 14 17 5F 53 33 44 00 A0 0B 93  ........_S3D...=
.
    4880: 4F 53 46 4C 0A 02 A4 0A 02 A1 04 A4 0A 03 5B 82  OSFL..........[=
.
    4890: 33 55 53 42 32 08 5F 41 44 52 0C 00 00 13 00 08  3USB2._ADR.....=
.
    48A0: 5F 50 52 57 12 06 02 0A 0B 0A 03 14 17 5F 53 33  _PRW........._S=
3
    48B0: 44 00 A0 0B 93 4F 53 46 4C 0A 02 A4 0A 02 A1 04  D....OSFL......=
.
    48C0: A4 0A 03 5B 82 33 55 53 42 33 08 5F 41 44 52 0C  ...[.3USB3._ADR=
.
    48D0: 02 00 13 00 08 5F 50 52 57 12 06 02 0A 0B 0A 03  ....._PRW......=
.
    48E0: 14 17 5F 53 33 44 00 A0 0B 93 4F 53 46 4C 0A 02  .._S3D....OSFL.=
.
    48F0: A4 0A 02 A1 04 A4 0A 03 5B 82 33 55 53 42 34 08  ........[.3USB4=
.
    4900: 5F 41 44 52 0C 00 00 16 00 08 5F 50 52 57 12 06  _ADR......_PRW.=
.
    4910: 02 0A 0B 0A 03 14 17 5F 53 33 44 00 A0 0B 93 4F  ......._S3D....=
O
    4920: 53 46 4C 0A 02 A4 0A 02 A1 04 A4 0A 03 5B 82 33  SFL..........[.=
3
    4930: 55 53 42 35 08 5F 41 44 52 0C 02 00 16 00 08 5F  USB5._ADR......=
_
    4940: 50 52 57 12 06 02 0A 0B 0A 03 14 17 5F 53 33 44  PRW........._S3=
D
    4950: 00 A0 0B 93 4F 53 46 4C 0A 02 A4 0A 02 A1 04 A4  ....OSFL.......=
.
    4960: 0A 03 5B 82 33 55 53 42 36 08 5F 41 44 52 0C 05  ..[.3USB6._ADR.=
.
    4970: 00 14 00 08 5F 50 52 57 12 06 02 0A 0B 0A 03 14  ...._PRW.......=
.
    4980: 17 5F 53 33 44 00 A0 0B 93 4F 53 46 4C 0A 02 A4  ._S3D....OSFL..=
.
    4990: 0A 02 A1 04 A4 0A 03 5B 82 42 04 53 42 41 5A 08  .......[.B.SBAZ=
.
    49A0: 5F 41 44 52 0C 02 00 14 00 5B 80 50 43 49 5F 02  _ADR.....[.PCI_=
.
    49B0: 0A 00 0B 00 01 5B 81 18 50 43 49 5F 00 00 40 21  .....[..PCI_..@=
!
    49C0: 44 4E 53 50 01 44 4E 53 4F 01 45 4E 53 52 01 08  DNSP.DNSO.ENSR.=
.
    49D0: 5F 50 52 57 12 06 02 0A 1B 0A 04 5B 82 46 4E 53  _PRW.......[.FN=
S
    49E0: 41 54 41 08 5F 41 44 52 0C 00 00 11 00 14 06 5F  ATA._ADR.......=
_
    49F0: 49 4E 49 00 5B 80 53 41 43 53 02 0A 00 0A 40 5B  INI.[.SACS....@=
[
    4A00: 81 0E 53 41 43 53 00 00 40 12 53 54 42 35 20 08  ..SACS..@.STB5 =
.
    4A10: 53 50 54 4D 11 17 0A 14 78 00 00 00 0F 00 00 00  SPTM....x......=
.
    4A20: 78 00 00 00 0F 00 00 00 1F 00 00 00 5B 82 4B 24  x...........[.K=
$
    4A30: 50 52 49 44 08 5F 41 44 52 0A 00 14 0B 5F 47 54  PRID._ADR...._G=
T
    4A40: 4D 00 A4 53 50 54 4D 14 06 5F 53 54 4D 03 08 50  M..SPTM.._STM..=
P
    4A50: 52 49 53 0A 00 14 41 0A 5F 50 53 30 00 5B 80 42  RIS...A._PS0.[.=
B
    4A60: 41 52 5F 00 53 54 42 35 0B 00 04 5B 81 3B 42 41  AR_.STB5...[.;B=
A
    4A70: 52 5F 00 00 40 90 00 07 50 4D 42 59 01 00 38 50  R_..@...PMBY..8=
P
    4A80: 4D 53 30 04 00 04 50 4D 53 31 04 00 44 7B 00 07  MS0...PMS1..D{.=
.
    4A90: 50 53 42 59 01 00 38 50 53 53 30 04 00 04 50 53  PSBY..8PSS0...P=
S
    4AA0: 53 31 04 00 44 3B 00 07 A0 47 04 91 93 4F 53 54  S1..D;...G...OS=
T
    4AB0: 59 0A 06 93 4F 53 54 59 0A 04 A0 1A 50 4D 53 31  Y...OSTY....PMS=
1
    4AC0: 70 0A 32 60 A2 10 90 93 50 4D 42 59 0A 01 60 5B  p.2`....PMBY..`=
[
    4AD0: 22 0A FA 76 60 A0 1A 50 53 53 31 70 0A 32 60 A2  "..v`..PSS1p.2`=
.
    4AE0: 10 90 93 50 53 42 59 0A 01 60 5B 22 0A FA 76 60  ...PSBY..`["..v=
`
    4AF0: 70 0A 00 50 52 49 53 14 0D 5F 50 53 33 00 70 0A  p..PRIS.._PS3.p=
.
    4B00: 03 50 52 49 53 14 0B 5F 50 53 43 00 A4 50 52 49  .PRIS.._PSC..PR=
I
    4B10: 53 5B 82 41 0B 50 5F 44 30 08 5F 41 44 52 0A 00  S[.A.P_D0._ADR.=
.
    4B20: 14 3E 5F 53 54 41 00 5B 80 42 41 52 5F 00 53 54  .>_STA.[.BAR_.S=
T
    4B30: 42 35 0B 00 04 5B 81 15 42 41 52 5F 00 00 40 94  B5...[..BAR_..@=
.
    4B40: 50 4D 53 30 04 00 04 50 4D 53 31 04 A0 0D 80 93  PMS0...PMS1....=
.
    4B50: 50 4D 53 31 0A 00 00 A4 0A 0F A1 04 A4 0A 00 08  PMS1...........=
.
    4B60: 53 31 32 50 0A 00 14 43 04 5F 50 53 30 00 5B 80  S12P...C._PS0.[=
.
    4B70: 42 41 52 5F 00 53 54 42 35 0B 00 04 5B 81 10 42  BAR_.STB5...[..=
B
    4B80: 41 52 5F 00 00 40 90 00 07 50 4D 42 59 01 70 0A  AR_..@...PMBY.p=
.
    4B90: 32 60 A2 10 90 93 50 4D 42 59 0A 01 60 5B 22 0A  2`....PMBY..`["=
.
    4BA0: FA 76 60 70 0A 00 53 31 32 50 14 0D 5F 50 53 33  .v`p..S12P.._PS=
3
    4BB0: 00 70 0A 03 53 31 32 50 14 0B 5F 50 53 43 00 A4  .p..S12P.._PSC.=
.
    4BC0: 53 31 32 50 5B 82 43 0B 50 5F 44 31 08 5F 41 44  S12P[.C.P_D1._A=
D
    4BD0: 52 0A 01 14 3F 5F 53 54 41 00 5B 80 42 41 52 5F  R...?_STA.[.BAR=
_
    4BE0: 00 53 54 42 35 0B 00 04 5B 81 16 42 41 52 5F 00  .STB5...[..BAR_=
.
    4BF0: 00 80 14 01 50 53 53 30 04 00 04 50 53 53 31 04  ....PSS0...PSS1=
.
    4C00: A0 0D 80 93 50 53 53 31 0A 00 00 A4 0A 0F A1 04  ....PSS1.......=
.
    4C10: A4 0A 00 08 53 31 32 50 0A 00 14 44 04 5F 50 53  ....S12P...D._P=
S
    4C20: 30 00 5B 80 42 41 52 5F 00 53 54 42 35 0B 00 04  0.[.BAR_.STB5..=
.
    4C30: 5B 81 11 42 41 52 5F 00 00 80 10 01 00 07 50 53  [..BAR_.......P=
S
    4C40: 42 59 01 70 0A 32 60 A2 10 90 93 50 53 42 59 0A  BY.p.2`....PSBY=
.
    4C50: 01 60 5B 22 0A FA 76 60 70 0A 00 53 31 32 50 14  .`["..v`p..S12P=
.
    4C60: 0D 5F 50 53 33 00 70 0A 03 53 31 32 50 14 0B 5F  ._PS3.p..S12P..=
_
    4C70: 50 53 43 00 A4 53 31 32 50 5B 82 48 24 53 45 43  PSC..S12P[.H$SE=
C
    4C80: 44 08 5F 41 44 52 0A 01 14 0B 5F 47 54 4D 00 A4  D._ADR...._GTM.=
.
    4C90: 53 50 54 4D 14 06 5F 53 54 4D 03 08 53 45 43 53  SPTM.._STM..SEC=
S
    4CA0: 0A 00 14 4E 09 5F 50 53 30 00 5B 80 42 41 52 5F  ...N._PS0.[.BAR=
_
    4CB0: 00 53 54 42 35 0B 00 04 5B 81 38 42 41 52 5F 00  .STB5...[.8BAR_=
.
    4CC0: 00 40 D0 00 07 53 4D 42 59 01 00 38 53 4D 53 30  .@...SMBY..8SMS=
0
    4CD0: 04 00 04 53 4D 53 31 04 00 44 7B 00 07 53 53 42  ...SMS1..D{..SS=
B
    4CE0: 59 01 00 38 53 53 53 30 04 00 04 53 53 53 31 04  Y..8SSS0...SSS1=
.
    4CF0: 00 14 A0 47 04 91 93 4F 53 54 59 0A 06 93 4F 53  ...G...OSTY...O=
S
    4D00: 54 59 0A 04 A0 1A 53 4D 53 31 70 0A 32 60 A2 10  TY....SMS1p.2`.=
.
    4D10: 90 93 53 4D 42 59 0A 01 60 5B 22 0A FA 76 60 A0  ..SMBY..`["..v`=
.
    4D20: 1A 53 53 53 31 70 0A 32 60 A2 10 90 93 53 53 42  .SSS1p.2`....SS=
B
    4D30: 59 0A 01 60 5B 22 0A FA 76 60 70 0A 00 53 45 43  Y..`["..v`p..SE=
C
    4D40: 53 14 0D 5F 50 53 33 00 70 0A 03 53 45 43 53 14  S.._PS3.p..SECS=
.
    4D50: 0B 5F 50 53 43 00 A4 53 45 43 53 5B 82 41 0B 53  ._PSC..SECS[.A.=
S
    4D60: 5F 44 30 08 5F 41 44 52 0A 00 14 3E 5F 53 54 41  _D0._ADR...>_ST=
A
    4D70: 00 5B 80 42 41 52 5F 00 53 54 42 35 0B 00 04 5B  .[.BAR_.STB5...=
[
    4D80: 81 15 42 41 52 5F 00 00 40 D4 53 4D 53 30 04 00  ..BAR_..@.SMS0.=
.
    4D90: 04 53 4D 53 31 04 A0 0D 80 93 53 4D 53 31 0A 00  .SMS1.....SMS1.=
.
    4DA0: 00 A4 0A 0F A1 04 A4 0A 00 08 53 31 32 50 0A 00  ..........S12P.=
.
    4DB0: 14 43 04 5F 50 53 30 00 5B 80 42 41 52 5F 00 53  .C._PS0.[.BAR_.=
S
    4DC0: 54 42 35 0B 00 10 5B 81 10 42 41 52 5F 00 00 40  TB5...[..BAR_..=
@
    4DD0: D0 00 07 53 4D 42 59 01 70 0A 32 60 A2 10 90 93  ...SMBY.p.2`...=
.
    4DE0: 53 4D 42 59 0A 01 60 5B 22 0A FA 76 60 70 0A 00  SMBY..`["..v`p.=
.
    4DF0: 53 31 32 50 14 0D 5F 50 53 33 00 70 0A 03 53 31  S12P.._PS3.p..S=
1
    4E00: 32 50 14 0B 5F 50 53 43 00 A4 53 31 32 50 5B 82  2P.._PSC..S12P[=
.
    4E10: 43 0B 53 5F 44 31 08 5F 41 44 52 0A 01 14 3F 5F  C.S_D1._ADR...?=
_
    4E20: 53 54 41 00 5B 80 42 41 52 5F 00 53 54 42 35 0B  STA.[.BAR_.STB5=
.
    4E30: 00 04 5B 81 16 42 41 52 5F 00 00 80 54 01 53 53  ..[..BAR_...T.S=
S
    4E40: 53 30 04 00 04 53 53 53 31 04 A0 0D 80 93 53 53  S0...SSS1.....S=
S
    4E50: 53 31 0A 00 00 A4 0A 0F A1 04 A4 0A 00 08 53 31  S1............S=
1
    4E60: 32 50 0A 00 14 44 04 5F 50 53 30 00 5B 80 42 41  2P...D._PS0.[.B=
A
    4E70: 52 5F 00 53 54 42 35 0B 00 04 5B 81 11 42 41 52  R_.STB5...[..BA=
R
    4E80: 5F 00 00 80 50 01 00 07 53 53 42 59 01 70 0A 32  _...P...SSBY.p.=
2
    4E90: 60 A2 10 90 93 53 53 42 59 0A 01 60 5B 22 0A FA  `....SSBY..`[".=
.
    4EA0: 76 60 70 0A 00 53 31 32 50 14 0D 5F 50 53 33 00  v`p..S12P.._PS3=
.
    4EB0: 70 0A 03 53 31 32 50 14 0B 5F 50 53 43 00 A4 53  p..S12P.._PSC..=
S
    4EC0: 31 32 50 5B 82 45 0F 50 45 58 30 08 5F 41 44 52  12P[.E.PEX0._AD=
R
    4ED0: 0C 00 00 15 00 14 09 5F 53 54 41 00 A4 0A 0F 08  ......._STA....=
.
    4EE0: 5F 50 52 57 12 06 02 0A 0F 0A 05 08 50 49 43 30  _PRW........PIC=
0
    4EF0: 12 47 07 04 12 1C 04 0B FF FF 0A 00 5C 2F 04 5F  .G..........\/.=
_
    4F00: 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A  SB_PCI0LPC0LNKB=
.
    4F10: 00 12 1C 04 0B FF FF 0A 01 5C 2F 04 5F 53 42 5F  .........\/._SB=
_
    4F20: 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1C  PCI0LPC0LNKB...=
.
    4F30: 04 0B FF FF 0A 02 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    4F40: 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1C 04 0B FF  0LPC0LNKB......=
.
    4F50: FF 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    4F60: 43 30 4C 4E 4B 42 0A 00 08 41 50 49 30 12 32 04  C0LNKB...API0.2=
.
    4F70: 12 0B 04 0B FF FF 0A 00 0A 00 0A 11 12 0B 04 0B  ...............=
.
    4F80: FF FF 0A 01 0A 00 0A 11 12 0B 04 0B FF FF 0A 02  ...............=
.
    4F90: 0A 00 0A 11 12 0B 04 0B FF FF 0A 03 0A 00 0A 11  ...............=
.
    4FA0: 14 19 5F 50 52 54 00 A0 0B 92 50 49 43 46 A4 50  .._PRT....PICF.=
P
    4FB0: 49 43 30 A1 06 A4 41 50 49 30 5B 82 45 0F 50 45  IC0...API0[.E.P=
E
    4FC0: 58 31 08 5F 41 44 52 0C 01 00 15 00 14 09 5F 53  X1._ADR......._=
S
    4FD0: 54 41 00 A4 0A 0F 08 5F 50 52 57 12 06 02 0A 10  TA....._PRW....=
.
    4FE0: 0A 05 08 50 49 43 31 12 47 07 04 12 1C 04 0B FF  ...PIC1.G......=
.
    4FF0: FF 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    5000: 43 30 4C 4E 4B 42 0A 00 12 1C 04 0B FF FF 0A 01  C0LNKB.........=
.
    5010: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    5020: 4E 4B 42 0A 00 12 1C 04 0B FF FF 0A 02 5C 2F 04  NKB..........\/=
.
    5030: 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42  _SB_PCI0LPC0LNK=
B
    5040: 0A 00 12 1C 04 0B FF FF 0A 03 5C 2F 04 5F 53 42  ..........\/._S=
B
    5050: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 08  _PCI0LPC0LNKB..=
.
    5060: 41 50 49 31 12 32 04 12 0B 04 0B FF FF 0A 00 0A  API1.2.........=
.
    5070: 00 0A 11 12 0B 04 0B FF FF 0A 01 0A 00 0A 11 12  ...............=
.
    5080: 0B 04 0B FF FF 0A 02 0A 00 0A 11 12 0B 04 0B FF  ...............=
.
    5090: FF 0A 03 0A 00 0A 11 14 19 5F 50 52 54 00 A0 0B  ........._PRT..=
.
    50A0: 92 50 49 43 46 A4 50 49 43 31 A1 06 A4 41 50 49  .PICF.PIC1...AP=
I
    50B0: 31 5B 82 45 0F 50 45 58 32 08 5F 41 44 52 0C 02  1[.E.PEX2._ADR.=
.
    50C0: 00 15 00 14 09 5F 53 54 41 00 A4 0A 0F 08 5F 50  ....._STA....._=
P
    50D0: 52 57 12 06 02 0A 11 0A 05 08 50 49 43 32 12 47  RW........PIC2.=
G
    50E0: 07 04 12 1C 04 0B FF FF 0A 00 5C 2F 04 5F 53 42  ..........\/._S=
B
    50F0: 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12  _PCI0LPC0LNKB..=
.
    5100: 1C 04 0B FF FF 0A 01 5C 2F 04 5F 53 42 5F 50 43  .......\/._SB_P=
C
    5110: 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 12 1C 04 0B  I0LPC0LNKB.....=
.
    5120: FF FF 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    5130: 50 43 30 4C 4E 4B 42 0A 00 12 1C 04 0B FF FF 0A  PC0LNKB........=
.
    5140: 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    5150: 4C 4E 4B 42 0A 00 08 41 50 49 32 12 32 04 12 0B  LNKB...API2.2..=
.
    5160: 04 0B FF FF 0A 00 0A 00 0A 11 12 0B 04 0B FF FF  ...............=
.
    5170: 0A 01 0A 00 0A 11 12 0B 04 0B FF FF 0A 02 0A 00  ...............=
.
    5180: 0A 11 12 0B 04 0B FF FF 0A 03 0A 00 0A 11 14 19  ...............=
.
    5190: 5F 50 52 54 00 A0 0B 92 50 49 43 46 A4 50 49 43  _PRT....PICF.PI=
C
    51A0: 32 A1 06 A4 41 50 49 32 5B 82 45 0F 50 45 58 33  2...API2[.E.PEX=
3
    51B0: 08 5F 41 44 52 0C 03 00 15 00 14 09 5F 53 54 41  ._ADR......._ST=
A
    51C0: 00 A4 0A 0F 08 5F 50 52 57 12 06 02 0A 12 0A 05  ....._PRW......=
.
    51D0: 08 50 49 43 33 12 47 07 04 12 1C 04 0B FF FF 0A  .PIC3.G........=
.
    51E0: 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    51F0: 4C 4E 4B 42 0A 00 12 1C 04 0B FF FF 0A 01 5C 2F  LNKB..........\=
/
    5200: 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B  ._SB_PCI0LPC0LN=
K
    5210: 42 0A 00 12 1C 04 0B FF FF 0A 02 5C 2F 04 5F 53  B..........\/._=
S
    5220: 42 5F 50 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00  B_PCI0LPC0LNKB.=
.
    5230: 12 1C 04 0B FF FF 0A 03 5C 2F 04 5F 53 42 5F 50  ........\/._SB_=
P
    5240: 43 49 30 4C 50 43 30 4C 4E 4B 42 0A 00 08 41 50  CI0LPC0LNKB...A=
P
    5250: 49 33 12 32 04 12 0B 04 0B FF FF 0A 00 0A 00 0A  I3.2...........=
.
    5260: 11 12 0B 04 0B FF FF 0A 01 0A 00 0A 11 12 0B 04  ...............=
.
    5270: 0B FF FF 0A 02 0A 00 0A 11 12 0B 04 0B FF FF 0A  ...............=
.
    5280: 03 0A 00 0A 11 14 19 5F 50 52 54 00 A0 0B 92 50  ......._PRT....=
P
    5290: 49 43 46 A4 50 49 43 33 A1 06 A4 41 50 49 33 5B  ICF.PIC3...API3=
[
    52A0: 82 49 86 4C 50 43 30 08 5F 41 44 52 0C 03 00 14  .I.LPC0._ADR...=
.
    52B0: 00 5B 82 46 14 50 4D 49 4F 08 5F 48 49 44 0C 41  .[.F.PMIO._HID.=
A
    52C0: D0 0C 02 08 5F 55 49 44 0A 03 14 4E 12 5F 43 52  ...._UID...N._C=
R
    52D0: 53 00 08 42 55 46 30 11 42 0C 0A BE 47 01 00 09  S..BUF0.B...G..=
.
    52E0: 00 09 01 20 47 01 28 02 28 02 01 08 47 01 0B 04  ... G.(.(...G..=
.
    52F0: 0B 04 01 01 47 01 D6 04 D6 04 01 01 47 01 00 0C  ....G.......G..=
.
    5300: 00 0C 01 02 47 01 14 0C 14 0C 01 01 47 01 50 0C  ....G.......G.P=
.
    5310: 50 0C 01 03 47 01 6C 0C 6C 0C 01 02 47 01 6F 0C  P...G.l.l...G.o=
.
    5320: 6F 0C 01 01 47 01 D0 0C D0 0C 01 02 47 01 D2 0C  o...G.......G..=
.
    5330: D2 0C 01 02 47 01 D4 0C D4 0C 01 0C 47 01 00 08  ....G.......G..=
.
    5340: 00 08 01 FF 47 01 10 0A 10 0A 01 08 47 01 00 0B  ....G.......G..=
.
    5350: 00 0B 01 10 47 01 10 0B 10 0B 01 10 47 01 20 0B  ....G.......G. =
.
    5360: 20 0B 01 20 87 17 00 00 0C 03 00 00 00 00 00 00   .. ...........=
.
    5370: 00 E0 00 00 00 E0 00 00 00 00 00 00 00 00 87 17  ...............=
.
    5380: 00 00 0C 03 00 00 00 00 00 04 E0 FE FF 0F E0 FE  ...............=
.
    5390: 00 00 00 00 FF 0B 00 00 79 00 8A 42 55 46 30 0A  ........y..BUF0=
.
    53A0: 92 42 41 52 58 8A 42 55 46 30 0A 9E 47 41 4C 4E  .BARX.BUF0..GAL=
N
    53B0: 8A 42 55 46 30 0A 96 47 41 4D 58 70 0B 00 10 47  .BUF0..GAMXp...=
G
    53C0: 41 4C 4E 70 5C 2F 03 5F 53 42 5F 50 43 49 30 4D  ALNp\/._SB_PCI0=
M
    53D0: 4D 49 4F 60 7B 60 0C F0 FF FF FF 42 41 52 58 72  MIO`{`.....BARX=
r
    53E0: 60 47 41 4C 4E 47 41 4D 58 74 47 41 4D 58 0A 01  `GALNGAMXtGAMX.=
.
    53F0: 47 41 4D 58 A4 42 55 46 30 5B 80 50 49 52 51 01  GAMX.BUF0[.PIRQ=
.
    5400: 0B 00 0C 0A 02 5B 81 10 50 49 52 51 01 50 49 49  .....[..PIRQ.PI=
I
    5410: 44 08 50 49 44 41 08 08 49 50 52 53 11 09 0A 06  D.PIDA..IPRS...=
.
    5420: 23 F8 0C 18 79 00 5B 86 43 09 50 49 49 44 50 49  #...y.[.C.PIIDP=
I
    5430: 44 41 01 50 49 52 41 08 50 49 52 42 08 50 49 52  DA.PIRA.PIRB.PI=
R
    5440: 43 08 50 49 52 44 08 50 49 52 45 08 50 49 52 46  C.PIRD.PIRE.PIR=
F
    5450: 08 50 49 52 47 08 50 49 52 48 08 00 40 04 50 49  .PIRG.PIRH..@.P=
I
    5460: 52 53 08 00 10 48 44 41 44 08 00 08 47 45 43 5F  RS...HDAD...GEC=
_
    5470: 08 00 40 0D 55 53 42 31 08 55 53 42 32 08 55 53  ..@.USB1.USB2.U=
S
    5480: 42 33 08 55 53 42 34 08 55 53 42 35 08 55 53 42  B3.USB4.USB5.US=
B
    5490: 36 08 55 53 42 37 08 00 48 04 49 44 45 5F 08 53  6.USB7..H.IDE_.=
S
    54A0: 41 54 41 08 00 40 07 47 50 50 30 08 47 50 50 31  ATA..@.GPP0.GPP=
1
    54B0: 08 47 50 50 32 08 47 50 50 33 08 14 3E 44 53 50  .GPP2.GPP3..>DS=
P
    54C0: 49 00 70 0A 00 50 49 52 41 70 0A 00 50 49 52 42  I.p..PIRAp..PIR=
B
    54D0: 70 0A 00 50 49 52 43 70 0A 00 50 49 52 44 70 0A  p..PIRCp..PIRDp=
.
    54E0: 00 50 49 52 45 70 0A 00 50 49 52 46 70 0A 00 50  .PIREp..PIRFp..=
P
    54F0: 49 52 47 70 0A 00 50 49 52 48 5B 82 45 08 4C 4E  IRGp..PIRH[.E.L=
N
    5500: 4B 41 08 5F 48 49 44 0C 41 D0 0C 0F 08 5F 55 49  KA._HID.A...._U=
I
    5510: 44 0A 01 14 14 5F 53 54 41 00 A0 08 50 49 52 41  D...._STA...PIR=
A
    5520: A4 0A 0B A1 04 A4 0A 09 14 0B 5F 50 52 53 00 A4  .........._PRS.=
.
    5530: 49 50 52 53 14 0D 5F 44 49 53 00 70 0A 00 50 49  IPRS.._DIS.p..P=
I
    5540: 52 41 14 21 5F 43 52 53 00 70 49 50 52 53 60 8B  RA.!_CRS.pIPRS`=
.
    5550: 60 0A 01 49 52 51 30 79 0A 01 50 49 52 41 49 52  `..IRQ0y..PIRAI=
R
    5560: 51 30 A4 60 14 1C 5F 53 52 53 01 8B 68 0A 01 49  Q0.`.._SRS..h..=
I
    5570: 52 51 30 82 49 52 51 30 60 76 60 70 60 50 49 52  RQ0.IRQ0`v`p`PI=
R
    5580: 41 5B 82 45 08 4C 4E 4B 42 08 5F 48 49 44 0C 41  A[.E.LNKB._HID.=
A
    5590: D0 0C 0F 08 5F 55 49 44 0A 02 14 14 5F 53 54 41  ...._UID...._ST=
A
    55A0: 00 A0 08 50 49 52 42 A4 0A 0B A1 04 A4 0A 09 14  ...PIRB........=
.
    55B0: 0B 5F 50 52 53 00 A4 49 50 52 53 14 0D 5F 44 49  ._PRS..IPRS.._D=
I
    55C0: 53 00 70 0A 00 50 49 52 42 14 21 5F 43 52 53 00  S.p..PIRB.!_CRS=
.
    55D0: 70 49 50 52 53 60 8B 60 0A 01 49 52 51 30 79 0A  pIPRS`.`..IRQ0y=
.
    55E0: 01 50 49 52 42 49 52 51 30 A4 60 14 1C 5F 53 52  .PIRBIRQ0.`.._S=
R
    55F0: 53 01 8B 68 0A 01 49 52 51 30 82 49 52 51 30 60  S..h..IRQ0.IRQ0=
`
    5600: 76 60 70 60 50 49 52 42 5B 82 45 08 4C 4E 4B 43  v`p`PIRB[.E.LNK=
C
    5610: 08 5F 48 49 44 0C 41 D0 0C 0F 08 5F 55 49 44 0A  ._HID.A...._UID=
.
    5620: 03 14 14 5F 53 54 41 00 A0 08 50 49 52 43 A4 0A  ..._STA...PIRC.=
.
    5630: 0B A1 04 A4 0A 09 14 0B 5F 50 52 53 00 A4 49 50  ........_PRS..I=
P
    5640: 52 53 14 0D 5F 44 49 53 00 70 0A 00 50 49 52 43  RS.._DIS.p..PIR=
C
    5650: 14 21 5F 43 52 53 00 70 49 50 52 53 60 8B 60 0A  .!_CRS.pIPRS`.`=
.
    5660: 01 49 52 51 30 79 0A 01 50 49 52 43 49 52 51 30  .IRQ0y..PIRCIRQ=
0
    5670: A4 60 14 1C 5F 53 52 53 01 8B 68 0A 01 49 52 51  .`.._SRS..h..IR=
Q
    5680: 30 82 49 52 51 30 60 76 60 70 60 50 49 52 43 5B  0.IRQ0`v`p`PIRC=
[
    5690: 82 45 08 4C 4E 4B 44 08 5F 48 49 44 0C 41 D0 0C  .E.LNKD._HID.A.=
.
    56A0: 0F 08 5F 55 49 44 0A 04 14 14 5F 53 54 41 00 A0  .._UID...._STA.=
.
    56B0: 08 50 49 52 44 A4 0A 0B A1 04 A4 0A 09 14 0B 5F  .PIRD..........=
_
    56C0: 50 52 53 00 A4 49 50 52 53 14 0D 5F 44 49 53 00  PRS..IPRS.._DIS=
.
    56D0: 70 0A 00 50 49 52 44 14 21 5F 43 52 53 00 70 49  p..PIRD.!_CRS.p=
I
    56E0: 50 52 53 60 8B 60 0A 01 49 52 51 30 79 0A 01 50  PRS`.`..IRQ0y..=
P
    56F0: 49 52 44 49 52 51 30 A4 60 14 1C 5F 53 52 53 01  IRDIRQ0.`.._SRS=
.
    5700: 8B 68 0A 01 49 52 51 30 82 49 52 51 30 60 76 60  .h..IRQ0.IRQ0`v=
`
    5710: 70 60 50 49 52 44 5B 82 45 08 4C 4E 4B 45 08 5F  p`PIRD[.E.LNKE.=
_
    5720: 48 49 44 0C 41 D0 0C 0F 08 5F 55 49 44 0A 05 14  HID.A...._UID..=
.
    5730: 14 5F 53 54 41 00 A0 08 50 49 52 45 A4 0A 0B A1  ._STA...PIRE...=
.
    5740: 04 A4 0A 09 14 0B 5F 50 52 53 00 A4 49 50 52 53  ......_PRS..IPR=
S
    5750: 14 0D 5F 44 49 53 00 70 0A 00 50 49 52 45 14 21  .._DIS.p..PIRE.=
!
    5760: 5F 43 52 53 00 70 49 50 52 53 60 8B 60 0A 01 49  _CRS.pIPRS`.`..=
I
    5770: 52 51 30 79 0A 01 50 49 52 45 49 52 51 30 A4 60  RQ0y..PIREIRQ0.=
`
    5780: 14 1C 5F 53 52 53 01 8B 68 0A 01 49 52 51 30 82  .._SRS..h..IRQ0=
.
    5790: 49 52 51 30 60 76 60 70 60 50 49 52 45 5B 82 45  IRQ0`v`p`PIRE[.=
E
    57A0: 08 4C 4E 4B 46 08 5F 48 49 44 0C 41 D0 0C 0F 08  .LNKF._HID.A...=
.
    57B0: 5F 55 49 44 0A 06 14 14 5F 53 54 41 00 A0 08 50  _UID...._STA...=
P
    57C0: 49 52 46 A4 0A 0B A1 04 A4 0A 09 14 0B 5F 50 52  IRF.........._P=
R
    57D0: 53 00 A4 49 50 52 53 14 0D 5F 44 49 53 00 70 0A  S..IPRS.._DIS.p=
.
    57E0: 00 50 49 52 46 14 21 5F 43 52 53 00 70 49 50 52  .PIRF.!_CRS.pIP=
R
    57F0: 53 60 8B 60 0A 01 49 52 51 30 79 0A 01 50 49 52  S`.`..IRQ0y..PI=
R
    5800: 46 49 52 51 30 A4 60 14 1C 5F 53 52 53 01 8B 68  FIRQ0.`.._SRS..=
h
    5810: 0A 01 49 52 51 30 82 49 52 51 30 60 76 60 70 60  ..IRQ0.IRQ0`v`p=
`
    5820: 50 49 52 46 5B 82 45 08 4C 4E 4B 30 08 5F 48 49  PIRF[.E.LNK0._H=
I
    5830: 44 0C 41 D0 0C 0F 08 5F 55 49 44 0A 07 14 14 5F  D.A...._UID....=
_
    5840: 53 54 41 00 A0 08 50 49 52 47 A4 0A 0B A1 04 A4  STA...PIRG.....=
.
    5850: 0A 09 14 0B 5F 50 52 53 00 A4 49 50 52 53 14 0D  ...._PRS..IPRS.=
.
    5860: 5F 44 49 53 00 70 0A 00 50 49 52 47 14 21 5F 43  _DIS.p..PIRG.!_=
C
    5870: 52 53 00 70 49 50 52 53 60 8B 60 0A 01 49 52 51  RS.pIPRS`.`..IR=
Q
    5880: 30 79 0A 01 50 49 52 47 49 52 51 30 A4 60 14 1C  0y..PIRGIRQ0.`.=
.
    5890: 5F 53 52 53 01 8B 68 0A 01 49 52 51 30 82 49 52  _SRS..h..IRQ0.I=
R
    58A0: 51 30 60 76 60 70 60 50 49 52 47 5B 82 45 08 4C  Q0`v`p`PIRG[.E.=
L
    58B0: 4E 4B 31 08 5F 48 49 44 0C 41 D0 0C 0F 08 5F 55  NK1._HID.A...._=
U
    58C0: 49 44 0A 08 14 14 5F 53 54 41 00 A0 08 50 49 52  ID...._STA...PI=
R
    58D0: 48 A4 0A 0B A1 04 A4 0A 09 14 0B 5F 50 52 53 00  H.........._PRS=
.
    58E0: A4 49 50 52 53 14 0D 5F 44 49 53 00 70 0A 00 50  .IPRS.._DIS.p..=
P
    58F0: 49 52 48 14 21 5F 43 52 53 00 70 49 50 52 53 60  IRH.!_CRS.pIPRS=
`
    5900: 8B 60 0A 01 49 52 51 30 79 0A 01 50 49 52 48 49  .`..IRQ0y..PIRH=
I
    5910: 52 51 30 A4 60 14 1C 5F 53 52 53 01 8B 68 0A 01  RQ0.`.._SRS..h.=
.
    5920: 49 52 51 30 82 49 52 51 30 60 76 60 70 60 50 49  IRQ0.IRQ0`v`p`P=
I
    5930: 52 48 5B 82 2B 50 49 43 5F 08 5F 48 49 44 0B 41  RH[.+PIC_._HID.=
A
    5940: D0 08 5F 43 52 53 11 18 0A 15 47 01 20 00 20 00  .._CRS....G. . =
.
    5950: 01 02 47 01 A0 00 A0 00 01 02 22 04 00 79 00 5B  ..G......."..y.=
[
    5960: 82 3D 44 4D 41 31 08 5F 48 49 44 0C 41 D0 02 00  .=3DDMA1._HID.A=
...
    5970: 08 5F 43 52 53 11 28 0A 25 2A 10 04 47 01 00 00  ._CRS.(.%*..G..=
.
    5980: 00 00 01 10 47 01 80 00 80 00 01 11 47 01 94 00  ....G.......G..=
.
    5990: 94 00 01 0C 47 01 C0 00 C0 00 01 20 79 00 5B 82  ....G...... y.[=
.
    59A0: 42 05 54 4D 52 5F 08 5F 48 49 44 0C 41 D0 01 00  B.TMR_._HID.A..=
.
    59B0: 08 41 54 54 35 11 10 0A 0D 47 01 40 00 40 00 00  .ATT5....G.@.@.=
.
    59C0: 04 22 01 00 79 00 08 41 54 54 36 11 0D 0A 0A 47  ."..y..ATT6....=
G
    59D0: 01 40 00 40 00 00 04 79 00 14 18 5F 43 52 53 00  .@.@...y..._CRS=
.
    59E0: A0 0A 48 50 54 46 A4 41 54 54 36 A1 06 A4 41 54  ..HPTF.ATT6...A=
T
    59F0: 54 35 5B 82 46 06 48 50 45 54 08 5F 48 49 44 0C  T5[.F.HPET._HID=
.
    5A00: 41 D0 01 03 08 41 54 54 33 11 17 0A 14 22 01 00  A....ATT3....".=
.
    5A10: 22 00 01 86 09 00 01 00 00 D0 FE 00 04 00 00 79  "..............=
y
    5A20: 00 08 41 54 54 34 11 05 0A 02 79 00 14 14 5F 53  ..ATT4....y..._=
S
    5A30: 54 41 00 A0 08 48 50 54 46 A4 0A 0F A1 04 A4 0A  TA...HPTF......=
.
    5A40: 00 14 18 5F 43 52 53 00 A0 0A 48 50 54 46 A4 41  ..._CRS...HPTF.=
A
    5A50: 54 54 33 A1 06 A4 41 54 54 34 5B 82 43 06 52 54  TT3...ATT4[.C.R=
T
    5A60: 43 5F 08 5F 48 49 44 0C 41 D0 0B 00 08 41 54 54  C_._HID.A....AT=
T
    5A70: 30 11 10 0A 0D 47 01 70 00 70 00 00 04 22 00 01  0....G.p.p...".=
.
    5A80: 79 00 08 41 54 54 31 11 0D 0A 0A 47 01 70 00 70  y..ATT1....G.p.=
p
    5A90: 00 00 04 79 00 14 29 5F 43 52 53 00 A0 1B 92 95  ...y..)_CRS....=
.
    5AA0: 4F 53 46 58 0A 03 A0 0A 48 50 54 46 A4 41 54 54  OSFX....HPTF.AT=
T
    5AB0: 31 A1 06 A4 41 54 54 30 A1 06 A4 41 54 54 30 5B  1...ATT0...ATT0=
[
    5AC0: 82 22 53 50 4B 52 08 5F 48 49 44 0C 41 D0 08 00  ."SPKR._HID.A..=
.
    5AD0: 08 5F 43 52 53 11 0D 0A 0A 47 01 61 00 61 00 01  ._CRS....G.a.a.=
.
    5AE0: 01 79 00 5B 82 25 43 4F 50 52 08 5F 48 49 44 0C  .y.[.%COPR._HID=
.
    5AF0: 41 D0 0C 04 08 5F 43 52 53 11 10 0A 0D 47 01 F0  A...._CRS....G.=
.
    5B00: 00 F0 00 01 10 22 00 20 79 00 5B 82 4B 1C 50 32  .....". y.[.K.P=
2
    5B10: 50 5F 08 5F 41 44 52 0C 04 00 14 00 14 17 5F 53  P_._ADR......._=
S
    5B20: 33 44 00 A0 0B 93 4F 53 46 4C 0A 02 A4 0A 02 A1  3D....OSFL.....=
.
    5B30: 04 A4 0A 03 14 0E 5F 50 52 57 00 A4 12 06 02 0A  ......_PRW.....=
.
    5B40: 04 0A 05 08 50 49 43 4D 12 4B 0F 08 12 1E 04 0C  ....PICM.K.....=
.
    5B50: FF FF 06 00 0A 00 5C 2F 04 5F 53 42 5F 50 43 49  ......\/._SB_PC=
I
    5B60: 30 4C 50 43 30 4C 4E 4B 45 0A 00 12 1E 04 0C FF  0LPC0LNKE......=
.
    5B70: FF 06 00 0A 01 5C 2F 04 5F 53 42 5F 50 43 49 30  .....\/._SB_PCI=
0
    5B80: 4C 50 43 30 4C 4E 4B 46 0A 00 12 1E 04 0C FF FF  LPC0LNKF.......=
.
    5B90: 06 00 0A 02 5C 2F 04 5F 53 42 5F 50 43 49 30 4C  ....\/._SB_PCI0=
L
    5BA0: 50 43 30 4C 4E 4B 30 0A 00 12 1E 04 0C FF FF 06  PC0LNK0........=
.
    5BB0: 00 0A 03 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50  ...\/._SB_PCI0L=
P
    5BC0: 43 30 4C 4E 4B 31 0A 00 12 1E 04 0C FF FF 0E 00  C0LNK1.........=
.
    5BD0: 0A 00 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43  ..\/._SB_PCI0LP=
C
    5BE0: 30 4C 4E 4B 30 0A 00 12 1E 04 0C FF FF 0E 00 0A  0LNK0..........=
.
    5BF0: 01 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30  .\/._SB_PCI0LPC=
0
    5C00: 4C 4E 4B 30 0A 00 12 1E 04 0C FF FF 0E 00 0A 02  LNK0...........=
.
    5C10: 5C 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C  \/._SB_PCI0LPC0=
L
    5C20: 4E 4B 30 0A 00 12 1E 04 0C FF FF 0E 00 0A 03 5C  NK0............=
\
    5C30: 2F 04 5F 53 42 5F 50 43 49 30 4C 50 43 30 4C 4E  /._SB_PCI0LPC0L=
N
    5C40: 4B 30 0A 00 08 41 50 49 43 12 43 07 08 12 0D 04  K0...APIC.C....=
.
    5C50: 0C FF FF 06 00 0A 00 0A 00 0A 14 12 0D 04 0C FF  ...............=
.
    5C60: FF 06 00 0A 01 0A 00 0A 15 12 0D 04 0C FF FF 06  ...............=
.
    5C70: 00 0A 02 0A 00 0A 16 12 0D 04 0C FF FF 06 00 0A  ...............=
.
    5C80: 03 0A 00 0A 17 12 0D 04 0C FF FF 0E 00 0A 00 0A  ...............=
.
    5C90: 00 0A 16 12 0D 04 0C FF FF 0E 00 0A 01 0A 00 0A  ...............=
.
    5CA0: 16 12 0D 04 0C FF FF 0E 00 0A 02 0A 00 0A 16 12  ...............=
.
    5CB0: 0D 04 0C FF FF 0E 00 0A 03 0A 00 0A 16 14 19 5F  ...............=
_
    5CC0: 50 52 54 00 A0 0B 92 50 49 43 46 A4 50 49 43 4D  PRT....PICF.PIC=
M
    5CD0: A1 06 A4 41 50 49 43 5B 82 4F 97 49 44 45 5F 08  ...APIC[.O.IDE_=
.
    5CE0: 5F 41 44 52 0C 01 00 14 00 08 55 44 4D 54 12 12  _ADR......UDMT.=
.
    5CF0: 08 0A 78 0A 5A 0A 3C 0A 2D 0A 1E 0A 14 0A 0F 0A  ..x.Z.<.-......=
.
    5D00: 00 08 50 49 4F 54 12 11 06 0B 58 02 0B 86 01 0B  ..PIOT....X....=
.
    5D10: 0E 01 0A B4 0A 78 0A 00 08 50 49 54 52 12 0E 06  .....x...PITR..=
.
    5D20: 0A 99 0A 47 0A 34 0A 22 0A 20 0A 99 08 4D 44 4D  ...G.4.". ...MD=
M
    5D30: 54 12 0B 04 0B E0 01 0A 96 0A 78 0A 00 08 4D 44  T.........x...M=
D
    5D40: 54 52 12 0A 04 0A 77 0A 21 0A 20 0A FF 5B 80 49  TR....w.!. ..[.=
I
    5D50: 44 45 5F 02 0A 40 0A 20 5B 81 48 04 49 44 45 5F  DE_..@. [.H.IDE=
_
    5D60: 00 50 50 49 54 10 53 50 49 54 10 50 4D 44 54 10  .PPIT.SPIT.PMDT=
.
    5D70: 53 4D 44 54 10 50 50 49 43 08 53 50 49 43 08 50  SMDT.PPIC.SPIC.=
P
    5D80: 50 49 4D 08 53 50 49 4D 08 00 40 04 50 55 44 43  PIM.SPIM..@.PUD=
C
    5D90: 02 53 55 44 43 02 00 0C 50 55 44 4D 08 53 55 44  .SUDC...PUDM.SU=
D
    5DA0: 4D 08 14 25 47 45 54 54 01 70 7B 68 0A 0F 00 60  M..%GETT.p{h...=
`
    5DB0: 70 7A 68 0A 04 00 61 A4 77 0A 1E 72 72 60 0A 01  pzh...a.w..rr`.=
.
    5DC0: 00 72 61 0A 01 00 00 00 14 4E 13 47 54 4D 5F 01  .ra......N.GTM_=
.
    5DD0: 8C 68 0A 00 50 49 54 31 8C 68 0A 01 50 49 54 30  .h..PIT1.h..PIT=
0
    5DE0: 8C 68 0A 02 4D 44 54 31 8C 68 0A 03 4D 44 54 30  .h..MDT1.h..MDT=
0
    5DF0: 8C 68 0A 04 50 49 43 58 8C 68 0A 05 55 44 43 58  .h..PICX.h..UDC=
X
    5E00: 8C 68 0A 06 55 44 4D 58 08 42 55 46 5F 11 17 0A  .h..UDMX.BUF_..=
.
    5E10: 14 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ...............=
.
    5E20: FF 00 00 00 00 8A 42 55 46 5F 0A 00 50 49 4F 30  ......BUF_..PIO=
0
    5E30: 8A 42 55 46 5F 0A 04 44 4D 41 30 8A 42 55 46 5F  .BUF_..DMA0.BUF=
_
    5E40: 0A 08 50 49 4F 31 8A 42 55 46 5F 0A 0C 44 4D 41  ..PIO1.BUF_..DM=
A
    5E50: 31 8A 42 55 46 5F 0A 10 46 4C 41 47 A0 0E 7B 50  1.BUF_..FLAG..{=
P
    5E60: 49 43 58 0A 01 00 A4 42 55 46 5F 70 47 45 54 54  ICX....BUF_pGET=
T
    5E70: 50 49 54 30 50 49 4F 30 70 47 45 54 54 50 49 54  PIT0PIO0pGETTPI=
T
    5E80: 31 50 49 4F 31 A0 29 7B 55 44 43 58 0A 01 00 7D  1PIO1.){UDCX...=
}
    5E90: 46 4C 41 47 0A 01 46 4C 41 47 70 83 88 5E 55 44  FLAG..FLAGp..^U=
D
    5EA0: 4D 54 7B 55 44 4D 58 0A 0F 00 00 44 4D 41 30 A1  MT{UDMX....DMA0=
.
    5EB0: 0E 70 47 45 54 54 4D 44 54 30 44 4D 41 30 A0 29  .pGETTMDT0DMA0.=
)
    5EC0: 7B 55 44 43 58 0A 02 00 7D 46 4C 41 47 0A 04 46  {UDCX...}FLAG..=
F
    5ED0: 4C 41 47 70 83 88 5E 55 44 4D 54 7A 55 44 4D 58  LAGp..^UDMTzUDM=
X
    5EE0: 0A 04 00 00 44 4D 41 31 A1 0E 70 47 45 54 54 4D  ....DMA1..pGETT=
M
    5EF0: 44 54 31 44 4D 41 31 7D 46 4C 41 47 0A 1A 46 4C  DT1DMA1}FLAG..F=
L
    5F00: 41 47 A4 42 55 46 5F 14 4A 1B 53 54 4D 5F 03 8A  AG.BUF_.J.STM_.=
.
    5F10: 68 0A 00 50 49 4F 30 8A 68 0A 04 44 4D 41 30 8A  h..PIO0.h..DMA0=
.
    5F20: 68 0A 08 50 49 4F 31 8A 68 0A 0C 44 4D 41 31 8A  h..PIO1.h..DMA1=
.
    5F30: 68 0A 10 46 4C 41 47 08 42 55 46 5F 11 0A 0A 07  h..FLAG.BUF_...=
.
    5F40: 00 00 FF FF 00 00 00 8C 42 55 46 5F 0A 00 50 49  ........BUF_..P=
I
    5F50: 54 31 8C 42 55 46 5F 0A 01 50 49 54 30 8C 42 55  T1.BUF_..PIT0.B=
U
    5F60: 46 5F 0A 02 4D 44 54 31 8C 42 55 46 5F 0A 03 4D  F_..MDT1.BUF_..=
M
    5F70: 44 54 30 8C 42 55 46 5F 0A 04 50 49 4D 58 8C 42  DT0.BUF_..PIMX.=
B
    5F80: 55 46 5F 0A 05 55 44 43 58 8C 42 55 46 5F 0A 06  UF_..UDCX.BUF_.=
.
    5F90: 55 44 4D 58 70 89 5E 50 49 4F 54 02 50 49 4F 30  UDMXp.^PIOT.PIO=
0
    5FA0: 00 0A 00 0A 00 60 78 60 0A 05 60 00 70 89 5E 50  .....`x`..`.p.^=
P
    5FB0: 49 4F 54 02 50 49 4F 31 00 0A 00 0A 00 61 78 61  IOT.PIO1.....ax=
a
    5FC0: 0A 05 61 00 70 7D 79 61 0A 04 00 60 00 50 49 4D  ..a.p}ya...`.PI=
M
    5FD0: 58 70 83 88 5E 50 49 54 52 60 00 50 49 54 30 70  Xp..^PITR`.PIT0=
p
    5FE0: 83 88 5E 50 49 54 52 61 00 50 49 54 31 A0 36 7B  ..^PITRa.PIT1.6=
{
    5FF0: 46 4C 41 47 0A 01 00 70 89 5E 55 44 4D 54 02 44  FLAG...p.^UDMT.=
D
    6000: 4D 41 30 00 0A 00 0A 00 60 78 60 0A 07 60 00 7D  MA0.....`x`..`.=
}
    6010: 55 44 4D 58 60 55 44 4D 58 7D 55 44 43 58 0A 01  UDMX`UDMX}UDCX.=
.
    6020: 55 44 43 58 A1 2E A0 2C 92 93 44 4D 41 30 0C FF  UDCX...,..DMA0.=
.
    6030: FF FF FF 70 89 5E 4D 44 4D 54 02 44 4D 41 30 00  ...p.^MDMT.DMA0=
.
    6040: 0A 00 0A 00 60 70 83 88 5E 4D 44 54 52 60 00 4D  ....`p..^MDTR`.=
M
    6050: 44 54 30 A0 3A 7B 46 4C 41 47 0A 04 00 70 89 5E  DT0.:{FLAG...p.=
^
    6060: 55 44 4D 54 02 44 4D 41 31 00 0A 00 0A 00 60 78  UDMT.DMA1.....`=
x
    6070: 60 0A 07 60 00 7D 55 44 4D 58 79 60 0A 04 00 55  `..`.}UDMXy`...=
U
    6080: 44 4D 58 7D 55 44 43 58 0A 02 55 44 43 58 A1 2E  DMX}UDCX..UDCX.=
.
    6090: A0 2C 92 93 44 4D 41 31 0C FF FF FF FF 70 89 5E  .,..DMA1.....p.=
^
    60A0: 4D 44 4D 54 02 44 4D 41 31 00 0A 00 0A 00 60 70  MDMT.DMA1.....`=
p
    60B0: 83 88 5E 4D 44 54 52 60 00 4D 44 54 31 A4 42 55  ..^MDTR`.MDT1.B=
U
    60C0: 46 5F 14 45 10 47 54 46 5F 02 8C 69 0A 00 4D 44  F_.E.GTF_..i..M=
D
    60D0: 54 31 8C 69 0A 01 4D 44 54 30 8C 69 0A 02 50 49  T1.i..MDT0.i..P=
I
    60E0: 4D 58 8C 69 0A 03 55 44 43 58 8C 69 0A 04 55 44  MX.i..UDCX.i..U=
D
    60F0: 4D 58 A0 27 93 68 0A A0 70 7B 50 49 4D 58 0A 0F  MX.'.h..p{PIMX.=
.
    6100: 00 60 70 4D 44 54 30 61 7B 55 44 43 58 0A 01 62  .`pMDT0a{UDCX..=
b
    6110: 70 7B 55 44 4D 58 0A 0F 00 63 A1 23 70 7A 50 49  p{UDMX...c.#pzP=
I
    6120: 4D 58 0A 04 00 60 70 4D 44 54 31 61 7B 55 44 43  MX...`pMDT1a{UD=
C
    6130: 58 0A 02 62 70 7A 55 44 4D 58 0A 04 00 63 08 42  X..bpzUDMX...c.=
B
    6140: 55 46 5F 11 11 0A 0E 03 00 00 00 00 FF EF 03 00  UF_............=
.
    6150: 00 00 00 FF EF 8C 42 55 46 5F 0A 01 50 4D 4F 44  ......BUF_..PMO=
D
    6160: 8C 42 55 46 5F 0A 08 44 4D 4F 44 8C 42 55 46 5F  .BUF_..DMOD.BUF=
_
    6170: 0A 05 43 4D 44 41 8C 42 55 46 5F 0A 0C 43 4D 44  ..CMDA.BUF_..CM=
D
    6180: 42 70 68 43 4D 44 41 70 68 43 4D 44 42 7D 60 0A  BphCMDAphCMDB}`=
.
    6190: 08 50 4D 4F 44 A0 0A 62 7D 63 0A 40 44 4D 4F 44  .PMOD..b}c.@DMO=
D
    61A0: A1 22 70 89 5E 4D 44 4D 54 02 47 45 54 54 61 00  ."p.^MDMT.GETTa=
.
    61B0: 0A 00 0A 00 64 A0 0D 95 64 0A 03 7D 0A 20 64 44  ....d...d..}. d=
D
    61C0: 4D 4F 44 A4 42 55 46 5F 5B 82 46 24 50 52 49 44  MOD.BUF_[.F$PRI=
D
    61D0: 08 5F 41 44 52 0A 00 14 4E 08 5F 47 54 4D 00 08  ._ADR...N._GTM.=
.
    61E0: 42 55 46 5F 11 0A 0A 07 00 00 FF FF 00 00 00 8B  BUF_...........=
.
    61F0: 42 55 46 5F 0A 00 56 50 49 54 8B 42 55 46 5F 0A  BUF_..VPIT.BUF_=
.
    6200: 02 56 4D 44 54 8C 42 55 46 5F 0A 04 56 50 49 43  .VMDT.BUF_..VPI=
C
    6210: 8C 42 55 46 5F 0A 05 56 55 44 43 8C 42 55 46 5F  .BUF_..VUDC.BUF=
_
    6220: 0A 06 56 55 44 4D 70 5E 5E 50 50 49 54 56 50 49  ..VUDMp^^PPITVP=
I
    6230: 54 70 5E 5E 50 4D 44 54 56 4D 44 54 70 5E 5E 50  Tp^^PMDTVMDTp^^=
P
    6240: 50 49 43 56 50 49 43 70 5E 5E 50 55 44 43 56 55  PICVPICp^^PUDCV=
U
    6250: 44 43 70 5E 5E 50 55 44 4D 56 55 44 4D A4 47 54  DCp^^PUDMVUDM.G=
T
    6260: 4D 5F 42 55 46 5F 14 41 09 5F 53 54 4D 03 08 42  M_BUF_.A._STM..=
B
    6270: 55 46 5F 11 0A 0A 07 00 00 00 00 00 00 00 8B 42  UF_............=
B
    6280: 55 46 5F 0A 00 56 50 49 54 8B 42 55 46 5F 0A 02  UF_..VPIT.BUF_.=
.
    6290: 56 4D 44 54 8C 42 55 46 5F 0A 04 56 50 49 4D 8C  VMDT.BUF_..VPIM=
.
    62A0: 42 55 46 5F 0A 05 56 55 44 43 8C 42 55 46 5F 0A  BUF_..VUDC.BUF_=
.
    62B0: 06 56 55 44 4D 70 53 54 4D 5F 68 69 6A 42 55 46  .VUDMpSTM_hijBU=
F
    62C0: 5F 70 56 50 49 54 5E 5E 50 50 49 54 70 56 4D 44  _pVPIT^^PPITpVM=
D
    62D0: 54 5E 5E 50 4D 44 54 70 56 50 49 4D 5E 5E 50 50  T^^PMDTpVPIM^^P=
P
    62E0: 49 4D 70 56 55 44 43 5E 5E 50 55 44 43 70 56 55  IMpVUDC^^PUDCpV=
U
    62F0: 44 4D 5E 5E 50 55 44 4D 5B 82 4A 08 50 5F 44 30  DM^^PUDM[.J.P_D=
0
    6300: 08 5F 41 44 52 0A 00 14 4C 07 5F 47 54 46 00 08  ._ADR...L._GTF.=
.
    6310: 42 55 46 5F 11 08 0A 05 00 00 00 00 00 8B 42 55  BUF_..........B=
U
    6320: 46 5F 0A 00 56 4D 44 54 8C 42 55 46 5F 0A 02 56  F_..VMDT.BUF_..=
V
    6330: 50 49 4D 8C 42 55 46 5F 0A 03 56 55 44 43 8C 42  PIM.BUF_..VUDC.=
B
    6340: 55 46 5F 0A 04 56 55 44 4D 70 5E 5E 5E 50 4D 44  UF_..VUDMp^^^PM=
D
    6350: 54 56 4D 44 54 70 5E 5E 5E 50 50 49 4D 56 50 49  TVMDTp^^^PPIMVP=
I
    6360: 4D 70 5E 5E 5E 50 55 44 43 56 55 44 43 70 5E 5E  Mp^^^PUDCVUDCp^=
^
    6370: 5E 50 55 44 4D 56 55 44 4D A4 47 54 46 5F 0A A0  ^PUDMVUDM.GTF_.=
.
    6380: 42 55 46 5F 5B 82 4A 08 50 5F 44 31 08 5F 41 44  BUF_[.J.P_D1._A=
D
    6390: 52 0A 01 14 4C 07 5F 47 54 46 00 08 42 55 46 5F  R...L._GTF..BUF=
_
    63A0: 11 08 0A 05 00 00 00 00 00 8B 42 55 46 5F 0A 00  ..........BUF_.=
.
    63B0: 56 4D 44 54 8C 42 55 46 5F 0A 02 56 50 49 4D 8C  VMDT.BUF_..VPIM=
.
    63C0: 42 55 46 5F 0A 03 56 55 44 43 8C 42 55 46 5F 0A  BUF_..VUDC.BUF_=
.
    63D0: 04 56 55 44 4D 70 5E 5E 5E 50 4D 44 54 56 4D 44  .VUDMp^^^PMDTVM=
D
    63E0: 54 70 5E 5E 5E 50 50 49 4D 56 50 49 4D 70 5E 5E  Tp^^^PPIMVPIMp^=
^
    63F0: 5E 50 55 44 43 56 55 44 43 70 5E 5E 5E 50 55 44  ^PUDCVUDCp^^^PU=
D
    6400: 4D 56 55 44 4D A4 47 54 46 5F 0A B0 42 55 46 5F  MVUDM.GTF_..BUF=
_
    6410: 5B 82 46 24 53 45 43 44 08 5F 41 44 52 0A 01 14  [.F$SECD._ADR..=
.
    6420: 4E 08 5F 47 54 4D 00 08 42 55 46 5F 11 0A 0A 07  N._GTM..BUF_...=
.
    6430: 00 00 FF FF 00 00 00 8B 42 55 46 5F 0A 00 56 50  ........BUF_..V=
P
    6440: 49 54 8B 42 55 46 5F 0A 02 56 4D 44 54 8C 42 55  IT.BUF_..VMDT.B=
U
    6450: 46 5F 0A 04 56 50 49 43 8C 42 55 46 5F 0A 05 56  F_..VPIC.BUF_..=
V
    6460: 55 44 43 8C 42 55 46 5F 0A 06 56 55 44 4D 70 5E  UDC.BUF_..VUDMp=
^
    6470: 5E 53 50 49 54 56 50 49 54 70 5E 5E 53 4D 44 54  ^SPITVPITp^^SMD=
T
    6480: 56 4D 44 54 70 5E 5E 53 50 49 43 56 50 49 43 70  VMDTp^^SPICVPIC=
p
    6490: 5E 5E 53 55 44 43 56 55 44 43 70 5E 5E 53 55 44  ^^SUDCVUDCp^^SU=
D
    64A0: 4D 56 55 44 4D A4 47 54 4D 5F 42 55 46 5F 14 41  MVUDM.GTM_BUF_.=
A
    64B0: 09 5F 53 54 4D 03 08 42 55 46 5F 11 0A 0A 07 00  ._STM..BUF_....=
.
    64C0: 00 00 00 00 00 00 8B 42 55 46 5F 0A 00 56 50 49  .......BUF_..VP=
I
    64D0: 54 8B 42 55 46 5F 0A 02 56 4D 44 54 8C 42 55 46  T.BUF_..VMDT.BU=
F
    64E0: 5F 0A 04 56 50 49 4D 8C 42 55 46 5F 0A 05 56 55  _..VPIM.BUF_..V=
U
    64F0: 44 43 8C 42 55 46 5F 0A 06 56 55 44 4D 70 53 54  DC.BUF_..VUDMpS=
T
    6500: 4D 5F 68 69 6A 42 55 46 5F 70 56 50 49 54 5E 5E  M_hijBUF_pVPIT^=
^
    6510: 53 50 49 54 70 56 4D 44 54 5E 5E 53 4D 44 54 70  SPITpVMDT^^SMDT=
p
    6520: 56 50 49 4D 5E 5E 53 50 49 4D 70 56 55 44 43 5E  VPIM^^SPIMpVUDC=
^
    6530: 5E 53 55 44 43 70 56 55 44 4D 5E 5E 53 55 44 4D  ^SUDCpVUDM^^SUD=
M
    6540: 5B 82 4A 08 53 5F 44 30 08 5F 41 44 52 0A 00 14  [.J.S_D0._ADR..=
.
    6550: 4C 07 5F 47 54 46 00 08 42 55 46 5F 11 08 0A 05  L._GTF..BUF_...=
.
    6560: 00 00 00 00 00 8B 42 55 46 5F 0A 00 56 4D 44 54  ......BUF_..VMD=
T
    6570: 8C 42 55 46 5F 0A 02 56 50 49 4D 8C 42 55 46 5F  .BUF_..VPIM.BUF=
_
    6580: 0A 03 56 55 44 43 8C 42 55 46 5F 0A 04 56 55 44  ..VUDC.BUF_..VU=
D
    6590: 4D 70 5E 5E 5E 53 4D 44 54 56 4D 44 54 70 5E 5E  Mp^^^SMDTVMDTp^=
^
    65A0: 5E 53 50 49 4D 56 50 49 4D 70 5E 5E 5E 53 55 44  ^SPIMVPIMp^^^SU=
D
    65B0: 43 56 55 44 43 70 5E 5E 5E 53 55 44 4D 56 55 44  CVUDCp^^^SUDMVU=
D
    65C0: 4D A4 47 54 46 5F 0A A0 42 55 46 5F 5B 82 4A 08  M.GTF_..BUF_[.J=
.
    65D0: 53 5F 44 31 08 5F 41 44 52 0A 01 14 4C 07 5F 47  S_D1._ADR...L._=
G
    65E0: 54 46 00 08 42 55 46 5F 11 08 0A 05 00 00 00 00  TF..BUF_.......=
.
    65F0: 00 8B 42 55 46 5F 0A 00 56 4D 44 54 8C 42 55 46  ..BUF_..VMDT.BU=
F
    6600: 5F 0A 02 56 50 49 4D 8C 42 55 46 5F 0A 03 56 55  _..VPIM.BUF_..V=
U
    6610: 44 43 8C 42 55 46 5F 0A 04 56 55 44 4D 70 5E 5E  DC.BUF_..VUDMp^=
^
    6620: 5E 53 4D 44 54 56 4D 44 54 70 5E 5E 5E 53 50 49  ^SMDTVMDTp^^^SP=
I
    6630: 4D 56 50 49 4D 70 5E 5E 5E 53 55 44 43 56 55 44  MVPIMp^^^SUDCVU=
D
    6640: 43 70 5E 5E 5E 53 55 44 4D 56 55 44 4D A4 47 54  Cp^^^SUDMVUDM.G=
T
    6650: 46 5F 0A B0 42 55 46 5F 5B 82 41 0B 50 43 45 32  F_..BUF_[.A.PCE=
2
    6660: 08 5F 41 44 52 0C 00 00 02 00 14 0E 5F 50 52 57  ._ADR......._PR=
W
    6670: 00 A4 12 06 02 0A 18 0A 04 08 50 49 43 4D 12 3A  ..........PICM.=
:
    6680: 04 12 0D 04 0B FF FF 0A 00 4C 4E 4B 43 0A 00 12  .........LNKC..=
.
    6690: 0D 04 0B FF FF 0A 01 4C 4E 4B 44 0A 00 12 0D 04  .......LNKD....=
.
    66A0: 0B FF FF 0A 02 4C 4E 4B 41 0A 00 12 0D 04 0B FF  .....LNKA......=
.
    66B0: FF 0A 03 4C 4E 4B 42 0A 00 08 41 50 49 43 12 32  ...LNKB...APIC.=
2
    66C0: 04 12 0B 04 0B FF FF 0A 00 0A 00 0A 12 12 0B 04  ...............=
.
    66D0: 0B FF FF 0A 01 0A 00 0A 13 12 0B 04 0B FF FF 0A  ...............=
.
    66E0: 02 0A 00 0A 10 12 0B 04 0B FF FF 0A 03 0A 00 0A  ...............=
.
    66F0: 11 14 19 5F 50 52 54 00 A0 0B 92 50 49 43 46 A4  ..._PRT....PICF=
.
    6700: 50 49 43 4D A1 06 A4 41 50 49 43 5B 82 41 0B 50  PICM...APIC[.A.=
P
    6710: 43 45 33 08 5F 41 44 52 0C 00 00 03 00 14 0E 5F  CE3._ADR.......=
_
    6720: 50 52 57 00 A4 12 06 02 0A 18 0A 04 08 50 49 43  PRW..........PI=
C
    6730: 4D 12 3A 04 12 0D 04 0B FF FF 0A 00 4C 4E 4B 44  M.:.........LNK=
D
    6740: 0A 00 12 0D 04 0B FF FF 0A 01 4C 4E 4B 41 0A 00  ..........LNKA.=
.
    6750: 12 0D 04 0B FF FF 0A 02 4C 4E 4B 42 0A 00 12 0D  ........LNKB...=
.
    6760: 04 0B FF FF 0A 03 4C 4E 4B 43 0A 00 08 41 50 49  ......LNKC...AP=
I
    6770: 43 12 32 04 12 0B 04 0B FF FF 0A 00 0A 00 0A 13  C.2............=
.
    6780: 12 0B 04 0B FF FF 0A 01 0A 00 0A 10 12 0B 04 0B  ...............=
.
    6790: FF FF 0A 02 0A 00 0A 11 12 0B 04 0B FF FF 0A 03  ...............=
.
    67A0: 0A 00 0A 12 14 19 5F 50 52 54 00 A0 0B 92 50 49  ......_PRT....P=
I
    67B0: 43 46 A4 50 49 43 4D A1 06 A4 41 50 49 43 5B 82  CF.PICM...APIC[=
.
    67C0: 41 0B 50 43 45 34 08 5F 41 44 52 0C 00 00 04 00  A.PCE4._ADR....=
.
    67D0: 14 0E 5F 50 52 57 00 A4 12 06 02 0A 18 0A 04 08  .._PRW.........=
.
    67E0: 50 49 43 4D 12 3A 04 12 0D 04 0B FF FF 0A 00 4C  PICM.:.........=
L
    67F0: 4E 4B 41 0A 00 12 0D 04 0B FF FF 0A 01 4C 4E 4B  NKA..........LN=
K
    6800: 42 0A 00 12 0D 04 0B FF FF 0A 02 4C 4E 4B 43 0A  B..........LNKC=
.
    6810: 00 12 0D 04 0B FF FF 0A 03 4C 4E 4B 44 0A 00 08  .........LNKD..=
.
    6820: 41 50 49 43 12 32 04 12 0B 04 0B FF FF 0A 00 0A  APIC.2.........=
.
    6830: 00 0A 10 12 0B 04 0B FF FF 0A 01 0A 00 0A 11 12  ...............=
.
    6840: 0B 04 0B FF FF 0A 02 0A 00 0A 12 12 0B 04 0B FF  ...............=
.
    6850: FF 0A 03 0A 00 0A 13 14 19 5F 50 52 54 00 A0 0B  ........._PRT..=
.
    6860: 92 50 49 43 46 A4 50 49 43 4D A1 06 A4 41 50 49  .PICF.PICM...AP=
I
    6870: 43 5B 82 41 0B 50 43 45 35 08 5F 41 44 52 0C 00  C[.A.PCE5._ADR.=
.
    6880: 00 05 00 14 0E 5F 50 52 57 00 A4 12 06 02 0A 18  ....._PRW......=
.
    6890: 0A 04 08 50 49 43 4D 12 3A 04 12 0D 04 0B FF FF  ...PICM.:......=
.
    68A0: 0A 00 4C 4E 4B 42 0A 00 12 0D 04 0B FF FF 0A 01  ..LNKB.........=
.
    68B0: 4C 4E 4B 43 0A 00 12 0D 04 0B FF FF 0A 02 4C 4E  LNKC..........L=
N
    68C0: 4B 44 0A 00 12 0D 04 0B FF FF 0A 03 4C 4E 4B 41  KD..........LNK=
A
    68D0: 0A 00 08 41 50 49 43 12 32 04 12 0B 04 0B FF FF  ...APIC.2......=
.
    68E0: 0A 00 0A 00 0A 11 12 0B 04 0B FF FF 0A 01 0A 00  ...............=
.
    68F0: 0A 12 12 0B 04 0B FF FF 0A 02 0A 00 0A 13 12 0B  ...............=
.
    6900: 04 0B FF FF 0A 03 0A 00 0A 10 14 19 5F 50 52 54  ............_PR=
T
    6910: 00 A0 0B 92 50 49 43 46 A4 50 49 43 4D A1 06 A4  ....PICF.PICM..=
.
    6920: 41 50 49 43 5B 82 41 0B 50 43 45 36 08 5F 41 44  APIC[.A.PCE6._A=
D
    6930: 52 0C 00 00 06 00 14 0E 5F 50 52 57 00 A4 12 06  R......._PRW...=
.
    6940: 02 0A 18 0A 04 08 50 49 43 4D 12 3A 04 12 0D 04  ......PICM.:...=
.
    6950: 0B FF FF 0A 00 4C 4E 4B 43 0A 00 12 0D 04 0B FF  .....LNKC......=
.
    6960: FF 0A 01 4C 4E 4B 44 0A 00 12 0D 04 0B FF FF 0A  ...LNKD........=
.
    6970: 02 4C 4E 4B 41 0A 00 12 0D 04 0B FF FF 0A 03 4C  .LNKA..........=
L
    6980: 4E 4B 42 0A 00 08 41 50 49 43 12 32 04 12 0B 04  NKB...APIC.2...=
.
    6990: 0B FF FF 0A 00 0A 00 0A 12 12 0B 04 0B FF FF 0A  ...............=
.
    69A0: 01 0A 00 0A 13 12 0B 04 0B FF FF 0A 02 0A 00 0A  ...............=
.
    69B0: 10 12 0B 04 0B FF FF 0A 03 0A 00 0A 11 14 19 5F  ...............=
_
    69C0: 50 52 54 00 A0 0B 92 50 49 43 46 A4 50 49 43 4D  PRT....PICF.PIC=
M
    69D0: A1 06 A4 41 50 49 43 5B 82 41 0B 50 43 45 37 08  ...APIC[.A.PCE7=
.
    69E0: 5F 41 44 52 0C 00 00 07 00 14 0E 5F 50 52 57 00  _ADR......._PRW=
.
    69F0: A4 12 06 02 0A 18 0A 04 08 50 49 43 4D 12 3A 04  .........PICM.:=
.
    6A00: 12 0D 04 0B FF FF 0A 00 4C 4E 4B 44 0A 00 12 0D  ........LNKD...=
.
    6A10: 04 0B FF FF 0A 01 4C 4E 4B 41 0A 00 12 0D 04 0B  ......LNKA.....=
.
    6A20: FF FF 0A 02 4C 4E 4B 42 0A 00 12 0D 04 0B FF FF  ....LNKB.......=
.
    6A30: 0A 03 4C 4E 4B 43 0A 00 08 41 50 49 43 12 32 04  ..LNKC...APIC.2=
.
    6A40: 12 0B 04 0B FF FF 0A 00 0A 00 0A 13 12 0B 04 0B  ...............=
.
    6A50: FF FF 0A 01 0A 00 0A 10 12 0B 04 0B FF FF 0A 02  ...............=
.
    6A60: 0A 00 0A 11 12 0B 04 0B FF FF 0A 03 0A 00 0A 12  ...............=
.
    6A70: 14 19 5F 50 52 54 00 A0 0B 92 50 49 43 46 A4 50  .._PRT....PICF.=
P
    6A80: 49 43 4D A1 06 A4 41 50 49 43 5B 82 41 0B 50 43  ICM...APIC[.A.P=
C
    6A90: 45 39 08 5F 41 44 52 0C 00 00 09 00 14 0E 5F 50  E9._ADR......._=
P
    6AA0: 52 57 00 A4 12 06 02 0A 18 0A 04 08 50 49 43 4D  RW..........PIC=
M
    6AB0: 12 3A 04 12 0D 04 0B FF FF 0A 00 4C 4E 4B 42 0A  .:.........LNKB=
.
    6AC0: 00 12 0D 04 0B FF FF 0A 01 4C 4E 4B 43 0A 00 12  .........LNKC..=
.
    6AD0: 0D 04 0B FF FF 0A 02 4C 4E 4B 44 0A 00 12 0D 04  .......LNKD....=
.
    6AE0: 0B FF FF 0A 03 4C 4E 4B 41 0A 00 08 41 50 49 43  .....LNKA...API=
C
    6AF0: 12 32 04 12 0B 04 0B FF FF 0A 00 0A 00 0A 11 12  .2.............=
.
    6B00: 0B 04 0B FF FF 0A 01 0A 00 0A 12 12 0B 04 0B FF  ...............=
.
    6B10: FF 0A 02 0A 00 0A 13 12 0B 04 0B FF FF 0A 03 0A  ...............=
.
    6B20: 00 0A 10 14 19 5F 50 52 54 00 A0 0B 92 50 49 43  ....._PRT....PI=
C
    6B30: 46 A4 50 49 43 4D A1 06 A4 41 50 49 43 5B 82 41  F.PICM...APIC[.=
A
    6B40: 0B 50 43 45 41 08 5F 41 44 52 0C 00 00 0A 00 14  .PCEA._ADR.....=
.
    6B50: 0E 5F 50 52 57 00 A4 12 06 02 0A 18 0A 04 08 50  ._PRW..........=
P
    6B60: 49 43 4D 12 3A 04 12 0D 04 0B FF FF 0A 00 4C 4E  ICM.:.........L=
N
    6B70: 4B 43 0A 00 12 0D 04 0B FF FF 0A 01 4C 4E 4B 44  KC..........LNK=
D
    6B80: 0A 00 12 0D 04 0B FF FF 0A 02 4C 4E 4B 41 0A 00  ..........LNKA.=
.
    6B90: 12 0D 04 0B FF FF 0A 03 4C 4E 4B 42 0A 00 08 41  ........LNKB...=
A
    6BA0: 50 49 43 12 32 04 12 0B 04 0B FF FF 0A 00 0A 00  PIC.2..........=
.
    6BB0: 0A 12 12 0B 04 0B FF FF 0A 01 0A 00 0A 13 12 0B  ...............=
.
    6BC0: 04 0B FF FF 0A 02 0A 00 0A 10 12 0B 04 0B FF FF  ...............=
.
    6BD0: 0A 03 0A 00 0A 11 14 19 5F 50 52 54 00 A0 0B 92  ........_PRT...=
.
    6BE0: 50 49 43 46 A4 50 49 43 4D A1 06 A4 41 50 49 43  PICF.PICM...API=
C
    6BF0: 5B 82 41 0B 50 43 45 42 08 5F 41 44 52 0C 00 00  [.A.PCEB._ADR..=
.
    6C00: 0B 00 14 0E 5F 50 52 57 00 A4 12 06 02 0A 18 0A  ...._PRW.......=
.
    6C10: 04 08 50 49 43 4D 12 3A 04 12 0D 04 0B FF FF 0A  ..PICM.:.......=
.
    6C20: 00 4C 4E 4B 44 0A 00 12 0D 04 0B FF FF 0A 01 4C  .LNKD..........=
L
    6C30: 4E 4B 41 0A 00 12 0D 04 0B FF FF 0A 02 4C 4E 4B  NKA..........LN=
K
    6C40: 42 0A 00 12 0D 04 0B FF FF 0A 03 4C 4E 4B 43 0A  B..........LNKC=
.
    6C50: 00 08 41 50 49 43 12 32 04 12 0B 04 0B FF FF 0A  ..APIC.2.......=
.
    6C60: 00 0A 00 0A 13 12 0B 04 0B FF FF 0A 01 0A 00 0A  ...............=
.
    6C70: 10 12 0B 04 0B FF FF 0A 02 0A 00 0A 11 12 0B 04  ...............=
.
    6C80: 0B FF FF 0A 03 0A 00 0A 12 14 19 5F 50 52 54 00  ..........._PRT=
.
    6C90: A0 0B 92 50 49 43 46 A4 50 49 43 4D A1 06 A4 41  ...PICF.PICM...=
A
    6CA0: 50 49 43 5B 82 41 0B 50 43 45 43 08 5F 41 44 52  PIC[.A.PCEC._AD=
R
    6CB0: 0C 00 00 0C 00 14 0E 5F 50 52 57 00 A4 12 06 02  ......._PRW....=
.
    6CC0: 0A 18 0A 04 08 50 49 43 4D 12 3A 04 12 0D 04 0B  .....PICM.:....=
.
    6CD0: FF FF 0A 00 4C 4E 4B 41 0A 00 12 0D 04 0B FF FF  ....LNKA.......=
.
    6CE0: 0A 01 4C 4E 4B 42 0A 00 12 0D 04 0B FF FF 0A 02  ..LNKB.........=
.
    6CF0: 4C 4E 4B 43 0A 00 12 0D 04 0B FF FF 0A 03 4C 4E  LNKC..........L=
N
    6D00: 4B 44 0A 00 08 41 50 49 43 12 32 04 12 0B 04 0B  KD...APIC.2....=
.
    6D10: FF FF 0A 00 0A 00 0A 10 12 0B 04 0B FF FF 0A 01  ...............=
.
    6D20: 0A 00 0A 11 12 0B 04 0B FF FF 0A 02 0A 00 0A 12  ...............=
.
    6D30: 12 0B 04 0B FF FF 0A 03 0A 00 0A 13 14 19 5F 50  .............._=
P
    6D40: 52 54 00 A0 0B 92 50 49 43 46 A4 50 49 43 4D A1  RT....PICF.PICM=
.
    6D50: 06 A4 41 50 49 43 5B 82 41 0B 50 43 45 44 08 5F  ..APIC[.A.PCED.=
_
    6D60: 41 44 52 0C 00 00 0D 00 14 0E 5F 50 52 57 00 A4  ADR......._PRW.=
.
    6D70: 12 06 02 0A 18 0A 04 08 50 49 43 4D 12 3A 04 12  ........PICM.:.=
.
    6D80: 0D 04 0B FF FF 0A 00 4C 4E 4B 42 0A 00 12 0D 04  .......LNKB....=
.
    6D90: 0B FF FF 0A 01 4C 4E 4B 43 0A 00 12 0D 04 0B FF  .....LNKC......=
.
    6DA0: FF 0A 02 4C 4E 4B 44 0A 00 12 0D 04 0B FF FF 0A  ...LNKD........=
.
    6DB0: 03 4C 4E 4B 41 0A 00 08 41 50 49 43 12 32 04 12  .LNKA...APIC.2.=
.
    6DC0: 0B 04 0B FF FF 0A 00 0A 00 0A 11 12 0B 04 0B FF  ...............=
.
    6DD0: FF 0A 01 0A 00 0A 12 12 0B 04 0B FF FF 0A 02 0A  ...............=
.
    6DE0: 00 0A 13 12 0B 04 0B FF FF 0A 03 0A 00 0A 10 14  ...............=
.
    6DF0: 19 5F 50 52 54 00 A0 0B 92 50 49 43 46 A4 50 49  ._PRT....PICF.P=
I
    6E00: 43 4D A1 06 A4 41 50 49 43 10 18 5C 00 14 06 44  CM...APIC..\...=
D
    6E10: 49 53 44 01 14 06 43 4B 49 4F 02 14 06 53 4C 44  ISD...CKIO...SL=
D
    6E20: 4D 02 10 45 12 5C 00 5B 80 57 49 4E 31 01 0A 2E  M..E.\.[.WIN1..=
.
    6E30: 0A 02 5B 81 10 57 49 4E 31 01 49 4E 44 50 08 44  ..[..WIN1.INDP.=
D
    6E40: 41 54 50 08 5B 80 47 50 49 4F 01 0B 00 08 0A 05  ATP.[.GPIO.....=
.
    6E50: 5B 81 1F 47 50 49 4F 01 47 4F 30 31 08 47 4F 30  [..GPIO.GO01.GO=
0
    6E60: 32 08 47 4F 30 33 08 47 4F 30 34 08 47 4F 30 35  2.GO03.GO04.GO0=
5
    6E70: 08 5B 86 4F 07 49 4E 44 50 44 41 54 50 01 00 10  .[.O.INDPDATP..=
.
    6E80: 43 46 47 5F 08 00 20 4C 44 4E 5F 08 00 40 0C 49  CFG_.. LDN_..@.=
I
    6E90: 44 48 49 08 49 44 4C 4F 08 50 4F 57 43 08 00 48  DHI.IDLO.POWC..=
H
    6EA0: 06 41 43 54 52 08 00 48 17 49 4F 41 48 08 49 4F  .ACTR..H.IOAH.I=
O
    6EB0: 41 4C 08 49 4F 32 48 08 49 4F 32 4C 08 00 40 06  AL.IO2H.IO2L..@=
.
    6EC0: 49 4E 54 52 08 00 08 49 4E 54 31 08 00 08 44 4D  INTR...INT1...D=
M
    6ED0: 43 48 08 00 48 25 47 50 34 30 08 00 48 17 4F 50  CH..H%GP40..H.O=
P
    6EE0: 54 31 08 4F 50 54 32 08 4F 50 54 33 08 4F 50 54  T1.OPT2.OPT3.OP=
T
    6EF0: 34 08 14 22 45 4E 46 47 00 70 0A 87 49 4E 44 50  4.."ENFG.p..IND=
P
    6F00: 70 0A 01 49 4E 44 50 70 0A 55 49 4E 44 50 70 0A  p..INDPp.UINDPp=
.
    6F10: 55 49 4E 44 50 14 0D 45 58 46 47 00 70 0A 02 43  UINDP..EXFG.p..=
C
    6F20: 46 47 5F 14 11 47 53 52 47 01 70 68 49 4E 44 50  FG_..GSRG.phIND=
P
    6F30: A4 44 41 54 50 14 12 53 53 52 47 02 70 68 49 4E  .DATP..SSRG.phI=
N
    6F40: 44 50 70 69 44 41 54 50 5B 82 46 15 46 44 43 30  DPpiDATP[.F.FDC=
0
    6F50: 08 5F 48 49 44 0C 41 D0 07 00 14 3A 5F 53 54 41  ._HID.A....:_ST=
A
    6F60: 00 45 4E 46 47 70 00 4C 44 4E 5F A0 0C 41 43 54  .ENFGp.LDN_..AC=
T
    6F70: 52 45 58 46 47 A4 0A 0F A1 1C A0 11 91 49 4F 41  REXFG........IO=
A
    6F80: 48 49 4F 41 4C 45 58 46 47 A4 0A 0D A1 08 45 58  HIOALEXFG.....E=
X
    6F90: 46 47 A4 0A 00 14 2B 5F 44 49 53 00 45 4E 46 47  FG....+_DIS.ENF=
G
    6FA0: 70 0A 00 4C 44 4E 5F 70 00 41 43 54 52 53 4C 44  p..LDN_p.ACTRSL=
D
    6FB0: 4D 44 4D 43 48 0A 04 45 58 46 47 44 49 53 44 0A  MDMCH..EXFGDISD=
.
    6FC0: 03 14 41 06 5F 43 52 53 00 08 42 55 46 30 11 1B  ..A._CRS..BUF0.=
.
    6FD0: 0A 18 47 01 F0 03 F0 03 01 06 47 01 F7 03 F7 03  ..G.......G....=
.
    6FE0: 01 01 22 40 00 2A 04 00 79 00 8C 42 55 46 30 0A  .."@.*..y..BUF0=
.
    6FF0: 02 49 4F 4C 4F 8C 42 55 46 30 0A 03 49 4F 48 49  .IOLO.BUF0..IOH=
I
    7000: 8C 42 55 46 30 0A 04 49 4F 52 4C 8C 42 55 46 30  .BUF0..IORL.BUF=
0
    7010: 0A 05 49 4F 52 48 45 4E 46 47 45 58 46 47 A4 42  ..IORHENFGEXFG.=
B
    7020: 55 46 30 08 5F 50 52 53 11 1D 0A 1A 30 47 01 F0  UF0._PRS....0G.=
.
    7030: 03 F0 03 01 06 47 01 F7 03 F7 03 01 01 22 40 00  .....G......."@=
.
    7040: 2A 04 00 38 79 00 14 49 05 5F 53 52 53 01 8C 68  *..8y..I._SRS..=
h
    7050: 0A 02 49 4F 4C 4F 8C 68 0A 03 49 4F 48 49 8B 68  ..IOLO.h..IOHI.=
h
    7060: 0A 02 49 4F 41 44 8B 68 0A 19 49 52 51 57 8C 68  ..IOAD.h..IRQW.=
h
    7070: 0A 1C 44 4D 41 56 45 4E 46 47 70 00 4C 44 4E 5F  ..DMAVENFGp.LDN=
_
    7080: 70 01 41 43 54 52 53 4C 44 4D 44 4D 43 48 44 4D  p.ACTRSLDMDMCHD=
M
    7090: 43 48 43 4B 49 4F 49 4F 41 44 0A 03 45 58 46 47  CHCKIOIOAD..EXF=
G
    70A0: 5B 82 46 1B 55 41 52 31 08 5F 48 49 44 0C 41 D0  [.F.UAR1._HID.A=
.
    70B0: 05 01 08 5F 55 49 44 0A 01 14 3F 5F 53 54 41 00  ..._UID...?_STA=
.
    70C0: 45 4E 46 47 70 0A 01 4C 44 4E 5F A0 0C 41 43 54  ENFGp..LDN_..AC=
T
    70D0: 52 45 58 46 47 A4 0A 0F A1 1C A0 11 91 49 4F 41  REXFG........IO=
A
    70E0: 48 49 4F 41 4C 45 58 46 47 A4 0A 0D A1 08 45 58  HIOALEXFG.....E=
X
    70F0: 46 47 A4 0A 00 45 58 46 47 14 21 5F 44 49 53 00  FG...EXFG.!_DIS=
.
    7100: 45 4E 46 47 70 0A 01 4C 44 4E 5F 70 00 41 43 54  ENFGp..LDN_p.AC=
T
    7110: 52 45 58 46 47 44 49 53 44 0A 00 14 49 09 5F 43  REXFGDISD...I._=
C
    7120: 52 53 00 08 42 55 46 31 11 10 0A 0D 47 01 00 00  RS..BUF1....G..=
.
    7130: 00 00 01 08 22 00 00 79 00 8C 42 55 46 31 0A 02  ...."..y..BUF1.=
.
    7140: 49 4F 4C 4F 8C 42 55 46 31 0A 03 49 4F 48 49 8C  IOLO.BUF1..IOHI=
.
    7150: 42 55 46 31 0A 04 49 4F 52 4C 8C 42 55 46 31 0A  BUF1..IORL.BUF1=
.
    7160: 05 49 4F 52 48 8B 42 55 46 31 0A 09 49 52 51 57  .IORH.BUF1..IRQ=
W
    7170: 45 4E 46 47 70 0A 01 4C 44 4E 5F 70 49 4F 41 4C  ENFGp..LDN_pIOA=
L
    7180: 49 4F 4C 4F 70 49 4F 41 4C 49 4F 52 4C 70 49 4F  IOLOpIOALIORLpI=
O
    7190: 41 48 49 4F 48 49 70 49 4F 41 48 49 4F 52 48 70  AHIOHIpIOAHIORH=
p
    71A0: 01 60 79 60 49 4E 54 52 49 52 51 57 45 58 46 47  .`y`INTRIRQWEXF=
G
    71B0: A4 42 55 46 31 08 5F 50 52 53 11 36 0A 33 30 47  .BUF1._PRS.6.30=
G
    71C0: 01 F8 03 F8 03 01 08 22 B8 1E 30 47 01 F8 02 F8  ......."..0G...=
.
    71D0: 02 01 08 22 B8 1E 30 47 01 E8 03 E8 03 01 08 22  ..."..0G.......=
"
    71E0: B8 1E 30 47 01 E8 02 E8 02 01 08 22 B8 1E 38 79  ..0G......."..8=
y
    71F0: 00 14 46 06 5F 53 52 53 01 8C 68 0A 02 49 4F 4C  ..F._SRS..h..IO=
L
    7200: 4F 8C 68 0A 03 49 4F 48 49 8B 68 0A 02 49 4F 41  O.h..IOHI.h..IO=
A
    7210: 44 8B 68 0A 09 49 52 51 57 45 4E 46 47 70 0A 01  D.h..IRQWENFGp.=
.
    7220: 4C 44 4E 5F 70 01 41 43 54 52 70 49 4F 4C 4F 49  LDN_p.ACTRpIOLO=
I
    7230: 4F 41 4C 70 49 4F 48 49 49 4F 41 48 82 49 52 51  OALpIOHIIOAH.IR=
Q
    7240: 57 60 74 60 0A 01 49 4E 54 52 45 58 46 47 43 4B  W`t`..INTREXFGC=
K
    7250: 49 4F 49 4F 41 44 0A 00 5B 82 42 1F 4C 50 54 31  IOIOAD..[.B.LPT=
1
    7260: 08 5F 48 49 44 0C 41 D0 04 00 14 44 05 5F 53 54  ._HID.A....D._S=
T
    7270: 41 00 45 4E 46 47 70 0A 03 4C 44 4E 5F 7B 4F 50  A.ENFGp..LDN_{O=
P
    7280: 54 31 0A 02 60 A0 30 92 93 60 0A 02 A0 0C 41 43  T1..`.0..`....A=
C
    7290: 54 52 45 58 46 47 A4 0A 0F A1 1C A0 11 91 49 4F  TREXFG........I=
O
    72A0: 41 48 49 4F 41 4C 45 58 46 47 A4 0A 0D A1 08 45  AHIOALEXFG.....=
E
    72B0: 58 46 47 A4 0A 00 A1 08 45 58 46 47 A4 0A 00 14  XFG.....EXFG...=
.
    72C0: 21 5F 44 49 53 00 45 4E 46 47 70 0A 03 4C 44 4E  !_DIS.ENFGp..LD=
N
    72D0: 5F 70 00 41 43 54 52 45 58 46 47 44 49 53 44 0A  _p.ACTREXFGDISD=
.
    72E0: 02 14 40 0C 5F 43 52 53 00 08 42 55 46 35 11 10  ..@._CRS..BUF5.=
.
    72F0: 0A 0D 47 01 00 00 00 00 01 08 22 00 00 79 00 8C  ..G......."..y.=
.
    7300: 42 55 46 35 0A 02 49 4F 4C 4F 8C 42 55 46 35 0A  BUF5..IOLO.BUF5=
.
    7310: 03 49 4F 48 49 8C 42 55 46 35 0A 04 49 4F 52 4C  .IOHI.BUF5..IOR=
L
    7320: 8C 42 55 46 35 0A 05 49 4F 52 48 8C 42 55 46 35  .BUF5..IORH.BUF=
5
    7330: 0A 07 49 4F 4C 45 8B 42 55 46 35 0A 09 49 52 51  ..IOLE.BUF5..IR=
Q
    7340: 57 45 4E 46 47 70 0A 03 4C 44 4E 5F 70 49 4F 41  WENFGp..LDN_pIO=
A
    7350: 4C 49 4F 4C 4F 70 49 4F 4C 4F 49 4F 52 4C 70 49  LIOLOpIOLOIORLp=
I
    7360: 4F 41 48 49 4F 48 49 70 49 4F 48 49 49 4F 52 48  OAHIOHIpIOHIIOR=
H
    7370: A0 0F 93 49 4F 4C 4F 0A BC 70 0A 04 49 4F 4C 45  ...IOLO..p..IOL=
E
    7380: A1 08 70 0A 08 49 4F 4C 45 70 01 60 70 49 4E 54  ..p..IOLEp.`pIN=
T
    7390: 52 65 79 60 65 49 52 51 57 45 58 46 47 A4 42 55  Rey`eIRQWEXFG.B=
U
    73A0: 46 35 08 5F 50 52 53 11 2A 0A 27 30 47 01 78 03  F5._PRS.*.'0G.x=
.
    73B0: 78 03 01 08 22 B8 1E 30 47 01 78 02 78 02 01 08  x..."..0G.x.x..=
.
    73C0: 22 B8 1E 30 47 01 BC 03 BC 03 01 04 22 B8 1E 38  "..0G......."..=
8
    73D0: 79 00 14 49 07 5F 53 52 53 01 8C 68 0A 02 49 4F  y..I._SRS..h..I=
O
    73E0: 4C 4F 8C 68 0A 03 49 4F 48 49 8B 68 0A 02 49 4F  LO.h..IOHI.h..I=
O
    73F0: 41 44 8C 68 0A 04 49 4F 52 4C 8C 68 0A 05 49 4F  AD.h..IORL.h..I=
O
    7400: 52 48 8B 68 0A 09 49 52 51 57 45 4E 46 47 70 0A  RH.h..IRQWENFGp=
.
    7410: 03 4C 44 4E 5F 70 01 41 43 54 52 70 49 4F 4C 4F  .LDN_p.ACTRpIOL=
O
    7420: 49 4F 41 4C 70 49 4F 48 49 49 4F 41 48 81 49 52  IOALpIOHIIOAH.I=
R
    7430: 51 57 60 74 60 0A 01 60 70 60 49 4E 54 52 45 58  QW`t`..`p`INTRE=
X
    7440: 46 47 43 4B 49 4F 49 4F 41 44 0A 02 5B 82 4D 2A  FGCKIOIOAD..[.M=
*
    7450: 45 43 50 31 08 5F 48 49 44 0C 41 D0 04 01 14 43  ECP1._HID.A....=
C
    7460: 05 5F 53 54 41 00 45 4E 46 47 70 0A 03 4C 44 4E  ._STA.ENFGp..LD=
N
    7470: 5F 7B 4F 50 54 31 0A 02 60 A0 2F 93 60 0A 02 A0  _{OPT1..`./.`..=
.
    7480: 0C 41 43 54 52 45 58 46 47 A4 0A 0F A1 1C A0 11  .ACTREXFG......=
.
    7490: 91 49 4F 41 48 49 4F 41 4C 45 58 46 47 A4 0A 0D  .IOAHIOALEXFG..=
.
    74A0: A1 08 45 58 46 47 A4 0A 00 A1 08 45 58 46 47 A4  ..EXFG.....EXFG=
.
    74B0: 0A 00 14 2B 5F 44 49 53 00 45 4E 46 47 70 0A 03  ...+_DIS.ENFGp.=
.
    74C0: 4C 44 4E 5F 70 00 41 43 54 52 53 4C 44 4D 44 4D  LDN_p.ACTRSLDMD=
M
    74D0: 43 48 0A 04 45 58 46 47 44 49 53 44 0A 02 14 4B  CH..EXFGDISD...=
K
    74E0: 13 5F 43 52 53 00 08 42 55 46 36 11 1B 0A 18 47  ._CRS..BUF6....=
G
    74F0: 01 00 00 00 00 01 04 47 01 00 00 00 00 01 04 22  .......G.......=
"
    7500: 00 00 2A 00 00 79 00 8C 42 55 46 36 0A 02 49 4F  ..*..y..BUF6..I=
O
    7510: 4C 4F 8C 42 55 46 36 0A 03 49 4F 48 49 8C 42 55  LO.BUF6..IOHI.B=
U
    7520: 46 36 0A 04 49 4F 52 4C 8C 42 55 46 36 0A 05 49  F6..IORL.BUF6..=
I
    7530: 4F 52 48 8C 42 55 46 36 0A 07 49 4F 4C 45 8C 42  ORH.BUF6..IOLE.=
B
    7540: 55 46 36 0A 0A 49 4F 45 4C 8C 42 55 46 36 0A 0B  UF6..IOEL.BUF6.=
.
    7550: 49 4F 45 48 8C 42 55 46 36 0A 0C 49 4F 4D 4C 8C  IOEH.BUF6..IOML=
.
    7560: 42 55 46 36 0A 0D 49 4F 4D 48 8B 42 55 46 36 0A  BUF6..IOMH.BUF6=
.
    7570: 11 49 52 51 57 8C 42 55 46 36 0A 14 44 4D 41 43  .IRQW.BUF6..DMA=
C
    7580: 45 4E 46 47 70 0A 03 4C 44 4E 5F 70 49 4F 41 4C  ENFGp..LDN_pIOA=
L
    7590: 62 70 62 49 4F 4C 4F 70 49 4F 41 48 63 70 63 49  bpbIOLOpIOAHcpc=
I
    75A0: 4F 48 49 7D 63 0A 04 63 70 63 49 4F 45 48 70 63  OHI}c..cpcIOEHp=
c
    75B0: 49 4F 4D 48 70 49 4F 4C 4F 49 4F 52 4C 70 49 4F  IOMHpIOLOIORLpI=
O
    75C0: 4C 4F 49 4F 45 4C 70 49 4F 4C 4F 49 4F 4D 4C 70  LOIOELpIOLOIOML=
p
    75D0: 49 4F 48 49 49 4F 52 48 A0 0F 93 49 4F 4C 4F 0A  IOHIIORH...IOLO=
.
    75E0: BC 70 0A 04 49 4F 4C 45 A1 08 70 0A 08 49 4F 4C  .p..IOLE..p..IO=
L
    75F0: 45 70 01 60 70 49 4E 54 52 65 79 60 65 49 52 51  Ep.`pINTRey`eIR=
Q
    7600: 57 70 01 60 70 44 4D 43 48 65 79 60 65 44 4D 41  Wp.`pDMCHey`eDM=
A
    7610: 43 45 58 46 47 A4 42 55 46 36 08 5F 50 52 53 11  CEXFG.BUF6._PRS=
.
    7620: 4C 04 0A 48 30 47 01 78 03 78 03 00 08 47 01 78  L..H0G.x.x...G.=
x
    7630: 07 78 07 00 04 22 B8 1E 2A 0B 00 30 47 01 78 02  .x..."..*..0G.x=
.
    7640: 78 02 00 08 47 01 78 06 78 06 00 04 22 B8 1E 2A  x...G.x.x..."..=
*
    7650: 0B 00 30 47 01 BC 03 BC 03 00 04 47 01 BC 07 BC  ..0G.......G...=
.
    7660: 07 00 04 22 B8 1E 2A 0B 00 38 79 00 14 4E 08 5F  ..."..*..8y..N.=
_
    7670: 53 52 53 01 8C 68 0A 02 49 4F 4C 4F 8C 68 0A 03  SRS..h..IOLO.h.=
.
    7680: 49 4F 48 49 8B 68 0A 02 49 4F 41 44 8B 68 0A 11  IOHI.h..IOAD.h.=
.
    7690: 49 52 51 57 8C 68 0A 14 44 4D 41 43 45 4E 46 47  IRQW.h..DMACENF=
G
    76A0: 70 0A 03 4C 44 4E 5F 70 01 41 43 54 52 70 49 4F  p..LDN_p.ACTRpI=
O
    76B0: 4C 4F 49 4F 41 4C 70 49 4F 48 49 49 4F 41 48 81  LOIOALpIOHIIOAH=
.
    76C0: 49 52 51 57 60 74 60 0A 01 60 70 60 49 4E 54 52  IRQW`t`..`p`INT=
R
    76D0: 81 44 4D 41 43 61 70 44 4D 43 48 60 74 61 0A 01  .DMACapDMCH`ta.=
.
    76E0: 44 4D 43 48 53 4C 44 4D 60 44 4D 43 48 45 58 46  DMCHSLDM`DMCHEX=
F
    76F0: 47 43 4B 49 4F 49 4F 41 44 0A 02 5B 80 4B 42 43  GCKIOIOAD..[.KB=
C
    7700: 54 01 0A 60 0A 05 5B 81 12 4B 42 43 54 01 50 30  T..`..[..KBCT.P=
0
    7710: 36 30 08 00 18 50 30 36 34 08 5B 82 4F 08 50 53  60...P064.[.O.P=
S
    7720: 32 4D 08 5F 48 49 44 0C 41 D0 0F 13 14 17 5F 53  2M._HID.A....._=
S
    7730: 54 41 00 A0 0B 93 50 53 32 46 0A 00 A4 0A 0F A1  TA....PS2F.....=
.
    7740: 04 A4 0A 00 14 46 06 5F 43 52 53 00 08 42 55 46  .....F._CRS..BU=
F
    7750: 31 11 08 0A 05 22 00 10 79 00 08 42 55 46 32 11  1...."..y..BUF2=
.
    7760: 18 0A 15 47 01 60 00 60 00 01 01 47 01 64 00 64  ...G.`.`...G.d.=
d
    7770: 00 01 01 22 00 10 79 00 A0 2B 93 4B 42 44 49 0A  ..."..y..+.KBDI=
.
    7780: 01 A0 0D 93 4F 53 46 4C 0A 02 A4 42 55 46 31 A0  ....OSFL...BUF1=
.
    7790: 0D 93 4F 53 46 4C 0A 01 A4 42 55 46 31 A1 06 A4  ..OSFL...BUF1..=
.
    77A0: 42 55 46 32 A1 06 A4 42 55 46 31 5B 82 46 04 50  BUF2...BUF1[.F.=
P
    77B0: 53 32 4B 08 5F 48 49 44 0C 41 D0 03 03 14 17 5F  S2K._HID.A.....=
_
    77C0: 53 54 41 00 A0 0B 93 4B 42 44 49 0A 01 A4 0A 00  STA....KBDI....=
.
    77D0: A1 04 A4 0A 0F 08 5F 43 52 53 11 18 0A 15 47 01  ......_CRS....G=
.
    77E0: 60 00 60 00 01 01 47 01 64 00 64 00 01 01 22 02  `.`...G.d.d..."=
.
    77F0: 00 79 00 5B 82 4C 06 50 53 4D 52 08 5F 48 49 44  .y.[.L.PSMR._HI=
D
    7800: 0C 41 D0 0C 02 08 5F 55 49 44 0A 03 14 39 5F 53  .A...._UID...9_=
S
    7810: 54 41 00 A0 0B 93 4B 42 44 49 0A 00 A4 0A 00 A0  TA....KBDI.....=
.
    7820: 23 93 50 53 32 46 0A 00 A0 0B 93 4F 53 46 4C 0A  #.PS2F.....OSFL=
.
    7830: 02 A4 0A 0F A0 0B 93 4F 53 46 4C 0A 01 A4 0A 0F  .......OSFL....=
.
    7840: A4 0A 00 A4 0A 00 08 5F 43 52 53 11 15 0A 12 47  ......._CRS....=
G
    7850: 01 60 00 60 00 01 01 47 01 64 00 64 00 01 01 79  .`.`...G.d.d...=
y
    7860: 00 10 4D 08 5C 00 14 48 08 53 4C 44 31 01 45 4E  ..M.\..H.SLD1.E=
N
    7870: 46 47 70 0A 07 4C 44 4E 5F 53 53 52 47 0A F8 0A  FGp..LDN_SSRG..=
.
    7880: 10 53 53 52 47 0A F9 0A 01 7B 0A 20 0A 0F 60 79  .SSRG....{. ..`=
y
    7890: 0A 01 60 60 7B 0A 20 0A F0 61 7A 61 0A 04 61 72  ..``{. ..aza..a=
r
    78A0: 61 0A AF 61 70 47 53 52 47 61 62 7D 62 60 62 80  a..apGSRGab}b`b=
.
    78B0: 60 60 A0 0C 95 68 0A 08 53 53 52 47 0A F9 68 A0  ``...h..SSRG..h=
.
    78C0: 17 93 68 0A 08 53 53 52 47 0A F8 0A 00 7B 62 60  ..h..SSRG....{b=
`
    78D0: 62 53 53 52 47 61 62 A0 13 94 68 0A 08 53 53 52  bSSRGab...h..SS=
R
    78E0: 47 0A F8 0A 00 53 53 52 47 61 62 45 58 46 47 14  G....SSRGabEXFG=
.
    78F0: 1D 5C 2F 04 5F 53 42 5F 50 43 49 30 50 53 32 4D  .\/._SB_PCI0PS2=
M
    7900: 5F 50 52 57 00 A4 12 06 02 0A 03 0A 05 14 1D 5C  _PRW...........=
\
    7910: 2F 04 5F 53 42 5F 50 43 49 30 50 53 32 4B 5F 50  /._SB_PCI0PS2K_=
P
    7920: 52 57 00 A4 12 06 02 0A 03 0A 05 14 0E 5F 50 52  RW..........._P=
R
    7930: 57 00 A4 12 06 02 0A 04 0A 05 5B 82 40 26 4D 45  W.........[.@&M=
E
    7940: 4D 5F 08 5F 48 49 44 0C 41 D0 0C 01 14 4F 24 5F  M_._HID.A....O$=
_
    7950: 43 52 53 00 08 42 55 46 30 11 42 0A 0A 9E 86 09  CRS..BUF0.B....=
.
    7960: 00 01 00 00 0F 00 00 40 00 00 86 09 00 01 00 40  .......@.......=
@
    7970: 0F 00 00 40 00 00 86 09 00 01 00 80 0F 00 00 40  ...@...........=
@
    7980: 00 00 86 09 00 01 00 C0 0F 00 00 40 00 00 86 09  ...........@...=
.
    7990: 00 01 00 00 00 00 00 00 01 00 86 09 00 01 00 00  ...............=
.
    79A0: FF FF 00 00 01 00 86 09 00 01 00 00 00 00 00 00  ...............=
.
    79B0: 0A 00 86 09 00 01 00 00 10 00 00 00 00 00 86 09  ...............=
.
    79C0: 00 01 00 00 00 00 00 00 00 00 86 09 00 01 00 00  ...............=
.
    79D0: 00 00 00 00 00 00 86 09 00 01 00 00 C0 FE 00 10  ...............=
.
    79E0: 00 00 86 09 00 01 00 00 E0 FE 00 10 00 00 86 09  ...............=
.
    79F0: 00 01 00 00 F8 FF 00 00 07 00 79 00 8A 42 55 46  ..........y..BU=
F
    7A00: 30 0A 34 41 43 4D 4D 8A 42 55 46 30 0A 04 52 4D  0.4ACMM.BUF0..R=
M
    7A10: 41 31 8A 42 55 46 30 0A 08 52 53 53 31 8A 42 55  A1.BUF0..RSS1.B=
U
    7A20: 46 30 0A 10 52 4D 41 32 8A 42 55 46 30 0A 14 52  F0..RMA2.BUF0..=
R
    7A30: 53 53 32 8A 42 55 46 30 0A 1C 52 4D 41 33 8A 42  SS2.BUF0..RMA3.=
B
    7A40: 55 46 30 0A 20 52 53 53 33 8A 42 55 46 30 0A 28  UF0. RSS3.BUF0.=
(
    7A50: 52 4D 41 34 8A 42 55 46 30 0A 2C 52 53 53 34 8A  RMA4.BUF0.,RSS4=
.
    7A60: 42 55 46 30 0A 5C 45 58 54 4D 8A 42 55 46 30 0A  BUF0.\EXTM.BUF0=
.
    7A70: 64 55 53 4D 41 8A 42 55 46 30 0A 68 55 53 4D 53  dUSMA.BUF0.hUSM=
S
    7A80: 72 41 4D 45 4D 0C 00 00 01 00 55 53 4D 41 72 55  rAMEM.....USMAr=
U
    7A90: 53 4D 53 0C 00 00 10 00 55 53 4D 53 8A 42 55 46  SMS.....USMS.BU=
F
    7AA0: 30 0A 70 54 53 4D 41 8A 42 55 46 30 0A 74 54 53  0.pTSMA.BUF0.tT=
S
    7AB0: 4D 53 72 41 4D 45 4D 0C 00 00 01 00 54 53 4D 41  MSrAMEM.....TSM=
A
    7AC0: 72 54 53 4D 41 0C 00 00 10 00 54 53 4D 41 72 54  rTSMA.....TSMAr=
T
    7AD0: 53 4D 53 0C 00 00 10 00 54 53 4D 53 74 41 4D 45  SMS.....TSMStAM=
E
    7AE0: 4D 0C 00 00 10 00 45 58 54 4D A0 35 92 93 52 4F  M.....EXTM.5..R=
O
    7AF0: 4D 31 00 70 52 4D 41 31 52 4D 41 32 79 52 4F 4D  M1.pRMA1RMA2yRO=
M
    7B00: 31 0A 08 60 70 60 52 4D 41 31 79 52 4D 53 31 0A  1..`p`RMA1yRMS1=
.
    7B10: 08 60 70 60 52 53 53 31 70 0B 00 80 52 53 53 32  .`p`RSS1p...RSS=
2
    7B20: A0 35 92 93 52 4F 4D 32 00 70 52 4D 41 32 52 4D  .5..ROM2.pRMA2R=
M
    7B30: 41 33 79 52 4F 4D 32 0A 08 60 70 60 52 4D 41 32  A3yROM2..`p`RMA=
2
    7B40: 79 52 4D 53 32 0A 08 60 70 60 52 53 53 32 70 0B  yRMS2..`p`RSS2p=
.
    7B50: 00 C0 52 53 53 33 A0 37 92 93 52 4F 4D 33 00 70  ..RSS3.7..ROM3.=
p
    7B60: 52 4D 41 33 52 4D 41 34 79 52 4F 4D 33 0A 08 60  RMA3RMA4yROM3..=
`
    7B70: 70 60 52 4D 41 33 79 52 4D 53 33 0A 08 60 70 60  p`RMA3yRMS3..`p=
`
    7B80: 52 53 53 33 70 0C 00 00 01 00 52 53 53 34 70 41  RSS3p.....RSS4p=
A
    7B90: 4D 45 4D 41 43 4D 4D A4 42 55 46 30 5B 82 45 04  MEMACMM.BUF0[.E=
.
    7BA0: 5C 2F 03 5F 53 42 5F 50 43 49 30 45 58 50 4C 08  \/._SB_PCI0EXPL=
.
    7BB0: 5F 48 49 44 0C 41 D0 0C 02 08 5F 55 49 44 0A 04  _HID.A...._UID.=
.
    7BC0: 14 22 5F 43 52 53 00 08 42 55 46 30 11 11 0A 0E  ."_CRS..BUF0...=
.
    7BD0: 86 09 00 01 00 00 00 E0 00 00 00 10 79 00 A4 42  ............y..=
B
    7BE0: 55 46 30                                         UF0

MATS @ 0x0000000000000000
    0000: 4D 41 54 53 34 00 00 00 01 52 47 42 54 20 20 20  MATS4....RGBT
    0010: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0020: 00 00 00 00 B0 00 00 00 01 00 00 00 34 97 CF CF  ............4..=
.
    0030: EE FF 00 00                                      ....

FACP @ 0x0000000000000000
    0000: 46 41 43 50 74 00 00 00 01 D2 47 42 54 20 20 20  FACPt.....GBT
    0010: 47 42 54 55 41 43 50 49 31 2E 30 42 47 42 54 55  GBTUACPI1.0BGBT=
U
    0020: 01 01 01 01 00 00 CF CF 00 11 CF CF 00 01 09 00  ...............=
.
    0030: B0 00 00 00 A1 A0 00 00 00 08 00 00 00 00 00 00  ...............=
.
    0040: 04 08 00 00 00 00 00 00 50 08 00 00 08 08 00 00  ........P......=
.
    0050: 20 08 00 00 00 00 00 00 04 02 01 04 08 00 00 00   ..............=
.
    0060: 65 00 E9 03 00 00 00 00 01 00 0D 00 00 00 00 00  e..............=
.
    0070: AD 01 00 00                                      ....

Firmware Warning (ACPI): Incorrect checksum in table [TAMG] - 0x45, should=
 be 0x44 (20200925/tbprint-234)
TAMG @ 0x0000000000000000
    0000: 54 41 4D 47 02 02 00 00 01 45 47 42 54 20 20 20  TAMG.....EGBT
    0010: 47 42 54 20 20 20 42 30 2E 31 55 54 42 47 01 01  GBT   B0.1UTBG.=
.
    0020: 01 01 45 53 44 54 5D 20 11 00 00 00 00 00 00 00  ..ESDT] .......=
.
    0030: 00 00 14 00 00 00 00 07 00 00 3D 02 2D 02 2E 02  ..........=3D.-=
...
    0040: 20 00 10 00 25 00 04 00 00 00 00 1A 07 01 00 00   ...%..........=
.
    0050: 00 00 00 00 00 00 00 00 00 00 00 00 01 00 01 00  ...............=
.
    0060: 00 6E 00 E0 15 00 00 6F 00 9A 00 80 70 00 00 9B  .n.....o....p..=
.
    0070: 00 A0 00 80 89 00 00 A1 00 AA 00 80 A2 00 00 00  ...............=
.
    0080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00A0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00B0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00C0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00D0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00E0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    00F0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0110: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0150: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0160: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0170: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0180: 00 00 24 45 5A 59 41 43 43 24 60 00 01 D6 00 00  ..$EZYACC$`....=
.
    0190: 00 00 06 00 04 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    01A0: 00 00 01 00 00 00 CE 80 00 00 00 01 00 00 00 01  ...............=
.
    01B0: 00 00 00 02 00 00 8B 80 00 00 00 01 00 00 00 01  ...............=
.
    01C0: 00 00 00 10 00 00 8C 04 00 00 00 01 00 01 00 00  ...............=
.
    01D0: 00 00 00 20 00 00 8C 08 00 00 00 01 00 01 00 00  ... ...........=
.
    01E0: 00 00 00 40 00 00 8C 10 00 00 00 01 00 01 00 00  ...@...........=
.
    01F0: 00 00 00 80 00 00 8C 20 00 00 00 01 00 01 00 00  ....... .......=
.
    0200: 00 00                                            ..

HPET @ 0x0000000000000000
    0000: 48 50 45 54 38 00 00 00 01 25 47 42 54 20 20 20  HPET8....%GBT
    0010: 47 42 54 55 41 43 50 49 31 2E 30 42 47 42 54 55  GBTUACPI1.0BGBT=
U
    0020: 98 00 00 00 01 A2 B9 10 00 00 00 00 00 00 D0 FE  ...............=
.
    0030: 00 00 00 00 00 10 00 00                          ........

FACS @ 0x0000000000000000
    0000: 46 41 43 53 40 00 00 00 00 00 00 00 00 00 00 00  FACS@..........=
.
    0010: 00 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0020: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.
    0030: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ...............=
.


--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=dom0.log
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 5.10.0-21-amd64 (debian-kernel@lists.debian.o=
rg) (gcc-10 (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for De=
bian) 2.35.2) #1 SMP Debian 5.10.162-1 (2023-01-21)
[    0.000000] Command line: placeholder root=3DUUID=3D36792c57-a8bc-4264-=
93a9-6b9485700770 ro quiet
[    0.000000] x86/fpu: x87 FPU will use FXSAVE
[    0.000000] Released 0 page(s)
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] Xen: [mem 0x0000000000000000-0x000000000009afff] usable
[    0.000000] Xen: [mem 0x000000000009f800-0x00000000000fffff] reserved
[    0.000000] Xen: [mem 0x0000000000100000-0x0000000030064fff] usable
[    0.000000] Xen: [mem 0x00000000cfcf0000-0x00000000cfcf0fff] ACPI NVS
[    0.000000] Xen: [mem 0x00000000cfcf1000-0x00000000cfcfffff] ACPI data
[    0.000000] Xen: [mem 0x00000000cfd00000-0x00000000cfdfffff] reserved
[    0.000000] Xen: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.000000] Xen: [mem 0x00000000fec00000-0x00000000ffffffff] reserved
[    0.000000] Xen: [mem 0x000000fd00000000-0x000000ffffffffff] reserved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Gigabyte Technology Co., Ltd. GA-890FXA-UD5/GA-890FXA-=
UD5, BIOS F6 11/24/2010
[    0.000000] Hypervisor detected: Xen PV
[    0.025551] tsc: Fast TSC calibration using PIT
[    0.025554] tsc: Detected 2611.951 MHz processor
[    0.025555] tsc: Detected 2611.810 MHz TSC
[    0.034450] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> res=
erved
[    0.034455] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.049162] AGP: No AGP bridge found
[    0.049298] last_pfn =3D 0x30065 max_arch_pfn =3D 0x400000000
[    0.049299] Disabled
[    0.049301] x86/PAT: MTRRs disabled, skipping PAT initialization too.
[    0.049305] x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  U=
C
[    0.152960] RAMDISK: [mem 0x04000000-0x05d64fff]
[    0.152970] ACPI: Early table checksum verification disabled
[    0.153595] ACPI: RSDP 0x00000000000F6100 000014 (v00 GBT   )
[    0.153604] ACPI: RSDT 0x00000000CFCF1000 000044 (v01 GBT    GBTUACPI 4=
2302E31 GBTU 01010101)
[    0.153627] ACPI: FACP 0x00000000CFCF1080 000074 (v01 GBT    GBTUACPI 4=
2302E31 GBTU 01010101)
[    0.153659] ACPI: DSDT 0x00000000CFCF1100 007BE3 (v01 GBT    GBTUACPI 0=
0001000 MSFT 03000000)
[    0.153668] ACPI: FACS 0x00000000CFCF0000 000040
[    0.153676] ACPI: SSDT 0x00000000CFCF8DC0 00088C (v01 PTLTD  POWERNOW 0=
0000001  LTP 00000001)
[    0.153689] ACPI: HPET 0x00000000CFCF9680 000038 (v01 GBT    GBTUACPI 4=
2302E31 GBTU 00000098)
[    0.153699] ACPI: MCFG 0x00000000CFCF96C0 00003C (v01 GBT    GBTUACPI 4=
2302E31 GBTU 01010101)
[    0.153709] ACPI: MATS 0x00000000CFCF9700 000034 (v01 GBT             0=
0000000      00000000)
[    0.153718] ACPI: TAMG 0x00000000CFCF9770 000202 (v01 GBT    GBT   B0 5=
455312E BG?? 53450101)
[    0.153727] ACPI: APIC 0x00000000CFCF8D00 0000BC (v01 GBT    GBTUACPI 4=
2302E31 GBTU 01010101)
[    0.153736] ACPI: IVRS 0x00000000CFCF99F0 0000C0 (v01 AMD    RD890S   0=
0202031 AMD  00000000)
[    0.153742] ACPI: Reserving FACP table memory at [mem 0xcfcf1080-0xcfcf=
10f3]
[    0.153744] ACPI: Reserving DSDT table memory at [mem 0xcfcf1100-0xcfcf=
8ce2]
[    0.153746] ACPI: Reserving FACS table memory at [mem 0xcfcf0000-0xcfcf=
003f]
[    0.153747] ACPI: Reserving SSDT table memory at [mem 0xcfcf8dc0-0xcfcf=
964b]
[    0.153748] ACPI: Reserving HPET table memory at [mem 0xcfcf9680-0xcfcf=
96b7]
[    0.153750] ACPI: Reserving MCFG table memory at [mem 0xcfcf96c0-0xcfcf=
96fb]
[    0.153751] ACPI: Reserving MATS table memory at [mem 0xcfcf9700-0xcfcf=
9733]
[    0.153752] ACPI: Reserving TAMG table memory at [mem 0xcfcf9770-0xcfcf=
9971]
[    0.153754] ACPI: Reserving APIC table memory at [mem 0xcfcf8d00-0xcfcf=
8dbb]
[    0.153755] ACPI: Reserving IVRS table memory at [mem 0xcfcf99f0-0xcfcf=
9aaf]
[    0.153784] ACPI: Local APIC address 0xfee00000
[    0.153786] Setting APIC routing to Xen PV.
[    0.153833] NUMA turned off
[    0.153835] Faking a node at [mem 0x0000000000000000-0x0000000030064fff=
]
[    0.153848] NODE_DATA(0) allocated [mem 0x2fe7f000-0x2fea8fff]
[    0.156464] Zone ranges:
[    0.156466]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.156469]   DMA32    [mem 0x0000000001000000-0x0000000030064fff]
[    0.156471]   Normal   empty
[    0.156472]   Device   empty
[    0.156474] Movable zone start for each node
[    0.156479] Early memory node ranges
[    0.156480]   node   0: [mem 0x0000000000001000-0x000000000009afff]
[    0.156482]   node   0: [mem 0x0000000000100000-0x0000000030064fff]
[    0.156485] Initmem setup node 0 [mem 0x0000000000001000-0x000000003006=
4fff]
[    0.156487] On node 0 totalpages: 196607
[    0.156489]   DMA zone: 64 pages used for memmap
[    0.156490]   DMA zone: 21 pages reserved
[    0.156491]   DMA zone: 3994 pages, LIFO batch:0
[    0.156493]   DMA32 zone: 3010 pages used for memmap
[    0.156494]   DMA32 zone: 192613 pages, LIFO batch:63
[    0.156500] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.156577] On node 0, zone DMA: 101 pages in unavailable ranges
[    0.158449] On node 0, zone DMA32: 32667 pages in unavailable ranges
[    0.158453] p2m virtual area at (____ptrval____), size is 40000000
[    0.572830] Remapped 101 page(s)
[    0.573335] ACPI: PM-Timer IO Port: 0x808
[    0.573340] ACPI: Local APIC address 0xfee00000
[    0.573373] ACPI: LAPIC_NMI (acpi_id[0x00] dfl dfl lint[0x1])
[    0.573375] ACPI: LAPIC_NMI (acpi_id[0x01] dfl dfl lint[0x1])
[    0.573378] ACPI: LAPIC_NMI (acpi_id[0x02] dfl dfl lint[0x1])
[    0.573379] ACPI: LAPIC_NMI (acpi_id[0x03] dfl dfl lint[0x1])
[    0.573381] ACPI: LAPIC_NMI (acpi_id[0x04] dfl dfl lint[0x1])
[    0.573383] ACPI: LAPIC_NMI (acpi_id[0x05] dfl dfl lint[0x1])
[    0.573385] ACPI: LAPIC_NMI (acpi_id[0x06] dfl dfl lint[0x1])
[    0.573387] ACPI: LAPIC_NMI (acpi_id[0x07] dfl dfl lint[0x1])
[    0.573405] IOAPIC[0]: apic_id 8, version 33, address 0xfec00000, GSI 0=
-23
[    0.573417] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.573421] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.573426] ACPI: IRQ0 used by override.
[    0.573428] ACPI: IRQ9 used by override.
[    0.573436] Using ACPI (MADT) for SMP configuration information
[    0.573439] ACPI: HPET id: 0x10b9a201 base: 0xfed00000
[    0.574782] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.574802] PM: hibernation: Registered nosave memory: [mem 0x00000000-=
0x00000fff]
[    0.574805] PM: hibernation: Registered nosave memory: [mem 0x0009b000-=
0x0009ffff]
[    0.574806] PM: hibernation: Registered nosave memory: [mem 0x000a0000-=
0x000fffff]
[    0.574809] [mem 0x30065000-0xcfceffff] available for PCI devices
[    0.574812] Booting paravirtualized kernel on Xen
[    0.574814] Xen version: 4.14.5 (preserve-AD)
[    0.574818] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: =
0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.579941] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 n=
r_node_ids:1
[    0.580642] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u524288
[    0.580649] pcpu-alloc: s221184 r8192 d28672 u524288 alloc=3D1*2097152
[    0.580652] pcpu-alloc: [0] 0 1 2 3
[    0.580706] xen: PV spinlocks enabled
[    0.580712] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes,=
 linear)
[    0.580721] Built 1 zonelists, mobility grouping on.  Total pages: 1935=
12
[    0.580723] Policy zone: DMA32
[    0.580725] Kernel command line: placeholder root=3DUUID=3D36792c57-a8b=
c-4264-93a9-6b9485700770 ro quiet
[    0.581027] Dentry cache hash table entries: 131072 (order: 8, 1048576 =
bytes, linear)
[    0.581151] Inode-cache hash table entries: 65536 (order: 7, 524288 byt=
es, linear)
[    0.581305] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.629765] software IO TLB: mapped [mem 0x000000002ab80000-0x000000002=
eb80000] (64MB)
[    0.634658] Memory: 194252K/786428K available (12295K kernel code, 2537=
K rwdata, 7560K rodata, 2660K init, 5468K bss, 153260K reserved, 0K cma-re=
served)
[    0.635078] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4, =
Nodes=3D1
[    0.636201] ftrace: allocating 36545 entries in 143 pages
[    0.652769] ftrace: allocated 143 pages with 5 groups
[    0.653058] rcu: Hierarchical RCU implementation.
[    0.653060] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_id=
s=3D4.
[    0.653062] 	Rude variant of Tasks RCU enabled.
[    0.653062] 	Tracing variant of Tasks RCU enabled.
[    0.653064] rcu: RCU calculated value of scheduler-enlistment delay is =
25 jiffies.
[    0.653065] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_id=
s=3D4
[    0.661061] Using NULL legacy PIC
[    0.661064] NR_IRQS: 524544, nr_irqs: 456, preallocated irqs: 0
[    0.661126] xen:events: Using FIFO-based ABI
[    0.661155] xen: --> pirq=3D1 -> irq=3D1 (gsi=3D1)
[    0.661162] xen: --> pirq=3D2 -> irq=3D2 (gsi=3D2)
[    0.661169] xen: --> pirq=3D3 -> irq=3D3 (gsi=3D3)
[    0.661175] xen: --> pirq=3D4 -> irq=3D4 (gsi=3D4)
[    0.661181] xen: --> pirq=3D5 -> irq=3D5 (gsi=3D5)
[    0.661187] xen: --> pirq=3D6 -> irq=3D6 (gsi=3D6)
[    0.661194] xen: --> pirq=3D7 -> irq=3D7 (gsi=3D7)
[    0.661200] xen: --> pirq=3D8 -> irq=3D8 (gsi=3D8)
[    0.661206] xen: --> pirq=3D9 -> irq=3D9 (gsi=3D9)
[    0.661213] xen: --> pirq=3D10 -> irq=3D10 (gsi=3D10)
[    0.661225] xen: --> pirq=3D11 -> irq=3D11 (gsi=3D11)
[    0.661231] xen: --> pirq=3D12 -> irq=3D12 (gsi=3D12)
[    0.661238] xen: --> pirq=3D13 -> irq=3D13 (gsi=3D13)
[    0.661244] xen: --> pirq=3D14 -> irq=3D14 (gsi=3D14)
[    0.661250] xen: --> pirq=3D15 -> irq=3D15 (gsi=3D15)
[    0.663318] Console: colour VGA+ 80x25
[    0.663335] printk: console [tty0] enabled
[    0.663349] printk: console [hvc0] enabled
[    0.663378] ACPI: Core revision 20200925
[    0.666862] clocksource: xen: mask: 0xffffffffffffffff max_cycles: 0x1c=
d42e4dffb, max_idle_ns: 881590591483 ns
[    0.666866] Xen: using vcpuop timer interface
[    0.666871] installing Xen timer for CPU 0
[    0.666897] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles=
: 0x25a5d0d4c9e, max_idle_ns: 440795295205 ns
[    0.666900] Calibrating delay loop (skipped), value calculated using ti=
mer frequency.. 5223.62 BogoMIPS (lpj=3D10447240)
[    0.666904] pid_max: default: 32768 minimum: 301
[    0.667003] LSM: Security Framework initializing
[    0.667026] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.667093] AppArmor: AppArmor initialized
[    0.667096] TOMOYO Linux initialized
[    0.667145] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes=
, linear)
[    0.667151] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 =
bytes, linear)
[    0.667730] Last level iTLB entries: 4KB 512, 2MB 16, 4MB 8
[    0.667732] Last level dTLB entries: 4KB 512, 2MB 128, 4MB 64, 1GB 0
[    0.667737] Spectre V1 : Mitigation: usercopy/swapgs barriers and __use=
r pointer sanitization
[    0.667739] Spectre V2 : Mitigation: Retpolines
[    0.667740] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RS=
B on context switch
[    0.667741] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEXI=
T
[    0.677399] Freeing SMP alternatives memory: 32K
[    0.679111] cpu 0 spinlock event irq 25
[    0.679121] VPMU disabled by hypervisor.
[    0.679402] Performance Events: PMU not available due to virtualization=
, using software events only.
[    0.679496] rcu: Hierarchical SRCU implementation.
[    0.679937] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.680088] smp: Bringing up secondary CPUs ...
[    0.680260] installing Xen timer for CPU 1
[    0.680491] cpu 1 spinlock event irq 35
[    0.680491] installing Xen timer for CPU 2
[    0.680491] cpu 2 spinlock event irq 41
[    0.680491] installing Xen timer for CPU 3
[    0.680491] cpu 3 spinlock event irq 47
[    0.680491] smp: Brought up 1 node, 4 CPUs
[    0.680491] smpboot: Max logical packages: 1
[    0.682921] node 0 deferred pages initialised in 4ms
[    0.683188] devtmpfs: initialized
[    0.683188] x86/mm: Memory block size: 128MB
[    0.683339] PM: Registering ACPI NVS region [mem 0xcfcf0000-0xcfcf0fff]=
 (4096 bytes)
[    0.683339] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffff=
ff, max_idle_ns: 7645041785100000 ns
[    0.683339] futex hash table entries: 1024 (order: 4, 65536 bytes, line=
ar)
[    0.683339] pinctrl core: initialized pinctrl subsystem
[    0.683533] NET: Registered protocol family 16
[    0.683559] xen:grant_table: Grant tables using version 1 layout
[    0.683573] Grant table initialized
[    0.683783] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.683821] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.683857] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.683871] audit: initializing netlink subsys (disabled)
[    0.683892] audit: type=3D2000 audit(1678389264.193:1): state=3Dinitial=
ized audit_enabled=3D0 res=3D1
[    0.683892] thermal_sys: Registered thermal governor 'fair_share'
[    0.683892] thermal_sys: Registered thermal governor 'bang_bang'
[    0.683892] thermal_sys: Registered thermal governor 'step_wise'
[    0.683892] thermal_sys: Registered thermal governor 'user_space'
[    0.683892] thermal_sys: Registered thermal governor 'power_allocator'
[    0.683892] node 0 link 0: io port [9000, ffff]
[    0.683892] TOM: 00000000d0000000 aka 3328M
[    0.683892] node 0 link 0: mmio [a0000, bffff]
[    0.683892] node 0 link 0: mmio [d0000000, dfffffff]
[    0.683892] node 0 link 0: mmio [f0000000, ffffffff]
[    0.683892] node 0 link 0: mmio [e0000000, e06fffff]
[    0.683892] TOM2: 0000000430000000 aka 17152M
[    0.683892] bus: [bus 00-06] on node 0 link 0
[    0.683892] bus: 00 [io  0x0000-0xffff]
[    0.683892] bus: 00 [mem 0x000a0000-0x000bffff]
[    0.683892] bus: 00 [mem 0xd0000000-0xefffffff]
[    0.683892] bus: 00 [mem 0xf0000000-0xffffffff]
[    0.683892] bus: 00 [mem 0x430000000-0xfcffffffff]
[    0.683892] ACPI: bus type PCI registered
[    0.683892] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.683892] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe000000=
0-0xefffffff] (base 0xe0000000)
[    0.683892] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved in E8=
20
[    0.718777] PCI: Using configuration type 1 for base access
[    0.719991] Kprobes globally optimized
[    0.963876] ACPI: Added _OSI(Module Device)
[    0.963876] ACPI: Added _OSI(Processor Device)
[    0.963876] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.963876] ACPI: Added _OSI(Processor Aggregator Device)
[    0.963876] ACPI: Added _OSI(Linux-Dell-Video)
[    0.963876] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.963876] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.972804] ACPI: 2 ACPI AML tables successfully acquired and loaded
[    0.973132] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.973180] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.973220] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.973259] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.973304] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.973343] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.973381] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.973420] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.973465] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.973504] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.973543] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.973582] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.973626] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.973672] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.973718] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.973764] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.973815] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.973862] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.973908] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.973952] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974004] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.974050] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.974095] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974141] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.974193] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974239] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.974285] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.974330] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.974382] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.974427] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.974473] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.974523] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974576] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.974622] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.974668] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974714] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.974765] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.974811] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.974857] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.974904] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.974956] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKB (20200925/dspkginit-438)
[    0.975002] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKC (20200925/dspkginit-438)
[    0.975048] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKD (20200925/dspkginit-438)
[    0.975093] ACPI Error: AE_NOT_FOUND, While resolving a named reference=
 package element - LNKA (20200925/dspkginit-438)
[    0.975332] xen: registering gsi 9 triggering 0 polarity 1
[    0.978373] ACPI: Interpreter enabled
[    0.978398] ACPI: (supports S0 S3 S4 S5)
[    0.978401] ACPI: Using IOAPIC for interrupt routing
[    0.978446] PCI: Using host bridge windows from ACPI; if necessary, use=
 "pci=3Dnocrs" and report a bug
[    0.978633] ACPI: Enabled 9 GPEs in block 00 to 1F
[    0.985274] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.985282] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM Clo=
ckPM Segments MSI HPX-Type3]
[    0.985658] PCI host bridge to bus 0000:00
[    0.985661] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 windo=
w]
[    0.985663] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff windo=
w]
[    0.985664] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bff=
ff window]
[    0.985666] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dff=
ff window]
[    0.985667] pci_bus 0000:00: root bus resource [mem 0xcff00000-0xfebfff=
ff window]
[    0.985669] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.985698] pci 0000:00:00.0: [1002:5a11] type 00 class 0x060000
[    0.985737] pci 0000:00:00.0: [Firmware Bug]: reg 0x1c: invalid BAR (ca=
n't size)
[    0.985985] pci 0000:00:00.2: [1002:5a23] type 00 class 0x080600
[    0.986219] pci 0000:00:02.0: [1002:5a16] type 01 class 0x060400
[    0.986286] pci 0000:00:02.0: enabling Extended Tags
[    0.986361] pci 0000:00:02.0: PME# supported from D0 D3hot D3cold
[    0.986547] pci 0000:00:05.0: [1002:5a19] type 01 class 0x060400
[    0.986612] pci 0000:00:05.0: enabling Extended Tags
[    0.986686] pci 0000:00:05.0: PME# supported from D0 D3hot D3cold
[    0.986843] pci 0000:00:06.0: [1002:5a1a] type 01 class 0x060400
[    0.986910] pci 0000:00:06.0: enabling Extended Tags
[    0.986984] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.987142] pci 0000:00:07.0: [1002:5a1b] type 01 class 0x060400
[    0.987208] pci 0000:00:07.0: enabling Extended Tags
[    0.987281] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.987450] pci 0000:00:0d.0: [1002:5a1e] type 01 class 0x060400
[    0.987515] pci 0000:00:0d.0: enabling Extended Tags
[    0.987587] pci 0000:00:0d.0: PME# supported from D0 D3hot D3cold
[    0.987767] pci 0000:00:11.0: [1002:4391] type 00 class 0x010601
[    0.987795] pci 0000:00:11.0: reg 0x10: [io  0xff00-0xff07]
[    0.987810] pci 0000:00:11.0: reg 0x14: [io  0xfe00-0xfe03]
[    0.987825] pci 0000:00:11.0: reg 0x18: [io  0xfd00-0xfd07]
[    0.987840] pci 0000:00:11.0: reg 0x1c: [io  0xfc00-0xfc03]
[    0.987855] pci 0000:00:11.0: reg 0x20: [io  0xfb00-0xfb0f]
[    0.987871] pci 0000:00:11.0: reg 0x24: [mem 0xfdfff000-0xfdfff3ff]
[    0.988082] pci 0000:00:12.0: [1002:4397] type 00 class 0x0c0310
[    0.988110] pci 0000:00:12.0: reg 0x10: [mem 0xfdffe000-0xfdffefff]
[    0.988341] pci 0000:00:12.2: [1002:4396] type 00 class 0x0c0320
[    0.988369] pci 0000:00:12.2: reg 0x10: [mem 0xfdffd000-0xfdffd0ff]
[    0.988505] pci 0000:00:12.2: supports D1 D2
[    0.988506] pci 0000:00:12.2: PME# supported from D0 D1 D2 D3hot
[    0.988652] pci 0000:00:13.0: [1002:4397] type 00 class 0x0c0310
[    0.988680] pci 0000:00:13.0: reg 0x10: [mem 0xfdffc000-0xfdffcfff]
[    0.988909] pci 0000:00:13.2: [1002:4396] type 00 class 0x0c0320
[    0.988937] pci 0000:00:13.2: reg 0x10: [mem 0xfdffb000-0xfdffb0ff]
[    0.989073] pci 0000:00:13.2: supports D1 D2
[    0.989074] pci 0000:00:13.2: PME# supported from D0 D1 D2 D3hot
[    0.989223] pci 0000:00:14.0: [1002:4385] type 00 class 0x0c0500
[    0.989468] pci 0000:00:14.3: [1002:439d] type 00 class 0x060100
[    0.989711] pci 0000:00:14.4: [1002:4384] type 01 class 0x060401
[    0.989913] pci 0000:00:14.5: [1002:4399] type 00 class 0x0c0310
[    0.989940] pci 0000:00:14.5: reg 0x10: [mem 0xfdffa000-0xfdffafff]
[    0.990168] pci 0000:00:16.0: [1002:4397] type 00 class 0x0c0310
[    0.990196] pci 0000:00:16.0: reg 0x10: [mem 0xfdff9000-0xfdff9fff]
[    0.990425] pci 0000:00:16.2: [1002:4396] type 00 class 0x0c0320
[    0.990453] pci 0000:00:16.2: reg 0x10: [mem 0xfdff8000-0xfdff80ff]
[    0.990589] pci 0000:00:16.2: supports D1 D2
[    0.990590] pci 0000:00:16.2: PME# supported from D0 D1 D2 D3hot
[    0.990748] pci 0000:00:18.0: [1022:1200] type 00 class 0x060000
[    0.990915] pci 0000:00:18.1: [1022:1201] type 00 class 0x060000
[    0.991063] pci 0000:00:18.2: [1022:1202] type 00 class 0x060000
[    0.991212] pci 0000:00:18.3: [1022:1203] type 00 class 0x060000
[    0.991378] pci 0000:00:18.4: [1022:1204] type 00 class 0x060000
[    0.991633] pci 0000:01:00.0: [1002:68f9] type 00 class 0x030000
[    0.991669] pci 0000:01:00.0: reg 0x10: [mem 0xd0000000-0xdfffffff 64bi=
t pref]
[    0.991691] pci 0000:01:00.0: reg 0x18: [mem 0xfddc0000-0xfdddffff 64bi=
t]
[    0.991706] pci 0000:01:00.0: reg 0x20: [io  0xee00-0xeeff]
[    0.991732] pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref=
]
[    0.991744] pci 0000:01:00.0: enabling Extended Tags
[    0.991822] pci 0000:01:00.0: supports D1 D2
[    0.991942] pci 0000:01:00.1: [1002:aa68] type 00 class 0x040300
[    0.991975] pci 0000:01:00.1: reg 0x10: [mem 0xfddfc000-0xfddfffff 64bi=
t]
[    0.992049] pci 0000:01:00.1: enabling Extended Tags
[    0.992126] pci 0000:01:00.1: supports D1 D2
[    1.002963] pci 0000:00:02.0: PCI bridge to [bus 01]
[    1.002973] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[    1.002977] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddffff=
f]
[    1.002985] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdffffff=
f 64bit pref]
[    1.003068] pci 0000:00:05.0: PCI bridge to [bus 02]
[    1.003076] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
[    1.003081] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcffff=
f]
[    1.003088] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbffff=
f 64bit pref]
[    1.003149] pci 0000:00:06.0: PCI bridge to [bus 03]
[    1.003157] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
[    1.003161] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdaffff=
f]
[    1.003169] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9ffff=
f 64bit pref]
[    1.003263] pci 0000:04:00.0: [10ec:8168] type 00 class 0x020000
[    1.003293] pci 0000:04:00.0: reg 0x10: [io  0xbe00-0xbeff]
[    1.003331] pci 0000:04:00.0: reg 0x18: [mem 0xfd5ff000-0xfd5fffff 64bi=
t pref]
[    1.003356] pci 0000:04:00.0: reg 0x20: [mem 0xfd5f8000-0xfd5fbfff 64bi=
t pref]
[    1.003372] pci 0000:04:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref=
]
[    1.003512] pci 0000:04:00.0: supports D1 D2
[    1.003514] pci 0000:04:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.014959] pci 0000:00:07.0: PCI bridge to [bus 04]
[    1.014968] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
[    1.014973] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6ffff=
f]
[    1.014980] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5ffff=
f 64bit pref]
[    1.015082] pci 0000:05:00.0: [8086:150e] type 00 class 0x020000
[    1.015109] pci 0000:05:00.0: reg 0x10: [mem 0xfd280000-0xfd2fffff]
[    1.015150] pci 0000:05:00.0: reg 0x1c: [mem 0xfd4fc000-0xfd4fffff]
[    1.015309] pci 0000:05:00.0: PME# supported from D0 D3hot D3cold
[    1.015455] pci 0000:05:00.1: [8086:150e] type 00 class 0x020000
[    1.015482] pci 0000:05:00.1: reg 0x10: [mem 0xfd380000-0xfd3fffff]
[    1.015523] pci 0000:05:00.1: reg 0x1c: [mem 0xfd4f8000-0xfd4fbfff]
[    1.015674] pci 0000:05:00.1: PME# supported from D0 D3hot D3cold
[    1.015786] pci 0000:05:00.2: [8086:150e] type 00 class 0x020000
[    1.015813] pci 0000:05:00.2: reg 0x10: [mem 0xfd400000-0xfd47ffff]
[    1.015854] pci 0000:05:00.2: reg 0x1c: [mem 0xfd4f4000-0xfd4f7fff]
[    1.016004] pci 0000:05:00.2: PME# supported from D0 D3hot D3cold
[    1.016120] pci 0000:05:00.3: [8086:150e] type 00 class 0x020000
[    1.016150] pci 0000:05:00.3: reg 0x10: [mem 0xfd300000-0xfd37ffff]
[    1.016192] pci 0000:05:00.3: reg 0x1c: [mem 0xfd4f0000-0xfd4f3fff]
[    1.016342] pci 0000:05:00.3: PME# supported from D0 D3hot D3cold
[    1.026955] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    1.026964] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
[    1.026968] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4ffff=
f]
[    1.026975] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdeffff=
f 64bit pref]
[    1.026997] pci_bus 0000:06: extended config space not accessible
[    1.027050] pci 0000:06:06.0: [1102:0004] type 00 class 0x040100
[    1.027082] pci 0000:06:06.0: reg 0x10: [io  0x9f00-0x9f3f]
[    1.027232] pci 0000:06:06.0: supports D1 D2
[    1.027329] pci 0000:06:06.1: [1102:7003] type 00 class 0x098000
[    1.027358] pci 0000:06:06.1: reg 0x10: [io  0x9e00-0x9e07]
[    1.027506] pci 0000:06:06.1: supports D1 D2
[    1.028069] pci 0000:06:06.2: [1102:4001] type 00 class 0x0c0010
[    1.028102] pci 0000:06:06.2: reg 0x10: [mem 0xfd8ff000-0xfd8ff7ff]
[    1.028120] pci 0000:06:06.2: reg 0x14: [mem 0xfd8f8000-0xfd8fbfff]
[    1.028258] pci 0000:06:06.2: supports D1 D2
[    1.028259] pci 0000:06:06.2: PME# supported from D0 D1 D2 D3hot
[    1.028944] pci 0000:00:14.4: PCI bridge to [bus 06] (subtractive decod=
e)
[    1.028950] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
[    1.028955] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8ffff=
f]
[    1.028961] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7ffff=
f pref]
[    1.028963] pci 0000:00:14.4:   bridge window [io  0x0000-0x0cf7 window=
] (subtractive decode)
[    1.028964] pci 0000:00:14.4:   bridge window [io  0x0d00-0xffff window=
] (subtractive decode)
[    1.028966] pci 0000:00:14.4:   bridge window [mem 0x000a0000-0x000bfff=
f window] (subtractive decode)
[    1.028967] pci 0000:00:14.4:   bridge window [mem 0x000c0000-0x000dfff=
f window] (subtractive decode)
[    1.028968] pci 0000:00:14.4:   bridge window [mem 0xcff00000-0xfebffff=
f window] (subtractive decode)
[    1.029376] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 10 11) *0
[    1.029452] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 10 11) *0
[    1.029523] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 10 11) *0
[    1.029595] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 10 11) *0
[    1.029667] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 10 11) *0
[    1.029736] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 10 11) *0
[    1.029806] ACPI: PCI Interrupt Link [LNK0] (IRQs 3 4 5 6 7 10 11) *0
[    1.029877] ACPI: PCI Interrupt Link [LNK1] (IRQs 3 4 5 6 7 10 11) *0
[    1.029980] xen: registering gsi 13 triggering 1 polarity 0
[    1.030659] xen:balloon: Initialising balloon driver
[    1.030990] iommu: Default domain type: Translated
[    1.031011] pci 0000:01:00.0: vgaarb: setting as boot VGA device
[    1.031011] pci 0000:01:00.0: vgaarb: VGA device added: decodes=3Dio+me=
m,owns=3Dio+mem,locks=3Dnone
[    1.031011] pci 0000:01:00.0: vgaarb: bridge control possible
[    1.031011] vgaarb: loaded
[    1.031051] EDAC MC: Ver: 3.0.0
[    1.031225] NetLabel: Initializing
[    1.031225] NetLabel:  domain hash size =3D 128
[    1.031225] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    1.031225] NetLabel:  unlabeled traffic allowed by default
[    1.031225] PCI: Using ACPI for IRQ routing
[    1.045574] PCI: pci_cache_line_size set to 64 bytes
[    1.045707] e820: reserve RAM buffer [mem 0x0009b000-0x0009ffff]
[    1.045709] e820: reserve RAM buffer [mem 0x30065000-0x33ffffff]
[    1.046914] clocksource: Switched to clocksource tsc-early
[    1.063514] VFS: Disk quotas dquot_6.6.0
[    1.063538] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byt=
es)
[    1.063573] hugetlbfs: disabling because there are no supported hugepag=
e sizes
[    1.063701] AppArmor: AppArmor Filesystem Enabled
[    1.063728] pnp: PnP ACPI init
[    1.063891] system 00:00: [io  0x04d0-0x04d1] has been reserved
[    1.063894] system 00:00: [io  0x0220-0x0225] has been reserved
[    1.063895] system 00:00: [io  0x0290-0x0294] has been reserved
[    1.063903] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (activ=
e)
[    1.064309] pnp 00:01: disabling [mem 0x00000000-0x00000fff window] bec=
ause it overlaps 0000:01:00.0 BAR 6 [mem 0x00000000-0x0001ffff pref]
[    1.064314] pnp 00:01: disabling [mem 0x00000000-0x00000fff window disa=
bled] because it overlaps 0000:04:00.0 BAR 6 [mem 0x00000000-0x0001ffff pr=
ef]
[    1.064347] system 00:01: [io  0x0900-0x091f] has been reserved
[    1.064349] system 00:01: [io  0x0228-0x022f] has been reserved
[    1.064351] system 00:01: [io  0x040b] has been reserved
[    1.064352] system 00:01: [io  0x04d6] has been reserved
[    1.064354] system 00:01: [io  0x0c00-0x0c01] has been reserved
[    1.064355] system 00:01: [io  0x0c14] has been reserved
[    1.064357] system 00:01: [io  0x0c50-0x0c52] has been reserved
[    1.064358] system 00:01: [io  0x0c6c-0x0c6d] has been reserved
[    1.064360] system 00:01: [io  0x0c6f] has been reserved
[    1.064361] system 00:01: [io  0x0cd0-0x0cd1] has been reserved
[    1.064363] system 00:01: [io  0x0cd2-0x0cd3] has been reserved
[    1.064365] system 00:01: [io  0x0cd4-0x0cdf] has been reserved
[    1.064366] system 00:01: [io  0x0800-0x08fe] has been reserved
[    1.064368] system 00:01: [io  0x0a10-0x0a17] has been reserved
[    1.064369] system 00:01: [io  0x0b00-0x0b0f] has been reserved
[    1.064371] system 00:01: [io  0x0b10-0x0b1f] has been reserved
[    1.064372] system 00:01: [io  0x0b20-0x0b3f] has been reserved
[    1.064375] system 00:01: [mem 0xfee00400-0xfee00fff window] has been r=
eserved
[    1.064379] system 00:01: Plug and Play ACPI device, IDs PNP0c02 (activ=
e)
[    1.064579] xen: registering gsi 8 triggering 1 polarity 0
[    1.064607] pnp 00:02: Plug and Play ACPI device, IDs PNP0b00 (active)
[    1.065098] xen: registering gsi 1 triggering 1 polarity 0
[    1.065126] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
[    1.065198] system 00:04: [mem 0xe0000000-0xefffffff] has been reserved
[    1.065203] system 00:04: Plug and Play ACPI device, IDs PNP0c02 (activ=
e)
[    1.065506] system 00:05: [mem 0x000d4200-0x000d7fff] could not be rese=
rved
[    1.065508] system 00:05: [mem 0x000f0000-0x000f7fff] could not be rese=
rved
[    1.065510] system 00:05: [mem 0x000f8000-0x000fbfff] could not be rese=
rved
[    1.065511] system 00:05: [mem 0x000fc000-0x000fffff] could not be rese=
rved
[    1.065513] system 00:05: [mem 0xcfcf0000-0xcfcfffff] could not be rese=
rved
[    1.065515] system 00:05: [mem 0xffff0000-0xffffffff] has been reserved
[    1.065516] system 00:05: [mem 0x00000000-0x0009ffff] could not be rese=
rved
[    1.065518] system 00:05: [mem 0x00100000-0xcfceffff] could not be rese=
rved
[    1.065520] system 00:05: [mem 0xcfd00000-0xcfdfffff] has been reserved
[    1.065521] system 00:05: [mem 0xcfe00000-0xcfefffff] has been reserved
[    1.065523] system 00:05: [mem 0xfec00000-0xfec00fff] could not be rese=
rved
[    1.065525] system 00:05: [mem 0xfee00000-0xfee00fff] could not be rese=
rved
[    1.065526] system 00:05: [mem 0xfff80000-0xfffeffff] has been reserved
[    1.065531] system 00:05: Plug and Play ACPI device, IDs PNP0c01 (activ=
e)
[    1.065553] pnp: PnP ACPI: found 6 devices
[    1.074071] PM-Timer failed consistency check  (0xffffff) - aborting.
[    1.074167] NET: Registered protocol family 2
[    1.074236] IP idents hash table entries: 16384 (order: 5, 131072 bytes=
, linear)
[    1.075204] tcp_listen_portaddr_hash hash table entries: 512 (order: 1,=
 8192 bytes, linear)
[    1.075292] TCP established hash table entries: 8192 (order: 4, 65536 b=
ytes, linear)
[    1.075338] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, =
linear)
[    1.075363] TCP: Hash tables configured (established 8192 bind 8192)
[    1.075442] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
[    1.075454] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, li=
near)
[    1.075529] NET: Registered protocol family 1
[    1.075536] NET: Registered protocol family 44
[    1.075561] pci 0000:01:00.0: BAR 6: assigned [mem 0xfdd00000-0xfdd1fff=
f pref]
[    1.075563] pci 0000:00:02.0: PCI bridge to [bus 01]
[    1.075573] pci 0000:00:02.0:   bridge window [io  0xe000-0xefff]
[    1.075580] pci 0000:00:02.0:   bridge window [mem 0xfdd00000-0xfddffff=
f]
[    1.075585] pci 0000:00:02.0:   bridge window [mem 0xd0000000-0xdffffff=
f 64bit pref]
[    1.075593] pci 0000:00:05.0: PCI bridge to [bus 02]
[    1.075596] pci 0000:00:05.0:   bridge window [io  0xd000-0xdfff]
[    1.075602] pci 0000:00:05.0:   bridge window [mem 0xfdc00000-0xfdcffff=
f]
[    1.075607] pci 0000:00:05.0:   bridge window [mem 0xfdb00000-0xfdbffff=
f 64bit pref]
[    1.075614] pci 0000:00:06.0: PCI bridge to [bus 03]
[    1.075617] pci 0000:00:06.0:   bridge window [io  0xc000-0xcfff]
[    1.075623] pci 0000:00:06.0:   bridge window [mem 0xfda00000-0xfdaffff=
f]
[    1.075628] pci 0000:00:06.0:   bridge window [mem 0xfd900000-0xfd9ffff=
f 64bit pref]
[    1.075636] pci 0000:04:00.0: BAR 6: assigned [mem 0xfd600000-0xfd61fff=
f pref]
[    1.075638] pci 0000:00:07.0: PCI bridge to [bus 04]
[    1.075641] pci 0000:00:07.0:   bridge window [io  0xb000-0xbfff]
[    1.075648] pci 0000:00:07.0:   bridge window [mem 0xfd600000-0xfd6ffff=
f]
[    1.075652] pci 0000:00:07.0:   bridge window [mem 0xfd500000-0xfd5ffff=
f 64bit pref]
[    1.075660] pci 0000:00:0d.0: PCI bridge to [bus 05]
[    1.075663] pci 0000:00:0d.0:   bridge window [io  0xa000-0xafff]
[    1.075669] pci 0000:00:0d.0:   bridge window [mem 0xfd200000-0xfd4ffff=
f]
[    1.075673] pci 0000:00:0d.0:   bridge window [mem 0xfde00000-0xfdeffff=
f 64bit pref]
[    1.075682] pci 0000:00:14.4: PCI bridge to [bus 06]
[    1.075685] pci 0000:00:14.4:   bridge window [io  0x9000-0x9fff]
[    1.075692] pci 0000:00:14.4:   bridge window [mem 0xfd800000-0xfd8ffff=
f]
[    1.075698] pci 0000:00:14.4:   bridge window [mem 0xfd700000-0xfd7ffff=
f pref]
[    1.075709] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    1.075710] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    1.075712] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff wind=
ow]
[    1.075713] pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000dffff wind=
ow]
[    1.075715] pci_bus 0000:00: resource 8 [mem 0xcff00000-0xfebfffff wind=
ow]
[    1.075716] pci_bus 0000:01: resource 0 [io  0xe000-0xefff]
[    1.075718] pci_bus 0000:01: resource 1 [mem 0xfdd00000-0xfddfffff]
[    1.075719] pci_bus 0000:01: resource 2 [mem 0xd0000000-0xdfffffff 64bi=
t pref]
[    1.075721] pci_bus 0000:02: resource 0 [io  0xd000-0xdfff]
[    1.075722] pci_bus 0000:02: resource 1 [mem 0xfdc00000-0xfdcfffff]
[    1.075723] pci_bus 0000:02: resource 2 [mem 0xfdb00000-0xfdbfffff 64bi=
t pref]
[    1.075725] pci_bus 0000:03: resource 0 [io  0xc000-0xcfff]
[    1.075726] pci_bus 0000:03: resource 1 [mem 0xfda00000-0xfdafffff]
[    1.075728] pci_bus 0000:03: resource 2 [mem 0xfd900000-0xfd9fffff 64bi=
t pref]
[    1.075729] pci_bus 0000:04: resource 0 [io  0xb000-0xbfff]
[    1.075730] pci_bus 0000:04: resource 1 [mem 0xfd600000-0xfd6fffff]
[    1.075732] pci_bus 0000:04: resource 2 [mem 0xfd500000-0xfd5fffff 64bi=
t pref]
[    1.075733] pci_bus 0000:05: resource 0 [io  0xa000-0xafff]
[    1.075734] pci_bus 0000:05: resource 1 [mem 0xfd200000-0xfd4fffff]
[    1.075736] pci_bus 0000:05: resource 2 [mem 0xfde00000-0xfdefffff 64bi=
t pref]
[    1.075737] pci_bus 0000:06: resource 0 [io  0x9000-0x9fff]
[    1.075739] pci_bus 0000:06: resource 1 [mem 0xfd800000-0xfd8fffff]
[    1.075740] pci_bus 0000:06: resource 2 [mem 0xfd700000-0xfd7fffff pref=
]
[    1.075741] pci_bus 0000:06: resource 4 [io  0x0000-0x0cf7 window]
[    1.075743] pci_bus 0000:06: resource 5 [io  0x0d00-0xffff window]
[    1.075744] pci_bus 0000:06: resource 6 [mem 0x000a0000-0x000bffff wind=
ow]
[    1.075745] pci_bus 0000:06: resource 7 [mem 0x000c0000-0x000dffff wind=
ow]
[    1.075747] pci_bus 0000:06: resource 8 [mem 0xcff00000-0xfebfffff wind=
ow]
[    1.076017] xen: registering gsi 18 triggering 0 polarity 1
[    1.076046] xen: --> pirq=3D18 -> irq=3D18 (gsi=3D18)
[    1.095133] pci 0000:00:12.0: quirk_usb_early_handoff+0x0/0x710 took 18=
846 usecs
[    1.095266] xen: registering gsi 17 triggering 0 polarity 1
[    1.095288] xen: --> pirq=3D17 -> irq=3D17 (gsi=3D17)
[    1.095561] xen: registering gsi 18 triggering 0 polarity 1
[    1.095563] Already setup the GSI :18
[    1.115122] pci 0000:00:13.0: quirk_usb_early_handoff+0x0/0x710 took 19=
209 usecs
[    1.115254] xen: registering gsi 17 triggering 0 polarity 1
[    1.115256] Already setup the GSI :17
[    1.115533] xen: registering gsi 18 triggering 0 polarity 1
[    1.115535] Already setup the GSI :18
[    1.135122] pci 0000:00:14.5: quirk_usb_early_handoff+0x0/0x710 took 19=
238 usecs
[    1.135249] xen: registering gsi 18 triggering 0 polarity 1
[    1.135252] Already setup the GSI :18
[    1.155122] pci 0000:00:16.0: quirk_usb_early_handoff+0x0/0x710 took 19=
516 usecs
[    1.155258] xen: registering gsi 17 triggering 0 polarity 1
[    1.155261] Already setup the GSI :17
[    1.155444] pci 0000:01:00.0: Video device with shadowed ROM at [mem 0x=
000c0000-0x000dffff]
[    1.155493] pci 0000:01:00.1: D0 power state depends on 0000:01:00.0
[    1.155533] PCI: CLS 64 bytes, default 64
[    1.155650] Trying to unpack rootfs image as initramfs...
[    1.722743] Freeing initrd memory: 30100K
[    1.722874] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x25=
a5d0d4c9e, max_idle_ns: 440795295205 ns
[    1.722989] clocksource: Switched to clocksource tsc
[    1.723491] Initialise system trusted keyrings
[    1.723503] Key type blacklist registered
[    1.723669] workingset: timestamp_bits=3D36 max_order=3D18 bucket_order=
=3D0
[    1.725313] zbud: loaded
[    1.725791] integrity: Platform Keyring initialized
[    1.725794] Key type asymmetric registered
[    1.725796] Asymmetric key parser 'x509' registered
[    1.725806] Block layer SCSI generic (bsg) driver version 0.4 loaded (m=
ajor 251)
[    1.725912] io scheduler mq-deadline registered
[    1.726821] xen: registering gsi 18 triggering 0 polarity 1
[    1.726826] Already setup the GSI :18
[    1.727147] xen: registering gsi 17 triggering 0 polarity 1
[    1.727149] Already setup the GSI :17
[    1.727402] xen: registering gsi 18 triggering 0 polarity 1
[    1.727403] Already setup the GSI :18
[    1.727653] xen: registering gsi 19 triggering 0 polarity 1
[    1.727666] xen: --> pirq=3D19 -> irq=3D19 (gsi=3D19)
[    1.727917] xen: registering gsi 17 triggering 0 polarity 1
[    1.727919] Already setup the GSI :17
[    1.728129] shpchp: Standard Hot Plug PCI Controller Driver version: 0.=
4
[    1.728815] xen_mcelog: /dev/mcelog registered by Xen
[    1.729235] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.729785] Linux agpgart interface v0.103
[    1.730854] AMD-Vi: AMD IOMMUv2 functionality not available on this sys=
tem - This is not a bug.
[    1.731290] i8042: PNP: PS/2 Controller [PNP0303:PS2K] at 0x60,0x64 irq=
 1
[    1.731291] i8042: PNP: PS/2 appears to have AUX port disabled, if this=
 is incorrect please boot with i8042.nopnp
[    1.731458] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.731593] mousedev: PS/2 mouse device common for all mice
[    1.731646] rtc_cmos 00:02: RTC can wake from S4
[    1.731896] rtc_cmos 00:02: registered as rtc0
[    1.731963] rtc_cmos 00:02: setting system clock to 2023-03-09T19:14:24=
 UTC (1678389264)
[    1.731987] rtc_cmos 00:02: alarms up to one month, 242 bytes nvram
[    1.732081] ledtrig-cpu: registered to indicate activity on CPUs
[    1.732614] NET: Registered protocol family 10
[    1.747872] Segment Routing with IPv6
[    1.747896] mip6: Mobile IPv6
[    1.747899] NET: Registered protocol family 17
[    1.748025] mpls_gso: MPLS GSO support
[    1.748319] IPI shorthand broadcast: enabled
[    1.748336] sched_clock: Marking stable (1742645056, 5640484)->(1779002=
780, -30717240)
[    1.748577] registered taskstats version 1
[    1.748581] Loading compiled-in X.509 certificates
[    1.750360] input: AT Translated Set 2 keyboard as /devices/platform/i8=
042/serio0/input/input0
[    1.804637] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6=
149f3dd27dfcc5cbb419ea1'
[    1.804660] Loaded X.509 cert 'Debian Secure Boot Signer 2022 - linux: =
14011249c2675ea8e5148542202005810584b25f'
[    1.804711] zswap: loaded using pool lzo/zbud
[    1.805086] Key type .fscrypt registered
[    1.805088] Key type fscrypt-provisioning registered
[    1.805149] AppArmor: AppArmor sha1 policy hashing enabled
[    1.807320] Freeing unused decrypted memory: 2036K
[    1.808452] Freeing unused kernel image (initmem) memory: 2660K
[    1.826968] Write protecting the kernel read-only data: 22528k
[    1.834600] Freeing unused kernel image (text/rodata gap) memory: 2040K
[    1.834966] Freeing unused kernel image (rodata/data gap) memory: 632K
[    1.930846] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.930855] Run /init as init process
[    1.930856]   with arguments:
[    1.930857]     /init
[    1.930858]     placeholder
[    1.930859]   with environment:
[    1.930859]     HOME=3D/
[    1.930860]     TERM=3Dlinux
[    1.975734] udevd[111]: starting version 3.2.9
[    1.976278] random: udevd: uninitialized urandom read (16 bytes read)
[    1.976327] random: udevd: uninitialized urandom read (16 bytes read)
[    1.976347] random: udevd: uninitialized urandom read (16 bytes read)
[    1.978053] udevd[112]: starting eudev-3.2.9
[    2.012784] pps_core: LinuxPPS API ver. 1 registered
[    2.012787] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo=
 Giometti <giometti@linux.it>
[    2.014431] PTP clock support registered
[    2.015569] dca service started, version 1.12.1
[    2.026258] SCSI subsystem initialized
[    2.032087] igb: Intel(R) Gigabit Ethernet Network Driver
[    2.032090] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.032217] xen: registering gsi 17 triggering 0 polarity 1
[    2.032224] Already setup the GSI :17
[    2.044072] r8169 0000:04:00.0: can't disable ASPM; OS doesn't have ASP=
M control
[    2.044142] xen: registering gsi 19 triggering 0 polarity 1
[    2.044146] Already setup the GSI :19
[    2.052900] ACPI: bus type USB registered
[    2.052930] usbcore: registered new interface driver usbfs
[    2.052940] usbcore: registered new interface driver hub
[    2.052958] usbcore: registered new device driver usb
[    2.057117] r8169 0000:04:00.0 eth0: RTL8168d/8111d, 1c:6f:65:92:d2:20,=
 XID 283, IRQ 66
[    2.057120] r8169 0000:04:00.0 eth0: jumbo features [frames: 9194 bytes=
, tx checksumming: ko]
[    2.057182] ACPI Warning: SystemIO range 0x0000000000000B00-0x000000000=
0000B08 conflicts with OpRegion 0x0000000000000B00-0x0000000000000B0F (\SO=
R1) (20200925/utaddress-204)
[    2.057189] ACPI: If an ACPI driver is available for this device, you s=
hould use it instead of the native driver
[    2.057982] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.059243] ehci-pci: EHCI PCI platform driver
[    2.060258] xen: registering gsi 17 triggering 0 polarity 1
[    2.060264] Already setup the GSI :17
[    2.060286] QUIRK: Enable AMD PLL fix
[    2.060318] ehci-pci 0000:00:12.2: EHCI Host Controller
[    2.060327] ehci-pci 0000:00:12.2: new USB bus registered, assigned bus=
 number 1
[    2.060331] ehci-pci 0000:00:12.2: applying AMD SB700/SB800/Hudson-2/3 =
EHCI dummy qh workaround
[    2.060345] ehci-pci 0000:00:12.2: debug port 1
[    2.060428] ehci-pci 0000:00:12.2: irq 17, io mem 0xfdffd000
[    2.061287] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.065308] xen: registering gsi 21 triggering 0 polarity 1
[    2.065332] xen: --> pirq=3D21 -> irq=3D21 (gsi=3D21)
[    2.074007] libata version 3.00 loaded.
[    2.074927] ehci-pci 0000:00:12.2: USB 2.0 started, EHCI 1.00
[    2.075029] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    2.075031] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.075033] usb usb1: Product: EHCI Host Controller
[    2.075034] usb usb1: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    2.075035] usb usb1: SerialNumber: 0000:00:12.2
[    2.075194] hub 1-0:1.0: USB hub found
[    2.075205] hub 1-0:1.0: 5 ports detected
[    2.075634] xen: registering gsi 17 triggering 0 polarity 1
[    2.075638] Already setup the GSI :17
[    2.075680] ehci-pci 0000:00:13.2: EHCI Host Controller
[    2.075693] ehci-pci 0000:00:13.2: new USB bus registered, assigned bus=
 number 2
[    2.075698] ehci-pci 0000:00:13.2: applying AMD SB700/SB800/Hudson-2/3 =
EHCI dummy qh workaround
[    2.075711] ehci-pci 0000:00:13.2: debug port 1
[    2.075775] ehci-pci 0000:00:13.2: irq 17, io mem 0xfdffb000
[    2.079392] ahci 0000:00:11.0: version 3.0
[    2.079533] xen: registering gsi 19 triggering 0 polarity 1
[    2.079536] Already setup the GSI :19
[    2.079718] ahci 0000:00:11.0: AHCI 0001.0200 32 slots 6 ports 6 Gbps 0=
x3f impl SATA mode
[    2.079721] ahci 0000:00:11.0: flags: 64bit ncq sntf ilck pm led clo pm=
p pio slum part
[    2.080737] scsi host0: ahci
[    2.083096] scsi host1: ahci
[    2.083326] scsi host2: ahci
[    2.083517] scsi host3: ahci
[    2.083696] scsi host4: ahci
[    2.085658] igb 0000:05:00.0: added PHC on eth1
[    2.085661] igb 0000:05:00.0: Intel(R) Gigabit Ethernet Network Connect=
ion
[    2.085663] igb 0000:05:00.0: eth1: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b=
:44:44
[    2.085665] igb 0000:05:00.0: eth1: PBA No: Unknown
[    2.085667] igb 0000:05:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 =
tx queue(s)
[    2.085783] xen: registering gsi 18 triggering 0 polarity 1
[    2.085786] Already setup the GSI :18
[    2.091044] scsi host5: ahci
[    2.091122] ata1: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff1=
00 irq 67
[    2.091124] ata2: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff1=
80 irq 67
[    2.091126] ata3: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff2=
00 irq 67
[    2.091128] ata4: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff2=
80 irq 67
[    2.091130] ata5: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff3=
00 irq 67
[    2.091132] ata6: SATA max UDMA/133 abar m1024@0xfdfff000 port 0xfdfff3=
80 irq 67
[    2.094959] ehci-pci 0000:00:13.2: USB 2.0 started, EHCI 1.00
[    2.095056] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    2.095058] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.095060] usb usb2: Product: EHCI Host Controller
[    2.095061] usb usb2: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    2.095062] usb usb2: SerialNumber: 0000:00:13.2
[    2.095222] hub 2-0:1.0: USB hub found
[    2.095233] hub 2-0:1.0: 5 ports detected
[    2.095669] xen: registering gsi 17 triggering 0 polarity 1
[    2.095672] Already setup the GSI :17
[    2.095710] ehci-pci 0000:00:16.2: EHCI Host Controller
[    2.095717] ehci-pci 0000:00:16.2: new USB bus registered, assigned bus=
 number 3
[    2.095721] ehci-pci 0000:00:16.2: applying AMD SB700/SB800/Hudson-2/3 =
EHCI dummy qh workaround
[    2.095734] ehci-pci 0000:00:16.2: debug port 1
[    2.095795] ehci-pci 0000:00:16.2: irq 17, io mem 0xfdff8000
[    2.114936] ehci-pci 0000:00:16.2: USB 2.0 started, EHCI 1.00
[    2.115007] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.10
[    2.115009] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.115010] usb usb3: Product: EHCI Host Controller
[    2.115012] usb usb3: Manufacturer: Linux 5.10.0-21-amd64 ehci_hcd
[    2.115013] usb usb3: SerialNumber: 0000:00:16.2
[    2.115178] hub 3-0:1.0: USB hub found
[    2.115189] hub 3-0:1.0: 4 ports detected
[    2.122987] firewire_ohci 0000:06:06.2: added OHCI v1.10 device as card=
 0, 4 IR + 8 IT contexts, quirks 0x2
[    2.137070] igb 0000:05:00.1: added PHC on eth2
[    2.137072] igb 0000:05:00.1: Intel(R) Gigabit Ethernet Network Connect=
ion
[    2.137074] igb 0000:05:00.1: eth2: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b=
:44:45
[    2.137076] igb 0000:05:00.1: eth2: PBA No: Unknown
[    2.137077] igb 0000:05:00.1: Using MSI-X interrupts. 4 rx queue(s), 4 =
tx queue(s)
[    2.137186] xen: registering gsi 19 triggering 0 polarity 1
[    2.137189] Already setup the GSI :19
[    2.188652] igb 0000:05:00.2: added PHC on eth3
[    2.188655] igb 0000:05:00.2: Intel(R) Gigabit Ethernet Network Connect=
ion
[    2.188656] igb 0000:05:00.2: eth3: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b=
:44:46
[    2.188658] igb 0000:05:00.2: eth3: PBA No: Unknown
[    2.188660] igb 0000:05:00.2: Using MSI-X interrupts. 4 rx queue(s), 4 =
tx queue(s)
[    2.188756] xen: registering gsi 16 triggering 0 polarity 1
[    2.188773] xen: --> pirq=3D16 -> irq=3D16 (gsi=3D16)
[    2.240261] igb 0000:05:00.3: added PHC on eth4
[    2.240263] igb 0000:05:00.3: Intel(R) Gigabit Ethernet Network Connect=
ion
[    2.240265] igb 0000:05:00.3: eth4: (PCIe:5.0Gb/s:Width x4) 00:1b:21:9b=
:44:47
[    2.240267] igb 0000:05:00.3: eth4: PBA No: Unknown
[    2.240268] igb 0000:05:00.3: Using MSI-X interrupts. 4 rx queue(s), 4 =
tx queue(s)
[    2.405954] ata1: SATA link down (SStatus 0 SControl 300)
[    2.405980] ata3: SATA link down (SStatus 0 SControl 300)
[    2.406009] ata2: SATA link down (SStatus 0 SControl 300)
[    2.406035] ata4: SATA link down (SStatus 0 SControl 300)
[    2.406089] ata6: SATA link down (SStatus 0 SControl 300)
[    2.566965] ata5: SATA link up 6.0 Gbps (SStatus 133 SControl 300)
[    2.567714] ata5.00: supports DRM functions and may not be fully access=
ible
[    2.567752] ata5.00: ATA-10: CT2000MX500SSD1, M3CR045, max UDMA/133
[    2.567754] ata5.00: 3907029168 sectors, multi 1: LBA48 NCQ (depth 32),=
 AA
[    2.568396] ata5.00: supports DRM functions and may not be fully access=
ible
[    2.568939] ata5.00: configured for UDMA/133
[    2.569141] scsi 4:0:0:0: Direct-Access     ATA      CT2000MX500SSD1  0=
45  PQ: 0 ANSI: 5
[    2.570640] ohci-pci: OHCI PCI platform driver
[    2.571172] xen: registering gsi 18 triggering 0 polarity 1
[    2.571176] Already setup the GSI :18
[    2.571205] ohci-pci 0000:00:12.0: OHCI PCI host controller
[    2.571213] ohci-pci 0000:00:12.0: new USB bus registered, assigned bus=
 number 4
[    2.571275] ohci-pci 0000:00:12.0: irq 18, io mem 0xfdffe000
[    2.622000] sd 4:0:0:0: [sda] 3907029168 512-byte logical blocks: (2.00=
 TB/1.82 TiB)
[    2.622003] sd 4:0:0:0: [sda] 4096-byte physical blocks
[    2.622036] sd 4:0:0:0: [sda] Write Protect is off
[    2.622040] sd 4:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    2.622095] sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled=
, doesn't support DPO or FUA
[    2.639006] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 5.10
[    2.639009] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.639011] usb usb4: Product: OHCI PCI host controller
[    2.639012] usb usb4: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.639013] usb usb4: SerialNumber: 0000:00:12.0
[    2.639185] hub 4-0:1.0: USB hub found
[    2.639197] hub 4-0:1.0: 5 ports detected
[    2.639648]  sda: sda1 sda2 sda3 sda4
[    2.639675] xen: registering gsi 18 triggering 0 polarity 1
[    2.639679] Already setup the GSI :18
[    2.639714] ohci-pci 0000:00:13.0: OHCI PCI host controller
[    2.639727] ohci-pci 0000:00:13.0: new USB bus registered, assigned bus=
 number 5
[    2.639768] ohci-pci 0000:00:13.0: irq 18, io mem 0xfdffc000
[    2.647129] firewire_core 0000:06:06.2: created device fw0: GUID 00023c=
009103cf43, S400
[    2.655455] sd 4:0:0:0: [sda] supports TCG Opal
[    2.655457] sd 4:0:0:0: [sda] Attached SCSI disk
[    2.657982] sd 4:0:0:0: Attached scsi generic sg0 type 0
[    2.702206] device-mapper: uevent: version 1.0.3
[    2.702326] device-mapper: ioctl: 4.43.0-ioctl (2020-10-01) initialised=
: dm-devel@redhat.com
[    2.707005] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 5.10
[    2.707008] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.707010] usb usb5: Product: OHCI PCI host controller
[    2.707011] usb usb5: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.707012] usb usb5: SerialNumber: 0000:00:13.0
[    2.707550] hub 5-0:1.0: USB hub found
[    2.707564] hub 5-0:1.0: 5 ports detected
[    2.708108] xen: registering gsi 18 triggering 0 polarity 1
[    2.708116] Already setup the GSI :18
[    2.708182] ohci-pci 0000:00:14.5: OHCI PCI host controller
[    2.708193] ohci-pci 0000:00:14.5: new USB bus registered, assigned bus=
 number 6
[    2.708235] ohci-pci 0000:00:14.5: irq 18, io mem 0xfdffa000
[    2.775009] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 5.10
[    2.775014] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.775016] usb usb6: Product: OHCI PCI host controller
[    2.775017] usb usb6: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.775018] usb usb6: SerialNumber: 0000:00:14.5
[    2.775208] hub 6-0:1.0: USB hub found
[    2.775220] hub 6-0:1.0: 2 ports detected
[    2.775603] xen: registering gsi 18 triggering 0 polarity 1
[    2.775608] Already setup the GSI :18
[    2.775647] ohci-pci 0000:00:16.0: OHCI PCI host controller
[    2.775653] ohci-pci 0000:00:16.0: new USB bus registered, assigned bus=
 number 7
[    2.775711] ohci-pci 0000:00:16.0: irq 18, io mem 0xfdff9000
[    2.838984] usb usb7: New USB device found, idVendor=3D1d6b, idProduct=
=3D0001, bcdDevice=3D 5.10
[    2.838987] usb usb7: New USB device strings: Mfr=3D3, Product=3D2, Ser=
ialNumber=3D1
[    2.838988] usb usb7: Product: OHCI PCI host controller
[    2.838989] usb usb7: Manufacturer: Linux 5.10.0-21-amd64 ohci_hcd
[    2.838990] usb usb7: SerialNumber: 0000:00:16.0
[    2.839161] hub 7-0:1.0: USB hub found
[    2.839172] hub 7-0:1.0: 4 ports detected
[    3.290940] usb 4-4: new full-speed USB device number 2 using ohci-pci
[    3.491993] usb 4-4: New USB device found, idVendor=3D046d, idProduct=
=3Dc52e, bcdDevice=3D23.01
[    3.491996] usb 4-4: New USB device strings: Mfr=3D1, Product=3D2, Seri=
alNumber=3D0
[    3.491998] usb 4-4: Product: USB Receiver
[    3.491999] usb 4-4: Manufacturer: Logitech
[    3.493007] random: udevd: uninitialized urandom read (16 bytes read)
[    3.504188] hid: raw HID events driver (C) Jiri Kosina
[    3.515367] usbcore: registered new interface driver usbhid
[    3.515369] usbhid: USB HID core driver
[    3.517685] input: Logitech USB Receiver as /devices/pci0000:00/0000:00=
:12.0/usb4/4-4/4-4:1.0/0003:046D:C52E.0001/input/input1
[    3.575184] hid-generic 0003:046D:C52E.0001: input,hidraw0: USB HID v1.=
11 Keyboard [Logitech USB Receiver] on usb-0000:00:12.0-4/input0
[    3.575637] input: Logitech USB Receiver Mouse as /devices/pci0000:00/0=
000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input2
[    3.575770] input: Logitech USB Receiver Consumer Control as /devices/p=
ci0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input3
[    3.634993] input: Logitech USB Receiver System Control as /devices/pci=
0000:00/0000:00:12.0/usb4/4-4/4-4:1.1/0003:046D:C52E.0002/input/input4
[    3.635144] hid-generic 0003:046D:C52E.0002: input,hiddev0,hidraw1: USB=
 HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:00:12.0-4/input1
[    3.958943] PM: Image not found (code -22)
[    4.114681] EXT4-fs (sda1): mounted filesystem with ordered data mode. =
Opts: (null)
[    4.193605] Not activating Mandatory Access Control as /sbin/tomoyo-ini=
t does not exist.
[    4.546985] udevd[415]: starting version 3.2.9
[    4.551496] random: udevd: uninitialized urandom read (16 bytes read)
[    4.551795] random: udevd: uninitialized urandom read (16 bytes read)
[    4.551816] random: udevd: uninitialized urandom read (16 bytes read)
[    4.561924] udevd[416]: starting eudev-3.2.9
[    4.625179] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP=
0C0C:00/input/input7
[    4.625221] ACPI: Power Button [PWRB]
[    4.625302] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inp=
ut/input8
[    4.638960] ACPI: Power Button [PWRF]
[    4.853565] [drm] radeon kernel modesetting enabled.
[    4.865265] gameport gameport0: EMU10K1 is pci0000:06:06.1/gameport0, i=
o 0x9e00, speed 520kHz
[    4.865501] [drm:radeon_pci_probe [radeon]] *ERROR* radeon kernel modes=
etting for R600 or later requires firmware installed
[    4.865552] See https://wiki.debian.org/Firmware for information about =
missing firmware
[    4.883362] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    4.883468] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO a=
ddress
[    4.883564] sp5100-tco sp5100-tco: initialized. heartbeat=3D60 sec (now=
ayout=3D0)
[    4.915478] input: PC Speaker as /devices/platform/pcspkr/input/input9
[    5.005953] xen: registering gsi 20 triggering 0 polarity 1
[    5.005986] xen: --> pirq=3D20 -> irq=3D20 (gsi=3D20)
[    5.014267] snd_emu10k1 0000:06:06.0: Installing spdif_bug patch: SB Au=
digy 2 Platinum [SB0240P]
[    5.034015] xen: registering gsi 19 triggering 0 polarity 1
[    5.034019] Already setup the GSI :19
[    5.095705] input: HDA ATI HDMI HDMI/DP,pcm=3D3 as /devices/pci0000:00/=
0000:00:02.0/0000:01:00.1/sound/card1/input10
[    7.023078] random: lvm: uninitialized urandom read (4 bytes read)
[    7.114956] Adding 1952764k swap on /dev/sda2.  Priority:-2 extents:1 a=
cross:1952764k SSFS
[    7.135431] EXT4-fs (sda1): re-mounted. Opts: errors=3Dremount-ro
[    7.541888] EXT4-fs (dm-0): mounted filesystem with ordered data mode. =
Opts: errors=3Dremount-ro
[    7.715152] random: dd: uninitialized urandom read (32 bytes read)
[    7.798196] r8169 0000:04:00.0: firmware: direct-loading firmware rtl_n=
ic/rtl8168d-2.fw
[    7.798214] r8169 0000:04:00.0: Unable to load firmware rtl_nic/rtl8168=
d-2.fw (-22)
[    7.799128] RTL8211B Gigabit Ethernet r8169-0-400:00: attached PHY driv=
er [RTL8211B Gigabit Ethernet] (mii_bus:phy_addr=3Dr8169-0-400:00, irq=3DI=
GNORE)
[    7.869251] r8169 0000:04:00.0 eth0: Link is Down
[    7.911901] bridge: filtering via arp/ip/ip6tables is no longer availab=
le by default. Update your scripts to load br_netfilter if you need this.
[    7.920807] xenbr0: port 1(eth0) entered blocking state
[    7.920811] xenbr0: port 1(eth0) entered disabled state
[    7.920895] device eth0 entered promiscuous mode
[    8.690956] random: crng init done
[    8.690959] random: 9 urandom warning(s) missed due to ratelimiting
[    9.782724] r8169 0000:04:00.0 eth0: Link is Up - 1Gbps/Full - flow con=
trol rx/tx
[    9.782742] xenbr0: port 1(eth0) entered blocking state
[    9.782743] xenbr0: port 1(eth0) entered forwarding state
[   10.106361] xen:xen_evtchn: Event-channel device installed
[   10.121419] xen_acpi_processor: Uploading Xen processor PM info

--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=hypervisor.log
Content-Transfer-Encoding: base64

KFhFTikgWGVuIHZlcnNpb24gNC4xNC41IChEZWJpYW4gNC4xNC41Kzg2LWcxYzM1NDc2N2Q1LTEp
IChwa2cteGVuLWRldmVsQGxpc3RzLmFsaW90aC5kZWJpYW4ub3JnKSAoeDg2XzY0LWxpbnV4LWdu
dS1nY2MgKERlYmlhbiAxMC4yLjEtNikgMTAuMi4xIDIwMjEwMTEwKSBkZWJ1Zz1uICBGcmkgTm92
ICA0IDE5OjI1OjQ2IFVUQyAyMDIyCihYRU4pIGJ1aWxkLWlkOiA4ODg2OTlhMzUxZDVjYmYyNzA1
MzQ0MjA1NTY1ZGQyMDQ3OWYxYjE0CihYRU4pIEJvb3Rsb2FkZXI6IEdSVUIgMi4wNi0zfmRlYjEx
dTUKKFhFTikgQ29tbWFuZCBsaW5lOiBwbGFjZWhvbGRlciBkb20wX21lbT03NjhNLG1heDo3NjhN
IGlvbW11PWRlYnVnIGxvZ2x2bD1hbGwgZ3Vlc3RfbG9nbHZsPWFsbAooWEVOKSBYZW4gaW1hZ2Ug
bG9hZCBiYXNlIGFkZHJlc3M6IDB4Y2Y0MDAwMDAKKFhFTikgVmlkZW8gaW5mb3JtYXRpb246CihY
RU4pICBWR0EgaXMgdGV4dCBtb2RlIDgweDI1LCBmb250IDh4MTYKKFhFTikgIFZCRS9EREMgbWV0
aG9kczogVjI7IEVESUQgdHJhbnNmZXIgdGltZTogMSBzZWNvbmRzCihYRU4pIERpc2MgaW5mb3Jt
YXRpb246CihYRU4pICBGb3VuZCAxIE1CUiBzaWduYXR1cmVzCihYRU4pICBGb3VuZCAxIEVERCBp
bmZvcm1hdGlvbiBzdHJ1Y3R1cmVzCihYRU4pIENQVSBWZW5kb3I6IEFNRCwgRmFtaWx5IDE2ICgw
eDEwKSwgTW9kZWwgNCAoMHg0KSwgU3RlcHBpbmcgMyAocmF3IDAwMTAwZjQzKQooWEVOKSBYZW4t
ZTgyMCBSQU0gbWFwOgooWEVOKSAgWzAwMDAwMDAwMDAwMDAwMDAsIDAwMDAwMDAwMDAwOWI3ZmZd
ICh1c2FibGUpCihYRU4pICBbMDAwMDAwMDAwMDA5ZjgwMCwgMDAwMDAwMDAwMDA5ZmZmZl0gKHJl
c2VydmVkKQooWEVOKSAgWzAwMDAwMDAwMDAwZjAwMDAsIDAwMDAwMDAwMDAwZmZmZmZdIChyZXNl
cnZlZCkKKFhFTikgIFswMDAwMDAwMDAwMTAwMDAwLCAwMDAwMDAwMGNmY2VmZmZmXSAodXNhYmxl
KQooWEVOKSAgWzAwMDAwMDAwY2ZjZjAwMDAsIDAwMDAwMDAwY2ZjZjBmZmZdIChBQ1BJIE5WUykK
KFhFTikgIFswMDAwMDAwMGNmY2YxMDAwLCAwMDAwMDAwMGNmY2ZmZmZmXSAoQUNQSSBkYXRhKQoo
WEVOKSAgWzAwMDAwMDAwY2ZkMDAwMDAsIDAwMDAwMDAwY2ZkZmZmZmZdIChyZXNlcnZlZCkKKFhF
TikgIFswMDAwMDAwMGUwMDAwMDAwLCAwMDAwMDAwMGVmZmZmZmZmXSAocmVzZXJ2ZWQpCihYRU4p
ICBbMDAwMDAwMDBmZWMwMDAwMCwgMDAwMDAwMDBmZmZmZmZmZl0gKHJlc2VydmVkKQooWEVOKSAg
WzAwMDAwMDAxMDAwMDAwMDAsIDAwMDAwMDA0MmZmZmZmZmZdICh1c2FibGUpCihYRU4pIEFDUEk6
IFJTRFAgMDAwRjYxMDAsIDAwMTQgKHIwIEdCVCAgICkKKFhFTikgQUNQSTogUlNEVCBDRkNGMTAw
MCwgMDA0NCAocjEgR0JUICAgIEdCVFVBQ1BJIDQyMzAyRTMxIEdCVFUgIDEwMTAxMDEpCihYRU4p
IEFDUEk6IEZBQ1AgQ0ZDRjEwODAsIDAwNzQgKHIxIEdCVCAgICBHQlRVQUNQSSA0MjMwMkUzMSBH
QlRVICAxMDEwMTAxKQooWEVOKSBBQ1BJOiBEU0RUIENGQ0YxMTAwLCA3QkUzIChyMSBHQlQgICAg
R0JUVUFDUEkgICAgIDEwMDAgTVNGVCAgMzAwMDAwMCkKKFhFTikgQUNQSTogRkFDUyBDRkNGMDAw
MCwgMDA0MAooWEVOKSBBQ1BJOiBTU0RUIENGQ0Y4REMwLCAwODhDIChyMSBQVExURCAgUE9XRVJO
T1cgICAgICAgIDEgIExUUCAgICAgICAgMSkKKFhFTikgQUNQSTogSFBFVCBDRkNGOTY4MCwgMDAz
OCAocjEgR0JUICAgIEdCVFVBQ1BJIDQyMzAyRTMxIEdCVFUgICAgICAgOTgpCihYRU4pIEFDUEk6
IE1DRkcgQ0ZDRjk2QzAsIDAwM0MgKHIxIEdCVCAgICBHQlRVQUNQSSA0MjMwMkUzMSBHQlRVICAx
MDEwMTAxKQooWEVOKSBBQ1BJOiBNQVRTIENGQ0Y5NzAwLCAwMDM0IChyMSBHQlQgICAgICAgICAg
ICAgICAgICAgIDAgICAgICAgICAgICAgMCkKKFhFTikgQUNQSTogVEFNRyBDRkNGOTc3MCwgMDIw
MiAocjEgR0JUICAgIEdCVCAgIEIwIDU0NTUzMTJFIEJHAQEgNTM0NTAxMDEpCihYRU4pIEFDUEk6
IEFQSUMgQ0ZDRjhEMDAsIDAwQkMgKHIxIEdCVCAgICBHQlRVQUNQSSA0MjMwMkUzMSBHQlRVICAx
MDEwMTAxKQooWEVOKSBBQ1BJOiBJVlJTIENGQ0Y5OUYwLCAwMEMwIChyMSAgQU1EICAgICBSRDg5
MFMgICAyMDIwMzEgQU1EICAgICAgICAgMCkKKFhFTikgU3lzdGVtIFJBTTogMTYzODBNQiAoMTY3
NzM2NzZrQikKKFhFTikgTm8gTlVNQSBjb25maWd1cmF0aW9uIGZvdW5kCihYRU4pIEZha2luZyBh
IG5vZGUgYXQgMDAwMDAwMDAwMDAwMDAwMC0wMDAwMDAwNDMwMDAwMDAwCihYRU4pIERvbWFpbiBo
ZWFwIGluaXRpYWxpc2VkCihYRU4pIGZvdW5kIFNNUCBNUC10YWJsZSBhdCAwMDBmNDZmMAooWEVO
KSBETUkgMi40IHByZXNlbnQuCihYRU4pIFVzaW5nIEFQSUMgZHJpdmVyIGRlZmF1bHQKKFhFTikg
QUNQSTogUE0tVGltZXIgSU8gUG9ydDogMHg4MDggKDMyIGJpdHMpCihYRU4pIEFDUEk6IFNMRUVQ
IElORk86IHBtMXhfY250WzE6ODA0LDE6MF0sIHBtMXhfZXZ0WzE6ODAwLDE6MF0KKFhFTikgQUNQ
STogICAgICAgICAgICAgd2FrZXVwX3ZlY1tjZmNmMDAwY10sIHZlY19zaXplWzIwXQooWEVOKSBB
Q1BJOiBMb2NhbCBBUElDIGFkZHJlc3MgMHhmZWUwMDAwMAooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAwXSBsYXBpY19pZFsweDAwXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAxXSBsYXBpY19pZFsweDAxXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAyXSBsYXBpY19pZFsweDAyXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDAzXSBsYXBpY19pZFsweDAzXSBlbmFibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAoYWNw
aV9pZFsweDA0XSBsYXBpY19pZFsweDA0XSBkaXNhYmxlZCkKKFhFTikgQUNQSTogTEFQSUMgKGFj
cGlfaWRbMHgwNV0gbGFwaWNfaWRbMHgwNV0gZGlzYWJsZWQpCihYRU4pIEFDUEk6IExBUElDIChh
Y3BpX2lkWzB4MDZdIGxhcGljX2lkWzB4MDZdIGRpc2FibGVkKQooWEVOKSBBQ1BJOiBMQVBJQyAo
YWNwaV9pZFsweDA3XSBsYXBpY19pZFsweDA3XSBkaXNhYmxlZCkKKFhFTikgQUNQSTogTEFQSUNf
Tk1JIChhY3BpX2lkWzB4MDBdIGRmbCBkZmwgbGludFsweDFdKQooWEVOKSBBQ1BJOiBMQVBJQ19O
TUkgKGFjcGlfaWRbMHgwMV0gZGZsIGRmbCBsaW50WzB4MV0pCihYRU4pIEFDUEk6IExBUElDX05N
SSAoYWNwaV9pZFsweDAyXSBkZmwgZGZsIGxpbnRbMHgxXSkKKFhFTikgQUNQSTogTEFQSUNfTk1J
IChhY3BpX2lkWzB4MDNdIGRmbCBkZmwgbGludFsweDFdKQooWEVOKSBBQ1BJOiBMQVBJQ19OTUkg
KGFjcGlfaWRbMHgwNF0gZGZsIGRmbCBsaW50WzB4MV0pCihYRU4pIEFDUEk6IExBUElDX05NSSAo
YWNwaV9pZFsweDA1XSBkZmwgZGZsIGxpbnRbMHgxXSkKKFhFTikgQUNQSTogTEFQSUNfTk1JIChh
Y3BpX2lkWzB4MDZdIGRmbCBkZmwgbGludFsweDFdKQooWEVOKSBBQ1BJOiBMQVBJQ19OTUkgKGFj
cGlfaWRbMHgwN10gZGZsIGRmbCBsaW50WzB4MV0pCihYRU4pIEFDUEk6IElPQVBJQyAoaWRbMHgw
OF0gYWRkcmVzc1sweGZlYzAwMDAwXSBnc2lfYmFzZVswXSkKKFhFTikgSU9BUElDWzBdOiBhcGlj
X2lkIDgsIHZlcnNpb24gMzMsIGFkZHJlc3MgMHhmZWMwMDAwMCwgR1NJIDAtMjMKKFhFTikgQUNQ
STogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgMCBnbG9iYWxfaXJxIDIgZGZsIGRmbCkKKFhF
TikgQUNQSTogSU5UX1NSQ19PVlIgKGJ1cyAwIGJ1c19pcnEgOSBnbG9iYWxfaXJxIDkgbG93IGxl
dmVsKQooWEVOKSBBQ1BJOiBJUlEwIHVzZWQgYnkgb3ZlcnJpZGUuCihYRU4pIEFDUEk6IElSUTIg
dXNlZCBieSBvdmVycmlkZS4KKFhFTikgQUNQSTogSVJROSB1c2VkIGJ5IG92ZXJyaWRlLgooWEVO
KSBFbmFibGluZyBBUElDIG1vZGU6ICBGbGF0LiAgVXNpbmcgMSBJL08gQVBJQ3MKKFhFTikgQUNQ
STogSFBFVCBpZDogMHgxMGI5YTIwMSBiYXNlOiAweGZlZDAwMDAwCihYRU4pIFBDSTogTUNGRyBj
b25maWd1cmF0aW9uIDA6IGJhc2UgZTAwMDAwMDAgc2VnbWVudCAwMDAwIGJ1c2VzIDAwIC0gZmYK
KFhFTikgUENJOiBNQ0ZHIGFyZWEgYXQgZTAwMDAwMDAgcmVzZXJ2ZWQgaW4gRTgyMAooWEVOKSBQ
Q0k6IFVzaW5nIE1DRkcgZm9yIHNlZ21lbnQgMDAwMCBidXMgMDAtZmYKKFhFTikgQU1ELVZpOiBG
b3VuZCBNU0kgY2FwYWJpbGl0eSBibG9jayBhdCAweDU0CihYRU4pIFVzaW5nIEFDUEkgKE1BRFQp
IGZvciBTTVAgY29uZmlndXJhdGlvbiBpbmZvcm1hdGlvbgooWEVOKSBTTVA6IEFsbG93aW5nIDgg
Q1BVcyAoNCBob3RwbHVnIENQVXMpCihYRU4pIElSUSBsaW1pdHM6IDI0IEdTSSwgODA4IE1TSS9N
U0ktWAooWEVOKSBObyBTU0JEIGNvbnRyb2xzIGF2YWlsYWJsZQooWEVOKSBDUFUwOiA4MDAgLi4u
IDI2MDAgTUh6CihYRU4pIENQVTA6IEFNRCBGYW0xMGggbWFjaGluZSBjaGVjayByZXBvcnRpbmcg
ZW5hYmxlZAooWEVOKSBTcGVjdWxhdGl2ZSBtaXRpZ2F0aW9uIGZhY2lsaXRpZXM6CihYRU4pICAg
SGFyZHdhcmUgaGludHM6CihYRU4pICAgSGFyZHdhcmUgZmVhdHVyZXM6CihYRU4pICAgQ29tcGls
ZWQtaW4gc3VwcG9ydDogSU5ESVJFQ1RfVEhVTksgU0hBRE9XX1BBR0lORwooWEVOKSAgIFhlbiBz
ZXR0aW5nczogQlRJLVRodW5rIFJFVFBPTElORSwgU1BFQ19DVFJMOiBObywgT3RoZXI6IEJSQU5D
SF9IQVJERU4KKFhFTikgICBTdXBwb3J0IGZvciBIVk0gVk1zOiBSU0IKKFhFTikgICBTdXBwb3J0
IGZvciBQViBWTXM6IFJTQgooWEVOKSAgIFhQVEkgKDY0LWJpdCBQViBvbmx5KTogRG9tMCBkaXNh
YmxlZCwgRG9tVSBkaXNhYmxlZCAod2l0aG91dCBQQ0lEKQooWEVOKSAgIFBWIEwxVEYgc2hhZG93
aW5nOiBEb20wIGRpc2FibGVkLCBEb21VIGRpc2FibGVkCihYRU4pIFVzaW5nIHNjaGVkdWxlcjog
U01QIENyZWRpdCBTY2hlZHVsZXIgcmV2MiAoY3JlZGl0MikKKFhFTikgSW5pdGlhbGl6aW5nIENy
ZWRpdDIgc2NoZWR1bGVyCihYRU4pICBsb2FkX3ByZWNpc2lvbl9zaGlmdDogMTgKKFhFTikgIGxv
YWRfd2luZG93X3NoaWZ0OiAzMAooWEVOKSAgdW5kZXJsb2FkX2JhbGFuY2VfdG9sZXJhbmNlOiAw
CihYRU4pICBvdmVybG9hZF9iYWxhbmNlX3RvbGVyYW5jZTogLTMKKFhFTikgIHJ1bnF1ZXVlcyBh
cnJhbmdlbWVudDogc29ja2V0CihYRU4pICBjYXAgZW5mb3JjZW1lbnQgZ3JhbnVsYXJpdHk6IDEw
bXMKKFhFTikgbG9hZCB0cmFja2luZyB3aW5kb3cgbGVuZ3RoIDEwNzM3NDE4MjQgbnMKKFhFTikg
UGxhdGZvcm0gdGltZXIgaXMgMTQuMzE4TUh6IEhQRVQKKFhFTikgRGV0ZWN0ZWQgMjYxMS44MTEg
TUh6IHByb2Nlc3Nvci4KKFhFTikgYWx0IHRhYmxlIGZmZmY4MmQwNDA0NTEyOTAgLT4gZmZmZjgy
ZDA0MDQ1YzMzNAooWEVOKSBBTUQtVmk6IElWUlMgQmxvY2s6IEZvdW5kIHR5cGUgMHgxMCBmbGFn
cyAweDNlIGxlbiAweDkwIGlkIDB4MgooWEVOKSBBTUQtVmk6IFVzaW5nIElWSEQgdHlwZSAweDEw
CihYRU4pIEFNRC1WaTogQUNQSSBUYWJsZToKKFhFTikgQU1ELVZpOiAgU2lnbmF0dXJlIElWUlMK
KFhFTikgQU1ELVZpOiAgTGVuZ3RoIDB4YzAKKFhFTikgQU1ELVZpOiAgUmV2aXNpb24gMHgxCihY
RU4pIEFNRC1WaTogIENoZWNrU3VtIDB4YWMKKFhFTikgQU1ELVZpOiAgT0VNX0lkIEFNRCAgCihY
RU4pIEFNRC1WaTogIE9FTV9UYWJsZV9JZCBSRDg5MFMKKFhFTikgQU1ELVZpOiAgT0VNX1Jldmlz
aW9uIDB4MjAyMDMxCihYRU4pIEFNRC1WaTogIENyZWF0b3JfSWQgQU1EIAooWEVOKSBBTUQtVmk6
ICBDcmVhdG9yX1JldmlzaW9uIDAKKFhFTikgQU1ELVZpOiBJVlJTIEJsb2NrOiB0eXBlIDB4MTAg
ZmxhZ3MgMHgzZSBsZW4gMHg5MCBpZCAweDIKKFhFTikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRy
eTogdHlwZSAweDMgaWQgMCBmbGFncyAwCihYRU4pIEFNRC1WaTogIERldl9JZCBSYW5nZTogMCAt
PiAweDIKKFhFTikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRyeTogdHlwZSAweDIgaWQgMHgxMCBm
bGFncyAwCihYRU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50cnk6IHR5cGUgMHgzIGlkIDB4MTAw
IGZsYWdzIDAKKFhFTikgQU1ELVZpOiAgRGV2X0lkIFJhbmdlOiAweDEwMCAtPiAweDEwMQooWEVO
KSBBTUQtVmk6IElWSEQgRGV2aWNlIEVudHJ5OiB0eXBlIDB4MiBpZCAweDI4IGZsYWdzIDAKKFhF
TikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRyeTogdHlwZSAweDIgaWQgMHgzMCBmbGFncyAwCihY
RU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50cnk6IHR5cGUgMHgyIGlkIDB4MzggZmxhZ3MgMAoo
WEVOKSBBTUQtVmk6IElWSEQgRGV2aWNlIEVudHJ5OiB0eXBlIDB4MiBpZCAweDQwMCBmbGFncyAw
CihYRU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50cnk6IHR5cGUgMHgyIGlkIDB4NjggZmxhZ3Mg
MAooWEVOKSBBTUQtVmk6IElWSEQgRGV2aWNlIEVudHJ5OiB0eXBlIDB4MyBpZCAweDUwMCBmbGFn
cyAwCihYRU4pIEFNRC1WaTogIERldl9JZCBSYW5nZTogMHg1MDAgLT4gMHg1MDMKKFhFTikgQU1E
LVZpOiBJVkhEIERldmljZSBFbnRyeTogdHlwZSAweDIgaWQgMHg4OCBmbGFncyAwCihYRU4pIEFN
RC1WaTogSVZIRCBEZXZpY2UgRW50cnk6IHR5cGUgMHgzIGlkIDB4OTAgZmxhZ3MgMAooWEVOKSBB
TUQtVmk6ICBEZXZfSWQgUmFuZ2U6IDB4OTAgLT4gMHg5MgooWEVOKSBBTUQtVmk6IElWSEQgRGV2
aWNlIEVudHJ5OiB0eXBlIDB4MyBpZCAweDk4IGZsYWdzIDAKKFhFTikgQU1ELVZpOiAgRGV2X0lk
IFJhbmdlOiAweDk4IC0+IDB4OWEKKFhFTikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRyeTogdHlw
ZSAweDIgaWQgMHhhMCBmbGFncyAweGQ3CihYRU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50cnk6
IHR5cGUgMHgyIGlkIDB4YTMgZmxhZ3MgMAooWEVOKSBBTUQtVmk6IElWSEQgRGV2aWNlIEVudHJ5
OiB0eXBlIDB4MiBpZCAweGE0IGZsYWdzIDAKKFhFTikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRy
eTogdHlwZSAweDQzIGlkIDB4NjAwIGZsYWdzIDAKKFhFTikgQU1ELVZpOiAgRGV2X0lkIFJhbmdl
OiAweDYwMCAtPiAweDZmZiBhbGlhcyAweGE0CihYRU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50
cnk6IHR5cGUgMHgyIGlkIDB4YTUgZmxhZ3MgMAooWEVOKSBBTUQtVmk6IElWSEQgRGV2aWNlIEVu
dHJ5OiB0eXBlIDB4MyBpZCAweGIwIGZsYWdzIDAKKFhFTikgQU1ELVZpOiAgRGV2X0lkIFJhbmdl
OiAweGIwIC0+IDB4YjIKKFhFTikgQU1ELVZpOiBJVkhEIERldmljZSBFbnRyeTogdHlwZSAweDQ4
IGlkIDAgZmxhZ3MgMHhkNwooWEVOKSBBTUQtVmk6IElWSEQgU3BlY2lhbDogMDAwMDowMDoxNC4w
IHZhcmlldHkgMHgyIGhhbmRsZSAwCihYRU4pIEFNRC1WaTogSVZIRCBEZXZpY2UgRW50cnk6IHR5
cGUgMHg0OCBpZCAwIGZsYWdzIDAKKFhFTikgQU1ELVZpOiBJVkhEIFNwZWNpYWw6IDAwMDA6MDA6
MDAuMSB2YXJpZXR5IDB4MSBoYW5kbGUgMHg4CihYRU4pIE5vIHNvdXRoYnJpZGdlIElPLUFQSUMg
Zm91bmQgaW4gSVZSUyB0YWJsZQooWEVOKSBBTUQtVmk6IEVycm9yIGluaXRpYWxpemF0aW9uCihY
RU4pIEkvTyB2aXJ0dWFsaXNhdGlvbiBkaXNhYmxlZAooWEVOKSBucl9zb2NrZXRzOiAyCihYRU4p
IEVOQUJMSU5HIElPLUFQSUMgSVJRcwooWEVOKSAgLT4gVXNpbmcgbmV3IEFDSyBtZXRob2QKKFhF
TikgLi5USU1FUjogdmVjdG9yPTB4RjAgYXBpYzE9MCBwaW4xPTIgYXBpYzI9LTEgcGluMj0tMQoo
WEVOKSBBbGxvY2F0ZWQgY29uc29sZSByaW5nIG9mIDMyIEtpQi4KKFhFTikgbXdhaXQtaWRsZTog
ZG9lcyBub3QgcnVuIG9uIGZhbWlseSAxNiBtb2RlbCA0CihYRU4pIEhWTTogQVNJRHMgZW5hYmxl
ZC4KKFhFTikgU1ZNOiBTdXBwb3J0ZWQgYWR2YW5jZWQgZmVhdHVyZXM6CihYRU4pICAtIE5lc3Rl
ZCBQYWdlIFRhYmxlcyAoTlBUKQooWEVOKSAgLSBMYXN0IEJyYW5jaCBSZWNvcmQgKExCUikgVmly
dHVhbGlzYXRpb24KKFhFTikgIC0gTmV4dC1SSVAgU2F2ZWQgb24gI1ZNRVhJVAooWEVOKSBIVk06
IFNWTSBlbmFibGVkCihYRU4pIEhWTTogSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChIQVApIGRl
dGVjdGVkCihYRU4pIEhWTTogSEFQIHBhZ2Ugc2l6ZXM6IDRrQiwgMk1CLCAxR0IKKFhFTikgYWx0
IHRhYmxlIGZmZmY4MmQwNDA0NTEyOTAgLT4gZmZmZjgyZDA0MDQ1YzMzNAooWEVOKSBDUFUxOiBO
byBpcnEgaGFuZGxlciBmb3IgdmVjdG9yIDI3IChJUlEgLTIxNDc0ODM2NDgpCihYRU4pIENQVTI6
IE5vIGlycSBoYW5kbGVyIGZvciB2ZWN0b3IgMjcgKElSUSAtMjE0NzQ4MzY0OCkKKFhFTikgQnJv
dWdodCB1cCA0IENQVXMKKFhFTikgQ1BVMzogTm8gaXJxIGhhbmRsZXIgZm9yIHZlY3RvciAyNyAo
SVJRIC0yMTQ3NDgzNjQ4KQooWEVOKSBTY2hlZHVsaW5nIGdyYW51bGFyaXR5OiBjcHUsIDEgQ1BV
IHBlciBzY2hlZC1yZXNvdXJjZQooWEVOKSBBZGRpbmcgY3B1IDAgdG8gcnVucXVldWUgMAooWEVO
KSAgRmlyc3QgY3B1IG9uIHJ1bnF1ZXVlLCBhY3RpdmF0aW5nCihYRU4pIEFkZGluZyBjcHUgMSB0
byBydW5xdWV1ZSAwCihYRU4pIEFkZGluZyBjcHUgMiB0byBydW5xdWV1ZSAwCihYRU4pIEFkZGlu
ZyBjcHUgMyB0byBydW5xdWV1ZSAwCihYRU4pIE1DQTogVXNlIGh3IHRocmVzaG9sZGluZyB0byBh
ZGp1c3QgcG9sbGluZyBmcmVxdWVuY3kKKFhFTikgbWNoZWNrX3BvbGw6IE1hY2hpbmUgY2hlY2sg
cG9sbGluZyB0aW1lciBzdGFydGVkLgooWEVOKSBYZW5vcHJvZmlsZTogQU1EIElCUyBkZXRlY3Rl
ZCAoMHgxZikKKFhFTikgSFBFVDogMCB0aW1lcnMgdXNhYmxlIGZvciBicm9hZGNhc3QgKDMgdG90
YWwpCihYRU4pIE5YIChFeGVjdXRlIERpc2FibGUpIHByb3RlY3Rpb24gYWN0aXZlCihYRU4pIERv
bTAgaGFzIG1heGltdW0gNjQ4IFBJUlFzCihYRU4pICoqKiBCdWlsZGluZyBhIFBWIERvbTAgKioq
CihYRU4pICBYZW4gIGtlcm5lbDogNjQtYml0LCBsc2IsIGNvbXBhdDMyCihYRU4pICBEb20wIGtl
cm5lbDogNjQtYml0LCBQQUUsIGxzYiwgcGFkZHIgMHgxMDAwMDAwIC0+IDB4M2EwMDAwMAooWEVO
KSBQSFlTSUNBTCBNRU1PUlkgQVJSQU5HRU1FTlQ6CihYRU4pICBEb20wIGFsbG9jLjogICAwMDAw
MDAwNDE4MDAwMDAwLT4wMDAwMDAwNDFjMDAwMDAwICgxNzI2OTkgcGFnZXMgdG8gYmUgYWxsb2Nh
dGVkKQooWEVOKSAgSW5pdC4gcmFtZGlzazogMDAwMDAwMDQyZTI5YjAwMC0+MDAwMDAwMDQyZmZm
ZjZhNAooWEVOKSBWSVJUVUFMIE1FTU9SWSBBUlJBTkdFTUVOVDoKKFhFTikgIExvYWRlZCBrZXJu
ZWw6IGZmZmZmZmZmODEwMDAwMDAtPmZmZmZmZmZmODNhMDAwMDAKKFhFTikgIEluaXQuIHJhbWRp
c2s6IDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIFBoeXMtTWFjaCBt
YXA6IDAwMDAwMDgwMDAwMDAwMDAtPjAwMDAwMDgwMDAxODAwMDAKKFhFTikgIFN0YXJ0IGluZm86
ICAgIGZmZmZmZmZmODNhMDAwMDAtPmZmZmZmZmZmODNhMDA0YjgKKFhFTikgIFhlbnN0b3JlIHJp
bmc6IDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIENvbnNvbGUgcmlu
ZzogIDAwMDAwMDAwMDAwMDAwMDAtPjAwMDAwMDAwMDAwMDAwMDAKKFhFTikgIFBhZ2UgdGFibGVz
OiAgIGZmZmZmZmZmODNhMDEwMDAtPmZmZmZmZmZmODNhMjIwMDAKKFhFTikgIEJvb3Qgc3RhY2s6
ICAgIGZmZmZmZmZmODNhMjIwMDAtPmZmZmZmZmZmODNhMjMwMDAKKFhFTikgIFRPVEFMOiAgICAg
ICAgIGZmZmZmZmZmODAwMDAwMDAtPmZmZmZmZmZmODNjMDAwMDAKKFhFTikgIEVOVFJZIEFERFJF
U1M6IGZmZmZmZmZmODJjM2QxYzAKKFhFTikgRG9tMCBoYXMgbWF4aW11bSA0IFZDUFVzCihYRU4p
IEluaXRpYWwgbG93IG1lbW9yeSB2aXJxIHRocmVzaG9sZCBzZXQgYXQgMHg0MDAwIHBhZ2VzLgoo
WEVOKSBTY3J1YmJpbmcgRnJlZSBSQU0gaW4gYmFja2dyb3VuZAooWEVOKSBTdGQuIExvZ2xldmVs
OiBBbGwKKFhFTikgR3Vlc3QgTG9nbGV2ZWw6IEFsbAooWEVOKSBYZW4gaXMgcmVsaW5xdWlzaGlu
ZyBWR0EgY29uc29sZS4KKFhFTikgKioqIFNlcmlhbCBpbnB1dCB0byBET00wICh0eXBlICdDVFJM
LWEnIHRocmVlIHRpbWVzIHRvIHN3aXRjaCBpbnB1dCkKKFhFTikgRnJlZWQgNjEya0IgaW5pdCBt
ZW1vcnkKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDowMC4wCihYRU4pIFBDSSBhZGQgZGV2
aWNlIDAwMDA6MDA6MDAuMgooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjAyLjAKKFhFTikg
UENJIGFkZCBkZXZpY2UgMDAwMDowMDowNS4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6
MDYuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjA3LjAKKFhFTikgUENJIGFkZCBkZXZp
Y2UgMDAwMDowMDowZC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTEuMAooWEVOKSBQ
Q0kgYWRkIGRldmljZSAwMDAwOjAwOjEyLjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDox
Mi4yCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTMuMAooWEVOKSBQQ0kgYWRkIGRldmlj
ZSAwMDAwOjAwOjEzLjIKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxNC4wCihYRU4pIFBD
SSBhZGQgZGV2aWNlIDAwMDA6MDA6MTQuMwooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjE0
LjQKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMDoxNC41CihYRU4pIFBDSSBhZGQgZGV2aWNl
IDAwMDA6MDA6MTYuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjE2LjIKKFhFTikgUENJ
IGFkZCBkZXZpY2UgMDAwMDowMDoxOC4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTgu
MQooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjAwOjE4LjIKKFhFTikgUENJIGFkZCBkZXZpY2Ug
MDAwMDowMDoxOC4zCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDA6MTguNAooWEVOKSBQQ0kg
YWRkIGRldmljZSAwMDAwOjAxOjAwLjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowMTowMC4x
CihYRU4pIFBDSSBhZGQgZGV2aWNlIDAwMDA6MDQ6MDAuMAooWEVOKSBQQ0kgYWRkIGRldmljZSAw
MDAwOjA1OjAwLjAKKFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowNTowMC4xCihYRU4pIFBDSSBh
ZGQgZGV2aWNlIDAwMDA6MDU6MDAuMgooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjA1OjAwLjMK
KFhFTikgUENJIGFkZCBkZXZpY2UgMDAwMDowNjowNi4wCihYRU4pIFBDSSBhZGQgZGV2aWNlIDAw
MDA6MDY6MDYuMQooWEVOKSBQQ0kgYWRkIGRldmljZSAwMDAwOjA2OjA2LjIK
--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=ivrs.dat
Content-Transfer-Encoding: base64

SVZSU8AAAAABrEFNRCAgAFJEODkwUwAAMSAgAEFNRCAAAAAAADQgAAAAAAAAAAAAED6QAAIAQAAA
AMP+AAAAAAAAABMAAAAAAwAAAAQCAAACEAAAAwABAAQBAQACKAAAAjAAAAI4AAACAAQAAmgAAAMA
BQAEAwUAAogAAAOQAAAEkgAAA5gAAASaAAACoADXAqMAAAKkAABDAAYAAKQAAAT/BgACpQAAA7AA
AASyAABIAADXAKAAAkgAAAAIAQAB
--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=ivrs.dsl
Content-Transfer-Encoding: quoted-printable

/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 *
 * Disassembly of ivrs.dat, Wed Mar  8 21:11:48 2023
 *
 * ACPI Data Table [IVRS]
 *
 * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
 */

[000h 0000   4]                    Signature : "IVRS"    [I/O Virtualizati=
on Reporting Structure]
[004h 0004   4]                 Table Length : 000000C0
[008h 0008   1]                     Revision : 01
[009h 0009   1]                     Checksum : AC
[00Ah 0010   6]                       Oem ID : "AMD  "
[010h 0016   8]                 Oem Table ID : "RD890S"
[018h 0024   4]                 Oem Revision : 00202031
[01Ch 0028   4]              Asl Compiler ID : "AMD "
[020h 0032   4]        Asl Compiler Revision : 00000000

[024h 0036   4]          Virtualization Info : 00203400
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                Subtable Type : 10 [Hardware Definition Blo=
ck]
[031h 0049   1]                        Flags : 3E
[032h 0050   2]                       Length : 0090
[034h 0052   2]                     DeviceId : 0002

[036h 0054   2]            Capability Offset : 0040
[038h 0056   8]                 Base Address : 00000000FEC30000
[040h 0064   2]            PCI Segment Group : 0000
[042h 0066   2]          Virtualization Info : 1300
[044h 0068   4]            Feature Reporting : 00000000

[048h 0072   1]                   Entry Type : 03
[049h 0073   2]                    Device ID : 0000
[04Bh 0075   1]                 Data Setting : 00

[04Ch 0076   1]                   Entry Type : 04
[04Dh 0077   2]                    Device ID : 0002
[04Fh 0079   1]                 Data Setting : 00

[050h 0080   1]                   Entry Type : 02
[051h 0081   2]                    Device ID : 0010
[053h 0083   1]                 Data Setting : 00

[054h 0084   1]                   Entry Type : 03
[055h 0085   2]                    Device ID : 0100
[057h 0087   1]                 Data Setting : 00

[058h 0088   1]                   Entry Type : 04
[059h 0089   2]                    Device ID : 0101
[05Bh 0091   1]                 Data Setting : 00

[05Ch 0092   1]                   Entry Type : 02
[05Dh 0093   2]                    Device ID : 0028
[05Fh 0095   1]                 Data Setting : 00

[060h 0096   1]                   Entry Type : 02
[061h 0097   2]                    Device ID : 0030
[063h 0099   1]                 Data Setting : 00

[064h 0100   1]                   Entry Type : 02
[065h 0101   2]                    Device ID : 0038
[067h 0103   1]                 Data Setting : 00

[068h 0104   1]                   Entry Type : 02
[069h 0105   2]                    Device ID : 0400
[06Bh 0107   1]                 Data Setting : 00

[06Ch 0108   1]                   Entry Type : 02
[06Dh 0109   2]                    Device ID : 0068
[06Fh 0111   1]                 Data Setting : 00

[070h 0112   1]                   Entry Type : 03
[071h 0113   2]                    Device ID : 0500
[073h 0115   1]                 Data Setting : 00

[074h 0116   1]                   Entry Type : 04
[075h 0117   2]                    Device ID : 0503
[077h 0119   1]                 Data Setting : 00

[078h 0120   1]                   Entry Type : 02
[079h 0121   2]                    Device ID : 0088
[07Bh 0123   1]                 Data Setting : 00

[07Ch 0124   1]                   Entry Type : 03
[07Dh 0125   2]                    Device ID : 0090
[07Fh 0127   1]                 Data Setting : 00

[080h 0128   1]                   Entry Type : 04
[081h 0129   2]                    Device ID : 0092
[083h 0131   1]                 Data Setting : 00

[084h 0132   1]                   Entry Type : 03
[085h 0133   2]                    Device ID : 0098
[087h 0135   1]                 Data Setting : 00

[088h 0136   1]                   Entry Type : 04
[089h 0137   2]                    Device ID : 009A
[08Bh 0139   1]                 Data Setting : 00

[08Ch 0140   1]                   Entry Type : 02
[08Dh 0141   2]                    Device ID : 00A0
[08Fh 0143   1]                 Data Setting : D7

[090h 0144   1]                   Entry Type : 02
[091h 0145   2]                    Device ID : 00A3
[093h 0147   1]                 Data Setting : 00

[094h 0148   1]                   Entry Type : 02
[095h 0149   2]                    Device ID : 00A4
[097h 0151   1]                 Data Setting : 00

[098h 0152   1]                   Entry Type : 43
[099h 0153   2]                    Device ID : 0600
[09Bh 0155   1]                 Data Setting : 00
[09Ch 0156   1]                     Reserved : 00
[09Dh 0157   2]        Source Used Device ID : 00A4
[09Fh 0159   1]                     Reserved : 00

[0A0h 0160   1]                   Entry Type : 04
[0A1h 0161   2]                    Device ID : 06FF
[0A3h 0163   1]                 Data Setting : 00

[0A4h 0164   1]                   Entry Type : 02
[0A5h 0165   2]                    Device ID : 00A5
[0A7h 0167   1]                 Data Setting : 00

[0A8h 0168   1]                   Entry Type : 03
[0A9h 0169   2]                    Device ID : 00B0
[0ABh 0171   1]                 Data Setting : 00

[0ACh 0172   1]                   Entry Type : 04
[0ADh 0173   2]                    Device ID : 00B2
[0AFh 0175   1]                 Data Setting : 00

[0B0h 0176   1]                   Entry Type : 48
[0B1h 0177   2]                    Device ID : 0000
[0B3h 0179   1]                 Data Setting : D7
[0B4h 0180   1]                       Handle : 00
[0B5h 0181   2]        Source Used Device ID : 00A0
[0B7h 0183   1]                      Variety : 02

[0B8h 0184   1]                   Entry Type : 48
[0B9h 0185   2]                    Device ID : 0000
[0BBh 0187   1]                 Data Setting : 00
[0BCh 0188   1]                       Handle : 08
[0BDh 0189   2]        Source Used Device ID : 0001
[0BFh 0191   1]                      Variety : 01

Raw Table Data: Length 192 (0xC0)

    0000: 49 56 52 53 C0 00 00 00 01 AC 41 4D 44 20 20 00  // IVRS......AM=
D  .
    0010: 52 44 38 39 30 53 00 00 31 20 20 00 41 4D 44 20  // RD890S..1  .=
AMD
    0020: 00 00 00 00 00 34 20 00 00 00 00 00 00 00 00 00  // .....4 .....=
....
    0030: 10 3E 90 00 02 00 40 00 00 00 C3 FE 00 00 00 00  // .>....@.....=
....
    0040: 00 00 00 13 00 00 00 00 03 00 00 00 04 02 00 00  // ............=
....
    0050: 02 10 00 00 03 00 01 00 04 01 01 00 02 28 00 00  // ............=
.(..
    0060: 02 30 00 00 02 38 00 00 02 00 04 00 02 68 00 00  // .0...8......=
.h..
    0070: 03 00 05 00 04 03 05 00 02 88 00 00 03 90 00 00  // ............=
....
    0080: 04 92 00 00 03 98 00 00 04 9A 00 00 02 A0 00 D7  // ............=
....
    0090: 02 A3 00 00 02 A4 00 00 43 00 06 00 00 A4 00 00  // ........C...=
....
    00A0: 04 FF 06 00 02 A5 00 00 03 B0 00 00 04 B2 00 00  // ............=
....
    00B0: 48 00 00 D7 00 A0 00 02 48 00 00 00 08 01 00 01  // H.......H...=
....

--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=lspci_vvv.log

00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890 Northbridge only single slot PCI-e GFX Hydra part (rev 02)
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890 Northbridge only single slot PCI-e GFX Hydra part
	Control: I/O- Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ >SERR- <PERR- INTx-
	NUMA node: 0
	Region 3: Memory at <ignored> (64-bit, non-prefetchable)
	Capabilities: [f0] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [c4] HyperTransport: Slave or Primary Interface
		Command: BaseUnitID=0 UnitCnt=20 MastHost- DefDir- DUL-
		Link Control 0: CFlE- CST- CFE- <LkFail- Init+ EOC- TXO- <CRCErr=0 IsocEn- LSEn- ExtCTL- 64b-
		Link Config 0: MLWI=16bit DwFcIn- MLWO=16bit DwFcOut- LWI=16bit DwFcInEn- LWO=16bit DwFcOutEn-
		Link Control 1: CFlE- CST- CFE- <LkFail+ Init- EOC+ TXO+ <CRCErr=0 IsocEn- LSEn- ExtCTL- 64b-
		Link Config 1: MLWI=8bit DwFcIn- MLWO=8bit DwFcOut- LWI=8bit DwFcInEn- LWO=8bit DwFcOutEn-
		Revision ID: 3.00
		Link Frequency 0: [b]
		Link Error 0: <Prot- <Ovfl- <EOC- CTLTm-
		Link Frequency Capability 0: 200MHz+ 300MHz- 400MHz+ 500MHz- 600MHz+ 800MHz+ 1.0GHz+ 1.2GHz+ 1.4GHz- 1.6GHz- Vend-
		Feature Capability: IsocFC+ LDTSTOP+ CRCTM- ECTLT- 64bA+ UIDRD-
		Link Frequency 1: 200MHz
		Link Error 1: <Prot- <Ovfl- <EOC- CTLTm-
		Link Frequency Capability 1: 200MHz- 300MHz- 400MHz- 500MHz- 600MHz- 800MHz- 1.0GHz- 1.2GHz- 1.4GHz- 1.6GHz- Vend-
		Error Handling: PFlE- OFlE- PFE- OFE- EOCFE- RFE- CRCFE- SERRFE- CF- RE- PNFE- ONFE- EOCNFE- RNFE- CRCNFE- SERRNFE-
		Prefetchable memory behind bridge Upper: 00-00
		Bus Number: 00
	Capabilities: [40] HyperTransport: Retry Mode
	Capabilities: [54] HyperTransport: UnitID Clumping
	Capabilities: [9c] HyperTransport: #1a
	Capabilities: [70] MSI: Enable- Count=1/4 Maskable- 64bit-
		Address: 00000000  Data: 0000

00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memory Management Unit (IOMMU)
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890S/RD990 I/O Memory Management Unit (IOMMU)
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 0
	NUMA node: 0
	Capabilities: [40] Secure device <?>
	Capabilities: [54] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [64] HyperTransport: MSI Mapping Enable+ Fixed+

00:02.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GFX port 0) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 50
	NUMA node: 0
	Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
	I/O behind bridge: 0000e000-0000efff [size=4K]
	Memory behind bridge: fdd00000-fddfffff [size=1M]
	Prefetchable memory behind bridge: 00000000d0000000-00000000dfffffff [size=256M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA+ VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x16 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #2, PowerLimit 75.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee0f00c  Data: 41b8
	Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GFX port 0)
	Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [190 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:05.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 1) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 51
	NUMA node: 0
	Bus: primary=00, secondary=02, subordinate=02, sec-latency=0
	I/O behind bridge: 0000d000-0000dfff [size=4K]
	Memory behind bridge: fdc00000-fdcfffff [size=1M]
	Prefetchable memory behind bridge: 00000000fdb00000-00000000fdbfffff [size=1M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #247, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed unknown (downgraded), Width x16 (strange)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #5, PowerLimit 75.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee0f00c  Data: 41c0
	Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 1)
	Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [190 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:06.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 2) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 52
	NUMA node: 0
	Bus: primary=00, secondary=03, subordinate=03, sec-latency=0
	I/O behind bridge: 0000c000-0000cfff [size=4K]
	Memory behind bridge: fda00000-fdafffff [size=1M]
	Prefetchable memory behind bridge: 00000000fd900000-00000000fd9fffff [size=1M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #247, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk-
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed unknown (downgraded), Width x16 (strange)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #6, PowerLimit 75.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet- Interlock-
			Changed: MRL- PresDet- LinkState-
		RootCap: CRSVisible+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee0f00c  Data: 41c8
	Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 2)
	Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [190 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:07.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 3) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 53
	NUMA node: 0
	Bus: primary=00, secondary=04, subordinate=04, sec-latency=0
	I/O behind bridge: 0000b000-0000bfff [size=4K]
	Memory behind bridge: fd600000-fd6fffff [size=1M]
	Prefetchable memory behind bridge: 00000000fd500000-00000000fd5fffff [size=1M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #3, Speed 5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (downgraded), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt-
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #7, PowerLimit 75.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee0f00c  Data: 41d8
	Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP Port 3)
	Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [190 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:0d.0 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP2 Port 0) (prog-if 00 [Normal decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 54
	NUMA node: 0
	Bus: primary=00, secondary=05, subordinate=05, sec-latency=0
	I/O behind bridge: 0000a000-0000afff [size=4K]
	Memory behind bridge: fd200000-fd4fffff [size=3M]
	Prefetchable memory behind bridge: 00000000fde00000-00000000fdefffff [size=1M]
	Secondary status: 66MHz- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Root Port (Slot+), MSI 00
		DevCap:	MaxPayload 128 bytes, PhantFunc 0
			ExtTag+ RBE+
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 128 bytes
		DevSta:	CorrErr- NonFatalErr- FatalErr- UnsupReq- AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep+ BwNot+ ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive+ BWMgmt+ ABWMgmt+
		SltCap:	AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug- Surprise-
			Slot #13, PowerLimit 75.000W; Interlock- NoCompl+
		SltCtl:	Enable: AttnBtn- PwrFlt- MRL- PresDet- CmdCplt- HPIrq- LinkChg-
			Control: AttnInd Unknown, PwrInd Unknown, Power- Interlock-
		SltSta:	Status: AttnBtn- PowerFlt- MRL- CmdCplt- PresDet+ Interlock-
			Changed: MRL- PresDet+ LinkState+
		RootCap: CRSVisible+
		RootCtl: ErrCorrectable- ErrNon-Fatal- ErrFatal- PMEIntEna- CRSVisible+
		RootSta: PME ReqID 0000, PMEStatus- PMEPending-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- LN System CLS Not Supported, TPHComp- ExtTPHComp- ARIFwd+
			 AtomicOpsCap: Routing- 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 65ms to 210ms, TimeoutDis- LTR- OBFF Disabled, ARIFwd-
			 AtomicOpsCtl: ReqEn- EgressBlck-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit-
		Address: fee0f00c  Data: 41e0
	Capabilities: [b0] Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] RD890/RD9x0/RX980 PCI to PCI bridge (PCI Express GPP2 Port 0)
	Capabilities: [b8] HyperTransport: MSI Mapping Enable+ Fixed+
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [190 v1] Access Control Services
		ACSCap:	SrcValid+ TransBlk+ ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans+
		ACSCtl:	SrcValid+ TransBlk- ReqRedir+ CmpltRedir+ UpstreamFwd+ EgressCtrl- DirectTrans-
	Kernel driver in use: pcieport

00:11.0 SATA controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 SATA Controller [AHCI mode] (rev 40) (prog-if 01 [AHCI 1.0])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 67
	NUMA node: 0
	Region 0: I/O ports at ff00 [size=8]
	Region 1: I/O ports at fe00 [size=4]
	Region 2: I/O ports at fd00 [size=8]
	Region 3: I/O ports at fc00 [size=4]
	Region 4: I/O ports at fb00 [size=16]
	Region 5: Memory at fdfff000 (32-bit, non-prefetchable) [size=1K]
	Capabilities: [50] MSI: Enable+ Count=1/8 Maskable- 64bit+
		Address: 00000000fee0100c  Data: 4191
	Capabilities: [70] SATA HBA v1.0 InCfgSpace
	Capabilities: [a4] PCI Advanced Features
		AFCap: TP+ FLR+
		AFCtrl: FLR-
		AFStatus: TP-
	Kernel driver in use: ahci
	Kernel modules: ahci

00:12.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at fdffe000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: ohci-pci
	Kernel modules: ohci_pci

00:12.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	NUMA node: 0
	Region 0: Memory at fdffd000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+
	Capabilities: [e4] Debug port: BAR=1 offset=00e0
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:13.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at fdffc000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: ohci-pci
	Kernel modules: ohci_pci

00:13.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	NUMA node: 0
	Region 0: Memory at fdffb000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+
	Capabilities: [e4] Debug port: BAR=1 offset=00e0
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 SMBus Controller (rev 41)
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0
	Kernel modules: i2c_piix4, sp5100_tco

00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 LPC host controller (rev 40)
	Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 LPC host controller
	Control: I/O+ Mem+ BusMaster+ SpecCycle+ MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	NUMA node: 0

00:14.4 PCI bridge: Advanced Micro Devices, Inc. [AMD/ATI] SBx00 PCI to PCI Bridge (rev 40) (prog-if 01 [Subtractive decode])
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop+ ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 64
	NUMA node: 0
	Bus: primary=00, secondary=06, subordinate=06, sec-latency=64
	I/O behind bridge: 00009000-00009fff [size=4K]
	Memory behind bridge: fd800000-fd8fffff [size=1M]
	Prefetchable memory behind bridge: fd700000-fd7fffff [size=1M]
	Secondary status: 66MHz- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort+ <SERR- <PERR-
	BridgeCtl: Parity- SERR+ NoISA- VGA- VGA16- MAbort- >Reset- FastB2B-
		PriDiscTmr- SecDiscTmr- DiscTmrStat- DiscTmrSERREn-

00:14.5 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI2 Controller (prog-if 10 [OHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at fdffa000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: ohci-pci
	Kernel modules: ohci_pci

00:16.0 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB OHCI0 Controller (prog-if 10 [OHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at fdff9000 (32-bit, non-prefetchable) [size=4K]
	Kernel driver in use: ohci-pci
	Kernel modules: ohci_pci

00:16.2 USB controller: Advanced Micro Devices, Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller (prog-if 20 [EHCI])
	Subsystem: Gigabyte Technology Co., Ltd GA-880GMA-USB3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV+ VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz+ UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 17
	NUMA node: 0
	Region 0: Memory at fdff8000 (32-bit, non-prefetchable) [size=256]
	Capabilities: [c0] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
		Bridge: PM- B3+
	Capabilities: [e4] Debug port: BAR=1 offset=00e0
	Kernel driver in use: ehci-pci
	Kernel modules: ehci_pci

00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor HyperTransport Configuration
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0
	Capabilities: [80] HyperTransport: Host or Secondary Interface
		Command: WarmRst+ DblEnd- DevNum=0 ChainSide- HostHide+ Slave- <EOCErr- DUL-
		Link Control: CFlE- CST- CFE- <LkFail- Init+ EOC- TXO- <CRCErr=0 IsocEn- LSEn+ ExtCTL- 64b-
		Link Config: MLWI=16bit DwFcIn- MLWO=16bit DwFcOut- LWI=16bit DwFcInEn- LWO=16bit DwFcOutEn-
		Revision ID: 3.00
		Link Frequency: [b]
		Link Error: <Prot- <Ovfl- <EOC- CTLTm-
		Link Frequency Capability: 200MHz+ 300MHz- 400MHz+ 500MHz- 600MHz+ 800MHz+ 1.0GHz+ 1.2GHz+ 1.4GHz- 1.6GHz- Vend-
		Feature Capability: IsocFC+ LDTSTOP+ CRCTM- ECTLT- 64bA+ UIDRD- ExtRS- UCnfE-

00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Address Map
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0

00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor DRAM Controller
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0

00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Miscellaneous Control
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0
	Capabilities: [f0] Secure device <?>
	Kernel driver in use: k10temp
	Kernel modules: k10temp

00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Family 10h Processor Link Control
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	NUMA node: 0

01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Cedar [Radeon HD 5000/6000/7350/8350 Series] (prog-if 00 [VGA controller])
	Subsystem: Gigabyte Technology Co., Ltd Cedar [Radeon HD 5000/6000/7350/8350 Series]
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 5
	NUMA node: 0
	Region 0: Memory at d0000000 (64-bit, prefetchable) [size=256M]
	Region 2: Memory at fddc0000 (64-bit, non-prefetchable) [size=128K]
	Region 4: I/O ports at ee00 [size=256]
	Expansion ROM at 000c0000 [virtual] [disabled] [size=128K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x16 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Kernel modules: radeon

01:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Cedar HDMI Audio [Radeon HD 5400/6300/7300 Series]
	Subsystem: Gigabyte Technology Co., Ltd Cedar HDMI Audio [Radeon HD 5400/6300/7300 Series]
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 95
	NUMA node: 0
	Region 0: Memory at fddfc000 (64-bit, non-prefetchable) [size=16K]
	Capabilities: [50] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [58] Express (v2) Legacy Endpoint, MSI 00
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <4us, L1 unlimited
			ExtTag+ AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag+ PhantFunc- AuxPwr- NoSnoop+
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr- TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit Latency L0s <64ns, L1 <1us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x16 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [a0] MSI: Enable+ Count=1/1 Maskable- 64bit+
		Address: 00000000fee0100c  Data: 41e2
	Capabilities: [100 v1] Vendor Specific Information: ID=0001 Rev=1 Len=010 <?>
	Capabilities: [150 v1] Advanced Error Reporting
pcilib: sysfs_read_vpd: read failed: Input/output error
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Kernel driver in use: snd_hda_intel
	Kernel modules: snd_hda_intel

04:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller (rev 03)
	Subsystem: Gigabyte Technology Co., Ltd Onboard Ethernet
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 19
	NUMA node: 0
	Region 0: I/O ports at be00 [size=256]
	Region 2: Memory at fd5ff000 (64-bit, prefetchable) [size=4K]
	Region 4: Memory at fd5f8000 (64-bit, prefetchable) [size=16K]
	Expansion ROM at fd600000 [virtual] [disabled] [size=128K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=375mA PME(D0+,D1+,D2+,D3hot+,D3cold+)
		Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable- 64bit+
		Address: 0000000000000000  Data: 0000
	Capabilities: [70] Express (v2) Endpoint, MSI 01
		DevCap:	MaxPayload 256 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset- SlotPowerLimit 75.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop-
			MaxPayload 128 bytes, MaxReadReq 4096 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 2.5GT/s, Width x1, ASPM L0s L1, Exit Latency L0s <512ns, L1 <64us
			ClockPM+ Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 2.5GT/s (ok), Width x1 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Not Supported, TimeoutDis+ NROPrPrP- LTR-
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp- ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 2.5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [ac] MSI-X: Enable+ Count=4 Masked-
		Vector table: BAR=4 offset=00000000
		PBA: BAR=4 offset=00000800
	Capabilities: [cc] Vital Product Data
		Not readable
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Virtual Channel
		Caps:	LPEVC=0 RefClk=100ns PATEntryBits=1
		Arb:	Fixed- WRR32- WRR64- WRR128-
		Ctrl:	ArbSelect=Fixed
		Status:	InProgress-
		VC0:	Caps:	PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
			Arb:	Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
			Ctrl:	Enable+ ID=0 ArbSelect=Fixed TC/VC=ff
			Status:	NegoPending- InProgress-
	Capabilities: [160 v1] Device Serial Number 03-00-00-00-68-4c-e0-00
	Kernel driver in use: r8169
	Kernel modules: r8169

05:00.0 Ethernet controller: Intel Corporation 82580 Gigabit Network Connection (rev 01)
	Subsystem: Intel Corporation Ethernet Server Adapter I340-T4
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin A routed to IRQ 17
	NUMA node: 0
	Region 0: Memory at fd280000 (32-bit, non-prefetchable) [size=512K]
	Region 3: Memory at fd4fc000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
		Address: 0000000000000000  Data: 0000
		Masking: 00000000  Pending: 00000000
	Capabilities: [70] MSI-X: Enable+ Count=10 Masked-
		Vector table: BAR=3 offset=00000000
		PBA: BAR=3 offset=00002000
	Capabilities: [a0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkCtl2: Target Link Speed: 5GT/s, EnterCompliance- SpeedDis-
			 Transmit Margin: Normal Operating Range, EnterModifiedCompliance- ComplianceSOS-
			 Compliance De-emphasis: -6dB
		LnkSta2: Current De-emphasis Level: -3.5dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number 00-1b-21-ff-ff-9b-44-44
	Capabilities: [1a0 v1] Transaction Processing Hints
		Device specific mode supported
		Steering table in TPH capability structure
	Capabilities: [1c0 v1] Latency Tolerance Reporting
		Max snoop latency: 0ns
		Max no snoop latency: 0ns
	Kernel driver in use: igb
	Kernel modules: igb

05:00.1 Ethernet controller: Intel Corporation 82580 Gigabit Network Connection (rev 01)
	Subsystem: Intel Corporation Ethernet Server Adapter I340-T4
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 18
	NUMA node: 0
	Region 0: Memory at fd380000 (32-bit, non-prefetchable) [size=512K]
	Region 3: Memory at fd4f8000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
		Address: 0000000000000000  Data: 0000
		Masking: 00000000  Pending: 00000000
	Capabilities: [70] MSI-X: Enable+ Count=10 Masked-
		Vector table: BAR=3 offset=00000000
		PBA: BAR=3 offset=00002000
	Capabilities: [a0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number 00-1b-21-ff-ff-9b-44-44
	Capabilities: [1a0 v1] Transaction Processing Hints
		Device specific mode supported
		Steering table in TPH capability structure
	Kernel driver in use: igb
	Kernel modules: igb

05:00.2 Ethernet controller: Intel Corporation 82580 Gigabit Network Connection (rev 01)
	Subsystem: Intel Corporation Ethernet Server Adapter I340-T4
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin C routed to IRQ 19
	NUMA node: 0
	Region 0: Memory at fd400000 (32-bit, non-prefetchable) [size=512K]
	Region 3: Memory at fd4f4000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
		Address: 0000000000000000  Data: 0000
		Masking: 00000000  Pending: 00000000
	Capabilities: [70] MSI-X: Enable+ Count=10 Masked-
		Vector table: BAR=3 offset=00000000
		PBA: BAR=3 offset=00002000
	Capabilities: [a0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number 00-1b-21-ff-ff-9b-44-44
	Capabilities: [1a0 v1] Transaction Processing Hints
		Device specific mode supported
		Steering table in TPH capability structure
	Kernel driver in use: igb
	Kernel modules: igb

05:00.3 Ethernet controller: Intel Corporation 82580 Gigabit Network Connection (rev 01)
	Subsystem: Intel Corporation Ethernet Server Adapter I340-T4
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 64 bytes
	Interrupt: pin D routed to IRQ 16
	NUMA node: 0
	Region 0: Memory at fd300000 (32-bit, non-prefetchable) [size=512K]
	Region 3: Memory at fd4f0000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [40] Power Management version 3
		Flags: PMEClk- DSI+ D1- D2- AuxCurrent=0mA PME(D0+,D1-,D2-,D3hot+,D3cold+)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=1 PME-
	Capabilities: [50] MSI: Enable- Count=1/1 Maskable+ 64bit+
		Address: 0000000000000000  Data: 0000
		Masking: 00000000  Pending: 00000000
	Capabilities: [70] MSI-X: Enable+ Count=10 Masked-
		Vector table: BAR=3 offset=00000000
		PBA: BAR=3 offset=00002000
	Capabilities: [a0] Express (v2) Endpoint, MSI 00
		DevCap:	MaxPayload 512 bytes, PhantFunc 0, Latency L0s <512ns, L1 <64us
			ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset+ SlotPowerLimit 0.000W
		DevCtl:	CorrErr- NonFatalErr- FatalErr- UnsupReq-
			RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+ FLReset-
			MaxPayload 128 bytes, MaxReadReq 512 bytes
		DevSta:	CorrErr+ NonFatalErr- FatalErr- UnsupReq+ AuxPwr+ TransPend-
		LnkCap:	Port #0, Speed 5GT/s, Width x4, ASPM L0s L1, Exit Latency L0s <1us, L1 <8us
			ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp-
		LnkCtl:	ASPM Disabled; RCB 64 bytes, Disabled- CommClk+
			ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
		LnkSta:	Speed 5GT/s (ok), Width x4 (ok)
			TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
		DevCap2: Completion Timeout: Range ABCD, TimeoutDis+ NROPrPrP- LTR+
			 10BitTagComp- 10BitTagReq- OBFF Not Supported, ExtFmt- EETLPPrefix-
			 EmergencyPowerReduction Not Supported, EmergencyPowerReductionInit-
			 FRS- TPHComp+ ExtTPHComp-
			 AtomicOpsCap: 32bit- 64bit- 128bitCAS-
		DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis- LTR- OBFF Disabled,
			 AtomicOpsCtl: ReqEn-
		LnkSta2: Current De-emphasis Level: -6dB, EqualizationComplete- EqualizationPhase1-
			 EqualizationPhase2- EqualizationPhase3- LinkEqualizationRequest-
			 Retimer- 2Retimers- CrosslinkRes: unsupported
	Capabilities: [100 v1] Advanced Error Reporting
		UESta:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UEMsk:	DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt- UnxCmplt- RxOF- MalfTLP- ECRC- UnsupReq- ACSViol-
		UESvrt:	DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt- UnxCmplt- RxOF+ MalfTLP+ ECRC- UnsupReq- ACSViol-
		CESta:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		CEMsk:	RxErr- BadTLP- BadDLLP- Rollover- Timeout- AdvNonFatalErr+
		AERCap:	First Error Pointer: 00, ECRCGenCap+ ECRCGenEn- ECRCChkCap+ ECRCChkEn-
			MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
		HeaderLog: 00000000 00000000 00000000 00000000
	Capabilities: [140 v1] Device Serial Number 00-1b-21-ff-ff-9b-44-44
	Capabilities: [1a0 v1] Transaction Processing Hints
		Device specific mode supported
		Steering table in TPH capability structure
	Kernel driver in use: igb
	Kernel modules: igb

06:06.0 Multimedia audio controller: Creative Labs EMU10k2/CA0100/CA0102/CA10200 [Sound Blaster Audigy Series] (rev 04)
	Subsystem: Creative Labs SB0240 Audigy 2 Platinum 6.1
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32 (500ns min, 5000ns max)
	Interrupt: pin A routed to IRQ 20
	NUMA node: 0
	Region 0: I/O ports at 9f00 [size=64]
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: snd_emu10k1
	Kernel modules: snd_emu10k1

06:06.1 Input device controller: Creative Labs SB Audigy Game Port (rev 04)
	Subsystem: Creative Labs SB Audigy2 MIDI/Game Port
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32
	NUMA node: 0
	Region 0: I/O ports at 9e00 [size=8]
	Capabilities: [dc] Power Management version 2
		Flags: PMEClk- DSI+ D1+ D2+ AuxCurrent=0mA PME(D0-,D1-,D2-,D3hot-,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
	Kernel driver in use: Emu10k1_gameport
	Kernel modules: emu10k1_gp

06:06.2 FireWire (IEEE 1394): Creative Labs SB Audigy FireWire Port (rev 04) (prog-if 10 [OHCI])
	Subsystem: Creative Labs SB Audigy FireWire Port
	Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 32 (500ns min, 1000ns max), Cache Line Size: 64 bytes
	Interrupt: pin B routed to IRQ 21
	NUMA node: 0
	Region 0: Memory at fd8ff000 (32-bit, non-prefetchable) [size=2K]
	Region 1: Memory at fd8f8000 (32-bit, non-prefetchable) [size=16K]
	Capabilities: [44] Power Management version 2
		Flags: PMEClk- DSI- D1+ D2+ AuxCurrent=0mA PME(D0+,D1+,D2+,D3hot+,D3cold-)
		Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME+
	Kernel driver in use: firewire_ohci
	Kernel modules: firewire_ohci


--trekuen-ab685f02-5785-4d56-a853-463f105083b0
Content-Type: application/octet-stream
Content-Disposition: attachment; filename=xl_info.log
Content-Transfer-Encoding: quoted-printable

host                   : Gemini-Sector
release                : 5.10.0-21-amd64
version                : #1 SMP Debian 5.10.162-1 (2023-01-21)
machine                : x86_64
nr_cpus                : 4
max_cpu_id             : 7
nr_nodes               : 1
cores_per_socket       : 4
threads_per_core       : 1
cpu_mhz                : 2611.811
hw_caps                : 178bf3ff:00802001:ee500800:000037ff:00000000:0000=
0000:00000000:00000100
virt_caps              : pv hvm hap shadow
total_memory           : 16380
free_memory            : 15427
sharing_freed_memory   : 0
sharing_used_memory    : 0
outstanding_claims     : 0
free_cpus              : 0
xen_major              : 4
xen_minor              : 14
xen_extra              : .5
xen_version            : 4.14.5
xen_caps               : xen-3.0-x86_64 hvm-3.0-x86_32 hvm-3.0-x86_32p hvm=
-3.0-x86_64
xen_scheduler          : credit2
xen_pagesize           : 4096
platform_params        : virt_start=3D0xffff800000000000
xen_changeset          :
xen_commandline        : placeholder dom0_mem=3D768M,max:768M iommu=3Ddebu=
g loglvl=3Dall guest_loglvl=3Dall
cc_compiler            : x86_64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 202=
10110
cc_compile_by          : pkg-xen-devel
cc_compile_domain      : lists.alioth.debian.org
cc_compile_date        : Fri Nov  4 19:25:46 UTC 2022
build_id               : 888699a351d5cbf2705344205565dd20479f1b14
xend_config_format     : 4

--trekuen-ab685f02-5785-4d56-a853-463f105083b0--


