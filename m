Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E05647C511
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 16:38:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsphD-0001Rt-Th; Wed, 31 Jul 2019 14:35:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsphC-0001Ro-Qm
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 14:35:14 +0000
X-Inumbo-ID: 683bc7f4-b3a0-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 683bc7f4-b3a0-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 14:35:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D3BD344;
 Wed, 31 Jul 2019 07:35:13 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA3933F694;
 Wed, 31 Jul 2019 07:35:12 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190731102856.23215-1-viktor.mitin.19@gmail.com>
 <20190731102856.23215-2-viktor.mitin.19@gmail.com> <877e7yidsl.fsf@epam.com>
 <CAOcoXZbZmAxUYf4jpg1JrurJxSe-vEtV4-Y6=FWaJ0GHbz_WHg@mail.gmail.com>
 <875zniiao3.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <76a13c39-9b8b-eb3d-cf71-3603ac63c041@arm.com>
Date: Wed, 31 Jul 2019 15:35:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <875zniiao3.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/2] xen/arm: merge make_timer_node and
 make_timer_domU_node
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <Viktor_Mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMzEvMDcvMjAxOSAxNDo0MSwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4gVmlrdG9yIE1pdGluIHdyaXRlczoKPj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMzoz
MyBQTSBWb2xvZHlteXIgQmFiY2h1awo+PiA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+Pj4gU28sIHByZXZpb3VzbHkgdGhpcyBjb2RlIGNvcGllZCAiY29tcGF0aWJsZSIgcHJv
cGVydHkgZnJvbSBwbGF0Zm9ybQo+Pj4gZGV2aWNlIHRyZWUuIFBsZWFzZSBub3RlLCB0aGF0IHRo
ZW9yZXRpY2FsbHkgaXQgd291bGQgYmUgbmVpdGhlcgo+Pj4gImFybSxhcm12OC10aW1lciIgbm90
ICJhcm0sYXJtdjctdGltZXIiLiBOb3cgeW91IGFyZSBzZXR0aW5nIG9uZSBvZiB0aGUKPj4+IHR3
byB2YWx1ZXMuIEknbSBub3Qgc3VyZSBpZiB0aGlzIGlzIHJpZ2h0IHRoaW5nIHRvIGRvIGluIHRo
ZSBmaXJzdAo+Pj4gcGxhY2UuIFByb2JhYmx5IHdlIG5lZWQgY29tbWVudCBmcm9tIEp1bGllbi4g
QnV0IHRoaXMgY2hhbmdlIHNob3VsZCBiZQo+Pj4gcmVmbGVjdGVkIGluIHRoZSBjb21taXQgbWVz
c2FnZS4KPj4KPj4gV2VsbCwgaXQgaXMgZG9uZSwgYmVjYXVzZSBKdWxpZW4gcHJlZmVycmVkIGRv
bVUgdmFyaWFudCBhcyBtb3JlIHNpbXBsZSBvbmUuCj4+IEFjdHVhbGx5IEkgaGF2ZSBjaGVja2Vk
IHRoYXQgYm90aCB2YXJpYXRzIHdvcmtzIHdlbGwsIGJ1dCBrZXB0IGRvbVUgY2FzZS4KPiBNeSBj
b25jZXJuIGlzIHRoYXQgeW91IGFyZSBjaGFuZ2luZyBmdW5jdGlvbiBiZWhhdmlvciBpbgo+IG5v
bi1iYWNrd2FyZCBjb21wYXRpYmxlIHdheS4gWWVzLCBpdCBpcyB3b3JraW5nIG9uIHlvdXIgcGxh
dGZvcm0uIEJ1dAo+IHdoYXQgYWJvdXQgb3RoZXJzPwoKVGhlcmUgYXJlIG9ubHkgb2ZmaWNpYWwg
dGhyZWUgY29tcGF0aWJsZSBleGlzdGluZyBmb3IgdGhlIGFyY2ggdGltZXI6CiAgICAtIGFybSxh
cm12Ny10aW1lcgogICAgLSBhcm0sYXJtdjgtdGltZXIKICAgIC0gYXJtLGNvcnRleC1hMTUtdGlt
ZXIKClRoZSBsYXR0ZXIgc2hvdWxkIGFsd2F5cyBoYXZlIGFsc28gYXJtLGFybXY3LXRpbWVyLiBB
bnkgT1MgcnVubmluZyBvbiBYZW4gc2hvdWxkIApub3QgYXNzdW1lIHRoYXQgYSBzcGVjaWZpYyBw
cm9wZXJ0eSBzaG91bGQgYmUgdGhlcmUuIElmIGl0IGlzIG5vdCB0aGUgY2FzZSwgdGhlbiAKZml4
IHlvdXIgT1MuCgpJIGFtIGFsc28gZGlzY2FyZGluZyBhbnkgb3RoZXIgcHJvcGVydHkgY29tcGF0
aWJsZSBhcyB0aGV5IGFyZSBwcm9iYWJseSAKb3V0LW9mLXRyZWUgYW5kIHRoZXJlZm9yZSBub3Qg
c3VwcG9ydGVkLgoKRm9yIDY0LWJpdCBkb21haW4sIHlvdSBjYW4gb25seSBldmVyIHJ1biBvbiBB
cm12OCBwbGF0Zm9ybSBzbyB0aGVyZSBhcmUgbm8gCmNoYW5nZSBoZXJlLgoKRm9yIDMyLWJpdCBk
b21haW4sIHlvdSBjYW4gcnVuIG9uIGVpdGhlciBBcm12OCBhbmQgQXJtdjcgcGxhdGZvcm0uIEl0
IGlzIGEgZ3JleSAKYXJlYSB3aGVyZSB5b3Ugc2hvdWxkIHBhc3MgYSBkaWZmZXJlbnQgcHJvcGVy
dHkgZGVwZW5kaW5nIG9uIHRoZSBwbGF0Zm9ybSB5b3UgCmFyZS4gTGlieGwgaXMgYWx3YXlzIHBh
c3NpbmcgYXJtdjcgc28gSSB3b3VsZCBwcmVmZXIgdG8ga2VlcCBsaWtlIHRoYXQuCgpUaGUgbWFp
biBkaWZmZXJlbmNlIHdpdGggdGhpcyBwYXRjaCB3aWxsIGJlIGZvciAzMi1iaXQgZG9tMC4gVGhl
eSB3aWxsIGFsd2F5cyAKc2VlIEFybXY3IGNvbXBhdGlibGUgZXZlbiB3aGVuIHJ1bm5pbmcgb24g
QXJtdjggcGxhdGZvcm0uCgpYZW4gMzItYml0IG9uIEFybXY4IHBsYXRmb3JtIGlzIG5vdCBzdXBw
b3J0ZWQuIFJ1bm5pbmcgMzItYml0IGRvbTAgb24gWGVuIDY0LWJpdCAKaXMgdmVyeSB1bmxpa2Vs
eS4KClNvIEkgZG9uJ3QgaGF2ZSBhbnkgbWFqb3IgY29uY2VybnMgd2l0aCB0aGlzIGNoYW5nZS4g
VGhpcyBoYXMgdGhlIGFkdmFudGFnZSB0byAKdW5pZm9ybWl6ZSB0aGUgd2F5IGFyY2ggdGltZXIg
aXMgZXhwb3NlZCB0byBhbGwgdGhlIGd1ZXN0cy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
