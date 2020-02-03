Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153F1507B4
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:51:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyc5h-00009V-V6; Mon, 03 Feb 2020 13:48:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyc5g-00009Q-6y
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:48:40 +0000
X-Inumbo-ID: e19bf57e-468b-11ea-8e59-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e19bf57e-468b-11ea-8e59-12813bfff9fa;
 Mon, 03 Feb 2020 13:48:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4500CAD86;
 Mon,  3 Feb 2020 13:48:38 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-7-liuwe@microsoft.com>
 <a2bb1224-2717-5160-5f65-3a4ddaab08c9@suse.com>
 <20200203133106.lptq6sy5dxfzrd2c@debian>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a4930d1b-ee60-461a-eaf3-47dfc14eea5a@suse.com>
Date: Mon, 3 Feb 2020 14:48:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203133106.lptq6sy5dxfzrd2c@debian>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 06/11] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNDozMSwgV2VpIExpdSB3cm90ZToKPiBPbiBNb24sIEZlYiAwMywgMjAy
MCBhdCAwMjoyNjoyNFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMzEuMDEuMjAy
MCAxODo0OSwgV2VpIExpdSB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvbW0uYwo+Pj4gQEAgLTM3NSw5ICszNzUsMTEgQEAgdm9pZCBfX2lu
aXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQo+Pj4gICAgICB9Cj4+PiAgI2VuZGlmCj4+PiAgCj4+
PiAtICAgIC8qIEdlbmVyYXRlIGEgc3ltYm9sIHRvIGJlIHVzZWQgaW4gbGlua2VyIHNjcmlwdCAq
Lwo+Pj4gKyAgICAvKiBHZW5lcmF0ZSBzeW1ib2xzIHRvIGJlIHVzZWQgaW4gbGlua2VyIHNjcmlw
dCAqLwo+Pj4gICAgICBhc20gKCAiLmVxdSBGSVhBRERSX1hfU0laRSwgJVAwOyAuZ2xvYmFsIEZJ
WEFERFJfWF9TSVpFIgo+Pj4gICAgICAgICAgICA6OiAiaSIgKEZJWEFERFJfWF9TSVpFKSApOwo+
Pj4gKyAgICBhc20gKCAiLmVxdSBIVl9IQ0FMTF9QQUdFLCAlUDA7IC5nbG9iYWwgSFZfSENBTExf
UEFHRSIKPj4+ICsgICAgICAgICAgOjogImkiIChfX2ZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJW
X0hDQUxMKSkgKTsKPj4KPj4gV291bGQgdGhpcyBldmVuIGJ1aWxkIHdpdGhvdXQgQ09ORklHX0hZ
UEVSVl9HVUVTVD8gSW4gYW55IGV2ZW50Cj4+IGl0IGRvZXNuJ3QgYmVsb25nIGhlcmUsIGJ1dCBz
aG91bGQgZ28gaW4gYSBIeXBlci1WIHNwZWNpZmljCj4+IGZpbGUuCj4+Cj4gCj4gR29vZCBjYXRj
aC4gV2hlbiBJIGRpZCBteSBmdWxsIGJ1aWxkIHRlc3RzIGl0IHdhcyBkb25lIHdpdGggbXkgcHJl
dmlvdXMKPiB2ZXJzaW9uLgo+IAo+IEkgY2FuIG1vdmUgdGhpcyB0byBoeXBlcnYuYy4KPiAKPj4g
U2VlaW5nIHlvdSBub3cgbmVlZCB0d28gb2YgdGhlc2UsIGhvdyBhYm91dCBtYWNyby1pemluZyB0
aGUKPj4gY29uc3RydWN0Pwo+IAo+IFdoYXQgbmFtZSB3b3VsZCB5b3Ugc3VnZ2VzdD8gSSdtIHRo
aW5raW5nIGFib3V0IEdFTl9YRU5fTERTX1NZTUJPTC4KCkluIHByaW5jaXBsZSB0aGlzIGlzbid0
IGxpbWl0aW5nIHRoaW5ncyB0byB1c2UgYnkgeGVuLmxkcywgc28KSSdkIHByZWZlciB0byBub3Qg
ZW5jb2RlIHN1Y2ggaW4gdGhlIG5hbWUuIGFzbV9jb25zdGFudCgpPyBPcgphbGwgY2FwcyBpZiBz
byBwcmVmZXJyZWQgYnkgb3RoZXJzPwoKPiBBbmQgcHJlc3VtYWJseSBJIHNob3VsZCBwdXQgaXQg
aW4geGVuL2xpYi5oPwoKV291bGQgYmUgbmljZSB0byBoYXZlIGl0IHRoZXJlLCBidXQgSSdtIGFm
cmFpZCB0aGlzIGlzIGFnYWluc3QKd2hhdCBnY2MgZG9jdW1lbnRzLiBIZW5jZSBpZiBhbnl0aGlu
ZyB0aGUgUCB3b3VsZCBuZWVkIHRvIGJlCmFic3RyYWN0ZWQgYXdheSBhcyBhIHBlci1hcmNoIHRo
aW5nLiBJZiB5b3UgZG9uJ3Qgd2FudCB0byBnbwp0aGlzIGZhciwgYXNtX2RlZm5zLmggbWlnaHQg
YmUgdGhlIGJlc3QgZml0IGFtb25nIHRoZSB4ODYKaGVhZGVycy4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
