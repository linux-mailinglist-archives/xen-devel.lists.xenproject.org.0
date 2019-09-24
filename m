Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A120FBCC83
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 18:33:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCnhb-0006x6-0D; Tue, 24 Sep 2019 16:30:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=y0Hj=XT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iCnhZ-0006wS-Ah
 for xen-devel@lists.xen.org; Tue, 24 Sep 2019 16:30:09 +0000
X-Inumbo-ID: 9272d9f0-dee8-11e9-9624-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 9272d9f0-dee8-11e9-9624-12813bfff9fa;
 Tue, 24 Sep 2019 16:30:08 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 69BBA20872;
 Tue, 24 Sep 2019 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569342607;
 bh=Oluvjc1hfQl9988/6EZGqVMs109NkXuBolJPEx72SRQ=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=z4t2oq3lMViufOv60TJhAnGC74qBl/BmX84vsE3/2NU+IDeRR07ObnUH9/smD/ccu
 EpNM00Pil2w9y1rvvY/bSgoBnzBCYnQthpVLgoUWZT5aanT8k2gwNbR8uL5rH7IKjA
 BgirHVP8mThwv1L2/sUiauDZmZIFoEAIFmUKE5wU=
Date: Tue, 24 Sep 2019 09:29:18 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <8dc9b6b1-7aa1-491e-9026-28a3a33eb8f1@arm.com>
Message-ID: <alpine.DEB.2.21.1909240929000.24909@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908201838370.20094@sstabellini-ThinkPad-T480s>
 <20190821035315.12812-2-sstabellini@kernel.org>
 <8dc9b6b1-7aa1-491e-9026-28a3a33eb8f1@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 2/8] xen/arm: export device_tree_get_reg
 and device_tree_get_u32
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

T24gVHVlLCAxMCBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDgv
MjEvMTkgNDo1MyBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gVGhleSdsbCBiZSB1
c2VkIGluIGxhdGVyIHBhdGNoZXMuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3RlZmFub3NAeGlsaW54LmNvbT4KPiA+IAo+ID4gLS0tCj4gPiBDaGFuZ2VzIGlu
IHY0Ogo+ID4gLSBuZXcgcGF0Y2gKPiA+IC0tLQo+ID4gICB4ZW4vYXJjaC9hcm0vYm9vdGZkdC5j
ICAgICAgICB8IDggKysrKy0tLS0KPiA+ICAgeGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgg
fCA2ICsrKysrKwo+IAo+IGRldmljZV90cmVlLmggaXMgYSBjb21tb24gaGVhZGVyIHRoYXQgZGVz
Y3JpYmUgYWxsIHRoZSBmdW5jdGlvbiBpbXBsZW1lbnRlZCBieQo+IGNvbW1vbi9kZXZpY2VfdHJl
ZS5jLgo+IAo+IE1vc3QgbGlrZWx5IHlvdSB3YW50IHRvIGRlY2xhcmUgdGhlIHByb3RvdHlwZSBp
biBhc20tYXJtL3NldHVwLmggYXMgdGhpcyBpcwo+IGRvbmUgZm9yIGFsbCB0aGUgb3RoZXJzIGZ1
bmN0aW9uIGV4cG9ydGVkIGluIGJvb3RmZHQuYy4KIApJJ2xsIGRvIHRoYXQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
