Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C8FB1342
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 19:09:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8SXz-00029H-CT; Thu, 12 Sep 2019 17:06:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nRXx=XH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1i8SXx-000298-HJ
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 17:06:17 +0000
X-Inumbo-ID: a192a89c-d57f-11e9-b299-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a192a89c-d57f-11e9-b299-bc764e2007e4;
 Thu, 12 Sep 2019 17:06:16 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D4AB20644;
 Thu, 12 Sep 2019 17:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568307975;
 bh=dkn8+hcnZ0wCUPvQdoaMRtsVWnE7Ob402ZOQff0mz+g=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=1Cq9wOxoZPhH4QM0BupPeic3jR1vNhKxA6f/o73aVgDMGNSplbtrTf4ZpyREEKgID
 3BcwXDQg/mhCJNlBSE1bKag3ogxF/dmTHwOC1j+hL41owHTXEf46+Mbj9OnClpLurt
 qgbeRNvoX7rM9dQpaQJ9A4ECuRi19Sa8Bo8RHnjU=
Date: Thu, 12 Sep 2019 10:06:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87sgp2g2zd.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1909121006060.6288@sstabellini-ThinkPad-T480s>
References: <20190911153134.20402-1-julien.grall@arm.com>
 <87sgp2g2zd.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: setup: Relocate the Device-Tree
 later on in the boot
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
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAxMSBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSGkgSnVsaWVu
LAo+IAo+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4gCj4gPiBBdCB0aGUgbW9tZW50LCB0aGUgRGV2
aWNlLVRyZWUgaXMgcmVsb2NhdGVkIGludG8geGVuaGVhcCB3aGlsZSBzZXR0aW5nCj4gPiB1cCB0
aGUgbWVtb3J5IHN1YnN5c3RlbS4gVGhpcyBpcyBhY3R1YWxseSBub3QgbmVjZXNzYXJ5IGJlY2F1
c2UgdGhlCj4gPiBlYXJseSBtYXBwaW5nIGlzIHN0aWxsIHByZXNlbnQgYW5kIHdlIGRvbid0IHJl
cXVpcmUgdGhlIHZpcnR1YWwgYWRkcmVzcwo+ID4gdG8gYmUgc3RhYmxlIHVudGlsIHVuZmxhdHRp
bmcgdGhlIERldmljZS1UcmVlLgo+ID4KPiA+IFNvIHRoZSByZWxvY2F0aW9uIGNhbiBzYWZlbHkg
YmUgbW92ZWQgYWZ0ZXIgdGhlIG1lbW9yeSBzdWJzeXN0ZW0gaXMKPiA+IGZ1bGx5IHNldHVwLiBU
aGlzIGhhcyB0aGUgbmljZSBhZHZhbnRhZ2UgdG8gbWFrZSB0aGUgcmVsb2NhdGlvbiBjb21tb24K
PiA+IGFuZCBsZXQgdGhlIHhlbmhlYXAgYWxsb2NhdG9yIGRlY2lkZXMgd2hlcmUgdG8gcHV0IGl0
Lgo+ID4KPiA+IExhc3RseSwgdGhlIGRldmljZS10cmVlIGlzIG5vdCBnb2luZyB0byBiZSB1c2Vk
IGZvciBBQ1BJIHN5c3RlbS4gU28KPiA+IHRoZXJlIGFyZSBubyBuZWVkIHRvIHJlbG9jYXRlIGl0
IGFuZCBjYW4ganVzdCBiZSBkaXNjYXJkZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogVm9sb2R5bXlyIEJh
YmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKQWNrZWQtYnk6IFN0ZWZhbm8gU3Rh
YmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
