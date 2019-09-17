Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8562DB4F52
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 15:33:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iADXo-0001Rl-Oh; Tue, 17 Sep 2019 13:29:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkBD=XM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iADXm-0001RZ-QP
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 13:29:22 +0000
X-Inumbo-ID: 27568de0-d94f-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 27568de0-d94f-11e9-a337-bc764e2007e4;
 Tue, 17 Sep 2019 13:29:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AC8628;
 Tue, 17 Sep 2019 06:29:19 -0700 (PDT)
Received: from [10.37.13.58] (unknown [10.37.13.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 283003F575;
 Tue, 17 Sep 2019 06:29:17 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
References: <osstest-141333-mainreport@xen.org>
 <5f71588b-274a-bdb7-d324-5ff9177a0490@arm.com>
 <ecb6672c-18e0-d949-9e2d-c340413c2c96@suse.com>
 <9b1607d1-773a-f93c-a5fc-1f2ba2e74e84@arm.com>
 <1858d66b-f6f8-a129-96f2-bbb2cf2c3eed@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d7d4ae9d-4a53-bbda-7884-855b169e68ed@arm.com>
Date: Tue, 17 Sep 2019 14:29:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1858d66b-f6f8-a129-96f2-bbb2cf2c3eed@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] dom/xen heap and boot allocator (WAS Re:
 [xen-unstable-smoke test] 141333: regressions - FAIL)
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSnVlcmdlbiwKCk9uIDkvMTcvMTkgMjoxMiBQTSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBP
biAxNy4wOS4xOSAxNDozMSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiAoKyBKdWVyZ2VuKQo+Pgo+
PiBIaSwKPj4KPj4gT24gOS8xNi8xOSA5OjUxIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IE9u
IDE1LjA5LjIwMTkgMTk6NTEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+
IE9uIDkvMTUvMTkgMzowOSBQTSwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+Pj4+PiBm
bGlnaHQgMTQxMzMzIHhlbi11bnN0YWJsZS1zbW9rZSByZWFsIFtyZWFsXQo+Pj4+PiBodHRwOi8v
bG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MvMTQxMzMzLwo+Pj4+Pgo+
Pj4+PiBSZWdyZXNzaW9ucyA6LSgKPj4+Pj4KPj4+Pj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNj
ZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+Pj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBjb3VsZCBu
b3QgYmUgcnVuOgo+Pj4+PiDCoMKgIHRlc3QtYXJtaGYtYXJtaGYteGzCoMKgwqDCoMKgwqDCoMKg
wqDCoCA3IHhlbi1ib290wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZmFpbCAKPj4+
Pj4gUkVHUi4gdnMuIDE0MTI1Mwo+Pj4+Cj4+Pj4gT3NzdGVzdCBkb2VzIG5vdCBwcm92aWRlIHRo
ZSBzdGFjayB0cmFjZSBhcyB0aGUgY3Jhc2ggaGFwcGVuIGJlZm9yZSB0aGUKPj4+PiBjb25zb2xl
IGlzIHNldHVwLCBidXQgSSBtYW5hZ2VkIHRvIHJlcHJvZHVjZSBpdCBsb2NhbGx5Ogo+Pj4+Cj4+
Pj4gKFhFTikgQXNzZXJ0aW9uICdpc194ZW5faGVhcF9tZm4obWFkZHJfdG9fbWZuKG1hKSknIGZh
aWxlZCBhdAo+Pj4+IC9ob21lL2p1bGllbmcvd29ya3MveGVuL3hlbi9pbmNsdWRlL2FzbS9tbS5o
OjI1MAo+Pj4+IChYRU4pIC0tLS1bIFhlbi00LjEzLXVuc3RhYmxlwqAgYXJtMzLCoCBkZWJ1Zz15
wqDCoCBOb3QgdGFpbnRlZCBdLS0tLQo+Pj4+Cj4+Pj4gWy4uLl0KPj4+Pgo+Pj4+IChYRU4pIFhl
biBjYWxsIHRyYWNlOgo+Pj4+IChYRU4pwqDCoMKgIFs8MDAyOTkyYzA+XSBwYWdlX2FsbG9jLmMj
Ym9vdG1lbV9yZWdpb25fYWRkKzB4ZjgvMHgxN2MgKFBDKQo+Pj4+IChYRU4pwqDCoMKgIFs8MDAy
OTk1YWM+XSBpbml0X2Jvb3RfcGFnZXMrMHg4Yy8weDFhMCAoTFIpCj4+Pj4gKFhFTinCoMKgwqAg
WzwwMDI5OTVhYz5dIGluaXRfYm9vdF9wYWdlcysweDhjLzB4MWEwCj4+Pj4gKFhFTinCoMKgwqAg
WzwwMDJhY2MyYz5dIGR0X3VucmVzZXJ2ZWRfcmVnaW9ucysweDI2OC8weDI4NAo+Pj4+IChYRU4p
wqDCoMKgIFs8MDAyYWQ4ZTA+XSBzdGFydF94ZW4rMHg1YzgvMHhlOTAKPj4+PiAoWEVOKcKgwqDC
oCBbPDAwMjAwMDk4Pl0gYXJtMzIvaGVhZC5vI3ByaW1hcnlfc3dpdGNoZWQrMHg0LzB4MTAKPj4+
Pgo+Pj4+IFRoaXMgaXMgaGFwcGVuaW5nIGJlY2F1c2Ugb2YgY29tbWl0IDZlM2U3NzEyMDMgInhl
bi9hcm06IHNldHVwOiAKPj4+PiBSZWxvY2F0ZQo+Pj4+IHRoZSBEZXZpY2UtVHJlZSBsYXRlciBv
biBpbiB0aGUgYm9vdCIuIFNpbmNlIHRoaXMgcGF0Y2gsIG5vbmUgb2YgCj4+Pj4geGVuaGVhcAo+
Pj4+IG1lbW9yeSBpcyBnaXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4+Pgo+Pj4gU28gdGhp
cyBjaGFuZ2Ugd2Fzbid0IHRlc3RlZCBvbiAzMi1iaXQgQXJtIGF0IGFsbCB0aGVuIGJlZm9yZQo+
Pj4gY29tbWl0dGluZz8KPj4KPj4gSSBmb3Jnb3QgdG8gdGVzdCBpdCBiZWZvcmUgc2VuZGluZyB0
aGUgcGF0Y2ggb24gdGhlIE1MIDooLgo+Pgo+Pj4KPj4+PiBUaGUgYm9vdCBhbGxvY2F0b3IgaXMg
Ym9vdHN0cmFwcGluZyBpdHNlbGYgYW5kIHJlLXVzZSBhIHBhZ2UgZnJvbSB0aGUKPj4+PiBmaXJz
dCBhZGRlZCByZWdpb24uIElmIHRoaXMgcmVnaW9uIGlzIG5vdCBhIHhlbmhlYXAgcmVnaW9uLCB0
aGVuIGl0IAo+Pj4+IHdpbGwKPj4+PiBjcmFzaCB3aGVuIGNhbGxpbmcgbWZuX3RvX3ZpcnQoKSBv
ciBsYXRlciBvbiBiZWNhdXNlIHRoZSB2aXJ0dWFsIAo+Pj4+IGFkZHJlc3MKPj4+PiBpcyBub3Qg
bWFwcGVkIGluIG1lbW9yeS4KPj4+Pgo+Pj4+IFRoZSBkZXNjcmlwdGlvbiBvZiB0aGUgYm9vdCBh
bGxvY2F0b3IgaW4gcGFnZV9hbGxvYy5jIGxlYWRzIHRvIHRoaW5rCj4+Pj4gdGhhdCBvbmx5IGRv
bWhlYXAgbWVtb3J5IG1heSBiZSBnaXZlbiB0byB0aGUgYm9vdCBhbGxvY2F0b3IuCj4+Pj4KPj4+
PiBGdXJ0aGVybW9yZSwgYXMgdGhlIGJvb3QgYWxsb2NhdG9yIG1heSBoYXZlIGRvbWhlYXAgcGFn
ZSwgaXQgbWVhbnMgdGhhdAo+Pj4+IGNhbGxpbmcgbWZuX3RvX3ZpcnQobWZuX3goYWxsb2NfYm9v
dF9wYWdlcyguLi4pKSBtYXkgbm90IHdvcmsgd2hlbgo+Pj4+IENPTkZJR19TRVBBUkFURV9YRU5I
RUFQPXkuCj4+Pj4KPj4+PiBJdCBmZWVscyB0byBtZSB0aGF0IGltcG9zaW5nIHRvIGdpdmUgYSB4
ZW5oZWFwIHBhZ2UgdG8gdGhlIGJvb3QKPj4+PiBhbGxvY2F0b3IgaXMgcXVpdGUgdWdseS4gQXMg
dGhlIGJvb3QgYWxsb2NhdG9yIHdpbGwgYmUgdXNlZCBpbiBtb3N0IG9mCj4+Pj4gdGhlIGNhc2Us
IHN0YXRpY2FsbHkgYWxsb2NhdGluZyBib290bWVtX3JlZ2lvbl9saXN0IG1heWJlIHRoZSBiZXN0
LiBBbnkKPj4+PiB0aG91Z2h0cz8KPj4+Cj4+PiBJJ3ZlIGdvbmUgYmFjayB0byA0LjIgY29kZSwg
d2hlcmUgMzItYml0IHg4NiB3YXMgc3RpbGwgc3VwcG9ydGVkLiBUaGVyZQo+Pj4gd2UgaGFkCj4+
Pgo+Pj4gI2lmIGRlZmluZWQoQ09ORklHX1g4Nl8zMikKPj4+IMKgwqDCoMKgIHhlbmhlYXBfaW5p
dGlhbF9waHlzX3N0YXJ0ID0gKFBGTl9VUChfX3BhKCZfZW5kKSkgKyAxKSA8PCAKPj4+IFBBR0Vf
U0hJRlQ7Cj4+PiDCoMKgwqDCoCAvKiBNdXN0IHBhc3MgYSBzaW5nbGUgbWFwcGVkIHBhZ2UgZm9y
IHBvcHVsYXRpbmcgCj4+PiBib290bWVtX3JlZ2lvbl9saXN0LiAqLwo+Pj4gwqDCoMKgwqAgaW5p
dF9ib290X3BhZ2VzKF9fcGEoJl9lbmQpLCB4ZW5oZWFwX2luaXRpYWxfcGh5c19zdGFydCk7Cj4+
PiDCoMKgwqDCoCB4ZW5oZWFwX3BoeXNfZW5kID0gRElSRUNUTUFQX01CWVRFUyA8PCAyMDsKPj4+
ICNlbHNlCj4+Cj4+IEkga25vdyByZWFsaXplIHdlIGhhZCBzaW1pbGFyIGNvbW1lbnQgaW4gdGhl
IGFybTMyIGNvZGU6Cj4+Cj4+ICJOZWVkIGEgc2luZ2xlIG1hcHBlZCBwYWdlIGZvciBwb3B1bGF0
aW5nIGJvb3RtZW1fcmVnaW9uX2xpc3QiCj4+Cj4+Pgo+Pj4gaS5lLiBpdCB3YXMgY2xlYXJseSBp
bnRlbmRlZCBmb3IgdGhlIGZpcnN0IHRoaW5nIGdpdmVuIHRvIHRoZSBib290Cj4+PiBhbGxvY2F0
b3IgdG8gYmUgYSBYZW4gaGVhcCBwYWdlLgo+Pj4KPj4+IEJleW9uZCB0aGlzIG5vIHg4NiBjb2Rl
IHRoYXQgd2Fzbid0IHg4Ni02NCBzcGVjaWZpYyBkZXBlbmRlZCBvbiB0aGVyZQo+Pj4gb25seSBj
b21pbmcgZGlyZWN0LW1hcHBlZCBtZW1vcnkgYmFjayBvdXQgb2YgYWxsb2NfYm9vdF9wYWdlcygp
Lgo+Pj4KPj4+IEJ1dCB5ZXMsIGEgc3RhdGljIGFsbG9jYXRpb24gbWF5IG1ha2Ugc2Vuc2UgKGFu
ZCB0aGVuIGFyZ3VhYmx5IGl0IG1heQo+Pj4gbm90IGV2ZW4gbmVlZCB0byBiZSBhIGZ1bGwgcGFn
ZSkgLSBjb21taXQgMDQwOWUyOWUyYiwgd2hpY2ggaXMgd2hhdAo+Pj4gaGFkIGludHJvZHVjZWQg
Ym9vdG1lbV9yZWdpb25fbGlzdCwgZG9lc24ndCAoYXMgd2FzIHRoZSBjb21tb24gY2FzZQo+Pj4g
YmFjayB0aGVuKSBoYXZlIGFueSBkZXNjcmlwdGlvbiBhdCBhbGwsIGkuZS4gdGhlcmUncyBubyB3
YXkgdG8ga25vdwo+Pj4gd2h5IGl0IHdhc24ndCBkb25lIHRoaXMgd2F5IGluIHRoZSBmaXJzdCBw
bGFjZS4KPj4KPj4gSXQgaXMgcHJvYmFibHkgdG9vIGxhdGUgZm9yIFhlbiA0LjEzIHRvIG1vdmUg
dG8gYSBzdGF0aWMgbGlzdCBmb3IgCj4+IGJvb3RtZW1fcmVnaW9uX2xpc3QgKEp1ZXJnZW4/KSwg
c28gSSBhbSB0aGlua2luZyB0byBmaXggdXAgdGhlIGFybTMyCj4+IGNvZGUgaW5zdGVhZC4KPiAK
PiBEZXBlbmRzIG9uIHRoZSBwYXRjaCBzaXplIGFuZCB0aGUgcmlzayB0byB0YWtlIGl0LiBCdXQg
aW4gZ2VuZXJhbCBJJ2QKPiBwcmVmZXIgYSBzaW1wbGUgc29sdXRpb24sIGVzcGVjaWFsbHkgaW4g
b3JkZXIgdG8gZ2V0IGEgcHVzaCByYXRoZXIKPiBzb29uZXIgdGhhbiBsYXRlci4KCkkgaGF2ZSBq
dXN0IHNlbnQgYSBwYXRjaCB0byBmaXggdGhlIGJyZWFrYWdlOgoKaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wYXRjaC8xMTE0ODg4My8KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
