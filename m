Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA1F7B0EE
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:56:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsWJh-0001xk-Em; Tue, 30 Jul 2019 17:53:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w1iS=V3=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hsWJf-0001xf-TV
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:53:39 +0000
X-Inumbo-ID: f4875f34-b2f2-11e9-91fe-c300499d54c0
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f4875f34-b2f2-11e9-91fe-c300499d54c0;
 Tue, 30 Jul 2019 17:53:37 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4bxnpwGR0GEovurk8tpAJXGCeKDZUOBrMrjIAOlZxpGJl80C/bcWz2VMdQ0vXvBQe5rLucxJ0H
 HUtvUIXIZ5+niTncccx9FYckmggm5KxNQ6qfghYiVjJSF2kbP6FRcZcBQkIbqwdL9xmN1+RgLz
 U3ByVCf9zKu0J6LfKwrMu/ry5FHaNJYg01+e1/YEhRYNT/tAl2qCDom28ul+2if/i7eJXVECte
 VRDpMZvM6Vn1vjJb0qEHbksk6AXNtNPsMPRm27BUSrXp9u6PogtQ+YljVjsSe1/q6dehQMjdBq
 lOo=
X-SBRS: 2.7
X-MesageID: 3629914
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,327,1559534400"; 
   d="scan'208";a="3629914"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [ANNOUNCE} Call for agenda items for Aug 1st Community Call @
 15:00 UTC
