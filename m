Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A7B38F4
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:02:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9ojc-0004YH-R5; Mon, 16 Sep 2019 10:59:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9ojb-0004Y1-GZ
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 10:59:55 +0000
X-Inumbo-ID: 1cdf9b1a-d871-11e9-95de-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1cdf9b1a-d871-11e9-95de-12813bfff9fa;
 Mon, 16 Sep 2019 10:59:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7173AB681;
 Mon, 16 Sep 2019 10:59:53 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fea95a3-a7d4-4157-7f87-45c95aaaf9b9@suse.com>
Date: Mon, 16 Sep 2019 12:59:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 03/10] libx86: Introduce
 x86_cpu_policies_are_compatible()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIveGVuL2xpYi94ODYvcG9saWN5LmMKPiBAQCAtMCwwICsxLDU0IEBACj4gKyNpbmNs
dWRlICJwcml2YXRlLmgiCj4gKwo+ICsjaW5jbHVkZSA8eGVuL2xpYi94ODYvY3B1LXBvbGljeS5o
Pgo+ICsKPiAraW50IHg4Nl9jcHVfcG9saWNpZXNfYXJlX2NvbXBhdGlibGUoY29uc3Qgc3RydWN0
IGNwdV9wb2xpY3kgKmhvc3QsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNvbnN0IHN0cnVjdCBjcHVfcG9saWN5ICpndWVzdCwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RydWN0IGNwdV9wb2xpY3lfZXJyb3JzICplcnIpCj4gK3sKPiArICAg
IHN0cnVjdCBjcHVfcG9saWN5X2Vycm9ycyBlID0gSU5JVF9DUFVfUE9MSUNZX0VSUk9SUzsKPiAr
ICAgIGludCByZXQgPSAtRUlOVkFMOwo+ICsKPiArICAgIGlmICggZXJyICkKPiArICAgICAgICAq
ZXJyID0gZTsKCllvdSBkb24ndCByZWFsbHkgbmVlZCB0aGlzLCBkbyB5b3U/IEFsbCBwYXRocyBs
ZWFkIC4uLgoKPiArI2RlZmluZSBOQSBYRU5fQ1BVSURfTk9fU1VCTEVBRgo+ICsjZGVmaW5lIEZB
SUxfQ1BVSUQobCwgcykgXAo+ICsgICAgZG8geyBlLmxlYWYgPSAobCk7IGUuc3VibGVhZiA9IChz
KTsgZ290byBvdXQ7IH0gd2hpbGUgKCAwICkKPiArI2RlZmluZSBGQUlMX01TUihtKSBcCj4gKyAg
ICBkbyB7IGUubXNyID0gKG0pOyBnb3RvIG91dDsgfSB3aGlsZSAoIDAgKQo+ICsKPiArICAgIGlm
ICggZ3Vlc3QtPmNwdWlkLT5iYXNpYy5tYXhfbGVhZiA+IGhvc3QtPmNwdWlkLT5iYXNpYy5tYXhf
bGVhZiApCj4gKyAgICAgICAgRkFJTF9DUFVJRCgwLCBOQSk7Cj4gKwo+ICsgICAgaWYgKCBndWVz
dC0+Y3B1aWQtPmV4dGQubWF4X2xlYWYgPiBob3N0LT5jcHVpZC0+ZXh0ZC5tYXhfbGVhZiApCj4g
KyAgICAgICAgRkFJTF9DUFVJRCgweDgwMDAwMDA4LCBOQSk7Cj4gKwo+ICsgICAgLyogVE9ETzog
QXVkaXQgbW9yZSBDUFVJRCBkYXRhLiAqLwo+ICsKPiArICAgIGlmICggfmhvc3QtPm1zci0+cGxh
dGZvcm1faW5mby5yYXcgJiBndWVzdC0+bXNyLT5wbGF0Zm9ybV9pbmZvLnJhdyApCj4gKyAgICAg
ICAgRkFJTF9NU1IoTVNSX0lOVEVMX1BMQVRGT1JNX0lORk8pOwo+ICsKPiArI3VuZGVmIEZBSUxf
TVNSCj4gKyN1bmRlZiBGQUlMX0NQVUlECj4gKyN1bmRlZiBOQQo+ICsKPiArICAgIC8qIFN1Y2Nl
c3MuICovCj4gKyAgICByZXQgPSAwOwo+ICsKPiArIG91dDoKPiArICAgIGlmICggcmV0ICYmIGVy
ciApCj4gKyAgICAgICAgKmVyciA9IGU7CgouLi4gaGVyZSwgYW5kIGhlbmNlIHlvdSBjb3VsZCBz
aW1wbHkgZHJvcCB0aGUgInJldCAmJiIgcGFydCBvZiB0aGUKY29uZGl0aW9uLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
