Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AA8B85D3
	for <lists+xen-devel@lfdr.de>; Wed,  1 May 2024 08:58:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715245.1116764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s23uu-0006jF-Gd; Wed, 01 May 2024 06:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715245.1116764; Wed, 01 May 2024 06:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s23uu-0006hD-Dc; Wed, 01 May 2024 06:58:12 +0000
Received: by outflank-mailman (input) for mailman id 715245;
 Wed, 01 May 2024 06:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UTMh=ME=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s23ut-0006h4-78
 for xen-devel@lists.xenproject.org; Wed, 01 May 2024 06:58:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2611::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b19ca7b-0788-11ef-909b-e314d9c70b13;
 Wed, 01 May 2024 08:58:09 +0200 (CEST)
Received: from DB3PR06CA0013.eurprd06.prod.outlook.com (2603:10a6:8:1::26) by
 AM9PR08MB6659.eurprd08.prod.outlook.com (2603:10a6:20b:30a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.36; Wed, 1 May
 2024 06:57:55 +0000
Received: from DU6PEPF00009524.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::d1) by DB3PR06CA0013.outlook.office365.com
 (2603:10a6:8:1::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.25 via Frontend
 Transport; Wed, 1 May 2024 06:57:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009524.mail.protection.outlook.com (10.167.8.5) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18 via
 Frontend Transport; Wed, 1 May 2024 06:57:54 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Wed, 01 May 2024 06:57:53 +0000
Received: from 50c7ed490037.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BAAD313D-9B92-44B3-892F-8EB2DCB3AC80.1; 
 Wed, 01 May 2024 06:57:42 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 50c7ed490037.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 01 May 2024 06:57:42 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com (2603:10a6:208:ff::27)
 by AS8PR08MB9119.eurprd08.prod.outlook.com (2603:10a6:20b:5b0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 06:57:37 +0000
Received: from AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda]) by AM0PR08MB3745.eurprd08.prod.outlook.com
 ([fe80::446b:ac86:e80c:ffda%6]) with mapi id 15.20.7519.035; Wed, 1 May 2024
 06:57:37 +0000
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
X-Inumbo-ID: 2b19ca7b-0788-11ef-909b-e314d9c70b13
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Sna6tCkGh7DLQdQ7GHmLTl/BhZFDJ42+SpZiUPjrZIsoPGxIvso9x5UQA/SxSVy/81kV5H+j4xPymZXILdS0C1gPPP1JydCqvwZMcnB/4mwJrvYB2nYc09QwzbL7Xfj7rXh5QzqfcsBlf+5NcfoWtWexMv7wmKOXFCiQpw5fENAcYvt3hhey2REevBP92v/SnetuQXYvQVVbwHip8Vg0I2QScZzHkD5oHzGB+3cOW+VyQz/xEjFvjI2ZXmFvXQhniFJ4Q36f7eJQyD4zmd/xYDQCS+khkcdpQkHvpVFWYSTZPKYEmUusxFKKrtzw400ciW8fOPfUHia0FhSAQgElBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HJA8n3NJ/TQmyBEtz7L3kCXnOjOxKdWvuquyWUVvJA=;
 b=mfQ9EsjiRB8d9GJZZ6H/xWU8UnH17wpWIRVJvqUkUiiM4zakAWO4MRM6p2mM1vC0Jd/2aJ0qlQTXnPwMdMXcbMgEeCKLmAXAR/jr+dp7nLthcGFTiRoSF0h8HMlbD3ImgP8Yanm7PdMPRgeBkJy4OPly+uXrLJjkLXtnKPqobk2yxFCZ2WfLpom2JlzhVkdx+SdPwFQlNMdcE5JZ9m/ASs4GW5kyOV7pmYVzRPHYllXmDXSqSQRbmaCRhYVIcvKCyLlC8ydti/U9wW1pxWnyZhWhQttTi7LTOiP90B2lAD6yiYEA0d6BKzxgTM03VzR838Q+ThX+PcJSXGzJCfuvMA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HJA8n3NJ/TQmyBEtz7L3kCXnOjOxKdWvuquyWUVvJA=;
 b=rsEz8HyMvucczjakrT9p0Go4Ggig8g4bk+wth5ZGcMZCirukxCO9KduLcWBco7cYST5gCNez/lvrCnB13+NYUITj8AClgmfkFdcwUlww1/sIUh7NYdwh2pPKwsf3Bmls9j+XGG+bXweVmONHbAsvzDRw5pOyHyjHLMmeCzD26rI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1be23a0ccc45f80c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FeUEljIv1IBl6+GEw/LMNCcA02hFy44d5v44mbnG04SVAR5YyKl2diK7r0UQrVO4/BdWIOtHuCWWI1nXzSJ0qWXb6eD0RBDYnsjS5MFrq67QNf47oOb3jueP4koy/O7e42TX5b7fSXGLC1lomwOS99PgsGaKs8U9wB6VXALr1q/YmGQohJVpQ7SH4NGw18eCzyyGKAo1zF9EbSy1bc1nLc1NhjsHEWnJ5m69zUlHMxK/d357+JTn2jZXZQAFs+g3EXPQ9KMW7vlrL0G9wTcoCUugO+W6bWlTokdlsM4+EEdzgyXaPjLTt1VqrWOOWZ0UVJSugcgyFtj/LCLl98EfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HJA8n3NJ/TQmyBEtz7L3kCXnOjOxKdWvuquyWUVvJA=;
 b=G8DM8CdrlAs6VSM3LtQF/H4WCihyLTbsd4v5PFpKdkaHuZf36v6nNQPQbwCeQLuCRevatsPN5HLvqZtvJ3KvzMfgm4DNJE0ESSYydIYRieoH/U/BbBGs04xa4je9DdU1xfwg+Bj/1V4SV4SnGiPJ2JCm8a7QCUgWr+A9Yxb80s+Wwg1/8J5v8Id2/3pkjSz3Kd05/qlY5ldkF5UCQ8ZykuSgXZ0ybgR0FF3CSq2Phovn7hk1+nRtaXvuzoQxZgN1vUt+HtRVlhT/XcUSHhoJJvXp+gO9jl1t/yeY1nf/WX1CmLh8saJg3wumuWMvgnOaNNb8kQ8usmObivVp5OYY8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/HJA8n3NJ/TQmyBEtz7L3kCXnOjOxKdWvuquyWUVvJA=;
 b=rsEz8HyMvucczjakrT9p0Go4Ggig8g4bk+wth5ZGcMZCirukxCO9KduLcWBco7cYST5gCNez/lvrCnB13+NYUITj8AClgmfkFdcwUlww1/sIUh7NYdwh2pPKwsf3Bmls9j+XGG+bXweVmONHbAsvzDRw5pOyHyjHLMmeCzD26rI=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index: AQHamu72Eq1RpEGs60mNp9DIfY8mn7GAr6+AgAFEGQA=
