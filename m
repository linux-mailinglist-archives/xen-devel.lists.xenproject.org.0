Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5589278A412
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:59:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591355.923736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRXM-0003l2-Dd; Mon, 28 Aug 2023 01:59:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591355.923736; Mon, 28 Aug 2023 01:59:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaRXM-0003jI-Af; Mon, 28 Aug 2023 01:59:28 +0000
Received: by outflank-mailman (input) for mailman id 591355;
 Mon, 28 Aug 2023 01:59:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaRXK-0003jC-H1
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:59:26 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d5f494-4546-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 03:59:24 +0200 (CEST)
Received: from AS9PR06CA0327.eurprd06.prod.outlook.com (2603:10a6:20b:45b::22)
 by AS8PR08MB6167.eurprd08.prod.outlook.com (2603:10a6:20b:298::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:59:21 +0000
Received: from AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::a5) by AS9PR06CA0327.outlook.office365.com
 (2603:10a6:20b:45b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34 via Frontend
 Transport; Mon, 28 Aug 2023 01:59:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT047.mail.protection.outlook.com (100.127.140.69) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.14 via Frontend Transport; Mon, 28 Aug 2023 01:59:20 +0000
Received: ("Tessian outbound 0b7d6027328f:v175");
 Mon, 28 Aug 2023 01:59:20 +0000
Received: from 15dbd013b228.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C14A5BF-3D2C-49A3-9C0C-E7ADA97BFE03.1; 
 Mon, 28 Aug 2023 01:59:13 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 15dbd013b228.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 28 Aug 2023 01:59:13 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB10057.eurprd08.prod.outlook.com (2603:10a6:102:359::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Mon, 28 Aug
 2023 01:59:10 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::7083:22dc:6b5f:5965%7]) with mapi id 15.20.6699.034; Mon, 28 Aug 2023
 01:59:08 +0000
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
X-Inumbo-ID: 82d5f494-4546-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2OUpPHrRVxAY391QF3WkYaOHqw3HmDHfAlCFLQcAPw=;
 b=bmqaqEj1ipX9u2b77ptE/zfP5fqDjPEJFupqaKWgkvQ7C9sCltargV38bKRpOLtj2i4lgjTvEk4sAqNrKh0dVVFJzWR06Wu4403pBsV2CH+QVsWvXa3IaCCIPHkeDu5hFaQY1tzenAAs+YsK5C5IOMhReWiQLiIsLEiesaUbk2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d6ddbe69031cad96
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LH8e2fDwdIgyWRdbiuSLmB/z4uGvAGUuRczCg4clNYdLsK6aidvD/9YLvDU5mxGDXBuYwKEYVwEPA8keaUwepiUcV/ugr4vfvMZ8ciAIAaBu7mBjkowBjWJvgE0trQ3tRp5r+Dj4xEHEHHWt+BMdoSHjEV4iD2pXbAZ/gdTeutpBaZ1TFj1SMrDzMz1owFZ5PwUXLGigVDNiws36+0k6BU89NXoYLvCSW+SlxWZZEl/dPRRF6aD64AWJdjulbnTP7bEn0WAHDjmNia4Vp7EmziM3pPxPkvgwOPPnh1qd/g7DMY7QN0dVoCHRRQ1KrqGdQEcMCUNf0ScV67aJ3plyyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u2OUpPHrRVxAY391QF3WkYaOHqw3HmDHfAlCFLQcAPw=;
 b=cMSqtM3U6AZTy8Cpw7c3ERo0utiU619rL1gtZde1Z2RUhveEVDnNfP0nCkbUZ1hhYZ++tjE+868RJ+clnp0cOSXnIB1L47r3l58cyX6F14J9o+gWqmwog/7joIDGi2LJFA4XJh/XWRVbkXWpKgtYGZ6H/UHd4HQ5pVRGdo6a+ZtUkXhKzIWoxKfBRb7QYKDQeD25HhajqTBCO6TaTZ2QPMkW/ko6Qy/mPym0Db9J0P7ACg6jFUeEwDjs3JSI2wqtorakELqFKFGr0LDgIaCHZrdo8sLHmj6YtYEqBNmR04e2NZZ/ndRiDMIFryXUFiwvqirLMakFC7KqJeWTBTexzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u2OUpPHrRVxAY391QF3WkYaOHqw3HmDHfAlCFLQcAPw=;
 b=bmqaqEj1ipX9u2b77ptE/zfP5fqDjPEJFupqaKWgkvQ7C9sCltargV38bKRpOLtj2i4lgjTvEk4sAqNrKh0dVVFJzWR06Wu4403pBsV2CH+QVsWvXa3IaCCIPHkeDu5hFaQY1tzenAAs+YsK5C5IOMhReWiQLiIsLEiesaUbk2w=
From: Henry Wang <Henry.Wang@arm.com>
To: Vikram Garhwal <vikram.garhwal@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, "michal.orzel@amd.com"
	<michal.orzel@amd.com>, "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"julien@xen.org" <julien@xen.org>
Subject: Re: [XEN][PATCH v10 08/20] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Topic: [XEN][PATCH v10 08/20] xen/device-tree: Add
 device_tree_find_node_by_path() to find nodes in device tree
