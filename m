Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5786815D641
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2020 12:06:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2YlK-0007pO-Fr; Fri, 14 Feb 2020 11:03:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NNNH=4C=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2YlI-0007pJ-64
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2020 11:03:56 +0000
X-Inumbo-ID: b11c32ec-4f19-11ea-ba0c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b11c32ec-4f19-11ea-ba0c-12813bfff9fa;
 Fri, 14 Feb 2020 11:03:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2YlH-0006FU-0C; Fri, 14 Feb 2020 11:03:55 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2YlG-0002gZ-Ng; Fri, 14 Feb 2020 11:03:54 +0000
Date: Fri, 14 Feb 2020 11:03:52 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200214110352.7me7qfslfeu2lkzi@debian>
References: <20200214103911.7995-1-wl@xen.org>
 <24134.32220.165853.192855@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <24134.32220.165853.192855@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: mark parameters in stub functions as
 unused
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Xen Development List <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBGZWIgMTQsIDIwMjAgYXQgMTE6MDA6NDRBTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJbUEFUQ0hdIGxpYnhsOiBtYXJrIHBhcmFtZXRlcnMgaW4g
c3R1YiBmdW5jdGlvbnMgYXMgdW51c2VkIik6Cj4gPiBIb3BlZnVsbHkgdGhpcyBjYW4gZml4IGlz
c3VlcyBsaWtlOgo+ID4gCj4gPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4vLi4vc3JjL2xpYnhs
L3hlbl94bC5jOjI0OjA6Cj4gPiAvaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NzAzNS5idWlsZC1hbWQ2
NC1saWJ2aXJ0L3hlbmRpc3QvdXNyL2xvY2FsL2luY2x1ZGUvbGlieGwuaDogSW4gZnVuY3Rpb24g
J2xpYnhsX2NwdWlkX2FwcGx5X3BvbGljeSc6Cj4gPiAvaG9tZS9vc3N0ZXN0L2J1aWxkLjE0NzAz
NS5idWlsZC1hbWQ2NC1saWJ2aXJ0L3hlbmRpc3QvdXNyL2xvY2FsL2luY2x1ZGUvbGlieGwuaDoy
MzQ1OjU2OiBlcnJvcjogdW51c2VkIHBhcmFtZXRlciAnY3R4JyBbLVdlcnJvcj11bnVzZWQtcGFy
YW1ldGVyXQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBsaWJ4bF9jcHVpZF9hcHBseV9wb2xpY3ko
bGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkKSB7fQo+ID4gCj4gPiBGaXhlczogZGFjYjgw
ZjkgKCJ0b29scy9saWJ4bDogUmVtb3ZlIGxpYnhsX2NwdWlkX3tzZXQsYXBwbHlfcG9saWN5fSgp
IGZyb20gdGhlIEFQSSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+
ID4gLS0tCj4gPiBOb3QgYWJsZSB0byB0ZXN0IHRoaXMgbG9jYWxseSwgcGxlYXNlIHJldmlldyBj
YXJlZnVsbHkuLi4KPiAKPiBUaGUgc3ludGF4IGxvb2tzIGdvb2QgdG8gbWUuICBJIGhhdmVuJ3Qg
Y29tcGlsZWQgaXQuCj4gCgpJIGhhdmUgYWN0dWFsbHkgc3VjY2Vzc2Z1bGx5IGNvbXBpbGVkIGEg
QyBmaWxlIHdyaXR0ZW4gaW4gYSBzaW1pbGFyIHdheQphbmQgdHJpZWQgd2l0aCAvIHdpdGhvdXQg
LVd1bnVzZWQtcGFyZW1ldGVyLiBBZnRlciBhZGRpbmcgdGhlIHVudXNlZAphdHRyaWJ1dGUgZ2Nj
IHN0b3BwZWQgc3BpdHRpbmcgb3V0IGEgd2FybmluZy4KCkkgZG9uJ3QgaGF2ZSBsaWJ2aXJ0IGx5
aW5nIGFyb3VuZCB0aG91Z2guIFRoYXQncyB3aGF0IEkgZGlkbid0IHRlc3QuCgo+IEFja2VkLWJ5
OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KClRoYW5rcy4gSSB3aWxs
IHB1c2ggaXQgc2hvcnRseS4KCldlaS4KCj4gCj4gSWFuLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
