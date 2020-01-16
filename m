Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE2013DE2A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 15:57:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is6Y0-00014d-HO; Thu, 16 Jan 2020 14:55:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Dapg=3F=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1is6Xz-00014W-E8
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 14:54:59 +0000
X-Inumbo-ID: 27fcbabe-3870-11ea-8751-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27fcbabe-3870-11ea-8751-12813bfff9fa;
 Thu, 16 Jan 2020 14:54:54 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1is6Xu-00021V-0o; Thu, 16 Jan 2020 14:54:54 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1is6Xt-0007sG-NR; Thu, 16 Jan 2020 14:54:53 +0000
Date: Thu, 16 Jan 2020 14:54:49 +0000
From: Wei Liu <wl@xen.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20200116145449.qt2hjs4drjyxrgkt@debian>
References: <20200105164801.26278-1-liuwe@microsoft.com>
 <20200105164801.26278-3-liuwe@microsoft.com>
 <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0020c144-6233-58f7-2f71-c5af03b6b2f8@citrix.com>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH v3 2/5] x86/hyperv: provide Hyper-V
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
 Paul Durrant <paul@xen.org>, Michael Kelley <mikelley@microsoft.com>,
 Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gU3VuLCBKYW4gMDUsIDIwMjAgYXQgMDc6MDg6MjhQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiAKPiA+ICtzdGF0aWMgaW5saW5lIHVpbnQ2NF90IGh2X2RvX2h5cGVyY2FsbCh1aW50
NjRfdCBjb250cm9sLCBwYWRkcl90IGlucHV0LCBwYWRkcl90IG91dHB1dCkKPiA+ICt7Cj4gPiAr
ICAgIHVpbnQ2NF90IHN0YXR1czsKPiA+ICsKPiA+ICsgICAgYXNtIHZvbGF0aWxlICgibW92ICVb
b3V0cHV0XSwgJSVyOFxuIgo+ID4gKyAgICAgICAgICAgICAgICAgICJjYWxsIGh2X2h5cGVyY2Fs
bF9wYWdlIgo+ID4gKyAgICAgICAgICAgICAgICAgIDogIj1hIiAoc3RhdHVzKSwgIitjIiAoY29u
dHJvbCksCj4gPiArICAgICAgICAgICAgICAgICAgICAiK2QiIChpbnB1dCkgQVNNX0NBTExfQ09O
U1RSQUlOVAo+ID4gKyAgICAgICAgICAgICAgICAgIDogW291dHB1dF0gInJtIiAob3V0cHV0KQo+
ID4gKyAgICAgICAgICAgICAgICAgIDogImNjIiwgIm1lbW9yeSIsICJyOCIsICJyOSIsICJyMTAi
LCAicjExIik7Cj4gCj4gSSB0aGluayB5b3Ugd2FudDoKPiAKPiByZWdpc3RlciB1bnNpZ25lZCBs
b25nIHI4IGFzbSgicjgiKSA9IG91dHB1dDsKPiAKPiBhbmQgIityIiAocjgpIGFzIGFuIG91dHB1
dCBjb25zdHJhaW50Lgo+IAo+IEluIHBhcnRpY3VsYXIsIHRoYXQgZG9lc24ndCBmb3JjZSB0aGUg
Y29tcGlsZXIgdG8gcHV0IG91dHB1dCBpbnRvIGEKPiByZWdpc3RlciBvdGhlciB0aGFuIHI4IChv
ciB3b3JzZSwgc3BpbGwgaXQgdG8gdGhlIHN0YWNrKSB0byBoYXZlIHRoZQo+IG9wYXF1ZSBibG9i
IG9mIGFzbSBtb3ZlIGl0IGJhY2sgaW50byByOC7CoCBXaGF0IGl0IHdpbGwgZG8gaW4gcHJhY3Rp
Y2UgaXMKPiBjYXVzZSB0aGUgY29tcGlsZXIgdG8gY29uc3RydWN0IG91dHB1dCBkaXJlY3RseSBp
biByOC4KPiAKPiBBcyBmb3IgdGhlIG90aGVyIGNsb2JiZXJzLCBJIGNhbid0IGZpbmQgYW55dGhp
bmcgYXQgYWxsIGluIHRoZSBzcGVjCj4gd2hpY2ggZXZlbiBtZW50aW9ucyB0aG9zZSByZWdpc3Rl
cnMuwqAgVGhlcmUgd2lsbCBiZSBhIGRlY2VudCBpbXByb3ZlbWVudAo+IHRvIGNvZGUgZ2VuZXJh
dGlvbiBpZiB3ZSBkb24ndCBmb3JjZSB0aGVtIHRvIGJlIHNwaWxsZWQgYXJvdW5kIGEgaHlwZXJj
YWxsLgoKVGhpcyBpcyBhY3R1YWxseSBmcm9tIFdpbmRvd3MgMjAxMiBSMidzIFRMRlMuCgpDdXJy
ZW50IHZlcnNpb24gb2YgSHlwZXItViBkb2Vzbid0IGNsb2JiZXIgdGhvc2UgcmVnaXN0ZXJzIGFu
eW1vcmUuIEkKdGhpbmsganVzdCBwdXR0aW5nICJtZW1vcnkiIHRoZXJlIHNob3VsZCBiZSBmaW5l
LgoKV2VpLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
