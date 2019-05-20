Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635EE230D7
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 11:59:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSf2M-0005w6-8o; Mon, 20 May 2019 09:56:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hSf2K-0005vx-2t
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 09:56:52 +0000
X-Inumbo-ID: 96761d60-7ae5-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 96761d60-7ae5-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 09:56:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D9186374;
 Mon, 20 May 2019 02:56:49 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AFA933F575;
 Mon, 20 May 2019 02:56:48 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
 <b3621bcf-89d0-22a0-2416-4cf5a341d13a@arm.com>
 <CAKmqyKN=HCwitx7StNKLmNhjVeXq0cEawyi+j9VJf5dkhfi=jQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e33cecca-a030-71bb-3606-04a4a61f1435@arm.com>
Date: Mon, 20 May 2019 10:56:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKN=HCwitx7StNKLmNhjVeXq0cEawyi+j9VJf5dkhfi=jQ@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] xen/drivers/char: Don't require vpl011
 for all non-x86 archs
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
Cc: Alistair Francis <alistair.francis@wdc.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQWxpc3RhaXIsCgpPbiAxNy8wNS8yMDE5IDIzOjAxLCBBbGlzdGFpciBGcmFuY2lzIHdyb3Rl
Ogo+IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDE6NDYgQU0gSnVsaWVuIEdyYWxsIDxqdWxpZW4u
Z3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+Cj4+IE9uIDE2LzA1LzIwMTkgMjA6MzAsIEFs
aXN0YWlyIEZyYW5jaXMgd3JvdGU6Cj4+PiBPbiBUaHUsIE1heSAxNiwgMjAxOSBhdCAzOjMyIEFN
IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+Pj4+PiBPbiAx
Ni4wNS4xOSBhdCAwMjowMiwgPGFsaXN0YWlyLmZyYW5jaXNAd2RjLmNvbT4gd3JvdGU6Cj4+Pj4+
IE1ha2UgdGhlIGFzbS92cGwwMTEuaCBkZXBlbmRlbnQgb24gdGhlIEFSTSBhcmNoaXRlY3R1cmUu
Cj4+Pj4KPj4+PiBCdXQgd2Ugb25seSBoYXZlIHg4NiBhbmQgQXJtIHJpZ2h0IG5vdy4gQSB3b3Jk
IG1vcmUgYWJvdXQKPj4+PiB5b3VyIG1vdGl2YXRpb24gd291bGQgaGVscC4KPj4+Cj4+PiBBcyB0
aGUgY29kZSBjdXJyZW50bHkgaXMgbm8gb25lIGNhbiBhZGQgYW5vdGhlciBhcmNoaXRlY3R1cmUu
IFRoaXMgaXMKPj4+IGp1c3QgYSBnZW5lcmFsIGZpeHVwIGFzIGFzc3VtaW5nIFhlbiB3aWxsIG9u
bHkgZXZlciBzdXBwb3J0IHR3byBhcmNocwo+Pj4gc2VlbXMgc3RyYW5nZS4KPj4KPj4gQXQgd2hp
Y2ggcG9pbnQsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBhdm9pZCAjaWZkZWYgQVJDSCBpbiBj
b21tb24gY29kZT8KPj4gSW5zdGVhZCwgd2UgY291bGQgcHJvdmlkZSBhcmNoIGhlbHBlciBhbmQv
b3IgbW9yZSBtZWFuaW5nIENPTkZJRyBuYW1lLgo+IAo+IEknbSBub3Qgc3VyZSBpZiB0aGUgYXJj
aCBoZWxwZXJzIGFyZSBhbnkgZWFzaWVyIHRvIHVuZGVyc3RhbmQuIE1heWJlCj4gdGhhdCBpcyB3
b3J0aCBsb29raW5nIGludG8sIGF0IHRoZSBtb21lbnQgdGhvdWdoIEkgc3RpbGwgdGhpbmsgaXQK
PiBtYWtlcyBzZW5zZSB0byBmaXggdGhpcyAjaWZkZWYuCgpXZWxsLCBJIGRvbid0IHRoaW5rIHdl
IHdvdWxkIHdhbnQgYW4gI2Vsc2VpZiBkZWZpbmVkKENPTkZJR19ORVdfQVJDSCkgZm9yIGFkZGlu
ZyAKeW91ciBuZXcgYXJjaGl0ZWN0dXJlIHNwZWNpZmljIGluY2x1ZGUuIFRoaXMgaXMgZGVmZWF0
aW5nIHRoZSBwdXJwb3NlIG9mIGNvbW1vbiAKY29kZS4KCkluIHRoaXMgY2FzZSwgdGhlIGNvZGUg
dXNpbmcgdGhlIGhlYWRlciBpcyBwcm90ZWN0ZWQgYnkgCkNPTkZJR19TQlNBX1ZVQVJUX0NPTlNP
TEUuIFNvIEkgd291bGQgdXNlIHRoYXQgaW5zdGVhZCBvZiBDT05GSUdfQVJNLgoKQ2hlZXJzLAoK
LS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
