Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F45555CD5
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 02:11:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfvUm-0007WT-23; Wed, 26 Jun 2019 00:09:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JP5O=UZ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfvUl-0007WO-9Q
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 00:09:03 +0000
X-Inumbo-ID: 9a0777c4-97a6-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a0777c4-97a6-11e9-8980-bc764e045a96;
 Wed, 26 Jun 2019 00:09:01 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1617420665;
 Wed, 26 Jun 2019 00:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561507741;
 bh=VcNzH8JY2WMEMySld9qI8HO48DNWpgm45NZsfteObO4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=U6ltAr4FJyuohsNsFUcwx4+7W4JtFzfwMI42V6lI7HSmqX9i4kgppy6s2ythTK97U
 cwGY7eXF6ugLdjghLpLsfxOIf4kTfU8dww2nkeop9jNH0Ggw7iaaQG749BoP3T+Ii2
 D4FfEJMcfOTLr29ZNCj+RO1SG7cw9tY1KxksrbrA=
Date: Tue, 25 Jun 2019 17:09:00 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190610193215.23704-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906251704400.5851@sstabellini-ThinkPad-T480s>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 05/17] xen/arm64: head: Introduce print_reg
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 andre.przywara@arm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAxMCBKdW4gMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEF0IHRoZSBtb21lbnQs
IHRoZSB1c2VyIHNob3VsZCBzYXZlIHgzMC9sciBpZiBpdCBjYXJlcyBhYm91dCBpdC4KPiAKPiBG
b2xsb3ctdXAgcGF0Y2hlcyB3aWxsIGludHJvZHVjZSBtb3JlIHVzZSBvZiBwdXRuIGluIHBsYWNl
IHdoZXJlIGxyCj4gc2hvdWxkIGJlIHByZXNlcnZlZC4KPiAKPiBGdXJ0aGVybW9yZSwgYW55IHVz
ZXIgb2YgcHV0biBzaG91bGQgYWxzbyBtb3ZlIHRoZSB2YWx1ZSB0byByZWdpc3RlciB4MAo+IGlm
IGl0IHdhcyBzdG9yZWQgaW4gYSBkaWZmZXJlbnQgcmVnaXN0ZXIuCj4gCj4gRm9yIGNvbnZlbmll
bmNlLCBhIG5ldyBtYWNybyBpcyBpbnRyb2R1Y2VkIHRvIHByaW50IGEgZ2l2ZW4gcmVnaXN0ZXIu
Cj4gVGhlIG1hY3JvIHdpbGwgdGFrZSBjYXJlIGZvciB1cyB0byBtb3ZlIHRoZSB2YWx1ZSB0byB4
MCBhbmQgYWxzbwo+IHByZXNlcnZlIGxyLgo+IAo+IExhc3RseSB0aGUgbmV3IG1hY3JvIGlzIHVz
ZWQgdG8gcmVwbGFjZSBhbGwgdGhlIGNhbGxzaXRlIG9mIHB1dG4uIFRoaXMKPiB3aWxsIHNpbXBs
aWZ5IHJld29yay9yZXZpZXcgbGF0ZXIgb24uCj4gCj4gTm90ZSB0aGF0IEN1cnJlbnRFTCBpcyBu
b3cgc3RvcmVkIGluIHg1IGluc3RlYWQgb2YgeDQgYmVjYXVzZSB0aGUgbGF0dGVyCj4gd2lsbCBi
ZSBjbG9iYmVyZWQgYnkgdGhlIG1hY3JvIHByaW50X3JlZy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBK
dWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0v
YXJtNjQvaGVhZC5TIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
Cj4gaW5kZXggODRlMjY1ODJjNC4uOTE0MmI0YTc3NCAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC05
MCw4ICs5MCwyNSBAQAo+ICAgICAgICAgIGJsICAgIHB1dHMgICAgOyAgICAgXAo+ICAgICAgICAg
IG1vdiAgIGxyLCB4MyAgOyAgICAgXAo+ICAgICAgICAgIFJPREFUQV9TVFIoOTgsIF9zKQo+ICsK
PiArLyoKPiArICogTWFjcm8gdG8gcHJpbnQgdGhlIHZhbHVlIG9mIHJlZ2lzdGVyIFx4Ygo+ICsg
Kgo+ICsgKiBDbG9iYmVycyB4MCAtIHg0Cj4gKyAqLwo+ICsubWFjcm8gcHJpbnRfcmVnIHhiCj4g
KyAgICAgICAgbW92ICAgeDQsIGxyCj4gKyAgICAgICAgbW92ICAgeDAsIFx4Ygo+ICsgICAgICAg
IGJsICAgIHB1dG4KPiArICAgICAgICBtb3YgICBsciwgeDQKCkkgaGF2ZSB0aGUgc2FtZSB3ZWly
ZCBpc3N1ZXMgd2l0aCBteSBjb21waWxlciBhcyBiZWZvcmUsIHJlcGxhY2luZyAnbHInCndpdGgg
J3gzMCcgc29sdmVzIHRoZSBwcm9ibGVtLgoKVGhpcyBwYXRjaCBsb29rcyBPSyB0aG91Z2guCgoK
PiArLmVuZG0KPiArCj4gICNlbHNlIC8qIENPTkZJR19FQVJMWV9QUklOVEsgKi8KPiAgI2RlZmlu
ZSBQUklOVChzKQo+ICsKPiArLm1hY3JvIHByaW50X3JlZyB4Ygo+ICsuZW5kbQo+ICsKPiAgI2Vu
ZGlmIC8qICFDT05GSUdfRUFSTFlfUFJJTlRLICovCj4gIAo+ICAvKiBMb2FkIHRoZSBwaHlzaWNh
bCBhZGRyZXNzIG9mIGEgc3ltYm9sIGludG8geGIgKi8KPiBAQCAtMzA0LDIyICszMjEsMjAgQEAg
R0xPQkFMKGluaXRfc2Vjb25kYXJ5KQo+ICAjaWZkZWYgQ09ORklHX0VBUkxZX1BSSU5USwo+ICAg
ICAgICAgIGxkciAgIHgyMywgPUVBUkxZX1VBUlRfQkFTRV9BRERSRVNTIC8qIHgyMyA6PSBVQVJU
IGJhc2UgYWRkcmVzcyAqLwo+ICAgICAgICAgIFBSSU5UKCItIENQVSAiKQo+IC0gICAgICAgIG1v
diAgIHgwLCB4MjQKPiAtICAgICAgICBibCAgICBwdXRuCj4gKyAgICAgICAgcHJpbnRfcmVnIHgy
NAo+ICAgICAgICAgIFBSSU5UKCIgYm9vdGluZyAtXHJcbiIpCj4gICNlbmRpZgo+ICAKPiAgY29t
bW9uX3N0YXJ0Ogo+ICAKPiAgICAgICAgICBQUklOVCgiLSBDdXJyZW50IEVMICIpCj4gLSAgICAg
ICAgbXJzICAgeDQsIEN1cnJlbnRFTAo+IC0gICAgICAgIG1vdiAgIHgwLCB4NAo+IC0gICAgICAg
IGJsICAgIHB1dG4KPiArICAgICAgICBtcnMgICB4NSwgQ3VycmVudEVMCj4gKyAgICAgICAgcHJp
bnRfcmVnIHg1Cj4gICAgICAgICAgUFJJTlQoIiAtXHJcbiIpCj4gIAo+ICAgICAgICAgIC8qIEFy
ZSB3ZSBpbiBFTDIgKi8KPiAtICAgICAgICBjbXAgICB4NCwgI1BTUl9NT0RFX0VMMnQKPiAtICAg
ICAgICBjY21wICB4NCwgI1BTUl9NT0RFX0VMMmgsICMweDQsIG5lCj4gKyAgICAgICAgY21wICAg
eDUsICNQU1JfTU9ERV9FTDJ0Cj4gKyAgICAgICAgY2NtcCAgeDUsICNQU1JfTU9ERV9FTDJoLCAj
MHg0LCBuZQo+ICAgICAgICAgIGIuZXEgIGVsMiAvKiBZZXMgKi8KPiAgCj4gICAgICAgICAgLyog
T0ssIHdlJ3JlIGJvbmVkLiAqLwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
