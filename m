Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056CCBE272
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:28:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDA6z-0007fz-7u; Wed, 25 Sep 2019 16:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KYcU=XU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDA6y-0007fu-7a
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 16:25:52 +0000
X-Inumbo-ID: 23758baa-dfb1-11e9-8628-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 23758baa-dfb1-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 16:25:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 754351570;
 Wed, 25 Sep 2019 09:25:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A6B9C3F59C;
 Wed, 25 Sep 2019 09:25:49 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-7-sstabellini@kernel.org>
 <8e13c7ad-c3cb-aa46-744b-8dc01fe70718@arm.com>
 <alpine.DEB.2.21.1909241056070.24909@sstabellini-ThinkPad-T480s>
 <3d883055-b997-92e1-3121-e383959a5e25@arm.com>
 <alpine.DEB.2.21.1909250907480.24909@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <83b76ef2-98b6-8169-ea8f-dbfc79f40b25@arm.com>
Date: Wed, 25 Sep 2019 17:25:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909250907480.24909@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 7/8] xen/arm: introduce nr_spis
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyNS8wOS8yMDE5IDE3OjE2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
V2VkLCAyNSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBIaSwKPj4KPj4gT24gMjQv
MDkvMjAxOSAxODo1NiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+Pj4gT24gV2VkLCAxMSBT
ZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4+IEhpIFN0ZWZhbm8sCj4+Pj4KPj4+PiBP
biA4LzIxLzE5IDQ6NTMgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+Pj4gV2UgZG9u
J3QgaGF2ZSBhIGNsZWFyIHdheSB0byBrbm93IGhvdyBtYW55IHZpcnR1YWwgU1BJcyB3ZSBuZWVk
IGZvciB0aGUKPj4+Pj4gZG9tMC1sZXNzIGRvbWFpbnMuIEludHJvZHVjZSBhIG5ldyBvcHRpb24g
dW5kZXIgeGVuLGRvbWFpbiB0byBzcGVjaWZ5Cj4+Pj4+IHRoZSBudW1iZXIgb2YgU1BJcyB0byBh
bGxvY2F0ZSBmb3IgYSBkb21haW4uCj4+Pj4+Cj4+Pj4+IFRoZSBwcm9wZXJ0eSBpcyBvcHRpb25h
bC4gV2hlbiBhYnNlbnQsIHdlJ2xsIHVzZSB0aGUgcGh5c2ljYWwgbnVtYmVyIG9mCj4+Pj4+IEdJ
QyBsaW5lcyBmb3IgZG9tMC1sZXNzIGRvbWFpbnMsIGp1c3QgbGlrZSBmb3IgZG9tMC4gR2l2ZW4g
dGhhdAo+Pj4+PiBkb20wLWxlc3MgVk1zIGFyZSBtZWFudCBmb3Igc3RhdGljIHBhcnRpdGlvbmlu
ZyBzY2VuYXJpb3Mgd2hlcmUgdGhlCj4+Pj4+IG51bWJlciBvZiBWTXMgaXMgdmVyeSBsb3csIGlu
Y3JlYXNlZCBtZW1vcnkgb3ZlcmhlYWQgc2hvdWxkIG5vdCBiZSBhCj4+Pj4+IHByb2JsZW0sIGFu
ZCBpdCBpcyBwb3NzaWJsZSB0byBtaW5pbWl6ZSBpdCB1c2luZyAibnJfc3BpcyIuCj4+Pj4+Cj4+
Pj4+IFJlbW92ZSB0aGUgb2xkIHNldHRpbmcgb2YgbnJfc3BpcyBiYXNlZCBvbiB0aGUgcHJlc2Vu
Y2Ugb2YgdGhlIHZwbDAxMS4KPj4+Pgo+Pj4+IEkgYW0gYWZyYWlkIHRoaXMgc3RpbGwgZG9lcyBu
b3QgZXhwbGFpbiB0aGUgaW1wbGljYXRpb25zIG9mIHRoaXMgcGF0Y2ggdG8KPj4+PiBjdXJyZW50
IHNldHVwICh3aXRoIGFuZCB3aXRob3V0IFZQTDAxMSkuCj4+Pj4KPj4+PiBGb3IgaW5zdGFuY2Us
IHdpdGggeW91ciBjaGFuZ2UsIFZQTDAxMSBtYXkgbm90IHdvcmsgYW55bW9yZS4gSW1hZ2luZSB3
ZQo+Pj4+IGRlY2lkZQo+Pj4+IHRvIHB1c2ggdGhlIHZwbDAxMSBpbnRlcnJ1cHQgdG93YXJkcyB0
aGUgZW5kIG9mIHRoZSBJbnRlcnJ1cHQgSUQgc3BhY2UKPj4+PiAoaS5lLgo+Pj4+IDEwMTkpLgo+
Pj4+Cj4+Pj4gSSBkb24ndCB0aGluayB3ZSB3YW50IHRoZSB1c2VyIHRvIGhhdmUgdG8gc2VsZWN0
IG5yX3NwaXMgYnkgaGltc2VsZiBmb3IKPj4+PiB0aGlzCj4+Pj4gY2FzZS4KPj4+Pgo+Pj4+IFJl
Z2FyZGluZyB0aGUgY2hhbmdlIHdpdGhvdXQgdnBsMDExLCB0aGlzIGlzIG5vdCBleHBsYWluZWQg
d2h5IGFsbCB0aGUKPj4+PiBkb21haW5zCj4+Pj4gKGV2ZW4gdGhlIG9uZSB3aXRob3V0IFNQSXMg
cm91dGVkKSB3aWxsIGhhdmUgU1BJcyBleHBvc2VkLiBGb3IgaW5zdGFuY2UsCj4+Pj4gaWYKPj4+
PiB5b3Ugd2VyZSB0byBleHBvc2UgMjU2IGludGVycnVwdHMgZm9yIDQgZG9tYWlucywgdGhpcyB3
aWxsIHJvdWdobHkgdXNlCj4+Pj4gODBLQiBvZgo+Pj4+IG1lbW9yeS4gSSBkb24ndCB0aGluayB0
aGlzIGlzIHdoYXQgeW91IGhhZCBpbiBtaW5kIGFzICJsb3cgZm9vdHByaW50Ii4KPj4+ICAgIFdo
YXQgZG8geW91IHRoaW5rIG9mIHRoZSBmb2xsb3dpbmc6Cj4+Pgo+Pj4gVGhlIGltcGxpY2F0aW9u
IG9mIHRoaXMgY2hhbmdlIGlzIHRoYXQgd2l0aG91dCBucl9zcGlzIGRvbTBsZXNzIGRvbWFpbnMK
Pj4+IGdldCB0aGUgc2FtZSBhbW91bnQgb2YgU1BJIGFsbG9jYXRlZCBhcyBkb20wLCByZWdhcmRs
ZXNzIG9mIGhvdyBtYW55Cj4+PiBwaHlzaWNhbCBkZXZpY2VzIHRoZXkgaGF2ZSBhc3NpZ25lZCwg
YW5kIHJlZ2FyZGxlc3Mgb2Ygd2hldGhlciB0aGV5IGhhdmUKPj4+IGEgdmlydHVhbCBwbDAxMSAo
d2hpY2ggYWxzbyBuZWVkcyBhbiBlbXVsYXRlZCBTUEkpLgo+Pj4KPj4+IFdoZW4gbnJfc3BpcyBp
cyBwcmVzZW50LCB0aGUgZG9tYWluIGdldHMgZXhhY3RseSBucl9zcGlzIGFsbG9jYXRlZCBTUElz
Lgo+Pj4gSWYgdGhlIG51bWJlciBpcyB0b28gbG93LCBpdCBtaWdodCBub3QgYmUgZW5vdWdoIGZv
ciB0aGUgZGV2aWNlcwo+Pj4gYXNzaWduZWQgaXQgdG8gaXQuIElmIHRoZSBudW1iZXIgaXMgbGVz
cyB0aGFuIEdVRVNUX1ZQTDAxMV9TUEksIHRoZQo+Pj4gdmlydHVhbCBwbDAxMSB3b24ndCB3b3Jr
Lgo+Pgo+PiBUaGlzIGlzIGdvb2QgdG8gYWRkcmVzcyBteSBmaXJzdCByZW1hcmsuIEhvdyBhYm91
dCB0aGUgb3RoZXJzPwo+ICAgCj4gRm9yIHlvdXIgcG9pbnQgYWJvdXQgIlZQTDAxMSBtYXkgbm90
IHdvcmsgYW55bW9yZSIsIGFyZSB5b3Ugc3VnZ2VzdGluZwo+IHdlIHByaW50IGEgd2FybmluZyBv
ciB0aGF0IHdlIGFsd2F5cyBhbGxvY2F0ZSBhdCBsZWFzdAo+IEdVRVNUX1ZQTDAxMV9TUEkrMSBT
UElzIGlmIHZwbDAxMSBpcyByZXF1ZXN0ZWQ/CgpNeSBwcmVmZXJlbmNlIGlzIHRvIGRvIHRoZSBs
YXRlciBhcyB0aGlzIG1hdGNoIHRoZSBiZWhhdmlvciB3aGVuIGd1ZXN0IGFyZSAKY3JlYXRlZCBi
eSBsaWJ4bC4gVGhpcyBpcyBhbHNvIHRoZSBjdXJyZW50IGJlaGF2aW9yLgoKQnV0IGlmIHlvdSB3
YW50IHRvIGNoYW5nZSB0aGlzIGJlaGF2aW9yLCB0aGVuIHlvdSBuZWVkIHRvIGRvY3VtZW50IGl0
IGFzIHRoaXMgaXMgCmEgYnJlYWthZ2UgYmV0d2VlbiB0aGUgcHJldmlvdXMgaW50ZXJmYWNlLgoK
PiAKPiBGb3IgeW91ciBwb2ludCBhYm91dCAiaXQgaXMgbm90IGV4cGxhaW5lZCB3aHkgYWxsIHRo
ZSBkb21haW5zIHdpbGwgaGF2ZQo+IFNQSXMgZXhwb3NlZCIgd291bGQgeW91IGxpa2UgbWUgdG8g
YWRkIGEgc2VudGVuY2UgdG8gdGhlIGNvbW1pdCBtZXNzYWdlCj4gdG8gbWFrZSBpdCBjbGVhcmVy
IG9yIGRvIHlvdSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQ/CgpBIHNlbnRlbmNlIGluIHRo
ZSBjb21taXQgbWVzc2FnZSBpcyBiZSBnb29kIGVub3VnaC4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
