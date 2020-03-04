Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC2C1792A1
	for <lists+xen-devel@lfdr.de>; Wed,  4 Mar 2020 15:43:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9VCf-0006MQ-Sw; Wed, 04 Mar 2020 14:40:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Jt9l=4V=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9VCe-0006MJ-04
 for xen-devel@lists.xenproject.org; Wed, 04 Mar 2020 14:40:52 +0000
X-Inumbo-ID: 24f7472c-5e26-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24f7472c-5e26-11ea-90c4-bc764e2007e4;
 Wed, 04 Mar 2020 14:40:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9893CB316;
 Wed,  4 Mar 2020 14:40:50 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-13-jgross@suse.com>
 <8306e8bb-0aec-5ac9-c6e4-c3904187fea6@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <ccca7294-2e49-d816-6f85-bc609bb1927e@suse.com>
Date: Wed, 4 Mar 2020 15:40:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <8306e8bb-0aec-5ac9-c6e4-c3904187fea6@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 12/12] xen: remove
 XEN_SYSCTL_set_parameter support
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
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDMuMjAgMTI6NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDI2LjAyLjIwMjAgMTM6
NDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IFRoZSBmdW5jdGlvbmFsaXR5IG9mIFhFTl9TWVND
VExfc2V0X3BhcmFtZXRlciBpcyBhdmFpbGFibGUgdmlhIGh5cGZzCj4+IG5vdywgc28gaXQgY2Fu
IGJlIHJlbW92ZWQuCj4+Cj4+IFRoaXMgYWxsb3dzIHRvIHJlbW92ZSB0aGUga2VybmVsX3BhcmFt
IHN0cnVjdHVyZSBmb3IgcnVudGltZSBwYXJhbWV0ZXJzCj4+IGJ5IHB1dHRpbmcgdGhlIG5vdyBv
bmx5IHVzZWQgc3RydWN0dXJlIGVsZW1lbnQgaW50byB0aGUgaHlwZnMgbm9kZQo+PiBzdHJ1Y3R1
cmUgb2YgdGhlIHJ1bnRpbWUgcGFyYW1ldGVycy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdl
biBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+Cj4gd2l0aCBvbmUgbWlub3IgYWRqdXN0bWVudDoKPiAKPj4gQEAgLTEx
MDIsNyArMTA4Niw2IEBAIHN0cnVjdCB4ZW5fc3lzY3RsIHsKPj4gICAjZGVmaW5lIFhFTl9TWVND
VExfZ2V0X2NwdV9sZXZlbGxpbmdfY2FwcyAgICAgICAgMjUKPj4gICAjZGVmaW5lIFhFTl9TWVND
VExfZ2V0X2NwdV9mZWF0dXJlc2V0ICAgICAgICAgICAgMjYKPj4gICAjZGVmaW5lIFhFTl9TWVND
VExfbGl2ZXBhdGNoX29wICAgICAgICAgICAgICAgICAgMjcKPj4gLSNkZWZpbmUgWEVOX1NZU0NU
TF9zZXRfcGFyYW1ldGVyICAgICAgICAgICAgICAgICAyOAo+IAo+IFBsZWFzZSBmb2xsb3cgdGhl
IHRtZW1fb3AgZXhhbXBsZSBoZXJlIGFuZCBkb24ndCBvdXRyaWdodAo+IGRlbGV0ZSB0aGUgbGlu
ZS4KCk9rYXkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
