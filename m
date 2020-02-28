Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE1117381A
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 14:16:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7fSV-0005RB-IW; Fri, 28 Feb 2020 13:13:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7fSU-0005R6-FL
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 13:13:38 +0000
X-Inumbo-ID: 211d3682-5a2c-11ea-9932-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 211d3682-5a2c-11ea-9932-12813bfff9fa;
 Fri, 28 Feb 2020 13:13:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5DCC1AD14;
 Fri, 28 Feb 2020 13:13:36 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <2d3ced57-7d53-bb90-ccf6-e521e6eeb556@suse.com>
 <116e417c-f8bb-5eab-2356-7fa3532e219f@suse.com>
 <20200228123331.GX24458@Air-de-Roger.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6a0791f-e9ed-46c4-4acd-91999a132a32@suse.com>
Date: Fri, 28 Feb 2020 14:13:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228123331.GX24458@Air-de-Roger.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] AMD/IOMMU: correct handling when
 XT's prereq features are unavailable
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMDIuMjAyMCAxMzo0MSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBGcmksIEZl
YiAyOCwgMjAyMCBhdCAwMToxMDo1OVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gV2Ug
c2hvdWxkIG5laXRoZXIgY2F1c2UgSU9NTVUgaW5pdGlhbGl6YXRpb24gYXMgYSB3aG9sZSB0byBm
YWlsIGluIHRoaXMKPj4gY2FzZSAod2Ugc2hvdWxkIHN0aWxsIGJlIGFibGUgdG8gYnJpbmcgdXAg
dGhlIHN5c3RlbSBpbiBub24teDJBUElDIG9yCj4+IHgyQVBJQyBwaHlzaWNhbCBtb2RlKSwgbm9y
IHNob3VsZCB0aGUgcmVtYWluZGVyIG9mIHRoZSBmdW5jdGlvbiBiZQo+PiBza2lwcGVkIChhcyB0
aGUgbWFpbiBwYXJ0IG9mIGl0IHdvbid0IGdldCBlbnRlcmVkIGEgMm5kIHRpbWUpCj4gCj4gSSdt
IG5vdCBzdXJlIEkgc2VlIHdoeSBpdCB3b24ndCBnZXQgZW50ZXJlZCBhIHNlY29uZCB0aW1lLiBB
RkFJQ1QKPiBpbml0X2RvbmUgd29uJ3QgYmUgc2V0IGlmIGFtZF9pb21tdV9pbml0IGZhaWxzLCBh
bmQgaGVuY2Ugd2lsbCBiZQo+IGNhbGxlZCBhZ2FpbiB3aXRoIHh0ID09IGZhbHNlIGluIGlvdl9k
ZXRlY3Q/CgpOb3QgdmVyeSBmYXIgZnJvbSB0aGUgdG9wIG9mIHRoZSBmdW5jdGlvbiB0aGVyZSBp
cwoKICAgIC8qIEhhdmUgd2UgYmVlbiBoZXJlIGJlZm9yZT8gKi8KICAgIGlmICggaXZyc19iZGZf
ZW50cmllcyApCiAgICAgICAgcmV0dXJuIDA7CgpIZW5jZSBtZSBzYXlpbmcgIm1haW4gcGFydCIg
cmF0aGVyIHRoYW4gInRoZSBmdW5jdGlvbiBhcyBhIHdob2xlIi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
