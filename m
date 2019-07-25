Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988AF75019
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:51:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqe6G-0001qE-09; Thu, 25 Jul 2019 13:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqe6E-0001q8-Cs
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:48:02 +0000
X-Inumbo-ID: d061c928-aee2-11e9-901f-731f42f80427
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d061c928-aee2-11e9-901f-731f42f80427;
 Thu, 25 Jul 2019 13:47:59 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pk6fpIjX0A71NGHzBpYgwz5Q1EHjCILGM9Wom/FBTbP7J/GTUizZOOuWRbtCDJuD8XR8sdHXGc
 mYN3+kJvgb9nOM3RLsLSbFUi+LsE2bbmR3FZoP5iaGF2I0wJf5yySTBrEmdWWLl/ZdGuLlhjpF
 i75h1aCv4tf63iLvEICitnMemiAJnjGTdRioaKAywiYbZUOk7zshHNIRsjHIO/nC9uxKz9RC2M
 LrnaWgOxkzSsBSwwmwq2S2o9aJng8kqQZ9PFz2W7SaIzc9iPDi3Lz+WDmIdGACS7s0KuSoQeEi
 lH8=
X-SBRS: 2.7
X-MesageID: 3460179
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3460179"
Date: Thu, 25 Jul 2019 15:47:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Fredy P. <fredy.pulido@savoirfairelinux.com>
Message-ID: <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMDk6Mjk6MDFBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6
Cj4gT24gVGh1LCAyMDE5LTA3LTI1IGF0IDE1OjEzICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdy
b3RlOgo+ID4gT24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NTQ6NDZQTSArMDAwMCwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4gPiA+IE9uIDI1LjA3LjIwMTkgMTQ6NDQsICBGcmVkeSBQLiAgd3JvdGU6
Cj4gPiA+ID4gT24gV2VkLCAyMDE5LTA3LTI0IGF0IDE3OjQxICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gPiA+ID4gPiA+IFdoYXQgaGFyZHdhcmUgaW50ZXJmYWNlIGRvZXMgdGhl
cm1hbGQgKG9yIHRoZSBkcml2ZXIgaW4KPiA+ID4gPiA+ID4gPiBMaW51eCBpZgo+ID4gPiA+ID4g
PiA+IHRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBkYXRhPwo+ID4gPiA+
IAo+ID4gPiA+IEluIG91ciBpbml0aWFsIFBPQyB1c2luZyBYZW4gNC44Lnggd2Ugd2hlcmUgdXNp
bmcgTGludXggY29yZXRlbXAKPiA+ID4gPiBkcml2ZXIKPiA+ID4gPiByZWFkaW5nIGJ5IGV4YW1w
bGUgL2NsYXNzL3N5cy9od21vbi9od21vbjAvdGVtcDNfaW5wdXQgYnV0IGl0IGdvdAo+ID4gPiA+
IGRlcHJlY2F0ZWQgYXQgY29tbWl0IDcyZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0
M2M2YzYKPiA+ID4gCj4gPiA+IEhtbSwgSSB3b3VsZG4ndCBjYWxsIHRoaXMgZGVwcmVjYXRpb24s
IGJ1dCBhIHJlZ3Jlc3Npb24uIEkgd291bGQKPiA+ID4gc2F5IHdlIHdhbnQgdG8gcmUtZXhwb3Nl
IHRoaXMgbGVhZiB0byBEb20wLCB0aGUgbW9yZSB0aGF0IHRoZQo+ID4gPiBjb21taXQgYWxzbyBv
bmx5IG1lbnRpb25zIHVucHJpdmlsZWdlZCBkb21haW5zLiBBbmRyZXc/Cj4gPiAKPiA+IEFGQUlD
VCBmcm9tIHRoZSBkb2N1bWVudHMgcHJvdmlkZWQgYnkgRnJlZHkgdGhlIHRlbXBlcmF0dXJlIGlz
IHJlYWQKPiA+IGZyb20gYSBNU1IgdGhhdCByZXBvcnRzIHRoZSBjdXJyZW50IHRlbXBlcmF0dXJl
IG9mIHRoZSBjb3JlIG9uIHdoaWNoCj4gPiB0aGUgTVNSIGlzIHJlYWQgZnJvbS4gV2hlbiBydW5u
aW5nIG9uIFhlbiB0aGlzIHdpbGwgb25seSB3b3JrCj4gPiBjb3JyZWN0bHkgaWYgZG9tMCBpcyBn
aXZlbiB0aGUgc2FtZSB2Q1BVcyBhcyBwQ1BVcyBhbmQgdGhvc2UgYXJlCj4gPiBpZGVudGl0eSBw
aW5uZWQuCj4gCj4gSSBqdXN0IHdhbnQgdG8gYmUgc3VyZSBJIGdvdCBpdCBjb3JyZWN0bHksIGJ5
IHNheWluZyAiV2hlbiBydW5uaW5nIG9uCj4gWGVuIHRoaXMgd2lsbCBvbmx5IHdvcmsgY29ycmVj
dGx5IGlmIC4uLiIgbWVhbnMgaW4gYSBmdXR1cmUKPiBpbXBsZW1lbnRhdGlvbiBvciB0aGF0IHJp
Z2h0IG5vdyBjb3VsZCB3b3JrIGlmIEkgcGluIHRoaXMgdi9wQ1BVUz8KCk5vLCByaWdodCBub3cg
dGhlcmUncyBubyB3YXkgdG8gZ2V0IHRoaXMgZGF0YSBmcm9tIGRvbTAsIHJlZ2FyZGxlc3Mgb2YK
dGhlIHBpbm5pbmcuCgpUaGUgY29tbWl0IHlvdSBtZW50aW9uIHNpbXBseSByZW1vdmVzIGV4cG9z
aW5nIHRoZSBmZWF0dXJlIG9uIENQVUlELApidXQgSSdtIG5vdCBzdXJlIHdoZXRoZXIgYWNjZXNz
IHRvIHRoZSBhY3R1YWwgTVNSIGlzIGFsc28gZm9yYmlkZGVuLiBJCnRoaW5rIHNvIHNpbmNlIHdl
IGRvIE1TUiB3aGl0ZSBsaXN0aW5nIElJUkMsIGFuZCBJIGRvbid0IHNlZW0gdG8gZmluZApNU1Jf
SUEzMl9USEVSTV9TVEFUVVMgd2hpdGUgbGlzdGVkIGFueXdoZXJlLgoKUm9nZXIuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
