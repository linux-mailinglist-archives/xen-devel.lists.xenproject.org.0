Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 219A39AEA53
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 17:23:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825436.1239669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zfg-0002ZR-DK; Thu, 24 Oct 2024 15:22:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825436.1239669; Thu, 24 Oct 2024 15:22:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3zfg-0002XS-AW; Thu, 24 Oct 2024 15:22:44 +0000
Received: by outflank-mailman (input) for mailman id 825436;
 Thu, 24 Oct 2024 15:22:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sutq=RU=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t3zfe-0002XM-Si
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 15:22:43 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2062a.outbound.protection.outlook.com
 [2a01:111:f403:260c::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf323eb0-921b-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 17:22:41 +0200 (CEST)
Received: from AS9PR06CA0248.eurprd06.prod.outlook.com (2603:10a6:20b:45f::18)
 by DBBPR08MB6284.eurprd08.prod.outlook.com (2603:10a6:10:20e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 15:22:36 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:20b:45f:cafe::37) by AS9PR06CA0248.outlook.office365.com
 (2603:10a6:20b:45f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 15:22:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 15:22:36 +0000
Received: ("Tessian outbound 72f4d55e3d4f:v490");
 Thu, 24 Oct 2024 15:22:35 +0000
Received: from L582c1e044b54.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C565EE7D-2007-4B10-9B5F-BD2FADE2677B.1; 
 Thu, 24 Oct 2024 15:22:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L582c1e044b54.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 15:22:29 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB9393.eurprd08.prod.outlook.com (2603:10a6:10:420::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 15:22:27 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.8093.018; Thu, 24 Oct 2024
 15:22:26 +0000
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
X-Inumbo-ID: cf323eb0-921b-11ef-a0bf-8be0dac302b0
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=e7X/RkhcpgML1QrewMvgobY9ZmkO1WaRsoul3LsHC4DWr9ayZNzhB3GIS26AcLbrZols20Fcf6dhaswj21w9QbcEzhOUi3R3juEPduDYAuLUj0IACoHFgbKqOebN/JyWKGn2ohbXWapdddBRm8qD7oE+PcqP2m0ozODpk005kuUwEBtxFZdI/YZVi7O9l2T9BMfUfX6KTU/6hVm067ijVMKEg/OJHo8p+Ab5BO1xhCb7QhDWiQiHh1BoBQ5oV6aYigEQ4og/Mit7TBpbQLqQawoRmjPw5dmdtzO6U+NCvwkiSMbp6fDEXMhR62x6wSegg9SzQ76CBXvyW4wK/1NzdA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbn9Z4iPvJ/timuYHBf+wC4GNiL5vMGGNDjITu5TMn0=;
 b=FBJGnaOnHA8X2iRNrxbenWDNn6cjowOfxPLkWxXuBjaWGitkX1yqV/B6ydmm5I/QDtnyexKjXwJ1jabpZcGcnP2T+kJOFdudVgyZDkcPwvj7nWr872sSGRmAtdFa2fYJ0HNHR0H4WZQQWomWxJzIptTNtHVhxM8e0E9LvwoWsF4WAVJlnXsOxnB49E+os32EsUuzi0CVgKliDv1wUjcgmjKaNDRSIO9T3zjSUwlJQwECS9DhBXzVzQhw6fyLFbvJ2OX3IXZXr3rgza4iZBD+eYqZHj1MUHCbP35Ss6x+S76x8ewrAXP8RD8nphGNDKeKl30MZkxIp4e243tFbdKqNA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbn9Z4iPvJ/timuYHBf+wC4GNiL5vMGGNDjITu5TMn0=;
 b=aEXGHbZx2VyXrMFmJ3S7cE88OnNFvemPREEmvWzHnJMls6bAyq7Om+15BQ52YN6jjjd6G7XsHChN4L4a50uWWwawrOaW3iQGpizMY7aypBcq57tWKzawMq+vGiOHPyfNCFBBdAergIGcN/ovRZ12YMzbZW5nHCMtFWU57PlAraQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: d0afff34ad2e0a08
X-TessianGatewayMetadata: PlQMfI/zZJPGOGjD5ZFq6RhoJP1fQ70LIvYBkx/OW5cZxl4CrmzA985NHIIJt98j2+asmttpfT3Nmy4HXYQQouJkx50rXJ1PQnmYAeixg18brKTQH6ybBx3ycNDcD1lXn06Fl+65qAWLPg/1hlS0FGJYQZGmvOSaywhw3MdX+ms=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3tlak3ti3RKCGfhJwE7f2t1qUrE4SG032W8s/dAB0PdAHr7pyn1fboe7UEcdlQcV+JP6rXLbp+wT0JTTkRCZoMLCv5vEyaj3UKCaOuoe0EEcg7MaBSMeCV894LDkcvUvli8VEL9m+BHVQPMvVkBmjLrePbrJZmy8ATMLJ3Mg5XBKFoyGBrojWVMoEX33HKQhYhw453XRcrVa6CvRDBaVyVionZFauP2QhVhZ5il9E5IjvESM7/+FqX9Q/KkrDeyGr7qgG+RmjxvGTaEZ4B9FheEjx5X16HA4SAQ+ba1WKbgdCaxSuD7xmTTGBIpJFyzxGXaaD0YtenvzzDFv5KlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hbn9Z4iPvJ/timuYHBf+wC4GNiL5vMGGNDjITu5TMn0=;
 b=GX56Yrn/GY4HmkqU8e1E/KUCK70iSo3wCiWCLiCVVSKNEdKur1Q9XfF1NQPwItmfoNBv0bW76Bco3z6ng0lPt87wjvUoJvM3CH3nzqGHjVODjFIlvBlNQjEIbVvcZhuoB+hvfnHJycCPo7KyfhxPA+eOrw/aXjRSWSqOAu3hk8t+LGK9LUo04HoL/UIW2Gjzx6eE9wM0fbdJ0sAWmxqLtCZwejuDoa9Z/0ETK/2W+7M7MInojdhHIZXHMO5FypT17YWNEOSeFQrUKbbCo9GuxSO1tb4El3iCgMo85tZkvGYskyxURTYG3X3lenq4wloTgGAA7ySoTAYJICjBzgkbVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hbn9Z4iPvJ/timuYHBf+wC4GNiL5vMGGNDjITu5TMn0=;
 b=aEXGHbZx2VyXrMFmJ3S7cE88OnNFvemPREEmvWzHnJMls6bAyq7Om+15BQ52YN6jjjd6G7XsHChN4L4a50uWWwawrOaW3iQGpizMY7aypBcq57tWKzawMq+vGiOHPyfNCFBBdAergIGcN/ovRZ12YMzbZW5nHCMtFWU57PlAraQ=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
Thread-Topic: [PATCH v2 10/10] xen/arm: ffa: Add indirect message support
Thread-Index: AQHbH6X9IBo7HgFtxUejZCumPUt4kbKVpD+AgAAU4gCAAD0KAIAAG40A
Date: Thu, 24 Oct 2024 15:22:26 +0000
Message-ID: <F60CF149-0FDE-43A6-8000-D7C6125121B9@arm.com>
References: <cover.1729066788.git.bertrand.marquis@arm.com>
 <9464941b06e82763ebe79e3f2adb4ca2497cf298.1729066788.git.bertrand.marquis@arm.com>
 <CAHUa44H+EipP-F_12tWidOxfFPf-jVcSs4XjLjBv5t05-Kw59g@mail.gmail.com>
 <5497A12A-B077-44B4-AB66-1D22D62681D0@arm.com>
 <CAHUa44Fca04p-L7K_OkZm2CVMFgWZxAmryOrU=GwwCHL+N4-3g@mail.gmail.com>
In-Reply-To:
 <CAHUa44Fca04p-L7K_OkZm2CVMFgWZxAmryOrU=GwwCHL+N4-3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB9393:EE_|AM2PEPF0001C708:EE_|DBBPR08MB6284:EE_
X-MS-Office365-Filtering-Correlation-Id: 32a7ae4d-dbd2-4c42-d04b-08dcf43fb0a0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|10070799003|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?d1kwMGZJUnlSVzhJcGo3emZKYTFWNmNWbjk5aGpVeWpLcnc0ZjVNT05FVGsr?=
 =?utf-8?B?Q3hoVS90Mkw1Nk4va0FDQnJ4cVVvTG0vMXNGUlJSRXVEMEV2QkZ0VUVacFNQ?=
 =?utf-8?B?cnZzOW9UcTJHdmNHMGcyWVFDTkNaa0lyR0xNM08veEgyNjYvYkZhK0dxWW1M?=
 =?utf-8?B?MWFjS0FwbmJzNTA3Zkp0OG52R2FaZ3BhWXZnRGg3QXl5bHRTVUFTZnplb0Nk?=
 =?utf-8?B?STU0N0ZFdERUVHZQQjJFUUwrMi9EUERBY0JielE2UXdrQ20xVFFIYlRJZmJk?=
 =?utf-8?B?Ny9JcjBhbTJ0S3A2NTJEdEtsVGN4OFQrckZLeHRScHdURnhjZzFKL00xYWFX?=
 =?utf-8?B?cjFmbkVUU3BOczBTTnVZaGM3QXk5T2VOWi8yWEx2a0hjWFd1VmRoeXNoUXNV?=
 =?utf-8?B?RUJyYTY4KzVJT04xZDRsWnFsYUxwOWRDVUw3bllrSC80QmptaXlHK0pzM2lF?=
 =?utf-8?B?bERZbW1kVDAwSWkwNlNWTnhjeUIyZUV6T1phVjNjK2NyYVZVdTBwYTRwVllv?=
 =?utf-8?B?SDhXZEFGK1h2K1l3T0ZIUkJUQmgxR2JPZ3NGVFVWOUQydkNoY0dsQXBhV01I?=
 =?utf-8?B?N0ovODdzQjVYbFBOSCtHZDNtNi9oTlhTaFJmYmZSbUp0TWo3MGF6ZTU3MDNH?=
 =?utf-8?B?MFVPd1FFVnBqZ3h3a1l1aitkQlRCNDFOWTYvOWZybkl6RkxEOC82MlhSZWZV?=
 =?utf-8?B?QzBnc2Nvc3lUZVhJaC9aL01ZVXJENC93S0dheDcrL3IxYzhCQkQ3WTAvQVYw?=
 =?utf-8?B?U0RBN2NrS1RHVk1EUVhxT1BYK1FqajczYVRCbGNaTC9Sa3YyK1ovK0NSY0tW?=
 =?utf-8?B?VkQzY2ZqemtCWmMwdFExNzdqR0N6TDF6WU1Kam5DeXVpRjZQM1Azc1BaMmRq?=
 =?utf-8?B?QnhYMGk3bEQ1SDgwRmVuZFFLQmFqOW9jei9Sdm8za0VrNGU4Ui9tdVkyVGpm?=
 =?utf-8?B?dk4yVzhvV3lIMDZKTFN2RmFKejJtOFZ4WFB0eGNmOHRUdmNFbDIrbDVrcHNU?=
 =?utf-8?B?MFo4UkhDWE5BQ3VFUUJuYllHd1lWNFV2NDZyTjVDT213c0NNdFhrRkMwQlRv?=
 =?utf-8?B?clNpanY4YTZ3eHZERVpKMC9mMFpRaGIrb2hLem9NS1hYcmp5Z0pBeTdJN3oz?=
 =?utf-8?B?b3ZMT29wWXFuWUx6aWhhZnI4Y09XaFNnZU5lS1RTcTJ4WmFTbXJvZUMremVK?=
 =?utf-8?B?RzlqSHlTVVMxa0FwWUtITy9aTDQwZ2xvM0JMeElvUjQ2NHc2WUg3b1RVRmkv?=
 =?utf-8?B?UDA4aFRpZHlnWUtpUGowdnpkM20xcmtycFQ3VWJyODV1TkhQNU0rU0RMMHc5?=
 =?utf-8?B?TC9aWHZxVERjOVBENXJmOEE2QWpvTEp0OEVJRE5PSUhhUzdUS3IrNXZMYU16?=
 =?utf-8?B?RHV0MThqZVFlaUoxekhocSt0QTE4ZktHc3lGbmlENHlrK1NkNERYMjcxVm9t?=
 =?utf-8?B?YU1OYVBrK092U2ovd1NSY1E4T0dkZXc3ekNaRC9zRWQyN0UrTzJ3enhac2dy?=
 =?utf-8?B?amIvNm1nVHNsc2o0UlNTaXk4Tnp4VjZXYlpLMzJKcXVraW9CTXRyNDFSZ2g0?=
 =?utf-8?B?UVhHZU1LYU5EMkRhN3BNRWk1emtSdDVBb3lHRVhxV2x2S08reXdrd0laZllU?=
 =?utf-8?B?RkxRU2sza3M3ZDlCKy9yTnpUUUVjV3d1TjFGTWFML2FFVlBCM29LcnRkTmxy?=
 =?utf-8?B?a2VtTHRtZW1iRENWanNXYkNwTVJPUGdweTZ2bFB5YkhlandMQXM3b1F5Y3k0?=
 =?utf-8?B?bDcwK3BURGpER3N3VUNBTkVrQ014bzRQUHhYUDlNcFAvdG5BVVo5WVpLeHBD?=
 =?utf-8?Q?/rNiJ1oBIzuhpDEgobglu4xjAiYXIBylbvqis=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7D2EC639C296641956B2200CDD64D31@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9393
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e612781a-cb30-4a51-1352-08dcf43fab0b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDc4Z0hNVHdSa2hYaWxOUCthTDlnK09EK1dLMkttRUFoSjd5cUh3V2hiSTdo?=
 =?utf-8?B?Z1Z0cVd0Y1ZRZFp1aThXMDB4S1FvckpLZEZuUU1ia3dTTTNLT0lweE1GNUxt?=
 =?utf-8?B?TnA5cWtVSGhmWW9Pa2NBTHdCTThGcDNRTTIwV0F3WnhubTBOT1NyV3BnMmhS?=
 =?utf-8?B?OENnTmJCcmpUVi9KV0FtRjVCaVdIODdXL1pwc2lmaDR4VDBWRGdmNk9CTjBU?=
 =?utf-8?B?M2x5c1RLS3JOVnJpTFg4THMrK0JJWVhLWUkyS01CMWV0OFRpR29BV2QrNzFl?=
 =?utf-8?B?RFg5Z1ZhYVRUdm1UOFMzMFpmcTFMRnVnQ1pteVVaSlNiOXZCRDlSdlB4dTNM?=
 =?utf-8?B?Ykt6SUE0RTVRNWd0ZVJIN0hMakpBaWxObVRta3ExamprUkIxWjUxSEowQTcv?=
 =?utf-8?B?V1dmdmJFdWZQQkZ5U1M5Sy96SVJ5YUo2ZlFDZzdHeisvU3hoNUpia1V6ZnQy?=
 =?utf-8?B?S2FleDdZWnJ5SFA5RzVQb2EzSnpSRXdYOE1XRzJNUTFpVFo3ZWI5S0cybHo3?=
 =?utf-8?B?MDAvZ0lYbVpqSFV5NjFFZUFQbkNLWFZHL0JkeVgxcHdTVXR3cEdUbnVVNXRm?=
 =?utf-8?B?RUdnWTUwTHdKVk1ET1doYzRDajJpSXFacWJvVGNoYTFtMzN3QTNoYkFlc1VF?=
 =?utf-8?B?dFlWbWVxdmRIcFBDTzdEWXA3NG5JWGxiMkNDTmFSL2JBeTliT3NveDBhT3BN?=
 =?utf-8?B?MlUzTXh4WWJTRWlKQVpHdG1FUFJaSjd3dnBoUjBPSDdrT2t0RitpRzlGN21X?=
 =?utf-8?B?eTVrMU5FcVJXWmk1ZUEwdU5YU2NuNDZ5NE9SNWRBWFhYaVN3QlYwdkxSdlhH?=
 =?utf-8?B?QVk3TkZUWDQxSDFBWnI5SENJS2JSZ3M2OU5SeDB5azQ3bWpQR29pd3Z5Z0VX?=
 =?utf-8?B?WDUrYVNhZFdMT1FmdktFWk5yMjBrT1NWd21hZTdXcXdIZitWWFJjN2dMN2R1?=
 =?utf-8?B?N0FudkovWlozakVzQjNpVzRBeG9hR21BWjNGUW1MTzV1N01nYUk0OUkxOTUz?=
 =?utf-8?B?Y3NYM2FoOEdJTjlBU0J0OVNBbEdEZmtUbW5hZ01ZUlNmWGJsNlhkWk1IakRK?=
 =?utf-8?B?cHlWUU9qb2FaTHBVUDV0V1lwL2lZRXdqQmRUVWJrQnRCT3dPd0J4eXIvZnhN?=
 =?utf-8?B?RnFZQlBzSVhhclNkRTFWS1dSMDJ6WWlEMzhhSlBnSXZta0FsWExTR2FXTDJ6?=
 =?utf-8?B?cjZlREMzN0YxM2s3Vm42TThPZk1uVVRVN3dydGgyeVhXQUNMdCtyem1USnhq?=
 =?utf-8?B?UmpuV1BwWlp2TUc5RHE2TUwzWk94YmJjMkRQWVZpUGFtVndaZCtnMjlYbnQz?=
 =?utf-8?B?OG1aeTErWEFHRGx2YmhFL1JZR2x6bG01ZWdlUVlZYWJDUDhMbDc5NXRnMVEr?=
 =?utf-8?B?aURRNnB0SC8yUHJRaloybENUeXh1ZDAydXpjbGdWVHYvU1BNRHcvbUJUUUM3?=
 =?utf-8?B?SFZlck9jdGhiV1BWSGFtTFdvcmJyZHhKSmw4WnVNSGgrUTl2QTNqc2dRUVR5?=
 =?utf-8?B?bm16QlczaHBzaXdiOC9CdXZWVkZEN0lwUHB1VHRES1VXTnpZcVJMVVN6MFJr?=
 =?utf-8?B?blBpZ2xPOVJUVjFwZGJJNm5oNmdrL0l0NjVkM3VnRkVQa21ySE1kbEpEUXI3?=
 =?utf-8?B?bjlmbTJwUjZKVk5RZmNxTU1UWUZxeTRScXBNTTdidXdFOE9nVmREVnhtRXhs?=
 =?utf-8?B?UlZFajFmSm9yaGtmdUVhc3YzN1Z2aHhmSmlYZGM5eUNoelEybFhSOVc3bnFB?=
 =?utf-8?B?UStXQk1veXVkZTZab2l0M2tKTkFpSkJoaWZwMUQwN0xEbTFPb3dwN3Y2eTJX?=
 =?utf-8?B?ZUljNDhVNXBWRmdMWFd4TjA1QkZFbkVLSStpcTZxNUhJZmpsdUZJWExaNG5F?=
 =?utf-8?B?bythZmFEU3dQb2xrUlZicktaaGVDOGlZVENHUS9NV1hWb0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 15:22:36.2588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32a7ae4d-dbd2-4c42-d04b-08dcf43fb0a0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6284

SGkgSmVucywNCg0KPiBPbiAyNCBPY3QgMjAyNCwgYXQgMTU6NDMsIEplbnMgV2lrbGFuZGVyIDxq
ZW5zLndpa2xhbmRlckBsaW5hcm8ub3JnPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kLA0KPiAN
Cj4gT24gVGh1LCBPY3QgMjQsIDIwMjQgYXQgMTI6MDXigK9QTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+IHdyb3RlOg0KPj4gDQo+PiBIaSBKZW5zLA0KPj4g
DQo+Pj4gT24gMjQgT2N0IDIwMjQsIGF0IDEwOjUwLCBKZW5zIFdpa2xhbmRlciA8amVucy53aWts
YW5kZXJAbGluYXJvLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4gSGkgQmVydHJhbmQsDQo+Pj4gDQo+
Pj4gT24gV2VkLCBPY3QgMTYsIDIwMjQgYXQgMTA6MzLigK9BTSBCZXJ0cmFuZCBNYXJxdWlzDQo+
Pj4gPGJlcnRyYW5kLm1hcnF1aXNAYXJtLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBBZGQgc3Vw
cG9ydCBmb3IgRkZBX01TR19TRU5EMiB0byBzZW5kIGluZGlyZWN0IG1lc3NhZ2VzIGZyb20gYSBW
TSB0byBhDQo+Pj4+IHNlY3VyZSBwYXJ0aXRpb24uDQo+Pj4+IA0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJxdWlzQGFybS5jb20+DQo+Pj4+IC0tLQ0K
Pj4+PiBDaGFuZ2VzIGluIHYyOg0KPj4+PiAtIHJlYmFzZQ0KPj4+PiAtLS0NCj4+Pj4geGVuL2Fy
Y2gvYXJtL3RlZS9mZmEuYyAgICAgICAgIHwgIDUgKysrKw0KPj4+PiB4ZW4vYXJjaC9hcm0vdGVl
L2ZmYV9tc2cuYyAgICAgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+
Pj4+IHhlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaCB8ICAxICsNCj4+Pj4gMyBmaWxlcyBj
aGFuZ2VkLCA1NSBpbnNlcnRpb25zKCspDQo+Pj4+IA0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL3RlZS9mZmEuYyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhLmMNCj4+Pj4gaW5kZXggM2E5
NTI1YWE0NTk4Li4yMWQ0MWI0NTJkYzkgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS90
ZWUvZmZhLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL3RlZS9mZmEuYw0KPj4+PiBAQCAtMTAx
LDYgKzEwMSw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmZhX2Z3X2FiaSBmZmFfZndfYWJpX25l
ZWRlZFtdID0gew0KPj4+PiAgICBGV19BQkkoRkZBX01FTV9SRUNMQUlNKSwNCj4+Pj4gICAgRldf
QUJJKEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzMyKSwNCj4+Pj4gICAgRldfQUJJKEZGQV9NU0df
U0VORF9ESVJFQ1RfUkVRXzY0KSwNCj4+Pj4gKyAgICBGV19BQkkoRkZBX01TR19TRU5EMiksDQo+
Pj4+IH07DQo+Pj4+IA0KPj4+PiAvKg0KPj4+PiBAQCAtMTk1LDYgKzE5Niw3IEBAIHN0YXRpYyB2
b2lkIGhhbmRsZV9mZWF0dXJlcyhzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+Pj4gICAg
Y2FzZSBGRkFfUEFSVElUSU9OX0lORk9fR0VUOg0KPj4+PiAgICBjYXNlIEZGQV9NU0dfU0VORF9E
SVJFQ1RfUkVRXzMyOg0KPj4+PiAgICBjYXNlIEZGQV9NU0dfU0VORF9ESVJFQ1RfUkVRXzY0Og0K
Pj4+PiArICAgIGNhc2UgRkZBX01TR19TRU5EMjoNCj4+Pj4gICAgICAgIGZmYV9zZXRfcmVnc19z
dWNjZXNzKHJlZ3MsIDAsIDApOw0KPj4+PiAgICAgICAgYnJlYWs7DQo+Pj4+ICAgIGNhc2UgRkZB
X01FTV9TSEFSRV82NDoNCj4+Pj4gQEAgLTI3NSw2ICsyNzcsOSBAQCBzdGF0aWMgYm9vbCBmZmFf
aGFuZGxlX2NhbGwoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+ICAgIGNhc2UgRkZB
X01TR19TRU5EX0RJUkVDVF9SRVFfNjQ6DQo+Pj4+ICAgICAgICBmZmFfaGFuZGxlX21zZ19zZW5k
X2RpcmVjdF9yZXEocmVncywgZmlkKTsNCj4+Pj4gICAgICAgIHJldHVybiB0cnVlOw0KPj4+PiAr
ICAgIGNhc2UgRkZBX01TR19TRU5EMjoNCj4+Pj4gKyAgICAgICAgZSA9IGZmYV9oYW5kbGVfbXNn
X3NlbmQyKHJlZ3MpOw0KPj4+PiArICAgICAgICBicmVhazsNCj4+Pj4gICAgY2FzZSBGRkFfTUVN
X1NIQVJFXzMyOg0KPj4+PiAgICBjYXNlIEZGQV9NRU1fU0hBUkVfNjQ6DQo+Pj4+ICAgICAgICBm
ZmFfaGFuZGxlX21lbV9zaGFyZShyZWdzKTsNCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX21zZy5jIGIveGVuL2FyY2gvYXJtL3RlZS9mZmFfbXNnLmMNCj4+Pj4gaW5kZXgg
YWUyNjNlNTQ4OTBlLi4zMzVmMjQ2YmE2NTcgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2Fy
bS90ZWUvZmZhX21zZy5jDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX21zZy5jDQo+
Pj4+IEBAIC0xMiw2ICsxMiwxNSBAQA0KPj4+PiANCj4+Pj4gI2luY2x1ZGUgImZmYV9wcml2YXRl
LmgiDQo+Pj4+IA0KPj4+PiArLyogRW5jb2Rpbmcgb2YgcGFydGl0aW9uIG1lc3NhZ2UgaW4gUlgv
VFggYnVmZmVyICovDQo+Pj4+ICtzdHJ1Y3QgZmZhX3BhcnRfbXNnX3J4dHggew0KPj4+PiArICAg
IHVpbnQzMl90IGZsYWdzOw0KPj4+PiArICAgIHVpbnQzMl90IHJlc2VydmVkOw0KPj4+PiArICAg
IHVpbnQzMl90IG1zZ19vZmZzZXQ7DQo+Pj4+ICsgICAgdWludDMyX3Qgc2VuZF9yZWN2X2lkOw0K
Pj4+PiArICAgIHVpbnQzMl90IG1zZ19zaXplOw0KPj4+PiArfTsNCj4+Pj4gKw0KPj4+PiB2b2lk
IGZmYV9oYW5kbGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVn
cywgdWludDMyX3QgZmlkKQ0KPj4+PiB7DQo+Pj4+ICAgIHN0cnVjdCBhcm1fc21jY2NfMV8yX3Jl
Z3MgYXJnID0geyAuYTAgPSBmaWQsIH07DQo+Pj4+IEBAIC03OCwzICs4Nyw0MyBAQCBvdXQ6DQo+
Pj4+ICAgICAgICAgICAgICAgICByZXNwLmE0ICYgbWFzaywgcmVzcC5hNSAmIG1hc2ssIHJlc3Au
YTYgJiBtYXNrLA0KPj4+PiAgICAgICAgICAgICAgICAgcmVzcC5hNyAmIG1hc2spOw0KPj4+PiB9
DQo+Pj4+ICsNCj4+Pj4gK2ludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2VuZDIoc3RydWN0IGNwdV91
c2VyX3JlZ3MgKnJlZ3MpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc3RydWN0IGRvbWFpbiAqc3JjX2Qg
PSBjdXJyZW50LT5kb21haW47DQo+Pj4+ICsgICAgc3RydWN0IGZmYV9jdHggKnNyY19jdHggPSBz
cmNfZC0+YXJjaC50ZWU7DQo+Pj4+ICsgICAgY29uc3Qgc3RydWN0IGZmYV9wYXJ0X21zZ19yeHR4
ICpzcmNfbXNnOw0KPj4+PiArICAgIHVpbnQxNl90IGRzdF9pZCwgc3JjX2lkOw0KPj4+PiArICAg
IGludDMyX3QgcmV0Ow0KPj4+PiArDQo+Pj4+ICsgICAgaWYgKCAhZmZhX2Z3X3N1cHBvcnRzX2Zp
ZChGRkFfTVNHX1NFTkQyKSApDQo+Pj4+ICsgICAgICAgIHJldHVybiBGRkFfUkVUX05PVF9TVVBQ
T1JURUQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoICFzcGluX3RyeWxvY2soJnNyY19jdHgtPnR4
X2xvY2spICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIEZGQV9SRVRfQlVTWTsNCj4+Pj4gKw0KPj4+
PiArICAgIHNyY19tc2cgPSBzcmNfY3R4LT50eDsNCj4+Pj4gKyAgICBzcmNfaWQgPSBzcmNfbXNn
LT5zZW5kX3JlY3ZfaWQgPj4gMTY7DQo+Pj4+ICsgICAgZHN0X2lkID0gc3JjX21zZy0+c2VuZF9y
ZWN2X2lkICYgR0VOTUFTSygxNSwwKTsNCj4+Pj4gKw0KPj4+PiArICAgIGlmICggc3JjX2lkICE9
IGZmYV9nZXRfdm1faWQoc3JjX2QpIHx8ICFGRkFfSURfSVNfU0VDVVJFKGRzdF9pZCkgKQ0KPj4+
PiArICAgIHsNCj4+Pj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZBTElEX1BBUkFNRVRFUlM7
DQo+Pj4+ICsgICAgICAgIGdvdG8gb3V0X3VubG9ja190eDsNCj4+Pj4gKyAgICB9DQo+Pj4+ICsN
Cj4+Pj4gKyAgICAvKiBjaGVjayBzb3VyY2UgbWVzc2FnZSBmaXRzIGluIGJ1ZmZlciAqLw0KPj4+
PiArICAgIGlmICggc3JjX2N0eC0+cGFnZV9jb3VudCAqIEZGQV9QQUdFX1NJWkUgPA0KPj4+PiAr
ICAgICAgICAgc3JjX21zZy0+bXNnX29mZnNldCArIHNyY19tc2ctPm1zZ19zaXplIHx8DQo+Pj4+
ICsgICAgICAgICBzcmNfbXNnLT5tc2dfb2Zmc2V0IDwgc2l6ZW9mKHN0cnVjdCBmZmFfcGFydF9t
c2dfcnh0eCkgKQ0KPj4+PiArICAgIHsNCj4+Pj4gKyAgICAgICAgcmV0ID0gRkZBX1JFVF9JTlZB
TElEX1BBUkFNRVRFUlM7DQo+Pj4+ICsgICAgICAgIGdvdG8gb3V0X3VubG9ja190eDsNCj4+Pj4g
KyAgICB9DQo+Pj4gDQo+Pj4gVGhlIGd1ZXN0IGNhbiBjaGFuZ2Ugc3JjX21zdCBhdCBhbnkgbW9t
ZW50IHdpdGggYW5vdGhlciBDUFUgc28gdGhlc2UNCj4+PiB0ZXN0cyBhcmUgb25seSBzYW5pdHkg
Y2hlY2tzLiBUaGUgU1BNQyB3aWxsIGFsc28gaGF2ZSB0byBsb2NrIGFuZCBkbw0KPj4+IHRoZSBz
YW1lIHRlc3RzIGFnYWluLiBTbyB0aGUgdGVzdHMgaGVyZSB3aWxsIG9ubHkgaW4gdGhlIGJlc3Qg
Y2FzZSAoaW4NCj4+PiBjYXNlIHRoZSBndWVzdCBpcyBtaXNiZWhhdmluZykgc2F2ZSB1cyBmcm9t
IGVudGVyaW5nIHRoZSBTUE1DIG9ubHkgdG8NCj4+PiBnZXQgYW4gZXJyb3IgYmFjay4gVGhlIGxv
Y2sgbWFrZXMgc2Vuc2Ugc2luY2Ugd2UgY291bGQgaGF2ZSBjb25jdXJyZW50DQo+Pj4gY2FsbHMg
dG8gRkZBX01FTV9TSEFSRS4gSG93IGFib3V0IHJlbW92aW5nIHRoZSB0ZXN0cz8NCj4+IA0KPj4g
SSB0aGluayB3ZSBzaG91bGQgc3RpbGwgcHJldmVudCB0byBmb3J3YXJkIGludmFsaWQgcmVxdWVz
dHMgdG8gdGhlIFNQTUMgYXMNCj4+IG11Y2ggYXMgd2UgY2FuIHRvIHByZXZlbnQgYSBtYWxpY2lv
dXMgZ3Vlc3QgZnJvbSBzdGlsbGluZyBDUFUgY3ljbGVzIGJ5DQo+PiBkb2luZyBpbnZhbGlkIGNh
bGxzIHRvIHRoZSBzZWN1cmUgd29ybGQuDQo+PiANCj4+IEkgY291bGQgcHV0IGEgY29tbWVudCBp
biB0aGVyZSBzYXlpbmcgdGhhdCB0aGlzIGlzIGp1c3QgcHJvdGVjdGlvbiBidXQgdG8gYmUNCj4+
IGZhcmUgdGhlIFNQTUMgaW4gc2VjdXJlIHdpbGwgaGF2ZSB0aGUgc2FtZSBpc3N1ZXM6IHRoaXMg
Y2FuIGJlIGNoYW5nZWQNCj4+IGF0IGFueSB0aW1lIGJ5IHRoZSBjYWxsZXIgb24gYW5vdGhlciBj
b3JlLg0KPiANCj4gRmFpciBlbm91Z2guDQo+IA0KPj4gDQo+Pj4gDQo+Pj4+ICsNCj4+Pj4gKyAg
ICByZXQgPSBmZmFfc2ltcGxlX2NhbGwoRkZBX01TR19TRU5EMiwgKCh1aW50MzJfdClzcmNfaWQp
IDw8IDE2LCAwLCAwLCAwKTsNCj4+PiANCj4+PiBJJ2QgcmF0aGVyIHVzZSBmZmFfZ2V0X3ZtX2lk
KHNyY19kKSBpbnN0ZWFkIG9mIHNyY19pZC4NCj4+IA0KPj4gc3JjX2lkIGlzIGEgbG9jYWwgdmFy
aWFibGUgYW5kIHdhcyBjaGVja2VkIHRvIGJlIGVxdWFsIHRvICBmZmFfZ2V0X3ZtX2lkKHNyY19k
KQ0KPj4gdXBwZXIgc28gdGhvc2UgMiB2YWx1ZXMgYXJlIHRoZSBzYW1lLg0KPj4gV2h5IHdvdWxk
IHlvdSByYXRoZXIgcmVjYWxsIGZmYV9nZXRfdm1faWQgaGVyZSA/DQo+IA0KPiBJIGRvbid0IHRo
aW5rIHRoYXQgY2hlY2sgaXMgZW5vdWdoIHRvIHByZXZlbnQgdGhlIGNvbXBpbGVyIGZyb20NCj4g
bG9hZGluZyB0aGF0IHZhbHVlIGZyb20gbWVtb3J5IGFnYWluLCBwb3RlbnRpYWxseSBvcGVuaW5n
IGENCj4gdGltZS1vZi1jaGVjayB0byB0aW1lLW9mLXVzZSB3aW5kb3cuIFVzaW5nIEFDQ0VTU19P
TkNFKCkgd2hlbiByZWFkaW5nDQo+IHNlbmRfcmVjdl9pZCBhYm92ZSBzaG91bGQgYWxzbyB0YWtl
IGNhcmUgb2YgdGhhdCwgYnV0IGl0IHNlZW1zIG1vcmUNCj4gZGlyZWN0IHRvIHVzZSBmZmFfZ2V0
X3ZtX2lkKCkuDQoNCk9rIEkgd2lsbCB1c2UgZmZhX2dldF92bV9pZCBpbiB2My4NCg0KVGhhbmtz
IGEgbG90IGZvciB0aGUgcmV2aWV3Lg0KDQpDaGVlcnMNCkJlcnRyYW5kDQoNCj4gDQo+IENoZWVy
cywNCj4gSmVucw0KPiANCj4+IA0KPj4gQ2hlZXJzDQo+PiBCZXJ0cmFuZA0KPj4gDQo+Pj4gDQo+
Pj4gQ2hlZXJzLA0KPj4+IEplbnMNCj4+PiANCj4+Pj4gKw0KPj4+PiArb3V0X3VubG9ja190eDoN
Cj4+Pj4gKyAgICBzcGluX3VubG9jaygmc3JjX2N0eC0+dHhfbG9jayk7DQo+Pj4+ICsgICAgcmV0
dXJuIHJldDsNCj4+Pj4gK30NCj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS90ZWUvZmZh
X3ByaXZhdGUuaCBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZhdGUuaA0KPj4+PiBpbmRleCA5
NzNlZTU1YmUwOWIuLmQ0NDFjMGNhNTU5OCAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJt
L3RlZS9mZmFfcHJpdmF0ZS5oDQo+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS90ZWUvZmZhX3ByaXZh
dGUuaA0KPj4+PiBAQCAtMzU5LDYgKzM1OSw3IEBAIHZvaWQgZmZhX2hhbmRsZV9ub3RpZmljYXRp
b25fZ2V0KHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzKTsNCj4+Pj4gaW50IGZmYV9oYW5kbGVf
bm90aWZpY2F0aW9uX3NldChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncyk7DQo+Pj4+IA0KPj4+
PiB2b2lkIGZmYV9oYW5kbGVfbXNnX3NlbmRfZGlyZWN0X3JlcShzdHJ1Y3QgY3B1X3VzZXJfcmVn
cyAqcmVncywgdWludDMyX3QgZmlkKTsNCj4+Pj4gK2ludDMyX3QgZmZhX2hhbmRsZV9tc2dfc2Vu
ZDIoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpOw0KPj4+PiANCj4+Pj4gc3RhdGljIGlubGlu
ZSB1aW50MTZfdCBmZmFfZ2V0X3ZtX2lkKGNvbnN0IHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+IHsN
Cj4+Pj4gLS0NCj4+Pj4gMi40Ny4wDQoNCg0K

