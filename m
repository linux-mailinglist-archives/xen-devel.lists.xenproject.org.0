Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D9A8521
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:07:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5VuM-0006bL-KF; Wed, 04 Sep 2019 14:05:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WgxQ=W7=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1i5VuL-0006bB-Ld
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:05:13 +0000
X-Inumbo-ID: 01f01292-cf1d-11e9-abb6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 01f01292-cf1d-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567605910;
 h=from:to:cc:subject:date:message-id:content-id:
 content-transfer-encoding:mime-version;
 bh=pg88b9DhSRnnK94aoNw1g25kogulmYZ3q48cvRQoUeY=;
 b=FJaxm7tXQDXJWW1yg2l9IUQ6+MiS+ul1uaWEpBQFx0XQVmf6gnDXMqMu
 OrbqtEWUlklH9/CzNVcrRV7c9XZhJrfIfqjFWyjT8XRaLFEP4q23kXAP9
 JzNrFlL/Ua/Bfz3c/3WLlsLvEnhMqcjGmqtWTfV08+8ZDDZT80d0moJ8G Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Jg6ir4QPiXii8tOAEUAkA9/Y1zj4OMrtzuAEKRR1nSCHJtkJM11OwLa08D27cv9OmiLwBAaPpT
 RQzjQ0aiyr7mg22qO7yxw5/mk1EE+wy4TjiDh9On3p8sqziAkqeeuLAuGYaTVczXf2kjVdYX6z
 IVvWlc60vXKtAs+oDheq968GV12nMEVFl+6vrRvEfP0HImxgvv0tCHQ9Xmd8Ttxdnh4SQSB0tN
 bAKhB38Zt1n2uEqBFf/dR8ZoMn6W0xiUF6hZnY225ZzSPfwZimxyLB9ehIxof70LYJEx+s6Sou
 fRw=
X-SBRS: 2.7
X-MesageID: 5391242
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,467,1559534400"; 
   d="scan'208";a="5391242"
From: Lars Kurth <lars.kurth@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Thread-Topic: [ANNOUNCE] Call for agenda items for September 5th Community
 Call @ 15:00 UTC
Thread-Index: AQHVYynAq4l5UVCYY0OMdHHMFzgkkg==
Date: Wed, 4 Sep 2019 14:05:05 +0000
Message-ID: <6DA859DE-62FD-48C1-BBEE-C7A63D751B3E@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.d.190811
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <A440D2B59069404D944534B46061BB5A@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [ANNOUNCE] Call for agenda items for September 5th
 Community Call @ 15:00 UTC
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
 Doug Goldstein <cardoe@cardoe.com>, Rich Persaud <persaur@gmail.com>,
 "anastassios.nanos@onapp.com" <anastassios.nanos@onapp.com>,
 "mirela.simonovic@aggios.com" <mirela.simonovic@aggios.com>,
 "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, "Ji,
 John" <john.ji@intel.com>, "robin.randhawa@arm.com" <robin.randhawa@arm.com>,
 "daniel.kiper@oracle.com" <daniel.kiper@oracle.com>, Matt
 Spencer <Matt.Spencer@arm.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 "vfachin@de.adit-jv.com" <vfachin@de.adit-jv.com>,
 "intel-xen@intel.com" <intel-xen@intel.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>, Juergen Gross <jgross@suse.com>,
 Sergey Dyasli <sergey.dyasli@citrix.com>, Brian
 Woods <brian.woods@amd.com>, Julien Grall <julien.grall@arm.com>,
 Jeff Kubascik <Jeff.Kubascik@dornerworks.com>, "Natarajan, 
 Janakarajan" <jnataraj@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgYWxsLA0KDQp0aGUgcHJvcG9zZWQgYWdlbmRhIGlzIGluIGh0dHBzOi8vY3J5cHRwYWQuZnIv
