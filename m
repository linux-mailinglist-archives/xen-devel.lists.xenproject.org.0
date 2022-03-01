Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE344C8E6C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 15:58:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281631.480051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3wy-0000c5-Oi; Tue, 01 Mar 2022 14:58:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281631.480051; Tue, 01 Mar 2022 14:58:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP3wy-0000YZ-KA; Tue, 01 Mar 2022 14:58:04 +0000
Received: by outflank-mailman (input) for mailman id 281631;
 Tue, 01 Mar 2022 14:58:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BNgs=TM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nP3ww-0000Vt-VX
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 14:58:03 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fddccaf0-996f-11ec-8539-5f4723681683;
 Tue, 01 Mar 2022 15:58:02 +0100 (CET)
Received: from AM6P191CA0079.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::20)
 by AM0PR08MB3204.eurprd08.prod.outlook.com (2603:10a6:208:5d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 14:58:00 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::c9) by AM6P191CA0079.outlook.office365.com
 (2603:10a6:209:8a::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13 via Frontend
 Transport; Tue, 1 Mar 2022 14:58:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 14:58:00 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Tue, 01 Mar 2022 14:57:59 +0000
Received: from 1297990f98b1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 969F2B92-8224-46A0-B9FE-990DA1FEE08D.1; 
 Tue, 01 Mar 2022 14:57:54 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1297990f98b1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 01 Mar 2022 14:57:54 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com (2603:10a6:208:104::24)
 by PAXPR08MB7365.eurprd08.prod.outlook.com (2603:10a6:102:225::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Tue, 1 Mar
 2022 14:57:51 +0000
Received: from AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803]) by AM0PR08MB3778.eurprd08.prod.outlook.com
 ([fe80::4dbb:4fed:bc86:1803%6]) with mapi id 15.20.5017.027; Tue, 1 Mar 2022
 14:57:51 +0000
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
X-Inumbo-ID: fddccaf0-996f-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0o4CclDFBM/vYkNxNk52Pf4Zvl4PzYaQgACplhV06M=;
 b=Zzj2ZsxR7weHIcVZF98IIaEyyVwOl2Mu3DBNAeeMci/MRlxXscmd451tNvqPl4LYfocWeshRknhaOX09+oO8u2KAZ3YHyWKHtLImsNuzippgdor7KdgHiZHUcx4DRY+0HRhLfcwdO4QQ5VpAF8MKM/wDxWWVKE4ueHiv2KMT7hA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2e52b09017e24f9a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgLcxz8yjKpe3EYkBQTvATaz/kA3ly6E/hNbIkO50uLrxjhlOutnIG+BDud5H1eD4cCpBMgrKLtcG8g5kgGUuB+LTkQl96FNY0DYL0XTGgEjWKzNrYOf5KgeAvGfVcmfktr3jHFFApjwPQNPO0yfbT4ZldbWB6otRch3YDw7MTW2VVsRbX4qx1gzNSVOElPWfBxdR4n9vdY73W6qwzr6vT3u0TIFCkpnJOQPT5L/DEUDKk32U840Pxm4hMqitdUiFe3ud+9PuRp5t7lGu8Fj/BjUaBjOKsgrHkFlbQ6gIwaRnbwZPzosZbdhD9gRZC9miiQYwPQfZ70mZ69bQ08LnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0o4CclDFBM/vYkNxNk52Pf4Zvl4PzYaQgACplhV06M=;
 b=dxkHk8Iw+v00Y75gKIUNUsoaXVzIld7DmMqb7lqTs3Z8nxdn1gNGTbHI8L0HKhSAeRfu/Um/R//jm/f8QYg7HWhVy1fz+eeCJmy6dD5YxDkIWM/B5qqLNq+FWlih5yhjZvoC/E0Dl5mn7shyLK3U6M76HQe1BVCPMhISUYXzox0hFwuPeI90DUtwQvFiGPw8uBWIBR86C5ynBHM629vN39WlIP6DukJ6YKcRDDi17bpfUbkP2iVLwhRo6vMzwmdns0Fiz17MpSCIzhH2Y6hyvB0CAHudMIKJnmcaalOmOQUe+33dXpfLfI+hsSmm25P2SjdprrSFm4bmOXeOy6WStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0o4CclDFBM/vYkNxNk52Pf4Zvl4PzYaQgACplhV06M=;
 b=Zzj2ZsxR7weHIcVZF98IIaEyyVwOl2Mu3DBNAeeMci/MRlxXscmd451tNvqPl4LYfocWeshRknhaOX09+oO8u2KAZ3YHyWKHtLImsNuzippgdor7KdgHiZHUcx4DRY+0HRhLfcwdO4QQ5VpAF8MKM/wDxWWVKE4ueHiv2KMT7hA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm32: head: Mark the end of subroutines with ENDPROC
 (take two)
Thread-Topic: [PATCH] xen/arm32: head: Mark the end of subroutines with
 ENDPROC (take two)
