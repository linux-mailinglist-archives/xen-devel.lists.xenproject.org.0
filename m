Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6B1E2BD1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2019 10:14:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNYE3-000125-FF; Thu, 24 Oct 2019 08:12:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=QAfa=YR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNYE1-000120-Pv
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2019 08:12:05 +0000
X-Inumbo-ID: f66812fe-f635-11e9-a531-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f66812fe-f635-11e9-a531-bc764e2007e4;
 Thu, 24 Oct 2019 08:12:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 609CBB51B;
 Thu, 24 Oct 2019 08:12:03 +0000 (UTC)
To: Pry Mar <pryorm09@gmail.com>
References: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <cae8cbfb-270a-6e1f-366c-b0aec3deb06b@suse.com>
Date: Thu, 24 Oct 2019 10:12:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHnBbQ8Xt=f_P+sntM27m7+NXft-U=DYXFdTV9hOqJBTU+CXNw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] bug: unable to LZ4 decompress ub1910 installer
 kernel when launching domU
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAyMjozMywgUHJ5IE1hciB3cm90ZToKPiBIZWxsbyB4ZW4tZGV2ZWwsCj4g
Cj4gaHR0cHM6Ly9wYXN0ZS5kZWJpYW4ubmV0L3BsYWluLzExMDkzNzQKPiAKPiBzaG93cyBteSB0
cmFjZXMgZnJvbSBhIGhlYWx0aHkgQ2VudE9TIDgsIHhlbi00LjEyLjEgZG9tMCB3aGVuIHRyeWlu
Zwo+IHRvIGxhdW5jaCBhIHB2IGluc3RhbGwgb2YgdGhlIG5ld2x5IHJlbGVhc2VkIHViMTkxMC4g
VGhlIHNvdXJjZSBpcyBhCj4gYmxvY2stYXR0YWNoZWQgSVNPIGFuZCB0aGUga2VybmVsL3JhbWRp
c2sgd2FzIGNvcGllZCBvZmYgbG9jYWxseS4KCldvdWxkIHlvdSBwbGVhc2UgaW5jcmVhc2UgdmVy
Ym9zaXR5ICh4bCAtdnZ2IGNyZWF0ZSAuLi4pIHN1Y2ggdGhhdCB3ZQpjYW4gc2VlIHdoYXQgZXhh
Y3RseSB0aGUgZGVjb21wcmVzc2lvbiBjb2RlIGRvZXNuJ3QgbGlrZSBhYm91dCB0aGlzCmtlcm5l
bCBpbWFnZT8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
