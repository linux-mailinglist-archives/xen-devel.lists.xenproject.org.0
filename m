Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BD644C2B2
	for <lists+xen-devel@lfdr.de>; Wed, 10 Nov 2021 15:04:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224320.387573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkoBu-00015y-U4; Wed, 10 Nov 2021 14:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224320.387573; Wed, 10 Nov 2021 14:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkoBu-00013h-Qh; Wed, 10 Nov 2021 14:03:06 +0000
Received: by outflank-mailman (input) for mailman id 224320;
 Wed, 10 Nov 2021 14:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1fV=P5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mkoBt-00013b-Mj
 for xen-devel@lists.xenproject.org; Wed, 10 Nov 2021 14:03:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0631.outbound.protection.outlook.com
 [2a01:111:f400:fe06::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb19ba2c-422e-11ec-9787-a32c541c8605;
 Wed, 10 Nov 2021 15:03:04 +0100 (CET)
Received: from AS8PR04CA0052.eurprd04.prod.outlook.com (2603:10a6:20b:312::27)
 by AM0PR08MB3636.eurprd08.prod.outlook.com (2603:10a6:208:d4::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Wed, 10 Nov
 2021 14:02:54 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::a5) by AS8PR04CA0052.outlook.office365.com
 (2603:10a6:20b:312::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Wed, 10 Nov 2021 14:02:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 10 Nov 2021 14:02:53 +0000
Received: ("Tessian outbound e7ce0d853b63:v108");
 Wed, 10 Nov 2021 14:02:53 +0000
Received: from 27fe83e85fe1.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D8A9D01B-61D6-404F-BF51-535CF5058E39.1; 
 Wed, 10 Nov 2021 14:02:41 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27fe83e85fe1.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 10 Nov 2021 14:02:41 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com (2603:10a6:20b:39c::6)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Wed, 10 Nov
 2021 14:02:36 +0000
Received: from AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd]) by AS8PR08MB6808.eurprd08.prod.outlook.com
 ([fe80::3d99:b3e8:1c0:6fcd%9]) with mapi id 15.20.4669.010; Wed, 10 Nov 2021
 14:02:35 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 10 Nov 2021 14:02:35 +0000
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
X-Inumbo-ID: eb19ba2c-422e-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toxIxcKXn8WUm0gB/eJFIEBN9ACaVaDEcTMLhUrMhz0=;
 b=R8mSvP9MwnfLy/c4IgCOzK7hz1vqxv1UYZ6egptSlXuE5aSXEpJNomkUafsEWzbyCUYOyUxxSP399xMsmTIO+9vM2baaraZwBs4M9gqKr3Uot6PS/w8KkIixF3y1wEsDNtf5zbAVmoFLL+HBXlPVsvU5yEwnh9+e+1VfW7t0Fn8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ff4d678ee4689e37
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J88rDXfg+Ub3LOwgb9DVFr9q2OUwBR+VwXpDcB5e5kAjfhdkivHPZ8WmRb2bAzpwXQ7w4VBFboQBMxn2xCtycKSSa72cC1fWTURtlOqg0Ply0KBNeT/+7zzem53+ocdWMAjVVz2t+N7odUP1Q+qp+y8xg1phMaaZdmITolP8FY5pjnUbtoI9q0ns3KHxGQP06iQ4FTsgzTmHM4XZ6fSK7L7YXF3SZQmubmRNmz8iCO03t+sdtHCmHSIGqxwAjOqCm/gige4KD2orobr/n7pTMDM8nVdJPCbCPALAI38EbbQKJr7EJSjSu4RAvuJAudiNnPZZC4KZmt0vvV+/fNiIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toxIxcKXn8WUm0gB/eJFIEBN9ACaVaDEcTMLhUrMhz0=;
 b=aFtEYiEFuWktnKzqi2HVPKiLGcfGih4QEOYkLlBTHq2qb7/PPGkV7rzblh5wyFwZfG6oSTwcq0BUi1CRlhyYbMSbXA7g1yLyGrAUncDidfGnTFZ3REmnagexIn8vKAnPgAzaDLEf22SBuiBpuKSM3qGgBSPXNoNuwWtKHBb4rZH1BvrIDKVG8TnGcsmj9gUuZ0vbgxjEe2n1mPds9xxpqgdBFkr3bl/Ansm87adkUKH6LymkOIaRskT4IVh1JnN73lCrA4pjdL70A/sP2VTv0/kdc93CV8RU0Bt3IgG/ZcO8kSA2QoyXBpydYn1CG2rojmCZ/EfOrovG7zY2UQ6Fpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=toxIxcKXn8WUm0gB/eJFIEBN9ACaVaDEcTMLhUrMhz0=;
 b=R8mSvP9MwnfLy/c4IgCOzK7hz1vqxv1UYZ6egptSlXuE5aSXEpJNomkUafsEWzbyCUYOyUxxSP399xMsmTIO+9vM2baaraZwBs4M9gqKr3Uot6PS/w8KkIixF3y1wEsDNtf5zbAVmoFLL+HBXlPVsvU5yEwnh9+e+1VfW7t0Fn8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH-4.16 v2] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
