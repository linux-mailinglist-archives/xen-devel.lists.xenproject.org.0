Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFF410570D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:29:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXpIi-0002Sx-Nz; Thu, 21 Nov 2019 16:27:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4y/P=ZN=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iXpIg-0002SU-Dq
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:27:22 +0000
X-Inumbo-ID: cac5c271-0c7b-11ea-a33c-12813bfff9fa
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cac5c271-0c7b-11ea-a33c-12813bfff9fa;
 Thu, 21 Nov 2019 16:27:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x26so4135583wmk.4
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2019 08:27:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GLqbFrcQVQFIzjAGoZ0we48hsmb+jnGwP06sqKZuaOU=;
 b=PIAfead1odqwK604DV6sSzX/xbwRsV1d8i+VI26SKuC/wa2H+hlKypjCXJWwd7qTFB
 GqcbjhS0gNmMeHp12J5rDs0gUi+anyOnWtZH6jtkCdRD15fn+CqKKkjzsIhEcao4KkiO
 TiGg6w/bxfINSZzaMAyiBJCS6koD3QNAeTA+mR003ZGZSsyG/IkE3NmDcGqXE+nIh3rb
 A0ZZMV9moo8RjMft7mJm9cTRBUXzhHDeoO+tMlf6MZXZsnJZGTKm/mq9g+VFvN2Cd7kd
 QMnVF9dBEYdEaPIA2KH+xYovFdIIw1QxVwEFY0/jv2CPoKMQPlIkPuNF75ie/07NhKo6
 EteQ==
X-Gm-Message-State: APjAAAVsYZBeVz1XsStQKXsLY74Mnnw2LnJb3Qy2/UKmGh5A0h1FVYHA
 /HnaDQl2rd40gaXPwg/RSmk=
X-Google-Smtp-Source: APXvYqwkq0cLHX/Ha2nTlq4mzoIfivQqLR2QGy5l6kCDp9Y8peN/WTd2lv8bkK0DOTtQTwD42qoK1w==
X-Received: by 2002:a1c:6745:: with SMTP id b66mr10949775wmc.30.1574353640834; 
 Thu, 21 Nov 2019 08:27:20 -0800 (PST)
Received: from debian (74.162.147.147.dyn.plus.net. [147.147.162.74])
 by smtp.gmail.com with ESMTPSA id 189sm193299wmc.7.2019.11.21.08.27.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 08:27:20 -0800 (PST)
Date: Thu, 21 Nov 2019 16:27:18 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191121162718.v4sm34fyqxw63o5t@debian>
References: <20191021155718.28653-1-liuwe@microsoft.com>
 <20191021155718.28653-6-liuwe@microsoft.com>
 <3d9d195f-f8b3-d34d-6813-3efd0caa914b@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3d9d195f-f8b3-d34d-6813-3efd0caa914b@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next v3 5/9] x86: introduce hypervisor
 framework
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

T24gRnJpLCBOb3YgMTUsIDIwMTkgYXQgMDI6NDg6MThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjEuMTAuMjAxOSAxNzo1NywgV2VpIExpdSB3cm90ZToKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnZpc29yLmMKPiA+IEBAIC0wLDAg
KzEsNDUgQEAKPiA+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gPiArICogYXJjaC94ODYvZ3Vl
c3QvaHlwZXJ2aXNvci5jCj4gPiArICoKPiA+ICsgKiBTdXBwb3J0IGZvciBkZXRlY3RpbmcgYW5k
IHJ1bm5pbmcgdW5kZXIgYSBoeXBlcnZpc29yLgo+ID4gKyAqCj4gPiArICogVGhpcyBwcm9ncmFt
IGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkK
PiA+ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieQo+ID4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247
IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gPiArICogKGF0IHlvdXIgb3B0
aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KPiA+ICsgKgo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBk
aXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ID4gKyAqIGJ1
dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5
IG9mCj4gPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZQo+ID4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuCj4gPiArICoKPiA+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBj
b3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+ID4gKyAqIGFsb25nIHdpdGgg
dGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4u
Cj4gPiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ID4gKyAqLwo+
ID4gKwo+ID4gKyNpbmNsdWRlIDx4ZW4vdHlwZXMuaD4KPiA+ICsKPiA+ICsjaW5jbHVkZSA8YXNt
L2NhY2hlLmg+Cj4gPiArI2luY2x1ZGUgPGFzbS9ndWVzdC9oeXBlcnZpc29yLmg+Cj4gPiArCj4g
PiArc3RhdGljIHN0cnVjdCBoeXBlcnZpc29yX29wcyAqaG9wcyBfX3JlYWRfbW9zdGx5Owo+IAo+
IFRoZSBfX3JlYWRfbW9zdGx5IHdhbnRzIHRvIGFnYWluIGdvIGJldHdlZW4gdHlwZSBhbmQgaWRl
bnRpZmllci4KCkFjay4KCj4gCj4gPiArYm9vbCBoeXBlcnZpc29yX3Byb2JlKHZvaWQpCj4gPiAr
ewo+ID4gKyAgICBpZiAoIGhvcHMgKQo+ID4gKyAgICAgICAgcmV0dXJuIHRydWU7Cj4gPiArCj4g
PiArICAgIHJldHVybiBmYWxzZTsKPiAKPiBJIGFzc3VtZSB0aGlzIGlzbid0IHNpbXBseSAicmV0
dXJuIGhvcHMiIGJlY2F1c2UgbW9yZSBpcyBnb2luZyB0byBiZQo+IGFkZGVkIGhlcmU/Cj4gCgpU
aGF0J3MgcmlnaHQuCgpbLi4uXQo+ID4gQEAgLTQ5LDE1ICs0Niw2IEBAIERFQ0xBUkVfUEVSX0NQ
VShzdHJ1Y3QgdmNwdV9pbmZvICosIHZjcHVfaW5mbyk7Cj4gPiAgCj4gPiAgc3RhdGljIGlubGlu
ZSB2b2lkIHByb2JlX2h5cGVydmlzb3Iodm9pZCkge30KPiA+ICAKPiA+IC1zdGF0aWMgaW5saW5l
IHZvaWQgaHlwZXJ2aXNvcl9zZXR1cCh2b2lkKQo+ID4gLXsKPiA+IC0gICAgQVNTRVJUX1VOUkVB
Q0hBQkxFKCk7Cj4gPiAtfQo+ID4gLXN0YXRpYyBpbmxpbmUgdm9pZCBoeXBlcnZpc29yX2FwX3Nl
dHVwKHZvaWQpCj4gPiAtewo+ID4gLSAgICBBU1NFUlRfVU5SRUFDSEFCTEUoKTsKPiA+IC19Cj4g
Cj4gV2h5IGRpZCB0aGUgQVNTRVJUX1VOUkVBQ0hBQkxFKCkgZ2V0IGxvc3Q/CgpJIHdpbGwgYWRk
IGl0IGJhY2sgdG8gYWxsIHRob3NlIHN0dWJzLgoKV2VpLgoKPiAKPiBKYW4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
