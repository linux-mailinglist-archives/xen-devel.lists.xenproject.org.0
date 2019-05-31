Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 526D730C0F
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 11:52:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWeAe-0004m6-9F; Fri, 31 May 2019 09:49:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hWeAc-0004ly-Kc
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 09:49:54 +0000
X-Inumbo-ID: 706afe1f-8389-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 706afe1f-8389-11e9-8980-bc764e045a96;
 Fri, 31 May 2019 09:49:53 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 31 May 2019 03:49:52 -0600
Message-Id: <5CF0F8BE0200007800233DE3@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 31 May 2019 03:49:50 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <5CF0F33A0200007800233D8F@prv1-mh.provo.novell.com>
 <5CF0F5700200007800233DB4@prv1-mh.provo.novell.com>
 <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
In-Reply-To: <f78f627c-753f-a162-14a1-b193908f673a@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 2/2] dom_cow is needed for mem-sharing only
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDMxLjA1LjE5IGF0IDExOjQyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDUvMzEvMTkgMTA6MzUgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vbW0uaAo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+PiBAQCAtNjQ0LDYg
KzY0NCw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBmaWx0ZXJlZF9mbHVzaF90bGJfbWEKPj4gICAK
Pj4gICAvKiBQcml2YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBl
dGMuICovCj4+ICAgZXh0ZXJuIHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW8sICpkb21f
Y293Owo+IAo+IERvbid0IHlvdSB3YW50IHRvIHByb3RlY3QgZG9tX2NvdyB3aXRoICIjaWZkZWYg
Q09ORklHX0hBU19NRU1fU0hBUklORyI/CgpUaGVyZSdzIG5vIG5lZWQgdG8gd2l0aCAuLi4KCj4+
ICsjaWZuZGVmIENPTkZJR19IQVNfTUVNX1NIQVJJTkcKPj4gKyMgZGVmaW5lIGRvbV9jb3cgTlVM
TAo+PiArI2VuZGlmCgouLi4gdGhpcywgYW5kIHRoaXMgd2F5IHRoZXJlJ3MgbGVzcyBjbHV0dGVy
IG92ZXJhbGwuCgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
