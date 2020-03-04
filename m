Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED5179010
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 13:09:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Smx-00075x-DX; Wed, 04 Mar 2020 12:06:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jt9l=4V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9Smw-00075s-4B
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 12:06:10 +0000
X-Inumbo-ID: 88562b50-5e10-11ea-a3ab-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 88562b50-5e10-11ea-a3ab-12813bfff9fa;
 Wed, 04 Mar 2020 12:06:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 601A0ACD0;
 Wed,  4 Mar 2020 12:06:08 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-9-jgross@suse.com>
 <aacae9b8-1b4b-3dcd-8aff-8466a80347a5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <988e7267-2219-fe58-577d-470e2950306d@suse.com>
Date: Wed, 4 Mar 2020 13:06:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <aacae9b8-1b4b-3dcd-8aff-8466a80347a5@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAgMTE6NDksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI2LjAyLjIwMjAgMTM6
NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFkZCB0aGUgL2J1aWxkaW5mby9jb25maWcgZW50
cnkgdG8gdGhlIGh5cGVydmlzb3IgZmlsZXN5c3RlbS4gVGhpcwo+PiBlbnRyeSBjb250YWlucyB0
aGUgLmNvbmZpZyBmaWxlIHVzZWQgdG8gYnVpbGQgdGhlIGh5cGVydmlzb3IuCj4+Cj4+IFNpZ25l
ZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4gLS0tCj4+IFYzOgo+
PiAtIHN0b3JlIGRhdGEgaW4gZ3ppcCBmb3JtYXQKPj4gLSB1c2UgYmluZmlsZSBtZWNoYW5pc20g
dG8gY3JlYXRlIGRhdGEgZmlsZQo+PiAtIG1vdmUgY29kZSB0byBrZXJuZWwuYwo+Pgo+PiBWNjoK
Pj4gLSBhZGQgY29uZmlnIGl0ZW0gZm9yIHRoZSAvYnVpbGRpbmZvL2NvbmZpZyAoSmFuIEJldWxp
Y2gpCj4+IC0gbWFrZSBjb25maWcgcmVsYXRlZCB2YXJpYWJsZXMgY29uc3QgaW4ga2VybmVsLmgg
KEphbiBCZXVsaWNoKQo+PiAtLS0KPj4gICAuZ2l0aWdub3JlICAgICAgICAgICAgICAgICAgIHwg
IDIgKysKPj4gICBkb2NzL21pc2MvaHlwZnMtcGF0aHMucGFuZG9jIHwgIDQgKysrKwo+PiAgIHhl
bi9jb21tb24vS2NvbmZpZyAgICAgICAgICAgfCAxMCArKysrKysrKysrCj4+ICAgeGVuL2NvbW1v
bi9NYWtlZmlsZSAgICAgICAgICB8IDEyICsrKysrKysrKysrKwo+PiAgIHhlbi9jb21tb24va2Vy
bmVsLmMgICAgICAgICAgfCAxNSArKysrKysrKysrKysrKysKPj4gICB4ZW4vaW5jbHVkZS94ZW4v
a2VybmVsLmggICAgIHwgIDMgKysrCj4+ICAgNiBmaWxlcyBjaGFuZ2VkLCA0NiBpbnNlcnRpb25z
KCspCj4+Cj4+IGRpZmYgLS1naXQgYS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQo+PiBpbmRleCBm
ZDU2MTA3MThkLi5iYzhlMDUzY2NiIDEwMDY0NAo+PiAtLS0gYS8uZ2l0aWdub3JlCj4+ICsrKyBi
Ly5naXRpZ25vcmUKPj4gQEAgLTI5Nyw2ICsyOTcsOCBAQCB4ZW4vYXJjaC8qL2VmaS9ib290LmMK
Pj4gICB4ZW4vYXJjaC8qL2VmaS9jb21wYXQuYwo+PiAgIHhlbi9hcmNoLyovZWZpL2VmaS5oCj4+
ICAgeGVuL2FyY2gvKi9lZmkvcnVudGltZS5jCj4+ICt4ZW4vY29tbW9uL2NvbmZpZ19kYXRhLlMK
Pj4gK3hlbi9jb21tb24vY29uZmlnLmd6Cj4+ICAgeGVuL2luY2x1ZGUvaGVhZGVycyouY2hrCj4+
ICAgeGVuL2luY2x1ZGUvYXNtCj4+ICAgeGVuL2luY2x1ZGUvYXNtLSovYXNtLW9mZnNldHMuaAo+
PiBkaWZmIC0tZ2l0IGEvZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYyBiL2RvY3MvbWlzYy9o
eXBmcy1wYXRocy5wYW5kb2MKPj4gaW5kZXggZTM5MmZlZmYyNy4uMWZhZWJjY2NiYyAxMDA2NDQK
Pj4gLS0tIGEvZG9jcy9taXNjL2h5cGZzLXBhdGhzLnBhbmRvYwo+PiArKysgYi9kb2NzL21pc2Mv
aHlwZnMtcGF0aHMucGFuZG9jCj4+IEBAIC0xMzMsNiArMTMzLDEwIEBAIEluZm9ybWF0aW9uIGFi
b3V0IHRoZSBjb21waWxlIGRvbWFpbi4KPj4gICAKPj4gICBUaGUgY29tcGlsZXIgdXNlZCB0byBi
dWlsZCBYZW4uCj4+ICAgCj4+ICsjIyMjIC9idWlsZGluZm8vY29uZmlnID0gU1RSSU5HCj4+ICsK
Pj4gK1RoZSBjb250ZW50cyBvZiB0aGUgYHhlbi8uY29uZmlnYCBmaWxlIGF0IHRoZSB0aW1lIG9m
IHRoZSBoeXBlcnZpc29yIGJ1aWxkLgo+IAo+IFBlcmhhcHMgYWRkICIuLi4sIGlmIGVuYWJsZWQg
YXQgYnVpbGQgdGltZSI/CgpZZXMuCgo+IAo+PiAtLS0gYS94ZW4vY29tbW9uL01ha2VmaWxlCj4+
ICsrKyBiL3hlbi9jb21tb24vTWFrZWZpbGUKPj4gQEAgLTEsNiArMSw3IEBACj4+ICAgb2JqLSQo
Q09ORklHX0FSR08pICs9IGFyZ28ubwo+PiAgIG9iai15ICs9IGJpdG1hcC5vCj4+ICAgb2JqLXkg
Kz0gYnNlYXJjaC5vCj4+ICtvYmotJChDT05GSUdfSFlQRlNfQ09ORklHKSArPSBjb25maWdfZGF0
YS5vCj4+ICAgb2JqLSQoQ09ORklHX0NPUkVfUEFSS0lORykgKz0gY29yZV9wYXJraW5nLm8KPj4g
ICBvYmoteSArPSBjcHUubwo+PiAgIG9iai0kKENPTkZJR19ERUJVR19UUkFDRSkgKz0gZGVidWd0
cmFjZS5vCj4+IEBAIC03MywzICs3NCwxNCBAQCBzdWJkaXItJChDT05GSUdfVUJTQU4pICs9IHVi
c2FuCj4+ICAgCj4+ICAgc3ViZGlyLSQoQ09ORklHX05FRURTX0xJQkVMRikgKz0gbGliZWxmCj4+
ICAgc3ViZGlyLSQoQ09ORklHX0hBU19ERVZJQ0VfVFJFRSkgKz0gbGliZmR0Cj4+ICsKPj4gK2Nv
bmZpZy5nejogLi4vLmNvbmZpZwo+IAo+IEkgdGhpbmsgdGhpcyB3YW50cyB0byB1c2UgJChLQ09O
RklHX0NPTkZJRykgbm93LgoKT2theS4KCj4gCj4+ICsJZ3ppcCAtYyAkPCA+JEAKPiAKPiBXZSds
bCB3YW50IHRvIG1ha2Ugc3VyZSB0byBzd2l0Y2ggdGhpcyB0byAkKGlmX2NoYW5nZWQgLi4uKSBv
bmNlCj4gYXZhaWxhYmxlIChieSBBbnRob255J3Mgc2VyaWVzKS4KClllcy4KCj4gCj4+ICtjb25m
aWdfZGF0YS5vOiBjb25maWcuZ3oKPiAKPiBJcyB0aGlzIHJlYWxseSBuZWVkZWQ/IFlvdSBuZWVk
IHRvIGFkZCBjb25maWcuZ3ogYXMgYQo+IGRlcGVuZGVuY3kgLi4uCj4gCj4+ICtjb25maWdfZGF0
YS5TOiAkKFhFTl9ST09UKS94ZW4vdG9vbHMvYmluZmlsZQo+IAo+IC4uLiBoZXJlIGFueXdheSBh
ZmFpY3QsIGFuZCB0aGVuIHByZWZlcmFibHkgdXNlIC4uLgoKV2h5PyBjb25maWdfZGF0YS5TIHdp
bGwgbG9vayBhbHdheXMgdGhlIHNhbWUsIGV2ZW4gaWYgY29uZmlnLmd6IGhhcwpjaGFuZ2VkLiBJ
dCBpcyBqdXN0IHRoZSBuYW1lIG9mIHRoZSBmaWxlIHdoaWNoIHdpbGwgYmUgcHV0IGludG8gdGhl
CmdlbmVyYXRlZCBzb3VyY2UsIG5vdCBpdHMgY29udGVudHMuIEl0cyB0aGUgLm8gZmlsZSB3aGlj
aCB3YW50cyB0bwpiZSBidWlsdCBhZ2FpbiBpZiBjb25maWcuZ3ogY2hhbmdlcywgbm90IHRoZSAu
UyBmaWxlLgoKPiAKPj4gKwkkKFhFTl9ST09UKS94ZW4vdG9vbHMvYmluZmlsZSAkQCBjb25maWcu
Z3ogeGVuX2NvbmZpZ19kYXRhCj4gCj4gLi4uICQ8IGhlcmUuCj4gCj4+ICtjbGVhbjo6Cj4+ICsJ
cm0gY29uZmlnX2RhdGEuUyBjb25maWcuZ3ogMj4vZGV2L251bGwgfHwgdHJ1ZQo+IAo+IEluc3Rl
YWQgb2YgdGhlICJ8fCB0cnVlIiBlbHNld2hlcmUgd2UgdXNlICJybSAtZiIuCgpPa2F5LgoKCkp1
ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
