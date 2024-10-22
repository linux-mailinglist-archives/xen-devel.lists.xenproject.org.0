Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70479AB414
	for <lists+xen-devel@lfdr.de>; Tue, 22 Oct 2024 18:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.824270.1238379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3HnR-0004bf-QJ; Tue, 22 Oct 2024 16:31:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 824270.1238379; Tue, 22 Oct 2024 16:31:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3HnR-0004Yq-NC; Tue, 22 Oct 2024 16:31:49 +0000
Received: by outflank-mailman (input) for mailman id 824270;
 Tue, 22 Oct 2024 16:31:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tTvi=RS=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1t3HnP-0004Yk-Qn
 for xen-devel@lists.xenproject.org; Tue, 22 Oct 2024 16:31:48 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20613.outbound.protection.outlook.com
 [2a01:111:f403:260c::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20f60dc5-9093-11ef-a0be-8be0dac302b0;
 Tue, 22 Oct 2024 18:31:46 +0200 (CEST)
Received: from AS8PR04CA0190.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::15)
 by DU2PR08MB10067.eurprd08.prod.outlook.com (2603:10a6:10:493::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.27; Tue, 22 Oct
 2024 16:31:42 +0000
Received: from AM4PEPF00025F96.EURPRD83.prod.outlook.com
 (2603:10a6:20b:2f3:cafe::f) by AS8PR04CA0190.outlook.office365.com
 (2603:10a6:20b:2f3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16 via Frontend
 Transport; Tue, 22 Oct 2024 16:31:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00025F96.mail.protection.outlook.com (10.167.16.5) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8114.2 via
 Frontend Transport; Tue, 22 Oct 2024 16:31:41 +0000
Received: ("Tessian outbound 5c9bb61b4476:v473");
 Tue, 22 Oct 2024 16:31:41 +0000
Received: from L3f83c6971125.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6DEA3B79-F7B3-4B3E-A151-1614BB492108.1; 
 Tue, 22 Oct 2024 16:31:35 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L3f83c6971125.2 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 22 Oct 2024 16:31:35 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com (2603:10a6:10:1a6::21)
 by PAVPR08MB9236.eurprd08.prod.outlook.com (2603:10a6:102:307::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Tue, 22 Oct
 2024 16:31:31 +0000
Received: from DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632]) by DBAPR08MB5798.eurprd08.prod.outlook.com
 ([fe80::4a66:d3e2:570:9632%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 16:31:31 +0000
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
X-Inumbo-ID: 20f60dc5-9093-11ef-a0be-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LdoxShfHIVTQbCBaj6quzf3DsqjgFNaP9lOks0FKpRPl5FJMcVdv/vUAjyxNIZM+zSnlY8C8aefiDlgidrbue+ixTZJk5X4/V1EP1+Tw8pw2sqnwi7HSggugMv7UPdmK4gkjXyRPLETljfEc7z0FFfZx+mNQyRTmg0yNn7wiu9cB0ZiQm6p0dmbfz1mufG9DtCNE3MIPQ2SRvei38r4YDGRUTk8JfxjzTOe3ptGIJ9k3JnZDbJ99XLeXPcfi7QFWUwh2ggN4DKnT2xI4quxnlV/tHGRGG9RWJXSWM/SctH+8vguv0Qkt3Jk321rQIFjLWSVoc2npPXJ/8dX7qlGcCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iogjHvKULRhpoZnqEEqrhODqSBOgmiczakkfqa6Hjw=;
 b=ifMpu8iYXoyscivp4B9s3ruJsw7aWuR+4iTFrq3pi9Fd6Vbiy0JaI6k963PPM6x3ry0o01PQ7oOCf1Tc1zYEjoHJy7SLttH11723KXE6A2su6FY9gw3mbI4YEshXvbNltmqENd9eH00pKLsAsx3UJMDNvuo8xo2ve0dIxinQAHmQ1ShHNRB1C0Gy3zi6jKRn0MFHJtI9hsKDEALxne3W9ESgo6HIfc3oo6bkSTtNqrlZ65+4AVcQMAW/zUte9Soe9CbNCf4W24D3FHu9ijIx8mkKm+GrQFvQDerOGLVpvpdLfSwIJJBPkKAya0dJqFT9PeLpqEReojOYj5I73LotUg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iogjHvKULRhpoZnqEEqrhODqSBOgmiczakkfqa6Hjw=;
 b=qv9ckgZ8oxtlv19RtxLCmnWDnw8e762od1XwTLwsqNKhKliz/cVkso6ZzFci5skEqhg4R7Kz3wh2n7TIwFOdZQyqArcDTIUTd5EhEl7+ZRvbGjWjyoO9EsyKfDJS+ApJ1HTwmfPXxv4nh9fAVTI/tdTeFUR3/yBCpTxBdepC5ZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa3042f2b3df1482
X-TessianGatewayMetadata: 9jpBFulyBL56JYZAYck/+LLwKfNL9SG1VSr58BFKfby/jpW870r51PZFARMopq624+fDZVR8Zyn+VDUWN/pAp+rnp6VVR7NEDNu59Tl5PKu8uAvcDTOAHHT9WOJ6NexoSYlH796I2ocfCbzUKXVc0mLGiAAT/uBJa2ng4ztmdjI=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHgGAeyqubyMQDQ1VPfECAeZcXsffk6/XHzfJbz20FLXDX7WyKjocXMMVM3LE6bmcxtQVH/kfl36PJcOQH1QOVrlduMlIiHVqahOkhdrYgPOe4GJaDoZqQl+bWdjmtHH3A7VLtF1EopLpsFX1/HbXh4YU2x1tSbc3fbxhE3FTj1KrQeot4ULF3PMa0x1AVcjUMAGr13Ds0KpjzOdhj63Y9gbb46520Pml2fHfE/BZIam3w41cowyGg0ISgCCbodzd0Ud000u2UoeQpxIYHf+rJik5dYtHqbyC7f+su/84vS/+IG0ge3doS5qzo8GdnRsh1JUYyxVg1JidoEB35u0LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+iogjHvKULRhpoZnqEEqrhODqSBOgmiczakkfqa6Hjw=;
 b=TxQQwpEBFfqjkqO7HFNC3VOxlJmCKJk5X3OSS7F4QxPoRMnqSVeH2RZucP7dloQ9Nk+CSkMAcT5hu4zFCW2mI53bHXA52fVEmTSgoHmgFlSPQ0VhEGVROtSNCjOBevu2X8YPFDIDnC/U4hIusIbPg8jEaJctBH5JKVpG6bkd5JpOyp1h6HZJZ1ht8fKCmqWANVX3ACxSPofA1pUQoCmBxxoh/K+z429caTYvYWVpla7ZXZ2vwKEVI22QTubnd8UZjZlyH2ZmCcFsa1rPR0X4SjagkJt7SiwqVlwtj87PAyWaywaHVhGDi1c/UY6t3tpD79AwGLjyl1KQE/IWwbZ0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+iogjHvKULRhpoZnqEEqrhODqSBOgmiczakkfqa6Hjw=;
 b=qv9ckgZ8oxtlv19RtxLCmnWDnw8e762od1XwTLwsqNKhKliz/cVkso6ZzFci5skEqhg4R7Kz3wh2n7TIwFOdZQyqArcDTIUTd5EhEl7+ZRvbGjWjyoO9EsyKfDJS+ApJ1HTwmfPXxv4nh9fAVTI/tdTeFUR3/yBCpTxBdepC5ZQ=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Ayan Kumar Halder <ayankuma@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Topic: [PATCH v3 5/6] xen/arm: mpu: Enable MPU
Thread-Index:
 AQHbGx2Ge9N55hTx/U2iD9lYiTVQprKNIysAgARC6gCAAA8agIAAAOKAgAEgqoCAAAHOgIAAAmiAgAA3SQCAADcxAA==
Date: Tue, 22 Oct 2024 16:31:31 +0000
Message-ID: <4E7C8350-D6DE-43D3-B269-185FFEE62B96@arm.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-6-ayan.kumar.halder@amd.com>
 <a6a66bd1-45dc-46d2-9e45-8fef8b45e003@xen.org>
 <23b86010-d467-42fd-bba0-65b58e05beaf@amd.com>
 <DEE00B97-ADA5-4229-9B41-571C38F7A6C5@arm.com>
 <f444f549-6f4e-494b-af85-aeec127722c4@xen.org>
 <A302D615-E25E-46DE-A4CA-4FF911293D83@arm.com>
 <d1e8decf-3c63-41fe-a6e3-f880b984dda4@xen.org>
 <61C13F4F-24D2-4B6D-9216-813EDEED4865@arm.com>
 <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
In-Reply-To: <5b8d5c3e-3c52-4b3b-b63f-c89a58f40f10@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3818.100.11.1.3)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DBAPR08MB5798:EE_|PAVPR08MB9236:EE_|AM4PEPF00025F96:EE_|DU2PR08MB10067:EE_
X-MS-Office365-Filtering-Correlation-Id: d290064e-74c0-4850-0d15-08dcf2b70293
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dkVVcjlCZ0pWOWRVdFdtYklGQitENS9XZjcxdGxONXJ0WXFINHRHdlYzTzAr?=
 =?utf-8?B?RUo1bnZpUUdUS0V4ZDdZZlZmdGY3c2RxZHlEK2pjTHEreGNCRmFRRmhlTGlV?=
 =?utf-8?B?YWU5bWt5bHVnNEZ0NEVWam4yeW05eU4zUU9NU3YwMm5LeGdOUnBxL3lrZk1T?=
 =?utf-8?B?aHk1aklrS2l4NUhwL0d1R21TU2NGVkhraCtGQ1pkYjJkckJIUi9DdjRna3J1?=
 =?utf-8?B?Q3A4RWpvZWxIc3QzVnVOYXVVR3V5M2lRL3JqZ0FyM1RIRCtTQVBhZlFSYkNa?=
 =?utf-8?B?cFAzQ0xicCszS29aN3pReStodDVEazV0WnNRR0NkcXpMZ1ZyR3hDYkpidHBQ?=
 =?utf-8?B?RHVhbnEwTC83cjlqMTJOWExoVjNpVzlBenVCRU5LeWNuWlgyTWRFUGZ5Nitx?=
 =?utf-8?B?L3lmcklJYk4wNWJVdWdpc2tRTnJ3ZHY5bnVmZUhWLzdLd1ZCUWdadDR6OVZr?=
 =?utf-8?B?NmtGcG9rRkRYMlBzVFk2T0JIcjdVSnlBUVIwVnA1disvTm1SWGYwTEY2Y3M4?=
 =?utf-8?B?MUtPdDk2Mk5iV21jV05Ob2xlYXpUZE1DZ2JhTlJ4aTVCREhYTDN6TTgwNHJQ?=
 =?utf-8?B?bEZpdjQ1ODVUd3M1RTZhSjA2dnBCKzExcHFJYStOQUUxK3dlWHBFaUlUM3RX?=
 =?utf-8?B?aUM2M2FRWXM3NW9vNVpDUHBSc0FVQzlpc0dDeFdJMUJ4bUk0V29DR1I5TkFV?=
 =?utf-8?B?elpFaHRVK29ISnBJZEVrTGFiTVlTM3RYdG5zMktiOWZlTXpNQU4rU294aVRw?=
 =?utf-8?B?bVNoRTIrOUQ5Z2RZa2lDLzZFbmNjZGFoRVFtcTZJalkzblk3QmxRQUdSeFhU?=
 =?utf-8?B?UHJ5QTZPVUExZDIvNHcxS1dWbUtBeEhqK3RocFlUak1OcGVVMmtHaHBzdUw4?=
 =?utf-8?B?R0h6Mkg3MllkMUV2L3dWL0pvTjhtUmgyeTAyaFoydjNLUkxQam4xbW9WYVNP?=
 =?utf-8?B?MFBEUUVpMU54S1U0bWsvMEFTQTM5L3hnWWgxN1J0UzFqQzhuMFNFWVNmK2JF?=
 =?utf-8?B?WncvdlVQVnZhR1JTYVd4SnZzWU5tSHlPMUN3eGh0QTB0QUhkVWE1VmZOSXFm?=
 =?utf-8?B?QnR2QUNtNXFldDJtYUw2VE1Tb21OdlRHbXEza2xXN3lCV2dNWXVRTWxUSlhw?=
 =?utf-8?B?QUNEUko1L3hkYkR2a1BnZFhPL3QrMUtjVlkzVEpGdVlnSElnWGxwcUl5Q3My?=
 =?utf-8?B?VXprbUhOeHFjb3ppZlJUQmdrdUx1S0VxVzh1VXNaaFF3RG1EemRKWlMzelJ0?=
 =?utf-8?B?NnhWWE5zbElCR3NjZG9JZU9wZEpicWhrVjd6TGJXcUUvdTBRbTlhUk1QSlNx?=
 =?utf-8?B?bi84RFVtUXdTZHZVWGNlM2RXZ3UzbWFOL201RTd3Qk5mNVl2WW1OaXA5ZWV3?=
 =?utf-8?B?K3VjRlVPUkxXaGpiVHJhSzVzRXBITmxSZjNXQjlFWGFIRDF5NlhkMWxub1Ry?=
 =?utf-8?B?UVRSYy9jRVErQVp1OWRTMXdOS0RFZ1o3TjZWVW9peHJCQ1V0Y0FFK3dleGtQ?=
 =?utf-8?B?L24yVlJjT1JmZ0EwbWpHSXFRTUVXSWNPZVVXa2hGSkZIUmlNUkV2NkUzdmY5?=
 =?utf-8?B?Qmk5b2diT0EzVHpHc3RJaWh6eGJPNzIxYTFpbFFwcDdma2xxV1F1d05YS3JQ?=
 =?utf-8?B?dUo3RnNYVHgrMWRHS2JLbkVzY3FmK3h4OTJMMXVOaTUwTE1OZjJOU2QwSkF2?=
 =?utf-8?B?QnpKSVJlUGlyaTFicWtFL2hURUpTdU5qT3Y3UDZIelBtVDJXMlp4a0pHL0Mx?=
 =?utf-8?B?RURIQWhxektjeS9ZbEdETXgzRzBTcDltcldSOWhJUkdCTWhSK0xRTHE0NjF5?=
 =?utf-8?Q?ukDytnhahvH5DKgZag+QFcBMk0GDtRk1X1Sc0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBAPR08MB5798.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <66DC63499E4A6544947D13A958272C5D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9236
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:1a6::21];domain=DBAPR08MB5798.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	01b76001-137b-4be2-a78a-08dcf2b6fc7b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|35042699022|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VENqT0pHaHA1K2gxYTZvUXJUMXRlL0NocEtTaTVmdHlIZ3pxN0ZEbHByVEl3?=
 =?utf-8?B?NWJKVnI5M2ppQzJsVXdwNUxvWDdtNCtLazkvaGZmTUlPT3NEaFFpV1Y3L2xy?=
 =?utf-8?B?aHhmdmRqMHE3ajQ2Nncza2Y1a2JFanJJR285dmRZdllCYUhkTzl2V2JQRzhp?=
 =?utf-8?B?MTVVYUwwRjZyQlRBTHQ1OGpNTmtHR0dFb2QxRUJzUmpwc0t5WFBCdW1pVnRU?=
 =?utf-8?B?QzgvWi9MR1p5NVZ2R2Z2V2FmMU0yajBqb3pGMHA0bFVDK1dXcFdQeWxldjFz?=
 =?utf-8?B?YU5FUjQ3dnhXbTluY29tcGFObWJjVFpGdk9XYWlTL0tTTjV4OGw0eFJaTXpC?=
 =?utf-8?B?K1lFKzVRUDJ1eDJzWUIwR0U0VkNFSzVaR0ZHK2luR2xpalJjVitsMEhicjdl?=
 =?utf-8?B?dGRLdllKMzZNMGVBWDlqK3dmTTdqZU15b2krcWxuQ1ZMRGZzamxYVDBseE1n?=
 =?utf-8?B?dkRzOExYQ0I2ZEc1NEJydDg1bFgyeEhrRTZOb3JBdTQyV2lmNjZzR0d6bnZv?=
 =?utf-8?B?clZlaGcyRG9wN2svcTBETHpZQnovbGtlTlhIbUw3Uyt0QUxGNTZNRG5IYXhk?=
 =?utf-8?B?OFVjNW82Y0xiOGJONER2S0h2Y1hERGlOYzQ1VkhCNkpoS2tCUWhMQ2t0OU52?=
 =?utf-8?B?d3VLd29UdjNoT2dkK1lxQzJmNEdsVUZwQTVGUkZjY1lTYzJDSTlXQnBnaytw?=
 =?utf-8?B?M1hzc2g5T0t3cjVERVdXaFRHQ3FjZFRqWWxoRmhjRmZlTUhaQ2FUK1RHRXhB?=
 =?utf-8?B?R2JvVlFUc0RzRkFaOFE5WENnSHZmRkU5Smc2K0JGTTRuSlJEbHptc04rUVM2?=
 =?utf-8?B?OEM5SWtvWVRyeHpNQ094RkNTYVZFVmVWb3JnZjdBNk9qbFppSTRUemdUQmlD?=
 =?utf-8?B?bUo4RXFhMW1uNEZjdGI0cUFZNUxleHIzUjArM2Rqd1dWTFJzRy90UGtmYlhT?=
 =?utf-8?B?U01UZmk1djdRSFN5UlJzVktJc29uaEp4MmZGWkdud0lpcTlqbjYydnJyL2xG?=
 =?utf-8?B?N0pVRVN2N0ZpNjhjS0hsK1cydGtjK0diTjdrcFFiM2cvV1VTeHZlTG5KT1NT?=
 =?utf-8?B?SE03TWY0RmdrZXg3NHlobGpaaC9oekNFT1MvSXIwWFRHVHpSWGplYUM0MFRB?=
 =?utf-8?B?MTVaNitOc0NpL1BtVlcyNlNzK0NJUE44K01mT0I0NGpQRmFOR2F3ampYZVEv?=
 =?utf-8?B?anVLUjN4bVFpREZPL2hFV21zampNMURKNGFIRlhhZmZkbjJvSmt6R2E5TGNh?=
 =?utf-8?B?eE5rOWRmMHVVa0YyV2R5ZElvcEIzWkJWOFEvZzlPVzlPKzV0WlZNZDM1SGli?=
 =?utf-8?B?aEE2Q3ErTXA3M1RWU1NPa1VQWE5uUEFmaVBPb2JQS1dJdDQzT2J6a1JFdWZk?=
 =?utf-8?B?ajBXWlBLK0VSZml4RzdXalhVN0dzVTk1YjVGYnk3Y244ZkhZMVRhMEtWcW5D?=
 =?utf-8?B?d0tIWnFwQUJzanQ5WWZURVhYdStldC81REFDKzFvajdYZ2N5RTgzVVArMll2?=
 =?utf-8?B?RFhua3RFSk9TUUxZYkxVcGloZEZOK0w3MWJUUmNRNlIySUdYRlpqalVsdVBs?=
 =?utf-8?B?dlRZb1Boc3dkaExCaWhRa3RZZ1BLYzRXbUJMaGdHZWQyVk5JZW9peDUrUlR0?=
 =?utf-8?B?cWhNd05BWk1sRmh5ZTE1ZHpXbW9vd0VSTFpYcUZlNnBGWjVaQWlKQWozYXVW?=
 =?utf-8?B?ZnRMVGhUZ0FmTG5MU3hSb0JHbmVaQ1VBSXFpSXhUN2V4RVA0aFZPcDZSN29P?=
 =?utf-8?B?dlJJaGEzcm9SVUNqc2ZOcHFwYXo5dG00MFZUcHQ0MjR6dUhmTjJaOFBPL1Uy?=
 =?utf-8?B?alZ6N05ydkFDOGZBSHdXTFRWTlRRazdIMm1jWW1Jb2tBSk9SeXlQcGZaNGJZ?=
 =?utf-8?B?Wlc1VEVRY01iY2ZCQmY0dXQ2Q0tuSEtQTng0NmYvaWZwTEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 16:31:41.4958
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d290064e-74c0-4850-0d15-08dcf2b70293
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00025F96.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10067

SGkgSnVsaWVuLA0KDQo+IE9uIDIyIE9jdCAyMDI0LCBhdCAxNDoxMywgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIyLzEwLzIwMjQgMTA6NTYs
IEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4gT24gMjIgT2N0IDIwMjQsIGF0IDEwOjQ3LCBKdWxp
ZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPiB3cm90ZToNCj4+PiANCj4+PiBIaSBMdWNhLA0KPj4+
IA0KPj4+IE9uIDIyLzEwLzIwMjQgMTA6NDEsIEx1Y2EgRmFuY2VsbHUgd3JvdGU6DQo+Pj4+PiBP
biAyMSBPY3QgMjAyNCwgYXQgMTc6MjcsIEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+IHdy
b3RlOg0KPj4+PiAyKSBkc2IraXNiIGJhcnJpZXIgYWZ0ZXIgZW5hYmxpbmcgdGhlIE1QVSwgc2lu
Y2Ugd2UgYXJlIGVuYWJsaW5nIHRoZSBNUFUgYnV0IGFsc28gYmVjYXVzZSB3ZSBhcmUgZGlzYWJs
aW5nIHRoZSBiYWNrZ3JvdW5kIHJlZ2lvbg0KPj4+IA0KPj4+IFRCSCwgSSBkb24ndCB1bmRlcnN0
YW5kIHRoaXMgb25lLiBXaHkgd291bGQgZGlzYWJsaW5nIHRoZSBiYWNrZ3JvdW5kIHJlZ2lvbiBy
ZXF1aXJlcyBhIGRzYiArIGlzYj8gRG8geW91IGhhdmUgYW55IHBvaW50ZXIgaW4gdGhlIEFybXY4
LVIgc3BlY2lmaWNhdGlvbj8NCj4+IEnigJltIGFmcmFpZCB0aGlzIGlzIG9ubHkgbXkgZGVkdWN0
aW9uLCBTZWN0aW9uIEMxLjQgb2YgdGhlIEFybcKuIEFyY2hpdGVjdHVyZSBSZWZlcmVuY2UgTWFu
dWFsIFN1cHBsZW1lbnQgQXJtdjgsIGZvciBSLXByb2ZpbGUgQUFyY2g2NCBhcmNoaXRlY3R1cmUs
DQo+PiAoRERJIDA2MDBCLmEpIGV4cGxhaW5zIHdoYXQgaXMgdGhlIGJhY2tncm91bmQgcmVnaW9u
LCBpdCBzYXlzIGl0IGltcGxlbWVudHMgcGh5c2ljYWwgYWRkcmVzcyByYW5nZShzKSwgc28gd2hl
biB3ZSBkaXNhYmxlIGl0LCB3ZSB3b3VsZCBsaWtlIGFueSBkYXRhDQo+PiBhY2Nlc3MgdG8gY29t
cGxldGUgYmVmb3JlIGNoYW5naW5nIHRoaXMgaW1wbGVtZW50YXRpb24gZGVmaW5lZCByYW5nZSB3
aXRoIHRoZSByYW5nZXMgZGVmaW5lZCBieSB1cyB0d2Vha2luZyBQUkJBUi9QUkxBUiwgYW0gSSBy
aWdodD8NCj4gDQo+IE15IG1lbnRhbCBtb2RlbCBmb3IgdGhlIG9yZGVyaW5nIGlzIHNpbWlsYXIg
dG8gYSBUTEIgZmx1c2ggd2hpY2ggaXM6DQo+ICAgMS8gZHNiIG5zaA0KPiAgIDIvIHRsYmkNCj4g
ICAzLyBkc2IgbnNoDQo+ICAgNC8gaXNiDQo+IA0KPiBFbmFibGluZyB0aGUgTVBVIGlzIGVmZmVj
dGl2ZWx5IDIuIEFGQUlLLCAxIGlzIG9ubHkgbmVjZXNzYXJ5IHRvIGVuc3VyZSB0aGUgdXBkYXRl
IHRvIHRoZSBwYWdlLXRhYmxlcy4gQnV0IGl0IGlzIG5vdCBhIHJlcXVpcmVtZW50IHRvIGVuc3Vy
ZSBhbnkgZGF0YSBhY2Nlc3MgYXJlIGNvbXBsZXRlZCAob3RoZXJ3aXNlLCB3ZSB3b3VsZCBoYXZl
IG5lZWRlZCBhIGRzYiBzeSBiZWNhdXNlIHdlIGRvbid0IGtub3cgaG93IGZhciB0aGUgYWNjZXNz
IGFyZSBnb2luZy4uLikuDQoNClVobeKApiBJ4oCZbSBub3Qgc3VyZSB3ZSBhcmUgb24gdGhlIHNh
bWUgcGFnZSwgcHJvYmFibHkgSSBleHBsYWluZWQgdGhhdCB3cm9uZ2x5LCBzbyBteSBwb2ludCBp
cyB0aGF0Og0KDQpGVU5DX0xPQ0FMKGVuYWJsZV9tcHUpDQogICAgbXJzICAgeDAsIFNDVExSX0VM
Mg0KICAgIGJpYyAgIHgwLCB4MCwgI1NDVExSX0VMeF9CUiAgICAgICAvKiBEaXNhYmxlIEJhY2tn
cm91bmQgcmVnaW9uICovDQogICAgb3JyICAgeDAsIHgwLCAjU0NUTFJfQXh4X0VMeF9NICAgIC8q
IEVuYWJsZSBNUFUgKi8NCiAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9BeHhfRUx4X0MgICAgLyog
RW5hYmxlIEQtY2FjaGUgKi8NCiAgICBvcnIgICB4MCwgeDAsICNTQ1RMUl9BeHhfRUx4X1dYTiAg
LyogRW5hYmxlIFdYTiAqLw0KICAgIGRzYiAgIHN5DQogICAgXuKAlCBUaGlzIGRhdGEgYmFycmll
ciBpcyBuZWVkZWQgaW4gb3JkZXIgdG8gY29tcGxldGUgYW55IGRhdGEgYWNjZXNzLCB3aGljaCBn
dWFyYW50ZWVzIHRoYXQgYWxsIGV4cGxpY2l0IG1lbW9yeSBhY2Nlc3NlcyBiZWZvcmUNCiAgICAg
ICAgICAgdGhpcyBpbnN0cnVjdGlvbiBjb21wbGV0ZSwgc28gd2UgY2FuIHNhZmVseSB0dXJuIE9O
IHRoZSBNUFUgYW5kIGRpc2FibGUgdGhlIGJhY2tncm91bmQgcmVnaW9uLg0KICAgIG1zciAgIFND
VExSX0VMMiwgeDANCiAgICBpc2INCg0KICAgIHJldA0KRU5EKGVuYWJsZV9tcHUpDQoNCkkgZGlk
buKAmXQgdW5kZXJzdGFuZCBpZiB5b3VyIHBvaW50IGlzIHRoYXQgaXQgaXMgbm90IG5lZWRlZCBv
ciBpZiBpdCBpcyBuZWVkZWQgYnV0IGluIGEgZGlmZmVyZW50IGxvY2F0aW9uLg0KDQo+IA0KPiBD
aGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQo+IA0KDQo=

