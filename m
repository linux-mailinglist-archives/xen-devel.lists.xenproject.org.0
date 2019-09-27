Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34FC059C
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 14:48:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDpdV-0000VM-U9; Fri, 27 Sep 2019 12:46:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDpdU-0000VE-KC
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 12:46:12 +0000
X-Inumbo-ID: c8d14701-e124-11e9-9677-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by localhost (Halon) with ESMTPS
 id c8d14701-e124-11e9-9677-12813bfff9fa;
 Fri, 27 Sep 2019 12:46:12 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id v8so2605697wrt.2
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 05:46:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=hWNlV6eqZ3ljrqVAhKYXZRXqZY9CO47FUoRwNABYwJE=;
 b=JrmHbMakwSEjler7iFqsBypJ2tpsL1tFxpooQxO7FrFhtD6/5ZLvEgxOLwpOgV5FpH
 NBvCZAc31MNTIZv2t1Nwzmce8cxnfOU+xK3uVjVlRjLD0QMN+WFVkUWZsPbu2sAn8q2h
 A1jxXEqeWQQFp2dw97X+Jh5tTC78YuikOFa37v1IsC3gD1/rAxZiQYIXqLehRL32I1P6
 9jgyF5TYR9Jz3VlrVLkPhwC1b3wL7smkW8Ds2UtIfmj0DpWtp5EeluwmEWXRa1FicKXI
 uof/0yv7SCmlL2paMsy0Cehmto8GwT7vt1ahbF8qS8P4ZidOzl6/yBCMk0V6NlbVcVkt
 Wwpg==
X-Gm-Message-State: APjAAAXCExNV9uClZBvMkPBjIqO5Y4Q0FUujPdYoUWkHG1GXupCBUaQw
 4C4Q1zjL9A8Y8dCvJU7Twos=
X-Google-Smtp-Source: APXvYqw9jl5CPt0s0JPxcwspwgFRtgxdFf8+3pwQuN6IsUOG/PjPU+4B9NvS3pdq/SoyWAnwti+H5Q==
X-Received: by 2002:adf:e5c2:: with SMTP id a2mr3081755wrn.320.1569588371205; 
 Fri, 27 Sep 2019 05:46:11 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z125sm10768663wme.37.2019.09.27.05.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 05:46:10 -0700 (PDT)
Date: Fri, 27 Sep 2019 13:46:08 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190927124608.wjupoy2a2sxeksci@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-5-liuwe@microsoft.com>
 <20190925102354.2tr5ojk6yvfsqtxy@Air-de-Roger>
 <20190927113058.53xs3sw57as3r3tr@debian>
 <20190927114159.3ngxlqdgsn6bnarf@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190927114159.3ngxlqdgsn6bnarf@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 4/8] x86: factor out xen
 variants for hypervisor setup code
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

