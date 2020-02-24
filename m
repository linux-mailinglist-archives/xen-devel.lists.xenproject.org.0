Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE97D169B8E
	for <lists+xen-devel@lfdr.de>; Mon, 24 Feb 2020 02:07:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j62Aa-0002Eh-GB; Mon, 24 Feb 2020 01:04:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZQR9=4M=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j62AZ-0002Ec-GO
 for xen-devel@lists.xenproject.org; Mon, 24 Feb 2020 01:04:23 +0000
X-Inumbo-ID: 9506ab5c-56a1-11ea-ade5-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9506ab5c-56a1-11ea-ade5-bc764e2007e4;
 Mon, 24 Feb 2020 01:04:19 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A7CB47F2B98BF2397878;
 Mon, 24 Feb 2020 09:04:16 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 24 Feb 2020
 09:04:10 +0800
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
 <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E532109.5060608@hisilicon.com>
Date: Mon, 24 Feb 2020 09:04:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
X-Originating-IP: [10.57.101.250]
X-CFilter-Loop: Reflected
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
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

SGkgSnVsaWVuLAoKT24gMjAyMC8yLzIxIDIyOjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4g
Cj4gT24gMjEvMDIvMjAyMCAxNDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDIxLjAyLjIw
MjAgMDM6MjIsIFdlaSBYdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9kcml2ZXJzL2NoYXIvbnMxNjU1
MC5jCj4+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4gQEAgLTE2MjAsNiAr
MTYyMCw4NSBAQCBEVF9ERVZJQ0VfU1RBUlQobnMxNjU1MCwgIk5TMTY1NTAgVUFSVCIsIERFVklD
RV9TRVJJQUwpCj4+PiAgIERUX0RFVklDRV9FTkQKPj4+Cj4+PiAgICNlbmRpZiAvKiBIQVNfREVW
SUNFX1RSRUUgKi8KPj4+ICsKPj4+ICsjaWYgZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5l
ZChDT05GSUdfQVJNKQo+Pj4gKyNpbmNsdWRlIDx4ZW4vYWNwaS5oPgo+Pj4gKwo+Pj4gK3N0YXRp
YyBpbnQgX19pbml0IG5zMTY1NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0YSkKPj4+
ICt7Cj4+PiArICAgIHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGU7Cj4+PiArICAgIHN0
cnVjdCBhY3BpX3RhYmxlX3NwY3IgKnNwY3I7Cj4+PiArICAgIGFjcGlfc3RhdHVzIHN0YXR1czsK
Pj4+ICsgICAgLyoKPj4+ICsgICAgICogU2FtZSBhcyB0aGUgRFQgcGFydC4KPj4+ICsgICAgICog
T25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTSB3aGljaCBoYXBwZW4gdG8gYmUgbnMxNjU1MF9j
b21bMF0uCj4+PiArICAgICAqLwo+Pj4gKyAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFydCA9ICZuczE2
NTUwX2NvbVswXTsKPj4+ICsKPj4+ICsgICAgc3RhdHVzID0gYWNwaV9nZXRfdGFibGUoQUNQSV9T
SUdfU1BDUiwgMCwgJnRhYmxlKTsKPj4+ICsgICAgaWYgKCBBQ1BJX0ZBSUxVUkUoc3RhdHVzKSAp
Cj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByaW50aygibnMxNjU1MDogRmFpbGVkIHRvIGdldCBT
UENSIHRhYmxlXG4iKTsKPj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4gKyAgICB9Cj4+
PiArCj4+PiArICAgIHNwY3IgPSBjb250YWluZXJfb2YodGFibGUsIHN0cnVjdCBhY3BpX3RhYmxl
X3NwY3IsIGhlYWRlcik7Cj4+PiArCj4+PiArICAgIC8qCj4+PiArICAgICAqIFRoZSBzZXJpYWwg
cG9ydCBhZGRyZXNzIG1heSBiZSAwIGZvciBleGFtcGxlCj4+PiArICAgICAqIGlmIHRoZSBjb25z
b2xlIHJlZGlyZWN0aW9uIGlzIGRpc2FibGVkLgo+Pj4gKyAgICAgKi8KPj4+ICsgICAgaWYgKCB1
bmxpa2VseSghc3Bjci0+c2VyaWFsX3BvcnQuYWRkcmVzcykgKQo+Pj4gKyAgICB7Cj4+PiArICAg
ICAgICBwcmludGsoIm5zMTY1NTA6IENvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlzYWJsZWRcbiIp
Owo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+PiArICAgIH0KPj4+ICsKPj4+ICsgICAg
aWYgKCB1bmxpa2VseShzcGNyLT5zZXJpYWxfcG9ydC5zcGFjZV9pZCAhPSBBQ1BJX0FEUl9TUEFD
RV9TWVNURU1fTUVNT1JZKSApCj4+PiArICAgIHsKPj4+ICsgICAgICAgIHByaW50aygibnMxNjU1
MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4iKTsKPj4+ICsgICAgICAgIHJldHVy
biAtRUlOVkFMOwo+Pj4gKyAgICB9Cj4+Cj4+IFRoZSBzcGFjZV9pZCBmaWVsZCBxdWFsaWZpZXMg
dGhlIGFkZHJlc3Mgb25lLCBpLmUuIHdoZXRoZXIgYSB2YWx1ZSBvZgo+PiB6ZXJvIGNhbiBzZW5z
aWJseSBtZWFuICJkaXNhYmxlZCIgZGVwZW5kcyBvbiB0aGUgYWRkcmVzcyBzcGFjZS4gSGVuY2UK
Pj4gbG9naWNhbGx5IHRoZSBhZGRyZXNzIHNwYWNlIGNoZWNrIHNob3VsZCBjb21lIGZpcnN0Lgo+
Pgo+PiBUaGlzIGlzIHRoZSBsYXN0IHRoaW5nIEknZCBsaWtlIHRvIHNlZSBjaGFuZ2VkLiBJIHdv
bid0IGdpdmUgdGhlCj4+IHBhdGNoIG15IGFjayB0aG91Z2gsIGFzIEkgdGhpbmsgaXQgc2hvdWxk
IGJlIGFuIEFybSBtYWludGFpbmVyIHRvIGFjawo+PiBpdC4KPiAKPiBBY2tlZC1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4KClRoYW5rcyEKCkJlc3QgUmVnYXJkcywKV2VpCgo+IAo+
IEFsdGhvdWdoLCBhIHJldmlld2VkLWJ5IHRhZyBmcm9tIHlvdSB3b3VsZCBiZSBuaWNlIGFzIHlv
dSBkaWQgbW9zdCBvZiB0aGUgcmV2aWV3IGZvciB0aGlzIHBhdGNoLgo+IAo+IENoZWVycywKPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
