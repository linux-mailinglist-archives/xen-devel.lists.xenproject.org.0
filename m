Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C168ACF2
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 05:04:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxN1h-0005RS-PY; Tue, 13 Aug 2019 02:59:09 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=2WXD=WJ=prgmr.com=srn@srs-us1.protection.inumbo.net>)
 id 1hxN1f-0005RN-Jl
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 02:59:07 +0000
X-Inumbo-ID: 4fb57cc3-bd76-11e9-8980-bc764e045a96
Received: from mail.prgmr.com (unknown [2605:2700:0:5::4713:9506])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 4fb57cc3-bd76-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 02:59:05 +0000 (UTC)
Received: from [192.168.2.33] (c-174-62-72-237.hsd1.ca.comcast.net
 [174.62.72.237]) (Authenticated sender: srn)
 by mail.prgmr.com (Postfix) with ESMTPSA id BBA54720086;
 Tue, 13 Aug 2019 03:55:10 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.prgmr.com BBA54720086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prgmr.com;
 s=default; t=1565682911;
 bh=3GE6nZbeORfkRehPByUYW7KBCgHuPlEUfBssxYLakO4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Xd4tczFTQ26pxL4gnadhPHyPmw0qkG5h9YysosHa8qsIUiADeFy/NOSEtcolXOtxm
 WME4jZzT9gwcoHJpE13iYGlqpDucpU7qrQw5/V8QLSZ438z3gTR3EJkcPlMzMwFXQ1
 sosfM13r7aPaJZ2GMgV/3BTvnqz75exJajaplb/Q=
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall
 <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
 <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
From: Sarah Newman <srn@prgmr.com>
Message-ID: <760ba819-a3ab-c5dc-054c-3064c6b07a1b@prgmr.com>
Date: Mon, 12 Aug 2019 19:59:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
 StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gOC8xMi8xOSA4OjAxIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOgo+IE9uIDEyLzA4LzIwMTkg
