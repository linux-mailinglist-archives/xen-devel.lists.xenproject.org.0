Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6F879C5B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 00:17:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsDtV-0000m8-65; Mon, 29 Jul 2019 22:13:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hsDtT-0000lz-73
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 22:13:23 +0000
X-Inumbo-ID: 13c818ae-b24e-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13c818ae-b24e-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 22:13:22 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 977522073F;
 Mon, 29 Jul 2019 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564438401;
 bh=SLE/L/icCAPZRxsDFr94D0/b3CNWpbwSO7frLqFgD9E=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Zhld3r8PDrMyNfJ7mxFFdHuuLGyHIfVUVVA6iK5lLdgHRJ3h+JrhCsCIahJGRfsH/
 +SQdeGLTCWcYBQLEIOBALXu9oMlL3W3Qol3vYsnsq1a93DHnaE0oWJZHvjCnjMRd1A
 TRXxk74Uf3uiNIlkquBrL4ruifooSf5SIx81evGk=
Date: Mon, 29 Jul 2019 15:13:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87k1c5hsva.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1907291513140.1237@sstabellini-ThinkPad-T480s>
References: <20190723213553.22300-1-julien.grall@arm.com>
 <20190723213553.22300-7-julien.grall@arm.com> <87k1c5hsva.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 6/7] xen/arm: vsmc: The function identifier
 is always 32-bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNiBKdWwgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gSnVsaWVuIEdy
YWxsIHdyaXRlczoKPiAKPiA+IE9uIEFybTY0LCB0aGUgU01DQ0MgZnVuY3Rpb24gaWRlbnRpZmll
ciBpcyBhbHdheXMgc3RvcmVkIGluIHRoZSBmaXJzdCAzMi1iaXQKPiA+IG9mIHgwIHJlZ2lzdGVy
LiBUaGUgcmVzdCBvZiB0aGUgYml0cyBhcmUgbm90IGRlZmluZWQgYW5kIHNob3VsZCBiZQo+ID4g
aWdub3JlZC4KPiA+Cj4gPiBUaGlzIG1lYW5zIHRoZSB2YXJpYWJsZSBmdW5jaWQgc2hvdWxkIGJl
IGFuIHVpbnQzMl90IHJhdGhlciB0aGFuCj4gPiByZWdpc3Rlcl90Lgo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gUmV2aWV3ZWQtYnk6
IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4KClJldmlld2Vk
LWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cgo+ID4gLS0t
Cj4gPiAgeGVuL2FyY2gvYXJtL3ZzbWMuYyB8IDQgKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS92c21jLmMgYi94ZW4vYXJjaC9hcm0vdnNtYy5jCj4gPiBpbmRleCBmOGUzNTAzMTFk
Li5hMzZkYjE1ZmZmIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL3ZzbWMuYwo+ID4gKysr
IGIveGVuL2FyY2gvYXJtL3ZzbWMuYwo+ID4gQEAgLTIyMCw3ICsyMjAsNyBAQCBzdGF0aWMgYm9v
bCB2c21jY2NfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpCj4gPiAgewo+
ID4gICAgICBib29sIGhhbmRsZWQgPSBmYWxzZTsKPiA+ICAgICAgY29uc3QgdW5pb24gaHNyIGhz
ciA9IHsgLmJpdHMgPSByZWdzLT5oc3IgfTsKPiA+IC0gICAgcmVnaXN0ZXJfdCBmdW5jaWQgPSBn
ZXRfdXNlcl9yZWcocmVncywgMCk7Cj4gPiArICAgIHVpbnQzMl90IGZ1bmNpZCA9IGdldF91c2Vy
X3JlZyhyZWdzLCAwKTsKPiA+ICAKPiA+ICAgICAgLyoKPiA+ICAgICAgICogQ2hlY2sgaW1tZWRp
YXRlIHZhbHVlIGZvciBIVkMzMiwgSFZDNjQgYW5kIFNNQzY0Lgo+ID4gQEAgLTI4Niw3ICsyODYs
NyBAQCBzdGF0aWMgYm9vbCB2c21jY2NfaGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3Mg
KnJlZ3MpCj4gPiAgCj4gPiAgICAgIGlmICggIWhhbmRsZWQgKQo+ID4gICAgICB7Cj4gPiAtICAg
ICAgICBncHJpbnRrKFhFTkxPR19JTkZPLCAiVW5oYW5kbGVkIFNNQy9IVkM6ICUwOCJQUklyZWdp
c3RlciJcbiIsIGZ1bmNpZCk7Cj4gPiArICAgICAgICBncHJpbnRrKFhFTkxPR19JTkZPLCAiVW5o
YW5kbGVkIFNNQy9IVkM6ICUjeFxuIiwgZnVuY2lkKTsKPiA+ICAKPiA+ICAgICAgICAgIC8qIElu
Zm9ybSBjYWxsZXIgdGhhdCBmdW5jdGlvbiBpcyBub3Qgc3VwcG9ydGVkLiAqLwo+ID4gICAgICAg
ICAgc2V0X3VzZXJfcmVnKHJlZ3MsIDAsIEFSTV9TTUNDQ19FUlJfVU5LTk9XTl9GVU5DVElPTik7
Cj4gCj4gCj4gLS0gCj4gVm9sb2R5bXlyIEJhYmNodWsgYXQgRVBBTQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
