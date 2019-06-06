Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB83745D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jun 2019 14:39:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYrds-0005cg-1p; Thu, 06 Jun 2019 12:37:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=p1/W=UF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hYrdq-0005cZ-Ff
 for xen-devel@lists.xenproject.org; Thu, 06 Jun 2019 12:37:14 +0000
X-Inumbo-ID: cdc6a9ce-8857-11e9-ac90-ef3a2a25949b
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cdc6a9ce-8857-11e9-ac90-ef3a2a25949b;
 Thu, 06 Jun 2019 12:37:11 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Thu, 06 Jun 2019 06:37:10 -0600
Message-Id: <5CF908F00200007800235F1D@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Thu, 06 Jun 2019 06:37:04 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Roger Pau Monne" <roger.pau@citrix.com>
References: <20190606090146.77381-1-roger.pau@citrix.com>
 <20190606090146.77381-3-roger.pau@citrix.com>
In-Reply-To: <20190606090146.77381-3-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v2 02/12] pci: introduce a pci_sbdf_t field
 to pci_dev
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
IEFuZCB1c2UgYW4gdW5pb24gd2l0aCB0aGUgY3VycmVudCBzZWcsIGJ1cyBhbmQgZGV2Zm4gZmll
bGRzIHRvIG1ha2UKPiBmaWVsZHMgcG9pbnQgdG8gdGhlIHNhbWUgdW5kZXJseWluZyBkYXRhLgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFN1Z2dlc3RlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4Kd2l0aCBvbmUgcXVlc3Rpb246Cgo+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+
ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9wY2kuaAo+IEBAIC04Myw5ICs4MywxNSBAQCBzdHJ1Y3Qg
cGNpX2RldiB7Cj4gICAgICBzdHJ1Y3QgYXJjaF9tc2l4ICptc2l4Owo+ICAKPiAgICAgIHN0cnVj
dCBkb21haW4gKmRvbWFpbjsKPiAtICAgIGNvbnN0IHUxNiBzZWc7Cj4gLSAgICBjb25zdCB1OCBi
dXM7Cj4gLSAgICBjb25zdCB1OCBkZXZmbjsKPiArCj4gKyAgICB1bmlvbiB7Cj4gKyAgICAgICAg
c3RydWN0IHsKPiArICAgICAgICAgICAgY29uc3QgdWludDhfdCBkZXZmbjsKPiArICAgICAgICAg
ICAgY29uc3QgdWludDhfdCBidXM7Cj4gKyAgICAgICAgICAgIGNvbnN0IHVpbnQxNl90IHNlZzsK
PiArICAgICAgICB9Owo+ICsgICAgICAgIGNvbnN0IHBjaV9zYmRmX3Qgc2JkZjsKPiArICAgIH07
CgpEb2Vzbid0IHN0aWNraW5nIGEgc2luZ2xlICJjb25zdCIgYXQgdGhlIHVuaW9uIGhhdmUgdGhl
IHNhbWUgZWZmZWN0PwoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
