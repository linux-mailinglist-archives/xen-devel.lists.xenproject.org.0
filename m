Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFD015BF7A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 14:36:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2Eby-0001aH-80; Thu, 13 Feb 2020 13:32:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2Ebw-0001aC-Gp
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 13:32:56 +0000
X-Inumbo-ID: 5773244e-4e65-11ea-b8a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5773244e-4e65-11ea-b8a2-12813bfff9fa;
 Thu, 13 Feb 2020 13:32:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC739AAC2;
 Thu, 13 Feb 2020 13:32:54 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
 <628b1e12-527d-5457-b97d-09c3d530ebbb@suse.com>
 <20200213122456.ciobb2esg46hib7u@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fb10873a-bf08-8cd5-b190-ab5036e7bf4c@suse.com>
Date: Thu, 13 Feb 2020 14:32:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200213122456.ciobb2esg46hib7u@debian>
Content-Language: en-US
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
Cc: Wei Liu <liuwe@microsoft.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDIuMjAyMCAxMzoyNCwgV2VpIExpdSB3cm90ZToKPiBPbiBUaHUsIEZlYiAxMywgMjAy
MCBhdCAxMDo0Njo1NkFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTIuMDIuMjAy
MCAxNzowOSwgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBl
cnYvcHJpdmF0ZS5oCj4+PiArKysgYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3ByaXZhdGUu
aAo+Pj4gQEAgLTI2LDYgKzI2LDYgQEAKPj4+ICAKPj4+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAq
LCBodl9pbnB1dF9wYWdlKTsKPj4+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Np
c3QpOwo+Pj4gLURFQ0xBUkVfUEVSX0NQVSh1bnNpZ25lZCBpbnQsIGh2X3ZwX2luZGV4KTsKPj4+
ICtERUNMQVJFX1BFUl9DUFUodWludDMyX3QsIGh2X3ZwX2luZGV4KTsKPj4KPj4gWW91J3ZlIGdv
dCBhIGNvLW1haW50YWluZXIgYWNrLCBpLmUuIHNvIGJlIGl0LCBidXQgRlRSIHRoaXMgaXMKPj4g
YWdhaW5zdCB3aGF0IENvZGluZ1N0eWxlIHNheXMsIGFmYWljdDogIkZpeGVkIHdpZHRoIHR5cGVz
IHNob3VsZAo+PiBvbmx5IGJlIHVzZWQgd2hlbiBhIGZpeGVkIHdpZHRoIHF1YW50aXR5IGlzIG1l
YW50ICh3aGljaCBmb3IKPj4gZXhhbXBsZSBtYXkgYmUgYSB2YWx1ZSByZWFkIGZyb20gb3IgdG8g
YmUgd3JpdHRlbiB0byBhIHJlZ2lzdGVyKS4iCj4+IElmIHlvdSBoYW5kZWQgdGhlIGFkZHJlc3Mg
KHBlcmhhcHMgaW5kaXJlY3RseSwgZS5nLiBieSBjb252ZXJ0aW5nCj4+IHRvIGEgcGh5c2ljYWwg
b25lIGZpcnN0KSBvZiB0aGlzIHZhcmlhYmxlIHRvIEh5cGVyLVYsIHRoZW4gdGhpbmdzCj4+IHdv
dWxkIGJlIGRpZmZlcmVudC4gQnV0Cj4+Cj4+ICAgICB0aGlzX2NwdShodl92cF9pbmRleCkgPSB2
cF9pbmRleF9tc3I7Cj4+Cj4+IHdvdWxkLCBpZiB1bnNpZ25lZCBpbnQgd2FzIHdpZGVyIHRoYW4g
MzIgYml0cywgbm90IGNhdXNlIGFueQo+IAo+IERpZCB5b3UgbWVhbiAid291bGRuJ3QiIGhlcmU/
CgpJIGRvbid0IHRoaW5rIHNvIC0gdGhlIG5vdCBjb21lcyBhZnRlciB0aGUgc2Vjb25kIGNvbW1h
LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
