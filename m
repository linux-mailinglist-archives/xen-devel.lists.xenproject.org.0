Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1F24ED45A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 09:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296686.505087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZorh-0007Vm-Ic; Thu, 31 Mar 2022 07:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296686.505087; Thu, 31 Mar 2022 07:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZorh-0007Sh-FY; Thu, 31 Mar 2022 07:05:05 +0000
Received: by outflank-mailman (input) for mailman id 296686;
 Thu, 31 Mar 2022 07:05:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IJRK=UK=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nZorg-0007Sb-Ko
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 07:05:04 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2d55adf-b0c0-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 09:05:03 +0200 (CEST)
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by DB6PR08MB2661.eurprd08.prod.outlook.com (2603:10a6:6:17::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.19; Thu, 31 Mar
 2022 07:04:50 +0000
Received: from VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::29) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.22 via Frontend
 Transport; Thu, 31 Mar 2022 07:04:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT006.mail.protection.outlook.com (10.152.18.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5123.19 via Frontend Transport; Thu, 31 Mar 2022 07:04:49 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Thu, 31 Mar 2022 07:04:49 +0000
Received: from 0f6ca727c8a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2DB46EC2-C0A1-45C4-BE72-824F6FBAC291.1; 
 Thu, 31 Mar 2022 07:04:42 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f6ca727c8a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 31 Mar 2022 07:04:42 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com (2603:10a6:208:131::12)
 by AM0PR08MB5010.eurprd08.prod.outlook.com (2603:10a6:208:15c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.16; Thu, 31 Mar
 2022 07:04:35 +0000
Received: from AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310]) by AM0PR08MB3956.eurprd08.prod.outlook.com
 ([fe80::a4a1:ded3:2013:b310%7]) with mapi id 15.20.5123.021; Thu, 31 Mar 2022
 07:04:34 +0000
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
X-Inumbo-ID: e2d55adf-b0c0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEZ4+8lCiK5CCg08Xa/aYSvLUSMRRXoOkf5PVqzihkc=;
 b=xkhBkcwdUQarJkVm/gyRHPMnY7T4Vmo2A3XDBytyYsVvkurCr9ZA5ROW/C3TS2bSEHCi4x1tjUDDEs8KRC9KOpynPvK34/egl8HX2KvmxOEN30NQO0uewbAiZTM3OSjEKUWdncfelWn/9W1ulVHn1CzfMvdEJdN40E66i0L1dOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80fe3ccb8f89b375
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2O3cyACIkUzNCf7qLCeKoME031h0FgPGRzuT2crObo1iPZzToE1VCGbppc8iEhxJbhFm4x7UKB8b94HGOowgO5hD3gd6WjqiBrllbS9Li0eyzqMo0zFztiMHDbs/lsDJ7SYLN0PBwLE8ocPvW/XpNs84W4GaiVIHwm6VrjVidnShVxn1VdpjEG2yAFpAUxSMznqxdqmZsTmcVC8aeYEp0kSQexg+srBR0kopOw5Z5pJx/SMtJtEGOIw6fgio4rW7wF8aGFkMNHOnPzv6/54Vu16VNrEA5NPxk2InxpYfxr8Pyd4jJ812Q7Yuicefu0sFPTkGeldsAjVEuUzR6BrHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BEZ4+8lCiK5CCg08Xa/aYSvLUSMRRXoOkf5PVqzihkc=;
 b=mk+EtBYOLijj7jMEHy3HPhceLbUclls3IVwoBj8a91ZUoc5Uh0Tx5c/G0uTsYnS4rtB6fnudnpYFsJHsRKkT82Zbk0Zv7Jf71+WWe5jgnIP3c2VLJjxh0f8Q9oPYKWcJO+Q9G6qZEwd4X65QbF3hylKUmQnanNnasUCLZrFQQsagioCGFkuoPvInFGPg0B8DedzAEy2+LKWiLmYaK2UOZY299LOeyWRr+mFipNEqp2Z49DuPgZslVAit9zHbhPXHGNqqiAOomkvqtZ8tzVrWYv9NmdHvMr+8z0c92zROWLSPK796P8dQOEzn8fPVAhp+bNCL8Br1bSxEb84lc+nt4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BEZ4+8lCiK5CCg08Xa/aYSvLUSMRRXoOkf5PVqzihkc=;
 b=xkhBkcwdUQarJkVm/gyRHPMnY7T4Vmo2A3XDBytyYsVvkurCr9ZA5ROW/C3TS2bSEHCi4x1tjUDDEs8KRC9KOpynPvK34/egl8HX2KvmxOEN30NQO0uewbAiZTM3OSjEKUWdncfelWn/9W1ulVHn1CzfMvdEJdN40E66i0L1dOs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Topic: [PATCH v2] Grab the EFI System Resource Table and check it
