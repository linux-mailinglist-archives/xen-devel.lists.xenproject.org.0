Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA17BF370F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 19:25:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSmQN-00076C-LS; Thu, 07 Nov 2019 18:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=w0jr=Y7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iSmQL-000767-OQ
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 18:22:25 +0000
X-Inumbo-ID: 8bc6b779-018b-11ea-a1ca-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8bc6b779-018b-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 18:22:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE8D6214D8;
 Thu,  7 Nov 2019 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573150944;
 bh=cRi9Qo20T2tZYGz+6H1pogLJL9F1hmz8UORFwrEcS6I=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Nd0hACTxYkMDww0i+QQDNRNfzAFKAsgiHXqn0iTz/9Q6YqRELQsvkFe5QiGMCr7tH
 ZbMRDXggjIvuzh1KE3TeJt7Es9EZrByclqSPSQMkQgGUI3w/9htxt5/OvWR/2wzWPf
 3GKMiBoG98TAO0UqvlUb/KSpIRMBpkier0oIqSsg=
Date: Thu, 7 Nov 2019 10:22:23 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Liu <wl@xen.org>
In-Reply-To: <20191107154602.cpjynpzr3h6gqjhk@debian>
Message-ID: <alpine.DEB.2.21.1911071020540.22775@sstabellini-ThinkPad-T480s>
References: <20191105235113.27469-1-sstabellini@kernel.org>
 <20191106104521.xm32dkkcj7a3d3ru@debian>
 <alpine.DEB.2.21.1911060809060.11262@sstabellini-ThinkPad-T480s>
 <20191107154602.cpjynpzr3h6gqjhk@debian>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] tools: pygrub actually cross-compiles just
 fine
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, ian.jackson@eu.citrix.com,
 Christopher Clark <christopher.w.clark@gmail.com>, anthony.perard@citrix.com,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCA3IE5vdiAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+IE9uIFdlZCwgTm92IDA2LCAyMDE5
IGF0IDA4OjEwOjQ3QU0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiA+IE9uIFdl
ZCwgNiBOb3YgMjAxOSwgV2VpIExpdSB3cm90ZToKPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMTkg
YXQgMDM6NTE6MTNQTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+ID4gPiA+IEFj
dHVhbGx5LCBweWdydWIgY3Jvc3MtY29tcGlsZXMgd2l0aG91dCBpc3N1ZXMuIFRoZSBjcm9zcy1j
b21waWxhdGlvbgo+ID4gPiA+IHdvcmstYXJvdW5kIGdvZXMgYmFjayB0byAyMDA1IGFuZCBpdCBw
cm9iYWJseSByZWZlcnJlZCB0byBQb3dlclBDLgo+ID4gPiA+IAo+ID4gPiA+IFJlbW92ZSB0aGUg
d29yay1hcm91bmQgbm93Lgo+ID4gPiA+IAo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0ZWZhbm8g
U3RhYmVsbGluaSA8c3RlZmFuby5zdGFiZWxsaW5pQHhpbGlueC5jb20+Cj4gPiA+ID4gQ0M6IENo
cmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci53LmNsYXJrQGdtYWlsLmNvbT4KPiA+ID4gCj4g
PiA+IFByZXN1bWFibHkgeW91IHRyaWVkIHRvIGNyb3NzLWNvbXBpbGUgaXQgZm9yIEFybT8gSXQg
d291bGQgYmUgZ29vZCB0bwo+ID4gPiBtZW50aW9uIHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdl
Lgo+ID4gPiAKPiA+ID4gSSB0aGluayB0aGUgY29udGVudCBvZiB0aGlzIHBhdGNoIGlzIGZpbmU6
Cj4gPiAKPiA+IEl0IGNyb3NzLWNvbXBpbGVzIGZpbmUgZm9yIGFhcmNoNjQgb24geDg2XzY0IHdp
dGggWW9jdG8uICBBbHRob3VnaCB3ZQo+ID4gZG9uJ3QgZG8gYW55IGNyb3NzLWNvbXBpbGF0aW9u
cyBpbiBPU1NUZXN0IGFzIGZhciBhcyBJIGtub3csIHNvIGFwcGx5aW5nCj4gPiB0aGUgcGF0Y2gg
d29uJ3QgYnJlYWsgT1NTVGVzdCwgZ2l2ZW4gdGhlIHN0YXRlIG9mIHRoZSByZWxlYXNlLCBJIHRo
aW5rCj4gPiBpdCB3b3VsZCBiZSBiZXN0IHRvIHdhaXQgZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRv
dy4KPiAKPiBUaGF0J3Mgb2YgY291cnNlIGZpbmUgYnkgbWUuCgpJJ2xsIHJlc2VuZCB0aGUgcGF0
Y2ggd2l0aCBhIGJldHRlciBjb21taXQgbWVzc2FnZS4gSXQgd291bGQgYmUgZ29vZCB0bwpnZXQg
YW4gYWNrIGlmIHlvdSBhcmUgT0sgd2l0aCBpdCAob2YgY291cnNlIHRoZXJlIHdpbGwgYmUgbm8g
Y29tbWl0dGluZwppdCByaWdodCBub3cuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
