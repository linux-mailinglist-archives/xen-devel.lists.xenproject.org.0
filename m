Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F9284873
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 11:12:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHwI-0005tG-CI; Wed, 07 Aug 2019 09:08:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvHwH-0005tB-4v
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 09:08:57 +0000
X-Inumbo-ID: fb2e9a72-b8f2-11e9-8113-9fb1e6422674
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id fb2e9a72-b8f2-11e9-8113-9fb1e6422674;
 Wed, 07 Aug 2019 09:08:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 735D928;
 Wed,  7 Aug 2019 02:08:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 04D8D3F575;
 Wed,  7 Aug 2019 02:08:52 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061708420.2451@sstabellini-ThinkPad-T480s>
 <20190807002311.9906-6-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <887f853a-d715-b33e-8c76-4280cdbfbab1@arm.com>
Date: Wed, 7 Aug 2019 10:08:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807002311.9906-6-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 6/6] xen/arm: clarify the support status
 of iomem configurations
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, wei.liu2@citrix.com,
 konrad.wilk@oracle.com, andrew.cooper3@citrix.com, tim@xen.org,
 JBeulich@suse.com, ian.jackson@eu.citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwNy8wOC8yMDE5IDAxOjIzLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gaW9t
ZW0gc2V0dGluZ3MgZmFsbCB1bmRlciB0aGUgYnJvYWRlciBjYXRlZ29yeSBvZiAiTm9uLVBDSSBk
ZXZpY2UKPiBwYXNzdGhyb3VnaCI6IHRoZXkgYXJlIG5vdCBzZWN1cml0eSBzdXBwb3J0ZWQuIE1h
a2UgaXQgY2xlYXJlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0
ZWZhbm9zQHhpbGlueC5jb20+Cj4gQ0M6IHRpbUB4ZW4ub3JnCj4gQ0M6IGtvbnJhZC53aWxrQG9y
YWNsZS5jb20KPiBDQzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiBDQzog
SkJldWxpY2hAc3VzZS5jb20KPiBDQzogYW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbQo+IENDOiBp
YW4uamFja3NvbkBldS5jaXRyaXguY29tCj4gQ0M6IHdlaS5saXUyQGNpdHJpeC5jb20KPiAtLS0K
PiAgIFNVUFBPUlQubWQgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQK
PiBpbmRleCAzNzU0NzNhNDU2Li5iYzZmYjU4ZTA0IDEwMDY0NAo+IC0tLSBhL1NVUFBPUlQubWQK
PiArKysgYi9TVVBQT1JULm1kCj4gQEAgLTYzOSw3ICs2MzksNyBAQCB0byBiZSB1c2VkIGluIGFk
ZGl0aW9uIHRvIFFFTVUuCj4gICAKPiAgIAlTdGF0dXM6IEV4cGVyaW1lbnRhbAo+ICAgCj4gLSMj
IyBBUk0vTm9uLVBDSSBkZXZpY2UgcGFzc3Rocm91Z2gKPiArIyMjIEFSTS9Ob24tUENJIGRldmlj
ZSBwYXNzdGhyb3VnaCBhbmQgb3RoZXIgaW9tZW0gY29uZmlndXJhdGlvbnMKCkkgZG9uJ3QgdW5k
ZXJzdGFuZCB0aGUgbmV3IHRpdGxlLiBXaGF0IGFyZSB0aGUgb3RoZXIgdXNlIGNhc2Ugb2YgSU9N
RU0gCmNvbmZpZ3VyYXRpb25zPwoKQ2hlZXJzLAoKPiAgIAo+ICAgICAgIFN0YXR1czogU3VwcG9y
dGVkLCBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkCj4gICAKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
