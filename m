Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C66E15BBFF
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 10:49:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2B5H-0004Kn-1Y; Thu, 13 Feb 2020 09:46:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PyN9=4B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j2B5F-0004Ki-IC
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 09:46:57 +0000
X-Inumbo-ID: c4fcfaa0-4e45-11ea-b86a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4fcfaa0-4e45-11ea-b86a-12813bfff9fa;
 Thu, 13 Feb 2020 09:46:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A751CB1F1;
 Thu, 13 Feb 2020 09:46:54 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-2-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <628b1e12-527d-5457-b97d-09c3d530ebbb@suse.com>
Date: Thu, 13 Feb 2020 10:46:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200212160918.18470-2-liuwe@microsoft.com>
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

T24gMTIuMDIuMjAyMCAxNzowOSwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
Z3Vlc3QvaHlwZXJ2L3ByaXZhdGUuaAo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYv
cHJpdmF0ZS5oCj4gQEAgLTI2LDYgKzI2LDYgQEAKPiAgCj4gIERFQ0xBUkVfUEVSX0NQVSh2b2lk
ICosIGh2X2lucHV0X3BhZ2UpOwo+ICBERUNMQVJFX1BFUl9DUFUodm9pZCAqLCBodl92cF9hc3Np
c3QpOwo+IC1ERUNMQVJFX1BFUl9DUFUodW5zaWduZWQgaW50LCBodl92cF9pbmRleCk7Cj4gK0RF
Q0xBUkVfUEVSX0NQVSh1aW50MzJfdCwgaHZfdnBfaW5kZXgpOwoKWW91J3ZlIGdvdCBhIGNvLW1h
aW50YWluZXIgYWNrLCBpLmUuIHNvIGJlIGl0LCBidXQgRlRSIHRoaXMgaXMKYWdhaW5zdCB3aGF0
IENvZGluZ1N0eWxlIHNheXMsIGFmYWljdDogIkZpeGVkIHdpZHRoIHR5cGVzIHNob3VsZApvbmx5
IGJlIHVzZWQgd2hlbiBhIGZpeGVkIHdpZHRoIHF1YW50aXR5IGlzIG1lYW50ICh3aGljaCBmb3IK
ZXhhbXBsZSBtYXkgYmUgYSB2YWx1ZSByZWFkIGZyb20gb3IgdG8gYmUgd3JpdHRlbiB0byBhIHJl
Z2lzdGVyKS4iCklmIHlvdSBoYW5kZWQgdGhlIGFkZHJlc3MgKHBlcmhhcHMgaW5kaXJlY3RseSwg
ZS5nLiBieSBjb252ZXJ0aW5nCnRvIGEgcGh5c2ljYWwgb25lIGZpcnN0KSBvZiB0aGlzIHZhcmlh
YmxlIHRvIEh5cGVyLVYsIHRoZW4gdGhpbmdzCndvdWxkIGJlIGRpZmZlcmVudC4gQnV0CgogICAg
dGhpc19jcHUoaHZfdnBfaW5kZXgpID0gdnBfaW5kZXhfbXNyOwoKd291bGQsIGlmIHVuc2lnbmVk
IGludCB3YXMgd2lkZXIgdGhhbiAzMiBiaXRzLCBub3QgY2F1c2UgYW55Cmlzc3Vlcy4gQW5kIHRo
aXMgaXMgdGhlIG9ubHkgcGxhY2UgdGhlIHZhcmlhYmxlIGN1cnJlbnRseSBnZXRzCmFjY2Vzc2Vk
LCBhbmQgSSBleHBlY3QgZnV0dXJlIHVzZXMgd2lsbCBqdXN0IGJlIHJlYWRzIG9mIGl0IChhcwpj
YW4gYmUgc2VlbiBsYXRlciBpbiB0aGUgc2VyaWVzKS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
