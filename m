Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE324CE7B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2019 15:18:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdwuW-0003Y9-JG; Thu, 20 Jun 2019 13:15:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Q6/=UT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdwuV-0003Y2-El
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2019 13:15:27 +0000
X-Inumbo-ID: 77971112-935d-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 77971112-935d-11e9-8980-bc764e045a96;
 Thu, 20 Jun 2019 13:15:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C80B5344;
 Thu, 20 Jun 2019 06:15:25 -0700 (PDT)
Received: from [10.37.9.222] (unknown [10.37.9.222])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE1013F718;
 Thu, 20 Jun 2019 06:15:24 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
 <20190617185017.32661-1-sstabellini@kernel.org>
 <5D08BBA702000078002392FA@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <956b7e98-ab75-0496-473d-08a59f719e62@arm.com>
Date: Thu, 20 Jun 2019 14:15:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D08BBA702000078002392FA@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: switch pdx_init_mask to return
 uint64_t
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <stefanos@xilinx.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzE4LzE5IDExOjIzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxNy4w
Ni4xOSBhdCAyMDo1MCwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiBBbHNvIGNo
YW5nZSBzcmF0X3JlZ2lvbl9tYXNrIHRvIHVpbnQ2NF90IGFzIGl0IGlzIHVzZWQgdG8gc3RvcmUg
dGhlCj4+IHJldHVybiB2YWx1ZSBvZiBwZHhfaW5pdF9tYXNrLiB1aW50NjRfdCBpcyBhbHdheXMg
Z3JlYXRlciBvciBlcXVhbCB0bwo+PiB1NjQuCgpJIGFtIGEgYml0IGNvbmZ1c2VkIHdpdGggdGhl
IGxhc3Qgc2VudGVuY2UuIEluIHdoaWNoIGluc3RhbmNlLCB1aW50NjRfdCAKd291bGQgYmUgZ3Jl
YXRlciB0byB1NjQ/IEFyZW4ndCB0aGV5IG1lYW50IHRvIGJvdGggZW5jb2RlIGEgNjQtYml0IHZh
bHVlPwoKPj4KPj4gU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vc0B4
aWxpbnguY29tPgo+IAo+IE5vbi1Bcm0gYml0cwo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gYnV0IGNvdWxkIHlvdSBtYWtlIHRoZSB0aXRsZSBzb3VuZCBsZXNz
IGxpa2UgaXQncyBhbiBhY3R1YWwgY2hhbmdlCj4gdG8gdGhlIGZ1bmN0aW9uIHJldHVybiB0eXBl
PyBBbHNvIGl0J3Mgbm90IGp1c3QgaXRzIHJldHVybiB0eXBlCj4geW91IGNoYW5nZS4KClRvIG1v
dmUgdGhpcyBzZXJpZXMgZm9yd2FyZCwgaG93IGFib3V0IHRoZSBmb2xsb3dpbmcgY29tbWl0IG1l
c3NhZ2U6CgoieGVuOiBSZXBsYWNlIHU2NCB3aXRoIHVpbnQ2NF90IGluIHBkeF9pbml0X21hc2so
KSBhbmQgY2FsbGVycwoKWGVuIGlzIHBoYXNpbmcgb3V0IHRoZSB1c2Ugb2YgdTY0IGluIGZhdm9y
IG9mIHVpbnQ2NF90LgoKVGhlcmVmb3JlLCB0aGUgaW5zdGFuY2Ugb2YgdTY0IGluIHRoZSBwZHhf
aW5pdF9tYXNrKCkgKGFuZCB0aGUgY2FsbGVycykgCmFyZSBub3cgcmVwbGFjZWQgd2l0aCB1aW50
NjRfdC4KClRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIGFsc28gbW9kaWZ5IHNyYXRfcmVnaW9uX21h
c2sgYXMgdGhpcyBpcyB1c2VkIHRvIApzdG9yZSB0aGUgcmVzdWx0IG9mIHBkeF9pbml0X21hc2so
KS4KIgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
