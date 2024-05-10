Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9538C20DE
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2024 11:26:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719624.1122452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MVj-0001yZ-Gr; Fri, 10 May 2024 09:25:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719624.1122452; Fri, 10 May 2024 09:25:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5MVj-0001vj-Dp; Fri, 10 May 2024 09:25:51 +0000
Received: by outflank-mailman (input) for mailman id 719624;
 Fri, 10 May 2024 09:25:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jEWd=MN=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s5MVh-0001vd-SI
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 09:25:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48ede01a-0eaf-11ef-909d-e314d9c70b13;
 Fri, 10 May 2024 11:25:48 +0200 (CEST)
Received: from AS9PR06CA0620.eurprd06.prod.outlook.com (2603:10a6:20b:46e::18)
 by GVXPR08MB10810.eurprd08.prod.outlook.com (2603:10a6:150:150::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 09:25:45 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:46e:cafe::ee) by AS9PR06CA0620.outlook.office365.com
 (2603:10a6:20b:46e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Fri, 10 May 2024 09:25:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Fri, 10 May 2024 09:25:44 +0000
Received: ("Tessian outbound b7675f20d34d:v315");
 Fri, 10 May 2024 09:25:43 +0000
Received: from bd6c78b1c7e9.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D20B5C61-11BA-4B6A-8DB6-9DD13D7A4B1C.1; 
 Fri, 10 May 2024 09:25:37 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bd6c78b1c7e9.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 May 2024 09:25:37 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB5PR08MB10161.eurprd08.prod.outlook.com (2603:10a6:10:4a5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 09:25:35 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7544.048; Fri, 10 May 2024
 09:25:35 +0000
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
X-Inumbo-ID: 48ede01a-0eaf-11ef-909d-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=WoMIFSpLToePcC2S1YLX7Y0jR9ZScLxKUeeb3pLRyb8EOCbdZpLGQZuyu+ZD9X/IeEuHKbCjUi3ZE9hIFAPYYaBLMH3ptQ+p9DPVhbNgNaKNlOdqoo2twd413SzPeUJHBfPit0pcSk+aG+q/jFqLUFBkHSjdv/vaSgSoOqhf/A99B5JRVCo73o67Z1OraUqRmevMJ/+jasl0/eTsGgohGnPi1S+R/iQDZp9vMqn6EOed3jHwUw7b7v/y6CQySn7zeL0adqe8Spjk4M6rJNBSJ+6gAyQBxCLIgDgyXd2ky3C7atoaBDCTooOXmh3F43fpCB+Z1O3rvHHeNpYWt08kmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/DxX1DNCNf2QgaMJTIwoc53PkU1J8qu6qS4WJS5Qoc=;
 b=KmcaGVym2dWaxKn6RvG7dJCfozNjFJ2mzhUGLAv+T4UglQsNHzG9Do6f9Cv0FUiXpcI0souZnYGNJrdJIZq+YceKRW3Ht2m7UO+/N+7DrljcDd+J8HW9q1PLtMw53YlbOavg87PVRONsRhk+2eyfK0epOthg2gJ4tQv5BAxyLSCf8cV7tGpoUOJvNXH+m0I9NlRpsNZ2sW7FiDQ01LotNRodzVgjJQ3MHmtDD6WGGGb8idhbT5ixRe51dt217DQnDPGIbPSzyEi3keHZLJOyKYxjrCxzB6EhtAwuEEIYdNipDYquMZtOW7y+96KtnQtTDTfHvLCl3K3n5d7LGloovA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/DxX1DNCNf2QgaMJTIwoc53PkU1J8qu6qS4WJS5Qoc=;
 b=GwW2n91rRrLiwn6VHYvlzb2LcltrXgP6Z+jp+4CV6PdHsQf9nMholO+RowUE6AkVgYTmV9ajP6UaLM3Rf5EJ55NcOuUiQcAqr9r7NAzvSjT6+A/c9ieFSQbENoHx+9j4x3Et3RxQ0lGE4f5xSIb+mTK4gI5TsDPi9F1ZVrm/D4M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 49ca7593cfc0f2c3
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYy5fgiSAn7b695MtJPysFdGHjeJoa3Pjj2sfNH6JJSj88d/0lEoHQmXW9FYBFvrx3VuGqJQ96WzVNe4JH3uTytrsJgbLyPzzTDlOpAMW6aqC0O+oI9X8wSuryTpt9a7rkCh4/U9NZixYE4EWuHkaMAY8qLpLfHryCKnd/F/6AObAjmCIMoF4NbAau9RyuO3Kkditgl9YaeDbrSSOeHuIH9vU7jAWrsZjOWqZ7f9736PFs0EBJbZoRVb/Le6H/PJCp8l6Hh52rjR5zPPfeN2i5Wnm+QW5Jd05O5nf8PpLVra/G+CppagaX569kkP5ocgt6TItjpcU6l0t3IjWirC9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/DxX1DNCNf2QgaMJTIwoc53PkU1J8qu6qS4WJS5Qoc=;
 b=dtDRAHL+uEka9C91mG8YN7j4t7DOQWBZygfpVu20BduWmJXn52kiMPd4W1EWvAUf1sOth1KeURjhKjNtcvko89y4rpGixqPVh0OCG+7xtJPvKK0kbVqyM6k2koQ4A4fJJAyFs8mQk5cawU0QrvKc/gbjxTrJ2B2g0/vODeuKaIbnCPURBPkCplSSNcbdODsc7oUkTdEgnQYKyxSeGwgjg1vfKId2//fHarJJMAgrfsv4KYrtc0ZkgG5U+nQTIDx0VefqKEoxOM6uUA8k1NhkVgm7w+6C5XeN4aeLdQ4Af1za9UJYkQAM2nZtC2lqKUQipXDFnhmUQI/fPRtDRLXSVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/DxX1DNCNf2QgaMJTIwoc53PkU1J8qu6qS4WJS5Qoc=;
 b=GwW2n91rRrLiwn6VHYvlzb2LcltrXgP6Z+jp+4CV6PdHsQf9nMholO+RowUE6AkVgYTmV9ajP6UaLM3Rf5EJ55NcOuUiQcAqr9r7NAzvSjT6+A/c9ieFSQbENoHx+9j4x3Et3RxQ0lGE4f5xSIb+mTK4gI5TsDPi9F1ZVrm/D4M=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 6/7] xen/arm: Implement the logic for static shared memory
 from Xen heap
Thread-Topic: [PATCH 6/7] xen/arm: Implement the logic for static shared
 memory from Xen heap
Thread-Index: AQHalVfty94kOt4AK0ecWyByn7T1+rGQSwuAgAACP4A=
Date: Fri, 10 May 2024 09:25:35 +0000
Message-ID: <10212FF3-3CCD-4634-9890-4CDCA11A5F88@arm.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-7-luca.fancellu@arm.com>
 <cb496741-dd76-4536-818a-cbfdbd496b0d@amd.com>
In-Reply-To: <cb496741-dd76-4536-818a-cbfdbd496b0d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB5PR08MB10161:EE_|AMS0EPF000001AE:EE_|GVXPR08MB10810:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bea7074-8234-45b7-586e-08dc70d32b15
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d01LSjFUcE14RHVwYnEyb1VRd05kQmlFSDJIdHNrdVJrY08raWlUbng1NDJ3?=
 =?utf-8?B?em9rUCtWbnFBbHNoRjFYZk5hNFFCZGsyUUc1RUovazN4YzNha1Z0WGJrYlhK?=
 =?utf-8?B?amZVREdwMUhnMWZLUXR1M0hYMUJVeHhweGFyZGJEUjliVVN0WUZVM2hWcU1Y?=
 =?utf-8?B?Wm1GM29xVGNOc2JTY2txVjBiaFZ2Uy91SlZ0Z0pPdmFJUk41VzJ3MzZVekdX?=
 =?utf-8?B?K2pDMVNkRHF4bGgvNnhkUWthVHRiUkV1c3NvbUtPZS9wRjdsYVV2UmpMSFly?=
 =?utf-8?B?dG1Iek53VVhUenBLL0VNaXRPeC9GVHd3TEErYnJNVUd6K0dpd25yb3lSOFBs?=
 =?utf-8?B?bHZwWTRsSXFTRTZITWhJVm10Rzd0SXNCTzBCd00wbjhkam9VM093amJMOUhy?=
 =?utf-8?B?MkVaUUxFM1c2OHhpWlJyeDZHTll5aE4vTnhGR1IxNlpnVzkxU1BrRisyc0dI?=
 =?utf-8?B?c3pGckljSDI0Y3RZUTlWVHRiMGRFN0IwWlU4aitwM1ZQb0ZXNUd1S0JrMTRD?=
 =?utf-8?B?Zk5ENkhOY21WU2gwUlZHVDhMMzgxc09vd0QrSDZlclliNGIxRkF2MFRUSVRa?=
 =?utf-8?B?bE5KNTlrcXBkaFZTMEJPQXhlaEdUdWVNQ2ZWeEhQU1RKT1cyczczdlNCNERI?=
 =?utf-8?B?aGJSSFNqaXR1VzRSMjY0dTJFc05wb0pRSk13U21lb21ZL0lONlFKM2gzMHJR?=
 =?utf-8?B?UGlhRGRFZDQwY2V6RmJPcGNvVDdhVjB2M2YvWTJ1WUxUWmI2UTMwZ2tKMlRM?=
 =?utf-8?B?OGxzL1VtWk5kZjQ0Y0tGUG1kRlZ0YU41dGNESVljRGZ5c3hSSFNQb0tBSnF5?=
 =?utf-8?B?cGRpSG9la1FZN0hpanYyV0VFbk9LcGdNM2NnK0xFWjhQcG5uUHBWTm9GVm1k?=
 =?utf-8?B?ZGxSNGJKYW9xY0xpQzRCYTRnYU9vcUhjZDhhVUU3WlBON3ZoSEdrOFFvT0U0?=
 =?utf-8?B?eXpVUUxaLzNyM2ZJazRhem0vd2xaVXZFQXpka3cyblp2THRFeS9QdUgvSndN?=
 =?utf-8?B?VldvUFZRd3hIdENHZkhaek5LYTNuQkkxTVY2b1VXVE5mUkQyWGVHZDd6VTR4?=
 =?utf-8?B?eWFpQlEya2l0cXdySU40SmtCckFKMUFRSHVXSDhVMm5udEo0cllITGxaeVNL?=
 =?utf-8?B?NmZzRlhKNnA0WDV4SUVKbnAxbzI3VlZpSGdxZVk3NDA4dXA1ZmRWdmNYTEdT?=
 =?utf-8?B?ZXJDNHRNZ01sWVBsTkgzMEhzVzlGR0QweU5vNy9YZnJBQWF2cjNHMUdTS3lS?=
 =?utf-8?B?VFZuWDcxRzZ0d1ZIYktoUTNnTmNRMjVwT1pyQnYzNlpvVkZtNmhEUTAwSFZS?=
 =?utf-8?B?cWptVi9QZnl1c3RzRGJoOXVSQytrTCtOYnRXSkQxQ3BEUVpXWHpxYXdFQ0lH?=
 =?utf-8?B?YnB2R2ZlMmZrS1dpQzl2Ry9URVhUa0NncElhZkhBVDJYaVNTOHdBa0xrSCt5?=
 =?utf-8?B?ZTltVHFoNkpFbmZROFdVOC9OcGlGTzFCVlhMVktvTkdLWjNydGlkVnN4cHpI?=
 =?utf-8?B?RXY3ZXhOL0YrSnZNNFhIZzNFSnBzaFBaUFhpUTlhRC9oTVpLbzluRVYyNnZQ?=
 =?utf-8?B?OEQ1YTFPeUVWTGRFV0xMdVpnd3FQR3lQZlZIYStBVlNGeVV0bmk5a0d3R1dE?=
 =?utf-8?B?V3RWclg2cE9jazF6NDBhdHpTUXFTY0lLNk1qalhSaWNoZTRhbkMvUndBOHp4?=
 =?utf-8?B?T01wNHFDUklyOTZ2Q3ZTaUE3enc5N3FUeEY5ejdDYmtiSDc1MDQwbnFwMDdK?=
 =?utf-8?B?MUcyWDUyR3A3MHBtK015WFlLYU5nNjl5Wi9ybnpDMC9HSFovZ2EvbXZWT3No?=
 =?utf-8?B?dFUrMFlwYkg2K1hlbjBqZz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <49A7C1245BA31D4BA7C050717371F13A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10161
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	891d4236-6d1e-4340-995a-08dc70d3261b
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|82310400017|376005|35042699013|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFgwN1JsTnduOVdrUU5aV3pWSjdsZTJBM3ZKSEMzNm10ODVId2E1MmxYT1gr?=
 =?utf-8?B?SzBYcnJYN2IrcTZvaW41Q2hTMFZZdlJVdFQ3Z29QbWNuQ1pXYVZPRmFYb1Fs?=
 =?utf-8?B?SHJQWko1S3dGSC91ZnlOVFFtVWh4MEtkMFliRWpMdE9nU1RFU0FZSWtMZVdp?=
 =?utf-8?B?T254OVc4VnZqRDMrMFpnSUJvc2xGWk9FeDloT0Q0Y2xpajFnUFEwRW80VG5R?=
 =?utf-8?B?NXMwUmdkQTlSeDg4K2JwcWZxWGYya0lHL1FDTFpLM0NwWDYwaW43ZEZnb3ZF?=
 =?utf-8?B?eUNyTGJPaDE2SVd5bm5Nd085ei9YL3NWMGJCK2lqZGM4V0dhSlVwY2xIYW1k?=
 =?utf-8?B?RUJjQXI2cmV3MFFnQW93TGVQSFRleVVDZVVKNFdNbUw2WkwzZmNiZDJ6ZUNn?=
 =?utf-8?B?MFRCclYzYS83Z0l1MFdUVXlhak8yWDlSNHBrMWEvak9YSTBsVHFqSzZxOXZu?=
 =?utf-8?B?b0NMNmFmMG9CMWdoY2R6bnkyNU1uTTBtMWYwSERWV09FS2J4cTdjeFRTaE0w?=
 =?utf-8?B?MlFNaU55NFI5OWIzNm50cTcyY2dHNzlINXA0UTNmTWExQWdBVTRTK0tPM1Ny?=
 =?utf-8?B?YTNGMi95TlNOeUdTdjdkZ1JtcGZ5VjFoSHg1T2FISjVTb282NGxmcGxoUkZN?=
 =?utf-8?B?TTE4U3JtTzZmNXA3YmFUQXoxdEw3U3dJMnFRK28vN0pVUXdYVjZ5MHRMdzBt?=
 =?utf-8?B?Ri9jUGIxWkVxanBQRjRCaEJpZjdaR1NRWklvd29McFo0MUs1bkV1RmlmV2w0?=
 =?utf-8?B?TElrQit6citxZFdZV3pEN0RZaExyajNuRURGM3orUDhIbzNVSnpzSmdWZ2Ji?=
 =?utf-8?B?WElsTHROTXJvQ2NSZDRVZGQxN2ZZais2U3JoSGkwSUNRWnY5RmN0cHFaVno2?=
 =?utf-8?B?b0c0OFREeSsxSnJFeW4zZGlFTzV3U3U5MzUzTVQ0Y2Y4NTZwZ0lUbTFRS3pn?=
 =?utf-8?B?NXFsOHpwMDlxeGtJOHJGRHo0VHcrUysrcm5HR2xNaGc1TEZVVnVhUGJoUEgr?=
 =?utf-8?B?TU9FRGU3eXByRXRidmhiVjVwb3ZWYkxoTG9zczgySVRkTlZUNGxCY1lRV3ZO?=
 =?utf-8?B?WG1mT0ZyZjBjdm9acVBGekk2bi92ZGxtOUhtbWZaaFc5VEM2M3RkYkNKVDVG?=
 =?utf-8?B?cmlEMGd0cWJ6UldaTzdUYi9KNDF1bXpNeGc2WlVNdkVVV0VNelViUDFIaGZz?=
 =?utf-8?B?WmtxR3gwYTQvbXVnT0RJNk5Va0x4bHNZVkJNWjExQTJtTlhqWm91dnJodXll?=
 =?utf-8?B?Ujh6NCtSQTJTVXlQQ3lWN3VFWnVGNWRHdkdJdnJOZmNBTTkyeGFnNGJCZEt4?=
 =?utf-8?B?RWVXZGFyLzFxWktXdldLQlh6U2hGZ2RuclZMU0owZUZvcGxuNHg0R0NvYVI2?=
 =?utf-8?B?blZzcDNOZUF3RHE2UHJPb21Qckw3endCTjdxSFNvYW9kVHg5TjYvcVRSUE40?=
 =?utf-8?B?V0RXTGZvd1VIWVRydFZKbVlwaFFEMWw4dEsrRm5waUw1aWpubVdaWk5hVFNw?=
 =?utf-8?B?UU9rcGp5M2Jjb0VFMldlWmtjWHNVQ21uV255ditwS3VYQW9abG9FT1hnU1BG?=
 =?utf-8?B?dWhEWVV0Qkp4c2xGSGJPWXJWNjUxYUd4NTNibGNwV3pLR1Bvbm4zRjEwMGUw?=
 =?utf-8?B?YkQ0NzEyZnFHNURqb0YyRHVHWXpJcjI4dE9FSnZJc0tzMG1sc1lxVFBjclY4?=
 =?utf-8?B?b3FXM2o2d1lhdS83M1d1Yy9WSmVLZTN1NDBXVE5vS3d4YmhWdXIxaGxCeUxH?=
 =?utf-8?B?eU0rZDM4RlJvelROeExZOE84cFZ1VXNTUTRsVERFazNOQ2dXUUhUWU5YWkEr?=
 =?utf-8?B?UW9aY0liS2NNMi9YdnQ5emJDdkN5UXJSVnErWEFzWmxFU0ltNE11cGUxekVw?=
 =?utf-8?Q?Ep5DgRy3iFBq7?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400017)(376005)(35042699013)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 09:25:44.2216
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bea7074-8234-45b7-586e-08dc70d32b15
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10810

