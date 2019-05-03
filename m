Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 687F613167
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:45:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaLD-0005U5-Mo; Fri, 03 May 2019 15:43:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XpsL=TD=citrix.com=prvs=019780e18=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hMaLC-0005U0-8M
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:43:14 +0000
X-Inumbo-ID: 285d1c84-6dba-11e9-843c-bc764e045a96
Received: from SMTP.EU.CITRIX.COM (unknown [185.25.65.24])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 285d1c84-6dba-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:43:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,426,1549929600"; d="scan'208";a="89635878"
Date: Fri, 3 May 2019 17:43:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190503154306.n4uug6nnkd7zrj7y@Air-de-Roger>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
 <5CC6DEC50200007800229EA0@prv1-mh.provo.novell.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5CC6DEC50200007800229EA0@prv1-mh.provo.novell.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 3/9] x86/IRQ: improve dump_irqs()
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBBcHIgMjksIDIwMTkgYXQgMDU6MjM6NDlBTSAtMDYwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gRG9uJ3QgbG9nIGEgc3RyYXkgdHJhaWxpbmcgY29tbWEuIFNob3J0ZW4gYSBmZXcgZmll
bGRzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
ClJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KCj4g
LSAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVzdHM7IGkrKyApCj4g
KyAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgYWN0aW9uLT5ucl9ndWVzdHM7ICkKPiAgICAg
ICAgICAgICAgewo+IC0gICAgICAgICAgICAgICAgZCA9IGFjdGlvbi0+Z3Vlc3RbaV07Cj4gKyAg
ICAgICAgICAgICAgICBkID0gYWN0aW9uLT5ndWVzdFtpKytdOwoKUGVyIG15IHRhc3RlIEkgd291
bGQgbGVhdmUgdGhlIGluY3JlbWVudCBpbiB0aGUgZm9yLCBidXQgaXQncyBqdXN0CnRhc3RlLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
