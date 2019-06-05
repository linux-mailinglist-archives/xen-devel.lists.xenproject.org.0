Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC43360C3
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jun 2019 18:04:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hYYMM-0000e1-8t; Wed, 05 Jun 2019 16:01:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=af5Q=UE=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hYYMJ-0000dw-TG
 for xen-devel@lists.xenproject.org; Wed, 05 Jun 2019 16:01:51 +0000
X-Inumbo-ID: 3ab60e92-87ab-11e9-bf4b-972e98621446
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3ab60e92-87ab-11e9-bf4b-972e98621446;
 Wed, 05 Jun 2019 16:01:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B4E1374;
 Wed,  5 Jun 2019 09:01:50 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957D73F246;
 Wed,  5 Jun 2019 09:01:48 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
Date: Wed, 5 Jun 2019 17:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] arm: rename tiny64.conf to
 tiny64_defconfig
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
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMDUvMDYvMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gSnVsaWVu
LAo+IAo+Pj4+IE9uIDE2LjA1LjE5IGF0IDE1OjM3LCA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5j
b20+IHdyb3RlOgo+PiBBcyBidWlsZCBzeXN0ZW0gbm93IHN1cHBvcnRzICpfZGVmY29uZmlnIHJ1
bGVzIGl0IGlzIGdvb2QgdG8gYmUgYWJsZQo+PiB0byBjb25maWd1cmUgbWluaW1hbCBYRU4gaW1h
Z2Ugd2l0aAo+Pgo+PiAgIG1ha2UgdGlueTY0X2RlZmNvbmZpZwo+Pgo+PiBjb21tYW5kLgo+Pgo+
PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9sb2R5bXlyX2JhYmNodWtAZXBh
bS5jb20+Cj4gCj4geW91IGhhZCBvYmplY3Rpb25zIGhlcmUsIGFuZCB0aGUgZmlyc3QgcGF0Y2gg
bWFrZXMgbGl0dGxlIHNlbnNlCj4gd2l0aG91dCB0aGUgMm5kLiBNYXkgSSBhc2sgd2hhdCB0aGUg
dmVyZGljdCBpcywgaS5lLiB3aGV0aGVyIEkgc2hvdWxkCj4gZHJvcCB0aGVzZSB0d28gZnJvbSBt
eSBsaXN0IG9mIHBlbmRpbmcgcGF0Y2hlcz8KClZvbG9keW15ciB3YXMgZ29pbmcgdG8gcmVzZW5k
IHRoZSBzZXJpZXMgd2l0aCBkb2N1bWVudGF0aW9uIChhcyBhIHNlcGFyYXRlIApwYXRjaCkuIEJ1
dCBJIHdvdWxkIGJlIGhhcHB5IHRvIHRha2UgIzEgYW5kICMyIGFzc3VtaW5nIHRoYXQgZG9jdW1l
bnRhdGlvbiBwYXRjaCAKaXMgZ29pbmcgdG8gYmUgc2VudC4KCllvdSBjYW4gY29uc2lkZXIgdGhp
cyBhcyBhbiBhY2tlZDoKCkFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFsbEBhcm0u
Y29tPiBmb3IgdGhlIHR3byBwYXRjaGVzLgoKCkNoZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
