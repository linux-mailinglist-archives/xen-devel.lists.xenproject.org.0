Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0940D885
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 13:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188402.337551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpZn-0008Lr-4S; Thu, 16 Sep 2021 11:29:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188402.337551; Thu, 16 Sep 2021 11:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQpZn-0008Jw-0u; Thu, 16 Sep 2021 11:29:11 +0000
Received: by outflank-mailman (input) for mailman id 188402;
 Thu, 16 Sep 2021 11:29:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=U6Su=OG=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mQpZl-0008Jq-Qp
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 11:29:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0d::615])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1cb20ac6-eab3-451f-93bb-4c44cd159e9b;
 Thu, 16 Sep 2021 11:29:07 +0000 (UTC)
Received: from DB6P193CA0006.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::16) by
 VI1PR08MB3438.eurprd08.prod.outlook.com (2603:10a6:803:82::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.18; Thu, 16 Sep 2021 11:28:56 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::d2) by DB6P193CA0006.outlook.office365.com
 (2603:10a6:6:29::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 16 Sep 2021 11:28:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:28:56 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Thu, 16 Sep 2021 11:28:56 +0000
Received: from d00df6a44d20.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3B8A233E-596A-4325-AB5A-B400BDC41C9A.1; 
 Thu, 16 Sep 2021 11:28:45 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d00df6a44d20.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 16 Sep 2021 11:28:45 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PAXPR08MB6559.eurprd08.prod.outlook.com (2603:10a6:102:df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 11:28:43 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 11:28:43 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO2P265CA0080.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:8::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:28:42 +0000
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
X-Inumbo-ID: 1cb20ac6-eab3-451f-93bb-4c44cd159e9b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcQXgh4Nw7cFXANxXv8ccHFbTdsliiRdzpD0HWYv7Bc=;
 b=s1ZGGAN+yeoJVQVSOXn+BP/j8AZbtC+vCkqHYNikqQwMknbQpO6EQYiM3Mne+pej0Sv73NRYt5YSWFuGgMR3DO+rhEjwSDfHNFeJas+4fWY4vWZRk4OT6whIxgz+5QUuha0OhARfewhc9M+cbQsFfqzwf+cpdqFL3kCjDdfyNCs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24523d4d580f1da2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UxDl5IMVMapSW0M5WpCftA9ClGIDqUqr/0ch+nZipBqWOxNuJWWyd8lwuqmo9pyWLtJzB9yRtlyxd23MLkgT1BBR+7kAvY0LSP5IYqxWzM3tL7qsmKItHLdzrCSXRMj4w5P8A8fwdYcQipNyuh5w5729sZLu3oIG2nrZDjVzve3tZritPSPUs7v3zLbxyiEvzyvbL+4urHsElWSQVqzI2TrXIqh58/Tn22nanNGkgadOvhc8ySkBHTZatMvD7CY2nRYOFKKM9hSd6VFf6+4iXX+suDHUWhQjKoURmntmnjVvEYH2JApynYmd+oZkSgo5WwbunSc6RQYC/qMtgKHwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LcQXgh4Nw7cFXANxXv8ccHFbTdsliiRdzpD0HWYv7Bc=;
 b=IbPj/C5mxOE2vK5MSNO5qd5XmBd0BMtz2emx1WthjTXg9CpuMb2WjlnrPx4T4EzdjJMDHNUK52pS5Mu9dGt2wZsmQ3pf7OaCAp6w1pI85AXmO+PJt5o64ZvSg6cqo1izuJFbXLBR+H8+qDg7vc8deBgOqvq/PpCBys+8PBcET9W0Dg/z3Sg5V0ep3S8eLwsuP/D/kRf7ptoLQCYpTjUnz4pKLYzqWM3RJcAnZYX5hD5PzHbiE2Ryu5VvpvUzAKIrjtlYBkLU75vW1DNwMQDQKTdHT8lzYbbLs4/RBDRA6Wo+RwbvrfUwaew7xGhK6Yuv96EPAPhWDtXIEWyTUVcroQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcQXgh4Nw7cFXANxXv8ccHFbTdsliiRdzpD0HWYv7Bc=;
 b=s1ZGGAN+yeoJVQVSOXn+BP/j8AZbtC+vCkqHYNikqQwMknbQpO6EQYiM3Mne+pej0Sv73NRYt5YSWFuGgMR3DO+rhEjwSDfHNFeJas+4fWY4vWZRk4OT6whIxgz+5QUuha0OhARfewhc9M+cbQsFfqzwf+cpdqFL3kCjDdfyNCs=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH 2/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
Date: Thu, 16 Sep 2021 12:28:36 +0100
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <59F99E1E-C306-40BE-8B47-5D92ABF101F5@arm.com>
References: <20210915142602.42862-1-luca.fancellu@arm.com>
 <20210915142602.42862-3-luca.fancellu@arm.com>
 <b3263ea5-b875-1c28-0e03-f911e0e97382@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO2P265CA0080.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::20) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a1009bf-762e-4725-1007-08d979052bbd
X-MS-TrafficTypeDiagnostic: PAXPR08MB6559:|VI1PR08MB3438:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3438CBE68987A952A46BCC83E4DC9@VI1PR08MB3438.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uNBQx1fgO+qHxJHn8dGBIzp+vbPTlWQ3pf869d3jHZKlvh3awZMugDQEXLITkRw/yx2GRUbccrJzUwwIS0p8QbGPCeH0xewH2NbN49jXsUEy5H/vK3Mq8CZyBdknznufRohy7wL6E3SQZXJ0bQdt+6lOdXCx9k18AT7VhBaTvj6+iA3LWh6TWhpBu2ZP9GgFe8DkLwIlHSCsskeBVzt/myxUjSTclr0yw8GeLpn11dBtPw5e7JBsOysSJ8Zahn8tpg7tLGarnVNlyJg7cYmDsycWUXpSbXNAULh3lP1djlIGx7Uh9HoMcv5MhnP4OrENyNEr9vfVmZ4DROISUA5DISWAqmeTGJspNqUM6mcYOoomrdlzTvHv2TpsQ1ns8TArHct/xzkQOCIWHTnqznVTK+qmDM5+NIA0GvGTSHPRVFOgyNisWyKQGL2KNdRfcwe/mhAPJmVsDbhw9vnt/EgGaYefkoZMPsfl+XVhO4dTM6x39ULYcrhf4GHLwrs2Z9czqlbMaunUUNVb55pNItGc14ObNRDA9zDD0Lwy1RFlXNfUN0ZXpRMCLnSvRfyD8gu4NwZbn1cAb8L7qDzvpHKi+vmxSF9IeKqEa4gU6D/0y9W5gpwKlNDtcWsTQcUjGdQentMVbTokeSBJZwbCBBJ2d1buhZniGTK3C3dWxiA3QpVYjlkHK3e9ueN29WhA/LlUO3z5Cjn+IvrzCTycoGNxgXtuECwzB3BhiSLxp3nHMnCAqaUhbzKxQPWjvVM/gdqv3HS1moD30Sgfrlh7VT3B7A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(4326008)(2616005)(36756003)(956004)(66476007)(6486002)(66946007)(86362001)(6512007)(66556008)(8936002)(26005)(6666004)(186003)(44832011)(2906002)(8676002)(38100700002)(38350700002)(33656002)(5660300002)(52116002)(54906003)(316002)(6916009)(6506007)(53546011)(478600001)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6559
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ce8f5ee-1f35-4515-8de3-08d9790523b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zHrlij4EiK/4dEe/VUc5kcvegIgdRLUBRmwjUqfx7j0PrOhBsXkNzun8s8YKUzdSmQNQL3H6bRh4CUs8ZugoK9Fs9OW0k7nnn5Kq5RV1k+hs6for33PupiNy9NI/Fem0VL0yNXH3QxhRPX7JsN5hv6XSNb4uaAO7AhfogaCGXcwb8fj1lh47GiXBpLpa57bXVk/S8epAOdKfylKpR6BQfkiltLgvvxVbpDiy4SGDai84OdROTeTyNNkWfp6ptv7TWzrpZUrf/EO/DISxemX1HWp8hKsrmHdOt6O6+ylvvg/PUUHiIEVtt6QcFEdCbMiYOcfjdmehddld3+8OuTDFscEySUClPqGrGka32KC22X2JlCZ/VsjSPddrJheat2eaX7RIJhPgbMAhoAmB/wvkAzDxgXVlunCD99hmgrjqsBrlEZ4CvEdH58ntRUE7FuJfs6wnFfV7Jk0JbWqQsv4GeEcARmoON90fHHiN3L7KO18QPYK54lxbApFF3tcAStD512ohFJe3/Y7ZcWprzVgfs///yPP1eYSUyw9OAUF1JSAMWsDOdKvfu5s41Y0VW+w6bendnMNn8HpR2V1s8fBJMsxNbRr3yNncuWfzueVrF4bzJ1DwXjUgd61ULohm+BHlJ97FX1qbp0YcLKA7qOWmPYgOfjWyue1PqM1B8v++36GMwC49OKvrwj0Bk4/bFX5UejB3PHXK4herF2YyNahSYZenv9AXRFegrA/DDXd7nEY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(36840700001)(4326008)(70586007)(70206006)(26005)(186003)(316002)(81166007)(44832011)(82310400003)(6512007)(82740400003)(6862004)(47076005)(8676002)(356005)(2616005)(33656002)(36860700001)(36756003)(6666004)(956004)(2906002)(5660300002)(53546011)(86362001)(6486002)(336012)(54906003)(478600001)(8936002)(6506007)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:28:56.5183
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a1009bf-762e-4725-1007-08d979052bbd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3438



> On 16 Sep 2021, at 09:46, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> A number of nits, sorry:
>=20
> On 15.09.2021 16:26, Luca Fancellu wrote:
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -8,9 +8,39 @@
>> #include <asm/setup.h>
>> #include <asm/smp.h>
>>=20
>> +typedef struct {
>> +    char* name;
>=20
> Misplaced *.

I was looking in the CODING_STYLE and I didn=E2=80=99t found anything that =
mandates
char *name; instead of char* name; but if you prefer I can change it since =
I have
to do some modification to the patch.

>=20
>> +    int name_len;
>=20
> Surely this can't go negative? (Same issue elsewhere.)

I will change that to unsigned int.

>=20
>> +} dom0less_module_name;
>> +
>> +/*
>> + * Binaries will be translated into bootmodules, the maximum number for=
 them is
>> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DT=
B
>> + */
>> +#define MAX_DOM0LESS_MODULES (MAX_MODULES - 2)
>> +static struct file __initdata dom0less_files[MAX_DOM0LESS_MODULES];
>> +static dom0less_module_name __initdata dom0less_bin_names[MAX_DOM0LESS_=
MODULES];
>> +static uint32_t __initdata dom0less_modules_available =3D MAX_DOM0LESS_=
MODULES;
>> +static uint32_t __initdata dom0less_modules_idx =3D 0;
>=20
> Please see ./CODING_STYLE for your (ab)use of uint32_t here and
> elsewhere.

Ok, I will change them to unsigned int

>=20
>> +#define ERROR_DOM0LESS_FILE_NOT_FOUND -1
>=20
> Macros expanding to more than a single token should be suitably
> parenthesized at least when the expression can possibly be mistaken
> precedence wise (i.e. array[n] is in principle fine without
> parentheses, because the meaning won't change no matter how it's
> used in an expression).

I will fix it to be (-1)

>=20
>> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>> void __flush_dcache_area(const void *vaddr, unsigned long size);
>>=20
>> +static int __init get_dom0less_file_index(const char* name, int name_le=
n);
>> +static uint32_t __init allocate_dom0less_file(EFI_FILE_HANDLE dir_handl=
e,
>> +                                              const char* name, int nam=
e_len);
>> +static void __init handle_dom0less_module_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                               int module_node_offset,
>> +                                               int reg_addr_cells,
>> +                                               int reg_size_cells);
>> +static void __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_hand=
le,
>> +                                               int domain_node,
>> +                                               int addr_cells,
>> +                                               int size_cells);
>> +static bool __init check_dom0less_efi_boot(EFI_FILE_HANDLE dir_handle);
>=20
> There are attributes (e.g. __must_check) which belong on the
> declarations. __init, however, belongs on the definitions.

