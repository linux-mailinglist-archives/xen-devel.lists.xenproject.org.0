Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B784CD0EB1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 14:28:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIB17-0004wk-ER; Wed, 09 Oct 2019 12:24:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iIB16-0004wd-0H
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 12:24:32 +0000
X-Inumbo-ID: be72f7a8-ea8f-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be72f7a8-ea8f-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 12:24:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3B998AC32;
 Wed,  9 Oct 2019 12:24:30 +0000 (UTC)
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
References: <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
 <20191009110051.GP8065@mail-itl>
 <3a75989f-d655-3bb7-4a71-5421c6f8a625@suse.com>
 <20191009115254.GQ8065@mail-itl>
 <26a97d5f-5100-19ea-a945-f2954a3d9d09@suse.com>
 <20191009122109.GR8065@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bddff3b2-a0cc-1a7e-8702-86bea33c9e16@suse.com>
Date: Wed, 9 Oct 2019 14:24:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009122109.GR8065@mail-itl>
Content-Language: en-US
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxNDoyMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToK
PiBPbiBXZWQsIE9jdCAwOSwgMjAxOSBhdCAwMjowNzowNVBNICswMjAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPj4gT24gMDkuMTAuMjAxOSAxMzo1MiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp
ICB3cm90ZToKPj4+IEknbSB0YWxraW5nIGFib3V0IFhlbi0+WGVuIHRyYW5zaXRpb24gaGVyZS4g
SG93IHN5c3RlbSB0YWJsZSBwb2ludGVyIGlzCj4+PiBwYXNzZWQgZnJvbSBvbGQgWGVuIHRvIG5l
dyBYZW4gaW5zdGFuY2U/IEFuZCBob3cgdGhlIG5ldyBYZW4gaW5zdGFuY2UKPj4+IGRlYWxzIHdp
dGggYm9vdCBzZXJ2aWNlcyBiZWluZyBub3QgYXZhaWxhYmxlIGFueW1vcmU/Cj4+Cj4+IEl0IGRv
ZXNuJ3QuIEkgc2hvdWxkIGJldHRlciBoYXZlIHNhaWQgIiogLT4gWGVuIHRyYW5zaXRpb25zIiBp
bgo+PiBteSBlYXJsaWVyIHJlcGx5LiBJIHNpbXBseSBjYW4ndCBzZWUgaG93IHRoaXMgY2FuIGFs
bCB3b3JrIHdpdGgKPj4gRUZJIHVuZGVybmVhdGggd2l0aG91dCBzb21lIGV4dHJhIGNvbnZleWlu
ZyBvZiBkYXRhIGZyb20gdGhlIG9sZAo+PiB0byB0aGUgbmV3IGluc3RhbmNlLgo+IAo+IERvZXMg
aXQgbWVhbiB0aGUgd2hvbGUgZGlzY3Vzc2lvbiBhYm91dCBTZXRWaXJ0dWFsQWRkcmVzc01hcCgp
IGJlaW5nCj4gaW5jb21wYXRpYmxlIHdpdGgga2V4ZWMgaXMgbW9vdCwgYmVjYXVzZSBydW50aW1l
IHNlcnZpY2VzIChpbmNsdWRpbmcKPiBTZXRWaXJ0dWFsQWRkcmVzc01hcCgpKSBhcmUgbm90IHVz
ZWQgYnkgWGVuIGFmdGVyIGtleGVjIGFueXdheT8gSWYgSQo+IHVuZGVyc3RhbmQgY29ycmVjdGx5
LCB5b3UganVzdCBzYWlkIHRoZSBYZW4gYWZ0ZXIga2V4ZWMgZG9uJ3QgaGF2ZQo+IHJ1bnRpbWUg
c2VydmljZXMgcG9pbnRlci4KClRoZSBjb25jZXJuIGlzIGFib3V0IGtleGVjLWluZyB0byBMaW51
eCAoYmFzZWQgb24gd2hhdCBJIHJlY2FsbApmcm9tIHdoZW4gSSB3cm90ZSB0aGlzIGNvZGU7IGFz
IHNhaWQgdGhlIHNpdHVhdGlvbiBtYXkgaGF2ZQpjaGFuZ2VkIGZvciBtb2Rlcm4gTGludXgpLgoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
