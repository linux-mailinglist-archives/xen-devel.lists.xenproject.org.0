Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 250103FA315
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 04:12:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174137.317691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnpV-0007OX-3d; Sat, 28 Aug 2021 02:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174137.317691; Sat, 28 Aug 2021 02:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJnpU-0007MU-WB; Sat, 28 Aug 2021 02:12:20 +0000
Received: by outflank-mailman (input) for mailman id 174137;
 Sat, 28 Aug 2021 02:12:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sP14=NT=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJnpT-0007MK-Gm
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 02:12:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.73]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fee20732-15bc-4b43-8338-e65dd46575cc;
 Sat, 28 Aug 2021 02:12:16 +0000 (UTC)
Received: from AM6P195CA0045.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::22)
 by AM0PR08MB3139.eurprd08.prod.outlook.com (2603:10a6:208:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Sat, 28 Aug
 2021 02:12:13 +0000
Received: from VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::c3) by AM6P195CA0045.outlook.office365.com
 (2603:10a6:209:87::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18 via Frontend
 Transport; Sat, 28 Aug 2021 02:12:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT004.mail.protection.outlook.com (10.152.18.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Sat, 28 Aug 2021 02:12:13 +0000
Received: ("Tessian outbound 5918cb94a4b5:v103");
 Sat, 28 Aug 2021 02:12:13 +0000
Received: from c19a3d6bbbb2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D883A314-D9F1-4CE3-88D0-E67DC130359B.1; 
 Sat, 28 Aug 2021 02:12:02 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c19a3d6bbbb2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Sat, 28 Aug 2021 02:12:02 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBBPR08MB4490.eurprd08.prod.outlook.com (2603:10a6:10:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Sat, 28 Aug
 2021 02:12:00 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Sat, 28 Aug 2021
 02:12:00 +0000
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
X-Inumbo-ID: fee20732-15bc-4b43-8338-e65dd46575cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYaJYZhVT+uK0WbVMA8in17R1HTG2AimbO8+pYHkxBg=;
 b=UUxBRdg8M+pxyfzGJZq6WwZDaZ59AKgI2VhtSoFe6WhlU3oFIeRTInkSE5Ed5p1gwddJB0IK7h3TFvxLZpKVH8R5YRFIcfA3QVZovftakvyv2L0FIin1iBoaWU8scRt5VMKjqLFvx9Tu2t21U/OLAmmACz8nhtdJP/40/Qc6Ks4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=COvEjyyHjGpCyybrYz0AyqfHCEyVpbsHe9XBalBtXBkDr13a8Gtu1Jc78AKQw0XoB/KAvzh2junVnwU2NqIGIKXUFtpUH8FovIFEI60FhHKGnXlQUKlB2EdKk+MPWv/hm3jt8/4qLrskVBEJDkuppUeNo2NGdLb550aviB8RpDpRl1iBUgDDLV2vo/c9LZ22IUIk46IV+E04M1D4+aD5S6NGaUyp6cRifFQEvMiFWXWm1zTHdm30+b+huRwK5sDgSXSdRWOS/1nq2hxCjVHF/FXVqsLrPLuKdwrU+653YGWVI6EyqKaRe35bSMqKXO6i0bYSVdHb0mWSQnK3ZzbPCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYaJYZhVT+uK0WbVMA8in17R1HTG2AimbO8+pYHkxBg=;
 b=IWB0u8D6DDyGeKU1DLWlqUWALzfmEgbAsr3UJS1o0TI5xKeufw5T8S+2m7uGjHRoyZKGT6p05mGlA61VyM/yGZ33rXmu2+FCVZmWcivI2vab5zcWQtK5xT0gq3dKr5OnBeHNskOhUth6I8UF3U8vWUU981DYgpw4IWhqGdDOd4gbCT6jXSFIxP7WQ5mTBtRSsJrQVTM6F6Mkrul9v6oOuUVAkal82NfA7rCc1WUOSrHEPPG4Vt1w8Knrm6lRlK8bNOzTNzKR1rKXVWno90rScPURTAxY1TCGhmsCLEmzQNRYGvz2LsXhngflbYvYIlCUOIU/ZqNWu+zQgqQ09wuF3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYaJYZhVT+uK0WbVMA8in17R1HTG2AimbO8+pYHkxBg=;
 b=UUxBRdg8M+pxyfzGJZq6WwZDaZ59AKgI2VhtSoFe6WhlU3oFIeRTInkSE5Ed5p1gwddJB0IK7h3TFvxLZpKVH8R5YRFIcfA3QVZovftakvyv2L0FIin1iBoaWU8scRt5VMKjqLFvx9Tu2t21U/OLAmmACz8nhtdJP/40/Qc6Ks4=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
Thread-Topic: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
Thread-Index: AQHXjptUu77aQcXH00SSr7Sat0uCZquHfl+AgADIgbA=
Date: Sat, 28 Aug 2021 02:12:00 +0000
Message-ID:
 <DB9PR08MB6857245E2EA519514AA4D8A49EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-35-wei.chen@arm.com>
 <b58424cc-cce9-58d5-5f22-6d8234fa38ad@xen.org>
In-Reply-To: <b58424cc-cce9-58d5-5f22-6d8234fa38ad@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: E3CA6E5A9C32CE4FBFDB4DA5581E3E3C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 191bb85c-23a8-4a81-5b00-08d969c94029
x-ms-traffictypediagnostic: DBBPR08MB4490:|AM0PR08MB3139:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB31394111BF1BD98E9E0DCF339EC99@AM0PR08MB3139.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hh+bAs9MGV8E8z+QVu3Ugq9FjxE9Cw4slICyPTu2nKBGB+Ro/kZdiU2LrvFBYV8ty2Qt+J+Dykm4U+JAISt0wupcMzHeP02k6qKEBHmjmb/DrSx2kDartzKe8CASRLw0sOYu5nlkwgkztSdd0evlnRvr+ZCFxrAgkncW1qVDIK+wagsDVgBOYx8P1+c60sCRqWdoW3Zv98xuQlKbkKX8ezjXinXMvpFhxz+inrRVrnpbZek5yGwlONv0RNTJ8hDTB5MKYE6/qmuMyi3VbBsNaGVu4SDJRZ0KPwFEhyy00URY27WxVh/ZpN52IWFL1oO7AzdRO+0NIo7fsIzLCDEmnZjbWHI9tUt8yCxhyIZ+lUq8ND0Hruvmv6QZgkHqViuNe3mjMvtDCS/gffDUL8reRzLJYxBU7dVTO1FdRvsVcA5zjZQyMNszY/Pjb+LFtfj87n0txK10iVM8u2xISneg2IxNKdfiiPRezspw+rJfeDDa0gWD57XCRInxWCDOZHMEO2D6czcgZWxWp0xfQtAspXrFnBkNvECT6Ix8CMbcpz+E5lqZI5Qap4+f+eZFu3A4wPi+iMv9qqzocBFX/J2E2mBOQXb7LAZ2QG+QCwIyU6g2O6cl0iDf30zXRzav8I0aVukjkYMHh4UQSvMCTg+0bpmeOQRrsnOiQ01ObdDkY7Ne4USj25ehWzLjkMiLTbZrerONydF0C8y5K+jfn55xUQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(122000001)(26005)(38100700002)(53546011)(66946007)(186003)(8676002)(66476007)(71200400001)(83380400001)(5660300002)(76116006)(66556008)(66446008)(64756008)(9686003)(52536014)(4326008)(6506007)(508600001)(316002)(38070700005)(33656002)(55016002)(7696005)(8936002)(2906002)(110136005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RjBiMFB0ZWR3dmtWVUdldUhkZVpOQVZMMmNUYVNlZlBnRTFUK0duWE9EbEdM?=
 =?utf-8?B?cTNram5sTGFuQmg4UitRSjg0ZEFsTTIvUUFCUzJVWEJINWx3K2owK0FpSGVx?=
 =?utf-8?B?TGdqRk90TkRPZ3E0MERma211QUhqQ1dKTnhtaVBJWkp0ZDlUN09qc0pNcUN4?=
 =?utf-8?B?cXllYjJLcUlHQWdnK2xKNVd6eGJ6bjJHRDFSSGxsdGVYOWFXeHptYWcwV1RJ?=
 =?utf-8?B?TjBYVnpJUVp0dXIrdkVMVUdoME5nZk8yTWd3Z0FydWlzaVBuZVlIYVFrUzlo?=
 =?utf-8?B?Wnh6YktxT1h5S3AxWjRLQURFSEV2SitPUnZHK1VQQzVtbHhFU3VGUnlUTU54?=
 =?utf-8?B?OEc4ZkRzRzdYNmVLMmVzMHZhK2JZZXl1aGdoV09RdlI0a2lMRGxZMlhzTkZX?=
 =?utf-8?B?WmpSTzBJREdKQmhyaDZKTmFTNUw3ckdrbnFGY3V4QWFJT1dGZE1ZamE4Q1Ry?=
 =?utf-8?B?blphbHNITGQ2YzJNVEcvUzdsN2kyQndtVVB5QjRncjlCSnlCcWZpVExWOS9N?=
 =?utf-8?B?MElIRTZMTmQ0eko4aVF3dkxlVUJPQVFVYkMrM1FiemFDQ2tiRE9zQUtkMkF4?=
 =?utf-8?B?TUZKdjJGdGV4c0pyclBwaDRUY1hFVTJGVk9JMWMxcUp0ZkM1QVpiMk96Uysx?=
 =?utf-8?B?UlVLTGRtakNDRXhBM3dNbUljWnZzREg0ZWxIdFJkRWo5S1lrMURZaDBUMkZ5?=
 =?utf-8?B?T2U2Njd3S2doZEI4eHQxSGZSemRtYmNXaXBXcXZhb2NlTnJvR1FPR0lpT0ZT?=
 =?utf-8?B?NlNsN2JvWXdIM204K095Vjh4UVR4TUFTSnYvK1FwNHBiOFVQZlNyVFlxRnI5?=
 =?utf-8?B?SklWdmo2c3pUL3RFamp5RmUvbUMrOWNMTExTNG9xZTJZeGdJak9kS2R0dXRh?=
 =?utf-8?B?S2JtTmNCVWRjQVczQy9hcFcydDRJZlFBQkEvVkZxd2JvTWl1Z2pKc2dFbm5l?=
 =?utf-8?B?dVhmQzNXTnVsdE5DM3hIV20yNUhWRFlyTFR3NWNFQmppaEZPYzBYZ0NUN0lw?=
 =?utf-8?B?Rm1NUFNxRUFuVTdiT1NJMG5tR0k2ekhtMGkwUXZJVmVVajluWW91TmJPWk5C?=
 =?utf-8?B?bkdZMjJCcnNxYVNCRE9TUVIxL0t4bW1KU3poVWphcW0zY0JoRWg4R1dsYksz?=
 =?utf-8?B?U1hoTzUxKzYzZDNBc3gxdUpBL1Y5SEd2S3NLaWR5T2xlYXRlb3dNV2tSaXJq?=
 =?utf-8?B?SG40aDc0UllxcFIxQXdmL2VIdU82aFhGaGJPYkVRM3FuQnRmdkVrUDNjaEtQ?=
 =?utf-8?B?WmFKSVI3MDU2YVRRVFlUOWxaZE83OFl5NkNScFo3RndsVzZxN1BGTmFOMW1T?=
 =?utf-8?B?MjJaUFdrZEZET3NvUnptVlZ0c0tVWklFVG1aT29Mb0JSTlFWUUh2RlVnbUZq?=
 =?utf-8?B?c2V6RjVVR0l6K0xYeWF0Tk9WQ2hLVjRDQkZPMHRBZmRneDBldjh4Q09mb2RL?=
 =?utf-8?B?K3lvVjYvVkZpdW1rZlVKeVpZSXgvM2VBWUJHWml6WWtrVEFETmFFL2dNWUE5?=
 =?utf-8?B?ajdCcEcrWVoxTFE5bDVQYlRTODhSQlN1Mk1aT1c0Y3ZEOTRiRXplUHBWM0Z2?=
 =?utf-8?B?NnhhNjVoQjB0YjJSbHZldWs3V0kxQS9SWStLbjRKd2VFYTBHMVMyMElwSjAv?=
 =?utf-8?B?TVRkRUdYOHZtQyswNVZFdlRLWXJRdGlRWHpoU0dJSE00azdXM0VlQUg4UUMv?=
 =?utf-8?B?WkIzb25pZjlBS0txWkxoc2JDSHZZVXZHU3pXOXRqS1pCMkNGZ28xSytyUVFr?=
 =?utf-8?Q?DZxbpN0QMd9z9tufhnHesBd6ZF10wde6bgzj06O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4490
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	22b9b1bf-4ad3-4b57-c364-08d969c93864
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vfc1bdi/PGkySI+oisZ475Sm12KMfA5RMa1tXIY62WkEYdpbQg2c0jwnhJVcEGqnW78vMQLDQG0DiM5mU3Vu1jOsN2O2BPyhdhqdgxaVDzMkS0A8xwhvYVXlk2spi7ZreblX3O72Pjg0dhb7MKcGv4Gkzji8bWu/ynAKEATgEAsDQJKnFQpNApTqx+Ol0O2sQ8RNpLDtaRWn2ccIiz+j/rM7ypmpN+jWnGfmgm6MHkymHpBt+jl3vjKP73QZlVMnethFvMRDEDnzpYxhiGHYLyL3Tmhpcucl6nFUSuytDb0xW1OC1DpVqZzHmBn3i8ye6ee6bKcD+PtWQfGyWgdZJiBO5s4Xs0eYDlEpILkpFWLsZRRCcDEzYeOX9AERbSeDdGUerB6DE1lCknmVEwxSBDIjDyvk4zbu7DclAwDnwk/qIOFrDWLVMQ/8vIUQxsK4qkM0ly5DV03Mw4hli5GgCAZBpC1ARARflm8P50Y2hLutS3TU30nsKQmJ8GkYvMAANU2Sr1ETQkOWrSNtm+zrJ34OhDAXZ5BdE89nTq6W94S/UDCw6PLTG4GCI6Jagg9KSvwBxzx+AQjIhFhxbjIlv7GSXWx8T6Uo3ZaDcBTRP5SkkoUAFiJkaqKGkEGeGFIovKgjb1w6oROzB9FINzwAS98MrfpiHLwDi+7HqGCyfmbESOoW8Q6PyD3lbMogKE/BqH56OyZtKx24eZIvchRIaw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(33656002)(55016002)(52536014)(70206006)(336012)(4326008)(70586007)(186003)(356005)(8936002)(83380400001)(26005)(8676002)(508600001)(9686003)(82310400003)(110136005)(36860700001)(47076005)(53546011)(81166007)(86362001)(2906002)(5660300002)(7696005)(316002)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2021 02:12:13.4351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 191bb85c-23a8-4a81-5b00-08d969c94029
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3139

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjfml6UgMjI6MTQN
Cj4gVG86IFdlaSBDaGVuIDxXZWkuQ2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGljaEBzdXNlLmNvbQ0K
PiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPg0KPiBTdWJq
ZWN0OiBSZTogW1hFTiBSRkMgUEFUQ0ggMzQvNDBdIHhlbjogbW92ZSBudW1hX3NjYW5fbm9kZXMg
ZnJvbSB4ODYgdG8NCj4gY29tbW9uDQo+IA0KPiBIaSBXZWksDQo+IA0KPiBPbiAxMS8wOC8yMDIx
IDExOjI0LCBXZWkgQ2hlbiB3cm90ZToNCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvYXNt
LXg4Ni9hY3BpLmggYi94ZW4vaW5jbHVkZS9hc20teDg2L2FjcGkuaA0KPiA+IGluZGV4IDMzYjcx
ZGZiM2IuLjIxNDA0NjFmZjMgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNtLXg4Ni9h
Y3BpLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20teDg2L2FjcGkuaA0KPiA+IEBAIC0xMDEs
OSArMTAxLDYgQEAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgYWNwaV93YWtldXBfYWRkcmVzczsNCj4g
Pg0KPiA+ICAgI2RlZmluZSBBUkNIX0hBU19QT1dFUl9JTklUCTENCj4gPg0KPiA+IC1leHRlcm4g
czggYWNwaV9udW1hOw0KPiA+IC1leHRlcm4gaW50IG51bWFfc2Nhbl9ub2Rlcyh1NjQgc3RhcnQs
IHU2NCBlbmQpOw0KPiA+IC0NCj4gPiAgIGV4dGVybiBzdHJ1Y3QgYWNwaV9zbGVlcF9pbmZvIGFj
cGlfc2luZm87DQo+ID4gICAjZGVmaW5lIGFjcGlfdmlkZW9fZmxhZ3MgYm9vdHN5bSh2aWRlb19m
bGFncykNCj4gPiAgIHN0cnVjdCB4ZW5wZl9lbnRlcl9hY3BpX3NsZWVwOw0KPiA+IGRpZmYgLS1n
aXQgYS94ZW4vaW5jbHVkZS94ZW4vbnVtYS5oIGIveGVuL2luY2x1ZGUveGVuL251bWEuaA0KPiA+
IGluZGV4IDQ5MDM4MWJkMTMuLmI5YjVkMWFkODggMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1
ZGUveGVuL251bWEuaA0KPiA+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi9udW1hLmgNCj4gPiBAQCAt
ODEsOCArODEsMTAgQEAgZXh0ZXJuIHZvaWQgYmFkX3NyYXQodm9pZCk7DQo+ID4gICBleHRlcm4g
dm9pZCBudW1hX2luaXRfYXJyYXkodm9pZCk7DQo+ID4gICBleHRlcm4gdm9pZCBudW1hX2luaXRt
ZW1faW5pdCh1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwgdW5zaWduZWQgbG9uZw0KPiBlbmRfcGZu
KTsNCj4gPiAgIGV4dGVybiB2b2lkIG51bWFfc2V0X25vZGUoaW50IGNwdSwgbm9kZWlkX3Qgbm9k
ZSk7DQo+ID4gK2V4dGVybiBpbnQgbnVtYV9zY2FuX25vZGVzKHU2NCBzdGFydCwgdTY0IGVuZCk7
DQo+IA0KPiBBRkFJQ1QsIGJ5IHRoZSBlbmQgb2YgdGhlIHNlcmllcywgdGhlIGZ1bmN0aW9uIGlz
IG9ubHkgY2FsbGVkIGJ5IHRoZQ0KPiBjb21tb24gY29kZS4gU28gdGhpcyBzaG91bGQgYmUgc3Rh
dGljLg0KPiANCg0KT0sNCg0KPiBDaGVlcnMsDQo+IA0KPiAtLQ0KPiBKdWxpZW4gR3JhbGwNCg==

