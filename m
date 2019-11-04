Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4070BEDDCE
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 12:41:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRafe-0003KM-Am; Mon, 04 Nov 2019 11:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1DXH=Y4=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1iRafd-0003KH-5D
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 11:37:17 +0000
X-Inumbo-ID: 733346a4-fef7-11e9-a177-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 733346a4-fef7-11e9-a177-12813bfff9fa;
 Mon, 04 Nov 2019 11:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1572867435;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=rT88w3/DFxdun5ayNJAg3FGU/k/qA010qz03Wwn644A=;
 b=h9a4oIsvzdyNyEuibwA/rd/FSkL7HSxUdqsm6sUgUDEPuuKxEQKyRIpX
 JHnBc/SIFmMfcCn0wJMBhBYC/cSI2wrBHP5zg9irvUJGli3G209Q+6ut/
 HFN75ssaTb2vlFDS37ozBCiIOX1hRSYpX2qwTlOvMlFGYTPr4pqOMcQGF c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f9qgoEreHGaNllY4DrxyrXE0KIQ64bIkw0H3pO3Zy7TZWkHx7KteENsLC1pa/g3fQ9fhiwFW4d
 OprU0+0bLq+wiPvyol6oc+s6lndwLoTidOpOgm/zFg6v/TKl9RaO+J++XR2W6R5qgsbU17r18g
 0QC1Cm1u6sd01DwlBXIblrVV1fH6qLm4SalM4hd7LtAbWFDHrI+lWENk1Q+pPm4AzN8ceS/UQk
 PINSRJVcR4JTIAtzIG/vrOePUqn85lALkQ913YyL//nN0g+dmRfNdv5cyX4vMI4pmHcnH56FNA
 cLc=
X-SBRS: 2.7
X-MesageID: 8135436
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,267,1569297600"; 
   d="scan'208";a="8135436"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for Nov
 7, 15:00 - 16:00 UTC
Thread-Index: AQHVkwQx8BA8PhnrqkSa9mHgVmP4Fg==
Date: Mon, 4 Nov 2019 11:37:09 +0000
Message-ID: <5FBE7F80-B1A8-4545-A77A-3EDE1C7418E4@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.f.191014
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <BE715C618C0FE04EB8654C8BAF300D09@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Community Call: Call for Agenda Items and call details
 for Nov 7, 15:00 - 16:00 UTC
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
 Amit Shah <amit@infradead.org>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Varad Gautam <varadgautam@gmail.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>, George
 Dunlap <George.Dunlap@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "lambert.olivier@gmail.com" <lambert.olivier@gmail.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen
 Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 =?utf-8?B?UGF1bCBEdXJyYW50wqA=?= <pdurrant@amazon.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RGVhciBjb21tdW5pdHkgbWVtYmVycywNCsKgDQpwbGVhc2Ugc2VuZCBtZSBhZ2VuZGEgaXRlbXMg
