Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D951E43750
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 16:44:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbQv0-0000Vw-IK; Thu, 13 Jun 2019 14:41:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=xsGU=UM=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hbQuz-0000Vo-Be
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 14:41:33 +0000
X-Inumbo-ID: 54b4035a-8de9-11e9-930e-2b47d028eb4c
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 54b4035a-8de9-11e9-930e-2b47d028eb4c;
 Thu, 13 Jun 2019 14:41:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77027367;
 Thu, 13 Jun 2019 07:41:29 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 027363F718;
 Thu, 13 Jun 2019 07:41:27 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
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
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
Date: Thu, 13 Jun 2019 15:41:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5D0252300200007800237E93@prv1-mh.provo.novell.com>
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, andrii.anisov@gmail.com,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKT24gMTMvMDYvMjAxOSAxNDo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24g
MTMuMDYuMTkgYXQgMTU6MTQsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6Cj4+IEkgYW0g
bm90IGFza2luZyB5b3UgdG8gc3BlbmQgYSBsb3Qgb2YgdGltZSBvbiBpdC4gQnV0IGlmIHlvdSBo
YXZlIGEgZ3V0IGZlZWxpbmcKPj4gdGhpcyBjYW4gYmUgZG9uZSwgdGhlbiBhIGxpdHRsZSBoZWxw
IHdvdWxkIGJlIGV4dHJlbWVseSB1c2VmdWwuLi4KPiAKPiAuLi4gSSB0aG91Z2h0IEkgaGFkIGFs
cmVhZHkgb3V0bGluZWQgYSBtb2RlbDogQWxsb3cgY3Jvc3MtdkNQVSB1cGRhdGVzCj4gb25seSB3
aGlsZSB0aGUgdGFyZ2V0IHZDUFUgaXMgc3RpbGwgb2ZmbGluZS4gT25jZSBvbmxpbmUsIGEgdkNQ
VSBjYW4gb25seQo+IGl0c2VsZiB1cGRhdGUgaXRzIHJ1bnN0YXRlIGFyZWEgYWRkcmVzcy4gSSB0
aGluayB5b3UgY2FuIGdldCBhd2F5Cj4gd2l0aG91dCBhbnkgbG9ja3MgaW4gdGhpcyBjYXNlOyB0
aGVyZSBtYXkgYmUgYSBjb3JuZXIgY2FzZSB3aXRoIGEgdkNQVQo+IGJlaW5nIG9ubGluZWQgcmln
aHQgYXQgdGhhdCBwb2ludCBpbiB0aW1lLCBzbyB0aGVyZSBtYXkgbmVlZCB0byBiZSBhIG1vcmUK
PiBzdHJpY3QgY29uZGl0aW9uIChsaWtlICJvbmx5IG9uZSBvbmxpbmUgdkNQVSIgaW5zdGVhZCBv
ZiAidGhlIHRhcmdldCB2Q1BVCj4gaXMgb2ZmbGluZSIpLgoKU29ycnkgSSBtYXkgaGF2ZSBtaXNz
ZWQgaXQuIFdlIGNhbid0IHJlYWxseSByZXN0cmljdCB0aGUgdXNhZ2Ugb2YgdGhlIGN1cnJlbnQg
Cmh5cGVyY2FsbCAoaXQgaXMgcHJldHR5IGxheCkuIFNvIEkgdGhpbmsgYW55IGxvY2tsZXNzIHNv
bHV0aW9uIHdvdWxkIHJlcXVpcmUgdG8gCmFsbG93IHRoZSBoeXBlcmNhbGwKdG8gYmUgdXNlZCB0
b2dldGhlciAod2hpY2ggSSB3YW50IHRvIGF2b2lkKS4KCklmIHdlIGFncmVlIHRvIGFsbG93IHRo
ZSB0d28gaHlwZXJjYWxscyB0byBiZSB1c2VkIHRvZ2V0aGVyLCB0aGVuIGlmIHdlIHByb3RlY3Qg
CnRoZSB1cGRhdGUgd2l0aCBkb21haW5fbG9jaygpIHRoZW4geW91IHNob3VsZCBiZSBhYmxlIHRv
IGF2b2lkIGFueSByYWNlIHdpdGggdGhlIAp1cGRhdGUgcGF0aCBhcyBvbmxpbmluZyBhIHZDUFUg
cmVxdWlyZXMgdG8gdGFrZSB0aGUgZG9tYWluX2xvY2soKSAoc2VlIApkb192Y3B1X29wIGZvciB4
ODYgYW5kIGRvX2NvbW1vbl9jcHVfb24gZm9yIEFybSkuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdy
YWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
