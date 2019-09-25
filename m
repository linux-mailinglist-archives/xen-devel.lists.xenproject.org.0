Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA79BE129
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD94Q-0004iW-D7; Wed, 25 Sep 2019 15:19:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD94O-0004iI-N5
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:19:08 +0000
X-Inumbo-ID: d1302386-dfa7-11e9-9636-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d1302386-dfa7-11e9-9636-12813bfff9fa;
 Wed, 25 Sep 2019 15:19:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0D6BFB698;
 Wed, 25 Sep 2019 15:19:07 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <3ce4ab2c-8cb6-1482-6ce9-3d5b019e10c1@suse.com>
Date: Wed, 25 Sep 2019 17:19:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v3 0/5] (remaining) XSA-292 follow-up
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

MTogeDg2OiBzdXBwcmVzcyBYUFRJLXJlbGF0ZWQgVExCIGZsdXNoZXMgd2hlbiBwb3NzaWJsZQoy
OiB4ODYvbW06IGhvbm9yIG9wdF9wY2lkIGFsc28gZm9yIDMyLWJpdCBQViBkb21haW5zCjM6IHg4
Ni9IVk06IG1vdmUgTk9GTFVTSCBoYW5kbGluZyBvdXQgb2YgaHZtX3NldF9jcjMoKQo0OiB4ODYv
SFZNOiByZWZ1c2UgQ1IzIGxvYWRzIHdpdGggcmVzZXJ2ZWQgKHVwcGVyKSBiaXRzIHNldAo1OiB4
ODYvSFZNOiBjb3NtZXRpY3MgdG8gaHZtX3NldF9jcjMoKQoKVGhlIGZpcnN0IHBhdGNoIHdhcyBw
cmV2aW91c2x5IHN1Ym1pdHRlZCBzdGFuZGFsb25lICh2MykgYW5kCmhhc24ndCBjaGFuZ2VkIHNp
bmNlIHRoZW4sIGJ1dCBtb3JlIG9yIGxlc3MgZml0cyBpbnRvIHRoaXMKZ3JvdXAsIHNvIGdldHMg
aW5jbHVkZWQgaGVyZSBnb2luZyBmb3J3YXJkLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
