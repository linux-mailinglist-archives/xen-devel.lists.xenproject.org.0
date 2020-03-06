Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EE17C005
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 15:14:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jADhi-0000ua-5V; Fri, 06 Mar 2020 14:11:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jADhg-0000uV-MF
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 14:11:52 +0000
X-Inumbo-ID: 6d06416e-5fb4-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d06416e-5fb4-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 14:11:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 26751AFEB;
 Fri,  6 Mar 2020 14:11:51 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3c71c89f-28be-7752-b768-7d696fea0460@suse.com>
Date: Fri, 6 Mar 2020 15:11:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <352f0b08-d869-1d57-a357-246574cb9b55@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Backports to 4.13
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBZb3UndmUgcmVjZW50
bHkgYmFja3BvcnRlZCAzMjhkZDIzOGRhICJ4ODYvc217ZSwgYX1wOiBkbyBub3QgZW5hYmxlCj4g
U01FUC9TTUFQIGluIFBWIHNoaW0gYnkgZGVmYXVsdCBvbiBBTUQiLCBidXQgaGF2ZSBtaXNzZWQg
NWRlOTYxZDljMDk3Cj4gIng4NjogZG8gbm90IGVuYWJsZSBnbG9iYWwgcGFnZXMgd2hlbiB2aXJ0
dWFsaXplZCBvbiBBTUQgb3IgSHlnb24KPiBoYXJkd2FyZSIgYW5kIGIwNDE3MDljMzY5YiAieDg2
L3B2OiBGaXggYGdsb2JhbC1wYWdlc2AgdG8gbWF0Y2ggdGhlCj4gZG9jdW1lbnRhdGlvbiIuCgpJ
J3ZlIHF1ZXVlZCB0aGVzZSB1cCwgYWxiZWl0IC4uLgoKPiBUaGUgZm9ybWVyIGlzIHByZXR0eSB1
c2VsZXNzIHdpdGhvdXQgdGhlIG90aGVyIHR3bywgYmVjYXVzZSB5b3UncmUKPiB0YWtpbmcgb3V0
IHRoZSBzZWN1cml0eSBmZWF0dXJlIHdpdGhvdXQgZ2FpbmluZyB0aGUgbWFqb3JpdHkgcGVyZm9y
bWFuY2UKPiB3aW4gZnJvbSBhdm9pZGluZyBWTWV4aXRzIGR1ZSB0byBDUjQgdHJhcHMuCgouLi4g
SSdtIHVuY29udmluY2VkIG9mIHRoaXMgLSBhdm9pZGluZyBTTUVQL1NNQVAgYWxvbmUgYWxyZWFk
eQplbGltaW5hdGVzIGEgbnVtYmVyIG9mIENSNCB3cml0ZXMgYWZhaWN0LgoKPiBEZXBlbmRpbmcg
b24gdGhlIHZpZXcgb2Ygb3RoZXIgUFYgc2hpbSB1c2FiaWxpdHkgaXNzdWVzLCA2ZGQ5NWIwMmVh
MjcKPiBhbmQgZjlkZWUxZjk0NWViIHJlZ2FyZGluZyB2dHNjIG1ha2UgYSBsYXJnZSBkaWZmZXJl
bmNlIGFuZCBzaG91bGQgYmUKPiBjb25zaWRlcmVkLgoKSSd2ZSBxdWV1ZWQgdGhlIGxhdHRlciwg
YnV0IHRoZSBmb3JtZXIgZG9lc24ndCByZWFsbHkgbG9vayBsaWtlCmJhY2twb3J0aW5nIG1hdGVy
aWFsIHRvIG1lLgoKPiBlMmQxMjU0ZjVhZjIgaXMgYSBidWdmaXggd2hpY2ggbmVlZHMgYmFja3Bv
cnRpbmcgdG8gZml4IEFNRCBTMyBhbmQKPiBrZXhlYywgYXMgd2VsbCBhcyBwdiBzaGltLgoKUXVl
dWVkIGFzIHdlbGwuCgo+IDE4OGY0NzlkZTRiNyBhbmQgMDA1ZGU0NWM4ODdlIGFyZSBib3RoIGNv
cmUgc2NoZWR1bGluZyBidWdmaXhlcyBhbmQKPiBzaG91bGQgYmUgY29uc2lkZXJlZCwgZXZlbiBp
ZiB0aGV5IGFyZSBhIGxpdHRsZSB0b28gZnJlc2ggcmlnaHQgYXQgdGhlCj4gbW9tZW50LgoKIkZy
ZXNobmVzcyIgaXMgbm90IGFuIGlzc3VlIGltby4gVGhleSd2ZSBwYXNzZWQgdGhlIHB1c2ggZ2F0
ZSBvbgptYXN0ZXIsIGFuZCBJIHdvdWxkbid0IGdldCBhcm91bmQgdG8gYXBwbHkgdGhlbSByaWdo
dCBhd2F5IGFueXdheS4KV2l0aCB0aGVzZSBpdCdzIGp1c3QgdGhlIHR5cGljYWwgc2l0dWF0aW9u
IGZvciBmZWF0dXJlcyB0aGF0IGFyZQpzdGlsbCAiZXhwZXJpbWVudGFsIiBvciBhbGlrZSAtIEkn
bSBuZXZlciByZWFsbHkgY2VydGFpbiB3aGV0aGVyCml0J3MgYmV0dGVyIHRvIHB1bGwgaW4gc3Vj
aCBmaXhlcyAoYW5kIGhhdmUgbW9yZSBjb2RlIGNodXJuKSBvcgp0byBsZWF2ZSB0aGVtIG91dC4g
QW5kIGV4cGxpY2l0IHJlcXVlc3QgbGlrZSB0aGlzIG9uZSBvZiB5b3VycwpoZWxwcyB0YWtlIGEg
ZGVjaXNpb24uCgo+IE9uIHRoZSB0b29scyBzaWRlIG9mIHRoaW5ncywgZjUwYTRmNmUyNDRjIGFh
ZmFlMGU4MDBlOSAyYTYyYzIyNzE1YmYKPiBkNzljYzZiYzJiYWMgMDcyOTgzMGNjNDI1IGFyZSBh
bGwgYnVncyBpbiBDUFVJRCBhbmQvb3IgbWlncmF0aW9uLsKgICJGaXgKPiBIVk1fUEFSQU1fUEFF
X0VOQUJMRUQgaGFuZGxpbmciIGlzIG9ubHkgZm9yIDQuMTMsIHdoZXJlYXMgYWxsIHRoZSBvdGhl
cnMKPiBhcmUgYmFjayB0byA0LjcgKHRlY2huaWNhbGx5IHNwZWFraW5nKS4KCkknbGwgKG9idmlv
dXNseSkgbGVhdmUgdGhlc2UgdG8gSWFuLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
