Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC44C2FEF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:19:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFEID-0004T1-8f; Tue, 01 Oct 2019 09:18:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hN/W=X2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFEIB-0004SH-Kp
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:17:59 +0000
X-Inumbo-ID: 5be72a46-e42c-11e9-96f7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5be72a46-e42c-11e9-96f7-12813bfff9fa;
 Tue, 01 Oct 2019 09:17:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DF122B4AA;
 Tue,  1 Oct 2019 09:17:57 +0000 (UTC)
To: Paul Durrant <paul.durrant@citrix.com>, xen-devel@lists.xenproject.org
References: <20191001091214.3287-1-paul.durrant@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <4b678d5f-49cf-b0f4-6425-01d0329e5bf7@suse.com>
Date: Tue, 1 Oct 2019 11:17:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001091214.3287-1-paul.durrant@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH-for-4.13] libxl: choose an appropriate
 default for passthrough...
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMTAuMTkgMTE6MTIsIFBhdWwgRHVycmFudCB3cm90ZToKPiAuLi5pZiB0aGVyZSBpcyBu
byBJT01NVSBvciBpdCBpcyBnbG9iYWxseSBkaXNhYmxlZC4KPiAKPiBXaXRob3V0IHRoaXMgcGF0
Y2gsIHRoZSBmb2xsb3dpbmcgYXNzZXJ0aW9uIG1heSBiZSBoaXQ6Cj4gCj4geGw6IGxpYnhsX2Ny
ZWF0ZS5jOjU4OTogbGlieGxfX2RvbWFpbl9tYWtlOiBBc3NlcnRpb24gYGluZm8tPnBhc3N0aHJv
dWdoICE9IExJQlhMX1BBU1NUSFJPVUdIX0VOQUJMRUQnIGZhaWxlZC4KPiAKPiBUaGlzIGlzIGJl
Y2F1c2UgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KCkgY3VycmVudGx5IG9u
bHkgc2V0cwo+IGFuIGFwcHJvcHJpYXRlIHZhbHVlIGZvciAncGFzc3Rocm91Z2gnIGluIHRoZSBj
YXNlIHRoYXQgJ2NhcF9odm1fZGlyZWN0aW8nCj4gaXMgdHJ1ZSwgd2hpY2ggaXMgbm90IHRoZSBj
YXNlIHVubGVzcyBhbiBJT01NVSBpcyBwcmVzZW50IGFuZCBlbmFibGVkIGluCj4gdGhlIHN5c3Rl
bS4gVGhpcyBpcyBub3JtYWxseSBtYXNrZWQgYnkgeGwgY2hvb3NpbmcgYSBkZWZhdWx0IHZhbHVl
LCBidXQKPiB0aGF0IHdpbGwgbm90IGhhcHBlbiBpZiB4bCBpcyBub3QgdXNlZCAoZS5nLiB3aGVu
IHVzaW5nIGxpYnZpcnQpIG9yIHdoZW4KPiBhIHN0dWIgZG9tYWluIGlzIGJlaW5nIGNyZWF0ZWQu
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNv
bT4KClJlbGVhc2UtYWNrZWQtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCgpK
dWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
