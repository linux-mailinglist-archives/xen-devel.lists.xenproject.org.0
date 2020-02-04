Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B15BD151628
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 07:52:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iys1g-0003M3-E6; Tue, 04 Feb 2020 06:49:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QKSH=3Y=intel.com=liming.gao@srs-us1.protection.inumbo.net>)
 id 1iys1f-0003LE-3A
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 06:49:35 +0000
X-Inumbo-ID: 7f96c874-471a-11ea-8eda-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f96c874-471a-11ea-8eda-12813bfff9fa;
 Tue, 04 Feb 2020 06:49:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 22:49:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="378320960"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2020 22:49:31 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 22:49:31 -0800
Received: from shsmsx606.ccr.corp.intel.com (10.109.6.216) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 4 Feb 2020 14:49:29 +0800
Received: from shsmsx606.ccr.corp.intel.com ([10.109.6.216]) by
 SHSMSX606.ccr.corp.intel.com ([10.109.6.216]) with mapi id 15.01.1713.004;
 Tue, 4 Feb 2020 14:49:29 +0800
From: "Gao, Liming" <liming.gao@intel.com>
To: "devel@edk2.groups.io" <devel@edk2.groups.io>, "anthony.perard@citrix.com"
 <anthony.perard@citrix.com>
Thread-Topic: [edk2-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock to by Dynamic
Thread-Index: AQHV1r69ewqbWYIeh0aB29LAD6y7HagE2qLwgARAgoCAAB9IAIABZkCg
Date: Tue, 4 Feb 2020 06:49:29 +0000
Message-ID: <4792efc4d3634fd98ff85e0501d7a447@intel.com>
References: <20200129121235.1814563-1-anthony.perard@citrix.com>
 <20200129121235.1814563-3-anthony.perard@citrix.com>
 <b7590b41-e7f6-f4df-959c-2ee188db1e66@redhat.com>
 <c283b839b42e4262bfde10474bf6a794@intel.com>
 <20200203153407.GH2306@perard.uk.xensource.com>
 <20200203172604.GI2306@perard.uk.xensource.com>
In-Reply-To: <20200203172604.GI2306@perard.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.239.127.36]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [edk2-devel] [PATCH 2/5] MdePkg: Allow PcdFSBClock
 to by Dynamic
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
Cc: "Feng, Bob C" <bob.c.feng@intel.com>, Julien Grall <julien@xen.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, "Justen, 
 Jordan L" <jordan.l.justen@intel.com>, "Kinney,
 Michael D" <michael.d.kinney@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Laszlo Ersek <lersek@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhhbmtzIGZvciB5b3VyIGRhdGEuIFNlZW1seSwgdGhvc2UgZGF0YSBpcyBhY2NlcHRhYmxlIG9u
