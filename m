Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FED7BEFD3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 12:40:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDR9p-0000kj-LO; Thu, 26 Sep 2019 10:37:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Aa/x=XV=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDR9n-0000kU-AZ
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 10:37:55 +0000
X-Inumbo-ID: b22876bc-e049-11e9-964e-12813bfff9fa
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by localhost (Halon) with ESMTPS
 id b22876bc-e049-11e9-964e-12813bfff9fa;
 Thu, 26 Sep 2019 10:37:54 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id i1so2141020wro.4
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2019 03:37:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=32zhbZaWU3bhcrAOnMYaFZ15eTs80MKFtkPR+xzuvBw=;
 b=Jv07mOwwMRnyEz+T/kSHGHWK/w+zRD1WobqNzs5soxWg/twi1cTETLsrJiO8oo/WTz
 AHonA/P0rFqdzzVHKCXnXK1uu1orET/Qsp4e+Lv0CX1Bzqz020jtIA6Y6s5RruStB9Uj
 JNxvTm+CGzBxuWTe44ClagiThvKrC+Tk7esF+GQiFGCK2Y6mGK4DiBwRxvhOaCPdJnOR
 mP6Ni5TT3oKfSLHNVBOQL/FiZ0qLu0xjWCUp+gJHH1E25NxHBuxNw//WG8JPYOvV2Xef
 xoM+NRClhAwKMpO6XHVKbHoNt7b55aUZAuftzaK0hg9b44Bq9u+T0Q/6tnnfILM3+Klb
 Sj0g==
X-Gm-Message-State: APjAAAXb9LLyLE/N2Y2hbrlVvD80LOD5gkWAOBy3GcBP1NoLU96gcY3Q
 vElpAT9UjhTqXBEq1+o5Sz0=
X-Google-Smtp-Source: APXvYqxEUGgCg4IP5ttNV6HT0aFJjskmyNeoc4xmzurei13Tk9a7IblJS0X+ocbJXE2KhgFW2OUE6Q==
X-Received: by 2002:a5d:684a:: with SMTP id o10mr2318631wrw.23.1569494273365; 
 Thu, 26 Sep 2019 03:37:53 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id 3sm2520974wmo.22.2019.09.26.03.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2019 03:37:52 -0700 (PDT)