Date: Wed, 1 May 2024 06:57:37 +0000
Message-ID: <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
In-Reply-To: <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3745:EE_|AS8PR08MB9119:EE_|DU6PEPF00009524:EE_|AM9PR08MB6659:EE_
X-MS-Office365-Filtering-Correlation-Id: 9764ec14-642f-4d5e-20a6-08dc69ac065b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|376005|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Rkk1MFBndkxGVW5MazJVb1BxMEZKMXRvZms2MmQ3M3JrSkJMVkxZd3BCcDdS?=
 =?utf-8?B?T3VTRVNOMkVnc0JSdlpYdXdPNEs1VDNwY0c0Q2hjZ2l1WlkvUE12bGJFeEJ5?=
 =?utf-8?B?SURNZEZibDVtTXhsYXRrTFFFVHlXYUNTV2cvci9VWnduZWFQWThLSmdheW03?=
 =?utf-8?B?TkpjdnZ2cTNJMEtqL3R5UDlFbVJVU3hpY2wvMTRNTC9kQzQ1VWNqcmI0Qzh3?=
 =?utf-8?B?K1lIMy9zcHZjN1FSdlpIT1JzVGpTK0V1bXlocy9iN1hCVjhuNTJpR2l0YUow?=
 =?utf-8?B?WmlWZkM5alJoUFpsQzZvUWxCQjlSOFNZNmhsSUVjVlhsUEpZZ21xR2REWnF2?=
 =?utf-8?B?VjRCMUVIbDVERVlQNUMvdE9CdFJyQUUyNSt1WDBSL3lYMzd5b3R0aitSQklT?=
 =?utf-8?B?ZzFhNzAzdFBjcllCaG13MGN0dkFCZVFxYnBEL2wrSHdmUWFBT3pqUUZmQ1Fp?=
 =?utf-8?B?eCtrRS9HdHJBZFlOMElQUnFqQitZeTVKaXBHeFI4VHc0czg1SE5WY2FuQ24y?=
 =?utf-8?B?Nm8rS1puTkdtd3JQY21MRDBjU1VYRzdaRHZVMy8zK0Nwd0hTRytiakEyNjFO?=
 =?utf-8?B?NE1RNmxrUWhOdXZUVWdudUdrNktpc1VURDFiLzNYZDZWNTlRUTg5SHg1T1c1?=
 =?utf-8?B?RHpIa3QwY2d1VnhQMGpZZk9ldm9oZDBYdG9iemNVVDJLeE1QbU1CeS9xNmND?=
 =?utf-8?B?TXdmTlJRUmdlSU9rRlZmbG9UYnExNDBSdFRyNyt6c3prK1UxOFVSdnhnL1M2?=
 =?utf-8?B?TlhqS2U3Q0RCa1Q3SkpqTjRGWUI2NVVUNG9sYzE4MEpmNWZ5QzlBRjlzL2lN?=
 =?utf-8?B?blZKeUJTZnlqdStKVTNxekVtd0tBWlFiNWgzSEdCdHhUM0ZWUjdlOVc3Z0ZJ?=
 =?utf-8?B?UnV3MlFld0U5MC92eGd5VDRZVVFFMGVTUCtOeENzWmVNZEMrdE45QUtoZDk3?=
 =?utf-8?B?V3FlalhaRzJhY2hQTjIvMFAwazFvQzF6dGhmUnA3N2xyS1d2N1FBaStsQmdr?=
 =?utf-8?B?Tnd2cUZzUHNrZ21vSjhSWTJxZFlSRXgyWVg1alIxVnVtVnpwVXJ0V3NwTXli?=
 =?utf-8?B?RjNPL04wb3VwVXJhL2J4SjFqV2FtZzlqSm5zLzhZTll5WHo2eEtmbXcyRmdH?=
 =?utf-8?B?bGNxZDM1UXpTWklxdWZrNEZCREFkajN3SlMzcG0rWWQ4UHRTNERWSHV2bDVq?=
 =?utf-8?B?ZXN6bEhrZWRNZmZGQjNHQnJyOUJyZ1NUTTBMMWdWa0UweTQ3YkdvVlUwV1FG?=
 =?utf-8?B?a2JQeFE3Qkl1S3dkNlNoSTlGQ3AyRnZnOW9IU01kWThGbUtySzNXZXZvdlNE?=
 =?utf-8?B?azZHV2xJeTRZTWZTc1dnRHo1OGc2QVpuV1hqWFh2SEIrZ2pGa2VHS3RMelBD?=
 =?utf-8?B?ZEhlN3pGU01tbi93NWFEbDVjaXZZdTdrWTYxM2hGWjljdjRKNytMN254VGg0?=
 =?utf-8?B?OUF5U1B6QUp0SUJtZnNZZllLT0puYmFmU29UMHBmMVppM0w3UlJmeXN5N3h5?=
 =?utf-8?B?MTFoSUNJVVVlOGcvWmJHRTltdHg2KzMzQnRKdEQ5M2ovMElaWnZNaEdFdzEv?=
 =?utf-8?B?WTlGejlwS053aWlHbHZqb3JBRkI5bThoNGVYQTBSVnFDbkRIUWlqbS8zYjVW?=
 =?utf-8?B?UW9qd2d4QTFvd2VKaTRGTnVUWC9BWWYrVThFZGRsWkVGWkErR1VvaE0xN2Jh?=
 =?utf-8?B?a3l1c3oxT2VxTE5aSFYvTHdESUx5bWlXSzByeTNsM0FleHljYnRlekYyM0cx?=
 =?utf-8?B?ZUY1K0JrWmttOG9RKzdLaVdGRW1wVThYaE5iTDNGSHZIV2Vsc1NzQys1TFRY?=
 =?utf-8?B?MUZqejRubFBUeWx2cFNrQT09?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3745.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <F4BDB047E6412F469D4317891B77E22A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9119
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0f5f89ae-0073-482b-5008-08dc69abfc48
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|35042699010|1800799015|376005|82310400014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2hSZGFxSTAzZjhrWVdWOVdWYThVQkl1S3FINll1UU1BV1ppNS9wZTVTLzF4?=
 =?utf-8?B?dWw0WHFjT0QwbW4xTURIWFgybVBuMExIaDB0R1hqcjRUdVFZWEswVktaUjlY?=
 =?utf-8?B?UTk2d3NiVUx0QzlUWnlMMmRtMjVSRkxHVnJ0TUdMaElKVzdhYWJUMHNjZStn?=
 =?utf-8?B?a0F1cVlURlYvZjZLNFhjNUR1NzFYOFNlcDJ0OVFUVWxnaHY3N0p6YlprY3pU?=
 =?utf-8?B?VXQxQVpRa09SYW12VE9CSCtOMC9nT1NIL296bHBPZGZKYzY3dTNsQTZqQ3pT?=
 =?utf-8?B?Nmk2cGlUVExQWkJMT2Z1dXYyZ1hLZFdsNVpNNVlwNG0raUR3RzN5S1pVM3NJ?=
 =?utf-8?B?Q0NGVCtIWGtCVytFckg0eUNnb3BmV1dmdDVyMklaWjd1eXQwa0NDSlVjS3JW?=
 =?utf-8?B?bHpNNW5nMHJYa3BmMHQwcUhlWThFY1VZOUxIcWJSYVlwaEJNZ0hEWU5mUnZu?=
 =?utf-8?B?YlQvSjN4OUd0K2ZJZnV5TjRzWjRQMFk5VDM0TnBOcUtVWm10SVBqbFo2Rmhz?=
 =?utf-8?B?blhoNnBHWTJsM3U4bUZYcEN2cXZLeEZkL0k1UFRuc3ovWEFiVitnYTdhaW1Y?=
 =?utf-8?B?b0d5LzVYa2F6QjRSOGJEOFdreElhQVJBSjkvSnhtMEhyM1d4N1JOdlN0TFJs?=
 =?utf-8?B?SWtiMmE2Z1VXbDRsMm5tcnpGcE84b2pwSzJKZFF2MXNPcTVwSllhYlZnejFT?=
 =?utf-8?B?bmNXWjZObHZ0UFRqMm1CVDJXbWFOV1MxOElMR09WMHo2aUJDVGcyK3NaTTVC?=
 =?utf-8?B?dlhCTGVjUzFnaUdnT2lBUG9IN2dXdEhOOHlwYVZybmZqTXUyNTNUMFpSZGUx?=
 =?utf-8?B?dE5DVUp4eUZkQWZLWGhZdWhRNlJJM0V5K3VCeTc3dGJnVUUyRlZoQ1VmWUhm?=
 =?utf-8?B?RXRuTkx3VW1JcHROY2txNjVObDJiNUdUbWV2RXZoeENwUFdUUGVxeXdRL2FH?=
 =?utf-8?B?NURUNW1OdExMSFNmM0VaNTBmZHgzSFgyZGpMTzkzcFBaZ1N5bmtQY08yMk1E?=
 =?utf-8?B?TlM1bk9PQlJtWlVyc1FaNGdXWllXa0E2MFU2eXJlSzRrRTk0UXZQbnlOL0JI?=
 =?utf-8?B?MWRML2ZxRTh0OFB5ZUVNODdLQVFUVUNVbDFKSFNXSXNuSkNzTFdlTEJzbkxu?=
 =?utf-8?B?UlNqTWJyZkpMUzFOdXFhTVhMTmsvUUdIRjhTb0FKMkJ3L0s0OEVCdkNJVHlI?=
 =?utf-8?B?OEE4aFRneS9BaEJzVkFCTmdpUGptSytIYzE0SFpqcW1UWVNPYlU3d1BCS2I3?=
 =?utf-8?B?SHdrQVFkSWJsQUNDZ1g1MUlGTmR4UzFUWEd1UC9EUHovOXY5dktNNElFZXQ5?=
 =?utf-8?B?MndLeW5lSzhEV3lSQzg5ZXpZTGVRUUlKdnJrclBQUFpjb0phbkJpYXRmeFRl?=
 =?utf-8?B?ampkbkRrUnpyWXpTTC9nWXFNZGZmUGZwSkIybWFML2ZqVEwrOEtnWkZlTWc5?=
 =?utf-8?B?Vml1WjdCdWZjRk1zcS9MUUhZMkhHei9VNVB6US9qLzJmd2tESWdZeWdObTdZ?=
 =?utf-8?B?Q2FjU0taLzM4aitLUnNKY0lHcU9YdGQ3Ry9GZVo4dG1KQlhJcjh5ejdtL0Y2?=
 =?utf-8?B?dUQrbFNqbHdBdmRkWVpHVXF6UlRuUEc1eGpvMk0rVk9RcnZ6cFkwVFFzRkRV?=
 =?utf-8?B?eVptNTk0cm9tU2RESWdIRG5DUTcyQnNxREdhL0JwcmgyQ0tacFlmL0lQQ3pO?=
 =?utf-8?B?dDFKcU9XdkRYVXdtWWFtY1FySzd5ek01VkZ0YkNkZDZKc0QySlFBVHBGYUR4?=
 =?utf-8?B?UTlMbHpvQXpjSUhNeitkVXNHNUY1cGJTeFhCNnU1V2NWTjF2bGhMais5Ri9J?=
 =?utf-8?B?ZlRYcENKYkdIcGRCR040ZEJXdXk5NmFSTUQ4QzNmNDgzb0JURHdMVEQyY0Vl?=
 =?utf-8?Q?4YdUjHtulfghY?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(35042699010)(1800799015)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 06:57:54.1694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9764ec14-642f-4d5e-20a6-08dc69ac065b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009524.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6659

