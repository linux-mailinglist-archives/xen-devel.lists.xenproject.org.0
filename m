Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8770A1F17F6
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:39:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiG85-0002dE-8v; Mon, 08 Jun 2020 11:39:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11Lh=7V=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jiG84-0002d9-8Z
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:39:48 +0000
X-Inumbo-ID: c0eaef7a-a97c-11ea-b266-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c0eaef7a-a97c-11ea-b266-12813bfff9fa;
 Mon, 08 Jun 2020 11:39:47 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AyeaVFUQ6CfyNQPiZMHUlPt6zuKwSokVMJHFmhlqzLVffoiDp5XdMSrOd1wZcZhNjJZqyiS6K1
 lyzmJwJ6mxWSOiWkoUvpE4B0a52XQtSAPrFBeWSfqolCxGDnEk/LI0ZXUgS3C96pheahfZKhEM
 5h1sQkLH+wtYocHnJsYHXsbZKbnw6t4mrPEs9Yc+oXAMxUR+xivNmAW7yEUU2eMPeKIYmkLVEU
 Z3eL5fo2KQK8V/gXnPjrtT5ntt3l0WU1NSzYoNfiiuke8HmBEq9/cBBbvj9z9/8si1iU4aTCSg
 1EY=
X-SBRS: 2.7
X-MesageID: 19813792
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19813792"
From: George Dunlap <George.Dunlap@citrix.com>
To: Nick Rosbrook <rosbrookn@gmail.com>
Subject: Re: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Thread-Topic: [PATCH for-4.14] golang/xenlight: remove call to go fmt in
 gengotypes.py
Thread-Index: AQHWPB0FRC5n06e/7UW7VAlSJqYdHajOeT+A
Date: Mon, 8 Jun 2020 11:39:43 +0000
Message-ID: <B9F0A2FB-CF09-46DA-A136-54D6ABA17B4B@citrix.com>
References: <20200606161025.19057-1-rosbrookn@ainfosec.com>
In-Reply-To: <20200606161025.19057-1-rosbrookn@ainfosec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <A996741A9BEF1D4E9FA775EC25F56113@citrix.com>
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
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIEp1biA2LCAyMDIwLCBhdCA1OjEwIFBNLCBOaWNrIFJvc2Jyb29rIDxyb3Nicm9va25A
Z21haWwuY29tPiB3cm90ZToNCj4gDQo+IFNpbmNlIHRoZSBnb2xhbmcgYmluZGluZ3MgYXJlIG5v
dyBzZXQgdG8gYmUgcmUtZ2VuZXJhdGVkIHdoZW5ldmVyIGENCj4gY2hhbmdlIGlzIG1hZGUgdG8g
dG9vbHMvbGlieGwvbGlieGxfdHlwZXMuaWRsLCB0aGUgY2FsbCB0byBnbyBmbXQgaW4NCj4gZ2Vu
Z290eXBlcy5weSByZXN1bHRzIGluIGEgZGlydHkgZ2l0IHRyZWUgZm9yIHVzZXJzIHdpdGhvdXQg
Z28NCj4gaW5zdGFsbGVkLg0KPiANCj4gQXMgYW4gaW1tZWRpYXRlIGZpeCwganVzdCByZW1vdmUg
dGhlIGNhbGwgdG8gZ28gZm10IGZyb20gZ2VuZ290eXBlcy5weS4NCj4gV2hpbGUgaGVyZSwgbWFr
ZSBzdXJlIHRoZSBETyBOT1QgRURJVCBjb21tZW50IGFuZCBwYWNrYWdlIGRlY2xhcmF0aW9uDQo+
IHJlbWFpbiBmb3JtYXR0ZWQgY29ycmVjdGx5LiBBbGwgb3RoZXIgZ2VuZXJhdGVkIGNvZGUgaXMg
bGVmdA0KPiB1bi1mb3JtYXR0ZWQgZm9yIG5vdy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pY2sg
Um9zYnJvb2sgPHJvc2Jyb29rbkBhaW5mb3NlYy5jb20+DQoNClJldmlld2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCldpdGggb25lIG5vdGU6IGdpdCBj
b21wbGFpbnMgdGhhdCB0aGUgcmVzdWx0aW5nIHBhdGNoIGludHJvZHVjZXMgbG9hZHMgb2YgdHJh
aWxpbmcgd2hpdGVzcGFjZS4gIEkgd2VudCB0aG91Z2ggZ2VuZ290eXBlcy5weSBhbmQgZXNzZW50
aWFsbHkgZGlkIGBzLyBcbi9cbi9nYC4gIFdpdGggeW91ciBwZXJtaXNzaW9uIEnigJlsbCBmb2xk
IHRoYXQgKGFuZCB0aGUgcmVzdWx0aW5nIHBhdGNoZXMpIGludG8gdGhpcyBiZWZvcmUgY2hlY2tp
bmcgaXQgaW4uDQoNCiAtR2VvcmdlDQoNCg==

