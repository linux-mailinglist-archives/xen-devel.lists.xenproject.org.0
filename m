Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D780C4AFD
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 12:07:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFbUu-0002IO-Kb; Wed, 02 Oct 2019 10:04:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nbWb=X3=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iFbUs-0002IJ-5X
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2019 10:04:38 +0000
X-Inumbo-ID: 093741b6-e4fc-11e9-bf31-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by localhost (Halon) with ESMTPS
 id 093741b6-e4fc-11e9-bf31-bc764e2007e4;
 Wed, 02 Oct 2019 10:04:35 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id EC909240105
 for <xen-devel@lists.xenproject.org>; Wed,  2 Oct 2019 12:04:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1570010674; bh=I1qw5OQMzaEiyN76u1lpQGp4vW63zitfeMJBuGfOejc=;
 h=Subject:To:From:Date:From;
 b=jte0WdO8hhbIgMsy1Q8x+G9c/jTLH+O/P6MoidziuPuf4d28phnwSzcAzqTCyxURA
 j/vBV2A4Vk6OTITDLT1nIpDaZIiXMXdHrmduTyez7h0sdTCcqY5yEQydDP+PPTTWNW
 TJ2d7hh/5RVRJMd1pguEesRVUe0NiNdwcACwgHAeW6x0Bso+OmxisJ3MoDeIPF8zK4
 ChF3IvbACLwwYMvoM7pYvueiYmN0wN9uy+Ir5mQ9BcBEVyJ/VKFAvbOtVPA29eoZ1t
 J8VhtZuk/Hzai5eZtlqtZJzrvrwe7oftnBVJzRvLjS7mgNiiqDhFyXVk1NOtLgvu6c
 s5s2OLo4ORj3g==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 46jsDw0n6bz9rxc;
 Wed,  2 Oct 2019 12:04:32 +0200 (CEST)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, Paul.Durrant@citrix.com
References: <51bd31f9-4fb1-84b5-7b9b-983b53133148@posteo.de>
 <a2fecd7b-a035-48b4-ed18-cd3234be8d58@citrix.com>
 <53c70f32-9ae6-a9f8-6472-5e49d01ce2b0@posteo.de>
 <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
From: Andreas Kinzler <hfp@posteo.de>
Message-ID: <67b07eb0-e9ac-e7b2-cf07-0a1733f7526a@posteo.de>
Date: Wed, 2 Oct 2019 12:04:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1b95b3f8-b822-1f1c-243f-728e7967d04f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Windows HVM no longer boots with AMD Ryzen 3700X
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAuMDguMjAxOSAyMjozOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAyMC8wOC8yMDE5
IDIxOjM2LCBBbmRyZWFzIEtpbnpsZXIgd3JvdGU6Cj4+Pj4gSXMgaXQgYSBrbm93biBwcm9ibGVt
PyBEaWQgc29tZW9uZSB0ZXN0IHRoZSBuZXcgRVBZQ3M/Cj4+PiBUaGlzIGxvb2tzIGZhbWlsaWFy
LCBhbmQgaXMgc3RpbGwgc29tZXdoZXJlIG9uIG15IFRPRE8gbGlzdC4KPj4gRG8geW91IGFscmVh
ZHkga25vdyB0aGUgcmVhc29uIG9yIGlzIHRoYXQgc3RpbGwgdG8gaW52ZXN0aWdhdGU/Cj4+PiBE
b2VzIGJvb3Rpbmcgd2l0aCBhIHNpbmdsZSB2Q1BVIHdvcms/Cj4gSG1tIC0gcGVyaGFwcyBpdHMg
bm90IHRoZSBzYW1lIGlzc3VlIHRoZW4uwqAgRWl0aGVyIHdheSwgaXRzIGZpcm1seSBpbgo+IHRo
ZSAic3RpbGwgdG8gaW52ZXN0aWdhdGUiIHBoYXNlLgoKQW55IHVwZGF0ZSBvbiB0aGUgdG9waWM/
CgpSZWdhcmRzIEFuZHJlYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
