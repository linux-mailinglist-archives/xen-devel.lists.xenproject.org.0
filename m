Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 223BD5927A3
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 03:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.386949.622995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPM3-0005tw-FD; Mon, 15 Aug 2022 01:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 386949.622995; Mon, 15 Aug 2022 01:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNPM3-0005qy-BT; Mon, 15 Aug 2022 01:57:23 +0000
Received: by outflank-mailman (input) for mailman id 386949;
 Mon, 15 Aug 2022 01:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Zthq=YT=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1oNPM2-0005Yv-0E
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 01:57:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2063.outbound.protection.outlook.com [40.107.21.63])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99232b63-1c3d-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 03:57:21 +0200 (CEST)
Received: from AM6P192CA0035.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::48)
 by AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.20; Mon, 15 Aug
 2022 01:57:18 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:83:cafe::69) by AM6P192CA0035.outlook.office365.com
 (2603:10a6:209:83::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Mon, 15 Aug 2022 01:57:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 01:57:17 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 15 Aug 2022 01:57:17 +0000
Received: from a2cd6fc6fa6c.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4C44B154-855F-4086-ADD9-0485E70C90F0.1; 
 Mon, 15 Aug 2022 01:57:10 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2cd6fc6fa6c.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 01:57:10 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DB3PR08MB9109.eurprd08.prod.outlook.com (2603:10a6:10:43c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 15 Aug
 2022 01:57:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::5d27:806b:5d1f:f63%2]) with mapi id 15.20.5504.027; Mon, 15 Aug 2022
 01:57:02 +0000
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
X-Inumbo-ID: 99232b63-1c3d-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=QA8SNGzYGOAnnk0TeOkBAoEa/OZt8WXU0HDZhc+6dd1ata6pJsWtq5DlsCkSp7ztXtYBFTXPxFHpmXrIGpe5z9Cxm+axvE08zKwXinadLL/+FT103z0GGdPUyjhfeg6nv/rjg/H3c/w6LA1xp3wDMmYGWoS9TitrL+EWF+aIF+dGN0Fv1M0s+104jRGoP4yqWL5H1SqTCAEu0o56NqzwLL0uWADFOq6GdpeHMqkgnt/Wt6R2WqQYwVxyKCc7rgDA/MKIf7OAfVochY+mqY4GgIiwW4Q7d6VijTWHRuqo3uUuhMZhjDmq5DnYF0tEGgG5lzIr1d9MLrJ9/2JU3ZCY7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LJAtZ3+jOrtGclT/LHfn54y6Y5l3ruqr+tb7HWP1yQ=;
 b=heYotiaLzedgT92cpMa5knmqatlJ3831SGja8RUw28ewJmwyIM5lLXaBeaRAb9ve5B0C8f86tUbktXadV9YEWnTxFIIJBw1MML5uZdF3dPWGKvu0KNdTqFdXu5IdMv0dfg6hU+QQnVVEaXauDZgJXXS7fwhYA5iYYVJXFCUEsgHy8D0RdSxVGji6HphjLr4UcN5Y06UV+ecY4v927bgHiET0STykh4bFw9UNqBiW+2QpRnUwxtz+zCk/eCbYN0k3MoJPDD6FEdceHYTjTDolGF4/2CABL8WJrSP0PlmgF+iFkFNzKSgCGLiuMPOkNZHoAv4KnPrKPYeUeAVVoYIaBg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LJAtZ3+jOrtGclT/LHfn54y6Y5l3ruqr+tb7HWP1yQ=;
 b=u0xclrSPr8lYjiYL0UKqb63lEb+2pCS08jeOkvFmwPaJzLGt2bvz+Qlo9SI9GnxEbXM06z1naEpIQ+nmLQMWoTNn17wgqDQkyfs6fq/kFxrx6OZrRTLtWcjpwdfRP3IR5NBlaOBh/efgTHNzc4yNfTsOMQ6BfGJIfUXGlqKLwj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e4879f8445e3de4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oYHg2O4sleAV5hZhgpDhPUKd8nHfwQZ+yQ5rD8zAsXmSHySyJCyGBIJZ/wGs6EIY7DNzXGRvSAOTfxhY+dLhlzraDWWEsvu7G36i+RwetmTPPT0zICOcFMqq7v9WWyGFtK+ShIef8EI23NHba4ZaRpF/fshGqm09ZGzk+zw9NE58G/APKY86FcUvwwdEzE9eMcl8X6UkHzA5mmA3FQYT/q+jK9VMH5dZsdXk1JxaTyC79KS8wc1C55rguo7oib2GRJ8B1faTVGUvtaBoD2lXSjCTuxA6Hg4GF5nmGO3dpx3K/mpePIU4rvWQkFhjxu8LBRrook7Sr+bCJMjDTGsLKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/LJAtZ3+jOrtGclT/LHfn54y6Y5l3ruqr+tb7HWP1yQ=;
 b=gFeMPuFv7MfIkgngry4eoZckhx5GeH3CwT2vj+SEpCwyt3TRVxhRIx8SjOppi8D/pFfVehtkUL2kGzSVhuNmqySTXoeTEBO76SvfFEy5U8Z9QWzBnk4EdH/n+E+8tAkgVu7vgwE70T5L71+PgAcS9N7dw9uy74tpTLi6Sy3KFzrSSNPA8aCt3PjihiGsqPFuF0KqIt6nTWSrFPyWtMZnqDyVOnl+ufrmCWhSVA17oVWhhmchIrrIr81cVE8fGAIphn2oP+vFVVjMkZnaFiSJbw8Uqovq2ki2HWGzdcOemZHBMzzeXfZULHNQYt5nsfEEoMAmw5+9MPnkSway5ht8dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/LJAtZ3+jOrtGclT/LHfn54y6Y5l3ruqr+tb7HWP1yQ=;
 b=u0xclrSPr8lYjiYL0UKqb63lEb+2pCS08jeOkvFmwPaJzLGt2bvz+Qlo9SI9GnxEbXM06z1naEpIQ+nmLQMWoTNn17wgqDQkyfs6fq/kFxrx6OZrRTLtWcjpwdfRP3IR5NBlaOBh/efgTHNzc4yNfTsOMQ6BfGJIfUXGlqKLwj0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <cb67aa6b-7d57-bda9-8ed6-efa5c35d4348@arm.com>
