Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE2661E37
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 14:15:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkSWI-00018o-Nk; Mon, 08 Jul 2019 12:13:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=arZn=VF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkSWH-00018b-OS
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 12:13:21 +0000
X-Inumbo-ID: c6b1481d-a179-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id c6b1481d-a179-11e9-8980-bc764e045a96;
 Mon, 08 Jul 2019 12:13:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80B48CFC;
 Mon,  8 Jul 2019 05:13:20 -0700 (PDT)
Received: from [10.37.9.206] (unknown [10.37.9.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F33B3F738;
 Mon,  8 Jul 2019 05:13:18 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1561294591-14867-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <34ac883b-c8e2-a845-d84f-e2c2c0b725df@arm.com>
Date: Sun, 7 Jul 2019 19:10:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561294591-14867-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen/arm: domain_build: Black list
 devices using PPIs
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW1pdCwKCk9uIDYvMjMvMTkgMTo1NiBQTSwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPiBD
dXJyZW50bHksIHRoZSB2R0lDIGlzIG5vdCBhYmxlIHRvIGNvcGUgd2l0aCBoYXJkd2FyZSBQUElz
IHJvdXRlZCB0byBndWVzdHMuCj4gT25lIG9mIHRoZSBzb2x1dGlvbnMgdG8gdGhpcyBwcm9ibGVt
IGlzIHRvIHNraXAgYW55IGRldmljZSB0aGF0IHVzZXMgUFBJCj4gc291cmNlIGNvbXBsZXRlbHkg
d2hpbGUgYnVpbGRpbmcgdGhlIGRvbWFpbiBpdHNlbGYuCj4gCj4gVGhpcyBwYXRjaCBnb2VzIHRo
cm91Z2ggYWxsIHRoZSBpbnRlcnJ1cHQgc291cmNlcyBvZiBhIGRldmljZSBhbmQgc2tpcCBpdAo+
IGlmIG9uZSBvZiB0aGUgaW50ZXJydXB0cyBzb3VyY2VzIGlzIGEgUFBJLiBJdCBmaXhlcyBYRU4g
Ym9vdCBvbiBpLk1YOE1RIGJ5Cj4gc2tpcHBpbmcgdGhlIFBNVSBub2RlLgo+IAo+IFN1Z2dlc3Rl
ZC1ieTogIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1i
eTogQW1pdCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgoKV2l0aCBvbmUgbWlu
b3IgY2hhbmdlIChzZWUgYmVsb3cpOgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+CgoKPiBAQCAtMTQwMCw2ICsxNDAwLDI0IEBAIHN0YXRpYyBpbnQgX19pbml0
IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8s
Cj4gICAgICAgfQo+ICAgCj4gICAgICAgLyoKPiArICAgICAqIFRoZSB2R0lDIGRvZXMgbm90IHN1
cHBvcnQgcm91dGluZyBoYXJkd2FyZSBQUElzIHRvIGd1ZXN0LiBTbwo+ICsgICAgICogd2UgbmVl
ZCB0byBza2lwIGFueSBub2RlIHVzaW5nIFBQSXMuCj4gKyAgICAgKi8KPiArICAgIG5pcnEgPSBk
dF9udW1iZXJfb2ZfaXJxKG5vZGUpOwo+ICsKPiArICAgIGZvciAoIGkgPSAwIDsgaSA8IG5pcnEg
OyBpKysgKQo+ICsgICAgewo+ICsgICAgICAgIGlycV9pZCA9IHBsYXRmb3JtX2dldF9pcnEobm9k
ZSwgaSk7Cj4gKwo+ICsgICAgICAgIC8qIFBQSXMgcmFuZ2VzIGZyb20gSUQgMTYgdG8gMzEgKi8K
PiArICAgICAgICBpZiAoIGlycV9pZCA+PSAxNiAmJiBpcnFfaWQgPCAzMiApCj4gKyAgICAgICAg
ewo+ICsgICAgICAgICAgICBkdF9kcHJpbnRrKCIgU2tpcCBpdCh1c2luZyBQUElzKVxuIik7CgpO
SVQ6IG1pc3Npbmcgc3BhY2UgYWZ0ZXIgIml0Ii4gSSBjYW4gZml4IHRoaXMgb24gY29tbWl0LgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
