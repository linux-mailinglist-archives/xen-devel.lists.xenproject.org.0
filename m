Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0037F600E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 14:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639746.997411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69bH-0002Xm-7y; Thu, 23 Nov 2023 13:18:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639746.997411; Thu, 23 Nov 2023 13:18:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r69bH-0002VC-4l; Thu, 23 Nov 2023 13:18:35 +0000
Received: by outflank-mailman (input) for mailman id 639746;
 Thu, 23 Nov 2023 13:18:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ez7b=HE=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1r69bF-0002Tm-Q0
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 13:18:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc2eb7da-8a02-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 14:18:31 +0100 (CET)
Received: from DB3PR06CA0015.eurprd06.prod.outlook.com (2603:10a6:8:1::28) by
 VI1PR08MB5310.eurprd08.prod.outlook.com (2603:10a6:803:135::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.20; Thu, 23 Nov 2023 13:18:27 +0000
Received: from DU6PEPF0000A7E1.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::63) by DB3PR06CA0015.outlook.office365.com
 (2603:10a6:8:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Thu, 23 Nov 2023 13:18:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E1.mail.protection.outlook.com (10.167.8.45) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.14 via Frontend Transport; Thu, 23 Nov 2023 13:18:27 +0000
Received: ("Tessian outbound 8289ea11ec17:v228");
 Thu, 23 Nov 2023 13:18:27 +0000
Received: from 9c3bc0fa9b3a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 679A1AC0-0ABD-4C9F-B42A-49F4B098F2AE.1; 
 Thu, 23 Nov 2023 13:18:16 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c3bc0fa9b3a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Nov 2023 13:18:16 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by GV1PR08MB10522.eurprd08.prod.outlook.com (2603:10a6:150:16b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20; Thu, 23 Nov
 2023 13:18:13 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::8da:b5c2:b334:838%7]) with mapi id 15.20.7025.020; Thu, 23 Nov 2023
 13:18:13 +0000
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
X-Inumbo-ID: cc2eb7da-8a02-11ee-98e2-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=XKRzZNQIpDocUxU/ceZSuBDvIICE8EdCAHAoJORRQwd4GPSP2JMoOvxhUFoVzeflgSviqQ+8j7BjF3pUL58kyYxrb7Rnhk3U3XWWX23ARa/FJBZ6K7ahziEdMcqkA3LqIniqg8B3tzYj/PYqIiozkqB6YdFFpJK6/sHuSIN0n6V0KloqxAFYCTJ+saoBlMUmX2ZWvRaupD75TQijNWnaFzMqawyPl7Palh1EWjy/wmP/eRKeWV5xmsGr+0ZQJdr6d++nKlZk6sksOH3yy5xR++6l0O6iym6SWONv72nQl1J7XVrEW9tDcqefTVhwEo7wypj+M/uBilx2RfJgJVo0/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQwfXJ5nzZTd20S+0kB7ST4T/DpW6ZZZ9hDRBn6UmPQ=;
 b=LfwJAKS5Iw2BbVVWSbRKUpwyaCo2EQsKhEJTJBwqX34s0k+jh1geAvafQdsNNq/nuYpsTE4umnba+ELqHl7S/iOdvfZWj+1cWaRSE5LTO0r7FBKNdV8KMit8kbxDTovJAYgGfksISdOp9MDlfELVIjKHLsxbHj6HIib+18LN167q8fqLsDGvZkJIWU2dXrRojDcklwZ+EaaMWXpB8znk3N30MW/ZhfWaZfttdbXq1qPeBN/bdm3CmHxa8XCVzyf9p1m0R1lrIS2NzaqdAp53CopPkSOV+/juCyRszRN7fhkIUK4hp7lswaS9ePOuYxIErymqYKKkDKaosoGP4WP++Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQwfXJ5nzZTd20S+0kB7ST4T/DpW6ZZZ9hDRBn6UmPQ=;
 b=AQkykSH3ILpLgEjJeOM1K7G1pdf+LSaAkvLLnfH2swKZsrZ4T9H5SZ4udaTkkaqLmfnqnb7Bwkw95iVq9/kQx4A/QjGuy6sIZf2lpZ6vnpvG1TwH6WMDKZbC61jXMeax10LJHnpT96Nsv6DqTJ34rBP1DKU2JeNXEI1IqFUcTvY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f25adea915b7cdd4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+f6bUXyfumi9Bq3B9dmsfuTolB3KGSSF97N9DoLArXfGA2bUSBNgEhgcKWm5VciIZ2csLDaCzBvIZhuBMyWe03KrMQX+bA0a8p+Zj3vKXK2g513iCtSWxdw1z5xTgOQeECHdmoqBBUSAukkFYqLw/vCFPndob8ke9zh1GCFTujZwC1qCv977kOrgJVHP1oy9Kb+l96Jcp0Z00NJZGy/TzKhkP3fCxq5WOLF/qJ0TL10xU5SLENr6gJOd9USLZeLU1l7BBjR4tT2iQOsm2EB+avENAfOGYvg6f/QYSHpfz6ZtPxkLFW5FwuHMdow0CqgmFVXZ+v/xntCW3PkAkJCDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQwfXJ5nzZTd20S+0kB7ST4T/DpW6ZZZ9hDRBn6UmPQ=;
 b=bm4ecVZSZaHldQFHDa8NwDQL6kp/ee5eH0Z8wT4M8QFPv54hhUpBx5zbwL6QZOfV4T2JD/GP0SX3LZ4FULMDhY7cgccJ5U+M21AqMIMDequDqlGkxMgdDVshdIwCUkjsOPaI76YDDenZ/QKS1RIZSpoN3VsH1yU0boe6O6krHMxf+kqXEkoCAbRhLZbwqL2LAdBpocK8GL4bsj4uJNPIIW20ULwb/wZW/uuUGrUvbNmjgvmLGVMvkarWvyymjLXSHlk4fo5EEZWoRzECLpkgrsvcB+msrdNiKf9fQMQOpZv6PDQHs/f25gVM4FDdcZnM0IGn3hRtdOM3ftx9TIlMAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQwfXJ5nzZTd20S+0kB7ST4T/DpW6ZZZ9hDRBn6UmPQ=;
 b=AQkykSH3ILpLgEjJeOM1K7G1pdf+LSaAkvLLnfH2swKZsrZ4T9H5SZ4udaTkkaqLmfnqnb7Bwkw95iVq9/kQx4A/QjGuy6sIZf2lpZ6vnpvG1TwH6WMDKZbC61jXMeax10LJHnpT96Nsv6DqTJ34rBP1DKU2JeNXEI1IqFUcTvY=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH] xen/efi: Drop image_name from efi_arch_handle_cmdline()
