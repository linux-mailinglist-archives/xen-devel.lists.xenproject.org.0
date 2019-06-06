Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B2237300
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 13:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYqcF-0007LS-Ol; Thu, 06 Jun 2019 11:31:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYqcE-0007LN-Hy
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 11:31:30 +0000
X-Inumbo-ID: a06d0837-884e-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a06d0837-884e-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 11:31:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 05:31:28 -0600
Message-Id: <5CF8F9880200007800235E6A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 05:31:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-4-roger.pau@citrix.com>
 <d0590126d33a4ca69da45b09d6038cb5@AMSPEX02CL03.citrite.net>
 <b163694e8a174570870d5ff7839a685c@AMSPEX02CL03.citrite.net>
In-Reply-To: <b163694e8a174570870d5ff7839a685c@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 03/12] pci: make PCI_SBDF return a
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 george.dunlap@citrix.com, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDEzOjE5LCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+PiAgLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWGVuLWRldmVsIFttYWls
dG86eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFsZiBPZiBQ
YXVsIER1cnJhbnQKPj4gU2VudDogMDYgSnVuZSAyMDE5IDEyOjExCj4+IAo+PiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4+ID4gRnJvbTogWGVuLWRldmVsIFttYWlsdG86eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmddIE9uIEJlaGFsZiBPZiBSb2dlciBQYXUgTW9u
bmUKPj4gPiBTZW50OiAwNiBKdW5lIDIwMTkgMTA6MDIKPj4gPiAtLS0gYS94ZW4vaW5jbHVkZS94
ZW4vcGNpLmgKPj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgKPj4gPiBAQCAtMzQsNyAr
MzQsOCBAQAo+PiA+ICAjZGVmaW5lIFBDSV9ERVZGTjIoYmRmKSAoKGJkZikgJiAweGZmKQo+PiA+
ICAjZGVmaW5lIFBDSV9CREYoYixkLGYpICAoKCgoYikgJiAweGZmKSA8PCA4KSB8IFBDSV9ERVZG
TihkLGYpKQo+PiA+ICAjZGVmaW5lIFBDSV9CREYyKGIsZGYpICAoKCgoYikgJiAweGZmKSA8PCA4
KSB8ICgoZGYpICYgMHhmZikpCj4+ID4gLSNkZWZpbmUgUENJX1NCREYocyxiLGQsZikgKCgoKHMp
ICYgMHhmZmZmKSA8PCAxNikgfCBQQ0lfQkRGKGIsZCxmKSkKPj4gPiArI2RlZmluZSBQQ0lfU0JE
RihzLGIsZCxmKSBcCj4+ID4gKyAgICAoKHBjaV9zYmRmX3QpIHsgLnNiZGYgPSAoKChzKSAmIDB4
ZmZmZikgPDwgMTYpIHwgUENJX0JERihiLGQsZikgfSkKPiAKPiBXb3VsZG4ndCB0aGlzIGJlIGJl
dHRlciBjb2RlZCBhbG9uZyB0aGUgbGluZXMgb2YuLi4gCj4gCj4gICAgICgocGNpX3NiZGZfdCkg
eyAuc2VnID0gcywgLmJ1cyA9IGIsIC5kZXYgPSBkLCAuZm4gPSBmIH0pCgpObywgYXMgcGVyIHRo
ZSBwcmlvciB2ZXJzaW9uJ3MgZGlzY3Vzc2lvbjogT2xkZXIgZ2NjIHdvbid0IGNvcGUgd2l0aCB0
aGlzLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
