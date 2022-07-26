Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6158161F
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jul 2022 17:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.375415.607782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMCN-0008Sg-RK; Tue, 26 Jul 2022 15:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 375415.607782; Tue, 26 Jul 2022 15:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oGMCN-0008Pi-OA; Tue, 26 Jul 2022 15:10:15 +0000
Received: by outflank-mailman (input) for mailman id 375415;
 Tue, 26 Jul 2022 15:10:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jxi=X7=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oGMCM-0008Pa-63
 for xen-devel@lists.xenproject.org; Tue, 26 Jul 2022 15:10:14 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140043.outbound.protection.outlook.com [40.107.14.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bd5e491-0cf5-11ed-bd2d-47488cf2e6aa;
 Tue, 26 Jul 2022 17:10:12 +0200 (CEST)
Received: from AS9PR06CA0624.eurprd06.prod.outlook.com (2603:10a6:20b:46e::27)
 by VI1PR0801MB1742.eurprd08.prod.outlook.com (2603:10a6:800:4f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.20; Tue, 26 Jul
 2022 15:10:09 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::ed) by AS9PR06CA0624.outlook.office365.com
 (2603:10a6:20b:46e::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.7 via Frontend
 Transport; Tue, 26 Jul 2022 15:10:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.17 via Frontend Transport; Tue, 26 Jul 2022 15:10:08 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Tue, 26 Jul 2022 15:10:08 +0000
Received: from 4e8266a0ddb0.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D966AEBA-86B5-4CC3-94FD-CB8F038F0017.1; 
 Tue, 26 Jul 2022 15:10:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e8266a0ddb0.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jul 2022 15:10:01 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM9PR08MB6850.eurprd08.prod.outlook.com (2603:10a6:20b:2fd::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Tue, 26 Jul
 2022 15:09:59 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::5cc5:d9b5:e3b0:c8d7%9]) with mapi id 15.20.5458.025; Tue, 26 Jul 2022
 15:09:59 +0000
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
X-Inumbo-ID: 0bd5e491-0cf5-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Rwd+dgJvHu884DWt66eNozibCGOO9skRSjMP6PrI72osjxVDmlaECxpVEviwdVwuATu2uZxnUDFcsJOfJqY6NyfHhYcXAWynpemLodXls5ZVZmVa5FsbeNyWHD9GMwvNOKy1+vuDvH9CZWEdFUmtI0L2a1J87qjCCUWFCTEZyLkR0zbOWiCp+TJhVlCjpW/9R9aqMkJ6KBtn3u+bXovsWdDP1jjUJSt8oKJGTdbOSkN0emd2xKSDUjfnVFiHQYCY7ujCWpvl1wjkfe1CTrCmcEmUNirASsq0qsacKpjn6M9+Jw7d5kLDnA25S8mlrwtoD/cNhDPsGNO/GgzBFl+R+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBSjKsQeYHjf8o02HUbbhuAyN3XwGnAXi1WwZGf5xd4=;
 b=YDDnI5+T1a/Cmjl3s0lpcr9DzJPJxZdLaHAA0YEps4K1EQ8VtNkbJ1F6BJkpFpnNtLfkYRZvG4YQXY2B0s1X/mPfnUobW0bwtcGwp5JVV+Unxrx1ExIztTvfsUg+WHFk16D8SiRbc1OWi70kkD0IH6tOe4czLxrmofd0hqjKeanVFPgWJpPAVCimQ62o/rWVohxjgxyWHpYWtMr1vMSPhpS66L9yEYKYZtxcE4jKdKvGS7mwMlVev9LYNzIG6sOFv+hUrXINwF9KzOKX/oUHJ36Nl+5j/ywOqXIEQZ6Q6m9RvW8+e6Jhdq/3IDk6J/LYkbnu7QljdpGbctsGD2ww+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBSjKsQeYHjf8o02HUbbhuAyN3XwGnAXi1WwZGf5xd4=;
 b=uEF/Q0luYy4aDJaDP+9DNUtgzwXe6eRwDaosyncKFkEaA8asU+D9qh5bc96nyp37laZqiTIsJ6DPB99CsbcivBKlAHIdiWV/KBJ/6acem3qKRaIYO8M33odqPc69IJP6PyePqoio4irk2D7qbxq9moDqEX1PNmfj/uHRi2kX9Qw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c14c108640d208e0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7XP6k5u3JdMmRljeGQV0pxX4jTqAVYk7LDDT1AOS0z+kLmz5Di9xtpvfdbp2lv1gxl50N8tmYbO/i1uXtXFQc411V/VWgpBNHr4tjx6DchI0iyvCsNZe65A51b570EhcItkUdNv76jXvlK1bXCOagdJWdN+FW4OnBcN6ez0U5FRE+B/1vXQORrmbhKnfnjFPtJzIcjTU3R2XesUXs+oCZyIwgFxtpluaN8SKgagS/ZPUXi86/NDhPenP7odY647c8K0G9dnpxCy3u4l+kUKW7UhZyTMjtLTpM64TlkeYGllGpDrfRTi+aOTyr1sSCvj/Qwq1tfaEqZJEpYOV0yNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SBSjKsQeYHjf8o02HUbbhuAyN3XwGnAXi1WwZGf5xd4=;
 b=b0Zbh7jZ41eSJZ21HWikDD+k+7fSUp99zNYB3Qx68IpdTxucAQP3UANLPJwRXJfLFyIrx8d7kIWg/fgS0YNoEzYCOF9b+JFnvjYKn+kOlDuWgP10PMboXneaF1u3qYwvzD9WHyI5ixh91K/FRCINivAgf8lz8bAeWZSAp9YToZxaqaOQ2i3C+acT8cz/iyFdKvPFj+Db1tDVxpVMyTNOR3w9E9mfIMsN4RWTeZsk0g0rD4PODe9IQz4/u6PvlifcXUv2wrUCb7xmCT0B4xGCaGpah3+FO+9srSGvxaBmb0jUXJ5TjRxlbg4i3Rm35HpJ9tW3nMlmTDp2DFuMw3osXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBSjKsQeYHjf8o02HUbbhuAyN3XwGnAXi1WwZGf5xd4=;
 b=uEF/Q0luYy4aDJaDP+9DNUtgzwXe6eRwDaosyncKFkEaA8asU+D9qh5bc96nyp37laZqiTIsJ6DPB99CsbcivBKlAHIdiWV/KBJ/6acem3qKRaIYO8M33odqPc69IJP6PyePqoio4irk2D7qbxq9moDqEX1PNmfj/uHRi2kX9Qw=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH V7 08/11] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH V7 08/11] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHYm5cRehGtwJp7b0+IIGYzLnlX7a2QzFsA
