Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719506E691
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jul 2019 15:36:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hoT26-0003CK-Md; Fri, 19 Jul 2019 13:34:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9X78=VQ=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hoT25-0003CF-Gm
 for xen-devel@lists.xenproject.org; Fri, 19 Jul 2019 13:34:45 +0000
X-Inumbo-ID: f6e9a6d2-aa29-11e9-830c-837aa50c10e3
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f6e9a6d2-aa29-11e9-830c-837aa50c10e3;
 Fri, 19 Jul 2019 13:34:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52030337;
 Fri, 19 Jul 2019 06:34:42 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0E76F3F71A;
 Fri, 19 Jul 2019 06:34:40 -0700 (PDT)
To: Tamas K Lengyel <tamas@tklengyel.com>
References: <20190718144317.23307-1-tamas@tklengyel.com>
 <766b2e92-9d0d-e4d8-2a11-37b7e974f6d0@citrix.com>
 <CABfawhk-qCQeo+feqk=a2P_cXBrNsDtRuDYAQ9Vf56AQH0H_dg@mail.gmail.com>
 <4dd1504b-3559-c9ae-6176-65baac771302@arm.com>
 <CABfawhnj=EeNPeJ+DewiO4xuAuryhhr6E7pxeDVoDRqDW-93ug@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5ba2dca2-5d69-e3c9-a14a-cd5ee18f2599@arm.com>
