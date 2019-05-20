Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B66D823A4B
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 16:38:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSjOE-0007w2-3s; Mon, 20 May 2019 14:35:46 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSjOD-0007vx-9A
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 14:35:45 +0000
X-Inumbo-ID: 8bef654c-7b0c-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8bef654c-7b0c-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 14:35:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B009380D;
 Mon, 20 May 2019 07:35:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2E7D3F5AF;
 Mon, 20 May 2019 07:35:41 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <osstest-136385-mainreport@xen.org>
 <23778.33200.47146.497482@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <7bea4485-b0da-ed92-336d-b2307c444cb1@arm.com>
Date: Mon, 20 May 2019 15:35:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <23778.33200.47146.497482@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [xen-4.11-testing test] 136385: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMjAvMDUvMjAxOSAxMTozMCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gb3NzdGVz
dCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIlt4ZW4tNC4xMS10ZXN0aW5nIHRlc3RdIDEzNjM4NTog
cmVncmVzc2lvbnMgLSBGQUlMIik6Cj4+IGZsaWdodCAxMzYzODUgeGVuLTQuMTEtdGVzdGluZyBy
ZWFsIFtyZWFsXQo+PiBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MvMTM2Mzg1Lwo+Pgo+PiBSZWdyZXNzaW9ucyA6LSgKPj4KPj4gVGVzdHMgd2hpY2ggZGlk
IG5vdCBzdWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4+IGluY2x1ZGluZyB0ZXN0cyB3aGljaCBj
b3VsZCBub3QgYmUgcnVuOgo+PiAgIHRlc3QtYW1kNjQtYW1kNjQteGwtcWVtdXQtZGViaWFuaHZt
LWFtZDY0IDEwIGRlYmlhbi1odm0taW5zdGFsbCBmYWlsIFJFR1IuIHZzLiAxMzU2ODMKPj4gICB0
ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV0LWRlYmlhbmh2bS1pMzg2LXhzbSAxMCBkZWJpYW4taHZt
LWluc3RhbGwgZmFpbCBSRUdSLiB2cy4gMTM1NjgzCj4gCj4gVGhlc2UgYXJlIGEga25vd24gYnVn
LiAgVGhlIERlYmlhbiAic3RyZXRjaCIgKCJzdGFibGUiKSBpMzg2IGtlcm5lbAo+IHNpbXBseSBk
b2VzIG5vdCB3b3JrIHVuZGVyIFhlbiBIVk0uICBJIGRvbid0IHRobmsgdGhpcyBpcyBhbnl0aGlu
ZyB0bwo+IGRvIHdpdGggdGhlIDQuMTEgWGVuIGNvbW1pdHMgdW5kZXIgdGVzdCBoZXJlLiAgSXQg
aXMgYXBwZWFyaW5nIGhlcmUgaW4KPiB0aGlzIGZsaWdodCBiZWNhdXNlIEkgcmVvcmdhbmlzZWQg
dGhlIGFtZDY0L2kzODYgdGVzdCBqb2JzLgo+IAo+PiAgIHRlc3QtYXJtaGYtYXJtaGYteGwtY3Jl
ZGl0MiAxNiBndWVzdC1zdGFydC9kZWJpYW4ucmVwZWF0IGZhaWwgUkVHUi4gdnMuIDEzNTY4Mwo+
IAo+IEkgbG9va2VkIGF0IHRoaXMuICBJIHRob3VnaHQgaXQgbWlnaHQgYmUgdGhlIGtub3duIHhl
bnN0b3JlIG1lbW9yeQo+IGhhbmRsaW5nIGJ1ZyBidXQgaXQgZG9lc24ndCBzZWVtIHRvIGJlLiAg
SSBsb29rZWQgYXQgdGhlIGxvZ3MgYW5kIHRoZQo+IGd1ZXN0IHNlZW1zIHNpbXBseSBub3QgdG8g
aGF2ZSBzdGFydGVkIGF0IGFsbC4gIFRoZXJlIGlzIG5vdGhpbmcgZnJvbQo+IGl0IGluIGl0cyBw
diBjb25zb2xlLiAgQWRkaW5nIHNvbWUgQVJNIGZvbGtzLiAgSSBoYXZlIGEgbWVtb3J5IG9mIHNv
bWUKPiBhbGxlZ2F0aW9uIHRoYXQgdGhlcmUgaXMgYSBmdW5kYW1lbnRhbCBjYWNoZSBtaXNtYW5h
Z2VtZW50IHByb2JsZW0KPiB3aGljaCBtaWdodCBjYXVzZSB0aGlzLCBpbiB3aGljaCBjYXNlIHdl
IHByb2JhYmx5IG91Z2h0IHRvIGZvcmNlIHB1c2guCgpUaGVyZSBhcmUgaW5kZWVkIHNvbWUgY2Fj
aGUgbWlzbWFuYWdlbWVudCBvbiBYZW4gNC4xMSwgYnV0IHRoZXkgd2VyZSBuZXZlciAKcmVsaWFi
bGUuIEluIHRoaXMgY2FzZSwgdGhleSBzZWVtIHRvIGJlIHJlbGlhYmxlLiBTbyB0aGlzIG1heSB3
ZWxsIGJlIGRpZmZlcmVudC4KCkJlZm9yZSB0aGUgbGFzdCAyIGZsaWdodHMsIHRoZSBrZXJuZWwg
d2FzIGNvbXBpbGVkIG5hdGl2ZWx5LiBOb3cgaXQgaXMgCmNyb3NzLWNvbXBpbGVkIG9uIHg4NiBt
YWNoaW5lLiBTbyB0aGVyZSBhcmUgYSBkaWZmZXJlbmNlIGluIHRoZSB3YXkgdGhlIGtlcm5lbCAK
aXMgYnVpbHQuCgpDb3VsZCB3ZSB0cnkgYSBmbGlnaHQgd2l0aCBrZXJuZWwgYnVpbHQgZnJvbSB0
aGUgY3ViaWV0cnVjaz8KCk9uIGEgc2lkZSBub3RlLCBJIG5vdGljZWQgdGhhdCB0aGUgbmFtZSBv
ZiB0aGUgZmlsZSBbMV0gbGVhZHMgdG8gdGhpbmsgaXQgaXMgYSAKZ3ppcCwgYnV0IGl0IGlzIGFj
dHVhbGx5IGEgcGxhaW4gdGV4dC4KCkNoZWVycywKClsxXSAKaHR0cDovL2xvZ3MudGVzdC1sYWIu
eGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjM4NS90ZXN0LWFybWhmLWFybWhmLXhsLWNy
ZWRpdDIvY3ViaWV0cnVjay1nbGVpemVzLS0tdmFyLWxvZy14ZW4tY29uc29sZS1ndWVzdC1kZWJp
YW4uZ3Vlc3Qub3NzdGVzdC5sb2cuZ3oKCj4gCj4gSWFuLgo+IAoKLS0gCkp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
