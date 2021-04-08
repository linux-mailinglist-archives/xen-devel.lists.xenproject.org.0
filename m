Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AD5358291
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 13:59:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107212.204942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTJU-0001IN-0V; Thu, 08 Apr 2021 11:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107212.204942; Thu, 08 Apr 2021 11:59:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTJT-0001Hy-TK; Thu, 08 Apr 2021 11:59:07 +0000
Received: by outflank-mailman (input) for mailman id 107212;
 Thu, 08 Apr 2021 11:59:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0/ag=JF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lUTJS-0001Ht-F1
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 11:59:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.49]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 320f50d5-172e-49e2-a285-1f2b8c96e0d0;
 Thu, 08 Apr 2021 11:59:04 +0000 (UTC)
Received: from MR2P264CA0058.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:31::22)
 by VI1PR0801MB1742.eurprd08.prod.outlook.com (2603:10a6:800:4f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Thu, 8 Apr
 2021 11:59:02 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:31:cafe::ae) by MR2P264CA0058.outlook.office365.com
 (2603:10a6:500:31::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Thu, 8 Apr 2021 11:59:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Thu, 8 Apr 2021 11:59:01 +0000
Received: ("Tessian outbound 34291f7cb530:v90");
 Thu, 08 Apr 2021 11:59:01 +0000
Received: from 3f0be8201459.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5F86BD47-9416-4B97-87FF-9C59F1B49328.1; 
 Thu, 08 Apr 2021 11:58:55 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3f0be8201459.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 08 Apr 2021 11:58:55 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com (2603:10a6:803:7f::25)
 by VI1PR08MB3088.eurprd08.prod.outlook.com (2603:10a6:803:3f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Thu, 8 Apr
 2021 11:58:51 +0000
Received: from VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c]) by VI1PR08MB3629.eurprd08.prod.outlook.com
 ([fe80::9ed:7407:c969:2a7c%6]) with mapi id 15.20.3999.034; Thu, 8 Apr 2021
 11:58:51 +0000
Received: from a75445.arm.com (82.8.129.65) by
 LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Thu, 8 Apr 2021 11:58:50 +0000
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
X-Inumbo-ID: 320f50d5-172e-49e2-a285-1f2b8c96e0d0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV9XS5vGKjTneBedwAChbjN4gwvzrEfyz7p23sivjiY=;
 b=t6cFqK7zxbUIeECuPUkXQ+JPHpSh3aGQMt5fWKPQO47H4/4vkPMhYQRBluaGgn6+KFu7yd/VtMgNFfvRpEemyCGi06HwnjcS87+lnyXkz5Gjy0Bz4RravfIFGyG2VXCusx5/0/LS+dtCegYO6W0Nro0Wqk3MWfKxvm2epuMYNdw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 989b362828268f56
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcngLtb82++RIYCY/qQ/6vWW5z68tsl69RoB3ZAC6mDhBbiu7KpM00URM/35N3d6iOxbfVzkRVp+H7OcTA/3aPNL/dKX1Z/PRDH5KGvnEDg8WUuHzVLkSWXbfaLfgY2a7C51KqD9JjnItFd/8uOq28+aSLso7mGN8Xhd2bU1RhsXuaFjiObJfolAIGcL5IzoyBXd7KTi8wn3OdLldbxut/4OA3zd6F4gxOJgVey+Ro2r9d66U8h/7kVuSc1+SkvDPdKnEg/w2E+pvq2n7QCwNUSuC/c09/3ruEqmUeoYKVnMWSPjb9bjpK64kwOpbmzci36KAj+wQIH20o8YBBmOBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV9XS5vGKjTneBedwAChbjN4gwvzrEfyz7p23sivjiY=;
 b=oJ7BhiHgb79AklKP7EhSxwR1XU3X54jRunsiSguGWy0mTVjttGW5dvEOwU/HjsDHRR4Kw6/KXfIEQmwzF6EqnWnaeOv7BvzPq0PgCOKbYa4t/Ie0RrXVZJE6hSIUSpAS3K/w5h+/EX3aOZ+bv4z070svLAcNhvOJpAr6IcLj7poebrbp22jbmAOZbya88GcxVZ15SNknt9LOOMCBM1CRKMFYL1wu+DNaQkTjHKLT4c8M7YqUElIBG10R5LIhRYgAP4R67qaM2zcoyhq7Qi4g9DR4DwYQRZilb3e/MWbQhIYHheEpNsbh28BgZKB7Ihffp+dsFARvR7N9drpg2wIvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV9XS5vGKjTneBedwAChbjN4gwvzrEfyz7p23sivjiY=;
 b=t6cFqK7zxbUIeECuPUkXQ+JPHpSh3aGQMt5fWKPQO47H4/4vkPMhYQRBluaGgn6+KFu7yd/VtMgNFfvRpEemyCGi06HwnjcS87+lnyXkz5Gjy0Bz4RravfIFGyG2VXCusx5/0/LS+dtCegYO6W0Nro0Wqk3MWfKxvm2epuMYNdw=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
