Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F22CD4BBD6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 16:40:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdbiT-0005q2-8n; Wed, 19 Jun 2019 14:37:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdbiR-0005pw-2P
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 14:37:35 +0000
X-Inumbo-ID: c659a968-929f-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c659a968-929f-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 14:37:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 08:37:33 -0600
Message-Id: <5D0A48AB0200007800239B4D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 08:37:31 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-4-roger.pau@citrix.com>
 <cd4af737-de45-15a0-d0c6-90e7d9cc0185@citrix.com>
 <20190619143027.qrcg6b6fcpsgwvjd@MacBook-Air-de-Roger.local>
In-Reply-To: <20190619143027.qrcg6b6fcpsgwvjd@MacBook-Air-de-Roger.local>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/4] x86/linker: add a reloc section to ELF
 binary
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDE2OjMwLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDE5LCAyMDE5IGF0IDEyOjIwOjQwUE0gKzAxMDAsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+IFNpbmNlIHRoZSBNQjEvTUIyIGJ1aWxkcyBhcmVuJ3QgcmVsb2NhdGFibGUsIEkg
dGhpbmsgd2UgbWlnaHQgYmUgYWJsZSB0bwo+PiBnZXQgYXdheSB3aXRoIHNpbXBseSBleGNsdWRp
bmcgdGhlbSBpbiB0aGUgbm9uLUVGSSBidWlsZC4KPiAKPiBIbSwgT0suIEknbSBzbGlnaHRseSBs
b3NzIHRoZW4uIEkndmUgdGFrZW4gYSBsb29rIGF0IHRoZSBoaXN0b3J5IG9mCj4geGVuL2FyY2gv
eDg2L2VmaS9yZWxvY3MtZHVtbXkuUyBhbmQgaXQncyBub3QgY2xlYXIgdG8gbWUgd2h5IHN1Y2gg
YQo+IGR1bW15IGZpbGUgd2FzIGFkZGVkLiBNeSBndWVzcyBpcyB0aGF0IGl0J3MgZG9uZSBpbiBv
cmRlciB0byBwcmV2ZW50Cj4gbWlzc2luZyBzeW1ib2xzIGVycm9ycy4gSWYgdGhhdCdzIHRoZSBj
YXNlIEkgZ3Vlc3MgdGhlIGNvZGUgdGhhdCBtYWtlcwo+IHVzZSBvZiBzdWNoIHN5bWJvbHMgY2Fu
IGJlIGd1YXJkZWQsIGFuZCB0aGUgZHVtbXkgZmlsZSByZW1vdmVkPwoKTWlzc2luZyBzeW1ib2xz
IGVycm9ycyAtIHllcy4gQnV0IGhvdyB3b3VsZCB5b3UgcmVtb3ZlIHRoZSBkdW1teQpvbmUsIHdo
aWNoIGlzIGEgcGxhY2UgaG9sZGVyIGluIHN0YWdlIDEgbGlua2luZyBmb3Igd2hhdCB3aWxsIGJl
IHJlYWwKZGF0YSBpbiBzdGFnZXMgMiBhbmQgMz8gSSBkb24ndCB0aGluayB3ZSBzaG91bGQgaWdu
b3JlIHVucmVzb2x2ZWQKc3ltYm9scyBpbiBzdGFnZSAxLgoKSmFuCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
