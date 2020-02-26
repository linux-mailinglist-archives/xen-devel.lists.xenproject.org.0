Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 922D116FF6D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 14:02:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6wIp-00059Z-82; Wed, 26 Feb 2020 13:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6wIn-00058o-Eq
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:00:37 +0000
X-Inumbo-ID: fabd9ca6-5897-11ea-941b-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fabd9ca6-5897-11ea-941b-12813bfff9fa;
 Wed, 26 Feb 2020 13:00:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8B020B117;
 Wed, 26 Feb 2020 13:00:35 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200226121921.28627-1-roger.pau@citrix.com>
 <20200226121921.28627-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a714908a-b3a1-989f-83e3-fb7f808b9367@suse.com>
Date: Wed, 26 Feb 2020 14:00:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200226121921.28627-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86: introduce a nmi_count tracking
 variable
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDIuMjAyMCAxMzoxOSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoaXMgaXMgbW9k
ZWxlZCBhZnRlciB0aGUgaXJxX2NvdW50IHZhcmlhYmxlLCBhbmQgaXMgdXNlZCB0byBhY2NvdW50
Cj4gZm9yIGFsbCB0aGUgTk1JcyBoYW5kbGVkIGJ5IHRoZSBzeXN0ZW0uCj4gCj4gVGhpcyB3aWxs
IGFsbG93IHRvIHJlcHVycG9zZSB0aGUgbm1pX2NvdW50KCkgaGVscGVyIHNvIGl0IGNhbiBiZSB1
c2VkCj4gaW4gYSBzaW1pbGFyIG1hbm5lciBhcyBsb2NhbF9pcnFfY291bnQoKTogYWNjb3VudCBm
b3IgdGhlIE5NSXMKPiBjdXJyZW50bHkgaW4gc2VydmljZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
