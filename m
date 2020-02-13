Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF5E15BE19
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 12:59:10 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2D6l-0008V3-P1; Thu, 13 Feb 2020 11:56:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2D6k-0008Uy-Ln
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 11:56:38 +0000
X-Inumbo-ID: e377861e-4e57-11ea-b88b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e377861e-4e57-11ea-b88b-12813bfff9fa;
 Thu, 13 Feb 2020 11:56:37 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2D6i-0006V8-4Q; Thu, 13 Feb 2020 11:56:36 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2D6c-0005OI-Rv; Thu, 13 Feb 2020 11:56:36 +0000
Date: Thu, 13 Feb 2020 11:56:12 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200213115612.zqqc6tg33rvrn7lm@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-3-liuwe@microsoft.com>
 <20200212170047.GR4679@Air-de-Roger>
 <0fd1bb31e2054ddeb5e21793aa0c8750@EX13D32EUC003.ant.amazon.com>
 <20200213102916.pth227it5jozbp22@debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213102916.pth227it5jozbp22@debian>
User-Agent: NeoMutt/20180716
Subject: Re: [Xen-devel] [PATCH 2/4] x86/hypervisor: pass flags to
 hypervisor_flush_tlb
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
 Xen Development List <xen-devel@lists.xenproject.org>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMTA6Mjk6MTZBTSArMDAwMCwgV2VpIExpdSB3cm90ZToK
PiBPbiBUaHUsIEZlYiAxMywgMjAyMCBhdCAwODo0ODozOUFNICswMDAwLCBEdXJyYW50LCBQYXVs
IHdyb3RlOgo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gPiBGcm9tOiBSb2dl
ciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+ID4gU2VudDogMTIgRmVicnVh
cnkgMjAyMCAxODowMQo+ID4gPiBUbzogV2VpIExpdSA8d2xAeGVuLm9yZz4KPiA+ID4gQ2M6IFhl
biBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBEdXJy
YW50LCBQYXVsCj4gPiA+IDxwZHVycmFudEBhbWF6b24uY28udWs+OyBNaWNoYWVsIEtlbGxleSA8
bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUKPiA+ID4gPGxpdXdlQG1pY3Jvc29mdC5j
b20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+OyBBbmRyZXcgQ29vcGVyCj4gPiA+
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIDIv
NF0geDg2L2h5cGVydmlzb3I6IHBhc3MgZmxhZ3MgdG8KPiA+ID4gaHlwZXJ2aXNvcl9mbHVzaF90
bGIKPiA+ID4gCj4gPiA+IE9uIFdlZCwgRmViIDEyLCAyMDIwIGF0IDA0OjA5OjE2UE0gKzAwMDAs
IFdlaSBMaXUgd3JvdGU6Cj4gPiA+ID4gSHlwZXItVidzIEwwIGFzc2lzdGVkIGZsdXNoIGhhcyBm
aW5lLWdyYWluZWQgY29udHJvbCBvdmVyIHdoYXQgZ2V0cwo+ID4gPiA+IGZsdXNoZWQuIFdlIG5l
ZWQgYWxsIHRoZSBmbGFncyBhdmFpbGFibGUgdG8gbWFrZSB0aGUgYmVzdCBkZWNpc2lvbnMKPiA+
ID4gPiBwb3NzaWJsZS4KPiA+ID4gPgo+ID4gPiA+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGJlY2F1
c2UgWGVuJ3MgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjYXJlIGFib3V0Cj4gPiA+ID4gd2hhdCBp
cyBwYXNzZWQgdG8gaXQuCj4gPiA+IAo+ID4gPiBXaGlsZSBpdCdzIGNlcnRhaW5seSBmaW5lIHRv
IHBhc3MgYSBmbGFncyBmaWVsZCB3aXRoIG1vcmUgaW5mb3JtYXRpb24sCj4gPiA+IHRoZSBmbHVz
aCBmbGFncyBmb3IgWGVuIGNhbiBhbHNvIGNvbnRhaW4gRkxVU0hfQ0FDSEUsIEZMVVNIX1ZDUFVf
U1RBVEUKPiA+ID4gb3IgRkxVU0hfUk9PVF9QR1RCTCwgY2FuIHlvdSBhZGQgYW4gYXNzZXJ0IHRo
YXQgdGhvc2UgbmV2ZXIgZ2V0IHBhc3NlZAo+ID4gPiB0byB0aGUgZmx1c2ggaG9vaz8KPiA+ID4g
Cj4gPiA+IElNTyB3ZSBzaG91bGQgZGVmaW5lIGEgbWFzayB3aXRoIEZMVVNIX1RMQiwgRkxVU0hf
VExCX0dMT0JBTCwKPiA+ID4gRkxVU0hfVkFfVkFMSUQgYW5kIEZMVVNIX09SREVSX01BU0sgYW5k
IGFzc2VydCB0aGF0IHRob3NlIGFyZSB0aGUgb25seQo+ID4gPiB2YWxpZCBmbGFncyB0byBiZSB1
c2VkIGZvciB0aGUgaHlwZXJ2aXNvciBhc3Npc3RlZCBmbHVzaCBob29rLgo+ID4gPgo+ID4gCj4g
PiBBZ3JlZWQgdGhhdCB0aGlzIHNob3VsZCBiZSBhYnN0cmFjdGVkOyB3ZSBjZXJ0YWlubHkgZG9u
J3Qgd2FudCB0byBoYXZlCj4gPiB2YXJpb3VzIGJpdHMgb2YgWGVuIG5lZWRpbmcgdG8ga25vdyB3
aGF0IGh5cGVydmlzb3IgaXQgaXMgcnVubmluZyBvbgo+ID4gdG9wIG9mLgo+IAo+IE9LLiBJIGNh
biBpbnRyb2R1Y2UgYSBGTFVTSF9UTEJfRkxBR1MgZm9yIGFsbCB0aGluZ3MgcGVydGFpbmluZyB0
byBUTEIKPiAtLSB0aGUgZm91ciB0aGluZ3MgbWVudGlvbmVkIGluIFJvZ2VyJ3MgcmVwbHkuCgpJ
ZiBJJ20gbm90IG1pc3Rha2VuIGZsdXNoX2FyZWFfbWFzayBpbiBSb2dlcidzIHBhdGNoIGFscmVh
ZHkgZmlsdGVycyBvdXQKYWxsIHRoZSB1bndhbnRlZCBmbGFncywgc28gbXkgY29kZSBpcyBjb3Jy
ZWN0IGFzLWlzLgoKSSBjYW4gYWRkCgojZGVmaW5lIEZMVVNIX1RMQl9GTEFHU19NQVNLIChGTFVT
SF9UTEIgfCBGTFVTSF9UTEJfR0xPQkFMIHwgRkxVU0hfVkFfVkFMSUQgfCBcCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIEZMVVNIX09SREVSX01BU0spCgphbmQgdXNlIGl0IGluIGZsdXNo
X2FyZWFfbWFzayB0byByZXBsYWNlIHRoZSBsb25nZXIgc3RyaW5nIHRoZXJlLgoKV2VpLgoKCj4g
Cj4gV2VpLgo+IAo+ID4gCj4gPiAgIFBhdWwKPiA+IAo+ID4gIAo+ID4gPiBUaGFua3MsIFJvZ2Vy
LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
