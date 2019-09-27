Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11DBC0401
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 13:22:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDoGa-00058e-Rh; Fri, 27 Sep 2019 11:18:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BxSY=XW=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iDoGY-00058J-T3
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 11:18:26 +0000
X-Inumbo-ID: 86196458-e118-11e9-97fb-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by localhost (Halon) with ESMTPS
 id 86196458-e118-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 11:18:26 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 5so6172989wmg.0
 for <xen-devel@lists.xenproject.org>; Fri, 27 Sep 2019 04:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=8GCg4N37fntP9KW1ntLgMgL0hZWIWFf9vfpjwv/8k/c=;
 b=eb4pIRmI+wrEjY4i5Yo5ocYHIsobqepi90q80NQrYqzRjt0muGEySmuxOAJ+8I1vX9
 EOPiBirpFyu8OzXoSSsJjwaDmC9evPEROCXLkf8VgmQcseoUiRDfMQxOSaUkS9A8UqyN
 26p0GDXL8fhD6BtF86JPHWc0F/PKJhZ05Sm9DlzRlkIF3QOKXTrH6UVLCtfPbZAWiw2h
 wsmCIYANN+fQa6dB9HNEawzwLsG6UtL0NyzWszO2MY8uunOHp7RZLEwSiBo1p/pQFdMZ
 pSdculasvkcfV0ajGpz6kqsfWyeL0B8jcxe/MjZJ87eMp6QGnth9d6/JOs0fK5wIfSlb
 dqhA==
X-Gm-Message-State: APjAAAUzh0sIjq+CCb62s+UNLNcIi6Rt1MyO3liGpXYHqzjC8xgvtSdv
 6X5cVF1cr3Wc+D2RDWIY2e8=
X-Google-Smtp-Source: APXvYqx2WUHZIuXzb/MbJYAyQ6DVdqfyIfBjGLkuy26QNLabu39ydsq+jrfV0jRSp9sAXeJ1Af8jgw==
X-Received: by 2002:a1c:cb83:: with SMTP id b125mr7114415wmg.43.1569583105395; 
 Fri, 27 Sep 2019 04:18:25 -0700 (PDT)
Received: from debian (207.148.159.143.dyn.plus.net. [143.159.148.207])
 by smtp.gmail.com with ESMTPSA id w7sm4373100wmd.22.2019.09.27.04.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 04:18:24 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:18:23 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190927111823.ir5xn3pbkc62wdln@debian>
References: <20190923100931.29670-1-liuwe@microsoft.com>
 <20190923100931.29670-8-liuwe@microsoft.com>
 <20190925104842.hmvoo4477ennkj77@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925104842.hmvoo4477ennkj77@Air-de-Roger>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH for-next RFC 7/8] x86: introduce
 CONFIG_HYPERV and hyperv directory
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

