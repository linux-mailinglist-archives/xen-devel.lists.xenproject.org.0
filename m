Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8E359279C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386929.622961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPDi-0003Zj-Vl; Mon, 15 Aug 2022 01:48:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386929.622961; Mon, 15 Aug 2022 01:48:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPDi-0003X7-Sd; Mon, 15 Aug 2022 01:48:46 +0000
Received: by outflank-mailman (input) for mailman id 386929;
 Mon, 15 Aug 2022 01:48:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNPDh-0003Wz-Cs
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:48:45 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65408655-1c3c-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 03:48:44 +0200 (CEST)
Received: from AM5PR1001CA0016.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::29)
 by DBBPR08MB4537.eurprd08.prod.outlook.com (2603:10a6:10:c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 01:48:41 +0000
Received: from AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::34) by AM5PR1001CA0016.outlook.office365.com
 (2603:10a6:206:2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Mon, 15 Aug 2022 01:48:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT038.mail.protection.outlook.com (100.127.140.120) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:48:40 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Mon, 15 Aug 2022 01:48:39 +0000
Received: from 0318232e7b74.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9966EC3A-405C-4AF9-84D5-743151E5043B.1; 
 Mon, 15 Aug 2022 01:48:33 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0318232e7b74.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:48:33 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DU0PR08MB8089.eurprd08.prod.outlook.com (2603:10a6:10:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.27; Mon, 15 Aug
 2022 01:48:31 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 01:48:30 +0000
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
X-Inumbo-ID: 65408655-1c3c-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=D+edypbl5EfioR+XGu8THKbn0EV363QYs2uI87eZXd4Kff+3o6EdWPPpZHpEhcGJv//PR5Neu197WhRs+5WXKgYHw3dwyXnO1F4yP9A0rGNtKUOl3q/p5Um0JlHkoD07M/fiGEQU6u6iKp12Le3dLFJz9CrjPN8AKz+En7HXzPPHqRcRQuXnIS/iLs4VvmAgVw6iJUsbdavQ2NaznDB6L6CtIrXRRBPe6cC0UyK/AGI/TMhfF0NT2xCxyUA/VnE0hJn61HwrQBv5EzPdSpuLkdDD1LKd67XlX9hX/EgL1p7qkDfI+2Z3Rr05MaHs6FN6MZVeUXJZtaqlK/+mms2rTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLaUDDBt+qDLXQNdIhVktfakXm4x/ZrQ29rSP9MNex4=;
 b=OPIxwDxZQDy/eBNuWM5KUGly7FzpQeMjSpTjimjCBO9cFp6Bl5UtlZoARkCmdybYYb54TzWtuZV1nItn8Oduz2L4tORuaWK7j9NyEaE+qoJUwsQwocAyCXFUtXGhVgb7J+ewpI1O3XQH5pqTQlxBEVsLdHdLXJ/wr61YseEI1sJLxvqMbInDPmroNmRtwrrU7y2iOnaImOUt9f0sWn7nh8r2wWZs8uI7w+xinyzhqEonfQPGafvYHPNN5/YxxYzRQgEPqusKIylOKUy5RLi99nn9SZeo+/yRnBbEFra9JjYmKSvxv009OxKeacmeqGz1sR3D3VXpynxvxlW8WNe/vQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLaUDDBt+qDLXQNdIhVktfakXm4x/ZrQ29rSP9MNex4=;
 b=5koPV6jlSPam3RhV+bnpLAhYdVd3QQvWDeXHsCu22DL3xM86x0xUU+B5BbRLjWyg7lQL4yyaNG1VIdsVkGv9MDOITIKEA8UndiOqTz05h1vrwB0qWdjyFXzWgsJwj7E29bDOCCYOWEu5r62a/mbossZ3EeMr+fCo9bzvHK4RG6Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e5bab8e64cb36ce1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CvaKkiozXtH5cdFe+9coV3sJDpYU72kyjx78r3rrgq6O2aiKJ3582ZxwBjsoSx0tIxTbQ2nqKTLRRVfAyKsVbst1FvWdGpxkKRv2XdoIMoGcoOdBHWw0ZoSxALc6XG12vjCM4dNxBGQtdoEKGzlqppPA7NaJWakpyeJSYkxWeAzOAy33E9r0IVkIo7bo55HnEkELW/6/7zYEYIV8TQLuqGqlKvlaGkMf+bDPR1vmOyMqLeHuBlnBsgEOfXIcTqkB3jU2pGd7emf2OPsBetmgB7Q8VZItTdlDmZbVh4J6icO7QuQ+Z3MAMZuHOaB2A8sKn9SwhyksDLF1PE7IIALsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLaUDDBt+qDLXQNdIhVktfakXm4x/ZrQ29rSP9MNex4=;
 b=HhlkTHwiygQL+12ojXqUAue0YsVavWEVY1MOAisGpOeFji1BoCVcFsiOZpRBWeiQniVL84CSRbowNUSA1nhPLZOT1N7aIMBR8lukfa82amvhx348WavoOUjnpwi7VTQlBEY/ypmzqdXMhjKrhRUO5VQKi4bP91oe4igNXHOwF4PVmlLBKQCjrtpj5ilQ+k8OclPCJQD417606jZaLA00yazXvi3+Ckb6DX7Rh8nx5R/2uhU/syo1u3uqq66Gk3QWdVe4+AagY025pFtdvDhmCw92A4AV/xa+tDa2gM6gV+4By/tbG/Ag0iefOAMegPVrDanfkfmPjF5akPjcWZGh4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLaUDDBt+qDLXQNdIhVktfakXm4x/ZrQ29rSP9MNex4=;
 b=5koPV6jlSPam3RhV+bnpLAhYdVd3QQvWDeXHsCu22DL3xM86x0xUU+B5BbRLjWyg7lQL4yyaNG1VIdsVkGv9MDOITIKEA8UndiOqTz05h1vrwB0qWdjyFXzWgsJwj7E29bDOCCYOWEu5r62a/mbossZ3EeMr+fCo9bzvHK4RG6Y=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <46ee6760-9658-2a82-ad3c-a00df108d83a@arm.com>
Date: Mon, 15 Aug 2022 09:48:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/7] xen/arm32: head: Introduce get_table_slot() and use
 it
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-4-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220812192448.43016-4-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0184.apcprd06.prod.outlook.com (2603:1096:4:1::16)
 To PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 58e2b984-4b56-4520-4be6-08da7e604725
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8089:EE_|AM7EUR03FT038:EE_|DBBPR08MB4537:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tYv1P4SwaHRyTB8o8jw0W7+m5hB6ESV6yoJiEdw891OhxU11nS7rZccOVJxnWt5t8NfOrwsWXOjvSke5ziMSHqmqSPoKWX4qZ5F3/Ly768dm2lX3462LEQgpg3jG0+qIYwo0TYc4DiQOuVMDkmJiYcGT3XDwYgPzSCWMgYvULbhPIQN88I/1A8P0ahfeqqOJ+kApg8QHiOwaIPVHPXH8ZFu2XtXUGn1JLKGBXEXW6bWHuIBtpxW45Uhlo9HT71kSzlbcqWHHhfC31BnWE/BO+WauBU6PCsXDSKlAUrTVXea6UGwBNMe7hBeIqm51HTBe0tpKCaYOoEYbG+dvN2sPNBD3weKXZdreqguUDRaOrE8gkOIH3kypVASPkjBJT07tDGXk/16ledKa4okgsi4FESvrm3iQHRLswBwCyraujsiQAeOZNr4of2wH61Ls1JAIwuszCMOdBFfbR0t1SoQfWogMyWbnxWkpYTqZ2GjfOpAOeh9qUnL4cIOHX8B54pyo2w/ZkuGnFsE6GHl9AEWulouICGIEyINqL/MCEwJAgLyDY9omXZqtqaCm5IXjq1CeVFeqeZeSMoyX/F/yI7ty5TFpga5VFcsf2oDpM1J29tFR0tjNx9FeXl8UBanU4ij8tALw4Kxtv0LdKBr0pVQe4MEoHm9ix9yCymPiiyLORuZprN6Gu+Wye5jxnUxd81s6oqgPzyW7SdYibF1kPHo0lqyrVFP2dXW1u1k1tslMfQWxobjC+g4LsYW69bfjhDujA17rHJz6Rfz2WQIwoiltI746x1V+XQfDVyr3AfIsBFCgDxEpTgmCeX6ksaReSMn+ZXL7GA2La9xH03Uh4EjwRA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(36756003)(2906002)(8936002)(4326008)(66556008)(31686004)(66946007)(5660300002)(66476007)(8676002)(54906003)(41300700001)(6486002)(316002)(6506007)(26005)(6512007)(31696002)(186003)(2616005)(83380400001)(53546011)(6666004)(86362001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8089
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	901efacc-f17d-43f4-3cff-08da7e60418a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gLS58+HSzpKrqIAauzwQ1R7f/KYrf5h403Yk+NKL3ZaQbWDdo0/Mmapl20bkg5OkdCNPIFdw5Qf4cAr5P+euYw7iSpfCv+D+spM7qeIOqoHihXrABUOEAh8SvX3myD33TWcdi6a4qyesMc2d6+VkmM/TeSEaNEPdfVzPINt8MoebmgJQhOKtrjlmL0xPySvjLi6Os7qtFWeeokGC9oY7VMneXT/DHET3rfhEv0etPpRIQnpKeoqaee3sXkQJEemKhcHfsPNvuNhcgXTtXZkCW6kb5B3Czh8f6dlnXtCzysYkHLgLf4KdGJkrTC6Wwuhhd+5kCU5PfB7HLx9Dz2OGOX5thRQdpg1DBBNLvNddotqIxl9oaP5o7ifG/lB+VBDmLmWrncXdFMsl4rwLDP9fJ6DMgxJa+J+c6/NKiN7nLOe6/N0UeL5yLH8KT5kLN5X2V7GxT/yBt87KtjPxQZbTSQ5Ia3EJ9CnfIqqX4cXQo9M9Y/L0nDY0qlmq0ZnRHEkk2rpwear5/wJOQwLMICZbkB6vgd6puorSUdWsLAYSo7pyES6ycaap4faKctJM3GLBjD9Srr1lbVqkyGEGVqNFgGzp1HqnZrvQGZvndwI2v28vzNH/Wyj0O36NOkPlLZz7FPsyDWzJdrVgZBEC5hnxpcazkyzLq9bDtioMDuK2LemAnzJjcIYbfyE9VC4ELMWaMHk+jvqISkTRhYahWkMCk91nJoNxQWeVFqQnX3dfJ2UvMrZvGkFuj/MQfR1LZ3rZi50M/KV1M/diElky8YbaGkzAlz8BjYnp7Mm0SostvE05wXyQZ1nZfTOEEmV9jlB6
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(376002)(136003)(396003)(46966006)(36840700001)(70206006)(2906002)(36860700001)(81166007)(356005)(82740400003)(31696002)(86362001)(5660300002)(54906003)(8676002)(4326008)(8936002)(316002)(70586007)(82310400005)(26005)(53546011)(6512007)(186003)(336012)(107886003)(31686004)(6666004)(47076005)(83380400001)(41300700001)(6506007)(40480700001)(6486002)(36756003)(478600001)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:48:40.1152
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e2b984-4b56-4520-4be6-08da7e604725
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4537

Hi Julien,

On 2022/8/13 3:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> There are a few places in the code that need to find the slot at a
> given page-table level.
> 
> So create a new macro get_table_slot() for that. This will reduce
> the effort to figure out whether the code is doing the right thing.
> 
> The new macro is using 'ubfx' (or 'lsr' for the first level) rather
> than the existing sequence (mov_w, lsr, and) because it doesn't require
> a scratch register and reduce the number of instructions (4 -> 1).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
>   xen/arch/arm/arm32/head.S | 56 ++++++++++++++++++++++-----------------
>   1 file changed, 32 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 46d93bebbabe..50f6fa4eb38d 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -358,13 +358,31 @@ cpu_init_done:
>           mov   pc, r5                        /* Return address is in r5 */
>   ENDPROC(cpu_init)
>   
> +/*
> + * Macro to find the slot number at a given page-table level
> + *
> + * slot:     slot computed
> + * virt:     virtual address
> + * lvl:      page-table level
> + *
> + * Note that ubxf is unpredictable when the end bit is above 32-bit. So we
> + * can't use it for first level offset.
> + */
> +.macro get_table_slot, slot, virt, lvl
> +    .if \lvl == 1
> +        lsr   \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl)
> +    .else
> +        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
> +    .endif
> +.endm
> +
>   /*
>    * Macro to create a page table entry in \ptbl to \tbl
>    *
>    * ptbl:    table symbol where the entry will be created
>    * tbl:     table symbol to point to
>    * virt:    virtual address
> - * shift:   #imm page table shift
> + * lvl:     page-table level
>    * mmu:     Is the MMU turned on/off. If not specified it will be off
>    *
>    * Preserves \virt
> @@ -374,11 +392,9 @@ ENDPROC(cpu_init)
>    *
>    * Note that \virt should be in a register other than r1 - r4
>    */
> -.macro create_table_entry, ptbl, tbl, virt, shift, mmu=0
> -        lsr   r1, \virt, #\shift
> -        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r2             /* r1 := slot in \tlb */
> -        lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
> +.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=0
> +        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
> +        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
>   
>           load_paddr r4, \tbl
>   
> @@ -448,8 +464,8 @@ ENDPROC(cpu_init)
>   create_page_tables:
>           /* Prepare the page-tables for mapping Xen */
>           ldr   r0, =XEN_VIRT_START
> -        create_table_entry boot_pgtable, boot_second, r0, FIRST_SHIFT
> -        create_table_entry boot_second, boot_third, r0, SECOND_SHIFT
> +        create_table_entry boot_pgtable, boot_second, r0, 1
> +        create_table_entry boot_second, boot_third, r0, 2
>   
>           /* Setup boot_third: */
>           adr_l r4, boot_third, mmu=0
> @@ -486,12 +502,10 @@ create_page_tables:
>            * then the 1:1 mapping will use its own set of page-tables from
>            * the second level.
>            */
> -        lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0              /* r1 := first slot */
> +        get_table_slot r1, r9, 1     /* r1 := first slot */
>           cmp   r1, #XEN_FIRST_SLOT
>           beq   1f
> -        create_table_entry boot_pgtable, boot_second_id, r9, FIRST_SHIFT
> +        create_table_entry boot_pgtable, boot_second_id, r9, 1
>           b     link_from_second_id
>   
>   1:
> @@ -501,16 +515,14 @@ create_page_tables:
>            * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
>            * it.
>            */
> -        lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0             /* r1 := second slot */
> +        get_table_slot r1, r9, 2     /* r1 := second slot */
>           cmp   r1, #XEN_SECOND_SLOT
>           beq   virtphys_clash
> -        create_table_entry boot_second, boot_third_id, r9, SECOND_SHIFT
> +        create_table_entry boot_second, boot_third_id, r9, 2
>           b     link_from_third_id
>   
>   link_from_second_id:
> -        create_table_entry boot_second_id, boot_third_id, r9, SECOND_SHIFT
> +        create_table_entry boot_second_id, boot_third_id, r9, 2
>   link_from_third_id:
>           create_mapping_entry boot_third_id, r9, r9
>           mov   pc, lr
> @@ -571,9 +583,7 @@ remove_identity_mapping:
>            * Find the first slot used. Remove the entry for the first
>            * table if the slot is not XEN_FIRST_SLOT.
>            */
> -        lsr   r1, r9, #FIRST_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0              /* r1 := first slot */
> +        get_table_slot r1, r9, 1     /* r1 := first slot */
>           cmp   r1, #XEN_FIRST_SLOT
>           beq   1f
>           /* It is not in slot 0, remove the entry */
> @@ -587,9 +597,7 @@ remove_identity_mapping:
>            * Find the second slot used. Remove the entry for the first
>            * table if the slot is not XEN_SECOND_SLOT.
>            */
> -        lsr   r1, r9, #SECOND_SHIFT
> -        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
> -        and   r1, r1, r0             /* r1 := second slot */
> +        get_table_slot r1, r9, 2     /* r1 := second slot */
>           cmp   r1, #XEN_SECOND_SLOT
>           beq   identity_mapping_removed
>           /* It is not in slot 1, remove the entry */
> @@ -628,7 +636,7 @@ setup_fixmap:
>   #endif
>           /* Map fixmap into boot_second */
>           mov_w r0, FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, r0, SECOND_SHIFT, mmu=1
> +        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=1
>           /* Ensure any page table updates made above have occurred. */
>           dsb   nshst
>   

Reviewed-by: Wei Chen <Wei.Chen@arm.com>

