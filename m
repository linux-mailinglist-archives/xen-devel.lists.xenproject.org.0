Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D472443FFF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 11:30:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220748.382132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDWR-0003Ua-9b; Wed, 03 Nov 2021 10:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220748.382132; Wed, 03 Nov 2021 10:29:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miDWR-0003Rt-62; Wed, 03 Nov 2021 10:29:35 +0000
Received: by outflank-mailman (input) for mailman id 220748;
 Wed, 03 Nov 2021 10:29:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9PtR=PW=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1miDWQ-0003Rn-5A
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 10:29:34 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee781050-3c90-11ec-8564-12813bfff9fa;
 Wed, 03 Nov 2021 10:29:32 +0000 (UTC)
Received: from AM6PR04CA0034.eurprd04.prod.outlook.com (2603:10a6:20b:92::47)
 by HE1PR0801MB1708.eurprd08.prod.outlook.com (2603:10a6:3:83::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 10:29:27 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::25) by AM6PR04CA0034.outlook.office365.com
 (2603:10a6:20b:92::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.10 via Frontend
 Transport; Wed, 3 Nov 2021 10:29:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 3 Nov 2021 10:29:27 +0000
Received: ("Tessian outbound c71e1a752bff:v108");
 Wed, 03 Nov 2021 10:29:27 +0000
Received: from f5dfe36d2f84.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6D3AC01E-DBB1-467A-805C-B33E229DCC55.1; 
 Wed, 03 Nov 2021 10:29:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5dfe36d2f84.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Nov 2021 10:29:21 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4924.eurprd08.prod.outlook.com (2603:10a6:101:1d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 10:29:19 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4649.019; Wed, 3 Nov 2021
 10:29:19 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:151::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Wed, 3 Nov 2021 10:29:18 +0000
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
X-Inumbo-ID: ee781050-3c90-11ec-8564-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKkxec2y5eVRlPUYhCGBy68zEctWD43MZ0dVrggf8HY=;
 b=XE7WGb3j7aJOQfpsp5jWNXhMcyJQKWa4t1E3maaJ3RpqalecVQBac+d/cWwvwNVKnKOyrwlAHr922Kz6cQimuAnjstaW+CnNffpzwx7MtCMPGfIQgbRqCZM2IDeHNjoo8y5XB9Nzrd3/tsn8Y40xpOG/4Te2wIkRJL0uoGX4188=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a69d10eee32b885e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GlwiXOedKrCZoAWJLIpsK1kAV4WAKZIRFJocVUuT75kbcXFG2D5iEmaUF295vHc1N9ZxssTJpZm3NDUay9TG24LH81bjGID1GayIQx1I4gREPMmNqyL0BQGtupNb7FNfFqv4k0kAaTJavRy0WTTYqphFcO2B3wwSDHIWCF/WHNwmFt9SmxI1T3IC7Zyou6xiz2b8ze0iJ7Kxw2PB6uCik2tbaoTE2tpC6pJads3/pqnL59fxiouYJS3YuuvR6JZ9BuZgbXmKhBnCG1kfmae8U1gL8pLgjsjqxdaos/bYBwlC2hI6ZHzWLcnJJL91ZRQ1sU0gzNgHhoRH5Nzsx34SQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKkxec2y5eVRlPUYhCGBy68zEctWD43MZ0dVrggf8HY=;
 b=ogY2rlNPmG3z1T6zIoAXrCHjRdWc1IjHUm8mjGoU9qyjBlL+x/GdzFiJ2T52oGedLqE0vy8BDLcVzMmAK2OK0Tc+JYNODWY5j7iQdMgbN5ZOnAOvtBGPE79MbQb6L8dgrLfEhwEqYYfCe5PG5sGNFPDvkd92NQ5wIhy1JicA2oslCGkE4jYVnKOoetG+hY5nx7jHrqggxtSiXRhVJFmxKRn08R/XTPu0ubC34IQGmRLvfTkmL4fUTmWtQnAqXHO8WKAIXUjUYNaNks6tTXzw0dNdZO9BTSrsoGf9xioTIShmP5Hg8NpgaprVvWZPsNRxZA8O1/Y0Cc8sNcbWZSPzAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKkxec2y5eVRlPUYhCGBy68zEctWD43MZ0dVrggf8HY=;
 b=XE7WGb3j7aJOQfpsp5jWNXhMcyJQKWa4t1E3maaJ3RpqalecVQBac+d/cWwvwNVKnKOyrwlAHr922Kz6cQimuAnjstaW+CnNffpzwx7MtCMPGfIQgbRqCZM2IDeHNjoo8y5XB9Nzrd3/tsn8Y40xpOG/4Te2wIkRJL0uoGX4188=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH] xen/efi: Fix Grub2 boot on arm64
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2111021610180.18170@sstabellini-ThinkPad-T480s>
Date: Wed, 3 Nov 2021 10:29:12 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <67A7B343-8230-49C5-91CA-18C0E2ACDEF3@arm.com>
References: <20211102140511.5542-1-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2111021610180.18170@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3693.20.0.1.32)
X-ClientProxiedBy: LO4P123CA0035.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::22) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45f92035-d6f1-4f48-77af-08d99eb4d052
X-MS-TrafficTypeDiagnostic: PR2PR08MB4924:|HE1PR0801MB1708:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB1708B46278D75DE8EA665CD5E48C9@HE1PR0801MB1708.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 j+VBFVNN5w9A3BT2lotC0KkXSZZTL8lgQBmgysSvMRlL3foifOF+r+bwwilTBel0jtHIDhcDq/3zSCYaVD6qt0WdjyKdHEEJPc6oiILpFi92IkwYbw9L8RTgJEOP/XoSIht23bngH6Evb3O5+2qSXHxqbU1/ch574BJhhbZNbTUjIYbUQO5CZL1T2QB+uGVafyw03K3v2JKnyLCAh+DkI9r98GheYblMkLvuQa3dZ9kRwybDFh9ngYy3RfgMLF29hMJB3in7sSJg748FkAt9Qy5E2fIrbotahugpBSRm4Ff+Ed5LXVp587jXSLIQBCYbsRqmgOLB1qUEAXY5BX+c5GqJ4M19Svsmzm9AOiKE4+aP1ZO1uqtIFqRwqP04Tc7I3I23XnHolvsNs3Snqs+QNnu+tZ7xFGnIPZ24albO2Eioj8XfC9peKWYeViJAT7hhfY5ZQ5RZMjR5D5t20lBM+T87TAyFHIjEpAuQGNV5X2yH/TLbAq/NKT4wCVnoeKRmKe9pL43VdswhpgpKJM+/goFvkjpaDVrtm4QJ/Tkm9JT9+fgJ28OVGC1wZigP5lElyfO5VFPYM3XDyxnMsN0OK5ztER35PpE/FdSw/BoNVuLxbHYg2mMrQy0a1JM14fd94rQTG5Q3VkbyvWhOaADArmanFlhtXTvf8mKKYr7A5tG4xteQxeGxbKCntoE9hwdGKwLdfR/V08vW0Y7PboyskJfLJ1t92fwWRbeja3ojrIEi3ayC1ObENjIkcPSitRrB
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(4326008)(66556008)(52116002)(66946007)(8676002)(2906002)(66476007)(6916009)(186003)(86362001)(36756003)(6506007)(26005)(54906003)(316002)(5660300002)(38350700002)(38100700002)(6666004)(6486002)(508600001)(956004)(2616005)(83380400001)(8936002)(33656002)(44832011)(6512007)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4924
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f51bca3f-1c1f-4304-5d60-08d99eb4cb30
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfujAZ16RgmWQ44hdPv4Ziwu8RsRrjqYUbAxv6LcfV1Zdh+qTl/NNmp5+OsrxYXmIUD7nezLiDA4JN0SIazhdVWAo7pTc35egiy1EbXEO97GvBnv7yH7IEdrifFvlLwjFEO9otdoQ8QBYfPuTwhwKzyB97lg7RhlDFaxKJlvVTp/NVXc+3W9x13O5LhxBcgh1aQIQSBbG8q3iv8hqOGiwBc6j7QxeTmk6Jg9/pKzbai15MjToMQAs+FxRbUvu76Toc0KLJddOor0Kw5P0iE5kKivLaZ5/5T9buMq8cfQgiPv/8OrE21I93QUEzoVe1OMMbErPdKITzXBwddTwzzD7uFKW24lY+rD1Var4ugmZC6KIeRBEq5NR3nxH87VV1yHG0i/6wLKg2Xv5roBsDeirWgarSikXlk3ISCjWgvc89ybgBNhvrwkcpHTzQ0Of4Se203mM9JhbCtprpwkzdoG2lYVBqrn+tbpSfhjh94Egflwl/LuSydB2jHj2j9c31WuzMop7RzvNOPiu2Y4IIMqadVMiJakQHuVl5Wt31b8KNtSaAmMQddZEKpQrRQDd1zTLnTnCQi3nNT8LVAaqbNLLP2gfPNPCXAhX6Q/jlQfedECdLLbJ6WVLwxpzztTWHYdS6YQ+F2SfVdi7b4zr3p6DZstf3BYmPvuDMozlAI31EQaLlJtZaE5C9SzBdNwEr2z9sNGFmrEZuiSCFUgKho5Pg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(107886003)(6862004)(5660300002)(70206006)(4326008)(6506007)(54906003)(70586007)(53546011)(33656002)(6486002)(316002)(36860700001)(26005)(81166007)(6666004)(8936002)(186003)(356005)(8676002)(82310400003)(2906002)(36756003)(6512007)(44832011)(508600001)(956004)(2616005)(83380400001)(86362001)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 10:29:27.5263
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45f92035-d6f1-4f48-77af-08d99eb4d052
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1708



