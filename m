Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E42E89A4D7
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2019 03:15:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i0y8o-0007n7-1n; Fri, 23 Aug 2019 01:13:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cgMB=WT=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1i0y8m-0007n1-OL
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2019 01:13:20 +0000
X-Inumbo-ID: 315e7ce6-c543-11e9-8980-bc764e2007e4
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 315e7ce6-c543-11e9-8980-bc764e2007e4;
 Fri, 23 Aug 2019 01:13:19 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id c5so7279845wmb.5
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2019 18:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9mq51PBUE7uhpAG/izUn4uuKnYPX4cv4TyCiDLxqD+8=;
 b=eP291aSeSn8S0hLaUvjdnlGb33Um+s9ww4gyk9iKkQaQp5JHAEi1g5+16JV5KZfSMK
 oVr+d64cPF3BlEYykjoWjjIDvEDq3TFa9vxLJ0uqjbTBc3hsVjA70cjALp1kNc77M17Q
 PL64N71IJ7TMkEdGWBwOoPsoxvgWncN7s1PB+5iKnCxkoUKwX59aPf5lzMjMnGfb5qlL
 hLzWpCAGjGOXgWn+JWG4R5CUPVHJAO+KelrTRlF3zp0/Wy/rbvAQMRG97hmduD70UMdE
 2Is60SA0qrykxKXM1r+55L3AxCTcvqgMTa7fxuz/5S+W5JjHJuYWSvfFj+3BgesGDi8n
 w9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9mq51PBUE7uhpAG/izUn4uuKnYPX4cv4TyCiDLxqD+8=;
 b=oVoafbfwfLnapwBIAJTslB+g6RMQKt8M5sSu0u323vQ7aF/FfbfGYVGR9y5dYv92Wo
 LUoNqs9/9bxKqyb4P5q23a3PpiaGDN3+ZxDtVCeS0n+zX7FnMXI8DqfUjZ8Rb/CEnWzA
 VdQ+RqBcVlBRT1QsPhqkqMUwoUetvZmSCFBEOMPpU8E4sbYDNwm9aduvWGwknMm8lnhq
 FBq3NIPpSbJCCE1owWqJsf5+58sWNcg1sJ7D7mhOSA0q5RHOMzOhaKKDypZANa8qJnBV
 Z4yYBXBDEWbBFbgfWSHxcoxvbD/wf0BCjsNaatGuc8AbLs/xBp/zzIksshjlpQualMEw
 XVLQ==
X-Gm-Message-State: APjAAAXT+g4qQpqzxiDbX4gVjqfhUaTE/zYRUA+926kcV6ESCKJ0ebBM
 XgVTTG1+j6Gnsyfuds8ZRL1K+/cy+zRc5tlWWJo=
X-Google-Smtp-Source: APXvYqxFITIP+E8yQqTbkIHJ/EUCl4APDGtSYuKWKJ1LQx5tdPfsR++tQv0NhdWYo4wlCfx65zzu9fDYQNXix7Ev5j0=
X-Received: by 2002:a1c:cb0b:: with SMTP id b11mr1727272wmg.128.1566522798905; 
 Thu, 22 Aug 2019 18:13:18 -0700 (PDT)
MIME-Version: 1.0
References: <15a4c482-1207-1d8a-fd2a-dc4f25956c27@cs.rochester.edu>
 <79c7b71f-0b61-2799-4a79-644536a9c891@citrix.com>
 <d55da430-0d73-8a92-73e7-99e1aa70680c@cs.rochester.edu>
 <5b190182-4938-52b4-eeb2-df77224711c3@citrix.com>
 <587225E8-C0DE-40BA-B39E-E30F9CE69B92@gmail.com>
 <74cb4fb4-9983-0000-9dbb-8fc24921a372@citrix.com>
 <CABfawhm-8Y1X8KZutdBWzGCqUmK__2=g3nEFsN+7oLUMyf-2ow@mail.gmail.com>
 <42da053f-537b-95ce-85b1-bc754fc26d22@citrix.com>
