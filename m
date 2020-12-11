Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7512D7F91
	for <lists+xen-devel@lfdr.de>; Fri, 11 Dec 2020 20:44:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.50872.89697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knoKP-0000r7-2b; Fri, 11 Dec 2020 19:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 50872.89697; Fri, 11 Dec 2020 19:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knoKO-0000qi-VT; Fri, 11 Dec 2020 19:43:44 +0000
Received: by outflank-mailman (input) for mailman id 50872;
 Fri, 11 Dec 2020 19:43:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mmUI=FP=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1knoKN-0000qd-Ar
 for xen-devel@lists.xenproject.org; Fri, 11 Dec 2020 19:43:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5746130-506f-4585-8fab-d54cfb7f97a7;
 Fri, 11 Dec 2020 19:43:37 +0000 (UTC)
Received: from AM6P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8b::19)
 by AM6PR08MB5079.eurprd08.prod.outlook.com (2603:10a6:20b:e8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Fri, 11 Dec
 2020 19:43:33 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8b:cafe::de) by AM6P191CA0006.outlook.office365.com
 (2603:10a6:209:8b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Fri, 11 Dec 2020 19:43:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 19:43:33 +0000
Received: ("Tessian outbound 6ec21dac9dd3:v71");
 Fri, 11 Dec 2020 19:43:32 +0000
Received: from 5c7e87a4b28a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E17E27BD-393B-4F87-A7D0-108D12476D9F.1; 
 Fri, 11 Dec 2020 19:43:17 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5c7e87a4b28a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Dec 2020 19:43:17 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB5994.eurprd08.prod.outlook.com (2603:10a6:10:20d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Fri, 11 Dec
 2020 19:43:14 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::11cb:318b:f0a0:f125%5]) with mapi id 15.20.3654.013; Fri, 11 Dec 2020
 19:43:14 +0000
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
X-Inumbo-ID: b5746130-506f-4585-8fab-d54cfb7f97a7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5DUDUIj6rIQkSTuXwnTyIepVfRMisCCtITR3ImmBX4=;
 b=dMFeZDnO691JItFCRRmj/NgejsQlZKCmv2malbh29eLMia86syml3yv1lAsBHAP4pGSIUypbXylPxJUIbHDiRHIt0KVBwwzKzNz7LdnLvp9DWCz2RYXaH5QtV0Rakd4EK8RdUEWHhWT5akqK+23jPDwSR3PUsKfCtuMwlVKYfnA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 43d5ac9299818bec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vw4B5HsbML8Sd6w0fwbSnTfFUwkmETSurW5wZox/kvUlLDmc5323QxwbF9QQsLQeR7+2rQ11k/qSB4fjL3qlOS0rvwbdoMZbE65/AQSQuS1aJ58Sy66bZPEJeVweGnbqHSGER4+X4x58NTEZ5ta3OeyfKQ4uACjEbwazJV+1qhaEp1OAmIB+3RWynK2fB0xRK2YwRzJTW5aazRNBSZDOoQwn22MOqxKIzt8E6jXJvTlZQJEPfZzboJHivu2AtHfLCUMnCSeQKR2PSdewhXUIAoHil0IzglnvaUmvE92/zygYq3GBiZv/HRH7YLRIDKSrWUgIWrzS3+WI/KIbVCbBvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5DUDUIj6rIQkSTuXwnTyIepVfRMisCCtITR3ImmBX4=;
 b=n5e3kBR+CNt9rWFClkyUcXPp1CKvCs9fQa3XHBDRNRfhCwtZr0nsj032yVig1G3xPrb8++O4xsTCp2kbUqXUW3KxZ/QnWIXwLjjafyrwglhk6Q+BZhS0tzesSr/wrOHC4FMVZT9tb8Gl1tMkXjHBZtAShDCrvINPoohQX9P74FNyIBHDccyH3yXmJvS3LBYftVB8gmFVryTSlr0jJawGLa5Qedn0U9nChjkGdcXonG6Airbu8TcS3x4/RuTRVuATWgEhQPeCFHBWBJoGWXxMGD0dwhxXy8bmCkWKkfQNoUmCdrSy4U4Ek4022s2NNYJ/JOA3ITomTlBmixI/W9KrYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5DUDUIj6rIQkSTuXwnTyIepVfRMisCCtITR3ImmBX4=;
 b=dMFeZDnO691JItFCRRmj/NgejsQlZKCmv2malbh29eLMia86syml3yv1lAsBHAP4pGSIUypbXylPxJUIbHDiRHIt0KVBwwzKzNz7LdnLvp9DWCz2RYXaH5QtV0Rakd4EK8RdUEWHhWT5akqK+23jPDwSR3PUsKfCtuMwlVKYfnA=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Topic: [PATCH v3 7/8] xen/arm: Add support for SMMUv3 driver
Thread-Index: AQHWzxYvTK5u+0PVw0yI12PrfGSPTKnxG9IAgAExuoA=
Date: Fri, 11 Dec 2020 19:43:14 +0000
Message-ID: <4D66FAE7-CD0F-4005-9887-3194EA202C41@arm.com>
References: <cover.1607617848.git.rahul.singh@arm.com>
 <33645b592bc5935a3b28ad576a819d06ed81e8dd.1607617848.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012101602530.6285@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012101602530.6285@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 55f9c3c6-3cfa-4d13-fa8f-08d89e0d0b30
