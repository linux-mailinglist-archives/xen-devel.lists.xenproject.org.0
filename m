Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AC911E026
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 10:04:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifgoc-0006it-Rj; Fri, 13 Dec 2019 09:00:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifgob-0006il-UR
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 09:00:49 +0000
X-Inumbo-ID: 0e2c5d82-1d87-11ea-8ec3-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e2c5d82-1d87-11ea-8ec3-12813bfff9fa;
 Fri, 13 Dec 2019 09:00:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 115DDB1FC;
 Fri, 13 Dec 2019 09:00:48 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191210145305.6605-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <0a83ebaa-40b8-55f0-cff0-5aaf7bc14e98@suse.com>
Date: Fri, 13 Dec 2019 10:00:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191210145305.6605-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen-blkback: prevent premature module unload
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
Cc: Jens Axboe <axboe@kernel.dk>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMTIuMTkgMTU6NTMsIFBhdWwgRHVycmFudCB3cm90ZToKPiBPYmplY3RzIGFsbG9jYXRl
ZCBieSB4ZW5fYmxraWZfYWxsb2MgY29tZSBmcm9tIHRoZSAnYmxraWZfY2FjaGUnIGttZW0KPiBj
YWNoZS4gVGhpcyBjYWNoZSBpcyBkZXN0b3llZCB3aGVuIHhlbi1ibGtpZiBpcyB1bmxvYWRlZCBz
byBpdCBpcwo+IG5lY2Vzc2FyeSB0byB3YWl0IGZvciB0aGUgZGVmZXJyZWQgZnJlZSByb3V0aW5l
IHVzZWQgZm9yIHN1Y2ggb2JqZWN0cyB0bwo+IGNvbXBsZXRlLiBUaGlzIG5lY2Vzc2l0eSB3YXMg
bWlzc2VkIGluIGNvbW1pdCAxNDg1NTk1NGY2MzYgInhlbi1ibGtiYWNrOgo+IGFsbG93IG1vZHVs
ZSB0byBiZSBjbGVhbmx5IHVubG9hZGVkIi4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgcHJvYmxlbSBi
eQo+IHRha2luZy9yZWxlYXNpbmcgZXh0cmEgbW9kdWxlIHJlZmVyZW5jZXMgaW4geGVuX2Jsa2lm
X2FsbG9jL2ZyZWUoKQo+IHJlc3BlY3RpdmVseS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1
cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+CgpQdXNoZWQgdG8geGVuL3RpcC5naXQgZm9yLWxp
bnVzLTUuNWIKCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