In-Reply-To: <42da053f-537b-95ce-85b1-bc754fc26d22@citrix.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Thu, 22 Aug 2019 19:12:42 -0600
Message-ID: <CABfawhmg4yQ3GOtVRTc+Q0DHRn7ddKS95xQLA=XYXJqBDAqijQ@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] More questions about Xen memory layout/usage,
 access to guest memory
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Rich Persaud <persaur@gmail.com>, "Johnson, Ethan" <ejohns48@cs.rochester.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgNjowMyBQTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDIzLzA4LzIwMTkgMDA6MDYsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDQ6NDAgUE0gQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6Cj4gPj4gT24gMjIvMDgv
MjAxOSAyMTo1NywgUmljaCBQZXJzYXVkIHdyb3RlOgo+ID4+Pj4gT24gQXVnIDIyLCAyMDE5LCBh
dCAwOTo1MSwgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3JvdGU6
Cj4gPj4+Pgo+ID4+Pj4+IE9uIDIyLzA4LzIwMTkgMDM6MDYsIEpvaG5zb24sIEV0aGFuIHdyb3Rl
Ogo+ID4+Pj4+Cj4gPj4+Pj4gRm9yIEhWTSwgb2J2aW91c2x5IGFueXRoaW5nIHRoYXQgY2FuJ3Qg
YmUgdmlydHVhbGl6ZWQgbmF0aXZlbHkgYnkgdGhlCj4gPj4+Pj4gaGFyZHdhcmUgbmVlZHMgdG8g
YmUgZW11bGF0ZWQgYnkgWGVuL1FFTVUgKHNpbmNlIHRoZSBndWVzdCBrZXJuZWwgaXNuJ3QKPiA+
Pj4+PiBleHBlY3RlZCB0byBiZSBjb29wZXJhdGl2ZSB0byBpc3N1ZSBQViBoeXBlcmNhbGxzIGlu
c3RlYWQpOyBidXQgSSB3b3VsZAo+ID4+Pj4+IGV4cGVjdCBlbXVsYXRpb24gdG8gYmUgbGltaXRl
ZCB0byB0aGUgcmVsYXRpdmVseSBzbWFsbCBzdWJzZXQgb2YgdGhlIElTQQo+ID4+Pj4+IHRoYXQg
Vk1YL1NWTSBjYW4ndCBuYXRpdmVseSB2aXJ0dWFsaXplLiBZZXQgSSBzZWUgdGhhdCB4ODZfZW11
bGF0ZS5jCj4gPj4+Pj4gc3VwcG9ydHMgZW11bGF0aW5nIGp1c3QgYWJvdXQgZXZlcnl0aGluZy4g
VW5kZXIgd2hhdCBjaXJjdW1zdGFuY2VzIGRvZXMKPiA+Pj4+PiBYZW4gYWN0dWFsbHkgbmVlZCB0
byBwdXQgYWxsIHRoYXQgZW11bGF0aW9uIGNvZGUgdG8gdXNlPwo+ID4+Pj4gSW50cm9zcGVjdGlv
biwgYXMgSSBzYWlkIGVhcmxpZXIsIHdoaWNoIGlzIHBvdGVudGlhbGx5IGFueSBpbnN0cnVjdGlv
bi4KPiA+Pj4gQ291bGQgaW50cm9zcGVjdGlvbi1zcGVjaWZpYyBlbXVsYXRpb24gY29kZSBiZSBk
aXNhYmxlZCB2aWEgS0NvbmZpZz8KPiA+PiBOb3QgcmVhbGx5Lgo+ID4+Cj4gPj4gQXQgdGhlIHBv
aW50IHNvbWV0aGluZyBoYXMgdHJhcHBlZCBmb3IgZW11bGF0aW9uLCB3ZSBtdXN0IGNvbXBsZXRl
IGl0IGluCj4gPj4gYSBtYW5uZXIgY29uc2lzdGVudCB3aXRoIHRoZSB4ODYgYXJjaGl0ZWN0dXJl
LCBvciB0aGUgZ3Vlc3Qgd2lsbCBjcmFzaC4KPiA+Pgo+ID4+IElmIHlvdSBkb24ndCB3YW50IGVt
dWxhdGlvbiBmcm9tIGludHJvc3BlY3Rpb24sIGRvbid0IHN0YXJ0Cj4gPj4gaW50cm9zcGVjdGlu
ZyBpbiB0aGUgZmlyc3QgcGxhY2UsIGF0IHdoaWNoIHBvaW50IGd1ZXN0IGFjdGlvbnMgd29uJ3QK
PiA+PiB0cmFwIGluIHRoZSBmaXJzdCBwbGFjZS4KPiA+IFRoYXQncyBpbmNvcnJlY3QsIHlvdSBj
YW4gYWJzb2x1dGVseSBkbyBpbnRyb3NwZWN0aW9uIHdpdGggdm1fZXZlbnRzCj4gPiBhbmQgTk9U
IGVtdWxhdGUgYW55dGhpbmcuIFlvdSBjYW4gaGF2ZSBhbHRwMm0gaW4gcGxhY2Ugd2l0aCBkaWZm
ZXJlbnQKPiA+IG1lbW9yeSBwZXJtaXNzaW9ucyBzZXQgaW4gZGlmZmVyZW50IHZpZXdzIGFuZCBz
d2l0Y2ggYmV0d2VlbiB0aGUgdmlld3MKPiA+IHdpdGggTVRGIGVuYWJsZWQgdG8gYWxsb3cgdGhl
IHN5c3RlbSB0byBjb250aW51ZSBleGVjdXRpbmcuIFRoaXMgZG9lcwo+ID4gbm90IHJlcXVpcmUg
ZW11bGF0aW9uIG9mIGFueXRoaW5nLiBJIHdvdWxkIGJlIGJlaGluZCBhIEtDT05GSUcgb3B0aW9u
Cj4gPiB0aGF0IHR1cm5zIG9mZiBwYXJ0cyBvZiB0aGUgZW11bGF0b3IgdGhhdCBhcmUgb25seSB1
c2VkIGJ5IGEgc3Vic2V0IG9mCj4gPiBpbnRyb3NwZWN0aW9uIHVzZWNhc2VzLiBCdXQgdGhpcyBz
aG91bGQgbm90IGJlIGFuIG9wdGlvbiB0aGF0IHR1cm5zCj4gPiBvZmYgaW50cm9zcGVjdGlvbiBp
dHNlbGYsIHRoZSB0d28gdGhpbmdzIGFyZSBOT1QgaW50ZXItZGVwZW5kZW50Lgo+Cj4gSSBmZWFy
IHdlIGFyZSBnZXR0aW5nIHNsaWdodGx5IG9mZiB0cmFjayBoZXJlLCBidXQgSSdsbCBiaXRlLi4u
Cj4KPiBJbnRyb3NwZWN0aW9uIGlzIGEgeW91bmcgdGVjaG5vbG9neSwgd2l0aCB2YXN0IHBvdGVu
dGlhbC4gIFRoaXMgaXMgZ3JlYXQKPiAtIGl0IG1lYW5zIHRoZXJlIGlzIGEgbG90IG9mIG5vdmVs
IFImRCBnb2luZyBpbnRvIGl0LiAgSXQgZG9lc24ndCBtZWFuCj4gdGhhdCBhbGwgYXNwZWN0cyBv
ZiBpdCBhcmUgdmlhYmxlIGZvciB1c2UgYnkgY3VzdG9tZXJzIHRvZGF5Lgo+Cj4gSSdsbCBoYXZl
IGFuIGVhc2llciB0aW1lIGJlbGlldmluZyB0aGF0IGFsdHAybSBpcyBjbG9zZSB0byBiZWluZwo+
IHByb2R1Y3Rpb24gcmVhZHkgd2hlbiBJIG5vIGxvbmdlciBmaW5lIHNlY3VyaXR5LXJlbGV2YW50
IGJ1Z3MgaW4gaXQKPiBldmVyeSB0aW1lIEkgZ28gbG9va2luZywgYW5kIHNvbWVvbmUgaGFzIG1h
ZGUgYSBjb2hlcmVudCBhdHRlbXB0IHRvCj4ganVzdGlmeSBpdCBiZWluZyBzZWN1cml0eSBzdXBw
b3J0ZWQuCgpJIGRpZG4ndCBzYXkgYWx0cDJtIGlzIHNlY3VyaXR5IHN1cHBvcnRlZCBvciB0aGF0
IGl0J3MgInByb2R1Y3Rpb24KcmVhZHkiLCBvbmx5IHRoYXQgaXQncyBhIHZpYWJsZSBhbHRlcm5h
dGl2ZSB0byB1c2luZyB0aGUgZW11bGF0b3IuCldpdGggdGhlIGV4dGVybmFsLW9ubHkgbW9kZSBJ
IGFkZGVkIEkgZG9uJ3Qgc2VlIGFueSBhZGRpdGlvbmFsIGF0dGFjawpzdXJmYWNlIGFzIGNvbXBh
cmVkIHRvIHJlZ3VsYXIgdXNlIG9mIEVQVCwgYnV0IG9mIGNvdXJzZSBJIHdvdWxkIGJlCnZlcnkg
aW50ZXJlc3RlZCBpbiB0aGUgc2VjdXJpdHkgYnVncyB5b3Ugc2VlbSB0byBiZSBmaW5kaW5nIGxl
ZnQgYW5kCnJpZ2h0LiBJbiBteSBleHBlcmllbmNlIGl0J3MgdGhlIGVtdWxhdG9yIHRoYXQncyBi
dWdneSAob3Igc2ltcGx5CmluY29tcGxldGUpLgoKPgo+IE5vbmUgb2YgdGhpcyBhbHRlcnMgdGhl
IGZhY3QgdGhhdCBpbnRyb3NwZWN0aW9uIGluIGdlbmVyYWwgaXMgb25lIGtleQo+IGZhY3RvciBh
cyB0byB3aHkgd2UgaGF2ZSBhIG1vc3RseS1jb21wbGV0ZSB4ODZfZW11bGF0ZSgpIChldmVuIGlm
ICJ4ODYKPiBlbXVsYXRlIiBpcyBhIHNsaWdodGx5IHBvb3IgY2hvaWNlIG9mIG5hbWUuICAiZGVj
b2RlIGFuZCByZXBsYXkiIHdvdWxkCj4gYmUgYSBmYXIgbW9yZSBhcHQgZGVzY3JpcHRpb24gb2Yg
d2hhdCBpdCBkb2VzIGZvciB0aGUgbWFqb3JpdHkgb2YKPiBpbnN0cnVjdGlvbnMuKQoKV2hpY2gg
aXMgZmluZSwgYnV0IGlmIHBlb3BsZSBmaW5kIHRoZSBwcmVzZW5jZSBvZiBhIGZ1bGwgeDg2IGVt
dWxhdG9yCnRyb3VibGluZyBhbmQgd2FudCB0byBkaXNhYmxlIGFzIG11Y2ggb2YgaXQgYXMgcG9z
c2libGUsIHNheWluZyB0aGF0Cml0J3MgbmVlZGVkIGZvciBpbnRyb3NwZWN0aW9uIGlzIGluY29y
cmVjdC4gSXQgaXMgbm90IG5lZWRlZCBmb3IKaW50cm9zcGVjdGlvbi4gU28gSSdtIG5vdCBPSyB3
aXRoIHVzaW5nIHRoYXQganVzdGlmaWNhdGlvbiBmb3Iga2VlcGluZwppdC4gTm9yIHdvdWxkIEkg
bGlrZSB0byBzZWUgYW4gb3B0aW9uIHRoYXQgc2F5cyB0aGF0IGlmIHlvdSBhcmUgZG9pbmcKaW50
cm9zcGVjdGlvbiB5b3UgX211c3RfIGhhdmUgdGhhdCBmdWxsIGVtdWxhdG9yIGluIHBsYWNlLiBZ
b3Ugc2ltcGx5CmRvbid0LgoKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
