Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ECD142A18
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 13:09:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itVow-0007pO-L3; Mon, 20 Jan 2020 12:06:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=36V9=3J=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1itVou-0007pH-Eq
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 12:06:16 +0000
X-Inumbo-ID: 3daf4c0e-3b7d-11ea-9fd7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3daf4c0e-3b7d-11ea-9fd7-bc764e2007e4;
 Mon, 20 Jan 2020 12:06:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1itVol-0005uw-8a; Mon, 20 Jan 2020 12:06:07 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1itVok-0000sX-VI; Mon, 20 Jan 2020 12:06:07 +0000
Date: Mon, 20 Jan 2020 12:06:04 +0000
From: Wei Liu <wl@xen.org>
To: Ian Jackson <ian.jackson@eu.citrix.com>
Message-ID: <20200120120604.ndp5d5lnslwwc3t5@debian>
References: <61695d47-d419-a2cc-6503-9202e85da6a0@citrix.com>
 <20200117181207.7087-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200117181207.7087-1-ian.jackson@eu.citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] libxl: event: Document lifetime API for
 libxl_childproc_setmode
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMTcsIDIwMjAgYXQgMDY6MTI6MDdQTSArMDAwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gVGhlcmUgaXMgYWxyZWFkeSBhbiBpZGVudGljYWwgY29tbWVudCBmb3IKPiBsaWJ4bF9v
c2V2ZW50X3JlZ2lzdGVyX2hvb2tzLgo+IAo+IGxpYnhsX2NoaWxkcHJvY19zZXRtb2RlJ3MgaG9v
a3MgcGFyYW1ldGVyIGhhcyB0aGUgc2FtZSBwcm9wZXJ0eSBhbmQKPiB0aGlzIHNob3VsZCBiZSBk
b2N1bWVudGVkLgo+IAo+IFJlcG9ydGVkLWJ5OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFw
QGNpdHJpeC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1
LmNpdHJpeC5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
