Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AB54AFFC6
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 17:19:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i84Lj-0001AR-1C; Wed, 11 Sep 2019 15:16:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/an7=XG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i84Lh-00019Y-NT
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 15:16:01 +0000
X-Inumbo-ID: 0f891c17-d4a7-11e9-83d7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f891c17-d4a7-11e9-83d7-12813bfff9fa;
 Wed, 11 Sep 2019 15:16:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11DD8B07D;
 Wed, 11 Sep 2019 15:15:58 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f6accb8b-38d9-ad9a-ec68-992d75f36a88@suse.com>
Date: Wed, 11 Sep 2019 17:15:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH RESEND/PING 0/9] XSA-292 follow-up
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
