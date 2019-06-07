Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA124391DF
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2019 18:24:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hZHcJ-0006Js-I9; Fri, 07 Jun 2019 16:21:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3I92=UG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hZHcH-0006Jm-Hd
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2019 16:21:21 +0000
X-Inumbo-ID: 47f021d2-8940-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 47f021d2-8940-11e9-8980-bc764e045a96;
 Fri, 07 Jun 2019 16:21:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5C466AC9A;
 Fri,  7 Jun 2019 16:21:18 +0000 (UTC)
To: Joao Martins <joao.m.martins@oracle.com>
References: <20190509172540.12398-1-ankur.a.arora@oracle.com>
 <5649cfd1-24df-2196-2888-b00fc3ace7ad@suse.com>
 <ede6db03-121c-9ec6-f8eb-dbcc605977b4@oracle.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c73a6ec5-687e-d3ef-e5d7-5700d240b4ec@suse.com>
Date: Fri, 7 Jun 2019 18:21:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ede6db03-121c-9ec6-f8eb-dbcc605977b4@oracle.com>
Content-Language: de-DE
Subject: Re: [Xen-devel] [RFC PATCH 00/16] xenhost support
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
Cc: sstabellini@kernel.org, konrad.wilk@oracle.com,
 linux-kernel@vger.kernel.org, Ankur Arora <ankur.a.arora@oracle.com>,
 pbonzini@redhat.com, xen-devel@lists.xenproject.org,
 boris.ostrovsky@oracle.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDYuMTkgMTc6MjIsIEpvYW8gTWFydGlucyB3cm90ZToKPiBPbiA2LzcvMTkgMzo1MSBQ
TSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gT24gMDkuMDUuMTkgMTk6MjUsIEFua3VyIEFyb3Jh
IHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IFRoaXMgaXMgYW4gUkZDIGZvciB4ZW5ob3N0IHN1
cHBvcnQsIG91dGxpbmVkIGhlcmUgYnkgSnVlcmdlbiBoZXJlOgo+Pj4gaHR0cHM6Ly9sa21sLm9y
Zy9sa21sLzIwMTkvNC84LzY3Lgo+Pgo+PiBGaXJzdDogdGhhbmtzIGZvciBhbGwgdGhlIGVmZm9y
dCB5b3UndmUgcHV0IGludG8gdGhpcyBzZXJpZXMhCj4+Cj4+PiBUaGUgaGlnaCBsZXZlbCBpZGVh
IGlzIHRvIHByb3ZpZGUgYW4gYWJzdHJhY3Rpb24gb2YgdGhlIFhlbgo+Pj4gY29tbXVuaWNhdGlv
biBpbnRlcmZhY2UsIGFzIGEgeGVuaG9zdF90Lgo+Pj4KPj4+IHhlbmhvc3RfdCBleHBvc2Ugb3Bz
IGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4gdGhlIGd1ZXN0IGFuZCBYZW4KPj4+IChoeXBlcmNh
bGwsIGNwdWlkLCBzaGFyZWRfaW5mby92Y3B1X2luZm8sIGV2dGNobiwgZ3JhbnQtdGFibGUgYW5k
IG9uIHRvcAo+Pj4gb2YgdGhvc2UsIHhlbmJ1cywgYmFsbG9vbmluZyksIGFuZCB0aGVzZSBjYW4g
ZGlmZmVyIGJhc2VkIG9uIHRoZSBraW5kCj4+PiBvZiB1bmRlcmx5aW5nIFhlbjogcmVndWxhciwg
bG9jYWwsIGFuZCBuZXN0ZWQuCj4+Cj4+IEknbSBub3Qgc3VyZSB3ZSBuZWVkIHRvIGFic3RyYWN0
IGF3YXkgaHlwZXJjYWxscyBhbmQgY3B1aWQuIEkgYmVsaWV2ZSBpbgo+PiBjYXNlIG9mIG5lc3Rl
ZCBYZW4gYWxsIGNvbnRhY3RzIHRvIHRoZSBMMCBoeXBlcnZpc29yIHNob3VsZCBiZSBkb25lIHZp
YQo+PiB0aGUgTDEgaHlwZXJ2aXNvci4gU28gd2UgbWlnaHQgbmVlZCB0byBpc3N1ZSBzb21lIGtp
bmQgb2YgcGFzc3Rocm91Z2gKPj4gaHlwZXJjYWxsIHdoZW4gZS5nLiBncmFudGluZyBhIHBhZ2Ug
dG8gTDAgZG9tMCwgYnV0IHRoaXMgc2hvdWxkIGJlCj4+IGhhbmRsZWQgdmlhIHRoZSBncmFudCBh
YnN0cmFjdGlvbiAoZXZlbnRzIHNob3VsZCBiZSBzaW1pbGFyKS4KPj4KPiBKdXN0IHRvIGJlIGNs
ZWFyOiBCeSAia2luZCBvZiBwYXNzdGhyb3VnaCBoeXBlcmNhbGwiIHlvdSBtZWFuIChlLmcuIGZv
ciBldmVyeQo+IGFjY2Vzcy9tb2RpZnkgb2YgZ3JhbnQgdGFibGUgZnJhbWVzKSB5b3Ugd291bGQg
cHJveHkgaHlwZXJjYWxsIHRvIEwwIFhlbiB2aWEgTDEgWGVuPwoKSXQgbWlnaHQgYmUgcG9zc2li
bGUgdG8gc3BhcmUgc29tZSBoeXBlcmNhbGxzIGJ5IGRpcmVjdGx5IHdyaXRpbmcgdG8KZ3JhbnQg
ZnJhbWVzIG1hcHBlZCBpbnRvIEwxIGRvbTAsIGJ1dCBpbiBnZW5lcmFsIHlvdSBhcmUgcmlnaHQu
CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
