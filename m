Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1B85A51
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 08:13:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvbbj-0005Ei-9Q; Thu, 08 Aug 2019 06:09:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvbbh-0005Ed-Nn
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 06:09:01 +0000
X-Inumbo-ID: 036da1b7-b9a3-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 036da1b7-b9a3-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 06:09:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 81221AF98;
 Thu,  8 Aug 2019 06:08:52 +0000 (UTC)
To: Oleksandr <olekstysh@gmail.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-4-git-send-email-olekstysh@gmail.com>
 <921ff67c-5a61-9f43-965e-e1b2075c2280@suse.com> <87sgqegji0.fsf@epam.com>
 <35f617e6-ccf8-3d2c-1a10-81b2e8c0b0a9@suse.com>
 <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1734478e-683f-5012-1c7d-2d9a72c0422f@suse.com>
Date: Thu, 8 Aug 2019 08:08:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7685ef41-54dd-5768-1a33-04f8ffea750f@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 3/6] [RFC] xen/common: Introduce
 _xrealloc function
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 "julien.grall@arm.com" <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAyMDozNiwgT2xla3NhbmRyIHdyb3RlOgo+PiBUaGVyZSdzIG9uZSBtb3Jl
IHRoaW5nIGZvciB0aGUgcmUtYWxsb2MgY2FzZSB0aG91Z2ggKGJlc2lkZXMKPj4gY29zbWV0aWMg
YXNwZWN0cyk6IFRoZSBpbmNvbWluZyBwb2ludGVyIHNob3VsZCBhbHNvIGJlIHZlcmlmaWVkCj4+
IHRvIGJlIG9mIGNvcnJlY3QgdHlwZS4KPiAKPiBKYW4sIGhvdyB0aGlzIGNvdWxkIGJlIHRlY2hu
aWNhbGx5IGltcGxlbWVudGVkLCBvciBhcmUgdGhlc2UgYW55IGV4aXN0aW5nIGV4YW1wbGVzIGlu
IFhlbj8KClNlZSB4ODYncyBjb3B5X3RvX2d1ZXN0X29mZnNldCgpLCBmb3IgZXhhbXBsZS4gVG8g
Z2V0IHRoZSBjb21waWxlcgp0byBlbWl0IGEgd2FybmluZyAoYXQgbGVhc3QpLCBhICh0eXBpY2Fs
bHkgb3RoZXJ3aXNlIGRlYWQpCmNvbXBhcmlzb24gb2YgcG9pbnRlcnMgaXMgY29tbW9ubHkgdXNl
ZC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
