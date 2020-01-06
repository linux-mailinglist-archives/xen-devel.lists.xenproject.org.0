Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F01318EF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jan 2020 20:59:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioYUI-00032T-9v; Mon, 06 Jan 2020 19:56:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9szg=23=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ioYUH-00032O-75
 for xen-devel@lists.xenproject.org; Mon, 06 Jan 2020 19:56:29 +0000
X-Inumbo-ID: 9b5481cc-30be-11ea-b6f1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b5481cc-30be-11ea-b6f1-bc764e2007e4;
 Mon, 06 Jan 2020 19:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578340579;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=Vb9K0Krbd8wnAR2RA2CXf80nXvmnjn7lHM5y/z7ldRI=;
 b=MEGVwB3U8BHXzpYrysI+bAVFtEj2yQv+E/XSdQS6SYNMlmLsUgBUsC7h
 dV1YwLUYUBvv+TuDWJ0GOTo5YvOIn1+HvY8TuqPmd57UAePkuk/6MqW1U
 cdI1kX0Q4z6CHy0p3WwwFJ4+iqf/ambGho7iwKRvI46AIF3v3G1bOjlJF Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Ltu4IUqdQY7Ip+/QjWTXdkbvuQJlklt+E/xdt/riksg//JUxm3Lb04W828aEPejkPgKPdAFvr2
 CTCekSnQMJqnQkpPmZoUOakpr9e1oHt0muNbWSdroPYR85pYSYQDJUi30+8DY/ZS4ZMYBgQBI8
 sowHO91SxTMKfPyuJ0YKfWnpPy6qj3bV/UJBFGKWemVMvNUNWMEgrzq+m2LAyKa+krKs7eBeu8
 RTCbwn4iYr058dxpo5J26DrPPwMlPGVuD8fj5rBX+1w0kNkfQl6fM5M3E48KLR/h12ydrC6nMf
 aCs=
X-SBRS: 2.7
X-MesageID: 11106020
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,403,1571716800"; d="scan'208";a="11106020"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for Jan
 9, 16:00 - 17:00 UTC
Thread-Index: AQHVxMtZ1OgMwMP+3E6j25NQq/tXUA==
Date: Mon, 6 Jan 2020 19:56:14 +0000
Message-ID: <4545D260-7F67-42DC-A33E-2F466011ED20@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.11.191208
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <4F85C3A00AB06A48AF4619162AE442D4@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Community Call: Call for Agenda Items and call details
 for Jan 9, 16:00 - 17:00 UTC
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
Cc: Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Brian
 Woods <brian.woods@xilinx.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 Amit Shah <amit@infradead.org>, Matt Spencer <Matt.Spencer@arm.com>,
 Robert Townley <rob.townley@gmail.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Varad Gautam <varadgautam@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>, Kevin
 Pearson <kevin.pearson@ortmanconsulting.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stewart
 Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhcsKgY29tbXVuaXR5wqBtZW1iZXJzLA0KwqANCkkgaG9wZSB5b3UgYWxsIGhhZCBhIHJlc3Rm
