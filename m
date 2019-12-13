Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F77D11E38D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 13:27:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifk0K-0008Ki-DZ; Fri, 13 Dec 2019 12:25:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifk0J-0008Kd-H3
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 12:25:07 +0000
X-Inumbo-ID: 98153dd6-1da3-11ea-8eee-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98153dd6-1da3-11ea-8eee-12813bfff9fa;
 Fri, 13 Dec 2019 12:25:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CB90AE35;
 Fri, 13 Dec 2019 12:25:05 +0000 (UTC)
To: George Dunlap <George.Dunlap@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-5-george.dunlap@citrix.com>
 <cd807be2-1dcc-5b1b-7cb1-0b77dfc12f04@citrix.com>
 <424507b8-205f-19f3-3e57-7a6986aeb4f7@suse.com>
 <595E3CB8-7EDE-4F19-99DA-B2E9C1A1AD97@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cfcdea47-a287-3b4e-d1c4-718cf2a3e5b9@suse.com>
Date: Fri, 13 Dec 2019 13:25:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <595E3CB8-7EDE-4F19-99DA-B2E9C1A1AD97@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/mm: More discriptive names for page
 de/validation functions
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMjAxOSAxMzowMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPiAKPiAKPj4gT24gRGVj
IDEzLCAyMDE5LCBhdCAxMDo0OCBBTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPj4KPj4gT24gMTIuMTIuMjAxOSAyMTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+
IE9uIDEyLzEyLzIwMTkgMTc6MzIsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+Pj4gVGhlIGZ1bmN0
aW9ucyBhbGxvY19wYWdlX3R5cGUoKSwgYWxsb2NfbE5fdGFibGUoKSwgZnJlZV9wYWdlX3R5cGUo
KQo+Pj4+IGFuZCBmcmVlX2xOX3RhYmxlKCkgYXJlIGNvbmZ1c2luZ2x5IG5hbWVkOgo+Pj4KPj4+
IFRoZXJlIGlzIGFsbG9jX3NlZ2Rlc2NfcGFnZSgpIHdoaWNoIHNob3VsZCBiZSBhZGp1c3RlZCBm
b3IgY29uc2lzdGVuY3kuCj4+Pgo+Pj4+IG5vdGhpbmcgaXMgYmVpbmcgYWxsb2NhdGVkIG9yIGZy
ZWVkLgo+Pj4KPj4+IFdlbGwgLSBzdHJpY3RseSBzcGVha2luZyB0aGUgdHlwZSByZWZlcmVuY2Ug
aXMgYmVpbmcgb2J0YWluZWQvZHJvcHBlZCwKPj4+IGFuZCB0aGlzIGlzIGEga2luZCBvZiBhbGxv
Yy9mcmVlLCBhbHRob3VnaCBJIGFncmVlIHRoYXQgdGhlIG5hbWVzIGFyZQo+Pj4gbm90IGdyZWF0
Lgo+IAo+IE9uIHRoZSBjb250cmFyeSDigJQgdGhlIHR5cGUgcmVmZXJlbmNlIHdhcyBvYnRhaW5l
ZCAvIHdpbGwgYmUgZHJvcHBlZCBpbiB7Z2V0LHB1dH1fcGFnZV90eXBlKCk7IGJ1dCB0aGUgcGFn
ZSBoYXMgbm90IHlldCBiZWVuIHZhbGlkYXRlZCB0byBhY3R1YWxseSBiZSB1c2VkIGFzIHRoYXQg
dHlwZSAvIHN0aWxsIGhvbGRzIHJlZmVyZW5jZXMgdG8gb3RoZXIgcGFnZXMgYXMgdGhvdWdoIGl0
IHdlcmUgdGhhdCB0eXBlLiAgCj4gCj4+Pgo+Pj4gSG93ZXZlciwgSSdtIG5vdCBlbnRpcmVseSBz
dXJlIHRoYXQge2RlLH12YWxpZGF0ZSBhcmUgZ3JlYXQgZWl0aGVyLAo+Pj4gYmVjYXVzZSBpdCBp
c24ndCBvYnZpb3VzbHkgdGllZCB0byBvYnRhaW5pbmcvZHJvcHBpbmcgYSB0eXBlIHJlZmVyZW5j
ZS4KPj4+Cj4+PiBUaGF0IHNhaWQsIEkgZG9uJ3QgaGF2ZSBhIGJldHRlciBzdWdnZXN0aW9uIHJp
Z2h0IG5vdy4KPj4KPj4gRm9sbG93aW5nIHRoZSB3b3JkaW5nIG9mIHlvdXJzLCBob3cgYWJvdXQg
e29idGFpbixkcm9wfV9wYWdlX3R5cGUoKT8KPiAKPiDigJxPYnRhaW7igJ0gaXMgbGl0ZXJhbGx5
IGEgc3lub255bSBmb3Ig4oCcZ2V04oCdOyBhbmQgdGhlcmUgYXJlIG1hbnkgcGxhY2VzIGluIHRo
ZSBjb2RlIHdoZXJlIHdlIHNheSB0aGluZyBsaWtlLCDigJxkcm9wIHRoZSB0eXBlIGNvdW504oCd
IGp1c3QgYmVmb3JlIGNhbGxpbmcg4oCccHV04oCdLiAgCj4gCj4gSSBhZ3JlZSDigJxkZXZhbGlk
YXRl4oCdIGxvb2tzIGEgYml0IGNsdW5reSwgYnV0IGFsbCB0aHJvdWdoIHRoZSBkaXNjdXNzaW9u
cyBvbiBYU0EtMjk5LCB0aGUgd29yZCDigJxkZS12YWxpZGF0ZeKAnSB3YXMgdXNlZCBmb3IgdGhl
IHdvcmsgdGhhdCB0aGUg4oCcZnJlZSIgZnVuY3Rpb25zIGFyZSBkb2luZyDigJQgbmFtZWx5LCBk
cm9wcGluZyByZWZlcmVuY2VzIHRvIG90aGVyIHBhZ2VzIHN1Y2ggdGhhdCB0aGUg4oCcdmFsaWRh
dGXigJ0gYml0IGlzIGNsZWFyLgoKVHJ1ZS4KCj4gSSBtZWFuLCB3ZSBjb3VsZCBkbyBzb21ldGhp
bmcgbGlrZSDigJxibGVzc+KAnSBhbmQg4oCcdW5ibGVzc+KAnSwgYnV0IEkgaGFyZGx5IHRoaW5r
IHRoYXTigJlzIG1vcmUgY2xlYXIuICDigJxwcm9tb3Rl4oCdIGFuZCDigJxkZW1vdGXigJ0/CgpX
aHkgbm90LiBQZXJoYXBzIHdpdGggdGhlIHRyYWlsaW5nIF90eXBlIGFsc28gZHJvcHBlZD8KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
