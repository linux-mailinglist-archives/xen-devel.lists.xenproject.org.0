Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 195B92032F
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 12:08:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRDHZ-0002UO-Mo; Thu, 16 May 2019 10:06:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRDHY-0002UJ-7K
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:06:36 +0000
X-Inumbo-ID: 48becac2-77c2-11e9-9697-1bbaa8d54800
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 48becac2-77c2-11e9-9697-1bbaa8d54800;
 Thu, 16 May 2019 10:06:34 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 04:06:33 -0600
Message-Id: <5CDD3629020000780022F875@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 04:06:33 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <3c245c5b-51c6-1d0e-ad6c-42414573166f@arm.com>
 <85205f11-1d5c-1f6d-e987-c238a025658e@citrix.com>
 <5CDD182B020000780022F768@prv1-mh.provo.novell.com>
 <93260863-5972-6b27-11f5-8147901ab6e9@citrix.com>
In-Reply-To: <93260863-5972-6b27-11f5-8147901ab6e9@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] struct vcpu_guest_core_reg stable ABI?
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
Cc: Ian Jackson <Ian.Jackson@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE2LjA1LjE5IGF0IDExOjE4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gRG8gKmFueSogT1NlcyBhY3R1YWxseSB1c2UgVkNQVU9QX2luaXRpYWxpc2UgZm9yIFBW
SCBndWVzdHM/ICBJIGNhbid0Cj4gdGhpbmsgb2YgYW55IG9mZmhhbmQuCgpJZiBub25lIGRvZXMs
IHdoeSB3b3VsZCBhcmNoX3NldF9pbmZvX2h2bV9ndWVzdCgpIGhhdmUgYmVlbgppbnRyb2R1Y2Vk
LCB0byBjYXJyeSBvdXQgdGhhdCBvcCAodmlhIGFyY2hfaW5pdGlhbGlzZV92Y3B1KCkpPwpYRU5f
RE9NQ1RMX3NldHZjcHVjb250ZXh0IHVzZXMgYXJjaF9zZXRfaW5mb19ndWVzdCgpCnVuaWZvcm1s
eSBhZnRlciBhbGwuIChUaGUgcGF0Y2ggZG9pbmcgdGhpcyBldmVuIGhhcyB5b3VyIFMtby1iLikK
CkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
