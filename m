Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B71067361FA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 05:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551383.860923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRiH-0006MW-42; Tue, 20 Jun 2023 03:07:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551383.860923; Tue, 20 Jun 2023 03:07:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBRiH-0006If-12; Tue, 20 Jun 2023 03:07:25 +0000
Received: by outflank-mailman (input) for mailman id 551383;
 Tue, 20 Jun 2023 03:07:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+cFY=CI=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qBRiE-0005Pe-W6
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 03:07:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2072.outbound.protection.outlook.com [40.107.7.72])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92f77a3a-0f17-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 05:07:22 +0200 (CEST)
Received: from AS4PR09CA0025.eurprd09.prod.outlook.com (2603:10a6:20b:5d4::15)
 by PAXPR08MB7465.eurprd08.prod.outlook.com (2603:10a6:102:2b9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:06:51 +0000
Received: from AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5d4:cafe::12) by AS4PR09CA0025.outlook.office365.com
 (2603:10a6:20b:5d4::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37 via Frontend
 Transport; Tue, 20 Jun 2023 03:06:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT046.mail.protection.outlook.com (100.127.140.78) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 03:06:51 +0000
Received: ("Tessian outbound e13c2446394c:v136");
 Tue, 20 Jun 2023 03:06:50 +0000
Received: from 96d0d435715d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67106944-D133-4E64-B5D1-EBA8078C0D67.1; 
 Tue, 20 Jun 2023 03:06:44 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 96d0d435715d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 20 Jun 2023 03:06:44 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB4PR08MB9142.eurprd08.prod.outlook.com (2603:10a6:10:3fe::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 03:06:43 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1024:cf14:d520:9b38%6]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 03:06:43 +0000
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
X-Inumbo-ID: 92f77a3a-0f17-11ee-b234-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54iKH+sycYsQbNuMSIEdX+wzjrK9Dcz3t9e4c38UQ4g=;
 b=Nl5Phievpigk0CWplajVjwAOH/mNwkBQnc72/xmx6lOBdtJPOeArAkdH25c4wr5swxEIg40CjY8PD/Dm2gR4qgbf3gTrloJWr6sZu6ocgl2SAav1KJ42jRiwJuVhGOGn0gjRA5tMwxefbnVfyo7BIBUU8SUnyHj0Ywi/CmkJVY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2fsE0W6+ds3C2nxUaWWFIOhgrlZ/nFcaSp194cdjilmaMX51Esu2QTOypEEgSaZ6jFxdvUmNFgrYgNteorZTcdPikYnovAcizwQKYb6GokYgWGfWWnWZLf8i0t9xZ/mon59cHc5YSLLLQ363uLEDy2xtkQioOSM3HxoVt2hDOTgMi833dgNdA9QNIMR6oOv92PQ+vG28zgHSlJ5UDr2ZQL68e70eU688yfgD73iAKCfWYvcktcEvc0nZ41KD5dPLgAfKoWsLN1gynyg5GDMcCzLtN2TjWzXMzfRoIuFbdVpTx5q2IBpQ9r4zwah1KmbXL8wz94xMAcmz5UCiURwVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54iKH+sycYsQbNuMSIEdX+wzjrK9Dcz3t9e4c38UQ4g=;
 b=C5TUgk6cvqgNZhK0N3Ve/sfojKmPeiQ42xeY9WWriXNJlHpnT3uJiwvhBlcCNd5KdOHHEBwexMRGMroHni0CYZ0PCHwgJZ1jr95eMYU1SMMpsGAcMnezAetdaM+N/sgAQBFku9FVgUPaR5LzsAJIcCfBYCToIjYS1WWTBtqJqN4xw/o2ezVhIV4Rgkw2mJeob8TVeX+lC1ti2R3Jf4tZWc+vsdDX77woyeiiRsy19B+K9YOeJhGrfoToeMMs2NqirCXDigNbPRgGkxth8GwVkRIS6pSkgEq5u57H/1uh182ewpB3yG4FN4qVQ4VeuqFyrUeN3UflSNlQu3qFefa/7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=54iKH+sycYsQbNuMSIEdX+wzjrK9Dcz3t9e4c38UQ4g=;
 b=Nl5Phievpigk0CWplajVjwAOH/mNwkBQnc72/xmx6lOBdtJPOeArAkdH25c4wr5swxEIg40CjY8PD/Dm2gR4qgbf3gTrloJWr6sZu6ocgl2SAav1KJ42jRiwJuVhGOGn0gjRA5tMwxefbnVfyo7BIBUU8SUnyHj0Ywi/CmkJVY0=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Luca Fancellu <Luca.Fancellu@arm.com>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: RE: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Topic: [PATCH 2/7] xen/arm32: head: Add mising isb in
 switch_to_runtime_mapping()
Thread-Index: AQHZos+1XyHwqUM4b0ab7XTMNqCqhq+S1PQQ
Date: Tue, 20 Jun 2023 03:06:43 +0000
Message-ID:
 <AS8PR08MB79917FE9E573457C04B8DCA5925CA@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-3-julien@xen.org>
In-Reply-To: <20230619170115.81398-3-julien@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 8D8275BEB88A084698935541BFD81C03.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DB4PR08MB9142:EE_|AM7EUR03FT046:EE_|PAXPR08MB7465:EE_
X-MS-Office365-Filtering-Correlation-Id: 84c3ad0a-9a25-461a-9a45-08db713b64d9
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 khlOux7xw/fZ1Lu/17IhBS/PtvSoeVSe5FOD2W6UZ6G49WA+b5laWnBw22Ba+aB0FozpqxujdM/6Hsqbl3uKwh9GyUnNKUP35dchSp3fUrAqElQGYymLb6HTafRgciuzbwE8XUWVxI8l+VjUzQiikkTJSQXhvUZjzB33oLq7yjzCFOUFjoqyHZvafEdW7IIcg2Xntm38aWcc7Mudtx89IK4SxwWXUKG301fB+dyKWaMk5r27+Q6grbSIKx5prb0vk242lXWsKb0JaMzkJntPDbdHCGeWJvGUJzbgQ8mmz2hipCgEfwwpNwBL4nGlKbS2qAoB1Zd3MFLYGVYLGJi2ZVPzMDhzIM0pYXH8eE8hWDcXt+1xVuKhVugGCTWpB+1jfxhNMYPUk4PcqQ+GqVfjcbxs/hwqNv2jWE0exk0HvZ3K7fQLh7muryJF81Gq9dLQ/nY3vIAb+jIxJhJwx26d1k+L5WDGInR+jbWXUGQuM5H+5DTwbgVBVYApeuo8+H6ZOdOH00H7x55QuQx865Ka/rLDm0SLQikHEw0HJWTUbDBhUlqp4EQ90nFZHuslywA4alxkHez1VOJ4d8kGcl4ppC30idaFq+izC4DYGccnSvmNehGVw2C/qOBsXa90XmNk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(71200400001)(7696005)(478600001)(33656002)(83380400001)(186003)(9686003)(6506007)(26005)(38100700002)(38070700005)(86362001)(122000001)(55016003)(8936002)(52536014)(8676002)(5660300002)(316002)(4326008)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(41300700001)(54906003)(110136005);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9142
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fadaca5c-2ac9-449f-c5c8-08db713b6030
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SAJFvgQl48aBDUjD7Bj94E2H7pMJpq6e/uhehkwl3HNvm+NYUN6Rt++HmJp7rwA5L1/AI6QbQzG+7Mq42dGQYTSxu9e5cuufw4+fhfgI1+LlBu/rsy7APIJYblmKRBkC0RC7Lm2jwXW2NfazXeCJQU4mB4V/0YmBM/gC71TcyqhdFvsXnBiFSVTwnHYCU4eFAiWMtv6e31seq67/P5oTI5g8P0qr4s2PDfy31biZ3DiDQG+8zXWJGA8lfXesJn6sQZTChR5fWXCM7w6MG+ktJwirwP4LuqyN/lOvfQkzqxmVg3z/UWeKuz0+zt+UPKgPOO4aeToauMqOX8i1PsX8rHl5HfFfUtVSd8EFj6hu+Yw/QGNQqnfKXC+1d1h7DwaAiaxJC6LjfPs98DmH22YdfquQTs3jHnZlH3dYAUBbEii3BW/jAJDaX3piU7qcAZ2B04kei5Y2xOjwLnk/hcQYpRvhWpYTTUE97EV59Pca5nEayApJ8n9kxwVQVxAnoxv5Jt+tWky53ES13INyag0G25/DhdeIgIAMp6dBPwa7mSrSQ0wdnjd+TLfNf5xMzs0WIwgnX5VRS3HK4z+3CLZaMNfR1EUDmm+j0OlSDzJZAu1zX7mk9iwzXn1/M+mynU5sH86y6/fiG7a5u4Pl7pr6wg3He4SOsbWzRgUndBf4FZU9Y1Vp4LyxA5RJqllUtDse18juVNz+3nuHukPaeNnDBiw+F9RbJ14lyIPZJBcov91L6xFYmwzYdmYemyQhpX8i
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199021)(36840700001)(40470700004)(46966006)(52536014)(5660300002)(8676002)(4326008)(33656002)(70206006)(70586007)(316002)(478600001)(40480700001)(8936002)(2906002)(40460700003)(41300700001)(55016003)(36860700001)(110136005)(54906003)(86362001)(7696005)(82310400005)(6506007)(9686003)(186003)(336012)(26005)(47076005)(82740400003)(356005)(83380400001)(107886003)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 03:06:51.1423
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 84c3ad0a-9a25-461a-9a45-08db713b64d9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7465

Hi Julien,

> -----Original Message-----
> Subject: [PATCH 2/7] xen/arm32: head: Add mising isb in
> switch_to_runtime_mapping()
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Per the Arm Arm (ARM DDI 0406C.d A3.8.3):
>=20
> "The DMB and DSB memory barriers affect reads and writes to the memory
> system generated by load/store instructions and data or unified cache
> maintenance operations being executed by the processor. Instruction
> fetches or accesses caused by a hardware translation table access are
> not explicit accesses."
>=20
> The function switch_to_runtime_mapping() is responsible to map the
> Xen at its runtime address if we were using the temporary area before
> jumping returning using a runtime address. So we need to ensure the
> 'dsb' has completed before continuing. Therefore add an 'isb'.
>=20
> Fixes: fbd9b5fb4c26 ("xen/arm32: head: Remove restriction where to load
> Xen")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

I've also tested this patch on top of today's staging by our internal CI, a=
nd
this patch looks good, so:

Tested-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

