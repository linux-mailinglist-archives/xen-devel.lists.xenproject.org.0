Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 171FF5AB431
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 16:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397797.638481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU80w-0005xb-CB; Fri, 02 Sep 2022 14:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397797.638481; Fri, 02 Sep 2022 14:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU80w-0005uZ-8a; Fri, 02 Sep 2022 14:51:22 +0000
Received: by outflank-mailman (input) for mailman id 397797;
 Fri, 02 Sep 2022 14:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqvY=ZF=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oU80u-0005uQ-9x
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 14:51:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70083.outbound.protection.outlook.com [40.107.7.83])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3d749fe-2ace-11ed-82f2-63bd783d45fa;
 Fri, 02 Sep 2022 16:51:18 +0200 (CEST)
Received: from DB6PR07CA0199.eurprd07.prod.outlook.com (2603:10a6:6:42::29) by
 PR3PR08MB5836.eurprd08.prod.outlook.com (2603:10a6:102:8f::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.12; Fri, 2 Sep 2022 14:51:16 +0000
Received: from DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::1b) by DB6PR07CA0199.outlook.office365.com
 (2603:10a6:6:42::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.6 via Frontend
 Transport; Fri, 2 Sep 2022 14:51:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT037.mail.protection.outlook.com (100.127.142.208) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 14:51:15 +0000
Received: ("Tessian outbound cc6a8ab50b6b:v123");
 Fri, 02 Sep 2022 14:51:15 +0000
Received: from 77570224e9af.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 ACB23BF6-C2A1-40F4-B9AA-072381D7A1D2.1; 
 Fri, 02 Sep 2022 14:51:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 77570224e9af.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 14:51:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 14:51:08 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 14:51:07 +0000
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
X-Inumbo-ID: b3d749fe-2ace-11ed-82f2-63bd783d45fa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b7Bx4y2ftc/pvHz9eeulQOTF5qQIIEFfF5Q4xoBTO18SWyx4ZcWflypc3wsbmU9e07tR9PGmi2jOJjrniTM8Lwhr0qOnjqKldwOrnISXyOvjUCAK30AHfgSKixnSwFUbyZ4JArWhlf+NNfGX4DF2ELLAjqW5KS5NNI0tjW2W834Xw8179peKU8Yqsuoy0Ee312OsN2EDtsViFxvjIkk1Qt1df6vlta8F7t6bRRLbGos0VA5Oqa8txpBhnTo6upjbfPAMXvr4dOjHiZalcL7BG2Kkvf+nj0ZCCU+0ExFZIwikvLESpekSuJpQYWwgzOFZTEuK9fl1PLg0uXhA3WeMxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfU4WtZdxG3QjEDzMjigkky0H4P3dG5bwh9cBQcwF7M=;
 b=PtbB0ovHEj7C54o1D2Np0I2xuCpe6g7VH/+GnhdpXgaKdGFNSc8l327z1Xu7T3KMAZ3Cp6P8u/8fGzWusaOKAr6zNI6R+bQDUTxWqz7NNfLVBL46YSsjK9vSuJ10O+EkkrUxsIifM9OW+8vW1IhuTspMjilbrO/vfHjjC5gYuHWWTXGjOhNJeCwSgXymdluzianXBLwBTokWBIKixKsUQES+4aQfy7TrWhq1RRV7zHIK3lK5Iyr29Mo/pKAltF/THR1FpbUGoz1PB9cBGsDQgEQkbvqnfi2WHETFNcJ+4Fx63zV3wGNoat+OcaAJzEAQOzZZ7ZwlTOx7hlnlA/jxGw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfU4WtZdxG3QjEDzMjigkky0H4P3dG5bwh9cBQcwF7M=;
 b=qXZznj/W1wVqt/GIkC8qDncwy6JRWb0ErIoYU7txw8j/Omp4M7cE5Z1kP/s1ScWdCJR+CQc04O9iwzzUyj/iJuiV11z2IyVV4kEpNyQ84J19WQWpUXmdxxMYFShZyzK87ZbhbZmCs3DLmv5C27Vsaasj9O+HgIr8BKzGZcYfhp0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f759255cbe7da65e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGtNCX65okOSrB7fubbi0iqY80Nsk/HdoDKfCGRA/iSargl92NEd9iQcUD7e9R7d4HE5tMYBp5fvQc1R4coaniXxd0oQmFSGNZxQTq6IgED+ydk9y2zMI4bWyfVB6WJ1IkoKA+MY/H33PQWs9tReJ0+drIOo6wB3YkuAADL9Eaerogc44p7HJ6W8RYPsIOPxUEXkuCD+rdphPO2BIt6Z0X3GCFnA9l7CReg7dIX2SWck12xMAVGv1vRi2W6Un3chtCdOi8V1AXWj8xG8Lrkf3/v9nKUcXn6CwYW7MDkIjAHzlT+Fe6lcS5gAywZvZYUNhHyxwX7m4JCkt1/brGJ6NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hfU4WtZdxG3QjEDzMjigkky0H4P3dG5bwh9cBQcwF7M=;
 b=WxiVQpUR8+XZU59vIQs699dUqpNGKb9ilSyxdDxHFG1CzJwTs1LCLRFDOzq2GXnv7/snDhnHVUtNLjRqxseTekUHtOq/5JnvVSRp7CRt1D3jgQLhg3y+l5t+vWUzAuyZvgKW97EQRXygc7CDyey9VSX3H663ZLsnxre7Vqd1MGXfD3MlFITRnd8XHIPtBB3ATS3BK0IOahy5kkpGbkJILzaxx8TyDLgmcrbJHxH8tq4SBpkyAsMppSFPbhpFO7wxcBjBcNs/nL3nDQRLqQ4k4y6AwCSSUTKasKfpEH60n/gqYHxD6YJjemKrTKVwt7tvyhCIVyHbKxYjrCgryqx51A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hfU4WtZdxG3QjEDzMjigkky0H4P3dG5bwh9cBQcwF7M=;
 b=qXZznj/W1wVqt/GIkC8qDncwy6JRWb0ErIoYU7txw8j/Omp4M7cE5Z1kP/s1ScWdCJR+CQc04O9iwzzUyj/iJuiV11z2IyVV4kEpNyQ84J19WQWpUXmdxxMYFShZyzK87ZbhbZmCs3DLmv5C27Vsaasj9O+HgIr8BKzGZcYfhp0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Rahul Singh <Rahul.Singh@arm.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index: AQHYveOAeMLlOwX5Mka7ZrpAabJW7K3K4ewAgAFZKAA=
Date: Fri, 2 Sep 2022 14:51:07 +0000
Message-ID: <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
In-Reply-To: <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: c7d51533-3914-432e-1fc2-08da8cf29669
x-ms-traffictypediagnostic:
	GV1PR08MB7873:EE_|DBAEUR03FT037:EE_|PR3PR08MB5836:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dYKWFuuf1dIrp1cGAH35e4zJpKw9iPsahntrvrk2aTxiaPz30P1WNuWVExv7xvrdIxkmjhgj9N5xVOD0var2ccGIqRN1y/WPb46vo0WdxkD0rxb3eQTudEOBaV1og628LsI0BiC+SxQf/OAgj9nFpBEnVOsqQXAIhRgQyOPZUlbM9KtMydf/ftwn1W/TqR9/bomwtGkZxaCqnS8zWnmZdVnOscLeFCOThw8DUA2AvaPMLLyl7CtB6g6mC9lKidWN/9W/TlAghmDUTcq+1/VOERo4fHhO7N4hozCWvXMBuRmCD1e2A07IHrYRS0FTwebpQ14hDZpBMcem25s3fqqin0lEY44ru274WsV+UQcankV6WSWvaVM60bxgGNO8xZlieW9HaJ6cbIoI101HvkzeTUKupq1sYpuBrJ0BzU4K6U1DcY+v8zhs27VbpBIBjZ7XYGslJk/EjiWZEYtaPmwH3riebTZkqnai2G2d3FWx5SyJpNvbJqUb9ZNiNnPWztFh7GE6TmqP25PPAWy/8TvbcolD3OBWE+F6oHDePUoynhw7IOsiKLT9gMySsjO/EdFbMAM341dLyGM+3hPSRmPDP+kc/cNvfababV2B4ZDjfFteLdKgDdHrOGsLYgIPiPanATwzjp9PpUxn4bXpCNqwsJ2GXs9Mw/hycCJkNfnuHrf/08wfLVH+21r7x1d9rnxHYc/P5VRWRxLiQVA08UPlfPOYgmRrX4+oFG5aIo0mxm4ier8DAGQ5MctptrJPG2ftvC7Z239uAGtIM//i0b/rF0/gTR9rsFgbST1ZLgKwess=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(346002)(136003)(396003)(39860400002)(83380400001)(38070700005)(122000001)(38100700002)(4326008)(64756008)(66446008)(8676002)(66476007)(66556008)(91956017)(6916009)(76116006)(66946007)(316002)(2906002)(54906003)(8936002)(5660300002)(53546011)(186003)(2616005)(6512007)(71200400001)(6506007)(41300700001)(26005)(478600001)(36756003)(6486002)(33656002)(86362001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FCBA4BE246A37D42A7A7AAD46B05DF46@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8ce82a3c-f656-498e-0dee-08da8cf2911f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9FCVqapItS0ad++s7lPEy3Bsy1HYrRsN55utragXGKBopiKoL3VW77u/1CXVaVcD8CWIWRoShzdj0oIKfMNe/2sRHFhLu8QTsbJEtpf3ozMpaNUy/WeZw1DR7dYv61Twyb3LmG8AenKhht3mk894oDUMHnx95CEXAebMB7S+8spYNuO3igiVK8CdORsJm4HCvaeRKEZ9t4q7mQP9TLu4gjrTwxpgjGlJV0DDfsKcFZICHY5MtASajTKKtyALO5CmsSzd6iOr+TNYtZpVyfYZYdNr03tziG6acGUnANixUnIQJaHFP+dW28PWVAt1QuqED8agAPTNkP3R0tOYZf4AU7G4FOkaF3Ib/E7s2LsjgtUGy6P5hDbukln1pCtVdJLIBvoi+b3QHUAErRNmniEtVjIyIDHC8bPd/Iki7hLOUvKpgNEfpUXI34ea+7DuakuaLwhe0BfRJVYIW+fnfvRgyoCwRgvykXuEOA6LJKxDOw6hQnvW/uR5JlzcO6HRi9/9SgbtePhOp5uxex4nJtQSPjf0uwyVHluO53zNU62XaabmTFtniS1TXSeoM2fA/DG8icw5s2Mysdd7KKPSJAieJe8YeSFDlgXfFzuCGF3YvSlqlfQuS9Vg6qb6Ii25ooSJMfPzAgGOui0dG/y4a5hQarwYAsCFcXOvEwbCnzdJaTYaqODTs+mn/VCBEXMoH1E9AnERNa6ZMrEkxE+Ys9EpiS5qGCzt75BL+mmFlMis92uWZVlDrbK9VIEwXjI4sKNt2c4HhjksCLNwUPm8PKEr9A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(39860400002)(396003)(36840700001)(46966006)(40470700004)(53546011)(6506007)(107886003)(83380400001)(26005)(478600001)(41300700001)(6486002)(336012)(6512007)(2616005)(82310400005)(47076005)(2906002)(8936002)(6862004)(5660300002)(40480700001)(40460700003)(54906003)(316002)(4326008)(8676002)(70206006)(70586007)(186003)(82740400003)(81166007)(36756003)(33656002)(356005)(86362001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:51:15.9636
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7d51533-3914-432e-1fc2-08da8cf29669
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5836

Hi Julien,

> On 1 Sep 2022, at 19:15, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 01/09/2022 10:13, Rahul Singh wrote:
>> Introduce a new "xen,enhanced" dom0less property value "no-xenstore" to
>> disable xenstore interface for dom0less guests.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> Changes in v3:
>>  - new patch in this version
>> ---
>>  docs/misc/arm/device-tree/booting.txt |  4 ++++
>>  xen/arch/arm/domain_build.c           | 10 +++++++---
>>  xen/arch/arm/include/asm/kernel.h     |  3 +++
>>  3 files changed, 14 insertions(+), 3 deletions(-)
>> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/devic=
e-tree/booting.txt
>> index edef98e6d1..87f57f8889 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -204,6 +204,10 @@ with the following properties:
>>      - "disabled"
>>      Xen PV interfaces are disabled.
>>  +    - no-xenstore
>> +    Xen PV interfaces, including grant-table will be enabled for the VM=
 but
>> +    xenstore will be disabled for the VM.
>=20
> NIT: I would drop one of the "for the VM" as it seems to be redundant.
>=20
>> +
>>      If the xen,enhanced property is present with no value, it defaults
>>      to "enabled". If the xen,enhanced property is not present, PV
>>      interfaces are disabled.
>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>> index 4b24261825..8dd9984225 100644
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3336,10 +3336,14 @@ static int __init construct_domU(struct domain *=
d,
>>           (rc =3D=3D 0 && !strcmp(dom0less_enhanced, "enabled")) )
>>      {
>>          if ( hardware_domain )
>> -            kinfo.dom0less_enhanced =3D true;
>> +            kinfo.dom0less_xenstore =3D true;
>>          else
>> -            panic("Tried to use xen,enhanced without dom0\n");
>> +            panic("Tried to use xen,enhanced without dom0 without no-xe=
nstore\n");
>=20
> This is a bit hard to parse. How about:
>=20
> "At the moment, Xenstore support requires dom0 to be present"
>=20
>>      }
>> +    else if ( rc =3D=3D 0 && !strcmp(dom0less_enhanced, "no-xenstore") =
)
>> +        kinfo.dom0less_xenstore =3D false;
>> +
>> +    kinfo.dom0less_enhanced =3D true;
>=20
> Wouldn't this now set dom0less_enhanced unconditionally?
>=20
>>        if ( vcpu_create(d, 0) =3D=3D NULL )
>>          return -ENOMEM;
>> @@ -3379,7 +3383,7 @@ static int __init construct_domU(struct domain *d,
>>      if ( rc < 0 )
>>          return rc;
>>  -    if ( kinfo.dom0less_enhanced )
>> +    if ( kinfo.dom0less_xenstore )
>>      {
>>          ASSERT(hardware_domain);
>>          rc =3D alloc_xenstore_evtchn(d);
>> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/as=
m/kernel.h
>> index c4dc039b54..3d7fa94910 100644
>> --- a/xen/arch/arm/include/asm/kernel.h
>> +++ b/xen/arch/arm/include/asm/kernel.h
>> @@ -39,6 +39,9 @@ struct kernel_info {
>>      /* Enable PV drivers */
>>      bool dom0less_enhanced;
>>  +    /* Enable Xenstore */
>> +    bool dom0less_xenstore;
>> +
>=20
> AFAIU, it is not possible to have *_xenstore =3D true and *_enhanced =3D =
false. I think it would be clearer if ``dom0less_enhanced`` is turned to an=
 enum with 3 values:
> - None
> - NOXENSTORE/BASIC
> - FULLY_ENHANCED
>=20
> If we want to be future proof, I would use a field 'flags' where non-zero=
 means enhanced. Each bit would indicate which features of Xen is exposed.

I think that could be a good solution if we do it this way:
- define a dom0less feature field and have defines like the following:
#define DOM0LESS_GNTTAB
#define DOM0LESS_EVENTCHN
#define DOM0LESS_XENSTORE

- define dom0less enhanced as the right combination:
#define DOM0LESS_ENHANCED =3D (DOM0LESS_GNTTAB| DOM0LESS_EVENTCHN| DOM0LESS=
_XENSTORE)

This way we have a proper feature bitset and ENHANCED is properly defined a=
s a combination of the 3 features.

What do you guys think ?

Cheers
Bertrand


>=20
> Cheers,
>=20
> --=20
> Julien Grall


