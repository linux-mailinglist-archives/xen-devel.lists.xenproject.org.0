Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2251009AC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 17:49:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWkBT-0003QT-0Y; Mon, 18 Nov 2019 16:47:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MHAF=ZK=amazon.de=prvs=218f0b807=wipawel@srs-us1.protection.inumbo.net>)
 id 1iWkBR-0003QO-Gy
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 16:47:25 +0000
X-Inumbo-ID: 18b88dba-0a23-11ea-a2d9-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 18b88dba-0a23-11ea-a2d9-12813bfff9fa;
 Mon, 18 Nov 2019 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1574095646; x=1605631646;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=9k4g2brHpb5Lrel7gReEORkXMrBS2yonLrc5AHQ/L6E=;
 b=bUJK5DnYgOYWlnysreiRoWY3kIkCueoNp9+DOsYtl8bg07ia8FGbZbIi
 JaAuH74c1k8S+20OWS+HXf8uXgPar1AaLAOj5LRjG8pryfw9GYxZJ7H0L
 K5ruVvIdXsZyfFlOJdeE3e+5Whg2Yqk7YR6p43q49LO1Rws5OcxRXMHey M=;
IronPort-SDR: TAzFf4RxwP/kpWvuEOB8sUFmaNKOf9i/HDkEje/gINiRt8cRXm1Q/+qLaurinjyLYfnK7gNdYH
 mKpcmuDWm6/g==
X-IronPort-AV: E=Sophos;i="5.68,320,1569283200"; 
   d="scan'208";a="8613221"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-f273de60.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 18 Nov 2019 16:47:21 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-f273de60.us-east-1.amazon.com (Postfix) with ESMTPS
 id E41D2A17F5; Mon, 18 Nov 2019 16:47:18 +0000 (UTC)
Received: from EX13D16EUB002.ant.amazon.com (10.43.166.134) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 18 Nov 2019 16:47:17 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D16EUB002.ant.amazon.com (10.43.166.134) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 18 Nov 2019 16:47:17 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Mon, 18 Nov 2019 16:47:17 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Sergey Dyasli <sergey.dyasli@citrix.com>
Thread-Topic: livepatch-build-tools regression
Thread-Index: AQHVni9ReRquixYoHEOXl3oCOkZoJaeRI0wA
Date: Mon, 18 Nov 2019 16:47:17 +0000
Message-ID: <DD847497-6517-4668-9AD6-66F11B91288A@amazon.com>
References: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
In-Reply-To: <5ef38d72-3a80-e2ef-68d9-ec498866d4eb@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.248]
Content-ID: <EEC33FD4E09085498F2800D06FF59CF2@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] livepatch-build-tools regression
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "Paraschiv, Andra-Irina" <andraprs@amazon.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 "Manthey, 
 Norbert" <nmanthey@amazon.de>, Martin Mazein <amazein@amazon.de>,
 Xen-devel <xen-devel@lists.xenproject.org>, "Doebel,
 Bjoern" <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBOb3YgMjAxOSwgYXQgMTc6NDIsIFNlcmdleSBEeWFzbGkgPHNlcmdleS5keWFz
bGlAY2l0cml4LmNvbT4gd3JvdGU6Cj4gCj4gSGVsbG8sCj4gCj4gVHJ5aW5nIHRvIGJ1aWxkIGEg
c2ltcGxlIHZlcnNpb24gb2YgWFNBLTMwNCBMaXZlLVBhdGNoIGZvciA0LjEzIGdpdmVzCj4gdGhl
IGZvbGxvd2luZyBlcnJvciBkdXJpbmcgTFAgdXBsb2FkOgo+IAo+ICAgIChYRU4pIGxpdmVwYXRj
aDogbHA6IFVua25vd24gc3ltYm9sOiAuTEM3Cj4gCj4gQmlzZWN0aW5nIGlkZW50aWZpZWQgdGhl
IGZpcnN0IGJhZCBjb21taXQgYXM6Cj4gCj4gICAgY29tbWl0IDg1NGE3Y2E2MGUzNSAiY3JlYXRl
LWRpZmYtb2JqZWN0OiBEbyBub3QgaW5jbHVkZSBhbGwgLnJvZGF0YSBzZWN0aW9ucyIKPiAKPiBC
YXNlIHZlcnNpb24gb2YgWGVuIHVzZWQgZm9yIHRoaXMgZXhwZXJpbWVudCBpcyBkMTNkZmIwMmFh
ZmFiCj4gVGhlIHBhdGNoIGZpbGUgdXNlZCBmb3IgTFAgaXMgYXR0YWNoZWQuCj4gCj4gLS0KPiBU
aGFua3MsCj4gU2VyZ2V5Cj4gPDAwMDEtbGl2ZS1wYXRjaC5wYXRjaD4KCkNvdWxkIHlvdSBnaXZl
IHRoaXMgYSB0cnk/CgpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjI4MTkx
LwpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMjI4MTg5LwoKQmVzdCBSZWdh
cmRzLApQYXdlbCBXaWVjem9ya2lld2ljegoKCgoKCgpBbWF6b24gRGV2ZWxvcG1lbnQgQ2VudGVy
IEdlcm1hbnkgR21iSApLcmF1c2Vuc3RyLiAzOAoxMDExNyBCZXJsaW4KR2VzY2hhZWZ0c2Z1ZWhy
dW5nOiBDaHJpc3RpYW4gU2NobGFlZ2VyLCBSYWxmIEhlcmJyaWNoCkVpbmdldHJhZ2VuIGFtIEFt
dHNnZXJpY2h0IENoYXJsb3R0ZW5idXJnIHVudGVyIEhSQiAxNDkxNzMgQgpTaXR6OiBCZXJsaW4K
VXN0LUlEOiBERSAyODkgMjM3IDg3OQoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
