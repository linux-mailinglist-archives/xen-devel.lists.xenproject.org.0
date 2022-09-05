Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 631835AD7DC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 18:52:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399065.640102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFKF-0000h9-Lj; Mon, 05 Sep 2022 16:51:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399065.640102; Mon, 05 Sep 2022 16:51:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVFKF-0000ev-Io; Mon, 05 Sep 2022 16:51:55 +0000
Received: by outflank-mailman (input) for mailman id 399065;
 Mon, 05 Sep 2022 16:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oVFKE-0000en-49
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 16:51:54 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ad22bb1-2d3b-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 18:51:53 +0200 (CEST)
Received: from AS9PR06CA0648.eurprd06.prod.outlook.com (2603:10a6:20b:46f::16)
 by DBBPR08MB6300.eurprd08.prod.outlook.com (2603:10a6:10:209::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 16:51:39 +0000
Received: from VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46f:cafe::fd) by AS9PR06CA0648.outlook.office365.com
 (2603:10a6:20b:46f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 16:51:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT003.mail.protection.outlook.com (10.152.18.108) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 16:51:38 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 05 Sep 2022 16:51:38 +0000
Received: from 01e22cc94631.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F80B1DA0-BF8A-42B8-8D47-9EE41A85F81E.1; 
 Mon, 05 Sep 2022 16:51:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 01e22cc94631.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 16:51:27 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by PAXPR08MB6416.eurprd08.prod.outlook.com (2603:10a6:102:152::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 16:51:25 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 16:51:25 +0000
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
X-Inumbo-ID: 0ad22bb1-2d3b-11ed-a016-b9edf5238543
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dIjjKstNPTJEcQ8sY61Gr5hzPeEkAXaADi1ZpajI25yBuMPJIX3iUIN2du/GyyvmkwBBISMiKLaKCRPQnnpAovR1BudQGZutwPtVAHsYWR6Jot2vej7WK0/j9SJYzs8PnsrHJWEL5xldJ3ZPewbAy/U0Rbx6Ms9M4mGnTJKzJbotmidHsbh1fjs7aqMPG+qixH5251gihF+qFyIyz/mYRMK56j8w7oZHYBtE05FYCYPFCZP67KOhiZyTSrjQ70dD0U/z76FYsMK/1LC+DB1oYzX+MDAZNrMucUCmJjP1vWEttdfvg9DBM6corz7Se9QLjZBubUfABpzR7Rni9lwllQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsgTKyBbntCDVmvDXzWwWDFlH7xshsqNUPBaVZnVGbE=;
 b=GbPxE2Fp41hXuwQhstMgO9e6NQhZpRHM4GN/UeaUNN8ERvZt4lFNce5a7022NtYC3gxcuyrNwsSxhKqGYYszK82RCSGRqmvDOf6kT/I0kzkSWUNRrP1DqbVpmkC/YQMHUUc3OxscpEC8v2GVwE73Z8r5/F1R/6NagBXEESBFMjh+J/p3HwEe1mhpPjDzD7a2Twm9eVKG6R8TL6d99tikENdBd8f0In1+raBDUUpL2Lnsa8Sns67Royx92/wLjCpEsvEt4QjgB9vi19byp/yGVloIzIjXN7JJ2Wc04UBfRPEfXzRHhTKQWoWDfA+T4EkItDOXamSWzKl+XMeYPOyzHA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsgTKyBbntCDVmvDXzWwWDFlH7xshsqNUPBaVZnVGbE=;
 b=PI6TAQuKp1HMUSnDQbLYk84a0qRaZD95I83HHkbvUuKNZeeMQhjEe0raFKEq4sOWuGPAxSlIyUUjtcmNW3uM+o6euUI2w/k32JGC7kiwlwVK1doPBW2JkL6WkyXMefa+tFhqM/4Lzez8R6RNTRto8mVLqUKg1wcn5FwG3Mzgz7Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e46ea9cb08125ffe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEhTFL6T1pr6UYCA15zeJv9d++22iF/5VbSbNttjW8KVsDqkyORwgc24Bymu+WtKBvuQHn9wEVgbi2Z8DGx2yg7Vzv2NWJaB0vTRQ+v1EbrqKgu9xv32qhMhykuCvtVsrF5RbPJ59xROLanP976zBAxAOO+GIZ1OVW4B8kY9qG340S9MX7D9U9M3e4Sqa1Lv9mfXVwtoP2nU1/cCrnQaEL9SWXhMUnzDHySsAeGnjFDVgSWGe2YtRplRDVE7eUO18nYQRoaSrsSEHkiWbliOe7vu7CerGVSUOIfyLUEcDGHCyuon5aIrbmyik8MIXcNHhi4a7ASLze9fBUuCdiJKjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsgTKyBbntCDVmvDXzWwWDFlH7xshsqNUPBaVZnVGbE=;
 b=ban6PjwAXR+NVfWlTlmBd/PI4DxuoqLEfOw8JRjbb3bF6bmTfQq6j5qTQbN+iapclq+/Ncc/qy19MYap1pE8OkfzLQWeToRHpfquqwfgaVcKRwtqzc0RWUNI+xJ1PIVDwM8XiO8ZOridlzgqyt+BLeJE/F87SZQAW5elyq9MyX/km2pBf+NJvF1663otzRWVAfr8K7yBKU8bgKoSPhbP3huLBa236YP965C55gWmw1D87H5UlRbWMLc0phO+R1xu/w21WAH2yVdpVQLdmi/dO+OSGhaGW7KnV/DLEeHWBPcG9oKnyu+c9r+vLrdR4lp+YePk5Ssd1nlzoXCTWxnd2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsgTKyBbntCDVmvDXzWwWDFlH7xshsqNUPBaVZnVGbE=;
 b=PI6TAQuKp1HMUSnDQbLYk84a0qRaZD95I83HHkbvUuKNZeeMQhjEe0raFKEq4sOWuGPAxSlIyUUjtcmNW3uM+o6euUI2w/k32JGC7kiwlwVK1doPBW2JkL6WkyXMefa+tFhqM/4Lzez8R6RNTRto8mVLqUKg1wcn5FwG3Mzgz7Q=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property value
Thread-Topic: [PATCH v3 7/7] xen/arm: introduce new xen,enhanced property
 value
Thread-Index:
 AQHYveOA33HU3e+ak0GIRMMly1Yth63K4ewAgAFZKoCAAAQmAIAADY6AgAAHOICABGESgIAACJcAgAADEwCAAAPEgIAADnWAgAAKUACAADNYAIAAAxEA
Date: Mon, 5 Sep 2022 16:51:25 +0000
Message-ID: <07A77C93-A304-47ED-B3E7-58F87A959CDB@arm.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <d8dae49b05e6c59715016e0995b1275f3cb6e7fc.1662023183.git.rahul.singh@arm.com>
 <28b9679c-8223-ae71-d629-4ec31a72dcb2@xen.org>
 <36A408C8-36C5-4A39-80B4-F564445635C7@arm.com>
 <616b36ec-5a42-cb9a-2131-3aea1bec7c67@xen.org>
 <46897765-5063-49CE-8A8A-F4DA50570A08@arm.com>
 <a669182c-dab1-35b7-9bf7-caac1813e3ad@xen.org>
 <C27FD0DE-D8FA-4A67-AE0B-DF4030A65127@arm.com>
 <a14b4d4a-5ae6-4af0-2d00-49bbc688cd4a@xen.org>
 <6B0D4F4B-C7CC-4C04-9BA4-71976CAA82C5@arm.com>
 <cf2872c6-23e3-ced4-d7c5-2a5e6ade98ad@xen.org>
 <1874D575-E3B3-4221-925F-AF71D3EF0289@arm.com>
 <EBF5412F-F932-4D25-A2E3-9F53D59ABBCC@arm.com>
 <771e2800-4457-b9f4-63bf-a71f3805e4ea@xen.org>
In-Reply-To: <771e2800-4457-b9f4-63bf-a71f3805e4ea@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 18650fb3-07db-445b-9a3e-08da8f5ee6db
x-ms-traffictypediagnostic:
	PAXPR08MB6416:EE_|VE1EUR03FT003:EE_|DBBPR08MB6300:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 p+9BBzoLbqFTPrIZyJnP2du4sR3jYGO7J+6jrAwJAbwj5j5EuKSoUDBY6jPfVr8yR8hSwX62MS3/QG4MCekgLNglhCvzAAxpzp51RRLVQ07tMfTCAABNg51k0lBTM5/ghBLsEShYXZ0in46vSfQjYx90t8soWT2xSEay08tGUVG2T3FrYSPanHxISQjYU5I9ZW6DdKoZxTPIEbOfvNhYZm6KlSFcREIOEgJHf/RbH48496Wkm6iGUzM4XiW3iVomp0mIA2XE88JNC+VaDULugj2eSiwOAWyE8Ybi8jUCy/OWvZwu4ffNzYg53bqcKbkdC/GUbCxi4f/sJGApeC1DyCtlVlIw9y1eA72WmpiZuMqmarmv6MKwqEz0xKQerfKfwV0ZZHQGeo7fR0NP3zeF2sIzALx/jTxXB+I92bOEsgZnwQaCGYspQ3dEJLCbBcmyRuu/PM4/TPe9w2dsYlNMPwYHykJQIZghKQco0DhkxtvReEaVAFPxVs/e4NwUTrwFtvxwVoBGawhugPmnHZ2gWXpzq6YnaQHV4XFZqh7K7E9WFQGFaAxLEovRL+PSR8XsitVWznH3Y2grwtDrdG0BUo5eDmYILikeDZsofmleJfLs8equcHuqz3DXlh1kYibGi52RkKw9FUhm1K+4kuSP3H+uEzeOy6Tm7EDzu+r3STbn/n6sNq0PtZi0p8EzuUELGh2NUQXM55+Y/6QV6c9MirTvyOTN9i0Dp9xQelfjKQccqbH+m+pcU9mlRhOPy+sLFYHTuLKORSmL7WNmqJtcBJZXfssNbO/NsAHlsNujvxc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(366004)(136003)(376002)(91956017)(64756008)(4326008)(8676002)(76116006)(66446008)(66946007)(66556008)(66476007)(5660300002)(316002)(122000001)(38100700002)(38070700005)(6512007)(186003)(26005)(6506007)(478600001)(71200400001)(53546011)(41300700001)(6486002)(6916009)(36756003)(54906003)(33656002)(86362001)(2616005)(8936002)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <75BBABA930518444AA23F484C902594A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6416
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	66ac6cb7-61bc-4d16-48bd-08da8f5edf05
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZV12qNGW86/iwctchLpf7Y/4LgDG2R6KGhtvLGM/sqJ3ZVgbLZHt4r/9h/2wRcMnZujbRTG9Kx8ucJ7ff5A2UURiXF6O7tAxyuPH+LpjA5iACcEoH9b6LHv81GrTguQuMmNt+U4whVj1NwLqGA3NK72h1Sgv1mu7WsM/3oT6f16EUYHhhjRP6KltRLNCgPjdPtR2+FUCLQWkHqehMehxMhMFyVyKSUQ4q8iyklPBMMEEV+DQriWRofn2Nit5onzkt1KLOcQifaeKCKiciuH6TszmO1+/brjhxul7xVralfSICa8csntLEdTx2SraNdhFSjpnnE4IHuVBOJV0t7Byvc/XrTMbVmABCVS+rLKgZzEtrL9J7BNV6nER9anBeD8U2qAsT8V+02hMvnj4d4JgdEriJC2ehgWe0Zgu2f6DEPLRinGQZl+jH2vHr1yoPKmCEuimG6RxfJ5suM8ZcPFnw4YaKst9sTQhf4hUcYBJWgXAEH1jCtSyGiCYNGjqTB+RVbbhfELpsUlead56cjqIg9St0tdb6MO5vDaudbuS6ZI++W78XFuatBtF1JMIdESNouEYVTwbK/4qRkUsgdqPwO0GcXLkE1+GIB5IGyFYhHChgI3dMUiOYf8cD6R7tSam2q1fIzkI77KkmHc090T/ojAB/nHDqQzaD95ClYl22yRBW+GWC2Ij7//meOrlZr4yLGfat+w1eqMlgOAOE1ZnDXuHFhZ0p9EYQv36jE/IOZwIy4lNTg5sSVkETjEolwWB2gqFR6APQmOHp+kOg8UVyQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(396003)(46966006)(36840700001)(40470700004)(81166007)(6862004)(8936002)(356005)(54906003)(316002)(33656002)(6486002)(478600001)(40460700003)(70206006)(4326008)(53546011)(70586007)(8676002)(6506007)(47076005)(86362001)(6512007)(2906002)(26005)(186003)(336012)(82310400005)(41300700001)(2616005)(82740400003)(5660300002)(36860700001)(40480700001)(107886003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 16:51:38.7945
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18650fb3-07db-445b-9a3e-08da8f5ee6db
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6300

Hi Julien,=20

> On 5 Sep 2022, at 5:40 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi,
>=20
> On 05/09/2022 14:36, Rahul Singh wrote:
>> Please have a look once if this looks okay.
>> /*
>>  * List of possible features for dom0less domUs
>>  *
>>  * DOM0LESS_ENHANCED_BASIC:	Notify the OS it is running on top of Xen. A=
ll the
>>  *                                                          	default fea=
tures (excluding Xenstore) will be
>>  *                          					available. Note that an OS *must* not r=
ely on the
>>  *                          					availability of Xen features if this is=
 not set.
>>  * DOM0LESS_XENSTORE:       		Xenstore will be enabled for the VM. This =
feature
>>  *                          					can't be enabled without the DOM0LESS_E=
NHANCED_BASIC.
>>  * DOM0LESS_ENHANCED:			Notify the OS it is running on top of Xen. All t=
he
>>  *                          					default features (including Xenstore) w=
ill be
>>  *                          					available. Note that an OS *must* not r=
ely on the
>>  *                          					availability of Xen features if this is=
 not set.
>>  */
>> #define DOM0LESS_ENHANCED_BASIC     BIT(0, UL)
>> #define DOM0LESS_XENSTORE                  BIT(1, UL)
>> #define DOM0LESS_ENHANCED                 (DOM0LESS_ENHANCED_BASIC  |  D=
OM0LESS_XENSTORE)
>=20
> The explanation looks good to me but the indentation looks odd. Also, I t=
hink it would be preferable to use U or ULL (if you want 64 bits) so the si=
ze of the bitfield is not arch depending.
>=20

I will fix the indentation when sending the official patch. I will use U as=
 I am planning to use uint32_t.

Regards,
Rahul


