Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5B41EEF7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 15:56:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200637.355180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJ1W-0004ZU-JO; Fri, 01 Oct 2021 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200637.355180; Fri, 01 Oct 2021 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWJ1W-0004WZ-FL; Fri, 01 Oct 2021 13:56:26 +0000
Received: by outflank-mailman (input) for mailman id 200637;
 Fri, 01 Oct 2021 13:56:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LCz3=OV=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mWJ1U-0004WT-Q9
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 13:56:25 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::600])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b8e63f10-7398-436f-a887-1718033ed6ff;
 Fri, 01 Oct 2021 13:56:21 +0000 (UTC)
Received: from AM5PR0202CA0007.eurprd02.prod.outlook.com
 (2603:10a6:203:69::17) by PA4PR08MB6141.eurprd08.prod.outlook.com
 (2603:10a6:102:f2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 13:56:19 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::87) by AM5PR0202CA0007.outlook.office365.com
 (2603:10a6:203:69::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 1 Oct 2021 13:56:19 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Fri, 1 Oct 2021 13:56:18 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Fri, 01 Oct 2021 13:56:14 +0000
Received: from abe9f799f279.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E8428BAF-6CB9-476A-8657-2A04D795EB55.1; 
 Fri, 01 Oct 2021 13:56:03 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id abe9f799f279.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 01 Oct 2021 13:56:03 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6544.eurprd08.prod.outlook.com (2603:10a6:102:157::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Fri, 1 Oct
 2021 13:56:01 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%9]) with mapi id 15.20.4566.015; Fri, 1 Oct 2021
 13:56:01 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:194::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.17 via Frontend Transport; Fri, 1 Oct 2021 13:56:00 +0000
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
X-Inumbo-ID: b8e63f10-7398-436f-a887-1718033ed6ff
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9eHqhA/5n8OoLHibObMnB8sQbWbmRiNVdzckY4JUJM=;
 b=k5Bbnvmhsflx3tBQrj0UA/pyt6+C0GDSaZOC/faQELYAyvKkYNl7Iydr5k8GqURZP/1bSiwQUK1VmB9JpIQTRxQlcfR+9SEDNWRbI8A/VtuwdzLwS/95GVtb8JzF653N2AYDGiazVhzgXqV///FCTRHQDw7nI1vrlHHHZBLSWvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16236d1882e8c77d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3l0wk/JQxmUc9olb0vVjn0pIAvEAcm99xVxdgwCWpnj9fyz2ecNqFOB59cx9FaEIcqSZASdKSLj/1LoFMYn//Sbi47MszjoD0h75Cy47VCaH24ZhyiizOLpQ9QO2cy4CZKhToJkMd++OReMG+8yWGYxDp8JdKb563hsyUYnPCWeQoUcfNl2599Rb+4mcnnufYoBdMSivhWhX2OktFbYqmnPhPqwntWfeV1TqcY56AZzNP+HpBdx/d2cPXT6LXiClNVCT6YM085yvVbdzThhdNeXfb+n1E/C590j26PAMM/FQ7R9H1ogZG9becdMpPzISNUg11SUndOc423ShWNZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j9eHqhA/5n8OoLHibObMnB8sQbWbmRiNVdzckY4JUJM=;
 b=YP9C6mLWmet1Ft4/9R45TpGPdVsQkYuSo8hEHEZNwiBq8/V2k6lodo0fetM9dBlalaRJGtuUp4umy8ot8KhLPB84UpernLxT1Elo0ata4qBScgfBs5YELDPtBu7isJQdXfy0BtyRZ6hf6XKIzUQgPSkGDZ5g/VvrK+Ye745ybhOJXQuCO8eaPVbSNM5T80mPLC2s3+UanCTxChgiCt3XGO1PHUC9qql6EtI3Nx113fXFPQOYxlzfHG+O/5NXlNvnzJEjDf82N2OUE3OcJlpcCuofdkmuuRk9QBSeORA7okmgKMlpiMPcRoQ4VVsO0HAP1a9H+9pWWepx/KC+uvYdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9eHqhA/5n8OoLHibObMnB8sQbWbmRiNVdzckY4JUJM=;
 b=k5Bbnvmhsflx3tBQrj0UA/pyt6+C0GDSaZOC/faQELYAyvKkYNl7Iydr5k8GqURZP/1bSiwQUK1VmB9JpIQTRxQlcfR+9SEDNWRbI8A/VtuwdzLwS/95GVtb8JzF653N2AYDGiazVhzgXqV///FCTRHQDw7nI1vrlHHHZBLSWvk=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 2/3] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
