Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC5636EF1
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 10:43:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYnxP-0003dd-Rm; Thu, 06 Jun 2019 08:41:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2G1I=UF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYnxN-0003cY-KP
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 08:41:09 +0000
X-Inumbo-ID: d49af79e-8836-11e9-b5a2-2be9be518c47
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d49af79e-8836-11e9-b5a2-2be9be518c47;
 Thu, 06 Jun 2019 08:41:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83B1C341;
 Thu,  6 Jun 2019 01:41:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C6D33F690;
 Thu,  6 Jun 2019 01:41:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <5CF664580200007800235089@prv1-mh.provo.novell.com>
 <5CF667B40200007800235145@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d8134166-d747-7b37-bf0d-67fb1c0091db@arm.com>
Date: Thu, 6 Jun 2019 09:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF667B40200007800235145@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/4] dom_cow is needed for mem-sharing
 only
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Tamas K Lengyel <tamas@tklengyel.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDQvMDYvMjAxOSAxMzo0NCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gQSBjb3Vw
bGUgb2YgYWRqdXN0bWVudHMgYXJlIG5lZWRlZCB0byBjb2RlIGNoZWNraW5nIGZvciBkb21fY293
LCBidXQKPiBzaW5jZSB0aGVyZSBhcmUgcHJldHR5IGZldyBpdCBpcyBwcm9iYWJseSBiZXR0ZXIg
dG8gYWRqdXN0IHRob3NlIHRoYW4KPiB0byBzZXQgdXAgYW5kIGtlZXAgYXJvdW5kIGEgbmV2ZXIg
dXNlZCBkb21haW4uCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgoKQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpD
aGVlcnMsCgo+IC0tLQo+IHYyOiBVc2UgI2lmLyNlbHNlLiBTcGxpdCBvdXQgZW11bC1wcml2LW9w
LmMgY2hhbmdlLgo+IC0tLQo+IFdoaWxlIGZvciBub3cgdGhpcyBhdm9pZHMgY3JlYXRpbmcgdGhl
IGRvbWFpbiBvbiBBcm0gb25seSwgVGFtYXMnZXMKPiBwYXRjaCBzd2l0Y2hpbmcgdG8gQ09ORklH
X01FTV9TSEFSSU5HIHdpbGwgbWFrZSB4ODYgbGV2ZXJhZ2UgdGhpcyB0b28uCj4gCj4gLS0tIGEv
eGVuL2FyY2gveDg2L21tLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0uYwo+IEBAIC05NjcsOCAr
OTY3LDggQEAgZ2V0X3BhZ2VfZnJvbV9sMWUoCj4gICAgICAgICAgIHJldHVybiBmbGlwOwo+ICAg
ICAgIH0KPiAgIAo+IC0gICAgaWYgKCB1bmxpa2VseSggKHJlYWxfcGdfb3duZXIgIT0gcGdfb3du
ZXIpICYmCj4gLSAgICAgICAgICAgICAgICAgICAocmVhbF9wZ19vd25lciAhPSBkb21fY293KSAp
ICkKPiArICAgIGlmICggdW5saWtlbHkoKHJlYWxfcGdfb3duZXIgIT0gcGdfb3duZXIpICYmCj4g
KyAgICAgICAgICAgICAgICAgICghZG9tX2NvdyB8fCAocmVhbF9wZ19vd25lciAhPSBkb21fY293
KSkpICkKPiAgICAgICB7Cj4gICAgICAgICAgIC8qCj4gICAgICAgICAgICAqIExldCBwcml2aWxl
Z2VkIGRvbWFpbnMgdHJhbnNmZXIgdGhlIHJpZ2h0IHRvIG1hcCB0aGVpciB0YXJnZXQKPiAtLS0g
YS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBA
QCAtNTY4LDcgKzU2OCw4IEBAIHN0cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dm
bigKPiAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgIGVsc2UgaWYgKCAhZ2V0X3BhZ2Uo
cGFnZSwgcDJtLT5kb21haW4pICYmCj4gICAgICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBj
b3VsZCBiZSBzaGFyZWQgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICghcDJtX2lzX3NoYXJl
ZCgqdCkgfHwgIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpKSApCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAoIWRvbV9jb3cgfHwgIXAybV9pc19zaGFyZWQoKnQpIHx8Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgIWdldF9wYWdlKHBhZ2UsIGRvbV9jb3cpKSApCj4gICAgICAgICAgICAgICAgICAg
cGFnZSA9IE5VTEw7Cj4gICAgICAgICAgIH0KPiAgICAgICAgICAgcDJtX3JlYWRfdW5sb2NrKHAy
bSk7Cj4gQEAgLTk0MSw3ICs5NDIsOCBAQCBndWVzdF9waHlzbWFwX2FkZF9lbnRyeShzdHJ1Y3Qg
ZG9tYWluICpkCj4gICAgICAgLyogVGhlbiwgbG9vayBmb3IgbS0+cCBtYXBwaW5ncyBmb3IgdGhp
cyByYW5nZSBhbmQgZGVhbCB3aXRoIHRoZW0gKi8KPiAgICAgICBmb3IgKCBpID0gMDsgaSA8ICgx
VUwgPDwgcGFnZV9vcmRlcik7IGkrKyApCj4gICAgICAgewo+IC0gICAgICAgIGlmICggcGFnZV9n
ZXRfb3duZXIobWZuX3RvX3BhZ2UobWZuX2FkZChtZm4sIGkpKSkgPT0gZG9tX2NvdyApCj4gKyAg
ICAgICAgaWYgKCBkb21fY293ICYmCj4gKyAgICAgICAgICAgICBwYWdlX2dldF9vd25lcihtZm5f
dG9fcGFnZShtZm5fYWRkKG1mbiwgaSkpKSA9PSBkb21fY293ICkKPiAgICAgICAgICAgewo+ICAg
ICAgICAgICAgICAgLyogVGhpcyBpcyBubyB3YXkgdG8gYWRkIGEgc2hhcmVkIHBhZ2UgdG8geW91
ciBwaHlzbWFwISAqLwo+ICAgICAgICAgICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIkFkZGlu
ZyBzaGFyZWQgbWZuICVseCBkaXJlY3RseSB0byBkb20lZCBwaHlzbWFwIG5vdCBhbGxvd2VkLlxu
IiwKPiAtLS0gYS94ZW4vY29tbW9uL2RvbWFpbi5jCj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4u
Ywo+IEBAIC03NCw3ICs3NCw5IEBAIGludGVnZXJfcGFyYW0oImhhcmR3YXJlX2RvbSIsIGhhcmR3
YXJlX2QKPiAgIC8qIFByaXZhdGUgZG9tYWluIHN0cnVjdHMgZm9yIERPTUlEX1hFTiwgRE9NSURf
SU8sIGV0Yy4gKi8KPiAgIHN0cnVjdCBkb21haW4gKl9fcmVhZF9tb3N0bHkgZG9tX3hlbjsKPiAg
IHN0cnVjdCBkb21haW4gKl9fcmVhZF9tb3N0bHkgZG9tX2lvOwo+ICsjaWZkZWYgQ09ORklHX0hB
U19NRU1fU0hBUklORwo+ICAgc3RydWN0IGRvbWFpbiAqX19yZWFkX21vc3RseSBkb21fY293Owo+
ICsjZW5kaWYKPiAgIAo+ICAgc3RydWN0IHZjcHUgKmlkbGVfdmNwdVtOUl9DUFVTXSBfX3JlYWRf
bW9zdGx5Owo+ICAgCj4gQEAgLTU0Nyw2ICs1NDksNyBAQCB2b2lkIF9faW5pdCBzZXR1cF9zcGVj
aWFsX2RvbWFpbnModm9pZCkKPiAgICAgICBpZiAoIElTX0VSUihkb21faW8pICkKPiAgICAgICAg
ICAgcGFuaWMoIkZhaWxlZCB0byBjcmVhdGUgZFtJT106ICVsZFxuIiwgUFRSX0VSUihkb21faW8p
KTsKPiAgIAo+ICsjaWZkZWYgQ09ORklHX0hBU19NRU1fU0hBUklORwo+ICAgICAgIC8qCj4gICAg
ICAgICogSW5pdGlhbGlzZSBvdXIgQ09XIGRvbWFpbi4KPiAgICAgICAgKiBUaGlzIGRvbWFpbiBv
d25zIHNoYXJhYmxlIHBhZ2VzLgo+IEBAIC01NTQsNiArNTU3LDcgQEAgdm9pZCBfX2luaXQgc2V0
dXBfc3BlY2lhbF9kb21haW5zKHZvaWQpCj4gICAgICAgZG9tX2NvdyA9IGRvbWFpbl9jcmVhdGUo
RE9NSURfQ09XLCBOVUxMLCBmYWxzZSk7Cj4gICAgICAgaWYgKCBJU19FUlIoZG9tX2NvdykgKQo+
ICAgICAgICAgICBwYW5pYygiRmFpbGVkIHRvIGNyZWF0ZSBkW0NPV106ICVsZFxuIiwgUFRSX0VS
Uihkb21fY293KSk7Cj4gKyNlbmRpZgo+ICAgfQo+ICAgCj4gICB2b2lkIGRvbWFpbl91cGRhdGVf
bm9kZV9hZmZpbml0eShzdHJ1Y3QgZG9tYWluICpkKQo+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRf
dGFibGUuYwo+ICsrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwo+IEBAIC0xMDk1LDcgKzEw
OTUsNyBAQCBtYXBfZ3JhbnRfcmVmKAo+ICAgICAgICAgICAgICAgaG9zdF9tYXBfY3JlYXRlZCA9
IHRydWU7Cj4gICAgICAgICAgIH0KPiAgICAgICB9Cj4gLSAgICBlbHNlIGlmICggb3duZXIgPT0g
cmQgfHwgb3duZXIgPT0gZG9tX2NvdyApCj4gKyAgICBlbHNlIGlmICggb3duZXIgPT0gcmQgfHwg
KGRvbV9jb3cgJiYgb3duZXIgPT0gZG9tX2NvdykgKQo+ICAgICAgIHsKPiAgICAgICAgICAgaWYg
KCAob3AtPmZsYWdzICYgR05UTUFQX2RldmljZV9tYXApICYmICEob3AtPmZsYWdzICYgR05UTUFQ
X3JlYWRvbmx5KSApCj4gICAgICAgICAgIHsKPiAtLS0gYS94ZW4vaW5jbHVkZS94ZW4vbW0uaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9tbS5oCj4gQEAgLTY0Myw3ICs2NDMsMTIgQEAgc3RhdGlj
IGlubGluZSB2b2lkIGZpbHRlcmVkX2ZsdXNoX3RsYl9tYQo+ICAgfQo+ICAgCj4gICAvKiBQcml2
YXRlIGRvbWFpbiBzdHJ1Y3RzIGZvciBET01JRF9YRU4sIERPTUlEX0lPLCBldGMuICovCj4gLWV4
dGVybiBzdHJ1Y3QgZG9tYWluICpkb21feGVuLCAqZG9tX2lvLCAqZG9tX2NvdzsKPiArZXh0ZXJu
IHN0cnVjdCBkb21haW4gKmRvbV94ZW4sICpkb21faW87Cj4gKyNpZmRlZiBDT05GSUdfSEFTX01F
TV9TSEFSSU5HCj4gK2V4dGVybiBzdHJ1Y3QgZG9tYWluICpkb21fY293Owo+ICsjZWxzZQo+ICsj
IGRlZmluZSBkb21fY293IE5VTEwKPiArI2VuZGlmCj4gICAKPiAgIGVudW0gWEVOU0hBUkVfZmxh
Z3Mgewo+ICAgICAgIFNIQVJFX3J3LAo+IAo+IAo+IAo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
