Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8623B183F4E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 04:08:23 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCadY-00064d-Hq; Fri, 13 Mar 2020 03:05:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gA4=46=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jCadX-00064X-Jk
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 03:05:23 +0000
X-Inumbo-ID: 79e6b8fa-64d7-11ea-b272-12813bfff9fa
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 79e6b8fa-64d7-11ea-b272-12813bfff9fa;
 Fri, 13 Mar 2020 03:05:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 20:05:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="442280061"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 12 Mar 2020 20:05:20 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 20:05:20 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 20:05:19 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.50]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 11:05:17 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v3] IOMMU: make DMA containment of quarantined devices
 optional
Thread-Index: AQHV9gMvA8DkILGx5UOf5iWNvNKXRqhBS9AQ///QHgCABLZlcA==
Date: Fri, 13 Mar 2020 03:05:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDA43@SHSMSX104.ccr.corp.intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5DEC@SHSMSX104.ccr.corp.intel.com>
 <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
In-Reply-To: <12464780-0ce3-0331-9f78-b026025607fb@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMWJhZjJmODctZTU5Ny00Y2I1LTlhYWUtMjJkOWE3MWRjNTcxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiUndlSDVyNjVRcE9rWUtsVlN3c0F4akR3WGl3S2VFZFR4RkJCcVFITFlkSnRGNWQzU1JyWHA2bTlKMWt3YkNxKyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+IFNlbnQ6IFR1ZXNkYXks
IE1hcmNoIDEwLCAyMDIwIDY6MzEgUE0NCj4gDQo+IE9uIDEwLjAzLjIwMjAgMDY6MzAsIFRpYW4s
IEtldmluIHdyb3RlOg0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+ID4+IFNlbnQ6IE1vbmRheSwgTWFyY2ggOSwgMjAyMCA3OjA5IFBNDQo+ID4+DQo+ID4+IENv
bnRhaW5pbmcgc3RpbGwgaW4gZmxpZ2h0IERNQSB3YXMgaW50cm9kdWNlZCB0byB3b3JrIGFyb3Vu
ZCBjZXJ0YWluDQo+ID4+IGRldmljZXMgLyBzeXN0ZW1zIGhhbmdpbmcgaGFyZCB1cG9uIGhpdHRp
bmcgYSAibm90LXByZXNlbnQiIElPTU1VIGZhdWx0Lg0KPiA+PiBQYXNzaW5nIHRocm91Z2ggKHN1
Y2gpIGRldmljZXMgKG9uIHN1Y2ggc3lzdGVtcykgaXMgaW5oZXJlbnRseSBpbnNlY3VyZQ0KPiA+
PiAoYXMgZ3Vlc3RzIGNvdWxkIGVhc2lseSBhcnJhbmdlIGZvciBJT01NVSBmYXVsdHMgb2YgYW55
IGtpbmQgdG8gb2NjdXIpLg0KPiA+PiBEZWZhdWx0aW5nIHRvIGEgbW9kZSB3aGVyZSBhZG1pbnMg
bWF5IG5vdCBldmVuIGJlY29tZSBhd2FyZSBvZg0KPiBpc3N1ZXMNCj4gPj4gd2l0aCBkZXZpY2Vz
IGNhbiBiZSBjb25zaWRlcmVkIHVuZGVzaXJhYmxlLiBUaGVyZWZvcmUgY29udmVydCB0aGlzIG1v
ZGUNCj4gPj4gb2Ygb3BlcmF0aW9uIHRvIGFuIG9wdGlvbmFsIG9uZSwgbm90IG9uZSBlbmFibGVk
IGJ5IGRlZmF1bHQuDQo+ID4NCj4gPiBIZXJlIGlzIGFub3RoZXIgdGhvdWdodC4gVGhlIHdob2xl
IHBvaW50IG9mIHF1YXJhbnRpbmUgaXMgdG8gY29udGFpbg0KPiA+IHRoZSBkZXZpY2UgYWZ0ZXIg
aXQgaXMgZGVhc3NpZ25lZCBmcm9tIHVudHJ1c3RlZCBndWVzdC4NCj4gDQo+IEknZCBxdWVzdGlv
biB0aGUgInVudHJ1c3RlZCIgaGVyZS4gQXNzaWduaW5nIGRldmljZXMgdG8gdW50cnVzdGVkDQo+
IGd1ZXN0cyBpcyBwcm9ibGVtYXRpYyBhbnl3YXksIHVubGVzcyB5b3UncmUgdGhlIGRldmljZSBt
YW51ZmFjdHVyZXINCj4gYW5kIGRldmljZSBmaXJtd2FyZSB3cml0ZXIsIGFuZCBoZW5jZSB5b3Ug
Y2FuIGd1YXJhbnRlZSB0aGUgZGV2aWNlDQo+IHRvIG5vdCBvZmZlciBhbnkgYmFja2Rvb3JzIG9y
IGFsaWtlLiBUaGVyZWZvcmUgSSB2aWV3IHF1YXJhbnRpbmluZw0KDQpBcmVuJ3QgYWxsIGd1ZXN0
cyB1bnRydXN0ZWQgZnJvbSBoeXBlcnZpc29yIHAuby52LCB3aGljaCBpcyB0aGUgcmVhc29uDQp3
aHkgSU9NTVUgd2FzIGludHJvZHVjZWQgaW4gdGhlIGZpcnN0IHBsYWNlPyAndW50cnVzdCcgaW1v
IGFwcGxpZXMNCnRvIGVpdGhlciBtYWxpY2lvdXMgZ3Vlc3QgY29kZSBvciBpbmFkdmVydGVudCBn
dWVzdCBiZWhhdmlvciB0aGF0IHlvdSANCm1lbnRpb25lZCBiZWxvdywgd2hpY2ggbWF5IGJvdGgg
cHV0IHRoZSBkZXZpY2UgaW4gYSBzdGF0ZSB0aGF0IHRoZQ0KaHlwZXJ2aXNvciB3YW50cyB0byBx
dWFyYW50aW5lIGJlZm9yZSBtb3ZpbmcgdGhlIGRldmljZSB0byBhbm90aGVyDQpvd25lci4gT24g
dGhlIG90aGVyIGhhbmQsIG9uZSBtdXN0IGhhdmUgY2VydGFpbiBkZWdyZWUgb2YgdHJ1c3Qgb24g
DQp0aGUgZGV2aWNlIGl0c2VsZiwgdGhhdCB0aGUgaGFyZHdhcmUgd29uJ3QgZG8gYmFkIHRoaW5n
IHRoYXQgaXMgb3V0c2lkZQ0Kb2YgdGhlIGd1ZXN0IGRyaXZlciBjb250cm9sLCBlLmcuIGZvciBT
Ui1JT1YgY2FwYWJsZSBkZXZpY2UgdGhlIHRydXN0IA0KaXMgYWJvdXQgdGhlIGRldmljZSBlbmZv
cmNpbmcgY29tcGxldGVkIGlzb2xhdGlvbiBiZXR3ZWVuIFZGcy4uLg0KDQo+IG1vcmUgYXMgYSBw
cm90ZWN0aW9uIG9mIHRoZSBob3N0IGFnYWluc3QgYmFkIGRldmljZSBiZWhhdmlvciwgYW5kDQo+
IGxlc3MgYWdhaW5zdCBtYWxpY2lvdXMgZ3Vlc3QgYmVoYXZpb3IgKHdoaWxlIHRoZSBkcml2ZXIg
aW4gdGhlDQo+IGd1ZXN0IHN1cmVseSBoYXMgc29tZSBpbmZsdWVuY2UsIGNvbnNpZGVyIHRoZSBn
dWVzdCBnZXR0aW5nIGNyYXNoZWQNCj4gYW5kIGV2ZW4gYSB3ZWxsLWJlaGF2ZWQgZHJpdmVyIGhl
bmNlIG5vdCBnZXR0aW5nIGFueSBjaGFuY2UgdG8NCj4gc2lsZW5jZSB0aGUgZGV2aWNlKS4NCg0K
SSBtYXkgb3Zlcmxvb2sgdGhlIGhpc3Rvcnkgb2YgcXVhcmFudGluZSBmZWF0dXJlLiBCYXNlZCBv
biBteSBzdHVkeQ0Kb2YgcXVhcmFudGluZSByZWxhdGVkIGNoYW5nZXMsIGxvb2tzIGluaXRpYWxs
eSBQYXVsIHBvaW50ZWQgb3V0IHN1Y2ggDQpwcm9ibGVtIHRoYXQgYSBkZXZpY2UgbWF5IGhhdmUg
aW4tZmx5IERNQXMgdG8gdG91Y2ggZG9tMCBtZW1vcnkNCmFmdGVyIGl0IGlzIGRlYXNzaWduZWQu
IFRoZW4gaGUgaW50cm9kdWNlZCB0aGUgcXVhcmFudGluZSBjb25jZXB0IGJ5DQpwdXR0aW5nIGEg
cXVhcmFudGluZWQgZGV2aWNlIGludG8gZG9tX2lvIHcvbyBhbnkgdmFsaWQgbWFwcGluZywgDQp3
aXRoIGEgd2hpdGVsaXN0IGFwcHJvYWNoLiBZb3UgbGF0ZXIgZXh0ZW5kZWQgYXMgYSBkZWZhdWx0
IGJlaGF2aW9yDQpmb3IgYWxsIFBDSSBkZXZpY2VzLiBOb3cgUGF1bCBmb3VuZCBzb21lIGRldmlj
ZSB3aGljaCBjYW5ub3QgdG9sZXJhdGUNCnJlYWQtZmF1bHQgYW5kIHRoZW4gY2FtZSB1cCB0aGlz
IHNjcmF0Y2gtcGFnZSBpZGVhLg0KDQpOb3cgSSB3b25kZXIgd2h5IHdlIGFyZSBkb2luZyBzdWNo
IGV4cGxpY2l0IHF1YXJhbnRpbmUgaW4gdGhlIGZpcnN0DQpwbGFjZS4gU2hvdWxkbid0IHdlIGFs
d2F5cyBzZWVrIHJlc2V0dGluZyB0aGUgZGV2aWNlIHdoZW4gaXQgaXMgZGVhc3NpZ25lZA0KZnJv
bSBhIGd1ZXN0PyAncmVzZXQnIHNob3VsZCBjYW5jZWwvcXVpZXNjZW50IGFsbCBpbi1mbHkgRE1B
cyBmb3IgbW9zdA0KZGV2aWNlcyBpZiB0aGV5IGltcGxlbWVudCAncmVzZXQnIGNvcnJlY3RseS4g
SWYgZG9pbmcgdGhhdCB3YXksIHdlIGRvbid0DQpuZWVkIGEgcXVhcmFudGluZSBvcHRpb24gYXQg
YWxsLCBhbmQgdGhlbiB0aGUgYm9ndXMgZGV2aWNlIGluIFBhdWwncw0KbGF0ZXN0IGZpbmRpbmcg
Y291bGQgYmUgaGFuZGxlZCBieSBhIHN0YW5kYWxvbmUgb3B0aW9uIHcvbyBzdHJ1Z2dsaW5nDQp3
aGV0aGVyICdmdWxsJyBpcyBhIHJpZ2h0IG5hbWUgdnMuICdiYXNpYycuIG9yIHdlIG1heSBpbnRy
b2R1Y2UgYSByZXNldA0KZmxhZyB3aGVuIGFzc2lnbmluZyBzdWNoIGRldmljZSB0byBpbmRpY2F0
ZSBzdWNoIHNwZWNpYWwgcmVxdWlyZW1lbnQsDQpzbyBhIHNjcmF0Y2ggcGFnZS9kb21faW8gY2Fu
IGJlIGxpbmtlZCBzcGVjaWZpY2FsbHkgZm9yIHN1Y2ggZGV2aWNlIA0KcG9zdCByZXNldCwgYXNz
dW1pbmcgaXQgaXMgbm90IGEgcGxhdGZvcm0tbGV2ZWwgYnVnIGZyb20gUGF1bCdzIHJlc3BvbnNl
PyAgDQoNCj4gDQo+IEphbg0KPiANCj4gPiBIb3dldmVyLCB0aGUNCj4gPiBwYXNzdGhyb3VnaCBv
ZiBzdWNoIGRldmljZSBpcyBhbHJlYWR5IGluc2VjdXJlLCBhcyB5b3UgbWVudGlvbmVkLg0KPiA+
IFRoZW4gd2h5IGRvIHdlIGNhcmUgYWJvdXQgbWFraW5nIGRlYXNzaWdubWVudCBvZiBzdWNoIGRl
dmljZQ0KPiA+IHNlY3VyZSB3aXRob3V0IGRvaW5nIGFueXRoaW5nIHRvIHNlY3VyZSBpdCB3aGVu
IGl0IGlzIGFzc2lnbmVkIGFuZCBiZWluZw0KPiA+IHVzZWQgYnkgdW50cnVzdGVkIGd1ZXN0PyBJ
IGZlZWwgdGhhdCBvbmUgc2hvdWxkIHNpbXBseSBwdXQgc3VjaCBkZXZpY2UNCj4gPiBvdXQgb2Yg
dGhlIHF1YXJhbnRpbmUgbGlzdCBpbiB0aGUgZmlyc3QgcGxhY2UsIGkuZS4gc2V0IHF1YXJhbnRp
bmU9ZmFsc2UgYW5kDQo+ID4gdGhlbiB1c2UgdG9vbCB0byBxdWFyYW50aW5lIGEgd2hpdGVsaXN0
IG9mIGRldmljZXMgYnkgc2tpcHBpbmcgdGhlIGJhZCBvbmUuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
