Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54654127B3F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 13:48:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiHf5-0001hM-8o; Fri, 20 Dec 2019 12:45:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TZvG=2K=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iiHf3-0001hG-Hn
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 12:45:41 +0000
X-Inumbo-ID: a1041768-2326-11ea-934c-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1041768-2326-11ea-934c-12813bfff9fa;
 Fri, 20 Dec 2019 12:45:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1E298AF24;
 Fri, 20 Dec 2019 12:45:39 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191211152956.5168-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5f6cb6e6-0358-a38b-b61a-3793ebb89a1e@suse.com>
Date: Fri, 20 Dec 2019 13:45:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191211152956.5168-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 0/4] xen-blkback: support live update
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
Cc: Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEuMTIuMTkgMTY6MjksIFBhdWwgRHVycmFudCB3cm90ZToKPiBQYXRjaCAjMSBpcyBjbGVh
bi11cCBmb3IgYW4gYXBwYXJlbnQgbWlzLWZlYXR1cmUuCj4gCj4gUGF1bCBEdXJyYW50ICg0KToK
PiAgICB4ZW5idXM6IG1vdmUgeGVuYnVzX2Rldl9zaHV0ZG93bigpIGludG8gZnJvbnRlbmQgY29k
ZS4uLgo+ICAgIHhlbmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8gY2xvc2VkCj4g
ICAgeGVuL2ludGVyZmFjZTogcmUtZGVmaW5lIEZST05UL0JBQ0tfUklOR19BVFRBQ0goKQo+ICAg
IHhlbi1ibGtiYWNrOiBzdXBwb3J0IGR5bmFtaWMgdW5iaW5kL2JpbmQKPiAKPiAgIGRyaXZlcnMv
YmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMgICAgICAgICB8IDU2ICsrKysrKysrKysrKysrKy0t
LS0tLS0KPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXMuaCAgICAgICAgICAgICAgICB8ICAy
IC0KPiAgIGRyaXZlcnMveGVuL3hlbmJ1cy94ZW5idXNfcHJvYmUuYyAgICAgICAgICB8IDM1ICsr
KystLS0tLS0tLS0tCj4gICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2JhY2tlbmQu
YyAgfCAgMSAtCj4gICBkcml2ZXJzL3hlbi94ZW5idXMveGVuYnVzX3Byb2JlX2Zyb250ZW5kLmMg
fCAyNCArKysrKysrKystCj4gICBpbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oICAgICAg
ICAgICAgfCAyOSArKysrLS0tLS0tLQo+ICAgaW5jbHVkZS94ZW4veGVuYnVzLmggICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKwo+ICAgNyBmaWxlcyBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCsp
LCA2NyBkZWxldGlvbnMoLSkKClNlcmllcyBwdXNoZWQgdG8geGVuL3RpcC5naXQgZm9yLWxpbnVz
LTUuNWIKCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
