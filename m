Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D362C9C9F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 12:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFybP-0006aM-Ux; Thu, 03 Oct 2019 10:44:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=leaW=X4=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFybO-0006aH-85
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 10:44:54 +0000
X-Inumbo-ID: d523fd68-e5ca-11e9-9722-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d523fd68-e5ca-11e9-9722-12813bfff9fa;
 Thu, 03 Oct 2019 10:44:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06AA61000;
 Thu,  3 Oct 2019 03:44:53 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 532A73F706;
 Thu,  3 Oct 2019 03:44:52 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20191002180047.17144-1-julien.grall@arm.com>
 <20191002180047.17144-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1910021452280.2691@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <229f0edf-8a06-8d21-7b28-32057b47b103@arm.com>
Date: Thu, 3 Oct 2019 11:44:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910021452280.2691@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 6/6] xen/arm: traps: Mark
 check_stack_alignment_constraints as unused
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDAyLzEwLzIwMTkgMjM6MjYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToKPiBPbiBXZWQsIDIgT2N0IDIwMTksIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gQ2xhbmcgd2ls
bCB0aHJvdyBhbiBlcnJvciBpZiBhIGZ1bmN0aW9uIGlzIHVudXNlZCB1bmxlc3MgeW91IHRlbGwK
Pj4gdG8gaWdub3JlIGl0LiBUaGlzIGNhbiBiZSBkb25lIHVzaW5nIF9fbWF5YmVfdW51c2VkLgo+
Pgo+PiBXaGlsZSBtb2RpZnlpbmcgdGhlIGRlY2xhcmF0aW9uLCB1cGRhdGUgaXQgdG8gbWF0Y2gg
cHJvdG90eXBlIG9mIHNpbWlsYXIKPj4gZnVuY3Rpb25zIChzZWUgYnVpbGRfYXNzZXJ0aW9ucyku
IFRoaXMgaGVscHMgdG8gdW5kZXJzdGFuZCB0aGF0IHRoZSBzb2xlCj4+IHB1cnBvc2Ugb2YgdGhl
IGZ1bmN0aW9uIGlzIHRvIGhvbGQgQlVJTERfQlVHX09OKCkuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6
IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+Cj4gCj4gU2FtZSBzbWFsbCBub3Rl
IGFib3V0IGJ1aWxkX2Fzc2VydGlvbnMgYmVjb21pbmcgX19pbml0LgoKU2ltaWxhciB0byB0aGUg
cHJldmlvdXMgdmVyc2lvbiB0aGlzIGlzIGFscmVhZHkgaW1wbGllZCBieSAidXBkYXRlIGl0IHRv
IG1hdGNoIApwcm90b3R5cGUgb2Ygc2ltaWxhciBmdW5jdGlvbnMiLgoKQ2hlZXJzLAoKLS0gCkp1
bGllbiBHcmFsbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
