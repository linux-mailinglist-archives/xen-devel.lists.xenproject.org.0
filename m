Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DED1509B8
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 16:22:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iydWT-00025M-7S; Mon, 03 Feb 2020 15:20:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BfOp=3X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iydWR-00024a-1Q
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 15:20:23 +0000
X-Inumbo-ID: b16c6d90-4698-11ea-8e6f-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b16c6d90-4698-11ea-8e6f-12813bfff9fa;
 Mon, 03 Feb 2020 15:20:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 13C84B241;
 Mon,  3 Feb 2020 15:20:21 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200117105358.607910-1-anthony.perard@citrix.com>
 <20200117105358.607910-12-anthony.perard@citrix.com>
 <abe8cad9-0a64-d813-74c5-e6e13f0eace8@suse.com>
 <20200203142337.GE2306@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dd09b407-1270-98b2-f867-bf4839495971@suse.com>
Date: Mon, 3 Feb 2020 16:20:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203142337.GE2306@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v2 11/12] xen/build: introduce ccflags-y
 and CFLAGS_$@
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDIuMjAyMCAxNToyMywgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gVGh1LCBKYW4g
MzAsIDIwMjAgYXQgMDI6Mzk6NDNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3
LjAxLjIwMjAgMTE6NTMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+PiBJIGhhdmUgdG8gYWRtaXQg
dGhhdCBJJ20gYWxzbyBhIGxpdHRsZSBwdXp6bGVkIGJ5IHRoZSBuYW1pbmcsIG5vCj4+IG1hdHRl
ciB0aGF0IGl0J3MgdGFrZW4gZnJvbSBMaW51eC4gSXQgZG9lc24ndCByZWFsbHkgc2VlbSB0byBm
aXQKPj4gQ0ZMQUdTL0FGTEFHUyBhbmQgY19mbGFncy9hX2ZsYWdzLgo+IAo+IFNvIEkndmUgbG9v
ayBpbnRvIHRoZSBoaXN0b3J5IG9mIExpbnV4LCBjY2ZsYWdzLXkgd2FzIGludHJvZHVjZSB0byBn
ZXQKPiByaWQgb2YgRVhUUkFfQ0ZMQUdTIGFuZCBlc3BlY2lhbGx5IHRvIGhhdmUgdGhlIC15IHBh
cnQgaW4gdGhlIG5hbWUgb2YKPiB0aGUgdmFyaWFibGUuCj4gCj4gU28sIGluc3RlYWQgb2YgY2Nm
bGFncy15IGFuZCB0aGUgbGlrZSwgd2UgY291bGQgdXNlIENGTEFHUy15IGluIE1ha2VmaWxlCj4g
b2Ygc3ViZGlyZWN0b3JpZXMuCj4gCj4gRm9yIG1ha2VmaWxlcyBpbiBzdWJkaXIsIExpbnV4IGhh
czoKPiAgICAgQ0ZMQUdTXyRACj4gICAgIENGTEFHU19SRU1PVkVfJEAKPiAgICAgY2NmbGFncy15
Cj4gICAgIHN1YmRpci1jY2ZsYWdzLXkKPiBzbyBDRkxBR1MteSB3b3VsZCBiZSBiZXR0ZXIgKGFu
ZCB3ZSBjYW4gdGhpbmsgYWJvdXQgdGhlIHN1YmRpciBvbmUKPiBsYXRlcikuCgpJbiBjYXNlIHRo
aXMgZG9lc24ndCBjb25mbGljdCB3aXRoIHVzZXMgb2YgQ0ZMQUdTLXkgYW55d2hlcmUgZWxzZQoo
bm90IHN1cmUgaWYgYW55IGFyZSBsZWZ0IGJ5IHRoaXMgcG9pbnQgb2YgdGhlIHNlcmllcykgLSBz
b3VuZHMKZ29vZC4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
