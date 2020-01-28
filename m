Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131FA14BD5A
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 16:58:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwTCv-0003Zm-6e; Tue, 28 Jan 2020 15:55:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=pdAI=3R=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1iwTCu-0003Zb-6p
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 15:55:16 +0000
X-Inumbo-ID: 93398314-41e6-11ea-b211-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93398314-41e6-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 15:55:15 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwTCs-0003Rr-LO; Tue, 28 Jan 2020 15:55:14 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1iwTCs-0005WX-9m; Tue, 28 Jan 2020 15:55:14 +0000
Date: Tue, 28 Jan 2020 15:55:10 +0000
From: Wei Liu <wl@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20200128155510.ruie6ck4i3hg5dub@debian>
References: <20200122202343.5703-1-liuwe@microsoft.com>
 <20200122202343.5703-7-liuwe@microsoft.com>
 <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c73aa226-df1a-552c-caea-f6a781dc63c6@suse.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v4 6/7] x86/hyperv: retrieve vp_index from
 Hyper-V
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

T24gVGh1LCBKYW4gMjMsIDIwMjAgYXQgMDQ6NDg6MzhQTSArMDEwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjIuMDEuMjAyMCAyMToyMywgV2VpIExpdSB3cm90ZToKPiA+IFRoaXMgd2lsbCBi
ZSB1c2VmdWwgd2hlbiBpbnZva2luZyBoeXBlcmNhbGwgdGhhdCB0YXJnZXRzIHNwZWNpZmljCj4g
PiB2Y3B1KHMpLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBXZWkgTGl1IDxsaXV3ZUBtaWNyb3Nv
ZnQuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPgo+IAo+
IEZvciBmb3JtYWwgcmVhc29ucwo+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+Cj4gCj4gSG93ZXZlciBJIHdvbmRlciB3aGV0aGVyIHRoZSBWaXJpZGlhbiBlbnRyeSBp
biBNQUlOVEFJTkVSUyBzaG91bGRuJ3QKPiBiZSBleHRlbmRlZCBieQo+IAo+IEY6CXhlbi9hcmNo
L3g4Ni9ndWVzdC9oeXBlcnYvCj4gCj4gKGFuZCBwb3NzaWJseSBoYXZlIGl0cyB0aXRsZSBhZGp1
c3RlZCkuIFRob3VnaHRzPwoKVGhpcyBpc24ndCBhYm91dCBlbXVsYXRpbmcgSHlwZXItViBpbnNp
ZGUgWGVuLCBzbyBJIGRvbid0IHRoaW5rIHRoYXQncwp0aGUgcmlnaHQgYXBwcm9hY2ggaGVyZS4K
ClRoYXQgc2FpZCwgaWYgUGF1bCB3YW50cyB0byB0YWtlIHRoaXMgdW5kZXIgaGlzIHB1cnZpZXcs
IGl0J3MgZmluZSBieSBtZQotLSB0aGF0IHdvdWxkIG1ha2UgbWUgZWFzaWVyIHRvIHVwc3RyZWFt
IG15IHBhdGNoLiA7LSkgIEkgYWxzbyB3b3VsZG4ndAptaW5kIGFkZGluZyBteXNlbGYgYXMgbWFp
bnRhaW5lciBmb3IgdGhpcyBwYXRoLgoKV2VpLgoKPiAKPiBKYW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
