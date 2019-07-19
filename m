Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 071BB6E83E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 17:54:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoVA5-0008BQ-Jc; Fri, 19 Jul 2019 15:51:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vi2/=VQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hoVA4-0008BL-Ou
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 15:51:08 +0000
X-Inumbo-ID: 053ec5da-aa3d-11e9-8980-bc764e045a96
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 053ec5da-aa3d-11e9-8980-bc764e045a96;
 Fri, 19 Jul 2019 15:51:07 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ZH0/skXZOYFpc1O54m1nnR95vnRkUwSd3KLwkgt8gePTgKAm4XiM5aBHCZAeoyPub+QYA4ccpe
 a4NmXv9WIK4uB8jzouoTNsfG+JhmazyGCbBDMgJnQc05PIf6OKDqLV2ao/Du9K6r284LM6WQ6m
 UG2Y/uJjh9aTqCyVZBYbjGJunR7D6mLIJoS3E0IT+85GmOR8CABBC+URC4UkbpFR9hY+QgU/st
 HGTfA5csX4F0vD7KPHPVxMHMRaN007T2mOcMcXsg8vBPFzpvBonWGi63ZiqkIPPzvuBLUFyFOy
 Qi0=
X-SBRS: 2.7
X-MesageID: 3281444
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,283,1559534400"; 
   d="scan'208";a="3281444"
Date: Fri, 19 Jul 2019 16:51:04 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190719155104.GD1208@perard.uk.xensource.com>
References: <20190704144233.27968-1-anthony.perard@citrix.com>
 <20190704144233.27968-7-anthony.perard@citrix.com>
 <a91c8d00-a40b-3906-6432-b9e0c2953843@citrix.com>
 <20190719102008.GB1208@perard.uk.xensource.com>
 <03cc01a5-d6a8-84b7-d382-d83fadea486b@redhat.com>
 <c2f583f7-a88c-010a-115d-2df4457dba5e@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c2f583f7-a88c-010a-115d-2df4457dba5e@citrix.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Subject: Re: [Xen-devel] [PATCH v3 06/35] OvmfPkg/XenResetVector: Add new
 entry point for Xen PVH
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
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Jordan Justen <jordan.l.justen@intel.com>, devel@edk2.groups.io,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Laszlo Ersek <lersek@redhat.com>,
 Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMDM6NDE6NTJQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAxOS8wNy8yMDE5IDE1OjMzLCBMYXN6bG8gRXJzZWsgd3JvdGU6Cj4gPiBPbiAw
