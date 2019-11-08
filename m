Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54509F4B4B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2019 13:16:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iT39W-00065b-NT; Fri, 08 Nov 2019 12:14:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uDOX=ZA=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iT39V-00065W-4N
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2019 12:14:09 +0000
X-Inumbo-ID: 4353ed6c-0221-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4353ed6c-0221-11ea-b678-bc764e2007e4;
 Fri, 08 Nov 2019 12:14:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F30BCAE00;
 Fri,  8 Nov 2019 12:14:06 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, "Durrant, Paul" <pdurrant@amazon.com>
References: <f9e3fb8cadf44352851d865e850c6525@EX13D32EUC003.ant.amazon.com>
 <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <900c2b35-5296-0b74-b6ed-2f8f5e0474f5@suse.com>
Date: Fri, 8 Nov 2019 13:14:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <86d72e83-abf6-bef3-418f-49a69545fcb5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] max_grant_frames/max_maptrack_frames
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMTEuMTkgMTI6MzgsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDA4LjExLjIwMTkgMDk6
NDUsICBEdXJyYW50LCBQYXVsICB3cm90ZToKPj4gV2hlbiBwZXItZG9tYWluIG9wdGlvbnMgZm9y
IG1heGltdW0gZ3JhbnQgYW5kIG1hcHRyYWNrIGZyYW1lcyBjYW1lIGluIChpbiA0LjEwPykgWGVu
J3MgYmVoYXZpb3VyIHcuci50LiB0byB0aGUgZ2xvYmFsIGNvbW1hbmQgbGluZSB2YWx1ZXMgKGdu
dHRhYl9tYXhfZnJhbWVzIGFuZCBnbnR0YWJfbWF4X21hcHRyYWNrX2ZyYW1lcyByZXNwZWN0aXZl
bHkpIHJlZ3Jlc3NlZAo+Pgo+PiBGb3IgZXhhbXBsZSwgYSBob3N0IHJ1bm5pbmcgYSBwcmlvciB2
ZXJzaW9uIG9mIFhlbiB3aXRoIGEgY29tbWFuZCBsaW5lIHNldHRpbmcgZ250dGFiX21heF9mcmFt
ZXM9MTI4IHdvdWxkIGhhdmUgYWxsIG9mIGl0cyBkb21VcyBydW5uaW5nIHdpdGggMTI4IGZyYW1l
cy4gSG93ZXZlciwgYWZ0ZXIgdXBkYXRlIHRvIGEgbmV3ZXIgWGVuLCB0aGV5IHdpbGwgb25seSBn
ZXQgMzIgZnJhbWVzICh1bmxlc3MgdGhlIGhvc3QgaXMgcGFydGljdWxhcmx5IGxhcmdlLCBpbiB3
aGljaCBjYXNlIHRoZXkgd2lsbCBnZXQgNjQpLiBXaHkgaXMgdGhpcz8gSXQncyBiZWNhdXNlIG5l
aXRoZXIgeGwuY2ZnIGZpbGVzLCBub3IgeGwuY29uZiwgd2lsbCBzcGVjaWZ5IHZhbHVlcyAoYmVj
YXVzZSB0aGUgc2NlbmFyaW8gaXMgYW4gdXBkYXRlIGZyb20gYW4gb2xkZXIgaW5zdGFsbGF0aW9u
KSBhbmQgc28gdGhlIGhhcmRjb2RlZCAzMi82NCBkZWZhdWx0IGFwcGxpZXMuIEhlbmNlIHNvbWUg
ZG9tVXMgd2l0aCBsYXJnZSBudW1iZXJzIG9mIFBWIGRldmljZXMgc3RhcnQgZmFpbGluZyAob3Ig
YXQgbGVhc3Qgc3Vic3RhbnRpYWxseSBzbG93IGRvd24pIGFuZCBhZG1pbnMgc3RhcnQgd29uZGVy
aW5nIHdoYXQncyBnb2luZyBvbi4KPj4KPj4gU28gaG93IGJlc3QgdG8gZml4IHRoaXM/Cj4+Cj4+
IEZvciB0aGUgc2FrZSBvZiBhIHF1aWNrIGZpeCBmb3IgdGhlIHJlZ3Jlc3Npb24sIGFuZCBlYXNl
IG9mIGJhY2stcG9ydGluZywgSSB0aGluayBpdCB3b3VsZCBiZSBiZXN0IHRvIGFkZCBhIGNoZWNr
IGluIGRvbWFpbl9jcmVhdGUoKSBhbmQgY3JlYXRlIHRoZSBncmFudCB0YWJsZSB3aXRoIHBhcmFt
ZXRlcnMgd2hpY2ggYXJlIHRoZSBsYXJnZXIgb2YgdGhlIHRvb2xzdGFjayBjb25maWd1cmVkIHZh
bHVlIGFuZCB0aGUgY29ycmVzcG9uZGluZyBjb21tYW5kIGxpbmUgdmFsdWUuCj4gCj4gSG93IGFi
b3V0IHBlb3BsZSBzaW1wbHkgc2V0dGluZyB0aGUgdmFsdWUgaW4geGwuY29uZiwgaWYgaW5kZWVk
IGluIGNhbiBiZQo+IHNldCB0aGVyZT8KPiAKPj4gVGhpcyBkb2VzLCBob3dldmVyLCBnbyBhZ2Fp
bnN0IHRoZSByZWNlbnQgZGlyZWN0aW9uIG9mIHRoZSB0b29sc3RhY2sgZ2V0dGluZyBleGFjdGx5
IHdoYXQgaXQgYXNrZWQgZm9yLiBTbyBmb3IgdGhlIGxvbmdlciB0ZXJtIEkgYW0gd29uZGVyaW5n
IHdoZXRoZXIgdGhlcmUgb3VnaHQgdG8gYmUgYSB3YXkgZm9yIHRoZSB0b29sc3RhY2sgdG8gcXVl
cnkgdGhlIGdsb2JhbGx5IGNvbmZpZ3VyZWQgZ3JhbnQgdGFibGUgbGltaXRzLiBBIEdOVFRBQk9Q
IHNlZW1zIHRoZSB3cm9uZyBjYW5kaWRhdGUgZm9yIHRoaXMsIHNpbmNlIEdOVFRBQk9QcyBhcmUg
cGVyLWRvbWFpbiwgc28gSSdtIHdvbmRlcmluZyBhYm91dCBhIG5ldyBzeXNjdGwgdG8gcmV0dXJu
IHRoZSB2YWx1ZSBvZiBhIG5hbWVkIGNvbW1hbmQgbGluZSBwYXJhbWV0ZXIuCj4gCj4gU3VjaCBh
IHNlcmllcyB3YXMgYWxyZWFkeSBwb3N0ZWQgKGFuZCBldmVuIGhhZCBzb21lIHJldmlldywgc28g
aXQncwo+IGFscmVhZHkgYXQgdjQsIGJ1dCBpaXJjIG5vIHVwZGF0ZSBoYXMgYmVlbiBwcm92aWRl
ZCBzaW5jZSBNYXkpOgo+IGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRt
bC94ZW4tZGV2ZWwvMjAxOS0wNS9tc2cwMjIwNi5odG1sCgpNeSAiSHlwZXJ2aXNvciBmaWxlIHN5
c3RlbSIgc2VyaWVzIGluY2x1ZGVzIHRoYXQgZnVuY3Rpb25hbGl0eToKCmh0dHBzOi8vcGF0Y2hl
dy5vcmcvWGVuLzIwMTkxMDAyMTEyMDA0LjI1NzkzLTEtamdyb3NzQHN1c2UuY29tLwoKCkp1ZXJn
ZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
