Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E61C7026DE
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 10:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534595.831739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTFx-0006cv-Bx; Mon, 15 May 2023 08:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534595.831739; Mon, 15 May 2023 08:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyTFx-0006Zq-70; Mon, 15 May 2023 08:08:33 +0000
Received: by outflank-mailman (input) for mailman id 534595;
 Mon, 15 May 2023 08:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SknV=BE=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1pyTFu-0006ZJ-Ud
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 08:08:31 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe12::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ac5ce13f-f2f7-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 10:08:28 +0200 (CEST)
Received: from AS4P190CA0003.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::8)
 by AS8PR08MB6453.eurprd08.prod.outlook.com (2603:10a6:20b:31b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.29; Mon, 15 May
 2023 08:08:23 +0000
Received: from AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:5de:cafe::29) by AS4P190CA0003.outlook.office365.com
 (2603:10a6:20b:5de::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30 via Frontend
 Transport; Mon, 15 May 2023 08:08:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT034.mail.protection.outlook.com (100.127.140.87) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.13 via Frontend Transport; Mon, 15 May 2023 08:08:23 +0000
Received: ("Tessian outbound 945aec65ec65:v136");
 Mon, 15 May 2023 08:08:23 +0000
Received: from e0506ef73416.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A8E3240A-88D5-4BA6-8BDD-9F156F54FB0B.1; 
 Mon, 15 May 2023 08:08:12 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e0506ef73416.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 May 2023 08:08:12 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by AM7PR08MB5318.eurprd08.prod.outlook.com (2603:10a6:20b:104::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.30; Mon, 15 May
 2023 08:08:10 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::a4ab:cdfa:b445:7ecb%7]) with mapi id 15.20.6387.030; Mon, 15 May 2023
 08:08:10 +0000
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
X-Inumbo-ID: ac5ce13f-f2f7-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkCcm15jryxQsqbAW+jzj77yWrv/gfaCDXvDoGwKR+Y=;
 b=5Ct1/8P5/sP32TVdTGY65+O9cBAUkwbo3kGIjfggN/tAMV/RGgVVScADrjn3TsAvLl+fgOO7GMmFtF74sJyClABkHbS1nrXGjCenVA4AswcSn6o4RyvkB522Q/2ucOVcIOmUlDgfTg/cXKprG0l+MW7Q34mtnnfJuul8CaadVT8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e6e637b9a5b9a686
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLiw5WjUyupZuq8MgK0lubyGDNzRkvlIJKxfy8HkWMyV3UrdqeO92nz5rzQi/vkrCsgsaBfDjaJGZijyekh2k6tWVPn+g8VyA8PInW4xmigeb4JE1dNNGkQDSWC3Y2lXRs0EyIEY0jibdZFohroMoosKFnMQbDXtqL8f+YAFrQ2YeLKlxtwj6UzbvjNQzrFC4iVMynW/ciPrd3JYowlSJGpRAZIOboNn9v28wPvliWFem/BNh1Y2DlvbLRXYNEb+aZvxycU5Bsqh8DRaeeRgEWPJn0PTjoKFuegk9GgVexlmf1rQ28Z8yPVumLYPPUdb7G1YxT49iepO8HgXqiSs6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkCcm15jryxQsqbAW+jzj77yWrv/gfaCDXvDoGwKR+Y=;
 b=Y3lW2r8l7h8nepquh5n9PJFmx7gy/ISR1Rt8ABNIC0vRFSr6xUWDqd4w8YXfpzp/d0rYKQPMUHbos0BK+XpgcMCYQrfrN3BFnGMuYomhshdo3VrwjZ7sh0N1kAyGY3/xMX136IIYpofPyU+zsDcE8/5laEbyOmHE0tn/YZFLvbh6USexlTHOHRGrVVmjmjq3PpEB7lPOyEs2kufepEaeGqGd8640qZparrKhabQjflPh54PVunOxJhJI9JHVuMI2UjFf1K0vbSIixCkdX7972HHh84PvRFhEvx6LXfvw67xvRq4lexFKgpCUfr17SVK0ASZuZoOhdG03g6fMnpbDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkCcm15jryxQsqbAW+jzj77yWrv/gfaCDXvDoGwKR+Y=;
 b=5Ct1/8P5/sP32TVdTGY65+O9cBAUkwbo3kGIjfggN/tAMV/RGgVVScADrjn3TsAvLl+fgOO7GMmFtF74sJyClABkHbS1nrXGjCenVA4AswcSn6o4RyvkB522Q/2ucOVcIOmUlDgfTg/cXKprG0l+MW7Q34mtnnfJuul8CaadVT8=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen developer discussion <xen-devel@lists.xenproject.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
 parameter
Thread-Topic: [PATCH 1/2] xen/arm: smmuv3: Constify arm_smmu_get_by_dev()
 parameter
