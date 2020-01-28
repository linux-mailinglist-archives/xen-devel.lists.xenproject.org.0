Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 190C714BE3A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 18:02:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwUDU-00023Z-36; Tue, 28 Jan 2020 16:59:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iQoc=3R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwUDT-00023M-2q
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 16:59:55 +0000
X-Inumbo-ID: 9ae0f616-41ef-11ea-8739-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ae0f616-41ef-11ea-8739-12813bfff9fa;
 Tue, 28 Jan 2020 16:59:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B13F1B15B;
 Tue, 28 Jan 2020 16:59:53 +0000 (UTC)
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
References: <cover.1580148227.git.tamas.lengyel@intel.com>
 <0f94706731f30e8407f64064d33a27f549554250.1580148227.git.tamas.lengyel@intel.com>
 <60bfe54a-0395-228b-d74d-017db819c279@suse.com>
 <CABfawhnsNa-HZRtsuMop-dvV++WRNQj75TmN0LFW=ucs9Dz=SQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f189faf0-107d-6cdb-c5f1-077563c3f40e@suse.com>
Date: Tue, 28 Jan 2020 17:59:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CABfawhnsNa-HZRtsuMop-dvV++WRNQj75TmN0LFW=ucs9Dz=SQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/9] x86/hvm: introduce
 hvm_copy_context_and_params
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDEuMjAyMCAxNzo1NCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFR1ZSwgSmFu
IDI4LCAyMDIwIGF0IDk6NDggQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMjcuMDEuMjAyMCAxOTowNiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
QEAgLTQxMzksNDkgKzQxNDAsMzIgQEAgc3RhdGljIGludCBodm1fYWxsb3dfc2V0X3BhcmFtKHN0
cnVjdCBkb21haW4gKmQsCj4+PiAgICAgIHJldHVybiByYzsKPj4+ICB9Cj4+Pgo+Pj4gLXN0YXRp
YyBpbnQgaHZtb3Bfc2V0X3BhcmFtKAo+Pj4gLSAgICBYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhl
bl9odm1fcGFyYW1fdCkgYXJnKQo+Pj4gK3N0YXRpYyBpbnQgaHZtX3NldF9wYXJhbShzdHJ1Y3Qg
ZG9tYWluICpkLCB1aW50MzJfdCBpbmRleCwgdWludDY0X3QgdmFsdWUpCj4+PiAgewo+Pj4gICAg
ICBzdHJ1Y3QgZG9tYWluICpjdXJyX2QgPSBjdXJyZW50LT5kb21haW47Cj4+PiAtICAgIHN0cnVj
dCB4ZW5faHZtX3BhcmFtIGE7Cj4+PiAtICAgIHN0cnVjdCBkb21haW4gKmQ7Cj4+PiAgICAgIHN0
cnVjdCB2Y3B1ICp2Owo+Pj4gICAgICBpbnQgcmM7Cj4+Pgo+Pj4gLSAgICBpZiAoIGNvcHlfZnJv
bV9ndWVzdCgmYSwgYXJnLCAxKSApCj4+PiAtICAgICAgICByZXR1cm4gLUVGQVVMVDsKPj4+IC0K
Pj4+IC0gICAgaWYgKCBhLmluZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+Pj4gKyAgICBpZiAoIGlu
ZGV4ID49IEhWTV9OUl9QQVJBTVMgKQo+Pj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Cj4+
IFRoZSBlcXVpdmFsZW50IG9mIHRoaXMgb24gdGhlICJnZXQiIHBhdGggbm93IHNlZW1zIHRvIGJl
IGdvbmUuIElzCj4+IHRoZXJlIGFueSByZWFzb24gdGhlIG9uZSBoZXJlIGlzIHN0aWxsIG5lZWRl
ZD8KPj4KPj4+ICtpbnQgaHZtb3Bfc2V0X3BhcmFtKAo+Pj4gKyAgICBYRU5fR1VFU1RfSEFORExF
X1BBUkFNKHhlbl9odm1fcGFyYW1fdCkgYXJnKQo+Pj4gK3sKPj4+ICsgICAgc3RydWN0IHhlbl9o
dm1fcGFyYW0gYTsKPj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZDsKPj4+ICsgICAgaW50IHJjOwo+
Pj4gKwo+Pj4gKyAgICBpZiAoIGNvcHlfZnJvbV9ndWVzdCgmYSwgYXJnLCAxKSApCj4+PiArICAg
ICAgICByZXR1cm4gLUVGQVVMVDsKPj4+ICsKPj4+ICsgICAgaWYgKCBhLmluZGV4ID49IEhWTV9O
Ul9QQVJBTVMgKQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArCj4+PiArICAgIC8q
IE1ha2Ugc3VyZSB0aGUgYWJvdmUgYm91bmQgY2hlY2sgaXMgbm90IGJ5cGFzc2VkIGR1cmluZyBz
cGVjdWxhdGlvbi4gKi8KPj4+ICsgICAgYmxvY2tfc3BlY3VsYXRpb24oKTsKPj4+ICsKPj4+ICsg
ICAgZCA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQoYS5kb21pZCk7Cj4+PiArICAgIGlmICgg
ZCA9PSBOVUxMICkKPj4+ICsgICAgICAgIHJldHVybiAtRVNSQ0g7Cj4+PiArCj4+PiArICAgIHJj
ID0gLUVJTlZBTDsKPj4+ICsgICAgaWYgKCAhaXNfaHZtX2RvbWFpbihkKSApCj4+PiArICAgICAg
ICBnb3RvIG91dDsKPj4KPj4gRGVzcGl0ZSB5b3VyIGNsYWltIHRvIGhhdmUgYWRkcmVzc2VkIG15
IHJlbWFpbmluZyBjb21tZW50IGZyb20gdjQsCj4+IHlvdSBzdGlsbCB1c2UgZ290byBoZXJlIHdo
ZW4gdGhlcmUncyBhbiBlYXN5IGFsdGVybmF0aXZlLgo+IAo+IEkgZGlkbid0IHdyaXRlIHRoaXMg
Y29kZS4gVGhpcyBpcyBwcmVleGlzdGluZyBjb2RlIHRoYXQgSSdtIGp1c3QKPiBtb3ZpbmcuIEkg
ZG9uJ3Qgd2FudCB0byByZXdyaXRlIHByZWV4aXN0aW5nIGNvZGUgaGVyZS4KCldlbGwsIHdpdGgg
dGhlIGNvZGUgbW92ZW1lbnQgeW91IGNvdWxkIChhbmQgaW1vIHNob3VsZCkgX21vdmVfCnRoZSAi
b3V0IiBsYWJlbCBpbnN0ZWFkIG9mIGR1cGxpY2F0aW5nIGl0LgoKPj4+IEBAIC01Mjk3LDYgKzUz
MjIsMzcgQEAgdm9pZCBodm1fc2V0X3NlZ21lbnRfcmVnaXN0ZXIoc3RydWN0IHZjcHUgKnYsIGVu
dW0geDg2X3NlZ21lbnQgc2VnLAo+Pj4gICAgICBhbHRlcm5hdGl2ZV92Y2FsbChodm1fZnVuY3Mu
c2V0X3NlZ21lbnRfcmVnaXN0ZXIsIHYsIHNlZywgcmVnKTsKPj4+ICB9Cj4+Pgo+Pj4gK2ludCBo
dm1fY29weV9jb250ZXh0X2FuZF9wYXJhbXMoc3RydWN0IGRvbWFpbiAqZHN0LCBzdHJ1Y3QgZG9t
YWluICpzcmMpCj4+PiArewo+Pj4gKyAgICBpbnQgcmM7Cj4+PiArICAgIHVuc2lnbmVkIGludCBp
Owo+Pj4gKyAgICBzdHJ1Y3QgaHZtX2RvbWFpbl9jb250ZXh0IGMgPSB7IH07Cj4+PiArCj4+PiAr
ICAgIGZvciAoIGkgPSAwOyBpIDwgSFZNX05SX1BBUkFNUzsgaSsrICkKPj4+ICsgICAgewo+Pj4g
KyAgICAgICAgdWludDY0X3QgdmFsdWUgPSAwOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCBodm1f
Z2V0X3BhcmFtKHNyYywgaSwgJnZhbHVlKSB8fCAhdmFsdWUgKQo+Pj4gKyAgICAgICAgICAgIGNv
bnRpbnVlOwo+Pj4gKwo+Pj4gKyAgICAgICAgaWYgKCAocmMgPSBodm1fc2V0X3BhcmFtKGRzdCwg
aSwgdmFsdWUpKSApCj4+PiArICAgICAgICAgICAgcmV0dXJuIHJjOwo+Pj4gKyAgICB9Cj4+PiAr
Cj4+PiArICAgIGMuc2l6ZSA9IGh2bV9zYXZlX3NpemUoc3JjKTsKPj4+ICsgICAgaWYgKCAoYy5k
YXRhID0gdm1hbGxvYyhjLnNpemUpKSA9PSBOVUxMICkKPj4+ICsgICAgICAgIHJldHVybiAtRU5P
TUVNOwo+Pj4gKwo+Pj4gKyAgICBpZiAoICEocmMgPSBodm1fc2F2ZShzcmMsICZjKSkgKQo+Pgo+
PiBBbHNvIGNvbnRyYXJ5IHRvIHlvdXIgY2xhaW0geW91IHN0aWxsIGRvIGFsbG9jYXRpb24gYW5k
IHNhdmUKPj4gYWZ0ZXIgdGhlIGxvb3AsIGxlYXZpbmcgZHN0IGluIGEgcGFydGx5IG1vZGlmaWVk
IHN0YXRlIGluIG1vcmUKPj4gY2FzZXMgdGhhbiBuZWNlc3NhcnkuIE1heSBJIGFzayB0aGF0IHlv
dSBnbyBiYWNrIHRvIHRoZSB2NAo+PiBjb21tZW50cyBvbmUgbW9yZSB0aW1lPwo+IAo+IEkgZ3Vl
c3MgSSdsbCBkbyB0aGF0IGNhdXNlIEkgdGhvdWdodCB5b3UgYXNrZWQgZm9yIHRoZSBhbGxvY2F0
aW9uIHRvCj4gYmUgbW92ZWQgYXQgdGhlIGVuZC4gSXQgd2FzIHRoZSBvdGhlciB3YXkgYXJvdW5k
IGJlZm9yZSwgc28gSSBndWVzcyBJCj4gZG9uJ3Qga25vdyB3aGF0IHlvdSBhcmUgYXNraW5nIGZv
ci4KCkFsbG9jLCBzYXZlLCBsb29wIG92ZXIgcGFyYW1zLCBsb2FkLCBmcmVlLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