T24gV2VkLCBTZXAgMjUsIDIwMTkgYXQgMTI6NDg6NDJQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIFNlcCAyMywgMjAxOSBhdCAxMTowOTozMEFNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gV2UgdXNlIHRoZSBzYW1lIGNvZGUgc3RydWN0dXJlIGFzIHdlIGRpZCBm
b3IgWGVuIGNvZGUuCj4gPiAKPiA+IEFzIHN0YXJ0ZXJzLCBkZXRlY3QgSHlwZXItViBpbiBwcm9i
ZV9oeXBlcnYuIE1vcmUgY29tcGxleAo+ID4gZnVuY3Rpb25hbGl0eSB3aWxsIGJlIGFkZGVkIGxh
dGVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29t
Pgo+ID4gLS0tCj4gPiAgeGVuL2FyY2gveDg2L0tjb25maWcgICAgICAgICAgICAgICB8ICA5ICsr
KysrCj4gPiAgeGVuL2FyY2gveDg2L2d1ZXN0L01ha2VmaWxlICAgICAgICB8ICAxICsKPiA+ICB4
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIHwgIDEgKwo+ID4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgfCA2MyArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2aXNvci5jICAgIHwgIDMgKy0KPiA+ICB4
ZW4vaW5jbHVkZS9hc20teDg2L2d1ZXN0LmggICAgICAgIHwgIDEgKwo+ID4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmggfCA0OCArKysrKysrKysrKysrKysrKysrKysrKwo+ID4g
IDcgZmlsZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQo+ID4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4g
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9pbmNsdWRlL2FzbS14ODYvZ3Vlc3QvaHlwZXJ2LmgK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9LY29uZmlnIGIveGVuL2FyY2gveDg2
L0tjb25maWcKPiA+IGluZGV4IDU4NGJkYzFiYjguLmM1YTkzYmFiZmUgMTAwNjQ0Cj4gPiAtLS0g
YS94ZW4vYXJjaC94ODYvS2NvbmZpZwo+ID4gKysrIGIveGVuL2FyY2gveDg2L0tjb25maWcKPiA+
IEBAIC0xNjMsNiArMTYzLDE1IEBAIGVuZGNob2ljZQo+ID4gIGNvbmZpZyBHVUVTVAo+ID4gIAli
b29sCj4gPiAgCj4gPiArY29uZmlnIEhZUEVSVl9HVUVTVAo+ID4gKwlkZWZfYm9vbCBuCj4gPiAr
CXNlbGVjdCBHVUVTVAo+ID4gKwlwcm9tcHQgIkh5cGVyLVYgR3Vlc3QiCj4gPiArCS0tLWhlbHAt
LS0KPiA+ICsJICBTdXBwb3J0IGZvciBYZW4gZGV0ZWN0aW5nIHdoZW4gaXQgaXMgcnVubmluZyB1
bmRlciBIeXBlci1WLgo+ID4gKwo+ID4gKwkgIElmIHVuc3VyZSwgc2F5IE4uCj4gPiArCj4gPiAg
Y29uZmlnIFhFTl9HVUVTVAo+ID4gIAlkZWZfYm9vbCBuCj4gPiAgCXNlbGVjdCBHVUVTVAo+ID4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9NYWtlZmlsZQo+ID4gaW5kZXggZjYzZDY0YmJlZS4uZjE2NDE5Njc3MiAxMDA2NDQKPiA+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9NYWtlZmlsZQo+ID4gKysrIGIveGVuL2FyY2gveDg2
L2d1ZXN0L01ha2VmaWxlCj4gPiBAQCAtMSwzICsxLDQgQEAKPiA+ICBvYmoteSArPSBoeXBlcnZp
c29yLm8KPiA+ICAKPiA+ICtzdWJkaXItJChDT05GSUdfSFlQRVJWX0dVRVNUKSArPSBoeXBlcnYK
PiA+ICBzdWJkaXItJChDT05GSUdfWEVOX0dVRVNUKSArPSB4ZW4KPiA+IGRpZmYgLS1naXQgYS94
ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5
cGVydi9NYWtlZmlsZQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGluZGV4IDAwMDAwMDAw
MDAuLjY4MTcwMTA5YTkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUKPiA+IEBAIC0wLDAgKzEgQEAKPiA+ICtvYmoteSArPSBoeXBl
cnYubwo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMg
Yi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jCj4gPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uNDg4ZTljMTRhMwo+ID4gLS0tIC9kZXYvbnVsbAo+
ID4gKysrIGIveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYwo+ID4gQEAgLTAsMCAr
MSw2MyBAQAo+ID4gKy8qKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioKPiA+ICsgKiBhcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvaHlwZXJ2LmMKPiA+ICsgKgo+ID4gKyAqIFN1cHBvcnQgZm9yIGRldGVjdGluZyBh
bmQgcnVubmluZyB1bmRlciBIeXBlci1WLgo+ID4gKyAqCj4gPiArICogVGhpcyBwcm9ncmFtIGlz
IGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkKPiA+
ICsgKiBpdCB1bmRlciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNl
IGFzIHB1Ymxpc2hlZCBieQo+ID4gKyAqIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVp
dGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vuc2UsIG9yCj4gPiArICogKGF0IHlvdXIgb3B0aW9u
KSBhbnkgbGF0ZXIgdmVyc2lvbi4KPiA+ICsgKgo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLAo+ID4gKyAqIGJ1dCBX
SVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9m
Cj4gPiArICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQ
T1NFLiAgU2VlIHRoZQo+ID4gKyAqIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3Jl
IGRldGFpbHMuCj4gPiArICoKPiA+ICsgKiBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5
IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZQo+ID4gKyAqIGFsb25nIHdpdGggdGhp
cyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4g
PiArICoKPiA+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMTkgTWljcm9zb2Z0Lgo+ID4gKyAqLwo+ID4g
KyNpbmNsdWRlIDx4ZW4vaW5pdC5oPgo+ID4gKwo+ID4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QuaD4K
PiA+ICsKPiA+ICtib29sIF9fcmVhZF9tb3N0bHkgaHlwZXJ2X2d1ZXN0Owo+IAo+IHN0YXRpYz8K
PiAKCkkgZXhwZWN0ZWQgdGhpcyB0byBiZSByZWZlcmVuY2VkIGVsc2V3aGVyZSwgaGVuY2UgSSBt
YWRlIGl0IG5vbi1zdGF0aWMuCgo+ID4gKwo+ID4gK2Jvb2wgX19pbml0IHByb2JlX2h5cGVydih2
b2lkKQo+ID4gK3sKPiA+ICsgICAgdWludDMyX3QgZWF4LCBlYngsIGVjeCwgZWR4Owo+ID4gKwo+
ID4gKyAgICBpZiAoIGh5cGVydl9ndWVzdCApCj4gPiArICAgICAgICByZXR1cm4gdHJ1ZTsKPiA+
ICsKPiA+ICsgICAgY3B1aWQoMHg0MDAwMDAwMCwgJmVheCwgJmVieCwgJmVjeCwgJmVkeCk7Cj4g
PiArICAgIGlmICggKGVieCA9PSAweDcyNjM2OTRkKSAmJiAvKiAiTWljciIgKi8KPiA+ICsgICAg
ICAgICAoZWN4ID09IDB4NjY2ZjczNmYpICYmIC8qICJvc29mIiAqLwo+ID4gKyAgICAgICAgIChl
ZHggPT0gMHg3NjQ4MjA3NCkgKSAgLyogInQgSHYiICovCj4gPiArICAgICAgICBoeXBlcnZfZ3Vl
c3QgPSB0cnVlOwo+ID4gKwo+ID4gKyAgICByZXR1cm4gaHlwZXJ2X2d1ZXN0Owo+ID4gK30KPiA+
ICsKPiA+ICt2b2lkIF9faW5pdCBoeXBlcnZfc2V0dXAodm9pZCkKPiA+ICt7Cj4gPiArfQo+ID4g
Kwo+ID4gK3ZvaWQgaHlwZXJ2X2FwX3NldHVwKHZvaWQpCj4gPiArewo+ID4gK30KPiA+ICsKPiA+
ICt2b2lkIGh5cGVydl9yZXN1bWUodm9pZCkKPiA+ICt7Cj4gPiArfQo+IAo+IFNlZW1zIGtpbmQg
b2YgcG9pbnRsZXNzIHRvIGFkZCB0aG9zZSBkdW1teSBoeXBlcnZfIGZ1bmN0aW9ucywgQUZBSUNU
Cj4gdGhleSBkb24ndCBoYXZlIGFueSBjYWxsZXJzIHlldD8KPiAKPiBJIHdvdWxkIHByZWZlciB0
aGF0IHlvdSBpbnRyb2R1Y2Ugc3VjaCBkdW1teSBjYWxsZXJzIHdoZW4gdGhleSBhcmUKPiB1c2Vk
Lgo+IAoKTm8gcHJvYmxlbS4KCldlaS4KCj4gVGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
