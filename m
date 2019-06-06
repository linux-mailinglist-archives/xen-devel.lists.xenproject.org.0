Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A309537456
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:37:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrbY-0005Qp-IH; Thu, 06 Jun 2019 12:34:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYrbX-0005Qi-89
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:34:51 +0000
X-Inumbo-ID: 79bd552c-8857-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 79bd552c-8857-11e9-8980-bc764e045a96;
 Thu, 06 Jun 2019 12:34:50 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 06:34:49 -0600
Message-Id: <5CF908670200007800235F1A@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 06:34:47 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-2-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-2-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 01/12] pci: introduce a devfn field to
 pci_sbdf_t
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
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

Pj4+IE9uIDA2LjA2LjE5IGF0IDExOjAxLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2ku
aAo+IEBAIC00OSw3ICs0OSwxMCBAQCB0eXBlZGVmIHVuaW9uIHsKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgdWludDhfdCBmdW5jIDogMywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBkZXYgIDogNTsKPiAgICAgICAgICAgICAgICAgICAgICB9Owo+IC0gICAgICAgICAgICAg
ICAgICAgIHVpbnQ4X3QgICAgIGV4dGZ1bmM7Cj4gKyAgICAgICAgICAgICAgICAgICAgdW5pb24g
ewo+ICsgICAgICAgICAgICAgICAgICAgICAgICB1aW50OF90IGV4dGZ1bmMsCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2Zm47CgpXb3VsZCBtaW5kIGFsc28gc3dpdGNoaW5n
IHRoZXNlIHR3byBhcm91bmQsIHNlZWluZyB0aGF0ICJkZXZmbiIgaXMKdGhlIGZhciBtb3JlIG9m
dGVuIHVzZWQvbmVlZGVkL3dhbnRlZCBuYW1lIG9mIHRoZSBmaWVsZD8KCkphbgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
