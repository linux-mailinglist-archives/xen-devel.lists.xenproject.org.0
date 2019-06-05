Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06286360B1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 18:00:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYIs-0007bh-IB; Wed, 05 Jun 2019 15:58:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYYIq-0007bc-P6
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 15:58:16 +0000
X-Inumbo-ID: ba2813b7-87aa-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba2813b7-87aa-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 15:58:15 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 09:58:14 -0600
Message-Id: <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 09:58:11 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
In-Reply-To: <20190516133735.18883-2-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuLAoKPj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBh
bS5jb20+IHdyb3RlOgo+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9ydHMgKl9kZWZjb25maWcg
cnVsZXMgaXQgaXMgZ29vZCB0byBiZSBhYmxlCj4gdG8gY29uZmlndXJlIG1pbmltYWwgWEVOIGlt
YWdlIHdpdGgKPiAKPiAgbWFrZSB0aW55NjRfZGVmY29uZmlnCj4gCj4gY29tbWFuZC4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5j
b20+Cgp5b3UgaGFkIG9iamVjdGlvbnMgaGVyZSwgYW5kIHRoZSBmaXJzdCBwYXRjaCBtYWtlcyBs
aXR0bGUgc2Vuc2UKd2l0aG91dCB0aGUgMm5kLiBNYXkgSSBhc2sgd2hhdCB0aGUgdmVyZGljdCBp
cywgaS5lLiB3aGV0aGVyIEkgc2hvdWxkCmRyb3AgdGhlc2UgdHdvIGZyb20gbXkgbGlzdCBvZiBw
ZW5kaW5nIHBhdGNoZXM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
