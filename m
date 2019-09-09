Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C6DAD92E
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 14:39:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Ivh-00076P-CR; Mon, 09 Sep 2019 12:38:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7Ive-00076I-Ud
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 12:37:58 +0000
X-Inumbo-ID: a72b2b68-d2fe-11e9-b76c-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id a72b2b68-d2fe-11e9-b76c-bc764e2007e4;
 Mon, 09 Sep 2019 12:37:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B6D28;
 Mon,  9 Sep 2019 05:37:57 -0700 (PDT)
Received: from [10.37.12.117] (unknown [10.37.12.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E89D3F59C;
 Mon,  9 Sep 2019 05:37:56 -0700 (PDT)
To: Jan Beulich <jbeulich@suse.com>, Oleksandr <olekstysh@gmail.com>
References: <1566324587-3442-1-git-send-email-olekstysh@gmail.com>
 <1566324587-3442-7-git-send-email-olekstysh@gmail.com>
 <20f3a150-3619-deea-d0cd-fefe7f062a4f@suse.com>
 <d38bc9d3-1e34-66d4-8eea-baa1ebe0f195@gmail.com>
 <3a2d392f-a976-8a0f-af5f-041b2904325c@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <34824398-d170-9c60-ee38-ee14c70e4aa8@arm.com>
Date: Mon, 9 Sep 2019 13:37:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3a2d392f-a976-8a0f-af5f-041b2904325c@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V3 6/8] iommu: Add of_xlate callback
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA4LzI3LzE5IDQ6MTEgUE0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI3LjA4LjIw
MTkgMTY6NTksIE9sZWtzYW5kciB3cm90ZToKPj4gVGhlcmUgd2FzIGEgcHJlZmVyZW5jZSB0byBp
bnRyb2R1Y2UgY2FsbGJhY2sgaW4gYSBzZXBhcmF0ZSBwYXRjaCBbMl0uIAo+PiBBbnl3YXksIHNo
YWxsIEkgZm9sZCBpdD8KPiAKPiBIbW0sIEkgZGlzYWdyZWUgd2l0aCBKdWxpZW4gaGVyZS4gSSBk
b24ndCB0aGluayB3ZSBzaG91bGQgaGF2ZSB1bnVzZWQKPiBob29rcyBpbiB0aGUgdHJlZSwgbm90
IGV2ZW4gaW50ZXJtZWRpYXRlbHkuCgpJIGhhdmUgc3RhdGVkIG15IHByZWZlcmVuY2UgYmVmb3Jl
LCBidXQgdGhpcyBpcyBub3QgYSBzdHJvbmcgb25lIG5vciBhIAptdXN0LiBJZiB0aGlzIGlzIHlv
dXIgY29uZGl0aW9uIHRvIGdldCB0aGUgc2VyaWVzIGFjY2VwdGVkLCB0aGVuIApPbGVrc2FuZHIg
c2hvdWxkIGZvbGxvdyB5b3VyIHJlcXVlc3RlZC4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
