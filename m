Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B296B49319
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2019 23:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hcz78-0005mq-1N; Mon, 17 Jun 2019 21:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7cdP=UQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hcz75-0005ml-WA
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2019 21:24:28 +0000
X-Inumbo-ID: 48b16736-9146-11e9-9b55-eb3c55157976
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48b16736-9146-11e9-9b55-eb3c55157976;
 Mon, 17 Jun 2019 21:24:26 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D8670206B7;
 Mon, 17 Jun 2019 21:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560806666;
 bh=iJnCeaoSPL3DsdwaH/0f98qViDOWLN48bfo9VJBHJFU=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1HHylDjjOoKb5/JbJJWnFK5NJlOZrIavZmOesybPnU+F/GHY6XFbQGmykjIqFTgjr
 B0S8Lk/iguqTXoC+YfuSKkwkDIP1k2GhoqrJaKgD8JGgp2Vetw7reH97J0uS7Y/ZSr
 LL3qV5w5/1NqXsphenaxVfj2iDue3YmxuGz8JAiU=
Date: Mon, 17 Jun 2019 14:24:25 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
Message-ID: <alpine.DEB.2.21.1906171423230.2072@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
 <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
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
 andrew.cooper3@citrix.com, JBeulich@suse.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCj4gCj4gT24gMzAv
MDQvMjAxOSAyMjowMiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gTm93IHRoYXQgbWFw
X21taW9fcmVnaW9ucyB0YWtlcyBhIHAybXQgcGFyYW1ldGVyLCB0aGVyZSBpcyBubyBuZWVkIHRv
Cj4gPiBrZWVwICJtbWlvIiBpbiB0aGUgbmFtZS4gVGhlIHAybXQgcGFyYW1ldGVyIGRvZXMgYSBi
ZXR0ZXIgam9iIGF0Cj4gPiBleHByZXNzaW5nIHdoYXQgdGhlIG1hcHBpbmcgaXMgYWJvdXQuIExl
dCdzIHNhdmUgdGhlIGVudmlyb25tZW50IDUKPiA+IGNoYXJhY3RlcnMgYXQgYSB0aW1lLgo+IAo+
IEF0IGxlYXN0IG9uIEFybSwgd2hhdCdzIHRoZSBkaWZmZXJlbmNlIHdpdGggZ3Vlc3RfcGh5c21h
cF9hZGRfZW50cnkgYW5kIHRoaXMKPiBmdW5jdGlvbiBub3c/IE9uIHg4NiwgaG93IGRvZXMgdGhl
IHVzZXIgbm93IHdoaWNoIGZ1bmN0aW9uIHRvIHVzZT8KPiAKPiBXaGF0IGFjdHVhbGx5IHRlbGwg
dGhlIHVzZXJzIGl0IHNob3VsZCBub3QgdXNlIHRoaXMgZnVuY3Rpb24gZm9yIFJBTT8KCkFsc28g
dGFraW5nIGludG8gYWNjb3VudCBKYW4ncyBjb21tZW50cywgSSdsbCBkcm9wIHRoaXMgcGF0Y2gg
aW4gdGhlCm5leHQgdmVyc2lvbiwga2VlcGluZyB0aGUgb3JpZ2luYWwgbmFtZSBtYXBfbW1pb19y
ZWdpb25zLiBJZiB5b3UgaGF2ZSBhbgphbHRlcm5hdGl2ZSBzdWdnZXN0aW9uIGxldCBtZSBrbm93
IGFuZCBJJ2xsIHRyeSB0byBmb2xsb3cgaXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
