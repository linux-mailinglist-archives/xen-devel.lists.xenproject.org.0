Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D23110648
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2019 11:26:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLlRW-0005dk-VO; Wed, 01 May 2019 09:22:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q/fo=TB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hLlRV-0005df-V2
 for xen-devel@lists.xenproject.org; Wed, 01 May 2019 09:22:21 +0000
X-Inumbo-ID: 9ecd569d-6bf2-11e9-843c-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9ecd569d-6bf2-11e9-843c-bc764e045a96;
 Wed, 01 May 2019 09:22:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0AC42A78;
 Wed,  1 May 2019 02:22:20 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 125FF3F719;
 Wed,  1 May 2019 02:22:18 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c2e2e752-ae93-f378-2f84-2f9833b13c32@arm.com>
Date: Wed, 1 May 2019 10:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-2-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 02/10] xen: rename un/map_mmio_regions to
 un/map_regions
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, JBeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAzMC8wNC8yMDE5IDIyOjAyLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gTm93
IHRoYXQgbWFwX21taW9fcmVnaW9ucyB0YWtlcyBhIHAybXQgcGFyYW1ldGVyLCB0aGVyZSBpcyBu
byBuZWVkIHRvCj4ga2VlcCAibW1pbyIgaW4gdGhlIG5hbWUuIFRoZSBwMm10IHBhcmFtZXRlciBk
b2VzIGEgYmV0dGVyIGpvYiBhdAo+IGV4cHJlc3Npbmcgd2hhdCB0aGUgbWFwcGluZyBpcyBhYm91
dC4gTGV0J3Mgc2F2ZSB0aGUgZW52aXJvbm1lbnQgNQo+IGNoYXJhY3RlcnMgYXQgYSB0aW1lLgoK
QXQgbGVhc3Qgb24gQXJtLCB3aGF0J3MgdGhlIGRpZmZlcmVuY2Ugd2l0aCBndWVzdF9waHlzbWFw
X2FkZF9lbnRyeSBhbmQgdGhpcyAKZnVuY3Rpb24gbm93PyBPbiB4ODYsIGhvdyBkb2VzIHRoZSB1
c2VyIG5vdyB3aGljaCBmdW5jdGlvbiB0byB1c2U/CgpXaGF0IGFjdHVhbGx5IHRlbGwgdGhlIHVz
ZXJzIGl0IHNob3VsZCBub3QgdXNlIHRoaXMgZnVuY3Rpb24gZm9yIFJBTT8KCkNoZWVycywKCi0t
IApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
