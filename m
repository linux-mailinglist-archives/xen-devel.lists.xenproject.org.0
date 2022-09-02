Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509925AA9D5
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 10:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397472.638060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1vl-0006gt-9K; Fri, 02 Sep 2022 08:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397472.638060; Fri, 02 Sep 2022 08:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oU1vl-0006eB-5o; Fri, 02 Sep 2022 08:21:37 +0000
Received: by outflank-mailman (input) for mailman id 397472;
 Fri, 02 Sep 2022 08:21:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mC+w=ZF=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1oU1vj-0006e3-TA
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 08:21:35 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20068.outbound.protection.outlook.com [40.107.2.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41daa1db-2a98-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 10:21:35 +0200 (CEST)
Received: from AM8P251CA0010.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::15)
 by DB9PR08MB8649.eurprd08.prod.outlook.com (2603:10a6:10:3d3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 08:21:32 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:21b:cafe::2b) by AM8P251CA0010.outlook.office365.com
 (2603:10a6:20b:21b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15 via Frontend
 Transport; Fri, 2 Sep 2022 08:21:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10 via Frontend Transport; Fri, 2 Sep 2022 08:21:31 +0000
Received: ("Tessian outbound fa99bf31ee7d:v123");
 Fri, 02 Sep 2022 08:21:31 +0000
Received: from 49af4c921f07.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9AF83ECA-7E84-48A7-B3B4-8D2BB97813FE.1; 
 Fri, 02 Sep 2022 08:21:20 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 49af4c921f07.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Sep 2022 08:21:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by PAWPR08MB9448.eurprd08.prod.outlook.com (2603:10a6:102:2e3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.14; Fri, 2 Sep
 2022 08:21:19 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::1415:7141:512f:e787%3]) with mapi id 15.20.5588.011; Fri, 2 Sep 2022
 08:21:19 +0000
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
X-Inumbo-ID: 41daa1db-2a98-11ed-934f-f50d60e1c1bd
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=DZayc0qLHfxYA1ojBh2N+nbVpOlrmK9kAY+4FgX2mCgoT8ypIguxhc2HE4EE2nkgrYeb7iYay45lxBxT88PE2NJzd69lcizvKN1HTlQaV/tXpoenW7Ez5h9/dxIZTuChj0+ej0Tz0YziLaE1Wp3N6u/RYw4kPD5iYxWOJRrx82Ei86UuC0AoHCbHJ/wwa68gvhPtD9Ea7WUKX9j8ixE0ROh1zzKj6cOp0RywHD9C2lm6gxMrzvVHZs1beNmyQh+2aD4XDoWYr2Ca47Lv2NFDHUC4573U0AbSi8EUTs/6WFQiSWfsEnmeVWrlcxF+cpZx60FLdzE1P+Qph8H/+stbqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74eaIOaZRNx4sj0K2zxmuD1i6ICSV9sstwT5zWN8xVA=;
 b=jA6snh7Kw4bO89kV+sjwjRvNGox9tQKlCb7zLZrmX3MzKV4mWF3SwY6zA/XDdyY2i901QXAHNJ5Bn+kMMk6CMhxrYYLAMjpcIH2TueJAqW1kV3O3yEICXhbOKdePVK5Qmb5ZQaiM8abbCP04APPkFLNysTASruH86vgjn2U8EHf0m3SJXAaWiQ5V7P3sk7SfujGGSEgoMcj65ea40/H/VlJ6Mm0qGq7ApsdteWgXuMMycE34cE3G/jiWGoK+xjd+nGGODKxABRqENGUQjqajUMC+u+AuXvWvK4IjK7ZKltR6Ri9pwYfZL9lAVxrJVZXaZMI6HDfeWg7CZz62CboQiQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74eaIOaZRNx4sj0K2zxmuD1i6ICSV9sstwT5zWN8xVA=;
 b=c9ipWPqhddSG8ciECBy6dO8q6A/TPDtkXNymrbzSIEqXnU8TQ2x3wke5ekpYnfoOUqJ+dB6Hb2PwUUVsGXw9JWkCPvYXZ0jHAwzpKITyHyBnM2P2u7XNBs6vL3jl2ay6nmYRzNvZM4Z4X8iql0FQ0IyL525Vk5alYcydPaRu4bE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5Wz8vubfEF62PxhH2Ye0vwT5Hmrt0One6pprNPhG9zrb8RMQ3PPIoUPH2vXnRM3uReiDnibYnEk83hJr/bG0tCXydCs2VN6meDpkY20TohEDwpVuTDZHUY6MJvG23hJrO1vKQZ0YPIZwnYoqM91JiCYZommhKDgEwPbI4rt7fQXg0JdG2mAvxPM83EbHDXfE+6jH4A84nfaruqIULY3iGSwDpxzccjKqD1Ultpu/vYuFiEazCSFqWSn/oS8Bpd0CKA76BXhFvl0h1cHvzN+zwXXSXOkDkuirG7zkg7F7IJ8TF5b3l5HsEXzWw18lRKTvQ3W7vc0GtOTbR+V3x0YMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74eaIOaZRNx4sj0K2zxmuD1i6ICSV9sstwT5zWN8xVA=;
 b=KokWjtneyp9JQm1FYJphVr3TX/3lhV8yZMRRJFFzmxt5m/Xnz0m/BZq/uITBTkPlUIop6Xo9Z7qkjRmIzvZJ7ajHtvnwHAYHh1UeAK+pf6M40dxP2qzh434OPPj4NmuTtN0h0j1g3ecMLPEBBWMOi4r3otbB+zlfLixstBd8gw4kor8NS98VZu/cGIwJRnDfxTo14uSAv6AIjVwZRh0qptgRUPNTvFGkHBbRqTxu8ZPv0ZKZjIDeVJUksAo62OEap5Wdspw8eDnSg6YTy6kh4jPhzurCwviqBFGalwMFe2jehCXcUW/Mu+Jqfxp2McUio9VIS5lYJKnx7GcWPFdDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74eaIOaZRNx4sj0K2zxmuD1i6ICSV9sstwT5zWN8xVA=;
 b=c9ipWPqhddSG8ciECBy6dO8q6A/TPDtkXNymrbzSIEqXnU8TQ2x3wke5ekpYnfoOUqJ+dB6Hb2PwUUVsGXw9JWkCPvYXZ0jHAwzpKITyHyBnM2P2u7XNBs6vL3jl2ay6nmYRzNvZM4Z4X8iql0FQ0IyL525Vk5alYcydPaRu4bE=
