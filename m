Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31764167E0
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 18:28:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2vQ-0008WJ-Os; Tue, 07 May 2019 16:26:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hO2vP-0008WE-Dt
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:26:39 +0000
X-Inumbo-ID: e3203ce6-70e4-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e3203ce6-70e4-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:26:38 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 10:26:37 -0600
Message-Id: <5CD1B1B9020000780022C9E0@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 10:26:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <george.dunlap@citrix.com>
References: <5B97BEB202000078001E73FB@prv1-mh.provo.novell.com>
 <e2c8634a-16cf-7b03-9818-e2e131625c5f@citrix.com>
 <5BC0AD5E02000078001F10AE@prv1-mh.provo.novell.com>
 <91207b4d-bb5b-b66d-c640-9f6a98ddb35e@citrix.com>
 <87c83237-0ac6-87bb-54d2-c6965dd75270@citrix.com>
In-Reply-To: <87c83237-0ac6-87bb-54d2-c6965dd75270@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 0/4] x86/HVM: implement memory read
 caching
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE4OjIyLCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPiB3cm90
ZToKPiBCVFcgSSdtIG5vdyBkZWxldGluZyB0aGlzIGZyb20gbXkgaW5ib3ggdG8gYXZvaWQgY2x1
dHRlci4gIEphbiwgYXQgc3VjaAo+IHRpbWUgYXMgeW91IHdhbnQgbWUgdG8gcmV2aWV3IGl0LCBw
bGVhc2UgcGluZyBvciByZS1zZW5kLgoKVGhhdCdzIGZpbmUgLSB0aGlzIGlzIG1lYW50IHRvIGJl
IHJlLXdvcmtlZC4gSnVzdCBkaWRuJ3QgZ2V0IHRvIGl0IHlldC4KCkphbgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
