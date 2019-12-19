Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF201267F2
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 18:25:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihzVj-0005IG-2k; Thu, 19 Dec 2019 17:22:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=p4n+=2J=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-us1.protection.inumbo.net>)
 id 1ihzVh-0005I6-CR
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 17:22:49 +0000
X-Inumbo-ID: 2dc66d48-2284-11ea-922d-12813bfff9fa
Received: from rs224.mailgun.us (unknown [209.61.151.224])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dc66d48-2284-11ea-922d-12813bfff9fa;
 Thu, 19 Dec 2019 17:22:48 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; 
 s=krs; t=1576776168; h=Content-Type: Cc: To: Subject: Message-ID: Date:
 From: In-Reply-To: References: MIME-Version: Sender;
 bh=MSEsPDQoccR13L2K4B1kfraUEPq6QZ8EBBbGQVe65hE=;
 b=iIl4SgSvcmKV1OXRfv0JCFfTIGX0BNV14lz4d8Rfxq7x1moCH0UUgFO20PhEz0vsScGuvZ8/
 Ai8OMR15TccIi43kj5ulAcnbrC1OTPp2T92P733DXqnd5aIN8i+K0OJn71/9/rOBPnvKnt/r
 /Tji2OBrlrVvliCxfUJJE9c71x4=
X-Mailgun-Sending-Ip: 209.61.151.224
X-Mailgun-Sid: WyIyYTNmOCIsICJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmciLCAiY2Q4NDAiXQ==
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mxa.mailgun.org with ESMTP id 5dfba3c4.7fbad22472b0-smtp-out-n01;
 Thu, 19 Dec 2019 16:22:28 -0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t14so6237222wmi.5
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2019 08:22:27 -0800 (PST)
X-Gm-Message-State: APjAAAVM2B3uf5vlwy0oz6PAfN+Wq0w3VaW+9ett+lFbtIAs5SLdFIE3
 alD6YeQDZrwzm7Qdh+hGmh9Es2qk8wc5HozQ6U0=
X-Google-Smtp-Source: APXvYqybB7mp+jsrgS8ODkyZsxpMC/uWF/wZb1TG3PJCjo4rbWgg+/gVnhy/tDH+1gubj5duTm6Wu5V1nvVsuKUBqvM=
X-Received: by 2002:a05:600c:2c7:: with SMTP id
 7mr10549103wmn.87.1576772546492; 
 Thu, 19 Dec 2019 08:22:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576697796.git.tamas.lengyel@intel.com>
 <cacdc0909f85b78b69c07ba5230b84ceae82954a.1576697796.git.tamas.lengyel@intel.com>
 <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
