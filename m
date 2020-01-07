Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C70F132AFF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 17:19:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iorYF-0004od-7G; Tue, 07 Jan 2020 16:17:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Heq1=24=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iorYD-0004oU-0H
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 16:17:49 +0000
X-Inumbo-ID: 3e173f77-3169-11ea-ac4f-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e173f77-3169-11ea-ac4f-12813bfff9fa;
 Tue, 07 Jan 2020 16:17:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b19so98327wmj.4
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2020 08:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GqTYtjmCQ73MzkfIw86UINK0p5btvJYshJUDTM8s9Iw=;
 b=LY7tf3WATfn/YGjHq+qArMgnbhpgxF0JU1tc8zabI05hLpADukfwkv0HlYkcBrw+qn
 jkjZwVhGDvpYKWf+0K3CBwk3HBdLmj4oz46nX0zOUHukbrDm5DG/8eCe2T5qB4k+L9C2
 9DRk+c36Sv5Le+j6QF6VloTLQJklEuPL1IGiCKRPmjprYsJy1heRuZMpa6kS5rz2g9Mx
 A94DgOJR2v/WkB4Dg++r1oCTlfdEoTAO1tlccVWQmi4hdU3cpKBarTfRBeJ4G0KISLja
 ivjep0LpcVTrj8ximUknTgCCDH+KulWCIPFN3jiHVWPahpVRz6ANgDgFxJDzi/xNQAlP
 hAPQ==
X-Gm-Message-State: APjAAAVk1+nmmBSwnJgReXyTUNJAiXcA6LQD0Ht1HS1esqwaHzGBPRbB
 92mEZkfxn1bjisHa/qPUYXQ=
X-Google-Smtp-Source: APXvYqwooqDeVKjqPQzYssfyOONP1idK7Mfo9SdGqXDXTy82PGwQecSdjvv0PnFzBhVeEB2N5Nvynw==
X-Received: by 2002:a1c:22c6:: with SMTP id i189mr43621572wmi.15.1578413867373; 
 Tue, 07 Jan 2020 08:17:47 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id q3sm88569wmj.38.2020.01.07.08.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 08:17:46 -0800 (PST)
