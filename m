Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B73F8DF139
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:22:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZTZ-0004kD-KR; Mon, 21 Oct 2019 15:20:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/dQQ=YO=gmail.com=wei.liu.xen@srs-us1.protection.inumbo.net>)
 id 1iMZTY-0004ee-2R
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:20:04 +0000
X-Inumbo-ID: 41095830-f416-11e9-bbab-bc764e2007e4
Received: from mail-wm1-f66.google.com (unknown [209.85.128.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41095830-f416-11e9-bbab-bc764e2007e4;
 Mon, 21 Oct 2019 15:20:03 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id b24so13202700wmj.5
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=MaibFba6SytE5D8B39nowziQjxsqAVJd9oHRGsgrrhE=;
 b=P7BOMKh8EJVnq0cbVT358/MciP5P3tSIn/6UczyqD9lRGgiBt9hbc3XK6Ac1HMh//w
 MsyZ3uv324pHkGSyJTdNXA3nUrACOXCMWjpTqd6dDMcGOg2V3i+8b0hVDr6BLnfpRPmb
 qjbaP7subFhMvpKkoC4rryM0/lKx7XY0mhwVOrBdXKvTAJRWspKtdbsQl1+Pz2F3stGV
 z/QNgDwU2Zj9HJTM3hXY5h9ZlX8xA4xG0Z9w4ZgVEw1/ex+ozzRATyroIPc3eoAGGH2e
 jGx5mQY51k1ITN+ytES8CX509279s+qD6a73gYgCXND39N83FSvl+QGlc6HMCspyixZx
 YplA==
X-Gm-Message-State: APjAAAWxl4O9/VMiz8gnGYKU+EEVEdgDMbc4jpBcL/kV+CdqjLYM7paO
 jcrxqn3TbpEwvLqkWzAx8+s=
X-Google-Smtp-Source: APXvYqzFRw6l5Y5NbPpDnJPg+oWkBmNl0TvuKHU0tEw87jjzefkfO4Kai1b4Z0DSPD3pu2OYxeOYmQ==
X-Received: by 2002:a7b:c3cf:: with SMTP id t15mr19240356wmj.85.1571671202592; 
 Mon, 21 Oct 2019 08:20:02 -0700 (PDT)
Received: from debian (54.163.200.146.dyn.plus.net. [146.200.163.54])
 by smtp.gmail.com with ESMTPSA id u1sm25307087wru.90.2019.10.21.08.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 08:20:01 -0700 (PDT)
Date: Mon, 21 Oct 2019 16:20:00 +0100
From: Wei Liu <wl@xen.org>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20191021152000.qkmq7l2frq26l6cx@debian>
References: <20190930150044.5734-1-liuwe@microsoft.com>
 <20190930150044.5734-10-liuwe@microsoft.com>
 <20191021102225.GH17494@Air-de-Roger>
 <20191021145651.a2oxvh25kzbccy5n@debian>
 <20191021151126.GM17494@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191021151126.GM17494@Air-de-Roger>
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDU6MTE6MjZQTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7D
qSB3cm90ZToKPiBPbiBNb24sIE9jdCAyMSwgMjAxOSBhdCAwMzo1Njo1MVBNICswMTAwLCBXZWkg
TGl1IHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTI6MjI6MjVQTSArMDIwMCwg
Um9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IFsuLi5dCj4gPiA+ID4gK2Jvb2wgX19pbml0IGh5
cGVydl9wcm9iZSh2b2lkKQo+ID4gPiA+ICt7Cj4gPiA+ID4gKyAgICB1aW50MzJfdCBlYXgsIGVi
eCwgZWN4LCBlZHg7Cj4gPiA+ID4gKyAgICBib29sIGh5cGVydl9ndWVzdCA9IGZhbHNlOwo+ID4g
PiAKPiA+ID4gSSBkb24ndCB0aGluayB5b3UgbmVlZCB0aGlzIGxvY2FsIHZhcmlhYmxlLCB5b3Ug
Y2FuIHJldHVybiB0cnVlIGluIGlmCj4gPiA+IHRoZSBpZiBjb25kaXRpb24gbWF0Y2hlcywgYW5k
IGZhbHNlIG90aGVyd2lzZS4KPiA+ID4gCj4gPiAKPiA+IFN1cmUuIEkgY2FuIGRyb3AgaXQgZm9y
IG5vdyBhbmQgcmVpbnRyb2R1Y2UgaXQgd2hlbiBuZWNlc3NhcnkuCj4gPiAKPiA+ID4gPiArCj4g
PiA+ID4gKyAgICBjcHVpZCgweDQwMDAwMDAwLCAmZWF4LCAmZWJ4LCAmZWN4LCAmZWR4KTsKPiA+
ID4gPiArICAgIGlmICggKGVieCA9PSAweDcyNjM2OTRkKSAmJiAvKiAiTWljciIgKi8KPiA+ID4g
PiArICAgICAgICAgKGVjeCA9PSAweDY2NmY3MzZmKSAmJiAvKiAib3NvZiIgKi8KPiA+ID4gPiAr
ICAgICAgICAgKGVkeCA9PSAweDc2NDgyMDc0KSApICAvKiAidCBIdiIgKi8KPiA+ID4gCj4gPiA+
IEkgZ3Vlc3MgdGhlcmUgYXJlIG5vIEh5cGVyViBoZWFkZXJzIHRvIGltcG9ydCB0aGF0IGhhdmUg
dGhvc2UgdmFsdWVzCj4gPiA+IGRlZmluZWQ/Cj4gPiA+IAo+ID4gCj4gPiBOb3QgeWV0LiBJIGhh
dmUgcGxhbiB0byBpbXBvcnQgYSBoZWFkZXIgZnJvbSBMaW51eC4gV2hlbiB0aGF0J3MgZG9uZQo+
ID4gdGhlc2Ugd2lsbCBiZSByZXBsYWNlZCBieSBzb21lIG1hY3Jvcy4KPiA+IAo+ID4gU28gSSB3
aWxsIGtlZXAgdGhpcyBhcy1pcyBmb3Igbm93Lgo+IAo+IElzIGl0IHJlYWxseSBjdW1iZXJzb21l
IHRvIGludHJvZHVjZSB0aGUgaGVhZGVyIG5vdz8KPiAKPiBJTU8gaXQgd291bGQgYmUgYmV0dGVy
IHRvIGF2b2lkIGRlZmVycmluZyB0aGlzIHRvIHdoZW4geW91IGludHJvZHVjZQo+IHRoZSBoZWFk
ZXIsIHNpbmNlIGl0J3MgZWFzeSB0byBtaXNzIGl0LgoKVGhlIGhlYWRlciBpbiBMaW51eCBpcyBu
b3Qgd2l0aG91dCBpdHMgcHJvYmxlbXMuIEl0IGNlcnRhaW5seSBkb2Vzbid0CmhhdmUgdGhlIHNp
Z25hdHVyZSB2YWx1ZXMgaW4gaXQgeWV0LCBzbyB3aGV0aGVyIGltcG9ydGluZyBpdCBub3cgb3IK
bGF0ZXIgaXMgaW1tYXRlcmlhbCB0byB0aGlzIGlzc3VlIGF0IGhhbmQuIEkgd2lsbCBoYXZlIHRv
IGdvIHRocm91Z2gKdGhhdCBoZWFkZXIgZmlsZSBmaXJzdCBidXQgLUVUSU1FLgoKV2VpLgoKPiAK
PiBUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
