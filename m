Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C5534398
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 12:01:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hY6Cb-0002l4-Ps; Tue, 04 Jun 2019 09:57:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0KbE=UD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hY6Ca-0002ky-8X
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 09:57:56 +0000
X-Inumbo-ID: 38d77226-86af-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 38d77226-86af-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 09:57:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A05380D;
 Tue,  4 Jun 2019 02:57:54 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873AB3F246;
 Tue,  4 Jun 2019 02:57:52 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
 <5CF637250200007800234EFB@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <05b9bd00-8202-38e4-3207-883d3d1d5c10@arm.com>
Date: Tue, 4 Jun 2019 10:57:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF637250200007800234EFB@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA2LzQvMTkgMTA6MTcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA0LjA2LjE5
IGF0IDExOjAxLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiA2LzQvMTkgODow
NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwMy4wNi4xOSBhdCAxOToxNSwgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+IHdyb3RlOgo+Pj4+IEl0IHR1cm5zIG91dCB0aGF0IHRo
ZSBmaXJzdCBjb21taXQgdGhhdCBmYWlscyB0byBib290IG9uIHJvY2hlc3RlciBpcwo+Pj4+ICAg
ICBlMjAyZmViNzEzIHhlbi9jbWRsaW5lOiBGaXggYnVnZ3kgc3RybmNtcChzLCBMSVRFUkFMLCBz
cyAtIHMpIGNvbnN0cnVjdAo+Pj4+IChldmVuIHdpdGggdGhlICJlYjhhY2JhODJhIHhlbjogRml4
IGJhY2twb3J0IG9mIC4uIiBhcHBsaWVkKQo+Pj4KPj4+IE5vdyB0aGF0J3MgcGFydGljdWxhcmx5
IG9kZCBhIHJlZ3Jlc3Npb24gY2FuZGlkYXRlLiBJdCBkb2Vzbid0Cj4+PiB0b3VjaCBhbnkgQXJt
IGNvZGUgYXQgYWxsIChub3IgZG9lcyB0aGUgZml4dXAgY29tbWl0KS4gQW5kIHRoZQo+Pj4gY29t
bW9uIGNvZGUgY2hhbmdlcyBkb24ndCBsb29rICJyaXNreSIgZWl0aGVyOyB0aGUgb25lIHRoaW5n
IHRoYXQKPj4+IGp1bXBzIG91dCBhcyB0aGUgbW9zdCBsaWtlbHkgb2YgYWxsIHRoZSB1bmxpa2Vs
eSBjYW5kaWRhdGVzIHdvdWxkCj4+PiBzZWVtIHRvIGJlIHRoZSB4ZW4vY29tbW9uL2VmaS9ib290
LmMgY2hhbmdlLCBidXQgaWYgdGhlcmUgd2FzCj4+PiBhIHByb2JsZW0gdGhlcmUgdGhlbiB0aGUg
RUZJIGJvb3Qgb24gQXJtIHdvdWxkIGJlIGxhdGVudGx5Cj4+PiBicm9rZW4gaW4gb3RoZXIgd2F5
cyBhcyB3ZWxsLiBQbHVzLCBvZiBjb3Vyc2UsIHlvdSBzYXkgdGhhdCB0aGUKPj4+IHNhbWUgY2hh
bmdlIGlzIG5vIHByb2JsZW0gb24gNC4xMi4KPj4+Cj4+PiBPZiBjb3Vyc2UgdGhlIGNvbW1pdCBp
dHNlbGYgY291bGQgYmUgZnVydGhlciAiYmlzZWN0ZWQiIC0gYWxsCj4+PiBjaGFuZ2VzIG90aGVy
IHRoYW4gdGhlIGludHJvZHVjdGlvbiBvZiBjbWRsaW5lX3N0cmNtcCgpIGFyZQo+Pj4gY29tcGxl
dGVseSBpbmRlcGVuZGVudCBvZiBvbmUgYW5vdGhlci4KPj4KPj4gSSB0aGluayB0aGlzIGlzIGp1
c3QgYSByZWQtaGVycmluZy4gVGhlIGNvbW1pdCBpcyBwcm9iYWJseSBtb2RpZnlpbmcKPj4gZW5v
dWdoIHRoZSBsYXlvdXQgb2YgWGVuIHRoYXQgVExCIGNvbmZsaWN0IHdpbGwgYXBwZWFyLgo+Pgo+
PiBBbnRob255IHNhaWQgYmFja3BvcnRpbmcgMDBjOTZkNzc0MiAieGVuL2FybTogbW06IFNldC11
cCBwYWdlIHBlcm1pc3Npb24KPj4gZm9yIFhlbiBtYXBwaW5ncyBlYXJsaWVyIG9uIiBtYWtlcyBz
dGFnaW5nLTQuMTEgYm9vdHMuIFRoaXMgcGF0Y2gKPj4gcmVtb3ZlcyBzb21lIG9mIHRoZSBwb3Rl
bnRpYWwgY2F1c2Ugb2YgVExCIGNvbmZsaWN0Lgo+Pgo+PiBJIGhhdmVuJ3Qgc3VnZ2VzdGVkIGEg
YmFja3BvcnQgb2YgdGhpcyBwYXRjaCBzbyBmYXIsIGJlY2F1c2UgdGhlcmUgYXJlCj4+IHN0aWxs
IFRMQiBjb25mbGljdCBwb3NzaWJsZSB3aXRoaW4gdGhlIGZ1bmN0aW9uIG1vZGlmaWVkLiBJdCBt
aWdodCBhbHNvCj4+IGJlIHBvc3NpYmxlIHRoYXQgaXQgZXhwb3NlcyBtb3JlIG9mIFRMQiBjb25m
bGljdCBhcyBtb3JlIHdvcmsgaW4gWGVuIGlzCj4+IG5lZWRlZCAoc2VlIG15IE1NLVBBUlRuIHNl
cmllcykuCj4+Cj4+IEkgZG9uJ3Qga25vdyB3aGV0aGVyIGJhY2twb3J0aW5nIHRoaXMgcGF0Y2gg
aXMgd29ydGggaXQgY29tcGFyZSB0byB0aGUKPj4gcmlzayBpdCBpbnRyb2R1Y2VzLgo+IAo+IFdl
bGwsIGlmIHlvdSBkb24ndCBiYWNrcG9ydCB0aGlzLCB3aGF0J3MgdGhlIGFsdGVybmF0aXZlIHJv
YWQgdG93YXJkcyBhCj4gc29sdXRpb24gaGVyZT8gSSdtIGFmcmFpZCB0aGUgdHdvIG9mIHlvdSB3
aWxsIG5lZWQgdG8gZGVjaWRlIG9uZSB3YXkgb3IKPiBhbm90aGVyLgoKVGhlICJ0d28iIGJlaW5n
PwoKTG9va2luZyBhdCB0aGUgY29kZSBhZ2Fpbiwgd2Ugbm93IGF2b2lkIHJlcGxhY2luZyA0S0Ig
ZW50cnkgd2l0aCAyTUIgCmJsb2NrIGVudHJ5IHdpdGhvdXQgcmVzcGVjdGluZyB0aGUgQnJlYWst
QmVmb3JlLU1ha2Ugc2VxdWVuY2UuIFNvIHRoaXMgCmlzIG9uZSAoYWN0dWFsbHkgdHdvKSBsZXNz
IHBvdGVudGlhbCBzb3VyY2Ugb2YgVExCIGNvbmZsaWN0LgoKVGhpcyBwYXRjaCBtYXkgaW50cm9k
dWNlIG1vcmUgc291cmNlIG9mIFRMQiBjb25mbGljdCBpcyB0aGUgcHJvY2Vzc29yIGlzIApjYWNo
aW5nIGludGVybWVkaWF0ZSB3YWxrLiBCdXQgdGhpcyB3YXMgYWxyZWFkeSB0aGUgY2FzZSBiZWZv
cmUsIHNvIGl0IAptYXkgYmUgYXMgYmFkIGFzIEkgZmlyc3QgdGhvdWdodC4KCkkgd291bGQgZGVm
aW5pdGVseSBsaWtlIHRvIGhlYXIgYW4gb3BpbmlvbiBmcm9tIFN0ZWZhbm8gaGVyZS4KCj4gCj4g
SW4gYW55IGV2ZW50IHRoaXMgc291bmRzIHRvIG1lIGFzIGlmIGEgc2ltaWxhciBwcm9ibGVtIGNv
dWxkIGFwcGVhciBhdAo+IGFueSB0aW1lIG9uIGFueSBicmFuY2guIE5vdCBhIHZlcnkgbmljZSBz
dGF0ZSB0byBiZSBpbiAuLi4KVGhhbmtmdWxseSBtb3N0IG9mIHRob3NlIGlzc3VlcyB3aWxsIGFw
cGVhciBhdCBib290IHRpbWUuIFRoZSB1cGRhdGUgb2YgClhlbiBwYWdlLXRhYmxlcyBhdCBydW50
aW1lIGlzIHNvcnQgb2YgY29ycmVjdCAobWlzc2luZyBhIGNvdXBsZSBvZiBsb2NrKS4KCkJ1dCB0
aGUgZmFpbHVyZSB3aWxsIGRlcGVuZCBvbiB5b3VyIGNvZGUuIEkgZXhwZWN0IHRoYXQgd2Ugd291
bGQgbm90IHNlZSAKdGhlIGZhaWx1cmUgaW4gYWxsIHRoZSBBcm0gcGxhdGZvcm1lZCB1c2VkIGlu
IG9zc3Rlc3QgYnV0IFRodW5kZXItWC4KCkl0IGlzIG5vdCBhIG5pY2Ugc3RhdGUgdG8gYmUsIGJ1
dCB0aGUgdGFzayBpcyBxdWl0ZSBpbXBvcnRhbnQgYXMgWGVuIHdhcyAKZGVzaWduZWQgb24gd3Jv
bmcgYXNzdW1wdGlvbi4gVGhpcyBpbXBsaWVzIHRvIHJld29yayBtb3N0IG9mIHRoZSBib290IAph
bmQgbWVtb3J5IG1hbmFnZW1lbnQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
