Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65440125150
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 20:08:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihebd-0004Lj-1u; Wed, 18 Dec 2019 19:03:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Trds=2I=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1ihebb-0004Le-GK
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 19:03:31 +0000
X-Inumbo-ID: 0f395fea-21c9-11ea-a1e1-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f395fea-21c9-11ea-a1e1-bc764e2007e4;
 Wed, 18 Dec 2019 19:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkohCkCug0fiHMlupqEWBSLC90Z9tix5Q3lY0enWjjk=; b=CT6GIRyc/vt80BFDBmrhDd44FR
 rSPYDAw5WEU4CKNfbPsg/HGDc+GGLIwjrgsPn+N1nl0ShE4O1Kxryd+gsviK2PcoGZDHKsyVGtnfi
 +UKMu96DmoZE5iTJcdXdbEOWqmFmxDsYMhkPxRHGrMZ41dZ5Z9aztriicDyrhmNsGSUY=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:39802
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1iheca-00025T-Jx; Wed, 18 Dec 2019 20:04:32 +0100
To: Juergen Gross <jgross@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <fc0a2b00-e047-172d-04cd-91950f0e9448@suse.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <65eb9877-2d76-f10a-c53e-cae79a868e35@eikelenboom.it>
Date: Wed, 18 Dec 2019 20:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <fc0a2b00-e047-172d-04cd-91950f0e9448@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [ANNOUNCEMENT] Xen 4.13 is released
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTIvMjAxOSAxODowMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBEZWFyIGNvbW11bml0
eSBtZW1iZXJzLAo+IAo+IEknbSBwbGVhc2VkIHRvIGFubm91bmNlIHRoYXQgWGVuIDQuMTMuMCBp
cyByZWxlYXNlZC4KPiAgCj4gVGhhbmtzIGV2ZXJ5b25lIHdobyBjb250cmlidXRlZCB0byB0aGlz
IHJlbGVhc2UuIFRoaXMgcmVsZWFzZSB3b3VsZAo+IG5vdCBoYXZlIGhhcHBlbmVkIHdpdGhvdXQg
YWxsIHRoZSBhd2Vzb21lIGNvbnRyaWJ1dGlvbnMgZnJvbSBhcm91bmQKPiB0aGUgZ2xvYmUuCj4g
Cj4gUmVnYXJkcywKPiAKPiBKdWVyZ2VuIEdyb3NzIChvbiBiZWhhbGYgb2YgdGhlIFhlbiBQcm9q
ZWN0IEh5cGVydmlzb3IgdGVhbSkKClRoYW5rcyBmb3IgeW91ciB3b3JrIGFzIHJlbGVhc2UgbWFu
YWdlciAhCgotLQpTYW5kZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
