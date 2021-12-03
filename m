Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DE467B0D
	for <lists+xen-devel@lfdr.de>; Fri,  3 Dec 2021 17:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.237822.412464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB9t-00072P-Ns; Fri, 03 Dec 2021 16:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 237822.412464; Fri, 03 Dec 2021 16:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mtB9t-0006z1-KB; Fri, 03 Dec 2021 16:11:37 +0000
Received: by outflank-mailman (input) for mailman id 237822;
 Fri, 03 Dec 2021 16:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sOtX=QU=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1mtB9s-0005Mw-IN
 for xen-devel@lists.xenproject.org; Fri, 03 Dec 2021 16:11:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id afab47dd-5453-11ec-b1df-f38ee3fbfdf7;
 Fri, 03 Dec 2021 17:11:35 +0100 (CET)
Received: from AM5P194CA0024.EURP194.PROD.OUTLOOK.COM (2603:10a6:203:8f::34)
 by PAXPR08MB7490.eurprd08.prod.outlook.com (2603:10a6:102:2b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.28; Fri, 3 Dec
 2021 16:11:32 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:8f:cafe::41) by AM5P194CA0024.outlook.office365.com
 (2603:10a6:203:8f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14 via Frontend
 Transport; Fri, 3 Dec 2021 16:11:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Fri, 3 Dec 2021 16:11:32 +0000
Received: ("Tessian outbound c61f076cbd30:v110");
 Fri, 03 Dec 2021 16:11:32 +0000
Received: from 18801550ae52.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9422E206-035F-41FD-B36E-3728AEE7DAB6.1; 
 Fri, 03 Dec 2021 16:11:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18801550ae52.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 03 Dec 2021 16:11:15 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5802.eurprd08.prod.outlook.com (2603:10a6:102:8a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Fri, 3 Dec
 2021 16:11:14 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::1d24:822b:651c:5eeb%6]) with mapi id 15.20.4690.034; Fri, 3 Dec 2021
 16:11:14 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.14 via Frontend Transport; Fri, 3 Dec 2021 16:11:13 +0000
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
X-Inumbo-ID: afab47dd-5453-11ec-b1df-f38ee3fbfdf7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH3HvH4aM5H9UhOvfuZBtBMWLykdiyXiuBdAVWV3zSw=;
 b=YgBp+qhKJmhvBY2/v7LGaad31g7ARAS454CrENEBtdc/ieePv1d9AhBkVVQEBdabe36sqs77iEvy+6OSoXDAlilFUfAetaYz69Ht4Z+C1IQt4md14oRxGG6qNHf/I133222hUPbj05WetSrJetOF2bKBKgou2MB2AFCMs779AY4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8c5aa8ac2abbc702
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAz1qZ8m9e8VCaM2aJpyDvDiAp0NibZ290K3JKjS4FtMutfU/r5lRoUZlK1y1mOZOXNX80jMX2d3KlB+1fMmv3g+wQ4XBMgtMpghfCU9I8VMl7UPYJ01vkdJAzQ7EWt5DdjQRvatAuOED9Dmzex+evHWpDWCINAUG5erJimrVupZw8X40GMZ6hyQuSYF8kkt9Bj24+Kr4tqI7QkvS4fyY0gdD4kCk9Ik7+OqA3FSrMgjE1QN2Qr2eZOaS5kcBF2PaG3SMEHTuMf4boRl4xNtxgQArdC3fhClcVTWH3HyGbbs1t1ZgY8C3NZW/xPDpWIVEEyswph20XnJSbv7CAi5+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH3HvH4aM5H9UhOvfuZBtBMWLykdiyXiuBdAVWV3zSw=;
 b=IK/IsRNuTTzIR6IeD06r/c7sTYZdK27WOCVR9bD3KOe2QdmU+P65Vzs7GJnoBwSuHvR2dbZf/+1wWbN9Hr5jWULlONW4/b+qHyXI1980n+IeXb4D5hBlBzR7jZArqwk2dvUt/IDeCRYjx8+NmtWXrS9P2f/v6Cu3Z4zcNsbvh0qfJSZfkhY/tufW+UxIPKYu0ArlTzgPwH3J+Yz3oj1spPRf5rVHnHL/PLgGxYUD0zGhUHs5bhjd+cSD2/euT3LpigfHa/zuROgeo11+U+QcOX1CpAe7ZxJ/izhe93W4dSe11EZAUgPsF2VsphHh8NqsnhNIp6PNELlhGQy+f5ydjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH3HvH4aM5H9UhOvfuZBtBMWLykdiyXiuBdAVWV3zSw=;
 b=YgBp+qhKJmhvBY2/v7LGaad31g7ARAS454CrENEBtdc/ieePv1d9AhBkVVQEBdabe36sqs77iEvy+6OSoXDAlilFUfAetaYz69Ht4Z+C1IQt4md14oRxGG6qNHf/I133222hUPbj05WetSrJetOF2bKBKgou2MB2AFCMs779AY4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 2/3] EFI: constify EFI_LOADED_IMAGE * function parameters
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
Date: Fri, 3 Dec 2021 16:11:13 +0000
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <5F73AA67-25D3-4E19-BE27-43B3DF4CF184@arm.com>
References: <46de3a57-76d0-1538-ec3b-79290d1bfb70@suse.com>
 <d9664972-b0b8-605c-403d-4e2340442cae@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO2P265CA0030.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::18) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93671c50-dc06-450d-08fe-08d9b6779289
