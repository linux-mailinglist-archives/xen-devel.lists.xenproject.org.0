Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4791346C2
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:56:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipDfV-0000aH-L4; Wed, 08 Jan 2020 15:54:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=e5qD=25=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ipDfU-0000aC-0J
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 15:54:48 +0000
X-Inumbo-ID: 2d12175c-322f-11ea-8599-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d12175c-322f-11ea-8599-bc764e2007e4;
 Wed, 08 Jan 2020 15:54:39 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id t14so3017179wmi.5
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2020 07:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pWWiC2kcJ7zFPBeY7wC4zxECLg7lbunBK6ldpPCwOMo=;
 b=ad2D5Z8aMWppCqfmtr+ZacgZaOQZZkiWwdj+qdaY3DubqhlBnpkmt6BHa1Dch0jnWr
 3rgKoZiSZfjSSwx3R8++amQmIbVCMJ5f/hsL2rwLuKVDIVDDpyOZ1aowNi1szPKts7DF
 YIIIyX1sh8xqnfUQH6Pr54OTrP4ctL6dRLzt0/ssTwGk8V1Qz54LwtqZIebLH+T5qIdg
 l4jULJdMm71aq4ulXRUlOHz07SP1AOs737uvCgdbbM0h/MTEDyUkC6SV+nYJ5ri28vMt
 g45zXY0ho60K1gVtG8r0e96e7e5CvP5MECvgDodK9Gy/h4Ql3AjUbRY44Wy2kDZ/eN7b
 K0Vg==
X-Gm-Message-State: APjAAAUh718616jMh/AExeOLAuCuMGS2gl7S79FBjdcr7+t0LFo4wz25
 tTSKSHbS2hpo30rcF2yM80M=
X-Google-Smtp-Source: APXvYqyjEZqkigsllY8lLv0QTu2aQyVW6ZoI0kroacq7cig6S5N63nGzsKEUes4X5JLgKoay+Q35lw==
X-Received: by 2002:a05:600c:251:: with SMTP id
 17mr4452582wmj.88.1578498878609; 
 Wed, 08 Jan 2020 07:54:38 -0800 (PST)
Received: from debian (11.163.200.146.dyn.plus.net. [146.200.163.11])
 by smtp.gmail.com with ESMTPSA id i10sm4966009wru.16.2020.01.08.07.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2020 07:54:38 -0800 (PST)
Date: Wed, 8 Jan 2020 15:54:36 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200108155436.unke6wgu4nyo3laf@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-4-liuwe@microsoft.com>
 <8437e48d-b22c-68c1-f589-fd945c011a3f@suse.com>
 <20200107163339.rwqo6ybwzxgi77e4@debian>
 <af2dd5b5-f5a4-6fe3-5654-6d84739e6d92@suse.com>
 <20200107172720.onwjgb7x2hsrrivz@debian>
 <8d19ba65-95f6-1e5e-1ff7-e6d488fedb90@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8d19ba65-95f6-1e5e-1ff7-e6d488fedb90@suse.com>
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

