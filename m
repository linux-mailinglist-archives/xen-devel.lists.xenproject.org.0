Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022FE2E35D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 19:37:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW2Ss-00006T-Rl; Wed, 29 May 2019 17:34:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW2Sr-00006O-Bp
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 17:34:13 +0000
X-Inumbo-ID: f8e3dd5a-8237-11e9-a0b5-f7fa7c356007
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f8e3dd5a-8237-11e9-a0b5-f7fa7c356007;
 Wed, 29 May 2019 17:34:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD9D8341;
 Wed, 29 May 2019 10:34:11 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17D983F5AF;
 Wed, 29 May 2019 10:34:10 -0700 (PDT)
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1558460254-7127-1-git-send-email-olekstysh@gmail.com>
 <1558460254-7127-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <19c47d6b-344b-ac4a-b4d1-c0498500f863@arm.com>
Date: Wed, 29 May 2019 18:34:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558460254-7127-2-git-send-email-olekstysh@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V1 1/2] xen/device-tree: Add
 dt_count_phandle_with_args helper
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgT2xla3NhbmRyLAoKT24gMjEvMDUvMjAxOSAxODozNywgT2xla3NhbmRyIFR5c2hjaGVua28g
d3JvdGU6Cj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtv
QGVwYW0uY29tPgo+IAo+IFBvcnQgTGludXggaGVscGVyIG9mX2NvdW50X3BoYW5kbGVfd2l0aF9h
cmdzIGZvciBjb3VudGluZwo+IG51bWJlciBvZiBwaGFuZGxlcyBpbiBhIHByb3BlcnR5Lgo+IAo+
IFBsZWFzZSBub3RlLCB0aGlzIGhlbHBlciBpcyBwb3J0ZWQgZnJvbSBMaW51eCB2NC42Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5r
b0BlcGFtLmNvbT4KCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29t
PgoKQ2hlZXJzLAoKPiAKPiAtLS0KPiAgICAgIENoYW5nZXMgUkZDIC0+IFYxOgo+ICAgICAgICAg
IC0gQWRkIExpbnV4IHZlcnNpb24gd2hpY2ggaXMgdXNlZCBhcyB0aGUgYmFzZS4KPiAtLS0KPiAg
IHhlbi9jb21tb24vZGV2aWNlX3RyZWUuYyAgICAgIHwgIDcgKysrKysrKwo+ICAgeGVuL2luY2x1
ZGUveGVuL2RldmljZV90cmVlLmggfCAxOSArKysrKysrKysrKysrKysrKysrCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9k
ZXZpY2VfdHJlZS5jIGIveGVuL2NvbW1vbi9kZXZpY2VfdHJlZS5jCj4gaW5kZXggOGZjNDAxZC4u
NjU4NjJiNSAxMDA2NDQKPiAtLS0gYS94ZW4vY29tbW9uL2RldmljZV90cmVlLmMKPiArKysgYi94
ZW4vY29tbW9uL2RldmljZV90cmVlLmMKPiBAQCAtMTY2Myw2ICsxNjYzLDEzIEBAIGludCBkdF9w
YXJzZV9waGFuZGxlX3dpdGhfYXJncyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKm5wLAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluZGV4LCBvdXRfYXJn
cyk7Cj4gICB9Cj4gICAKPiAraW50IGR0X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKGNvbnN0IHN0
cnVjdCBkdF9kZXZpY2Vfbm9kZSAqbnAsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpsaXN0X25hbWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBjaGFyICpjZWxsc19uYW1lKQo+ICt7Cj4gKyAgICByZXR1cm4gX19kdF9wYXJzZV9w
aGFuZGxlX3dpdGhfYXJncyhucCwgbGlzdF9uYW1lLCBjZWxsc19uYW1lLCAwLCAtMSwgTlVMTCk7
Cj4gK30KPiArCj4gICAvKioKPiAgICAqIHVuZmxhdHRlbl9kdF9ub2RlIC0gQWxsb2MgYW5kIHBv
cHVsYXRlIGEgZGV2aWNlX25vZGUgZnJvbSB0aGUgZmxhdCB0cmVlCj4gICAgKiBAZmR0OiBUaGUg
cGFyZW50IGRldmljZSB0cmVlIGJsb2IKPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL2Rl
dmljZV90cmVlLmggYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaAo+IGluZGV4IDc0MDhh
NmMuLjgzMTU2MjkgMTAwNjQ0Cj4gLS0tIGEveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgK
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaAo+IEBAIC03MzgsNiArNzM4LDI1
IEBAIGludCBkdF9wYXJzZV9waGFuZGxlX3dpdGhfYXJncyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNl
X25vZGUgKm5wLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGNoYXIg
KmNlbGxzX25hbWUsIGludCBpbmRleCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgZHRfcGhhbmRsZV9hcmdzICpvdXRfYXJncyk7Cj4gICAKPiArLyoqCj4gKyAqIGR0
X2NvdW50X3BoYW5kbGVfd2l0aF9hcmdzKCkgLSBGaW5kIHRoZSBudW1iZXIgb2YgcGhhbmRsZXMg
cmVmZXJlbmNlcyBpbiBhIHByb3BlcnR5Cj4gKyAqIEBucDogcG9pbnRlciB0byBhIGRldmljZSB0
cmVlIG5vZGUgY29udGFpbmluZyBhIGxpc3QKPiArICogQGxpc3RfbmFtZTogcHJvcGVydHkgbmFt
ZSB0aGF0IGNvbnRhaW5zIGEgbGlzdAo+ICsgKiBAY2VsbHNfbmFtZTogcHJvcGVydHkgbmFtZSB0
aGF0IHNwZWNpZmllcyBwaGFuZGxlcycgYXJndW1lbnRzIGNvdW50Cj4gKyAqCj4gKyAqIFJldHVy
bnMgdGhlIG51bWJlciBvZiBwaGFuZGxlICsgYXJndW1lbnQgdHVwbGVzIHdpdGhpbiBhIHByb3Bl
cnR5LiBJdAo+ICsgKiBpcyBhIHR5cGljYWwgcGF0dGVybiB0byBlbmNvZGUgYSBsaXN0IG9mIHBo
YW5kbGUgYW5kIHZhcmlhYmxlCj4gKyAqIGFyZ3VtZW50cyBpbnRvIGEgc2luZ2xlIHByb3BlcnR5
LiBUaGUgbnVtYmVyIG9mIGFyZ3VtZW50cyBpcyBlbmNvZGVkCj4gKyAqIGJ5IGEgcHJvcGVydHkg
aW4gdGhlIHBoYW5kbGUtdGFyZ2V0IG5vZGUuIEZvciBleGFtcGxlLCBhIGdwaW9zCj4gKyAqIHBy
b3BlcnR5IHdvdWxkIGNvbnRhaW4gYSBsaXN0IG9mIEdQSU8gc3BlY2lmaWVzIGNvbnNpc3Rpbmcg
b2YgYQo+ICsgKiBwaGFuZGxlIGFuZCAxIG9yIG1vcmUgYXJndW1lbnRzLiBUaGUgbnVtYmVyIG9m
IGFyZ3VtZW50cyBhcmUKPiArICogZGV0ZXJtaW5lZCBieSB0aGUgI2dwaW8tY2VsbHMgcHJvcGVy
dHkgaW4gdGhlIG5vZGUgcG9pbnRlZCB0byBieSB0aGUKPiArICogcGhhbmRsZS4KPiArICovCj4g
K2ludCBkdF9jb3VudF9waGFuZGxlX3dpdGhfYXJncyhjb25zdCBzdHJ1Y3QgZHRfZGV2aWNlX25v
ZGUgKm5wLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqbGlz
dF9uYW1lLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3QgY2hhciAqY2Vs
bHNfbmFtZSk7Cj4gKwo+ICAgI2lmZGVmIENPTkZJR19ERVZJQ0VfVFJFRV9ERUJVRwo+ICAgI2Rl
ZmluZSBkdF9kcHJpbnRrKGZtdCwgYXJncy4uLikgIFwKPiAgICAgICBwcmludGsoWEVOTE9HX0RF
QlVHIGZtdCwgIyMgYXJncykKPiAKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
