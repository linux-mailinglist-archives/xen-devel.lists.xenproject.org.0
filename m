Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D545EA591
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 14:07:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411738.654779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmsl-0000M7-4i; Mon, 26 Sep 2022 12:06:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411738.654779; Mon, 26 Sep 2022 12:06:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocmsl-0000IO-0p; Mon, 26 Sep 2022 12:06:43 +0000
Received: by outflank-mailman (input) for mailman id 411738;
 Mon, 26 Sep 2022 12:06:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M8J=Z5=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ocmsj-0000II-RR
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 12:06:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad1f7393-3d93-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 14:06:39 +0200 (CEST)
Received: from FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::16)
 by PAXPR08MB6622.eurprd08.prod.outlook.com (2603:10a6:102:153::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:06:37 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::76) by FR3P281CA0106.outlook.office365.com
 (2603:10a6:d10:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.14 via Frontend
 Transport; Mon, 26 Sep 2022 12:06:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 12:06:36 +0000
Received: ("Tessian outbound 8ec96648b960:v124");
 Mon, 26 Sep 2022 12:06:36 +0000
Received: from 4879ed8f2f2e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 921D22AF-9D33-43C7-80B9-6BA8135D346D.1; 
 Mon, 26 Sep 2022 12:06:29 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4879ed8f2f2e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 26 Sep 2022 12:06:29 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by PAWPR08MB9447.eurprd08.prod.outlook.com (2603:10a6:102:2e5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:06:27 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5654.025; Mon, 26 Sep 2022
 12:06:27 +0000
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
X-Inumbo-ID: ad1f7393-3d93-11ed-9374-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oORGdSySH9+twairRVwwGwD2AOIx6N1533QaaOuOukGjKbGObZr48Lx0ZCMLxdE3GuzjEV4R30JT6D9iM1qt3XJ2fZbRA7rWkPnaJBuyQVzgh+It1Rb/wsDuaegkWFQ4mes0mf9Y0FZq8e3IJcvyh7qqEMKMTJdpCTzDFX9toCpSamZXFZU2r5JzSV1B8w7eZoRVaTZDaCYFYgXDaECi4dYZHzYysncxO4DdkNTqxSoWr5J5VgdI9EVLH1Fm8eohBx+15s2SFREfxPE4hR7ThU4F/2pnM3zP7mBc5qaMNmSPeL4UMSKZEMpdJ+VI7TCfV2sQZE+1gnX4SKZ6AuhgsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWyUp9NBQRFH0tIBIClPXx/d6LVUNAPcafCedkiMilU=;
 b=QcEz/72aNvq00wpDbOvGAEdBN0s8fT2PCvz83dmEXv+5XuRJ5YzbGEYXmd4upejNdkzJstGpaHL61WKFYbsWhhYj1QUokfODNrJPT3PUJRNBnmrdFj2WZhXU1GGHyuQbtxoZTNpawM77d0QNcgUIO/vl5mGaDI11k2//kUdjKBT/lWupZAQqb6X08n/X7YM60DDPuXZrPtiXSPXk+KqJH0NP0zIHBRahfwJgLO8FZOUu9bAa62v64zCtKwetJy7CZH/HdrvF2JRb4akIV7lTM3aXjukUaNx2bBqQeW+5NvvIWRGW5gOpm0od/hH7ZppApICC7wDcg0juv3guAOaKBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWyUp9NBQRFH0tIBIClPXx/d6LVUNAPcafCedkiMilU=;
 b=xrMFe7hx3OSdG2Z/MFrRjPs3aWtP3Q54XnCvgq6vXAFjOghuYpePZP9RmDVYD4Rh+dAjrWL4Jmm7N2YsudSzAhrzVULo3mrhNHvSjhIayiRv9HRSTquC+q8OpUXOk6yxYSiapBePSUWGnbgQyGpm2nZEK4CfVbJFKRJvZkV/aY0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 438ed99659add482
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YaOqkZsnn2V3Q7fa/z4yp0nMkIVWvlo8rIt4Ap8Ta0orD2BCwAK6kChGi8nTJ20p0G6AhWSnoUIKjbQi4HsUMDuGt6nzA2R5UQQotIFMAdrJd9hQlZVF77GoKGrzHu88cdwpG1u038wKhc/xhaUF9+GXHCWPDnPfw66e8H1JvfjSXdb2De4hBF9xklGPhT27djd0SWZ080bFHntR8r9S5sxBP8ELCdxLOL/yLoiLKbL3qlhxRcOOhtYJkv8IbF7xC7tixzF+vt34/DXYuqhJrZmUDv5smGT8poCty3/CxSRRDbYkOV9HlpO7HqQWdLpFgB6NS1d7IEsw8sjeETOwww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWyUp9NBQRFH0tIBIClPXx/d6LVUNAPcafCedkiMilU=;
 b=UeeruQY/uIBc9bi31GrC1FymcqxJZ6nX8Fjg3W3t2QRL4g7tm3oAqHxDSszPUyhakxfgQkBAjtXfmm59B9sw3fM6KGuMDsUkpyWOfhHSC082NnMGo/wdSxjhQzBmVvTK2IG1KGa5x6L34vhtBJOAtVlssKlVL1Vw0zKNQ3IwzvMMGpC3YG8PAFxIzfM4lZhzTD0QeT8QhhQZwV4aXeoa4ELHWdc/nknkb9MJN32jWAh3G92QzF6RTj7unQiNNL+Q3W3otcqomwjMPg4HHg1k9GXsnijboZZglwdRQlpDfV6lQP1QEAzeC/pfr6Kd00CBtuLiG+/tqZ7V1Gu4U66Xrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWyUp9NBQRFH0tIBIClPXx/d6LVUNAPcafCedkiMilU=;
 b=xrMFe7hx3OSdG2Z/MFrRjPs3aWtP3Q54XnCvgq6vXAFjOghuYpePZP9RmDVYD4Rh+dAjrWL4Jmm7N2YsudSzAhrzVULo3mrhNHvSjhIayiRv9HRSTquC+q8OpUXOk6yxYSiapBePSUWGnbgQyGpm2nZEK4CfVbJFKRJvZkV/aY0=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen development discussion <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 04/10] automation: Add debug versions of Arm tests
Thread-Topic: [PATCH v2 04/10] automation: Add debug versions of Arm tests
Thread-Index: AQHY0ZfhXfy/h7Ly8UecudvuOTMapK3xnZ4A
Date: Mon, 26 Sep 2022 12:06:27 +0000
Message-ID: <E4CD81E3-535F-4ABE-88A1-F05B3695B005@arm.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
 <20220926110423.26030-5-michal.orzel@amd.com>
In-Reply-To: <20220926110423.26030-5-michal.orzel@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|PAWPR08MB9447:EE_|VE1EUR03FT007:EE_|PAXPR08MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b75e358-1211-4212-bbd9-08da9fb78fec
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 XJkQCcD1OTWMSn80mBwbckF5RR71tBcdoDPZylT0AxvfXxDBrAUoEgTPS1ibWW7ulqXll3/0orC+H8qWSRMXoz78QnbW7j0YSljTVtpzyljhg2qAqrkL2S59zV0tCLeTgJN6xgwNle3fG3w2uJaNHb1d4hov9vJso+1hYlm7mVoV9+hAw/yy8TRFDslFcKVWNc2Ps1Lo8SD/lny+WlMoch1tpKo9pKn3PLJ5srp3jq3dkY4V9mBXPk0mTjUvIXEYxFQKpjMjoRFxatrPAjrGcbRwA1/bQuGUQln//5tEWVNdBV5qttgIbiyDAv67xT68L4YhvjgXRtmubZ7Le4hOXYLP1lejVtbohcBPMHXl7iikmDoQCJqD+RGM/5Qf6BIs8Dn6su+QHyYYofpPL3FLIn/2WO0DsWzYcIYjs06Dz9VolRDyxHe9rSpbK0aZXTQULeQnRWk/uN4pbJ5i1IkoS8a6vmr9n/EhG9tg0W+ktnNYJMpYjsRThopCEpKUtzK/VdOBGzijhmtJQENS9pkqsp2jMHLhp4ZgQZR9TX6hcp/m/RULvSLi+Y+/96Dw5Wz4Pe+e1AjhZSqDtK5SPawTd76pgM9XEKQteDOd65qsvg9Ys8yfU/GamvpyYgTGI7QaMEct+JiW3HF4WbsPzJkEQKBNY3yF71DuaTcq6dlZz/FzTvb7G00Jo6gCH7uCnARfB+z2tsTHKiIjS0ALvtne9Qzq930FATHdUw0CACOed/mcFZ+lTtJN7cHXny99K0un3xXb3F/vGfbbgJQAbK7L9uDrbEd9FVg3GmtEsgNRA/c=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(451199015)(36756003)(33656002)(38070700005)(38100700002)(2906002)(122000001)(86362001)(4744005)(66946007)(5660300002)(66556008)(66446008)(66476007)(8936002)(8676002)(76116006)(4326008)(91956017)(64756008)(6512007)(54906003)(6916009)(316002)(26005)(478600001)(2616005)(53546011)(6506007)(186003)(71200400001)(41300700001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <D39BEAB11BF47147ACCF169A00544DEC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9447
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5ef3c019-882d-4637-b489-08da9fb78a62
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BlB78I8whZfZOmH/rPjbhV3dS0MIYhscEpimwbtaGqJFB3WAOEYW74Km+BeJyYRcAUX8AbXuQQghaIp4tv/iQQFNa3VcYyE3X+7xTxuAf7hNGjNfGSwhCfWhr8MAJAPNlExtU/BndFZS1HEIloKIlqb/5RbgcMOjBsTN6FnqDp1/a8FLr3vPpYewbi9/akN6yqTzY/9JhPyAeIIqZFLN+HzTRXl2XGBDaTeh/wSmYPhuLlCv8DnH+akakIDkxl2I26fQAo0p1T1bKfcN854MbmT41biUcA0x/UiIJ5pgfup5QFPGlzrjNIETB7JSa1Xy554oNlijp2N+CWC6t/6i/XWK9Tr9zun14/m1e6XwktkjpgP/MMxNa5+glL8RAfGIbByOZZ1zi8KvyEF8hcFizlZaP5wbUOk3WEcxP3z40L+31c9uu4+A3jY8n8uxACIMnLNy83za7bRfdlEMpOBbLBzW2UraHwpn2qRXYCCqsho5vr/uwgN+B2thdH4IMf1IEZanVYM212wjLc2wJMETLtHAPyIlMYU8bO2++ddk6q/svaVzxKGG0LpxEwO6yXtizMlXusYw2Coc25IBo7LnBTeaSnZ04g449tivlFiS2pSjJpqV2DLZexOB81qM9WkTv5L1BJf9Hz187uj9sNh7hX7l7x39XYIpnHKsKLOguqmnW73BzXqM9jMY2Y0M2lL2OOdM2VFqAfx4VXl97w6oatSts7z0R5GctcN+sUT2TNG/wroZ3sU7uvm67cDXjDRwNWYu9AlmDGFe/HxVOpY1Rw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199015)(46966006)(40470700004)(36840700001)(316002)(5660300002)(26005)(6512007)(70206006)(70586007)(478600001)(8676002)(6506007)(6862004)(8936002)(53546011)(41300700001)(6486002)(107886003)(4744005)(33656002)(40460700003)(82740400003)(2906002)(81166007)(356005)(47076005)(336012)(2616005)(186003)(54906003)(86362001)(36756003)(36860700001)(4326008)(82310400005)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 12:06:36.7711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b75e358-1211-4212-bbd9-08da9fb78fec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6622



> On 26 Sep 2022, at 12:04, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> At the moment, all the tests are executed on non-debug Xen builds.
> To improve the coverage (e.g. we might catch some asserts), add new
> test jobs using debug Xen builds.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Changes in v2:
> - carve out the RAM size change to a separate patch [v2 03/10]
> ---

Hi Michal,

This looks good to me

Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>




