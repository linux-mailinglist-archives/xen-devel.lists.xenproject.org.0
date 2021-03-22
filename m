Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4791343C05
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 09:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100041.190482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOGCH-0006nU-Pg; Mon, 22 Mar 2021 08:46:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100041.190482; Mon, 22 Mar 2021 08:46:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOGCH-0006n5-Lp; Mon, 22 Mar 2021 08:46:01 +0000
Received: by outflank-mailman (input) for mailman id 100041;
 Mon, 22 Mar 2021 08:46:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JfP=IU=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lOGCG-0006n0-H5
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 08:46:00 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1e::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88ff52de-bf2f-4ab0-9fcf-915ae4d7a72d;
 Mon, 22 Mar 2021 08:45:58 +0000 (UTC)
Received: from AS8PR04CA0047.eurprd04.prod.outlook.com (2603:10a6:20b:312::22)
 by AM6PR08MB4167.eurprd08.prod.outlook.com (2603:10a6:20b:ad::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:45:53 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::7a) by AS8PR04CA0047.outlook.office365.com
 (2603:10a6:20b:312::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Mon, 22 Mar 2021 08:45:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 08:45:52 +0000
Received: ("Tessian outbound eae0c21066a4:v87");
 Mon, 22 Mar 2021 08:45:52 +0000
Received: from 3c02ffebfa19.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E5AACAEC-A6BD-44BE-B5E4-C4D60C82E6ED.1; 
 Mon, 22 Mar 2021 08:45:46 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3c02ffebfa19.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 22 Mar 2021 08:45:46 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DB9PR08MB6442.eurprd08.prod.outlook.com (2603:10a6:10:259::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 08:45:45 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::5959:35df:3647:b78d%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 08:45:45 +0000
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
X-Inumbo-ID: 88ff52de-bf2f-4ab0-9fcf-915ae4d7a72d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT0AObk4Ev3tKcCe1mU2Cya2/nyvJkUnm7haIPLQ4dA=;
 b=NeBgjK00G6AHaHCt7Hgo5+rmQDSw5ZUce8cJXuBj++pMOzwbPLd7atVE4Ht2doRKYwpvEETgL9YrZPWEpMbx3w2IruIpBUFBLN5zZV8nmX92XpUrGNtwRQurYehinl8mk7IUKLOtIdmjpmS3aiYS36djnqd5mPrNYttnqWhIjZk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: fa8cae128acfbca1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NPH327ymgBCPwZhXs4OcfwHcLLgRfN9cKIJmQa3juBAM43uRXJG+rnY3+/WN1ki8eBSrO67g3RT/6y2uckz7KBrIj5o2+beJDFXRRDjFOnc8+EgDzke0G9koEKopZ/UGo6y/PtBWdJy/Z6jLKKLXl4Fr7tv/Aab77VFz0qOTSLEwqTYaN7zfbuCl//s7SdYiVp6jTVtniwYImJLeXQEQzGk2yX46HKUyjdrZzslBrSUrPSMDM4J15bXHznFPrUF5Xn0iDm92Z4nlH7YLK8m6lIzNwnX+pMa8rQgoxl90EI4QQGGd5wM2x/uSyhKFORiE5Tcy9u9vpnsZNDeLAw1dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT0AObk4Ev3tKcCe1mU2Cya2/nyvJkUnm7haIPLQ4dA=;
 b=TBBDS6Vy7QzVsFa+3ZyL1uIIG+4ICxT9Ic855dSswJjK4qySLFLfWoUpcuC4+0xYQjp/A/GsC70fY8LeMaXkqFsPw4E7JrOCSlkM/XuIcN6sV14coAR4ioVC8pyMdf9wy01JvB5rivZliePEPX05Cg8torZCbVKmidkdQ1KYoKXERIu3PbABRTbcejo9yiNzut3MctmtjX63hhGGV4XSlsXrtpsIUqsXdnYJBfRWZnGEmbwhhksSQpwcRuQNIupuoPRLZ4F4AIVOU83lB8CF4pwp33Ja6lRewDbyQOmSdktoL5hz/qVusB/oVXFe+KvYeRNyKQp5q6JCPEV4mfL81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NT0AObk4Ev3tKcCe1mU2Cya2/nyvJkUnm7haIPLQ4dA=;
 b=NeBgjK00G6AHaHCt7Hgo5+rmQDSw5ZUce8cJXuBj++pMOzwbPLd7atVE4Ht2doRKYwpvEETgL9YrZPWEpMbx3w2IruIpBUFBLN5zZV8nmX92XpUrGNtwRQurYehinl8mk7IUKLOtIdmjpmS3aiYS36djnqd5mPrNYttnqWhIjZk=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
Thread-Topic: [PATCH 5/5] xen/arm: smmuv1: Intelligent SMR allocation
Thread-Index: AQHXFRE3FfFdAlAZ8Eu9+88zMBZ+gqqGwk6AgAAuSQCABea+AIAC7gYA
Date: Mon, 22 Mar 2021 08:45:44 +0000
Message-ID: <17645655-7580-4E22-913E-4D7D919CB7AD@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
 <789abfb57568dcbaba122ea9b68c627e6c9707c4.1615312254.git.rahul.singh@arm.com>
 <299c8294-5f76-2fd6-85ec-d20c0b99368b@xen.org>
 <1C808D23-E8F3-4888-86AD-C37FCBAAD0D1@arm.com>
 <cda80b1a-d9f4-bf95-f5ed-ab0a46b8c618@xen.org>
In-Reply-To: <cda80b1a-d9f4-bf95-f5ed-ab0a46b8c618@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7cd4d50e-3f1f-49b5-d950-08d8ed0ee6c2
x-ms-traffictypediagnostic: DB9PR08MB6442:|AM6PR08MB4167:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4167290B36777DFFA47DEE54FC659@AM6PR08MB4167.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3383;OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6JY2zNiJK3Xd8FoAvUTpP5t0hxnrU7hHymHfWn1+pxNsVXoeu4g/WAXia5zVkDrr8f5vHuSMGnpLK86uGddh/FMqMrWTqIa3RZC4hI7KzBzwBB7SrWddQJVnmteW8OAQEQu0Qb831tbXaPLldZGcFEPlyHJPMsN//dIaIJ9kV61vcqUIFomDR91y1excx7DQnsq//s1T0ZdnVLX3WK0kS6iiyZZM5by7gNNcM9iCE16WvfO/iok+yWjXB/PEetBmK/54HnWG4raJX7z6eaF+BIyyQrjOvBAEMnrF1uJpv21fRSptf0NpHEMbjwAYWmtof7a+S+Od9HtVqR2bSx2lRz4byvfZvWa0cs24V69Nf+ecMD+PmesNjmfysROMTQRyT9VUfmhEyyBKWcJbjmE7t2JYZGs5oQ7NAIs8JaAMe+NuxdtIVurcs2MVSijZ5YVhFwMPldXQLoNBOAKdgkCepjgm1NJ0SxO/R13SZ3HQx/u64lIVlFiEargWWjsSpqW/O8g4hi8inH0wna3WxSgj1Zv1F55LSCo0lhq91IkdTLV3ryWMWftk42yBbIUyh+WjTyajN3sWuETTuwCLcOPIhOuWEDgIhpZG2Y0moh/GVl0HKFYA8Fc14rsxQSK+/N1eNKIs8+iEzicyDw0Rsc9+OOU1Fx3EmJ4+bvMKTqnZm4MHP1cUPeXAk5SnmG3s74kaMYz/zxcImHGJQGI0r6E2ZQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(71200400001)(316002)(8676002)(478600001)(26005)(38100700001)(33656002)(2616005)(5660300002)(6916009)(186003)(4326008)(54906003)(8936002)(6486002)(86362001)(2906002)(36756003)(76116006)(91956017)(6512007)(66476007)(66556008)(66946007)(66446008)(64756008)(53546011)(6506007)(83380400001)(3714002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?qpXZ6Y1u+i+u9EIECMWVG2hzkkYeGJkcyC3d2VL3IfqfWwsunMQqO8Tq4mVL?=
 =?us-ascii?Q?UYp1V5MGSwWnod4PrHBKf+al8DJbbcX7orurTB5X1atBFDqT/KD3NUDRzDov?=
 =?us-ascii?Q?Ruhex+gtufgwBpUfAS56zu5YGyNLifpAhon0RtZZeIKZF3awQSr92e1jwBGA?=
 =?us-ascii?Q?IOS0LQIIf8S6wDDH2cvaLKlpP37xHT+U2fplEljLAJ1k54MBOJ0e15zthM1z?=
 =?us-ascii?Q?nx2Yc1Dc0vYbc0fIGyj7vrOvB/r8w32egkJdHxChKqvyEW3mq6IrbfLsq0lm?=
 =?us-ascii?Q?pppoRxqYt5gJ/ArVA0h9k6jChwglsOZOpEYFA+XxuDUoEJy7fZYiU/cTpUAd?=
 =?us-ascii?Q?Y8hlG3XgNd1BXEBDpJyjGdvdHALhyyCr5+6dFb7EwvZjFGzOYYNeuystz3sN?=
 =?us-ascii?Q?ciqB1bsugHRonSsGRe0s8pNLpMcuGLTbEBXYpsSYeqeWMoEU7WO05+p4Zz95?=
 =?us-ascii?Q?ueMXr8idTt+6JwT2MR487s8mG3KucPiDwW71mfs1dltQmIJfoN7836zW0Rsa?=
 =?us-ascii?Q?B2BLCPQi8DC2+KA8GII8+Tbb/gJ86aHUgRdOSkmcjO8iCgcHRsVA0bGDzlxw?=
 =?us-ascii?Q?aBCId+D8N08WOqmpi8iM0c5ZG8N0MaSkCQL11+dyNrX/1mFPQz9jMAX4DhR5?=
 =?us-ascii?Q?HcWDsFtXsYb4IBBjr6sDlZAUQatXxHyz1k3tPOEPuL9bwdt3/JxGhCcNenR3?=
 =?us-ascii?Q?lsJp6fKclXv8AFKOPr1Y9sOOHxX3OKHiDenWN59mRvaut6em7iyARlbSSsj5?=
 =?us-ascii?Q?ctbCfO9nwZvQNlnP59qrbYLB29mXwdgSfW3SyuSoz+nB/hRxYrsxPRy/k3mN?=
 =?us-ascii?Q?XYUpXsVFe6dAqRr+K8kVanUhQ0aMaEahwieo0R+FRegv31CEoyXSL4DgjTgY?=
 =?us-ascii?Q?nKvxOHzAyzPpX4CjByLtlhpZ60iqUHSV4LgM7EoA/R0ECiQ2AnxU+YnaOp2+?=
 =?us-ascii?Q?TOBPAXTn6hVouETChJzrgrl3nROYrmKd1UIccFU7bmErm1p54MuYCv2RpQjE?=
 =?us-ascii?Q?4y4zUFnYKgfYD2W6va52q7NK4e9yX3Ui1x9k/37vHuZrpz0i6Pdrdzm4fGDP?=
 =?us-ascii?Q?bB7TRg9PsA1hm75UTHCP58dBJXYXmbAc7s2TkgA45ltcLOROME5WfND5T2O+?=
 =?us-ascii?Q?UzepGvYqQQvMCg2jD3MLv2HQSzKBFlxgVdDSnn5R4wM45VCyRUo89/VGRVMx?=
 =?us-ascii?Q?jYn8Bk+ew36IWmmIs1xWfVXEAaoz750U8SL73RaRyNtJkLmzP/2iaoWWDKAx?=
 =?us-ascii?Q?aIjxT8RrvqepzW9P4w+jhaYfWGKy1TAwnb6T8a/2iEthtfVrzcTK4HPsvsGj?=
 =?us-ascii?Q?LWAX6HCGlJcZRbmAWv++9+tZ?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3EAD3F7D50C03642A3DCDDFF48042476@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6442
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c5810349-0265-4f68-078f-08d8ed0ee204
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TOAXCz2+c/9dia73sU+/kAav3h/V3KUQwl7GvvSyS+MqiFc5ioxStTOIKmgKXIP4sdh3ZAoOpSgTfhgll8uhZqqNqLVKkzsze8xR+17t83lXOUHhrKE5eYyJSvGe7QGrBhlUv3CtpLKM5I3X46Qqkq2H0duByuQ9qRKsiL1jShz9VRTp9kdVB8q6tgaZPhJGH4vldUFLkL4RuAeE3QdJ3jC40i/vmmOyt0kXN31FRfsFStivwLmAIVSdH1UvhbheGLufIbFu6arzSb9jROSWXuBoGPdslezdNR3UCo62VJZTnlp6SbAGaxXtuW1br/Ms8hplDCnVoqtyMrqdbad38CUX2LPQDSTy59Po+ZqsvzOoBm8+OVPcxPo7OPF5M3KxTjDFbU+3Qpm9vOrM++EW0x6MIGNPX2rauxphGXDDbxy91y2hZvqywE4ZCSFkEZnKSeY+BmKtXkFk7Vv3sDo5/xOGLZvShpJVIlIQHbnLSLCuV2vcWnHVKGiCeEqCPA0u0MciK8xOwPnWTFPvKYaHMONxhvUEfQRrwNMgOzcjXq9sZWo2MWGzFHQNvYJnZLJhxKBTmcieY64wvHk7AeEzwl2eMOGXmJvmFVHBFsshp09n47Pwb0Do63GfzLPkxwZn6s2nrrj9p6uQONVp1E0JoYRRrvfP28aFcfUoCk5WKhVW2lj/gVfaw65y2qsDvtky
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39860400002)(36840700001)(46966006)(316002)(478600001)(26005)(8676002)(6862004)(36860700001)(336012)(82740400003)(33656002)(5660300002)(2616005)(47076005)(54906003)(4326008)(186003)(8936002)(86362001)(2906002)(82310400003)(36756003)(70586007)(356005)(6512007)(107886003)(83380400001)(53546011)(6506007)(6486002)(81166007)(70206006)(3714002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 08:45:52.8430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd4d50e-3f1f-49b5-d950-08d8ed0ee6c2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4167

Hello Julien,

> On 20 Mar 2021, at 12:01 pm, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 16/03/2021 17:54, Rahul Singh wrote:
>> Hello Julien,
>=20
> Hi Rahul,
>=20
>>> On 16 Mar 2021, at 3:08 pm, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Rahul,
>>>=20
>>> On 09/03/2021 18:19, Rahul Singh wrote:
>>>> Backport 588888a7399db352d2b1a41c9d5b3bf0fd482390
>>>> "iommu/arm-smmu: Intelligent SMR allocation" from the Linux kernel
>>>> This patch fix the stream match conflict issue when two devices have t=
he
>>>> same stream-id.
>>>> Only difference while applying this patch is to use spinlock in place =
of
>>>> mutex and move iommu_group_alloc(..) function call in
>>>> arm_smmu_add_device(..) function from the start of the function
>>>> to the end.
>>>=20
>>> As you may remember the discussion on the SMMUv3 thread, replacing a sp=
inlock by a mutex has consequences. Can you explain why this is fine?
>> Yes, I remember the discussion on the SMMUv3 thread, replacing a spinloc=
k with a mutex has consequences.
>> I replaced the mutex with spinlock in the SMMUv1 code when we are config=
uring the SMMUv1 hardware arm_smmu_master_alloc_smes(..).
>> I think it is fine to use the spinlock in place of mutex in SMMUv1 where=
 we are configuring the hardware via registers as compared to SMMUv3 where =
we are configuring the SMMUv3 hardware with Memory-based circular buffer qu=
eues. Configuring the hardware via queues might take a long time that why m=
utex is a good choice but if we are configuring the hardware via registers =
it is very fast.
>> Configuring the SMMUv1 with the register is very fast and there are no s=
ide effects of this if we use spinlock. Let me know your view on this.
>=20
> This looks fine. Can you explain it the commit message?

Yes, I will add the explanation in the commit message and will send the v2.

Regards,
Rahul
>=20
> Cheers,
>=20
> --=20
> Julien Grall


