Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C568B135E6C
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:37:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipakk-0003Eq-Oy; Thu, 09 Jan 2020 16:33:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SEV0=26=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ipaki-0003El-QQ
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 16:33:44 +0000
X-Inumbo-ID: cd4a7060-32fd-11ea-b89f-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd4a7060-32fd-11ea-b89f-bc764e2007e4;
 Thu, 09 Jan 2020 16:33:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 827B220721;
 Thu,  9 Jan 2020 16:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578587623;
 bh=0PvoObVIe31z/I11WaTniqIm+DpgJaepCXn4s0n62Rc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RNGp5ZZmEJnSlqvfJe5nm/ypHkLJV9g9kK5hilHSNrsib6h0YIdUZplI4kU6w5QfR
 57esxv7xBqXygIOv7orp+wk+yGXSosbUsALeZQmRL3LYo6TTrw5wp/MyJTGwvFDI+x
 tXwqZf1PTZY0BDwZaLK1xky4mBbok6DgBpyloxRw=
Date: Thu, 9 Jan 2020 08:33:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <20200109155824.GG25655@arrakis.emea.arm.com>
Message-ID: <alpine.DEB.2.21.2001090833280.18413@sstabellini-ThinkPad-T480s>
References: <20191219122532.6538-1-broonie@kernel.org>
 <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
 <20200108155551.GA19197@willie-the-truck>
 <20200109155824.GG25655@arrakis.emea.arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] arm64: xen: Use modern annotations for
 assembly functions
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
 Mark Brown <broonie@kernel.org>, xen-devel@lists.xenproject.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA5IEphbiAyMDIwLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gT24gV2VkLCBKYW4g
MDgsIDIwMjAgYXQgMDM6NTU6NTJQTSArMDAwMCwgV2lsbCBEZWFjb24gd3JvdGU6Cj4gPiBPbiBU
aHUsIERlYyAxOSwgMjAxOSBhdCAwMTowNzo1MFBNIC0wODAwLCBTdGVmYW5vIFN0YWJlbGxpbmkg
d3JvdGU6Cj4gPiA+IE9uIFRodSwgMTkgRGVjIDIwMTksIE1hcmsgQnJvd24gd3JvdGU6Cj4gPiA+
ID4gSW4gYW4gZWZmb3J0IHRvIGNsYXJpZnkgYW5kIHNpbXBsaWZ5IHRoZSBhbm5vdGF0aW9uIG9m
IGFzc2VtYmx5IGZ1bmN0aW9ucwo+ID4gPiA+IGluIHRoZSBrZXJuZWwgbmV3IG1hY3JvcyBoYXZl
IGJlZW4gaW50cm9kdWNlZC4gVGhlc2UgcmVwbGFjZSBFTlRSWSBhbmQKPiA+ID4gPiBFTkRQUk9D
LiBVcGRhdGUgdGhlIGFubm90YXRpb25zIGluIHRoZSB4ZW4gY29kZSB0byB0aGUgbmV3IG1hY3Jv
cy4KPiA+ID4gPiAKPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+Cj4gPiA+ID4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlA
a2VybmVsLm9yZz4KPiA+ID4gCj4gPiA+IFRoYW5rIHlvdSEKPiA+ID4gCj4gPiA+ID4gLS0tCj4g
PiA+ID4gIGFyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TIHwgOCArKysrLS0tLQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBJ
cyB0aGlzIGdvaW5nIHZpYSB0aGUgWGVuIHRyZWUsIG9yIHNoYWxsIEkgcXVldWUgaXQgYWxvbmcg
d2l0aCB0aGUgb3RoZXIKPiA+IGFzbSBhbm5vdGF0aW9uIHBhdGNoZXMgaW4gdGhlIGFybTY0IHRy
ZWU/IEkgZG9uJ3Qgc2VlIGl0IGluIC1uZXh0IHlldC4KPiAKPiBTaW5jZSBpdCBoYXMgYmVlbiBy
ZXZpZXdlZCBieSB0aGUgWGVuIG1haW50YWluZXJzLCBqdXN0IHF1ZXVlIGl0IHZpYSB0aGUKPiBh
cm02NCB0cmVlLgoKWWVzLCB0aGF0J3MgZmluZSBieSBtZQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
