Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261AC7F193
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 11:40:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htTzh-0008PY-Nc; Fri, 02 Aug 2019 09:37:01 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=s405=V6=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1htTzg-0008PT-BU
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:37:00 +0000
X-Inumbo-ID: 130b2cbb-b509-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 130b2cbb-b509-11e9-8980-bc764e045a96;
 Fri, 02 Aug 2019 09:36:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCBFF344;
 Fri,  2 Aug 2019 02:36:58 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E064A3F575;
 Fri,  2 Aug 2019 02:36:57 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Lars Kurth <lars.kurth.xen@gmail.com>
References: <20190801120452.6814-1-viktor.mitin.19@gmail.com>
 <20190801120452.6814-3-viktor.mitin.19@gmail.com> <87zhktgfml.fsf@epam.com>
 <ffa8c4f2-8b49-b32a-8f4f-8931dead0c80@arm.com> <87y30dget5.fsf@epam.com>
 <e022de0d-2515-007f-0a66-2f7a94c68777@arm.com> <87wofxgct5.fsf@epam.com>
 <CAOcoXZYU+CF2T=QEo8UL73sDvELW9LVckueqNvQXrNogNHo9RA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <3827f95e-ad91-fbe6-3f4d-71b6cc634f80@arm.com>
Date: Fri, 2 Aug 2019 10:36:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYU+CF2T=QEo8UL73sDvELW9LVckueqNvQXrNogNHo9RA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 2/2] xen/arm: consolidate make_timer_node
 and make_timer_domU_node
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMS8wOC8yMDE5IDE3OjU2LCBWaWt0b3IgTWl0aW4gd3JvdGU6Cj4gT24gVGh1LCBB
dWcgMSwgMjAxOSBhdCA1OjUwIFBNIFZvbG9keW15ciBCYWJjaHVrCj4gPFZvbG9keW15cl9CYWJj
aHVrQGVwYW0uY29tPiB3cm90ZToKPiAKPj4+PiBJbiB0aGlzIGNhc2Ugd2UgYWxzbyBjYW4gZGVj
bGFyZSBhbmQgdXNlIGludHJzW10gaW4gdGhlIHNhbWUgd2F5Lgo+Pj4KPj4+IFRoZXJlIGlzIG5v
IGd1YXJhbnRlZSB0aGUgaW5kZXggaW4gaXJxIHdpbGwgbWF0Y2ggaW50cnNbLi4uXS4gU28geW91
Cj4+PiBuZWVkIHRvIGtlZXAgdGhlbSBoYXJkY29kZWQgaW4gdGhlIGxhdHRlciBjYXNlLgo+PiBP
aCwgcmlnaHQuCj4gCj4gSSBkb24ndCBsaWtlIHRoZSBpZGVhIG9mIHVzaW5nIGhhcmRjb2RlZCBu
dW1iZXJzIGluIHRoZSBjb2RlLiBCVFcsCj4gTWlzcmEgcnVsZSBzYXlzIGl0IHNob3VsZCBub3Qg
YmUgdXNlZCBhcyB3ZWxsLgoKV2hlbiBtZW50aW9uaW5nIGEgc3BlYywgaXQgaXMgY29tbW9uIHRv
IGFsc28gc3BlY2lmeSB0aGUgZXhhY3Qgc2VjdGlvbiBzbyBvdGhlcnMgCmRvbid0IGhhdmUgdG8g
c3BlbmQgdGltZSBsb29rIGZvciBpdC4KCkkgc2tpbW1lZCBxdWlja2x5IHRocm91Z2ggdGhlIE1J
U1JBIGFuZCBjYW4ndCBmaW5kIHRoZSBydWxlIHlvdSBzdWdnZXN0IGhlcmUuIApGdXJ0aGVybW9y
ZSwgdGhleSBoYXZlIGEgbG90IG9mIGV4YW1wbGVzIGluIHRoZSBzcGVjIHdpdGggaGFyY29kZWQg
c2l6ZS4gU28gSSBhbSAKcGVycGxleGVkIHRoZXkgYWN0aXZlbHkgZGlzY291cmFnZSBpdC4uLgoK
Q2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
