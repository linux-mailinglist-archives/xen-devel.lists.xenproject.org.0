Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AB2113DA0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:17:37 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icnDG-0007Ig-10; Thu, 05 Dec 2019 09:14:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icnDD-0007Ia-TW
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:14:15 +0000
X-Inumbo-ID: 9b9ee98a-173f-11ea-8218-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b9ee98a-173f-11ea-8218-12813bfff9fa;
 Thu, 05 Dec 2019 09:14:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AC582AC24;
 Thu,  5 Dec 2019 09:14:14 +0000 (UTC)
To: Hongyan Xia <hongyxia@amazon.com>
References: <cover.1575477921.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6c93e86-0b3a-2b39-4e06-6c888191df12@suse.com>
Date: Thu, 5 Dec 2019 10:14:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cover.1575477921.git.hongyxia@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 0/9] Add alternative API for Xen PTEs
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAxODoxMCwgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gTk9URTogTXkgZW1haWwg
YWRkcmVzcyBoYXMgY2hhbmdlZCBkdWUgdG8gc29tZSBIUiBtYW5hZ2VtZW50LiBJIGhhdmUKPiBs
b3N0IGFsbCBteSBwcmV2aW91cyBlbWFpbHMgYW5kIEkgY291bGQgb25seSBzYWx2YWdlIHNvbWUg
b2YgdGhlCj4gY29tbWVudHMgdG8gdjMgZnJvbSB0aGUgbWFpbGluZyBsaXN0IGFyY2hpdmUuIEkg
d2lsbCByZXBseSB0byB0aGUKPiBjb21tZW50cyBmcm9tIHYzIGluIHRoaXMgdjQgc2VyaWVzLgoK
SSdtIGFmcmFpZCB0aGlzIGlzbid0IHZlcnkgaGVscGZ1bC4gSW4gcGFydGljdWxhciwgZG9lcyB0
aGlzIG1lYW4KdjQgaXMgZWZmZWN0aXZlbHkgdjMsIGkuZS4gbm8gcmV2aWV3IGNvbW1lbnRzIHRh
a2VuIGNhcmUgb2Y/IE9yCmp1c3Qgc29tZSBvZiB0aGVtLCBhbmQgb3RoZXJzIGxlZnQgb3V0PyBJ
J20gbm90IGZhbmN5aW5nIHJlLQpyZXZpZXdpbmcgYSB2ZXJzaW9uIHRoYXQgZG9lc24ndCBoYXZl
IHByaW9yIGNvbW1lbnRzIHRha2VuIGNhcmUKb2YuIFBsZWFzZSBjbGFyaWZ5LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