DQoNCj4gT24gMTAgTWF5IDIwMjQsIGF0IDEwOjE3LCBNaWNoYWwgT3J6ZWwgPG1pY2hhbC5vcnpl
bEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBPbiAyMy8wNC8yMDI0IDEw
OjI1LCBMdWNhIEZhbmNlbGx1IHdyb3RlOg0KPj4gDQo+PiANCj4+IFRoaXMgY29tbWl0IGltcGxl
bWVudHMgdGhlIGxvZ2ljIHRvIGhhdmUgdGhlIHN0YXRpYyBzaGFyZWQgbWVtb3J5IGJhbmtzDQo+
PiBmcm9tIHRoZSBYZW4gaGVhcCBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgaG9zdCBwaHlzaWNhbCBh
ZGRyZXNzIHBhc3NlZCBmcm9tDQo+PiB0aGUgdXNlci4NCj4+IA0KPj4gV2hlbiB0aGUgaG9zdCBw
aHlzaWNhbCBhZGRyZXNzIGlzIG5vdCBzdXBwbGllZCwgdGhlIHBoeXNpY2FsIG1lbW9yeSBpcw0K
Pj4gdGFrZW4gZnJvbSB0aGUgWGVuIGhlYXAgdXNpbmcgYWxsb2NhdGVfZG9taGVhcF9tZW1vcnks
IHRoZSBhbGxvY2F0aW9uDQo+PiBuZWVkcyB0byBvY2N1ciBhdCB0aGUgZmlyc3QgaGFuZGxlZCBE
VCBub2RlIGFuZCB0aGUgYWxsb2NhdGVkIGJhbmtzDQo+PiBuZWVkIHRvIGJlIHNhdmVkIHNvbWV3
aGVyZSwgc28gaW50cm9kdWNlIHRoZSAnc2htX2hlYXBfYmFua3MnIHN0YXRpYw0KPj4gZ2xvYmFs
IHZhcmlhYmxlIG9mIHR5cGUgJ3N0cnVjdCBtZW1pbmZvJyB0aGF0IHdpbGwgaG9sZCB0aGUgYmFu
a3MNCj4+IGFsbG9jYXRlZCBmcm9tIHRoZSBoZWFwLCBpdHMgZmllbGQgLnNobWVtX2V4dHJhIHdp
bGwgYmUgdXNlZCB0byBwb2ludA0KPj4gdG8gdGhlIGJvb3RpbmZvIHNoYXJlZCBtZW1vcnkgYmFu
a3MgLnNobWVtX2V4dHJhIHNwYWNlLCBzbyB0aGF0IHRoZXJlDQo+PiBpcyBub3QgZnVydGhlciBh
bGxvY2F0aW9uIG9mIG1lbW9yeSBhbmQgZXZlcnkgYmFuayBpbiBzaG1faGVhcF9iYW5rcw0KPj4g
Y2FuIGJlIHNhZmVseSBpZGVudGlmaWVkIGJ5IHRoZSBzaG1faWQgdG8gcmVjb25zdHJ1Y3QgaXRz
IHRyYWNlYWJpbGl0eQ0KPj4gYW5kIGlmIGl0IHdhcyBhbGxvY2F0ZWQgb3Igbm90Lg0KPj4gDQo+
PiBBIHNlYXJjaCBpbnRvICdzaG1faGVhcF9iYW5rcycgd2lsbCByZXZlYWwgaWYgdGhlIGJhbmtz
IHdlcmUgYWxsb2NhdGVkDQo+PiBvciBub3QsIGluIGNhc2UgdGhlIGhvc3QgYWRkcmVzcyBpcyBu
b3QgcGFzc2VkLCBhbmQgdGhlIGNhbGxiYWNrIGdpdmVuDQo+PiB0byBhbGxvY2F0ZV9kb21oZWFw
X21lbW9yeSB3aWxsIHN0b3JlIHRoZSBiYW5rcyBpbiB0aGUgc3RydWN0dXJlIGFuZA0KPj4gbWFw
IHRoZW0gdG8gdGhlIGN1cnJlbnQgZG9tYWluLCB0byBkbyB0aGF0LCBzb21lIGNoYW5nZXMgdG8N
Cj4+IGFjcXVpcmVfc2hhcmVkX21lbW9yeV9iYW5rIGFyZSBtYWRlIHRvIGxldCBpdCBkaWZmZXJl
bnRpYXRlIGlmIHRoZSBiYW5rDQo+PiBpcyBmcm9tIHRoZSBoZWFwIGFuZCBpZiBpdCBpcywgdGhl
biBhc3NpZ25fcGFnZXMgaXMgY2FsbGVkIGZvciBldmVyeQ0KPj4gYmFuay4NCj4+IA0KPj4gV2hl
biB0aGUgYmFuayBpcyBhbHJlYWR5IGFsbG9jYXRlZCwgZm9yIGV2ZXJ5IGJhbmsgYWxsb2NhdGVk
IHdpdGggdGhlDQo+PiBjb3JyZXNwb25kaW5nIHNobV9pZCwgaGFuZGxlX3NoYXJlZF9tZW1fYmFu
ayBpcyBjYWxsZWQgYW5kIHRoZSBtYXBwaW5nDQo+PiBhcmUgZG9uZS4NCj4+IA0KPj4gU2lnbmVk
LW9mZi1ieTogTHVjYSBGYW5jZWxsdSA8bHVjYS5mYW5jZWxsdUBhcm0uY29tPg0KPiANCj4gSSB0
ZXN0ZWQgdGhpcyBwYXRjaCBhbmQgaXQgcmVzdWx0ZWQgaW4gYXNzZXJ0aW9uOg0KPiBBc3NlcnRp
b24gJ3MgPD0gZScgZmFpbGVkIGF0IGNvbW1vbi9yYW5nZXNldC5jOjE4OQ0KPiANCj4gSSBjaGVj
a2VkIGFuZCBpbiBmaW5kX3VuYWxsb2NhdGVkX21lbW9yeSgpLCBnaXZlbiB0aGF0IHN0YXJ0IGlz
IH4wVUwgKGhvc3QgYWRkcmVzcyBub3QgcHJvdmlkZWQpLA0KPiBzdGFydCArIHNpemUgd291bGQg
b3ZlcmZsb3cuIERpZCB5b3UgdGVzdCB0aGlzIHBhdGNoPw0KDQpIaSBNaWNoYWwsDQoNCk1tbSBJ
4oCZbSB0ZXN0aW5nIHdpdGggYSBkb20wbGVzcyBzZXR1cCwgd2l0aG91dCBkb20wLCBJIHRoaW5r
IEkgbWlzc2VkIHRoYXQgcGFydCBiZWNhdXNlIG15IGd1ZXN0cyBkb2VzbuKAmXQgaGF2ZQ0KdGhl
IGh5cGVydmlzb3Igbm9kZSAoZW5oYW5jZWQpLCBzb3JyeSBhYm91dCB0aGF0LCBJ4oCZbGwgdGVz
dCB1c2luZyB5b3VyIHNldHVwLCBjYW4geW91IGNvbmZpcm0gd2hhdCBhcmUgeW91IHVzaW5nPw0K
DQoNCj4gDQo+IH5NaWNoYWwNCg0K

