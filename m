Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E849D139172
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 13:55:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqzE5-0002qb-Lg; Mon, 13 Jan 2020 12:53:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iqzE4-0002qV-D9
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 12:53:48 +0000
X-Inumbo-ID: b85d757c-3603-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b85d757c-3603-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 12:53:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CA6F4ACC9;
 Mon, 13 Jan 2020 12:53:38 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
 <20200108140810.6528-2-aisaila@bitdefender.com>
 <0a73cce3-1c10-dd4a-9380-aa3e9f8a061b@suse.com>
 <d283e08f-161d-5d22-ed02-5068eca0d61e@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <45936d22-8a95-0569-3301-d822873c10b9@suse.com>
Date: Mon, 13 Jan 2020 13:53:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <d283e08f-161d-5d22-ed02-5068eca0d61e@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V7 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDEuMjAyMCAxMTozMiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTAuMDEuMjAyMCAxODoyMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA4LjAxLjIwMjAgMTU6
MDgsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gKyAgICBpZiAoICEocmMgPSBw
Mm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZzdmUpKSAmJiBzdmUuZmlyc3RfZXJyb3IgKQo+
Pj4gKyAgICAgICAgcmMgPSBzdmUuZmlyc3RfZXJyb3I7Cj4+Cj4+IFdoeSB0aGUgcmlnaHQgc2lk
ZSBvZiB0aGUgJiYgPwo+IAo+IFRoaXMgaXMgaW50ZW5kZWQgdG8gaGF2ZSBwMm1fc2V0X3N1cHBy
ZXNzX3ZlKCkgY2FsbCAKPiBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCkuIFNvIGhlcmUgZmly
c3QgSSBjYWxsIHRoZSBfbXVsdGkgdmVyc2lvbiBhbmQgCj4gdGhlIGNoZWNrIGlmIHRoZXJlIHdh
cyBhbnkgZXJyb3IgZnJvbSB0aGUgc2V0L2dldCAodGhhdCBpcyB3aGF0IAo+IHAybV9zZXRfc3Vw
cHJlc3NfdmUgZGlkIGJlZm9yZSkuCgpUbyBwdXQgbXkgb3JpZ2luYWwgcXVlc3Rpb24gZGlmZmVy
ZW50bHk6IGZyb20gYSBmdW5jdGlvbmFsaXR5IHBvdiwKaG93IHdvdWxkCgogICAgaWYgKCAhKHJj
ID0gcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShkLCAmc3ZlKSkgKQogICAgICAgIHJjID0gc3Zl
LmZpcnN0X2Vycm9yOwoKYmUgZGlmZmVyZW50IGZyb20geW91ciB2YXJpYW50IChhcyBsb25nIGFz
IHRoZSBmaWVsZCBpbmRlZWQgc3RhcnRzCm91dCBhcyB6ZXJvKT8KCj4gSSBkb24ndCBrbm93IHdo
eSBnaXQgbWFkZSB0aGUgcGF0Y2ggc28gdWdseS4KCkkgaGF2ZSBubyBpZGVhIHdoYXQgdWdsaW5l
c3MgeW91IHJlZmVyIHRvIGhlcmUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
