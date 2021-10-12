Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A50429F63
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 10:08:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206851.362513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCpC-000712-Kv; Tue, 12 Oct 2021 08:07:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206851.362513; Tue, 12 Oct 2021 08:07:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maCpC-0006xl-HQ; Tue, 12 Oct 2021 08:07:50 +0000
Received: by outflank-mailman (input) for mailman id 206851;
 Tue, 12 Oct 2021 08:07:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GT6b=PA=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1maCpB-0006xa-2e
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 08:07:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::600])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 94f1b6bf-6752-434a-9829-907c4fdaee9c;
 Tue, 12 Oct 2021 08:07:46 +0000 (UTC)
Received: from DB6PR0802CA0043.eurprd08.prod.outlook.com (2603:10a6:4:a3::29)
 by DB6PR0801MB1655.eurprd08.prod.outlook.com (2603:10a6:4:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Tue, 12 Oct
 2021 08:07:44 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::1d) by DB6PR0802CA0043.outlook.office365.com
 (2603:10a6:4:a3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Tue, 12 Oct 2021 08:07:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Tue, 12 Oct 2021 08:07:44 +0000
Received: ("Tessian outbound a8bfe25d7364:v103");
 Tue, 12 Oct 2021 08:07:44 +0000
Received: from d27ff33f5bd3.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EC4E6E52-82EE-4763-B4A0-55AB8B0D21A9.1; 
 Tue, 12 Oct 2021 08:07:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d27ff33f5bd3.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 12 Oct 2021 08:07:33 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PA4PR08MB5968.eurprd08.prod.outlook.com (2603:10a6:102:e9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Tue, 12 Oct
 2021 08:07:31 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 08:07:31 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:188::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.14 via Frontend Transport; Tue, 12 Oct 2021 08:07:30 +0000
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
X-Inumbo-ID: 94f1b6bf-6752-434a-9829-907c4fdaee9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LqK2djBglZ6W876FhQQNQJ/B9g3vWex0Q3gE7gNLhs=;
 b=Q6JjPFsoiuLEDRf3pD1NunujOvaI/pqtqYI//DFm0FVdf3FShcF2kH5JEw6RZIQhBnMBiifkxxs/3yM71E4+TiXSZD7cS5FdcCGXk/n3JQJtzccJBXILqzt7PrMi4ByB4OUWN66HYJ7wkvSL0QGDqBsugCjHjp25r7o5+8Qs7fE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bf6a822aa4925aac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SCIImYdmKt5vEppc89yj143IAEg9McjGhXlvze647EDhTdHSUBJCXuUVTiztDWskAX1fyzwFHP8jbhDkzCe8uTVtCBL++cm9ogziHTrF4gRXLwBX2GZcSDc3RpDHzlBDjLvNzLoLH7fuq2rodRCGFsk6w+/ekmytPYPw/uc/fFoNgk8/PkoR48MD+G+2/tzHgXCQMkaZE3Qk2aNM7VYycb6M2V/S1JIC+Lx6foKAg3I77Slj2uT+NdNl4/DjvY536LcztfCj2icavaGHyroYQ3brno2sAC5a/aZfkaoEqGFJnuVc/VDFLjte+CASx4UE0LAsKG/4DbBKc0PQVvco+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LqK2djBglZ6W876FhQQNQJ/B9g3vWex0Q3gE7gNLhs=;
 b=BrAR9eILzIvTnTdTo7lK7M36FkEfWCqE7nZk0GXDCtPZTqZu40Ko4Yv+lT8PjtCD5ozRZcU4Rr2wV1C8cBsBYygKdy6rAMXC7yCuUlgyzee7f3BrK+Ylqx6rhQ4ojGZkbnrZkzBWq89p609w+2dCDGktsHZrEt4fHU+nnxXAXMkw+LNqwdHZsLazAA8kYxtelcBKdZ++Y+K8fBmJ9VoJPwgIp9Grsk/8CZN6k81sbgAzYXdtqYYYiq++uvPLT5Wn+qjflaap4trh/MI7nCFmheBSbKtEa9Ewv2PllYNZqNtxXbSNy2kJlmryQicmcWT7dOlKAlcjCjT/k+M6+Nv3hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LqK2djBglZ6W876FhQQNQJ/B9g3vWex0Q3gE7gNLhs=;
 b=Q6JjPFsoiuLEDRf3pD1NunujOvaI/pqtqYI//DFm0FVdf3FShcF2kH5JEw6RZIQhBnMBiifkxxs/3yM71E4+TiXSZD7cS5FdcCGXk/n3JQJtzccJBXILqzt7PrMi4ByB4OUWN66HYJ7wkvSL0QGDqBsugCjHjp25r7o5+8Qs7fE=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 2/2] arm/efi: load dom0 modules from DT using UEFI
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s>
Date: Tue, 12 Oct 2021 09:07:24 +0100
Cc: Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <81EA782B-762E-4B8A-8D33-EC79203439BC@arm.com>
References: <20211011181528.17367-1-luca.fancellu@arm.com>
 <20211011181528.17367-3-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2110111243290.25528@sstabellini-ThinkPad-T480s>
 <EC7165F9-09CE-4001-93ED-FA637F5ED36C@arm.com>
 <alpine.DEB.2.21.2110111415350.25528@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110111423310.25528@sstabellini-ThinkPad-T480s>
 <29cc47f2-4727-0397-db0c-a6c1f5a52bf7@xen.org>
 <alpine.DEB.2.21.2110111813510.25528@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0148.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::9) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b17df41a-2d2f-4577-0ec7-08d98d575f11
X-MS-TrafficTypeDiagnostic: PA4PR08MB5968:|DB6PR0801MB1655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB16555F067153307B57B0B991E4B69@DB6PR0801MB1655.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KPPd/PzlQcoN7PNAkbScLpl3SqR6RY9Ur+WaCRnMTSuBshFfqcQigO3upwlZ3TTB+XLmd6uGk26ukSuHypfFoDX/UTHOQuHfrkkWDiWWURsENY1JLr+ApbhMUkUJ5zrPgE6sW4J9DoESt4CPnCYs/D/i3glutb1f2+UKRAA59aPremO8PDE+LzISuAbNP1XriM6RcV1smjXUj5+sKy9UCrCNxiOno62WrKJVOXrX2mumcNIx+3SIY+6SrrjZGU8Z9mTkrgDdUv1U0WSIFyfl65hfe/Tcvw8T0FIVijfQgx5tg+UKASZRxBvIrV22VjGipKS91Ot5oOdOE84FCNM8AEALSkABEnI0oKhQa4DTvXh0ul9bIKKn5CxtN/COTx+3u9y4SVw5GNLdTxtGTWhZ07NmoUaSJiq7diVwS8LIw1Bs4507svbO8ZTvtgFGGK5Ro0oDF6BehRw3/yWy8Y/C8m2qOXi8k1Oqk0BL6nz7HQ1tgfWsClQTa1TBC4vA09N9zcVC5lN/6KqpTGsnE64s0R6Kaw5ea2N9KaDlZag0bJtctK7wY9csD0mknsV0Ei3lCix3ZKdsl1ukkVJRJz6Iu5JX8SHXE3rzf98LPDeYytopxmk49DyKcswiBFECHcJP8zv2NrM4iFyBvBlVz5mjGfxEBsy0Ij+wLZexO52umH78PIzjvl6L7RQuoWxR6zeKkDLcZJfzxC7zLi8VZQOC2IIzJhByUnfbigoW9xXupQI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(38100700002)(4326008)(36756003)(6512007)(33656002)(54906003)(6486002)(26005)(44832011)(6916009)(5660300002)(186003)(38350700002)(8936002)(66556008)(316002)(8676002)(2616005)(66946007)(53546011)(2906002)(956004)(83380400001)(52116002)(86362001)(6506007)(508600001)(6666004)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5968
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	07f42f20-fbc6-45b0-36d5-08d98d575733
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e5bI/jRlBja4DK1eOqZBxptarcZ1z2lPNn6dtxslYimSGDqCD+JYVEDL/nvMmUBDJXN45yLJLlXk9YqFcjz1M7rafMJigzTGtXr3A+HmO8x2mH/LysEIWmXcXGwQV9ZEXYpkPWR6r57+49WE2psydOAocc85rhc/Hj5k/lG5O1vYHvCj57NOzmnwAFLzZzAWEstO+DojVick5j5P8w28ayPdJPr5lCv6lp6z/WMciQQ5fOonxrOrHwj07Eg+rxxcmMda5i38JVocORRARJOCqumyVz5j015+whKRLYMdx6xjdP1oKVqy20nqEcSUmq+p+GyEt09Zkrn/qYasXBsuUedwAjrsYZGQxjxWFBotoLLMZswWcJpjxIMpN1yvABu1j1jx4LZVzeCpYMcM9zspippPhTsCVOKI45nd3TbSfwizxEJRnYxP6IIGgB2d7ZMRVV0aMR/rnF8kELz7LAQ+tMP5ihcMnVUIZYSAf3B8ybGaxeSB9DHWwduOArpsceWRClF3rKS9qhlggGEoKoyphm0O+o7b8Lpj613F7bAUKl9x/QHvXtimAHhxmDHPLjxlZmwAvzdSU5CqmgvtDUIRP3F/Ngpn6rOUP/DBlwt/r5sah0nWSNvSUr7Xhw/fl/ko7N1+nyaJnModJbOLI/vbhXKX0Sw1FmGzTDtxGrhck6XdF81wREplVHpizqtgVckevGU28GKHlsHoNXM3VjBtvA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(316002)(36860700001)(6862004)(54906003)(47076005)(508600001)(86362001)(8676002)(4326008)(2906002)(5660300002)(36756003)(44832011)(6506007)(6512007)(83380400001)(26005)(336012)(6666004)(2616005)(8936002)(70206006)(956004)(6486002)(70586007)(81166007)(186003)(33656002)(53546011)(356005)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 08:07:44.6200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b17df41a-2d2f-4577-0ec7-08d98d575f11
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1655



> On 12 Oct 2021, at 02:31, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> On Mon, 11 Oct 2021, Julien Grall wrote:
>> Hi Stefano,
>>=20
>> On 11/10/2021 22:24, Stefano Stabellini wrote:
>>>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>>>> index 840728d6c0..076b827bdd 100644
>>>> --- a/xen/arch/arm/efi/efi-boot.h
>>>> +++ b/xen/arch/arm/efi/efi-boot.h
>>>> @@ -713,10 +713,12 @@ static int __init handle_module_node(EFI_FILE_HA=
NDLE
>>>> dir_handle,
>>>>      char mod_string[24]; /* Placeholder for module@ + a 64-bit number=
 +
>>>> \0 */
>>>>      int uefi_name_len, file_idx, module_compat;
>>>>      module_name *file;
>>>> +    const char *compat_string =3D is_domu_module ? "multiboot,module"=
 :
>>>> +                                "xen,multiboot-module";
>>>>        /* Check if the node is a multiboot,module otherwise return */
>>>>      module_compat =3D fdt_node_check_compatible(fdt, module_node_offs=
et,
>>>> -                                              "multiboot,module");
>>>> +                                              compat_string);
>>>>      if ( module_compat < 0 )
>>>>          /* Error while checking the compatible string */
>>>>          return ERROR_CHECK_MODULE_COMPAT;
>>>=20
>>>=20
>>> Well... not exactly like this because this would stop a normal
>>> "multiboot,module" dom0 kernel from being recognized.
>>>=20
>>> So we need for domU: only "multiboot,module"
>>> For Dom0, either "multiboot,module" or "xen,multiboot-module"
>>=20
>> Looking at the history, xen,multiboot-module has been considered as a le=
gacy
>> binding since before UEFI was introduced. In fact, without this series, =
I
>> believe, there is limited reasons for the compatible to be present in th=
e DT
>> as you would either use grub (which use the new compatible) or xen.cfg (=
the
>> stub will create the node).
>>=20
>> So I would argue that this compatible should not be used in combination =
with
>> UEFI and therefore we should not handle it. This would make the code sim=
pler
>> :).
>=20

