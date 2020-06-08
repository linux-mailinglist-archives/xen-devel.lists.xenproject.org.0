Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430CE1F1ABD
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 16:16:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiIZ1-0001Nk-1D; Mon, 08 Jun 2020 14:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11Lh=7V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jiIYz-0001Ne-Th
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 14:15:45 +0000
X-Inumbo-ID: 8a6371f0-a992-11ea-ba62-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8a6371f0-a992-11ea-ba62-bc764e2007e4;
 Mon, 08 Jun 2020 14:15:44 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: hcNAetMG/KmWblZbLN0Jqp3lG+aPtcynRFpY875hU77cZmwztVpB2xYNV39hT/mBMS5w1CcitI
 rl7OkATJ/aYF6DQhoQ4VSvho9+gujE+YxyWAUMrPe98GY1LbLc37U0oqUGROfjXhiC0V2DHLAG
 eSonSxVrxPpEBu5qVCBuaYoPNRfHCc4/dmwVtk3GKtW6l1XTKS8mcyVh8dCW4fENfZLpWHo3WC
 3L9KtlSJSObM+nRrU86ln8Z2y5885v2o848f5zfxsEs4j/i+vCwa+8A9G0D9Kt7gTbfjLfruHT
 Xdc=
X-SBRS: 2.7
X-MesageID: 19775556
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19775556"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Thread-Topic: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Thread-Index: AQHWPB0FRC5n06e/7UW7VAlSJqYdHajOeT+AgAArkwA=
Date: Mon, 8 Jun 2020 14:15:40 +0000
Message-ID: <34A9DEE3-7408-4717-853B-43BD5BA7B6C8@citrix.com>
References: <20200606161025.19057-1-rosbrookn@ainfosec.com>
 <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
In-Reply-To: <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <9DB4B0BDD89EAB459D42FC3153909AF4@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q0PigJlpbmcgcmVsZWFzZSBtYW5hZ2VyDQoNCj4gT24gSnVuIDgsIDIwMjAsIGF0IDEyOjM5IFBN
LCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4+
IA0KPj4gT24gSnVuIDYsIDIwMjAsIGF0IDU6MTAgUE0sIE5pY2sgUm9zYnJvb2sgPHJvc2Jyb29r
bkBnbWFpbC5jb20+IHdyb3RlOg0KPj4gDQo+PiBTaW5jZSB0aGUgZ29sYW5nIGJpbmRpbmdzIGFy
ZSBub3cgc2V0IHRvIGJlIHJlLWdlbmVyYXRlZCB3aGVuZXZlciBhDQo+PiBjaGFuZ2UgaXMgbWFk
ZSB0byB0b29scy9saWJ4bC9saWJ4bF90eXBlcy5pZGwsIHRoZSBjYWxsIHRvIGdvIGZtdCBpbg0K
Pj4gZ2VuZ290eXBlcy5weSByZXN1bHRzIGluIGEgZGlydHkgZ2l0IHRyZWUgZm9yIHVzZXJzIHdp
dGhvdXQgZ28NCj4+IGluc3RhbGxlZC4NCj4+IA0KPj4gQXMgYW4gaW1tZWRpYXRlIGZpeCwganVz
dCByZW1vdmUgdGhlIGNhbGwgdG8gZ28gZm10IGZyb20gZ2VuZ290eXBlcy5weS4NCj4+IFdoaWxl
IGhlcmUsIG1ha2Ugc3VyZSB0aGUgRE8gTk9UIEVESVQgY29tbWVudCBhbmQgcGFja2FnZSBkZWNs
YXJhdGlvbg0KPj4gcmVtYWluIGZvcm1hdHRlZCBjb3JyZWN0bHkuIEFsbCBvdGhlciBnZW5lcmF0
ZWQgY29kZSBpcyBsZWZ0DQo+PiB1bi1mb3JtYXR0ZWQgZm9yIG5vdy4NCj4+IA0KPj4gU2lnbmVk
LW9mZi1ieTogTmljayBSb3Nicm9vayA8cm9zYnJvb2tuQGFpbmZvc2VjLmNvbT4NCj4gDQo+IFJl
dmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNClBh
dWwsIHRoaXMgaXMgYSBmaXggdG8gdGhlIGJ1aWxkIHN5c3RlbSB0aGF0IG9ubHkgYWZmZWN0cyB0
aGUgZm9ybWF0dGluZyBvZiBzb21lIGdlbmVyYXRlZCBjb2RlLiAgKEF0IHRoZSBtb21lbnQsIHRo
ZSBnZW5lcmF0ZWQgY29kZSB3aWxsIGxvb2sgZGlmZmVyZW50bHkgZGVwZW5kaW5nIG9uIHdoZXRo
ZXIgeW91IGhhdmUgZ29sYW5nIGluc3RhbGxlZCBvciBub3QuKQ==

