Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B434F127C60
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 15:18:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiJ4b-0003ZR-Se; Fri, 20 Dec 2019 14:16:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iiJ4a-0003ZM-HT
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 14:16:08 +0000
X-Inumbo-ID: 432252ec-2333-11ea-9367-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 432252ec-2333-11ea-9367-12813bfff9fa;
 Fri, 20 Dec 2019 14:16:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F731B156;
 Fri, 20 Dec 2019 14:16:06 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <aa264d92-2545-f2e7-5225-4f870e3ec8f9@suse.com>
Date: Fri, 20 Dec 2019 15:16:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH 0/4] x86/mm: XSA-299 / 309 / 310 follow-up
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

QWRkcmVzc2luZyBhIGZldyBhc3NvcnRlZCBhc3BlY3RzIEkndmUgbm90aWNlZCBkdXJpbmcgdGhl
CmludmVzdGlnYXRpb25zIC8gcmV2aWV3cy4KCjE6IG1vZF9sPE4+X2VudHJ5KCkgaGF2ZSBubyBu
ZWVkIHRvIHVzZSBfX2NvcHlfZnJvbV91c2VyKCkKMjogcmVuYW1lIGFuZCB0aWR5IGNyZWF0ZV9w
YWVfeGVuX21hcHBpbmdzKCkKMzogYXZvaWQgSU9NTVUgb3BlcmF0aW9ucyBpbiBtb3JlIGNhc2Vz
IGluIF9nZXRfcGFnZV90eXBlKCkKNDogZHJvcCByZWR1bmRhbnQgc21wX3dtYigpIGZyb20gX3B1
dF9maW5hbF9wYWdlX3R5cGUoKQoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
