Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934C244A0D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Aug 2020 14:59:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6ZIR-0002vG-4D; Fri, 14 Aug 2020 12:58:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F2oo=BY=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k6ZIP-0002vB-Mc
 for xen-devel@lists.xenproject.org; Fri, 14 Aug 2020 12:58:57 +0000
X-Inumbo-ID: 0b3168f3-7d11-40e3-b021-c7c3de3c74f0
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b3168f3-7d11-40e3-b021-c7c3de3c74f0;
 Fri, 14 Aug 2020 12:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597409937;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=nO0/MjQQyox7/4VnA3d/+ZuCcwRVsSuXYDCihhTuVL4=;
 b=VSrZ5mpgzAvRWubsRE2Y67PCwT+KUGEVm7aj5k1UWYwRAi1hMxLh+nV/
 jBh3c9o342WT2cztbRNYgo8zhOV2aqtkVzVphahui4c5RyYYiqDnfqBNC
 ZOXUrH1/gJquzMXHtXtEUwyKizqvX103gvtKxCj6RTXEoj1Pdm26FkUZd A=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rWQy7Xwl9wyGpZc0orNtUlYnrzqLiRTjXbqKOP3M1Kqu/eRVBlOM42YPSeSkPIn0H0RjXwMF7x
 1TIZ11w6LgY0DofCe7tNCuH1KBDYCHQPrhNqf5Z/DlLxx5QUfMvJnTwHjR8MvdtYsijvodg4jT
 patf2FETODDvdoa3/hPaY6eYx/hYAjFwfZHs+ZCiFQTzq90eTyJJwQvFZTMEf8LzXZOpJp/Q5k
 MQpFe5Um4SZAHMvTrthMbi5tm2baFdyx4zWVLMPguIYeVK8ywZM1+pw3940Gf3v6cqXSo9zzok
 1p4=
X-SBRS: 2.7
X-MesageID: 24876941
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,312,1592884800"; d="scan'208";a="24876941"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [OSSTEST PATCH] sg-report-flight: Use WITH OFFSET 0 for
 optimisation fence
Thread-Topic: [OSSTEST PATCH] sg-report-flight: Use WITH OFFSET 0 for
 optimisation fence
Thread-Index: AQHWci+HBhZqt2GTOkiXU/Pm77PGl6k3b2sA
Date: Fri, 14 Aug 2020 12:58:52 +0000
Message-ID: <F24A2254-3581-4390-9B83-9028C3B0E940@citrix.com>
References: <20200814113903.7674-1-ian.jackson@eu.citrix.com>
In-Reply-To: <20200814113903.7674-1-ian.jackson@eu.citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.1)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <2EB46CF4A4918D4587DDE17A8278ADCB@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gQXVnIDE0LCAyMDIwLCBhdCAxMjozOSBQTSwgSWFuIEphY2tzb24gPGlhbi5qYWNr
c29uQGV1LmNpdHJpeC5jb20+IHdyb3RlOg0KPiANCj4gSSBhbSBub3QgYmVzdCBwbGVhc2VkLg0K
PiANCj4gQ0M6IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAY2l0cml4LmNvbT4NCj4gU2ln
bmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+DQoNClJl
dmlld2VkLWJ5OiBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCkl0
IGlzIHRvbyBiYWQgdGhleeKAmXJlIG5vdCBiYWNrcG9ydGluZyB0aGUg4oCcdHVybiBvZmYgdGhl
IG9wdGltaXphdGlvbiB0aGF0IGJyZWFrcyBldmVyeW9uZeKAmXMgcXVlcmllc+KAnSBmZWF0dXJl
LiAgDQoNCkkgd2FzIGdvaW5nIHRvIHNheSB0aGF0IGBPRkZTRVQgMGAgbWlnaHQgYmUgcHJldHR5
IHN0YWJsZTsgYnV0IHVwb24gcmVmbGVjdGlvbiwgcGFzc2luZyBpbiBhIHplcm8gb2Zmc2V0IHRv
IGEgcXVlcnkgcHJvYmFibHkgaXNu4oCZdCBhY3R1YWxseSB0aGF0IHJhcmUgKGUuZy4sIHRoZSBm
aXJzdCBwYWdlIG9mIHNlYXJjaCByZXN1bHRzKS4gIEl0IGFjdHVhbGx5IGlzIHRoZSBraW5kIG9m
IHRoaW5nIHNvbWVvbmUgbWlnaHQgY29tZSBhbG9uZyBhbmQgZGVjaWRlIHRvIG9wdGltaXplLCB0
YWtpbmcgYSB3YXkgeWV0IGFub3RoZXIgZmVuY2UgZXZlcnlvbmUgd2FzIHVzaW5nLg0KDQpBbnl3
YXksIHdoYXQgY2FuIHlvdSBkby4=

