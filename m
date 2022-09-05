Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B5E5ACE99
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 11:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398625.639511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8AH-00029n-9q; Mon, 05 Sep 2022 09:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398625.639511; Mon, 05 Sep 2022 09:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV8AH-00027v-6P; Mon, 05 Sep 2022 09:13:09 +0000
Received: by outflank-mailman (input) for mailman id 398625;
 Mon, 05 Sep 2022 09:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fkdn=ZI=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1oV8AG-00027Y-1s
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 09:13:08 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00077.outbound.protection.outlook.com [40.107.0.77])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f39fca22-2cfa-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 11:13:06 +0200 (CEST)
Received: from DB9PR01CA0012.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::17) by PAVPR08MB9649.eurprd08.prod.outlook.com
 (2603:10a6:102:310::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.16; Mon, 5 Sep
 2022 09:13:02 +0000
Received: from DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::8e) by DB9PR01CA0012.outlook.office365.com
 (2603:10a6:10:1d8::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 09:13:02 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT023.mail.protection.outlook.com (100.127.142.253) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 09:13:02 +0000
Received: ("Tessian outbound c883b5ba7b70:v123");
 Mon, 05 Sep 2022 09:13:02 +0000
Received: from e87e207be86a.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F5FAACAD-44E1-4164-8A6A-304132413235.1; 
 Mon, 05 Sep 2022 09:12:50 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e87e207be86a.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Sep 2022 09:12:50 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com (2603:10a6:20b:404::24)
 by DB9PR08MB9491.eurprd08.prod.outlook.com (2603:10a6:10:45a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Mon, 5 Sep
 2022 09:12:48 +0000
Received: from AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2]) by AS8PR08MB7158.eurprd08.prod.outlook.com
 ([fe80::f5fa:7206:9197:6ba2%3]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:12:47 +0000
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
X-Inumbo-ID: f39fca22-2cfa-11ed-af93-0125da4c0113
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Oxd+ayau7y7RbCtlebMnEc8+xn/GwOablzBvK2Nkpgj94O/98yiUpoRTClno4ROBRR96Qdl4vLcm+CfAO4RVZJ9151Y/iU95fGHcxyxNBQS0YkTFr87xE62U173S1d6lZ83zUTKZF8A37rZHQfIdKnA72jNHpuaFZ6GRG3FStEwb+CL27Ntne57oc8BEtNAWGgOdzA86mOKh5AqfejMDnH81KK/bMy/0eJ30zn8MXJAEn8W7yTwgESya/xknCroIxPUOPQ6HHbxVXTSWb4lC4iCNjRIOgbZhFHEy11Ipgsx3cIQrTXZn+Sy/12ZtGe5q1vTQWOg7dmlCAInQHSJfDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cOu7CDU0x/Nbb0bW36KQosXPxNepXH5OMrfxlb/Vs8=;
 b=WfuFVYTGSqoLF+Z1mwVWcA3g9jJ9hV7dAv/t5agrhvpSvMZ/038HJam8mvm3FRWwzGJktk84JpTbb2hmeVwbJtht4zUqV+BSeYvK4mlb1NmM0eORbdhQQSI3pstGjlN4HJJLEuoAhoR5fIs2ZQDu1zN3vo2burkBhgxv5K9rhhDZCh+Gq0gTLFw6tS2aqkSqPsP2wl6a69h+WW+xu2PQ1fumFkMWHRuvd7kbWdLAk9T/dcxST35Ng38D1yysSFbNupicg0uRp9XDcgoSPUzlgqQ3LQRQ3l4B5z+SachsMMaNRnLusiORsBqVg6GRnbB1UM6z9HlMnyog8yzpn0mSdA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cOu7CDU0x/Nbb0bW36KQosXPxNepXH5OMrfxlb/Vs8=;
 b=a29AX90vyy4SrnQydCxphBVoy3zYT2a1PzypSgeni00V9G9Gi1m7gmOliG2qEnTsaiIF8LxSmSQ3biApewaDkaFW+TA5X4H0CxpTqMKtCdm8AUeZajofCXY85hFcNHWr+yc/LgEWUY/v4tzBevLwfAuID1DOvy/IjpXPWqgMbgo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9d3a0b82d9b4a542
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czuYf6lSrSHRgOwzcTAQfBIsxF4TkFhriv/mcRkrh/qkNUuIl+Yl5MYX6u+HebX6ssMqEMMMnKHjlFpHX5nrNE3QzZBGCaE+eTTdpHf8VYlW0pL0GEw26bjSKl1hj9Ef43HRw1zTul1ofbvWaIkPNK1YA7pAmEFf9CtX3zKzKn/DJIt1SbYGzY5bg9W2fpaRZXyuIPxqrAb/4LPsF3FOsfoXLLror1uOnrv51bpg2vcohe3s1VfKoMuWVsKK+SA3/0lwKwPVSfL0nNcmEQdLYaHOWejRMRENvcYMCzxQCMdnusHKvakC2uhbpv5d0HUVvz3rm5hCMclHsgoaGX7pwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cOu7CDU0x/Nbb0bW36KQosXPxNepXH5OMrfxlb/Vs8=;
 b=i+8L4aJftcxx1xkYpeGypMRmRidOJVUYQP2Jwl1/HGaYVH91RbRxXF/uj87XxpwtIyMD5fX09MsGxCRVtkco6FRHCMJJmU3fs/+QgGjRoGNOV9TN7IobK58PJDOgJ8HmG2GrMYpKF/aCYcQtL9tizdgGXysLPFrwrUxoXnI41BTM5vcE3FCvZb8XdhZPXbO1oMUwf2T3QLYRrLTSbpCC6E4UYqlnuR3ljv/9ktsKjnccrhQo3iUQDfQWK0fcG6fgVQtO5Aj4xEVUK4DlLAKhz+vNmq0wNGNrV9bBAXJmlc2n3sNjJG2URHhFSg0hFY06R3qzz9CJJosZz04L55u/wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6cOu7CDU0x/Nbb0bW36KQosXPxNepXH5OMrfxlb/Vs8=;
 b=a29AX90vyy4SrnQydCxphBVoy3zYT2a1PzypSgeni00V9G9Gi1m7gmOliG2qEnTsaiIF8LxSmSQ3biApewaDkaFW+TA5X4H0CxpTqMKtCdm8AUeZajofCXY85hFcNHWr+yc/LgEWUY/v4tzBevLwfAuID1DOvy/IjpXPWqgMbgo=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Topic: [PATCH v2 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Thread-Index: AQHYvtDYzitHBxQbZkqmuucOXZ3Boq3Myo0AgAPHJYA=
Date: Mon, 5 Sep 2022 09:12:47 +0000
Message-ID: <CC217625-1E06-4051-B496-98E9E530C2A2@arm.com>
References: <cover.1662123432.git.rahul.singh@arm.com>
 <alpine.DEB.2.22.394.2209021630220.3931@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2209021630220.3931@ubuntu-linux-20-04-desktop>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: e90627ff-72dc-45b7-3332-08da8f1ed5b1
x-ms-traffictypediagnostic:
	DB9PR08MB9491:EE_|DBAEUR03FT023:EE_|PAVPR08MB9649:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 7MRHOwoxU8KCA93BtT4QdQ5yaHYLACrm7v3axmPfrjT2kqGbr5HVf2m0sNjiVV4cDkbN01v8Y4vmAFFTqwfh6c1wdlDHZ0CnjGe/bR1f/RMxKwBNKCQP5KYWAJmZSTdYoXGJ5NVxSYQsjCxADHtBjtZxKLjMZ+SYbJefcJlHaC9DVouZvyS1Wpnd9TQKQ7mgUsfUVwS+KtSYvwPvuIq6bn/Kj6O0Ws93lLs6BF/ufkVVzPD2WmV7ysq9pB6MdNYDOrlz2UGPlOZoCU818fMy/60nuPFE8232hlOvyDvIcOraTR45dzvyRNYEvkwM16ATRYtfG9Mti8t7PrPKUfdQ/o1lzZvqDwB4e3Oe2P7tdNJZFuc5c75kTlSOxEU4lSQ6HilX90bkGg3UnTYXaoJPAk2y9woLh9AybBq5llBGTgq9DiJfmq+2iya/bTfkEil8XK0LmfG+3tVOfDUkkfPYRhdmr/v9qAScLg6hGmoxC1/wJxv4OPLM2455LK/IBIHkpkRGasLJF5FYQleUFepiYAvKDx1DR2m9vdc/PYbl6zfk3AwwXiWF5M+/1PftB3er0GcmE+t7NfSYp6n015rIiJtfdmO6103+cp4qsaPaDIMCND9CrbuKBCBsZyZXI5rfuBnYgnOIntu93bl0S53IY4cSS3REGK0CMvBKCjADY1diuRSDOWRAQU+ejEYjyq/QxIb8PUerPYoxvaHUgbNZ0NMXwiv9svLOcfmgEM+Qbe0TUaIQx2YBtgWeAYkDmpYuGr3pPhaooLqR0CPsFXNRAPfU0HPQ0Da6WfxMQsBQ8Wo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7158.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(26005)(53546011)(6512007)(86362001)(6506007)(8936002)(4744005)(2616005)(186003)(5660300002)(33656002)(6486002)(478600001)(71200400001)(41300700001)(36756003)(2906002)(76116006)(66946007)(64756008)(66556008)(6916009)(4326008)(316002)(66446008)(38100700002)(8676002)(66476007)(38070700005)(91956017)(54906003)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <72E11E3EEE68B4448A977B280B060B16@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9491
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f3a19238-d1b8-4c27-90d1-08da8f1ecce9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BRkpCZlV28uT1IAS3RRMDWZ3BrZST3J8VMQYoP+TP6diREBD/gPyZW+EhoCqxxB0NLUzgLNg4tpsUTaxoJdGThBIsnLVJv7cjMsRtWNJLiZaHXCtmbiBtLN4M8fBZxT0u0RXhW1Cg0stvk0TMDqbgveT3GCPNv+VHdphoJk4gqpCB52DuiybF9AsF85q0l/Fn3kmIdy0iBTRX1y6yvUHfGqCj0lahr196rLTPN/jaHS6PgNdWGpgTYHZhRqA1/EvBQSy9S1xrXBU0DotM9s4phNAsV7EVxB4bM8t2pHDFk6OFb2VgFuFqtBNcf+KBpI5ozD7HYN0TjOpu0friGCik77P8bNk3SIK5Vkx50oA+2vU15cmemIMAMgf/Xptsb2cu6IUA0DBHhBZJRG5X9yDF5bCJjlm46Lc/oZLbHryCHYIqRbIJ6LuSURbWzYNPapN4EgJwopamVHlF3lb5zRYGY0vXP0zTp2XcwDiOQJKIg/GccG3rD4I3f8gQca6hjpL/fgMx/hGMUubCNNKRVQ5XM/wNOD1uA6a6fka8qSJzLqyIesTvEWpFDTuvbhsoBBDgajMiaX2CjIuu70EweIyiOH8auri2xgPq0x26MEaq88N8HJadH2DKgsfSKWh+Ug4XihR90Nef9nYDj55xrjE4MLUi6Tf09zUwcPVembx2MV3vSqTjdUf2KoQtyPsfN3ZbAhFAtXy/c55x3X5qMaRFYyP6Lc9QH4/VxE9KkZkwar1PQ6pNoqIYdTA8Obnl6A73THXuUykHV+kdW3hpiYbOg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(376002)(396003)(39860400002)(46966006)(36840700001)(40470700004)(8936002)(36860700001)(6862004)(5660300002)(40480700001)(4744005)(81166007)(2906002)(356005)(40460700003)(82740400003)(6506007)(6486002)(41300700001)(53546011)(478600001)(82310400005)(107886003)(316002)(54906003)(33656002)(8676002)(4326008)(70206006)(70586007)(6512007)(26005)(336012)(186003)(47076005)(2616005)(86362001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:13:02.3297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e90627ff-72dc-45b7-3332-08da8f1ed5b1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9649

Hi Stefano,

> On 3 Sep 2022, at 12:31 am, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>=20
> I checked all the patches against the originals.
>=20
> I had comments on patches 3,4,5.
>=20
> You can add:
>=20
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
>=20
> to all the others (1,2,6,7,8,9,10).
>=20
=20
Thanks for reviewing the patches. I will add the Acked-By in next version.

Regards,
Rahul=

