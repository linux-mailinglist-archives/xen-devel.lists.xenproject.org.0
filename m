Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B085964973
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 17:22:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlEMN-0004Hj-8d; Wed, 10 Jul 2019 15:18:19 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlEML-0004He-AQ
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 15:18:17 +0000
X-Inumbo-ID: f0625fb8-a325-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id f0625fb8-a325-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 15:18:15 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 436E22B;
 Wed, 10 Jul 2019 08:18:15 -0700 (PDT)
Received: from [10.119.48.95] (unknown [10.119.48.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12CA73F246;
 Wed, 10 Jul 2019 08:18:15 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a0ee8f5f-70c6-1f29-2648-6e3500d8d06d@arm.com>
Date: Wed, 10 Jul 2019 16:18:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621235608.2153-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 1/6] xen/arm: extend
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMjIvMTkgMTI6NTYgQU0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBBZGQgdHdvIG5ldyBwYXJhbWV0ZXJzIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGU6
IG5vZGUgYW5kIGRlcHRoLgo+IE5vZGUgaXMgdGhlIHBhcmVudCBub2RlIHRvIHN0YXJ0IHRoZSBz
ZWFyY2ggZnJvbSBhbmQgZGVwdGggaXMgdGhlIG1pbgo+IGRlcHRoIG9mIHRoZSBzZWFyY2ggKHRo
ZSBkZXB0aCBvZiB0aGUgcGFyZW50IG5vZGUpLiBQYXNzaW5nIDAsIDAKPiB0cmlnZ2VycyB0aGUg
b2xkIGJlaGF2aW9yLgo+IAo+IFdlIG5lZWQgdGhpcyBjaGFuZ2UgYmVjYXVzZSBpbiBmb2xsb3ct
dXAgcGF0Y2hlcyB3ZSB3YW50IHRvIGJlIGFibGUgdG8KPiB1c2UgcmV1c2UgZGV2aWNlX3RyZWVf
Zm9yX2VhY2hfbm9kZSB0byBjYWxsIGEgZnVuY3Rpb24gZm9yIGVhY2ggY2hpbGRyZW4KPiBub2Rl
cyBvZiBhIHByb3ZpZGVkIG5vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxs
aW5pIDxzdGVmYW5vc0B4aWxpbnguY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjM6Cj4gLSBpbXBy
b3ZlIGNvbW1pdCBtZXNzYWdlCj4gLSBpbXByb3ZlIGluLWNvZGUgY29tbWVudHMKPiAtIGltcHJv
dmUgY29kZSBzdHlsZQoKWW91IGhhdmVuJ3QgYWRkcmVzc2VkIG15IHF1ZXN0aW9ucyBhbmQgcG90
ZW50aWFsIGVycm9ycyBJIHBvaW50ZWQgb3V0IG9uIAp2Mi4gU2VlIDw4ODVmYzYyZS1kYmUyLWJi
OGYtMTQ3Ni1kZTViNWQ3ZGYyYzhAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
