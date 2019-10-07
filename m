Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3FDCDBEF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2019 08:48:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHMly-0001UG-AG; Mon, 07 Oct 2019 06:45:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=d412=YA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHMlx-0001UB-67
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2019 06:45:33 +0000
X-Inumbo-ID: 0e08c914-e8ce-11e9-97a3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e08c914-e8ce-11e9-97a3-12813bfff9fa;
 Mon, 07 Oct 2019 06:45:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5E331B16D;
 Mon,  7 Oct 2019 06:45:30 +0000 (UTC)
To: Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
References: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e46f62ed-5dfc-723c-e598-c24ed545f353@suse.com>
Date: Mon, 7 Oct 2019 08:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191004151707.24844-1-ian.jackson@eu.citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 0/6] Drop/deprecate
 libxl_get_required_*_memory
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
Cc: AnthonyPERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTAuMTkgMTc6MTcsIElhbiBKYWNrc29uIHdyb3RlOgo+IGxpYnhsX2dldF9yZXF1aXJl
ZF9zaGFkb3dfbWVtb3J5IGhhcyBhbHdheXMgYmVlbiBhbm9tYWxvdXMuICBsaWJ4bAo+IG91Z2h0
IHRvIGRlZmF1bHQgdGhlc2UgdGhpbmdzIGl0c2VsZi4gIFJlY2VudGx5LCBhbm90aGVyIGFuYWxv
Z291cwo+IHNldHRpbmcsIGlvbW11X21lbWtiLCB3YXMgaW50cm9kdWNlZCwgYWxvbmcgd2l0aCBh
bm90aGVyIGZ1bmN0aW9uCj4gYWxvbmcgdGhlIHNhbWUgbGluZXMuCj4gCj4gVGhpcyBBUEkgaXMg
bm90IHZlcnkgZ29vZC4gIEZpeGluZyBpdCB3YXMgbm90IGVudGlyZWx5IHRyaXZpYWwuCj4gKFRo
YW5rcyB0byBQYXVsIGZvciBleHBsYWluaW5nIHNvbWUgb2YgdGhlIGRpZmZpY3VsdGllcyBhbmQg
QW50aG9ueQo+IGZvciBpbi1wcmluY2lwbGUgcmV2aWV3IG9mIG15IHByb3Bvc2FsLikKPiAKPiBJ
YW4gSmFja3NvbiAoNik6Cj4gICAgbGlieGw6IE9mZmVyIEFQSSB2ZXJzaW9ucyAweDA0MDcwMCBh
bmQgMHgwNDA4MDAKPiAgICB4bDogUGFzcyBsaWJ4bF9kb21haW5fY29uZmlnIHRvIGZyZWVtZW0o
KSwgaW5zdGVhZCBvZiBiX2luZm8KPiAgICBsaWJ4bDogbGlieGxfX2RvbWFpbl9jb25maWdfc2V0
ZGVmYXVsdDogTmV3IGZ1bmN0aW9uCj4gICAgbGlieGw6IGxpYnhsX2RvbWFpbl9uZWVkX21lbW9y
eTogTWFrZSBpdCB0YWtlIGEgZG9tYWluX2NvbmZpZwo+ICAgIGxpYnhsOiBNb3ZlIHNoYWRvd19t
ZW1rYiBhbmQgaW9tbXVfbWVta2IgZGVmYXVsdGluZyBpbnRvIGxpYnhsCj4gICAgbGlieGw6IFJl
bW92ZS9kZXByZWNhdGUgbGlieGxfZ2V0X3JlcXVpcmVkXypfbWVtb3J5IGZyb20gdGhlIEFQSQo+
IAo+ICAgdG9vbHMvbGlieGwvbGlieGwuaCAgICAgICAgICB8IDI0ICsrKysrKysrKystCj4gICB0
b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyAgIHwgOTUgKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0KPiAgIHRvb2xzL2xpYnhsL2xpYnhsX2RvbS5jICAgICAgfCAg
NyArKy0tCj4gICB0b29scy9saWJ4bC9saWJ4bF9pbnRlcm5hbC5oIHwgMTAgKysrKysKPiAgIHRv
b2xzL2xpYnhsL2xpYnhsX21lbS5jICAgICAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLQo+ICAgdG9vbHMvbGlieGwvbGlieGxfdXRpbHMuYyAgICB8IDE1IC0tLS0tLS0KPiAg
IHRvb2xzL2xpYnhsL2xpYnhsX3V0aWxzLmggICAgfCAgMiArLQo+ICAgdG9vbHMveGwveGxfcGFy
c2UuYyAgICAgICAgICB8IDE1ICstLS0tLS0KPiAgIHRvb2xzL3hsL3hsX3ZtY29udHJvbC5jICAg
ICAgfCAgNiArLS0KPiAgIDkgZmlsZXMgY2hhbmdlZCwgMTgzIGluc2VydGlvbnMoKyksIDYxIGRl
bGV0aW9ucygtKQo+IAoKRm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
