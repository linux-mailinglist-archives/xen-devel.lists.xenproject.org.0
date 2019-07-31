Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047E7C0CE
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:12:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnQe-0005jQ-LH; Wed, 31 Jul 2019 12:10:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8Zog=V4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hsnQd-0005jL-BV
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:09:59 +0000
X-Inumbo-ID: 1bf0f50a-b38c-11e9-bc9d-a7e782f3c5e5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1bf0f50a-b38c-11e9-bc9d-a7e782f3c5e5;
 Wed, 31 Jul 2019 12:09:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B4BE344;
 Wed, 31 Jul 2019 05:09:55 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23F803F575;
 Wed, 31 Jul 2019 05:09:54 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>
References: <20190731081041.25256-1-viktor.mitin.19@gmail.com>
 <934d90a9-0b01-1b5a-0d41-c7692c9a29ec@arm.com>
 <CAOcoXZbP_e7Ye4wTTyA9a=tF240EHQwb7+ikJ4ZCq+VQ0XKL_g@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0dfaf046-3dbd-4960-d9ab-987863217f5b@arm.com>
Date: Wed, 31 Jul 2019 13:09:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOcoXZbP_e7Ye4wTTyA9a=tF240EHQwb7+ikJ4ZCq+VQ0XKL_g@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] xen/doc: Improve Dom0-less documentation
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
 Viktor Mitin <viktor_mitin@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gMzEvMDcvMjAxOSAwOTo1NywgVmlrdG9yIE1pdGluIHdyb3RlOgo+IE9u
IFdlZCwgSnVsIDMxLCAyMDE5IGF0IDExOjQwIEFNIEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+IHdyb3RlOgo+PiBJIGNhbiBzd2l0Y2ggdGhlIG1lbW9yeSBwcm9wZXJ0eSBiYWNr
IHRvIGhleGFkZWNpbWFsIG9uIGNvbW1pdC4gQnV0IEkKPj4gd291bGQgbGlrZSB0byB1bmRlcnN0
YW5kIHdoeSB0aGUgdmFsdWUgaGFzIGNoYW5nZWQgYmVmb3JlIGRvaW5nIHRoYXQuCj4gCj4gT2ss
IGxldCdzIGtlZXAgaGV4YWRlY2ltYWwuCj4gMTI4TWIgaXMgb2sgaW4gdGhpcyBleGFtcGxlLCBJ
IHVzZSA1MTJNYiBmb3IgbXkgdGVzdHMsCj4gc28gd2hpbGUgdGVzdGluZyB0aGlzIGV4YW1wbGUg
SSBjaGFuZ2VkIGl0IGFuZCBkaWRuJ3QgcmVzdG9yZS4KPiAKPiBUaGlzIHNob3VsZCBiZSBsZWZ0
IHVudG91Y2hlZCwgYXMgeW91IG1lbnRpb25lZC4KPiBtZW1vcnkgPSA8MHgwIDB4MjAwMDA+OwoK
QWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpJIHdpbGwgY29t
bWl0IGl0IHNvb24uIFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
