Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA13DF173
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:29:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZa7-0005R0-V8; Mon, 21 Oct 2019 15:26:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMZa7-0005Qn-1b
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:26:51 +0000
X-Inumbo-ID: 3395e2c6-f417-11e9-bbab-bc764e2007e4
Received: from mail-wm1-f67.google.com (unknown [209.85.128.67])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3395e2c6-f417-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 15:26:50 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 6so1619654wmf.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:26:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=PIOLGwz+QNPktLtEIka0abFL+5jI347VGn1d9TahmEc=;
 b=sX7RklMStvtGD83dU393gYwCe0FGli+ZSWJjxhgy6ck6NnOwuO/s55offcFMY0N8Be
 G6xiHRyQLol7ZX0DJq4m2XiLdzG26fiWuD+kmCyefEEwk6Lkm8ISZ6r4jjik+rBmYYnw
 opMODqlspnbdaGQhjTYd5Uwa4J6V0PXx0LU6WNI/5HutTj10Ewzz7CJOte7Xv3RqUkUv
 RspXqk/BPOsObXNnUs13hX4xI8U+bilXFFclY94ao9+AUnRm/jktvI1scsnzWbgpNBv4
 cYWM4ukQNS3n5vO9MzkjrRJ/sLt2LQZwk2892MyqIfLF947yYQP2F+7XA3SnBAqQUhR8
 wRXg==
X-Gm-Message-State: APjAAAXQIPWXTpTJDbc1qPZH+zyBqEwMWLArpx2NIQRGQ0ezD/ofq+1j
 WI139W3/GICyHG+xnkA0X3A=
X-Google-Smtp-Source: APXvYqy1S0eOKUzjnErYR5H5YEfbU4PRFPHsKfC3dU7yoINsoGMfKvba/GyTdB0iJ3Ga2gNyKoS6yw==
X-Received: by 2002:a1c:2e94:: with SMTP id u142mr20309269wmu.69.1571671609535; 
 Mon, 21 Oct 2019 08:26:49 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id o18sm16804399wrm.11.2019.10.21.08.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:26:49 -0700 (PDT)
Date: Mon, 21 Oct 2019 16:26:47 +0100
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191021152647.26rw76gppdal2phe@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
 <20191021102225.GH17494@Air-de-Roger>
 <20191021102644.GI17494@Air-de-Roger>
 <34c9e25b-18cd-cafb-21a4-ba6157a31a2d@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34c9e25b-18cd-cafb-21a4-ba6157a31a2d@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v2 9/9] x86: introduce
 CONFIG_HYPERV and detection code
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDQ6MDI6MzNQTSArMDEwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAyMS8xMC8yMDE5IDExOjI2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4+
PiArCj4gPj4+ICsgICAgY3B1aWQoMHg0MDAwMDAwMCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7
Cj4gPj4+ICsgICAgaWYgKCAoZWJ4ID09IDB4NzI2MzY5NGQpICYmIC8qICJNaWNyIiAqLwo+ID4+
PiArICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAvKiAib3NvZiIgKi8KPiA+Pj4gKyAg
ICAgICAgIChlZHggPT0gMHg3NjQ4MjA3NCkgKSAgLyogInQgSHYiICovCj4gPj4gSSBndWVzcyB0
aGVyZSBhcmUgbm8gSHlwZXJWIGhlYWRlcnMgdG8gaW1wb3J0IHRoYXQgaGF2ZSB0aG9zZSB2YWx1
ZXMKPiA+PiBkZWZpbmVkPwo+ID4+Cj4gPj4gQWx0ZXJuYXRpdmVseSB5b3UgY291bGQgZG8gc29t
ZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZyBJIHRoaW5rOgo+ID4+Cj4gPj4gc3RhdGljIGNvbnN0
IGNoYXIgaHlwZXJ2X3NpZ1tdIF9faW5pdGNvbnN0ID0gIk1pY3Jvc29mdCBIdiI7Cj4gPj4KPiA+
PiBib29sIF9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiA+PiB7Cj4gPj4gICAgIHVpbnQzMl90
IGVheCwgc2lnWzNdOwo+ID4+Cj4gPj4gICAgIGNwdWlkKDB4NDAwMDAwMDAsICZlYXgsICZzaWdb
MF0sICZzaWdbMV0sICZzaWdbMl0pOwo+ID4+ICAgICBpZiAoICFzdHJuY21wKGh5cGVydl9zaWcs
IHNpZywgc3RybmNtcChoeXBlcnZfc2lnKSApCj4gPiBVcmcsIEkndmUgbWFkZSBhIG1pc3Rha2Ug
aGVyZSwgdGhlIGxpbmUgc2hvdWxkIGJlOgo+ID4KPiA+ICFzdHJuY21wKGh5cGVydl9zaWcsIHNp
Zywgc3RybGVuKGh5cGVydl9zaWcpKQo+IAo+IEp1c3QgYmVjYXVzZSB0aGUgbGVhdmVzIGZvcm0g
YW4gYXNjaWkgc3RyaW5nLCBkb2Vzbid0IG1lYW4gdGhhdCB1c2luZwo+IHN0cmluZyBjb21wYXJp
c29ucyBhcmUgdGhlIHNhbmUgd2F5IHRvIGNoZWNrLsKgIDN4IDMyYml0IGNvbXBhcmVzIGFyZQo+
IHN1YnN0YW50aWFsbHkgbW9yZSBlZmZpY2llbnQsIGFuZCBmYXIgaGFyZGVyIHRvIGdldCB3cm9u
Zy4KPiAKPiBXZWk6IE9uIHlvdXIgZGV0ZWN0aW9uIGFsZ29yaXRobSwgeW91IGFsc28gbmVlZCB0
byBmaW5kIEhWIzEgaW4KPiAweDQwMDAwMDAxLmVheCB0byBkZXRlY3QgY29uZm9ybWFuY2UgdG8g
dGhlIHZpcmlkaWFuIHNwZWMuCgpTdXJlIEkgY2FuIGRvIHRoYXQuCgpJJ20gbm90IHN1cmUgaXQg
bWF0dGVycyB0aGF0IG11Y2ggaW4gcHJhY3RpY2UgdGhvdWdoLgoKV2VpLgoKPiAKPiB+QW5kcmV3
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
