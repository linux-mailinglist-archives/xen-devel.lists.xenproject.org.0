Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 376D7815B7
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:42:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZTk-00033G-F8; Mon, 05 Aug 2019 09:40:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9cV=WB=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1huZTi-000337-EU
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:40:30 +0000
X-Inumbo-ID: 0df818a2-b765-11e9-9f16-f3ee0e1b9b7b
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0df818a2-b765-11e9-9f16-f3ee0e1b9b7b;
 Mon, 05 Aug 2019 09:40:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53DBE28;
 Mon,  5 Aug 2019 02:40:26 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DEA83F694;
 Mon,  5 Aug 2019 02:40:25 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <231b516e-5d23-167f-92c8-f9dcf717467d@arm.com>
Date: Mon, 5 Aug 2019 10:40:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwOS8wNC8yMDE5IDEyOjQyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAwOS4w
NC4xOSBhdCAxMzoyNiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gT24gMDMvMDQv
MjAxOSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+PiBBbHNvIHBsZWFzZSBub3RlIHRoZSBx
dW90YXRpb24gdXNlZCBieSB0aGUgbWVudGlvbmVkCj4+PiBleGlzdGluZyBkb2MgY29tbWVudHMs
IGFzIHdlbGwgYXMgYSBmZXcgb3RoZXIgZm9ybWFsIGFzcGVjdHMKPj4+IChsaWtlIHRoZW0gYWxz
byBtYWtpbmcgY2xlYXIgd2hhdCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rCj4+PiB0aGF0
J3MgYSBtb2RlbCB1c2VkIGVsc2V3aGVyZSBhcyB3ZWxsLCBzbyBJIHRoaW5rIHlvdSBzaG91bGQK
Pj4+IGZvbGxvdyBpdCBoZXJlLgo+Pgo+PiBJIGhhdmVuJ3QgcmVwbGljYXRlZCB0aGUgYCBiZWNh
dXNlIEkgaGF2ZSBubyBpZGVhIHdoYXQgdGhleSBhcmUgdXNlZCBmb3IuIEkKPj4gd291bGQgYXBw
cmVjaWF0ZSBpZiB5b3UgcHJvdmlkZSBwb2ludGVyIGhvdyB0byB1c2UgdGhlbS4KPiAKPiBXZWxs
LCBJIGNhbiBvbmx5IHBvaW50IHlvdSBhdCB0aGUgaGlzdG9yeSBvZiB0aGluZ3MsIGUuZy4KPiAy
NjJlMTE4YTM3ICJkb2NzL2h0bWwvOiBBbm5vdGF0aW9ucyBmb3IgdHdvIGh5cGVyY2FsbHMiLgo+
IAo+Pj4gVGhlIG90aGVyIHRoaW5nIGlzOiBBcyBtZW50aW9uZWQgZWxzZXdoZXJlLCBJIGRvbid0
IHRoaW5rIHRoZQo+Pj4gZmlyc3QgdHdvIHBhcmFtZXRlcnMgc2hvdWxkIGJlIHBsYWluIGludC4g
SSdtIG5vdCBoYXBweSB0byBzZWUKPj4+IHRoaXMgcHJvbGlmZXJhdGUgaW50byBkb2N1bWVudGF0
aW9uIGFzIHdlbGwsIGkuZS4gSSdkIHByZWZlciBpZgo+Pj4gdGhpcyB3YXMgY29ycmVjdGVkIGJl
Zm9yZSBhZGRpbmcgZG9jdW1lbnRhdGlvbi4gV291bGQgeW91Cj4+PiBiZSB3aWxsaW5nIHRvIGRv
IHRoaXMsIG9yIHNob3VsZCBJIGFkZCBpdCB0byBteSB0b2RvIGxpc3Q/Cj4+Cj4+IFdoaWxlIHN3
aXRjaGluZyBmcm9tIGNtZCBmcm9tIHNpZ25lZCB0byB1bnNpZ25lZCBzaG91bGQgYmUgb2suIFRo
aXMgd291bGQKPj4gaW50cm9kdWNlIGEgZGlmZmVyZW50IGJlaGF2aW9yIG9mIGZvciBjb3VudC4K
PiAKPiBTaW5jZSB0aGlzIHJlbW92ZXMgYW4gZXJyb3IgY29uZGl0aW9uLCBJIHRoaW5rIHRoaXMg
aXMgYW4gb2theSBjaGFuZ2UKPiB0byBoYXBwZW4sIHdpdGhvdXQgLi4uCj4gCj4+IEFyZSB3ZSBo
YXBweSB3aXRoIHRoYXQsIG9yIHNoYWxsIHdlIGFkZCBhIGNoZWNrICgoaW50KWNvdW50KSA+IDA/
Cj4gCj4gLi4uIGFueSBzdWNoIGV4dHJhIGNoZWNrLiBUaGlzIGFsc28gaXNuJ3QgZ29pbmcgdG8g
aW50cm9kdWNlIGFueSBuZXcKPiByZWFsIHJpc2sgb2YgYSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9u
IG9yIHNvbWUgc3VjaCAtIGlmIDJHYiBvZiBpbnB1dAo+IGRhdGEgYXJlIGZpbmUsIEkgY2FuJ3Qg
c2VlIHdoeSA0R2Igd291bGRuJ3QgYmUsIHRvby4KCkFjdHVhbGx5LCBpdCB3aWxsIG5vdCBiZSBm
aW5lIGF0IGxlYXN0IGZvciB0aGUgcmVhZCBjYXNlLiBUaGUgcmV0dXJuIHZhbHVlIGlzIGEgCjMy
LWJpdCB2YWx1ZSAob24gQUFyY2gzMiBhbmQgaWYgeW91IHdhbnQgdG8ga2VlcCBjb21wYXQgYmV0
d2VlbiA2NC1iaXQgYW5kIAozMi1iaXQpLiBBIG5lZ2F0aXZlIHZhbHVlIGluZGljYXRlcyBhbiBl
cnJvci4gQXMgd2UgcmV0dXJuIHRoZSBudW1iZXIgb2YgCmNoYXJhY3RlcnMgcmVhZCwgaXQgbWVh
bnMgd2UgY2FuIG9ubHkgaGFuZGxlIDJHQi4KClNvIEkgd291bGQgcmF0aGVyIGxpbWl0IHRoZSBi
dWZmZXIgdG8gMkdCIGZvciBldmVyeW9uZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
