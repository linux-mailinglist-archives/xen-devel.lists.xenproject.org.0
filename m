Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B309315BE67
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 13:27:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2DYL-0002tc-Jz; Thu, 13 Feb 2020 12:25:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2DYK-0002tS-3H
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 12:25:08 +0000
X-Inumbo-ID: de76d954-4e5b-11ea-b890-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de76d954-4e5b-11ea-b890-12813bfff9fa;
 Thu, 13 Feb 2020 12:25:07 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DYH-00075U-I6; Thu, 13 Feb 2020 12:25:05 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2DYH-00073J-71; Thu, 13 Feb 2020 12:25:05 +0000
Date: Thu, 13 Feb 2020 12:24:56 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200213122456.ciobb2esg46hib7u@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
 <628b1e12-527d-5457-b97d-09c3d530ebbb@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <628b1e12-527d-5457-b97d-09c3d530ebbb@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 1/4] x86/hyperv: misc cleanup
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6NDY6NTZBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTIuMDIuMjAyMCAxNzowOSwgV2VpIExpdSB3cm90ZToKPiA+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9ndWVzdC9oeXBlcnYvcHJpdmF0ZS5oCj4gPiArKysgYi94ZW4vYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2L3ByaXZhdGUuaAo+ID4gQEAgLTI2LDYgKzI2LDYgQEAKPiA+ICAKPiA+ICBERUNM
QVJFX1BFUl9DUFUodm9pZCAqLCBodl9pbnB1dF9wYWdlKTsKPiA+ICBERUNMQVJFX1BFUl9DUFUo
dm9pZCAqLCBodl92cF9hc3Npc3QpOwo+ID4gLURFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQs
IGh2X3ZwX2luZGV4KTsKPiA+ICtERUNMQVJFX1BFUl9DUFUodWludDMyX3QsIGh2X3ZwX2luZGV4
KTsKPiAKPiBZb3UndmUgZ290IGEgY28tbWFpbnRhaW5lciBhY2ssIGkuZS4gc28gYmUgaXQsIGJ1
dCBGVFIgdGhpcyBpcwo+IGFnYWluc3Qgd2hhdCBDb2RpbmdTdHlsZSBzYXlzLCBhZmFpY3Q6ICJG
aXhlZCB3aWR0aCB0eXBlcyBzaG91bGQKPiBvbmx5IGJlIHVzZWQgd2hlbiBhIGZpeGVkIHdpZHRo
IHF1YW50aXR5IGlzIG1lYW50ICh3aGljaCBmb3IKPiBleGFtcGxlIG1heSBiZSBhIHZhbHVlIHJl
YWQgZnJvbSBvciB0byBiZSB3cml0dGVuIHRvIGEgcmVnaXN0ZXIpLiIKPiBJZiB5b3UgaGFuZGVk
IHRoZSBhZGRyZXNzIChwZXJoYXBzIGluZGlyZWN0bHksIGUuZy4gYnkgY29udmVydGluZwo+IHRv
IGEgcGh5c2ljYWwgb25lIGZpcnN0KSBvZiB0aGlzIHZhcmlhYmxlIHRvIEh5cGVyLVYsIHRoZW4g
dGhpbmdzCj4gd291bGQgYmUgZGlmZmVyZW50LiBCdXQKPiAKPiAgICAgdGhpc19jcHUoaHZfdnBf
aW5kZXgpID0gdnBfaW5kZXhfbXNyOwo+IAo+IHdvdWxkLCBpZiB1bnNpZ25lZCBpbnQgd2FzIHdp
ZGVyIHRoYW4gMzIgYml0cywgbm90IGNhdXNlIGFueQoKRGlkIHlvdSBtZWFuICJ3b3VsZG4ndCIg
aGVyZT8KCj4gaXNzdWVzLiBBbmQgdGhpcyBpcyB0aGUgb25seSBwbGFjZSB0aGUgdmFyaWFibGUg
Y3VycmVudGx5IGdldHMKPiBhY2Nlc3NlZCwgYW5kIEkgZXhwZWN0IGZ1dHVyZSB1c2VzIHdpbGwg
anVzdCBiZSByZWFkcyBvZiBpdCAoYXMKPiBjYW4gYmUgc2VlbiBsYXRlciBpbiB0aGUgc2VyaWVz
KS4KPiAKClllcy4KCldlaS4KCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
