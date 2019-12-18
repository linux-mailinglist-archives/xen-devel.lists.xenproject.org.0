Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BADBB1247F6
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 14:22:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihZEA-0003wU-1r; Wed, 18 Dec 2019 13:18:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8BSL=2I=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1ihZE7-0003wP-V8
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 13:18:55 +0000
X-Inumbo-ID: f0cf4f68-2198-11ea-9077-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f0cf4f68-2198-11ea-9077-12813bfff9fa;
 Wed, 18 Dec 2019 13:18:55 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z7so2224118wrl.13
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2019 05:18:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0l5Zf0tbDd47k5AjF1VolHxQ9gP1cJYOT2kjl+k6Bcs=;
 b=NNE0IdD0PWO3htTLuhpCLPZExwlauz68AQogkpqEqeXXo6hNo13qQuvHh7RJXRZK2v
 +RLVl83fGjPIoQyiaCPVUdDz/GNf7O1hzkNEsFpHg11ZbkUosjhx+40h2TzcseTP1T67
 S/zw5lUFByX2nCBvE6IlFUJuleYRgwTvnHtJlcNEgXq6unrcKvLpNJwJeOV4TLFXjO4e
 +Y3waKIcBaQ/JbQO7zvt2pdaB6NVQdIxeV6Z0ntRgNE6nmiV5zqxhWjeFKkFHImvF+xS
 7wCbpuaMRsyeavDk/+/K2JAWu+rJLuAYbsvog6gMtzmDQ0THntdKr4hFMB68BvjMauQM
 ziWQ==
X-Gm-Message-State: APjAAAWZut3ciG4nCv9ASpfM6OPb0yBvfQjFqC963CpLauQ3twzdMTPR
 yKLnLKcSlD/tMuWqgJFpttw=
X-Google-Smtp-Source: APXvYqwGNbQqEKE3wZTdVhy5Xi9vRvuSumpRP9doehR2lkWUN9atPNEPWu+p8xryqoGx3xHl91YDyQ==
X-Received: by 2002:adf:9c8f:: with SMTP id d15mr2870515wre.390.1576675134419; 
 Wed, 18 Dec 2019 05:18:54 -0800 (PST)
Received: from debian (38.163.200.146.dyn.plus.net. [146.200.163.38])
 by smtp.gmail.com with ESMTPSA id e6sm2526503wru.44.2019.12.18.05.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 05:18:53 -0800 (PST)
Date: Wed, 18 Dec 2019 13:18:52 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191218131852.cl7yiz3an2tbc5eg@debian>
References: <20191025091618.10153-1-liuwe@microsoft.com>
 <20191025091618.10153-8-liuwe@microsoft.com>
 <b2edd1f1-7b9e-d03f-2a84-70c65756654c@suse.com>
 <20191218123856.mskxir5onsmvql27@debian>
 <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9305cf4e-e105-e560-a493-bc499c516182@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next 7/7] x86: implement Hyper-V clock
 source
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
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBEZWMgMTgsIDIwMTkgYXQgMDE6NTE6NTRQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTguMTIuMjAxOSAxMzozOCwgV2VpIExpdSB3cm90ZToKPiA+IE9uIFR1ZSwgRGVj
IDEwLCAyMDE5IGF0IDA1OjU5OjA0UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDI1LjEwLjIwMTkgMTE6MTYsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+ICtzdGF0aWMgaW5saW5lIHVp
bnQ2NF90IHJlYWRfaHlwZXJ2X3RpbWVyKHZvaWQpCj4gPj4+ICt7Cj4gPj4+ICsgICAgdWludDY0
X3Qgc2NhbGUsIG9mZnNldCwgcmV0LCB0c2M7Cj4gPj4+ICsgICAgdWludDMyX3Qgc2VxOwo+ID4+
PiArICAgIHN0cnVjdCBtc19oeXBlcnZfdHNjX3BhZ2UgKnRzY19wYWdlID0gJmh5cGVydl90c2Nf
cGFnZTsKPiA+Pj4gKwo+ID4+PiArICAgIGRvIHsKPiA+Pj4gKyAgICAgICAgc2VxID0gdHNjX3Bh
Z2UtPnRzY19zZXF1ZW5jZTsKPiA+Pj4gKwo+ID4+PiArICAgICAgICAvKiBTZXEgMCBpcyBzcGVj
aWFsLiBJdCBtZWFucyB0aGUgVFNDIGVubGlnaHRlbm1lbnQgaXMgbm90Cj4gPj4+ICsgICAgICAg
ICAqIGF2YWlsYWJsZSBhdCB0aGUgbW9tZW50LiBUaGUgcmVmZXJlbmNlIHRpbWUgY2FuIG9ubHkg
YmUKPiA+Pj4gKyAgICAgICAgICogb2J0YWluZWQgZnJvbSB0aGUgUmVmZXJlbmNlIENvdW50ZXIg
TVNSLgo+ID4+PiArICAgICAgICAgKi8KPiA+Pj4gKyAgICAgICAgaWYgKCBzZXEgPT0gMCApCj4g
Pj4+ICsgICAgICAgIHsKPiA+Pj4gKyAgICAgICAgICAgIHJkbXNybChIVl9YNjRfTVNSX1RJTUVf
UkVGX0NPVU5ULCByZXQpOwo+ID4+PiArICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+Pj4gKyAg
ICAgICAgfQo+ID4+PiArCj4gPj4+ICsgICAgICAgIHNtcF9ybWIoKTsKPiA+Pj4gKwo+ID4+PiAr
ICAgICAgICB0c2MgPSByZHRzY19vcmRlcmVkKCk7Cj4gPj4KPiA+PiBUaGlzIGFscmVhZHkgaW5j
bHVkZXMgYXQgbGVhc3QgYSByZWFkIGZlbmNlLgo+ID4gCj4gPiBPSy4gcmR0c2MoKSBzaG91bGQg
YmUgZW5vdWdoIGhlcmUuCj4gCj4gQXJlIHlvdSBzdXJlPyBNeSBjb21tZW50IHdhcyByYXRoZXIg
dG93YXJkcyB0aGUgZHJvcHBpbmcgb2Ygc21wX3JtYigpCj4gKG1heWJlIHJlcGxhY2luZyBieSBh
IGNvbW1lbnQpLgoKSSBkbyBtZWFuIHRvIGtlZXAgc21wX3JtYigpIGJlZm9yZSBpdC4gSXMgdGhh
dCBub3QgZW5vdWdoPwoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
