Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DAB5553A
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 18:55:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfogu-0006ZS-D0; Tue, 25 Jun 2019 16:53:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HSsO=UY=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hfogs-0006ZN-Fq
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 16:53:06 +0000
X-Inumbo-ID: b37b4246-9769-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b37b4246-9769-11e9-8980-bc764e045a96;
 Tue, 25 Jun 2019 16:53:05 +0000 (UTC)
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: xRaoDe7GR6UwdWy/2aNAh+UUV8GhdfNkRrdfvCmL7LT7fbyumbwAl29Y4M9tmoAI7qmNmfuTzl
 UCMKL9lu+g+6DauQj+Y7bcGkouSieblX9pET5y7+3cScpcPJkDg+WNFagdvxXdxkb2vuT8BgkN
 rCGopjQwERXTwxjAkiyViB7SlxbDjYYeurA2wai+WSNvK/y+7vHB9/LaZolWIav3ZVeyUgzgKE
 t33EmiFKnlMAcfIpMDFg3vczSd3qSSu5OopJRE58HOxjcpQ8Eesyj4FK+jmHfD3QHtQVXuqAqm
 tDo=
X-SBRS: 2.7
X-MesageID: 2208380
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,416,1557201600"; 
   d="scan'208";a="2208380"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: Xen Project Community Call June 27th (instead of July 4th):
 @15:00 UTC Call for agenda items
Thread-Index: AQHVKEhcH0vW8I5ySEO7jj3plK9Veaashu6A
Date: Tue, 25 Jun 2019 16:36:25 +0000
Message-ID: <EDC3EB96-942F-484F-9EDB-F30E01151816@citrix.com>
References: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
In-Reply-To: <FEED378E-4D79-454E-8053-1B34DC0B1D9C@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.b.190609
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <F2F32C1762E0E7468E52360EC3AEEB87@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Xen Project Community Call June 27th (instead of
 July 4th): @15:00 UTC Call for agenda items
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

