Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E954EC82
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 17:48:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heLjU-0007lm-Hj; Fri, 21 Jun 2019 15:45:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LFBF=UU=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1heLjS-0007lh-ND
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 15:45:42 +0000
X-Inumbo-ID: 9fb31850-943b-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9fb31850-943b-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 15:45:41 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c5aEsvzEWQ15FPlyDbNHz7v08hUneO1UkjbszGkwnU964bLLs6YAphtozlU8R8w/acx3VE0I7V
 uLPHkE+cHm/taQoPQMydS+ktVOfhtXlO/PnVp1NXdOq2AimIhJ4NAZ4mmQroaVLkGCNv0KwhRD
 0rasI0axyIaRhGpiOc/86+EUeCeQBXT77YyXn3/Ud8k232N5bNqEzWSMzsLYmJZzA4Ouw+77nC
 mPQNkCNUclrdGZCDqrEsb/sC7wLdqUuIEI1JGbjtbSMDPAgU23rdcwMAEMEB8yxWtlFLg5oAPq
 gxo=
X-SBRS: 2.7
X-MesageID: 2067484
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,400,1557201600"; 
   d="scan'208";a="2067484"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: Xen Project Community Call June 27th (instead of July 4th):
 @15:00 UTC Call for agenda items
Thread-Index: AQHVKEhcH0vW8I5ySEO7jj3plK9VeQ==
Date: Fri, 21 Jun 2019 15:45:32 +0000
Message-ID: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <11CDABAE09606E40965D99B45DAFFE0F@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Xen Project Community Call June 27th (instead of July
 4th): @15:00 UTC Call for agenda items
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
Cc: "davorin.mista@aggios.com" <davorin.mista@aggios.com>,
 Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Brian
 Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KwqDCoMKgwqANClBsZWFzZSBwcm9wb3NlIHRvcGljcyBieSBlaXRoZXIgZWRpdGlu
