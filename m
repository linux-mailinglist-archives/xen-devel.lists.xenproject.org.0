Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C20494463D3
	for <lists+xen-devel@lfdr.de>; Fri,  5 Nov 2021 14:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.222315.384445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miywO-0008QN-Ml; Fri, 05 Nov 2021 13:07:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 222315.384445; Fri, 05 Nov 2021 13:07:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miywO-0008Oa-Jd; Fri, 05 Nov 2021 13:07:32 +0000
Received: by outflank-mailman (input) for mailman id 222315;
 Fri, 05 Nov 2021 13:07:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ym5/=PY=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1miywM-0008OU-Ps
 for xen-devel@lists.xenproject.org; Fri, 05 Nov 2021 13:07:30 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0604.outbound.protection.outlook.com
 [2a01:111:f400:fe07::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53bf9326-3e39-11ec-9787-a32c541c8605;
 Fri, 05 Nov 2021 14:07:29 +0100 (CET)
Received: from AM7PR03CA0008.eurprd03.prod.outlook.com (2603:10a6:20b:130::18)
 by AM8PR08MB5716.eurprd08.prod.outlook.com (2603:10a6:20b:1d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 13:07:26 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::f4) by AM7PR03CA0008.outlook.office365.com
 (2603:10a6:20b:130::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Fri, 5 Nov 2021 13:07:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Fri, 5 Nov 2021 13:07:25 +0000
Received: ("Tessian outbound 4ce13939bd4a:v108");
 Fri, 05 Nov 2021 13:07:25 +0000
Received: from 039a31f5c704.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3718586-D033-45C6-B6BA-5C10F0F1DE14.1; 
 Fri, 05 Nov 2021 13:07:13 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 039a31f5c704.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 05 Nov 2021 13:07:13 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB6045.eurprd08.prod.outlook.com (2603:10a6:102:ef::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10; Fri, 5 Nov
 2021 13:07:11 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Fri, 5 Nov 2021
 13:07:11 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:190::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 13:07:10 +0000
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
X-Inumbo-ID: 53bf9326-3e39-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhDtJbfn4DvtUyAyZ93g4S+X0I+6c+d11iSdcoIXeSQ=;
 b=8sTw7kSAQyVe3DqroZco99jTAG4lusB69KjGma68tuXYXvh7e2tDc9sS9pybvvLp6LWV7y0I1j/vVxipYOoXP2UHJhMheWsaKOejF5uFYhlAstFcbmIVBXh1WCh+UF3ohhJ5l1KXAxZaERm/jn3omcaY2jN4vklYwa3u8p9rikc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1ccf9cf93073682a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaODJGSMSGnu/pga5TcXR8CQ37eH+PP+4E7mhappLvUzrRiSefl9+PNRE3Q1oKvBi5VX1eu7Or/P0WJbvSA99dNxEx3YSHB181HkcABsrj5RTJ3+c3dSosW7/amVFkRVIKdY+em3kdHHHBm1AlVVZhdsa25Ht0Pwisr9SVHHu39ZXWua7hjOx+ALhYqpzhvinF9g4tIElLFDbtnVX+r9y2H+XU2Bk8HdEs4KdhfaU1uSNTLGnPh24mY2tUoro2HnZbQRaOkqnelEB1yrNt2paQk00RcmHjzptiq93f0R+6a+4hplsi7p9KS0vG6QwAGeDweLTbt3B+qm7MWTW/WmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZhDtJbfn4DvtUyAyZ93g4S+X0I+6c+d11iSdcoIXeSQ=;
 b=SAM04hFCKUgDv6PHZtA+Gk5WFryfY5s27S4AMZohHU/lOW8BsAo+M6fYr6WupTjDQ9jLB1+cLt8BxtoU8LZY0n3x0mamybF2diWcHymYAE/X5FmvZRI2cgdcddqzbRVYQV9w9PvfaqAOtPbqVriDRI6BiCh9I+n9nzW4MdWW8dJ/AI4y13JbpUTTKjcjA6xhQe9QHbZMJWjuN6CfEjezhMg5z1DyedXRlhq6THsohPIjEwgyUtf3VWF21/PGGLONZSZsIY6QRnO4Z1D8dEtHf3th4oDAeuMMGSrhu5qxMxqWWvzdOD1DV3ARdMQzZ7+WW+COVlb8kdoci/hk4ASfDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZhDtJbfn4DvtUyAyZ93g4S+X0I+6c+d11iSdcoIXeSQ=;
 b=8sTw7kSAQyVe3DqroZco99jTAG4lusB69KjGma68tuXYXvh7e2tDc9sS9pybvvLp6LWV7y0I1j/vVxipYOoXP2UHJhMheWsaKOejF5uFYhlAstFcbmIVBXh1WCh+UF3ohhJ5l1KXAxZaERm/jn3omcaY2jN4vklYwa3u8p9rikc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH-4.16 v3] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <e10f21db-3533-3c72-b3d7-7857f2f28160@suse.com>
Date: Fri, 5 Nov 2021 13:07:04 +0000
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9750169B-A2CA-40A8-81AD-55365C15FA0E@arm.com>
References: <20211105112148.48719-1-luca.fancellu@arm.com>
 <e10f21db-3533-3c72-b3d7-7857f2f28160@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0080.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:190::13) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b659dd9-12f1-475f-7c3f-08d9a05d368c
X-MS-TrafficTypeDiagnostic: PA4PR08MB6045:|AM8PR08MB5716:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5716A181AC8A95BA3F43C120E48E9@AM8PR08MB5716.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:451;OLM:451;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 onW1v8Kq7l4/O9i0EcfyIhZDyU4BxxavqWS7DIyvqlgWsHRSMbaVO6OVcKKxnj34X0mP+QN4Te9vY1bSDhMCERee6ueYbkb7Ll3hhJcRjs14yC58JQ4pkKvhfM5/iu8IBM/MN5yMFH99MQUSqNkPjPlnMMk07Hz88FzAjGvZCGVntSmD8eccp+5F8Bj3CO88cSoof2SQsHCVRYiX6Vi11Yzb02OPFz0MuLsmq5lu9D/zSZELj0NSzvDJjh2y8cPeBFKARx5Y57AwL/ikFfzCGVoVUCce0FZuzaUQ7AauH2rVTOwap92qZrSeuFIwL0l1S4SCRtpK+oobcYvW1uCw2GR2GcFxd0c5KLuE35kI+B3utdO4ziv8udYqeKxTifmJ3Fso8Pfjk/UhHKG1Own/L3BStdcg2NImO0SthY5rwn1g1itm0/72rWfauHIFL4begKSQH7Hde7gIjI6lfe34TL3rdaTxwrXxhvEvagUOYfJ5FIlj6GXKLLJDCxmRJu0FmRnUq97n3Vsf++/Cj/240sAkD5K9qEgHFO7b2Qu5ywZED9n68/TC2PCUPDRw0wDZWKnH+smeeg3ILjF3TO+rLVbPSXH3KRtzfL3fWA0u4hYTBcDLFLT27UipCEGCEySBm+MHDzLyXCJ7Ys+60E5+SKHcX2Ps+A7rZR3YmrdM0WqDGHiaj7O7uuLSlFgAhjf1zTNXHoNL0nljtfjhjcHj1sH9AGEUt2FHTzA3wT/Teiw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38350700002)(186003)(6486002)(6512007)(86362001)(6916009)(2906002)(83380400001)(26005)(53546011)(66556008)(6506007)(36756003)(66476007)(66946007)(8936002)(38100700002)(316002)(4326008)(2616005)(6666004)(956004)(33656002)(44832011)(8676002)(5660300002)(508600001)(52116002)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6045
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7d7f9002-720b-4ea8-b7aa-08d9a05d2de5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q1qKwoBe2wWFWni+XCU6N2MeT7246uep4HzTKL70/w0ToHlRCTxlawTR/08q0FI+tPDnk/wNP8pM/0Bt69UAtqRaSntL2AxkXzfK8Md2aWcAbqamn+qHi113aqKNegC4k8VyxI6yDjJKRZKbatBn2zYrkCkzTQpcHGMYxLQlw1hnztHup6G501N/oFIbQNJSpYSk4K8uzom3CvkFePML42/dNzTgizi1F8YmIKDseKZlZXHw9xDJXQpBOjw971LVsBvlAIhTR89cXSuEPJqutBlLUreL7mJjm474lmRT13+6o6WOR3SNlqVKWisyoLS8rDpvb8mSXIb4/4ehUZUeZR3900fJDEWhK25I/coj1altdFluzASNuvD09Kl1abtfh96FSzyKwBLomJWc8CnAgcx0BgeQNHmyb7g328roi7JP5r9UYMZCfc/Zxlvou4t7cUwtWiyb9gcOY5WxkdosB+RSa36oYAbMGje9FbvCJOF4KB2lWP5qpLZuTytU2ndNFq8in046hj4JTxcveH6kXWjyEgzdNUJ9gq2+8GVU3RaCXUR0TtzdgzTJVTBXJ7TiFWNYQJ2/ipbKAO3mY/TNirNqHDxAp2ID8H2OZpSqZNILO8+t/5QDAU//XSsicx98NSbchMvYpfLhmxb7pe9byKEkZvO7F4v+DFAvHeqGQilxu8+DNinEfK1+dj/mWOBHAKssxvau/6q+Jq9vXcAqNQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(26005)(6666004)(83380400001)(81166007)(36756003)(8936002)(33656002)(356005)(4326008)(6862004)(54906003)(6506007)(82310400003)(316002)(6486002)(70206006)(70586007)(53546011)(47076005)(6512007)(86362001)(44832011)(186003)(36860700001)(956004)(508600001)(8676002)(2616005)(336012)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 13:07:25.6185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b659dd9-12f1-475f-7c3f-08d9a05d368c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5716



