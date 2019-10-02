Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4805BC4571
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:22:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTJR-0005za-OY; Wed, 02 Oct 2019 01:20:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTJQ-0005zL-05
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:20:16 +0000
X-Inumbo-ID: c9d13782-e4b2-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id c9d13782-e4b2-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 01:20:15 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF48E20818;
 Wed,  2 Oct 2019 01:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569979215;
 bh=vaHvUY4vyZAGWYTTKCMlO4yBpGPJVWClQV1xc4Suad4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=oP1JyYGOmLJV4D5bweWQa/eSfSsDg/9oKDrzq8eUcGZw/fXXdBYMGLSKKnAI2+5LX
 BvRk45u8PJxIpQ+oMFKye+rndLD38+Z840u7jyLCSB1hwaC0SfnAmYfrGBp/jxsDrX
 D+GZFcUQgaVxtngxzZXzoOxMxtdNsR1B3zMCyl8Y=
Date: Tue, 1 Oct 2019 18:20:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190815172944.14163-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011819480.26319@sstabellini-ThinkPad-T480s>
References: <20190815172944.14163-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: domain_build: Print the correct
 domain in dtb_load()
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

T24gVGh1LCAxNSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGR0Yl9sb2FkKCkgY2Fu
IGJlIGNhbGxlZCBieSBvdGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZCBjb25mdXNpb24K
PiBpbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+IC0tLQo+ICAgICBDaGFu
Z2VzIGluIHYyOgo+ICAgICAgICAgLSBGaXggdGhlIHNlY29uZCBwcmludCBpbiB0aGUgZnVuY3Rp
b24gYXMgd2VsbC4KPiAtLS0KPiAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgOCArKysr
Ky0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9h
cm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCA0ZTUxZTIyOTI3Li4xMjYzNzRmNjAzIDEwMDY0NAo+
IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYwo+IEBAIC0xNzg3LDE1ICsxNzg3LDE3IEBAIHN0YXRpYyB2b2lkIF9faW5p
dCBkdGJfbG9hZChzdHJ1Y3Qga2VybmVsX2luZm8gKmtpbmZvKQo+ICB7Cj4gICAgICB1bnNpZ25l
ZCBsb25nIGxlZnQ7Cj4gIAo+IC0gICAgcHJpbnRrKCJMb2FkaW5nIGRvbTAgRFRCIHRvIDB4JSJQ
UklwYWRkciItMHglIlBSSXBhZGRyIlxuIiwKPiAtICAgICAgICAgICBraW5mby0+ZHRiX3BhZGRy
LCBraW5mby0+ZHRiX3BhZGRyICsgZmR0X3RvdGFsc2l6ZShraW5mby0+ZmR0KSk7Cj4gKyAgICBw
cmludGsoIkxvYWRpbmcgJXBkIERUQiB0byAweCUiUFJJcGFkZHIiLTB4JSJQUklwYWRkciJcbiIs
Cj4gKyAgICAgICAgICAga2luZm8tPmQsIGtpbmZvLT5kdGJfcGFkZHIsCj4gKyAgICAgICAgICAg
a2luZm8tPmR0Yl9wYWRkciArIGZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOwo+ICAKPiAgICAg
IGxlZnQgPSBjb3B5X3RvX2d1ZXN0X3BoeXNfZmx1c2hfZGNhY2hlKGtpbmZvLT5kLCBraW5mby0+
ZHRiX3BhZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
a2luZm8tPmZkdCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZkdF90b3RhbHNpemUoa2luZm8tPmZkdCkpOwo+ICAKPiAgICAgIGlmICggbGVmdCAhPSAwICkK
PiAtICAgICAgICBwYW5pYygiVW5hYmxlIHRvIGNvcHkgdGhlIERUQiB0byBkb20wIG1lbW9yeSAo
bGVmdCA9ICVsdSBieXRlcylcbiIsIGxlZnQpOwo+ICsgICAgICAgIHBhbmljKCJVbmFibGUgdG8g
Y29weSB0aGUgRFRCIHRvICVwZCBtZW1vcnkgKGxlZnQgPSAlbHUgYnl0ZXMpXG4iLAo+ICsgICAg
ICAgICAgICAgIGtpbmZvLT5kLCBsZWZ0KTsKPiAgICAgIHhmcmVlKGtpbmZvLT5mZHQpOwo+ICB9
Cj4gIAo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
