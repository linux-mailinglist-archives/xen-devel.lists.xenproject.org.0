Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 388B4E06D
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 12:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL3LQ-00021Y-BG; Mon, 29 Apr 2019 10:17:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL3LO-00020o-ND
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 10:17:06 +0000
X-Inumbo-ID: ef808be2-6a67-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ef808be2-6a67-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 10:17:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84625837"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23750.52986.475586.327869@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 11:16:26 +0100
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
In-Reply-To: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
References: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyaXRlcyAoIltQQVRDSF0gcHl0aG9uOiBBZGp1
c3QgeGNfcGh5c2luZm8gd3JhcHBlciBmb3IgdXBkYXRlZCB2aXJ0X2NhcHMgYml0cyIpOgo+IENv
bW1pdCBmMDg5ZmRkZDk0ICJ4ZW46IHJlcG9ydCBQViBjYXBhYmlsaXR5IGluIHN5c2N0bCBhbmQg
dXNlIGl0IGluCj4gdG9vbHN0YWNrIiBjaGFuZ2VkIG1lYW5pbmcgb2YgdmlydF9jYXBzIGJpdCAx
IC0gcHJldmlvdXNseSBpdCB3YXMKPiAiZGlyZWN0aW8iLCBidXQgd2FzIGNoYW5nZWQgdG8gInB2
IiBhbmQgImRpcmVjdGlvIiB3YXMgbW92ZWQgdG8gYml0IDIuCj4gQWRqdXN0IHB5dGhvbiB3cmFw
cGVyLCBhbmQgYWRkIHJlcG9ydGluZyBvZiBib3RoICJwdl9kaXJlY3RpbyIgYW5kCj4gImh2bV9k
aXJlY3RpbyIuCgpUaGFua3MgZm9yIHlvdXIgYXR0ZW50aW9uIHRvIHRoaXMuLi4KCkJ1dDoKCj4g
aW5kZXggY2M4MTc1YTExZS4uMGE4ZDhmNDA3ZSAxMDA2NDQKPiAtLS0gYS90b29scy9weXRob24v
eGVuL2xvd2xldmVsL3hjL3hjLmMKPiArKysgYi90b29scy9weXRob24veGVuL2xvd2xldmVsL3hj
L3hjLmMKPiBAQCAtOTczLDcgKzk3Myw4IEBAIHN0YXRpYyBQeU9iamVjdCAqcHl4Y19waHlzaW5m
byhYY09iamVjdCAqc2VsZikKPiAgICAgIHhjX3BoeXNpbmZvX3QgcGluZm87Cj4gICAgICBjaGFy
IGNwdV9jYXBbMTI4XSwgdmlydF9jYXBzWzEyOF0sICpwOwo+ICAgICAgaW50IGk7Cj4gLSAgICBj
b25zdCBjaGFyICp2aXJ0Y2FwX25hbWVzW10gPSB7ICJodm0iLCAiaHZtX2RpcmVjdGlvIiB9Owo+
ICsgICAgY29uc3QgY2hhciAqdmlydGNhcF9uYW1lc1tdID0geyAiaHZtIiwgInB2IiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImh2bV9kaXJlY3RpbyIsICJwdl9kaXJl
Y3RpbyIgfTsKCkl0IHNlZW1zIHF1aXRlIHdyb25nIHRoYXQgd2UgaGF2ZSBubyB3YXkgdG8ga2Vl
cCB0aGlzIGluIHN5bmMgLSBhbmQKbm90IGV2ZW4gY29tbWVudHMgaW4gYm90aCBwbGFjZXMhICAo
VGhpcyBpcyBub3QgeW91ciBmYXVsdC4uLikKCj4gQEAgLTk4OSw2ICs5OTAsMTAgQEAgc3RhdGlj
IFB5T2JqZWN0ICpweXhjX3BoeXNpbmZvKFhjT2JqZWN0ICpzZWxmKQo+ICAgICAgZm9yICggaSA9
IDA7IGkgPCAyOyBpKysgKQo+ICAgICAgICAgIGlmICggKHBpbmZvLmNhcGFiaWxpdGllcyA+PiBp
KSAmIDEgKQo+ICAgICAgICAgICAgcCArPSBzcHJpbnRmKHAsICIlcyAiLCB2aXJ0Y2FwX25hbWVz
W2ldKTsKPiArICAgIGlmIChwaW5mby5jYXBhYmlsaXRpZXMgJiBYRU5fU1lTQ1RMX1BIWVNDQVBf
ZGlyZWN0aW8pCj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCAyOyBpKysgKQo+ICsgICAgICAg
ICAgICBpZiAoIChwaW5mby5jYXBhYmlsaXRpZXMgPj4gaSkgJiAxICkKPiArICAgICAgICAgICAg
ICBwICs9IHNwcmludGYocCwgIiVzICIsIHZpcnRjYXBfbmFtZXNbaSsyXSk7Cj4gICAgICBpZiAo
IHAgIT0gdmlydF9jYXBzICkKPiAgICAgICAgKihwLTEpID0gJ1wwJzsKCkknbSBub3Qgc3VyZSBJ
IGxpa2UgdGhpcy4gIEFGQUlDVCB0aGUgKzIgaXMgbWFnaWMsIGFuZCB5b3UgaW4gZmFjdAp0cmVh
dCB0aGUgdHdvIGhhbHZlcyBvZiB0aGlzIGFycmF5IHRvZ2V0aGVyIGFzIGEgc2luZ2xlIGFycmF5
LiAgU28KdGhpcyBzaG91bGQgZWl0aGVyIGJlIHR3byBhcnJheXMsIG9yLCBtb3JlIGxpa2VseSwg
c29tZXRoaW5nIGxpa2UgdGhpcwptYXliZToKCiAgKyAgICAgICAgICAgICAgcCArPSBzcHJpbnRm
KHAsICIlc19kaXJlY3RpbyAiLCB2aXJ0Y2FwX25hbWVzW2ldKTsKCldoYXQgZG8geW91IHRoaW5r
ID8KCklhbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
