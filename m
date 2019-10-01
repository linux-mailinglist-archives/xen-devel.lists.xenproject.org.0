Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAEAC3F7D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 20:10:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFMZV-0005kx-P0; Tue, 01 Oct 2019 18:08:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JHuc=X2=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1iFMZU-0005ks-Rb
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 18:08:24 +0000
X-Inumbo-ID: 7598ee58-e476-11e9-bf31-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by localhost (Halon) with ESMTPS
 id 7598ee58-e476-11e9-bf31-bc764e2007e4;
 Tue, 01 Oct 2019 18:08:24 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4CD5420B7C;
 Tue,  1 Oct 2019 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569953303;
 bh=qpTn8IlYpWG+id5kbXFWIAyDzO5c/4HXNONBtMlybjI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=0z27ugatEVBOFaEu4moOIPlom5Feb0SGJKIO7RfJtYNYRkM+OE4PC8R+y+4WY0gYu
 dMhLWE9DGUJpDJoKkkq/RoElSb+kQUGlvaTgzzgpdn+3RHEugZPF//+4s7MqXoTCyQ
 yzUN9C8xag+q8MshPjTHU3H87vjXtjVo/3v8ebu0=
Date: Tue, 1 Oct 2019 11:08:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <1569507722-16981-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.1910011108040.20899@sstabellini-ThinkPad-T480s>
References: <1569507722-16981-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] SUPPORT.md: Describe Renesas IPMMU-VMSA
 support (Arm)
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
Cc: sstabellini@kernel.org, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, julien.grall@arm.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 volodymyr_babchuk@epam.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAyNiBTZXAgMjAxOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6Cj4gRnJvbTog
T2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgo+IAo+
IFJlbmVzYXMgSVBNTVUtVk1TQSBzdXBwb3J0IChBcm0pIGNhbiBiZSBjb25zaWRlcmVkCj4gYXMg
VGVjaG5vbG9naWNhbCBQcmV2aWV3IGZlYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPgoKQWNrZWQtYnk6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KCgo+IC0tLQo+IFBs
ZWFzZSBub3RlLCBzaG91bGQgb25seSBnbyBpbiBhZnRlcjoKPiBodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMDkvbXNnMDI3MDcuaHRtbAo+
IAo+IENDOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENDOiBH
ZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ0M6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENDOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4g
Q0M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDQzog
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENDOiBUaW0gRGVl
Z2FuIDx0aW1AeGVuLm9yZz4KPiBDQzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiAtLS0KPiAgU1VQ
UE9SVC5tZCB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZm
IC0tZ2l0IGEvU1VQUE9SVC5tZCBiL1NVUFBPUlQubWQKPiBpbmRleCAzNzU0NzNhLi4xMDBhM2Ix
IDEwMDY0NAo+IC0tLSBhL1NVUFBPUlQubWQKPiArKysgYi9TVVBQT1JULm1kCj4gQEAgLTY0LDYg
KzY0LDcgQEAgc3VwcG9ydGVkIGluIHRoaXMgZG9jdW1lbnQuCj4gICAgICBTdGF0dXMsIEludGVs
IFZULWQ6IFN1cHBvcnRlZAo+ICAgICAgU3RhdHVzLCBBUk0gU01NVXYxOiBTdXBwb3J0ZWQKPiAg
ICAgIFN0YXR1cywgQVJNIFNNTVV2MjogU3VwcG9ydGVkCj4gKyAgICBTdGF0dXMsIFJlbmVzYXMg
SVBNTVUtVk1TQTogVGVjaCBQcmV2aWV3Cj4gIAo+ICAjIyMgQVJNL0dJQ3YzIElUUwo+ICAKPiAt
LSAKPiAyLjcuNAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
