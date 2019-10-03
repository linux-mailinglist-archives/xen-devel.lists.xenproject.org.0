Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D3CA03B
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2019 16:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iG1wt-0006Wy-S0; Thu, 03 Oct 2019 14:19:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=C4d8=X4=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iG1ws-0006Wt-JH
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2019 14:19:18 +0000
X-Inumbo-ID: c74cd981-e5e8-11e9-9729-12813bfff9fa
Received: from mail-wm1-f49.google.com (unknown [209.85.128.49])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c74cd981-e5e8-11e9-9729-12813bfff9fa;
 Thu, 03 Oct 2019 14:19:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id b24so2437114wmj.5
 for <xen-devel@lists.xenproject.org>; Thu, 03 Oct 2019 07:19:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ql1Vclw1NL6k1htGCvwagoLMECmh+XOSSE9TJgoKGDU=;
 b=mmWFwrN3qPvAhqJ/QtteMFUIRflkxne729nruRUz2WykpSeKihf2/W2KfYhQFdeDT0
 PUXf5grsozncP0U/CpnSP38ZNkx3H6t3Qo94dcCxHpvoPOEkazPf7MEti3pAs7BVltY5
 DWy749R6zbTFU7EHONAw8ACNrNpIciS1XUxkkwwyIq9wO11650gXD3AOJFD8dWVpBDNK
 cdvDy5Axx5ulLjgwB2ETFdxVzHF2rU1hOr3R1CLAzK9LpuJQD005szoMBs0lc6cJJQsp
 rshmiKNFHNYi6HKtdQR7Eikdbu1MnKufLArPodIskxpha8QW01Yr6mmD/7jDfp4ZYvWw
 806w==
X-Gm-Message-State: APjAAAVM1u38EVVD9wMNz8QBmhxfm2H5DSpLYSD9a4Jkq2Oz0MKhD6JD
 N++e2kn9iOIvV810MGi8So8=
X-Google-Smtp-Source: APXvYqw13PYhLf38PLWxaJ32BC+ckDPXXe1xm/VVfl4KlcKLDUnQre9Fo1wJEM6vj1Nh4ZneUEXkBQ==
X-Received: by 2002:a1c:2d11:: with SMTP id t17mr7223919wmt.147.1570112355776; 
 Thu, 03 Oct 2019 07:19:15 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id d10sm3773362wma.42.2019.10.03.07.19.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2019 07:19:15 -0700 (PDT)
Date: Thu, 3 Oct 2019 15:19:13 +0100
From: Wei Liu <wl@xen.org>
To: Kateryna Razumova <katereenart@gmail.com>
Message-ID: <20191003141913.ixezqr2lzinautw7@debian>
References: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
 <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
 <20191002103340.vxqzkwcptpw7lhol@debian>
 <CAFjkr2rK6vi4CmqyT+2ce3LFRz0FNngproCeOGROnO5rSWp8uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFjkr2rK6vi4CmqyT+2ce3LFRz0FNngproCeOGROnO5rSWp8uA@mail.gmail.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MTk6NDRQTSArMDIwMCwgS2F0ZXJ5bmEgUmF6dW1v
dmEgd3JvdGU6Cj4gRGVhciBMaXUsCj4gCj4gb2gsIEkgdGhvdWdodCB0aGF0IHhlbiBwYXJ0aWNp
cGF0ZXMgaW4gT3V0cmVhY2h5IGluIG9yZGVyIHRvIGdldCBuZXcKPiBjb250cmlidXRvcnMgdmlh
IGVhc2luZyB0aGUgZW50cmFuY2UgcHJvY2Vzcy4KPiBCdXQgaXQgc2VlbXMgdGhhdCBhIHBvdGVu
dGlhbCBjb250cmlidXRvciB0byB4ZW4gc2hvdWxkIGFscmVhZHkgaGF2ZSBzb21lCj4ga25vd2xl
ZGdlIG9mIHhlbiAoZm9yIGV4YW1wbGUsIGhvdyB0byBmaW5kIGEgYnVnLCBzaW5jZSB0aGVyZSBh
cmUgbm8gaXNzdWVzCj4gb24gZ2l0aHViIGFuZCBubyB2aXNpYmxlIGxpbmsgdG8gYnVnemlsbGEp
LiBJIGRpZG4ndCBrbm93IHRoYXQhCj4gSSBhbSByZWFsbHkgc29ycnkgZm9yIHRoaXMgaW5jb252
ZW5pZW5jZSEhIQoKVGhlcmUgaXMgbm8gbmVlZCB0byBiZSBzb3JyeSBmb3IgYW55dGhpbmcuCgpU
byBiZSBjbGVhciwgd2UgZG9uJ3QgYXNzdW1lIHByaW9yIGtub3dsZWRnZSBvZiBYZW4uIFdlIHJl
cXVpcmUgaW50ZXJucwp0byBnZXQgZmFtaWxpYXJpc2VkIHdpdGggdGhlIGRldmVsb3BtZW50IHBy
b2Nlc3MgYnkgcmVhZGluZyByZWxldmFudAptYXRlcmlhbHMuICBBZnRlciByZWFkaW5nIHRoZSBt
YXRlcmlhbHMgdGhleSBzaG91bGQgYXNrIHNwZWNpZmljCnF1ZXN0aW9ucyBhYm91dCB0aGUgcHJv
Y2Vzcy4KCldlIHVzZWQgdG8gaGF2ZSBhIGNlbnRyYWxpc2VkIHBsYWNlIGZvciBlYXN5IGJ1Z3Ms
IGJ1dCBJIHRoaW5rIG1vc3QKbG93LWhhbmdpbmcgZnJ1aXRzIGFyZSBhbHJlYWR5IGdvbmUuICBU
aGF0J3Mgd2h5IEkgYXNrZWQgcG90ZW50aWFsCmludGVybnMgdG8gc3VibWl0IHBhdGNoZXMgdG8g
Zml4IHR5cG9zIGluIHRoZSBoeXBlcnZpc29yIGNvZGUgYmFzZSAtLQpqdXN0IG9wZW4gYSBmaWxl
IHRoYXQgaW50ZXJlc3RzIHlvdSBhbmQgc2VlIGlmIHlvdSBmaW5kIGFueSB0eXBvcyBpbgpjb21t
ZW50cy4gIEJlaW5nIGFibGUgdG8gZmluZCBhbmQgZml4IGEgcmVhbCBidWcgd291bGQgYmUgbmlj
ZSwgYnV0CnRoYXQncyBub3QgYSBoYXJkIHJlcXVpcmVtZW50LiBUaGUga2V5IHBvaW50IGlzIHRv
IGdvIHRocm91Z2ggdGhlCmRldmVsb3BtZW50IHByb2Nlc3MgYW5kIGludGVyYWN0IHdpdGggdGhl
IGNvbW11bml0eS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
