Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452F3DDC8
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 10:33:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL1g8-0002TL-7q; Mon, 29 Apr 2019 08:30:24 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=O4Ik=S7=citrix.com=prvs=0151e7be4=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hL1g6-0002TG-Cf
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 08:30:22 +0000
X-Inumbo-ID: 06608074-6a59-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 06608074-6a59-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 08:30:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84619559"
Date: Mon, 29 Apr 2019 09:30:17 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190429083017.GQ30543@zion.uk.xensource.com>
References: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBBcHIgMjgsIDIwMTkgYXQgMDk6MDg6MjNQTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IENvbW1pdCBmMDg5ZmRkZDk0ICJ4ZW46IHJlcG9ydCBQViBj
YXBhYmlsaXR5IGluIHN5c2N0bCBhbmQgdXNlIGl0IGluCj4gdG9vbHN0YWNrIiBjaGFuZ2VkIG1l
YW5pbmcgb2YgdmlydF9jYXBzIGJpdCAxIC0gcHJldmlvdXNseSBpdCB3YXMKPiAiZGlyZWN0aW8i
LCBidXQgd2FzIGNoYW5nZWQgdG8gInB2IiBhbmQgImRpcmVjdGlvIiB3YXMgbW92ZWQgdG8gYml0
IDIuCj4gQWRqdXN0IHB5dGhvbiB3cmFwcGVyLCBhbmQgYWRkIHJlcG9ydGluZyBvZiBib3RoICJw
dl9kaXJlY3RpbyIgYW5kCj4gImh2bV9kaXJlY3RpbyIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFy
ZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29t
PgoKQWNrZWQtYnk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
