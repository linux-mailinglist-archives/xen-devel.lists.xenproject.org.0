Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E559519871
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 09:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320395.541099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9c2-0003mq-C9; Wed, 04 May 2022 07:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320395.541099; Wed, 04 May 2022 07:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nm9c2-0003jk-8R; Wed, 04 May 2022 07:39:54 +0000
Received: by outflank-mailman (input) for mailman id 320395;
 Wed, 04 May 2022 07:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tJLg=VM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1nm9c0-0003jd-6H
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 07:39:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0613.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6197a7eb-cb7d-11ec-a406-831a346695d4;
 Wed, 04 May 2022 09:39:51 +0200 (CEST)
Received: from AS8PR04CA0147.eurprd04.prod.outlook.com (2603:10a6:20b:127::32)
 by AM5PR0801MB1874.eurprd08.prod.outlook.com (2603:10a6:203:49::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 07:39:48 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::a8) by AS8PR04CA0147.outlook.office365.com
 (2603:10a6:20b:127::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 07:39:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 07:39:47 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Wed, 04 May 2022 07:39:47 +0000
Received: from af27461cb16b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75F42243-0098-480D-B6E4-D9F37A18A1EA.1; 
 Wed, 04 May 2022 07:39:41 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id af27461cb16b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 07:39:41 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB7793.eurprd08.prod.outlook.com (2603:10a6:10:398::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 07:39:38 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::4de:59d7:ae91:54a1%7]) with mapi id 15.20.5186.028; Wed, 4 May 2022
 07:39:38 +0000
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
X-Inumbo-ID: 6197a7eb-cb7d-11ec-a406-831a346695d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Dx0z1afT19KF/t6HY9GDnkkyejvalkQL1P05YwzE13yT5xzcnwksCOLuzuwn9nVmCMA8NH529mpZu2cdzb21YbKFuP+k2in912DERtr3IcKO08pzhIkjwg76SNT/1y5ypk7sAItVvfp82asyu66XJXffQwY+Q8Mp9IY4kJCNHOodvwdBJoS5mNb/tw9pLc4B23n2/pvd67e8CzHrdD+3udCikcNbLOzrEPcsEcbKDayz35WgpOw7rK7jaxAS8GmngWaqMZM2SqzRGMyW5vXRcXrbuuwqMY/G7LPyclaFsOX62HiQc0wqf37UPzSUmon1Ib9GrxE+9Z+2rfcPq3PMmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6VHyoo9axMNr1V+wqh6VafmQkySppERg10V7U9lyyM=;
 b=SFNdUwFjV3EUMrcyibJkhGjcnZXJ22+/lZTQ+iIqE/tVMCQN6jC8wkGGdppEmsasf5QOTlZ89GKpbwc6k2UAn59QbhqhHle/UZtV2jh6IhuNm4SZ7Oi6EglHHBF7Ss2DfsmT5257/lrf64Pw56ql9i238zbglkMhqvLpVyqnEd6p/9weQ6L7HRRUfR1JsosTdltaGWK4PSkk4h2DJYkvAzlOmgN+pk7d63lw4Xk7fM8OsqD/VZOWH4kdU3MRwY2GIvUsKuvD2vQUeO0lbVaga/peisRfA5NRruITuhIWqbLfHg4d46U4ri129we3vivXuXV+2ihRJzADufuKNMLWmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6VHyoo9axMNr1V+wqh6VafmQkySppERg10V7U9lyyM=;
 b=q7byG2LwxyCqHa9s7ppar6DkCgqK2zvVna0XQmRGnBgBESe890z8iTE3WWj6u30flY9HLWsKS0s/DJ2dEF3eLvhXyDhy5/PpMX08LY/O7cO39wkPCbubDf2DkhTmGfnyMTPR1vehHFG53AroaXsAnw4duMi19IRxrwM8JjcFGu0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6265ded2173f89f9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJdKhf9Cxuc93JXXAMLZBWG+pnXJWMN0Q3uYScqdXi9X2gpx2D9x1ARPJZwXuJHl142j+qINzPlA/x2nPBpgDXdH9W5//y5jaFxPNW1pH4AticIUJgCEOoGatGhoCLHoI+M2IuZ5NlDaZfFFazWEGdb2J5ZVhltbEj4kpnu+WEkqaBckzXBSw0CxPUfDIrADv1sKMEzL/HT2OvRmtGDqm7tbfQL072jEr867jb+Oh2tfS9y7nGybQIp1P4RADMUdZkMDGO+/5wp9T5Pf2QQ2aocT3svqLTDpobzGUR5YW6O+NcEjxQOyzH5V5QUt5RO4BBXl+MoGjdR0y1O+NpPKXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6VHyoo9axMNr1V+wqh6VafmQkySppERg10V7U9lyyM=;
 b=bHVmBexrz1x0P3XRCHtflgj3FPSo8YhKuVHH1oYuGi+y1WQYR7ecE+zssBH9hkkW0Pr5C+xKoV3hk3tAUI92A5PIP46zh4My3saD08pXZfAgLWg6NghIGMwc1xgtcQuEstohUxK9+PadUcaV0xWn6f4QwB+KWgG9x4bKRpcosoKLltfJxgz3Lwdpm4jFLcJ3tZ/ytkLONaO8aeed1OOyfdytXvz/kOx/4KRTnVplGbAem9rP1JD2niJD2Machp7LnPOeUILEeBvY3Phfxj8IDLb4AXytk/snt9xIzpPqkCLN9wf/6F0tibwNzOfGpBzDMCAMUEN4jHS5BDOpqFqOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6VHyoo9axMNr1V+wqh6VafmQkySppERg10V7U9lyyM=;
 b=q7byG2LwxyCqHa9s7ppar6DkCgqK2zvVna0XQmRGnBgBESe890z8iTE3WWj6u30flY9HLWsKS0s/DJ2dEF3eLvhXyDhy5/PpMX08LY/O7cO39wkPCbubDf2DkhTmGfnyMTPR1vehHFG53AroaXsAnw4duMi19IRxrwM8JjcFGu0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux 5.18-rc3
