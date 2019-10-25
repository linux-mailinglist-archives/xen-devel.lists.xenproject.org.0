Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B814E4ABA
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 14:06:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNyKj-00046K-Mw; Fri, 25 Oct 2019 12:04:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=/YrW=YS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iNyKh-00046B-LZ
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 12:04:43 +0000
X-Inumbo-ID: a0c190d8-f71f-11e9-8aca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0c190d8-f71f-11e9-8aca-bc764e2007e4;
 Fri, 25 Oct 2019 12:04:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37A33B253;
 Fri, 25 Oct 2019 12:04:42 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191023135812.21348-1-andrew.cooper3@citrix.com>
 <20191023135812.21348-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4a90d5a4-6bc3-d891-0e2c-815ae5cb01ba@suse.com>
Date: Fri, 25 Oct 2019 14:04:59 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191023135812.21348-4-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 3/7] xen/nospec: Introduce
 CONFIG_SPECULATIVE_HARDEN_BRANCH
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
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTAuMjAxOSAxNTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBKdXN0IGFzIHdpdGgg
Q09ORklHX1NQRUNVTEFUSVZFX0hBUkRFTl9BUlJBWSwgYnJhbmNoIGhhcmRlbmluZyBzaG91bGQg
YmUKPiBjb25maWd1cmFibGUgYXQgY29tcGlsZSB0aW1lLgo+IAo+IFRoZSBwcmV2aW91cyBDT05G
SUdfSFZNIHdhcyBhIGNvbnNlcXVlbmNlIG9mIHdoYXQgY291bGQgYmUgZGlzY3Vzc2VkIHB1Ymxp
Y2x5Cj4gYXQgdGhlIHRpbWUgdGhlIHBhdGNoZXMgd2VyZSBzdWJtaXR0ZWQsIGFuZCB3YXNuJ3Qg
YWN0dWFsbHkgY29ycmVjdC4gIExhdGVyCj4gcGF0Y2hlcyB3aWxsIG1ha2UgZnVydGhlciBjb3Jy
ZWN0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
