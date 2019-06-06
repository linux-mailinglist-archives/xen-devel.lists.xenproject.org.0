Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 084E037769
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 17:06:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYtvS-0001fv-KY; Thu, 06 Jun 2019 15:03:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYtvR-0001fh-EJ
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 15:03:33 +0000
X-Inumbo-ID: 3feea7fe-886c-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3feea7fe-886c-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 15:03:32 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 09:03:31 -0600
Message-Id: <5CF92B420200007800235FE8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 09:03:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-3-roger.pau@citrix.com>
 <5CF908F00200007800235F1D@prv1-mh.provo.novell.com>
 <20190606145418.vfr6rnre2o7rmcfv@Air-de-Roger>
In-Reply-To: <20190606145418.vfr6rnre2o7rmcfv@Air-de-Roger>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field
 to pci_dev
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA2LjE5IGF0IDE2OjU0LCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IE9uIFRodSwgSnVuIDA2LCAyMDE5IGF0IDA2OjM3OjA0QU0gLTA2MDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+PiA+Pj4gT24gMDYuMDYuMTkgYXQgMTE6MDEsIDxyb2dlci5wYXVAY2l0cml4LmNvbT4g
d3JvdGU6Cj4+ID4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4+ID4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3BjaS5oCj4+ID4gQEAgLTgzLDkgKzgzLDE1IEBAIHN0cnVjdCBwY2lfZGV2IHsK
Pj4gPiAgICAgIHN0cnVjdCBhcmNoX21zaXggKm1zaXg7Cj4+ID4gIAo+PiA+ICAgICAgc3RydWN0
IGRvbWFpbiAqZG9tYWluOwo+PiA+IC0gICAgY29uc3QgdTE2IHNlZzsKPj4gPiAtICAgIGNvbnN0
IHU4IGJ1czsKPj4gPiAtICAgIGNvbnN0IHU4IGRldmZuOwo+PiA+ICsKPj4gPiArICAgIHVuaW9u
IHsKPj4gPiArICAgICAgICBzdHJ1Y3Qgewo+PiA+ICsgICAgICAgICAgICBjb25zdCB1aW50OF90
IGRldmZuOwo+PiA+ICsgICAgICAgICAgICBjb25zdCB1aW50OF90IGJ1czsKPj4gPiArICAgICAg
ICAgICAgY29uc3QgdWludDE2X3Qgc2VnOwo+PiA+ICsgICAgICAgIH07Cj4+ID4gKyAgICAgICAg
Y29uc3QgcGNpX3NiZGZfdCBzYmRmOwo+PiA+ICsgICAgfTsKPj4gCj4+IERvZXNuJ3Qgc3RpY2tp
bmcgYSBzaW5nbGUgImNvbnN0IiBhdCB0aGUgdW5pb24gaGF2ZSB0aGUgc2FtZSBlZmZlY3Q/Cj4g
Cj4gSW5kZWVkLCBhbmQgSSd2ZSBhbHJlYWR5IGRvbmUgc28sIEkgYXNzdW1lIGl0J3MgZmluZSB0
byBrZWVwIHlvdXIgQWNrLgoKRGVmaW5pdGVseS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
