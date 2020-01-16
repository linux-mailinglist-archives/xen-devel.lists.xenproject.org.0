Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA5313DFA5
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 17:11:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is7hO-0000Q4-Mv; Thu, 16 Jan 2020 16:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is7hN-0000Pz-UZ
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 16:08:45 +0000
X-Inumbo-ID: 73e19ca6-387a-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73e19ca6-387a-11ea-a985-bc764e2007e4;
 Thu, 16 Jan 2020 16:08:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AC39AB2772;
 Thu, 16 Jan 2020 16:08:36 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <3f8ab6b4cf686e814d91961b564fede6d0c64030.1578503483.git.tamas.lengyel@intel.com>
 <e1fe9e56-919a-409d-c01a-1453d0338dcf@suse.com>
 <CABfawhkWzi9b7xkOtUE+VZm9JRej1SSJvC7ROoK1rHCtWfpxNQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f293addb-d92b-da5f-5932-2cb3a40ce3ac@suse.com>
Date: Thu, 16 Jan 2020 17:08:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhkWzi9b7xkOtUE+VZm9JRej1SSJvC7ROoK1rHCtWfpxNQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 06/18] x86/mem_sharing: define
 mem_sharing_domain to hold some scattered variables
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYuMDEuMjAyMCAxNzowNSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgSmFu
IDE2LCAyMDIwIGF0IDg6MjMgQU0gSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPiB3cm90
ZToKPj4KPj4gT24gMDguMDEuMjAyMCAxODoxNCwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4g
Q3JlYXRlIHN0cnVjdCBtZW1fc2hhcmluZ19kb21haW4gdW5kZXIgaHZtX2RvbWFpbiBhbmQgbW92
ZSBtZW0gc2hhcmluZwo+Pj4gdmFyaWFibGVzIGludG8gaXQgZnJvbSBwMm1fZG9tYWluIGFuZCBo
dm1fZG9tYWluLgo+Pj4KPj4+IEV4cG9zZSB0aGUgbWVtX3NoYXJpbmdfZW5hYmxlZCBtYWNybyB0
byBiZSB1c2VkIGNvbnNpc3RlbnRseSBhY3Jvc3MgWGVuLgo+Pj4KPj4+IFJlbW92ZSBzb21lIGR1
cGxpY2F0ZSBjYWxscyB0byBtZW1fc2hhcmluZ19lbmFibGVkIGluIG1lbV9zaGFyaW5nLmMKPj4+
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwu
Y29tPgo+Pgo+PiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+PiB3
aXRoIG9uZSBxdWVzdGlvbjoKPj4KPj4+IEBAIC0xOTIsNiArMTkyLDEwIEBAIHN0cnVjdCBodm1f
ZG9tYWluIHsKPj4+ICAgICAgICAgIHN0cnVjdCB2bXhfZG9tYWluIHZteDsKPj4+ICAgICAgICAg
IHN0cnVjdCBzdm1fZG9tYWluIHN2bTsKPj4+ICAgICAgfTsKPj4+ICsKPj4+ICsjaWZkZWYgQ09O
RklHX01FTV9TSEFSSU5HCj4+PiArICAgIHN0cnVjdCBtZW1fc2hhcmluZ19kb21haW4gbWVtX3No
YXJpbmc7Cj4+PiArI2VuZGlmCj4+Cj4+IEFyZSB5b3UgaW50ZW5kaW5nIHRvIGFkZCBmaWVsZHMg
dG8gdGhpcyBuZXcgc3RydWN0PyBJZiBzbywKPj4gc2hvdWxkIHRoZSBmaWVsZCBoZXJlIGJlY29t
ZSBhIHBvaW50ZXIsIGFuZCB0aGUgc3RydWN0dXJlCj4+IGFsbG9jYXRlZCBvbmx5IHdoZW4gYWN0
dWFsbHkgbmVlZGVkPwo+Pgo+IAo+IEF0IHRoZSBtb21lbnQgdGhlcmUgYXJlIG5vIGFkZGl0aW9u
YWwgdmFyaWFibGVzIHBsYW5uZWQgdG8gYmUgYWRkZWQuCj4gSWYvd2hlbiB3ZSBkbyB3ZSBjYW4g
Y29uc2lkZXIgdHVybmluZyB0aGlzIGludG8gYSBwb2ludGVyLCBhdCB3aGljaAo+IHBvaW50IHdl
IGNhbiBhbHNvIGdldCByaWQgb2YgdGhlICJlbmFibGVkIiBmaWVsZCBhbmQgdHVybiB0aGUKPiBt
ZW1fc2hhcmluZ19lbmFibGVkIG1hY3JvIGludG8gYSBOVUxMLXBvaW50ZXIgY2hlY2sgaW5zdGVh
ZC4gRm9yIG5vdyBJCj4gd291bGRuJ3QgYm90aGVyIGJlY2F1c2UgaXRzIG5vdCBsaWtlIHdlIHNh
dmUgbXVjaCBieSBkb2luZyBzby4KClRoYW5rcyBmb3IgY2xhcmlmeWluZy4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
