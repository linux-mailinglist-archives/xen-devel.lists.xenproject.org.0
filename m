Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BA59229C
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 13:41:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzfzR-0001Zt-8p; Mon, 19 Aug 2019 11:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzfzP-0001Zo-VR
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 11:38:19 +0000
X-Inumbo-ID: d6dbe8a0-c275-11e9-8bec-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d6dbe8a0-c275-11e9-8bec-12813bfff9fa;
 Mon, 19 Aug 2019 11:38:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1130E28;
 Mon, 19 Aug 2019 04:38:18 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF6B23F246;
 Mon, 19 Aug 2019 04:38:16 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
References: <20190816130013.31154-1-hch@lst.de>
 <20190816130013.31154-5-hch@lst.de>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <316d2032-334d-9a4c-7512-79bec5f0bc56@arm.com>
Date: Mon, 19 Aug 2019 12:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816130013.31154-5-hch@lst.de>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 04/11] xen/arm: remove xen_dma_ops
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
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQ2hyaXN0b3BoLAoKT24gOC8xNi8xOSAyOjAwIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBhcm0gYW5kIGFybTY0IGNhbiBqdXN0IHVzZSB4ZW5fc3dpb3RsYl9kbWFfb3BzIGRpcmVj
dGx5IGxpa2UgeDg2LCBubwo+IG5lZWQgZm9yIGEgcG9pbnRlciBpbmRpcmVjdGlvbi4KPiAKPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KClJldmlld2VkLWJ5
OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
