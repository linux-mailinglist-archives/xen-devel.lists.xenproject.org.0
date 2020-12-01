Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E492CA1AF
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 12:43:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41852.75337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk435-0001fx-Ln; Tue, 01 Dec 2020 11:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41852.75337; Tue, 01 Dec 2020 11:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk435-0001fY-IT; Tue, 01 Dec 2020 11:42:23 +0000
Received: by outflank-mailman (input) for mailman id 41852;
 Tue, 01 Dec 2020 11:42:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dt7S=FF=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kk434-0001fT-6X
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 11:42:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c6377db3-00a4-4129-a933-2bfcd36ed77d;
 Tue, 01 Dec 2020 11:42:19 +0000 (UTC)
Received: from AM6P194CA0052.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::29)
 by AM6PR08MB4914.eurprd08.prod.outlook.com (2603:10a6:20b:cf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.21; Tue, 1 Dec
 2020 11:42:17 +0000
Received: from AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::52) by AM6P194CA0052.outlook.office365.com
 (2603:10a6:209:84::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 1 Dec 2020 11:42:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT005.mail.protection.outlook.com (10.152.16.146) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.26 via Frontend Transport; Tue, 1 Dec 2020 11:42:16 +0000
Received: ("Tessian outbound e0cdfd2b0406:v71");
 Tue, 01 Dec 2020 11:42:16 +0000
Received: from 2fb2177f5223.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D4D3511-B59E-4E94-A3BB-37F92A35594C.1; 
 Tue, 01 Dec 2020 11:42:01 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fb2177f5223.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Dec 2020 11:42:01 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4823.eurprd08.prod.outlook.com (2603:10a6:10:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Tue, 1 Dec
 2020 11:41:48 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::98c7:4612:2365:cc6b%5]) with mapi id 15.20.3632.017; Tue, 1 Dec 2020
 11:41:48 +0000
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
X-Inumbo-ID: c6377db3-00a4-4129-a933-2bfcd36ed77d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPRYrYgKzdOlPiRSzRXRF9NtPFmB1OkjPCYy8XGSXNc=;
 b=vQaQPIStDXAazwIJGTuB33LAPuOI6aiEdF/wkmuK9d6dYkpwWDM8amS0SuQeforQ6gwlgGjuq45lIcYltXHzjntOsZcSX9HpIIRErtSwzNzhKpZCOP1wki97LqBuDk7qdJTJ0X6TOfXG7QMGdctnYOoVPVMu3Nndu7aS3ft4T4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: edd371d7f51bf23c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FoC1wxvdUYH5F1i1a0L1V2RWdC9y7t1okYMHXHrBI6d/0skP0L2ISgtJql6RaxgFc7N+NrDqBIdfHtwCDPiGzjQn3QjufiuNjtZN7jemX+NpRD0N+FaIVud02K4kAOmu3QE9bAvb2OQcECU395C7AGkznD8ygAwRTrsrHiOWp7smLpuSiTzAUGKCQ6So3sWi8IeGP69D5oEJ/sV4RJr/DALMkihBWQ8zuun44rJl+UoYg6iIUrMoctpv8+sHS5mm/oaBc/s9tX4jLyGxT5bCAJB7tT5uh/3HPFEZD/nYRWD8P1/08a7ecilyURTKomtpd4/t4FwMItFymydl/HZ6qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPRYrYgKzdOlPiRSzRXRF9NtPFmB1OkjPCYy8XGSXNc=;
 b=O/lzXBVjMZBhnUZB9WFSI+gl7LOJ3Qnc2sTm59PnR33Qy5fTszuymlKtzQwG+lu1PtvrxKyA5cVdxZytq5+qJ7TnnLRo/uwUpTyccEL2S9tIAc20b2oF8N3ZCWBisKGyIhqP5zKnrbWkG+2wSx5LnjdOcYGtouPNecvWjqQftzafoFr5NBelyL4FajHaXXwgbf53o2StYxAk7CqVX05Nz2cabOXidIvAH5lzACf6KGQGVxO5FPY3ZMaC95VnbgTIe+44EFkUnO3/+5dMg/LP0h5vOHZv0I+xwntdamuLiY36ocn7tVUtIHYgI6JO8+qRXEmneX6e1WzqHm7Rxj+Hyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPRYrYgKzdOlPiRSzRXRF9NtPFmB1OkjPCYy8XGSXNc=;
 b=vQaQPIStDXAazwIJGTuB33LAPuOI6aiEdF/wkmuK9d6dYkpwWDM8amS0SuQeforQ6gwlgGjuq45lIcYltXHzjntOsZcSX9HpIIRErtSwzNzhKpZCOP1wki97LqBuDk7qdJTJ0X6TOfXG7QMGdctnYOoVPVMu3Nndu7aS3ft4T4M=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Topic: [PATCH v2 3/7] xen/arm: create a cpuinfo structure for guest
