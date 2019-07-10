Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0077E64D70
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 22:19:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlJ1l-0000sy-Sj; Wed, 10 Jul 2019 20:17:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FlFr=VH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hlJ1j-0000si-SZ
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 20:17:19 +0000
X-Inumbo-ID: b6f4fd45-a34f-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b6f4fd45-a34f-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 20:17:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 004742064A;
 Wed, 10 Jul 2019 20:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562789837;
 bh=I9tR9Lxt1Q7I2YFFgCPugcYVY+syKhmUhgEcMdoMcfg=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=x06cpt6sMpQ2m4BVqTYaKBEhFWTcbkbujX4K80jnjEd+7vUaRsoR22VdUe0heJZA3
 M+mkMcZ3gxEqXiXk5Lg+ClwZM8L+grP7lAv4c0W/CbUwV1W+Lgkg2eUrhqe7swAxx1
 7INlvqbi9oli6N3vTGrUrGkcdPrIuvMQ7njAvsMU=
Date: Wed, 10 Jul 2019 15:17:16 -0500 (CDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Denis Obrezkov <denisobrezkov@gmail.com>
In-Reply-To: <23ac4d9b-8cbe-7c43-5c28-30b2e7cbbdeb@gmail.com>
Message-ID: <alpine.DEB.2.21.1907101512230.12168@sstabellini-ThinkPad-T480s>
References: <25386cfa-d0b7-83fe-4d87-5af3459d54bd@gmail.com>
 <alpine.DEB.2.21.1907101447440.12168@sstabellini-ThinkPad-T480s>
 <23ac4d9b-8cbe-7c43-5c28-30b2e7cbbdeb@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [GSoC-2019] About the crossbar and xen
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>, Iain Hunter <drhunter95@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMCBKdWwgMjAxOSwgRGVuaXMgT2JyZXprb3Ygd3JvdGU6Cj4gSGksCj4gCj4gT24g
Ny8xMC8xOSA5OjQ5IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gCj4gPiAKPiA+ICAg
cGhhbmRsZSA9IDwweDAwMDAwMDAyPjsKPiA+IAo+ID4gSSB0aGluayB0aGF0IG1lYW5zIHRoYXQg
aW50ZXJydXB0cyBnbyB0byB0aGUgR0lDIHZpYSBDcm9zc2JhcjsgaS5lLiB0aGUKPiA+IHBhcmVu
dCBpbnRlcnJ1cHQgY29udHJvbGxlciBvZiBDcm9zc2JhciBpcyB0aGUgR0lDLgo+ID4gCj4gQnV0
IHRoZSBjcm9zc2JhcidzIGludGVycnVwdC1wYXJlbnQgbm9kZSBpcyAweDAwMDAwMDA4IGFuZCBw
aGFuZGxlIHZhbHVlCj4gMHgwMDAwMDAwOCBiZWxvbmdzIHRvCj4gaW50ZXJydXB0LWNvbnRyb2xs
ZXJANDgyODEwMDAgewo+IAkJY29tcGF0aWJsZSA9ICJ0aSxvbWFwNS13dWdlbi1tcHUiLCAidGks
b21hcDQtd3VnZW4tbXB1IjsKPiAKPiBGb3IgbWUgaXQgbG9va3MgbGlrZSBpbnRlcnJ1cHRzIGZy
b20gY3Jvc3NiYXIgZ29lcyB0byB3dWdlbiBhbmQgdGhlIGZyb20KPiB3dWdlbiB0byBHSUMuIEJ1
dCBJIGRvbid0IHF1aXRlIHVuZGVyc3RhbmQgaXQuCgpIaSBEZW5pcywKCkkgb25seSByZWFkIHlv
dXIgZW1haWwgYW5kIGdvdCBhIHBhcnRpYWwgcGljdHVyZS4gSSByZWFkIHRoZSBmdWxsIGRldmlj
ZQp0cmVlIG5vdyBhbmQgdGhlIGhpZXJhcmNoeSBpcyBhcyBmb2xsb3c6CgotIGNyb3NzYmFyIHJv
dXRlcyB0byBwaGFuZGxlIDgKLSBwaGFuZGxlIDggaXMgb21hcDUtd3VnZW4tbXB1IGFuZCByb3V0
ZXMgdG8gcGhhbmRsZSAyCi0gcGhhbmRsZSAyIGlzIHRoZSBHSUMKClNvOgoKY3Jvc3NiYXIgLT4g
b21hcDUtd3VnZW4tbXB1IC0+IEdJQwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
