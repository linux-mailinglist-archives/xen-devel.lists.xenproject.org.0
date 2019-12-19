Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FA8126777
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 17:56:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihz2S-0002Tc-OW; Thu, 19 Dec 2019 16:52:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihz2R-0002TX-HE
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 16:52:35 +0000
X-Inumbo-ID: f365620d-227f-11ea-9212-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f365620d-227f-11ea-9212-12813bfff9fa;
 Thu, 19 Dec 2019 16:52:33 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576774353; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=GjSVbaTqkYgJIccHsW7UUPEHybTTX58FgXZQ4/c0tzY=;
 b=EWeyM9RBX6iS1InpbydJr5O2E2MycNW9Q3/OpxJX9p/QdNhE5bzCiQ7LCC/ZDLQb2HYIRm+N
 /zDI2lhvG1r1TNYGDc9VKC8vFPcB2KrDe9D1UPdy4OZU9aF5iECyd8bW457qKBx9eJ4TlAow
 a2/JKjrvvrgQgGcW/12dJr/Pbho=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mxa.mailgun.org with ESMTP id 5dfba15b.7f0b8a7cfeb0-smtp-out-n03;
 Thu, 19 Dec 2019 16:12:11 -0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id w15so6572260wru.4
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:12:11 -0800 (PST)
X-Gm-Message-State: APjAAAWXKgEikAMic83jIJdJGaaFYOrY81e+bzc6wWuATWbGshdMRJR7
 m7hf1hiTm/DF8QQ/6zfREkl9uCLeGLWpMbXvsIU=
X-Google-Smtp-Source: APXvYqzf9SmKv3nFinzous9yQ6rsengK3aZg2VEgc7weXj4pvupluMDPwsQ/CFzlpBqoNEvG4aYNS+BFmpWLOa3yyzY=
X-Received: by 2002:a5d:6802:: with SMTP id w2mr10033125wru.353.1576771929746; 
 Thu, 19 Dec 2019 08:12:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <22a6cb7bd5593ed38cf6f66c26c4734a04718e1a.1576697796.git.tamas.lengyel@intel.com>
 <c6d975b9-638f-355d-79f8-1c1fae4c6007@xen.org>
 <CABfawhnVbzv4UEQFQoRwYurKOWB4Vw=OtsxXUDtFX1HRxr-sWA@mail.gmail.com>
 <5339f10e-6d93-35ac-5777-acf13ba9835f@xen.org>
 <CABfawhmzjE6c0msjpPEBTciTnCTVQGd46ovSuB_7qqXdY6BvsQ@mail.gmail.com>
 <18414678-5d0a-a2b4-f6ba-61464a0127c0@xen.org>
