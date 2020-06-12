Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CFA1F7797
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 14:00:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjiKx-0001yJ-J7; Fri, 12 Jun 2020 11:59:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJZ9=7Z=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jjiKv-0001yE-Tk
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 11:59:05 +0000
X-Inumbo-ID: 1cdf0c9c-aca4-11ea-b7bb-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cdf0c9c-aca4-11ea-b7bb-bc764e2007e4;
 Fri, 12 Jun 2020 11:59:05 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zidYHVXBfNDD4xFyXnV9hDXUTyeqAFkTwjc4nqf3H8qd+GvAa1eLSm+BOPcLfRMrK0rBN/zOQy
 4NESGKO2UfRla7ORtdJ/1VCl4ul3UGL3/lYt3es2oqDzolv7W3YMdOro/Xmjs9vYH4m5fwtUxG
 zg729RRLXHek+zsM3FpCjCWtGG5SjC3chFh70XU+qDVqQ92y9UTvJdz67LZhdR+xgiOi/N0W8p
 qggoE6morBeehuvrkiXZaGh6OyVEQY2iuA5k1S+BinyQcjkTiJaU8LQlB6PALj9bGo/oBz+5WF
 mQw=
X-SBRS: 2.7
X-MesageID: 19911771
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="19911771"
From: George Dunlap <George.Dunlap@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Subject: Re: golang bindings dirty in tree after libxl build
Thread-Topic: golang bindings dirty in tree after libxl build
Thread-Index: AQHWQKioQYeQbI0+WE2BPJ46VizvQajUvuCA
Date: Fri, 12 Jun 2020 11:59:01 +0000
Message-ID: <A8F5EC16-53D8-40F4-863F-0862298193EA@citrix.com>
References: <ab679f8c-a09f-cbc6-c0fc-6285550ba3af@citrix.com>
In-Reply-To: <ab679f8c-a09f-cbc6-c0fc-6285550ba3af@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1B5B0728D31EC428E9F94B8F2412FD4@citrix.com>
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 "rosbrookn@gmail.com" <rosbrookn@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVuIDEyLCAyMDIwLCBhdCAxMjowMCBQTSwgQW5kcmV3IENvb3BlciA8QW5kcmV3
LkNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBIZWxsbywNCj4gDQo+IEkndmUganVz
dCBkb25lIGEgbGlieGwgYnVpbGQgYW5kIGdvdCB0aGluZ3Mgc3VjaCBhczoNCj4gDQo+IC0tLSBh
L3Rvb2xzL2dvbGFuZy94ZW5saWdodC9oZWxwZXJzLmdlbi5nbw0KPiArKysgYi90b29scy9nb2xh
bmcveGVubGlnaHQvaGVscGVycy5nZW4uZ28NCj4gQEAgLTQzMSwxNCArNDMxLDE0IEBAIHguRXZ0
Y2ggPSBpbnQoeGMuZXZ0Y2gpDQo+ICB4LlJyZWYgPSBpbnQoeGMucnJlZikNCj4gIHguQ29ubmVj
dGlvbiA9IENoYW5uZWxDb25uZWN0aW9uKHhjLmNvbm5lY3Rpb24pDQo+ICBzd2l0Y2ggeC5Db25u
ZWN0aW9uew0KPiAtY2FzZSBDaGFubmVsQ29ubmVjdGlvblVua25vd246DQo+IC14LkNvbm5lY3Rp
b25VbmlvbiA9IG5pbA0KPiAgY2FzZSBDaGFubmVsQ29ubmVjdGlvblB0eToNCj4gIHZhciBjb25u
ZWN0aW9uUHR5IENoYW5uZWxpbmZvQ29ubmVjdGlvblVuaW9uUHR5DQo+ICBpZiBlcnIgOj0gY29u
bmVjdGlvblB0eS5mcm9tQyh4Yyk7ZXJyICE9IG5pbCB7DQo+ICAgcmV0dXJuIGZtdC5FcnJvcmYo
ImNvbnZlcnRpbmcgZmllbGQgY29ubmVjdGlvblB0eTogJXYiLCBlcnIpDQo+ICB9DQo+ICB4LkNv
bm5lY3Rpb25VbmlvbiA9IGNvbm5lY3Rpb25QdHkNCj4gK2Nhc2UgQ2hhbm5lbENvbm5lY3Rpb25V
bmtub3duOg0KPiAreC5Db25uZWN0aW9uVW5pb24gPSBuaWwNCj4gIGNhc2UgQ2hhbm5lbENvbm5l
Y3Rpb25Tb2NrZXQ6DQo+ICB4LkNvbm5lY3Rpb25VbmlvbiA9IG5pbA0KPiAgZGVmYXVsdDoNCj4g
DQo+IGRpcnR5IGluIHRyZWUuICBUaGV5IGFyZSBhbGwgY2FzZSBsYWJlbHMsIGFuZCBvbmx5IHRo
ZWlyIG9yZGVyIGluIHRoZQ0KPiBzd2l0Y2ggaGFzIGNoYW5nZWQuDQo+IA0KPiBEb2VzIHRoZSBj
dXJyZW50IGJpbmRpbmcgZ2VuZXJhdGlvbiByZWx5IG9uIHRoZSBvcmRlciBvZiBlbnRyaWVzIGlu
IGENCj4gcHl0aG9uIGRpY3Rpb25hcnkgYnkgYW55IGNoYW5jZT8NCg0KTm90IGV4cGxpY2l0bHks
IGJ1dCBvYnZpb3VzbHkgc29tZXdoYXQgaW1wbGljaXRseS4NCg0KSXMgdGhpcyBhIHB5dGhvbjIv
MyBpc3N1ZSwgb3Igd291bGQgZGlmZmVyZW50IHZlcnNpb25zIG9mIHB5dGhvbiB3aXRoaW4gMi8z
IGVuZCB1cCB3aXRoIGRpZmZlcmVudCBzb3J0IG9yZGVycz8NCg0KSWYgcHl0aG9uMyB3aWxsIGFs
d2F5cyBwdXQgdGhlbSBpbiB0aGUgc2FtZSBvcmRlciwgdGhlbiB3ZSBtaWdodCBjb25zaWRlciBq
dXN0IHN3aXRjaGluZyB0aGUgc2NyaXB0IHRvIGJlaW5nIGV4cGxpY2l0bHkgcHl0aG9uMy4gIE90
aGVyd2lzZSwgd2XigJlsbCBwcm9iYWJseSBoYXZlIHRvIGFkZCBzb3J0cy4NCg0KIC1HZW9yZ2UN
Cg0K

