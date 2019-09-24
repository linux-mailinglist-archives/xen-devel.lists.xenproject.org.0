Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4EFBC668
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:13:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCihm-0003ra-08; Tue, 24 Sep 2019 11:10:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCihj-0003n7-PW
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:09:59 +0000
X-Inumbo-ID: ebee279a-dead-11e9-994c-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id ebee279a-dead-11e9-994c-bc764e2007e4;
 Tue, 24 Sep 2019 09:30:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C46FCBA7D;
 Tue, 24 Sep 2019 09:30:17 +0000 (UTC)
To: Paul Durrant <Paul.Durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa62726c-5aa4-8bcd-dc35-61eb8dfeaee3@suse.com>
 <e0a904bf-b6a0-6224-88f6-e89a95867718@suse.com>
 <1b23caa9eb9a424d919c2aed1a5ba80f@AMSPEX02CL03.citrite.net>
 <d977330a-88e0-e145-84ad-e0271232e477@suse.com>
 <ddb120a784e549e39c6e4612c10921e1@AMSPEX02CL03.citrite.net>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8a42cbb2-7ed0-f2b6-679a-bab554faf527@suse.com>
Date: Tue, 24 Sep 2019 11:30:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <ddb120a784e549e39c6e4612c10921e1@AMSPEX02CL03.citrite.net>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6 7/8] AMD/IOMMU: allocate one device table
 per PCI segment
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxMToyMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+
IFNlbnQ6IDI0IFNlcHRlbWJlciAyMDE5IDEwOjEwCj4+IFRvOiBQYXVsIER1cnJhbnQgPFBhdWwu
RHVycmFudEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+IENj
OiBTdXJhdmVlIFN1dGhpa3VscGFuaXQgPHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPjsg
QW5kcmV3IENvb3BlciA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT4KPj4gU3ViamVjdDogUmU6
IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NiA3LzhdIEFNRC9JT01NVTogYWxsb2NhdGUgb25lIGRldmlj
ZSB0YWJsZSBwZXIgUENJIHNlZ21lbnQKPj4KPj4gT24gMjMuMDkuMjAxOSAxODozMCwgUGF1bCBE
dXJyYW50IHdyb3RlOgo+Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+Pj4gRnJvbTog
WGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4gT24gQmVo
YWxmIE9mIEphbiBCZXVsaWNoCj4+Pj4gU2VudDogMTkgU2VwdGVtYmVyIDIwMTkgMTQ6MjUKPj4+
PiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4+Pj4gQ2M6IEFuZHJldyBDb29w
ZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBTdXJhdmVlIFN1dGhpa3VscGFuaXQKPj4g
PHN1cmF2ZWUuc3V0aGlrdWxwYW5pdEBhbWQuY29tPgo+Pj4+IFN1YmplY3Q6IFtYZW4tZGV2ZWxd
IFtQQVRDSCB2NiA3LzhdIEFNRC9JT01NVTogYWxsb2NhdGUgb25lIGRldmljZSB0YWJsZSBwZXIg
UENJIHNlZ21lbnQKPj4+Pgo+Pj4+IEhhdmluZyBhIHNpbmdsZSBkZXZpY2UgdGFibGUgZm9yIGFs
bCBzZWdtZW50cyBjYW4ndCBwb3NzaWJseSBiZSByaWdodC4KPj4+Cj4+PiBUaGUgY29weSBvZiB0
aGUgc3BlYy4gSSBoYXZlIHNheXMgKG9uIHBhZ2UgMjUzOiBGaXhlZC1MZW5ndGggSVZIRAo+Pj4g
QmxvY2tzKSB0aGF0IElWSEQgZW50cmllcyBtdXN0IGhhdmUgYSBzZWdtZW50IGdyb3VwIG9mIDAs
IHNvIGNhbid0Cj4+PiB0aGUgY29kZSBqdXN0IHJlcXVpcmUgaW9tbXUtPnNlZyA9PSAwPwo+Pgo+
PiBUaGUgd29yZGluZyBpbiBteSB2ZXJzaW9uIGlzICJBdCB0aGlzIHRpbWUsIG9ubHkgUENJIFNl
Z21lbnQgR3JvdXAgMCBpcwo+PiBzdXBwb3J0ZWQuIiBUaGlzIHN1Z2dlc3RzIHRvIG1lIHRoYXQg
aXQgaXMgbm90IGEgZ29vZCBpZGVhIHRvIGhhdmUgbG9naWMKPj4gYmFrZWQgaW4gdGhhdCBkZXBl
bmRzIG9uIHRoaXMgcmVtYWluaW5nIHRydWUuIEkgcmVhbGl6ZSB0aG91Z2ggdGhhdCB0aGVyZQo+
PiBhcmUgbW9yZSBwbGFjZXMgdGhhbiBqdXN0IHRoaXMgb25lIHdoZXJlIHdlIChoYXZlIHRvKSBh
c3N1bWUgc2VnbWVudCAwCj4+IChhbGwgaW4gaW9tbXVfYWNwaS5jLCBhbmQgYWxsIG1hcmtlZCB3
aXRoIGFuIFhYWCBjb21tZW50KS4KPj4KPiAKPiBPay4gRmFpciBlbm91Z2guIEkganVzdCB3YXNu
J3Qgc3VyZSBpdCB3YXMgd29ydGggZG9pbmcgdGhpcyBjaGFuZ2UgYXQgdGhlCj4gbW9tZW50OwoK
VGhlIHRoaW5nIHRoYXQgSSBmb3VuZCByZWFsbHkgZGlzZ3VzdGluZyB3YXMgdGhlIGdsb2JhbCAo
aS5lLiBub3QgZXZlbgpzdGF0aWMpIHZhcmlhYmxlICJkZXZpY2VfdGFibGUiLiBBbmQgc2ltcGx5
IG1ha2luZyBpdCBzdGF0aWMgd291bGQgc3RpbGwKaGF2ZSBsZWZ0IHRoaW5ncyBpbiB0b28gdWds
eSBhIHN0YXRlIGZvciBteSB0YXN0ZS4KCj4gYnV0IGl0IGRvZXNuJ3QgaHVydCwgc28geW91IGNh
biBhZGQgbXkgUi1iLgoKVGhhbmtzLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
