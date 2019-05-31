Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA0305DA
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 02:39:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWVVy-0001uz-AN; Fri, 31 May 2019 00:35:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aIZ5=T7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hWVVw-0001uu-Rq
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 00:35:20 +0000
X-Inumbo-ID: f59fb57e-833b-11e9-af9e-e734dd72d722
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f59fb57e-833b-11e9-af9e-e734dd72d722;
 Fri, 31 May 2019 00:35:16 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: xXrJDNU4Z2+/OdyS1G2w843DF7thVbzOvOIsIiCpXBJIMp5n4sB7qW4pSNLYWrOhHesrCBq7ma
 REH50qP0iz98RAvsTn4DJQpP04KM/Be7Yfploo0d6kAQKG2M3c17HdhAm/pH3sRHbR67bJD25c
 eVajRjjtu7QReMC1DOrjWkGKxS0eCEaIdpEtjISbnGD9SXwvmfVvX4Iign0Z4mJqqw4sqfdMwY
 Dp93GKFxwOUnpaL9xZEtkTsI+Bfe30WbIiPl088uK/86iUavKxsJt4uQBEnvVoMGF9rORCyElO
 Tz8=
X-SBRS: 2.7
X-MesageID: 1113046
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,533,1549947600"; 
   d="scan'208";a="1113046"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
 <committers@xenproject.org>
Thread-Topic: Xen Project Community Call June 6th: @15:00 UTC Call for agenda
 items
Thread-Index: AQHVF0i0wxsTSbqQdEi32qL4RfQjsw==
Date: Fri, 31 May 2019 00:35:11 +0000
Message-ID: <B8AF45C4-A5CB-46D9-A35E-00C90B757CD7@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.a.190512
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <502CBED62103084FA4CECCAC53BCA26A@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] Xen Project Community Call June 6th: @15:00 UTC Call
 for agenda items
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

