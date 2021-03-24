Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B49C347647
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 11:38:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100904.192527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0tl-0002YR-34; Wed, 24 Mar 2021 10:38:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100904.192527; Wed, 24 Mar 2021 10:38:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP0tk-0002Y2-VY; Wed, 24 Mar 2021 10:38:00 +0000
Received: by outflank-mailman (input) for mailman id 100904;
 Wed, 24 Mar 2021 10:38:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fjen=IW=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lP0tj-0002Xx-Pr
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 10:37:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.88]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf3dff37-a6e8-47e3-b9d1-1878f58b7225;
 Wed, 24 Mar 2021 10:37:56 +0000 (UTC)
Received: from AS8PR04CA0123.eurprd04.prod.outlook.com (2603:10a6:20b:127::8)
 by AM6PR08MB2966.eurprd08.prod.outlook.com (2603:10a6:209:4e::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 24 Mar
 2021 10:37:54 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::5d) by AS8PR04CA0123.outlook.office365.com
 (2603:10a6:20b:127::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26 via Frontend
 Transport; Wed, 24 Mar 2021 10:37:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 10:37:54 +0000
Received: ("Tessian outbound f15357ab733e:v89");
 Wed, 24 Mar 2021 10:37:54 +0000
Received: from 3ded44272dc6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E093AD1F-6F01-494A-952A-EB6976973C25.1; 
 Wed, 24 Mar 2021 10:37:47 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3ded44272dc6.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Mar 2021 10:37:47 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR0801MB1950.eurprd08.prod.outlook.com (2603:10a6:800:8c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 10:37:46 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::1c0d:d340:1408:f642%4]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 10:37:46 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:13a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.24 via Frontend Transport; Wed, 24 Mar 2021 10:37:45 +0000
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
X-Inumbo-ID: cf3dff37-a6e8-47e3-b9d1-1878f58b7225
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t56DnTJw6DzNJnAsMXt2TX6uT1vbJ+Bkkvpe/sYC3KQ=;
 b=Uqxn4BJzWNcTNletGBNtGvz1YIy4s1vVbKAZeYhf28e/BPzmzZFyOJpmw8rUbefryMbjHXnw238pCtD/7ToZdzPB6TD4N53TmSKpgjGLowLmefaSfqhYZmKIF/8Q6ebAxuZ8HCPkZ5nGP9Tc8ax46W2fZJOX6CBfhyDR6oS5Oto=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4204077317d35e2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NqHOwjYzS5rKon78kXWLG1jJwMHt21s2VVcTxSGbezfvIlJEPAaMgFdPWjnSUWXetdowbU0FLhHO44CwmPrndVeF0VuaXCxi2kau6ZxZjpK209lhv4zlUzozMk0LbEiW8zgCnctfpBpCEP/G+b9832BWE58V6Dg9oPkrifCS6D2drP/QkuutsUgdPBtn5qHT5KYj+QJA9PL8jVGTU4Z3T3qGHPPDR414wtgnGYS7PiT3zUkMOtUXJRUkOQcD3K9QGLa7YuwgoNg8XDf9WE4KSSnXH0/fjq3NwpfNQMEe77yG+KUugtoMNpZzY8j+CCSXBzq4XC5CnfJ3TQqAWBU56A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t56DnTJw6DzNJnAsMXt2TX6uT1vbJ+Bkkvpe/sYC3KQ=;
 b=GNGd7F/r7HJgfAaDLKec3mAf3zZxZGYjxUSHtGfSJXGElYG0P0uTUO9tgeB0RCDAvaz5iw71maLs3mI6t1vlq+zxA5AZBykOLBP0Se1/ZTTNHEOGRj65CPPpnvJpNgKPH5oxqjiY1KiEljhAUjIHJLLoFUEpg65jo7mscCXyyqEEONUzhjDbEJeRzGpb4DbgDXT8mRxa+Qw8Z5W1cXFo4Qis4qvO8JZeaZuOqI4LWxx4a/Nlt1fno6e9qdXo5RTllrAQ2tlIIOXKLT366ekgwh/iBmZb0B6ogIlN9c9AG+7FzOYzw3cy4xJfY9NHzSgdXM26yJjJHbPi00ghyheGsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t56DnTJw6DzNJnAsMXt2TX6uT1vbJ+Bkkvpe/sYC3KQ=;
 b=Uqxn4BJzWNcTNletGBNtGvz1YIy4s1vVbKAZeYhf28e/BPzmzZFyOJpmw8rUbefryMbjHXnw238pCtD/7ToZdzPB6TD4N53TmSKpgjGLowLmefaSfqhYZmKIF/8Q6ebAxuZ8HCPkZ5nGP9Tc8ax46W2fZJOX6CBfhyDR6oS5Oto=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: xen/evtchn: Dom0 boot hangs using preempt_rt kernel 5.10
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d5551ce9-6934-6228-e9da-e1ecc87ec015@xen.org>
Date: Wed, 24 Mar 2021 10:37:39 +0000
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <94DFDBDE-184D-4332-80B5-A8327DE2EA99@arm.com>
References: <VI1PR08MB3629824170C1707255465D8BE46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <VI1PR08MB36292202FAA817F9FFDCAD81E46A9@VI1PR08MB3629.eurprd08.prod.outlook.com>
 <cb4badc8-a932-2d4e-956e-4d474a137b0b@suse.com>
 <EC3489FE-8151-4EE7-B177-22CC2F92131C@arm.com>
 <1FAD6C91-2B3A-48F0-88D7-CFCFC8B53BA9@arm.com>
 <c2e9268d-daec-95d8-cbb9-a2d2ecf233ec@suse.com>
 <2BC82A95-DFB9-4F90-8CC6-AE39405157ED@arm.com>
 <CAKf6xptBm8G-T8UCfht22nfeS_4XOj2sN9fBvJhOVA1QKbfnhA@mail.gmail.com>
 <565C6475-4693-4A7C-8316-9613146300C2@arm.com>
 <2A09774F-ADDF-41B0-8E72-DC0FA0A6B1F3@arm.com>
 <d5551ce9-6934-6228-e9da-e1ecc87ec015@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO2P265CA0493.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::18) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 84fa74d3-a6c8-40a1-8f98-08d8eeb0e1cf
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1950:|AM6PR08MB2966:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB2966FB1F526A98AC8A1FEAC9E4639@AM6PR08MB2966.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 V9g1MMHeLsH39kHqadPrxLXUdWRSW8gNRAmREfscBwvq34SgQZnMCl+nL/j6erwZXOfGbRGsNe9N3jjtKv6Aj+GrZ3v93bKkvMm+P6+1U126mdDNkBfZZK4p5QePmc3I5+kwOGOzgHhXRnFTf8petxIRqoUgoP0d11HPdqnfvZHAN2bye0IIdfEh+3BOwNtE/b8mW8sT49NDwNY9jVhhTJZFqUqJtdpaITbr4JOHvp/+Lsu9CYSKTtKB4AkcQFdF9nsvvsU7CacmwKdeu4i1lcmGBu/eVM0D6iieC7y55aR138HPO+hqBoxFtxByBn8Dsf2EYuidZxQI8dECfxuNIxnCzN2v/35JxiH01+axN4udEoc8/BFuCru5bw4344Xrf8BGYz5YKRaD2XRJVfNxOTPCWyUH28SuaHBLnrjAfRoOWoCJhTJPJsBNQnX2XWekTuoevKGi06/RtMFP2EWdw2TAHh/7aPg9gAMMWMp34bVfcoQW2KZvNJuOEoWuI+rq4RqzfNbuXPlf0ju4sTHh+ocjCbfiRmmAficlVNmsBoNnv5PsuU5QduilHVZUJY5B6iian+YdoJHZ94l5qoqmL+7VqMPoPLXCoSpVJ//+Kw0wuu+kvPHE6WkGUuceBL31oKvhfbTYkf5jZuXY7GAhnJCqpP0Jk7iJjt+o/r1MKMZoKjVJOrKfQ4SiwbUz4AsCxPRK8melorMacXgHVhzl05FkOSGDe+PqudP25DqsXDtdSLBzBQF0Y/P8j1y/d6ynBY8F80RiGBK2oU7l3YNYUA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(86362001)(66556008)(66476007)(33656002)(2616005)(956004)(36756003)(66946007)(8936002)(8676002)(38100700001)(5660300002)(83380400001)(53546011)(6486002)(7696005)(478600001)(52116002)(2906002)(4326008)(316002)(44832011)(6916009)(16526019)(54906003)(6666004)(26005)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?YitMOUJ4bzlobEpnZHFsVWxJVUgzb1A4WEZjV2NGQmNhNFBrTm5FMGM1eUJs?=
 =?utf-8?B?TGczUDkxZ1J3UHlKZ091RUlmMTRaN2VBdGQxMUF5UDNHSGVkVnFPeXhJMnhT?=
 =?utf-8?B?b1ZxRExZTytSRnhsczBiMktuY3JSM2tmbjM0ZFUvRGVOZHBmS3hjOHVrcGxX?=
 =?utf-8?B?U1p2bDhObGJDYmswcHdRTWRLV29pNTJTd3BENmFWajdCN3RZYjNNOHA4cjdr?=
 =?utf-8?B?T1JaOW8rOGF5R0c0anVMczdNVVZJNHplY1pDdFNqbVhobDIvWUdrNlJPdWRD?=
 =?utf-8?B?c2hNakNacnMzbjNJc2NWaGJBU09hZE1YOTBwNUw5WDN2bkFLZklQK0pYNkkv?=
 =?utf-8?B?OEVQWXZjN1NoVGo4NEQyOFdEZGtTdEZmU1UyQzcrNkEvWFR0QVQ3OXJlS0Y1?=
 =?utf-8?B?YjlWVUZEN1Rucm9TQ2ZjcWFBbWlQdmVEZnFJQlVBT1lWb2cxdVp5bGVoYVpt?=
 =?utf-8?B?K3REM1FDNDRqNWJiZTJ4Tkx0SEl2S0xoY0dMSSswMEFYYWVUbkpnSGVXTGto?=
 =?utf-8?B?dlk5dTVaaHQ2Y3NWUHY0aHRYQUx4dXNHL05iQmMzRVdjYWtYMzV2T2hUa2tG?=
 =?utf-8?B?UjdKOTlld01wSkxMUkJUNHJwN2NPV1ZaSU5LY3RHbW5zUURZQkR2RFZGVktH?=
 =?utf-8?B?T1gzZUlFOFZIUkhzd1JjaVlzWG93a1Yrek90UVRJQ3dyTi93VmpCYWZqVEJJ?=
 =?utf-8?B?dUJubzluRlA0d0F5V29RQmExSGtXa213emZMYWF4eGlVTHdHRCsyWm9SM2pa?=
 =?utf-8?B?OUFneWRyWTJBMzZzdmhvZmxjNklZOU9jR2JKQWM5WEF1UnhzRTFsVmFFUVJm?=
 =?utf-8?B?Nm1QRjd6QWRtdXc4am0xNzBGSHJWb1dxVWZ3L3p5ZmJ1UnJkS2NuZ0MxcW1O?=
 =?utf-8?B?NThaRkhxM2FkV3B2eVlpZXVZMEdkZmdkQkdOWE9pZGpmK3J3RWRnTW1GSlBl?=
 =?utf-8?B?V3d0WU02Z2VFelc0c1RmaTAyY1doNUwxVjNkWjRKNFdZWm8xNkUyU2RwUHFl?=
 =?utf-8?B?b0VCekNQb3NzRm5Id1VQVTVUaTR0N2o1RThoQmhpNlVyQTZrM3ZBeXJxb1BI?=
 =?utf-8?B?VVlGbzZZMWJMRS8yaTcvQjJSK3NlcUhCSlBGajJzV1pTSWQ3TTdXNEdXL1h3?=
 =?utf-8?B?VnI1RC9ncjdKOCtLZCt6U3ZRS1VvNS9DNnRZbXFhQmRMYzF1NG9LY213WTNr?=
 =?utf-8?B?Zkx5MVNxb0VTMUhjSHVvbG5na0FIL2NDWU1VcHFIanpVSzVTVGQ2Qzc2TzdB?=
 =?utf-8?B?WkVWcEVzU3F4Y2U2Z25YVmpNd3RmTU9KdkRTNHN0d210MGhTMnFuMHZsMUx1?=
 =?utf-8?B?Nm55OCt5Vjl2aUljWi9MQjVlY1VEVTNsY2ZUV0VoWlZJc3M3WDJiRUtEa2Nk?=
 =?utf-8?B?ZDZoRVpxRTFvdlVvdVdMVGt4S1JUa2JEWEg4SkZrT0NtcTcreXMwMnB1Z1RP?=
 =?utf-8?B?bUFxbzV2WWRlQ3RyNjF6a0s0ZERMVTd3TS9lRWUrV01LZDJFVnhiM2JEU1g3?=
 =?utf-8?B?cFE5VWN6aEZmTlBoczhzc0lKOUNsRTdtVXRZLzBkNE8vYmwrZ1NNanB3Y0JL?=
 =?utf-8?B?cWdNb0swa08vWWRWOEZidlVSckN1bW1aSUlIU1AyNjN5dG4rZjlHQjBIcTJk?=
 =?utf-8?B?VWdTUnRLS1BoL0I0elJ3OTNBWWxxb2hCUGZHSCtBSDRpQ0o0aFppaUptRzVU?=
 =?utf-8?B?MDJ1anlhTE1XRGJHM2dYdWZQdHBkUUJPMHZDRUdEMFQ2emNoR1FIMSs5OWwr?=
 =?utf-8?Q?0xCekO04svi7DBkKlTyhrktNLD9JPWaNXhKhgU9?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1950
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe9a5673-67cc-4335-e2e6-08d8eeb0dce5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MU8Kp9GSwXOrsfUt8dUawKIcNBRbjz8cE5DGKs8ssGX0z5rbj8V1j6jctcxfimddmBdgUy2gVo35WEh1FVyB/V7AER0R1gB1BDiZi25H7ATtjk6V4TG6hCd05a14hNdkmAtrRcE+xqLmrFE8qMCCskI3hYUZlZmXEa3uxL/FWG677FFlBf+72nmqXxWF0CDU0n++cfVG4MTyi4h3OrbL07sy57YqRqX19zK2GXCQLd/bGZsU4SCOO3int5SJ3AEkRtlr2EB3l1mUsPBfUKPB9baM/7aH9/LLDu0/64CGWZrmNNvtMzS5zxhh8m2nrTHC9kaqoXDhO5YlOGXsxBuGkbdC/Hup0iUfNXg77XoW1+lL/ccOirlOHn/cTt/Vzcjo/lywdCRyv6Juuj45Z/7vc9thb2tbJqwPLLiKFC4kulOsxepAFgqbDsvabJLub2vFmjzDwmsZQsQyVPLULGFbdIfQOmEfVOqw/mLY0Khm1jVUL5k4kMF0IiC5FoR7chwjqDsim1nPoxaKbJwS7q8IibfOALKy5wwj7lNE5bRx24nBwQ80akJHIYXJhEkHOvVuAuPyCsb2F+paIZa9btaU6MuUe8O1zD80IURjDrQVzQdUg+HDO7LBi3qzjxi7UxfYSJvjbhJsE8BHx8/cfXVOe6T9y2oF3m4K8WkIQgxbZoONVIW7P2SzqYjndV0A6KkeJ9wqpX2CXz29PeIGS4OOyYOsuTjDxIsZ3fDX0S9rHck=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(136003)(346002)(36840700001)(46966006)(53546011)(2906002)(6486002)(83380400001)(54906003)(478600001)(956004)(7696005)(8676002)(6862004)(8936002)(36756003)(316002)(86362001)(70206006)(82310400003)(2616005)(70586007)(107886003)(44832011)(4326008)(336012)(6666004)(81166007)(356005)(26005)(5660300002)(47076005)(16526019)(186003)(33656002)(82740400003)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 10:37:54.2436
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84fa74d3-a6c8-40a1-8f98-08d8eeb0e1cf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB2966



