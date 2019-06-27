Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A130757C56
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 08:42:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgO43-00037a-Le; Thu, 27 Jun 2019 06:39:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LRcK=U2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hgO41-00037Q-Q3
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 06:39:21 +0000
X-Inumbo-ID: 4ac6ce77-98a6-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4ac6ce77-98a6-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 06:39:20 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 27 Jun 2019 00:39:19 -0600
Message-Id: <5D146495020000780023B6A8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 27 Jun 2019 00:39:17 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190626173615.12419-1-andrew.cooper3@citrix.com>
In-Reply-To: <20190626173615.12419-1-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] xen/Kconfig: Fix -Wformat-security when
 compiling with Clang
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

Pj4+IE9uIDI2LjA2LjE5IGF0IDE5OjM2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQ2xhbmcgb2JzZXJ2ZXM6Cj4gCj4gdG9vbHMva2NvbmZpZy9jb25mLmM6Nzc6MTA6Cj4g
d2FybmluZzogZm9ybWF0IHN0cmluZyBpcyBub3QgYSBzdHJpbmcgbGl0ZXJhbCAocG90ZW50aWFs
bHkgaW5zZWN1cmUpCj4gICAgICAgWy1XZm9ybWF0LXNlY3VyaXR5XQo+ICAgICAgICAgICAgICAg
ICBwcmludGYoXygiYWJvcnRlZCFcblxuIikpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+fn4KPiAKPiBBbmQgaXQgaXMgYWJzb2x1dGVseSBjb3JyZWN0LiAgZ2V0dGV4
dCgpIGNhbiBlYXNpbHkgcmV0dXJuIGEgc3RyaW5nIHdpdGggYSAlCj4gaW4uCgpJJ20gcHJldHR5
IGN1cmlvdXM6IFdoZXJlIHdvdWxkIGEgJSBjb21lIGZyb20gd2hlbiB0aGVyZSdzIG5vbmUKaW4g
dGhlIG9yaWdpbmFsIEVuZ2xpc2ggc3RyaW5nPyBJIHdvdWxkbid0IGNhbGwgaXQgInByb3BlciB0
cmFuc2xhdGlvbiIgaWYKYSB0cmFuc2xhdGVkIHN0cmluZyBoYWQgbm9uLXRleHR1YWwgdGhpbmdz
IGluIGl0IHRoYXQgdGhlIG9yaWdpbmFsIGRpZG4ndApoYXZlLiBPciBhcmUgdGhlcmUgbGFuZ3Vh
Z2VzIHVzaW5nICUgaW4gb3JkaW5hcnkgd29yZHM/CgpOb3RlIHRoYXQgdGhpcyBpcyBpbiBubyB3
YXkgYW4gb2JqZWN0aW9uIHRvIHRoZSBjaGFuZ2UsIHRoZSBtb3JlCnRoYXQgaXQncyBhIHJlZHVj
dGlvbiBvZiBzb3VyY2Ugc2l6ZS4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
