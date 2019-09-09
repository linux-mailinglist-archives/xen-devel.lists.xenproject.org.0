Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1891AD685
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 12:14:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7GdZ-0002IR-Up; Mon, 09 Sep 2019 10:11:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fSZh=XE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7GdY-0002IM-Hh
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 10:11:08 +0000
X-Inumbo-ID: 234a7a38-d2ea-11e9-ac09-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 234a7a38-d2ea-11e9-ac09-12813bfff9fa;
 Mon, 09 Sep 2019 10:11:06 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 892641000;
 Mon,  9 Sep 2019 03:11:06 -0700 (PDT)
Received: from [10.37.9.253] (unknown [10.37.9.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE3653F71F;
 Mon,  9 Sep 2019 03:11:01 -0700 (PDT)
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20190906143021.28261-1-roger.pau@citrix.com>
 <20190906143021.28261-3-roger.pau@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <252a50d7-5561-b6ae-dc64-477842a32a27@arm.com>
Date: Mon, 9 Sep 2019 11:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906143021.28261-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 2/2] sysctl/libxl: choose a sane default
 for HAP
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA5LzYvMTkgMzozMCBQTSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IEN1cnJlbnQg
bGlieGwgY29kZSB3aWxsIGFsd2F5cyBlbmFibGUgSGFyZHdhcmUgQXNzaXN0ZWQgUGFnaW5nIChI
QVApLAo+IGV4cGVjdGluZyB0aGF0IHRoZSBoeXBlcnZpc29yIHdpbGwgZmFsbGJhY2sgdG8gc2hh
ZG93IGlmIEhBUCBpcyBub3QKPiBhdmFpbGFibGUuIFdpdGggdGhlIGNoYW5nZXMgdG8gdGhlIGRv
bWFpbiBidWlsZGVyIHRoYXQncyBub3QgdGhlIGNhc2UKPiBhbnkgbG9uZ2VyLCBhbmQgdGhlIGh5
cGVydmlzb3Igd2lsbCByYWlzZSBhbiBlcnJvciBpZiBIQVAgaXMgbm90Cj4gYXZhaWxhYmxlIGlu
c3RlYWQgb2Ygc2lsZW50bHkgZmFsbGluZyBiYWNrIHRvIHNoYWRvdy4KPiAKPiBJbiBvcmRlciB0
byBrZWVwIHRoZSBwcmV2aW91cyBmdW5jdGlvbmFsaXR5IHJlcG9ydCB3aGV0aGVyIEhBUCBpcwo+
IGF2YWlsYWJsZSBvciBub3QgaW4gWEVOX1NZU0NUTF9waHlzaW5mbywgc28gdGhhdCB0aGUgdG9v
bHN0YWNrIGNhbgo+IHNlbGVjdCBhIHNhbmUgZGVmYXVsdCBpZiB0aGVyZSdzIG5vIGV4cGxpY2l0
IHVzZXIgc2VsZWN0aW9uIG9mIHdoZXRoZXIKPiBIQVAgc2hvdWxkIGJlIHVzZWQuCj4gCj4gTm90
ZSB0aGF0IG9uIEFSTSBoYXJkd2FyZSBIQVAgY2FwYWJpbGl0eSBpcyBhbHdheXMgcmVwb3J0ZWQg
c2luY2UgaXQncwoKTklUOiBzL0FSTS9Bcm0vCgo+IGEgcmVxdWlyZWQgZmVhdHVyZSBpbiBvcmRl
ciB0byBydW4gWGVuLgo+IAo+IEZpeGVzOiBkMGMwYmE3ZDNkZSAoJ3g4Ni9odm0vZG9tYWluOiBy
ZW1vdmUgdGhlICdoYXBfZW5hYmxlZCcgZmxhZycpCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFu
dCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1
bGljaEBzdXNlLmNvbT4KCkZvciB0aGUgQXJtIGJpdHM6CgpBY2tlZC1ieTogSnVsaWVuIEdyYWxs
IDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