dWwgaG9saWRheSBwZXJpb2QgYW5kIGEgSGFwcHkgTmV3IFllYXIhIA0KDQpQbGVhc2Ugc2VuZCBt
ZcKgYWdlbmRhwqBpdGVtc8KgZm9ywqB0aGlzIFRodXJzZGF5J3PCoGNvbW11bml0ecKgY2FsbMKg
KHdlIGFncmVlZCB0byBtb3ZlIGl0IGJ5IDEgd2VlaykgcHJlZmVyYWJseSBieSBXZWRuZXNkYXkh
DQoNCkEgZHJhZnTCoGFnZW5kYcKgaXMgYXTCoGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9w
YWQvZWRpdC9FUlp0TVlENWo2azBzdi1ORzZIdGwtQUovDQpQbGVhc2UgYWRkwqBhZ2VuZGHCoGl0
ZW1zwqB0byB0aGUgZG9jdW1lbnQgb3IgcmVwbHkgdG8gdGhpcyBlLW1haWwNCg0KTGFzdCBtb250
aOKAmXMgbWludXRlcyBhcmUgYXTCoGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRp
dC9FUlp0TVlENWo2azBzdi1ORzZIdGwtQUovDQrCoA0KQmVzdCBSZWdhcmRzDQpMYXJzDQoNCiMj
wqBNZWV0aW5nIHRpbWUgKHBsZWFzZSBkb3VibGUgY2hlY2sgdGhlIHRpbWVzKQ0KMTY6MDDCoC3C
oDE3OjAwwqBVVEMNCjA4OjAwwqAtwqAwOTowMCBQU1QgKFNhbiBGcmFuY2lzY28pwqAtwqBzb3Jy
ecKgZm9ywqB0aGUgZWFybHkgdGltZSBzbG90LiBJZiB0aGlzIGlzIGEgcHJvYmxlbSwgbGV0J3Mg
ZGlzY3VzcyBhdCB0aGXCoGNhbGwNCjEwOjAwIC0gMTE6MDAgQ1NUIChBdXN0aW4sIENvc3RhIFJp
Y2EpDQoxMTowMMKgLcKgMTI6MDAgRVNUIChOZXcgWW9yaykNCjE2OjAwwqAtwqAxNzowMMKgRk1U
IChMb25kb24pDQoxNzowMMKgLcKgMTg6MDAgQ0VUIChCZXJsaW4pDQowMDowMMKgLcKgMDE6MDAr
MSBDU1QgKEJlaWppbmcpDQoNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOsKg
aHR0cHM6Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRt
bD95ZWFyPTIwMjAmbW9udGg9MSZkYXk9OSZob3VyPTE2Jm1pbj0wJnNlYz0wJnAxPTIyNCZwMj0y
NCZwMz0xNzkmcDQ9MTM2JnA1PTM3JnA2PTMzDQoNCiMjIERpYWwgaW7CoGRldGFpbHMNCldlYjrC
oGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL2xhcnNrdXJ0aA0KDQpZb3UgY2FuIGFsc28gZGlhbCBp
biB1c2luZyB5b3VyIHBob25lDQpBY2Nlc3MgQ29kZTogOTA2LTg4Ni05NjUNCg0KQ2hpbmEgKFRv
bGwgRnJlZSk6IDQwMDggODExMDg0DQpHZXJtYW55OiArNDkgNjkyIDU3MzYgNzMxNw0KUG9sYW5k
wqAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNClVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIy
MSAwMDg4DQpVbml0ZWQgU3RhdGVzOiArMSAoNTcxKSAzMTctMzEyOQ0KDQpNb3JlIHBob25lIG51
bWJlcnMNCkF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0DQpBdXN0cmlhOiArNDMgNyAyMDgxIDU0
MjcNCkFyZ2VudGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCkJhaHJhaW4gKFRvbGwg
RnJlZSk6IDgwMCA4MSAxMTENCkJlbGFydXMgKFRvbGwgRnJlZSk6IDggODIwIDAwMTEgMDQwMA0K
QmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCkJyYXppbCAoVG9sbCBGcmVlKTogMCA4MDAgMDQ3IDQ5
MDYNCkJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAxMjAgNDQxNw0KQ2FuYWRhOiArMSAoNjQ3
KSA0OTctOTM5MQ0KQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAzOTUgMTUwDQpDb2xvbWJpYSAoVG9s
bCBGcmVlKTogMDEgODAwIDUxOCA0NDgzDQpDemVjaCBSZXB1YmxpYyAoVG9sbCBGcmVlKTogODAw
IDUwMDQ0OA0KRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQpGaW5sYW5kOiArMzU4IDkyMyAxNyAw
NTY4DQpGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KR3JlZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAg
NDQxNCAzODM4DQpIb25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEzMTY5DQpIdW5nYXJ5IChUb2xs
IEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCkljZWxhbmTCoChUb2xsIEZyZWUpOiA4MDAgNzIwNA0K
SW5kaWEgKFRvbGwgRnJlZSk6IDE4MDAyNjY5MjcyDQpJbmRvbmVzaWEgKFRvbGwgRnJlZSk6IDAw
NyA4MDMgMDIwIDUzNzUNCklyZWxhbmQ6ICszNTMgMTUgMzYwIDcyOA0KSXNyYWVsIChUb2xsIEZy
ZWUpOiAxIDgwOSA0NTQgODMwDQpJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAxDQpKYXBhbiAoVG9s
bCBGcmVlKTogMCAxMjAgNjYzIDgwMA0KS29yZWEsIFJlcHVibGljIG9mIChUb2xsIEZyZWUpOiAw
MDc5OCAxNCAyMDcgNDkxNA0KTHV4ZW1ib3VyZyAoVG9sbCBGcmVlKTogODAwIDg1MTU4DQpNYWxh
eXNpYSAoVG9sbCBGcmVlKTogMSA4MDAgODEgNjg1NA0KTWV4aWNvIChUb2xsIEZyZWUpOiAwMSA4
MDAgNTIyIDExMzMNCk5ldGhlcmxhbmRzOiArMzEgMjA3IDk0MSAzNzcNCk5ldyBaZWFsYW5kOiAr
NjQgOSAyODAgNjMwMg0KTm9yd2F5OiArNDcgMjEgOTMgMzcgNTENClBhbmFtYSAoVG9sbCBGcmVl
KTogMDAgODAwIDIyNiA3OTI4DQpQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KUGhpbGlw
cGluZXMgKFRvbGwgRnJlZSk6IDEgODAwIDExMTAgMTY2MQ0KUG9ydHVnYWwgKFRvbGwgRnJlZSk6
IDgwMCA4MTkgNTc1DQpSb21hbmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQpSdXNzaWFu
IEZlZGVyYXRpb24gKFRvbGwgRnJlZSk6IDggODAwIDEwMCA2MjAzDQpTYXVkaSBBcmFiaWEgKFRv
bGwgRnJlZSk6IDgwMCA4NDQgMzYzMw0KU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMy
Mw0KU291dGggQWZyaWNhIChUb2xsIEZyZWUpOiAwIDgwMCA1NTUgNDQ3DQpTcGFpbjogKzM0IDkz
MiA3NSAyMDA0DQpTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KU3dpdHplcmxhbmQ6ICs0MSAyMjUg
NDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0DQpUaGFpbGFuZMKgKFRv
bGwgRnJlZSk6IDAwMSA4MDAgMDExIDAyMw0KVHVya2V5IChUb2xsIEZyZWUpOiAwMCA4MDAgNDQ4
OCAyMzY4Mw0KVWtyYWluZSAoVG9sbCBGcmVlKTogMCA4MDAgNTAgMTczMw0KVW5pdGVkIEFyYWIg
RW1pcmF0ZXMgKFRvbGwgRnJlZSk6IDgwMCAwNDQgNDA0MzkNClVydWd1YXkgKFRvbGwgRnJlZSk6
IDAwMDQgMDE5IDEwMTgNClZpZXQgTmFtIChUb2xsIEZyZWUpOiAxMjIgODAgNDgxDQoNCkZpcnN0
IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVjazoNCmh0dHBzOi8vbGlu
ay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNrDQoNCg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
