Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A277394C50
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 20:05:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlzm-0001zw-5p; Mon, 19 Aug 2019 18:03:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzlzk-0001zm-TF
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 18:03:04 +0000
X-Inumbo-ID: 96b4dcd9-c2ab-11e9-8bf0-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 96b4dcd9-c2ab-11e9-8bf0-12813bfff9fa;
 Mon, 19 Aug 2019 18:03:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0159360;
 Mon, 19 Aug 2019 11:03:03 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2DA43F246;
 Mon, 19 Aug 2019 11:03:02 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
 <20190819174338.10466-2-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3d0782b5-55e6-8d90-78c0-8a9bc04a209f@arm.com>
Date: Mon, 19 Aug 2019 19:03:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819174338.10466-2-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 2/8] xen/arm: make process_memory_node a
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDgvMTkvMTkgNjo0MyBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IENoYW5nZSB0aGUgc2lnbmF0dXJlIG9mIHByb2Nlc3NfbWVtb3J5X25vZGUgdG8gbWF0Y2gK
PiBkZXZpY2VfdHJlZV9ub2RlX2Z1bmMuIFRoYW5rcyB0byB0aGlzIGNoYW5nZSwgdGhlIG5leHQg
cGF0Y2ggd2lsbCBiZQo+IGFibGUgdG8gdXNlIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUgdG8g
Y2FsbCBwcm9jZXNzX21lbW9yeV9ub2RlIG9uIGFsbAo+IHRoZSBjaGlsZHJlbiBvZiBhIHByb3Zp
ZGVkIG5vZGUuCj4gCj4gUmV0dXJuIGVycm9yIGlmIHRoZXJlIGlzIG5vIHJlZyBwcm9wZXJ0eSBv
ciBpZiBucl9iYW5rcyBpcyByZWFjaGVkLiBMZXQKPiB0aGUgY2FsbGVyIGRlYWwgd2l0aCB0aGUg
ZXJyb3IuCj4gCj4gQWRkIGEgcHJpbnRrIHdoZW4gZGV2aWNlIHRyZWUgcGFyc2luZyBmYWlscy4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5j
b20+CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVy
cywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
