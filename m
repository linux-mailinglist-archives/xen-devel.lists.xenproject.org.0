Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D386114DA41
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 12:58:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix8Q1-000338-J1; Thu, 30 Jan 2020 11:55:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ezal=3T=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1ix8Pz-000333-J5
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 11:55:31 +0000
X-Inumbo-ID: 6a007864-4357-11ea-8a3e-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a007864-4357-11ea-8a3e-12813bfff9fa;
 Thu, 30 Jan 2020 11:55:30 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8Px-0003Co-Up; Thu, 30 Jan 2020 11:55:29 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1ix8Px-0006sd-LI; Thu, 30 Jan 2020 11:55:29 +0000
Date: Thu, 30 Jan 2020 11:55:26 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200130115526.eqf3gce2amdqqjgp@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-4-liuwe@microsoft.com>
 <c714a185-ee86-c4f4-53fe-4c7f5c05a582@suse.com>
 <20200129183727.t53wphvboeurzuhk@debian>
 <23bf85b0-976b-09d5-96fe-587069b25679@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23bf85b0-976b-09d5-96fe-587069b25679@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 3/7] x86/hyperv: provide Hyper-V
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
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBKYW4gMzAsIDIwMjAgYXQgMDk6MTI6MTRBTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMDEuMjAyMCAxOTozNywgV2VpIExpdSB3cm90ZToKPiA+IE9uIFRodSwgSmFu
IDIzLCAyMDIwIGF0IDEyOjI4OjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4+IE9u
IDIyLjAxLjIwMjAgMjE6MjMsIFdlaSBMaXUgd3JvdGU6Cj4gPj4+IC0tLSAvZGV2L251bGwKPiA+
Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9ndWVzdC9oeXBlcnYtaGNhbGwuaAo+ID4+PiBA
QCAtMCwwICsxLDk4IEBACj4gPj4+ICsvKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCj4gPj4+ICsgKiBh
c20teDg2L2d1ZXN0L2h5cGVydi1oY2FsbC5oCj4gPj4+ICsgKgo+ID4+PiArICogVGhpcyBwcm9n
cmFtIGlzIGZyZWUgc29mdHdhcmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcgo+ID4+
PiArICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB0aGUgR05V
IEdlbmVyYWwgUHVibGljCj4gPj4+ICsgKiBMaWNlbnNlLCB2ZXJzaW9uIDIsIGFzIHB1Ymxpc2hl
ZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgo+ID4+PiArICoKPiA+Pj4gKyAqIFRo
aXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNl
ZnVsLAo+ID4+PiArICogYnV0IFdJVEhPVVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhl
IGltcGxpZWQgd2FycmFudHkgb2YKPiA+Pj4gKyAqIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNT
IEZPUiBBIFBBUlRJQ1VMQVIgUFVSUE9TRS4gIFNlZSB0aGUgR05VCj4gPj4+ICsgKiBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCj4gPj4+ICsgKgo+ID4+PiArICogWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljCj4g
Pj4+ICsgKiBMaWNlbnNlIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtOyBJZiBub3QsIHNlZSA8aHR0
cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCj4gPj4+ICsgKgo+ID4+PiArICogQ29weXJpZ2h0
IChjKSAyMDE5IE1pY3Jvc29mdC4KPiA+Pj4gKyAqLwo+ID4+PiArCj4gPj4+ICsjaWZuZGVmIF9f
WDg2X0hZUEVSVl9IQ0FMTF9IX18KPiA+Pj4gKyNkZWZpbmUgX19YODZfSFlQRVJWX0hDQUxMX0hf
Xwo+ID4+PiArCj4gPj4+ICsjaW5jbHVkZSA8eGVuL2xpYi5oPgo+ID4+PiArI2luY2x1ZGUgPHhl
bi90eXBlcy5oPgo+ID4+PiArCj4gPj4+ICsjaW5jbHVkZSA8YXNtL2FzbV9kZWZucy5oPgo+ID4+
PiArI2luY2x1ZGUgPGFzbS9maXhtYXAuaD4KPiA+Pj4gKyNpbmNsdWRlIDxhc20vZ3Vlc3QvaHlw
ZXJ2LXRsZnMuaD4KPiA+Pj4gKyNpbmNsdWRlIDxhc20vcGFnZS5oPgo+ID4+PiArCj4gPj4+ICtz
dGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50NjRfdCBjb250cm9sLCBw
YWRkcl90IGlucHV0X2FkZHIsCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwYWRkcl90IG91dHB1dF9hZGRyKQo+ID4+PiArewo+ID4+PiArICAgIHVpbnQ2NF90
IHN0YXR1czsKPiA+Pj4gKyAgICByZWdpc3RlciB1bnNpZ25lZCBsb25nIHI4IGFzbSgicjgiKSA9
IG91dHB1dF9hZGRyOwo+ID4+PiArCj4gPj4+ICsgICAgYXNtIHZvbGF0aWxlICgiSU5ESVJFQ1Rf
Q0FMTCAlUFtoY2FsbF9wYWdlXSIKPiA+Pj4gKyAgICAgICAgICAgICAgICAgIDogIj1hIiAoc3Rh
dHVzKSwgIitjIiAoY29udHJvbCksCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICIrZCIgKGlu
cHV0X2FkZHIpIEFTTV9DQUxMX0NPTlNUUkFJTlQKPiA+Pj4gKyAgICAgICAgICAgICAgICAgIDog
InIiIChyOCksCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgIFtoY2FsbF9wYWdlXSAicCIgKGZp
eF94X3RvX3ZpcnQoRklYX1hfSFlQRVJWX0hDQUxMKSkKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
IDogIm1lbW9yeSIpOwo+ID4+PiArCj4gPj4+ICsgICAgcmV0dXJuIHN0YXR1czsKPiA+Pj4gK30K
PiA+Pj4gKwo+ID4+PiArc3RhdGljIGlubGluZSB1aW50NjRfdCBodl9kb19mYXN0X2h5cGVyY2Fs
bCh1aW50MTZfdCBjb2RlLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50NjRfdCBpbnB1dDEsIHVpbnQ2NF90IGlucHV0MikKPiA+Pj4gK3sKPiA+
Pj4gKyAgICB1aW50NjRfdCBzdGF0dXM7Cj4gPj4+ICsgICAgdWludDY0X3QgY29udHJvbCA9IGNv
ZGUgfCBIVl9IWVBFUkNBTExfRkFTVF9CSVQ7Cj4gPj4+ICsgICAgcmVnaXN0ZXIgdW5zaWduZWQg
bG9uZyByOCBhc20oInI4IikgPSBpbnB1dDI7Cj4gPj4+ICsKPiA+Pj4gKyAgICBhc20gdm9sYXRp
bGUgKCJJTkRJUkVDVF9DQUxMICVQW2hjYWxsX3BhZ2VdIgo+ID4+PiArICAgICAgICAgICAgICAg
ICAgOiAiPWEiIChzdGF0dXMpLCAiK2MiIChjb250cm9sKSwKPiA+Pj4gKyAgICAgICAgICAgICAg
ICAgICAgIitkIiAoaW5wdXQxKSBBU01fQ0FMTF9DT05TVFJBSU5UCj4gPj4+ICsgICAgICAgICAg
ICAgICAgICA6ICJyIiAocjgpLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICBbaGNhbGxfcGFn
ZV0gInAiIChmaXhfeF90b192aXJ0KEZJWF9YX0hZUEVSVl9IQ0FMTCkpCj4gPj4+ICsgICAgICAg
ICAgICAgICAgICA6KTsKPiA+Pgo+ID4+IFRoaXMgY29tZXMgdGhyb3VnaCBhcyBhIHNtaWxleSBp
biBteSBtYWlsIHZpZXdlciwgYmVjYXVzZSBvZiB0aGUKPiA+PiBtaXNzaW5nIGJsYW5rcyBpbW1l
ZGlhdGVseSBpbnNpZGUgdGhlIG91dGVybW9zdCBwYXJlbnRoZXNlcy4KPiA+IAo+ID4gRml4ZWQu
Cj4gCj4gQnkgZHJvcHBpbmcgdGhlIDosIEkgYXNzdW1lPyBNeSBzdWdnZXN0aW9uIG9mIGp1c3Qg
dGhlIG1pc3NpbmcgYmxhbmsKPiBtYXkgaGF2ZSBiZWVuIG1pc2xlYWRpbmcgaGVyZSAoYWxiZWl0
IHRoZSBibGFua3Mgc3RpbGwgbmVlZCBhZGRpbmcpLgoKTm8sIGJ5IGFkZGluZyBhIGJsYW5rLgoK
SSB3aWxsIGRyb3AgdGhhdCAiOiIgbG9jYWxseSBpbiBteSB0cmVlIGZvciBuZXh0IHJvdW5kIG9m
IHBvc3RpbmcuCgpXZWkuCgo+IAo+IEphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
