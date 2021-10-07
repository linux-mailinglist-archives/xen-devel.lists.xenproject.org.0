Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7E42555F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 16:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203644.358798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYULL-00065s-3o; Thu, 07 Oct 2021 14:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203644.358798; Thu, 07 Oct 2021 14:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYULL-00063e-0C; Thu, 07 Oct 2021 14:25:55 +0000
Received: by outflank-mailman (input) for mailman id 203644;
 Thu, 07 Oct 2021 14:25:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s+Rh=O3=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mYULJ-00063Y-9u
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 14:25:53 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 947c14de-b4e7-4cad-89f3-4d33ec377b18;
 Thu, 07 Oct 2021 14:25:51 +0000 (UTC)
Received: from AM5PR0701CA0006.eurprd07.prod.outlook.com
 (2603:10a6:203:51::16) by VI1PR0802MB2463.eurprd08.prod.outlook.com
 (2603:10a6:800:bb::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 14:25:35 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::c4) by AM5PR0701CA0006.outlook.office365.com
 (2603:10a6:203:51::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Thu, 7 Oct 2021 14:25:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Thu, 7 Oct 2021 14:25:34 +0000
Received: ("Tessian outbound b9598e0ead92:v103");
 Thu, 07 Oct 2021 14:25:34 +0000
Received: from b804b1263025.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5266E4F1-1A05-442B-86F0-5C19D30A3D43.1; 
 Thu, 07 Oct 2021 14:25:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b804b1263025.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 07 Oct 2021 14:25:22 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4700.eurprd08.prod.outlook.com (2603:10a6:101:1b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Thu, 7 Oct
 2021 14:25:20 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.019; Thu, 7 Oct 2021
 14:25:20 +0000
Received: from smtpclient.apple (217.140.106.53) by
 LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:18b::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.17 via Frontend Transport; Thu, 7 Oct 2021 14:25:19 +0000
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
X-Inumbo-ID: 947c14de-b4e7-4cad-89f3-4d33ec377b18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMZbH25P77qIWqPH6yWdyJ7CHw/ASTedsNDOwMk6rU8=;
 b=5pOizQptNCZkBDHSY0CEyJj6YhWf/KiK4IV3KRlgoKxBld0SnPImng9n6Qb/5NXEWkjwwkiq1MJHMPutf8X40LE/2gOjqfovmqJM7oxAAeFXvTq/3ybvp4G5Zmu+Wv2YC/sLLz0U9V4Ur/pk1w/v0KBzMMw+KJmxBkfLakND99M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 277379b04ef87cb5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J70RM+dsNAyIskjqitVvp6YLgGihFoXQR16Du7HLtlH5MSZu9XLAbZ6Zu78vJa6sNQFgTnTH/02JmbgQHE7MNr0wlwEoxLLBslyJj8NklLtAzd30UlQYgzGESP+xUBUj4KMgU52C8JrG5oSNseo28Q04pHK+CjGXilhT4sBgQEVGDVlRNOVNUzOLmr4b+VpR+rqlT3Cvp/uUW69TgIwilcV4dZZqiT8YnWDaYt8A9x3yHvPY1P5ZepACSc2A4BDD7vHG4yKEEFtVT5dy37QGKeRtvJxUf/Q0/ZEmUBd6GkHc/gifiQxP8lJ8Q9KY/DYtQ0vxV1KsNFZ30zGJs8aujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMZbH25P77qIWqPH6yWdyJ7CHw/ASTedsNDOwMk6rU8=;
 b=KTLG/aEzMlyAcDZuhwgmu2pFMmhSUIefPSMszKTYy9CTSGwQYgE0mFz/LxfWQmfFlpUSMc4i/IbBautxqQzabP/yvyFoHOeOOamPyTewDwi8p83/yuSDmMgY0yuvg7xseyr60GiCl2nt/4x6yck843Wag25353fxIWcyfs8/T5AEM69rFSvUJ852OvGnq5hxFQNR6WVeL9Nr1+e+Cwl36BTi6c47g6viXCxQ1zHSF24q+oxO8i9P2tC8wRAK2K8H9pLaYUDOTuCTLHgMuAcolF2ZSvA9AvcEHZIoK5S5I+Bb7KUx8dElDOLvIRT8CpQn+F/d8mgvhvDcPgCd9aQU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMZbH25P77qIWqPH6yWdyJ7CHw/ASTedsNDOwMk6rU8=;
 b=5pOizQptNCZkBDHSY0CEyJj6YhWf/KiK4IV3KRlgoKxBld0SnPImng9n6Qb/5NXEWkjwwkiq1MJHMPutf8X40LE/2gOjqfovmqJM7oxAAeFXvTq/3ybvp4G5Zmu+Wv2YC/sLLz0U9V4Ur/pk1w/v0KBzMMw+KJmxBkfLakND99M=
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v4 1/3] arm/efi: Introduce xen,uefi-cfg-load DT property
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <8691f762-e4ca-b099-8b4e-87b63b16abe0@xen.org>
Date: Thu, 7 Oct 2021 15:25:16 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <42808BCC-A1EC-4EAD-87CE-1AFBA0CC6D46@arm.com>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-2-luca.fancellu@arm.com>
 <8691f762-e4ca-b099-8b4e-87b63b16abe0@xen.org>
To: Julien Grall <julien@xen.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0429.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::20) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91d7478a-1212-45d8-3ae8-08d9899e5382
X-MS-TrafficTypeDiagnostic: PR2PR08MB4700:|VI1PR0802MB2463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB246344B3F9E1E201F2826E4DE4B19@VI1PR0802MB2463.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AQs9ZyBoXkCDqfNacu+yXLqVOxosPxqQQgVmufO3zkMIP/hTHrBIfbShgGjJB8sqWk0fmkGwBcL7wN90QtWmkNiLsbEyZPG+AulHwWCuGGZyABPKs2EfabTKsH+Pj8N9+lNyTSD+BUTQf6IhVKlI2CIcDAxbBugerJkQxs54BIgyp31dxC7lWeEVbyfEugnRKUvtlLcHFj9CG+YwVtFGUlNi82B7tMvtYQU/Bzt276SZV7Bu4LxoAPfvCWUtoHy2UT10q7+yV2g+BMOLQqVstl/0cP+FCz3pI3UmmNdX9V2XycLQXhgRRV9P6dMmSjwjf3CU0NCZO9ZR5DbeUh+fH5mctZUPvN4UdYx+4DFno2wnW6sj6Llo9V0OFBm2V3NA0ftJhqdI9b1NimU/Btg4rYQH8Sm/dY3ZuGFSaCOAT3rJh/cYIU4IHi8yfS7acqeC79Tu9LH5AWq3pDftVBwEZXngzOv0j4iqdtsOs/if+Kiu/qnU9OLLwDHVnMGh5qwQzOd7OGSGE/zehn9I+HdJEOP1C7TRARHSLkqdE9qlZJqb23ODWPCgIcnzDu1LqEWj8cI8liYV3WyrrJcC7qQQo6uIjqrpwyONFAW+JMKCEhWbv5TojDj6CS7X/DjlyY6hJvsrVoU2qnKf4mTimf8clGpDmfe7lKsoBop1XVr5dIBAckIsiEpmHvt2Nz5n5yEuoEmPx2jSJtn7BRRRTzt+WuyobdY5jov0Qpjc2D16sRE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(53546011)(36756003)(316002)(6486002)(6666004)(66476007)(66556008)(8676002)(38350700002)(6506007)(5660300002)(6916009)(6512007)(186003)(4326008)(44832011)(54906003)(86362001)(26005)(38100700002)(33656002)(8936002)(2906002)(956004)(52116002)(83380400001)(2616005)(508600001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4700
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0b7bd5fa-f91b-4090-4843-08d9899e4a8d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	atd9HtJvdukBRi2F+mHSllFH6k91NlJY+HatwnaNJybjCRjRc7s/WDmiZoUSrCYu9AYUj/VS8QmUj6CFM9hOnQYPJkL+NLScAIeoSR+Ipl0pyNPs1zRyJFXy7Paf6b5absCxBzXI1mCd+nK61LP702WXkC5+kCYSCS9OTjcAcm6379oB9AqUbkDO1S8VVY2lXwz/JqqwXJLnWaP0gb/tRcq8AWTDqYRplfTri6oYVx6Ym3YzsZTCbrMqYeBwcWLoMqXU68BIU4AW0PDzaCnzGqZGhR0ldbS9fnN3tVpgEZ4Enuf/dWWQrUbmPpdIRG41BKlZENUokXOkVgotIzmLZ3RYuzhs02S0hoNFUauD6zNZKk283q+Ycar1sPooHADrWwnocCIkFUKQJopPppAXOud7ahTGCyIWPdk1dkGfJXGkbEHuBLcn5rjjrKUAPDx1UXgjnXS6sb/+95qSKmKBvR0f160k8vteN0VdrQYBzK5lV6wAHMv/C/dw/2FuSllNSMd41mGgwPkiItq6EDOtGnwHpYm4B3r2aTpLgaKhqoSUH/46UtGBKHu4Am+yTJKyVVLsJjMLgEt+jH6rA9tIHozCqFCTXc1r0BMg5zRJwgiue17aLjN4WuSS1yGyPmuQz4LEY5lkHuHxCQkH5aU6K8S+OM7pIYUOT5cjC4b7l4QqAcBHoDgxNs7rGdPAruzi+6BybWHTAnpHkmyDRqGvUg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(6506007)(70206006)(5660300002)(8936002)(8676002)(47076005)(86362001)(70586007)(6486002)(6512007)(53546011)(33656002)(82310400003)(508600001)(186003)(54906003)(356005)(4326008)(2616005)(316002)(6862004)(956004)(83380400001)(2906002)(36860700001)(26005)(336012)(44832011)(6666004)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 14:25:34.7967
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d7478a-1212-45d8-3ae8-08d9899e5382
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2463



> On 6 Oct 2021, at 19:32, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Luca,
>=20
> Sorry for jumping late in the conversation. While skimming through what h=
as been committed, I noticed one potential issue in this patch and have als=
o a question.
>=20
> On 30/09/2021 16:28, Luca Fancellu wrote:
>> Introduce the xen,uefi-cfg-load DT property of /chosen
>> node for ARM whose presence decide whether to force
>> the load of the UEFI Xen configuration file.
>> The logic is that if any multiboot,module is found in
>> the DT, then the xen,uefi-cfg-load property is used to see
>> if the UEFI Xen configuration file is needed.
>> Modify a comment in efi_arch_use_config_file, removing
>> the part that states "dom0 required" because it's not
>> true anymore with this commit.
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>> ---
>> v4 changes:
>> - modify property name to xen,uefi-cfg-load
>> v3 changes:
>> - add documentation to misc/arm/device-tree/booting.txt
>> - Modified variable name and logic from skip_cfg_file to
>> load_cfg_file
>> - Add in the commit message that I'm modifying a comment.
>> v2 changes:
>> - Introduced uefi,cfg-load property
>> - Add documentation about the property
>> ---
>>  docs/misc/arm/device-tree/booting.txt |  8 ++++++++
>>  docs/misc/efi.pandoc                  |  2 ++
>>  xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
>>  3 files changed, 33 insertions(+), 5 deletions(-)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index 44cd9e1a9a..352b0ec43a 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs f=
or Xen, xen,dom0-bootargs
>>  for Dom0 and bootargs for native Linux.
>>    +UEFI boot and DT
>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> +
>> +When Xen is booted using UEFI, it doesn't read the configuration file i=
f any
>> +multiboot module is specified. To force Xen to load the configuration f=
ile, the
>> +boolean property xen,uefi-cfg-load must be declared in the /chosen node=
.
>> +
>> +
>>  Creating Multiple Domains directly from Xen
>>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>  diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
>> index ac3cd58cae..ed85351541 100644
>> --- a/docs/misc/efi.pandoc
>> +++ b/docs/misc/efi.pandoc
>> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tr=
ee provided to Xen.  If a
>>  bootloader provides a device tree containing modules then any configura=
tion
>>  files are ignored, and the bootloader is responsible for populating all
>>  relevant device tree nodes.
>> +The property "xen,uefi-cfg-load" can be specified in the /chosen node t=
o force
>> +Xen to load the configuration file even if multiboot modules are found.
>=20

Hi Julien,

> I think this wants to be clarified. Lets imagine both the Device-Tree and=
 the cfg provides a kernel. Which one will get used?

Yes this is will lead to a device tree where there will be two multiboot mo=
dule for the dom0 kernel, I guess the one really loaded
will be the first multiboot kernel node processed and appended to the boot =
modules.

I see this is a possible issue and this is handled in the third patch of th=
e serie.


>=20
>=20
>>    Once built, `make install-xen` will place the resulting binary direct=
ly into
>>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment=
 (and
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index cf9c37153f..a3e46453d4 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LO=
ADED_IMAGE *loaded_image)
>>    static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemT=
able)
>>  {
>> +    bool load_cfg_file =3D true;
>>      /*
>>       * For arm, we may get a device tree from GRUB (or other bootloader=
)
>>       * that contains modules that have already been loaded into memory.=
  In
>> -     * this case, we do not use a configuration file, and rely on the
>> -     * bootloader to have loaded all required modules and appropriate
>> -     * options.
>> +     * this case, we search for the property xen,uefi-cfg-load in the /=
chosen
>> +     * node to decide whether to skip the UEFI Xen configuration file o=
r not.
>>       */
>>        fdt =3D lookup_fdt_config_table(SystemTable);
>>      dtbfile.ptr =3D fdt;
>>      dtbfile.need_to_free =3D false; /* Config table memory can't be fre=
ed. */
>> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,modul=
e") < 0 )
>> +
>> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 =
)
>=20
> AFAICT, fdt_node_offset_by_compatible expects 'fdt' to be non-NULL. Howev=
er, lookup_fdt_config_table() may return NULL on platform with no Device-Tr=
ee (server tends to be ACPI only). So wouldn't this result to dereference N=
ULL and crash?

