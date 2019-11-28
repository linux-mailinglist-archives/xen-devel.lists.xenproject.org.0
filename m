Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F0110C578
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 09:52:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaFTp-00063f-Hx; Thu, 28 Nov 2019 08:48:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FMNu=ZU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iaFTo-00063a-4o
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 08:48:52 +0000
X-Inumbo-ID: e62afdce-11bb-11ea-a3cd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e62afdce-11bb-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 08:48:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 619A9ACF1;
 Thu, 28 Nov 2019 08:48:50 +0000 (UTC)
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
References: <20191107111546.26579-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <442417bc-ec65-0864-0a99-59583a52f866@suse.com>
Date: Thu, 28 Nov 2019 09:48:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191107111546.26579-1-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] xen/gntdev: sanitize user interface
 handling
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
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMTEuMTkgMTI6MTUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4gVGhlIFhlbiBnbnRkZXYg
ZHJpdmVyJ3MgY2hlY2tpbmcgb2YgdGhlIG51bWJlciBvZiBhbGxvd2VkIG1hcHBlZCBwYWdlcwo+
IGlzIGluIG5lZWQgb2Ygc29tZSBzYW5pdGl6aW5nIHdvcmsuCj4gCj4gQ2hhbmdlcyBpbiBWMjoK
PiAtIGVuaGFuY2VkIGNvbW1pdCBtZXNzYWdlIG9mIHBhdGNoIDEgKEFuZHJldyBDb29wZXIpCj4g
Cj4gSnVlcmdlbiBHcm9zcyAoMik6Cj4gICAgeGVuL2dudGRldjogcmVwbGFjZSBnbG9iYWwgbGlt
aXQgb2YgbWFwcGVkIHBhZ2VzIGJ5IGxpbWl0IHBlciBjYWxsCj4gICAgeGVuL2dudGRldjogc3dp
dGNoIGZyb20ga2NhbGxvYygpIHRvIGt2Y2FsbG9jKCkKPiAKPiAgIGRyaXZlcnMveGVuL2dudGRl
di1jb21tb24uaCB8ICAyICstCj4gICBkcml2ZXJzL3hlbi9nbnRkZXYtZG1hYnVmLmMgfCAxMSAr
KystLS0tLS0KPiAgIGRyaXZlcnMveGVuL2dudGRldi5jICAgICAgICB8IDU1ICsrKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCAy
NyBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkKPiAKCkJvcmlzLCBjb3VsZCB5b3UgcGxl
YXNlIGNvbW1lbnQgb24gdGhlIHBhdGNoZXM/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
