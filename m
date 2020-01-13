Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 784D013940F
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 15:56:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir15Q-0004sp-9I; Mon, 13 Jan 2020 14:53:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Ofl=3C=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1ir15O-0004sk-K3
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 14:52:58 +0000
X-Inumbo-ID: 62d63858-3614-11ea-827a-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62d63858-3614-11ea-827a-12813bfff9fa;
 Mon, 13 Jan 2020 14:52:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q10so8876461wrm.11
 for <xen-devel@lists.xen.org>; Mon, 13 Jan 2020 06:52:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mBNpu/RAiIZhg5V03p1kenyr0fo4dtt2PswtTEkGtvA=;
 b=rW/mph86+2nMta+MPcG2XsYzdWpMB/yEK3fIOMEWmupZ1yXgilOi/9FBxNImbyqone
 Ob6A4wKK9XXxlegltTsNv1Inq3XNbD/nhNYuG1q/07idDuOOZ4acAGHdmvofqSHJRwNR
 ApsrNevNOqopsnpB+e66CKh8WE0JG72jhwM//JsfdU1dElmk0aybTyz5YmZ/mx9lXAOv
 qsJ4y+5bZcBvDEDkgVIJcrJGoRTmiv5hcnIzuKppWKFxNslCAcuOU+SAm5ZClOLbl7JN
 NLGJ4fQTDFEzXiwr+nNmg80jjnIX6mgo7Xqe+OFthO+DT/rI6EbkGcp/uRJEokzxuQU9
 Bd4Q==
X-Gm-Message-State: APjAAAWoSTb3nbJ9PkDqJP/U60xMexnQYWp9HiLDxbC2d+CyEVV1kz2o
 DiwOYOFQNhvaVQ0KdVqfQ7I=
X-Google-Smtp-Source: APXvYqytA4j2jdtB229myneNReqARsSl/VE7CBfliK62nhcwdDt+TsI0ZNV3ur754TvAO1jHrBRNqw==
X-Received: by 2002:adf:90e7:: with SMTP id i94mr18446167wri.47.1578927176772; 
 Mon, 13 Jan 2020 06:52:56 -0800 (PST)
Received: from a483e7b01a66.ant.amazon.com (54-240-197-234.amazon.com.
 [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id h66sm15442881wme.41.2020.01.13.06.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jan 2020 06:52:56 -0800 (PST)
To: George Dunlap <george.dunlap@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <20200110103723.29538-1-sergey.dyasli@citrix.com>
 <c698d473-d8f2-7d53-b5f3-0cfefcc617f1@cardoe.com>
 <865DBCFC-92C9-41D2-A502-914A5999979F@citrix.com>
 <68263b88-40b7-89d3-c962-6991c708dd89@cardoe.com>
 <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c170bc4f-e1b5-6620-c0da-eef16d572623@xen.org>
Date: Mon, 13 Jan 2020 14:52:55 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <ca5a6b9b-fbde-5de6-fbf0-822d488cabf9@citrix.com>
Content-Language: en-GB
Subject: Re: [Xen-devel] [PATCH v2] xsm: hide detailed Xen version from
 unprivileged guests
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Xen-devel <xen-devel@lists.xen.org>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <Ian.Jackson@citrix.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAxMy8wMS8yMDIwIDEyOjUxLCBHZW9yZ2UgRHVubGFwIHdyb3RlOgo+IE9uIDEvMTIv
MjAgNjoyNiBQTSwgRG91ZyBHb2xkc3RlaW4gd3JvdGU6Cj4+IE9uIDEvMTEvMjAgMzowMiBBTSwg
R2VvcmdlIER1bmxhcCB3cm90ZToKPiAxLiBCbG9jayBYRU5WRVJfZXh0cmF2ZXJzaW9uIGF0IHRo
ZSBoeXBlcnZpc29yIGxldmVsLiAgQ2hhbmdlIHRoZQo+IHhlbl9kZW55KCkgc3RyaW5nIHRvICIi
LiAgKFRoaXMgaXMgdjEgb2Ygc2VyZ2V5J3MgcGF0Y2guKQo+IAo+IDIuIEJsb2NrIFhFTlZFUl9l
eHRyYXZlcnNpb24gYXQgdGhlIGh5cGVydmlzb3IgbGV2ZWwuICBMZWF2ZSB4ZW5fZGVueSgpCj4g
YXMgcmV0dXJuaW5nICI8ZGVuaWVkPiIsIGJ1dCByZXBsYWNlICI8ZGVuaWVkPiIgd2l0aCAiIiBp
biBodm1sb2FkZXIgc28KPiBpdCBkb2Vzbid0IHNob3cgdXAgaW4gdGhlIFN5c3RlbSBJbmZvIGFu
ZCBzY2FyZSB1c2Vycy4KPiAKPiAzLiBCbG9jayBYRU5WRVJfZXh0cmF2ZXJzaW9uIGF0IHRoZSBo
eXBlcnZpc29yIGxldmVsLiAgQ2hhbmdlIHhlbl9kZW55KCkKPiB0byByZXR1cm4gYSBtb3JlIGJl
bmlnbiBzdHJpbmcgbGlrZSAiPGhpZGRlbj4iLiAgKFBlcmhhcHMgYWxzbyBmaWx0ZXIgaXQKPiBp
biBodm1sb2FkZXIsIGp1c3QgZm9yIGdvb2QgbWVhc3VyZS4pCj4gCj4gNC4gQmxvY2sgWEVOVkVS
X2V4dHJhdmVyc2lvbiBhdCB0aGUgaHlwZXJ2aXNvciBsZXZlbC4gIE1ha2UgdGhlCj4geGVuX2Rl
bnkoKSBzdHJpbmcgY29uZmlndXJhYmxlIGluIEtDb25maWcuCgpBIEtjb25maWcgb3B0aW9uIGlz
IGluZGVlZCBpZGVhbCBhcyBzb21lIG9mIHRoZSBzdGFrZWhvbGRlciBtYXkgd2FudCB0byAKa2Vl
cCBjb250cm9sIG9mIHRoZSBzdHJpbmcgZXhwb3NlZC4KCkJ1dCBpZiB3ZSBnbyB0aGUgS2NvbmZp
ZyByb3V0ZSwgdGhlbiBtYXliZSB3ZSB3YW50IHRvIGFsbG93IGVhY2ggYml0cyAKKGV4dHJhdmVy
c2lvbiwgY29tcGlsZXIuLi4pIHRvIGJlIHNlcGFyYXRseSBjb25maWd1cmFibGUuCgpJIHdvdWxk
IGJlIG1vcmUgdGhhbiBoYXBweSB0byBoZWxwIHdyaXRpbmcgc3VjaCBhIHBhdGNoIGlmIHRoZXJl
IGlzIGFuIAppbnRlcmVzdCBmb3IgaXQuCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
