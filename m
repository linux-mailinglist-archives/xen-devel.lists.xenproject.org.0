Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 756951100F3
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 16:14:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ic9pK-0003Zi-Uf; Tue, 03 Dec 2019 15:10:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=zSMg=ZZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ic9pI-0003Zd-Nv
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 15:10:56 +0000
X-Inumbo-ID: 1aa13934-15df-11ea-b155-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aa13934-15df-11ea-b155-bc764e2007e4;
 Tue, 03 Dec 2019 15:10:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29D6BBB19;
 Tue,  3 Dec 2019 15:10:55 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191129112851.19273-1-roger.pau@citrix.com>
 <20191129112851.19273-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0bcf69cf-646a-fd72-4216-6819554e34d9@suse.com>
Date: Tue, 3 Dec 2019 16:11:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191129112851.19273-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/4] x86/ioapic: only use dest32 with
 x2apic and interrupt remapping enabled
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMjoyOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9pb19hcGljLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaW9fYXBpYy5jCj4gQEAgLTU2
Miw3ICs1NjIsNyBAQCBzZXRfaW9hcGljX2FmZmluaXR5X2lycShzdHJ1Y3QgaXJxX2Rlc2MgKmRl
c2MsIGNvbnN0IGNwdW1hc2tfdCAqbWFzaykKPiAgCj4gICAgICBkZXN0ID0gc2V0X2Rlc2NfYWZm
aW5pdHkoZGVzYywgbWFzayk7Cj4gICAgICBpZiAoZGVzdCAhPSBCQURfQVBJQ0lEKSB7Cj4gLSAg
ICAgICAgaWYgKCAheDJhcGljX2VuYWJsZWQgKQo+ICsgICAgICAgIGlmICggIWlvbW11X2ludHJl
bWFwICkKClRvIG1hdGNoIGRlc2NyaXB0aW9uIGFzIHdlbGwgYXMgdGhlIG90aGVyIGNoYW5nZXMg
ZG9uZSwgZG9lc24ndAp0aGlzIG5lZWQgdG8gYmUgIiF4MmFwaWNfZW5hYmxlZCB8fCAhaW9tbXVf
aW50cmVtYXAiPwoKamFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
