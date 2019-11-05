Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AC5EF660
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 08:23:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRt9l-0007lu-41; Tue, 05 Nov 2019 07:21:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2f78=Y5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRt9j-0007lp-Re
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 07:21:35 +0000
X-Inumbo-ID: e5b6720a-ff9c-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5b6720a-ff9c-11e9-9631-bc764e2007e4;
 Tue, 05 Nov 2019 07:21:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 28B67B33B;
 Tue,  5 Nov 2019 07:21:34 +0000 (UTC)
To: Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>
References: <4250bba0-1719-60ae-3d1f-350fb5d2021d@suse.com>
 <alpine.DEB.2.21.1911042319560.17054@nanos.tec.linutronix.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <957c98c7-69a0-24cf-22c6-6282de16dc6c@suse.com>
Date: Tue, 5 Nov 2019 08:21:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911042319560.17054@nanos.tec.linutronix.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/stackframe/32: repair 32-bit Xen PV
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 the arch/x86 maintainers <x86@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTEuMjAxOSAyMzo0NCwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+IE9uIFR1ZSwgMjkg
T2N0IDIwMTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IAo+PiBPbmNlIGFnYWluIFJQTCBjaGVja3Mg
aGF2ZSBiZWVuIGludHJvZHVjZWQgd2hpY2ggZG9uJ3QgYWNjb3VudCBmb3IgYQo+PiAzMi1iaXQg
a2VybmVsIGxpdmluZyBpbiByaW5nIDEgd2hlbiBydW5uaW5nIGluIGEgUFYgWGVuIGRvbWFpbi4K
Pj4KPj4gVGhlIGNhc2UgaW4gRklYVVBfRlJBTUUgaGFzIGJlZW4gcHJldmVudGluZyBib290OyBh
ZGp1c3QgQlVHX0lGX1dST05HX0NSMwo+PiBhcyB3ZWxsIGp1c3QgaW4gY2FzZS4KPiAKPiBFaXRo
ZXIgaXQncyByZXF1aXJlZCBhbmQgY29ycmVjdCBvciBpdCdzIG5vdC4gSnVzdCBpbiBjYXNlIGlz
IG5vdCBoZWxwZnVsCj4gYXQgYWxsLgoKX0lmXyB0aGlzIG1hY3JvIHNpdHMgb24gYW55IHBhdGgg
cmVhY2hhYmxlIHdoZW4gcnVubmluZyBQViB1bmRlcgpYZW4sIHRoZW4gaXQncyB3cm9uZy4gSWYg
YW55IHN1Y2ggdXNlIGdldHMgYWRkZWQgZG93biB0aGUgcm9hZCwKdGhlbiBpdCdzIGxhdGVudGx5
IHdyb25nLCB3aGljaCBpcyBiYWQgZW5vdWdoIGltbywgYW5kIGhlbmNlCndhcnJhbnRzIHRoZSBj
aGFuZ2UgZXZlbiB3aXRob3V0IGFuYWx5emluZyB3aGV0aGVyIHRoZXJlJ3MKYWxyZWFkeSBhbiBh
ZmZlY3RlZCBwYXRoLgoKPj4gRml4ZXM6IDNjODhjNjkyYzI4NyAoIng4Ni9zdGFja2ZyYW1lLzMy
OiBQcm92aWRlIGNvbnNpc3RlbnQgcHRfcmVncyIpCj4+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPj4gLS0tIGEvYXJjaC94ODYvZW50cnkvZW50cnlf
MzIuUwo+PiArKysgYi9hcmNoL3g4Ni9lbnRyeS9lbnRyeV8zMi5TCj4+IEBAIC00OCw2ICs0OCwx
MyBAQAo+PiAgCj4+ICAjaW5jbHVkZSAiY2FsbGluZy5oIgo+PiAgCj4+ICsvKgo+PiArICogV2hl
biBydW5uaW5nIG9uIFhlbiBQViwgdGhlIGFjdHVhbCAlY3MgcmVnaXN0ZXIncyBSUEwgaW4gdGhl
IGtlcm5lbCBpcyAxLAo+PiArICogbm90IDAuIElmIHdlIG5lZWQgdG8gZGlzdGluZ3Vpc2ggYmV0
d2VlbiBhICVjcyBmcm9tIGtlcm5lbCBtb2RlIGFuZCBhICVjcwo+PiArICogZnJvbSB1c2VyIG1v
ZGUsIHdlIGNhbiBkbyB0ZXN0ICQyIGluc3RlYWQgb2YgdGVzdCAkMy4KPj4gKyAqLwo+PiArI2Rl
ZmluZSBVU0VSX1NFR01FTlRfUlBMX01BU0sgMgo+IAo+IE5vLiBUaGUgZGVmaW5lIHdhbnQncyB0
byBiZSByaWdodCBuZXh0IHRvIHRoZSBTRUdNRU5UX1JQTF9NQVNLIGRlZmluZQo+IGluY2x1ZGlu
ZyBhIGxlc3MgQVNNIGZvY3Vzc2VkIGNvbW1lbnQgbGlrZSB0aGlzOgo+IAo+IC8qCj4gICogV2hl
biBydW5uaW5nIG9uIFhlbiBQViwgdGhlIGFjdHVhbCBwcml2aWxlZGdlIGxldmVsIG9mIHRoZSBr
ZXJuZWwgaXMgMSwKPiAgKiBub3QgMC4gVGVzdGluZyB0aGUgUmVxdWVzdGVkIFByaXZpbGVkZ2Ug
TGV2ZWwgaW4gYSBzZWdtZW50IHNlbGVjdG9yIHRvCj4gICogZGV0ZXJtaW5lIHdoZXRoZXIgdGhl
IGNvbnRleHQgaXMgdXNlciBtb2RlIG9yIGtlcm5lbCBtb2RlIHdpdGgKPiAgKiBTRUdNRU5UX1JQ
TF9NQVNLIGlzIHdyb25nIGJlY2F1c2UgdGhlIFBWIGtlcm5lbHMgcHJpdmlsZWRnZSBsZXZlbAo+
ICAqIG1hdGNoZXMgdGhlIDB4MDMgbWFzay4KPiAgKgo+ICAqIFRlc3Rpbmcgd2l0aCBVU0VSX1NF
R01FTlRfUlBMX01BU0sgaXMgdmFsaWQgZm9yIGJvdGggbmF0aXZlIGFuZCBYZW4gUFYKPiAgKiBr
ZXJuZWxzIGJlY2F1c2UgUHJpdmlsZWRnZSBMZXZlbCAyIGlzIG5ldmVyIHVzZWQuCj4gICovCj4g
Cj4gSG1tPwoKSSBzaW1wbHkgdXNlZCBhbG1vc3QgZXhhY3RseSB3aGF0IEFuZHkgaGFkIHN1Z2dl
c3RlZCBhcyBhIGNvbW1lbnQuIEhlCmFsc28gZGlkbid0IG9iamVjdCB0byB0aGUgZGVmaW5pdGlv
biBzaXR0aW5nIGhlcmUgKGl0J3Mgbm90IG5lZWRlZAphZnRlciBhbGwgb3V0c2lkZSBvZiB0aGlz
IGZpbGUpLiBDYW4gdGhlIHR3byBvZiB5b3UgcGxlYXNlIHJlYWNoCmFncmVlbWVudCwgZm9yIG1l
IHRvIGFjdCB1cG9uPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
