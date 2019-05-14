Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B915C1C7E1
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 13:37:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQViW-0002Mu-7Z; Tue, 14 May 2019 11:35:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQViV-0002Mp-1x
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 11:35:31 +0000
X-Inumbo-ID: 5f98de72-763c-11e9-ae6c-1708b9809f3a
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f98de72-763c-11e9-ae6c-1708b9809f3a;
 Tue, 14 May 2019 11:35:29 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 14 May 2019 05:35:27 -0600
Message-Id: <5CDAA7FD020000780022E8F1@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 14 May 2019 05:35:25 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Wei Liu" <wei.liu2@citrix.com>
References: <20190514103030.8393-1-wei.liu2@citrix.com>
 <20190514103030.8393-2-wei.liu2@citrix.com>
In-Reply-To: <20190514103030.8393-2-wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/2] tools: remove blktap2 related code and
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDEyOjMwLCA8d2VpLmxpdTJAY2l0cml4LmNvbT4gd3JvdGU6Cj4g
QmxrdGFwMiBpcyBlZmZlY3RpdmVseSBkZWFkIGZvciBhIGZldyB5ZWFycy4KPiAKPiBOb3RhYmxl
IGNoYW5nZXMgaW4gdGhpcyBwYXRjaDoKPiAKPiAwLiBVbmhvb2sgYmxrdGFwMiBmcm9tIGJ1aWxk
IHN5c3RlbQo+IDEuIGxpYnhsIG5vIGxvbmdlciBzdXBwb3J0cyBUQVAgZGlzayBiYWNrZW5kLCB3
aXRoIGFwcHJvcHJpYXRlIGFzc2VydGlvbnMKPiAgICBhZGRlZCBhbmQgc29tZSBjb2RlIHBhdGhz
IG5vdyByZXR1cm4gRVJST1JfRkFJTAoKQW5kIGFsc28gYXBwcm9wcmlhdGUgZXJyb3IgbWVzc2Fn
ZXMsIGFsbG93aW5nIHBlb3BsZSB0byBrbm93CndoYXQgbmVlZHMgY2hhbmdpbmcgd2l0aG91dCBm
aXJzdCBkaWdnaW5nIHRocm91Z2ggdGhlIHNvdXJjZXM/CgpKYW4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
