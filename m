Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B9C2DC27
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 13:49:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVx2P-00033x-PT; Wed, 29 May 2019 11:46:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9SAg=T5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVx2N-00033s-G5
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 11:46:31 +0000
X-Inumbo-ID: 64c8859c-8207-11e9-9a3e-cffa3b3ef592
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64c8859c-8207-11e9-9a3e-cffa3b3ef592;
 Wed, 29 May 2019 11:46:28 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Wed, 29 May 2019 05:46:27 -0600
Message-Id: <5CEE710F0200007800233646@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Wed, 29 May 2019 05:46:23 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Volodymyr Babchuk" <volodymyr_babchuk@epam.com>
References: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20190529113534.23213-1-volodymyr_babchuk@epam.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH] get_maintainer: Improve patch recognition
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
 Julien Grall <julien.grall@arm.com>, xypron.glpk@gmx.de, joe@perches.com,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI5LjA1LjE5IGF0IDEzOjM1LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+IHdy
b3RlOgo+IEZyb206IEpvZSBQZXJjaGVzIDxqb2VAcGVyY2hlcy5jb20+Cj4gCj4gRnJvbTogSm9l
IFBlcmNoZXMgPGpvZUBwZXJjaGVzLmNvbT4KPiAKPiBUaGVyZSBhcmUgbW9kZSBjaGFuZ2UgYW5k
IHJlbmFtZSBvbmx5IHBhdGNoZXMgdGhhdCBhcmUgdW5yZWNvZ25pemVkCj4gYnkgdGhlIGdldF9t
YWludGFpbmVyLnBsIHNjcmlwdC4KPiAKPiBSZWNvZ25pemUgdGhlbS4KPiAKPiBSZXBvcnRlZC1i
eTogSGVpbnJpY2ggU2NodWNoYXJkdCA8eHlwcm9uLmdscGtAZ214LmRlPgo+IENDOiBKdWxpZW4g
R3JhbGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvZSBQZXJjaGVz
IDxqb2VAcGVyY2hlcy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogVm9sb2R5bXlyIEJhYmNodWsgPHZv
bG9keW15cl9iYWJjaHVrQGVwYW0uY29tPgoKTWVudGlvbmluZyB0aGUgb3JpZ2luYWwgTGludXgg
Y29tbWl0IElEIHdvdWxkIGhhdmUgYmVlbiBuaWNlLgoKSmFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
