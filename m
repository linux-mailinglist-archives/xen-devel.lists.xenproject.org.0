Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3533634012B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Mar 2021 09:48:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98841.187737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMoJY-0006zi-9p; Thu, 18 Mar 2021 08:47:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98841.187737; Thu, 18 Mar 2021 08:47:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMoJY-0006zM-6D; Thu, 18 Mar 2021 08:47:32 +0000
Received: by outflank-mailman (input) for mailman id 98841;
 Thu, 18 Mar 2021 08:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hxsu=IQ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lMoJW-0006zH-P2
 for xen-devel@lists.xenproject.org; Thu, 18 Mar 2021 08:47:30 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.5.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55a5a849-ff6d-4fe5-a5d0-93db679bce82;
 Thu, 18 Mar 2021 08:47:27 +0000 (UTC)
Received: from DU2PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:10:3b::15)
 by PR3PR08MB5676.eurprd08.prod.outlook.com (2603:10a6:102:82::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 08:47:25 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::98) by DU2PR04CA0010.outlook.office365.com
 (2603:10a6:10:3b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 08:47:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 08:47:24 +0000
Received: ("Tessian outbound 259fb7427a57:v87");
 Thu, 18 Mar 2021 08:47:24 +0000
Received: from cad2983a9133.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D6E58E56-CFF0-4D6B-A259-B704B630338E.1; 
 Thu, 18 Mar 2021 08:47:17 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cad2983a9133.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 18 Mar 2021 08:47:17 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VE1PR08MB5661.eurprd08.prod.outlook.com (2603:10a6:800:1b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 08:47:15 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 08:47:15 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0069.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:153::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Thu, 18 Mar 2021 08:47:15 +0000
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
X-Inumbo-ID: 55a5a849-ff6d-4fe5-a5d0-93db679bce82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOaFZqw/94qy9TlAD5tyDSboUXLAWK6+zX2L7IxX6dE=;
 b=anJUY5wh6o1S6iMtKPSFO/ById3hlWXKvKM3Eyjxmpf3LjDGvBrG79/ZL9V9N//NGx5+TF+8Pim6/Qe2+8e38NS50jh5LKAnKmXaHd163NRz4FCbz9mrsmtKwFtq1eER5ARgbJXpoPlY+94ytAadvJHm/b5mXMu8akPNnQ/bk88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0c83773d974617e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G305x5fNoKgG4fcFqLXQx8I1HJrncUWk3GEIoyWlvT7gAtm2i4Xwtpq3kCn+Dm130jHauAaIYH5UOHTiwkoHA9v2BLkM9Teo23T5wxIfqXLnxO5GlZabZYWLz1qljgzKUQ6FdMrx1t285AWyGnYBUz5B+TYRQcFc2LCLwhY+btBje7PgZbHrLMEHDtY2bBd01mEJ5pP1qwq1WrOAxIRDsI63W4c25F28PfRbVKNAa6O/EN0y+4F5heS/iRYPmhb3nJx5tavIyO+eghf2R/FfVvFWrXSKnrIpssa/ApEDgQ4tL+R6E5gciKmlbkehIGyd5Dabfcqp18Ivhq+WXGwQrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOaFZqw/94qy9TlAD5tyDSboUXLAWK6+zX2L7IxX6dE=;
 b=JbqJNkDETlBnF0i6JgYX8RiTGrCUpWw956j+97WW6Hk+vEI3YIvfQsYFpbDiiYr4Jyxgyy1Ioi7RzBIiKgfduDsF+C5etYmKLmRjXpb/NxbploxViZAkKEXDTjiZ67hyuYNUYGZE44MOoWI/vvJmOOtRlO5kpNNQF4/FyA4X+zPJ379CAFoidAhqX2w3bpiglsL5L4zxAOkoV8LOJ4xJh585EogWgIBgX/Wfil2UOo+ldiynldkmFeuZNCHm2sVV+I97kbi8m+RJIS2mC8fvYjetzwy/pcJVDyF/jkY0m4JQk5XrhXjuMAWMkwb2aQXT/r17toQFon2sOjUlplkwKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOaFZqw/94qy9TlAD5tyDSboUXLAWK6+zX2L7IxX6dE=;
 b=anJUY5wh6o1S6iMtKPSFO/ById3hlWXKvKM3Eyjxmpf3LjDGvBrG79/ZL9V9N//NGx5+TF+8Pim6/Qe2+8e38NS50jh5LKAnKmXaHd163NRz4FCbz9mrsmtKwFtq1eER5ARgbJXpoPlY+94ytAadvJHm/b5mXMu8akPNnQ/bk88=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
Date: Thu, 18 Mar 2021 08:47:07 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "jgrall@amazon.com" <jgrall@amazon.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0069.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::20) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9c4a6b2-629f-4fe8-cbe9-08d8e9ea73d5
X-MS-TrafficTypeDiagnostic: VE1PR08MB5661:|PR3PR08MB5676:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB56766628C83EF828EAA5957CE4699@PR3PR08MB5676.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3jLtFGf1izX1kvs825T8ZIz9LivRGxlZ2SaQi3yTq1q684EcJ4etgH1dGoyWarAshv0iD157RGoN+wB7xhsg2oDVLOG/Hc2RdgKXxf0Q4vc+FdEq7J4/AjlFWzGEDkqpC+n1m1Pg1AKX/T8NhZ09gmuQQTpLY6bfebD6EyOAS17C7SxF1uKOP6Ig2RUB8K+KwuSY3e5sA6k13tO7rjxMo+YKLXC7asa00xRmDD5eEJ8UaCk3C18jozqFC0El3GWj9ck3D0PuvZ5Z9+W4nvf91g4X2V0Znv2YyYtKLMKXGnL0cWWTJTMq5PFkIPSPvh3n+rgI3+4JLJTJzpOK3vg15oghlJznQmlnBPjtf+/zTITtIA+ZJHOe3eZXJWguWdGMumdbg2uRAteFi+TT9a+Q3DQ/yk1fyfvnSywQymGzzFKw9l9zJ4YBgZ1Yhy4XSavWUVDN7DiHsfYnPAzyI1YsMvgLmRlKE8Z/P/eRO/qra/vg8kUXfPquADVMHjMTepgvYwRHrVJ/YztKla4aIyW2UBZ/bzr0HMqsoPO9p8xFvaLPBTHlW35GT/5voKEzWdj3UnTSJnH0B4XXNWuIbyPEmTmP5NWgiAjvwtNleY0D9nKs5VUIulOzqGfr1pcLjFvlLu89rkrgq/GiIgMCpUx9GA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(376002)(346002)(136003)(66946007)(6916009)(6486002)(7696005)(86362001)(66476007)(8936002)(5660300002)(33656002)(52116002)(83380400001)(38100700001)(6666004)(4326008)(66574015)(36756003)(53546011)(54906003)(316002)(44832011)(478600001)(2616005)(26005)(8676002)(186003)(16526019)(2906002)(45080400002)(956004)(66556008)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NTl1L0NYM0ZPbjg3MEpWWkh2bzllbyt5M2t6TXB6MXpUN05IaXIzbmRBVlBO?=
 =?utf-8?B?bm82UldSY3dKbXNXWnNzNnkxaGtjeGc3YjhKQUVhcTh1VmFEZ0NEeEoxNmdM?=
 =?utf-8?B?SndwbVhHZ1BnRVU2N2REeC80ejBwQWt5TG1JTjB3NFR2OE9aQ0N6YW1CRW9L?=
 =?utf-8?B?bkR4TEFQREpaWDFFQk0vTkx3Nm5CMmRCK1B6cmtQUFNoTVgvUFVVbWVFWlJp?=
 =?utf-8?B?VG1iWkVicnRMRkxvOW9lNU5TSzNuQ0ZGcGdnS3NGTXZtNUpaSFM2cW80TExK?=
 =?utf-8?B?SzFFMC9lK2NvUXdvUnYvVWNvbm5EczEwc2toNUxlM3RWR1FBUXIycUFaL3o0?=
 =?utf-8?B?TEsyUWVqMXAzY0hCc245M0FiNll4aEdFYS9saVZCaWx4dVhHT2srcnVMVWEw?=
 =?utf-8?B?NUw5MzhSZExUeDdVMlFaMncxYUt5ai8wTTBvTlgrUVRuYWsra3ZZSndnNEI5?=
 =?utf-8?B?bWMvdnpxanBMWk0rRWp0NUJoc29EWjFhbnRaU1h3YmFVT3NkZ3FsVTRqS2o1?=
 =?utf-8?B?QlJwMDI2VC8rQk9SMWlOajlBaEhsTEs1TFREZTdZS3JrZnVRS0RvMnVBYlZI?=
 =?utf-8?B?UFVMeGpiSHR0dmdSb1Q5U3FvL1EvM2VVcDVyeUNkOFV5Z2ZhYkpORlpQLzNi?=
 =?utf-8?B?Y2xWZXh3TVM1RnU0WUFYSnArRVEySHQvUWNSK0F4Yk1Zdk5QTWxkNDBvNTBV?=
 =?utf-8?B?WkdDak1Ja1h2RkY4c2xzc3pDcllJekNha0x4SVRINm1hemZQNFNXcGdhdUll?=
 =?utf-8?B?N0JkbmJKVWRWL0crVFBZOHFvK2oxWnNZNi8wN2FpUXBSenYxMEswVE8rbTBl?=
 =?utf-8?B?bXo4ZW9zK29FSHlmVDY0a1E2RE52dUJJbGdzeUxmKzlNZUpITGM0N3dNN3VV?=
 =?utf-8?B?TzgrRTc2SWtRQlBYRlF6QXl2OEl1ZEhsU3FpZlhFTWlBMEM5OXV6UjJsbmVy?=
 =?utf-8?B?WkhLYkFYTUxHa2c5Y0xzc0lOVlRuNzB4YWN2L21wdjROanhNcU13K1ZyNWht?=
 =?utf-8?B?dkY4U1kvSGdBSWZPVVhPOVptTU81c0Z6cy84M2t2UW9kMSs0OHlZUVdzZ0t4?=
 =?utf-8?B?MFIwVnhIYWZxUFVWc1hMYUlVZ1dqd09XQ3pidTd5dVF4WDNoK2pORS9aenQ4?=
 =?utf-8?B?Sk1MZGV6Q3JBQkRraHlLMy9HamZvcGdoL1RYbHVMeFFKejlwYW1Ob2F3eFZ1?=
 =?utf-8?B?Ny9VWEpyaU85b29UTGhjTzNIMDVtRWpOVWxaL09SQXhlaDc5dktCRllSc3Z1?=
 =?utf-8?B?K2hUdnV4S2RpRW84VHlYbkFWS2RsTkZ4cXFIRzl5TVBzQU44L1ZzbHp2dUxF?=
 =?utf-8?B?elY5Y1lpK3pkYVRjMTNDOWtYZ1JBOXl5dmVKZHIwZU90OGNOa0lrWExleGhj?=
 =?utf-8?B?N3E5NjQ3L04xR2xDOVRPL21FL09rdk9rMFp2Q2VwNGNnZ2dqVFZYQzFiRm1i?=
 =?utf-8?B?UWJZNUkrY2lQNUprT0h1MlkzYUd2K1FDVDNNNDdhaWF6WVpYREgvMTcyUUtB?=
 =?utf-8?B?eTdaazFrWW92THM2WWNyTnFZOXlZWVZWUDF2bjc4aVBFWnkvN3d6Z0JFMTBl?=
 =?utf-8?B?QkRLekxPYy8xUldqeTB4cTFQeGNxc3ZvZWQwQmZrNVdXY1BMYWowWk5CYk50?=
 =?utf-8?B?Y1VwTDAzdCtEVENzOEFScTlQWVpRM1FveFdOd2FrMU1iZXVNeWxzOCt1ejda?=
 =?utf-8?B?ajM5THFCNDcrL0c4cmRNNmZRbFZUSE5IK0JUdU9RTnVvUTZBS0k2OTdXb1ZC?=
 =?utf-8?Q?ZCPuh/Wc2l5lR7TctatY5bnSiMsGNjw3h9/aoXO?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5661
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0161cdbf-80e1-4128-2030-08d8e9ea6e3d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N43gc9c9YJ3DWlwntdain9z50OJWBAbelvIPywJ1j/p85Z68GvcR0E/ajDlPIf68w5kKJCGKzyct/e/Ot9Srl/53oc7rohqXO3vZMS3t8J8k0n5cqYylwfGorH6Tmr46V5SwvzwlMYoHdT9wPZQ8/8cf29eTxnk5g11Md5dBsp4PF55XjLuzNaD4u1fLZhl54SAc60al6A5FzOlo9mUZUwgyenZp7xiTwst29nenUr38lMSf+fjqDya9fqfMvfKh8eoIY8WGVsvrx+DEHI5x2SERTtXYryFsrinG4y7ER2qwhSZyXtoS1qBJh92OIP4VXzUz+phD3sX+vn84F3+oco8yfGmPOhuCFU3JCNZDoBbpWeOrrhQmHyO4ERuT99RkOzQPulnVSnoaYuSzIArQhcpuf11FWWWTRmA08EOqiTSVHsQbUG74l+ImjWuvpRhliQcf2qJFqyf/1mzK1xQN2mQAbuI4afAMwgP0ucvxvHDUIut1D3hbd05FWYOaNjAKrMN2wopgehs8YGYMCq2VMNmXgK148Ky59VY2r9cYkDzQzQ2kM2s/TUPE5HTupmpjxFk1JRrYJNG82TrCXDN9i2L6o1oYN4CVPkXJJbyIJDNgZhDflrhIl1WdTLuEiuKNcM+Z3eOaW6O5/RYt048lPLC0xlFGhffwRxmiej0Jrtk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(36840700001)(46966006)(81166007)(83380400001)(5660300002)(316002)(7696005)(70586007)(4326008)(6666004)(6862004)(26005)(356005)(336012)(8676002)(70206006)(6486002)(8936002)(186003)(86362001)(45080400002)(16526019)(47076005)(82310400003)(54906003)(107886003)(36860700001)(33656002)(44832011)(478600001)(2906002)(36756003)(956004)(82740400003)(66574015)(2616005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 08:47:24.7815
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9c4a6b2-629f-4fe8-cbe9-08d8e9ea73d5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5676

Hi Juergen,

If you are willing to do the patch I think it will be faster to being accep=
ted, what about the BUG_ON(=E2=80=A6) in evtchn_2l_unmask from events_2l.c =
file?

Cheers,

Luca

> On 18 Mar 2021, at 07:54, J=C3=BCrgen Gro=C3=9F <jgross@suse.com> wrote:
>=20
> On 17.03.21 15:32, Luca Fancellu wrote:
>> Hi all,
>> we've been encountering an issue when using the kernel 5.10 with preempt=
_rt support for Dom0, the problem is that during the boot of Dom0, it hits =
a BUG_ON(!irqs_disabled()) from the function evtchn_fifo_unmask defined in =
events_fifo.c.
>> This is the call stack:
>> [   17.817018] ------------[ cut here ]------------
>> [   17.817021] kernel BUG at drivers/xen/events/events_fifo.c:258!
>> [   18.817079] Internal error: Oops - BUG: 0 [#1] PREEMPT_RT SMP
>> [   18.817081] Modules linked in: bridge stp llc ipv6
>> [   18.817086] CPU: 3 PID: 558 Comm: xenstored Not tainted 5.10.16-rt25-=
yocto-preempt-rt #1
>> [   18.817089] Hardware name: Arm Neoverse N1 System Development Platfor=
m (DT)
>> [   18.817090] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=3D--)
>> [   18.817092] pc : evtchn_fifo_unmask+0xd4/0xe0
>> [   18.817099] lr : xen_irq_lateeoi_locked+0xec/0x200
>> [   18.817102] sp : ffff8000123f3cc0
>> [   18.817102] x29: ffff8000123f3cc0 x28: ffff0000427b1d80
>> [   18.817104] x27: 0000000000000000 x26: 0000000000000000
>> [   18.817106] x25: 0000000000000001 x24: 0000000000000001
>> [   18.817107] x23: ffff0000412fc900 x22: 0000000000000004
>> [   18.817109] x21: 0000000000000000 x20: ffff000042e06990
>> [   18.817110] x19: ffff0000427b1d80 x18: 0000000000000010
>> [   18.817112] x17: 0000000000000000 x16: 0000000000000000
>> [   18.817113] x15: 0000000000000002 x14: 0000000000000001
>> [   18.817114] x13: 000000000001a7e8 x12: 0000000000000040
>> [   18.817116] x11: ffff000040400248 x10: ffff00004040024a
>> [   18.817117] x9 : ffff800011be5200 x8 : ffff000040400270
>> [   18.817119] x7 : 0000000000000000 x6 : 0000000000000003
>> [   18.817120] x5 : 0000000000000000 x4 : ffff000040400308
>> [   18.817121] x3 : ffff0000408a400c x2 : 0000000000000000
>> [   18.817122] x1 : 0000000000000000 x0 : ffff0000408a4000
>> [   18.817124] Call trace:
>> [   18.817125]  evtchn_fifo_unmask+0xd4/0xe0
>> [   18.817127]  xen_irq_lateeoi_locked+0xec/0x200
>> [   18.817129]  xen_irq_lateeoi+0x48/0x64
>> [   18.817131]  evtchn_write+0x124/0x15c
>> [   18.817134]  vfs_write+0xf0/0x2cc
>> [   18.817137]  ksys_write+0xe0/0x100
>> [   18.817139]  __arm64_sys_write+0x20/0x30
>> [   18.817142]  el0_svc_common.constprop.0+0x78/0x1a0
>> [   18.817145]  do_el0_svc+0x24/0x90
>> [   18.817147]  el0_svc+0x14/0x20
>> [   18.817151]  el0_sync_handler+0x1a4/0x1b0
>> [   18.817153]  el0_sync+0x174/0x180
>> [   18.817156] Code: 52800120 b90023e6 97e6d104 17fffff0 (d4210000)
>> [   18.817158] ---[ end trace 0000000000000002 ]---
>> Our last tested kernel was the 5.4 and our analysis pointed out that the=
 introduction of the lateeoi framework (xen/events: add a new "late EOI" ev=
tchn framework) in conjunction with the preempt_rt patches (irqs kept enabl=
ed between spinlock_t/rwlock_t _irqsave///=E2=80=8B_irqrestore operations) =
is the root cause.
>> Given that many modifications were made to the mask/unmask operations, a=
 big one from Juergen Gross (xen/events: don't unmask an event channel when=
 an eoi is pending), is the BUG_ON(...) still needed?
>> With the mentioned commit every call to a mask/unmask operation is prote=
cted by a spinlock, so I would like to have some feedbacks from who has mor=
e experience than me on this part of the code.
>=20
> I think this BUG_ON() can be removed.
>=20
> Are you planning to send a patch?
>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


