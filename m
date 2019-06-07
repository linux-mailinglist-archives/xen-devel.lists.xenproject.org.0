Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1839917
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jun 2019 00:44:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZNWk-0001b7-Lj; Fri, 07 Jun 2019 22:40:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=weCb=UG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hZNWi-0001UE-Mr
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 22:40:00 +0000
X-Inumbo-ID: 2e645a56-8975-11e9-9f2a-c71f2ba70e22
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e645a56-8975-11e9-9f2a-c71f2ba70e22;
 Fri, 07 Jun 2019 22:39:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D035920840;
 Fri,  7 Jun 2019 22:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559947199;
 bh=kfPcru+ppYt0yKAfIOJREqkacg5tJad2GixqFkYF3yw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oTWQ32keHaKU/ez4uiEzlgZwUQOEDPNi637BxiNerp/0Lv0YF8zt1yCb6uzwuTfZ9
 5RZXh9csR2P9rA8WP5b10XXuoHtPpp5rFZE32N0K1xm0DtSa31WfYacTKj+6XhkEhi
 QvdE1LWqVCZq4lKr05DZT/tBn4lMk+qKTTx7GIvY=
Date: Fri, 7 Jun 2019 15:39:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190514122456.28559-6-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1906071539520.22017@sstabellini-ThinkPad-T480s>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-6-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 05/19] xen/arm: Remove
 parameter cpuid from start_xen
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
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAxNCBNYXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYXJhbWV0ZXIg
Y3B1aWQgaXMgbm90IHVzZWQgYnkgc3RhcnRfeGVuLiBTbyByZW1vdmUgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkFja2VkLWJ5OiBT
dGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+CgoKPiAtLS0KPiAgICAg
LSBSZS1vcmRlciB0aGUgcGF0Y2ggd2l0aCAieGVuL2FybTogUmV3b3JrIHNlY29uZGFyeV9zdGFy
dAo+ICAgICBwcm90b3R5cGUiCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAx
IC0KPiAgeGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyB8IDEgLQo+ICB4ZW4vYXJjaC9hcm0vc2V0
dXAuYyAgICAgIHwgMyArLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBi
L3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiBpbmRleCA4YTk4NjA3NDU5Li5jYjhhM2JmODI5
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiArKysgYi94ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TCj4gQEAgLTQ0Nyw3ICs0NDcsNiBAQCBsYXVuY2g6Cj4gICAgICAg
ICAgc3ViICAgc3AsICNDUFVJTkZPX3NpemVvZiAgICAvKiBNYWtlIHJvb20gZm9yIENQVSBzYXZl
IHJlY29yZCAqLwo+ICAgICAgICAgIG1vdiAgIHIwLCByMTAgICAgICAgICAgICAgICAgLyogTWFy
c2hhbCBhcmdzOiAtIHBoeXNfb2Zmc2V0ICovCj4gICAgICAgICAgbW92ICAgcjEsIHI4ICAgICAg
ICAgICAgICAgICAvKiAgICAgICAgICAgICAgIC0gRFRCIGFkZHJlc3MgKi8KPiAtICAgICAgICBt
b3YgICByMiwgcjcgICAgICAgICAgICAgICAgIC8qICAgICAgICAgICAgICAgLSBDUFUgSUQgKi8K
PiAgICAgICAgICB0ZXEgICByMTIsICMwCj4gICAgICAgICAgYmVxICAgc3RhcnRfeGVuICAgICAg
ICAgICAgICAvKiBhbmQgZGlzYXBwZWFyIGludG8gdGhlIGxhbmQgb2YgQyAqLwo+ICAgICAgICAg
IGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBlbnRy
eSBwb2ludCkgKi8KPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiBpbmRleCA0ZmU5MDRjNTFkLi4wNzUwMTM4NzhlIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMKPiArKysgYi94ZW4vYXJjaC9h
cm0vYXJtNjQvaGVhZC5TCj4gQEAgLTU4NCw3ICs1ODQsNiBAQCBsYXVuY2g6Cj4gIAo+ICAgICAg
ICAgIG1vdiAgIHgwLCB4MjAgICAgICAgICAgICAgICAgLyogTWFyc2hhbCBhcmdzOiAtIHBoeXNf
b2Zmc2V0ICovCj4gICAgICAgICAgbW92ICAgeDEsIHgyMSAgICAgICAgICAgICAgICAvKiAgICAg
ICAgICAgICAgIC0gRkRUICovCj4gLSAgICAgICAgbW92ICAgeDIsIHgyNCAgICAgICAgICAgICAg
ICAvKiAgICAgICAgICAgICAgIC0gQ1BVIElEICovCj4gICAgICAgICAgY2JueiAgeDIyLCAxZgo+
ICAgICAgICAgIGIgICAgIHN0YXJ0X3hlbiAgICAgICAgICAgICAgLyogYW5kIGRpc2FwcGVhciBp
bnRvIHRoZSBsYW5kIG9mIEMgKi8KPiAgMToKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3Nl
dHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IGluZGV4IGZhYWYwMjliOTkuLjJmNzE0ZDhi
MzcgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9h
cm0vc2V0dXAuYwo+IEBAIC03MzMsOCArNzMzLDcgQEAgc2l6ZV90IF9fcmVhZF9tb3N0bHkgZGNh
Y2hlX2xpbmVfYnl0ZXM7Cj4gIAo+ICAvKiBDIGVudHJ5IHBvaW50IGZvciBib290IENQVSAqLwo+
ICB2b2lkIF9faW5pdCBzdGFydF94ZW4odW5zaWduZWQgbG9uZyBib290X3BoeXNfb2Zmc2V0LAo+
IC0gICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBmZHRfcGFkZHIsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNwdWlkKQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgdW5zaWduZWQgbG9uZyBmZHRfcGFkZHIpCj4gIHsKPiAgICAgIHNpemVfdCBmZHRfc2l6
ZTsKPiAgICAgIGludCBjcHVzLCBpOwo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
