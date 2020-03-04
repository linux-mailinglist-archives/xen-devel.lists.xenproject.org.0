Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4821E178EE2
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 11:51:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Rb9-00007l-5e; Wed, 04 Mar 2020 10:49:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Rb7-00007d-TG
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 10:49:53 +0000
X-Inumbo-ID: e0c739a6-5e05-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0c739a6-5e05-11ea-b52f-bc764e2007e4;
 Wed, 04 Mar 2020 10:49:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7BAC2B090;
 Wed,  4 Mar 2020 10:49:51 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-9-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aacae9b8-1b4b-3dcd-8aff-8466a80347a5@suse.com>
Date: Wed, 4 Mar 2020 11:49:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226124705.29212-9-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 08/12] xen: add /buildinfo/config entry
 to hypervisor filesystem
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzo0NywgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBBZGQgdGhlIC9idWls
ZGluZm8vY29uZmlnIGVudHJ5IHRvIHRoZSBoeXBlcnZpc29yIGZpbGVzeXN0ZW0uIFRoaXMKPiBl
bnRyeSBjb250YWlucyB0aGUgLmNvbmZpZyBmaWxlIHVzZWQgdG8gYnVpbGQgdGhlIGh5cGVydmlz
b3IuCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+
IC0tLQo+IFYzOgo+IC0gc3RvcmUgZGF0YSBpbiBnemlwIGZvcm1hdAo+IC0gdXNlIGJpbmZpbGUg
bWVjaGFuaXNtIHRvIGNyZWF0ZSBkYXRhIGZpbGUKPiAtIG1vdmUgY29kZSB0byBrZXJuZWwuYwo+
IAo+IFY2Ogo+IC0gYWRkIGNvbmZpZyBpdGVtIGZvciB0aGUgL2J1aWxkaW5mby9jb25maWcgKEph
biBCZXVsaWNoKQo+IC0gbWFrZSBjb25maWcgcmVsYXRlZCB2YXJpYWJsZXMgY29uc3QgaW4ga2Vy
bmVsLmggKEphbiBCZXVsaWNoKQo+IC0tLQo+ICAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAg
IHwgIDIgKysKPiAgZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYyB8ICA0ICsrKysKPiAgeGVu
L2NvbW1vbi9LY29uZmlnICAgICAgICAgICB8IDEwICsrKysrKysrKysKPiAgeGVuL2NvbW1vbi9N
YWtlZmlsZSAgICAgICAgICB8IDEyICsrKysrKysrKysrKwo+ICB4ZW4vY29tbW9uL2tlcm5lbC5j
ICAgICAgICAgIHwgMTUgKysrKysrKysrKysrKysrCj4gIHhlbi9pbmNsdWRlL3hlbi9rZXJuZWwu
aCAgICAgfCAgMyArKysKPiAgNiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhLy5naXRpZ25vcmUgYi8uZ2l0aWdub3JlCj4gaW5kZXggZmQ1NjEwNzE4ZC4u
YmM4ZTA1M2NjYiAxMDA2NDQKPiAtLS0gYS8uZ2l0aWdub3JlCj4gKysrIGIvLmdpdGlnbm9yZQo+
IEBAIC0yOTcsNiArMjk3LDggQEAgeGVuL2FyY2gvKi9lZmkvYm9vdC5jCj4gIHhlbi9hcmNoLyov
ZWZpL2NvbXBhdC5jCj4gIHhlbi9hcmNoLyovZWZpL2VmaS5oCj4gIHhlbi9hcmNoLyovZWZpL3J1
bnRpbWUuYwo+ICt4ZW4vY29tbW9uL2NvbmZpZ19kYXRhLlMKPiAreGVuL2NvbW1vbi9jb25maWcu
Z3oKPiAgeGVuL2luY2x1ZGUvaGVhZGVycyouY2hrCj4gIHhlbi9pbmNsdWRlL2FzbQo+ICB4ZW4v
aW5jbHVkZS9hc20tKi9hc20tb2Zmc2V0cy5oCj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlzYy9oeXBm
cy1wYXRocy5wYW5kb2MgYi9kb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jCj4gaW5kZXggZTM5
MmZlZmYyNy4uMWZhZWJjY2NiYyAxMDA2NDQKPiAtLS0gYS9kb2NzL21pc2MvaHlwZnMtcGF0aHMu
cGFuZG9jCj4gKysrIGIvZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYwo+IEBAIC0xMzMsNiAr
MTMzLDEwIEBAIEluZm9ybWF0aW9uIGFib3V0IHRoZSBjb21waWxlIGRvbWFpbi4KPiAgCj4gIFRo
ZSBjb21waWxlciB1c2VkIHRvIGJ1aWxkIFhlbi4KPiAgCj4gKyMjIyMgL2J1aWxkaW5mby9jb25m
aWcgPSBTVFJJTkcKPiArCj4gK1RoZSBjb250ZW50cyBvZiB0aGUgYHhlbi8uY29uZmlnYCBmaWxl
IGF0IHRoZSB0aW1lIG9mIHRoZSBoeXBlcnZpc29yIGJ1aWxkLgoKUGVyaGFwcyBhZGQgIi4uLiwg
aWYgZW5hYmxlZCBhdCBidWlsZCB0aW1lIj8KCj4gLS0tIGEveGVuL2NvbW1vbi9NYWtlZmlsZQo+
ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKPiBAQCAtMSw2ICsxLDcgQEAKPiAgb2JqLSQoQ09O
RklHX0FSR08pICs9IGFyZ28ubwo+ICBvYmoteSArPSBiaXRtYXAubwo+ICBvYmoteSArPSBic2Vh
cmNoLm8KPiArb2JqLSQoQ09ORklHX0hZUEZTX0NPTkZJRykgKz0gY29uZmlnX2RhdGEubwo+ICBv
YmotJChDT05GSUdfQ09SRV9QQVJLSU5HKSArPSBjb3JlX3Bhcmtpbmcubwo+ICBvYmoteSArPSBj
cHUubwo+ICBvYmotJChDT05GSUdfREVCVUdfVFJBQ0UpICs9IGRlYnVndHJhY2Uubwo+IEBAIC03
MywzICs3NCwxNCBAQCBzdWJkaXItJChDT05GSUdfVUJTQU4pICs9IHVic2FuCj4gIAo+ICBzdWJk
aXItJChDT05GSUdfTkVFRFNfTElCRUxGKSArPSBsaWJlbGYKPiAgc3ViZGlyLSQoQ09ORklHX0hB
U19ERVZJQ0VfVFJFRSkgKz0gbGliZmR0Cj4gKwo+ICtjb25maWcuZ3o6IC4uLy5jb25maWcKCkkg
dGhpbmsgdGhpcyB3YW50cyB0byB1c2UgJChLQ09ORklHX0NPTkZJRykgbm93LgoKPiArCWd6aXAg
LWMgJDwgPiRACgpXZSdsbCB3YW50IHRvIG1ha2Ugc3VyZSB0byBzd2l0Y2ggdGhpcyB0byAkKGlm
X2NoYW5nZWQgLi4uKSBvbmNlCmF2YWlsYWJsZSAoYnkgQW50aG9ueSdzIHNlcmllcykuCgo+ICtj
b25maWdfZGF0YS5vOiBjb25maWcuZ3oKCklzIHRoaXMgcmVhbGx5IG5lZWRlZD8gWW91IG5lZWQg
dG8gYWRkIGNvbmZpZy5neiBhcyBhCmRlcGVuZGVuY3kgLi4uCgo+ICtjb25maWdfZGF0YS5TOiAk
KFhFTl9ST09UKS94ZW4vdG9vbHMvYmluZmlsZQoKLi4uIGhlcmUgYW55d2F5IGFmYWljdCwgYW5k
IHRoZW4gcHJlZmVyYWJseSB1c2UgLi4uCgo+ICsJJChYRU5fUk9PVCkveGVuL3Rvb2xzL2JpbmZp
bGUgJEAgY29uZmlnLmd6IHhlbl9jb25maWdfZGF0YQoKLi4uICQ8IGhlcmUuCgo+ICtjbGVhbjo6
Cj4gKwlybSBjb25maWdfZGF0YS5TIGNvbmZpZy5neiAyPi9kZXYvbnVsbCB8fCB0cnVlCgpJbnN0
ZWFkIG9mIHRoZSAifHwgdHJ1ZSIgZWxzZXdoZXJlIHdlIHVzZSAicm0gLWYiLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
