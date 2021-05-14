Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6CE3802FF
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 06:36:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127212.239027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPY4-0006s7-Bt; Fri, 14 May 2021 04:35:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127212.239027; Fri, 14 May 2021 04:35:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhPY4-0006pt-8b; Fri, 14 May 2021 04:35:40 +0000
Received: by outflank-mailman (input) for mailman id 127212;
 Fri, 14 May 2021 04:35:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkNH=KJ=arm.com=henry.wang@srs-us1.protection.inumbo.net>)
 id 1lhPY3-0006pn-4e
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 04:35:39 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0891d212-8865-499c-8e77-e78a0efc873a;
 Fri, 14 May 2021 04:35:36 +0000 (UTC)
Received: from AM6P191CA0075.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::16)
 by AM0PR08MB5233.eurprd08.prod.outlook.com (2603:10a6:208:164::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 04:35:34 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::a0) by AM6P191CA0075.outlook.office365.com
 (2603:10a6:209:8a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Fri, 14 May 2021 04:35:34 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 04:35:33 +0000
Received: ("Tessian outbound 1e34f83e4964:v91");
 Fri, 14 May 2021 04:35:33 +0000
Received: from 973ee7c1a37a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 24F7DF35-1C84-4BB7-9C4B-D504833F5266.1; 
 Fri, 14 May 2021 04:35:22 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 973ee7c1a37a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 14 May 2021 04:35:22 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com (2603:10a6:102:e4::8)
 by PAXPR08MB6591.eurprd08.prod.outlook.com (2603:10a6:102:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 04:35:12 +0000
Received: from PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad]) by PA4PR08MB6253.eurprd08.prod.outlook.com
 ([fe80::19f9:d346:b9af:5cad%3]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 04:35:12 +0000
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
X-Inumbo-ID: 0891d212-8865-499c-8e77-e78a0efc873a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orPWnfeKWw+qcO1rL/1QfQTyiifsXPu6f4832g9BrqM=;
 b=fyuXZ56spaJhGbqdAUpgnAnpPpoDbMgiwnI00taIdXqc5FYj7BuY1tVKoMZb2t98pWZhFPRxYYnyfa4QIKpDxFKNkAG+wElGzWzYgjbqwnANMPAV98zhWCIzt9JuWzV+0y8pax/gTfzKswGRlqcf7ZIyBF21kXYG52gFUNkDIf4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L4P/3DOx1v/K4avopiKfYZLdLNkTGvfLyVnAHUkxygXRiuuww6kvtbDDX6L9OeoRmHpZdqkp/2zrlcFx4pizkPTr1Aqt8Yysb2S4P2jW7TGsb6lkOVn2mPheFMf7hTndtOkgbMeav48ptYPGvJvDhkH2SPRrg88PRq5U5ONy3jSaL4cROmBnyodL2190+k/Vs7rmCz4ATK9l5l0mhuVji7AF9btjMLZfwhEJCuOmPMle8BVKXfcWEo+qfLh8f7814h9WGdAUVPLTDUD8YIxf5L4EKwgi66VOYA7GdTLpp1x8mcPYxE+n3D6MKKpMJQvC++c9HPHFhCIAycC7E5cMuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orPWnfeKWw+qcO1rL/1QfQTyiifsXPu6f4832g9BrqM=;
 b=SaXAm/UvSytkrh5o2gM9WACAT25s2ugGWbmiR7Ed7+3RMsowjcawzctm31g1ABtOq1+kVcuZtFs5XzwzWTYP5tZ9aI0bde3nuaifqQtVTrAV1U24D8sFTXtTA02LinNLardQYDG5h5fDJrB7oIuaCXVdGV430+vZ5e1UpgkngAF1fUnxqZW16k8rWJ5lBvUx1HQqDyd2vyeZyingL5LolEs2NU3eiIaCd/DwKsHhXW+1I/CmLK+CydiUQT4bmbroHCgCQvSY+VEKQTQ6DZ6ul9uKsNSMZVACHHfG/TaS5afYdbXpmcFMxsNV+/02a7FS3OYnZ4yAkLhQF9hFmyMYZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orPWnfeKWw+qcO1rL/1QfQTyiifsXPu6f4832g9BrqM=;
 b=fyuXZ56spaJhGbqdAUpgnAnpPpoDbMgiwnI00taIdXqc5FYj7BuY1tVKoMZb2t98pWZhFPRxYYnyfa4QIKpDxFKNkAG+wElGzWzYgjbqwnANMPAV98zhWCIzt9JuWzV+0y8pax/gTfzKswGRlqcf7ZIyBF21kXYG52gFUNkDIf4=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Wei Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>
Subject: RE: Discussion of Xenheap problems on AArch64
Thread-Topic: Discussion of Xenheap problems on AArch64
Thread-Index:
 Adc2dyA8lkZGRqbyRiSglHolanVkwQAFhaqAAACgy/AA4CfqgABHcHyAADhcqlAABznSAAGrycWAALiGZgAAEDKF4ACJdUUAABHcYPA=
Date: Fri, 14 May 2021 04:35:11 +0000
Message-ID:
 <PA4PR08MB6253E95579D8277D7FD1BE9A92509@PA4PR08MB6253.eurprd08.prod.outlook.com>
References:
 <PA4PR08MB6253F49C13ED56811BA5B64E92479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <cdde98ca-4183-c92b-adca-801330992fc5@xen.org>
 <PA4PR08MB62538BBA256E66A0415F0C7192479@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <f14aa1d6-35d2-a9a3-0672-7f0d3ae3ec89@xen.org>
 <PA4PR08MB62534C4130B59CAA9A8A8BF792419@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <PA4PR08MB6253FBC7F5E690DB74F2E11F92409@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <2a65b8c0-fccc-2ccc-f736-7f3f666e84d1@xen.org>
 <PA4PR08MB62537A958107CD234831E0B892579@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba649865-410b-e1be-39a3-c4cac802f464@xen.org>
 <PA4PR08MB6253F85E184CA51BDB99786992539@PA4PR08MB6253.eurprd08.prod.outlook.com>
 <ba1bc084-5a5b-1410-acba-33bfca7c4f6a@xen.org>
In-Reply-To: <ba1bc084-5a5b-1410-acba-33bfca7c4f6a@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: D833DBD41F6837459A3F57C8C9D0F4DE.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8e8274a5-dec8-4b25-c728-08d91691b6bc
x-ms-traffictypediagnostic: PAXPR08MB6591:|AM0PR08MB5233:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB52337F0842C6AFE2FB78908D92509@AM0PR08MB5233.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 x/K3EwyvjFqdOxLE4uEogYjUqTtCTCbg+BZpvppQ1LtRC9Dyr+kiVrwcnZIXKdq9IPT6GorGeym705UmzFlbHfz8f9N+LtCBdTtRBEscQh5uMVZctdiH04YJkTInAB3PMerNw/Za5v9WeN6VtB9WUUOJqy77CWDMGzceAfOOsioNgz2+RPaS+l72v424+Fa3hpBg6TdYG1jRaQN+rxEWfVRA1u+JeIq6l57urHv0bhOltSG0nlTjFfyahwtKM+seNATVkWyA/Qsq9FAt9m8Fkio87w/2gb01/l2700lt3rKVmq1NMi3NwYvgonnAaHzyPBv1Dw3o/Vab/9r6YFwnqnF+6OfnVjwbJV6S3TlHK2N3D6Ae2fVz7VmJJLpj5awhsNCTB53bwWd0wn6lFNH7EK/usgPgthnVwqeQtrSUGVKltRH7QvyNNMCKdRnwg1uBkwkMpsKAa927JokQbP+a8XzljXjeFISAmLRRdvAKLz+DGSIkGE1kMc5xgVOBq5heiCdQHxvbM1jxtHxwjrpm3kDfo/dRMtJ9OqrXHbu0omRuRPLWwdUiKeh9ympZgXVgy9z10wyw4v1s6sZ2LZZQXrcPHcLSjhigx084X/LUydc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB6253.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39850400004)(26005)(7696005)(52536014)(66556008)(5660300002)(6506007)(86362001)(110136005)(54906003)(66446008)(76116006)(66946007)(71200400001)(478600001)(122000001)(38100700002)(53546011)(2906002)(9686003)(55016002)(33656002)(83380400001)(4326008)(8936002)(64756008)(186003)(66476007)(8676002)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?utf-8?B?Q0Zmek5rTTFsc0tWeEF5Tmhsb21LbzhUaWQ2STZFN2VWTExSc2h2dzVMTnNX?=
 =?utf-8?B?RjY4N2RXc2s1em1ZampGcUhmYVl0TEY1bm5ZZUtyT1F6WGgwUktkdXZwRnEw?=
 =?utf-8?B?RHY1WnJSb1lINWhSTUJLTUNVTVRMZStNYW1lTkNCVG9hQWEwOGZEMklQSnAx?=
 =?utf-8?B?RkFNNGZIdi9CQnJDMnNONThwczNSTnZBcThFeXVra0doc1grS3U4eFVZY3R3?=
 =?utf-8?B?aGh0VU5FQlpUVjg5VmlEdTFWQWpUbzNmQ1loekd0dXJVYUN2VndpVDAxRTZU?=
 =?utf-8?B?WTB3MGNDNEhLbzR4NnBBYmNBU24xV2xLYzVKa0FjQmRlZkpaN2lWZENQc21x?=
 =?utf-8?B?YkQ2cW5kWTc0R0Q2aDNseFFiNkp0QzdQOS9tTW9PN3hteVRpNWVnd0VSM1d3?=
 =?utf-8?B?ZWJBUU9Bc3RLY0I2RjRreWFqZkRob0hLd3VOenlnRE45VW43T28weDB2MkxR?=
 =?utf-8?B?MWRHem8rcFFhT1V6OHRaWnV4R2JTRTdRUE9EMTAvUUk2TFcveDQ3bVRqYmg0?=
 =?utf-8?B?d0MzMUlId0IzNWtVaVhZWmpaYnNnTHJBQmNCR0NXUmRFd2ZBWlRrNDgyeThW?=
 =?utf-8?B?Y1N1bm15T2hybTBvUEtWOWFEMEpkV0pxR0FjNVJlSm8rY2hBTitvQ0tiQlFz?=
 =?utf-8?B?WnMzOGIzTHYyYVZ6alAwd1BqNXIwVm85dlhrdURZbTh3VnMraCtGeFpPNVFK?=
 =?utf-8?B?a1c0c3dPMGNPNytyRVVZQi9WRFQ2NllLUkV6dkw2NlUxVGMxSytGYjhkUllF?=
 =?utf-8?B?ZGl1eGh0T1lpT0o4QXBEOERhQm9ZVjFSOFoyL0ZaS2dPL3pRbTFKR1RXaHhw?=
 =?utf-8?B?dzhOS1ZoR0Y2Q3o0RUVldkdZb1hQLzNLL3pxMFdWaWh4WTBVUk8yUnFUMGhu?=
 =?utf-8?B?SDRZL1dhOXdmWG9MWTQrb2FGSHNPa1BBVVJzejhKTnkvSHp4dkQ1NW5Idldy?=
 =?utf-8?B?ckdtUzJsY2xEVW9ISHJ3S0FENk04cnRnYjNmaUlEazg3eDNneXZGK1UxdUw1?=
 =?utf-8?B?ZzRPQjQ0dDRMNDk1b0tJUU5HdlplcnRFWGZGQW1PcGVpNTJOWU9wNHNXSXB0?=
 =?utf-8?B?aFRYQ3lXZzhnd3VkdjVuc0luZkVRbmx6Z3JjSUdDTnBGbnYxYmFkeEtjTUVB?=
 =?utf-8?B?dnc2a01SL1NBSWdzRlhwbTRIVUpmeDE3OFVEZkQwOVR0VjNpNmFiMjR2RnQy?=
 =?utf-8?B?OS84Z2pqU0M2N1JyZjEybTRGMTlxSVZrS296cm11eWNnOXpNUkw5N1NzNjE0?=
 =?utf-8?B?ai9BRUcrckFIb212c3ltaWVOTm16L2tKQlJkQ0JtbXV5NUw4MGQraHB1ZzBo?=
 =?utf-8?B?S004ckd6M1NncktqUTdkU2x0djVLbmxubU45cmVXVitqWnl5aUd3anJlWGkv?=
 =?utf-8?B?elloT1ROdzIxM2hCaWt2UUNaSlFMYmU5T3pEUllybnJFUnQ2Nit2Wkc4SUVH?=
 =?utf-8?B?VDUvTTFtV1UrQ3Ftcmt4aUpzSFU4dzNGWXF4cDlZVXJXbHY5OHpQYjF5Q0pz?=
 =?utf-8?B?dlhrV1p6MzBxUWx6WXFJaENzRHNDOG1Ea09YR0dPUlV0ZkpXckZXbHhIQVpx?=
 =?utf-8?B?dDFjNjJhcGtKVzJVaXdDYzk5NjFycmVqekZNVmhpb0ppdEhsRDNoaEY0dHR5?=
 =?utf-8?B?T3FOSHVrNHkvM2liQjE0RlhsT04xOEZURFhMZzgzNnFaajY4d3VJZHlnb1N6?=
 =?utf-8?B?ZFI0a0hNRkozcVpJRFFDeG9ta2xWeU1oL0Jwd1IzaTgzVHdsK0tBSUpZUmlw?=
 =?utf-8?Q?/FMsMd5vdRzDRiYS+x8bkyMbAjChnHeMNIAnPDi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6591
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1e280ff6-78aa-41db-0fdd-08d91691a99a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OgrhXJr7yyahNnrf5pruVjn1yxXhFp/BCDhLzUOPlmKylRLBgmZSp/Sc0pxCFTUTsykSw1pxXuS/on+4JyU7/8qIpHq+3TPGsXrC51Y0u7UQbEzKBhpu/xpoySqStNxUtbIh3fU6Xo66hDbXIBVkSdDZqCGDhIQLBiM2liXOaz9OTQI7/cHaQPUfd4DhnEp5sNULjAW5DdrCdMyHXLzk119uXNheRnHgZzQBNO784dOa+suUZJRRqlp+u/AyX5u7fuz4lpPuYKv1suIroxxbEHcjEWBUGd0pmOQUv/biK9NTj3RIgN+uSH7fKvMLaObLXG+EatiUVMv10ZzZ4QkIUAW4OiCXLOpfjsWfIBhbHdT5iYeyC8zQ5cq2coGgoaMkOFwp/boO0+UTPNwyhA4dGs5aQfsU0Ekb1eZtXSJPaP6r0ON5p7w4hAIKnyplQgum8GCQECHHgVBwgahIa7Iid/ZUdN5XGTp2nOZtKOgyly+jvQ65a2VPuSOegxCYbMowu+kLqoiUgPktSUsvURJYz2BXu9+iSoO53DuIjUp0sQiXPpmcIfYKC7yuaP8RZifXYXpsnGuFi3c/TFDLDjQymFgwSIaSVp4eSnjKrG4eHEdRX7C3Uemq2rVUgD6+WHlJrhPcHxds8hAUNfMcicqzP6bNTr7BfovQ2y8keQp3pno=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(396003)(376002)(46966006)(36840700001)(82310400003)(83380400001)(52536014)(70206006)(5660300002)(110136005)(316002)(54906003)(186003)(36860700001)(8936002)(70586007)(4326008)(2906002)(6506007)(26005)(7696005)(9686003)(55016002)(356005)(33656002)(478600001)(82740400003)(336012)(81166007)(8676002)(86362001)(47076005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 04:35:33.9752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e8274a5-dec8-4b25-c728-08d91691b6bc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5233

PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KSGkgSnVsaWVuLA0KDQo+IA0K
PiBPbiAxMS8wNS8yMDIxIDAyOjExLCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+IEhpIEp1bGllbiwN
Cj4gSGkgSGVucnksDQo+ID4NCj4gPj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9y
Zz4NCj4gPj4gSGkgSGVucnksDQo+ID4+DQo+ID4+IE9uIDA3LzA1LzIwMjEgMDU6MDYsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+ID4+Pj4gRnJvbTogSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4N
Cj4gPj4+PiBPbiAyOC8wNC8yMDIxIDEwOjI4LCBIZW5yeSBXYW5nIHdyb3RlOg0KPiA+PiBbLi4u
XQ0KPiA+Pg0KPiA+Pj4gd2hlbiBJIGNvbnRpbnVlIGJvb3RpbmcgWGVuLCBJIGdvdCBmb2xsb3dp
bmcgZXJyb3IgbG9nOg0KPiA+Pj4NCj4gPj4+IChYRU4pIFhlbiBjYWxsIHRyYWNlOg0KPiA+Pj4g
KFhFTikgICAgWzwwMDAwMDAwMDAwMmI1YTVjPl0gYWxsb2NfYm9vdF9wYWdlcysweDk0LzB4OTgg
KFBDKQ0KPiA+Pj4gKFhFTikgICAgWzwwMDAwMDAwMDAwMmNhM2JjPl0gc2V0dXBfZnJhbWV0YWJs
ZV9tYXBwaW5ncysweGE0LzB4MTA4DQo+ID4+IChMUikNCj4gPj4+IChYRU4pICAgIFs8MDAwMDAw
MDAwMDJjYTNiYz5dIHNldHVwX2ZyYW1ldGFibGVfbWFwcGluZ3MrMHhhNC8weDEwOA0KPiA+Pj4g
KFhFTikgICAgWzwwMDAwMDAwMDAwMmNiOTg4Pl0gc3RhcnRfeGVuKzB4MzQ0LzB4YmNjDQo+ID4+
PiAoWEVOKSAgICBbPDAwMDAwMDAwMDAyMDAxYzA+XQ0KPiA+PiBhcm02NC9oZWFkLm8jcHJpbWFy
eV9zd2l0Y2hlZCsweDEwLzB4MzANCj4gPj4+IChYRU4pDQo+ID4+PiAoWEVOKSAqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqDQo+ID4+PiAoWEVOKSBQYW5pYyBvbiBDUFUg
MDoNCj4gPj4+IChYRU4pIFhlbiBCVUcgYXQgcGFnZV9hbGxvYy5jOjQzMg0KPiA+Pj4gKFhFTikg
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPiA+Pg0KPiA+PiBUaGlz
IGlzIGhhcHBlbmluZyB3aXRob3V0IG15IHBhdGNoIHNlcmllcyBhcHBsaWVkLCByaWdodD8gSWYg
c28sIHdoYXQNCj4gPj4gaGFwcGVuIGlmIHlvdSBhcHBseSBpdD8NCj4gPg0KPiA+IE5vLCBJIGFt
IGFmcmFpZCB0aGlzIGlzIHdpdGggeW91ciBwYXRjaCBzZXJpZXMgYXBwbGllZCwgYW5kIHRoYXQg
aXMgd2h5IEkNCj4gPiBhbSBhIGxpdHRsZSBiaXQgY29uZnVzZWQgYWJvdXQgdGhlIGVycm9yIGxv
Zy4uLg0KPiANCj4gWW91IGFyZSBoaXR0aW5nIHRoZSBCVUcoKSBhdCB0aGUgZW5kIG9mIGFsbG9j
X2Jvb3RfcGFnZXMoKS4gVGhpcyBpcyBoaXQNCj4gYmVjYXVzZSB0aGUgYm9vdCBhbGxvY2F0b3Ig
Y291bGRuJ3QgYWxsb2NhdGUgbWVtb3J5IGZvciB5b3VyIHJlcXVlc3QuDQo+IA0KPiBXb3VsZCB5
b3UgYmUgYWJsZSB0byBhcHBseSB0aGUgZm9sbG93aW5nIGRpZmYgYW5kIHBhc3RlIHRoZSBvdXRw
dXQgaGVyZT8NCg0KVGhhbmsgeW91LCBvZiBjb3Vyc2UgeWVzLCBwbGVhc2Ugc2VlIGJlbG93IG91
dHB1dCBhdHRhY2hlZCA6KQ0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9wYWdlX2Fs
bG9jLmMgYi94ZW4vY29tbW9uL3BhZ2VfYWxsb2MuYw0KPiBpbmRleCBhY2U2MzMzYzE4ZWEuLmRi
YjczNmZkYjI3NSAxMDA2NDQNCj4gLS0tIGEveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gKysr
IGIveGVuL2NvbW1vbi9wYWdlX2FsbG9jLmMNCj4gQEAgLTMyOSw2ICszMjksOCBAQCB2b2lkIF9f
aW5pdCBpbml0X2Jvb3RfcGFnZXMocGFkZHJfdCBwcywgcGFkZHJfdCBwZSkNCj4gICAgICAgaWYg
KCBwZSA8PSBwcyApDQo+ICAgICAgICAgICByZXR1cm47DQo+IA0KPiArICAgIHByaW50aygiJXM6
IHBzICUiUFJJX3BhZGRyIiBwZSAlIlBSSV9wYWRkciJcbiIsIF9fZnVuY19fLCBwcywgcGUpOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gRllJOiBJIGhh
dmUgdG8gY2hhbmdlIHRoaXMgUFJJX3BhZGRyIHRvIFBSSXBhZGRyDQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdG8gbWFrZSBjb21waWxlciBoYXBweQ0K
DQo+ICsNCj4gICAgICAgZmlyc3RfdmFsaWRfbWZuID0gbWZuX21pbihtYWRkcl90b19tZm4ocHMp
LCBmaXJzdF92YWxpZF9tZm4pOw0KPiANCj4gICAgICAgYm9vdG1lbV9yZWdpb25fYWRkKHBzID4+
IFBBR0VfU0hJRlQsIHBlID4+IFBBR0VfU0hJRlQpOw0KPiBAQCAtMzk1LDYgKzM5Nyw4IEBAIG1m
bl90IF9faW5pdCBhbGxvY19ib290X3BhZ2VzKHVuc2lnbmVkIGxvbmcgbnJfcGZucywNCj4gdW5z
aWduZWQgbG9uZyBwZm5fYWxpZ24pDQo+ICAgICAgIHVuc2lnbmVkIGxvbmcgcGcsIF9lOw0KPiAg
ICAgICB1bnNpZ25lZCBpbnQgaSA9IG5yX2Jvb3RtZW1fcmVnaW9uczsNCj4gDQo+ICsgICAgcHJp
bnRrKCIlczogbnJfcGZucyAlbHUgcGZuX2FsaWduICVsdVxuIiwgX19mdW5jX18sIG5yX3BmbnMs
DQo+IHBmbl9hbGlnbik7DQo+ICsNCj4gICAgICAgQlVHX09OKCFucl9ib290bWVtX3JlZ2lvbnMp
Ow0KPiANCj4gICAgICAgd2hpbGUgKCBpLS0gKQ0KPiANCg0KSSBhbHNvIGFkZGVkIHNvbWUgcHJp
bnRrIHRvIG1ha2Ugc3VyZSB0aGUgZHRiIGlzIHBhcnNlZCBjb3JyZWN0bHksIGFuZCBmb3IgdGhl
DQpFcnJvciBjYXNlLCBJIGdldCBmb2xsb3dpbmcgbG9nOg0KDQooWEVOKSAtLS0tLS0tLS0tYmFu
a3M9Mi0tLS0tLS0tDQooWEVOKSAtLS0tLS0tLS0tc3RhcnQ9ODAwMDAwMDAtLS0tLS0tLQ0KKFhF
TikgLS0tLS0tLS0tLXNpemU9N0YwMDAwMDAtLS0tLS0tLQ0KKFhFTikgLS0tLS0tLS0tLXN0YXJ0
PUY5MDAwMDAwMDAtLS0tLS0tLQ0KKFhFTikgLS0tLS0tLS0tLXNpemU9ODAwMDAwMDAtLS0tLS0t
LQ0KKFhFTikgQ2hlY2tpbmcgZm9yIGluaXRyZCBpbiAvY2hvc2VuDQooWEVOKSBSQU06IDAwMDAw
MDAwODAwMDAwMDAgLSAwMDAwMDAwMGZlZmZmZmZmDQooWEVOKSBSQU06IDAwMDAwMGY5MDAwMDAw
MDAgLSAwMDAwMDBmOTdmZmZmZmZmDQooWEVOKQ0KKFhFTikgTU9EVUxFWzBdOiAwMDAwMDAwMDg0
MDAwMDAwIC0gMDAwMDAwMDA4NDE0NjRjOCBYZW4NCihYRU4pIE1PRFVMRVsxXTogMDAwMDAwMDA4
NDE0NjRjOCAtIDAwMDAwMDAwODQxNDhjOWIgRGV2aWNlIFRyZWUNCihYRU4pIE1PRFVMRVsyXTog
MDAwMDAwMDA4MDA4MDAwMCAtIDAwMDAwMDAwODEwODAwMDAgS2VybmVsDQooWEVOKSAgUkVTVkRb
MF06IDAwMDAwMDAwODAwMDAwMDAgLSAwMDAwMDAwMDgwMDEwMDAwDQooWEVOKQ0KKFhFTikgQ29t
bWFuZCBsaW5lOiBub3JlYm9vdCBkb20wX21lbT0xMDI0TSBjb25zb2xlPWR0dWFydCANCmR0dWFy
dD1zZXJpYWwwIGJvb3RzY3J1Yj0wDQooWEVOKSBQRk4gY29tcHJlc3Npb24gb24gYml0cyAyMS4u
LjIyDQooWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMDAwODAwMTAwMDAgcGUgMDAwMDAw
MDA4MDA4MDAwMA0KKFhFTikgaW5pdF9ib290X3BhZ2VzOiBwcyAwMDAwMDAwMDgxMDgwMDAwIHBl
IDAwMDAwMDAwODQwMDAwMDANCihYRU4pIGluaXRfYm9vdF9wYWdlczogcHMgMDAwMDAwMDA4NDE0
OTAwMCBwZSAwMDAwMDAwMGZmMDAwMDAwDQooWEVOKSBhbGxvY19ib290X3BhZ2VzOiBucl9wZm5z
IDEgcGZuX2FsaWduIDENCihYRU4pIGFsbG9jX2Jvb3RfcGFnZXM6IG5yX3BmbnMgMSBwZm5fYWxp
Z24gMQ0KKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyAxIHBmbl9hbGlnbiAxDQooWEVO
KSBpbml0X2Jvb3RfcGFnZXM6IHBzIDAwMDAwMGY5MDAwMDAwMDAgcGUgMDAwMDAwZjk4MDAwMDAw
MA0KKFhFTikgYWxsb2NfYm9vdF9wYWdlczogbnJfcGZucyA5MDkzMTIgcGZuX2FsaWduIDgxOTIN
CihYRU4pIFhlbiBCVUcgYXQgcGFnZV9hbGxvYy5jOjQzNg0KDQpUbyBjb21wYXJlIHdpdGggdGhl
IG1heGltdW0gc3RhcnQgYWRkcmVzcyAoZjgwMDAwMDAwMCkgb2Ygc2Vjb25kIHBhcnQgbWVtDQp3
aGVyZSB4ZW4gYm9vdHMgY29ycmVjdGx5LCBJIGFsc28gYXR0YWNoZWQgdGhlIGxvZyBmb3IgeW91
ciBpbmZvcm1hdGlvbjoNCg0KKFhFTikgLS0tLS0tLS0tLWJhbmtzPTItLS0tLS0tLQ0KKFhFTikg
LS0tLS0tLS0tLXN0YXJ0PTgwMDAwMDAwLS0tLS0tLS0NCihYRU4pIC0tLS0tLS0tLS1zaXplPTdG
MDAwMDAwLS0tLS0tLS0NCihYRU4pIC0tLS0tLS0tLS1zdGFydD1GODAwMDAwMDAwLS0tLS0tLS0N
CihYRU4pIC0tLS0tLS0tLS1zaXplPTgwMDAwMDAwLS0tLS0tLS0NCihYRU4pIENoZWNraW5nIGZv
ciBpbml0cmQgaW4gL2Nob3Nlbg0KKFhFTikgUkFNOiAwMDAwMDAwMDgwMDAwMDAwIC0gMDAwMDAw
MDBmZWZmZmZmZg0KKFhFTikgUkFNOiAwMDAwMDBmODAwMDAwMDAwIC0gMDAwMDAwZjg3ZmZmZmZm
Zg0KKFhFTikNCihYRU4pIE1PRFVMRVswXTogMDAwMDAwMDA4NDAwMDAwMCAtIDAwMDAwMDAwODQx
NDY0YzggWGVuDQooWEVOKSBNT0RVTEVbMV06IDAwMDAwMDAwODQxNDY0YzggLSAwMDAwMDAwMDg0
MTQ4YzliIERldmljZSBUcmVlDQooWEVOKSBNT0RVTEVbMl06IDAwMDAwMDAwODAwODAwMDAgLSAw
MDAwMDAwMDgxMDgwMDAwIEtlcm5lbA0KKFhFTikgIFJFU1ZEWzBdOiAwMDAwMDAwMDgwMDAwMDAw
IC0gMDAwMDAwMDA4MDAxMDAwMA0KKFhFTikNCihYRU4pIENvbW1hbmQgbGluZTogbm9yZWJvb3Qg
ZG9tMF9tZW09MTAyNE0gY29uc29sZT1kdHVhcnQNCmR0dWFydD1zZXJpYWwwIGJvb3RzY3J1Yj0w
DQooWEVOKSBQRk4gY29tcHJlc3Npb24gb24gYml0cyAyMC4uLjIyDQooWEVOKSBpbml0X2Jvb3Rf
cGFnZXM6IHBzIDAwMDAwMDAwODAwMTAwMDAgcGUgMDAwMDAwMDA4MDA4MDAwMA0KKFhFTikgaW5p
dF9ib290X3BhZ2VzOiBwcyAwMDAwMDAwMDgxMDgwMDAwIHBlIDAwMDAwMDAwODQwMDAwMDANCihY
RU4pIGluaXRfYm9vdF9wYWdlczogcHMgMDAwMDAwMDA4NDE0OTAwMCBwZSAwMDAwMDAwMGZmMDAw
MDAwDQooWEVOKSBhbGxvY19ib290X3BhZ2VzOiBucl9wZm5zIDEgcGZuX2FsaWduIDENCihYRU4p
IGFsbG9jX2Jvb3RfcGFnZXM6IG5yX3BmbnMgMSBwZm5fYWxpZ24gMQ0KKFhFTikgYWxsb2NfYm9v
dF9wYWdlczogbnJfcGZucyAxIHBmbl9hbGlnbiAxDQooWEVOKSBpbml0X2Jvb3RfcGFnZXM6IHBz
IDAwMDAwMGY4MDAwMDAwMDAgcGUgMDAwMDAwZjg4MDAwMDAwMA0KKFhFTikgYWxsb2NfYm9vdF9w
YWdlczogbnJfcGZucyA0NTA1NjAgcGZuX2FsaWduIDgxOTINCihYRU4pIGFsbG9jX2Jvb3RfcGFn
ZXM6IG5yX3BmbnMgMSBwZm5fYWxpZ24gMQ0KKC4uLkEgbG90IG9mIChYRU4pIGFsbG9jX2Jvb3Rf
cGFnZXM6IG5yX3BmbnMgMSBwZm5fYWxpZ24gMS4uLikNCihYRU4pIERvbWFpbiBoZWFwIGluaXRp
YWxpc2VkDQooWEVOKSBCb290aW5nIHVzaW5nIERldmljZSBUcmVlDQoNCkhvcGUgdGhlc2UgY2Fu
IGhlbHAuIFRoYW5rIHlvdS4NCg0KS2luZCByZWdhcmRzLA0KDQpIZW5yeQ0KDQo+IENoZWVycywN
Cj4gDQo+IC0tDQo+IEp1bGllbiBHcmFsbA0K

