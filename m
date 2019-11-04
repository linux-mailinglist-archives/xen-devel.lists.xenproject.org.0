Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB59EE561
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 18:00:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRffL-000722-GK; Mon, 04 Nov 2019 16:57:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=M3pU=Y4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iRffK-00071x-EB
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 16:57:18 +0000
X-Inumbo-ID: 2839cc86-ff24-11e9-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2839cc86-ff24-11e9-9631-bc764e2007e4;
 Mon, 04 Nov 2019 16:57:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9DBBEACA4;
 Mon,  4 Nov 2019 16:57:16 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20191031192804.19928-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce01ce32-3ac2-ade9-6e2c-1b1fcdb165ee@suse.com>
Date: Mon, 4 Nov 2019 17:57:21 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191031192804.19928-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/vcpu: Sanitise VCPUOP_initialise call
 hierachy
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
Cc: Juergen Gross <jgross@suse.com>, StefanoStabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMTAuMjAxOSAyMDoyOCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGNvZGUgaXMg
ZXNwZWNpYWxseSB0YW5nbGVkLiAgVkNQVU9QX2luaXRpYWxpc2UgY2FsbHMgaW50bwo+IGFyY2hf
aW5pdGlhbGlzZV92Y3B1KCkgd2hpY2ggY2FsbHMgYmFjayBpbnRvIGRlZmF1bHRfaW5pdGlhbGlz
ZV92Y3B1KCkgd2hpY2gKPiBpcyBjb21tb24gY29kZS4KPiAKPiBUaGlzIHBhdGggaXMgYWN0dWFs
bHkgZGVhZCBjb2RlIG9uIEFSTSwgYmVjYXVzZSBWQ1BVT1BfaW5pdGlhbGlzZSBpcyBmaWx0ZXJl
ZAo+IG91dCBieSBkb19hcm1fdmNwdV9vcCgpLgo+IAo+IFRoZSBvbmx5IHZhbGlkIHdheSB0byBz
dGFydCBhIHNlY29uZGFyeSBDUFUgb24gQVJNIGlzIHZpYSB0aGUgUFNDSSBpbnRlcmZhY2UuCj4g
VGhlIHNhbWUgY291bGQgaW4gcHJpbmNpcGxlIGJlIHNhaWQgYWJvdXQgSU5JVC1TSVBJLVNJUEkg
Zm9yIHg4NiBIVk0sIGlmIEhWTQo+IGd1ZXN0cyBoYWRuJ3QgYWxyZWFkeSBpbnRlcml0ZWQgYSBw
YXJhdmlydCB3YXkgb2Ygc3RhcnRpbmcgQ1BVcy4KPiAKPiBFaXRoZXIgd2F5LCBpdCBpcyBxdWl0
ZSBsaWtlbHkgdGhhdCBubyBmdXR1cmUgYXJjaGl0ZWN0dXJlcyBpbXBsZW1lbnRlZCBpbiBYZW4K
PiBhcmUgZ29pbmcgdG8gd2FudCB0byB1c2UgYSBQViBpbnRlcmZhY2UsIGFzIHNvbWUgc3RhbmRh
cmRpc2VkICh2KUNQVSBicmluZ3VwCj4gbWVjaGFuaXNtIHdpbGwgYWxyZWFkeSBleGlzdC4KPiAK
PiBBcnJhbmdlIHRoZSBjb2RlIGluIGRvX3ZjcHVfb3AoKSB0byBhbGxvdyBhcmNoX2luaXRpYWxp
c2VfdmNwdSgpIHRvIGJlCj4gb3B0aW9uYWwuICBPcHQgaW4gZm9yIHg4NiwgYW5kIG9wdCBvdXQg
Zm9yIEFSTS4KPiAKPiBEZWxldGluZyBBUk0ncyBhcmNoX2luaXRpYWxpc2VfdmNwdSgpIGFsbG93
cyBmb3IgZGVmYXVsdF9pbml0aWFsaXNlX3ZjcHUoKSB0bwo+IGJlIGZvbGRlZCBpbnRvIGl0cyAo
bm93KSBzb2xlIHg4NiBjYWxsZXIsIHdoaWNoIHJlZHVjZXMgdGhlIGNvbXBpbGVkIGNvZGUKPiB2
b2x1bWUgaW4gYWxsIGJ1aWxkcy4KPiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKSSBj
YW4gc2VlIHRoZSBtZXJpdHMgb2YgdGhpcywgYnV0IEkgY2FuIGFsc28gdW5kZXJzdGFuZCBKdWxp
ZW4ncwpyZXNlcnZhdGlvbnMuIEhlbmNlIEkgZ3Vlc3Mgd2hldGhlciB0byBhY2sgdGhpcyB3aWxs
IGRlcGVuZCBvbiB0aGUKZGlzY3Vzc2lvbiB3aXRoIGhpbSBnZXR0aW5nIHNldHRsZWQuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
