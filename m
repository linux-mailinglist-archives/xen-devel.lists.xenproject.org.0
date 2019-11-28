Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945310C675
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 11:13:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaGkC-0005BI-V2; Thu, 28 Nov 2019 10:09:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Hmpo=ZU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iaGkB-0005BC-Mx
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 10:09:51 +0000
X-Inumbo-ID: 30855d46-11c7-11ea-a3cd-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 30855d46-11c7-11ea-a3cd-12813bfff9fa;
 Thu, 28 Nov 2019 10:09:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 135F5B486;
 Thu, 28 Nov 2019 10:09:39 +0000 (UTC)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Lars Kurth <lars.kurth@xenproject.org>
References: <cover.1569525222.git.lars.kurth@citrix.com>
 <97e3adf75cf71ba39e702d4cab23236ada8d5a6c.1569525222.git.lars.kurth@citrix.com>
 <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <909826df-25c1-6d7c-75d9-470365d2ecf6@suse.com>
Date: Thu, 28 Nov 2019 11:09:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911271608510.27669@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 4/6] Add Code Review Guide
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
Cc: Lars Kurth <lars.kurth@citrix.com>, xen-api@lists.xenproject.org,
 minios-devel@lists.xenproject.org, committers@xenproject.org,
 mirageos-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
 win-pv-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjguMTEuMjAxOSAwMTo1NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOgo+IE9uIFRodSwg
MjYgU2VwIDIwMTksIExhcnMgS3VydGggd3JvdGU6Cj4+IEZyb206IExhcnMgS3VydGggPGxhcnMu
a3VydGhAY2l0cml4LmNvbT4KPj4KPj4gVGhpcyBkb2N1bWVudCBoaWdobGlnaHRzIHdoYXQgcmV2
aWV3ZXJzIHN1Y2ggYXMgbWFpbnRhaW5lcnMgYW5kIGNvbW1pdHRlcnMgbG9vawo+PiBmb3Igd2hl
biByZXZpZXdpbmcgY29kZS4gSXQgc2V0cyBleHBlY3RhdGlvbnMgZm9yIGNvZGUgYXV0aG9ycyBh
bmQgcHJvdmlkZXMKPj4gYSBmcmFtZXdvcmsgZm9yIGNvZGUgcmV2aWV3ZXJzLgo+IAo+IEkgdGhp
bmsgdGhlIGRvY3VtZW50IGlzIG1pc3NpbmcgYSBjb3VwbGUgb2YgdGhpbmdzOgo+IAo+IC0gYSBz
aW1wbGUgb25lIGxpbmUgc3RhdGVtZW50IHRoYXQgcG9zc2libHkgdGhlIG1vc3QgaW1wb3J0YW50
IHRoaW5nIGluCj4gICBhIGNvZGUgcmV2aWV3IGlzIHRvIGluZGVudGlmeSBhbnkgYnVncyBpbiB0
aGUgY29kZQo+IAo+IC0gYW4gZXhwbGFuYXRpb24gdGhhdCByZXF1ZXN0cyBmb3IgbWFqb3IgY2hh
bmdlcyB0byB0aGUgc2VyaWVzIHNob3VsZCBiZQo+ICAgbWFkZSBlYXJseSBvbiAoaS5lLiBsZXQn
cyBub3QgY2hhbmdlIHRoZSBhcmNoaXRlY3R1cmUgb2YgYSBmZWF0dXJlIGF0Cj4gICB2OSBpZiBw
b3NzaWJsZSkgSSBhbHNvIG1hZGUgdGhpcyBjb21tZW50IGluIHJlcGx5IHRvIHBhdGNoICM1LiBJ
J2xsCj4gICBsZXQgeW91IGRlY2lkZSB3aGVyZSBpcyB0aGUgYmVzdCBwbGFjZSBmb3IgaXQuCgpU
aGlzIG5lZWRzIGJhbGFuY2luZy4gUGVvcGxlIGNydWNpYWwgdG8gdGhlIGV2YWx1YXRpb24gb2Yg
YSBuZXcKZmVhdHVyZSBhbmQgaXRzIGltcGxlbWVudGF0aW9uIHNpbXBseSBtYXkgbm90IGhhdmUg
dGhlIHRpbWUgdG8KcmVwbHkgcHJpb3IgdG8gdjkuIFdlJ3ZlIGhhZCBzaXR1YXRpb25zIHdoZXJl
IHBlb3BsZSBwb3N0ZWQgbmV3CnJldmlzaW9ucyBldmVyeSBvdGhlciBkYXksIHNvbWV0aW1lcyBl
dmVuIG1vcmUgdGhhbiBvbmUgcGVyIGRheS4KCkFzIGluZGljYXRlZCBpbiBzZXZlcmFsIG90aGVy
IGNvbnRleHRzIGJlZm9yZSAtIGltbyBwZW9wbGUgbm90CmhlbHBpbmcgdG8gc2hvdWxkZXIgdGhl
IHJldmlldyBsb2FkIHNob3VsZCBhbHNvIG5vdCBoYXZlIHRoZQpleHBlY3RhdGlvbiB0aGF0IHRo
ZWlyIChsYXJnZSkgY29udHJpYnV0aW9ucyB3aWxsIGJlIGxvb2tlZCBhdAppbiBkdWUgY291cnNl
LiAKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
