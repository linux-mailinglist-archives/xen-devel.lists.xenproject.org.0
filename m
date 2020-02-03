Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0B31509BE
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:23:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydXm-0002DQ-06; Mon, 03 Feb 2020 15:21:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iydXl-0002DH-6C
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:21:45 +0000
X-Inumbo-ID: e2b1cbc0-4698-11ea-8e6f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2b1cbc0-4698-11ea-8e6f-12813bfff9fa;
 Mon, 03 Feb 2020 15:21:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C03C9B25C;
 Mon,  3 Feb 2020 15:21:43 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200121135916.1140483-1-anthony.perard@citrix.com>
 <69ed5eba-e6ea-5b1e-20cc-d8f5a00d2cf3@suse.com>
 <20200203142900.GF2306@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5ca6385d-b913-5d16-cd79-cb259039ab83@suse.com>
Date: Mon, 3 Feb 2020 16:21:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203142900.GF2306@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2.1 13/12] Makefile: Fix install-tests
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNToyOSwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMTI6Mzc6MTdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIx
LjAxLjIwMjAgMTQ6NTksIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gVGhlIHRvcC1sZXZlbCBt
YWtlZmlsZSBtYWtlIHVzZXMgb2YgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZGV0YWlsIG9mCj4+
PiB0aGUgeGVuIGJ1aWxkIHN5c3RlbS4gQXZvaWQgdGhhdCBieSBjcmVhdGluZyBhIG5ldyB0YXJn
ZXQKPj4+ICJpbnN0YWxsLXRlc3RzIiBpbiB4ZW4vTWFrZWZpbGUsIGFuZCBieSBmaXhpbmcgdGhl
IHRvcC1sZXZlbCBNYWtlZmlsZQo+Pj4gdG8gbm90IGNhbGwgeGVuL1J1bGVzLm1rIGFueW1vcmUu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNp
dHJpeC5jb20+Cj4+Cj4+IFRoaXMgaW4gcHJpbmNpcGxlIGNvdWxkIGhhdmUgbXkgUi1iLCBidXQg
Li4uCj4+Cj4+PiAtLS0gYS94ZW4vTWFrZWZpbGUKPj4+ICsrKyBiL3hlbi9NYWtlZmlsZQo+Pj4g
QEAgLTkwLDYgKzkwLDkgQEAgX2luc3RhbGw6ICQoVEFSR0VUKSQoQ09ORklHX1hFTl9JTlNUQUxM
X1NVRkZJWCkKPj4+ICAuUEhPTlk6IF90ZXN0cwo+Pj4gIF90ZXN0czoKPj4+ICAJJChNQUtFKSAt
ZiAkKEJBU0VESVIpL1J1bGVzLm1rIC1DIHRlc3QgdGVzdHMKPj4+ICsuUEhPTlk6IGluc3RhbGwt
dGVzdHMKPj4+ICtpbnN0YWxsLXRlc3RzOgo+Pj4gKwkkKE1BS0UpIC1mICQoQkFTRURJUikvUnVs
ZXMubWsgLUMgdGVzdCBpbnN0YWxsCj4+Cj4+IC4uLiBJJ20gaXJyaXRhdGVkIGJ5IHRoZSBwYXRj
aCBjb250ZXh0IGhlcmU6IFBhdGNoIDggY2hhbmdlZAo+PiBfdGVzdHMgdG8gdGVzdHMsIGFuZCBi
eSB0aGUgbnVtYmVyaW5nIHRoaXMgcGF0Y2ggZ29lcyBvbiB0b3AKPj4gb2YgcGF0Y2ggOC4gQ291
bGQgeW91IGNsYXJpZnkgd2hhdCdzIGdvaW5nIG9uIGhlcmUsIHBsZWFzZT8KPiAKPiBJIHdhbnRl
ZCB0byBoYXZlIHRoaXMgcGF0Y2ggZWFybGllciBpbiB0aGUgc2VyaWVzLiBJIGNvdWxkIHByb2Jh
Ymx5IGhhdmUKPiBwdXQgaW4gdGhlIHN1YmplY3Qgc29tZXRoaW5nIGxpa2UgIltQQVRDSCAxLjUv
MTJdIiB0byBtYWtlIHRoaXMgY2xlYXJlci4KCkkgc2VlLiBJbiB3aGljaCBjYXNlLCBhcyBpbmRp
Y2F0ZWQsClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