Thanks for spotting that, I will push a patch to fix it, something like thi=
s should be ok:

+    if ( fdt && (fdt_node_offset_by_compatible(fdt, 0, "multiboot,module")=
 > 0) )

Sorry I didn=E2=80=99t spotted earlier.

Cheers,
Luca

>=20
>> +    {
>> +        /* Locate chosen node */
>> +        int node =3D fdt_subnode_offset(fdt, 0, "chosen");
>> +        const void *cfg_load_prop;
>> +        int cfg_load_len;
>> +
>> +        if ( node > 0 )
>> +        {
>> +            /* Check if xen,uefi-cfg-load property exists */
>> +            cfg_load_prop =3D fdt_getprop(fdt, node, "xen,uefi-cfg-load=
",
>> +                                        &cfg_load_len);
>> +            if ( !cfg_load_prop )
>> +                load_cfg_file =3D false;
>> +        }
>> +    }
>> +
>> +    if ( !fdt || load_cfg_file )
>>      {
>>          /*
>>           * We either have no FDT, or one without modules, so we must ha=
ve a
>> -         * Xen EFI configuration file to specify modules.  (dom0 requir=
ed)
>> +         * Xen EFI configuration file to specify modules.
>>           */
>>          return true;
>>      }
>=20
> Cheers,
>=20
> --=20
> Julien Grall


