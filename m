Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D94A56785
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2019 13:24:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hg5yJ-0003n5-LX; Wed, 26 Jun 2019 11:20:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cvzu=UZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hg5yI-0003n0-8W
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2019 11:20:14 +0000
X-Inumbo-ID: 5b26f9e8-9804-11e9-ab78-f32f0667a8e0
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5b26f9e8-9804-11e9-ab78-f32f0667a8e0;
 Wed, 26 Jun 2019 11:20:08 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66BD2360;
 Wed, 26 Jun 2019 04:20:08 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2A2A3F718;
 Wed, 26 Jun 2019 04:20:07 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190610193215.23704-1-julien.grall@arm.com>
 <20190610193215.23704-11-julien.grall@arm.com>
 <alpine.DEB.2.21.1906251802510.5851@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5c273d41-2b40-70fe-6551-54132912e1ee@arm.com>
Date: Wed, 26 Jun 2019 12:20:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906251802510.5851@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 10/17] xen/arm64: head: Improve coding style
 and document create_pages_tables()
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
Cc: xen-devel@lists.xenproject.org, Oleksandr_Tyshchenko@epam.com,
 andrii_anisov@epam.com, andre.przywara@arm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDI2LzA2LzIwMTkgMDI6MDMsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBNb24sIDEwIEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEFkanVzdCB0
