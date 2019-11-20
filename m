Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EF710466A
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 23:26:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXYNp-0005ty-8U; Wed, 20 Nov 2019 22:23:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iXYNo-0005tq-Ia
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 22:23:32 +0000
X-Inumbo-ID: 623d9743-0be4-11ea-a31d-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 623d9743-0be4-11ea-a31d-12813bfff9fa;
 Wed, 20 Nov 2019 22:23:32 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0629F20709;
 Wed, 20 Nov 2019 22:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574288611;
 bh=Yjj0aNgB8W7XQZ8KyZ+qMt5NXhc3i9hMldAzr3ygta0=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=03WhOt7O5mRD7/vb6aGZRmmsep6zt8s7CygYLoVno63LZZq7IPsmr0Zy6tqtwR3rX
 Kzrzg+xpszxu2ya59/LXnhdScJwJo5p6Kd+YGdCzeFdITZWZd17Np77HY4mpPqmk2P
 TaL/BR2DoKf+c7MOovR5v1gXIAqm8SgD2aqawKQE=
Date: Wed, 20 Nov 2019 14:23:30 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrii Anisov <andrii.anisov@gmail.com>
In-Reply-To: <3884e2f3-b523-01ac-e3c3-d6229a91d703@gmail.com>
Message-ID: <alpine.DEB.2.21.1911201421430.25834@sstabellini-ThinkPad-T480s>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-8-git-send-email-andrii.anisov@gmail.com>
 <alpine.DEB.2.21.1911111258060.2677@sstabellini-ThinkPad-T480s>
 <3884e2f3-b523-01ac-e3c3-d6229a91d703@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [RFC 7/7] arm/gic-v3: add GIC version suffix to
 iomem range variables
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 lars.kurth.xen@gmail.com, Andrii Anisov <andrii_anisov@epam.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 fusa-sig@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxNCBOb3YgMjAxOSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBTdGVmYW5v
LAo+IAo+IE9uIDExLjExLjE5IDIyOjU5LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gPiB0
aGlzIHNlZW1zIGEgdmVyeSBzZXJpb3VzIGNvbXBpbGVyIGJ1Zy4KPiAKPiBZZXAuCj4gCj4gPiBU
aGlzLCB0b2dldGhlciB3aXRoIHRoZSBvdGhlciBidWcgZGVzY3JpYmVkIGluIHRoZSBwcmV2aW91
cyBwYXRjaCwgbWFrZXMKPiA+IG1lIHRoaW5rIHRoZSBBUk1DQyBpcyBub3QgcXVpdGUgcmVhZHkg
Zm9yIHNob3d0aW1lLgo+IAo+IFlldCwgdGhpcyBwYXJ0aWN1bGFyIEFSTSBDb21waWxlciB2ZXJz
aW9uIGlzIHNhZmV0eSBjZXJ0aWZpZWQgYW5kIExUUy4KPiAKPiA+IERvIHlvdSBrbm93IGlmIHRo
ZXJlCj4gPiBhcmUgYW55IGxhdGVyIHZlcnNpb24gb2YgdGhlIGNvbXBpbGVyIHRoYXQgZG9uJ3Qg
aGF2ZSB0aGVzZSBwcm9ibGVtcz8KPiAKPiBJIGRvbid0IGtub3csIEFSTSBkaWQgbm90IHNheSBz
b21ldGhpbmcgc3BlY2lhbCBhYm91dCBpdC4gQXMgSSBrbm93LCB0aGUKPiByZWFzb24gdG8gdGFr
ZSB0aGlzIGNvbXBpbGVyIHZlcnNpb24gd2FzIHRoYXQgaXQgaXMgdGhlICJsYXRlc3QgYW5kIGdy
ZWF0ZXN0Igo+IHNhZmV0eSBjZXJ0aWZpZWQKPiAKPiA+IEkgd291bGQgaGF0ZSB0byBpbnRyb2R1
Y2UgdGhlc2Ugd29ya2Fyb3VuZHMKPiAKPiBJIGhhdGVkIGZpbmRpbmcgYW5kIHB1Ymxpc2hpbmcg
dGhlc2Ugd29ya2Fyb3VuZHMsIGJ1dCBoZXJlIHdlIGFyZS4KPiAKPiBUaGUgbWFpbiBxdWVzdGlv
biBoZXJlIGlzIGlmIFhFTiBuZWVkcyBhIHRhZyAiU3VwcG9ydCBzYWZldHkgY2VydGlmaWVkCj4g
Y29tcGlsZXIiIGJ5IHRoZSBjb3N0IG9mIGFjY2VwdGluZyBzdWNoIHdvcmthcm91bmRzLgo+IFRo
ZW4gZGlzY3VzcyBob3cgdG8gcmVkdWNlIHRoZWlyIHN0ZW5jaC4KCkJlZm9yZSB3ZSBnZXQgdG8g
dGhhdCBwb2ludCwgbWF5YmUgd2UgY2FuIHJhaXNlIHRoZSBpc3N1ZSB3aXRoIEFybSB1c2luZwpv
dXIgY29tYmluZWQgY2hhbm5lbHMuIEknbGwgcmFpc2UgaXQgaW50ZXJuYWxseSBhdCBYaWxpbngs
IGFuZCB3ZSBjb3VsZAphbHNvIGRpc2N1c3MgaXQgZHVyaW5nIG9uZSBvZiB0aGUgbmV4dCBGdVNh
IGNhbGxzIChsaXN0IGluIENDKS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