SGkgYWxsLA0KDQpQbGVhc2UgcHJvcG9zZSB0b3BpY3MgYnkgZWl0aGVyIGVkaXRpbmcgdGhlIHJ1
bm5pbmcgYWdlbmRhIGRvY3VtZW50IGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQv
ZWRpdC9XWnIyVlRkZm1hUGR2SXhqWHArY2dTRi0gb3IgYnkgcmVwbHlpbmcgdG8gdGhlIG1haWwu
DQpJZGVhbGx5IGJ5IFR1ZXNkYXkhDQpOb3RlIHRoYXQgSSBhbSB1c2luZyBhbm90aGVyIHNoYXJp
bmcgbWVjaGFuaXNtIGFzIHBlciByZXF1ZXN0LiBMZXQgbWUga25vdyBpZiB5b3UgaGF2ZSBkaWZm
aWN1bHRpZXMNCg0KQmVzdCBSZWdhcmRzDQpMYXJzDQoNCj09IERpYWwtaW4gSW5mb3JtYXRpb24g
PT0NCg0KICMjIE1lZXRpbmcgdGltZQ0KIDE1OjAwIC0gMTY6MDAgVVRDDQogRnVydGhlciBJbnRl
cm5hdGlvbmFsIG1lZXRpbmcgdGltZXM6IA0KIGh0dHBzOi8vd3d3LnRpbWVhbmRkYXRlLmNvbS93
b3JsZGNsb2NrL21lZXRpbmdkZXRhaWxzLmh0bWw/eWVhcj0yMDE5Jm1vbnRoPTYmZGF5PTYmaG91
cj0xNSZtaW49MCZzZWM9MCZwMT0yMjUmcDI9MjI0JnAzPTI0JnA0PTE3OSZwNT0xMzYmcDY9Mzcm
cDc9MzMNCg0KDQogIyMgRGlhbCBpbiBkZXRhaWxzDQogV2ViOiBodHRwczovL3d3dy5nb3RvbWVl
dC5tZS9sYXJza3VydGgNCg0KIFlvdSBjYW4gYWxzbyBkaWFsIGluIHVzaW5nIHlvdXIgcGhvbmUu
DQogQWNjZXNzIENvZGU6IDkwNi04ODYtOTY1DQoNCiBDaGluYSAoVG9sbCBGcmVlKTogNDAwOCA4
MTEwODQNCiBHZXJtYW55OiArNDkgNjkyIDU3MzYgNzMxNw0KIFBvbGFuZCAoVG9sbCBGcmVlKTog
MDAgODAwIDExMjQ3NTkNCiBVbml0ZWQgS2luZ2RvbTogKzQ0IDMzMCAyMjEgMDA4OA0KIFVuaXRl
ZCBTdGF0ZXM6ICsxICg1NzEpIDMxNy0zMTI5DQoNCiBNb3JlIHBob25lIG51bWJlcnMNCiBBdXN0
cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KIEF1c3RyaWE6ICs0MyA3IDIwODEgNTQyNw0KIEFyZ2Vu
dGluYSAoVG9sbCBGcmVlKTogMCA4MDAgNDQ0IDMzNzUNCiBCYWhyYWluIChUb2xsIEZyZWUpOiA4
MDAgODEgMTExDQogQmVsYXJ1cyAoVG9sbCBGcmVlKTogOCA4MjAgMDAxMSAwNDAwDQogQmVsZ2l1
bTogKzMyIDI4IDkzIDcwMTgNCiBCcmF6aWwgKFRvbGwgRnJlZSk6IDAgODAwIDA0NyA0OTA2DQog
QnVsZ2FyaWEgKFRvbGwgRnJlZSk6IDAwODAwIDEyMCA0NDE3DQogQ2FuYWRhOiArMSAoNjQ3KSA0
OTctOTM5MQ0KIENoaWxlIChUb2xsIEZyZWUpOiA4MDAgMzk1IDE1MA0KIENvbG9tYmlhIChUb2xs
IEZyZWUpOiAwMSA4MDAgNTE4IDQ0ODMNCiAgQ3plY2ggUmVwdWJsaWMgKFRvbGwgRnJlZSk6IDgw
MCA1MDA0NDgNCiBEZW5tYXJrOiArNDUgMzIgNzIgMDMgODINCiBGaW5sYW5kOiArMzU4IDkyMyAx
NyAwNTY4DQogRnJhbmNlOiArMzMgMTcwIDk1MCA1OTQNCiBHcmVlY2UgKFRvbGwgRnJlZSk6IDAw
IDgwMCA0NDE0IDM4MzgNCiBIb25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEzMTY5DQogSHVuZ2Fy
eSAoVG9sbCBGcmVlKTogKDA2KSA4MCA5ODYgMjU1DQogSWNlbGFuZCAoVG9sbCBGcmVlKTogODAw
IDcyMDQNCiBJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2NjkyNzINCiBJbmRvbmVzaWEgKFRvbGwg
RnJlZSk6IDAwNyA4MDMgMDIwIDUzNzUNCiBJcmVsYW5kOiArMzUzIDE1IDM2MCA3MjgNCiBJc3Jh
ZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCiBJdGFseTogKzM5IDAgMjQ3IDkyIDEzIDAx
DQogSmFwYW4gKFRvbGwgRnJlZSk6IDAgMTIwIDY2MyA4MDANCiBLb3JlYSwgUmVwdWJsaWMgb2Yg
KFRvbGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQogTHV4ZW1ib3VyZyAoVG9sbCBGcmVlKTog
ODAwIDg1MTU4DQogTWFsYXlzaWEgKFRvbGwgRnJlZSk6IDEgODAwIDgxIDY4NTQNCiBNZXhpY28g
KFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KIE5ldGhlcmxhbmRzOiArMzEgMjA3IDk0MSAz
NzcNCiBOZXcgWmVhbGFuZDogKzY0IDkgMjgwIDYzMDINCiBOb3J3YXk6ICs0NyAyMSA5MyAzNyA1
MQ0KIFBhbmFtYSAoVG9sbCBGcmVlKTogMDAgODAwIDIyNiA3OTI4DQogUGVydSAoVG9sbCBGcmVl
KTogMCA4MDAgNzcwMjMNCiBQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4MDAgMTExMCAxNjYx
DQogUG9ydHVnYWwgKFRvbGwgRnJlZSk6IDgwMCA4MTkgNTc1DQogUm9tYW5pYSAoVG9sbCBGcmVl
KTogMCA4MDAgNDEwIDAyOQ0KIFJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAg
MTAwIDYyMDMNCiBTYXVkaSBBcmFiaWEgKFRvbGwgRnJlZSk6IDgwMCA4NDQgMzYzMw0KIFNpbmdh
cG9yZSAoVG9sbCBGcmVlKTogMTgwMDcyMzEzMjMNCiBTb3V0aCBBZnJpY2EgKFRvbGwgRnJlZSk6
IDAgODAwIDU1NSA0NDcNCiBTcGFpbjogKzM0IDkzMiA3NSAyMDA0DQogU3dlZGVuOiArNDYgODUz
IDUyNyA4MjcNCiBTd2l0emVybGFuZDogKzQxIDIyNSA0NTk5IDc4DQogVGFpd2FuIChUb2xsIEZy
ZWUpOiAwIDgwMCA2NjYgODU0DQogVGhhaWxhbmQgKFRvbGwgRnJlZSk6IDAwMSA4MDAgMDExIDAy
Mw0KIFR1cmtleSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0ODggMjM2ODMNCiBVa3JhaW5lIChUb2xs
IEZyZWUpOiAwIDgwMCA1MCAxNzMzDQogVW5pdGVkIEFyYWIgRW1pcmF0ZXMgKFRvbGwgRnJlZSk6
IDgwMCAwNDQgNDA0MzkNCiBVcnVndWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAxMDE4DQogVmll
dCBOYW0gKFRvbGwgRnJlZSk6IDEyMiA4MCA0ODENCg0KIEZpcnN0IEdvVG9NZWV0aW5nPyBMZXQn
cyBkbyBhIHF1aWNrIHN5c3RlbSBjaGVjazoNCiBodHRwczovL2xpbmsuZ290b21lZXRpbmcuY29t
L3N5c3RlbS1jaGVjaw0KDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
