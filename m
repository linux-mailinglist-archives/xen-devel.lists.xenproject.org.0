Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5936710D629
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 14:35:48 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iagNQ-0003iV-CG; Fri, 29 Nov 2019 13:32:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mjd+=ZV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iagNP-0003iQ-Af
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 13:32:03 +0000
X-Inumbo-ID: 9fea159c-12ac-11ea-a3e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fea159c-12ac-11ea-a3e6-12813bfff9fa;
 Fri, 29 Nov 2019 13:32:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0098BB11E;
 Fri, 29 Nov 2019 13:32:00 +0000 (UTC)
To: "DOZ, MARC (ext)" <marc.doz.external@atos.net>
References: <AM0PR02MB4385A7921A8F857539C71241D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
 <8e1dd854-b5d0-b433-50f1-0bfb1ec6b31a@suse.com>
 <AM0PR02MB43853D082C1BC7416DED0064D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3bf372da-4a89-090a-5573-2d12c654ac52@suse.com>
Date: Fri, 29 Nov 2019 14:32:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <AM0PR02MB43853D082C1BC7416DED0064D3460@AM0PR02MB4385.eurprd02.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] bug suspcion and proposed modification when
 xen-pciback failed to map an irq (-19) to a domU
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjkuMTEuMjAxOSAxMzozNCwgIERPWiwgTUFSQyAoZXh0KSAgd3JvdGU6Cj4gCj4+IEV4Y2Vw
dCB0aGF0IHRoaXMgaXMgbm90IGEgImZpeCIsIGJ1dCB0aGUgaW50cm9kdWN0aW9uIG9mIGEgc2Vj
dXJpdHkgdnVsbmVyYWJpbGl0eSAocGVybWl0dGluZyBpbnRlcnJ1cHQgc2V0dXAgb24gdW4tb3du
ZWQgZGV2aWNlcykuIFNlZSBYU0EtMjM3LCB3aGljaCBhY3R1YWxseSBjaGFuZ2VkIGl0IGluIHRo
ZSBvcHBvc2l0ZSBkaXJlY3Rpb24gb2Ygd2hhdCB5b3UncmUgcHJvcG9zaW5nLgo+IAo+IE9rLCBJ
IGZvdW5kIGl0IDoKPiBodHRwczovL3hlbmJpdHMueGVuLm9yZy94c2EveHNhMjM3LTQuNS8wMDAx
LXg4Ni1kb250LWFsbG93LU1TSS1wSVJRLW1hcHBpbmctb24tdW5vd25lZC1kZXZpY2UucGF0Y2gK
PiAKPiAiTVNJIHNldHVwIHNob3VsZCBiZSBwZXJtaXR0ZWQgb25seSBmb3IgZXhpc3RpbmcgZGV2
aWNlcyBvd25lZCBieSB0aGUgcmVzcGVjdGl2ZSBndWVzdCIgCj4gCj4gQnV0IGhvdyB0byBjaGFu
Z2UgdGhlIG93bmVyIG9mIG15IGRldmljZSBvciB1cGRhdGUgdGhlIHBkZXYtPmRvbWFpbi0+ZG9t
YWluX2lkID8KCldpdGggdGhlIGNvZGUgYXMgaXMgYW5kIHdpdGhvdXQgYW4gSU9NTVUgdGhlcmUn
cyBubyBwcmUtY29va2VkCndheSB0bywgSSdtIGFmcmFpZC4gWW91IGNvdWxkIHRyeSBncmFudGlu
ZyB0aGUgZ3Vlc3QgYWNjZXNzIHRvCk1NSU8gYW5kIElSUSAibWFudWFsbHkiICh0aGVyZSBhcmUg
Z3Vlc3QgY29uZmlnIGZpbGUgb3B0aW9ucwpmb3IgdGhpcyksIGJ1dCBJIHRha2UgaXQgeW91J2xs
IGJlIGluIHRyb3VibGUgaWYgKGFzIGlpcmMgeW91J3ZlCnNhaWQpIHRoZSBkZXZpY2UgLyBkcml2
ZXIgd2FudCB0byB1c2UgTVNJLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
