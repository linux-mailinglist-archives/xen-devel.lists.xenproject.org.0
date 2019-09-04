Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236DA7E06
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 10:40:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5QmU-00061i-M7; Wed, 04 Sep 2019 08:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Tt/v=W7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i5QmT-00061d-Rn
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 08:36:45 +0000
X-Inumbo-ID: 2051fcce-ceef-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2051fcce-ceef-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 08:36:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B7CDB62C;
 Wed,  4 Sep 2019 08:36:44 +0000 (UTC)
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-140960-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b5b6d76-9087-05f5-5359-ec24322dda65@suse.com>
Date: Wed, 4 Sep 2019 10:36:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <osstest-140960-mainreport@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-unstable test] 140960: regressions - FAIL
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAyMjowMCwgb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyb3RlOgo+IGZsaWdo
dCAxNDA5NjAgeGVuLXVuc3RhYmxlIHJlYWwgW3JlYWxdCj4gaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzE0MDk2MC8KPiAKPiBSZWdyZXNzaW9ucyA6LSgK
PiAKPiBUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQgYW5kIGFyZSBibG9ja2luZywKPiBpbmNs
dWRpbmcgdGVzdHMgd2hpY2ggY291bGQgbm90IGJlIHJ1bjoKPiAgdGVzdC1hbWQ2NC1hbWQ2NC14
bC1wdnNoaW0gICAxOCBndWVzdC1sb2NhbG1pZ3JhdGUveDEwICAgZmFpbCBSRUdSLiB2cy4gMTM5
ODc2CgpUaGlzIGxvb2tzIHRvIGJlIHJlY3VycmluZywgc28gSSd2ZSB0YWtlbiBhbm90aGVyIGxv
b2suIFRoZSB0aHJlZQptaWdyYXRpb25zIGxlYXZlIHRoaXMgYWJicmV2aWF0ZWQgcGF0dGVybiBp
biB0aGUgbG9nOgoKU2VwICAzIDE0OjIwOjQyLjQ0NjY2NyAoWEVOKSBIVk0gZDF2MCBzYXZlOiBD
UFVfTVNSCi4uLgpTZXAgIDMgMTQ6MjA6NTcuODUwNjcwIChYRU4pIEhWTTIgcmVzdG9yZTogQ1BV
IDAKLi4uClNlcCAgMyAxNDoyMTozNy4wNjI4NDAgKFhFTikgSFZNIGQydjAgc2F2ZTogQ1BVX01T
UgpTZXAgIDMgMTQ6MjE6MzcuMDYyODg4IChYRU4pIEhWTTMgcmVzdG9yZTogQ1BVIDAKLi4uClNl
cCAgMyAxNDoyMTo1Ni40Mzg1NTIgKFhFTikgSFZNIGQzdjAgc2F2ZTogQ1BVX01TUgouLi4KU2Vw
ICAzIDE0OjIyOjExLjUwNjUwOCAoWEVOKSBIVk00IHJlc3RvcmU6IENQVSAwCgpUaGVyZWZvcmUg
SSB3b25kZXIgd2hldGhlciB0aGUgZmlyc3Qgb25lIGdvdCBsdWNreSBhbmQgZmluaXNoZWQKYmFy
ZWx5IGFoZWFkIG9mIHRpbWluZyBvdXQsIHdoaWxlIHRoZSAybmQgd29ya2VkIGluc3RhbnRseSBh
bmQgdGhlCjNyZCB0aGVuIGVuZGVkIHVwIGV4Y2VlZGluZyB0aGUgdGltZW91dC4gV2hhdCBpcyBj
dXJpb3VzIGFyZSB0aGUKaW50ZXJtZWRpYXRlIGxvZyBlbnRyaWVzIChiZXR3ZWVuIHRoZSBsYXN0
ICJzYXZlIiBhbmQgdGhlIGZpcnN0CmNvcnJlc3BvbmRpbmcgInJlc3RvcmUiIGxvZyBlbnRyaWVz
KTogTWFueSBvbmVzIG9mIHRoZSBmb3JtCgooWEVOKSBlbXVsLXByaXYtb3AuYzoxMTEzOmQwdjIg
RG9tYWluIGF0dGVtcHRlZCBXUk1TUiBjMDAxMTAyMCBmcm9tIDB4MDAwMDAwMDAwMDAwMDAwMCB0
byAweDAwNDAwMDAwMDAwMDAwMDAKCndpdGggYSAxNXMgZ2FwIGJldHdlZW4gdGhlIGZpcnN0IGFu
ZCBtYW55IHN1YnNlcXVlbnQgb25lcykgYW5kCmZpbmFsbHkgb25lIG9mIHRoZSBmb3JtCgpbICA0
NTEuMjY3NjY5XSBzeXN0ZW1kLWxvZ2luZFsyNzY2XTogTmV3IHNlc3Npb24gMzkgb2YgdXNlciBy
b290LgoKQW5kIGZpbmFsbHksIGF0IGFyb3VuZCB0aGUgdGltZSBvZiB0aGUgZmFpbGVkIG1pZ3Jh
dGlvbgoKSU5JVDogSWQgIlQwIiByZXNwYXduaW5nIHRvbyBmYXN0OiBkaXNhYmxlZCBmb3IgNSBt
aW51dGVzCgpXaGlsZSBpdCdzIG5vdCBjbGVhciB0aGF0IHRoaXMgcGFyYWxsZWwgYWN0aXZpdHkg
aXMgY2F1c2luZyB0aGUKbWlncmF0aW9uIHRvIHByb2dyZXNzIHRvbyBzbG93bHksIGl0IGxvb2tz
IHRvIGJlIGEgcG9zc2liaWxpdHkgYXQKbGVhc3QuIENhbiBhbnlvbmUgZXhwbGFpbiB3aGF0IHRo
ZXNlIGFyZT8KCj4gIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgIDYgeGVuLWJ1aWxkICAg
ICAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzOTg3NgoKSSB0YWtlIGl0IHRoYXQgdGhpcyBp
cyBzdXBwb3NlZCB0byBiZSB0YWtlbiBjYXJlIG9mIGJ5IGEzNDI5MDBkNDgKKCJ0b29scy9zaGlt
OiBBcHBseSBtb3JlIGR1Y3QgdGFwZSB0byB0aGUgbGlua2Zhcm0gbG9naWMiKS4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
