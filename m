Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04D61102AB
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 17:40:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBBG-0002S1-A4; Tue, 03 Dec 2019 16:37:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icBBE-0002Rw-Kl
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 16:37:40 +0000
X-Inumbo-ID: 387bccd8-15eb-11ea-a55d-bc764e2007e4
Received: from mail-wr1-f67.google.com (unknown [209.85.221.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 387bccd8-15eb-11ea-a55d-bc764e2007e4;
 Tue, 03 Dec 2019 16:37:40 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n1so4434127wra.10
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 08:37:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=U3ZlPa9JtoiLxZvi/uExIUbA824RvlTL9wYQPSUm7L8=;
 b=JiOzTvKqawwzWzC65kVFbLEQB4DqVgulsJ9rCvTwER9zRu9xtLWmTRHCeqIrUqkqDr
 BLEbVqLZI2uGgKXqobPbYvUL4/F0DCg042+G8oan0mL2XFaUe8RSiDHt4zIip/6uH4dV
 XKn9Kp14cMjsL5A3s/YzNUxkKto03BDe+V+8kOaWMIuokhbzIatZc3BdHrJP+eGy/kJe
 WhlQnX6uq8QQcGZejSYfR6k74NK2XV4Wk/qf5LN6Fh5W7IWO4nUKMw01ljP7fsREhczB
 zlVzP0v/0MfySMlRXnw7NcfdSvM70AJlYQVbE3VX6VTJZnX1rpRW36GTb0AXDPSfYLCk
 TLWQ==
X-Gm-Message-State: APjAAAWy33dauQzASIKsn6XPHipWbPzlcgQsMUhvl1ecGtVhXFymN6Aw
 Dw6f2oz537Dvvg6a/5sgsLM=
X-Google-Smtp-Source: APXvYqzwL8s/HQrYnF9dkkSYobLtoqaCJiMypTQteW6XTxeSGisqFZ5td6Yobr63nr21PAu6ePkODg==
X-Received: by 2002:a5d:6886:: with SMTP id h6mr6147048wru.154.1575391059408; 
 Tue, 03 Dec 2019 08:37:39 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id z6sm4571964wrw.36.2019.12.03.08.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:37:38 -0800 (PST)
Date: Tue, 3 Dec 2019 16:37:36 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203163736.ssykoba43expjx3k@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-8-liuwe@microsoft.com>
 <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 7/8] x86: be more verbose when running on
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDM6NTQ6MzVQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiA+IEFsc28gcmVwbGFj
ZSByZWZlcmVuY2UgdG8geGVuX2d1ZXN0Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1
IDxsaXV3ZUBtaWNyb3NvZnQuY29tPgo+IAo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgpUaGFua3MuCgo+IAo+IEhvd2V2ZXIsIC4uLgo+IAo+ID4gLS0tIGEveGVu
L2FyY2gveDg2L3NldHVwLmMKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zZXR1cC5jCj4gPiBAQCAt
NzAwLDYgKzcwMCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVuc2lnbmVk
IGxvbmcgbWJpX3ApCj4gPiAgICAgICAgICAubWF4X2dyYW50X2ZyYW1lcyA9IC0xLAo+ID4gICAg
ICAgICAgLm1heF9tYXB0cmFja19mcmFtZXMgPSAtMSwKPiA+ICAgICAgfTsKPiA+ICsgICAgY29u
c3QgY2hhciAqaHlwZXJ2aXNvcl9uYW1lOwo+ID4gIAo+ID4gICAgICAvKiBDcml0aWNhbCByZWdp
b24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55IGZhdWx0IGlzIGRlYWRseSEgKi8KPiA+ICAKPiA+
IEBAIC03NjMsNyArNzY0LDcgQEAgdm9pZCBfX2luaXQgbm9yZXR1cm4gX19zdGFydF94ZW4odW5z
aWduZWQgbG9uZyBtYmlfcCkKPiA+ICAgICAgICogYWxsb2NpbmcgYW55IHhlbmhlYXAgc3RydWN0
dXJlcyB3YW50ZWQgaW4gbG93ZXIgbWVtb3J5LiAqLwo+ID4gICAgICBrZXhlY19lYXJseV9jYWxj
dWxhdGlvbnMoKTsKPiA+ICAKPiA+IC0gICAgaHlwZXJ2aXNvcl9wcm9iZSgpOwo+ID4gKyAgICBo
eXBlcnZpc29yX25hbWUgPSBoeXBlcnZpc29yX3Byb2JlKCk7Cj4gCj4gLi4uIHlvdSBubyBsb25n
ZXIgY2FsbGluZyB0aGlzIGZ1bmN0aW9uIG11bHRpcGxlIHRpbWUsIHdoeSBkb2VzCj4gcGF0Y2gg
NCBzdGlsbCBwdXQgaW4gYSByZXNwZWN0aXZlIGd1YXJkPwoKUmVtbmFudCBmcm9tIHByZXZpb3Vz
IGl0ZXJhdGlvbnMuCgpJIGNhbiBzdWJtaXQgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gZHJvcCB0aGF0
IC0tIGRvIHJlYWxseSB3YW50IHRvCmludmFsaWRhdGUgYWxsIHRoZSByZXZpZXdzIGFuZCBhY2tz
IEkgZ290IHNvIGZhci4KCldlaS4KCj4gCj4gSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
