Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55FC11429
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 09:32:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hM692-000394-Sx; Thu, 02 May 2019 07:28:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0EvB=TC=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1hM690-00038z-Sk
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 07:28:38 +0000
X-Inumbo-ID: e61cd37d-6cab-11e9-843c-bc764e045a96
Received: from mx2.freebsd.org (unknown [2001:1900:2254:206a::19:2])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e61cd37d-6cab-11e9-843c-bc764e045a96;
 Thu, 02 May 2019 07:28:37 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 18E628F578;
 Thu,  2 May 2019 07:28:35 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 58BB081102;
 Thu,  2 May 2019 07:28:34 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [80.30.173.155])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 53CBB98FF;
 Thu,  2 May 2019 07:28:33 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Thu, 2 May 2019 09:28:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190502072827.mq6xqwgmfk2mt55y@Air-de-Roger>
References: <osstest-135317-mainreport@xen.org>
 <23753.31236.827372.481563@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23753.31236.827372.481563@mariner.uk.xensource.com>
User-Agent: NeoMutt/20180716
X-Rspamd-Queue-Id: 58BB081102
X-Spamd-Bar: --
Authentication-Results: mx1.freebsd.org
X-Spamd-Result: default: False [-2.96 / 15.00];
 local_wl_from(0.00)[FreeBSD.org];
 NEURAL_HAM_MEDIUM(-1.00)[-0.998,0];
 NEURAL_HAM_LONG(-1.00)[-1.000,0];
 NEURAL_HAM_SHORT(-0.96)[-0.962,0];
 ASN(0.00)[asn:11403, ipnet:96.47.64.0/20, country:US]
Subject: Re: [Xen-devel] [freebsd-master test] 135317: regressions - FAIL
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXkgMDEsIDIwMTkgYXQgMTE6NTA6NDRBTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gb3NzdGVzdCBzZXJ2aWNlIG93bmVyIHdyaXRlcyAoIltmcmVlYnNkLW1hc3RlciB0ZXN0
XSAxMzUzMTc6IHJlZ3Jlc3Npb25zIC0gRkFJTCIpOgo+ID4gVGVzdHMgd2hpY2ggZGlkIG5vdCBz
dWNjZWVkIGFuZCBhcmUgYmxvY2tpbmcsCj4gPiBpbmNsdWRpbmcgdGVzdHMgd2hpY2ggY291bGQg
bm90IGJlIHJ1bjoKPiA+ICBidWlsZC1hbWQ2NC14ZW4tZnJlZWJzZCAgICAgICA1IGhvc3QtaW5z
dGFsbCg1KSAgICAgICAgICBmYWlsIFJFR1IuIHZzLiAxMzUyMzMKPiAKPiBJIGd1ZXNzIHRoaXMg
bXVzdCBiZSBhIGhvc3Qtc3BlY2lmaWMgRnJlZUJTRCBrZXJuZWwgYnVnID8gIFJvZ2VyLCBhcmUK
PiB5b3UgaW52ZXN0aWdhdGluZyA/CgpIbSwgSSdtIG5vdCBzdXJlIEkgZm9sbG93IHdoeSB0aGlz
IGlzIGhvc3Qtc3BlY2lmaWMuIEl0IGhhcyBoYXBwZW5lZApvbiBib3RoIGZpYW5vMSBhbmQgZ29k
ZWxsbzEuIEFGQUlDVCB0aGlzIGlzIGEgcmVncmVzc2lvbiBpbiB0aGUKRnJlZUJTRCBrZXJuZWwu
CgpEbyB5b3Uga25vdyBpZiBvc3N0ZXN0IGhhcyBzdGFydGVkIGEgYmlzZWN0aW9uIG9mIHRoaXM/
IEknbSBub3Qgc2VlaW5nCmFueXRoaW5nIG9uIHRoZSBzdW1tYXJ5IHBhZ2UuCgpUaGFua3MsIFJv
Z2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
