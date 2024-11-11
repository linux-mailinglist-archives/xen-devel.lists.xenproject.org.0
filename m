Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4286F9C3CB3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833545.1248708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASHb-0001aG-5K; Mon, 11 Nov 2024 11:08:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833545.1248708; Mon, 11 Nov 2024 11:08:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tASHb-0001Ya-2A; Mon, 11 Nov 2024 11:08:35 +0000
Received: by outflank-mailman (input) for mailman id 833545;
 Mon, 11 Nov 2024 11:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kNBq=SG=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1tASHZ-0001YU-TM
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:08:34 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20614.outbound.protection.outlook.com
 [2a01:111:f403:260e::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48c58cac-a01d-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:08:31 +0100 (CET)
Received: from DUZP191CA0043.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::26)
 by DB9PR08MB8411.eurprd08.prod.outlook.com (2603:10a6:10:3d5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:08:26 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::60) by DUZP191CA0043.outlook.office365.com
 (2603:10a6:10:4f8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 11:08:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 11 Nov 2024 11:08:25 +0000
Received: ("Tessian outbound 6d1cdc6e2d10:v490");
 Mon, 11 Nov 2024 11:08:25 +0000
Received: from L182c17bf9037.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 161A6DDB-81C3-46EC-AAE4-B9C6A7A986D8.1; 
 Mon, 11 Nov 2024 11:08:14 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L182c17bf9037.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 Nov 2024 11:08:14 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by AM9PR08MB6145.eurprd08.prod.outlook.com (2603:10a6:20b:2dd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 11:08:12 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%4]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 11:08:12 +0000
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
X-Inumbo-ID: 48c58cac-a01d-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYwZTo6NjE0IiwiaGVsbyI6IkVVUjAzLUFNNy1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjQ4YzU4Y2FjLWEwMWQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzIzMzExLjAyNzAzNCwic2VuZGVyIjoibHVjYS5mYW5jZWxsdUBhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MNzWoeocQawAf9XSx6zyylD1bdQtmCglk3ya8mQoFrFIEEPHw5Fn/cwGQHTIyfsJbFcZlfTifwZ9VrZJD1R+4dw9AbstUsnOE4cYhE1/fwybwtnuiVQx4tSDbyr4ozFoIMj1aGc8Xcp+I7kcmIhMEyqION3FedtLabYcguvSYqTv79/KAv2iMFkxgYansk6aMrDLzdqtbQCQ59T4zgiI9QdK8AtonobfzHU1FcMNYh9NxMQAvDiwaiftPTAkJZeRMj9zCp7ozsuAoiuzbNmXOQQRJBSTomcVQ3gsTKkv31NISvNpGrXZWErOQcXim/leNz1sCNnqZJMi8X3axT27pA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJu23F4CbP+5sLQcykVHR5QsV+ro2NkEXqOFbU+LagM=;
 b=ELKtsI1Z+jTgMN88f0ojna31Eo9UC+sII8uhswRge4alPWBs9nl6rz4k1V4bMKj03MvQTnUg0dXLrQZH+AZ4MPCR3JqdspcuSpIuCIG3VXZvZ3KKWnk4mVhqyTw/DSSuIPhNLQlRnkNn0Rwnhda/SW2Ye8BPvttXUyU244Dgqh4vPpYDzht52SpLEyV1FVfmBezWaLm0yO9mzw9xwRRi1C6+nYcssUM17CvtVRNaCpDIGX4FXOKYrqzFYZXUblcIU6bvabsWZJpWiVU8hK4l1lQhS68sohM/zeexOufN/7b2D9jQ6wobxJ/7XX3AjUoQxdAakeRHn1XRZ5rMMmvaRg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJu23F4CbP+5sLQcykVHR5QsV+ro2NkEXqOFbU+LagM=;
 b=CNnv14OG1jNJs9oZDfmiwqm3xrJU1NAyWTLWflN4CKDHZfjKAzZHHIx79w/bNjNVrB2Ekz+oeWFVlRu3zv1m5fOMadYXhgiFpIvXJ84MU+3H5mDgbBFn0pB2U/BSeUMs6ZVbqVxueGwRMXc45Q5/K+h7wmTQeCz4bwu9w3ZeQec=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5008daba368e848
X-TessianGatewayMetadata: iPBNn9lVF6dTHrinc3vDEK2LNMTagSZhAJVUh/BKFJ8pdzcf6Qfat8cA0FDIHhlKHOxOqf371hu0hoVSDPo8U8m/d3I9tazHzWoO2sRECmND6O4Cngmf8WNAmPHGw1glXS/GD8U2wgOFj8vy0LyTMU9YCn4xRFdagUG0sCu7Tl8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9yXSicMABe+SR1P0sZ9ClZfZOp+wcOCHDH1MzpEv9cqeecuLcGl1qJfib57nZoek/XpmpNqnlxIOpmmR6CYt3CJy97wzjRHkHVZtU2VhqR6lq6+5pDDI4vNxa2e4VC96Cn6hDp3dAK6aPxDyOz4G2oFR63RqjwOGIySkmGWfvWevljqFt3GocNuJYi1DZCqD7snwKiswHbfjH47hkAPWrt7kt+0dlvBFg9/E0/XJlIKEIX8cP+cKyATnJo5/n7AJjJulcXX8qp5yKVYzeMFq5KyRdP2ayPMRXhi4lGuODwh+PPrfOdBrCxPtal2ClReAqyW0ubmD8DXmuYQu4by8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJu23F4CbP+5sLQcykVHR5QsV+ro2NkEXqOFbU+LagM=;
 b=E2t7JnfoLcyxQyIDiA0l+j52xwvo3ydQBHAvnMuhYDuFTo1orPBvFQYSb5tEbWGIOlmMlARNtIxEcdK2oe12hxdcIU7mF0TRYmBF8sjNLS8vFQi6VFGPLHXvySkz/hz+EONSaT9mWpio++4sE9jnp7GYBL6U94POCSe/90kX5A/k/0DbaFDPaXT/um+9QENxwTciZVU3VvtcoxjVJBLXPG49+xJXp8rA6UNP5w7+8aN2zyRykPMPZ+5srhq/wnvXv95kzP0ypkcTdHtzdfsaZqdVwh2lS7HpkyjnM3TxHnfDpeSoExN4IGQUfGoIa2mibn8/tPlNuJcBi205N5cRCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJu23F4CbP+5sLQcykVHR5QsV+ro2NkEXqOFbU+LagM=;
 b=CNnv14OG1jNJs9oZDfmiwqm3xrJU1NAyWTLWflN4CKDHZfjKAzZHHIx79w/bNjNVrB2Ekz+oeWFVlRu3zv1m5fOMadYXhgiFpIvXJ84MU+3H5mDgbBFn0pB2U/BSeUMs6ZVbqVxueGwRMXc45Q5/K+h7wmTQeCz4bwu9w3ZeQec=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <Bertrand.Marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Topic: [PATCH v1 1/2] xen/mpu: Map early uart when earlyprintk on
Thread-Index: AQHbMhjv52dbbNhpnEiehVgzpuNQ9rKx78AA
Date: Mon, 11 Nov 2024 11:08:12 +0000
Message-ID: <60DF5024-0726-4B0F-939D-B3724C21CEAC@arm.com>
References: <20241108200024.857766-1-ayan.kumar.halder@amd.com>
In-Reply-To: <20241108200024.857766-1-ayan.kumar.halder@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.200.121)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|AM9PR08MB6145:EE_|DB5PEPF00014B8C:EE_|DB9PR08MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a7b4c8e-fd79-40a7-1244-08dd02412a09
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aGw0aGlvcGV1aUJTUTJIUWNYTFBpTGVLSUZxQ1lONm9ZanJsZDRucEczRDNC?=
 =?utf-8?B?SGNvRjhlaUkxZDk2N1N0QStDVkFWb09xZlhlMXR2cFJ6NVppV3lUZzlEUEJI?=
 =?utf-8?B?Tk92VlBMdExSOEQ2R01VNDBzT0VnK3M0UDRsbkdmZnY4R1ArWTNMdkMxbnV6?=
 =?utf-8?B?bmh5dXBETHhsVXNNNEFvd3NwRFdhK244TGFJUFp0bnk0cEl0aUFzWFZvbVAx?=
 =?utf-8?B?MTZLVkZPVi9idDV5RGJzMm9jaFR2L2FjUndoeWdQNnNjWmxzMG02TTlqR1FJ?=
 =?utf-8?B?RTRDK24vME9UUzR2c1BCNXdZMGRxNG0vcWp4WG1UbHNNN2FhVGNxeGh1eC9x?=
 =?utf-8?B?MmpUTFpRU1o3Y2ZxN2RLZTRpcCtsa1JaS09HcGorcHBYSHBGem4zNTR5ZENC?=
 =?utf-8?B?SEtMd3hUSHRHOWtFNjdUVFhNRWZqK25DM29YV29BM1ZtRGtGODJTTmZVdkpk?=
 =?utf-8?B?YTcwSm1BR0x2dk9xclJYY1FrYmp0dndQRXYyZW5vSVUwUVAzb0RnTGtDV0No?=
 =?utf-8?B?UUdlaEJCaUpnblUyMC9QdlZLeWVTUGRienVLSjRDbGx6aEUvYmkwbDd4UXJT?=
 =?utf-8?B?VGluYSs0bjBoRFpmZzY5WUtISThaSVdobTZtdEd2RWppMm8rdmlmb1JOWVVX?=
 =?utf-8?B?aWkydlgvYmdPQUZHVUpzdzNYbENPM0hkd1ovY0lBb0FOcnRZNVFmUWh3Y292?=
 =?utf-8?B?NXRydUZGdmxKUE1SYm01b0pneTdzbC9BZVpJMWQxY1VsM29nZ3hwUTJGYWtj?=
 =?utf-8?B?Q2xMZi9sRERrVlZzSkcyd0dnNjRFdzQ1bWkxSHhueWlpbXhZeEt6Zi9YY2N1?=
 =?utf-8?B?cWZXUFVMWkUvUUliWWpuSkhEd3M2ZG8wVnRlYWFJc2w1Sy9VcUczSnU5QkRN?=
 =?utf-8?B?NmthOXFsc1E1ZjNaMWFCb1pWRURIbkRwWWRXQ2lzR0FMT2xEeDYrcDJrRnhH?=
 =?utf-8?B?eDYvbStQc0hmWlBiS0krRjRQN3g4TmRpeFByWTdtMGZCcEcvTGNkNmoveFdo?=
 =?utf-8?B?Rm1EV25CQWJvWEpHNWY1azc3eG90ZEZUM2h0S1g1MTZ2WlRSZzh0Vlo2dXFx?=
 =?utf-8?B?a25sZFdaWjM5cWJMbGhrVURlc2ptK2VYanFsdmpKanJWeHlmdTh5SHJ1WjR5?=
 =?utf-8?B?UHNQMDVhbmdodlVXd3B6U0VmbWVsMXZmSjhaNFNkTVJWMmJWU2ZCa1M1aUdK?=
 =?utf-8?B?T0UxU3N4Yi9XK2kza3pKdjhNN2dqVHpyS3NGNnhzeFVVcHdzdW1zZ2tuMEJu?=
 =?utf-8?B?MkJBbFdYWlpVNmYzdkd6L1Azc093TGlnbDBQWWdMRWNtWDdXYmorVU1Jd2NF?=
 =?utf-8?B?RE9wWGNpdk5qRmQxbzFHdEtiT0hQZ1dtbEdoUi9NcG5DYUdhd3kvSklxQ21M?=
 =?utf-8?B?ODlwWGFkTnBZTU5JRGozeU53bTh3V3BjR01yRW1HZ2FWaFYyOVZXenhWVnB6?=
 =?utf-8?B?b3dwTkFoTDFxMU1sUzJvTXlnMVJTMHdzZmt2b3p0ZnoyOGI1Y1dDMmh3SXRv?=
 =?utf-8?B?cEluTkxLa3o4dHYyZ2ZNM2JPRmpjU2ZHTng2Vmc3MlRuUnM3dUZ0V1VqYVNC?=
 =?utf-8?B?V1dwcTVCRjJJVTQzY09oYUkvbGE4VG4zSWorZUhGRWJaRisvTGhYZHdueWJz?=
 =?utf-8?B?ejdjaGZhZTZBZ3JCUDNvVnkySTFabkx5NmRsTzFrYVFaRjE5UXVkMnRUVk5i?=
 =?utf-8?B?d3A2akdLbEE2Z21JVzVPQWlDd1ZQU3o5N3lvbXY1Yitia0N0RjRmY2V4clBG?=
 =?utf-8?B?VW16Zmw4cXltRWFWWE1lQnc5NFBKYjBvUFJJSld1NUowUTl6SkwyVlZPZ0py?=
 =?utf-8?Q?UqNi2jnKkgOgEj1Th/CLuRu4WcIucxh6pnRiU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <98AAF2F92F546349BC347AD9472A0C22@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6145
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a94b3ca-0aee-4034-cc7c-08dd0241224a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnN5YXljTXpKSkZkVUFlaFM2T1hGTElra3VNRlJ5c1pTWHAxUUNqMVcrYUV6?=
 =?utf-8?B?WElpeUIzYmttSU1IcTdCbEFWbW9vMlBZY3B1Ulg5S0x2RUgwekpFWFI2QlBX?=
 =?utf-8?B?cWo5OFovMkErZVVNMWVjOFduVGZUbkh4OFN6RkxxZTJBL25zUmRjY3EwWkFm?=
 =?utf-8?B?dklqTXViRWlmSndFNXJNcTg4NXU2VTlXS0NQY00rQ3NwR2FFaUgzVDVJc3dx?=
 =?utf-8?B?Rkp6allUZ0tHaXNBZnpBVmRudTdrcjkzZDkvVHdPREw3dFNWdDhLQzFnRUdn?=
 =?utf-8?B?bXNzYjQwNllHTFEyNWtuZHh6UVY0K0xnK1VVdHhqN0xVR0JPRFVhM2IzUDRF?=
 =?utf-8?B?QWZiaUNtZCtFQUpGb0krNCtSQnJBRFJmSDJ3M3c3UzRjSi9EcHJWNTVmTGFz?=
 =?utf-8?B?SGdhbm9sS21ZdXFPRUttSjN6NEQ1N1BTZFZuK011dzBsN3ZUdURuU2xTbVA3?=
 =?utf-8?B?R0p3U3JFY3JuUDh5K0JJN2hNNFhIZnZsYmRwNkVpK3FaTG5IWEwva21TVjEy?=
 =?utf-8?B?ZEJpNUs4Sk4yYUp1REEveGtIZHhCdW5BOHppY1Q0Mjljb1cvalBNYmF4bGpi?=
 =?utf-8?B?VDNJcUVRSWJwS3JqNDdkc1VqMlA3elZpclBveEJoTjR6UkZWTnN2VXhtRUth?=
 =?utf-8?B?enVEdytLV0paQ3MxaHdiYVd2MzVRN3ljUlpTRWd3amVpWE1tYlgwSVYzU3JP?=
 =?utf-8?B?TlJnWmJLUVJtUjlvR1ZsNjJRbVNCV0JkdmwzMEFGdHhLV21aMSt3d28rMDZD?=
 =?utf-8?B?SldyWEIxVGNEdGswYkVpR2JFUDl0TndKRmtTNmpqeGZmYlQ5Y3h1cjM5SktE?=
 =?utf-8?B?QUdBU0psdjlUWURDNXJyR2g5SDlrMWhtR0ZReFBOTmRxVGl6YUY0RVR5b2lM?=
 =?utf-8?B?bHJQazd2ajB6VEZySWN1WWlReEVkS0xYVm1lUklJUEtjcmJZKzAyU25rN3ND?=
 =?utf-8?B?QkR5eG1MaHk1dG14TVpCbjJuUXNBVEp3WU9uVk9kQ1dST3JSK3BWZndVYnMr?=
 =?utf-8?B?clM0d1FaYm9KNng0dFl5MTFwYm9Zay8xOGlmcElYUEhScWlHSnBheE1GT0dn?=
 =?utf-8?B?QWJWL3ExYU9zVkMzdlZwbkZkT2RxeE5SYmMxV2sxMThRbTdjbWgvcy81Lys5?=
 =?utf-8?B?TjV6Q3NWbTh6Z1VuNXoxaDJmQjRaVyswUnlQUHJJRUIyVzNrREpBVXFWSnZO?=
 =?utf-8?B?YWR2SGZOSkVSL2QvdE9HOVgvWG5JU2IvUUR4Rmk4MlY0WEdVdHpuV0Q3SVZR?=
 =?utf-8?B?bWt1cVI4d2Vsb0JpdTVFdVpFYjNQamFTL05SdkNtZXExeWV0RTB5N2RuNUth?=
 =?utf-8?B?SFRCYUxkMk92bGpnR3JGUkRsam5ZS3NTV2l5UnRNQzNCQjN2YUwwNERXc3VB?=
 =?utf-8?B?SWI0WUNiWEhaS0RFMVVlQ0pObU5Fa21jeVVnOEFSNUFMblY0VFFKaTFlOHEy?=
 =?utf-8?B?dkovemZOZGtUdDMxOGhobFlaVExnOXpFQXcxSSt4TU54eStYZjVXVzR2UVpW?=
 =?utf-8?B?VmpRdjF0RUxaUGsxeHZpd2Q4d05CU2FWbFBxRjFXR290NTBRamNhQi9CRlVn?=
 =?utf-8?B?M0ozUm16TnVEdWkrVlZSbHp3Sm1UbXgxc3NscUlnYVJOazdpYlZqbkxoMzMz?=
 =?utf-8?B?cVc1eXdVcjF4bEk1Q3h2ci80TFlNYkh3eks1S29FaWZyZXk2VlFZZ3hrSWhE?=
 =?utf-8?B?aUNEY01iZlBzcUI0cEFnZUlzTUVwUmFiZnI3M2djc1RVdXBrRzcxZFo1YlYr?=
 =?utf-8?B?QmxMWEgxUU5qVkhYTklwRmQ5dTJuWmhhaG5YY0NQN2Z4WUtEZzE4TVNwakp0?=
 =?utf-8?B?KzZWeWlJMVU5S1FrK1ZFUzdVSmN0RUh6c1k1czJqYzk3VVJQcEhoQ0VqTmtR?=
 =?utf-8?B?eEZ0ZzhOMElwUVVNZzJGUTZQVVlHMWxjWTZNeGVZeXZVUlE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 11:08:25.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a7b4c8e-fd79-40a7-1244-08dd02412a09
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8411

