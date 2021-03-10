Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E565E3339E4
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 11:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95954.181216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJw15-0001Cj-R1; Wed, 10 Mar 2021 10:24:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95954.181216; Wed, 10 Mar 2021 10:24:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJw15-0001CK-Nd; Wed, 10 Mar 2021 10:24:35 +0000
Received: by outflank-mailman (input) for mailman id 95954;
 Wed, 10 Mar 2021 10:24:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmYj=II=amazon.com=prvs=696d233ab=famzheng@srs-us1.protection.inumbo.net>)
 id 1lJw14-0001CF-7k
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 10:24:34 +0000
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6e72d90d-d512-4648-8c16-c0064fc13ff5;
 Wed, 10 Mar 2021 10:24:32 +0000 (UTC)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 10 Mar 2021 10:24:25 +0000
Received: from EX13D38EUB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
 by email-inbound-relay-2c-c6afef2e.us-west-2.amazon.com (Postfix) with ESMTPS
 id BB253A2840; Wed, 10 Mar 2021 10:24:23 +0000 (UTC)
Received: from EX13D38EUB001.ant.amazon.com (10.43.166.110) by
 EX13D38EUB001.ant.amazon.com (10.43.166.110) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 10 Mar 2021 10:24:22 +0000
Received: from EX13D38EUB001.ant.amazon.com ([10.43.166.110]) by
 EX13D38EUB001.ant.amazon.com ([10.43.166.110]) with mapi id 15.00.1497.012;
 Wed, 10 Mar 2021 10:24:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6e72d90d-d512-4648-8c16-c0064fc13ff5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1615371874; x=1646907874;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=FvSvjguTLFZ1hhfb8GXwvVIqK8Ngn1VmFVpzPrk+vtc=;
  b=K4ExUeoDZtZss8ExAfsspXeKWi45YoAWrZQZElNQ0pRvE+g4ywE2618N
   Eaj/6W/sGjcOPwgPykB9D8H5KHQJADMQqPYtBu2ZS4BFpAA4kx+dzv1Ya
   FB8ztVOFLW4tJDDfNZrArJYHrU4Ac0ONZtOvBidjgfhaWo24lQcySC6db
   Q=;
X-IronPort-AV: E=Sophos;i="5.81,237,1610409600"; 
   d="scan'208";a="91705831"
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9
 (5.1 on arm64)
Thread-Topic: [PATCH for-4.15] xen: Bump the minimum version of GCC supported to 4.9 (5.1
 on arm64)
From: "Zheng, Fam" <famzheng@amazon.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
	"anthony.perard@citrix.com" <anthony.perard@citrix.com>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "Bertrand.Marquis@arm.com" <Bertrand.Marquis@arm.com>,
	"julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHXEt09VDRvSzcs2kGB8AY7OydLi6p4fe6AgAJbNYCAAJiMAIAAB66AgADGvICAAJ7QAIAAKm8A
Date: Wed, 10 Mar 2021 10:24:22 +0000
Message-ID: <985f49e153789ff2428a7b3f47a0b2557bf23c97.camel@amazon.com>
References: <161507188317.11025.6744028462008264481@c667a6b167f6>
	 <af575951-9d48-09da-d120-a6120ca29ead@xen.org>
	 <alpine.DEB.2.21.2103081654030.16374@sstabellini-ThinkPad-T480s>
	 <10b8048a-e8fe-1fcd-7291-7f1b16da2f4c@xen.org>
	 <YEdOz4B4rtXbjKOS@Air-de-Roger>
	 <alpine.DEB.2.21.2103091423470.16374@sstabellini-ThinkPad-T480s>
	 <YEh6vmXV8bdhcC1U@Air-de-Roger>
In-Reply-To: <YEh6vmXV8bdhcC1U@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.52]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8D6519B30EEBE64592AE9E0AC0D73F42@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gV2VkLCAyMDIxLTAzLTEwIGF0IDA4OjUyICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Og0KPiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBv
cmdhbml6YXRpb24uIERvDQo+IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlcg0KPiBhbmQga25vdyB0aGUgY29udGVudCBp
cyBzYWZlLg0KPiANCj4gDQo+IA0KPiBPbiBUdWUsIE1hciAwOSwgMjAyMSBhdCAwMjoyNDowNVBN
IC0wODAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gVHVlLCA5IE1hciAyMDIx
LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiA+ID4gT24gVHVlLCBNYXIgMDksIDIwMjEgYXQg
MTA6MDU6MThBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiA+ID4gPiBIaSBTdGVmYW5v
LA0KPiA+ID4gPiANCj4gPiA+ID4gT24gMDkvMDMvMjAyMSAwMDo1OSwgU3RlZmFubyBTdGFiZWxs
aW5pIHdyb3RlOg0KPiA+ID4gPiA+IE9uIFN1biwgNyBNYXIgMjAyMSwgSnVsaWVuIEdyYWxsIHdy
b3RlOg0KPiA+ID4gPiA+ID4gT24gMDYvMDMvMjAyMSAyMzowNCwgbm8tcmVwbHlAcGF0Y2hldy5v
cmcgd3JvdGU6DQo+ID4gPiANCj4gPiA+IFdoZXJlIGRvZXMgb25lIGhhcyB0byByZWdpc3RlciB0
byBnZXQgdGhlIHBhdGNoZXcgYnVpbGQgZmFpbHVyZXM/DQo+ID4gDQo+ID4gQnkgYXNraW5nIEZh
bSAoQ0MnZWQpIHZlcnkgbmljZWx5IDotKQ0KPiANCj4gVGhhbmtzISBDb3VsZCB3ZSBtYXliZSBz
ZXR1cCBhIG1haWxpbmcgbGlzdCBmb3IgdGhvc2UgZW1haWxzPyBpZToNCj4gcGF0Y2hldy10ZXN0
c0AuLi4gb3Igc29tZSBzdWNoLCBzbyB0aGF0IHdlIGRvbid0IGhhdmUgdG8gZ28gYWRkaW5nDQo+
IHBlb3BsZSBtYW51YWxseT8NCj4gDQo+IFJvZ2VyLg0KDQpUaGUgaWRlYSAoSSB0aGluaykgaXMg
dG8gZ3JvdXAgcmVwbHkgYWxsIG9uY2Ugd2UgZmVlbCBjb21mb3J0YWJsZSB3aXRoDQp0aGUgZmFs
c2UgcG9zaXRpdmUgcmF0ZS4gQnV0IGEgc2VwYXJhdGUgbWFpbGluZyBsaXN0IGlzIGFsc28gYSBn
b29kDQphcHByb2FjaC4NCg0KSSdsbCBhZGQgeW91IGJ5IGhhbmQgZm9yIG5vdywgUm9nZXIuDQoN
CkZhbQ0K

