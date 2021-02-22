Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A65321938
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 14:45:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88075.165437 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBWb-0005EZ-0a; Mon, 22 Feb 2021 13:45:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88075.165437; Mon, 22 Feb 2021 13:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBWa-0005E8-SX; Mon, 22 Feb 2021 13:45:20 +0000
Received: by outflank-mailman (input) for mailman id 88075;
 Mon, 22 Feb 2021 13:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ieRt=HY=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1lEBWY-0005E3-GE
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 13:45:18 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.0.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c4db3e3-c542-4f97-b96f-a89c2b8bb81c;
 Mon, 22 Feb 2021 13:45:16 +0000 (UTC)
Received: from AM6PR0202CA0044.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::21) by VI1PR0801MB1679.eurprd08.prod.outlook.com
 (2603:10a6:800:59::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 13:45:14 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::38) by AM6PR0202CA0044.outlook.office365.com
 (2603:10a6:20b:3a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27 via Frontend
 Transport; Mon, 22 Feb 2021 13:45:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.27 via Frontend Transport; Mon, 22 Feb 2021 13:45:13 +0000
Received: ("Tessian outbound f8d85101260a:v71");
 Mon, 22 Feb 2021 13:45:13 +0000
Received: from 0a4daea76858.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8E71B778-7DD9-4127-A522-7B8E3DC2D7D7.1; 
 Mon, 22 Feb 2021 13:45:07 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0a4daea76858.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Feb 2021 13:45:07 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Mon, 22 Feb
 2021 13:45:06 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::5c93:6e79:8f1e:a839%6]) with mapi id 15.20.3868.032; Mon, 22 Feb 2021
 13:45:05 +0000
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
X-Inumbo-ID: 2c4db3e3-c542-4f97-b96f-a89c2b8bb81c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B512dvbpOnEYWD1i4RnQHZAQXptOjs6RivQrMPNyXkc=;
 b=rcZNCYjfc5XqrT+N6e7OFayE8bSXAjCPZTnr1iFq9NpHyODn0L1XuCBpqFJWSogwtDSXvyePA6xVcvqBcWNzPrEDKvLTshOp/mfIYnJdCaXUusNfPQLJ4kT4z8MpeW0/eFaBIcZMqtRZgtvoKInl/CFFSC1s2ut04aX4aW61PKU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e18be2a99fcfbbfe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b/26/6d5cxdTWk+R5cOP4ZhcLYfR5H+lPnl+DPFi77IDMIQzjHh0lBlpGAk1OJWiIeg8Eg1awTvo80oo70fcK7/DLYnWalhPfTUNnpz0U8JuxJFM1annoiNBC+hQgnV+4NTNV8bexkHnKugbk3unnSRGtdc3vVIWaDpnCw2uSXLys3mk/ZPsHVQVLyLsGaqUc+dsu/kOBDwUZDO94CDUGsjMU4u9AN9Qcx/ML+ay8emshd8Sbwi6yaOMRsg3z/FR51vXOoiALl6RJxO9Ojx4jETNRKzY+h6UPfyAocuie6EIe7DOH/glIJqOVaFkWOai9f1mKo4JpfKoqd6d6xSCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B512dvbpOnEYWD1i4RnQHZAQXptOjs6RivQrMPNyXkc=;
 b=Xu1oLZGVbKEBkLvT/W9noBdP0WWbD1nVoxSjW1PpiLo9HYmylfisC3sk+OrAzwSQq+QKFJaL4LJ1jIYOvUN6ALy96n7rL/19LEosjMVeOB/Vig0H0Wn5WQ8v83uxNfUd90pBQ2HemwKcuBDyJKX/2prBpJywv2GAxxd2qWhzbmfLxQuBgk8XwAts1nw28W54VC9uOhb9SzvxmgyUoPtM2PotybgtbHc34oNOLktGgFPFHuLK0G9XshqAcKUZbUAKeORxmI5HwARh2raY4kFEd4UEY8ix7LvTVmEk0qfyaFAsaxhEIulJHeu3JPph1zIlZX9j/Z0X8w3DJXNljSbtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B512dvbpOnEYWD1i4RnQHZAQXptOjs6RivQrMPNyXkc=;
 b=rcZNCYjfc5XqrT+N6e7OFayE8bSXAjCPZTnr1iFq9NpHyODn0L1XuCBpqFJWSogwtDSXvyePA6xVcvqBcWNzPrEDKvLTshOp/mfIYnJdCaXUusNfPQLJ4kT4z8MpeW0/eFaBIcZMqtRZgtvoKInl/CFFSC1s2ut04aX4aW61PKU=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iwj@xenproject.org" <iwj@xenproject.org>, Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in vGICv{2,
 3}
