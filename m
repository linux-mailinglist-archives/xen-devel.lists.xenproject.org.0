Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E8E5D5
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 17:10:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL7tY-0004ls-3f; Mon, 29 Apr 2019 15:08:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MPM5=S7=citrix.com=prvs=015b46b47=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1hL7tW-0004lm-Aq
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 15:08:38 +0000
X-Inumbo-ID: a94fa603-6a90-11e9-843c-bc764e045a96
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a94fa603-6a90-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 15:08:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,409,1549929600"; d="scan'208";a="84658761"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23751.4931.955570.511497@mariner.uk.xensource.com>
Date: Mon, 29 Apr 2019 16:07:47 +0100
To: Julien Grall <julien.grall@arm.com>
In-Reply-To: <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
References: <20190426164002.22381-1-ian.jackson@eu.citrix.com>
 <20190426164002.22381-15-ian.jackson@eu.citrix.com>
 <fb17e257-83b0-ae65-4a47-d3c10d47b1d1@arm.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [OSSTEST PATCH 14/15] cross builds: Build armhf
 kernels on amd64 hosts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJlOiBbT1NTVEVTVCBQQVRDSCAxNC8xNV0gY3Jvc3MgYnVp
bGRzOiBCdWlsZCBhcm1oZiBrZXJuZWxzIG9uIGFtZDY0IGhvc3RzIik6Cj4gT24gNC8yNi8xOSA1
OjQwIFBNLCBJYW4gSmFja3NvbiB3cm90ZToKPiA+IE91ciBhcm1oZiBob3N0cyBhcmUgZGV2Ym9h
cmRzIGFuZCB2ZXJ5IHNsb3csIGFzIHdlbGwgYXMgc2NhcmNlLiAgSXQKPiA+IDV0YWtlcyAxN2tz
IG9yIHNvIGZvciBhIGtlcm5lbCBidWlsZC4gIFRoaXMgd2lsbCBnbyAqbXVjaCogZmFzdGVyIG9u
Cj4gCj4gTklUOiBzLzV0YWtlcy90YWtlcy8KClRoYW5rcywgZml4ZWQuCgo+IEZXSVc6Cj4gQWNr
ZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpUaGFua3MuCgpJYW4u
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
