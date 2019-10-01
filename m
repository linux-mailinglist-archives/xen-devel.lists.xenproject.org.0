Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5979FC422A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 23:00:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFPBm-0003Ze-IN; Tue, 01 Oct 2019 20:56:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFPBl-0003ZZ-Eh
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 20:56:05 +0000
X-Inumbo-ID: e19aebdb-e48d-11e9-9708-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id e19aebdb-e48d-11e9-9708-12813bfff9fa;
 Tue, 01 Oct 2019 20:56:04 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A53E2215EA;
 Tue,  1 Oct 2019 20:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569963364;
 bh=0W/Nn54lmkVNxiWM49tCV4ebA2P+i0y/fTkHZYbKWwM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yVDPcyCkNE0/msLxu28MDaB+QRz+XYyr7/3iWU03Ck74lMb042s7c1+NwM+Of2ZXC
 YgzvqHSaK1JAOAHdPjbG2QLeeDu1ThZxR6U/yDmHKCevGqb1NluySTtIefdVbVp6RH
 +3dB1s2NcUxokP9DBxbsSdiSZpD/3YKB4DEjT5ZA=
Date: Tue, 1 Oct 2019 13:55:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
In-Reply-To: <87zhiq7yaz.fsf@epam.com>
Message-ID: <alpine.DEB.2.21.1910011355090.20899@sstabellini-ThinkPad-T480s>
References: <20190926183808.11630-1-julien.grall@arm.com>
 <20190926183808.11630-6-julien.grall@arm.com> <87zhiq7yaz.fsf@epam.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RFC for-4.13 05/10] xen/arm: alternative:
 Remove unused parameter for alternative_if_not_cap
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
 Stefano Stabellini <sstabellini@kernel.org>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4gCj4gSnVsaWVu
IEdyYWxsIHdyaXRlczoKPiAKPiA+IFRoZSBtYWNybyBhbHRlcm5hdGl2ZV9pZl9ub3RfY2FwIGlz
IHRha2luZyB0d28gcGFyYW1ldGVycy4gVGhlIHNlY29uZAo+ID4gcGFyYW1ldGVyIGlzIG5ldmVy
IHVzZWQgYW5kIGl0IGlzIGhhcmQgdG8gc2VlIGhvdyB0aGlzIGNhbiBiZSB1c2VkCj4gPiBjb3Jy
ZWN0bHkgYXMgaXQgaXMgb25seSBwcm90ZWN0aW5nIHRoZSBhbHRlcm5hdGl2ZSBzZWN0aW9uIG1h
Z2ljLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+Cj4gUmV2aWV3ZWQtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXIuYmFiY2h1
a0BlcGFtLmNvbT4KCkFja2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+CgoKPiA+IC0tLQo+ID4gIHhlbi9pbmNsdWRlL2FzbS1hcm0vYWx0ZXJuYXRpdmUu
aCB8IDQgKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlv
bnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2
ZS5oIGIveGVuL2luY2x1ZGUvYXNtLWFybS9hbHRlcm5hdGl2ZS5oCj4gPiBpbmRleCBkZWRiNmRk
MDAxLi4yODMwYTZkYTJkIDEwMDY0NAo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLWFybS9hbHRl
cm5hdGl2ZS5oCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL2FsdGVybmF0aXZlLmgKPiA+
IEBAIC0xMTYsMTMgKzExNiwxMSBAQCBpbnQgYXBwbHlfYWx0ZXJuYXRpdmVzKGNvbnN0IHN0cnVj
dCBhbHRfaW5zdHIgKnN0YXJ0LCBjb25zdCBzdHJ1Y3QgYWx0X2luc3RyICplbgo+ID4gICAqIFRo
ZSBjb2RlIHRoYXQgZm9sbG93cyB0aGlzIG1hY3JvIHdpbGwgYmUgYXNzZW1ibGVkIGFuZCBsaW5r
ZWQgYXMKPiA+ICAgKiBub3JtYWwuIFRoZXJlIGFyZSBubyByZXN0cmljdGlvbnMgb24gdGhpcyBj
b2RlLgo+ID4gICAqLwo+ID4gLS5tYWNybyBhbHRlcm5hdGl2ZV9pZl9ub3QgY2FwLCBlbmFibGUg
PSAxCj4gPiAtCS5pZiBcZW5hYmxlCj4gPiArLm1hY3JvIGFsdGVybmF0aXZlX2lmX25vdCBjYXAK
PiA+ICAJLnB1c2hzZWN0aW9uIC5hbHRpbnN0cnVjdGlvbnMsICJhIgo+ID4gIAlhbHRpbnN0cnVj
dGlvbl9lbnRyeSA2NjFmLCA2NjNmLCBcY2FwLCA2NjJmLTY2MWYsIDY2NGYtNjYzZgo+ID4gIAku
cG9wc2VjdGlvbgo+ID4gIDY2MToKPiA+IC0JLmVuZGlmCj4gPiAgLmVuZG0KPiA+ICAKPiA+ICAv
Kgo+IAo+IAo+IC0tIAo+IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
