Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 233FC74EF7
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 15:17:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqdZI-0005cb-3T; Thu, 25 Jul 2019 13:14:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XezG=VW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqdZH-0005cW-1X
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 13:13:59 +0000
X-Inumbo-ID: 0f02c4cb-aede-11e9-8980-bc764e045a96
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0f02c4cb-aede-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 13:13:57 +0000 (UTC)
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
IronPort-SDR: Io9aI/CVH26MDAOfEPPJ1oEeRSAclVcBTFw68ddRFPq0EPoYrcKC4zWkVumVqaNFUn2lNEAvg1
 CTq0E/xrtG+rIldtGhpg3Thz1xkNO1ERtsy0RzmWsuMNWPse5GRN2joPOWF12F/1y6Hwa/WFmW
 yEJ7hdMJAzfLnYHbBFp7rNjXMqdSwccdYKl4bqSiPsZU7hjEn8zblEne8weWdooeEpdPW3FhEs
 nqMH7aOTTVyJUnPS8gDUWqqf99h6bTZjHhQCKE/P37i5/rIYQSFAhgCLVsb5qfdr07QlCxWg7r
 21g=
X-SBRS: 2.7
X-MesageID: 3515107
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,306,1559534400"; 
   d="scan'208";a="3515107"
Date: Thu, 25 Jul 2019 15:13:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKdWwgMjUsIDIwMTkgYXQgMTI6NTQ6NDZQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjUuMDcuMjAxOSAxNDo0NCwgIEZyZWR5IFAuICB3cm90ZToKPiA+IE9uIFdlZCwg
MjAxOS0wNy0yNCBhdCAxNzo0MSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+Pj4+
IFdoYXQgaGFyZHdhcmUgaW50ZXJmYWNlIGRvZXMgdGhlcm1hbGQgKG9yIHRoZSBkcml2ZXIgaW4g
TGludXggaWYKPiA+Pj4+IHRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBk
YXRhPwo+ID4gCj4gPiBJbiBvdXIgaW5pdGlhbCBQT0MgdXNpbmcgWGVuIDQuOC54IHdlIHdoZXJl
IHVzaW5nIExpbnV4IGNvcmV0ZW1wIGRyaXZlcgo+ID4gcmVhZGluZyBieSBleGFtcGxlIC9jbGFz
cy9zeXMvaHdtb24vaHdtb24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QKPiA+IGRlcHJlY2F0ZWQg
YXQgY29tbWl0IDcyZTAzODQ1MGQzZDVkZTFhMzlmMGNmYTJkMmIwZjliM2Q0M2M2YzYKPiAKPiBI
bW0sIEkgd291bGRuJ3QgY2FsbCB0aGlzIGRlcHJlY2F0aW9uLCBidXQgYSByZWdyZXNzaW9uLiBJ
IHdvdWxkCj4gc2F5IHdlIHdhbnQgdG8gcmUtZXhwb3NlIHRoaXMgbGVhZiB0byBEb20wLCB0aGUg
bW9yZSB0aGF0IHRoZQo+IGNvbW1pdCBhbHNvIG9ubHkgbWVudGlvbnMgdW5wcml2aWxlZ2VkIGRv
bWFpbnMuIEFuZHJldz8KCkFGQUlDVCBmcm9tIHRoZSBkb2N1bWVudHMgcHJvdmlkZWQgYnkgRnJl
ZHkgdGhlIHRlbXBlcmF0dXJlIGlzIHJlYWQKZnJvbSBhIE1TUiB0aGF0IHJlcG9ydHMgdGhlIGN1
cnJlbnQgdGVtcGVyYXR1cmUgb2YgdGhlIGNvcmUgb24gd2hpY2gKdGhlIE1TUiBpcyByZWFkIGZy
b20uIFdoZW4gcnVubmluZyBvbiBYZW4gdGhpcyB3aWxsIG9ubHkgd29yawpjb3JyZWN0bHkgaWYg
ZG9tMCBpcyBnaXZlbiB0aGUgc2FtZSB2Q1BVcyBhcyBwQ1BVcyBhbmQgdGhvc2UgYXJlCmlkZW50
aXR5IHBpbm5lZC4KCk5vdCBzdXJlIGhvdyBjb21tb24gdGhpcyBNU1IgaW50ZXJmYWNlIGlzIGlu
IG9yZGVyIHRvIHJlYWQgdGhlcm1hbAp2YWx1ZXMsIGlmIHRoZSBpbnRlcmZhY2UgaXQncyBjb21t
b24gbWF5YmUgaXQncyBzb21ldGhpbmcgdGhhdCBjb3VsZApiZSBpbXBsZW1lbnRlZCBpbiBYZW4s
IGFuZCBleHBvcnRlZCBzb21laG93IHRvIGRvbTAsIG1heWJlIHVzaW5nCnN5c2N0bD8KCk9yIGVs
c2UgaGF2aW5nIGFuIGh5cGVyY2FsbCB0aGF0IGFsbG93cyBkb20wIHRvIHJlcXVlc3QgWGVuIHRv
IGV4ZWN1dGUKTVNSIHJlYWQvd3JpdGVzIG9uIGEgZ2l2ZW4gcENQVS4KClRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