Ny8xOS8xOSAxMjoyMCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPj4gT24gRnJpLCBKdWwgMDUs
IDIwMTkgYXQgMDI6NTc6MDZQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+Pj4gT24g
MDQvMDcvMjAxOSAxNTo0MiwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gPj4+PiBkaWZmIC0tZ2l0
IGEvT3ZtZlBrZy9YZW5SZXNldFZlY3Rvci9JYTE2L1Jlc2V0VmVjdG9yVnRmMC5hc20gYi9Pdm1m
UGtnL1hlblJlc2V0VmVjdG9yL0lhMTYvUmVzZXRWZWN0b3JWdGYwLmFzbQo+ID4+Pj4gbmV3IGZp
bGUgbW9kZSAxMDA2NDQKPiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAuLjk1ODE5NWJjNWUKPiA+Pj4+
IC0tLSAvZGV2L251bGwKPiA+Pj4+ICsrKyBiL092bWZQa2cvWGVuUmVzZXRWZWN0b3IvSWExNi9S
ZXNldFZlY3RvclZ0ZjAuYXNtCj4gPj4+PiArdnRmU2lnbmF0dXJlOgo+ID4+Pj4gKyAgICBEQiAg
ICAgICdWJywgJ1QnLCAnRicsIDAKPiA+Pj4+ICsKPiA+Pj4+ICtBTElHTiAgIDE2Cj4gPj4+PiAr
Cj4gPj4+PiArcmVzZXRWZWN0b3I6Cj4gPj4+PiArOwo+ID4+Pj4gKzsgUmVzZXQgVmVjdG9yCj4g
Pj4+PiArOwo+ID4+Pj4gKzsgVGhpcyBpcyB3aGVyZSB0aGUgcHJvY2Vzc29yIHdpbGwgYmVnaW4g
ZXhlY3V0aW9uCj4gPj4+PiArOwo+ID4+Pj4gKyAgICBub3AKPiA+Pj4+ICsgICAgbm9wCj4gPj4+
IFdoeSB0d28gbm9wcz8KPiA+PiBJIGRvbid0IGtub3csIHRoaXMgaXMgZXhpc3RpbmcgY29kZSB0
aGF0IEkgZHVwbGljYXRlZCB0byBhbGxvdyBhZGRpbmcgYQo+ID4+IG5ldyBlbnRyeSBwb2ludC4g
KEkgd2FudGVkIHRvIHVzZSAtLWZpbmQtY29waWVzLWhhcmRlciB3aGVuIHNlbmRpbmcgdGhlCj4g
Pj4gcGF0Y2gsIGJ1dCBmb3Jnb3QgdGhpcyB0aW1lLgo+ID4gTm90IGEgYmlnIHByb2JsZW07IHdo
aWxlIHJldmlld2luZyB2MywgSSBkaWQgc3VjaCBjb21wYXJpc29ucyBteXNlbGYsIGluCj4gPiBt
eSBsb2NhbCBjbG9uZS4gRmVlbCBmcmVlIHRvIHNraXAgIi0tZmluZC1jb3BpZXMtaGFyZGVyIiB3
aGVuIHBvc3RpbmcgdjQKPiA+IHRvbzsgSSB0aGluayB0aGVyZSBpc24ndCBtdWNoIGNodXJuIGdv
aW5nIG9uIGluIHBhcmFsbGVsIHJpZ2h0IG5vdy4KPiA+Cj4gPiBIb3dldmVyLCBhIG5ldyByZXF1
ZXN0IGZvciB2NDogcGxlYXNlIG1ha2Ugc3VyZSB0aGF0IHRoZSBuZXcgbW9kdWxlcyAvCj4gPiBw
YXRocyBpbnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2ggc2V0IGFyZSBjb3ZlcmVkIGluIE1haW50YWlu
ZXJzLnR4dC4KCldpbGwgZG8uCgo+ID4+IFRoaXMgcGFydCBvZiB0aGUgY2h1bmsgd291bGQgbm90
IGJlIHRoZXJlLikKPiA+IFJlZ2FyZGluZyB0aGUgTk9QczogYWxsIEkgY2FuIHRlbGwgeW91IGlz
IHRoYXQgdGhleSBvcmlnaW5hdGUgZnJvbQo+ID4gY29tbWl0IDgzMzI5ODNlMmUzMyAoIlVlZmlD
cHVQa2c6IFJlcGxhY2UgdGhlIHVuLW5lY2Vzc2FyeSBXQklOVkQKPiA+IGluc3RydWN0aW9uIGF0
IHRoZSByZXNldCB2ZWN0b3Igd2l0aCB0d28gTk9QcyBpbiBWVEYwLiIsIDIwMTEtMDgtMDQpLgo+
ID4KPiA+IFdoZXRoZXIgdGhhdCBjaGFuZ2UgbWFkZSBzZW5zZSBiYWNrIHRoZW4sIGxldCBhbG9u
ZSBpZiBpdCBtYWtlcyBzZW5zZQo+ID4gbm93OiBubyBjbHVlLgo+IAo+IERyb3BwaW5nIHdiaW52
ZCBtYWtlcyBzZW5zZSwgYmVjYXVzZSB3aGVuIHZpcnR1YWxpc2VkLCB0aGUgY2FjaGVzIChhbmQK
PiBwYWdpbmcgZm9yIHRoYXQgbWF0dGVyKSBhcmUgYWx3YXlzIHVwIGFuZCBydW5uaW5nIGNvcnJl
Y3RseS7CoCBJdHMgYW4KPiB1bm5lY2Vzc2FyeSB2bWV4aXQgZm9yIHNvbWV0aGluZyB3aGljaCB0
aGUgaHlwZXJ2aXNvciB3aWxsIG5vcCBvdXQgYW55d2F5Lgo+IAo+IExlYXZpbmcgdHdvIG5vcHMg
YmVoaW5kIG1ha2VzIG5vIHNlbnNlIGF0IGFsbC4KCkknbGwgcmVtb3ZlIHRoZSBub3BzLgoKVGhh
bmtzLAoKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
