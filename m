Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16865103629
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 09:45:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXLYf-0004dC-FI; Wed, 20 Nov 2019 08:41:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iXLYe-0004d7-4X
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 08:41:52 +0000
X-Inumbo-ID: 98ac201e-0b71-11ea-a30b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98ac201e-0b71-11ea-a30b-12813bfff9fa;
 Wed, 20 Nov 2019 08:41:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81CF6AF86;
 Wed, 20 Nov 2019 08:41:50 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <9a02de11-09bd-a54f-48f6-1ce1a0246325@suse.com>
 <8c928769-c0ea-8a48-3bda-aba7d17133ba@bitdefender.com>
 <9141e27c-edd4-301a-ee76-e3fcf5e787af@suse.com>
 <559c1807-2f5d-2267-c563-448c0bd88725@bitdefender.com>
 <b653b14f-bf46-85ef-c412-876d5ad26ade@suse.com>
 <cb030ad4-df5c-6f28-f5c8-1add63d3b80d@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e2ac74e-2ce6-9a2d-9333-a58815fe10d3@suse.com>
Date: Wed, 20 Nov 2019 09:41:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cb030ad4-df5c-6f28-f5c8-1add63d3b80d@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 1/2] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMTEuMjAxOSAwOToyOSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTkuMTEuMjAxOSAxMToyMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE5LjExLjIwMTkgMTA6
MDUsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gT24gMTguMTEuMjAxOSAxNjow
OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTguMTEuMjAxOSAxNDozOSwgQWxleGFuZHJ1
IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4+Pj4+IEZvciB0aGlzIEhWTU9QX0FMVFAyTV9JTlRFUkZB
Q0VfVkVSU0lPTiBzaG91dCBiZSBpbmNyZWFzZWQuIEkgd2lsbCBsZWF2ZQo+Pj4+PiBpdCB0byBU
YW1hcyB0byBkZWNpZGUgaWYgd2Ugd2lsbCBuZWVkIGEgZGlmZmVyZW50IHN0cnVjdHVyZSBmb3IK
Pj4+Pj4geGVuX2h2bV9hbHRwMm1fc3VwcHJlc3NfdmVfbXVsdGkgdG8ga2VlcCB0aGUgY29tcGF0
aWJpbGl0eS4KPj4+Pgo+Pj4+IFdhc24ndCBpcyB0aGF0IGR1ZSB0byB0aGUgcG9zc2libGUgZ3Vl
c3QgZXhwb3N1cmUgaXQgd2FzIGRlY2lkZWQKPj4+PiB0aGF0IHRoZSBpbnRlcmZhY2UgdmVyc2lv
biBhcHByb2FjaCB3YXMgbm90IHN1aXRhYmxlIGhlcmUsIGFuZCBoZW5jZQo+Pj4+IGl0IHNob3Vs
ZG4ndCBiZSBidW1wZWQgYW55IGZ1cnRoZXI/Cj4+Pj4KPj4+Cj4+PiBUaGF0IGlzIGNvcnJlY3Qg
YnV0IHRoZXJlIHdhcyBhbHNvIHJlcXVlc3RlZCB0byBhZGQgdGhlIG5ldyBvcGFxdWUgZmllbGQK
Pj4+IHNvIEkgZG9uJ3Qga25vdyBob3cgdG8gaGF2ZSB0aGF0IGFuIHN0aWxsIGtlZXAgdGhlIHNh
bWUgdmVyc2lvbi4KPj4KPj4gTmV3IHN1Yi1vcD8KPiAKPiBXb3VsZG4ndCBpdCBiZSBzaW1wbGVy
IHRvIGhhdmUgYSBuZXcgc3RydWN0dXJlIHRvIHVzZSBmb3IgdGhpcywgCj4gc29tZXRoaW5nIGxp
a2UgInN0cnVjdCB4ZW5faHZtX2FsdHAybV9zdXBwcmVzc192ZV9tdWx0aSIgYW5kIHRoZW4gdGhl
IAo+IHZlcnNpb24gd2lsbCBiZSB1bmNoYW5nZWQKCldlbGwsIGlmIHRoZSBvcmlnaW5hbCBzdWIt
b3AgaXMgdG8gcmVtYWluIGVudGlyZWx5IHVudG91Y2hlZCwKdGhlbiB5ZXMsIHN1cmUuIEkgaGF2
ZSB0byBhZG1pdCB0aGF0IGluIHRoZSBjb3Vyc2Ugb2YgdGhlCmRpc2N1c3Npb24gaXQgYmVjYW1l
IGRlY3JlYXNpbmdseSBjbGVhciB3aGV0aGVyIHRoZSBvcmlnaW5hbApzdWItb3AgYWxzbyB3YW50
ZWQgc29tZSBmb3Igb2YgYWRqdXN0bWVudC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
