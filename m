Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 497374B751
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:46:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZ05-00074B-Ol; Wed, 19 Jun 2019 11:43:37 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hdZ04-000746-8C
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:43:36 +0000
X-Inumbo-ID: 77de55d4-9287-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 77de55d4-9287-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 11:43:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 19 Jun 2019 05:43:33 -0600
Message-Id: <5D0A1FE202000078002399EF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 19 Jun 2019 05:43:30 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>,
 "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
 <20190619110250.18881-2-roger.pau@citrix.com>
 <1d011739-75a6-2d01-bfa7-8e8d042c18b9@citrix.com>
In-Reply-To: <1d011739-75a6-2d01-bfa7-8e8d042c18b9@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/4] xz: use initconst for hypervisor build
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE5LjA2LjE5IGF0IDEzOjA5LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMTkvMDYvMjAxOSAxMjowMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+PiBPciBl
bHNlIGNsYW5nIGFkZHMgYSAuaW5pdC5yb2RhdGEuY3N0OCBzZWN0aW9uIHRvIHRoZSByZXN1bHRp
bmcgb2JqZWN0Cj4+IGZpbGUsIHdoaWNoIGlzIG5vdCBoYW5kbGVkIGJ5IHRoZSBYZW4gbGlua2Vy
IHNjcmlwdCBhbmQgY2FuIGVuZCB1cAo+PiBiZWZvcmUgdGhlIHRleHQgc2VjdGlvbiB3aGljaCBj
b250YWlucyB0aGUgaGVhZGVycywgdGh1cyByZXN1bHRpbmcgaW4KPj4gYSBub3QgdXNhYmxlIGJp
bmFyeS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNp
dHJpeC5jb20+Cj4gCj4gSSB0aGluayBDbGFuZyBpcyBhY3R1YWxseSBhZGRpbmcgYSAucm9kYXRh
LmNzdDggc2VjdGlvbiwgYW5kIHRoZSBidWxrCj4gb2JqY29weSB0dXJucyBpdCBpbnRvIC5pbml0
LnJvZGF0YS5jc3Q4Lgo+IAo+IFRoaXMgaXMgYSBnb29kIGNoYW5nZSBzbyBSZXZpZXdlZC1ieTog
QW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiAoc3ViamVjdCB0byBz
b21lIGNsYXJpdHkgb3ZlciB0aGUgZXhhY3QKPiBzZWN0aW9uKSwgYnV0IEkgYWxzbyB0aGluayB0
aGlzIGlzIG5lZWRlZCBhcyB3ZWxsOgo+IAo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYveGVu
Lmxkcy5TIGIveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+IGluZGV4IGNiNDJkYzguLjRmMjMwNTkg
MTAwNjQ0Cj4gLS0tIGEveGVuL2FyY2gveDg2L3hlbi5sZHMuUwo+ICsrKyBiL3hlbi9hcmNoL3g4
Ni94ZW4ubGRzLlMKPiBAQCAtMjA2LDggKzIwNiw3IEBAIFNFQ1RJT05TCj4gICNlbmRpZgo+ICAK
PiAgICAgICAgICooLmluaXQucm9kYXRhKQo+IC0gICAgICAgKiguaW5pdC5yb2RhdGEucmVsKQo+
IC0gICAgICAgKiguaW5pdC5yb2RhdGEuc3RyKikKPiArICAgICAgICooLmluaXQucm9kYXRhLiop
Cj4gIAo+ICAgICAgICAgLiA9IEFMSUdOKFBPSU5URVJfQUxJR04pOwo+ICAgICAgICAgX19zZXR1
cF9zdGFydCA9IC47Cj4gQEAgLTIyMSw4ICsyMjAsNyBAQCBTRUNUSU9OUwo+ICAgICAgICAgX19p
bml0Y2FsbF9lbmQgPSAuOwo+ICAKPiAgICAgICAgICooLmluaXQuZGF0YSkKPiAtICAgICAgICoo
LmluaXQuZGF0YS5yZWwpCj4gLSAgICAgICAqKC5pbml0LmRhdGEucmVsLiopCj4gKyAgICAgICAq
KC5pbml0LmRhdGEuKikKPiAgICAgICAgIC4gPSBBTElHTig0KTsKPiAgICAgICAgIF9fdHJhbXBv
bGluZV9yZWxfc3RhcnQgPSAuOwo+ICAgICAgICAgKigudHJhbXBvbGluZV9yZWwpCgpBbmQgdGhl
IHNhbWUgdGhpbmcgdGhlbiBhbHNvIGZvciBBcm0uCgpKYW4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
