Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24699BF531
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 16:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDUwQ-0001vL-On; Thu, 26 Sep 2019 14:40:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=t6lf=XV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDUwP-0001vC-Rc
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 14:40:21 +0000
X-Inumbo-ID: 90a40084-e06b-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 90a40084-e06b-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 14:40:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EFE0BAD94;
 Thu, 26 Sep 2019 14:40:19 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, Jan Beulich <jbeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
 <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
 <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
 <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e3c71652-7726-f699-4625-7a069cdc9d4b@suse.com>
Date: Thu, 26 Sep 2019 16:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMTkgMTU6NTMsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFdlZCwgMjAxOS0w
OS0yNSBhdCAxNTowNyArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI1LjA5LjIwMTkg
MTQ6NDAsIErDvHJnZW4gR3Jvw58gIHdyb3RlOgo+Pj4gT24gMjQuMDkuMTkgMTc6MjIsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA5LjIwMTkgMTc6MDksIErDvHJnZW4gR3Jvw58gd3Jv
dGU6Cj4+Pj4+IE9uIDI0LjA5LjE5IDE3OjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+Pj4+IE9u
IDI0LjA5LjIwMTkgMTY6NDEsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+Pj4+Pj4gZm9yX2VhY2hf
c2NoZWRfdW5pdF92Y3B1KCkgZm9yIGFuIGlkbGUKPj4+Pj4+PiB1bml0IG1pZ2h0IGVuZCBwcmVt
YXR1cmUgd2hlbiBvbmUgb2YgdGhlIHZjcHVzIGlzIHJ1bm5pbmcKPj4+Pj4+PiBpbiBhbm90aGVy
Cj4+Pj4+Pj4gdW5pdCAoaWRsZV92Y3B1LT5zY2hlZF91bml0ICE9IGlkbGVfdW5pdCkuCj4+Pj4+
Pgo+Pj4+Pj4gT2gsIHRoYXQgKHYpLT5zY2hlZF91bml0ID09IChpKSBpbiB0aGUgY29uc3RydWN0
IGlzIGNsZWFybHkKPj4+Pj4+IHVuZXhwZWN0ZWQuCj4+Pj4+PiBJcyB0aGlzIHJlYWxseSBzdGls
bCBuZWVkZWQgYnkgdGhlIGVuZCBvZiB0aGUgc2VyaWVzPyBJCj4+Pj4+PiByZWFsaXplIHRoYXQK
Pj4+Pj4+IF9zb21lXyBjaGVjayBpcyBuZWVkZWQsIGJ1dCBjb3VsZCB0aGlzIHBlcmhhcHMgYmUg
YXJyYW5nZWQgaW4KPj4+Pj4+IGEgd2F5Cj4+Pj4+PiB0aGF0IHlvdSdkIHN0aWxsIGhpdCBhbGwg
dkNQVS1zIHdoZW4gdXNpbmcgaXQgb24gYW4gaWRsZQo+Pj4+Pj4gdW5pdCwgbm8KPj4+Pj4+IG1h
dHRlciB3aGV0aGVyIHRoZXkncmUgaW4gdXNlIGFzIGEgc3Vic3RpdHV0ZSBpbiBhICJyZWFsIgo+
Pj4+Pj4gdW5pdD8KPj4+Pj4KPj4+Pj4gSSBjb3VsZCBkbyB0aGF0IGJ5IGhhdmluZyBhbm90aGVy
IGxpbmtlZCBsaXN0IGluIHN0cnVjdCB2Y3B1Lgo+Pj4+PiBUaGlzIHdheQo+Pj4+PiBJIGNhbiBh
dm9pZCBpdC4KPj4+Pgo+Pj4+IE9oLCBubywgbm90IGFub3RoZXIgbGlzdCBqdXN0IGZvciB0aGlz
IHB1cnBvc2UuIEkgd2FzIHJhdGhlcgo+Pj4+IHRoaW5raW5nCj4+Pj4gb2YgZS5nLiBhIGNvbXBh
cmlzb24gb2YgSURzLgo+Pj4KPj4+IFRoYXQgd291bGQgcmVzdWx0IGVpdGhlciBpbiBzb21ldGhp
bmcgbGlrZToKPj4+Cj4+PiAodiktPnZjcHVfaWQgPCAodSktPnVuaXRfaWQgKyAodSktPnJlcy0+
Y3B1cG9vbC0+Z3JhbnVsYXJpdHkKPj4+Cj4+PiByZXF1aXJpbmcgdG8gbWFrZSBzdHJ1Y3Qgc2No
ZWRfcmVzb3VyY2UgcHVibGljIGFzIGtleWhhbmRsZXIuYwo+Pj4gbmVlZHMKPj4+IGZvcl9lYWNo
X3NjaGVkX3VuaXRfdmNwdSgpIHBsdXMgYmVpbmcgcXVpdGUgZXhwZW5zaXZlLAo+Pgo+PiBJIGFn
cmVlIHRoaXMgaXMgbm90IGEgZ29vZCBvcHRpb24uCj4+Cj4+PiBvcjoKPj4+Cj4+PiAhKHUpLT5u
ZXh0X2luX2xpc3QgfHwgKHYpLT52Y3B1X2lkIDwgKHUpLT5uZXh0X2luX2xpc3QtPnVuaXRfaWQK
Pj4+Cj4+PiB3aGljaCBzZWVtcyB0byBiZSBtb3JlIGV4cGVuc2l2ZSBhcyB0aGUgY3VycmVudCB2
YXJpYW50LCB0b28uCj4+Cj4+IEl0J3Mgbm90IHRoaXMgbXVjaCBtb3JlIGV4cGVuc2l2ZSwgYW5k
IGl0IGVsaW1pbmF0ZXMgdW5leHBlY3RlZAo+PiAoYXMgSSB3b3VsZCBjYWxsIGl0KSBiZWhhdmlv
ciwgc28gSSB0aGluayBJJ2QgZ28gdGhpcyByb3V0ZS4KPj4KPiBTbywgSSBob25lc3RseSBsaWtl
IHRoZSB3YXkgaXQncyBjdXJyZW50bHkgZG9uZSBpbiBKdWVyZ2VuJ3MgcGF0aGVzLgo+IAo+IEhv
d2V2ZXIsIEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hhdCBpdCBpcyB0aGUgaXNzdWUgdGhh
dCBKYW4gdGhpbmtzCj4gdGhhdCBoYXMsIGFuZCBpbiB3aGF0IHNlbnNlIHRoZSBjb2RlL2JlaGF2
aW9yIGlzIHJlZ2FyZGVkIGFzCj4gInVuZXhwZWN0ZWQiLgo+IAo+IENhbiB5b3UgaGVscCBtZSBz
ZWUgdGhlIHByb2JsZW0/IE1heWJlLCBpZiBJIHJlYWxpemUgaXQsIEknZCBjaGFuZ2UgbXkKPiBw
cmVmZXJlbmNlLi4uCgpJIGhhdmUgY2hhbmdlZCBpdCBtZWFud2hpbGUgYW5kIEkgdGhpbmsgdGhl
IG5ldyBzb2x1dGlvbiByZW1vdmVzIGEKbGF0ZW50IHByb2JsZW0uIE90aGVyd2lzZSBvbmUgd291
bGQgaGF2ZSB0byBiZSB2ZXJ5IGNhcmVmdWwgbm90IHRvIHVzZQpmb3JfZWFjaF9zY2hlZF91bml0
X3ZjcHUoKSBmb3IgaWRsZSB1bml0cywgYXMgdGhpcyBtaWdodCByZXN1bHQgaW4Kb2NjYXNpb25h
bCB3cm9uZyByZXN1bHRzLgoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
