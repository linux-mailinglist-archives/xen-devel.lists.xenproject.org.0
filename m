Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1077579046
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 18:04:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs86k-0006UN-Fj; Mon, 29 Jul 2019 16:02:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cdI7=V2=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1hs86i-0006UI-IH
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 16:02:40 +0000
X-Inumbo-ID: 49239f8c-b21a-11e9-92a9-a78c97fe5bf5
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49239f8c-b21a-11e9-92a9-a78c97fe5bf5;
 Mon, 29 Jul 2019 16:02:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1564416158; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=mP4NS5rIOudST7DnB4MyMDWyFNytq+eMM4vVeXhjHyc=;
 b=P/k2dL2v3mGl6jtlstgCsvdvt8mWJZmCRif7H6zcG5JKBdOKeKqFI8xSYA4pmHY7QwWBfo6y
 ntiTiBsMboh3Df7ufPpoxYnZONaScYxXhRCLfFymwPYHmp6KiVY9RNet6DLK08DiVkaE6v5M
 xa9D0TAkUZDJRIoigcpugNBvs3Q=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mxa.mailgun.org with ESMTP id 5d3f189c.7f99b0e20cf0-smtp-out-n03;
 Mon, 29 Jul 2019 16:02:36 -0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id g17so62449848wrr.5
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jul 2019 09:02:36 -0700 (PDT)
X-Gm-Message-State: APjAAAXdv13FedcCIwsERBbFmWYrOSJe4t1SKlPrKmKri91I/ZxiAP8Q
 mk8RjZmvH+BPXqdnNH1Uwuu4Vfb8mwcLYb7dfr8=
X-Google-Smtp-Source: APXvYqwhKKZ73FKfd9Rb3gnsy1Sfg9G9jVbVClLlQUyvm3QF7nLPBtsTEU8bP3P94798gmXNkbgWP66jpq5jcV+QdVQ=
X-Received: by 2002:adf:ef8d:: with SMTP id d13mr117263457wro.60.1564416155696; 
 Mon, 29 Jul 2019 09:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190717193335.11991-1-tamas@tklengyel.com>
 <20190717193335.11991-2-tamas@tklengyel.com>
 <66bbd9f7-12f9-b654-555d-a02d5f4f0dba@suse.com>
 <CABfawhkJR8sz8cVCfcuxQ-4+xoQOSTs-XQuow-qzPyd4xZwq0g@mail.gmail.com>
 <b6cdc457-01e8-03cf-5408-11337e5a10d9@suse.com>
 <CABfawhkAcoHm_+5ob6nge4xELUvpb4kZXoC+n_7sF-PNK+untQ@mail.gmail.com>
 <6e2986dd-5416-4ef3-c00b-eca4db578e7c@suse.com>
 <CABfawh=6vwfcRqHMrbgojduvvAk5jMJ_u=vOt=r-3sCiYGapoA@mail.gmail.com>
 <f3fc709b-d959-07f3-c047-a1da24816e09@suse.com>
 <CABfawhkvmiUoRLJaiCU4RwNpCRpcqRthTW9xZ0NLc6CCbS8-uQ@mail.gmail.com>
 <92678567-f9d1-aea4-52e8-d9e1fb6c12e2@suse.com>
 <36a73179-8c2b-4550-ce94-cb630b0b4ea9@citrix.com>
