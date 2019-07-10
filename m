Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 355A764ADE
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 18:43:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hlFdz-0002KZ-Ng; Wed, 10 Jul 2019 16:40:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ELaq=VH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hlFdx-0002KU-R6
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 16:40:33 +0000
X-Inumbo-ID: 6e98fa84-a331-11e9-bbd6-9f3a66bcd058
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6e98fa84-a331-11e9-bbd6-9f3a66bcd058;
 Wed, 10 Jul 2019 16:40:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 51418344;
 Wed, 10 Jul 2019 09:40:31 -0700 (PDT)
Received: from [10.119.48.3] (unknown [10.119.48.3])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266E93F246;
 Wed, 10 Jul 2019 09:40:31 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1906211648280.25730@sstabellini-ThinkPad-T480s>
 <20190621235608.2153-4-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <173378d6-a9b7-7be6-9c9e-a58f1a00d984@arm.com>
Date: Wed, 10 Jul 2019 17:40:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190621235608.2153-4-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/6] xen/arm: handle reserved-memory in
 consider_modules and dt_unreserved_regions
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
ZToKPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NldHVwLmMgYi94ZW4vYXJjaC9hcm0vc2V0
dXAuYwo+IGluZGV4IDIxNTc0NmE1YzMuLmQ5Y2ZiMWFhMmYgMTAwNjQ0Cj4gLS0tIGEveGVuL2Fy
Y2gvYXJtL3NldHVwLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vc2V0dXAuYwo+IEBAIC0yMDYsNiAr
MjA2LDI4IEBAIHZvaWQgX19pbml0IGR0X3VucmVzZXJ2ZWRfcmVnaW9ucyhwYWRkcl90IHMsIHBh
ZGRyX3QgZSwKPiAgICAgICAgICAgfQo+ICAgICAgIH0KPiAgIAo+ICsgICAgLyoKPiArICAgICAq
IGkgaXMgdGhlIGN1cnJlbnQgYm9vdG1vZHVsZSB3ZSBhcmUgZXZhbHVhdGluZyBhY3Jvc3MgYWxs
IHBvc3NpYmxlCj4gKyAgICAgKiBraW5kcy4KPiArICAgICAqCj4gKyAgICAgKiBXaGVuIHJldHJp
ZXZpbmcgdGhlIGNvcnJlc3BvbmRpbmcgcmVzZXJ2ZWQtbWVtb3J5IGFkZHJlc3Nlcwo+ICsgICAg
ICogYmVsb3csIHdlIG5lZWQgdG8gaW5kZXggdGhlIGJvb3RpbmZvLnJlc2VydmVkX21lbSBiYW5r
IHN0YXJ0aW5nCj4gKyAgICAgKiBmcm9tIDAsIGFuZCBvbmx5IGNvdW50aW5nIHRoZSByZXNlcnZl
ZC1tZW1vcnkgbW9kdWxlcy4gSGVuY2UsCj4gKyAgICAgKiB3ZSBuZWVkIHRvIHVzZSBpIC0gbnIu
Cj4gKyAgICAgKi8KPiArICAgIGZvciAoIDsgaSAtIG5yIDwgYm9vdGluZm8ucmVzZXJ2ZWRfbWVt
Lm5yX2JhbmtzOyBpKysgKQo+ICsgICAgewo+ICsgICAgICAgIHBhZGRyX3Qgcl9zID0gYm9vdGlu
Zm8ucmVzZXJ2ZWRfbWVtLmJhbmtbaSAtIG5yXS5zdGFydDsKPiArICAgICAgICBwYWRkcl90IHJf
ZSA9IHJfcyArIGJvb3RpbmZvLnJlc2VydmVkX21lbS5iYW5rW2kgLSBucl0uc2l6ZTsKPiArCj4g
KyAgICAgICAgaWYgKCBzIDwgcl9lICYmIHJfcyA8IGUgKQo+ICsgICAgICAgIHsKPiArICAgICAg
ICAgICAgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHJfZSwgZSwgY2IsIGkrMSk7CgpDb2Rpbmcgc3R5
bGU6IHNwYWNlIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIG9wZXJhdG9yLiBJZGVhbGx5LCB0aGUgcmVz
dCBvZgoKPiArICAgICAgICAgICAgZHRfdW5yZXNlcnZlZF9yZWdpb25zKHMsIHJfcywgY2IsIGkr
MSk7CgpEaXR0by4KCldpdGggdGhhdDoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5n
cmFsbEBhcm0uY29tPgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
