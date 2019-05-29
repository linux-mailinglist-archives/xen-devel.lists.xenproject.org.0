Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A4E2E115
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 17:30:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hW0UD-00053X-Eq; Wed, 29 May 2019 15:27:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MUVL=T5=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hW0UB-00053J-Tk
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 15:27:27 +0000
X-Inumbo-ID: 4346d619-8226-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4346d619-8226-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 15:27:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3812341;
 Wed, 29 May 2019 08:27:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64FB23F5AF;
 Wed, 29 May 2019 08:27:24 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com> <87a7fh8cr4.fsf@epam.com>
 <25b160f5-2f7d-40d9-8feb-9ea63a8a153f@arm.com> <878sv18977.fsf@epam.com>
 <2b392d1c-0837-4395-8ddc-f0cc04bbea83@arm.com> <875zpt8p58.fsf@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <bbf757b2-8727-0440-42d7-75bf024c6d47@arm.com>
Date: Wed, 29 May 2019 16:27:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <875zpt8p58.fsf@epam.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVm9sb2R5bXlyLAoKT24gMjkvMDUvMjAxOSAxMjo0MCwgVm9sb2R5bXlyIEJhYmNodWsgd3Jv
dGU6Cj4+Pj4gT24gMjAvMDUvMjAxOSAxNDo0MSwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6Cj4+
Pj4+IEp1bGllbiBHcmFsbCB3cml0ZXM6Cj4+Pj4gSWYgeW91IHJlYWQgbXkgcHJldmlvdXMgZS1t
YWlsLCBJIGRpZG4ndCBjb21wbGV0ZWx5IHJlamVjdCB0aGUKPj4+PiBhcHByb2FjaCBpbiBteSBw
cmV2aW91cyBlLW1haWwuIEkgcG9pbnRlZCBvdXQgdGhhdCB0aGUgdXNlciBtYXkgYmUKPj4+PiBt
aXNsZWQgb2YgdGhlIG5hbWUgYW5kIGhlbmNlIGRvY3VtZW50YXRpb24gd291bGQgYmUgdXNlZnVs
Lgo+Pj4KPj4+IEknbSBva2F5IHdpdGggdGhpcy4gQW55IGlkZWFzIGhvdyB0byBkb2N1bWVudCBp
dD8KPj4KPj4gV2UgZG9uJ3Qgc2VlbSB0byBoYXZlIGEgcGxhY2UgdG9kYXkgd2hlcmUgd2UgZG9j
dW1lbnQgdGhlIGRlZmNvbmZpZy4gSQo+PiBhbSB0aGlua2luZyB0byBwdXQgdGhhdCBpbiBkb2Nz
L21pc2MvYXJtLgo+Pgo+PiBJIHdvdWxkIGRvY3VtZW50IHRoZSBwdXJwb3NlIG9mIGVhY2ggY29u
ZmlnLiBUaGUgZG9jdW1lbnRhdGlvbiBjb3VsZAo+PiBiZSBpbiBhIHNlcGFyYXRlIHBhdGNoLgo+
IE9rYXkuIFdpbGwgaXQgYmUgb2theSwgaWYgSSdsbCBzZW5kIGl0IGFzIGEgc2VwYXJhdGUgcGF0
Y2g/IFlvdSBjYW4KPiBjb21taXQgYWxsIHRocmVlIHBhdGNoZXMgaW4gYSByb3cuIE9yIHNob3Vs
ZCBJIHNlbnQgYW5vdGhlciB2ZXJzaW9uIHdpdGgKPiBhbGwgdGhyZWUgcGF0Y2hlcz8KClBsZWFz
ZSByZXNlbmQgdGhlIHNlcmllcy4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
