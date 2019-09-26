Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB5BEFEA
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:44:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDRE9-0002Tp-VU; Thu, 26 Sep 2019 10:42:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fOM6=XV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iDRE8-0002Th-88
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:42:24 +0000
X-Inumbo-ID: 527bb688-e04a-11e9-964e-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 527bb688-e04a-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:42:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 801BF1000;
 Thu, 26 Sep 2019 03:42:22 -0700 (PDT)
Received: from [10.37.8.90] (unknown [10.37.8.90])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1333F67D;
 Thu, 26 Sep 2019 03:42:20 -0700 (PDT)
To: hongyax@amazon.com, xen-devel@lists.xenproject.org
References: <cover.1569489002.git.hongyax@amazon.com>
 <71e585138508d7d46c5349f72e1dfd3df8f2b595.1569489002.git.hongyax@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <ae90cecf-c7e4-a8e0-a907-88d4da861b03@arm.com>
Date: Thu, 26 Sep 2019 11:42:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <71e585138508d7d46c5349f72e1dfd3df8f2b595.1569489002.git.hongyax@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 69/84] page_alloc: comments on
 (un)mapping pages in xenheap allocations.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzI2LzE5IDEwOjQ2IEFNLCBob25neWF4QGFtYXpvbi5jb20gd3JvdGU6Cj4gRnJv
bTogSG9uZ3lhbiBYaWEgPGhvbmd5YXhAYW1hem9uLmNvbT4KPiAKClRoaXMgcGF0Y2ggc2hvdWxk
IGJlIHNxdWFzaGVkIGluIHRoZSBwcmV2aW91cyBwYXRjaCAoIzY4KS4gVGhpcyB3b3VsZCAKYWxz
byBoZWxwIHJldmlldyBhcyBpdCBnaXZlIG1vcmUgaW5zaWdodCBvZiB3aHkgeW91IG5lZWQgdG8g
bWFwL3VubWFwLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
