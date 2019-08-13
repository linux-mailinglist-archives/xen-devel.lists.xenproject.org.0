Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 865948BF9C
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 19:28:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxaXp-000485-H5; Tue, 13 Aug 2019 17:25:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WWvF=WJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxaXo-00042U-Bf
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 17:25:12 +0000
X-Inumbo-ID: 4c5a9f76-bdef-11e9-9a63-7757a20d8c80
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4c5a9f76-bdef-11e9-9a63-7757a20d8c80;
 Tue, 13 Aug 2019 17:25:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80E3E337;
 Tue, 13 Aug 2019 10:25:08 -0700 (PDT)
Received: from [10.37.8.112] (unknown [10.37.8.112])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74AE83F706;
 Tue, 13 Aug 2019 10:25:07 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b6fa1f2b-52e8-b7ac-df32-aab9d81b4ca8@arm.com>
Date: Tue, 13 Aug 2019 18:25:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812222844.9636-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/7] xen/arm: pass node to
 device_tree_for_each_node
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

SGksCgpPbiA4LzEyLzE5IDExOjI4IFBNLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gQWRk
IGEgbmV3IHBhcmFtZXRlciB0byBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlOiBub2RlLCB0aGUg
bm9kZSB0bwo+IHN0YXJ0IHRoZSBzZWFyY2ggZnJvbS4gUGFzc2luZyAwIHRyaWdnZXJzIHRoZSBv
bGQgYmVoYXZpb3IuCj4gCj4gU2V0IG1pbl9kZXB0aCB0byBkZXB0aCBvZiB0aGUgY3VycmVudCBu
b2RlICsgMSBhbmQgcmVwbGFjZSB0aGUgZm9yCj4gbG9vcCB3aXRoIGEgZG8vd2hpbGUgbG9vcCB0
byBhdm9pZCBzY2FubmluZyBzaWJsaW5ncyBvZiB0aGUgaW5pdGlhbCBub2RlCj4gcGFzc2VkIGFz
IGFuIGFyZ3VtZW50Lgo+IAo+IFdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVjYXVzZSBpbiBmb2xsb3ct
dXAgcGF0Y2hlcyB3ZSB3YW50IHRvIGJlIGFibGUgdG8KPiB1c2UgcmV1c2UgZGV2aWNlX3RyZWVf
Zm9yX2VhY2hfbm9kZSB0byBjYWxsIGEgZnVuY3Rpb24gZm9yIGVhY2ggY2hpbGRyZW4KPiBub2Rl
cyBvZiBhIHByb3ZpZGVkIG5vZGUgYW5kIHRoZSBub2RlIGl0c2VsZi4KCkkgaGF2ZSB0byBzYXkg
dGhpcyB3b3VsZCBiZSBmYWlybHkgY29uZnVzaW5nIGZvciByZXNlcnZlZC1tZW1vcnkgYmVjYXVz
ZSAKeW91IGFyZSBvbmx5IGV4cGVjdGluZyB0byBwYXJzZSB0aGUgc3Vibm9kZS4KCkZ1cnRoZXJt
b3JlLCBpbiB0aGUgdW5saWtlbHkgZXZlbnQgdG8gZmlyc3Qgbm9kZSBkb2VzIGhhdmUgYSBwcm9w
ZXJ0eSAKInJlZ3MiLCB0aGVuICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6ZS1jZWxscyBpcyBnb2lu
ZyB0byBiZSBpbmNvcnJlY3QgKHdlIApkb24ndCBsb29rIHVwIGZvciBpdHMgcGFyZW50Li4uKS4K
ClNvIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCB0byBjb25zaWRlciB0byBpZ25vcmUgdGhlIGZp
cnN0IG5vZGUuIFRoaXMgCnNob3VsZCBub3QgYmUgYW4gaXNzdWUgYXMgbm9uZSBvZiB0aGUgdXNl
ciBjYXJlIGFib3V0IHRoZSByb290IG5vZGUgKGkuZSAKLykuIEl0IHdvdWxkIGFsc28gbWFrZXMg
dGhlIGludGVyZmFjZSBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