> On 2 Nov 2021, at 23:17, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Tue, 2 Nov 2021, Luca Fancellu wrote:
>> The code introduced by commit a1743fc3a9fe9b68c265c45264dddf214fd9b882
>> ("arm/efi: Use dom0less configuration when using EFI boot") is
>> introducing a problem to boot Xen using Grub2 on ARM machine using EDK2.
>>=20
>> The problem comes from the function get_parent_handle(...) that inside
>> uses the HandleProtocol on loaded_image->DeviceHandle, but the last
>> is NULL, making Xen stop the UEFI boot.
>>=20
>> Before the commit above, the function was never called because the
>> logic was skipping the call when there were multiboot modules in the
>> DT because the filesystem was never used and the bootloader had
>> put in place all the right modules in memory and the addresses
>> in the DT.
>>=20
>> To fix the problem we allow the get_parent_handle(...) function to
>> return a NULL handle on error and we check the usage of the function
>> to handle the new use case. The function in fact should not prevent
>> the boot even if the filesystem can't be used, because the DT and
>> the modules could be put in place by the bootloader before running
>> Xen and if xen,uefi-binary property is not used, there is no need
>> for the filesystem.
>>=20
>> Another problem is found when the UEFI stub tries to check if Dom0
>> image or DomUs are present.
>> The logic doesn't work when the UEFI stub is not responsible to load
>> any modules, so the efi_check_dt_boot(...) return value is modified
>> to return the number of multiboot module found and not only the number
>> of module loaded by the stub.
>>=20
>> Fixes: a1743fc3a9 ("arm/efi: Use dom0less configuration when using EFI b=
oot")
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> ---
>> Justification for integration in 4.16:
>> Upside: allow booting xen from grub on arm64 when the stub doesn't load
>>        any module.
>> Downside: It's affecting the EFI boot path.
>> Risk: It's not affecting x86 arch that works the same way as before.
>>      If something is wrong it creates a problem on early boot and not at
>>      runtime, so risk is low.
>>=20
>> Tested in this configurations:
>> - Bootloader loads modules and specify them as multiboot modules in DT:
>>   * combination of Dom0, DomUs, Dom0 and DomUs
>> - DT specifies multiboot modules in DT using xen,uefi-binary property:
>>   * combination of Dom0, DomUs, Dom0 and DomUs
>> - Bootloader loads a Dom0 module and appends it as multiboot module in D=
T,
>>   other multiboot modules are listed for DomUs using xen,uefi-binary
>> - No multiboot modules in DT and no kernel entry in cfg file:
>>   * proper error thrown
>>=20
>> ---
>> xen/arch/arm/efi/efi-boot.h | 28 ++++++++++++++++++----------
>> xen/common/efi/boot.c       | 15 ++++++++++++++-
>> 2 files changed, 32 insertions(+), 11 deletions(-)
>>=20
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 8b88dd26a5..e714b2b44c 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -51,9 +51,11 @@ static int handle_module_node(EFI_FILE_HANDLE dir_han=
dle,
>>                               int module_node_offset,
>>                               int reg_addr_cells,
>>                               int reg_size_cells,
>> -                              bool is_domu_module);
>> +                              bool is_domu_module,
>> +                              unsigned int *modules_found);
>> static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
>> -                                       int domain_node);
>> +                                       int domain_node,
>> +                                       unsigned int *modules_found);
>> static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
>>=20
>> #define DEVICE_TREE_GUID \
>> @@ -707,7 +709,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE=
 dir_handle,
