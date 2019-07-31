Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1EB7C16A
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 14:35:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsnmS-00085m-R3; Wed, 31 Jul 2019 12:32:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mMRS=V4=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1hsnmR-00085h-Iy
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 12:32:31 +0000
X-Inumbo-ID: 4341e737-b38f-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4341e737-b38f-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 12:32:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A34D344;
 Wed, 31 Jul 2019 05:32:30 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8DA8B3F575;
 Wed, 31 Jul 2019 05:32:28 -0700 (PDT)
Date: Wed, 31 Jul 2019 13:32:07 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Message-ID: <20190731133207.1cb54cf4@donnerap.cambridge.arm.com>
In-Reply-To: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
References: <cover.1564371527.git.stewart.hildebrand@dornerworks.com>
Organization: ARM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 0/2] Raspberry Pi 4 support
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
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCAyOSBKdWwgMjAxOSAwOToxOToxOCAtMDQwMApTdGV3YXJ0IEhpbGRlYnJhbmQgPHN0
ZXdhcnQuaGlsZGVicmFuZEBkb3JuZXJ3b3Jrcy5jb20+IHdyb3RlOgoKSGksCgo+IFRoaXMgaXMg
YSBzZXJpZXMgdG8gZW5hYmxlIFVBUlQgY29uc29sZSBmb3IgUmFzcGJlcnJ5IFBpIDQuIE5vdGUg
dGhhdCBJJ20gcmVseWluZyBvbiB0aGUgZmlybXdhcmUgdG8gaW5pdGlhbGl6ZSB0aGUgVUFSVCAo
aS5lLiBlbmFibGVfdWFydD0xIGluIGNvbmZpZy50eHQpLCBzaW5jZSBmdWxsIFVBUlQgaW5pdGlh
bGl6YXRpb24gb24gdGhpcyBwbGF0Zm9ybSByZXF1aXJlcyBhY2Nlc3Npbmcgc29tZSByZWdpc3Rl
cnMgb3V0c2lkZSB0aGUgcmFuZ2Ugc3BlY2lmaWVkIGluIHRoZSBicmNtLGJjbTI4MzUtYXV4LXVh
cnQgbm9kZS4KPiAKPiBJIGhhdmUgYmVlbiBhYmxlIHRvIGdldCBYZW4rZG9tMCtkb21VcyBib290
aW5nLiBUZXN0ZWQgd2l0aCBYZW4gNC4xMiBhbmQgNC4xMy11bnN0YWJsZSAoYjRjOGEyN2Q1YikK
Ck1tbWgsIGRpZCB0aGF0IHJlYWxseSB3b3JrIGZvciB5b3U/IEkgbmVlZGVkIHRoZSBuZXh0IGNv
bW1pdCBpbiBzdGFnaW5nIGFzIHdlbGw6CmNvbW1pdCBlYWQ2YjlmNzgzNTVlOGQzNjZlMGM4MGM0
YTczZmE3ZmJkNmQyNmNjCkF1dGhvcjogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFt
LmNvbT4KRGF0ZTogICBUaHUgSnVsIDE4IDE2OjIyOjIwIDIwMTkgKzAzMDAKCiAgICB4ZW4vYXJt
OiBjcHVlcnJhdGE6IEFsaWduIGEgdmlydHVhbCBhZGRyZXNzIGJlZm9yZSB1bm1hcAoKT3RoZXJ3
aXNlIFhlbiB3b3VsZCBjcmFzaCBiZWZvcmUgZXZlbiBjb25zaWRlcmluZyBEb20wLgoKV2l0aCBB
bmRyaWkncyBwYXRjaCwgeW91ciB0d28gcGF0Y2hlcyBhbmQgU3RlZmFubydzIHJlc21lbSBzZXJp
ZXMgSSB3YXMgYWJsZSB0byBhdCBsZWFzdCBydW4gWGVuIHRpbGwgaXQgd2FzIGxvb2tpbmcgZm9y
IERvbTAsIGZyb20gVS1Cb290LCB3aXRoIEFURiAocHJvdmlkaW5nIFBTQ0kpLgpUaGVyZSBzZWVt
cyB0byBiZSBzb21lIGhpY2N1cCBpbiB0aGUgcmVzZXJ2ZWQtbWVtb3J5IGNvZGUgaW4gVS1Cb290
LCB3aGVyZSBVLUJvb3QgdHJpZXMgdG8gdXNlIHRoZSBhbHJlYWR5IHJlZ2lvbiwgYnV0IHRoYXQn
cyBhbiBpbmRlcGVuZGVudCBtYXR0ZXIuCgpDaGVlcnMsCkFuZHJlLgoKPiBhbmQgTGludXggNC4x
OS55IChSYXNwYmVycnkgUGkgbGludXggdHJlZSArIGEgY291cGxlIG9mIHBhdGNoZXMpLiBQbGVh
c2Ugc2VlIFsxXSBmb3IgYnVpbGQgaW5zdHJ1Y3Rpb25zIGFuZCBsaW1pdGF0aW9ucy4KPiAKPiBO
ZXcgaW4gdjI6Cj4gKiBEcm9wIGVhcmx5IHByaW50ayBhbGlhcwo+ICogU2V0IHJlZy1zaGlmdCBh
bmQgcmVnLWlvLXdpZHRoIGluIHRoZSBYZW4gZHJpdmVyCj4gKiBCbGFja2xpc3Qgb3RoZXIgYXV4
IHBlcmlwaGVyYWxzIGluIHBsYXRmb3JtIHNldHRpbmdzIChzcGkxLCBzcGkyLCBhbmQgYSBjb3Vw
bGUgb2YgYmFzZSBhdXggcmVnaXN0ZXJzKQo+IAo+IFRoYW5rcywKPiBTdGV3YXJ0IEhpbGRlYnJh
bmQKPiBEb3JuZXJXb3JrcywgTHRkCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9kb3JuZXJ3
b3Jrcy94ZW4tcnBpNC1idWlsZGVyCj4gCj4gU3Rld2FydCBIaWxkZWJyYW5kICgyKToKPiAgIG5z
MTY1NTA6IEFkZCBjb21wYXRpYmxlIHN0cmluZyBmb3IgUmFzcGJlcnJ5IFBpIDQKPiAgIHhlbi9h
cm06IHBsYXRmb3JtOiBBZGQgUmFzcGJlcnJ5IFBpIHBsYXRmb3JtCj4gCj4gIHhlbi9hcmNoL2Fy
bS9wbGF0Zm9ybXMvTWFrZWZpbGUgICAgICAgICAgICB8ICAxICsKPiAgeGVuL2FyY2gvYXJtL3Bs
YXRmb3Jtcy9icmNtLXJhc3BiZXJyeS1waS5jIHwgNTUgKysrKysrKysrKysrKysrKysrKysrKwo+
ICB4ZW4vZHJpdmVycy9jaGFyL25zMTY1NTAuYyAgICAgICAgICAgICAgICAgfCAgNyArKysKPiAg
MyBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4
ZW4vYXJjaC9hcm0vcGxhdGZvcm1zL2JyY20tcmFzcGJlcnJ5LXBpLmMKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
