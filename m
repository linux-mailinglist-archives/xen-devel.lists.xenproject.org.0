Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 420526C056
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 19:25:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnndc-0008PH-JC; Wed, 17 Jul 2019 17:22:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pZ7V=VO=perches.com=joe@srs-us1.protection.inumbo.net>)
 id 1hnnda-0008PC-Ae
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 17:22:42 +0000
X-Inumbo-ID: 7aa8a576-a8b7-11e9-8980-bc764e045a96
Received: from smtprelay.hostedemail.com (unknown [216.40.44.41])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7aa8a576-a8b7-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 17:22:40 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay07.hostedemail.com (Postfix) with ESMTP id C9C23181D33FC;
 Wed, 17 Jul 2019 17:22:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com,
 :::::::::::::::::::,
 RULES_HIT:41:355:379:599:968:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2198:2199:2393:2559:2562:2828:3138:3139:3140:3141:3142:3352:3622:3865:3866:3867:3868:3871:3872:3874:4321:5007:9010:10004:10400:10848:11026:11232:11473:11658:11914:12043:12297:12438:12740:12760:12895:13069:13255:13311:13357:13439:14659:14721:21080:21627:30054:30091,
 0,
 RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.14.0.180 64.201.201.201,
 CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none, DomainCache:0,
 MSF:not bulk, SPF:fn, MSBL:0, DNSBL:neutral, Custom_rules:0:0:0, LFtime:28,
 LUA_SUMMARY:none
X-HE-Tag: cream96_17037daa23b2d
X-Filterd-Recvd-Size: 2239
Received: from XPS-9350 (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
 (Authenticated sender: joe@perches.com)
 by omf19.hostedemail.com (Postfix) with ESMTPA;
 Wed, 17 Jul 2019 17:22:37 +0000 (UTC)
Message-ID: <18469f4c80f3dbf04eda5415f4bcf1c8fa655370.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Juergen Gross <jgross@suse.com>, Zhenzhong Duan
 <zhenzhong.duan@oracle.com>,  linux-kernel@vger.kernel.org
Date: Wed, 17 Jul 2019 10:22:36 -0700
In-Reply-To: <d4be507a-aa31-9ba3-9bf0-c8b60ec3f93a@suse.com>
References: <1563251169-30740-1-git-send-email-zhenzhong.duan@oracle.com>
 <9791d12717bba784f24f35c29ddfaab9ccb78965.camel@perches.com>
 <d4be507a-aa31-9ba3-9bf0-c8b60ec3f93a@suse.com>
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
Cc: sstabellini@kernel.org, x86@kernel.org, mingo@redhat.com, bp@alien8.de,
 xen-devel@lists.xenproject.org, boris.ostrovsky@oracle.com, tglx@linutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTA3LTE3IGF0IDA4OjQ5ICswMjAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+
IE9uIDE3LjA3LjE5IDA4OjQ2LCBKb2UgUGVyY2hlcyB3cm90ZToKPiA+IE9uIFR1ZSwgMjAxOS0w
Ny0xNiBhdCAxMjoyNiArMDgwMCwgWmhlbnpob25nIER1YW4gd3JvdGU6Cj4gPiA+IC4uIGFzICJu
b3B2IiBzdXBwb3J0IG5lZWRzIGl0IHRvIGJlIGNoYW5nZWFibGUgYXQgYm9vdCB1cCBzdGFnZS4K
PiA+ID4gCj4gPiA+IENoZWNrcGF0Y2ggcmVwb3J0cyB3YXJuaW5nLCBzbyBtb3ZlIHZhcmlhYmxl
IGRlY2xhcmF0aW9ucyBmcm9tCj4gPiA+IGh5cGVydmlzb3IuYyB0byBoeXBlcnZpc29yLmgKPiA+
IFtdCj4gPiA+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni94ZW4vZW5saWdodGVuX2h2bS5jIGIvYXJj
aC94ODYveGVuL2VubGlnaHRlbl9odm0uYwo+ID4gW10KPiA+ID4gQEAgLTI1OSw3ICsyNTksNyBA
QCBzdGF0aWMgX19pbml0IHZvaWQgeGVuX2h2bV9ndWVzdF9sYXRlX2luaXQodm9pZCkKPiA+ID4g
ICAjZW5kaWYKPiA+ID4gICB9Cj4gPiA+ICAgCj4gPiA+IC1jb25zdCBfX2luaXRjb25zdCBzdHJ1
Y3QgaHlwZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9odm0gPSB7Cj4gPiA+ICtzdHJ1Y3QgaHlw
ZXJ2aXNvcl94ODYgeDg2X2h5cGVyX3hlbl9odm0gX19pbml0ZGF0YSA9IHsKPiA+IAo+ID4gc3Rh
dGljPwo+IAo+IEl0IGlzIGJlaW5nIHJlZmVyZW5jZWQgZnJvbSBhcmNoL3g4Ni9rZXJuZWwvY3B1
L2h5cGVydmlzb3IuYwoKQnV0IHdhc24ndCBpdCBhbHNvIHJlbW92ZWQgZnJvbSB0aGUgbGlzdCBv
ZiBleHRlcm5zPwoKUmVyZWFkaW5nIHRoZSAuaCBmaWxlLCBubyBpdCB3YXNuJ3QuICBJIG1pc3Nl
ZCB0aGF0LgoKUGVyaGFwcyB0aGUgZXh0ZXJuIGxpc3QgY291bGQgYmUgcmVvcmRlcmVkIHRvIG1v
dmUgdGhpcwp4ODZfaHlwZXJfeGVuX2h2bSB0byBiZSBuZXh0IHRvIHg4Nl9oeXBlcl90eXBlLgoK
SSBhbHNvIHN1Z2dlc3QgdGhhdCAiZXh0ZXJuIGJvb2wgbm9wdiIgbWlnaHQgYmUgYSBiaXQKbm9u
LXNwZWNpZmljIGFuZCBjb3VsZCB1c2UgYSBsb25nZXIgaWRlbnRpZmllci4KCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
