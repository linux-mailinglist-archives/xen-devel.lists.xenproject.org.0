Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73981464
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 10:41:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huYVt-00068K-OU; Mon, 05 Aug 2019 08:38:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1huYVr-00068F-Ga
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 08:38:39 +0000
X-Inumbo-ID: 6b809d57-b75c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 6b809d57-b75c-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 08:38:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D290928;
 Mon,  5 Aug 2019 01:38:37 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0FDF03F706;
 Mon,  5 Aug 2019 01:38:36 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
 <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
Date: Mon, 5 Aug 2019 09:38:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJIGhhdmUgQ0NlZCBvbmUgcGVyc29uIGZyb20gRG9uZXJ3b3Jrcy4gSUlSQyB0aGV5IGhh
dmUgYmVlbiB1c2luZyB0aGUgSU1YOCBpbiAKdGhlIHBhc3QuCgpPbiAwMy8wOC8yMDE5IDIxOjU0
LCBBbWl0IFRvbWVyIHdyb3RlOgo+PiBJIGhhdmUgc2VlbiBtdWx0aXBsZSB0aHJlYWRzIGZyb20g
eW91IHBvaW50aW5nIGF0IGlzc3VlcyBvbiB0aGUgSU1YLjguIEhhdmUgdGhleQo+PiBiZWVuIHJl
c29sdmVkPyBJcyB0aGlzIHNlcmllcyBlbm91Z2ggdG8gZ2V0IFhlbiBhbmQgRG9tMCBib290aW5n
IG9uIHRoZSBOWFAKPj4gcGxhdGZvcm0/Cj4gCj4gWWVhaCwgbW9zdCBvZiBpc3N1ZXMgYXJlIHJl
c29sdmVkIG5vdyBhbmQgbWFpbmxpbmUgRFRTIGlzIHVzZWQgdG8KPiBicmluZyBYRU4gb24gdGhp
cyBpLk1YOCBwbGF0Zm9ybS4KPiAKPiBUaG91Z2ggdGhlcmUgaXMgc21hbGwgY2hhbmdlIHRoYXQg
Y29tbWVudCBvdXQgR1BDICh3aGljaCBpcyB1c2VkIHJvb3QKPiBpbnRlcnJ1cHQgcGFyZW50KSBh
bmQgaW5zdGVhZCB1c2UgR0lDCj4gaXMgZG9uZSBpbiBEVFMuCgpXaGF0IGFyZSB0aGUgY29uc2Vx
dWVuY2VzIHRvIGNoYW5nZSB0aGUgaW50ZXJydXB0IHBhcmVudD8KCj4gCj4gVGhlIHBhdGNoZXMg
aGFzIGJlZW4gdGVzdGVkIGJvb3RpbmcgRE9NMCB3aXRoIHJhbWZzLgoKSSBkb24ndCB0aGluayB0
aGlzIGlzIGVub3VnaCB0byBjbGFpbSBzdXBwb3J0IGZvciBYZW4gb24gdGhlIEkuTVg4TSBwbGF0
Zm9ybS4KV2hhdCBJIGRvbid0IHdhbnQgdG8gZW5kIHVwIGlzIGhhdmluZyB5ZXQgYW5vdGhlciBV
QVJUIGRyaXZlciB0byBtYWludGFpbiBpbiBYZW4gCmJ1dCB0aGUgcGxhdGZvcm0gaXMgc3RpbGwg
dW51c2FibGUuCgpZb3Ugc2hvdWxkIGF0IGxlYXN0IGJlIGFibGUgdG8gYm9vdCBtdWx0aXBsZSBk
b21haW5zIGFuZCB1c2UgYSBmdWxseSBmbGVkZ2UgCmRpc3RybyAoeW9jdG8sIERlYmlhbi4uLikg
ZnJvbSBhIG1hc3Mgc3RvcmFnZSAoYW5kIHBvc3NpYmx5IG5ldHdvcmspLgoKQ2hlZXJzLAoKLS0g
Ckp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
