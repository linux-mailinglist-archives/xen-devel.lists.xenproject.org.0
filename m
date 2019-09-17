Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FC8B471F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Sep 2019 08:03:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iA6VK-0006ad-0y; Tue, 17 Sep 2019 05:58:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+VJ/=XM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iA6VI-0006aP-66
 for xen-devel@lists.xenproject.org; Tue, 17 Sep 2019 05:58:20 +0000
X-Inumbo-ID: 24aafbce-d910-11e9-9601-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 24aafbce-d910-11e9-9601-12813bfff9fa;
 Tue, 17 Sep 2019 05:58:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6D364AC90;
 Tue, 17 Sep 2019 05:58:16 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
Date: Tue, 17 Sep 2019 07:58:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2 0/9] XSA-292 follow-up
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

VmFyaW91cyBDUjMgYW5kIFBDSUQgcmVsYXRlZCBhZGp1c3RtZW50cywgZmlyc3QgYW5kIGZvcmVt
b3N0IGFuCmFsbW9zdCBmdWxsIHJlLXdyaXRlIG9mIHN3aXRjaF9jcjNfY3I0KCkgKGluIHBhdGNo
IDIpLgoKMTogeDg2OiBhZGp1c3QgY3IzX3BjaWQoKSByZXR1cm4gdHlwZQoyOiB4ODY6IGxpbWl0
IHRoZSBhbW91bnQgb2YgVExCIGZsdXNoaW5nIGluIHN3aXRjaF9jcjNfY3I0KCkKMzogeDg2L21t
OiBob25vciBvcHRfcGNpZCBhbHNvIGZvciAzMi1iaXQgUFYgZG9tYWlucwo0OiB4ODYvSFZNOiBt
b3ZlIE5PRkxVU0ggaGFuZGxpbmcgb3V0IG9mIGh2bV9zZXRfY3IzKCkKNTogeDg2L0hWTTogcmVm
dXNlIENSMyBsb2FkcyB3aXRoIHJlc2VydmVkICh1cHBlcikgYml0cyBzZXQKNjogeDg2L0hWTTog
cmVsYXggc2hhZG93IG1vZGUgY2hlY2sgaW4gaHZtX3NldF9jcjMoKQo3OiB4ODYvSFZNOiBjb3Nt
ZXRpY3MgdG8gaHZtX3NldF9jcjMoKQo4OiB4ODYvQ1BVSUQ6IGRyb3AgSU5WUENJRCBkZXBlbmRl
bmN5IG9uIFBDSUQKOTogeDg2OiBQQ0lEIGlzIHVudXNlZCB3aGVuICFQVgoKSmFuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
