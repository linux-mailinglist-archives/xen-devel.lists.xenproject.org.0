Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD40BE267
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 18:22:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDA10-0006po-Eu; Wed, 25 Sep 2019 16:19:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Cfsh=XU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iDA0y-0006pj-FO
 for xen-devel@lists.xen.org; Wed, 25 Sep 2019 16:19:40 +0000
X-Inumbo-ID: 462b0cc0-dfb0-11e9-97fb-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 462b0cc0-dfb0-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 16:19:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EFEE221D79;
 Wed, 25 Sep 2019 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569428379;
 bh=8IuXtvbRkHKGfDfZ2GjyKj3RUDyro6kS5X1xfMutmpY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=n50b0MrdmaRVS+v6zWl06yyDv/cAVjUi9MIbFNmE9GyBYiMT1fI2d6TRgE+01wrhR
 Ws0YwU+9CeIiXUMkPc9vbXkUYMKhJIXLgJDnRDFcaDAYGjJaR0FpSgxPLX8E45VUh3
 tp+JzQlF07a9My+JXYkT/rdq44I9etpXqk9lnSnU=
Date: Wed, 25 Sep 2019 09:19:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <42927fa9-81ef-37ba-6de1-175e4414f5e9@arm.com>
Message-ID: <alpine.DEB.2.21.1909250919290.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-8-sstabellini@kernel.org>
 <1879bd44-0107-5799-cacc-6cb2ee31b8b9@arm.com>
 <alpine.DEB.2.21.1909241105071.24909@sstabellini-ThinkPad-T480s>
 <42927fa9-81ef-37ba-6de1-175e4414f5e9@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 8/8] xen/arm: add dom0-less device
 assignment info to docs
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
Cc: Stefano Stabellini <stefanos@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>, andrii_anisov@epam.com,
 Achin.Gupta@arm.com, xen-devel@lists.xen.org, Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyNSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDI0LzA5LzIwMTkg
MTk6MDcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdlZCwgMTEgU2VwIDIwMTks
IEp1bGllbiBHcmFsbCB3cm90ZToKPiA+ID4gT24gOC8yMS8xOSA0OjUzIEFNLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6Cj4gPiBJIGNhbiByZXBsYWNlIDB4WCBieSBYIGZvciAjYWRkcmVzcy1j
ZWxscyBhbmQgI3NpemUtY2VsbHMgZXZlcnl3aGVyZSBpbgo+ID4gdGhlIGV4YW1wbGUuIEkgZG9u
J3QgdGhpbmsgaXQgbWFrZXMgc2Vuc2UgdG8gZG8gaXQgZm9yIHJlZyBhbmQKPiA+IGludGVycnVw
dHMgcHJvcGVydGllcz8KPiAKPiBJIGFncmVlIGl0IGRvZXMgbm90IG1ha2Ugc2Vuc2UgZm9yIHRo
ZSBwcm9wZXJ0eSByZWcuIEhvd2V2ZXIsIGZvciAiaW50ZXJydXB0cyIKPiBwcm9wZXJ0eSBpdCB3
b3VsZCBhcyBpdCBtYWtlcyBlYXNpZXIgdG8gZmluZCBvdXQgdGhlIGludGVycnVwdCBudW1iZXIu
IExvb2tpbmcKPiBhdCBleGFtcGxlIGluIHRoZSBiaW5kaW5ncyB0aGV5IGFjdHVhbGx5IHVzZSBk
ZWNpbWFsIG51bWJlciBmb3IgdGhlIGZpcnN0IHR3bwo+IGNlbGxzIGFuZCB0aGVuIGFuIGhleGFk
ZWNpbWFsOgo+IAo+ICAgICAgIGludGVycnVwdHMgPSA8MSA4IDB4ZjA0PjsKCkkgY2FuIGRvIHRo
YXQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
