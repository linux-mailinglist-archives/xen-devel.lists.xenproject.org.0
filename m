Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF28637A7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2019 16:19:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkqun-0006l3-TX; Tue, 09 Jul 2019 14:16:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DJix=VG=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hkqum-0006ky-3O
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2019 14:16:16 +0000
X-Inumbo-ID: 1b623462-a254-11e9-8ae8-a7b3f92bafe7
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1b623462-a254-11e9-8ae8-a7b3f92bafe7;
 Tue, 09 Jul 2019 14:16:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 09EAA28;
 Tue,  9 Jul 2019 07:16:13 -0700 (PDT)
Received: from [10.119.48.199] (unknown [10.119.48.199])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C094B3F738;
 Tue,  9 Jul 2019 07:16:12 -0700 (PDT)
To: Will Abele <will.abele@starlab.io>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20190709132145.9060-1-will.abele@starlab.io>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <8837faa2-5c79-b3db-f9c6-7af9f7ff9ae2@arm.com>
Date: Tue, 9 Jul 2019 15:16:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190709132145.9060-1-will.abele@starlab.io>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: use correct device tree root
 node name
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

SGkgV2lsbCwKCk9uIDcvOS8xOSAyOjIyIFBNLCBXaWxsIEFiZWxlIHdyb3RlOgo+IEZyb206IFdp
bGwgQWJlbGUgPHdpbGwuYWJlbGVAc3RhcmxhYi5pbz4KPiAKPiBUaGUgcm9vdCBub2RlIG9mIGEg
ZGV2aWNlIHRyZWUgc2hvdWxkIG5vdCBoYXZlIGEgbm9kZSBuYW1lLiBUaGlzIGlzCj4gc3BlY2lm
aWVkIGluIHNlY3Rpb24gMi4yLjEgb2YgdmVyc2lvbiAwLjIgb2YgdGhlIGRldmljZSB0cmVlCj4g
c3BlY2lmaWNhdGlvbiwgYXZhaWxhYmxlIGZyb20gZGV2aWNldHJlZS5vcmcuCj4gCj4gTGludXgg
S2VybmVsIHZlcnNpb25zIHByaW9yIHRvIDQuMTUgbWlzaW50ZXJwcmV0IGZsYXR0ZW5lZCBkZXZp
Y2UgdHJlZXMKPiB3aXRoIGEgIi8iIGFzIHRoZSBuYW1lIG9mIHRoZSByb290IG5vZGUgYXMgYW4g
RkRUIHZlcnNpb24gb2xkZXIgdGhhbiAxNi4KPiBMaW51eCB0aGVuIGZhaWxzIHRvIHBhcnNlIHRo
ZSBGRFQuCj4gCj4gU2lnbmVkLW9mZi1ieTogV2lsbCBBYmVsZSA8d2lsbC5hYmVsZUBzdGFybGFi
LmlvPgoKUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpD
aGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