Date: Tue, 26 Jul 2022 15:09:58 +0000
Message-ID: <F0469726-E888-4A46-9B8F-48F1F4281510@arm.com>
References: <20220719174253.541965-1-olekstysh@gmail.com>
 <20220719174253.541965-9-olekstysh@gmail.com>
In-Reply-To: <20220719174253.541965-9-olekstysh@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 303f1c5d-6942-4e8d-a7e1-08da6f18ede3
x-ms-traffictypediagnostic:
	AM9PR08MB6850:EE_|AM5EUR03FT037:EE_|VI1PR0801MB1742:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ymj21X7uiR6W6dPJow3zrOw9/4H3nk4MwnOXNgYomjOvsMptoYh54PY+5CMrvqhR4qwHLb2LISL6LvY9s5qHDOkdiH+GAbketLklXQIwefyaEut0prM/nONIFwDV1azc+WvJlVQ/wls1pzgVsACjl+KrOGs0husKyBAWBNUl0BXOMG5+yyHYe/+tEG5YKvUWdjq7o2WqdawCb0KqLUqZ+VgR6sXJAIYdbzMRSbcu9ubMCuZP1wDH+mY96jGX10gHWp/JXtNZ3Sr23h8ubRbLQKPe7yRXNnB5k76EalKp3qkLDfPqWF0oTNAqZMiyVi1A/mfp1DCpniS2mgygzzThhm7Y8EJ+lVe1WqLJrpx7vhdVXYpSD3UZHVgfc/18lABDFEIiuqOUu9rIdCzHSvPZRUVyhxf3bn9yjEA9kcooep0pi0V7jrSzl3TV5hduOwovYpl1xHYyVsTa0ErXYBSP8oOXMeKvV6fxATxdyxSXZ/dgDdVpgThYP6SCANLvromDRYgf/5bRFKq1S+PE0LhrjfPN3UbENb4hvoHV+jCIVT7ZHB+kkdAkKAnuS6Nk4W/ojKcfXx43tkjVN9hBKGrLG8AKfQ4oSQh+XrHG2XW5QQ/u5DGAOQAjyjYWhHCKgXqVW2ZUyOi55dQ3/iYZtg+5r28/WLRZcdkvAuXkArmCdVjrWU2gIdxFH+vH6OSoXE27z7PnpyziQbzG1SANPbFMu+Y75+NK9VKMyYrJxP/P2/Q/6lxT+VR9zQHd1fpc3I+TzjIumyD1qoDguB5ChCTVW+ppLqBjQzFLw6SR7rK3qgVNLGI78+Q6uObj3yngKQPSNZDkqOY69dM+SQAx3+QOBQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(136003)(366004)(376002)(66476007)(64756008)(66946007)(71200400001)(66556008)(66446008)(8676002)(186003)(6916009)(33656002)(54906003)(6506007)(76116006)(91956017)(6486002)(36756003)(4326008)(316002)(83380400001)(2616005)(122000001)(38100700002)(86362001)(26005)(8936002)(38070700005)(6512007)(478600001)(53546011)(5660300002)(2906002)(41300700001)(4744005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F53BF7EE4088DD46A345631C91EB3780@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6850
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d15e0c6f-2d9b-4999-dfc2-08da6f18e80a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hu89KnNpPQpnO7GGMssWuPunZgLI5PW0AlQtpHRsUa1klzDrgj0wyUQXy2utYZ7ytAx/gRpkih57K0RZGY5agEo12c/cbNZXRZ/GE6PZaVXJvqh364pPVtvjGh8+OSQHAsDZlnMWGmV9hZa74mRtU4QQeUIfDJruOyDJY+4uEaQkAFhyhWOAXDLjmdbiJyifVLSztF9Q4L5INPJLwQ7zz3HYsadsVPvNjuBxeIvr6gDym2QhCwjFf3kYIcm1XvvUNWe6V75Iqktqqh1qOtMt8eEbAxlk0yiT5LvVEviUhDTcla8+fCLGiopjZ9FCzJPfC337vPf7DRsoWoI56x7QKnJGxK8yeRzPjnSD4xIiP2je4kfl0G3uP+dMcOo/rD2R3wh7DueXfYETTxopD4Ftqo3dpUrS6fH6gUSkbvCf5n5L3xAB7vUiCReNsDxS5ptH5ECOzXpaDAxRMI10vehon0ornWgIlcT+eeKafnIXqvB4CEJY8auzrAiB6S1+rCLHnXYpWto1eVChVbK7+RBWrh50meUfTAC2FeFDjgoty16hKNkqBOBdL8csllruqrcSdipxERziIYu0WtDAqnejWbETGnT2CCkyxBZgqzFOpWUpk8QxUvGQxuftAhe+JDDhpltps8kHeCvqxnha4sZdv2yAqcjzl9IcoDcZDLkRZ26X3pUIBX8N+oykG1gWsE3j+vkuoHVgl2WsaN/RVG6RO6MFmiS9fXfn0BQYtLGSmkSNGy9Xp7gZbNJQGUToJuvPfsE1lCGsmkelYlecJTwCoRpO1a0xHS/A+PphtZMn85Ov3/gW17A5qZIqR8YayFeX
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(136003)(346002)(39860400002)(36840700001)(46966006)(40470700004)(2616005)(40460700003)(336012)(33656002)(47076005)(41300700001)(2906002)(186003)(107886003)(6506007)(86362001)(53546011)(36860700001)(6512007)(26005)(82740400003)(82310400005)(83380400001)(5660300002)(40480700001)(81166007)(356005)(4744005)(4326008)(8676002)(70206006)(70586007)(6862004)(8936002)(478600001)(54906003)(36756003)(316002)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2022 15:10:08.6739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 303f1c5d-6942-4e8d-a7e1-08da6f18ede3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1742

HI Oleksandr,

> On 19 Jul 2022, at 6:42 pm, Oleksandr Tyshchenko <olekstysh@gmail.com> wr=
ote:
>=20
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Reset the command register when assigning a PCI device to a guest:
> according to the PCI spec the PCI_COMMAND register is typically all 0's
> after reset, but this might not be true for the guest as it needs
> to respect host's settings.
> For that reason, do not write 0 to the PCI_COMMAND register directly,
> but go through the corresponding emulation layer (cmd_write), which
> will take care about the actual bits written.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>=
=20

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul=

