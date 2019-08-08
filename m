Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269D486A74
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 21:18:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvntQ-0002YG-GR; Thu, 08 Aug 2019 19:16:08 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lyhG=WE=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hvntO-0002Y3-TA
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 19:16:06 +0000
X-Inumbo-ID: f7db2101-ba10-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f7db2101-ba10-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 19:16:05 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C55DE214C6;
 Thu,  8 Aug 2019 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565291765;
 bh=j93Pu1Wd9sfXmWOm40XZRZqSCR3g+tIybstNC5jErmA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=fw3uNp+5GgLdzi5BIMJz5zpWZDPIV8qGGTqZG7OuPxJ0oMnaHf+NoVyx74PnOpHcz
 yxpXT9+xd038YsoAwT7SKTbGR7r/WHjw7RQQEV3rgIODEuiehBm5U/Y7M3RTeIIWlP
 Vsh25h5P4pjeMYBIAu++oOYdX4/ek3YmwkYa7vss=
Date: Thu, 8 Aug 2019 12:16:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87r25vh3qy.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1908081215230.22196@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <87r25vh3qy.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 0/7] reserved-memory in dom0
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA4IEF1ZyAyMDE5LCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBIaSBTdGVmYW5v
LAo+IAo+IFN0ZWZhbm8gU3RhYmVsbGluaSB3cml0ZXM6Cj4gCj4gPiBIaSBhbGwsCj4gPgo+IAo+
IExvb2tzIGxpa2UgeW91IGFyZSBub3QgdXNpbmcgYWRkX21haW50YWluZXIucGwgb3IgeW91ciBN
QUlOVEFJTkVSUyBmaWxlCj4gaXMgb3V0IG9mIGRhdGUuIEluIGFueSBjYXNlIEknbSBub3QgZ2V0
dGluZyBDQydlZCBhbmQgSSdtIG1pc3NpbmcgeW91cgo+IGUtbWFpbHMuCj4gCj4gU28gaXQgd291
bGQgYmUgY29vbCBpZiB5b3UnbGwgQ0MgbWUgaWYgeW91IHdhbnQgbWUgdG8gcmV2aWV3IHlvdXIK
PiBwYXRjaGVzLgoKWWVzLCBzb3JyeS4gSSBub3RpY2VkIHRoZSBpc3N1ZSBhZnRlciBzZW5kaW5n
IHRoaXMgc2VyaWVzLiBJJ2xsIG1ha2UKc3VyZSB0byBhZGQgeW91IHRvIHRoZSBuZXh0IG9uZXMu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