MTU6NTMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4+IE9uIDgvOC8xOSAxMDoxMyBBTSwgSnVsaWVu
IEdyYWxsIHdyb3RlOgo+Pj4gSGkgSmFuLAo+Pj4KPj4+IE9uIDA4LzA4LzIwMTkgMTA6MDQsIEph
biBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDA4LjA4LjIwMTkgMTA6NDMsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+Pj4+IE9uIDA4LzA4LzIwMTkgMDc6MjIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+
Pj4gT24gMDcuMDguMjAxOSAyMTo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4+Pj4+PiAtLS0g
L2Rldi9udWxsCj4+Pj4+Pj4gKysrIGIvZG9jcy9nbG9zc2FyeS5yc3QKPj4+Pj4+PiBAQCAtMCww
ICsxLDM3IEBACj4+Pj4+Pj4gK0dsb3NzYXJ5Cj4+Pj4+Pj4gKz09PT09PT09Cj4+Pj4+Pj4gKwo+
Pj4+Pj4+ICsuLiBUZXJtcyBzaG91bGQgYXBwZWFyIGluIGFscGhhYmV0aWNhbCBvcmRlcgo+Pj4+
Pj4+ICsKPj4+Pj4+PiArLi4gZ2xvc3Nhcnk6Ogo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoCBjb250
cm9sIGRvbWFpbgo+Pj4+Pj4+ICvCoMKgwqDCoCBBIDp0ZXJtOmBkb21haW5gLCBjb21tb25seSBk
b20wLCB3aXRoIHRoZSBwZXJtaXNzaW9uIGFuZAo+Pj4+Pj4+IHJlc3BvbnNpYmlsaXR5Cj4+Pj4+
Pj4gK8KgwqDCoMKgIHRvIGNyZWF0ZSBhbmQgbWFuYWdlIG90aGVyIGRvbWFpbnMgb24gdGhlIHN5
c3RlbS4KPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqAgZG9tYWluCj4+Pj4+Pj4gK8KgwqDCoMKgIEEg
ZG9tYWluIGlzIFhlbidzIHVuaXQgb2YgcmVzb3VyY2Ugb3duZXJzaGlwLCBhbmQgZ2VuZXJhbGx5
IGhhcwo+Pj4+Pj4+IGF0IHRoZQo+Pj4+Pj4+ICvCoMKgwqDCoCBtaW5pbXVtIHNvbWUgUkFNIGFu
ZCB2aXJ0dWFsIENQVXMuCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqDCoCBUaGUgdGVybXMgOnRl
cm06YGRvbWFpbmAgYW5kIDp0ZXJtOmBndWVzdGAgYXJlIGNvbW1vbmx5IHVzZWQKPj4+Pj4+PiAr
wqDCoMKgwqAgaW50ZXJjaGFuZ2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQg
dGhpbmdzLgo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoMKgwqAgQSBndWVzdCBpcyBhIHNpbmdsZSB2
aXJ0dWFsIG1hY2hpbmUuCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgwqDCoCBDb25zaWRlciB0aGUg
Y2FzZSBvZiBsaXZlIG1pZ3JhdGlvbiB3aGVyZSwgZm9yIGEgcGVyaW9kIG9mCj4+Pj4+Pj4gdGlt
ZSwgb25lCj4+Pj4+Pj4gK8KgwqDCoMKgIGd1ZXN0IHdpbGwgYmUgY29tcHJpc2VkIG9mIHR3byBk
b21haW5zLCB3aGlsZSBpdCBpcyBpbiB0cmFuc2l0Lgo+Pj4+Pj4+ICsKPj4+Pj4+PiArwqDCoCBk
b21pZAo+Pj4+Pj4+ICvCoMKgwqDCoCBUaGUgbnVtZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmlu
ZyA6dGVybTpgZG9tYWluYC7CoCBJdCBpcwo+Pj4+Pj4+IHVuaXF1ZSB0byBhCj4+Pj4+Pj4gK8Kg
wqDCoMKgIHNpbmdsZSBpbnN0YW5jZSBvZiBYZW4sIHVzZWQgYXMgdGhlIGlkZW50aWZpZXIgaW4g
dmFyaW91cyBBUElzLAo+Pj4+Pj4+IGFuZCBpcwo+Pj4+Pj4+ICvCoMKgwqDCoCB0eXBpY2FsbHkg
YWxsb2NhdGVkIHNlcXVlbnRpYWxseSBmcm9tIDAuCj4+Pj4+Pj4gKwo+Pj4+Pj4+ICvCoMKgIGd1
ZXN0Cj4+Pj4+Pj4gK8KgwqDCoMKgIFNlZSA6dGVybTpgZG9tYWluYAo+Pj4+Pj4gSSB0aGluayB5
b3Ugd2FudCB0byBtZW50aW9uIHRoZSB1c3VhbCBkaXN0aW5jdGlvbiBoZXJlOiBEb20wIGlzLAo+
Pj4+Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEgZ3Vlc3QuCj4+
Pj4+IFRvIGJlIGhvbmVzdCwgSSBoYWQgdG90YWxseSBmb3Jnb3R0ZW4gYWJvdXQgdGhhdC7CoCBJ
IGd1ZXNzIG5vdyBpcyB0aGUKPj4+Pj4gcHJvcGVyIHRpbWUgdG8gcmVoYXNoIGl0IGluIHB1Ymxp
Yy4KPj4+Pj4KPj4+Pj4gSSBkb24ndCB0aGluayB0aGUgd2F5IGl0IGN1cnJlbnRseSBnZXRzIHVz
ZWQgaGFzIGEgY2xlYXIgb3IgY29oZXJlbnQgc2V0Cj4+Pj4+IG9mIHJ1bGVzLCBiZWNhdXNlIEkg
Y2FuJ3QgdGhpbmsgb2YgYW55IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1c2VkLgo+Pj4+
Pgo+Pj4+PiBFaXRoZXIgdGhlcmUgYXJlIGEgY2xlYXIgYW5kIGNvaGVyZW50IChhbmQgc2ltcGxl
ISkgc2V0IG9mIHJ1bGVzIGZvcgo+Pj4+PiB3aGF0IHdlIG1lYW4gYnkgImd1ZXN0IiwgYXQgd2hp
Y2ggcG9pbnQgdGhleSBjYW4gbGl2ZSBoZXJlIGluIHRoZQo+Pj4+PiBnbG9zc2FyeSwgb3IgdGhl
IGZ1enp5IHdheSBpdCBpcyBjdXJyZW50IHVzZWQgc2hvdWxkIGNlYXNlLgo+Pj4+IFdoYXQncyBm
dXp6eSBhYm91dCBEb20wIG5vdCBiZWluZyBhIGd1ZXN0IChkdWUgdG8gYmVpbmcgYSBwYXJ0IG9m
IHRoZQo+Pj4+IGhvc3QgaW5zdGVhZCk/Cj4+PiBEb20wIGlzIG5vdCBwYXJ0IG9mIHRoZSBob3N0
IGlmIHlvdSBhcmUgdXNpbmcgYW4gaGFyZHdhcmUgZG9tYWluLiBJCj4+PiBhY3R1YWxseSB0aG91
Z2h0IHdlIHJlbmFtZWQgZXZlcnl0aGluZyBpbiBYZW4gZnJvbSBEb20wIHRvIGh3ZG9tIHRvCj4+
PiBhdm9pZCB0aGUgY29uZnVzaW9uLgo+Pj4KPj4+IEkgYWxzbyB3b3VsZCByYXRoZXIgYXZvaWQg
dG8gdHJlYXQgImRvbTAiIGFzIG5vdCBhIGd1ZXN0LiBJbiBub3JtYWwKPj4+IHNldHVwIHRoaXMg
aXMgYSBtb3JlIHByaXZpbGVnZSBndWVzdCwgaW4gb3RoZXIgc2V0dXAgdGhpcyBtYXkganVzdCBi
ZSBhCj4+PiBub3JtYWwgZ3Vlc3QgKHRoaW5rIGFib3V0IHBhcnRpdGlvbmluZykuCj4+IEEgbGl0
ZXJhbCBndWVzdCBpcyBzb21lb25lIHdobyBkb2Vzbid0IGxpdmUgaW4gdGhlIGJ1aWxkaW5nIChv
ciB3b3JrIGluCj4+IHRoZSBidWxpZGluZywgaWYgeW91J3JlIGluIGEgaG90ZWwpLiAgVGhlIGZh
Y3QgdGhhdCB0aGUgc3RhZmYgY2xlYW5pbmcKPj4gcm9vbXMgYXJlIHJlc3RyaWN0ZWQgaW4gdGhl
aXIgcHJpdmlsZWdlcyBkb2Vzbid0IG1ha2UgdGhlbSBndWVzdHMgb2YgdGhlCj4+IGhvdGVsLgo+
Pgo+PiBUaGUgdG9vbHN0YWNrIGRvbWFpbiwgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlIGRyaXZl
ciBkb21haW4sIHRoZQo+PiB4ZW5zdG9yZSBkb21haW4sIGFuZCBzbyBvbiBhcmUgYWxsIHBhcnQg
b2YgdGhlIGhvc3Qgc3lzdGVtLCBkZXNpZ25lZCB0bwo+PiBhbGxvdyB5b3UgdG8gdXNlIFhlbiB0
byBkbyB0aGUgdGhpbmcgeW91IGFjdHVhbGx5IHdhbnQgdG8gZG86IFJ1biBndWVzdHMuCj4+Cj4+
IEFuZCBpdCdzIGltcG9ydGFudCB0aGF0IHdlIGhhdmUgYSB3b3JkIHRoYXQgZGlzdGluZ3Vpc2hl
cyAiZG9tYWlucyB0aGF0Cj4+IHdlIG9ubHkgY2FyZSBhYm91dCBiZWNhdXNlIHRoZXkgbWFrZSBp
dCBwb3NzaWJsZSB0byBydW4gb3RoZXIgZG9tYWlucyIsCj4+IGFuZCAiZG9tYWlucyB0aGF0IHdl
IGFjdHVhbGx5IHdhbnQgdG8gcnVuIi4gICJndWVzdCAvIGhvc3QiIGlzIGEgbmF0dXJhbAo+PiB0
ZXJtaW5vbG9neSBmb3IgdGhlc2UuCj4+Cj4+IFdlIGFscmVhZHkgaGF2ZSB0aGUgd29yZCAiZG9t
YWluIiwgd2hpY2ggaW5jbHVkZXMgZG9tMCwgZHJpdmVyIGRvbWFpbnMsCj4+IHRvb2xzdGFjayBk
b21haW5zLCBoYXJkd2FyZSBkb21haW5zLCBhcyB3ZWxsIGFzIGd1ZXN0IGRvbWFpbnMuICBXZSBk
b24ndAo+PiBuZWVkICJndWVzdCIgdG8gYmUgYSBzeW5vbnltIGZvciAiZG9tYWluIi4KPiAKPiBT
by4uLgo+IAo+IFBsZWFzZSBjYW4gc29tZW9uZSBwcm9wb3NlIHdvcmRpbmcgc2ltcGxlLCBjbGVh
ciB3b3JkaW5nIGZvciB3aGF0Cj4gImd1ZXN0IiBtZWFucy4KCkEgcG90ZW50aWFsbHkgdW50cnVz
dGVkIGRvbWFpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
