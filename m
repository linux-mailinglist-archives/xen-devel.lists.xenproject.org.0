Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B27D9426EC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 15:04:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hb2s3-0000j8-07; Wed, 12 Jun 2019 13:00:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uepN=UL=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hb2s1-0000j3-Lk
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 13:00:53 +0000
X-Inumbo-ID: 19bb7382-8d12-11e9-8d79-af6633585180
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 19bb7382-8d12-11e9-8d79-af6633585180;
 Wed, 12 Jun 2019 13:00:49 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1910C28;
 Wed, 12 Jun 2019 06:00:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7630F3F246;
 Wed, 12 Jun 2019 06:00:48 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514123125.29086-1-julien.grall@arm.com>
 <20190514123125.29086-6-julien.grall@arm.com>
 <alpine.DEB.2.21.1906111526300.13737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <517fa38c-d0fe-33f7-9646-831821b8ba18@arm.com>
Date: Wed, 12 Jun 2019 14:00:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906111526300.13737@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART3 v2 05/12] xen/arm: mm: Introduce
 _PAGE_PRESENT and _PAGE_POPULATE
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
Cc: xen-devel@lists.xenproject.org, Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDExLzA2LzIwMTkgMjM6MzUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEF0IHRoZSBt
b21lbnQsIHRoZSBmbGFncyBhcmUgbm90IGVub3VnaCB0byBkZXNjcmliZSB3aGF0IGtpbmQgb2Yg
dXBkYXRlCj4+IHdpbGwgZG9uZSBvbiB0aGUgVkEgcmFuZ2UuIFRoZXkgbmVlZCB0byBiZSB1c2Vk
IGluIGNvbmp1bmN0aW9uIHdpdGggdGhlCj4+IGVudW0geGVubWFwX29wZXJhdGlvbi4KPj4KPj4g
SXQgd291bGQgYmUgbW9yZSBjb252ZW5pZW50IHRvIGhhdmUgYWxsIHRoZSBpbmZvcm1hdGlvbiBm
b3IgdGhlIHVwZGF0ZQo+PiBpbiBhIHNpbmdsZSBwbGFjZS4KPj4KPj4gVHdvIG5ldyBmbGFncyBh
cmUgYWRkZWQgdG8gcmVtb3ZlIHRoZSByZWxpZW5jZSBvbiB4ZW5tYXBfb3BlcmF0aW9uOgo+PiAg
ICAgIC0gX1BBR0VfUFJFU0VOVDogSW5kaWNhdGUgd2hldGhlciB3ZSBhcmUgYWRkaW5nL3JlbW92
aW5nIHRoZSBtYXBwaW5nCj4+ICAgICAgLSBfUEFHRV9QT1BVTEFURTogSW5kaWNhdGUgd2hldGhl
ciB3ZSBvbmx5IHBvcHVsYXRlIHBhZ2UtdGFibGVzCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1bGll
biBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IFJldmlld2VkLWJ5OiBBbmRyaWkgQW5p
c292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgo+IAo+IExvb2tpbmcgYWhlYWQgaW4gdGhpcyBz
ZXJpZXMsIEkga25vdyB0aGF0IHRoaXMgaXMgZG9uZSBzbyB0aGF0IGxhdGVyIG9uCj4geW91IGNh
biByZW1vdmUgZW51bSB4ZW5tYXBfb3BlcmF0aW9uLiBCdXQgd2hhdCBpcyB0aGUgZW5kIGdvYWw/
IFdoeSBkbwo+IHdlIHdhbnQgdG8gcmVtb3ZlIGVudW0geGVubWFwX29wZXJhdGlvbj8gSSBndWVz
cyBpdCBpcyB0byBtYWtlIHRoZSBjb2RlCj4gbW9yZSByZXVzYWJsZT8KClRoZSBlbmQgZ29hbCBp
cyB0byBzdHJlYW1saW5lIGFzIG11Y2ggYXMgcG9zc2libGUgdG8gcGFnZS10YWJsZSB1cGRhdGUu
IEkgd2FudGVkIAp0byBoYXZlIGFsbCB0aGUgaW5mb3JtYXRpb24gaW4gZmxhZ3MgYmVjYXVzZSBp
dCBpcyBtdWNoIGVhc2llciB0byByZWFzb24gd2l0aCAKb25lIHZhcmlhYmxlIG92ZXIgdHdvIHZh
cmlhYmxlcy4KCkZ1cnRoZXJtb3JlLCB4ODYgY29kZSBhbGxvd3MgbWFwX3BhZ2VzX3RvX3hlbigu
Li4pIHRvIGRlc3Ryb3kgbWFwcGluZ3MgYnV0IG5vdCAKdGhlIHVuZGVybHlpbmcgcGFnZS10YWJs
ZXMuIFRoaXMgaXMgdXNlZCBmb3IgaW5zdGFuY2UgZm9yIHRoZSB2dW5tYXAgdG8gYXZvaWQgCnJl
LWNyZWF0aW5nIHRoZSBwYWdlLXRhYmxlcyBhZnRlcndhcmRzLiBJIGhhdmUgYmVlbiB0aGlua2lu
ZyB0byBpbnRyb2R1Y2UgCnNpbWlsYXIgdGhpbmdzIG9uIEFybS4KCktlZXBpbmcgdGhlIHhlbm1h
cF9vcGVyYXRpb24gd291bGQgbWFrZSBpdCBhd2t3YXJkIHRvIHN1cHBvcnQgaXQgYmVjYXVzZSB5
b3UgCndvdWxkIGhhdmUgdG8gdHJhbnNsYXRlIHRoZSBmbGFncyB0byB0aGUgYWN0dWFsIG9wZXJh
dGlvbnMuCgoKPj4gLS0tCj4+ICAgICAgQ2hhbmdlcyBpbiB2MjoKPj4gICAgICAgICAgLSBBZGQg
QW5kcmlpJ3MgcmV2aWV3ZWQtYnkKPj4gLS0tCj4+ICAgeGVuL2FyY2gvYXJtL21tLmMgICAgICAg
ICAgfCAyICstCj4+ICAgeGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmggfCA5ICsrKysrKystLQo+
PiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL21tLmMgYi94ZW4vYXJjaC9hcm0vbW0uYwo+PiBp
bmRleCA5ZGUyYTExNTBmLi4yMTkyZGVkZTU1IDEwMDY0NAo+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
bW0uYwo+PiArKysgYi94ZW4vYXJjaC9hcm0vbW0uYwo+PiBAQCAtMTA4Myw3ICsxMDgzLDcgQEAg
aW50IG1hcF9wYWdlc190b194ZW4odW5zaWduZWQgbG9uZyB2aXJ0LAo+PiAgIAo+PiAgIGludCBw
b3B1bGF0ZV9wdF9yYW5nZSh1bnNpZ25lZCBsb25nIHZpcnQsIHVuc2lnbmVkIGxvbmcgbnJfbWZu
cykKPj4gICB7Cj4+IC0gICAgcmV0dXJuIHhlbl9wdF91cGRhdGUoUkVTRVJWRSwgdmlydCwgSU5W
QUxJRF9NRk4sIG5yX21mbnMsIDApOwo+PiArICAgIHJldHVybiB4ZW5fcHRfdXBkYXRlKFJFU0VS
VkUsIHZpcnQsIElOVkFMSURfTUZOLCBucl9tZm5zLCBfUEFHRV9QT1BVTEFURSk7Cj4+ICAgfQo+
PiAgIAo+PiAgIGludCBkZXN0cm95X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHYsIHVuc2ln
bmVkIGxvbmcgZSkKPj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS1hcm0vcGFnZS5oIGIv
eGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmgKPj4gaW5kZXggMmJjZGIwZjFhNS4uY2FmMmZhYzFm
ZiAxMDA2NDQKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9wYWdlLmgKPj4gKysrIGIveGVu
L2luY2x1ZGUvYXNtLWFybS9wYWdlLmgKPj4gQEAgLTc2LDYgKzc2LDggQEAKPj4gICAgKgo+PiAg
ICAqIFswOjJdIE1lbW9yeSBBdHRyaWJ1dGUgSW5kZXgKPj4gICAgKiBbMzo0XSBQZXJtaXNzaW9u
IGZsYWdzCj4+ICsgKiBbNV0gICBQcmVzZW50IGJpdAo+PiArICogWzZdICAgUG9wdWxhdGUgcGFn
ZSB0YWJsZQo+IAo+IFs1XSBpcyBwcmV0dHkgY2xlYXIuIEFzIGEgbml0LCBJIHdvdWxkIHByb2Jh
Ymx5IHdyaXRlOgo+IAo+ICAgWzVdIFBhZ2UgUHJlc2VudAoKQmV0dGVyIGFsdGVybmF0aXZlLCBJ
IHdpbGwgdXBkYXRlIHRoZSBjb21tZW50LgoKPiAKPiBiZWNhdXNlIHRoZXJlIGlzIG5vIG5lZWQg
dG8gc2F5ICJiaXQiLCB0aGUgWzVdIG1lYW5zIGl0IGlzIGEgYml0Lgo+IE90aGVyd2lzZSwgc29t
ZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZzoKPiAKPiAgIFs1XSBQcmVzZW50IGluIG1lbW9yeQo+
IAo+IGJ1dCBpdCdzIHVuaW1wb3J0YW50Lgo+IAo+IEl0J3MgWzZdIHRoYXQgd2UgbWlnaHQgd2Fu
dCB0byBleHBsYWluIGEgYml0IGJldHRlcjogaWYgd2Ugc2F5ICJQb3B1bGF0ZQo+IHBhZ2UgdGFi
bGUiIHRoZW4gZXZlcnkgdGltZSB3ZSB3YW50IHRoZSBYZW4gcGFnZXRhYmxlIHRvIGJlIHBvcHVs
YXRlZCB3ZQo+IHdvdWxkIG5lZWQgdG8gcGFzcyBfUEFHRV9QT1BVTEFURSwgZXZlbiB3aGVuIHRo
ZSBwYWdlIGlzIHByZXNlbnQgaW4KPiBtZW1vcnkuIERvIHlvdSBzZWUgd2hhdCBJIG1lYW4/IEkg
YW0gbm90IGVudGlyZWx5IHN1cmUgaG93IHRvIG1ha2UgaXQKPiBjbGVhcmVyLiBNYXliZToKClRv
IGJlIGhvbmVzdCwgSSB3YXMgbm90IGVudGlyZWx5IGhhcHB5IHdpdGggdGhlIGN1cnJlbnQgY29t
bWVudC4gQnV0IEkgYWxzbyAKd2Fzbid0IGFibGUgdG8gZmluZCBhIGJldHRlciBvbmUgOikuCgo+
IAo+ICAgWzZdIE9ubHkgcG9wdWxhdGUgcGFnZSB0YWJsZXMKSSBhbSBoYXBweSB3aXRoIHRoaXMg
YWx0ZXJuYXRpdmUuIEkgd2lsbCB1cGRhdGUgdGhlIGNvbW1lbnQuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