> On 5 Nov 2021, at 12:20, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 05.11.2021 12:21, Luca Fancellu wrote:
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -121,6 +121,8 @@ static char *get_value(const struct file *cfg, const=
 char *section,
>> static char *split_string(char *s);
>> static CHAR16 *s2w(union string *str);
>> static char *w2s(const union string *str);
>> +static EFI_FILE_HANDLE get_parent_handle(EFI_LOADED_IMAGE *loaded_image=
,
>> +                                         CHAR16 **leaf);
>> static bool read_file(EFI_FILE_HANDLE dir_handle, CHAR16 *name,
>>                       struct file *file, const char *options);
>> static bool read_section(const EFI_LOADED_IMAGE *image, const CHAR16 *na=
me,
>> @@ -167,7 +169,7 @@ static void __init PrintErr(const CHAR16 *s)
>> }
>>=20
>> #ifndef CONFIG_HAS_DEVICE_TREE
>> -static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>> +static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
>> {
>>     return 0;
>> }
>> @@ -1225,9 +1227,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>=20
>>     efi_arch_relocate_image(0);
>>=20
>> -    /* Get the file system interface. */
>> -    dir_handle =3D get_parent_handle(loaded_image, &file_name);
>> -
>>     if ( use_cfg_file )
>>     {
>>         UINTN depth, cols, rows, size;
>=20
> With the dir_handle declaration also moved back here (as I did
> indicated in reply to Stefano's proposal), ...

Ops.. sorry forgot that, will fix it

>=20
>> @@ -1240,6 +1239,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>=20
>>         gop =3D efi_get_gop();
>>=20
>> +        /* Get the file system interface. */
>> +        dir_handle =3D get_parent_handle(loaded_image, &file_name);
>> +
>>         /* Read and parse the config file. */
>>         if ( read_section(loaded_image, L"config", &cfg, NULL) )
>>             PrintStr(L"Using builtin config file\r\n");
>> @@ -1362,14 +1364,14 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
LE *SystemTable)
>>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>>         cfg.addr =3D 0;
>>=20
>> +        dir_handle->Close(dir_handle);
>> +
>>         if ( gop && !base_video )
>>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>>     }
>>=20
>>     /* Get the number of boot modules specified on the DT or an error (<=
0) */
>> -    dt_modules_found =3D efi_check_dt_boot(dir_handle);
>> -
>> -    dir_handle->Close(dir_handle);
>> +    dt_modules_found =3D efi_check_dt_boot(loaded_image);
>>=20
>>     if ( dt_modules_found < 0 )
>>         /* efi_check_dt_boot throws some error */
>>=20
>=20
> ... all of the quoted part
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thank you for your time, will push very soon v4=20

>=20
> Down the road we will want to constify efi_check_dt_boot()'s parameter,
> but that will require changes elsewhere as well.
>=20
> Jan
>=20