In-Reply-To: <a8af0ab7-0396-f57b-2610-4417220034e2@citrix.com>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Thu, 19 Dec 2019 09:21:49 -0700
X-Gmail-Original-Message-ID: <CABfawhkAh1Fr4XEGaf4UoHE=APoqutFoAKTjWjSEWJSh_3bjwg@mail.gmail.com>
Message-ID: <CABfawhkAh1Fr4XEGaf4UoHE=APoqutFoAKTjWjSEWJSh_3bjwg@mail.gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [Xen-devel] [PATCH v2 04/20] x86/mem_sharing: cleanup code and
 comments in various locations
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
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBEZWMgMTksIDIwMTkgYXQgNDoxOSBBTSBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToKPgo+IE9uIDE4LzEyLzIwMTkgMTk6NDAsIFRhbWFzIEsg
TGVuZ3llbCB3cm90ZToKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvaHZtL2h2bS5jIGIv
eGVuL2FyY2gveDg2L2h2bS9odm0uYwo+ID4gaW5kZXggNWEzYTk2MmZiYi4uMWU4ODhiNDAzYiAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vaHZtLmMKPiA+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9odm0vaHZtLmMKPiA+IEBAIC0xOTAyLDEyICsxOTAyLDExIEBAIGludCBodm1faGFwX25l
c3RlZF9wYWdlX2ZhdWx0KHBhZGRyX3QgZ3BhLCB1bnNpZ25lZCBsb25nIGdsYSwKPiA+ICAgICAg
aWYgKCBucGZlYy53cml0ZV9hY2Nlc3MgJiYgKHAybXQgPT0gcDJtX3JhbV9zaGFyZWQpICkKPiA+
ICAgICAgewo+ID4gICAgICAgICAgQVNTRVJUKHAybV9pc19ob3N0cDJtKHAybSkpOwo+ID4gLSAg
ICAgICAgc2hhcmluZ19lbm9tZW0gPQo+ID4gLSAgICAgICAgICAgIChtZW1fc2hhcmluZ191bnNo
YXJlX3BhZ2UoY3VycmQsIGdmbiwgMCkgPCAwKTsKPiA+ICsgICAgICAgIHNoYXJpbmdfZW5vbWVt
ID0gbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGN1cnJkLCBnZm4sIDApOwo+Cj4gVGhpcyBpcyBh
IGxvZ2ljYWwgY2hhbmdlLiAgSXMgaXQgaW50ZW5kZWQgdG8gYmUgaW4gYSBsYXRlciBwYXRjaD8K
Pgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmluZy5jIGIveGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+IGluZGV4IGVmYjg4MjE3NjguLjMxOWFhZjMwNzQg
MTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwo+ID4gKysrIGIv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKPiA+IEBAIC0xOTgsMjQgKzIwMCwyNiBAQCBz
dGF0aWMgaW5saW5lIHNocl9oYW5kbGVfdCBnZXRfbmV4dF9oYW5kbGUodm9pZCkKPiA+ICAjZGVm
aW5lIG1lbV9zaGFyaW5nX2VuYWJsZWQoZCkgXAo+ID4gICAgICAoaXNfaHZtX2RvbWFpbihkKSAm
JiAoZCktPmFyY2guaHZtLm1lbV9zaGFyaW5nX2VuYWJsZWQpCj4gPgo+ID4gLXN0YXRpYyBhdG9t
aWNfdCBucl9zYXZlZF9tZm5zICAgPSBBVE9NSUNfSU5JVCgwKTsKPiA+ICtzdGF0aWMgYXRvbWlj
X3QgbnJfc2F2ZWRfbWZucyAgID0gQVRPTUlDX0lOSVQoMCk7Cj4gPiAgc3RhdGljIGF0b21pY190
IG5yX3NoYXJlZF9tZm5zICA9IEFUT01JQ19JTklUKDApOwo+ID4KPiA+IC0vKiogUmV2ZXJzZSBt
YXAgKiovCj4gPiAtLyogRXZlcnkgc2hhcmVkIGZyYW1lIGtlZXBzIGEgcmV2ZXJzZSBtYXAgKHJt
YXApIG9mIDxkb21haW4sIGdmbj4gdHVwbGVzIHRoYXQKPiA+ICsvKgo+ID4gKyAqIFJldmVyc2Ug
bWFwCj4gPiArICoKPiA+ICsgKiBFdmVyeSBzaGFyZWQgZnJhbWUga2VlcHMgYSByZXZlcnNlIG1h
cCAocm1hcCkgb2YgPGRvbWFpbiwgZ2ZuPiB0dXBsZXMgdGhhdAo+ID4gICAqIHRoaXMgc2hhcmVk
IGZyYW1lIGJhY2tzLiBGb3IgcGFnZXMgd2l0aCBhIGxvdyBkZWdyZWUgb2Ygc2hhcmluZywgYSBP
KG4pCj4gPiAgICogc2VhcmNoIGxpbmtlZCBsaXN0IGlzIGdvb2QgZW5vdWdoLiBGb3IgcGFnZXMg
d2l0aCBoaWdoZXIgZGVncmVlIG9mIHNoYXJpbmcsCj4gPiAtICogd2UgdXNlIGEgaGFzaCB0YWJs
ZSBpbnN0ZWFkLiAqLwo+ID4gKyAqIHdlIHVzZSBhIGhhc2ggdGFibGUgaW5zdGVhZC4KPiA+ICsg
Ki8KPiA+Cj4gPiAgdHlwZWRlZiBzdHJ1Y3QgZ2ZuX2luZm8KPiA+ICB7Cj4gPiAgICAgIHVuc2ln
bmVkIGxvbmcgZ2ZuOwo+ID4gLSAgICBkb21pZF90IGRvbWFpbjsKPiA+ICsgICAgZG9taWRfdCBk
b21haW47Cj4gPiAgICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPiA+ICB9IGdmbl9pbmZvX3Q7
Cj4gPgo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZAo+ID4gLXJtYXBfaW5pdChzdHJ1Y3QgcGFnZV9p
bmZvICpwYWdlKQo+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBybWFwX2luaXQoc3RydWN0IHBhZ2Vf
aW5mbyAqcGFnZSkKPgo+IFNlZWluZyBhcyB5b3UncmUgZm9sZGluZyB0aGlzLCB0aGUgaW5saW5l
IGNhbiBiZSBkcm9wcGVkLiAgSW4gLmMgZmlsZXMsCj4gZnVuY3Rpb25zIHNob3VsZCBqdXN0IGJl
IHN0YXRpYy4KPgo+ID4gQEAgLTQzNywyNSArNDQxLDI5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBt
ZW1fc2hhcmluZ19nZm5fZGVzdHJveShzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlLAo+ID4gICAgICB4
ZnJlZShnZm5faW5mbyk7Cj4gPiAgfQo+ID4KPiA+IC1zdGF0aWMgc3RydWN0IHBhZ2VfaW5mbyog
bWVtX3NoYXJpbmdfbG9va3VwKHVuc2lnbmVkIGxvbmcgbWZuKQo+ID4gK3N0YXRpYyBpbmxpbmUg
c3RydWN0IHBhZ2VfaW5mbyogbWVtX3NoYXJpbmdfbG9va3VwKHVuc2lnbmVkIGxvbmcgbWZuKQo+
Cj4gU2VlaW5nIGFzIHRoaXMgaXMgY2xlYW51cCwgdGhlIHBvc2l0aW9uIG9mIHRoZSAqIGNhbiBt
b3ZlLiAgU2ltaWxhcmx5LAo+IGl0IHNob3VsZG4ndCBnYWluIGFuIGlubGluZS4KPgo+IEkgY2Fu
IGZpeCBhbGwgb2YgdGhpcyB1cCBvbiBjb21taXQgKGFuZCBhIGZldyBvdGhlciBicmFjZSBwb3Np
dGlvbgo+IGlzc3VlcykgaWYgeW91IHdhbnQsIHRvIHNhdmUgcmV3b3JraW5nIGEgdHJpdmlhbCB2
Mi4KPgoKUHJvdmlkZWQgbm90aGluZyBlbHNlIGlzIG91dHN0YW5kaW5nIHdpdGggdGhlIHBhdGNo
IGFuZCBpdCBjYW4gYmUKY29tbWl0dGVkIEkgd291bGQgY2VydGFpbmx5IGFwcHJlY2lhdGUgdGhh
dC4KClRoYW5rcywKVGFtYXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
