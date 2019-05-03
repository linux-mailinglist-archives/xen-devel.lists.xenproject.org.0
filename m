Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7C129A6
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 10:15:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMTJO-000569-9c; Fri, 03 May 2019 08:12:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=So9x=TD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hMTJM-000563-Mr
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 08:12:52 +0000
X-Inumbo-ID: 3b80dfd6-6d7b-11e9-a511-f31824b2dc50
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b80dfd6-6d7b-11e9-a511-f31824b2dc50;
 Fri, 03 May 2019 08:12:46 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Fri, 03 May 2019 02:12:45 -0600
Message-Id: <5CCBF7FE020000780022B859@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Fri, 03 May 2019 02:12:46 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Tamas K Lengyel" <tamas@tklengyel.com>
References: <20190502221345.18459-1-tamas@tklengyel.com>
In-Reply-To: <20190502221345.18459-1-tamas@tklengyel.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH v4 1/4] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAzLjA1LjE5IGF0IDAwOjEzLCA8dGFtYXNAdGtsZW5neWVsLmNvbT4gd3JvdGU6Cj4g
QEAgLTEwMDIsNyArOTg5LDEwIEBAIHN0YXRpYyBpbnQgc2hhcmVfcGFnZXMoc3RydWN0IGRvbWFp
biAqc2QsIGdmbl90IHNnZm4sIHNocl9oYW5kbGVfdCBzaCwKPiAgICAgIC8qIEZyZWUgdGhlIGNs
aWVudCBwYWdlICovCj4gICAgICBpZih0ZXN0X2FuZF9jbGVhcl9iaXQoX1BHQ19hbGxvY2F0ZWQs
ICZjcGFnZS0+Y291bnRfaW5mbykpCj4gICAgICAgICAgcHV0X3BhZ2UoY3BhZ2UpOwo+IC0gICAg
cHV0X3BhZ2UoY3BhZ2UpOwo+ICsKPiArICAgIEJVR19PTighcHV0X2NvdW50KTsKPiArICAgIHdo
aWxlICggcHV0X2NvdW50LS0gKQo+ICsgICAgICAgIHB1dF9wYWdlX2FuZF90eXBlKGNwYWdlKTsK
ClN0cmljdGx5IHNwZWFraW5nIEkgdGhpbmsgdGhlIEJVR19PTigpIHNob3VsZCBiZSBtb3ZlZCBh
aGVhZCBvZiB0aGUKaWYoKSBpbiBjb250ZXh0LCBzbyB0aGF0IGEgcHJvYmxlbWF0aWMgcHV0X3Bh
Z2UoKSB3b3VsZCBub3QgZ2V0CmV4ZWN1dGVkIGluIHRoZSBmaXJzdCBwbGFjZSAoZXZlbiBpZiB0
aGUgc3lzdGVtIGlzIHRvIGRpZSBzb29uIGFmdGVyKS4KCkphbgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
