Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FC150B37
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 17:25:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyeVl-0000iC-PA; Mon, 03 Feb 2020 16:23:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iyeVk-0000i7-Oy
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 16:23:44 +0000
X-Inumbo-ID: 8ae4f4f6-46a1-11ea-8e75-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8ae4f4f6-46a1-11ea-8e75-12813bfff9fa;
 Mon, 03 Feb 2020 16:23:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 94705AE5E;
 Mon,  3 Feb 2020 16:23:42 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1580746020.git.tamas.lengyel@intel.com>
 <b784bc7edf0c267e03100b30a0250454be37f59c.1580746020.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71886dfb-a1ca-71fb-6ff3-045cd972c568@suse.com>
Date: Mon, 3 Feb 2020 17:23:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <b784bc7edf0c267e03100b30a0250454be37f59c.1580746020.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v7 1/7] x86/p2m: Allow p2m_get_page_from_gfn
 to return shared entries
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNzoxMiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IFRoZSBvd25lciBk
b21haW4gb2Ygc2hhcmVkIHBhZ2VzIGlzIGRvbV9jb3csIHVzZSB0aGF0IGZvciBnZXRfcGFnZQo+
IG90aGVyd2lzZSB0aGUgZnVuY3Rpb24gZmFpbHMgdG8gcmV0dXJuIHRoZSBjb3JyZWN0IHBhZ2Ug
dW5kZXIgc29tZQo+IHNpdHVhdGlvbnMuIFRoZSBjaGVjayBpZiBkb21fY293IHNob3VsZCBiZSB1
c2VkIHdhcyBvbmx5IHBlcmZvcm1lZCBpbgo+IGEgc3Vic2V0IG9mIHVzZS1jYXNlcy4gRml4aW5n
IHRoZSBlcnJvciBhbmQgc2ltcGxpZnlpbmcgdGhlIGV4aXN0aW5nIGNoZWNrCj4gc2luY2Ugd2Ug
Y2FuJ3QgaGF2ZSBhbnkgc2hhcmVkIGVudHJpZXMgd2l0aCBkb21fY293IGJlaW5nIE5VTEwuCgpC
ZXR0ZXIsIHRoYW5rcy4KCj4gU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5s
ZW5neWVsQGludGVsLmNvbT4KPiAtLS0KPiB2NzogdXBkYXRlIGNvbW1pdCBtZXNzYWdlCj4gLS0t
Cj4gIHhlbi9hcmNoL3g4Ni9tbS9wMm0uYyB8IDE0ICsrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS9wMm0uYyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+IGluZGV4IGRl
ZjEzZjY1N2IuLjAwN2ZlZjcyMGQgMTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5j
Cj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS5jCj4gQEAgLTU3NSwxMSArNTc1LDEyIEBAIHN0
cnVjdCBwYWdlX2luZm8gKnAybV9nZXRfcGFnZV9mcm9tX2dmbigKPiAgICAgICAgICAgICAgICAg
IGlmICggZmRvbSA9PSBOVUxMICkKPiAgICAgICAgICAgICAgICAgICAgICBwYWdlID0gTlVMTDsK
PiAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICBlbHNlIGlmICggIWdldF9wYWdlKHBhZ2Us
IHAybS0+ZG9tYWluKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgICAgLyogUGFnZSBjb3VsZCBi
ZSBzaGFyZWQgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICghZG9tX2NvdyB8fCAhcDJtX2lz
X3NoYXJlZCgqdCkgfHwKPiAtICAgICAgICAgICAgICAgICAgICAgICAhZ2V0X3BhZ2UocGFnZSwg
ZG9tX2NvdykpICkKPiAtICAgICAgICAgICAgICAgIHBhZ2UgPSBOVUxMOwo+ICsgICAgICAgICAg
ICBlbHNlCj4gKyAgICAgICAgICAgIHsKPiArICAgICAgICAgICAgICAgIHN0cnVjdCBkb21haW4g
KmQgPSAhcDJtX2lzX3NoYXJlZCgqdCkgPyBwMm0tPmRvbWFpbiA6IGRvbV9jb3c7Cj4gKyAgICAg
ICAgICAgICAgICBpZiAoICFnZXRfcGFnZShwYWdlLCBkKSApCgpUaGVyZSdzIHN0aWxsIGEgYmxh
bmsgbGluZSBtaXNzaW5nIGJldHdlZW4gdGhlc2UgdHdvIGxpbmVzIGFuZCAuLi4KCj4gKyAgICAg
ICAgICAgICAgICAgICAgcGFnZSA9IE5VTEw7Cj4gKyAgICAgICAgICAgIH0KPiAgICAgICAgICB9
Cj4gICAgICAgICAgcDJtX3JlYWRfdW5sb2NrKHAybSk7Cj4gIAo+IEBAIC01OTUsOCArNTk2LDkg
QEAgc3RydWN0IHBhZ2VfaW5mbyAqcDJtX2dldF9wYWdlX2Zyb21fZ2ZuKAo+ICAgICAgbWZuID0g
Z2V0X2dmbl90eXBlX2FjY2VzcyhwMm0sIGdmbl94KGdmbiksIHQsIGEsIHEsIE5VTEwpOwo+ICAg
ICAgaWYgKCBwMm1faXNfcmFtKCp0KSAmJiBtZm5fdmFsaWQobWZuKSApCj4gICAgICB7Cj4gKyAg
ICAgICAgc3RydWN0IGRvbWFpbiAqZCA9ICFwMm1faXNfc2hhcmVkKCp0KSA/IHAybS0+ZG9tYWlu
IDogZG9tX2NvdzsKPiAgICAgICAgICBwYWdlID0gbWZuX3RvX3BhZ2UobWZuKTsKCi4uLiBzaW1p
bGFybHkgYmV0d2VlbiB0aGVzZSB0d28uIEFzIGluZGljYXRlZCBiZWZvcmUsIHdpdGggdGhlbQph
ZGRlZApSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpkZXNwaXRl
IG1lIHN0aWxsIHRoaW5raW5nIHRoYXQgdGhlIHRpdGxlIHN1Z2dlc3RzIG1vcmUgb2YgYQpwcm9i
bGVtIHRoYW4gdGhlcmUgcmVhbGx5IHdhcy4gKE9mIGNvdXJzZSBhZGRpbmcgdGhlIG1pc3NpbmcK
YmxhbmsgbGluZXMgb3VnaHQgdG8gYmUgZWFzeSBlbm91Z2ggd2hpbGUgY29tbWl0dGluZy4pCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