Thread-Index: AQHYLIsQ1/MnnQEZyUi9t6TTCfZIq6yqoFuA
Date: Tue, 1 Mar 2022 14:57:51 +0000
Message-ID: <0A2ACFE7-5B4C-41F5-8B3C-AF49FE635487@arm.com>
References: <20220228100740.60332-1-julien@xen.org>
In-Reply-To: <20220228100740.60332-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3693.60.0.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 26747966-9bbe-45b2-d566-08d9fb93e0ee
x-ms-traffictypediagnostic:
	PAXPR08MB7365:EE_|VE1EUR03FT053:EE_|AM0PR08MB3204:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3204C70613D90B7815A4F9879D029@AM0PR08MB3204.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CJrskTJhHIyNG724fh/o3VJpdjBRePlokmfYanPtqEdD7YBUhJL5U5td6gWcaRp2s3gnNfCHnruuUtof5uXmAtknfQACW/70pilMWuK3/LJ/1MLpAKFU76vyw6dnLE2FgQW9h1ePR4pg4AV3bawm9x0AXV6reqp437js0zHtiA0M0+HVPp9IVWrUtS+Udc+G0fUWxJ5R2QXdxAjaqcC9cBHB0mz7agxmXCtE9Z8D0ysLHFgpsF75Swx4h62WGnH7d88tfyT2EazN9squXeg8ZhUsak/dcemfyBCKDMt9eUlcBurpstXjaNizZLQZteXLB9ieUT24wq1fS6R3gqZ8rXpZhmyXAn1WFvd+T6cTuvFp9g8dYG3OQ3PWMV2CjgV7mvmqQ3FToMFRru75d8gWaRjkCEsZBKsv9J+zfY+f2m9yqWGvzhelFuZ7yYy54uaJg0l4rdRwdBM91QMUKo1KfRETtLUt1RNH9nbtDBFEGVxAil/0fu9UHGh4re8+XbxGtdCJX2eNQdnMxwgViJ20PmTHt8Fe8nMrSWSJhD5rZy6IHTlsyAJkvae4Ctri4I0sOKTQT4DgbA3Ypnp0gjEzsYMWEIM9e87v2pgv9yyuST3SO4R4mkU9dDaYQ8/mxBW0S37is+xh2verJMLFKnq1DwKKfvsTtLjIozuXskN7m5q/pFV8RRvWoaLgC6rFB5tokyGRZ4sG8Ubds/5aitRVrwzGhmJ4VNpaM5cAEnI2JOdqZrS75GV28Ff8ZVNWZKHN
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3778.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(4326008)(8936002)(8676002)(5660300002)(38100700002)(6512007)(71200400001)(2906002)(6506007)(38070700005)(6486002)(53546011)(508600001)(36756003)(86362001)(64756008)(6916009)(54906003)(316002)(83380400001)(2616005)(26005)(186003)(66946007)(33656002)(91956017)(66446008)(76116006)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <67650794060AE844BD958BB54DAA5573@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7365
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eb82adbd-c87a-404c-fec7-08d9fb93dbd1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pLkI055e0yZxpSCTZJb5xNG5+lhkmMyV0YgQxXB3uxTNLnhNOcYw9UfBzKjmAgS8IzT5SkojakcmHWehLw9OUSUwrTi67os25qNgdJp1TlAbXLu3UpArpv7b4HxTRxhHduJQmqgzS8Gwejgaf/1uAd5+K3we4RN1A402Xc9EcTkFlUuWRWK7UH+axx381e2G9kHBx0qldgNqM4ZY4AfN7GFQABK24br7i6gHMrSqGjmiY880xxN9hzPDwnwLjO4ocNVFV/nzv7Q1bHkLBcidP4s/LlUzAmAEM6rpL8HA/Q0f/E8i8M3tJ3dftv84G06AJXPILLRP5jcxVQZ/Bol7TmGZPFVLueWqAn7McaWIE7D5tvqfHt3+j5hg2OFoAYKQoLy2qKJ8O4yUTzccVdRl07BF95p3yMober4ohCHoYTnjQIw3XFQYnaP8Et7WfZjAUN232bmm00ajtUQISxRearzE0q5wg7KAD3+iGHMivpsRwsvBzLJYRZgRnfnEvcvyT9b0P3DOKxtc6YjzIz+ruUmp6m01DCwFONErNoaWvBipdx6Pd7fYjL4+1yqlAGqLLKwhqJQsWtTZeq8qrWt0J/W8HQcqzani2OQ26UdXosj7a4Fama3Bksyr9lhqElqolveZ32Y9Ls5g6LN8t9fopwNk9Xc1lk3SdIc2LIiRdsW2YW7YjM8f5q91PL4/bf3j
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(6506007)(6512007)(53546011)(508600001)(6486002)(40460700003)(54906003)(81166007)(356005)(70586007)(70206006)(8676002)(47076005)(83380400001)(82310400004)(26005)(2906002)(107886003)(6862004)(186003)(336012)(4326008)(2616005)(8936002)(33656002)(5660300002)(36860700001)(316002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 14:58:00.0742
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26747966-9bbe-45b2-d566-08d9fb93e0ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3204

Hi Julien,

> On 28 Feb 2022, at 10:07, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 2ac705a59ef5 ("xen/arm32: head: Mark the end of subroutines
> with ENDPROC") intended to mark all the subroutines with ENDPROC.
>=20
> Unfortunately, I missed fail(), switch_ttbr(), init_uart() and
> __lookup_processor_type(). Add ENDPROC for the benefits of
> static analysis tools and the reader.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index b1d209ea2842..13cfc837d39c 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -661,6 +661,7 @@ ENDPROC(launch)
> fail:   PRINT("- Boot failed -\r\n")
> 1:      wfe
>         b     1b
> +ENDPROC(fail)
>=20
> GLOBAL(_end_boot)
>=20
> @@ -694,6 +695,7 @@ ENTRY(switch_ttbr)
>         isb
>=20
>         mov pc, lr
> +ENDPROC(switch_ttbr)
>=20
> #ifdef CONFIG_EARLY_PRINTK
> /*
> @@ -711,6 +713,7 @@ init_uart:
> #endif
>         PRINT("- UART enabled -\r\n")
>         mov   pc, lr
> +ENDPROC(init_uart)
>=20
> /*
>  * Print early debug messages.
> @@ -798,6 +801,7 @@ __lookup_processor_type:
>         mov   r1, #0
> 2:
>         mov   pc, lr
> +ENDPROC(__lookup_processor_type)
>=20
> /*
>  * Local variables:
> --=20
> 2.32.0
>=20


