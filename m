Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CAC2636A
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2019 14:07:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTPyk-0001j5-RP; Wed, 22 May 2019 12:04:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2jZt=TW=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTPyj-0001iz-E4
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 12:04:17 +0000
X-Inumbo-ID: b89d91b8-7c89-11e9-9c25-4bb37446d6b4
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b89d91b8-7c89-11e9-9c25-4bb37446d6b4;
 Wed, 22 May 2019 12:04:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6D080D;
 Wed, 22 May 2019 05:04:15 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17F053F575;
 Wed, 22 May 2019 05:04:13 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190521212530.12706-1-volodymyr_babchuk@epam.com>
 <20190521212530.12706-2-volodymyr_babchuk@epam.com>
 <5CE50C12020000780023137C@prv1-mh.provo.novell.com>
 <55b6761c-152a-a6fa-085d-5f78443831d1@arm.com>
 <5CE51E2A020000780023144D@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <cd9aac43-66b3-67ae-9674-70fe736d21b7@arm.com>
Date: Wed, 22 May 2019 13:04:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE51E2A020000780023144D@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 01/10] xen/arm: add generic TEE mediator
 framework
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 tee-dev@lists.linaro.org, xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjIvMDUvMjAxOSAxMTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MjIuMDUuMTkgYXQgMTE6MjcsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4gCj4+Cj4+
IE9uIDIyLzA1LzIwMTkgMDk6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+Pj4gT24gMjEuMDUu
MTkgYXQgMjM6MjUsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+Pj4gICAg
TUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgfCAgIDYgKysKPj4+PiAgICB4ZW4vYXJjaC9h
cm0vS2NvbmZpZyAgICAgICAgICB8ICAgNyArKysKPj4+PiAgICB4ZW4vYXJjaC9hcm0vTWFrZWZp
bGUgICAgICAgICB8ICAgMSArCj4+Pj4gICAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAg
fCAgMTggKysrKysrCj4+Pj4gICAgeGVuL2FyY2gvYXJtL3NldHVwLmMgICAgICAgICAgfCAgIDIg
Kwo+Pj4+ICAgIHhlbi9hcmNoL2FybS90ZWUvTWFrZWZpbGUgICAgIHwgICAxICsKPj4+PiAgICB4
ZW4vYXJjaC9hcm0vdGVlL3RlZS5jICAgICAgICB8ICA5MyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+Pj4+ICAgIHhlbi9hcmNoL2FybS92c21jLmMgICAgICAgICAgIHwgICA1ICsrCj4+
Pj4gICAgeGVuL2FyY2gvYXJtL3hlbi5sZHMuUyAgICAgICAgfCAgIDcgKysrCj4+Pj4gICAgeGVu
L2luY2x1ZGUvYXNtLWFybS9kb21haW4uaCAgfCAgIDEgKwo+Pj4+ICAgIHhlbi9pbmNsdWRlL2Fz
bS1hcm0vdGVlL3RlZS5oIHwgMTA5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
Pj4+PiAgICB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaCB8ICAgMyArCj4+Pj4gICAgMTIg
ZmlsZXMgY2hhbmdlZCwgMjUzIGluc2VydGlvbnMoKykKPj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2
NDQgeGVuL2FyY2gvYXJtL3RlZS9NYWtlZmlsZQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0vdGVlL3RlZS5jCj4+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNs
dWRlL2FzbS1hcm0vdGVlL3RlZS5oCj4+Pgo+Pj4gSSBkb24ndCB0aGluayBJJ20gYXNraW5nIHRo
aXMgZm9yIHRoZSBmaXJzdCB0aW1lOiBXaHkgYW0gSSBiZWluZyBDYy1lZAo+Pj4gaGVyZT8gSXQn
cyBhbGwgQXJtIGNvZGUgdGhhdCBnZXRzIGNoYW5nZWQsIGFuZCB0aGUgTUFJTlRBSU5FUlMKPj4+
IGFkZGl0aW9uIGFsb25lIGltbyBkb2Vzbid0IHdhcnJhbnQgd2lkZW5pbmcgdGhlIENjIGxpc3Qu
Cj4+Cj4+IEEgbG90IG9mIHVzZXJzIHVzZXMgdGhlIHNjcmlwdHMve2FkZCwgZ2V0fV9tYWludGFp
bmVycy5wbCB0byBnZXQgdGhlIGxpc3Qgb2YKPj4KPj4gbWFpbnRhaW5lcnMgdG8gQ0NlZC4gQm90
aCBvZiB0aGVtIG91dHB1dCAiVEhFIFJFU1QiIGJlY2F1c2Ugb2YgdGhlIGZpbGUKPj4gTUFJTlRB
SU5FUlMgaXMgbW9kaWZpZWQuCj4+Cj4+IEkgZG9uJ3QgdGhpbmsgaXQgaXMgc2Vuc2libGUgdG8g
ZXhwZWN0IHVzZXJzIHRvIGtub3cgd2hlbiB0byBzdHJpcCB0aGUKPj4gbGlzdC4uLgo+IAo+IEht
bSwgd2VsbCwgSSBzZWUgeW91ciBwb2ludCwgYnV0IEkgdGhpbmsgYXBwbHlpbmcgc29tZSBjb21t
b24gc2Vuc2UKPiBzdGlsbCBjYW4gYmUgZXhwZWN0ZWQuIEl0J3MgYWxzbyBub3Qgc2Vuc2libGUg
Zm9yIHVucmVsYXRlZCBwZW9wbGUgdG8KPiBnZXQgQ2MtZWQuIEkgdGhpbmsgYW55b25lIGtub3dp
bmcgZW5vdWdoIHRvIG1vZGlmeSBNQUlOVEFJTkVSUwo+IGNhbiBiZSBleHBlY3RlZCB0byBrbm93
IHdob20gdG8gQ2MuCgpJIGRpc2FncmVlIGhlcmUsIHNvbWVvbmUgaW4gIlRIRSBSRVNUIiBtYXkg
aGF2ZSBhbiBvcGluaW9uIGluIGFkZGluZyBWb2xvZHlteXIgCmFzIGEgbWFpbnRhaW5lciAodGhp
cyBpcyBvbmx5IGV4YW1wbGUpLgoKVGhpcyBpcyBhIGJpdCBzaW1pbGFyIHRvIHdoZW4geW91IHNl
bmQgYSBwYXRjaCB0byBhZGQgYSAzIGxpbmVzIHRpbWVyIGhlbHBlciBpbiAKYSBjb21tb24gaGVh
ZGVyIGJ1dCBpdCBpcyBvbmx5IHVzZWQgYnkgeDg2LiBFdmVuIGlmIEkgd2lsbCBub3QgbmVjZXNz
YXJ5IGFuc3dlciAKb24gdGhlIHBhdGNoIGJlY2F1c2UgaXQgZG9lcyBub3QgaW1wYWN0IEFybSBk
aXJlY3RseSwgSSB3aWxsIHN0aWxsIGhhdmUgYSBxdWljayAKbG9vayB0byBzZWUgaWYgaXQgbWFr
ZXMgc2Vuc2UuCgpBbnl3YXksIHlvdSBjYW4ndCBleHBlY3QgdGhlIGNvbnRyaWJ1dG9yIHRvIGd1
ZXNzIHlvdXIgd2lsbCBvbiBNQUlOVEFJTkVSUy4gWW91IApzaG91bGQgdXBkYXRlIHRoZSBkb2N1
bWVudGF0aW9uL3NjcmlwdCBpZiB0aGlzIGlzIHRoZSBleHBlY3RhdGlvbiB5b3UgaGF2ZS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