Thread-Index: AQHWxyRpRLPV3+rSX0iDOmZYGXBVV6nhHOuAgAECsoA=
Date: Tue, 1 Dec 2020 11:41:47 +0000
Message-ID: <766ECB70-DD45-4194-98DE-C1D312C8BE11@arm.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <539cc9c817a80e35a2532dba5bc01e9b2533ff56.1606742184.git.bertrand.marquis@arm.com>
 <87tut67g93.fsf@epam.com>
In-Reply-To: <87tut67g93.fsf@epam.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0c611bc9-7bd4-480d-dc94-08d895ee277d
x-ms-traffictypediagnostic: DBBPR08MB4823:|AM6PR08MB4914:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB491405C19C32935C1739CF699DF40@AM6PR08MB4914.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 unyw+XzBEB+JrxdNiwP/aL7DRoHWBlNK9q+gRQwFmMrtAkBp9SbJqTZFkYn4TtkPQ5Nwt0GQ+6dxlvBPFWR5ehO+GJ6qYm+Rs9cEnhfpbvtA0096VVhlwd0/130aNKULWYlZkug2+a9iYMYqopWK1AEOJ4E5BWo6y339NhbnKGrgW0pmGQLRB0luWlQF/tPQwzV2JRM7g4MGLZejuR7rE/grZaV1b5t+xYPVAm+Mp9P6hVbzm/4DvxZr85QricM7EkDO+KAHHHcPnOA/RaSmAinwrmVfhBpITGseKkZOrOss3ElMckif6Dn33S8BPU+TfMsLv5tX2LGzHUu/6HMtng==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(71200400001)(2616005)(6486002)(53546011)(6506007)(33656002)(5660300002)(478600001)(36756003)(66556008)(186003)(4326008)(66446008)(26005)(8676002)(66476007)(83380400001)(6512007)(2906002)(54906003)(86362001)(8936002)(76116006)(316002)(64756008)(6916009)(66946007)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?aoShPmv6T9A5Ku9HwbCtJj3ATN++9bExlyiaI6Ud0ZIGDeaIwdLUa12aNIFc?=
 =?us-ascii?Q?IRiPQU1jYqVkLyqI05tJpL4aKTnqE4/604hm7oI96ONtftkuLDt/dOvc67fu?=
 =?us-ascii?Q?HJ+G8gK3zxhFmIidXmZRMzG8DImz6Jd0YbQxX03WId5NmBqXH39QPKEdu22o?=
 =?us-ascii?Q?LYdrDpqQSyr4ZLhaZ23okGrnwaWu7mzeXVw0c6x77z1PXoIRaUhsJk3HiSiT?=
 =?us-ascii?Q?xTixfget7pp1x2sW3xYrP77UAt9LT0ENpIjeI36OMDYIY36mZb6lWsumyPro?=
 =?us-ascii?Q?mPbc4wLJurzVn3icQfKBBHoRtpcDpSvPR1NKvrqnDuVEX86bKbmeo6yyYEYe?=
 =?us-ascii?Q?bu//HCzhI9jDSiJsOmJ3fuJ+ScxVx8G9qoQk/N5s77Yb7x/ZPJSwsvGv43ri?=
 =?us-ascii?Q?GiCi+Ey35ilS599zM6I6Bu7fNCrS7dPAOaaqwWaEvXZUUDp1Cr/aMs3vYLKv?=
 =?us-ascii?Q?DdhKLk9h56ZTCfeJDFo+qa61qX4f9ZShvN/92IleCSUypWmUirkh8uWJ+VZN?=
 =?us-ascii?Q?GfQuFm4v56metEWrhsRhgWIar8ER2lHkhPaXpfEfMG8UlCYQnsCgmYbmbWzH?=
 =?us-ascii?Q?6g5nXdv3PuWCx/n+Sh0wtATgemmPvEMC+xCIQlndw6A9dXQ0L2kYc7poowSs?=
 =?us-ascii?Q?bAw6gJCQL2WkqDnACXm8kS43N1b2urW/COqUTuirIraTN87gckt+aDpTpS5Q?=
 =?us-ascii?Q?3Odngq9O+w6THHeeHyxOFuHg9FnPanK/s3BTMu5v/rts1dllMk8LoPjW3tHm?=
 =?us-ascii?Q?DFtXzSXo0ke46M8aTttvfUSBu5kEQH8+GzBFFueu5zczBQnsCFdSQ40k+fjW?=
 =?us-ascii?Q?2UmoGQvHNJGbXwgv5kt7LA/5X3WSTfgIBshgYbLXyJMEPQvzQffX5APWZmnT?=
 =?us-ascii?Q?+WHUj3ba2v1QS0sX8cwaKgwzPVS7vW1YILLkGnDeqoiMGXWI6OoIyuo7Fq7j?=
 =?us-ascii?Q?f7iOZ3z4EwIr9R+0zL1yaqT/iUfLRIhFi3jqQ+b5pmoGNcEfZfC+KYpY7EXk?=
 =?us-ascii?Q?1Y3c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <69981C77A1CF6140ABFA7897CD886903@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4823
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	51a492f2-22ab-45dc-d471-08d895ee1645
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JHnqboET/ECy9lJbpSsnNKZKbpN8wQELgY+9pKsVXFvQGdVaEHbaG70uYb2cGHbbhHxKbwt+T6+lE+5iwJRvqD2aLO+sXcWxuVnXkJWrxAcUves7CwYmLAEWoLUrgOFriFd2AqO0Mzy4RnCNsBzK+wSa2Dr1BX734g4hplMMftx6OGleN2TxoRbHudahN1nubQ7IGUPaeCYGbGcwQD5sBQLUXmL+i6pA7i2uhbWf18BBuiwhpCFdrg1q+DZOpqUoiMjnMBVSTJlFYpwlCVSeBsTYZSRUaH9b4yNYG3/DF4F1ExYEehcnjwhy/9/9co8bIrwsqN1GPiz3lfTpaYe0vI2zHZUoOYokLkmH03vfDCN06/pKQFBYZwCebUlXzwPDVOX/5zrdCUEAzp/ScXhcYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966005)(33656002)(81166007)(8676002)(47076004)(36756003)(8936002)(2906002)(83380400001)(70206006)(478600001)(5660300002)(70586007)(6486002)(4326008)(6862004)(336012)(54906003)(36906005)(26005)(316002)(2616005)(6512007)(186003)(82740400003)(53546011)(86362001)(82310400003)(6506007)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 11:42:16.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c611bc9-7bd4-480d-dc94-08d895ee277d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4914

