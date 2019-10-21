Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF39DEFEA
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 16:38:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMYmU-00008V-Bk; Mon, 21 Oct 2019 14:35:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMYmT-00008G-9i
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 14:35:33 +0000
X-Inumbo-ID: 0931632c-f410-11e9-bbab-bc764e2007e4
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0931632c-f410-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 14:35:32 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id c6so2067271wrm.6
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 07:35:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=lGMmAGQad1StKNo6fBgzB/F4yz5lPbBQEk2f+7IrXOg=;
 b=VwzLgEGUNaMvjdsfVtI658a3zkJTkFR0g34lc8SauFYI4tTteo04afNZsmnZ4O0V4b
 KDt6DGB7fSmfPEL3GhNG72TbPeYqcuw8xH0Xf7cP6u4NIEH9HAeQfDu3+HNNU8yCz/2L
 lLYHgzezbIceSZ4Tx2XoG2y28ZZSwRB5iEFipaHxVRZmK1W8ZFe8tnAibjvqsgB38v72
 oTOgEHfFGEPKamCtpJd2SYhoPnl/3HAxpht41qmfeBEsrTaF3sFw7LdsivS8jEgDtcKY
 Daf1bxBDDcOP2L6rGX2CsEwK/dRzJiSyKbPAneJIocQE5uFyN8N7gQfEbFVnoxc0cNIi
 QlVg==
X-Gm-Message-State: APjAAAX7C5RCOXHGzGfbjTMJLCm5oDflL1JLmu0yXbUC0v0xM+kJ5OV1
 CW0IvwbliHi8O6MQyPW7+JU=
X-Google-Smtp-Source: APXvYqzUnZYMe61VOz4seM84sNEjJwR7bn3S09nZivqGm2v7dKNYVJ2HBObN0prqiNFnyM4Ka7nvNg==
X-Received: by 2002:adf:f48c:: with SMTP id l12mr19127967wro.99.1571668531965; 
 Mon, 21 Oct 2019 07:35:31 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id t13sm21293439wra.70.2019.10.21.07.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:35:31 -0700 (PDT)
Date: Mon, 21 Oct 2019 15:35:29 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191021143529.sulb2jf27nexdnok@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-9-liuwe@microsoft.com>
 <20191021100038.GG17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021100038.GG17494@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 8/9] x86: be more verbose when
 running on a hypervisor
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MDA6MzhQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNDowMDo0MlBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNv
bT4KPiA+IC0tLQo+ID4gIHhlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgICAgICAgIHwg
NSArKysrKwo+ID4gIHhlbi9hcmNoL3g4Ni9zZXR1cC5jICAgICAgICAgICAgICAgICAgIHwgNiAr
KysrKy0KPiA+ICB4ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaCB8IDIgKysK
PiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMgYi94ZW4v
YXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jCj4gPiBpbmRleCAzMDQ1M2I2YTdhLi44MTYxYjI2
YzVhIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+ID4g
KysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydmlzb3IuYwo+ID4gQEAgLTQzLDYgKzQzLDEx
IEBAIGJvb2wgaHlwZXJ2aXNvcl9wcm9iZSh2b2lkKQo+ID4gICAgICByZXR1cm4gISFob3BzOwo+
ID4gIH0KPiA+ICAKPiA+ICtjb25zdCBjaGFyICpoeXBlcnZpc29yX25hbWUodm9pZCkKPiA+ICt7
Cj4gCj4gSSB3b3VsZCBtYXliZSBhZGQgQVNTRVJUKGhvcHMpOwo+IAo+ID4gKyAgICByZXR1cm4g
aG9wcy0+bmFtZTsKPiA+ICt9Cj4gPiArClsuLi5dCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnZpc29yLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0
L2h5cGVydmlzb3IuaAo+ID4gaW5kZXggMzgzNDRlMmU4OS4uYTdkNzViZjljZiAxMDA2NDQKPiA+
IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2aXNvci5oCj4gPiArKysgYi94
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0L2h5cGVydmlzb3IuaAo+ID4gQEAgLTM2LDYgKzM2LDcg
QEAgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpOwo+ID4gIHZvaWQgaHlwZXJ2aXNvcl9zZXR1
cCh2b2lkKTsKPiA+ICB2b2lkIGh5cGVydmlzb3JfYXBfc2V0dXAodm9pZCk7Cj4gPiAgdm9pZCBo
eXBlcnZpc29yX3Jlc3VtZSh2b2lkKTsKPiA+ICtjb25zdCBjaGFyICpoeXBlcnZpc29yX25hbWUo
dm9pZCk7Cj4gPiAgCj4gPiAgI2Vsc2UKPiA+ICAKPiA+IEBAIC00NSw2ICs0Niw3IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpIHsgcmV0dXJuIGZhbHNlOyB9Cj4g
PiAgc3RhdGljIGlubGluZSB2b2lkIGh5cGVydmlzb3Jfc2V0dXAodm9pZCkge30KPiA+ICBzdGF0
aWMgaW5saW5lIHZvaWQgaHlwZXJ2aXNvcl9hcF9zZXR1cCh2b2lkKSB7fQo+ID4gIHN0YXRpYyBp
bmxpbmUgdm9pZCBoeXBlcnZpc29yX3Jlc3VtZSh2b2lkKSB7fQo+ID4gK3N0YXRpYyBpbmxpbmUg
Y2hhciAqaHlwZXJ2aXNvcl9uYW1lKHZvaWQpIHsgcmV0dXJuIE5VTEw7IH0KPiAKPiBJIHRoaW5r
IHlvdSB3YW50IGFuIEFTU0VSVF9VTlJFQUNIQUJMRSBoZXJlLCBzaW5jZSBoeXBlcnZpc29yX25h
bWUKPiBzaG91bGRuJ3QgYmUgY2FsbGVkIHVubGVzcyBYZW4gaGFzIGRldGVjdGVkIHRoYXQncyBy
dW5uaW5nIGFzIGEgZ3Vlc3QsCj4gd2hpY2ggY2FuIG9ubHkgaGFwcGVuIGlmIENPTkZJR19HVUVT
VCBpcyBzZWxlY3RlZC4KCkFjayB0byBib3RoIGNvbW1lbnRzLgoKV2VpLgoKPiAKPiBUaGFua3Ms
IFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
