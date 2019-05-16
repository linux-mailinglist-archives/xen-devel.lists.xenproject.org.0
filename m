Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 688EA20B76
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIYS-0004kt-T9; Thu, 16 May 2019 15:44:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Vv4c=TQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRIYR-0004ko-E4
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:44:23 +0000
X-Inumbo-ID: 79cdd354-77f1-11e9-96e6-f7fd6d9431be
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 79cdd354-77f1-11e9-96e6-f7fd6d9431be;
 Thu, 16 May 2019 15:44:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 558531715;
 Thu, 16 May 2019 08:44:22 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8734F3F71E;
 Thu, 16 May 2019 08:44:21 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1556816422-25185-1-git-send-email-olekstysh@gmail.com>
 <ec3339b0-6588-2a54-d0db-1e9c157f9259@arm.com>
 <128c02c6-412a-bb65-c665-133c525e506e@gmail.com>
 <08ad173c-2c2c-967c-84fa-6b848ab52659@arm.com>
Message-ID: <7bdd9edc-f14e-decf-60d5-f18efaea6526@arm.com>
Date: Thu, 16 May 2019 16:44:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <08ad173c-2c2c-967c-84fa-6b848ab52659@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V5 0/4] Renesas Stout board support (R-Car
 Gen2)
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOC8wNS8yMDE5IDE3OjM0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gCj4gCj4gT24g
MDgvMDUvMjAxOSAxNzozMCwgT2xla3NhbmRyIHdyb3RlOgo+Pgo+PiBPbiAwOC4wNS4xOSAxOTox
OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gSGkgT2xla3NhbmRyLAo+Pgo+PiBIaSBKdWxpZW4K
Pj4KPj4KPj4+Cj4+PiBPbiAwMi8wNS8yMDE5IDE4OjAwLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToKPj4+PiBPbGVrc2FuZHIgVHlzaGNoZW5rbyAoNCk6Cj4+Pj4gwqDCoCB4ZW4vYXJtOiBk
cml2ZXJzOiBzY2lmOiBFeHRlbmQgZHJpdmVyIHRvIGhhbmRsZSBvdGhlciBpbnRlcmZhY2VzCj4+
Pj4gwqDCoCB4ZW4vYXJtOiBkcml2ZXJzOiBzY2lmOiBBZGQgc3VwcG9ydCBmb3IgU0NJRkEgY29t
cGF0aWJsZSBVQVJUcwo+Pj4KPj4+IEkgaGF2ZSBtZXJnZWQgdGhlIGZpcnN0IHR3byBwYXRjaGVz
IGluIG15IGJyYW5jaCB4ZW4tNC4xMy4gSSB3aWxsIG1lcmdlIHRoZW0gCj4+PiBpbiBzdGFnaW5n
IG9uIHRoZSB0cmVlIGlzIHJlb3BlbmVkLgo+Pgo+PiBUaGFuayB5b3UhCj4+Cj4+Cj4+IEp1c3Qg
dG8gY2xhcmlmeToKPj4KPj4gV2UgYXJlIHdhaXRpbmcgZm9yIHRoZSByZXZpZXcgZnJvbSBTdGVm
YW5vIGZvciB0aGUgZm9sbG93aW5nIHBhdGNoOgo+Pgo+PiAiW1BBVENIIFY1IDMvNF0geGVuL2Fy
bTogRXh0ZW5kIFNDSUYgZWFybHkgcHJpbmsgY29kZSB0byBoYW5kbGUgb3RoZXIgaW50ZXJmYWNl
cyIKPj4KPj4KPj4gQW0gSSBjb3JyZWN0Pwo+IAo+IFRoYXQncyBjb3JyZWN0LiBJZiBJIGRvbid0
IGhlYXIgYW55dGhpbmcgYnkgTW9uZGF5LCBJIHdpbGwgbWVyZ2UgdGhlIHR3byBwYXRjaGVzLgoK
SSBoYXZlbid0IGhlYXJkIGFueXRoaW5nIGZyb20gU3RlZmFuby4gSSBoYXZlIG5vdyBtZXJnZWQg
dGhlIHR3byByZW1haW5pbmcgcGF0Y2hlcy4KCj4gCj4gQ2hlZXJzLAo+IAoKLS0gCkp1bGllbiBH
cmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