Thread-Index: AQHZhN8QV/wkEEzvWEaoo7ucvATCgK9a/vuA
Date: Mon, 15 May 2023 08:08:09 +0000
Message-ID: <A9FE3BF2-82F5-4872-A05F-7C79B984E274@arm.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-2-michal.orzel@amd.com>
In-Reply-To: <20230512143535.29679-2-michal.orzel@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7158:EE_|AM7PR08MB5318:EE_|AM7EUR03FT034:EE_|AS8PR08MB6453:EE_
X-MS-Office365-Filtering-Correlation-Id: deaadc02-f371-498f-e153-08db551b8dc6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hcL22fX694fRyN/k3YDiPR351qyVBnSrYei0/C0FpWq7ILhBjfAeNdfT/ehG9AUqapIek5K67J5cObORVg55s9DxzVd29rVsIIw88eSv/o95Aalse90qTgH1x4ueClZSDDVSmysF/Lfy2O4as1ra7effxFjcUCvV/vwPjfvYo7KLzW6hx77Key3EszGtcJvAlCQxC5YXFkV0fwEBvjAJlhsNrVZYCIkDVjaJowGcCsUCnhvrBysmILmfAE7sSHGhMUC7kajWUckJYEpAV0z57ugCFcS7yKPc0kfIcTkYHs2z9efE1vYshsoBRxHnwecBefayJBRdOPWQHeWMxR7JODKaNw18t1Z/uwokWyYpO+bg1ljimPH7h9yfzdBqGAg1b6KusPrMfulcgENe2ke/pU+zcPRzKVESejugDgBqvy3sU6ZlibMCnBltZZWjUwsIQwmZ8qFPkZeDEOC8oaDVOzLjhIEPtb0cyXGdth3BDU5C5VfPh7Rv0n+ZVSHJINA5JU9Ivk4xXZT/46zu8XqAdnCxEvHCn1tdIB17/LnU8lp1Ht78w8TIx/YcV43J/tAKkmdFTL9sTUhZineNIBU+k3cD2tshMlrKLS548msAZavMbLU3M9ov5s57A8E1FGv4KckJIOkmTkPR0OtdFDlFHg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(39850400004)(136003)(366004)(376002)(451199021)(6486002)(36756003)(6916009)(38100700002)(4326008)(2906002)(5660300002)(8676002)(8936002)(316002)(86362001)(66556008)(66946007)(38070700005)(76116006)(66476007)(66446008)(64756008)(41300700001)(122000001)(91956017)(6512007)(186003)(6506007)(26005)(33656002)(558084003)(53546011)(71200400001)(478600001)(54906003)(2616005)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DEC136E1FC01A4449A82DBC6D4EE37EA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5318
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8045210b-d9b3-46a6-982a-08db551b85c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	23De2yCLTLaHrouMaDVWHGJK6RdIj49vSVCrF/PY50GfSIoTZFNtnqNKx7TGK3x+TwQPr8GlUzrrUXZs5QohlysnLy7yJ4dElkdw/fA29c2azVym0feMeaAnygSajrcVY/w4+W0oJPChqJlbgwigRkzlKFFGPje9ZC5GOFNOzuMGunmaVO9GFIaF20azGydIxCaJrWgznb1d/kUahGdCFKVlFRGLdZTsdMW2ADuS+wQEKk/M9evgFtT5RyCC2jmn6rq8NuPwrOLu4R+6svayqgREY3vRRvEEv3J3wvx0lo8BVmq0P5yvrv9Uln2CsLHrhaaO7gv0/jvWGYdmsf6B8f7Qs3RJkvluBE+KTxcmooqQiJXp8vyrbNDpIAJIgdL8EeJjEfYoUcpMg22VVTUgMz4fl58slxI1be8ssCN5u+i/OGzUCPhM5xNQV3M78PtppJpo9tlxUHi4dbjjRY32paZQn1f9XSh0OBIRUwrOzjXNvP0LOptG4p0fFYwX+7nWkn7zojZzox43VvfZHpZaqCnLZN+AbmK/p31jSt6yqLtKRzQURcZsDCfOR2qfYb1d7oYRibcLGZDWIICPI4giFWthbJa242zZilIuiYoWtBBhOFrqE/oF2NTptTTNw3+49hd6l+pyjhESjgOgYy+9nCQyovA13pJlg65plHCLSRlvH24r11QKBzvn3om2nRK9s0QI+PL+RXjnsm+8igfuTN9GmMYMRbcOujF3mh5WehQfPvc5Q/m6GCGwbTkiKtUI
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199021)(46966006)(40470700004)(36840700001)(33656002)(36756003)(86362001)(316002)(54906003)(4326008)(70206006)(6486002)(70586007)(478600001)(82310400005)(40480700001)(8936002)(8676002)(41300700001)(5660300002)(6862004)(2906002)(4744005)(81166007)(82740400003)(356005)(2616005)(26005)(186003)(107886003)(53546011)(6512007)(36860700001)(6506007)(336012)(47076005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2023 08:08:23.3531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: deaadc02-f371-498f-e153-08db551b8dc6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6453

Hi Michal,

> On 12 May 2023, at 3:35 pm, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> This function does not modify its parameter 'dev' and it is not supposed
> to do it. Therefore, constify it.
>=20
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Reviewed-by: Rahul Singh <rahul.singh@arm.com>

Regards,
Rahul


