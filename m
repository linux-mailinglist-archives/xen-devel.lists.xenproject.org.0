Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A74F7AE1A2
	for <lists+xen-devel@lfdr.de>; Tue, 26 Sep 2023 00:25:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.608138.946444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qku16-0002Bc-QC; Mon, 25 Sep 2023 22:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 608138.946444; Mon, 25 Sep 2023 22:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qku16-00028Y-NK; Mon, 25 Sep 2023 22:25:24 +0000
Received: by outflank-mailman (input) for mailman id 608138;
 Mon, 25 Sep 2023 22:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LToL=FJ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qku15-00028S-Ka
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 22:25:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69eb6794-5bf2-11ee-9b0d-b553b5be7939;
 Tue, 26 Sep 2023 00:25:21 +0200 (CEST)
Received: from DU6P191CA0019.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::23)
 by AS8PR08MB6104.eurprd08.prod.outlook.com (2603:10a6:20b:299::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 22:25:14 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:540:cafe::20) by DU6P191CA0019.outlook.office365.com
 (2603:10a6:10:540::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.35 via Frontend
 Transport; Mon, 25 Sep 2023 22:25:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.19 via Frontend Transport; Mon, 25 Sep 2023 22:25:13 +0000
Received: ("Tessian outbound 30c9f5e988c5:v175");
 Mon, 25 Sep 2023 22:25:13 +0000
Received: from 07dd554e7e3c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1B121D44-27D9-4E94-9269-EF9B0B2867AC.1; 
 Mon, 25 Sep 2023 22:25:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 07dd554e7e3c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 25 Sep 2023 22:25:06 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAVPR08MB9818.eurprd08.prod.outlook.com (2603:10a6:102:31e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 22:25:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::dfff:49d6:ed04:118b%6]) with mapi id 15.20.6813.027; Mon, 25 Sep 2023
 22:25:04 +0000
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
X-Inumbo-ID: 69eb6794-5bf2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hsXxFAZ5C/jZmTBtfMl5pGpNmEwFhi413czhEw7fAw=;
 b=QxQ0b5Sip1LjYfwwqdP4HLX/6zuRWzIHyBTAIq03SsQJtEmTgk2qyCTeNEZ/JpXwpX1gchfcJa83HzOAEXQxr+07K+WX4Ta8e0FlT9YFywZI7bByEKlN8Lkuw4+AJrqTFY9tPf3rN3pqNd7TmU7Nt+C6+hqnMIcADEK/49ErIHc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4d9395fb802c0bef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=biTIDUiNu9Bq349XaEMPI1t01s2poHKbZcizmyHIsbf9jtS3slj2XuTZ1EFI+7Q0M4oRaN+HfAMwl1zd7FZfttxVHyH7wXrF35IhXatp7gLiylJU+mB1z+bw/UnRA6NH1ufV6pBYP9xaDQFoYRsnMOK/d29S+oZDOMhRoVX6CdMXEXcZkN3qeYyInsr8m7BD8tZAetQ3v93gT9KiwoOpHwGRKNAmJyo2id4aiJI8ZyLZF91suDgPxkne2mfL6mEoiuY5tzOwb01Q0ifDXhEMrdAP2UP5pAfD8SVs5v4SuSHYr+rA0r2zCcEfZN8+4k8FV+44T0HIjt/Mb8VrHOX4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0hsXxFAZ5C/jZmTBtfMl5pGpNmEwFhi413czhEw7fAw=;
 b=Z4iJVPIO9WNgnhEnKoXqwPFGxVsOreusHjIc3JfsyN9ez3kCRo3Ff4F3JdY53DTBaHvUm1f6Srj5rEJcRGd8kxjHsNBWG3V7TGatvyIpgK53SOtv6cnt7Kqo+1C0cyFmn7AR0L2iHTXynTCFAo7qJBQE1gpp3RwVevDkLk55Oe/RJPwqCedXHc82NvyWqXSRwmYSgh5pB+/RYn3qxGAhO7vWDmiOQyxIZCvTKFGBs5cVqz7UnA406JCaoWBolAMl0VIwcf8gK30w9myHUARj443917dTwn+IM8l1eFXghcm8L0KDuypLluL/9QgH9VAVNvhhn1hnl0twA5NqIJIYRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0hsXxFAZ5C/jZmTBtfMl5pGpNmEwFhi413czhEw7fAw=;
 b=QxQ0b5Sip1LjYfwwqdP4HLX/6zuRWzIHyBTAIq03SsQJtEmTgk2qyCTeNEZ/JpXwpX1gchfcJa83HzOAEXQxr+07K+WX4Ta8e0FlT9YFywZI7bByEKlN8Lkuw4+AJrqTFY9tPf3rN3pqNd7TmU7Nt+C6+hqnMIcADEK/49ErIHc=
