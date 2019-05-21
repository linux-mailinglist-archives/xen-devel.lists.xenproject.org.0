Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6320E2542B
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:39:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6pL-0006F1-Ai; Tue, 21 May 2019 15:37:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YYEG=TV=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hT6pJ-0006Et-VQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 15:37:17 +0000
X-Inumbo-ID: 4ff0c686-7bde-11e9-b595-73eecb88440b
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4ff0c686-7bde-11e9-b595-73eecb88440b;
 Tue, 21 May 2019 15:37:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54BE3374;
 Tue, 21 May 2019 08:37:16 -0700 (PDT)
Received: from [10.37.9.190] (unknown [10.37.9.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 977CC3F575;
 Tue, 21 May 2019 08:37:15 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190521142913.22394-1-julien.grall@arm.com>
 <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c6dcc913-1baf-dfca-8016-708b087e3cd9@arm.com>
Date: Tue, 21 May 2019 16:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1905210836050.16404@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm64: livepatch: Fix build after
 03957f58db
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA1LzIxLzE5IDQ6MzYgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBUdWUs
IDIxIE1heSAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IENvbW1pdCAwMzk1N2Y1OGRiICJ4
ZW4vY29uc3Q6IEV4dGVuZCB0aGUgZXhpc3RpbmcgbWFjcm8gQklUIHRvIHRha2UgYQo+PiBzdWZm
aXggaW4gcGFyYW1ldGVyIiBkaWRuJ3QgY29udmVydCBhbGwgdGhlIGNhbGxlcnMgb2YgdGhlIG1h
Y3JvIEJJVC4KPj4KPj4gVGhpcyB3aWxsIHJlc3VsdCB0byBhIGJ1aWxkIGJyZWFrYWdlIHdoZW4g
ZW5hYmxpbmcgTGl2ZXBhdGNoIG9uIGFybTY0Lgo+Pgo+PiBSZXBvcnRlZC1ieTogQW5kcmV3IENv
b3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAKPiBBY2tlZC1ieTogU3RlZmFubyBTdGFi
ZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgoKRklZIGl0IHdhcyBhbHJlYWR5IG1lcmdl
ZCB0byB1bmJsb2NrIHRoZSBidWlsZC4gRnJvbSBteSB1bmRlcnN0YW5kaW5nLCAKYW55IGFjayBm
cm9tIHRoZSByZXN0IGlzIHN1ZmZpY2llbnQgaW4gdGhhdCBjYXNlLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
