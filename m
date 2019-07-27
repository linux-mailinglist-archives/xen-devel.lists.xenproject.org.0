Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A254778C3
	for <lists+xen-devel@lfdr.de>; Sat, 27 Jul 2019 14:46:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hrM1M-00059j-8o; Sat, 27 Jul 2019 12:41:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HIGa=VY=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hrM1L-00059e-0M
 for xen-devel@lists.xenproject.org; Sat, 27 Jul 2019 12:41:55 +0000
X-Inumbo-ID: e9ab93ca-b06b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e9ab93ca-b06b-11e9-8980-bc764e045a96;
 Sat, 27 Jul 2019 12:41:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD8D28;
 Sat, 27 Jul 2019 05:41:53 -0700 (PDT)
Received: from [10.37.8.139] (unknown [10.37.8.139])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DF26B3F71F;
 Sat, 27 Jul 2019 05:41:52 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190726210854.6408-1-andrew.cooper3@citrix.com>
 <20190726210854.6408-2-andrew.cooper3@citrix.com>
 <8b608443-9526-d09a-040f-5d25b9bc0a27@arm.com>
 <f4ac56f4-d716-9454-c8ed-7115076597ff@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3bb412c6-96d8-db09-e232-8114eb120b39@arm.com>
Date: Sat, 27 Jul 2019 13:41:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f4ac56f4-d716-9454-c8ed-7115076597ff@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/4] arm/percpu: Move {get,
 set}_processor_id() into smp.h
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmV3LAoKT24gNy8yNi8xOSAxMTozNyBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBP
biAyNi8wNy8yMDE5IDIzOjMwLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIEFuZHJldywKPj4K
Pj4gVGhhbmsgeW91IGZvciBsb29raW5nIGludG8gdGhpcy4KPj4KPj4gT24gNy8yNi8xOSAxMDow
OCBQTSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+IEZvciBjbGVhbnVwIHB1cnBvc2VzLCBpdCBp
cyBuZWNlc3NhcnkgZm9yIGFzbS9wZXJjcHUuaCB0byBub3QgdXNlCj4+PiBERUNMQVJFX1BFUl9D
UFUoKSBpdHNlbGYuICBhc20vc21wLmggaXMgYXJndWFibHkgYSBiZXR0ZXIgcGxhY2UgZm9yIGl0
IHRvCj4+PiBsaXZlIGFueXdheS4KPj4gSSBoYXZlIG5vdGljZWQgdGhhdCBhIGxvdCBvZiBhcmNo
IGhlbHBlcnMgY2FsbGVkIGJ5IGNvbW1vbiBjb2RlCj4+IGFyZSBkZWZpbmVkIGluIGRpZmZlcmVu
dCBoZWFkZXJzLiBUaGUgbW9zdCBvZmZlbmRlcnMgYXJlIGluIG1tLmgKPj4gYW5kIHBhZ2UuaC4K
PiAKPiBUaG9zZSBhcmUgbWFzc2l2ZSByYXRzIG5lc3RzLsKgIEF0IGxlYXN0IHdlJ3JlIHNsb3ds
eSBtYWtpbmcgcHJvZ3Jlc3Mgb24KPiB0aGUgb3V0c2tpcnRzLgo+IAo+IExvbnRlcm0sIEknZCBs
aWtlIHRvIGdldCB0byBhIHBvc2l0aW9uIHdoZXJlIHRoZSBvbmx5IHRpbWUgeW91J2QgZXZlcgo+
IGluY2x1ZGUgYW4gYXNtLyBoZWFkZXIgaXMgZWl0aGVyIGZyb20gdGhlIGNvbW1vbiBoZWFkZXIg
aXRzZWxmLCBvciBmb3IKPiBoZWFkZXJzIHVuaXF1ZSB0byB0aGUgY3VycmVudCBhcmNoaXRlY3R1
cmUuwqAgSSBleHBlY3QgdGhpcyB0byBzaW1wbGlmeQo+IHRoaW5ncyBtYXNzaXZlbHkuCj4gCj4+
Cj4+IExvb2tpbmcgYXQgeDg2LCB0aGUgdHdvIGhlbHBlcnMgYXJlIGRlZmluZWQgaW4gY3VycmVu
dC5oLiBTbyBJCj4+IHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8gZGVmaW5lIHRoZW0gYXQg
dGhlIHNhbWUgcGxhY2VzLiBJCj4+IGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFyIHByZWZlcmVuY2Ug
YmV0d2VlbiBzbXAuaCBhbmQgY3VycmVudC5oLAo+PiBqdXN0IHdhbnQgc29tZSBjb25zaXN0ZW5j
eSA6KS4KPj4KPj4gRldJVywgWGVuIGJ1aWxkIG5pY2VseSB3aGVuIHRoZSBoZWxwZXJzIGFyZSBt
b3ZlZCBpbiBjdXJyZW50Lmg6Cj4gCj4gSSBkaWQgY29uc2lkZXIgY3VycmVudC5oLCBidXQgY291
bGRuJ3QgZGVjaWRlIGFuZCBmbGlwcGVkIGEgY29pbi4KPiAKPiBJJ20gcGVyZmVjdGx5IGhhcHB5
IHRvIHB1dCBpdCBoZXJlIGlmIHRoYXQncyB3aGF0IHlvdSdkIHByZWZlci4KCkkgd291bGQgcHJl
ZmVyIGNvbnNpc3RlbmN5IHdpdGggeDg2IHNvLCBjdXJyZW50LmggOikuIEZlZWwgZnJlZSB0byAK
cmUtdXNlIHRoZSBkaWZmIEkgcHJvdmlkZWQgYW5kIGFkZCBteSBhY2tlZC1ieS4KCkNoZWVycywK
Ci0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
