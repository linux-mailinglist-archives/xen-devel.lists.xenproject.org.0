Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88033D0CC3
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:26:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI97z-0001ih-HE; Wed, 09 Oct 2019 10:23:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dmlU=YC=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iI97y-0001ia-NS
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:23:30 +0000
X-Inumbo-ID: d5b2aa46-ea7e-11e9-97e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5b2aa46-ea7e-11e9-97e6-12813bfff9fa;
 Wed, 09 Oct 2019 10:23:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0513AE48;
 Wed,  9 Oct 2019 10:23:27 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
References: <d1ca6ac5-0ed4-200f-c4e0-7a657b8d8fa8@suse.com>
 <0945a089-6fdb-89aa-f5a8-b8cc35f83f17@citrix.com>
 <8a7e1532-36cd-0b68-3655-c9ce990087ce@suse.com>
 <921fcf16-66bc-c053-e4e4-823a38b7a4da@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <28975fef-3bff-9ef0-3043-f3cb7a639219@suse.com>
Date: Wed, 9 Oct 2019 12:23:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <921fcf16-66bc-c053-e4e4-823a38b7a4da@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86/mm: don't needlessly veto migration
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMTkgMTI6MjEsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gMTAvOS8xOSAxMTox
NiBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA4LjEwLjIwMTkgMTg6MzgsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiBPbiAwOC8xMC8yMDE5IDE3OjEwLCBKYW4gQmV1bGljaCB3cm90ZToK
Pj4+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBhdWwuZHVycmFudEBjaXRyaXguY29tPgo+Pj4+Cj4+
Pj4gTm93IHRoYXQgeGwuY2ZnIGhhcyBhbiBvcHRpb24gdG8gZXhwbGljaXRseSBlbmFibGUgSU9N
TVUgbWFwcGluZ3MgZm9yIGEKPj4+PiBkb21haW4sIG1pZ3JhdGlvbiBtYXkgYmUgbmVlZGxlc3Ns
eSB2ZXRvZWQgZHVlIHRvIHRoZSBjaGVjayBvZgo+Pj4+IGlzX2lvbW11X2VuYWJsZWQoKSBpbiBw
YWdpbmdfbG9nX2RpcnR5X2VuYWJsZSgpLgo+Pj4+IFRoZXJlIGlzIGFjdHVhbGx5IG5vIG5lZWQg
dG8gcHJldmVudCBsb2dkaXJ0eSBmcm9tIGJlaW5nIGVuYWJsZWQgdW5sZXNzCj4+Pj4gZGV2aWNl
cyBhcmUgYXNzaWduZWQgdG8gYSBkb21haW4uCj4+Pj4KPj4+PiBOT1RFOiBXaGlsZSBpbiB0aGUg
bmVpZ2hib3VyaG9vZCwgdGhlIGJvb2xfdCBwYXJhbWV0ZXIgdHlwZSBpbgo+Pj4+ICAgICAgICBw
YWdpbmdfbG9nX2RpcnR5X2VuYWJsZSgpIGlzIHJlcGxhY2VkIHdpdGggYSBib29sIGFuZCB0aGUg
Zm9ybWF0Cj4+Pj4gICAgICAgIG9mIHRoZSBjb21tZW50IGluIGFzc2lnbl9kZXZpY2UoKSBpcyBm
aXhlZC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50
QGNpdHJpeC5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPgo+Pj4+IFJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNl
LmNvbT4KPj4+Cj4+PiBTZXJpb3VzbHkgRkZTLsKgIFdoeSBhbSBJIGhhdmluZyB0byByZXBlYXQg
bXlzZWxmP8KgIFdoYXQgaWYgYW55IHdheQo+Pj4gdW5jbGVhciBvbiB0aGUgcHJldmlvdXMgdGhy
ZWFkcz8KPj4+Cj4+PiBOQUNLIE5BQ0sgTkFDSy4KPj4KPj4gV2l0aCBHZW9yZ2UgaGF2aW5nIGdp
dmVuIGhpcyBSLWIgSSdtIG5vdyBpbiBhbiBhd2t3YXJkIHBvc2l0aW9uOgo+PiBJIHNob3VsZG4n
dCBpZ25vcmUgdGhpcyB0cmlwbGUgTkFDSyBhbmQgY29tbWl0IHRoZSBwYXRjaCwgYnV0Cj4+IHRo
ZXJlJ3MgYWxzbyBubyBzZW5zaWJsZSB3YXkgZm9yd2FyZCBoZXJlIHdoaWNoIHdvdWxkIGFsbG93
IHRoZQo+PiByZWdyZXNzaW9uIHRvIGJlIHRha2VuIGNhcmUgb2Ygd2l0aG91dCBjb21taXR0aW5n
IHRoZSBwYXRjaCBpbgo+PiBpdHMgY3VycmVudCBzaGFwZS4gQXJlIHlvdSB3aWxsaW5nIHRvIHRh
a2UgYmFjayBhbGwgdGhyZWUgb2YgdGhlCj4+IE5BQ0tzLCBhbGxvd2luZyB1cyB0byBjb250aW51
ZSBkaXNjdXNzaW9uIG9uIHRoZSBjb250cm92ZXJzaWFsCj4+IHBhcnQgb2YgUGF1bCdzIHBhdGNo
IHdoaWxlIGFsc28gYWxsb3dpbmcgdGhlIG5vbi1jb250cm92ZXJzaWFsCj4+IHBhcnQgdG8gZ28g
aW4gcmlnaHQgYXdheT8KPiAKPiBSZWdhcmRsZXNzIG9mIHRoZSBtZXJpdHMgb2YgdGhlIGNoYW5n
ZSBBbmR5IHdhbnRzIHRvIHNlZSwgaXQncyBub3QgYSBvbmUKPiB0aGF0IHNob3VsZCBiZSBtYWRl
IGR1cmluZyBhIGZlYXR1cmUgZnJlZXplLgoKSW5kZWVkLiBTbyBlaXRoZXIgd2UgdGFrZSB0aGlz
IHBhdGNoIG9yIHdlIGhhdmUgdG8gcmV2ZXJ0IHRoZSBwYXRjaChlcykKaW50cm9kdWNpbmcgdGhl
IHJlZ3Jlc3Npb24uCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
