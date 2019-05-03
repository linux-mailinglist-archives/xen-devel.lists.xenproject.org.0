Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4691A1320A
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:20:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMasJ-0002g0-Pp; Fri, 03 May 2019 16:17:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vigr=TD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hMasH-0002fo-Fv
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 16:17:25 +0000
X-Inumbo-ID: eefc4cb0-6dbe-11e9-817b-e7915d0b0e91
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id eefc4cb0-6dbe-11e9-817b-e7915d0b0e91;
 Fri, 03 May 2019 16:17:23 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5A17374;
 Fri,  3 May 2019 09:17:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE76A3F557;
 Fri,  3 May 2019 09:17:21 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-7-julien.grall@arm.com>
 <da08e713-f660-3207-ec2b-381dfec5631a@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5c638139-c643-ce9f-f33c-a72d3c327ed4@arm.com>
Date: Fri, 3 May 2019 17:17:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <da08e713-f660-3207-ec2b-381dfec5631a@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 06/20] xen/arm: Remove parameter cpuid from
 start_xen
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wNS8yMDE5IDE2OjU2LCBBbmRyaWkgQW5pc292IHdyb3RlOgo+IE9uIDIyLjA0
LjE5IDE5OjQ5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoZSBwYXJhbWV0ZXIgY3B1aWQgaXMg
bm90IHVzZWQgYnkgc3RhcnRfeGVuLiBTbyByZW1vdmUgaXQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiDCoCB4ZW4vYXJj
aC9hcm0vYXJtMzIvaGVhZC5TIHwgMSAtCj4+IMKgIHhlbi9hcmNoL2FybS9hcm02NC9oZWFkLlMg
fCAxIC0KPj4gwqAgeGVuL2FyY2gvYXJtL3NldHVwLmPCoMKgwqDCoMKgIHwgMyArLS0KPj4gwqAg
MyBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgYi94ZW4vYXJjaC9hcm0vYXJtMzIv
aGVhZC5TCj4+IGluZGV4IGI3MWQ3ZmIxMWQuLjlmNDBmYWNlOTggMTAwNjQ0Cj4+IC0tLSBhL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPj4gKysrIGIveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQu
Uwo+PiBAQCAtNDQ4LDcgKzQ0OCw2IEBAIGxhdW5jaDoKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIHRl
ccKgwqAgcjEyLCAjMAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbW92ZXEgcjAsIHIxMMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNYXJzaGFsIGFyZ3M6IC0gcGh5c19vZmZzZXQgKi8K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIG1vdmVxIHIxLCByOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC8qwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIERUQiBhZGRyZXNzICov
Cj4+IC3CoMKgwqDCoMKgwqDCoCBtb3ZlcSByMiwgcjfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAvKsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBDUFUgSUQgKi8KPiAKPiBJ
IGRvbid0IHJlYWxseSBsaWtlIG1ha2luZyBjaGFuZ2VzIHdoaWNoIGFyZSB0aGVuIGZpeGVkIGlu
IG5leHQgcGF0Y2hlcy4KPiBJJ2QgbGlrZSB0byBzZWUgaXQgY291cGxlZCB0aGlzIHdpdGggdGhl
IHByZXZpb3VzIHBhdGNoLgoKVGhleSBhcmUgdHdvIGRpZmZlcmVudCBjaGFuZ2VzLi4uIG9uZSBk
ZWFsIHdpdGggc3RhcnRfeGVuIHRoZSBvdGhlciBkZWFsIHdpdGggCnNlY29uZGFyeV9zdGFydC4K
CkkgY2FuIG9mZmVyIHRvIHJlc2h1ZmZsZSB0aGUgcGF0Y2hlcyBzbyB0aGlzIG9uZSBpcyBiZWZv
cmUgIzUsIGJ1dCBub3QgbWVyZ2UgdGhlbS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
