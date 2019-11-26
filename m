Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8E10A11C
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:19:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcap-000699-DT; Tue, 26 Nov 2019 15:17:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZcan-00068p-8E
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:17:29 +0000
X-Inumbo-ID: dc20ab92-105f-11ea-a3a3-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc20ab92-105f-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574781449; x=1606317449;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=URKVlY0GYYJLDn94SyhDs0PVZaWWVj7rcCWScr0oCDY=;
 b=Q5ENgSpLIyGrcyVz8KVoUAPfBIAURi/aksJYUeHSOeehygyRt03j4tbT
 i+6B1fishYtxJcJf2Swj3XOfZuXV7x/Ss4e0ykNVR9PfH+tv9yrltOoaV
 bClU+r8zoFxFhDN7Y3oCVVfEIKkVepgHFbAeMtbT7r6kj+zQkgw3PLf6P Q=;
IronPort-SDR: uCBVU03O7h9tFqB3A/JWuFpFmFyaTIs+FcRInYhyVavuocBDo/M6CCDMy+mOhopYNTYzWPeH3S
 WG81LjH10z+Q==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; 
   d="scan'208";a="5851260"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 26 Nov 2019 15:17:28 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id 327551A1C38; Tue, 26 Nov 2019 15:17:25 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:17:24 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:17:23 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 15:17:23 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <Ian.Jackson@citrix.com>, George Dunlap
 <George.Dunlap@citrix.com>