Date: Wed, 10 Nov 2021 14:02:28 +0000
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <725F3F68-A1CE-42FB-9C8A-0700CDD02E8E@arm.com>
References: <20211104141206.25153-1-luca.fancellu@arm.com>
 <81685961-501e-7a41-6f6f-bc4491645264@suse.com>
 <alpine.DEB.2.22.394.2111041351490.284830@ubuntu-linux-20-04-desktop>
 <97C884F7-0577-4996-AB79-0A07A8D48FD8@arm.com>
 <alpine.DEB.2.22.394.2111041431070.284830@ubuntu-linux-20-04-desktop>
 <9E52FA33-422B-4B1C-A6AF-601CDF565700@arm.com>
 <alpine.DEB.2.22.394.2111041449180.284830@ubuntu-linux-20-04-desktop>
 <e4b2e1be-0e41-0e6e-5ea8-3c12b4593724@suse.com>
 <alpine.DEB.2.22.394.2111050825240.284830@ubuntu-linux-20-04-desktop>
 <9bd58aa4-602b-4c64-e759-581513909457@suse.com>
 <alpine.DEB.2.22.394.2111081805530.3317@ubuntu-linux-20-04-desktop>
 <191dd1b2-8e2a-ee91-f401-dda4fabf4c7c@suse.com>
 <alpine.DEB.2.22.394.2111091350510.440530@ubuntu-linux-20-04-desktop>
 <3B8E0C6E-0522-4F73-B6C2-827FA45C87BA@arm.com>
 <010fa02f-e561-e7a8-9638-5246db9166b4@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0197.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::17) To AS8PR08MB6808.eurprd08.prod.outlook.com
 (2603:10a6:20b:39c::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bb335cd-dde1-4790-e90b-08d9a452ca3c
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:|AM0PR08MB3636:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB363652C888812A6C472C37A6E4939@AM0PR08MB3636.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rdApp104AleWDQ3MTtZr/ogSPD88aHIN//39OEzrGNsqUmuNSiCO4HVqs/fqtNPFgGu8+nE4jb+sWI79XzOigg0Epw2yrSPBJobyk8pT/h4rUbWYhWGQRFgt9rNWsRpSK0MjqLIy1tg2ygkHh6A8jqI9z3wma1EbDmy+OtxnmVFkUxqH0XkRZGMKFpSK/5CvWU1jabzC7byK6CgRF4W0N1JILAPr8FLjgthwhWecOQLkQGp6GTz6LE0uLrwcHBirm9QmLZUYIwoqSbIB683ATVRZYuR5SRCAaKoM3gCRmlApbBog9nS7gqoZGhIXr7rGjNo2wxKq+jqtYoFfw9TTlJqaJmpgsgGIcr4VosO1x6nGqHIlFybHxyWvH15xNuATTNZu+TsmL4imW49pMlJrZbPHOn1j3hD24R2oOFPZEO8ttd/B1bW83yEHeLVw6c2sQrZSBk+X27jEbuxaLzJVpuQe9S/1HnrrIO/RhmWKIoQTBcrWE4dInSQbEuMzLYNkCMcbe3K/HZDLAns17oyzyGg9U9F9O7+23zwwqP2NAYZw4v4G9CSxF8bj9RGPgBxRho5HNHey1h28U5yib8WGH9M+4+KfJUhtqw0NFRiXCuOnX9qQd4kAE4lkzJL+rNPcdhyMXKhhAxcV89L6o9w9Dl19ZW7Ff4heuYPPfepATKEyGnMtB44l3+FNcNUIon+mKK2VjWZ9ueO5ACZ9bRHmgBppZxr8b90jH0EaLYXAqbL63zTrcVhwaVEfrVstOC8f
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6808.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(8936002)(36756003)(316002)(2616005)(54906003)(5660300002)(186003)(4326008)(44832011)(26005)(2906002)(66476007)(6916009)(6506007)(956004)(38100700002)(6512007)(8676002)(66556008)(38350700002)(53546011)(508600001)(6666004)(86362001)(33656002)(52116002)(6486002)(66946007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ab0505e-ab7a-4ad6-017a-08d9a452bf4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	90PMOgbgvsq7Ib+ljrAOnoRo6mni3i5G7AWvxgmuHAS444wcWva6rtSIM12nxNrm1RzQZ+prOhJwWeO0ZVqrKQsRztROGPeFh35VazEHAApuirieXt5HpqDSf+KXEpOkcuY31sZT4HMVsqenTYGzW330FCMzPHSta75cMfc7oc79K/Mj5pca2yHkE+OPncubbYNo5hpDD+OTuXbgubzkyzd288ZA1Yd7NNxTDdLn9lhMxaWSMzWFOL7qkjeKGfvWyWOjqSOPM3V94jJ4wRXB+Mxn6vrtJv2uLC/ZnrmcSQMegiEN3DwjACanSyue5oUElFRV1NunlwDqH3PjD4mnHVpALiYCUs1KlyWuGm50HJ9kCySzrzUKpmdimxJVZDrh5bdR9EHr9y6kXdM1iblDSlotGEEBMQH0/6qCRfBDKYuo7sV3xsEy/JRpD/mw1k4M0BscqjYkvSYi/KDmbN/IbIwqynp31CTtojvjxUXLh1JakIpDJfM0NdxafF4cvpNJVsZo+M0DFTfPJDLwRRgr1MXcFH/xJli7PKJF8KsncpO3CGRwQALnH8F7Vdu/eO6eTqHGqt9UY64audp3mrlHqXZWYQ/LtvgqB9BjHc2for386mUem9M6Z2lLYUiCjZeWfl5kv+r0b3100EZA8d6VhDuEi/m3dI6EV+Y8tHQ1T+ZVCyFpIacSSlwVnK5C56aEEHqSNpTgzbbmMZRedxqlkw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6506007)(316002)(54906003)(356005)(26005)(86362001)(5660300002)(6512007)(33656002)(81166007)(8936002)(186003)(44832011)(70206006)(8676002)(47076005)(6862004)(36860700001)(53546011)(6666004)(82310400003)(6486002)(508600001)(83380400001)(336012)(2906002)(2616005)(956004)(70586007)(4326008)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2021 14:02:53.6259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bb335cd-dde1-4790-e90b-08d9a452ca3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3636



> On 10 Nov 2021, at 13:36, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> On 10/11/2021 13:05, Luca Fancellu wrote:
>> I thought having the EFI_FILE_HANDLE global in efi-boot.h was a =E2=80=
=9Cno go=E2=80=9D, but if it=E2=80=99s not then instead of
>> calling get_parent_handle in efi_check_dt_boot (that is the main issue w=
ith EDK2+Grub2), we can do
>> something like this:
>=20

Hi Julien,

> fs_dir_handle is only used by callees of efi_check_boot_dt_boot(). So the=
 global variable is not an option for me because the risk is not worth it (=
it is easy to misuse a global variable).
>=20
> Instead, I think fs_dir_handle should be an argument of allocate_module_f=
ile() and propagated up to the first call in efi_check_dt_boot().
>=20

Yes you are right, changing the interface of handle_dom0less_domain_node, h=
andle_module_node, allocate_module_file to host also an argument EFI_FILE_H=
ANDLE *dir_handle
avoids the use of the global, then the handle is requested in allocate_modu=
le_file only once and closed in efi_check_dt_boot only if it=E2=80=99s not =
null.

Cheers,
Luca

> Cheers,
>=20
> --=20
> Julien Grall