> On 23 Mar 2021, at 19:26, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 23/03/2021 17:06, Luca Fancellu wrote:
>> Hi all,
>=20
> Hi,
>=20
> Please avoid top posting when answering to a comment. This makes more dif=
ficult to follow.
>=20
>> I have an update, changing the lock introduced by the serie from spinloc=
k_t to raw_spinlock_t, changing the lock/unlock function to use the raw_* v=
ersion and keeping the BUG_ON(=E2=80=A6) (now we can because raw_* implemen=
tation disable interrupts on preempt_rt) the kernel is booting correctly.
>> So seems that the BUG_ON(=E2=80=A6) is needed and the unmask function sh=
ould run with interrupt disabled, anyone knows why this change worked?
>=20
> Do you mean why no-one spotted the issue before? If so, AFAIK, on vanilla=
 Linux, spin_lock is still just a wrapper to raw_spinlock. IOW there is no =
option to replace it with a RT spinlock.
>=20
> So if you don't apply the RT patches, you would not be able to trigger th=
e issue.
>=20
> As to the fix itself, I think using raw_spinlock_t is the correct thing t=
o do because the lock is also used in interrupt context (even with RT enabl=
ed).
>=20
> Would you be able to send a patch?

Yes I=E2=80=99ll send a patch soon

