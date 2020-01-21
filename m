Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6A4143BA2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:06:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itrJ4-00012L-1y; Tue, 21 Jan 2020 11:02:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itrJ3-00012E-3R
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:02:49 +0000
X-Inumbo-ID: 8e8242a6-3c3d-11ea-ba72-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e8242a6-3c3d-11ea-ba72-12813bfff9fa;
 Tue, 21 Jan 2020 11:02:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0EA03AF73;
 Tue, 21 Jan 2020 11:02:46 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E26C935.9080107@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c15dab3d-3c25-4d14-506a-a6859a5dd99b@suse.com>
Date: Tue, 21 Jan 2020 12:02:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <5E26C935.9080107@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm/acpi: Add __acpi_unmap_table function
 for ARM
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org,
 Volodymyr_Babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMDo0OSwgV2VpIFh1IHdyb3RlOgo+IEFkZCBfX2FjcGlfdW5tYXBfdGFi
bGUgZnVuY3Rpb24gZm9yIEFSTSBhbmQgaW52b2tlIGl0IGF0IGFjcGlfb3NfdW5tYXBfbWVtb3J5
Cj4gdG8gbWFrZSBzdXJlIHRoZSByZWxhdGVkIGZpeG1hcCBoYXMgYmVlbiBjbGVhcmVkIGJlZm9y
ZSB1c2luZyBpdCBmb3IgYQo+IGRpZmZlcmVudCBtYXBwaW5nLgoKSG93IGNhbiBpdCBwb3NzaWJs
eSBiZSB0aGF0IHRoaXMgaXMgbmVlZGVkIGZvciBBcm0gb25seT8KCj4gLS0tIGEveGVuL2FyY2gv
YXJtL2FjcGkvbGliLmMKPiArKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9saWIuYwo+IEBAIC00OSw2
ICs0OSwzMSBAQCBjaGFyICpfX2FjcGlfbWFwX3RhYmxlKHBhZGRyX3QgcGh5cywgdW5zaWduZWQg
bG9uZyBzaXplKQo+ICAgICAgIHJldHVybiAoKGNoYXIgKikgYmFzZSArIG9mZnNldCk7Cj4gICB9
Cj4gICAKPiArdm9pZCBfX2FjcGlfdW5tYXBfdGFibGUodm9pZCBfX2lvbWVtICogdmlydCwgdW5z
aWduZWQgbG9uZyBzaXplKQo+ICt7Cj4gKyAgICB1bnNpZ25lZCBsb25nIGJhc2UsIGVuZDsKPiAr
ICAgIGludCBpZHg7Cgp1bnNpZ25lZCBpbnQKCj4gKyAgICBiYXNlID0gRklYTUFQX0FERFIoRklY
TUFQX0FDUElfQkVHSU4pOwo+ICsgICAgZW5kID0gRklYTUFQX0FERFIoRklYTUFQX0FDUElfRU5E
KTsKPiArCj4gKyAgICBpZiAoICh1bnNpZ25lZCBsb25nKXZpcnQgPCBiYXNlIHx8ICh1bnNpZ25l
ZCBsb25nKXZpcnQgPiBlbmQgKQo+ICsgICAgewo+ICsgICAgICAgIHJldHVybjsKPiArICAgIH0K
ClN0cmF5IGJyYWNlcy4KCj4gLS0tIGEveGVuL2RyaXZlcnMvYWNwaS9vc2wuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL2FjcGkvb3NsLmMKPiBAQCAtMTE0LDYgKzExNCw4IEBAIHZvaWQgYWNwaV9vc191
bm1hcF9tZW1vcnkodm9pZCBfX2lvbWVtICogdmlydCwgYWNwaV9zaXplIHNpemUpCj4gICAJCXJl
dHVybjsKPiAgIAl9Cj4gICAKPiArCV9fYWNwaV91bm1hcF90YWJsZSh2aXJ0LCBzaXplKTsKPiAr
Cj4gICAJaWYgKHN5c3RlbV9zdGF0ZSA+PSBTWVNfU1RBVEVfYm9vdCkKPiAgIAkJdnVubWFwKCh2
b2lkICopKCh1bnNpZ25lZCBsb25nKXZpcnQgJiBQQUdFX01BU0spKTsKCkhvdyBjYW4gaXQgcG9z
c2libHkgYmUgY29ycmVjdCB0byBjYWxsIGJvdGggdnVubWFwKCkgYW5kIHlvdXIgbmV3CmZ1bmN0
aW9uPyBBbmQgaG93IGlzIHRoaXMsIGhhdmluZyBqc3V0IGFuIEFybSBpbXBsZW1lbnRhdGlvbiwK
Z29pbmcgdG8gY29tcGlsZSBmb3IgeDg2PyBTZWVpbmcgdGhhdCB4ODYgZ2V0cyBhd2F5IHdpdGhv
dXQgdGhpcywKbWF5IEkgc3VnZ2VzdCB0aGF0IHlvdSBsb29rIGF0IHRoZSB4ODYgY29kZSB0byBz
ZWUgd2h5IHRoYXQgaXMsCmFuZCB0aGVuIGNvbnNpZGVyIHdoZXRoZXIgdGhlIHNhbWUgbW9kZWwg
bWFrZXMgc2Vuc2UgZm9yIEFybT8gQW5kCmlmIGl0IGRvZXNuJ3QsIGNoZWNrIHdoZXRoZXIgdGhl
IG5ldyBBcm0gbW9kZWwgd291bGQgbWFrZSBzZW5zZQp0byBhbHNvIHVzZSBvbiB4ODY/Cgo+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9hY3BpLmgKPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vYWNwaS5o
Cj4gQEAgLTY4LDYgKzY4LDcgQEAgdHlwZWRlZiBpbnQgKCphY3BpX3RhYmxlX2VudHJ5X2hhbmRs
ZXIpIChzdHJ1Y3QgYWNwaV9zdWJ0YWJsZV9oZWFkZXIgKmhlYWRlciwgY28KPiAgIAo+ICAgdW5z
aWduZWQgaW50IGFjcGlfZ2V0X3Byb2Nlc3Nvcl9pZCAodW5zaWduZWQgaW50IGNwdSk7Cj4gICBj
aGFyICogX19hY3BpX21hcF90YWJsZSAocGFkZHJfdCBwaHlzX2FkZHIsIHVuc2lnbmVkIGxvbmcg
c2l6ZSk7Cj4gK3ZvaWQgX19hY3BpX3VubWFwX3RhYmxlKHZvaWQgX19pb21lbSAqIHZpcnQsIHVu
c2lnbmVkIGxvbmcgc2l6ZSk7Cj4gICBpbnQgYWNwaV9ib290X2luaXQgKHZvaWQpOwo+ICAgaW50
IGFjcGlfYm9vdF90YWJsZV9pbml0ICh2b2lkKTsKPiAgIGludCBhY3BpX251bWFfaW5pdCAodm9p
ZCk7CgpCZXN0IG5vdGljYWJsZSBoZXJlLCB5b3VyIG1haWxlciBoYXMgbWFuZ2xlZCB0aGUgcGF0
Y2guIFRoZSB3YXkKb2YgdGhpcyBtYW5nbGluZyBtYWtlcyBtZSBndWVzcyB5b3UgdXNlZCBUaHVu
ZGVyYmlyZCB0byBzZW5kIHRoZQpwYXRjaCwgaW4gd2hpY2ggY2FzZSB5b3UnbGwgbmVlZCB0byBh
ZGp1c3QgaXRzIHNldHRpbmdzIChpaXJjIGl0CndhcyBtYWlsbmV3cy53cmFwbGVuZ3RoIHdoaWNo
IG5lZWRlZCBzZXR0aW5nIHRvIHplcm8pLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
