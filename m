Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C474110253
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 17:32:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icB3C-0001WR-WB; Tue, 03 Dec 2019 16:29:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icB3A-0001WM-K9
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:29:20 +0000
X-Inumbo-ID: 0e2b562a-15ea-11ea-81e1-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e2b562a-15ea-11ea-81e1-12813bfff9fa;
 Tue, 03 Dec 2019 16:29:19 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so4473763wru.3
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 08:29:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=00OG72V0MNUZCQcdfjLjnfIJ15GK3nIAIVqwdqWjGZU=;
 b=XW1FZrQdxrzW9fpJ583YEq9uouPVcj5E92pgMRGmmPA57NGe371Lv4BoISciACDx3V
 7ziVTscJmtVHz2F6uXg8HEbBV6EcvwDcArX0xx5amlc/svd7ObOv636vM1wFFbwGUjlx
 /SNEG+/CQ0xVkF92Q7h7QUpbzG+AsX4XyZye1HdkvJ+oqZkxI3cRmAlhPkvnkUgmjzQO
 VC0pwSMR6yDHnieOcVJG8f8eyY1VRWmoAbhicYBy8C+64IQza7GUWBynYo+oJwV2sT/c
 qxRLCVK0vm/a/AXYbR2EvlPan18Tv5u3dNnenITA+KpAw5OZ9SNk9YAvg7wpdEZabTKj
 CsAA==
X-Gm-Message-State: APjAAAUOXo3JDKsghAmPSnB8qXPCRVxtR+4Hvi1VtU4ac/NsFSANAMkQ
 uxTe7Xm19fNuJqpqHRLw1Ec=
X-Google-Smtp-Source: APXvYqxh+h2PpuMt0pBNngw5AtaWH5PHCa10+CIDIge5KvXRAobMST/Mt0aB4/ux9XDxM5yeDAkOvQ==
X-Received: by 2002:adf:ee45:: with SMTP id w5mr5978873wro.352.1575390558957; 
 Tue, 03 Dec 2019 08:29:18 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id d10sm4172945wrw.64.2019.12.03.08.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:29:18 -0800 (PST)
Date: Tue, 3 Dec 2019 16:29:16 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203162916.rmcst4jvaqq5pm2t@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-5-liuwe@microsoft.com>
 <c32e24fd-00bf-ff5a-f57b-d73ba249fb15@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c32e24fd-00bf-ff5a-f57b-d73ba249fb15@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 4/8] x86: introduce hypervisor framework
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDM6NDk6MzNQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiA+IFdlIHdpbGwgc29v
biBpbXBsZW1lbnQgSHlwZXItViBzdXBwb3J0IGZvciBYZW4uIEFkZCBhIGZyYW1ld29yayBmb3IK
PiA+IHRoYXQuCj4gPiAKPiA+IFRoaXMgcmVxdWlyZXMgbW92aW5nIHNvbWUgb2YgdGhlIGh5cGVy
dmlzb3JfKiBmdW5jdGlvbnMgZnJvbSB4ZW4uaCB0bwo+ID4gaHlwZXJ2aXNvci5oLgo+ID4gCj4g
PiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IAo+IEFja2Vk
LWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClsuLi5dCj4gPiArI2luY2x1ZGUg
PGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+Cj4gPiArCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBo
eXBlcnZpc29yX29wcyBfX3JlYWRfbW9zdGx5ICpvcHM7Cj4gCj4gVGhlIF9fcmVhZF9tb3N0bHkg
aXMgbWlzcGxhY2VkIC0gaXQncyBhbiBhdHRyaWJ1dGUgb2YgdGhlIHZhcmlhYmxlLAo+IG5vdCBp
dHMgdHlwZSwgYW5kIGhlbmNlIGJlbG9uZ3MgYWZ0ZXIgdGhlICogLiBJdCBqdXN0IHNvIGhhcHBl
bnMKPiB0aGF0IHRoZSBjb21waWxlciBpcyAoc3RpbGwpIHJlbGF0aXZlbHkgcmVsYXhlZCBpbiB3
aGF0IGl0IGFjY2VwdHMsCj4gYnV0IEkgdGhpbmsgYXQgbGVhc3QgdGhlIGdjYyBtYW51YWwgaGFz
IGEgd2FybmluZyB0b3dhcmRzIGZ1dHVyZQo+IG1vcmUgc3RyaWN0IGJlaGF2aW9yLgoKRml4ZWQu
CgpXZWkuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
