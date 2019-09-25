Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F12BE152
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:29:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9CB-0006Si-IQ; Wed, 25 Sep 2019 15:27:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD9CA-0006SW-Il
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:27:10 +0000
X-Inumbo-ID: f0820b72-dfa8-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id f0820b72-dfa8-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 15:27:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D35BAE91;
 Wed, 25 Sep 2019 15:27:09 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190917160202.16770-1-julien.grall@arm.com>
 <5c96e276-4fdb-4879-c162-3f90dbe5021c@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <68142dcd-6d4d-926d-0148-55ea0d6db7d6@suse.com>
Date: Wed, 25 Sep 2019 17:27:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5c96e276-4fdb-4879-c162-3f90dbe5021c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [[PATCH for-4.13]] xen/arm: mm: Allow generic xen
 page-tables helpers to be called early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTc6MjMsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSwKPiAKPiBJIGFtIEND
aW5nIEp1ZXJnZW4gdG8gbWFyayB0aGlzIGFzIGEgYmxvY2tlciBmb3IgNC4xMy4gV2l0aG91dCB0
aGlzIAo+IHBhdGNoLCBYZW4gY2Fubm90IGJlIGJvb3RlZCB1c2luZyBHUlVCLgo+IAo+IENoZWVy
cywKPiAKPiBPbiAxNy8wOS8yMDE5IDE3OjAyLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBj
dXJyZW50IGltcGxlbWVudGF0aW9ucyBvZiB4ZW5fe21hcCwgdW5tYXB9X3RhYmxlKCkgZXhwZWN0
Cj4+IHttYXAsIHVubWFwfV9kb21haW5fcGFnZSgpIHRvIGJlIHVzYWJsZS4gVGhvc2UgaGVscGVy
cyBhcmUgdXNlZCB0bwo+PiBtYXAvdW5tYXAgcGFnZSB0YWJsZXMgd2hpbGUgdXBkYXRlIFhlbiBw
YWdlLXRhYmxlcy4KPj4KPj4gU2luY2UgY29tbWl0IDAyMjM4N2VlMWEgInhlbi9hcm06IG1tOiBE
b24ndCBvcGVuLWNvZGUgWGVuIFBUIHVwZGF0ZSBpbgo+PiB7c2V0LCBjbGVhcn1fZml4bWFwKCki
LCBzZXR1cF9maXhtYXAoKSB3aWxsIG1ha2UgdXNlIG9mIHRoZSBoZWxwZXJzCj4+IG1lbnRpb25l
ZCBhYm92ZS4gV2hlbiBib290aW5nIFhlbiB1c2luZyBHUlVCLCBzZXR1cF9maXhtYXAoKSBtYXkg
YmUgdXNlZAo+PiBiZWZvcmUgbWFwX2RvbWFpbl9wYWdlKCkgY2FuIGJlIGNhbGxlZC4gVGhpcyB3
aWxsIHJlc3VsdCB0byBkYXRhIGFib3J0Ogo+Pgo+PiAoWEVOKSBEYXRhIEFib3J0IFRyYXAuIFN5
bmRyb21lPTB4NQo+PiAoWEVOKSBDUFUwOiBVbmV4cGVjdGVkIFRyYXA6IERhdGEgQWJvcnQKPj4K
Pj4gWy4uLl0KPj4KPj4gKFhFTikgWGVuIGNhbGwgdHJhY2U6Cj4+IChYRU4pwqDCoMKgIFs8MDAw
MDAwMDAwMDI1YWI2Yz5dIG1tLmMjeGVuX3B0X3VwZGF0ZSsweDJiNC8weDU5YyAoUEMpCj4+IChY
RU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI1YWIyMD5dIG1tLmMjeGVuX3B0X3VwZGF0ZSsweDI2OC8w
eDU5YyAoTFIpCj4+IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI1YWU3MD5dIHNldF9maXhtYXAr
MHgxYy8weDJjCj4+IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDJhOWM5OD5dIGNvcHlfZnJvbV9w
YWRkcisweDdjLzB4ZGMKPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMmE0YWUwPl0gaGFzX3hz
bV9tYWdpYysweDE4LzB4MzQKPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMmE1YjVjPl0gYm9v
dGZkdC5jI2Vhcmx5X3NjYW5fbm9kZSsweDM5OC8weDU2MAo+PiAoWEVOKcKgwqDCoCBbPDAwMDAw
MDAwMDAyYTVkZTA+XSBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKzB4YmMvMHgxNDQKPj4gKFhF
TinCoMKgwqAgWzwwMDAwMDAwMDAwMmE1ZWQ0Pl0gYm9vdF9mZHRfaW5mbysweDZjLzB4MjYwCj4+
IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDJhYzBkMD5dIHN0YXJ0X3hlbisweDEwOC8weGM3NAo+
PiAoWEVOKcKgwqDCoCBbPDAwMDAwMDAwMDAyMDA0NGM+XSBhcm02NC9oZWFkLm8jcGFnaW5nKzB4
NjAvMHg4OAo+Pgo+PiBEdXJpbmcgZWFybHkgYm9vdCwgdGhlIHBhZ2UgdGFibGVzIGFyZSBlaXRo
ZXIgc3RhdGljYWxseSBhbGxvY2F0ZWQgaW4KPj4gWGVuIGJpbmFyeSBvciBhbGxvY2F0ZWQgdmlh
IGFsbG9jX2Jvb3RfcGFnZXMoKS4KPj4KPj4gRm9yIHN0YXRpY2FsbHkgYWxsb2NhdGVkIHBhZ2Ut
dGFibGVzLCB0aGV5IHdpbGwgYWxyZWFkeSBiZSBtYXBwZWQgYXMKPj4gcGFydCBvZiBYZW4gYmlu
YXJ5LiBTbyB3ZSBjYW4gZWFzaWx5IGZpbmQgdGhlIHZpcnR1YWwgYWRkcmVzcy4KPj4KPj4gRm9y
IGR5bmFtaWNhbGx5IGFsbG9jYXRlZCBwYWdlLXRhYmxlcywgd2UgbmVlZCB0byByZWx5Cj4+IG1h
cF9kb21haW5fcGFnZSgpIHRvIGJlIGZ1bmN0aW9uYWxseSB3b3JraW5nLgo+Pgo+PiBGb3IgYXJt
MzIsIHRoZSBjYWxsIHdpbGwgYmUgdXNhYmxlIG11Y2ggYmVmb3JlIHBhZ2UgY2FuIGJlIGR5bmFt
aWNhbGx5Cj4+IGFsbG9jYXRlZCAoc2VlIHNldHVwX3BhZ2V0YWJsZXMoKSkuIEZvciBhcm02NCwg
dGhlIGNhbGwgd2lsbCBiZSB1c2FibGUKPj4gYWZ0ZXIgc2V0dXBfeGVuaGVhcF9tYXBwaW5ncygp
Lgo+Pgo+PiBJbiBib3RoIGNhc2VzLCBtZW1vcnkgYXJlIGdpdmVuIHRvIHRoZSBib290IGFsbG9j
YXRvciBhZnRlcndhcmRzLiBTbyB3ZQo+PiBjYW4gcmVseSBvbiBtYXBfZG9tYWluX3BhZ2UoKSBm
b3IgbWFwcGluZyBwYWdlIHRhYmxlcyBhbGxvY2F0ZWQKPj4gZHluYW1pY2FsbHkuCj4+Cj4+IFRo
ZSBoZWxwZXJzIHhlbl97bWFwLCB1bm1hcH1fdGFibGUoKSBhcmUgbm93IHVwZGF0ZWQgdG8gdGFr
ZSBpbnRvCj4+IGFjY291bnQgdGhlIGNhc2Ugd2hlcmUgcGFnZS10YWJsZXMgYXJlIHBhcnQgb2Yg
WGVuIGJpbmFyeS4KPj4KPj4gRml4ZXM6IDAyMjM4N2VlMWEgKCd4ZW4vYXJtOiBtbTogRG9uJ3Qg
b3Blbi1jb2RlIFhlbiBQVCB1cGRhdGUgaW4gCj4+IHtzZXQsIGNsZWFyfV9maXhtYXAoKScpCj4+
IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZWxl
YXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
