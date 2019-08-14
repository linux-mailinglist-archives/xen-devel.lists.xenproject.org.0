Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C86CC8D3EE
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 14:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxslD-0003S4-Ei; Wed, 14 Aug 2019 12:52:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gPVK=WK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hxslB-0003Rw-Ei
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 12:52:13 +0000
X-Inumbo-ID: 545f3a9e-be92-11e9-9e44-87414d0a589d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 545f3a9e-be92-11e9-9e44-87414d0a589d;
 Wed, 14 Aug 2019 12:52:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D1E0828;
 Wed, 14 Aug 2019 05:52:09 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 463BE3F706;
 Wed, 14 Aug 2019 05:52:09 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.1908121227360.7788@sstabellini-ThinkPad-T480s>
 <20190812222844.9636-4-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <2cc9b620-4947-f93d-8958-407a15f8777b@arm.com>
Date: Wed, 14 Aug 2019 13:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812222844.9636-4-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/7] xen/arm: early_print_info print
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEyLzA4LzIwMTkgMjM6MjgsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBJbXByb3ZlIGVhcmx5X3ByaW50X2luZm8gdG8gYWxzbyBwcmludCB0aGUgYmFua3Mgc2F2
ZWQgaW4KPiBib290aW5mby5yZXNlcnZlZF9tZW0uIFByaW50IHRoZW0gcmlnaHQgYWZ0ZXIgUkVT
VkQsIGluY3JlYXNpbmcgdGhlIHNhbWUKPiBpbmRleC4KPiAKPiBTaW5jZSB3ZSBhcmUgYXQgaXQs
IGFsc28gc3dpdGNoIHRoZSBleGlzdGluZyBSRVNWRCBwcmludCB0byB1c2UgdW5zaWduZWQKPiBp
bnQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4aWxp
bnguY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjU6Cj4gLSBzd2l0Y2ggdG8gdW5zaWduZWQKPiAK
PiBDaGFuZ2VzIGluIHY0Ogo+IC0gbmV3IHBhdGNoCj4gLS0tCj4gICB4ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jIHwgMTEgKysrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9ib290ZmR0
LmMgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gaW5kZXggMGIwZTIyYTNkMC4uMzIxNTNlNjIw
NyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCj4gKysrIGIveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYwo+IEBAIC0zMzcsOSArMzM3LDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGVh
cmx5X3NjYW5fbm9kZShjb25zdCB2b2lkICpmZHQsCj4gICBzdGF0aWMgdm9pZCBfX2luaXQgZWFy
bHlfcHJpbnRfaW5mbyh2b2lkKQo+ICAgewo+ICAgICAgIHN0cnVjdCBtZW1pbmZvICptaSA9ICZi
b290aW5mby5tZW07Cj4gKyAgICBzdHJ1Y3QgbWVtaW5mbyAqbWVtX3Jlc3YgPSAmYm9vdGluZm8u
cmVzZXJ2ZWRfbWVtOwo+ICAgICAgIHN0cnVjdCBib290bW9kdWxlcyAqbW9kcyA9ICZib290aW5m
by5tb2R1bGVzOwo+ICAgICAgIHN0cnVjdCBib290Y21kbGluZXMgKmNtZHMgPSAmYm9vdGluZm8u
Y21kbGluZXM7Cj4gLSAgICBpbnQgaSwgbnJfcnN2ZDsKPiArICAgIHVuc2lnbmVkIGludCBpLCBq
LCBucl9yc3ZkOwo+ICAgCj4gICAgICAgZm9yICggaSA9IDA7IGkgPCBtaS0+bnJfYmFua3M7IGkr
KyApCj4gICAgICAgICAgIHByaW50aygiUkFNOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4i
LAo+IEBAIC0zNjEsOSArMzYyLDE1IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlYXJseV9wcmludF9p
bmZvKHZvaWQpCj4gICAgICAgICAgICAgICBjb250aW51ZTsKPiAgICAgICAgICAgLyogZmR0X2dl
dF9tZW1fcnN2IHJldHVybnMgbGVuZ3RoICovCj4gICAgICAgICAgIGUgKz0gczsKPiAtICAgICAg
ICBwcmludGsoIiBSRVNWRFslZF06ICUiUFJJcGFkZHIiIC0gJSJQUklwYWRkciJcbiIsCj4gKyAg
ICAgICAgcHJpbnRrKCIgUkVTVkRbJXVdOiAlIlBSSXBhZGRyIiAtICUiUFJJcGFkZHIiXG4iLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgaSwgcywgZSk7CgpDYW4geW91IGFkZCBhIHBhdGNoIGJl
Zm9yZSB0byBmaXggdGhlIGluZGVudGF0aW9uIHdpdGhpbiB0aGlzIGZ1bmN0aW9uPwoKPiAgICAg
ICB9Cj4gKyAgICBmb3IgKCBqID0gMDsgaiA8IG1lbV9yZXN2LT5ucl9iYW5rczsgaisrLCBpKysg
KQo+ICsgICAgewo+ICsgICAgICAgIHByaW50aygiIFJFU1ZEWyV1XTogJSJQUklwYWRkciIgLSAl
IlBSSXBhZGRyIlxuIiwgaSwKPiArICAgICAgICAgICAgICAgICAgICAgbWVtX3Jlc3YtPmJhbmtb
al0uc3RhcnQsCj4gKyAgICAgICAgICAgICAgICAgICAgIG1lbV9yZXN2LT5iYW5rW2pdLnN0YXJ0
ICsgbWVtX3Jlc3YtPmJhbmtbal0uc2l6ZSAtIDEpOwoKRXZlbiBpZiB0aGUgbW9zdCBvZiB0aGUg
ZnVuY3Rpb24gaXMgbm90IGNvcnJlY3RseSBpbmRlbnRlZCwgbmV3IGNvZGUgc2hvdWxkIGF0IAps
ZWFzdCBiZS4KCkFzc3VtaW5nIHRoZSB0d28gYXJlIHRha2VuIGludG8gYWNjb3VudDoKCkFja2Vk
LWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKPiArICAgIH0KPiAgICAg
ICBwcmludGsoIlxuIik7Cj4gICAgICAgZm9yICggaSA9IDAgOyBpIDwgY21kcy0+bnJfbW9kczsg
aSsrICkKPiAgICAgICAgICAgcHJpbnRrKCJDTURMSU5FWyUiUFJJcGFkZHIiXTolcyAlc1xuIiwg
Y21kcy0+Y21kbGluZVtpXS5zdGFydCwKPiAKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
