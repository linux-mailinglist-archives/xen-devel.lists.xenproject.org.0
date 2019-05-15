Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7147D1E8F7
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 09:27:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQoHL-00067C-Tp; Wed, 15 May 2019 07:24:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LpR9=TP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hQoHK-000677-TX
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 07:24:42 +0000
X-Inumbo-ID: 7fd885a6-76e2-11e9-9392-93490b43f1f4
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7fd885a6-76e2-11e9-9392-93490b43f1f4;
 Wed, 15 May 2019 07:24:39 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 15 May 2019 01:24:38 -0600
Message-Id: <5CDBBEB5020000780022F176@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Wed, 15 May 2019 01:24:37 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190514184552.25100-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v1 1/2] makefile: add support for
 *_defconfig targets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDE0LjA1LjE5IGF0IDIwOjQ1LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+IC0tLSBhL3hlbi9NYWtlZmlsZQo+ICsrKyBiL3hlbi9NYWtlZmlsZQo+IEBAIC0yNjks
NiArMjY5LDkgQEAga2NvbmZpZyA6PSBzaWxlbnRvbGRjb25maWcgb2xkY29uZmlnIGNvbmZpZyBt
ZW51Y29uZmlnIGRlZmNvbmZpZyBcCj4gICQoa2NvbmZpZyk6Cj4gIAkkKE1BS0UpIC1mICQoQkFT
RURJUikvdG9vbHMva2NvbmZpZy9NYWtlZmlsZS5rY29uZmlnIEFSQ0g9JChBUkNIKSBTUkNBUkNI
PSQoU1JDQVJDSCkgSE9TVENDPSIkKEhPU1RDQykiIEhPU1RDWFg9IiQoSE9TVENYWCkiICRACgpT
byB0aGUgcnVsZSB5b3UgYWRkIG1hdGNoZXMgdGhpcyBvbmUuIElzIHRoZXJlIGEgcmVhc29uIC4u
LgoKPiArJV9kZWZjb25maWc6CgouLi4gd2h5IHlvdSBjYW4ndCBzaW1wbHkgYWRkIHRoaXMgdG8g
dGhlIGtjb25maWcgdmFyaWFibGUgc2V0IGEgZmV3CmxpbmVzIHVwPyBPaCAtIG5ld2VyIG1ha2Ug
ZG9lc24ndCBsaWtlIG1peGluZyBwYXR0ZXJuIGFuZApub24tcGF0dGVybiBydWxlcy4gUGVyaGFw
cyB3b3J0aCBhIGJyaWVmIGNvbW1lbnQsIHRvIGp1c3RpZnkgdGhlCnJlZHVuZGFuY3k/IE9yIGFs
dGVybmF0aXZlbHksIGhvdyBhYm91dCB1c2luZyAkKHdpbGRjYXJkICkKaW5zdGVhZCBvZiBhIHBh
dHRlcm4gcnVsZSwgdGh1cyByZWplY3RpbmcgaW52YWxpZCB0YXJnZXRzIHJpZ2h0IGF3YXksCnJh
dGhlciB0aGFuIGRlZmVycmluZyB0byB0aGUgcmVjdXJzaXZlIG1ha2UgdG8gbm90aWNlIHRoZSBl
cnJvcj8KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
