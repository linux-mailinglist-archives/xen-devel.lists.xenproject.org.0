Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED51458DC
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:37:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuI28-0005jJ-CG; Wed, 22 Jan 2020 15:35:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuI26-0005jE-84
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:35:06 +0000
X-Inumbo-ID: c33053fe-3d2c-11ea-bc87-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c33053fe-3d2c-11ea-bc87-12813bfff9fa;
 Wed, 22 Jan 2020 15:35:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 64086AAB0;
 Wed, 22 Jan 2020 15:35:04 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <1ccb1524a08c3db2f59b7dae4d8377e1c98903c9.1579628566.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <52f14300-8ebe-d7c3-5f54-4084c631034b@suse.com>
Date: Wed, 22 Jan 2020 16:35:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1ccb1524a08c3db2f59b7dae4d8377e1c98903c9.1579628566.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 14/18] x86/mem_sharing: use
 default_access in add_to_physmap
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFdoZW4gcGx1Z2dp
bmcgYSBob2xlIGluIHRoZSB0YXJnZXQgcGh5c21hcCBkb24ndCB1c2UgdGhlIGFjY2VzcyBwZXJt
aXNzaW9uCj4gcmV0dXJuZWQgYnkgX19nZXRfZ2ZuX3R5cGVfYWNjZXNzIGFzIGl0IGNhbiBiZSBu
b24tc2Vuc2ljYWwsCgoiY2FuIGJlIiBpcyB0b28gdmFndWUgZm9yIG15IHRhc3RlIC0gaXQgc3Vn
Z2VzdHMgdGhlcmUgbWF5IGFsc28gYmUgY2FzZXMKd2hlcmUgYSBzZW5zaWJsZSB2YWx1ZSBpcyBy
ZXR1cm5lZCwgYW5kIGhlbmNlIGl0IHNob3VsZCBiZSB1c2VkLiBDb3VsZAp5b3UgY2xhcmlmeSB0
aGlzIHBsZWFzZT8gKFRoZSBjb2RlIGNoYW5nZSBpdHNlbGYgb2YgY291cnNlIGlzIHNpbXBsZSBh
bmQKbWVjaGFuaWNhbCBlbm91Z2ggdG8gbG9vayBva2F5LikKCkphbgoKPiBsZWFkaW5nIHRvCj4g
c3B1cmlvdXMgdm1fZXZlbnRzIGJlaW5nIHNlbnQgb3V0IGZvciBhY2Nlc3MgdmlvbGF0aW9ucyBh
dCB1bmV4cGVjdGVkCj4gbG9jYXRpb25zLiBNYWtlIHVzZSBvZiBwMm0tPmRlZmF1bHRfYWNjZXNz
IGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5n
eWVsQGludGVsLmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgfCA1
ICsrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBpbmRleCBlYWM4MDQ3YzA3Li5lM2RkYjYzYjRmIDEw
MDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiBAQCAtMTA3MSwxMSArMTA3MSwxMCBAQCBpbnQgYWRk
X3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAqc2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hh
bmRsZV90IHNoLAo+ICAgICAgcDJtX3R5cGVfdCBzbWZuX3R5cGUsIGNtZm5fdHlwZTsKPiAgICAg
IHN0cnVjdCBnZm5faW5mbyAqZ2ZuX2luZm87Cj4gICAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
ID0gcDJtX2dldF9ob3N0cDJtKGNkKTsKPiAtICAgIHAybV9hY2Nlc3NfdCBhOwo+ICAgICAgc3Ry
dWN0IHR3b19nZm5zIHRnOwo+ICAKPiAgICAgIGdldF90d29fZ2ZucyhzZCwgX2dmbihzZ2ZuKSwg
JnNtZm5fdHlwZSwgTlVMTCwgJnNtZm4sCj4gLSAgICAgICAgICAgICAgICAgY2QsIF9nZm4oY2dm
biksICZjbWZuX3R5cGUsICZhLCAmY21mbiwgMCwgJnRnLCBsb2NrKTsKPiArICAgICAgICAgICAg
ICAgICBjZCwgX2dmbihjZ2ZuKSwgJmNtZm5fdHlwZSwgTlVMTCwgJmNtZm4sIDAsICZ0ZywgbG9j
ayk7Cj4gIAo+ICAgICAgLyogR2V0IHRoZSBzb3VyY2Ugc2hhcmVkIHBhZ2UsIGNoZWNrIGFuZCBs
b2NrICovCj4gICAgICByZXQgPSBYRU5NRU1fU0hBUklOR19PUF9TX0hBTkRMRV9JTlZBTElEOwo+
IEBAIC0xMTEwLDcgKzExMDksNyBAQCBpbnQgYWRkX3RvX3BoeXNtYXAoc3RydWN0IGRvbWFpbiAq
c2QsIHVuc2lnbmVkIGxvbmcgc2dmbiwgc2hyX2hhbmRsZV90IHNoLAo+ICAgICAgfQo+ICAKPiAg
ICAgIHJldCA9IHAybV9zZXRfZW50cnkocDJtLCBfZ2ZuKGNnZm4pLCBzbWZuLCBQQUdFX09SREVS
XzRLLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICBwMm1fcmFtX3NoYXJlZCwgYSk7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgIHAybV9yYW1fc2hhcmVkLCBwMm0tPmRlZmF1bHRfYWNjZXNz
KTsKPiAgCj4gICAgICAvKiBUZW1wdGVkIHRvIHR1cm4gdGhpcyBpbnRvIGFuIGFzc2VydCAqLwo+
ICAgICAgaWYgKCByZXQgKQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
