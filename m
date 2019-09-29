Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 273A9C1421
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 11:50:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEVol-0007UJ-Ti; Sun, 29 Sep 2019 09:48:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kiTL=XY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iEVok-0007U9-QN
 for xen-devel@lists.xen.org; Sun, 29 Sep 2019 09:48:38 +0000
X-Inumbo-ID: 4f24af34-e29e-11e9-96b0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 4f24af34-e29e-11e9-96b0-12813bfff9fa;
 Sun, 29 Sep 2019 09:48:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1621928;
 Sun, 29 Sep 2019 02:48:37 -0700 (PDT)
Received: from [10.37.8.142] (unknown [10.37.8.142])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E9F3B3F534;
 Sun, 29 Sep 2019 02:48:35 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1909261608430.2594@sstabellini-ThinkPad-T480s>
 <20190926231144.16297-7-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ef8bf0d0-b0cb-42e7-d4b4-1bcfd205dd17@arm.com>
Date: Sun, 29 Sep 2019 10:48:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190926231144.16297-7-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/8] xen/arm: introduce nr_spis
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
Cc: Volodymyr_Babchuk@epam.com, Achin.Gupta@arm.com, andrii_anisov@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>, xen-devel@lists.xen.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDkvMjcvMTkgMTI6MTEgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBXZSBkb24ndCBoYXZlIGEgY2xlYXIgd2F5IHRvIGtub3cgaG93IG1hbnkgdmlydHVhbCBT
UElzIHdlIG5lZWQgZm9yIHRoZQo+IGRvbTAtbGVzcyBkb21haW5zLiBJbnRyb2R1Y2UgYSBuZXcg
b3B0aW9uIHVuZGVyIHhlbixkb21haW4gdG8gc3BlY2lmeQo+IHRoZSBudW1iZXIgb2YgU1BJcyB0
byBhbGxvY2F0ZSBmb3IgYSBkb21haW4uCj4gCj4gVGhlIHByb3BlcnR5IGlzIG9wdGlvbmFsLiBX
aGVuIGFic2VudCwgd2UnbGwgdXNlIHRoZSBwaHlzaWNhbCBudW1iZXIgb2YKPiBHSUMgbGluZXMg
Zm9yIGRvbTAtbGVzcyBkb21haW5zLCBvciBHVUVTVF9WUEwwMTFfU1BJKzEgaWYgdnBsMDExIGlz
Cj4gcmVxdWVzdGVkLCB3aGljaGV2ZXIgaXMgZ3JlYXRlci4KPiAKPiBSZW1vdmUgdGhlIG9sZCBz
ZXR0aW5nIG9mIG5yX3NwaXMgYmFzZWQgb24gdGhlIHByZXNlbmNlIG9mIHRoZSB2cGwwMTEuCj4g
Cj4gVGhlIGltcGxpY2F0aW9uIG9mIHRoaXMgY2hhbmdlIGlzIHRoYXQgd2l0aG91dCBucl9zcGlz
IGRvbTBsZXNzIGRvbWFpbnMKPiBnZXQgdGhlIHNhbWUgYW1vdW50IG9mIFNQSSBhbGxvY2F0ZWQg
YXMgZG9tMCwgcmVnYXJkbGVzcyBvZiBob3cgbWFueQo+IHBoeXNpY2FsIGRldmljZXMgdGhleSBo
YXZlIGFzc2lnbmVkLCBhbmQgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHRoZXkgaGF2ZQo+IGEgdmly
dHVhbCBwbDAxMSAod2hpY2ggYWxzbyBuZWVkcyBhbiBlbXVsYXRlZCBTUEkpLiBUaGlzIGlzIGRv
bmUgYmVjYXVzZQo+IHRoZSBTUElzIGFsbG9jYXRpb24gbmVlZHMgdG8gYmUgZG9uZSBiZWZvcmUg
cGFyc2luZyBhbnkgcGFzc3Rocm91Z2gKPiBpbmZvcm1hdGlvbiwgc28gd2UgaGF2ZSB0byBhY2Nv
dW50IGZvciBhbnkgcG90ZW50aWFsIHBoeXNpY2FsIFNQSQo+IGFzc2lnbmVkIHRvIHRoZSBkb21h
aW4uCj4gCj4gV2hlbiBucl9zcGlzIGlzIHByZXNlbnQsIHRoZSBkb21haW4gZ2V0cyBleGFjdGx5
IG5yX3NwaXMgYWxsb2NhdGVkIFNQSXMuCj4gSWYgdGhlIG51bWJlciBpcyB0b28gbG93LCBpdCBt
aWdodCBub3QgYmUgZW5vdWdoIGZvciB0aGUgZGV2aWNlcwo+IGFzc2lnbmVkIGl0IHRvIGl0LiBJ
ZiB0aGUgbnVtYmVyIGlzIGxlc3MgdGhhbiBHVUVTVF9WUEwwMTFfU1BJLCB0aGUKPiB2aXJ0dWFs
IHBsMDExIHdvbid0IHdvcmsuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IFJldmlld2VkLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8
dm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxp
ZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