Thread-Topic: [PATCH for-4.13] docs/xl: Document pci-assignable state
Thread-Index: AQHVpGT4qCvWO7fUTEaoXMLhP52Fm6edjuVg
Date: Tue, 26 Nov 2019 15:17:23 +0000
Message-ID: <41e3703f96ed4635aab707397731220c@EX13D32EUC003.ant.amazon.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <cf29f5f8ebed41fe8309b551aeaefac5@FTLPEX02CAS02.citrite.net>
In-Reply-To: <cf29f5f8ebed41fe8309b551aeaefac5@FTLPEX02CAS02.citrite.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxJYW4uSmFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI2IE5vdmVtYmVyIDIwMTkgMTQ6MjIKPiBUbzogR2Vv
cmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBjaXRyaXguY29tPgo+IENjOiB4ZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBKYW4gQmV1bGljaAo+IDxq
YmV1bGljaEBzdXNlLmNvbT47IFBhdWwgRHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+
OyBKdWVyZ2VuIEdyb3NzCj4gPGpncm9zc0BzdXNlLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENI
IGZvci00LjEzXSBkb2NzL3hsOiBEb2N1bWVudCBwY2ktYXNzaWduYWJsZSBzdGF0ZQo+IAo+IFty
ZXNlbmRpbmcgdG8ganVzdCBQYXVsIHRvIGZpeCBlbWFpbCBhZGRyZXNzIHByb2JsZW1dCj4gCj4g
R2VvcmdlIER1bmxhcCB3cml0ZXMgKCJbUEFUQ0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50
IHBjaS1hc3NpZ25hYmxlCj4gc3RhdGUiKToKPiA+ICA9aXRlbSBCPHBjaS1hc3NpZ25hYmxlLXJl
bW92ZT4gW0k8LXI+XSBJPEJERj4KPiAuLi4KPiA+ICtNYWtlIHRoZSBkZXZpY2UgYXQgUENJIEJ1
cy9EZXZpY2UvRnVuY3Rpb24gQkRGIG5vdCBhc3NpZ25hYmxlIHRvCj4gPiArZ3Vlc3RzLiAgVGhp
cyB3aWxsIGF0IGxlYXN0IHVuYmluZCB0aGUgZGV2aWNlIGZyb20gcGNpYmFjaywgYW5kCj4gPiAr
cmUtYXNzaWduIGl0IGZyb20gdGhlICJxdWFyYW50aW5lIGRvbWFpbiIgYmFjayB0byBkb21haW4g
MC4gIElmIHRoZSAtcgo+ID4gK29wdGlvbiBpcyBzcGVjaWZpZWQsIGl0IHdpbGwgYWxzbyBhdHRl
bXB0IHRvIHJlLWJpbmQgdGhlIGRldmljZSB0byBpdHMKPiA+ICtvcmlnaW5hbCBkcml2ZXIsIG1h
a2luZyBpdCB1c2FibGUgYnkgRG9tYWluIDAgYWdhaW4uICBJZiB0aGUgZGV2aWNlIGlzCj4gPiAr
bm90IGJvdW5kIHRvIHBjaWJhY2ssIGl0IHdpbGwgcmV0dXJuIHN1Y2Nlc3MuCj4gPiArCj4gPiAr
Tm90ZSB0aGF0IHRoaXMgZnVuY3Rpb25hbGl0eSB3aWxsIHdvcmsgZXZlbiBmb3IgZGV2aWNlcyB3
aGljaCB3ZXJlIG5vdAo+ID4gK21hZGUgYXNzaWduYWJsZSBieSBCPHBjaS1hc3NpZ25hYmxlLWFk
ZD4uICBUaGlzIGNhbiBiZSB1c2VkIHRvIGFsbG93Cj4gPiArZG9tMCB0byBhY2Nlc3MgZGV2aWNl
cyB3aGljaCB3ZXJlIGF1dG9tYXRpY2FsbHkgcXVhcmFudGluZWQgYnkgWGVuCj4gPiArYWZ0ZXIg
ZG9tYWluIGRlc3RydWN0aW9uIGFzIGEgcmVzdWx0IG9mIFhlbidzIEI8aW9tbXU9cXVhcmFudGlu
ZT4KPiA+ICtjb21tYW5kLWxpbmUgZGVmYXVsdC4KPiAKPiBXaGF0IGFyZSB0aGUgc2VjdXJpdHkg
aW1wbGljYXRpb25zIG9mIGRvaW5nIHRoaXMgaWYgdGhlIGRldmljZSBtaWdodAo+IHN0aWxsIGJl
IGRvaW5nIERNQSBvciBzb21ldGhpbmcgPwo+IAo+IChGb3IgdGhhdCBtYXR0ZXIsIHByZXN1bWFi
bHkgdGhlcmUgYXJlIHNlY3VyaXR5IGltcGxpY2F0aW9ucyBvZgo+IGFzc2lnbmluZyB0aGUgc2Ft
ZSBkZXZpY2UgaW4gc2VxdWVuY2UgdG8gZGlmZmVyZW50IGd1ZXN0cz8pCj4gCgpBc3NpZ25pbmcg
YW55IGRldmljZSBjYXJyaWVzIGEgcmlzayBhbmQgY2FuIG5ldmVyIGNvbnNpZGVyZWQgdG8gYmUg
c2VjdXJlIGluIGFueSBnZW5lcmFsIHdheS4gRS5nLiBhIGRldmljZSB0aGF0IGV4cG9zZXMgaXRz
IGNvbmZpZyBzcGFjZSBpbiBhIHdyaXRhYmxlIGZhc2hpb24gdmlhIGFuIGludGVybmFsIGkyYyBi
dXMgdGhhdCBjYW4gYmUgYWNjZXNzZWQgdmlhIG9uZSBvZiBpdHMgQkFScy4gUXVhcmFudGluaW5n
IGhlbHBzIHRvIHRoZSBleHRlbnQgdGhhdCwgaWYgYSBkZXZpY2UgaXMgY29udGludWluZyB0byBE
TUEgdGhhbiBhdCBsZWFzdCB0aGF0IGRvZXNuJ3QgaGl0IGRvbTAgd2hpbHN0IHRoZSBGTFIvU0JS
IGlzIGF0dGVtcHRlZCwgYnV0IGlmIGV2ZW4gdGhhdCdzIG5vdCBlZmZlY3RpdmUgdGhlbiB0aGUg
ZGV2aWNlIHNob3VsZCBwcm9iYWJseSByZW1haW4gaW4gcXVhcmFudGluZSB1bnRpbCBpdCBpcyBw
b3dlci1jeWNsZWQuCgogIFBhdWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
