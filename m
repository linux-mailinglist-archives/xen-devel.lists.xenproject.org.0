Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0727B3B0
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 21:58:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsYDz-0002MT-Gj; Tue, 30 Jul 2019 19:55:55 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsYDy-0002MO-2f
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 19:55:54 +0000
X-Inumbo-ID: 09779163-b304-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 09779163-b304-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 19:55:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1108344;
 Tue, 30 Jul 2019 12:55:52 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 558D33F575;
 Tue, 30 Jul 2019 12:55:52 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-19-julien.grall@arm.com>
 <alpine.DEB.2.21.1907301121510.28600@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <31750a39-1221-f4eb-15ad-0fc4a818eaf8@arm.com>
Date: Tue, 30 Jul 2019 20:55:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907301121510.28600@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 18/35] xen/arm64: head: Introduce a macro
 to get a PC-relative address of a symbol
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
Cc: xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzMwLzE5IDc6MjQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDIyIEp1bCAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFybTY0IHByb3ZpZGVzIGlu
c3RydWN0aW9ucyB0byBsb2FkIGEgUEMtcmVsYXRpdmUgYWRkcmVzcywgYnV0IHdpdGggc29tZQo+
PiBsaW1pdGF0aW9uczoKPj4gICAgIC0gYWRyIGlzIGVuYWJsZSB0byBjb3BlIHdpdGggKy8tMU1C
Cj4+ICAgICAtIGFkcnAgaXMgZW5hbGUgdG8gY29wZSB3aXRoICsvLTRHQiBidXQgcmVsYXRpdmUg
dG8gYSA0S0IgcGFnZQo+PiAgICAgICBhZGRyZXNzCj4+Cj4+IEJlY2F1c2Ugb2YgdGhhdCwgdGhl
IGNvZGUgcmVxdWlyZXMgdG8gdXNlIDIgaW5zdHJ1Y3Rpb25zIHRvIGxvYWQgYW55IFhlbgo+PiBz
eW1ib2wuIFRvIG1ha2UgdGhlIGNvZGUgbW9yZSBvYnZpb3VzLCBpbnRyb2R1Y2luZyBhIG5ldyBt
YWNybyBhZHJfbCBpcwo+PiBpbnRyb2R1Y2VkLgo+Pgo+PiBUaGUgbmV3IG1hY3JvIGlzIHVzZWQg
dG8gcmVwbGFjZSBhIGNvdXBsZSBvZiBvcGVuLWNvZGVkIHVzZSBpbgo+PiBlZmlfeGVuX3N0YXJ0
Lgo+Pgo+PiBUaGUgbWFjcm8gaXMgY29waWVkIGZyb20gTGludXggNS4yLXJjNC4KPiAKPiBJIHdh
cyBnb2luZyB0byBhc2sgd2h5IHRoZSBzdHJhbmdlIG5hbWUgImFkcl9sIiwgbm93IEkga25vdyB3
aHkgOi0pCgpJIHRoaW5rIHRoaXMgc3RhbmRzIGZvciAibG9hZCIuCgo+IAo+IEknZCBzdWdnZXN0
IHRvIG5hbWUgaXQgbW9yZSBjbGVhcmx5IHRvIG1heWJlICJhZHJfcmVsYXRpdmUiPwoKVGhpcyBp
cyBhIGJpdCB3ZWlyZCB0byBoYXZlIG9uZSBmdWxsIHdvcmQgYW5kIHRoZSBvdGhlciBvbmUgc2hv
cnRlbi4gVGhlIApjdXJyZW50IHNvbHV0aW9uIGhhcyB0aGUgYWR2YW50YWdlIHRvIGJlIHNob3J0
IGFuZCB0aGVyZWZvcmUgbG9va3MgbGlrZSAKYW4gaW5zdHJ1Y3Rpb24gKGFuZCBzbyBrZWVwIGV2
ZXJ5dGhpbmcgY29ycmVjdGx5IGFsaWduZWQpLgoKU28gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCB0
aGUgZnVuY3Rpb24gYXMgaXMuCgo+IEluIGFueSBjYXNlOgo+IAo+IEFja2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgpUaGFuayB5b3UuCgo+IAo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29NPgo+IAo+IFR5
cG8gaW4geW91ciBhZGRyZXNzCj4gCj4gCj4+IC0tLQo+PiAgICAgIENoYW5nZXMgaW4gdjI6Cj4+
ICAgICAgICAgIC0gUGF0Y2ggYWRkZWQKPj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL2FybTY0L2hl
YWQuUyB8IDE4ICsrKysrKysrKysrKysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPj4gaW5kZXggOWFmZDg5
ZDQ0Ny4uMjI4N2YzY2U0OCAxMDA2NDQKPj4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQu
Uwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4+IEBAIC0xMTEsNiArMTExLDE4
IEBACj4+ICAgCj4+ICAgI2VuZGlmIC8qICFDT05GSUdfRUFSTFlfUFJJTlRLICovCj4+ICAgCj4+
ICsvKgo+PiArICogUHNldWRvLW9wIGZvciBQQyByZWxhdGl2ZSBhZHIgPHJlZz4sIDxzeW1ib2w+
IHdoZXJlIDxzeW1ib2w+IGlzCj4+ICsgKiB3aXRoaW4gdGhlIHJhbmdlICsvLSA0R0Igb2YgdGhl
IFBDLgo+PiArICoKPj4gKyAqIEBkc3Q6IGRlc3RpbmF0aW9uIHJlZ2lzdGVyICg2NCBiaXQgd2lk
ZSkKPj4gKyAqIEBzeW06IG5hbWUgb2YgdGhlIHN5bWJvbAo+PiArICovCj4+ICsubWFjcm8gIGFk
cl9sLCBkc3QsIHN5bQo+PiArICAgICAgICBhZHJwIFxkc3QsIFxzeW0KPj4gKyAgICAgICAgYWRk
ICBcZHN0LCBcZHN0LCA6bG8xMjpcc3ltCj4+ICsuZW5kbQo+PiArCj4+ICAgLyogTG9hZCB0aGUg
cGh5c2ljYWwgYWRkcmVzcyBvZiBhIHN5bWJvbCBpbnRvIHhiICovCj4+ICAgLm1hY3JvIGxvYWRf
cGFkZHIgeGIsIHN5bQo+PiAgICAgICAgICAgbGRyIFx4YiwgPVxzeW0KPj4gQEAgLTg4NiwxMSAr
ODk4LDkgQEAgRU5UUlkoZWZpX3hlbl9zdGFydCkKPj4gICAgICAgICAgICAqIEZsdXNoIGRjYWNo
ZSBjb3ZlcmluZyBjdXJyZW50IHJ1bnRpbWUgYWRkcmVzc2VzCj4+ICAgICAgICAgICAgKiBvZiB4
ZW4gdGV4dC9kYXRhLiBUaGVuIGZsdXNoIGFsbCBvZiBpY2FjaGUuCj4+ICAgICAgICAgICAgKi8K
Pj4gLSAgICAgICAgYWRycCAgeDEsIF9zdGFydAo+PiAtICAgICAgICBhZGQgICB4MSwgeDEsICM6
bG8xMjpfc3RhcnQKPj4gKyAgICAgICAgYWRyX2wgeDEsIF9zdGFydAo+PiAgICAgICAgICAgbW92
ICAgeDAsIHgxCj4+IC0gICAgICAgIGFkcnAgIHgyLCBfZW5kCj4+IC0gICAgICAgIGFkZCAgIHgy
LCB4MiwgIzpsbzEyOl9lbmQKPj4gKyAgICAgICAgYWRyX2wgeDIsIF9lbmQKPj4gICAgICAgICAg
IHN1YiAgIHgxLCB4MiwgeDEKPj4gICAKPj4gICAgICAgICAgIGJsICAgIF9fZmx1c2hfZGNhY2hl
X2FyZWEKPj4gLS0gCj4+IDIuMTEuMAo+PgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
