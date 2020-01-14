Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9D213AC6C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 15:38:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irNI1-0000td-8D; Tue, 14 Jan 2020 14:35:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZPm=3D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1irNHz-0000tT-6C
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 14:35:27 +0000
X-Inumbo-ID: 18865590-36db-11ea-83c4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18865590-36db-11ea-83c4-12813bfff9fa;
 Tue, 14 Jan 2020 14:35:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 47603BBC3;
 Tue, 14 Jan 2020 14:35:22 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbe5dfb8-a37c-4bd2-74aa-676ba1af9324@suse.com>
Date: Tue, 14 Jan 2020 15:35:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] Arm: fix build after 892b9dcebdb7
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

IklSUTogdTE2IGlzIHRvbyBuYXJyb3cgZm9yIGFuIGV2ZW50IGNoYW5uZWwgbnVtYmVyIiBpbnRy
b2R1Y2VkIGEgdXNlIG9mCmV2ZXRjaG5fcG9ydF90LCBidXQgaXRzIHR5cGVkZWYgYXBwYXJlbnRs
eSBzdXJmYWNlcyBpbmRpcmVjdGx5IGhlcmUgb25seQpvbiB4ODYuCgpTaWduZWQtb2ZmLWJ5OiBK
YW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgotLS0gYS94ZW4vaW5jbHVkZS94ZW4vaXJx
LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2lycS5oCkBAIC04LDYgKzgsNyBAQAogI2luY2x1ZGUg
PHhlbi9saXN0Lmg+CiAjaW5jbHVkZSA8YXNtL3JlZ3MuaD4KICNpbmNsdWRlIDxhc20vaGFyZGly
cS5oPgorI2luY2x1ZGUgPHB1YmxpYy9ldmVudF9jaGFubmVsLmg+CiAKIHN0cnVjdCBpcnFhY3Rp
b24gewogICAgIHZvaWQgKCpoYW5kbGVyKShpbnQsIHZvaWQgKiwgc3RydWN0IGNwdV91c2VyX3Jl
Z3MgKik7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
