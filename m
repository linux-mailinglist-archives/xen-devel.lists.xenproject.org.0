Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF5CE6F0D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2019 10:25:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iP1Ec-0002se-Qe; Mon, 28 Oct 2019 09:22:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=U7n3=YV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iP1Eb-0002sT-86
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2019 09:22:45 +0000
X-Inumbo-ID: 7f0f10ea-f964-11e9-beca-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7f0f10ea-f964-11e9-beca-bc764e2007e4;
 Mon, 28 Oct 2019 09:22:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 435BBB21F;
 Mon, 28 Oct 2019 09:22:43 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <1571918276.2606.0@crc.id.au>
 <f5bb6057-7d01-92ad-9ab5-45f4b5bf57a5@citrix.com>
 <42d3409e-6081-eec6-bf75-27798d5dd447@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <107c9b47-5bd4-9c7a-723e-c20c2f32c378@suse.com>
Date: Mon, 28 Oct 2019 10:22:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <42d3409e-6081-eec6-bf75-27798d5dd447@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Debugging Windows HVM crashes on Ryzen 3xxx series
 CPUs.
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
Cc: Lars Kurth <lars.kurth@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTAuMjAxOSAwNzoyMiwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAyNS4xMC4xOSAx
OTowMSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMjQvMTAvMjAxOSAxMjo1NywgU3RldmVu
IEhhaWdoIHdyb3RlOgo+Pj4gSGkgYWxsLAo+Pj4KPj4+IEkndmUgbWFuYWdlZCB0byBnZXQgdGhl
IGdpdCBtYXN0ZXIgdmVyc2lvbiBvZiBYZW4gb24gdGhpcyBhZmZlY3RlZAo+Pj4gc3lzdGVtIGFu
ZCB0cmllcyB0byBib290IGEgV2luZG93cyBTZXJ2ZXIgMjAxNiBzeXN0ZW0uIEl0IGNyYXNoZXMg
YXMKPj4+IHBlciBub3JtYWwuCj4+Pgo+Pj4gSSBtYW5hZ2VkIHRvIGdldCB0aGVzZSBsb2dzLCBi
dXQgSSdtIG5vdCBxdWl0ZSBzdXJlIHdoYXQgZWxzZSB0byBkbyB0bwo+Pj4gZGVidWcgdGhpcyBp
c3N1ZSBmdXJ0aGVyLgo+Pgo+PiBBZnRlciBhIGNvbGxhYm9yYXRpdmUgZGVidWdnaW5nIHNlc3Np
b24gb24gSVJDLCB3ZSd2ZSBpZGVudGlmaWVkIHRoZQo+PiBwcm9ibGVtLsKgIEhlcmUgaXMgYSBz
dW1tYXJ5Lgo+Pgo+PiBodHRwczovL3d3dy5yZWRkaXQuY29tL3IvQW1kL2NvbW1lbnRzL2NrcjVm
NC9hbWRfcnl6ZW5fMzAwMF9zZXJpZXNfbGludXhfc3VwcG9ydF9hbmQvCj4+IGlzIGNvbmNlcm5p
bmcgS1ZNLCBidXQgaXQgaWRlbnRpZmllZCB0aGF0IHRoZSBUT1BPRVhUIGZlYXR1cmUgd2FzCj4+
IGltcG9ydGFudCB0byBnZXR0aW5nIHdpbmRvd3MgdG8gYm9vdC4KPj4KPj4gWGVuIGRvZXNuJ3Qg
Y3VycmVudGx5IG9mZmVyIFRPUE9FWFQgdG8gZ3Vlc3RzIGF0IGFsbC7CoCBGaXhpbmcgdGhpcyBp
cyBvbgo+PiB0aGUgVE9ETyBsaXN0IGFsb25nIHdpdGggdGhlIHJlc3Qgb2YgdGhlIHRvcG9sb2d5
IHJlcHJlc2VudGF0aW9uIHN3YW1wLgo+Pgo+PiBPbiBhIGh1bmNoLCBJIG9mZmVyZWQgdXAgYSBY
ZW5TZXJ2ZXIgcGF0Y2ggd2hpY2ggd2UgYXJlIHN0aWxsIHVzaW5nLCBpbgo+PiBsaWV1IG9mIGZp
eGluZyB0b3BvbG9neSBwcm9wZXJseS7CoCBJdCBpcyBsb2dpY2FsbHkgYSByZXZlcnQgb2YKPj4g
Y2EyZWVlOTJkZjQ0IGFzIHRoYXQgY2hhbmdlIHdhc24ndCBtaWdyYXRpb24gc2FmZS4KPj4KPj4g
V2l0aCB0aGlzIHBhdGNoIGluIHBsYWNlLCB3aW5kb3dzIHdvcmtzIGZpbmUuwqAgSG93ZXZlciwg
SSBkb24ndCB0aGluawo+PiB0aGUgcGF0Y2ggaXMgYXBwcm9wcmlhdGUgdG8gdGFrZSBpbnRvIDQu
MTMuCj4+Cj4+IEZ1cnRoZXJtb3JlLCB0aGVyZSBpcyBubyBjaGFuY2Ugb2YgZ2V0dGluZyB0aGUg
dG9wb2xvZ3kgd29yayBzb3J0ZWQgaW4KPj4gdGhlIHJlbWFpbmluZyA0LjEzIHRpbWVmcmFtZS4K
Pj4KPj4gSSdtIGF0IGEgbG9zcyBmb3IgaWRlYXMsIG90aGVyIHRoYW4gcmVsZWFzZSBub3RlIGl0
IGFzIGJyb2tlbiBhbmQgbWFrZQo+PiBmaXhpbmcgaXQgYSBibG9ja2VyIGZvciA0LjE0Lgo+Pgo+
PiBUaG91Z2h0cz8KPiAKPiBXaGF0IGFib3V0IGEgZG9tYWluIGNvbmZpZyBlbnRyeSBkZWZhdWx0
aW5nIHRvICJvZmYiIHNlbGVjdGluZyB0aGUKPiB0b3BvbG9neSBtb2RpZmljYXRpb24gaW4gbGli
eGMgeW91IHByb3ZpZGVkIGZvciB0aGUgdGVzdD8gVGhhdCB3b3VsZAo+IGp1c3QgcmVxdWlyZSB0
byBhZGQgYSBib29sIHBhcmFtZXRlciB0byB4Y19jcHVpZF9hcHBseV9wb2xpY3koKS4gSXQKPiBt
aWdodCBldmVuIGJlIHBvc3NpYmxlIHRvIHNlbGVjdCB0aGUgc2V0dGluZyBvbiB0aGUgYWZmZWN0
ZWQgaGFyZHdhcmUKPiBhdXRvbWF0aWNhbGx5LgoKRXhjZXB0IHRoYXQgdG8gYWx0ZXIgYmVoYXZp
b3IgYXMgbGl0dGxlIGFzIHBvc3NpYmxlLCB3ZSdkIHBlcmhhcHMKYmV0dGVyIHJlc3RyaWN0IHRo
aXMgdG8gYWZmZWN0ZWQgV2luZG93cyB2ZXJzaW9ucywgb3IgYXQgbW9zdCB0bwpXaW5kb3dzIGlu
IGdlbmVyYWwuIExpbnV4IGFmdGVyIGFsbCBsb29rcyB0byBiZSBzdWZmaWNpZW50bHkgZmluZQp3
aXRoIHRoZSBoYWNrZWQgdXAgQ1BVSUQgZGF0YSB3ZSBwcm92aWRlLgoKSmFuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
