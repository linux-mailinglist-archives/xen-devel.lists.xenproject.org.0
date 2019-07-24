Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D221E735C8
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 19:46:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqLJi-00084A-Be; Wed, 24 Jul 2019 17:44:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xhPP=VV=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1hqLJh-00083u-92
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 17:44:41 +0000
X-Inumbo-ID: b608291c-ae3a-11e9-8980-bc764e045a96
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b608291c-ae3a-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 17:44:40 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1hqLJc-000EvO-1h; Wed, 24 Jul 2019 17:44:36 +0000
Date: Wed, 24 Jul 2019 18:44:36 +0100
From: Tim Deegan <tim@xen.org>
To: Paul Durrant <paul.durrant@citrix.com>
Message-ID: <20190724174436.GA54604@deinos.phlegethon.org>
References: <20190723160609.2177-1-paul.durrant@citrix.com>
 <20190723160609.2177-5-paul.durrant@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723160609.2177-5-paul.durrant@citrix.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org);
 SAEximRunCond expanded to false
Subject: Re: [Xen-devel] [PATCH 4/6] x86/domain: remove the 'oos_off' flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QXQgMTc6MDYgKzAxMDAgb24gMjMgSnVsICgxNTYzOTAxNTY3KSwgUGF1bCBEdXJyYW50IHdyb3Rl
Ogo+IFRoZSBmbGFnIGlzIG5vdCBuZWVkZWQgc2luY2UgdGhlIGRvbWFpbiAnY3JlYXRlZmxhZ3Mn
IGNhbiBub3cgYmUgdGVzdGVkCj4gZGlyZWN0bHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBE
dXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBUaW0gRGVlZ2FuIDx0
aW1AeGVuLm9yZz4KCnRob3VnaCBzb21lIG9mIHRoaXMgY2hhbmdlIHNlZW1zIHRvIGhhdmUgZ290
IGludG8gcGF0Y2ggMywgbWF5YmUgdGhleQp3ZXJlIHJlb3JkZXJlZCBhdCBzb21lIHBvaW50PwoK
Q2hlZXJzLAoKVGltLgoKCj4gLS0tCj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBA
ZXUuY2l0cml4LmNvbT4KPiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IENj
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+IENjOiAiUm9nZXIgUGF1IE1vbm7DqSIgPHJvZ2VyLnBhdUBjaXRyaXgu
Y29tPgo+IC0tLQo+ICB4ZW4vYXJjaC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIHwgMyArLS0KPiAg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9kb21haW4uaCAgICB8IDEgLQo+ICAyIGZpbGVzIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvbW0vc2hhZG93L2NvbW1vbi5jIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9jb21tb24u
Ywo+IGluZGV4IDMyMGVhMGRiMjEuLjJjN2ZhZmE0ZmIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9jb21tb24uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29t
bW9uLmMKPiBAQCAtNjIsNyArNjIsNiBAQCBpbnQgc2hhZG93X2RvbWFpbl9pbml0KHN0cnVjdCBk
b21haW4gKmQpCj4gIAo+ICAjaWYgKFNIQURPV19PUFRJTUlaQVRJT05TICYgU0hPUFRfT1VUX09G
X1NZTkMpCj4gICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cub29zX2FjdGl2ZSA9IDA7Cj4gLSAg
ICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cub29zX29mZiA9IGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RP
TUNUTF9DREZfb29zX29mZjsKPiAgI2VuZGlmCj4gICAgICBkLT5hcmNoLnBhZ2luZy5zaGFkb3cu
cGFnZXRhYmxlX2R5aW5nX29wID0gMDsKPiAgCj4gQEAgLTI1MjMsNyArMjUyMiw3IEBAIHN0YXRp
YyB2b2lkIHNoX3VwZGF0ZV9wYWdpbmdfbW9kZXMoc3RydWN0IHZjcHUgKnYpCj4gICNpZiAoU0hB
RE9XX09QVElNSVpBVElPTlMgJiBTSE9QVF9PVVRfT0ZfU1lOQykKPiAgICAgIC8qIFdlIG5lZWQg
dG8gY2hlY2sgdGhhdCBhbGwgdGhlIHZjcHVzIGhhdmUgcGFnaW5nIGVuYWJsZWQgdG8KPiAgICAg
ICAqIHVuc3luYyBQVHMuICovCj4gLSAgICBpZiAoIGlzX2h2bV9kb21haW4oZCkgJiYgIWQtPmFy
Y2gucGFnaW5nLnNoYWRvdy5vb3Nfb2ZmICkKPiArICAgIGlmICggaXNfaHZtX2RvbWFpbihkKSAm
JiAhKGQtPmNyZWF0ZWZsYWdzICYgWEVOX0RPTUNUTF9DREZfb29zX29mZikgKQo+ICAgICAgewo+
ICAgICAgICAgIGludCBwZSA9IDE7Cj4gICAgICAgICAgc3RydWN0IHZjcHUgKnZwdHI7Cj4gZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZG9tYWluLmggYi94ZW4vaW5jbHVkZS9hc20t
eDg2L2RvbWFpbi5oCj4gaW5kZXggOTMzYjg1OTAxZi4uNWY5ODk5NDY5YyAxMDA2NDQKPiAtLS0g
YS94ZW4vaW5jbHVkZS9hc20teDg2L2RvbWFpbi5oCj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4
Ni9kb21haW4uaAo+IEBAIC0xMTUsNyArMTE1LDYgQEAgc3RydWN0IHNoYWRvd19kb21haW4gewo+
ICAKPiAgICAgIC8qIE9PUyAqLwo+ICAgICAgYm9vbF90IG9vc19hY3RpdmU7Cj4gLSAgICBib29s
X3Qgb29zX29mZjsKPiAgCj4gICAgICAvKiBIYXMgdGhpcyBkb21haW4gZXZlciB1c2VkIEhWTU9Q
X3BhZ2V0YWJsZV9keWluZz8gKi8KPiAgICAgIGJvb2xfdCBwYWdldGFibGVfZHlpbmdfb3A7Cj4g
LS0gCj4gMi4yMC4xLjIuZ2IyMWViYjY3MQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
