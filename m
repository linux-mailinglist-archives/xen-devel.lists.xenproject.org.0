Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C12051024DE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 13:51:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX2xT-0007z0-LH; Tue, 19 Nov 2019 12:50:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX2xS-0007ys-Mv
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 12:50:14 +0000
X-Inumbo-ID: 20a40290-0acb-11ea-a2fa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 20a40290-0acb-11ea-a2fa-12813bfff9fa;
 Tue, 19 Nov 2019 12:50:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91A0AAE68;
 Tue, 19 Nov 2019 12:50:12 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20191119120849.1547072-1-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d213f3b-d4e3-5936-3eea-f7b7f3233d0e@suse.com>
Date: Tue, 19 Nov 2019 13:50:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191119120849.1547072-1-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH] x86/domctl: Have
 XEN_DOMCTL_getpageframeinfo3 preemptible
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxMzowOCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBoeXBlcmNh
bGwgY2FuIHRha2UgYSBsb25nIHRpbWUgdG8gZmluaXNoIGJlY2F1c2UgaXQgYXR0ZW1wdHMgdG8K
PiBncmFiIHRoZSBgaG9zdHAybScgbG9jayB1cCB0byAxMDI0IHRpbWVzLiBUaGUgYWNjdW11bGF0
ZWQgd2FpdCBmb3IgdGhlCj4gbG9jayBjYW4gdGFrZSBzZXZlcmFsIHNlY29uZHMuCgpXaGljaCBt
ZWFucyBzZXZlcmFsIG1pbGxpc2Vjb25kcyBvbiBhdmVyYWdlIHBlciBsb2NrIGFjcXVpcmUuIFRo
aXMKcG9pbnRzIChhZ2FpbikgYXQgYSAodGhlKSBiaWdnZXIgcHJvYmxlbSBvZiBwMm0gbG9jayBj
b250ZW50aW9uLgpUaGVyZWZvcmUgSSdtIGFmcmFpZCB0aGF0LCB3aGlsZSB0aGUgY2hhbmdlIGhl
cmUgaXMgYW4gaW1wcm92ZW1lbnQsCml0J3Mgb25seSBjdXJpbmcgc3ltcHRvbXMgcmF0aGVyIHRo
YW4gdGhlIGNhdXNlLgoKU2VlaW5nIHRoYXQgcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKCkgdXNlcyBh
IHJlYWQgbG9jayAoYnV0IHNhZGx5IGlzCnRoZSBvbmx5IGZ1bmN0aW9uIGRvaW5nIHNvKSwgb25l
IHJvdXRlIGNvdWxkIGJlIHRvIGludmVzdGlnYXRlCndoZXRoZXIgZnVydGhlciBwYXRocyBjb3Vs
ZCBnZXQgYXdheSB3aXRoIGp1c3QgcmVhZCBsb2NraW5nLiBGYWlyCnBhcnRzIG9mIGUuZy4gdGhl
IG5lc3RlZCBwYWdlIGZhdWx0IGhhbmRsaW5nIGRvbid0IHJlYWxseSBzZWVtIHRvCnJlcXVpcmUg
YSB3cml0ZSBsb2NrLCBidXQgdGhlcmUgaXMgdGhpcyBjb21tZW50CgogICAgLyoKICAgICAqIFRh
a2UgYSBsb2NrIG9uIHRoZSBob3N0IHAybSBzcGVjdWxhdGl2ZWx5LCB0byBhdm9pZCBwb3RlbnRp
YWwKICAgICAqIGxvY2tpbmcgb3JkZXIgcHJvYmxlbXMgbGF0ZXIgYW5kIHRvIGhhbmRsZSB1bnNo
YXJlIGV0Yy4KICAgICAqLwoKcG9pbnRpbmcgb3V0IHRoZSBwb3NzaWJsZSBpc3N1ZXMgd2l0aCBk
b3duZ3JhZGluZyB0aGUgbG9jayB0byBqdXN0CmEgcmVhZCBvbmUuCgpBbm90aGVyIHJvdXRlIHRv
IGNvbnNpZGVyIHdvdWxkIGJlIHRvIGF2b2lkIHRha2luZyB0aGUgbG9jayBvbmNlCnBlciBpdGVy
YXRpb24sIGFuZCBpbnN0ZWFkIHByb2Nlc3Mgc2V2ZXJhbCBHRk5zIGF0IGEgdGltZSB3aXRoaW4K
YSBzaW5nbGUgbG9jayBob2xkaW5nIHNlcXVlbmNlLgoKPiBOb3RlczoKPiAgICAgSSBkb24ndCBr
bm93IGlmIGl0J3MgYSBjb3JyZWN0IHdheSB0byBtYWtlIHRoZSBoeXBlcmNhbGwgcHJlZW1wdGli
bGUsCj4gICAgIHRoZSBwYXRjaCBraW5kIG9mIG1vZGlmeSB0aGUgcmVzcG9uc2UsIGJ1dCBsaWJ4
YyBkb2Vzbid0IHNlZW1zIHRvIGNhcmUuCgpJIHRoaW5rIHRoYXQncyBhY2NlcHRhYmxlIGZvciBk
b21jdGwtcywgYnV0IHdvdWxkIGJldHRlciBiZQphY2NvbXBhbmllZCBieSBhIGNvbW1lbnQgYWRq
dXN0bWVudC9hZGRpdGlvbiB0byBwdWJsaWMvZG9tY3RsLmguCgo+IC0tLSBhL3hlbi9hcmNoL3g4
Ni9kb21jdGwuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9kb21jdGwuYwo+IEBAIC00MjUsNiArNDI1
LDE4IEBAIGxvbmcgYXJjaF9kb19kb21jdGwoCj4gICAgICAgICAgICAgICAgICByZXQgPSAtRUZB
VUxUOwo+ICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAgIH0KPiArCj4gKyAg
ICAgICAgICAgIGlmICggaHlwZXJjYWxsX3ByZWVtcHRfY2hlY2soKSApIHsKCllvdSBkb24ndCB3
YW50IHRoaXMgb24gdGhlIGxhc3QgaXRlcmF0aW9uLiBZb3UgYWxzbyBiZXR0ZXIgZG9uJ3QKZG8g
dGhpcyB3aGVuIHRoZXJlJ3Mgbm8gcDJtIGxvY2sgaW52b2x2ZWQgdG8gYmVnaW4gd2l0aCwgaS5l
Lgpmb3Igbm9uLXRyYW5zbGF0ZWQgZ3Vlc3RzLiBUaGlzIHNob3VsZCB0aGVuIGJlIGFjY29tcGFu
aWVkIGJ5IGEKY29tbWVudCBqdXN0aWZ5aW5nIHRoZSBzcGVjaWFsIGNhc2luZy4KCkFsc28gdGhl
IG9wZW5pbmcgYnJhY2UgKG9uZSBtb3JlIGJlbG93IGhlcmUpIGdvZXMgb24gaXRzIG93biBsaW5l
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
