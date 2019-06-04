Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C0434E7C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 19:12:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYCwR-0006Mo-Cm; Tue, 04 Jun 2019 17:09:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cmcs=UD=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hYCwQ-0006Mi-29
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2019 17:09:42 +0000
X-Inumbo-ID: 8a00a31f-86eb-11e9-8980-bc764e045a96
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8a00a31f-86eb-11e9-8980-bc764e045a96;
 Tue, 04 Jun 2019 17:09:40 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A7E092075B;
 Tue,  4 Jun 2019 17:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559668180;
 bh=fRyM2T61kRdWGWrcyGnyYiltJzqC+5tMWNqGs/Nj73Q=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Yi250itP3x0FuDlDLYwbvO0zATOqm2lDEnBxB1dHg50sSUJtHOBvfvCZVeKCapq+s
 XgiLhWx2QG0OMYPIOeC6q4RH9FM0P6xuikbJnsexv0+eAo2+Axzl5yW1ACthItFBXO
 nhILm94IPDLDNQvFTpQSIB/sU9gysKZkJuiqJZfA=
Date: Tue, 4 Jun 2019 10:09:39 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
Message-ID: <alpine.DEB.2.21.1906041000590.14041@sstabellini-ThinkPad-T480s>
References: <osstest-136184-mainreport@xen.org>
 <20190516103727.GB5438@perard.uk.xensource.com>
 <c576ae9d-4a6e-1602-7f05-6fc2c7b26314@arm.com>
 <20190517172344.GE1245@perard.uk.xensource.com>
 <d2ac0071-149e-0c03-016c-d9ad2a423f5e@arm.com>
 <9df7707d-8aa4-2abf-d7c3-0fd101ec3e68@arm.com>
 <20190603171558.GF2126@perard.uk.xensource.com>
 <5CF618900200007800234E5F@prv1-mh.provo.novell.com>
 <5d8eac54-2c4d-3003-4017-0672716d0581@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [qemu-upstream-4.11-testing test] 136184:
 regressions - FAIL
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCA0IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+IE9u
IDYvNC8xOSA4OjA2IEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+ID4gPiA+IE9uIDAzLjA2LjE5
IGF0IDE5OjE1LCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgTWF5IDIxLCAyMDE5IGF0IDA1OjUyOjEyUE0gKzAxMDAsIEp1bGllbiBHcmFsbCB3cm90ZToK
PiA+ID4gPiBUaGUgc2FtZSBlcnJvciBjYW5ub3QgYmUgcmVwcm9kdWNlZCBvbiBsYXh0b24qLiBM
b29raW5nIGF0IHRoZSB0ZXN0Cj4gPiA+ID4gaGlzdG9yeSwKPiA+ID4gPiBpdCBsb29rcyBsaWtl
IHFlbXUtdXBzdHJlYW0tNC4xMi10ZXN0aW5nIGZsaWdodCBoYXMgcnVuIHN1Y2Nlc3NmdWxseSBh
Cj4gPiA+ID4gZmV3Cj4gPiA+ID4gdGltZXMgb24gcm9jaGVzdGVyKi4gU28gd2UgbWF5IGhhdmUg
Zml4ZWQgdGhlIGVycm9yIGluIFhlbiA0LjEyLgo+ID4gPiA+IAo+ID4gPiA+IFBvdGVudGlhbCBj
YW5kaWRhdGVzIHdvdWxkIGJlOgo+ID4gPiA+ICAgICAtIDAwYzk2ZDc3NDIgInhlbi9hcm06IG1t
OiBTZXQtdXAgcGFnZSBwZXJtaXNzaW9uIGZvciBYZW4gbWFwcGluZ3MKPiA+ID4gPiBlYXJsaWVy
IG9uIgo+ID4gPiA+ICAgICAtIGY2MDY1OGM2YWUgInhlbi9hcm06IFN0b3AgcmVsb2NhdGluZyBY
ZW4iCj4gPiA+ID4gCj4gPiA+ID4gSWFuLCBpcyBpdCBzb21ldGhpbmcgdGhlIGJpc2VjdG9yIGNv
dWxkIGF1dG9tYXRpY2FsbHkgbG9vayBhdD8KPiA+ID4gPiBJZiBub3QsIEkgd2lsbCBuZWVkIHRv
IGZpbmQgc29tZSB0aW1lIGFuZCBib3Jyb3cgdGhlIGJvYXJkIHRvIGJpc2VjdCB0aGUKPiA+ID4g
PiBpc3N1ZXMuCj4gPiA+IAo+ID4gPiBJIGF0dGVtcHRlZCB0byBkbyB0aGF0IGJpc2VjdGlvbiBt
eXNlbGYsIGFuZCB0aGUgZmlyc3QgY29tbWl0IHRoYXQgZ2l0Cj4gPiA+IHdhbnRlZCB0byB0cnks
IGEgY29tbW9uIGNvbW1pdCB0byBib3RoIGJyYW5jaGVzLCBib290cyBqdXN0IGZpbmUuCj4gPiAK
PiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyEKPiA+IAo+ID4gT25lIHRoaW5nIHRoYXQsIGZvciBu
b3csIGNvbXBsZXRlbHkgZXNjYXBlcyBtZTogSG93IGNvbWUgdGhlCj4gPiBtYWluIDQuMTEgYnJh
bmNoIGhhcyBwcm9ncmVzc2VkIGZpbmUsIGJ1dCB0aGUgcWVtdXUgb25lIGhhcwo+ID4gZ290IHN0
YWxsZWQgbGlrZSB0aGlzPwo+IAo+IEJlY2F1c2UgWGVuIG9uIEFybSB0b2RheSBkb2VzIG5vdCBm
dWxseSByZXNwZWN0IHRoZSBBcm0gQXJtIHdoZW4gbW9kaWZ5aW5nIHRoZQo+IHBhZ2UtdGFibGVz
LiBUaGlzIG1heSByZXN1bHQgdG8gVExCIGNvbmZsaWN0IGFuZCBicmVhayBvZiBjb2hlcmVuY3ku
CgpZZXMsIEkgZm9sbG93IHlvdXIgcmVhc29uaW5nLCBidXQgaXQgaXMgc3RpbGwgcXVpdGUgc3Ry
YW5nZSB0aGF0IGl0IG9ubHkKaGFwcGVucyB3aXRoIHRoZSBxZW11IHRlc3RpbmcgYnJhbmNoLiBN
YXliZSBpdCBpcyBiZWNhdXNlIGxheHRvbiB3YXMKcGlja2VkIGluc3RlYWQgb2Ygcm9jaGVzdGVy
IHRvIHJ1biB0aGUgdGVzdHMgZm9yIHRoaXMgYnJhbmNoPyBPdGhlcndpc2UsCnRoZXJlIG11c3Qg
YmUgYSBkaWZmZXJlbmNlIGluIHRoZSBYZW4gY29uZmlndXJhdGlvbiBiZXR3ZWVuIHRoZSBub3Jt
YWwKYnJhbmNoIGFuZCB0aGUgcWVtdSB0ZXN0aW5nIGJyYW5jaCwgYXNpZGUgZnJvbSBRRU1VIG9m
IGNvdXJzZSwgdGhhdApzaG91bGRuJ3QgbWFrZSBhbnkgZGlmZmVyZW5jZXMuCgoKPiA+ID4gSXQg
dHVybnMgb3V0IHRoYXQgdGhlIGZpcnN0IGNvbW1pdCB0aGF0IGZhaWxzIHRvIGJvb3Qgb24gcm9j
aGVzdGVyIGlzCj4gPiA+ICAgIGUyMDJmZWI3MTMgeGVuL2NtZGxpbmU6IEZpeCBidWdneSBzdHJu
Y21wKHMsIExJVEVSQUwsIHNzIC0gcykgY29uc3RydWN0Cj4gPiA+IChldmVuIHdpdGggdGhlICJl
YjhhY2JhODJhIHhlbjogRml4IGJhY2twb3J0IG9mIC4uIiBhcHBsaWVkKQo+ID4gCj4gPiBOb3cg
dGhhdCdzIHBhcnRpY3VsYXJseSBvZGQgYSByZWdyZXNzaW9uIGNhbmRpZGF0ZS4gSXQgZG9lc24n
dAo+ID4gdG91Y2ggYW55IEFybSBjb2RlIGF0IGFsbCAobm9yIGRvZXMgdGhlIGZpeHVwIGNvbW1p
dCkuIEFuZCB0aGUKPiA+IGNvbW1vbiBjb2RlIGNoYW5nZXMgZG9uJ3QgbG9vayAicmlza3kiIGVp
dGhlcjsgdGhlIG9uZSB0aGluZyB0aGF0Cj4gPiBqdW1wcyBvdXQgYXMgdGhlIG1vc3QgbGlrZWx5
IG9mIGFsbCB0aGUgdW5saWtlbHkgY2FuZGlkYXRlcyB3b3VsZAo+ID4gc2VlbSB0byBiZSB0aGUg
eGVuL2NvbW1vbi9lZmkvYm9vdC5jIGNoYW5nZSwgYnV0IGlmIHRoZXJlIHdhcwo+ID4gYSBwcm9i
bGVtIHRoZXJlIHRoZW4gdGhlIEVGSSBib290IG9uIEFybSB3b3VsZCBiZSBsYXRlbnRseQo+ID4g
YnJva2VuIGluIG90aGVyIHdheXMgYXMgd2VsbC4gUGx1cywgb2YgY291cnNlLCB5b3Ugc2F5IHRo
YXQgdGhlCj4gPiBzYW1lIGNoYW5nZSBpcyBubyBwcm9ibGVtIG9uIDQuMTIuCj4gPiAKPiA+IE9m
IGNvdXJzZSB0aGUgY29tbWl0IGl0c2VsZiBjb3VsZCBiZSBmdXJ0aGVyICJiaXNlY3RlZCIgLSBh
bGwKPiA+IGNoYW5nZXMgb3RoZXIgdGhhbiB0aGUgaW50cm9kdWN0aW9uIG9mIGNtZGxpbmVfc3Ry
Y21wKCkgYXJlCj4gPiBjb21wbGV0ZWx5IGluZGVwZW5kZW50IG9mIG9uZSBhbm90aGVyLgo+IAo+
IEkgdGhpbmsgdGhpcyBpcyBqdXN0IGEgcmVkLWhlcnJpbmcuIFRoZSBjb21taXQgaXMgcHJvYmFi
bHkgbW9kaWZ5aW5nIGVub3VnaAo+IHRoZSBsYXlvdXQgb2YgWGVuIHRoYXQgVExCIGNvbmZsaWN0
IHdpbGwgYXBwZWFyLgo+IAo+IEFudGhvbnkgc2FpZCBiYWNrcG9ydGluZyAwMGM5NmQ3NzQyICJ4
ZW4vYXJtOiBtbTogU2V0LXVwIHBhZ2UgcGVybWlzc2lvbiBmb3IKPiBYZW4gbWFwcGluZ3MgZWFy
bGllciBvbiIgbWFrZXMgc3RhZ2luZy00LjExIGJvb3RzLiBUaGlzIHBhdGNoIHJlbW92ZXMgc29t
ZSBvZgo+IHRoZSBwb3RlbnRpYWwgY2F1c2Ugb2YgVExCIGNvbmZsaWN0Lgo+IAo+IEkgaGF2ZW4n
dCBzdWdnZXN0ZWQgYSBiYWNrcG9ydCBvZiB0aGlzIHBhdGNoIHNvIGZhciwgYmVjYXVzZSB0aGVy
ZSBhcmUgc3RpbGwKPiBUTEIgY29uZmxpY3QgcG9zc2libGUgd2l0aGluIHRoZSBmdW5jdGlvbiBt
b2RpZmllZC4gSXQgbWlnaHQgYWxzbyBiZSBwb3NzaWJsZQo+IHRoYXQgaXQgZXhwb3NlcyBtb3Jl
IG9mIFRMQiBjb25mbGljdCBhcyBtb3JlIHdvcmsgaW4gWGVuIGlzIG5lZWRlZCAoc2VlIG15Cj4g
TU0tUEFSVG4gc2VyaWVzKS4KPiAKPiBJIGRvbid0IGtub3cgd2hldGhlciBiYWNrcG9ydGluZyB0
aGlzIHBhdGNoIGlzIHdvcnRoIGl0IGNvbXBhcmUgdG8gdGhlIHJpc2sgaXQKPiBpbnRyb2R1Y2Vz
LgoKSSB0aGluayB3ZSBzaG91bGQgYmFja3BvcnQgMDBjOTZkNzc0Mi4gV2UgZG9uJ3QgbmVlZCB0
byBmaXggYWxsIGlzc3VlcywKd2Ugb25seSBuZWVkIHRvIG1ha2UgaW1wcm92ZW1lbnRzIHdpdGhv
dXQgaW50cm9kdWNpbmcgbW9yZSBidWdzLiBGcm9tCnRoYXQgc3RhbmRwb2ludHMsIEkgdGhpbmsg
MDBjOTZkNzc0MiBpcyBkb2FibGUuIEknbGwgYmFja3BvcnQgaXQgbm93IHRvCjQuMTEuIFdoYXQg
YWJvdXQgdGhlIG90aGVyIG9sZGVyIHN0YW5naW5nIGJyYW5jaGVzPwoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