Thread-Topic: [PATCH for-4.15] xen/vgic: Implement write to ISPENDR in
 vGICv{2, 3}
Thread-Index: AQHXB5FR40tx26Grzkm8HRIE12rerqpkMreA
Date: Mon, 22 Feb 2021 13:45:05 +0000
Message-ID: <F86904EB-91E9-475C-B60B-E08C5C9E76C3@arm.com>
References: <20210220140412.31610-1-julien@xen.org>
In-Reply-To: <20210220140412.31610-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 01ba3c79-59d5-4af0-33ef-08d8d7381498
x-ms-traffictypediagnostic: VE1PR08MB5758:|VI1PR0801MB1679:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB1679BF7D3F88D72B4076293C9D819@VI1PR0801MB1679.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Nk/HHs8SlHq25ZiYJj7aIHFnPl2iv3x2V1pwC9ZPq2J0fk/JTqWJsTle4O+9On3OCWBmHKCmjUZ9ROqj7IgwRxORyFdoyPoHRD+ffTHxuXqlnrz+9i8OEcbyDht9oDlxmMTGlN8tiRqoSZuaSlz3/s2qQMWHVSmddiePR9KRRXdJGmuFn/+ob7eKwNJjeTIL5PUwFvAVI2LDbzuMQ7LYiK3/6kvbMZXWJcInz9ca0NvlM47XgqKWjDcSN7rj7H+4+utXh8JsX9i/lgaGzUZMFHKRlUH+/FkxtnYEF0o2uVz23T3uJI0JSub0cEV0Fz8Npp2kZHwTI+4zSpgmEWSUbQ3C5SDD1xxHfL/xRrZvycwsXtp6AdhcOFqFmRri2WUUb9eIQrpE5OQnswFe1+7Ho29jKVgi6ubAhIIONDm/3dTJM3MCDa8m603TKQxWuw0J/41Ls6gcbHSoJ9hvVRXsNL8Uar6V4q78M1M+nIT3vNccBtDTC1ygsN1BFeXmne4BqXSTwQmskltgrGOSaCAcIUTKXKjGBAROTLoVvQcjHvkez0KzOWEJS8o46m8zhF9zkSeWBlwJb/lN0KveydgQ7KYADt2Z9ZdHUz7VmJuGYQU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(346002)(39850400004)(366004)(86362001)(66946007)(5660300002)(64756008)(66446008)(66476007)(54906003)(8676002)(76116006)(8936002)(66556008)(91956017)(6506007)(6916009)(478600001)(55236004)(316002)(71200400001)(186003)(26005)(53546011)(4326008)(6512007)(6486002)(36756003)(33656002)(2906002)(83380400001)(2616005)(21314003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?TrFwDIlMz5FSbhTx2qs3ovpnr8BH7MlgXAEzC++0bXEgcvataPZNaFtgWavv?=
 =?us-ascii?Q?NM4RPeZB2LJ0x2K1E1VEZ0HOSVRMgvYYHfy8DTUbECqF1YGZp5Ye2T+1nPsW?=
 =?us-ascii?Q?7MoOCVWjmahBLF30IlHrhW0hMc/Y/vIgdto0p/Q4WECMbpNF9CAhxZ5EimNy?=
 =?us-ascii?Q?nYAw4mM9ew/pXqL9uW4f4ht7DmSBQtR2QZ1a17ERjJbH1oG5A2DpLkBgKKae?=
 =?us-ascii?Q?57mjCtuIY82LHLlDKPsbKlnsfBV66rpZ3syCCBF1g41G7S7p4AYuUoLkA81j?=
 =?us-ascii?Q?/e+bKYgFZnkoLI6i1h5bImEuVMLzRm+PD+IMsAjhPziYPVdrkAzPy3sirAwW?=
 =?us-ascii?Q?pPnyZjaq0n1nokYRDkhnuK+lVMRylAw6MgyVaxTvnSVMkmCnH4s8vC+sG4OY?=
 =?us-ascii?Q?Zinf/jWTk1KPzlQHzrHXHLr6BfzfK0Loe4DLtPl5C4US/zA8DchmG41k9wzW?=
 =?us-ascii?Q?KXliqCrBFTloE4pMRws9QlsULwwPGScBAdlT2UqPIw35ALtXu/dgGDXagyfg?=
 =?us-ascii?Q?F4sD0Daj5ZIbYHt0EQo9ByRQ/AWr35CCMreBMaecfEgSbLzgKrw6a9+afqNf?=
 =?us-ascii?Q?hZwUFkkCc3IfNcRAZm7HNPQv7jmFYDAhCd+l+y2li+8gW53afFT9EbbBnPja?=
 =?us-ascii?Q?1qQXwL2v+vfPZeIQG1OEP0D+5mSguUMNEiG4Ac2rLJztBz284HJHl4WkGNO4?=
 =?us-ascii?Q?cIDxwaWP1VAfe6StrwLznwWsiMxML/DzR24k13qGfPBL04s1z3KExFYy9fae?=
 =?us-ascii?Q?qfl/LH01mC0n0WMcYu7J81tX8XOx3Gd1Xz3XubfIMxtHzgd1M8XW8cmZV6+m?=
 =?us-ascii?Q?DcRd2N4w/QX+iSihVDTiU9twxwfDDKz8Ca0rNwkatrGxdw/xtYldChh0KNe8?=
 =?us-ascii?Q?YnzHME8WTucGtiHf7h5G2MvJ290Sw2FjwfShJ+Q0Lab0Jb8aZcR/B+uRc/eM?=
 =?us-ascii?Q?lTdVha+FfvRFt94kZDMSA0f4YXAu8OCyc+CPCBnvvTUVdX/AbkCY+N0SYN1n?=
 =?us-ascii?Q?5y4cXnGswnvZaDBjEGSX0earpp0a+JWt+ZJdR57EQuX03Ovu2TKDptF0+BeB?=
 =?us-ascii?Q?4Jvhy3s8u3VFLh4ITC3ShKQ7CJizwKUWhUqcF7nI/IrvMHbW18kE7GdxP8/d?=
 =?us-ascii?Q?Pwf7B6b+abnOgHF32acyPkL/PyYR2YehELnvWmGnAPBvrufK48DwiAoYUrac?=
 =?us-ascii?Q?1Xj+UYr1stEKrySDfnx4l2DmeYa/4KrC3zPhuwmRLK7/rPRDZT/rkrYPrNOt?=
 =?us-ascii?Q?grAqtntKLtEyDfrUkNX/+vrmE16DTdoZH4Q0xRU1oHfpjpqepS23PaBdT30C?=
 =?us-ascii?Q?a9ronT721CcYsL/n2WyKiu2+?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BCDA3449C65DDA48B38A5A65A2E5905C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	37037d5e-2a82-4708-b542-08d8d7380fee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hnQogsVQ0MqYlVyADmLLz2hj2hpU2OnmZ+MLcRenX0zh0EpGCp4o04awhENff0+nbgDYc+bC9dBkEqYvEk+upAQUGhm7nKWpqDj/Z9kDXSMbRhiUcIgRDDUNonrsewJq3vHkx+CkFBJLzMhgyXhR5OfoXKE/NuTqzNglSFGa0wBS8kiHGQ4vIwiaidBxicijPvdkvaWzLLdVN1pNskISyGKHQJh5PGSfGBsZIGoY4/OqP6cqqiLNdeLiW2YpU6dmsLzMkb58KXJoLkF8o9htBI4z0nLVDCyOstBrfMEPS5GkqQhDGUsqb5VKyM+QFhy3rG0SvZmo2e4n6pSB6/ja960D/mMDwhdi7wVmFXBqrZ7PdRakcqBK2LaN5psKiZ4LHumapLvuvHHHeT4hOgXDmoRpvdd5/G/2zQhc3sm6j+GenBbvZ4waXyKhc+NzRRykt4Pca+WEb7vBIjTK15WBdOCB6dGoN68dq6IbphwDvZq6sYbZU63E437uZuhz0Etgi9nPvLI6AHlIkyOXUbPJiev6J0mrBQ/DLq2Mbid11sJfAIU4gwG1hoxxv3jvDTh5NFSgwHX692oOuSWtbJ3ydeE+HKPMRsMp/Ngqr6ZUyXhewtJDBENwN0mcMN0f87LKzyExFCCgwbYOrlj84ilnNxvWxHY/RO5I+NPe2duk4jKC1XafQzyLc483NX1cMfCk
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(346002)(136003)(46966006)(36840700001)(186003)(82310400003)(8936002)(2616005)(81166007)(26005)(55236004)(8676002)(336012)(83380400001)(356005)(70586007)(82740400003)(478600001)(33656002)(36756003)(53546011)(6506007)(6512007)(107886003)(2906002)(316002)(54906003)(70206006)(36860700001)(5660300002)(47076005)(6862004)(4326008)(6486002)(86362001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2021 13:45:13.5835
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 01ba3c79-59d5-4af0-33ef-08d8d7381498
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1679

Hi Julien,

> On 20 Feb 2021, at 14:04, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, Xen will send a data abort to a guest trying to write to the
> ISPENDR.
>=20
> Unfortunately, recent version of Linux (at least 5.9+) will start
> writing to the register if the interrupt needs to be re-triggered
> (see the callback irq_retrigger). This can happen when a driver (such as
> the xgbe network driver on AMD Seattle) re-enable an interrupt:
>=20
> (XEN) d0v0: vGICD: unhandled word write 0x00000004000000 to ISPENDR44
> [...]
> [   25.635837] Unhandled fault at 0xffff80001000522c
> [...]
> [   25.818716]  gic_retrigger+0x2c/0x38
> [   25.822361]  irq_startup+0x78/0x138
> [   25.825920]  __enable_irq+0x70/0x80
> [   25.829478]  enable_irq+0x50/0xa0
> [   25.832864]  xgbe_one_poll+0xc8/0xd8
> [   25.836509]  net_rx_action+0x110/0x3a8
> [   25.840328]  __do_softirq+0x124/0x288
> [   25.844061]  irq_exit+0xe0/0xf0
> [   25.847272]  __handle_domain_irq+0x68/0xc0
> [   25.851442]  gic_handle_irq+0xa8/0xe0
> [   25.855171]  el1_irq+0xb0/0x180
> [   25.858383]  arch_cpu_idle+0x18/0x28
> [   25.862028]  default_idle_call+0x24/0x5c
> [   25.866021]  do_idle+0x204/0x278
> [   25.869319]  cpu_startup_entry+0x24/0x68
> [   25.873313]  rest_init+0xd4/0xe4
> [   25.876611]  arch_call_rest_init+0x10/0x1c
> [   25.880777]  start_kernel+0x5b8/0x5ec
>=20
> As a consequence, the OS may become unusable.
>=20
> Implementing the write part of ISPENDR is somewhat easy. For
> virtual interrupt, we only need to inject the interrupt again.
>=20
> For physical interrupt, we need to be more careful as the de-activation
> of the virtual interrupt will be propagated to the physical distributor.
> For simplicity, the physical interrupt will be set pending so the
> workflow will not differ from a "real" interrupt.
>=20
> Longer term, we could possible directly activate the physical interrupt
> and avoid taking an exception to inject the interrupt to the domain.
> (This is the approach taken by the new vGIC based on KVM).
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

This is something which will not be done by a guest very often so I think y=
our
implementation actually makes it simpler and reduce possibilities of race c=
onditions
so I am not even sure that the XXX comment is needed.
But i am ok with it being in or not so:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

I did some tests by manually generating interrupts and I can confirm that t=
his
works as expected.

Cheers
Bertrand

>=20
> ---
>=20
> Note that this doesn't touch the read part for I{S,C}PENDR nor the write
> part of ICPENDR because they are more complex to implement.
>=20
> For physical interrupt, I didn't implement the same solution as KVM becau=
se
> I couldn't convince myself this could be done race free for physical
> interrupt.
>=20
> This was tested using the IRQ debugfs (CONFIG_GENERIC_IRQ_DEBUGFS=3Dy)
> which allows to retrigger an interrupt:
>=20
> 42sh> echo trigger > /sys/kernel/debug/irq/irqs/<irq>
>=20
> This patch is candidate for 4.15 and also backporting to older trees.
> Without this patch, recent Linux version may not boot on Xen on some
> platforms (such as AMD Seattle used in OssTest).
>=20
> The patch is self-contained to implementing a single set of registers.
> So this would not introduce any risk on platforms where OSes don't use
> those registers.
>=20
> For the other setup (e.g. AMD Seattle + Linux 5.9+), it cannot be worse
> than today.
>=20
> So therefore, I would consider the risk limited.
> ---
> xen/arch/arm/vgic-v2.c     | 10 ++++----
> xen/arch/arm/vgic-v3.c     | 18 ++++++---------
> xen/arch/arm/vgic.c        | 47 ++++++++++++++++++++++++++++++++++++++
> xen/include/asm-arm/vgic.h |  2 ++
> 4 files changed, 62 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/arm/vgic-v2.c b/xen/arch/arm/vgic-v2.c
> index 64b141fea586..b2da886adc18 100644
> --- a/xen/arch/arm/vgic-v2.c
> +++ b/xen/arch/arm/vgic-v2.c
> @@ -472,10 +472,12 @@ static int vgic_v2_distr_mmio_write(struct vcpu *v,=
 mmio_info_t *info,
>=20
>     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICD: unhandled word write %#"PRIregister" to ISPE=
NDR%d\n",
> -               v, r, gicd_reg - GICD_ISPENDR);
> -        return 0;
> +        rank =3D vgic_rank_offset(v, 1, gicd_reg - GICD_ISPENDR, DABT_WO=
RD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_set_irqs_pending(v, r, rank->index);
> +
> +        return 1;
>=20
>     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index fd8cfc156d0c..613f37abab5e 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -808,10 +808,12 @@ static int __vgic_v3_distr_common_mmio_write(const =
char *name, struct vcpu *v,
>=20
>     case VRANGE32(GICD_ISPENDR, GICD_ISPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: %s: unhandled word write %#"PRIregister" to ISPENDR=
%d\n",
> -               v, name, r, reg - GICD_ISPENDR);
> -        return 0;
> +        rank =3D vgic_rank_offset(v, 1, reg - GICD_ISPENDR, DABT_WORD);
> +        if ( rank =3D=3D NULL ) goto write_ignore;
> +
> +        vgic_set_irqs_pending(v, r, rank->index);
> +
> +        return 1;
>=20
>     case VRANGE32(GICD_ICPENDR, GICD_ICPENDRN):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> @@ -975,6 +977,7 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu =
*v, mmio_info_t *info,
>     case VREG32(GICR_ICACTIVER0):
>     case VREG32(GICR_ICFGR1):
>     case VRANGE32(GICR_IPRIORITYR0, GICR_IPRIORITYR7):
> +    case VREG32(GICR_ISPENDR0):
>          /*
>           * Above registers offset are common with GICD.
>           * So handle common with GICD handling
> @@ -982,13 +985,6 @@ static int vgic_v3_rdistr_sgi_mmio_write(struct vcpu=
 *v, mmio_info_t *info,
>         return __vgic_v3_distr_common_mmio_write("vGICR: SGI", v,
>                                                  info, gicr_reg, r);
>=20
> -    case VREG32(GICR_ISPENDR0):
> -        if ( dabt.size !=3D DABT_WORD ) goto bad_width;
> -        printk(XENLOG_G_ERR
> -               "%pv: vGICR: SGI: unhandled word write %#"PRIregister" to=
 ISPENDR0\n",
> -               v, r);
> -        return 0;
> -
>     case VREG32(GICR_ICPENDR0):
>         if ( dabt.size !=3D DABT_WORD ) goto bad_width;
>         printk(XENLOG_G_ERR
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index 82f524a35c9e..8f9400a51960 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -423,6 +423,53 @@ void vgic_enable_irqs(struct vcpu *v, uint32_t r, in=
t n)
>     }
> }
>=20
> +void vgic_set_irqs_pending(struct vcpu *v, uint32_t r, unsigned int rank=
)
> +{
> +    const unsigned long mask =3D r;
> +    unsigned int i;
> +    /* The first rank is always per-vCPU */
> +    bool private =3D rank =3D=3D 0;
> +
> +    /* LPIs will never be set pending via this function */
> +    ASSERT(!is_lpi(32 * rank + 31));
> +
> +    for_each_set_bit( i, &mask, 32 )
> +    {
> +        unsigned int irq =3D i + 32 * rank;
> +
> +        if ( !private )
> +        {
> +            struct pending_irq *p =3D spi_to_pending(v->domain, irq);
> +
> +            /*
> +             * When the domain sets the pending state for a HW interrupt=
 on
> +             * the virtual distributor, we set the pending state on the
> +             * physical distributor.
> +             *
> +             * XXX: Investigate whether we would be able to set the
> +             * physical interrupt active and save an interruption. (This
> +             * is what the new vGIC does).
> +             */
> +            if ( p->desc !=3D NULL )
> +            {
> +                unsigned long flags;
> +
> +                spin_lock_irqsave(&p->desc->lock, flags);
> +                gic_set_pending_state(p->desc, true);
> +                spin_unlock_irqrestore(&p->desc->lock, flags);
> +                continue;
> +            }
> +        }
> +
> +        /*
> +         * If the interrupt is per-vCPU, then we want to inject the vIRQ
> +         * to v, otherwise we should let the function figuring out the
> +         * correct vCPU.
> +         */
> +        vgic_inject_irq(v->domain, private ? v : NULL, irq, true);
> +    }
> +}
> +
> bool vgic_to_sgi(struct vcpu *v, register_t sgir, enum gic_sgi_mode irqmo=
de,
>                  int virq, const struct sgi_target *target)
> {
> diff --git a/xen/include/asm-arm/vgic.h b/xen/include/asm-arm/vgic.h
> index ce1e3c4bbdac..62c2ae538db2 100644
> --- a/xen/include/asm-arm/vgic.h
> +++ b/xen/include/asm-arm/vgic.h
> @@ -288,6 +288,8 @@ extern struct vgic_irq_rank *vgic_rank_offset(struct =
vcpu *v, int b, int n, int
> extern struct vgic_irq_rank *vgic_rank_irq(struct vcpu *v, unsigned int i=
rq);
> extern void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n);
> extern void vgic_enable_irqs(struct vcpu *v, uint32_t r, int n);
> +extern void vgic_set_irqs_pending(struct vcpu *v, uint32_t r,
> +                                  unsigned int rank);
> extern void register_vgic_ops(struct domain *d, const struct vgic_ops *op=
s);
> int vgic_v2_init(struct domain *d, int *mmio_count);
> int vgic_v3_init(struct domain *d, int *mmio_count);
> --=20
> 2.17.1
>=20