Zm9yIG5leHQgd2Vla+KAmXMgY29tbXVuaXR5IGNhbGwuIEEgZHJhZnQgYWdlbmRhIGlzIGF0IGh0
dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9Ta2VVK1o1SjlXSUlVOVpzWGxvamlY
Y1EvDQpQbGVhc2UgYWRkIGFnZW5kYSBpdGVtcyB0byB0aGUgZG9jdW1lbnQgb3IgcmVwbHkgdG8g
dGhpcyBlLW1haWwNCk5vdGUgdGhhdCBJIGFtIG9uIFBUTyB0b2RheSBhbmQgdG9tb3Jyb3cNCsKg
DQpMYXN0IG1vbnRo4oCZcyBtaW51dGVzIGFyZSBhdCBodHRwczovL2NyeXB0cGFkLmZyL3BhZC8j
LzIvcGFkL2VkaXQvNEZHRXc4MWZsUFVpaXZramt1dlFKLUNLLw0KwqANCkJlc3QgUmVnYXJkcw0K
TGFycw0KDQojI8KgTWVldGluZyB0aW1lIChwbGVhc2UgZG91YmxlIGNoZWNrIHRoZSB0aW1lcw0K
MTU6MDAgLSAxNjowMCBVVEMNCjA3OjAwIC0gMDg6MDAgUFNUIChTYW4gRnJhbmNpc2NvKSAtIHNv
cnJ5IGZvciB0aGUgZWFybHkgdGltZSBzbG90LiBJZiB0aGlzIGlzIGEgcHJvYmxlbSwgbGV0J3Mg
ZGlzY3VzcyBhdCB0aGUgY2FsbA0KMTA6MDAgLSAxMTowMCBFU1QgKE5ldyBZb3JrKQ0KMTU6MDAg
LSAxNjowMCBGTVQgKExvbmRvbikNCjE2OjAwIC0gMTc6MDAgQ0VUIChCZXJsaW4pDQoyMzowMCAt
IDIyOjAwIENTVCAoQmVpamluZykNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVz
OiBodHRwczovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5o
dG1sP3llYXI9MjAxOCZtb250aD0xMSZkYXk9NyZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTIyNCZw
Mj0yNCZwMz0xNzkmcDQ9MTM2JnA1PTM3JnA2PTMzDQoNCiMjIERpYWwgaW4gZGV0YWlscw0KV2Vi
OiBodHRwczovL3d3dy5nb3RvbWVldC5tZS9sYXJza3VydGgNCg0KWW91IGNhbiBhbHNvIGRpYWwg
aW4gdXNpbmcgeW91ciBwaG9uZS4NCkFjY2VzcyBDb2RlOiA5MDYtODg2LTk2NQ0KDQpDaGluYSAo
VG9sbCBGcmVlKTogNDAwOCA4MTEwODQNCkdlcm1hbnk6ICs0OSA2OTIgNTczNiA3MzE3DQpQb2xh
bmQgKFRvbGwgRnJlZSk6IDAwIDgwMCAxMTI0NzU5DQpVbml0ZWQgS2luZ2RvbTogKzQ0IDMzMCAy
MjEgMDA4OA0KVW5pdGVkIFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNCg0KTW9yZSBwaG9uZSBu
dW1iZXJzDQpBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KQXVzdHJpYTogKzQzIDcgMjA4MSA1
NDI3DQpBcmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAgODAwIDQ0NCAzMzc1DQpCYWhyYWluIChUb2xs
IEZyZWUpOiA4MDAgODEgMTExDQpCZWxhcnVzIChUb2xsIEZyZWUpOiA4IDgyMCAwMDExIDA0MDAN
CkJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQpCcmF6aWwgKFRvbGwgRnJlZSk6IDAgODAwIDA0NyA0
OTA2DQpCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4MDAgMTIwIDQ0MTcNCkNhbmFkYTogKzEgKDY0
NykgNDk3LTkzOTENCkNoaWxlIChUb2xsIEZyZWUpOiA4MDAgMzk1IDE1MA0KQ29sb21iaWEgKFRv
bGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KQ3plY2ggUmVwdWJsaWMgKFRvbGwgRnJlZSk6IDgw
MCA1MDA0NDgNCkRlbm1hcms6ICs0NSAzMiA3MiAwMyA4Mg0KRmlubGFuZDogKzM1OCA5MjMgMTcg
MDU2OA0KRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQNCkdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAw
IDQ0MTQgMzgzOA0KSG9uZyBLb25nIChUb2xsIEZyZWUpOiAzMDcxMzE2OQ0KSHVuZ2FyeSAoVG9s
bCBGcmVlKTogKDA2KSA4MCA5ODYgMjU1DQpJY2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0K
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
NDU5OSA3OA0KVGFpd2FuIChUb2xsIEZyZWUpOiAwIDgwMCA2NjYgODU0DQpUaGFpbGFuZCAoVG9s
bCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQpUdXJrZXkgKFRvbGwgRnJlZSk6IDAwIDgwMCA0NDg4
IDIzNjgzDQpVa3JhaW5lIChUb2xsIEZyZWUpOiAwIDgwMCA1MCAxNzMzDQpVbml0ZWQgQXJhYiBF
bWlyYXRlcyAoVG9sbCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KVXJ1Z3VheSAoVG9sbCBGcmVlKTog
MDAwNCAwMTkgMTAxOA0KVmlldCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCg0KRmlyc3Qg
R29Ub01lZXRpbmc/IExldCdzIGRvIGEgcXVpY2sgc3lzdGVtIGNoZWNrOg0KaHR0cHM6Ly9saW5r
LmdvdG9tZWV0aW5nLmNvbS9zeXN0ZW0tY2hlY2sNCg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
