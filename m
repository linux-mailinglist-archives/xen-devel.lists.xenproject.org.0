Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 692AAA1C6F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 16:10:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3L5D-00088r-PQ; Thu, 29 Aug 2019 14:07:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3L5C-00088m-KJ
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 14:07:26 +0000
X-Inumbo-ID: 538437f2-ca66-11e9-ae69-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 538437f2-ca66-11e9-ae69-12813bfff9fa;
 Thu, 29 Aug 2019 14:07:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 41D20B689;
 Thu, 29 Aug 2019 14:07:24 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>
References: <20190816172001.3905-1-paul.durrant@citrix.com>
 <20190816172001.3905-11-paul.durrant@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6eaff8e6-126a-dffe-9051-4e3b31e3e240@suse.com>
Date: Thu, 29 Aug 2019 16:07:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816172001.3905-11-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 10/10] introduce a 'passthrough'
 configuration option to xl.cfg...
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDguMjAxOSAxOToyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLmFuZCBoZW5jZSB0
aGUgYWJpbGl0eSB0byBkaXNhYmxlIElPTU1VIG1hcHBpbmdzLCBhbmQgY29udHJvbCBFUFQKPiBz
aGFyaW5nLgo+IAo+IFRoaXMgcGF0Y2ggaW50cm9kdWNlcyBhIG5ldyAnbGlieGxfcGFzc3Rocm91
Z2gnIGVudW1lcmF0aW9uIGludG8KPiBsaWJ4bF9kb21haW5fY3JlYXRlX2luZm8uIFRoZSB2YWx1
ZSB3aWxsIGJlIHNldCBieSB4bCBlaXRoZXIgd2hlbiBpdCBwYXJzZXMKPiBhIG5ldyAncGFzc3Ro
cm91Z2gnIG9wdGlvbiBpbiB4bC5jZmcsIG9yIGltcGxpY2l0bHkgaWYgdGhlcmUgaXMgcGFzc3Ro
cm91Z2gKPiBoYXJkd2FyZSBzcGVjaWZpZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gSWYgdGhlIHZh
bHVlIG9mIHRoZSBwYXNzdGhyb3VnaCBjb25maWd1cmF0aW9uIG9wdGlvbiBpcyAnZGlzYWJsZWQn
IHRoZW4KPiB0aGUgWEVOX0RPTUNUTF9DREZfaW9tbXUgZmxhZyB3aWxsIGJlIGNsZWFyIGluIHRo
ZSB4ZW5fZG9tY3RsX2NyZWF0ZWRvbWFpbgo+IGZsYWdzLCB0aHVzIGFsbG93aW5nIHRoZSB0b29s
c3RhY2sgdG8gY29udHJvbCB3aGV0aGVyIHRoZSBkb21haW4gZ2V0cwo+IElPTU1VIG1hcHBpbmdz
IG9yIG5vdCAod2hlcmUgcHJldmlvdXNseSB0aGV5IHdlcmUgZ2xvYmFsbHkgc2V0KS4KPiAKPiBJ
ZiB0aGUgdmFsdWUgb2YgdGhlIHBhc3N0aHJvdWdoIGNvbmZpZ3VyYXRpb24gb3B0aW9uIGlzICdz
eW5jX3B0JyB0aGVuCj4gYSBuZXcgJ2lvbW11X29wdHMnIGZpZWxkIGluIHhlbl9kb21jdGxfY3Jl
YXRlZG9tYWluIHdpbGwgYmUgc2V0IHdpdGggdGhlCj4gdmFsdWUgWEVOX0RPTUNUTF9JT01NVV9u
b19zaGFyZXB0LiBUaGlzIHdpbGwgb3ZlcnJpZGUgdGhlIGdsb2JhbCBkZWZhdWx0Cj4gc2V0IGlu
IGlvbW11X2hhcF9wdF9zaGFyZSwgdGh1cyBhbGxvd2luZyB0aGUgdG9vbHN0YWNrIHRvIGNvbnRy
b2wgd2hldGhlcgo+IEVQVCBzaGFyaW5nIGlzIHVzZWQgZm9yIHRoZSBkb21haW4uCj4gCj4gU2ln
bmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CndpdGggYSBxdWVzdGlvbi9z
dWdnZXN0aW9uIGFuZCBhIG5pdDoKCj4gLS0tIGEveGVuL2NvbW1vbi9kb21haW4uYwo+ICsrKyBi
L3hlbi9jb21tb24vZG9tYWluLmMKPiBAQCAtMzA4LDYgKzMwOCwxMyBAQCBzdGF0aWMgaW50IHNh
bml0aXNlX2RvbWFpbl9jb25maWcoc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9tYWluICpjb25m
aWcpCj4gICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gICAgICB9Cj4gIAo+ICsgICAgaWYgKCAh
KGNvbmZpZy0+ZmxhZ3MgJiBYRU5fRE9NQ1RMX0NERl9pb21tdSkgJiYgY29uZmlnLT5pb21tdV9v
cHRzICkKPiArICAgIHsKPiArICAgICAgICBkcHJpbnRrKFhFTkxPR19JTkZPLAo+ICsgICAgICAg
ICAgICAgICAgIklPTU1VIG9wdGlvbnMgc3BlY2lmaWVkIGJ1dCBJT01NVSBub3QgZW5hYmxlZFxu
Iik7Cj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gKyAgICB9CgpTZWVpbmcgdGhpcyBJIHdv
bmRlciB3aGV0aGVyIFhFTl9ET01DVExfQ0RGX2lvbW11IHdvdWxkbid0IGJldHRlciBiZQpiaXQg
MCBvZiBpb21tdV9vcHRzLgoKPiBAQCAtNzAsNiArNzAsMTAgQEAgc3RydWN0IHhlbl9kb21jdGxf
Y3JlYXRlZG9tYWluIHsKPiAgCj4gICAgICB1aW50MzJfdCBmbGFnczsKPiAgCj4gKyNkZWZpbmUg
X1hFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdCAgMAo+ICsjZGVmaW5lIFhFTl9ET01DVExfSU9N
TVVfbm9fc2hhcmVwdCAgICgxVTw8X1hFTl9ET01DVExfSU9NTVVfbm9fc2hhcmVwdCkKClBsZWFz
ZSBjYW4geW91IGFkZCB0aGUgbWlzc2luZyBibGFua3MgYXJvdW5kIDw8ID8KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
