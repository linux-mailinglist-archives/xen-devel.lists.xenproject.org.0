Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4013CF7FE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 13:18:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHnSe-0008AY-Tp; Tue, 08 Oct 2019 11:15:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=N428=YB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iHnSc-0008AT-Pg
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 11:15:22 +0000
X-Inumbo-ID: eab97392-e9bc-11e9-9bee-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id eab97392-e9bc-11e9-9bee-bc764e2007e4;
 Tue, 08 Oct 2019 11:15:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EC50F15BE;
 Tue,  8 Oct 2019 04:15:20 -0700 (PDT)
Received: from [10.37.12.88] (unknown [10.37.12.88])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 117BD3F6C4;
 Tue,  8 Oct 2019 04:15:19 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
 <20191008011501.21038-1-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <06903f95-0135-c392-3e44-9a9928a3a6de@arm.com>
Date: Tue, 8 Oct 2019 12:15:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008011501.21038-1-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/3] xen/arm: fix buf size in
 make_cpus_node
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
Cc: jgross@suse.com, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDEwLzgvMTkgMjoxNCBBTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IFRoZSBzaXplIG9mIGJ1ZiBpcyBjYWxjdWxhdGVkIHdyb25nbHk6IHRoZSBudW1iZXIgaXMg
NjRiaXQsIG5vdCAzMmJpdC4KCldoaWxlIHRoZSB2YXJpYWJsZSBtcGRpcl9hZmYgaXMgNjQtYml0
LCB3ZSBvbmx5IHdyaXRlIHRoZSBmaXJzdCAzMi1iaXQgCmluIHRoZSBwcm9wZXJ0eSByZWcgKCNh
ZGRyZXNzLWNlbGxzID09IDEgYW5kIGZkdF9wcm9wZXJ0eV9jZWxsKCkpLiBTbyAKd2hhdCBuZWVk
cyB0byBiZSBtb2RpZmllZCBpcyB0aGUgZm9ybWF0IGhlcmUuCgpBbHNvLCBsb29raW5nIHRoZSBD
UFUgYmluZGluZ3MgKHNlZSAKbGludXgvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2FybS9jcHVzLnlhbWwpLCB0ZWNobmljYWxseSBvbmx5IAp0aGUgYml0cyBbMjM6MF0gb2YgdGhl
IG1waWRyIHNob3VsZCBiZSB1c2VkLiBUaGUgcmVzdCBpcyB6ZXJvZWQuCgpUaGlzIGlzIG9rIGJl
Y2F1c2UgdmNwdWlkX3RvX3ZhZmZpbml0eSgpIGlzIGFsd2F5cyByZXR1cm5pbmcgYSB2YWx1ZSAK
Zm9sbG93aW5nIHRoZSByZXF1aXJlbWVudHMgYWJvdmUuIEhvd2V2ZXIsIGZvciBjb3JyZWN0bmVz
cywgdGhpcyBtYXkgCndhbnQgdG8gYmUgZml4ZWQuCgo+IEFsc28gdGhlIG51bWJlciBpcyBwcmlu
dGVkIGFzIGEgaGV4YWRlY2ltYWwgbnVtYmVyLCBzbyB3ZSBuZWVkIDggYnl0ZXMKPiBmb3IgMzJi
aXQsIG5vdCAxMCBieXRlcy4KPiAKPiBBcyBhIHJlc3VsdCwgaXQgc2hvdWxkIGJlIHNpemVvZigi
Y3B1QCIpICsgMTYgYnl0ZXMgZm9yIGEgNjQtYml0IG51bWJlcgo+ICsgMSBieXRlIGZvciBcMC4g
VG90YWwgPSAyMS4KPiAKPiBGaXhlczogZmFmZDY4MmMzZSAoeGVuL2FybTogQ3JlYXRlIGEgZmFr
ZSBjcHVzIG5vZGUgaW4gZG9tMCBkZXZpY2UgdHJlZSkKCkkgYW0gYWZyYWlkIHRoaXMgaXMgbm90
IGZpeGluZyB0aGlzIHBhdGNoOgoKc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgImNwdUAldSIs
IGNwdSk7CgpTbyB0aGUgMTAgYnl0ZXMgd2VyZSBhY3R1YWxseSBjb3JyZWN0IGJhY2sgdGhlbi4K
ClRoZSBwcm9ibGVtIHdhcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBjODFhNzkxZDM0ICJ4ZW4vYXJt
OiBTZXQgJ3JlZycgb2YgCmNwdSBub2RlIGZvciBkb20wIHRvIG1hdGNoIE1QSURSJ3MgYWZmaW5p
dHkiLgoKPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUB4aWxpbnguY29tPgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6Cj4gLSBwYXRjaCBhZGRlZAo+
IC0tLQo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgNCArKy0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxk
LmMKPiBpbmRleCA5MjFiMDU0NTIwLi42MDkyM2E3MDUxIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNo
L2FybS9kb21haW5fYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+
IEBAIC03ODgsOCArNzg4LDggQEAgc3RhdGljIGludCBfX2luaXQgbWFrZV9jcHVzX25vZGUoY29u
c3Qgc3RydWN0IGRvbWFpbiAqZCwgdm9pZCAqZmR0KQo+ICAgICAgIHVuc2lnbmVkIGludCBjcHU7
Cj4gICAgICAgY29uc3Qgdm9pZCAqY29tcGF0aWJsZSA9IE5VTEw7Cj4gICAgICAgdTMyIGxlbjsK
PiAtICAgIC8qIFBsYWNlaG9sZGVyIGZvciBjcHVAICsgYSAzMi1iaXQgbnVtYmVyICsgXDAgKi8K
PiAtICAgIGNoYXIgYnVmWzE1XTsKPiArICAgIC8qIFBsYWNlaG9sZGVyIGZvciBjcHVAICsgYSA2
NC1iaXQgbnVtYmVyICsgXDAgKi8KPiArICAgIGNoYXIgYnVmWzIxXTsKPiAgICAgICB1MzIgY2xv
Y2tfZnJlcXVlbmN5Owo+ICAgICAgIGJvb2wgY2xvY2tfdmFsaWQ7Cj4gICAgICAgdWludDY0X3Qg
bXBpZHJfYWZmOwo+IAoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
