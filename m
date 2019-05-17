Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B97C5215B0
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2019 10:50:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRYVf-0003U6-9N; Fri, 17 May 2019 08:46:35 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i9tk=TR=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hRYVe-0003U0-AK
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 08:46:34 +0000
X-Inumbo-ID: 45083e9a-7880-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 45083e9a-7880-11e9-8980-bc764e045a96;
 Fri, 17 May 2019 08:46:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6FAD80D;
 Fri, 17 May 2019 01:46:31 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C5EB63F575;
 Fri, 17 May 2019 01:46:30 -0700 (PDT)
To: Alistair Francis <alistair23@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <20190516000212.13468-2-alistair.francis@wdc.com>
 <5CDD3C4B020000780022F8BE@prv1-mh.provo.novell.com>
 <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b3621bcf-89d0-22a0-2416-4cf5a341d13a@arm.com>
Date: Fri, 17 May 2019 09:46:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKPhUK9LDpJA8+H16uO4augfEHW+WdnBMjZzdwHa3dM8YA@mail.gmail.com>
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNi8wNS8yMDE5IDIwOjMwLCBBbGlzdGFpciBGcmFuY2lzIHdyb3RlOgo+IE9uIFRodSwg
TWF5IDE2LCAyMDE5IGF0IDM6MzIgQU0gSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPiB3
cm90ZToKPj4KPj4+Pj4gT24gMTYuMDUuMTkgYXQgMDI6MDIsIDxhbGlzdGFpci5mcmFuY2lzQHdk
Yy5jb20+IHdyb3RlOgo+Pj4gTWFrZSB0aGUgYXNtL3ZwbDAxMS5oIGRlcGVuZGVudCBvbiB0aGUg
QVJNIGFyY2hpdGVjdHVyZS4KPj4KPj4gQnV0IHdlIG9ubHkgaGF2ZSB4ODYgYW5kIEFybSByaWdo
dCBub3cuIEEgd29yZCBtb3JlIGFib3V0Cj4+IHlvdXIgbW90aXZhdGlvbiB3b3VsZCBoZWxwLgo+
IAo+IEFzIHRoZSBjb2RlIGN1cnJlbnRseSBpcyBubyBvbmUgY2FuIGFkZCBhbm90aGVyIGFyY2hp
dGVjdHVyZS4gVGhpcyBpcwo+IGp1c3QgYSBnZW5lcmFsIGZpeHVwIGFzIGFzc3VtaW5nIFhlbiB3
aWxsIG9ubHkgZXZlciBzdXBwb3J0IHR3byBhcmNocwo+IHNlZW1zIHN0cmFuZ2UuCgpBdCB3aGlj
aCBwb2ludCwgd291bGRuJ3QgaXQgYmUgYmV0dGVyIHRvIGF2b2lkICNpZmRlZiBBUkNIIGluIGNv
bW1vbiBjb2RlPyAKSW5zdGVhZCwgd2UgY291bGQgcHJvdmlkZSBhcmNoIGhlbHBlciBhbmQvb3Ig
bW9yZSBtZWFuaW5nIENPTkZJRyBuYW1lLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
