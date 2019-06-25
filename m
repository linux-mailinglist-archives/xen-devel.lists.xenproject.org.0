Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 824265539D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2019 17:42:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfnWK-0007NK-68; Tue, 25 Jun 2019 15:38:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xfxB=UY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hfnWI-0007NF-5O
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2019 15:38:06 +0000
X-Inumbo-ID: 37e3c736-975f-11e9-95c0-d3e99c963d61
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37e3c736-975f-11e9-95c0-d3e99c963d61;
 Tue, 25 Jun 2019 15:38:03 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 25 Jun 2019 09:38:02 -0600
Message-Id: <5D123FD2020000780023B08B@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Tue, 25 Jun 2019 09:37:54 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <20190625144350.6176-1-andrew.cooper3@citrix.com>
 <20190625144350.6176-2-andrew.cooper3@citrix.com>
In-Reply-To: <20190625144350.6176-2-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 1/3] page-alloc: Rename the first_node local
 variable
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI1LjA2LjE5IGF0IDE2OjQzLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gZmlyc3Rfbm9kZSBpcyB0aGUgbmFtZSBvZiBhIGxvY2FsIHZhcmlhYmxlLCBhbmQgcGFy
dCBvZiB0aGUgbm9kZW1hc2sgQVBJLiAgVGhlCj4gb25seSByZWFzb24gdGhpcyBjb21waWxlcyBp
cyBiZWNhdXNlIHRoZSBub2RlbWFzayBBUEkgaXMgaW1wbGVtZW50ZWQgYXMgYQo+IG1hY3JvIHJh
dGhlciB0aGFuIGFuIGlubGluZSBmdW5jdGlvbi4KPiAKPiBJdCBpcyBjb25mdXNpbmcgdG8gcmVh
ZCwgYW5kIGJyZWFrcyB3aGVuIHRoZSBub2RlbWFzayBBUEkgaXMgY2xlYW5lZCB1cC4KPiBSZW5h
bWUgdGhlIGxvY2FsIHZhcmlhYmxlIHRvIGp1c3QgJ2ZpcnN0JyB3aGljaCBpcyBzdGlsbCBjbGVh
ciBpbiBjb250ZXh0Lgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpBY2tlZC1ieTog
SmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
