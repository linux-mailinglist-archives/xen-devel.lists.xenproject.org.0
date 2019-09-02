Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70289A5CB9
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2019 21:35:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i4s2f-0006kG-AC; Mon, 02 Sep 2019 19:31:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dI3x=W5=eikelenboom.it=linux@srs-us1.protection.inumbo.net>)
 id 1i4s2c-0006kB-Sq
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2019 19:31:07 +0000
X-Inumbo-ID: 347f7628-cdb8-11e9-ac23-bc764e2007e4
Received: from server.eikelenboom.it (unknown [91.121.65.215])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 347f7628-cdb8-11e9-ac23-bc764e2007e4;
 Mon, 02 Sep 2019 19:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=eikelenboom.it; s=20180706; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7JaUGRSucfFT26NVi8Zd9yvyRuodW6aRaiwBqqjniQo=; b=eOl/BhpL5UzhgvxTWtA/gTSiop
 6a8pNwsPGGpDFdQBY5dsxKfwUOVEA1KQpGfhk3VuaqlnHICnieONwRdWduPRF1y7+U2b6zrUQhZca
 2eT6KnRldRlAppp98FrW17FTltQEH7K9sw1O/P5JqGz75M6QB2tLegYp1xvLp3blJ+YE=;
Received: from ip4da85049.direct-adsl.nl ([77.168.80.73]:57844
 helo=[172.16.1.50]) by server.eikelenboom.it with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <linux@eikelenboom.it>)
 id 1i4s2d-0003Bj-C8; Mon, 02 Sep 2019 21:31:07 +0200
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20190902164148.28977-1-andrew.cooper3@citrix.com>
From: Sander Eikelenboom <linux@eikelenboom.it>
Message-ID: <75201cb8-ccd6-a510-a50d-c5c285aee1de@eikelenboom.it>
Date: Mon, 2 Sep 2019 21:31:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190902164148.28977-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 0/2] tools/shim: Bodge things harder
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIvMDkvMjAxOSAxODo0MSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBUaGlzIGxvZ2ljIGlz
IGFsbCB0ZXJyaWJsZS4gIFRoaXMgc2VyaWVzIHNob3VsZCByZXNvbHZlIHRoZSByZXBvcnRlZCBi
dWlsZAo+IGZhaWx1cmUsIGJ1dCBkZWZpbml0ZWx5IGlzbid0IGEgInByb3BlciIgZml4Lgo+IAo+
IEFuZHJldyBDb29wZXIgKDIpOgo+ICAgdG9vbHMvc2hpbTogRml4IHJhY2UgY29uZGl0aW9uIGNy
ZWF0aW5nIGxpbmtmYXJtLnN0YW1wCj4gICB0b29scy9zaGltOiBBcHBseSBtb3JlIGR1Y3QgdGFw
ZSB0byB0aGUgbGlua2Zhcm0gbG9naWMKPiAKPiAgdG9vbHMvZmlybXdhcmUveGVuLWRpci9NYWtl
ZmlsZSB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKClRoYW5rcyBBbmRyZXcsIEp1c3Qg
dGVzdGVkIGFuZCBpdCB3b3JrcyBmb3IgbWUhCgotLQpTYW5kZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