x-ms-traffictypediagnostic: DBBPR08MB5994:|AM6PR08MB5079:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB50790920F21F95C5CFCF268CFCCA0@AM6PR08MB5079.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 w67w9ZBbmA/a7H05Ogs9+I7Rd7Ji3odcs+0/dONDSoal4Yzh+bFA6RnFKzSjcp3ElKrIMWtv014jhMp3mrgQn35hr+OEE4cLlugRb46Zg/u1Icdp4SiBZSvb+NJQ5r1aONPUFD1pchVJT7deptOjsP3I78J+2QhlzkTyvw4KUYHf7OKAVA4HAp6VLxslugj4lmrii8VGK31TSz9pNGneZ7HwBltBd8f1sWYrT7YhY8IikZooDR5sHJrWdM8low4yG77cfW8JCuiUyZBaR4wkSg4Axdl9o7JTJdc9b3TK++G22rWpigetcPi/RlGZ/OoZch7ePSHhyt9P8pLSp9CaOeTVuFGyNSkWdbNQzRgb+Y6scil9K8X/L8p5/y/dyZw47dbZ0GnL2Ahmyj4DqEBBj4Mb6rdSM8GKDEWVhlVC5pDD2wHevmvVlmJgpI1lPYKwCwJcyzwAp3Ni0odreDK1QxQFlYJ1dirHCr5fg6+i3M0G6+E8uifX+2KYcy2fpkKa
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(26005)(5660300002)(53546011)(186003)(6512007)(91956017)(54906003)(33656002)(6506007)(66476007)(64756008)(2906002)(83380400001)(8676002)(66446008)(86362001)(8936002)(7416002)(316002)(71200400001)(4326008)(66946007)(2616005)(478600001)(6916009)(76116006)(66556008)(6486002)(36756003)(30864003)(2004002)(45980500001)(579004)(559001)(309714004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?VwrZEJ5wNvZLgU+alTITIV3Fnl1H6EFrZ4pVZa5cz97bKRIV/UIgP9D9WSMV?=
 =?us-ascii?Q?OaQwznKrjWF8N+p6IJDQUbf9ZsMMeEFFIoWSxiBpMGwbZyVGX/cGf6syhII/?=
 =?us-ascii?Q?s+dCTMO1YGnsAMjrrIJQEzJaKZDQl/Gk+7QtQ8y/IIz8zwwblI8n7cCAhWoy?=
 =?us-ascii?Q?djhAK2lgW2pcPXyx+ipfz9aQj0gRQW1yTgkz4Pe8B3vqxuGzjFl61GmZRb/U?=
 =?us-ascii?Q?yO3COet9gcPmltnBNFpNR5Z1muG1B8AIEp5ROYBSSWff40AvSxOL29FNNHnk?=
 =?us-ascii?Q?lD6iP90EskvK/nbFUR7kdp9lk2Bl056FkkWba/tXhonuiPDHIvr3JRXYk/2c?=
 =?us-ascii?Q?Ky2lHyFEbvxx7+th7JSg5iJYFkUfXGCmYq6NiXgEXr3lGnqv8IUbCESmaU5A?=
 =?us-ascii?Q?eWx3CtOAbrDKsuT9bf/jVb2+P9Z4JTua2Ds1B/eqneHbpnnumQZciI0//DFP?=
 =?us-ascii?Q?TUo87OfU845O/aafi1BSAHhBI+Tw9vhbgnThVlo3QNoomRi3gmcEX+Q/PMUH?=
 =?us-ascii?Q?5DczkRodUZfag8Ai4wVoLYCY3EgaAVl+Hy9ON/LO4spot+QX2HKb1vindC2Q?=
 =?us-ascii?Q?7KrQmregWBjl9DiWQaC3kdVgVy/9ZqWcO+kitIxYSSRHSSb+I9lVtQO0/7FH?=
 =?us-ascii?Q?I81ohOfx4lZuStBJPVFNnZuvmAsFtH9wOM3YhITR7Z9Hu3XrMvf5WXzsR1+f?=
 =?us-ascii?Q?5R9TsCdGdbqEBCAN1oubmvcz8jfPF49JROGsVxvZURk4KKsKKaVAbnQIT9EE?=
 =?us-ascii?Q?n69HigutwAZ9CjlGCyzP3XQKzoRhQ9DywOZ4BTgIsLNdiFEf2OW6TalkAFEw?=
 =?us-ascii?Q?E4UfbkbHi+c5tdU9GEkPOLTC3nKM9PMXK4n6kG9vBHAlD8i7av+YdeV+v7gr?=
 =?us-ascii?Q?sW2ZdtRn63XkHQaCTVGZcCS1wP87IlYiQ3gZxaRouiAWpSRQb3vYs+ZFNt03?=
 =?us-ascii?Q?1IwxVyHTsU9QifcOin3H+iWFOjtsSgS+L06sBy+4ndTdIbPNiVWZY4BF68eG?=
 =?us-ascii?Q?MdjI?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <571F8B445A12D54782CD129BDEC18FA0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5994
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f0ee122c-c90a-4028-2100-08d89e0d0014
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N60a7Ox8i5J3FDU2flxUc8pWqb0lPhT8k+pAce3CBLYyZOQ4SK5yMZNTuq/rTgfwrvVpMeXXMUWnSSGzcTUjbZ0WK2xbYn5wYXBlQqNwQsoijpq0Rt00OM9Vu/UNhSah+IJOVAqaODutyv2mdVQF8hxSymhjeRaP3rdtUMxxEDZTgqfETQisUa1TMOfUVobjhOG7EE3RZB78cXxyWe05yxVBBZcYEYdAFPC9bK1hzUz/AVt0IXmvLvBslFMquqU5al9wsVREyAUDHRKAf2L06+IjJIeRNCn3v1dQlSFCTIqaBxb/vulIJOtfVtWfD2zoi1W6+J6vSPLApUSeeVMj2rFtIVDrV+Qh0ZU+fHsPrc0SPxEelgwMlPu0XosqPEp0Mkx085FVMujnQ7kWFIIgBa//sQdsSpn3wrIAobc9gcYKRJWm9bqYWlX9+rPBTN5mqbLXz6k8W9gqyEyAoQRtTI7wD02meyFmuSSS0MXI5OGTEgJmHKH5+/OvqJC14/HbpUOFTbnJPsDTZtKFmCiQgg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(396003)(376002)(136003)(46966005)(54906003)(36756003)(86362001)(82740400003)(30864003)(316002)(6506007)(70206006)(53546011)(6862004)(478600001)(82310400003)(6486002)(26005)(4326008)(356005)(2616005)(5660300002)(47076004)(2906002)(6512007)(107886003)(186003)(8676002)(336012)(33656002)(83380400001)(81166007)(8936002)(70586007)(2004002)(579004)(309714004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 19:43:33.1668
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f9c3c6-3cfa-4d13-fa8f-08d89e0d0b30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5079

Hello Stefano,

Thanks for reviewing the code.

> On 11 Dec 2020, at 1:28 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> On Thu, 10 Dec 2020, Rahul Singh wrote:
>> Add support for ARM architected SMMUv3 implementation. It is based on
>> the Linux SMMUv3 driver.
>>=20
>> Driver is currently supported as Tech Preview.
>>=20
>> Major differences with regard to Linux driver are as follows:
>> 2. Only Stage-2 translation is supported as compared to the Linux driver
>>   that supports both Stage-1 and Stage-2 translations.
>> 3. Use P2M  page table instead of creating one as SMMUv3 has the
>>   capability to share the page tables with the CPU.
>> 4. Tasklets are used in place of threaded IRQ's in Linux for event queue
>>   and priority queue IRQ handling.
>> 5. Latest version of the Linux SMMUv3 code implements the commands queue
>>   access functions based on atomic operations implemented in Linux.
>>   Atomic functions used by the commands queue access functions are not
>>   implemented in XEN therefore we decided to port the earlier version
>>   of the code. Atomic operations are introduced to fix the bottleneck
>>   of the SMMU command queue insertion operation. A new algorithm for
>>   inserting commands into the queue is introduced, which is lock-free
>>   on the fast-path.
>>   Consequence of reverting the patch is that the command queue
>>   insertion will be slow for large systems as spinlock will be used to
>>   serializes accesses from all CPUs to the single queue supported by
>>   the hardware. Once the proper atomic operations will be available in
>>   XEN the driver can be updated.
>> 6. Spin lock is used in place of mutex when attaching a device to the
>>   SMMU, as there is no blocking locks implementation available in XEN.
>>   This might introduce latency in XEN. Need to investigate before
>>   driver is out for tech preview.
>> 7. PCI ATS functionality is not supported, as there is no support
>>   available in XEN to test the functionality. Code is not tested and
>>   compiled. Code is guarded by the flag CONFIG_PCI_ATS.
>> 8. MSI interrupts are not supported as there is no support available in
>>   XEN to request MSI interrupts. Code is not tested and compiled. Code
>>   is guarded by the flag CONFIG_MSI.
>=20
> This is much better Rahul, great work!

Thanks.

>=20
>=20
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v3:
>> - added return statement for readx_poll_timeout function.
>> - remove iommu_get_dma_cookie and iommu_put_dma_cookie.
>> - remove struct arm_smmu_xen_device as not required.
>> - move dt_property_match_string to device_tree.c file.
>> - replace arm_smmu_*_thread to arm_smmu_*_tasklet to avoid confusion.
>> - use ARM_SMMU_REG_SZ as size when map memory to XEN.
>> - remove bypass keyword to make sure when device-tree probe is failed we
>>  are reporting error and not continuing to configure SMMU in bypass
>>  mode.
>> - fixed minor comments.
>>=20
>> ---
>> MAINTAINERS                           |   6 +
>> SUPPORT.md                            |   1 +
>> xen/drivers/passthrough/Kconfig       |  11 +
>> xen/drivers/passthrough/arm/Makefile  |   1 +
>> xen/drivers/passthrough/arm/smmu-v3.c | 777 ++++++++++++++++++++++----
>> 5 files changed, 683 insertions(+), 113 deletions(-)
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index dab38a6a14..1d63489eec 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -249,6 +249,12 @@ F:	xen/include/asm-arm/
>> F:	xen/include/public/arch-arm/
>> F:	xen/include/public/arch-arm.h
>>=20
>> +ARM SMMUv3
>> +M:	Bertrand Marquis <bertrand.marquis@arm.com>
>> +M:	Rahul Singh <rahul.singh@arm.com>
>> +S:	Supported
>> +F:	xen/drivers/passthrough/arm/smmu-v3.c
>> +
>> Change Log
>> M:	Paul Durrant <paul@xen.org>
>> R:	Community Manager <community.manager@xenproject.org>
>> diff --git a/SUPPORT.md b/SUPPORT.md
>> index ab02aca5f4..5ee3c8651a 100644
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -67,6 +67,7 @@ For the Cortex A57 r0p0 - r1p1, see Errata 832075.
>>     Status, Intel VT-d: Supported
>>     Status, ARM SMMUv1: Supported, not security supported
>>     Status, ARM SMMUv2: Supported, not security supported
>> +    Status, ARM SMMUv3: Tech Preview
>>     Status, Renesas IPMMU-VMSA: Supported, not security supported
>>=20
>> ### ARM/GICv3 ITS
>> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/K=
config
>> index 0036007ec4..341ba92b30 100644
>> --- a/xen/drivers/passthrough/Kconfig
>> +++ b/xen/drivers/passthrough/Kconfig
>> @@ -13,6 +13,17 @@ config ARM_SMMU
>> 	  Say Y here if your SoC includes an IOMMU device implementing the
>> 	  ARM SMMU architecture.
>>=20
>> +config ARM_SMMU_V3
>> +	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
>> +	depends on ARM_64
>> +	---help---
>> +	 Support for implementations of the ARM System MMU architecture
>> +	 version 3. Driver is in experimental stage and should not be used in
>> +	 production.
>> +
>> +	 Say Y here if your system includes an IOMMU device implementing
>> +	 the ARM SMMUv3 architecture.
>> +
>> config IPMMU_VMSA
>> 	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>> 	depends on ARM_64
>> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthro=
ugh/arm/Makefile
>> index fcd918ea3e..c5fb3b58a5 100644
>> --- a/xen/drivers/passthrough/arm/Makefile
>> +++ b/xen/drivers/passthrough/arm/Makefile
>> @@ -1,3 +1,4 @@
>> obj-y +=3D iommu.o iommu_helpers.o iommu_fwspec.o
>> obj-$(CONFIG_ARM_SMMU) +=3D smmu.o
>> obj-$(CONFIG_IPMMU_VMSA) +=3D ipmmu-vmsa.o
>> +obj-$(CONFIG_ARM_SMMU_V3) +=3D smmu-v3.o
>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthr=
ough/arm/smmu-v3.c
>> index 2966015e5d..65b3db94ad 100644
>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>> @@ -2,37 +2,268 @@
>> /*
>>  * IOMMU API for ARM architected SMMUv3 implementations.
>>  *
>> + * Based on Linux's SMMUv3 driver:
>> + *    drivers/iommu/arm-smmu-v3.c
>> + *    commit: ab435ce49bd1d02e33dfec24f76955dc1196970b
>> + * and Xen's SMMU driver:
>> + *    xen/drivers/passthrough/arm/smmu.c
>> + *
>> + * Major differences with regard to Linux driver are as follows:
>> + *  1. Driver is currently supported as Tech Preview.
>> + *  2. Only Stage-2 translation is supported as compared to the Linux d=
river
>> + *     that supports both Stage-1 and Stage-2 translations.
>> + *  3. Use P2M  page table instead of creating one as SMMUv3 has the
>> + *     capability to share the page tables with the CPU.
>> + *  4. Tasklets are used in place of threaded IRQ's in Linux for event =
queue
>> + *     and priority queue IRQ handling.
>> + *  5. Latest version of the Linux SMMUv3 code implements the commands =
queue
>> + *     access functions based on atomic operations implemented in Linux=
.
>> + *     Atomic functions used by the commands queue access functions are=
 not
>> + *     implemented in XEN therefore we decided to port the earlier vers=
ion
>> + *     of the code. Atomic operations are introduced to fix the bottlen=
eck of
>> + *     the SMMU command queue insertion operation. A new algorithm for
>> + *     inserting commands into the queue is introduced, which is
>> + *     lock-free on the fast-path.
>> + *     Consequence of reverting the patch is that the command queue ins=
ertion
>> + *     will be slow for large systems as spinlock will be used to seria=
lizes
>> + *     accesses from all CPUs to the single queue supported by the hard=
ware.
>> + *     Once the proper atomic operations will be available in XEN the d=
river
>> + *     can be updated.
>> + *  6. Spin lock is used in place of Mutex when attaching a device to t=
he SMMU,
>> + *     as there is no blocking locks implementation available in XEN.Th=
is might
>> + *     introduce latency in XEN. Need to investigate before driver is o=
ut for
>> + *     Tech Preview.
>> + *  7. PCI ATS functionality is not supported, as there is no support a=
vailable
>> + *     in XEN to test the functionality. Code is not tested and compile=
d. Code
>> + *     is guarded by the flag CONFIG_PCI_ATS.
>> + *  8. MSI interrupts are not supported as there is no support availabl=
e
>> + *     in XEN to request MSI interrupts. Code is not tested and compile=
d. Code
>> + *     is guarded by the flag CONFIG_MSI.
>> + *
>> + * Following functionality should be supported before driver is out for=
 tech
>> + * preview
>> + *
>> + *  1. Investigate the timing analysis of using spin lock in place of m=
utex
>> + *     when attaching a  device to SMMU.
>> + *  2. Merged the latest Linux SMMUv3 driver code once atomic operation=
 is
>> + *     available in XEN.
>> + *  3. PCI ATS and MSI interrupts should be supported.
>> + *  4. Investigate side-effect of using tasklet in place of threaded IR=
Q and
>> + *     fix if any.
>> + *  5. fallthorugh keyword should be supported.
>> + *  6. Implement the ffsll function in bitops.h file.
>> + *
>>  * Copyright (C) 2015 ARM Limited
>>  *
>>  * Author: Will Deacon <will.deacon@arm.com>
>>  *
>> - * This driver is powered by bad coffee and bombay mix.
>> + * Copyright (C) 2020 Arm Ltd
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>=
.
>> + *
>>  */
>>=20
>> -#include <linux/acpi.h>
>> -#include <linux/acpi_iort.h>
>> -#include <linux/bitfield.h>
>> -#include <linux/bitops.h>
>> -#include <linux/crash_dump.h>
>> -#include <linux/delay.h>
>> -#include <linux/dma-iommu.h>
>> -#include <linux/err.h>
>> -#include <linux/interrupt.h>
>> -#include <linux/io-pgtable.h>
>> -#include <linux/iommu.h>
>> -#include <linux/iopoll.h>
>> -#include <linux/module.h>
>> -#include <linux/msi.h>
>> -#include <linux/of.h>
>> -#include <linux/of_address.h>
>> -#include <linux/of_iommu.h>
>> -#include <linux/of_platform.h>
>> -#include <linux/pci.h>
>> -#include <linux/pci-ats.h>
>> -#include <linux/platform_device.h>
>> -
>> -#include <linux/amba/bus.h>
>> +#include <xen/acpi.h>
>> +#include <xen/config.h>
>> +#include <xen/delay.h>
>> +#include <xen/errno.h>
>> +#include <xen/err.h>
>> +#include <xen/irq.h>
>> +#include <xen/lib.h>
>> +#include <xen/list.h>
>> +#include <xen/mm.h>
>> +#include <xen/rbtree.h>
>> +#include <xen/sched.h>
>> +#include <xen/sizes.h>
>> +#include <xen/vmap.h>
>> +#include <asm/atomic.h>
>> +#include <asm/device.h>
>> +#include <asm/io.h>
>> +#include <asm/iommu_fwspec.h>
>> +#include <asm/platform.h>
>> +
>> +/* Linux compatibility functions. */
>> +typedef paddr_t		dma_addr_t;
>> +typedef paddr_t		phys_addr_t;
>> +typedef unsigned int		gfp_t;
>> +
>> +#define platform_device		device
>> +
>> +#define GFP_KERNEL		0
>> +
>> +/* Alias to Xen device tree helpers */
>> +#define device_node			dt_device_node
>> +#define of_phandle_args		dt_phandle_args
>> +#define of_device_id		dt_device_match
>> +#define of_match_node		dt_match_node
>> +#define of_property_read_u32(np, pname, out)	\
>> +		(!dt_property_read_u32(np, pname, out))
>> +#define of_property_read_bool		dt_property_read_bool
>> +#define of_parse_phandle_with_args	dt_parse_phandle_with_args
>> +
>> +/* Alias to Xen time functions */
>> +#define ktime_t s_time_t
>> +#define ktime_get()			(NOW())
>> +#define ktime_add_us(t, i)		(t + MICROSECS(i))
>> +#define ktime_compare(t, i)		(t > (i))
>> +
>> +/* Alias to Xen allocation helpers */
>> +#define kzalloc(size, flags)	_xzalloc(size, sizeof(void *))
>> +#define kfree	xfree
>> +#define devm_kzalloc(dev, size, flags)	 _xzalloc(size, sizeof(void *))
>> +
>> +/* Device logger functions */
>> +#define dev_name(dev)	dt_node_full_name(dev->of_node)
>> +#define dev_dbg(dev, fmt, ...)			\
>> +	printk(XENLOG_DEBUG "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_notice(dev, fmt, ...)		\
>> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_warn(dev, fmt, ...)			\
>> +	printk(XENLOG_WARNING "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS_=
_)
>> +#define dev_err(dev, fmt, ...)			\
>> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_info(dev, fmt, ...)			\
>> +	printk(XENLOG_INFO "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +#define dev_err_ratelimited(dev, fmt, ...)			\
>> +	printk(XENLOG_ERR "SMMUv3: %s: " fmt, dev_name(dev), ## __VA_ARGS__)
>> +
>> +/*
>> + * Periodically poll an address and wait between reads in us until a
>> + * condition is met or a timeout occurs.
>> + *
>> + * @return: 0 when cond met, -ETIMEDOUT upon timeout
>> + */
>> +#define readx_poll_timeout(op, addr, val, cond, sleep_us, timeout_us)	\
>> +({		\
>> +	s_time_t deadline =3D NOW() + MICROSECS(timeout_us);		\
>> +	for (;;) {		\
>> +		(val) =3D op(addr);		\
>> +		if (cond)		\
>> +			break;		\
>> +		if (NOW() > deadline) {		\
>> +			(val) =3D op(addr);		\
>> +			break;		\
>> +		}		\
>> +		udelay(sleep_us);		\
>> +	}		\
>> +	(cond) ? 0 : -ETIMEDOUT;		\
>> +})
>=20
> NIT: alignment of the '\'

Ack.=20
>=20
>=20
>> +#define readl_relaxed_poll_timeout(addr, val, cond, delay_us, timeout_u=
s)	\
>> +	readx_poll_timeout(readl_relaxed, addr, val, cond, delay_us, timeout_u=
s)
>> +
>> +#define FIELD_PREP(_mask, _val)			\
>> +	(((typeof(_mask))(_val) << (__builtin_ffsll(_mask) - 1)) & (_mask))
>> +
>> +#define FIELD_GET(_mask, _reg)			\
>> +	(typeof(_mask))(((_reg) & (_mask)) >> (__builtin_ffsll(_mask) - 1))
>=20
> let's add ffsll to bitops.h

Ok. I will implement the ffsll and add to include/asm-arm/bitops.h=09
=20
>=20
>=20
>> +/*
>> + * Helpers for DMA allocation. Just the function name is reused for
>> + * porting code, these allocation are not managed allocations
>> + */
>> +static void *dmam_alloc_coherent(struct device *dev, size_t size,
>> +				paddr_t *dma_handle, gfp_t gfp)
>> +{
>> +	void *vaddr;
>> +	unsigned long alignment =3D size;
>> +
>> +	/*
>> +	 * _xzalloc requires that the (align & (align -1)) =3D 0. Most of the
>> +	 * allocations in SMMU code should send the right value for size. In
>> +	 * case this is not true print a warning and align to the size of a
>> +	 * (void *)
>> +	 */
>> +	if (size & (size - 1)) {
>> +		printk(XENLOG_WARNING "SMMUv3: Fixing alignment for the DMA buffer\n"=
);
>> +		alignment =3D sizeof(void *);
>> +	}
>> +
>> +	vaddr =3D _xzalloc(size, alignment);
>> +	if (!vaddr) {
>> +		printk(XENLOG_ERR "SMMUv3: DMA allocation failed\n");
>> +		return NULL;
>> +	}
>> +
>> +	*dma_handle =3D virt_to_maddr(vaddr);
>> +
>> +	return vaddr;
>> +}
>> +
>> +
>> +/* Xen specific code. */
>> +struct iommu_domain {
>> +	/* Runtime SMMU configuration for this iommu_domain */
>> +	atomic_t		ref;
>> +	/*
>> +	 * Used to link iommu_domain contexts for a same domain.
>> +	 * There is at least one per-SMMU to used by the domain.
>> +	 */
>> +	struct list_head		list;
>> +};
>>=20
>> +/* Describes information required for a Xen domain */
>> +struct arm_smmu_xen_domain {
>> +	spinlock_t		lock;
>> +
>> +	/* List of iommu domains associated to this domain */
>> +	struct list_head	contexts;
>> +};
>> +
>> +
>> +/* Keep a list of devices associated with this driver */
>> +static DEFINE_SPINLOCK(arm_smmu_devices_lock);
>> +static LIST_HEAD(arm_smmu_devices);
>> +
>> +static inline void *dev_iommu_priv_get(struct device *dev)
>> +{
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +
>> +	return fwspec && fwspec->iommu_priv ? fwspec->iommu_priv : NULL;
>> +}
>> +
>> +static inline void dev_iommu_priv_set(struct device *dev, void *priv)
>> +{
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +
>> +	fwspec->iommu_priv =3D priv;
>> +}
>> +
>> +static int platform_get_irq_byname_optional(struct device *dev,
>> +				const char *name)
>> +{
>> +	int index, ret;
>> +	struct dt_device_node *np  =3D dev_to_dt(dev);
>> +
>> +	if (unlikely(!name))
>> +		return -EINVAL;
>> +
>> +	index =3D dt_property_match_string(np, "interrupt-names", name);
>> +	if (index < 0) {
>> +		dev_info(dev, "IRQ %s not found\n", name);
>> +		return index;
>> +	}
>> +
>> +	ret =3D platform_get_irq(np, index);
>> +	if (ret < 0) {
>> +		dev_err(dev, "failed to get irq index %d\n", index);
>> +		return -ENODEV;
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +/* Start of Linux SMMUv3 code */
>> /* MMIO registers */
>> #define ARM_SMMU_IDR0			0x0
>> #define IDR0_ST_LVL			GENMASK(28, 27)
>> @@ -402,6 +633,7 @@ enum pri_resp {
>> 	PRI_RESP_SUCC =3D 2,
>> };
>>=20
>> +#ifdef CONFIF_MSI
>=20
> CONFIG_MSI

Ack. I will fix all the typo for CONFIG_MSI
>=20
>=20
>> enum arm_smmu_msi_index {
>> 	EVTQ_MSI_INDEX,
>> 	GERROR_MSI_INDEX,
>> @@ -426,6 +658,7 @@ static phys_addr_t arm_smmu_msi_cfg[ARM_SMMU_MAX_MSI=
S][3] =3D {
>> 		ARM_SMMU_PRIQ_IRQ_CFG2,
>> 	},
>> };
>> +#endif
>>=20
>> struct arm_smmu_cmdq_ent {
>> 	/* Common fields */
>> @@ -534,6 +767,7 @@ struct arm_smmu_s2_cfg {
>> 	u16				vmid;
>> 	u64				vttbr;
>> 	u64				vtcr;
>> +	struct domain		*domain;
>> };
>=20
> This looks like a strange struct to add a pointer back to *domain. Maybe
> struct arm_smmu_domain would be a better place for it?

Ok yes you right. I will modify.
>=20
>=20
>> struct arm_smmu_strtab_cfg {
>> @@ -613,8 +847,13 @@ struct arm_smmu_device {
>> 		u64			padding;
>> 	};
>>=20
>> -	/* IOMMU core code handle */
>> -	struct iommu_device		iommu;
>> +	/* Need to keep a list of SMMU devices */
>> +	struct list_head		devices;
>> +
>> +	/* Tasklets for handling evts/faults and pci page request IRQs*/
>> +	struct tasklet		evtq_irq_tasklet;
>> +	struct tasklet		priq_irq_tasklet;
>> +	struct tasklet		combined_irq_tasklet;
>> };
>>=20
>> /* SMMU private data for each master */
>> @@ -638,7 +877,6 @@ enum arm_smmu_domain_stage {
>>=20
>> struct arm_smmu_domain {
>> 	struct arm_smmu_device		*smmu;
>> -	struct mutex			init_mutex; /* Protects smmu pointer */
>>=20
>> 	bool				non_strict;
>> 	atomic_t			nr_ats_masters;
>> @@ -987,6 +1225,7 @@ static void arm_smmu_cmdq_issue_cmd(struct arm_smmu=
_device *smmu,
>> 	spin_unlock_irqrestore(&smmu->cmdq.lock, flags);
>> }
>>=20
>> +#ifdef CONFIF_MSI
>=20
> CONFIG_MSI

Ack.=20
>=20
>=20
>> /*
>>  * The difference between val and sync_idx is bounded by the maximum siz=
e of
>>  * a queue at 2^20 entries, so 32 bits is plenty for wrap-safe arithmeti=
c.
>> @@ -1030,6 +1269,13 @@ static int __arm_smmu_cmdq_issue_sync_msi(struct =
arm_smmu_device *smmu)
>>=20
>> 	return __arm_smmu_sync_poll_msi(smmu, ent.sync.msidata);
>> }
>> +#else
>> +static inline int __arm_smmu_cmdq_issue_sync_msi(struct arm_smmu_device=
 *smmu)
>> +{
>> +	return 0;
>> +}
>> +#endif /* CONFIG_MSI */
>> +
>>=20
>> static int __arm_smmu_cmdq_issue_sync(struct arm_smmu_device *smmu)
>> {
>> @@ -1072,7 +1318,7 @@ arm_smmu_write_strtab_l1_desc(__le64 *dst, struct =
arm_smmu_strtab_l1_desc *desc)
>> 	val |=3D desc->l2ptr_dma & STRTAB_L1_DESC_L2PTR_MASK;
>>=20
>> 	/* See comment in arm_smmu_write_ctx_desc() */
>> -	WRITE_ONCE(*dst, cpu_to_le64(val));
>> +	write_atomic(dst, cpu_to_le64(val));
>> }
>>=20
>> static void arm_smmu_sync_ste_for_sid(struct arm_smmu_device *smmu, u32 =
sid)
>> @@ -1187,7 +1433,7 @@ static void arm_smmu_write_strtab_ent(struct arm_s=
mmu_master *master, u32 sid,
>> 						 STRTAB_STE_1_EATS_TRANS));
>>=20
>> 	arm_smmu_sync_ste_for_sid(smmu, sid);
>> -	WRITE_ONCE(dst[0], cpu_to_le64(val));
>> +	write_atomic(&dst[0], cpu_to_le64(val));
>> 	arm_smmu_sync_ste_for_sid(smmu, sid);
>>=20
>> 	/* It's likely that we'll want to use the new STE soon */
>> @@ -1234,7 +1480,7 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu=
_device *smmu, u32 sid)
>> }
>>=20
>> /* IRQ and event handlers */
>> -static irqreturn_t arm_smmu_evtq_thread(int irq, void *dev)
>> +static void arm_smmu_evtq_tasklet(void *dev)
>> {
>> 	int i;
>> 	struct arm_smmu_device *smmu =3D dev;
>> @@ -1264,7 +1510,6 @@ static irqreturn_t arm_smmu_evtq_thread(int irq, v=
oid *dev)
>> 	/* Sync our overflow flag, as we believe we're up to speed */
>> 	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>> 		    Q_IDX(llq, llq->cons);
>> -	return IRQ_HANDLED;
>> }
>>=20
>> static void arm_smmu_handle_ppr(struct arm_smmu_device *smmu, u64 *evt)
>> @@ -1305,7 +1550,7 @@ static void arm_smmu_handle_ppr(struct arm_smmu_de=
vice *smmu, u64 *evt)
>> 	}
>> }
>>=20
>> -static irqreturn_t arm_smmu_priq_thread(int irq, void *dev)
>> +static void arm_smmu_priq_tasklet(void *dev)
>> {
>> 	struct arm_smmu_device *smmu =3D dev;
>> 	struct arm_smmu_queue *q =3D &smmu->priq.q;
>> @@ -1324,12 +1569,12 @@ static irqreturn_t arm_smmu_priq_thread(int irq,=
 void *dev)
>> 	llq->cons =3D Q_OVF(llq->prod) | Q_WRP(llq, llq->cons) |
>> 		      Q_IDX(llq, llq->cons);
>> 	queue_sync_cons_out(q);
>> -	return IRQ_HANDLED;
>> }
>>=20
>> static int arm_smmu_device_disable(struct arm_smmu_device *smmu);
>>=20
>> -static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>> +static void arm_smmu_gerror_handler(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> {
>> 	u32 gerror, gerrorn, active;
>> 	struct arm_smmu_device *smmu =3D dev;
>> @@ -1339,7 +1584,7 @@ static irqreturn_t arm_smmu_gerror_handler(int irq=
, void *dev)
>>=20
>> 	active =3D gerror ^ gerrorn;
>> 	if (!(active & GERROR_ERR_MASK))
>> -		return IRQ_NONE; /* No errors pending */
>> +		return; /* No errors pending */
>>=20
>> 	dev_warn(smmu->dev,
>> 		 "unexpected global error reported (0x%08x), this could be serious\n",
>> @@ -1372,26 +1617,44 @@ static irqreturn_t arm_smmu_gerror_handler(int i=
rq, void *dev)
>> 		arm_smmu_cmdq_skip_err(smmu);
>>=20
>> 	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
>> -	return IRQ_HANDLED;
>> }
>>=20
>> -static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>> +static void arm_smmu_combined_irq_handler(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> +{
>> +	struct arm_smmu_device *smmu =3D dev;
>> +
>> +	arm_smmu_gerror_handler(irq, dev, regs);
>> +
>> +	tasklet_schedule(&(smmu->combined_irq_tasklet));
>> +}
>> +
>> +static void arm_smmu_combined_irq_tasklet(void *dev)
>> {
>> 	struct arm_smmu_device *smmu =3D dev;
>>=20
>> -	arm_smmu_evtq_thread(irq, dev);
>> +	arm_smmu_evtq_tasklet(dev);
>> 	if (smmu->features & ARM_SMMU_FEAT_PRI)
>> -		arm_smmu_priq_thread(irq, dev);
>> +		arm_smmu_priq_tasklet(dev);
>> +}
>>=20
>> -	return IRQ_HANDLED;
>> +static void arm_smmu_evtq_irq_tasklet(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> +{
>> +	struct arm_smmu_device *smmu =3D dev;
>> +
>> +	tasklet_schedule(&(smmu->evtq_irq_tasklet));
>> }
>>=20
>> -static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>> +static void arm_smmu_priq_irq_tasklet(int irq, void *dev,
>> +				struct cpu_user_regs *regs)
>> {
>> -	arm_smmu_gerror_handler(irq, dev);
>> -	return IRQ_WAKE_THREAD;
>> +	struct arm_smmu_device *smmu =3D dev;
>> +
>> +	tasklet_schedule(&(smmu->priq_irq_tasklet));
>> }
>>=20
>> +#ifdef CONFIG_PCI_ATS
>> static void
>> arm_smmu_atc_inv_to_cmd(int ssid, unsigned long iova, size_t size,
>> 			struct arm_smmu_cmdq_ent *cmd)
>> @@ -1498,6 +1761,7 @@ static int arm_smmu_atc_inv_domain(struct arm_smmu=
_domain *smmu_domain,
>>=20
>> 	return ret ? -ETIMEDOUT : 0;
>> }
>> +#endif
>>=20
>> static void arm_smmu_tlb_inv_context(void *cookie)
>> {
>> @@ -1532,7 +1796,6 @@ static struct iommu_domain *arm_smmu_domain_alloc(=
void)
>> 	if (!smmu_domain)
>> 		return NULL;
>>=20
>> -	mutex_init(&smmu_domain->init_mutex);
>> 	INIT_LIST_HEAD(&smmu_domain->devices);
>> 	spin_lock_init(&smmu_domain->devices_lock);
>>=20
>> @@ -1578,6 +1841,17 @@ static int arm_smmu_domain_finalise_s2(struct arm=
_smmu_domain *smmu_domain,
>> 	struct arm_smmu_device *smmu =3D smmu_domain->smmu;
>> 	struct arm_smmu_s2_cfg *cfg =3D &smmu_domain->s2_cfg;
>> 	typeof(&arm_lpae_s2_cfg.vtcr) vtcr =3D &arm_lpae_s2_cfg.vtcr;
>> +	uint64_t reg =3D READ_SYSREG64(VTCR_EL2);
>> +
>> +	vtcr->tsz	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2T0SZ, reg);
>> +	vtcr->sl	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2SL0, reg);
>> +	vtcr->irgn	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2IR0, reg);
>> +	vtcr->orgn	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2OR0, reg);
>> +	vtcr->sh	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2SH0, reg);
>> +	vtcr->tg	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2TG, reg);
>> +	vtcr->ps	=3D FIELD_GET(STRTAB_STE_2_VTCR_S2PS, reg);
>> +
>> +	arm_lpae_s2_cfg.vttbr  =3D page_to_maddr(cfg->domain->arch.p2m.root);
>>=20
>> 	vmid =3D arm_smmu_bitmap_alloc(smmu->vmid_map, smmu->vmid_bits);
>> 	if (vmid < 0)
>> @@ -1592,6 +1866,11 @@ static int arm_smmu_domain_finalise_s2(struct arm=
_smmu_domain *smmu_domain,
>> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2SH0, vtcr->sh) |
>> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2TG, vtcr->tg) |
>> 			  FIELD_PREP(STRTAB_STE_2_VTCR_S2PS, vtcr->ps);
>> +
>> +	printk(XENLOG_DEBUG
>> +		   "SMMUv3: d%u: vmid 0x%x vtcr 0x%"PRIpaddr" p2maddr 0x%"PRIpaddr"\n=
",
>> +		   cfg->domain->domain_id, cfg->vmid, cfg->vtcr, cfg->vttbr);
>> +
>> 	return 0;
>> }
>>=20
>> @@ -1653,6 +1932,7 @@ static void arm_smmu_install_ste_for_dev(struct ar=
m_smmu_master *master)
>> 	}
>> }
>>=20
>> +#ifdef CONFIG_PCI_ATS
>> static bool arm_smmu_ats_supported(struct arm_smmu_master *master)
>> {
>> 	struct device *dev =3D master->dev;
>> @@ -1751,6 +2031,23 @@ static void arm_smmu_disable_pasid(struct arm_smm=
u_master *master)
>>=20
>> 	pci_disable_pasid(pdev);
>> }
>> +#else
>> +static inline bool arm_smmu_ats_supported(struct arm_smmu_master *maste=
r)
>> +{
>> +	return false;
>> +}
>> +
>> +static inline void arm_smmu_enable_ats(struct arm_smmu_master *master) =
{ }
>> +
>> +static inline void arm_smmu_disable_ats(struct arm_smmu_master *master)=
 { }
