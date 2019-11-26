Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F4910A186
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:52:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZd7S-0001gf-61; Tue, 26 Nov 2019 15:51:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZd7R-0001ga-16
 for xen-devel@lists.xen.org; Tue, 26 Nov 2019 15:51:13 +0000
X-Inumbo-ID: 918db57a-1064-11ea-a3a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 918db57a-1064-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:51:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C8C7A699B6;
 Tue, 26 Nov 2019 15:51:10 +0000 (UTC)
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <20191126154153.12144-1-sergey.dyasli@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b162e321-22ea-d552-0914-ee2e74f7a108@suse.com>
Date: Tue, 26 Nov 2019 16:51:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126154153.12144-1-sergey.dyasli@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 for 4.13] x86/microcode: refuse to load
 the same revision ucode
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Chao Gao <chao.gao@intel.com>, xen-devel@lists.xen.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNjo0MSwgU2VyZ2V5IER5YXNsaSB3cm90ZToKPiBDdXJyZW50bHkgaWYg
YSB1c2VyIHRyaWVzIHRvIGxpdmUtbG9hZCB0aGUgc2FtZSBvciBvbGRlciB1Y29kZSByZXZpc2lv
bgo+IHRoYW4gQ1BVIGFscmVhZHkgaGFzLCBoZSB3aWxsIGdldCBhIHNpbmdsZSBtZXNzYWdlIGlu
IFhlbiBsb2cgbGlrZToKPiAKPiAgICAgKFhFTikgMTI4IGNvcmVzIGFyZSB0byB1cGRhdGUgdGhl
aXIgbWljcm9jb2RlCj4gCj4gTm8gYWN0dWFsIHVjb2RlIGxvYWRpbmcgd2lsbCBoYXBwZW4gYW5k
IHRoaXMgc2l0dWF0aW9uIGNhbiBiZSBxdWl0ZQo+IGNvbmZ1c2luZy4gRml4IHRoaXMgYnkgc3Rh
cnRpbmcgdWNvZGUgdXBkYXRlIG9ubHkgd2hlbiB0aGUgcHJvdmlkZWQKPiB1Y29kZSByZXZpc2lv
biBpcyBoaWdoZXIgdGhhbiB0aGUgY3VycmVudGx5IGNhY2hlZCBvbmUgKGlmIGFueSkuCj4gVGhp
cyBpcyBiYXNlZCBvbiB0aGUgcHJvcGVydHkgdGhhdCBpZiBtaWNyb2NvZGVfY2FjaGUgZXhpc3Rz
LCBhbGwgQ1BVcwo+IGluIHRoZSBzeXN0ZW0gc2hvdWxkIGhhdmUgYXQgbGVhc3QgdGhhdCB1Y29k
ZSByZXZpc2lvbi4KPiAKPiBBZGRpdGlvbmFsbHksIHByaW50IGEgdXNlciBmcmllbmRseSBtZXNz
YWdlIGlmIG5vIG1hdGNoaW5nIG9yIG5ld2VyCj4gdWNvZGUgY2FuIGJlIGZvdW5kIGluIHRoZSBw
cm92aWRlZCBibG9iLiBUaGlzIGFsc28gcmVxdWlyZXMgaWdub3JpbmcKPiAtRU5PREFUQSBpbiBB
TUQtc2lkZSBjb2RlLCBvdGhlcndpc2UgdGhlIG1lc3NhZ2UgZ2l2ZW4gdG8gdGhlIHVzZXIgaXM6
Cj4gCj4gICAgIChYRU4pIFBhcnNpbmcgbWljcm9jb2RlIGJsb2IgZXJyb3IgLTYxCj4gCj4gV2hp
Y2ggYWN0dWFsbHkgbWVhbnMgdGhhdCBhIHVjb2RlIGJsb2Igd2FzIHBhcnNlZCBmaW5lLCBidXQg
bm8gbWF0Y2hpbmcKPiB1Y29kZSB3YXMgZm91bmQuCj4gCj4gU2lnbmVkLW9mZi1ieTogU2VyZ2V5
IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