Thread-Index: AQHYRHEH4zzX/uDlcEa4/lbFmRQ7HKzZEkOA
Date: Thu, 31 Mar 2022 07:04:34 +0000
Message-ID: <783D6789-9BC6-49BC-8345-478A862083E2@arm.com>
References: <YkS3FthpZU0xQ2Y7@itl-email>
In-Reply-To: <YkS3FthpZU0xQ2Y7@itl-email>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 0a587674-191e-4a07-a1dd-08da12e4bf55
x-ms-traffictypediagnostic:
	AM0PR08MB5010:EE_|VE1EUR03FT006:EE_|DB6PR08MB2661:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB26613F7914EF5815E671C948E4E19@DB6PR08MB2661.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GM0JhKvCoah8cDND8AcsEFM4Q9IkDzgPvdTHa1st0Q5h6bT+SfehPw8eirBEMy3WHS//OidgYV711XQ4QpdGNOq8hI55k6RO8jNlW+KsZ/Heg7qWVWV9Aoe9oTuM+jwIB3CVeNKAtZMriAfEiInlc0ht6SGGbvMqWX3FT59UUFe5qyYkhRv0Nq8S8z/dSmFkBL1XS9XkVQT1V8vrHtcAT9qgB360HRmxxzhjQU/NNpB69No1O1UtS/KplCzaIOKAtTmNISDXTcw20vbf22UKvNyIZRqvr+QybjoPwmWNAOXbfqjK8CIi+poxUfYWgrUEddTY4Uwnl2g1wKpRkAlc/7rKWtTxlRVrn1k3i8LuyYpG8iGPFyFipJ2/8K8cHI/GjwkqsaRF66SpuZ/dEWxwtmjribFEOUZHPDWnK/41dBi4r80hTvDwMAkoPEht6PogNs1zJE8fiH8+png5m/K72iT3z4CxD1QgEozyhXiQoouKJK0eEgFpUfjdudFaXlvVj8Hmk3wbuSC43zo3EP8yLdkX8dcXB3VDhCruswUmyCBfGYgLRa5US70kUq+Zp0U2enI0Q7NwyY14Qovl9V89aUsejAow/GWZDqxEmQD1OpX3jI4r5T8AEsjEMTitwPV4GZ3z6YbEyLdNN0SEl2mRBkNrUg1bKb8gOs16V18kQMvCepi0BmhdABgxxe+ebdTlJ5EamYVxH48+NnXazkjnC4xLzO5K6pFx5WO++YY6NOhsNPXgNHlxc37gj9eo8Qq1vOv0S9OVtUhdSjIDM521V5lFx1oFC9Ema2ezlRHbNkU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3956.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(66556008)(66476007)(66446008)(76116006)(508600001)(2906002)(83380400001)(122000001)(36756003)(33656002)(6506007)(6486002)(38070700005)(91956017)(71200400001)(64756008)(6512007)(86362001)(5660300002)(8936002)(6916009)(316002)(26005)(2616005)(186003)(38100700002)(8676002)(4326008)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1BDF7C42EA496541BB3E961CF5A87FB0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5010
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4edab304-4ad9-4cf5-9126-08da12e4b663
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AjPLtZbfxpVlYmH6gGj26HfFmpf4Q/f3E4HDJBqCW7D1JU1FqnXaKuaTV/0mo0O+YYQK+Rj6vhd8+AhVi5M/8WBfSQedlugqH3CMYqAuqrUiW7Jl+ccZXl2VcYZvPJMNI10mfBlcjqxdOkqSRACZ9ASyHUCSujMIuXlQeGlvrd2G75TWOrZCt/cvYRLP0XWQX3S/Pum39qEVzUUoP7I49DRKV9V8U8skExAj5YJQdpmEs2Qxh18q1etfHzts6kyZ5x5fVk+AZhXFyvUuO0Ehnu0G6V7YVxyPoRVMXeTMBQbUw7IVgbNKosps8/lSmspF0NRDcrmqhG5CRp5Vpf2hRw1wUttBI95mW2AxkMNOcKrKGBz3Tzub5ams/uTdsBCi7ZjWhvSSw7xwjZmsns3QeyFAjCxANOPxWdUdtwYOorLm3oDXw2x9ebpyB3MkQSyUMRYqvi1GMtbD5BEOOH0rHFvZ1LJbFvUDUyuRwPXjjUwxyPDex8oiu6qYZeOIlRP5fobE9YImn+4xSX++ewNa8Z7ZAH6GuNm7B6NwM5IXSFu9w3qICyOJpN3Ve0hKkb5Nmt6zgd2a/bOEW114Idf+0hULFAbN5SiRCq9nBd1S7VM+JEwli6kKHdklDDc8HJG/pwmenhl7jkv/8c9+gE2y/oOc4b3HHyEtQDq/ocfF6NLRtk39BRHvhwf+rm9EEI7N
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(86362001)(4326008)(8676002)(6862004)(82310400004)(508600001)(6512007)(6506007)(2906002)(2616005)(47076005)(6486002)(36860700001)(5660300002)(40460700003)(4744005)(8936002)(33656002)(36756003)(81166007)(83380400001)(336012)(316002)(70586007)(26005)(70206006)(186003)(356005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 07:04:49.7156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a587674-191e-4a07-a1dd-08da12e4bf55
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2661

Hi,

>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index 458cfbbed4..398a2411a1 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -187,7 +187,8 @@ static bool __init meminfo_add_bank(struct meminfo *m=
em,
>=20
> static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCR=
IPTOR *map,
>                                                 UINTN mmap_size,
> -                                                UINTN desc_size)
> +                                                UINTN desc_size,
> +                                                const EFI_MEMORY_DESCRIP=
TOR *const esrt_desc)
> {
>     int Index;
>     EFI_MEMORY_DESCRIPTOR *desc_ptr =3D map;
> @@ -199,6 +200,7 @@ static EFI_STATUS __init efi_process_memory_map_booti=
nfo(EFI_MEMORY_DESCRIPTOR *
>               desc_ptr->Type =3D=3D EfiLoaderCode ||
>               desc_ptr->Type =3D=3D EfiLoaderData ||
>               (!map_bs &&
> +               desc !=3D esrt_desc &&

I was going to test it but this line is breaking arm build.

>                (desc_ptr->Type =3D=3D EfiBootServicesCode ||
>                 desc_ptr->Type =3D=3D EfiBootServicesData))) )
>         {
>=20

I see CC list is pretty small, did you forget to add the maintainers?

Cheers,
Luca


