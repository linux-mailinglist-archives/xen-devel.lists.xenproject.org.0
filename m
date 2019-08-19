Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042F49212D
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 12:18:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzeiZ-0003b8-N4; Mon, 19 Aug 2019 10:16:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UkZp=WP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hzeiY-0003b3-LI
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 10:16:50 +0000
X-Inumbo-ID: 73149d2c-c26a-11e9-a661-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 73149d2c-c26a-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 10:16:46 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 38020344;
 Mon, 19 Aug 2019 03:16:46 -0700 (PDT)
Received: from [10.37.12.162] (unknown [10.37.12.162])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E0DE3F706;
 Mon, 19 Aug 2019 03:16:45 -0700 (PDT)
To: Amit Tomer <amittomer25@gmail.com>
References: <1559938596-5696-1-git-send-email-amittomer25@gmail.com>
 <CABHD4K87Z8QWtga6+FmkFXzJcot+WHH4KS7x-g1wOir8V2-tcQ@mail.gmail.com>
 <44094e19-48c6-8281-4e04-2b2a24db98db@arm.com>
 <CABHD4K8GmFLXjwrRse5JuJ4rSJ3Wy0_uU_6edqSMF_Yi5-YjDQ@mail.gmail.com>
 <ff55b765-03b5-9cb1-0e56-d342425a608d@arm.com>
 <CABHD4K_3KSCJmEhn2uONt2wnMdLwz0hp-3Ocr_-KRpTmGKM9ow@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f875a444-ee7f-2ca3-1a18-5ee89b59b1ea@arm.com>
Date: Mon, 19 Aug 2019 11:16:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CABHD4K_3KSCJmEhn2uONt2wnMdLwz0hp-3Ocr_-KRpTmGKM9ow@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 0/2] XEN booting on i.MX8M platform
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 xen-devel@lists.xenproject.org, peng.fan@nxp.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiA4LzYvMTkgMTA6MTQgUE0sIEFtaXQgVG9tZXIgd3JvdGU6Cj4gSGkKCkhpLAoKPj4gV2hh
dCBhcmUgdGhlIGNvbnNlcXVlbmNlcyB0byBjaGFuZ2UgdGhlIGludGVycnVwdCBwYXJlbnQ/Cj4g
Cj4gSSBhbSBub3QgZW50aXJlbHkgc3VyZSBhYm91dCBpdCBhdCB0aGUgbW9tZW50IGJ1dCBsb29r
cyBsaWtlIGl0Cj4gY29udHJvbGxlcnMgcG93ZXIgZG9tYWluCj4gZm9yIHZhcmlvdXMgZGV2aWNl
cyBsaWtlIEdQVSwgVlBVIGFuZCBPVEcgZXRjLgo+IAo+IFNvLCB3ZSBtYXkgbm90IGJlIGFibGUg
dG8gc3VwcG9ydCB0aGVzZSBkZXZpY2VzIGZvciBYRU4gZG9tYWlucyA/CgpJIGhhdmVuJ3QgdXNl
ZCB0aGUgcGxhdGZvcm0gc28gSSBjYW4ndCBmb3Igc3VyZSBrbm93IHdoYXQgY2FuIGhhcHBlbiAK
aGVyZS4gVGhlIHJpc2sgaXMgaWYgYWxsIHRoZSBwb3dlciBkb21haW5zIGFyZSB0dXJuZWQgb2Zm
IGF0IGJvb3QsIHRoZW4gCkRvbTAgd291bGQgbm90IGJlIGFibGUgdG8gdHVybiB0aGVtIG9uLiBU
aGVyZWZvcmUgYWxsIHRoZSBkZXZpY2VzIHlvdSAKbGlzdGVkIG1heSBiZSB1bnVzYWJsZS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
