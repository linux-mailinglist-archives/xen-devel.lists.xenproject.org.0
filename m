Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 343667AFA8
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 19:18:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsViq-0006o9-F5; Tue, 30 Jul 2019 17:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7c++=V3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsVio-0006ns-40
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 17:15:34 +0000
X-Inumbo-ID: a379bad8-b2ed-11e9-a64e-b715967ff1ee
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a379bad8-b2ed-11e9-a64e-b715967ff1ee;
 Tue, 30 Jul 2019 17:15:33 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B61D8206A2;
 Tue, 30 Jul 2019 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564506932;
 bh=0YT1lt3ardBRFw4XeCbccN+VjIQbGJW7wpSuKabl+kU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=K9aF4cjam1tJcTVCEnGjZwkDDRzOLrCd4cSfVxVhWZL3cHr71d0L9oNKi1UV9oQeT
 2INAoOBtHB1cxqmysIxofh6O7k8J7Mj57QNAl6FkjFaJOgbpJ49F1NjLGRlLRzBR3q
 56ZAaUQ5UajVJAXnQPrjdNnwepWnl69HuVAp78qQ=
Date: Tue, 30 Jul 2019 10:15:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190722213958.5761-11-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1907301015260.28600@sstabellini-ThinkPad-T480s>
References: <20190722213958.5761-1-julien.grall@arm.com>
 <20190722213958.5761-11-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 10/35] xen/arm64: head: Improve coding
 style and document create_pages_tables()
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFkanVzdCB0aGUgY29k
aW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcmVhdGVfcGFnZXNfdGFibGVz
KCkKPiAKPiBMYXN0bHksIGRvY3VtZW50IHRoZSBiZWhhdmlvciBhbmQgdGhlIG1haW4gcmVnaXN0
ZXJzIHVzYWdlIHdpdGhpbiB0aGUKPiBmdW5jdGlvbi4gTm90ZSB0aGF0IHgyNSBpcyBub3cgb25s
eSB1c2VkIHdpdGhpbiB0aGUgZnVuY3Rpb24sIHNvIGl0IGRvZXMKPiBub3QgbmVlZCB0byBiZSBw
YXJ0IG9mIHRoZSBjb21tb24gcmVnaXN0ZXIuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICB4ZW4vYXJjaC9hcm0vYXJtNjQv
aGVhZC5TIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5T
Cj4gaW5kZXggZGRjNTE2NzAyMC4uZWRkZjY2MzAyMSAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+IEBAIC03
MCw3ICs3MCw3IEBACj4gICAqICB4MjIgLSBpc19zZWNvbmRhcnlfY3B1Cj4gICAqICB4MjMgLSBV
QVJUIGFkZHJlc3MKPiAgICogIHgyNCAtCj4gLSAqICB4MjUgLSBpZGVudGl0eSBtYXAgaW4gcGxh
Y2UKPiArICogIHgyNSAtCj4gICAqICB4MjYgLSBza2lwX3plcm9fYnNzIChib290IGNwdSBvbmx5
KQo+ICAgKiAgeDI3IC0KPiAgICogIHgyOCAtCj4gQEAgLTQzNiwxNiArNDM2LDI3IEBAIGNwdV9p
bml0Ogo+ICAgICAgICAgIHJldAo+ICBFTkRQUk9DKGNwdV9pbml0KQo+ICAKPiArLyoKPiArICog
UmVidWlsZCB0aGUgYm9vdCBwYWdldGFibGUncyBmaXJzdC1sZXZlbCBlbnRyaWVzLiBUaGUgc3Ry
dWN0dXJlCj4gKyAqIGlzIGRlc2NyaWJlZCBpbiBtbS5jLgo+ICsgKgo+ICsgKiBBZnRlciB0aGUg
Q1BVIGVuYWJsZXMgcGFnaW5nIGl0IHdpbGwgYWRkIHRoZSBmaXhtYXAgbWFwcGluZwo+ICsgKiB0
byB0aGVzZSBwYWdlIHRhYmxlcywgaG93ZXZlciB0aGlzIG1heSBjbGFzaCB3aXRoIHRoZSAxOjEK
PiArICogbWFwcGluZy4gU28gZWFjaCBDUFUgbXVzdCByZWJ1aWxkIHRoZSBwYWdlIHRhYmxlcyBo
ZXJlIHdpdGgKPiArICogdGhlIDE6MSBpbiBwbGFjZS4KPiArICoKPiArICogSW5wdXRzOgo+ICsg
KiAgIHgxOTogcGFkZHIoc3RhcnQpCj4gKyAqICAgeDIwOiBwaHlzIG9mZnNldAo+ICsgKgo+ICsg
KiBDbG9iYmVycyB4MCAtIHg0LCB4MjUKPiArICoKPiArICogUmVnaXN0ZXIgdXNhZ2Ugd2l0aGlu
IHRoaXMgZnVuY3Rpb246Cj4gKyAqICAgeDI1OiBJZGVudGl0eSBtYXAgaW4gcGxhY2UKPiArICov
Cj4gIGNyZWF0ZV9wYWdlX3RhYmxlczoKPiAtICAgICAgICAvKiBSZWJ1aWxkIHRoZSBib290IHBh
Z2V0YWJsZSdzIGZpcnN0LWxldmVsIGVudHJpZXMuIFRoZSBzdHJ1Y3R1cmUKPiAtICAgICAgICAg
KiBpcyBkZXNjcmliZWQgaW4gbW0uYy4KPiAtICAgICAgICAgKgo+IC0gICAgICAgICAqIEFmdGVy
IHRoZSBDUFUgZW5hYmxlcyBwYWdpbmcgaXQgd2lsbCBhZGQgdGhlIGZpeG1hcCBtYXBwaW5nCj4g
LSAgICAgICAgICogdG8gdGhlc2UgcGFnZSB0YWJsZXMsIGhvd2V2ZXIgdGhpcyBtYXkgY2xhc2gg
d2l0aCB0aGUgMToxCj4gLSAgICAgICAgICogbWFwcGluZy4gU28gZWFjaCBDUFUgbXVzdCByZWJ1
aWxkIHRoZSBwYWdlIHRhYmxlcyBoZXJlIHdpdGgKPiAtICAgICAgICAgKiB0aGUgMToxIGluIHBs
YWNlLiAqLwo+IC0KPiAtICAgICAgICAvKiBJZiBYZW4gaXMgbG9hZGVkIGF0IGV4YWN0bHkgWEVO
X1ZJUlRfU1RBUlQgdGhlbiB3ZSBkb24ndAo+ICsgICAgICAgIC8qCj4gKyAgICAgICAgICogSWYg
WGVuIGlzIGxvYWRlZCBhdCBleGFjdGx5IFhFTl9WSVJUX1NUQVJUIHRoZW4gd2UgZG9uJ3QKPiAg
ICAgICAgICAgKiBuZWVkIGFuIGFkZGl0aW9uYWwgMToxIG1hcHBpbmcsIHRoZSB2aXJ0dWFsIG1h
cHBpbmcgd2lsbAo+ICAgICAgICAgICAqIHN1ZmZpY2UuCj4gICAgICAgICAgICovCj4gQEAgLTQ2
OSw3ICs0ODAsOCBAQCBjcmVhdGVfcGFnZV90YWJsZXM6Cj4gICAgICAgICAgY2J6ICAgeDEsIDFm
ICAgICAgICAgICAgICAgICAvKiBJdCdzIGluIHNsb3QgMCwgbWFwIGluIGJvb3RfZmlyc3QKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG9yIGJvb3Rfc2Vjb25kIGxh
dGVyIG9uICovCj4gIAo+IC0gICAgICAgIC8qIExldmVsIHplcm8gZG9lcyBub3Qgc3VwcG9ydCBz
dXBlcnBhZ2UgbWFwcGluZ3MsIHNvIHdlIGhhdmUKPiArICAgICAgICAvKgo+ICsgICAgICAgICAq
IExldmVsIHplcm8gZG9lcyBub3Qgc3VwcG9ydCBzdXBlcnBhZ2UgbWFwcGluZ3MsIHNvIHdlIGhh
dmUKPiAgICAgICAgICAgKiB0byB1c2UgYW4gZXh0cmEgZmlyc3QgbGV2ZWwgcGFnZSBpbiB3aGlj
aCB3ZSBjcmVhdGUgYSAxR0IgbWFwcGluZy4KPiAgICAgICAgICAgKi8KPiAgICAgICAgICBsb2Fk
X3BhZGRyIHgyLCBib290X2ZpcnN0X2lkCj4gLS0gCj4gMi4xMS4wCj4gCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
