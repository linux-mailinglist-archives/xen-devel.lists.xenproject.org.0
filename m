Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EDBB3947
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2019 13:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i9p5f-0001x1-8W; Mon, 16 Sep 2019 11:22:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZJ1s=XL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i9p5d-0001ws-UJ
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2019 11:22:41 +0000
X-Inumbo-ID: 49ea2b68-d874-11e9-95e0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49ea2b68-d874-11e9-95e0-12813bfff9fa;
 Mon, 16 Sep 2019 11:22:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8B010AF5C;
 Mon, 16 Sep 2019 11:22:37 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190913192759.10795-1-andrew.cooper3@citrix.com>
 <20190913192759.10795-11-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <24ecd3eb-58fe-f859-3be1-e58c0e94b310@suse.com>
Date: Mon, 16 Sep 2019 13:22:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190913192759.10795-11-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 10/10] x86/cpuid: Enable CPUID Faulting
 for PV control domains by default
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

T24gMTMuMDkuMjAxOSAyMToyNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGUgZG9tYWluIGJ1
aWxkZXIgbm8gbG9uZ2VyIHVzZXMgbG9jYWwgQ1BVSUQgaW5zdHJ1Y3Rpb25zIGZvciBwb2xpY3kK
PiBkZWNpc2lvbnMuICBUaGlzIHJlc29sdmVzIGEga2V5IGlzc3VlIGZvciBQVkggZG9tMCdzLiAg
SG93ZXZlciwgYXMgUFYgZG9tMCdzCj4gaGF2ZSBuZXZlciBoYWQgZmF1bHRpbmcgZW5mb3JjZWQs
IGxlYXZlIGEgY29tbWFuZCBsaW5lIG9wdGlvbiB0byByZXN0b3JlIHRoZQo+IG9sZCBiZWhhdmlv
dXIuCj4gCj4gQWR2ZXJ0aXNlIHZpcnR1YWxpc2VkIGZhdWx0aW5nIHN1cHBvcnQgdG8gY29udHJv
bCBkb21haW5zIHVubGVzcyB0aGUgb3B0LW91dAo+IGhhcyBiZWVuIHVzZWQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CnBlcmhhcHMgd2l0aCAuLi4K
Cj4gLS0tIGEveGVuL2FyY2gveDg2L2RvbTBfYnVpbGQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9k
b20wX2J1aWxkLmMKPiBAQCAtMzA1LDYgKzMwNSw4IEBAIHN0YXRpYyBpbnQgX19pbml0IHBhcnNl
X2RvbTBfcGFyYW0oY29uc3QgY2hhciAqcykKPiAgI2VuZGlmCj4gICAgICAgICAgZWxzZSBpZiAo
ICh2YWwgPSBwYXJzZV9ib29sZWFuKCJ2ZXJib3NlIiwgcywgc3MpKSA+PSAwICkKPiAgICAgICAg
ICAgICAgb3B0X2RvbTBfdmVyYm9zZSA9IHZhbDsKPiArICAgICAgICBlbHNlIGlmICggKHZhbCA9
IHBhcnNlX2Jvb2xlYW4oImNwdWlkLWZhdWx0aW5nIiwgcywgc3MpKSA+PSAwICkKPiArICAgICAg
ICAgICAgb3B0X2RvbTBfY3B1aWRfZmF1bHRpbmcgPSB2YWw7CgouLi4gdGhpcyB3cmFwcGVkIGlu
ICIjaWZkZWYgQ09ORklHX1BWIiBvciBJU19FTkFCTEVEKENPTkZJR19QVikKYWRkZWQgdG8gdGhl
IGNvbmRpdGlvbj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
