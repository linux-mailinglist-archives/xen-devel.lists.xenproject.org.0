Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE49D3169B8
	for <lists+xen-devel@lfdr.de>; Wed, 10 Feb 2021 16:06:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83643.156177 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9r4Q-0007SF-SG; Wed, 10 Feb 2021 15:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83643.156177; Wed, 10 Feb 2021 15:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9r4Q-0007Rq-P2; Wed, 10 Feb 2021 15:06:22 +0000
Received: by outflank-mailman (input) for mailman id 83643;
 Wed, 10 Feb 2021 15:06:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c5iL=HM=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1l9r4P-0007Rk-En
 for xen-devel@lists.xenproject.org; Wed, 10 Feb 2021 15:06:21 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 04b2ac3d-dac3-4104-8648-c2ca44a8a040;
 Wed, 10 Feb 2021 15:06:18 +0000 (UTC)
Received: from MR2P264CA0022.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:1::34) by
 DBAPR08MB5717.eurprd08.prod.outlook.com (2603:10a6:10:1ae::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25; Wed, 10 Feb 2021 15:06:10 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:1:cafe::dd) by MR2P264CA0022.outlook.office365.com
 (2603:10a6:500:1::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.27 via Frontend
 Transport; Wed, 10 Feb 2021 15:06:10 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.25 via Frontend Transport; Wed, 10 Feb 2021 15:06:09 +0000
Received: ("Tessian outbound f362b81824dc:v71");
 Wed, 10 Feb 2021 15:06:09 +0000
Received: from aa200058ee94.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF807945-DADE-4B75-9224-98CF085B72FA.1; 
 Wed, 10 Feb 2021 15:06:03 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id aa200058ee94.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Feb 2021 15:06:03 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB6PR08MB2775.eurprd08.prod.outlook.com (2603:10a6:6:17::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Wed, 10 Feb
 2021 15:06:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::f5c1:9694:9263:d90d%2]) with mapi id 15.20.3825.030; Wed, 10 Feb 2021
 15:06:01 +0000
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
X-Inumbo-ID: 04b2ac3d-dac3-4104-8648-c2ca44a8a040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZkn8seQHPE8H+uNoSkxSEJeWy4Ehr/PYqHcAnXj9sg=;
 b=AahyYdah6hdfg/NjU5ivGZ3RYUOBnfD6NTp3GZVL+MX+9zuekMg8BxHc+8pwDPOiBrGmKRnV6T5y4zIXohxUkx+OsAsbyaSG2l05hOGM8QSFO45fJOhDqZkXSKh6mMQd2WO/G4M5EGw2E/RjkPfM39zDnnX7mlDTjDUImEVOBbM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2ae6ba6b8b8ef7b7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPAUhUues+uYZkTAR32lwjQkhH0EpqlKt5b0gd5qYsqcT5YiVZd4MLFPwFPM8ifqFvfe5Vv2i0OW17DZqLMTD5SZNxTB2SeB5/9vnldnNppUgPjT0bzsRbGghxVd1W+R8BPjSxX1TBNy7Y6SZMAHVws5novZ2bDWxY83GWxliKpS92PFKh/BGC5Lu7jK557ysGCLRiYa72xbbz7ZHpSy+wesqZJjjPVgJ3Hs3zhiJ83Z2NImTI9i6sKPG1EbrBgNjQXuG9a0+akZCX0dbyqwRnYfzJE7UtghNcb0ZORcoOmRNwx1AOEm5G6M9h0JQqEMe60GVQtkhSIlSEHP8bRyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZkn8seQHPE8H+uNoSkxSEJeWy4Ehr/PYqHcAnXj9sg=;
 b=fXEPn+vuRju4r4Azafxajzc7OydReMJKivn362NxktI296i1CA+DlbqUUMXmZgihiArWNsoLgyHzc9/LdN4iUNxp+l65uMpVe8akUNzlFbHOf1zm2fW7INNQRbibXARrwg+0Po2D4CevsGhJ7uQwdZkseD4ms04Gl39H5hqtiBoykbybT5sGPDCbFz51dS1I/buWwfw4AGT39PC7YtzY2bBTRnBCAa2gTcaUwd+Y1Vn8A7+BPiXY42DcwOo58643aR8o8wz70pI9Wrp0ywjwTQIlOcEB3eiZ9He25+MwXdoI6tXzoazrKKqzmlHm7JUcGUR3JV5S83cZE5d7AnJobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZkn8seQHPE8H+uNoSkxSEJeWy4Ehr/PYqHcAnXj9sg=;
 b=AahyYdah6hdfg/NjU5ivGZ3RYUOBnfD6NTp3GZVL+MX+9zuekMg8BxHc+8pwDPOiBrGmKRnV6T5y4zIXohxUkx+OsAsbyaSG2l05hOGM8QSFO45fJOhDqZkXSKh6mMQd2WO/G4M5EGw2E/RjkPfM39zDnnX7mlDTjDUImEVOBbM=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>, "lucmiccio@gmail.com"
	<lucmiccio@gmail.com>, xen-devel <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Topic: [PATCH v2] xen/arm: fix gnttab_need_iommu_mapping
Thread-Index: AQHW/ks46k4kUfhzpk6LTniK0S/PbqpPzhoAgAB7ugCAATYRAA==
Date: Wed, 10 Feb 2021 15:06:01 +0000
Message-ID: <EFFD35EA-378B-4C5C-8485-7EA5265E89E4@arm.com>
References: <20210208184932.23468-1-sstabellini@kernel.org>
 <B96B5E21-0600-4664-899D-D38A18DE7A8C@arm.com>
 <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2102091226560.8948@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8a424a3e-67d1-4f44-3291-08d8cdd56642
