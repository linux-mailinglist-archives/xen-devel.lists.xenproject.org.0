Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27493BC471
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 11:04:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCghS-0001mx-W7; Tue, 24 Sep 2019 09:01:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCghS-0001ms-3t
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 09:01:34 +0000
X-Inumbo-ID: e741eb36-dea9-11e9-960f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id e741eb36-dea9-11e9-960f-12813bfff9fa;
 Tue, 24 Sep 2019 09:01:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C3721B66F;
 Tue, 24 Sep 2019 09:01:31 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <6de11867-b872-a2a1-7c26-af004164bfea@suse.com>
 <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6d5b8ac4-6787-0f01-fa6a-8301cbb9d5e3@suse.com>
Date: Tue, 24 Sep 2019 11:01:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b8b0d5e09c24b068ede852c4eab50dc@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 6/8] AMD/IOMMU: tidy struct ivrs_mappings
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDkuMjAxOSAxODoyNSwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3Rz
LnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgSmFuIEJldWxpY2gKPj4gU2VudDogMTkgU2Vw
dGVtYmVyIDIwMTkgMTQ6MjQKPj4gVG86IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+
PiBDYzogQW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFN1cmF2ZWUg
U3V0aGlrdWxwYW5pdCA8c3VyYXZlZS5zdXRoaWt1bHBhbml0QGFtZC5jb20+Cj4+IFN1YmplY3Q6
IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA2LzhdIEFNRC9JT01NVTogdGlkeSBzdHJ1Y3QgaXZyc19t
YXBwaW5ncwo+Pgo+PiBNb3ZlIHRoZSBkZXZpY2UgZmxhZ3MgZmllbGQgdXAgaW50byBhbiB1bnVz
ZWQgaG9sZSwgdGh1cyBzaHJpbmtpbmcKPj4gb3ZlcmFsbCBzdHJ1Y3R1cmUgc2l6ZSBieSA4IGJ5
dGVzLiBVc2UgYm9vbCBhbmQgdWludDxOPl90IGFzCj4+IGFwcHJvcHJpYXRlLiBEcm9wIHBvaW50
bGVzcyAocmVkdW5kYW50KSBpbml0aWFsaXphdGlvbnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAKPiBSZXZpZXdlZC1ieTogUGF1bCBEdXJy
YW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4gLi4uYWx0aG91Z2ggSSB3
b25kZXIuLi4KPiAKPj4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9hbWQtaW9tbXUuaAo+PiAr
KysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FtZC1pb21tdS5oCj4+IEBAIC0xMDYsMTIgKzEwNiwx
NiBAQCBzdHJ1Y3QgYW1kX2lvbW11IHsKPj4gIH07Cj4+Cj4+ICBzdHJ1Y3QgaXZyc19tYXBwaW5n
cyB7Cj4+IC0gICAgdTE2IGR0ZV9yZXF1ZXN0b3JfaWQ7Cj4+IC0gICAgdTggZHRlX2FsbG93X2V4
Y2x1c2lvbjsKPj4gLSAgICB1OCB1bml0eV9tYXBfZW5hYmxlOwo+PiAtICAgIHU4IHdyaXRlX3Bl
cm1pc3Npb247Cj4+IC0gICAgdTggcmVhZF9wZXJtaXNzaW9uOwo+PiArICAgIHVpbnQxNl90IGR0
ZV9yZXF1ZXN0b3JfaWQ7Cj4+ICAgICAgYm9vbCB2YWxpZDsKPj4gKyAgICBib29sIGR0ZV9hbGxv
d19leGNsdXNpb247Cj4+ICsgICAgYm9vbCB1bml0eV9tYXBfZW5hYmxlOwo+PiArICAgIGJvb2wg
d3JpdGVfcGVybWlzc2lvbjsKPj4gKyAgICBib29sIHJlYWRfcGVybWlzc2lvbjsKPiAKPiBDb3Vs
ZCB5b3Ugc2hyaW5rIHRoaXMgZXZlbiBtb3JlIGJ5IHVzaW5nIGEgYml0LWZpZWxkIGluc3RlYWQg
b2YgdGhpcyBzZXF1ZW5jZSBvZiBib29scz8KCkluZGVlZCBJIGhhZCBiZWVuIGNvbnNpZGVyaW5n
IHRoaXMuIEJlc2lkZXMgdGhlIGZhY3QgdGhhdCBtYWtpbmcKc3VjaCBhIG1vdmUgc2ltcGx5IGRp
ZG4ndCBsb29rIHRvIGZpdCBvdGhlciB0aGluZ3MgaGVyZSB2ZXJ5IHdlbGwKd2hlbiBpbnRyb2R1
Y2luZyB0aGUgInZhbGlkIiBmbGFnIGluIGFuIGVhcmxpZXIgcGF0aCwgYW5kIHRoZW4KYWxzbyBu
b3QgaGVyZSwgZG8geW91IHJlYWxpemUgdGhvdWdoIHRoYXQgdGhpcyB3b3VsZG4ndCBzaHJpbmsK
dGhlIHN0cnVjdHVyZSdzIHNpemUgcmlnaHQgbm93IChpLmUuIGl0IHdvdWxkIG9ubHkgYmUgcG90
ZW50aWFsbHkKcmVkdWNpbmcgZnV0dXJlIGdyb3d0aCk/IFRoaXMgd2FzIG15IG1haW4gYXJndW1l
bnQgYWdhaW5zdCBnb2luZwp0aGlzIGZ1cnRoZXIgc3RlcDsgbGV0IG1lIGtub3cgd2hhdCB5b3Ug
dGhpbmsuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
