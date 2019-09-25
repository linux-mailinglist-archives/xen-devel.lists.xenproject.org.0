Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B57CBDE73
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:02:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6tg-0006rq-TP; Wed, 25 Sep 2019 12:59:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD6tf-0006ri-2h
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:59:55 +0000
X-Inumbo-ID: 5e46309e-df94-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 5e46309e-df94-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 12:59:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D71E7AE2A;
 Wed, 25 Sep 2019 12:59:53 +0000 (UTC)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-15-jgross@suse.com>
 <2fbb8e0bf1b18efd5b2de9a328c821e556b34f50.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b0cbacaf-d737-d388-b370-ee17141f0433@suse.com>
Date: Wed, 25 Sep 2019 14:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2fbb8e0bf1b18efd5b2de9a328c821e556b34f50.camel@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 14/47] xen/sched: make null scheduler
 vcpu agnostic.
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDkuMTkgMTQ6NTEsIERhcmlvIEZhZ2dpb2xpIHdyb3RlOgo+IE9uIFNhdCwgMjAxOS0w
OS0xNCBhdCAxMDo1MiArMDIwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gU3dpdGNoIG51bGwg
c2NoZWR1bGVyIGNvbXBsZXRlbHkgZnJvbSB2Y3B1IHRvIHNjaGVkX3VuaXQgdXNhZ2UuCj4+Cj4+
IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPj4KPiBSZXZp
ZXdlZC1ieTogRGFyaW8gRmFnZ2lvbGkgPGRmYWdnaW9saUBzdXNlLmNvbT4KPiAKPiBXaXRoLCBp
ZiBwb3NzaWJsZSwgYWxsIHRoZSBvY2N1cnJlbmNlcyBvZiAnaXRlbScgaW4gY29tbWVudHMgYWN0
dWFsbHkKPiByZXBsYWNlZCB3aXRoICd1bml0Jy4KPiAKPiBMaWtlLCBmb3IgaW5zdGFuY2UsIHRo
ZXNlLi4uCgpPaCwgdGhhbmtzIGZvciBub3RpY2luZyB0aG9zZSEKCgpKdWVyZ2VuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
