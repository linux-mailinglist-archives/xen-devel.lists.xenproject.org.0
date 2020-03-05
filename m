Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB15617A238
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 10:27:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9mk2-0005pJ-KW; Thu, 05 Mar 2020 09:24:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9ybd=4W=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9mk1-0005pB-RE
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 09:24:29 +0000
X-Inumbo-ID: 1d0b9e1c-5ec3-11ea-a535-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d0b9e1c-5ec3-11ea-a535-12813bfff9fa;
 Thu, 05 Mar 2020 09:24:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B75E9AC2C;
 Thu,  5 Mar 2020 09:24:27 +0000 (UTC)
To: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-8-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <155c8c7d-df12-5177-45ab-1dd2a6bc9b45@suse.com>
Date: Thu, 5 Mar 2020 10:24:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226113355.2532224-8-anthony.perard@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 07/23] xen/build: Use obj-y +=
 subdir/ instead of subdir-y
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
Cc: Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMjozMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gVGhpcyBpcyBwYXJ0
IG9mIHVwZ3JhZGluZyBvdXIgYnVpbGQgc3lzdGVtIGFuZCBpbXBvcnQgbW9yZSBvZiBMaW51eCdz
Cj4gb25lLgo+IAo+IEluIExpbnV4LCBzdWJkaXIteSBpbiBNYWtlZmlsZXMgaXMgb25seSB1c2Vk
IHRvIGRlc2NlbmQgaW50bwo+IHN1YmRpcmVjdG9yeSB3aGVuIHRoZXJlIGFyZSBubyBvYmplY3Qg
dG8gYnVpbGQsIFhlbiBkb2Vzbid0IGhhdmUgdGhhdAo+IGFuZCBhbGwgc3ViZGlyIGhhdmUgb2Jq
ZWN0IHRvIGJlIGluY2x1ZGVkIGluIHRoZSBmaW5hbCBiaW5hcnkuCj4gCj4gVG8gYWxsb3cgdGhl
IG5ldyBzeW50YXgsIHRoZSAib2JqLXkiIGFuZCAic3ViZGlyLSoiIGNhbGN1bGF0aW9uIGluCj4g
UnVsZXMubWsgaXMgY2hhbmdlZCBhbmQgcGFydGlhbGx5IGltcG9ydGVkIGZyb20gTGludXgncyBL
YnVpbGQuCj4gCj4gVGhlIGNvbW1hbmQgdXNlZCB0byBtb2RpZnkgdGhlIE1ha2VmaWxlIHdhczoK
PiAgICAgc2VkIC1pIC1yICdzI15zdWJkaXItKC4qKSNvYmotXDEvIzsnICoqL01ha2VmaWxlCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYzOgo+ICAgICAtIG5vIG1vcmUgdGFicwo+ICAg
ICAtIHJlc2h1ZmZsZSB2YXJpYWJsZSwgYW5kIHJlbW92ZSBfX3N1YmRpci15Cj4gCj4gIHhlbi9S
dWxlcy5tayAgICAgICAgICAgICAgICAgICAgICAgICB8IDE5ICsrKysrKysrLS0tLS0tLS0tLS0K
PiAgeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKy0tLS0t
LS0KPiAgeGVuL2FyY2gvYXJtL2FybTMyL01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KPiAgeGVu
L2FyY2gvYXJtL2FybTY0L01ha2VmaWxlICAgICAgICAgIHwgIDIgKy0KCkp1bGllbiwgU3RlZmFu
byAtIGFueSBjaGFuY2Ugb2YgZ2V0dGluZyBhbiBhY2sgaGVyZT8KCj4gIHhlbi9hcmNoL3g4Ni9N
YWtlZmlsZSAgICAgICAgICAgICAgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQo+ICB4ZW4vYXJj
aC94ODYvYWNwaS9NYWtlZmlsZSAgICAgICAgICAgfCAgMiArLQo+ICB4ZW4vYXJjaC94ODYvY3B1
L01ha2VmaWxlICAgICAgICAgICAgfCAgNCArKy0tCj4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9NYWtl
ZmlsZSAgICAgICAgICB8ICA0ICsrLS0KPiAgeGVuL2FyY2gveDg2L2h2bS9NYWtlZmlsZSAgICAg
ICAgICAgIHwgIDYgKysrLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9NYWtlZmlsZSAgICAgICAgICAg
ICB8ICA0ICsrLS0KPiAgeGVuL2FyY2gveDg2L3g4Nl82NC9NYWtlZmlsZSAgICAgICAgIHwgIDIg
Ky0KPiAgeGVuL2NvbW1vbi9NYWtlZmlsZSAgICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0t
LQo+ICB4ZW4vZHJpdmVycy9NYWtlZmlsZSAgICAgICAgICAgICAgICAgfCAxNCArKysrKysrLS0t
LS0tLQo+ICB4ZW4vZHJpdmVycy9hY3BpL01ha2VmaWxlICAgICAgICAgICAgfCAgNiArKystLS0K
PiAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvTWFrZWZpbGUgICAgIHwgIDggKysrKy0tLS0KPiAg
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL01ha2VmaWxlIHwgIDIgKy0KCktldmluLCBob3cg
YWJvdXQgdGhpcyBvbmU/Cgo+ICB4ZW4vbGliL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
fCAgMiArLQo+ICB4ZW4veHNtL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+
ICB4ZW4veHNtL2ZsYXNrL01ha2VmaWxlICAgICAgICAgICAgICAgfCAgMiArLQoKRGFuaWVsLCBo
b3cgYWJvdXQgdGhlc2U/CgpJIGd1ZXNzIHRoZSBsYXR0ZXIgdHdvIGFyZSBzbWFsbCBlbm91Z2gg
dG8gc2tpcCBmdXJ0aGVyIHdhaXRpbmcgZm9yCmFja3Mgb25jZSB0aGUgQXJtIG9uZSB3b3VsZCBi
ZSBpbiBwbGFjZS4gR2V0dGluZyB0aGlzIHBhdGNoIGluCndvdWxkIHVuYmxvY2sgYSBmYWlyIHBh
cnQgb2YgdGhlIHJlbWFpbmRlciBvZiB0aGlzIHNlcmllcy4KCkphbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
