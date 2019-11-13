Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4023EFB2C3
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:44:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtqD-0000hj-0S; Wed, 13 Nov 2019 14:41:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J2+i=ZF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iUtqB-0000hc-Bc
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:41:51 +0000
X-Inumbo-ID: b9dedd38-0623-11ea-a232-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9dedd38-0623-11ea-a232-12813bfff9fa;
 Wed, 13 Nov 2019 14:41:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BA4FDB1F1;
 Wed, 13 Nov 2019 14:41:49 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20191002112004.25793-1-jgross@suse.com>
 <20191002112004.25793-6-jgross@suse.com>
 <0eb11745-5ddf-b562-3f15-bb1c4e6fba9c@suse.com>
 <d1d31f54-aa1b-ad87-b7e7-4d904072d3b8@suse.com>
 <eb7f4895-41cd-5c95-24be-3090138eaf3b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ffed6cfa-3548-f095-3c49-eead513abfb1@suse.com>
Date: Wed, 13 Nov 2019 15:41:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <eb7f4895-41cd-5c95-24be-3090138eaf3b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] xen: add /buildinfo/config entry to
 hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTEuMTkgMTU6MTIsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEyLjExLjIwMTkgMTc6
NDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4+IE9uIDEyLjExLjE5IDE1OjIyLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4+IE9uIDAyLjEwLjIwMTkgMTM6MjAsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4gQEAgLTc5LDMgKzgwLDExIEBAIHN1YmRpci0kKENPTkZJR19VQlNBTikgKz0gdWJzYW4KPj4+
PiAgICAKPj4+PiAgICBzdWJkaXItJChDT05GSUdfTkVFRFNfTElCRUxGKSArPSBsaWJlbGYKPj4+
PiAgICBzdWJkaXItJChDT05GSUdfSEFTX0RFVklDRV9UUkVFKSArPSBsaWJmZHQKPj4+PiArCj4+
Pj4gK2NvbmZpZ19kYXRhLmM6IC4uLy5jb25maWcKPj4+PiArCSggZWNobyAiY2hhciB4ZW5fY29u
ZmlnX2RhdGFbXSA9IjsgXAo+Pj4+ICsJICAuLi90b29scy9iaW4yYyA8JDw7IFwKPj4+PiArCSAg
ZWNobyAiOyIgKSA+ICRACj4+Pgo+Pj4gRnVydGhlcm1vcmUgaXMgdGhlcmUgYSByZWFzb24gdG8g
ZXhwb3NlIHRoaXMgYXMgcGxhaW4gdGV4dCwgd2hlbgo+Pj4gTGludXggZXhwb3NlcyBhIGd6aXAt
ZWQgdmVyc2lvbiBpbiAvcHJvYz8gVGhlIGZpbGUgaXNuJ3QgdmVyeQo+Pj4gbGFyZ2Ugbm93LCBi
dXQgdGhpcyB3YXMgYWxzbyB0aGUgY2FzZSBmb3IgTGludXggbWFueSB5ZWFycyBhZ28uCj4+Cj4+
IGd6aXAgZGF0YSBtYXkgY29udGFpbiBieXRlcyB3aXRoIDB4MDAuIFN1cHBvcnRpbmcgdGhhdCB3
b3VsZCByZXF1aXJlIGEKPj4gZGlmZmVyZW50IGludGVyZmFjZSBhdCBhbGwgbGV2ZWxzLgo+IAo+
IFRoZW4gcGVyaGFwcyBiZXR0ZXIgZG8gc28gbm93LCB3aGVuIHRoZSBjb2RlIGlzIHN0aWxsIGlu
IGZsdXgsIHRoYW4KPiBhZnRlciB0aGUgZmFjdCwgZXNwZWNpYWxseSBpZiAiYXQgYWxsIGxldmVs
cyIgaXMgbWVhbnQgdG8gYWxzbwo+IGluY2x1ZGUgdGhlIHB1YmxpYyBpbnRlcmZhY2U/CgpJJ2xs
IGhhdmUgYSBsb29rIGludG8gdGhhdC4KCj4gCj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9oeXBmcy5j
Cj4+Pj4gKysrIGIveGVuL2NvbW1vbi9oeXBmcy5jCj4+Pj4gQEAgLTI1LDYgKzI1LDEwIEBAIHN0
YXRpYyBzdHJ1Y3QgaHlwZnNfZW50cnkgaHlwZnNfcm9vdF9lbnRyeSA9IHsKPj4+PiAgICAgICAg
LmRpciA9ICZoeXBmc19yb290LAo+Pj4+ICAgIH07Cj4+Pj4gICAgCj4+Pj4gK3N0YXRpYyBzdHJ1
Y3QgaHlwZnNfZGlyIGh5cGZzX2J1aWxkaW5mbyA9IHsKPj4+PiArICAgIC5saXN0ID0gTElTVF9I
RUFEX0lOSVQoaHlwZnNfYnVpbGRpbmZvLmxpc3QpLAo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiAgICBz
dGF0aWMgaW50IGh5cGZzX2FkZF9lbnRyeShzdHJ1Y3QgaHlwZnNfZGlyICpwYXJlbnQsIHN0cnVj
dCBoeXBmc19lbnRyeSAqbmV3KQo+Pj4+ICAgIHsKPj4+PiAgICAgICAgaW50IHJldCA9IC1FTk9F
TlQ7Cj4+Pj4gQEAgLTMxNiwzICszMjAsMTYgQEAgbG9uZyBkb19oeXBmc19vcCh1bnNpZ25lZCBp
bnQgY21kLAo+Pj4+ICAgIAo+Pj4+ICAgICAgICByZXR1cm4gcmV0Owo+Pj4+ICAgIH0KPj4+PiAr
Cj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0IGh5cGZzX2luaXQodm9pZCkKPj4+PiArewo+Pj4+ICsg
ICAgaW50IHJldDsKPj4+PiArCj4+Pj4gKyAgICByZXQgPSBoeXBmc19uZXdfZGlyKCZoeXBmc19y
b290LCAiYnVpbGRpbmZvIiwgJmh5cGZzX2J1aWxkaW5mbyk7Cj4+Pj4gKyAgICBCVUdfT04ocmV0
KTsKPj4+PiArICAgIHJldCA9IGh5cGZzX25ld19lbnRyeV9zdHJpbmcoJmh5cGZzX2J1aWxkaW5m
bywgImNvbmZpZyIsIHhlbl9jb25maWdfZGF0YSk7Cj4+Pj4gKyAgICBCVUdfT04ocmV0KTsKPj4+
PiArCj4+Pj4gKyAgICByZXR1cm4gMDsKPj4+PiArfQo+Pj4+ICtfX2luaXRjYWxsKGh5cGZzX2lu
aXQpOwo+Pj4KPj4+IEhtbSwgZG8geW91IHJlYWxseSB3YW50IHRvIGNlbnRyYWxpemUgcG9wdWxh
dGlvbiBvZiB0aGUgZmlsZSBzeXN0ZW0KPj4+IGhlcmUsIHJhdGhlciB0aGFuIGhhdmluZyB0aGUg
aW5kaXZpZHVhbCBjb21wb25lbnRzIHRha2UgY2FyZSBvZiBpdD8KPj4KPj4gSSBjYW4gYWRkIGEg
bmV3IHNvdXJjZSwgZS5nLiBjb21tb24vYnVpbGRpbmZvLmMgaWYgeW91IGxpa2UgdGhhdCBiZXR0
ZXIuCj4gCj4gSSB3YXMgcmF0aGVyIHRoaW5raW5nIG9mIG1vdmluZyB0aGlzIGludG8gY29tbW9u
L2tlcm5lbC5jLCBuZXh0IHRvIHRoZQo+IHZlcnNpb24gaHlwZXJjYWxsIGhhbmRsaW5nLCBhbmQg
dG9nZXRoZXIgd2l0aCBleHBvc2luZyB0aGUgc3VnZ2VzdGVkCj4gdmFsdWVzIGhlcmUgYWhlYWQg
b2YgZXhwb3NpbmcgLmNvbmZpZy4KCk9rYXkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