SGkgSmFuLA0KDQo+IE9uIDMwIEFwciAyMDI0LCBhdCAxMjozNywgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IE9uIDMwLjA0LjIwMjQgMTM6MDksIEx1Y2EgRmFu
Y2VsbHUgd3JvdGU6DQo+PiAtLS0gYS94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20vc2V0dXAuaA0K
Pj4gKysrIGIveGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmgNCj4+IEBAIC02NCwxOCAr
NjQsMjAgQEAgc3RydWN0IG1lbWJhbmsgew0KPj4gfTsNCj4+IA0KPj4gc3RydWN0IG1lbWJhbmtz
IHsNCj4+IC0gICAgdW5zaWduZWQgaW50IG5yX2JhbmtzOw0KPj4gLSAgICB1bnNpZ25lZCBpbnQg
bWF4X2JhbmtzOw0KPj4gKyAgICBfX3N0cnVjdF9ncm91cChtZW1iYW5rc19oZHIsIGNvbW1vbiwg
LA0KPj4gKyAgICAgICAgdW5zaWduZWQgaW50IG5yX2JhbmtzOw0KPj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IG1heF9iYW5rczsNCj4+ICsgICAgKTsNCj4+ICAgICBzdHJ1Y3QgbWVtYmFuayBiYW5r
W107DQo+PiB9Ow0KPiANCj4gSSdtIGFmcmFpZCBJIGNhbid0IHNwb3Qgd2h5IF9fc3RydWN0X2dy
b3VwKCkgaXMgbmVlZGVkIGhlcmUuIFdoeSB3b3VsZCBqdXN0DQo+IG9uZSBvZiB0aGUgdHdvIG1v
cmUgc3RyYWlnaHRmb3J3YXJkDQo+IA0KPiBzdHJ1Y3QgbWVtYmFua3Mgew0KPiAgICBzdHJ1Y3Qg
bWVtYmFua3NfaGRyIHsNCj4gICAgICAgIHVuc2lnbmVkIGludCBucl9iYW5rczsNCj4gICAgICAg
IHVuc2lnbmVkIGludCBtYXhfYmFua3M7DQo+ICAgICk7DQo+ICAgIHN0cnVjdCBtZW1iYW5rIGJh
bmtbXTsNCj4gfTsNCj4gDQoNCkF0IHRoZSBmaXJzdCBzaWdodCBJIHRob3VnaHQgdGhpcyBzb2x1
dGlvbiBjb3VsZCBoYXZlIHdvcmtlZCwgaG93ZXZlciBHQ0MgYnJvdWdodCBtZSBiYWNrIGRvd24g
dG8gZWFydGgNCnJlbWVtYmVyaW5nIG1lIHRoYXQgZmxleGlibGUgYXJyYXkgbWVtYmVycyBjYW7i
gJl0IGJlIGxlZnQgYWxvbmUgaW4gYW4gZW1wdHkgc3RydWN0dXJlOg0KDQovZGF0YV9zZGMvbHVj
ZmFuMDEvZ2l0bGFiX21pY2tsZWRvcmVfeGVuL3hlbi94ZW4vYXJjaC9hcm0vaW5jbHVkZS9hc20v
c2V0dXAuaDo3MDo2OiBlcnJvcjogZGVjbGFyYXRpb24gZG9lcyBub3QgZGVjbGFyZSBhbnl0aGlu
ZyBbLVdlcnJvcl0NCjcwIHwgfTsNCnwgXg0KL2RhdGFfc2RjL2x1Y2ZhbjAxL2dpdGxhYl9taWNr
bGVkb3JlX3hlbi94ZW4veGVuL2FyY2gvYXJtL2luY2x1ZGUvYXNtL3NldHVwLmg6NzE6MjA6IGVy
cm9yOiBmbGV4aWJsZSBhcnJheSBtZW1iZXIgaW4gYSBzdHJ1Y3Qgd2l0aCBubyBuYW1lZCBtZW1i
ZXJzDQo3MSB8IHN0cnVjdCBtZW1iYW5rIGJhbmtbXTsNCnwgXn5+fg0KWy4uLl0NCg0KQ2hlZXJz
LA0KTHVjYQ0KDQo=

