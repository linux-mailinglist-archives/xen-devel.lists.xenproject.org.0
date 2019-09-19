Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8523B765E
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 11:33:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAslb-0001Nn-Qj; Thu, 19 Sep 2019 09:30:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Ts4K=XO=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAslZ-0001NY-OU
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 09:30:21 +0000
X-Inumbo-ID: 18d54e2e-dac0-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 18d54e2e-dac0-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 09:30:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F030337;
 Thu, 19 Sep 2019 02:30:19 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFE5B3F575;
 Thu, 19 Sep 2019 02:30:17 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>, Ian Jackson <Ian.Jackson@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4b6e25f7-5bcf-e2bb-0ac8-0eaba9686e4e@arm.com>
 <A8538C15-ACB4-4163-8345-2C1D9596690E@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <103c23d7-12f1-ce3c-f4b4-fcd7219738a2@arm.com>
Date: Thu, 19 Sep 2019 10:30:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <A8538C15-ACB4-4163-8345-2C1D9596690E@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
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
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDE4LzA5LzIwMTkgMTM6MTQsIExhcnMgS3VydGggd3JvdGU6Cj4gCj4gCj4g
77u/T24gMTgvMDkvMjAxOSwgMTI6MTUsICJKdWxpZW4gR3JhbGwiIDxqdWxpZW4uZ3JhbGxAYXJt
LmNvbT4gd3JvdGU6Cj4gCj4gICAgICBIaSBJYW4sCj4gICAgICAKPiAgICAgIE9uIDE4LzA5LzIw
MTkgMTE6NDEsIElhbiBKYWNrc29uIHdyb3RlOgo+ICAgICAgPiBKdWxpZW4gR3JhbGwgd3JpdGVz
ICgiUmU6IFtQQVRDSF0gY3JlYXRlLWRpZmYtb2JqZWN0OiBtb3JlIHByZWNpc2VseSBpZGVudGlm
eSAucm9kYXRhIHNlY3Rpb25zIik6Cj4gICAgICA+PiBPbiAxOC8wOS8yMDE5IDEwOjUyLCBXaWVj
em9ya2lld2ljeiwgUGF3ZWwgd3JvdGU6Cj4gICAgICA+Pj4gJCBzY3JpcHRzLy4vYWRkX21haW50
YWluZXJzLnBsIC1kIH4vZ2l0L2xpdmVwYXRjaC1idWlsZC10b29scwo+ICAgICAgPj4KPiAgICAg
ID4+ICctZCcgb25seSB0ZWxscyB5b3Ugd2hlcmUgdGhlIHBhdGNoZXMgZmlsZXMgYXJlLiBUaGUg
c2NyaXB0IHdpbGwgbG9vayB1cCBmb3IgdGhlCj4gICAgICA+PiBNQUlOVEFJTkVSUyBmaWxlIGlu
IHRoZSBjdXJyZW50IGRpcmVjdG9yeS4KPiAgICAgID4KPiAgICAgID4gSG1tbS4gIEkgd29uZGVy
IGlmIHdlIGNvdWxkIGRldGVjdCB0aGlzIHNpdHVhdGlvbiBzb21laG93LiAgVGhpcyB3aWxsCj4g
ICAgICA+IGJlIGEgY29tbW9uIHVzZXIgZXJyb3IgSSB0aGluay4KPiAgICAgIEkgdGhpbmsgaXQg
d291bGQgYmUgcG9zc2libGUgZm9yIHBhdGNoIG1vZGlmeWluZyBmaWxlLiBXZSBjb3VsZCBjaGVj
ayB3aGV0aGVyCj4gICAgICB0aGUgZmlsZSBtb2RpZmllZCBleGlzdCBpbiB0aGUgcmVwby4gVGhv
dWdoLCBJIGFtIG5vdCBzdXJlIGhvdyBkaWZmaWN1bHQgaXQKPiAgICAgIHdvdWxkIGJlIHRvIGlt
cGxlbWVudC4KPiAgICAgIAo+IFRoYXQgbWlnaHQgYmUgZG9hYmxlLCBidXQgd29uJ3QgYmUgZWFz
eSBhcyBJIHdpbGwgZXNzZW50aWFsbHkgbmVlZCB0byBwYXJzZSB0aGUgcGF0Y2gKPiBBbmQgaXQg
d29uJ3QgYmUgcmVsaWFibGUuCj4gCj4gVGhlIG9ubHkgd29ya2FibGUgd2F5IG9mIGRvaW5nIHRo
aXMgbWF5IGJlIHRvIGhhdmUgYSBzdHJvbmcgY29udmVudGlvbgo+IHRoYXQgcmVxdWlyZXMgdG8g
dXNlIHRoZSBbUkVQT05BTUUgUEFUQ0hdIHZpYSAtLXN1YmplY3QtcHJlZml4IHdoZW4gZ2VuZXJh
dGluZyB0aGUKPiBwYXRjaCBhbmQgZm9yIGFkZF9tYWludGFpbmVycy5wbCB0byB2ZXJpZnkgdGhp
cyBzb21laG93IGJhc2VkIG9uIHRoZSBjdXJyZW50Cj4gZGlyZWN0b3J5IGFuZCB0aGUgcGF0Y2hl
cy4KPiAKPiBXZSBhbHJlYWR5IGhhdmUgc3Ryb25nIGNvbnZlbnRpb25zIGluIHNvbWUgY2FzZXMs
IGUuZy4gZm9yIE9TU1RFU1Qgd2UgYWx3YXlzIHVzZQo+IFtPU1NURVNUIFBBVENIXS4gVGhpcyB3
b3VsZCBwb3RlbnRpYWxseSBiZSBoZWxwZnVsIGZvciB0aGUgQ0kgbG9vcCBwbGFucyBhc28uCj4g
Cj4gQXNzdW1pbmcgdGhlcmUgaXMgYSBnaXQgY29uZmlnIHNldHRpbmcgZm9yIC0tc3ViamVjdC1w
cmVmaXggdGhlbiB0aGlzIGNvdWxkIGJlIG1hZGUKPiB0byB3b3JrLiBJIGNvdWxkIGFkZCBhIHNl
Y3Rpb24gdW5kZXIgWzFdIHRvIGRvY3VtZW50IHRoZSBjb252ZW50aW9uIHdpdGggdGhlCj4gYXBw
cm9wcmlhdGUgZ2l0IGNvbW1hbmQuIFdlIGNvdWxkIGluY2x1ZGUgYSBzY3JpcHQgKGUuZy4geGVu
LmdpdDpzY3JpcHMvZ2l0LXNldHVwKQo+IHdoaWNoIGRvZXMgdGhpcyBiYXNlZCBvbiB0aGUgcmVw
byBuYW1lIGF1dG9tYXRpY2FsbHkuCgpJIHNhdyBhIGNvbnZlcnNhdGlvbiBvbiBJUkMgYWJvdXQg
dGhpcy4gQnV0IGl0IGlzIG5vdCBjbGVhciBpZiB0aGVyZSB3YXMgYW55IApjb25jbHVzaW9uPwoK
TXkgb25seSBzbGlnaHQgY29uY2VybiBhYm91dCB0YWdnaW5nIGJ5IGRlZmF1bHQgaXMgdGhlIGxl
bmd0aCBvZiB0aGUgc3ViamVjdCwgCndoZW4gZGlyZWN0bHkgcmVjZWl2aW5nIGZyb20geGVuLWRl
dmVsIChpLmUuIG5vdCBDQ2VkKSwgdGhlIHN1YmplY3QgaXMgYWxyZWFkeSAKW3hlbi1kZXZlbF1b
UEFUQ0ggWFgvWFhdLiBJIGFtIGFzc3VtaW5nIHRoZSB0YWcgd2lsbCBub3QgYmUgZHJvcHBlZCBz
byBpdCB3aWxsIAphcHBlYXIgb24gdGhlIG1haWxpbmcgbGlzdC4gRm9yIHJlcG8gc3VjaCBhcyBM
SVZFUEFUQ0gtQlVJTEQsIHRoaXMgd291bGQgZW5kIHVwIAp0byBsZW5ndGh5IHByZWZpeC4KCkNo
ZWVycywKCi0tIApKdWxpZW4gR3JhbGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
