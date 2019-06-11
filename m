Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C74983C738
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 11:31:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1had4T-0006ka-M5; Tue, 11 Jun 2019 09:28:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SowN=UK=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1had4S-0006kV-1E
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 09:28:00 +0000
X-Inumbo-ID: 30c7d116-8c2b-11e9-951a-dbf7407d43a5
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 30c7d116-8c2b-11e9-951a-dbf7407d43a5;
 Tue, 11 Jun 2019 09:27:54 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00613337;
 Tue, 11 Jun 2019 02:27:54 -0700 (PDT)
Received: from [10.1.39.71] (unknown [10.1.39.71])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B2BF73F73C;
 Tue, 11 Jun 2019 02:27:51 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190516133735.18883-1-volodymyr_babchuk@epam.com>
 <20190516133735.18883-2-volodymyr_babchuk@epam.com>
 <5CF7E6930200007800235A1B@prv1-mh.provo.novell.com>
 <675a4182-74c7-24c6-3a5f-c7359eb6899f@arm.com>
 <1b21850b-29a0-37da-2765-54ce51783a7b@arm.com>
 <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <0fab9902-a644-7aaf-d61c-bad37616b51c@arm.com>
Date: Tue, 11 Jun 2019 10:27:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CFF4DA60200007800236D45@prv1-mh.provo.novell.com>
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

SGkgSmFuLAoKT24gNi8xMS8xOSA3OjQzIEFNLCBKYW4gQmV1bGljaCB3cm90ZToKPj4+PiBPbiAx
MC4wNi4xOSBhdCAyMjowMywgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3cm90ZToKPj4gSGksCj4+
Cj4+IE9uIDYvNS8xOSA1OjAxIFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+ICAgID4gT24gMDUv
MDYvMjAxOSAxNjo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gSnVsaWVuLAo+Pj4+Cj4+Pj4+
Pj4gT24gMTYuMDUuMTkgYXQgMTU6MzcsIDxWb2xvZHlteXJfQmFiY2h1a0BlcGFtLmNvbT4gd3Jv
dGU6Cj4+Pj4+IEFzIGJ1aWxkIHN5c3RlbSBub3cgc3VwcG9ydHMgKl9kZWZjb25maWcgcnVsZXMg
aXQgaXMgZ29vZCB0byBiZSBhYmxlCj4+Pj4+IHRvIGNvbmZpZ3VyZSBtaW5pbWFsIFhFTiBpbWFn
ZSB3aXRoCj4+Pj4+Cj4+Pj4+ICAgIG1ha2UgdGlueTY0X2RlZmNvbmZpZwo+Pj4+Pgo+Pj4+PiBj
b21tYW5kLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBWb2xvZHlteXIgQmFiY2h1ayA8dm9s
b2R5bXlyX2JhYmNodWtAZXBhbS5jb20+Cj4+Pj4KPj4+PiB5b3UgaGFkIG9iamVjdGlvbnMgaGVy
ZSwgYW5kIHRoZSBmaXJzdCBwYXRjaCBtYWtlcyBsaXR0bGUgc2Vuc2UKPj4+PiB3aXRob3V0IHRo
ZSAybmQuIE1heSBJIGFzayB3aGF0IHRoZSB2ZXJkaWN0IGlzLCBpLmUuIHdoZXRoZXIgSSBzaG91
bGQKPj4+PiBkcm9wIHRoZXNlIHR3byBmcm9tIG15IGxpc3Qgb2YgcGVuZGluZyBwYXRjaGVzPwo+
Pj4KPj4+IFZvbG9keW15ciB3YXMgZ29pbmcgdG8gcmVzZW5kIHRoZSBzZXJpZXMgd2l0aCBkb2N1
bWVudGF0aW9uIChhcyBhCj4+PiBzZXBhcmF0ZSBwYXRjaCkuIEJ1dCBJIHdvdWxkIGJlIGhhcHB5
IHRvIHRha2UgIzEgYW5kICMyIGFzc3VtaW5nIHRoYXQKPj4+IGRvY3VtZW50YXRpb24gcGF0Y2gg
aXMgZ29pbmcgdG8gYmUgc2VudC4KPj4+Cj4+PiBZb3UgY2FuIGNvbnNpZGVyIHRoaXMgYXMgYW4g
YWNrZWQ6Cj4+Pgo+Pj4gQWNrZWQtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5j
b20+IGZvciB0aGUgdHdvIHBhdGNoZXMuCj4+Cj4+IEkgd2FzIGFib3V0IHRvIGFwcGx5IHRoZSB0
d28gcGF0Y2hlcywgYnV0IEkgZG9uJ3Qgc2VlbSB0byBiZSBhYmxlIHRvCj4+IGFwcGx5IGl0IGJl
Y2F1c2Ugc29tZSBsaW5lcyBjb250YWlucyA9MjAuIEFGQUlDVCwgaXQgaXMgaW4gcmVwbGFjZW1l
bnQKPj4gb2YgInNwYWNlIiBpbiBjZXJ0YWluIGNhc2UuCj4gCj4gV2VsbCwgaW5kZXBlbmRlbnQg
b2YgYW55IGZvcm1hdHRpbmcgaXNzdWVzIHlvdSBvdWdodCB0byBoYXZlIHRyb3VibGUKPiBhcHBs
eWluZyB0aGVtIHNpbmNlIEkgZGlkIHNvIGFscmVhZHkuCgpIbW0sIEkgbWlzc2VkIHRoYXQuIFNv
cnJ5IGZvciBub2lzZS4KCk91dCBvZiBpbnRlcmVzdCwgaG93IGRpZCB5b3UgbWFuYWdlIHRvIGFw
cGx5IGl0IHdpdGggdGhlID0yMCBpbiB0aGUgcGF0Y2g/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
