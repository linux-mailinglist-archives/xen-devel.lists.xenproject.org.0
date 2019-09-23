Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C310BB1AB
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 11:50:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCKxF-0004hM-Mm; Mon, 23 Sep 2019 09:48:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XQlp=XS=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iCKxD-0004h0-Ij
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 09:48:23 +0000
X-Inumbo-ID: 472e94ae-dde7-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 472e94ae-dde7-11e9-a337-bc764e2007e4;
 Mon, 23 Sep 2019 09:48:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0EA281000;
 Mon, 23 Sep 2019 02:48:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC8773F59C;
 Mon, 23 Sep 2019 02:48:19 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190918185041.22738-1-volodymyr_babchuk@epam.com>
 <20190918185041.22738-6-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cec2c39d-409a-d34a-e772-d5f5958e34c9@arm.com>
Date: Mon, 23 Sep 2019 10:48:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190918185041.22738-6-volodymyr_babchuk@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 5/6] SUPPORT.md: Describe OP-TEE mediator
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wOS8yMDE5IDE5OjUxLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToKPiBXaXRo
IHRoZSBsYXRlc3QgcGF0Y2hlcyB0byB0aGUgbWVkaWF0b3IsIGl0IGNhbiBiZSBjb25zaWRlcmVk
Cj4gYXMgVGVjaG5vbG9naWNhbCBQcmV2aWV3IGZlYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Vm9sb2R5bXlyIEJhYmNodWsgPHZvbG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKV2l0aCBvbmUg
Y2hhbmdlIGJlbG93OgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+Cgo+IAo+IC0tLQo+IAo+IE5vdGUgZm9yIGNvbW1pdGVyOgo+IE9idmlvdXNseSB0aGlzIHBh
dGNoIHNob3VsZCBiZSBtZXJnZWQgYWZ0ZXIgYWxsIG90aGVyIHBhdGNoZXMgaW4KPiB0aGlzIHNl
cmllcy4KPiAtLS0KPiAgIFNVUFBPUlQubWQgfCA0ICsrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQK
PiBpbmRleCAzNzU0NzNhNDU2Li44ZDUwYTcyZGNiIDEwMDY0NAo+IC0tLSBhL1NVUFBPUlQubWQK
PiArKysgYi9TVVBQT1JULm1kCj4gQEAgLTY2MCw2ICs2NjAsMTAgQEAgTm8gc3VwcG9ydCBmb3Ig
UUVNVSBiYWNrZW5kcyBpbiBhIDE2SyBvciA2NEsgZG9tYWluLgo+ICAgCj4gICAgICAgU3RhdHVz
OiBTdXBwb3J0ZWQKPiAgIAo+ICsjIyMgQVJNOiBPUC1URUUgTWVkaWF0b3IKCk5JVDogcy9BUk0v
QXJtLwoKPiArCj4gKyAgICBTdGF0dXM6IFRlY2ggUHJldmlldwo+ICsKPiAgICMjIFZpcnR1YWwg
SGFyZHdhcmUsIFFFTVUKPiAgIAo+ICAgVGhpcyBzZWN0aW9uIGRlc2NyaWJlcyBzdXBwb3J0ZWQg
ZGV2aWNlcyBhdmFpbGFibGUgaW4gSFZNIG1vZGUgdXNpbmcgYQo+IAoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
