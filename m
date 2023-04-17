Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3576E3EB9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 07:00:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521729.810558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGyF-0000VF-5I; Mon, 17 Apr 2023 05:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521729.810558; Mon, 17 Apr 2023 05:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poGyF-0000Sf-1q; Mon, 17 Apr 2023 05:00:07 +0000
Received: by outflank-mailman (input) for mailman id 521729;
 Mon, 17 Apr 2023 05:00:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c4/u=AI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1poGyE-0006Mz-09
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 05:00:06 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2050.outbound.protection.outlook.com [40.107.13.50])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b708d321-dcdc-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 07:00:04 +0200 (CEST)
Received: from AS8P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::34)
 by AS8PR08MB6103.eurprd08.prod.outlook.com (2603:10a6:20b:296::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:59:26 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::df) by AS8P251CA0009.outlook.office365.com
 (2603:10a6:20b:2f2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 04:59:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.12 via Frontend Transport; Mon, 17 Apr 2023 04:59:25 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 17 Apr 2023 04:59:25 +0000
Received: from fb1457913faf.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 714F9BCD-AE91-4BC5-B208-27BB3A025618.1; 
 Mon, 17 Apr 2023 04:59:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fb1457913faf.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 17 Apr 2023 04:59:14 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9472.eurprd08.prod.outlook.com (2603:10a6:102:2e3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:59:12 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::2db3:aa30:7be0:10a6%7]) with mapi id 15.20.6298.030; Mon, 17 Apr 2023
 04:59:12 +0000
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
X-Inumbo-ID: b708d321-dcdc-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3VEkZxhBKtjTkaSXciAD7QPBjlZijqEraymwNMCqo8=;
 b=KA51XTi1uen0a+yDR2dVe/EcfiiWcJyJ0+ZTrBu5TcDMV4J44iMuo35JDpeCMn1++nwUV/aWIfqW13Azq2gyKHFPlqlUm2VSxdXh9XefaRgox8NtBB/7alPz7wHntIxQVqvQKrU/tcFWCGkicsbzEoECgjsOl74Vi51v6fTSxxw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4muQ1jpFR5+Rk9avaIwR+w+J+VAXiWlP3C6ZxzsBSklucuGac1l3vKFO0xdNfF2J3V6mRuFYO5uliaFcgeNnD58BIb45lBStRT2NqVnC05mhb6ETMPkmkOuPla56ng6CZDNBiOuwLlYx+s51uHb/Dx1STbX6oNqbE4m0PU+cBfhAGml93POsTb6BwS+pWWQ6MZKuqqKq2/odwH1hb/sieU2ck2TPt5mc8iCpmlvle9phuztOWlPEeJShA4QMGUqcZsagd/rWXoE5nboO0S8b8gAh4Jos5KDuZSIG5n3OnueK14h4zCv6F9o+aMZpJkH8FJ4Hh7GVcFafs7z9fwtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3VEkZxhBKtjTkaSXciAD7QPBjlZijqEraymwNMCqo8=;
 b=cYhSzhXj4UUSp90JR43gtTOg4VqxazMX1ivfecLG5nwV/dvkXVKEpmAKJcexJhixvCNBbnsGjPlPNmTAD4GLXESaJ+oR605a0p2mziaqeG3oidAZRnv9u9V/W3RHhGkbHBlJ0NFX/Gz+asrQTFt1PPBM6FV7P0wZsEoTtggQL/Abw/WCpd0Fol22WwwMgTSx9l1y/09sGOEuiRxIccGTWUsk5e1K+2YQTZWzzZRttSjb0Ab05M/F8jw3M8YgjDlT31qBVmi0z3QGVosuzpyxPfCGZU5jVkRut2B+fKkJ7qPnek9o7D0wsHTLXKN1nD2BYbgy07d44nT586X2+JGa8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3VEkZxhBKtjTkaSXciAD7QPBjlZijqEraymwNMCqo8=;
 b=KA51XTi1uen0a+yDR2dVe/EcfiiWcJyJ0+ZTrBu5TcDMV4J44iMuo35JDpeCMn1++nwUV/aWIfqW13Azq2gyKHFPlqlUm2VSxdXh9XefaRgox8NtBB/7alPz7wHntIxQVqvQKrU/tcFWCGkicsbzEoECgjsOl74Vi51v6fTSxxw=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>
Subject: RE: [PATCH v7 4/5] xen/arm64: mm: Rework switch_ttbr()
Thread-Topic: [PATCH v7 4/5] xen/arm64: mm: Rework switch_ttbr()
Thread-Index: AQHZcHBY3cupzbzE6k+kIJf+YHXT8q8uz6sQ
Date: Mon, 17 Apr 2023 04:59:12 +0000
Message-ID:
 <AS8PR08MB7991B3A1AF8D77C1169B433C929C9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-5-julien@xen.org>
