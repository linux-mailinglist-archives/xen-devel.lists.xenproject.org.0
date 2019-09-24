Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7D1BC575
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 12:11:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iChiP-0006uC-8n; Tue, 24 Sep 2019 10:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iChiO-0006u7-4d
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 10:06:36 +0000
X-Inumbo-ID: fd47f192-deb2-11e9-9613-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id fd47f192-deb2-11e9-9613-12813bfff9fa;
 Tue, 24 Sep 2019 10:06:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E3C9AD8C;
 Tue, 24 Sep 2019 10:06:34 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-33-jgross@suse.com>
 <04d23beb-5370-a538-7cc1-785086e10491@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <44e0610b-e089-f602-2748-f3a3c923b511@suse.com>
Date: Tue, 24 Sep 2019 12:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <04d23beb-5370-a538-7cc1-785086e10491@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 32/47] xen/sched: support allocating
 multiple vcpus into one sched unit
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTE6NDYsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0zNjYsMTggKzM4MCwzOCBAQCBzdGF0aWMg
dm9pZCBzY2hlZF9mcmVlX3VuaXQoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQpCj4+ICAgICAgIHhm
cmVlKHVuaXQpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyB2b2lkIHNjaGVkX3VuaXRfYWRkX3Zj
cHUoc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsIHN0cnVjdCB2Y3B1ICp2KQo+PiArewo+PiArICAg
IHYtPnNjaGVkX3VuaXQgPSB1bml0Owo+PiArICAgIGlmICggIXVuaXQtPnZjcHVfbGlzdCB8fCB1
bml0LT52Y3B1X2xpc3QtPnZjcHVfaWQgPiB2LT52Y3B1X2lkICkKPiAKPiBJcyB0aGUgcmlnaHQg
c2lkZSBuZWVkZWQ/IEFyZW4ndCB2Q1BVLXMgY3JlYXRlZCBpbiBpbmNyZWFzaW5nIG9yZGVyCj4g
b2YgdGhlaXIgSURzLCBhbmQgYXJlbid0IHdlIHJlbHlpbmcgb24gdGhpcyBlbHNld2hlcmUgdG9v
PwoKSWRsZSB2Y3B1cyBhcmUgcmF0aGVyIHNwZWNpYWwgYW5kIHRoZXkgcmVxdWlyZSB0aGUgc2Vj
b25kIHRlc3QuCgo+IAo+PiArICAgIHsKPj4gKyAgICAgICAgdW5pdC0+dmNwdV9saXN0ID0gdjsK
Pj4gKyAgICAgICAgdW5pdC0+dW5pdF9pZCA9IHYtPnZjcHVfaWQ7Cj4gCj4gVGhpcyBtYWtlcyBm
b3IgYSBwcmV0dHkgc3RyYW5nZSBzZXQgb2YgSURzIChub24tc3VjY2Vzc2l2ZSksIGFuZAo+IGV4
cGxhaW5zIHdoeSBwYXRjaCAyNCB1c2VzIGEgbG9jYWwgInVuaXRfaWR4IiBpbnN0ZWFkIG9mIHN3
aXRjaGluZwo+IGZyb20gdi0+dmNwdV9pZCBhcyBhcnJheSBpbmRleCB0byB1bml0LT51bml0X2lk
LiBJcyB0aGVyZSBhIHJlYXNvbgo+IHlvdSBkb24ndCBkaXZpZGUgYnkgdGhlIGdyYW51bGFyaXR5
IGhlcmUsIGVsaW1pbmF0aW5nIHRoZSBkaXZpc2lvbgo+IGRvbmUgZS5nLiAuLi4KCkNwdXMgbm90
IGluIGEgY3B1cG9vbCBhcmUgaW4gc2luZ2xlLXZjcHUgdW5pdHMsIHNvIGluIG9yZGVyIGZvciBu
b3QKaGF2aW5nIGNvbXBsZXRlbHkgd2VpcmQgdW5pdC1pZHMgYWZ0ZXIgaGF2aW5nIG1vdmUgY3B1
cyBhIGxvdCBpbiBhbmQKb3V0IG9mIGNwdXBvb2xzIGtlZXBpbmcgdGhlIGN1cnJlbnQgc2NoZW1l
IGlzIHRoZSBvbmx5IG9uZSBJIGNvdWxkCnRoaW5rIG9mLgoKPiAKPj4gKyAgICB9Cj4+ICsgICAg
dW5pdC0+cnVuc3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOwo+PiArfQo+PiArCj4+ICAg
c3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0cnVjdCB2Y3B1ICp2
KQo+PiAgIHsKPj4gICAgICAgc3RydWN0IHNjaGVkX3VuaXQgKnVuaXQsICoqcHJldl91bml0Owo+
PiAgICAgICBzdHJ1Y3QgZG9tYWluICpkID0gdi0+ZG9tYWluOwo+PiAgIAo+PiArICAgIGZvcl9l
YWNoX3NjaGVkX3VuaXQgKCBkLCB1bml0ICkKPj4gKyAgICAgICAgaWYgKCB1bml0LT52Y3B1X2xp
c3QtPnZjcHVfaWQgLyBzY2hlZF9ncmFudWxhcml0eSA9PQo+IAo+IC4uLiBoZXJlLiAoSSBhbHNv
IGRvbid0IHNlZSB3aHkgeW91IGRvbid0IHVzZSB1bml0LT51bml0X2lkIGhlcmUuKQo+IAo+PiBA
QCAtNjIyLDkgKzY1OSwxNiBAQCB2b2lkIHNjaGVkX2Rlc3Ryb3lfdmNwdShzdHJ1Y3QgdmNwdSAq
dikKPj4gICAgICAga2lsbF90aW1lcigmdi0+cG9sbF90aW1lcik7Cj4+ICAgICAgIGlmICggdGVz
dF9hbmRfY2xlYXJfYm9vbCh2LT5pc191cmdlbnQpICkKPj4gICAgICAgICAgIGF0b21pY19kZWMo
JnBlcl9jcHUoc2NoZWRfdXJnZW50X2NvdW50LCB2LT5wcm9jZXNzb3IpKTsKPj4gLSAgICBzY2hl
ZF9yZW1vdmVfdW5pdCh2Y3B1X3NjaGVkdWxlcih2KSwgdW5pdCk7Cj4+IC0gICAgc2NoZWRfZnJl
ZV92ZGF0YSh2Y3B1X3NjaGVkdWxlcih2KSwgdW5pdC0+cHJpdik7Cj4+IC0gICAgc2NoZWRfZnJl
ZV91bml0KHVuaXQpOwo+PiArICAgIC8qCj4+ICsgICAgICogVmNwdXMgYXJlIGJlaW5nIGRlc3Ry
b3llZCB0b3AtZG93bi4gU28gYmVpbmcgdGhlIGZpcnN0IHZjcHUgb2YgYW4gdW5pdAo+PiArICAg
ICAqIGlzIHRoZSBzYW1lIGFzIGJlaW5nIHRoZSBvbmx5IG9uZS4KPj4gKyAgICAgKi8KPj4gKyAg
ICBpZiAoIHVuaXQtPnZjcHVfbGlzdCA9PSB2ICkKPiAKPiBJbnRlcmVzdGluZ2x5IGhlcmUgeW91
IHJlbHkgb24gdGhlcmUgYmVpbmcgYSBjZXJ0YWluIG9yZGVyLgoKWWVzLiBUaGF0IGlzIHdvcmtp
bmcgYmVjYXVzZSBpZGxlIHZjcHVzIGFyZSBuZXZlciBkZXN0cm95ZWQuCgoKSnVlcmdlbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
