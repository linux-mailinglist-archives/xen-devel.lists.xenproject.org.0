Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247E1D132C
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 17:43:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIE4x-000759-FV; Wed, 09 Oct 2019 15:40:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8w+b=YC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iIE4v-000754-Cs
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 15:40:41 +0000
X-Inumbo-ID: 25a5fee6-eaab-11e9-97f2-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 25a5fee6-eaab-11e9-97f2-12813bfff9fa;
 Wed, 09 Oct 2019 15:40:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 228A0337;
 Wed,  9 Oct 2019 08:40:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156963F6C4;
 Wed,  9 Oct 2019 08:40:38 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?=
 <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <1569839671-772-1-git-send-email-olekstysh@gmail.com>
 <49a1c980-6e2c-5dcf-f17e-64b6432a8ea3@suse.com>
 <17cf0fd0-8a54-41fe-9372-e52e9e7cbb4d@gmail.com>
 <99817215-4bec-0b44-d0f2-1691f533f842@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1e0af385-5d59-bccc-b954-d70f6aca3f3a@arm.com>
Date: Wed, 9 Oct 2019 16:40:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <99817215-4bec-0b44-d0f2-1691f533f842@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for Xen 4.13] iommu/arm: Remove
 arch_iommu_populate_page_table() completely
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
 paul.durrant@citrix.com, volodymyr_babchuk@epam.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAwOC8xMC8yMDE5IDE4OjIxLCBPbGVrc2FuZHIgd3JvdGU6Cj4gCj4gSGksIGFsbAoKSGks
Cgo+IAo+IEdlbnRsZSByZW1pbmRlci4uLgoKU29ycnkgdGhpcyBmZWxsIHRocm91Z2ggdGhlIGNy
YWNrcy4gSSBoYXZlIG5vdyBjb21taXR0ZWQgaXQuCgpDaGVlcnMsCgo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
