Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D402C8F59
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 19:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFi1N-0006QE-Sw; Wed, 02 Oct 2019 17:02:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2BXq=X3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFi1L-0006Q9-H3
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 17:02:35 +0000
X-Inumbo-ID: 6dd39a86-e536-11e9-971c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 6dd39a86-e536-11e9-971c-12813bfff9fa;
 Wed, 02 Oct 2019 17:02:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A8B91000;
 Wed,  2 Oct 2019 10:02:34 -0700 (PDT)
Received: from [10.37.10.48] (unknown [10.37.10.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15E133F706;
 Wed,  2 Oct 2019 10:02:32 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190930205618.29942-1-sstabellini@kernel.org>
 <53deb838-677a-5d4b-7b40-fcdb935751cc@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e5f4a172-3215-0128-bab4-cc0afedcce82@arm.com>
Date: Wed, 2 Oct 2019 18:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <53deb838-677a-5d4b-7b40-fcdb935751cc@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] xen/arm: boot with device trees
 with "mmu-masters" and "iommus"
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

K0p1ZXJnZW4KCkhpLAoKT24gMTAvMS8xOSA0OjE2IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4g
T24gMzAuMDkuMTkgMjM6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiAKPiBIaSBTdGVm
YW5vCj4gCj4+IFNvbWUgRGV2aWNlIFRyZWVzIG1heSBleHBvc2UgYm90aCBsZWdhY3kgU01NVSBh
bmQgZ2VuZXJpYyBJT01NVSBiaW5kaW5ncwo+PiB0b2dldGhlci4gSG93ZXZlciwgdGhlIFNNTVUg
ZHJpdmVyIGluIFhlbiBpcyBvbmx5IHN1cHBvcnRpbmcgdGhlIGxlZ2FjeQo+PiBTTU1VIGJpbmRp
bmdzLCBsZWFkaW5nIHRvIGZhdGFsIGluaXRpYWxpemF0aW9uIGVycm9ycyBhdCBib290IHRpbWUu
Cj4+Cj4+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGJvb3RpbmcgcHJvYmxlbSBieSBhZGRpbmcgYSBj
aGVjayB0bwo+PiBpb21tdV9hZGRfZHRfZGV2aWNlOiBpZiB0aGUgWGVuIGRyaXZlciBkb2Vzbid0
IHN1cHBvcnQgdGhlIG5ldyBnZW5lcmljCj4+IGJpbmRpbmdzLCBhbmQgdGhlIGRldmljZSBpcyBi
ZWhpbmQgYW4gSU9NTVUsIGRvIG5vdCByZXR1cm4gZXJyb3IuIFRoZQo+PiBmb2xsb3dpbmcgaW9t
bXVfYXNzaWduX2R0X2RldmljZSBzaG91bGQgc3VjY2VlZC4KPj4KPj4gVGhpcyBjaGVjayB3aWxs
IGJlY29tZSBzdXBlcmZsdW91cywgaGVuY2UgcmVtb3ZhYmxlLCBvbmNlIHRoZSBYZW4gU01NVQo+
PiBkcml2ZXIgZ2V0cyBzdXBwb3J0IGZvciB0aGUgZ2VuZXJpYyBJT01NVSBiaW5kaW5ncy4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlA
eGlsaW54LmNvbT4KPj4gLS0tCj4+IMKgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90
cmVlLmMgfCAxNyArKysrKysrKysrKysrKysrLQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTYgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYyAKPj4gYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9k
ZXZpY2VfdHJlZS5jCj4+IGluZGV4IGNjOTAwYmFjNzAuLjI3ZTI2NWI5MzYgMTAwNjQ0Cj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2RldmljZV90cmVlLmMKPj4gKysrIGIveGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYwo+PiBAQCAtMTU1LDcgKzE1NSwyMiBAQCBp
bnQgaW9tbXVfYWRkX2R0X2RldmljZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wKQo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAqIHRoZXNlIGNhbGxiYWNrIGltcGxlbWVudGVkLgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhb3BzLT5hZGRfZGV2
aWNlIHx8ICFvcHMtPmR0X3hsYXRlICkKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FSU5WQUw7Cj4+ICvCoMKgwqDCoMKgwqDCoCB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC8qCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBTb21lIERldmljZSBUcmVlcyBtYXkg
ZXhwb3NlIGJvdGggbGVnYWN5IFNNTVUgYW5kIGdlbmVyaWMKPj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIElPTU1VIGJpbmRpbmdzIHRvZ2V0aGVyLiBIb3dldmVyLCB0aGUgU01NVSBkcml2
ZXIgaXMgb25seQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc3VwcG9ydGluZyB0aGUg
Zm9ybWVyIGFuZCB3aWxsIHByb3RlY3QgdGhlbSBkdXJpbmcgdGhlCj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgKiBpbml0aWFsaXphdGlvbi4gU28gd2UgbmVlZCB0byBza2lwIHRoZW0gYW5k
IG5vdCByZXR1cm4KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIGVycm9yIGhlcmUuCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
ICogWFhYOiBUaGlzIGNhbiBiZSBkcm9wcGVkIHdoZW4gdGhlIFNNTVUgaXMgYWJsZSB0byBkZWFs
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB3aXRoIGdlbmVyaWMgYmluZGluZ3MuCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
aWYgKCBkdF9kZXZpY2VfaXNfcHJvdGVjdGVkKG5wKSApCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4gK8KgwqDC
oMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggIWR0X2RldmljZV9pc19hdmFp
bGFibGUoaW9tbXVfc3BlYy5ucCkgKQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVh
azsKPiAKPiBQYXRjaCBsb29rcyBjb3JyZWN0IGFuZCBxdWl0ZSB3ZWxsIGRlc2NyaWJlZC4uLgo+
IAo+IAo+IFlvdSBjYW4gYWRkIChpZiBuZWVkZWQpOgo+IAo+IFJldmlld2VkLWJ5OiBPbGVrc2Fu
ZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+CgpBY2tlZC1ieTog
SnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
