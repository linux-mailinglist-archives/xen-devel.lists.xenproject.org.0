Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A44CC173E56
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 18:23:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7jJ1-00044h-Vu; Fri, 28 Feb 2020 17:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ncfg=4Q=amazon.co.uk=prvs=320a9563e=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j7jJ1-0003zf-3Y
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 17:20:07 +0000
X-Inumbo-ID: 8f2feaa2-5a4e-11ea-99ca-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8f2feaa2-5a4e-11ea-99ca-12813bfff9fa;
 Fri, 28 Feb 2020 17:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582910406; x=1614446406;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XrozgoguxTFZvUrjghAgUo+Pe34ZWHjlvgY2sb3yuvU=;
 b=niunD9+7XLIJZlwkor2kr9CwTSH021iLOMRXv9I0ClQrEYYz2v9CF3Ye
 Rsd4ZyxaEA5Z8gXHZG49lXX1AmGwos56kCFZdRtA/hvL/YA7XClM4T9N2
 HPZCBjXDtXS8thS3QINaMZ0wvSR1sQUH5lRlg2sgfWZV8yjV1w9IFZeIf U=;
IronPort-SDR: d5yC+y7PW5LSEv3nv88r5mnmBzTlt++VyaZVzqEz24W4wXL8m9Fiu7PeW4dGSvWHOto4AooHye
 ihLd0LNipkvg==
X-IronPort-AV: E=Sophos;i="5.70,496,1574121600"; d="scan'208";a="29541630"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 28 Feb 2020 17:20:03 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id F39B6A3769; Fri, 28 Feb 2020 17:20:02 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 28 Feb 2020 17:20:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 28 Feb 2020 17:20:01 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 28 Feb 2020 17:20:01 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 0/2] docs: Migration design documents
Thread-Index: AQHV4lvTdON+ZAjLg0GY3Lnt2eOgvqgkFHQAgAzdT+A=
Date: Fri, 28 Feb 2020 17:20:01 +0000
Message-ID: <27d24d70acd545fcab5ca4c83c5065c2@EX13D32EUC003.ant.amazon.com>
References: <20200213105325.3022-1-pdurrant@amazon.com>
 <fafcc47d00b44e3c91bca39b7ab357de@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <fafcc47d00b44e3c91bca39b7ab357de@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.216]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 0/2] docs: Migration design documents
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZyBhZ2Fpbi4uLgoKPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4KPiBTZW50OiAyMCBGZWJydWFyeSAyMDIw
IDEyOjU0Cj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IHhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPjsgR2VvcmdlIER1bmxhcAo+IDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJp
eC5jb20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47Cj4gSmFuIEJl
dWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz47
IEtvbnJhZAo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsgU3RlZmFu
byBTdGFiZWxsaW5pCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkgTGl1IDx3bEB4ZW4u
b3JnPgo+IFN1YmplY3Q6IFJFOiBbUEFUQ0ggdjUgMC8yXSBkb2NzOiBNaWdyYXRpb24gZGVzaWdu
IGRvY3VtZW50cwo+IAo+IFBpbmc/Cj4gCj4gSSBoYXZlIG5vdCByZWNlaWV2ZWQgYW55IGZ1cnRo
ZXIgY29tbWVudHMgb24gdjUuIENhbiBJIHBsZWFzZSBnZXQgYWNrcyBvcgo+IG90aGVyd2lzZSBz
byB3ZSBjYW4gKGhvcGVmdWxseSkgbW92ZSBvbiB3aXRoIGNvZGluZz8KPiAKPiAgIFBhdWwKPiAK
PiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBQYXVsIER1cnJhbnQgPHBk
dXJyYW50QGFtYXpvbi5jb20+Cj4gPiBTZW50OiAxMyBGZWJydWFyeSAyMDIwIDEwOjUzCj4gPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gPiBDYzogRHVycmFudCwgUGF1bCA8
cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgQW5kcmV3IENvb3Blcgo+ID4gPGFuZHJldy5jb29wZXIz
QGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwCj4gPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNv
bT47Cj4gPiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IEphbiBCZXVs
aWNoCj4gPGpiZXVsaWNoQHN1c2UuY29tPjsKPiA+IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5v
cmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA+IDxrb25yYWQud2lsa0BvcmFjbGUuY29tPjsg
U3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsKPiBXZWkKPiA+IExp
dSA8d2xAeGVuLm9yZz4KPiA+IFN1YmplY3Q6IFtQQVRDSCB2NSAwLzJdIGRvY3M6IE1pZ3JhdGlv
biBkZXNpZ24gZG9jdW1lbnRzCj4gPgo+ID4gUGF1bCBEdXJyYW50ICgyKToKPiA+ICAgZG9jcy9k
ZXNpZ25zOiBBZGQgYSBkZXNpZ24gZG9jdW1lbnQgZm9yIG5vbi1jb29wZXJhdGl2ZSBsaXZlIG1p
Z3JhdGlvbgo+ID4gICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBmb3IgbWln
cmF0aW9uIG9mIHhlbnN0b3JlIGRhdGEKPiA+Cj4gPiAgZG9jcy9kZXNpZ25zL25vbi1jb29wZXJh
dGl2ZS1taWdyYXRpb24ubWQgfCAyNzIgKysrKysrKysrKysrKysrKysrKysrKwo+ID4gIGRvY3Mv
ZGVzaWducy94ZW5zdG9yZS1taWdyYXRpb24ubWQgICAgICAgIHwgMTM2ICsrKysrKysrKysrCj4g
PiAgMiBmaWxlcyBjaGFuZ2VkLCA0MDggaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkb2NzL2Rlc2lnbnMvbm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZAo+ID4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2lnbnMveGVuc3RvcmUtbWlncmF0aW9uLm1kCj4gPiAtLS0K
PiA+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+ID4gQ2M6
IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0cml4LmNvbT4KPiA+IENjOiBJYW4g
SmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+Cj4gPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4K
PiA+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Cj4g
PiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+ID4gQ2M6
IFdlaSBMaXUgPHdsQHhlbi5vcmc+Cj4gPiAtLQo+ID4gMi4yMC4xCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
