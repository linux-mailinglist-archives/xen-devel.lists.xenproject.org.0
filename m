Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB00346316
	for <lists+xen-devel@lfdr.de>; Tue, 23 Mar 2021 16:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100729.192099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj7x-0003CD-69; Tue, 23 Mar 2021 15:39:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100729.192099; Tue, 23 Mar 2021 15:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOj7x-0003Bo-2V; Tue, 23 Mar 2021 15:39:29 +0000
Received: by outflank-mailman (input) for mailman id 100729;
 Tue, 23 Mar 2021 15:39:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7DPu=IV=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lOj7w-0003Bj-5J
 for xen-devel@lists.xenproject.org; Tue, 23 Mar 2021 15:39:28 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b19534c-5cf1-479d-b067-3604f398811e;
 Tue, 23 Mar 2021 15:39:25 +0000 (UTC)
Received: from AS8PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:20b:331::16)
 by AM0PR08MB4211.eurprd08.prod.outlook.com (2603:10a6:208:101::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 15:39:23 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::a7) by AS8PR04CA0161.outlook.office365.com
 (2603:10a6:20b:331::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24 via Frontend
 Transport; Tue, 23 Mar 2021 15:39:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 15:39:22 +0000
Received: ("Tessian outbound 1b6dfb84c254:v89");
 Tue, 23 Mar 2021 15:39:22 +0000
Received: from c89e4f24d179.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C10AAF13-8745-48D7-AE28-11FCAFDF8682.1; 
 Tue, 23 Mar 2021 15:39:16 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c89e4f24d179.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Mar 2021 15:39:16 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5247.eurprd08.prod.outlook.com (2603:10a6:803:10d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 15:39:14 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 15:39:14 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0007.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:62::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Tue, 23 Mar 2021 15:39:14 +0000
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
X-Inumbo-ID: 8b19534c-5cf1-479d-b067-3604f398811e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA+dwOzGZZMSncEvtsR8v1wR30ZJazGZNB8d4LHiXYU=;
 b=RVefpZ38ysph/ZjoZ/MBHZX9KzWaJOk+F0/I6Ulnwi+StZIyqlRlZP9Y+V96A+5X0y99NSyTsdahQ6O8+hYlpgpn4RbKcLTSN76yGQzApQF99HgvfpaMKbRVlOPtPi2ScxXCe6tI25Nm3xCqoCLzofYflaO9Ua7KM9ocK/udlF8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9abf29e6e069d103
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpSal36fpqDkeA/+IbJSiCwWTPVsdbZrpeEqwIlfaQNH+IwALzGtzXhnjko8BS3ruRBtEsQca4rS/yus9IiO49cxr5kkG+hNWizmig39wxGX4lHg3JaiMxDmIMJHCfnp/vBQzrPkauTb6qRcs4aJYGt/Opdyf9M9XZ6jGL2nfq6xALZTYQF6JVQW5N24wGR9lDTJToVX0LwXnFsLTU1bNWVQsaVMeNioBT9XNfz+wwYwq0F45f5bow/KxKdVP7B4Ku4b2oyMvLgmpHbmibq6P0cCUYfI1wjRNmkyD0Io9bWmWKAM1orBwcbqxpFBR/3+/Gxd/v/Fmn/bmgDrHw6vAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA+dwOzGZZMSncEvtsR8v1wR30ZJazGZNB8d4LHiXYU=;
 b=jX+qzQxGn4M7G2M/ubQix1bDp7/7aHGY7HSnoWXD8Vy/IQ2h8QM6D4eQnji7e//at2T9Ugrz38MvB7oYfLnoVarF9NKwuJKzVMXGuPP/h/87fw2b7HIa4U7Qf9LE2wWfjWLgf+WVJB8w7LK5jMC0DWboMRkJJJGpE1aKaHPxa2Vv48Vc3d39uifOXdqpZnuvnCeab80pAKcZhMVDuklDeej2z5PP1s2vpJvhmyJk0o4pGvO7GMj0MhKFNjCrjUAP6SzfJUb1TY1nLVBfv8BIGetwHjiK7YykAki67iE5eFjvspdLU1gCKWaGVVTq7f1xkxBEcWNd5D5GBZtDJts+6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA+dwOzGZZMSncEvtsR8v1wR30ZJazGZNB8d4LHiXYU=;
 b=RVefpZ38ysph/ZjoZ/MBHZX9KzWaJOk+F0/I6Ulnwi+StZIyqlRlZP9Y+V96A+5X0y99NSyTsdahQ6O8+hYlpgpn4RbKcLTSN76yGQzApQF99HgvfpaMKbRVlOPtPi2ScxXCe6tI25Nm3xCqoCLzofYflaO9Ua7KM9ocK/udlF8=
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
Date: Tue, 23 Mar 2021 15:39:07 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
 <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
To: Jason Andryuk <jandryuk@gmail.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0007.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::19) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5db10e64-9f4b-4c90-cfcf-08d8ee11d50c
X-MS-TrafficTypeDiagnostic: VE1PR08MB5247:|AM0PR08MB4211:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4211ED0041BEDF6067C567F2E4649@AM0PR08MB4211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kvB62FGkB4a9uagHRaWIVsrSYF/HXJeIHQE7nGICcC1lEdjV+cKc6+ji1Sy8ajDOwAeBNNZ87U9dlc1KZb78OG5Kh+2rvqyqJyKgm26jrYbwL9UUc+9H7JvAZXfVmHHZxl5IJY2/Ig2HZmrIjTsHErPsIxf0jjLXZKOtptY+/WKvdlgbottg6kUYPeUqiIEVyRWDS26/lhjzgfqo3u5IElcgtgz9HNOtGeInL3H7Y5JRJEQFlGn7AKmHIPo3FtSmpqUT1grT4h5nQXidvRE8xBXVpWWLekxAUXSTNYTGmk8q5q8Xt8bkbN0FineK82Ct3UbJh1l+j9jTNrrwJHrj0yfC9VoEdL50cHt9RKji/dKjKnFFe9aHCWiBttsGqq/ffHCznir1sBL19ZnfvasixjhNepjiPMISDeceovyR2eKr/1IKQewkrzQB5WuqsPrsDeCJPFXrYNzJ55ymKAcGNyCmY4YbsUSkZaCDUb0sNep0U9HNDTgqflAc4dtlwz1sHlcMsZ9H4TOX9uM6pDWA1MXYy+WV0p2DrU7Av7jMoLGIYQNJ3vJY0lEePuURtjOqlOX7c1JZMPL8VSK+K2CTypwfZE85YK/V/5etWyMxlHpgo/d3VkGboJfeNG5kdMuODU0KZr/GyX1+U912eOsA7zN4y29OlixyYkEeIVcVcUNrdL7jJ/+kNTkJeIF6NTAGA5+LwelzmcHCgGtzo2OA81jRg0tG9mBLxQ8QxHaXocOj1mcUFcw4daq/B1z8Nnqe2a5llKXFJlxO8HSwm/NmpQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(366004)(16526019)(36756003)(186003)(83380400001)(6486002)(4326008)(6916009)(316002)(6666004)(8936002)(26005)(2616005)(5660300002)(86362001)(52116002)(956004)(478600001)(66946007)(2906002)(38100700001)(33656002)(66556008)(44832011)(8676002)(7696005)(66476007)(53546011)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?Y0VJMm5HOVM4dEN4YzI2dEFJVnNjaE0xa1B5NW5BbzJ2bkdQUHdTVmhwMVl5?=
 =?utf-8?B?RWlJU1BlZGpKK3Vhak1GZkNzQXd1TWg3b1JXUzl5ODNld1FtRFRKdG43RFRR?=
 =?utf-8?B?UDhBUlJnNDlvZ3VOSmtoSlo3VkpPT0NtWXVudWFnR1dJalBuZnJjYXRJUWZK?=
 =?utf-8?B?MzJERDUyRExvdW1FQVhIMjV1NFJYaXR5ZmxNVW16ZGxlZUZzZ0lxV0FXOTYr?=
 =?utf-8?B?cG94dStlc01lR2ZUSUN4Sm5WMEZ2VTRCR2t5bkhFTWh0a3VsMER1dEg2U29Y?=
 =?utf-8?B?bG9OUWo4SWVUTU51dGJzOVpCaXdjZDQwOVBSRUNMTXBqalh0eForenpaYzc1?=
 =?utf-8?B?emN0RVdGOVZybnpMYWVKZVlONXNXVHp0TitScVRWbW1vcXJETVgrUHV2a2hy?=
 =?utf-8?B?c3ZKNmZxc3dkb3VuUTVoNW0yWUUrWmNnNDl0SzZLdU9kNGFkZzNaZ0xFNDF6?=
 =?utf-8?B?M2xVOVBCTHptbjR6ZXliOTZCZENhemdoUEYrRzB1c2dYR1R3WmwvMXdyREFL?=
 =?utf-8?B?L0p2amNuRzlRUnpRSlViRGtSWU1rSU8wQXJ1UUd6VVJCeTR4SkgzMGlXK3Jz?=
 =?utf-8?B?YXR4V092UU5qaXptdmUwMjZFT0JpbmR1MlVyUUFlOEU3V1RuUFBRL0sxMXJF?=
 =?utf-8?B?UXJ3ZjVWazlFL09aMVRYenlRZDFta0ppTFFxQ3haZ3M5cHRjYndHeFliOEVW?=
 =?utf-8?B?ZFRxRmJMN3BsNVJHUkFSc2d1WWkzZWtlTlBIMlQrUGRwY0NqVWJISlljYnVr?=
 =?utf-8?B?cE1Xak5KVDlKc2hJalM1M3pEOEZ5VUZkWlV6NmJmUGZpc1Awc1VFNlVmeUZ4?=
 =?utf-8?B?aGZyM3ovLzZsNVNQYVA2eml2b0Foa2hqcll4dXhycWpwOGE2bXRzY25selJS?=
 =?utf-8?B?dlJrdGhFc2IzdWVEVG9zcjZWbjhMS1YvWG95aEN6aHZITW13VWYyaWFjcHBY?=
 =?utf-8?B?eEpOVFl1TWF6cXhKazQ4eFgwRzNUaXJRZ25RVTZlVnpqRWx5b2pQVlFtRE83?=
 =?utf-8?B?VFZqWGxhQUxNcTFxVS96dUVyWTltbERxNzFmNEgzZFduZWtPTFpGa3FDUnZx?=
 =?utf-8?B?K2t5NndJTE5TK1JMVUxUN1VWVlkyYldRMTV3ODEzUngzNjdSRDlLV3B4MnFa?=
 =?utf-8?B?WEVZeUZPVGtxRzduaWYxRHpWQXFqTmxNY3ZXL3BWazRtRENYVEM0TllaTUFZ?=
 =?utf-8?B?QWcreW1wa3pGVUFUSHlSaHNXUWdOU2RhZDNmdzJMejJ1L3ExMmkzamVvaEhy?=
 =?utf-8?B?R2xOTkMwQkdFbEQxNlNGNVBJaTBpNmgyTmV5UVZpRldsQ2dFV2FvRkUzbXgx?=
 =?utf-8?B?OUhWYTAvTVpQM1RTcnoxZ2tqUmVHQlNva2RlczJNNWI5T3RCaWpKQzh6YTd1?=
 =?utf-8?B?WUhSQXNkOW9JMldRdHdGbDFLVTAzMGdVM2ozVWhhMXd2MXdGM3JoczNxMVpM?=
 =?utf-8?B?MGJKWnJuanNEQ00raEhLV1ZuL1pwZmFUQ0xZajVXR1djSXIydFJZZ29RTy9P?=
 =?utf-8?B?UzhpZk9rQVZ6WTRCd2k0cUsyc1duRU5zWlhsRndrNnAwQnNyUzYvdUxHSXJy?=
 =?utf-8?B?ZnptWGNHcDJpZFlyc1pSalplU2dYWGpGU2diUHRNa1MyeDg1RUdvWnVmbmFp?=
 =?utf-8?B?L0p6V3hXKzJzSXJHVXRYVkxURUx5VDVYUlRVSmZKbHRhdmpEdS8ybVVqRitT?=
 =?utf-8?B?MnF4a3M4bHVQWmdIMUFHT1BpaFJxbTNta1kweGlvQ1lXOGJGemRkYTRXenFr?=
 =?utf-8?Q?Oqby29Yjcx5l42qajHOF62t4Ea3zcj2MHkxSvfV?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5247
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6a72198a-cb97-4354-d298-08d8ee11cffc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O7rYP8nSaGkTBR/2+vlNyU63NsTHKcimaZ0fmd4Jf6cRXrturIXlCT5a+vkkwX5YaFTnKvnYwKJdY74Du2Xp2VdiWcBixm6f3ckM6TMeVCVxcAhjELro4Y3sKLnuixq3wZuvTQxBjn0n+yn9NjXaQ9hX7pR5lyQrgSEWgTCYM9Spd9D4v891V9DmeBV2mliHHP2KAs5Hwi5wCG5pbWJivHzQEULabjCPOWSg9HcsBGbGmQ/Lx1AOVXjQqPp+15uR9/S1vbcH6/SKmW4l3EYgFZA+xV8IiYT6aE3CbxHdOizhqdh6SHbYsI+vk23kiMKPxS6rIWce1J9w16Go+g1A3r6VyyklpidgrDHMAPyRZGwM46V+iC1gWxcGLjMaqJB9Dszk48ySSyt6umqTeE7mgzpgw4Ff1Ion5dk6DXfnMG/4BOYB1Jfvy9yyfx5A2p3YCAaHjQ7bxXFhmc4FScSy4/tZCMQihagUqMYid1UjaWrlzzxtszUOf8aIr0FtDywfJ58VXvYZ23GBCI8PQ5NsxyYms2CrsDN5oZiMwS66yu14FGyYuxb7p2XAdgKOONpcwBPnoxVNKxovZ56AefKGEzavMMTCjTNKFNy5YSIA+xn7OYdvy741jhje0+MhZcSFsLIcJt/oS+35ZrDaeukp+o4rS2M13ejctYuTGzEBzj1v7C6y/J0g+GZXopCHQS5PjWv4sckPUR3WcrNvSmxp6nzd6EciJkFwmZZpRMxymR4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(346002)(136003)(46966006)(36840700001)(81166007)(5660300002)(36860700001)(6486002)(82740400003)(8676002)(82310400003)(44832011)(186003)(8936002)(478600001)(33656002)(16526019)(2906002)(4326008)(70586007)(36756003)(6666004)(26005)(7696005)(6862004)(2616005)(70206006)(336012)(83380400001)(86362001)(53546011)(316002)(47076005)(956004)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 15:39:22.8612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db10e64-9f4b-4c90-cfcf-08d8ee11d50c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4211

Hi Jason,

Thanks for your hints, unfortunately seems not an init problem because in t=
he same init configuration I tried the 5.10.23 (preempt_rt) without the Jue=
rgen patch but with the BUG_ON removed and it boots without problem. So see=
ms that applying the serie does something (on a preempt_rt kernel) and we a=
re trying to figure out what.


> On 23 Mar 2021, at 12:36, Jason Andryuk <jandryuk@gmail.com> wrote:
>=20
> On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu <luca.fancellu@arm.com> wro=
te:
>>=20
>> Hi Juergen,
>>=20
>> Yes you are right it was my mistake, as you said to remove the BUG_ON(=
=E2=80=A6) this serie (https://patchwork.kernel.org/project/xen-devel/cover=
/20210306161833.4552-1-jgross@suse.com/) is needed, since I=E2=80=99m using=
 yocto I=E2=80=99m able to build a preempt_rt kernel up to the 5.10.23 and =
for this reason I=E2=80=99m applying that serie on top of this version, the=
n I=E2=80=99m removing the BUG_ON(=E2=80=A6).
>>=20
>> A thing that was not expected is that now the Dom0 kernel is stuck on =
=E2=80=9CSetting domain 0 name, domid and JSON config=E2=80=A6=E2=80=9D ste=
p and the system seems unresponsive. Seems like a deadlock issue but lookin=
g into the serie we can=E2=80=99t spot anything and that serie was also tes=
ted by others from the community.
>> Do you have any idea on that?
>=20
> I think this can happen if xenstored isn't running.  Client access to
> xenstore blocks until xenstored becomes available.  So check your init
> scripts ordering.
>=20
> Regards,
> Jason

Cheers,
Luca=

