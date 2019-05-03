Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F28A112C0C
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 13:11:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMW3F-0004B8-FV; Fri, 03 May 2019 11:08:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hPPK=TD=citrix.com=prvs=019e908d5=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hMW3D-0004B3-UH
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 11:08:23 +0000
X-Inumbo-ID: c3772d8f-6d93-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c3772d8f-6d93-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 11:08:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,425,1549929600"; d="scan'208";a="85051630"
Date: Fri, 3 May 2019 12:08:19 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Julien Grall <julien.grall@arm.com>
Message-ID: <20190503110819.GA5900@zion.uk.xensource.com>
References: <CAOcoXZZtsXQMp0EzFAa2WEBL1sEUcFsNozaQshsnNEs3=NQK3g@mail.gmail.com>
 <CAOcoXZY6jpPKcWTXPqz0sr=Amw7J0KSaBRWiRnQRgTC2XR=hjQ@mail.gmail.com>
 <f95ad35b-42f6-4df2-cade-7a8115f9e49a@arm.com>
 <CAOcoXZaMLfHSyLSE04xRFZZY0hLkFcJ5cBqHTdmwDoqwcreD1w@mail.gmail.com>
 <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff543e3c-0619-5aa6-b36a-e1a8b8cce886@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] Xen GCC coverage ARM64 testing - Unexpected Trap:
 Data Abort
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Andrii_Anisov@epam.com,
 xen-devel@lists.xenproject.org, Viktor Mitin <viktor.mitin.19@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXkgMDIsIDIwMTkgYXQgMDk6NDM6MTdQTSArMDEwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+ICgrIFdlaSkKPiAKPiBPbiA1LzIvMTkgNTo1NSBQTSwgVmlrdG9yIE1pdGluIHdyb3Rl
Ogo+ID4gSGkgSnVsaWVuLAo+IAo+IEhpLAo+IAo+ID4gUGxlYXNlIGZpbmQgdHJhY2UgbG9nIGJl
bG93Ogo+ID4gCj4gPiByb290QGgzdWxjYjp+IyB4ZW5jb3YgcmVzZXQKPiA+IChYRU4pIERhdGEg
QWJvcnQgVHJhcC4gU3luZHJvbWU9MHg3Cj4gPiAoWEVOKSBXYWxraW5nIEh5cGVydmlzb3IgVkEg
MHgzNjE3MDAgb24gQ1BVMyB2aWEgVFRCUiAweDAwMDAwMDAwNzgyNjYwMDAKPiBTbyB0aGlzIGlz
IGEgZGF0YSBhYm9ydCB3aGVuIHRyeWluZyB0byBhY2Nlc3MgVkEgMHgzNjE3MDAgKGl0IGlzIHBh
cnQgb2YgWGVuCj4gaXRzZWxmKS4gSSBtaXNyZWFkIHRoZSBBcm0gQXJtIGJlZm9yZSwgd2hpbGUg
SVNWIGlzIDAgREZTQyB3aWxsIHN0aWxsCj4gcHJvdmlkZSBhIGNvcnJlY3QgdmFsdWUuIFNvIGhl
cmUgd2UgaGF2ZSBhICJUcmFuc2xhdGlvbiBmYXVsdCwgbGV2ZWwgMyIuCj4gCj4gV2hpY2ggbWFr
ZXMgc2Vuc2UgYmVjYXVzZSAuLi4KPiAKPiAKPiA+IChYRU4pIDBUSFsweDBdID0gMHgwMDAwMDAw
MDc4MjY1ZjdmCj4gPiAoWEVOKSAxU1RbMHgwXSA9IDB4MDAwMDAwMDA3ODI2MmY3Zgo+ID4gKFhF
TikgMk5EWzB4MV0gPSAweDAwNDAwMDAwNzgyNWZmN2YKPiA+IChYRU4pIDNSRFsweDE2MV0gPSAw
eDAwNjAwMDAwNzgxZTFmN2UKPiAKPiB0aGUgM3JkIGVudHJ5IGlzIG5vdCB2YWxpZC4gSSBtYW5h
Z2VkIHRvIHJlZHVjZSB0aGUgZXJyb3IgYW5kIGl0IGxvb2tzIGxpa2UKPiBnY292IGlzIHRyeWlu
ZyB0byBhY2Nlc3MgYSBjb3VudGVyIGluIHRoZSBzZWN0aW9uIGluaXQuZGF0YS4KPiAKPiBBcyBh
bGwgdGhlIC5pbml0Liogc2VjdGlvbnMgYXJlIHN0cmlwcGVkIGFmdGVyIGJvb3QsIGl0IG1lYW5z
IHRoYXQgYW55dGhpbmcKPiBpbiAuaW5pdC5kYXRhIGNhbm5vdCBiZSBhY2Nlc3NlZCBhbnltb3Jl
Lgo+IAo+IFdlaSwgaG93IGRvIHlvdSBkZWFsIHdpdGggY291bnRlcnMgaW4gaW5pdC5kYXRhIG9u
IHg4Nj8KClRoZSBidWlsZCBzeXN0ZW0gZXhwbGljaXRseSBjb21waWxlIGFueSAuaW5pdCBiaW5h
cnkgd2l0aG91dCBnY292Cm9wdGlvbi4gU28gbWF5YmUgc29tZSBmaWxlIHdhcyBub3QgY29ycmVj
dGx5IGFkZGVkPwoKV2VpLgoKCj4gCj4gQ2hlZXJzLAo+IAo+IC0tIAo+IEp1bGllbiBHcmFsbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
