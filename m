Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C7935AE7
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:10:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTlP-0001CZ-Ro; Wed, 05 Jun 2019 11:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYTlO-0001CP-De
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:07:26 +0000
X-Inumbo-ID: 185186fc-8782-11e9-b2fc-5f2d1e732dd3
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 185186fc-8782-11e9-b2fc-5f2d1e732dd3;
 Wed, 05 Jun 2019 11:07:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 05:07:22 -0600
Message-Id: <5CF7A268020000780023579B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 05:07:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190603160350.29806-1-julien.grall@arm.com>
 <20190603160350.29806-15-julien.grall@arm.com>
In-Reply-To: <20190603160350.29806-15-julien.grall@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 14/14] xen/mm: Provide dummy M2P-related
 helpers when !CONFIG_HAVE_M2P
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, george.dunlap@citrix.com,
 Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE4OjAzLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IEF0IHRoZSBtb21lbnQsIEFybSBpcyBwcm92aWRpbmcgYSBkdW1teSBpbXBsZW1lbnRhdGlvbiBm
b3IgdGhlIE0yUAo+IGhlbHBlcnMgdXNlZCBpbiBjb21tb24gY29kZS4gSG93ZXZlciwgdGhleSBh
cmUgcXVpdGUgaXNvbGF0ZWQgYW5kIGNvdWxkCj4gYmUgdXNlZCBieSBvdGhlciBhcmNoaXRlY3R1
cmUgaW4gdGhlIGZ1dHVyZS4gU28gbW92ZSBhbGwgdGhlIGhlbHBlcnMgaW4KPiB4ZW4vbW0uaC4K
CkFuZCB3aGVyZSdzIHRoZSBwcm9ibGVtIHRoZW4gYWRkaW5nIC4uLgoKPiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vbW0uaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gQEAgLTY1NSw0ICs2
NTUsMTggQEAgc3RhdGljIGlubGluZSB2b2lkIHNoYXJlX3hlbl9wYWdlX3dpdGhfcHJpdmlsZWdl
ZF9ndWVzdHMoCj4gICAgICBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KHBhZ2UsIGRvbV94ZW4s
IGZsYWdzKTsKPiAgfQo+ICAKPiArLyoKPiArICogRHVtbXkgaW1wbGVtZW50YXRpb24gb2YgTTJQ
LXJlbGF0ZWQgaGVscGVycyBmb3IgY29tbW9uIGNvZGUgd2hlbgo+ICsgKiB0aGUgYXJjaGl0ZWN0
dXJlIGRvZXNuJ3QgaGF2ZSBhbiBNMlAuCj4gKyAqLwo+ICsjaWZuZGVmIENPTkZJR19IQVNfTTJQ
Cj4gKwo+ICsjZGVmaW5lIElOVkFMSURfTTJQX0VOVFJZICAgICAgICAofjBVTCkKPiArI2RlZmlu
ZSBTSEFSRURfTTJQX0VOVFJZICAgICAgICAgKH4wVUwgLSAxVUwpCj4gKyNkZWZpbmUgU0hBUkVE
X00yUChfZSkgICAgICAgICAgICgoX2UpID09IFNIQVJFRF9NMlBfRU5UUlkpCj4gKwo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgc2V0X3Bmbl9mcm9tX21mbihtZm5fdCBtZm4sIHVuc2lnbmVkIGxvbmcg
cGZuKSB7fQo+ICsKPiArI2VuZGlmCgouLi4gbWZuX3RvX2dtZm4oKSB0byB0aGlzIHNldD8gUGVy
aGFwcyBhIGRlY2xhcmF0aW9uIHdpdGhvdXQgYW55CmRlZmluaXRpb24gYW55d2hlcmU/CgpBbHNv
IHBsZWFzZSB0YWtlIHRoZSBvcHBvcnR1bml0eSBhbmQgZHJvcCB0aGUgdW5uZWNlc3NhcnkgdW5k
ZXJzY29yZQpmcm9tIF9lLiBBbmQgYWN0dWFsbHksIHNob3VsZG4ndCB0aGlzIHVuaWZvcm1seSBy
ZXR1cm4gZmFsc2U/IEF0IHdoaWNoCnBvaW50IHlvdSBkb24ndCBldmVuIG5lZWQgU0hBUkVEX00y
UF9FTlRSWS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