Thread-Topic: [PATCH] xen/efi: Drop image_name from efi_arch_handle_cmdline()
Thread-Index: AQHaHgF/OGRENIQ3z0S7KVyjXDqoiLCH4vaA
Date: Thu, 23 Nov 2023 13:18:13 +0000
Message-ID: <0FC16BD8-2B7D-4983-A8BD-563612202A89@arm.com>
References: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
In-Reply-To: <20231123113712.1933421-1-andrew.cooper3@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|GV1PR08MB10522:EE_|DU6PEPF0000A7E1:EE_|VI1PR08MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 9332bcb0-c257-4b3e-5f2a-08dbec26adee
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yShTTiKP4vdEmBuM6V4jUPs4Pf8iua3h8/Ph+CzTcGIIPumeTuh5+c5yX4h5P/Oiby5YaPNJRobr3w6QXGaDe3+dCiWVnAQW5lpSCEn5dVJKTjvjYqvdoypK4F63dAmp3wxmHupaaWkeUFwveEZbonY1NVuj0Df7NAex8WbMMRsFGhCYDtERP3yn8UThhmByd9VHHUtqS7Wfu6XmIKBfVA2RvugZg2t0zNjmFq+XO8NoX5GOCbhuOlOTYOuhJTAW3ifUr4jt3oTqREZFruv8TtXeJK2q3pmMuoxjtfW1ERnBMwMtSIoxmOYI8v5SBDmdy+Akqs067fqHlygRf4ktQkeVAqNxEXR9fL38txGl1fz6vRE+thKJ9BDj/nZ+5f7g2TMYE9RXywmbO5/1wBpMCW7zXPj3CJYeCtwGTX9+nMMzWevVYiVoED2ODvDwnXlJPvVBR1e38CKVxODO/d8e2/luMBRBYqogo9CJDyajE2qTGbklNrIeKQGLpZhLSjhrsKAwx/TorlcgSONR9EMjHjEQoeZa8YfqAdbX3J6EFHecOmV8IVxR2mPaNzjxgJqnlvP9x41LbTcjGAcP7OjrDWGtErWwTPpVURIRMZbySLA+8rbOkfZdR70n4H1vmU890f1INANngLYE8YXQ33pLdA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(396003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(26005)(71200400001)(53546011)(6506007)(478600001)(6486002)(2616005)(66556008)(66446008)(64756008)(66476007)(54906003)(91956017)(6916009)(66946007)(2906002)(316002)(76116006)(8676002)(5660300002)(4326008)(6512007)(4744005)(36756003)(38100700002)(41300700001)(86362001)(33656002)(38070700009)(8936002)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E5A70716A169D4F99FDB409F5AFC581@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10522
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6abd264a-1214-4678-50c5-08dbec26a5b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yddJ6nHXvmrSBhgE+45FHmat3+qVMPPHznhEmlRh77kb6srCUEviUTxMm9pidrfu8eIbT9ZaQg4Wr9m9wasBYCX7qKF1JfZI0mb222yb+bDUmPb1ZdsiKkh7vrdA2q033p7I1Extf/sB9eZTcEEPGffpPjGMJkrZVs+4R9wKkC7XKoLTiGdBDqUG4KM3F4zOo7eNfL+awCaRSMlwx2RV3+aCF188vCJ3iHal9rb87IW87XkCpmXbEcfViKqg5tFnNzXYs41KOWvkEczBimZVH0gptOTw0wcErAhYbOY26REx/SEZHMB4Cp4D1wZj+eGZrJ3bqNJZ3PXkGK6V2PUonOGMwlp9ym2DnbsXbCI9AmBxlCjOORitdSA/2YVxPFAMrHMj+HYZhVmL/219ydLlKlk/qFSz/f1iYSXnlrLFT3i7KVeV0FaL9iw6dbLtlDuwj0LNiB6HYbh1h4VGi2igZzbF7b8Gn3eC8yW69n38bWavOr+P73wjJS6AM6QCsQ3ktJ3KjkKI2mQymMwe2MbmR10tzoyG4nKCPP49XVNNVemTykHcDP+DGr8FaDHHsJpSV9P6EO3jX+YTaWHITcfXlIo7G52E9pOh5RTjCsyEBKZvSOxwsg5UDqfx7HiEN8xE3PCIuom8QLm/hNe4UTzmwReMkmiz66b6TUkIQfC6nX+AT8t4FfoGAqlHJLuYabnkYViVuHzPHMg9TJhB6W1IPw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39850400004)(346002)(230922051799003)(186009)(1800799012)(82310400011)(64100799003)(451199024)(46966006)(36840700001)(40480700001)(70586007)(70206006)(54906003)(36756003)(81166007)(356005)(82740400003)(33656002)(86362001)(36860700001)(53546011)(336012)(26005)(6506007)(6512007)(2616005)(2906002)(4744005)(316002)(6486002)(478600001)(8676002)(5660300002)(4326008)(47076005)(41300700001)(8936002)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2023 13:18:27.3893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9332bcb0-c257-4b3e-5f2a-08dbec26adee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E1.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5310

