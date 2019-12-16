Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 185AB121E88
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 23:47:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igz5k-0008Mj-U4; Mon, 16 Dec 2019 22:43:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=swpo=2G=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1igz5j-0008Me-LZ
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 22:43:51 +0000
X-Inumbo-ID: 87aacaf6-2055-11ea-a914-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 87aacaf6-2055-11ea-a914-bc764e2007e4;
 Mon, 16 Dec 2019 22:43:51 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 57BF122464;
 Mon, 16 Dec 2019 22:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576536230;
 bh=TSI0fDs43PMbGag38DTWn1/1vBsR7lbZbPS3e4xTLDw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=r+1A+aElw1GuuaZvNlnxRTIZ7Uu8M2h1MMtSDwHAYk4y+s8wgSuHBqWSYqkVB/4Yh
 pJsFLrKwPy4s5z+sRZ2FrtsmWVfLYiIMYvMkiVV6wSVuW5fK5xPc98rh4Mnl6NmraL
 fcW7EwBHYCqVkdoaj94nFor9CwAhBdKfrerTDL/Q=
Date: Mon, 16 Dec 2019 14:43:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Roman Shaposhnik <roman@zededa.com>
In-Reply-To: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.1912161443370.13474@sstabellini-ThinkPad-T480s>
References: <CAMmSBy8Zh00tebTvz=__GDv478++b-2t4248YnkH0W9DVgqKbw@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] REGRESSION: Xen 4.13 RC5 fails to bootstrap Dom0 on
 ARM
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
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB0aGUgcmVwb3J0LCBJJ2xsIGdpdmUgaXQgYSBsb29rIQoKT24gTW9uLCAxNiBE
ZWMgMjAxOSwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBIaSEKPiAKPiBpdCBhcHBlYXJzIHRo
YXQgc29tZXRoaW5nIGhhcyBicm9rZW4gaW4gNC4xMyBSQzUgc28gdGhhdAo+IEknbSBub3cgZ2V0
dGluZyB0aGUgZm9sbG93aW5nIG9uIEFSTSAoZnVsbCBsb2dzIGFyZSBhdHRhY2hlZCkuCj4gCj4g
KFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+IChYRU4pIFBh
bmljIG9uIENQVSAwOgo+IChYRU4pIEZhaWxlZCB0byBhbGxvY2F0ZSByZXF1ZXN0ZWQgZG9tMCBt
ZW1vcnkuIDY3Mk1CIHVuYWxsb2NhdGVkCj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKgo+IAo+IE15IEdSVUIgYm9vdCBzZXF1ZW5jZSBoYXNuJ3QgY2hhbmdl
ZDoKPiAKPiB4ZW5faHlwZXJ2aXNvciAvYm9vdC94ZW4uZWZpIGNvbnNvbGU9ZHR1YXJ0ICAgZG9t
MF9tZW09MTAyNE0sbWF4OjEwMjRNCj4gZG9tMF9tYXhfdmNwdXM9MSBkb20wX3ZjcHVzX3Bpbgo+
IHhlbl9tb2R1bGUgL2Jvb3Qva2VybmVsIGNvbnNvbGU9aHZjMCByb290PShoZDEsZ3B0MSkvcm9v
dGZzLmltZyB0ZXh0Cj4gZGV2aWNldHJlZSAoaGQxLGdwdDQpL2V2ZS5kdGIKPiB4ZW5fbW9kdWxl
IChoZDEsZ3B0MSkvaW5pdHJkLmltZwo+IAo+IEluIGZhY3QsIGlmIEkgdXNlIFhlbiA0LjEyIGlu
c3RlYWQgb2YgNC4xMyAtLSBldmVyeXRoaW5nIHNlZW1zIHRvIHdvcmsKPiBhcyBpdCB1c2VkIHRv
Lgo+IAo+IFRoYW5rcywKPiBSb21hbi4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
