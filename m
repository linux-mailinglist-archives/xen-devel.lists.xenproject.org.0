Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 285DA46129
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 16:42:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbnMm-0000hD-DY; Fri, 14 Jun 2019 14:39:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwC2=UN=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbnMl-0000h8-5d
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 14:39:43 +0000
X-Inumbo-ID: 3dc3592e-8eb2-11e9-b295-d72d9d278ecd
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3dc3592e-8eb2-11e9-b295-d72d9d278ecd;
 Fri, 14 Jun 2019 14:39:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 251A6344;
 Fri, 14 Jun 2019 07:39:40 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A8FEB3F246;
 Fri, 14 Jun 2019 07:39:38 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
Date: Fri, 14 Jun 2019 15:39:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQvMDYvMjAxOSAxNTozNiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBIZWxsbyBKdWxpZW4s
CgpIaSwKCj4gT24gMTMuMDYuMTkgMTc6NDEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4gU29ycnkg
SSBtYXkgaGF2ZSBtaXNzZWQgaXQuIFdlIGNhbid0IHJlYWxseSByZXN0cmljdCB0aGUgdXNhZ2Ug
b2YgdGhlIGN1cnJlbnQgCj4+IGh5cGVyY2FsbCAoaXQgaXMgcHJldHR5IGxheCkuIFNvIEkgdGhp
bmsgYW55IGxvY2tsZXNzIHNvbHV0aW9uIHdvdWxkIHJlcXVpcmUgCj4+IHRvIGFsbG93IHRoZSBo
eXBlcmNhbGwKPj4gdG8gYmUgdXNlZCB0b2dldGhlciAod2hpY2ggSSB3YW50IHRvIGF2b2lkKS4K
PiAKPiBJJ2QgYmV0dGVyIHNheSBoZXJlIGFsbG93aW5nIHVzaW5nIHBoeXMgYW5kIHZpcnQgcmVn
aXN0ZXJlZCBydW5zdGF0ZXMgdG9nZXRoZXIgCj4gKGFuZCBpbmRlcGVuZGVudGx5KS4KPiBBbmQg
bWUgcGVyc29uYWxseSBmb3IgdGhpcyBhcHByb2FjaCwgZm9yIHN1cmUgbm90IGVuY291cmFnaW5n
IHVzZXJzIChndWVzdHMpIHRvIAo+IGRvIHNvLgoKV2h5PyBXaGF0IGFyZSB0aGUgYmVuZWZpdHMg
Zm9yIGEgZ3Vlc3QgdG8gdXNlIHRoZSB0d28gaW50ZXJmYWNlIHRvZ2V0aGVyPyBBZnRlciAKYWxs
IHRoZXkgaGF2ZSBleGFjdGx5IHRoZSBzYW1lIGRhdGEuLi4KCj4gCj4+IElmIHdlIGFncmVlIHRv
IGFsbG93IHRoZSB0d28gaHlwZXJjYWxscyB0byBiZSB1c2VkIHRvZ2V0aGVyLCB0aGVuIGlmIHdl
IAo+PiBwcm90ZWN0IHRoZSB1cGRhdGUgd2l0aCBkb21haW5fbG9jaygpIHRoZW4geW91IHNob3Vs
ZCBiZSBhYmxlIHRvIGF2b2lkIGFueSAKPj4gcmFjZSB3aXRoIHRoZSB1cGRhdGUgcGF0aCBhcyBv
bmxpbmluZyBhIHZDUFUgcmVxdWlyZXMgdG8gdGFrZSB0aGUgCj4+IGRvbWFpbl9sb2NrKCkgKHNl
ZSBkb192Y3B1X29wIGZvciB4ODYgYW5kIGRvX2NvbW1vbl9jcHVfb24gZm9yIEFybSkuCj4gCj4g
Q291bGQgeW91IHBsZWFzZSBjbGFyaWZ5IGFyZSB5b3Ugc2F5aW5nIGFib3V0IHByb3RlY3Rpb24g
cnVuc3RhdGUgbWFwcGluZyB1cGRhdGUgCj4gb3IgcnVuc3RhdGUgdmFsdWVzIHVwZGF0ZT8KCnJ1
bnN0YXRlIG1hcHBpbmcuCj4gQlRXLCBJJ20gYSBiaXQgY29uZnVzZWQsIGFyZSB5b3UgT0sgd2l0
aCBsb2NrIChub3QgdHJ5bG9jaykgZXhpc3RpbmcgaW4gaHlwZXJjYWxsPwoKVGhpcyBpcyBzdGls
bCBpbiBkaXNjdXNzaW9uLgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
