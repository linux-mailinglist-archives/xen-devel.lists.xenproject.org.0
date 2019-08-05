Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFA81FED
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 17:16:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huefW-0005HL-L5; Mon, 05 Aug 2019 15:13:02 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LNZA=WB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1huefV-0005HG-0N
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 15:13:01 +0000
X-Inumbo-ID: 825e1898-b793-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 825e1898-b793-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 15:12:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0662AAFA9;
 Mon,  5 Aug 2019 15:12:57 +0000 (UTC)
To: George Dunlap <george.dunlap@citrix.com>, Wei Liu <wei.liu2@citrix.com>
References: <20190314115937.26394-1-jgross@suse.com>
 <20190314115937.26394-2-jgross@suse.com>
 <667b2ee6-fc6f-64e6-5977-2c69a9d97a95@citrix.com>
 <95fd63f7-e7fe-bbb0-a2df-a634d3f05867@suse.com>
 <20190404132725.GO14641@zion.uk.xensource.com>
 <25e2994c-3954-86d3-39da-749f3a3f01f0@suse.com>
 <3037198b-fe2a-5746-2ffa-1d17fbb6547c@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <00f0c1ca-4209-9959-cd43-0a548f651f79@suse.com>
Date: Mon, 5 Aug 2019 17:12:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3037198b-fe2a-5746-2ffa-1d17fbb6547c@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 1/2] xen: add interface for obtaining
 .config from hypervisor
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMTkgMTc6MDcsIEdlb3JnZSBEdW5sYXAgd3JvdGU6Cj4gT24gNC80LzE5IDI6MzUg
UE0sIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IE9uIDA0LzA0LzIwMTkgMTU6MjcsIFdlaSBMaXUg
d3JvdGU6Cj4+PiBPbiBGcmksIE1hciAxNSwgMjAxOSBhdCAwNToyOToyOFBNICswMTAwLCBKdWVy
Z2VuIEdyb3NzIHdyb3RlOgo+Pj4+IE9uIDE1LzAzLzIwMTkgMTY6NTUsIEFuZHJldyBDb29wZXIg
d3JvdGU6Cj4+Pj4+IE9uIDE0LzAzLzIwMTkgMTE6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+
Pj4+PiBAQCAtMTEwMCw2ICsxMTAwLDIwIEBAIHR5cGVkZWYgc3RydWN0IHhlbl9zeXNjdGxfY3B1
X3BvbGljeSB4ZW5fc3lzY3RsX2NwdV9wb2xpY3lfdDsKPj4+Pj4+ICAgREVGSU5FX1hFTl9HVUVT
VF9IQU5ETEUoeGVuX3N5c2N0bF9jcHVfcG9saWN5X3QpOwo+Pj4+Pj4gICAjZW5kaWYKPj4+Pj4+
ICAgCj4+Pj4+PiArLyoKPj4+Pj4+ICsgKiBYRU5fU1lTQ1RMX2dldF9jb25maWcKPj4+Pj4+ICsg
Kgo+Pj4+Pj4gKyAqIFJldHVybiBnemlwLWVkIC5jb25maWcgZmlsZQo+Pj4+Pgo+Pj4+PiBJIGRv
bid0IHRoaW5rIGl0IGlzIHdpc2UgdG8gYmFrZSBnemlwIGludG8gdGhlIEFQSS7CoCBUaGVzZSBk
YXlzLCB0aGVyZQo+Pj4+PiByZWFsbHkgYXJlIGJldHRlciBvcHRpb25zIHRoYW4gZ3ppcCBib3Ro
IGluIHRlcm1zIG9mIGNvbXByZXNzaW9uIHJhdGlvCj4+Pj4+IGFuZCBkZWNvbXByZXNzIHNwZWVk
Lgo+Pj4+Pgo+Pj4+PiBJJ2Qgc3VnZ2VzdCBqdXN0IHNheWluZyAiZmlsZSBtYXkgYmUgY29tcHJl
c3NlZCIgYW5kIGxlYXZlIGl0IHVwIHRvIHRoZQo+Pj4+PiBwYWNrYWdlcnMgYnVpbGQgc3lzdGVt
IGFuZCBgeGxgIGNob2ljZXMgdG8gYWdyZWUgb24gd2hpY2ggY29tcHJlc3Npb24KPj4+Pj4gKGlm
IGFueSkgdG8gdXNlLgo+Pj4+Cj4+Pj4gSSBhbSBub3QgY29udmluY2VkIHRoaXMgaXMgYSBnb29k
IGlkZWEuIEkgdGhpbmsgdGhlIGRhdGEgZm9ybWF0IHNob3VsZAo+Pj4+IGJlIHNwZWNpZmllZC4K
Pj4+Pgo+Pj4+IEFuZCBUQkg6IHRoZSBkaWZmZXJlbmNlIGluIHNpemUgZm9yIGEgcmF0aGVyICJu
b3JtYWwiIC5jb25maWcgaXMgYWJvdXQKPj4+PiA1MCBieXRlcyAoSSB0cmllZCBnemlwLCB4eiBh
bmQgYnppcDIgd2l0aCBnemlwIHByb2R1Y2luZyB0aGUgc21hbGxlc3QKPj4+PiByZXN1bHQpLgo+
Pj4KPj4+IEhhcyB0aGlzIGJlZW4gcmVzb2x2ZWQ/Cj4+Pgo+Pj4gSSBkb24ndCByZWFsbHkgaGF2
ZSBhbiBvcGluaW9uIG9uIHRoaXMuCj4+Cj4+IEkgZ290IG5vIHJlcGx5IGZvciB0aGF0IGFuc3dl
ci4KPiAKPiBZb3UgZG9uJ3QgbmVlZCBhIHJlcGx5OyBpZiBhIHN1Z2dlc3Rpb24gaXMgbWFkZSwg
YW5kIHlvdSBleHBsYWluIHdoeSB5b3UKPiBkb24ndCBsaWtlIGl0LCB0aGVuIGl0J3MgdXAgdG8g
dGhlIG90aGVyIHBlcnNvbiB0byB1bmFiaWd1b3VzbHkgTmFjayBpdAo+IGlmIHRoZXkgZG9uJ3Qg
bGlrZSBpdDsgc2lsZW5jZSBpcyBpbnRlcnByZXRlZCBhcyBjb25zZW50Lgo+IAo+IFRvIG1vdmUg
dGhpcyBmb3J3YXJkLCBJJ2Qgc3VnZ2VzdCByZS1wb3N0aW5nIGl0LCBhZGRpbmcgYSBjb21tZW50
IGFib3V0Cj4gdGhlIGNob2ljZSBvZiBjb21wcmVzc2lvbiBhbGdvcml0aG0gaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLgoKQXQgdGhlIHN1bW1pdCB3ZSBoYWQgYSBkaXNjdXNzaW9uIGFib3V0IGEgc2lt
cGxlIG5hbWUtdmFsdWUgc3RvcmUgaW4gdGhlCmh5cGVydmlzb3IgZm9yIGUuZy4gY29tbXVuaWNh
dGluZyBtaXRpZ2F0aW9uIHNldHRpbmdzIG9yIHJ1bnRpbWUgcGFyYW0Kc2V0dGluZ3MgdG8gYXQg
bGVhc3QgZG9tMC4gVGhlIC5jb25maWcgdXNlZCBmb3IgYnVpbGRpbmcgWGVuIHdhcyBhZ3JlZWQK
dG8gYmUgYW5vdGhlciBjYW5kaWRhdGUgZm9yIHRoYXQgaW50ZXJmYWNlLgoKSSB3YW50ZWQgdG8g
aGF2ZSBhIGxvb2sgYXQgdGhhdCB3aGVuIEknbSBmaW5pc2hlZCB3aXRoIG90aGVyIHVyZ2VudCB3
b3JrCkknbSBhY3R1YWxseSBkb2luZy4KCgpKdWVyZ2VuCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
