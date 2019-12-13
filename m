Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECE611E1F5
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:30:42 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifiB1-0005hU-9Y; Fri, 13 Dec 2019 10:28:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbPo=2D=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ifiB0-0005hP-5O
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:28:02 +0000
X-Inumbo-ID: 3cb88052-1d93-11ea-8ed0-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3cb88052-1d93-11ea-8ed0-12813bfff9fa;
 Fri, 13 Dec 2019 10:28:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0E5F8AD12;
 Fri, 13 Dec 2019 10:28:00 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>, xen-devel@lists.xenproject.org
References: <20191213101809.20784-1-pdurrant@amazon.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <e5658c50-b8f0-9967-dfac-dc21792e01bd@suse.com>
Date: Fri, 13 Dec 2019 11:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191213101809.20784-1-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] public/io/ring.h: add
 FRONT/BACK_RING_ATTACH macros
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMTIuMTkgMTE6MTgsIFBhdWwgRHVycmFudCB3cm90ZToKPiBUaGUgdmVyc2lvbiBvZiB0
aGlzIGhlYWRlciBwcmVzZW50IGluIHRoZSBMaW51eCBzb3VyY2UgdHJlZSBoYXMgY29udGFpbmVk
Cj4gc3VjaCBtYWNyb3MgZm9yIHNvbWUgdGltZS4gVGhlc2UgbWFjcm9zLCBhcyB0aGUgbmFtZXMg
aW1wbHksIGFsbG93IGZyb250Cj4gb3IgYmFjayByaW5ncyB0byBiZSBzZXQgdXAgZm9yIGV4aXN0
ZW50IChyYXRoZXIgdGhhbiBmcmVzaGx5IGNyZWF0ZWQgYW5kCj4gemVyb2VkKSBzaGFyZWQgcmlu
Z3MuCj4gCj4gVGhpcyBwYXRjaCBpcyB0byB1cGRhdGUgdGhpcywgdGhlIGNhbm9uaWNhbCB2ZXJz
aW9uIG9mIHRoZSBoZWFkZXIsIHRvCj4gbWF0Y2ggdGhlIGxhdGVzdCBkZWZpbml0aW9uIG9mIHRo
ZXNlIG1hY3JvcyBpbiB0aGUgTGludXggc291cmNlLgo+IAo+IE5PVEU6IFRoZSB3YXkgdGhlIG5l
dyBtYWNyb3MgYXJlIGRlZmluZWQgYWxsb3dzIHRoZSBGUk9OVC9CQUNLX1JJTkdfSU5JVAo+ICAg
ICAgICBtYWNyb3MgdG8gYmUgcmUtZGVmaW5lZCBpbiB0ZXJtcyBvZiB0aGVtLCB0aGVyZWJ5IHJl
ZHVjaW5nCj4gICAgICAgIGR1cGxpY2F0aW9uLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVy
cmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