Thread-Index: AQHVRv+uPJdLyr3i6UWiZFKRTAcUVw==
Date: Tue, 30 Jul 2019 17:53:23 +0000
Message-ID: <0DB4B62F-729F-48A2-97E4-277AD7131FEA@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <C0599223A767BA4CA1E087FF83BF9D5A@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE} Call for agenda items for Aug 1st Community
 Call @ 15:00 UTC
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
 Rian Quinn <rianquinn@gmail.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 Matt Spencer <Matt.Spencer@arm.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan,
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "viktor.mitin.19@gmail.com" <viktor.mitin.19@gmail.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KdGhlIHByb3Bvc2VkIGFnZW5kYSBpcyBpbiBodHRwczovL2NyeXB0cGFkLmZyL3Bh
ZC8jLzIvcGFkL2VkaXQvYXJmYTJQcjNEMnVJdUVOM0VXTlRkT1ZULw0KQWx0ZXJuYXRpdmVseSwg
eW91IGNhbiByZXBseSB0byB0aGlzIG1haWwgZGlyZWN0bHkNCkFnZW5kYSBpdGVtcyBhcHByZWNp
YXRlZCBieSB0b21vcnJvdw0KUmVnYXJkcw0KTGFycw0KUC5TLjogSWYgeW91IHdhbnQgdG8gYmUg
YWRkZWQgb3IgcmVtb3ZlZCBmcm9tIHRoZSBDQyBsaXN0IHBsZWFzZSByZXBseSBwcml2YXRlbHkN
Cg0KPT0gRGlhbC1pbiBJbmZvcm1hdGlvbiA9PQ0KDQogIyMgTWVldGluZyB0aW1lDQogMTU6MDAg
LSAxNjowMCBVVEMNCiBGdXJ0aGVyIEludGVybmF0aW9uYWwgbWVldGluZyB0aW1lczogaHR0cHM6
Ly93d3cudGltZWFuZGRhdGUuY29tL3dvcmxkY2xvY2svbWVldGluZ2RldGFpbHMuaHRtbD95ZWFy
PTIwMTkmbW9udGg9OCZkYXk9MSZob3VyPTE1Jm1pbj0wJnNlYz0wJnAxPTIyNSZwMj0yMjQmcDM9
MjQmcDQ9MTc5JnA1PTEzNiZwNj0zNyZwNz0zMw0KDQoNCiAjIyBEaWFsIGluIGRldGFpbHMNCiBX
ZWI6IGh0dHBzOi8vd3d3LmdvdG9tZWV0Lm1lL2xhcnNrdXJ0aA0KDQogWW91IGNhbiBhbHNvIGRp
YWwgaW4gdXNpbmcgeW91ciBwaG9uZS4NCiBBY2Nlc3MgQ29kZTogOTA2LTg4Ni05NjUNCg0KIENo
aW5hIChUb2xsIEZyZWUpOiA0MDA4IDgxMTA4NA0KIEdlcm1hbnk6ICs0OSA2OTIgNTczNiA3MzE3
DQogUG9sYW5kIChUb2xsIEZyZWUpOiAwMCA4MDAgMTEyNDc1OQ0KIFVuaXRlZCBLaW5nZG9tOiAr
NDQgMzMwIDIyMSAwMDg4DQogVW5pdGVkIFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkNCg0KIE1v
cmUgcGhvbmUgbnVtYmVycw0KIEF1c3RyYWxpYTogKzYxIDIgOTA4NyAzNjA0DQogQXVzdHJpYTog
KzQzIDcgMjA4MSA1NDI3DQogQXJnZW50aW5hIChUb2xsIEZyZWUpOiAwIDgwMCA0NDQgMzM3NQ0K
IEJhaHJhaW4gKFRvbGwgRnJlZSk6IDgwMCA4MSAxMTENCiBCZWxhcnVzIChUb2xsIEZyZWUpOiA4
IDgyMCAwMDExIDA0MDANCiBCZWxnaXVtOiArMzIgMjggOTMgNzAxOA0KIEJyYXppbCAoVG9sbCBG
cmVlKTogMCA4MDAgMDQ3IDQ5MDYNCiBCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4MDAgMTIwIDQ0
MTcNCiBDYW5hZGE6ICsxICg2NDcpIDQ5Ny05MzkxDQogQ2hpbGUgKFRvbGwgRnJlZSk6IDgwMCAz
OTUgMTUwDQogQ29sb21iaWEgKFRvbGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KICBDemVjaCBS
ZXB1YmxpYyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0KIERlbm1hcms6ICs0NSAzMiA3MiAwMyA4
Mg0KIEZpbmxhbmQ6ICszNTggOTIzIDE3IDA1NjgNCiBGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0K
IEdyZWVjZSAoVG9sbCBGcmVlKTogMDAgODAwIDQ0MTQgMzgzOA0KIEhvbmcgS29uZyAoVG9sbCBG
cmVlKTogMzA3MTMxNjkNCiBIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCiBJ
Y2VsYW5kIChUb2xsIEZyZWUpOiA4MDAgNzIwNA0KIEluZGlhIChUb2xsIEZyZWUpOiAxODAwMjY2
OTI3Mg0KIEluZG9uZXNpYSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KIElyZWxhbmQ6
ICszNTMgMTUgMzYwIDcyOA0KIElzcmFlbCAoVG9sbCBGcmVlKTogMSA4MDkgNDU0IDgzMA0KIEl0
YWx5OiArMzkgMCAyNDcgOTIgMTMgMDENCiBKYXBhbiAoVG9sbCBGcmVlKTogMCAxMjAgNjYzIDgw
MA0KIEtvcmVhLCBSZXB1YmxpYyBvZiAoVG9sbCBGcmVlKTogMDA3OTggMTQgMjA3IDQ5MTQNCiBM
dXhlbWJvdXJnIChUb2xsIEZyZWUpOiA4MDAgODUxNTgNCiBNYWxheXNpYSAoVG9sbCBGcmVlKTog
MSA4MDAgODEgNjg1NA0KIE1leGljbyAoVG9sbCBGcmVlKTogMDEgODAwIDUyMiAxMTMzDQogTmV0
aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3Nw0KIE5ldyBaZWFsYW5kOiArNjQgOSAyODAgNjMwMg0K
IE5vcndheTogKzQ3IDIxIDkzIDM3IDUxDQogUGFuYW1hIChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2
IDc5MjgNCiBQZXJ1IChUb2xsIEZyZWUpOiAwIDgwMCA3NzAyMw0KIFBoaWxpcHBpbmVzIChUb2xs
IEZyZWUpOiAxIDgwMCAxMTEwIDE2NjENCiBQb3J0dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1
NzUNCiBSb21hbmlhIChUb2xsIEZyZWUpOiAwIDgwMCA0MTAgMDI5DQogUnVzc2lhbiBGZWRlcmF0
aW9uIChUb2xsIEZyZWUpOiA4IDgwMCAxMDAgNjIwMw0KIFNhdWRpIEFyYWJpYSAoVG9sbCBGcmVl
KTogODAwIDg0NCAzNjMzDQogU2luZ2Fwb3JlIChUb2xsIEZyZWUpOiAxODAwNzIzMTMyMw0KIFNv
dXRoIEFmcmljYSAoVG9sbCBGcmVlKTogMCA4MDAgNTU1IDQ0Nw0KIFNwYWluOiArMzQgOTMyIDc1
IDIwMDQNCiBTd2VkZW46ICs0NiA4NTMgNTI3IDgyNw0KIFN3aXR6ZXJsYW5kOiArNDEgMjI1IDQ1
OTkgNzgNCiBUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4NTQNCiBUaGFpbGFuZCAoVG9s
bCBGcmVlKTogMDAxIDgwMCAwMTEgMDIzDQogVHVya2V5IChUb2xsIEZyZWUpOiAwMCA4MDAgNDQ4
OCAyMzY4Mw0KIFVrcmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3MzMNCiBVbml0ZWQgQXJh
YiBFbWlyYXRlcyAoVG9sbCBGcmVlKTogODAwIDA0NCA0MDQzOQ0KIFVydWd1YXkgKFRvbGwgRnJl
ZSk6IDAwMDQgMDE5IDEwMTgNCiBWaWV0IE5hbSAoVG9sbCBGcmVlKTogMTIyIDgwIDQ4MQ0KDQog
Rmlyc3QgR29Ub01lZXRpbmc/IExldCdzIGRvIGEgcXVpY2sgc3lzdGVtIGNoZWNrOg0KIGh0dHBz
Oi8vbGluay5nb3RvbWVldGluZy5jb20vc3lzdGVtLWNoZWNrDQoNCg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
