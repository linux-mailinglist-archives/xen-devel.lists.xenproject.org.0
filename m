Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E17428929
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 10:51:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205499.360812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr1S-0008HF-2b; Mon, 11 Oct 2021 08:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205499.360812; Mon, 11 Oct 2021 08:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZr1R-0008En-Uk; Mon, 11 Oct 2021 08:51:01 +0000
Received: by outflank-mailman (input) for mailman id 205499;
 Mon, 11 Oct 2021 08:51:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RBe3=O7=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1mZr1P-0008ED-Ob
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 08:51:00 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.62]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 64b8e85d-1ddd-4da8-a113-8a6d3d4ea5f0;
 Mon, 11 Oct 2021 08:50:55 +0000 (UTC)
Received: from DB6PR0301CA0101.eurprd03.prod.outlook.com (2603:10a6:6:30::48)
 by HE1PR08MB2699.eurprd08.prod.outlook.com (2603:10a6:7:2b::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 08:50:52 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::cf) by DB6PR0301CA0101.outlook.office365.com
 (2603:10a6:6:30::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24 via Frontend
 Transport; Mon, 11 Oct 2021 08:50:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.18 via Frontend Transport; Mon, 11 Oct 2021 08:50:52 +0000
Received: ("Tessian outbound 16951d3c485e:v103");
 Mon, 11 Oct 2021 08:50:51 +0000
Received: from e2be65802ed0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAA79341-688D-4524-B57D-D1B83F628C0D.1; 
 Mon, 11 Oct 2021 08:50:43 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e2be65802ed0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 11 Oct 2021 08:50:43 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR2PR08MB4714.eurprd08.prod.outlook.com (2603:10a6:101:1c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Mon, 11 Oct
 2021 08:50:38 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::c1b4:db1c:376f:b697%8]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 08:50:38 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:196::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.21 via Frontend Transport; Mon, 11 Oct 2021 08:50:37 +0000
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
X-Inumbo-ID: 64b8e85d-1ddd-4da8-a113-8a6d3d4ea5f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0uTVE8hQkWtE8VbaH78xqD6v1MTWkKS3ijmGd5/q0o=;
 b=bg4tRIpYTqqpVqaguh5DQMxyUpR4mBQhff8zqfPeI0ekDOGfq1z1WCK8HLVWt1X7pBocheD2DnTemAmJQ3wqtUrdORwfpoQV+zcqXKV6/w++seth1Jd+CvCItx7+dgPnr4Yt7QfWpX0O3EFuh0UqUnhrMyMra6wnW+iKppxnF4I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 87776f74f76e384b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HeTuEQopruXBB6eMAz9RQ9C1HPFvuoSqWfpwMSrFfByfA0b1ipoh0hP/N3sBQfDBnOVRqrqJ9Y54bI1D743+3Vx/uFN9HcvNKQx97iYg0IM8FGVSmNov4cymaplJfFPgqvzEeOzpPyrWFtwMb9DdQo7H3Ys6tnf5EGC4WG0bk2nHbe5MNffGUGrVcJTB9cMt1X9NYdMEhVOm9pGFABleTJJsOd3qTBwLMB+lRJzxan/GT9hcaWo94o/iz8uQBMYlJszHwh+yxv+pdYymFNCSr6UPQmeCcvL4HiUBrKGzxvKryTa2mBrOBE+Mx+xW/qrpMdgAniyKTd7M5sybKm69WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0uTVE8hQkWtE8VbaH78xqD6v1MTWkKS3ijmGd5/q0o=;
 b=TyWkrVGR5aNYoUPa+FNGnwSpGD6WM5Uug1fzo98cxMrW6M4ircVBiASoade6xPbWoE9ryFlp34c2EL3FpqussXyWYGmQmiN0thNu+mgdwLgELaN8MtGICLqMdvu16W048Sue7Jhbir3TIpfuUE9OWI8CiF1nXDCK3a9ej8KqjpOxWiPsECIOHWg2qp2oFDmMZw7/OSsX16RxX0bfhUu4lh9Cc1bbdPHNLQcWCg1fxMUJBd1bOrs2n3/1EnFvNCvY/rb7sOOlTJ435k4VbyOpPaFo9cJxQtkEIuB1q0adXB420lXD/4H68bB4C0zWXdD2spu0zdHM1hC5KNcTdw0Amw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0uTVE8hQkWtE8VbaH78xqD6v1MTWkKS3ijmGd5/q0o=;
 b=bg4tRIpYTqqpVqaguh5DQMxyUpR4mBQhff8zqfPeI0ekDOGfq1z1WCK8HLVWt1X7pBocheD2DnTemAmJQ3wqtUrdORwfpoQV+zcqXKV6/w++seth1Jd+CvCItx7+dgPnr4Yt7QfWpX0O3EFuh0UqUnhrMyMra6wnW+iKppxnF4I=
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v5 1/2] arm/efi: Use dom0less configuration when using EFI
 boot
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com>
Date: Mon, 11 Oct 2021 09:50:31 +0100
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
Content-Transfer-Encoding: 7bit
Message-Id: <9D5D9F7A-F399-4C8C-80A6-C3B8452729D0@arm.com>
References: <20211011080302.24203-1-luca.fancellu@arm.com>
 <20211011080302.24203-2-luca.fancellu@arm.com>
 <d7acbd79-fca0-f388-5304-9f85dba304fc@suse.com>
