Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E63311E24F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:50:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifiUn-0007RD-DH; Fri, 13 Dec 2019 10:48:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ifiUl-0007R8-CX
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:48:27 +0000
X-Inumbo-ID: 1739e0b6-1d96-11ea-8ed6-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1739e0b6-1d96-11ea-8ed6-12813bfff9fa;
 Fri, 13 Dec 2019 10:48:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 50671AF2B;
 Fri, 13 Dec 2019 10:48:25 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <20191212173203.1692762-1-george.dunlap@citrix.com>
 <20191212173203.1692762-5-george.dunlap@citrix.com>
 <cd807be2-1dcc-5b1b-7cb1-0b77dfc12f04@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <424507b8-205f-19f3-3e57-7a6986aeb4f7@suse.com>
Date: Fri, 13 Dec 2019 11:48:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <cd807be2-1dcc-5b1b-7cb1-0b77dfc12f04@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 4/4] x86/mm: More discriptive names for page
 de/validation functions
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMTIuMjAxOSAyMTowNywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMi8xMi8yMDE5
IDE3OjMyLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+PiBUaGUgZnVuY3Rpb25zIGFsbG9jX3BhZ2Vf
dHlwZSgpLCBhbGxvY19sTl90YWJsZSgpLCBmcmVlX3BhZ2VfdHlwZSgpCj4+IGFuZCBmcmVlX2xO
X3RhYmxlKCkgYXJlIGNvbmZ1c2luZ2x5IG5hbWVkOgo+IAo+IFRoZXJlIGlzIGFsbG9jX3NlZ2Rl
c2NfcGFnZSgpIHdoaWNoIHNob3VsZCBiZSBhZGp1c3RlZCBmb3IgY29uc2lzdGVuY3kuCj4gCj4+
IG5vdGhpbmcgaXMgYmVpbmcgYWxsb2NhdGVkIG9yIGZyZWVkLgo+IAo+IFdlbGwgLSBzdHJpY3Rs
eSBzcGVha2luZyB0aGUgdHlwZSByZWZlcmVuY2UgaXMgYmVpbmcgb2J0YWluZWQvZHJvcHBlZCwK
PiBhbmQgdGhpcyBpcyBhIGtpbmQgb2YgYWxsb2MvZnJlZSwgYWx0aG91Z2ggSSBhZ3JlZSB0aGF0
IHRoZSBuYW1lcyBhcmUKPiBub3QgZ3JlYXQuCj4gCj4gSG93ZXZlciwgSSdtIG5vdCBlbnRpcmVs
eSBzdXJlIHRoYXQge2RlLH12YWxpZGF0ZSBhcmUgZ3JlYXQgZWl0aGVyLAo+IGJlY2F1c2UgaXQg
aXNuJ3Qgb2J2aW91c2x5IHRpZWQgdG8gb2J0YWluaW5nL2Ryb3BwaW5nIGEgdHlwZSByZWZlcmVu
Y2UuCj4gCj4gVGhhdCBzYWlkLCBJIGRvbid0IGhhdmUgYSBiZXR0ZXIgc3VnZ2VzdGlvbiByaWdo
dCBub3cuCgpGb2xsb3dpbmcgdGhlIHdvcmRpbmcgb2YgeW91cnMsIGhvdyBhYm91dCB7b2J0YWlu
LGRyb3B9X3BhZ2VfdHlwZSgpPwoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
