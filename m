Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28689429EF9
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 09:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206822.362481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCYi-0003Uv-Bl; Tue, 12 Oct 2021 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206822.362481; Tue, 12 Oct 2021 07:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCYi-0003SQ-7w; Tue, 12 Oct 2021 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 206822;
 Tue, 12 Oct 2021 07:50:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B8jq=PA=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1maCYg-0003SK-LW
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 07:50:46 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe08::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cafddc9-e57d-424a-81c3-3a6a395459f5;
 Tue, 12 Oct 2021 07:50:44 +0000 (UTC)
Received: from AM5PR0701CA0023.eurprd07.prod.outlook.com
 (2603:10a6:203:51::33) by AM8PR08MB6500.eurprd08.prod.outlook.com
 (2603:10a6:20b:361::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 07:50:42 +0000
Received: from VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::f9) by AM5PR0701CA0023.outlook.office365.com
 (2603:10a6:203:51::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Tue, 12 Oct 2021 07:50:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT059.mail.protection.outlook.com (10.152.19.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 07:50:42 +0000
Received: ("Tessian outbound 2e7020cc8961:v103");
 Tue, 12 Oct 2021 07:50:42 +0000
Received: from e4ee606929fe.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4D67BB3-C886-46B3-B6B0-0A5E556C1022.1; 
 Tue, 12 Oct 2021 07:50:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e4ee606929fe.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 07:50:33 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com (10.168.85.9) by
 DB6PR0802MB2183.eurprd08.prod.outlook.com (10.172.227.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25; Tue, 12 Oct 2021 07:50:28 +0000
Received: from DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955]) by DB6PR0801MB2024.eurprd08.prod.outlook.com
 ([fe80::45c9:9096:a15b:6955%4]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 07:50:28 +0000
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
X-Inumbo-ID: 9cafddc9-e57d-424a-81c3-3a6a395459f5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd/TmEEpvopj+oO/GFKbzPRWMuThwOAMH+YnNav0ij8=;
 b=kAV9Xh1Dvp4ArxI2RlvethFcoUYPQKKGpGa15ZNwrOMoa0YO0nPoFCzJ7pagLcIvPWLb6RtqUXnpwcg3Haf6l5rJbbtqt+Ek6EYjegJAqBZoREqFmZwkUeghDPOBKWQLb2RPQI1jb8ifBZMd5SjbkyC5rAXCNYa4rUZpXARIrTA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 25d7895c4c4e2104
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UI+o7MIuCILiQR7MRprx015pbqM93dfpzN5UYHQKS2ck1T/Wqbn8DeSgEh5pOLqDCa9t8MuTw37W1/zBEUKhVLja4U9RHLC2K3SkLOvWpGebpLcyAX+sqk3Cml/8z8a0BvX5ZCSo5BjE8c2Bdxm9fVkT3veYUZk0IKHaIv+0g7HuhJw/tD0ybRu6PeZZEVJBKu06XcAZOncfI6+t2/FN4GqQOiXtJYg1cQ1ftzmjrdq1u6ko/VBTBh5pk2FA39sLGq30HyBiZ3VTlhxb1zHPWf1U8nvZ1wqHVMtdXwhBQGiXDkH5D3j3Rs/D+AgJCzrRkgt170H12Tu/c2DSqpir1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fd/TmEEpvopj+oO/GFKbzPRWMuThwOAMH+YnNav0ij8=;
 b=jU3VXmeZe1Ly6WGKG5nlHsnu/jjv0iqTlkptuPhBq3/2Ct/8TKGIOWSOqQ4rIQYf/rmf08tZIydVuliC3f0udAREHyavbj17cokitci4auEdbg8Zmhh/sp4LaeJbwwYy4ykLh33RREfYsOaYvBhnAs7IJmdP+5NrWjO8QyFpj0S4waBBNITprSnORM8xkA4qxHFkQT2C9y+qpeSFD5WYuAnXnlbldzXnFqI01aTK3BcltuFi4sds7PWiWwhhyW9MiE7J3p39uCxP/C5Bp+mT/yKMhz1i5dXhcxlEa3GkyUjG1DPGqljN/WOaBtu8xJzf+IkFJHi9/nzvMqlVRVRQQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fd/TmEEpvopj+oO/GFKbzPRWMuThwOAMH+YnNav0ij8=;
 b=kAV9Xh1Dvp4ArxI2RlvethFcoUYPQKKGpGa15ZNwrOMoa0YO0nPoFCzJ7pagLcIvPWLb6RtqUXnpwcg3Haf6l5rJbbtqt+Ek6EYjegJAqBZoREqFmZwkUeghDPOBKWQLb2RPQI1jb8ifBZMd5SjbkyC5rAXCNYa4rUZpXARIrTA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Chen <Wei.Chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Ian
 Jackson <iwj@xenproject.org>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: Re: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
Thread-Topic: [PATCH v6 1/2] arm/efi: Use dom0less configuration when using
 EFI boot
Thread-Index: AQHXvswUDRnPxVunP0m5apMrxxAb46vO/gyA
Date: Tue, 12 Oct 2021 07:50:28 +0000
Message-ID: <4844DB91-CFE2-4CD7-B3CA-62DDAB171F3F@arm.com>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-2-luca.fancellu@arm.com>
In-Reply-To: <20211011181528.17367-2-luca.fancellu@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.120.0.1.13)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 2d6aba37-afbd-43fe-c237-08d98d54fddd
x-ms-traffictypediagnostic: DB6PR0802MB2183:|AM8PR08MB6500:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6500C2AB7CB57ABF242DEBCE9DB69@AM8PR08MB6500.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:151;OLM:151;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6Tw98ZEXCB2oIBcpgZMvnZAB+7nuRluygtiM6ml135EX9q3DT+PdWObFRdQ//rwpiHxhDljHdh3X1BP+9aSglCd3LOsULC5laMZ/c7zty70+5x8tc6L7oRszmADbbhsj3A3qm190vICbmdlDRDjZozdXCuBV2s+buImSaK7AO7yPgYcXhlulBkXaOKBrbjp/t7cRxvOn+anUyRMVntry8/S9N6jhAh6KGAo8/kQJUMC2YVj9/Wk3aBH7yBD908e9wTCEC7FpvM34dQoCoXcxlB7G/oQhu/6ODqxP9NGLrb54ZTHbyjPt7Uj+AArgXTvXsPsI3mbG66brjO6Pz18WIGGzigHW/rQmJI+BqBTrHt9SZx6hrF/pXJy9Ggn50dQa+aRaCv4uLhDZib+x7elshaPWaNVYeOUd65YVlgpNVLmUFi4oMX19rBK5nvrv+0yFOjaTPjPl6aN9+SCtDxDc14J8gFsfRxaPUq+9Sl3ZTo6bpd30aE9Et0OAKK19VyfZffq3r4NMnFVwpqWPcl3gqW077l9s/4TsYgOhmnuXyAgOGzmMnX9IjuYEaR/WWMYcl6dWxBxtDxTHjViFA2xI+xZlvUVtgL6YaZjhYTgLpH5vi/i7fsJ0NHvUoHsS05nuV6uHUcJLea0vpG9vkOj4RHTdwfXk1eNs0lZPSqNn+4o+qu6Dbp0cG+NMZn77S1qa2KXXAOd07nLKz3qYjMf2EiZfBg27GQOwHZETbSwdD5ftjpD1p78NRQzER0Ugfpq8eitHHl2l/TMdW3m17kYvWcjcdLDujxlhQNwGwukEAGA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0801MB2024.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6862004)(66556008)(86362001)(54906003)(2906002)(33656002)(316002)(30864003)(66476007)(36756003)(37006003)(64756008)(76116006)(66946007)(6512007)(508600001)(2616005)(91956017)(186003)(66446008)(6486002)(6506007)(71200400001)(38070700005)(53546011)(5660300002)(6636002)(8676002)(26005)(83380400001)(8936002)(38100700002)(122000001)(4326008)(21314003)(32563001)(45980500001)(559001)(579004);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <45CD47301E4ED346A1088FD2CED036E9@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2183
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c67b17cc-1033-4992-22cc-08d98d54f55a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/Gy4SxSUaWiF6LEQ9b39JaB9oj8im+krIGyiOCbPCegj89nXFpYh64S2/Da7xrcQti63vAT3EmqXLbxqbT1ChQybGgRfKuYKjDMOtYr+sNHDw49vqROp7lxmmQVAzuXdWrtWbLtpB/61Sl6EMvm0zKdBJ7lLX07TK+HT1J7Fki1rOJ0oiDpj/BCojmjUrCFDsRDzxClBSSk/2WMMdIVMysH6M+fNP99/JGFG+gMuFNF9Bqg7r6aq7whZ+WLpHaBL3qjabKK9PG4aegyf68NLTbmYvg+M3KsqduCV6XSvtvCCt0dkIUbjm74FL8tIU6JDoyIUik8WuhkAYqcWKACqUQxMH7hREgEni2H/PnkLQ0oe/k3U20Dh22n8ST6mUXjTYE6S8qHk6h91Rb0ylNBrpp5fBQ4m2YlDdB5ykCN8NVWfWAPRJ1+xQ1rFGszWdyMt94h0tPbNFW8CXRnYOvc4CBIVkHX6m8PAb3W+rxZDHg3eW9fp403suOFJmS78oghDizDAwDCy+txQQrBrIauginTILU8BJ7MjclH53hBSHUjqIxR3vpUWRBQif1V6YmAB0YLz70y8z/jBYsU63kul/MBk4aPfirsGChaP1oLLAFF1cuVRwAd/AxbrvzkKpIcT0XLnRJIyfw7DZPyMbISz2cjr13t7u3Q6VPZJIY7sMrCW1EgFrEu714dMJbE+0qDsOVlO5zU522RDoP491ijDa4fMA3sMrFmYI/IOTKFucCe4g7FWYceB2huEhEOh+ID2
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36860700001)(356005)(47076005)(4326008)(81166007)(54906003)(86362001)(316002)(508600001)(5660300002)(33656002)(26005)(6512007)(6636002)(6506007)(37006003)(53546011)(6486002)(6862004)(36756003)(8936002)(336012)(70586007)(82310400003)(83380400001)(2616005)(70206006)(186003)(2906002)(30864003)(8676002)(21314003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 07:50:42.4134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d6aba37-afbd-43fe-c237-08d98d54fddd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT059.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6500

Hi Luca,

> On 11 Oct 2021, at 19:15, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>=20
> This patch introduces the support for dom0less configuration
> when using UEFI boot on ARM, it permits the EFI boot to
> continue if no dom0 kernel is specified but at least one domU
> is found.
>=20
> Introduce the new property "xen,uefi-binary" for device tree boot
> module nodes that are subnode of "xen,domain" compatible nodes.
> The property holds a string containing the file name of the
> binary that shall be loaded by the uefi loader from the filesystem.
>=20
> Introduce a new call efi_check_dt_boot(...) called during EFI boot
> that checks for module to be loaded using device tree.
> Architectures that don't support device tree don't have to
> provide this function.
>=20
> Update efi documentation about how to start a dom0less
> setup using UEFI
>=20
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> Changes in v6:
> - change is_boot_module() to check for every multiboot,module
> instead of multiboot,{kernel,ramdisk,device-tree} (Julien), as
> a result of that remove the function and put the check inside of
> handle_module_node(...)
> Changes in v5:
> - Removed unneeded variable initialization
> - Fixed comment
> - Fixed error message for the absence of an initial domain kernel
> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
> message about the call introduction in the EFI boot flow.
> Changes in v4:
> - update uefi,cfg-load to xen,uefi-cfg-load in documentation
> - fixed comments and code style
> - changed variable name from dt_module_found to dt_modules_found
> in boot.c
> - removed stub efi_arch_check_dt_boot from x86 code because the
> architecture does not support DT, protected call with #ifdef
> in the common code.
> - add comment to explain the result from efi_arch_check_dt_boot
> just looking the common code
> - Add space before comment in boot.c
> - renamed uefi,binary property to xen,uefi-binary
> Changes in v3:
> - fixed documentation
> - fixed name len in strlcpy
> - fixed some style issues
> - closed filesystem handle before calling blexit
> - passed runtime errors up to the stack instead
> of calling blexit
> - renamed names and function to make them more
> general in prevision to load also Dom0 kernel
> and ramdisk from DT
> Changes in v2:
> - remove array of struct file
> - fixed some int types
> - Made the code use filesystem even when configuration
> file is skipped.
> - add documentation of uefi,binary in booting.txt
> - add documentation on how to boot all configuration
> for Xen using UEFI in efi.pandoc
> ---
> docs/misc/arm/device-tree/booting.txt |  21 ++
> docs/misc/efi.pandoc                  | 203 +++++++++++++++++
> xen/arch/arm/efi/efi-boot.h           | 299 +++++++++++++++++++++++++-
> xen/common/efi/boot.c                 |  39 +++-
> 4 files changed, 550 insertions(+), 12 deletions(-)
>=20
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device=
-tree/booting.txt
> index 352b0ec43a..7258e7e1ec 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -190,6 +190,13 @@ The kernel sub-node has the following properties:
>=20
>     Command line parameters for the guest kernel.
>=20
> +- xen,uefi-binary (UEFI boot only)
> +
> +    String property that specifies the file name to be loaded by the UEF=
I boot
> +    for this module. If this is specified, there is no need to specify t=
he reg
> +    property because it will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.
> +
> The ramdisk sub-node has the following properties:
>=20
> - compatible
> @@ -201,6 +208,13 @@ The ramdisk sub-node has the following properties:
>     Specifies the physical address of the ramdisk in RAM and its
>     length.
>=20
> +- xen,uefi-binary (UEFI boot only)
> +
> +    String property that specifies the file name to be loaded by the UEF=
I boot
> +    for this module. If this is specified, there is no need to specify t=
he reg
> +    property because it will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.
> +
>=20
> Example
> =3D=3D=3D=3D=3D=3D=3D
> @@ -265,6 +279,13 @@ The dtb sub-node should have the following propertie=
s:
>     Specifies the physical address of the device tree binary fragment
>     RAM and its length.
>=20
> +- xen,uefi-binary (UEFI boot only)
> +
> +    String property that specifies the file name to be loaded by the UEF=
I boot
> +    for this module. If this is specified, there is no need to specify t=
he reg
> +    property because it will be created by the UEFI stub on boot.
> +    This option is needed only when UEFI boot is used.
> +
> As an example:
>=20
>         module@0xc000000 {
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index ed85351541..876cd55005 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -167,3 +167,206 @@ sbsign \
> 	--output xen.signed.efi \
> 	xen.unified.efi
> ```
> +
> +## UEFI boot and dom0less on ARM
> +
> +Dom0less feature is supported by ARM and it is possible to use it when X=
en is
> +started as an EFI application.
> +The way to specify the domU domains is by Device Tree as specified in th=
e
> +[dom0less](dom0less.html) documentation page under the "Device Tree
> +configuration" section, but instead of declaring the reg property in the=
 boot
> +module, the user must specify the "xen,uefi-binary" property containing =
the name
> +of the binary file that has to be loaded in memory.
> +The UEFI stub will load the binary in memory and it will add the reg pro=
perty
> +accordingly.
> +
> +An example here:
> +
> +domU1 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <1>;
> +	compatible =3D "xen,domain";
> +	memory =3D <0 0x20000>;
> +	cpus =3D <1>;
> +	vpl011;
> +
> +	module@1 {
> +		compatible =3D "multiboot,kernel", "multiboot,module";
> +		xen,uefi-binary =3D "vmlinuz-3.0.31-0.4-xen";
> +		bootargs =3D "console=3DttyAMA0";
> +	};
> +	module@2 {
> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
> +		xen,uefi-binary =3D "initrd-3.0.31-0.4-xen";
> +	};
> +	module@3 {
> +		compatible =3D "multiboot,ramdisk", "multiboot,module";
> +		xen,uefi-binary =3D "passthrough.dtb";
> +	};
> +};
> +
> +## How to boot different Xen setup using UEFI
> +
> +These are the different ways to boot a Xen system from UEFI:
> +
> + - Boot Xen and Dom0 (minimum required)
> + - Boot Xen and DomU(s) (true dom0less, only on ARM)
> + - Boot Xen, Dom0 and DomU(s) (only on ARM)
> +
> +### Boot Xen and Dom0
> +
> +This configuration can be started using the Xen configuration file in th=
e
> +example above.
> +
> +### Boot Xen and DomU(s)
> +
> +This configuration needs the domU domain(s) specified in the /chosen nod=
e,
> +examples of how to do that are provided by the documentation about dom0l=
ess
> +and the example above shows how to use the "xen,uefi-binary" property to=
 use the
> +UEFI stub for module loading.
> +When adding DomU modules to device tree, also add the property
> +xen,uefi-cfg-load under chosen for Xen to load the Xen config file.
> +Otherwise, Xen will skip the config file and rely on device tree alone.
> +
> +Example 1 of how to boot a true dom0less configuration:
> +
> +Xen configuration file: skipped.
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells =3D <0x1>;
> +	#address-cells =3D <0x1>;
> +	xen,xen-bootargs =3D "<Xen command line>"
> +
> +	domU1 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu1.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +	domU2 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0x100000>;
> +		vpl011;
> +
> +		module@2 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu2.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +Example 2 of how to boot a true dom0less configuration:
> +
> +Xen configuration file:
> +
> +```
> +[global]
> +default=3Dxen
> +
> +[xen]
> +options=3D<Xen command line>
> +dtb=3D<optional DTB>
> +```
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells =3D <0x1>;
> +	#address-cells =3D <0x1>;
> +	xen,uefi-cfg-load;
> +
> +	domU1 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu1.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +	domU2 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0x100000>;
> +		vpl011;
> +
> +		module@2 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu2.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +### Boot Xen, Dom0 and DomU(s)
> +
> +This configuration is a mix of the two configuration above, to boot this=
 one
> +the configuration file must be processed so the /chosen node must have t=
he
> +"xen,uefi-cfg-load" property.
> +
> +Here an example:
> +
> +Xen configuration file:
> +
> +```
> +[global]
> +default=3Dxen
> +
> +[xen]
> +options=3D<Xen command line>
> +kernel=3Dvmlinuz-3.0.31-0.4-xen [domain 0 command line options]
> +ramdisk=3Dinitrd-3.0.31-0.4-xen
> +dtb=3D<optional DTB>
> +```
> +
> +Device tree:
> +
> +```
> +chosen {
> +	#size-cells =3D <0x1>;
> +	#address-cells =3D <0x1>;
> +	xen,uefi-cfg-load;
> +
> +	domU1 {
> +		#size-cells =3D <0x1>;
> +		#address-cells =3D <0x1>;
> +		compatible =3D "xen,domain";
> +		cpus =3D <0x1>;
> +		memory =3D <0x0 0xc0000>;
> +		vpl011;
> +
> +		module@1 {
> +			compatible =3D "multiboot,kernel", "multiboot,module";
> +			xen,uefi-binary =3D "Image-domu1.bin";
> +			bootargs =3D "console=3DttyAMA0 root=3D/dev/ram0 rw";
> +		};
> +	};
> +};
> +```
> +
> +
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index a3e46453d4..f35e035b22 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -8,9 +8,49 @@
> #include <asm/setup.h>
> #include <asm/smp.h>
>=20
> +typedef struct {
> +    char *name;
> +    unsigned int name_len;
> +    EFI_PHYSICAL_ADDRESS addr;
> +    UINTN size;
> +} module_name;
> +
> +/*
> + * Binaries will be translated into bootmodules, the maximum number for =
them is
> + * MAX_MODULES where we should remove a unit for Xen and one for Xen DTB
> + */
> +#define MAX_UEFI_MODULES (MAX_MODULES - 2)
> +static struct file __initdata module_binary;
> +static module_name __initdata modules[MAX_UEFI_MODULES];
> +static unsigned int __initdata modules_available =3D MAX_UEFI_MODULES;
> +static unsigned int __initdata modules_idx;
> +
> +#define ERROR_BINARY_FILE_NOT_FOUND (-1)
> +#define ERROR_ALLOC_MODULE_NO_SPACE (-1)
> +#define ERROR_ALLOC_MODULE_NAME     (-2)
> +#define ERROR_MISSING_DT_PROPERTY   (-3)
> +#define ERROR_RENAME_MODULE_NAME    (-4)
> +#define ERROR_SET_REG_PROPERTY      (-5)
> +#define ERROR_CHECK_MODULE_COMPAT   (-6)
> +#define ERROR_DT_MODULE_DOMU        (-1)
> +#define ERROR_DT_CHOSEN_NODE        (-2)
> +
> void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
> void __flush_dcache_area(const void *vaddr, unsigned long size);
>=20
> +static int get_module_file_index(const char *name, unsigned int name_len=
);
> +static void PrintMessage(const CHAR16 *s);
> +static int allocate_module_file(EFI_FILE_HANDLE dir_handle,
> +                                const char *name,
> +                                unsigned int name_len);
> +static int handle_module_node(EFI_FILE_HANDLE dir_handle,
> +                              int module_node_offset,
> +                              int reg_addr_cells,
> +                              int reg_size_cells);
> +static int handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle,
> +                                       int domain_node);
> +static int efi_check_dt_boot(EFI_FILE_HANDLE dir_handle);
> +
> #define DEVICE_TREE_GUID \
> {0xb1b621d5, 0xf19c, 0x41a5, {0x83, 0x0b, 0xd9, 0x15, 0x2c, 0x69, 0xaa, 0=
xe0}}
>=20
> @@ -552,8 +592,254 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
>                          kernel.size) < 0 )
>             blexit(L"Unable to set reg property.");
>     }
> -    else
> +    else if ( file !=3D &module_binary )
> +        /*
> +         * If file is not a dom0 module file and it's not a domU module,
> +         * stop here.
> +         */
>         blexit(L"Unknown module type");
> +
> +    /*
> +     * modules_available is decremented here because for each dom0 file =
added
> +     * from the configuration file, there will be an additional bootmodu=
le,
> +     * so the number of available slots will be decremented because ther=
e is a
> +     * maximum amount of bootmodules that can be loaded.
> +     */
> +    modules_available--;
> +}
> +
> +/*
> + * This function checks for a binary previously loaded with a give name,=
 it
> + * returns the index of the file in the modules array or a negative numb=
er if no
> + * file with that name is found.
> + */
> +static int __init get_module_file_index(const char *name,
> +                                        unsigned int name_len)
> +{
> +    unsigned int i;
> +    int ret =3D ERROR_BINARY_FILE_NOT_FOUND;
> +
> +    for ( i =3D 0; i < modules_idx; i++ )
> +    {
> +        module_name *mod =3D &modules[i];
> +        if ( (mod->name_len =3D=3D name_len) &&
> +             (strncmp(mod->name, name, name_len) =3D=3D 0) )
> +        {
> +            ret =3D i;
> +            break;
> +        }
> +    }
> +    return ret;
> +}
> +
> +static void __init PrintMessage(const CHAR16 *s)
> +{
> +    PrintStr(s);
> +    PrintStr(newline);
> +}
> +
> +/*
> + * This function allocates a binary and keeps track of its name, it retu=
rns the
> + * index of the file in the modules array or a negative number on error.
> + */
> +static int __init allocate_module_file(EFI_FILE_HANDLE dir_handle,
> +                                       const char *name,
> +                                       unsigned int name_len)
> +{
> +    module_name *file_name;
> +    union string module_name;
> +    int ret;
> +
> +    /*
> +     * Check if there is any space left for a module, the variable
> +     * modules_available is updated each time we use read_file(...)
> +     * successfully.
> +     */
> +    if ( !modules_available )
> +    {
> +        PrintMessage(L"No space left for modules");
> +        return ERROR_ALLOC_MODULE_NO_SPACE;
> +    }
> +
> +    module_name.cs =3D name;
> +    ret =3D modules_idx;
> +
> +    /* Save at this index the name of this binary */
> +    file_name =3D &modules[ret];
> +
> +    if ( efi_bs->AllocatePool(EfiLoaderData, (name_len + 1) * sizeof(cha=
r),
> +                              (void**)&file_name->name) !=3D EFI_SUCCESS=
 )
> +    {
> +        PrintMessage(L"Error allocating memory for module binary name");
> +        return ERROR_ALLOC_MODULE_NAME;
> +    }
> +
> +    /* Save name and length of the binary in the data structure */
> +    strlcpy(file_name->name, name, name_len + 1);
> +    file_name->name_len =3D name_len;
> +
> +    /* Load the binary in memory */
> +    read_file(dir_handle, s2w(&module_name), &module_binary, NULL);
> +
> +    /* Save address and size */
> +    file_name->addr =3D module_binary.addr;
> +    file_name->size =3D module_binary.size;
> +
> +    /* s2w(...) allocates some memory, free it */
> +    efi_bs->FreePool(module_name.w);
> +
> +    modules_idx++;
> +
> +    return ret;
> +}
> +
> +/*
> + * This function checks for the presence of the xen,uefi-binary property=
 in the
> + * module, if found it loads the binary as module and sets the right add=
ress
> + * for the reg property into the module DT node.
> + */
> +static int __init handle_module_node(EFI_FILE_HANDLE dir_handle,
> +                                     int module_node_offset,
> +                                     int reg_addr_cells,
> +                                     int reg_size_cells)
> +{
> +    const void *uefi_name_prop;
> +    char mod_string[24]; /* Placeholder for module@ + a 64-bit number + =
\0 */
> +    int uefi_name_len, file_idx, module_compat;
> +    module_name *file;
> +
> +    /* Check if the node is a multiboot,module otherwise return */
> +    module_compat =3D fdt_node_check_compatible(fdt, module_node_offset,
> +                                              "multiboot,module");
> +    if ( module_compat < 0 )
> +        /* Error while checking the compatible string */
> +        return ERROR_CHECK_MODULE_COMPAT;
> +
> +    if ( module_compat !=3D 0 )
> +        /* Module is not a multiboot,module */
> +        return 0;
> +
> +    /* Read xen,uefi-binary property to get the file name. */
> +    uefi_name_prop =3D fdt_getprop(fdt, module_node_offset, "xen,uefi-bi=
nary",
> +                                 &uefi_name_len);
> +
> +    if ( !uefi_name_prop )
> +        /* Property not found */
> +        return 0;
> +
> +    file_idx =3D get_module_file_index(uefi_name_prop, uefi_name_len);
> +    if ( file_idx < 0 )
> +    {
> +        file_idx =3D allocate_module_file(dir_handle, uefi_name_prop,
> +                                        uefi_name_len);
> +        if ( file_idx < 0 )
> +            return file_idx;
> +    }
> +
> +    file =3D &modules[file_idx];
> +
> +    snprintf(mod_string, sizeof(mod_string), "module@%"PRIx64, file->add=
r);
> +
> +    /* Rename the module to be module@{address} */
> +    if ( fdt_set_name(fdt, module_node_offset, mod_string) < 0 )
> +    {
> +        PrintMessage(L"Unable to modify module node name.");
> +        return ERROR_RENAME_MODULE_NAME;
> +    }
> +
> +    if ( fdt_set_reg(fdt, module_node_offset, reg_addr_cells, reg_size_c=
ells,
> +                     file->addr, file->size) < 0 )
> +    {
> +        PrintMessage(L"Unable to set module reg property.");
> +        return ERROR_SET_REG_PROPERTY;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * This function checks for boot modules under the domU guest domain nod=
e
> + * in the DT.
> + * Returns 0 on success, negative number on error.
> + */
> +static int __init handle_dom0less_domain_node(EFI_FILE_HANDLE dir_handle=
,
> +                                              int domain_node)
> +{
> +    int module_node, addr_cells, size_cells, len;
> +    const struct fdt_property *prop;
> +
> +    /* Get #address-cells and #size-cells from domain node */
> +    prop =3D fdt_get_property(fdt, domain_node, "#address-cells", &len);
> +    if ( !prop )
> +    {
> +        PrintMessage(L"#address-cells not found in domain node.");
> +        return ERROR_MISSING_DT_PROPERTY;
> +    }
> +
> +    addr_cells =3D fdt32_to_cpu(*((uint32_t *)prop->data));
> +
> +    prop =3D fdt_get_property(fdt, domain_node, "#size-cells", &len);
> +    if ( !prop )
> +    {
> +        PrintMessage(L"#size-cells not found in domain node.");
> +        return ERROR_MISSING_DT_PROPERTY;
> +    }
> +
> +    size_cells =3D fdt32_to_cpu(*((uint32_t *)prop->data));
> +
> +    /* Check for nodes compatible with multiboot,module inside this node=
 */
> +    for ( module_node =3D fdt_first_subnode(fdt, domain_node);
> +          module_node > 0;
> +          module_node =3D fdt_next_subnode(fdt, module_node) )
> +    {
> +        int ret =3D handle_module_node(dir_handle, module_node, addr_cel=
ls,
> +                                        size_cells);
> +        if ( ret < 0 )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +/*
> + * This function checks for xen domain nodes under the /chosen node for =
possible
> + * domU guests to be loaded.
> + * Returns the number of modules loaded or a negative number for error.
> + */
> +static int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +{
> +    int chosen, node, addr_len, size_len;
> +    unsigned int i =3D 0;
> +
> +    /* Check for the chosen node in the current DTB */
> +    chosen =3D setup_chosen_node(fdt, &addr_len, &size_len);
> +    if ( chosen < 0 )
> +    {
> +        PrintMessage(L"Unable to setup chosen node");
> +        return ERROR_DT_CHOSEN_NODE;
> +    }
> +
> +    /* Check for nodes compatible with xen,domain under the chosen node =
*/
> +    for ( node =3D fdt_first_subnode(fdt, chosen);
> +          node > 0;
> +          node =3D fdt_next_subnode(fdt, node) )
> +    {
> +        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
> +        {
> +            /* Found a node with compatible xen,domain; handle this node=
. */
> +            if ( handle_dom0less_domain_node(dir_handle, node) < 0 )
> +                return ERROR_DT_MODULE_DOMU;
> +        }
> +    }
> +
> +    /* Free boot modules file names if any */
> +    for ( ; i < modules_idx; i++ )
> +    {
> +        /* Free boot modules binary names */
> +        efi_bs->FreePool(modules[i].name);
> +    }
> +
> +    return modules_idx;
> }
>=20
> static void __init efi_arch_cpu(void)
> @@ -562,8 +848,19 @@ static void __init efi_arch_cpu(void)
>=20
> static void __init efi_arch_blexit(void)
> {
> +    unsigned int i =3D 0;
> +
>     if ( dtbfile.need_to_free )
>         efi_bs->FreePages(dtbfile.addr, PFN_UP(dtbfile.size));
> +    /* Free boot modules file names if any */
> +    for ( ; i < modules_idx; i++ )
> +    {
> +        /* Free boot modules binary names */
> +        efi_bs->FreePool(modules[i].name);
> +        /* Free modules binaries */
> +        efi_bs->FreePages(modules[i].addr,
> +                          PFN_UP(modules[i].size));
> +    }
>     if ( memmap )
>         efi_bs->FreePool(memmap);
> }
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 758f9d74d2..7879b93f93 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>     StdErr->OutputString(StdErr, (CHAR16 *)s );
> }
>=20
> +#ifndef CONFIG_HAS_DEVICE_TREE
> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> +{
> +    return 0;
> +}
> +#endif
> +
> /*
>  * Include architecture specific implementation here, which references th=
e
>  * static globals defined above.
> @@ -1136,6 +1143,8 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>     bool base_video =3D false;
>     const char *option_str;
>     bool use_cfg_file;
> +    int dt_modules_found;
> +    EFI_FILE_HANDLE dir_handle;
>=20
>     __set_bit(EFI_BOOT, &efi_flags);
>     __set_bit(EFI_LOADER, &efi_flags);
> @@ -1216,9 +1225,11 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE=
 *SystemTable)
>=20
>     efi_arch_relocate_image(0);
>=20
> +    /* Get the file system interface. */
> +    dir_handle =3D get_parent_handle(loaded_image, &file_name);
> +
>     if ( use_cfg_file )
>     {
> -        EFI_FILE_HANDLE dir_handle;
>         UINTN depth, cols, rows, size;
>=20
>         size =3D cols =3D rows =3D depth =3D 0;
> @@ -1229,9 +1240,6 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE =
*SystemTable)
>=20
>         gop =3D efi_get_gop();
>=20
> -        /* Get the file system interface. */
> -        dir_handle =3D get_parent_handle(loaded_image, &file_name);
> -
>         /* Read and parse the config file. */
>         if ( read_section(loaded_image, L"config", &cfg, NULL) )
>             PrintStr(L"Using builtin config file\r\n");
> @@ -1285,14 +1293,12 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>             efi_bs->FreePool(name.w);
>         }
>=20
> -        if ( !name.s )
> -            blexit(L"No Dom0 kernel image specified.");
> -
>         efi_arch_cfg_file_early(loaded_image, dir_handle, section.s);
>=20
> -        option_str =3D split_string(name.s);
> +        option_str =3D name.s ? split_string(name.s) : NULL;
>=20
> -        if ( !read_section(loaded_image, L"kernel", &kernel, option_str)=
 )
> +        if ( !read_section(loaded_image, L"kernel", &kernel, option_str)=
 &&
> +             name.s )
>         {
>             read_file(dir_handle, s2w(&name), &kernel, option_str);
>             efi_bs->FreePool(name.w);
> @@ -1361,12 +1367,23 @@ efi_start(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABL=
E *SystemTable)
>         efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>         cfg.addr =3D 0;
>=20
> -        dir_handle->Close(dir_handle);
> -
>         if ( gop && !base_video )
>             gop_mode =3D efi_find_gop_mode(gop, cols, rows, depth);
>     }
>=20
> +    /* Get the number of boot modules specified on the DT or an error (<=
0) */
> +    dt_modules_found =3D efi_check_dt_boot(dir_handle);
> +
> +    dir_handle->Close(dir_handle);
> +
> +    if ( dt_modules_found < 0 )
> +        /* efi_check_dt_boot throws some error */
> +        blexit(L"Error processing boot modules on DT.");
> +
> +    /* Check if at least one of Dom0 or DomU(s) is specified */
> +    if ( !dt_modules_found && !kernel.ptr )
> +        blexit(L"No initial domain kernel specified.");
> +
>     efi_arch_edd();
>=20
>     /* XXX Collect EDID info. */
> --=20
> 2.17.1
>=20
>=20


