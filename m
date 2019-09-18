Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C77DB6229
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 13:23:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXzc-0000CY-NF; Wed, 18 Sep 2019 11:19:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FY6t=XN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iAXzb-0000CD-1O
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:19:27 +0000
X-Inumbo-ID: 2c61afba-da06-11e9-978d-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 2c61afba-da06-11e9-978d-bc764e2007e4;
 Wed, 18 Sep 2019 11:19:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF80B337;
 Wed, 18 Sep 2019 04:19:25 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 450CB3F575;
 Wed, 18 Sep 2019 04:19:23 -0700 (PDT)
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Ian Jackson <ian.jackson@citrix.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
 <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f164b812-4b52-bf5b-d48a-57fcc1e824cf@arm.com>
Date: Wed, 18 Sep 2019 12:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
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
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgUGF3ZWwsCgpPbiAxOC8wOS8yMDE5IDExOjQ0LCBXaWVjem9ya2lld2ljeiwgUGF3ZWwgd3Jv
dGU6Cj4gCj4gCj4+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTI6NDEsIElhbiBKYWNrc29uIDxpYW4u
amFja3NvbkBjaXRyaXguY29tPiB3cm90ZToKPj4KPj4gSnVsaWVuIEdyYWxsIHdyaXRlcyAoIlJl
OiBbUEFUQ0hdIGNyZWF0ZS1kaWZmLW9iamVjdDogbW9yZSBwcmVjaXNlbHkgaWRlbnRpZnkgLnJv
ZGF0YSBzZWN0aW9ucyIpOgo+Pj4gT24gMTgvMDkvMjAxOSAxMDo1MiwgV2llY3pvcmtpZXdpY3os
IFBhd2VsIHdyb3RlOgo+Pj4+ICQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dp
dC9saXZlcGF0Y2gtYnVpbGQtdG9vbHMKPj4+Cj4+PiAnLWQnIG9ubHkgdGVsbHMgeW91IHdoZXJl
IHRoZSBwYXRjaGVzIGZpbGVzIGFyZS4gVGhlIHNjcmlwdCB3aWxsIGxvb2sgdXAgZm9yIHRoZQo+
Pj4gTUFJTlRBSU5FUlMgZmlsZSBpbiB0aGUgY3VycmVudCBkaXJlY3RvcnkuCj4+Cj4+IEhtbW0u
ICBJIHdvbmRlciBpZiB3ZSBjb3VsZCBkZXRlY3QgdGhpcyBzaXR1YXRpb24gc29tZWhvdy4gIFRo
aXMgd2lsbAo+PiBiZSBhIGNvbW1vbiB1c2VyIGVycm9yIEkgdGhpbmsuCj4+Cj4gCj4gSSBzaG91
bGQgaGF2ZSBsb29rZWQgdHdpY2UgYmVmb3JlIHNlbmRpbmcgdGhlIHBhdGNoIG91dC4gQnV0LCB3
aGF0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBmb3IgbWUKPiBpcyBhZGRpdGlvbmFsIG9wdGlvbiB0
byB0aGUgYWRkX21haW50YWluZXJzLnBsIHNjcmlwdCBsaWtlOiAtbSAuL01BSU5UQUlORVJTCgpX
ZWxsIHRoZSBmaWxlbmFtZSB3aWxsIGFsd2F5cyBiZSB0aGUgc2FtZSwgc28gYXQgYmVzdCB5b3Ug
d2lsbCBwcm92aWRlIHJlZHVuZGFudCAKaW5mb3JtYXRpb24uCgpIb3dldmVyLCBpdCBpcyBub3Qg
dW5jb21tb24gdG8gaGF2ZSBzY3JpcHQgdGhhdCBuZWVkcyB0byBhcHBseSBvbiB0aGUgY3VycmVu
dCAKZGlyZWN0b3J5LiBXaGF0IHdvdWxkIGEgbmV3IG9wdGlvbiBhZGQ/IElzIGl0IGp1c3QgYXZv
aWQgdG8gZG8gYSAiY2QgLi4uIiBiZWZvcmU/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
