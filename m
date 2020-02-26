Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2416F479
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 01:43:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6kkS-00018t-HA; Wed, 26 Feb 2020 00:40:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yd+m=4O=huawei.com=xuwei5@srs-us1.protection.inumbo.net>)
 id 1j6kkR-00018o-S0
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 00:40:23 +0000
X-Inumbo-ID: 9018d3f0-5830-11ea-a490-bc764e2007e4
Received: from huawei.com (unknown [45.249.212.190])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9018d3f0-5830-11ea-a490-bc764e2007e4;
 Wed, 26 Feb 2020 00:40:20 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E3C0FA09B843ACE44798;
 Wed, 26 Feb 2020 08:40:17 +0800 (CST)
Received: from [127.0.0.1] (10.57.101.250) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 26 Feb 2020
 08:40:12 +0800
To: Jan Beulich <jbeulich@suse.com>
References: <5E4F3EF4.4050701@hisilicon.com>
 <3a4f47ed-215f-f518-e819-a4b6503968c0@suse.com>
 <d21dd32d-8a5b-bb91-f83b-ed7aa72d2758@xen.org>
 <63a33275-3aca-3bb1-3028-c890e1474d07@suse.com>
 <5E5321A4.4080408@hisilicon.com>
 <c329bb96-5e1b-c826-efc2-1ca8e144fbed@suse.com>
