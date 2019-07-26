Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBDD76C74
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 17:17:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1tz-0000m9-0h; Fri, 26 Jul 2019 15:12:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ymAH=VX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hr1tx-0000m4-Sh
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 15:12:57 +0000
X-Inumbo-ID: d7edeb1a-afb7-11e9-ac5c-4bcf5c1d4d1d
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d7edeb1a-afb7-11e9-ac5c-4bcf5c1d4d1d;
 Fri, 26 Jul 2019 15:12:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D698337;
 Fri, 26 Jul 2019 08:12:54 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8CF63F71F;
 Fri, 26 Jul 2019 08:12:52 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <119d0edb-cb12-fbad-9e3e-8c0a469983df@arm.com>
 <CABfawh=DwOP5eQYmMVNF+n-khkbEDFia0eo=JbE0yhCKjV_+8Q@mail.gmail.com>
 <fcbf4968-7b82-6e5d-75ae-e4c2ff059b4d@arm.com>
 <CABfawhnk+_ssU1xEzN6O+_JkH4jT2NguP30VRpkNKzc7xoKeXw@mail.gmail.com>
 <d60c933e-7f30-191c-2d75-4558223ef3e4@arm.com>
 <CAOcoXZYA4oC+ZXkfS4CQVs6JhkR+pAONgyg1ZfWzo+Q=GcAWQA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9e9d6fbf-ecdb-4e3f-89ae-beb13243d9e1@arm.com>
Date: Fri, 26 Jul 2019 16:12:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZYA4oC+ZXkfS4CQVs6JhkR+pAONgyg1ZfWzo+Q=GcAWQA@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
Cc: Artem Mygaiev <Artem_Mygaiev@epam.com>, Lars Kurth <lars.kurth@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Iurii Artemenko <Iurii_Artemenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gMjYvMDcvMjAxOSAxNTo1OCwgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9u
IEZyaSwgSnVsIDE5LCAyMDE5IGF0IDExOjM3IEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+Pgo+PiBIaSBUYW1hcywKPj4KPj4gT24gMTgvMDcvMjAxOSAxODoy
MiwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+Pj4+ICAgICAgLSBMaW5lIDEzOTogVGhlIHsgYXJl
IGNvbW1vbmx5IG9uIHRoZSBzYW1lIGxpbmUgYXMgc3RydWN0IG9yIGRlZmluaXRpb24uCj4+Pgo+
Pj4gQWNjb3JkaW5nIHRvIENPRElOR19TVFlMRSB0aGF0J3Mgbm90IGhvdyBpdCBzaG91bGQgYmUu
Cj4+Cj4+IEkgZ3Vlc3MgeW91IHJlZmVyIHRvIHRoZSBzZWN0aW9uICJCcmFjaW5nIi4gSWYgc28s
IEkgdGhpbmsgd2UgZG9uJ3QgZm9sbG93IHRoZQo+PiBDT0RJTkdfU1RZTEUgZm9yIHN0cnVjdCBv
ciBkZWZpbml0aW9uLgo+Pgo+PiBJIGhhdmUgdG8gYWRtaXQgdGhhdCBmb3IgdGhpcyBjYXNlLCBJ
IGFsd2F5cyBoYXZlIHRvIGxvb2sgYXQgb3RoZXIgdXNhZ2UgaW4gdGhlCj4+IGNvZGUgYmVjYXVz
ZSBJIHRlbmQgdG8gcHV0IHRoZSB7IG9uIGEgbmV3bGluZS4KPj4KPj4gSSB3YXMgZ29pbmcgdG8g
c2F5IHRoYXQgdGhlcmUgbWF5IGJlIHNvbWUgY2FzZXMgd2hlcmUgaXQgbWFrZXMgc2Vuc2UgdG8g
a2VlcCB7Cj4+IG9uIHRoZSBzYW1lIGxpbmUuIEZvciBpbnN0YW5jZToKPj4KPj4gICAgICB7IGEs
IGIsIGMsIGQgfSwKPj4gICAgICB7IGUsIGYsIGcsIGggfSwKPj4KPiAKPiBBbGwgdGhlIHJ1bGVz
IHNob3VsZCBiZSBzdGF0ZWQgaW4gQ09ESU5HX1NUWUxFIGV4cGxpY2l0bHkuCj4gSW4gb3RoZXIg
Y2FzZXMsIGl0IGNhbm5vdCBiZSBhdXRvbWF0ZWQgd2l0aCBmdXR1cmUgcHJvdmVzIHdoeSBpdCB3
b3Jrcwo+IHRoaXMgb3IgdGhhdCB3YXkuCgpUaGlzIGlzIG5vdCB2ZXJ5IGNvbnN0cnVjdGl2ZSB0
byBzZW5kIG9uIG11bHRpcGxlIGRpZmZlcmVudCB0aHJlYWRzICJ0aGlzIHNob3VsZCAKYmUgZXhw
bGljaXRseSBiZSBpbiB0aGUgQ09ESU5HX1NUWUxFIi4gTW9zdCBvZiB0aGUgcGVvcGxlIGluIEND
IGFyZSBhd2FyZSB0aGlzIAppcyBhbiBpc3N1ZS4KCkJ1dCB0aGUgcHJvYmxlbSBoZXJlIGlzIGNv
ZGlmeWluZyB0aG9zZSBzdHlsZXMuIFRoaXMgb2Z0ZW4gcmVzdWx0cyBpbiBhIGxvdCBvZiAKZGlz
Y3Vzc2lvbnMgYmVjYXVzZSBhIGxvdCBpcyBhIG1hdHRlciBvZiB0YXN0ZS4gSW4gb3RoZXIgdGhl
cmUgYXJlIG5vIGFuc3dlcnMgdG8gCnRoZSBwYXRjaGVzLgoKV2hhdCB3ZSBuZWVkIGlzIHNvbWVv
bmUgdG8gZHJpdmUgdGhpcyBlZmZvcnQgYW5kIG1ha2Ugc3VyZSB3ZSBtYWtlIHNvbWUgcHJvZ3Jl
c3MuCgpBbHNvLCB0cnlpbmcgdG8gY29kaWZ5IGFsbCB0aGUgdW53cml0dGVuIHN0eWxlcyBpcyBw
cm9iYWJseSBnb2luZyB0byBiZSAKZGlmZmljdWx0LiBJbnN0ZWFkLCBJIHdvdWxkIHN1Z2dlc3Qg
dG8gc3RhcnQgZnJvbSBhbiBleGlzdGluZyBjb2Rpbmcgc3R5bGUgdGhhdCAKaXMgdmVyeSBjbG9z
ZSB0byBYZW4gKG1heWJlIEJTRD8pLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
