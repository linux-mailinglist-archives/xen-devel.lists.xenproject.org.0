Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AAAA3FA
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2019 15:13:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5rWX-0003wN-Gv; Thu, 05 Sep 2019 13:10:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KTe=XA=kernel.org=mhiramat@srs-us1.protection.inumbo.net>)
 id 1i5rWW-0003qc-MU
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2019 13:10:04 +0000
X-Inumbo-ID: 796848c8-cfde-11e9-abca-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 796848c8-cfde-11e9-abca-12813bfff9fa;
 Thu, 05 Sep 2019 13:10:04 +0000 (UTC)
Received: from devnote2 (NE2965lan1.rev.em-net.ne.jp [210.141.244.193])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02CC4206CD;
 Thu,  5 Sep 2019 13:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567689002;
 bh=T6Hjysi8KQ3q7Hw/PPwFXQ6fg/TWt+MuBSvYozhEKcY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oxqK7XnFmv/m8jH5QET6wGe5cWWTp/PCIVUr31qWbtDqzR5WkRSq906Qkr16jtNxb
 MrtxJ3jWmOz9xJxqJE1suTgLAftz/i7cyFOf4SwdT2BnVPq59d1yrk3l/tMXlDw+am
 hDDQyj9hAvxS6u5h+cOIMysaE70bTcIGivIJyF5E=
