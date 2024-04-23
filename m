Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF028AE653
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 14:38:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710568.1109839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFPY-0002i2-Hp; Tue, 23 Apr 2024 12:38:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710568.1109839; Tue, 23 Apr 2024 12:38:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzFPY-0002fl-DZ; Tue, 23 Apr 2024 12:38:12 +0000
Received: by outflank-mailman (input) for mailman id 710568;
 Tue, 23 Apr 2024 12:38:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=agql=L4=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1rzFPW-0002ff-Hv
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 12:38:10 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 570833b8-016e-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 14:38:09 +0200 (CEST)
Received: from AS9PR07CA0051.eurprd07.prod.outlook.com (2603:10a6:20b:46b::16)
 by AS8PR08MB8923.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 12:38:07 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:46b:cafe::66) by AS9PR07CA0051.outlook.office365.com
 (2603:10a6:20b:46b::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21 via Frontend
 Transport; Tue, 23 Apr 2024 12:38:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7519.19
 via Frontend Transport; Tue, 23 Apr 2024 12:38:06 +0000
Received: ("Tessian outbound e14047529286:v313");
 Tue, 23 Apr 2024 12:38:06 +0000
Received: from beba20dcb911.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3571D073-AEB5-4C4E-9532-F5A960681979.1; 
 Tue, 23 Apr 2024 12:38:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id beba20dcb911.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 23 Apr 2024 12:38:00 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by AS2PR08MB8901.eurprd08.prod.outlook.com (2603:10a6:20b:5f0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 12:37:58 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::7fb0:6621:56b:22d5%3]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 12:37:58 +0000
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
X-Inumbo-ID: 570833b8-016e-11ef-909a-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=M0LjQcVXY7mTI0y7BBCOiMMfqIIFWSMniZ0Ycvq9Z3sTVTGmAoPL2zxaiMjSVOjC1OjBOW2q0GcIYJJP6NCrVkv7SfEUk/JNB5N/VN6bgnEKKGqCWi1ewZhQloulZ7mMyoRqBHn4lhJvJJSV7ABwtbfcJi6twFHGDT3ZsJWhLNazY3omt7VVUT1rAL2BO527+IZprU5l119spZ0AFgsYL/6m+Awc4Gt3uUGVuUHAuoxHsuRfYf5bthVBcqR40PC0aV6mdReNckdaPE5eYYOATDGNmgzvHIixCnKc67+kfMEJ2fTP9RYYT28bRV4mAjKot9QMtgkUulAkecQdi8Bn1Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAwMBAufVAp8GbGYavvmsG/sfmZJOk70vZkYwTbKa/4=;
 b=ZhWi0dSOTM2X0IV2/bscBNE9XtYvA9TIo4tt+qj3kHv7YoY+Z/+MpgURt4zvnABGOkqLjzrGc4BvU97dVwPOdVgnuswLrWoqi5f33/1P8h6WMKEWnrQDyhHtlU4pxrDgTd2PlsXZDhEnfMl4v06LkQVaYSGTpTf3FEQgBOLFmVt+rVGtISJok66cG7I8MMQf9/iPUMMx3BtUbOEoAipe54haN8lKzlN7OVCrFf0gCeCx+1Xs4olYBrWycRp7yyTfXEnFi0Krp8+L2yisAbDRuHqolgwlsTiIR/A4jwBzAD36RrLDXcle/xvrPbgAbFP+o+z+GMIzHpqgVD9Feoa3rQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAwMBAufVAp8GbGYavvmsG/sfmZJOk70vZkYwTbKa/4=;
 b=XSRg09RR1rj2TZoRqT/y6gq0okcYGxe9Sc2hiCFmw+FEsAtJNn88hrzupDoGGyPfYx4jsULWNr9Qh9cjrJe8ohUEu74BL3eKmyT0O8g7T7+GfSGNtgzJDy/TXvXp1f8q4DzkeNO8BnJNPrpYUhVZYEFRrvjD3hwgnIPBEg42uL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e8965c63a4969327
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEEF/P7oWAsjRNk9H4Uo8vzh44Xu/DcT1AFVtiEvJx+n1x7giS/+euo6CxD6ytcFU+5q6GzcZJ3Rggh1IHkzgVyVYIRQ9I5hrsebg704r+aF4AOPzUsra6vI+zMA/rjfyoiGAQfmXuY6Jwi2zw3PInq34qm90BimDjXjbwoAqoT1Hfhvq05CJ2Q+KGJ16X8HFSHpjq7qHbCeQZL72k4tBAK1OMtoTCZfZ6kVlHJRXjU462QV5xXyj3sFpdxXUQD8sSBDlsc9NWqbD9d6jw/Gtn8i5vOwstqxfjrgamzCIlunQLuKI9Srk+on2nIXUDKD4Rru2hmjN0Zq/GT66T8G0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAwMBAufVAp8GbGYavvmsG/sfmZJOk70vZkYwTbKa/4=;
 b=KpUhfUu2Rg33hHmcr/U80nSP5HC+oUVe7imJ58KOVq+hIUwf4pvxr7l2RdZsP4VZIiXgl5QwvptN3NcZR6qnMdS5MnihaxeRD2VB/ZuNbjLjsbreLYwPQIEL6YeogJvHrvWHbO600FwV9fT/qrQHw6tEs7E5ZaTso3i57XgOtdcld/JroMgqFmP5yiIH9MaSVqlo2piVkmeM/oxTMcBji1ZZ7cL7grv2jFtJZmGF/NGNFwntT8CuE1zNrQD+/J96N+gzawf4BlcG9MyZURUEKlwLAtBea9UlVWYjzuIgXPqNr156PY2YOt4W6JigwKsYp3R6Nr1jXEDjpaiaJxOiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAwMBAufVAp8GbGYavvmsG/sfmZJOk70vZkYwTbKa/4=;
 b=XSRg09RR1rj2TZoRqT/y6gq0okcYGxe9Sc2hiCFmw+FEsAtJNn88hrzupDoGGyPfYx4jsULWNr9Qh9cjrJe8ohUEu74BL3eKmyT0O8g7T7+GfSGNtgzJDy/TXvXp1f8q4DzkeNO8BnJNPrpYUhVZYEFRrvjD3hwgnIPBEg42uL8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Topic: [XEN PATCH v2 4/5] xen/arm: allow dynamically assigned SGI
 handlers
Thread-Index: AQHalIf6ydPM1y7+406Z1t07uZV5tLF0HrOAgAF7f4CAABj+AIAAGdeA
Date: Tue, 23 Apr 2024 12:37:58 +0000
Message-ID: <756FEA03-7F16-48AE-8308-059EBF8638A0@arm.com>
References: <20240422073708.3663529-1-jens.wiklander@linaro.org>
 <20240422073708.3663529-5-jens.wiklander@linaro.org>
 <89d268cc-bc49-4e22-b4e9-2e8dbe73124c@xen.org>
 <CAHUa44GAbBtczbVohVjC=66tqzjgeGLx44k9ddodDJL13KwVEQ@mail.gmail.com>
 <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org>
In-Reply-To: <205a95f2-fdf6-4f38-b2e0-31e4fff9348b@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.500.171.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|AS2PR08MB8901:EE_|AM4PEPF00027A64:EE_|AS8PR08MB8923:EE_
X-MS-Office365-Filtering-Correlation-Id: 49a301af-8712-42ea-f917-08dc639239dd
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?c0s0anE5eFJIZmRSY0d3TXcvQ1lMd3JvQStwamdZTllDOFI0cjVMbzY1NzBY?=
 =?utf-8?B?ZldpR1IvUStjdm5aMjhMSEFkZ1c0ZmpON2NDVWxNeDY5MWZjS0k3VTlmbVh2?=
 =?utf-8?B?TTJtQXExS09ab0twVmZRNkpzdGo0QVU0UzNkQ3BMSkJEY2NQTDNhOXNSc1dr?=
 =?utf-8?B?dFJrbkN4NjVXeXZ0M0o2WmdXMjAzcE5Ob1BXd0tJVTVzWHhsOXBqU0F5RVB6?=
 =?utf-8?B?TFBqNWRtOS9ySjR0TGhSOVVpZVcveUZBOG1Qa3drV2VjMDNPSHdBbmFpdzE0?=
 =?utf-8?B?NW1CZFFId09tVkV4bFVXcVhpTCtSbnh4cFFOYVVEWmN1b2djL0NIWXlhcStI?=
 =?utf-8?B?VkxiVDExb1NqMGxycmlPblM2ZlJmZFhXRjROZkFPUlBDV3RtbWN6azUvd25U?=
 =?utf-8?B?WGZjUldpbm1BS3o5UWVwbVBzMHB0emd3LzhUZGhKcXk0a3hRczhUKzg3djlH?=
 =?utf-8?B?ZHJnQk1MTEZFTURXN1N6cHpZV3RacUd5LzVoUE5LUHFoVEhqOEs1d1l3bnAy?=
 =?utf-8?B?WDNsWlUvRmNpTUN0VHdjT1JqdFhKSUVpQ3JQVVdKTjlFdVdSN0F3bW01dXdE?=
 =?utf-8?B?Q3I5VzYvTmV2SG04MmZlaUdaZFpJS0F6azdqVGloa1ZRa0htK1dONnA0WVhw?=
 =?utf-8?B?QS9JVFBON1V1R3JaK1BESzBrbDU0dVVQb0hhUXo2R1Joa2FBdHI5QXVMQWlZ?=
 =?utf-8?B?MDQwc1ZBZ2Zkbk9Ia0xEZi85MGtKUk1JcXVJb1ErV0RyUEs1NVFHNTZHZE5Z?=
 =?utf-8?B?NSt6TDZUaVczS290cXI1VGhDQ2F4V0c4N0x0VnNBYWZFTnFnLzAycXZJb1po?=
 =?utf-8?B?SEljS3Z6R21aRWVJVnJQdEVQUEYzNmtzajJKa1JNaW05Wk5YZ3Bwc0FSL0E1?=
 =?utf-8?B?Y2tpL2p5eGc1NGxOUnJHSGNJa3h2Z1gyVlo0NnFPMjc3M293L0wxRzIzR3lu?=
 =?utf-8?B?a2wwSmtmUWFLdDhXU01wNjd6cFdvZFIrOEZCekc5aWg4QU5PZkZSbDZwZElp?=
 =?utf-8?B?UTBYbWZjaENzSlVMMUt2TmZRV3RtR2RZN3JFK0VjSDhpM3V3V1FPS1NWeWZO?=
 =?utf-8?B?UkhLU0FDY2REOXVaN3luTm9MbDRRamkveTBENVRaTy9icmpwaWMzQVJpOXBI?=
 =?utf-8?B?dXdjVW9aWE9mWGdrbXV2UHBXWlFKcitYY09ncVNUSXhzMFpXMlpJcU1xOE1C?=
 =?utf-8?B?UmtFSE53bDBlc0VVN24zblI1dlozOGdPWUpFdmJUSS82NjhtWkN3UjBZRVha?=
 =?utf-8?B?UlpCVldpMEJ1aGV2NkJqbi9HNjc1WUVNb3hsbkhMN3dFa2tYTTdKamY1TE1W?=
 =?utf-8?B?S1I2Tml2MnR1cFYwV3hsRnE2b1B2eng4ckpMTVNiQ2Q0dFRsS1dhT3BVWTND?=
 =?utf-8?B?dkwwcXRGeVZERThCRHNmSXozMkFXOC9IOEpRanJ1WjBVbzk5Z1ZBTHJiYitS?=
 =?utf-8?B?NVZWNFl5dDRsdVhJRzZETThzWnREOGNySm9CdENDL0NZSFQ1UXRPTUM1OG9J?=
 =?utf-8?B?STJiYlFZbms4Zk9oTVJJTW8vTjhKNUJCdTJpZFh1MEhFU1J0WWxVbXVFWlBQ?=
 =?utf-8?B?VTZidGhLZ01kM0k4WGowb0NSSWt4K0hSTWkwNVN6a2FjKytNalBXd3o4UVhX?=
 =?utf-8?B?dHFUaDJIQnhhampHSzkzUlIwMk9IMjhRdEIrWjdmaE1sVVdxWk0zeHI5RjRj?=
 =?utf-8?B?QzhVUGJrRk1WVWVQK0xsYXMxaFdnN0dkTHV4RmZWTmkzZ1ZBQ2NwdHlPOWhQ?=
 =?utf-8?B?dzBKK3gxdDFzT01QbWZ1aVp1T1pDb0tCTjhKSHM0eGVXaWtJRnE4bFJsd3JV?=
 =?utf-8?B?dFpDamNpZFFvN3RKbVV5dz09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DD897B554FAC1240A8F8A51A559B57CF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8901
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7055a40b-e71c-4b87-437a-08dc639234c1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkpvMkJWTkhpS3kveXdTVlM0QUxtVEREang0OWNFbHRQVmx6bnJudUtFYnpQ?=
 =?utf-8?B?QWt3c3pBVUg5YisrRFFtQURGZE1PZUR1N0liaENGRmJ6TUlCYWFqV1V0bGRQ?=
 =?utf-8?B?MHd2RGIwRjJnZElvKzd5cFVEV0VYVWtRWWNqZzlncWFhbUVrOVhleFhJNlBo?=
 =?utf-8?B?ZFpNS1VuOC96YmMzUW9KNm1yTE5mU0lpZ0hBMTRwd0hkZlVwOTZhcGZVdnY4?=
 =?utf-8?B?TmlyZURDajZVMk9HcXNOa2xUak0wUTF4YS9xem16MGh5Z3ZvVE03bmREZWtF?=
 =?utf-8?B?YnBiZllIYWNYclBDc0JjajhEUkJXK0VlaDgzNE10REVDa2NiVXhzOGlJT3lZ?=
 =?utf-8?B?M085NEl0TEVXcm92WEIvbEF2ZVZ1MUI0WWlYSyswenNJbitDQktTS1RROVRN?=
 =?utf-8?B?NjJIc2E4dnc4S1B1cm1iMi9qQmNVUTB0VlBpWUZxSVB1SlBZUzh4OGdwVmhn?=
 =?utf-8?B?WjVDTkZkaytKK1pZd0tyUGdxbUxxWlJwbjM0TEhTMms2cW9ObXcybEZhSWJw?=
 =?utf-8?B?V0dFMzIzSnMrTmVNcjNBbGZRd28zSGxYSXhBVTFpNEI2YnJVWmdSeHViNUIr?=
 =?utf-8?B?WjlQTWY2dXdiNnlCSFIvRDJJc0V6amlNSXBPOEVyWXdQQkhSMVQybk5OU0d5?=
 =?utf-8?B?akp1bmpOT3psYk44MkRJUjdWWUkzNDFKbVd0ZTJVbHZxRDZJSklzU3Q4OHd0?=
 =?utf-8?B?cXA5TWdYSERlYko1QTFnNzltUXdjbk1aYkJQc2E3WHR2SFZKUUpJdHE5LzFI?=
 =?utf-8?B?MEM2OGZpMTBDcnhOaSt5RFhWenpyUXkyTUgrZEFTY2d3ZFFHaU10M1dtd09Q?=
 =?utf-8?B?ZzdKUmF2NHlQNUFlUkJzRGZidlJXTS9LN3F3bGJ1STh3empmTUNvSXFXVUQ0?=
 =?utf-8?B?RE1hQnRiVmtZRFd3YjFSNkdXY3ZpSlNTZ0N0TGY5d3JTREowOVhqcEZaNWZa?=
 =?utf-8?B?L3hTSEJzUC9sTG5PWm9yNFJoanJvaDR3Tnl1Uk4wOVI0SmRkcExxL3dzN2hT?=
 =?utf-8?B?YS95QndIa3RRZGxuY2p2MUJRQkxrRG5RbmsrdEM5M0JaWkxXamtJZE1SQUs0?=
 =?utf-8?B?eDlmQ1kyeVlhN1hZVDhrVDQyTjl4d0ZvREhHREZXM1UwemNYSzA3MDlTZm5N?=
 =?utf-8?B?US93UzhYVzVjaVNnYnhoMXhqL2M3UFVYRXJsZEhzNmpCb01NRXpmRFExT24x?=
 =?utf-8?B?YUN3ZGhwbnkxclNGcWR4RXpnZmRrT2Nna1V3YVhjYTlFZS9OaVVXM1NPVHRR?=
 =?utf-8?B?aEdPRlJzUFJYcGxkRjNVRmdEenhpZjJPbHRLVXh2VTJnTDlzTU8xOEx0UkJH?=
 =?utf-8?B?OGp3R2luQzZmeWY0K2tZVElZYmZoci9aTHBObWs4ZE5KM1FMbVQ1M294SXgy?=
 =?utf-8?B?bC83QlViRjhUaDdod0xCRjhXeUhXYXlqRWVXcVNmQ3ZpdzNsSlRxYVVlb2I3?=
 =?utf-8?B?SDgwZVB6bzV4NjM0U1d3N1h2eG9ySHhJUHh6aTN5b21FWFA1ckNQcTE4QjRX?=
 =?utf-8?B?em1EUmFlRDZ3a3VPQzRXeVoyYk0raXR0NUJGMm90N0VobmNEV1NtWGlic2l6?=
 =?utf-8?B?NFlBWHJsMTFhS0pUQUJPaUlHK1dRRzc5SXVhUDJFMWFLS2VxSTFxR21YZm91?=
 =?utf-8?B?SG0xb2N4Q3dEeUZOS1l0UW9CYjRncXFYenlzU043TllRQWtKQThXeUQ4bDZR?=
 =?utf-8?B?ZUxpRXlpQStBSnpOZWtCT05XU2V1eVRYSzdCdFdYa3pwN1Q1ZWdaZHRoVkxO?=
 =?utf-8?B?YnF0aG12Q00wMkU5U0lZdmMySzZRdE45S1V2UFF0QXpSR0hjWUpnT3VXUGdq?=
 =?utf-8?B?SkxtMkJabSt1SWtaNkNZbzZXdTJ1RnNGSXhtOHRaeEdFdXpSaUtHbHJkM21z?=
 =?utf-8?Q?ZG8YRzVVWGUPF?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 12:38:06.6366
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a301af-8712-42ea-f917-08dc639239dd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8923

SGkgSnVsaWVuLA0KDQo+IE9uIDIzIEFwciAyMDI0LCBhdCAxMzowNSwgSnVsaWVuIEdyYWxsIDxq
dWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+IA0KPiANCj4gDQo+IE9uIDIzLzA0LzIwMjQgMTA6MzUs
IEplbnMgV2lrbGFuZGVyIHdyb3RlOg0KPj4gSGkgSnVsaWVuLA0KPiANCj4gSGkgSmVucywNCj4g
DQo+PiBPbiBNb24sIEFwciAyMiwgMjAyNCBhdCAxMjo1N+KAr1BNIEp1bGllbiBHcmFsbCA8anVs
aWVuQHhlbi5vcmc+IHdyb3RlOg0KPj4+IA0KPj4+IEhpIEplbnMsDQo+Pj4gDQo+Pj4gT24gMjIv
MDQvMjAyNCAwODozNywgSmVucyBXaWtsYW5kZXIgd3JvdGU6DQo+Pj4+IFVwZGF0ZXMgc28gcmVx
dWVzdF9pcnEoKSBjYW4gYmUgdXNlZCB3aXRoIGEgZHluYW1pY2FsbHkgYXNzaWduZWQgU0dJIGly
cQ0KPj4+PiBhcyBpbnB1dC4gVGhpcyBwcmVwYXJlcyBmb3IgYSBsYXRlciBwYXRjaCB3aGVyZSBh
biBGRi1BIHNjaGVkdWxlDQo+Pj4+IHJlY2VpdmVyIGludGVycnVwdCBoYW5kbGVyIGlzIGluc3Rh
bGxlZCBmb3IgYW4gU0dJIGdlbmVyYXRlZCBieSB0aGUNCj4+Pj4gc2VjdXJlIHdvcmxkLg0KPj4+
IA0KPj4+IEkgd291bGQgbGlrZSB0byB1bmRlcnN0YW5kIHRoZSB1c2UtY2FzZSBhIGJpdCBtb3Jl
LiBXaG8gaXMgcmVzcG9uc2libGUNCj4+PiB0byBkZWNpZGUgdGhlIFNHSSBudW1iZXI/IElzIGl0
IFhlbiBvciB0aGUgZmlybXdhcmU/DQo+Pj4gDQo+Pj4gSWYgdGhlIGxhdGVyLCBob3cgY2FuIHdl
IGV2ZXIgZ3VhcmFudGVlIHRoZSBJRCBpcyBub3QgZ29pbmcgdG8gY2xhc2gNCj4+PiB3aXRoIHdo
YXQgdGhlIE9TL2h5cGVydmlzb3IgaXMgdXNpbmc/IElzIGl0IGRlc2NyaWJlZCBpbiBhDQo+Pj4g
c3BlY2lmaWNhdGlvbj8gSWYgc28sIHBsZWFzZSBnaXZlIGEgcG9pbnRlci4NCj4+IFRoZSBmaXJt
d2FyZSBkZWNpZGVzIHRoZSBTR0kgbnVtYmVyLiBHaXZlbiB0aGF0IHRoZSBmaXJtd2FyZSBkb2Vz
bid0DQo+PiBrbm93IHdoaWNoIFNHSXMgWGVuIGlzIHVzaW5nIGl0IHR5cGljYWxseSBuZWVkcyB0
byBkb25hdGUgb25lIG9mIHRoZQ0KPj4gc2VjdXJlIFNHSXMsIGJ1dCB0aGF0IGlzIHRyYW5zcGFy
ZW50IHRvIFhlbi4NCj4gDQo+IFJpZ2h0IHRoaXMgaXMgbXkgY29uY2Vybi4gVGhlIGZpcm13YXJl
IGRlY2lkZXMgdGhlIG51bWJlciwgYnV0IGF0IHRoZSBzYW1lIHRpbWUgWGVuIHRoaW5rcyB0aGF0
IGFsbCB0aGUgU0dJcyBhcmUgYXZhaWxhYmxlIChBRkFJSyB0aGVyZSBpcyBvbmx5IG9uZSBzZXQp
Lg0KPiANCj4gV2hhdCBJIHdvdWxkIGxpa2UgdG8gc2VlIGlzIHNvbWUgd29yZGluZyBmcm9tIGEg
c3BlYyBpbmRpY2F0aW5nIHRoYXQgdGhlIFNHSXMgSUQgcmVzZXJ2ZWQgYnkgdGhlIGZpcm13YXJl
IHdpbGwgbm90IGJlIGNsYXNoaW5nIHdpdGggdGhlIG9uZSB1c2VkIGJ5IFhlbi4NCg0KVGhlIGlk
ZWEgaXMgdGhhdCB0aGUgb25seSBTR0kgcmVzZXJ2ZWQgZm9yIHNlY3VyZSBhcmUgdXNlZCBieSB0
aGUgc2VjdXJlIHdvcmxkIChpbiBmYWN0IGl0IGlzIHRoZSBTUE1DIGluIHRoZSBzZWN1cmUgd29y
bGQgd2hvIHRlbGxzIHVzIHdoaWNoIFNHSSBpdCB3aWxsIGdlbmVyYXRlKS4NClNvIGluIHRoZW9y
eSB0aGF0IG1lYW5zIGl0IHdpbGwgYWx3YXlzIHVzZSBhbiBTR0kgYmV0d2VlbiA4IGFuZCAxNS4N
Cg0KTm93IGl0IGNvdWxkIG1ha2Ugc2Vuc2UgaW4gZmFjdCB0byBjaGVjayB0aGF0IHRoZSBudW1i
ZXIgcmV0dXJuZWQgYnkgdGhlIGZpcm13YXJlIChvciBTUE1DKSBpcyBub3QgY2xhc2hpbmcgd2l0
aCBYZW4gYXMgaXQgaXMgYSByZWNvbW1lbmRhdGlvbiBpbiB0aGUgc3BlYyBhbmQNCmluIGZhY3Qg
YW4gaW1wbGVtZW50YXRpb24gbWlnaHQgZG8gc29tZXRoaW5nIGRpZmZlcmVudC4NCg0KUmlnaHQg
bm93IHRoZXJlIGlzIG5vIHNwZWMgdGhhdCB3aWxsIHNheSB0aGF0IGl0IHdpbGwgbmV2ZXIgY2xh
c2ggd2l0aCB0aGUgb25lIHVzZWQgYnkgWGVuIGFzIHRoZSBGRi1BIHNwZWMgaXMgbm90IGVuZm9y
Y2luZyBhbnl0aGluZyBoZXJlIHNvIGl0IHdvdWxkIGJlIGEgZ29vZCBpZGVhDQp0byBjaGVjayBh
bmQgZGlzYWJsZSBGRi1BIHdpdGggYSBwcm9wZXIgZXJyb3IgbWVzc2FnZSBpZiB0aGlzIGhhcHBl
bnMuDQoNCkNoZWVycw0KQmVydHJhbmQNCg0KPiANCj4+PiANCj4+Pj4gDQo+Pj4+IGdpY19yb3V0
ZV9pcnFfdG9feGVuKCkgZG9uJ3QgZ2ljX3NldF9pcnFfdHlwZSgpIGZvciBTR0lzIHNpbmNlIHRo
ZXkgYXJlDQo+Pj4+IGFsd2F5cyBlZGdlIHRyaWdnZXJlZC4NCj4+Pj4gDQo+Pj4+IGdpY19pbnRl
cnJ1cHQoKSBpcyB1cGRhdGVkIHRvIHJvdXRlIHRoZSBkeW5hbWljYWxseSBhc3NpZ25lZCBTR0lz
IHRvDQo+Pj4+IGRvX0lSUSgpIGluc3RlYWQgb2YgZG9fc2dpKCkuIFRoZSBsYXR0ZXIgc3RpbGwg
aGFuZGxlcyB0aGUgc3RhdGljYWxseQ0KPj4+PiBhc3NpZ25lZCBTR0kgaGFuZGxlcnMgbGlrZSBm
b3IgaW5zdGFuY2UgR0lDX1NHSV9DQUxMX0ZVTkNUSU9OLg0KPj4+PiANCj4+Pj4gU2lnbmVkLW9m
Zi1ieTogSmVucyBXaWtsYW5kZXIgPGplbnMud2lrbGFuZGVyQGxpbmFyby5vcmc+DQo+Pj4+IC0t
LQ0KPj4+PiB2MS0+djINCj4+Pj4gLSBVcGRhdGUgcGF0Y2ggZGVzY3JpcHRpb24gYXMgcmVxdWVz
dGVkDQo+Pj4+IC0tLQ0KPj4+PiAgIHhlbi9hcmNoL2FybS9naWMuYyB8IDUgKysrLS0NCj4+Pj4g
ICB4ZW4vYXJjaC9hcm0vaXJxLmMgfCA3ICsrKysrLS0NCj4+PiANCj4+PiBJIGFtIG5vdCBzdXJl
IHdoZXJlIHRvIHdyaXRlIHRoZSBjb21tZW50LiBCdXQgSSB0aGluayB0aGUgY29tbWVudCBvbiB0
b3ANCj4+PiBvZiBpcnFfc2V0X2FmZmluaXR5KCkgaW4gc2V0dXBfaXJxKCkgc2hvdWxkIGFsc28g
YmUgdXBkYXRlZC4NCj4+PiANCj4+Pj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4+Pj4gDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
Z2ljLmMgYi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+Pj4gaW5kZXggNDRjNDBlODZkZWZlLi5lOWFl
YjcxMzg0NTUgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9naWMuYw0KPj4+PiArKysg
Yi94ZW4vYXJjaC9hcm0vZ2ljLmMNCj4+Pj4gQEAgLTExNyw3ICsxMTcsOCBAQCB2b2lkIGdpY19y
b3V0ZV9pcnFfdG9feGVuKHN0cnVjdCBpcnFfZGVzYyAqZGVzYywgdW5zaWduZWQgaW50IHByaW9y
aXR5KQ0KPj4+PiANCj4+Pj4gICAgICAgZGVzYy0+aGFuZGxlciA9IGdpY19od19vcHMtPmdpY19o
b3N0X2lycV90eXBlOw0KPj4+PiANCj4+Pj4gLSAgICBnaWNfc2V0X2lycV90eXBlKGRlc2MsIGRl
c2MtPmFyY2gudHlwZSk7DQo+Pj4+ICsgICAgaWYgKCBkZXNjLT5pcnEgPj0gTlJfR0lDX1NHSSkN
Cj4+Pj4gKyAgICAgICAgZ2ljX3NldF9pcnFfdHlwZShkZXNjLCBkZXNjLT5hcmNoLnR5cGUpOw0K
Pj4+IA0KPj4+IFNvIGFib3ZlLCB5b3Ugc2F5IHRoYXQgdGhlIFNHSXMgYXJlIGFsd2F5cyBlZGdl
LXRyaWdnZXJlZCBpbnRlcnJ1cHQuIFNvDQo+Pj4gSSBhc3N1bWUgZGVzYy0+YXJjaC50eXBlLiBT
byBhcmUgeW91IHNraXBwaW5nIHRoZSBjYWxsIGJlY2F1c2UgaXQgaXMNCj4+PiB1bm5lc3Nhcnkg
b3IgaXQgY291bGQgZG8gdGhlIHdyb25nIHRoaW5nPw0KPj4+IA0KPj4+IElkZWFsbHksIHRoZSBv
dXRjb21lIG9mIHRoZSBhbnN3ZXIgYmUgcGFydCBvZiB0aGUgY29tbWVudCBvbiB0b3Agb2YgdGhl
DQo+Pj4gY2hlY2suDQo+PiBnaWNfc2V0X2lycV90eXBlKCkgaGFzIGFuIGFzc2VydCAiQVNTRVJU
KHR5cGUgIT0gSVJRX1RZUEVfSU5WQUxJRCkiDQo+PiB3aGljaCBpcyB0cmlnZ2VyZWQgd2l0aG91
dCB0aGlzIGNoZWNrLg0KPj4gU28gaXQncyBib3RoIHVubmVjZXNzYXJ5IGFuZCB3cm9uZy4gSSBz
dXBwb3NlIHdlIGNvdWxkIHVwZGF0ZSB0aGUNCj4+IGJvb2trZWVwaW5nIG9mIGFsbCBTR0lzIHRv
IGJlIGVkZ2UtdHJpZ2dlcmVkIGluc3RlYWQgb2YNCj4+IElSUV9UWVBFX0lOVkFMSUQuIEl0IHdv
dWxkIHN0aWxsIGJlIHVubmVjZXNzYXJ5IHRob3VnaC4gV2hhdCBkbyB5b3UNCj4+IHN1Z2dlc3Q/
DQo+IA0KPiBJIHdvdWxkIHJhdGhlciBwcmVmZXIgaWYgd2UgdXBkYXRlIHRoZSBib29rLWtlZXBp
bmcgZm9yIGFsbCB0aGUgU0dJcy4NCj4gDQo+IFsuLi5dDQo+IA0KPj4+IA0KPj4+PiAgICAgICAg
ICAgew0KPj4+PiAgICAgICAgICAgICAgIGlzYigpOw0KPj4+PiAgICAgICAgICAgICAgIGRvX0lS
UShyZWdzLCBpcnEsIGlzX2ZpcSk7DQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vaXJx
LmMgYi94ZW4vYXJjaC9hcm0vaXJxLmMNCj4+Pj4gaW5kZXggYmNjZTgwYTRkNjI0Li5mZGIyMTQ1
NjA5NzggMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS9pcnEuYw0KPj4+PiArKysgYi94
ZW4vYXJjaC9hcm0vaXJxLmMNCj4+Pj4gQEAgLTIyNCw5ICsyMjQsMTIgQEAgdm9pZCBkb19JUlEo
c3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MsIHVuc2lnbmVkIGludCBpcnEsIGludCBpc19maXEp
DQo+Pj4+IA0KPj4+PiAgICAgICBwZXJmY19pbmNyKGlycXMpOw0KPj4+PiANCj4+Pj4gLSAgICBB
U1NFUlQoaXJxID49IDE2KTsgLyogU0dJcyBkbyBub3QgY29tZSBkb3duIHRoaXMgcGF0aCAqLw0K
Pj4+PiArICAgIC8qIFN0YXRpY2FsbHkgYXNzaWduZWQgU0dJcyBkbyBub3QgY29tZSBkb3duIHRo
aXMgcGF0aCAqLw0KPj4+PiArICAgIEFTU0VSVChpcnEgPj0gR0lDX1NHSV9NQVgpOw0KPj4+IA0K
Pj4+IA0KPj4+IFdpdGggdGhpcyBjaGFuZ2UsIEkgdGhpbmsgdGhlIHBhdGggd2l0aCB2Z2ljX2lu
amVjdF9pcnEoKSBub3cgbmVlZHMgdG8NCj4+PiBnYWluIGFuIEFTU0VSVChpcnEgPj0gTlJfR0lD
X1NHSSkgYmVjYXVzZSB0aGUgcGF0aCBpcyBub3Qgc3VwcG9zZWQgdG8gYmUNCj4+PiB0YWtlbiBm
b3IgU0dJcy4NCj4+IEknbSBzb3JyeSwgSSBkb24ndCBzZWUgdGhlIGNvbm5lY3Rpb24uIElmIEkg
YWRkDQo+PiBBU1NFUlQodmlycSA+PSBOUl9HSUNfU0dJKTsNCj4+IGF0IHRoZSB0b3Agb2Ygdmdp
Y19pbmplY3RfaXJxKCkgaXQgd2lsbCBwYW5pYyB3aGVuIGluamVjdGluZyBhDQo+PiBTY2hlZHVs
ZSBSZWNlaXZlciBvciBOb3RpZmljYXRpb24gUGVuZGluZyBJbnRlcnJ1cHQgZm9yIGEgZ3Vlc3Qu
DQo+IA0KPiBJZiB5b3UgbG9vayBhdCBkb19JUlEoKSwgd2UgaGF2ZSB0aGUgZm9sbG93aW5nIGNv
ZGU6DQo+IA0KPiAgICBpZiAoIHRlc3RfYml0KF9JUlFfR1VFU1QsICZkZXNjLT5zdGF0dXMpICkN
Cj4gICAgew0KPiAgICAgICAgc3RydWN0IGlycV9ndWVzdCAqaW5mbyA9IGlycV9nZXRfZ3Vlc3Rf
aW5mbyhkZXNjKTsNCj4gDQo+ICAgICAgICBwZXJmY19pbmNyKGd1ZXN0X2lycXMpOw0KPiAgICAg
ICAgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2MpOw0KPiANCj4gICAgICAgIHNldF9iaXQoX0lSUV9J
TlBST0dSRVNTLCAmZGVzYy0+c3RhdHVzKTsNCj4gDQo+ICAgICAgICAvKg0KPiAgICAgICAgICog
VGhlIGlycSBjYW5ub3QgYmUgYSBQUEksIHdlIG9ubHkgc3VwcG9ydCBkZWxpdmVyeSBvZiBTUElz
IHRvDQo+ICAgICAgICAgKiBndWVzdHMuDQo+ICAgICAgICAgKi8NCj4gICAgICAgIHZnaWNfaW5q
ZWN0X2lycShpbmZvLT5kLCBOVUxMLCBpbmZvLT52aXJxLCB0cnVlKTsNCj4gICAgICAgIGdvdG8g
b3V0X25vX2VuZDsNCj4gICAgfQ0KPiANCj4gV2hhdCBJIHN1Z2dlc3RpbmcgaXMgdG8gYWRkIGFu
IEFTU0VSVChpcnEgPj0gTlJfR0lDX1NHSSkganVzdCBiZWZvcmUgdGhlIGNhbGwgYmVjYXVzZSBu
b3cgZG9fSVJRKCkgY2FuIGJlIGNhbGxlZCB3aXRoIFNHSXMgeWV0IHdlIGRvbid0IGFsbG93IEhX
IFNHSXMgdG8gYXNzaWduZWQgdG8gYSBndWVzdC4NCj4gDQo+IENoZWVycywNCj4gDQo+IC0tIA0K
PiBKdWxpZW4gR3JhbGwNCg0KDQo=