Date: Mon, 15 Aug 2022 09:56:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/7] xen/arm32: heap: Rework adr_l so it doesn't rely on
 where Xen is loaded
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-5-julien@xen.org>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <20220812192448.43016-5-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0008.apcprd06.prod.outlook.com
 (2603:1096:4:186::23) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 283b5b74-4ec5-4654-9d90-08da7e617bcf
X-MS-TrafficTypeDiagnostic:
	DB3PR08MB9109:EE_|VE1EUR03FT022:EE_|AM0PR08MB3315:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 GTMW3tz+5m3EAw6cssR9XVaygCGxYU3gTUngS9RgWxY0qnRFNkvB99cjL6GloMfGOQgI7Oho42NKNu4G7PMvvXZtWqfmApJTw+69PXjyGAWyIt7iwE7QxOQr+NNuQrias8q0grIf2+YwCPfdC2z7dDQfg7MvDWzruRf1XnaiBmn6hsh4z4XtGmKW5Aq4TfYQEqAmmNgRPaIKQQZLxT2dfoZZkR/QQpJIQ8I0iYp8PLhECSrmON5jYIbDVK5b+08ytIW2C9hyCaepWICL28Qs8EKzPLul7LMip6uJo0pbAf8uoExiLT5B3HX0qY+6h6uBYrdNnk0M3xxr4Zpm/qOeT6wm02BCIRbuEsnkUIHpzw3eaMlDPOVNj5Pzf03YiZj3G9lpd5m5GdnyxYWr5fmBh1WVq0/6gMlv2Dxrbm/S5RalT9mNqDmX67nswdzEjjKzKbUKgC5foditY25GzHoW4cm0UWcgeBfGjkjzPLi69HrKONPUGhXGZ92fpYLGblPL441pt+nvM/bUuOxTCdj4fbKt2kxOA6+CPjORH7eMGm39ssWhBldG6g1cIR+P3PEtdNEd+bvneF37X9ZvGaINiRXFlQHy/TExzLp47+LLHsh5gUqHfv+WqQMR9oAGjOflEHSlC9MqQRjMKl+M1Vz2F49OGV5P8chEQ2RZDkyOd+mhZpgyR/4XiBb32ypFe4dUnJWXpBySWMTqGdQw8lkfIJPbgYa4S/UDH1hrTgYGMH1sbNUy77hqhLHgtXJMrSPDP6bMS4zWCtSTQLgGa3wkDiwg4MI/UJKQs51mLR79KAdPyJ/rDLLa3EtboFnK79Lg4HtmWUKLxf1gmy/KJU0kFw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(54906003)(36756003)(316002)(8676002)(66556008)(66476007)(66946007)(4326008)(38100700002)(6512007)(6506007)(6666004)(53546011)(26005)(83380400001)(41300700001)(2616005)(186003)(478600001)(6486002)(31696002)(8936002)(31686004)(2906002)(5660300002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a61d4467-4b0d-494e-bf2f-08da7e617284
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+m6MUUdsLTjzSmzs8ETAmSqrG7uhdDeBJcLEGebWPhSkZq8yABAimRC5vlbxiuXjdCf77edBgXK1nxWZKyY78RkThGVOoS5TSLQx1tIjyFJb59x/++cdUO+yB14MQ8ELEHs3MnlaVJqWDRrE8FU9SeiRtmCVN1n6KS/MiH3PatWfxdUIiBhHgCvt+35u3HtFbflzfPuK5OXK4FNp5RAgJNP0c/WcjgX0gMDpdFfF63cb/Q5f244Ve3D2MFgbE+/N3zGwcC7okgPYeW1QlBt3sQsYjy7m9gucKzPfWNBlt+VmarK0iNOlpGxeu8rGYP+sQebSFa7gQ3F7XigIP3rH8Qhm59tGD6Sd8muCWOWwQAuyNrxZBuCIs7nyVOkGgAO/Rm0ox4p1OX1Eynxz+NMUIc5ggd6AJFgyB71vCTBBi5ZaPWqBUFqdrGVmm92PRKQZmiwm1utE0Fj1z2ZmpnACxyL7gykujq9rtoIxP4ix3SWF2ZYYA9c/5f2Ie/5RIwMJIQkZBJO+jrBfLtMjr6KSd2B7iPYEhkDdjZWra9MNaw6qb9QOqAm4QVmyKUu22KYl1AbH+HuoD9DeTpjujXCo3XDuwie4mm7ZjhRi1mXSgbk86j3b9mNdVBMCLWAdvDhQWAvRkcbIcuAaJBnY4CBG5byJIDbXq+8VhwKkgBq+AKuv9/lSWB1GJ1SXi2I4zHPTqDVGfgvBT1GPwIXRCjqSec2zGK76gnvm/vK/2h6livXs7uK6GBqeWqH2iQKs97Sx/W5ElvhV/sIysHWNAe78+1GPKtatvuxhAgDD+xhjN8b2GfUL7mj+O1yJ7zINbh3Z
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(39860400002)(396003)(46966006)(36840700001)(40480700001)(31686004)(5660300002)(36756003)(82740400003)(316002)(82310400005)(4326008)(8676002)(70586007)(70206006)(54906003)(81166007)(36860700001)(83380400001)(31696002)(86362001)(26005)(6512007)(53546011)(6506007)(41300700001)(6486002)(478600001)(6666004)(8936002)(47076005)(356005)(2906002)(107886003)(186003)(336012)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 01:57:17.8955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 283b5b74-4ec5-4654-9d90-08da7e617bcf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3315

Hi Julien,

On 2022/8/13 3:24, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, the macro addr_l needs to know whether the caller
> is running with the MMU on. This is fine today because there are
> only two possible cases:
>   1) MMU off
>   2) MMU on and linked to the virtual address
> 
> This is still cumbersome to use for the developer as they need
> to know if the MMU is on.
> 
> Thankfully, Linux developpers came up with a great way to allow
> adr_l to work within the range +/- 4GB of PC by emitting a PC-relative
> reference [1].
> 
> Re-use the same approach on Arm and drop the parameter 'mmu'.
> 
> [1] 0b1674638a5c ("ARM: assembler: introduce adr_l, ldr_l and str_l macros")
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> ----
>      I haven't added an Origin tag because this is quite different
>      from the Linux commit. I am happy to add one if this is desired..
> ---
>   xen/arch/arm/arm32/head.S | 38 +++++++++++++++-----------------------
>   1 file changed, 15 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 50f6fa4eb38d..27d02ac8d68f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -49,20 +49,16 @@
>   .endm
>   
>   /*
> - * There are no easy way to have a PC relative address within the range
> - * +/- 4GB of the PC.
> + * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
> + * within the range +/- 4GB of the PC.
>    *
> - * This macro workaround it by asking the user to tell whether the MMU
> - * has been turned on or not.
> - *
> - * When the MMU is turned off, we need to apply the physical offset
> - * (r10) in order to find the associated physical address.
> + * @dst: destination register
> + * @sym: name of the symbol
>    */
> -.macro adr_l, dst, sym, mmu
> -        ldr   \dst, =\sym
> -        .if \mmu == 0
> -        add   \dst, \dst, r10
> -        .endif
> +.macro adr_l, dst, sym
> +        mov_w \dst, \sym - .Lpc\@
> +        .set  .Lpc\@, .+ 8          /* PC bias */
> +        add   \dst, \dst, pc
>   .endm
>   
>   .macro load_paddr rb, sym
> @@ -383,7 +379,6 @@ ENDPROC(cpu_init)
>    * tbl:     table symbol to point to
>    * virt:    virtual address
>    * lvl:     page-table level
> - * mmu:     Is the MMU turned on/off. If not specified it will be off
>    *
>    * Preserves \virt
>    * Clobbers r1 - r4
> @@ -392,7 +387,7 @@ ENDPROC(cpu_init)
>    *
>    * Note that \virt should be in a register other than r1 - r4
>    */
> -.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=0
> +.macro create_table_entry, ptbl, tbl, virt, lvl
>           get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
>           lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
>   
> @@ -402,7 +397,7 @@ ENDPROC(cpu_init)
>           orr   r2, r2, r4             /*           + \tlb paddr */
>           mov   r3, #0
>   
> -        adr_l r4, \ptbl, \mmu
> +        adr_l r4, \ptbl
>   
>           strd  r2, r3, [r4, r1]
>   .endm
> @@ -415,17 +410,14 @@ ENDPROC(cpu_init)
>    * virt:    virtual address
>    * phys:    physical address
>    * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
> - * mmu:     Is the MMU turned on/off. If not specified it will be off
>    *
>    * Preserves \virt, \phys
>    * Clobbers r1 - r4
>    *
> - * * Also use r10 for the phys offset.
> - *
>    * Note that \virt and \paddr should be in other registers than r1 - r4
>    * and be distinct.
>    */
> -.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3, mmu=0
> +.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3
>           mov_w r2, XEN_PT_LPAE_ENTRY_MASK
>           lsr   r1, \virt, #THIRD_SHIFT
>           and   r1, r1, r2             /* r1 := slot in \tlb */
> @@ -438,7 +430,7 @@ ENDPROC(cpu_init)
>           orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
>           mov   r3, #0
>   
> -        adr_l r4, \ptbl, \mmu
> +        adr_l r4, \ptbl
>   
>           strd  r2, r3, [r4, r1]
>   .endm
> @@ -468,7 +460,7 @@ create_page_tables:
>           create_table_entry boot_second, boot_third, r0, 2
>   
>           /* Setup boot_third: */
> -        adr_l r4, boot_third, mmu=0
> +        adr_l r4, boot_third
>   
>           lsr   r2, r9, #THIRD_SHIFT  /* Base address for 4K mapping */
>           lsl   r2, r2, #THIRD_SHIFT
> @@ -632,11 +624,11 @@ setup_fixmap:
>   #if defined(CONFIG_EARLY_PRINTK)
>           /* Add UART to the fixmap table */
>           ldr   r0, =EARLY_UART_VIRTUAL_ADDRESS
> -        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3, mmu=1
> +        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
>   #endif
>           /* Map fixmap into boot_second */
>           mov_w r0, FIXMAP_ADDR(0)
> -        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=1
> +        create_table_entry boot_second, xen_fixmap, r0, 2
>           /* Ensure any page table updates made above have occurred. */
>           dsb   nshst
>   

LGTM.

Reviewed-by: Wei Chen <Wei.Chen@arm.com>


