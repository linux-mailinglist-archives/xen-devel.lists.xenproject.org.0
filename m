Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D43740E6B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556409.868920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESAd-00005i-0p; Wed, 28 Jun 2023 10:13:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556409.868920; Wed, 28 Jun 2023 10:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESAc-0008VW-Si; Wed, 28 Jun 2023 10:13:06 +0000
Received: by outflank-mailman (input) for mailman id 556409;
 Wed, 28 Jun 2023 10:13:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t2wO=CQ=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qESAa-0008VM-U4
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:13:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0621.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e4f75cd-159c-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 12:13:04 +0200 (CEST)
Received: from AS4PR10CA0008.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::10)
 by DU0PR08MB9653.eurprd08.prod.outlook.com (2603:10a6:10:449::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 10:12:56 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5dc:cafe::29) by AS4PR10CA0008.outlook.office365.com
 (2603:10a6:20b:5dc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.18 via Frontend
 Transport; Wed, 28 Jun 2023 10:12:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.18 via Frontend Transport; Wed, 28 Jun 2023 10:12:55 +0000
Received: ("Tessian outbound d6c4ee3ba1eb:v142");
 Wed, 28 Jun 2023 10:12:55 +0000
Received: from 5eee9c5af022.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D25C07E-0379-49E9-A956-CFCFEB586F68.1; 
 Wed, 28 Jun 2023 10:12:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5eee9c5af022.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jun 2023 10:12:48 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7465.eurprd08.prod.outlook.com (2603:10a6:102:2b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 10:12:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::5e17:39a6:eec7:c482%4]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 10:12:45 +0000
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
X-Inumbo-ID: 5e4f75cd-159c-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytMUx1H7ss0hd3UytxPThLf5zo6q5W6W3wvb57CT95c=;
 b=DHbk4gIbC2VyYrlm9oI6YDGlBp/2HUhZOZ0/B6NiXRvY/ERvxv98rONXtoTiwHxOU9XYn8E/VceNWZ3hPfX/gAmumfx/4eDsyRCkd5lxWgKaTKoCKhX5Leaxsbt4Yi6DtFLvR5q0W/KqDiOaSXeGVkmNvAV8YZnFOqNI5i1Wgyc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1b14e92bdc0e73e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzTBrVVC4bmnj+4D8vZBaCbPq5/Jf/ApXCjwXAIfwhPVgrqGEi1HQOFs0Kdq6qsrm2wrjRCvHRWgf2KoHxK2DXf9jPqWRSVEtCxQGJbRuTA09st1ZI7XqL9D/7XLuy+sZuFGsJ16u+Re7Kln6sqjCwQJaSl3vuJJZ8Ch63wlszd4Ow65TDpPFbUab2peCeGFppdRV83WPkq5cR9y9yjcDm+5mJumYpHb9WL7lUuJkmkMauRQahOeG7T99k27LmiieLGKSCy9OlGN6uu6/qPGOL8O/kIrFAr99xvMcElLkvHM85c9BJiMXtk4ApPW0b2i+2ziJqkYfxm7TU5b24vxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ytMUx1H7ss0hd3UytxPThLf5zo6q5W6W3wvb57CT95c=;
 b=j81gRI3ZF+CnIT2/fjuDACN+QWpZBWYf4E50/MLEDA7VNdsAMPrLIZCgcToUWzLgPuSwOf97h8ACS745zm6ExZGDo/kfhJ4LHOaXwRDlQAta3rLLgjsRtJe5xOkI3LyI+sQdrRQ5Ki22oxl++K71sR1L99QsSwhql6NUzFEE1lPC8F7Mf5HB1q1oQK/2b2GXLQHFERdJLLjJoJHpJDjtGEGBhXKalW4tZ3IYnaBppy2owDPIIjibO34PT46j/rVCwCHXbS8rNBhl39sR5RY4KVbJ5L3JNMP1+k9vAX4c6wD5xMcRqeHg2/UDrh72TJqoquA7BgkGYLD+I8TtC4lBsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ytMUx1H7ss0hd3UytxPThLf5zo6q5W6W3wvb57CT95c=;
 b=DHbk4gIbC2VyYrlm9oI6YDGlBp/2HUhZOZ0/B6NiXRvY/ERvxv98rONXtoTiwHxOU9XYn8E/VceNWZ3hPfX/gAmumfx/4eDsyRCkd5lxWgKaTKoCKhX5Leaxsbt4Yi6DtFLvR5q0W/KqDiOaSXeGVkmNvAV8YZnFOqNI5i1Wgyc=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>, Henry Wang
	<Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list of
 create_page_tables()
Thread-Topic: [PATCH 4/9] xen/arm32: head: Remove 'r6' from the clobber list
 of create_page_tables()
Thread-Index: AQHZp6aNAcSElr/BRUqZZ/p1BOWK86+gAs8A
Date: Wed, 28 Jun 2023 10:12:45 +0000
Message-ID: <17C9FAB2-9BA6-46B5-9E6B-99E9C674C5B3@arm.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-5-julien@xen.org>
In-Reply-To: <20230625204907.57291-5-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.600.7)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB7465:EE_|AM7EUR03FT046:EE_|DU0PR08MB9653:EE_
X-MS-Office365-Filtering-Correlation-Id: c5067e13-4b64-45f4-2cc0-08db77c03df4
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 qNQQchDrMb1i3dxlM728UL5w6c12slq4yXvL34raOk3lp5whQkb0WM7MzmkwoqOht/yh1Q+tPT4P3LczbytsNVllaA2RTTj59YAT5SONO0loJOFUZyzCP/p1EBSix0HICKAwcQyxBUc1LC+iIi+qxyfz6x8y73czdMdjFb6mPZMJCrqjS5lD91DnPPAm28bE4gdjDw5ezn+ZS8X+k28VxIaVAP2hSbgi9KsezBL04xAvaLduq2+etzYbS7oBwbnhrjhM478S3sLPi4IIuU+ANIsAdrYPEjM47MYHD3S/7jP/xqGnFtV97n6Squv1YkxnBqKoxsNRlSSOLGv7frJs9rj+qYLVY6HyIG6IimcgcSxvBVkf+QjKoqZbQMC6lClQKCfI2az2jDQBl7jMEQ3hselOoIHjJzAhaaGTJNFQSc8FNCW+rG04pLJQ2C3kM+kf0T9baxKLdtqNp5kn+r+f50KyOwCvPUMQMJnNVFoX9o6RLl1jMAA2NyyUPUpXc8uTGsCXtMQDOQOukzZMtVzWfhAMvZNdpAH9nUKvplg2j4T3LAzFF/jvjEuXjE3trDhpZqgaBnjWuBTdBqeF1XdDxzjSBHoYcVpgqeVk4khAH3mNvK7Ms6e4mMhJPP4cMEoj+9y9kbs+1F6+ss1povTQ4g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199021)(6506007)(5660300002)(66446008)(33656002)(66556008)(316002)(64756008)(66946007)(36756003)(478600001)(4326008)(6916009)(91956017)(66476007)(76116006)(8676002)(8936002)(86362001)(4744005)(2906002)(6512007)(54906003)(41300700001)(6486002)(186003)(38070700005)(122000001)(38100700002)(53546011)(71200400001)(2616005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C7280FA8A72A5F40BC9A9168D9E725F8@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7465
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fcea62d-3808-4b49-1611-08db77c03792
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fQWKtV8AOW2K9JkKqxNd7l8QFFiCWIVfO7XjFMQE3CSn/KawBqkde75nAn9jMJRi22dE2Wgxfz/xsyDsScGfcxgQ8c8lAhkY9PFWuhe62B3FAcGcZQ2d/Qlr/vDbanXHW8g5+fcChWPKmYHRet8O5tr8U2OnTEz5L3PNan+Bl7XSAWsQh5F1ivlZnZn2ZXPyn37egTmE0tURyi854A0cCf46kMKC9f7f+MJ+jDrZp0ILc0g2LbJlHuV6rpfaTk8WgFMefUnIF6QuNeFwNKFbPwDQFY2+cP14gZn1WrkoGdT9FBIXZX+SkTbPp/BxywgAoth2Evs9m2k4sU22HhrtppamrXC4q+oNCIpdhzPZjsJn3lg0eNAf6uN3fRpYMQleVTWxCaxfZm6EyB+XYf+4kDMP5amcmEh3mEaX/WfE9DGyJdLdN/eswpzJr2zkzFUnqZhEKX7Xpy97DRupVBPziXruqUVSuj7mSMhm96SYZbjAzA1stc7tYHLFDdcM+NIxqnziAPiMP2Jpk9oNmERGTuIhL5E2VWvuiMnEAnvBQ/GUlDbj3MBJ8oC8Wjw4IexUPYbIevW9g8lNTBus0KTDCtomffWQ+TYeOQq+XIFPv5Z4a7YnZ7oP3UHQl0NTkNbBycj1D/gpxIs/P/ms13u+0sSUiM8k5YS6eFk8xarKVaz8K0qb6SlS2gW/KJLytu2ZUGdlrMAIDshj0vseOtSC4oVKbRI8jqmNYMXNCQcFqiQczyW+/ND3LnVjaKmMoDa9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(53546011)(36860700001)(70206006)(40460700003)(36756003)(33656002)(5660300002)(356005)(6862004)(86362001)(8936002)(8676002)(41300700001)(316002)(4326008)(81166007)(70586007)(40480700001)(82740400003)(107886003)(47076005)(2906002)(26005)(478600001)(6506007)(186003)(2616005)(6512007)(83380400001)(6486002)(336012)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:12:55.9427
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5067e13-4b64-45f4-2cc0-08db77c03df4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9653

Hi Julien,

> On 25 Jun 2023, at 22:49, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Since commit 62529f16c8a2 ("xen/arm32: head: Use a page mapping for the
> 1:1 mapping in create_page_tables()"), the register 'r6' is not used
> anymore within create_page_tables(). So remove it from the documentation.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 997c8a4fbbc1..5e3692eb3abf 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -451,10 +451,7 @@ ENDPROC(cpu_init)
>  * Output:
>  *   r12: Was a temporary mapping created?
>  *
> - * Clobbers r0 - r4, r6
> - *
> - * Register usage within this function:
> - *   r6 : Identity map in place
> + * Clobbers r0 - r4
>  */
> create_page_tables:
>         /* Prepare the page-tables for mapping Xen */
> --=20
> 2.40.1
>=20


