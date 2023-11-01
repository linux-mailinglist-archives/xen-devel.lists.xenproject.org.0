Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5277DE0C5
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 13:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626464.976701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyAKz-0004jc-S5; Wed, 01 Nov 2023 12:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626464.976701; Wed, 01 Nov 2023 12:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyAKz-0004gw-Ow; Wed, 01 Nov 2023 12:28:45 +0000
Received: by outflank-mailman (input) for mailman id 626464;
 Wed, 01 Nov 2023 12:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7wFu=GO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qyAKz-0004gq-3T
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 12:28:45 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0628.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31db4117-78b2-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 13:28:43 +0100 (CET)
Received: from DU2PR04CA0244.eurprd04.prod.outlook.com (2603:10a6:10:28e::9)
 by GV1PR08MB8257.eurprd08.prod.outlook.com (2603:10a6:150:8b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.29; Wed, 1 Nov
 2023 12:28:38 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::cb) by DU2PR04CA0244.outlook.office365.com
 (2603:10a6:10:28e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Wed, 1 Nov 2023 12:28:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6954.19 via Frontend Transport; Wed, 1 Nov 2023 12:28:37 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Wed, 01 Nov 2023 12:28:37 +0000
Received: from fcbbfe95877b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 03F591F2-6A40-4AD4-8E2B-DF03FF78F905.1; 
 Wed, 01 Nov 2023 12:28:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fcbbfe95877b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 Nov 2023 12:28:27 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com (2603:10a6:150:a9::12)
 by PA4PR08MB6063.eurprd08.prod.outlook.com (2603:10a6:102:ed::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 12:28:21 +0000
Received: from GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::2c90:d66b:b17c:83f2]) by GV2PR08MB8001.eurprd08.prod.outlook.com
 ([fe80::2c90:d66b:b17c:83f2%3]) with mapi id 15.20.6933.029; Wed, 1 Nov 2023
 12:28:21 +0000
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
X-Inumbo-ID: 31db4117-78b2-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ogVprm7c/ASs3Dw9OO1J0bRZhaDCd4q+7VEyzKx6fgkctv3G6K/qngBKwZtQXrONmZyOTkG5uoBoUHpyZMXN4NRew1LtDIoDyGugiVCTQcMf86OyUUgPbnU0jB9Mx0YTwoldjiOq5+/KDai4sUPRooEA0W7GY8n85s6tBX4KEzv53KNdtm/6nZWi644/aNe1iAf58GDw+xVMv52snJ5jATInNhgHmn61JOJ0mfTKW8VHzlpP7VYTE3KyWeHaiFH+Cd65d+emInQCyj+jQNRggkAso6kK+cBuf/lCeDi5uNhZe9UMFbqlW6KVEXbsQTWXdtSJnbBFjsqbXyCIdybjDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxQYQ6NlEXNAbRqIbuc9ak3TVYEhdKrDtI+ZlzcoMEE=;
 b=kgTpXCw4Dv2sXCF4QRogSVtmcOD4Z7+7/Yl0m+uDEQqNeLTfN6Vr9RQeCu5mCpIPuMd/ZmRiZFTOBhfN5YOhXCdwuranPAbFzxU4AutvDcgFqW1LZAJnZi2WlKW2xPvf1xC8BSQ1/lNpGJcLdu5reQZxmi+jX8T7Y3mAbcMiMUByXx9VdtiMCFKOik8E1OWRcqYpbMfTmm6tSW8YCAkeweCUPjKw+SG1DH2fSkto2OhRVsZ/F3k6k8b9BAOeAhdOLlO++G8cjAbmzVWwp0HIwVVm0ncK/pfVENlUaEyIagrMBf2MqdKraXDSJbISestSoFinaLTojF7qXJyllDqhRw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxQYQ6NlEXNAbRqIbuc9ak3TVYEhdKrDtI+ZlzcoMEE=;
 b=3+2ri9z8NUvHmjiXeA7hrMUx2F33OpBHDo9lPrq9C0ajaw2ztKBDzfLXFBNvQE/cx41zfNhYORWuLaO8OQMmdWqsa7xDrfRIXhhVFSS/X+7vqh6ZLLVKzXTTobhDqrrCNRdxS5rS2Xj/DV5CLgBFJkTAsYkKGd7TQ/ngWFBRqew=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8a02745165ba3bd6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpvWy2yL/CKoDga3E2bxpU6sxyEt8YciwTZ3AfuZGDROdg2ga534plj/39YKAziOyrrs8mxo14+okROE/uXkcw7YftGH3FO5iZzd6nBYtFyhKrOcORv7+3JKtYJ40hTXPY1lZpfS6+auIhBIpNUV04Km87mlxm01DIB1kTqNUrsMNz+augdtiUz6tcoIu5tHZwgcrTDxx/H6fjg1+l0Wn4aQT5mStKMY6TPqSgTyvmqro/jCWeuUSC86POq+Q+wLl9D1jqoT5jqirZ2n3082g+1GQPU39Wa5XU2O67RM59cnJylQFoyjULRajpk5EwBBkVHLXSwCLdFPk9NFtNqyMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxQYQ6NlEXNAbRqIbuc9ak3TVYEhdKrDtI+ZlzcoMEE=;
 b=cilbTLeYtvUij8iWoaoj3AUnojA5S25RpGzg/kKQTqveia/3q1u8366p8caSuWOwd9VqLSXVG7PTZPGp4iWLl0gg93oedEYnAn793CfdtrrUYDV4ik4DPqIQWW7LfGjyNU1l+dwBTGPboJ4cxU8Epzgie6ZiLKs2nV74XcQUpvB/NQdo4dgTlddgKWKK/SlBdvNvrH4zRxm8EyIOK+xdgrpMgeEBc/P0rRD/whSpFQsLHWVtEd3mVnwmDpUacdqAMIZFs9ek1iBxciCZmAwcFi5NDpVBtRBsf7/S12bF8r23OlF69ins733KhfeQpd6NCAJufM8t0zN4H4LeB7DtdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxQYQ6NlEXNAbRqIbuc9ak3TVYEhdKrDtI+ZlzcoMEE=;
 b=3+2ri9z8NUvHmjiXeA7hrMUx2F33OpBHDo9lPrq9C0ajaw2ztKBDzfLXFBNvQE/cx41zfNhYORWuLaO8OQMmdWqsa7xDrfRIXhhVFSS/X+7vqh6ZLLVKzXTTobhDqrrCNRdxS5rS2Xj/DV5CLgBFJkTAsYkKGd7TQ/ngWFBRqew=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei
 Chen <Wei.Chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Julien Grall <jgrall@amazon.com>, Ayan Kumar
 Halder <ayan.kumar.halder@amd.com>