Date: Thu, 5 Sep 2019 22:09:58 +0900
From: Masami Hiramatsu <mhiramat@kernel.org>
To: Masami Hiramatsu <mhiramat@kernel.org>
Message-Id: <20190905220958.d0189e1e253f9e553b880675@kernel.org>
In-Reply-To: <20190905203224.e41d7f3dfbf918c5031f9766@kernel.org>
References: <156759754770.24473.11832897710080799131.stgit@devnote2>
 <ad6431be-c86e-5ed5-518a-d1e9d1959e80@citrix.com>
 <20190905104937.60aa03f699a9c0fbf1b651b9@kernel.org>
 <1372ce73-e2d8-6144-57df-a98429587826@citrix.com>
 <20190905203224.e41d7f3dfbf918c5031f9766@kernel.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Xen-devel] [PATCH -tip 0/2] x86: Prohibit kprobes on
 XEN_EMULATE_PREFIX
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Randy Dunlap <rdunlap@infradead.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@redhat.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA1IFNlcCAyMDE5IDIwOjMyOjI0ICswOTAwCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJh
bWF0QGtlcm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBUaHUsIDUgU2VwIDIwMTkgMDg6NTQ6MTcgKzAx
MDAKPiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiAK
PiA+IE9uIDA1LzA5LzIwMTkgMDI6NDksIE1hc2FtaSBIaXJhbWF0c3Ugd3JvdGU6Cj4gPiA+IE9u
IFdlZCwgNCBTZXAgMjAxOSAxMjo1NDo1NSArMDEwMAo+ID4gPiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPiA+ID4KPiA+ID4+IE9uIDA0LzA5LzIwMTkg
MTI6NDUsIE1hc2FtaSBIaXJhbWF0c3Ugd3JvdGU6Cj4gPiA+Pj4gSGksCj4gPiA+Pj4KPiA+ID4+
PiBUaGVzZSBwYXRjaGVzIGFsbG93IHg4NiBpbnN0cnVjdGlvbiBkZWNvZGVyIHRvIGRlY29kZQo+
ID4gPj4+IHhlbi1jcHVpZCB3aGljaCBoYXMgWEVOX0VNVUxBVEVfUFJFRklYLCBhbmQgcHJvaGli
aXQKPiA+ID4+PiBrcHJvYmVzIHRvIHByb2JlIG9uIGl0Lgo+ID4gPj4+Cj4gPiA+Pj4gSm9zaCBy
ZXBvcnRlZCB0aGF0IHRoZSBvYmp0b29sIGNhbiBub3QgZGVjb2RlIHN1Y2ggc3BlY2lhbAo+ID4g
Pj4+IHByZWZpeGVkIGluc3RydWN0aW9ucywgYW5kIEkgZm91bmQgdGhhdCB3ZSBhbHNvIGhhdmUg
dG8KPiA+ID4+PiBwcm9oaWJpdCBrcHJvYmVzIHRvIHByb2JlIG9uIHN1Y2ggaW5zdHJ1Y3Rpb24u
Cj4gPiA+Pj4KPiA+ID4+PiBUaGlzIHNlcmllcyBjYW4gYmUgYXBwbGllZCBvbiAtdGlwIG1hc3Rl
ciBicmFuY2ggd2hpY2gKPiA+ID4+PiBoYXMgbWVyZ2VkIEpvc2gncyBvYmp0b29sL3BlcmYgc2hh
cmluZyBjb21tb24geDg2IGluc24KPiA+ID4+PiBkZWNvZGVyIHNlcmllcy4KPiA+ID4+IFRoZSBw
YXJhdmlydHVhbGlzZWQgeGVuLWNwdWlkIGlzIHdlcmUgeW91J2xsIHNlZSBpdCBtb3N0IGluIGEg
cmVndWxhcgo+ID4gPj4ga2VybmVsLCBidXQgYmUgYXdhcmUgdGhhdCBpdCBpcyBhbHNvIHVzZWQg
Zm9yIHRlc3RpbmcgcHVycG9zZXMgaW4gb3RoZXIKPiA+ID4+IGNpcmN1bXN0YW5jZXMsIGFuZCB0
aGVyZSBpcyBhbiBlcXVpdmFsZW50IEtWTSBwcmVmaXggd2hpY2ggaXMgdXNlZCBmb3IKPiA+ID4+
IEtWTSB0ZXN0aW5nLgo+ID4gPiBHb29kIGNhdGNoISBJIGRpZG4ndCBub3RpY2UgdGhhdC4gSXMg
dGhhdCByZWFsbHkgc2FtZSBzZXF1YW5jZSBvciBLVk0gdXNlcwo+ID4gPiBhbm90aGVyIHNlcXVl
bmNlIG9mIGluc3RydWN0aW9ucyBmb3IgS1ZNIHByZWZpeD8KPiA+IAo+ID4gSSBkb24ndCBrbm93
IGlmIHlvdSd2ZSBzcG90dGVkLCBidXQgdGhlIHByZWZpeCBpcyBhIHVkMmEgaW5zdHJ1Y3Rpb24K
PiA+IGZvbGxvd2VkIGJ5ICd4ZW4nIGluIGFzY2lpLgo+ID4gCj4gPiBUaGUgS1ZNIHZlcnNpb24g
d2FzIGFkZGVkIGluIGMvcyA2Yzg2ZWVkYzIwNmRkMWY5ZDM3YTI3OTZmYWE4ZTZmMjI3ODIxNWQy
CgpIbW0sIEkgdGhpbmsgSSBtaWdodCBtaXN1bmRlcnN0YW5kIHdoYXQgdGhlICJlbXVsYXRlIHBy
ZWZpeCIuLi4gdGhhdCBpcyBub3QKYSBwcmVmaXggd2hpY2ggcmVwbGFjZSBhY3R1YWwgcHJlZml4
LCBidXQganVzdCB3b3JrcyBsaWtlIGFuIGVzY2FwZSBzZXF1ZW5jZS4KVGh1cyB0aGUgbmV4dCBp
bnN0cnVjdGlvbiBjYW4gaGF2ZSBhbnkgeDg2IHByZWZpeCwgY29ycmVjdD8KCklmIHNvLCB0aGlz
IHBhdGNoIGRvZXNuJ3Qgd29yay4gSSBoYXZlIHRvIGFkZCBhIG5ldyBmaWVsZCBpbiBzdHJ1Y3Qg
aW5zbgpsaWtlICJpbnNuLmVtdWxhdGVfcHJlZml4X3NpemUiIHNvIHRoYXQgd2UgY2FuIGtlZXAg
YSByb29tIGZvciB0aGUgcHJlZml4ZXMKZm9yIHJlYWwgaW5zdHJ1Y3Rpb24uCgpUaGFuayB5b3Us
CgoKLS0gCk1hc2FtaSBIaXJhbWF0c3UgPG1oaXJhbWF0QGtlcm5lbC5vcmc+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