aGUgY29kaW5nIHN0eWxlIHVzZWQgaW4gdGhlIGNvbW1lbnRzIHdpdGhpbiBjcmVhdGVfcGFnZXNf
dGFibGVzKCkKPj4KPj4gTGFzdGx5LCBkb2N1bWVudCB0aGUgYmVoYXZpb3IgYW5kIHRoZSBtYWlu
IHJlZ2lzdGVycyB1c2FnZSB3aXRoaW4gdGhlCj4+IGZ1bmN0aW9uLiBOb3RlIHRoYXQgeDI1IGlz
IG5vdyBvbmx5IHVzZWQgd2l0aGluIHRoZSBmdW5jdGlvbiwgc28gaXQgZG9lcwo+PiBub3QgbmVl
ZCB0byBiZSBwYXJ0IG9mIHRoZSBjb21tb24gcmVnaXN0ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4+IC0tLQo+PiAgIHhlbi9hcmNo
L2FybS9hcm02NC9oZWFkLlMgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUyBiL3hlbi9hcmNoL2Fy
bS9hcm02NC9oZWFkLlMKPj4gaW5kZXggZWUwMDI0MTczZS4uN2I5MmMxYzhlYiAxMDA2NDQKPj4g
LS0tIGEveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+PiArKysgYi94ZW4vYXJjaC9hcm0vYXJt
NjQvaGVhZC5TCj4+IEBAIC03MCw3ICs3MCw3IEBACj4+ICAgICogIHgyMiAtIGlzX3NlY29uZGFy
eV9jcHUKPj4gICAgKiAgeDIzIC0gVUFSVCBhZGRyZXNzCj4+ICAgICogIHgyNCAtCj4+IC0gKiAg
eDI1IC0gaWRlbnRpdHkgbWFwIGluIHBsYWNlCj4+ICsgKiAgeDI1IC0KPj4gICAgKiAgeDI2IC0g
c2tpcF96ZXJvX2JzcyAoYm9vdCBjcHUgb25seSkKPj4gICAgKiAgeDI3IC0KPj4gICAgKiAgeDI4
IC0KPj4gQEAgLTQ0MywxNiArNDQzLDI3IEBAIGNwdV9pbml0Ogo+PiAgICAgICAgICAgcmV0Cj4+
ICAgRU5EUFJPQyhjcHVfaW5pdCkKPj4gICAKPj4gKy8qCj4+ICsgKiBSZWJ1aWxkIHRoZSBib290
IHBhZ2V0YWJsZSdzIGZpcnN0LWxldmVsIGVudHJpZXMuIFRoZSBzdHJ1Y3R1cmUKPj4gKyAqIGlz
IGRlc2NyaWJlZCBpbiBtbS5jLgo+PiArICoKPj4gKyAqIEFmdGVyIHRoZSBDUFUgZW5hYmxlcyBw
YWdpbmcgaXQgd2lsbCBhZGQgdGhlIGZpeG1hcCBtYXBwaW5nCj4+ICsgKiB0byB0aGVzZSBwYWdl
IHRhYmxlcywgaG93ZXZlciB0aGlzIG1heSBjbGFzaCB3aXRoIHRoZSAxOjEKPj4gKyAqIG1hcHBp
bmcuIFNvIGVhY2ggQ1BVIG11c3QgcmVidWlsZCB0aGUgcGFnZSB0YWJsZXMgaGVyZSB3aXRoCj4+
ICsgKiB0aGUgMToxIGluIHBsYWNlLgo+PiArICoKPj4gKyAqIElucHV0czoKPj4gKyAqICAgeDE5
OiBwYWRkcihzdGFydCkKPj4gKyAqICAgeDIwOiBwaHlzIG9mZnNldAo+IAo+IElzIHgyMCBhY3R1
YWxseSB1c2VkPwoKWWVzIHZpYSB0aGUgbWFjcm8gbG9hZF9wYWRkci4KCj4gCj4gVGhlIHJlc3Qg
bG9va3MgZmluZS4KPiAKPiAKPj4gKyAqIENsb2JiZXJzIHgwIC0geDQsIHgyNQo+PiArICoKPj4g
KyAqIFJlZ2lzdGVyIHVzYWdlIHdpdGhpbiB0aGlzIGZ1bmN0aW9uOgo+PiArICogICB4MjU6IElk
ZW50aXR5IG1hcCBpbiBwbGFjZQo+PiArICovCj4+ICAgY3JlYXRlX3BhZ2VfdGFibGVzOgo+PiAt
ICAgICAgICAvKiBSZWJ1aWxkIHRoZSBib290IHBhZ2V0YWJsZSdzIGZpcnN0LWxldmVsIGVudHJp
ZXMuIFRoZSBzdHJ1Y3R1cmUKPj4gLSAgICAgICAgICogaXMgZGVzY3JpYmVkIGluIG1tLmMuCj4+
IC0gICAgICAgICAqCj4+IC0gICAgICAgICAqIEFmdGVyIHRoZSBDUFUgZW5hYmxlcyBwYWdpbmcg
aXQgd2lsbCBhZGQgdGhlIGZpeG1hcCBtYXBwaW5nCj4+IC0gICAgICAgICAqIHRvIHRoZXNlIHBh
Z2UgdGFibGVzLCBob3dldmVyIHRoaXMgbWF5IGNsYXNoIHdpdGggdGhlIDE6MQo+PiAtICAgICAg
ICAgKiBtYXBwaW5nLiBTbyBlYWNoIENQVSBtdXN0IHJlYnVpbGQgdGhlIHBhZ2UgdGFibGVzIGhl
cmUgd2l0aAo+PiAtICAgICAgICAgKiB0aGUgMToxIGluIHBsYWNlLiAqLwo+PiAtCj4+IC0gICAg
ICAgIC8qIElmIFhlbiBpcyBsb2FkZWQgYXQgZXhhY3RseSBYRU5fVklSVF9TVEFSVCB0aGVuIHdl
IGRvbid0Cj4+ICsgICAgICAgIC8qCj4+ICsgICAgICAgICAqIElmIFhlbiBpcyBsb2FkZWQgYXQg
ZXhhY3RseSBYRU5fVklSVF9TVEFSVCB0aGVuIHdlIGRvbid0Cj4+ICAgICAgICAgICAgKiBuZWVk
IGFuIGFkZGl0aW9uYWwgMToxIG1hcHBpbmcsIHRoZSB2aXJ0dWFsIG1hcHBpbmcgd2lsbAo+PiAg
ICAgICAgICAgICogc3VmZmljZS4KPj4gICAgICAgICAgICAqLwo+PiBAQCAtNDc2LDcgKzQ4Nyw4
IEBAIGNyZWF0ZV9wYWdlX3RhYmxlczoKPj4gICAgICAgICAgIGNieiAgIHgxLCAxZiAgICAgICAg
ICAgICAgICAgLyogSXQncyBpbiBzbG90IDAsIG1hcCBpbiBib290X2ZpcnN0Cj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG9yIGJvb3Rfc2Vjb25kIGxhdGVyIG9u
ICovCj4+ICAgCj4+IC0gICAgICAgIC8qIExldmVsIHplcm8gZG9lcyBub3Qgc3VwcG9ydCBzdXBl
cnBhZ2UgbWFwcGluZ3MsIHNvIHdlIGhhdmUKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICog
TGV2ZWwgemVybyBkb2VzIG5vdCBzdXBwb3J0IHN1cGVycGFnZSBtYXBwaW5ncywgc28gd2UgaGF2
ZQo+PiAgICAgICAgICAgICogdG8gdXNlIGFuIGV4dHJhIGZpcnN0IGxldmVsIHBhZ2UgaW4gd2hp
Y2ggd2UgY3JlYXRlIGEgMUdCIG1hcHBpbmcuCj4+ICAgICAgICAgICAgKi8KPj4gICAgICAgICAg
IGxvYWRfcGFkZHIgeDIsIGJvb3RfZmlyc3RfaWQKPj4gLS0gCj4+IDIuMTEuMAo+PgoKQ2hlZXJz
LAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
