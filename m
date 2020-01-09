Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B07F4135D93
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 17:06:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipaHg-0000SL-77; Thu, 09 Jan 2020 16:03:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipaHe-0000SG-S0
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 16:03:42 +0000
X-Inumbo-ID: 95f9f51c-32f9-11ea-a985-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95f9f51c-32f9-11ea-a985-bc764e2007e4;
 Thu, 09 Jan 2020 16:03:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B118DACA4;
 Thu,  9 Jan 2020 16:03:32 +0000 (UTC)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
 <b816ff21d1156eeb5d68b35932ad23f4e5891bdb.1578503483.git.tamas.lengyel@intel.com>
 <5084334f-7ed6-6095-e31a-d530454357a4@xen.org>
 <CABfawhnwdYX6W_arEL_SP4eqvrOYQZUB1jqeuMA+WUXo_TaZiQ@mail.gmail.com>
 <20200109151010.GC11756@Air-de-Roger>
 <259d98b3-5d27-a856-a457-4e7c37004982@suse.com>
 <CABfawhmTi9T+TJC0=J1vRwsz859oeFXfKTmqCz4yvcmSdS0umQ@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <40a6ce4a-2512-acc6-1fd1-bc9d1bb131be@suse.com>
Date: Thu, 9 Jan 2020 17:03:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABfawhmTi9T+TJC0=J1vRwsz859oeFXfKTmqCz4yvcmSdS0umQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 15/18] xen/mem_sharing: VM forking
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDEuMjAyMCAxNjo1NywgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IE9uIFRodSwgSmFu
IDksIDIwMjAgYXQgODozNCBBTSBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiAwOS4wMS4yMDIwIDE2OjEwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4g
T24gVGh1LCBKYW4gMDksIDIwMjAgYXQgMDY6NDE6MTJBTSAtMDcwMCwgVGFtYXMgSyBMZW5neWVs
IHdyb3RlOgo+Pj4+IE9uIFRodSwgSmFuIDksIDIwMjAgYXQgMzoyOSBBTSBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPiB3cm90ZToKPj4+Pj4KPj4+Pj4gSGkgVGFtYXMsCj4+Pj4+Cj4+Pj4+
IE9uIDA4LzAxLzIwMjAgMTc6MTQsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4+ICtzdGF0
aWMgaW50IG1lbV9zaGFyaW5nX2Zvcmsoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IGRvbWFpbiAq
Y2QpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICBpbnQgcmM7Cj4+Pj4+PiArCj4+Pj4+PiArICAgIGlm
ICggIWQtPmNvbnRyb2xsZXJfcGF1c2VfY291bnQgJiYKPj4+Pj4+ICsgICAgICAgICAocmMgPSBk
b21haW5fcGF1c2VfYnlfc3lzdGVtY29udHJvbGxlcihkKSkgKQo+Pj4+Pgo+Pj4+PiBBRkFJVSwg
dGhlIHBhcmVudCBkb21haW4gd2lsbCBiZSBwYXVzZWQgaWYgaXQgd2Fzbid0IHBhdXNlZCBiZWZv
cmUgYW5kCj4+Pj4+IHRoaXMgd2lsbCBub3QgYmUgdW5wYXVzZWQgYnkgdGhlIHNhbWUgaHlwZXJj
YWxsLiBSaWdodD8KPj4+Pgo+Pj4+IFllcywgaXQgbmVlZHMgdG8gcmVtYWluIHBhdXNlZCBhcyBs
b25nIGFzIHRoZXJlIGFyZSBmb3JrcyBhY3RpdmUgZnJvbQo+Pj4+IGl0LiBBZnRlcndhcmRzIGl0
IGNhbiBiZSB1bnBhdXNlZC4KPj4+Cj4+PiBJZiB5b3Ugd2FudCB0aGUgcGFyZW50IGRvbWFpbiB0
byByZW1haW4gcGF1c2VkIGZvciBhcyBsb25nIGFzIHRoZQo+Pj4gZm9ya3MgYXJlIGFjdGl2ZSwg
c2hvdWxkbid0IGVhY2ggZm9yayBpbmNyZW1lbnQgdGhlIHBhdXNlIGNvdW50IG9uCj4+PiBjcmVh
dGlvbiBhbmQgZGVjcmVtZW50IGl0IHdoZW4gdGhlIGZvcmsgaXMgZGVzdHJveWVkPwo+Pj4KPj4+
IEhvdyBjYW4geW91IGFzc3VyZSBubyBvdGhlciBvcGVyYXRpb24gb3IgZW50aXR5IGhhcyBpbmNy
ZW1lbnRlZAo+Pj4gY29udHJvbGxlcl9wYXVzZV9jb3VudCB0ZW1wb3JhcnkgYW5kIGlzIGxpa2Vs
eSB0byBkZWNyZW1lbnQgaXQgYXQgc29tZQo+Pj4gcG9pbnQgd2hpbGUgZm9ya3MgYXJlIHN0aWxs
IGFjdGl2ZT8KPj4KPj4gVGhlIF9ieV9zeXN0ZW1jb250cm9sbGVyIHZhcmlhbnRzIGxvb2sgd3Jv
bmcgdG8gYmUgdXNlZCBoZXJlIGFueXdheS4KPj4gV2h5IGlzIHRoaXMgbm90IHNpbXBseSBkb21h
aW5feyx1bn1wYXVzZSgpPwo+Pgo+IAo+IE15IHJlYXNvbmluZyB3YXMgdGhhdCBieSBkZWZhdWx0
IHRoZSB1c2VyIHNob3VsZCBwYXVzZSB0aGUgcGFyZW50IFZNCj4gYmVmb3JlIGZvcmtpbmcuIFRo
aXMgc2FuaXR5IGNoZWNrcyBqdXN0IG1pbWlja3MgdGhhdCBzdGVwIGluIGNhc2UgdGhlCj4gdXNl
ciBkaWRuJ3QgZG8gdGhhdCBhbHJlYWR5LiBCdXQgSSBndWVzcyBlaXRoZXIgd291bGQgd29yaywg
SSBkb24ndAo+IHJlYWxseSBzZWUgbXVjaCBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIHR3by4KClRo
ZSBtYWluIGRpZmZlcmVuY2UgaXMgdGhhdCB0aGUgb25lIHlvdSBjdXJyZW50bHkgdXNlIHVwZGF0
ZXMKZC0+Y29udHJvbGxlcl9wYXVzZV9jb3VudCwgd2hpY2ggY2FuIGJlIHVwZGF0ZWQgYnkgb3Ro
ZXIgZG9tY3RscywgYnV0CndoaWNoIHNob3VsZG4ndCBiZSB1cGRhdGVkIGJlaGluZCB0aGUgYmFj
ayBvZiBhIGNvbXBvbmVudCBpbiBYZW4gd2hpY2gKbmVlZHMgdGhlIGVudGl0eSBwYXVzZWQuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
