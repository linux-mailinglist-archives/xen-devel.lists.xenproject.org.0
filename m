Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C59B16C0E
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 22:18:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO6Uk-0004oB-Ru; Tue, 07 May 2019 20:15:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qCYz=TH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hO6Uj-0004o6-5w
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 20:15:21 +0000
X-Inumbo-ID: d6249276-7104-11e9-944f-c71657d2afc7
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d6249276-7104-11e9-944f-c71657d2afc7;
 Tue, 07 May 2019 20:15:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D49BA78;
 Tue,  7 May 2019 13:15:19 -0700 (PDT)
Received: from [10.37.8.6] (unknown [10.37.8.6])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C24F3F5C1;
 Tue,  7 May 2019 13:15:18 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1b8217e1-8671-e1e7-d5bc-4b4c144eedd6@arm.com>
Date: Tue, 7 May 2019 21:15:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 10/10] xen/arm: add reserved-memory
 regions to the dom0 memory node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDQvMzAvMTkgMTA6MDIgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBSZXNlcnZlZCBtZW1vcnkgcmVnaW9ucyBhcmUgYXV0b21hdGljYWxseSByZW1hcHBlZCB0
byBkb20wLiBUaGVpciBkZXZpY2UKPiB0cmVlIG5vZGVzIGFyZSBhbHNvIGFkZGVkIHRvIGRvbTAg
ZGV2aWNlIHRyZWUuIEhvd2V2ZXIsIHRoZSBkb20wIG1lbW9yeQo+IG5vZGUgaXMgbm90IGN1cnJl
bnRseSBleHRlbmRlZCB0byBjb3ZlciB0aGUgcmVzZXJ2ZWQgbWVtb3J5IHJlZ2lvbnMKPiByYW5n
ZXMgYXMgcmVxdWlyZWQgYnkgdGhlIHNwZWMuICBUaGlzIGNvbW1pdCBmaXhlcyBpdC4KCkFGQUlD
VCwgdGhpcyBkb2VzIG5vdCBjb3ZlciB0aGUgcHJvYmxlbSBtZW50aW9uIGJ5IEFtaXQgaW4gWzFd
LgoKQnV0IEkgYW0gc3RpbGwgbm90IGhhcHB5IHdpdGggdGhlIGFwcHJvYWNoIHRha2VuIGZvciB0
aGUgcmVzZXJ2ZWQtbWVtb3J5IApyZWdpb25zIGluIHRoaXMgc2VyaWVzLiBBcyBJIHBvaW50ZWQg
b3V0IGJlZm9yZSwgdGhleSBhcmUganVzdCBub3JtYWwgCm1lbW9yeSB0aGF0IHdhcyByZXNlcnZl
ZCBmb3Igb3RoZXIgcHVycG9zZSAoQ01BLCBmcmFtZWJ1ZmZlci4uLikuCgpUcmVhdGluZyB0aGVt
IGFzICJkZXZpY2UiIGZyb20gWGVuIFBPViBpcyBhIGNsZWFyIGFidXNlIG9mIHRoZSBtZWFuaW5n
IAphbmQgSSBkb24ndCBiZWxpZXZlIGl0IGlzIGEgdmlhYmxlIHNvbHV0aW9uIGxvbmcgdGVybS4K
CkluZGVlZCwgc29tZSBvZiB0aGUgcmVnaW9ucyBtYXkgaGF2ZSBhIHByb3BlcnR5ICJyZXVzYWJs
ZSIgYWxsb3dpbmcgdGhlIAp0aGUgT1MgdG8gdXNlIHRoZW0gdW50aWwgdGhleSBhcmUgY2xhaW1l
ZCBieSB0aGUgZGV2aWNlIGRyaXZlciBvd25pbmcgCnRoZSByZWdpb24uIEkgZG9uJ3Qga25vdyBo
b3cgTGludXggKG9yIGFueSBvdGhlciBPUykgaXMgdXNpbmcgaXQgdG9kYXksIApidXQgSSBkb24n
dCBzZWUgd2hhdCB3b3VsZCBwcmV2ZW50IGl0IHRvIHVzZSB0aGVtIGFzIGh5cGVyY2FsbCBidWZm
ZXIuIApUaGlzIHdvdWxkIG9idmlvdXNseSBub3Qgd29yayBiZWNhdXNlIHRoZXkgYXJlIG5vdCBh
Y3R1YWwgUkFNIGZyb20gWGVuIFBPVi4KCk9uIGEgc2ltaWxhciB0b3BpYywgYmVjYXVzZSB0aGV5
IGFyZSBub3JtYWwgbWVtb3J5LCBJIGRvbid0IHRoaW5rIApYRU5fRE9NQ1RMX21lbW9yeV9tYXBw
aW5nIHNob3VsZCBiZSBhYmxlIHRvIG1hcCByZXNlcnZlZC1yZWdpb25zLiBTbyB0aGUgCmlvbWVt
IHJhbmdlc2V0IHNob3VsZCBub3QgY29udGFpbiB0aGVtLgoKQ2hlZXJzLAoKWzFdIDxDQUJIRDRL
LXoteD0zam9KV2NPYl94OW03enNqemhza0RRd2VOQnIrcGFMUz1QRkVZOVFAbWFpbC5nbWFpbC5j
b20+CgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