>> +
>> +static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>> +{
>> +	return 0;
>> +}
>> +
>> +static inline void arm_smmu_disable_pasid(struct arm_smmu_master *maste=
r) { }
>> +#endif
>>=20
>> static void arm_smmu_detach_dev(struct arm_smmu_master *master)
>> {
>> @@ -1788,8 +2085,6 @@ static int arm_smmu_attach_dev(struct iommu_domain=
 *domain, struct device *dev)
>>=20
>> 	arm_smmu_detach_dev(master);
>>=20
>> -	mutex_lock(&smmu_domain->init_mutex);
>> -
>> 	if (!smmu_domain->smmu) {
>> 		smmu_domain->smmu =3D smmu;
>> 		ret =3D arm_smmu_domain_finalise(domain, master);
>> @@ -1820,7 +2115,6 @@ static int arm_smmu_attach_dev(struct iommu_domain=
 *domain, struct device *dev)
>> 	arm_smmu_enable_ats(master);
>>=20
>> out_unlock:
>> -	mutex_unlock(&smmu_domain->init_mutex);
>> 	return ret;
>> }
>>=20
>> @@ -1833,8 +2127,10 @@ static bool arm_smmu_sid_in_range(struct arm_smmu=
_device *smmu, u32 sid)
>>=20
>> 	return sid < limit;
>> }
>> +/* Forward declaration */
>> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
>>=20
>> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>> +static int arm_smmu_add_device(u8 devfn, struct device *dev)
>> {
>> 	int i, ret;
>> 	struct arm_smmu_device *smmu;
>> @@ -1842,14 +2138,15 @@ static struct iommu_device *arm_smmu_probe_devic=
e(struct device *dev)
>> 	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>>=20
>> 	if (!fwspec)
>> -		return ERR_PTR(-ENODEV);
>> +		return -ENODEV;
>>=20
>> -	if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
>> -		return ERR_PTR(-EBUSY);
>> +	smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev);
>> +	if (!smmu)
>> +		return -ENODEV;
>>=20
>> 	master =3D kzalloc(sizeof(*master), GFP_KERNEL);
>> 	if (!master)
>> -		return ERR_PTR(-ENOMEM);
>> +		return -ENOMEM;
>>=20
>> 	master->dev =3D dev;
>> 	master->smmu =3D smmu;
>> @@ -1884,17 +2181,36 @@ static struct iommu_device *arm_smmu_probe_devic=
e(struct device *dev)
>> 	 */
>> 	arm_smmu_enable_pasid(master);
>>=20
>> -	return &smmu->iommu;
>> +	return 0;
>>=20
>> err_free_master:
>> 	kfree(master);
>> 	dev_iommu_priv_set(dev, NULL);
>> -	return ERR_PTR(ret);
>> +	return ret;
>> }
>>=20
>> -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args=
 *args)
