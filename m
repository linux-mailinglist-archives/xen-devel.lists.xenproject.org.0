Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4678E206B7
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 14:12:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRFCR-0006d7-3K; Thu, 16 May 2019 12:09:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YVeS=TQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hRFCO-0006cx-S2
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 12:09:24 +0000
X-Inumbo-ID: 715a105d-77d3-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 715a105d-77d3-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 12:09:23 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 16 May 2019 06:09:22 -0600
Message-Id: <5CDD52F1020000780022FA14@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Thu, 16 May 2019 06:09:21 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: <andrii.anisov@gmail.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDIzLjA0LjE5IGF0IDEwOjEwLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3Rl
Ogo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgKPiBAQCAtMTYzLDE1ICsxNjMsMjMgQEAgc3RydWN0IHZjcHUKPiAgICAgIHZvaWQg
ICAgICAgICAgICAqc2NoZWRfcHJpdjsgICAgLyogc2NoZWR1bGVyLXNwZWNpZmljIGRhdGEgKi8K
PiAgCj4gICAgICBzdHJ1Y3QgdmNwdV9ydW5zdGF0ZV9pbmZvIHJ1bnN0YXRlOwo+ICsKPiArICAg
IHNwaW5sb2NrX3QgICAgICBtYXBwZWRfcnVuc3RhdGVfbG9jazsKCkJlc2lkZXMgb3RoZXIgY29t
bWVudHMgZ2l2ZW4gZWxzZXdoZXJlIGFscmVhZHkgLSBkb2VzIHRoaXMKcmVhbGx5IG5lZWQgdG8g
YmUgYSBwZXItdkNQVSBsb2NrPyBHdWVzdHMgYXJlbid0IGV4cGVjdGVkIHRvCmludm9rZSB0aGUg
QVBJIGZyZXF1ZW50bHksIHNvIHF1aXRlIGxpa2VseSBhIHBlci1kb21haW4gbG9jawp3b3VsZCBz
dWZmaWNlLiBRdWl0ZSBwb3NzaWJseSBkb21haW5feyx1bn1sb2NrKCkgY291bGQKYWN0dWFsbHkg
YmUgKHJlLSl1c2VkLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