In-Reply-To: <18414678-5d0a-a2b4-f6ba-61464a0127c0@xen.org>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:11:33 -0700
X-Gmail-Original-Message-ID: <CABfawhnReiUnM9_BG9bBJ4994MdS2zd46NyTztGtJsqQXsR3-w@mail.gmail.com>
Message-ID: <CABfawhnReiUnM9_BG9bBJ4994MdS2zd46NyTztGtJsqQXsR3-w@mail.gmail.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [Xen-devel] [PATCH v2 19/20] x86/mem_sharing: reset a fork
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiA+IFdlbGwsIHRoaXMgaXMgb25seSBhbiBleHBlcmltZW50YWwgc3lzdGVtIHRoYXQncyBjb21w
bGV0ZWx5IGRpc2FibGVkCj4gPiBieSBkZWZhdWx0LiBNYWtpbmcgdGhlIGFzc3VtcHRpb24gdGhh
dCBwZW9wbGUgd2hvIG1ha2UgdXNlIG9mIGl0IHdpbGwKPiA+IGtub3cgd2hhdCB0aGV5IGFyZSBk
b2luZyBJIHRoaW5rIGlzIGZhaXIuCj4KPiBJIGFzc3VtZSB0aGF0IGlmIHlvdSBzdWJtaXQgdG8g
dXBzdHJlYW0gdGhpcyBuZXcgaHlwZXJjYWxsIHRoZW4gdGhlcmUgaXMKPiBsb25nZXIgcGxhbiB0
byBoYXZlIG1vcmUgcGVvcGxlIHRvIHVzZSBpdCBhbmQgcG90ZW50aWFsbHkgbWFraW5nCj4gInN0
YWJsZSIuIElmIG5vdCwgdGhlbiBpdCByYWlzZXMgdGhlIHF1ZXN0aW9uIHdoeSB0aGlzIGlzIHB1
c2hlZCB1cHN0cmVhbS4uLgoKSXQncyBiZWluZyBwdXNoZWQgdXBzdHJlYW0gc28gb3RoZXIgcGVv
cGxlIGNhbiBtYWtlIHVzZSBvZiBpdCwgZXZlbiBpZgppdCdzIG5vdCAicHJvZHVjdGlvbiBxdWFs
aXR5Ii4gQmV5b25kIHdoYXQgaXMgYmVpbmcgc2VudCBoZXJlIHRoZXJlCmFyZSBubyBsb25nZXIg
dGVybSBwbGFucyBmcm9tIEludGVsIChhdCB0aGlzIHBvaW50KSB0byBzdXBwb3J0IHRoaXMgaW4K
YW55IHdheS4gVGhlIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRoYXQgd2UganVzdCByZWxlYXNlIGEg
Zm9yayAob3IganVzdAp0aGUgcGF0Y2hlcykgYW5kIHdhbGsgYXdheS4gSWYgdGhlIFhlbiBjb21t
dW5pdHkgd2FudHMgdG8gbWFrZSB0aGUKYW5ub3VuY2VtZW50IHRoYXQgb25seSBjb2RlIHRoYXQg
d2lsbCBoYXZlIGxvbmcgdGVybSBzdXBwb3J0IGFuZCBpcwoic3RhYmxlIiBpcyBhY2NlcHRlZCB1
cHN0cmVhbSB0aGF0J3MgSU1ITyBkcmFzdGljYWxseSBnb2luZyB0byByZWR1Y2UKcGVvcGxlJ3Mg
aW50ZXJlc3QgdG8gc2hhcmUgYW55dGhpbmcuCgo+IEluIGFueSBjYXNlLCBhbGwgdGhlIGtub3du
IGFzc3VtcHRpb25zIHNob3VsZCBiZSBkb2N1bWVudGVkIHNvIHRoZXkgY2FuCj4gYmUgZml4ZWQg
cmF0aGVyIHRoYW4gZm9yZ290dGVuIHVudGlsIGl0IGlzIHJlZGlzY292ZXJlZCB2aWEgYW4gWFNB
LgoKRmFpciBlbm91Z2guCgo+ID4KPiA+Pgo+ID4+PiBHcmFudGVkIHRoZSBsaXN0IGNhbiBncm93
IGxhcmdlciwgYnV0IGluIHRob3NlIGNhc2VzIGl0cyBsaWtlbHkgYmV0dGVyCj4gPj4+IHRvIGp1
c3QgZGlzY2FyZCB0aGUgZm9yayBhbmQgY3JlYXRlIGEgbmV3IG9uZS4gU28gaW4gbXkgb3Bpbmlv
biBhZGRpbmcKPiA+Pj4gYSBoeXBlcmNhbGwgY29udGludWF0aW9uIHRvIHRoaXMgbm90IG5lZWRl
ZAo+ID4+Cj4gPj4gSG93IHdvdWxkIHRoZSBjYWxsZXIga25vdyBpdD8gV2hhdCB3b3VsZCBoYXBw
ZW4gaWYgdGhlIGNhbGxlciBlbmRzIHVwIHRvCj4gPj4gY2FsbCB0aGlzIHdpdGggYSBncm93aW5n
IGxpc3QuCj4gPgo+ID4gVGhlIGNhbGxlciBrbm93cyBieSB2aXJ0dWUgb2Yga25vd2luZyBob3cg
bG9uZyB0aGUgVk0gd2FzIGV4ZWN1dGVkCj4gPiBmb3IuIEluIHRoZSB1c2VjYXNlIHRoaXMgaXMg
dGFyZ2V0ZWQgYXQgdGhlIFZNIHdhcyBleGVjdXRpbmcgb25seSBmb3IKPiA+IGEgY291cGxlIHNl
Y29uZHMgYXQgbW9zdC4gVXN1YWxseSBtdWNoIGxlc3MgdGhlbiB0aGF0ICh3ZSBnZXQgYWJvdXQK
PiA+IH44MCByZXNldHMvcyB3aXRoIEFGTCkuIER1cmluZyB0aGF0IHRpbWUgaXRzIGV4dHJlbWVs
eSB1bmxpa2VseSB5b3UKPiA+IGdldCBtb3JlIHRoZW4gYSB+MTAwIHBhZ2VzIGRlZHVwbGljYXRl
ZCAodGhhdCBpcywgd3JpdHRlbiB0bykuIEJ1dAo+ID4gZXZlbiBpZiB0aGVyZSBhcmUgbW9yZSBw
YWdlcywgaXQganVzdCBtZWFucyB0aGUgaHlwZXJjYWxsIG1pZ2h0IHRha2UgYQo+ID4gYml0IGxv
bmdlciB0byBydW4gZm9yIHRoYXQgaXRlcmF0aW9uLgo+Cj4gSSBhc3N1bWUgaWYgeW91IHVwc3Ry
ZWFtIHRoZSBjb2RlIHRoZW4geW91IHdhbnQgbW9yZSBwZW9wbGUgdG8gdXNlIGl0Cj4gKG90aGVy
d2lzZSB3aGF0J3MgdGhlIHBvaW50PykuIEluIHRoaXMgY2FzZSwgeW91IHdpbGwgbGlrZWx5IGhh
dmUgcGVvcGxlCj4gdGhhdCBoZWFyZCBhYm91dCB0aGUgZmVhdHVyZSwgd2FudHMgdG8gdGVzdCBi
dXQgZG9uJ3Qga25vdyB0aGUgaW50ZXJuYWwuCj4KPiBTdWNoIHVzZXJzIG5lZWQgdG8ga25vdyBo
b3cgdGhpcyBjYW4gYmUgY2FsbCBzYWZlbHkgd2l0aG91dCByZWFkaW5nIHRoZQo+IGltcGxlbWVu
dGF0aW9uLiBJbiBvdGhlciB3b3Jkcywgc29tZSBkb2N1bWVudGF0aW9uIGZvciB5b3VyIGh5cGVy
Y2FsbCBpcwo+IG5lZWRlZC4KClN1cmUuCgo+Cj4gPiBJIGRvbid0IHNlZSBhbnkgaXNzdWUgd2l0
aCBub3QKPiA+IGJyZWFraW5nIHVwIHRoaXMgaHlwZXJjYWxsIHdpdGggY29udGludWF0aW9uIGV2
ZW4gdW5kZXIgdGhlIHdvcnN0IGNhc2UKPiA+IHNpdHVhdGlvbiB0aG91Z2guCj4KPiBYZW4gb25s
eSBzdXBwb3J0cyB2b2x1bnRhcnkgcHJlZW1wdGlvbiwgdGhpcyBtZWFucyB0aGF0IGFuIGh5cGVy
Y2FsbCBjYW4KPiBvbmx5IGJlIHByZWVtcHRlZCBpZiB0aGVyZSBpcyBjb2RlIGZvciBpdC4gT3Ro
ZXJ3aXNlIHRoZSBwcmVlbXB0aW9uIHdpbGwKPiBtb3N0bHkgb25seSBoYXBwZW4gd2hlbiByZXR1
cm5pbmcgdG8gdGhlIGd1ZXN0Lgo+Cj4gSW4gb3RoZXIgd29yZHMsIHRoZSB2Q1BVIGV4ZWN1dGlu
ZyB0aGUgaHlwZXJjYWxsIG1heSBnbyBwYXN0IGl0cwo+IHRpbWVzbGljZSBhbmQgcHJldmVudCBv
dGhlciB2Q1BVIHRvIHJ1bi4KPgo+IFRoZXJlIGFyZSBvdGhlciBwcm9ibGVtIHdpdGggbG9uZyBy
dW5uaW5nIGh5cGVyY2FsbHMuIEFueXdheSwgaW4gc2hvcnQsCj4gaWYgeW91IGV2ZXIgd2FudCB0
byBnZXQgeW91IGNvZGUgc3VwcG9ydGVkIHRoZW4geW91IHdpbGwgbmVlZCB0aGUKPiBoeXBlcmNh
bGwgdG8gYmUgYnJva2VuIGRvd24uCj4KPiA+IEJ1dCBpZiBvdGhlcnMgZmVlbCB0aGF0IHN0cm9u
Z2x5IGFzIHdlbGwgYWJvdXQKPiA+IGhhdmluZyB0byBoYXZlIGNvbnRpbnVhdGlvbiBmb3IgdGhp
cyBJIGRvbid0IHJlYWxseSBtaW5kIGFkZGluZyBpdC4KPgo+IEkgZG9uJ3QgdGhpbmsgdGhlIGNv
bnRpbnVhdGlvbiB3b3JrIGlzIGdvaW5nIHRvIGJlIGRpZmZpY3VsdCwgYnV0IGlmIHlvdQo+IHdh
bnQgdG8gZGVsYXkgaXQsIHRoZW4gdGhlIG1pbmltdW0gaXMgdG8gZG9jdW1lbnQgc3VjaCBhc3N1
bXB0aW9ucyBmb3IKPiB5b3VyIHVzZXJzLgoKSSBqdXN0IGRvbid0IHNlZSBhIHVzZSBmb3IgaXQg
YmVjYXVzZSBpdCB3aWxsIG5ldmVyIGFjdHVhbGx5IGV4ZWN1dGUuClNvIHRvIG1lIGl0IGp1c3Qg
bG9va3MgbGlrZSB1bm5lY2Vzc2FyeSBkZWFkIGdsdWUuIEJ1dCBkb2N1bWVudGluZyB0aGUKYXNz
dW1wdGlvbiB1bmRlciB3aGljaCB0aGlzIGh5cGVyY2FsbCBzaG91bGQgZXhlY3V0ZSBpcyBwZXJm
ZWN0bHkKZmFpci4KClRhbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
