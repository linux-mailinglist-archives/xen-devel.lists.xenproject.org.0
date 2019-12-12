Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8C111C5DB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 07:10:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifHd9-0000Dr-W9; Thu, 12 Dec 2019 06:07:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Y65U=2C=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifHd8-0000Dm-4Q
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 06:07:18 +0000
X-Inumbo-ID: a0d03948-1ca5-11ea-88e7-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0d03948-1ca5-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 06:07:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CAD5EB2C2;
 Thu, 12 Dec 2019 06:07:07 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191211152956.5168-1-pdurrant@amazon.com>
 <20191211152956.5168-5-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d3c61bd0-c29f-bb73-f637-158c7541a5f3@suse.com>
Date: Thu, 12 Dec 2019 07:07:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211152956.5168-5-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 4/4] xen-blkback: support dynamic
 unbind/bind
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
Cc: Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTY6MjksIFBhdWwgRHVycmFudCB3cm90ZToKPiBCeSBzaW1wbHkgcmUtYXR0
YWNoaW5nIHRvIHNoYXJlZCByaW5ncyBkdXJpbmcgY29ubmVjdF9yaW5nKCkgcmF0aGVyIHRoYW4K
PiBhc3N1bWluZyB0aGV5IGFyZSBmcmVzaGx5IGFsbG9jYXRlZCAoaS5lIGFzc3VtaW5nIHRoZSBj
b3VudGVycyBhcmUgemVybykKPiBpdCBpcyBwb3NzaWJsZSBmb3IgdmJkIGluc3RhbmNlcyB0byBi
ZSB1bmJvdW5kIGFuZCByZS1ib3VuZCBmcm9tIGFuZCB0bwo+IChyZXNwZWN0aXZlbHkpIGEgcnVu
bmluZyBndWVzdC4KPiAKPiBUaGlzIGhhcyBiZWVuIHRlc3RlZCBieSBydW5uaW5nOgo+IAo+IHdo
aWxlIHRydWU7Cj4gICAgZG8gZmlvIC0tbmFtZT1yYW5kd3JpdGUgLS1pb2VuZ2luZT1saWJhaW8g
LS1pb2RlcHRoPTE2IFwKPiAgICAtLXJ3PXJhbmR3cml0ZSAtLWJzPTRrIC0tZGlyZWN0PTEgLS1z
aXplPTFHIC0tdmVyaWZ5PWNyYzMyOwo+ICAgIGRvbmUKPiAKPiBpbiBhIFBWIGd1ZXN0IHdoaWxz
dCBydW5uaW5nOgo+IAo+IHdoaWxlIHRydWU7Cj4gICAgZG8gZWNobyB2YmQtJERPTUlELSRWQkQg
PnVuYmluZDsKPiAgICBlY2hvIHVuYm91bmQ7Cj4gICAgc2xlZXAgNTsKPiAgICBlY2hvIHZiZC0k
RE9NSUQtJFZCRCA+YmluZDsKPiAgICBlY2hvIGJvdW5kOwo+ICAgIHNsZWVwIDM7Cj4gICAgZG9u
ZQo+IAo+IGluIGRvbTAgZnJvbSAvc3lzL2J1cy94ZW4tYmFja2VuZC9kcml2ZXJzL3ZiZCB0byBj
b250aW51b3VzbHkgdW5iaW5kIGFuZAo+IHJlLWJpbmQgaXRzIHN5c3RlbSBkaXNrIGltYWdlLgo+
IAo+IFRoaXMgaXMgYSBoaWdobHkgdXNlZnVsIGZlYXR1cmUgZm9yIGEgYmFja2VuZCBtb2R1bGUg
YXMgaXQgYWxsb3dzIGl0IHRvIGJlCj4gdW5sb2FkZWQgYW5kIHJlLWxvYWRlZCAoaS5lLiB1cGRh
dGVkKSB3aXRob3V0IHJlcXVpcmluZyBkb21VcyB0byBiZSBoYWx0ZWQuCj4gVGhpcyB3YXMgYWxz
byB0ZXN0ZWQgYnkgcnVubmluZzoKPiAKPiB3aGlsZSB0cnVlOwo+ICAgIGRvIGVjaG8gdmJkLSRE
T01JRC0kVkJEID51bmJpbmQ7Cj4gICAgZWNobyB1bmJvdW5kOwo+ICAgIHNsZWVwIDU7Cj4gICAg
cm1tb2QgeGVuLWJsa2JhY2s7Cj4gICAgZWNobyB1bmxvYWRlZDsKPiAgICBzbGVlcCAxOwo+ICAg
IG1vZHByb2JlIHhlbi1ibGtiYWNrOwo+ICAgIGVjaG8gYm91bmQ7Cj4gICAgY2QgJChwd2QpOwo+
ICAgIHNsZWVwIDM7Cj4gICAgZG9uZQo+IAo+IGluIGRvbTAgd2hpbHN0IHJ1bm5pbmcgdGhlIHNh
bWUgbG9vcCBhcyBhYm92ZSBpbiB0aGUgKHNpbmdsZSkgUFYgZ3Vlc3QuCj4gCj4gU29tZSAobGVz
cyBzdHJlc3NmdWwpIHRlc3RpbmcgaGFzIGFsc28gYmVlbiBkb25lIHVzaW5nIGEgV2luZG93cyBI
Vk0gZ3Vlc3QKPiB3aXRoIHRoZSBsYXRlc3QgOS4wIFBWIGRyaXZlcnMgaW5zdGFsbGVkLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClJldmll
d2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
