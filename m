Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AA04E36B
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2019 11:23:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1heFix-000661-H6; Fri, 21 Jun 2019 09:20:47 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xCuY=UU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1heFiv-00065v-QZ
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2019 09:20:45 +0000
X-Inumbo-ID: d8e98fbe-9405-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id d8e98fbe-9405-11e9-8980-bc764e045a96;
 Fri, 21 Jun 2019 09:20:44 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75DD8142F;
 Fri, 21 Jun 2019 02:20:44 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2C4A3F246;
 Fri, 21 Jun 2019 02:20:43 -0700 (PDT)
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20190620174706.16657-1-julien.grall@arm.com>
 <cfcff0de-3c58-f487-37f3-7dcdc6314161@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1ccf19b4-e09f-5a54-5ac1-8362a5e8b261@arm.com>
Date: Fri, 21 Jun 2019 10:20:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <cfcff0de-3c58-f487-37f3-7dcdc6314161@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PRE-4.12 PATCH] xen/arm: time: cycles_t should be
 an uint64_t and not unsigned long
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
Cc: sstabellini@kernel.org, ian.jackson@eu.citrix.com, jbeulich@suse.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAyMC8wNi8yMDE5IDE4OjUwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDIwLzA2
LzIwMTkgMTg6NDcsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gU2luY2UgY29tbWl0IGNhNzNhYzhl
N2QgInhlbi9hcm06IEFkZCBhbiBpc2IoKSBiZWZvcmUgcmVhZGluZyBDTlRQQ1RfRUwwCj4+IHRv
IHByZXZlbnQgcmUtb3JkZXJpbmciLCBnZXRfY3ljbGVzKCkgaXMgbm93IHJldHVybmluZyB0aGUg
bnVtYmVyIG9mCj4+IGN5Y2xlcyBhbmQgdXNlZCBpbiBtb3JlIGNhbGxlcnMuCj4+Cj4+IFdoaWxl
IHRoZSBjb3VudGVyIHJlZ2lzdGVycyBpcyBhbHdheXMgNjQtYml0LCBnZXRfY3ljbGVzKCkgd2ls
bCBvbmx5Cj4+IHJldXRybiBhIDMyLWJpdCBvbiBBcm0zMiBhbmQgdGhlcmVmb3JlIHRydW5jYXRl
IHRoZSB2YWx1ZS4gVGhpcyB3aWxsCj4gCj4gInJldHVybiAzMiBiaXRzIgoKWWVzLCBzb3JyeSBT
dGVmYW5vIGNvbW1pdHRlZCB3aXRob3V0IHRoaXMgY2hhbmdlLgoKQ2hlZXJzLAoKLS0gCkp1bGll
biBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
