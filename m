Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DCD18B1A5
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 11:41:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEsZU-0003a2-EF; Thu, 19 Mar 2020 10:38:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f9wY=5E=suse.cz=mbenes@srs-us1.protection.inumbo.net>)
 id 1jEsZS-0003Zx-7o
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 10:38:38 +0000
X-Inumbo-ID: c91b0bb1-69cd-11ea-bbe1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c91b0bb1-69cd-11ea-bbe1-12813bfff9fa;
 Thu, 19 Mar 2020 10:38:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94E11B1D1;
 Thu, 19 Mar 2020 10:38:35 +0000 (UTC)
Date: Thu, 19 Mar 2020 11:38:34 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2ca0a03c-734c-3a9e-90fd-8209046c5f01@suse.com>
Message-ID: <alpine.LSU.2.21.2003191131280.24428@pobox.suse.cz>
References: <20200319095606.23627-1-mbenes@suse.cz>
 <20200319095606.23627-3-mbenes@suse.cz>
 <2ca0a03c-734c-3a9e-90fd-8209046c5f01@suse.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/xen: Make the secondary CPU idle
 tasks reliable
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
Cc: jgross@suse.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 andrew.cooper3@citrix.com, jpoimboe@redhat.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 live-patching@vger.kernel.org, boris.ostrovsky@oracle.com, jslaby@suse.cz,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxOSBNYXIgMjAyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cgo+IE9uIDE5LjAzLjIwMjAg
MTA6NTYsIE1pcm9zbGF2IEJlbmVzIHdyb3RlOgo+ID4gLS0tIGEvYXJjaC94ODYveGVuL3NtcF9w
di5jCj4gPiArKysgYi9hcmNoL3g4Ni94ZW4vc21wX3B2LmMKPiA+IEBAIC01Myw2ICs1Myw3IEBA
IHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgeGVuX2NvbW1vbl9pcnEsIHhlbl9pcnFfd29y
aykgPSB7IC5pcnEgPSAtMSB9Owo+ID4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgeGVu
X2NvbW1vbl9pcnEsIHhlbl9wbXVfaXJxKSA9IHsgLmlycSA9IC0xIH07Cj4gPiAgCj4gPiAgc3Rh
dGljIGlycXJldHVybl90IHhlbl9pcnFfd29ya19pbnRlcnJ1cHQoaW50IGlycSwgdm9pZCAqZGV2
X2lkKTsKPiA+ICtleHRlcm4gdW5zaWduZWQgY2hhciBhc21fY3B1X2JyaW5ndXBfYW5kX2lkbGVb
XTsKPiAKPiBJbW8gdGhpcyB3b3VsZCBiZXR0ZXIgcmVmbGVjdCB0aGUgYWN0dWFsIHR5cGUsIGku
ZS4gYmUgYSBmdW5jdGlvbgo+IGRlY2wuIElmIGxlZnQgYXMgYW4gYXJyYXkgb25lLCBJIGd1ZXNz
IHlvdSBtYXkgd2FudCB0byBhZGQgY29uc3QuCgpJIHN0aWNrZWQgdG8gd2hhdCB4ODYgaGFzIGZv
ciBzZWNvbmRhcnlfc3RhcnR1cF82NC4gSSBjYW4gbWFrZSBpdAoKdm9pZCBhc21fY3B1X2JyaW5n
dXBfYW5kX2lkbGUodm9pZCk7CgpNaXJvc2xhdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
