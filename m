Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 214A0152A29
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 12:46:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izJ5r-0005KH-QP; Wed, 05 Feb 2020 11:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=n2Y8=3Z=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izJ5q-0005KC-KM
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 11:43:42 +0000
X-Inumbo-ID: c1fdc0a8-480c-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1fdc0a8-480c-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 11:43:42 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJ5o-0003r6-9y; Wed, 05 Feb 2020 11:43:40 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izJ5o-0004ib-0A; Wed, 05 Feb 2020 11:43:40 +0000
Date: Wed, 5 Feb 2020 11:43:33 +0000
From: Wei Liu <wl@xen.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20200205114333.jvztqozyebmnr6pt@debian>
References: <20200205112412.19414-1-pdurrant@amazon.com>
 <20200205112930.GC85066@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200205112930.GC85066@perard.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix assertion failure in stub
 domain creation
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6Mjk6MzBBTSArMDAwMCwgQW50aG9ueSBQRVJBUkQg
d3JvdGU6Cj4gT24gV2VkLCBGZWIgMDUsIDIwMjAgYXQgMTE6MjQ6MTJBTSArMDAwMCwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+ID4gTk9URTogVGhlIGNvbW1lbnQgZm9yIFhFTl9ET01DVExfY3JlYXRl
ZG9tYWluIGluIGRvbWN0bC5oIGlzIGNoYW5nZWQgdG8KPiA+ICAgICAgIHJlZmxlY3QgcmVhbGl0
eS4KPiAKPiBTdXJlbHksIHRoaXMgY2hhbmdlIGRlc2VydmUgdG8gYmUgaW4gaXRzIG93biBwYXRj
aCwgaXNuJ3QgaXQ/CgpJZGVhbGx5IEkgd291bGQgd2FudCB0aGF0IHRvby4gQnV0IHRoaXMgcGF0
Y2ggaXMgdHJpdmlhbCBzbyBJJ20gbm90IHRvbwpmdXNzZWQgZWl0aGVyIHdheS4KCldlaS4KCj4g
Cj4gLS0gCj4gQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
