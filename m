Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB814CA91C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 16:34:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282355.481036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQyb-0005zS-4J; Wed, 02 Mar 2022 15:33:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282355.481036; Wed, 02 Mar 2022 15:33:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPQyb-0005wV-0S; Wed, 02 Mar 2022 15:33:17 +0000
Received: by outflank-mailman (input) for mailman id 282355;
 Wed, 02 Mar 2022 15:33:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sydv=TN=amazon.de=prvs=053930d30=doebel@srs-se1.protection.inumbo.net>)
 id 1nPQyX-0005wP-Qr
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 15:33:15 +0000
Received: from smtp-fw-2101.amazon.com (smtp-fw-2101.amazon.com [72.21.196.25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10bdcd0e-9a3e-11ec-8eba-a37418f5ba1a;
 Wed, 02 Mar 2022 16:33:11 +0100 (CET)
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-iad-1e-98691110.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-2101.iad2.amazon.com with ESMTP; 02 Mar 2022 15:32:58 +0000
Received: from EX13D03EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-iad-1e-98691110.us-east-1.amazon.com (Postfix) with
 ESMTPS id 12D2C852FD; Wed,  2 Mar 2022 15:32:56 +0000 (UTC)
Received: from EX13D03EUC002.ant.amazon.com (10.43.164.60) by
 EX13D03EUC004.ant.amazon.com (10.43.164.33) with Microsoft SMTP Server (TLS)
 id 15.0.1497.28; Wed, 2 Mar 2022 15:32:56 +0000
Received: from EX13D03EUC002.ant.amazon.com ([10.43.164.60]) by
 EX13D03EUC002.ant.amazon.com ([10.43.164.60]) with mapi id 15.00.1497.028;
 Wed, 2 Mar 2022 15:32:55 +0000
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
X-Inumbo-ID: 10bdcd0e-9a3e-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
  t=1646235192; x=1677771192;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:mime-version:content-transfer-encoding:subject;
  bh=roP0bwPivzOGjJjDU7tKd3dkm1SoTU4LrZ3IvYjnY38=;
  b=heVug5jcnjX4VDHtg5+ScqSD+wSiKPWwvYOh4IaKtXSzEakwQCm9UD6u
   hgK+NlLqmElAbUlo7sDmhGSorRVb47Nc7K+lgqIHAhMtiGOn4xXm7s70B
   HNycSmZIFZt1Pdn1K+dRKdu6NkYjr3zScMv4lD6VGFC3m3uKVSFca4OQ2
   Q=;
X-IronPort-AV: E=Sophos;i="5.90,149,1643673600"; 
   d="scan'208";a="177884295"
Subject: Re: [PATCH 1/4] livepatch: update readme to mention --xen-depends
Thread-Topic: [PATCH 1/4] livepatch: update readme to mention --xen-depends
From: "Doebel, Bjoern" <doebel@amazon.de>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "ross.lagerwall@citrix.com" <ross.lagerwall@citrix.com>,
	"konrad.wilk@oracle.com" <konrad.wilk@oracle.com>, "julien@xen.org"
	<julien@xen.org>, "Andrew.Cooper3@citrix.com" <Andrew.Cooper3@citrix.com>
Thread-Index: AQHYLkHpkyqw0otv8UqarS2xkvT+RKysSdKA
Date: Wed, 2 Mar 2022 15:32:55 +0000
Message-ID: <1C97765C-3A3A-4FB5-9242-1F9DB3E9DDF6@amazon.com>
References: <20220302142711.38953-1-roger.pau@citrix.com>
 <20220302142711.38953-2-roger.pau@citrix.com>
In-Reply-To: <20220302142711.38953-2-roger.pau@citrix.com>
Accept-Language: en-US, de-DE
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A601BFA200C02489496C652D79A876D@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Content-Transfer-Encoding: base64

ICAgIEZpeGVzOiBiMTlkZjdiMmMwNWUgKCdsaXZlcGF0Y2gtYnVpbGQ6IEVtYmVkIGh5cGVydmlz
b3IgYnVpbGQgaWQgaW50byBldmVyeSBob3RwYXRjaCcpDQogICAgU2lnbmVkLW9mZi1ieTogUm9n
ZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQogICAgLS0tDQogICAgIFJFQURN
RS5tZCB8IDIgKy0NCiAgICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQoNCiAgICBkaWZmIC0tZ2l0IGEvUkVBRE1FLm1kIGIvUkVBRE1FLm1kDQogICAgaW5k
ZXggNjUzYzYyNC4uYjQ4YTNkZiAxMDA2NDQNCiAgICAtLS0gYS9SRUFETUUubWQNCiAgICArKysg
Yi9SRUFETUUubWQNCiAgICBAQCAtMjQsNyArMjQsNyBAQCBOZXh0LCBidWlsZCBhIGxpdmUgcGF0
Y2gsIHVzaW5nIGEgcGF0Y2ggYW5kIHRoZSBzb3VyY2UsIGJ1aWxkIElELCBhbmQNCiAgICAgYGBg
DQogICAgICQgY2Qgfi9zcmMvbGl2ZXBhdGNoLWJ1aWxkDQogICAgICQgLi9saXZlcGF0Y2gtYnVp
bGQgLXMgfi9zcmMveGVuYnVpbGQgLXAgfi9zcmMveHNhLnBhdGNoIC1vIG91dCBcDQogICAgLSAg
ICAtYyB+L3NyYy94ZW4veGVuLy5jb25maWcgLS1kZXBlbmRzICRCVUlMRElEDQogICAgKyAgICAt
YyB+L3NyYy94ZW4veGVuLy5jb25maWcgLS1kZXBlbmRzICRCVUlMRElEIC0teGVuLWRlcGVuZHMg
JEJVSUxESUQNCiAgICAgQnVpbGRpbmcgTGl2ZVBhdGNoIHBhdGNoOiB4c2ENCg0KDQpSZXZpZXdl
ZC1ieTogQmpvZXJuIERvZWJlbCA8ZG9lYmVsQGFtYXpvbi5kZT4NCg0KCgoKQW1hem9uIERldmVs
b3BtZW50IENlbnRlciBHZXJtYW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdl
c2NoYWVmdHNmdWVocnVuZzogQ2hyaXN0aWFuIFNjaGxhZWdlciwgSm9uYXRoYW4gV2Vpc3MKRWlu
Z2V0cmFnZW4gYW0gQW10c2dlcmljaHQgQ2hhcmxvdHRlbmJ1cmcgdW50ZXIgSFJCIDE0OTE3MyBC
ClNpdHo6IEJlcmxpbgpVc3QtSUQ6IERFIDI4OSAyMzcgODc5CgoK