Date: Fri, 1 Oct 2021 14:55:54 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <6DFF05BA-8250-4C6C-86DF-67997F8DAD46@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-3-luca.fancellu@arm.com>
 <2fa4be34-9c69-21cb-632f-f566caf622ca@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0268.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::21) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f43dbf-652b-4a5c-6a41-08d984e33e7a
X-MS-TrafficTypeDiagnostic: PAXPR08MB6544:|PA4PR08MB6141:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB614130CE7B2A71F7F48408BCE4AB9@PA4PR08MB6141.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:457;OLM:457;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Kd7Rga7ZMG4v2wESccQhuQWVlwmvB33+2G6eNATF8s/Ax6EDNINup5M5TDBOC6ZK6oCoRESYSnssmAzGyEmffitx/hUo47cOnnC7Hr0RRHX4bstdX0Fhu/x9KVnVxkGbyPmFd/mMDhJTBVhiiz3P4jZT3sbKBaH5eiYZDKasv1fi5YcmknZ4tpVIfzQp78wdw6sKnf6OKpb+9XOD03Oem8kzhjpPpZBBCPy6xrV7/tq2BC+kVausYUCQwyRHoXG32kA2dkK8gWx9evM+8wXYDOSKnW8YBAvpues8Uh86TlxhnOCmbjzHVyR/uYIKD2rPxt9sHBmwnipLDuDlOe8EpG/w7zmDGfJ8k7xJZdqpFSztr/wg8Sii+DYtrCibcBnXsNgf3UnVRg57I082ZyBE5VrPai3WE0Bym/ifzqEHntuH1Tvu9057s3RNlMfBX8fFOSbTvi0CxY+MMTE6TyqxferOQ1HKXqyzLCDi57VJLCS5oLUl7aKUYF0e/2s7CSGMiSbhAkTfybwRuEPoPtdG8I0qqt9F886gFrgbUYymGOZ12VnVdFC+J/Mx3PLS+i8p8wehzi/Sy8WXctwclpXw2jS+UwimaVizpRtNjMwTqlL6iCHx7yhI1xz2IEeO5/ByqZ6P8T4LchBX6oRBmz2/Npkk5UY4miWl6QLhmNhQOtr7K29tji9SCFz12EL+7/SWHoZw4GrAZDRu0dr9+QZVqSDEzCOww2pGamkbVYMrO9FXIOnIEmvXrhUU5BkD3LTre7RUzus86LLOWpfA7P7y1A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(956004)(6666004)(86362001)(26005)(2906002)(66556008)(53546011)(66946007)(5660300002)(2616005)(66476007)(6486002)(44832011)(33656002)(508600001)(54906003)(8676002)(6506007)(4326008)(36756003)(316002)(186003)(8936002)(52116002)(6512007)(38350700002)(38100700002)(6916009)(83380400001)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6544
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3845f063-00e3-412a-f59b-08d984e333ee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RvsjHjNbXcMBMEKqsLXgbtDEwcT/pfkG/C1V7gn9wn4JGhfD940deBEa02FKQ1Gv7OjdF9k6RGF+gKVV1gioDb0qRc3GUDPOB7lVn/FAqaeC574/cLlk1DoD6WN7Ur5q4k5yMZd0KddPx9ES82FnTqCAWS3v3xmC975i3sufGqP9xvdzvKn5Gamxef8EuMCU6tHhuTO2V0iOJ2fHVZ33Ogrj0ocATk7Ujw6FQ629XDzP8Ve020g6hPRP+Oe1dxdUFC2fZQ/Mjw0Bi7vQbi+vzRbZ0ZpC/K7YLnysoUhCgwpW3iMH2AM53MkFfful0WjiQzSFft3UM/y1xzocg0/bj1qUMEJyvwwtX95DfC+1m6Ja2Pm7oFqcU8qLZ6FvbwWvROUT7EPRZyylD/Iw1RR/9cbMVHaHewEepdndQiWQEcjg1B7iRHd7NwdwVt1krB22PBDtZp2u7UNJ+WARiehHe0+63LaAz3EU5siAfbqTnXxUnv12aFsjizBUqwJSlagl96cuvBAohXFjyhyf5QpuchZxciX/BVFpwmMkDRCFrm+rIZNkfWD1JpwV2aCuJ+gBfFupaq2kNhDhFVpLHGNSr9j+OJsogRThvaLM/UrvaK311PfoZ4QzyL6dXRNeOwk+RU1LXIWQ6rS/X6rQ4DIHHc6dvKeLCYqYzVUnSqCvGU6T0hCHvLBjk8UVfowWXJLCcQzvHIGUrMf8MrlcyWE1j2IrQ9ti0sCiEE3m/amgItE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(44832011)(6666004)(186003)(47076005)(2906002)(33656002)(4326008)(36860700001)(6506007)(956004)(26005)(2616005)(86362001)(8936002)(336012)(82310400003)(6512007)(81166007)(36756003)(70206006)(316002)(70586007)(356005)(508600001)(6862004)(54906003)(8676002)(83380400001)(53546011)(6486002)(5660300002)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:56:18.8939
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f43dbf-652b-4a5c-6a41-08d984e33e7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6141



