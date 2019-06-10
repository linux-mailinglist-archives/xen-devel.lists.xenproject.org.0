Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D23B2B9
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 12:07:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haH9v-0003c2-Nk; Mon, 10 Jun 2019 10:04:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haH9u-0003bx-Bw
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 10:04:10 +0000
X-Inumbo-ID: 1656cdec-8b67-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 1656cdec-8b67-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 10:04:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42460344;
 Mon, 10 Jun 2019 03:04:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E2693F246;
 Mon, 10 Jun 2019 03:05:49 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
 <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
Message-ID: <c2e73bc5-4390-7436-21f7-deff8d85db1d@arm.com>
Date: Mon, 10 Jun 2019 11:04:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART1 v3 1/8] xen/arm: Don't boot Xen on
 platform using AIVIVT instruction caches
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
Cc: "committers@xenproject.org" <committers@xenproject.org>,
 xen-devel@lists.xenproject.org, nd@arm.com, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

KCsgQ29tbWl0dGVycykKClBpbmcgYWdhaW4uLi4gSSBoYXZlIHF1aXRlIGEgZmV3IHBhdGNoZXMg
YmxvY2tlZCBvbiB0aGlzIHdvcmsuCgpDaGVlcnMsCgpPbiAyOS8wNS8yMDE5IDE3OjQ0LCBKdWxp
ZW4gR3JhbGwgd3JvdGU6Cj4gR2VudGxlIHBpbmcuCj4gCj4gT24gMjAvMDUvMjAxOSAyMDo1Mywg
SnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjAvMDUvMjAxOSAxOTo1NiwgU3Rl
ZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdy
YWxsIHdyb3RlOgo+Pj4+IFRoZSBBSVZJVlQgaXMgYSB0eXBlIG9mIGluc3RydWN0aW9uIGNhY2hl
IGF2YWlsYWJsZSBvbiBBcm12Ny4gVGhpcyBpcwo+Pj4+IHRoZSBvbmx5IGNhY2hlIG5vdCBpbXBs
ZW1lbnRpbmcgdGhlIElWSVBUIGV4dGVuc2lvbiBhbmQgdGhlcmVmb3JlCj4+Pj4gcmVxdWlyaW5n
IHNwZWNpZmljIGNhcmUuCj4+Pj4KPj4+PiBUbyBzaW1wbGlmeSBtYWludGVuYW5jZSByZXF1aXJl
bWVudHMsIFhlbiB3aWxsIG5vdCBib290IG9uIHBsYXRmb3JtCj4+Pj4gdXNpbmcgQUlWSVZUIGNh
Y2hlLgo+Pj4+Cj4+Pj4gVGhpcyBzaG91bGQgbm90IGJlIGFuIGlzc3VlIGJlY2F1c2UgWGVuIEFy
bTMyIGNhbiBvbmx5IGJvb3Qgb24gYSBzbWFsbAo+Pj4+IG51bWJlciBvZiBwcm9jZXNzb3JzIChz
ZWUgYXJjaC9hcm0vYXJtMzIvcHJvYy12Ny5TKS4gQWxsIG9mIHRoZW0gYXJlCj4+Pj4gbm90IHVz
aW5nIEFJVklWVCBjYWNoZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+Pgo+Pj4gQXMgd2UgaGF2ZSBhbHJlYWR5IGRpc2N1c3Nl
ZCwgSSBhbSBPSyB3aXRoIHRoaXMgYW5kIG5laXRoZXIgb2YgdXMKPj4+IGZvcmVzZWUgYW55IGlz
c3Vlcy4gR2l2ZW4gdGhhdCBpdCBjb3VsZCBiZSBjb25zaWRlcmVkIGFzIGEgZHJvcCBpbgo+Pj4g
c3VwcG9ydCBmb3Igc29tZXRoaW5nLCBJIHRoaW5rIGl0IHdvdWxkIGJlIG5pY2UgdG8gc2VuZCBh
biBlbWFpbCBvdXRzaWRlCj4+PiBvZiB0aGUgc2VyaWVzIHRvIHNheSB3ZSB3b24ndCBzdXBwb3J0
IEFJVklWVCBwcm9jZXNzb3JzIGFueSBsb25nZXIsCj4+PiB1c2luZyB3b3JkcyBlYXNpZXIgdG8g
dW5kZXJzdGFuZCB0byB1c2VycyAobm90IG5lY2Vzc2FyaWx5IGRldmVsb3BlcnMpLgo+Pgo+PiBV
c2VycyBvZiB3aGF0PyBYZW4gdXBzdHJlYW0gd2lsbCAqcGFuaWMqIG9uIGV2ZXJ5IHByb2Nlc3Nv
ciBub3QgbGlzdGVkIGluIAo+PiBhcmNoL2FybS9hcm0zMi9wcm9jLXY3LlMgZXZlbiB3aXRob3V0
IHRoaXMgcGF0Y2guCj4+Cj4+PiBXb3VsZCB5b3UgYmUgYWJsZSB0byBkbyB0aGF0PyBJIGNhbiBo
ZWxwIHlvdSB3aXRoIHRoZSB0ZXh0Lgo+PiBXaGlsZSBpbiB0aGVvcnkgdGhpcyBzb3VuZHMgc2Vu
c2libGUsIGZvciByZWFjaGluZyB0aGUgcGFuaWMgYWRkZWQgaW4gdGhpcyAKPj4gcGF0Y2gsIHlv
dSB3b3VsZCBuZWVkIG91dC1vZi10cmVlIHBhdGNoZXMuIFNvIGluIHByYWN0aWNlIHlvdSBhcmUg
c2F5aW5nIHdlIAo+PiBzaG91bGQgY2FyZSBhYm91dCBvdXQtb2YtdHJlZSB1c2Vycy4KPj4KPj4g
SSBoYXZlIGFscmVhZHkgZW5vdWdoIHRvIGNhcmUgYWJvdXQgWGVuIHVwc3RyZWFtIGl0c2VsZiB0
aGF0IG91dC1vZi10cmVlIGlzIG15IAo+PiBsYXN0IGNvbmNlcm4uIElmIHNvbWVvbmUgd2VyZSB1
c2luZyBvdXQtb2YtdHJlZSB0aGVuIHRoZW4gdG9vIGJhZCB0aGV5IHdpbGwgCj4+IHNlZSB0aGUg
cGFuaWMuCj4+Cj4+IFRCSCwgSSBhbSBwcmV0dHkgc3VyZSB3ZSBkb24ndCBjdXJyZW50bHkgcHJv
cGVybHkgZm9sbG93IHRoZSBtYWludGVuYW5jZSAKPj4gcmVxdWlyZW1lbnRzLi4uIFNvIHdlIGFy
ZSBtYWtpbmcgdGhlbSBhIGZhdm9yIHRvIGFkZCBhIHBhbmljLiBCZWZvcmUgdGhleSAKPj4gY291
bGQganVzdCBzZWUgcmFuZG9tIGNvcnJ1cHRpb24uLi4KPj4KPj4gQW55d2F5LCBmZWVsIGZyZWUg
dG8gc2VuZCB0aGUgbWVzc2FnZSB5b3Vyc2VsZi4KPj4KPj4+Cj4+Pgo+Pj4+IC0tLQo+Pj4+Cj4+
Pj4gwqDCoMKgwqAgQ2hhbmdlcyBpbiB2MzoKPj4+PiDCoMKgwqDCoMKgwqDCoMKgIC0gUGF0Y2gg
YWRkZWQKPj4+PiAtLS0KPj4+PiDCoCB4ZW4vYXJjaC9hcm0vc2V0dXAuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfCA1ICsrKysrCj4+Pj4gwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9wcm9jZXNzb3Iu
aCB8IDUgKysrKysKPj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9z
ZXR1cC5jCj4+Pj4gaW5kZXggY2NiMGYxODFlYS4uZmFhZjAyOWI5OSAxMDA2NDQKPj4+PiAtLS0g
YS94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jCj4+
Pj4gQEAgLTUyNiwxMCArNTI2LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tbSh1bnNp
Z25lZCBsb25nIGR0Yl9wYWRkciwgCj4+Pj4gc2l6ZV90IGR0Yl9zaXplKQo+Pj4+IMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBib290X21mbl9zdGFydCwgYm9vdF9tZm5fZW5kOwo+Pj4+IMKgwqDC
oMKgwqAgaW50IGk7Cj4+Pj4gwqDCoMKgwqDCoCB2b2lkICpmZHQ7Cj4+Pj4gK8KgwqDCoCBjb25z
dCB1aW50MzJfdCBjdHIgPSBSRUFEX0NQMzIoQ1RSKTsKPj4+PiDCoMKgwqDCoMKgIGlmICggIWJv
b3RpbmZvLm1lbS5ucl9iYW5rcyApCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHBhbmljKCJObyBt
ZW1vcnkgYmFua1xuIik7Cj4+Pj4gK8KgwqDCoCAvKiBXZSBvbmx5IHN1cHBvcnRzIGluc3RydWN0
aW9uIGNhY2hlcyBpbXBsZW1lbnRpbmcgdGhlIElWSVBUIAo+Pj4+IGV4dGVuc2lvbi4gKi8KPj4+
Cj4+PiBQbGVhc2UgbWVudGlvbiB0aGF0IElWSVBUIGNhbiBvbmx5IGJlIGltcGxlbWVudGVkIGJ5
IFBJUFQgYW5kIFZJUFQKPj4+IGNhY2hlcywgbm90IGJ5IEFJVklWVCBjYWNoZXMuIFRoYXQgc2hv
dWxkIG1ha2UgaXQgc3RyYWlnaHRmb3J3YXJkIHRvCj4+PiB1bmRlcnN0YW5kIHRoZSByZWFzb24g
Zm9yIHRoZSBwYW5pYyBiZWxvdy4KPj4KPj4gSSB3b3VsZCBwcmVmZXIgdG8gYWRkICJUaGlzIGlz
IG5vdCB0aGUgY2FzZSBvZiBBSVZJVlQiIHJhdGhlciB0aGFuIHNwZWxsaW5nIAo+PiBvdXQgdGhl
IG90aGVyIGNhY2hlcy4KPj4KPj4gQ2hlZXJzLAo+Pgo+Pgo+IAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
