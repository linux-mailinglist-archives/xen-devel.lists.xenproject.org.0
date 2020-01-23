Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B331464BA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 10:42:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuYwp-00084X-Ik; Thu, 23 Jan 2020 09:38:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iuYwo-00084S-Js
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 09:38:46 +0000
X-Inumbo-ID: 2013550c-3dc4-11ea-aecd-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2013550c-3dc4-11ea-aecd-bc764e2007e4;
 Thu, 23 Jan 2020 09:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579772316; x=1611308316;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iHBDwg3y3k/6c18YmoteyT6soCfrqPiMiIU5zC7vh1s=;
 b=BLwF+qhRw8ET0dc6lkTbgC0ibu4d1DyJY5NnzsjOoa1j0JAaSmTTp3W/
 3s5wSCc1WU9+dJrgL7io0fqLYCi2m+ehMQa30tVmelzOf0mwI7UEIbKSr
 tQs/ArRTTJlYbV39lfYuj/ejlLHKhK1/B/NkRXFVArffS9EfJxuthoGQw U=;
IronPort-SDR: nlnWkI4G8L9EJtqUymm0MkDpjNBpNBMDqQevMV/i61z11CamVTLCbvbLfMJUuxOLXr+uLtpvyj
 X1ba/cbM6pcw==
X-IronPort-AV: E=Sophos;i="5.70,353,1574121600"; d="scan'208";a="20553804"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 23 Jan 2020 09:38:24 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-2c665b5d.us-east-1.amazon.com (Postfix) with ESMTPS
 id DDD53A270D; Thu, 23 Jan 2020 09:38:21 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 09:38:21 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 09:38:20 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 09:38:20 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Lars Kurth <lars.kurth@citrix.com>, xen-devel
 <xen-devel@lists.xenproject.org>, "xen-api@lists.xenproject.org"
 <xen-api@lists.xenproject.org>, "win-pv-devel@lists.xenproject.org"
 <win-pv-devel@lists.xenproject.org>
Thread-Topic: [Vote] For Xen Project Code of Conduct (deadline March 31st)
Thread-Index: AQHVzWoFYs8FGD9/QUu11lcL/Sdp7Kf4BqXg
Date: Thu, 23 Jan 2020 09:38:19 +0000
Message-ID: <be3047bae26e4f27a43928bd2d406940@EX13D32EUC003.ant.amazon.com>
References: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
In-Reply-To: <63005C11-CF8C-4794-B9E4-C3856CCF41C1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.130]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [Vote] For Xen Project Code of Conduct (deadline
 March 31st)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "minios-devel@lists.xenproject.org" <minios-devel@lists.xenproject.org>,
 "committers@xenproject.org" <committers@xenproject.org>,
 "mirageos-devel@lists.xenproject.org" <mirageos-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiANCj4gUGVvcGxlIGFsbG93ZWQgdG8gdm90
ZSBvbiBiZWhhbGYgb2YgdGhlIEh5cGVydmlzb3IgcHJvamVjdCBhcmU6DQo+IEp1bGllbiBHcmFs
bCwgQW5keSBDb29wZXIsIEdlb3JnZSBEdW5sYXAsIElhbiBKYWNrc29uLCBKYW4gQmV1bGljaCwg
S29ucmFkDQo+IFINCj4gV2lsaywgU3RlZmFubyBTdGFiZWxsaW5pLCBXZWkgTGl1IGFuZCBQYXVs
IER1cnJhbnQgKGFzIFJlbGVhc2UgTWFuYWdlcikuDQoNCisxDQoNCj4gDQo+IFBlb3BsZSBhbGxv
d2VkIHRvIHZvdGUgb24gYmVoYWxmIG9mIHRoZSBYQVBJIHByb2plY3QgYXJlOg0KPiBDaGFuZHJp
a2EgU3Jpbml2YXNhbiwgQ2hyaXN0aWFuIExpbmRpZywgS29uc3RhbnRpbmEgQ2hyZW1tb3UsDQo+
IFJvYiBIb2VzLCBaaGFuZyBMaQ0KPiANCj4gUGVvcGxlIGFsbG93ZWQgdG8gdm90ZSBvbiBiZWhh
bGYgb2YgdGhlIFdpbmRvd3MgUFYgRHJpdmVyIFByb2plY3QgYXJlOg0KPiBQYXVsIER1cnJhbnQs
IEJlbiBDaGFsbWVycywgT3dlbiBTbWl0aA0KPiANCg0KKzENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
