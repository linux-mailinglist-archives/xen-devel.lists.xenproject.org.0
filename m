Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FBF51A65
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 20:22:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfTYU-00084d-FR; Mon, 24 Jun 2019 18:19:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aqKT=UX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hfTYS-00084Y-Id
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 18:19:00 +0000
X-Inumbo-ID: 8937b7fe-96ac-11e9-a800-977b6766ed51
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8937b7fe-96ac-11e9-a800-977b6766ed51;
 Mon, 24 Jun 2019 18:18:59 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A82A920663;
 Mon, 24 Jun 2019 18:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561400338;
 bh=4yDaDw6DEhkSNzZcSOTgPQCYDXorKjYOHsJ67juOCdI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=NC+8918vgaGYmpng0tEZdHCBS+0uD0WWzgkNaeyjOpLK8TbXNiJwhR/55cU4CfK2E
 IQHUTfrYRDUxyejAOabeEU84Cb+aoHsuifBXxNsH0P2reBmitDFxI9VYBjAamsbf1D
 TK7UWi1at1Gk1R96wwCtAbzukMOrz4l1fjWWZcM8=
Date: Mon, 24 Jun 2019 11:18:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: chenbaodong <chenbaodong@mxnavi.com>
In-Reply-To: <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
Message-ID: <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCAxMyBKdW4gMjAxOSwgY2hlbmJhb2Rvbmcgd3JvdGU6Cj4gPiA+IEJ1dCBjdXJyZW50
bHkgaSBkb24ndCB1bmRlcnN0YW5kIHhlbiB3ZWxsLCBvbmx5IGEgZmV3IHdlZWtzIGV4cGVyaWVu
Y2UuCj4gPiAKPiA+IFdlIGRvIGhhdmUgc21hbGwgdGFzayBmb3IgbmV3Y29tZXJzIHRoYXQgd291
bGQgaW1wcm92ZSBYZW4gY29kZSBiYXNlIGFuZAo+ID4gYWxzbyBhbGxvdyB5b3VyIHRvIHVuZGVy
c3RhbmQgbW9yZSBzb21lIHBhcnQgb2YgdGhlIGNvZGUuCj4gPiAKPiA+IElmIHlvdSBoYXZlIGEg
c3BlY2lmaWMgYXJlYSBvZiBpbnRlcmVzdCwgSSBjYW4gc2VlIGlmIEkgaGF2ZSBzb21lIHNtYWxs
Cj4gPiB0YXNrcyB0aGVyZS4KPiAKPiBJJ20gaGFwcHkgd2l0aCB0aGlzLgo+IAo+IEludGVyZXN0
ZWQgaW4gYXJtIHBsYXRmb3JtIGZvciBlbWJlZGRlZCBhbmQgYXV0b21vdGl2ZSB1c2UgY2FzZS4K
PiAKPiB0aGluZ3MgbGlrZSBpbiB0aGlzIGxpbms6Cj4gaHR0cHM6Ly94ZW5wcm9qZWN0Lm9yZy9k
ZXZlbG9wZXJzL3RlYW1zL2VtYmVkZGVkLWFuZC1hdXRvbW90aXZlLwoKSGkgQmFvZG9uZywKCldv
dWxkIHlvdSBiZSB1cCBmb3IgYSBkb2N1bWVudGF0aW9uIHRhc2s/IERvbid0IHdvcnJ5IGlmIHRo
ZSBFbmdsaXNoIGlzCm5vdCBwZXJmZWN0LCBpdCBjYW4gZWFzaWx5IGJlIGFkanVzdGVkIG9uIGNv
bW1pdCwgYXMgbG9uZyBhcyB0aGUgY29udGVudAppcyBjb3JyZWN0LgoKV2UgaGF2ZSByZWNlbnRs
eSBzdGFydGVkIGFuIGVmZm9ydCB0byB3cml0ZSBiZXR0ZXIgZG9jdW1lbnRhdGlvbiBmb3IgYWxs
CmV4dGVybmFsIFhlbiBpbnRlcmZhY2VzLiBJIHdyb3RlIGEgbGlzdCBvZiB0aGVzZSBpbnRlcmZh
Y2VzIHRoYXQgbmVlZApkb2N1bWVudGluZzoKCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
YXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0wNi9tc2cwMTExMS5odG1sCgoKRm9yIGluc3Rh
bmNlLCB3ZSBhcmUgY3VycmVudGx5IG1pc3NpbmcgYSBkb2N1bWVudCBkZXNjcmliaW5nIGluIGRl
dGFpbHMKdGhlIGRldmljZSB0cmVlIGV4cG9zZWQgdG8gYSBEb21VLiBZb3UgY2FuIHNlZSB0aGUg
Y29kZSB0aGF0IGJ1aWxkcyBzdWNoCmEgZGV2aWNlIHRyZWUgaW4gdG9vbHMvbGlieGwvL2xpYnhs
X2FybS5jLCBmb3Igbm9ybWFsIGd1ZXN0cywgYW5kIGluCnhlbi9hcmNoL2FybS9kb21haW5fYnVp
bGQuYyBmb3IgZG9tMCBhbmQgZG9tMGxlc3MgZ3Vlc3RzLiBGcm9tIHdpdGhpbiBhCmd1ZXN0LCB5
b3UgY2FuIHNlZSB0aGUgZGV2aWNldHJlZSBieSBhY2Nlc3NpbmcgL3Byb2MvZGV2aWNlLXRyZWUg
KGlmIHRoZQpndWVzdCBpcyBMaW51eCkuCgpJZiB5b3UgYXJlIHVwIGZvciBpdCwgaXQgd291bGQg
YmUgZ3JlYXQgdG8gZ2V0IHRoYXQgd3JpdHRlbiBkb3duCmNsZWFybHkuIFlvdSBjb3VsZCBhZGQg
dG8gZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ndWVzdC50eHQsIHdoaWNoIGlzCm9ubHkgZGVz
Y3JpYmluZyB0aGUgeGVuIGh5cGVydmlzb3Igbm9kZSwgYnV0IG5vdGhpbmcgZWxzZS4gUHJvYmFi
bHkgaXQKd291bGQgYmUgYmV0dGVyIHRvIHJlbmFtZSBkb2NzL21pc2MvYXJtL2RldmljZS10cmVl
L2d1ZXN0LnR4dCB0bwpkb2NzL21pc2MvYXJtL2RldmljZS10cmVlL2h5cGVydmlzb3IudHh0IGFu
ZCBjcmVhdGUgYSBuZXcKZG9jcy9taXNjL2FybS9kZXZpY2UtdHJlZS9ndWVzdC50eHQgZG9jdW1l
bnQgd2l0aCB0aGUgZGVzY3JpcHRpb24gb2YgYWxsCm5vZGVzIGV4cG9zZWQgdG8gZG9tVXMuIFlv
dSBjb3VsZCBwb2ludCB0byB0aGUgZnVsbCBkZXNjcmlwdGlvbiBvZiBlYWNoCm5vZGUgdG8gdGhl
IGJpbmRpbmcgdW5kZXIgTGludXguIEZvciBpbnN0YW5jZSwgdGhlIGJpbmRpbmcgZm9yIHRoZSBB
cm0KYXJjaCB0aW1lciBpcyBkZXNjcmliZWQgaGVyZToKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9hcmNoaXZlcy9odG1sL3hlbi1kZXZlbC8yMDE5LTA2L21zZzAxMTExLmh0bWwKCkRvZXMg
aXQgbWFrZSBzZW5zZT8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
