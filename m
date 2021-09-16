Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB9D40D920
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 13:56:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188411.337562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpyp-0003Pp-9q; Thu, 16 Sep 2021 11:55:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188411.337562; Thu, 16 Sep 2021 11:55:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpyp-0003Na-6o; Thu, 16 Sep 2021 11:55:03 +0000
Received: by outflank-mailman (input) for mailman id 188411;
 Thu, 16 Sep 2021 11:55:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6Su=OG=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQpyn-0003NU-8n
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 11:55:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a6cb9572-571e-4d1a-8210-0b4933dacf1d;
 Thu, 16 Sep 2021 11:54:58 +0000 (UTC)
Received: from AS9PR06CA0143.eurprd06.prod.outlook.com (2603:10a6:20b:467::20)
 by AM6PR08MB4552.eurprd08.prod.outlook.com (2603:10a6:20b:74::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Thu, 16 Sep
 2021 11:54:56 +0000
Received: from AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:467:cafe::81) by AS9PR06CA0143.outlook.office365.com
 (2603:10a6:20b:467::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 16 Sep 2021 11:54:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT063.mail.protection.outlook.com (10.152.16.226) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:54:55 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Thu, 16 Sep 2021 11:54:55 +0000
Received: from 79778860baef.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A42A6A28-D233-4654-AF6A-90915DFE4396.1; 
 Thu, 16 Sep 2021 11:54:49 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 79778860baef.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 11:54:49 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6351.eurprd08.prod.outlook.com (2603:10a6:102:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 16 Sep
 2021 11:54:47 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 11:54:47 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:150::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:54:46 +0000
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
X-Inumbo-ID: a6cb9572-571e-4d1a-8210-0b4933dacf1d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg8PSPow3GWgGjEDcT49TQmyivCXN7jE+azps/yvcoU=;
 b=zojZ7aF2xG42AAp4gPfBIBpCfOyTDoSxZfcxwWXO3kemkjw0c5LJS0J37ye+HttiPIVcbS0LYQ3mBq1AxUaaH9xd2wPIwycsbC0NOy2NdLddtLGlrg8ovNQEnU8ubLN+r7PoqVcPqG1nxix5ApeZ3ulMlZpEV+eC31+PRpwEW3k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2586700339fbf282
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KR5MHA6nxCAAkvMQ4wj0AFcjtaGwcIgt+Bwj57gGQvF9SSz7F6m2OABFIqAp4bbqd6GecN2Bs+Zn8xK0sZnrXTd5ZLDXmYKGBg1KhebQgFwfMgGu+rHGe54UxT/PZQw5NGP1ogIXnfBya+m+c8llgJgZnfDfhkWsBa+rBFzTpup2WYeSt9HNC65iPSG7vSOn5qciJxjnFhD6sXiFS3EIcCRajEPQ4iXSBYTKL2jG+hYnhzHZZTWVbSGgbq06Agv4KCnHRuS/JXSFBzeHC2XpKQbwRawCmn1euS6Do6CUX6GkPYe66QedjJ2I+nyhBsFJRmy1jxVz4L5NHPBMs6C5FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hg8PSPow3GWgGjEDcT49TQmyivCXN7jE+azps/yvcoU=;
 b=AOF4tJZ4HQOVdrtlGOExbH29Iyv1iRtb30fmw2eoZniW7uVGFO31MXJasHDwN3HTaovewKdTXpriEOX3zB9Nb+6PfJsDidVeYH8avOL9BKszWDT7rGZHR1EvjBhfDJPUAcKJ/c18wMwi0PYgM5rlrzv9Spe4r/nJZtRAL5X6L2FWSa3+2pN2GQlq6m7e9rLaNy9a9BoNPu2zo7SWxV9crZ1WQz7faMwm9OY7HJ0o932ga8yic5gdx/KdaB9nRVEEunnk8WlL5/9nkqY1j9qsJK6CMXcIiIrtlnwW/JVMJTCJx3J/jHXXwdABMFKaGUR6TiEYB3rH9097wjQQ1LtnrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hg8PSPow3GWgGjEDcT49TQmyivCXN7jE+azps/yvcoU=;
 b=zojZ7aF2xG42AAp4gPfBIBpCfOyTDoSxZfcxwWXO3kemkjw0c5LJS0J37ye+HttiPIVcbS0LYQ3mBq1AxUaaH9xd2wPIwycsbC0NOy2NdLddtLGlrg8ovNQEnU8ubLN+r7PoqVcPqG1nxix5ApeZ3ulMlZpEV+eC31+PRpwEW3k=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 1/2] xen/efi: Restrict check for DT boot modules on EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2109151445080.21985@sstabellini-ThinkPad-T480s>
Date: Thu, 16 Sep 2021 12:54:39 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 jbeulich@suse.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <3C00EB19-5513-4C1D-8F8D-B8CF5D4A302A@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-2-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2109151445080.21985@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::6) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b0fe7dc-6e08-4f72-2643-08d97908cd43
X-MS-TrafficTypeDiagnostic: PAXPR08MB6351:|AM6PR08MB4552:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB455288925C415964877F0ACEE4DC9@AM6PR08MB4552.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 H2FYtMdwaceOZi/sY7QxD3cbSnDBlaa0TH4sq7Y50mb2S417OHXkJPs3zXLgWSEDf5bK+lTEFkq/VGWsR9zRvxndIziVr+C9iePmNxWJFAn5aI4a9wiXQUB1+7weExfeIj9FFBNYJ471EAV9TJO1w2PUrgk1EuEp0OwKYsJzOUy5tWDbYl+8iTE5mNObuW7WWNTXNTWjF7a1X+qlFvlwxrhqtvF16aALUf9Llxof6aY6q5fPb61Qu4+jH62ZUksYX0aRXuZSk/aycj8DDKzYSkZKppsvEisk3jJOpWd73wQxtsV44ssA/lEh8KwitWD6lm/DUHLY4M942My9bclmXvZHH/jegTI9fh4ZGxxAzcDgekvHjNYBjpHvTmRObb/W9AGmCZpHMPYYGb1wULglhMd8vTh4aytdkKMB+FaGBBNiDa8Q8zZzeAodE1DKhJWRYicaOtfGFlgaeIitHhns9q6QR9CMnlS0dT88NPT2CU6Eo10nZkMuOL1cQIIwnupBFH5sIH+fApN+HenXk90OZWfl3n1Om9tumghMdo7d5aWiUX0z12+S0eLTsT4qOrq9Wjpk+3MFwNq9kxV6VLVBMu7KusXFlgwBdV2LowSpnVmnp0yXfkyRz31cda2aYupvg2XO61JS4Qvf0U00QLf39dRJ7q7lnrE0ZGIIEt3q4vJMRDD5IyfySKUelTdHH52VmhC/gQRgLQ+qOs4GejRhfC13d8atiQP88iSgRoISkWw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(366004)(39860400002)(6512007)(4326008)(26005)(52116002)(6486002)(478600001)(186003)(38100700002)(86362001)(66556008)(66476007)(38350700002)(53546011)(6666004)(6506007)(33656002)(956004)(66946007)(2616005)(44832011)(8676002)(6916009)(8936002)(54906003)(36756003)(83380400001)(5660300002)(2906002)(316002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6351
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db53daf6-55ca-4762-6866-08d97908c7ac
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9oECS5R5BjPl2P8CrjyZfrVVdoDFskeP4Z36GQDvyqx5OSpKbGL+5JMR7ChAodaGzTiI3THj0Gm9HkX1d0tUYdndMhFueCbOb9ugYoxWT+7J5Hbils2TS4HW+5ObJh5z6RPeu8v4DIA/9SwKPDzH+Ll7gzMehaie2h/rQFmuyUkIwknpiwF/U0meocY+zoOfHEQrzzDxBrQrmllRe/Jd2nEhu3wX1fRS+37KfYaTD4GRwQ/QH1uR7bAJIvQHe9LZT7Gdh3IlbU7lMc+8kQyluKtGQRVPnZHc2NK9oDWBfqV8BEue12KDCqj+8vCKGPm41/PJ2iM5uIzd7KmPdFMqo6xHUpStDcN8A4+t7m5oBq1UfM7PmcDtfJNYqJLJz/FwdpgZ+bMstLfUMGx76j6EI/8RTO78FrLwc5taPgxTGixnDt20p59fZXMWMBDfBYLio5jntg3n23Tnaj8x7qEDiuul7hSKZyd6arEWSqdWsThZ3+ue5OID8aUB5Dz/clsxN4MbL+nCaQQDlLb1pOqNjKhdvYOHvRls2bPcRhdgtkcnKa0+jpaEZKghl4PDSqysMwHLMRRzhu33HfObXQzI8Z6LQ564ytOwFKKw/Mp55IgIP835FFiFYlChNQ5OgyZHrWdo0UCfW9pf9kCnn8USUyZmU8b6BcC8Xg6f+zmQs8hJaGd0iHlDccMv3Q/xUQ/Zmq1W1wDxCeyZKahUvyV3tQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(36840700001)(46966006)(6862004)(33656002)(82310400003)(54906003)(336012)(83380400001)(36860700001)(2616005)(8936002)(44832011)(81166007)(2906002)(956004)(356005)(4326008)(5660300002)(8676002)(107886003)(26005)(186003)(6666004)(6512007)(6506007)(53546011)(478600001)(82740400003)(70586007)(70206006)(6486002)(316002)(36756003)(47076005)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:54:55.9255
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b0fe7dc-6e08-4f72-2643-08d97908cd43
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4552



> On 16 Sep 2021, at 01:16, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Adding Jan for an opinion on the EFI common code changes. See below.
>=20
>=20
> On Wed, 15 Sep 2021, Luca Fancellu wrote:
>> When Xen is started as EFI application, it is checking
>> the presence of multiboot,module in the DT, if any is
>> found, the configuration file is skipped.
>> Restrict this check to just any multiboot,module that
>> is a direct child of the /chosen node.
>>=20
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> xen/arch/arm/efi/efi-boot.h | 30 ++++++++++++++++++++++++++++--
>> 1 file changed, 28 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index cf9c37153f..5ff626c6a0 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -581,6 +581,8 @@ static void __init efi_arch_load_addr_check(EFI_LOAD=
ED_IMAGE *loaded_image)
>>=20
>> static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTabl=
e)
>> {
>> +    int node;
>> +    bool dom0_module_found =3D false;
>>     /*
>>      * For arm, we may get a device tree from GRUB (or other bootloader)
>>      * that contains modules that have already been loaded into memory. =
 In
>> @@ -592,11 +594,35 @@ static bool __init efi_arch_use_config_file(EFI_SY=
STEM_TABLE *SystemTable)
>>     fdt =3D lookup_fdt_config_table(SystemTable);
>>     dtbfile.ptr =3D fdt;
>>     dtbfile.need_to_free =3D false; /* Config table memory can't be free=
d. */
>> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,modul=
e") < 0 )
>> +
>> +    /* Locate chosen node */
>> +    node =3D fdt_subnode_offset(fdt, 0, "chosen");
>> +
>> +    /* Cycle through every node inside chosen having multiboot,module *=
/
>> +    do {
>> +        int depth =3D 0;
>> +        node =3D fdt_node_offset_by_compatible(fdt, node, "multiboot,mo=
dule");
>> +        /*
>> +         * If the multiboot,module just found is placed at depth less t=
han 3,
>> +         * it means that it is here: /chosen/<module> so it is a module=
 to
>> +         * start dom0. (root is counted as 0)
>> +         */
>> +        if ( node > 0 )
>> +        {
>> +            depth =3D fdt_node_depth(fdt, node);
>> +            if ( (depth >=3D 0) && (depth < 3) )
>> +            {
>> +                dom0_module_found =3D true;
>> +                break;
>> +            }
>> +        }
>> +    } while(node > 0);
>=20
> It should be possible to enable the uefi,binary bootflow for Dom0 and
> the Dom0 ramdisk too. It would be nice as we could have a 100% UEFI
> boot, not dependent on U-Boot, both Dom0 and Dom0less, without the
> xen.cfg file. It doesn't have to be done now by this series, but it
> should be possible from a device tree bindings perspective.
>=20
> With that in mind, is this check accurate? This patch is saying that if
> Dom0 is not present in the device tree, then load xen.cfg. But what if
> it is a true dom0less configuration? Then we would have no dom0, only
> dom0less VMs, and we might still not want to load xen.cfg. True dom0less
> is another one of those configurations that don't have to be enabled now
> by this series but they should be possible from a device tree bindings
> perspective.
>=20
>=20
> I tried to think of ways to improve this check, for instance searching
> for a module that doesn't have "uefi,binary" but has the regular "reg"
> property. If there is one, then we could skip loading xen.cfg. But that
> doesn't work if we have a UEFI-only true dom0less configuration.
>=20
> So I am thinking that we have no choice but introducing a new property
> to tell us whether we should or should not load xen.cfg when
> multiboot,modules are present.
>=20
> Taking inspiration from HyperLaunch, it could be a new node:
>=20
> chosen {
>    cfg {
>        compatible =3D "xen,uefi-config", "multiboot,module";
>        uefi,binary =3D "xen.cfg";
>    };
> };
>=20
> In efi_arch_use_config_file we would check if there are any nodes
> compatible with "multiboot,module". If there are none, it returns true.
>=20
> If there are any, and one of them is also compatible "xen,uefi-config",
> then efi_arch_use_config_file returns true and also the specified
> configuration filename.
>=20
> If there are nodes compatible to "multiboot,module" but none of them is
> compatible to "module,uefi-config", then efi_arch_use_config_file
> returns false. We use the device tree only.
>=20
> I think that would be clearer and more consistent from a specification
> perspective, but it requires one change in common code:
> efi_arch_use_config_file would not just return bool but it would also
> return a filename if found (it could be a pointer parameter to the
> function).
>=20
>=20
> Otherwise, we could add a simple property like the following, without a
> specific value and without a filename:
>=20
> chosen {
>    xen,uefi-config;
> };
>=20
> The presence of xen,uefi-config could mean that Xen should go through
> the usual guessing game to figure out the right cfg file to load. This
> would not require any common code changes because
> efi_arch_use_config_file could simply return bool as it does today.
>=20
> My preference is the xen,uefi-config compatible node, but I think the
> property would also work.
>=20
>=20
> Jan, do you have an opinion on whether efi_arch_use_config_file has to
> stay as it is today, or would you be open to the possibility of making
> efi_arch_use_config_file return a filename too?

Hi Stefano,

True dom0less is a configuration that this serie enables: if there is no do=
m0 kernel
specified in the xen.cfg then only the domUs will be loaded and started.

The following cases are valid:
1) start only dom0 [dom0 modules in xen.cfg or embedded in Xen image]
2) start only domUs, true dom0less [no dom0 modules in xen.cfg and inside X=
en image, domUs on DT]
3) start dom0 and domUs [(dom0 modules in xen.cfg or inside Xen image) and =
domUs on DT]

I don=E2=80=99t understand why we want to add new properties to avoid/not a=
void to read the xen.cfg, am I missing
something?

Cheers,
Luca


