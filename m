Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4ED23075D
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 12:12:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Mak-0007GD-LD; Tue, 28 Jul 2020 10:12:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z9cF=BH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1k0Mai-0007G8-P7
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 10:12:12 +0000
X-Inumbo-ID: cc88db48-d0ba-11ea-a88d-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc88db48-d0ba-11ea-a88d-12813bfff9fa;
 Tue, 28 Jul 2020 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595931130;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=wvjaajopii/5qeiGlm4RMJFm4dux7qZNErym3qfGlD8=;
 b=Ki3tUUWW01Sc9FwU9YedVkfo+hiVH6VBv+7Sp8mxEsd5P6F0X9d7mHZX
 BPlEhIklVl6wRtVuKR1rwPGWZE09avPQS3ApQpxPqE0BpBhsam1+iv8Mz
 bJGFJDggyVlRyJfFbUMcTXlcg8YsU7PwXF4IYExVcXu5N78qckRT/t/bR c=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9I0ZK56lX5DAzvZBQ8nzAh1NdX72NXPvnCcCoMj/FW6k3qYdDzLEF6Khr4an8wlkPhXKBueraU
 1WivZlftNwz9V0F9fGl9PW9NwKXbgoXNoZihQeAH/Bx/7ME/Lp42J8+MfJaq7/nEPvaFi2t4N+
 R1gMWQfv59G6GIeyLvge4MjQIVrazi7nL6OujHP0oZ5Qve1zgdw6yhtq3pHSUmjzz9oFxhKndH
 I/fIOMPmU3lCch/ia1eYEgHvhdSH0OXhirHiPXhP/drLVh9xcgmWcRyv0mTzvjMS5eodVXDCOm
 H54=
X-SBRS: 2.7
X-MesageID: 23344363
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,406,1589256000"; d="scan'208";a="23344363"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [[XSATOOL]] repo: Add missing spaces in the configure cmdline for
 "xentools"
Thread-Topic: [[XSATOOL]] repo: Add missing spaces in the configure cmdline
 for "xentools"
Thread-Index: AQHWZC+x8Lr8eJ8LdEOQDs5vOcX3hKkcpTEA
Date: Tue, 28 Jul 2020 10:12:06 +0000
Message-ID: <7AA2EA3C-EE42-4D3A-B266-03D38C25A6DB@citrix.com>
References: <20200727160415.717-1-julien@xen.org>
 <0299389e-bb24-6ec9-9fb4-18cc7c4ec181@xen.org>
In-Reply-To: <0299389e-bb24-6ec9-9fb4-18cc7c4ec181@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <700AE54022947B42AD1FFFF141FFD307@citrix.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gSnVsIDI3LCAyMDIwLCBhdCA1OjA0IFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IEhtbW0gSSBmb3Jnb3QgdG8gQ0MgR2VvcmdlLiBTb3JyeSBm
b3IgdGhhdC4NCj4gDQo+IE9uIDI3LzA3LzIwMjAgMTc6MDQsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+DQo+PiBUaGUgb3BlcmF0
b3IgKyB3aWxsIGp1c3QgY29uY2F0ZW5hdGUgdHdvIHN0cmluZ3MuIEFzIHRoZSByZXN1bHQsIHRo
ZQ0KPj4gY29uZmlndXJlIGNtZGxpbmUgZm9yICJ4ZW50b29scyIgd2lsbCBsb29rIGxpa2U6DQo+
PiAuL2NvbmZpZ3VyZSAtLWRpc2FibGUtc3R1YmRvbSAtLWRpc2FibGUtcWVtdS10cmFkaXRpb25h
bC0td2l0aC1zeXN0ZW0tcWVtdT0vYmluL2ZhbHNlIC0td2l0aC1zeXN0ZW0tc2VhYmlvcz0vYmlu
L2ZhbHNlLS1kaXNhYmxlLW92bWYNCj4+IFRoaXMgY2FuIGJlIGF2b2lkZWQgYnkgZXhwbGljaXRl
bHkgYWRkaW5nIHRoZSBzcGFjZXMuDQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpn
cmFsbEBhbWF6b24uY29tPg0KDQpPb3BzIOKAlCB0aGFua3MuDQoNClJldmlld2VkLWJ5OiBHZW9y
Z2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCg==

