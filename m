Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5426BCA8E
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 16:47:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCm2R-0001sZ-GU; Tue, 24 Sep 2019 14:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCm2Q-0001sE-8Q
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 14:43:34 +0000
X-Inumbo-ID: ae93ef02-ded9-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ae93ef02-ded9-11e9-97fb-bc764e2007e4;
 Tue, 24 Sep 2019 14:43:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF054AC93;
 Tue, 24 Sep 2019 14:43:32 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190924143515.8810-1-julien.grall@arm.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <43c10068-99d6-656e-50db-ab1aeae21f78@suse.com>
Date: Tue, 24 Sep 2019 16:43:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924143515.8810-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v2 0/2] Errata implementation and
 doc update
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTY6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToKPiBIaSBhbGwsCj4gCj4gVGhl
IHR3byBwYXRjaGVzIGFyZSBub3QgcmVsYXRlZCBidXQgdGhlIHNlY29uZCBvbmUgZGVwZW5kZW5k
cyBvbiB0aGUgZmlyc3QKPiBvbmUuIFNvIEkgZGVjaWRlZCB0byBtZXJnZSB0aGVtIHRvZ2V0aGVy
Lgo+IAo+IENoZWVycywKPiAKPiBKdWxpZW4gR3JhbGwgKDIpOgo+ICAgIHhlbi9hcm06IEltcGxl
bWVudCB3b3JrYXJvdW5kIGZvciBDb3J0ZXggQS01NyBhbmQgQ29ydGV4IEE3MiBBVAo+ICAgICAg
c3BlY3VsYXRlCj4gICAgZG9jczogUmVwbGFjZSBhbGwgaW5zdGFuY2Ugb2YgQVJNIGJ5IEFybQoK
Rm9yIHRoZSBzZXJpZXM6CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+CgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
