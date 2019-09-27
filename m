Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 447F4C0404
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:22:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoGU-00057i-Hq; Fri, 27 Sep 2019 11:18:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDoGS-00057c-Mp
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:18:20 +0000
X-Inumbo-ID: 8274eb9c-e118-11e9-9675-12813bfff9fa
Received: from mail-wm1-f68.google.com (unknown [209.85.128.68])
 by localhost (Halon) with ESMTPS
 id 8274eb9c-e118-11e9-9675-12813bfff9fa;
 Fri, 27 Sep 2019 11:18:20 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a6so6140900wma.5
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 04:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=L5lbt1zdKc8qUIGsu9dRGnKwbFxSRs9Xsn6M+3D6hng=;
 b=K0s+w7mfAZPdEVsSeDGMOHCV/ohJTtPlXX2o0eFuVNVJFEA1Oaxc7+qkyVIzIOybCQ
 z/PzMz2dmEhN4Pz09U4NksEvAMaWZXWEm91cvjJINNrNhWkKjPKh0bKTT2gF0LfUD/7v
 ctg763JcYTv4Om72S3Jw2BjtIbIeD3SYtcWZrqCYK6qPJMDvCt4P0CB1mZ6ceJSp5QjA
 FsujxdxMbdbeoumzGveWXuonewMhVUKtSJn3+hbke3raQWKba3PzOavbW2+w1EaSWA4a
 YVORDDQN5dbp14r0htut0zaHDblOg2vhX7MfQjcC+dOTNRl7iLR1Y4iaP6xVrfe+jTSi
 gbzQ==
X-Gm-Message-State: APjAAAUBt961kAD603EgmdB8nfJRCZ82Y6+CZdaNsR3hsgLtsGbq5/wY
 0FLDV5b++lbl6mrKAOIGiTw=
X-Google-Smtp-Source: APXvYqwXG/QUmlAR/qmtlJgwqVHyBA4I1BEOh2WYrBWs1H3/SCKP3SWeo7UnIIv6jYm/Ea/8tA6IZQ==
X-Received: by 2002:a1c:f30d:: with SMTP id q13mr6244573wmq.60.1569583099235; 
 Fri, 27 Sep 2019 04:18:19 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id z189sm15042437wmc.25.2019.09.27.04.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 04:18:18 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:18:17 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190927111817.im4tpiiopb6uuycm@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-7-liuwe@microsoft.com>
 <20190925104427.vdatdc77twikmdtp@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925104427.vdatdc77twikmdtp@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 6/8] x86: make probe_xen return
 boolean value
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

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTI6NDQ6MjdQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAxMTowOToyOUFNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gV2UgbmVlZCBpbmRpY2F0aW9uIHdoZXRoZXIgaXQgaGFzIHN1Y2NlZWRl
ZCBvciBub3QuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29m
dC5jb20+Cj4gCj4gVGhlIGNvZGUgTEdUTSwgSSBoYXZlIGp1c3QgYSBzdWdnZXN0aW9uIG9uIHRo
ZSBhcHByb2FjaC4KPiAKPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29y
LmMgfCA1ICsrKystCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L3hlbi94ZW4uYyAgICB8IDcgKysr
Ky0tLQo+ID4gIHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QveGVuLmggfCA0ICsrLS0KPiA+ICAz
IGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4gPiAKPiA+
IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jIGIveGVuL2FyY2gv
eDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+ID4gaW5kZXggYjBhNzI0YmYxMy4uZmI1NzJiMDQwMiAx
MDA2NDQKPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+ICsrKyBi
L3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+IEBAIC0zNCw3ICszNCwxMCBAQCB2
b2lkIF9faW5pdCBwcm9iZV9oeXBlcnZpc29yKHZvaWQpCj4gPiAgICAgIGlmICggIShjcHVpZF9l
Y3goMSkgJiBjcHVmZWF0X21hc2soWDg2X0ZFQVRVUkVfSFlQRVJWSVNPUikpICkKPiA+ICAgICAg
ICAgIHJldHVybjsKPiA+ICAKPiA+IC0gICAgcHJvYmVfeGVuKCk7Cj4gPiArICAgIGlmICggcHJv
YmVfeGVuKCkgKQo+ID4gKyAgICAgICAgcmV0dXJuOwo+ID4gKwo+ID4gKyAgICAvKiBIeXBlci1W
IHByb2JpbmcgdG8gZm9sbG93LiAqLwo+IAo+IEluc3RlYWQgb2YgaGF2aW5nIHRvIGFwcGVuZCBh
IG5ldyBwcm9iZV9mb28gaGVyZSBldmVyeSB0aW1lIHN1cHBvcnQgZm9yCj4gcnVubmluZyBvbiBh
IG5ldyBoeXBlcnZpc29yIGlzIGFkZGVkLCB5b3UgY291bGQgZG8gc29tZXRoaW5nIHNpbWlsYXIK
PiB0byB3aGF0J3MgZG9uZSBpbiBSRUdJU1RFUl9WUENJX0lOSVQsIHdoZXJlIGVhY2ggaHlwZXJ2
aXNvciB3b3VsZAo+IHJlZ2lzdGVyIGl0J3Mgb3duIHNldCBvZiBoZWxwZXJzIGFuZCBwcm9iZSBm
dW5jdGlvbiBpbiBhIHNwZWNpZmljCj4gc2VjdGlvbiwgYW5kIHRoZW4geW91IHdvdWxkIGp1c3Qg
aXRlcmF0ZSBvdmVyIGFsbCB0aGUgZ3Vlc3Qgc3VwcG9ydAo+IHRoYXQncyBjb21waWxlZCBpbiBY
ZW4uCj4gCj4gVGhhdCB3b3VsZCBhbHNvIHByZXZlbnQgeW91IGZyb20gaGF2aW5nIHRvIGV4cG9y
dCBhIGR1bW15IHByb2JlX3hlbgo+IGhlbHBlciBpZiBDT05GSUdfWEVOX0dVRVNUIGlzIG5vdCBk
ZWZpbmVkLgo+IAo+IEFueXdheSwgbWF5YmUgdGhhdCdzIG92ZXJraWxsLi4uCgpMZXQncyBzZWUg
d2hhdCBBbmRyZXcgYW5kIEphbiB0aGluay4KCkVpdGhlciB3b3JrcyBmb3IgbWUgLS0gaXQgaXMg
anVzdCBhIG1hdHRlciBvZiB3cml0aW5nIGNvZGUsIGJ1dApvYnZpb3VzbHkgdGhlIGxlc3Mgd29y
ayB0aGUgYmV0dGVyLiA6LSkKCldlaS4KCj4gCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
