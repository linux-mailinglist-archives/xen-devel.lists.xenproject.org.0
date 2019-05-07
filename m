Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12F215FE6
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 10:58:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNvt6-0004BV-47; Tue, 07 May 2019 08:55:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hNvt4-0004BM-ID
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 08:55:46 +0000
X-Inumbo-ID: e642be48-70a5-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e642be48-70a5-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 08:55:45 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 02:55:44 -0600
Message-Id: <5CD1480E020000780022C615@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 02:55:42 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com><cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
In-Reply-To: <a8bebd8db2727b8b95edcee613f39b90fa93daff.1557154206.git-series.marmarek@invisiblethingslab.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 3/5] drivers/video: Drop framebuffer size
 constraints
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
Cc: Olaf Hering <olaf@aepfle.de>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA2LjA1LjE5IGF0IDE2OjUwLCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gVGhlIGxpbWl0IDE5MDB4MTIwMCBkbyBub3QgbWF0Y2ggcmVhbCB3b3JsZCBk
ZXZpY2VzICgxOTAwIGxvb2tzIGxpa2UgYQo+IHR5cG8sIHNob3VsZCBiZSAxOTIwKS4gQnV0IGlu
IHByYWN0aWNlIHRoZSBsaW1pdHMgYXJlIGFyYml0cmFyeSBhbmQgZG8KPiBub3Qgc2VydmUgYW55
IHJlYWwgcHVycG9zZS4gQXMgZGlzY3Vzc2VkIGluICJJbmNyZWFzZSBmcmFtZWJ1ZmZlciBzaXpl
Cj4gdG8gdG9kYXlzIHN0YW5kYXJkcyIgdGhyZWFkLCBkcm9wIHRoZW0gY29tcGxldGVseS4KPiAK
PiBUaGlzIGZpeGVzIGdyYXBoaWMgY29uc29sZSBvbiBkZXZpY2Ugd2l0aCAzODQweDIxNjAgbmF0
aXZlIHJlc29sdXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfD
s3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgoKQW5kIHVubGVzcyBJJ20g
bWlzLXJlbWVtYmVyaW5nIGFnYWluClN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
