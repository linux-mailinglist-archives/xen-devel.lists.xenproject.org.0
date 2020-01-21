Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A396143C05
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 12:28:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itref-0002vQ-Og; Tue, 21 Jan 2020 11:25:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=PT5E=3K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itree-0002vL-Qc
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 11:25:08 +0000
X-Inumbo-ID: aaf59016-3c40-11ea-ba76-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaf59016-3c40-11ea-ba76-12813bfff9fa;
 Tue, 21 Jan 2020 11:25:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BE10AF5C;
 Tue, 21 Jan 2020 11:25:02 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <5E26738C.1060605@hisilicon.com>
 <f067440e-7df6-b40e-ed98-6b14c5c5f53d@suse.com>
 <6297d097-dc86-fe23-abaa-ca26b6c35a0d@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b5bf0ed-6b28-8c5c-d8e4-2efb992c86e4@suse.com>
Date: Tue, 21 Jan 2020 12:25:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <6297d097-dc86-fe23-abaa-ca26b6c35a0d@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] ns16550: Add ACPI support for ARM only
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
 Ian Jackson <ian.jackson@eu.citrix.com>, Linuxarm <linuxarm@huawei.com>,
 Wei Xu <xuwei5@hisilicon.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMDEuMjAyMCAxMjoxNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDIxLzAxLzIwMjAg
MTE6MTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pgo+Pj4gKyAgICBpZiAoIEFDUElfRkFJTFVSRShz
dGF0dXMpICkKPj4+ICsgICAgewo+Pj4gKyAgICAgICAgcHJpbnRrKCJuczE2NTUwOiBGYWlsZWQg
dG8gZ2V0IFNQQ1IgdGFibGVcbiIpOwo+Pgo+PiBJcyBzdWNoIGEgbWVzc2FnZSB3YXJyYW50ZWQ/
IEkuZS4gd291bGRuJ3QgaXQgdHJpZ2dlciBvbiBhbGwKPj4gc3lzdGVtcyBub3QgaGF2aW5nIHRo
ZSB0YWJsZSwgd2hpY2ggaXMgaGFyZGx5IHdoYXQgeW91L3dlIHdhbnQ/Cj4+Cj4+PiArICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPj4KPj4gQWxzbywgaXMgaXQgcmVhbGx5IGFuIGVycm9yIGlmIHRo
ZXJlJ3Mgbm8gc3VjaCB0YWJsZT8KPiAKPiBZb3UgY2FuIG9ubHkgYmUgdGhlcmUgaWYgdGhlIGFy
bS11YXJ0LmMgZm91bmQgYW4gU1BDUiB0YWJsZS4gU28gdGhpcyBpcyAKPiBhIHNhbml0eSBjaGVj
ay4gVGhlcmVmb3JlIEkgdGhpbmsgdGhlIGVycm9yIG1lc3NhZ2UgaXMgd2FycmFudCBoZXJlLgoK
SWYgc28gLSBmaW5lLiBCdXQgZnJvbQoKQUNQSV9ERVZJQ0VfU1RBUlQoYW5zMTY1NTAsICJOUzE2
NTUwIFVBUlQiLCBERVZJQ0VfU0VSSUFMKQogICAgLmNsYXNzX3R5cGUgPSBBQ1BJX0RCRzJfMTY1
NTBfQ09NUEFUSUJMRSwKICAgIC5pbml0ID0gbnMxNjU1MF9hY3BpX3VhcnRfaW5pdCwKQUNQSV9E
RVZJQ0VfRU5ECgpJIGNhbid0IHNlZSB3aHkgdGhpcyB3b3VsZCBiZS4gV291bGQgeW91IG1pbmQg
ZWR1Y2F0aW5nIG1lPwoKVGhhbmtzLCBKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
