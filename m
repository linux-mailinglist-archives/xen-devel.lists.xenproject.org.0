Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24186E321
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 11:07:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoOo3-0005BX-DA; Fri, 19 Jul 2019 09:03:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoOo1-0005BK-Em
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 09:03:57 +0000
X-Inumbo-ID: 210fb0f8-aa04-11e9-877b-b36d0e071a97
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 210fb0f8-aa04-11e9-877b-b36d0e071a97;
 Fri, 19 Jul 2019 09:03:52 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12D30337;
 Fri, 19 Jul 2019 02:03:52 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CBA7A3F71A;
 Fri, 19 Jul 2019 02:03:50 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
 <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4dd1504b-3559-c9ae-6176-65baac771302@arm.com>
Date: Fri, 19 Jul 2019 10:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC] xen: Add .astylerc for automated
 style-formatting
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxOC8wNy8yMDE5IDE5OjM0LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4gT24gVGh1
LCBKdWwgMTgsIDIwMTkgYXQgMTE6NTkgQU0gQW5kcmV3IENvb3Blcgo+IDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToKPj4KPj4gT24gMTgvMDcvMjAxOSAxNTo0MywgVGFtYXMgSyBM
ZW5neWVsIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL0NPRElOR19TVFlMRSBiL0NPRElOR19TVFlM
RQo+Pj4gaW5kZXggNmNjNWI3NzRjZi4uMGIzN2Y3YWU0ZCAxMDA2NDQKPj4+IC0tLSBhL0NPRElO
R19TVFlMRQo+Pj4gKysrIGIvQ09ESU5HX1NUWUxFCj4+PiBAQCAtNjAsOCArNjAsOCBAQCBCcmFj
aW5nCj4+PiAgIC0tLS0tLS0KPj4+Cj4+PiAgIEJyYWNlcyAoJ3snIGFuZCAnfScpIGFyZSB1c3Vh
bGx5IHBsYWNlZCBvbiBhIGxpbmUgb2YgdGhlaXIgb3duLCBleGNlcHQKPj4+IC1mb3IgdGhlIGRv
L3doaWxlIGxvb3AuICBUaGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZAo+
Pj4gLXVubGlrZSBLJlIuICBkby93aGlsZSBsb29wcyBhcmUgYW4gZXhjZXB0aW9uLiBlLmcuOgo+
Pj4gK2ZvciB0aGUgd2hpbGUtcGFydCBvZiBkby93aGlsZSBsb29wcy4gIFRoaXMgaXMgdW5saWtl
IHRoZSBMaW51eCBjb2Rpbmcgc3R5bGUKPj4+ICthbmQgdW5saWtlIEsmUi4gIGRvL3doaWxlIGxv
b3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4+Pgo+Pj4gICBpZiAoIGNvbmRpdGlvbiApCj4+
PiAgIHsKPj4+IEBAIC03Nyw3ICs3Nyw4IEBAIHdoaWxlICggY29uZGl0aW9uICkKPj4+ICAgICAg
IC8qIERvIHN0dWZmLiAqLwo+Pj4gICB9Cj4+Pgo+Pj4gLWRvIHsKPj4+ICtkbwo+Pj4gK3sKPj4K
Pj4gSSdkIGhhcHBpbHkgdGFrZSB0aGlzIGFkanVzdG1lbnQgdG8gWGVuJ3Mgc3R5bGUgaWYgaXQg
aGVscHMgdXMgZW5kIHVwCj4+IHdpdGggYXV0by1mb3JtYXR0ZXIuCj4gCj4gWWF5IQo+IAo+Pgo+
PiBBbHNvLCB0aGVyZSBhcmUgYSBudW1iZXIgb2YgZmlsZXMgd2hpY2ggYXJlIHRlY2huaWNhbGx5
IExpbnV4IHN0eWxlLCBidXQKPj4gaGF2ZSB0b3RhbGx5IGRpdmVyZ2VkIGZyb20gTGludXgsIGFu
ZCB3b3VsZCBiZSBlYXNpZXIgdG8gbW92ZSB0byBYZW4gc3R5bGUuCj4+Cj4+IERvIHlvdSBoYXZl
IGFuIHVwZGF0ZWQgLmFzdHlsZXJjIGJhc2VkIG9uIEp1bGllbidzIG9ic2VydmF0aW9ucz8KPiAK
PiBZZXMsIHRoaXMgaXMgaXQ6Cj4gCj4gc3R5bGU9YnNkCj4gc3VmZml4PW5vbmUKPiBhbGlnbi1w
b2ludGVyPW5hbWUKPiBhbGlnbi1yZWZlcmVuY2U9bmFtZQo+IGluZGVudD1zcGFjZXM9NAo+IG1h
eC1jb2RlLWxlbmd0aD04MAo+IG1pbi1jb25kaXRpb25hbC1pbmRlbnQ9MAo+IG1heC1jb250aW51
YXRpb24taW5kZW50PTc4Cj4gYXR0YWNoLWNsb3Npbmctd2hpbGUKPiByZW1vdmUtYnJhY2VzCj4g
YnJlYWstb25lLWxpbmUtaGVhZGVycwo+IHBhZC1jb21tYQo+IHBhZC1oZWFkZXIKClVuZm9ydHVu
YXRlbHkgdGhpcyBzdHlsZSBkb2VzIG5vdCB3b3JrIHdpdGggdGhlIGFzdHlsZSBwcm92aWRlZCBi
eSBEZWJpYW4gU3RyZXRjaDoKCjQyc2g+IGFzdHlsZSB4ZW4vYXJjaC9hcm0vc2V0dXAuYwpJbnZh
bGlkIG9wdGlvbiBmaWxlIG9wdGlvbnM6Cm1heC1jb250aW51YXRpb24taW5kZW50PTc4CmF0dGFj
aC1jbG9zaW5nLXdoaWxlCnJlbW92ZS1icmFjZXMKRm9yIGhlbHAgb24gb3B0aW9ucyB0eXBlICdh
c3R5bGUgLWgnCgpBcnRpc3RpYyBTdHlsZSBoYXMgdGVybWluYXRlZAoKQWxzbywgSSBuZWVkZWQg
dG8gY29weSB0aGUgLmFzdHlsZXJjIGluICQoSE9NRSkgaW4gb3JkZXIgdG8gdXNlIHRoZSBzdHls
ZS4gSXQgaXMgCnByb2JhYmx5IHdvcnRoIGNvbnNpZGVyaW5nIGltcGxlbWVudGluZyBhIHdyYXBw
ZXIgdGhhdCBzZXQgCkFSVElTVElDX1NUWUxFX09QVElPTlMgYW5kIGNhbGwgYXN0eWxlIHRvIGtl
ZXAgZXZlcnRoaW5nIGluIFhlbiBpbnRlcm5hbHMuCgo+IAo+IFdpdGggdGhpcyBpdCdzIGRvd24g
dG8gODYwIGZpbGVzIHRoYXQgYXJlIGZvcm1hdHRlZC4KCkRvIHlvdSBtaW5kIHByb3ZpZGluZyB0
aGUgbmV3IGRpZmY/CgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
