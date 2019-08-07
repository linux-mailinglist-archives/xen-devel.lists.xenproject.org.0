Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C19D84577
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 09:13:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvG4F-000289-N4; Wed, 07 Aug 2019 07:09:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=0f/x=WD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvG4E-000284-3b
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 07:09:02 +0000
X-Inumbo-ID: 3a6c038c-b8e2-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 3a6c038c-b8e2-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 07:09:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1F42AE5C;
 Wed,  7 Aug 2019 07:08:58 +0000 (UTC)
To: Roman Shaposhnik <roman@zededa.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
 <CAMmSBy8U3druT0V_9ADojAyQxn7KTWARMsZ08DZ_5EWU43qDAg@mail.gmail.com>
 <20190731083631.63vqxrdr5vyeeswn@Air-de-Roger>
 <20190731084336.lkpk4n35qg2zo67w@Air-de-Roger>
 <CAMmSBy89cvwnRRPhorpUucLdc5LEak__Mtyw8ka5XvqP7W+q6A@mail.gmail.com>
 <d6ba30f8-7959-57bc-3843-e11f48b52766@citrix.com>
 <CAMmSBy9ZiEU95yAK1ry_41GR0ttWTX9EEJ0bMStZaK=PrzCH7w@mail.gmail.com>
 <20190801081559.wruxck32h5bum2va@Air-de-Roger>
 <CAMmSBy9y6hHQfDgcDFmKiRw9QiRSgcxHAq6Qo=o7apTR2EuusA@mail.gmail.com>
 <20190802080540.r4e3rrv3eit5yebt@Air-de-Roger>
 <20190806160644.adqzknxdfuwz4qaz@Air-de-Roger>
 <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <999aabe3-7406-9ad9-fb85-432c29352a77@suse.com>