Ok, I will remove __init from declarations.

>=20
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -1134,8 +1134,9 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>>     EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>>     union string section =3D { NULL }, name;
>>     bool base_video =3D false;
>> -    const char *option_str;
>> +    const char *option_str =3D NULL;
>>     bool use_cfg_file;
>> +    bool dom0less_found =3D false;
>>=20
>>     __set_bit(EFI_BOOT, &efi_flags);
>>     __set_bit(EFI_LOADER, &efi_flags);
>> @@ -1285,14 +1286,21 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TAB=
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
>> +#ifdef CONFIG_ARM
>> +        /* dom0less feature is supported only on ARM */
>> +        dom0less_found =3D check_dom0less_efi_boot(dir_handle);
>> +#endif
>> +
>> +        if ( !name.s && !dom0less_found )
>=20
> Here you (properly ) use !name.s,

This is not my code, I just added && !dom0less

>=20
>> +            blexit(L"No Dom0 kernel image specified.");
>> +
>> +        if ( name.s !=3D NULL )
>=20
> Here you then mean to omit the "!=3D NULL" for consistency and brevity.

I usually check explicitely pointers with NULL, is it something to be avoid=
ed in Xen?
There are some industrial coding standards that says to avoid the use of ! =
operator
with pointers. Is it important here to do !name.s instead of the solution a=
bove?

>=20
>> +            option_str =3D split_string(name.s);
>>=20
>> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str=
) )
>> +        if ( (!read_section(loaded_image, L"kernel", &kernel, option_st=
r)) &&
>=20
> Stray parentheses.

Will fix

>=20
>> +             (name.s !=3D NULL) )
>=20
> See above.

Will fix

>=20
> I also don't think this logic is quite right: If you're dom0less,
> why would you want to look for an embedded Dom0 kernel image?

This is common code, that check is not from my patch.

Before this serie, EFI boot requires that a dom0 module was passed, otherwi=
se
the boot was stopped.

This serie instead removes this requirement, letting the boot continue if t=
here is no dom0
kernel.

However (as in the old code) if the user embed the dom0 kernel in the image=
, then it is
legit to use it and if there are also other domUs specified by DT, then the=
 system will
start the dom0 kernel and the domUs kernel as well.

Cheers,
Luca=20


>=20
> Jan
>=20


