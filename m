Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C36165B0C
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 11:02:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4icN-0005tp-TB; Thu, 20 Feb 2020 09:59:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=v0S7=4I=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j4icM-0005tf-WF
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 09:59:39 +0000
X-Inumbo-ID: b13fe46e-53c7-11ea-84f2-12813bfff9fa
Received: from huawei.com (unknown [45.249.212.191])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b13fe46e-53c7-11ea-84f2-12813bfff9fa;
 Thu, 20 Feb 2020 09:59:34 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 64E49558121ACC236057;
 Thu, 20 Feb 2020 17:59:31 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Thu, 20 Feb 2020
 17:59:22 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E38023B.8090306@hisilicon.com>
 <4824cb1a-c920-e2be-c603-185c0bfdb66e@suse.com>
 <5E4E38F0.6000403@hisilicon.com>
 <d723ed36-a38d-63c3-07ea-97a2c97f6c9c@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E4E587A.1070807@hisilicon.com>
Date: Thu, 20 Feb 2020 17:59:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <d723ed36-a38d-63c3-07ea-97a2c97f6c9c@suse.com>
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

SGkgSmFuLAoKT24gMjAyMC8yLzIwIDE2OjMzLCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyMC4w
Mi4yMDIwIDA4OjQ0LCBXZWkgWHUgd3JvdGU6Cj4+IE9uIDIwMjAvMi8xNyAyMTo1MywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAwMy4wMi4yMDIwIDEyOjIxLCBXZWkgWHUgd3JvdGU6Cj4+Pj4g
K3N0YXRpYyBpbnQgX19pbml0IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0
YSkKPj4+PiArewo+Pj4+ICsgICAgc3RydWN0IGFjcGlfdGFibGVfaGVhZGVyICp0YWJsZTsKPj4+
PiArICAgIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IgKnNwY3I7Cj4+Pj4gKyAgICBhY3BpX3N0YXR1
cyBzdGF0dXM7Cj4+Pj4gKyAgICAvKgo+Pj4+ICsgICAgICogU2FtZSBhcyB0aGUgRFQgcGFydC4K
Pj4+PiArICAgICAqIE9ubHkgc3VwcG9ydCBvbmUgVUFSVCBvbiBBUk0gd2hpY2ggaGFwcGVuIHRv
IGJlIG5zMTY1NTBfY29tWzBdLgo+Pj4+ICsgICAgICovCj4+Pj4gKyAgICBzdHJ1Y3QgbnMxNjU1
MCAqdWFydCA9ICZuczE2NTUwX2NvbVswXTsKPj4+PiArCj4+Pj4gKyAgICBzdGF0dXMgPSBhY3Bp
X2dldF90YWJsZShBQ1BJX1NJR19TUENSLCAwLCAmdGFibGUpOwo+Pj4+ICsgICAgaWYgKCBBQ1BJ
X0ZBSUxVUkUoc3RhdHVzKSApCj4+Pj4gKyAgICB7Cj4+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2
NTUwOiBGYWlsZWQgdG8gZ2V0IFNQQ1IgdGFibGVcbiIpOwo+Pj4+ICsgICAgICAgIHJldHVybiAt
RUlOVkFMOwo+Pj4+ICsgICAgfQo+Pj4+ICsKPj4+PiArICAgIHNwY3IgPSBjb250YWluZXJfb2Yo
dGFibGUsIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IsIGhlYWRlcik7Cj4+Pj4gKwo+Pj4+ICsgICAg
LyoKPj4+PiArICAgICAqIFRoZSBzZXJpYWwgcG9ydCBhZGRyZXNzIG1heSBiZSAwIGZvciBleGFt
cGxlCj4+Pj4gKyAgICAgKiBpZiB0aGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4K
Pj4+PiArICAgICAqLwo+Pj4+ICsgICAgaWYgKCB1bmxpa2VseSghc3Bjci0+c2VyaWFsX3BvcnQu
YWRkcmVzcykgKQo+Pj4+ICsgICAgewo+Pj4+ICsgICAgICAgIHByaW50aygibnMxNjU1MDogdGhl
IHNlcmlhbCBwb3J0IGFkZHJlc3MgaXMgaW52YWxpZFxuIik7Cj4+Pgo+Pj4gSXMgemVybyByZWFs
bHkgYW4gaW52YWxpZCBhZGRyZXNzLCBvciBpcyBpdCByYXRoZXIgYSBwcm9wZXIKPj4+IGluZGlj
YXRvciBvZiB0aGVyZSBub3QgYmVpbmcgYW55IGRldmljZT8KPj4KPj4gSSB3aWxsIGNoYW5nZSB0
aGUgbXNnIHRvICJUaGUgY29uc29sZSByZWRpcmVjdGlvbiBpcyBkaXNhYmxlZC4iIGZvbGxvd2lu
ZyB0aGUgZGVzY3JpcHRpb24gaW4gdGhlIHNwY3IuCj4+IElzIHRoYXQgT0s/Cj4gCj4gV2l0aCB0
aGUgIlRoZSIgcHJlZmVyYWJseSBkcm9wcGVkLCB5ZXMuCj4gCgpHb3QgaXQuCgo+Pj4+ICsgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICsgICAgfQo+Pj4+ICsKPj4+PiArICAgIG5zMTY1NTBf
aW5pdF9jb21tb24odWFydCk7Cj4+Pj4gKwo+Pj4+ICsgICAgLyoKPj4+PiArICAgICAqIFRoZSBi
YXVkIHJhdGUgaXMgcHJlLWNvbmZpZ3VyZWQgYnkgdGhlIGZpcm13YXJlLgo+Pj4KPj4+IEJ1dCB0
aGlzIGlzbid0IHRoZSBzYW1lIGFzIEJBVURfQVVUTywgaXMgaXQ/IElmIGZpcm13YXJlIHByZS1j
b25maWd1cmVzCj4+PiB0aGUgYmF1ZCByYXRlLCBpc24ndCBpdCB0aGlzIHN0cnVjdHVyZSB3aGlj
aCBpdCB3b3VsZCB1c2UgdG8gY29tbXVuaWNhdGUKPj4+IHRoZSBpbmZvcm1hdGlvbj8KPj4+Cj4+
Cj4+IE5vLCB0aGUgY29tbWVudHMgb2YgdGhlIEJBVURfQVVUTyBzdGF0ZWQgbGlrZSB0aGF0Cj4+
IGFuZCBpbiBmYWN0IHRoZSBiYXVkIHJhdGUgaXMgbm90IGNoYW5nZWQgYWZ0ZXIgdGhlIGZpcm1t
d2FyZS4KPiAKPiBPaCwgSSBzZWUuIEkgc2hvdWxkIGhhdmUgY2hlY2tlZCB0aGUgY29tbWVudCBp
bnN0ZWFkIG9mIGltcGx5aW5nCj4gbWVhbmluZyBhc3NpZ25lZCB0byBzaW1pbGFybHkgbmFtZWQg
dGhpbmdzIGVsc2V3aGVyZS4gS2VlcCBhcyBpcy4KPiAKCkdvdCBpdC4KCj4+Pj4gKyAgICAgKi8K
Pj4+PiArICAgIHVhcnQtPmJhdWQgPSBCQVVEX0FVVE87Cj4+Pj4gKyAgICB1YXJ0LT5kYXRhX2Jp
dHMgPSA4Owo+Pj4+ICsgICAgdWFydC0+cGFyaXR5ID0gc3Bjci0+cGFyaXR5Owo+Pj4+ICsgICAg
dWFydC0+c3RvcF9iaXRzID0gc3Bjci0+c3RvcF9iaXRzOwo+Pj4+ICsgICAgdWFydC0+aW9fYmFz
ZSA9IHNwY3ItPnNlcmlhbF9wb3J0LmFkZHJlc3M7Cj4+Pj4gKyAgICB1YXJ0LT5pb19zaXplID0g
c3Bjci0+c2VyaWFsX3BvcnQuYml0X3dpZHRoOwo+Pj4KPj4+IE9uY2UgYWdhaW46IFlvdSBzaG91
bGQgbm90IGlnbm9yZSB0aGUgR0FTIGFkZHJlc3Mgc3BhY2UgaW5kaWNhdG9yLgo+Pgo+PiBTb3Jy
eSwgSSBkaWQgbm90IGdldCB0aGUgcG9pbnQuCj4+IERvIHlvdSBtZWFuIGNoZWNrIHRoZSBhZGRy
ZXNzIGlzIDAgb3Igbm90Pwo+IAo+IE5vLiBJIG1lYW4geW91IHNob3VsZG4ndCBpZ25vcmUgb3Ro
ZXIgcGFydHMgb2YgdGhlIHN0cnVjdHVyZToKPiAKPiBzdHJ1Y3QgYWNwaV9nZW5lcmljX2FkZHJl
c3Mgewo+IAl1OCBzcGFjZV9pZDsJCS8qIEFkZHJlc3Mgc3BhY2Ugd2hlcmUgc3RydWN0IG9yIHJl
Z2lzdGVyIGV4aXN0cyAqLwo+IAl1OCBiaXRfd2lkdGg7CQkvKiBTaXplIGluIGJpdHMgb2YgZ2l2
ZW4gcmVnaXN0ZXIgKi8KPiAJdTggYml0X29mZnNldDsJCS8qIEJpdCBvZmZzZXQgd2l0aGluIHRo
ZSByZWdpc3RlciAqLwo+IAl1OCBhY2Nlc3Nfd2lkdGg7CS8qIE1pbmltdW0gQWNjZXNzIHNpemUg
KEFDUEkgMy4wKSAqLwo+IAl1NjQgYWRkcmVzczsJCS8qIDY0LWJpdCBhZGRyZXNzIG9mIHN0cnVj
dCBvciByZWdpc3RlciAqLwo+IH07Cj4gCj4gSWlyYyB5b3Ugbm93IGNvbnN1bWUgYWxsIGZpZWxk
cyBleGNlcHQgc3BhY2VfaWQsIHlldCBzcGFjZV9pZAo+IGlzIGEgcXVhbGlmaWVyIHRvIHRoZSBh
ZGRyZXNzIGZpZWxkICh3aGljaCB5b3Ugb2J2aW91c2x5IHVzZSkuCgpJIGRpZCBub3Qga25vdyB3
aGF0IHRoZSBzcGFjZV9pZCBtZWFucyB5ZXQuCkkgd2lsbCBpbnZlc3RpZ2F0ZSBpdC4KVGhhbmtz
IGEgbG90IQoKQmVzdCBSZWdhcmRzLApXZWkKCj4gCj4gSmFuCj4gCj4gLgo+IAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
