Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1D85AAA
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 08:26:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvbow-0006XJ-Hm; Thu, 08 Aug 2019 06:22:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvbov-0006XC-BF
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 06:22:41 +0000
X-Inumbo-ID: ebeb033b-b9a4-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ebeb033b-b9a4-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 06:22:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E4F7DAF92;
 Thu,  8 Aug 2019 06:22:38 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
Date: Thu, 8 Aug 2019 08:22:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807194143.1351-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs/sphinx: Introduction
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAyMTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvZG9jcy9nbG9zc2FyeS5yc3QKPiBAQCAtMCwwICsxLDM3IEBACj4gK0dsb3NzYXJ5
Cj4gKz09PT09PT09Cj4gKwo+ICsuLiBUZXJtcyBzaG91bGQgYXBwZWFyIGluIGFscGhhYmV0aWNh
bCBvcmRlcgo+ICsKPiArLi4gZ2xvc3Nhcnk6Ogo+ICsKPiArICAgY29udHJvbCBkb21haW4KPiAr
ICAgICBBIDp0ZXJtOmBkb21haW5gLCBjb21tb25seSBkb20wLCB3aXRoIHRoZSBwZXJtaXNzaW9u
IGFuZCByZXNwb25zaWJpbGl0eQo+ICsgICAgIHRvIGNyZWF0ZSBhbmQgbWFuYWdlIG90aGVyIGRv
bWFpbnMgb24gdGhlIHN5c3RlbS4KPiArCj4gKyAgIGRvbWFpbgo+ICsgICAgIEEgZG9tYWluIGlz
IFhlbidzIHVuaXQgb2YgcmVzb3VyY2Ugb3duZXJzaGlwLCBhbmQgZ2VuZXJhbGx5IGhhcyBhdCB0
aGUKPiArICAgICBtaW5pbXVtIHNvbWUgUkFNIGFuZCB2aXJ0dWFsIENQVXMuCj4gKwo+ICsgICAg
IFRoZSB0ZXJtcyA6dGVybTpgZG9tYWluYCBhbmQgOnRlcm06YGd1ZXN0YCBhcmUgY29tbW9ubHkg
dXNlZAo+ICsgICAgIGludGVyY2hhbmdlYWJseSwgYnV0IHRoZXkgbWVhbiBzdWJ0bHkgZGlmZmVy
ZW50IHRoaW5ncy4KPiArCj4gKyAgICAgQSBndWVzdCBpcyBhIHNpbmdsZSB2aXJ0dWFsIG1hY2hp
bmUuCj4gKwo+ICsgICAgIENvbnNpZGVyIHRoZSBjYXNlIG9mIGxpdmUgbWlncmF0aW9uIHdoZXJl
LCBmb3IgYSBwZXJpb2Qgb2YgdGltZSwgb25lCj4gKyAgICAgZ3Vlc3Qgd2lsbCBiZSBjb21wcmlz
ZWQgb2YgdHdvIGRvbWFpbnMsIHdoaWxlIGl0IGlzIGluIHRyYW5zaXQuCj4gKwo+ICsgICBkb21p
ZAo+ICsgICAgIFRoZSBudW1lcmljIGlkZW50aWZpZXIgb2YgYSBydW5uaW5nIDp0ZXJtOmBkb21h
aW5gLiAgSXQgaXMgdW5pcXVlIHRvIGEKPiArICAgICBzaW5nbGUgaW5zdGFuY2Ugb2YgWGVuLCB1
c2VkIGFzIHRoZSBpZGVudGlmaWVyIGluIHZhcmlvdXMgQVBJcywgYW5kIGlzCj4gKyAgICAgdHlw
aWNhbGx5IGFsbG9jYXRlZCBzZXF1ZW50aWFsbHkgZnJvbSAwLgo+ICsKPiArICAgZ3Vlc3QKPiAr
ICAgICBTZWUgOnRlcm06YGRvbWFpbmAKCkkgdGhpbmsgeW91IHdhbnQgdG8gbWVudGlvbiB0aGUg
dXN1YWwgZGlzdGluY3Rpb24gaGVyZTogRG9tMCBpcywKd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5
IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuCgpFdmVyeXRoaW5nIGVsc2UgbG9va3Mgb2theSB0byBt
ZSwgYnV0IEkgY2FuJ3QgcmVhc29uYWJseSBhZGRyZXNzIHlvdXIKUkZDIGFzcGVjdC4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