From: Henry Wang <Henry.Wang@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: George Dunlap <george.dunlap@cloud.com>, Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>, "committers@xenproject.org"
	<committers@xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, "jgross@suse.com"
	<jgross@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
	"community.manager@xenproject.org" <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: Xen 4.18 release: Reminder about code freeze
Thread-Topic: Xen 4.18 release: Reminder about code freeze
Thread-Index:
 AQHZ705Dwyrpd4I60kahQfZlaJ2JtLArFXGAgAACIQCAADDfgIAACQ8AgAAQ+YCAAKbOAIAAFlKA
Date: Mon, 25 Sep 2023 22:25:04 +0000
Message-ID: <D7621E7B-3439-457E-AFBF-99305ACE80F2@arm.com>
References:
 <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
 <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
 <CA+zSX=YqQrcLcdsYeJS1qya_0zf1AHZFcA5g8i3DZvJ+R9PHLQ@mail.gmail.com>
 <24C421FD-4AC0-4CC6-94CB-A3394A41949B@arm.com>
 <alpine.DEB.2.22.394.2309251339120.1403502@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2309251339120.1403502@ubuntu-linux-20-04-desktop>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAVPR08MB9818:EE_|DBAEUR03FT027:EE_|AS8PR08MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 498764a0-91eb-4276-4e6f-08dbbe1649cf
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SSJLeRUJaThhhLRBhrRkXrw+OlXxPGR3zK+6SDC9IDZXCvF7f9C9tSBmZGkuMUC6Kmc/Walyzk+Y98A1H8dS6zMKiyTvsqoA9ezJfGb2tRMjLsWhhWMZ+wZ2jDWbuJxUZBsZo5Q+K1oCmb0f/SZOJYjsEWfwa1hOXUdzN+RfgaIrSFYhJIEnyATSjUO1LvoCaTMd0XKfB3QTl69hy3a/QrGkdOl0cecP6YUJvqfEt9qc5B9uCymFs93WirO3JtMpFuuMeCg9Ma9g7mI19nXi3HiY/Vd4q3SJG9uRWclSZiHYxfoTea3R8fn/kFeppD1TSIxX0bfY1nDETbmuzGgPRyXYhdiOk4ncYDXO5SLK0p5u2gDsq9wjwi7o+C0o59bNG6sqTM/uyD/GJSMp4v5eJwekqH4cTTD1MYGpRklr46fk3GTytxTmOl0LP3VVRa0Qd0vjkWHA9fHUg9Rg5cdSYufcn/+aXQiMq2fD4qEkB/rKQM4QMBwQqoJQEWLB99HyIUMlr+7Ca/426/dAfZH2R4mJxMtIwxErU/1klprB8p0FPzUeVE/IIc5LPb1fzxIfXyT5oS4Yt4he//BuRlcAIscTSdUmkGZA2nk2BLSbzDUzV1Qt0HbYmZZ0PrV61iRSeSrZ05EQ8Rbzrezj/M5mgw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(39860400002)(346002)(376002)(136003)(230922051799003)(1800799009)(186009)(451199024)(71200400001)(26005)(478600001)(66899024)(122000001)(2616005)(36756003)(86362001)(38070700005)(83380400001)(33656002)(6486002)(53546011)(5660300002)(38100700002)(6506007)(6512007)(4326008)(2906002)(8936002)(8676002)(316002)(41300700001)(54906003)(91956017)(66946007)(66556008)(66476007)(64756008)(66446008)(6916009)(7416002)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECFBDA35CBE35E458FC74F48CA01627D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9818
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10ecd97c-e6b1-4eb6-a0b5-08dbbe1643f7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XH7P9cW9EmC1d5oHyRO2rBdPnN8Xu7e1Fqw8x73UlktnNXKi8vmPDvtsBSfoqb6CrSts/6EjwWmdpQTS/DaAWTWcGzV7/S3feFKtVWwyhSxr7Mld9Si/QsfIApdUdS0a1gjsQ42naek3jB8V5DdVgS7sH4fcycPOGdtZM8PTAjS8rqss3jdiewLTC4AtTN+kAHTQhxOpxP+IF1t+VvLqVxO30mfkIxz4xPYFptacVFl7Qpglaz2RQoNpMzMxeN01HGhs8fIZbQzSosqd3KtFAyns4ZaR2beGZAVvHi36ebJVbVwZiZcb0XuGGkQkjsktfKd5Tx4ugFxm9+Su9ZNBUFunF4DYr7boP3gffq1170H2YZk4yGBbr+LgyT9gl+Va8BFZm0lXAugiK1uslBf1d4537iYvg6/cSXXW/MMqk6NGX3j47d5c4L5lTov6e/ghEEqA3wc0ctfwpm8C6uv9siZPbf8bv0IABV85jrG/JkBR8+75qbbK7s7YG+TwgeN/vCI7IXVU+f6YyytZ4ZBNlQJhX/4gOWhBhUI49NaxmExJjAqD7W/JjFKLC9EMktqS3Ur4uUCSXDr9m3SWPD9lanzpWf8w33TYmyboo7/b1d8WyU2K+5Lhz2LzjjHvrnz9Py5pdH+Nl4AMWuMlkMhnxvtgCeWCoacex9B7w3PJkk3f2dNeU2anHFN30bLN3o057II4TwRk09uYcr7XbAr/yJXkjKIcICeNIhiS1vQ/auDE7TeUJcu98TT7ofrR/ibR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(230922051799003)(186009)(82310400011)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(2906002)(40460700003)(86362001)(66899024)(33656002)(6512007)(5660300002)(6506007)(83380400001)(36756003)(53546011)(478600001)(81166007)(82740400003)(6486002)(47076005)(356005)(40480700001)(4326008)(8936002)(6862004)(8676002)(2616005)(41300700001)(26005)(336012)(70206006)(70586007)(54906003)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2023 22:25:13.9469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 498764a0-91eb-4276-4e6f-08dbbe1649cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6104

