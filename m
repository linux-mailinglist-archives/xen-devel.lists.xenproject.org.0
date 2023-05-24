Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DA270EF99
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 09:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538790.839029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1j6A-0006lq-FO; Wed, 24 May 2023 07:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538790.839029; Wed, 24 May 2023 07:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1j6A-0006jF-Bp; Wed, 24 May 2023 07:39:54 +0000
Received: by outflank-mailman (input) for mailman id 538790;
 Wed, 24 May 2023 07:39:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T5KZ=BN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1q1j69-0006iu-Px
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 07:39:53 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20631.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a195061-fa06-11ed-8611-37d641c3527e;
 Wed, 24 May 2023 09:39:50 +0200 (CEST)
Received: from AS9PR06CA0383.eurprd06.prod.outlook.com (2603:10a6:20b:460::30)
 by AS2PR08MB10055.eurprd08.prod.outlook.com (2603:10a6:20b:645::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 07:39:47 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:460:cafe::8e) by AS9PR06CA0383.outlook.office365.com
 (2603:10a6:20b:460::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Wed, 24 May 2023 07:39:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Wed, 24 May 2023 07:39:47 +0000
Received: ("Tessian outbound 3a01b65b5aad:v136");
 Wed, 24 May 2023 07:39:46 +0000
Received: from 78039e85eb6e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 146BB87C-85BA-4DE8-9FF6-9B914A89B9BF.1; 
 Wed, 24 May 2023 07:39:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 78039e85eb6e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 May 2023 07:39:40 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by PA4PR08MB5904.eurprd08.prod.outlook.com (2603:10a6:102:e5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Wed, 24 May
 2023 07:39:38 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::362c:56c7:5ea4:422e%7]) with mapi id 15.20.6433.015; Wed, 24 May 2023
 07:39:37 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2a195061-fa06-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivUBw/lSIJMGqEvNt20YZqVfNrYZCUitn8kD/5DRJVY=;
 b=82CZoqyQGlNFxBQ1QcGT540geuCvUP262asRBmSt8j2krmFyMgm0VsHKbUK0Zhk81SI2bN+PvDxzirx3aiyLNw2TXLIEbKsimlzCBIA23x+6mGJmTQmozv+Jtf6JZkKxxthJ03U+DSwLasM3LlAuBWzfX7L3MDlbPp0McuzZpXQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: da272b1aa70f8e20
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBRscVxlWrz4dtQHFi+LvG6p8BRevPH2c045uh/2xjacwbU3ixd+O0WjXhojM+XsAdGNseghHryIfCQqhjXYuuIqJ8WQgLOlQh8mrbKUgRLpuNmRgaKgMg5b2CqKqWdf0Po+Vjs5LuSMUuZLugXR0B/mCApFIbAGJ+JU4EY4Tj7m+B/7nhhF7mPDsMLv+0uC2+qPiRl4zw4OP6rLQzrdfAOuIRQrTgdTQ9SCTUCVvWdyTeCfo9cIBDlJhmkkJNlYxbwIv0fxAaOhc2Ui+YVnU8hGgWdbSpqM73f4Dft+noUrj4q+7pRs7USZ5qy0b36xVMsRE11/cn84xB4+Abw4cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ivUBw/lSIJMGqEvNt20YZqVfNrYZCUitn8kD/5DRJVY=;
 b=ByNxx17tXQVnX+CkXTWe4FgU4wADEVsf8HjmS+OuyKf00r8UVC2AnObOZz8Lq4KDbv+AAj0hjbfEW8M8UpNmF90MZkoenbu1sr8aurW4iNr0kw1aX919LznoembGpxbzcAultZ6geFW4wMl6V7TuCgGdOR6a8Shpx8kIDCDMaaF7Ttfg14Q0wwE0hNo3mQg3iz7sH8ofX/Imy84IjzG7vbMau9tFSMviFfi55HxeOj2kKoRizaMiGGRn0XW9Nz2Jt9aX/MR6ICs/vdOqfesLoaD4ydb0gadkONCaJwDXyMiy7vVR0TnEkAqT54N3fqOhOk/UAWDnUs1yJF+wpr+LDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivUBw/lSIJMGqEvNt20YZqVfNrYZCUitn8kD/5DRJVY=;
 b=82CZoqyQGlNFxBQ1QcGT540geuCvUP262asRBmSt8j2krmFyMgm0VsHKbUK0Zhk81SI2bN+PvDxzirx3aiyLNw2TXLIEbKsimlzCBIA23x+6mGJmTQmozv+Jtf6JZkKxxthJ03U+DSwLasM3LlAuBWzfX7L3MDlbPp0McuzZpXQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Thread-Topic: [XEN PATCH 02/15] build: rework asm-offsets.* build step to use
 kbuild
