Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE73F74CA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 14:07:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172063.313899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrgc-0003JO-8Q; Wed, 25 Aug 2021 12:07:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172063.313899; Wed, 25 Aug 2021 12:07:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIrgc-0003Fn-57; Wed, 25 Aug 2021 12:07:18 +0000
Received: by outflank-mailman (input) for mailman id 172063;
 Wed, 25 Aug 2021 12:07:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YETI=NQ=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mIrga-0003E5-RP
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 12:07:16 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc357c80-059c-11ec-a945-12813bfff9fa;
 Wed, 25 Aug 2021 12:07:15 +0000 (UTC)
Received: from AM5PR0202CA0001.eurprd02.prod.outlook.com
 (2603:10a6:203:69::11) by AM0PR08MB5393.eurprd08.prod.outlook.com
 (2603:10a6:208:18c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 12:07:12 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::c7) by AM5PR0202CA0001.outlook.office365.com
 (2603:10a6:203:69::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Wed, 25 Aug 2021 12:07:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Wed, 25 Aug 2021 12:07:12 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Wed, 25 Aug 2021 12:07:12 +0000
Received: from d77453877d41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6FF3D9EA-1EB6-4A6D-BBB5-75C67B9FBF55.1; 
 Wed, 25 Aug 2021 12:07:05 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d77453877d41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 25 Aug 2021 12:07:05 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6959.eurprd08.prod.outlook.com (2603:10a6:10:2bf::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Wed, 25 Aug
 2021 12:07:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 12:07:02 +0000
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
X-Inumbo-ID: fc357c80-059c-11ec-a945-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIMvSrriIu5BYED1z52fIVrllVQZRk0kXDC8s7UDZSM=;
 b=tlXEMNZ3sZRAjEltTLiTYqDbtwj1uZXgn7eaY2b/7kblDsu34APTeTYa8Ljwa57nve+ypCUu3JRj3Vz79+/SULeJLm1d4RXxF17CvnFPBt7KELdR9n8mVoJQO9zJcAsgPrQD3yOB9KZxHV4BQeLjdRuBbPomQ4VcfZ3fiXKRzko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRcHbz7vbCxdGjBJfK84oSaJ2ZL5U99VIMAyy271ueWuFNex7bsg9XlIDQ427dsQy8UheaWC177nPFGjI/DqHnv12WmssGX3FWjEbBs8jUbcXX3qyZTkUQGj10ii+t+fV2Qn50EhNI02uq2QUQZlckv8NXNCK7SQKywgl61j5ynAKOiTFWdnSp3mlT1BMjQ/M4IXcmoh73GBL2dy6MQ7mf8iyyrPOuJG1wQo74pUZpuok34Vx+fZ3Nja54jOEshBfL7bKMc67Ppv4HNkYF+6KaHi/SxKeRZpjb0LvRZK60dlGQyy/fHSTSJ/Oq1TGWdT5Rz2QYS0cVfuO48KJrJstw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIMvSrriIu5BYED1z52fIVrllVQZRk0kXDC8s7UDZSM=;
 b=ICyOirDCKOJoYwffwuY8g3k3mnSmLntz/dW5qBMms7g44cZ4zFY+WEm9LDfq5nBDSCX6am/aUdw9SzRKI2MYLDR6tf3CSjwo289pW5uLiV3ntaPFIH5fQ67S8/+PuBvFIcJLbltQ5rD0p89yk/6ilUZ9PMXWbacLqVk8YUx6Tk4fb3CG91zzE7zqzmsSYIxa0rRoKiZRBtbf2wpfxxVu11QEljJB7LD0pEy+XYZoq++pBs55mkoJ0BZfHO0P+GBaq9uNJH7LMk0bY9juKzUPbhm0j87zsvtqv3N04D9pRqHlQ00fzyUJyd9UxZzYR/uDLDf13MZUxda9rYifA0mHcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eIMvSrriIu5BYED1z52fIVrllVQZRk0kXDC8s7UDZSM=;
 b=tlXEMNZ3sZRAjEltTLiTYqDbtwj1uZXgn7eaY2b/7kblDsu34APTeTYa8Ljwa57nve+ypCUu3JRj3Vz79+/SULeJLm1d4RXxF17CvnFPBt7KELdR9n8mVoJQO9zJcAsgPrQD3yOB9KZxHV4BQeLjdRuBbPomQ4VcfZ3fiXKRzko=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
Thread-Topic: [XEN RFC PATCH 13/40] xen/arm: introduce numa_set_node for Arm
Thread-Index: AQHXjpsyLnVBArVEdkyL68RkePfWG6uEHPyAgAAK5SA=
Date: Wed, 25 Aug 2021 12:07:02 +0000
Message-ID:
 <DB9PR08MB6857E228F4C0847D4DF014ED9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-14-wei.chen@arm.com>
 <a07963e4-84c8-32de-4e8b-013a5419deea@xen.org>
In-Reply-To: <a07963e4-84c8-32de-4e8b-013a5419deea@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: DDE8916EC635E54CA767FC168CE47F94.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8228511d-fb54-4167-b69d-08d967c0df36
x-ms-traffictypediagnostic: DB9PR08MB6959:|AM0PR08MB5393:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5393CE688BA37618EAD82FF29EC69@AM0PR08MB5393.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 jHyCM+2H3EGf7SnzdceUPxnA+UGKnTK2CQBrqEYgGbclpd7h29EWtmLylzS4FxMW0+zRUfeMs9E/ZdZpcV9TE22IbyofYUCPiLHf0LEi9RigaA5EfsyUcwMnXE5BupYHZtrljGdfBXXXnU2FR+eBe6qgLHeSxLkX56a4UihquR8DCtQGF024FdvZV/Xf0IiKkjBZ9to4t5jK0OurGDX+x2c/HTqCpAIsnATH8O5GkXNDGmeJYWkGXilUMzjePK1GKeiSJ34Kh4Qaem39adWyIPcSnaTiSoxVY/t3TYu9XXAaGrqGTTptxLji56C0DpZgtYXSPHwEVIQWVOQ0BGZpo9KXMYg6lr58643qqhEYuEpnqj7MUCfVZ44llomif8Xg9F43+H2+cus9/XkTxGV6SSH7x4zoYVllqc7zm2qAD1kbwxfhvxit8L9/Q2emXIJovMwrwULyZukIbRoTGE6/IW48z9sym53oLO46rmFRmKotUnxTZ2do9Bo7TWC6EpyKCvMZDbY0lYl2cq/Xw4shVYhbaYkdGoaP520pIb8nXGuOMjcA2nfj6JeH/9XyG1jqOQWB/OVZmR0uOKpzYcrTFm/wrKw49uvSdDcVnNHbtmpHa8jmCeVcoxf4z2YxGTu9uErNWYX/O5ATbXdnH3aUx8G0qFiNoqX+yHnhRk0UVO7oIW0gU2JB5OmNZ4HMigG3txaGxLyecPUeWrruDnc62WyN8w8L/kupAWdhLgDOiZugeq4lclahmAgqXFsPSTw9VhF/PE8R5molr3Rx7DAWMQkf4KXvFNiTV8+ImigrfmpH0/CjQtksd7ymgXx2kvJm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39860400002)(346002)(136003)(396003)(376002)(26005)(186003)(66946007)(86362001)(4326008)(316002)(110136005)(83380400001)(2906002)(66446008)(64756008)(66556008)(66476007)(478600001)(8676002)(53546011)(6506007)(38070700005)(71200400001)(9686003)(122000001)(8936002)(38100700002)(5660300002)(33656002)(76116006)(52536014)(7696005)(55016002)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eStLYnRoSUFobUZCNEdTMFhQb3JiVUhFaUhTQ3VaTmhvb01iSDcyZGxtYkJa?=
 =?utf-8?B?aG05b01vN0ZaejJ0TzlCSEJ4UjF6VTc0Qi96UGZpTmd4aWNkUWIrMVJRMVFI?=
 =?utf-8?B?NWhJQlU1RkFwQ0htZnRyU3lITWY0cTdsWmtVQ3ZscE5xRnpzY0NLdzFwSnQy?=
 =?utf-8?B?dnJqZjdwVTVFQ1B0TndyTkxvYjlxZVRXc0F1OXRtRlh1UnpjSzZ5UmRxNGFp?=
 =?utf-8?B?STFNeVEyLzZKQ1gyWmQvTWhQeTNTYkJDWEcxYmppaTBuQ2ZBOEVodUNIQ3Jx?=
 =?utf-8?B?aEtWVVNjb2REQ21weGFYVHlDdG9pVXNpc1p2TlIzRFdOMU5OWHh4VG9lOFNo?=
 =?utf-8?B?SWt4eXRySUYrVlU0Mys5cmlwd1VXQm1TR2piZHBrOUpNZkYzVit5L3RSMTE5?=
 =?utf-8?B?K2FSamFLNnl5amdtRXpVTkd2cnA1MGhpRTN2MVUwNGRlcG1JbWwxM1pPemYx?=
 =?utf-8?B?MjRTaGVNZDZPbXc1VUV6NHBDeS9qUzBlaW1LYUdtM3FMcEt3RG9ERDAyamtB?=
 =?utf-8?B?Qk1uMHdCa01ZaGFhRnhRbitYOEw5bVpQVXVJcU1Vdm4rcHlXN2IxRkplNzA0?=
 =?utf-8?B?Yzl5aHFNU0JwMnhGSUU0blNNeEVxQ0QzT0Y0RHZ3dHVxZW45dDBUOFdpUHlY?=
 =?utf-8?B?LzBRYXU3Zjd5Nm14VmxtNTRXeTVPQnhqTlNCSktyQkNpa3REMk1ndDJnclM4?=
 =?utf-8?B?WTVDaFJrb21wbkFnQ05tVWtlb3AxejBXMHhvZ2Jkbm52a1V0WkR2NXA0VDhH?=
 =?utf-8?B?cnNtYmlwNDhkd0E2VGVJQVk5TkdJemZvejZ1TmovbXhpOTd0aGRhS3Z3Rjkz?=
 =?utf-8?B?NUIrK1BGMmFpb05ZYS9TYnNzZ1ZlNWZDdFF1dm8wREZuRXY1TUlIb2RwOEZH?=
 =?utf-8?B?SzR1THNhTzM3cXhKR1ZtRzdHUEZ5RFR4citpa2hiWHFwSk51YktnUGRhbWxE?=
 =?utf-8?B?anlQMkhhVy9zaWpzMXcrZmFoYURzZjRHTU5NcVVjUTVZUDNDNmJmMUFONTl1?=
 =?utf-8?B?WDNZQk4vM0twNlQ0UUZ2aDNvd0F0TzlYNzAyeHBkOExjeGJJZW1BdUErN3lw?=
 =?utf-8?B?emRWWWFRVXIyTDhiMVZ0L1d2b3laWk9HT00zM3FnOUFkMEFUcko5OXJtYkxX?=
 =?utf-8?B?bENJcjljNlNkUVN6WXlXYTJoaG1YZ2hCb3E1aHBBQ0hicERoVUQrZ1l5UG51?=
 =?utf-8?B?NndCY2w3SkZEZHh5bmZvNkgvRWEvTXpaaC9iL3hwN1ZZTzQwVi96a3NscXhl?=
 =?utf-8?B?ci8rYzB1elpOVWZvLytXeFUvVWh6cWEvZ01WM25mZzlZcXZEc1FnUlhTWVlq?=
 =?utf-8?B?bXdMVDkrSlZOK243OTQ3aDF1TGRHQVE1NWNxSlJ4eWx4NUZWajlBNmtCL3Zw?=
 =?utf-8?B?UE93VnNGaE1FWFJCRElqeHNhaEcwTDVCZnIvUVI2M2lwWmRlaWM1V213RkIz?=
 =?utf-8?B?TE1kTzlxcllteHp5MHRiR0tYM0Fldjl5YitlVnpLUk9KTjY0L1VzRWE0OXF0?=
 =?utf-8?B?ckRvMVdENnVlb3d4a2pwMmxKYW1uV0lad0hiUGpGKzZ0Umd1elF3c05CQ09N?=
 =?utf-8?B?Wkk4ZGdDNHJTa3dQTndVSjZVV0c4WGxWcmFzT2tEQm84dXl4MmUwSUFWTW9O?=
 =?utf-8?B?akgyVDdQSUZraWRCUDlPeUtKaDFXY0oxOGx2MXVHNHNtd0tSQ3hVWlhxblMr?=
 =?utf-8?B?dGtlcHdmdEdiNkJrT2hHR1VuUlRBT3dDRDlZaGo0NkY2UzAvdXpOT2xxajVJ?=
 =?utf-8?Q?zHzFPKHbvgiYaF4T9oqbPnEu9EMi9mUG/Odkoq4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6959
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	60fb8ec9-9676-436e-68d8-08d967c0d943
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	INtwjQ8jZwxeocz4OICZtMyoRlHRxNRSKdufUB9XkfW1U69DAjcEFj3SO12UtFD2+zPtLv9A99ykp3OdVoedD4I8n37I/eXnsGJNmbxzslWz22ocZSecS9infy7GAoq/K8yrycdDNingVUle44fbk2HukC+MiasFMJYaVBgxMLzYheuB5mbmZP6X206UyIEUvHEvqIu0B/KkcYNfw6eTsInT3M/Km+OcUPT6igdpJlSCtCQzBTQbc1d6Qm9uYw62jXpzRg4XrrRSyc3NkPegl5ydGLXQT0vfl8z63HaC/fnhiK87FYejIa54FP/D4nmx5vvdmIWqEeJ1qnsFmIEGStK1HGShhZ4cN6HwycfFmuH+1GoE4Jtws3O5lsh8Jo5E3zxkvrAMOHgomKdZRHlziXooO9WnPtQVkUYAEgPkSrxfBR6d7ptRNg7yyMmcPuI4ZJ/zawDtcjVHkYC7SL4YHn3gpLztTYv3+viDepbi0iYRZLIRcEFBmfEL8xMc8iGht3h+b6Wmy4Am7ClrVWQDO0XegsugHJiX1FCqR8zAMsJz+mqFsRD1MEVQkR50VcHZml/RwxdmnAR4eLmrwEI80SJtc+IsJnMzWBaRPabdtIX3NYAI0LwopHpSlD+C3XhibzZ6Xiap4/QJQADe2gbhGcxyR2L+Nxf4hlugEFIN4lyBvro4qwsECndYV4MCFQymtloJAvmg8DqSW3nzI7TcTPIDCxJDs7e77g3fWvk3+U+bNCFcJYr31E/QdwHVIOI/n083MkY0FoZQMjVLZ3WydtBj0q0Qfr2bGnInXOliq/kqxj9Fbqf1+05wPyjyFGBu
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(53546011)(6506007)(26005)(70206006)(7696005)(82310400003)(186003)(70586007)(508600001)(36860700001)(8936002)(8676002)(336012)(86362001)(47076005)(83380400001)(33656002)(2906002)(5660300002)(9686003)(316002)(55016002)(4326008)(356005)(110136005)(81166007)(52536014)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 12:07:12.5282
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8228511d-fb54-4167-b69d-08d967c0df36
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5393

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjXml6UgMTg6MzcN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMTMvNDBdIHhlbi9hcm06IGludHJvZHVjZSBudW1hX3Nl
dF9ub2RlIGZvcg0KPiBBcm0NCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4LzIwMjEgMTE6
MjMsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFRoaXMgQVBJIGlzIHVzZWQgdG8gc2V0IG9uZSBDUFUg
dG8gYSBOVU1BIG5vZGUuIElmIHRoZSBzeXN0ZW0NCj4gPiBjb25maWd1cmUgTlVNQSBvZmYgb3Ig
c3lzdGVtIGluaXRpYWxpemUgTlVNQSBmYWlsZWQsIHRoZQ0KPiA+IG9ubGluZSBOVU1BIG5vZGUg
d291bGQgc2V0IHRvIG9ubHkgbm9kZSMwLiBUaGlzIHdpbGwgYmUgZG9uZQ0KPiA+IGluIGZvbGxv
d2luZyBwYXRjaGVzLiBXaGVuIE5VTUEgdHVybiBvZmYgb3IgaW5pdCBmYWlsZWQsDQo+ID4gbm9k
ZV9vbmxpbmVfbWFwIHdpbGwgYmUgY2xlYXJlZCBhbmQgc2V0IG5vZGUjMCBvbmxpbmUuIFNvIHdl
DQo+ID4gdXNlIG5vZGVfb25saW5lX21hcCB0byBwcmV2ZW50IHRvIHNldCBhIENQVSB0byBhbiBv
ZmZsaW5lIG5vZGUuDQo+IA0KPiBJSE1PIG51bWFfc2V0X25vZGUoKSBzaG91bGQgYmVoYXZlIGV4
YWN0bHkgdGhlIHNhbWUgd2F5IG9uIHg4NiBhbmQgQXJtDQo+IGJlY2F1c2UgdGhpcyBpcyBnb2lu
ZyB0byBiZSB1c2VkIGJ5IHRoZSBjb21tb24gY29kZS4NCj4gDQo+ICBGcm9tIHRoZSBjb21taXQg
bWVzc2FnZSwgSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHdoeSB0aGUgY2hlY2sgaXMNCj4gbmVj
ZXNzYXJ5IG9uIEFybSBidXQgbm90IG9uIHg4Ni4gQ2FuIHlvdSBjbGFyaWZ5IGl0Pw0KPiANCg0K
WWVzLCBpbiBwYXRjaCMyNywgaW4gc21wYm9vdC5jLCBkdF9zbXBfaW5pdF9jcHVzIGZ1bmN0aW9u
Lg0KV2Ugd2lsbCBwYXJzZSBDUFUgbnVtYS1ub2RlLWlkIGZyb20gZHRiIENQVSBub2RlLiBJZiB3
ZSBnZXQNCmEgdmFsaWQgbm9kZSBJRCBmb3Igb25lIENQVSwgd2Ugd2lsbCBpbnZva2UgbnVtYV9z
ZXRfbm9kZSB0bw0KY3JlYXRlIENQVS1OT0RFIG1hcC4gQnV0IGluIG91ciB0ZXN0aW5nLCB3ZSBm
b3VuZCB3aGVuIE5VTUENCmluaXQgZmFpbGVkLCBudW1hX3NldF9ub2RlIHN0aWxsIGNhbiBzZXQg
Q1BVIHRvIGEgb2ZmbGluZQ0Kb3IgaW52YWxpZCBOT0RFLiBTbyB3ZSdyZSB1c2luZyBub2RlX29u
bGluZV9tYXAgdG8gcHJldmVudA0KdGhpcyBiZWhhdmlvci4gT3RoZXJ3aXNlIHdlIGhhdmUgdG8g
Y2hlY2sgbm9kZV9vbmxpbmVfbWFwDQpldmVyeXdoZXJlIGJlZm9yZSB3ZSBjYWxsIG51bWFfc2V0
X25vZGUuDQoNCng4NiBhY3R1YWxseSBpcyBkb2luZyB0aGUgc2FtZSB3YXksIGJ1dCBpdCBoYW5k
bGVzIG5vZGVfb25saW5lX21hcA0KY2hlY2sgb3V0IG9mIG51bWFfc2V0X25vZGU6DQoNCjU3ICB2
b2lkIF9faW5pdCBpbml0X2NwdV90b19ub2RlKHZvaWQpDQo1OCAgew0KNTkgICAgICB1bnNpZ25l
ZCBpbnQgaTsNCjYwICAgICAgbm9kZWlkX3Qgbm9kZTsNCjYxICANCjYyICAgICAgZm9yICggaSA9
IDA7IGkgPCBucl9jcHVfaWRzOyBpKysgKQ0KNjMgICAgICB7DQo2NCAgICAgICAgICB1MzIgYXBp
Y2lkID0geDg2X2NwdV90b19hcGljaWRbaV07DQo2NSAgICAgICAgICBpZiAoIGFwaWNpZCA9PSBC
QURfQVBJQ0lEICkNCjY2ICAgICAgICAgICAgICBjb250aW51ZTsNCjY3ICAgICAgICAgIG5vZGUg
PSBhcGljaWQgPCBNQVhfTE9DQUxfQVBJQyA/IGFwaWNpZF90b19ub2RlW2FwaWNpZF0gOiBOVU1B
X05PX05PREU7DQo2OCAgICAgICAgICBpZiAoIG5vZGUgPT0gTlVNQV9OT19OT0RFIHx8ICFub2Rl
X29ubGluZShub2RlKSApDQo2OSAgICAgICAgICAgICAgbm9kZSA9IDA7DQo3MCAgICAgICAgICBu
dW1hX3NldF9ub2RlKGksIG5vZGUpOw0KNzEgICAgICB9DQo3MiAgfQ0KDQoNCj4gPg0KPiA+IFNp
Z25lZC1vZmYtYnk6IFdlaSBDaGVuIDx3ZWkuY2hlbkBhcm0uY29tPg0KPiA+IC0tLQ0KPiA+ICAg
eGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgfCAgMSArDQo+ID4gICB4ZW4vYXJjaC9hcm0vbnVt
YS5jICAgICAgICB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIHhl
bi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwgIDIgKysNCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS14
ODYvbnVtYS5oIHwgIDEgLQ0KPiA+ICAgeGVuL2luY2x1ZGUveGVuL251bWEuaCAgICAgfCAgMSAr
DQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC9hcm0vbnVtYS5jDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL01ha2VmaWxlIGIveGVuL2FyY2gvYXJtL01ha2VmaWxl
DQo+ID4gaW5kZXggM2QzYjk3YjViNC4uNmUzZmI4MDMzZSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4v
YXJjaC9hcm0vTWFrZWZpbGUNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4gPiBA
QCAtMzUsNiArMzUsNyBAQCBvYmotJChDT05GSUdfTElWRVBBVENIKSArPSBsaXZlcGF0Y2gubw0K
PiA+ICAgb2JqLXkgKz0gbWVtX2FjY2Vzcy5vDQo+ID4gICBvYmoteSArPSBtbS5vDQo+ID4gICBv
YmoteSArPSBtb25pdG9yLm8NCj4gPiArb2JqLSQoQ09ORklHX05VTUEpICs9IG51bWEubw0KPiA+
ICAgb2JqLXkgKz0gcDJtLm8NCj4gPiAgIG9iai15ICs9IHBlcmNwdS5vDQo+ID4gICBvYmoteSAr
PSBwbGF0Zm9ybS5vDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9udW1hLmMgYi94ZW4v
YXJjaC9hcm0vbnVtYS5jDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4gPiBpbmRleCAwMDAw
MDAwMDAwLi4xZTMwYzViYjEzDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL3hlbi9hcmNo
L2FybS9udW1hLmMNCj4gPiBAQCAtMCwwICsxLDMxIEBADQo+ID4gKy8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wDQo+ID4gKy8qDQo+ID4gKyAqIEFybSBBcmNoaXRlY3R1cmUgc3Vw
cG9ydCBsYXllciBmb3IgTlVNQS4NCj4gPiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDIx
IEFybSBMdGQNCj4gPiArICoNCj4gPiArICogVGhpcyBwcm9ncmFtIGlzIGZyZWUgc29mdHdhcmU7
IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vciBtb2RpZnkNCj4gPiArICogaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMN
Cj4gPiArICogcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24uDQo+ID4g
KyAqDQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLA0KPiA+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdp
dGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPiA+ICsgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+ID4gKyAq
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+ID4gKyAqDQo+
ID4gKyAqIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlDQo+ID4gKyAqIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiBJZiBub3Qs
IHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uDQo+ID4gKyAqDQo+ID4gKyAqLw0K
PiA+ICsjaW5jbHVkZSA8eGVuL2luaXQuaD4NCj4gPiArI2luY2x1ZGUgPHhlbi9ub2RlbWFzay5o
Pg0KPiA+ICsjaW5jbHVkZSA8eGVuL251bWEuaD4NCj4gPiArDQo+ID4gK3ZvaWQgbnVtYV9zZXRf
bm9kZShpbnQgY3B1LCBub2RlaWRfdCBuaWQpDQo+ID4gK3sNCj4gPiArICAgIGlmICggbmlkID49
IE1BWF9OVU1OT0RFUyB8fA0KPiA+ICsgICAgICAgICFub2RlbWFza190ZXN0KG5pZCwgJm5vZGVf
b25saW5lX21hcCkgKQ0KPiA+ICsgICAgICAgIG5pZCA9IDA7DQo+ID4gKw0KPiA+ICsgICAgY3B1
X3RvX25vZGVbY3B1XSA9IG5pZDsNCj4gPiArfQ0KPiBJIHRoaW5rIG51bWFfc2V0X25vZGUoKSB3
aWxsIHdhbnQgdG8gYmUgaW1wbGVtZW50ZWQgaW4gY29tbW9uIGNvZGUuDQo+IA0KDQpTZWUgbXkg
YWJvdmUgY29tbWVudC4gSWYgeDg2IGlzIG9rLCBJIHRoaW5rIHllcywgd2UgY2FuIGRvIGl0DQpp
biBjb21tb24gY29kZS4NCg0KPiA+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9hc20tYXJtL251
bWEuaCBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gaW5kZXggYWI5YzRhMjQ0OC4u
MTE2MmM3MDJkZiAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0K
PiA+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oDQo+ID4gQEAgLTI3LDYgKzI3LDgg
QEAgZXh0ZXJuIG1mbl90IGZpcnN0X3ZhbGlkX21mbjsNCj4gPiAgICNkZWZpbmUgbm9kZV9zdGFy
dF9wZm4obmlkKSAobWZuX3goZmlyc3RfdmFsaWRfbWZuKSkNCj4gPiAgICNkZWZpbmUgX19ub2Rl
X2Rpc3RhbmNlKGEsIGIpICgyMCkNCj4gPg0KPiA+ICsjZGVmaW5lIG51bWFfc2V0X25vZGUoeCwg
eSkgZG8geyB9IHdoaWxlICgwKQ0KPiANCj4gSSB3b3VsZCBkZWZpbmUgaXQgaW4geGVuL251bWEu
aCBzbyBvdGhlciBhcmNoIGNhbiB0YWtlIGFkdmFudGFnZSBvdCBpdC4NCj4gQWxzbywgcGxlYXNl
IHVzZSBhIHN0YXRpYyBpbmxpbmUgaGVscGVyIHNvIHRoZSBhcmd1bWVudHMgYXJlIGV2YWx1YXRl
ZC4NCj4gDQoNCk9rDQoNCj4gPiArDQo+ID4gICAjZW5kaWYNCj4gPg0KPiA+ICAgI2VuZGlmIC8q
IF9fQVJDSF9BUk1fTlVNQV9IICovDQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14
ODYvbnVtYS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmgNCj4gPiBpbmRleCBmOGU0ZTE1
NTg2Li42OTg1OWIwYTU3IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbnVt
YS5oDQo+ID4gKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9udW1hLmgNCj4gPiBAQCAtMjIsNyAr
MjIsNiBAQCBleHRlcm4gbm9kZWlkX3QgcHhtX3RvX25vZGUodW5zaWduZWQgaW50IHB4bSk7DQo+
ID4gICAjZGVmaW5lIFpPTkVfQUxJR04gKDFVTCA8PCAoTUFYX09SREVSK1BBR0VfU0hJRlQpKQ0K
PiA+DQo+ID4gICBleHRlcm4gaW50IHNyYXRfZGlzYWJsZWQodm9pZCk7DQo+ID4gLWV4dGVybiB2
b2lkIG51bWFfc2V0X25vZGUoaW50IGNwdSwgbm9kZWlkX3Qgbm9kZSk7DQo+ID4gICBleHRlcm4g
bm9kZWlkX3Qgc2V0dXBfbm9kZSh1bnNpZ25lZCBpbnQgcHhtKTsNCj4gPiAgIGV4dGVybiB2b2lk
IHNyYXRfZGV0ZWN0X25vZGUoaW50IGNwdSk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2lu
Y2x1ZGUveGVuL251bWEuaCBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiBpbmRleCAyNThh
NWNiM2RiLi4zOTcyYWE2YjkzIDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9udW1h
LmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oDQo+ID4gQEAgLTcwLDYgKzcwLDcg
QEAgZXh0ZXJuIGludCB2YWxpZF9udW1hX3JhbmdlKHU2NCBzdGFydCwgdTY0IGVuZCwNCj4gbm9k
ZWlkX3Qgbm9kZSk7DQo+ID4NCj4gPiAgIGV4dGVybiB2b2lkIG51bWFfaW5pdF9hcnJheSh2b2lk
KTsNCj4gPiAgIGV4dGVybiB2b2lkIG51bWFfaW5pdG1lbV9pbml0KHVuc2lnbmVkIGxvbmcgc3Rh
cnRfcGZuLCB1bnNpZ25lZCBsb25nDQo+IGVuZF9wZm4pOw0KPiA+ICtleHRlcm4gdm9pZCBudW1h
X3NldF9ub2RlKGludCBjcHUsIG5vZGVpZF90IG5vZGUpOw0KPiA+ICAgZXh0ZXJuIGJvb2wgbnVt
YV9vZmY7DQo+ID4gICBleHRlcm4gaW50IG51bWFfZmFrZTsNCj4gPg0KPiA+DQo+IA0KPiBDaGVl
cnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

