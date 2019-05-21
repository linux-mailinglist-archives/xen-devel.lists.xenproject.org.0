Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C172530F
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 16:54:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT66r-0002hY-Rr; Tue, 21 May 2019 14:51:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7C/d=TV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hT66q-0002hR-4o
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:51:20 +0000
X-Inumbo-ID: e3a4b7f4-7bd7-11e9-88e2-e7c0b14a08fe
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3a4b7f4-7bd7-11e9-88e2-e7c0b14a08fe;
 Tue, 21 May 2019 14:51:18 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 21 May 2019 08:51:17 -0600
Message-Id: <5CE41060020000780023106B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 21 May 2019 08:51:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "osstest service owner" <osstest-admin@xenproject.org>
References: <osstest-136552-mainreport@xen.org>
In-Reply-To: <osstest-136552-mainreport@xen.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [xen-4.10-testing test] 136552: regressions - FAIL
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIxLjA1LjE5IGF0IDE1OjU2LCA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz4g
d3JvdGU6Cj4gZmxpZ2h0IDEzNjU1MiB4ZW4tNC4xMC10ZXN0aW5nIHJlYWwgW3JlYWxdCj4gaHR0
cDovL2xvZ3MudGVzdC1sYWIueGVucHJvamVjdC5vcmcvb3NzdGVzdC9sb2dzLzEzNjU1Mi8gCj4g
Cj4gUmVncmVzc2lvbnMgOi0oCj4gCj4gVGVzdHMgd2hpY2ggZGlkIG5vdCBzdWNjZWVkIGFuZCBh
cmUgYmxvY2tpbmcsCj4gaW5jbHVkaW5nIHRlc3RzIHdoaWNoIGNvdWxkIG5vdCBiZSBydW46Cj4g
IHRlc3QtYW1kNjQtYW1kNjQteGwtcHZodjItaW50ZWwgMjMgbGVhay1jaGVjay9jaGVjayAgICAg
IGZhaWwgUkVHUi4gdnMuIDEzNTgxMwo+ICB0ZXN0LWFtZDY0LWkzODYtcWVtdXQtcmhlbDZodm0t
aW50ZWwgMTUgbGVhay1jaGVjay9jaGVjayBmYWlsIFJFR1IuIHZzLiAxMzU4MTMKPiAgdGVzdC1h
bWQ2NC1hbWQ2NC1saWJ2aXJ0LXFlbXV1LWRlYmlhbmh2bS1hbWQ2NC14c20gMTkgbGVhay1jaGVj
ay9jaGVjayBmYWlsIFJFR1IuIHZzLiAxMzU4MTMKPiAgdGVzdC1hcm1oZi1hcm1oZi14bC1jcmVk
aXQyICAxOSBsZWFrLWNoZWNrL2NoZWNrICAgICAgICAgZmFpbCBSRUdSLiB2cy4gMTM1ODEzCgpJ
cyB0aGlzIGEgYmFzaXMgZm9yIGEgZm9yY2UgcHVzaCBhZ2Fpbj8KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
