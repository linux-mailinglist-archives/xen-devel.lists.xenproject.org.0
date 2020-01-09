Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE61135AED
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2020 15:05:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipYOq-0005an-E4; Thu, 09 Jan 2020 14:03:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kEnv=26=amazon.co.uk=prvs=2706230f4=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ipYOp-0005ai-PF
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2020 14:02:59 +0000
X-Inumbo-ID: be435d26-32e8-11ea-b9d7-12813bfff9fa
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id be435d26-32e8-11ea-b9d7-12813bfff9fa;
 Thu, 09 Jan 2020 14:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1578578579; x=1610114579;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YOF5MxHKSOjxiQC9GYTkVyEZhMobggZWp1NHjJCWDbA=;
 b=QCIbLfNGHIxA3DzQWeUwCW/IdB/JStoQXhdXspAUmKY8+oChwH9cllyB
 Dp/dLuEZWFn4ON/qSmoJpZJxz3iWCPYRu+s66oe4X+cAP4XO1mNmN/RgV
 r3GAfHrWPKcYhQR2yp3E8k75QASlDt3rCoXN3V/FXG617V4TI+292Ym9C w=;
IronPort-SDR: DF8X+x+4kVthFyBtUb+FS0tT3cmd6ln+vGvsjwX6nTQZKdlWo41eEpxGHRC9gwXk8vP9Uw+xFn
 AluFtPTYRS+Q==
X-IronPort-AV: E=Sophos;i="5.69,413,1571702400"; d="scan'208";a="11602068"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 09 Jan 2020 14:02:58 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id 922C4A1C7C; Thu,  9 Jan 2020 14:02:57 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 9 Jan 2020 14:02:57 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 9 Jan 2020 14:02:56 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 9 Jan 2020 14:02:55 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH] tools/Rules.mk: fix distclean
Thread-Index: AQHVxt4OYeuIybkElkacvC/aEKB1pqfiWkaAgAACheA=
Date: Thu, 9 Jan 2020 14:02:55 +0000
Message-ID: <a8596f255bfd46d3adefd4ca7f088056@EX13D32EUC003.ant.amazon.com>
References: <20200109111505.12328-1-pdurrant@amazon.com>
 <20200109135217.wdvaxvp2i7jemqsv@debian>
