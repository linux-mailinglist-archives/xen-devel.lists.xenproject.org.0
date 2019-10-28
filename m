Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335EBE6EAA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 10:06:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP0wR-00016D-He; Mon, 28 Oct 2019 09:03:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP0wP-000168-JH
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 09:03:57 +0000
X-Inumbo-ID: dd9ff0e6-f961-11e9-94f1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd9ff0e6-f961-11e9-94f1-12813bfff9fa;
 Mon, 28 Oct 2019 09:03:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3A2E3B04F;
 Mon, 28 Oct 2019 09:03:53 +0000 (UTC)
To: "Bell, Oren" <oren.bell@wustl.edu>
References: <SN6PR02MB47196DB277CAFEA9B4D5FD51F6670@SN6PR02MB4719.namprd02.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <813aaa3e-1c79-24ac-256e-4e74aafad46c@suse.com>
Date: Mon, 28 Oct 2019 10:03:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <SN6PR02MB47196DB277CAFEA9B4D5FD51F6670@SN6PR02MB4719.namprd02.prod.outlook.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen >4.10 bricks onboard NIC of Dell Optiplex 7060
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

T24gMjcuMTAuMjAxOSAxNzowOSwgIEJlbGwsIE9yZW4gIHdyb3RlOgo+IEkndmUgZW5jb3VudGVy
ZWQgYW4gaXNzdWUgd2hlcmUgaW5zdGFsbGluZyBYZW4gPjQuMTAgb24gYSBEZWxsIE9wdGlwbGV4
IHdpbGwgYnJlYWsgdGhlIG9uYm9hcmQgTklDLiBUaGlzIGlzc3VlIHBlcnNpc3RzIGlmIHRoZSBj
b21wdXRlciBpcyBib290ZWQgd2l0aG91dCBYZW4sIGFmdGVyIE9TIHJlaW5zdGFsbCwgYW5kIGV2
ZW4gaWYgcmVtb3ZpbmcgdGhlIFNTRCBhbmQgSEREIGNvbXBsZXRlbHkgdG8gYm9vdCBmcm9tIGEg
TGl2ZVVTQi4gVGhlIG9ubHkgd2F5IHRvIGZpeCB0aGUgaXNzdWUgaXMgdG8gaW5zdGFsbCBXaW5k
b3dzIDEwIG9uIHRoZSBtYWNoaW5lLiBUaGlzIGFwcGVhcnMgdG8gImZpeCIgdGhlIGZpcm13YXJl
IG9mIHRoZSBOSUMuIEFmdGVyIHJlaW5zdGFsbGluZyBVYnVudHUsIHRoZSBOSUMgY29udGludWVz
IHRvIHdvcmsgKHVudGlsIFhlbiBpcyBpbnN0YWxsZWQgYWdhaW4pLgo+IAo+IFRoaXMgYnVnIHdh
cyBjb25maXJtZWQgd2l0aCBib3RoIFhlbiA0LjEwIGFuZCA0LjEyIGluc3RhbGxlZCBvbiBVYnVu
dHUgMTguMDQuCj4gCj4gSWYgdGhpcyBpcyBhIGtub3duIGlzc3VlLCBpcyB0aGVyZSBzb21lICJp
bi13b3JrIHBhdGNoIiBJIGNhbiBiZSBwb2ludGVkIHRvPwoKVGhpcyBpcyBhIHJhdGhlciBzdHJh
bmdlIHByb2JsZW0geW91J3JlIGZhY2luZyAtIFhlbiBpdHNlbGYgZG9lc24ndApkbyBhbnl0aGlu
ZyB0byBOSUNzLiBUaGVyZWZvcmUgSSdtIGFmcmFpZCBzb21lIG1vcmUgZXhwZXJpbWVudGluZwpt
YXkgYmUgbmVlZGVkIHRvIHNvbWVob3cgbmFycm93IHdoZXJlIHRoaW5ncyBnbyB3cm9uZy4gSW4g
cGFydGljdWxhcgpJJ2QgYmUgY3VyaW91cyB0byB1bmRlcnN0YW5kIHdoZXRoZXIgaXQncyBpbmRl
ZWQgWGVuIHRoYXQgYnJlYWtzCnRoaW5ncywgb3Igd2hldGhlciBlLmcuIG90aGVyIHNvZnR3YXJl
IG1pc2JlaGF2ZXMgaWYgcnVuIG9uIHRvcCBvZgpYZW4uIEFzIGEgZmlyc3Qgc3RlcCwgY291bGQg
eW91IGJvb3QKLSBYZW4gd2l0aG91dCBhIERvbTAga2VybmVsLAotIFhlbiB3aXRoIGEgRG9tMCBr
ZXJuZWwsIGJ1dCB3aXRob3V0IGEgZHJpdmVyIGZvciB0aGUgTklDLAotIFhlbiB3aXRoIGEgRG9t
MCBrZXJuZWwgYW5kIHdpdGggYSBkcml2ZXIgZm9yIHRoZSBOSUMsIGJ1dCB3aXRob3V0CiAgYWN0
dWFsbHkgY29uZmlndXJpbmcvdXNpbmcgdGhlIE5JQz8KQ291bGQgeW91IGZ1cnRoZXIgY2hlY2sg
d2hldGhlciBYZW4gdXNpbmcgdGhlIHByZXN1bWFibHkgcHJlc2VudApJT01NVSBtYXR0ZXJzPyAo
UHJvdmlkaW5nIG1heGltdW0gdmVyYm9zaXR5IGh5cGVydmlzb3IgYW5kIGtlcm5lbApsb2dzIHdv
dWxkIG9mIGNvdXJzZSBhbHNvIGhlbHAsIGluIHBhcnRpY3VsYXIgZS5nLiB0byBrbm93IHdoZXRo
ZXIKdGhlcmUgaXMgYW4gSU9NTVUgaW4gdGhlIHN5c3RlbSwgYW5kIGFsc28gdG8gc2VlIHdoZXRo
ZXIgYW55CmFub21hbGllcyBnZXQgbG9nZ2VkLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
