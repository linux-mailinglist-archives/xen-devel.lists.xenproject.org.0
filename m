Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF99D19E29
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:28:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5XG-0003Mp-Px; Fri, 10 May 2019 13:26:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=thpN=TK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hP5XF-0003Me-22
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:26:01 +0000
X-Inumbo-ID: 26b58046-7327-11e9-b313-3304713ddcc8
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 26b58046-7327-11e9-b313-3304713ddcc8;
 Fri, 10 May 2019 13:26:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED376374;
 Fri, 10 May 2019 06:25:59 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B82C73F575;
 Fri, 10 May 2019 06:25:58 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
References: <20190507151458.29350-1-julien.grall@arm.com>
 <20190507151458.29350-4-julien.grall@arm.com>
 <5CD5620E020000780022D7CF@prv1-mh.provo.novell.com>
 <4cef7816-74da-b6e6-6f7d-e327edb083da@arm.com>
 <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b0dc05a5-3b2e-669a-a955-1a543b3e7581@arm.com>
Date: Fri, 10 May 2019 14:25:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CD57B78020000780022D888@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 03/14] xen/x86: Make mfn_to_gfn typesafe
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Wei Liu <wei.liu2@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMC8wNS8yMDE5IDE0OjI0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAxMC4wNS4x
OSBhdCAxNTowMiwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPiAKPj4KPj4gT24gMTAv
MDUvMjAxOSAxMjozNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+PiBPbiAwNy4wNS4xOSBhdCAx
NzoxNCwgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4+PiAtLS0gYS94ZW4vYXJjaC94
ODYvbW0vc2hhZG93L2NvbW1vbi5jCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL3NoYWRvdy9j
b21tb24uYwo+Pj4+IEBAIC00NzQsNyArNDc0LDggQEAgc3RhdGljIGlubGluZSB2b2lkIHRyYWNl
X3Jlc3luYyhpbnQgZXZlbnQsIG1mbl90IGdtZm4pCj4+Pj4gICAgICAgIGlmICggdGJfaW5pdF9k
b25lICkKPj4+PiAgICAgICAgewo+Pj4+ICAgICAgICAgICAgLyogQ29udmVydCBnbWZuIHRvIGdm
biAqLwo+Pj4+IC0gICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gbWZuX3RvX2dmbihjdXJyZW50
LT5kb21haW4sIGdtZm4pOwo+Pj4+ICsgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuID0gZ2ZuX3go
bWZuX3RvX2dmbihjdXJyZW50LT5kb21haW4sIGdtZm4pKTsKPj4+PiArCj4+Pj4gICAgICAgICAg
ICBfX3RyYWNlX3ZhcihldmVudCwgMC8qIXRzYyovLCBzaXplb2YoZ2ZuKSwgJmdmbik7Cj4+Pj4g
ICAgICAgIH0KPj4+Cj4+PiBDYW4ndCB5b3UgdXNlIGdmbl90IGhlcmUsIGFuZCBoZW5jZSBhdm9p
ZCB0aGUgZ2ZuX3goKT8gU2FtZSBhZ2FpbiBmdXJ0aGVyCj4+PiBkb3duLgo+PiBCZWNhdXNlIF9f
dHJhY2VfdmFyIHdpbGwgZXhwb3J0IHRoZSB2YWx1ZSB0byB0aGUgZ3Vlc3QuIEkgd2Fzbid0IHN1
cmUKPj4gd2hldGhlciB3ZQo+PiBjYW4gc2FmZWx5IGNvbnNpZGVyIHRoYXQgZ2ZuX3QgaXMgZXhh
Y3RseSB0aGUgc2FtZSBhcyB1bnNpZ25lZCBsb25nIGluCj4+IGRlYnVnLWJ1aWxkLgo+IAo+IEht
bSwgd2VsbCAtIHNlZSB0aGUgZGVmaW5pdGlvbiBvZiBnZm5fdC4gR2VvcmdlLCB3aGF0IGRvIHlv
dSB0aGluaz8KCkkga25vdyB3aGF0J3MgdGhlIGN1cnJlbnQgZGVmaW5pdGlvbi4gTXkgcG9pbnQg
aXMgd2UgbmV2ZXIgbWFkZSB0aGF0IGFzc3VtcHRpb24gCmJlZm9yZS4gSW4gYWxsIGhvbmVzdHks
IHN1cmUgYXNzdW1wdGlvbiB3b3VsZCBkZWZpbml0ZWx5IGhlbHAgaW4gYSBmZXcgcGxhY2VzLCAK
YnV0IEkgdGhpbmsgd2Ugb3VnaHQgdG8gc2FmZWd1YXJkIHdpdGggQlVJTERfQlVHKC4uLikuCgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
