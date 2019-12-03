Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2F01100AA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 15:56:19 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9ZJ-0001sb-0Q; Tue, 03 Dec 2019 14:54:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9ZH-0001sV-LE
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 14:54:23 +0000
X-Inumbo-ID: cac0a76c-15dc-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cac0a76c-15dc-11ea-b155-bc764e2007e4;
 Tue, 03 Dec 2019 14:54:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 61E61B494;
 Tue,  3 Dec 2019 14:54:22 +0000 (UTC)
To: Wei Liu <wl@xen.org>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-8-liuwe@microsoft.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
Date: Tue, 3 Dec 2019 15:54:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191130115737.15752-8-liuwe@microsoft.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 7/8] x86: be more verbose when running on
 a hypervisor
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

T24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiBBbHNvIHJlcGxhY2UgcmVmZXJl
bmNlIHRvIHhlbl9ndWVzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNy
b3NvZnQuY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkhv
d2V2ZXIsIC4uLgoKPiAtLS0gYS94ZW4vYXJjaC94ODYvc2V0dXAuYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9zZXR1cC5jCj4gQEAgLTcwMCw2ICs3MDAsNyBAQCB2b2lkIF9faW5pdCBub3JldHVybiBf
X3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+ICAgICAgICAgIC5tYXhfZ3JhbnRfZnJh
bWVzID0gLTEsCj4gICAgICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSAtMSwKPiAgICAgIH07
Cj4gKyAgICBjb25zdCBjaGFyICpoeXBlcnZpc29yX25hbWU7Cj4gIAo+ICAgICAgLyogQ3JpdGlj
YWwgcmVnaW9uIHdpdGhvdXQgSURUIG9yIFRTUy4gIEFueSBmYXVsdCBpcyBkZWFkbHkhICovCj4g
IAo+IEBAIC03NjMsNyArNzY0LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4o
dW5zaWduZWQgbG9uZyBtYmlfcCkKPiAgICAgICAqIGFsbG9jaW5nIGFueSB4ZW5oZWFwIHN0cnVj
dHVyZXMgd2FudGVkIGluIGxvd2VyIG1lbW9yeS4gKi8KPiAgICAgIGtleGVjX2Vhcmx5X2NhbGN1
bGF0aW9ucygpOwo+ICAKPiAtICAgIGh5cGVydmlzb3JfcHJvYmUoKTsKPiArICAgIGh5cGVydmlz
b3JfbmFtZSA9IGh5cGVydmlzb3JfcHJvYmUoKTsKCi4uLiB5b3Ugbm8gbG9uZ2VyIGNhbGxpbmcg
dGhpcyBmdW5jdGlvbiBtdWx0aXBsZSB0aW1lLCB3aHkgZG9lcwpwYXRjaCA0IHN0aWxsIHB1dCBp
biBhIHJlc3BlY3RpdmUgZ3VhcmQ/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
