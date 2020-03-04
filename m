Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD31790E3
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 14:07:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9Thr-0003dd-9T; Wed, 04 Mar 2020 13:04:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=bsO7=4V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j9Thp-0003dP-3X
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 13:04:57 +0000
X-Inumbo-ID: bebe4260-5e18-11ea-8eb5-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bebe4260-5e18-11ea-8eb5-bc764e2007e4;
 Wed, 04 Mar 2020 13:04:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C305CAC5C;
 Wed,  4 Mar 2020 13:04:55 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-9-jgross@suse.com>
 <aacae9b8-1b4b-3dcd-8aff-8466a80347a5@suse.com>
 <988e7267-2219-fe58-577d-470e2950306d@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c70a57a4-d267-b40a-e1b9-292b22d9e5cd@suse.com>
Date: Wed, 4 Mar 2020 14:04:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <988e7267-2219-fe58-577d-470e2950306d@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 08/12] xen: add /buildinfo/config entry
 to hypervisor filesystem
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

T24gMDQuMDMuMjAyMCAxMzowNiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAwNC4wMy4yMCAx
MTo0OSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2LjAyLjIwMjAgMTM6NDcsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiArY29uZmlnX2RhdGEubzogY29uZmlnLmd6Cj4+Cj4+IElzIHRoaXMg
cmVhbGx5IG5lZWRlZD8gWW91IG5lZWQgdG8gYWRkIGNvbmZpZy5neiBhcyBhCj4+IGRlcGVuZGVu
Y3kgLi4uCj4+Cj4+PiArY29uZmlnX2RhdGEuUzogJChYRU5fUk9PVCkveGVuL3Rvb2xzL2JpbmZp
bGUKPj4KPj4gLi4uIGhlcmUgYW55d2F5IGFmYWljdCwgYW5kIHRoZW4gcHJlZmVyYWJseSB1c2Ug
Li4uCj4gCj4gV2h5PyBjb25maWdfZGF0YS5TIHdpbGwgbG9vayBhbHdheXMgdGhlIHNhbWUsIGV2
ZW4gaWYgY29uZmlnLmd6IGhhcwo+IGNoYW5nZWQuIEl0IGlzIGp1c3QgdGhlIG5hbWUgb2YgdGhl
IGZpbGUgd2hpY2ggd2lsbCBiZSBwdXQgaW50byB0aGUKPiBnZW5lcmF0ZWQgc291cmNlLCBub3Qg
aXRzIGNvbnRlbnRzLiBJdHMgdGhlIC5vIGZpbGUgd2hpY2ggd2FudHMgdG8KPiBiZSBidWlsdCBh
Z2FpbiBpZiBjb25maWcuZ3ogY2hhbmdlcywgbm90IHRoZSAuUyBmaWxlLgoKT2gsIHJpZ2h0LCBJ
IGZvcmdvdCB0aGlzIHVzZXMgdGhlIC5pbmNsdWRlIGRpcmVjdGl2ZS4KCkphbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
