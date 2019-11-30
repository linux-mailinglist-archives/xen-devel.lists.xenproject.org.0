Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94110DD7F
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2019 12:55:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ib1Fq-0003jb-FK; Sat, 30 Nov 2019 11:49:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rqrT=ZW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ib1Fo-0003jJ-3J
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2019 11:49:36 +0000
X-Inumbo-ID: 7aa7dbe6-1367-11ea-a3f1-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7aa7dbe6-1367-11ea-a3f1-12813bfff9fa;
 Sat, 30 Nov 2019 11:49:35 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p17so11813277wma.1
 for <xen-devel@lists.xenproject.org>; Sat, 30 Nov 2019 03:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Tu50dnpHoeAkmrxAJmrT9mBNuo12cNZxdYJiE3X0Kbc=;
 b=gdj7GLqtJXEHVeW1ztSJ/0qNnLQtQqGQdh+h1Eyu7EtBa6IN+MJmJUJOCXb2E9HVDq
 y7+nYPDEb/jDPjRNAL+9UznisispOQa7V/8yhMtkWQwroqCfJ2MTuMUHc32QUttkKYvh
 QqLDIimss5XyFxSmmfyNhAKbYmboGkTkBB/JyLNyVZTdiUQYqVw5XSjj7ay6ea3Y5W78
 jhFpucOraRj+exi/m54X4pR4Vaci8v+3Vb0lUmOgHUe6zlIa8+dw0fGZmmTcKL7czf9i
 XmZzXJATjPuS8zB7tui3Oj426fJG+ta7qwNHoGi6idxs6w6X0PaPrD9SS/8OYihlhalX
 ymCw==
X-Gm-Message-State: APjAAAWSflc7aBGCyAHd0jp3SW5skAiZJDGGYbsaAFPzfFsnFZgCYjW/
 4vuvNlZrF7TmvtAjvdef4w4=
X-Google-Smtp-Source: APXvYqzQfSWpu9oe+uQutc1CyJITHrVxh2iCV6kPWxlJJEnIkd8baHNr3LJQZ1a5MIube/F9WF4s9g==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr16614461wmc.132.1575114574551; 
 Sat, 30 Nov 2019 03:49:34 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z6sm18728639wrw.36.2019.11.30.03.49.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Nov 2019 03:49:34 -0800 (PST)
Date: Sat, 30 Nov 2019 11:49:32 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191130114932.kmhhdyyfaerurgux@debian>
References: <20191121185049.16666-1-liuwe@microsoft.com>
 <20191121185049.16666-8-liuwe@microsoft.com>
 <71c29f9f-3827-5f14-3971-a0854c0d8a34@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71c29f9f-3827-5f14-3971-a0854c0d8a34@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 7/8] x86: be more verbose when running on
 a hypervisor
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
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDY6MTU6NTJQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMS8xMS8yMDE5IDE4OjUwLCBXZWkgTGl1IHdyb3RlOgo+ID4gQWxzbyByZXBs
YWNlIHhlbl9ndWVzdCB3aXRoIHJ1bm5pbmdfb25faHlwZXJ2aXNvciBib29sZWFuLgo+IAo+IEkg
YWdyZWUgd2l0aCBkcm9wcGluZyB4ZW5fZ3Vlc3QsIGJ1dC4uLgo+IAo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZXMg
aW4gdjQ6Cj4gPiAxLiBBY2Nlc3MgLT5uYW1lIGRpcmVjdGx5Lgo+ID4gMi4gRHJvcCBSb2dlcidz
IHJldmlldyB0YWcuCj4gPiAtLS0KPiA+ICB4ZW4vYXJjaC94ODYvc2V0dXAuYyB8IDcgKysrKyst
LQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9zZXR1cC5jIGIveGVuL2FyY2gveDg2L3Nl
dHVwLmMKPiA+IGluZGV4IDE5NjA2ZDkwOWIuLjEyMzQzNmIzNWEgMTAwNjQ0Cj4gPiAtLS0gYS94
ZW4vYXJjaC94ODYvc2V0dXAuYwo+ID4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiA+IEBA
IC02ODksNiArNjg5LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5zaWdu
ZWQgbG9uZyBtYmlfcCkKPiA+ICAgICAgaW50IGksIGosIGU4MjBfd2FybiA9IDAsIGJ5dGVzID0g
MDsKPiA+ICAgICAgYm9vbCBhY3BpX2Jvb3RfdGFibGVfaW5pdF9kb25lID0gZmFsc2UsIHJlbG9j
YXRlZCA9IGZhbHNlOwo+ID4gICAgICBpbnQgcmV0Owo+ID4gKyAgICBib29sIHJ1bm5pbmdfb25f
aHlwZXJ2aXNvcjsKPiAKPiAuLi4gdGhpcyBpcyBzZW1hbnRpY2FsbHkgYW1iaWd1b3VzIHdpdGgg
Y3B1X2hhc19oeXBlcnZpc29yLgo+IAo+IFdoZXJlIHRoZXkgZGlmZmVyIGlzIHdoZXRoZXIgWGVu
IGhhcyBtYW5hZ2VkIHRvIHJlY29nbmlzZSB0aGUgaHlwZXJ2aXNvcgo+IGl0IGlzIHJ1bm5pbmcg
dW5kZXIsIG9yIG5vdC4KPiAKPiBHaXZlbiB0aGF0IHRoZSBoeXBlcnZpc29yXyooKSBob29rcyBh
cmUgbm9wcyBieSBkZWZhdWx0LCBJJ2Qgc3VnZ2VzdAo+IGp1c3QgbWFraW5nIGJsaW5kIGNhbGxz
LgoKV2VsbCBKYW4gYXNrZWQgdG8gZHJvcCB0aGUgaHlwZXJ2aXNvcl9uYW1lIGhvb2suIEkgY2Fu
J3QgbWFrZSBibGluZApjYWxscyBoZXJlLiBIZSdzIHVuaGFwcHkgd2l0aCBjYWxsaW5nIGh5cGVy
dmlzb3JfcHJvYmUgdHdpY2UgZWl0aGVyLgoKSSBjYW4sIGhvd2V2ZXIsIGRvIHRoZSBmb2xsb3dp
bmc6CgogMS4gQ2hhbmdlIGh5cGVydmlzb3JfcHJvYmUgdG8gcmV0dXJuIE5VTEwgb3IgYSBzdHJp
bmcKIDIuIENhY2hlIGFuZCB1c2UgdGhhdCByZXR1cm4gdmFsdWUgaW5zaWRlIHRoaXMgZnVuY3Rp
b24KClRoaXMgc2hvdWxkIG1ha2UgYm90aCBvZiB5b3UgaGFwcHkuCgpXZWkuCgo+IAo+IH5BbmRy
ZXcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
