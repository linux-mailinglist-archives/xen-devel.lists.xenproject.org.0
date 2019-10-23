Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C6BE1DA6
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 16:04:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNHBR-0006Bt-Vo; Wed, 23 Oct 2019 14:00:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Yzoh=YQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNHBP-0006BO-O2
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 14:00:15 +0000
X-Inumbo-ID: 6b7a18ba-f59d-11e9-947f-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b7a18ba-f59d-11e9-947f-12813bfff9fa;
 Wed, 23 Oct 2019 14:00:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D4FCAC23;
 Wed, 23 Oct 2019 14:00:07 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191011150253.29457-1-andrew.cooper3@citrix.com>
 <20191011153350.GM1389@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <725052c7-89a8-7007-376f-2478ce1ff880@suse.com>
Date: Wed, 23 Oct 2019 16:00:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191011153350.GM1389@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/VT-d: Drop unhelpful
 information in diagnostics
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTAuMjAxOSAxNzozMywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gRnJpLCBP
Y3QgMTEsIDIwMTkgYXQgMDQ6MDI6NTNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4g
VGhlIHZpcnR1YWwgYWRkcmVzcyBvZiB0aGUgYmFzZSBvZiB0aGUgSU9NTVUncyByZWdzdGVycyBp
cyBub3QgdXNlZnVsIGZvcgo+PiBkaWFnbm9zdGljIHB1cnBvc2VzLCBhbmQgaXMgcXVpdGUgdm9s
dW1pbm91cy4gIFRoZSBQQ0kgY29vcmRpbmF0ZXMgaXMgYnkgZmFyCj4+IHRoZSBtb3N0IHVzZWZ1
bCBwaWVjZSBvZiBpZGVudGlmeWluZyBpbmZvcm1hdGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gLS0tCj4+IENDOiBK
YW4gQmV1bGljaCA8SkJldWxpY2hAc3VzZS5jb20+Cj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3Jn
Pgo+PiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+IENDOiBK
dW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4+IENDOiBLZXZpbiBUaWFuIDxr
ZXZpbi50aWFuQGludGVsLmNvbT4KPj4gQ0M6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPj4KPj4gU3Vycm91bmRpbmcgcHJpbnRrKClzIGFsc28gaWRlbnRpZnkgdGhlIElPTU1VIGJ5
IFhlbidzIGludGVybmFsIElELCBidXQgdGhhdAo+PiBpcyBhbHNvIHByZXR0eSB1c2VsZXNzIGlu
Zm9ybWF0aW9uIHdoZW4gZGlhZ25vc2luZyBwcm9ibGVtcy4KPj4KPj4gUkZDIGZvci00LjEzLiAg
VGhpcyBpcyBhIG5pY2UgdG8gaGF2ZSBzdHlsaXN0aWMgaW1wcm92ZW1lbnQuCj4gCj4gSSBkb24n
dCB0aGluayB0aGUgcmVnaXN0ZXIgaXMgdXNlZnVsIGZvciBkZWJ1Z2dpbmcsIGF0IGxlYXN0IEkg
aGF2ZQo+IG5ldmVyIHVzZWQgaXQgbXlzZWxmLCBzbzoKPiAKPiBSZXZpZXdlZC1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpTZWVpbmcgdGhhdCB0aGVyZSBoYXNu
J3QgYmVlbiBhbiBhY2sgZnJvbSBLZXZpbiwgcGVyaGFwcyB0aGlzCnJhdGhlciBzaW1wbGUgY2hh
bmdlIGNhbiBnbyBpbiB3aXRob3V0PyBKdXN0IGluIGNhc2UKQWNrZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
