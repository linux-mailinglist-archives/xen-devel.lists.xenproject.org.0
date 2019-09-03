Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893BA688B
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2019 14:25:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i57pL-0004uE-MF; Tue, 03 Sep 2019 12:22:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CRa/=W6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i57pJ-0004tN-Ab
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2019 12:22:25 +0000
X-Inumbo-ID: 7af2831b-ce45-11e9-ab92-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7af2831b-ce45-11e9-ab92-12813bfff9fa;
 Tue, 03 Sep 2019 12:22:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 99AD0B027;
 Tue,  3 Sep 2019 12:22:23 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <347e51f2-e80c-992c-6d0b-3b2bfdb75cce@suse.com>
 <2355680d-2052-60a8-fd46-ebf23196a4d6@suse.com>
 <0ff95d72-b647-4dad-40c5-a47a810fc172@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f25f8dfa-0b94-deee-1dd3-2f3cf2887a25@suse.com>
Date: Tue, 3 Sep 2019 14:22:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0ff95d72-b647-4dad-40c5-a47a810fc172@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/8] x86/HVM: ignore guest INVD uses
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <Paul.Durrant@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDkuMjAxOSAxMjoxOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwMy8wOS8yMDE5
IDEwOjM3LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVGhlIG9ubHkgcGxhY2Ugd2UnZCBleHBlY3Qg
dGhlIGluc24gdG8gYmUgc2Vuc2libHkgdXNlZCBpcyBpbgo+PiAodmlydHVhbGl6YXRpb24gdW5h
d2FyZSkgZmlybXdhcmUuCj4+Cj4+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3
LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgo+PiAtLS0KPj4gdjM6IE5ldy4KPj4KPj4gLS0tIGEveGVuL2FyY2gveDg2
L2h2bS9lbXVsYXRlLmMKPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9lbXVsYXRlLmMKPj4gQEAg
LTIyMTAsMTEgKzIyMTAsMTggQEAgc3RhdGljIGludCBodm1lbXVsX2NhY2hlX29wKAo+PiAgCj4+
ICAgICAgICAgIGh2bWVtdWxfdW5tYXBfbGluZWFyX2FkZHIobWFwcGluZywgYWRkciwgMCwgaHZt
ZW11bF9jdHh0KTsKPj4gICAgICAgICAgLyogZmFsbCB0aHJvdWdoICovCj4+IC0gICAgY2FzZSB4
ODZlbXVsX2ludmQ6Cj4+ICAgICAgY2FzZSB4ODZlbXVsX3diaW52ZDoKPj4gICAgICBjYXNlIHg4
NmVtdWxfd2Jub2ludmQ6Cj4+ICAgICAgICAgIGFsdGVybmF0aXZlX3ZjYWxsKGh2bV9mdW5jcy53
YmludmRfaW50ZXJjZXB0KTsKPj4gICAgICAgICAgYnJlYWs7Cj4+ICsKPj4gKyAgICBjYXNlIHg4
NmVtdWxfaW52ZDoKPj4gKyAgICAgICAgLyoKPj4gKyAgICAgICAgICogRGVsaWJlcmF0ZWx5IGln
bm9yZWQ6IFdlIGRvbid0IHdhbnQgdG8gaXNzdWUgSU5WRCwgYW5kIGlzc3VpbmcgV0JJTlZECj4g
Cj4gSSdkIHBocmFzZSB0aGlzIG1vcmUgc3Ryb25nbHkuwqAgV2UgYWJzb2x1dGVseSBtdXN0IG5v
dCBpc3N1ZSBJTlZEIG9yIHdlCj4gYnJlYWsgY2FjaGUgY29oZXJlbmN5Lgo+IAo+IElkZWFsbHkg
d2l0aCB0aGlzIGFkanVzdGVkLCBSZXZpZXdlZC1ieTogQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcu
Y29vcGVyM0BjaXRyaXguY29tPgoKVGhhbmtzLCBJJ3ZlIHJlcGxhY2VkICJkb24ndCB3YW50IHRv
IiB3aXRoICJtdXN0bid0Ii4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
