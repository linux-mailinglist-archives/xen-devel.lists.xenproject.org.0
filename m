Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D164BB56A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:35:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCORT-00015F-FI; Mon, 23 Sep 2019 13:31:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XN81=XS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCORS-00015A-Nc
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:31:50 +0000
X-Inumbo-ID: 7efc49fc-de06-11e9-95fd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7efc49fc-de06-11e9-95fd-12813bfff9fa;
 Mon, 23 Sep 2019 13:31:49 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id A1D43AE3A;
 Mon, 23 Sep 2019 13:31:48 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-5-git-send-email-olekstysh@gmail.com>
 <81c2099d-ee08-2e0a-134c-0a9889748ac8@suse.com>
 <0021c5ab-457e-7cbf-a5c7-7d8676503116@gmail.com>
 <93811967-b49d-7a86-6d19-647cd0e8d1dd@suse.com>
 <4c2b6cca-5471-7430-0b29-fbd97c031074@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f890aba2-44d7-cdbd-5226-1705fedfd508@suse.com>
Date: Mon, 23 Sep 2019 15:31:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <4c2b6cca-5471-7430-0b29-fbd97c031074@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/8] xen/common: Introduce _xrealloc
 function
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxNDo1MCwgT2xla3NhbmRyIHdyb3RlOgo+IERvZXMgdGhlIGRpZmYgYmVs
b3cgaXMgY2xvc2UgdG8gd2hhdCB5b3UgbWVhbnQ/CgpBbG1vc3QuCgo+IEBAIC01OTgsMTAgKzYy
MSw3MCBAQCB2b2lkICpfeHphbGxvYyh1bnNpZ25lZCBsb25nIHNpemUsIHVuc2lnbmVkIGxvbmcg
YWxpZ24pCj4gIMKgwqDCoMKgIHJldHVybiBwID8gbWVtc2V0KHAsIDAsIHNpemUpIDogcDsKPiAg
wqB9Cj4gCj4gLXZvaWQgeGZyZWUodm9pZCAqcCkKPiArdm9pZCAqX3hyZWFsbG9jKHZvaWQgKnB0
ciwgdW5zaWduZWQgbG9uZyBzaXplLCB1bnNpZ25lZCBsb25nIGFsaWduKQo+ICDCoHsKPiAtwqDC
oMKgIHN0cnVjdCBiaGRyICpiOwo+ICvCoMKgwqAgdW5zaWduZWQgbG9uZyBjdXJyX3NpemUsIHRt
cF9zaXplOwo+ICvCoMKgwqAgdm9pZCAqcDsKPiArCj4gK8KgwqDCoCBpZiAoICFzaXplICkKPiAr
wqDCoMKgIHsKPiArwqDCoMKgwqDCoMKgwqAgeGZyZWUocHRyKTsKPiArwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIFpFUk9fQkxPQ0tfUFRSOwo+ICvCoMKgwqAgfQo+ICsKPiArwqDCoMKgIGlmICggcHRy
ID09IE5VTEwgfHwgcHRyID09IFpFUk9fQkxPQ0tfUFRSICkKPiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIF94bWFsbG9jKHNpemUsIGFsaWduKTsKPiArCj4gK8KgwqDCoCBBU1NFUlQoKGFsaWduICYg
KGFsaWduIC0gMSkpID09IDApOwo+ICvCoMKgwqAgaWYgKCBhbGlnbiA8IE1FTV9BTElHTiApCj4g
K8KgwqDCoMKgwqDCoMKgIGFsaWduID0gTUVNX0FMSUdOOwo+ICsKPiArwqDCoMKgIHRtcF9zaXpl
ID0gc2l6ZSArIGFsaWduIC0gTUVNX0FMSUdOOwo+ICsKPiArwqDCoMKgIGlmICggdG1wX3NpemUg
PCBQQUdFX1NJWkUgKQo+ICvCoMKgwqDCoMKgwqDCoCB0bXBfc2l6ZSA9ICh0bXBfc2l6ZSA8IE1J
Tl9CTE9DS19TSVpFKSA/IE1JTl9CTE9DS19TSVpFIDoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBST1VORFVQX1NJWkUodG1wX3NpemUpOwo+ICsKPiArwqDCoMKgIGlmICggISgodW5zaWduZWQg
bG9uZylwdHIgJiAoUEFHRV9TSVpFIC0gMSkpICkKPiArwqDCoMKgIHsKPiArwqDCoMKgwqDCoMKg
wqAgY3Vycl9zaXplID0gKHVuc2lnbmVkIGxvbmcpUEZOX09SREVSKHZpcnRfdG9fcGFnZShwdHIp
KSA8PCBQQUdFX1NISUZUOwo+ICsKPiArwqDCoMKgwqDCoMKgwqAgaWYgKCB0bXBfc2l6ZSA8PSBj
dXJyX3NpemUgJiYgKCh1bnNpZ25lZCBsb25nKXB0ciAmIChhbGlnbiAtIDEpKSA9PSAwICkKCllv
dSBtZWFuICJzaXplIiBoZXJlIEkgdGhpbmssIG5vdCAidG1wX3NpemUiLiBTZWUgaG93IHhtYWxs
b2Nfd2hvbGVfcGFnZXMoKQpnZXRzIGNhbGxlZCBmcm9tIF94bWFsbG9jKCkgd2l0aCBhbiAiYWRq
dXN0ZWQgYmFjayIgdmFsdWUuCgpBbmQgYXMgc2FpZCwgcGxlYXNlIGNsZWFuIHVwIHRoZSBjb2Rl
IHlvdSBtb3ZlIG9yIGFkZCBhbmV3OiBVc2UgY2FzdHMKb25seSB3aGVyZSByZWFsbHkgbmVlZGVk
LCB0cmFuc2Zvcm0gdHlwZXMgdG8gYXBwcm9wcmlhdGUgIm1vZGVybiIgb25lcywKZXRjLgoKSmFu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
