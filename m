Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189D33191
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 15:55:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXnNz-00045T-Vp; Mon, 03 Jun 2019 13:52:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=TYzS=UC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hXnNy-00045A-JY
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 13:52:26 +0000
X-Inumbo-ID: d0db9b8a-8606-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d0db9b8a-8606-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 13:52:24 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 03 Jun 2019 07:52:23 -0600
Message-Id: <5CF526140200007800234A60@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 03 Jun 2019 07:52:20 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <1559564728-17167-1-git-send-email-andrew.cooper3@citrix.com>
 <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1559564728-17167-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/5] xen/vm-event: Drop unused u_domctl
 parameter from vm_event_domctl()
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA2LjE5IGF0IDE0OjI1LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBwYXJhbWV0ZXIgaXNuJ3QgdXNlZCBhdCBhbGwuICBGdXRoZXJtb3JlLCBlbGlk
ZSB0aGUgY29weWJhY2sgaW4KPiBmYWlsaW5nIGNhc2VzLCBhcyBpdCBpcyBvbmx5IHN1Y2Nlc3Nm
dWwgcGF0aHMgd2hpY2ggZ2VuZXJhdGUgZGF0YSB3aGljaAo+IG5lZWRzIHNlbmRpbmcgYmFjayB0
byB0aGUgY2FsbGVyLgo+IAo+IEZpbmFsbHksIGRyb3AgYSByZWR1bmRhbnQgZCA9PSBOVUxMIGNo
ZWNrLCBhcyB0aGF0IGxvZ2ljIGlzIGFsbCBjb21tb24KPiBhdCB0aGUgYmVnaW5pbmcgb2YgZG9f
ZG9tY3RsKCkuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiAtLS0KPiBDQzogUmF6
dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPgo+IENDOiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzQHRrbGVuZ3llbC5jb20+Cj4gQ0M6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNh
bGFidUBiaXRkZWZlbmRlci5jb20+Cj4gLS0tCj4gIHhlbi9jb21tb24vZG9tY3RsLmMgICAgICAg
IHwgNiArKystLS0KCkp1c3QgaW4gY2FzZXMgaXQncyB3YW50ZWQvbmVlZGVkOgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
