Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4A7A370
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 10:57:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsNu8-0003Zn-Jp; Tue, 30 Jul 2019 08:54:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WuyF=V3=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsNu7-0003Zi-HI
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 08:54:43 +0000
X-Inumbo-ID: ab97c516-b2a7-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ab97c516-b2a7-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 08:54:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A74BC344;
 Tue, 30 Jul 2019 01:54:41 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 956D73F71F;
 Tue, 30 Jul 2019 01:54:39 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190730065637.3802-1-lukasz.hawrylko@intel.com>
 <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d216b609-353d-e4c7-fdea-e2e63b175bb8@arm.com>
Date: Tue, 30 Jul 2019 09:54:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5e5c945a-6bdb-2776-e2db-b11bbeb74bf5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Intel TXT: add reviewer,
 move to Odd Fixes state
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Lukasz Hawrylko <lukasz.hawrylko@intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gNy8zMC8xOSA5OjI5IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAzMC4w
Ny4yMDE5IDA4OjU2LCBMdWthc3ogSGF3cnlsa28gd3JvdGU6Cj4+IFN1cHBvcnQgZm9yIEludGVs
IFRYVCBoYXMgb3JwaGFuZWQgc3RhdHVzIHJpZ2h0IG5vdyBiZWNhdXNlCj4+IG5vIGFjdGl2ZSBt
YWludGFpbnRlciBpcyBsaXN0ZWQuIEFkZGluZyBteXNlbGYgYXMgcmV2aWV3ZXIKPj4gYW5kIG1v
dmluZyBpdCB0byBPZGQgRml4ZXMgc3RhdGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEx1a2FzeiBI
YXdyeWxrbyA8bHVrYXN6Lmhhd3J5bGtvQGludGVsLmNvbT4KPj4gLS0tCj4+ICAgIE1BSU5UQUlO
RVJTIHwgMyArKy0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwo+PiBp
bmRleCA4OWEwMWI3MTBiLi5jYTMwMGU4N2M4IDEwMDY0NAo+PiAtLS0gYS9NQUlOVEFJTkVSUwo+
PiArKysgYi9NQUlOVEFJTkVSUwo+PiBAQCAtMjQwLDcgKzI0MCw4IEBAIFM6CU1haW50YWluZWQK
Pj4gICBGOgl0b29scy9nb2xhbmcKPj4gICAKPj4gICBJTlRFTChSKSBUUlVTVEVEIEVYRUNVVElP
TiBURUNITk9MT0dZIChUWFQpCj4+IC1TOglPcnBoYW5lZAo+PiArUjoJTHVrYXN6IEhhd3J5bGtv
IDxsdWthc3ouaGF3cnlsa29AaW50ZWwuY29tPgo+PiArUzoJT2RkIEZpeGVzCj4gCj4gSSBndWVz
cyB3ZSBzaG91bGQgZ2l2ZSBpdCBhIGZldyBkYXlzIGZvciBvYmplY3Rpb25zIHRvIGJlIHJhaXNl
ZAo+IGFnYWluc3QgdGhpcyBzbGlnaHRseSBpbmNvbnNpc3RlbnQgc3RhdGUsIGJ1dCBJIHRoaW5r
IHRoYXQncyB0aGUKPiBiZXN0IHdheSB0byBleHByZXNzIHRoZSBjdXJyZW50IHN0YXRlIG9mIHRo
aW5ncyAoaGVuY2UgbXkKPiBzdWdnZXN0aW9uIHRvIHRoaXMgZWZmZWN0KS4gSWYgbm8gb2JqZWN0
aW9ucyB0dXJuIHVwLCBJJ3ZlIHF1ZXVlZAo+IHRoaXMgb250byBteSB0by1iZS1jb21taXR0ZWQg
bGlzdC4KCkkgaGF2ZSBzb21lIG9iamVjdGlvbnMgcmVnYXJkaW5nIHRoZSBwcm9jZXNzIGl0c2Vs
Zi4uLiBPbiB0aGUgZmlyc3QgCnZlcnNpb24gb2YgdGhpcyBwYXRjaCwgaXQgd2FzIHBvaW50ZWQg
b3V0IHRoYXQgdGhlIGUtbWFpbCBzaG91bGRuJ3QgYmUgCnNlbnQgd2l0aCBkaXNjbGFpbWVyLiBU
aGlzIGlzIG5vdyB0aGUgdGhpcmQgdmVyc2lvbiBhbmQgdGhlIGRpc2NsYWltZXIgCmlzIHN0aWxs
IHByZXNlbnQuCgpUZWNobmljYWxseSwgbm8gcGF0Y2ggc2hvdWxkIGJlIGFwcGxpZWQgd2hlbiB0
aGVyZSBhcmUgYSBkaXNjbGFpbWVyLiAKV2hpbGUgSSB3b3VsZCBoYXZlIGJlZW4gaGFwcHkgdG8g
ZGlzcmVnYXJkIGl0IGlmIGl0IHdlcmUgdGhlIGZpcnN0IAp2ZXJzaW9uLCBJIHRoaW5rIEx1a2Fz
eiBzaG91bGQgcmVzZW5kIHRoaXMgcGF0Y2ggd2l0aCB0aGUgZGlzY2xhaW1lciAKb2ZmLiBUaGlz
IHdpbGwgZ2l2ZSBoaW0gYW4gb3Bwb3J0dW5pdHkgdG8gY29ycmVjdGx5IGNvbmZpZ3VyZSBoaXMg
ZS1tYWlsIApjbGllbnQgZm9yIGZ1dHVyZSBjb21tdW5pY2F0aW9uIG9uIHRoZSBsaXN0LgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
