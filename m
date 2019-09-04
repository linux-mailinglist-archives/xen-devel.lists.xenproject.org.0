Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6E0A818B
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 13:55:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Tq4-0000hy-NR; Wed, 04 Sep 2019 11:52:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5Tq2-0000hn-U0
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 11:52:38 +0000
X-Inumbo-ID: 7d84d482-cf0a-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d84d482-cf0a-11e9-978d-bc764e2007e4;
 Wed, 04 Sep 2019 11:52:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 056A6B66A;
 Wed,  4 Sep 2019 11:52:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <fa007bb5-1644-6116-fe96-00b00f7241a4@suse.com>
 <59fc6a13-6008-e537-6bfd-51fd97df676c@citrix.com>
 <b0dff6e4-a5be-445d-76db-cbe923484a92@suse.com>
 <4132f20e-f106-ad77-e6b7-dd39db9d1946@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c5c4c0a5-89b3-0715-1426-6008d920a08c@suse.com>
Date: Wed, 4 Sep 2019 13:52:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4132f20e-f106-ad77-e6b7-dd39db9d1946@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 5/8] x86emul: support MOVDIR{I, 64B} insns
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
 Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxMjoxOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wOS8yMDE5
IDEzOjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDMuMDkuMjAxOSAxMjoyOCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IE9uIDAzLzA5LzIwMTkgMTA6MzksIEphbiBCZXVsaWNoIHdyb3Rl
Ogo+Pj4+IE5vdGUgdGhhdCBTRE0gcmV2aXNpb24gMDcwIGRvZXNuJ3Qgc3BlY2lmeSBleGNlcHRp
b24gYmVoYXZpb3IgZm9yCj4+Pj4gTW9kUk0ubW9kICE9IDBiMTE7IGFzc3VtaW5nICNVRCBoZXJl
Lgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
Pgo+Pj4gV2hhdCBhcmUgd2UgZ29pbmcgdG8gZG8gYWJvdXQgdGhlIC0+d3JpdGUoKSBob29rIGF0
b21pY2l0eT/CoCBJJ20gaGFwcHkKPj4+IHRvIHB1dCBpdCBvbiB0aGUgVE9ETyBsaXN0LCBidXQg
d2UgY2FuJ3Qgc2ltcGx5IGlnbm9yZSB0aGUgcHJvYmxlbS4KPj4gU28gZG8geW91IG5vdCBhZ3Jl
ZSB3aXRoIG15IGFzc2Vzc21lbnQgdGhhdCBvdXIgbWVtY3B5KCkKPj4gaW1wbGVtZW50YXRpb24g
c2F0aXNmaWVzIHRoZSBuZWVkLCBhbmQgaXQncyBqdXN0IG5vdCB2ZXJ5Cj4+IG5pY2UgdGhhdCB0
aGUgLT53cml0ZSgpIGhvb2sgaXMgZGVwZW5kZW50IHVwb24gdGhpcz8KPiAKPiBXZSB1c2UgX19i
dWlsdGluX21lbWNweSgpLCBub3QgbmVjZXNzYXJpbHkgb3VyIG93biBsb2NhbCBpbXBsZW1lbnRh
dGlvbi4KPiAKPiBPdXIgb3duIGNvcHkgdXNlcyByZXAgbW92c3EgZm9sbG93ZWQgYnkgcmVwIG1v
dnNiIG9mIHVwIHRvIDcgYnl0ZXMsCj4gd2hpY2ggZG9lc24ndCBoYW5kbGUgMiBhbmQgNCBieXRl
IGNvcGllcyBhdG9taWNhbGx5LsKgIE1vcmUgZ2VuZXJhbGx5LAo+IHJlcCBtb3ZzIGRvZXNuJ3Qg
cHJvdmlkZSBndWFyYW50ZWVzIGFib3V0IHRoZSBleHRlcm5hbCB2aXNpYmlsaXR5IG9mCj4gY29t
cG9uZW50IHdyaXRlcywgb3dpbmcgdG8gdGhlIG1hbnkgZGlmZmVyZW50IHdheXMgdGhhdCBzdWNo
IHdyaXRlcyBtYXkKPiBiZSBpbXBsZW1lbnRlZCwgYW5kIG9wdGltaXNlZC4KPiAKPiBFdmVuIGlm
IHRoZSBhYm92ZSB3ZXJlIGZpeGVkIChhbmQgSSdtIG5vdCBzdXJlIGNvdWxkIG1ha2UgaXQgY29y
cmVjdAo+IGV2ZW4gZm9yIG1pc2FsaWduZWQgd3JpdGVzKSwgd2UgY2Fubm90IGRlcGVuZCBvbiBv
dXIgb3duIG1lbWNweSBuZXZlcgo+IGNoYW5naW5nIGluIHRoZSBmdXR1cmUuwqAgRm9yIG9uZSwg
aXQgc2hvdWxkIGJlIGEgc3RyYWlnaHQgcmVwIG1vdnNiIG9uCj4gbW9zdCBJbnRlbCBoYXJkd2Fy
ZSB0aGVzZSBkYXlzLCBmb3IgcGVyZm9ybWFuY2UuCgpXZWxsLCBva2F5LCBJJ2xsIGFkZCBhIHBy
ZXBhdGNoIG1ha2luZyBIVk0ncyAtPndyaXRlKCkgaG9vayBub3QgdXNlCm1lbWNweSBhbnltb3Jl
IGZvciBzbWFsbCBhbGlnbmVkIGFjY2Vzc2VzLiBJIGd1ZXNzIEkgc2hvdWxkIGFsc28gZG8KdGhp
cyBmb3IgLT5yZWFkKCkgdGhlbiwgaWYgaXQncyBub3QgdGhlIGNhc2UgYWxyZWFkeS4KCkhvd2V2
ZXIsIGFzIGFuIGltcGxpY2F0aW9uIHRoaXMgbWVhbnMgdGhhdCBNT1ZESVI2NEIgY2FuJ3QgdXNl
IHRoZQotPndyaXRlKCkgaG9vayBhdCBhbGwuIFdlJ2QgbmVlZCB0byBpbnRyb2R1Y2UgYSBuZXcg
aG9vaywgYnV0IHRvIGJlCmhvbmVzdCBJIGhhdmUgbm8gZ29vZCBpZGVhIGhvdyB0byBtb2RlbCBp
dCAoaS5lLiB3aGF0IG90aGVyCm9wZXJhdGlvbnMgaXQgbWlnaHQgY292ZXIgbGF0ZXIgb24pOyBw
b3NzaWJseSB3ZSB3YW50IHRvIGNvbWUgYmFjawp0byB0aGlzIHdoZW4gZGVjaWRpbmcgaG93IHRv
IGltcGxlbWVudCBsYXJnZSBtZW1vcnkgYmxvY2sgYWNjZXNzaW5nCmluc25zIChGWFNBVkUvRlhS
U1RPUiBldGMpLgoKRnVydGhlcm1vcmUgSSBkb24ndCB0aGluayB3ZSBjdXJyZW50bHkgaGF2ZSBt
ZWFucyB0byBtYWtlIHRoZSBzcGxpdApiZWhhdmlvciBvZiBNT1ZESVJJIGNvcnJlY3Q6IEJ5IHVz
aW5nIC0+d3JpdGUoKSwgd2UgY2FuJ3QgZ3VhcmFudGVlCml0J2xsIGJlIGV4YWN0bHkgdHdvIHdy
aXRlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
