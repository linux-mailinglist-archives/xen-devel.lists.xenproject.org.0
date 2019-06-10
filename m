Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D613BD50
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 22:06:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haQWU-0003XK-EG; Mon, 10 Jun 2019 20:04:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j7+2=UJ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1haQWT-0003XF-8R
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 20:04:05 +0000
X-Inumbo-ID: e5497fe3-8bba-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id e5497fe3-8bba-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 20:04:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD05F344;
 Mon, 10 Jun 2019 13:04:03 -0700 (PDT)
Received: from [10.37.10.2] (unknown [10.37.10.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C2E1B3F73C;
 Mon, 10 Jun 2019 13:04:01 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: Jan Beulich <JBeulich@suse.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
Message-ID: <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
Date: Mon, 10 Jun 2019 21:03:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
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

SGksCgpPbiA2LzUvMTkgNTowMSBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgogID4gT24gMDUvMDYv
MjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IEp1bGllbiwKPj4KPj4+Pj4gT24gMTYu
MDUuMTkgYXQgMTU6MzcsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6Cj4+PiBB
cyBidWlsZCBzeXN0ZW0gbm93IHN1cHBvcnRzICpfZGVmY29uZmlnIHJ1bGVzIGl0IGlzIGdvb2Qg
dG8gYmUgYWJsZQo+Pj4gdG8gY29uZmlndXJlIG1pbmltYWwgWEVOIGltYWdlIHdpdGgKPj4+Cj4+
PiDCoCBtYWtlIHRpbnk2NF9kZWZjb25maWcKPj4+Cj4+PiBjb21tYW5kLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4K
Pj4KPj4geW91IGhhZCBvYmplY3Rpb25zIGhlcmUsIGFuZCB0aGUgZmlyc3QgcGF0Y2ggbWFrZXMg
bGl0dGxlIHNlbnNlCj4+IHdpdGhvdXQgdGhlIDJuZC4gTWF5IEkgYXNrIHdoYXQgdGhlIHZlcmRp
Y3QgaXMsIGkuZS4gd2hldGhlciBJIHNob3VsZAo+PiBkcm9wIHRoZXNlIHR3byBmcm9tIG15IGxp
c3Qgb2YgcGVuZGluZyBwYXRjaGVzPwo+IAo+IFZvbG9keW15ciB3YXMgZ29pbmcgdG8gcmVzZW5k
IHRoZSBzZXJpZXMgd2l0aCBkb2N1bWVudGF0aW9uIChhcyBhIAo+IHNlcGFyYXRlIHBhdGNoKS4g
QnV0IEkgd291bGQgYmUgaGFwcHkgdG8gdGFrZSAjMSBhbmQgIzIgYXNzdW1pbmcgdGhhdCAKPiBk
b2N1bWVudGF0aW9uIHBhdGNoIGlzIGdvaW5nIHRvIGJlIHNlbnQuCj4gCj4gWW91IGNhbiBjb25z
aWRlciB0aGlzIGFzIGFuIGFja2VkOgo+IAo+IEFja2VkLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGll
bi5ncmFsbEBhcm0uY29tPiBmb3IgdGhlIHR3byBwYXRjaGVzLgoKSSB3YXMgYWJvdXQgdG8gYXBw
bHkgdGhlIHR3byBwYXRjaGVzLCBidXQgSSBkb24ndCBzZWVtIHRvIGJlIGFibGUgdG8gCmFwcGx5
IGl0IGJlY2F1c2Ugc29tZSBsaW5lcyBjb250YWlucyA9MjAuIEFGQUlDVCwgaXQgaXMgaW4gcmVw
bGFjZW1lbnQgCm9mICJzcGFjZSIgaW4gY2VydGFpbiBjYXNlLgoKVGhpcyBpcyBzaW1pbGFyIHRv
IHRoZSBPUC1URUUgc2VyaWVzLiBWb2xvZHlteXIsIGNhbiB5b3Ugc29ydCBvdXQgeW91ciAKZS1t
YWlsIGNvbmZpZ3VyYXRpb24/IEFuZHJpaSBzZWVtcyB0byBzZW5kIHBhdGNoZXMgZnJvbSBhIGdt
YWlsLCBub3QgCnN1cmUgaWYgaXQgaXMgYmVjYXVzZSBvZiBzb21lIGlzc3VlcyB3aXRoIGhpcyBF
UEFNIGUtbWFpbCBhZGRyZXNzLi4uIFlvdSAKbWF5IHdhbnQgdG8gdGFsayB3aXRoIGhpbS4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
