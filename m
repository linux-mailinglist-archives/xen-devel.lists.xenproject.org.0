Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE20236B0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 15:03:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hShus-0007gm-A6; Mon, 20 May 2019 13:01:22 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DuAc=TU=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hShur-0007gh-BF
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 13:01:21 +0000
X-Inumbo-ID: 5c64cb60-7aff-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 5c64cb60-7aff-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 13:01:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7CB8780D;
 Mon, 20 May 2019 06:01:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2A363F5AF;
 Mon, 20 May 2019 06:01:17 -0700 (PDT)
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <1ca603c5-2e97-9529-963a-f381b04c727f@arm.com>
Date: Mon, 20 May 2019 14:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516133735.18883-2-volodymyr_babchuk@epam.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpGaXJzdCBvZiBhbGwsIHBsZWFzZSBhZGQgYSBjb3ZlciBsZXR0ZXIgd2hlbiB5b3Ugc2Vu
ZCBhIHNlcmllcy4gVGhpcyBoZWxwIGZvciAKdGhyZWFkaW5nIGFuZCBhbHNvIGEgcGxhY2UgdG8g
Y29tbWVuZCBvbiBnZW5lcmFsIGZlZWRiYWNrLgoKRnVydGhlcm1vcmUsIHBsZWFzZSB1c2Ugc2Ny
aXB0cy97YWRkLCBnZXR9X21haW50YWluZXJzLnBsIHRvIGZpbmQgdGhlIGNvcnJlY3QgCm1haW50
YWluZXJzLiBXaGlsZSBJIGFncmVlIHRoYXQgQ0NpbmcgUkVTVCBpcyBhIGdvb2QgaWRlYSwgeW91
IGhhdmVuJ3QgQ0NlZCBhbGwgCm9mIHRoZW0uCgpPbiAxNi8wNS8yMDE5IDE0OjM3LCBWb2xvZHlt
eXIgQmFiY2h1ayB3cm90ZToKPiBBcyBidWlsZCBzeXN0ZW0gbm93IHN1cHBvcnRzICpfZGVmY29u
ZmlnIHJ1bGVzIGl0IGlzIGdvb2QgdG8gYmUgYWJsZQo+IHRvIGNvbmZpZ3VyZSBtaW5pbWFsIFhF
TiBpbWFnZSB3aXRoCgpJIGFtIGFmcmFpZCB0aGlzIGlzIG5vdCBjb3JyZWN0LiB0aW55NjQgd2ls
bCBub3QgYmUgYWJsZSB0byBnZW5lcmF0ZSBhIG1pbmltYWwgCmNvbmZpZyB0byBib290IG9uIGFu
eSBwbGF0Zm9ybSBzdXBwb3J0ZWQgYnkgWGVuLgoKSXQgaXMgbWVhbnQgdG8gYmUgdXNlZCBhcyBh
IGJhc2UgZm9yIHRhaWxvcmluZyB5b3VyIHBsYXRmb3JtIHdoZXJlIGFsbCB0aGUgCm9wdGlvbnMg
YXJlIHR1cm5lZCBvZmYgYnkgZGVmYXVsdC4KClNvIEkgdGhpbmsgb2ZmZXJpbmcgYSBkaXJlY3Qg
YWNjZXNzIGlzIGxpa2VseSBnb2luZyB0byBiZSBtaXN1c2VkIGluIG1vc3Qgb2YgdGhlIApjYXNl
cyB3aXRob3V0IHByb3BlciBkb2N1bWVudGF0aW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFs
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
