Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D67443470
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 18:14:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220451.381728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhxLH-0008S5-S5; Tue, 02 Nov 2021 17:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220451.381728; Tue, 02 Nov 2021 17:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhxLH-0008QJ-Ol; Tue, 02 Nov 2021 17:12:59 +0000
Received: by outflank-mailman (input) for mailman id 220451;
 Tue, 02 Nov 2021 17:12:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zwst=PV=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mhxLG-0008QC-Iw
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 17:12:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.45]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13894fbb-0c6a-4373-8388-edcd7ed55c04;
 Tue, 02 Nov 2021 17:12:56 +0000 (UTC)
Received: from AM6PR01CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::42) by DBAPR08MB5845.eurprd08.prod.outlook.com
 (2603:10a6:10:1a5::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 17:12:53 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::ec) by AM6PR01CA0065.outlook.office365.com
 (2603:10a6:20b:e0::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17 via Frontend
 Transport; Tue, 2 Nov 2021 17:12:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Tue, 2 Nov 2021 17:12:52 +0000
Received: ("Tessian outbound e7ce0d853b63:v108");
 Tue, 02 Nov 2021 17:12:52 +0000
Received: from 3de7b1a94e25.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A1914F1E-89B6-4589-8C6E-392E15E67DC4.1; 
 Tue, 02 Nov 2021 17:12:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3de7b1a94e25.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 02 Nov 2021 17:12:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6655.eurprd08.prod.outlook.com (2603:10a6:102:15d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Tue, 2 Nov
 2021 17:12:42 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Tue, 2 Nov 2021
 17:12:42 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a5::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 17:12:41 +0000
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
X-Inumbo-ID: 13894fbb-0c6a-4373-8388-edcd7ed55c04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIuUAZWnzYjAYxu8FBARlgStez5hR787SRhucLPk6os=;
 b=RKdMsyyFvtXcUdVqO2cftWwSk7HB1PU4KYbUoJJvQY1KrHzghyBD5dP7x7DO1yu9aMSRX+Of91ig5S54CV40z5TOw0QruGVuheYsOs1+SyYeRI/A9wiVBM1jkekHHA9x7F6jvyQr3uI/mhr5gotitkyEbyBxhvnY+8j6u+a3de8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 276f9613d70b0c7e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ASfRC3PYefv/IqMSusxjoQZMyxigA9DHZCrUjtutaDx8wJH6RagrEl4ThEDQ7X7vdeE4UDkfqxcz4BT0UBl79u1b/xIwVV0lML+fN+58uWw9e4dPwiLC3ximxhDqOxr1N0uNPRUg556Yb6gg6ext+XUdSN/IqhVhK6E4pFOdsfN+aMBGU+ZjdZ9BuR0wA53xmxphKHbLLKpbOIu/NKbWIMRRag7mdPtaMJphMI4ySTW8ZMMpqQ3YUz310dGOSxD9ObpW/OrmtHBZvSjI97x4dVs+fzbwwzAguPrESEJXqcwMX7Sm2eqrRwX/Qvfbn3PGRDPAuinC72194NHGW6Hy6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIuUAZWnzYjAYxu8FBARlgStez5hR787SRhucLPk6os=;
 b=dMl0JoUO5aapliwP1ZXE03iO6w5VTMhMSXZIks4vyM3WBJMwAXNjTQ2gvsWQ9IxZEggFHFUY82sHjkR/nV5kUDWKbSIhi4f5IvXuNUT7kEhD0Ah4wSyDhuhUv0LNma5gF1GZ07vW3bjpTnST0h27N9uf3ns009cSnVPaFxbODq9K/etCLjwGRVH446PH0ZYCFWwqhIcv28UtwVvmyzMg+LPJiHdYbkB5w1JtrTIVUgd0rDdrJkQI8UPwCJVs7Jqj6wRo7wfEqhcE4emF5VuJaWvuGBrfCc4bUNvOLm9tUptt+lfRMJook28k4QzHXgyR06Rs7caldkphoDe5euIdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIuUAZWnzYjAYxu8FBARlgStez5hR787SRhucLPk6os=;
 b=RKdMsyyFvtXcUdVqO2cftWwSk7HB1PU4KYbUoJJvQY1KrHzghyBD5dP7x7DO1yu9aMSRX+Of91ig5S54CV40z5TOw0QruGVuheYsOs1+SyYeRI/A9wiVBM1jkekHHA9x7F6jvyQr3uI/mhr5gotitkyEbyBxhvnY+8j6u+a3de8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
Date: Tue, 2 Nov 2021 17:12:35 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6F65B5FB-A511-4553-AA17-B144C3DB70CA@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <5290fa91-9470-be1b-47e4-a8de911b4fb3@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0297.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc5dd38e-2e80-459e-a5e7-08d99e24013c
X-MS-TrafficTypeDiagnostic: PAXPR08MB6655:|DBAPR08MB5845:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB5845D2472EB1FE7F04E93CB1E48B9@DBAPR08MB5845.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k18Nk6gFcLTTplRIfXDbUXliYrwmwdc0xTbYfplstALjbKdh+UVBVdaNt9jfaxkj5ESiAVBiKgNkYbKHXL9r4Srhd3sNRSwHGVcbDv8agGfKDp1ZxkcCwIBNkbCaIxjJkL3dlKX5VV8fSYkc9bjXI8c1T8JApElaPCFTWyfr0QMVabjHCXSmEFND10siG49V53hscS+edK45LhhVPjSYZ9DoeOOYdGufW0WMAAz1I/X64qb0Md/PJ4jt+PUI/jRLQrddlC3nuABa0gL/sZA2n3GeJp+8QisCIWxNWQyAzyvf1ru1oiZ0mQt1+dyQELH1gwcCBEaVeB/PfrGDn6srPGYLCZZmZECuMwTQPq7p18BmjwMGmtB+JDVJYxa2nRPqKX4bl3OjC1N4NqJ3rExEtEpzL1oRMgUhNbM8y1MmZaHlcBukAnKv22cjidKHvL0wuAqDH6KANwmXw14O+a3z2OB9l4XV800GIU3j52P5vBjMQOVk+v2LUJgoiA5Tat8ON42crr4v7DzPnWWHEsNMUt3w/P/e+CrSTN4bwyjf8lv/EE0D8kP3wfm6pMqds9yvSObcbBfWDdhT/uKazt5k2pkHaIQ0ePXtx3wrahwiBaPPw6aOGacf3QR3Yzr93LouWzTla2H6NawIax3J3VsWkZftMnCiEK/BuoOTscO/Zadui4SItaZPMa1gA/kt0Pl+/vVwsZtabfGtaXxuHzmn+YnLoYNB4UZT0jdRNoEGEz0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(5660300002)(66556008)(66476007)(6506007)(53546011)(2616005)(33656002)(6512007)(508600001)(6486002)(2906002)(52116002)(38100700002)(44832011)(38350700002)(83380400001)(66946007)(6916009)(956004)(36756003)(316002)(8936002)(26005)(6666004)(8676002)(54906003)(4326008)(186003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6655
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b84ff86-52dd-4f82-066b-08d99e23fadc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YwH+0VXtyz2dEqGbDfgPc7JkX8ggdQTM3+HYRgKBtr+j4OfGqhCUisFOc4SDU/PN4LtJxZBWNtwogODqs4HmgfRD1pgdBgI8LqxMKMfskDH961z5kecOUmTQ3/PnU7DjQIv7eliQ0TPLXtsgdSglNbKasf689WUALDfSi1KDDt8T369yjR0e/rjSrKs/ZZVhSmHWluK/fJYudzVM8T5Q8dlB+k6GpIsEq/UD/81jxYs7xO+JFch6CuP5GL/gxXXoBIqX9pQXSTkobbKEjeyO6aP/jH08CgcohEDneAvuJ0nYnWuUasKv2RbXtDFqNBlpukALg5Y4Ue/str1mGgovD1q4HnY7YibpSzJxplXAMfOeTjgMHGy/tZ6uWB8Gf7Ik91JN3gP2rBeuUVuy0FCJwxcoiwb8Yous9shCORb9C5pClheZJbF0oT5d0Hc0FKlgOSYhLEkjniggFOqdLuZOlYjWI22TMXxHPyJ1Fpi/uXjFw6sWl9fqo2N0okl96FK3lyZh+jSswy3U47QfBAHpUyIOuFqc5Y+FXWvxElPW5HhuYnceXOO4DD7ZYE9foFmaiSoYJi1ZeIYUraCOmHlnTMR+irV3oc+xPVdR6Yy0iFXj5BQWjcHHTnyWc9q7ckKQdGi/WwNf6e72PF9Qf4fKBOzSmMHouQPQTDVnPOTi6gQ8fPSNGw7HF1LwUtsqEf0GB4o79BlpHJCHD+drOWeoAw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(4326008)(6506007)(26005)(2906002)(508600001)(82310400003)(70206006)(36860700001)(356005)(6666004)(53546011)(54906003)(70586007)(316002)(86362001)(36756003)(186003)(33656002)(6486002)(8676002)(83380400001)(6512007)(5660300002)(6862004)(336012)(47076005)(8936002)(81166007)(956004)(2616005)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 17:12:52.5339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5dd38e-2e80-459e-a5e7-08d99e24013c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5845

+ Ian Jackson for 4.16 release

> On 2 Nov 2021, at 14:45, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 02.11.2021 15:05, Luca Fancellu wrote:
>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
>>=20
>> The problem comes from the function get_parent_handle(...) that inside
>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>> is NULL, making Xen stop the UEFI boot.
>=20
> According to my reading the UEFI spec doesn't (explicitly) allow for
> this to be NULL. Could you clarify why this is the case? What other
> information may end up being invalid / absent? Is e.g. read_section()
> safe to use?

My test on an arm machine running Grub2 on top of EDK2 showed that
when Xen is started, the get_parent_handle(=E2=80=A6) call was failing and =
stopping
the boot because the efi_bs->HandleProtocol(=E2=80=A6) was called with the
loaded_image->DeviceHandle argument NULL and the call was returning
a EFI_INVALID_PARAMETER.
So the parent handle can=E2=80=99t be requested and the filesystem can=E2=
=80=99t be used,
but any other code that doesn=E2=80=99t use the handle provided by get_pare=
nt_handle(=E2=80=A6)
can be used without problem like read_section(...).

>=20
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -449,6 +449,13 @@ static EFI_FILE_HANDLE __init get_parent_handle(EFI=
_LOADED_IMAGE *loaded_image,
>>     CHAR16 *pathend, *ptr;
>>     EFI_STATUS ret;
>>=20
>> +    /*
>> +     * If DeviceHandle is NULL, we can't use the SIMPLE_FILE_SYSTEM_PRO=
TOCOL
>> +     * to have access to the filesystem.
>> +     */
>> +    if ( !loaded_image->DeviceHandle )
>> +        return NULL;
>=20
> I couldn't find anything in the spec saying that NULL (a pointer with
> the numeric value zero) could actually not be a valid handle. Could
> you point me to text saying so?

I am reading UEFI spec 2.8 A, section 7.3 Protocol Handler Services, when i=
t talks about
EFI_BOOT_SERVICES.HandleProtocol() there is a table of =E2=80=9CStatus Code=
 Returned=E2=80=9D listing
the EFI_INVALID_PARAMETER when the Handle is NULL.

>=20
>> @@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_han=
dle, CHAR16 *name,
>>     EFI_STATUS ret;
>>     const CHAR16 *what =3D NULL;
>>=20
>> +    if ( !dir_handle )
>> +        blexit(L"Error: No access to the filesystem");
>=20
> dir_handle also gets passed to efi_arch_cfg_file_{early,late}() -
> those don't need any adjustment only because they merely pass the
> parameter on to read_file()?

Yes, the handling is done in read_file(...)

>=20
>> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>             EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>                                                        &file_name);
>>=20
>> +            if ( !handle )
>> +                blexit(L"Error retrieving image name: no filesystem acc=
ess");
>=20
> I don't think this should be fatal - see the comment ahead of the
> enclosing if().

I=E2=80=99m not sure I get it, I put the fatal condition in part because th=
e handle was dereferenced by
handle->Close(handle), but also because file_name would have not being modi=
fied by the call
and we have then *argv =3D file_name.

Cheers,
Luca

>=20
> Jan
>=20


