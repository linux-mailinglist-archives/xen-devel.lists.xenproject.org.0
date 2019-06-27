Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE75818D
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 13:29:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgSYM-0001R4-D4; Thu, 27 Jun 2019 11:26:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgSYK-0001Qx-Ve
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 11:26:57 +0000
X-Inumbo-ID: 76d2d944-98ce-11e9-bf57-9b2239394164
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 76d2d944-98ce-11e9-bf57-9b2239394164;
 Thu, 27 Jun 2019 11:26:54 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 05:26:53 -0600
Message-Id: <5D14A7F8020000780023B84E@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 05:26:48 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
 <20190627093335.56355-3-roger.pau@citrix.com>
In-Reply-To: <20190627093335.56355-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v3 3/3] x86: check for multiboot{1,
 2} header presence
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, WeiLiu <wl@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA2LjE5IGF0IDExOjMzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IEFmdGVyIGJ1aWxkaW5nIHRoZSBoeXBlcnZpc29yIGJpbmFyeS4gTm90ZSB0aGF0IHRoZSBjaGVj
ayBpcyBwZXJmb3JtZWQKPiBieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUg
YXQgdGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
