Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5230F10C144
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 02:08:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ia8GP-0000zs-CU; Thu, 28 Nov 2019 01:06:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=S3ai=ZU=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ia8GO-0000zl-Av
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 01:06:32 +0000
X-Inumbo-ID: 4a46a1f0-117b-11ea-83b8-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a46a1f0-117b-11ea-83b8-bc764e2007e4;
 Thu, 28 Nov 2019 01:06:21 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BC9D2158A;
 Thu, 28 Nov 2019 01:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574903181;
 bh=uaB3mtFMO5egteCoStMhSeRFBaD0p+dPCJFxQm7xsGE=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=nFrSC+BOE2ldK46qk2xNPRH047vhDei6yYfbIOkwE2CgbwAt5nojJsEQ+p/zMtLDG
 fN62uU27Ipg7A/KPK2id66MTLAwruAuFqfLfRR6qCP1nngi9BQCGf5wfcZ6AW1lKUw
 VWYrvKp/YqipTxIcRabjmQ3ql2mr49vp421trTbg=
Date: Wed, 27 Nov 2019 17:06:19 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
Message-ID: <alpine.DEB.2.21.1911271659170.27669@sstabellini-ThinkPad-T480s>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <cover.1569525222.git.lars.kurth@citrix.com>
 <749f082bdb996ba7c7362847b22030882dc2903f.1569525222.git.lars.kurth@citrix.com>
 <f28e67ef-2f93-3b61-bc52-304f82c3e44a@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 5/6] Add guide on Communication Best
 Practice
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
Cc: Lars Kurth <lars.kurth@xenproject.org>, Lars Kurth <lars.kurth@citrix.com>,
 xen-api@lists.xenproject.org, minios-devel@lists.xenproject.org,
 committers@xenproject.org, mirageos-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org, win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyNyBTZXAgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjYuMDkuMjAxOSAy
