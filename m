Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0A620B54D
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jun 2020 17:52:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1joqdz-00008x-1s; Fri, 26 Jun 2020 15:51:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yLH0=AH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1joqdx-00008s-Jw
 for xen-devel@lists.xenproject.org; Fri, 26 Jun 2020 15:51:57 +0000
X-Inumbo-ID: f63758fc-b7c4-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f63758fc-b7c4-11ea-bb8b-bc764e2007e4;
 Fri, 26 Jun 2020 15:51:56 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 0lJSrdaqXpMSmFm373tlAlZB61UMvm0lLwD59tjYgbwC/7o4KSGQ61FJ9VF/+lfxSqoi/cQ2Vi
 HFLNWc6njcB32zKO9MHIWmrwzaQ/y6pQHWzM5I8X+nC3iKK1lLZJsQnBGYeWeAAradqEEZrifT
 ahISBU+9wxn7Ar3e2OcJz7ehlLn+G5jAGzDOpYf1XoBH8S0gBTjus5tppr3DwOIVn+nlXIolfW
 3g7sgoRpyE8BKgCgq83TCVRWWnfJJjoDoYIN68Mb+aEZx3BRJwtxWurdPGgcx11cNmWoUQAo0k
 lMc=
X-SBRS: 2.7
X-MesageID: 21047880
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,284,1589256000"; d="scan'208";a="21047880"
From: George Dunlap <George.Dunlap@citrix.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Preparing for the virtual XenSummit
Thread-Topic: Preparing for the virtual XenSummit
Thread-Index: AQHWS9G2nsaD3ksTdkWObqenNi29cw==
Date: Fri, 26 Jun 2020 15:51:53 +0000
Message-ID: <94B7B6C8-C6CB-48A0-872F-90D4E1423528@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <27D7CF6C0C0D034FB2D23CEED6623DFA@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGV5IGFsbCwNCg0KVGhlIHZpcnR1YWwgU3VtbWl0IHRoaXMgeWVhciB3aWxsIGJlIHNpZ25pZmlj
YW50bHkgZGlmZmVyZW50IHRoYW4gYW4gaW4tcGVyc29uIGNvbmZlcmVuY2UuICBJbiBhbiBlZmZv
cnQgdG8gbWFrZSB0aGUgZXZlbnQgYXMgdXNlZnVsIGFzIHBvc3NpYmxlLCBJ4oCZbSBpbnZpdGlu
ZyBwZW9wbGUgdG8gam9pbiBtZSBmb3IgYSBicmFpbnN0b3JtaW5nIHNlc3Npb24gb24gTW9uZGF5
LCAyOSBKdW5lLCBhdCAzcG0gQlNULiAgVGhlIHB1cnBvc2Ugd291bGQgYmUgdG8gYnJhaW5zdG9y
bSBob3cgd2UgY2FuIGVuY291cmFnZSB0aGUgc29ydHMgb2YgbWl4aW5nIC8gaGFsbHdheSBkaXNj
dXNzaW9ucyAvIHJlbGF0aW9uc2hpcC1mb3JtaW5nIHRoYXQgaGFwcGVucyBhdCBhIG5vcm1hbCBp
bi1wZXJzb24gc2Vzc2lvbi4gIFRoaXMgd291bGQgYmUgaWRlYWxseSBhIHNtYWxsZXIgbWVldGlu
ZywgaGVsZCBvbiB0aGUgQkJCIGNvbmZlcmVuY2luZyBzb2Z0d2FyZSwgd2hlcmUgd2UgY2FuIGRp
c2N1c3MgaWRlYXMgYW5kIHBvdGVudGlhbGx5IGV4cGVyaW1lbnQgd2l0aCB0aGUgZnVuY3Rpb25h
bGl0eS4NCg0KSWYgeW914oCZcmUgaW50ZXJlc3RlZCwgZW1haWwgbWUgcHJpdmF0ZWx5IGFuZCBJ
4oCZbGwgc2VuZCB5b3UgYSBsaW5rIHRvIHRoZSByb29tIGJlZm9yZSB0aGUgc2Vzc2lvbiB0aW1l
Lg0KDQpXZSBtYXkgYWxzbyBoYXZlIGEgbGFyZ2VyIOKAnHN0cmVzcy10ZXN04oCdIG9mIHRoZSBz
eXN0ZW0gbGF0ZXIgdGhhdCB3ZWVrOyBzdGF5IHR1bmVkIGZvciBkZXRhaWxzLg0KDQogLUdlb3Jn
ZQ==