Hi Volodymyr,

> On 30 Nov 2020, at 20:15, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com> =
wrote:
>=20
>=20
> Bertrand Marquis writes:
>=20
>> Create a cpuinfo structure for guest and mask into it the features that
>> we do not support in Xen or that we do not want to publish to guests.
>>=20
>> Modify some values in the cpuinfo structure for guests to mask some
>> features which we do not want to allow to guests (like AMU) or we do not
>> support (like SVE).
>>=20
>> The code is trying to group together registers modifications for the
>> same feature to be able in the long term to easily enable/disable a
>> feature depending on user parameters or add other registers modification
>> in the same place (like enabling/disabling HCR bits).
>>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> Changes in V2: rebase
>> ---
>> xen/arch/arm/cpufeature.c        | 51 ++++++++++++++++++++++++++++++++
>> xen/include/asm-arm/cpufeature.h |  2 ++
>> 2 files changed, 53 insertions(+)
>>=20
>> diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
>> index 204be9b084..309941ff37 100644
>> --- a/xen/arch/arm/cpufeature.c
>> +++ b/xen/arch/arm/cpufeature.c
>> @@ -24,6 +24,8 @@
>>=20
>> DECLARE_BITMAP(cpu_hwcaps, ARM_NCAPS);
>>=20
>> +struct cpuinfo_arm __read_mostly guest_cpuinfo;
>> +
>> void update_cpu_capabilities(const struct arm_cpu_capabilities *caps,
>>                              const char *info)
>> {
>> @@ -156,6 +158,55 @@ void identify_cpu(struct cpuinfo_arm *c)
>> #endif
>> }
>>=20
>> +/*
>> + * This function is creating a cpuinfo structure with values modified t=
o mask
>> + * all cpu features that should not be published to guest.
>> + * The created structure is then used to provide ID registers values to=
 guests.
>> + */
>> +static int __init create_guest_cpuinfo(void)
>> +{
>> +    /*
>> +     * TODO: The code is currently using only the features detected on =
the boot
>> +     * core. In the long term we should try to compute values containin=
g only
>> +     * features supported by all cores.
>> +     */
>> +    identify_cpu(&guest_cpuinfo);
>> +
>> +#ifdef CONFIG_ARM_64
>> +    /* Disable MPAM as xen does not support it */
>> +    guest_cpuinfo.pfr64.mpam =3D 0;
>> +    guest_cpuinfo.pfr64.mpam_frac =3D 0;
>> +
>> +    /* Disable SVE as Xen does not support it */
>> +    guest_cpuinfo.pfr64.sve =3D 0;
>> +    guest_cpuinfo.zfr64.bits[0] =3D 0;
>> +
>> +    /* Disable MTE as Xen does not support it */
>> +    guest_cpuinfo.pfr64.mte =3D 0;
>> +#endif
>> +
>> +    /* Disable AMU */
>> +#ifdef CONFIG_ARM_64
>> +    guest_cpuinfo.pfr64.amu =3D 0;
>> +#endif
>> +    guest_cpuinfo.pfr32.amu =3D 0;
>> +
>> +    /* Disable RAS as Xen does not support it */
>> +#ifdef CONFIG_ARM_64
>> +    guest_cpuinfo.pfr64.ras =3D 0;
>> +    guest_cpuinfo.pfr64.ras_frac =3D 0;
>> +#endif
>> +    guest_cpuinfo.pfr32.ras =3D 0;
>> +    guest_cpuinfo.pfr32.ras_frac =3D 0;
>> +
>> +    return 0;
>> +}
>> +/*
>> + * This function needs to be run after all smp are started to have
>> + * cpuinfo structures for all cores.
>> + */
>=20
> This comment contradicts with TODO at the beginning of
> create_guest_cpuinfo().
>=20

I think the comment is coherent as it is a prerequisite to solve the TODO.
I made it this way so that nothing would need to be modified there to handl=
e the TODO.

So I do not really see a contradiction there, what would you suggest to say=
 instead ?

Regards
Bertrand

>> +__initcall(create_guest_cpuinfo);
>> +
>> /*
>>  * Local variables:
>>  * mode: C
>> diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpuf=
eature.h
>> index 64354c3f19..0ab6dd42a0 100644
>> --- a/xen/include/asm-arm/cpufeature.h
>> +++ b/xen/include/asm-arm/cpufeature.h
>> @@ -290,6 +290,8 @@ extern void identify_cpu(struct cpuinfo_arm *);
>> extern struct cpuinfo_arm cpu_data[];
>> #define current_cpu_data cpu_data[smp_processor_id()]
>>=20
>> +extern struct cpuinfo_arm guest_cpuinfo;
>> +
>> #endif /* __ASSEMBLY__ */
>>=20
>> #endif
>=20
>=20
> --=20
> Volodymyr Babchuk at EPAM


