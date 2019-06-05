Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A2D35B39
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 13:24:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYTyn-0003Hq-OX; Wed, 05 Jun 2019 11:21:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=73hT=UE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYTym-0003Hl-8z
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 11:21:16 +0000
X-Inumbo-ID: 073a96ba-8784-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 073a96ba-8784-11e9-8980-bc764e045a96;
 Wed, 05 Jun 2019 11:21:14 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 05 Jun 2019 05:21:13 -0600
Message-Id: <5CF7A5A802000078002357E8@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 05 Jun 2019 05:21:12 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Ian Jackson" <Ian.Jackson@eu.citrix.com>
References: <E3AA6DAA6DCE974798849C41CE0968F8@citrix.com>
 <20190605111356.10429-2-ian.jackson@eu.citrix.com>
In-Reply-To: <20190605111356.10429-2-ian.jackson@eu.citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [OSSTEST PATCH 2/2] RFC: enable CONFIG_LIVEPATCH in
 all relevant arm64 builds
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA1LjA2LjE5IGF0IDEzOjEzLCA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEvbWZpLWNvbW1vbgo+ICsrKyBiL21maS1jb21tb24KPiBAQCAtMzczLDcgKzM3
Myw4IEBAIGNyZWF0ZV9idWlsZF9qb2JzICgpIHsKPiAgICAgICAgICBmaQo+ICAgICAgZmkKPiAg
Cj4gLSAgICBpZiBicmFuY2hfd2FudHNfbGl2ZXBhdGNoOyB0aGVuCj4gKyAgICBpZiBicmFuY2hf
d2FudHNfbGl2ZXBhdGNoIHx8Cj4gKyAgICAgICAgICBbICRhcmNoID0gYXJtNjQgLWEgIiR4ZW5i
cmFuY2giID0geGVuLTQuMTEtdGVzdGluZyBdOyB0aGVuCj4gICAgICAgICBsaXZlcGF0Y2hfcnVu
dmFycz0nZW5hYmxlX2xpdmVwYXRjaD10cnVlJwo+ICAgICAgZmkKCklzbid0IHRoaXMgb3Zlcmx5
IHJlc3RyaWN0aXZlLCBpLmUuIHdvdWxkbid0IHRoaXMgYmV0dGVyIGJlIGRvbmUgdW5pZm9ybWx5
CmZvciBhbGwgYnJhbmNoZXM/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
