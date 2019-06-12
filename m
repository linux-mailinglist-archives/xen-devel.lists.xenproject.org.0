Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B254196D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jun 2019 02:27:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1har3J-00026j-As; Wed, 12 Jun 2019 00:23:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v58P=UL=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1har3H-00026e-Fu
 for xen-devel@lists.xenproject.org; Wed, 12 Jun 2019 00:23:43 +0000
X-Inumbo-ID: 51cf986c-8ca8-11e9-829b-3f19d4f16a78
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51cf986c-8ca8-11e9-829b-3f19d4f16a78;
 Wed, 12 Jun 2019 00:23:38 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Jun
 2019 08:20:26 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <5942544893366d8ff51fdf603fd13f18@sslemail.net>
 <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <492c0277-7413-d306-b350-58167a526486@mxnavi.com>
Date: Wed, 12 Jun 2019 08:23:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CFFB4A30200007800237133@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen/coverage: wrap coverage related things
 under 'CONFIG_COVERAGE'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDYvMTEvMTkgMjI6MDMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDExLjA2LjE5IGF0
IDA4OjAyLCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9hcmNo
L3g4Ni94ZW4ubGRzLlMKPj4gKysrIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+PiBAQCAtMjQw
LDEyICsyNDAsMTQgQEAgU0VDVElPTlMKPj4gICAgICAgICAgICooLmFsdGluc3RydWN0aW9ucykK
Pj4gICAgICAgICAgIF9fYWx0X2luc3RydWN0aW9uc19lbmQgPSAuOwo+PiAgIAo+PiArI2lmIGRl
ZmluZWQoQ09ORklHX0NPVkVSQUdFKQo+PiAgICAgICAgICAuID0gQUxJR04oOCk7Cj4+ICAgICAg
ICAgIF9fY3RvcnNfc3RhcnQgPSAuOwo+PiAgICAgICAgICAqKC5jdG9ycykKPj4gICAgICAgICAg
KiguaW5pdF9hcnJheSkKPj4gICAgICAgICAgKihTT1JUKC5pbml0X2FycmF5LiopKQo+PiAgICAg
ICAgICBfX2N0b3JzX2VuZCA9IC47Cj4+ICsjZW5kaWYKPiBIb3cgaXMgdGhpcyAob25seSkgY292
ZXJhZ2UgcmVsYXRlZD8gQW5kIGhvdyBpcyBtYWtpbmcgdGhpcyBjb25kaXRpb25hbAo+IGdvaW5n
IHRvIGhlbHAgaW4gYW55IHdheT8KCkhlbGxvIEphbiwKCldoZW4gaSByZWFkIHRoZSBjb2RlICdp
bml0X2NvbnN0cnVjdG9ycygpJywgaSB3YW50IHRvIHVuZGVyc3RhbmQgd2hlbiAKaXQncyB1c2Vk
LgoKSSBjYW4gbm90IGZpbmQgYW55IGhlbHBlciBtYWNyb3MgbGlrZSAnX19pbml0JyBpbiBpbml0
LmgsIHB1dCB0aGluZ3MgaW4gCnRoaXMgc2VjdGlvbi4KCkFsc28gcnVuIHVuZGVyIGFybSBmb3Vu
ZGF0aW9uIHBsYXRmb3JtLCB0aGUgc2VjdGlvbiBpcyBlbXB0eS4KClNvIGkgY2hlY2sgY29tbWl0
IGhpc3RvcnkgYW5kIGZvdW5kIGl0J3MgY29tbWl0IGxvZ3M6IGl0IGlzIGNvdmVyYWdlIApyZWxh
dGVkLgoKQW5kIGNvbXBpbGVkIHdpdGggQ09ORklHX0NPVkVSQUdFIGVuYWJsZWQsIHRoaXMgc2Vj
dGlvbiBpcyBub3QgZW1wdHkgCmFueW1vcmUuCgpTbyB0aGUgcGF0Y2ggbWFpbmx5IHdhbnQgdG8g
Y2xhcmlmeSB0aGUgY29kZSBpcyBjb3ZlcmFnZSByZWxhdGVkLAoKd2hpY2ggd2FudCB0byBoZWxw
IG5ld2NvbWVyIGVhc2lseSB1bmRlcnN0YW5kIHRoaXMgY29kZS4KCkFtIGkgbWlzdW5kZXJzdGFu
ZGluZyBoZXJlPwoKPgo+IEFuZCBpZiB3ZSB3ZXJlIHRvIHRha2UgdGhpcywgdGhlbiBwbGVhc2Ug
dXNlIHRoZSBzaG9ydGVyICNpZmRlZi4KWWVzLCBjYW4gYmUgZml4ZWQuCj4KPj4gLS0tIGEveGVu
L2NvbW1vbi9saWIuYwo+PiArKysgYi94ZW4vY29tbW9uL2xpYi5jCj4+IEBAIC00OTEsMTUgKzQ5
MSwyMCBAQCB1bnNpZ25lZCBsb25nIGxvbmcgcGFyc2Vfc2l6ZV9hbmRfdW5pdChjb25zdCBjaGFy
ICpzLCBjb25zdCBjaGFyICoqcHMpCj4+ICAgICAgIHJldHVybiByZXQ7Cj4+ICAgfQo+PiAgIAo+
PiArI2lmIGRlZmluZWQoQ09ORklHX0NPVkVSQUdFKQo+PiAgIHR5cGVkZWYgdm9pZCAoKmN0b3Jf
ZnVuY190KSh2b2lkKTsKPj4gICBleHRlcm4gY29uc3QgY3Rvcl9mdW5jX3QgX19jdG9yc19zdGFy
dFtdLCBfX2N0b3JzX2VuZFtdOwo+PiArI2VuZGlmCj4gQWdhaW4gLSBob3cgZG9lcyB0aGlzIGhl
bHA/CldhbnQgdG8gY2xhcmlmeSB0aGlzIGlzIGNvdmVyYWdlIHJlbGF0ZWQgY29kZS4KPgo+PiAr
Lyogc2VlICdkb2NzL2h5cGVydmlzb3ItZ3VpZGUvY29kZS1jb3ZlcmFnZS5yc3QnICovCj4+ICAg
dm9pZCBfX2luaXQgaW5pdF9jb25zdHJ1Y3RvcnModm9pZCkKPiBUaGVyZSdzIG5vIG1lbnRpb24g
b2YgdGhpcyBmdW5jdGlvbiBpbiB0aGUgcmVmZXJlbmNlZCBkb2NzIGZpbGUuCgpTYW1lIGFzIGFi
b3ZlLgoKPgo+PiAgIHsKPj4gKyNpZiBkZWZpbmVkKENPTkZJR19DT1ZFUkFHRSkKPj4gICAgICAg
Y29uc3QgY3Rvcl9mdW5jX3QgKmY7Cj4+ICAgICAgIGZvciAoIGYgPSBfX2N0b3JzX3N0YXJ0OyBm
IDwgX19jdG9yc19lbmQ7ICsrZiApCj4+ICAgICAgICAgICAoKmYpKCk7Cj4+ICAgCj4+ICsjZW5k
aWYKPj4gICAgICAgLyogUHV0dGluZyB0aGlzIGhlcmUgc2VlbXMgYXMgZ29vZCAob3IgYmFkKSBh
cyBhbnkgb3RoZXIgcGxhY2UuICovCj4gQWdhaW4sIGJlc2lkZXMgbGFja2luZyBzdWl0YWJsZSBy
ZWFzb25pbmcgeW91IGFsc28gc2hvdWxkIGxvb2sKPiBtb3JlIGNsb3NlbHksIGluIHRoaXMgY2Fz
ZSB3aGVyZSBleGFjdGx5IGl0IG1ha2VzIHNlbnNlIHRvIHBsYWNlCj4gdGhlICNlbmRpZi4KClRo
ZSBibGFuayBsaW5lIGhlcmU/IElmIHllcywgY2FuIGJlIHJlbW92ZWQuIGkgbWlzc2VkIHRoaXMu
Cgo+Cj4gSmFuCj4KPgo+IC4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
