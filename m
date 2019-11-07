Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B449F376D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 19:43:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSmio-0000KL-FY; Thu, 07 Nov 2019 18:41:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RhM+=Y7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSmim-0000KG-JT
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 18:41:28 +0000
X-Inumbo-ID: 3492b42d-018e-11ea-a1ca-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3492b42d-018e-11ea-a1ca-12813bfff9fa;
 Thu, 07 Nov 2019 18:41:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a11so4239719wra.6
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2019 10:41:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rY3znX/d/xh2MMRzTvsoim2MBM1Oz7uNLdQTCLl9O3c=;
 b=JNxG027Ask0UnfrNLrn0n79eNsDjbaKECuxfUHmgv28h+YRn4CooMxR8lpJtd+xosK
 TlB1BckDn5RpNrQOXh3CH98OAiSwDdxHsxiymsUpBLrEDBI0MdKafNObTV/HVOfUGm8K
 KK2WB4vsKk9TV58U/q/mMaMf5X21yCfWns52Qk8I3me/Hu0QOr47aAug7zFXNIb5KIgF
 DUCyIomi3kz4dM7G3+V/Heoh6bmYluEiPE90VuWQ7bERTzvWGFfIzylg0nbvGh8iQ5WV
 ou67MawdkbTFSfKQKlADNmJa73NX52piIv0QIqULmWvLHuResmUwVgj8qM2MZKM1zWvm
 +FQg==
X-Gm-Message-State: APjAAAVHrEHRfNff5LgwJqoz1szlKyYyuzwSGXu3/0ZbWEeu4mvuPOVD
 WcvBI2lcQWiyMGSNeIfeUK4=
X-Google-Smtp-Source: APXvYqxaxZ7WPRGtMMPy6vIo0JNNOonUEaXRczjeis+JkE0H4Bc3JmflZns3WrGr6JF+8zELUdtNzA==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr4119372wre.332.1573152086797; 
 Thu, 07 Nov 2019 10:41:26 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id e27sm4034005wra.21.2019.11.07.10.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 10:41:26 -0800 (PST)
Date: Thu, 7 Nov 2019 18:41:24 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191107184124.d6ieujvmq32jwqgb@debian>
References: <20191105235113.27469-1-sstabellini@kernel.org>
 <20191106104521.xm32dkkcj7a3d3ru@debian>
 <alpine.DEB.2.21.1911060809060.11262@sstabellini-ThinkPad-T480s>
 <20191107154602.cpjynpzr3h6gqjhk@debian>
 <alpine.DEB.2.21.1911071020540.22775@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911071020540.22775@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH] tools: pygrub actually cross-compiles just
 fine
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
Cc: Wei Liu <wl@xen.org>, ian.jackson@eu.citrix.com,
 Christopher Clark <christopher.w.clark@gmail.com>, anthony.perard@citrix.com,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBOb3YgMDcsIDIwMTkgYXQgMTA6MjI6MjNBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIFRodSwgNyBOb3YgMjAxOSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFdl
ZCwgTm92IDA2LCAyMDE5IGF0IDA4OjEwOjQ3QU0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiA+ID4gT24gV2VkLCA2IE5vdiAyMDE5LCBXZWkgTGl1IHdyb3RlOgo+ID4gPiA+IE9u
IFR1ZSwgTm92IDA1LCAyMDE5IGF0IDAzOjUxOjEzUE0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGlu
aSB3cm90ZToKPiA+ID4gPiA+IEFjdHVhbGx5LCBweWdydWIgY3Jvc3MtY29tcGlsZXMgd2l0aG91
dCBpc3N1ZXMuIFRoZSBjcm9zcy1jb21waWxhdGlvbgo+ID4gPiA+ID4gd29yay1hcm91bmQgZ29l
cyBiYWNrIHRvIDIwMDUgYW5kIGl0IHByb2JhYmx5IHJlZmVycmVkIHRvIFBvd2VyUEMuCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IFJlbW92ZSB0aGUgd29yay1hcm91bmQgbm93Lgo+ID4gPiA+ID4gCj4g
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVs
bGluaUB4aWxpbnguY29tPgo+ID4gPiA+ID4gQ0M6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3Rv
cGhlci53LmNsYXJrQGdtYWlsLmNvbT4KPiA+ID4gPiAKPiA+ID4gPiBQcmVzdW1hYmx5IHlvdSB0
cmllZCB0byBjcm9zcy1jb21waWxlIGl0IGZvciBBcm0/IEl0IHdvdWxkIGJlIGdvb2QgdG8KPiA+
ID4gPiBtZW50aW9uIHRoYXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLgo+ID4gPiA+IAo+ID4gPiA+
IEkgdGhpbmsgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRjaCBpcyBmaW5lOgo+ID4gPiAKPiA+ID4g
SXQgY3Jvc3MtY29tcGlsZXMgZmluZSBmb3IgYWFyY2g2NCBvbiB4ODZfNjQgd2l0aCBZb2N0by4g
IEFsdGhvdWdoIHdlCj4gPiA+IGRvbid0IGRvIGFueSBjcm9zcy1jb21waWxhdGlvbnMgaW4gT1NT
VGVzdCBhcyBmYXIgYXMgSSBrbm93LCBzbyBhcHBseWluZwo+ID4gPiB0aGUgcGF0Y2ggd29uJ3Qg
YnJlYWsgT1NTVGVzdCwgZ2l2ZW4gdGhlIHN0YXRlIG9mIHRoZSByZWxlYXNlLCBJIHRoaW5rCj4g
PiA+IGl0IHdvdWxkIGJlIGJlc3QgdG8gd2FpdCBmb3IgdGhlIG5leHQgbWVyZ2Ugd2luZG93Lgo+
ID4gCj4gPiBUaGF0J3Mgb2YgY291cnNlIGZpbmUgYnkgbWUuCj4gCj4gSSdsbCByZXNlbmQgdGhl
IHBhdGNoIHdpdGggYSBiZXR0ZXIgY29tbWl0IG1lc3NhZ2UuIEl0IHdvdWxkIGJlIGdvb2QgdG8K
PiBnZXQgYW4gYWNrIGlmIHlvdSBhcmUgT0sgd2l0aCBpdCAob2YgY291cnNlIHRoZXJlIHdpbGwg
YmUgbm8gY29tbWl0dGluZwo+IGl0IHJpZ2h0IG5vdy4pCgpBY2tlZC1ieTogV2VpIExpdSA8d2xA
eGVuLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
