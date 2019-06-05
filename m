Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7483598A
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 11:17:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYS07-0005XV-I2; Wed, 05 Jun 2019 09:14:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYS06-0005XP-IM
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 09:14:30 +0000
X-Inumbo-ID: 527c1e5f-8772-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 527c1e5f-8772-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 09:14:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 03:14:28 -0600
Message-Id: <5CF787F2020000780023562E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 03:14:26 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <5CF519E902000078002349FF@prv1-mh.provo.novell.com>
 <20190604084807.3hevw5rh6qu5w3ul@Air-de-Roger>
 <5CF66BCE0200007800235184@prv1-mh.provo.novell.com>
 <20190604162052.oypj4kpllvueusd3@Air-de-Roger>
 <5CF7757E02000078002355E1@prv1-mh.provo.novell.com>
 <20190605090653.kvz554xhrle5e6b7@Air-de-Roger>
In-Reply-To: <20190605090653.kvz554xhrle5e6b7@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] AMD/IOMMU: revert "amd/iommu: assign iommu
 devices to Xen"
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Brian Woods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDExOjA2LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDA1LCAyMDE5IGF0IDAxOjU1OjQyQU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDQuMDYuMTkgYXQgMTg6MjAsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gT24gYSB0YW5nZW50aWFsIG5vdGUsIHRoZXJlJ3MgYWxzbyBhIGRlcmVmZXJl
bmNlIG9mIGRvbV94ZW4gaW4KPj4gPiBfcGNpX2hpZGVfZGV2aWNlIHdoaWNoIGRvZXNuJ3QgdHJp
Z2dlciBhIHBhZ2UgZmF1bHQuIERvIHdlIGhhdmUKPj4gPiBzb21ldGhpbmcgbWFwcGVkIGF0IGxp
bmVhciBhZGRyZXNzIDAgb24gcHVycG9zZT8KPj4gCj4+IFllcywgZHVyaW5nIGVhcmx5IChsZWdh
Y3kpIGJvb3QuCj4gCj4gRldJVywgSSdtIGJvb3RpbmcgZnJvbSBVRUZJIHVzaW5nIG11bHRpYm9v
dDIgYW5kIEkgZGlkbid0IGdldCBhIHBhZ2UKPiBmYXVsdCBpbiBfcGNpX2hpZGVfZGV2aWNlLgoK
T2gsIHJpZ2h0LCB0aGF0J3MgYWxzbyB1c2luZyB0aGUgcHJlLWNvbnN0cnVjdGVkIHBhZ2UgdGFi
bGVzIGlpcmMuCldoZW4gSSBzYXkgIkVGSSBib290IiBtb3N0IG9mIHRoZSB0aW1lIGl0IHdvdWxk
IG1lYW4gIm5hdGl2ZSIKRUZJIG1vZGUsIG5vdCB0aGF0IHdpdGggYW5vdGhlciBib290IGxvYWRl
ciBpbiB0aGUgbWlkZGxlLiBCdXQKeWVzLCBJIGNhbiBzZWUgaG93IG15IGVhcmxpZXIgcmVwbHkg
d2FzIGltcHJlY2lzZSAvIGFtYmlndW91cy4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