Thread-Index: AQHZjZUYHIYuuKOi9UK9bl3DPb8C/K9pCpGA
Date: Wed, 24 May 2023 07:39:37 +0000
Message-ID: <CBAF4CF3-C7DD-4071-9321-5EC7BEA1D432@arm.com>
References: <20230523163811.30792-1-anthony.perard@citrix.com>
 <20230523163811.30792-3-anthony.perard@citrix.com>
In-Reply-To: <20230523163811.30792-3-anthony.perard@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.500.231)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|PA4PR08MB5904:EE_|AM7EUR03FT029:EE_|AS2PR08MB10055:EE_
X-MS-Office365-Filtering-Correlation-Id: abb8fcbc-6a38-44e4-d279-08db5c2a0c7d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rpWu1bFWFBc58CEASeb2PZuy892jF0yvbjHGAqVqVizF/iSrVg9LEOlHv2IqJE41B/MVuButBQVurNjw68PD21R+ajVVW7080YN75prinWC+0R6bzTaR+yRxHpGTbyT6QIKNsT+FLtClU7soFXIfn3lbkcULGuET93cjHKVOMdK4sghG5HnBQFONe1n4aWCsTxTgTG1Vm6E7tvQ2LNN6BNmjiVParTs2ajhLLk358+5axuLTGd4etg6YxHSONYBhYY/lIvC2A75sbJyvd/EkcEE0ikxUAVpNSDTaVcTi3FCrFaD1irGNjEm2wzn/KRkYOm0UPe35jH74tU2s8OGCQQ82BA2om4ImxUeO1KTW7EC7tQTiKs9u5a8kBFKykES2BX9pjNCPZIIUH1A3ym4CVnhQI2A2BCgrbuBjvdFipCU3lufWmm5BeL9BrM7jwkAccWugcRBPFSGiMIhDPCxCsJQLctZcS5CHXdty0ahSl1T0bNOADfGhmb4Bz2T3SXRa+Ex+Hb8+fkaq2uOcKBDI1c9pbRyNUCkjVUhJcFmhlOQO5NqGLSnPM4CzLOtxXGfvXjaLuzJgWWwm9iAAPqtEy0lz18z/Iz0YQ3EJ9woVmM27Lf6r6xlaQcL7M7wVtOQDQXEAb6HqoSlikfX1CHzYEA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199021)(6486002)(8676002)(5660300002)(2906002)(8936002)(316002)(66946007)(4326008)(6916009)(64756008)(66476007)(66446008)(91956017)(66556008)(76116006)(54906003)(478600001)(33656002)(83380400001)(2616005)(71200400001)(53546011)(186003)(26005)(36756003)(6506007)(6512007)(41300700001)(38100700002)(38070700005)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3CF09667F70DA94BB7DD1A779AA058B0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5904
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d2df5d9-f67f-48ef-2692-08db5c2a0700
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sLZlkL1FsgFN9AK96B9fSD2EYr5ATci3nf45v0/T8YmtaoD0P+d8BVGYPxXepjxBdVEPVmh0fDnZfcuOo+7/krYXNTJ5961SwxC0IUp+fhaq2CeNIPkH4Wq4DeUHU9dFA2yDtD4PFsfnFFFjhHY8DnX7PC1Dl6cXGW1+LbMp5w2gSLLXnHtjLwtyio2jKuovl8oPVElzuYT6/bUeVYsnZtmX9e3XbR+SfcfiI1Ka/VXVRoUDg77PwUP4UM6dpiMbR6E4+w/aOva19oAcyySiE7YPYRVoGVcEv8JBs2PFY2X1RfEkOJ7499mTbIMda52Py2A4AxLCyp5042n+Hfgz3m1hHVWELk8K4llD8+m366x8QjU38gzHJAaZnjtj4PA9NJMVL7VkiSeNbpcA0Oq89k0fSN2+59hjuzHaLvk1IcS0u4NzMa/AXu0apqM6VsSibFkRZ9TLQyZru5NuheIxDuW+VfGLTs9k1ET8QUjOfoKA2dN596fIPGDDjxujsHuV28qWnsFDAsxm9FMTNHZjHh2UBFjVr0mU5R3AnJvQHBKwm+ImShD9zc4qLvc9U+L5Nu9Lot2H1SS0ecZsidz5sxfr3NyHGB+Fh1QtjZgV3fk/6iJjAM/F3zmvOmXNhmyfLjZRIEiRM67CqE5IZGCNj9W8QpOMv1m5H/hne4i8YvqJv+rM2sDkJ8y1A0m+OP4qrbo0GYwr6bnxep3YSbLiOXgD3g+M2ysfUKFb8xo639GzQLr8vNEE5smsQb/Z5Oyi
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(336012)(36860700001)(47076005)(83380400001)(4326008)(70586007)(70206006)(6486002)(2616005)(54906003)(6506007)(26005)(6512007)(53546011)(478600001)(186003)(2906002)(86362001)(8936002)(6862004)(8676002)(36756003)(33656002)(5660300002)(81166007)(40460700003)(316002)(356005)(82740400003)(40480700001)(41300700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 07:39:47.0386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abb8fcbc-6a38-44e4-d279-08db5c2a0c7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10055

DQoNCj4gT24gMjMgTWF5IDIwMjMsIGF0IDE3OjM3LCBBbnRob255IFBFUkFSRCA8YW50aG9ueS5w
ZXJhcmRAY2l0cml4LmNvbT4gd3JvdGU6DQo+IA0KPiBVc2UgJChpZl9jaGFuZ2VkX2RlcCwgKSBt
YWNybyB0byBnZW5lcmF0ZSAiYXNtLW9mZnNldHMucyIgYW5kIHJlbW92ZQ0KPiB0aGUgdXNlIG9m
ICQobW92ZS1pZi1jaGFuZ2VzLCkuIFRoYXQgbWVhbiB0aGF0ICJhc20tb2Zmc2V0LnMiIHdpbGwg
YmUNCj4gY2hhbmdlZCBldmVuIHdoZW4gdGhlIG91dHB1dCBkb2Vzbid0IGNoYW5nZS4NCj4gDQo+
IEJ1dCAiYXNtLW9mZnNldHMucyIgaXMgb25seSB1c2VkIHRvIGdlbmVyYXRlZCAiYXNtLW9mZnNl
dHMuaCIuIFNvDQo+IGluc3RlYWQgb2YgcmVnZW5lcmF0aW5nICJhc20tb2Zmc2V0cy5oIiBldmVy
eSB0aW1lICJhc20tb2Zmc2V0cy5zIg0KPiBjaGFuZ2UsIHdlIHdpbGwgdXNlICIkKGZpbGVjaGss
ICkiIHRvIG9ubHkgdXBkYXRlIHRoZSAiLmgiIHdoZW4gdGhlDQo+IG91dHB1dCBjaGFuZ2UuIEFs
c28sIHdpdGggIiQoZmlsZWNoaywgKSIsIHRoZSBmaWxlIGRvZXMgZ2V0DQo+IHJlZ2VuZXJhdGVk
IHdoZW4gdGhlIHJ1bGUgY2hhbmdlIGluIHRoZSBtYWtlZmlsZS4NCj4gDQo+IFRoaXMgY2hhbmdl
cyBhbHNvIHJlc3VsdCBpbiBhIGNsZWFuZXIgYnVpbGQgbG9nLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQo+IC0tLQ0KPiAN
Cj4gSW5zdGVhZCBvZiBoYXZpbmcgYSBzcGVjaWFsICQoY21kX2FzbS1vZmZzZXRzLnMpIGNvbW1h
bmQsIHdlIGNvdWxkDQo+IHByb2JhYmx5IHJldXNlICQoY21kX2NjX3NfYykgZnJvbSBSdWxlcy5t
aywgYnV0IHRoYXQgd291bGQgbWVhbiB0aGF0DQo+IGFuIGh5cG90aGV0aWNhbCBhZGRpdGlvbmFs
IGZsYWdzICItZmx0byIgaW4gQ0ZMQUdTIHdvdWxkIG5vdCBiZQ0KPiByZW1vdmVkIGFueW1vcmUs
IG5vdCBzdXJlIGlmIHRoYXQgbWF0dGVyIGhlcmUuDQo+IA0KPiBCdXQgdGhlbiB3ZSBjb3VsZCB3
cml0ZSB0aGlzOg0KPiANCj4gdGFyZ2V0cyArPSBhcmNoLyQoVEFSR0VUX0FSQ0gpLyQoVEFSR0VU
X1NVQkFSQ0gpL2FzbS1vZmZzZXRzLnMNCj4gYXJjaC8kKFRBUkdFVF9BUkNIKS8kKFRBUkdFVF9T
VUJBUkNIKS9hc20tb2Zmc2V0cy5zOiBDRkxBR1MteSArPSAtZzANCj4gYXJjaC8kKFRBUkdFVF9B
UkNIKS9pbmNsdWRlL2FzbS9hc20tb2Zmc2V0cy5oOiBhcmNoLyQoVEFSR0VUX0FSQ0gpLyQoVEFS
R0VUX1NVQkFSQ0gpL2FzbS1vZmZzZXRzLnMgRk9SQ0UNCj4gDQo+IGluc3RlYWQgb2YgaGF2aW5n
IHRvIHdyaXRlIGEgcnVsZSBmb3IgYXNtLW9mZnNldHMucw0KDQpUaGUgc29sdXRpb24gYWJvdmUg
c2VlbXMgY2xlYW4sIG1heWJlIEkgYW0gd3JvbmcgYnV0IC1mbHRvIHNob3VsZCBub3QgbWF0dGVy
IGhlcmUgYXMgd2UgYXJlDQpub3QgYnVpbGRpbmcgb2JqZWN0cyB0byBpbmNsdWRlIGluIHRoZSBm
aW5hbCBidWlsZCwgaXNu4oCZdCBpdD8gQW5kIGdjYyBkb2N1bWVudGF0aW9uIHN0YXRlcyBqdXN0
Og0KDQrigJxJdCBpcyByZWNvbW1lbmRlZCB0aGF0IHlvdSBjb21waWxlIGFsbCB0aGUgZmlsZXMg
cGFydGljaXBhdGluZyBpbiB0aGUgc2FtZSBsaW5rIHdpdGggdGhlIHNhbWUNCm9wdGlvbnMgYW5k
IGFsc28gc3BlY2lmeSB0aG9zZSBvcHRpb25zIGF0IGxpbmsgdGltZS4iDQoNCknigJl2ZSBhbHNv
IHRlc3RlZCB0aGlzIHBhdGNoIGFuZCBpdCB3b3JrcyBmaW5lLCBJIGhhdmUgdG8gc2F5IGhvd2V2
ZXIgdGhhdCBJIHByZWZlcnJlZA0KYSBtb3JlIHZlcmJvc2Ugb3V0cHV0LCBzbyB0aGF0IHBlb3Bs
ZSBjYW4gY2hlY2sgaG93IHdlIGFyZSBpbnZva2luZyB0aGUgY29tcGlsZXIsDQpidXQgSSBndWVz
cyBub3cgaXTigJlzIG1vcmUgY29uc2lzdGVudCB3aXRoIHRoZSBvdGhlciBpbnZvY2F0aW9ucyB0
aGF0IGRvZXNu4oCZdCBwcmludA0KdGhlIGNvbXBpbGVyIGludm9jYXRpb24uDQoNClNvIGlmIHlv
dSB3YW50IHRvIHByb2NlZWQgd2l0aCB0aGlzIG9uZSwgZm9yIG1lIGxvb2tzIGZpbmU6DQoNClJl
dmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQpUZXN0ZWQt
Ynk6IEx1Y2EgRmFuY2VsbHUgPGx1Y2EuZmFuY2VsbHVAYXJtLmNvbT4NCg0KDQo=

