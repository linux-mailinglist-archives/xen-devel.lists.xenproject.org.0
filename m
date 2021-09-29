Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9BD41C379
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 13:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199014.352819 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXnI-0002lx-70; Wed, 29 Sep 2021 11:30:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199014.352819; Wed, 29 Sep 2021 11:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVXnI-0002jo-3s; Wed, 29 Sep 2021 11:30:36 +0000
Received: by outflank-mailman (input) for mailman id 199014;
 Wed, 29 Sep 2021 11:30:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzIg=OT=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mVXnG-0002ji-1x
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 11:30:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea6b023a-47b3-40d6-b4af-360c45085e91;
 Wed, 29 Sep 2021 11:30:31 +0000 (UTC)
Received: from AS9PR06CA0132.eurprd06.prod.outlook.com (2603:10a6:20b:467::15)
 by VI1PR08MB4302.eurprd08.prod.outlook.com (2603:10a6:803:fb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Wed, 29 Sep
 2021 11:30:29 +0000
Received: from AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::7a) by AS9PR06CA0132.outlook.office365.com
 (2603:10a6:20b:467::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.13 via Frontend
 Transport; Wed, 29 Sep 2021 11:30:29 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT026.mail.protection.outlook.com (10.152.16.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 29 Sep 2021 11:30:28 +0000
Received: ("Tessian outbound 3c48586a377f:v103");
 Wed, 29 Sep 2021 11:30:24 +0000
Received: from e7bb2a9d1c02.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 859288AF-1049-4564-8CD6-CBF20ACD0BB2.1; 
 Wed, 29 Sep 2021 11:30:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e7bb2a9d1c02.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 29 Sep 2021 11:30:11 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6971.eurprd08.prod.outlook.com (2603:10a6:102:1da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Wed, 29 Sep
 2021 11:30:09 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Wed, 29 Sep 2021
 11:30:09 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LNXP123CA0016.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 11:30:08 +0000
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
X-Inumbo-ID: ea6b023a-47b3-40d6-b4af-360c45085e91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jxhl/zWf/A9H0Crfm8bJ+EM6HO9RJUL4QN57A5IDwY=;
 b=2WzBolNjtmt7mG2wednKIphHW/8TfzzQTEuFMvxSLEglDYzB6BZBe/cg7QZ0wUKFMGQ5OR/0XeRhSmwEr6m25OUSLO6reQI4dOFUAtCBvoYgJ5/1B0Jher/dPnwe8roIwDhfsrFjdh4A/Oce4k1Bgs6iDlnO8vOvwJNVl73P1pM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ca96aaf5e52b76de
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j44HozNIEdnDJbbAEQY+BgNHt3rfN+9yt9p+lUst0YQWVohTdXIEUXrWjUljoLYcRncbxoCIg3n1r2zkkw9x4ueR3GwKoYzhjESYdJgGwXIRkPy3seNdkcWsDrQVpxuoC0PWZAbgDKwlqejuMYwX9+yaMy+XxJ9FHM+Lf8xlNCyB2UcvEQ/ffe45ZmPTdDj4N5UXckWz1oZqszS56w29MBKPv4rSAvU5fAvYu80/G9OdrjUcT4fl1qPpb1/GwEuOlRp3FyOLjgvZS19teDdS88spV335p/FUwewqqbY30EevHFbfrCpn8ew/isnZbmlsGZ2iMxC2jlQMU0/pEB2haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7Jxhl/zWf/A9H0Crfm8bJ+EM6HO9RJUL4QN57A5IDwY=;
 b=l4onwVjn9AkFo7PUC2vWJg3KNb9llXfFFdz8IUxBLWOBI/hWCZtDg70HyhPAMmb5+EfhoyK0RBDMomtbdqb+WkcmI8xx5Ncb1BGZlGrPZa/gdSP8EzLgHL0fq6NPur1eQIHN1TTVq2OY3+v7OhO1B4Hj62ualf/QqeSt1q5m7zHSPe7hJHap6hIKzNamfaQXZDEfoeUgtDapzcPgbNyzZ64tD5/3aloSppynRjHJjGbY9JP3nASvJUzV/MSnJ+krk2YqREXePHmkIsK0LN/QyUgVW9Ei2iRB+EuEZsMt74zkrqOk1MarZpnVSFb3djjOz2y1nzGYxHdf9GgB6UXAJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Jxhl/zWf/A9H0Crfm8bJ+EM6HO9RJUL4QN57A5IDwY=;
 b=2WzBolNjtmt7mG2wednKIphHW/8TfzzQTEuFMvxSLEglDYzB6BZBe/cg7QZ0wUKFMGQ5OR/0XeRhSmwEr6m25OUSLO6reQI4dOFUAtCBvoYgJ5/1B0Jher/dPnwe8roIwDhfsrFjdh4A/Oce4k1Bgs6iDlnO8vOvwJNVl73P1pM=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v3 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <120aae99-d8f9-eef3-e6ac-b1b9b842083e@suse.com>
Date: Wed, 29 Sep 2021 12:30:02 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB8612F0-623B-4E64-95FD-1D73E49FB169@arm.com>
References: <20210928163209.49611-1-luca.fancellu@arm.com>
 <20210928163209.49611-3-luca.fancellu@arm.com>
 <120aae99-d8f9-eef3-e6ac-b1b9b842083e@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LNXP123CA0016.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::28) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f87c3753-c90d-4498-5c8f-08d9833c8a0e
X-MS-TrafficTypeDiagnostic: PAXPR08MB6971:|VI1PR08MB4302:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB43020BD00C19292A2E606950E4A99@VI1PR08MB4302.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PWa9VMl1LtK7PvkwfarnORnO25KQoH1pjNvnxFMW8/vQWodh+piWXbsp0xlZZwpqztidMfGunLd3TyjkwC2n5TNzY9zo9OofpyFUGq5/c5Jv1cILteKj1xIAzLUi6j1RZuMNAn73Zfw/EdHzbs6zrfFlvMHpItcpIKBeXlnTDQu54Xyt1mvJX3eHYj/Ju0rsy+KmbVHaaLT3BqAnU4vzfe3v6gMQ18bCjYyb8MjppzLFfz5JLRiE9iv7XjUSM/THG/t0qrFYwxB/CB1gK9z/dMwaN6jb5ERp07/Be2dv10yQcXIxQEkV8pF2pznS1VHkA74mtlM6NMPN5lPwASMnTLQz/3GiIi0Wtu7Ku9Tlk4R4N4GkEER0+33DGe/bi3sP6BqniDEbQe7ACr7JNCra9FkSkPin/c5r3S5l5tXvABUUxbYtsg5yCvfiPM9Vj17PeRysVeK5CXL/FKsXbIt3rXEMqWIBKNWsnQpY5nj1+gDjzGdR/+wxBHt2dAPkYsgwwqq2aMTPr3lB5J0wV8p/6GmaeKDIlltFTOy6hMjUhR6j5INsMlRKG3eP+frexA1DDn+pTWttwle7cpp2Rb9jgNxTIiyuhnmNkqAQWiLKw6+QmVRHDIZoxcWKduLOYGmSszV143Zd7cA88LInBNj0mtvUjPMKlVWBJ0u1p4c/mv0iHPmfX18FWmYFXkk8av2rXl3eOXNTQ1veFzPrdYxsuq4DXb321t1Fm2qBZMShzqYq7KVnOjPeo4LTzc9Fn/5rc93vigs10NbyLa5kVrgs7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(26005)(6506007)(54906003)(53546011)(6666004)(6486002)(508600001)(316002)(5660300002)(44832011)(6512007)(2906002)(36756003)(38350700002)(186003)(4326008)(8936002)(8676002)(7416002)(2616005)(956004)(66946007)(33656002)(6916009)(66476007)(83380400001)(66556008)(86362001)(38100700002)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6971
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f39550cd-1c21-4301-e2a9-08d9833c7e2b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6U/VzkTVu+mTNInbjUc4lBQg5dwtf4P3S0IrCplfZBDAGy3rebpTh5H/kKpaqn88O2HzwE/9w7TCIe7lqAIeRb7fGUPrTebha9eurcpye04utIFpRb3gN97kVt0hUty93Opr8DgFky7PMsBxrMm9qGqGyTghW0c8DCDy+N8TG9MFQVVPS2lg5afIccmj+Yjf5fVwWA6flpntHJxjJSG5sjCntYd3hQ8he33XfxIr1Cei3pnd0ydlsxeNjn9nt5zE6oRNhq0jOrm09t9/TcCmhMZeUHAFRBgZwkpA1T29GZrXEBBo+ECs5SvF4YMwlMGuJgLHp4IRubJAyiionHAWJtYJ3QfGCeddIcm+Hw3cKAbkYVjVmxlFrEMy+WOeuEeUfFyMeUHPW61dt05VaEyYjncfNJbG0zrePPsKlkv2WqSYL9Y/VjAa1lacEor3NXmPf7HSOZnbQHcg11+bBVcGOozq0ztfs7SQi3ibYAPs8GoptztT0vY8Hc3iRnxAzUHVm7Jx76F6zoMBD+W0v3F4DZn3rijaXEHCdq0QAPLnbRImnXSZPbuE0D4oRPrDhQz8alL50coRqJeWSZibBFJe1qKO/6flZUDdCUhbNgZ3qB4jg5DfffpTl0lwPEq0DVCWsaiIAaqyuERAVEV+6FACrzEBbSqOAImKRhk+4AsCE1RjD+g2Zdfw4UdUFjgopm3EtJow9vk3ODBtvs2P+4n2z3WBu7XKZKSdjswA1exmM88=
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(356005)(5660300002)(82310400003)(36860700001)(44832011)(4326008)(6862004)(2906002)(81166007)(47076005)(36756003)(186003)(2616005)(316002)(33656002)(956004)(83380400001)(70586007)(26005)(6512007)(70206006)(8676002)(6666004)(54906003)(86362001)(6486002)(8936002)(508600001)(53546011)(336012)(6506007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 11:30:28.6249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f87c3753-c90d-4498-5c8f-08d9833c8a0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT026.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4302



> On 29 Sep 2021, at 08:50, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 28.09.2021 18:32, Luca Fancellu wrote:
>> --- a/xen/arch/x86/efi/efi-boot.h
>> +++ b/xen/arch/x86/efi/efi-boot.h
>> @@ -678,6 +678,12 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
>>     efi_bs->FreePool(ptr);
>> }
>>=20
>> +static int __init efi_arch_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>> +{
>> +    /* x86 doesn't support device tree boot */
>> +    return 0;
>> +}
>=20
> Every time I see this addition I'm getting puzzled. As a result I'm
> afraid I now need to finally ask you to do something about this (and
> I'm sorry for doing so only now). There would better be no notion of
> DT in x86 code, and there would better also not be a need for
> architectures not supporting DT to each supply such a stub. Instead
> I think you want to put this stub in xen/common/efi/boot.c, inside a
> suitable #ifdef.

Sure I will enclose it in #ifdef CONFIG_ARM and remove the x86 stub.

>=20
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1127,15 +1127,17 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>     static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>>     EFI_LOADED_IMAGE *loaded_image;
>>     EFI_STATUS status;
>> -    unsigned int i, argc;
>> -    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NU=
LL;
>> +    unsigned int i, argc =3D 0;
>> +    CHAR16 **argv, *file_name =3D NULL, *cfg_file_name =3D NULL, *optio=
ns =3D NULL;
>>     UINTN gop_mode =3D ~0;
>>     EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>>     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>>     union string section =3D { NULL }, name;
>>     bool base_video =3D false;
>> -    const char *option_str;
>> +    const char *option_str =3D NULL;
>>     bool use_cfg_file;
>> +    int dt_module_found;
>=20
> I think this variable either wants to be bool or be named differently.
>=20
>> @@ -1361,12 +1361,26 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>         cfg.addr =3D 0;
>>=20
>> -        dir_handle->Close(dir_handle);
>> -
>>         if ( gop && !base_video )
>>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>     }
>>=20
>> +    dt_module_found =3D efi_arch_check_dt_boot(dir_handle);
>> +
>> +    dir_handle->Close(dir_handle);
>> +
>> +    if (dt_module_found < 0)
>> +        /* efi_arch_check_dt_boot throws some error */
>> +        blexit(L"Error processing boot modules on DT.");
>=20
> For this use, bool would seem appropriate, but ...
>=20
>> +    /*
>> +     * Check if a proper configuration is provided to start Xen:
>> +     *  - Dom0 specified (minimum required)
>> +     *  - Dom0 and DomU(s) specified
>> +     *  - DomU(s) specified
>> +     */
>> +    if ( !dt_module_found && !kernel.addr )
>> +        blexit(L"No Dom0 kernel image specified.");
>=20
> ... this (and my brief looking at the Arm code) rather suggests a
> count gets returned, and hence it may want renaming instead. Maybe
> simply to dt_modules_found.

Yes that=E2=80=99s a better name, I will also add a comment just above the
efi_arch_check_dt_boot to explain it is returning the number of modules
found in the DT or an error (<0)

>=20
> Considering the new conditional I also wonder whether the error
> message can't end up being misleading on Arm (it certainly should
> remain as is on x86).

Do you think that a message like this: =E2=80=9CNo guest kernel image speci=
fied=E2=80=9D
can work for both x86 and arm architecture?

>=20
> Jan
>=20


