Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71883AED19
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 16:33:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7hBb-0006yN-MN; Tue, 10 Sep 2019 14:32:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7hBa-0006yB-4F
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 14:32:02 +0000
X-Inumbo-ID: bf74931b-d3d7-11e9-ac1f-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id bf74931b-d3d7-11e9-ac1f-12813bfff9fa;
 Tue, 10 Sep 2019 14:31:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6257F28;
 Tue, 10 Sep 2019 07:31:59 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E80983F71F;
 Tue, 10 Sep 2019 07:31:57 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-9-git-send-email-olekstysh@gmail.com>
 <2b1d815c-720d-46c1-04de-0b8eb627b22f@arm.com>
 <1f14d80f-9110-9bf1-42ba-87168896c05c@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0c39fe9f-2e3b-2119-4542-dcf5922be701@arm.com>
Date: Tue, 10 Sep 2019 15:31:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1f14d80f-9110-9bf1-42ba-87168896c05c@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 8/8] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzEwLzE5IDEyOjA0IFBNLCBPbGVrc2FuZHIgd3JvdGU6Cj4gT24gMTAuMDkuMTkg
MDA6MjQsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+IMKgwqDCoMKgwqAgLS0taGVscC0tLQo+Pj4g
wqDCoMKgwqDCoCBFbmFibGUgYWxsIHRoZSByZXF1aXJlZCBkcml2ZXJzIGZvciBSZW5lc2FzIFJD
YXIzCj4+PiDCoCBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZyAK
Pj4+IGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvS2NvbmZpZwo+Pj4gaW5kZXggYTNjMDY0OS4u
NDdlYWRiNCAxMDA2NDQKPj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcK
Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL0tjb25maWcKPj4+IEBAIC0xMiw0ICsx
MiwxNyBAQCBjb25maWcgQVJNX1NNTVUKPj4+IMKgIMKgwqDCoMKgwqDCoMKgIFNheSBZIGhlcmUg
aWYgeW91ciBTb0MgaW5jbHVkZXMgYW4gSU9NTVUgZGV2aWNlIAo+Pj4gaW1wbGVtZW50aW5nIHRo
ZQo+Pj4gwqDCoMKgwqDCoMKgwqAgQVJNIFNNTVUgYXJjaGl0ZWN0dXJlLgo+Pj4gKwo+Pj4gK2Nv
bmZpZyBJUE1NVV9WTVNBCj4+PiArwqDCoMKgIGJvb2wgIlJlbmVzYXMgSVBNTVUtVk1TQSBmb3Vu
ZCBpbiBSLUNhciBHZW4zIFNvQ3MiCj4gCj4gU2hhbGwgSSBhZGQgRVhQRVJUIGhlcmUgYWxzbz8K
Ckdvb2QgcXVlc3Rpb24uIFByb2JhYmx5LCBidXQgdGhlbiBJIGFtIHdvbmRlcmluZyBpZiB0aGUg
RVhQRVJUID0gInkiIAp3b3VsZCBhY3R1YWxseSBiZSBzdWZmaWNpZW50LgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
