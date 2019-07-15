Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53B69B6C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 21:34:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn6hF-0003ev-5O; Mon, 15 Jul 2019 19:31:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qaui=VM=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1hn6hD-0003eq-1f
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 19:31:35 +0000
X-Inumbo-ID: 2753c7ef-a737-11e9-8980-bc764e045a96
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2753c7ef-a737-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 19:31:33 +0000 (UTC)
Received: from [192.168.2.33] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id 6683272008A;
 Mon, 15 Jul 2019 20:28:17 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com 6683272008A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1563236897;
 bh=B/W47RGN/r0JM7xEnZB+CmjJ9t+cJtgV5kkfPZngYYA=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GofK8kHH2nr6AZJy8LRwbcWjF+WV0CD61iDIlRdF4BrgyHja7YgMLuMpOpT7uPLWS
 WXdmzMW41x9l5wFgmskNRJT+rIc4UOR0Sdxw5w10aMx2TeMBqZgLqPh00NMpwVyeRD
 UrQLFOM3wsEp9fQ4ZkIbhLpLR4orlyVpbE/Is/K4=
To: "Foerster, Leonard" <foersleo@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1563217075.6815.14.camel@amazon.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <86e560c4-5a14-75fd-8b06-a77e66a8f0a5@prgmr.com>
Date: Mon, 15 Jul 2019 12:31:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1563217075.6815.14.camel@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Design session report: Live-Updating Xen
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8xNS8xOSAxMTo1NyBBTSwgRm9lcnN0ZXIsIExlb25hcmQgd3JvdGU6Ci4uLgo+IEEga2V5
IGNvcm5lcnN0b25lIGZvciBMaXZlLXVwZGF0ZSBpcyBndWVzdCB0cmFuc3BhcmVudCBsaXZlIG1p
Z3JhdGlvbgouLi4KPiAJLT4gZm9yIGxpdmUgbWlncmF0aW9uOiBkb21pZCBpcyBhIHByb2JsZW0g
aW4gdGhpcyBjYXNlCj4gCQktPiByYW5kb21pemUgYW5kIHByYXkgZG9lcyBub3Qgd29yayBvbiBz
bWFsbGVyIGZsZWV0cwo+IAkJLT4gdGhpcyBpcyBub3QgYSBwcm9ibGVtIGZvciBsaXZlLXVwZGF0
ZQo+IAkJLT4gQlVUOiBhcyBhIGNvbW11bml0eSB3ZSBzaG91ZGwgbWFrZSB0aGlzIHJlc3RyaWN0
aW9uIGdvIGF3YXkKCkFuZHJldyBDb29wZXIgcG9pbnRlZCBvdXQgdG8gbWUgdGhhdCBtYW51YWxs
eSBhc3NpZ25pbmcgZG9tYWluIElEcyBpcyBzdXBwb3J0ZWQgaW4gbXVjaCBvZiB0aGUgY29kZSBh
bHJlYWR5LiBJZiBndWVzdCB0cmFuc3BhcmVudCBsaXZlIG1pZ3JhdGlvbiBnZXRzIAptZXJnZWQs
IHdlJ2xsIGxvb2sgYXQgcGFzc2luZyBpbiBhIGRvbWFpbiBJRCB0byB4bCwgd2hpY2ggd291bGQg
YmUgZ29vZCBlbm91Z2ggZm9yIHVzLiBJIGRvbid0IGtub3cgYWJvdXQgdGhlIG90aGVyIHRvb2xz
dGFja3MuCgotLVNhcmFoCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
