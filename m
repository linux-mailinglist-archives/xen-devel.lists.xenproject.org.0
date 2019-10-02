Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D03C456B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 03:21:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFTHU-0005An-LB; Wed, 02 Oct 2019 01:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7bij=X3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFTHT-0005Ag-6I
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 01:18:15 +0000
X-Inumbo-ID: 81d1f17e-e4b2-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 81d1f17e-e4b2-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 01:18:14 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EB4FE20818;
 Wed,  2 Oct 2019 01:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569979094;
 bh=vWwchyz3AoLgLbCBzPJ+Inu1Zie/AEObceweJ4tLq6s=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=f7OLss2Mue+0I0pjDTnGCTZRrHDytEQ1xHiyNCA1SIFF0p7oChmtntwoaY+lGkyvK
 59YHpftfyVSsdMyOJGcVHUH9Rd9AmPQblE7DFchV+7SsnMVYCYYV3y//Vr9jcheVje
 thzvl9brNFfdm5kctfCithD01efeXn8DSwclBCF8=
Date: Tue, 1 Oct 2019 18:18:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <20190815173258.20752-1-julien.grall@arm.com>
Message-ID: <alpine.DEB.2.21.1910011815450.26319@sstabellini-ThinkPad-T480s>
References: <20190815173258.20752-1-julien.grall@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: domain_build: Print the correct
 domain in initrd_load()
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

T24gVGh1LCAxNSBBdWcgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IGluaXRyZF9sb2FkKCkg
Y2FuIGJlIGNhbGxlZCBieSBvdGhlciBkb21haW4gdGhhbiBkb20wLiBUbyBhdm9pZAo+IGNvbmZ1
c2lvbiBpbiB0aGUgbG9nLCBwcmludCB0aGUgY29ycmVjdCBkb21haW4uCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClRoYW5rcyB0aGUgYnVn
IHdhcyByZWFsbHkgYW5ub3lpbmcuCgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxz
c3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gLS0tCj4gIHhlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94
ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMKPiBpbmRleCAxMjYzNzRmNjAzLi4zMzE3MTA4MWVh
IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9h
cmNoL2FybS9kb21haW5fYnVpbGQuYwo+IEBAIC0xODE4LDggKzE4MTgsOCBAQCBzdGF0aWMgdm9p
ZCBfX2luaXQgaW5pdHJkX2xvYWQoc3RydWN0IGtlcm5lbF9pbmZvICpraW5mbykKPiAgICAgIHBh
ZGRyID0gbW9kLT5zdGFydDsKPiAgICAgIGxlbiA9IG1vZC0+c2l6ZTsKPiAgCj4gLSAgICBwcmlu
dGsoIkxvYWRpbmcgZG9tMCBpbml0cmQgZnJvbSAlIlBSSXBhZGRyIiB0byAweCUiUFJJcGFkZHIi
LTB4JSJQUklwYWRkciJcbiIsCj4gLSAgICAgICAgICAgcGFkZHIsIGxvYWRfYWRkciwgbG9hZF9h
ZGRyICsgbGVuKTsKPiArICAgIHByaW50aygiTG9hZGluZyAlcGQgaW5pdHJkIGZyb20gJSJQUklw
YWRkciIgdG8gMHglIlBSSXBhZGRyIi0weCUiUFJJcGFkZHIiXG4iLAo+ICsgICAgICAgICAgIGtp
bmZvLT5kLCBwYWRkciwgbG9hZF9hZGRyLCBsb2FkX2FkZHIgKyBsZW4pOwo+ICAKPiAgICAgIC8q
IEZpeCB1cCBsaW51eCxpbml0cmQtc3RhcnQgYW5kIGxpbnV4LGluaXRyZC1lbmQgaW4gL2Nob3Nl
biAqLwo+ICAgICAgbm9kZSA9IGZkdF9wYXRoX29mZnNldChraW5mby0+ZmR0LCAiL2Nob3NlbiIp
Owo+IC0tIAo+IDIuMTEuMAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
