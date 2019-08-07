Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CEC84C53
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 15:04:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvLZu-00029u-Eo; Wed, 07 Aug 2019 13:02:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WZHT=WD=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hvLZt-00029k-CK
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 13:02:05 +0000
X-Inumbo-ID: 8d6ee7f0-b913-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 8d6ee7f0-b913-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 13:02:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C37CB28;
 Wed,  7 Aug 2019 06:02:03 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 389E13F575;
 Wed,  7 Aug 2019 06:02:03 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c51c823c-b288-25f4-8bd0-7e4c8e1c15c8@arm.com>
Date: Wed, 7 Aug 2019 14:02:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807125725.31683-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v8 0/2] xen/arm: Consolidate make_timer_node
 and make_timer_domU_node
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpQbGVhc2UgZ2l2ZSBzb21lIHRpbWUgZm9yIHJldmlld2VycyB0byByZXZpZXcgdGhlIGZ1
bGwgc2VyaWVzLi4uIEkgYW0gc3RpbGwgCndyaXRpbmcgYW4gYW5zd2VyIG9uIHBhdGNoICMyIGlu
IHY3Li4uCgpZb3Ugc2hvdWxkIGF0IGxlYXN0IHdhaXQgZm9yIHJldmlldyBvbiB0aGUgc2VyaWVz
IGJlZm9yZSBzZW5kaW5nIGEgbmV3IHZlcnNpb24uIApUaGlzIHdvdWxkIGhhdmUgbGlrZWx5IGF2
b2lkZWQgdG8gYmUgYXQgdjggZm9yIHN1Y2ggc2VyaWVzLgoKSW4gdGhpcyBjYXNlLCBJIGRvbid0
IHRoaW5rIHRoZXJlIHdhcyBhbnl0aGluZyByZXF1aXJpbmcgYSB2OC4KCkNoZWVycywKCk9uIDA3
LzA4LzIwMTkgMTM6NTcsIFZpa3RvciBNaXRpbiB3cm90ZToKPiBGdW5jdGlvbnMgbWFrZV90aW1l
cl9ub2RlIGFuZCBtYWtlX3RpbWVyX2RvbVVfbm9kZSBhcmUgcXVpdGUgc2ltaWxhciwKPiBzbyBp
dCBpcyBiZXR0ZXIgdG8gY29uc29saWRhdGUgdGhlbSB0byBhdm9pZCBkaXNjcmVwYW5jeS4KPiAK
PiBUaGlzIHBhdGNoIHNlcmllcyBhY2hpdmVzIHRoaXMgZ29hbCBpbiB0d28gc3RlcHM6Cj4gLSBF
eHRlbmQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMgdG8gZGVhbCB3aXRoIG90aGVyIGRvbWFpbiB0
aGFuIHRoZSBod2RvbS4KPiAtIENvbnNvbGlkYXRlIG1ha2VfdGltZXJfbm9kZSBhbmQgbWFrZV90
aW1lcl9kb21VX25vZGUgaW50byBvbmUgZnVuY3Rpb246Cj4gCj4gVmlrdG9yIE1pdGluICgyKToK
PiAgICB4ZW4vYXJtOiBleHRlbmQgZmR0X3Byb3BlcnR5X2ludGVycnVwdHMgdG8gc3VwcG9ydCBE
b21VCj4gICAgeGVuL2FybTogY29uc29saWRhdGUgbWFrZV90aW1lcl9ub2RlIGFuZCBtYWtlX3Rp
bWVyX2RvbVVfbm9kZQo+IAo+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jIHwgMTE4ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQ0
IGluc2VydGlvbnMoKyksIDc0IGRlbGV0aW9ucygtKQo+IAoKLS0gCkp1bGllbiBHcmFsbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
