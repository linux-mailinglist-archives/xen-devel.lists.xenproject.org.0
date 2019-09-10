Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A15AAAEF1A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 18:05:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7ia7-000876-29; Tue, 10 Sep 2019 16:01:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IMu8=XF=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i7ia5-000871-8T
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 16:01:25 +0000
X-Inumbo-ID: 3aeb3844-d3e4-11e9-a337-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3aeb3844-d3e4-11e9-a337-bc764e2007e4;
 Tue, 10 Sep 2019 16:01:20 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4DE2D1000;
 Tue, 10 Sep 2019 09:01:20 -0700 (PDT)
Received: from [10.37.12.155] (unknown [10.37.12.155])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 303173F71F;
 Tue, 10 Sep 2019 09:01:18 -0700 (PDT)
To: Lars Kurth <lars.kurth@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.8155a0a9d3da9781c83c5eaf5718c901934174f8.1567596460.git-series.lars.kurth@citrix.com>
 <c3c41841ac809b600241b41400f18e12971aad8f.1567596460.git-series.lars.kurth@citrix.com>
 <2db8eb91-9ac2-8db5-cf98-2f7ef60ac0da@arm.com>
 <9dc5a111-93e0-43fe-fa13-4b225fd5fe1d@arm.com>
 <E95BE9F8-9D7C-414B-BB33-1124CD55330F@citrix.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5b343183-ed1f-6819-226c-a17acfd025a7@arm.com>
Date: Tue, 10 Sep 2019 17:01:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E95BE9F8-9D7C-414B-BB33-1124CD55330F@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 2/3] Add V section entry to allow
 identification of Xen MAINTAINERS file
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
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgTGFycywKCk9uIDkvMTAvMTkgNDozNSBQTSwgTGFycyBLdXJ0aCB3cm90ZToKPiAKPiBPbiAx
MC8wOS8yMDE5LCAxNjozMSwgIkp1bGllbiBHcmFsbCIgPGp1bGllbi5ncmFsbEBhcm0uY29tPiB3
cm90ZToKPiAKPiAgICAgIEhpLAo+ICAgICAgCj4gICAgICBBY3R1YWxseSwgSSBoYXZlIG9uZSBx
dWVzdGlvbiBhYm91dCB0aGUgdGVtcGxhdGUgKG15IGFjayBzdGlsbCBzdGFuZHMpLgo+ICAgICAg
Cj4gICAgICBPbiA5LzEwLzE5IDQ6MTggUE0sIEp1bGllbiBHcmFsbCB3cm90ZToKPiAgICAgID4g
SGkgTGFycywKPiAgICAgID4KPiAgICAgID4gT24gOS80LzE5IDEyOjMwIFBNLCBMYXJzIEt1cnRo
IHdyb3RlOgo+ICAgICAgPj4gVGhpcyBjaGFuZ2UgcHJvdmlkZXMgc3VmZmljaWVudCBpbmZvcm1h
dGlvbiB0byBhbGxvdyBnZXRfbWFpbnRhaW5lci5wbCAvCj4gICAgICA+PiBhZGRfbWFpbnRhaW5l
cnMucGwgc2NyaXB0cyB0byBiZSBydW4gb24geGVuIHNpc3RlciByZXBvc2l0b3JpZXMgc3VjaCBh
cwo+ICAgICAgPj4gbWluaS1vcy5naXQsIG9zc3Rlc3QuZ2l0LCBldGMKPiAgICAgID4+Cj4gICAg
ICA+PiBBIHN1Z2dlc3RlZCB0ZW1wbGF0ZSBmb3Igc2lzdGVyIHJlcG9zaXRvcmllcyBvZiBYZW4g
aXMKPiAgICAgID4+Cj4gICAgICA+PiA9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PQo+ICAgICAgPj4gVGhpcyBmaWxlIGZvbGxvd3MgdGhlIHNh
bWUgY29udmVudGlvbnMgYXMgb3V0bGluZWQgaW4KPiAgICAgID4+IHhlbi5naXQ6TUFJTlRBSU5F
UlMuIFBsZWFzZSByZWZlciB0byB0aGUgZmlsZSBpbiB4ZW4uZ2l0Cj4gICAgICA+PiBmb3IgbW9y
ZSBpbmZvcm1hdGlvbi4KPiAgICAgID4+Cj4gICAgICA+PiBUSEUgUkVTVAo+ICAgICAgPj4gTTog
ICAgICBNQUlOVEFJTkVSMSA8bWFpbnRhaW5lcjFAZW1haWwuY29tPgo+ICAgICAgPj4gTTogICAg
ICBNQUlOVEFJTkVSMiA8bWFpbnRhaW5lcjJAZW1haWwuY29tPgo+ICAgICAgPj4gTDogICAgICB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKPiAgICAgIAo+ICAgICAgSSB3YXMgdW5kZXIg
dGhlIGltcHJlc3Npb24gdGhhdCB0aGUgc2NyaXB0cyB3b3VsZCBiZSB1c2VkIGZvciBVbmlrcmFm
dC4KPiAgICAgIElmIHNvLCBkbyB3ZSBleHBlY3QgdGhlbSB0byBDQyB4ZW4tZGV2ZWwgZXZlcnl0
aW1lPwo+IAo+IEluIHRoYXQgY2FzZSwgdGhlIHRlbXBsYXRlIGhhcyB0byBiZSBhZGFwdGVkLiBJ
IHdhcyBtYWlubHkgdGhpbmtpbmcgb2YKPiBYVEYsIE9TU1RFU1QsIGxpdmVwYXRjaC1idWlsZC10
b29scy4gSWYgaXQgd2VyZSB1c2VkIHNheSBmb3IgbWluaW9zCj4gKHdoaWNoIEkgdGhpbmsgaXQg
c2hvdWxkKSAgdGhlIEw6IGZpZWxkIHdvdWxkIG9idmlvdXNseSBuZWVkIGNoYW5naW5nCj4gICAK
PiBPbmNlIHRoaXMgc2VyaWVzIGlzIHRocm91Z2gsIEkgd2lsbCBzdWJtaXQgbWFpbnRhaW5lciBm
aWxlcyBmb3IgYWxsIHRob3NlCj4gcHJvamVjdHMgbWFraW5nIHN1cmUgdGhhdCB0aGV5IGhhdmUg
dGhlIHJpZ2h0IEw6IGZpZWxkLgo+IAo+ICAgICAgSWYgdGhlIGFuc3dlciBpcyBubywgdGhlbiB3
ZSB3aWxsIHByb2JhYmx5IHdhbnQgdG8gYWRkX21haW50YWluZXJzLnBsLgo+ICAgICAgCj4gSSBi
YXNpY2FsbHkgZHJvcHBlZCB0aGUgb3JpZ2luYWwgcGF0Y2ggZm9yIFVuaWtyYWZ0IGFzIG5vYm9k
eSBoYXMgcmVzcG9uZGVkLgo+IEkgd2FzIG5vdCBwbGFubmluZyB0byBwaWNrIHRoaXMgdXAsIHVu
bGVzcyBzb21lb25lIGZyb20gVW5pa3JhZnQgcnVucyB3aXRoIGl0CgpJdCBtYWtlcyBzZW5zZS4g
VGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24hCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