To: Jan Beulich <jbeulich@suse.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-ClientProxiedBy: LO4P123CA0299.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::16) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388c7982-ead0-4241-b36d-08d98c943ae3
X-MS-TrafficTypeDiagnostic: PR2PR08MB4714:|HE1PR08MB2699:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB269944D3A02782F9D25886B8E4B59@HE1PR08MB2699.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:378;OLM:378;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yCR7m6xFXHbcQVbocNzP04VRitgXUKNX9KBlhNmi7Rs3NQemnVIvZvRPBIr2MCm1eGqvG6kwiwoF0hJYG48Qa2d8VYcrzSHU1oXa+94A31VHgmsgg98xdaJuICwwE2qvIujcZ3pTyS+LYK09Obu9qKnJx6UlZZ0sDG3E9hrvbD2j04zlgDjcBiR2yqU8E5zP9UUz+V/bGqgOHLGrVya+hYoqP8qlvqCtG9RDWuWzJgOJrKdEug/LV2qPD8++a3A7lt0Pkms9j6Ct1Is2wobAdtiyk6bmEi4mNna0X1nbs9Lp2yyQl86irdaGcC5IHm01Fh801jhAigIanCivQbsivUAQKZAoZQm8F5I5T4rcAkP+IfMtfB/zabkCklpIo3w0EQ48X+iSPYp2xT+DGo+XNbnBKU/p3laEKZivgcW4/tDkfUPatkJtEfL28T6rfmLQBtwbw817yig/hcHSprfmlSlpq2unFX3MgSiqBHVeueVRMFFrOUeDpgV7VWiGXJFNhuNZAlXSiYmy6832JNjow539TaOiCep8Z35RzMRLiUie2nic2mv85OTqZ7UJdpKrDvZO/ke+Qy7JSLy99o7iiQKiRvWnPj6fDPKIiFwjZ3IZtY1oItcO9ezxXUY7v38tskhnKSU60dJK75tcBnCiD//+SgjWm7iG7XGIaLjJqsy97zlaJO6SWm5klgI8Vo5SLkRG3vclqt7NYJPyNZcfyw9ZY5QA62igHe0pFucfvVZEdEuM8MxMTTmWl9AUp96X
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(86362001)(6666004)(26005)(8676002)(8936002)(2616005)(33656002)(956004)(186003)(6916009)(5660300002)(38100700002)(38350700002)(2906002)(44832011)(4326008)(66946007)(6486002)(66556008)(66476007)(6506007)(53546011)(52116002)(54906003)(316002)(6512007)(508600001)(83380400001)(36756003)(32563001)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4714
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d1756fe4-e273-425e-e377-08d98c94324c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z15lYrVZlIYIKYHpQhZZqGoror3r+FaDrvLKpYdSZiig1uYhluvm2HT1d+K7SfYU8qAWx3vEtoMRkrtXDDJJeT4bNG4RlZgBpE1bMk7lm/KM1oUqkfbNQMyZAxuwS5vxgboPD4idpIKCjyXTsYErWPEfAV0l13bhVbRnLzmQwL8CVsqNLkJWL9GRGzChy7mqcMdZy5Z4YqXLnCfYMG04yIpwyu6cMDSxmpD4VGDI2A3+6CDJiS+Qcy1/xBCTbcr58qJyLLZxqcxezGc0PqcbKe9Nz4yA3Kq85RoBRsb6jnLncQhpUO4BnTGhjOxFBa09lQn36F5to84AdEPz3m82+pU4aHg9sX/BaTUQ/iBSkhjxCKMWEj/LEu7gaMFyS2KcyAS8/asXADKrczfUsMc76WUESFE28p4AqCo0X3IEmxv/f0Ve9ZChRmGrLO1K1mkXb6VzEQLuv9hAH4MaEen71TnpTXjWYYSAcYvCdY2INGZwBB/t4OiUjSfpuqP+Em7d8iy82sgE6yQk0hgWj+Dm6NvE8p+kIQYPCVvaRnINCFNfPNr+qXGpB1Zl/Dz7meNcp8Kw4xizVZ2y8acK85r3qTmOr3pY/QFmT1PUec23x0ASu96hyjLor2v3Wgw0cWjM9hH5BAxcjoivBm15fSG6X6DPdfuTs0Gs1BnlsJIKVzdRfyRsRS3VXMpZK+kXF6/E+0xft62BDXJc8VMH1nxud4JEnTEb+hVszOsHqs3d8So=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(36860700001)(8936002)(6512007)(4326008)(47076005)(6862004)(6666004)(82310400003)(26005)(6506007)(36756003)(33656002)(186003)(53546011)(81166007)(70206006)(356005)(2616005)(336012)(83380400001)(8676002)(508600001)(70586007)(316002)(6486002)(956004)(86362001)(44832011)(5660300002)(54906003)(32563001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 08:50:52.0595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 388c7982-ead0-4241-b36d-08d98c943ae3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2699



> On 11 Oct 2021, at 09:11, Jan Beulich <jbeulich@suse.com> wrote:
> 
> On 11.10.2021 10:03, Luca Fancellu wrote:
>> This patch introduces the support for dom0less configuration
>> when using UEFI boot on ARM, it permits the EFI boot to
>> continue if no dom0 kernel is specified but at least one domU
>> is found.
>> 
>> Introduce the new property "xen,uefi-binary" for device tree boot
>> module nodes that are subnode of "xen,domain" compatible nodes.
>> The property holds a string containing the file name of the
>> binary that shall be loaded by the uefi loader from the filesystem.
>> 
>> Introduce a new call efi_check_dt_boot(...) called during EFI boot
>> that checks for module to be loaded using device tree.
>> Architectures that don't support device tree don't have to
>> provide this function.
>> 
>> Update efi documentation about how to start a dom0less
>> setup using UEFI
>> 
>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Did you get indication that these are fine to retain with ...
> 
>> ---
>> Changes in v5:
>> - Removed unneeded variable initialization
>> - Fixed comment
>> - Fixed error message for the absence of an initial domain kernel
>> - changed efi_arch_check_dt_boot to efi_check_dt_boot and add
>> a stub if CONFIG_HAS_DEVICE_TREE is not declared, updated commit
>> message about the call introduction in the EFI boot flow.
> 
> ... all of these changes? Every individual change may be minor enough,
> but their sum makes me wonder. If so (or if at least one of the two
> gets re-offered)
> Acked-by: Jan Beulich <jbeulich@suse.com>
> albeit preferably with ...
> 
>> --- a/xen/common/efi/boot.c
>> +++ b/xen/common/efi/boot.c
>> @@ -166,6 +166,13 @@ static void __init PrintErr(const CHAR16 *s)
>>     StdErr->OutputString(StdErr, (CHAR16 *)s );
>> }
>> 
>> +#ifndef CONFIG_HAS_DEVICE_TREE
>> +static inline int __init efi_check_dt_boot(EFI_FILE_HANDLE dir_handle)
> 
> ... the "inline" here dropped. We don't normally add this outside of
> headers, leaving it to the compiler to decide. In headers it's wanted
> to avoid "defined by never used" style warnings.

Hi Jan,

Ok I can drop it in a next serie and retain your Ack, or is it something that
can be done on commit? 

Cheers,
Luca

> 
> Jan


