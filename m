Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8614EE9F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 15:40:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixXQB-0003Kr-7R; Fri, 31 Jan 2020 14:37:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qvnh=3U=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ixXQ9-0003Ki-Vc
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 14:37:22 +0000
X-Inumbo-ID: 305bb1a6-4437-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 305bb1a6-4437-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 14:37:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXQ8-0004N2-CI; Fri, 31 Jan 2020 14:37:20 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ixXQ8-0000Bm-2U; Fri, 31 Jan 2020 14:37:20 +0000
Date: Fri, 31 Jan 2020 14:37:16 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200131143716.gtdb5wwoagxpb223@debian>
References: <20200129202034.15052-1-liuwe@microsoft.com>
 <20200129202034.15052-9-liuwe@microsoft.com>
 <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6afc369b-a93e-1512-d6ea-f9260fb83c7c@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v5 08/12] x86/hyperv: provide Hyper-V
 hypercall functions
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBKYW4gMzEsIDIwMjAgYXQgMDM6MjQ6MDdQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMDEuMjAyMCAyMToyMCwgV2VpIExpdSB3cm90ZToKPiA+IEkgdHJpZWQgdXNp
bmcgdGhlIGFzbSgiLmVxdSAuLiIpIHRyaWNrIGJ1dCBoaXQgYSBwcm9ibGVtIHdpdGggJWMgYWdh
aW4uCj4gPiAKPiA+IG1tLmM6NTczNjo1OiBlcnJvcjogaW52YWxpZCAnYXNtJzogb3BlcmFuZCBp
cyBub3QgYSBjb25kaXRpb24gY29kZSwgaW52YWxpZCBvcGVyYW5kIGNvZGUgJ2MnCj4gPiAgICAg
ICAgICAgICAgICBhc20gKCAiLmVxdSBIVl9IQ0FMTF9QQUdFLCAlYzA7IC5nbG9iYWwgSFZfSENB
TExfUEFHRSIKPiAKPiBXb3VsZCB5b3UgbWluZCBhbHNvIGluZGljYXRpbmcgd2hhdCB0aGUgaW5w
dXQgb3BlcmFuZCBhY3R1YWxseQo+IHdhcz8gQWNjb3JkaW5nIHRvIG15IGxvb2tpbmcgYXQgZ2Nj
IHNvdXJjZXMgd2hlbiB5b3UgZmlyc3QKPiBtZW50aW9uZWQgdGhpcyAob24gaXJjIGlpcmMpLCBt
dWNoIGRlcGVuZHMgb24gaXQgYWN0dWFsbHkgYmUKPiByZWNvZ25pemFibGUgYXMgYSBjb25zdGFu
dCBieSB0aGUgY29tcGlsZXIuCgpTb21ldGhpbmcgYWxvbmcgdGhlIGxpbmU6CgogIGFzbSAoICIu
ZXF1IEhWX0hDQUxMX1BBR0UsICVjMDsgLmdsb2JhbCBIVl9IQ0FMTF9QQUdFIgogICAgICAgOjog
ImkiIChfX2ZpeF94X3RvX3ZpcnQoRklYX1hfSFYuLi4pKQoKCj4gCj4gPiArc3RhdGljIGlubGlu
ZSB1aW50NjRfdCBodl9kb19oeXBlcmNhbGwodWludDY0X3QgY29udHJvbCwgcGFkZHJfdCBpbnB1
dF9hZGRyLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhZGRy
X3Qgb3V0cHV0X2FkZHIpCj4gPiArewo+ID4gKyAgICB1aW50NjRfdCBzdGF0dXM7Cj4gPiArICAg
IHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgcjggYXNtKCJyOCIpID0gb3V0cHV0X2FkZHI7Cj4gCj4g
SSBndWVzcyBzdHJpY3RseSBzcGVha2luZyB0aGlzIHdhbnRzIHRvIGJlIGFzbSAoICJyOCIgKSwK
PiBhbGJlaXQgSSBub3cgcmVhbGl6ZSB0aGF0IEkndmUgc2ltaWxhcmx5IG5vdCBwbGF5ZWQgYnkg
c3R5bGUKPiBpbiBhbHRlcm5hdGl2ZV9jYWxsTigpLiBJbiB0aGUgZW5kIEkgZ3Vlc3MgLSBlaXRo
ZXIgd2F5LgoKT0suIEkgY2FuIGZpeCB0aGlzLgoKPiAKPiA+ICsgICAgYXNtIHZvbGF0aWxlICgg
ImNhbGwgaHZfaGNhbGxfcGFnZSIKPiA+ICsgICAgICAgICAgICAgICAgICAgOiAiPWEiIChzdGF0
dXMpLCAiK2MiIChjb250cm9sKSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAiK2QiIChpbnB1
dF9hZGRyKSBBU01fQ0FMTF9DT05TVFJBSU5UCj4gPiArICAgICAgICAgICAgICAgICAgIDogInIi
IChyOCkKPiAKPiBXaHkgIitjIiBhbmQgIitkIiBidXQganVzdCAiciI/IElmIHI4IGdldHMgdHJl
YXRlZCBkaWZmZXJlbnRseQo+IGZyb20gcmN4IGFuZCByZHgsIHBsZWFzZSBhdHRhY2ggYSBicmll
ZiBjb21tZW50Lgo+IAoKT2ZmIHRoZSB0b3Agb2YgbXkgaGVhZDogcjggd2lsbCBub3QgYmUgbW9k
aWZpZWQgYnkgSHlwZXItViwgd2hpbGUgb3RoZXJzCm1heS4KCldlaS4KCgo+IEphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
