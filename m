Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4C01140D8
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 13:33:03 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icqEU-0007bv-1o; Thu, 05 Dec 2019 12:27:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icqES-0007bm-JJ
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 12:27:44 +0000
X-Inumbo-ID: a23e335d-175a-11ea-8223-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a23e335d-175a-11ea-8223-12813bfff9fa;
 Thu, 05 Dec 2019 12:27:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CC6C1B380;
 Thu,  5 Dec 2019 12:27:42 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575548022-14213-1-git-send-email-igor.druzhinin@citrix.com>
 <79c733c0762347e7b18b148de8ec83b8@EX13D32EUC003.ant.amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3e325aa0-4752-bb00-6a31-12d9e252254b@suse.com>
Date: Thu, 5 Dec 2019 13:27:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <79c733c0762347e7b18b148de8ec83b8@EX13D32EUC003.ant.amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] passthrough: drop break statement
 following c/s cd7dedad820
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Durrant,
 Paul" <pdurrant@amazon.com>, "linux@eikelenboom.it" <linux@eikelenboom.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxMzoyMCwgRHVycmFudCwgUGF1bCB3cm90ZToKPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNp
dHJpeC5jb20+Cj4+IFNlbnQ6IDA1IERlY2VtYmVyIDIwMTkgMTI6MTQKPj4gVG86IHhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+PiBDYzogamJldWxpY2hAc3VzZS5jb207IGxpbnV4QGVp
a2VsZW5ib29tLml0OyBEdXJyYW50LCBQYXVsCj4+IDxwZHVycmFudEBhbWF6b24uY29tPjsgSWdv
ciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4+IFN1YmplY3Q6IFtQQVRD
SCB2Ml0gcGFzc3Rocm91Z2g6IGRyb3AgYnJlYWsgc3RhdGVtZW50IGZvbGxvd2luZyBjL3MKPj4g
Y2Q3ZGVkYWQ4MjAKPj4KPj4gVGhlIGxvY2tpbmcgcmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5n
ZWQgYW5kIGEgcHJlbWF0dXJlIGJyZWFrIGluCj4+IHRoaXMgc2VjdGlvbiBub3cgY2F1c2VzIHRo
ZSBmb2xsb3dpbmcgYXNzZXJ0aW9uOgo+Pgo+PiBBc3NlcnRpb24gJyFwcmVlbXB0X2NvdW50KCkn
IGZhaWxlZCBhdCBwcmVlbXB0LmM6MzYKPj4KPj4gU3VnZ2VzdGVkLWJ5OiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gCj4gQWN0dWFsbHksIGl0IHdhcyBzdWdnZXN0ZWQgYnkg
SmFuLCBidXQgeW91IGNhbiBwdXQgbXkgUi1iIG9uIHRoZSBwYXRjaC4KCkFuZCBtaW5lOgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSSdsbCBnZXQgdGhpcyBj
b21taXR0ZWQgc29vbi4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