Date: Thu, 26 Sep 2019 11:37:51 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190926103751.jjn2m5flbpceqm7p@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190925110250.vshhg52xlrmafpka@Air-de-Roger>
 <20190925153634.wjlxjnz6egibqypg@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925153634.wjlxjnz6egibqypg@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 0/8] Port Xen to Hyper-V
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMDQ6MzY6MzRQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBXZWQsIFNlcCAyNSwgMjAxOSBhdCAwMTowMjo1MFBNICswMjAwLCBSb2dlciBQYXUgTW9u
bsOpIHdyb3RlOgo+ID4gT24gTW9uLCBTZXAgMjMsIDIwMTkgYXQgMTE6MDk6MjNBTSArMDEwMCwg
V2VpIExpdSB3cm90ZToKPiA+ID4gSGkgYWxsCj4gPiA+IAo+ID4gPiBJbiBjYXNlIHlvdSdyZSB3
b25kZXJpbmcsIEkgY2FuIGFscmVhZHkgcnVuIGEgZnVsbHkgZmxlZGdlZCBYZW4gc3lzdGVtIG9u
Cj4gPiA+IEh5cGVyLVYgd2l0aCBlbXVsYXRlZCBkaXNrIGFuZCBuZXR3b3JrLgo+ID4gPiAKPiA+
ID4gVGhpcyBpcyB0aGUgdmVyeSBmaXJzdCBzdGFnZSBmb3IgcG9ydGluZyBYZW4gdG8gcnVuIG9u
IEh5cGVyLVYgd2l0aCBhbGwgdGhlCj4gPiA+IGdvb2RpZXMgSHlwZXItViBoYXMgdG8gb2ZmZXIu
ICBXaXRoIHRoaXMgc2VyaWVzLCBYZW4gY2FuIHN1Y2Nlc3NmdWxseSBkZXRlY3QKPiA+ID4gSHlw
ZXItViBhbmQgcHJpbnRzIG91dCBhIG1lc3NhZ2UuICBJIHdvdWxkIGxpa2UgdG8gZmlyc3QgZ2V0
IHRoZSBkaXJlY3RvcnkKPiA+ID4gc3RydWN0dXJlIGFuZCBrY29uZmlnIG9wdGlvbnMgYWdyZWVk
IHVwb24uCj4gPiA+IAo+ID4gPiBUaGVyZSBhcmUgdHdvIG1ham9yIGFyZWFzIHRvIGJlIHdvcmtl
ZCBvbjoKPiA+ID4gICAqIE1ha2UgRG9tMCBhYmxlIHRvIHVzZSBIeXBlci1WJ3Mgc3ludGhldGlj
IGRldmljZXMuCj4gPiA+ICAgKiBNYWtlIFhlbiB1c2Ugb2YgdGhlIHN5bnRoZXRpYyB0aW1lciwg
cmVmZXJlbmNlIFRTQyBhbmQgZW5saWdodGVubWVudCBWTUNTCj4gPiA+ICAgICBhbmQgb3RoZXIg
aW50ZXJmYWNlcy4KPiA+ID4gCj4gPiA+IFRoZXkgYXJlbid0IHRyaXZpYWwsIGFuZCB0aW1lIGNh
biBiZSBzY2FyY2Ugb24gbXkgc2lkZSwgc28gSSBpbnRlbmQgdG8gcG9zdAo+ID4gPiBwYXRjaGVz
IHBpZWNlIG1lYWwgd2hlbiB0aGV5IGFyZSByZWFkeS4KPiA+ID4gCj4gPiA+IFF1ZXN0aW9ucyBh
bmQgY29tbWVudHMgYXJlIHdlbGNvbWUuCj4gPiAKPiA+IFRoYW5rcyBmb3IgZG9pbmcgdGhpcyEK
PiA+IAo+ID4gSW4gdGhlIHBhc3QgSSd2ZSBwbGF5ZWQgd2l0aCB0cnlpbmcgdG8gZ2V0IFhlbiB0
byBib290IGFzIGEgZ3Vlc3Qgb24KPiA+IEh5cGVyViBnZW4yIGluc3RhbmNlcywgYW5kIEkgZGlk
IG1hbmFnZSB0byBnZXQgaXQgYm9vdGluZywgTGludXgKPiA+IGhvd2V2ZXIgd291bGQgZ2V0IGV4
dHJlbWVseSBjb25mdXNlZCBiZWNhdXNlIGdlbjIgbGFja3MgZW11bGF0ZWQKPiA+IGRldmljZXMg
YW5kIGluc3RlYWQgdGhlIGd1ZXN0IGlzIGZvcmNlZCB0byB1c2UgdGhlIEh5cGVyViBQViBkZXZp
Y2VzCj4gPiBBRkFJSy4KPiAKPiBIb3cgZGlkIHlvdSBmb3JjZSBMaW51eCB0byB1c2UgSHlwZXIt
ViBQViBkZXZpY2VzPyAgQUlVSSBMaW51eCB3b24ndAo+IGhhdmUgYWNjZXNzIHRvIFZNQnVzIChs
aWtlIFhlbkJ1cyBidXQgd2l0aCBzb21lIGRpZmZlcmVuY2VzKSBhbmQgU3luSUMKPiAoU3ludGhl
dGljIGludGVycnVwdCBjb250cm9sbGVyLCB0aGluayBvZiBpdCBhcyBhbiBhYnN0cmFjdGlvbiBh
cm91bmQKPiBldmVudCBjaGFubmVsIGluIFhlbiB3b3JsZCkgaW4gdGhlIGZpcnN0IHBsYWNlLiAg
QnV0IEkgaGF2ZW4ndCB0cmllZAo+IGdlbjIgc28gSSBjb3VsZCBiZSB3cm9uZy4KPiAKCkkgdHJ5
IEdlbjIgdGhpcyBtb3JuaW5nLiBJIG5lZWQgdG8gYXBwbHkgeW91ciBwYXRjaCBhbmQgZ2l2ZSBY
ZW4gbm9hcGljCm9wdGlvbiB0byBib290LiBBdCB0aGUgZW5kIEkgb25seSBnZXQgYSBibGFuayBz
Y3JlZW4gc28gSSBkb24ndCB0aGluawpMaW51eCBoYXMgYm9vdGVkIHN1Y2Nlc3NmdWxseS4KCldl
aS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
