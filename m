Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C3A16C262
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2020 14:32:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6aHu-0000di-4M; Tue, 25 Feb 2020 13:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=g8Eh=4N=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6aHt-0000da-0i
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2020 13:30:13 +0000
X-Inumbo-ID: f2cd7478-57d2-11ea-a490-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f2cd7478-57d2-11ea-a490-bc764e2007e4;
 Tue, 25 Feb 2020 13:30:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5D7FCAE35;
 Tue, 25 Feb 2020 13:30:11 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
 <dff6668838b61fb7fe508588bef91d650cddfeb5.1582310142.git.tamas.lengyel@intel.com>
 <20200224123922.GO4679@Air-de-Roger>
 <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <663c54cc-5f2d-27e9-2ca8-1e03a37a7922@suse.com>
Date: Tue, 25 Feb 2020 14:30:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=4j1Ktt7+QhhufrwF-0gLv9TXQ_qP=79C56h_Df6FzhA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 3/5] xen/mem_sharing: VM forking
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDIuMjAyMCAxNjo0NSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIE1vbiwgRmVi
IDI0LCAyMDIwIGF0IDU6MzkgQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOgo+PiBPbiBGcmksIEZlYiAyMSwgMjAyMCBhdCAxMDo0OToyMUFNIC0wODAwLCBU
YW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPj4+
ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+Pj4gQEAgLTUwOSw2ICs1MDksMTQgQEAgbWZu
X3QgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sIHVuc2lnbmVk
IGxvbmcgZ2ZuX2wsCj4+Pgo+Pj4gICAgICBtZm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbiwg
dCwgYSwgcSwgcGFnZV9vcmRlciwgTlVMTCk7Cj4+Pgo+Pj4gKyAgICAvKiBDaGVjayBpZiB3ZSBu
ZWVkIHRvIGZvcmsgdGhlIHBhZ2UgKi8KPj4+ICsgICAgaWYgKCAocSAmIFAyTV9BTExPQykgJiYg
cDJtX2lzX2hvbGUoKnQpICYmCj4+PiArICAgICAgICAgIW1lbV9zaGFyaW5nX2ZvcmtfcGFnZShw
Mm0tPmRvbWFpbiwgZ2ZuLCAhIShxICYgUDJNX1VOU0hBUkUpKSApCj4+PiArICAgIHsKPj4+ICsg
ICAgICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgZ2ZuLCB0LCBhLCBxLCBwYWdlX29yZGVy
LCBOVUxMKTsKPj4+ICsgICAgfQo+Pgo+PiBObyBuZWVkIGZvciB0aGUgYnJhY2VzLgo+IAo+IEkg
d291bGQga2VlcCB0aGVtLCBpdCBoZWxwcyB3aXRoIHJlYWRhYmlsaXR5IGluIHRoaXMgY2FzZS4K
CkkgYWdyZWUgd2l0aCBSb2dlciBoZXJlLCBmd2l3LgoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
