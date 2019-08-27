Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79509EB13
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 16:32:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2cTC-0000by-Tn; Tue, 27 Aug 2019 14:29:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2cTB-0000bt-Da
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 14:29:13 +0000
X-Inumbo-ID: 0a031976-c8d7-11e9-ae35-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a031976-c8d7-11e9-ae35-12813bfff9fa;
 Tue, 27 Aug 2019 14:29:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 103A0AD45;
 Tue, 27 Aug 2019 14:29:12 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190813120117.22528-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7fe78747-6f8a-dc74-91e5-ad0a9c7fae23@suse.com>
Date: Tue, 27 Aug 2019 16:29:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190813120117.22528-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/tss: Fix clang build following c/s
 7888440625
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDguMjAxOSAxNDowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBDbGFuZy0zLjUgZnJv
bSBEZWJpYW4gSmVzc2llIGZhaWxzIHdpdGg6Cj4gCj4gICAgc21wYm9vdC5jOjgyOToyOTogZXJy
b3I6IHN0YXRlbWVudCBleHByZXNzaW9uIG5vdCBhbGxvd2VkIGF0IGZpbGUgc2NvcGUKPiAgICAg
ICAgICAgIEJVSUxEX0JVR19PTihzaXplb2YodGhpc19jcHUodHNzX3BhZ2UpKSAhPSBQQUdFX1NJ
WkUpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gICAgL2xvY2FsL3hlbi5n
aXQveGVuL2luY2x1ZGUvYXNtL3BlcmNwdS5oOjE0Ojc6IG5vdGU6IGV4cGFuZGVkIGZyb20gbWFj
cm8KPiAgICAgICAgICAgICd0aGlzX2NwdScKPiAgICAgICAgKCpSRUxPQ19ISURFKCZwZXJfY3B1
X18jI3ZhciwgZ2V0X2NwdV9pbmZvKCktPnBlcl9jcHVfb2Zmc2V0KSkKPiAgICAgICAgICBeCj4g
ICAgL2xvY2FsL3hlbi5naXQveGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmg6OTg6Mzogbm90ZTog
ZXhwYW5kZWQgZnJvbSBtYWNybwo+ICAgICAgICAgICAgJ1JFTE9DX0hJREUnCj4gICAgICAoeyB1
bnNpZ25lZCBsb25nIF9fcHRyOyAgICAgICAgICAgICAgICAgICAgICAgXAo+ICAgICAgXgo+ICAg
IC9sb2NhbC94ZW4uZ2l0L3hlbi9pbmNsdWRlL3hlbi9saWIuaDoyNjo1Mzogbm90ZTogZXhwYW5k
ZWQgZnJvbSBtYWNybwo+ICAgICAgICAgICAgJ0JVSUxEX0JVR19PTicKPiAgICAjZGVmaW5lIEJV
SUxEX0JVR19PTihjb25kKSAoKHZvaWQpQlVJTERfQlVHX09OX1pFUk8oY29uZCkpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiAgICAv
bG9jYWwveGVuLmdpdC94ZW4vaW5jbHVkZS94ZW4vbGliLmg6MjU6NTc6IG5vdGU6IGV4cGFuZGVk
IGZyb20gbWFjcm8KPiAgICAgICAgICAgICdCVUlMRF9CVUdfT05fWkVSTycKPiAgICAjZGVmaW5l
IEJVSUxEX0JVR19PTl9aRVJPKGNvbmQpIHNpemVvZihzdHJ1Y3QgeyBpbnQ6LSEhKGNvbmQpOyB9
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXgo+ICAgIDEgZXJyb3IgZ2VuZXJhdGVkLgo+ICAgIC9sb2NhbC94ZW4uZ2l0L3hlbi9S
dWxlcy5tazoyMDI6IHJlY2lwZSBmb3IgdGFyZ2V0ICdzbXBib290Lm8nIGZhaWxlZAo+IAo+IFRo
aXMgaXMgb2J2aW91c2x5IGEgY29tcGlsZXIgYnVnIGJlY2F1c2UgdGhlIEJVSUxEX0JVR19PTigp
IGlzIG5vdCBhdCBmaWxlCj4gc2NvcGUuICBIb3dldmVyLCBpdCBjYW4gYmUgd29ya2VkIGFyb3Vu
ZCBieSB1c2luZyBhIGxvY2FsIHZhcmlhYmxlLgoKSXQgY2FuIGJlIHdvcmtlZCBhcm91bmQsIHll
cywgYnV0IHRoZSByZXN1bHQgaXMgbm90IGlkZW50aWNhbDoKCj4gLS0tIGEveGVuL2FyY2gveDg2
L3NtcGJvb3QuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXBib290LmMKPiBAQCAtODI2LDkgKzgy
NiwxMSBAQCBzdGF0aWMgaW50IHNldHVwX2NwdV9yb290X3BndCh1bnNpZ25lZCBpbnQgY3B1KQo+
ICAgICAgICAgICByYyA9IGNsb25lX21hcHBpbmcoaWR0X3RhYmxlc1tjcHVdLCBycHQpOwo+ICAg
ICAgIGlmICggIXJjICkKPiAgICAgICB7Cj4gLSAgICAgICAgQlVJTERfQlVHX09OKHNpemVvZih0
aGlzX2NwdSh0c3NfcGFnZSkpICE9IFBBR0VfU0laRSk7Cj4gKyAgICAgICAgc3RydWN0IHRzc19w
YWdlICp0aGlzX3RzcyA9ICZwZXJfY3B1KHRzc19wYWdlLCBjcHUpOwoKV2hhdGV2ZXIgdHlwZSBp
cyBjb21wYXRpYmxlIHdpdGggc3RydWN0IHRzc19wYWdlICogd2lsbCBub3cgYmUKcGVybWl0dGVk
IG9uIHRoZSByaHMuIEhlbmNlIC4uLgoKPiAtICAgICAgICByYyA9IGNsb25lX21hcHBpbmcoJnBl
cl9jcHUodHNzX3BhZ2UsIGNwdSkudHNzLCBycHQpOwo+ICsgICAgICAgIEJVSUxEX0JVR19PTihz
aXplb2YoKnRoaXNfdHNzKSAhPSBQQUdFX1NJWkUpOwoKLi4uIHRoaXMgc2l6ZW9mKCkgaXMgbm90
IG5lY2Vzc2FyaWx5IGNoZWNraW5nIHRoZSBzaXplIG9mIHRoZQpwZXItQ1BVIHZhcmlhYmxlLiBC
dXQgYW55d2F5IC0gdGhlIGNoYW5nZSBoYXMgYmVlbiBjb21taXR0ZWQKYWxyZWFkeSwgYW5kIHRo
ZSBjaGFuY2VzIG9mIHRoaXMgZ29pbmcgd3JvbmcgYXJlIGxvdyBlbm91Z2gsIHNvCnBsZWFzZSBk
b24ndCB0cmVhdCB0aGlzIGFzIGFuIG9iamVjdGlvbiBvciByZXZlcnQgcmVxdWVzdC4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
