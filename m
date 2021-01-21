Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC312FE6AF
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 10:47:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71957.129256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WYs-00020C-Li; Thu, 21 Jan 2021 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71957.129256; Thu, 21 Jan 2021 09:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2WYs-0001zn-IX; Thu, 21 Jan 2021 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 71957;
 Thu, 21 Jan 2021 09:47:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6mg=GY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l2WYq-0001zi-Sx
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 09:47:29 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef234d1a-cd3f-41a4-8a74-68b0f5199952;
 Thu, 21 Jan 2021 09:47:26 +0000 (UTC)
Received: from AM6P194CA0081.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::22)
 by AM6PR08MB3317.eurprd08.prod.outlook.com (2603:10a6:209:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 09:47:24 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::1a) by AM6P194CA0081.outlook.office365.com
 (2603:10a6:209:8f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Thu, 21 Jan 2021 09:47:24 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Thu, 21 Jan 2021 09:47:24 +0000
Received: ("Tessian outbound 28c96a6c9d2e:v71");
 Thu, 21 Jan 2021 09:47:23 +0000
Received: from 60a608dca395.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 58E911B1-84FB-4422-9049-3ABB5A53FF82.1; 
 Thu, 21 Jan 2021 09:47:06 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60a608dca395.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 21 Jan 2021 09:47:06 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB2685.eurprd08.prod.outlook.com (2603:10a6:802:1d::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 09:47:05 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.013; Thu, 21 Jan 2021
 09:47:05 +0000
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
X-Inumbo-ID: ef234d1a-cd3f-41a4-8a74-68b0f5199952
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA4uZRpU49nu4ac35BYxCHWMCtffTLDf4gTZBenWqPM=;
 b=Zgrc1jaPW0+XawmUJw3yJKShwS+UiaFD6E2Yn62neEmsp4/l6yBZ53MRE90+xBaYxVjaqzdvWWXjCErSISbpKqyKc9RC6juA26y68LCvAGsoLywE/jLVTZhjVA8ElWrX2RNTaltx4/HZWRh8Yzp+5GWe/YBRxUfqVlpSpTdVzMs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8cb9e1d7c5eb12e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=joWYvcKdbMMy/+skKu//B5Ij1y9xezeR7Ul5BpeppTMVpaUa7X5hkX6zYLP8bwHRI/H4ZqCKKX221kxMHiYRcVjaTLmAY0ecX/OnKU3jTniKBdktaYGa6ry/nlmY+icqyYX3MvyEhWzpsTBp4h6LNNTcC+Gh2dguPL2bdX+05uhStGkooI82/X92ikt1Y3LALwYk1XrO2vCwp92pBWzdQ2HPuDg0ddPUaLYCrG7alv48l2eG4iNrQEJ39dxKFyBHIfCRrs1Ijb1p7cBcJxGU0g4pIpw/6bJL659NxYJmSEbWYIHv3iY5zvIP/bqTZsJSWnRGnNld2f37l1riWtou3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA4uZRpU49nu4ac35BYxCHWMCtffTLDf4gTZBenWqPM=;
 b=Vw9Z4EhpBQJDsK9FnlxFnj01cmqHdecOK8sgMb/PnyfrP2MiWCp6CyP/LyaW/JSmWZQzDELHYELeirxG3mCKcpDSzM1OmYLO6uohIp0P9aQo0Q/y9Rfua0zzNhafej1PUhPHi/KS1vpLd9AfizXwS8TkTvgZ8EsWTlnNlKX+fq+lftSlP58OGkKbV0r7llA2ZlTeZVUt+n/FZMtTUEvb5yLi0fBLayUhQMxrBOBMFxcje+Zto4Fzh0Qx5TECSJ1AIAlLzrPsmaUtjo07YJGtqECGVmY2kcUCnMQm10citKIr4uxspZ7CKrLE3SYFjB0W+hTbqg5vyFtVE09rF2yn/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA4uZRpU49nu4ac35BYxCHWMCtffTLDf4gTZBenWqPM=;
 b=Zgrc1jaPW0+XawmUJw3yJKShwS+UiaFD6E2Yn62neEmsp4/l6yBZ53MRE90+xBaYxVjaqzdvWWXjCErSISbpKqyKc9RC6juA26y68LCvAGsoLywE/jLVTZhjVA8ElWrX2RNTaltx4/HZWRh8Yzp+5GWe/YBRxUfqVlpSpTdVzMs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <Michal.Orzel@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
Thread-Topic: [PATCH] xen/arm: Fix compilation error when early printk is
 enabled
Thread-Index: AQHW79gjfjfuQDx1Nkaed0nd13wr0aox1Q4A
Date: Thu, 21 Jan 2021 09:47:05 +0000
Message-ID: <431ED40A-854B-4A6B-8EFD-CD3D21B035D9@arm.com>
References: <20210121093041.21537-1-michal.orzel@arm.com>
In-Reply-To: <20210121093041.21537-1-michal.orzel@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7e0473c0-5e02-41e4-071c-08d8bdf18e1f
x-ms-traffictypediagnostic: VI1PR08MB2685:|AM6PR08MB3317:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB33171D4938605F673D184FE19DA10@AM6PR08MB3317.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:556;OLM:556;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6dumMPmMYAv+L4dbndU8A5gtr1InnjrvnfhsygE32+0oD0OT/mFfMygQS5hSb7YrBeE/vUa3ASzHYZ9ATzBVWHJJSWP/afPUigCDo4F/1Kxo8qfYBCnXfQNn2gDtUBXSdYSdVvQ2V0EeVwI6UY9isyGqyNSvZnPNCHEpEnDsbLJYEcK2/UWHV8TUi/VcAxbfHrUxsohmRpPO4ECdNgqY2x0XNc/cP+3b9Jq3Wz5uCJJPJyi4KgnSVDee59biC2qPOK2wlM8gQ0TWLKoNoA413HbJfX1smSAeacOgmcUrTMhlOSTpTqf8wNxL4M8ntBe62koR3N26PwVSC2aROhyFh4udvLNvhVNqPFgEF/pWwMJhTSbq6b18tN3mC/JamWrP0Rdr2UNTdkzkr6uR6ylW/l/ggcNn9G8SOvz5qxVPSLR3vBDUVjfMVFZsz2xv3QJT
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(33656002)(186003)(54906003)(37006003)(76116006)(36756003)(316002)(2616005)(66946007)(6506007)(53546011)(55236004)(5660300002)(71200400001)(26005)(6636002)(8676002)(64756008)(66556008)(8936002)(66446008)(86362001)(478600001)(2906002)(66476007)(6486002)(6862004)(83380400001)(4326008)(91956017)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?E2f9uHWqJ/j8yfelbt4XHok/OsxzETCYApyFp3WxrHNFSZin6DMB/ntdpuCw?=
 =?us-ascii?Q?veAK97ONykDtPf3cecRqSyYA+7cgsCzI4jKK46fBgP6OMTK4HbTQwdn8ifFw?=
 =?us-ascii?Q?N05iTZjmUGIEah27OpsM/R0PbM4Rlywhs42IGFguuSeAg/CVQHWCLRHqQirP?=
 =?us-ascii?Q?iZxIAlRFv37+kCumEKrQs+JG10+UpY0WH/xXJZz9bBk9gRijj6MkNkAfB//L?=
 =?us-ascii?Q?BIA+2klcoOA+d1eyrR8OxakpLI6gtOeLqnBW9zGQrCWI1HrHvLBT3K5Mu1MD?=
 =?us-ascii?Q?9VcqEpvohGp+FmXZXCgBhAP6+E44nvG2aqVixils7Q38FVEO/Or7elU6Jzjb?=
 =?us-ascii?Q?5SVQkj+qpQy+FNrOlKs8YLivS8IkR9RhwCopThy7GY154zPo8wb7/st5raPf?=
 =?us-ascii?Q?ENwK6bVi220fIX/QBN9xEq7Hi8EQNS56AIYGlvldhcupMyBprC+9BB3V9Dco?=
 =?us-ascii?Q?Wg0YOX1S6Cl9JjjfeEi81cCfRJTC47qysc6nqRpM74M2xRLcMyqkeFoZwlnK?=
 =?us-ascii?Q?VNLlTJw3fbJxb4nOeAxdhRCqpKq3bgxRphODQbbAvuMY/070rjB3mYg9N7El?=
 =?us-ascii?Q?2AicUhxssfhl+qfhTaZTFt72RLkCM2Rul4hT6AA9ZY45a+TKi0lg81IL1toH?=
 =?us-ascii?Q?KC7Pmn2LjgFwTEMQbvQ0+QZ8rGeTfRiSfUPnglp8IwdWVDDgCd+5o/RiDfK7?=
 =?us-ascii?Q?Kr0JOAaudUCzkVR/f8gtDNDk5OETZs1NeD4QKJ8RCsDC4/42K5YqAJ2sq6yl?=
 =?us-ascii?Q?A6qLJNwx/nSonMfb0gjpji9xw9ZTIANvGLGt/q5zDtX2QtmTMdipMl3QMuq1?=
 =?us-ascii?Q?JWy9MRB5aw+hFVYuJB+xFgrYGSsjJZ4Nrk3184WUd2GHglP6E+6tSLSG6eIy?=
 =?us-ascii?Q?z1nSPcPs4R4a2cuobY7I5xCbHT8iptIKq5J5xEzwG13AZu1C1uyGSBq2qE6d?=
 =?us-ascii?Q?3mjN9HXO6FuQRXK9XeRSffFcKw2YRP8p0600NKMCMg2/H/UrkjpiAIxoJSCY?=
 =?us-ascii?Q?7Igz?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6BE37A978F8B1746BBCA79D06E9FABF7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2685
Original-Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5a6c7e1-f999-489a-90ba-08d8bdf182d9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	18cAjOpjMhrjhn12N7A51DkZFPu3frzSOWljlBrVNzinQpBxBpwaGsmNBNmRBbkgBTJpbvF8byiBiaXwlmFIpebizTZk4IzyOWo3vD3E0HIbwrez+txe2OHyLHwqj3vWcOvcvszlhnHeb1S3FPuS5Bs2cHjHf0qqNvSekRV6LCvPmmrIrIFW66v5g/vEXV7/rpGtw7BgLzuiczqRcBPPTMwggq8hU7vjHhih1sH4brIBjoySoou77r5Qgqyg83CdEhB+k3txPm3xRwiVy2pmo7i5D2ldo+TVbdvFONEzS9mDLOhMCiatOsD6Q4kTjKm8TlFg4pR6qB07PDrEC5dI3o98oLQok/B1Ue+TFxdqAUJSQC+YX5NcYL4/Pt24Z/vNQ+06D0lYN7dLcvDz5JbVkIVERyX9ppWfIpYsicvNDzTnu25yOV/1tlAYinHTlze/9sbgVLNurFxY1QMyLKNisg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(136003)(346002)(46966006)(6486002)(2906002)(6636002)(47076005)(316002)(81166007)(55236004)(8676002)(4326008)(478600001)(70206006)(6512007)(82740400003)(70586007)(54906003)(8936002)(6506007)(33656002)(37006003)(26005)(86362001)(53546011)(186003)(336012)(83380400001)(36756003)(6862004)(356005)(82310400003)(5660300002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 09:47:24.1551
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0473c0-5e02-41e4-071c-08d8bdf18e1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3317

Hi Michal,

> On 21 Jan 2021, at 09:30, Michal Orzel <Michal.Orzel@arm.com> wrote:
>=20
> Fix compilation error when enabling early printk, introduced
> by commit aa4b9d1ee6538b5cbe218d4d3fcdf9548130a063:
> ```
> debug.S: Assembler messages:
> debug.S:31: Error: constant expression expected at operand 2 -- `ldr x15,=
=3D((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> debug.S:38: Error: constant expression expected at operand 2 -- `ldr x15,=
=3D((0x00400000+(0)*PAGE_SIZE)+(0x1c090000&~PAGE_MASK))`
> ```
>=20
> The fix is to include header <xen/page-size.h> which now contains
> definitions for page/size/mask etc.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks a lot, this is fixing the compilation issues.

Cheers
Bertrand

> ---
> xen/include/asm-arm/early_printk.h | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/include/asm-arm/early_printk.h b/xen/include/asm-arm/ear=
ly_printk.h
> index d5485decfa..8dc911cf48 100644
> --- a/xen/include/asm-arm/early_printk.h
> +++ b/xen/include/asm-arm/early_printk.h
> @@ -10,6 +10,7 @@
> #ifndef __ARM_EARLY_PRINTK_H__
> #define __ARM_EARLY_PRINTK_H__
>=20
> +#include <xen/page-size.h>
>=20
> #ifdef CONFIG_EARLY_PRINTK
>=20
> --=20
> 2.29.0
>=20