Date: Thu, 8 Apr 2021 12:58:41 +0100
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3AF7CE5E-2000-4B56-A23A-44AF094FC8AA@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
 <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
 <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0382.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::9) To VI1PR08MB3629.eurprd08.prod.outlook.com
 (2603:10a6:803:7f::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92007b47-61fb-457a-ee62-08d8fa85b343
X-MS-TrafficTypeDiagnostic: VI1PR08MB3088:|VI1PR0801MB1742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB174235AE452431EA85D00479E4749@VI1PR0801MB1742.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 r/3hIIAqKRk22VYp5UAW3OqZ9+KIHW/HaUOMlQ5EwRI1CDoGIsGOPzvqN2tXmhhV2b+v2sUM790p8M34bEUjn/dEnx8UQZJLKDqCNUT2DQkJRHyrlN8O2JcLEvd4Q1ItYMKwLAwVVG9ySfDEG9ST+AYrywBP1qH3T5nOY+E41B+IO5iJdOsd1Am1qZyGDAh3AtOa5qY6Eu7ZfxyP7mwJOUAzwZdERmLRvHpw5bM518hwZQp4lOUgTqFrSUylURR1UsKEHPralmKd94T3fwMvow9TlT3Q4MpKmw/8QpFb/LRXImQj4JjbDsTYZwNxsxFIPQSHxuogZU/ZEiN2EQqnYmkwaJX7ca7zz1FbknNzjqShx8XFF/C8DvMxYCWna+sUuoSFjHzTUkE1ow3MxnJi3Fqj7IDORgVXZ0vHbCDJRY9n/rl4r+OH6p//GNtwT52S9wnJECdFs6aGk0vWLkrjtSkQhzp8H/NHoVVkMD2QahDbhjK95DL3PNaMnAyAEQ2tMDSTmIVm5KD6D8BVDEXveuWH24YttQ+Wk5AxC+VHJrjHUJBZwFjvbONxWIgYTkmt/MJZv7Na8BCz6hMfhcxhs5wzn+kx3tNfD8QqN9YJUW2EVV5pwz8i1A+aoSc+UVvvyX+9Pt9AwORjE3yNW0vWLRKaWF6eDjnCw5CeqIkXGmU6uL1N9B0cRaNnn+oXd983Mh6SyOS0V3Vs3XVsAI+jAsjJonLrtUk0/PfRQShyzlM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3629.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(346002)(366004)(376002)(38100700001)(8936002)(2906002)(956004)(8676002)(26005)(186003)(66946007)(7696005)(16526019)(66476007)(2616005)(44832011)(83380400001)(478600001)(38350700001)(36756003)(4326008)(33656002)(53546011)(6486002)(86362001)(6916009)(6666004)(54906003)(52116002)(5660300002)(66556008)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData:
 =?utf-8?B?NmZYMTU5TmNObVJFUzBxODIxRVREVERtZnIrN1NVNExRbnQvaFl4cGkzUVc5?=
 =?utf-8?B?L3NCSHE2NTJrSU4xMXBCck1VcEpmZ1ZpamJMdHdlZytLYnR5RXI4NitrM2dN?=
 =?utf-8?B?NEpJbDBmdEZQV0NNRGVGd1Q2YzBFTmI2Rk0zU1JtQmxLdkVibkY3ckVFN05j?=
 =?utf-8?B?VXMwVHozN1BkcXRySnYwc0VMUVM4b2l2WWFtMktHSUREaHNDWlhEelJkVFpw?=
 =?utf-8?B?a3BNRlRXK3pHaFV6NDVrbElxWFhPbEhRdG5aSmVkMUZJT24raWpWekZKRUpP?=
 =?utf-8?B?cWp2NlhXZDdXZ0ttU2ZoTXpGeUExcmNiWW80TWNGOGp5NldGdkNGRVpKMlVv?=
 =?utf-8?B?U0FoeVhuTk5DVENLcUV4OUtTWW0vajV2UklOU2xkUnNqVjA4TWl1SEFWYlEy?=
 =?utf-8?B?WHI2M2pUQXNVYVU0SkxBd1dWWVlHL2k5bUo5N0xpUytPTWQ3SForNXlJTDFs?=
 =?utf-8?B?M0tUbHgxQmMraXhsZ3FiUUhndnh3NlRsY1lkN2pXTW5Rc1NWdDlJcytlR2ov?=
 =?utf-8?B?c2dOV1lVSDBUclQ0OEh3YmhOcm84TlZmSmVIcDFES1UrOFBON2FIYnZYMHJI?=
 =?utf-8?B?a25wRkxWeElmeHk1NU8zblVzN3c5YlBoQWk4ZlZwT21XT2NNekJGWFBHaXFC?=
 =?utf-8?B?ZENtanh2Y0VyM0V5MU14MmhKMS91Z0JzK2ZWbFlraG94OFhQTkovRElJL01V?=
 =?utf-8?B?QTVqY2VOTkwyM0YyeG5YZEFGdTFwRlhzenVpQ3RFV085bDUxUG9HMis1V25s?=
 =?utf-8?B?OTRhZ3lwQ0JRWHE3Ym03RnR4QmRLRGtmdTNoZmlPNjRmcnUvclJaeFRhNXM4?=
 =?utf-8?B?cHBQOGY1Rm80My9BZHNtY1pwZ1ZoNlc5L0JMVFo1WVdqbENTUmV1WHJvWEIw?=
 =?utf-8?B?UG5HT0tZajRkLzRJMkl3WUU0TXhmd1JXZEFKQ25hRldadUtjT2J0L0JvbzY2?=
 =?utf-8?B?VjJIQ0JsZWdDMzhyRDVQSllWejArT2RMRGpMMS9DOVdOaUgzTkc0cjA5N29W?=
 =?utf-8?B?R2RFaE5lMExlS3VyMWhQN1hwR2N3M0ZwZTNIUm9nVUZQdnhZdkdvV2M5eUxp?=
 =?utf-8?B?SWJyNFpBWVc0d2U2L0RBYWVBWllkZG12ME9RbkRqbDNRZE1LaFBGWjJBQmM3?=
 =?utf-8?B?MUJ1MUFIaXNxRTU5K0syeVVmeHRhZUoraE1JdHhKL1FNMmxza1ovVVBGVVJP?=
 =?utf-8?B?NHAyeFA1Z3h0VTA1OEhuREtZazhDRHNXbkZGTWdNMlIybVFoVEhBREEvaG91?=
 =?utf-8?B?Z3BMYkdsSmF0WlJsbzBYRUhnNVIzWStFK1lkWkQ2RllTWTN4U1NmVkYwRUFa?=
 =?utf-8?B?Q29wTUQ2b0pCMWREaWRtZEtPSEU3bWk1Y3BZY2kzNTFKOHR2Ym5lanc0QmZS?=
 =?utf-8?B?Ni9NK0Z4Qis4QzZheFowZHhQQzN4UFp1T05OVnRzeThkcDdFTWV4SnJMMnpM?=
 =?utf-8?B?WVlMZlEyMEk2aGFBN3BqNDd6OHJrMGsreGx0NHY5TXVISytsb0NiNzVjQU5C?=
 =?utf-8?B?SERzTHR5VW1GRWxlVk9YdEJIRHY4WTI0QVhHeUdqVXpRVjEwS1lQQ3VzenFq?=
 =?utf-8?B?Q1o3WW4zTm9ydHFQVWQ1QmVFRGtGTHY3UEFyZUxFc0p5RlVMKzYwb0RLaTZ0?=
 =?utf-8?B?Y09lRy9wcFlMZU5nUFZXRFFocFYvTmErR2pWWDdoN3FQRCtDM09HV3k2ZDVz?=
 =?utf-8?B?TlJBR0VpdzRPWFFzeG1rZmNKWm90ZHFEK2M3L01tZnNCV3c1SWVNTmdjTjVE?=
 =?utf-8?Q?BmRc76b1AOghodwsQuQxGvLORc0H5OdyZ2jcmBP?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3088
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e70065a4-6e59-4903-33a8-08d8fa85acff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QdxpDpqTLUihFyFue3dRDvz1CGm10cChhDtyZGZFH7vEfdWFNC5KE4c3pvhV6+jw5R4W1/QFzLHKk+3qSnvHg/PPdGhsRU1GZ+Z9TxhTX06E/GXzxY0VZuxrCdzAFQ7o9r40ZPFt5Q8XewkAFYOWOGx6wvRRIM/Uo2kWiCG0Yz+wohEk+giD7mg39hrdqxvqBY2LefS0nlo7QETLiRWBD6IUkF31NEJKFwfmChMhlSi5bbcbHyjK5ROE6W7C0/Fwhho6iZobsjBZsoq75aIT8qUyhCgYqGHg6MWJd/G5sfX4rE6E9KStTEs8zljS9RyKm31xO2RaZJ6Aco+viHQlNDfdC88UJtnq6uUl2V3Tv4aGhfyW190duBPc6ZLdr3UvIccC+G+/aqCJKyQ+IN82RxiZz5DaIAX9Fi1T9AUiZ170uzoXHtrvX8tpTNECiRkmjuXD/TgyVbUG4FvVlxPcrFQIr3wJf6S/65XCboxamqOI6toNEpVtSqr6s2erELSTvKyNic0+FGu5c+91fgfh2UONTNCWh3VcGL6wWSGUIfKQ2Vx3u06PdNpHwvfesAFa/KGpLXvS/NTYH4UVV+3pxjeGaVvdim8Urp8sfrRHgovPsvIyplsE1pPGXN1AP7eYr5dEbrxnZzOo+pUkUlO4eQjUeC0iCYraV55aTb+JYno=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(356005)(81166007)(186003)(26005)(2906002)(7696005)(83380400001)(82740400003)(478600001)(6486002)(54906003)(8676002)(36860700001)(8936002)(5660300002)(316002)(86362001)(4326008)(2616005)(6666004)(33656002)(336012)(956004)(53546011)(70206006)(70586007)(82310400003)(47076005)(44832011)(36756003)(6862004)(16526019);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 11:59:01.6423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92007b47-61fb-457a-ee62-08d8fa85b343
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1742



> On 8 Apr 2021, at 12:40, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 08/04/2021 12:02, Luca Fancellu wrote:
>>> On 7 Apr 2021, at 22:26, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>=20
>>> On Wed, 7 Apr 2021, Jan Beulich wrote:
>>>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>>>> Just to be sure that we are in the same page, are you suggesting to m=
odify the name
>>>>> In this way?
>>>>>=20
>>>>> struct gnttab_cache_flush {
>>>>> -    union {
>>>>> +    union xen_gnttab_cache_flush_a {
>>>>>        uint64_t dev_bus_addr;
>>>>>        grant_ref_t ref;
>>>>>    } a;
>>>>>=20
>>>>> Following this kind of pattern: xen_<upper struct name>_<member name>=
 ?
>>>>=20
>>>> While in general I would be fine with this scheme, for field names lik=
e
>>>> "a" or "u" it doesn't fit well imo.
>>>=20
>>> "a" is a bad name anyway, even for the member. We can take the
>>> opportunity to find a better name. Almost anything would be better than
>>> "a". Maybe "refaddr"?
>>>=20
>>>=20
>>>> I'm also unconvinced this would be
>>>> scalable to the case where there's further struct/union nesting.
>>>=20
>>> How many of these instances of multilevel nesting do we have? Luca migh=
t
>>> know. Probably not many? They could be special-cased.
>> There are not many multilevel nesting instances of anonymous struct/unio=
n and the maximum level of nesting I found in the public headers is 2:
>> union {
>> 	union/struct {
>> 		=E2=80=A6
>> 	} <name>
>> } <name>
>> I also see that in the majority of cases the unions have not meaningful =
names like =E2=80=9Ca=E2=80=9D or =E2=80=9Cu=E2=80=9D as member name, inste=
ad struct names are fine,
>> It could be fine to keep the meaningful name the same for the struct typ=
e name and use the pattern for the non-meaningful ones as long
>> as the names doesn=E2=80=99t create compilation errors?
>> Example:
>> struct upper_level {
>> 	union {
>> 		struct {
>> 	=09
>> 		} meaningful_name1;
>> 		struct {
>> 	=09
>> 		} meaningful_name2;
>> 	} u;
>> };
>> becomes:
>> struct upper_level {
>> 	union upper_level_u {
>> 		struct meaningful_name1 {
>> 	=09
>> 		} meaningful_name1;
>> 		struct meaningful_name2 {
>> 	=09
>> 		} meaningful_name2;
>> 	} u;
>> };
>=20
> If I understand correctly your proposal, the name of the structure would =
be the name of the field. The name of the fields are usually pretty generic=
 so you will likely end up to redefine the structure name.
>=20
> Unless we want to provide random name, the only safe naming would be to d=
efine the structure as upper_level_u_meaningful_name{1, 2}. But, this is go=
ing to be pretty awful to read.
>=20
> But I am still a bit puzzled by the fact doxygen is not capable to deal w=
ith anynomous/unamed union. How do other projects deal with them?
>=20
>> Doing this will help a lot the documentation side because the html page =
will show the "struct upper_level" with inside the =E2=80=9Cunion upper_lev=
el_u" and inside again
>> the two struct =E2=80=9Cmeaningful_name1" and =E2=80=9Cmeaningful_name2"=
, and from the point of view of the developer it can tell her/him exactly t=
he name of the member to
>> access when writing code (apart from the upper_level_u that can be acces=
sed by u, but we can=E2=80=99t clearly change it).
>=20
> I don't quite understand the last point. Wouldn't the developper see the =
field name? So how is it going to be different from seeing the structure na=
me?

The developer, that is using the documentation generated with sphinx+doxyge=
n, will see the structure name and not the field name because this is the w=
ay
sphinx+doxygen is rendering the code structures. You can see it in the gene=
rated documentation using this serie.

>=20
>> If this sounds difficult to understand when reading, please generate the=
 documentation and have a look on the page in one side and the source code =
in another.
>=20
> Just to be clear, do you mean understanding what you wrote or a developpe=
r trying to understand the code?

I meant understanding what I wrote, because I know it=E2=80=99s difficult t=
o describe the concept without visualising the html page, it would have bee=
n much easier to attach
an image to clarify.

>=20
> Cheers,
>=20
> --=20
> Julien Grall


