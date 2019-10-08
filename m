Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B90FDCF190
	for <lists+xen-devel@lfdr.de>; Tue,  8 Oct 2019 06:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iHh06-00082E-Vs; Tue, 08 Oct 2019 04:21:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=05QO=YB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iHh06-000829-Ce
 for xen-devel@lists.xenproject.org; Tue, 08 Oct 2019 04:21:30 +0000
X-Inumbo-ID: 19b42d52-e983-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19b42d52-e983-11e9-80e3-bc764e2007e4;
 Tue, 08 Oct 2019 04:21:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id ED4ABB149;
 Tue,  8 Oct 2019 04:21:28 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>, Julien.Grall@arm.com
References: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <feee0aea-e442-7b9b-c62b-6914793c0cee@suse.com>
Date: Tue, 8 Oct 2019 06:21:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1910071811320.13684@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/3] fixes for
 make_[memory/cpu]_node
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
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTAuMTkgMDM6MTQsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBIaSBhbGwsCj4g
Cj4gVGhpcyBpcyBhIHNtYWxsIGNvbGxlY3Rpb24gb2YgZml4ZXMgZm9yIG1ha2VfbWVtb3J5X25v
ZGUgYW5kCj4gbWFrZV9jcHVzX25vZGUgZm9yIDQuMTMuCj4gCj4gQ2hlZXJzLAo+IAo+IFN0ZWZh
bm8KPiAKPiAKPiBTdGVmYW5vIFN0YWJlbGxpbmkgKDMpOgo+ICAgICAgICB4ZW4vYXJtOiBmaXgg
YnVmIHNpemUgaW4gbWFrZV9jcHVzX25vZGUKPiAgICAgICAgeGVuL2FybTogbWFrZV9tZW1vcnlf
bm9kZSByZXR1cm4gZXJyb3Igb24gbnJfYmFua3MgPT0gMAo+ICAgICAgICB4ZW4vYXJtOiBmaXgg
ZHVwbGljYXRlIG1lbW9yeSBub2RlIGluIERUCj4gCj4gICB4ZW4vYXJjaC9hcm0vZG9tYWluX2J1
aWxkLmMgfCAyMiArKysrKysrKysrKysrKystLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKCkZvciB0aGUgc2VyaWVzOgoKUmVsZWFz
ZS1hY2tlZC1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgoKCkp1ZXJnZW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
