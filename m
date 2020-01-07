Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78131132CFB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 18:29:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iosdh-0003bZ-OE; Tue, 07 Jan 2020 17:27:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iosdg-0003bT-Cs
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 17:27:32 +0000
X-Inumbo-ID: f74b06c2-3172-11ea-bf56-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f74b06c2-3172-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 17:27:23 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d16so272371wre.10
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 09:27:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pVLXdZapUA9mlOestDeH3bHJsGn136jAiJ8TW+UxF7s=;
 b=WuOpNWUxDQDCQOm35zASY/ta2w18qylu9ywsUVDWJRYob/5Zb57+p9CLSwR06bO6xU
 AWOyatuaa2v7HV01PTuWUm8AKyLwkvVXXaYB3MV1GUE9e7zjjCGVqGsZgK3caMOvgklQ
 MYHYD5waBDfuNb4criOcibSFJKcOAo99r8ccp2QWEy/nUC/sOAAXxiaT4l+tQIaNd3Mi
 HJucqNq2lRF3mSCl8H2dT5YYzLxg+xDyDKGjFS3E9JiT64rP0L2kO7GhjfqH3lNknNiw
 clTC0jNKiQGkPW1AKGH3HfVarSt7GkBvidlfRLfZ/bwn1nU6JDVZJCHI4Lwx+vDBbLRk
 bvsw==
X-Gm-Message-State: APjAAAVf+VqtvqH9LzuUX0R7lKJd2pQEQIrOsHbCrNQHTtth8qYg66rY
 S8EBPFILtkEL/0wzYZSSb24=
X-Google-Smtp-Source: APXvYqwmdjnSmTxm1pTRfbrBSrUY6Zt/Kbty4tR2F4VkRFqkTgxx7YiGDelAU4splElaJSXtONJKSg==
X-Received: by 2002:adf:f28c:: with SMTP id k12mr157126wro.360.1578418042917; 
 Tue, 07 Jan 2020 09:27:22 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id s128sm344493wme.39.2020.01.07.09.27.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:27:22 -0800 (PST)