SGkgU3RlZmFubywNCg0KPiBPbiBTZXAgMjYsIDIwMjMsIGF0IDA1OjA1LCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gTW9uLCAyNSBT
ZXAgMjAyMywgSGVucnkgV2FuZyB3cm90ZToNCj4+PiBPbiBTZXAgMjUsIDIwMjMsIGF0IDE4OjA3
LCBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNsb3VkLmNvbT4gd3JvdGU6DQo+Pj4gT24g
TW9uLCBTZXAgMjUsIDIwMjMgYXQgMTA6MzXigK9BTSBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4+Pj4gT24gMjUvMDkvMjAyMyAwNzo0MCwgSGVucnkgV2FuZyB3cm90ZToN
Cj4+Pj4+PiBPbiBTZXAgMjUsIDIwMjMsIGF0IDE0OjMyLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPj4+Pj4+IFRoaXMsIGZvciBleGFtcGxlLCB3b3VsZCB0aGVuIGxp
a2VseSBtZWFuDQo+Pj4+Pj4gdGhhdCBhbGwgTWlzcmEgd29yayBub3cgbmVlZHMgcXVldWluZyBm
b3IgYWZ0ZXIgdGhlIHRyZWUgcmUtb3BlbnMgLi4uDQo+Pj4+PiANCj4+Pj4+IOKApkkgYWxzbyB0
aG91Z2h0IGFib3V0IHRoaXMsIHRvIGJlIGhvbmVzdCBJIGFtIHRlbXB0ZWQgdG8gbG9vc2UgdGhl
IGNvbnRyb2wNCj4+Pj4+IG9yIGF0IGxlYXN0IG9mZmVyIHNvbWUgZmxleGliaWxpdHkgb24gdGhp
cyBzcGVjaWZpYyBwYXJ0LCBhcyBub3JtYWxseSBNSVNSQQ0KPj4+Pj4gcmVsYXRlZCBjaGFuZ2Vz
IGFyZSBoYXJtbGVzcyBhbmQgYWN0dWFsbHkgaGFyZGVuIHRoZSBjb2RlLiBJIGFtIHdvbmRlcmlu
Zw0KPj4+Pj4gaWYgdGhlcmUgYXJlIGFueSBvYmplY3Rpb25zIGZyb20gb3RoZXJz4oCmDQo+Pj4+
PiANCj4+Pj4+IENvbW1pdHRlcnMsIHdvdWxkIHlvdSBtaW5kIHNoYXJpbmcgeW91ciBvcGluaW9u
IG9uIHRoaXMgb25lPyBUaGFua3MhDQo+Pj4+IA0KPj4+PiBJIGFtIHNwbGl0LiBPbiBvbmUgaGFu
ZCwgSSBhZ3JlZSB0aGV5IGxvdyByaXNrIGFuZCB3b3VsZCBiZSBnb29kIHRvIGhhdmUNCj4+Pj4g
dGhlbS4gQnV0IG9uIHRoZSBvdGhlciBoYW5kLCB0aGV5IHRlbmQgdG8gYmUgaW52YXNpdmUgYW5k
IG1heSBpbnRlcmZlcmUNCj4+Pj4gd2l0aCBhbnkgYnVnIHdlIG5lZWQgdG8gZml4IGR1cmluZyB0
aGUgaGFyZGVuaW5nIHBlcmlvZC4NCj4+PiANCj4+PiAqVGhlb3JldGljYWxseSogTUlTUkEgcGF0
Y2hlcyBzaG91bGQgaGF2ZSBubyBiZWhhdmlvcmFsIHNpZGUgZWZmZWN0czsNCj4+PiBidXQgaXQn
cyBxdWl0ZSBwb3NzaWJsZSB0aGF0IHRoZXkgd2lsbC4gSSdkIGJlIGluIGZhdm9yIG9mIGEgbW9y
ZQ0KPj4+IHN0cmljdCB2aWV3LCB0aGF0IHRoZXkgc2hvdWxkIGFsbCBnbyBvbiBhIHNlcGFyYXRl
IGJyYW5jaCAob3Igc2ltcGx5DQo+Pj4gYmUgcmV2aWV3ZWQgaW4tcHJpbmNpcGxlIGFuZCByZS1z
dWJtaXR0ZWQgYWZ0ZXIgd2UgYnJhbmNoKSBub3cgdGhhdA0KPj4+IHRoZSBmZWF0dXJlIGZyZWV6
ZSBpcyBkb25lLg0KPj4gDQo+PiBUaGFua3MgZm9yIHNoYXJpbmcgeW91ciBvcGluaW9uLiBJIGRl
ZmluaXRlbHkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4uIEkgdGhpbmsgaW4NCj4+IFhlbiBTdW1t
aXQgd2UgYWdyZWVkIHRoYXQgdGhlIHJlbGVhc2UgcHJvY2VzcyBzaG91bGQgbm90IGFmZmVjdCB0
aGUgbm9ybWFsDQo+PiBjb2RlIHJldmlldywgc28gTUlTUkEgcGF0Y2hlcyBjYW4gc3RpbGwgYmUg
cG9zdGVkIHRvIHRoZSBsaXN0IGFuZCBiZSByZXZpZXdlZC4NCj4+IFdoZW4gdGhlIHN0YWdpbmcg
cmVvcGVucywgdGhlc2Ugc3RhZ2VkIE1JU1JBIHBhdGNoZXMgY2FuIGJlIGNvbW1pdHRlZCByaWdo
dA0KPj4gYXdheS4NCj4+IA0KPj4+IFRoYXQncyBteSByZWNvbW1lbmRhdGlvbiwgYnV0IHVsdGlt
YXRlbHkgSSdkIGxlYXZlIHRoZSBkZWNpc2lvbiB0byBIZW5yeS4NCj4+IA0KPj4gU2luY2UgdGhp
cyBpcyBhYm91dCBNSVNSQSwgSSB3b3VsZCBsaWtlIHRvIHdhaXQgb25lIG1vcmUgZGF5IHRvIHNl
ZSBpZiB0aGVyZSBpcw0KPj4gYW55IGlucHV0IGZyb20gU3RlZmFubywgb3RoZXJ3aXNlIEkgdGhp
bmsgSnVsaWVu4oCZcyBzdWdnZXN0aW9uIGlzIHZlcnkgZ29vZCBzbw0KPj4gd2UgY2FuIGp1c3Qg
Zm9sbG93IHRoYXQgcHJvcG9zZWQgdGltZWxpbmUuDQo+IA0KPiBJIGFtIG5vdCBjb25jZXJuZWQg
YWJvdXQgTUlTUkEgQyBwYXRjaGVzIGJyZWFraW5nIHRoZSBidWlsZCBiZWNhdXNlDQo+IEJ1Z3Nl
bmcgaGFzIGJlZW4gcnVubmluZyBhbGwgdGhlaXIgcGF0Y2hlcyB0aHJvdWdoIGdpdGxhYi1jaSBi
ZWZvcmUNCj4gcG9zdGluZyB0aGVtIHRvIHhlbi1kZXZlbC4NCj4gDQo+IEkgYWdyZWUgd2l0aCBK
YW4gdGhhdCBvbiBhIGNhc2UgYnkgY2FzZSBiYXNpcyBzdGlsbCBhbGxvd2luZyBzb21lIE1JU1JB
DQo+IEMgcGF0Y2hlcyB0byBiZSBjb21taXR0ZWQgaXMgb2theS4gSSB0aGluayB0aGV5IHNob3Vs
ZCByZXF1aXJlIGENCj4gUmVsZWFzZS1hY2sgZnJvbSBIZW5yeSwgc28gSGVucnkgKGFuZCB0aGUg
bWFpbnRhaW5lcnMpIGNhbiBzdGlsbCBkZWNpZGUNCj4gd2hpY2ggb25lcyBhcmUgbG93IHJpc2sg
ZW5vdWdoIHRvIGdvIGluLCBhbmQgYWxzbyBsaW1pdCB0aGUgYW1vdW50IG9mDQo+IG92ZXJhbGwg
Y2h1cm4uIFRoaXMgbWVhbnMgdGhhdCBJIGV4cGVjdCB0aGF0IHdlIGFyZSBzbG93aW5nIGRvd24g
d2l0aA0KPiBNSVNSQSBDIGNvbW1pdHMuDQoNCisxDQoNCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxk
IHNsb3cgZG93biBmdXJ0aGVyIGFmdGVyIFJDMSB0byBvbmx5IGZldyBjb21taXRzIGFuZCB3ZQ0K
PiBzaG91bGQgc3RvcCBlbnRpcmVseSBhdCBzb21lIHBvaW50LCBtYXliZSBhdCBSQzIuIEkgd291
bGQgc3VnZ2VzdCBhZnRlcg0KPiBSQzIgZXZlbiB0aGUgbGVhc3QgY29udHJvdmVyc2lhbCBvZiB0
aGUgTUlTUkEgQyBmaXhlcyBzaG91bGQgbm90IGdvIGluLA0KPiB1bmxlc3MgaXQgaXMgYWxzbyBh
IGJ1ZyBmaXguIEFuZCBldmVuIGlmIGl0IGlzIGEgYnVnIGZpeCwgaXQgd291bGQgYmUgdXANCj4g
dG8gSGVucnkgdG8gZGVjaWRlIGlmIGl0IGlzIGEgYnVnIHdlIHdhbnQgdG8gZml4IGluIHRoaXMg
cmVsZWFzZSBvciBub3QuDQoNClRoaXMgaXMgYSByZWFzb25hYmxlIHBsYW4gYW5kIEkgdGhpbmsg
dGhpcyBpcyBhbHNvIGNvbnNpc3RlbnQgd2l0aCB0aGUgaWRlYQ0KcHJvcG9zZWQgYnkgSnVsaWVu
LCBzbyBJIGFtIG9rIHdpdGggaXQuIEkgd291bGQgbGlrZSB0byBzdWdnZXN0IHRoYXQgcGxlYXNl
DQpDQyBtZSBpbiB0aGUgcmVsZXZhbnQgcGF0Y2hlcyBiZWZvcmUgd2UgYnJhbmNoIG9mZiA0LjE4
IHNvIHRoYXQgSSBjYW4gcmVzcG9uZA0KaW4gdGltZS4gVGhhbmtzIQ0KDQpLaW5kIHJlZ2FyZHMs
DQpIZW5yeQ0KDQog

