Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E9315446D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:01:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izgkV-00006J-7g; Thu, 06 Feb 2020 12:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=I8Ts=32=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1izgkT-00006C-81
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 12:59:13 +0000
X-Inumbo-ID: 78e3ae6c-48e0-11ea-8952-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78e3ae6c-48e0-11ea-8952-bc764e2007e4;
 Thu, 06 Feb 2020 12:59:12 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izgkR-0002ux-0u; Thu, 06 Feb 2020 12:59:11 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1izgkQ-0006D4-Na; Thu, 06 Feb 2020 12:59:10 +0000
Date: Thu, 6 Feb 2020 12:59:07 +0000
From: Wei Liu <wl@xen.org>
To: Roger Pau Monne <roger.pau@citrix.com>
Message-ID: <20200206125907.5sr2egtkvq5qggks@debian>
References: <20200127181115.82709-1-roger.pau@citrix.com>
 <20200127181115.82709-6-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200127181115.82709-6-roger.pau@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 5/7] x86/tlb: introduce a flush guests
 TLB flag
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjcsIDIwMjAgYXQgMDc6MTE6MTNQTSArMDEwMCwgUm9nZXIgUGF1IE1vbm5l
IHdyb3RlOgo+IEludHJvZHVjZSBhIHNwZWNpZmljIGZsYWcgdG8gcmVxdWVzdCBhIEhWTSBndWVz
dCBUTEIgZmx1c2gsIHdoaWNoIGlzCj4gYW4gQVNJRC9WUElEIHRpY2tsZSB0aGF0IGZvcmNlcyBh
IGxpbmVhciBUTEIgZmx1c2ggZm9yIGFsbCBIVk0gZ3Vlc3RzLgo+IAo+IFRoaXMgd2FzIHByZXZp
b3VzbHkgdW5jb25kaXRpb25hbGx5IGRvbmUgaW4gZWFjaCBwcmVfZmx1c2ggY2FsbCwgYnV0Cj4g
dGhhdCdzIG5vdCByZXF1aXJlZDogSFZNIGd1ZXN0cyBub3QgdXNpbmcgc2hhZG93IGRvbid0IHJl
cXVpcmUgbGluZWFyCj4gVExCIGZsdXNoZXMgYXMgWGVuIGRvZXNuJ3QgbW9kaWZ5IHRoZSBndWVz
dCBwYWdlIHRhYmxlcyBpbiB0aGF0IGNhc2UKPiAoaWU6IHdoZW4gdXNpbmcgSEFQKS4KPiAKPiBN
b2RpZnkgYWxsIHNoYWRvdyBjb2RlIFRMQiBmbHVzaGVzIHRvIGFsc28gZmx1c2ggdGhlIGd1ZXN0
IFRMQiwgaW4KPiBvcmRlciB0byBrZWVwIHRoZSBwcmV2aW91cyBiZWhhdmlvci4gSSBoYXZlbid0
IGxvb2tlZCBhdCBlYWNoIHNwZWNpZmljCj4gc2hhZG93IGNvZGUgVExCIGZsdXNoIGluIG9yZGVy
IHRvIGZpZ3VyZSBvdXQgd2hldGhlciBpdCBhY3R1YWxseQo+IHJlcXVpcmVzIGEgZ3Vlc3QgVExC
IGZsdXNoIG9yIG5vdCwgc28gdGhlcmUgbWlnaHQgYmUgcm9vbSBmb3IKPiBpbXByb3ZlbWVudCBp
biB0aGF0IHJlZ2FyZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
