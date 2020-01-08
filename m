Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E31134112
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 12:47:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ip9lK-0006hD-Sm; Wed, 08 Jan 2020 11:44:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jtyv=25=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ip9lJ-0006h8-OQ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 11:44:33 +0000
X-Inumbo-ID: 37bf84dc-320c-11ea-875c-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 37bf84dc-320c-11ea-875c-bc764e2007e4;
 Wed, 08 Jan 2020 11:44:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CDBAFAE19;
 Wed,  8 Jan 2020 11:44:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-7-andrew.cooper3@citrix.com>
 <a0a29ae9-ae4b-f6bd-ed3b-66a810cfcde6@suse.com>
 <325d840e-f041-99ed-42d3-833cdfe9cfd3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <60c0d7b4-867b-d0e4-7d40-265f44e78445@suse.com>
Date: Wed, 8 Jan 2020 12:44:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <325d840e-f041-99ed-42d3-833cdfe9cfd3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 6/6] x86/boot: Drop INVALID_VCPU
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDEuMjAyMCAxOTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNy8wMS8yMDIw
IDE2OjUyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDYuMDEuMjAyMCAxNjo1NCwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4+PiArKysgYi94
ZW4vYXJjaC94ODYvc2V0dXAuYwo+Pj4gQEAgLTcwNSw3ICs3MDUsNyBAQCB2b2lkIF9faW5pdCBu
b3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+Pj4gICAgICAvKiBDcml0
aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZhdWx0IGlzIGRlYWRseSEgKi8K
Pj4+ICAKPj4+ICAgICAgc2V0X3Byb2Nlc3Nvcl9pZCgwKTsKPj4+IC0gICAgc2V0X2N1cnJlbnQo
SU5WQUxJRF9WQ1BVKTsgLyogZGVidWcgc2FuaXR5LiAqLwo+Pj4gKyAgICBzZXRfY3VycmVudChO
VUxMKTsgLyogZGVidWcgc2FuaXR5LiAqLwo+Pj4gICAgICBpZGxlX3ZjcHVbMF0gPSBjdXJyZW50
Owo+PiBJcyBhbnkgb2YgdGhpcyBhY3R1YWxseSBjaGFuZ2luZyBhbnkgdmFsdWUgaW4gbWVtb3J5
Pwo+IAo+IFllcy4gT2JzZXJ2ZToKPiAKPiDCoMKgwqAgLyogU2V0IHVwIHN0YWNrLiAqLwo+IMKg
wqDCoCBsZWHCoMKgwqDCoCBTVEFDS19TSVpFICsgc3ltX2VzaShjcHUwX3N0YWNrKSwgJWVzcAo+
IAo+IHR3aWNlIGluIGhlYWQuUywgbWVhbmluZyB0aGF0IHRoZSB0b3Atb2Ytc3RhY2sgYmxvY2sg
aXMganVuayBhdCB0aGlzIHBvaW50LgoKV2h5IGp1bmssIHdoZW4gd2UgaGF2ZQoKY2hhciBfX3Nl
Y3Rpb24oIi5ic3Muc3RhY2tfYWxpZ25lZCIpIF9fYWxpZ25lZChTVEFDS19TSVpFKQogICAgY3B1
MF9zdGFja1tTVEFDS19TSVpFXTsKCj4gRXhwbGljaXRseSBzZXR0aW5nIGl0IHRvIE5VTEwgaGVy
ZSBzZWVtcyBsaWtlIGEgc2FmZXIgb3B0aW9uIHRoYW4KPiB0cnVzdGluZyB0aGF0IG5vb25lIGhh
cyBhY3R1YWxseSB1c2VkIHRoZSBzdGFjayB5ZXQuCgpUaGUgYWN0dWFsICJzdGFjayIgcGFydCBv
ZiBjcHUwX3N0YWNrW10gbWF5IGhhdmUgYmVlbiB1c2VkIGFscmVhZHksCmJ1dCB0aGUgdG9wLW9m
LXN0YWNrIGJsb2NrIG91Z2h0IHRvIGJlIHVudG91Y2hlZCwgb3IgZWxzZSB3ZSBoYXZlCm90aGVy
IHByb2JsZW1zLiBBbnl3YXksIEkgZG9uJ3QgaGVhdmlseSBtaW5kIHdyaXRpbmcgc2V2ZXJhbCB6
ZXJvcwpvdmVyIHdoYXQgaXMgYWxyZWFkeSB6ZXJvIGhlcmUsIGl0IGp1c3Qgc2VlbXMgcHJldHR5
IHBvaW50bGVzcyAoYW5kCmluY3JlYXNpbmdseSBzbyBieSB5b3Ugbm93IHdyaXRpbmcgeWV0IGFu
b3RoZXIgemVybykuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
