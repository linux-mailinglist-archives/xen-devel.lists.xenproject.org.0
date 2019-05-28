Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 161D62C1F5
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 11:02:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVXx6-0004KO-Kw; Tue, 28 May 2019 08:59:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ExCW=T4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hVXx4-0004KI-SQ
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 08:59:22 +0000
X-Inumbo-ID: e21712f1-8126-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e21712f1-8126-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 08:59:21 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2CC6C341;
 Tue, 28 May 2019 01:59:21 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F7EF3F59C;
 Tue, 28 May 2019 01:59:19 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c31fb2f8-1703-61db-fd7d-f41db6a137d8@arm.com>
Date: Tue, 28 May 2019 09:59:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC 2] [DO NOT APPLY] introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKSSBhbSBub3QgYW5zd2VyaW5nIG9uIHRoZSBjb250ZW50IHlldCwgSSB3aWxs
IGRvIHRoYXQgc2VwYXJhdGVseS4gVGhlIHRocmVhZGluZyAKZm9yIHRoaXMgc2VyaWVzIGxvb2tz
IHF1aXRlIGNvbmZ1c2luZy4gVGhlIGhlYWQgb2YgdGhlIHRocmVhZCBpcyB0aGlzIHBhdGNoIChp
LmUgClJGQyAyKSBidXQgdGhlbiB5b3UgaGF2ZSBhIGNvdmVyIGxldHRlciB3aXRoaW4gdGhlIHRo
cmVhZCB0YWdnZWQgIlYzIi4KCiBGcm9tIHdoYXQgSSB1bmRlcnN0YW5kLCB0aGUgMiBlLW1haWxz
IHRhZ2dlZCAiVjMiIGlzIHRoZSBvcmlnaW5hbCB2ZXJzaW9uIHdoZXJlIAphcyBSRkMgMiBhbmQg
UkZDIDMgYXJlIHZhcmlhbnRzLiBBbSBJIGNvcnJlY3Q/CgpJZiBzbywgZm9yIG5leHQgdGltZSwg
SSB3b3VsZCByZWNvbW1lbmQgdG8gaGF2ZSB0aGUgY292ZXIgbGV0dGVyIGZpcnN0IGFuZCB0aGVu
IAphbGwgdGhlIHBhdGNoZXMgc2VuZCAiSW4tUmVwbHktVG8iIHRoZSBjb3ZlciBsZXR0ZXIuIFRo
aXMgbWFrZXMgZWFzaWVyIHRvIHRyYWNrIApzZXJpZXMuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
