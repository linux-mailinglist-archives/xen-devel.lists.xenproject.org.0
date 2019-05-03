Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2091D12988
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 10:08:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMTBr-0003zX-Qw; Fri, 03 May 2019 08:05:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTBp-0003zS-VW
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:05:05 +0000
X-Inumbo-ID: 23108178-6d7a-11e9-b041-4315f199407a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23108178-6d7a-11e9-b041-4315f199407a;
 Fri, 03 May 2019 08:04:56 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 02:04:54 -0600
Message-Id: <5CCBF624020000780022B83A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 02:04:52 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <aisaila@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
 <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
 <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
In-Reply-To: <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDA5OjUzLCA8YWlzYWlsYUBiaXRkZWZlbmRlci5jb20+IHdyb3Rl
Ogo+IE9uIDI1LjA0LjIwMTkgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBJdCBpcyBhbiBp
c3N1ZSBhbnl3YXkgdGhhdCBhIGNoYW5nZSBpcwo+PiBtYWRlIHdpdGhvdXQgc2F5aW5nIHdoeSB0
aGUgbmV3IGJlaGF2aW9yIHByZWZlcmFibGUgb3Zlcgo+PiB0aGUgY3VycmVudCBvbmUuCj4gCj4g
U28gaXMgdGhlcmUgYSB3YXkgdG8gY29udGludWUgd2l0aCB0aGlzPwoKV2h5IG5vdCAtIEkndmUg
bm90IHNhaWQgSSdtIGFnYWluc3QsIEkndmUganVzdCBhc2tlZCBmb3IgYW4gaW1wcm92ZWQKZGVz
Y3JpcHRpb24uIE9mIGNvdXJzZSwgaWYgaXQgdHVybnMgb3V0IHRoZSBjaGFuZ2UgaXMgZG9uZSAi
anVzdCBpbgpjYXNlIiwgSSdtIG5vdCBzdXJlIEkgc2VlIG11Y2ggdmFsdWUuIEJ1dCBhcyB5b3Ug
c2F5LCBpdCdzIGZpcnN0IGFuZApmb3JlbW9zdCBHZW9yZ2UgdG8ganVkZ2UuCgpKYW4KCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
