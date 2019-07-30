Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B57A9B4
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 15:34:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsSEF-0003s6-3f; Tue, 30 Jul 2019 13:31:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5qpE=V3=ainfosec.com=rosbrookn@srs-us1.protection.inumbo.net>)
 id 1hsSEE-0003s0-8k
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 13:31:46 +0000
X-Inumbo-ID: 5f467635-b2ce-11e9-8980-bc764e045a96
Received: from mail.ainfosec.com (unknown [209.217.208.252])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f467635-b2ce-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 13:31:44 +0000 (UTC)
X-ASG-Debug-ID: 1564492304-0dce566a4a2ac9b0001-RNp3Ad
Received: from AISEX01.ainfosec.com ([10.201.1.88]) by mail.ainfosec.com with
 ESMTP id BC0O1GqYXoGUtx1z (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384
 bits=256 verify=NO); Tue, 30 Jul 2019 09:11:44 -0400 (EDT)
X-Barracuda-Envelope-From: rosbrookn@ainfosec.com
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by AISEX01.ainfosec.com
 (10.201.1.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Tue, 30
 Jul 2019 09:11:44 -0400
Received: from AIS-Mustang.ainfosec.com (10.201.1.188) by
 AIS-Mustang.ainfosec.com (10.201.1.188) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1779.2; Tue, 30 Jul 2019 09:11:44 -0400
Received: from AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb]) by
 AIS-Mustang.ainfosec.com ([fe80::dd05:4fde:e2b2:58fb%3]) with mapi id
 15.01.1779.002; Tue, 30 Jul 2019 09:11:44 -0400
From: Nicholas Rosbrook <rosbrookn@ainfosec.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [RFC] Generating Go bindings for libxl
X-ASG-Orig-Subj: [RFC] Generating Go bindings for libxl
Thread-Index: AQHVRtfLXTQzyEsJNUC34RhhfUYN2g==
Date: Tue, 30 Jul 2019 13:11:44 +0000
Message-ID: <5c6f3ed7b2f444918feea4f4b7cec107@ainfosec.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.101.172]
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.201.1.88]
X-Barracuda-Start-Time: 1564492304
X-Barracuda-Encrypted: ECDHE-RSA-AES256-SHA384
X-Barracuda-URL: https://10.69.69.46:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at ainfosec.com
X-Barracuda-Scan-Msg-Size: 3187
X-Barracuda-BRTS-Status: 1
X-Barracuda-Bayes: INNOCENT GLOBAL 0.5002 1.0000 0.7500
X-Barracuda-Spam-Score: 0.75
X-Barracuda-Spam-Status: No, SCORE=0.75 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=9.0 tests=HTML_MESSAGE
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.74645
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.00 HTML_MESSAGE           BODY: HTML included in message
Subject: [Xen-devel] [RFC] Generating Go bindings for libxl
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Brendan Kerrigan <kerriganb@ainfosec.com>, "wl@xen.org" <wl@xen.org>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 Nicolas Belouin <nicolas.belouin@gandi.net>
Content-Type: multipart/mixed; boundary="===============3510533917460318703=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3510533917460318703==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5c6f3ed7b2f444918feea4f4b7cec107ainfoseccom_"

--_000_5c6f3ed7b2f444918feea4f4b7cec107ainfoseccom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

As a follow up to the presentation that Brendan Kerrigan and I gave at Xen
summit earlier this month, "Client Virtualization Toolstack in Go", I would=
 like to open
a discussion around the development of Go bindings for libxl. George Dunlap=
,
Nicolas Belouin and I have had some discussion off-line already.

So far, these are the topics of discussion:

- Code generation: Should the Go bindings be generated from the IDL? Or sho=
uld
  an existing cgo generator like c-for-go [1] be leveraged?

- What does the minimal viable Go package look like? IMO it should be able =
to create
  and destroy domains, attach and detach network and disk devices, list dom=
ains,
  and convert domid to name and vice versa. It is also important that the e=
xported
  APIs reflect idiomatic Go.

- Challenges surrounding hypervisor versioning, go modules, etc.

ATM, the code generation piece is the primary concern.

George - could you explain your thoughts on the code generation topic?

The existing bindings that I have been working on are at [2].

Thanks,

- Nick Rosbrook

[1] https://github.com/xlab/c-for-go
[2] https://github.com/enr0n/xen/tree/libxl-go/tools/golibxl/libxl

--_000_5c6f3ed7b2f444918feea4f4b7cec107ainfoseccom_
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
<p><font size=3D"2"><span style=3D"font-size:10pt;">Hello,<br>
<br>
As a follow up to the presentation that Brendan Kerrigan and I gave at Xen =
<br>
summit earlier this month, &quot;Client Virtualization Toolstack in Go&quot=
;, I would like to open
<br>
a discussion around the development of Go bindings for libxl. George Dunlap=
,<br>
Nicolas Belouin and I have had some discussion off-line already.<br>
<br>
So far, these are the topics of discussion:<br>
<br>
- Code generation: Should the Go bindings be generated from the IDL? Or sho=
uld<br>
&nbsp; an existing cgo generator like c-for-go [1] be leveraged?<br>
<br>
- What does the minimal viable Go package look like? IMO it should be able =
to create<br>
&nbsp; and destroy domains, attach and detach network and disk devices, lis=
t domains,<br>
&nbsp; and convert domid to name and vice versa. It is also important that =
the exported<br>
&nbsp; APIs reflect idiomatic Go.<br>
<br>
- Challenges surrounding hypervisor versioning, go modules, etc.<br>
<br>
ATM, the code generation piece is the primary concern.<br>
<br>
George - could you explain your thoughts on the code generation topic?<br>
<br>
The existing bindings that I have been working on are at [2].<br>
<br>
Thanks,<br>
<br>
- Nick Rosbrook<br>
<br>
[1] <a href=3D"https://github.com/xlab/c-for-go" id=3D"LPlnk229969" preview=
removed=3D"true">
https://github.com/xlab/c-for-go</a><br>
[2] <a href=3D"https://github.com/enr0n/xen/tree/libxl-go/tools/golibxl/lib=
xl" id=3D"LPlnk217617" previewremoved=3D"true">
https://github.com/enr0n/xen/tree/libxl-go/tools/golibxl/libxl</a></span></=
font><br>
</p>
</div>
</body>
</html>

--_000_5c6f3ed7b2f444918feea4f4b7cec107ainfoseccom_--


--===============3510533917460318703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3510533917460318703==--

