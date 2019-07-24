Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C95D731D9
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 16:38:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqIO0-0000OC-4k; Wed, 24 Jul 2019 14:36:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UCFt=VV=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hqINy-0000O3-Pd
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 14:36:54 +0000
X-Inumbo-ID: 7a8ec302-ae20-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a8ec302-ae20-11e9-8980-bc764e045a96;
 Wed, 24 Jul 2019 14:36:53 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: nWydUCHmxN4FRIYlNQ+3AtC2v2FA7uHJRIFYesDco9LnWDtMXaRRdQyNUrMj6CZxbLp6lOxROY
 q7YLPSSc2qdKzZSy6yhbs3sDw9geA7IFqOxor8RD9wZW2zcrCxCzRHWgFfft1zfxi3yZdb41Qo
 0UuzEBhL9m2pr+wgGu64JZJr1JgD2D0YUxo12LRg55IeTV6ZuIKyxEuOqYEUl3BcFM7hYngihr
 OSuCg9J8apz+OqDhjyS7b7PKtbxUQJS7ARTWetY+VcUsyAS+f9wmuAQmaBCE/AgN7BnCZNuFyI
 ZGw=
X-SBRS: 2.7
X-MesageID: 3371323
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,303,1559534400"; 
   d="scan'208";a="3371323"
