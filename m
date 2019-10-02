Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4448AC4B6D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:29:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbrU-0004Wq-LN; Wed, 02 Oct 2019 10:28:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lglc=X3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iFbrS-0004WZ-TZ
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:27:58 +0000
X-Inumbo-ID: 4d6a9268-e4ff-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4d6a9268-e4ff-11e9-97fb-bc764e2007e4;
 Wed, 02 Oct 2019 10:27:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 79F87ADCC;
 Wed,  2 Oct 2019 10:27:57 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <87c597a3-d7f0-bd20-4c43-afd5ec919be3@suse.com>
 <20191002101433.f7565dqdcu6kaspz@Air-de-Roger>
 <b85a2a06-860e-8509-40d4-b2d115144512@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <41ee2440-00dd-49d9-4360-9083b799320e@suse.com>
Date: Wed, 2 Oct 2019 12:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b85a2a06-860e-8509-40d4-b2d115144512@suse.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradWilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMTAuMTkgMTI6MTksIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDAyLjEwLjIwMTkgMTI6
MTQsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+PiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAx
MjoxMDowNlBNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+IEZpeCBhbiB1bmd1YXJkZWQg
ZC0+YXJjaC5odm0gYWNjZXNzIGluIGFzc2lnbl9kZXZpY2UoKS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+Cj4+IFJldmlld2VkLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiAKPiBUaGFua3MuCj4gCj4+
IEknbSBhbHNvIGFkZGluZyBKdWVyZ2VuIGFzIEkgdGhpbmsgdGhpcyBpcyBzdWl0YWJsZSBmb3Ig
NC4xMy4KPiAKPiBBcyBhIHByZXZpb3VzbHkgcG9zdGVkIGZpeCBJIGRpZG4ndCB0aGluayBpdCBu
ZWVkZWQgYSByZWxlYXNlCj4gYWNrIGp1c3QgeWV0LCBpLmUuIGJlZm9yZSB0aGUgZnJlZXplLgoK
UmlnaHQuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
