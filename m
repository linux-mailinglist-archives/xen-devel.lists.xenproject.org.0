Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A85BC4B42
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:22:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbjA-0003aD-9d; Wed, 02 Oct 2019 10:19:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bv4y=X3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iFbj9-0003a7-Aj
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:19:23 +0000
X-Inumbo-ID: 19c8791c-e4fe-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 19c8791c-e4fe-11e9-8628-bc764e2007e4;
 Wed, 02 Oct 2019 10:19:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11650ADCC;
 Wed,  2 Oct 2019 10:19:21 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <87c597a3-d7f0-bd20-4c43-afd5ec919be3@suse.com>
 <20191002101433.f7565dqdcu6kaspz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b85a2a06-860e-8509-40d4-b2d115144512@suse.com>
Date: Wed, 2 Oct 2019 12:19:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191002101433.f7565dqdcu6kaspz@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] IOMMU: add missing HVM check
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMjAxOSAxMjoxNCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gT24gV2VkLCBP
Y3QgMDIsIDIwMTkgYXQgMTI6MTA6MDZQTSArMDIwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEZp
eCBhbiB1bmd1YXJkZWQgZC0+YXJjaC5odm0gYWNjZXNzIGluIGFzc2lnbl9kZXZpY2UoKS4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IAo+IFJl
dmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5r
cy4KCj4gSSdtIGFsc28gYWRkaW5nIEp1ZXJnZW4gYXMgSSB0aGluayB0aGlzIGlzIHN1aXRhYmxl
IGZvciA0LjEzLgoKQXMgYSBwcmV2aW91c2x5IHBvc3RlZCBmaXggSSBkaWRuJ3QgdGhpbmsgaXQg
bmVlZGVkIGEgcmVsZWFzZQphY2sganVzdCB5ZXQsIGkuZS4gYmVmb3JlIHRoZSBmcmVlemUuCgpK
YW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
