Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F1124C72
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 12:13:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT1jh-0004Te-RB; Tue, 21 May 2019 10:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT1jg-0004TV-45
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 10:11:08 +0000
X-Inumbo-ID: bf8388b8-7bb0-11e9-9bf7-db1db05397b2
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bf8388b8-7bb0-11e9-9bf7-db1db05397b2;
 Tue, 21 May 2019 10:11:07 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8795B374;
 Tue, 21 May 2019 03:11:06 -0700 (PDT)
Received: from [10.37.13.11] (unknown [10.37.13.11])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 732893F575;
 Tue, 21 May 2019 03:11:05 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190128155909.14289-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904161444520.1370@sstabellini-ThinkPad-X260>
 <1ba05c55-5449-98a9-713b-d932a1f21b4c@arm.com>
 <alpine.DEB.2.10.1904171006020.1370@sstabellini-ThinkPad-X260>
 <d36567cd-7c3e-3921-0355-77c55559d61b@arm.com>
 <alpine.DEB.2.10.1904171027290.1370@sstabellini-ThinkPad-X260>
 <8b742d07-d64c-54b1-4cb0-3ae6641c3c2f@arm.com>
 <alpine.DEB.2.21.1905201404060.16404@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4fc6d6a7-cb28-4ac9-818e-0afdadcc3f4e@arm.com>
Date: Tue, 21 May 2019 11:11:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905201404060.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next] xen/arm: irq: Don't use
 _IRQ_PENDING when handling host interrupt
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
Cc: xen-devel@lists.xenproject.org, andre.przywara@arm.com,
 andrii.anisov@gmail.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDUvMjAvMTkgMTA6MDQgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDIwIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IE9uIDE3LzA0
