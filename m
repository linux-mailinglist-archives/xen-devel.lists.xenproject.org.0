Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCFF126F6C
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 22:10:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ii31a-0008Vg-67; Thu, 19 Dec 2019 21:07:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZrwE=2J=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ii31Z-0008Vb-E6
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 21:07:57 +0000
X-Inumbo-ID: a12423a7-22a3-11ea-9296-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a12423a7-22a3-11ea-9296-12813bfff9fa;
 Thu, 19 Dec 2019 21:07:57 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 11B9121D7D;
 Thu, 19 Dec 2019 21:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576789676;
 bh=mRwJ3TFMybkPYT/eY1l83r9mSMwFUFYKIs4bT5vCFxg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=efdGhesOQO9OcYFKml7AwibVo7HI8XUhzFgm/9QAUkru3Ug6pmXZGPviJkhEgjoVK
 v6Ms+Ylba97HHNYjWV0cKupzaYwiVSo2OortrtIcz6Hs2IQhIBgz+rkKK7iSwdya3O
 ofP4fp2iYU2ba8hnhkyJ9gyw7nHKU62qhyo+jxFY=
Date: Thu, 19 Dec 2019 13:07:50 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <20191219122532.6538-1-broonie@kernel.org>
Message-ID: <alpine.DEB.2.21.1912191307410.9832@sstabellini-ThinkPad-T480s>
References: <20191219122532.6538-1-broonie@kernel.org>
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
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBEZWMgMjAxOSwgTWFyayBCcm93biB3cm90ZToKPiBJbiBhbiBlZmZvcnQgdG8g
Y2xhcmlmeSBhbmQgc2ltcGxpZnkgdGhlIGFubm90YXRpb24gb2YgYXNzZW1ibHkgZnVuY3Rpb25z
Cj4gaW4gdGhlIGtlcm5lbCBuZXcgbWFjcm9zIGhhdmUgYmVlbiBpbnRyb2R1Y2VkLiBUaGVzZSBy
ZXBsYWNlIEVOVFJZIGFuZAo+IEVORFBST0MuIFVwZGF0ZSB0aGUgYW5ub3RhdGlvbnMgaW4gdGhl
IHhlbiBjb2RlIHRvIHRoZSBuZXcgbWFjcm9zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1hcmsgQnJv
d24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4KPiBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgoKVGhhbmsgeW91IQoKPiAtLS0KPiAgYXJjaC9hcm02NC94ZW4vaHlwZXJj
YWxsLlMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5T
IGIvYXJjaC9hcm02NC94ZW4vaHlwZXJjYWxsLlMKPiBpbmRleCBjNWYwNWM0YTRkMDAuLjViMDlh
Y2E1NTEwOCAxMDA2NDQKPiAtLS0gYS9hcmNoL2FybTY0L3hlbi9oeXBlcmNhbGwuUwo+ICsrKyBi
L2FyY2gvYXJtNjQveGVuL2h5cGVyY2FsbC5TCj4gQEAgLTU2LDExICs1NiwxMSBAQAo+ICAjZGVm
aW5lIFhFTl9JTU0gMHhFQTEKPiAgCj4gICNkZWZpbmUgSFlQRVJDQUxMX1NJTVBMRShoeXBlcmNh
bGwpCQlcCj4gLUVOVFJZKEhZUEVSVklTT1JfIyNoeXBlcmNhbGwpCQkJXAo+ICtTWU1fRlVOQ19T
VEFSVChIWVBFUlZJU09SXyMjaHlwZXJjYWxsKQkJXAo+ICAJbW92IHgxNiwgI19fSFlQRVJWSVNP
Ul8jI2h5cGVyY2FsbDsJXAo+ICAJaHZjIFhFTl9JTU07CQkJCVwKPiAgCXJldDsJCQkJCVwKPiAt
RU5EUFJPQyhIWVBFUlZJU09SXyMjaHlwZXJjYWxsKQo+ICtTWU1fRlVOQ19FTkQoSFlQRVJWSVNP
Ul8jI2h5cGVyY2FsbCkKPiAgCj4gICNkZWZpbmUgSFlQRVJDQUxMMCBIWVBFUkNBTExfU0lNUExF
Cj4gICNkZWZpbmUgSFlQRVJDQUxMMSBIWVBFUkNBTExfU0lNUExFCj4gQEAgLTg2LDcgKzg2LDcg
QEAgSFlQRVJDQUxMMihtdWx0aWNhbGwpOwo+ICBIWVBFUkNBTEwyKHZtX2Fzc2lzdCk7Cj4gIEhZ
UEVSQ0FMTDMoZG1fb3ApOwo+ICAKPiAtRU5UUlkocHJpdmNtZF9jYWxsKQo+ICtTWU1fRlVOQ19T
VEFSVChwcml2Y21kX2NhbGwpCj4gIAltb3YgeDE2LCB4MAo+ICAJbW92IHgwLCB4MQo+ICAJbW92
IHgxLCB4Mgo+IEBAIC0xMDksNCArMTA5LDQgQEAgRU5UUlkocHJpdmNtZF9jYWxsKQo+ICAJICov
Cj4gIAl1YWNjZXNzX3R0YnIwX2Rpc2FibGUgeDYsIHg3Cj4gIAlyZXQKPiAtRU5EUFJPQyhwcml2
Y21kX2NhbGwpOwo+ICtTWU1fRlVOQ19FTkQocHJpdmNtZF9jYWxsKTsKPiAtLSAKPiAyLjIwLjEK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