Thread-Index: AQHZ1yqk/rh9XTnQ3EOw+dopXp97ca/++BQA
Date: Mon, 28 Aug 2023 01:59:08 +0000
Message-ID: <E67AE49C-15E0-440C-A043-4AF5524E43B9@arm.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-9-vikram.garhwal@amd.com>
In-Reply-To: <20230825080222.14247-9-vikram.garhwal@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|PAWPR08MB10057:EE_|AM7EUR03FT047:EE_|AS8PR08MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: d3cf04fb-435d-42cc-e22a-08dba76a64e7
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lM1SLFZYvuxtSlMkfxDv4CVRnExZ2J9zzo1HAoAIUojLNLrkPXYoPb5d0G1dNwNGyf5443XjmTGYGvZK9JYBofbad/jXOgiRcqwo44sN41eIlocGZO/5wGP4PZH9oy9PyE3Zu2zpnvJj8hnkZl26Z0MJMAj3cdEunfOjFrBme07DiM9JYNIuDOUMjTmdia6/6P9REG8NVh8ssMHkQGoVXZmBsTcxGtI575oY1jH7SI/dsmR9rzSYm9ya7T9ZSi0dskR74MjpT0Glmf8vX/GlVrX3/BgJBlylzQt9gsk4C/1RKoeEI3mKzOSfNKIqmOt+5WcE/LuDVs1Zx5LwvsRd88nvhKahXCoKm162bdpkPhFuoLy+yr5qOHBGix8StvchLTrOnoH+T6fIX+6qa6akRyYsGCgpduVsRzTDEJbIxr3xkpggpHFGf8tJE+RbKvCzVZjikNSUWeUBHwJKLswUFMm2n8C4aOugvYWAVXuRp+TJXr36u9jIGmNkSsbhpFCXUF3KEJF3hr/EbypVRgVTjnKP2ezSigAe2Os60RQxsuaLlr3uOabGmHLjdFBj2IK99dZITjSq1sw+btZyaEPw9yX2ak/RNRBSmwpWRJAyFaIqbCnnnoDmuDt8aTQyJI5XjU5/TVG8iFKTkeDAD2oaNVpi64bQB/T/eejj+jrLoJw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199024)(1800799009)(186009)(83380400001)(478600001)(122000001)(26005)(2616005)(6486002)(6512007)(53546011)(6506007)(71200400001)(5660300002)(86362001)(4744005)(2906002)(54906003)(6916009)(33656002)(38100700002)(316002)(91956017)(38070700005)(8676002)(8936002)(64756008)(66476007)(76116006)(66446008)(66946007)(41300700001)(4326008)(36756003)(66556008)(37363002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9DC3E37AB07F3C4EB04BCB7249290FF2@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10057
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8e3cc93d-0563-4753-c629-08dba76a5dda
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WacNxyUNe3FtPaMmrYWh8n9LpuiNyVqFXumdUSSFrNdEYe3F0QSmsTP1FhG+sBI9Yd2fG3ReMkN1GXJgkE8AAzDIjPkkIpWvPnxfqVFm/9nCQWlzbdi4A5hZTU6/g0NW1UJVkp+8m1rZPUD+oN1Kd/UvJ3CSn/ekpSb4USgJp+deZsPHsaoap9suf7yshDTEX0/OQMjMAKn3n8gR2zVxmjui+KUfWIL3hKldhofIrT0cixQ5RJ8wiQ0n6XP2Bruum4iFlCTEfR8z6+tmh+4lNLLmLWsPjRJwkHbmamhJhf5dKjXUvL0CazL2Tla17/i3WTAM3j/nyn6V+u+oKG7RbGQzB7cL8CARW57o0hai18ie0A0MJmAPhhz9vHayt1dZl13FMh7841FexdfK8NxH8tgCLszcY++t2Xu3qfSpBuZmXynbAHSb15HIeSTgvihrcyxPsEyofPkpjpNCpfe2jTw+dx8JS9lTdQNPrUPnqUlqWFo5KQOVTr6O29j1bbvdyXMQulmmV34BQrB+xR7f8Xl9m75eyJ8Q+0kNLLI3eZW0PrrKxzo92qi4L+73ma1+OTdRW3JIeyl8HGhtlxNYKfKNXbZgIdICVeA7/kk80FKpvakIsDAR3QXePTzXKsW8JJ7njoRjsb7YB335ED9W3GD+tqyj1GB4V45Row1sKVh6fq7sUdM0sO/pyqzwRgGKVtsYcxTk3ergZKydcyc6SD8ff2mL4u07pxbfmixFoSM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(82310400011)(1800799009)(451199024)(186009)(46966006)(36840700001)(6506007)(6486002)(478600001)(83380400001)(336012)(4744005)(26005)(316002)(53546011)(54906003)(6512007)(41300700001)(8676002)(4326008)(8936002)(70586007)(5660300002)(6862004)(2906002)(81166007)(33656002)(86362001)(36756003)(40480700001)(2616005)(36860700001)(47076005)(356005)(70206006)(82740400003)(37363002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2023 01:59:20.3722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cf04fb-435d-42cc-e22a-08dba76a64e7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6167

Hi Vikram,

> On Aug 25, 2023, at 16:02, Vikram Garhwal <vikram.garhwal@amd.com> wrote:
>=20
> Add device_tree_find_node_by_path() to find a matching node with path for=
 a
> dt_device_node.
>=20
> Reason behind this function:
>    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>    device_tree_flattened) is created and updated with overlay nodes. This
>    updated fdt is further unflattened to a dt_host_new. Next, we need to =
find
>    the overlay nodes in dt_host_new, find the overlay node's parent in dt=
_host
>    and add the nodes as child under their parent in the dt_host. Thus we =
need
>    this function to search for node in different unflattened device trees=
.
>=20
> Also, make dt_find_node_by_path() static inline.
>=20
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

Reviewed-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

>=20


