Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8519E17F74D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2020 13:20:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jBdpE-000572-Rv; Tue, 10 Mar 2020 12:17:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XFS/=43=freebsd.org=royger@srs-us1.protection.inumbo.net>)
 id 1jBdpD-00056x-Fs
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2020 12:17:31 +0000
X-Inumbo-ID: 1d416cfe-62c9-11ea-bec1-bc764e2007e4
Received: from mx2.freebsd.org (unknown [2610:1c1:1:606c::19:2])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d416cfe-62c9-11ea-bec1-bc764e2007e4;
 Tue, 10 Mar 2020 12:17:30 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2D268AFAEE;
 Tue, 10 Mar 2020 12:17:30 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48cDcT4RVBz3NDJ;
 Tue, 10 Mar 2020 12:17:29 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Received: from localhost (unknown [93.176.177.204])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate) (Authenticated sender: royger)
 by smtp.freebsd.org (Postfix) with ESMTPSA id D062717ACF;
 Tue, 10 Mar 2020 12:17:27 +0000 (UTC)
 (envelope-from royger@FreeBSD.org)
Date: Tue, 10 Mar 2020 13:17:21 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <royger@FreeBSD.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200310121721.GZ24458@Air-de-Roger.citrite.net>
References: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310120802.31625-1-ian.jackson@eu.citrix.com>
Subject: Re: [Xen-devel] [OSSTEST PATCH 1/3] ts-memdisk-try-append: Add
 missing -I
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMTI6MDg6MDBQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhpcyBvbmx5IHdvcmtlZCBpbiBwcm9kdWN0aW9uIGJ5IGFjY2lkZW50IChtb3N0IG9m
IHRoZSBwcm9kdWN0aW9uCj4gc3R1ZmYgZWRpdHMgUEVSTExJQiBlYXJsaWVyIGluIHRoZSBpbnZv
Y2F0aW9uIHNlcXVlbmNlKS4KPiAKPiBDQzogUm9nZXIgUGF1IE1vbm7DqSA8cm95Z2VyQEZyZWVC
U0Qub3JnPgo+IFNpZ25lZC1vZmYtYnk6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRy
aXguY29tPgoKVGhhbmtzISBBbGwgcGF0Y2hlcyBMR1RNLCBmZWVsIGZyZWUgdG8gYWRkIG15IEFj
a2VkLWJ5LCBhcyBJIGRvbid0CnRoaW5rIEknbSBxdWFsaWZpZWQgdG8gZG8gYSByZXZpZXcgb2Yg
cGVybCBjb2RlLgoKUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
