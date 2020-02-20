Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AE165DED
	for <lists+xen-devel@lfdr.de>; Thu, 20 Feb 2020 13:57:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4lLa-0008Ik-RY; Thu, 20 Feb 2020 12:54:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1oA1=4I=amazon.co.uk=prvs=31285a090=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j4lLZ-0008If-EV
 for xen-devel@lists.xenproject.org; Thu, 20 Feb 2020 12:54:29 +0000
X-Inumbo-ID: 21b23c16-53e0-11ea-ade5-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21b23c16-53e0-11ea-ade5-bc764e2007e4;
 Thu, 20 Feb 2020 12:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582203269; x=1613739269;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mhisK8EjSr/qZYntx0NB/TkMc8evffks09tiI+IPK4Q=;
 b=KYt6P7db853concCAjpEVIo8b0BfK06nyYshgM/dEAxAxQsEoU3QLbF5
 AhjQDh3F8vCmI9v2YDPdkDyMMAjtSXgBH7halD2qDLWzho0cl4v+rkpTT
 VOdn3bQol9ZwKcBTBHzivcgm33LJogIzzRUCJW2FuSNvqHO2RFXQsaKNH 4=;
IronPort-SDR: bo4b2/VUv0bOv6aOzuv1OUQesLQRoE8qroigaEAbcfAzr3YD0dEPUb8k+nHid4hEzMbUNgPWwD
 4uC4+33amIbw==
X-IronPort-AV: E=Sophos;i="5.70,464,1574121600"; d="scan'208";a="17778396"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 20 Feb 2020 12:54:16 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-c7131dcf.us-west-2.amazon.com (Postfix) with ESMTPS
 id 51BC5A178A; Thu, 20 Feb 2020 12:54:15 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 20 Feb 2020 12:54:14 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 20 Feb 2020 12:54:14 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 20 Feb 2020 12:54:13 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v5 0/2] docs: Migration design documents
Thread-Index: AQHV4lvTdON+ZAjLg0GY3Lnt2eOgvqgkFHQA
Date: Thu, 20 Feb 2020 12:54:13 +0000
Message-ID: <fafcc47d00b44e3c91bca39b7ab357de@EX13D32EUC003.ant.amazon.com>
References: <20200213105325.3022-1-pdurrant@amazon.com>
In-Reply-To: <20200213105325.3022-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.112]
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

UGluZz8KCkkgaGF2ZSBub3QgcmVjZWlldmVkIGFueSBmdXJ0aGVyIGNvbW1lbnRzIG9uIHY1LiBD
YW4gSSBwbGVhc2UgZ2V0IGFja3Mgb3Igb3RoZXJ3aXNlIHNvIHdlIGNhbiAoaG9wZWZ1bGx5KSBt
b3ZlIG9uIHdpdGggY29kaW5nPwoKICBQYXVsCgo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
Cj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29tPgo+IFNlbnQ6IDEzIEZl
YnJ1YXJ5IDIwMjAgMTA6NTMKPiBUbzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4g
Q2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az47IEFuZHJldyBDb29wZXIK
PiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5s
YXBAZXUuY2l0cml4LmNvbT47Cj4gSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5j
b20+OyBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Owo+IEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsKPiA8a29ucmFkLndpbGtAb3JhY2xl
LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IFdlaQo+
IExpdSA8d2xAeGVuLm9yZz4KPiBTdWJqZWN0OiBbUEFUQ0ggdjUgMC8yXSBkb2NzOiBNaWdyYXRp
b24gZGVzaWduIGRvY3VtZW50cwo+IAo+IFBhdWwgRHVycmFudCAoMik6Cj4gICBkb2NzL2Rlc2ln
bnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBmb3Igbm9uLWNvb3BlcmF0aXZlIGxpdmUgbWlncmF0
aW9uCj4gICBkb2NzL2Rlc2lnbnM6IEFkZCBhIGRlc2lnbiBkb2N1bWVudCBmb3IgbWlncmF0aW9u
IG9mIHhlbnN0b3JlIGRhdGEKPiAKPiAgZG9jcy9kZXNpZ25zL25vbi1jb29wZXJhdGl2ZS1taWdy
YXRpb24ubWQgfCAyNzIgKysrKysrKysrKysrKysrKysrKysrKwo+ICBkb2NzL2Rlc2lnbnMveGVu
c3RvcmUtbWlncmF0aW9uLm1kICAgICAgICB8IDEzNiArKysrKysrKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQwOCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkb2NzL2Rlc2ln
bnMvbm9uLWNvb3BlcmF0aXZlLW1pZ3JhdGlvbi5tZAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZG9j
cy9kZXNpZ25zL3hlbnN0b3JlLW1pZ3JhdGlvbi5tZAo+IC0tLQo+IENjOiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2Uu
RHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5j
aXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEp1
bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVs
bGluaUBrZXJuZWwub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IC0tCj4gMi4yMC4x
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
