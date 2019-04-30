Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FEDF2AB
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 11:21:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLOuR-00046K-Cq; Tue, 30 Apr 2019 09:18:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nlwX=TA=citrix.com=prvs=016e77c84=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1hLOuP-00046F-V5
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 09:18:41 +0000
X-Inumbo-ID: ef1bd83e-6b28-11e9-965e-6fd374b4f70c
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef1bd83e-6b28-11e9-965e-6fd374b4f70c;
 Tue, 30 Apr 2019 09:18:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,413,1549929600"; d="scan'208";a="84733875"
Date: Tue, 30 Apr 2019 10:18:33 +0100
From: Wei Liu <wei.liu2@citrix.com>
To: Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Message-ID: <20190430091833.GT30543@zion.uk.xensource.com>
References: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190429224252.29000-1-marmarek@invisiblethingslab.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Xen-devel] [PATCH v2] python: Adjust xc_physinfo wrapper for
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTI6NDI6NTJBTSArMDIwMCwgTWFyZWsgTWFyY3p5a293
c2tpLUfDs3JlY2tpIHdyb3RlOgo+IENvbW1pdCBmMDg5ZmRkZDk0ICJ4ZW46IHJlcG9ydCBQViBj
YXBhYmlsaXR5IGluIHN5c2N0bCBhbmQgdXNlIGl0IGluCj4gdG9vbHN0YWNrIiBjaGFuZ2VkIG1l
YW5pbmcgb2YgdmlydF9jYXBzIGJpdCAxIC0gcHJldmlvdXNseSBpdCB3YXMKPiAiZGlyZWN0aW8i
LCBidXQgd2FzIGNoYW5nZWQgdG8gInB2IiBhbmQgImRpcmVjdGlvIiB3YXMgbW92ZWQgdG8gYml0
IDIuCj4gQWRqdXN0IHB5dGhvbiB3cmFwcGVyIHRvIHVzZSAjZGVmaW5lcyBmb3IgdGhlIGJpdHMg
dmFsdWVzLCBhbmQgYWRkCj4gcmVwb3J0aW5nIG9mIGJvdGggInB2X2RpcmVjdGlvIiBhbmQgImh2
bV9kaXJlY3RpbyIuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5a293c2tpLUfDs3Jl
Y2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPgo+IC0tLQoKQWNrZWQtYnk6IFdl
aSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
