Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0807B113EA3
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:53:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnnE-0002SK-FF; Thu, 05 Dec 2019 09:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnnC-0002SF-Tv
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:51:26 +0000
X-Inumbo-ID: cd0503a6-1744-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd0503a6-1744-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 09:51:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C2E2FB17F;
 Thu,  5 Dec 2019 09:51:24 +0000 (UTC)
To: "Xia, Hongyan" <hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
 <b6c93e86-0b3a-2b39-4e06-6c888191df12@suse.com>
 <16bdd981299ef440eacd38df92f3fd76e7a13521.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <baa3ab5b-d4ae-ab88-56af-2364cba39abc@suse.com>
Date: Thu, 5 Dec 2019 10:51:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <16bdd981299ef440eacd38df92f3fd76e7a13521.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 0/9] Add alternative API for Xen PTEs
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxMDo0MSwgWGlhLCBIb25neWFuIHdyb3RlOgo+IEkgaGF2ZSBhZGRyZXNz
ZWQgdGhlIGNvbW1lbnRzIHRoYXQgSSBjYW4gZmluZCBpbiB0aGUgYXJjaGl2ZS4KClRoYXQncyBz
dGlsbCBwcmV0dHkgdmFndWUgLSBpcyB0aGVyZSByZWFzb24gdG8gYXNzdW1lIHlvdSB3ZXJlCm5v
dCBhYmxlIHRvIGZpbmQgc29tZSBjb21tZW50cyB0aGVyZT8KCj4gU29tZSBiaWcKPiBkZWJhdGVz
IChsaWtlIF9uZXcgb3Igbm90IF9uZXcsIHdoZXRoZXIgdG8gbW9kdWxhcmlzZSBtYXBfcGFnZXNf
dG9feGVuKQo+IGhhdmUgbm90IGJlZW4gdG91Y2hlZC4KClRoZSBfbmV3IHN1ZmZpeCBkaXNjdXNz
aW9uIHlvdSd2ZSBtZWFud2hpbGUgcmVzcG9uZGVkIHlvdSwKd2hpY2ggaXMgdGhlcmVmb3JlIGZp
bmUuIFRoZSBtb2R1bGFyaXphdGlvbiBxdWVzdGlvbiwgb3RvaCwKSSBkb24ndCByZWNhbGwgc2Vl
aW5nIGFueSByZXBseSBmb3IsIGFuZCBoZW5jZSBmb3Igbm93IEknZApza2lwIHJlLXJldmlld2lu
ZyB0aGUgcmVzcGVjdGl2ZSBwYXRjaGVzLiBGdXJ0aGVybW9yZSwgaXMKeW91ciB1c2Ugb2YgImxp
a2UiIGltcGx5aW5nIHRoZXJlIHdlcmUgbW9yZSB0aGFuIHRoZSB0d28KZXhhbXBsZXMgeW91IGdh
dmU/IEFzIG11Y2ggYXMgSSBjYW4gdW5kZXJzdGFuZCBkaWZmaWN1bHRpZXMKb24geW91ciBwYXJ0
IHJlc3VsdGluZyBmcm9tIHlvdXIgZW1haWwgaXNzdWVzLCBwbGVhc2UgYWxzbwp1bmRlcnN0YW5k
IG15IHJlc2VydmF0aW9ucyByZWdhcmRpbmcgaGF2aW5nIHRvIHJlLWRvIHRoaW5ncwp3aGVyZSBx
dWl0ZSBhIGJpdCBvZiB0aW1lIGhhZCBhbHJlYWR5IGJlZW4gaW52ZXN0ZWQgaW50by4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
