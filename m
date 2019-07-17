Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8EB6B6F0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 08:48:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hndiC-0006XI-H1; Wed, 17 Jul 2019 06:46:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pZ7V=VO=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1hndiB-0006XB-41
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 06:46:47 +0000
X-Inumbo-ID: a4a34c73-a85e-11e9-8980-bc764e045a96
Received: from smtprelay.hostedemail.com (unknown [216.40.44.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a4a34c73-a85e-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 06:46:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id 17059181D12ED;
 Wed, 17 Jul 2019 06:46:45 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1538:1568:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3622:3867:3872:4321:5007:10004:10400:10848:11026:11232:11658:11914:12043:12297:12438:12740:12760:12895:13069:13255:13311:13357:13439:14659:14721:21080:21627:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:25,
 LUA_SUMMARY:none
X-HE-Tag: copy28_7d036c1ef63
X-Filterd-Recvd-Size: 1561
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf01.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Jul 2019 06:46:43 +0000 (UTC)
Message-ID: <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Zhenzhong Duan <zhenzhong.duan@oracle.com>, linux-kernel@vger.kernel.org
Date: Tue, 16 Jul 2019 23:46:41 -0700
In-Reply-To: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v8 4/5] x86/paravirt: Remove const mark from
 x86_hyper_xen_hvm variable
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
Cc: jgross@suse.com, sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com,
 bp@alien8.de, xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCAyMDE5LTA3LTE2IGF0IDEyOjI2ICswODAwLCBaaGVuemhvbmcgRHVhbiB3cm90ZToK
PiAuLiBhcyAibm9wdiIgc3VwcG9ydCBuZWVkcyBpdCB0byBiZSBjaGFuZ2VhYmxlIGF0IGJvb3Qg
dXAgc3RhZ2UuCj4gCj4gQ2hlY2twYXRjaCByZXBvcnRzIHdhcm5pbmcsIHNvIG1vdmUgdmFyaWFi
bGUgZGVjbGFyYXRpb25zIGZyb20KPiBoeXBlcnZpc29yLmMgdG8gaHlwZXJ2aXNvci5oCltdCj4g
ZGlmZiAtLWdpdCBhL2FyY2gveDg2L3hlbi9lbmxpZ2h0ZW5faHZtLmMgYi9hcmNoL3g4Ni94ZW4v
ZW5saWdodGVuX2h2bS5jCltdCj4gQEAgLTI1OSw3ICsyNTksNyBAQCBzdGF0aWMgX19pbml0IHZv
aWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4gLWNv
bnN0IF9faW5pdGNvbnN0IHN0cnVjdCBoeXBlcnZpc29yX3g4NiB4ODZfaHlwZXJfeGVuX2h2bSA9
IHsKPiArc3RydWN0IGh5cGVydmlzb3JfeDg2IHg4Nl9oeXBlcl94ZW5faHZtIF9faW5pdGRhdGEg
PSB7CgpzdGF0aWM/CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