T24gV2VkLCBKYW4gMDgsIDIwMjAgYXQgMTE6NTU6MDNBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMDcuMDEuMjAyMCAxODoyNywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgSmFu
IDA3LCAyMDIwIGF0IDA2OjA4OjE5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDA3LjAxLjIwMjAgMTc6MzMsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgSmFuIDA2LCAy
MDIwIGF0IDExOjI3OjE4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+Pj4gT24gMDUu
MDEuMjAyMCAxNzo0NywgV2VpIExpdSB3cm90ZToKPiA+Pj4+PiBIeXBlci1WJ3MgaW5wdXQgLyBv
dXRwdXQgYXJndW1lbnQgbXVzdCBiZSA4IGJ5dGVzIGFsaWduZWQgYW4gbm90IGNyb3NzCj4gPj4+
Pj4gcGFnZSBib3VuZGFyeS4gVGhlIGVhc2llc3Qgd2F5IHRvIHNhdGlzZnkgdGhvc2UgcmVxdWly
ZW1lbnRzIGlzIHRvIHVzZQo+ID4+Pj4+IHBlcmNwdSBwYWdlLgo+ID4+Pj4KPiA+Pj4+IEknbSBu
b3Qgc3VyZSAiZWFzaWVzdCIgaXMgcmVhbGx5IHRydWUgaGVyZS4gT3RoZXJzIGNvdWxkIGNvbnNp
ZGVyIGFkZGluZwo+ID4+Pj4gX19hbGlnbmVkKCkgYXR0cmlidXRlcyBhcyBlYXN5IG9yIGV2ZW4g
ZWFzaWVyIChieSBiZWluZyBldmVuIG1vcmUKPiA+Pj4+IHRyYW5zcGFyZW50IHRvIHVzZSBzaXRl
cykuIENvdWxkIHdlIHNldHRsZSBvbiAiT25lIHdheSAuLi4iPwo+ID4+Pgo+ID4+PiBEbyB5b3Ug
bWVhbiBzb21ldGhpbmcgbGlrZQo+ID4+Pgo+ID4+PiAgICBzdHJ1Y3QgZm9vIF9fYWxpZ25lZCg4
KTsKPiA+Pgo+ID4+IElmIHRoaXMgaXMgaW4gYSBoZWFkZXIgYW5kIC4uLgo+ID4+Cj4gPj4+ICAg
IGh2X2RvX2h5cGVyY2FsbChPUCwgdmlydF90b19tYWRkcigmZm9vKSwgLi4uKTsKPiA+Pgo+ID4+
IC4uLiB0aGlzIGluIGFjdHVhbCBjb2RlLCB0aGVuIHllcy4KPiA+Pgo+ID4+PiA/Cj4gPj4+Cj4g
Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyB0cmFuc3BhcmVudCB0byB1c2VyIHNpdGVzLiBQbHVz
LCBmb28gaXMgb24gc3RhY2sKPiA+Pj4gd2hpY2ggaXMgMSkgZGlmZmljdWx0IHRvIGdldCBpdHMg
bWFkZHIsCj4gPj4KPiA+PiBJdCBiZWluZyBvbiB0aGUgc3RhY2sgbWF5IGluZGVlZCBjb21wbGlj
YXRlIGdldHRpbmcgaXRzIG1hY2hpbmUgYWRkcmVzcwo+ID4+IChpZiBub3Qgbm93LCB0aGVuIGRv
d24gdGhlIHJvYWQpIC0gdmFsaWQgcG9pbnQuCj4gPj4KPiA+Pj4gMikgbWF5IGNyb3NzIHBhZ2Ug
Ym91bmRhcnkuCj4gPj4KPiA+PiBUaGUgX19hbGlnbmVkKCkgb2YgY291cnNlIG5lZWRzIHRvIGJl
IGxhcmdlIGVub3VnaCB0byBhdm9pZCB0aGlzCj4gPj4gaGFwcGVuaW5nLgo+ID4gCj4gPiBGb3Ig
dGhpcyBhbGlnbm1lbnQgdG8gYmUgbGFyZ2UgZW5vdWdoLCBpdCB3aWxsIG5lZWQgdG8gYmUgb2Yg
UEFHRV9TSVpFLAo+ID4gcmlnaHQ/IFdvdWxkbid0IHRoYXQgYmxvdyB1cCBYZW4ncyBzdGFjayBl
YXNpbHk/ICBHaXZlbiB3ZSBvbmx5IGhhdmUgdHdvCj4gPiBwYWdlcyBmb3IgdGhhdC4KPiAKPiBX
aHkgUEFHRV9TSVpFPyBGb3IgZXhhbXBsZSwgYSAyNC1ieXRlIHN0cnVjdHVyZSB3b24ndCBjcm9z
cyBhIHBhZ2UKPiBib3VuZGFyeSBpZiBhbGlnbmVkIHRvIDMyIGJ5dGVzLgo+IAoKWW91J3JlIHJp
Z2h0LgoKSSBzYWlkIFBBR0VfU0laRSBiZWNhdXNlIEkgd2FzIHRvbyBsYXp5IHRvIGNhbGN1bGF0
ZSB0aGUgc2l6ZSBvZiBldmVyeQpzdHJ1Y3R1cmVzLiBUaGF0J3MgdGVkaW91cyBhbmQgZXJyb3Ig
cHJvbmUuCgo+ID4gSW4gbGlnaHQgb2YgdGhlc2UgcmVzdHJpY3Rpb25zLCB0aGUgYXBwcm9hY2gg
SSB0YWtlIGluIHRoZSBvcmlnaW5hbAo+ID4gcGF0Y2ggc2hvdWxkIGJlIG9rYXkuCj4gPiAKPiA+
IEknbSBmaW5lIHdpdGggY2hhbmdpbmcgdGhlIHdvcmRpbmcgdG8gIk9uZSB3YXkgLi4uIiAtLSBp
ZiB0aGF0J3MgdGhlCj4gPiBvbmx5IG9iamVjdGlvbiB5b3UgaGF2ZSBhZnRlciB0aGlzIG1haWwu
Cj4gCj4gV2VsbCwgdGhlIGdvYWwgd2FzIHRvIChhKSBjaGVjayB3aGV0aGVyIGFsdGVybmF0aXZl
cyBoYXZlIGJlZW4gY29uc2lkZXJlZAo+IChhbmQgaWYgbm90LCB0byBjb25zaWRlciB0aGVtKSBh
bmQgdGhlbiAoYikgaWYgd2Ugc3RpY2sgdG8geW91ciBhcHByb2FjaCwKPiBzbGlnaHRseSBjaGFu
Z2UgdGhlIHdvcmRpbmcgYXMgc3VnZ2VzdGVkLgoKSSB0aGluayB0aGUgZGV0ZXJtaW5pbmcgZmFj
dG9yIGhlcmUgaXMgdG8gdGhlIGRpZmZpY3VsdHkgb2YgZ2V0dGluZwptYWRkciBvZiBhIHN0YWNr
IHZhcmlhYmxlLiBJIHdpbGwgc3RpY2sgd2l0aCB0aGlzIGFwcHJvYWNoIGFuZCBjaGFuZ2UKdGhl
IHdvcmRpbmcuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
