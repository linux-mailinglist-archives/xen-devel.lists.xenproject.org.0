Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1414143B13
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 11:34:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itqpl-0006f1-Gq; Tue, 21 Jan 2020 10:32:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zZg3=3K=amazon.co.uk=prvs=282bd3163=pdurrant@srs-us1.protection.inumbo.net>)
 id 1itqpk-0006ew-LQ
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 10:32:32 +0000
X-Inumbo-ID: 524888c6-3c39-11ea-ba64-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 524888c6-3c39-11ea-ba64-12813bfff9fa;
 Tue, 21 Jan 2020 10:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579602749; x=1611138749;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AcJ1MxiH+X3Ozo653q977v7AXxnnDJkMI91NNsdLFNw=;
 b=T4MoATCJaZi9mKjKPDH7NVDkmfdgsm8g3OldKefJ0B2qvl+BQOsJwXH0
 PqL05oeAzWOpggLUTwPSuR8H3AA9oAY9KcnJNVyyd4OFP7XzpWb5kj1rm
 ZDmuHiLn5FDH1d9oCQqJHTU5gaH9fgBS3NyZQXPh18XC365icCIZExtw3 U=;
IronPort-SDR: L5csFlIzxXzaaubceEooQNR+8JD6AI2WLsx+VIQOF+KmAIaHYY2O5a97bOyiHd91PmQPCaye4u
 Nww21P7OtnrA==
X-IronPort-AV: E=Sophos;i="5.70,345,1574121600"; d="scan'208";a="21448506"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 21 Jan 2020 10:32:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id 6F224A1ED0; Tue, 21 Jan 2020 10:32:16 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 21 Jan 2020 10:32:16 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 21 Jan 2020 10:32:15 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 21 Jan 2020 10:32:14 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2] Introduce CHANGELOG.md
Thread-Index: AQHVyial2ULK1zg9ZU2VYV5GP8AbVKf091Ow
Date: Tue, 21 Jan 2020 10:32:14 +0000
Message-ID: <10bf76c0beef4d66a496758149c2e1f1@EX13D32EUC003.ant.amazon.com>
References: <20200113153217.3419-1-pdurrant@amazon.com>
In-Reply-To: <20200113153217.3419-1-pdurrant@amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2] Introduce CHANGELOG.md
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

