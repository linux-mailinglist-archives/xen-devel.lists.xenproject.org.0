Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685B1458D5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 16:33:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuHz6-0005Yz-RL; Wed, 22 Jan 2020 15:32:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=q9GK=3L=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iuHz5-0005YP-D5
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 15:31:59 +0000
X-Inumbo-ID: 53c9a948-3d2c-11ea-bc7c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 53c9a948-3d2c-11ea-bc7c-12813bfff9fa;
 Wed, 22 Jan 2020 15:31:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E46DFB01E;
 Wed, 22 Jan 2020 15:31:57 +0000 (UTC)
To: Tamas K Lengyel <tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
 <6be751e27d81f799377e1a07eb11842582f102f6.1579628566.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c096ffd-042a-46a7-f659-e55ae791dac5@suse.com>
Date: Wed, 22 Jan 2020 16:32:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6be751e27d81f799377e1a07eb11842582f102f6.1579628566.git.tamas.lengyel@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 12/18] x86/mem_sharing: Enable
 mem_sharing on first memop
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxODo0OSwgVGFtYXMgSyBMZW5neWVsIHdyb3RlOgo+IEl0IGlzIHdhc3Rl
ZnVsIHRvIHJlcXVpcmUgc2VwYXJhdGUgaHlwZXJjYWxscyB0byBlbmFibGUgc2hhcmluZyBvbiBi
b3RoIHRoZQo+IHBhcmVudCBhbmQgdGhlIGNsaWVudCBkb21haW4gZHVyaW5nIFZNIGZvcmtpbmcu
IFRvIHNwZWVkIHRoaW5ncyB1cCB3ZSBlbmFibGUKPiBzaGFyaW5nIG9uIHRoZSBmaXJzdCBtZW1v
cCBpbiBjYXNlIGl0IHdhc24ndCBhbHJlYWR5IGVuYWJsZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
