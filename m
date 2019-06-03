Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A3B33531
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jun 2019 18:44:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXq0d-000746-8u; Mon, 03 Jun 2019 16:40:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXq0b-00073z-TI
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 16:40:29 +0000
X-Inumbo-ID: 4b5dc35e-861e-11e9-8b6c-0b420e583e81
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 4b5dc35e-861e-11e9-8b6c-0b420e583e81;
 Mon, 03 Jun 2019 16:40:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B25080D;
 Mon,  3 Jun 2019 09:40:28 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFCAD3F5AF;
 Mon,  3 Jun 2019 09:40:25 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>, Jan Beulich <JBeulich@suse.com>
References: <20190516213752.1701-1-tamas@tklengyel.com>
 <20190516213752.1701-4-tamas@tklengyel.com>
 <5CF4D9CC02000078002346DC@prv1-mh.provo.novell.com>
 <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e83a925b-9914-b648-4c6d-3bf6ae9f0769@arm.com>
Date: Mon, 3 Jun 2019 17:40:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CABfawh=LbZ6dTQhYS+pxkPLA_=8OrGpeYYnPeZ60bhZ6kzT2Ew@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 4/4] x86/mem_sharing: compile mem_sharing
 subsystem only when kconfig is enabled
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMy8wNi8yMDE5IDE3OjM4LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gTW9u
LCBKdW4gMywgMjAxOSBhdCAyOjI2IEFNIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4g
d3JvdGU6Cj4+Cj4+Pj4+IE9uIDE2LjA1LjE5IGF0IDIzOjM3LCA8dGFtYXNAdGtsZW5neWVsLmNv
bT4gd3JvdGU6Cj4+PiBEaXNhYmxlIGl0IGJ5IGRlZmF1bHQgYXMgaXQgaXMgb25seSBhbiBleHBl
cmltZW50YWwgc3Vic3lzdGVtLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3ll
bCA8dGFtYXNAdGtsZW5neWVsLmNvbT4KPj4+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4+PiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
Pj4+IENjOiBXZWkgTGl1IDx3ZWkubGl1MkBjaXRyaXguY29tPgo+Pj4gQ2M6IFJvZ2VyIFBhdSBN
b25uZSA8cm9nZXIucGF1QGNpdHJpeC5jb20+Cj4+PiBDYzogR2VvcmdlIER1bmxhcCA8R2Vvcmdl
LkR1bmxhcEBldS5jaXRyaXguY29tPgo+Pj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBl
dS5jaXRyaXguY29tPgo+Pj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+
Cj4+PiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPgo+
Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4+IENj
OiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPj4+IENjOiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2Uu
ZHVubGFwQGV1LmNpdHJpeC5jb20+Cj4+PiAtLS0tCj4+PiB2NDogYWRkIEFTU0VSVF9VTlJFQUNI
QUJMRSB0byBpbmxpbmVkIGZ1bmN0aW9ucyB3aGVyZSBhcHBsaWNhYmxlICYgb3RoZXIKPj4+IGZp
eHVwcwo+Pj4gLS0tCj4+PiAgIHhlbi9hcmNoL3g4Ni9LY29uZmlnICAgICAgICAgICAgICB8ICA2
ICsrKysrLQo+Pj4gICB4ZW4vYXJjaC94ODYvZG9tYWluLmMgICAgICAgICAgICAgfCAgMiArKwo+
Pj4gICB4ZW4vYXJjaC94ODYvZG9tY3RsLmMgICAgICAgICAgICAgfCAgMiArKwo+Pj4gICB4ZW4v
YXJjaC94ODYvbW0vTWFrZWZpbGUgICAgICAgICAgfCAgMiArLQo+Pj4gICB4ZW4vYXJjaC94ODYv
eDg2XzY0L2NvbXBhdC9tbS5jICAgfCAgMiArKwo+Pj4gICB4ZW4vYXJjaC94ODYveDg2XzY0L21t
LmMgICAgICAgICAgfCAgMiArKwo+Pj4gICB4ZW4vY29tbW9uL0tjb25maWcgICAgICAgICAgICAg
ICAgfCAgMyAtLS0KPj4+ICAgeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgICAgIHwgIDIg
Ky0KPj4+ICAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jICAgICAgICAgIHwgIDIgKy0KPj4+ICAg
eGVuL2NvbW1vbi9tZW1vcnkuYyAgICAgICAgICAgICAgIHwgIDIgKy0KPj4+ICAgeGVuL2NvbW1v
bi92bV9ldmVudC5jICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4+PiAgIHhlbi9pbmNsdWRlL2Fz
bS14ODYvbWVtX3NoYXJpbmcuaCB8IDI4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+
ICAgeGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oICAgICAgICAgIHwgIDMgKysrCj4+PiAgIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oICAgICAgICAgICB8ICAyICstCj4+PiAgIHhlbi9pbmNsdWRlL3hz
bS9kdW1teS5oICAgICAgICAgICB8ICAyICstCj4+PiAgIHhlbi9pbmNsdWRlL3hzbS94c20uaCAg
ICAgICAgICAgICB8ICA0ICsrLS0KPj4+ICAgeGVuL3hzbS9kdW1teS5jICAgICAgICAgICAgICAg
ICAgIHwgIDIgKy0KPj4+ICAgeGVuL3hzbS9mbGFzay9ob29rcy5jICAgICAgICAgICAgIHwgIDQg
KystLQo+Pj4gICAxOCBmaWxlcyBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlv
bnMoLSkKPj4KPj4gRGFuaWVsLCBpdCBsb29rcyBsaWtlIHlvdSB3ZXJlbid0IENjLWVkIGhlcmUs
IGJ1dCB5b3VyIGFjayBpcyBuZWVkZWQuCj4gCj4gSW5kZWVkLCBJJ3ZlIGFsc28gc2VlbSB0byBo
YXZlIG1pc3NlZCBDQy1pbmcgUmF6dmFuIChmaXhlZCBub3cpLgoKTm93YWRheXMsIGFkZF9tYWlu
dGFpbmVycy5wbCBzaG91bGQgZG8gdGhlIHJpZ2h0IGZvciB5b3Ugd2l0aG91dCBoYXZpbmcgdG8g
Cm1vZGlmeWluZyBieSBoYW5kIGVhY2ggcGF0Y2g6Cgo0MnNoPiBzY3JpcHRzL2FkZF9tYWludGFp
bmVycy5wbCAtZCAuCgpDaGVlcnMsCgoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
