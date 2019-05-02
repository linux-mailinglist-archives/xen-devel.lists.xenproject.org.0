Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E88611B5D
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2019 16:27:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMCe1-0002sX-M7; Thu, 02 May 2019 14:25:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=oUxd=TC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMCe0-0002sS-3M
 for xen-devel@lists.xenproject.org; Thu, 02 May 2019 14:25:04 +0000
X-Inumbo-ID: 0f7682be-6ce6-11e9-a0b1-636481827d5c
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f7682be-6ce6-11e9-a0b1-636481827d5c;
 Thu, 02 May 2019 14:24:57 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 02 May 2019 08:24:56 -0600
Message-Id: <5CCAFDB6020000780022B4F4@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 02 May 2019 08:24:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Paul Durrant" <paul.durrant@citrix.com>
References: <5CCAE2A5020000780022B35E@prv1-mh.provo.novell.com>
 <8300afef-e75e-1d81-83e4-7f020595f81a@citrix.com>
 <5CCAEDAB020000780022B3EC@prv1-mh.provo.novell.com>
 <a99e7a6b-6c45-759b-ee0e-ed9174397de3@citrix.com>
 <5CCAF70E020000780022B4A1@prv1-mh.provo.novell.com>
 <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
In-Reply-To: <941b423b37074521af2e4559fd19c149@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] x86/HVM: p2m_ram_ro is incompatible with
 device pass-through
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 george.dunlap@citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA1LjE5IGF0IDE2OjEyLCA8UGF1bC5EdXJyYW50QGNpdHJpeC5jb20+IHdyb3Rl
Ogo+IEFjdHVhbGx5LCBzaW5jZSBnbG9iYWxfbG9nZGlydHkgaXMgc29tZXdoYXQgdHJhbnNpZW50
IHNob3VsZCB3ZSBub3QgYWxzbyAKPiBoYXZlIGEgY2hlY2sgdG8gcHJldmVudCBwMm1fcmFtX2xv
Z2RpcnR5IGZyb20gYmVpbmcgc2V0IGZvciBhIGRvbWFpbiB3aXRoIAo+IGFzc2lnbmVkIGRldmlj
ZXMgYW5kIHNoYXJlZCBFUFQ/CgpQcm9iYWJseSAoaWYgd2UgaW5kZWVkIGRvbid0KSwgYnV0IGlt
byBub3QgaW4gdGhpcyBwYXRjaC4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