In-Reply-To: <20230416143211.72227-5-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 74C32E6F5E472240A9DD5D7443625D3D.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB9472:EE_|AM7EUR03FT060:EE_|AS8PR08MB6103:EE_
X-MS-Office365-Filtering-Correlation-Id: e55c7283-f220-44d4-1532-08db3f00845f
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WnmjhFHFVj3Y84C/NQieiqdunGALmvAstm0TRewicEj/qK1k5aP8GqHFixeHmbaU9TMt9NK1n2tEovuSxuFO/CZTtWyT9fvxswJE9QdGrqGtZzP+eMOopObgRhdB8AHMcQnE/k4UOPI7gMtgTslcw5Ecn+nd9hXsn8AykQHLknX4MRDERTFGdzuUShez759vXXUEl4E/lfA11o/D8lYqcPGzMBzV3Uvn/vcWzwEQXlLETjIynHPK85uMuQDi5u/F1uN7odwW4gj/Yh7AE4LJAKXzM4/3g2K8y4lmhXxEN9mvoXg08WGi8ox2AFfxvnIcGZ92V/8Mc+Bd8zw9tzCHeL5BFE2f7z3diuqUJ4HyO6bd+3aD5M6bFkgl2Ueh19/jjcDKZRKgtPal4jEb83foAz1rAoEoKURX7aWR7/XbZUrLZS7xxPcMHF4RByh1O5FRU62u4m/QhILkT34iQ1sA2GCLn9s0c6TJzGUEJq7SajHbmPw3acO9ZbWa88HTmv+O08otg9JG9mvX9tsi0DPNm8yiIQrbnVL3N9yywLGo7T8SSjAdRE31Jxq8OvqdwTD+ZzID1hjFm5WlX3HVcFmGZ4LBomA1v55pm1SOKP/JbcVyU3tRzR4fnWLjhlU948Mq
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(136003)(39860400002)(346002)(451199021)(54906003)(110136005)(9686003)(26005)(6506007)(478600001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(83380400001)(316002)(7696005)(71200400001)(186003)(4326008)(8676002)(41300700001)(8936002)(5660300002)(2906002)(122000001)(52536014)(38070700005)(33656002)(38100700002)(55016003)(86362001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9472
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	218a45ef-00d2-48ae-d54b-08db3f007c96
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	q4yMutviLYjZh6D/zTaXyl4+9Ye3DomV9wsi6TC5n3xTmy25GMF0DKG2w2J45berg5nFuAVfhGJFx7dAgfowmLgRHsPrEbqilh3ctMXkoM7uzEzqZop9QLTFoV3cJIqkVMw5f+0pPEaiwSujNZ/TYTT5C95k428KXNTRC8ZaN7c9lUx6IyD8w5HMkaXzKA26RpYc5WNUleGixnxINRdGRSkmwcnO/Gsh19yRhvXB4oXCJHJ1hHN+lEknLDLyQRiv7I7jc5XTb1avULS/CFUuTGlzu1evsaxrscE2dsxHxGP3ggKYYzDXQg8ffYQL5GAhM6E3oIAJl752/lZ7Cbkq8b9Id1WjLeRIz2Gl0CjWXH3x+p+KnPrQLOqWsCEcl0gTIVr3WcWGWgZ9OJDMTEczoQRVjNccwoquX08AnLtFIr9lSblrXTdFGPJgYxnLhmi8Q5CYY20lpTnF4VG7fDWW7mt7PB94OcP3ufA0QppQJpsGjV97XGPfGAeMRwqfy62/mlbM5rXk850YtH9xXavl8Ce+bNWXceKeDG1JPkLwqnCiGZGhaCsiWweMUjsvVUz5pZM6EMN3zO9Z6fKJ4y/WXEAf+UaTm6BXUdDaT4YfCv0UTnj4J3zm47jUYmx8wXnRAPomXU8ox7m3gmaqCT3KTT4KugArnhrjV4QtCjZN2rQmESlMKPCqN/swaHWEK/fvrPaJiQ1WM4BMIWUAFFrn6g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199021)(36840700001)(46966006)(40470700004)(4326008)(70206006)(70586007)(2906002)(336012)(82310400005)(5660300002)(52536014)(86362001)(8936002)(316002)(55016003)(41300700001)(40460700003)(110136005)(478600001)(54906003)(33656002)(7696005)(186003)(356005)(81166007)(82740400003)(26005)(6506007)(9686003)(47076005)(83380400001)(36860700001)(8676002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:59:25.5805
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e55c7283-f220-44d4-1532-08db3f00845f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6103

Hi Julien,

> -----Original Message-----
> Subject: [PATCH v7 4/5] xen/arm64: mm: Rework switch_ttbr()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
> still on.
>=20
> Switching TTBR is like replacing existing mappings with new ones. So
> we need to follow the break-before-make sequence.
>=20
> In this case, it means the MMU needs to be switched off while the
> TTBR is updated. In order to disable the MMU, we need to first
> jump to an identity mapping.
>=20
> Rename switch_ttbr() to switch_ttbr_id() and create an helper on
> top to temporary map the identity mapping and call switch_ttbr()
> via the identity address.
>=20
> switch_ttbr_id() is now reworked to temporarily turn off the MMU
> before updating the TTBR.
>=20
> We also need to make sure the helper switch_ttbr() is part of the
> identity mapping. So move _end_boot past it.
>=20
> The arm32 code will use a different approach. So this issue is for now
> only resolved on arm64.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I used the test method described in my notes from patch#2, and this
patch passed the test, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

