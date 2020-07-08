Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C292188E0
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jul 2020 15:21:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jtA1F-0007Xo-5I; Wed, 08 Jul 2020 13:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M5eT=AT=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jtA1D-0007Xf-Kx
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2020 13:21:47 +0000
X-Inumbo-ID: f8e1a078-c11d-11ea-bb8b-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8e1a078-c11d-11ea-bb8b-bc764e2007e4;
 Wed, 08 Jul 2020 13:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594214506;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=JCcOhaQmMrJFhQ/6grXhm1QtDc+5GV1eZ41vFeKYK7I=;
 b=B9R4XfU+ie7zd3xxZW7Qxu5kO7qm2VD52m1xbvZ8BMkEwt8RA9Flsudu
 XWMDX2ntDOITgtDBEjxzu3Sn6RpOSEUphxGttTQusJvh2DNpHlB22f7UU
 3Z2XAaR1KNoCQPaiG4a7g1gBQNHtryoKBot7oQfNAvt/4vdIkQNdNZOBT 0=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: jd3rbUJL1tKUz3NzmWij23SQeQTbyv6J0FDVy5SgqGlaK/yeY9pcBPimvdQ17anr02D/YdwfXk
 1XX3ipCF1a7kA8FrxetvzcLksHI/vyq7UEDGJMsSSkjOn6nIPk8HpmxdS6WcR+CP/R4YAZftCi
 SOr0rPXwalvTBE4zHC3k0bJTykqz9SksOCV8CRP/dsSrVNaaSt/TU0c1ndjqQyaHBW+SVzeNbR
 TQFJgUaiKmMkLNdvFaZt8qUA7h0tb43+bGMQN6MuIHqzPUxsvcUDU+cxWXDmIPtzDo7cQIf/yw
 mmU=
X-SBRS: 2.7
X-MesageID: 22698887
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,327,1589256000"; d="scan'208";a="22698887"
From: George Dunlap <George.Dunlap@citrix.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: Re: Xen and RISC-V Design Session
Thread-Topic: Xen and RISC-V Design Session
Thread-Index: AQHWVSlaXbsHlooEqk+f8JPClsuwY6j9hqiAgAAC7gA=
Date: Wed, 8 Jul 2020 13:21:42 +0000
Message-ID: <6CE81465-9F87-486F-A3CC-08857C9C4332@citrix.com>
References: <CAKmqyKPFMGtDLzc2RiEZR6KCcbPL6wumm+V5SNdxNf7fAowcBQ@mail.gmail.com>
 <20200708131150.GD7191@Air-de-Roger>
 <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
In-Reply-To: <CAKmqyKOhW=YJ-WW28v-Ddt5yDDfVfCJKwijfsXo0oWAcvfrg2w@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2053D2EF33E67944AB0C0423E3C99717@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 Bobby Eshleman <bobby.eshleman@starlab.io>,
 "open list:X86" <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDgsIDIwMjAsIGF0IDI6MTEgUE0sIEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0
YWlyMjNAZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgSnVsIDgsIDIwMjAgYXQgNjox
MSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JvdGU6DQo+PiAN
Cj4+IEFkZGluZyBHZW9yZ2UgaW4gY2FzZSBoZSBjYW4gaGVscCB3aXRoIHRoZSBzZXNzaW9uIHBs
YWNlbWVudC4NCj4+IA0KPj4gT24gV2VkLCBKdWwgMDgsIDIwMjAgYXQgMDU6NTU6MDZBTSAtMDcw
MCwgQWxpc3RhaXIgRnJhbmNpcyB3cm90ZToNCj4+PiBIZXksDQo+Pj4gDQo+Pj4gSSdtIG5vdCBz
dXJlIGlmIHRoZXJlIGlzIGEgYmV0dGVyIHdheSB0byBzdWdnZXN0IGEgZGVzaWduIHNlc3Npb24g
YnV0DQo+Pj4gY2FuIHdlIGhhdmUgYSBYZW4gb24gUklTQy1WIGRpc2N1c3Npb24gdG9tb3Jyb3cg
YXQgdGhlIFhlbiBEZXNpZ24NCj4+PiBTdW1taXQ/DQo+PiANCj4+IEkgdGhpbmsgdGhhdCB3b3Vs
ZCBiZSBpbnRlcmVzdGluZyENCj4+IA0KPj4+IFByZWZlcmFibHkgaW4gYSBsYXRlciBzbG90IGFz
IHRoZSBlYXJseSBzbG90cyBhcmUgdmVyeSBlYXJseSBmb3IgbWUuDQo+PiANCj4+IFlvdSBoYXZl
IHRvIHJlZ2lzdGVyIGl0IGF0OiBodHRwczovL2Rlc2lnbi1zZXNzaW9ucy54ZW5wcm9qZWN0Lm9y
Zy8NCj4gDQo+IFRoYW5rcyENCj4gDQo+IEkgZG9uJ3QgaGF2ZSBhIHZlcmlmaWNhdGlvbiBjb2Rl
IHVuZm9ydHVuYXRlbHkuIElzIGl0IHBvc3NpYmxlIHRvIGdldCBvbmU/DQoNClZpcnR1YWxQYW5k
YTIwMjANCg0KQ2hlZXJzLA0KIC1HZW9yZ2U=