From: Henry Wang <Henry.Wang@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Wei Chen <Wei.Chen@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Penny Zheng <Penny.Zheng@arm.com>
Subject: RE: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Topic: [PATCH 1/2] docs, xen/arm: Introduce reserved heap memory
Thread-Index: AQHYt4ueuuTQX+2f5E69518db+C55q3KsXoAgAC0jPCAAG9VAIAABQZQ
Date: Fri, 2 Sep 2022 08:21:19 +0000
Message-ID:
 <AS8PR08MB799130D1A9C52535BC9123AD927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20220824073127.16762-1-Henry.Wang@arm.com>
 <20220824073127.16762-2-Henry.Wang@arm.com>
 <9b5afd5e-ec5c-bac6-9ad0-9dd9663aa705@xen.org>
 <AS8PR08MB7991DCF7AF78FADB95166551927A9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <56d7a2e6-8749-601b-b163-669401bdfd67@xen.org>
In-Reply-To: <56d7a2e6-8749-601b-b163-669401bdfd67@xen.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 2F4579122164E14F8D1E2423D8098DEF.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6ec4247c-f545-4791-0dc1-08da8cbc2468
x-ms-traffictypediagnostic:
	PAWPR08MB9448:EE_|VE1EUR03FT045:EE_|DB9PR08MB8649:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 PE87ZvXx87nDVQH/aztf+zYKk2zHJAf8ZaOTL4R1FXga/UBNgaA+YADdq1hYqRKaw8/ucRL2Dp4ntuxWQ7t5RnDDleIsse7BBX0nJmq9S8suLHxRN3niuqyQJsWJhpmIyWbVpEx7hkSeWYUN9NNOrIKuA1VwE5Ylr6+VE70GI39P+HRSPhxKM2zN8gVRkh3hMo1b0BhU+4fETFooAvCqgljjNAMhGlq0mzcMkJcImpL2dXTOYHHTCYojgafhwM1oDAvzA5h4cTBLnEG99AjjXUpENhv5Achv+9GmahBgHfqDnZtBXsMO67zuQGuXOafRNFxeq4jw1KjWWiQjT8IhoMoiDV+W7Ht+lO0N7+XDhh44D2ZpfdE8gw+86DTrkjm9nasqoc+5XRgAna9vOeha8qt2425/FwkLlpUdkQ5rCRlD6ZFuTAHzn48ITRv+ZBNcK74XeHQhZFALCnurX9TqLvS4swACBTQ20GXFLXfGhfJTSr+xbKbo926NpUIBiYmAfvnZqDtKDlS+ztbQNFFX0J4+1exgpz/a4JiB3+3DqTBV0h52X72Ad8FFjZJQt2qbYXK9lSjHENVAMgt3Qn9yn5vSkLz55DjUtju+LBxeSNOi+Sao/5f3ScJLE7dK+gq4Slv4O4M+721sJiFWyxF0vOpzZxLRCY6oTmXRC96idri+0qP9B3iS1fECWuPjHRtDSMAH6HagRTjiwNlMFkWUe2RPcXeWS8t91O7fmNXpis8ioRcjoHy8zLYyP4HiewyXhDWQTRUxsFo6JbSWOOBFLA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(8936002)(9686003)(110136005)(33656002)(122000001)(38100700002)(6636002)(54906003)(26005)(71200400001)(316002)(38070700005)(52536014)(7696005)(6506007)(76116006)(8676002)(41300700001)(53546011)(2906002)(66446008)(64756008)(66476007)(478600001)(4326008)(83380400001)(86362001)(186003)(66556008)(5660300002)(55016003)(66946007);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9448
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b93d9e64-12a7-4260-684b-08da8cbc1cee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JcrkC3G86GWcBb0lt+A9725TV3j1tA5fwE7IaO6o5CwT2k4+zezbUjBZROvlf9uRaQADE3i2rLOjl2KlkCIHydcuFrqFSzwmEiRDltZPb1a74oVauJlmksmpPcB7VGp7w18z1ptHSPO5/F5ZI/Pz4rF4+7ePtbAHsWDAOXkF3DFubWrpq9MYf5Adk0xizQoc+98dBZPiHcyt3hhbDMBzRlW1X7ohjnlZs7fR2soC3y0UpkLoCB1AVXPe+n7DZYZgnsFo0tvOkzI3kq65w6UlX95qEnpML+0G6LaiGcbZP2ssUAOIVCCCHHxVBp9g23UZ3RtEqLu0YnktnZvrYsnQAHq7sQtkrobAmLRYux+z0hWCGF812pk1gbTOzcLEoiEiTi2E7gCEZE7WKaf0VzXNtNOz3CrOsHcxIk/Vb9LHAamsKbsRx6g0NJEp1rCDnXYI+t7yEqLq3g7V/fpCm9bFIqudgsidfRC2AOiqKm26i0mtIMQe3ftCbfzU3Ztvkee5KH5SICXFs+v8gbzNjj71lRPHJgiKV/l+5Es0eKBxjBDKkRZdLJFb1PX+C/m1eHcnJos0BUVbBscOS6JncKt+PC799SMlcJRgYpgRpgkuq6XBZwK7+sN0PyUddZiqYk8N8IugB/yryJ0fQ39c74n5aLOuYOFLWvwgs7I0frjBjC46IkGEwW97bPMpvNAx5JW2/NE2a11bImf50FDxC4WdNr13y6vBe7Nx/shsLY/JMmUEL8dRCRW+p2YAUCr2FO8Qw2S6cRIv3eFv9xGI8rUkkA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(396003)(376002)(40470700004)(36840700001)(46966006)(33656002)(82310400005)(86362001)(53546011)(82740400003)(6506007)(7696005)(9686003)(26005)(83380400001)(47076005)(55016003)(186003)(36860700001)(40480700001)(336012)(478600001)(5660300002)(52536014)(8936002)(54906003)(6636002)(110136005)(316002)(40460700003)(4326008)(8676002)(70206006)(70586007)(356005)(2906002)(81166007)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 08:21:31.7635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec4247c-f545-4791-0dc1-08da8cbc2468
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8649

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMS8yXSBkb2NzLCB4ZW4vYXJtOiBJbnRyb2R1Y2UgcmVzZXJ2ZWQgaGVhcCBtZW1v
cnkNCj4gDQo+IEhpIEhlbnJ5LA0KPiANCj4gT24gMDIvMDkvMjAyMiAwMjoyOCwgSGVucnkgV2Fu
ZyB3cm90ZToNCj4gPj4gVGhpcyBpcyB0ZWNobmljYWxseSBhIGNoYW5nZSBpbiBiZWhhdmlvciBm
b3IgWGVuICh3ZSB3b3VsZCBwYW5pYyByYXRoZXINCj4gPj4gdGhhbiBjb250aW51ZSkuIEkgYW0g
aGFwcHkgd2l0aCB0aGUgcHJvcG9zYWwuIEhvd2V2ZXIsIHRoaXMgZG9lc24ndCBzZWVtDQo+ID4+
IHRvIGJlIGV4cGxhaW5lZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+ID4+DQo+ID4+IFRoYXQg
c2FpZCwgSSB0aGluayB0aGlzIHNob3VsZCBiZSBzcGxpdCBpbiBhIHNlcGFyYXRlIHBhdGNoIGFs
b25nIHdpdGgNCj4gPj4gdGhlIG9uZXMgYmVsb3cgKGluY2x1ZGluZyB0aGUgcHJvdG90eXBlIGNo
YW5nZXMpLg0KPiA+DQo+ID4gQWNjb3JkaW5nIHRvIE1pY2hhbCdzIGNvbW1lbnQsIEkndmUgcmVt
b3ZlZCB0aGUgcmV0dXJuIHR5cGUgYW5kIGZ1bmN0aW9uDQo+ID4gcHJvdG90eXBlIGNoYW5nZSBp
biBteSBsb2NhbCB2Mi4gU28gdGhpcyBwYXRjaCBpdHNlbGYgaXMgZmluZS4gTXkgcXVlc3Rpb24N
Cj4gbm93DQo+ID4gd291bGQgYmUsIGRvIG1haW50YWluZXJzIHRoaW5rIHRoaXMgY2hhbmdlIG9m
IGJlaGF2aW9yIHdpdGggcHJvY2Vzc2luZyB0aGUNCj4gPiBjaG9zZW4gbm9kZSBiZSBoZWxwZnVs
Pw0KPiANCj4gWWVzLiBJIHRoaW5rIGl0IGlzIHNhbmVyIHRvIHN0b3AgYm9vdGluZyBlYXJseSBy
YXRoZXIgdGhhbiBzZWVuIHJhbmRvbQ0KPiBiZWhhdmlvciBhZnRlcndhcmRzLg0KDQpDb29sLCBJ
IHdpbGwgdGhlbiBhZGQgdGhlIHBhdGNoIHRvIHRoaXMgc2VyaWVzLg0KDQo+IA0KPiA+IERvIHdl
IHByZWZlciBhbiBpbnN0YW50IHBhbmljIG9yIGN1cnJlbnQgYmVoYXZpb3I/DQo+IA0KPiBJIHRo
aW5rIHdlIHNob3VsZCBsZWF2ZSB0aGF0IHVwIHRvIHRoZSBjYWxsZXIuIFRvZGF5LCB0aGlzIGlz
IGEgcGFuaWMoKQ0KPiBidXQgd2UgbWF5IGRlY2lkZSBkaWZmZXJlbnRseSBpbiB0aGUgZnV0dXJl
Lg0KDQpBZ3JlZWQuDQoNCktpbmQgcmVnYXJkcywNCkhlbnJ5DQoNCj4gDQo+IENoZWVycywNCj4g
DQo+IC0tDQo+IEp1bGllbiBHcmFsbA0KDQo=

