Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EB616FC75
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 11:44:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6u9c-00053R-Na; Wed, 26 Feb 2020 10:43:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6u9c-00053M-36
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 10:43:00 +0000
X-Inumbo-ID: c10984ba-5884-11ea-93f3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c10984ba-5884-11ea-93f3-12813bfff9fa;
 Wed, 26 Feb 2020 10:42:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 353B6B048;
 Wed, 26 Feb 2020 10:42:58 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200225173133.3632-1-andrew.cooper3@citrix.com>
 <01fc1f0d-3889-32d0-de38-187a7d12f67d@suse.com>
 <f6517884-a20d-60ba-59e7-83ce7017f949@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13188ac9-2570-c1e6-3d24-d2ad77f03679@suse.com>
Date: Wed, 26 Feb 2020 11:43:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f6517884-a20d-60ba-59e7-83ce7017f949@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/sysctl: Don't return cpu policy data
 for compiled-out support
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

T24gMjYuMDIuMjAyMCAxMDo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyNi8wMi8yMDIw
IDA5OjMyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMjUuMDIuMjAyMCAxODozMSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFBvbGljeSBvYmplY3RzIGFyZW4ndCB0aW55LCBhbmQgdGhlIGRl
cml2YXRpb24gbG9naWMgaXNuJ3QgdHJpdmlhbC4gIFdlIGFyZQo+Pj4gYWJvdXQgdG8gaW5jcmVh
c2UgdGhlIG51bWJlciBvZiBwb2xpY3kgb2JqZWN0cywgc28gdGFrZSB0aGlzIG9wcG9ydHVuaXR5
IHRvCj4+PiBkcm9wIGxvZ2ljIGFuZCBzdG9yYWdlIHNwYWNlIGJhc2VkIG9uIENPTkZJR197UFYs
SFZNfS4KPj4gSXQgZG9lc24ndCBsb29rIGFzIGlmIHlvdSB3ZXJlIGRyb3BwaW5nIGVpdGhlciBs
b2dpYyBvciBzdG9yYWdlIHNwYWNlLiBXaXRoCj4+IHRoaXMgYXNwZWN0IHRha2VuIGNhcmUgb2Yg
KGJ5IGFkanVzdGluZyB3b3JkaW5nLCBvciBieSBjbGFyaWZpY2F0aW9uIG9mIHdoYXQKPj4gaXMg
bWVhbnQpIC4uLgo+Pgo+Pj4gU3RhcnQgYnkKPiAKPiBUaGF0IGlzIHRoaXMgaXMgaGVyZSB0byBz
aWduaWZ5LgoKSG93IGFib3V0IHMvdGFrZSB0aGlzL3dpbGwgaGF2ZSB0aGUvIGluIHRoZSBzZW50
ZW5jZSBmdXJ0aGVyIHVwIHRoZW4/ClRvIG1lLCAiU3RhcnQgYnkiIGluIG5vIHdheSBpbmRpY2F0
ZXMgdGhhdCByZWFsbHkgdGhlcmUgYXJlbid0IGFueQpzYXZpbmdzIHlldC4gTWlnaHQgYmUgbXkg
bm9uLW5hdGl2ZSBFbmdsaXNoIHVuZGVyc3RhbmRpbmcgb2YgdGhpcwpwaHJhc2UsIG9mIGNvdXJz
ZS4KCj4gTm8gbG9naWMgb3Igc3RvcmFnZSBzcGFjZSBjYW4gYmUgZHJvcHBlZCB1bnRpbCBzb21l
ICNpZmRlZi1hcnkgaXMKPiBzcHJpbmtsZWQgYXJvdW5kIGNwdWlkLmMgYW5kIG1zci5jLCBidXQg
SSBjYW4ndCBkbyBhbnkgb2YgdGhhdCB3aGlsZQo+IHRoZXJlIGFyZSB1bmd1YXJkZWQgZXh0ZXJu
YWwgcmVmZXJlbmNlcyB0byB0aGUgb2JqZWN0cy4KCk9mIGNvdXJzZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