>>                                      int module_node_offset,
>>                                      int reg_addr_cells,
>>                                      int reg_size_cells,
>> -                                     bool is_domu_module)
>> +                                     bool is_domu_module,
>> +                                     unsigned int *modules_found)
>> {
>>     const void *uefi_name_prop;
>>     char mod_string[24]; /* Placeholder for module@ + a 64-bit number + =
\0 */
>> @@ -725,6 +728,9 @@ static int __init handle_module_node(EFI_FILE_HANDLE=
 dir_handle,
>>         /* Module is not a multiboot,module */
>>         return 0;
>>=20
>> +    /* Count the multiboot module as found */
>> +    (*modules_found)++;
>> +
>>     /* Read xen,uefi-binary property to get the file name. */
>>     uefi_name_prop =3D fdt_getprop(fdt, module_node_offset, "xen,uefi-bi=
nary",
>>                                  &uefi_name_len);
>> @@ -804,7 +810,8 @@ static int __init handle_module_node(EFI_FILE_HANDLE=
 dir_handle,
>>  * Returns 0 on success, negative number on error.
>>  */
>> static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle=
,
>> -                                              int domain_node)
>> +                                              int domain_node,
>> +                                              unsigned int *modules_fou=
nd)
>> {
>>     int module_node, addr_cells, size_cells, len;
>>     const struct fdt_property *prop;
>> @@ -834,7 +841,7 @@ static int __init handle_dom0less_domain_node(EFI_FI=
LE_HANDLE dir_handle,
>>           module_node =3D fdt_next_subnode(fdt, module_node) )
>>     {
>>         int ret =3D handle_module_node(dir_handle, module_node, addr_cel=
ls,
>> -                                     size_cells, true);
>> +                                     size_cells, true, modules_found);
>>         if ( ret < 0 )
>>             return ret;
>>     }
>> @@ -845,12 +852,12 @@ static int __init handle_dom0less_domain_node(EFI_=
FILE_HANDLE dir_handle,
>> /*
>>  * This function checks for xen domain nodes under the /chosen node for =
possible
>>  * dom0 and domU guests to be loaded.
>> - * Returns the number of modules loaded or a negative number for error.
>> + * Returns the number of multiboot modules found or a negative number f=
or error.
>>  */
>> static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
>> {
>>     int chosen, node, addr_len, size_len;
>> -    unsigned int i =3D 0;
>> +    unsigned int i =3D 0, modules_found =3D 0;
>>=20
>>     /* Check for the chosen node in the current DTB */
>>     chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
>> @@ -868,11 +875,12 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDL=
E dir_handle)
>>         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
>>         {
>>             /* Found a node with compatible xen,domain; handle this node=
. */
>> -            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
>> +            if ( handle_dom0less_domain_node(dir_handle, node,
>> +                                             &modules_found) < 0 )
>>                 return ERROR_DT_MODULE_DOMU;
>>         }
>>         else if ( handle_module_node(dir_handle, node, addr_len, size_le=
n,
>> -                                     false) < 0 )
>> +                                     false, &modules_found) < 0 )
>>                  return ERROR_DT_MODULE_DOM0;
>=20
> I think there is no need to add modules_found to the parameters of
> handle_dom0less_domain_node and handle_module_node. You could just
> increment modules_found here for every iteration of the loop where
> there is no error.  You would have to change a couple of returns in
> handle_module_node, just to give you the idea:

Yes we could do that but when we handle a xen,domain node we will count
only one module and that defeats the aim to count every multiboot,module.

If we want to continue with your proposal let me know and I will implement =
it.

>=20
>=20
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index e714b2b44c..7739789c41 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -726,7 +726,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE =
dir_handle,
>=20
>     if ( module_compat !=3D 0 )
>         /* Module is not a multiboot,module */
> -        return 0;
> +        return 1;
>=20
>     /* Count the multiboot module as found */
>     (*modules_found)++;
> @@ -737,7 +737,7 @@ static int __init handle_module_node(EFI_FILE_HANDLE =
dir_handle,
>=20
>     if ( !uefi_name_prop )
>         /* Property not found */
> -        return 0;
> +        return 1;
>=20
>     file_idx =3D get_module_file_index(uefi_name_prop, uefi_name_len);
>     if ( file_idx < 0 )
>=20
>=20
>>     }
>>=20
>> @@ -883,7 +891,7 @@ static int __init efi_check_dt_boot(EFI_FILE_HANDLE =
dir_handle)
>>         efi_bs->FreePool(modules[i].name);
>>     }
>>=20
>> -    return modules_idx;
>> +    return modules_found;
>> }
>>=20
>> static void __init efi_arch_cpu(void)
>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
>> index 392ff3ac9b..495e7a4096 100644
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
>> +
>>     do {
>>         EFI_FILE_IO_INTERFACE *fio;
>>=20
>> @@ -581,6 +588,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_han=
dle, CHAR16 *name,
>>     EFI_STATUS ret;
>>     const CHAR16 *what =3D NULL;
>>=20
>> +    if ( !dir_handle )
>> +        blexit(L"Error: No access to the filesystem");
>>     if ( !name )
>>         PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
>>     ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>> @@ -1333,6 +1342,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>             EFI_FILE_HANDLE handle =3D get_parent_handle(loaded_image,
>>                                                        &file_name);
>>=20
>> +            if ( !handle )
>> +                blexit(L"Error retrieving image name: no filesystem acc=
ess");
>=20
> I think it would be nice to have an other explicit check like this one
> at the beginning of if ( use_cfg_file ) to make sure dir_handle is not
> null in that case. If I am not mistaken, if we take the use_cfg_file
> path, dir_handle has to be valid, right?

Dir_handle could be invalid and we would be able to boot successfully when =
we take everywhere
the path using read_section, for that reason I didn=E2=80=99t stop the boot=
 earlier.
Given Jan suggestion that check could be also modified to be something like=
 =E2=80=9Cif there is no handle, *argv=3D=E2=80=9Cxen.efi=E2=80=9D "
so the boot can continue without problem if we don=E2=80=99t need to read a=
nything from the filesystem.

>=20
>=20
>>             handle->Close(handle);
>>             *argv =3D file_name;
>>         }
>> @@ -1369,7 +1381,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>     /* Get the number of boot modules specified on the DT or an error (<=
0) */
>>     dt_modules_found =3D efi_check_dt_boot(dir_handle);
>>=20
>> -    dir_handle->Close(dir_handle);
>> +    if ( dir_handle )
>> +        dir_handle->Close(dir_handle);
>>=20
>>     if ( dt_modules_found < 0 )
>>         /* efi_check_dt_boot throws some error */
>> --=20
>> 2.17.1