In-Reply-To: <36a73179-8c2b-4550-ce94-cb630b0b4ea9@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 29 Jul 2019 10:01:59 -0600
X-Gmail-Original-Message-ID: <CABfawhnj2_=qCVGCR5+gR8rDqoCyUtRn_E9F1tCOL0OQLPeqDA@mail.gmail.com>
Message-ID: <CABfawhnj2_=qCVGCR5+gR8rDqoCyUtRn_E9F1tCOL0OQLPeqDA@mail.gmail.com>
To: George Dunlap <george.dunlap@citrix.com>
Subject: Re: [Xen-devel] [PATCH v6 1/5] x86/mem_sharing: reorder when pages
 are unlocked and released
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
Cc: Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgOTo0NyBBTSBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVu
bGFwQGNpdHJpeC5jb20+IHdyb3RlOgo+Cj4gT24gNy8xOC8xOSAzOjQ3IFBNLCBKYW4gQmV1bGlj
aCB3cm90ZToKPiA+IE9uIDE4LjA3LjIwMTkgMTY6MzUsIFRhbWFzIEsgTGVuZ3llbCB3cm90ZToK
PiA+PiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCA4OjI4IEFNIEphbiBCZXVsaWNoIDxKQmV1bGlj
aEBzdXNlLmNvbT4gd3JvdGU6Cj4gPj4+IE9uIDE4LjA3LjIwMTkgMTU6NDcsIFRhbWFzIEsgTGVu
Z3llbCB3cm90ZToKPiA+Pj4+IEkgZmVlbCBsaWtlIHdlIGFyZSBnb2luZyBpbiBjaXJjbGVzIGFu
ZCBoYXZpbmcgdGhlIHNhbWUgY29udmVyc2F0aW9ucwo+ID4+Pj4gb3ZlciBhbmQgb3ZlciB3aXRo
b3V0IHJlYWxseSBtYWtpbmcgYW55IGhlYWR3YXkuIFlvdSBpbnRyb2R1Y2VkCj4gPj4+PiBncmFi
YmluZyB0aGUgYnJva2VuIGV4dHJhIHJlZmVyZW5jZSBpbiAwNTAyZTBhZGFlMi4gSXQgaXMgYW5k
IHdhcwo+ID4+Pj4gYWN0dWFsbHkgdW5uZWVkZWQgdG8gc3RhcnQgd2l0aCBpZiB0aGUgcHJvcGVy
IHNvbHV0aW9uIHdhcyBwdXQgaW4KPiA+Pj4+IHBsYWNlLCB3aGljaCBpcyB3aGF0IHRoaXMgcGF0
Y2ggZG9lcywgcmVvcmRlcmluZyB0aGluZ3MuCj4gPj4+Cj4gPj4+IEknbSBub3QgY29tcGxhaW5p
bmcgYWJvdXQgdGhlIGNoYW5nZXM7IEknZCBtZXJlbHkgbGlrZSB0aGUgZGVzY3JpcHRpb24KPiA+
Pj4gc3RhdGUgd2h5IHRoZXkncmUgbmVlZGVkLgo+ID4+Cj4gPj4gT0suCj4gPj4KPiA+Pj4+IEl0
J3MgcG9zc2libGUgdGhlcmUgYXJlIG90aGVyIGluc3RhbmNlcyB3aGVyZSB0aGlzIG1heSBzdGls
bCBiZQo+ID4+Pj4gYnJva2VuLiBSaWdodCBub3cgSSBvbmx5IGhhdmUgYmFuZHdpZHRoIHRvIHRl
c3QgYW5kIGZpeCB0aGUgcGF0aHMgSQo+ID4+Pj4gdXNlLiBJZiB0aGF0J3MgdW5hY2NlcHRhYmxl
IEknbSBoYXBweSB0byBjb250aW51ZSBkZXZlbG9wbWVudCBpbiBteQo+ID4+Pj4gcHJpdmF0ZSBm
b3JrIGFuZCBsZWF2ZSB0aGluZ3MgYXMtaXMgdXBzdHJlYW0uCj4gPj4+Cj4gPj4+IFNpbWlsYXJs
eSwgaWYgdGhlcmUgYXJlIGxpbWl0YXRpb25zIC0gZmluZS4gQnV0IHBsZWFzZSBzYXkgc28gaW4g
dGhlCj4gPj4+IGRlc2NyaXB0aW9uLCB0byBhdm9pZCBnaXZpbmcgdGhlIGltcHJlc3Npb24gdGhh
dCB0aGUgaXNzdWVzIGhhdmUgYmVlbgo+ID4+PiB0YWtlbiBjYXJlIG9mIGFsdG9nZXRoZXIuCj4g
Pj4KPiA+PiBGYWlyIGVub3VnaC4KPiA+Cj4gPiBBbmQgYnR3IC0gaWYgeW91IGp1c3Qgc2VudCBh
biB1cGRhdGVkIGRlc2NyaXB0aW9uLCBJIHRoaW5rIEknZCBjb21taXQKPiA+IHRoaXMgd2l0aG91
dCBmdXJ0aGVyIHdhaXRpbmcgZm9yIEdlb3JnZSB0byBmaW5kIHRpbWUgdG8gZXZlbnR1YWxseSBh
Y2sKPiA+IGl0Lgo+Cj4gVGhhbmtzIC0tIGJ1dCBpdCBsb29rcyBsaWtlIG1heWJlIHlvdSBkaWRu
J3QgY29tbWl0IHRoZSBmaW5hbCBwYXRjaCBvZgo+IHRoZSBzZXJpZXMgKCJ4ODYvbWVtX3NoYXJp
bmc6IHN0eWxlIGNsZWFudXAiKT8KCkphbiByZXF1ZXN0ZWQgYWRkaXRpb25hbCBzdHlsZSBjbGVh
bnVwcyB0byBiZSBhcHBsaWVkLiBJJ2xsIHRyeSB0bwpzZW5kIHRoYXQgaW4gdGhpcyB3ZWVrLgoK
VGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