>=20
>>> On 23 Mar 2021, at 15:39, Luca Fancellu <luca.fancellu@arm.com> wrote:
>>>=20
>>> Hi Jason,
>>>=20
>>> Thanks for your hints, unfortunately seems not an init problem because =
in the same init configuration I tried the 5.10.23 (preempt_rt) without the=
 Juergen patch but with the BUG_ON removed and it boots without problem. So=
 seems that applying the serie does something (on a preempt_rt kernel) and =
we are trying to figure out what.
>>>=20
>>>=20
>>>> On 23 Mar 2021, at 12:36, Jason Andryuk <jandryuk@gmail.com> wrote:
>>>>=20
>>>> On Mon, Mar 22, 2021 at 3:09 PM Luca Fancellu <luca.fancellu@arm.com> =
wrote:
>>>>>=20
>>>>> Hi Juergen,
>>>>>=20
>>>>> Yes you are right it was my mistake, as you said to remove the BUG_ON=
(=E2=80=A6) this serie (https://patchwork.kernel.org/project/xen-devel/cove=
r/20210306161833.4552-1-jgross@suse.com/) is needed, since I=E2=80=99m usin=
g yocto I=E2=80=99m able to build a preempt_rt kernel up to the 5.10.23 and=
 for this reason I=E2=80=99m applying that serie on top of this version, th=
en I=E2=80=99m removing the BUG_ON(=E2=80=A6).
>>>>>=20
>>>>> A thing that was not expected is that now the Dom0 kernel is stuck on=
 =E2=80=9CSetting domain 0 name, domid and JSON config=E2=80=A6=E2=80=9D st=
ep and the system seems unresponsive. Seems like a deadlock issue but looki=
ng into the serie we can=E2=80=99t spot anything and that serie was also te=
sted by others from the community.
>=20
> The deadlock is expected. When you enable RT spinlock, the interrupts wil=
l not disabled even when you call spin_lock_irqsave().
>=20
> As the lock is also used in interrupt context (e.g. with interrupt masked=
), this will lead to a deadlock because the lock can be held with interrupt=
 unmasked.
>=20
> This is quite a common error as developpers are not yet used to test RT. =
I remember finding a few other instances like that when I worked on RT a co=
uple of years ago.
>=20
> For future reference, I think CONFIG_PROVE_LOCKING=3Dy could help you to =
detect (potential) deadlock.
>=20
> Cheers,
>=20
> --=20
> Julien Grall

