Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D75F72E3E5
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 19:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2fT-00018C-Oe; Wed, 29 May 2019 17:47:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2fS-000187-K8
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:47:14 +0000
X-Inumbo-ID: ca5bb266-8239-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id ca5bb266-8239-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 17:47:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFFE7341;
 Wed, 29 May 2019 10:47:12 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F20F73F5AF;
 Wed, 29 May 2019 10:47:11 -0700 (PDT)
To: Amit Singh Tomar <amittomer25@gmail.com>, xen-devel@lists.xenproject.org
References: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7fb32709-2e15-8b5d-9182-54c0b4826541@arm.com>
Date: Wed, 29 May 2019 18:47:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556902928-18682-1-git-send-email-amittomer25@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Black list everything with a PPI
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW1pdCwKCkp1c3QgYSBxdWljayBmb2xsb3ctdXAuIElzIHRoZXJlIGFueSBwbGFuIHRvIHNl
bmQgYSBuZXcgdmVyc2lvbiBvZiB0aGlzIHBhdGNoPwoKQ2hlZXJzLAoKT24gMDMvMDUvMjAxOSAx
ODowMiwgQW1pdCBTaW5naCBUb21hciB3cm90ZToKPiBYRU4gc2hvdWxkIG5vdCBmb3J3YXJkIFBQ
SXMgdG8gRG9tMCBhcyBpdCBvbmx5IHN1cHBvcnQgU1BJcy4KPiBPbmUgb2Ygc29sdXRpb24gdG8g
dGhpcyBwcm9ibGVtIGlzIHRvIHNraXAgYW55IGRldmljZSB0aGF0Cj4gdXNlcyBQUEkgc291cmNl
IGNvbXBsZXRlbHkgd2hpbGUgYnVpbGRpbmcgZG9tYWluIGl0c2VsZi4KPiAKPiBUaGlzIHBhdGNo
IGdvZXMgdGhyb3VnaCBhbGwgdGhlIGludGVycnVwdCBzb3VyY2VzIG9mIGRldmljZSBhbmQgc2tp
cCBpdAo+IGlmIG9uZSBvZiBpbnRlcnJ1cHQgc291cmNlIGlzIFBQSS4gSXQgZml4ZXMgWEVOIGJv
b3Qgb24gaS5NWDhNUSBieQo+IHNraXBwaW5nIFBNVSBub2RlLgo+IAo+IFN1Z2dlc3RlZC1ieTog
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW1p
dCBTaW5naCBUb21hciA8YW1pdHRvbWVyMjVAZ21haWwuY29tPgo+IC0tLQo+ICAgICAgKiBUaGlz
IHJlcGxhY2VzIGZvbGxvd2luZyBwYXRjaC4KPiAgICAgICAgaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wYXRjaC8xMDg5OTg4MS8KPiAtLS0KPiAgIHhlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyB8IDE2ICsrKysrKysrKysrKysrKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21h
aW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYwo+IGluZGV4IGQ5ODM2Nzcu
LjhmNTQ0NzIgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gKysr
IGIveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jCj4gQEAgLTEzNTMsNyArMTM1Myw3IEBAIHN0
YXRpYyBpbnQgX19pbml0IGhhbmRsZV9ub2RlKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBrZXJu
ZWxfaW5mbyAqa2luZm8sCj4gICAgICAgICAgIHsgLyogc2VudGluZWwgKi8gfSwKPiAgICAgICB9
Owo+ICAgICAgIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqY2hpbGQ7Cj4gLSAgICBpbnQgcmVzOwo+
ICsgICAgaW50IHJlcywgaSwgbmlycSwgaXJxX2lkOwo+ICAgICAgIGNvbnN0IGNoYXIgKm5hbWU7
Cj4gICAgICAgY29uc3QgY2hhciAqcGF0aDsKPiAgIAo+IEBAIC0xMzk5LDYgKzEzOTksMjAgQEAg
c3RhdGljIGludCBfX2luaXQgaGFuZGxlX25vZGUoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGtl
cm5lbF9pbmZvICpraW5mbywKPiAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgfQo+ICAgCj4g
KyAgICAvKiBTa2lwIHRoZSBub2RlLCB1c2luZyBQUEkgc291cmNlICovCj4gKyAgICBuaXJxID0g
ZHRfbnVtYmVyX29mX2lycShub2RlKTsKPiArCj4gKyAgICBmb3IgKCBpID0gMCA7IGkgPCBuaXJx
IDsgaSsrICkKPiArICAgIHsKPiArICAgICAgICBpcnFfaWQgPSBwbGF0Zm9ybV9nZXRfaXJxKG5v
ZGUsIGkpOwo+ICsKPiArICAgICAgICBpZiAoIGlycV9pZCA+PSAxNiAmJiBpcnFfaWQgPCAzMiAp
Cj4gKyAgICAgICAgewo+ICsgICAgICAgICAgICBkdF9kcHJpbnRrKCIgU2tpcCBub2RlIHdpdGgg
KFBQSSBzb3VyY2UpXG4iKTsKPiArICAgICAgICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgfQo+
ICsgICAgfQo+ICsKPiAgICAgICAvKgo+ICAgICAgICAqIFhlbiBpcyB1c2luZyBzb21lIHBhdGgg
Zm9yIGl0cyBvd24gcHVycG9zZS4gV2FybiBpZiBhIG5vZGUKPiAgICAgICAgKiBhbHJlYWR5IGV4
aXN0cyB3aXRoIHRoZSBzYW1lIHBhdGguCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
