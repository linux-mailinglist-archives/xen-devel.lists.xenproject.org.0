Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4BA6144BEF
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 07:48:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu9jA-00067s-D2; Wed, 22 Jan 2020 06:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4Syo=3L=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1iu9j9-00067n-6Y
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 06:42:59 +0000
X-Inumbo-ID: 697f2528-3ce2-11ea-bbe2-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.32])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 697f2528-3ce2-11ea-bbe2-12813bfff9fa;
 Wed, 22 Jan 2020 06:42:53 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 22B086371559894687E3;
 Wed, 22 Jan 2020 14:42:51 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 22 Jan 2020
 14:42:43 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E26738C.1060605@hisilicon.com>
 <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E27EEE2.2060402@hisilicon.com>
Date: Wed, 22 Jan 2020 14:42:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
Subject: Re: [Xen-devel] [PATCH v2] ns16550: Add ACPI support for ARM only
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
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAyMC8xLzIxIDE5OjEzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMS4w
MS4yMDIwIDA0OjQ0LCBXZWkgWHUgd3JvdGU6Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMx
NjU1MC5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1MC5jCj4+IEBAIC0xNjIwLDYg
KzE2MjAsNjYgQEAgRFRfREVWSUNFX1NUQVJUKG5zMTY1NTAsICJOUzE2NTUwIFVBUlQiLCBERVZJ
Q0VfU0VSSUFMKQo+PiAgIERUX0RFVklDRV9FTkQKPj4gICAKPj4gICAjZW5kaWYgLyogSEFTX0RF
VklDRV9UUkVFICovCj4+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5lZChDT05G
SUdfQVJNKQo+IAo+IEJsYW5rIGxpbmUgYWJvdmUgaGVyZSBwbGVhc2UuCgpPSy4KSSB3aWxsIGFk
ZCBpdC4KCj4gCj4+ICsjaW5jbHVkZSA8eGVuL2FjcGkuaD4KPj4gKwo+PiArc3RhdGljIGludCBf
X2luaXQgbnMxNjU1MF9hY3BpX3VhcnRfaW5pdChjb25zdCB2b2lkICpkYXRhKQo+PiArewo+PiAr
ICAgIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IgKnNwY3I7Cj4+ICsgICAgYWNwaV9zdGF0dXMgc3Rh
dHVzOwo+PiArCj4+ICsgICAgLyogU2FtZSBhcyB0aGUgRFQgcGFydC4KPiAKPiBDb21tZW50IHN0
eWxlIChhZ2FpbiBiZWxvdykuIEFsc28gdGhlcmUgc2hvdWxkbid0IGJlIGEgYmxhbmsgbGluZQo+
IHVudGlsIGFmdGVyIF9hbGxfIGRlY2xhcmF0aW9ucy4KCk9LLgpJIHdpbGwgYWRkIGEgc2VwYXJh
dGUgbGluZSBsZWFkaW5nIHdpdGggJyonIGFzIHRoZSBjb21tZW50IGJlZ2lubmluZwphbmQgcmVt
b3ZlIHRoZSBibGFuayBsaW5lIGluIHRoZSBkZWNsYXJhdGlvbnMuCgo+IAo+PiArICAgICAqIE9u
bHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBBUk0gd2hpY2ggaGFwcGVuIHRvIGJlIG5zMTY1NTBfY29t
WzBdLgo+PiArICAgICAqLwo+PiArICAgIHN0cnVjdCBuczE2NTUwICp1YXJ0ID0gJm5zMTY1NTBf
Y29tWzBdOwo+PiArCj4+ICsgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9TSUdfU1BD
UiwgMCwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAoc3RydWN0IGFjcGlfdGFibGVf
aGVhZGVyICoqKSZzcGNyKTsKPiAKPiBQbGVhc2UgYXZvaWQgY2FzdHMgbGlrZSB0aGlzLiBVc2Ug
bW9yZSB0eXBlLXNhZmUgY29uc3RydWN0cyBsaWtlCj4gY29udGFpbmVyX29mKCkgaW5zdGVhZC4K
PiAKPj4gKyAgICBpZiAoIEFDUElfRkFJTFVSRShzdGF0dXMpICkKPj4gKyAgICB7Cj4+ICsgICAg
ICAgIHByaW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKPiAKPiBJ
cyBzdWNoIGEgbWVzc2FnZSB3YXJyYW50ZWQ/IEkuZS4gd291bGRuJ3QgaXQgdHJpZ2dlciBvbiBh
bGwKPiBzeXN0ZW1zIG5vdCBoYXZpbmcgdGhlIHRhYmxlLCB3aGljaCBpcyBoYXJkbHkgd2hhdCB5
b3Uvd2Ugd2FudD8KPiAKPj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gCj4gQWxzbywgaXMg
aXQgcmVhbGx5IGFuIGVycm9yIGlmIHRoZXJlJ3Mgbm8gc3VjaCB0YWJsZT8KPiAKPj4gKyAgICB9
Cj4+ICsKPj4gKyAgICBuczE2NTUwX2luaXRfY29tbW9uKHVhcnQpOwo+PiArCj4+ICsgICAgLyog
VGhlIGJhdWQgcmF0ZSBpcyBwcmUtY29uZmlndXJlZCBieSB0aGUgZmlybXdhcmUuCj4+ICsgICAg
ICogQW5kIGN1cnJlbnRseSB0aGUgQUNQSSBwYXJ0IGlzIG9ubHkgdGFyZ2V0aW5nIEFSTSBzbyBz
b21lIGZpZWxkcwo+PiArICAgICAqIGxpa2UgUENJLCBmbG93IGNvbnRyb2wgYW5kIHNvIG9uIHdl
IGRvIG5vdCBjYXJlIHlldCBhcmUgaWdub3JlZC4KPj4gKyAgICAgKi8KPiAKPiBJJ20gbm8gY29u
dmluY2VkIHRob3VnaCB5b3UgY2FuIGlnbm9yZSBzb21lIG90aGVyIGZpZWxkcy4gSW4KPiBwYXJ0
aWN1bGFyIG9uIHYxIEkgcmVjYWxsIHBvaW50aW5nIG91dCB0aGF0IHRoZSBHQVMgc3RydWN0dXJl
Cj4gaGFzIG1vcmUgZmllbGRzIHlvdSBzaG91bGQgbG9vayBhdC4gKE92ZXJhbGwgSSdtIG5vdCBo
YXBweQo+IHdpdGggImFuZCBzbyBvbiIgaGVyZSAtIHBsZWFzZSBsaXN0IGFsbCBmaWVsZHMgeW91
IG1lYW4gdG8KPiBpZ25vcmUgc28gdGhhdCByZXZpZXdlcnMgYXMgd2VsbCBhcyBmdXR1cmUgcmVh
ZGVycyBjYW4ganVkZ2UKPiB3aGV0aGVyIHRoaXMgaXMgYXBwcm9wcmlhdGUuKQo+CgpPSy4KSSB3
aWxsIGludmVzdGlnYXRlIGFuZCBsaXN0IGFsbCB0aGUgaWdub3JlIGZpZWxkcy4KCj4+ICsgICAg
dWFydC0+YmF1ZCA9IEJBVURfQVVUTzsKPj4gKyAgICB1YXJ0LT5kYXRhX2JpdHMgPSA4Owo+PiAr
ICAgIHVhcnQtPnBhcml0eSA9IHNwY3ItPnBhcml0eTsKPj4gKyAgICB1YXJ0LT5zdG9wX2JpdHMg
PSBzcGNyLT5zdG9wX2JpdHM7Cj4+ICsgICAgdWFydC0+aW9fYmFzZSA9IHNwY3ItPnNlcmlhbF9w
b3J0LmFkZHJlc3M7Cj4+ICsgICAgdWFydC0+aW9fc2l6ZSA9IDg7Cj4+ICsgICAgdWFydC0+cmVn
X3NoaWZ0ID0gc3Bjci0+c2VyaWFsX3BvcnQuYml0X29mZnNldDsKPj4gKyAgICB1YXJ0LT5yZWdf
d2lkdGggPSAxOwo+PiArCj4+ICsgICAgLyogVGhlIHRyaWdnZXIvcG9sYXJpdHkgaW5mb3JtYXRp
b24gaXMgbm90IGF2YWlsYWJsZSBpbiBzcGNyLiAqLwo+PiArICAgIGlycV9zZXRfdHlwZShzcGNy
LT5pbnRlcnJ1cHQsIElSUV9UWVBFX0xFVkVMX0hJR0gpOwo+PiArICAgIHVhcnQtPmlycSA9IHNw
Y3ItPmludGVycnVwdDsKPj4gKwo+PiArICAgIHVhcnQtPnZ1YXJ0LmJhc2VfYWRkciA9IHVhcnQt
PmlvX2Jhc2U7Cj4+ICsgICAgdWFydC0+dnVhcnQuc2l6ZSA9IHVhcnQtPmlvX3NpemU7Cj4+ICsg
ICAgdWFydC0+dnVhcnQuZGF0YV9vZmYgPSBVQVJUX1RIUiA8PCB1YXJ0LT5yZWdfc2hpZnQ7Cj4+
ICsgICAgdWFydC0+dnVhcnQuc3RhdHVzX29mZiA9IFVBUlRfTFNSIDw8IHVhcnQtPnJlZ19zaGlm
dDsKPj4gKyAgICB1YXJ0LT52dWFydC5zdGF0dXMgPSBVQVJUX0xTUl9USFJFIHwgVUFSVF9MU1Jf
VEVNVDsKPj4gKwo+PiArICAgIC8qICBSZWdpc3RlciB3aXRoIGdlbmVyaWMgc2VyaWFsIGRyaXZl
ci4gKi8KPiAKPiBTdHJheSBkb3VibGUgYmxhbmtzIGF0IHRoZSBiZWdpbm5pbmcgb2YgdGhlIGNv
bW1lbnQuCj4KClNvcnJ5LCBJIHdpbGwgcmVtb3ZlIGl0LgoKPj4gKyAgICBzZXJpYWxfcmVnaXN0
ZXJfdWFydCh1YXJ0IC0gbnMxNjU1MF9jb20sICZuczE2NTUwX2RyaXZlciwgdWFydCk7Cj4gCj4g
SSBndWVzcyBpdCdzIGZpbmUgdGhpcyB3YXksIGJ1dCB3aXRoICJ1YXJ0ID0gJm5zMTY1NTBfY29t
WzBdIiBhYm92ZQo+IHRoZSBjb25zdHJ1Y3QgbG9va3MgbW9yZSBjb21wbGljYXRlZCB0aGFuIGl0
IG5lZWRzIHRvIGxvb2suCgpZZXMsIEkgY2FuIGNoYW5nZSB0byB1c2UgIlNFUkhORF9EVFVBUlQi
LgpUaGFua3MgZm9yIHlvdSBndWlkYW5jZSEKCkJlc3QgUmVnYXJkcywKV2VpCgo+IAo+IEphbgo+
IAo+IC4KPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