ZyB0aGUgcnVubmluZyBhZ2VuZGEgZG9jdW1lbnQgYXTCoGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFk
LyMvMi9wYWQvZWRpdC9WLUpjdFYydkJsRW53bGlWTEJsRkxZN24vwqBvciBieSByZXBseWluZyB0
byB0aGUgbWFpbC4NCg0KTm90ZSB0aGF0IGN1cnJlbnRseSBJIGhhdmUNCiogTm90aGluZyB1bmRl
cjogDQogICBEKSBOZXcgU2VyaWVzIC8gU2VyaWVzIHRoYXQgbmVlZCBhdHRlbnRpb24gLyBTZXJp
ZXMgdGhhdCBhcmUgaW1wb3J0YW50DQoqIEEgcHJlcCBpdGVtIGZvciB0aGUgZGV2ZWxvcGVyIHN1
bW1pdCBwcm9wb3NlZCBieSBKYW4gYXQgdGhlIGxhc3QgbWVldGluZw0KSSBhbHNvIG1hZGUgc29t
ZSBwcm9ncmVzcyBvbiB0aGUgY29kZSBvZiBjb25kdWN0IHRvcGljIGFuZCBhbSBhYm91dCB0byBz
ZW5kIGEgbWFpbCB0byB4ZW4tZGV2ZWxADQoNCkJlc3QgUmVnYXJkcw0KTGFycw0KwqDCoMKgwqAN
CsKgwqDCoMKgPT0gRGlhbC1pbiBJbmZvcm1hdGlvbiA9PQ0KwqDCoMKgwqANCsKgwqDCoMKgICMj
IE1lZXRpbmcgdGltZQ0KwqDCoMKgwqAgMTU6MDAgLSAxNjowMCBVVEMNCsKgwqDCoMKgIEZ1cnRo
ZXIgSW50ZXJuYXRpb25hbCBtZWV0aW5nIHRpbWVzOsKgDQrCoMKgwqDCoMKgaHR0cHM6Ly93d3cu
dGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMTkm
bW9udGg9NiZkYXk9MjcmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0yMjUmcDI9MjI0JnAzPTI0JnA0
PTE3OSZwNT0xMzYmcDY9MzcmcDc9MzMNCsKgwqDCoMKgDQrCoMKgwqDCoCAjIyBEaWFsIGluIGRl
dGFpbHMNCsKgwqDCoMKgIFdlYjrCoGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL2xhcnNrdXJ0aA0K
wqDCoMKgwqANCsKgwqDCoMKgIFlvdSBjYW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUu
DQrCoMKgwqDCoCBBY2Nlc3MgQ29kZTogOTA2LTg4Ni05NjUNCsKgwqDCoMKgDQrCoMKgwqDCoCBD
aGluYSAoVG9sbCBGcmVlKTogNDAwOCA4MTEwODQNCsKgwqDCoMKgIEdlcm1hbnk6ICs0OSA2OTIg
NTczNiA3MzE3DQrCoMKgwqDCoCBQb2xhbmQgKFRvbGwgRnJlZSk6IDAwIDgwMCAxMTI0NzU5DQrC
oMKgwqDCoCBVbml0ZWQgS2luZ2RvbTogKzQ0IDMzMCAyMjEgMDA4OA0KwqDCoMKgwqAgVW5pdGVk
IFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNCsKgwqDCoMKgDQrCoMKgwqDCoCBNb3JlIHBob25l
IG51bWJlcnMNCsKgwqDCoMKgIEF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0DQrCoMKgwqDCoCBB
dXN0cmlhOiArNDMgNyAyMDgxIDU0MjcNCsKgwqDCoMKgIEFyZ2VudGluYSAoVG9sbCBGcmVlKTog
MCA4MDAgNDQ0IDMzNzUNCsKgwqDCoMKgIEJhaHJhaW4gKFRvbGwgRnJlZSk6IDgwMCA4MSAxMTEN
CsKgwqDCoMKgIEJlbGFydXMgKFRvbGwgRnJlZSk6IDggODIwIDAwMTEgMDQwMA0KwqDCoMKgwqAg
QmVsZ2l1bTogKzMyIDI4IDkzIDcwMTgNCsKgwqDCoMKgIEJyYXppbCAoVG9sbCBGcmVlKTogMCA4
MDAgMDQ3IDQ5MDYNCsKgwqDCoMKgIEJ1bGdhcmlhIChUb2xsIEZyZWUpOiAwMDgwMCAxMjAgNDQx
Nw0KwqDCoMKgwqAgQ2FuYWRhOiArMSAoNjQ3KSA0OTctOTM5MQ0KwqDCoMKgwqAgQ2hpbGUgKFRv
bGwgRnJlZSk6IDgwMCAzOTUgMTUwDQrCoMKgwqDCoCBDb2xvbWJpYSAoVG9sbCBGcmVlKTogMDEg
ODAwIDUxOCA0NDgzDQrCoMKgwqDCoMKgwqBDemVjaCBSZXB1YmxpYyAoVG9sbCBGcmVlKTogODAw
IDUwMDQ0OA0KwqDCoMKgwqAgRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQrCoMKgwqDCoCBGaW5s
YW5kOiArMzU4IDkyMyAxNyAwNTY4DQrCoMKgwqDCoCBGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0K
wqDCoMKgwqAgR3JlZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQrCoMKgwqDCoCBI
b25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEzMTY5DQrCoMKgwqDCoCBIdW5nYXJ5IChUb2xsIEZy
ZWUpOiAoMDYpIDgwIDk4NiAyNTUNCsKgwqDCoMKgIEljZWxhbmQgKFRvbGwgRnJlZSk6IDgwMCA3
MjA0DQrCoMKgwqDCoCBJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2NjkyNzINCsKgwqDCoMKgIElu
ZG9uZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KwqDCoMKgwqAgSXJlbGFuZDog
KzM1MyAxNSAzNjAgNzI4DQrCoMKgwqDCoCBJc3JhZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4
MzANCsKgwqDCoMKgIEl0YWx5OiArMzkgMCAyNDcgOTIgMTMgMDENCsKgwqDCoMKgIEphcGFuIChU
b2xsIEZyZWUpOiAwIDEyMCA2NjMgODAwDQrCoMKgwqDCoCBLb3JlYSwgUmVwdWJsaWMgb2YgKFRv
bGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQrCoMKgwqDCoCBMdXhlbWJvdXJnIChUb2xsIEZy
ZWUpOiA4MDAgODUxNTgNCsKgwqDCoMKgIE1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2
ODU0DQrCoMKgwqDCoCBNZXhpY28gKFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KwqDCoMKg
wqAgTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KwqDCoMKgwqAgTmV3IFplYWxhbmQ6ICs2
NCA5IDI4MCA2MzAyDQrCoMKgwqDCoCBOb3J3YXk6ICs0NyAyMSA5MyAzNyA1MQ0KwqDCoMKgwqAg
UGFuYW1hIChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNCsKgwqDCoMKgIFBlcnUgKFRvbGwg
RnJlZSk6IDAgODAwIDc3MDIzDQrCoMKgwqDCoCBQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4
MDAgMTExMCAxNjYxDQrCoMKgwqDCoCBQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUN
CsKgwqDCoMKgIFJvbWFuaWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAwMjkNCsKgwqDCoMKgIFJ1
c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAgMTAwIDYyMDMNCsKgwqDCoMKgIFNh
dWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQrCoMKgwqDCoCBTaW5nYXBvcmUg
KFRvbGwgRnJlZSk6IDE4MDA3MjMxMzIzDQrCoMKgwqDCoCBTb3V0aCBBZnJpY2EgKFRvbGwgRnJl
ZSk6IDAgODAwIDU1NSA0NDcNCsKgwqDCoMKgIFNwYWluOiArMzQgOTMyIDc1IDIwMDQNCsKgwqDC
oMKgIFN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQrCoMKgwqDCoCBTd2l0emVybGFuZDogKzQxIDIy
NSA0NTk5IDc4DQrCoMKgwqDCoCBUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNCsKg
wqDCoMKgIFRoYWlsYW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNCsKgwqDCoMKgIFR1
cmtleSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0ODggMjM2ODMNCsKgwqDCoMKgIFVrcmFpbmUgKFRv
bGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNCsKgwqDCoMKgIFVuaXRlZCBBcmFiIEVtaXJhdGVzIChU
b2xsIEZyZWUpOiA4MDAgMDQ0IDQwNDM5DQrCoMKgwqDCoCBVcnVndWF5IChUb2xsIEZyZWUpOiAw
MDA0IDAxOSAxMDE4DQrCoMKgwqDCoCBWaWV0IE5hbSAoVG9sbCBGcmVlKTogMTIyIDgwIDQ4MQ0K
wqDCoMKgwqANCsKgwqDCoMKgIEZpcnN0IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5
c3RlbSBjaGVjazoNCsKgwqDCoMKgwqBodHRwczovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5c3Rl
bS1jaGVjaw0KwqDCoMKgwqANCsKgwqDCoMKgDQrCoMKgwqDCoA0KDQoNCg0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