X-MS-TrafficTypeDiagnostic: PR3PR08MB5802:|PAXPR08MB7490:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB74903C1E9BAF329AD1A944D0E46A9@PAXPR08MB7490.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5BErYuuBVVGN87lPUavA8m7lnJljAQOF5kK+uPhEvbtabkxawfdfsTj8vmV2ztpC6V6Wwny5aK6GSM5CQhAVYuy1ayA0DYHn+NGY45JtohUHqT8ldagS+wdeSg0mZ1Hf0/imKG+4ajpWedt/T7Da7IlYtGWqJJekdZy48ab/VIkN8VzKBh57JepCi1yZx5HjiFTKFoAb81EkaqPpTypjp2kaaz886dyefOrmRQH53jEJqFglCi9o9/wNE0/MOf4HM3GGUrvwFPaEpgG8ifVgoo180S7p2OFl/61htc2+qtq0tkVFsEqqN5DM+Ohz1ND7TH1EVsKaX4q+7BG5+8UK6piWPrB6ktfGhd5jn+HwwtMejYTCJLZc8IN4rt+JG1e3dI3l+tQRcGjTAnNCJI7Qge+FPvP9FkfaGW7GIvdDbbxvI4js8cfhLJWLrtsIyfnR5Bj1JKwBzkIssDDJM8qHpU3KemE6UyQD/aw2p6HS43iyc0Q4uewDwLSqqr9e/7EIcbaGdzT/rpFf5HhgIVyWrphLzORKJHVAhLvpcpiuUMsPAXodk0ucog/pRBOPTSDfDI5uP0vYoZXCPKMCpPDTx1r7cDvKlUIWHyhUsywAiO8p+HH/bAZ0xEq6G2Gjl+w2Y461kPZujg/TZ0WdwqsI9iBIaZF7QYJZ7kZDVU8ji5/9Jd1O2dCmJiHEBrrAThXdBY1diC3UwCU5grmQT1V82xrfESfoMzhCH+gctyO39NE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6512007)(53546011)(2906002)(508600001)(6506007)(52116002)(26005)(6916009)(8936002)(956004)(316002)(5660300002)(2616005)(186003)(4326008)(44832011)(6486002)(66556008)(8676002)(66946007)(38350700002)(33656002)(66476007)(38100700002)(83380400001)(54906003)(86362001)(36756003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5802
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3cdcde03-5dc9-4873-174f-08d9b6778746
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gVK1KG9GJkop0+xiuYPCrbfflAIX0bAr0bFmkVUS3Ffj3o3ufQU+bMFTWEMJca7RffbLpKxxVHfHZXsKtT5o61mIYypUW89K2thsShC9FJUMpbwGUVjsM1paS1GM1YpsXBANNMfIRtZDz2XJgYsZxKXZ/XMYZibP/WGGN11ixCpaYbGAsZAHFQzOFnRc1VjudTERdFuEyl7RVXRB94bV0fllbT2tpUYjrKnQps2KZGNV586cc3eILXQTw7IcSTlVM1J2Agus5sl4y4UUG7Wcl5OX2vIgiUxpauSATZQlciE4FIEU7DOuZ2sLwGhpoT5Q4Ir7KNRnP3bj/V0JNu+7snQqAdXKoamnW+ZfmWYCAk74s2ZmhsAVEfrzTBffaU9Bg8UiOcScQEChhKyqGejPCctTaKUwg6wtXVyd1A+JNDt2OeYQ5Ko5PM4Nc0/CfaliSWrA6LcZatOOdwHSLIfahqmaALBPL78YrXfjTCgzmoAZ4G581A0lL4gCsFkngWe38hOQzBx3mCvcZ5xsp07e5xyw2dr+23Bzx7WBS4NmJK0n7UgzIzgiX+USSHe9zats1OUwVI7inWCbZe/gBK0pow95/jQszpXIqfqjxVkGSZ/yOskcZQZfnbRRER243FCNceFZjHqVD8Hb/89ZIhUbLB6NcEQXHYNnXgQ7iLmtjyOlBnkNxIQGeclcYRy8cg5JEwvz3EMOSSUoMoASD8joNA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(2616005)(6512007)(47076005)(36756003)(8936002)(356005)(81166007)(82310400004)(26005)(186003)(70586007)(86362001)(2906002)(33656002)(70206006)(44832011)(316002)(8676002)(5660300002)(6486002)(6506007)(6862004)(53546011)(36860700001)(336012)(4326008)(508600001)(956004)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 16:11:32.4516
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93671c50-dc06-450d-08fe-08d9b6779289
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7490



> On 3 Dec 2021, at 10:57, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> Instead of altering Arm's forward declarations, drop them. Like
> elsewhere we should limit such to cases where the first use lives ahead
> of the definition.
>=20

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>=20
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -44,20 +44,6 @@ void __flush_dcache_area(const void *vad
>=20
> static int get_module_file_index(const char *name, unsigned int name_len)=
;
> static void PrintMessage(const CHAR16 *s);
> -static int allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
> -                                EFI_FILE_HANDLE *dir_handle,
> -                                const char *name,
> -                                unsigned int name_len);
> -static int handle_module_node(EFI_LOADED_IMAGE *loaded_image,
> -                              EFI_FILE_HANDLE *dir_handle,
> -                              int module_node_offset,
> -                              int reg_addr_cells,
> -                              int reg_size_cells,
> -                              bool is_domu_module);
> -static int handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_image,
> -                                       EFI_FILE_HANDLE *dir_handle,
> -                                       int domain_node);
> -static int efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image);
>=20
> #define DEVICE_TREE_GUID \
> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0=
xe0}}
> @@ -650,7 +636,7 @@ static void __init PrintMessage(const CH
>  * This function allocates a binary and keeps track of its name, it retur=
ns the
>  * index of the file in the modules array or a negative number on error.
>  */
> -static int __init allocate_module_file(EFI_LOADED_IMAGE *loaded_image,
> +static int __init allocate_module_file(const EFI_LOADED_IMAGE *loaded_im=
age,
>                                        EFI_FILE_HANDLE *dir_handle,
>                                        const char *name,
>                                        unsigned int name_len)
> @@ -713,7 +699,7 @@ static int __init allocate_module_file(E
>  * for the reg property into the module DT node.
>  * Returns 1 if module is multiboot,module, 0 if not, < 0 on error
>  */
> -static int __init handle_module_node(EFI_LOADED_IMAGE *loaded_image,
> +static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_imag=
e,
>                                      EFI_FILE_HANDLE *dir_handle,
>                                      int module_node_offset,
>                                      int reg_addr_cells,
> @@ -814,7 +800,7 @@ static int __init handle_module_node(EFI
>  * in the DT.
>  * Returns number of multiboot,module found or negative number on error.
>  */
> -static int __init handle_dom0less_domain_node(EFI_LOADED_IMAGE *loaded_i=
mage,
> +static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *lo=
aded_image,
>                                               EFI_FILE_HANDLE *dir_handle=
,
>                                               int domain_node)
> {
> @@ -862,7 +848,7 @@ static int __init handle_dom0less_domain
>  * dom0 and domU guests to be loaded.
>  * Returns the number of multiboot modules found or a negative number for=
 error.
>  */
> -static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> +static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image=
)
> {
>     int chosen, node, addr_len, size_len;
>     unsigned int i =3D 0, modules_found =3D 0;
> @@ -942,7 +928,7 @@ static void __init efi_arch_halt(void)
>     stop_cpu();
> }
>=20
> -static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_ima=
ge)
> +static void __init efi_arch_load_addr_check(const EFI_LOADED_IMAGE *load=
ed_image)
> {
>     if ( (unsigned long)loaded_image->ImageBase & ((1 << 12) - 1) )
>         blexit(L"Xen must be loaded at a 4 KByte boundary.");
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -709,7 +709,7 @@ static void __init efi_arch_halt(void)
>         halt();
> }
>=20
> -static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_ima=
ge)
> +static void __init efi_arch_load_addr_check(const EFI_LOADED_IMAGE *load=
ed_image)
> {
>     xen_phys_start =3D (UINTN)loaded_image->ImageBase;
>     if ( (xen_phys_start + loaded_image->ImageSize - 1) >> 32 )
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -389,7 +389,7 @@ static unsigned int __init get_argv(unsi
>     return argc;
> }
>=20
> -static EFI_FILE_HANDLE __init get_parent_handle(EFI_LOADED_IMAGE *loaded=
_image,
> +static EFI_FILE_HANDLE __init get_parent_handle(const EFI_LOADED_IMAGE *=
loaded_image,
>                                                 CHAR16 **leaf)
> {
>     static EFI_GUID __initdata fs_protocol =3D SIMPLE_FILE_SYSTEM_PROTOCO=
L;
> @@ -561,7 +561,7 @@ static int __init __maybe_unused set_col
> }
>=20
> #ifndef CONFIG_HAS_DEVICE_TREE
> -static int __init efi_check_dt_boot(EFI_LOADED_IMAGE *loaded_image)
> +static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image=
)
> {
>     return 0;
> }
>=20
>=20