Hi Stefano,

> What you suggested is a viable option, however ImageBuilder is still
> using the "xen,multiboot-module" format somehow today (no idea why) and
> we have the following written in docs/misc/arm/device-tree/booting.txt:
>=20
> 	Xen 4.4 supported a different set of legacy compatible strings
> 	which remain supported such that systems supporting both 4.4
> 	and later can use a single DTB.
>=20
> 	- "xen,multiboot-module" equivalent to "multiboot,module"
> 	- "xen,linux-zimage"     equivalent to "multiboot,kernel"
> 	- "xen,linux-initrd"     equivalent to "multiboot,ramdisk"
>=20
> 	For compatibility with Xen 4.4 the more specific "xen,linux-*"
> 	names are non-optional and must be included.
>=20
> My preference is to avoid breaking compatibility (even with UEFI
> booting). The way I suggested above is one way to do it.
>=20
> But I don't feel strongly about this at all, I am fine with ignoring
> "xen,multiboot-module" in the EFI stub. I can get ImageBuilder fixed
> very quickly (I should do that in any case). If we are going to ignore
> "xen,multiboot-module" then we probably want to update the text in
> docs/misc/arm/device-tree/booting.txt also.

The changes to support legacy compatible strings can be done but it will re=
sult in
complex code, I would go for Julien suggestion to just drop it for UEFI.

I can add a note on docs/misc/arm/device-tree/booting.txt saying that for U=
EFI boot
the legacy strings are not supported.

Something like:

--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -51,6 +51,8 @@ Each node contains the following properties:
        Xen 4.4 supported a different set of legacy compatible strings
        which remain supported such that systems supporting both 4.4
        and later can use a single DTB.
+       However when booting Xen using UEFI and Device Tree, the legacy com=
patible
+       strings are not supported.
=20
        - "xen,multiboot-module" equivalent to "multiboot,module"
        - "xen,linux-zimage"     equivalent to "multiboot,kernel=E2=80=9D


What do you think about that?

Cheers,
Luca