Date: Fri, 19 Jul 2019 14:34:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CABfawhnj=EeNPeJ+DewiO4xuAuryhhr6E7pxeDVoDRqDW-93ug@mail.gmail.com>
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgVGFtYXMsCgpPbiAxOS8wNy8yMDE5IDE0OjA1LCBUYW1hcyBLIExlbmd5ZWwgd3JvdGU6Cj4g
T24gRnJpLCBKdWwgMTksIDIwMTkgYXQgMzowMyBBTSBKdWxpZW4gR3JhbGwgPGp1bGllbi5ncmFs
bEBhcm0uY29tPiB3cm90ZToKPj4KPj4gSGksCj4+Cj4+IE9uIDE4LzA3LzIwMTkgMTk6MzQsIFRh
bWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+IE9uIFRodSwgSnVsIDE4LCAyMDE5IGF0IDExOjU5IEFN
IEFuZHJldyBDb29wZXIKPj4+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4+
Pgo+Pj4+IE9uIDE4LzA3LzIwMTkgMTU6NDMsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToKPj4+Pj4g
ZGlmZiAtLWdpdCBhL0NPRElOR19TVFlMRSBiL0NPRElOR19TVFlMRQo+Pj4+PiBpbmRleCA2Y2M1
Yjc3NGNmLi4wYjM3ZjdhZTRkIDEwMDY0NAo+Pj4+PiAtLS0gYS9DT0RJTkdfU1RZTEUKPj4+Pj4g
KysrIGIvQ09ESU5HX1NUWUxFCj4+Pj4+IEBAIC02MCw4ICs2MCw4IEBAIEJyYWNpbmcKPj4+Pj4g
ICAgLS0tLS0tLQo+Pj4+Pgo+Pj4+PiAgICBCcmFjZXMgKCd7JyBhbmQgJ30nKSBhcmUgdXN1YWxs
eSBwbGFjZWQgb24gYSBsaW5lIG9mIHRoZWlyIG93biwgZXhjZXB0Cj4+Pj4+IC1mb3IgdGhlIGRv
L3doaWxlIGxvb3AuICBUaGlzIGlzIHVubGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlIGFuZAo+
Pj4+PiAtdW5saWtlIEsmUi4gIGRvL3doaWxlIGxvb3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46
Cj4+Pj4+ICtmb3IgdGhlIHdoaWxlLXBhcnQgb2YgZG8vd2hpbGUgbG9vcHMuICBUaGlzIGlzIHVu
bGlrZSB0aGUgTGludXggY29kaW5nIHN0eWxlCj4+Pj4+ICthbmQgdW5saWtlIEsmUi4gIGRvL3do
aWxlIGxvb3BzIGFyZSBhbiBleGNlcHRpb24uIGUuZy46Cj4+Pj4+Cj4+Pj4+ICAgIGlmICggY29u
ZGl0aW9uICkKPj4+Pj4gICAgewo+Pj4+PiBAQCAtNzcsNyArNzcsOCBAQCB3aGlsZSAoIGNvbmRp
dGlvbiApCj4+Pj4+ICAgICAgICAvKiBEbyBzdHVmZi4gKi8KPj4+Pj4gICAgfQo+Pj4+Pgo+Pj4+
PiAtZG8gewo+Pj4+PiArZG8KPj4+Pj4gK3sKPj4+Pgo+Pj4+IEknZCBoYXBwaWx5IHRha2UgdGhp
cyBhZGp1c3RtZW50IHRvIFhlbidzIHN0eWxlIGlmIGl0IGhlbHBzIHVzIGVuZCB1cAo+Pj4+IHdp
dGggYXV0by1mb3JtYXR0ZXIuCj4+Pgo+Pj4gWWF5IQo+Pj4KPj4+Pgo+Pj4+IEFsc28sIHRoZXJl
IGFyZSBhIG51bWJlciBvZiBmaWxlcyB3aGljaCBhcmUgdGVjaG5pY2FsbHkgTGludXggc3R5bGUs
IGJ1dAo+Pj4+IGhhdmUgdG90YWxseSBkaXZlcmdlZCBmcm9tIExpbnV4LCBhbmQgd291bGQgYmUg
ZWFzaWVyIHRvIG1vdmUgdG8gWGVuIHN0eWxlLgo+Pj4+Cj4+Pj4gRG8geW91IGhhdmUgYW4gdXBk
YXRlZCAuYXN0eWxlcmMgYmFzZWQgb24gSnVsaWVuJ3Mgb2JzZXJ2YXRpb25zPwo+Pj4KPj4+IFll
cywgdGhpcyBpcyBpdDoKPj4+Cj4+PiBzdHlsZT1ic2QKPj4+IHN1ZmZpeD1ub25lCj4+PiBhbGln
bi1wb2ludGVyPW5hbWUKPj4+IGFsaWduLXJlZmVyZW5jZT1uYW1lCj4+PiBpbmRlbnQ9c3BhY2Vz
PTQKPj4+IG1heC1jb2RlLWxlbmd0aD04MAo+Pj4gbWluLWNvbmRpdGlvbmFsLWluZGVudD0wCj4+
PiBtYXgtY29udGludWF0aW9uLWluZGVudD03OAo+Pj4gYXR0YWNoLWNsb3Npbmctd2hpbGUKPj4+
IHJlbW92ZS1icmFjZXMKPj4+IGJyZWFrLW9uZS1saW5lLWhlYWRlcnMKPj4+IHBhZC1jb21tYQo+
Pj4gcGFkLWhlYWRlcgo+Pgo+PiBVbmZvcnR1bmF0ZWx5IHRoaXMgc3R5bGUgZG9lcyBub3Qgd29y
ayB3aXRoIHRoZSBhc3R5bGUgcHJvdmlkZWQgYnkgRGViaWFuIFN0cmV0Y2g6Cj4+Cj4+IDQyc2g+
IGFzdHlsZSB4ZW4vYXJjaC9hcm0vc2V0dXAuYwo+PiBJbnZhbGlkIG9wdGlvbiBmaWxlIG9wdGlv
bnM6Cj4+IG1heC1jb250aW51YXRpb24taW5kZW50PTc4Cj4+IGF0dGFjaC1jbG9zaW5nLXdoaWxl
Cj4+IHJlbW92ZS1icmFjZXMKPj4gRm9yIGhlbHAgb24gb3B0aW9ucyB0eXBlICdhc3R5bGUgLWgn
Cj4+Cj4+IEFydGlzdGljIFN0eWxlIGhhcyB0ZXJtaW5hdGVkCj4gCj4gSSdtIGFscmVhZHkgb24g
YnVzdGVyIGFuZCBpdCB3b3JrcyBmaW5lLiBQZXJoYXBzIHdlJ2xsIG5lZWQgdG8gc3BlY2lmeQo+
IGEgbWluaW11bSB2ZXJzaW9uIG9mIGFzdHlsZS4KClRoYXQgd291bGQgYmUgZ29vZC4KCj4gCj4+
Cj4+IEFsc28sIEkgbmVlZGVkIHRvIGNvcHkgdGhlIC5hc3R5bGVyYyBpbiAkKEhPTUUpIGluIG9y
ZGVyIHRvIHVzZSB0aGUgc3R5bGUuIEl0IGlzCj4+IHByb2JhYmx5IHdvcnRoIGNvbnNpZGVyaW5n
IGltcGxlbWVudGluZyBhIHdyYXBwZXIgdGhhdCBzZXQKPj4gQVJUSVNUSUNfU1RZTEVfT1BUSU9O
UyBhbmQgY2FsbCBhc3R5bGUgdG8ga2VlcCBldmVydGhpbmcgaW4gWGVuIGludGVybmFscy4KPiAK
PiBZb3UgZG9uJ3QgaGF2ZSB0byBjb3B5IHRvIHRvICQoSE9NRSksIGFzIEkgcG9pbnQgb3V0IGJ5
IHRoZSBhZGRpdGlvbgo+IHRvIHRoZSBDT0RJTkdfU1RZTEUgdGhpcyB3b3JrcyBmcm9tIHRoZSBY
ZW4gcm9vdCBmb2xkZXI6Cj4gCj4gZXhwb3J0IEFSVElTVElDX1NUWUxFX09QVElPTlM9Ii5hc3R5
bGVyYyIKPiBhc3R5bGUgPHNvdXJjZSBvciBoZWFkZXIgZmlsZT4KCkkgbWlzcmVhZCB5b3VyIGZp
cnN0IGUtbWFpbC4gU29ycnkgZm9yIHRoZSBub2lzZS4KCj4gCj4+Cj4+Pgo+Pj4gV2l0aCB0aGlz
IGl0J3MgZG93biB0byA4NjAgZmlsZXMgdGhhdCBhcmUgZm9ybWF0dGVkLgo+Pgo+PiBEbyB5b3Ug
bWluZCBwcm92aWRpbmcgdGhlIG5ldyBkaWZmPwo+IAo+IEkndmUgdXBkYXRlZCB0aGUgc2FtZSBn
aXN0IHdpdGggdGhlIG5ldyBkaWZmLCB0aGUgdXJsIGlzIHRoZSBzYW1lOgo+IGh0dHBzOi8vZ2lz
dC5naXRodWIuY29tL3RrbGVuZ3llbC9jNWNhYzE0YTBkNTdmMTE5ZGQ3NzQ3YTFiZTZmYjI2MAoK
RG8geW91IG1pbmQgdG8gY3JlYXRlIGEgbmV3IGdpc3QgZXZlcnl0aW1lPyBUaGlzIHdvdWxkIGhl
bHAgdG8gc2VlIHRoZSAKZGlmZmVyZW5jZSBiZWZvcmUgYW5kIGFmdGVyIGF0IGxlYXN0IHVudGls
IEkgYnVpbGQgYSBuZXcgdmVyc2lvbiBvZiBhc3R5bGUgOikuCgpDaGVlcnMsCgotLSAKSnVsaWVu
IEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
