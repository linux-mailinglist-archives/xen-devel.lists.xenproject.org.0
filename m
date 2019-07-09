Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AB3635EE
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 14:32:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkpFw-0006E7-Px; Tue, 09 Jul 2019 12:30:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DJix=VG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkpFu-0006E2-TM
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 12:29:58 +0000
X-Inumbo-ID: 426d4e84-a245-11e9-b950-2fb23864a585
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 426d4e84-a245-11e9-b950-2fb23864a585;
 Tue, 09 Jul 2019 12:29:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 17A132B;
 Tue,  9 Jul 2019 05:29:56 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C16973F59C;
 Tue,  9 Jul 2019 05:29:55 -0700 (PDT)
To: Viktor Mitin <viktor.mitin.19@gmail.com>, xen-devel@lists.xenproject.org
References: <20190709074903.8042-1-viktor.mitin.19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <9223e633-74b1-954b-3d46-e48e84f892a8@arm.com>
Date: Tue, 9 Jul 2019 13:29:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190709074903.8042-1-viktor.mitin.19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: change DomU memory property size
 from u64 to u32
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Viktor Mitin <viktor_mitin@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVmlrdG9yLAoKT24gNy85LzE5IDg6NDkgQU0sIFZpa3RvciBNaXRpbiB3cm90ZToKPiBXaGls
ZSBjaGVja2luZyB4ZW4gZG9tMGxlc3MgZG9jdW1lbnRhdGlvbiBpdCBoYXMgYmVlbiBmb3VuZAo+
IHRoYXQgZG9tVSBtZW1vcnkgcHJvcGVydHkgcmVxdWlyZXMgZXh0cmEgMHgwIGluIGNhc2Ugb2Yg
YXJtNjQuCgpBbmQgdGhpcyBtYXRjaGVzIHRoZSBiaW5kaW5nIGRvY3MvbWlzYy9hcm0vZGV2aWNl
LXRyZWUvYm9vdGluZy50eHQgd2hpY2ggCnJlcXVpcmVzIGEgNjQtYml0IHZhbHVlLgoKPiAKPiBU
aGVyZSBpcyBubyBuZWVkIHRvIGtlZXAgbWVtb3J5IHNpemUgaW4gdTY0LCAzMiBiaXRzIGlzCj4g
ZW5vdWdoIGZvciBkb21VIG1lbW9yeSBzaXplLgpEZWZpbml0ZWx5IG5vdC4gVGhlIG1lbW9yeSBp
cyBnaXZlbiBpbiBLQiBzbyAzMi1iaXRzIG9ubHkgYWxsb3dzIHRvIApjb3ZlciA0VEIuIFdoaWxl
IEkgYWdyZWUgdGhhdCBub25lIG9mIHRoZSBEb21VIGNyZWF0ZWQgYnkgWGVuIHdpbGwgYmUgCmJp
Z2dlciB0aGFuIGEgZmV3IGdpZ2FieXRlcyB0b2RheSwgdXNlciBleHBvc2VkIGludGVyZmFjZXMg
c2hvdWxkIGFsd2F5cyAKY2F0ZXIgZm9yIHRoZSBmdXR1cmUuCgpJbiBhbnkgY2FzZSwgdGhlIGlu
dGVyZmFjZSBjaGFuZ2VzIHlvdSBzdWdnZXN0IGlzIGdvaW5nIHRvIGJyZWFrIHVzZXIgCnByb3Bl
cmx5IHVzaW5nIHRoZSBiaW5kaW5ncy4KClJlZ2FyZHMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
