Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEE236167
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 18:34:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYng-0003XQ-9E; Wed, 05 Jun 2019 16:30:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYYne-0003U9-Bx
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 16:30:06 +0000
X-Inumbo-ID: 2c6d2d12-87af-11e9-bfbe-8b3423ace846
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2c6d2d12-87af-11e9-bfbe-8b3423ace846;
 Wed, 05 Jun 2019 16:30:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649E815A2;
 Wed,  5 Jun 2019 09:30:04 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9B0083F5AF;
 Wed,  5 Jun 2019 09:30:03 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-10-git-send-email-sstabellini@kernel.org>
 <1b8217e1-8671-e1e7-d5bc-4b4c144eedd6@arm.com>
 <alpine.DEB.2.21.1905101326060.25766@sstabellini-ThinkPad-T480s>
 <0dc6d4db-7b83-0b8d-77c4-2f97f73a659e@arm.com>
 <20f548ea-eb18-8700-9d1e-53462abbff0c@arm.com>
 <alpine.DEB.2.21.1905201407410.16404@sstabellini-ThinkPad-T480s>
 <c94041e2-8f85-6fd6-21cd-3dd082882854@arm.com>
Message-ID: <ca98ab78-452b-4429-9310-1a7c3f5bde36@arm.com>
Date: Wed, 5 Jun 2019 17:30:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c94041e2-8f85-6fd6-21cd-3dd082882854@arm.com>
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
Cc: xen-devel@lists.xenproject.org, nd@arm.com,
 Stefano Stabellini <stefanos@xilinx.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wNS8yMDE5IDIzOjM4LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gT24gMjAvMDUv
MjAxOSAyMjoyNiwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+PiBPbiBTYXQsIDExIE1heSAy
MDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IFRoaXMgaXMgbm90IGFib3V0IHByaXZpbGVnZSBv
dmVyIHRoZSBzeXN0ZW06IHdob2V2ZXIgd2lsbCBtYWtlIHRoZQo+PiBkZWNpc2lvbiB0byBhc2sg
dGhlIGh5cGVydmlzb3IgdG8gbWFwIHRoZSBwYWdlIHdpbGwgaGF2ZSBhbGwgdGhlCj4+IG5lY2Vz
c2FyeSByaWdodHMgdG8gZG8gaXQuwqAgSWYgdGhlIHVzZXIgd2FudHMgdG8gbWFwIGEgZ2l2ZW4g
cmVnaW9uLAo+PiBlaXRoZXIgYmVjYXVzZSBzaGUga25vd3Mgd2hhdCBzaGUgaXMgZG9pbmcsIGJl
Y2F1c2Ugc2hlIGlzCj4+IGV4cGVyaW1lbnRpbmcsIG9yIGZvciB3aGF0ZXZlciByZWFzb24sIEkg
dGhpbmsgc2hlIHNob3VsZCBiZSBhbGxvd2VkLiBJbgo+PiBmYWN0LCBzaGUgY2FuIGFsd2F5cyBk
byBpdCBieSByZXZlcnRpbmcgdGhlIHBhdGNoLiBTbyB3aHkgbWFrZSBpdAo+PiBpbmNvbnZlbmll
bnQgZm9yIGhlcj8KPiBUQkgsIEkgYW0gZ2V0dGluZyB2ZXJ5IGZydXN0cmF0ZWQgb24gcmV2aWV3
aW5nIHRoaXMgc2VyaWVzLiBXZSBzcGVudCBvdXIgCj4gcHJldmlvdXMgZjJmIG1lZXRpbmdzIGRp
c2N1c3NpbmcgcmVzZXJ2ZWQtbWVtb3J5IGluIGxlbmd0aHkgd2F5LiBXZSBhbHNvIGFncmVlZCAK
PiBvbiBhIHBsYW4gKHNlZSBiZWxvdyksIGJ1dCBub3cgd2UgYXJlIGJhY2sgb24gc3F1YXJlIG9u
ZSBhZ2Fpbi4uLgo+IAo+IFllcywgYSB1c2VyIHdpbGwgbmVlZCB0byByZXZlcnQgdGhlIHBhdGNo
LiBCdXQgdGhlbiBhcyB5b3Ugc2FpZCB0aGUgdXNlciB3b3VsZCAKPiBrbm93IHdoYXQgaGUvc2hl
IGlzIGRvaW5nLiBTbyByZXZlcnRpbmcgYSBwYXRjaCBpcyBub3QgZ29pbmcgdG8gYmUgYSBjb21w
bGljYXRpb24uCj4gCj4gSG93ZXZlciwgSSBhbHJlYWR5IHBvaW50ZWQgb3V0IG11bHRpcGxlIHRp
bWUgdGhhdCBnaXZpbmcgcGVybWlzc2lvbiBpcyBub3QgZ29pbmcgCj4gdG8gYmUgZW5vdWdoLiBT
byBJIHN0aWxsIGRvbid0IHNlZSB0aGUgdmFsdWUgb2YgaGF2aW5nIHRoYXQgaW4gWGVuIHdpdGhv
dXQgYW4gCj4gZWFzeSB3YXkgdG8gdXNlIGl0Lgo+IAo+IEZvciByZW1pbmRlciwgeW91IGFncmVl
ZCBvbiB0aGUgZm9sbG93aW5nIHNwbGl0dGluZyB0aGUgc2VyaWVzIGluIDMgcGFydHM6Cj4gIMKg
wqAgLSBQYXJ0IDE6IEV4dGVuZCBpb21lbSB0byBzdXBwb3J0IGNhY2hlYWJpbGl0eQo+ICDCoMKg
IC0gUGFydCAyOiBQYXJ0aWFsbHkgc3VwcG9ydCByZXNlcnZlZC1tZW1vcnkgZm9yIERvbTAgYW5k
IGRvbid0IGdpdmUgaW9tZW0gCj4gcGVybWlzc2lvbiBvbiB0aGVtCj4gIMKgwqAgLSBQYXJ0IDM6
IHJlc2VydmVkLW1lbW9yeSBmb3IgZ3Vlc3QKPiAKPiBJIGFncmVlZCB0byBtZXJnZSBwYXJ0IDEg
YW5kIDIuIFBhcnQgMyB3aWxsIGJlIGEgc3RhcnQgZm9yIGEgZGlzY3Vzc2lvbiBob3cgdGhpcyAK
PiBzaG91bGQgYmUgc3VwcG9ydGVkIGZvciBndWVzdC4gSSBhbHNvIHBvaW50ZWQgb3V0IHRoYXQg
WGlsaW54IGNhbiBjYXJyeSBwYXJ0IDMgCj4gaW4gdGhlaXIgdHJlZSBpZiB0aGV5IGZlZWwgbGlr
ZSB0b28uCgpJIGp1c3Qgd2FudGVkIHRvIGJ1bXAgdGhpcyBhcyBJIGhhdmVuJ3QgZ290IGFueSBm
ZWVkYmFjayBvbiB0aGUgd2F5IGZvcndhcmQgaGVyZS4KSXQgc2hvdWxkIGJlIHBvc3NpYmxlIGdl
dCBwYXJ0IDEgYW5kIDIgbWVyZ2VkIGZvciBYZW4gNC4xMy4KCkNoZWVycywKCi0tIApKdWxpZW4g
R3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