In-Reply-To: <20200109135217.wdvaxvp2i7jemqsv@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.252]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] tools/Rules.mk: fix distclean
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IFdlaSBMaXUgPHdsQHhlbi5vcmc+
Cj4gU2VudDogMDkgSmFudWFyeSAyMDIwIDEzOjUyCj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJy
YW50QGFtYXpvbi5jby51az4KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBJ
YW4gSmFja3Nvbgo+IDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVu
Lm9yZz47IEFudGhvbnkgUEVSQVJECj4gPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Cj4gU3Vi
amVjdDogUmU6IFtQQVRDSF0gdG9vbHMvUnVsZXMubWs6IGZpeCBkaXN0Y2xlYW4KPiAKPiBPbiBU
aHUsIEphbiAwOSwgMjAyMCBhdCAxMToxNTowNUFNICswMDAwLCBQYXVsIER1cnJhbnQgd3JvdGU6
Cj4gPiBSdW5uaW5nICdtYWtlIGRpc3RjbGVhbicgdW5kZXIgdG9vbHMgd2lsbCBjdXJyZW50bHkg
cmVzdWx0IGluOgo+ID4KPiA+IHRvb2xzL1J1bGVzLm1rOjI0NTogKioqIFlvdSBoYXZlIHRvIHJ1
biAuL2NvbmZpZ3VyZSBiZWZvcmUgYnVpbGRpbmcgb3IKPiBpbnN0YWxsaW5nIHRoZSB0b29scy4g
IFN0b3AuCj4gPgo+ID4gVGhpcyBwYXRjaCBhZGRzICdkaXN0Y2xlYW4nLCAnc3ViZGlyLWRpc3Rj
bGVhbiUnIGFuZCAnc3ViZGlyLWNsZWFuJScgdG8KPiA+IG5vLWNvbmZpZ3VyZS10YXJnZXRzLCB3
aGljaCBhbGxvd3MgJ21ha2UgZGlzdGNsZWFuJyB0byBydW4gdG8KPiBjb21wbGV0aW9uLgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAK
PiBGaXhlczogMDA2OTFjNmM5MGIKPiAKPiBTb3JyeSBmb3Igbm90IG5vdGljaW5nIHRoZSBicmVh
a2FnZSB3aGlsZSByZXZpZXdpbmcgdGhhdCBwYXRjaC4KPiAKCk9rLiBJJ20gc3VyZSB0aGF0IGNv
dWxkIGJlIGFkZGVkIGF0IGNvbW1pdCBpZiB0aGVyZSBhcmUgbm8gb3RoZXIgY2hhbmdlcyBuZWVk
ZWQuCgo+IElzIHRoZXJlIGEgd2F5IHRvIHBhdHRlcm4gbWF0Y2ggYWxsIHRhcmdldHMgY29udGFp
bmluZyAiY2xlYW4iPwo+IAo+IChXb3VsZCBoYXZlIGxvb2tlZCBpbnRvIGl0IG15c2VsZiBidXQg
LUVUSU1FIHRvZGF5KQoKSSBjb3VsZG4ndCBwZXJzdWFkZSBmaWx0ZXIgdG8gbWF0Y2ggYWdhaW5z
dCBwYXR0ZXJucyB3aXRoIG11bHRpcGxlICUgc28gdGhpcyB3YXMgdGhlIGJlc3QgSSBjb3VsZCBj
b21lIHVwIHdpdGguCgogIFBhdWwKCj4gCj4gPiAtLS0KPiA+IENjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiA+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+ID4g
LS0tCj4gPiAgdG9vbHMvUnVsZXMubWsgfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL1J1bGVz
Lm1rIGIvdG9vbHMvUnVsZXMubWsKPiA+IGluZGV4IDMxY2Y0MTllZjQuLjUyZjQ3YmUzZjggMTAw
NjQ0Cj4gPiAtLS0gYS90b29scy9SdWxlcy5tawo+ID4gKysrIGIvdG9vbHMvUnVsZXMubWsKPiA+
IEBAIC0yMzksNyArMjM5LDcgQEAgc3ViZGlyLWFsbC0lIHN1YmRpci1jbGVhbi0lIHN1YmRpci1p
bnN0YWxsLSUgc3ViZGlyLQo+IHVuaW5zdGFsbC0lOiAucGhvbnkKPiA+ICBzdWJkaXItZGlzdGNs
ZWFuLSU6IC5waG9ueQo+ID4gIAkkKE1BS0UpIC1DICQqIGRpc3RjbGVhbgo+ID4KPiA+IC1uby1j
b25maWd1cmUtdGFyZ2V0cyA6PSBjbGVhbiBzdWJ0cmVlLWZvcmNlLXVwZGF0ZS1hbGwgJS1kaXIt
Zm9yY2UtCj4gdXBkYXRlCj4gPiArbm8tY29uZmlndXJlLXRhcmdldHMgOj0gZGlzdGNsZWFuIHN1
YmRpci1kaXN0Y2xlYW4lIGNsZWFuIHN1YmRpci1jbGVhbiUKPiBzdWJ0cmVlLWZvcmNlLXVwZGF0
ZS1hbGwgJS1kaXItZm9yY2UtdXBkYXRlCj4gPiAgaWZlcSAoLCQoZmlsdGVyICQobm8tY29uZmln
dXJlLXRhcmdldHMpLCQoTUFLRUNNREdPQUxTKSkpCj4gPiAgJChYRU5fUk9PVCkvY29uZmlnL1Rv
b2xzLm1rOgo+ID4gIAkkKGVycm9yIFlvdSBoYXZlIHRvIHJ1biAuL2NvbmZpZ3VyZSBiZWZvcmUg
YnVpbGRpbmcgb3IgaW5zdGFsbGluZwo+IHRoZSB0b29scykKPiA+IC0tCj4gPiAyLjIwLjEKPiA+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
