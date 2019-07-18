Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50156CC9C
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 12:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho3M3-0001Er-SO; Thu, 18 Jul 2019 10:09:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b8c6=VP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1ho3M1-0001EZ-It
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 10:09:37 +0000
X-Inumbo-ID: 24bceb78-a944-11e9-b7df-3bf98e28b446
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 24bceb78-a944-11e9-b7df-3bf98e28b446;
 Thu, 18 Jul 2019 10:09:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A941928;
 Thu, 18 Jul 2019 03:09:34 -0700 (PDT)
Received: from [10.37.10.69] (unknown [10.37.10.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4BB9C3F71A;
 Thu, 18 Jul 2019 03:09:32 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>, xen-devel@lists.xenproject.org
References: <8af4cfa481e24256b822f64efc6a0f45ae87cf65.1561750725.git.denisobrezkov@gmail.com>
 <a94734d2-ea51-3ba3-917b-e7cf21ace1d0@arm.com>
 <d304061e-f34e-d0e6-04a4-1a8bfc7414fa@gmail.com>
 <3261754d-f036-fbf1-d111-3ad10aa6f2eb@arm.com>
 <b2543b3f-a235-fc96-30f0-461de0458656@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <375df026-85af-6c27-1dfb-ae1bccc0b2ab@arm.com>
Date: Thu, 18 Jul 2019 11:09:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <b2543b3f-a235-fc96-30f0-461de0458656@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: Switch OMAP5 secondary cores
 into hyp mode
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
Cc: hy-gsoc@hy-research.com, sstabellini@kernel.org,
 Iain Hunter <drhunter95@gmail.com>, andre.przywara@arm.com, tim@xen.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, baozich@gmail.com,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xNy8xOSAxMDo1NSBQTSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gSGksCkhpLAoKPj4g
V2VsbCwgWGVuIGhhcyBiZWVuIHN1cHBvcnRlZCB0aGUgb21hcDUgZm9yIHF1aXRlIGEgd2hpbGUu
IFNvIHRoZXJlIGFyZQo+PiB0d28gcG9zc2liaWxpdGllcyByZWdhcmRpbmcgdGhlIGN1cnJlbnQg
U01QIGNvZGU6Cj4+ICDCoMKgIDEpIEl0IGlzIHRvdGFsbHkgYnJva2VuIGFuZCB0aGVyZWZvcmUg
bmV2ZXIgd29ya2VkIG9uIGFueSBvbWFwNQo+PiBwbGF0Zm9ybS4KPj4gIMKgwqAgMikgSXQgd29y
a3MgYnV0IHdpdGggbWF5YmUgbW9kaWZpY2F0aW9uIGluIFUtYm9vdC4KPj4KPj4gTG9va2luZyBh
dCB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUgYW5kIHdpa2ksIEkgYmVsaWV2ZSAyKSBpcyBjbG9z
ZXIgdG8KPj4gdGhlIGN1cnJlbnQgcmVhbGl0eS4gU28gdGhpcyByYWlzZSB0aGUgcXVlc3Rpb24g
d2hldGhlciB5b3VyIHBhdGNoIHdpbGwKPj4gYnJlYWsgYW55IGV4aXN0aW5nIHNldHVwLgo+Pgo+
PiBEb24ndCBnZXQgbWUgd3JvbmcsIHRoZSBjb2RlIGlzIHBlcmZlY3RseSBmaW5lIGFzLCB0byB0
aGUgYmVzdCBvZiBteQo+PiBrbm93bGVkZ2UsIGl0IG1hdGNoZXMgd2hhdCBMaW51eCBkb2VzLiBI
b3dldmVyLCBJIHdvdWxkIGxpa2UgdG8gc2VlIGFuCj4+IGFuYWx5c2lzIHdyaXR0ZW4gaW4gdGhl
IGNvbW1pdCBtZXNzYWdlIHJlZ2FyZGluZyB3aGF0J3MgZ29pbmcgdG8gaGFwcGVuCj4+IGZvciBh
bnkgZXhpc3Rpbmcgc2V0dXAuCj4+Cj4+IENoZWVycywKPj4KPiAKPiBJIGhvcGVkIHRvIGhlYXIg
bW9yZSBvcGluaW9ucyBiZWNhdXNlIEkgZG9uJ3QgcmVhbGx5IHVuZGVyc3RhbmQgd2hlcmUgdG8K
PiBzdGFydCAtIEkgZG9uJ3Qga25vdyBtdWNoIGFib3V0IGhvdyB4ZW4gYW5kIExpbnV4IHdvcmtl
ZCB3aXRoIG9tYXA1LgoKSSBhbSBhZnJhaWQgSSBuZXZlciBoYWQgdGhlIGNoYW5jZSB0byB1c2Ug
dGhlIG9tYXA1LiBJIHByb3ZpZGVkIGFuIAphbmFseXNpcyBpbiBteSBmaXJzdCBhbnN3ZXIgYmFz
ZWQgb24gbXkgZmluZGluZy4gVGhpcyBpcyB0aGUga2luZCBvZiAKdGhpbmdzIEkgd291bGQgZXhw
ZWN0IGluIHRoZSBjb21taXQgbWVzc2FnZS4KCkhvd2V2ZXIsIEkgd291bGQgbGlrZSBtb3JlIG9w
aW5pb25zIGZyb20gcGVvcGxlIHdobyBoYXZlIGJlZW4gd29ya2luZyAKd2l0aCB0aGUgb21hcDUg
cGxhdGZvcm0uIEkgd291bGQgZ2l2ZSB1bnRpbCBNb25kYXkgZm9yIGFuIGFuc3dlciwgaWYgCm5v
bmUgaXMgcmVjZWl2ZWQgdGhlbiBwbGVhc2UgZ28gYWhlYWQgcmVzZW5kaW5nIGEgdmVyc2lvbiB3
aXRoIG15IGFuYWx5c2lzLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
