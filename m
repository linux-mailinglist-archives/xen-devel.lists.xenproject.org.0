Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276D92330CA
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 13:13:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k16Uv-00061b-5o; Thu, 30 Jul 2020 11:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uTMv=BJ=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k16Ut-00061W-8b
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 11:13:15 +0000
X-Inumbo-ID: a8ec8026-d255-11ea-8d32-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8ec8026-d255-11ea-8d32-bc764e2007e4;
 Thu, 30 Jul 2020 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596107594;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6F05LD0jNoU2E7I3JKYZPhwUR+cfE3s3Mv/BGlzf/cM=;
 b=Z0jqXWBIgvdhq9rkCi7/ENpH25k7rPZiHEX2C85X+claL6j3x7mHp+6U
 UFzNOIbWgfT7Jbn2LKAngfny3Fpw0o202UH3hpfmXTxp3jOuaqVtDOdsP
 jYLpiZATDRIKJowusOqc3y32ie3K4MRgWI2i9KOgPMcOXi58/9zeYWthL M=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: HLXkWDxgOvLKURf//whfEZ1QG0TsypSbBRPGutWNghswsf+WA/18+OIq4445vyO2rafVZYTEcK
 BEoizpzip0vrBz6Y7YVNDpYTdZEJtvDMEg0G/PkKtOS40kx+y5Grm8BeOKX3rKdigammz+hS2l
 YDtBwRPbZxDAWlaQgTZyQ1UTpCPM1+lgUVk3mZEv2H0Bx9lBhxltVaehorPYeodHzq4X8dUtcr
 OAt/dZOl0y7j+6bVoelLfy4Upc+0v32PwgjKSfe+PVYF8M82BSVcFYk4IKr6s6btMqRfspkVWc
 YuE=
X-SBRS: 2.7
X-MesageID: 23857264
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="23857264"
From: George Dunlap <George.Dunlap@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: kernel-doc and xen.git
Thread-Topic: kernel-doc and xen.git
Thread-Index: AQHWZhCpvoHj9qYsqUS/BmcPWnpp8Kkf1yeA
Date: Thu, 30 Jul 2020 11:13:09 +0000
Message-ID: <785FBD2D-A67C-4740-9C5B-2ECCD0AEBFFC@citrix.com>
References: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007291644330.1767@sstabellini-ThinkPad-T480s>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <55DBF837FFC50D4686883587E26BF07B@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Committers <committers@xenproject.org>,
 "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDMwLCAyMDIwLCBhdCAyOjI3IEFNLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNz
dGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gSGkgYWxsLA0KPiANCj4gSSB3b3Vs
ZCBsaWtlIHRvIGFzayBmb3IgeW91ciBmZWVkYmFjayBvbiB0aGUgYWRvcHRpb24gb2YgdGhlIGtl
cm5lbC1kb2MNCj4gZm9ybWF0IGZvciBpbi1jb2RlIGNvbW1lbnRzLg0KPiANCj4gSW4gdGhlIEZ1
U2EgU0lHIHdlIGhhdmUgc3RhcnRlZCBsb29raW5nIGludG8gRnVTYSBkb2N1bWVudHMgZm9yIFhl
bi4gT25lDQo+IG9mIHRoZSB0aGluZ3Mgd2UgYXJlIGludmVzdGlnYXRpbmcgYXJlIHdheXMgdG8g
bGluayB0aGVzZSBkb2N1bWVudHMgdG8NCj4gaW4tY29kZSBjb21tZW50cyBpbiB4ZW4uZ2l0IGFu
ZCB2aWNlIHZlcnNhLg0KPiANCj4gSW4gdGhpcyBjb250ZXh0LCBBbmRyZXcgQ29vcGVyIHN1Z2dl
c3RlZCB0byBoYXZlIGEgbG9vayBhdCAia2VybmVsLWRvYyINCj4gWzFdIGR1cmluZyBvbmUgb2Yg
dGhlIHZpcnR1YWwgYmVlciBzZXNzaW9ucyBhdCB0aGUgbGFzdCBYZW4gU3VtbWl0Lg0KPiANCj4g
SSBkaWQgZ2l2ZSBhIGxvb2sgYXQga2VybmVsLWRvYyBhbmQgaXQgaXMgdmVyeSBwcm9taXNpbmcu
IGtlcm5lbC1kb2MgaXMNCj4gYSBzY3JpcHQgdGhhdCBjYW4gZ2VuZXJhdGUgbmljZSByc3QgdGV4
dCBkb2N1bWVudHMgZnJvbSBpbi1jb2RlDQo+IGNvbW1lbnRzLiAoVGhlIGdlbmVyYXRlZCByc3Qg
ZmlsZXMgY2FuIHRoZW4gYmUgdXNlZCBhcyBpbnB1dCBmb3Igc3BoaW54DQo+IHRvIGdlbmVyYXRl
IGh0bWwgZG9jcy4pIFRoZSBjb21tZW50IHN5bnRheCBbMl0gaXMgc2ltcGxlIGFuZCBzaW1pbGFy
IHRvDQo+IERveHlnZW46DQo+IA0KPiAgICAvKioNCj4gICAgICogZnVuY3Rpb25fbmFtZSgpIC0g
QnJpZWYgZGVzY3JpcHRpb24gb2YgZnVuY3Rpb24uDQo+ICAgICAqIEBhcmcxOiBEZXNjcmliZSB0
aGUgZmlyc3QgYXJndW1lbnQuDQo+ICAgICAqIEBhcmcyOiBEZXNjcmliZSB0aGUgc2Vjb25kIGFy
Z3VtZW50Lg0KPiAgICAgKiAgICAgICAgT25lIGNhbiBwcm92aWRlIG11bHRpcGxlIGxpbmUgZGVz
Y3JpcHRpb25zDQo+ICAgICAqICAgICAgICBmb3IgYXJndW1lbnRzLg0KPiAgICAgKi8NCj4gDQo+
IGtlcm5lbC1kb2MgaXMgYWN0dWFsbHkgYmV0dGVyIHRoYW4gRG94eWdlbiBiZWNhdXNlIGl0IGlz
IGEgbXVjaCBzaW1wbGVyDQo+IHRvb2wsIG9uZSB3ZSBjb3VsZCBjdXN0b21pemUgdG8gb3VyIG5l
ZWRzIGFuZCB3aXRoIHByZWRpY3RhYmxlIG91dHB1dC4NCj4gU3BlY2lmaWNhbGx5LCB3ZSBjb3Vs
ZCBhZGQgdGhlIHRhZ2dpbmcsIG51bWJlcmluZywgYW5kIHJlZmVyZW5jaW5nDQo+IHJlcXVpcmVk
IGJ5IEZ1U2EgcmVxdWlyZW1lbnQgZG9jdW1lbnRzLg0KPiANCj4gSSB3b3VsZCBsaWtlIHlvdXIg
ZmVlZGJhY2sgb24gd2hldGhlciBpdCB3b3VsZCBiZSBnb29kIHRvIHN0YXJ0DQo+IGNvbnZlcnRp
bmcgeGVuLmdpdCBpbi1jb2RlIGNvbW1lbnRzIHRvIHRoZSBrZXJuZWwtZG9jIGZvcm1hdCBzbyB0
aGF0DQo+IHByb3BlciBkb2N1bWVudHMgY2FuIGJlIGdlbmVyYXRlZCBvdXQgb2YgdGhlbS4gT25l
IGRheSB3ZSBjb3VsZCBpbXBvcnQNCj4ga2VybmVsLWRvYyBpbnRvIHhlbi5naXQvc2NyaXB0cyBh
bmQgdXNlIGl0IHRvIGdlbmVyYXRlIGEgc2V0IG9mIGh0bWwNCj4gZG9jdW1lbnRzIHZpYSBzcGhp
bnguDQoNCmBnaXQtZ3JlcCDigJheL1wqXCok4oCZIGAgdHVybnMgdXAgbG9hZHMgb2YgaW5zdGFu
Y2VzIG9mIGtlcm5lbC1kb2Mtc3R5bGUgY29tbWVudHMgaW4gdGhlIHRyZWUgYWxyZWFkeS4gIEkg
dGhpbmsgaXQgbWFrZXMgY29tcGxldGUgc2Vuc2UgdG86DQoNCjEuIFN0YXJ0IHVzaW5nIHRvb2xz
IHRvIHB1bGwgdGhlIGV4aXN0aW5nIG9uZXMgaW50byBzcGhpbnggZG9jcw0KMi4gU2tpbSB0aHJv
dWdoIHRoZSBleGlzdGluZyBvbmVzIHRvIG1ha2Ugc3VyZSB0aGV54oCZcmUgYWNjdXJhdGUgLyB1
c2VmdWwNCjMuIEFkZCBzdWNoIGNvbW1lbnRzIGZvciBlbGVtZW50cyBvZiBrZXkgaW1wb3J0YW5j
ZSB0byB0aGUgRlVTQSBTSUcNCjQuIEVuY291cmFnZSBwZW9wbGUgaW5jbHVkZSBkb2N1bWVudGF0
aW9uIGZvciBuZXcgZmVhdHVyZXMsICZjDQoNCiAtR2VvcmdlDQoNCg==

