Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F3011035F
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2019 18:25:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icBsv-0006lT-Po; Tue, 03 Dec 2019 17:22:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=72zl=ZZ=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1icBsu-0006lN-5N
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2019 17:22:48 +0000
X-Inumbo-ID: 85fcd0e6-15f1-11ea-81e3-12813bfff9fa
Received: from mail-wm1-f65.google.com (unknown [209.85.128.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 85fcd0e6-15f1-11ea-81e3-12813bfff9fa;
 Tue, 03 Dec 2019 17:22:47 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id f129so4459902wmf.2
 for <xen-devel@lists.xenproject.org>; Tue, 03 Dec 2019 09:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gFla1eQ5kkCvrLfWqW3rQ+bOd5ckitf0mOBpH0l3Q8c=;
 b=m/Ki4e4PMOUpYcTGsT2OMmBPq+eoVTqwkhll7irA1WqHRguJhVOHeu9AtDcTzMc/3K
 EZT+YL2htZFXy6/VcGJyix1++PsfjYobdzLzU7HChC8MYf/8AFJUKDsqSYh8a06QonHK
 NPTAgjVxCFyD9wY3iQyPL/mjA45ao24wdiwTrYEJMbeUld2fWnWG37TL/tVofI6qXUHv
 ygN5U/2CexTC4Cr3OorUQLO29Xu3vox1rLnutTjPaYOEpHk/kSRc2T1ceRUpzXsK+6RJ
 kt5pFatgLizeZh81G33LeSO3Zk/8ee/2xb0FJ5VyXwnM0mqy88Wu3lrkTOCSbyn6PLVI
 +Qrg==
X-Gm-Message-State: APjAAAVRonn5rS7Wm8/X9wQ6qH+BwIubA6NVmYBmDlaQF1MY68Z4HWyW
 l5vgyxK8pctzqsPqGpgOQNc=
X-Google-Smtp-Source: APXvYqyg4uPDN2pSQ7oqsp2IF/5VGyLzf1vARp8ISwSZrcP+wKMDFC54LeF0pwU7nTZtC+U4xT+jFg==
X-Received: by 2002:a1c:81c9:: with SMTP id c192mr21817877wmd.44.1575393766431; 
 Tue, 03 Dec 2019 09:22:46 -0800 (PST)
Received: from debian (122.163.200.146.dyn.plus.net. [146.200.163.122])
 by smtp.gmail.com with ESMTPSA id b63sm3428370wmb.40.2019.12.03.09.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:22:45 -0800 (PST)
Date: Tue, 3 Dec 2019 17:22:44 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191203172244.juk3iwb3hpw5gsps@debian>
References: <20191130115737.15752-1-liuwe@microsoft.com>
 <20191130115737.15752-8-liuwe@microsoft.com>
 <7681bfb6-40da-faa8-7133-ce8a241b8150@suse.com>
 <20191203163736.ssykoba43expjx3k@debian>
 <4361888e-3e89-25e0-f7b8-2949a32c5c6f@suse.com>
 <20191203170943.dx4n2s6442a7g2l7@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203170943.dx4n2s6442a7g2l7@debian>
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

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDU6MDk6NDNQTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUdWUsIERlYyAwMywgMjAxOSBhdCAwNTo1ODoyOFBNICswMTAwLCBKYW4gQmV1bGljaCB3
cm90ZToKPiA+IE9uIDAzLjEyLjIwMTkgMTc6MzcsIFdlaSBMaXUgd3JvdGU6Cj4gPiA+IE9uIFR1
ZSwgRGVjIDAzLCAyMDE5IGF0IDAzOjU0OjM1UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+
ID4gPj4gT24gMzAuMTEuMjAxOSAxMjo1NywgV2VpIExpdSB3cm90ZToKPiA+ID4+PiBBbHNvIHJl
cGxhY2UgcmVmZXJlbmNlIHRvIHhlbl9ndWVzdC4KPiA+ID4+Pgo+ID4gPj4+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPGxpdXdlQG1pY3Jvc29mdC5jb20+Cj4gPiA+Pgo+ID4gPj4gQWNrZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiA+ID4gCj4gPiA+IFRoYW5rcy4KPiA+
ID4gCj4gPiA+Pgo+ID4gPj4gSG93ZXZlciwgLi4uCj4gPiA+Pgo+ID4gPj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zZXR1cC5jCj4gPiA+Pj4gKysrIGIveGVuL2FyY2gveDg2L3NldHVwLmMKPiA+ID4+
PiBAQCAtNzAwLDYgKzcwMCw3IEBAIHZvaWQgX19pbml0IG5vcmV0dXJuIF9fc3RhcnRfeGVuKHVu
c2lnbmVkIGxvbmcgbWJpX3ApCj4gPiA+Pj4gICAgICAgICAgLm1heF9ncmFudF9mcmFtZXMgPSAt
MSwKPiA+ID4+PiAgICAgICAgICAubWF4X21hcHRyYWNrX2ZyYW1lcyA9IC0xLAo+ID4gPj4+ICAg
ICAgfTsKPiA+ID4+PiArICAgIGNvbnN0IGNoYXIgKmh5cGVydmlzb3JfbmFtZTsKPiA+ID4+PiAg
Cj4gPiA+Pj4gICAgICAvKiBDcml0aWNhbCByZWdpb24gd2l0aG91dCBJRFQgb3IgVFNTLiAgQW55
IGZhdWx0IGlzIGRlYWRseSEgKi8KPiA+ID4+PiAgCj4gPiA+Pj4gQEAgLTc2Myw3ICs3NjQsNyBA
QCB2b2lkIF9faW5pdCBub3JldHVybiBfX3N0YXJ0X3hlbih1bnNpZ25lZCBsb25nIG1iaV9wKQo+
ID4gPj4+ICAgICAgICogYWxsb2NpbmcgYW55IHhlbmhlYXAgc3RydWN0dXJlcyB3YW50ZWQgaW4g
bG93ZXIgbWVtb3J5LiAqLwo+ID4gPj4+ICAgICAga2V4ZWNfZWFybHlfY2FsY3VsYXRpb25zKCk7
Cj4gPiA+Pj4gIAo+ID4gPj4+IC0gICAgaHlwZXJ2aXNvcl9wcm9iZSgpOwo+ID4gPj4+ICsgICAg
aHlwZXJ2aXNvcl9uYW1lID0gaHlwZXJ2aXNvcl9wcm9iZSgpOwo+ID4gPj4KPiA+ID4+IC4uLiB5
b3Ugbm8gbG9uZ2VyIGNhbGxpbmcgdGhpcyBmdW5jdGlvbiBtdWx0aXBsZSB0aW1lLCB3aHkgZG9l
cwo+ID4gPj4gcGF0Y2ggNCBzdGlsbCBwdXQgaW4gYSByZXNwZWN0aXZlIGd1YXJkPwo+ID4gPiAK
PiA+ID4gUmVtbmFudCBmcm9tIHByZXZpb3VzIGl0ZXJhdGlvbnMuCj4gPiA+IAo+ID4gPiBJIGNh
biBzdWJtaXQgYSBmb2xsb3ctdXAgcGF0Y2ggdG8gZHJvcCB0aGF0IC0tIGRvIHJlYWxseSB3YW50
IHRvCj4gPiA+IGludmFsaWRhdGUgYWxsIHRoZSByZXZpZXdzIGFuZCBhY2tzIEkgZ290IHNvIGZh
ci4KPiA+IAo+ID4gQWNjb3JkaW5nIHRvIG15IHJlY29yZHMgcGF0Y2ggNCBoYWQgbm8gYWNrcyBl
eGNlcHQgbWluZSwgd2hpY2ggeW91Cj4gPiBjb3VsZCBrZWVwIHdpdGggdGhpcyBjaGFuZ2UgKGlu
IGZhY3QgSSB3YXMgdGhpbmtpbmcgb2YgbWFraW5nIGl0Cj4gPiBkZXBlbmRlbnQgdXBvbiB0aGUg
ZHJvcHBpbmcgb2YgdGhpcyBsZWZ0b3ZlcikuIFN1YnNlcXVlbnQgcGF0Y2hlcwo+ID4gbWF5IG9u
bHkgbmVlZCByZS1iYXNpbmcsIHdoaWNoIGRvZXNuJ3QgaW1wbHkgZHJvcHBpbmcgb2YgYW55IGFj
a3MuCj4gCj4gT0suIEluIHRoYXQgY2FzZSwgSSB3aWxsIGRyb3AgaXQgbG9jYWxseS4gSWYgdGhh
dCBjYXVzZXMgYW55IHN1YnN0YW50aWFsCj4gY2hhbmdlcywgSSB3aWxsIHBvc3QgYW5vdGhlciB2
ZXJzaW9uOyBvdGhlcndpc2UgSSB3aWxsIGp1c3Qga2VlcCBhbGwgdGhlCj4gdGFncyBhbmQgcHVz
aCB0aGlzIHNlcmllcyBzb29uLWlzaC4KPiAKPiBIb3cgZG9lcyB0aGF0IHNvdW5kIHRvIHlvdT8K
CkFuZCBpdCB0dXJucyBvdXQgaXQgaXMgaW5kZWVkIHRyaXZpYWwuIERyb3BwaW5nIHRoYXQgaHVu
ayBpbiBwYXRjaCA0Cm9ubHkgcmVxdWlyZXMgYSBtaW5vciBmaXh1cCB0byBwYXRjaCA2LgoKV2Vp
LgoKPiAKPiBXZWkuCj4gCj4gPiAKPiA+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
