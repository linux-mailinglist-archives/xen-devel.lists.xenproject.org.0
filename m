Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E49A85A4
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 16:29:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5WEi-00013Z-G7; Wed, 04 Sep 2019 14:26:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5WEh-00013I-5Y
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 14:26:15 +0000
X-Inumbo-ID: f2b4a507-cf1f-11e9-abb6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2b4a507-cf1f-11e9-abb6-12813bfff9fa;
 Wed, 04 Sep 2019 14:26:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 03292B623;
 Wed,  4 Sep 2019 14:26:12 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <4ba2503f-20b2-3670-ba16-8b03e69f3937@bitdefender.com>
 <813b92ae-0f4a-22ec-db30-6c43be246708@suse.com>
 <f7034f7b-95a2-474a-913b-99665f1ddc2d@bitdefender.com>
 <5d7ad447-49a7-de5d-8fef-4d548b4c484c@suse.com>
 <bcc9f20f-eb65-83c2-7cb7-2fdc2f361d46@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <26d5e277-1228-63bf-daef-374f2a6a63ab@suse.com>
Date: Wed, 4 Sep 2019 16:26:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <bcc9f20f-eb65-83c2-7cb7-2fdc2f361d46@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDkuMjAxOSAxNjoxNCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gCj4g
Cj4gT24gMDQuMDkuMjAxOSAxNjoxNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA0LjA5LjIw
MTkgMTU6MDQsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4KPj4+Cj4+PiBPbiAw
NC4wOS4yMDE5IDE1OjE0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwNC4wOS4yMDE5IDEz
OjUxLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+Pj4gT24g
MDMuMDkuMjAxOSAxODo1MiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwMi4wOS4yMDE5
IDEwOjExLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToKPj4+Pj4+PiBAQCAtMTM1NSw2
ICsxMzU1LDIzIEBAIHZvaWQgcDJtX2luaXRfYWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1
bnNpZ25lZCBpbnQgaSkKPj4+Pj4+PiAgICAgICAgIGVwdCA9ICZwMm0tPmVwdDsKPj4+Pj4+PiAg
ICAgICAgIGVwdC0+bWZuID0gcGFnZXRhYmxlX2dldF9wZm4ocDJtX2dldF9wYWdldGFibGUocDJt
KSk7Cj4+Pj4+Pj4gICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2ldID0gZXB0LT5lcHRwOwo+
Pj4+Pj4+ICsKPj4+Pj4+PiArICAgIGlmICggc2V0X3N2ZSApCj4+Pj4+Pj4gKyAgICB7Cj4+Pj4+
Pj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyBnZm4gPSAwLCBtYXhfZ3BmbiA9IGRvbWFpbl9nZXRf
bWF4aW11bV9ncGZuKGQpOwo+Pj4+Pj4+ICsKPj4+Pj4+PiArICAgICAgICBmb3IoIDsgZ2ZuIDwg
bWF4X2dwZm47ICsrZ2ZuICkKPj4+Pj4+PiArICAgICAgICB7Cj4+Pj4+Pj4gKyAgICAgICAgICAg
IG1mbl90IG1mbjsKPj4+Pj4+PiArICAgICAgICAgICAgcDJtX2FjY2Vzc190IGE7Cj4+Pj4+Pj4g
KyAgICAgICAgICAgIHAybV90eXBlX3QgdDsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAgICAgICAgICAg
IGFsdHAybV9nZXRfZWZmZWN0aXZlX2VudHJ5KHAybSwgX2dmbihnZm4pLCAmbWZuLCAmdCwgJmEs
Cj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFQMk1HRVRf
cXVlcnkpOwo+Pj4+Pj4+ICsgICAgICAgICAgICBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4oZ2Zu
KSwgbWZuLCBQQUdFX09SREVSXzRLLCB0LCBhLCB0cnVlKTsKPj4+Pj4+PiArCj4+Pj4+Pj4gKyAg
ICAgICAgfQo+Pj4+Pj4+ICsgICAgfQo+Pj4+Pj4+ICAgICB9Cj4+Pj4+Pgo+Pj4+Pj4gSG93IGxv
bmcgaXMgdGhpcyBsb29wIGdvaW5nIHRvIHRha2UgZm9yIGEgaHVnZSBndWVzdD8gSU9XIGhvdwo+
Pj4+Pj4gY29tZSB0aGVyZSdzIG5vIHByZWVtcHRpb24gaW4gaGVyZSwgb3Igc29tZSBvdGhlciBt
ZWNoYW5pc20KPj4+Pj4+IHRvIGJvdW5kIGV4ZWN1dGlvbiB0aW1lPwo+Pj4+Pgo+Pj4+PiBCZWNh
dXNlIHRoaXMgaXMgZG9uZSBmb3IgdGhlIGluaXRpYWxpemF0aW9uIG9mIGEgbmV3IHZpZXcgYW5k
IHRoZSBwMm0gaXMKPj4+Pj4gbG9ja2VkLgo+Pj4+Cj4+Pj4gV2VsbCwgdGhpcyBtYWtlcyBoYW5k
bGluZyB0aGlzIHRoZSB3YXkgeW91IHdhbnQgaXQgY2xvc2UgdG8KPj4+PiBpbXBvc3NpYmxlLCBi
dXQgaXMgbm90IGFuIGFyZ3VtZW50IGFnYWluc3QgdGhlIG5lZWQgZm9yIHByZWVtcHRpb24KPj4+
PiBoZXJlLiBKdXN0IGxpa2UgaXQgaGFkIHR1cm5lZCBvdXQgdG8gYmUgdW5yZWFzb25hYmxlIHRv
Cj4+Pj4gcHJlZW1wdGl2ZWx5IGhhbmRsZSBvdGhlciBQMk0gYWRqdXN0bWVudHMgKHdoaWNoIGlz
IHdoeQo+Pj4+IHAybS1lcHQuYzpyZXNvbHZlX21pc2NvbmZpZygpIGFuZCBwMm0tcHQuYzpkb19y
ZWNhbGMoKSBnb3QKPj4+PiBpbnRyb2R1Y2VkKSwgSSdtIGFmcmFpZCB5b3UnbGwgaGF2ZSB0byB1
c2Ugc29tZSBvdGhlciB0ZWNobmlxdWUKPj4+PiBoZXJlIChwb3NzaWJseSBidWlsZGluZyBvbiB0
b3Agb2YgdGhlIG1lbnRpb25lZCBmdW5jdGlvbnMpLgo+Pj4+Cj4+Pgo+Pj4gSSB0aGluayB0aGF0
IHRoZSBtZWNoYW5pc20gZnJvbSBwMm1fc2V0X21lbV9hY2Nlc3NfbXVsdGkoKSBjYW4gc3VpdCB0
aGlzCj4+PiBjYXNlLCBzdGFydCB0aGUgbG9vcCwgc2V0ICxpZihoeXBlcmNhbGxfcHJlZW1wdF9j
aGVjaygpKSByYyA9Cj4+PiBuZXh0X3Vuc2V0X2dmbjsKPj4+Cj4+PiBBbmQgZm9yIHRoaXMgdG8g
d29yayBpdCBzaG91bGQgaGF2ZSBhIG5ldyAic3RhcnRfZ2ZuIiBwYXJhbWV0ZXIgc28gdGhlCj4+
PiBjYWxsZXIgY2FuIGlzc3VlIG11bHRpcGxlIGh5cGVyY2FsbHMgdW50aWwgZ2ZuID09IG1heF9n
Zm4uCj4+Cj4+IEhtbSwgcG9zc2libGUuIEkgdG9vayB5b3VyIHByZXZpb3VzIHJlcGx5IHRvIG1l
YW4gdGhhdCBpdCBpcwo+PiBpbXBvcnRhbnQgZm9yIHRoZSBwMm0gdG8gbm90IGdldCB1bmxvY2tl
ZCBpbiB0aGUgbWlkZGxlIG9mIHRoaXMKPj4gcHJvY2Vzcy4gSWYgdGhpcyB3YXMgYSB3cm9uZyB1
bmRlcnN0YW5kaW5nIG9mIG1pbmUsIHRoZW4geWVzLAo+PiAiY29udmVudGlvbmFsIiBwcmVlbXB0
aW9uIGxpa2UgeW91IG91dGxpbmUgaXQgb3VnaHQgdG8gd29yay4KPj4KPiAKPiBUaGVyZSBhcmUg
dHdvIHBvc3NpYmxlIHdheXMgdG8gc29sdmUgdGhpczoKPiAxLiB0aGUgY29udmVudGlvbmFsIHBy
ZWVtcHRpb24gd2F5IGFuZCB3aXRoIHRoaXMgSSBkbyBub3QgcmV0dXJuIG9rIG9uIAo+IHRoZSBp
bml0IGZ1bmN0aW9uIHVudGlsIHRoZSBmaW5hbCBnZm4gaGFzIHRoZSBiaXQgc2V0IChjb2RlIHdp
bGwgaGF2ZSB0byAKPiBjaGFuZ2UgdG8gYWNjb21tb2RhdGUgdGhpcyBuZXcgb3B0aW9uL3ByZWVt
cHRpb24pLgo+IAo+IDIuIGFzIHlvdSBkZXNjcmliZWQgYW5kIHdvcmsgd2l0aCBwMm0tPnJlY2Fs
YygpIChJIHdpbGwgaGF2ZSB0byBjaGVjayAKPiB0aGlzIG91dCB0byBoYXZlIGEgY29ycmVjdCBp
ZGVhIG9mIHdoYXQgaXMgdG8gYmUgZG9uZSkuCj4gCj4gV2hhdCBkbyB5b3UgdGhpbmsgaXMgdGhl
IHByZWZlcnJlZCB3YXkgdG8gY29udGludWUgd2l0aCB0aGlzPwoKVW5sZXNzIEknbSBtaXNzaW5n
IGluZm9ybWF0aW9uIG9uIHRoZSByZXF1aXJlbWVudHMgSSB0aGluayBlaXRoZXIKd291bGQgYmUg
ZmluZS4gSWYgdGhlIGNoYW5nZSB3YXMgbXVjaCBzaW1wbGVyIHVzaW5nIHRoZSByZWNhbGMKY29k
ZSwgcGVyaGFwcyB0aGF0J2QgYmUgdGhlIHdheSB0byBnby4gSW4gYWxsIG90aGVyIGNhc2VzIEkn
ZApzdWdnZXN0IHRvIHRyeSB0byBsZWF2ZSB0aGUgYWxyZWFkeSBub24tdHJpdmlhbCByZWNhbGMg
Y29kZSBhbG9uZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
