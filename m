Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B28F9B9090
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 15:23:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBInj-0002kG-UW; Fri, 20 Sep 2019 13:18:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WsuA=XP=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iBIni-0002k7-Ot
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 13:18:18 +0000
X-Inumbo-ID: 1affa0fd-dba9-11e9-968c-12813bfff9fa
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 1affa0fd-dba9-11e9-968c-12813bfff9fa;
 Fri, 20 Sep 2019 13:18:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D4881570;
 Fri, 20 Sep 2019 06:18:16 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD1FF3F67D;
 Fri, 20 Sep 2019 06:18:15 -0700 (PDT)
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1568388917-7287-1-git-send-email-olekstysh@gmail.com>
 <1568388917-7287-8-git-send-email-olekstysh@gmail.com>
 <631c94fe-d3ac-002b-0e1d-30b9b03158d1@arm.com>
 <aa7eb317-7807-71ba-8fe2-2e944516dcd6@gmail.com>
 <538a5486-2702-81f4-f925-c78542ff4118@arm.com>
 <1c1bb0b2-cb4d-24ea-75c8-573094bb8601@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <5d306b6f-b657-4668-4c79-f624ca9350a5@arm.com>
Date: Fri, 20 Sep 2019 14:18:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1c1bb0b2-cb4d-24ea-75c8-573094bb8601@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 7/8] iommu/arm: Introduce
 iommu_add_dt_device API
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDkvMjAxOSAxNDoyNiwgT2xla3NhbmRyIHdyb3RlOgo+IAo+IE9uIDE5LjA5LjE5IDE1
OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpLAo+IAo+IEhpLCBKdWxpZW4KCkhpLAoKPiAK
Pj4KPj4+Pj4gKwo+Pj4+PiAraW50IF9faW5pdCBpb21tdV9hZGRfZHRfZGV2aWNlKHN0cnVjdCBk
dF9kZXZpY2Vfbm9kZSAqbnApCj4+Pj4KPj4+PiBTb3JyeSB0byBvbmx5IHJlYWxpc2UgaXQgbm93
LiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGhhdmUgdGhpcyBmdW5jdGlvbiAKPj4+PiBpbXBsZW1l
bnRlZCBpbiB4ZW4vcGFzc3Rocm91Z2gvZGV2aWNlX3RyZWUuYz8gCj4+Pgo+Pj4gTm90IGVudGly
ZWx5IHN1cmUuIGRldmljZV90cmVlLmMgaXMgYSBjb21tb24gY29kZS4gVGhlIGlvbW11X2Z3c3Bl
YyBzdHVmZiAKPj4+ICh3aWRlbHkgdXNlZCBpbiB0aGlzIGZ1bmN0aW9uKSBpcyBBUk0gY29kZS4K
Pj4KPj4gU29tZSBvZiB0aGUgZGV2aWNlX3RyZWUuYyBhbHJlYWR5IGNvbnRhaW5zIEFybSBzcGVj
aWZpYyBjb2RlIChzdWNoIGFzIGRldmljZS5oKS4KPj4KPj4gRFQgaGFzIGJlZW4gb25seSB1c2Vk
IGJ5IEFybSBzbyBmYXIsIHNvIGl0IGlzIHNhZGx5IGZhaXJseSB0aWUgdG8gdGhlIAo+PiBhcmNo
aXRlY3R1cmUuIEJ1dCBpdCBzaG91bGQgYmUgZWFzeSB0byBtYWtlIGl0IGdlbmVyaWMgaWYgbmVl
ZHMgYmUgKHN1Y2ggYXMgCj4+IGZvciBSSVNDdikuCj4+Cj4+IFdoaWxlIGlvbW11X2Z3c3BlYyBp
cyBiZWVuIGltcGxlbWVudGVkIGluIEFybSBoZWFkZXJzLCB0aGlzIGNvdWxkIHBvdGVudGlhbGx5
IAo+PiBiZSBtYWRlIGNvbW1vbi4gU28gSSB3b3VsZCBzdGlsbCBwcmVmZXIgdGhpcyB0aGF0IGZ1
bmN0aW9uIGlzIG1vdmVkIGluIAo+PiBkZXZpY2VfdHJlZS5jCj4gCj4gV2VsbCwgd2lsbCBtb3Zl
LiBBbHNvIEkgd2lsbCByZW1vdmUgX19pbml0IGFzIGl0IGNhbiBiZSBjYWxsZWQgYXQgcnVudGlt
ZS4uLgo+IAo+IAo+IEFzIGZvciBydW50aW1lOgo+IAo+IFRoZSBjdXJyZW50IGltcGxlbWVudGF0
aW9uIGFsbG93cyB1cyB0byBmYWlsIGF0IGVhcmx5IHN0YWdlIGlmIHNvbWV0aGluZyBpcyAKPiB3
cm9uZyB3aXRoIHRoZSBkZXZpY2Ugd2hpY2ggaXMgYmVoaW5kIGFuIElPTU1VIChhbmQgbmVlZHMg
dG8gYmUgcHJvdGVjdGVkKS4gQXMgCj4gd2Ugc2NhbiBmb3IgYWxsIHByZXNlbnQgZGV2aWNlcywg
YnV0IG5vdCBvbmx5IGZvciAicGFzc3Rocm91Z2giLgo+IFRoZSAic3BsaXR0aW5nIiBpbnRvIGhh
bmRsZV9kZXZpY2UoKSBmb3IgaHdkb20gYW5kIGlvbW11X2RvX2R0X2RvbWN0bCgpIGZvciAKPiBv
dGhlciBndWVzdHMgd2lsbCBwb3N0cG9uZSBhbiBlcnJvciByZWNvZ25pdGlvbiB0byB0aGUgZ3Vl
c3QgZG9tYWluIGNyZWF0aW9uIAo+IHRpbWUuIFNvLCB3ZSB3b3VsZCBoYXZlIG5vbiBmdW5jdGlv
biBzeXN0ZW0gYW55d2F5LiBXb3VsZG4ndCBiZSBiZXR0ZXIgdG8gZmFpbCAKPiBlYXJseSBpbnN0
ZWFkIG9mIGNvbnRpbnVlIGFuZCBmYWlsIGFueXdheT8KClllcyB5b3VyIGltcGxlbWVudGF0aW9u
IGFsbG93cyB1cyB0byBmYWlsIGF0IGVhcmx5IHN0YWdlIGJ1dCB0aGVuIHlvdSBhcmUgCmFidXNp
bmcgdGhlIGZ1bmN0aW9uIGhhbmRsZV9kZXZpY2UoKS4gVGhlcmUgYXJlIGFjdHVhbGx5IG5vIHBy
b21pc2UgdGhpcyB3aWxsIGJlIApjYWxsZWQgZm9yIGV2ZXJ5IGRldmljZSBnb2luZyBmb3J3YXJk
LiBUaGluayBhYm91dCBkb20wbGVzcyB3aGVyZSB0aGUgZ29hbCBpcyB0byAKaGF2ZSBubyBkb20w
IGF0IGFsbC4KCllvdSBhcmUgYWxzbyB0eWluZyB0aGUgb3JkZXIgb2YgdGhlIGRvbWFpbnMgY3Jl
YXRpb24gYXMgZG9tMCB3b3VsZCBoYXZlIHRvIGJlIAphbHdheXMgY3JlYXRlZCBiZWZvcmUgYW55
IG90aGVyIGRvbWFpbnMgYXJlIGNyZWF0ZWQuCgpTaW1pbGFyIChhYil1c2Ugb2YgaGFuZGxlX2Rl
dmljZSgpIGRvZXMgbm90IGV4aXN0LCBzbyBJIHdvdWxkIHJhdGhlciBub3Qgc3RhcnQgCnRvIGlu
dHJvZHVjZSB0aGVtIGJlY2F1c2UgdGhpcyB3aWxsIGJlY29tZSBxdWlja2x5IHVubWFpbnRhaW5h
YmxlIGFzIHdlIGFyZSAKbWl4aW5nIGRvbTAgY3JlYXRpb24gYW5kIFhlbiBpbml0aWFsaXphdGlv
bi4KCkV2ZW4gd2l0aG91dCB0aGlzIHNlcmllcywgYXNzaWduaW5nIGEgZGV2aWNlIHRvIHRoZSBn
dWVzdCBtYXkgbm90IGJlIGEgc3VjY2VzcyAKYmVjYXVzZSB0aGUgSU9NTVUgbWF5IG5vdCBoYXZl
IGVub3VnaCBjb250ZXh0IGJhbmsgKHVzZWQgZm9yIGNvbmZpZ3VyaW5nIHRoZSAKSU9NTVUgc3Rh
Z2UtMikgb3IgdGhlcmUgYXJlIG5vdCBlbm91Z2ggbWVtb3J5LiBOb3QgYmVlbiBhYmxlIHRvIGFk
ZCB0aGUgZGV2aWNlIAp0byB0aGUgSU9NTVUgZHJpdmVyIGlzIG9ubHkgYW5vdGhlciBleGFtcGxl
IHdoZXJlIGl0IG1heSBmYWlsLgoKQnV0IEkgd291bGQgbm90IGNvbnNpZGVyIHRoaXMgYXMgbm90
IGZ1bmN0aW9uYWwuIFRoZSByZXN0IG9mIHlvdXIgc3lzdGVtIG1heSAKd29yayBwZXJmZWN0bHkg
ZXZlbiBpZiB0aGlzIHBhcnRpY3VsYXIgZGV2aWNlIGlzIG5vdCB1c2FibGUuIFRoZXJlIGFyZSBu
byAKc2VjdXJpdHkgcmlzayBhcyB0aGUgSU9NTVUgc2hvdWxkIGJsb2NrIGFueSB0cmFuc2FjdGlv
biBieSBkZWZhdWx0LgoKSSBhbSBhbHNvIG5vdCBpbiBmYXZvciBvZiBwYXJzaW5nIGFnYWluIHRo
ZSBEZXZpY2UtVHJlZSAod2UgaGF2ZSBlbm91Z2ggb2YgCnRoZW0pLCBzbyB0aGlzIGlzIHRoZSBi
ZXN0IHNvbHV0aW9uIEkgY2FuIGNvbWUgdXAuIEZlZWwgZnJlZSB0byBzdWdnZXN0IApzb21ldGhp
bmcgZGlmZmVyZW50LgoKQ2hlZXJzLAoKLS0gCkp1bGllbiBHcmFsbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