Date: Wed, 24 Jul 2019 16:36:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Fredy P. <fredy.pulido@savoirfairelinux.com>
Message-ID: <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTA6MDE6NDBBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6
Cj4gSGVsbG8sCj4gCj4gTXkgb2JqZWN0aXZlIGlzIHRvIGdldCBDUFUgZnJlcXVlbmN5IHRocm90
dGxpbmcgYmFzZWQgb24gdGhlCj4gdGVtcGVyYXR1cmUgaW4gYSBYZW4vT3BlbldSVChkb20wKSBz
eXN0ZW0uCj4gCj4gQWZ0ZXIgdG8gZXhwZW5kIGhvdXJzIHJlYWRpbmcgWGVuJ3Mgd2lraSwgbWFp
bGluZyBsaXN0IGFyY2hpdmVzLAo+IGNvbW1pdHMsIGdvb2dsaW5nIGFuZCBhc2tpbmcgaW4gdGhl
IElSQyBjaGFubmVsIEknbSBjb21pbmcgaGVyZSBhc2tpbmcKPiBmb3IgaGVscCBiZWNhdXNlIEkg
aG9wZSB0aGVyZSBpcyBzb21ldGhpbmcgSSBtaXNzIGFuZCB5b3UgY291bGQgcG9pbnQKPiBpdC4K
ClRoYXQgc2VlbXMgbGlrZSBhbiBpbnRlcmVzdGluZyBwcm9qZWN0LCBJIGd1ZXNzIHlvdXIgZm9j
dXMgaXMgc29tZQpraW5kIG9mIGxvdy1wb3dlciBkZXZpY2U/IChub3QgdGhhdCBpdCBtYXR0ZXJz
IG11Y2ggZm9yIHRoZSBjb250ZXh0IG9mCnRoZSBxdWVzdGlvbikuCgpBbnl3YXksIHRoYW5rcyBm
b3IgeW91ciBpbnRlcmVzdCBvbiBYZW4gYW5kIHdheXMgdG8gaW1wcm92ZSBpdCEKCj4gTXkgZmly
c3QgcXVlc3Rpb24gaXMsIHRoZXJlIGlzIGFueSB3YXkgdG8gZG8gQ1BVIGZyZXF1ZW5jeSB0aHJv
dHRsaW5nCj4gYmFzZWQgb24gdGhlIHRlbXBlcmF0dXJlPwoKSSBkb24ndCB0aGluayB0aGVyZSdz
IHN1Y2ggZ292ZXJub3IgQVRNIGltcGxlbWVudGVkIGluIFhlbiwgdGhlIG1vcmUKdGhhdCBJIHRo
aW5rIGFsbCBmcmVxdWVuY3kgdGhyb3R0bGluZyBpcyBzdXBwb3NlZCB0byBiZSBkb25lIGJ5IGRv
bTAKdXNpbmcgeGVucG0sIGJ1dCBub3QgWGVuIGl0c2VsZj8KCj4gSWYgdGhlIGFuc3dlciBmb3Ig
Zmlyc3QgcXVlc3Rpb24gaXMgbm90LCB0aGVuIHRoZXJlIGlzIGFueSB3YXkgdG8gZ2V0Cj4gdGhl
IENQVSB0ZW1wZXJhdHVyZSBmcm9tIERvbTA/ICh0aGlzIHdheSB3ZSBjb3VsZCB1c2UgSW50ZWwn
cyB0aGVybWFsZAo+IGFuZCBtb2RpZnkgaXQgdG8gdXNlIHhlbnBtIHRvIGNoYW5nZSB0aGUgY3B1
ZnJlcSkuCgpXaGF0IGhhcmR3YXJlIGludGVyZmFjZSBkb2VzIHRoZXJtYWxkIChvciB0aGUgZHJp
dmVyIGluIExpbnV4IGlmCnRoZXJlJ3Mgb25lKSB1c2UgdG8gZ2V0IHRoZSB0ZW1wZXJhdHVyZSBk
YXRhPwoKSXMgaXQgZXhwb3NlZCBpbiBhIG1taW8gcmVnaW9uIHNvbWV3aGVyZT8gT3IgbWF5YmUg
ZXhwb3NlZCBhcyBhIHBjaQpkZXZpY2U/Cgo+IElmIG9uZSBhbmQgdHdvIGFyZSBub3QsIGRvIHlv
dSB0aGluayB0aGF0IHRoZSByaWdodCBwYXRoIGlzIHRvIG1vZGlmeQo+ICBsaW51eC9kcml2ZXJz
L3hlbi94ZW4tYWNwaS1wcm9jZXNzb3IuYyBvciB5b3UgaGF2ZSBhbnkgb3RoZXIgaWRlYXM/CgpJ
IHRoaW5rIGl0IGRlcGVuZHMgb24gaG93IHRoaXMgZGF0YSBpcyBleHBvc2VkIGJ5IHRoZSBoYXJk
d2FyZS4KCj4gVGhhbmtzCj4gCj4gLS0gCj4gRnJlZHkgUHVsaWRvLAo+IENvbnN1bHRhbnQgZW4g
bG9naWNpZWwgbGlicmUKPiBJbmZyYXN0cnVjdHVyZSwgSW5mb251YWdpcXVlIGV0IGFyY2hpdGVj
dHVyZSBkZSBzeXN0w6htZXMKPiBTYXZvaXItZmFpcmUgTGludXgsIE1vbnRyw6lhbCwgUWMKPiBC
dXJlYXUgOiAoKyAxKSA1MTQgMjc2LTU0NjggcC40MTAgCj4gCj4gTWVzc2FnZSBkZSBjb25maWRl
bnRpYWxpdMOpIDoKPiBDZSBjb3VycmllbCAoZGUgbcOqbWUgcXVlIGxlcyBmaWNoaWVycyBqb2lu
dHMpIGVzdCBzdHJpY3RlbWVudCByw6lzZXJ2w6kgw6AKPiBsJ3VzYWdlIGRlIGxhIHBlcnNvbm5l
IG91IGRlIGwnZW50aXTDqSDDoCBxdWkgaWwgZXN0IGFkcmVzc8OpIGV0IHBldXQKPiBjb250ZW5p
ciBkZSBsJ2luZm9ybWF0aW9uIHByaXZpbMOpZ2nDqWUgZXQgY29uZmlkZW50aWVsbGUuCj4gVG91
dGUgZGl2dWxnYXRpb24sIGRpc3RyaWJ1dGlvbiBvdSBjb3BpZSBkZSBjZSBjb3VycmllbCBlc3Qg
c3RyaWN0ZW1lbnQKPiBwcm9oaWLDqWUuCj4gU2kgdm91cyBhdmV6IHJlw6d1IGNlIGNvdXJyaWVs
IHBhciBlcnJldXIsIHZldWlsbGV6IG5vdXMgZW4gYXZpc2VyIHN1ci0KPiBsZS1jaGFtcCwgZMOp
dHJ1aXJlIHRvdXRlcyBsZXMgY29waWVzIGV0IGxlIHN1cHByaW1lciBkZSB2b3RyZSBzeXN0w6ht
ZQo+IGluZm9ybWF0aXF1ZS4KCkFkZGluZyBhIGNvbmZpZGVudGlhbGl0eSBmb290ZXIgdG8gYW4g
ZW1haWwgc2VudCB0byBhIHB1YmxpYyBtYWlsaW5nCmxpc3QgaXMgcG9pbnRsZXNzLCBkbyB5b3Ug
a25vdyB0aGUgd2hvbGUgbWFpbGluZyBsaXN0IGFyY2hpdmVzIGFyZQpwdWJsaWNseSBhY2Nlc3Np
YmxlIGF0OgoKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1k
ZXZlbC8KCkZvciBhbnlvbmUgdG8gcmVhZD8KClJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
