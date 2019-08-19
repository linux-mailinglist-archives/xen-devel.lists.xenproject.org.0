Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624D6920CE
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 11:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzeMo-0001h0-2S; Mon, 19 Aug 2019 09:54:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzeMm-0001gv-VV
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 09:54:21 +0000
X-Inumbo-ID: 4fbbeb58-c267-11e9-8beb-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4fbbeb58-c267-11e9-8beb-12813bfff9fa;
 Mon, 19 Aug 2019 09:54:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A815344;
 Mon, 19 Aug 2019 02:54:18 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ECC43F718;
 Mon, 19 Aug 2019 02:54:17 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
 <20190815233618.31630-2-sstabellini@kernel.org>
 <df288911-2b33-8160-582d-e3c933ee8b8d@arm.com>
 <alpine.DEB.2.21.1908161747070.20094@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <517de741-3b6e-5583-7d98-43e00de072e5@arm.com>
Date: Mon, 19 Aug 2019 10:54:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1908161747070.20094@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 2/8] xen/arm: make process_memory_node a
 device_tree_node_func
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
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzE3LzE5IDE6NDggQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBGcmks
IDE2IEF1ZyAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSSB0aGluayB5b3UgYXJlIHJpZ2h0
LCBhbmQgaG9uZXN0bHkgSSB3YXMgdGhpbmtpbmcgYWJvdXQgaXQgd2hpbGUgSQo+IHVwZGF0ZWQg
dGhpcyBwYXRjaC4gSWYgSSB1c2UgLUVJTlZBTCwgaXQgd291bGQgYmUgdGhlIHNhbWUgcmV0dXJu
IGVycm9yCj4gYXMgdGhlICJpbnZhbGlkICNhZGRyZXNzLWNlbGxzIG9yICNzaXplLWNlbGxzIi4g
SSBqdXN0IHdhbnRlZCB0bwo+IGRvdWJsZS1jaGVjayB0aGF0IGl0IGlzIE9LIGZvciB5b3UuCgpX
ZSBkb24ndCBuZWVkIHRvIGRpZmZlcmVudGlhdGUgImludmFsaWQgI3thZGRyZXNzLCBzaXplfS1j
ZWxscyIgZnJvbSAKInplcm8gc2l6ZSIsIHNvIHVzaW5nIHRoZSBzYW1lIGVycm5vIGlzIGZpbmUu
CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
