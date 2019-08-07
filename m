Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B220085138
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:39:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOvX-0006FY-5h; Wed, 07 Aug 2019 16:36:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvOvU-0006FP-VZ
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:36:37 +0000
X-Inumbo-ID: 855325bd-b931-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 855325bd-b931-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:36:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28B71344;
 Wed,  7 Aug 2019 09:36:35 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC7013F694;
 Wed,  7 Aug 2019 09:36:34 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908061428420.2451@sstabellini-ThinkPad-T480s>
 <20190806214925.7534-4-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ab9dae72-c8e9-4bf0-ded1-338cf456e6ff@arm.com>
Date: Wed, 7 Aug 2019 17:36:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806214925.7534-4-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 4/7] xen/arm: early_print_info print
 reserved_mem
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

SGkgU3RlZmFubywKCk9uIDA2LzA4LzIwMTkgMjI6NDksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBJbXByb3ZlIGVhcmx5X3ByaW50X2luZm8gdG8gYWxzbyBwcmludCB0aGUgYmFua3Mgc2F2
ZWQgaW4KPiBib290aW5mby5yZXNlcnZlZF9tZW0uIFByaW50IHRoZW0gcmlnaHQgYWZ0ZXIgUkVT
VkQsIGluY3JlYXNpbmcgdGhlIHNhbWUKPiBpbmRleC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2
NDoKPiAtIG5ldyBwYXRjaAo+IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyB8IDkgKysr
KysrKystCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0LmMgYi94ZW4vYXJjaC9hcm0v
Ym9vdGZkdC5jCj4gaW5kZXggM2U2ZmQ2M2IxNi4uYjhmMmU1MzEyMiAxMDA2NDQKPiAtLS0gYS94
ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gKysrIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwo+IEBA
IC0zNTEsOSArMzUxLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGVhcmx5X3NjYW5fbm9kZShjb25z
dCB2b2lkICpmZHQsCj4gICBzdGF0aWMgdm9pZCBfX2luaXQgZWFybHlfcHJpbnRfaW5mbyh2b2lk
KQo+ICAgewo+ICAgICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZib290aW5mby5tZW07Cj4gKyAg
ICBzdHJ1Y3QgbWVtaW5mbyAqbWVtX3Jlc3YgPSAmYm9vdGluZm8ucmVzZXJ2ZWRfbWVtOwo+ICAg
ICAgIHN0cnVjdCBib290bW9kdWxlcyAqbW9kcyA9ICZib290aW5mby5tb2R1bGVzOwo+ICAgICAg
IHN0cnVjdCBib290Y21kbGluZXMgKmNtZHMgPSAmYm9vdGluZm8uY21kbGluZXM7Cj4gLSAgICBp
bnQgaSwgbnJfcnN2ZDsKPiArICAgIGludCBpLCBqLCBucl9yc3ZkOwoKTWF5IEkgYXNrIHlvdSB0
byBzd2l0Y2ggdGhlbSB0byB1bnNpZ25lZCBpbnQ/Cgo+ICAgCj4gICAgICAgZm9yICggaSA9IDA7
IGkgPCBtaS0+bnJfYmFua3M7IGkrKyApCj4gICAgICAgICAgIHByaW50aygiUkFNOiAlIlBSSXBh
ZGRyIiAtICUiUFJJcGFkZHIiXG4iLAo+IEBAIC0zNzgsNiArMzc5LDEyIEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBlYXJseV9wcmludF9pbmZvKHZvaWQpCj4gICAgICAgICAgIHByaW50aygiIFJFU1ZE
WyVkXTogJSJQUklwYWRkciIgLSAlIlBSSXBhZGRyIlxuIiwKPiAgICAgICAgICAgICAgICAgICAg
ICAgIGksIHMsIGUpOwo+ICAgICAgIH0KPiArICAgIGZvciAoIGogPSAwOyBqIDwgbWVtX3Jlc3Yt
Pm5yX2JhbmtzOyBqKyssIGkrKyApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCIgUkVTVkRb
JWRdOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLCBpLAoKV2l0aCB0aGF0IHRoZSByZXF1
ZXN0IGFib3ZlOiBzLyVkLyV1LwoKPiArICAgICAgICAgICAgICAgICAgICAgbWVtX3Jlc3YtPmJh
bmtbal0uc3RhcnQsCj4gKyAgICAgICAgICAgICAgICAgICAgIG1lbV9yZXN2LT5iYW5rW2pdLnN0
YXJ0ICsgbWVtX3Jlc3YtPmJhbmtbal0uc2l6ZSAtIDEpOwo+ICsgICAgfQo+ICAgICAgIHByaW50
aygiXG4iKTsKPiAgICAgICBmb3IgKCBpID0gMCA7IGkgPCBjbWRzLT5ucl9tb2RzOyBpKysgKQo+
ICAgICAgICAgICBwcmludGsoIkNNRExJTkVbJSJQUklwYWRkciJdOiVzICVzXG4iLCBjbWRzLT5j
bWRsaW5lW2ldLnN0YXJ0LAo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
