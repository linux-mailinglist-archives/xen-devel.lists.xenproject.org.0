Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1362E17E0C0
	for <lists+xen-devel@lfdr.de>; Mon,  9 Mar 2020 14:04:16 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBI2M-00007I-RX; Mon, 09 Mar 2020 13:01:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=FVsd=42=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jBI2M-00007D-3O
 for xen-devel@lists.xenproject.org; Mon, 09 Mar 2020 13:01:38 +0000
X-Inumbo-ID: 1c212b02-6206-11ea-90c4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c212b02-6206-11ea-90c4-bc764e2007e4;
 Mon, 09 Mar 2020 13:01:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D67D4B1A6;
 Mon,  9 Mar 2020 13:01:35 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
References: <20200226124705.29212-1-jgross@suse.com>
 <20200226124705.29212-2-jgross@suse.com>
 <d3b83513-8fc2-634c-fa89-00df84c5c4fb@xen.org>
 <471c2f88-2ac2-823d-546f-6fc817e34ec8@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f101fc47-329c-e704-86cd-0411b6a15f99@suse.com>
Date: Mon, 9 Mar 2020 14:01:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <471c2f88-2ac2-823d-546f-6fc817e34ec8@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 01/12] xen: allow only sizeof(bool)
 variables for boolean_param()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMDMuMjAgMTI6NTUsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA5LjAzLjIwMjAgMTI6
NDMsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gT24gMjYvMDIvMjAyMCAxMjo0NiwgSnVlcmdlbiBH
cm9zcyB3cm90ZToKPj4+IEBAIC00Niw3ICs0OCw4IEBAIGV4dGVybiBjb25zdCBzdHJ1Y3Qga2Vy
bmVsX3BhcmFtIF9fcGFyYW1fc3RhcnRbXSwgX19wYXJhbV9lbmRbXTsKPj4+ICAgICAgICBfX2tw
YXJhbSBfX3NldHVwXyMjX3ZhciA9IFwKPj4+ICAgICAgICAgICAgeyAubmFtZSA9IF9fc2V0dXBf
c3RyXyMjX3ZhciwgXAo+Pj4gICAgICAgICAgICAgIC50eXBlID0gT1BUX0JPT0wsIFwKPj4+IC0g
ICAgICAgICAgLmxlbiA9IHNpemVvZihfdmFyKSwgXAo+Pj4gKyAgICAgICAgICAubGVuID0gc2l6
ZW9mKF92YXIpICsgXAo+Pj4gKyAgICAgICAgICAgICAgICAgQlVJTERfQlVHX09OX1pFUk8oc2l6
ZW9mKF92YXIpICE9IHNpemVvZihib29sKSksIFwKPj4KPj4gICBGcm9tIG15IHVuZGVyc3RhbmRp
bmcsIHNpemVvZihib29sKSBpcyBub3QgbmVjZXNzYXJpbHkgMSAoaXQgY2FuIGJlCj4+IGdyZWF0
ZXIpLiBXaGlsZSB0aGlzIGlzIGZpbmUgdG8gdXNlIGl0IGluIFhlbiwgSSB0aGluayB3ZSB3YW50
IGl0IHRvCj4+IGFsd2F5cyBiZSBvbmUgd2hlbiBleHBvc2VkIGluIHRoZSBoeXBmcy4KPiAKPiBJ
IGRvbid0IHRoaW5rIHNvOiBXZSB3YW50IHZhcmlhYmxlIG9mIHR5cGUgJ2Jvb2wnIHRvIGJlIHVw
ZGF0ZWQKPiBjb25zaXN0ZW50bHkgKGkuZS4gYnkgYSB3cml0ZSB0byB0aGUgZnVsbCB2YXJpYWJs
ZSkuIEhlbmNlIEkKPiB0aGluayBzaXplb2YoYm9vbCkgaXMgY29ycmVjdCBoZXJlLiBJIGNhbiBz
ZWUgdGhvdWdoIHRoYXQgdGhlCj4gaHlwZXJjYWxsIGludGVyZmFjZSB0aGVuIGdhaW5zIGEgZGVw
ZW5kZW5jeSBvbiB0aGUgaHlwZXJ2aXNvcidzCj4gcmVwcmVzZW50YXRpb24gb2YgJ2Jvb2wnLCBi
dXQgSSB0aGluayBzdWNoIG91Z2h0IHRvIGJlIHRha2VuCj4gY2FyZSBvZiBpbiB0aGUgZnVuY3Rp
b24gY2Fycnlpbmcgb3V0IHRoZSB3cml0ZSwgbm90IGluIHRoZQo+IG1hY3JvIGhlcmUuCgpTbyB5
b3UgdGhpbmsgSSBzaG91bGQgc3BlY2lhbCBjYXNlIGJvb2wgZW50cmllcyB3aGVuIHJldHVybmlu
ZyB0aGUKc2l6ZSBpbmZvcm1hdGlvbj8gT3IgZG8geW91IHRoaW5rIGl0cyBmaW5lIHRvIGhhdmUg
dGhlIGh5cGVydmlzb3IncwpzaXplIHJlcG9ydGVkIGFuZCBsZXQgdGhlIGxpYiBkbyB0aGUgc2l6
ZSBoYW5kbGluZyBjb3JyZWN0bHk/CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
