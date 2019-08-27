Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4CD9E9EC
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 15:49:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2bnG-0005c8-Mi; Tue, 27 Aug 2019 13:45:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2bnF-0005c3-CG
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 13:45:53 +0000
X-Inumbo-ID: fbf0e18f-c8d0-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fbf0e18f-c8d0-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 13:45:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 39A13AC45;
 Tue, 27 Aug 2019 13:45:51 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190719122545.3486-1-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <99462fe0-0f3e-514e-23e2-e7eb868909a1@suse.com>
Date: Tue, 27 Aug 2019 15:45:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190719122545.3486-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] include/public/memory.h: remove the
 XENMEM_rsrc_acq_caller_owned flag
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
 George Dunlap <George.Dunlap@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxNDoyNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFdoZW4gY29tbWl0IDNm
OGYxMjI4ICJ4ODYvbW06IGFkZCBIWVBFUlZJU09SX21lbW9yeV9vcCB0byBhY3F1aXJlIGd1ZXN0
Cj4gcmVzb3VyY2VzIiBpbnRyb2R1Y2VkIHRoZSBjb25jZXB0IG9mIGRpcmVjdGx5IG1hcHBpbmcg
c29tZSBndWVzdCByZXNvdXJjZXMsCj4gaXQgd2FzIGVudmlzYWdlZCB0aGF0IHRoZSBtZW1vcnkg
Zm9yIHNvbWUgcmVzb3VyY2VzIGFzc29jaWF0ZWQgd2l0aCBhIGd1ZXN0Cj4gbWF5IG5vdCBhY3R1
YWxseSBiZSBhc3NpZ25lZCB0byB0aGF0IGd1ZXN0LCBzcGVjaWZpY2FsbHkgdGhlIElPUkVRIHNl
cnZlcgo+IHJlc291cmNlIGludHJvZHVjZXMgaW4gY29tbWl0IDZlMzg3NDYxICJ4ODYvaHZtL2lv
cmVxOiBhZGQgYSBuZXcgbWFwcGFibGUKPiByZXNvdXJjZSB0eXBlLi4uIi4gU3VjaCByZXNvdXJj
ZXMgd2VyZSBkdWJiZWQgImNhbGxlciBvd25lZCIgYW5kIHJlc3VsdGVkCj4gaW4gdGhlIG93bmVk
IHJlc291cmNlcyIgYW5kIGFjcXVpcmluZyB0aGVtIHJlc3VsdGVkIGluIHRoZQo+IFhFTk1FTV9y
c3JjX2FjcV9jYWxsZXJfb3duZWQgZmxhZyBiZWluZyBwYXNzZWQgYmFjayB0byB0aGUgY2FsbGVy
IG9mIHRoZQo+IG1lbW9yeSBvcC4KPiAKPiBVbmZvcnR1bmF0ZWx5IHRoZSBpbXBsZW1lbnRhdGlv
biBsZWQgdG8gWFNBLTI3Niwgd2hpY2ggd2FzIG1pdGlnYXRlZAo+IGJ5IGNvbW1pdCBmNmI2YWU3
OCAieDg2L2h2bS9pb3JlcTogZml4IHBhZ2UgcmVmZXJlbmNpbmciIGFuZCB0aGVuIGEgcmVsYXRl
ZAo+IG1lbW9yeSBhY2NvdW50aW5nIHByb2JsZW0gd2FzIHdvcmtlZCBhcm91bmQgYnkgY29tbWl0
IGU4NjJlNmNlCj4gIng4Ni9odm0vaW9yZXE6IHVzZSByZWYtY291bnRlZCB0YXJnZXQtYXNzaWdu
ZWQgc2hhcmVkIHBhZ2VzIi4gVGhpcyBsYXR0ZXIKPiBjb21taXQgcmVtb3ZlZCB0aGUgb25seSBp
bnN0YW5jZSBvZiBhICJjYWxsZXIgb3duZWQiIHJlc291cmNlLCBidXQgdGhlCj4gZmxhZyB3YXMg
bGVmdCBpbiBoZWFkZXIgYW5kIGNoZWNrZWQgaW4gb25lIHBsYWNlIGluIHRoZSBjb3JlIGNvZGUu
Cj4gVGhpcyBwYXRjaCByZW1vdmVzIHRoYXQgbm93IHJlZHVuZGFudCBjaGVjayBhbmQgcmVtb3Zl
cyB0aGUgZGVmaW5pdGlvbiBvZgo+IFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgZnJvbSB0
aGUgcHVibGljIGhlYWRlci4gQWxzbywgc2luY2UgdGhpcyB3YXMKPiB0aGUgb25seSBmbGFnIGRl
ZmluZWQgZm9yIHRoZSBYRU5NRU1fYWNxdWlyZV9yZXNvdXJjZSBtZW1vcnkgb3AsIGl0IHJlbW92
ZXMKPiB0aGUgJ2ZsYWdzJyBmaWVsZCBvZiBzdHJ1Y3QgeGVuX21lbV9hY3F1aXJlX3Jlc291cmNl
IGFuZCByZXBsYWNlcyBpdCB3aXRoCj4gYW4gZXF1aXZhbGVudGx5IHNpemVkICdwYWQnIGZpZWxk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5j
b20+CgpJIG5vdGljZSB0aGlzIGhhcyBub3cgYmVlbiBjb21taXR0ZWQsIGJ1dCBJIGRpZG4ndCBz
ZWUgYW55IGZ1cnRoZXIKZGlzY3Vzc2lvbiwgaS5lLiBpbiBwYXJ0aWN1bGFyIGl0IGlzIHVuY2xl
YXIgdG8gbWUgYXQgdGhpcyBwb2ludCBpZgpCaXRkZWZlbmRlciBoYXZlIGZvdW5kIGEgZGlmZmVy
ZW50IHNvbHV0aW9uIGZvciB0aGVpciBjaGFuZ2UgdXNpbmcKdGhpcyBmbGFnLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
