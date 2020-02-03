Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5FA150733
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 14:29:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iybk6-0006ZZ-BD; Mon, 03 Feb 2020 13:26:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iybk5-0006ZU-9K
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 13:26:21 +0000
X-Inumbo-ID: c3cdbc10-4688-11ea-8e58-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3cdbc10-4688-11ea-8e58-12813bfff9fa;
 Mon, 03 Feb 2020 13:26:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC9C9AD07;
 Mon,  3 Feb 2020 13:26:19 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20200131174930.31045-1-liuwe@microsoft.com>
 <20200131174930.31045-7-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a2bb1224-2717-5160-5f65-3a4ddaab08c9@suse.com>
Date: Mon, 3 Feb 2020 14:26:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200131174930.31045-7-liuwe@microsoft.com>
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

T24gMzEuMDEuMjAyMCAxODo0OSwgV2VpIExpdSB3cm90ZToKPiAtLS0gYS94ZW4vYXJjaC94ODYv
bW0uYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS5jCj4gQEAgLTM3NSw5ICszNzUsMTEgQEAgdm9p
ZCBfX2luaXQgYXJjaF9pbml0X21lbW9yeSh2b2lkKQo+ICAgICAgfQo+ICAjZW5kaWYKPiAgCj4g
LSAgICAvKiBHZW5lcmF0ZSBhIHN5bWJvbCB0byBiZSB1c2VkIGluIGxpbmtlciBzY3JpcHQgKi8K
PiArICAgIC8qIEdlbmVyYXRlIHN5bWJvbHMgdG8gYmUgdXNlZCBpbiBsaW5rZXIgc2NyaXB0ICov
Cj4gICAgICBhc20gKCAiLmVxdSBGSVhBRERSX1hfU0laRSwgJVAwOyAuZ2xvYmFsIEZJWEFERFJf
WF9TSVpFIgo+ICAgICAgICAgICAgOjogImkiIChGSVhBRERSX1hfU0laRSkgKTsKPiArICAgIGFz
bSAoICIuZXF1IEhWX0hDQUxMX1BBR0UsICVQMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgo+ICsg
ICAgICAgICAgOjogImkiIChfX2ZpeF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkgKTsK
CldvdWxkIHRoaXMgZXZlbiBidWlsZCB3aXRob3V0IENPTkZJR19IWVBFUlZfR1VFU1Q/IEluIGFu
eSBldmVudAppdCBkb2Vzbid0IGJlbG9uZyBoZXJlLCBidXQgc2hvdWxkIGdvIGluIGEgSHlwZXIt
ViBzcGVjaWZpYwpmaWxlLgoKU2VlaW5nIHlvdSBub3cgbmVlZCB0d28gb2YgdGhlc2UsIGhvdyBh
Ym91dCBtYWNyby1pemluZyB0aGUKY29uc3RydWN0PwoKSmFuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
