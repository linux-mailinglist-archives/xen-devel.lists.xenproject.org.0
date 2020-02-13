Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857E15BCDC
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2020 11:32:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j2BkK-0000FH-Ve; Thu, 13 Feb 2020 10:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=V1im=4B=xen.org=wl@srs-us1.protection.inumbo.net>)
 id 1j2BkJ-0000F5-Db
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2020 10:29:23 +0000
X-Inumbo-ID: b3178eda-4e4b-11ea-b87b-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b3178eda-4e4b-11ea-b87b-12813bfff9fa;
 Thu, 13 Feb 2020 10:29:22 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2BkG-0004oQ-5u; Thu, 13 Feb 2020 10:29:20 +0000
Received: from 41.142.6.51.dyn.plus.net ([51.6.142.41] helo=debian)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <wl@xen.org>)
 id 1j2BkF-0008Pu-S2; Thu, 13 Feb 2020 10:29:20 +0000
Date: Thu, 13 Feb 2020 10:29:16 +0000
From: Wei Liu <wl@xen.org>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200213102916.pth227it5jozbp22@debian>
References: <20200212160918.18470-1-liuwe@microsoft.com>
 <20200212160918.18470-3-liuwe@microsoft.com>
 <20200212170047.GR4679@Air-de-Roger>
 <0fd1bb31e2054ddeb5e21793aa0c8750@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fd1bb31e2054ddeb5e21793aa0c8750@EX13D32EUC003.ant.amazon.com>
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

T24gVGh1LCBGZWIgMTMsIDIwMjAgYXQgMDg6NDg6MzlBTSArMDAwMCwgRHVycmFudCwgUGF1bCB3
cm90ZToKPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IFNlbnQ6IDEyIEZlYnJ1YXJ5IDIwMjAg
MTg6MDEKPiA+IFRvOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4gQ2M6IFhlbiBEZXZlbG9wbWVu
dCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc+OyBEdXJyYW50LCBQYXVsCj4g
PiA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jv
c29mdC5jb20+OyBXZWkgTGl1Cj4gPiA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT47IEFuZHJldyBDb29wZXIKPiA+IDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgo+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAyLzRdIHg4Ni9oeXBlcnZpc29yOiBw
YXNzIGZsYWdzIHRvCj4gPiBoeXBlcnZpc29yX2ZsdXNoX3RsYgo+ID4gCj4gPiBPbiBXZWQsIEZl
YiAxMiwgMjAyMCBhdCAwNDowOToxNlBNICswMDAwLCBXZWkgTGl1IHdyb3RlOgo+ID4gPiBIeXBl
ci1WJ3MgTDAgYXNzaXN0ZWQgZmx1c2ggaGFzIGZpbmUtZ3JhaW5lZCBjb250cm9sIG92ZXIgd2hh
dCBnZXRzCj4gPiA+IGZsdXNoZWQuIFdlIG5lZWQgYWxsIHRoZSBmbGFncyBhdmFpbGFibGUgdG8g
bWFrZSB0aGUgYmVzdCBkZWNpc2lvbnMKPiA+ID4gcG9zc2libGUuCj4gPiA+Cj4gPiA+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlIGJlY2F1c2UgWGVuJ3MgaW1wbGVtZW50YXRpb24gZG9lc24ndCBjYXJl
IGFib3V0Cj4gPiA+IHdoYXQgaXMgcGFzc2VkIHRvIGl0Lgo+ID4gCj4gPiBXaGlsZSBpdCdzIGNl
cnRhaW5seSBmaW5lIHRvIHBhc3MgYSBmbGFncyBmaWVsZCB3aXRoIG1vcmUgaW5mb3JtYXRpb24s
Cj4gPiB0aGUgZmx1c2ggZmxhZ3MgZm9yIFhlbiBjYW4gYWxzbyBjb250YWluIEZMVVNIX0NBQ0hF
LCBGTFVTSF9WQ1BVX1NUQVRFCj4gPiBvciBGTFVTSF9ST09UX1BHVEJMLCBjYW4geW91IGFkZCBh
biBhc3NlcnQgdGhhdCB0aG9zZSBuZXZlciBnZXQgcGFzc2VkCj4gPiB0byB0aGUgZmx1c2ggaG9v
az8KPiA+IAo+ID4gSU1PIHdlIHNob3VsZCBkZWZpbmUgYSBtYXNrIHdpdGggRkxVU0hfVExCLCBG
TFVTSF9UTEJfR0xPQkFMLAo+ID4gRkxVU0hfVkFfVkFMSUQgYW5kIEZMVVNIX09SREVSX01BU0sg
YW5kIGFzc2VydCB0aGF0IHRob3NlIGFyZSB0aGUgb25seQo+ID4gdmFsaWQgZmxhZ3MgdG8gYmUg
dXNlZCBmb3IgdGhlIGh5cGVydmlzb3IgYXNzaXN0ZWQgZmx1c2ggaG9vay4KPiA+Cj4gCj4gQWdy
ZWVkIHRoYXQgdGhpcyBzaG91bGQgYmUgYWJzdHJhY3RlZDsgd2UgY2VydGFpbmx5IGRvbid0IHdh
bnQgdG8gaGF2ZQo+IHZhcmlvdXMgYml0cyBvZiBYZW4gbmVlZGluZyB0byBrbm93IHdoYXQgaHlw
ZXJ2aXNvciBpdCBpcyBydW5uaW5nIG9uCj4gdG9wIG9mLgoKT0suIEkgY2FuIGludHJvZHVjZSBh
IEZMVVNIX1RMQl9GTEFHUyBmb3IgYWxsIHRoaW5ncyBwZXJ0YWluaW5nIHRvIFRMQgotLSB0aGUg
Zm91ciB0aGluZ3MgbWVudGlvbmVkIGluIFJvZ2VyJ3MgcmVwbHkuCgpXZWkuCgo+IAo+ICAgUGF1
bAo+IAo+ICAKPiA+IFRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