IE92bWZYZW4uIEZvciB0aGlzIHBhdGNoLCBSZXZpZXdlZC1ieTogTGltaW5nIEdhbyA8bGltaW5n
Lmdhb0BpbnRlbC5jb20+CgpUaGFua3MKTGltaW5nCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0t
LS0KPiBGcm9tOiBkZXZlbEBlZGsyLmdyb3Vwcy5pbyA8ZGV2ZWxAZWRrMi5ncm91cHMuaW8+IE9u
IEJlaGFsZiBPZiBBbnRob255IFBFUkFSRAo+IFNlbnQ6IFR1ZXNkYXksIEZlYnJ1YXJ5IDQsIDIw
MjAgMToyNiBBTQo+IFRvOiBHYW8sIExpbWluZyA8bGltaW5nLmdhb0BpbnRlbC5jb20+Cj4gQ2M6
IExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhhdC5jb20+OyBkZXZlbEBlZGsyLmdyb3Vwcy5pbzsg
S2lubmV5LCBNaWNoYWVsIEQgPG1pY2hhZWwuZC5raW5uZXlAaW50ZWwuY29tPjsgQXJkIEJpZXNo
ZXV2ZWwKPiA8YXJkLmJpZXNoZXV2ZWxAbGluYXJvLm9yZz47IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgSnVzdGVuLCBKb3JkYW4gTCA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT47
IEp1bGllbiBHcmFsbAo+IDxqdWxpZW5AeGVuLm9yZz47IEZlbmcsIEJvYiBDIDxib2IuYy5mZW5n
QGludGVsLmNvbT4KPiBTdWJqZWN0OiBSZTogW2VkazItZGV2ZWxdIFtQQVRDSCAyLzVdIE1kZVBr
ZzogQWxsb3cgUGNkRlNCQ2xvY2sgdG8gYnkgRHluYW1pYwo+IAo+IE9uIE1vbiwgRmViIDAzLCAy
MDIwIGF0IDAzOjM0OjA3UE0gKzAwMDAsIEFudGhvbnkgUEVSQVJEIHdyb3RlOgo+ID4gT24gTW9u
LCBGZWIgMDMsIDIwMjAgYXQgMDE6MzQ6NTVBTSArMDAwMCwgR2FvLCBMaW1pbmcgd3JvdGU6Cj4g
PiA+IEFudGhvbnk6Cj4gPiA+ICAgVGhpcyBjaGFuZ2UgaXMgT0sgdG8gbWUuIEJ1dCBpZiB0aGlz
IFBDRCBpcyBjb25maWd1cmVkIGFzIER5bmFtaWMsIGl0cyB2YWx1ZSB3aWxsIGJlIGdvdCBmcm9t
IFBDRCBzZXJ2aWNlLiBUaGlzIG9wZXJhdGlvbiB3aWxsIHRha2UKPiBzb21lIHRpbWUgYW5kIGNh
dXNlIHRoZSBpbmFjY3VyYXRlIHRpbWUgZGVsYXkuIEhhdmUgeW91IG1lYXN1cmVkIGl0cyBpbXBh
Y3Q/Cj4gPgo+ID4gTm8sIEkgaGF2ZW4ndC4gQnV0IEkgZG9uJ3QgdGhpbmsgaXQgbWF0dGVyIGlu
IGEgWGVuIGd1ZXN0LCB0aGUgQVBJQyB0aW1lciBpcwo+ID4gZW11bGF0ZWQgYW55d2F5LCBzbyBy
ZWFkaW5nIGZyb20gYSByZWdpc3RlciBvZiB0aGUgQVBJQyBpcyBnb2luZyB0byBiZQo+ID4gc2xv
d2VyIHRoYW4gZ2V0dGluZyB0aGUgdmFsdWUgZnJvbSB0aGUgUENEIHNlcnZpY2VzLCBJIHRoaW5r
Lgo+ID4gKEhvcGVmdWxseSwgSSdtIG5vdCB0b28gd3JvbmcuKQo+ID4KPiA+IEJ1dCBJJ2xsIGdp
dmUgaXQgYXQgbWVhc3VyaW5nIHRoZSBkaWZmZXJlbmNlLCBpdCB3b3VsZCBiZSBpbnRlcmVzdGlu
ZyB0bwo+ID4ga25vdy4KPiAKPiBOb3cgdGhhdCBJJ3ZlIGdpdmVuIGEgdHJ5LCBoYXZpbmcgdGhl
IHZhbHVlIGFzIER5bmFtaWMgZG9lc24ndCBjaGFuZ2UKPiBhbnl0aGluZyBpbiBhIFhlbiBndWVz
dC4KPiAKPiBPbiBteSB0ZXN0IG1hY2hpbmUsIHNpbXBseSBydW5uaW5nIEdldFBlcmZvcm1hbmNl
Q291bnRlciAoKTsgdGFrZXMKPiBiZXR3ZWVuIDEwMDAwIG5zIGFuZCAyMDAwMCBucy4gUmVhZGlu
ZyB0aGUgZHluYW1pYyB2YWx1ZSBmcm9tIFBDRCBvbiB0aGUKPiBvdGhlciBoYW5kIHRha2VzIGFi
b3V0IDM1MG5zLiAoMTBucyBpZiBpdCdzIHN0YXRpYy4pCj4gCj4gV2hlbiBJIHJ1biBOYW5vU2Vj
b25kRGVsYXkoKSB3aXRoIGRpZmZlcmVudCB2YWx1ZXMsIEkgaGF2ZToKPiAgIC0gd2l0aCBzdGF0
aWMgcGNkOgo+ICAgICAgICAgICAgNjM4OTQgbnMgdG8gZGVsYXkgYnkgMSBucwo+ICAgICAgICAg
ICAgNjY2MTEgbnMgdG8gZGVsYXkgYnkgMTAgbnMKPiAgICAgICAgICAgIDQzOTI3IG5zIHRvIGRl
bGF5IGJ5IDEwMCBucwo+ICAgICAgICAgICAgNzEzNjcgbnMgdG8gZGVsYXkgYnkgMTAwMCBucwo+
ICAgICAgICAgICAgNTU4ODEgbnMgdG8gZGVsYXkgYnkgMTAwMDAgbnMKPiAgICAgICAgICAgMTQ3
NzE2IG5zIHRvIGRlbGF5IGJ5IDEwMDAwMCBucwo+ICAgICAgICAgIDEwNDgzMzUgbnMgdG8gZGVs
YXkgYnkgMTAwMDAwMCBucwo+ICAgICAgICAgMTAwNDExNzkgbnMgdG8gZGVsYXkgYnkgMTAwMDAw
MDAgbnMKPiAgIC0gd2l0aCBhIGR5bmFtaWMgcGNkOgo+ICAgICAgICAgICAgNDA5NDkgbnMgdG8g
ZGVsYXkgYnkgMSBucwo+ICAgICAgICAgICAgODQ4MzIgbnMgdG8gZGVsYXkgYnkgMTAgbnMKPiAg
ICAgICAgICAgIDgyNzQ1IG5zIHRvIGRlbGF5IGJ5IDEwMCBucwo+ICAgICAgICAgICAgNTk4NDgg
bnMgdG8gZGVsYXkgYnkgMTAwMCBucwo+ICAgICAgICAgICAgNTI2NDcgbnMgdG8gZGVsYXkgYnkg
MTAwMDAgbnMKPiAgICAgICAgICAgMTM3MDUxIG5zIHRvIGRlbGF5IGJ5IDEwMDAwMCBucwo+ICAg
ICAgICAgIDEwNDI0OTIgbnMgdG8gZGVsYXkgYnkgMTAwMDAwMCBucwo+ICAgICAgICAgMTAwMzYz
MDYgbnMgdG8gZGVsYXkgYnkgMTAwMDAwMDAgbnMKPiAKPiBTbywgdGhlIGtpbmQgb2YgUENEIHVz
ZWQgZm9yIFBjZEZTQkNsb2NrIG9uIFhlbiAod2l0aCBPdm1mWGVuKSBkb2Vzbid0Cj4gcmVhbGx5
IG1hdHRlci4KPiAKPiBBbnl3YXksIHRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLgo+IAo+IC0tCj4g
QW50aG9ueSBQRVJBUkQKPiAKPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQo+IEdyb3Vwcy5pbyBM
aW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4KPiAKPiBW
aWV3L1JlcGx5IE9ubGluZSAoIzUzNjc1KTogaHR0cHM6Ly9lZGsyLmdyb3Vwcy5pby9nL2RldmVs
L21lc3NhZ2UvNTM2NzUKPiBNdXRlIFRoaXMgVG9waWM6IGh0dHBzOi8vZ3JvdXBzLmlvL210Lzcw
MjM5OTgxLzE3NTkzODQKPiBHcm91cCBPd25lcjogZGV2ZWwrb3duZXJAZWRrMi5ncm91cHMuaW8K
PiBVbnN1YnNjcmliZTogaHR0cHM6Ly9lZGsyLmdyb3Vwcy5pby9nL2RldmVsL3Vuc3ViICBbbGlt
aW5nLmdhb0BpbnRlbC5jb21dCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