cGFkLyMvMi9wYWQvZWRpdC94d1VUbTZiNWY1aWpQVFFjRjlJRmdrQmcvIGFuZCB5b3UgY2FuIGVk
aXQgdG8gYWRkIGl0ZW1zDQpBbHRlcm5hdGl2ZWx5LCB5b3UgY2FuIHJlcGx5IHRvIHRoaXMgbWFp
bCBkaXJlY3RseQ0KQWdlbmRhIGl0ZW1zIGFwcHJlY2lhdGVkIEFTQVA6IHBsZWFzZSBwdXQgeW91
ciBuYW1lIGJlc2lkZXMgaXRlbXMgaWYgeW91IGVkaXQgdGhlIGRvY3VtZW50DQoNCkFwb2xvZ2ll
cyBmb3IgZHJvcHBpbmcgdGhlIGJhbGwgb24gdGhpcyBvbmUsIEkgZm9yZ290IHRvIGFkZCB0aGUg
Q0MgbGlzdCB0byB0aGUgZWFybGllciBtYWlsIEkgc2VudA0KDQpSZWdhcmRzDQpMYXJzDQpQLlMu
OiBJZiB5b3Ugd2FudCB0byBiZSBhZGRlZCBvciByZW1vdmVkIGZyb20gdGhlIENDIGxpc3QgcGxl
YXNlIHJlcGx5IHByaXZhdGVseQ0KDQo9PSBEaWFsLWluIEluZm9ybWF0aW9uID09DQoNCiMjIE1l
ZXRpbmcgdGltZQ0KMTU6MDAgLSAxNjowMCBVVEMNCkZ1cnRoZXIgSW50ZXJuYXRpb25hbCBtZWV0
aW5nIHRpbWVzOiBodHRwczovL3d3dy50aW1lYW5kZGF0ZS5jb20vd29ybGRjbG9jay9tZWV0aW5n
ZGV0YWlscy5odG1sP3llYXI9MjAxOSZtb250aD05JmRheT01JmhvdXI9MTUmbWluPTAmc2VjPTAm
cDE9MjI1JnAyPTIyNCZwMz0yNCZwND0xNzkmcDU9MTM2JnA2PTM3JnA3PTMzDQoNCiMjIERpYWwg
aW4gZGV0YWlscw0KV2ViOiBodHRwczovL3d3dy5nb3RvbWVldC5tZS9sYXJza3VydGgNCg0KWW91
IGNhbiBhbHNvIGRpYWwgaW4gdXNpbmcgeW91ciBwaG9uZS4NCkFjY2VzcyBDb2RlOiA5MDYtODg2
LTk2NQ0KDQpDaGluYSAoVG9sbCBGcmVlKTogNDAwOCA4MTEwODQNCkdlcm1hbnk6ICs0OSA2OTIg
NTczNiA3MzE3DQpQb2xhbmQgKFRvbGwgRnJlZSk6IDAwIDgwMCAxMTI0NzU5DQpVbml0ZWQgS2lu
Z2RvbTogKzQ0IDMzMCAyMjEgMDA4OA0KVW5pdGVkIFN0YXRlczogKzEgKDU3MSkgMzE3LTMxMjkN
Cg0KTW9yZSBwaG9uZSBudW1iZXJzDQpBdXN0cmFsaWE6ICs2MSAyIDkwODcgMzYwNA0KQXVzdHJp
YTogKzQzIDcgMjA4MSA1NDI3DQpBcmdlbnRpbmEgKFRvbGwgRnJlZSk6IDAgODAwIDQ0NCAzMzc1
DQpCYWhyYWluIChUb2xsIEZyZWUpOiA4MDAgODEgMTExDQpCZWxhcnVzIChUb2xsIEZyZWUpOiA4
IDgyMCAwMDExIDA0MDANCkJlbGdpdW06ICszMiAyOCA5MyA3MDE4DQpCcmF6aWwgKFRvbGwgRnJl
ZSk6IDAgODAwIDA0NyA0OTA2DQpCdWxnYXJpYSAoVG9sbCBGcmVlKTogMDA4MDAgMTIwIDQ0MTcN
CkNhbmFkYTogKzEgKDY0NykgNDk3LTkzOTENCkNoaWxlIChUb2xsIEZyZWUpOiA4MDAgMzk1IDE1
MA0KQ29sb21iaWEgKFRvbGwgRnJlZSk6IDAxIDgwMCA1MTggNDQ4Mw0KICBDemVjaCBSZXB1Ymxp
YyAoVG9sbCBGcmVlKTogODAwIDUwMDQ0OA0KRGVubWFyazogKzQ1IDMyIDcyIDAzIDgyDQpGaW5s
YW5kOiArMzU4IDkyMyAxNyAwNTY4DQpGcmFuY2U6ICszMyAxNzAgOTUwIDU5NA0KR3JlZWNlIChU
b2xsIEZyZWUpOiAwMCA4MDAgNDQxNCAzODM4DQpIb25nIEtvbmcgKFRvbGwgRnJlZSk6IDMwNzEz
MTY5DQpIdW5nYXJ5IChUb2xsIEZyZWUpOiAoMDYpIDgwIDk4NiAyNTUNCkljZWxhbmQgKFRvbGwg
RnJlZSk6IDgwMCA3MjA0DQpJbmRpYSAoVG9sbCBGcmVlKTogMTgwMDI2NjkyNzINCkluZG9uZXNp
YSAoVG9sbCBGcmVlKTogMDA3IDgwMyAwMjAgNTM3NQ0KSXJlbGFuZDogKzM1MyAxNSAzNjAgNzI4
DQpJc3JhZWwgKFRvbGwgRnJlZSk6IDEgODA5IDQ1NCA4MzANCkl0YWx5OiArMzkgMCAyNDcgOTIg
MTMgMDENCkphcGFuIChUb2xsIEZyZWUpOiAwIDEyMCA2NjMgODAwDQpLb3JlYSwgUmVwdWJsaWMg
b2YgKFRvbGwgRnJlZSk6IDAwNzk4IDE0IDIwNyA0OTE0DQpMdXhlbWJvdXJnIChUb2xsIEZyZWUp
OiA4MDAgODUxNTgNCk1hbGF5c2lhIChUb2xsIEZyZWUpOiAxIDgwMCA4MSA2ODU0DQpNZXhpY28g
KFRvbGwgRnJlZSk6IDAxIDgwMCA1MjIgMTEzMw0KTmV0aGVybGFuZHM6ICszMSAyMDcgOTQxIDM3
Nw0KTmV3IFplYWxhbmQ6ICs2NCA5IDI4MCA2MzAyDQpOb3J3YXk6ICs0NyAyMSA5MyAzNyA1MQ0K
UGFuYW1hIChUb2xsIEZyZWUpOiAwMCA4MDAgMjI2IDc5MjgNClBlcnUgKFRvbGwgRnJlZSk6IDAg
ODAwIDc3MDIzDQpQaGlsaXBwaW5lcyAoVG9sbCBGcmVlKTogMSA4MDAgMTExMCAxNjYxDQpQb3J0
dWdhbCAoVG9sbCBGcmVlKTogODAwIDgxOSA1NzUNClJvbWFuaWEgKFRvbGwgRnJlZSk6IDAgODAw
IDQxMCAwMjkNClJ1c3NpYW4gRmVkZXJhdGlvbiAoVG9sbCBGcmVlKTogOCA4MDAgMTAwIDYyMDMN
ClNhdWRpIEFyYWJpYSAoVG9sbCBGcmVlKTogODAwIDg0NCAzNjMzDQpTaW5nYXBvcmUgKFRvbGwg
RnJlZSk6IDE4MDA3MjMxMzIzDQpTb3V0aCBBZnJpY2EgKFRvbGwgRnJlZSk6IDAgODAwIDU1NSA0
NDcNClNwYWluOiArMzQgOTMyIDc1IDIwMDQNClN3ZWRlbjogKzQ2IDg1MyA1MjcgODI3DQpTd2l0
emVybGFuZDogKzQxIDIyNSA0NTk5IDc4DQpUYWl3YW4gKFRvbGwgRnJlZSk6IDAgODAwIDY2NiA4
NTQNClRoYWlsYW5kIChUb2xsIEZyZWUpOiAwMDEgODAwIDAxMSAwMjMNClR1cmtleSAoVG9sbCBG
cmVlKTogMDAgODAwIDQ0ODggMjM2ODMNClVrcmFpbmUgKFRvbGwgRnJlZSk6IDAgODAwIDUwIDE3
MzMNClVuaXRlZCBBcmFiIEVtaXJhdGVzIChUb2xsIEZyZWUpOiA4MDAgMDQ0IDQwNDM5DQpVcnVn
dWF5IChUb2xsIEZyZWUpOiAwMDA0IDAxOSAxMDE4DQpWaWV0IE5hbSAoVG9sbCBGcmVlKTogMTIy
IDgwIDQ4MQ0KDQpGaXJzdCBHb1RvTWVldGluZz8gTGV0J3MgZG8gYSBxdWljayBzeXN0ZW0gY2hl
Y2s6DQpodHRwczovL2xpbmsuZ290b21lZXRpbmcuY29tL3N5c3RlbS1jaGVjaw0KDQoNCiAgICAN
Cg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