SGkgYWxsOg0KcGxlYXNlIGFkZCB5b3VyIGFnZW5kYSBpdGVtcy4gSSBoYWQgb25seSBPTkUgc2Vy
aWVzIHdoaWNoIHdhcyBoaWdobGlnaHRlZCBhcyBuZWVkaW5nIGF0dGVudGlvbiBmcm9tIG90aGVy
cy4gSXMgdGhpcyBzZXJpb3VzbHkgdGhlIG9ubHkgb25lPw0KUmVnYXJkcw0KTGFycw0KDQrvu79P
biAyMS8wNi8yMDE5LCAxNjo0NSwgIkxhcnMgS3VydGgiIDxsYXJzLmt1cnRoQGNpdHJpeC5jb20+
IHdyb3RlOg0KDQogICAgSGkgYWxsLA0KICAgICAgICANCiAgICBQbGVhc2UgcHJvcG9zZSB0b3Bp
Y3MgYnkgZWl0aGVyIGVkaXRpbmcgdGhlIHJ1bm5pbmcgYWdlbmRhIGRvY3VtZW50IGF0IGh0dHBz
Oi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9WLUpjdFYydkJsRW53bGlWTEJsRkxZN24v
IG9yIGJ5IHJlcGx5aW5nIHRvIHRoZSBtYWlsLg0KICAgIA0KICAgIE5vdGUgdGhhdCBjdXJyZW50
bHkgSSBoYXZlDQogICAgKiBOb3RoaW5nIHVuZGVyOiANCiAgICAgICBEKSBOZXcgU2VyaWVzIC8g
U2VyaWVzIHRoYXQgbmVlZCBhdHRlbnRpb24gLyBTZXJpZXMgdGhhdCBhcmUgaW1wb3J0YW50DQog
ICAgKiBBIHByZXAgaXRlbSBmb3IgdGhlIGRldmVsb3BlciBzdW1taXQgcHJvcG9zZWQgYnkgSmFu
IGF0IHRoZSBsYXN0IG1lZXRpbmcNCiAgICBJIGFsc28gbWFkZSBzb21lIHByb2dyZXNzIG9uIHRo
ZSBjb2RlIG9mIGNvbmR1Y3QgdG9waWMgYW5kIGFtIGFib3V0IHRvIHNlbmQgYSBtYWlsIHRvIHhl
bi1kZXZlbEANCiAgICANCiAgICBCZXN0IFJlZ2FyZHMNCiAgICBMYXJzDQogICAgICAgIA0KICAg
ICAgICA9PSBEaWFsLWluIEluZm9ybWF0aW9uID09DQogICAgICAgIA0KICAgICAgICAgIyMgTWVl
dGluZyB0aW1lDQogICAgICAgICAxNTowMCAtIDE2OjAwIFVUQw0KICAgICAgICAgRnVydGhlciBJ
bnRlcm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IA0KICAgICAgICAgaHR0cHM6Ly93d3cudGltZWFu
ZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFyPTIwMTkmbW9udGg9
NiZkYXk9MjcmaG91cj0xNSZtaW49MCZzZWM9MCZwMT0yMjUmcDI9MjI0JnAzPTI0JnA0PTE3OSZw
NT0xMzYmcDY9MzcmcDc9MzMNCiAgICAgICAgDQogICAgICAgICAjIyBEaWFsIGluIGRldGFpbHMN
CiAgICAgICAgIFdlYjogaHR0cHM6Ly93d3cuZ290b21lZXQubWUvbGFyc2t1cnRoDQogICAgICAg
IA0KICAgICAgICAgWW91IGNhbiBhbHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZS4NCiAgICAg
ICAgIEFjY2VzcyBDb2RlOiA5MDYtODg2LTk2NQ0KICAgICAgICANCiAgICAgICAgIENoaW5hIChU
b2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KICAgICAgICAgR2VybWFueTogKzQ5IDY5MiA1NzM2IDcz
MTcNCiAgICAgICAgIFBvbGFuZCAoVG9sbCBGcmVlKTogMDAgODAwIDExMjQ3NTkNCiAgICAgICAg
IFVuaXRlZCBLaW5nZG9tOiArNDQgMzMwIDIyMSAwMDg4DQogICAgICAgICBVbml0ZWQgU3RhdGVz
OiArMSAoNTcxKSAzMTctMzEyOQ0KICAgICAgICANCiAgICAgICAgIE1vcmUgcGhvbmUgbnVtYmVy
cw0KICAgICAgICAgQXVzdHJhbGlhOiArNjEgMiA5MDg3IDM2MDQNCiAgICAgICAgIEF1c3RyaWE6
ICs0MyA3IDIwODEgNTQyNw0KICAgICAgICAgQXJnZW50aW5hIChUb2xsIEZyZWUpOiAwIDgwMCA0
NDQgMzM3NQ0KICAgICAgICAgQmFocmFpbiAoVG9sbCBGcmVlKTogODAwIDgxIDExMQ0KICAgICAg
ICAgQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQogICAgICAgICBCZWxnaXVt
OiArMzIgMjggOTMgNzAxOA0KICAgICAgICAgQnJhemlsIChUb2xsIEZyZWUpOiAwIDgwMCAwNDcg
NDkwNg0KICAgICAgICAgQnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAwIDEyMCA0NDE3DQogICAg
ICAgICBDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQogICAgICAgICBDaGlsZSAoVG9sbCBGcmVl
KTogODAwIDM5NSAxNTANCiAgICAgICAgIENvbG9tYmlhIChUb2xsIEZyZWUpOiAwMSA4MDAgNTE4
IDQ0ODMNCiAgICAgICAgICBDemVjaCBSZXB1YmxpYyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0K
ICAgICAgICAgRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQogICAgICAgICBGaW5sYW5kOiArMzU4
IDkyMyAxNyAwNTY4DQogICAgICAgICBGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KICAgICAgICAg
R3JlZWNlIChUb2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQogICAgICAgICBIb25nIEtvbmcg
KFRvbGwgRnJlZSk6IDMwNzEzMTY5DQogICAgICAgICBIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYp
IDgwIDk4NiAyNTUNCiAgICAgICAgIEljZWxhbmQgKFRvbGwgRnJlZSk6IDgwMCA3MjA0DQogICAg
ICAgICBJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2NjkyNzINCiAgICAgICAgIEluZG9uZXNpYSAo
VG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KICAgICAgICAgSXJlbGFuZDogKzM1MyAxNSAz
NjAgNzI4DQogICAgICAgICBJc3JhZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCiAgICAg
ICAgIEl0YWx5OiArMzkgMCAyNDcgOTIgMTMgMDENCiAgICAgICAgIEphcGFuIChUb2xsIEZyZWUp
OiAwIDEyMCA2NjMgODAwDQogICAgICAgICBLb3JlYSwgUmVwdWJsaWMgb2YgKFRvbGwgRnJlZSk6
IDAwNzk4IDE0IDIwNyA0OTE0DQogICAgICAgICBMdXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAg
ODUxNTgNCiAgICAgICAgIE1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2ODU0DQogICAg
ICAgICBNZXhpY28gKFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KICAgICAgICAgTmV0aGVy
bGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KICAgICAgICAgTmV3IFplYWxhbmQ6ICs2NCA5IDI4MCA2
MzAyDQogICAgICAgICBOb3J3YXk6ICs0NyAyMSA5MyAzNyA1MQ0KICAgICAgICAgUGFuYW1hIChU
b2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNCiAgICAgICAgIFBlcnUgKFRvbGwgRnJlZSk6IDAg
ODAwIDc3MDIzDQogICAgICAgICBQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4MDAgMTExMCAx
NjYxDQogICAgICAgICBQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNCiAgICAgICAg
IFJvbWFuaWEgKFRvbGwgRnJlZSk6IDAgODAwIDQxMCAwMjkNCiAgICAgICAgIFJ1c3NpYW4gRmVk
ZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAgMTAwIDYyMDMNCiAgICAgICAgIFNhdWRpIEFyYWJp
YSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQogICAgICAgICBTaW5nYXBvcmUgKFRvbGwgRnJl
ZSk6IDE4MDA3MjMxMzIzDQogICAgICAgICBTb3V0aCBBZnJpY2EgKFRvbGwgRnJlZSk6IDAgODAw
IDU1NSA0NDcNCiAgICAgICAgIFNwYWluOiArMzQgOTMyIDc1IDIwMDQNCiAgICAgICAgIFN3ZWRl
bjogKzQ2IDg1MyA1MjcgODI3DQogICAgICAgICBTd2l0emVybGFuZDogKzQxIDIyNSA0NTk5IDc4
DQogICAgICAgICBUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNCiAgICAgICAgIFRo
YWlsYW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNCiAgICAgICAgIFR1cmtleSAoVG9s
bCBGcmVlKTogMDAgODAwIDQ0ODggMjM2ODMNCiAgICAgICAgIFVrcmFpbmUgKFRvbGwgRnJlZSk6
IDAgODAwIDUwIDE3MzMNCiAgICAgICAgIFVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUp
OiA4MDAgMDQ0IDQwNDM5DQogICAgICAgICBVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAx
MDE4DQogICAgICAgICBWaWV0IE5hbSAoVG9sbCBGcmVlKTogMTIyIDgwIDQ4MQ0KICAgICAgICAN
CiAgICAgICAgIEZpcnN0IEdvVG9NZWV0aW5nPyBMZXQncyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVj
azoNCiAgICAgICAgIGh0dHBzOi8vbGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNrDQog
ICAgICAgIA0KICAgICAgICANCiAgICAgICAgDQogICAgDQogICAgDQogICAgDQogICAgDQogICAg
DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
