Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA5EB6258
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:39:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYFa-0004qC-Hg; Wed, 18 Sep 2019 11:35:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAYFY-0004pL-EA
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:35:56 +0000
X-Inumbo-ID: 79c2a118-da08-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 79c2a118-da08-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 11:35:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF8DF337;
 Wed, 18 Sep 2019 04:35:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50C233F575;
 Wed, 18 Sep 2019 04:35:51 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
 <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
 <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <fa17e9fc-2707-cf8b-21ec-b0e0ecebfabc@arm.com>
Date: Wed, 18 Sep 2019 12:35:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0DDE80F8-7E7A-4A2D-B2E3-E8E7C626A608@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC8wOS8yMDE5IDEyOjI3LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gCj4g
Cj4+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTM6MTksIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBQYXdlbCwKPj4KPj4gT24gMTgvMDkvMjAxOSAxMTo0
NCwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4+IE9uIDE4LiBTZXAgMjAxOSwgYXQg
MTI6NDEsIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4+Pgo+
Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXMgKCJSZTogW1BBVENIXSBjcmVhdGUtZGlmZi1vYmplY3Q6
IG1vcmUgcHJlY2lzZWx5IGlkZW50aWZ5IC5yb2RhdGEgc2VjdGlvbnMiKToKPj4+Pj4gT24gMTgv
MDkvMjAxOSAxMDo1MiwgV2llY3pvcmtpZXdpY3osIFBhd2VsIHdyb3RlOgo+Pj4+Pj4gJCBzY3Jp
cHRzLy4vYWRkX21haW50YWluZXJzLnBsIC1kIH4vZ2l0L2xpdmVwYXRjaC1idWlsZC10b29scwo+
Pj4+Pgo+Pj4+PiAnLWQnIG9ubHkgdGVsbHMgeW91IHdoZXJlIHRoZSBwYXRjaGVzIGZpbGVzIGFy
ZS4gVGhlIHNjcmlwdCB3aWxsIGxvb2sgdXAgZm9yIHRoZQo+Pj4+PiBNQUlOVEFJTkVSUyBmaWxl
IGluIHRoZSBjdXJyZW50IGRpcmVjdG9yeS4KPj4+Pgo+Pj4+IEhtbW0uICBJIHdvbmRlciBpZiB3
ZSBjb3VsZCBkZXRlY3QgdGhpcyBzaXR1YXRpb24gc29tZWhvdy4gIFRoaXMgd2lsbAo+Pj4+IGJl
IGEgY29tbW9uIHVzZXIgZXJyb3IgSSB0aGluay4KPj4+Pgo+Pj4gSSBzaG91bGQgaGF2ZSBsb29r
ZWQgdHdpY2UgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoIG91dC4gQnV0LCB3aGF0IHdvdWxkIGJl
IHZlcnkgaGVscGZ1bCBmb3IgbWUKPj4+IGlzIGFkZGl0aW9uYWwgb3B0aW9uIHRvIHRoZSBhZGRf
bWFpbnRhaW5lcnMucGwgc2NyaXB0IGxpa2U6IC1tIC4vTUFJTlRBSU5FUlMKPj4KPj4gV2VsbCB0
aGUgZmlsZW5hbWUgd2lsbCBhbHdheXMgYmUgdGhlIHNhbWUsIHNvIGF0IGJlc3QgeW91IHdpbGwg
cHJvdmlkZSByZWR1bmRhbnQgaW5mb3JtYXRpb24uCj4gCj4gTm90IGlmIEkgY3JlYXRlIGEgZ2l0
LWlnbm9yZWQgc3ltbGluayB0byB0aGUgb3RoZXIgcmVwby4KCldoeSB3b3VsZCB5b3UgZG8gdGhh
dC4uLj8KCmFkZF9tYWludGFpbmVycy5wbCBhbmQgZ2V0X21haW50YWluZXJzLnBsIHJlbGllcyB0
byBiZSB1c2VkIG9uIC4vTUFJTlRBSU5FUlMuIEkgCmFtIHF1aXRlIHJlbHVjdGFudCB0byBhbGxv
dyBhbnkgb3RoZXIgdXNlIGFzIHlvdSBpbmNyZWFzZSB0aGUgcmlzayBmb3IgdGhlIHVzZXIgCnRv
IG1pc3VzZSB0aGUgc2NyaXB0cy4KCj4gCj4+Cj4+IEhvd2V2ZXIsIGl0IGlzIG5vdCB1bmNvbW1v
biB0byBoYXZlIHNjcmlwdCB0aGF0IG5lZWRzIHRvIGFwcGx5IG9uIHRoZSBjdXJyZW50IGRpcmVj
dG9yeS4gV2hhdCB3b3VsZCBhIG5ldyBvcHRpb24gYWRkPyBJcyBpdCBqdXN0IGF2b2lkIHRvIGRv
IGEgImNkIC4uLiIgYmVmb3JlPwo+Pgo+IAo+IE1haW5seSB0aGUgbmV3IG9wdGlvbiB3aWxsIGF2
b2lkIHRoZSAnY2QnLCBidXQgaXQgd2lsbCBhbHNvIGZvcmNlIG1lIHRvIHNwZWNpZnkgdGhlIHJp
Z2h0IGZpbGUuCj4gCj4gVGhlIG9wdGlvbiBjYW4gYmUgdG90YWxseSBvcHRpb25hbCB3aXRoIGEg
Q1dEIGFzIGEgZGVmYXVsdCBmYWxsYmFjay4KCldoaWNoIGNvbXBsZXRlbHkgZGVmZWF0cyB0aGUg
cHVycG9zZSBvZiBmb3JjaW5nIHlvdSB0aGUgc3BlY2lmeSB0aGUgcmlnaHQgZmlsZS4uLgoKQ2hl
ZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
