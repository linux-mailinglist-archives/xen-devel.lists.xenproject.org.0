Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE211326D7
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 05:11:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXdK5-0000hX-FG; Mon, 03 Jun 2019 03:07:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WQxh=UC=mxnavi.com=chenbaodong@srs-us1.protection.inumbo.net>)
 id 1hXdK4-0000hS-AU
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 03:07:44 +0000
X-Inumbo-ID: bf287489-85ac-11e9-8980-bc764e045a96
Received: from mxnavi-mail.mxnavi.com (unknown [116.90.87.199])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf287489-85ac-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 03:07:41 +0000 (UTC)
Received: from [192.168.51.47] (61.161.186.150) by mxnavi-mail.mxnavi.com
 (116.90.87.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Mon, 3 Jun
 2019 11:05:26 +0800
To: Jan Beulich <JBeulich@suse.com>
References: <35519b1efa94833e1ba3597925b409ec@sslemail.net>
 <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
From: chenbaodong <chenbaodong@mxnavi.com>
Message-ID: <216d2eb7-66ae-1128-318d-86a314a79d69@mxnavi.com>
Date: Mon, 3 Jun 2019 11:07:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF10BB80200007800233F92@prv1-mh.provo.novell.com>
Content-Language: en-US
X-Originating-IP: [61.161.186.150]
X-ClientProxiedBy: mxnavi-mail.mxnavi.com (116.90.87.199) To
 mxnavi-mail.mxnavi.com (116.90.87.199)
Subject: Re: [Xen-devel] [PATCH] xen: make tracebuffer configurable
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDUvMzEvMTkgMTk6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDMwLjA1LjE5IGF0
IDEyOjE3LCA8Y2hlbmJhb2RvbmdAbXhuYXZpLmNvbT4gd3JvdGU6Cj4+IERlZmF1bHQ6IGVuYWJs
ZWQuCj4+IENhbiBiZSBkaXNhYmxlZCBmb3Igc21hbGxlciBjb2RlIGZvb3RwcmludC4KPiBCdXQg
eW91J3JlIGF3YXJlIHRoYXQgd2UncmUsIGZvciBub3cgYXQgbGVhc3QsIHRyeWluZyB0byBsaW1p
dCB0aGUKPiBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxlY3RhYmxlIGNvbmZpZyBvcHRpb25z
PyBPbmVzIGRlcGVuZGluZwo+IG9uIEVYUEVSVCBhcmUgc29ydCBvZiBhbiBleGNlcHRpb24gaW4g
Y2VydGFpbiBjYXNlcy4KCkxpbWl0IHRoZSBudW1iZXIgb2YgaW5kZXBlbmRlbnRseSBzZWxlY3Rh
YmxlIGNvbmZpZyBzb3VuZHMgZ29vZCB0byBtZS4KCkRvZXMgdGhlIGZvbGxvd2luZyBsb29rcyBn
b29kPwoKK2NvbmZpZyBIQVNfVFJBQ0VCVUZGRVIKK8KgwqDCoMKgwqDCoCBib29sICJFbmFibGUv
RGlzYWJsZSB0cmFjZWJ1ZmZlciLCoCBpZiBFWFBFUlQgPSAieSIKK8KgwqDCoMKgwqDCoCAtLS1o
ZWxwLS0tCivCoMKgwqDCoMKgwqDCoMKgIEVuYWJsZSBvciBkaXNhYmxlIHRyYWNlYnVmZmVyIGZ1
bmN0aW9uLgorwqDCoMKgwqDCoMKgwqDCoCBYZW4gaW50ZXJuYWwgcnVubmluZyBzdGF0dXModHJh
Y2UgZXZlbnQpIHdpbGwgYmUgc2F2ZWQgdG8gCnRyYWNlIG1lbW9yeQorwqDCoMKgwqDCoMKgwqDC
oCB3aGVuIGVuYWJsZWQuCisKCj4KPj4gLS0tIGEveGVuL2NvbW1vbi9LY29uZmlnCj4+ICsrKyBi
L3hlbi9jb21tb24vS2NvbmZpZwo+PiBAQCAtMzY4LDQgKzM2OCwxMCBAQCBjb25maWcgRE9NMF9N
RU0KPj4gICAKPj4gICAJICBMZWF2ZSBlbXB0eSBpZiB5b3UgYXJlIG5vdCBzdXJlIHdoYXQgdG8g
c3BlY2lmeS4KPj4gICAKPj4gK2NvbmZpZyBIQVNfVFJBQ0VCVUZGRVIKPj4gKwlib29sICJFbmFi
bGUvRGlzYWJsZSB0cmFjZWJ1ZmZlciIKPj4gKwlkZWZhdWx0IHkKPj4gKwktLS1oZWxwLS0tCj4+
ICsJICBFbmFibGUgb3IgZGlzYWJsZSB0cmFjZWJ1ZmZlciBmdW5jdGlvbi4KPiBIQVNfKiBvcHRp
b25zIHNob3VsZCBub3QgY29tZSB3aXRoIGEgcHJvbXB0LCBhbmQgc2hvdWxkCj4gb25seSBiZSAi
c2VsZWN0Ii1lZCBieSAobm9ybWFsbHkpIHBlci1hcmNoaXRlY3R1cmUgS2NvbmZpZwo+IGZpbGVz
LiBJZiB3ZSBhcmUgdG8gcGVybWl0IGhhdmluZyB0aGlzIG9wdGlvbiwgdGhlbiBJIGFsc28gdGhp
bmsKPiB0aGUgaGVscCB0ZXh0IG5lZWRzIGV4cGFuZGluZy4KVGFua3MgZm9yIHlvdXIgY2xhcmlm
aWNhdGlvbi4KPj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL3RyYWNlLmgKPj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3RyYWNlLmgKPj4gQEAgLTIxLDEyICsyMSwxNCBAQAo+PiAgICNpZm5kZWYgX19Y
RU5fVFJBQ0VfSF9fCj4+ICAgI2RlZmluZSBfX1hFTl9UUkFDRV9IX18KPj4gICAKPj4gLWV4dGVy
biBpbnQgdGJfaW5pdF9kb25lOwo+PiAgIAo+PiAgICNpbmNsdWRlIDxwdWJsaWMvc3lzY3RsLmg+
Cj4+ICAgI2luY2x1ZGUgPHB1YmxpYy90cmFjZS5oPgo+PiAgICNpbmNsdWRlIDxhc20vdHJhY2Uu
aD4KPj4gICAKPj4gKyNpZmRlZiBDT05GSUdfSEFTX1RSQUNFQlVGRkVSCj4+ICsKPj4gK2V4dGVy
biBpbnQgdGJfaW5pdF9kb25lOwo+PiAgIC8qIFVzZWQgdG8gaW5pdGlhbGlzZSB0cmFjZSBidWZm
ZXIgZnVuY3Rpb25hbGl0eSAqLwo+PiAgIHZvaWQgaW5pdF90cmFjZV9idWZzKHZvaWQpOwo+IEkg
d29uZGVyIGlmIHRoZXJlIGhhZG4ndCBiZWVuIGEgcmVhc29uIGZvciB0aGUgZGVjbGFyYXRpb24g
dG8gbGl2ZQo+IHVwIHdoZXJlIGl0IHdhcy4gQWxzbyBwbGVhc2Ugc2VwYXJhdGUgaW5kZXBlbmRl
bnQgYmxvY2tzIG9mIGNvZGUKPiBieSBhIGJsYW5rIGxpbmUuClJvZ2VyIHRoYXQuCj4KPj4gQEAg
LTQ3LDYgKzQ5LDIwIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCB0cmFjZV92YXIodTMyIGV2ZW50LCBp
bnQgY3ljbGVzLCBpbnQKPj4gZXh0cmEsCj4+ICAgdm9pZCBfX3RyYWNlX2h5cGVyY2FsbCh1aW50
MzJfdCBldmVudCwgdW5zaWduZWQgbG9uZyBvcCwKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHhlbl91bG9uZ190ICphcmdzKTsKPj4gICAKPj4gKyNlbHNlCj4+ICsjZGVmaW5lIHRi
X2luaXRfZG9uZSAoMCkKPiBQZXJoYXBzIGJldHRlciAiZmFsc2UiLCBhbmQgbm8gcmVhbCBuZWVk
IGZvciB0aGUgcGFyZW50aGVzZXMgYWZhaWN0Lgo+Cj4+ICtzdGF0aWMgaW5saW5lIHZvaWQgaW5p
dF90cmFjZV9idWZzKHZvaWQpIHt9Cj4+ICtzdGF0aWMgaW5saW5lIGludCB0Yl9jb250cm9sKHN0
cnVjdCB4ZW5fc3lzY3RsX3RidWZfb3AgKnRiYykgeyByZXR1cm4gLUVOT1NZUzsgfQo+PiArCj4+
ICtzdGF0aWMgaW5saW5lIGludCB0cmFjZV93aWxsX3RyYWNlX2V2ZW50KHUzMiBldmVudCkgeyBy
ZXR1cm4gMDsgfQo+PiArc3RhdGljIGlubGluZSB2b2lkIHRyYWNlX3Zhcih1MzIgZXZlbnQsIGlu
dCBjeWNsZXMsIGludCBleHRyYSwKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
c3Qgdm9pZCAqZXh0cmFfZGF0YSkge30KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3RyYWNlX3Zh
cih1MzIgZXZlbnQsIGJvb2xfdCBjeWNsZXMsIHVuc2lnbmVkIGludCBleHRyYSwKPj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCB2b2lkICpleHRyYV9kYXRhKSB7fQo+PiAr
c3RhdGljIGlubGluZSB2b2lkIF9fdHJhY2VfaHlwZXJjYWxsKHVpbnQzMl90IGV2ZW50LCB1bnNp
Z25lZCBsb25nIG9wLAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNv
bnN0IHhlbl91bG9uZ190ICphcmdzKSB7fQo+PiArI2VuZGlmCj4gV2UgdHJ5IHRvIGRvIGF3YXkg
d2l0aCB1MzIgYW5kIGZyaWVuZHMsIHNvIHBsZWFzZSBkb24ndCBpbnRyb2R1Y2UKPiBuZXcgdXNl
cyAtIGV2ZW4gbGVzcyBzbyB3aGVuIGluIG9uZSBjYXNlIGhlcmUgeW91IGFscmVhZHkgdXNlCj4g
dWludDMyX3QuIFNpbWlsYXJseSBwbGVhc2UgdXNlICJib29sIiBpbiBmYXZvciBvZiAiYm9vbF90
Ii4KUm9nZXIgdGhhdC4KPiBKYW4KPgo+Cj4gLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
