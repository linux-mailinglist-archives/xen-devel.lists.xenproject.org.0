Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E2B0AF2
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 11:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8L1q-0005BH-DP; Thu, 12 Sep 2019 09:04:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8L1o-0005B9-Bq
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 09:04:36 +0000
X-Inumbo-ID: 56aa30ea-d53c-11e9-83e6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 56aa30ea-d53c-11e9-83e6-12813bfff9fa;
 Thu, 12 Sep 2019 09:04:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AEC62B9DF;
 Thu, 12 Sep 2019 09:04:33 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190911200504.5693-1-andrew.cooper3@citrix.com>
 <20190911200504.5693-8-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <681fde85-64d0-50d6-99f1-147c024de3fb@suse.com>
Date: Thu, 12 Sep 2019 11:04:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190911200504.5693-8-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 7/8] x86/domctl: Drop XEN_DOMCTL_set_cpuid
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMDkuMjAxOSAyMjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBXaXRoIHRoZSBmaW5h
bCB1c2VycyBtb3ZlZCBvdmVyIHRvIHVzaW5nIFhFTl9ET01DVExfc2V0X2NwdW1zcl9wb2xpY3ks
IGRyb3AKPiB0aGlzIGRvbWN0bCBhbmQgYXNzb2NpYXRlZCBpbmZyYXN0cnVjdHVyZS4KPiAKPiBS
ZW5hbWUgdGhlIHByZWV4aXN0aW5nIHNldF9jcHVpZCBYU00gdmVjdG9yIHRvIHNldF9jcHVfcG9s
aWN5LCBub3cgdGhhdCBpdCBpcwo+IGJhY2sgdG8gaGF2aW5nIGEgc2luZ2xlIHVzZXIuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
CkFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
