Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED22104D
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 23:53:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hROHi-00026S-Jw; Thu, 16 May 2019 21:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hROHh-00026N-Ec
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 21:51:29 +0000
X-Inumbo-ID: c1a788c2-7824-11e9-a8fb-871470643152
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c1a788c2-7824-11e9-a8fb-871470643152;
 Thu, 16 May 2019 21:51:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42B5A19BF;
 Thu, 16 May 2019 14:51:27 -0700 (PDT)
Received: from [10.37.12.1] (unknown [10.37.12.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C15AB3F5AF;
 Thu, 16 May 2019 14:51:25 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
 <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
 <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7baebecd-909c-c260-8d3c-b30b730b4c5b@arm.com>
Date: Thu, 16 May 2019 22:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3ICYgSmFuLAoKT24gNS8xNi8xOSA4OjU4IEFNLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBPbiAxNS4wNS4xOSBhdCAyMjoxMiwgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+IHdy
b3RlOgo+PiBPbiAxNS8wNS8yMDE5IDIwOjU4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBIaSBh
bGwsCj4+Pgo+Pj4gSXQgbG9va3MgbGlrZSB0aGUgc3RydWN0dXJlcyB2Y3B1X2d1ZXN0X2NvcmVf
cmVncyBhbmQKPj4+IHZjcHVfZ3Vlc3RfY29udGV4dCBkb2VzIG5vdCBjb3JyZWN0bHkgcmVmbGVj
dCB0aGUgQUFyY2g2NCBzdGF0ZS4gRm9yCj4+PiBpbnN0YW5jZSwgYWxsIEFybTY0IHN5c3RlbSBy
ZWdpc3RlcnMgKGUuZyBzY3RsciwgY3Bzciwgc3Bzcl9lbDEpCj4+PiBzaG91bGQgYmUgNjQtYml0
IHdpZGUgbm90IDMyLWJpdCB3aWRlLgo+Pj4KPj4+IE9uIEFSTXY4LjAsIHNvbWUgb2YgdGhlIHJl
Z2lzdGVycyBoYXZlIG9ubHkgdGhlIGxvdyAzMi1iaXQgZGVmaW5lZCwKPj4+IHRoZSByZXN0IGlz
IFJFUzAuIFJFUzAgb25seSBtZWFucyB0aGV5IGFyZSByZXNlcnZlZCBmb3IgZnV0dXJlIHVzZSwg
aXQKPj4+IGRvZXMgbm90IG1lYW4gdGhleSBjYW4gYmUgaWdub3JlZC4gTmV3ZXIgcmV2aXNpb24g
KHN1Y2ggYXMKPj4+IEFSTXY4LjAtU1NCUykgYWN0dWFsbHkgYmVnYW4gdG8gZGVmaW5lIGJpdCBp
biB0aGUgdG9wIDMyLWJpdC4KPj4+Cj4+PiBUaGlzIG1lYW5zIHRoYXQgdGhlIHN0cnVjdHVyZXMg
dmNwdV9ndWVzdF9jb3JlX3JlZ3MgYW5kCj4+PiB2Y3B1X2d1ZXN0X2NvbnRleHQgd291bGQgbm90
IGJlIGFibGUgdG8gc3RvcmUgdGhlIHRvcCAzMi1iaXQgYW5kCj4+PiB0aGVyZWZvcmUgbWlzcmVw
cmVzZW50aW5nIHRoZSBoYXJkd2FyZS4KPj4+Cj4+PiAgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCB2
Y3B1X2d1ZXN0X2NvbnRleHQgaXMgZGVmaW5lZCBiZXR3ZWVuIHRoZSB0b29scwo+Pj4gYW5kIFhl
bi4gU28gaXQgd291bGQgYmUgcG9zc2libGUgdG8gbW9kaWZ5IGl0IHdpdGhvdXQgY2FyaW5nIG9u
Cj4+PiBiYWNrd2FyZCBjb21wYXRpYmx5Lgo+Pj4KPj4+IEhvd2VydmVyLCBzdHJ1Y3QgdmNwdV9n
dWVzdF9jb3JlX3JlZyBzZWVtcyB0byBiZSBvdXRzaWRlIG9mIHRoZQo+Pj4gI2lmZGVmLiBTbyBJ
IGFzc3VtZSBpdCBpcyBwYXJ0IG9mIHRoZSBzdGFibGUgQUJJLiBBbSBJIGNvcnJlY3Q/Cj4+Pgo+
Pj4gRG8geW91IGhhdmUgYW55IHN1Z2dlc3Rpb24gaG93IHRoaXMgY291bGQgc2FmZWx5IGJlIGV4
dGVuZGVkPwo+Pgo+PiBTdHVmZiBsaWtlIHRoaXMgc2hvdWxkIG5ldmVyIGhhdmUgYmVlbiBpbiB0
aGUgcHVibGljIEFQSSB0byBiZWdpbiB3aXRoLgo+PiB4ODYgaGFzIHNvbWUgbmFzdHkgaXNzdWVz
IHdoaWNoIEkgaGF2ZSB5ZXQgdG8gZmluZCBhIGdvb2QtZW5vdWdoIHdheSB0byBmaXguCj4+Cj4+
IEZvciBBUk0sIGFuZCBmdXR1cmUgYXJjaGl0ZWN0dXJlcywgSSdkIHVzZSB0aGUgZmFjdCB0aGF0
IHRoZXJlIGFyZSBubwo+PiBub24tdG9vbHMgaW50ZXJmYWNlcyB3aGljaCB1c2UgdGhpcyBzdHJ1
Y3R1cmUgdG8gYWxsb3cgeW91cnNlbGYgdGhlCj4+IHdpZ2dsZXJvb20gdG8gZGVjbGFyZSBoaXN0
b3J5IGEgbWlzdGFrZSwgYW5kIGZpeCBpdCBieSBtYWtpbmcgaXQgdG9vbHMtb25seS4KPiAKPiBJ
J20gdW5jb252aW5jZWQgb2YgdGhlICJkZWNsYXJlIGhpc3RvcnkgYSBtaXN0YWtlIiBwYXJ0LCBi
dXQgSSBhZ3JlZQo+IHdpdGggdGhlIHN1Z2dlc3Rpb24gb2Ygc2ltcGx5IG1vdmluZyB0aGUgc3Ry
dWN0dXJlIGRlY2xhcmF0aW9uIGRvd24KPiBpbnRvIHRoZSBndWFyZGVkIGFyZWEuIEl0IHNpbXBs
eSB3YXMgYSBtaXN0YWtlIHRvIG5vdCBwdXQgaXQgdGhlcmUgaW4KPiB0aGUgZmlyc3QgcGxhY2Uu
CgpUaGFuayB5b3UgYm90aCBvZiB5b3UgZm9yIHRoZSBmZWVkYmFjay4gSSB3aWxsIHByZXBhcmUg
YSBwYXRjaCB0byBtYWtlIApzdHJ1Y3QgdmNwdV9ndWVzdF9jb3JlX3JlZ3MgdG9vbHMgb25seS4K
CkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