MTozOSwgTGFycyBLdXJ0aCB3cm90ZToKPiA+ICsjIyMgVmVyYm9zZSB2cy4gdGVyc2UKPiA+ICtE
dWUgdG8gdGhlIHRpbWUgaXQgdGFrZXMgdG8gcmV2aWV3IGFuZCBjb21wb3NlIGNvZGUgcmV2aWV3
ZXIsIHJldmlld2VycyBvZnRlbiBhZG9wdCBhCj4gPiArdGVyc2Ugc3R5bGUuIEl0IGlzIG5vdCB1
bnVzdWFsIHRvIHNlZSByZXZpZXcgY29tbWVudHMgc3VjaCBhcwo+ID4gKz4gdHlwbwo+ID4gKz4g
cy9yZXNpb25zL3JlZ2lvbnMvCj4gPiArPiBjb2Rpbmcgc3R5bGUKPiA+ICs+IGNvZGluZyBzdHls
ZTogYnJhY2tldHMgbm90IG5lZWRlZAo+ID4gK2V0Yy4KPiA+ICsKPiA+ICtUZXJzZSBjb2RlIHJl
dmlldyBzdHlsZSBoYXMgaXRzIHBsYWNlIGFuZCBjYW4gYmUgcHJvZHVjdGl2ZSBmb3IgYm90aCB0
aGUgcmV2aWV3ZXIgYW5kCj4gPiArdGhlIGF1dGhvci4gSG93ZXZlciwgb3ZlcnVzZSBjYW4gY29t
ZSBhY3Jvc3MgYXMgdW5mcmllbmRseSwgbGFja2luZyBlbXBhdGh5IGFuZAo+ID4gK2NhbiB0aHVz
IGNyZWF0ZSBhIG5lZ2F0aXZlIGltcHJlc3Npb24gd2l0aCB0aGUgYXV0aG9yIG9mIGEgcGF0Y2gu
IFRoaXMgaXMgaW4gcGFydGljdWxhcgo+ID4gK3RydWUsIHdoZW4geW91IGRvIG5vdCBrbm93IHRo
ZSBhdXRob3Igb3IgdGhlIGF1dGhvciBpcyBhIG5ld2NvbWVyLiBUZXJzZQo+ID4gK2NvbW11bmlj
YXRpb24gc3R5bGVzIGNhbiBhbHNvIGJlIHBlcmNlaXZlZCBhcyBydWRlIGluIHNvbWUgY3VsdHVy
ZXMuCj4gCj4gQW5kIGFub3RoZXIgcmVtYXJrIGhlcmU6IE5vdCBiZWluZyB0ZXJzZSBpbiBzaXR1
YXRpb25zIGxpa2UgdGhlIG9uZXMKPiBlbnVtZXJhdGVkIGFzIGV4YW1wbGVzIGFib3ZlIGlzIGEg
ZG91YmxlIHdhc3RlIG9mIHRoZSByZXZpZXdlcidzIHRpbWU6Cj4gVGhleSBzaG91bGRuJ3QgZXZl
biBuZWVkIHRvIG1ha2Ugc3VjaCBjb21tZW50cywgZXNwZWNpYWxseSBub3QgbWFueQo+IHRpbWVz
IGZvciBhIHNpbmdsZSBwYXRjaCAoc2VlIHlvdXIgbWVudGlvbiBvZiAib3ZlcnVzZSIpLiBJIHJl
YWxpemUKPiB3ZSBzdGlsbCBoYXZlIG5vIGF1dG9tYXRlZCBtZWNoYW5pc20gdG8gY2hlY2sgc3R5
bGUgYXNwZWN0cywgYnV0Cj4gYW55Ym9keSBjYW4gZWFzaWx5IGxvb2sgb3ZlciB0aGVpciBwYXRj
aGVzIGJlZm9yZSBzdWJtaXR0aW5nIHRoZW0uCj4gQW5kIGZvciBhbiBvY2Nhc2lvbmFsIGlzc3Vl
IEkgdGhpbmsgYSB0ZXJzZSByZXBseSBpcyBxdWl0ZSByZWFzb25hYmxlCj4gdG8gaGF2ZS4KPiAK
PiBPdmVyYWxsIEknbSBzZWVpbmcgdGhlIGdvb2QgaW50ZW50aW9ucyBvZiB0aGlzIGRvY3VtZW50
LCB5ZXQgSSdkIHN0aWxsCj4gdm90ZSBhdCBsZWFzdCAtMSBvbiBpdCBpZiBpdCBjYW1lIHRvIGEg
dm90ZS4gRm9sbG93aW5nIGV2ZW4ganVzdCBhCj4gZmFpciBwYXJ0IG9mIGl0IGlzIGEgY29uc2lk
ZXJhYmxlIGV4dHJhIGFtb3VudCBvZiB0aW1lIHRvIGludmVzdCBpbgo+IHJldmlld3MsIHdoZW4g
d2UgYWxyZWFkeSBoYXZlIGEgc2V2ZXJlIHJldmlld2luZyBib3R0bGVuZWNrLiBJZiBJIGhhdmUK
PiB0byBqdWRnZSBiZXR3ZWVuIGRvaW5nIGEgYmFkIChzdHlsaXN0aWNhbGx5IGFjY29yZGluZyB0
byB0aGlzIGRvYywgbm90Cj4gdGVjaG5pY2FsbHkpIHJldmlldyBvciBub25lIGF0IGFsbCAoYmVj
YXVzZSBvZiB0aW1lIGNvbnN0cmFpbnRzKSwgSSdkCj4gZmF2b3IgdGhlIGZvcm1lci4gVW5sZXNz
IG9mIGNvdXJzZSBJJ20gYXNrZWQgdG8gc3RvcCBkb2luZyBzbywgaW4KPiB3aGljaCBjYXNlIEkn
ZCBleHBlY3Qgd2hvZXZlciBhc2tzIHRvIGFycmFuZ2UgZm9yIHRoZSByZXZpZXdzIHRvIGJlCj4g
ZG9uZSBieSBzb21lb25lIGVsc2UgaW4gZHVlIGNvdXJzZS4KClJlYWRpbmcgdGhlIGRvY3VtZW50
LCBJIHRoaW5rIEphbiBoYXMgYSBwb2ludCB0aGF0IGl0IGdpdmVzIHRoZQppbXByZXNzaW9uIHRo
YXQgZm9sbG93aW5nIHRoZSBzdWdnZXN0aW9ucyB3b3VsZCB0YWtlIHNpZ25pZmljYW50CmVmZm9y
dHMsIHdoaWxlIGFjdHVhbGx5IEkgZG9uJ3QgdGhpbmsgTGFycyBtZWFudCBpdCB0aGF0IHdheSBh
dCBhbGwsIGFuZApJIGRvbid0IHRoaW5rIGl0IHNob3VsZCBiZSB0aGUgY2FzZSBlaXRoZXIuCgpN
YXliZSB3ZSBzaG91bGQgaGlnaGxpZ2h0IGFuZCBlbmNvdXJhZ2UgImNsYXJpdHkiIGluc3RlYWQg
b2YgInZlcmJvc2l0eSIKb2YgdGhlIGNvbW11bmljYXRpb24sIGFuZCBlbmNvdXJhZ2UgImV4cHJl
c3NpbmcgYXBwcmVjaWF0aW9uIiB0bwpuZXdjb21lcnMsIG5vdCBuZWNlc3NhcmlseSB0byBzZWFz
b25lZCBjb250cmlidXRvcnMuCgpUaGUgdWx0aW1hdGUgZ29hbCBvZiB0aGlzIGRvY3VtZW50IGlz
IGFjdHVhbGx5IHRvICpyZWR1Y2UqIG91ciBvdmVyYWxsCmVmZm9ydHMgYnkgbWFraW5nIG91ciBj
b21tdW5pY2F0aW9uIG1vcmUgZWZmaWNpZW50LCBub3QgdG8gaW5jcmVhc2UKZWZmb3J0cy4gTWF5
YmUgaXQgaXMgd29ydGggc2F5aW5nIHRoaXMgdG9vLgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