From: Wei Xu <xuwei5@hisilicon.com>
Message-ID: <5E55BE6B.7000106@hisilicon.com>
Date: Wed, 26 Feb 2020 08:40:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <c329bb96-5e1b-c826-efc2-1ca8e144fbed@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Linuxarm <linuxarm@huawei.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMjAyMC8yLzI1IDIwOjI1LCBKYW4gQmV1bGljaCB3cm90ZToKPiBPbiAyNC4w
Mi4yMDIwIDAyOjA2LCBXZWkgWHUgd3JvdGU6Cj4+IE9uIDIwMjAvMi8yMSAyMzowNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAyMS4wMi4yMDIwIDE1OjU3LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4gT24gMjEvMDIvMjAyMCAxNDowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDIx
LjAyLjIwMjAgMDM6MjIsIFdlaSBYdSB3cm90ZToKPj4+Pj4+IC0tLSBhL3hlbi9kcml2ZXJzL2No
YXIvbnMxNjU1MC5jCj4+Pj4+PiArKysgYi94ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYwo+Pj4+
Pj4gQEAgLTE2MjAsNiArMTYyMCw4NSBAQCBEVF9ERVZJQ0VfU1RBUlQobnMxNjU1MCwgIk5TMTY1
NTAgVUFSVCIsIERFVklDRV9TRVJJQUwpCj4+Pj4+PiAgIERUX0RFVklDRV9FTkQKPj4+Pj4+Cj4+
Pj4+PiAgICNlbmRpZiAvKiBIQVNfREVWSUNFX1RSRUUgKi8KPj4+Pj4+ICsKPj4+Pj4+ICsjaWYg
ZGVmaW5lZChDT05GSUdfQUNQSSkgJiYgZGVmaW5lZChDT05GSUdfQVJNKQo+Pj4+Pj4gKyNpbmNs
dWRlIDx4ZW4vYWNwaS5oPgo+Pj4+Pj4gKwo+Pj4+Pj4gK3N0YXRpYyBpbnQgX19pbml0IG5zMTY1
NTBfYWNwaV91YXJ0X2luaXQoY29uc3Qgdm9pZCAqZGF0YSkKPj4+Pj4+ICt7Cj4+Pj4+PiArICAg
IHN0cnVjdCBhY3BpX3RhYmxlX2hlYWRlciAqdGFibGU7Cj4+Pj4+PiArICAgIHN0cnVjdCBhY3Bp
X3RhYmxlX3NwY3IgKnNwY3I7Cj4+Pj4+PiArICAgIGFjcGlfc3RhdHVzIHN0YXR1czsKPj4+Pj4+
ICsgICAgLyoKPj4+Pj4+ICsgICAgICogU2FtZSBhcyB0aGUgRFQgcGFydC4KPj4+Pj4+ICsgICAg
ICogT25seSBzdXBwb3J0IG9uZSBVQVJUIG9uIEFSTSB3aGljaCBoYXBwZW4gdG8gYmUgbnMxNjU1
MF9jb21bMF0uCj4+Pj4+PiArICAgICAqLwo+Pj4+Pj4gKyAgICBzdHJ1Y3QgbnMxNjU1MCAqdWFy
dCA9ICZuczE2NTUwX2NvbVswXTsKPj4+Pj4+ICsKPj4+Pj4+ICsgICAgc3RhdHVzID0gYWNwaV9n
ZXRfdGFibGUoQUNQSV9TSUdfU1BDUiwgMCwgJnRhYmxlKTsKPj4+Pj4+ICsgICAgaWYgKCBBQ1BJ
X0ZBSUxVUkUoc3RhdHVzKSApCj4+Pj4+PiArICAgIHsKPj4+Pj4+ICsgICAgICAgIHByaW50aygi
bnMxNjU1MDogRmFpbGVkIHRvIGdldCBTUENSIHRhYmxlXG4iKTsKPj4+Pj4+ICsgICAgICAgIHJl
dHVybiAtRUlOVkFMOwo+Pj4+Pj4gKyAgICB9Cj4+Pj4+PiArCj4+Pj4+PiArICAgIHNwY3IgPSBj
b250YWluZXJfb2YodGFibGUsIHN0cnVjdCBhY3BpX3RhYmxlX3NwY3IsIGhlYWRlcik7Cj4+Pj4+
PiArCj4+Pj4+PiArICAgIC8qCj4+Pj4+PiArICAgICAqIFRoZSBzZXJpYWwgcG9ydCBhZGRyZXNz
IG1heSBiZSAwIGZvciBleGFtcGxlCj4+Pj4+PiArICAgICAqIGlmIHRoZSBjb25zb2xlIHJlZGly
ZWN0aW9uIGlzIGRpc2FibGVkLgo+Pj4+Pj4gKyAgICAgKi8KPj4+Pj4+ICsgICAgaWYgKCB1bmxp
a2VseSghc3Bjci0+c2VyaWFsX3BvcnQuYWRkcmVzcykgKQo+Pj4+Pj4gKyAgICB7Cj4+Pj4+PiAr
ICAgICAgICBwcmludGsoIm5zMTY1NTA6IENvbnNvbGUgcmVkaXJlY3Rpb24gaXMgZGlzYWJsZWRc
biIpOwo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4+PiArICAgIH0KPj4+Pj4+
ICsKPj4+Pj4+ICsgICAgaWYgKCB1bmxpa2VseShzcGNyLT5zZXJpYWxfcG9ydC5zcGFjZV9pZCAh
PSBBQ1BJX0FEUl9TUEFDRV9TWVNURU1fTUVNT1JZKSApCj4+Pj4+PiArICAgIHsKPj4+Pj4+ICsg
ICAgICAgIHByaW50aygibnMxNjU1MDogQWRkcmVzcyBzcGFjZSB0eXBlIGlzIG5vdCBtbWlvXG4i
KTsKPj4+Pj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOwo+Pj4+Pj4gKyAgICB9Cj4+Pj4+Cj4+
Pj4+IFRoZSBzcGFjZV9pZCBmaWVsZCBxdWFsaWZpZXMgdGhlIGFkZHJlc3Mgb25lLCBpLmUuIHdo
ZXRoZXIgYSB2YWx1ZSBvZgo+Pj4+PiB6ZXJvIGNhbiBzZW5zaWJseSBtZWFuICJkaXNhYmxlZCIg
ZGVwZW5kcyBvbiB0aGUgYWRkcmVzcyBzcGFjZS4gSGVuY2UKPj4+Pj4gbG9naWNhbGx5IHRoZSBh
ZGRyZXNzIHNwYWNlIGNoZWNrIHNob3VsZCBjb21lIGZpcnN0Lgo+Pj4+Pgo+Pj4+PiBUaGlzIGlz
IHRoZSBsYXN0IHRoaW5nIEknZCBsaWtlIHRvIHNlZSBjaGFuZ2VkLiBJIHdvbid0IGdpdmUgdGhl
Cj4+Pj4+IHBhdGNoIG15IGFjayB0aG91Z2gsIGFzIEkgdGhpbmsgaXQgc2hvdWxkIGJlIGFuIEFy
bSBtYWludGFpbmVyIHRvIGFjawo+Pj4+PiBpdC4KPj4+Pgo+Pj4+IEFja2VkLWJ5OiBKdWxpZW4g
R3JhbGwgPGp1bGllbkB4ZW4ub3JnPgo+Pj4+Cj4+Pj4gQWx0aG91Z2gsIGEgcmV2aWV3ZWQtYnkg
dGFnIGZyb20geW91IHdvdWxkIGJlIG5pY2UgYXMgeW91IGRpZCBtb3N0IG9mIAo+Pj4+IHRoZSBy
ZXZpZXcgZm9yIHRoaXMgcGF0Y2guCj4+Pgo+Pj4gV2VsbCwgdG8gY2xhcmlmeSAtIHRoaXMgaXMg
b25lIG9mIHRoZSB2ZXJ5IGZldyAoYWZhaWN0KSBjYXNlcyB3aGVyZSBvdXIKPj4+IFItYiBpbXBs
eWluZyBBLWIgKHdoZW4gcGVvcGxlIGFyZSBlbnRpdGxlZCB0byBhY2sgdGhlIHJlc3BlY3RpdmUg
Y29kZSkKPj4+IGdldHMgaW4gdGhlIHdheS4gSWYgdGhpcyB3YXNuJ3QgdGhlIGNhc2UsIEknZCBo
YXZlIGdpdmVuIHRoZSBmb3JtZXIsCj4+PiBtYWtpbmcgaXQgY2xlYXIgKGFsc28gbGF0ZXIgZnJv
bSBqdXN0IGxvb2tpbmcgYXQgdGhlIHJlc3VsdGluZyBjb21taXQpCj4+PiB0aGF0IHRoZSAob25s
eSkgYWNrIGNhbWUgZnJvbSBhbiBBcm0gcGVyc29uLgo+Pgo+PiBJIHdpbGwgY2hlY2sgdGhlIGFk
ZHJlc3Mgc3BhY2UgaW4gdGhlIHY1IGFuZCBhZGQgeW91ciBSLWIuCj4gCj4gSSBndWVzcyBzb21l
IG1pc3VuZGVyc3RhbmRpbmcgaGFzIG9jY3VycmVkPyBZb3UncmUgYWxyZWFkeSBjaGVja2luZyB0
aGUKPiBhZGRyZXNzIHNwYWNlIGluIHY0IChhbmQgSSBkaWQgYWxyZWFkeSBjb21taXQgaXQgdGhp
cyB3YXkgb24gRnJpZGF5KS4KPiBBbmQgYXMgaW5kaWNhdGVkIEkgaW50ZW50aW9uYWxseSBlbGVj
dGVkIHRvIG5vdCBwcm92aWRlIG15IFItYiBmb3IgdGhpcwo+IHBhdGNoLCBmb3IgdGhlIHJlYXNv
biBnaXZlbiBhYm92ZS4KClNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2QuClRoYW5rcyBmb3IgY2xhcmlm
eWluZyEKCkJlc3QgUmVnYXJkcywKV2VpCgo+IAo+IEphbgo+IAo+IC4KPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
