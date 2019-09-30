Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DB0C2674
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 22:21:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iF26s-0001Ml-V4; Mon, 30 Sep 2019 20:17:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=I/AJ=XZ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iF26s-0001Mg-4S
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 20:17:30 +0000
X-Inumbo-ID: 52b78852-e3bf-11e9-96e6-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 52b78852-e3bf-11e9-96e6-12813bfff9fa;
 Mon, 30 Sep 2019 20:17:27 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6417D15A2;
 Mon, 30 Sep 2019 13:17:27 -0700 (PDT)
Received: from [10.37.10.143] (unknown [10.37.10.143])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E37173F534;
 Mon, 30 Sep 2019 13:17:25 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190930182437.25478-1-andrew.cooper3@citrix.com>
 <20190930182437.25478-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <6121ff6c-f7fb-f766-ffb0-7a5f52ddf997@arm.com>
Date: Mon, 30 Sep 2019 21:17:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190930182437.25478-3-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 2/2] xen/nospec: Introduce
 CONFIG_SPECULATIVE_BRANCH_HARDEN and disable it
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
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <JBeulich@suse.com>,
 Norbert Manthey <nmanthey@amazon.de>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzMwLzE5IDc6MjQgUE0sIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gVGhlIGNvZGUg
Z2VuZXJhdGlvbiBmb3IgYmFycmllcl9ub3NwZWNfdHJ1ZSgpIGlzIG5vdCBjb3JyZWN0LiAgV2Ug
YXJlIHRha2luZyBhCj4gcGVyZiBpdCBmcm9tIHRoZSBhZGRlZCBmZW5jZXMsIGJ1dCBub3QgZ2Fp
bmluZyBhbnkgc3BlY3VsYXRpdmUgc2FmZXR5LgoKcy9pdC9oaXQvPwoKPiAKPiBUaGlzIGlzIGNh
dXNlZCBieSBpbmxpbmUgYXNzZW1ibHkgdHJ5aW5nIHRvIGZpZ2h0IHRoZSBjb21waWxlciBvcHRp
bWlzZXIsIGFuZAo+IHRoZSBvcHRpbWlzZXIgd2lubmluZy4gIFRoZXJlIGlzIG5vIGNsZWFyIHdh
eSB0byBhY2hpZXZlIHNhZmV0eSwgc28gdHVybiB0aGUKPiBwZXJmIGhpdCBvZmYgZm9yIG5vdy4K
PiAKPiBUaGlzIGFsc28gbGFyZ2VseSByZXZlcnRzIDM4NjBkNTUzNGRmNC4gIFRoZSBuYW1lICds
MXRmLWJhcnJpZXInLCBhbmQgbWFraW5nCj4gYmFycmllcl9ub3NwZWNfdHJ1ZSgpIGRlcGVuZCBv
biBDT05GSUdfSFZNIHdhcyBjb25zdHJhaW5lZCBieSB3aGF0IGNvdWxkIGJlCj4gZGlzY3Vzc2Vk
IHB1YmxpY2x5IGF0IHRoZSB0aW1lLiAgTm93IHRoYXQgTURTIGlzIHB1YmxpYywgbmVpdGhlciBh
c3BlY3RzIGFyZQo+IGNvcnJlY3QuCj4gCj4gQXMgbDF0Zi1iYXJyaWVyIGhhc24ndCBiZWVuIGlu
IGEgcmVsZWFzZSBvZiBYZW4sIGFuZAo+IENPTkZJR19TUEVDVUxBVElWRV9CUkFOQ0hfSEFSREVO
IGlzIGRpc2FibGVkIHVudGlsIHdlIGNhbiBmaW5kIGEgc2FmZSB3YXkgb2YKPiBpbXBsZW1lbnRp
bmcgdGhlIGZ1bmN0aW9uYWxpdHksIHJlbW92ZSB0aGUgbDF0Zi1iYXJyaWVyIGNvbW1hbmQgbGlu
ZSBvcHRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29t
Pgo+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4KPiBDQzogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IENDOiBOb3JiZXJ0IE1hbnRoZXkgPG5tYW50aGV5QGFtYXpvbi5kZT4KPiAtLS0KPiAgIGRvY3Mv
bWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyB8ICA4ICstLS0tLS0tCj4gICB4ZW4vYXJjaC94
ODYvc3BlY19jdHJsLmMgICAgICAgICAgfCAxNyArKy0tLS0tLS0tLS0tLS0tLQo+ICAgeGVuL2Nv
bW1vbi9LY29uZmlnICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKCkkgdGhp
bmsgdGhpcyB3YW50ZWQgdG8gaGF2ZSAiVEhFIFJFU1QiIENDZWQuCgo+ICAgeGVuL2luY2x1ZGUv
YXNtLXg4Ni9jcHVmZWF0dXJlcy5oIHwgIDIgKy0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvbm9z
cGVjLmggICAgICB8ICA0ICsrLS0KPiAgIHhlbi9pbmNsdWRlL2FzbS14ODYvc3BlY19jdHJsLmgg
ICB8ICAxIC0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjYgZGVsZXRp
b25zKC0pCgpbLi4uXQoKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9LY29uZmlnIGIveGVuL2Nv
bW1vbi9LY29uZmlnCj4gaW5kZXggOTY0NGNjOTkxMS4uZDg1MWU2MzA4MyAxMDA2NDQKPiAtLS0g
YS94ZW4vY29tbW9uL0tjb25maWcKPiArKysgYi94ZW4vY29tbW9uL0tjb25maWcKPiBAQCAtOTYs
NiArOTYsMjMgQEAgY29uZmlnIFNQRUNVTEFUSVZFX0FSUkFZX0hBUkRFTgo+ICAgCj4gICAJICBJ
ZiB1bnN1cmUsIHNheSBZLgo+ICAgCj4gK2NvbmZpZyBTUEVDVUxBVElWRV9CUkFOQ0hfSEFSREVO
Cj4gKwlib29sICJTcGVjdWxhdGl2ZSBCcmFuY2ggSGFyZGVuaW5nIgo+ICsJZGVwZW5kcyBvbiBC
Uk9LRU4KPiArICAgICAgICAtLS1oZWxwLS0tCj4gKwkgIENvbnRlbXBvcmFyeSBwcm9jZXNzb3Jz
IG1heSB1c2Ugc3BlY3VsYXRpdmUgZXhlY3V0aW9uIGFzIGEKPiArCSAgcGVyZm9ybWFuY2Ugb3B0
aW1pc2F0aW9uLCBidXQgdGhpcyBjYW4gcG90ZW50aWFsbHkgYmUgYWJ1c2VkIGJ5IGFuCj4gKwkg
IGF0dGFja2VyIHRvIGxlYWsgZGF0YSB2aWEgc3BlY3VsYXRpdmUgc2lkZWNoYW5uZWxzLgo+ICsK
PiArCSAgT25lIHNvdXJjZSBvZiBtaXNiZWhhdmlvdXIgaXMgYnkgZXhlY3V0aW5nIHRoZSB3cm9u
ZyBiYXNpYyBibG9jawo+ICsJICBmb2xsb3dpbmcgYSBjb25kaXRpb25hbCBqdW1wLgo+ICsKPiAr
CSAgV2hlbiBlbmFibGVkLCBzcGVjaWZpYyBjb25kaXRpb25zIHdoaWNoIGhhdmUgYmVlbiBkZWVt
ZWQgbGlhYmxlIHRvCj4gKwkgIGJlIHNwZWN1bGF0aXZlbHkgYWJ1c2VkIHdpbGwgYmUgaGFyZGVu
ZWQgdG8gYXZvaWQgZW50ZXJpbmcgdGhlIHdyb25nCj4gKwkgIGJhc2ljIGJsb2NrLgo+ICsKPiAr
CSAgISEhIFdBUk5JTkcgLSBUaGlzIGlzIGJyb2tlbiBhbmQgZG9lc24ndCBnZW5lcmF0ZSBzYWZl
IGNvZGUgISEhCgpBbnkgcmVhc29uIHRvIGFkZCB0aGF0IGluIGNvbW1vbiBjb2RlIHdoZW4gdGhp
cyBpcyB4ODYgb25seT8gTXkgd29ycnkgaXMgCnRoaXMgZ2F0ZSBjb25maWcgZ2F0ZSBub3RoaW5n
IG9uIEFybSBzbyB0aGUgdXNlciBtYXkgaGF2ZSBhIGZhbHNlIHNlbnNlIAp0aGF0IGl0IGNhbiBi
ZSB1c2VkIChldmVuIHRob3VnaCBpdCBpcyBjbGVhcmx5IEJST0tFTikuCgpBbHNvIHRoZSBuYW1l
IGlzIHF1aXRlIGNsb3NlIHRvIHRoZSBDT05GSUdfSEFSREVOX1BSRURJQ1RPUiBvbiBBcm0gYW5k
IAptYXkgY29uZnVzZSB1c2VyLiBBbHRob3VnaCwgSSBkb24ndCBoYXZlIGEgYmV0dGVyIG5hbWUg
c28gZmFyIDovCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
