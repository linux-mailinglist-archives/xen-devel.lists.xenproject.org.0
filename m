Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07BA167F96
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 15:06:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j58sh-0005YF-3w; Fri, 21 Feb 2020 14:02:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P1D7=4J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j58sf-0005YA-90
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 14:02:13 +0000
X-Inumbo-ID: c1d4e6a8-54b2-11ea-ade5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1d4e6a8-54b2-11ea-ade5-bc764e2007e4;
 Fri, 21 Feb 2020 14:02:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6F416AE8C;
 Fri, 21 Feb 2020 14:02:11 +0000 (UTC)
To: Wei Xu <xuwei5@hisilicon.com>
References: <5E4F3EF4.4050701@hisilicon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
Date: Fri, 21 Feb 2020 15:02:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <5E4F3EF4.4050701@hisilicon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] ns16550: Add ACPI support for ARM only
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
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDIuMjAyMCAwMzoyMiwgV2VpIFh1IHdyb3RlOgo+IC0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jCj4gKysrIGIveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMKPiBAQCAtMTYy
MCw2ICsxNjIwLDg1IEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMxNjU1MCBVQVJUIiwg
REVWSUNFX1NFUklBTCkKPiAgRFRfREVWSUNFX0VORAo+IAo+ICAjZW5kaWYgLyogSEFTX0RFVklD
RV9UUkVFICovCj4gKwo+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5lZChDT05G
SUdfQVJNKQo+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPiArCj4gK3N0YXRpYyBpbnQgX19pbml0
IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0YSkKPiArewo+ICsgICAgc3Ry
dWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZTsKPiArICAgIHN0cnVjdCBhY3BpX3RhYmxlX3Nw
Y3IgKnNwY3I7Cj4gKyAgICBhY3BpX3N0YXR1cyBzdGF0dXM7Cj4gKyAgICAvKgo+ICsgICAgICog
U2FtZSBhcyB0aGUgRFQgcGFydC4KPiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBB
Uk0gd2hpY2ggaGFwcGVuIHRvIGJlIG5zMTY1NTBfY29tWzBdLgo+ICsgICAgICovCj4gKyAgICBz
dHJ1Y3QgbnMxNjU1MCAqdWFydCA9ICZuczE2NTUwX2NvbVswXTsKPiArCj4gKyAgICBzdGF0dXMg
PSBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19TUENSLCAwLCAmdGFibGUpOwo+ICsgICAgaWYgKCBB
Q1BJX0ZBSUxVUkUoc3RhdHVzKSApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUw
OiBGYWlsZWQgdG8gZ2V0IFNQQ1IgdGFibGVcbiIpOwo+ICsgICAgICAgIHJldHVybiAtRUlOVkFM
Owo+ICsgICAgfQo+ICsKPiArICAgIHNwY3IgPSBjb250YWluZXJfb2YodGFibGUsIHN0cnVjdCBh
Y3BpX3RhYmxlX3NwY3IsIGhlYWRlcik7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIFRoZSBzZXJp
YWwgcG9ydCBhZGRyZXNzIG1heSBiZSAwIGZvciBleGFtcGxlCj4gKyAgICAgKiBpZiB0aGUgY29u
c29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4KPiArICAgICAqLwo+ICsgICAgaWYgKCB1bmxp
a2VseSghc3Bjci0+c2VyaWFsX3BvcnQuYWRkcmVzcykgKQo+ICsgICAgewo+ICsgICAgICAgIHBy
aW50aygibnMxNjU1MDogQ29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZFxuIik7Cj4gKyAg
ICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICB9Cj4gKwo+ICsgICAgaWYgKCB1bmxpa2VseShz
cGNyLT5zZXJpYWxfcG9ydC5zcGFjZV9pZCAhPSBBQ1BJX0FEUl9TUEFDRV9TWVNURU1fTUVNT1JZ
KSApCj4gKyAgICB7Cj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBBZGRyZXNzIHNwYWNlIHR5
cGUgaXMgbm90IG1taW9cbiIpOwo+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ICsgICAgfQoK
VGhlIHNwYWNlX2lkIGZpZWxkIHF1YWxpZmllcyB0aGUgYWRkcmVzcyBvbmUsIGkuZS4gd2hldGhl
ciBhIHZhbHVlIG9mCnplcm8gY2FuIHNlbnNpYmx5IG1lYW4gImRpc2FibGVkIiBkZXBlbmRzIG9u
IHRoZSBhZGRyZXNzIHNwYWNlLiBIZW5jZQpsb2dpY2FsbHkgdGhlIGFkZHJlc3Mgc3BhY2UgY2hl
Y2sgc2hvdWxkIGNvbWUgZmlyc3QuCgpUaGlzIGlzIHRoZSBsYXN0IHRoaW5nIEknZCBsaWtlIHRv
IHNlZSBjaGFuZ2VkLiBJIHdvbid0IGdpdmUgdGhlCnBhdGNoIG15IGFjayB0aG91Z2gsIGFzIEkg
dGhpbmsgaXQgc2hvdWxkIGJlIGFuIEFybSBtYWludGFpbmVyIHRvIGFjawppdC4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
