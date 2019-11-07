Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D4F33C4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2019 16:49:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iSjz5-0000nH-RJ; Thu, 07 Nov 2019 15:46:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RhM+=Y7=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iSjz3-0000nC-Va
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2019 15:46:05 +0000
X-Inumbo-ID: b4d6e1bc-0175-11ea-984a-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b4d6e1bc-0175-11ea-984a-bc764e2007e4;
 Thu, 07 Nov 2019 15:46:05 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id l17so2204556wmh.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2019 07:46:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JdsLB0/9eP5SVFjeUHrYHmnlT/7NKe9fd2VVqgCtEx4=;
 b=Nm573bRFIcrmZL5L9P3LIFUne8AhnLZWe8qb27xeFY+OOwXIQJ09rFIw+uRvL36jM/
 om+ssUq2sV7k41Gu/ITp2zkHg7sMTU2oE5UXNfTByBwIBoO+nTXSRs9GFg3wlDDKau4v
 PXsRdUXrvE4WPTEB5KjJrawoiI77WnclWlLZLyYAb2CqTFmAwpf1ZyZjeuuyO2yF+YMQ
 dxAIfXcHk0BjuDECNXyVD5QoI2GAYCNbmtdbDVzzWhUkK8ahcCnRXjy5aGw3VC+9p2Q3
 mECiebH5L5lxmFcGXTR+TZdxl2awHCtAGLvudnUBP25crl6V/wOsPzTlTK1U8bAtuzPD
 ypIw==
X-Gm-Message-State: APjAAAURhpvwAp9DVmoYMXHhmen286JcLUGHKnZYOB2Gty4jJWWrwRJs
 XleZJ0yNqsZVoEfU0TW6/qI=
X-Google-Smtp-Source: APXvYqxfeciP5SCx+adix1r+skUNll86t3EvS3a5GOQAziaHi7ljMzgskAnojnh+d+lfsAPt9lB/Vw==
X-Received: by 2002:a1c:60d7:: with SMTP id u206mr3708527wmb.101.1573141564186; 
 Thu, 07 Nov 2019 07:46:04 -0800 (PST)
Received: from debian (108.162.147.147.dyn.plus.net. [147.147.162.108])
 by smtp.gmail.com with ESMTPSA id v16sm3325340wrc.84.2019.11.07.07.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 07:46:03 -0800 (PST)
Date: Thu, 7 Nov 2019 15:46:02 +0000
From: Wei Liu <wl@xen.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <20191107154602.cpjynpzr3h6gqjhk@debian>
References: <20191105235113.27469-1-sstabellini@kernel.org>
 <20191106104521.xm32dkkcj7a3d3ru@debian>
 <alpine.DEB.2.21.1911060809060.11262@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1911060809060.11262@sstabellini-ThinkPad-T480s>
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

T24gV2VkLCBOb3YgMDYsIDIwMTkgYXQgMDg6MTA6NDdBTSAtMDgwMCwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOgo+IE9uIFdlZCwgNiBOb3YgMjAxOSwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1
ZSwgTm92IDA1LCAyMDE5IGF0IDAzOjUxOjEzUE0gLTA4MDAsIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToKPiA+ID4gQWN0dWFsbHksIHB5Z3J1YiBjcm9zcy1jb21waWxlcyB3aXRob3V0IGlzc3Vl
cy4gVGhlIGNyb3NzLWNvbXBpbGF0aW9uCj4gPiA+IHdvcmstYXJvdW5kIGdvZXMgYmFjayB0byAy
MDA1IGFuZCBpdCBwcm9iYWJseSByZWZlcnJlZCB0byBQb3dlclBDLgo+ID4gPiAKPiA+ID4gUmVt
b3ZlIHRoZSB3b3JrLWFyb3VuZCBub3cuCj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBTdGVm
YW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm8uc3RhYmVsbGluaUB4aWxpbnguY29tPgo+ID4gPiBDQzog
Q2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVyLncuY2xhcmtAZ21haWwuY29tPgo+ID4gCj4g
PiBQcmVzdW1hYmx5IHlvdSB0cmllZCB0byBjcm9zcy1jb21waWxlIGl0IGZvciBBcm0/IEl0IHdv
dWxkIGJlIGdvb2QgdG8KPiA+IG1lbnRpb24gdGhhdCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4g
PiAKPiA+IEkgdGhpbmsgdGhlIGNvbnRlbnQgb2YgdGhpcyBwYXRjaCBpcyBmaW5lOgo+IAo+IEl0
IGNyb3NzLWNvbXBpbGVzIGZpbmUgZm9yIGFhcmNoNjQgb24geDg2XzY0IHdpdGggWW9jdG8uICBB
bHRob3VnaCB3ZQo+IGRvbid0IGRvIGFueSBjcm9zcy1jb21waWxhdGlvbnMgaW4gT1NTVGVzdCBh
cyBmYXIgYXMgSSBrbm93LCBzbyBhcHBseWluZwo+IHRoZSBwYXRjaCB3b24ndCBicmVhayBPU1NU
ZXN0LCBnaXZlbiB0aGUgc3RhdGUgb2YgdGhlIHJlbGVhc2UsIEkgdGhpbmsKPiBpdCB3b3VsZCBi
ZSBiZXN0IHRvIHdhaXQgZm9yIHRoZSBuZXh0IG1lcmdlIHdpbmRvdy4KClRoYXQncyBvZiBjb3Vy
c2UgZmluZSBieSBtZS4KCldlaS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
