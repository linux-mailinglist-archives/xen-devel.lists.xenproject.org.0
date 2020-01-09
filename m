Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3330B135D61
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:00:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipaCc-0007TH-G4; Thu, 09 Jan 2020 15:58:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RwFX=26=arm.com=catalin.marinas@srs-us1.protection.inumbo.net>)
 id 1ipaCb-0007T5-1z
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 15:58:29 +0000
X-Inumbo-ID: e0122581-32f8-11ea-b9fc-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e0122581-32f8-11ea-b9fc-12813bfff9fa;
 Thu, 09 Jan 2020 15:58:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B95CB1FB;
 Thu,  9 Jan 2020 07:58:27 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 D477D3F703; Thu,  9 Jan 2020 07:58:26 -0800 (PST)
Date: Thu, 9 Jan 2020 15:58:24 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Message-ID: <20200109155824.GG25655@arrakis.emea.arm.com>
References: <20191219122532.6538-1-broonie@kernel.org>
 <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
 <20200108155551.GA19197@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200108155551.GA19197@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: xen-devel@lists.xenproject.org, Mark Brown <broonie@kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDM6NTU6NTJQTSArMDAwMCwgV2lsbCBEZWFjb24gd3Jv
dGU6Cj4gT24gVGh1LCBEZWMgMTksIDIwMTkgYXQgMDE6MDc6NTBQTSAtMDgwMCwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOgo+ID4gT24gVGh1LCAxOSBEZWMgMjAxOSwgTWFyayBCcm93biB3cm90
ZToKPiA+ID4gSW4gYW4gZWZmb3J0IHRvIGNsYXJpZnkgYW5kIHNpbXBsaWZ5IHRoZSBhbm5vdGF0
aW9uIG9mIGFzc2VtYmx5IGZ1bmN0aW9ucwo+ID4gPiBpbiB0aGUga2VybmVsIG5ldyBtYWNyb3Mg
aGF2ZSBiZWVuIGludHJvZHVjZWQuIFRoZXNlIHJlcGxhY2UgRU5UUlkgYW5kCj4gPiA+IEVORFBS
T0MuIFVwZGF0ZSB0aGUgYW5ub3RhdGlvbnMgaW4gdGhlIHhlbiBjb2RlIHRvIHRoZSBuZXcgbWFj
cm9zLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogTWFyayBCcm93biA8YnJvb25pZUBrZXJu
ZWwub3JnPgo+ID4gPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4K
PiA+ID4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVs
Lm9yZz4KPiA+IAo+ID4gVGhhbmsgeW91IQo+ID4gCj4gPiA+IC0tLQo+ID4gPiAgYXJjaC9hcm02
NC94ZW4vaHlwZXJjYWxsLlMgfCA4ICsrKystLS0tCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IElzIHRoaXMgZ29pbmcgdmlhIHRoZSBY
ZW4gdHJlZSwgb3Igc2hhbGwgSSBxdWV1ZSBpdCBhbG9uZyB3aXRoIHRoZSBvdGhlcgo+IGFzbSBh
bm5vdGF0aW9uIHBhdGNoZXMgaW4gdGhlIGFybTY0IHRyZWU/IEkgZG9uJ3Qgc2VlIGl0IGluIC1u
ZXh0IHlldC4KClNpbmNlIGl0IGhhcyBiZWVuIHJldmlld2VkIGJ5IHRoZSBYZW4gbWFpbnRhaW5l
cnMsIGp1c3QgcXVldWUgaXQgdmlhIHRoZQphcm02NCB0cmVlLgoKLS0gCkNhdGFsaW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