Thread-Topic: [PATCH 1/3] xen/arm: Sync sysregs and cpuinfo with Linux
 5.18-rc3
Thread-Index: AQHYXtGhqgeBKorGIE+S3ZHm07cmGK0Nc+GAgADisYA=
Date: Wed, 4 May 2022 07:39:38 +0000
Message-ID: <2E66F8B4-4DDA-47E2-B93C-E36FEB70F552@arm.com>
References: <cover.1651570561.git.bertrand.marquis@arm.com>
 <832955382caa4ced744ec7894282592b62e8cf61.1651570561.git.bertrand.marquis@arm.com>
 <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
In-Reply-To: <a05b426c-1800-a365-5b02-f82f0a391306@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.80.82.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 1e33d8e9-09ed-431a-32d0-08da2da1440c
x-ms-traffictypediagnostic:
	DB9PR08MB7793:EE_|VE1EUR03FT029:EE_|AM5PR0801MB1874:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB1874EE6A3FA9186E39BD2B739DC39@AM5PR0801MB1874.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UVm9WN2dFcXzZTuMU02VhCzt3xpj3HVnx+ohj8rcOi5UT4vWu1YY0DjUXfJHPdCjP+tl5ed8976D3FYJIgRcF11C2W1Fq9JaYac9CLUeQcrNIrTLGyeoECyZjP/59aPAiMWg+hUEgQri2eqHsEqb+G8qG3HSBfbUmzjlu8ZTW12wJoo00UMxbmCL1LOQOunHl7yTwo4v8UEFwlRiNGY8EecESmE4cxh8ccDSw8Oj5D7NdeOuVa2blWG9XQJ66vtwOw+va0zhynsxJjybDqInMrrPl4jOBo8oKb2JI96Uv25X0Ii0/8RP+WhytDRHVXdBgzM/sgwFkqGeE+54hyuvFLBZN5WjyWnDCWyAoLlWfLpuMtTgHMoxjy6MnUzwo5Grn3lehcsGGak01vR6S0mMGsXV9x4qY0OY+LFMtDswpsfGmXZ1SLfq8fiRL//cNzia8V/BkZpiMB6Ji1KY9oiFbF66R3JIioitUjBjWozCljo+Bv72pvBokEezppgYdD+1V6A9Mm2wx4JFloUH06+dVr2yzkb7/8bYJKX+Z4Qt3oiEMckq/YzcmKkMcqlE0GTz7hlitTbickwJcvBs+letsUElavaesSKHj1SQy5HC7Np675deGRJz9+1QhjhMv+ijrTv8KKYjp4zL2iwuSF0n9EUl4z3RayrDSEGPH9D/8tHX1NjwJCdve20+kOxZUsl3qYHLKaSKL7rxLQ0FoNlY5rArYlPbQC5rzJQXpv/aBbe10lMG1rdQkjPrzjtyMPzD
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(71200400001)(38070700005)(38100700002)(2906002)(66476007)(8936002)(6486002)(316002)(508600001)(91956017)(5660300002)(122000001)(54906003)(6916009)(8676002)(4326008)(64756008)(66946007)(83380400001)(66556008)(66446008)(76116006)(6506007)(33656002)(26005)(2616005)(53546011)(6512007)(186003)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <85BBD066915CA54CB66B134141CB1FEF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7793
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d4dab97a-6882-43f5-5b24-08da2da13e66
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xBa2qByMzuejWpmrDRFhxwXsH1BCO/5vSExTF7IOMvz5cd5hA4i0PsQYDG5HxoDUkDMVxUXVpgUZYnP+NGPNqmDMV2dBk/qpcwIEJiskDYcEnVF4lJkSQgXqGh3PRiiuGIyQJlZ+V3evNlHdd40skPxu1WW3503LxP55pirJyo6Oj5xRTGs8UQlM4zOC1eNcBtTT1CWu1xtXCpwQWjNsalHxeTaFOZOlsANb0WnU88NdoNU2cIW42cTMhLbizFRX82jIu04KoNQTHU/mr77OGwb3aTUOvIU4O8G8wEfJgH58TtJA+9/AW5LNKiZB8U/D2tPrcgKzvKjuL21z60/FDZVRVHATqqwYAEqXi+P8OC8rXxMX1CHrvss7W7X1illomU0kh/7FAm+QT7tcbwVG9KcyUxJouT/OJ8R+LhBUIu3qUYeHDYFFYeueADKqj1dwaj0j/gOrrae78xfG+Ux257Pv3gBjWzaOdEpK3wN9yjmmXKcx7LnjPEPagFMe4+JOKUEgoPjBRbefYx2z5yfvSU2ToBRUeasFg0t2sqnSpkx03VAs4oxkWyXp7FHZTrH3eahLPB3UPQWzR1BQ7hjbFBC/GFgphxyeTh6RfneDldZBgQ9VaEZwhaETzLi58aetWsrhiIcTTBucIijrw8/tox7V6Tth+sHBWmiHfUdyNN/vS6AjMlE0EMFmu/im3JQu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(33656002)(47076005)(316002)(5660300002)(6486002)(36860700001)(86362001)(336012)(2906002)(8936002)(186003)(26005)(6506007)(54906003)(508600001)(53546011)(6512007)(83380400001)(107886003)(82310400005)(356005)(2616005)(81166007)(4326008)(40460700003)(6862004)(36756003)(8676002)(70586007)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 07:39:47.9887
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e33d8e9-09ed-431a-32d0-08da2da1440c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1874

