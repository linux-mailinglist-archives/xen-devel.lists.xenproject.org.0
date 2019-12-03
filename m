Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 882E510F4D5
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 03:11:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibxZG-0005Y7-5p; Tue, 03 Dec 2019 02:05:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7s2f=ZZ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1ibxZE-0005Y1-Ok
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 02:05:32 +0000
X-Inumbo-ID: 6237bc5a-1571-11ea-81c9-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6237bc5a-1571-11ea-81c9-12813bfff9fa;
 Tue, 03 Dec 2019 02:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575338732;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=fTpzT7OwTgD6a/bcHVL8tFdsz6fpZIcBc+UxoTQkr3A=;
 b=Azq8UPFCbZG+JpgoH+cA4Aw8CgRFbUiCUIOlN+gy9nbL+is2n8fe9LxO
 BTuZKZ0gstcgvnvhylqiNBuJROOfNxb3/jduPl0yCBOKAKf6HYU/1Egq5
 YljyYq30auLgt4Cx4bqPUR4d+Un8rxLrnoZFgDi0igDbeeHSgKoAzMtEj c=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NxFfHtedHjCjWgKrhdkj62iRrejEI0wLGN7HiIGrvzk7WPK6MeS892ZEdWxFZ5NLv02Rr7FglK
 hGl4mMIppOoW0RlAKBTcZhd+bKjcFjvmVUTmEhrDLrQlk1WPgRX3zaO8N8VWF4R+PdgRdWqzVN
 9BnXJiXGy+tYjbG6Xl0yMP6+YOhWX6GUh4+amlb95rEbmC7dX2Fll7diK9Te60KL37AR9sCazz
 ZhTze6juswj5hbErXhzMCOeCuKTN1P5q5APc8rhtfcnaBQcZGb2l8hrMQIrzuZto+FJF8G2Y2S
 9hg=
X-SBRS: 2.7
X-MesageID: 9219860
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,271,1571716800"; 
   d="scan'208";a="9219860"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: Community Call: Call for Agenda Items and call details for Dec
 4, 16:00 - 17:00 UTC 
Thread-Index: AQHVqX4gTES3gx0sBkGStmGIxRgsoA==
Date: Tue, 3 Dec 2019 02:05:24 +0000
Message-ID: <70BC97F0-8DD8-44F4-A64D-5C2060C76C7B@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.10.191111
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F512F2524689D34ABD40284F659DF2D5@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Community Call: Call for Agenda Items and call details
 for Dec 4, 16:00 - 17:00 UTC
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
 Artem Mygaiev <Artem_Mygaiev@epam.com>, Varad Gautam <varadgautam@gmail.com>,
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

RGVhcsKgY29tbXVuaXR5wqBtZW1iZXJzLA0KwqANCnBsZWFzZSBzZW5kIG1lwqBhZ2VuZGHCoGl0
ZW1zwqBmb3LCoHRoaXMgRnJpZGF54oCZc8KgY29tbXVuaXR5wqBjYWxsIChzb3JyeSBmb3IgdGhl
IGxhdGUgbm90aWNlLCBJIHdhcyBvbiBQVE8gbGFzdCB3ZWVrKS4gQSBkcmFmdMKgYWdlbmRhwqBp
cyBhdMKgaHR0cHM6Ly9jcnlwdHBhZC5mci9wYWQvIy8yL3BhZC9lZGl0L1BDdEJwaG9Ya0NUaVhB
Qko4Y2RMMEt1Wi8gDQpQbGVhc2UgYWRkwqBhZ2VuZGHCoGl0ZW1zwqB0byB0aGUgZG9jdW1lbnQg
b3IgcmVwbHkgdG8gdGhpcyBlLW1haWwNCg0KQEp1ZXJnZW46IEkgYWRkZWQgYSBzbG90IHJlIHRo
ZSA0LjEzIHJlbGVhc2UNCkBEb3VnOiBJIHNhdyBzb21lIGFjdGl2aXR5IHJlY2VudGx5IGFib3V0
IHRoZSBDSSBMb29wIHN0dWZmIC0gbWF5YmUgd29ydGggZGlzY3Vzc2luZywgaWYgeW91IGhhdmUg
dGltZQ0KQElhbjogeW91IG1lbnRpb25lZCB0aGF0IHlvdSB3YW50ZWQgdG8gZmluZCBhIHdheSB0
byBnZXQgc3lzYWRtaW4gaGVscCBmcm9tIHNvbWVvbmUgaW4gdGhlIGNvbW11bml0eSB0byBoZWxw
IG1haW50YWluIHRlc3QgaW5mcmEgLSBJIHdhbnRlZCB0byBydW4gdGhpcyBwYXN0IHRoaXMgZ3Jv
dXAgZmlyc3QgdG8gc2VlIHdoZXRoZXIgYW55IG5hbWVzIGNvbWUgdG8gbWluZC4gVGhlIHJlcXVp
cmVkIHNraWxsc2V0IGlzIGxpa2VseSB0byBiZSBkaWZmZXJlbnQgdG8gdGhhdCBvZiBhIGRldmVs
b3BlciANCg0KVVBEQVRFOiBQYXVsIER1cnJhbnQgd2lsbCBiZSByZWxlYXNlIG1hbmFnZXIgZm9y
IDQuMTQgLSBjb25ncmF0dWxhdGlvbnMNCg0KTGFzdCBtb250aOKAmXMgbWludXRlcyBhcmUgYXTC
oGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvdmlldy83bDNhNG1oWlRVNHhzMEdFNDE1
T1hpQWowU2NLbDM5eGRROXdtMGN3QVNzLyANCsKgDQpCZXN0IFJlZ2FyZHMNCkxhcnMNCg0KIyPC
oE1lZXRpbmcgdGltZSAocGxlYXNlIGRvdWJsZSBjaGVjayB0aGUgdGltZXMpDQoxNjowMMKgLcKg
MTc6MDDCoFVUQw0KMDg6MDDCoC3CoDA5OjAwIFBTVCAoU2FuIEZyYW5jaXNjbynCoC3CoHNvcnJ5
wqBmb3LCoHRoZSBlYXJseSB0aW1lIHNsb3QuIElmIHRoaXMgaXMgYSBwcm9ibGVtLCBsZXQncyBk
aXNjdXNzIGF0IHRoZcKgY2FsbA0KMTA6MDAgLSAxMTowMCBDU1QgKEF1c3RpbiwgQ29zdGEgUmlj
YSkNCjExOjAwwqAtwqAxMjowMCBFU1QgKE5ldyBZb3JrKQ0KMTY6MDDCoC3CoDE3OjAwwqBGTVQg
KExvbmRvbikNCjE3OjAwwqAtwqAxODowMCBDRVQgKEJlcmxpbikNCjAwOjAwwqAtwqAwMTowMCsx
IENTVCAoQmVpamluZykNCg0KRnVydGhlciBJbnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6wqBo
dHRwczovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5nZGV0YWlscy5odG1s
P3llYXI9MjAxOSZtb250aD0xMiZkYXk9NCZob3VyPTE2Jm1pbj0wJnNlYz0wJnAxPTIyNCZwMj0y
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
