Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB35E149
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2019 13:29:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hL4Q4-0008CI-3S; Mon, 29 Apr 2019 11:26:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gpsw=S7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hL4Q3-0008C9-2d
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 11:25:59 +0000
X-Inumbo-ID: 8f31a60a-6a71-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f31a60a-6a71-11e9-843c-bc764e045a96;
 Mon, 29 Apr 2019 11:25:58 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 29 Apr 2019 05:25:57 -0600
Message-Id: <5CC6DF3D0200007800229EBF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Mon, 29 Apr 2019 05:25:49 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "xen-devel" <xen-devel@lists.xenproject.org>
References: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
In-Reply-To: <5CC6DD090200007800229E80@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] [PATCH 6/9] x86/IRQ: reduce unused space in struct
 arch_irq_desc
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKLS0tIGEveGVu
L2luY2x1ZGUvYXNtLXg4Ni9pcnEuaAorKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2lycS5oCkBA
IC0zNSw4ICszNSw4IEBAIHN0cnVjdCBhcmNoX2lycV9kZXNjIHsKICAgICAgICAgY3B1bWFza192
YXJfdCBjcHVfbWFzazsKICAgICAgICAgY3B1bWFza192YXJfdCBvbGRfY3B1X21hc2s7CiAgICAg
ICAgIGNwdW1hc2tfdmFyX3QgcGVuZGluZ19tYXNrOwotICAgICAgICB1bnNpZ25lZCBtb3ZlX2Ns
ZWFudXBfY291bnQ7CiAgICAgICAgIHZtYXNrX3QgKnVzZWRfdmVjdG9yczsKKyAgICAgICAgdW5z
aWduZWQgbW92ZV9jbGVhbnVwX2NvdW50OwogICAgICAgICB1OCBtb3ZlX2luX3Byb2dyZXNzIDog
MTsKICAgICAgICAgczggdXNlZDsKIH07CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
