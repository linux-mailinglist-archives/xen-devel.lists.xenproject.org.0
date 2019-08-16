Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD219021B
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 14:59:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hybmM-0005eS-0S; Fri, 16 Aug 2019 12:56:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5V6G=WM=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1hybmK-0005eA-Jo
 for xen-devel@lists.xen.org; Fri, 16 Aug 2019 12:56:24 +0000
X-Inumbo-ID: 3f37050e-c025-11e9-8bb6-12813bfff9fa
Received: from mail-wr1-f65.google.com (unknown [209.85.221.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f37050e-c025-11e9-8bb6-12813bfff9fa;
 Fri, 16 Aug 2019 12:56:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z1so1440887wru.13
 for <xen-devel@lists.xen.org>; Fri, 16 Aug 2019 05:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=NSJfIXJ/DQeRrMVQ5CfD/bps+tzK2AH6DviLSNKlC9Y=;
 b=Fypdy15H5glfBVIG+1DR8RXLXFHeH1KRBm0ofAtQAcC+vwLxLPhRGhLN8AU3iYp22f
 bAlNIvmY6LjMaHCNMtr8rIgxg9cy58uhx42tYFmPpYtVqDtBB+STbIMvpCqKp1FgFMq4
 TMhFAwhsM5gr/fYOmpzKCWwedcCYpmB1DWjI6i8XzRov2YvngkzuqhKfv7+EDShEP4tn
 unORyVERPgPZ9cgadgUWZN8cp8TAXHL0e2iZCyH4iuxKl/o/K/tS8Jj0iZy5LtjdUt2d
 Almy1Gr5PxhzcWzQSxQ3hfTdXHXULoAiYnvkjybdF8IBxZbSfaAD+7ppumBiheES4AxP
 aVEg==
X-Gm-Message-State: APjAAAVfb1LC07DAkDpRE6qJ/cQ/bpRvt94rz1yjwUJIpaIuzeePh13Y
 gCndcoT6s1HM7KjWlDj6Spw=
X-Google-Smtp-Source: APXvYqw8cc0QAK7mLArOnxHjhk6KjTaH9xJ9S+p0jBl8kXfcqyIoAdtcsVcbJcMPJ8+cqJTtY7JTfA==
X-Received: by 2002:a5d:460e:: with SMTP id t14mr11343995wrq.171.1565960181501; 
 Fri, 16 Aug 2019 05:56:21 -0700 (PDT)
Received: from
 liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net
 ([51.140.50.101])
 by smtp.gmail.com with ESMTPSA id p19sm914975wmg.31.2019.08.16.05.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Aug 2019 05:56:21 -0700 (PDT)
Date: Fri, 16 Aug 2019 12:56:19 +0000
From: Wei Liu <wl@xen.org>
To: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
Message-ID: <20190816125619.djdtq3zxypjx5utf@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
References: <20190815112750.11581-1-wipawel@amazon.de>
 <20190816124445.n767e5yra4zodt3z@liuwe-gateway.j3c5onc20sse1dnehy4noqpfcg.zx.internal.cloudapp.net>
 <FD2C7903-B925-4E83-B7A1-929A17FC7BAC@amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FD2C7903-B925-4E83-B7A1-929A17FC7BAC@amazon.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH lp-metadata 3/3] livepatch: Add metadata
 runtime retrieval mechanism
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel <xen-devel@lists.xen.org>,
 "Pohlack, Martin" <mpohlack@amazon.de>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6NTQ6MTJQTSArMDAwMCwgV2llY3pvcmtpZXdpY3os
IFBhd2VsIHdyb3RlOgo+IAo+ID4gT24gMTYuIEF1ZyAyMDE5LCBhdCAxNDo0NCwgV2VpIExpdSA8
d2xAeGVuLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDExOjI3
OjUwQU0gKzAwMDAsIFBhd2VsIFdpZWN6b3JraWV3aWN6IHdyb3RlOgo+ID4+IEV4dGVuZCB0aGUg
bGl2ZXBhdGNoIGxpc3Qgb3BlcmF0aW9uIHRvIGZldGNoIGFsc28gcGF5bG9hZHMnIG1ldGFkYXRh
Lgo+ID4+IFRoaXMgaXMgYWNoaWV2ZWQgYnkgZXh0ZW5kaW5nIHRoZSBzeXNjdGwgbGlzdCBpbnRl
cmZhY2Ugd2l0aCAyIGV4dHJhCj4gPj4gZ3Vlc3QgaGFuZGxlczoKPiA+PiAqIG1ldGFkYXRhICAg
ICAtIGFuIGFycmF5IG9mIGFyYml0cmFyeSBzaXplIHN0cmluZ3MKPiA+PiAqIG1ldGFkYXRhX2xl
biAtIGFuIGFycmF5IG9mIG1ldGFkYXRhIHN0cmluZ3MnIGxlbmd0aHMgKHVpbjMyX3QgZWFjaCkK
PiAKPiDigKZzbmlwLi4uCj4gCj4gPj4gU2lnbmVkLW9mZi1ieTogUGF3ZWwgV2llY3pvcmtpZXdp
Y3ogPHdpcGF3ZWxAYW1hem9uLmRlPgo+ID4+IFJldmlld2VkLWJ5OiBBbmRyYS1JcmluYSBQYXJh
c2NoaXYgPGFuZHJhcHJzQGFtYXpvbi5jb20+Cj4gPj4gUmV2aWV3ZWQtYnk6IE1hcnRpbiBQb2hs
YWNrIDxtcG9obGFja0BhbWF6b24uZGU+Cj4gPj4gUmV2aWV3ZWQtYnk6IE5vcmJlcnQgTWFudGhl
eSA8bm1hbnRoZXlAYW1hem9uLmRlPgo+ID4+IC0tLQo+ID4+IHRvb2xzL2xpYnhjL2luY2x1ZGUv
eGVuY3RybC5oIHwgMjIgKysrKysrKysrKystLS0tCj4gPj4gdG9vbHMvbGlieGMveGNfbWlzYy5j
ICAgICAgICAgfCA2NiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
Cj4gPj4gdG9vbHMvbWlzYy94ZW4tbGl2ZXBhdGNoLmMgICAgfCA0MyArKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tCj4gPj4geGVuL2NvbW1vbi9saXZlcGF0Y2guYyAgICAgICAgfCAyMiArKysr
KysrKysrKy0tLS0KPiA+PiB4ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggICB8IDE5ICsrKysr
KysrKy0tLS0KPiA+IAo+ID4gTW9zdGx5IGxvb2sgZ29vZC4gT25lIGNvbW1lbnQgYmVsb3cuLi4K
PiA+IAo+ID4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMvc3lzY3RsLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMvc3lzY3RsLmgKPiA+PiBpbmRleCBiODY4MDRiN2E2Li5lNGM4ZjRmZTYz
IDEwMDY0NAo+ID4+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+ID4+ICsrKyBi
L3hlbi9pbmNsdWRlL3B1YmxpYy9zeXNjdGwuaAo+ID4gCj4gPiBJZiBpdCBoYXNuJ3QgYmVlbiBk
b25lIGZvciB0aGlzIHJlbGVhc2UgYWxyZWFkeSwgY2hhbmdpbmcgc3lzY3RsIGludGVyZmFjZSBy
ZXF1aXJlcwo+ID4gYnVtcGluZyB0aGUgdmVyc2lvbiBudW1iZXIgaW4gdGhpcyBoZWFkZXIuCj4g
PiAKPiAKPiBBQ0suIFdpbGwgZG8gKGFsc28gZm9yIGVhcmxpZXIgcGF0Y2hlc+KApikuCj4gCgpX
ZSBvbmx5IG5lZWQgdG8gZG8gaXQgb25jZSBwZXIgcmVsZWFzZS4gOi0pCgpXZWkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
