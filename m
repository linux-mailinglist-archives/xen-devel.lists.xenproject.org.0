Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F0B1658AF
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 08:47:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4gW6-0008CM-18; Thu, 20 Feb 2020 07:45:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v0S7=4I=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j4gW4-0008CH-CI
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 07:45:00 +0000
X-Inumbo-ID: e38df95a-53b4-11ea-84e2-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e38df95a-53b4-11ea-84e2-12813bfff9fa;
 Thu, 20 Feb 2020 07:44:58 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 45D6DA976423107A5F7F;
 Thu, 20 Feb 2020 15:44:55 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 20 Feb 2020
 15:44:48 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E38023B.8090306@hisilicon.com>
 <4824cb1a-c920-e2be-c603-185c0bfdb66e@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E4E38F0.6000403@hisilicon.com>
Date: Thu, 20 Feb 2020 15:44:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <4824cb1a-c920-e2be-c603-185c0bfdb66e@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH v3] ns16550: Add ACPI support for ARM only
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

SGkgSmFuLAoKT24gMjAyMC8yLzE3IDIxOjUzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAwMy4w
Mi4yMDIwIDEyOjIxLCBXZWkgWHUgd3JvdGU6Cj4+IFBhcnNlIHRoZSBBQ1BJIFNQQ1IgdGFibGUg
YW5kIGluaXRpYWxpemUgdGhlIDE2NTUwIGNvbXBhdGlibGUgc2VyaWFsIHBvcnQKPj4gZm9yIEFS
TSBvbmx5LiBDdXJyZW50bHkgd2Ugb25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTS4gU29tZSBm
aWVsZHMKPj4gd2hpY2ggd2UgZG8gbm90IGNhcmUgeWV0IG9uIEFSTSBhcmUgaWdub3JlZC4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogV2VpIFh1IDx4dXdlaTVAaGlzaWxpY29uLmNvbT4KPj4KPj4gLS0t
Cj4+IENoYW5nZXMgaW4gdjM6Cj4+IC0gYWRkcmVzcyB0aGUgY29kZSBzdHlsZSBjb21tZW50cyBm
cm9tIEphbgo+PiAtIHVzZSBjb250YWluZXJfb2YgdG8gZG8gY2FzdAo+PiAtIGxpc3QgYWxsIGZp
ZWxkcyB3ZSBpZ25vcmVkCj4+IC0gY2hlY2sgdGhlIGNvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlz
YWJsZWQgb3Igbm90IGJlZm9yZSBpbml0IHRoZSB1YXJ0Cj4+IC0gaW5pdCB0aGUgdWFydCBpb19z
aXplIGFuZCB3aWR0aCB2aWEgc3Bjci0+c2VyaWFsX3BvcnQKPj4KPj4gQ2hhbmdlcyBpbiB2MjoK
Pj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCj4+IC0gcmVtb3ZlIHRoZSBzcGNyIGluaXRpYWxp
emF0aW9uCj4+IC0gYWRkIGNvbW1lbnRzIGZvciB0aGUgdWFydCBpbml0aWFsaXphdGlvbiBhbmQg
Y29uZmlndXJhdGlvbgo+PiAtIGFkanVzdCB0aGUgY29kZSBzdHlsZSBpc3N1ZQo+PiAtIGxpbWl0
IHRoZSBjb2RlIG9ubHkgYnVpbHQgb24gQUNQSSBhbmQgQVJNCj4+IC0tLQo+PiAgeGVuL2RyaXZl
cnMvY2hhci9uczE2NTUwLmMgfCA3NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQo+Pgo+PiBk
aWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvY2hhci9uczE2NTUwLmMgYi94ZW4vZHJpdmVycy9jaGFy
L25zMTY1NTAuYwo+PiBpbmRleCBhYTg3YzU3Li43NDFiNTEwIDEwMDY0NAo+PiAtLS0gYS94ZW4v
ZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAu
Ywo+PiBAQCAtMTYyMCw2ICsxNjIwLDgxIEBAIERUX0RFVklDRV9TVEFSVChuczE2NTUwLCAiTlMx
NjU1MCBVQVJUIiwgREVWSUNFX1NFUklBTCkKPj4gIERUX0RFVklDRV9FTkQKPj4KPj4gICNlbmRp
ZiAvKiBIQVNfREVWSUNFX1RSRUUgKi8KPj4gKwo+PiArI2lmIGRlZmluZWQoQ09ORklHX0FDUEkp
ICYmIGRlZmluZWQoQ09ORklHX0FSTSkKPj4gKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPgo+PiArCj4+
ICtzdGF0aWMgaW50IF9faW5pdCBuczE2NTUwX2FjcGlfdWFydF9pbml0KGNvbnN0IHZvaWQgKmRh
dGEpCj4+ICt7Cj4+ICsgICAgc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZTsKPj4gKyAg
ICBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyICpzcGNyOwo+PiArICAgIGFjcGlfc3RhdHVzIHN0YXR1
czsKPj4gKyAgICAvKgo+PiArICAgICAqIFNhbWUgYXMgdGhlIERUIHBhcnQuCj4+ICsgICAgICog
T25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTSB3aGljaCBoYXBwZW4gdG8gYmUgbnMxNjU1MF9j
b21bMF0uCj4+ICsgICAgICovCj4+ICsgICAgc3RydWN0IG5zMTY1NTAgKnVhcnQgPSAmbnMxNjU1
MF9jb21bMF07Cj4+ICsKPj4gKyAgICBzdGF0dXMgPSBhY3BpX2dldF90YWJsZShBQ1BJX1NJR19T
UENSLCAwLCAmdGFibGUpOwo+PiArICAgIGlmICggQUNQSV9GQUlMVVJFKHN0YXR1cykgKQo+PiAr
ICAgIHsKPj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQgdG8gZ2V0IFNQQ1IgdGFi
bGVcbiIpOwo+PiArICAgICAgICByZXR1cm4gLUVJTlZBTDsKPj4gKyAgICB9Cj4+ICsKPj4gKyAg
ICBzcGNyID0gY29udGFpbmVyX29mKHRhYmxlLCBzdHJ1Y3QgYWNwaV90YWJsZV9zcGNyLCBoZWFk
ZXIpOwo+PiArCj4+ICsgICAgLyoKPj4gKyAgICAgKiBUaGUgc2VyaWFsIHBvcnQgYWRkcmVzcyBt
YXkgYmUgMCBmb3IgZXhhbXBsZQo+PiArICAgICAqIGlmIHRoZSBjb25zb2xlIHJlZGlyZWN0aW9u
IGlzIGRpc2FibGVkLgo+PiArICAgICAqLwo+PiArICAgIGlmICggdW5saWtlbHkoIXNwY3ItPnNl
cmlhbF9wb3J0LmFkZHJlc3MpICkKPj4gKyAgICB7Cj4+ICsgICAgICAgIHByaW50aygibnMxNjU1
MDogdGhlIHNlcmlhbCBwb3J0IGFkZHJlc3MgaXMgaW52YWxpZFxuIik7Cj4gCj4gSXMgemVybyBy
ZWFsbHkgYW4gaW52YWxpZCBhZGRyZXNzLCBvciBpcyBpdCByYXRoZXIgYSBwcm9wZXIKPiBpbmRp
Y2F0b3Igb2YgdGhlcmUgbm90IGJlaW5nIGFueSBkZXZpY2U/CgpJIHdpbGwgY2hhbmdlIHRoZSBt
c2cgdG8gIlRoZSBjb25zb2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVkLiIgZm9sbG93aW5nIHRo
ZSBkZXNjcmlwdGlvbiBpbiB0aGUgc3Bjci4KSXMgdGhhdCBPSz8KCj4gCj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+PiArICAgIH0KPj4gKwo+PiArICAgIG5zMTY1NTBfaW5pdF9jb21tb24o
dWFydCk7Cj4+ICsKPj4gKyAgICAvKgo+PiArICAgICAqIFRoZSBiYXVkIHJhdGUgaXMgcHJlLWNv
bmZpZ3VyZWQgYnkgdGhlIGZpcm13YXJlLgo+IAo+IEJ1dCB0aGlzIGlzbid0IHRoZSBzYW1lIGFz
IEJBVURfQVVUTywgaXMgaXQ/IElmIGZpcm13YXJlIHByZS1jb25maWd1cmVzCj4gdGhlIGJhdWQg
cmF0ZSwgaXNuJ3QgaXQgdGhpcyBzdHJ1Y3R1cmUgd2hpY2ggaXQgd291bGQgdXNlIHRvIGNvbW11
bmljYXRlCj4gdGhlIGluZm9ybWF0aW9uPwo+CgpObywgdGhlIGNvbW1lbnRzIG9mIHRoZSBCQVVE
X0FVVE8gc3RhdGVkIGxpa2UgdGhhdAphbmQgaW4gZmFjdCB0aGUgYmF1ZCByYXRlIGlzIG5vdCBj
aGFuZ2VkIGFmdGVyIHRoZSBmaXJtbXdhcmUuCkJ1dCBJIGNhbiBhZGQgdGhlIGJhdWQgc2V0dGlu
ZyBpZiB5b3UgcHJlZmVyIHRvLgoKPj4gKyAgICAgKiBBbmQgY3VycmVudGx5IHRoZSBBQ1BJIHBh
cnQgaXMgb25seSB0YXJnZXRpbmcgQVJNIHNvIHRoZSBmb2xsb3dpbmcKPj4gKyAgICAgKiBmaWVs
ZHMgcGNfaW50ZXJydXB0LCBwY2lfZGV2aWNlX2lkLCBwY2lfdmVuZG9yX2lkLCBwY2lfYnVzLCBw
Y2lfZGV2aWNlLAo+PiArICAgICAqIHBjaV9mdW5jdGlvbiwgcGNpX2ZsYWdzLCBwY2lfc2VnbWVu
dCBhbmQgZmxvd19jb250cm9sIHdoaWNoIHdlIGRvIG5vdAo+PiArICAgICAqIGNhcmUgeWV0IGFy
ZSBpZ25vcmVkLgo+IAo+IEhvdyBjb21lIGZsb3cgY29udHJvbCBpcyBvZiBubyBpbnRlcmVzdD8K
ClRoZXJlIGlzIG5vIGZsb3cgY29udHJvbCBpbiB0aGUgRFRTIHBhcnQgYW5kIHNhbWUgZm9yIEFD
UEkgb24gQVJNIHBsYXRmb3JtLgoKPiAKPiBJJ2QgYWxzbyBncm91cCBhbGwgdGhlIHBjaV8qIGZp
ZWxkcyBpbnRvIGEgc2ltcGxlICJhbmQgYWxsIFBDSSByZWxhdGVkCj4gb25lcyIuCgpPSy4KCj4g
Cj4+ICsgICAgICovCj4+ICsgICAgdWFydC0+YmF1ZCA9IEJBVURfQVVUTzsKPj4gKyAgICB1YXJ0
LT5kYXRhX2JpdHMgPSA4Owo+PiArICAgIHVhcnQtPnBhcml0eSA9IHNwY3ItPnBhcml0eTsKPj4g
KyAgICB1YXJ0LT5zdG9wX2JpdHMgPSBzcGNyLT5zdG9wX2JpdHM7Cj4+ICsgICAgdWFydC0+aW9f
YmFzZSA9IHNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3M7Cj4+ICsgICAgdWFydC0+aW9fc2l6ZSA9
IHNwY3ItPnNlcmlhbF9wb3J0LmJpdF93aWR0aDsKPiAKPiBPbmNlIGFnYWluOiBZb3Ugc2hvdWxk
IG5vdCBpZ25vcmUgdGhlIEdBUyBhZGRyZXNzIHNwYWNlIGluZGljYXRvci4KClNvcnJ5LCBJIGRp
ZCBub3QgZ2V0IHRoZSBwb2ludC4KRG8geW91IG1lYW4gY2hlY2sgdGhlIGFkZHJlc3MgaXMgMCBv
ciBub3Q/ClRoYW5rcyEKCkJlc3QgUmVnYXJkcywKV2VpCgo+IAo+IEphbgo+IAo+IC4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
