Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351791846A8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 13:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCjCs-0004PN-Nb; Fri, 13 Mar 2020 12:14:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/r42=46=mail.xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1jCjCr-0004PI-An
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 12:14:25 +0000
X-Inumbo-ID: 2db17c8e-6524-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2db17c8e-6524-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=vhpYK21/HUFsn/V+Wv8r0+wHHbA7c4Q1ZMki0xE5ny0=; b=PQyZ841mmb9bElEluwbv5V7SIB
 dX4HxeHqaCyJUnC8XDdoKRtmM3XF5z+HUgLPU8SOAqVOeJoKefqj+gMGFieSAFeauzlXUXYzC9vax
 1VLs/B/xlxrDGqf93INO8GdVa27KCZePpQePGAh5S6aJBNN7tpq0m0yDr5ppsmok/67Q=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@mail.xenproject.org>)
 id 1jCjCq-0003ZV-0T; Fri, 13 Mar 2020 12:14:24 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1jCjCp-0005kx-Mm; Fri, 13 Mar 2020 12:14:23 +0000
Date: Fri, 13 Mar 2020 12:14:20 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200313121420.3dxzcxw536gnamfk@debian>
References: <aca85437-b9aa-c389-ad88-283b637f6547@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aca85437-b9aa-c389-ad88-283b637f6547@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] kconfig: expose all{yes,no}config targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBNYXIgMTMsIDIwMjAgYXQgMTI6MDU6MDFQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2l0aG91dCBoYXZpbmcgdGhlbSBhdCBsZWFzdCBhdCB0aGUgeGVuL01ha2VmaWxlIGxl
dmVsIHRoZXkncmUgKGNsb3NlCj4gdG8/KSBpbmFjY2Vzc2libGUuIEFzIEknbSB1bmNlcnRhaW4g
YWJvdXQgdGhlaXIgdXRpbGl0eSBhdCB0aGUgdG9wCj4gbGV2ZWwsIEknbSBsZWF2aW5nIGl0IGF0
IHRoYXQgZm9yIG5vdy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2xAeGVuLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