UGluZz8gSSBoYXZlIGFja3MgZnJvbSBMYXJzIGFuZCBXZWkgYnV0IHRoaXMgZG9lc24ndCBhcHBl
YXIgdG8gaGF2ZSBiZWVuIGNvbW1pdHRlZC4gQXJlIGFueSBtb3JlIGFja3MgcmVxdWlyZWQ/Cgog
IFBhdWwKCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBQYXVsIER1cnJhbnQg
PHBkdXJyYW50QGFtYXpvbi5jb20+Cj4gU2VudDogMTMgSmFudWFyeSAyMDIwIDE1OjMyCj4gVG86
IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwo+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVy
cmFudEBhbWF6b24uY28udWs+OyBBbmRyZXcgQ29vcGVyCj4gPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+OyBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Owo+IElh
biBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsKPiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkIFJ6
ZXN6dXRlayBXaWxrCj4gPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBXZWkKPiBMaXUgPHdsQHhlbi5vcmc+Cj4gU3Vi
amVjdDogW1BBVENIIHYyXSBJbnRyb2R1Y2UgQ0hBTkdFTE9HLm1kCj4gCj4gQXMgYWdyZWVkIGR1
cmluZyB0aGUgMjAyMC0wMSBjb21tdW5pdHkgY2FsbCBbMV0gdGhpcyBwYXRjaCBpbnRyb2R1Y2Vz
IGEKPiBjaGFuZ2Vsb2csIGJhc2VkIG9uIHRoZSBwcmluY2lwbGVzIGV4cGxhaW5lZCBhdCBrZWVw
YWNoYW5nZWxvZy5jb20gWzJdLgo+IEEgbmV3IE1BSU5UQUlORVJTIGVudHJ5IGlzIGFsc28gYWRk
ZWQsIHdpdGggbXlzZWxmIGFzIChjdXJyZW50bHkgc29sZSkKPiBtYWludGFpbmVyLgo+IAo+IFsx
XSBTZWUgQy4yIGF0IGh0dHBzOi8vY3J5cHRwYWQuZnIvcGFkLyMvMi9wYWQvZWRpdC9FUlp0TVlE
NWo2azBzdi1ORzZIdGwtCj4gQUovCj4gWzJdIGh0dHBzOi8va2VlcGFjaGFuZ2Vsb2cuY29tL2Vu
LzEuMC4wLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9u
LmNvbT4KPiBBY2tlZC1ieTogTGFycyBLdXJ0aCA8bGFycy5rdXJ0aEBjaXRyaXguY29tPgo+IC0t
LQo+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgo+IENjOiBH
ZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNpdHJpeC5jb20+Cj4gQ2M6IElhbiBKYWNr
c29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+Cj4gQ2M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+Cj4gQ2M6IEtv
bnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFu
byBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IENjOiBXZWkgTGl1IDx3bEB4
ZW4ub3JnPgo+IAo+IHYyOgo+ICAtIERyb3BwZWQgJ0FsbCcgZnJvbSAnQWxsIG5vdGFibGUgY2hh
bmdlcycKPiAgLSBBZGRlZCBMYXJzIGFzIGEgZGVzaWduYXRlZCByZXZpZXdlcgo+IC0tLQo+ICBD
SEFOR0VMT0cubWQgfCAxNCArKysrKysrKysrKysrKwo+ICBNQUlOVEFJTkVSUyAgfCAgNiArKysr
KysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBDSEFOR0VMT0cubWQKPiAKPiBkaWZmIC0tZ2l0IGEvQ0hBTkdFTE9HLm1kIGIvQ0hBTkdF
TE9HLm1kCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5iMTFlOWJj
NGUzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL0NIQU5HRUxPRy5tZAo+IEBAIC0wLDAgKzEsMTQg
QEAKPiArIyBDaGFuZ2Vsb2cKPiArCj4gK05vdGFibGUgY2hhbmdlcyB0byBYZW4gd2lsbCBiZSBk
b2N1bWVudGVkIGluIHRoaXMgZmlsZS4KPiArCj4gK1RoZSBmb3JtYXQgaXMgYmFzZWQgb24gW0tl
ZXAgYQo+IENoYW5nZWxvZ10oaHR0cHM6Ly9rZWVwYWNoYW5nZWxvZy5jb20vZW4vMS4wLjAvKQo+
ICsKPiArIyMgW1VucmVsZWFzZWRdKGh0dHBzOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD14
ZW4uZ2l0O2E9c2hvcnRsb2cpCj4gKwo+ICsjIyMgQWRkZWQKPiArIC0gVGhpcyBmaWxlIGFuZCBN
QUlOVEFJTkVSUyBlbnRyeS4KPiArCj4gKyMjCj4gWzQuMTMuMF0oaHR0cHM6Ly94ZW5iaXRzLnhl
bi5vcmcvZ2l0d2ViLz9wPXhlbi5naXQ7YT1zaG9ydGxvZztoPVJFTEVBU0UtCj4gNC4xMy4wKSAt
IDIwMTktMTItMTcKPiArCj4gKz4gUG9pbnRlciB0byByZWxlYXNlIGZyb20gd2hpY2ggQ0hBTkdF
TE9HIHRyYWNraW5nIHN0YXJ0cwo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCj4gaW5kZXggZDViZDgzMDczYy4uMWZmYzNkYzYwMCAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJ
TkVSUwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTE5OCw2ICsxOTgsMTIgQEAgRjoJeGVuL2lu
Y2x1ZGUvYXNtLWFybS8KPiAgRjoJeGVuL2luY2x1ZGUvcHVibGljL2FyY2gtYXJtLwo+ICBGOgl4
ZW4vaW5jbHVkZS9wdWJsaWMvYXJjaC1hcm0uaAo+IAo+ICtDaGFuZ2UgTG9nCj4gK006CVBhdWwg
RHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiArUjoJTGFycyBLdXJ0aCA8bGFycy5rdXJ0
aEBjaXRyaXguY29tPgo+ICtTOglNYWludGFpbmVkCj4gK0Y6CUNIQU5HRUxPRy5tZAo+ICsKPiAg
Q29udGludW91cyBJbnRlZ3JhdGlvbiAoQ0kpCj4gIE06CURvdWcgR29sZHN0ZWluIDxjYXJkb2VA
Y2FyZG9lLmNvbT4KPiAgVzoJaHR0cHM6Ly9naXRsYWIuY29tL3hlbi1wcm9qZWN0L3hlbgo+IC0t
Cj4gMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