x-ms-traffictypediagnostic: DB6PR08MB2775:|DBAPR08MB5717:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5717374E586D207D67ACE213FC8D9@DBAPR08MB5717.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3968;OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h1BR/ESK4DJtTO9SgMnfROiQ4AAS94JUFjzpEuoGWAXq66Vki75BJ1jhAfjWaJvDxSVGFO9HA3KL17hpX4ZwCeSiwkrb4mpMOAv9nrpEtvndq4/HSZufZ2xDfcPBkMH7PZ64HE+HkQeulmPfy6Jz7JaSngU4Iy4ta3/EmRcapaw0BvynoDHKNW3oxficAC8BNK5BsUAxpl5TiJs5BbopqEB4mf5mrOw3LAJE1JnsDpZZU4cf//6rMlNZThiOPCaRuUOWyUV8wyj8Yxcbu0HLpfSYOeljSZtasGUvx6nqugD3QA3SYk3VQ5Mi5uhL2Ipr0zw9ophKtZPhyJ+eY/qDJ9vDqPiLPGPV6wNVv3/4bU2G2zpXidozCyktcwe/Xa2KBAi7l+SPHIpiJDxXtj+aKqNGh//yAPG0oospV/ck9y3OlZrRsVeHkoJfTCjOSaoq3AOx5yNwuM1VYuLTrZxEaRu2ebM6nBPONGUTC7+kWIX2S2MvoANXXYMmANmA3Xeu0DQGkEDxV8Gt0SYpdKieVWazSAjMNwlv7RaLHa1wr8pgLMANJBbsijX/ye6F8hmRTdaI9SYbHp6KyYoySOeoWRAKV8/uPYNIWuiIjGBFvgUGK/ROY9EfhN5b3aGZezFUau4J095IALBZmA5f3c5+4yo1hQtpCj4lq091rDvvf68=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(366004)(39860400002)(136003)(26005)(76116006)(186003)(91956017)(71200400001)(6916009)(66446008)(64756008)(83380400001)(2906002)(8936002)(4326008)(66476007)(6506007)(316002)(478600001)(66556008)(66946007)(966005)(5660300002)(8676002)(6512007)(36756003)(86362001)(6486002)(2616005)(54906003)(33656002)(53546011)(45080400002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?anB4NnNVSEpXbUZCY3JsVUdxU2t0MkNpODhtSDlNUVQ3SHV6OWdPTnpFemg3?=
 =?utf-8?B?MnFVVXV0Vjc2ZHd3Q0NVaDlEWmlHQUwvNG5pTlp3T1ZzVjBJYUdkMjNWaTdO?=
 =?utf-8?B?VmszSSs5Smd6QUl4VUZQMHNWK0RjV2ZBNVErQU1BdjFZaTF1M3hNM1YwQ3hs?=
 =?utf-8?B?YTdERHJCTzVJeTlqbko4Wk1LdWpDb2pLckVMTzVEaW1DQ0dqaU9yeUlSVDdZ?=
 =?utf-8?B?T1pvRXZnTHovQlU3anhNVms1VmlpN28vT3ZPZU80TTduc1NxMk83SXRSWjVW?=
 =?utf-8?B?RlFIdkNTZjdYbjE4UnA5TEtSRzYrQXhRbkRMTWNsV2VYR3UwRlArdW5jMERX?=
 =?utf-8?B?aUo4WUdBd04yY0s3UVE3VW5sZy85NGRDVUswM05TRDdJRldMc1NjNDVSaEYx?=
 =?utf-8?B?dU5VN09YUlhGTUZaTk5FRXJOUktVWldneDYxUmxoeXVvQkdRNFVFd3ZzMkxH?=
 =?utf-8?B?b2RMYTMrRDkwdEowYWVwL2VQVFNRMDVXVzBKMXV4aVZkdWEwVmdQOXNZNjlV?=
 =?utf-8?B?M3lmTE9Bc1VlYVdKWkFrYUM2cnlzSEZjaGFETU42N1UyTzZSSWlQTUZ3N1FO?=
 =?utf-8?B?MXFGeHVrRmlPSS9uQTZRQmFCZnk1TzlSb01NVmVxK00yakppRHA1b05GbytH?=
 =?utf-8?B?dUtqaG9lN0svYWw5VEZsKzlVbWVMY2xRQW4wMWlRbjhhSlBDdWNvY2VKTk5w?=
 =?utf-8?B?aHp5MENPSnFTTEZyUG1NTEFWaVMxWisyd29yMU9TWXN4Mm5zQVRXcXRKT21z?=
 =?utf-8?B?QkI0OThSenlXdUVZRjhxQzRLRmVGQkQvejRhREhpdkVjcDFqQmpoWGVzaTRD?=
 =?utf-8?B?K01nREFqQUtSd0FrTEZEQXFUVERXZU9oeGxxVTZOWWMwejBXekZ2VU5KbXJo?=
 =?utf-8?B?SDY5QlZ3YjVqVXNOWk8rQ2g1N2s2Mmh4bUZEc0Z6OU9BVHdFaHBxdVJZRk9v?=
 =?utf-8?B?aHhWN0hKaGNNTURZMGs1UkRMTlM4RjRtYlYrT1F0bDRNNlNQUWpWcXlMWjFv?=
 =?utf-8?B?bjhTeUFaM29ZakhvVU5zMDlKSy9EemdNbjkxaGxNdmlwQWViUjNHNG5ONmxF?=
 =?utf-8?B?U0NwQ2ZheXl4a3lMTUVDS2d3T3pVNGdzNEMvREpiUTJseWMxaXg1ZEE1TFBF?=
 =?utf-8?B?R1o5b2RLVzhGdi9WU3VrcFBmYlJEZHoyUGJoZ2lCWExmdU5reG9sU2tKcnRa?=
 =?utf-8?B?OU15b1dDbThmb01KaWU4dDBGZkVPN2ZtOFNHVkwxekxIQWQ3bFU2U3R1NkVT?=
 =?utf-8?B?OG1KamNGSldSL2xKMFRLY1RTVVRuRWVTWWVCL1EzOVRhMVU5ckt3NXNvd0hi?=
 =?utf-8?B?VDdwYnRFNXg4OTJGNTRqUVE4eXJ5VEpmTnU0RmppY3hGeHVrL0JFaUtHUjhK?=
 =?utf-8?B?WEc3VWxrdXloNC9yRWg2QU91UW53WnpMbEw0UitYcnNzNCs2STdsanF4RWNm?=
 =?utf-8?B?Mk9MalQvSFBBa0VMY2RWTFBsV0ZFY2tQaW5lelQ1eGczU3NuWTFFYVROV0hw?=
 =?utf-8?B?QTkyOHpLdGtLSGdGOUE4UGh2N1ZYR2dwQUVaTDdhUDY0YU4wSThVODlTSnUy?=
 =?utf-8?B?UUVCb05oUlJ3ZFZadVVsT2pXZjVnaDlYTE5NcUJ6Q09hYXN6N2ZSdzk0MEV5?=
 =?utf-8?B?MFNHUVoxeXJKR2IrQjN2MDQzV1NEbk1TdlVhbXZoWUJyd3NBYURFbC9oMkwv?=
 =?utf-8?B?UkhBWWZtV3FVM0x4SDFmMHlVTURCTUVpYmw1am5EOCtiR2V3aElXeW1CWGFN?=
 =?utf-8?Q?3U3u4SwF/puTKzlipGELKHUdAK7o7jiXfLiE0F4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9EAA45A1A832144FB1060AAADDA71B11@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2775
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4bb76421-86a6-4626-642d-08d8cdd56158
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwrD3/ga9rHCV1e455aswC50SJoZvMVYNgLEDWWlS+PH+swwL7Fs2/G2KHpO5hgj3Kl0Phik/4RqXWc4eXZ+OBGLSFHQiMm2VQ5mCCPobd8GrOl1VWa45Qbk1Xt2WTQOEA3Ip9FEeZedoiG3OeYgiiNSUoPYl3xtWjaUHMacgM+oHT3GI7TlvfSkMsTY6kLCx8A+RxbQnd4OMT9iINmUl3uANd7sbA2e838QAZ/eblpSPkrt+fdKP7wbbPJ4mk6yJ9jpM0SrOlcL0VtNGcA61toOhzw0GFCr8PgInm4RIkVEdp2VGYqidkn7fw/qPDoz075icdOrrX3jU8xarJwo5zEYJtwOa0gluFG86tStEO+Emd53WIxYp0G7qdsr2L673iAGGo0rZzqs4vsTo2rDU/h71t3dn34PqA6Rk9sSpJplt6TpYpn+Gp2hcRpoxhv8orPS9bIfBWBIWW2tIghOlgO5FGKyYpIZtxJsAUu2v+a15T6bHEjS1ahe1WhoX71ln+q58ZhJ9yBVE0UxjKRyBaEN14EN+P8m7xjX7t0xvyR659Kj566BNYrKHUyhxFlrh+yUw6PGjmo6Q/KqEAhXTXfhQ3aIvM8qH4tx+5c1CH3Pm7KDDdI7Ec2J+pK5bLSXr9+DuZBFE39xdMi6M8/zSLPGt2TKdBN5uzII24vpgAKev5IdNGrcQ7QAo5FCHGGp63kXUSmNDyDo7UFbHm5PVJpL1nsa60+SM+XWMcYiwg4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39850400004)(346002)(396003)(136003)(36840700001)(46966006)(186003)(2616005)(6862004)(86362001)(107886003)(5660300002)(36860700001)(82310400003)(26005)(83380400001)(45080400002)(316002)(966005)(2906002)(6512007)(4326008)(36756003)(356005)(70206006)(8676002)(478600001)(6486002)(70586007)(47076005)(53546011)(33656002)(336012)(82740400003)(81166007)(8936002)(54906003)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2021 15:06:09.8558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a424a3e-67d1-4f44-3291-08d8cdd56642
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5717