LzIwMTkgMTg6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdlZCwgMTcgQXBy
IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDE3LzA0LzIw
MTkgMTg6MTIsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4gT24gVHVlLCAxNiBBcHIg
MjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4gSGkgU3RlZmFubywKPj4+Pj4+Cj4+Pj4+
PiBPbiA0LzE2LzE5IDEwOjUxIFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4+Pj4+Pj4g
T24gTW9uLCAyOCBKYW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+Pj4+PiBXaGlsZSBT
UElzIGFyZSBzaGFyZWQgYmV0d2VlbiBDUFUsIGl0IGlzIG5vdCBwb3NzaWJsZSB0byByZWNlaXZl
Cj4+Pj4+Pj4+IHRoZQo+Pj4+Pj4+PiBzYW1lIGludGVycnVwdHMgb24gYSBkaWZmZXJlbnQgQ1BV
IHdoaWxlIHRoZSBpbnRlcnJ1cHQgaXMgaW4KPj4+Pj4+Pj4gYWN0aXZlCj4+Pj4+Pj4+IHN0YXRl
LiBUaGUgZGVhY3RpdmF0aW9uIG9mIHRoZSBpbnRlcnJ1cHQgaXMgZG9uZSBhdCB0aGUgZW5kIG9m
IHRoZQo+Pj4+Pj4+PiBoYW5kbGluZy4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhpcyBtZWFucyB0aGUg
X0lSUV9QRU5ESU5HIGxvZ2ljIGlzIHVuZWNlc3Nhcnkgb24gQXJtIGFzIGEgc2FtZQo+Pj4+Pj4+
PiBpbnRlcnJ1cHQgY2FuIG5ldmVyIGNvbWUgdXAgd2hpbGUgaW4gdGhlIGxvb3AuIFNvIHJlbW92
ZSBpdCB0bwo+Pj4+Pj4+PiBzaW1wbGlmeSB0aGUgaW50ZXJydXB0IGhhbmRsZSBjb2RlLgo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBh
cm0uY29tPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gICAgICB4ZW4vYXJjaC9hcm0vaXJxLmMgfCAz
MiArKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+Pj4+Pj4+PiAgICAgIDEgZmlsZSBj
aGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4KPj4+Pj4+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pcnEuYyBiL3hlbi9hcmNoL2FybS9pcnEuYwo+
Pj4+Pj4+PiBpbmRleCBjNTFjZjMzM2NlLi4zODc3NjU3YTUyIDEwMDY0NAo+Pj4+Pj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vaXJxLmMKPj4+Pj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2lycS5jCj4+
Pj4+Pj4+IEBAIC0xOTksNiArMTk5LDcgQEAgaW50IHJlcXVlc3RfaXJxKHVuc2lnbmVkIGludCBp
cnEsIHVuc2lnbmVkIGludAo+Pj4+Pj4+PiBpcnFmbGFncywKPj4+Pj4+Pj4gICAgICB2b2lkIGRv
X0lSUShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncywgdW5zaWduZWQgaW50IGlycSwgaW50Cj4+
Pj4+Pj4+IGlzX2ZpcSkKPj4+Pj4+Pj4gICAgICB7Cj4+Pj4+Pj4+ICAgICAgICAgIHN0cnVjdCBp
cnFfZGVzYyAqZGVzYyA9IGlycV90b19kZXNjKGlycSk7Cj4+Pj4+Pj4+ICsgICAgc3RydWN0IGly
cWFjdGlvbiAqYWN0aW9uOwo+Pj4+Pj4+PiAgICAgICAgICAgIHBlcmZjX2luY3IoaXJxcyk7Cj4+
Pj4+Pj4+ICAgICAgQEAgLTI0MiwzNSArMjQzLDIyIEBAIHZvaWQgZG9fSVJRKHN0cnVjdCBjcHVf
dXNlcl9yZWdzICpyZWdzLAo+Pj4+Pj4+PiB1bnNpZ25lZAo+Pj4+Pj4+PiBpbnQgaXJxLCBpbnQg
aXNfZmlxKQo+Pj4+Pj4+PiAgICAgICAgICAgICAgZ290byBvdXRfbm9fZW5kOwo+Pj4+Pj4+PiAg
ICAgICAgICB9Cj4+Pj4+Pj4+ICAgICAgLSAgICBzZXRfYml0KF9JUlFfUEVORElORywgJmRlc2Mt
PnN0YXR1cyk7Cj4+Pj4+Pj4+IC0KPj4+Pj4+Pj4gLSAgICAvKgo+Pj4+Pj4+PiAtICAgICAqIFNp
bmNlIHdlIHNldCBQRU5ESU5HLCBpZiBhbm90aGVyIHByb2Nlc3NvciBpcyBoYW5kbGluZyBhCj4+
Pj4+Pj4+IGRpZmZlcmVudAo+Pj4+Pj4+PiAtICAgICAqIGluc3RhbmNlIG9mIHRoaXMgc2FtZSBp
cnEsIHRoZSBvdGhlciBwcm9jZXNzb3Igd2lsbCB0YWtlCj4+Pj4+Pj4+IGNhcmUKPj4+Pj4+Pj4g
b2YKPj4+Pj4+Pj4gaXQuCj4+Pj4+Pj4+IC0gICAgICovCj4+Pj4+Pj4+IC0gICAgaWYgKCB0ZXN0
X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSB8fAo+Pj4+Pj4+PiAtICAgICAgICAg
dGVzdF9iaXQoX0lSUV9JTlBST0dSRVNTLCAmZGVzYy0+c3RhdHVzKSApCj4+Pj4+Pj4+ICsgICAg
aWYgKCB0ZXN0X2JpdChfSVJRX0RJU0FCTEVELCAmZGVzYy0+c3RhdHVzKSApCj4+Pj4+Pj4+ICAg
ICAgICAgICAgICBnb3RvIG91dDsKPj4+Pj4+Pgo+Pj4+Pj4+IEl0IGlzIGEgZ29vZCBpZGVhIHRv
IHJlbW92ZSB0aGUgSVJRX1BFTkRJTkcgbG9naWMsIHRoYXQgaXMgT0suCj4+Pj4+Pj4KPj4+Pj4+
Pgo+Pj4+Pj4+IEhvd2V2ZXIsIGFyZSB3ZSBzdXJlIHRoYXQgd2Ugd2FudCB0byByZW1vdmUgdGhl
IF9JUlFfSU5QUk9HUkVTUwo+Pj4+Pj4+IGNoZWNrCj4+Pj4+Pj4gdG9vPyBJUlEgaGFuZGxlcnMg
c2hvdWxkbid0IGJlIGNhbGxlZCB0d2ljZSBpbiBhIHJvdy4gR2l2ZW4gdGhhdAo+Pj4+Pj4+IF9J
UlFfSU5QUk9HUkVTUyBjYW4gYmUgc2V0IG1hbnVhbGx5IChnaWN2Ml9zZXRfYWN0aXZlX3N0YXRl
KSBpdAo+Pj4+Pj4+IHNlZW1zIGl0Cj4+Pj4+Pj4gd291bGQgYmUgYSBnb29kIGlkZWEgdG8ga2Vl
cCB0aGUgY2hlY2sgYW55d2F5Pwo+Pj4+Pj4KPj4+Pj4+IHNldF9hY3RpdmVfc3RhdGUgaXMgb25s
eSB1c2VkIGJ5IHRoZSB2R0lDIHRvIHJlcGxpY2F0ZSBzdGF0ZSBmcm9tIG9mCj4+Pj4+PiB0aGUK
Pj4+Pj4+IHZpcnR1YWwgaW50ZXJydXB0IHRvIHRoZSBwaHlzaWNhbCBpbnRlcnJ1cHQuIFdlIGRv
bid0IGhhdmUgdGhlIHZpcnR1YWwKPj4+Pj4+IGludGVycnVwdCBpbiB0aGlzIHBhdGggKHNlZSBh
Ym92ZSkuCj4+Pj4+Pgo+Pj4+Pj4gQW55IG90aGVyIHVzZXIgKGUuZyBpbnRlcnJ1cHRzIHJvdXRl
ZCB0byBYZW4pIHdvdWxkIGJlIHByZXR0eSBicm9rZW4uCj4+Pj4+PiBBdAo+Pj4+Pj4gYmVzdAo+
Pj4+Pj4geW91IHdvdWxkIGJyZWFrIHRoZSBpbnRlcnJ1cHQgZmxvdy4gQXQgd29yc3QsIHlvdSBt
YXkgbmV2ZXIgcmVjZWl2ZQo+Pj4+Pj4gdGhlCj4+Pj4+PiBpbnRlcnJ1cHQgYWdhaW4uCj4+Pj4+
Pgo+Pj4+Pj4gU28gSSB0aGluayB3ZSBjYW4gZHJvcCBfSVJRX1BST0dSRVNTIGhlcmUuCj4+Pj4+
Cj4+Pj4+IEkgZ2F2ZSBpdCBhIGNsb3NlIGxvb2suIFlvdSBhcmUgcmlnaHQsIGl0IGlzIHNhZmUg
dG8gcmVtb3ZlIHRoZQo+Pj4+PiBfSVJRX1BST0dSRVNTIGNoZWNrIGhlcmUuCj4+Pj4+Cj4+Pj4+
IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IFRoZSB0aGluZyB0aGF0IHdvcnJpZXMgbWUgYSBiaXQgaXMgdGhh
dCB0ZWNobmljYWxseSBzZXRfYWN0aXZlX3N0YXRlIGlzCj4+Pj4+IHBhcnQgb2YgdGhlIGdpY19o
d19vcGVyYXRpb25zIGZ1bmN0aW9ucyB3aGljaCBhcmUgbm90IG5lY2Vzc2FyaWx5IGd1ZXN0Cj4+
Pj4+IHNwZWNpZmljOiB3ZSBoYXZlbid0IHdyaXR0ZW4gZG93biBhbnl3aGVyZSB0aGF0IHNldF9h
Y3RpdmVfc3RhdGUgY2Fubm90Cj4+Pj4+IGJlIGNhbGxlZCBwYXNzaW5nIG9uZSBvZiB0aGUgeGVu
IGlycXMgYXMgcGFyYW1ldGVyLiBJIGFncmVlIGl0IHdvdWxkIGJlCj4+Pj4+IGJyb2tlbiB0byBk
byBzbywgYnV0IHN0aWxsLi4uIE1heWJlIHdlIHNob3VsZCBhZGQgYSBjb21tZW50Pwo+Pj4+Cj4+
Pj4gSG93IGFib3V0IGFkZGluZyBhbiBBU1NFUlQodGVzdF9iaXQoX0lSUV9HVUVTVCwgJmRlc2Mt
PnN0YXR1cykpID8KPj4+Cj4+PiBldmVuIGJldHRlcgo+Pgo+PiBEbyB5b3Ugd2FudCB0aGUgY2hh
bmdlIHRvIGJlIGluIHRoaXMgcGF0Y2ggb3Igc2VwYXJhdGVseT8KPiAKPiBJbiB0aGlzIHBhdGNo
IHBsZWFzZQoKT2ssIEkgd2lsbCByZXNwaW4gdGhlIHBhdGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