> On 1 Oct 2021, at 12:02, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 30.09.2021 16:28, Luca Fancellu wrote:
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
>=20
> Are these two changes really still needed?

Yes you are right, I will revert back them.

>=20
>> @@ -1285,14 +1286,13 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>             efi_bs->FreePool(name.w);
>>         }
>>=20
>> -        if ( !name.s )
>> -            blexit(L"No Dom0 kernel image specified.");
>> -
>>         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>>=20
>> -        option_str =3D split_string(name.s);
>> +        if ( name.s )
>> +            option_str =3D split_string(name.s);
>=20
>        option_str =3D name.s ? split_string(name.s) : NULL;

I will use your suggestion above so I don=E2=80=99t have to initialise it.

>=20
> would be the less intrusive change (eliminating the need to add an
> initialized for option_str). Or if you really want to stick to your
> model, then please at the same time at least move option_str into
> the more narrow scope.
>=20
>> @@ -1361,12 +1361,30 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
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
>> +#ifdef CONFIG_HAS_DEVICE_TREE
>> +    /* Get the number of boot modules specified on the DT or an error (=
<0) */
>> +    dt_modules_found =3D efi_arch_check_dt_boot(dir_handle);
>> +#endif
>=20
> So I had asked to add a stub enclosed in such an #ifdef, to avoid the
> #ifdef here. I may be willing to let you keep things as you have them
> now, but I'd like to understand why you've picked that different
> approach despite the prior discussion.

There must be a misunderstanding, your message in the v3 was:

"Every time I see this addition I'm getting puzzled. As a result I'm
afraid I now need to finally ask you to do something about this (and
I'm sorry for doing so only now). There would better be no notion of
DT in x86 code, and there would better also not be a need for
architectures not supporting DT to each supply such a stub. Instead
I think you want to put this stub in xen/common/efi/boot.c, inside a
suitable #ifdef.=E2=80=9D

So I thought you wanted me to remove the stub in x86 (since it doesn=E2=80=
=99t support DT)
and put this call under #ifdef so it won=E2=80=99t be compiled for arch not=
 supporting DT.


>=20
>> +    dir_handle->Close(dir_handle);
>> +
>> +    if ( dt_modules_found < 0 )
>> +        /* efi_arch_check_dt_boot throws some error */
>> +        blexit(L"Error processing boot modules on DT.");
>> +
>> +    /*
>> +     * Check if a proper configuration is provided to start Xen:
>> +     *  - Dom0 specified (minimum required)
>> +     *  - Dom0 and DomU(s) specified
>> +     *  - DomU(s) specified
>> +     */
>=20
> May I suggest to shorten the three bullet points to "At least one
> of Dom0 or DomU(s) specified"?

Sure I will change to:

/* Check if at least one of Dom0 or DomU(s) is specified */

>=20
>> +    if ( !dt_modules_found && !kernel.addr )
>> +        blexit(L"No Dom0 kernel image specified.");
>=20
> And may I also ask to alter the text here, to be less confusing to
> dom0less folks? E.g. "No initial domain kernel specified"?

Yes I will change that.

Cheers,
Luca

>=20
> Jan
>=20


