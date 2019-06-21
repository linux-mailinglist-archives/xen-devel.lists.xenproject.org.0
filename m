Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AF4E07E
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 08:19:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heCro-00070R-PJ; Fri, 21 Jun 2019 06:17:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jygh=UU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1heCrn-00070L-GD
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 06:17:43 +0000
X-Inumbo-ID: 46d053b1-93ec-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 46d053b1-93ec-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 06:17:42 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 21 Jun 2019 00:17:41 -0600
Message-Id: <5D0C76820200007800239ED2@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Fri, 21 Jun 2019 00:17:38 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Julien Grall" <julien.grall@arm.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>
References: <alpine.DEB.2.21.1906171146440.2072@sstabellini-ThinkPad-T480s>
 <20190617185017.32661-1-sstabellini@kernel.org>
 <5D08BBA702000078002392FA@prv1-mh.provo.novell.com>
 <956b7e98-ab75-0496-473d-08a59f719e62@arm.com>
In-Reply-To: <956b7e98-ab75-0496-473d-08a59f719e62@arm.com>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIwLjA2LjE5IGF0IDE1OjE1LCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IE9uIDYvMTgvMTkgMTE6MjMgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+PiBPbiAxNy4wNi4x
OSBhdCAyMDo1MCwgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4gQWxzbyBjaGFu
Z2Ugc3JhdF9yZWdpb25fbWFzayB0byB1aW50NjRfdCBhcyBpdCBpcyB1c2VkIHRvIHN0b3JlIHRo
ZQo+Pj4gcmV0dXJuIHZhbHVlIG9mIHBkeF9pbml0X21hc2suIHVpbnQ2NF90IGlzIGFsd2F5cyBn
cmVhdGVyIG9yIGVxdWFsIHRvCj4+PiB1NjQuCj4gCj4gSSBhbSBhIGJpdCBjb25mdXNlZCB3aXRo
IHRoZSBsYXN0IHNlbnRlbmNlLiBJbiB3aGljaCBpbnN0YW5jZSwgdWludDY0X3QgCj4gd291bGQg
YmUgZ3JlYXRlciB0byB1NjQ/IEFyZW4ndCB0aGV5IG1lYW50IHRvIGJvdGggZW5jb2RlIGEgNjQt
Yml0IHZhbHVlPwoKT2gsIGluZGVlZCAtIHNvbWVob3cgSSBkaWRuJ3QgZXZlbiBub3RpY2UgdGhp
cy4gSWYgYW55dGhpbmcgaXQncyB0aGUgb3RoZXIKd2F5IGFyb3VuZCBhY3R1YWxseSwgYmVjYXVz
ZSB1aW50NjRfdCBpcyBtYW5kYXRlZCB0byBiZSBleGFjdGx5IDY0IGJpdHMKd2lkZSwgd2hlcmVh
cyB0aGVyZSdzIG5vIHN0cmljdCBzcGVjaWZpY2F0aW9uIGZvciB1NjQgYWZhaWEsIGJ1dCBJIHZl
cnkKbXVjaCBhc3N1bWUgdGhlIGludGVudGlvbnMgdGhlcmUgaGF2ZSBiZWVuIHRoZSBzYW1lLgoK
VGhlIHByb3Bvc2VkIHRpdGxlIGFuZCB0ZXh0IHJlcGxhY2VtZW50cyBsb29rIGZpbmUgdG8gbWUu
CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