>> +static int arm_smmu_dt_xlate(struct device *dev,
>> +				const struct dt_phandle_args *args)
>> {
>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>> +	int ret;
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +
>> +	ret =3D iommu_fwspec_add_ids(dev, args->args, 1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (dt_device_is_protected(dev_to_dt(dev))) {
>> +		dev_err(dev, "Already added to SMMUv3\n");
>> +		return -EEXIST;
>> +	}
>> +
>> +	/* Let Xen know that the master device is protected by an IOMMU. */
>> +	dt_device_set_protected(dev_to_dt(dev));
>> +
>> +	dev_info(dev, "Added master device (SMMUv3 %s StreamIds %u)\n",
>> +			dev_name(fwspec->iommu_dev), fwspec->num_ids);
>> +
>> +	return 0;
>> }
>>=20
>> /* Probing and initialisation functions */
>> @@ -1923,8 +2239,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu=
_device *smmu,
>> 		return -ENOMEM;
>> 	}
>>=20
>> -	if (!WARN_ON(q->base_dma & (qsz - 1))) {
>> -		dev_info(smmu->dev, "allocated %u entries for %s\n",
>> +	if (unlikely(q->base_dma & (qsz - 1))) {
>> +		dev_warn(smmu->dev, "allocated %u entries for %s\n",
>> 			 1 << q->llq.max_n_shift, name);
>> 	}
>>=20
>> @@ -2121,6 +2437,7 @@ static int arm_smmu_update_gbpa(struct arm_smmu_de=
vice *smmu, u32 set, u32 clr)
>> 	return ret;
>> }
>>=20
>> +#ifdef CONFIF_MSI
>=20
> CONFIG_MSI

Ack.=20
>=20
>=20
>> static void arm_smmu_free_msis(void *data)
>> {
>> 	struct device *dev =3D data;
>> @@ -2191,6 +2508,9 @@ static void arm_smmu_setup_msis(struct arm_smmu_de=
vice *smmu)
>> 	/* Add callback to free MSIs on teardown */
>> 	devm_add_action(dev, arm_smmu_free_msis, dev);
>> }
>> +#else
>> +static inline void arm_smmu_setup_msis(struct arm_smmu_device *smmu) { =
}
>> +#endif /* CONFIG_MSI */
>>=20
>> static void arm_smmu_setup_unique_irqs(struct arm_smmu_device *smmu)
>> {
>> @@ -2201,9 +2521,7 @@ static void arm_smmu_setup_unique_irqs(struct arm_=
smmu_device *smmu)
>> 	/* Request interrupt lines */
>> 	irq =3D smmu->evtq.q.irq;
>> 	if (irq) {
>> -		ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -						arm_smmu_evtq_thread,
>> -						IRQF_ONESHOT,
>> +		ret =3D request_irq(irq, 0, arm_smmu_evtq_irq_tasklet,
>> 						"arm-smmu-v3-evtq", smmu);
>> 		if (ret < 0)
>> 			dev_warn(smmu->dev, "failed to enable evtq irq\n");
>> @@ -2213,8 +2531,8 @@ static void arm_smmu_setup_unique_irqs(struct arm_=
smmu_device *smmu)
>>=20
>> 	irq =3D smmu->gerr_irq;
>> 	if (irq) {
>> -		ret =3D devm_request_irq(smmu->dev, irq, arm_smmu_gerror_handler,
>> -				       0, "arm-smmu-v3-gerror", smmu);
>> +		ret =3D request_irq(irq, 0, arm_smmu_gerror_handler,
>> +						"arm-smmu-v3-gerror", smmu);
>> 		if (ret < 0)
>> 			dev_warn(smmu->dev, "failed to enable gerror irq\n");
>> 	} else {
>> @@ -2224,11 +2542,8 @@ static void arm_smmu_setup_unique_irqs(struct arm=
_smmu_device *smmu)
>> 	if (smmu->features & ARM_SMMU_FEAT_PRI) {
>> 		irq =3D smmu->priq.q.irq;
>> 		if (irq) {
>> -			ret =3D devm_request_threaded_irq(smmu->dev, irq, NULL,
>> -							arm_smmu_priq_thread,
>> -							IRQF_ONESHOT,
>> -							"arm-smmu-v3-priq",
>> -							smmu);
>> +			ret =3D request_irq(irq, 0, arm_smmu_priq_irq_tasklet,
>> +							"arm-smmu-v3-priq", smmu);
>> 			if (ret < 0)
>> 				dev_warn(smmu->dev,
>> 					 "failed to enable priq irq\n");
>> @@ -2257,11 +2572,8 @@ static int arm_smmu_setup_irqs(struct arm_smmu_de=
vice *smmu)
>> 		 * Cavium ThunderX2 implementation doesn't support unique irq
>> 		 * lines. Use a single irq line for all the SMMUv3 interrupts.
>> 		 */
>> -		ret =3D devm_request_threaded_irq(smmu->dev, irq,
>> -					arm_smmu_combined_irq_handler,
>> -					arm_smmu_combined_irq_thread,
>> -					IRQF_ONESHOT,
>> -					"arm-smmu-v3-combined-irq", smmu);
>> +		ret =3D request_irq(irq, 0, arm_smmu_combined_irq_handler,
>> +						"arm-smmu-v3-combined-irq", smmu);
>> 		if (ret < 0)
>> 			dev_warn(smmu->dev, "failed to enable combined irq\n");
>> 	} else
>> @@ -2290,7 +2602,7 @@ static int arm_smmu_device_disable(struct arm_smmu=
_device *smmu)
>> 	return ret;
>> }
>>=20
>> -static int arm_smmu_device_reset(struct arm_smmu_device *smmu, bool byp=
ass)
>> +static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
>> {
>> 	int ret;
>> 	u32 reg, enables;
>> @@ -2300,7 +2612,7 @@ static int arm_smmu_device_reset(struct arm_smmu_d=
evice *smmu, bool bypass)
>> 	reg =3D readl_relaxed(smmu->base + ARM_SMMU_CR0);
>> 	if (reg & CR0_SMMUEN) {
>> 		dev_warn(smmu->dev, "SMMU currently enabled! Resetting...\n");
>> -		WARN_ON(is_kdump_kernel() && !disable_bypass);
>> +		WARN_ON(!disable_bypass);
>> 		arm_smmu_update_gbpa(smmu, GBPA_ABORT, 0);
>> 	}
>>=20
>> @@ -2404,11 +2716,14 @@ static int arm_smmu_device_reset(struct arm_smmu=
_device *smmu, bool bypass)
>> 		return ret;
>> 	}
>>=20
>> -	if (is_kdump_kernel())
>> -		enables &=3D ~(CR0_EVTQEN | CR0_PRIQEN);
>> +	/* Initialize tasklets for threaded IRQs*/
>> +	tasklet_init(&smmu->evtq_irq_tasklet, arm_smmu_evtq_tasklet, smmu);
>> +	tasklet_init(&smmu->priq_irq_tasklet, arm_smmu_priq_tasklet, smmu);
>> +	tasklet_init(&smmu->combined_irq_tasklet, arm_smmu_combined_irq_taskle=
t,
>> +				 smmu);
>>=20
>> 	/* Enable the SMMU interface, or ensure bypass */
>> -	if (!bypass || disable_bypass) {
>> +	if (disable_bypass) {
>> 		enables |=3D CR0_SMMUEN;
>> 	} else {
>> 		ret =3D arm_smmu_update_gbpa(smmu, 0, GBPA_ABORT);
>> @@ -2473,8 +2788,10 @@ static int arm_smmu_device_hw_probe(struct arm_sm=
mu_device *smmu)
>> 	if (reg & IDR0_SEV)
>> 		smmu->features |=3D ARM_SMMU_FEAT_SEV;
>>=20
>> +#ifdef CONFIF_MSI
>=20
> CONFIG_MSI

Ack.

>=20
>=20
>> 	if (reg & IDR0_MSI)
>> 		smmu->features |=3D ARM_SMMU_FEAT_MSI;
>> +#endif
>>=20
>> 	if (reg & IDR0_HYP)
>> 		smmu->features |=3D ARM_SMMU_FEAT_HYP;
>> @@ -2499,7 +2816,7 @@ static int arm_smmu_device_hw_probe(struct arm_smm=
u_device *smmu)
>> 		smmu->features |=3D ARM_SMMU_FEAT_TRANS_S2;
>>=20
>> 	if (!(reg & IDR0_S2P)) {
>> -		dev_err(smmu->dev, "no translation support!\n");
>> +		dev_err(smmu->dev, "no stage-2 translation support!\n");
>> 		return -ENXIO;
>> 	}
>>=20
>> @@ -2648,7 +2965,7 @@ static inline int arm_smmu_device_acpi_probe(struc=
t platform_device *pdev,
>> static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>> 				    struct arm_smmu_device *smmu)
>> {
>> -	struct device *dev =3D &pdev->dev;
>> +	struct device *dev =3D pdev;
>> 	u32 cells;
>> 	int ret =3D -EINVAL;
>>=20
>> @@ -2661,7 +2978,7 @@ static int arm_smmu_device_dt_probe(struct platfor=
m_device *pdev,
>>=20
>> 	parse_driver_options(smmu);
>>=20
>> -	if (of_dma_is_coherent(dev->of_node))
>> +	if (dt_get_property(dev->of_node, "dma-coherent", NULL))
>> 		smmu->features |=3D ARM_SMMU_FEAT_COHERENCY;
>>=20
>> 	return ret;
>> @@ -2675,63 +2992,49 @@ static unsigned long arm_smmu_resource_size(stru=
ct arm_smmu_device *smmu)
>> 		return SZ_128K;
>> }
>>=20
>> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size=
_t start,
>> -				      resource_size_t size)
>> -{
>> -	struct resource res =3D {
>> -		.flags =3D IORESOURCE_MEM,
>> -		.start =3D start,
>> -		.end =3D start + size - 1,
>> -	};
>> -
>> -	return devm_ioremap_resource(dev, &res);
>> -}
>> -
>> static int arm_smmu_device_probe(struct platform_device *pdev)
>> {
>> 	int irq, ret;
>> -	struct resource *res;
>> -	resource_size_t ioaddr;
>> +	paddr_t ioaddr, iosize;
>> 	struct arm_smmu_device *smmu;
>> -	struct device *dev =3D &pdev->dev;
>> -	bool bypass;
>>=20
>> -	smmu =3D devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>> +	smmu =3D devm_kzalloc(pdev, sizeof(*smmu), GFP_KERNEL);
>> 	if (!smmu) {
>> -		dev_err(dev, "failed to allocate arm_smmu_device\n");
>> +		dev_err(pdev, "failed to allocate arm_smmu_device\n");
>> 		return -ENOMEM;
>> 	}
>> -	smmu->dev =3D dev;
>> +	smmu->dev =3D pdev;
>>=20
>> -	if (dev->of_node) {
>> +	if (pdev->of_node) {
>> 		ret =3D arm_smmu_device_dt_probe(pdev, smmu);
>> +		if (ret)
>> +			return -EINVAL;
>> 	} else {
>> 		ret =3D arm_smmu_device_acpi_probe(pdev, smmu);
>> 		if (ret =3D=3D -ENODEV)
>> 			return ret;
>> 	}
>>=20
>> -	/* Set bypass mode according to firmware probing result */
>> -	bypass =3D !!ret;
>> -
>> 	/* Base address */
>> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -	if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>> -		dev_err(dev, "MMIO region too small (%pr)\n", res);
>> +	ret =3D dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
>> +	if (ret)
>> +		return -ENODEV;
>> +
>> +	if (iosize < arm_smmu_resource_size(smmu)) {
>> +		dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>> 		return -EINVAL;
>> 	}
>> -	ioaddr =3D res->start;
>>=20
>> 	/*
>> 	 * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>> 	 * the PMCG registers which are reserved by the PMU driver.
>> 	 */
>=20
> Which PMU driver?

I want to remove this in this patch but somehow I missed. I will modifying =
the comment in next version.

>=20
>=20
>> -	smmu->base =3D arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>> +	smmu->base =3D ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>> 	if (IS_ERR(smmu->base))
>> 		return PTR_ERR(smmu->base);
>>=20
>> -	if (arm_smmu_resource_size(smmu) > SZ_64K) {
>> -		smmu->page1 =3D arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>> +	if (iosize > SZ_64K) {
>> +		smmu->page1 =3D ioremap_nocache(ioaddr + SZ_64K,
>> 					       ARM_SMMU_REG_SZ);
>> 		if (IS_ERR(smmu->page1))
>> 			return PTR_ERR(smmu->page1);
>> @@ -2768,14 +3071,262 @@ static int arm_smmu_device_probe(struct platfor=
m_device *pdev)
>> 		return ret;
>>=20
>> 	/* Reset the device */
>> -	ret =3D arm_smmu_device_reset(smmu, bypass);
>> +	ret =3D arm_smmu_device_reset(smmu);
>> 	if (ret)
>> 		return ret;
>>=20
>> +	/*
>> +	 * Keep a list of all probed devices. This will be used to query
>> +	 * the smmu devices based on the fwnode.
>> +	 */
>> +	INIT_LIST_HEAD(&smmu->devices);
>> +
>> +	spin_lock(&arm_smmu_devices_lock);
>> +	list_add(&smmu->devices, &arm_smmu_devices);
>> +	spin_unlock(&arm_smmu_devices_lock);
>> +
>> 	return 0;
>> }
>>=20
>> -static const struct of_device_id arm_smmu_of_match[] =3D {
>> +static const struct dt_device_match arm_smmu_of_match[] =3D {
>> 	{ .compatible =3D "arm,smmu-v3", },
>> 	{ },
>> };
>> +
>> +/* Start of Xen specific code. */
>> +static int __must_check arm_smmu_iotlb_flush_all(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct iommu_domain *io_domain;
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>> +		/*
>> +		 * Only invalidate the context when SMMU is present.
>> +		 * This is because the context initialization is delayed
>> +		 * until a master has been added.
>> +		 */
>> +		if (unlikely(!ACCESS_ONCE(to_smmu_domain(io_domain)->smmu)))
>> +			continue;
>> +
>> +		arm_smmu_tlb_inv_context(to_smmu_domain(io_domain));
>> +	}
>> +
>> +	spin_unlock(&xen_domain->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int __must_check arm_smmu_iotlb_flush(struct domain *d, dfn_t df=
n,
>> +				unsigned long page_count, unsigned int flush_flags)
>> +{
>> +	return arm_smmu_iotlb_flush_all(d);
>> +}
>> +
>> +static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
>> +{
>> +	struct arm_smmu_device *smmu =3D NULL;
>> +
>> +	spin_lock(&arm_smmu_devices_lock);
>> +
>> +	list_for_each_entry(smmu, &arm_smmu_devices, devices) {
>> +		if (smmu->dev  =3D=3D dev) {
>> +			spin_unlock(&arm_smmu_devices_lock);
>> +			return smmu;
>> +		}
>> +	}
>> +
>> +	spin_unlock(&arm_smmu_devices_lock);
>> +
>> +	return NULL;
>> +}
>> +
>> +static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
>> +				struct device *dev)
>> +{
>> +	struct iommu_domain *io_domain;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct arm_smmu_device *smmu =3D arm_smmu_get_by_dev(fwspec->iommu_dev=
);
>> +
>> +	if (!smmu)
>> +		return NULL;
>> +
>> +	/*
>> +	 * Loop through the &xen_domain->contexts to locate a context
>> +	 * assigned to this SMMU
>> +	 */
>> +	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
>> +		smmu_domain =3D to_smmu_domain(io_domain);
>> +		if (smmu_domain->smmu =3D=3D smmu)
>> +			return io_domain;
>> +	}
>> +	return NULL;
>> +}
>> +
>> +static void arm_smmu_destroy_iommu_domain(struct iommu_domain *io_domai=
n)
>> +{
>> +	list_del(&io_domain->list);
>> +	arm_smmu_domain_free(io_domain);
>> +}
>> +
>> +static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>> +		struct device *dev, u32 flag)
>> +{
>> +	int ret =3D 0;
>> +	struct iommu_domain *io_domain;
>> +	struct arm_smmu_domain *smmu_domain;
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	/*
>> +	 * Check to see if an iommu_domain already exists for this xen domain
>> +	 * under the same SMMU
>> +	 */
>> +	io_domain =3D arm_smmu_get_domain(d, dev);
>> +	if (!io_domain) {
>> +		io_domain =3D arm_smmu_domain_alloc();
>> +		if (!io_domain) {
>> +			ret =3D -ENOMEM;
>> +			goto out;
>> +		}
>> +		smmu_domain =3D to_smmu_domain(io_domain);
>> +		smmu_domain->s2_cfg.domain =3D d;
>> +
>> +		/* Chain the new context to the domain */
>> +		list_add(&io_domain->list, &xen_domain->contexts);
>> +	}
>> +
>> +	ret =3D arm_smmu_attach_dev(io_domain, dev);
>> +	if (ret) {
>> +		if (io_domain->ref.counter =3D=3D 0)
>> +			arm_smmu_destroy_iommu_domain(io_domain);
>> +	} else {
>> +		atomic_inc(&io_domain->ref);
>> +	}
>> +
>> +out:
>> +	spin_unlock(&xen_domain->lock);
>> +	return ret;
>> +}
>> +
>> +static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>> +{
>> +	struct iommu_domain *io_domain =3D arm_smmu_get_domain(d, dev);
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +	struct arm_smmu_domain *arm_smmu =3D to_smmu_domain(io_domain);
>> +	struct arm_smmu_master *master =3D dev_iommu_priv_get(dev);
>> +
>> +	if (!arm_smmu || arm_smmu->s2_cfg.domain !=3D d) {
>> +		dev_err(dev, " not attached to domain %d\n", d->domain_id);
>> +		return -ESRCH;
>> +	}
>> +
>> +	spin_lock(&xen_domain->lock);
>> +
>> +	arm_smmu_detach_dev(master);
>> +	atomic_dec(&io_domain->ref);
>> +
>> +	if (io_domain->ref.counter =3D=3D 0)
>> +		arm_smmu_destroy_iommu_domain(io_domain);
>> +
>> +	spin_unlock(&xen_domain->lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static int arm_smmu_reassign_dev(struct domain *s, struct domain *t,
>> +				u8 devfn,  struct device *dev)
>> +{
>> +	int ret =3D 0;
>> +
>> +	/* Don't allow remapping on other domain than hwdom */
>> +	if (t && t !=3D hardware_domain)
>> +		return -EPERM;
>> +
>> +	if (t =3D=3D s)
>> +		return 0;
>> +
>> +	ret =3D arm_smmu_deassign_dev(s, dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (t) {
>> +		/* No flags are defined for ARM. */
>> +		ret =3D arm_smmu_assign_dev(t, devfn, dev, 0);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain;
>> +
>> +	xen_domain =3D xzalloc(struct arm_smmu_xen_domain);
>> +	if (!xen_domain)
>> +		return -ENOMEM;
>> +
>> +	spin_lock_init(&xen_domain->lock);
>> +	INIT_LIST_HEAD(&xen_domain->contexts);
>> +
>> +	dom_iommu(d)->arch.priv =3D xen_domain;
>> +	return 0;
>> +
>> +}
>> +
>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>> +{
>> +}
>> +
>> +static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
>> +{
>> +	struct arm_smmu_xen_domain *xen_domain =3D dom_iommu(d)->arch.priv;
>> +
>> +	ASSERT(list_empty(&xen_domain->contexts));
>> +	xfree(xen_domain);
>> +}
>> +
>> +static const struct iommu_ops arm_smmu_iommu_ops =3D {
>> +	.init		=3D arm_smmu_iommu_xen_domain_init,
>> +	.hwdom_init		=3D arm_smmu_iommu_hwdom_init,
>> +	.teardown		=3D arm_smmu_iommu_xen_domain_teardown,
>> +	.iotlb_flush		=3D arm_smmu_iotlb_flush,
>> +	.iotlb_flush_all	=3D arm_smmu_iotlb_flush_all,
>> +	.assign_device		=3D arm_smmu_assign_dev,
>> +	.reassign_device	=3D arm_smmu_reassign_dev,
>> +	.map_page		=3D arm_iommu_map_page,
>> +	.unmap_page		=3D arm_iommu_unmap_page,
>> +	.dt_xlate		=3D arm_smmu_dt_xlate,
>> +	.add_device		=3D arm_smmu_add_device,
>> +};
>> +
>> +static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>> +				const void *data)
>> +{
>> +	int rc;
>> +
>> +	/*
>> +	 * Even if the device can't be initialized, we don't want to
>> +	 * give the SMMU device to dom0.
>> +	 */
>> +	dt_device_set_used_by(dev, DOMID_XEN);
>> +
>> +	rc =3D arm_smmu_device_probe(dt_to_dev(dev));
>> +	if (rc)
>> +		return rc;
>> +
>> +	iommu_set_ops(&arm_smmu_iommu_ops);
>> +
>> +	return 0;
>> +}
>> +
>> +DT_DEVICE_START(smmuv3, "ARM SMMU V3", DEVICE_IOMMU)
>> +.dt_match =3D arm_smmu_of_match,
>> +.init =3D arm_smmu_dt_init,
>> +DT_DEVICE_END
>> --=20
>> 2.17.1


