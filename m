Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 874DB707E6
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 19:52:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpcRI-0002Rn-34; Mon, 22 Jul 2019 17:49:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MfEy=VT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hpcRF-0002Ri-Ss
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 17:49:29 +0000
X-Inumbo-ID: 0d51c45a-aca9-11e9-86e5-fb7edd107533
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0d51c45a-aca9-11e9-86e5-fb7edd107533;
 Mon, 22 Jul 2019 17:49:28 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C949121901;
 Mon, 22 Jul 2019 17:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563817768;
 bh=dpuT6DAOEvg4WPEHSOsY4+pS2JlF9VtnrxTopY/3FOw=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=bmU7+lHFMC6G9n30drUObfx5tIH8zoeLGSUgniKCI29RDnLHESnRNeOVwqq04qpR6
 07uREYjtp1saf0PEnSkBJ9CoHlSjdAo8Kzb7mV1/Fzi/N08kGDxcheCDEwKvdrkG1V
 QJiySjx1XtkLhsmi5W6iXjBRpE5l3gxAi4+PbcCI=
Date: Mon, 22 Jul 2019 10:49:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190722074705.2082153-1-arnd@arndb.de>
Message-ID: <alpine.DEB.2.21.1907221041420.31177@sstabellini-ThinkPad-T480s>
References: <20190722074705.2082153-1-arnd@arndb.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] [v3] xen: avoid link error on ARM
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyMiBKdWwgMjAxOSwgQXJuZCBCZXJnbWFubiB3cm90ZToKPiBCdWlsZGluZyB0aGUg
cHJpdmNtZCBjb2RlIGFzIGEgbG9hZGFibGUgbW9kdWxlIG9uIEFSTSwgd2UgZ2V0Cj4gYSBsaW5r
IGVycm9yIGR1ZSB0byB0aGUgcHJpdmF0ZSBjYWNoZSBtYW5hZ2VtZW50IGZ1bmN0aW9uczoKPiAK
PiBFUlJPUjogIl9fc3luY19pY2FjaGVfZGNhY2hlIiBbZHJpdmVycy94ZW4veGVuLXByaXZjbWQu
a29dIHVuZGVmaW5lZCEKPiAKPiBNb3ZlIHRoZSBjb2RlIGludG8gYSBuZXcgdGhhdCBpcyBhbHdh
eXMgYnVpbHQgaW4gd2hlbiBYZW4gaXMgZW5hYmxlZCwKPiBhcyBzdWdnZXN0ZWQgYnkgSnVlcmdl
biBHcm9zcyBhbmQgQm9yaXMgT3N0cm92c2t5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+Cj4gLS0tCj4gdjI6IHJlbmFtZSBtbS5vIHRvIHhlbi1idWls
dGluLm8sIG1ha2UgaXQgdW5jb25kaXRpb25hbAo+IHYzOiBtb3ZlIG5ldyBjb2RlIGludG8geGxh
dGVfbW11IGFzIHN1Z2dlc3RlZCBieSBCb3JpcyBPc3Ryb3Zza3kuCj4gICAgIHNvcnJ5IGZvciB0
aGUgbG9uZyBkZWxheSBzaW5jZSB2MiwgSSBsb3N0IHRyYWNrIG9mIHRoaXMuCj4gLS0tCj4gIGRy
aXZlcnMveGVuL3ByaXZjbWQuYyAgIHwgMzUgKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KPiAgZHJpdmVycy94ZW4veGxhdGVfbW11LmMgfCAzMiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ICBpbmNsdWRlL3hlbi94ZW4tb3BzLmggICB8ICAzICsrKwo+ICAzIGZp
bGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi9wcml2Y21kLmMgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBp
bmRleCAyZjVjZTcyMzBhNDMuLmM2MDcwZTcwZGQ3MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3hl
bi9wcml2Y21kLmMKPiArKysgYi9kcml2ZXJzL3hlbi9wcml2Y21kLmMKPiBAQCAtNzI0LDI1ICs3
MjQsNiBAQCBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX3Jlc3RyaWN0KHN0cnVjdCBmaWxlICpm
aWxlLCB2b2lkIF9fdXNlciAqdWRhdGEpCj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RydWN0
IHJlbWFwX3BmbiB7Cj4gLQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPiAtCXN0cnVjdCBwYWdlICoq
cGFnZXM7Cj4gLQlwZ3Byb3RfdCBwcm90Owo+IC0JdW5zaWduZWQgbG9uZyBpOwo+IC19Owo+IC0K
PiAtc3RhdGljIGludCByZW1hcF9wZm5fZm4ocHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGxvbmcgYWRk
ciwgdm9pZCAqZGF0YSkKPiAtewo+IC0Jc3RydWN0IHJlbWFwX3BmbiAqciA9IGRhdGE7Cj4gLQlz
dHJ1Y3QgcGFnZSAqcGFnZSA9IHItPnBhZ2VzW3ItPmldOwo+IC0JcHRlX3QgcHRlID0gcHRlX21r
c3BlY2lhbChwZm5fcHRlKHBhZ2VfdG9fcGZuKHBhZ2UpLCByLT5wcm90KSk7Cj4gLQo+IC0Jc2V0
X3B0ZV9hdChyLT5tbSwgYWRkciwgcHRlcCwgcHRlKTsKPiAtCXItPmkrKzsKPiAtCj4gLQlyZXR1
cm4gMDsKPiAtfQo+IC0KPiAgc3RhdGljIGxvbmcgcHJpdmNtZF9pb2N0bF9tbWFwX3Jlc291cmNl
KHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkIF9fdXNlciAqdWRhdGEpCj4gIHsKPiAgCXN0cnVjdCBw
cml2Y21kX2RhdGEgKmRhdGEgPSBmaWxlLT5wcml2YXRlX2RhdGE7Cj4gQEAgLTc3NCw3ICs3NTUs
OCBAQCBzdGF0aWMgbG9uZyBwcml2Y21kX2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUg
KmZpbGUsIHZvaWQgX191c2VyICp1ZGF0YSkKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiAgCj4gLQlp
ZiAoeGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21hcCkpIHsKPiArCWlm
IChJU19FTkFCTEVEKENPTkZJR19YRU5fQVVUT19YTEFURSkgJiYKPiArCSAgICB4ZW5fZmVhdHVy
ZShYRU5GRUFUX2F1dG9fdHJhbnNsYXRlZF9waHlzbWFwKSkgewoKVGhlIHBhdGNoIGxvb2tzIGdv
b2QuIEkgdGVzdGVkIGl0IGFuZCB3b3JrcyBhcyBpbnRlbmRlZC4gSW5zdGVhZCBvZgphZGRpbmcg
dGhlIGFkZGl0aW9uYWwgSVNfRU5BQkxFRCBjaGVjaywgSSB3b3VsZCBoYXZlIGdvbmUgd2l0aCBw
cm92aWRpbmcKYW4gZW1wdHkgaW1wbGVtZW50YXRpb24gb2YgeGVuX3JlbWFwX3ZtYV9yYW5nZSBh
cyBhIHN0YXRpYyBpbmxpbmUKZnVuY3Rpb24sIGlmIENPTkZJR19YRU5fQVVUT19YTEFURSBpcyBu
b3QgZW5hYmxlZC4KCkVpdGhlciB3YXk6CgpSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKCj4gIAkJdW5zaWduZWQgaW50IG5yID0gRElWX1JP
VU5EX1VQKGtkYXRhLm51bSwgWEVOX1BGTl9QRVJfUEFHRSk7Cj4gIAkJc3RydWN0IHBhZ2UgKipw
YWdlczsKPiAgCQl1bnNpZ25lZCBpbnQgaTsKPiBAQCAtODA4LDE2ICs3OTAsOSBAQCBzdGF0aWMg
bG9uZyBwcml2Y21kX2lvY3RsX21tYXBfcmVzb3VyY2Uoc3RydWN0IGZpbGUgKmZpbGUsIHZvaWQg
X191c2VyICp1ZGF0YSkKPiAgCWlmIChyYykKPiAgCQlnb3RvIG91dDsKPiAgCj4gLQlpZiAoeGVu
X2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21hcCkpIHsKPiAtCQlzdHJ1Y3Qg
cmVtYXBfcGZuIHIgPSB7Cj4gLQkJCS5tbSA9IHZtYS0+dm1fbW0sCj4gLQkJCS5wYWdlcyA9IHZt
YS0+dm1fcHJpdmF0ZV9kYXRhLAo+IC0JCQkucHJvdCA9IHZtYS0+dm1fcGFnZV9wcm90LAo+IC0J
CX07Cj4gLQo+IC0JCXJjID0gYXBwbHlfdG9fcGFnZV9yYW5nZShyLm1tLCBrZGF0YS5hZGRyLAo+
IC0JCQkJCSBrZGF0YS5udW0gPDwgUEFHRV9TSElGVCwKPiAtCQkJCQkgcmVtYXBfcGZuX2ZuLCAm
cik7Cj4gKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfWEVOX0FVVE9fWExBVEUpICYmCj4gKwkgICAg
eGVuX2ZlYXR1cmUoWEVORkVBVF9hdXRvX3RyYW5zbGF0ZWRfcGh5c21hcCkpIHsKPiArCQlyYyA9
IHhlbl9yZW1hcF92bWFfcmFuZ2Uodm1hLCBrZGF0YS5hZGRyLCBrZGF0YS5udW0gPDwgUEFHRV9T
SElGVCk7Cj4gIAl9IGVsc2Ugewo+ICAJCXVuc2lnbmVkIGludCBkb21pZCA9Cj4gIAkJCSh4ZGF0
YS5mbGFncyAmIFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQpID8KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4veGxhdGVfbW11LmMgYi9kcml2ZXJzL3hlbi94bGF0ZV9tbXUuYwo+IGluZGV4
IGJhODgzYTgwYjNjMC4uN2IxMDc3ZjBhYmNiIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMveGVuL3hs
YXRlX21tdS5jCj4gKysrIGIvZHJpdmVycy94ZW4veGxhdGVfbW11LmMKPiBAQCAtMjYyLDMgKzI2
MiwzNSBAQCBpbnQgX19pbml0IHhlbl94bGF0ZV9tYXBfYmFsbG9vbmVkX3BhZ2VzKHhlbl9wZm5f
dCAqKmdmbnMsIHZvaWQgKip2aXJ0LAo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgRVhQT1JUX1NZTUJP
TF9HUEwoeGVuX3hsYXRlX21hcF9iYWxsb29uZWRfcGFnZXMpOwo+ICsKPiArc3RydWN0IHJlbWFw
X3BmbiB7Cj4gKwlzdHJ1Y3QgbW1fc3RydWN0ICptbTsKPiArCXN0cnVjdCBwYWdlICoqcGFnZXM7
Cj4gKwlwZ3Byb3RfdCBwcm90Owo+ICsJdW5zaWduZWQgbG9uZyBpOwo+ICt9Owo+ICsKPiArc3Rh
dGljIGludCByZW1hcF9wZm5fZm4ocHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGxvbmcgYWRkciwgdm9p
ZCAqZGF0YSkKPiArewo+ICsJc3RydWN0IHJlbWFwX3BmbiAqciA9IGRhdGE7Cj4gKwlzdHJ1Y3Qg
cGFnZSAqcGFnZSA9IHItPnBhZ2VzW3ItPmldOwo+ICsJcHRlX3QgcHRlID0gcHRlX21rc3BlY2lh
bChwZm5fcHRlKHBhZ2VfdG9fcGZuKHBhZ2UpLCByLT5wcm90KSk7Cj4gKwo+ICsJc2V0X3B0ZV9h
dChyLT5tbSwgYWRkciwgcHRlcCwgcHRlKTsKPiArCXItPmkrKzsKPiArCj4gKwlyZXR1cm4gMDsK
PiArfQo+ICsKPiArLyogVXNlZCBieSB0aGUgcHJpdmNtZCBtb2R1bGUsIGJ1dCBoYXMgdG8gYmUg
YnVpbHQtaW4gb24gQVJNICovCj4gK2ludCB4ZW5fcmVtYXBfdm1hX3JhbmdlKHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgbGVuKQo+
ICt7Cj4gKwlzdHJ1Y3QgcmVtYXBfcGZuIHIgPSB7Cj4gKwkJLm1tID0gdm1hLT52bV9tbSwKPiAr
CQkucGFnZXMgPSB2bWEtPnZtX3ByaXZhdGVfZGF0YSwKPiArCQkucHJvdCA9IHZtYS0+dm1fcGFn
ZV9wcm90LAo+ICsJfTsKPiArCj4gKwlyZXR1cm4gYXBwbHlfdG9fcGFnZV9yYW5nZSh2bWEtPnZt
X21tLCBhZGRyLCBsZW4sIHJlbWFwX3Bmbl9mbiwgJnIpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xf
R1BMKHhlbl9yZW1hcF92bWFfcmFuZ2UpOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3hlbi94ZW4t
b3BzLmggYi9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKPiBpbmRleCA0OTY5ODE3MTI0YTguLjk4YjMw
YzE2MTNiMiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3hlbi94ZW4tb3BzLmgKPiArKysgYi9pbmNs
dWRlL3hlbi94ZW4tb3BzLmgKPiBAQCAtMTA5LDYgKzEwOSw5IEBAIHN0YXRpYyBpbmxpbmUgaW50
IHhlbl94bGF0ZV91bm1hcF9nZm5fcmFuZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4g
IH0KPiAgI2VuZGlmCj4gIAo+ICtpbnQgeGVuX3JlbWFwX3ZtYV9yYW5nZShzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICsJCQl1bnNpZ25lZCBsb25nIGxl
bik7Cj4gKwo+ICAvKgo+ICAgKiB4ZW5fcmVtYXBfZG9tYWluX2dmbl9hcnJheSgpIC0gbWFwIGFu
IGFycmF5IG9mIGZvcmVpZ24gZnJhbWVzIGJ5IGdmbgo+ICAgKiBAdm1hOiAgICAgVk1BIHRvIG1h
cCB0aGUgcGFnZXMgaW50bwo+IC0tIAo+IDIuMjAuMAo+IAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
