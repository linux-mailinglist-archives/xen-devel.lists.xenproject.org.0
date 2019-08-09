Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BEB88124
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 19:27:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw8bu-0007HF-6D; Fri, 09 Aug 2019 17:23:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5OiB=WF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hw8bt-0007H8-38
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 17:23:25 +0000
X-Inumbo-ID: 6347063e-baca-11e9-b725-2b118ec5ec3d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6347063e-baca-11e9-b725-2b118ec5ec3d;
 Fri, 09 Aug 2019 17:23:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1003B15A2;
 Fri,  9 Aug 2019 10:23:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5C32E3F575;
 Fri,  9 Aug 2019 10:23:21 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-5-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <412429d5-e0b2-89ec-4f31-9195e8f2721f@arm.com>
Date: Fri, 9 Aug 2019 18:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-5-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 5/6] libxl/xl: add memory policy option
 to iomem
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDA3LzA4LzIwMTkgMDE6MjMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBZGQgYSBuZXcgbWVtb3J5IHBvbGljeSBvcHRpb24gZm9yIHRoZSBpb21lbSBwYXJhbWV0
ZXIuCj4gUG9zc2libGUgdmFsdWVzIGFyZToKPiAtIGFybV9kZXZfbkduUkUsIERldmljZS1uR25S
RSwgdGhlIGRlZmF1bHQgb24gQXJtCj4gLSBhcm1fbWVtX1dCLCBXQiBjYWNoYWJsZSBtZW1vcnkK
PiAtIGRlZmF1bHQKPiAKPiBTdG9yZSB0aGUgcGFyYW1ldGVyIGluIGEgbmV3IGZpZWxkIGluIGxp
YnhsX2lvbWVtX3JhbmdlLgo+IAo+IFBhc3MgdGhlIG1lbW9yeSBwb2xpY3kgb3B0aW9uIHRvIHhj
X2RvbWFpbl9tZW1fbWFwX3BvbGljeS4KPiAKPiBEbyB0aGUgbGlieGwgdG8gbGlieGMgdmFsdWUg
Y29udmVyc2lvbiBpbiBwZXItYXJjaCBmdW5jdGlvbnMgc28gdGhhdCB3ZQo+IGNhbiByZXR1cm4g
ZXJyb3IgZm9yIHg4NiBwYXJhbWV0ZXJzIG9uIEFybSBhcmNoaXRlY3R1cmVzIGFuZCB2aWNlIHZl
cnNhLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3RlZmFub3NAeGls
aW54LmNvbT4KCkZvciB0aGUgQXJtIGJpdHMgaW4gdGhlIGRvYzoKCkFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