T24gRnJpLCBTZXAgMjcsIDIwMTkgYXQgMDE6NDE6NTlQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiA+ID4gCj4gPiA+IEkgd29uZGVyLCBkbyB5b3UgYWxzbyByZXF1aXJlIHRvIG1h
cCBoeXBlcnZpc29yIGRhdGEgaW50byB0aGUgZ3Vlc3QKPiA+ID4gcGh5c21hcCB3aGVuIHJ1bm5p
bmcgb24gSHlwZXJWPwo+ID4gPiAKPiA+IAo+ID4gWWVzLiBUaGVyZSBhcmUgYSBsb3Qgb2YgY29t
cGFyYWJsZSBjb25jZXB0cyBpbiBIeXBlci1WLiBGb3IgZXhhbXBsZSwKPiA+IHRoZXJlIGlzIGEg
cGFnZSBjYWxsZWQgVlAgYXNzaXN0IHBhZ2Ugd2hpY2ggaXMgbW9yZSBvciBsZXNzIHRoZSBzYW1l
IGFzCj4gPiBYZW4ncyB2Y3B1aW5mby4gSXRzIGZvcm1hdCwgY29udGVudCBhbmQgaW50ZXJmYWNl
cyBtYXkgYmUgZGlmZmVyZW50LCBidXQKPiA+IGNvbmNlcHR1YWxseSBpdCBpcyB0aGUgc2FtZSBh
cyB2Y3B1aW5mby4KPiA+IAo+ID4gPiBJcyB0aGVyZSBhIHdheSB3aGVuIHJ1bm5pbmcgb24gSHlw
ZXJWIHRvIHJlcXVlc3QgdW51c2VkIHBoeXNpY2FsCj4gPiA+IGFkZHJlc3Mgc3BhY2UgcmFuZ2Vz
PyBXaGF0IFhlbiBjdXJyZW50bHkgZG9lcyBpbiBpbml0X21lbW1hcCBpcyBxdWl0ZQo+ID4gPiBj
cmFwcHkuCj4gPiA+IAo+ID4gCj4gPiBYZW4gaXRzZWxmIHN0aWxsIG5lZWRzIHRvIG1hbmFnZSB0
aGUgYWRkcmVzcyBzcGFjZSwgbm8/Cj4gPgo+ID4gSSBhZ3JlZSB0aGUgcmFuZ2VzZXQgY29kZSBp
biB4ZW4uYyBpc24ndCBwcmV0dHksIGJ1dCBpdCBkb2VzIHRoZSBqb2IgYW5kCj4gPiBpcyBub3Qg
dG9vIGludHJ1c2l2ZS4KPiAKPiBUaGUgcHJvYmxlbSB3aXRoIHRoZSBjdXJyZW50IGFwcHJvYWNo
IGlzIHRoYXQgdGhlIG5lc3RlZCBYZW4gaGFzIG5vCj4gd2F5IG9mIGtub3dpbmcgd2hldGhlciB0
aG9zZSBob2xlcyBhcmUgYWN0dWFsbHkgdW51c2VkLCBvciBhcmUgTU1JTwo+IHJlZ2lvbnMgdXNl
ZCBieSBkZXZpY2VzIGZvciBleGFtcGxlLgo+IAo+IEhlbmNlIEkgd29uZGVyZWQgaWYgSHlwZXJW
IGhhZCBhIHdheSB0byBzaWduYWwgdG8gZ3Vlc3RzIHRoYXQgYQo+IHBoeXNpY2FsIGFkZHJlc3Mg
cmFuZ2UgaXMgc2FmZSB0byBiZSB1c2VkIGFzIHNjcmF0Y2ggbWFwcGluZyBzcGFjZS4gV2UKPiBo
YWQgc3Bva2VuIGF2b2lkIGludHJvZHVjaW5nIHNvbWV0aGluZyBpbiBYZW4gdG8gYmUgYWJsZSB0
byByZXBvcnQgdG8KPiBndWVzdHMgc2FmZSByYW5nZXMgaW4gdGhlIHBoeXNtYXAgdG8gbWFwIHN0
dWZmLgoKQUZBSUNUIEh5cGVyLVYgVExGUyBkb2Vzbid0IGRlc2NyaWJlIHN1Y2ggZnVuY3Rpb25h
bGl0eS4KCk9uIHRoZSBvdGhlciBoYW5kLCBIeXBlci1WIG1heSBub3QgbmVlZCB0aGlzIGluZnJh
c3RydWN0dXJlIGF0IGFsbApiZWNhdXNlIGl0IGRvZXNuJ3QgaGF2ZSBncmFudCB0YWJsZSBmcmFt
ZSBvciBzaGFyZWQgaW5mbyBwYWdlLiBUaGUgbW9zdApsaWtlbHkgb3V0Y29tZSBpcyBpbiB0aGUg
bmV4dCB2ZXJzaW9uIHRoZSBtZW1tYXAgc3R1ZmYgd2lsbCBiZSBsZWZ0IHRvClhlbiBvbmx5IHVu
dGlsIEkgZmluZCBhIHVzZSBjYXNlIGZvciBpdC4KCldlaS4KCj4gCj4gVGhhbmtzLCBSb2dlci4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
