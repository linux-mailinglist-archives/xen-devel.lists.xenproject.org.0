Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763C135E6E
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:37:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipamE-0003Jw-69; Thu, 09 Jan 2020 16:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Vvx6=26=kernel.org=will@srs-us1.protection.inumbo.net>)
 id 1ipamC-0003Jq-P4
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 16:35:16 +0000
X-Inumbo-ID: 042ae4fc-32fe-11ea-a985-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 042ae4fc-32fe-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 16:35:16 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD5E82067D;
 Thu,  9 Jan 2020 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578587715;
 bh=9+3mtYJWy2X0xjwrbEXAnSe2x3zw/Yj81pMwQqQ9vks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KtA3WfN5PSZoZnmkkdr548BNSJ/JxU53pmGFvgmvs2zounvUgg8wLq1HHnFqfsaOb
 IHC9S/t/YRogckZg5LXlGF5g81wd9pQ25g+VIRns9xYdETOfIU6ZwG4ObtiA+IG1xC
 D+pYAVp+S3jYKkrvBwkmebtzhQCNuV/HsiZXKTu0=
Date: Thu, 9 Jan 2020 16:35:11 +0000
From: Will Deacon <will@kernel.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20200109163511.GA14742@willie-the-truck>
References: <20191219122532.6538-1-broonie@kernel.org>
 <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
 <20200108155551.GA19197@willie-the-truck>
 <20200109155824.GG25655@arrakis.emea.arm.com>
 <alpine.DEB.2.21.2001090833280.18413@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2001090833280.18413@sstabellini-ThinkPad-T480s>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Julien Grall <julien@xen.org>, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDg6MzM6MzdBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIFRodSwgOSBKYW4gMjAyMCwgQ2F0YWxpbiBNYXJpbmFzIHdyb3RlOgo+
ID4gT24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMDM6NTU6NTJQTSArMDAwMCwgV2lsbCBEZWFjb24g
d3JvdGU6Cj4gPiA+IE9uIFRodSwgRGVjIDE5LCAyMDE5IGF0IDAxOjA3OjUwUE0gLTA4MDAsIFN0
ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIDE5IERlYyAyMDE5LCBNYXJr
IEJyb3duIHdyb3RlOgo+ID4gPiA+ID4gSW4gYW4gZWZmb3J0IHRvIGNsYXJpZnkgYW5kIHNpbXBs
aWZ5IHRoZSBhbm5vdGF0aW9uIG9mIGFzc2VtYmx5IGZ1bmN0aW9ucwo+ID4gPiA+ID4gaW4gdGhl
IGtlcm5lbCBuZXcgbWFjcm9zIGhhdmUgYmVlbiBpbnRyb2R1Y2VkLiBUaGVzZSByZXBsYWNlIEVO
VFJZIGFuZAo+ID4gPiA+ID4gRU5EUFJPQy4gVXBkYXRlIHRoZSBhbm5vdGF0aW9ucyBpbiB0aGUg
eGVuIGNvZGUgdG8gdGhlIG5ldyBtYWNyb3MuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IE1hcmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiA+ID4gPiA+IFJldmlld2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+ID4gPiA+ID4gUmV2aWV3ZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPiA+ID4gPiAKPiA+
ID4gPiBUaGFuayB5b3UhCj4gPiA+ID4gCj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBhcmNoL2Fy
bTY0L3hlbi9oeXBlcmNhbGwuUyB8IDggKysrKy0tLS0KPiA+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gSXMgdGhpcyBn
b2luZyB2aWEgdGhlIFhlbiB0cmVlLCBvciBzaGFsbCBJIHF1ZXVlIGl0IGFsb25nIHdpdGggdGhl
IG90aGVyCj4gPiA+IGFzbSBhbm5vdGF0aW9uIHBhdGNoZXMgaW4gdGhlIGFybTY0IHRyZWU/IEkg
ZG9uJ3Qgc2VlIGl0IGluIC1uZXh0IHlldC4KPiA+IAo+ID4gU2luY2UgaXQgaGFzIGJlZW4gcmV2
aWV3ZWQgYnkgdGhlIFhlbiBtYWludGFpbmVycywganVzdCBxdWV1ZSBpdCB2aWEgdGhlCj4gPiBh
cm02NCB0cmVlLgo+IAo+IFllcywgdGhhdCdzIGZpbmUgYnkgbWUKCkRvbmUuIFdpbGwgdXBkYXRl
IHRoZSBicmFuY2ggdG9tb3Jyb3cuCgpDaGVlcnMsCgpXaWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
