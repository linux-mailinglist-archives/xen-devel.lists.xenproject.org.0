Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8DDDF0B1
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:00:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZ7B-000203-Lm; Mon, 21 Oct 2019 14:56:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMZ79-0001zy-FQ
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 14:56:55 +0000
X-Inumbo-ID: 05444d6c-f413-11e9-9452-12813bfff9fa
Received: from mail-wr1-f66.google.com (unknown [209.85.221.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 05444d6c-f413-11e9-9452-12813bfff9fa;
 Mon, 21 Oct 2019 14:56:54 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id o28so14363727wro.7
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 07:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=jihHlXP8EVuA8qPtwu2nV7Lf2W1XYnl+9zN/Sb8aJN0=;
 b=bCm97dhyY1OCi9mymzurjzTJFDTEH5FfJg86WjvX2wmjJqg4jWYKlbqdmdUywUatGS
 4O5V/nuNDRSPL9wuMIBLBUp8s37G6pNoT6E1hP7Q3pahbwIMxcodn2JW3LL5UmHtHJB0
 QeozG0b5HBx8V5Fi13AhbHrxgHJJz1FZmoVP41hpfXaOxWxu26mVuBOhxeIQqPq2KI+3
 uJqf5dIrGwTWsGfqAlUGcTaiagK4CONGArnv8cDGBiGlPu4UU6Mc8IS/ULYLf+DyQyyi
 YsmObJALBiLNfM8/xpa3ht8sf2AVKAzLlQtzCX11aprYfMiO+3DPmgyCqOSyFpgdkdOF
 fDGw==
X-Gm-Message-State: APjAAAU3mIgiqVO3pUVa/1QUqwjDCAcZux/QbeUUWYbkQdssTeAR/6UH
 ay3Y4/mxbJp25KVqBthuTDw=
X-Google-Smtp-Source: APXvYqx7SmiZfykJBf6grZT9zqaxBLhQueGwvcBc6mfhzyYW17A/Lec0rHuXSsK0FWdUg0EpOxl92Q==
X-Received: by 2002:adf:dbce:: with SMTP id e14mr21195003wrj.49.1571669813763; 
 Mon, 21 Oct 2019 07:56:53 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id d8sm2078693wrr.71.2019.10.21.07.56.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:56:53 -0700 (PDT)
Date: Mon, 21 Oct 2019 15:56:51 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191021145651.a2oxvh25kzbccy5n@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
 <20191021102225.GH17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021102225.GH17494@Air-de-Roger>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MjI6MjVQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKWy4uLl0KPiA+ICtib29sIF9faW5pdCBoeXBlcnZfcHJvYmUodm9pZCkKPiA+ICt7
Cj4gPiArICAgIHVpbnQzMl90IGVheCwgZWJ4LCBlY3gsIGVkeDsKPiA+ICsgICAgYm9vbCBoeXBl
cnZfZ3Vlc3QgPSBmYWxzZTsKPiAKPiBJIGRvbid0IHRoaW5rIHlvdSBuZWVkIHRoaXMgbG9jYWwg
dmFyaWFibGUsIHlvdSBjYW4gcmV0dXJuIHRydWUgaW4gaWYKPiB0aGUgaWYgY29uZGl0aW9uIG1h
dGNoZXMsIGFuZCBmYWxzZSBvdGhlcndpc2UuCj4gCgpTdXJlLiBJIGNhbiBkcm9wIGl0IGZvciBu
b3cgYW5kIHJlaW50cm9kdWNlIGl0IHdoZW4gbmVjZXNzYXJ5LgoKPiA+ICsKPiA+ICsgICAgY3B1
aWQoMHg0MDAwMDAwMCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7Cj4gPiArICAgIGlmICggKGVi
eCA9PSAweDcyNjM2OTRkKSAmJiAvKiAiTWljciIgKi8KPiA+ICsgICAgICAgICAoZWN4ID09IDB4
NjY2ZjczNmYpICYmIC8qICJvc29mIiAqLwo+ID4gKyAgICAgICAgIChlZHggPT0gMHg3NjQ4MjA3
NCkgKSAgLyogInQgSHYiICovCj4gCj4gSSBndWVzcyB0aGVyZSBhcmUgbm8gSHlwZXJWIGhlYWRl
cnMgdG8gaW1wb3J0IHRoYXQgaGF2ZSB0aG9zZSB2YWx1ZXMKPiBkZWZpbmVkPwo+IAoKTm90IHll
dC4gSSBoYXZlIHBsYW4gdG8gaW1wb3J0IGEgaGVhZGVyIGZyb20gTGludXguIFdoZW4gdGhhdCdz
IGRvbmUKdGhlc2Ugd2lsbCBiZSByZXBsYWNlZCBieSBzb21lIG1hY3Jvcy4KClNvIEkgd2lsbCBr
ZWVwIHRoaXMgYXMtaXMgZm9yIG5vdy4KClsuLi5dCj4gPiArI2lmbmRlZiBfX1g4Nl9HVUVTVF9I
WVBFUlZfSF9fCj4gPiArI2RlZmluZSBfX1g4Nl9HVUVTVF9IWVBFUlZfSF9fCj4gPiArCj4gPiAr
I2lmZGVmIENPTkZJR19IWVBFUlZfR1VFU1QKPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNtL2d1ZXN0
L2h5cGVydmlzb3IuaD4KPiA+ICsKPiA+ICtleHRlcm4gc3RydWN0IGh5cGVydmlzb3Jfb3BzIGh5
cGVydl9oeXBlcnZpc29yX29wczsKPiAKPiBoeXBlcnZfb3BzIHdvdWxkIGJlIGZpbmUgYnkgbWUs
IHNlZW1zIGtpbmQgb2YgcmVkdW5kYW50IHRvIGhhdmUKPiAnaHlwZXInIHR3aWNlIGluIGEgbmFt
ZS4KPiAKCkluIHRoYXQgY2FzZSBJIHdpbGwgYWxzbyBjaGFuZ2UgeGVuX2h5cGVydmlzb3Jfb3Bz
IHRvIHhlbl9vcHMgdG8gcmVtYWluCmNvbnNpc3RlbnQuCgpXZWkuCgo+IFRoYW5rcywgUm9nZXIu
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