Date: Tue, 7 Jan 2020 17:27:20 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200107172720.onwjgb7x2hsrrivz@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
 <af2dd5b5-f5a4-6fe3-5654-6d84739e6d92@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <af2dd5b5-f5a4-6fe3-5654-6d84739e6d92@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 3/5] x86/hyperv: provide percpu hypercall
 input page
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKYW4gMDcsIDIwMjAgYXQgMDY6MDg6MTlQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDEuMjAyMCAxNzozMywgV2VpIExpdSB3cm90ZToKPiA+IE9uIE1vbiwgSmFu
IDA2LCAyMDIwIGF0IDExOjI3OjE4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDA1LjAxLjIwMjAgMTc6NDcsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IEh5cGVyLVYncyBpbnB1dCAv
IG91dHB1dCBhcmd1bWVudCBtdXN0IGJlIDggYnl0ZXMgYWxpZ25lZCBhbiBub3QgY3Jvc3MKPiA+
Pj4gcGFnZSBib3VuZGFyeS4gVGhlIGVhc2llc3Qgd2F5IHRvIHNhdGlzZnkgdGhvc2UgcmVxdWly
ZW1lbnRzIGlzIHRvIHVzZQo+ID4+PiBwZXJjcHUgcGFnZS4KPiA+Pgo+ID4+IEknbSBub3Qgc3Vy
ZSAiZWFzaWVzdCIgaXMgcmVhbGx5IHRydWUgaGVyZS4gT3RoZXJzIGNvdWxkIGNvbnNpZGVyIGFk
ZGluZwo+ID4+IF9fYWxpZ25lZCgpIGF0dHJpYnV0ZXMgYXMgZWFzeSBvciBldmVuIGVhc2llciAo
YnkgYmVpbmcgZXZlbiBtb3JlCj4gPj4gdHJhbnNwYXJlbnQgdG8gdXNlIHNpdGVzKS4gQ291bGQg
d2Ugc2V0dGxlIG9uICJPbmUgd2F5IC4uLiI/Cj4gPiAKPiA+IERvIHlvdSBtZWFuIHNvbWV0aGlu
ZyBsaWtlCj4gPiAKPiA+ICAgIHN0cnVjdCBmb28gX19hbGlnbmVkKDgpOwo+IAo+IElmIHRoaXMg
aXMgaW4gYSBoZWFkZXIgYW5kIC4uLgo+IAo+ID4gICAgaHZfZG9faHlwZXJjYWxsKE9QLCB2aXJ0
X3RvX21hZGRyKCZmb28pLCAuLi4pOwo+IAo+IC4uLiB0aGlzIGluIGFjdHVhbCBjb2RlLCB0aGVu
IHllcy4KPiAKPiA+ID8KPiA+IAo+ID4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRyYW5zcGFyZW50
IHRvIHVzZXIgc2l0ZXMuIFBsdXMsIGZvbyBpcyBvbiBzdGFjawo+ID4gd2hpY2ggaXMgMSkgZGlm
ZmljdWx0IHRvIGdldCBpdHMgbWFkZHIsCj4gCj4gSXQgYmVpbmcgb24gdGhlIHN0YWNrIG1heSBp
bmRlZWQgY29tcGxpY2F0ZSBnZXR0aW5nIGl0cyBtYWNoaW5lIGFkZHJlc3MKPiAoaWYgbm90IG5v
dywgdGhlbiBkb3duIHRoZSByb2FkKSAtIHZhbGlkIHBvaW50Lgo+IAo+ID4gMikgbWF5IGNyb3Nz
IHBhZ2UgYm91bmRhcnkuCj4gCj4gVGhlIF9fYWxpZ25lZCgpIG9mIGNvdXJzZSBuZWVkcyB0byBi
ZSBsYXJnZSBlbm91Z2ggdG8gYXZvaWQgdGhpcwo+IGhhcHBlbmluZy4KCkZvciB0aGlzIGFsaWdu
bWVudCB0byBiZSBsYXJnZSBlbm91Z2gsIGl0IHdpbGwgbmVlZCB0byBiZSBvZiBQQUdFX1NJWkUs
CnJpZ2h0PyBXb3VsZG4ndCB0aGF0IGJsb3cgdXAgWGVuJ3Mgc3RhY2sgZWFzaWx5PyAgR2l2ZW4g
d2Ugb25seSBoYXZlIHR3bwpwYWdlcyBmb3IgdGhhdC4KCkluIGxpZ2h0IG9mIHRoZXNlIHJlc3Ry
aWN0aW9ucywgdGhlIGFwcHJvYWNoIEkgdGFrZSBpbiB0aGUgb3JpZ2luYWwKcGF0Y2ggc2hvdWxk
IGJlIG9rYXkuCgpJJ20gZmluZSB3aXRoIGNoYW5naW5nIHRoZSB3b3JkaW5nIHRvICJPbmUgd2F5
IC4uLiIgLS0gaWYgdGhhdCdzIHRoZQpvbmx5IG9iamVjdGlvbiB5b3UgaGF2ZSBhZnRlciB0aGlz
IG1haWwuCgo+IAo+ID4+IEFsc28sIHdoaWxlIGxvb2tpbmcgYXQgdGhpcyBJIG5vdGljZSB0aGF0
IC0gZGVzcGl0ZSBteSBlYXJsaWVyCj4gPj4gY29tbWVudCB3aGVuIGdpdmluZyB0aGUgcmVzcGVj
dGl2ZSwgc29ydC1vZi1jb25kaXRpb25hbCBhY2sgLQo+ID4+IHRoZXJlIGFyZSAoc3RpbGwpIG1h
bnkgYXBwYXJlbnRseSBwb2ludGxlc3MgX19wYWNrZWQgYXR0cmlidXRlcwo+ID4+IGluIGh5cGVy
di10bGZzLmguIENhcmUgdG8gY29tbWVudCBvbiB0aGlzPwo+ID4gCj4gPiBBZ2FpbiwgdGhhdCdz
IGEgc3RyYWlnaHQgaW1wb3J0IGZyb20gTGludXguIEkgdHJpZWQgbm90IHRvIGRldmlhdGUgdG9v
Cj4gPiBtdWNoLiBBIGNvbW1pdCBpbiBMaW51eCAoZWMwODQ0OTE3MjdiMCkgY2xhaW1zICJjb21w
aWxlciBjYW4gYWRkCj4gPiBhbGlnbm1lbnQgcGFkZGluZyB0byBzdHJ1Y3R1cmVzIG9yIHJlb3Jk
ZXIgc3RydWN0IG1lbWJlcnMgZm9yCj4gPiByYW5kb21pemF0aW9uIGFuZCBvcHRpbWl6YXRpb24i
Lgo+IAo+IFdvdWxkIGEgY29tcGlsZXIgZG9pbmcgc28gKHdpdGhvdXQgZXhwbGljaXRseSBiZWlu
ZyB0b2xkIHRvKSBldmVuCj4gYmUgaW4gbGluZSB3aXRoIHRoZSBDIHNwZWM/IEknZCBidXkgc3Vj
aCBhIGNsYWltIG9ubHkgaWYgSSBzZWUgYW4KPiBleGFtcGxlIHByb3ZpbmcgaXQuCj4gCj4gPiBJ
IGp1c3QgY2hlY2tlZCBhbGwgdGhlIHBhY2tlZCBzdHJ1Y3R1cmVzLiBUaGV5IHNlZW0gdG8gaGF2
ZSBhbGwgdGhlCj4gPiByZXF1aXJlZCBtYW51YWwgcGFkZGluZ3MgYWxyZWFkeS4gSSBjYW4gb25s
eSBhc3N1bWUgdGhleSB0cmllZCB0byBlcnJlZAo+ID4gb24gdGhlIHNhZmUgc2lkZS4KPiAKPiBB
bmQgeW91IHN1cmVseSByZWNhbGwgd2UgaGFkIHRvIHJlbW92ZSBxdWl0ZSBhIGZldyBpbnN0YW5j
ZXMgb2YKPiBfX3BhY2tlZCBmb3IgZ2NjIDkgY29tcGF0aWJpbGl0eT8KCkZhaXIgZW5vdWdoLiBJ
IHdpbGwgd3JpdGUgYSBwYXRjaCB0byBkcm9wIHRob3NlIF9fcGFja2VkIGF0dHJpYnV0ZXMuCgpX
ZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
