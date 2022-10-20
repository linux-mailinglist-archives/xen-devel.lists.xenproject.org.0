Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA196055B3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 05:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426116.674361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olLny-0006z7-Sw; Thu, 20 Oct 2022 03:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426116.674361; Thu, 20 Oct 2022 03:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olLny-0006wz-Ou; Thu, 20 Oct 2022 03:01:10 +0000
Received: by outflank-mailman (input) for mailman id 426116;
 Thu, 20 Oct 2022 03:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oIjd=2V=arm.com=Jiamei.Xie@srs-se1.protection.inumbo.net>)
 id 1olLnx-0006wn-2X
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 03:01:09 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2085.outbound.protection.outlook.com [40.107.103.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ec79007-5023-11ed-91b5-6bf2151ebd3b;
 Thu, 20 Oct 2022 05:01:03 +0200 (CEST)
Received: from AS9PR06CA0537.eurprd06.prod.outlook.com (2603:10a6:20b:49d::34)
 by AS8PR08MB7838.eurprd08.prod.outlook.com (2603:10a6:20b:529::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Thu, 20 Oct
 2022 03:00:57 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49d:cafe::10) by AS9PR06CA0537.outlook.office365.com
 (2603:10a6:20b:49d::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Thu, 20 Oct 2022 03:00:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Thu, 20 Oct 2022 03:00:57 +0000
Received: ("Tessian outbound 6c699027a257:v130");
 Thu, 20 Oct 2022 03:00:56 +0000
Received: from ec5e4c7a76c0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7EA5881E-7517-4CFD-B899-584A351EE779.1; 
 Thu, 20 Oct 2022 03:00:50 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ec5e4c7a76c0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Oct 2022 03:00:50 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com (2603:10a6:20b:523::11)
 by DB9PR08MB6331.eurprd08.prod.outlook.com (2603:10a6:10:251::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Thu, 20 Oct
 2022 03:00:48 +0000
Received: from AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c]) by AS8PR08MB7696.eurprd08.prod.outlook.com
 ([fe80::d793:e6d8:6250:d00c%6]) with mapi id 15.20.5723.034; Thu, 20 Oct 2022
 03:00:48 +0000
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
X-Inumbo-ID: 6ec79007-5023-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=nv5P8zMH++IQfLfzjU/IftW6Qb6Qo6TWGoTxuUbi30b6I9vw1E+EZ1pJZkM8KkhQP/jz4NWM+cUllIELEHqdizKptITPLh8gIdweothHZmgXG50QzqZxOb/dBAXNabkepIsYu8hxu6a9OAauqdCJ31m20cUQrgEsrqn5dB3nk5XOxpPr3yDpQv0ZijZDIrqxTJTGPNAhdIgLlpNSnWszLSjelfwrSh9DVfgtVRL8zrTj5wE93vnm/6dL9h7U27FE1xMAG6JqeQZPhbHqu8UUgsj/V/lJiytBLZVVdGyhjA7qfcfBM7BaNJ56wqJa61A05EL03BgTaVYh6HLYLYKkZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FBfuY0wOlOUqM+aQYbculcX2JSONvjRHhg/X9r/nrM=;
 b=X261p19VHqApLDXfnrvBF1026jZJ+daJ3FQj1at/YO7B5hvnwJPGA/YVcrEUSg02t3HRt+XptXMGPg7ec5SY+mIxjzlQkPdLdmx7fibfyrizkg5Tn2jl29q4ZaxoqhfXYDrifVq2hF1h9v8DpE3F+14tqGhEoK5KDbyp7SbgO3PGZGHcnuOPYoQHALx608AUnt4awg0J3yZeKfGPiEW001nYCtAjEh7PfdraPqD01dnSyEQWsFc+gxVDnLL9pBlA858zUlSiYQEX9E/M0HjmfpzFv6icvCBsjcJTFrpFOtzlfbLuJgIxdj7lwmjnCYjJkT1bcA0ptFDtR83UgOtbbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FBfuY0wOlOUqM+aQYbculcX2JSONvjRHhg/X9r/nrM=;
 b=MxvADIBUBO62+HqnZiRQkwZ7SIRkh86FJjIIfYJQyE65eOhkwUb1SSF4SV5Xgh3f6hJ0snWc6rRJGYIZTJTZQntnhFYKiIDXnq2f48zCDWtd9DQ7DiTDBgXBD8+w4PY/suw0bRZysUqYshiAy9/7a22X5wpzW/0GmHJXEOtVI08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUXwB0ThJzJxCH5WHd1+f6lj8u6MtLT8Gz9NUuQwzYbyXSkju3k+mvBE/hB7J/xBtQwrruWRRRo/NLCbALZKCQHXifr4JHEPV35xcfqKyxOmzzoT5ZV6JMUt5U2CV2SavwswroGyDdLJqrOx9IYAX0Qso64eip0yH3TnJCjy9qpo4Yrorg4nPfUEFLY7EJmD6VbFK1X+w9JB1ZL0I4tTtnbJzYU9wrUBxNnd8j2APqTUZ9yYh+xHPNYC1Fx5QoMVQiCwKPwK2oWGJIv9TqjMK57CksU1SAplgZGw6P/bCvbDEJ7G6JB+oUyLV8F+THEYtJfFg3+Uz+1uZwgxJ8Xk5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FBfuY0wOlOUqM+aQYbculcX2JSONvjRHhg/X9r/nrM=;
 b=agABo7CfVJjBbjTiaBQNjXFBNZzuDiibZlemYrJxHzK0IQs1oFSzAhUoUmFt0iq2gpUwBCuDLunP8p3g4KIK6gp7iiUViyj31TC0p8KfvcGaq2V03tCBk+ajGoN0SuvN8LQME32V5EnpbODBK/UXFOtN2ZZqpk8Tf/FYHhJZ4knSeIPveJYdQLr4FUwkJTxyS26ocuA+q5zZaHY8ANJQQvXWfqAd41C0F2KR/7dbxBr9MmPnGF1GAtbLsSUVIlcB9Ptj6DDHXiqqyZDeCJUG0dniXm8mQP7k1BRPY5Q5k/yrtvFVRY96YdeNKHs29muFLQ3LNNSoXyvTXZ6ZS7Vgww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FBfuY0wOlOUqM+aQYbculcX2JSONvjRHhg/X9r/nrM=;
 b=MxvADIBUBO62+HqnZiRQkwZ7SIRkh86FJjIIfYJQyE65eOhkwUb1SSF4SV5Xgh3f6hJ0snWc6rRJGYIZTJTZQntnhFYKiIDXnq2f48zCDWtd9DQ7DiTDBgXBD8+w4PY/suw0bRZysUqYshiAy9/7a22X5wpzW/0GmHJXEOtVI08=
From: Jiamei Xie <Jiamei.Xie@arm.com>
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Topic: [PATCH v3 05/10] automation: Add Arm containers to containerize
 script
Thread-Index: AQHY0lZFu/mKHMVlEk6rDAaZCITsX64Ws3HQ
Date: Thu, 20 Oct 2022 03:00:48 +0000
Message-ID:
 <AS8PR08MB7696D8C9D2239CC9ED2FE08F922A9@AS8PR08MB7696.eurprd08.prod.outlook.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
 <20220927094727.12762-6-michal.orzel@amd.com>
In-Reply-To: <20220927094727.12762-6-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: F1C4FB2A9BFFD743A93E1C409AEF2474.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7696:EE_|DB9PR08MB6331:EE_|AM7EUR03FT006:EE_|AS8PR08MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 7745b51f-24d1-401e-67fe-08dab2474f71
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0IoMcRV4UbA0pBTmZl8UqfQYu/GGXrFwIGyydcuqGREq3B98DLzSm2osoPkZtAxwc/iVnNf7mWPvqjF4/7SbCMLBMHYS40UkGvcNUTv63sBwZ7++hu61nyhoQlDedL790Z6fG+epVx6tbNMra6njvWxkaT8chlG81RJD/YsonAGsCG2Ar7tpeJfgo9z7QJ7XJzICRQ7Ne9Mi3JGASd1HyKUyI8N82aEdp+I0LoYMtEsZmzT2LCxXG2yvwUPsYvBty6u94efBReTtEhjmHkuaZmLaFmNJ2/VJ4D0XzvaleGPRFqSuCZu6Vl92h3an1tnMdTKv3cONw2fT/bfwU9phEp4ag+CgFiAgD29Yri+CEa0KfVOGaqz16V2twuwznsWWtcnMERyq0AVS/Y0y2l8ECYEk1VZW/Od/Ubs2PgD9HoNbnoWfv5lp1PQiQD8uawdeDGAdlmdpr1Nf6eiHvr0MIBEl6E+yw+4jMFrdljokAcFy2ABkCB/PDrytJ8b9vMpGIWYlBoJ+ku9J/UlB6AfRdSZcWxqjqSbwkMrZ5EauAX7HbFSCF0XR0r2W1YNs5C9ml3NqwVTQGJ+Lex1Q1GCFKUzb+Kg7c+3mfkHjrfvLl5jf7sy+XxDmqLhiHY3J1KjiQnk5AIqXpmSrhtKOIDR9xkmxkCCJRruM6raoXdSaRLhvyssIclwZe/7/WLU6MUw8cbUvOZ+59gF8wQSjA32QUfezLO/7GH+tdgcF+R5NCvyGA6d9+5GcjZY2Avas0/yx
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199015)(26005)(8676002)(33656002)(66476007)(76116006)(64756008)(66446008)(66946007)(66556008)(316002)(478600001)(54906003)(52536014)(110136005)(4326008)(55016003)(186003)(38100700002)(122000001)(83380400001)(2906002)(41300700001)(53546011)(9686003)(86362001)(7696005)(6506007)(8936002)(5660300002)(38070700005)(71200400001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6331
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6084dc88-7d10-4868-873d-08dab2474a35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A+0LEVt4JdtcuBbZB2x+XSyITBLe+JCzBTi5NGw8mDtUoYmfXLs6nXYkJktpUDXL/LMbiof5U80ANwT/mDIJYv4u1xjlbr9nsoCevmLK3TJ7mJ3ogvPmkaVfBciRh4Z/KeAYySuUYCUY+XozeezNbyEt/GI2MIfD6NvGSDGblqNX1f/1GN6ws5KyqfxOP4DF4/MGq6CLpPr0RNCvv9hHtAl0ma4huKpFZ7QFSpG1nKs9CMkKb2dgm3GkdlQw64EFbpwuJLrlOx8UaHAPi+6x6TnlMeEFYDLTYgVtlq5PZoiS+0stLj7SQS9jTwz6YMW0llgRhECF8mmuNXjdnr7uudBGP+d0Vva0EU3HrdLqXx5RHvy8Mgp0EOfNJ7dI5ohCUMjLm1QxEzFypgATM6ZQDBYyyCsg0iBzjDhwAM9hc+brkL1j4MG3NXgmiN615u/6sPEX3EwhDtheb5kbHJaojOeJCkifJOwi4zVUsMSstSg9HljSJZpyfMnGS8uIgnx5jN3fQ7KeAFADvpLkaQ9xiwqCXADII7zoDZ4a3Ovf6ow54aZmSCq87oPj3oIJHBBoeUJHn/NZh7shMd4tkG9xByc1f/ES9O2KvZKf2mZzhu2Llp7+yxU6lUA2BOyGgmOq1Rudv6ABelluo/0iD2+sR7wwGCQrYlAHA5pES9tIFEosw/vEK/ewouM4XC1tA02UWlcbI3nX5ud9jFPzPovBG+rNCruzxENdgcradj1h9uXnskG6P1lU8ZPXH+skRUgcpysPPJE7QQGuEQlccjJOiw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(33656002)(336012)(36860700001)(86362001)(82740400003)(2906002)(5660300002)(8936002)(54906003)(47076005)(186003)(81166007)(356005)(83380400001)(6506007)(478600001)(70206006)(70586007)(53546011)(4326008)(7696005)(316002)(9686003)(26005)(110136005)(82310400005)(55016003)(40480700001)(52536014)(107886003)(40460700003)(8676002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 03:00:57.1132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7745b51f-24d1-401e-67fe-08dab2474f71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7838

Hi Michal,

> -----Original Message-----
> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> Michal Orzel
> Sent: Tuesday, September 27, 2022 5:47 PM
> To: xen-devel@lists.xenproject.org
> Cc: Michal Orzel <michal.orzel@amd.com>; Doug Goldstein
> <cardoe@cardoe.com>; Stefano Stabellini <sstabellini@kernel.org>
> Subject: [PATCH v3 05/10] automation: Add Arm containers to containerize
> script
>=20
> Script automation/scripts/containerize makes it easy to build Xen within
> predefined containers from gitlab container registry. This script is
> currently missing the helpers to select Arm containers, so populate the
> necessary entries.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> Changes in v3:
> - none
> Changes in v2:
> - modify commit msg to reflect that we are missing helpers but in reality
>   it could be possible to use Arm containers by specifying the full path
>   to gitlab container registry. However, such usage is annoying.
> ---
>  automation/scripts/containerize | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/automation/scripts/containerize
> b/automation/scripts/containerize
> index 9d4beca4fa4b..0f4645c4cccb 100755
> --- a/automation/scripts/containerize
> +++ b/automation/scripts/containerize
> @@ -25,6 +25,7 @@ die() {
>  BASE=3D"registry.gitlab.com/xen-project/xen"
>  case "_${CONTAINER}" in
>      _alpine) CONTAINER=3D"${BASE}/alpine:3.12" ;;
> +    _alpine-arm64v8) CONTAINER=3D"${BASE}/alpine:3.12-arm64v8" ;;
>      _archlinux|_arch) CONTAINER=3D"${BASE}/archlinux:current" ;;
>      _riscv64) CONTAINER=3D"${BASE}/archlinux:riscv64" ;;
>      _centos7) CONTAINER=3D"${BASE}/centos:7" ;;
> @@ -35,6 +36,8 @@ case "_${CONTAINER}" in
>      _stretch|_) CONTAINER=3D"${BASE}/debian:stretch" ;;
>      _buster-gcc-ibt) CONTAINER=3D"${BASE}/debian:buster-gcc-ibt" ;;
>      _unstable|_) CONTAINER=3D"${BASE}/debian:unstable" ;;
> +    _unstable-arm32-gcc) CONTAINER=3D"${BASE}/debian:unstable-arm32-
> gcc" ;;
> +    _unstable-arm64v8) CONTAINER=3D"${BASE}/debian:unstable-arm64v8" ;;
>      _trusty) CONTAINER=3D"${BASE}/ubuntu:trusty" ;;
>      _xenial) CONTAINER=3D"${BASE}/ubuntu:xenial" ;;
>      _opensuse-leap|_leap) CONTAINER=3D"${BASE}/suse:opensuse-leap" ;;
> --
> 2.25.1

[Jiamei Xie]=20
I wonder if an default container for arm can be added. For example,  if=20
 "CONTAINER=3Darm64 automation/scripts/containerize bash",=20
 set the default CONTAINER as "registry.gitlab.com/xen-project/xen/alpine:3=
.12-arm64v8"

Best wishes
Jiamei Xie



