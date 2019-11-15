Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A376FDF77
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 14:57:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVc4n-0000i0-OJ; Fri, 15 Nov 2019 13:55:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVc4l-0000hl-Bd
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 13:55:51 +0000
X-Inumbo-ID: a162e44c-07af-11ea-a26f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a162e44c-07af-11ea-a26f-12813bfff9fa;
 Fri, 15 Nov 2019 13:55:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 447BFAFF4;
 Fri, 15 Nov 2019 13:55:49 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-8-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <873de021-3a26-d593-2175-adb3b35ea911@suse.com>
Date: Fri, 15 Nov 2019 14:56:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191021155718.28653-8-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-next v3 7/9] x86: switch xen
 implementation to use hypervisor framework
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
Cc: Xen Development List <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <liuwe@microsoft.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiBAQCAtMzEsOSArMzEsMzkgQEAg
Ym9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpCj4gICAgICBpZiAoIGhvcHMgKQo+ICAgICAgICAg
IHJldHVybiB0cnVlOwo+ICAKPiArICAgIC8qIFRvbyBlYXJseSB0byB1c2UgY3B1X2hhc19oeXBl
cnZpc29yICovCj4gKyAgICBpZiAoICEoY3B1aWRfZWN4KDEpICYgY3B1ZmVhdF9tYXNrKFg4Nl9G
RUFUVVJFX0hZUEVSVklTT1IpKSApCj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArI2lm
ZGVmIENPTkZJR19YRU5fR1VFU1QKPiArICAgIGlmICggeGVuX3Byb2JlKCkgKQo+ICsgICAgewo+
ICsgICAgICAgIGhvcHMgPSAmeGVuX29wczsKPiArICAgICAgICByZXR1cm4gdHJ1ZTsKPiArICAg
IH0KPiArI2VuZGlmCj4gKwo+ICAgICAgcmV0dXJuIGZhbHNlOwo+ICB9Cj4gIAo+ICt2b2lkIGh5
cGVydmlzb3Jfc2V0dXAodm9pZCkKCl9faW5pdD8KCj4gQEAgLTMzMCw2ICszMjUsMTMgQEAgdm9p
ZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKQo+ICAgICAgICAgIHB2X2NvbnNvbGVfaW5pdCgpOwo+
ICB9Cj4gIAo+ICtzdHJ1Y3QgaHlwZXJ2aXNvcl9vcHMgeGVuX29wcyA9IHsKCmNvbnN0ICh3aWxs
IHJlcXVpcmUgYSBjb3JyZXNwb25kaW5nIGFkanVzdG1lbnQgaW4gdGhlIGVhcmxpZXIgcGF0Y2gK
dGhlbiB0b28pPwoKV2l0aCB0aGVzZSB0YWtlbiBjYXJlIG9mIGFuZCB0aGUgbmFtaW5nIHBvc3Np
Ymx5IGFkanVzdGVkIGFjY29yZGluZwp0byB3aGF0ZXZlciB0aGUgZGVjaXNpb24gb24gdGhlIGVh
cmxpZXIgcGF0Y2ggcyBnb2luZyB0byBiZQpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