DQoNCj4gT24gMjMgTm92IDIwMjMsIGF0IDExOjM3LCBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29v
cGVyM0BjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IFdpdGggYWxsIGFyY2hpdGVjdHVyZXMgbm8g
bG9uZ2VyIHdhbnRpbmcgYW4gaW1hZ2UgbmFtZSBpbiB0aGUgY29tbWFuZCBsaW5lDQo+IGhhbmRs
aW5nLCBkcm9wIHRoZSBwYXJhbWV0ZXIgYW5kIGZvcmdvIG1ha2luZyBvbmUgdXAuDQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0K
PiAtLS0NCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4NCj4gQ0M6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBDQzogV2VpIExpdSA8d2xAeGVu
Lm9yZz4NCj4gQ0M6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4gQ0M6IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IENDOiBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+DQo+IENDOiBCZXJ0cmFuZCBNYXJxdWlz
IDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+IENDOiBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5v
cnplbEBhbWQuY29tPg0KPiAtLS0NCj4geGVuL2FyY2gvYXJtL2VmaS9lZmktYm9vdC5oIHwgIDMg
Ky0tDQoNClRlc3RlZCBvbiBBUk0gYm9hcmQNCg0KVGVzdGVkLWJ5OiBMdWNhIEZhbmNlbGx1IDxs
dWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0KDQo=

