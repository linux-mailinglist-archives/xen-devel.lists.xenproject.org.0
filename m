Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6092E27C
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 18:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW1gP-0004B8-Ho; Wed, 29 May 2019 16:44:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW1gN-0004B3-WD
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 16:44:08 +0000
X-Inumbo-ID: f8a39f62-8230-11e9-92bd-f3ffff3b94d4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f8a39f62-8230-11e9-92bd-f3ffff3b94d4;
 Wed, 29 May 2019 16:44:05 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08F07341;
 Wed, 29 May 2019 09:44:05 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B5983F5AF;
 Wed, 29 May 2019 09:44:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190514121132.26732-1-julien.grall@arm.com>
 <20190514121132.26732-2-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201143390.16404@sstabellini-ThinkPad-T480s>
 <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
Message-ID: <0172ad95-1a78-8f2f-9f11-a74089829fb9@arm.com>
Date: Wed, 29 May 2019 17:44:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <42c29444-01b0-cb6a-a8e7-3642175402f7@arm.com>
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

R2VudGxlIHBpbmcuCgpPbiAyMC8wNS8yMDE5IDIwOjUzLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4g
SGksCj4gCj4gT24gMjAvMDUvMjAxOSAxOTo1NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+
PiBPbiBUdWUsIDE0IE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBUaGUgQUlWSVZU
IGlzIGEgdHlwZSBvZiBpbnN0cnVjdGlvbiBjYWNoZSBhdmFpbGFibGUgb24gQXJtdjcuIFRoaXMg
aXMKPj4+IHRoZSBvbmx5IGNhY2hlIG5vdCBpbXBsZW1lbnRpbmcgdGhlIElWSVBUIGV4dGVuc2lv
biBhbmQgdGhlcmVmb3JlCj4+PiByZXF1aXJpbmcgc3BlY2lmaWMgY2FyZS4KPj4+Cj4+PiBUbyBz
aW1wbGlmeSBtYWludGVuYW5jZSByZXF1aXJlbWVudHMsIFhlbiB3aWxsIG5vdCBib290IG9uIHBs
YXRmb3JtCj4+PiB1c2luZyBBSVZJVlQgY2FjaGUuCj4+Pgo+Pj4gVGhpcyBzaG91bGQgbm90IGJl
IGFuIGlzc3VlIGJlY2F1c2UgWGVuIEFybTMyIGNhbiBvbmx5IGJvb3Qgb24gYSBzbWFsbAo+Pj4g
bnVtYmVyIG9mIHByb2Nlc3NvcnMgKHNlZSBhcmNoL2FybS9hcm0zMi9wcm9jLXY3LlMpLiBBbGwg
b2YgdGhlbSBhcmUKPj4+IG5vdCB1c2luZyBBSVZJVlQgY2FjaGUuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPj4KPj4gQXMgd2UgaGF2
ZSBhbHJlYWR5IGRpc2N1c3NlZCwgSSBhbSBPSyB3aXRoIHRoaXMgYW5kIG5laXRoZXIgb2YgdXMK
Pj4gZm9yZXNlZSBhbnkgaXNzdWVzLiBHaXZlbiB0aGF0IGl0IGNvdWxkIGJlIGNvbnNpZGVyZWQg
YXMgYSBkcm9wIGluCj4+IHN1cHBvcnQgZm9yIHNvbWV0aGluZywgSSB0aGluayBpdCB3b3VsZCBi
ZSBuaWNlIHRvIHNlbmQgYW4gZW1haWwgb3V0c2lkZQo+PiBvZiB0aGUgc2VyaWVzIHRvIHNheSB3
ZSB3b24ndCBzdXBwb3J0IEFJVklWVCBwcm9jZXNzb3JzIGFueSBsb25nZXIsCj4+IHVzaW5nIHdv
cmRzIGVhc2llciB0byB1bmRlcnN0YW5kIHRvIHVzZXJzIChub3QgbmVjZXNzYXJpbHkgZGV2ZWxv
cGVycykuCj4gCj4gVXNlcnMgb2Ygd2hhdD8gWGVuIHVwc3RyZWFtIHdpbGwgKnBhbmljKiBvbiBl
dmVyeSBwcm9jZXNzb3Igbm90IGxpc3RlZCBpbiAKPiBhcmNoL2FybS9hcm0zMi9wcm9jLXY3LlMg
ZXZlbiB3aXRob3V0IHRoaXMgcGF0Y2guCj4gCj4+IFdvdWxkIHlvdSBiZSBhYmxlIHRvIGRvIHRo
YXQ/IEkgY2FuIGhlbHAgeW91IHdpdGggdGhlIHRleHQuCj4gV2hpbGUgaW4gdGhlb3J5IHRoaXMg
c291bmRzIHNlbnNpYmxlLCBmb3IgcmVhY2hpbmcgdGhlIHBhbmljIGFkZGVkIGluIHRoaXMgCj4g
cGF0Y2gsIHlvdSB3b3VsZCBuZWVkIG91dC1vZi10cmVlIHBhdGNoZXMuIFNvIGluIHByYWN0aWNl
IHlvdSBhcmUgc2F5aW5nIHdlIAo+IHNob3VsZCBjYXJlIGFib3V0IG91dC1vZi10cmVlIHVzZXJz
Lgo+IAo+IEkgaGF2ZSBhbHJlYWR5IGVub3VnaCB0byBjYXJlIGFib3V0IFhlbiB1cHN0cmVhbSBp
dHNlbGYgdGhhdCBvdXQtb2YtdHJlZSBpcyBteSAKPiBsYXN0IGNvbmNlcm4uIElmIHNvbWVvbmUg
d2VyZSB1c2luZyBvdXQtb2YtdHJlZSB0aGVuIHRoZW4gdG9vIGJhZCB0aGV5IHdpbGwgc2VlIAo+
IHRoZSBwYW5pYy4KPiAKPiBUQkgsIEkgYW0gcHJldHR5IHN1cmUgd2UgZG9uJ3QgY3VycmVudGx5
IHByb3Blcmx5IGZvbGxvdyB0aGUgbWFpbnRlbmFuY2UgCj4gcmVxdWlyZW1lbnRzLi4uIFNvIHdl
IGFyZSBtYWtpbmcgdGhlbSBhIGZhdm9yIHRvIGFkZCBhIHBhbmljLiBCZWZvcmUgdGhleSBjb3Vs
ZCAKPiBqdXN0IHNlZSByYW5kb20gY29ycnVwdGlvbi4uLgo+IAo+IEFueXdheSwgZmVlbCBmcmVl
IHRvIHNlbmQgdGhlIG1lc3NhZ2UgeW91cnNlbGYuCj4gCj4+Cj4+Cj4+PiAtLS0KPj4+Cj4+PiDC
oMKgwqDCoCBDaGFuZ2VzIGluIHYzOgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAtIFBhdGNoIGFkZGVk
Cj4+PiAtLS0KPj4+IMKgIHhlbi9hcmNoL2FybS9zZXR1cC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8IDUgKysrKysKPj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcHJvY2Vzc29yLmggfCA1ICsr
KysrCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+Pj4g
aW5kZXggY2NiMGYxODFlYS4uZmFhZjAyOWI5OSAxMDA2NDQKPj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS9zZXR1cC5jCj4+PiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+Pj4gQEAgLTUyNiwxMCAr
NTI2LDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9tbSh1bnNpZ25lZCBsb25nIGR0Yl9w
YWRkciwgCj4+PiBzaXplX3QgZHRiX3NpemUpCj4+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcg
Ym9vdF9tZm5fc3RhcnQsIGJvb3RfbWZuX2VuZDsKPj4+IMKgwqDCoMKgwqAgaW50IGk7Cj4+PiDC
oMKgwqDCoMKgIHZvaWQgKmZkdDsKPj4+ICvCoMKgwqAgY29uc3QgdWludDMyX3QgY3RyID0gUkVB
RF9DUDMyKENUUik7Cj4+PiDCoMKgwqDCoMKgIGlmICggIWJvb3RpbmZvLm1lbS5ucl9iYW5rcyAp
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcGFuaWMoIk5vIG1lbW9yeSBiYW5rXG4iKTsKPj4+ICvC
oMKgwqAgLyogV2Ugb25seSBzdXBwb3J0cyBpbnN0cnVjdGlvbiBjYWNoZXMgaW1wbGVtZW50aW5n
IHRoZSBJVklQVCBleHRlbnNpb24uICovCj4+Cj4+IFBsZWFzZSBtZW50aW9uIHRoYXQgSVZJUFQg
Y2FuIG9ubHkgYmUgaW1wbGVtZW50ZWQgYnkgUElQVCBhbmQgVklQVAo+PiBjYWNoZXMsIG5vdCBi
eSBBSVZJVlQgY2FjaGVzLiBUaGF0IHNob3VsZCBtYWtlIGl0IHN0cmFpZ2h0Zm9yd2FyZCB0bwo+
PiB1bmRlcnN0YW5kIHRoZSByZWFzb24gZm9yIHRoZSBwYW5pYyBiZWxvdy4KPiAKPiBJIHdvdWxk
IHByZWZlciB0byBhZGQgIlRoaXMgaXMgbm90IHRoZSBjYXNlIG9mIEFJVklWVCIgcmF0aGVyIHRo
YW4gc3BlbGxpbmcgb3V0IAo+IHRoZSBvdGhlciBjYWNoZXMuCj4gCj4gQ2hlZXJzLAo+IAo+IAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
