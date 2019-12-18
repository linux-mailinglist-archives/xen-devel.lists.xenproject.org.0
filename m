Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 514AE1257F2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 00:44:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihiwE-0004oh-Oz; Wed, 18 Dec 2019 23:41:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ihiwD-0004oc-9o
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 23:41:05 +0000
X-Inumbo-ID: daa860a6-21ef-11ea-912c-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id daa860a6-21ef-11ea-912c-12813bfff9fa;
 Wed, 18 Dec 2019 23:41:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 195DD218AC;
 Wed, 18 Dec 2019 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576712463;
 bh=fKUlrQAo+cpYx7KI6TLlwI8s49QrHGMHYG2vR0v2IZw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=ktYT4XdHS1mFFxO3ZqlsyO7GzNJKtNhrjAIr/03aExftmmcPLuy3BO0xVemiBpAm7
 0gx+ixKgOH3wJbqLL/zWwvavwcq8wNIGR+wah0eVmdtsci/OJGbAIc3HBWyxv1MOQ1
 A+7bS5y+4GA5GIqcu1XsIz1HoQYJlQkgPkrhQ9II=
Date: Wed, 18 Dec 2019 15:40:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20191218123756.41363-1-broonie@kernel.org>
Message-ID: <alpine.DEB.2.21.1912181539590.30543@sstabellini-ThinkPad-T480s>
References: <20191218123756.41363-1-broonie@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] arm64: xen: Use modern annotations for
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxOCBEZWMgMjAxOSwgTWFyayBCcm93biB3cm90ZToKPiBJbiBhbiBlZmZvcnQgdG8g
Y2xhcmlmeSBhbmQgc2ltcGxpZnkgdGhlIGFubm90YXRpb24gb2YgYXNzZW1ibHkgZnVuY3Rpb25z
Cj4gaW4gdGhlIGtlcm5lbCBuZXcgbWFjcm9zIGhhdmUgYmVlbiBpbnRyb2R1Y2VkLiBUaGVzZSBy
ZXBsYWNlIEVOVFJZIGFuZAo+IEVORFBST0MuIFVwZGF0ZSB0aGUgYW5ub3RhdGlvbnMgaW4gdGhl
IHhlbiBjb2RlIHRvIHRoZSBuZXcgbWFjcm9zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJv
d24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiAtLS0KPiAKPiBUaGlzIGlzIHBhcnQgb2YgYSB3aWRl
ciBlZmZvcnQgdG8gY29udmVydCBhbGwgdGhlIGFyY2gvYXJtNjQgY29kZS4KPiAKPiAgYXJjaC9h
cm02NC94ZW4vaHlwZXJjYWxsLlMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
eGVuL2h5cGVyY2FsbC5TIGIvYXJjaC9hcm02NC94ZW4vaHlwZXJjYWxsLlMKPiBpbmRleCBjNWYw
NWM0YTRkMDAuLjMwNWMyMjc0YjhlYiAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L3hlbi9oeXBl
cmNhbGwuUwo+ICsrKyBiL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCj4gQEAgLTU2LDExICs1
NiwxMSBAQAo+ICAjZGVmaW5lIFhFTl9JTU0gMHhFQTEKPiAgCj4gICNkZWZpbmUgSFlQRVJDQUxM
X1NJTVBMRShoeXBlcmNhbGwpCQlcCj4gLUVOVFJZKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCQkJ
XAo+ICtTWU1fRlVOQ19TVEFSVChIWVBFUlZJU09SXyMjaHlwZXJjYWxsKQkJCVwKCkNvdWxkIHlv
dSBwbGVhc2UgYWRqdXN0IHRoZSB0YWJzIHNvIHRoYXQgdGhlICdcJyBpcyBhbGlnbmVkIHdpdGgg
dGhlCm90aGVycz8KCldpdGggdGhhdCBjaGFuZ2U6CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gIAltb3YgeDE2LCAjX19IWVBFUlZJ
U09SXyMjaHlwZXJjYWxsOwlcCj4gIAlodmMgWEVOX0lNTTsJCQkJXAo+ICAJcmV0OwkJCQkJXAo+
IC1FTkRQUk9DKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCj4gK1NZTV9GVU5DX0VORChIWVBFUlZJ
U09SXyMjaHlwZXJjYWxsKQo+ICAKPiAgI2RlZmluZSBIWVBFUkNBTEwwIEhZUEVSQ0FMTF9TSU1Q
TEUKPiAgI2RlZmluZSBIWVBFUkNBTEwxIEhZUEVSQ0FMTF9TSU1QTEUKPiBAQCAtODYsNyArODYs
NyBAQCBIWVBFUkNBTEwyKG11bHRpY2FsbCk7Cj4gIEhZUEVSQ0FMTDIodm1fYXNzaXN0KTsKPiAg
SFlQRVJDQUxMMyhkbV9vcCk7Cj4gIAo+IC1FTlRSWShwcml2Y21kX2NhbGwpCj4gK1NZTV9GVU5D
X1NUQVJUKHByaXZjbWRfY2FsbCkKPiAgCW1vdiB4MTYsIHgwCj4gIAltb3YgeDAsIHgxCj4gIAlt
b3YgeDEsIHgyCj4gQEAgLTEwOSw0ICsxMDksNCBAQCBFTlRSWShwcml2Y21kX2NhbGwpCj4gIAkg
Ki8KPiAgCXVhY2Nlc3NfdHRicjBfZGlzYWJsZSB4NiwgeDcKPiAgCXJldAo+IC1FTkRQUk9DKHBy
aXZjbWRfY2FsbCk7Cj4gK1NZTV9GVU5DX0VORChwcml2Y21kX2NhbGwpOwo+IC0tIAo+IDIuMjAu
MQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
