Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69437BEC3
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 13:00:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsmIX-0007pg-JE; Wed, 31 Jul 2019 10:57:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ohEi=V4=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hsmIV-0007pa-UG
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 10:57:31 +0000
X-Inumbo-ID: fd6c1376-b381-11e9-bbb2-5714af3b1a95
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd6c1376-b381-11e9-bbb2-5714af3b1a95;
 Wed, 31 Jul 2019 10:57:30 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +dTNdH9iXmeh2H5kqz2lurlee8YodkX40gNNdZllm91MbOT22qW07LDT9GPCU/3MGsfJkP6Lk5
 0SpvCJwGcQW5lWmB+34MK/EVLSxUOCs/lT1exxazDZFb+xg/vKNF8ckqS6Dp1Kl4hDX0/kJGXl
 i+NPi+a8IF+d7vxI2iWxP5J8aCQKnBLfVL9zo9mKU32z7MoaD54UuQwCYoPYLU6XS8/dna8wCT
 tySrS+wqjbpRLpkM2lj8An1hWbyikXlYqM06Vdh8BS8Upsf5ceZb2/YEaD1NhMQHem995I0Qyr
 yZ4=
X-SBRS: 2.7
X-MesageID: 3774686
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,330,1559534400"; 
   d="scan'208";a="3774686"
Date: Wed, 31 Jul 2019 12:57:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190731105344.m4e76v7bole4x2wf@Air-de-Roger>
References: <20190730170754.31389-1-andrew.cooper3@citrix.com>
 <20190731084723.vjkgdvolsfzuk4tp@Air-de-Roger>
 <423fdc54-eaa0-5b7b-2b6a-61d3171f2f21@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <423fdc54-eaa0-5b7b-2b6a-61d3171f2f21@citrix.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] x86/boot: Fix build dependenices for reloc.c
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTA6NTc6MzZBTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAzMS8wNy8yMDE5IDA5OjQ3LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4g
T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDY6MDc6NTRQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiA+PiBjL3MgMjAxZjg1MmVhZiBhZGRlZCBzdGFydF9pbmZvLmggYW5kIGtjb25maWcu
aCB0byByZWxvYy5jLCBidXQgb25seSB1cGRhdGVkCj4gPj4gc3RhcnRfaW5mby5oIGluIFJFTE9D
X0RFUFMuCj4gPj4KPiA+PiBUaGlzIGNhdXNlcyByZWxvYy5jIHRvIG5vdCBiZSByZWdlbmVyYXRl
ZCB3aGVuIEtjb25maWcgY2hhbmdlcy4gIEl0IGlzIG1vc3QKPiA+PiBub3RpY2VhYmxlIHdoZW4g
ZW5hYmxpbmcgQ09ORklHX1BWSCBhbmQgZmluZGluZyB0aGUgcmVzdWx0aW5nIGJpbmFyeSBjcmFz
aAo+ID4+IGVhcmx5IHdpdGg6Cj4gPj4KPiA+PiAgIChkOSkgKFhFTikKPiA+PiAgIChkOSkgKFhF
TikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKgo+ID4+ICAgKGQ5KSAo
WEVOKSBQYW5pYyBvbiBDUFUgMDoKPiA+PiAgIChkOSkgKFhFTikgTWFnaWMgdmFsdWUgaXMgd3Jv
bmc6IGMyYzJjMmMyCj4gPj4gICAoZDkpIChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioKPiA+PiAgIChkOSkgKFhFTikKPiA+PiAgIChkOSkgKFhFTikgUmVib290
IGluIGZpdmUgc2Vjb25kcy4uLgo+ID4+ICAgKFhFTikgZDl2MCBUcmlwbGUgZmF1bHQgLSBpbnZv
a2luZyBIVk0gc2h1dGRvd24gYWN0aW9uIDEKPiA+Pgo+ID4+IFJlcG9ydGVkLWJ5OiBQYXVsIER1
cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZS5ycGF1QGNpdHJpeC5jb20+Cj4gCj4gOikgSSBjYW4gdXNlIHRo
YXQgdGFnIGlmIHlvdSdkIGxpa2UuCgpPdWNoLCBJIHRoaW5rIGl0IGRvZXNuJ3QgcmVhbGx5IG1h
dHRlciBiZWNhdXNlIHRoZSBkb3RzIGFyZSBhY3R1YWxseQpzdHJpcHBlZCwgc28gaXQgYWxsIGVu
ZHMgdXAgYXQgcm9nZXJwYXVALiBJbiBhbnkgY2FzZToKClJldmlld2VkLWJ5OiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4gPgo+ID4gTm90ZSBzdXJlIGlmIGl0J3Mg
d29ydGggc3BlbGxpbmcgb3V0IHRoYXQgbXVsdGlib290LmggZGVwZW5kZW5jeSB3YXMKPiA+IGFs
c28gbWlzc2luZy4KPiAKPiBUaGUgZGVsdGEgdG8gbXVsdGlib290Lmggd2FzIGEgY29uc2VxdWVu
Y2Ugb2YgcmVmb3JtYXR0aW5nLsKgIEl0IHdhcwo+IHByZXNlbnQgYmVmb3JlLgoKQXJnLCB5ZXMs
IGRpZG4ndCBwYXkgZW5vdWdoIGF0dGVudGlvbi4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
