Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5594D5EFC
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 11:32:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJwew-0007op-0H; Mon, 14 Oct 2019 09:28:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zFBS=YH=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iJweu-0007ok-N3
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 09:28:56 +0000
X-Inumbo-ID: 0aed634d-ee65-11e9-9375-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 0aed634d-ee65-11e9-9375-12813bfff9fa;
 Mon, 14 Oct 2019 09:28:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F91E337;
 Mon, 14 Oct 2019 02:28:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BACA3F718;
 Mon, 14 Oct 2019 02:28:54 -0700 (PDT)
To: Ian Jackson <ian.jackson@citrix.com>, Oleksandr Grytsov
 <al1img@gmail.com>, Matthew Fioravante <matthew.fioravante@jhuapl.edu>,
 Arianna Avanzini <avanzini.arianna@gmail.com>
References: <20191010135004.24226-1-al1img@gmail.com>
 <23968.40023.163583.784817@mariner.uk.xensource.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <049b184d-530f-5a02-8d85-83cdd2b2c266@arm.com>
Date: Mon, 14 Oct 2019 10:28:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <23968.40023.163583.784817@mariner.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v1] Reset iomem's gfn to
 LIBXL_INVALID_GFN on reboot
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
 "wl@xen.org" <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSWFuLAoKT24gMTEvMTAvMjAxOSAxNjoxNCwgSWFuIEphY2tzb24gd3JvdGU6Cj4gT2xla3Nh
bmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxXSBSZXNldCBpb21lbSdzIGdmbiB0byBMSUJY
TF9JTlZBTElEX0dGTiBvbiByZWJvb3QiKToKPj4gRHVyaW5nIGRvbWFpbiByZWJvb3QgaXRzIGNv
bmZpZ3VyYXRpb24gaXMgcGFydGlhbGx5IHJldXNlZAo+PiB0byByZS1jcmVhdGUgYSBuZXcgZG9t
YWluLCBidXQgaW9tZW0ncyBHRk4gZmllbGQgZm9yIHRoZQo+PiBpb21lbSBpcyBvbmx5IHJlc3Rv
cmVkIGZvciB0aG9zZSBtZW1vcnkgcmFuZ2VzLCB3aGljaCBhcmUKPj4gY29uZmlndXJlZCBpbiBm
b3JtIG9mIFtJT01FTV9TVEFSVCxOVU1fUEFHRVNbQEdGTl0sIGJ1dCBub3QgZm9yCj4+IHRob3Nl
IGluIGZvcm0gb2YgW0lPTUVNX1NUQVJULE5VTV9QQUdFU10sIGUuZy4gd2l0aG91dCBHRk4uCj4+
IEZvciB0aGUgbGF0dGVyIEdGTiBpcyByZXNldCB0byAwLCBidXQgd2hpbGUgbWFwcGluZyByYW5n
ZXMKPj4gdG8gYSBkb21haW4gZHVyaW5nIHJlYm9vdCB0aGVyZSBpcyBhIGNoZWNrIHRoYXQgR0ZO
IHRyZWF0ZWQKPj4gYXMgdmFsaWQgaWYgaXQgaXMgbm90IGVxdWFsIHRvIExJQlhMX0lOVkFMSURf
R0ZOLCB0aHVzIG1ha2luZwo+PiBYZW4gdG8gbWFwIElPTUVNX1NUQVJUIHRvIGFkZHJlc3MgMCBp
biB0aGUgZ3Vlc3QncyBhZGRyZXNzIHNwYWNlLgo+Pgo+PiBXb3JrYXJvdW5kIGl0IGJ5IHJlc3Nl
dGluZyBHRk4gdG8gTElCWExfSU5WQUxJRF9HRk4sIHNvIHhsCj4+IGNhbiBzZXQgcHJvcGVyIHZh
bHVlcyBmb3IgbWFwcGluZyBvbiByZWJvb3QuCj4gCj4gVGhhbmtzIGZvciB0aGlzIHBhdGNoLgo+
IAo+IEkgY29uZmVzcyB0aGF0IEkgYW0gbm90IHN1cmUgd2hhdCBpcyBnb2luZyBvbiBoZXJlLiAg
V2hlcmUgaXMgdGhpcwo+IHRyb3VibGVzb21lIDAgY29taW5nIGZyb20gPyAgSSBzZWUgdGhhdCB0
aGUgZGVmYXVsdCB2YWx1ZSBmb3IgZ2ZuIGluCj4gdGhlIHN0cnVjdCBpcyAwIGFuZCBsb29raW5n
IGZvciBhc3NpZ25tZW50cyBiZWZvcmUgdGhpcyBwYXRjaCwgZ2ZuIGlzCj4gZGVmYXVsdGVkIGZy
b20gYl9pbmZvLT5pb21lbVtpXS5zdGFydCwgd2hpY2ggaXMgcHJlc3VtYWJseSBub24tMC4KPiAK
PiBJIHN1c3BlY3QgdGhhdCB5b3VyIHBhdGNoIG1heSBiZSBmaXhpbmcgdGhpcyB0aGUgd3Jvbmcg
d2F5LiAgSSBoYXZlCj4gYWRkcmVzc2VkIHRoaXMgbWFpbCB0byB2YXJpb3VzIHBlb3BsZSB3aG8g
aGF2ZSB0b3VjaGVkIHRoaXMgYXJlYSBvZgo+IGNvZGUgYW5kIGhvcGUgdGhleSB3aWxsIGJlIGFi
bGUgdG8gY2xhcmlmeS4KCkkgZm91bmQgYSB0aHJlYWQgZnJvbSBEZWNlbWJlciAyMDE3IHJlbGF0
ZWQgdG8gdGhlIHByb2JsZW0gZGVzY3JpYmVkIGhlcmUgWzFdLgoKTG9va2luZyBhdCB0aGUgdGhy
ZWFkLCB0aGVyZSB3ZXJlIG5vIGNvbmNsdXNpb24gb24gdGhlIHJvb3QgY2F1c2VzIGFuZCBzb21l
IApxdWVzdGlvbnMgd2VyZSBsZWZ0IHVuYW5zd2VyZWQgYnkgdGhlIGNvbnRyaWJ1dG9yIChzZWUg
WzJdKS4KCk9sZWtzYW5kciwgY291bGQgeW91IGxvb2sgYXQgdGhlIHRocmVhZCBhbmQgc2VlIGlm
IHlvdSBjYW4gcHJvdmlkZSBtb3JlIGRldGFpbHMgCndoYXQncyBnb2luZyBvbj8gQW5zd2VyaW5n
IGJhY2sgaGVyZSB3b3VsZCBiZSBmaW5lLgoKPiAKPiBCVFcsIHBsZWFzZSBkbyBwaW5nIHRoaXMg
KGFuZCB5b3VyIG90aGVyIHBhdGNoZXMpIGJ5IGVtYWlsLCBpZiB0aGUKPiBjb252ZXJzYXRpb24g
c2VlbXMgdG8gc3RhbGwuCj4gCj4gVGhhbmtzLAo+IElhbi4KPiAKPj4gU2lnbmVkLW9mZi1ieTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pgo+PiAtLS0KPj4gICB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDkgKysrKysrKysrCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvdG9v
bHMvbGlieGwvbGlieGxfZG9tYWluLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+PiBp
bmRleCA5ZDBlYjVhZWQxLi4wYWUxNmE1YjEyIDEwMDY0NAo+PiAtLS0gYS90b29scy9saWJ4bC9s
aWJ4bF9kb21haW4uYwo+PiArKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+PiBAQCAt
MjEyMCw2ICsyMTIwLDE1IEBAIHN0YXRpYyB2b2lkIHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0
aW9uX2VuZChsaWJ4bF9fZWdjICplZ2MsCj4+ICAgICAgICAgICB9Cj4+ICAgICAgIH0KPj4gICAK
Pj4gKyAgICAvKiByZXNldCBJT01FTSdzIEdGTiB0byBpbml0aWFsIHZhbHVlICovCj4+ICsgICAg
ewo+PiArICAgICAgICBpbnQgaTsKPj4gKwo+PiArICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZF9j
b25maWctPmJfaW5mby5udW1faW9tZW07IGkrKykKPj4gKyAgICAgICAgICAgIGlmIChkX2NvbmZp
Zy0+Yl9pbmZvLmlvbWVtW2ldLmdmbiA9PSAwKQo+PiArICAgICAgICAgICAgICAgIGRfY29uZmln
LT5iX2luZm8uaW9tZW1baV0uZ2ZuID0gTElCWExfSU5WQUxJRF9HRk47Cj4+ICsgICAgfQo+PiAr
Cj4+ICAgICAgIC8qIERldmljZXM6IGRpc2ssIG5pYywgdnRwbSwgcGNpZGV2IGV0Yy4gKi8KPj4g
ICAKPj4gICAgICAgLyogVGhlIE1FUkdFIG1hY3JvIGltcGxlbWVudHMgZm9sbG93aW5nIGxvZ2lj
Ogo+PiAtLSAKPj4gMi4xNy4xCj4+CgpDaGVlcnMsCgpbMV0gPGViZjc4YWVjLWRjZmQtNzJkOS1k
YWMyLTA2YjI5ZTRhNjZhZUBnbWFpbC5jb20+ClsyXSA8MjAxODAyMTMxMjI0MzIuaDRmaDIyZWo0
ZGZlNzIyNkBjaXRyaXguY29tPgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
