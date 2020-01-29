Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BB914CD74
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jan 2020 16:35:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwpL0-0004QU-OS; Wed, 29 Jan 2020 15:33:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LL5N=3S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iwpKy-0004QP-Ep
 for xen-devel@lists.xenproject.org; Wed, 29 Jan 2020 15:33:04 +0000
X-Inumbo-ID: a3a592b2-42ac-11ea-a933-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a3a592b2-42ac-11ea-a933-bc764e2007e4;
 Wed, 29 Jan 2020 15:33:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 454F9AD22;
 Wed, 29 Jan 2020 15:33:03 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-6-anthony.perard@citrix.com>
 <7c16cfcc-0ec5-18f9-e05c-84415fed72c9@suse.com>
Message-ID: <91397e9b-794d-e59b-cde0-ebfc92ed15f9@suse.com>
Date: Wed, 29 Jan 2020 16:33:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7c16cfcc-0ec5-18f9-e05c-84415fed72c9@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 05/12] xen/include: remove include of
 Config.mk
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

T24gMjkuMDEuMjAyMCAxNjoyOCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDEuMjAyMCAx
MTo1MywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4+IEl0IGlzbid0IG5lY2Vzc2FyeSB0byBpbmNs
dWRlIENvbmZpZy5tayBoZXJlIGJlY2F1c2UgdGhpcyBNYWtlZmlsZSBpcwo+PiBvbmx5IHVzZWQg
YnkgeGVuL1J1bGVzLm1rIHdoaWNoIGFscmVhZHkgaW5jbHVkZXMgQ29uZmlnLm1rLgo+IAo+IEFu
ZCBzbyBpcyB4ZW4vdGVzdC9saXZlcGF0Y2gvTWFrZWZpbGUgYWZhaWNzIGZyb20gaXRzIHBhcmVu
dCBkaXIKPiBNYWtlZmlsZS4gV2l0aCB0aGlzIGFsc28gYWRqdXN0ZWQgKG9yIGl0IGV4cGxhaW5l
ZCB3aHkgSSdtIHNlZWluZwo+IHRoaW5ncyBpbmNvcnJlY3RseSkgLi4uCj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpBbmQgbm93IEkndmUg
c2VlbiB0aGF0IHBhdGNoIDYgZG9lcyBqdXN0IHRoaXMuIEkgdGhpbmsgc3VjaApjb21tb24gdGhl
bWUgY2hhbmdlcyBhcmUsIHVubGVzcyBwYXRjaGVzIGFyZSBvdmVybHkgbGFyZ2UKYWxyZWFkeSwg
YmV0dGVyIHB1dCBhbGwgaW4gb24gcGF0Y2guIEFueXdheSAtIHRoZSBSLWIgdGhlbgppcyB1bmNv
bmRpdGlvbmFsLgoKQW5vdGhlciBxdWVzdGlvbjogVGhlIGNvdmVyIGxldHRlciBkb2Vzbid0IHNh
eSBhbnl0aGluZyBhYm91dApzb21lIChvciBtb3N0KSBwYXRjaGVzIGhlcmUgYmVpbmcgaW5kZXBl
bmRlbnQgb2Ygb25lIGFub3RoZXIsCmFuZCBoZW5jZSB0aGUgb3B0aW9uIG9mIHRoZW0gZ29pbmcg
aW4gb3V0IG9mIG9yZGVyLiBUaGUgb25lCmhlcmUgbG9va3MgdG8gYmUgZW50aXJlbHkgc3RhbmRh
bG9uZSwgZm9yIGV4YW1wbGUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