Date: Tue, 7 Jan 2020 16:17:33 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200107161733.i3hedh2wcoijcglo@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
 <20200105212231.ty7cjfdu5di5sf4j@debian>
 <ec16fcba-099d-1a73-d33c-3ee9f0f7c005@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec16fcba-099d-1a73-d33c-3ee9f0f7c005@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
 hypercall functions
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
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMTA6MDY6MDhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwNS8wMS8yMDIwIDIxOjIyLCBXZWkgTGl1IHdyb3RlOgo+ID4gT24gU3VuLCBK
YW4gMDUsIDIwMjAgYXQgMDc6MDg6MjhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPiA+
Pj4gK3N0YXRpYyBpbmxpbmUgdWludDY0X3QgaHZfZG9faHlwZXJjYWxsKHVpbnQ2NF90IGNvbnRy
b2wsIHBhZGRyX3QgaW5wdXQsIHBhZGRyX3Qgb3V0cHV0KQo+ID4+PiArewo+ID4+PiArICAgIHVp
bnQ2NF90IHN0YXR1czsKPiA+Pj4gKwo+ID4+PiArICAgIGFzbSB2b2xhdGlsZSAoIm1vdiAlW291
dHB1dF0sICUlcjhcbiIKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICJjYWxsIGh2X2h5cGVyY2Fs
bF9wYWdlIgo+ID4+PiArICAgICAgICAgICAgICAgICAgOiAiPWEiIChzdGF0dXMpLCAiK2MiIChj
b250cm9sKSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgIitkIiAoaW5wdXQpIEFTTV9DQUxM
X0NPTlNUUkFJTlQKPiA+Pj4gKyAgICAgICAgICAgICAgICAgIDogW291dHB1dF0gInJtIiAob3V0
cHV0KQo+ID4+PiArICAgICAgICAgICAgICAgICAgOiAiY2MiLCAibWVtb3J5IiwgInI4IiwgInI5
IiwgInIxMCIsICJyMTEiKTsKPiA+PiBJIHRoaW5rIHlvdSB3YW50Ogo+ID4+Cj4gPj4gcmVnaXN0
ZXIgdW5zaWduZWQgbG9uZyByOCBhc20oInI4IikgPSBvdXRwdXQ7Cj4gPj4KPiA+PiBhbmQgIity
IiAocjgpIGFzIGFuIG91dHB1dCBjb25zdHJhaW50Lgo+ID4gQWx0aG91Z2ggaXQgaXMgbmFtZWQg
YG91dHB1dGAsIGl0IGlzIHJlYWxseSBqdXN0IGFuIGlucHV0IHBhcmFtZXRlciBmcm9tCj4gPiBI
eXBlci1WJ3MgUG9WLgo+IAo+IFllcywgYnV0IGl0IGlzIGFsc28gY2xvYmJlcmVkLgo+IAo+IFRo
aXMgaXMgYW4gYXdrd2FyZCBjb3JuZXIgY2FzZSBvZiBnbnUgaW5saW5lIGFzc2VtYmx5Lgo+IAo+
IEl0IGlzIG5vdCBwZXJtaXR0ZWQgdG8gaGF2ZSBhIGNsb2JiZXIgbGlzdCBvdmVybGFwIHdpdGgg
YW55IGlucHV0L291dHB1dAo+IG9wZXJhdGlvbnMsIGFuZCBiZWNhdXNlIHI4IGRvZXNuJ3QgaGF2
ZSBhIHVuaXF1ZSBsZXR0ZXIsIHlvdSBjYW4ndCBkbwo+IHRoZSB1c3VhbCB0cmljayBvZiAiPXI4
IiAoZGlzY2FyZCkgOiAicjgiIChpbnB1dCkuCj4gCj4gVGhlIG9ubHkgYXZhaWxhYmxlIG9wdGlv
biBpcyB0byBtYXJrIGl0IGFzIHJlYWQgYW5kIHdyaXR0ZW4gKHdoaWNoIGlzCj4gIityIiBpbiB0
aGUgb3V0cHV0IGxpc3QpLCBhbmQgbm90IHVzZSB0aGUgQyB2YXJpYWJsZSByOCBhdCBhbnkgcG9p
bnQgbGF0ZXIuCgpCdXQgcjggaXMgb25seSBsaXN0ZWQgaW4gY2xvYmJlciBsaXN0LCBzbyBpdCBj
ZXJ0YWlubHkgZG9lc24ndCBvdmVybGFwCndpdGggYW55IGlucHV0IHJlZ2lzdGVyLiBJIGZhaWwg
dG8gc2VlIHdoYXQgdGhlIGJ1ZyAoaWYgdGhlcmUgaXMgYW55KSBpcwpoZXJlLgoKSSB0aGluayB3
aGF0IHlvdSdyZSBhc2tpbmcgZm9yIGhlcmUgaXMgYW4gb3B0aW1pc2F0aW9uLiBJcyB0aGF0IGNv
cnJlY3Q/CkkgZG9uJ3QgbWluZCBjaGFuZ2luZyB0aGUgY29kZS4gV2hhdCBJIG5lZWQgaXMgY2xh
cmlmaWNhdGlvbiBoZXJlLgoKPiAKPiAKPiBIYXZpbmcgbG9va2VkIHRocm91Z2ggdGhlIHNwZWMg
YSBiaXQgbW9yZSwgaXMgdGhpcyBhIHdpc2UgQVBJIHRvIGhhdmUgaW4KPiB0aGUgZmlyc3QgcGxh
Y2U/wqAgaW5wdXQgYW5kIG91dHB1dCAocGVyaGFwcyBiZXR0ZXIgbmFtZWQgaW5wdXRfYWRkciBh
bmQKPiBvdXRwdXRfYWRkcikgYXJlIGZpeGVkIHBlciBDUFUsIGFuZCBjb250cm9sIGlzIHNlbWFu
dGljYWxseSBsaW5rZWQgdG8KPiB0aGUgaHlwZXJjYWxsIGFuZCBpdHMgcGFydGljdWxhciBBQkku
Cj4gCj4gSSBzdXBwb3NlIHRoZSBhbnN3ZXIgdWx0aW1hdGVseSBkZXBlbmRzIG9uIHdoYXQgdGhl
IGNhbGxlcnMgbG9vayBsaWtlLgoKVGhlIGNhbGwgc2l0ZXMgd2lsbCBiZSBsaWtlCgoJc3RydWN0
IGh2X2lucHV0X2FyZyAqaW5wdXRfYXJnOwoJaW5wdXRfYXJnID0gcGVyX2NwdV9pbnB1dF9wYWdl
OwoJaW5wdXRfYXJnLmZvbyA9IHh4eDsKCWlucHV0X2FyZy5iYXIgPSB4eHg7CgoJaHZfZG9faHlw
ZXJjYWxsKGNvbnRyb2wsIHZpcnRfdG9fbWFkZHIoaW5wdXRfYXJnKSwgTlVMTCk7CgouCgooQWx0
ZXJuYXRpdmVseSwgd2UgY2FuIHB1dCB2aXJ0X3RvX21hZGRyIGluIGh2X2RvX2h5cGVyY2FsbCBu
b3cgdGhhdAp3ZSdyZSBzdXJlIHRoZSBpbnB1dCBwYWdlIGlzIGZyb20geGVuaGVhcCkKCj4gCj4g
Pgo+ID4+IEluIHBhcnRpY3VsYXIsIHRoYXQgZG9lc24ndCBmb3JjZSB0aGUgY29tcGlsZXIgdG8g
cHV0IG91dHB1dCBpbnRvIGEKPiA+PiByZWdpc3RlciBvdGhlciB0aGFuIHI4IChvciB3b3JzZSwg
c3BpbGwgaXQgdG8gdGhlIHN0YWNrKSB0byBoYXZlIHRoZQo+ID4+IG9wYXF1ZSBibG9iIG9mIGFz
bSBtb3ZlIGl0IGJhY2sgaW50byByOC7CoCBXaGF0IGl0IHdpbGwgZG8gaW4gcHJhY3RpY2UgaXMK
PiA+PiBjYXVzZSB0aGUgY29tcGlsZXIgdG8gY29uc3RydWN0IG91dHB1dCBkaXJlY3RseSBpbiBy
OC4KPiA+Pgo+ID4+IEFzIGZvciB0aGUgb3RoZXIgY2xvYmJlcnMsIEkgY2FuJ3QgZmluZCBhbnl0
aGluZyBhdCBhbGwgaW4gdGhlIHNwZWMKPiA+PiB3aGljaCBldmVuIG1lbnRpb25zIHRob3NlIHJl
Z2lzdGVycy7CoCBUaGVyZSB3aWxsIGJlIGEgZGVjZW50IGltcHJvdmVtZW50Cj4gPj4gdG8gY29k
ZSBnZW5lcmF0aW9uIGlmIHdlIGRvbid0IGZvcmNlIHRoZW0gdG8gYmUgc3BpbGxlZCBhcm91bmQg
YSBoeXBlcmNhbGwuCj4gPj4KPiA+IE5laXRoZXIgY2FuIEkuIEJ1dCBMaW51eCdzIGNvbW1pdCBz
YXlzIHRoYXQncyBuZWVkZWQsIHNvIEkgY2hvc2UgdG8gZXJyCj4gPiBvbiB0aGUgc2FmZSBzaWRl
Lgo+IAo+IFRoYXQncyBkdWxsLsKgIElzIHRoZXJlIGFueSBxdWFsaWZ5aW5nIGluZm9ybWF0aW9u
PwoKU2VlIExpbnV4IGNvbW1pdCBmYzUzNjYyZjEzYi4KCkkgd2lsbCBhbHNvIGFzayBteSBjb250
YWN0IGluIEh5cGVyLVYgdGVhbSBmb3IgY2xhcmlmaWNhdGlvbi4KCldlaS4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
