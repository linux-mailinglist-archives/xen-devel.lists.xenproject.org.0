Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E354011C17
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 17:02:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMDBE-0006V8-OY; Thu, 02 May 2019 14:59:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMDBC-0006V3-W6
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:59:23 +0000
X-Inumbo-ID: ddcd285f-6cea-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ddcd285f-6cea-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 14:59:21 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 08:59:20 -0600
Message-Id: <5CCB05C6020000780022B567@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 08:59:18 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
In-Reply-To: <1556658172-8824-1-git-send-email-sstabellini@kernel.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 01/10] xen: add a p2mt parameter to
 map_mmio_regions
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMwLjA0LjE5IGF0IDIzOjAyLCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kb20wX2J1aWxkLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL2RvbTBfYnVpbGQuYwo+IEBAIC03OSw4ICs3OSwxMSBAQCBzdGF0aWMgaW50IF9faW5p
dCBtb2RpZnlfaWRlbnRpdHlfbW1pbyhzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIHBm
biwKPiAgCj4gICAgICBmb3IgKCA7IDsgKQo+ICAgICAgewo+IC0gICAgICAgIHJjID0gbWFwID8g
ICBtYXBfbW1pb19yZWdpb25zKGQsIF9nZm4ocGZuKSwgbnJfcGFnZXMsIF9tZm4ocGZuKSkKPiAt
ICAgICAgICAgICAgICAgICA6IHVubWFwX21taW9fcmVnaW9ucyhkLCBfZ2ZuKHBmbiksIG5yX3Bh
Z2VzLCBfbWZuKHBmbikpOwo+ICsgICAgICAgIGlmICggbWFwICkKPiArICAgICAgICAgICAgcmMg
PSBtYXBfbW1pb19yZWdpb25zKGQsIF9nZm4ocGZuKSwgbnJfcGFnZXMsIF9tZm4ocGZuKSwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9tbWlvX2RpcmVjdCk7Cj4gKyAg
ICAgICAgZWxzZQo+ICsgICAgICAgICAgICByYyA9IHVubWFwX21taW9fcmVnaW9ucyhkLCBfZ2Zu
KHBmbiksIG5yX3BhZ2VzLCBfbWZuKHBmbikpOwoKTWF5IEkgYXNrIHRoYXQgeW91IGxlYXZlIGFs
b25lIHRoZSB1c2Ugb2YgdGhlIGNvbmRpdGlvbmFsCm9wZXJhdG9yIGhlcmUsIGFuZCBfanVzdF8g
YWRkIHRoZSBuZXcgYXJndW1lbnQ/Cgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IEBAIC0yMjY0LDEyICsyMjY0LDE2IEBAIHN0YXRp
YyB1bnNpZ25lZCBpbnQgbW1pb19vcmRlcihjb25zdCBzdHJ1Y3QgZG9tYWluICpkLAo+ICBpbnQg
bWFwX21taW9fcmVnaW9ucyhzdHJ1Y3QgZG9tYWluICpkLAo+ICAgICAgICAgICAgICAgICAgICAg
ICBnZm5fdCBzdGFydF9nZm4sCj4gICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcg
bnIsCj4gLSAgICAgICAgICAgICAgICAgICAgIG1mbl90IG1mbikKPiArICAgICAgICAgICAgICAg
ICAgICAgbWZuX3QgbWZuLAo+ICsgICAgICAgICAgICAgICAgICAgICBwMm1fdHlwZV90IHAybXQp
Cj4gIHsKPiAgICAgIGludCByZXQgPSAwOwo+ICAgICAgdW5zaWduZWQgbG9uZyBpOwo+ICAgICAg
dW5zaWduZWQgaW50IGl0ZXIsIG9yZGVyOwo+ICAKPiArICAgIGlmICggcDJtdCAhPSBwMm1fbW1p
b19kaXJlY3QgKQo+ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKCkNvbnNpZGVyaW5nIHRo
aXMgYW5kIC4uLgoKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWN0bC5jCj4gKysrIGIveGVuL2NvbW1v
bi9kb21jdGwuYwo+IEBAIC05MjcsNiArOTI3LDcgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNU
X0hBTkRMRV9QQVJBTSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQo+ICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgbnJfbWZucyA9IG9wLT51Lm1lbW9yeV9tYXBwaW5nLm5yX21mbnM7Cj4gICAgICAgICAg
dW5zaWduZWQgbG9uZyBtZm5fZW5kID0gbWZuICsgbnJfbWZucyAtIDE7Cj4gICAgICAgICAgaW50
IGFkZCA9IG9wLT51Lm1lbW9yeV9tYXBwaW5nLmFkZF9tYXBwaW5nOwo+ICsgICAgICAgIHAybV90
eXBlX3QgcDJtdDsKPiAgCj4gICAgICAgICAgcmV0ID0gLUVJTlZBTDsKPiAgICAgICAgICBpZiAo
IG1mbl9lbmQgPCBtZm4gfHwgLyogd3JhcD8gKi8KPiBAQCAtOTM5LDYgKzk0MCwxMCBAQCBsb25n
IGRvX2RvbWN0bChYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9kb21jdGxfdCkgdV9kb21jdGwp
Cj4gICAgICAgICAgLyogTXVzdCBicmVhayBoeXBlcmNhbGwgdXAgYXMgdGhpcyBjb3VsZCB0YWtl
IGEgd2hpbGUuICovCj4gICAgICAgICAgaWYgKCBucl9tZm5zID4gNjQgKQo+ICAgICAgICAgICAg
ICBicmVhazsKPiArCj4gKyAgICAgICAgcDJtdCA9IHAybV9tbWlvX2RpcmVjdF9kZXY7Cj4gKyNl
bHNlCj4gKyAgICAgICAgcDJtdCA9IHAybV9tbWlvX2RpcmVjdDsKPiAgI2VuZGlmCgouLi4gdGhp
cywgaXMgdGhlcmUgcmVhbGx5IHZhbHVlIGluIGFkZGluZyB0aGUgbmV3IHBhcmFtZXRlciBmb3IK
eDg2PyBBIHdyYXBwZXIgbWFjcm8gb2YgdGhlIHNhbWUgbmFtZSBjb3VsZCBiZSB1c2VkIHRvCnN0
cmlwIHRoZSBuZXcgbGFzdCBhcmd1bWVudCBhdCBhbGwgY2FsbCBzaXRlcyAoY3VycmVudCBhbmQg
ZnV0dXJlCm9uZXMpLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
