Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82F84785
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 10:35:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvHMG-0000en-Eh; Wed, 07 Aug 2019 08:31:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvHMF-0000ei-2P
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 08:31:43 +0000
X-Inumbo-ID: c796bb78-b8ed-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c796bb78-b8ed-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 08:31:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37497AF00;
 Wed,  7 Aug 2019 08:31:40 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
 <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a68c4c0-4f50-4e04-786c-7426fdc10db9@suse.com>
Date: Wed, 7 Aug 2019 10:31:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807073534.7uoqo7q7gno2ljyl@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Roman Shaposhnik <roman@zededa.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAwOTozNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMDYsIDIwMTkgYXQgMDI6NDg6NTFQTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToK
Pj4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCA5OjE4IEFNIFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPiB3cm90ZToKPj4+Cj4+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAx
MDowNTo0MEFNICswMjAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4+IE9uIFRodSwgQXVn
IDAxLCAyMDE5IGF0IDExOjI1OjA0QU0gLTA3MDAsIFJvbWFuIFNoYXBvc2huaWsgd3JvdGU6Cj4+
Pj4+IFRoaXMgcGF0Y2ggY29tcGxldGVseSBmaXhlcyB0aGUgcHJvYmxlbSBmb3IgbWUhCj4+Pj4+
Cj4+Pj4+IFRoYW5rcyBSb2dlciEgSSdkIGxvdmUgdG8gc2VlIHRoaXMgaW4gWGVuIDQuMTMKPj4+
Pgo+Pj4+IFRoYW5rcyBmb3IgdGVzdGluZyEKPj4+Pgo+Pj4+IEl0J3Mgc3RpbGwgbm90IGNsZWFy
IHRvIG1lIHdoeSB0aGUgcHJldmlvdXMgYXBwcm9hY2ggZGlkbid0IHdvcmssIGJ1dAo+Pj4+IEkg
dGhpbmsgdGhpcyBwYXRjaCBpcyBiZXR0ZXIgYmVjYXVzZSBpdCByZW1vdmVzIHRoZSB1c2FnZSBv
Zgo+Pj4+IHtzZXQvY2xlYXJ9X2lkZW50aXR5X3AybV9lbnRyeSBmcm9tIFBWIGRvbWFpbnMuIEkg
d2lsbCBzdWJtaXQgdGhpcwo+Pj4+IGZvcm1hbGx5IG5vdy4KPj4+Cj4+PiBTb3JyeSB0byBib3Ro
ZXIgYWdhaW4sIGJ1dCBzaW5jZSB3ZSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGUKPj4+
IHByZXZpb3VzIGZpeCBkaWRuJ3Qgd29yayBmb3IgeW91LCBhbmQgSSBjYW4ndCByZXByb2R1Y2Ug
dGhpcyB3aXRoIG15Cj4+PiBoYXJkd2FyZSwgY291bGQgeW91IGdpdmUgdGhlIGF0dGFjaGVkIHBh
dGNoIGEgdHJ5Pwo+Pgo+PiBObyB3b3JyaWVzIC0tIGFuZCB0aGFua3MgZm9yIGhlbHBpbmcgdG8g
Z2V0IGl0IG92ZXIgdGhlIGZpbmlzaCBsaW5lIC0tCj4+IHRoaXMgaXMgbXVjaCBhcHByZWNpYXRl
ZCEKPj4KPj4gSSdtIGhhcHB5IHRvIHNheSB0aGF0IHRoaXMgbGF0ZXN0IHBhdGNoIGlzIGFsc28g
d29ya2luZyBqdXN0IGZpbmUuIFNvCj4+IEkgZ3Vlc3MgdGhpcyBpcyB0aGUgb25lIHRoYXQncyBn
b2luZyB0byBsYW5kIGluIFhlbiA0LjEzPwo+IAo+IE5vLCBub3QgcmVhbGx5LCBzb3JyeSB0aGlz
IHdhcyBzdGlsbCBhIGRlYnVnIHBhdGNoLgo+IAo+IFNvIEkgdGhpbmsgdGhlIGJlaGF2aW91ciB5
b3UgYXJlIHNlZWluZyBjYW4gb25seSBiZSBleHBsYWluZWQgaWYgdGhlCj4gSU9NTVUgaXMgYWxy
ZWFkeSBlbmFibGVkIGJ5IHRoZSBmaXJtd2FyZSB3aGVuIGJvb3RpbmcgaW50byBYZW4sIGNhbgo+
IHRoaXMgYmUgdGhlIGNhc2U/CgpFdmVuIHRoZW4gLSB3aHkgd291bGQgdGhlIGV4aXN0aW5nIGZs
dXNoIG5vdCBzdWZmaWNlIGluIHRoaXMgY2FzZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