DQoNCj4gT24gOCBOb3YgMjAyNCwgYXQgMjA6MDAsIEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmt1
bWFyLmhhbGRlckBhbWQuY29tPiB3cm90ZToNCj4gDQo+IENPTkZJR19FQVJMWV9VQVJUX1NJWkUg
aXMgaW50cm9kdWNlZCB0byBsZXQgdXNlciBwcm92aWRlIHBoeXNpY2FsIHNpemUgb2YNCj4gZWFy
bHkgVUFSVC4gVW5saWtlIE1NVSB3aGVyZSB3ZSBtYXAgYSBwYWdlIGluIHRoZSB2aXJ0dWFsIGFk
ZHJlc3Mgc3BhY2UsDQo+IGhlcmUgd2UgbmVlZCB0byBrbm93IHRoZSBleGFjdCBwaHlzaWNhbCBz
aXplIHRvIGJlIG1hcHBlZC4NCj4gQXMgVkEgPT0gUEEgaW4gY2FzZSBvZiBNUFUsIHRoZSBtZW1v
cnkgbGF5b3V0IGZvbGxvd3MgZXhhY3RseSB0aGUgaGFyZHdhcmUNCj4gY29uZmlndXJhdGlvbi4g
QXMgYSBjb25zZXF1ZW5jZSwgd2Ugc2V0ICBFQVJMWV9VQVJUX1ZJUlRVQUxfQUREUkVTUyBhcyBw
aHlzaWNhbA0KPiBhZGRyZXNzLg0KPiANCj4gRnVydGhlciwgd2UgY2hlY2sgd2hldGhlciB1c2Vy
LWRlZmluZWQgRUFSTFlfVUFSVF9TSVpFIGlzIGFsaWduZWQgdG8gUEFHRV9TSVpFDQo+ICg0S0Ip
LiBUaGlzIGlzIHBhcnRseSBiZWNhdXNlIHdlIGludGVuZCB0byBtYXAgYSBtaW5pbXVtIG9mIDEg
cGFnZShpZSA0S0IpIGFuZA0KPiB0aGUgbGltaXQgYWRkcmVzcyBpcyBzZXQgYXMgIkVBUkxZX1VB
UlRfU0laRS0xIi4gVGhlIGxpbWl0IGFkZHJlc3MgbmVlZHMgdG8gZW5kDQo+IHdpdGggMHgzZiAo
YXMgcmVxdWlyZWQgYnkgUFJMQVIgcmVnaXN0ZXIpLg0KPiANCj4gVUFSVCBpcyBtYXBwZWQgYXMg
bkduUkUgcmVnaW9uIChhcyBzcGVjaWZpZWQgYnkgQVRUUj0xMDAgLCByZWZlciBHMS4zLjEzLA0K
PiBNQUlSX0VMMiwgIi0tLTAxMDAgRGV2aWNlIG1lbW9yeSBuR25SRSIpIGFuZCBEb2MgSUQgLSAx
MDI2NzBfMDEwMV8wMl9lbg0KPiBUYWJsZSA0LTMsIEFybXY4IGFyY2hpdGVjdHVyZSBtZW1vcnkg
dHlwZXMgKG5HblJFIC0gQ29ycmVzcG9uZHMgdG8gRGV2aWNlIGluDQo+IEFybXY3IGFyY2hpdGVj
dHVyZSkuIEFsc28sIGl0IGlzIG1hcHBlZCBhcyBvdXRlciBzaGFyZWFibGUsIFJXIGF0IEVMMiBv
bmx5DQo+IGFuZCBleGVjdXRpb24gb2YgaW5zdHJ1Y3Rpb25zIGZyb20gdGhlIHJlZ2lvbiBpcyBu
b3QgcGVybWl0dGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXlhbiBLdW1hciBIYWxkZXIgPGF5
YW4ua3VtYXIuaGFsZGVyQGFtZC5jb20+DQo+IOKAlA0KDQpUaGlzIGxvb2tzIG9rIHRvIG1lDQoN
ClJldmlld2VkLWJ5OiBMdWNhIEZhbmNlbGx1IDxsdWNhLmZhbmNlbGx1QGFybS5jb20+DQoNCg0K
DQoNCg==