Date: Wed, 7 Aug 2019 09:08:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy91XfNz5DfbaL8OC7v1eYp7n_EKjGgSgAH+YBALh9HM-g@mail.gmail.com>
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
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDguMjAxOSAyMzo0OCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPiBPbiBUdWUsIEF1
ZyA2LCAyMDE5IGF0IDk6MTggQU0gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyb3RlOgo+Pgo+PiBPbiBGcmksIEF1ZyAwMiwgMjAxOSBhdCAxMDowNTo0MEFNICswMjAw
LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+Pj4gT24gVGh1LCBBdWcgMDEsIDIwMTkgYXQgMTE6
MjU6MDRBTSAtMDcwMCwgUm9tYW4gU2hhcG9zaG5payB3cm90ZToKPj4+PiBUaGlzIHBhdGNoIGNv
bXBsZXRlbHkgZml4ZXMgdGhlIHByb2JsZW0gZm9yIG1lIQo+Pj4+Cj4+Pj4gVGhhbmtzIFJvZ2Vy
ISBJJ2QgbG92ZSB0byBzZWUgdGhpcyBpbiBYZW4gNC4xMwo+Pj4KPj4+IFRoYW5rcyBmb3IgdGVz
dGluZyEKPj4+Cj4+PiBJdCdzIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aHkgdGhlIHByZXZpb3Vz
IGFwcHJvYWNoIGRpZG4ndCB3b3JrLCBidXQKPj4+IEkgdGhpbmsgdGhpcyBwYXRjaCBpcyBiZXR0
ZXIgYmVjYXVzZSBpdCByZW1vdmVzIHRoZSB1c2FnZSBvZgo+Pj4ge3NldC9jbGVhcn1faWRlbnRp
dHlfcDJtX2VudHJ5IGZyb20gUFYgZG9tYWlucy4gSSB3aWxsIHN1Ym1pdCB0aGlzCj4+PiBmb3Jt
YWxseSBub3cuCj4+Cj4+IFNvcnJ5IHRvIGJvdGhlciBhZ2FpbiwgYnV0IHNpbmNlIHdlIHN0aWxs
IGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoZQo+PiBwcmV2aW91cyBmaXggZGlkbid0IHdvcmsgZm9y
IHlvdSwgYW5kIEkgY2FuJ3QgcmVwcm9kdWNlIHRoaXMgd2l0aCBteQo+PiBoYXJkd2FyZSwgY291
bGQgeW91IGdpdmUgdGhlIGF0dGFjaGVkIHBhdGNoIGEgdHJ5Pwo+IAo+IE5vIHdvcnJpZXMgLS0g
YW5kIHRoYW5rcyBmb3IgaGVscGluZyB0byBnZXQgaXQgb3ZlciB0aGUgZmluaXNoIGxpbmUgLS0K
PiB0aGlzIGlzIG11Y2ggYXBwcmVjaWF0ZWQhCj4gCj4gSSdtIGhhcHB5IHRvIHNheSB0aGF0IHRo
aXMgbGF0ZXN0IHBhdGNoIGlzIGFsc28gd29ya2luZyBqdXN0IGZpbmUuIFNvCj4gSSBndWVzcyB0
aGlzIGlzIHRoZSBvbmUgdGhhdCdzIGdvaW5nIHRvIGxhbmQgaW4gWGVuIDQuMTM/CgpOb3QgbmVj
ZXNzYXJpbHkgLSB0aGUgb3RoZXIgcGF0Y2ggaXMgYWxzbyBhIGNhbmRpZGF0ZSwgYnV0IGl0cwpk
ZXNjcmlwdGlvbiB3b3VsZCBuZWVkIHRvIGV4cGxhaW4gd2hhdCB3YXMgYWN0dWFsbHkgd3Jvbmcu
Cgo+PiBBRkFJQ1QgdGhlIG9ubHkgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBub24td29ya2luZyB2
ZXJzaW9uIGFuZCB0aGUKPj4gd29ya2luZyB2ZXJzaW9uIGlzIHRoZSBmbHVzaCwgc28gSSd2ZSBh
ZGRlZCBpdCBoZXJlLgoKTm93IEknbSBhZnJhaWQgSSBzdGlsbCBjYW4ndCBkcmF3IGEgaGVscGZ1
bCBjb25jbHVzaW9uIGZyb20gUm9tYW4ncwpzdWNjZXNzZnVsIHRlc3Q6IGludGVsX2lvbW11X2h3
ZG9tX2luaXQoKSwgYWZ0ZXIgaGF2aW5nIGNhbGxlZApzZXR1cF9od2RvbV9ybXJyKCksIGNhbGxz
IGlvbW11X2ZsdXNoX2FsbCgpICh3aXRoIG9uZSBvdGhlciwKc2VlbWluZ2x5IGlubm9jZW50IGNh
bGwgaW4gYmV0d2VlbikuIFRoZSBvbmx5IGNvbmNsdXNpb24gSSBfY291bGRfCmRyYXcgaXMgdGhh
dCBpb21tdV9mbHVzaF9hbGwoKSBkb2Vzbid0IGRvIHdoYXQgaXRzIG5hbWUgc2F5cy4gV2hpY2gK
d291bGQgYmUgcXVpdGUgYmFkLiBCdXQKCltvcmlnXQppb21tdV9mbHVzaF9hbGwoKQotPiBpb21t
dV9mbHVzaF9pb3RsYl9nbG9iYWwoZmx1c2hfbm9uX3ByZXNlbnRfZW50cnk9MCkKLT4gZmx1c2gt
PmlvdGxiKERNQV9UTEJfR0xPQkFMX0ZMVVNILCBmbHVzaF9ub25fcHJlc2VudF9lbnRyeT0wKQoK
W3BhdGNoXQppb21tdV9mbHVzaF9pb3RsYl9hbGwoKQotPiBpb21tdV9mbHVzaF9pb3RsYihkbWFf
b2xkX3B0ZV9wcmVzZW50PTAsIHBhZ2VfY291bnQ9MCkKLT4gaW9tbXVfZmx1c2hfaW90bGJfZHNp
KGZsdXNoX25vbl9wcmVzZW50X2VudHJ5PTApCi0+IGZsdXNoLT5pb3RsYihETUFfVExCX0RTSV9G
TFVTSCwgZmx1c2hfbm9uX3ByZXNlbnRfZW50cnk9MCkKCnN1Z2dlc3RzIHRvIG1lIHRoYXQgKGFz
IG9uZSB3b3VsZCBpbmZlciBmcm9tIHRoZSBuYW1lcykgaXMgdGhlCm1vcmUgdGhyb3VnaCBmbHVz
aC4gSSBtdXN0IGJlIG92ZXJsb29raW5nIHNvbWV0aGluZyAuLi4KCkphbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