SGVsbG8gU3RlZmFubywNCg0KPiBPbiA5IEZlYiAyMDIxLCBhdCA4OjM2IHBtLCBTdGVmYW5vIFN0
YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gT24gVHVlLCA5
IEZlYiAyMDIxLCBSYWh1bCBTaW5naCB3cm90ZToNCj4+PiBPbiA4IEZlYiAyMDIxLCBhdCA2OjQ5
IHBtLCBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0K
Pj4+IA0KPj4+IENvbW1pdCA5MWQ0ZWNhN2FkZCBicm9rZSBnbnR0YWJfbmVlZF9pb21tdV9tYXBw
aW5nIG9uIEFSTS4NCj4+PiBUaGUgb2ZmZW5kaW5nIGNodW5rIGlzOg0KPj4+IA0KPj4+ICNkZWZp
bmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSAgICAgICAgICAgICAgICAgICAgXA0KPj4+
IC0gICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFwcGVkKGQpICYmIG5lZWRfaW9tbXUoZCkpDQo+Pj4g
KyAgICAoaXNfZG9tYWluX2RpcmVjdF9tYXBwZWQoZCkgJiYgbmVlZF9pb21tdV9wdF9zeW5jKGQp
KQ0KPj4+IA0KPj4+IE9uIEFSTSB3ZSBuZWVkIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcgdG8g
YmUgdHJ1ZSBmb3IgZG9tMCB3aGVuIGl0IGlzDQo+Pj4gZGlyZWN0bHkgbWFwcGVkIGFuZCBJT01N
VSBpcyBlbmFibGVkIGZvciB0aGUgZG9tYWluLCBsaWtlIHRoZSBvbGQgY2hlY2sNCj4+PiBkaWQs
IGJ1dCB0aGUgbmV3IGNoZWNrIGlzIGFsd2F5cyBmYWxzZS4NCj4+PiANCj4+PiBJbiBmYWN0LCBu
ZWVkX2lvbW11X3B0X3N5bmMgaXMgZGVmaW5lZCBhcyBkb21faW9tbXUoZCktPm5lZWRfc3luYyBh
bmQNCj4+PiBuZWVkX3N5bmMgaXMgc2V0IGFzOg0KPj4+IA0KPj4+ICAgaWYgKCAhaXNfaGFyZHdh
cmVfZG9tYWluKGQpIHx8IGlvbW11X2h3ZG9tX3N0cmljdCApDQo+Pj4gICAgICAgaGQtPm5lZWRf
c3luYyA9ICFpb21tdV91c2VfaGFwX3B0KGQpOw0KPj4+IA0KPj4+IGlvbW11X3VzZV9oYXBfcHQo
ZCkgbWVhbnMgdGhhdCB0aGUgcGFnZS10YWJsZSB1c2VkIGJ5IHRoZSBJT01NVSBpcyB0aGUNCj4+
PiBQMk0uIEl0IGlzIHRydWUgb24gQVJNLiBuZWVkX3N5bmMgbWVhbnMgdGhhdCB5b3UgaGF2ZSBh
IHNlcGFyYXRlIElPTU1VDQo+Pj4gcGFnZS10YWJsZSBhbmQgaXQgbmVlZHMgdG8gYmUgdXBkYXRl
ZCBmb3IgZXZlcnkgY2hhbmdlLiBuZWVkX3N5bmMgaXMgc2V0DQo+Pj4gdG8gZmFsc2Ugb24gQVJN
LiBIZW5jZSwgZ250dGFiX25lZWRfaW9tbXVfbWFwcGluZyhkKSBpcyBmYWxzZSB0b28sDQo+Pj4g
d2hpY2ggaXMgd3JvbmcuDQo+Pj4gDQo+Pj4gQXMgYSBjb25zZXF1ZW5jZSwgd2hlbiB1c2luZyBQ
ViBuZXR3b3JrIGZyb20gYSBkb21VIG9uIGEgc3lzdGVtIHdoZXJlDQo+Pj4gSU9NTVUgaXMgb24g
ZnJvbSBEb20wLCBJIGdldDoNCj4+PiANCj4+PiAoWEVOKSBzbW11OiAvc21tdUBmZDgwMDAwMDog
VW5oYW5kbGVkIGNvbnRleHQgZmF1bHQ6IGZzcj0weDQwMiwgaW92YT0weDg0MjRjYjE0OCwgZnN5
bnI9MHhiMDAwMSwgY2I9MA0KPj4+IFsgICA2OC4yOTAzMDddIG1hY2IgZmYwZTAwMDAuZXRoZXJu
ZXQgZXRoMDogRE1BIGJ1cyBlcnJvcjogSFJFU1Agbm90IE9LDQo+Pj4gDQo+Pj4gVGhlIGZpeCBp
cyB0byBnbyBiYWNrIHRvIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YgdGhlIG9sZA0KPj4+
IGltcGxlbWVudGF0aW9uIG9mIGdudHRhYl9uZWVkX2lvbW11X21hcHBpbmcuDQo+Pj4gDQo+Pj4g
U2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzdGVmYW5vLnN0YWJlbGxpbmlAeGls
aW54LmNvbT4NCj4+PiBGaXhlczogOTFkNGVjYTdhZGQNCj4+PiBCYWNrcG9ydDogNC4xMisNCj4+
PiANCj4+PiAtLS0NCj4+PiANCj4+PiBHaXZlbiB0aGUgc2V2ZXJpdHkgb2YgdGhlIGJ1ZywgSSB3
b3VsZCBsaWtlIHRvIHJlcXVlc3QgdGhpcyBwYXRjaCB0byBiZQ0KPj4+IGJhY2twb3J0ZWQgdG8g
NC4xMiB0b28sIGV2ZW4gaWYgNC4xMiBpcyBzZWN1cml0eS1maXhlcyBvbmx5IHNpbmNlIE9jdA0K
Pj4+IDIwMjAuDQo+Pj4gDQo+Pj4gRm9yIHRoZSA0LjEyIGJhY2twb3J0LCB3ZSBjYW4gdXNlIGlv
bW11X2VuYWJsZWQoKSBpbnN0ZWFkIG9mDQo+Pj4gaXNfaW9tbXVfZW5hYmxlZCgpIGluIHRoZSBp
bXBsZW1lbnRhdGlvbiBvZiBnbnR0YWJfbmVlZF9pb21tdV9tYXBwaW5nLg0KPj4+IA0KPj4+IENo
YW5nZXMgaW4gdjI6DQo+Pj4gLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlDQo+Pj4gLSBhZGQgaXNf
aW9tbXVfZW5hYmxlZChkKSB0byB0aGUgY2hlY2sNCj4+PiAtLS0NCj4+PiB4ZW4vaW5jbHVkZS9h
c20tYXJtL2dyYW50X3RhYmxlLmggfCAyICstDQo+Pj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4gDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRl
L2FzbS1hcm0vZ3JhbnRfdGFibGUuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vZ3JhbnRfdGFibGUu
aA0KPj4+IGluZGV4IDZmNTg1YjE1MzguLjBjZTc3ZjlhMWMgMTAwNjQ0DQo+Pj4gLS0tIGEveGVu
L2luY2x1ZGUvYXNtLWFybS9ncmFudF90YWJsZS5oDQo+Pj4gKysrIGIveGVuL2luY2x1ZGUvYXNt
LWFybS9ncmFudF90YWJsZS5oDQo+Pj4gQEAgLTg5LDcgKzg5LDcgQEAgaW50IHJlcGxhY2VfZ3Jh
bnRfaG9zdF9tYXBwaW5nKHVuc2lnbmVkIGxvbmcgZ3BhZGRyLCBtZm5fdCBtZm4sDQo+Pj4gICAg
KCgoaSkgPj0gbnJfc3RhdHVzX2ZyYW1lcyh0KSkgPyBJTlZBTElEX0dGTiA6ICh0KS0+YXJjaC5z
dGF0dXNfZ2ZuW2ldKQ0KPj4+IA0KPj4+ICNkZWZpbmUgZ250dGFiX25lZWRfaW9tbXVfbWFwcGlu
ZyhkKSAgICAgICAgICAgICAgICAgICAgXA0KPj4+IC0gICAgKGlzX2RvbWFpbl9kaXJlY3RfbWFw
cGVkKGQpICYmIG5lZWRfaW9tbXVfcHRfc3luYyhkKSkNCj4+PiArICAgIChpc19kb21haW5fZGly
ZWN0X21hcHBlZChkKSAmJiBpc19pb21tdV9lbmFibGVkKGQpKQ0KPj4+IA0KPj4+ICNlbmRpZiAv
KiBfX0FTTV9HUkFOVF9UQUJMRV9IX18gKi8NCj4+IA0KPj4gSSB0ZXN0ZWQgdGhlIHBhdGNoIGFu
ZCB3aGlsZSBjcmVhdGluZyB0aGUgZ3Vlc3QgSSBvYnNlcnZlZCB0aGUgYmVsb3cgd2FybmluZyBm
cm9tIExpbnV4IGZvciBibG9jayBkZXZpY2UuDQo+PiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NC4zL3NvdXJjZS9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jI0wy
NTgNCj4gDQo+IFNvIHlvdSBhcmUgY3JlYXRpbmcgYSBndWVzdCB3aXRoICJ4bCBjcmVhdGUiIGlu
IGRvbTAgYW5kIHlvdSBzZWUgdGhlDQo+IHdhcm5pbmdzIGJlbG93IHByaW50ZWQgYnkgdGhlIERv
bTAga2VybmVsPyBJIGltYWdpbmUgdGhlIGRvbVUgaGFzIGENCj4gdmlydHVhbCAiZGlzayIgb2Yg
c29tZSBzb3J0Lg0KDQpZZXMgeW91IGFyZSByaWdodCBJIGFtIHRyeWluZyB0byBjcmVhdGUgdGhl
IGd1ZXN0IHdpdGggInhsIGNyZWF0ZeKAnSBhbmQgYmVmb3JlIHRoYXQsIEkgY3JlYXRlZCB0aGUg
bG9naWNhbCB2b2x1bWUgYW5kIHRyeWluZyB0byBhdHRhY2ggdGhlIGxvZ2ljYWwgdm9sdW1lDQpi
bG9jayB0byB0aGUgZG9tYWluIHdpdGgg4oCceGwgYmxvY2stYXR0YWNo4oCdLiBJIG9ic2VydmVk
IHRoaXMgZXJyb3Igd2l0aCB0aGUgInhsIGJsb2NrLWF0dGFjaOKAnSBjb21tYW5kLg0KDQpUaGlz
IGlzc3VlIG9jY3VycyBhZnRlciBhcHBseWluZyB0aGlzIHBhdGNoIGFzIHdoYXQgSSBvYnNlcnZl
ZCB0aGlzIHBhdGNoIGludHJvZHVjZSB0aGUgY2FsbHMgdG8gaW9tbXVfbGVnYWN5X3ssIHVufW1h
cCgpIHRvIG1hcCB0aGUgZ3JhbnQgcGFnZXMgZm9yDQpJT01NVSB0aGF0IHRvdWNoZXMgdGhlIHBh
Z2UtdGFibGVzLiBJIGFtIG5vdCBzdXJlIGJ1dCB3aGF0IEkgb2JzZXJ2ZWQgaXMgdGhhdCBzb21l
dGhpbmcgaXMgd3JpdHRlbiB3cm9uZyB3aGVuIGlvbW1fdW5tYXAgY2FsbHMgdW5tYXAgdGhlIHBh
Z2VzDQpiZWNhdXNlIG9mIHRoYXQgaXNzdWUgaXMgb2JzZXJ2ZWQuDQoNCllvdSBjYW4gcmVwcm9k
dWNlIHRoZSBpc3N1ZSBieSBqdXN0IGNyZWF0aW5nIHRoZSBkdW1teSBpbWFnZSBmaWxlIGFuZCB0
cnkgdG8gYXR0YWNoIGl0IHdpdGgg4oCceGwgYmxvY2stYXR0YWNo4oCdDQoNCmRkIGlmPS9kZXYv
emVybyBvZj10ZXN0LmltZyBicz0xMDI0IGNvdW50PTAgc2Vlaz0xMDI0DQp4bCBibG9jay1hdHRh
Y2ggMCBwaHk6dGVzdC5pbWcgeHZkYSB3DQoNClNlcXVlbmNlIG9mIGNvbW1hbmQgdGhhdCBJIGZv
bGxvdyBpcyBhcyBmb2xsb3dzIHRvIHJlcHJvZHVjZSB0aGUgaXNzdWU6ICANCg0KbHZzIHZnLXhl
bi9teWd1ZXN0DQpsdmNyZWF0ZSAteSAtTCA0RyAtbiBteWd1ZXN0IHZnLXhlbg0KcGFydGVkIC1z
IC9kZXYvdmcteGVuL215Z3Vlc3QgbWtsYWJlbCBtc2Rvcw0KcGFydGVkIC1zIC9kZXYvdmcteGVu
L215Z3Vlc3QgdW5pdCBNQiBta3BhcnQgcHJpbWFyeSAxIDQwOTYNCnN5bmMNCnhsIGJsb2NrLWF0
dGFjaCAwIHBoeTovZGV2L3ZnLXhlbi9teWd1ZXN0IHh2ZGEgdw0KDQpsaWJ4bDogZXJyb3I6IGxp
YnhsX3hzaGVscC5jOjIwMTpsaWJ4bF9feHNfcmVhZF9tYW5kYXRvcnk6IHhlbnN0b3JlIHJlYWQg
ZmFpbGVkOiBgL2xpYnhsLzAvdHlwZSc6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkNCmxpYnhs
OiB3YXJuaW5nOiBsaWJ4bF9kb20uYzo1MTpsaWJ4bF9fZG9tYWluX3R5cGU6IHVuYWJsZSB0byBn
ZXQgZG9tYWluIHR5cGUgZm9yIGRvbWlkPTAsIGFzc3VtaW5nIEhWTQ0KWyAgMTYyLjYzMjIzMl0g
eGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzAvNTE3MTI6IHVzaW5nIDQgcXVldWVzLCBwcm90b2Nv
bCAxIChhcm0tYWJpKSBwZXJzaXN0ZW50IGdyYW50cw0KWyAgMTYyLjc2NDg0N10gdmJkIHZiZC0w
LTUxNzEyOiA5IG1hcHBpbmcgaW4gc2hhcmVkIHBhZ2UgOCBmcm9tIGRvbWFpbiAwDQpbICAxNjIu
NzcxNzQwXSB2YmQgdmJkLTAtNTE3MTI6IDkgbWFwcGluZyByaW5nLXJlZiBwb3J0IDUNClsgIDE2
Mi43Nzc2NTBdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KWyAgMTYyLjc4
MjE2N10gV0FSTklORzogQ1BVOiAyIFBJRDogMzcgYXQgZHJpdmVycy9ibG9jay94ZW4tYmxrYmFj
ay94ZW5idXMuYzoyOTYgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgyMGMvMHgyMzANClsgIDE2Mi43
OTIyMzBdIE1vZHVsZXMgbGlua2VkIGluOiBicmlkZ2Ugc3RwIGxsYyBpcHY2IG5mX2RlZnJhZ19p
cHY2DQpbICAxNjIuNzk4Mzk0XSBDUFU6IDIgUElEOiAzNyBDb21tOiB4ZW53YXRjaCBOb3QgdGFp
bnRlZCA1LjQuMC15b2N0by1zdGFuZGFyZCAjMQ0KWyAgMTYyLjgwNTU5N10gSGFyZHdhcmUgbmFt
ZTogQXJtIE5lb3ZlcnNlIE4xIFN5c3RlbSBEZXZlbG9wbWVudCBQbGF0Zm9ybSAoRFQpDQpbICAx
NjIuODEyNjMwXSBwc3RhdGU6IDgwYzAwMDA1IChOemN2IGRhaWYgK1BBTiArVUFPKQ0KWyAgMTYy
LjgxNzQ4OV0gcGMgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweDIwYy8weDIzMA0KWyAgMTYyLjgy
MjI2Ml0gbHIgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweGJjLzB4MjMwDQpbICAxNjIuODI2OTQ5
XSBzcCA6IGZmZmY4MDAwMTFjYjNjODANCuKApuKApi4NCg0KUmVnYXJkcywNClJhaHVsDQoNCj4g
DQo+IA0KPj4gSSBkaWQgaW5pdGlhbCBkZWJ1Z2dpbmcgYW5kIGZvdW5kIG91dCB0aGF0IHRoZXJl
IGFyZSBtYW55IGNhbGxzIHRvIGlvbW11X2xlZ2FjeV97LHVufW1hcCgpIHdoaWxlIGNyZWF0aW5n
IHRoZSBndWVzdCBidXQgd2hlbiBpb21tdV9sZWdhY3lfdW5tYXAoKSBmdW5jdGlvbiB1bm1hcCB0
aGUgcGFnZXMgc29tZXRoaW5nIGlzIHdyaXR0ZW4gIHdyb25nIGluIHBhZ2UgdGFibGVzIGJlY2F1
c2Ugb2YgdGhhdCB3aGVuIG5leHQgdGltZSBzYW1lIHBhZ2UgaXMgbWFwcGVkIHZpYSBjcmVhdGVf
Z3JhbnRfaG9zdF9tYXBwaW5nKCkgd2Ugb2JzZXJ2ZWQgYmVsb3cgd2FybmluZy4gDQo+IA0KPiBC
eSAid2hpbGUgY3JlYXRpbmcgYSBndWVzdCIsIGRvIHlvdSBtZWFuIGJlZm9yZSB0aGUgZG9tVSBp
cyBldmVuDQo+IHVucGF1c2VkPyBIZW5jZSwgdGhlIGNhbGxzIGFyZSBhIHJlc3VsdCBvZiBkb20w
IG9wZXJhdGlvbnM/DQo+IE9yIGFmdGVyDQo+IGRvbVUgaXMgdW5wYXVzZWQsIGhlbmNlLCB0aGUg
Y2FsbHMgYXJlIGEgcmVzdWx0IG9mIGRvbVUgb3BlcmF0aW9ucw0KPiAocHJvYmFibHkgdGhlIGRv
bVUgc2ltcGx5IHRyeWluZyB0byBhY2Nlc3MgaXRzIHZpcnR1YWwgZGlzayk/DQo+IFBsZWFzZSBu
b3RlIHRoYXQgeW91IGNhbiBzdGFydCBhIGd1ZXN0IHBhdXNlZCB3aXRoIHhsIGNyZWF0ZSAtcC4N
Cj4gDQo+IExvb2tpbmcgYXQgdGhlIGxvZ3MsIGl0IGlzIHByb2JhYmx5IHRoZSBsYXR0ZXIuIFRo
ZSBmb2xsb3dpbmcgbGluZQ0KPiBzaG91bGQgYmUgcHJpbnRlZCB3aGVuIHRoZSBkb21VIFBWIGJs
b2NrIGZyb250ZW5kIGNvbm5lY3RzIHRvIHRoZQ0KPiBiYWNrZW5kIGluIGRvbTA6DQo+IA0KPiBb
ICAxMzguNjM5OTM0XSB4ZW4tYmxrYmFjazogYmFja2VuZC92YmQvMC81MTcxMjogdXNpbmcgNCBx
dWV1ZXMsIHByb3RvY29sIDEgKGFybS1hYmkpIHBlcnNpc3RlbnQgZ3JhbnRzDQo+IA0KPiBJJ2xs
IHNlZSBpZiBJIGNhbiByZXBybyB0aGUgaXNzdWUgaGVyZS4NCj4gDQo+IA0KPj4gWyAgMTM4LjYz
OTkzNF0geGVuLWJsa2JhY2s6IGJhY2tlbmQvdmJkLzAvNTE3MTI6IHVzaW5nIDQgcXVldWVzLCBw
cm90b2NvbCAxIChhcm0tYWJpKSBwZXJzaXN0ZW50IGdyYW50cw0KPj4gKFhFTikgZ250dGFiX21h
cmtfZGlydHkgbm90IGltcGxlbWVudGVkIHlldA0KPj4gWyAgMTM4LjY1OTcwMl0geGVuLWJsa2Jh
Y2s6IGJhY2tlbmQvdmJkLzAvNTE3MTI6IHVzaW5nIDQgcXVldWVzLCBwcm90b2NvbCAxIChhcm0t
YWJpKSBwZXJzaXN0ZW50IGdyYW50cw0KPj4gWyAgMTM4LjY2OTgyN10gdmJkIHZiZC0wLTUxNzEy
OiA5IG1hcHBpbmcgaW4gc2hhcmVkIHBhZ2UgOCBmcm9tIGRvbWFpbiAwDQo+PiBbICAxMzguNjc2
NjM2XSB2YmQgdmJkLTAtNTE3MTI6IDkgbWFwcGluZyByaW5nLXJlZiBwb3J0IDUNCj4+IFsgIDEz
OC42ODIwODldIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0KPj4gWyAgMTM4
LjY4NjYwNV0gV0FSTklORzogQ1BVOiAyIFBJRDogMzcgYXQgZHJpdmVycy9ibG9jay94ZW4tYmxr
YmFjay94ZW5idXMuYzoyOTYgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgyMGMvMHgyMzANCj4+IFsg
IDEzOC42OTY2NjhdIE1vZHVsZXMgbGlua2VkIGluOiBicmlkZ2Ugc3RwIGxsYyBpcHY2IG5mX2Rl
ZnJhZ19pcHY2DQo+PiBbICAxMzguNzAyODMzXSBDUFU6IDIgUElEOiAzNyBDb21tOiB4ZW53YXRj
aCBOb3QgdGFpbnRlZCA1LjQuMC15b2N0by1zdGFuZGFyZCAjMQ0KPj4gWyAgMTM4LjcxMDAzN10g
SGFyZHdhcmUgbmFtZTogQXJtIE5lb3ZlcnNlIE4xIFN5c3RlbSBEZXZlbG9wbWVudCBQbGF0Zm9y
bSAoRFQpDQo+PiBbICAxMzguNzE3MDY3XSBwc3RhdGU6IDgwYzAwMDA1IChOemN2IGRhaWYgK1BB
TiArVUFPKQ0KPj4gWyAgMTM4LjcyMTkyN10gcGMgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweDIw
Yy8weDIzMA0KPj4gWyAgMTM4LjcyNjcwMV0gbHIgOiB4ZW5fYmxraWZfZGlzY29ubmVjdCsweGJj
LzB4MjMwDQo+PiBbICAxMzguNzMxMzg4XSBzcCA6IGZmZmY4MDAwMTFjYjNjODANCj4+IFsgIDEz
OC43MzQ3NzNdIHgyOTogZmZmZjgwMDAxMWNiM2M4MCB4Mjg6IGZmZmYwMDAwNWI2ZGE5NDAgDQo+
PiBbICAxMzguNzQwMTU2XSB4Mjc6IDAwMDAwMDAwMDAwMDAwMDAgeDI2OiAwMDAwMDAwMDAwMDAw
MDAwIA0KPj4gWyAgMTM4Ljc0NTUzNl0geDI1OiBmZmZmMDAwMDI5NzU1MDYwIHgyNDogMDAwMDAw
MDAwMDAwMDE3MCANCj4+IFsgIDEzOC43NTA5MTldIHgyMzogZmZmZjAwMDAyOTc1NTA0MCB4MjI6
IGZmZmYwMDAwNTljNzIwMDAgDQo+PiBbICAxMzguNzU2Mjk5XSB4MjE6IDAwMDAwMDAwMDAwMDAw
MDAgeDIwOiBmZmZmMDAwMDI5NzU1MDAwIA0KPj4gWyAgMTM4Ljc2MTY4MV0geDE5OiAwMDAwMDAw
MDAwMDAwMDAxIHgxODogMDAwMDAwMDAwMDAwMDAwMCANCj4+IFsgIDEzOC43NjcwNjNdIHgxNzog
MDAwMDAwMDAwMDAwMDAwMCB4MTY6IDAwMDAwMDAwMDAwMDAwMDAgDQo+PiBbICAxMzguNzcyNDQ0
XSB4MTU6IDAwMDAwMDAwMDAwMDAwMDAgeDE0OiAwMDAwMDAwMDAwMDAwMDAwIA0KPj4gWyAgMTM4
Ljc3NzgyNl0geDEzOiAwMDAwMDAwMDAwMDAwMDAwIHgxMjogMDAwMDAwMDAwMDAwMDAwMCANCj4+
IFsgIDEzOC43ODMyMDddIHgxMTogMDAwMDAwMDAwMDAwMDAwMSB4MTA6IDAwMDAwMDAwMDAwMDA5
OTAgDQo+PiBbICAxMzguNzg4NTg5XSB4OSA6IDAwMDAwMDAwMDAwMDAwMDEgeDggOiAwMDAwMDAw
MDAwMjEwZDAwIA0KPj4gWyAgMTM4Ljc5Mzk3MV0geDcgOiAwMDAwMDAwMDAwMDAwMDE4IHg2IDog
ZmZmZjAwMDA1ZGRmNzJhMCANCj4+IFsgIDEzOC43OTkzNTJdIHg1IDogZmZmZjgwMDAxMWNiM2My
OCB4NCA6IDAwMDAwMDAwMDAwMDAwMDAgDQo+PiBbICAxMzguODA0NzM0XSB4MyA6IGZmZmYwMDAw
Mjk3NTUxMTggeDIgOiAwMDAwMDAwMDAwMDAwMDAwIA0KPj4gWyAgMTM4LjgxMDExN10geDEgOiBm
ZmZmMDAwMDI5NzU1MTIwIHgwIDogMDAwMDAwMDAwMDAwMDAwMSANCj4+IFsgIDEzOC44MTU0OTdd
IENhbGwgdHJhY2U6DQo+PiBbICAxMzguODE4MDE1XSAgeGVuX2Jsa2lmX2Rpc2Nvbm5lY3QrMHgy
MGMvMHgyMzANCj4+IFsgIDEzOC44MjI0NDJdICBmcm9udGVuZF9jaGFuZ2VkKzB4MWIwLzB4NTRj
DQo+PiBbICAxMzguODI2NTIzXSAgeGVuYnVzX290aGVyZW5kX2NoYW5nZWQrMHg4MC8weGIwDQo+
PiBbICAxMzguODMxMDM1XSAgZnJvbnRlbmRfY2hhbmdlZCsweDEwLzB4MjANCj4+IFsgIDEzOC44
MzQ5NDFdICB4ZW53YXRjaF90aHJlYWQrMHg4MC8weDE0NA0KPj4gWyAgMTM4LjgzODg0OV0gIGt0
aHJlYWQrMHgxMTgvMHgxMjANCj4+IFsgIDEzOC44NDIxNDddICByZXRfZnJvbV9mb3JrKzB4MTAv
MHgxOA0KPj4gWyAgMTM4Ljg0NTc5MV0gLS0tWyBlbmQgdHJhY2UgZmI5ZjBhM2IzYjQ4YTU1ZiBd
4oCUDQoNCg==