Subject: Re: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Topic: [PATCH v8 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Thread-Index: AQHaBVagUvAeq6Jj0E+dI1rvNGdSyLBkRaEAgAB9cwCAAKmQgIAABmwA
Date: Wed, 1 Nov 2023 12:28:20 +0000
Message-ID: <179627AC-9FB4-4DC5-A46A-D47A19ABA497@arm.com>
References: <20231023021345.1731436-1-Henry.Wang@arm.com>
 <20231023021345.1731436-4-Henry.Wang@arm.com>
 <f098a07d-fa19-4b40-bfac-7b121524382a@xen.org>
 <D25CD22C-F529-41F7-93AB-43BEB7157B8C@arm.com>
 <8ce56c46-b68d-4ff8-b047-3e2d3e3cb3aa@xen.org>
In-Reply-To: <8ce56c46-b68d-4ff8-b047-3e2d3e3cb3aa@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	GV2PR08MB8001:EE_|PA4PR08MB6063:EE_|DB5PEPF00014B8D:EE_|GV1PR08MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 6871f506-4016-4068-e0da-08dbdad612d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6hH2l7ZZ/IAYdU8MluWpw2hslkT0OGHtuD/oNjEL2AJd0XEKvP7Q+Anyf/LOLKnJo/OCVantjyaKF4JFos+sYupBCvfFhmNfPZ7l0x0FLlSNqoRnoLPTGaFkH4wjNESaw/TQgxZtnbmjXslAhFkckEsrumL710zuscp6Q2Y8f0aKaSuFybwR5klsoxYhh+Fi0MfzYLhozX2dQmz9MLSa6qGRSSunoNTZjwEYv3I5q33eu2YAe6Ksd8R1Pc6uT5vZWzh0H2rQKKG13RnS/j+RG2QgptM/3IhZ3LgMRT2M1szv5H0z/d5GxtyPVjkBsmt/+nqIvhGv859qZ1D+Rq++qMVwQ3orilpV0YT9pUH1Q9sOYOAyuhhYaQnvVQuu/YGeZYxTFQMnG5U4yedFEx85ObosSpHYUBkASwcAz8tkRLK8qK7W2ae+/Byb2vxl65sQPVH9q3PtlbkTeD42HiBd26nkCiJSBZbDkhr37g5cN+CtGPPO5Zi/NuxGLQAz+SuycPk9ChBx+hhacxrjPWOzBOi2smy4LR5c5F8egaEbotPCW7E33d9FcNPfP/4jz72tVbECv5qxKgy5puRy4xAN4aPLItUitHWyyNlpQFcC0IVfwP2lJkNFufbZCiD2R/Montj3UQz/KJGeRMHJ3W8tlw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR08MB8001.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(39860400002)(396003)(366004)(376002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(38070700009)(38100700002)(122000001)(36756003)(86362001)(26005)(33656002)(2616005)(71200400001)(8676002)(4326008)(8936002)(316002)(53546011)(6512007)(6506007)(478600001)(6916009)(66446008)(66946007)(5660300002)(54906003)(91956017)(64756008)(76116006)(6486002)(66556008)(66476007)(41300700001)(2906002)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <61835F5E014DC845BBC6E78E8CCBA315@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6063
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2a7dce15-3899-41b5-f444-08dbdad608b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	khwLQAwK3iKEHfU4P0iBCHh8Phsz3sF2noqFMRiLsq2DGaAZb+Sw0UhWpjH2i4t7pd1whnj2eEb81MPNFEQvRjKlcLAKsT/llV1rpPv6+w1MNNPT0EL7UGOQ9WKYYsqiGVKpoqP54wWZnkVPLGdvjGesmNQx3+LQM/wOFF1WnR1+8rs6PRTwbRtK4hy/klDRFqf8nG/LsuEygGP0Y878ZmX1I5pCjRVMWasHfQNNg5sLio5k41K6CLl9sJ2J8giCwqvL9UFPETG4sYftHIi89yyRs1tDFpnc1u9tIUQzWCCYtScqfL4RNQbzeF8bi+eodnaRcqWk/s12XxsEXFfMyFa4MEsU8qvjzShqbIbQTWR3ZX8UTedd5XpQHydRpt+M03pg49jrEJJ6WUJFM39hnyVQ00V6IbKAYFUrxTCFsDgUXBtRMsBU4P7VHyq8EmNWDqoBNmae/w00ITC4OXJG31OP1uwLLIgn8CIVrP6R6btUD2jTqBARazmp/gsQ0QSbrx8JI3iwbKqxFkZb4yqpbSOmqmUNcoZ0xVKt5/+/t6rHcJFbPaXWjv8TrYYoq2veWgeXYPZcWYmAvbX3kH/bEvWTA1j7CVXTT1YmWQJ0OVHuF38wE95+hvlIw3F6OEhrjFzZIUD9JU8nIDkXv1BHZ1xeOtmCAQvMeQUVKjNNCQhWPz//0E1vXyTNP3T/DGvEiviRIi3PbH0rZMb27jWI23mRFpfzOra8Yz/C4n0P1MtY8j4nZpjnY7z7t7cum7mA
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(82310400011)(1800799009)(451199024)(186009)(64100799003)(40470700004)(36840700001)(46966006)(2906002)(40480700001)(40460700003)(478600001)(6486002)(2616005)(86362001)(336012)(26005)(82740400003)(33656002)(47076005)(81166007)(356005)(36756003)(6512007)(36860700001)(53546011)(6506007)(8676002)(70206006)(316002)(41300700001)(70586007)(54906003)(8936002)(5660300002)(4326008)(6862004)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 12:28:37.6673
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6871f506-4016-4068-e0da-08dbdad612d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8257

Hi Julien,

> On Nov 1, 2023, at 20:05, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> While debugging an MMU issue on Arm32, I wrote a patch to sprinkle prin=
ts in the enable_mmu() code. I will clean-up the patch and send it.
>> Just to make sure, your patch is for both Arm32 and Arm64, is my underst=
anding correct?
>=20
> No it is only for arm32.
>=20
>> If it is only for Arm32, do you need me adding the print for Arm64 as we=
ll in this patch?
>=20
> No need. For arm64, we will enable WnX at the same time as the MMU. So we=
 are already covered by the other prints.

Ok, thanks for the explanation.

Kind regards,
Henry