Hi Julien,

> On 3 May 2022, at 19:08, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 03/05/2022 10:38, Bertrand Marquis wrote:
>> Sync arm64 sysreg bit shift definitions with status of Linux kernel as
>> of 5.18-rc3 version (linux commit b2d229d4ddb1).
>> Sync ID registers sanitization with the status of Linux 5.18-rc3 and add
>> sanitization of ISAR2 registers.
> Please outline which specific commits you are actually backported. This w=
ould help to know what changed, why and also keep track of the autorships.
>=20
> When possible, the changes should be separated to match each Linux commit=
 we backport.

As those are exactly identical to the linux tree, one can easily use git bl=
ame on the linux source tree to find those information if it is needed.

I checked a bit and this is not something that was required before (for exa=
mple when the cpufeature was introduced).

>=20
>> Complete AA64ISAR2 and AA64MMFR1 with more fields.
>> While there add a comment for MMFR bitfields as for other registers in
>> the cpuinfo structure definition.
>=20
> AFAICT, this patch is doing 3 different things that are somewhat related:
> - Sync cpufeature.c
> - Update the headers with unused defines
> - Complete the structure cpufeature.h
>=20
> All those changes seem to be independent, so I think they should be done =
separately. This would help to keep the authorship right (your code vs Linu=
x code).

This and the previous request to split using linux commit will actually end=
 up in 10 patches or more.

In the current, the change can easily be checked doing a diff with the ment=
ioned Linux version, so I am not really thrilled to make it more complex.

Please confirm that all this is really what you want.

>=20
>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>> ---
>> xen/arch/arm/arm64/cpufeature.c | 18 +++++-
>> xen/arch/arm/include/asm/arm64/sysregs.h | 76 ++++++++++++++++++++----
>> xen/arch/arm/include/asm/cpufeature.h | 14 ++++-
>> 3 files changed, 91 insertions(+), 17 deletions(-)
>> diff --git a/xen/arch/arm/arm64/cpufeature.c b/xen/arch/arm/arm64/cpufea=
ture.c
>> index 6e5d30dc7b..d9039d37b2 100644
>> --- a/xen/arch/arm/arm64/cpufeature.c
>> +++ b/xen/arch/arm/arm64/cpufeature.c
>> @@ -143,6 +143,16 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1=
[] =3D {
>> 	ARM64_FTR_END,
>> };
>> +static const struct arm64_ftr_bits ftr_id_aa64isar2[] =3D {
>> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_HIGHER_SAFE, ID_AA64ISAR2_C=
LEARBHB_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
>> +		 FTR_STRICT, FTR_EXACT, ID_AA64ISAR2_APA3_SHIFT, 4, 0),
>> +	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
> So we are using CONFIG_ARM64_PTR_AUTH. But this is not defined in Kconfig=
. I realize there are more in cpufeature.c (somehow I didn't spot during pr=
eview), but I don't think this is right to define CONFIG_* without an assoc=
iated entry in Kconfig.
>=20
> In one hand, I think it would be odd to add an entry in Kconfig because X=
en wouldn't properly work if selected. On the other hand, it is useful if w=
hen we will implement pointer authentification.
>=20
> So maybe we should just add the Kconfig entry with a comment explaning wh=
y they are not selected. Any thoughts?

This is really right and a very good catch.

I think it would make sense to introduce those in Kconfig in order to keep =
the code equivalent to Linux.

So I would suggest here to add hidden entries like this:

ARM64_PTR_AUTH
	def_bool n
	depends on ARM64
        help
          Pointer authentication support.
          This feature is not supported by Xen.

Cheers
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


