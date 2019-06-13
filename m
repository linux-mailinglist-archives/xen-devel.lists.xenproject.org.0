Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B96435C4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 14:12:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbOYM-0002Iv-23; Thu, 13 Jun 2019 12:10:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbOYL-0002II-4K
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 12:10:01 +0000
X-Inumbo-ID: 29849ff6-8dd4-11e9-aad0-8f5b6b7200e0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 29849ff6-8dd4-11e9-aad0-8f5b6b7200e0;
 Thu, 13 Jun 2019 12:09:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C0097367;
 Thu, 13 Jun 2019 05:09:57 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A09603F694;
 Thu, 13 Jun 2019 05:11:38 -0700 (PDT)
To: xen-devel@lists.xenproject.org
References: <20190514122456.28559-1-julien.grall@arm.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <d0e75c3e-eefe-bc65-8d62-ccb485b980cb@arm.com>
Date: Thu, 13 Jun 2019 13:09:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514122456.28559-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 00/19] xen/arm: Clean-up
 & fixes in boot/mm code
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Andrii_Anisov@epam.com,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr_Tyshchenko@epam.com, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxNC8wNS8yMDE5IDEzOjI0LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gVGhpcyBpcyB0
aGUgc2Vjb25kIHBhcnQgb2YgdGhlIGJvb3QvbWVtb3J5IHJld29yayBmb3IgWGVuIG9uIEFybS4g
VGhpcwo+IHBhcnQgY29udGFpbnMgbW9zdGx5IGNsZWFuLXVwICYgZml4ZXMgZm91bmQgZHVyaW5n
IHRoZSByZXdvcmsuCj4gCj4gVGhlIGZpcnN0IHBhcnQgb2YgdGhlIHJld29yayBpcyAieGVuL2Fy
bTogVExCIGZsdXNoIGhlbHBlcnMgcmV3b3JrIiBbMV0uCj4gCj4gRm9yIGNvbnZlbmllbmNlLCBJ
IHByb3ZpZGVkIGEgYnJhbmNoIHdpdGggYWxsIHRoZSBwYXRjaGVzIGFwcGxpZWQgYmFzZWQKPiBv
biBzdGFnaW5nOgo+IAo+ICAgICAgZ2l0Oi8veGVuYml0cy54ZW4ub3JnL3Blb3BsZS9qdWxpZW5n
L3hlbi11bnN0YWJsZS5naXQgYnJhbmNoIG1tL3BhcnQyL3YyCj4gCj4gQ2hlZXJzLAo+IAo+IFsx
XSBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIw
MTktMDUvbXNnMDExMDkuaHRtbAo+IAo+IEp1bGllbiBHcmFsbCAoMTkpOgo+ICAgIHhlbi9hcm06
IFJld29yayBIU0NUTFJfQkFTRQoKSSBoYXZlIGNvbW1pdHRlZCBhbGwgYnV0IHRoaXMgcGF0Y2gg
YXMgaXQgbmVlZHMgYSByZXNwaW4uIEkgd2lsbCBzZW5kIGl0IGFzIHBhcnQgCm9mIE1NLVBBUlQz
LgoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
