Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C89189A60
	for <lists+xen-devel@lfdr.de>; Wed, 18 Mar 2020 12:17:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEWeq-0006BG-Is; Wed, 18 Mar 2020 11:14:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ggnj=5D=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jEWep-0006B7-ON
 for xen-devel@lists.xenproject.org; Wed, 18 Mar 2020 11:14:43 +0000
X-Inumbo-ID: aa93a252-6909-11ea-bac2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aa93a252-6909-11ea-bac2-12813bfff9fa;
 Wed, 18 Mar 2020 11:14:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BD01B244;
 Wed, 18 Mar 2020 11:14:42 +0000 (UTC)
To: Anthony PERARD <anthony.perard@citrix.com>
References: <20200226113355.2532224-1-anthony.perard@citrix.com>
 <20200226113355.2532224-17-anthony.perard@citrix.com>
 <e6d21a42-7a74-6ecd-4224-e093d289ee67@suse.com>
 <20200318104402.GC4088@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bab73b8e-5a5d-5183-17a3-37d8eed793e5@suse.com>
Date: Wed, 18 Mar 2020 12:14:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200318104402.GC4088@perard.uk.xensource.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [XEN PATCH v3 16/23] xen/build: introduce
 if_changed and if_changed_rule
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDMuMjAyMCAxMTo0NCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6Cj4gT24gV2VkLCBNYXIg
MDQsIDIwMjAgYXQgMDQ6NDU6MzZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDI2
LjAyLjIwMjAgMTI6MzMsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+Pj4gVGhlIGlmX2NoYW5nZWQg
bWFjcm8gZnJvbSBMaW51eCBjYW4gcmVjb3JkIHRoZSBjb21tYW5kIHVzZWQgdG8gYnVpbGQgYQo+
Pj4gdGFyZ2V0IHRoZW4gY29tcGFyZSBpdCBvbiByZWJ1aWxkLiBUaHVzIGlmIGEgY29tbWFuZCBo
YXMgY2hhbmdlZCwgZm9yCj4+PiBleGFtcGxlIGR1ZSB0byBpbnRyb2R1Y2luZyBuZXcgZmxhZ3Mg
aW4gQ0ZMQUdTIG9yIGR1ZSB0byB1c2luZyBhCj4+PiBkaWZmZXJlbnQgY29tcGlsZXIsIHRoZSB0
YXJnZXQgd2lsbCBiZSByZWJ1aWx0Lgo+Pgo+PiBBcyB0byB1c2luZyBhIGRpZmZlcmVudCBjb21w
aWxlciAtIEkgc3VwcG9zZSB0aGlzIG1lYW5zICJhIGNvbXBpbGVyCj4+IHdpdGggYSBkaWZmZXJl
bnQgZXhlY3V0YWJsZSBuYW1lIiBoZXJlPyBXaGF0IGFib3V0IG1lIGhhdmluZywgc2F5Cj4+IGdj
Yy01IGluIHVzZSwgYW5kIHRoZW4gdXBkYXRpbmcgbXkgc3lzdGVtIHN1Y2ggdGhhdCBhIDUuMiBi
YXNlZAo+PiBjb21waWxlciBvZiB0aGlzIG5hbWUgd291bGQgYmUgdXBncmFkZWQgdG8gYSA1LjQg
YmFzZWQgb25lIG9mIHRoaXMKPj4gc2FtZSBuYW1lLiBJZiB0aGlzIG5ld2VyIGNvbXBpbGVyIGhh
cyBiZXR0ZXIgY2FwYWJpbGl0aWVzICh0aGF0IHdlCj4+IHdvdWxkIHdhbnQgdG8gdXNlIGlmIGF2
YWlsYWJsZSksIHdvdWxkIHRoaXMgb3IgYW55dGhpbmcgZWxzZSB0cmlnZ2VyCj4+IGEgcmVidWls
ZCB0aGVuIHRvbz8KPiAKPiBJIHRoaW5rIEkgc2hvdWxkIGhhdmUgd3JpdHRlbiAiY29tbWFuZCBs
aW5lIiBpbnN0ZWFkIG9mIGp1c3QgImNvbW1hbmQiLgo+IFdoZW4gd3JpdGluZyBhYm91dCAiZGlm
ZmVyZW50IGNvbXBpbGVyIiBJIHdhcyBtb3N0bHkgdGhpbmtpbmcgYWJvdXQgR0NDCj4gdnMgY2xh
bmcsIG5vdCByZWFsbHkgYWJvdXQgdmVyc2lvbnMuIEkgdGhpbmsgTGludXggaGFzIHNvbWV0aGlu
ZyB0aGF0Cj4gZGV0ZWN0cyB3aGVuIHRoZSBjb21waWxlciB2ZXJzaW9uIGNoYW5nZXMsIGJ1dCB0
aGF0IG1heWJlIHRvIG9ubHkKPiB0cmlnZ2VyIGtjb25maWcsIHRvIHJlZ2VuZXJhdGUgdGhlIC5j
b25maWcgZmlsZS4KPiAKPiBCdXQgYXMgeW91IHNheSwgaWYgdGhlIG5ld2VyIGNvbXBpbGVyIGhh
cyBiZXR0ZXIgY2FwYWJpbGl0aWVzLCBhbmQgdGhlCj4gKkZMQUdTIGFyZSBjaGFuZ2VkLCB0aGVu
IHRoYXQgd291bGQgdHJpZ2dlciBhIHJlYnVpbGQgaWYgb3RoZXIKPiBkZXBlbmRlbmN5IGhhc24n
dCBjaGFuZ2VkLgoKIldvdWxkIiBhcyBpbiAid291bGQiLCBvciBtZXJlbHkgIml0IHdvdWxkIGJl
IG5pY2UgaWYgaXQgZGlkIj8gSSdtCnNpbXBseSBub3Qgc2VlaW5nIHdoZXJlIHN1Y2ggYSBkZXRl
Y3Rpb24gd291bGQgYmUgaGFwcGVuaW5nLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
