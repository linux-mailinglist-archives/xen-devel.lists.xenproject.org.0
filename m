Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E10E9115B9
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 10:48:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM7LP-0002Kb-4M; Thu, 02 May 2019 08:45:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Flb6=TC=citrix.com=prvs=018be947d=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hM7LN-0002KW-71
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 08:45:29 +0000
X-Inumbo-ID: 9be2ac6c-6cb6-11e9-a99e-4b4ed8cefbe4
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9be2ac6c-6cb6-11e9-a99e-4b4ed8cefbe4;
 Thu, 02 May 2019 08:45:17 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,421,1549929600"; d="scan'208";a="89558912"
To: Razvan Cojocaru <rcojocaru@bitdefender.com>, Tamas K Lengyel
 <tamas@tklengyel.com>, <xen-devel@lists.xenproject.org>
References: <20190501235203.1179-1-tamas@tklengyel.com>
 <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <7c05a7d3-3423-e342-7704-fa906c99d620@citrix.com>
Date: Thu, 2 May 2019 09:45:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <01d02c64-a044-5c6f-d411-ec50abb83408@bitdefender.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2] x86/vmx: correctly gather gs_shadow
 value for current vCPU
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDUvMjAxOSAwNzoyMCwgUmF6dmFuIENvam9jYXJ1IHdyb3RlOgo+IE9uIDUvMi8xOSAy
OjUyIEFNLCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4+IEN1cnJlbnRseSB0aGUgZ3Nfc2hhZG93
IHZhbHVlIGlzIG9ubHkgY2FjaGVkIHdoZW4gdGhlIHZDUFUgaXMgYmVpbmcgc2NoZWR1bGVkCj4+
IG91dCBieSBYZW4uIFJlcG9ydGluZyB0aGlzICh1c3VhbGx5KSBzdGFsZSB2YWx1ZSB0aHJvdWdo
IHZtX2V2ZW50IGlzIGluY29ycmVjdCwKPj4gc2luY2UgaXQgZG9lc24ndCByZXByZXNlbnQgdGhl
IGFjdHVhbCBzdGF0ZSBvZiB0aGUgdkNQVSBhdCB0aGUgdGltZSB0aGUgZXZlbnQKPj4gd2FzIHJl
Y29yZGVkLiBUaGlzIHByZXZlbnRzIHZtX2V2ZW50IHN1YnNjcmliZXJzIGZyb20gY29ycmVjdGx5
IGZpbmRpbmcga2VybmVsCj4+IHN0cnVjdHVyZXMgaW4gdGhlIGd1ZXN0IHdoZW4gaXQgaXMgdHJh
cHBlZCB3aGlsZSBpbiByaW5nMy4KPj4KPj4gUmVmcmVzaCBzaGFkb3dfZ3MgdmFsdWUgd2hlbiB0
aGUgY29udGV4dCBiZWluZyBzYXZlZCBpcyBmb3IgdGhlIGN1cnJlbnQgdkNQVS4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hc0B0a2xlbmd5ZWwuY29tPgo+PiBDYzog
UmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+PiBDYzogSnVuIE5h
a2FqaW1hIDxqdW4ubmFrYWppbWFAaW50ZWwuY29tPgo+PiBDYzogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+Cj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+PiBDYzogV2Vp
IExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KPj4gQ2M6IFJvZ2VyIFBhdSBNb25uZSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+Cj4+IC0tLQo+PiB2MjogbW92ZSBmaXggdG8gaHZtIHNvIHZtX2V2ZW50
IGRvZXNuJ3QgaGF2ZSB0byBrbm93IHNwZWNpZmljcwo+PiAtLS0KPj4gIHhlbi9hcmNoL3g4Ni9o
dm0vdm14L3ZteC5jIHwgNSArKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygr
KQo+Pgo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMgYi94ZW4vYXJj
aC94ODYvaHZtL3ZteC92bXguYwo+PiBpbmRleCAyODNlYjdiMzRkLi41MTU0ZWNjMmE4IDEwMDY0
NAo+PiAtLS0gYS94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYwo+PiArKysgYi94ZW4vYXJjaC94
ODYvaHZtL3ZteC92bXguYwo+PiBAQCAtNzc5LDEyICs3NzksMTcgQEAgc3RhdGljIHZvaWQgdm14
X2xvYWRfY3B1X3N0YXRlKHN0cnVjdCB2Y3B1ICp2LCBzdHJ1Y3QgaHZtX2h3X2NwdSAqZGF0YSkK
Pj4gIAo+PiAgc3RhdGljIHZvaWQgdm14X3NhdmVfdm1jc19jdHh0KHN0cnVjdCB2Y3B1ICp2LCBz
dHJ1Y3QgaHZtX2h3X2NwdSAqY3R4dCkKPj4gIHsKPj4gKyAgICBpZiAoIHYgPT0gY3VycmVudCAp
Cj4+ICsgICAgICAgIHZteF9zYXZlX2d1ZXN0X21zcnModik7Cj4gdm14X3NhdmVfZ3Vlc3RfbXNy
cygpIGlzIHNpbXBsZSBlbm91Z2ggdGhhdCB0aGUgaWYgaXMgcHJvYmFibHkgbm90Cj4gbmVjZXNz
YXJ5IGhlcmUgKHdlIGNhbiBqdXN0IGNhbGwgdGhlIGZ1bmN0aW9uIGRpcmVjdGx5LCByZWdhcmRs
ZXNzIG9mCj4gd2hhdCB2IGhvbGRzKS4KCldoeT/CoCBEb2luZyB0aGF0IHdvdWxkIGZ1bGx5IGNv
cnJ1cHQgdidzIHN0YXRlIHdoZW4gY2FsbGVkIGluIHJlbW90ZQpjb250ZXh0LCBhcyB5b3UnZCBj
bG9iYmVyIHYncyBnc19zaGFkb3cgd2hpY2ggd2hhdGV2ZXIgdGhlIHZhbHVlIHdhcwpmcm9tIHRo
ZSBjdXJyZW50IHZjcHUuCgp+QW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
