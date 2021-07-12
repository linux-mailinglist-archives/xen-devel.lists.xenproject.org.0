Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 948993C60A4
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 18:30:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154631.285701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2yon-0005lk-IF; Mon, 12 Jul 2021 16:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154631.285701; Mon, 12 Jul 2021 16:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2yon-0005hm-Do; Mon, 12 Jul 2021 16:30:05 +0000
Received: by outflank-mailman (input) for mailman id 154631;
 Mon, 12 Jul 2021 16:30:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUz8=ME=arm.com=Bertrand.Marquis@srs-us1.protection.inumbo.net>)
 id 1m2yom-0005UN-4K
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 16:30:04 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.71]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3826230-8d16-477f-8a56-63b4147f0459;
 Mon, 12 Jul 2021 16:30:01 +0000 (UTC)
Received: from DB6PR0601CA0035.eurprd06.prod.outlook.com (2603:10a6:4:17::21)
 by AS8PR08MB6773.eurprd08.prod.outlook.com (2603:10a6:20b:392::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Mon, 12 Jul
 2021 16:30:00 +0000
Received: from DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:17:cafe::9e) by DB6PR0601CA0035.outlook.office365.com
 (2603:10a6:4:17::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 16:30:00 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT019.mail.protection.outlook.com (10.152.20.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 16:30:00 +0000
Received: ("Tessian outbound 770f4ae52989:v98");
 Mon, 12 Jul 2021 16:30:00 +0000
Received: from 0f886c8ea683.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2553A7BD-C831-41ED-850F-9EAD2463B4AB.1; 
 Mon, 12 Jul 2021 16:29:53 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0f886c8ea683.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 12 Jul 2021 16:29:53 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com (2603:10a6:102:12d::10)
 by PAXPR08MB6461.eurprd08.prod.outlook.com (2603:10a6:102:153::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Mon, 12 Jul
 2021 16:29:51 +0000
Received: from PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d]) by PAXPR08MB6446.eurprd08.prod.outlook.com
 ([fe80::3184:5465:27b6:f27d%8]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 16:29:51 +0000
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
X-Inumbo-ID: c3826230-8d16-477f-8a56-63b4147f0459
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDi9gURwFbIpHSQ4Stw2sY27xUAqhSkKVF8aEU/6B0M=;
 b=idUqKYwFh272UDw1If0NbWMiRM8K/XajiZjpPkrVyB/vce+A7iFqnNGfVjeKfMQjy6g98jKD04OPIbPC/ZxkpgPwbjElUQKR5RF+rbuobwGaVOQpgRoUYAKRiyk1csg3RL902Iqx2aOC6UzJmEmOoLtQWoEBLkNZ4XIF11o4JJM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: e93e0f6662bcc2e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aX9hQCOlFuY/IU8NzDFgSgxxWxFKZa3bfrgaM7mPwGDwh6dwli2Mvhc3OJTDRnDc4x5SDTxG3CtrermrveXnAF1IE4jGCtWTWrpELhFoXQWitVLaYjQU0JlED2mxzftOpt+B0ae9QZuW1IVdIXWpjxGL5Ig+gqGFVlgUQtOFDUqCUYN9FgCE6Fz940DNUcVE5J20Dtjw5xN/dYSrQe2yGBoNzZLlVpY7etuIHrS2PZHDCI+REnv0rK3DJ7X4caHkLvtepznWCKko3A72ykbufe1Dqi8afxrvl3M5KuZWf888vbp0EHBh8aK/XVUPATA9DGICHlF8fxT9IriXiBpj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDi9gURwFbIpHSQ4Stw2sY27xUAqhSkKVF8aEU/6B0M=;
 b=R9IPRPuYKztSVIOuSIZi8yVN/5k/E6V7MbWRrYMfpibtqBNcgNDPcK7sz6XTQTSKsxAJPiBYXPpejxAK6TkCBvvQgT2dBvo+4YK7Kyn6R0zT4Q49lbj4Zz8EPHsFYsKqhrfGBSw54WnQl9isb0MfntrivB2FKsFtetLRNYuhQl+TUCKR/5/rMbmQXZg351Bg01hB0sz5fqBWz7UV6QnvK1QA8EYLL20wSJUicXE7ndWied/f1/ofxL5xLYdAkN53DaIRNq6NYqv8cA8bLCYNfbsJ/SlRxh2narlySwxy3lo+nY9gYHdg1x4iTRW9WMpn3Ed3O61uFmo1q0bCulQ2gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDi9gURwFbIpHSQ4Stw2sY27xUAqhSkKVF8aEU/6B0M=;
 b=idUqKYwFh272UDw1If0NbWMiRM8K/XajiZjpPkrVyB/vce+A7iFqnNGfVjeKfMQjy6g98jKD04OPIbPC/ZxkpgPwbjElUQKR5RF+rbuobwGaVOQpgRoUYAKRiyk1csg3RL902Iqx2aOC6UzJmEmOoLtQWoEBLkNZ4XIF11o4JJM=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Topic: [RFC PATCH 3/4] xen/arm: Sanitize cpuinfo ID registers fields
Thread-Index: AQHXbQmqqZ2dUoMblUy//wgHf+AX8qs/M8QAgAANJgCAAALfAIAAWGkA
Date: Mon, 12 Jul 2021 16:29:51 +0000
Message-ID: <D4992248-BED1-4766-8872-1BFEB04068FE@arm.com>
References: <cover.1624974370.git.bertrand.marquis@arm.com>
 <b9c86a28df2bddca095ae02511ced09585dce164.1624974370.git.bertrand.marquis@arm.com>
 <4014ca20-b3b6-cd39-9b26-d1dd8e9b568c@xen.org>
 <EE203ED0-5FB9-4597-878B-7261C989763F@arm.com>
 <08d7e35e-6785-9ce9-2e8b-1bbf65e4b47f@xen.org>
In-Reply-To: <08d7e35e-6785-9ce9-2e8b-1bbf65e4b47f@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3654.100.0.2.22)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: e6352720-ce8a-4e5a-5821-08d945524b61
x-ms-traffictypediagnostic: PAXPR08MB6461:|AS8PR08MB6773:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB677321B29EF8E58EEFD6E7029D159@AS8PR08MB6773.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 319FUu2k3fLWZJfacTlKjPQXYH+0Z0Y95YW1S+7ntBeKbBBz8ayiX9mLT/7x1sXQtoOnO1PJn4SZHk1WRPxr6uuKwBIHAPLXAYlwOfKjl0OOaZA0KO/RsiunV02ofiayBMVS2AcqU68k9nGUPgvclPpg6mxkfMV1C8Kuq19lp99saZrhy3MSho+9FR2UGes9H+kNYcHjSOP9GbZy2TZaFHB16kWq7UjST6oA2RIqsOwyCJH9erCgWplkqm2RdksMiGzBQ/Km6PEF3OstcQuzV/YZqouMmGQ/vkY5WikohgDOczSF4XqF2g9GH1n1rkE9Vq0qIPv8thKUuDpgcZMjtEETQw7wnkR76RaIczVJvP6HnWnfcF9nMsEZQJtaXMlNRCiXYAJZWSuOPkW3vm8BLUhVfTaVYdrullj9Fm71YNmbS8OMqQWDHIuxAAqgnwX8Lg7s+0Uaa+/V4JiIdfEVs8QiOAzJh4hXUhybNNRFAytMJpGrJNacgVNTNgOIb6fMUiXzqtuO/RD40m2sIBzdOVDLjPxOpnZUKxFpd3hcYF8BIbc8uIFQcCYJ8ORAZnDzplnulvQEH0Y3aX/vUeaHQvbq73cKo7kCbt3XYp/0YFzcSpgk2j/6lyb1lheyfXQLKBOVx6YoEU1D0ppmzQ0KMSl+mOXkMCT29SaKIhK53pSYtQD6Qp9MLwb4TTDx2lzKo13FsTHyvz/XLRbsXHLDzw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6446.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39840400004)(346002)(136003)(376002)(366004)(71200400001)(76116006)(2906002)(91956017)(64756008)(66446008)(6916009)(478600001)(36756003)(5660300002)(2616005)(33656002)(6512007)(122000001)(66476007)(66946007)(66556008)(38100700002)(8936002)(4326008)(186003)(53546011)(6506007)(8676002)(6486002)(316002)(86362001)(54906003)(26005)(83380400001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ZjYm7ZE/jE7MX/JhNLNF5R6FxfHARNnyieVA5XDy0YDBK4u3GMdaCmC2KWRN?=
 =?us-ascii?Q?dONwmNeWqOq5+XJ6QNzfMqseBkbD0kqbO04HPBtqphBd9cLYsGYNJ4eKjIfK?=
 =?us-ascii?Q?13dU5eyT3kWk0b9vAGjr5tfK5npapC8j3w5DUp5C+vf7RFfCIYTzkoHEA9Pc?=
 =?us-ascii?Q?1z9NlW6YxkdvN0QxtB8zoai96BeyLFaNCA1pVzcLaGl/c5Dme/lLNoW4sihH?=
 =?us-ascii?Q?NKoviLrJsGMJYvVtKyIBpdi9E3gQr28rkM7n6Jbb51sRCrGzoruyH0mkTPZp?=
 =?us-ascii?Q?CFxfWvMQw5DoO0AHZb1AwgiWRKYd+hdQpTfubg6eg9u/w2G3gbV5OSin1gYj?=
 =?us-ascii?Q?e/tRDZu79E96Ow9bNI5ycFXZBHVDNS3dQ6q9kf265pJFcb3/GrDNAbdPtDhV?=
 =?us-ascii?Q?iqOwhawvcLr6dy2qBq+iiAM475OwRmNbPjjUgLNo0PVR3rhagSy4OhtocGQ6?=
 =?us-ascii?Q?OaIOwj21h/H3VGmq1QQD8KsqXZwAR6p0KbewJyw65+K+cSgpEBhf/IOF2THe?=
 =?us-ascii?Q?ME9VEMUpWQtf9xakpZGmzfLRQrfj0XM6wDzh/zgmYNkzK9BHMBZ1utvrUuFJ?=
 =?us-ascii?Q?sRb/iAC2H/CO7oXbegYoLLwuCR/NLCkKEXQuAFENSsUvE45djMmFdkSnf3Ju?=
 =?us-ascii?Q?zatJTz0PZaOy3GAcNr+VhIQpxx4BhS4qKejyQv6jcXb008oD1kz57WlxpEJZ?=
 =?us-ascii?Q?OwZbw1VN0ztY5fPT09nmqV+RGKNIHMuIa4Fs7OVZGy8dMZdiIbWRanogk+/O?=
 =?us-ascii?Q?Pv+AtJSZS6J08eo51X3fJg98n2XGPHYM9Y8ZUjf/++9b3Ibhi6Q/jxCqtdcG?=
 =?us-ascii?Q?kqlJ47JTxWdQoz0+5pDYFoPEAUbBxtQdthrUKGpjgVpZ9ZXUijFy4g+7GETJ?=
 =?us-ascii?Q?vLkf8GUTu6T9WTlwD/uMtqe2qeASjGzU31QIirqvKf+W0Vxi+hwdtmkUghmQ?=
 =?us-ascii?Q?QzcS53Mnl9BxNasfr2jxKmY/+bvrbnLt6bOfE/yYpB8+LkTqxXipBnmgD99U?=
 =?us-ascii?Q?nWyUsMuHdzbeqFHM/q3+iA1C8bQbr/Hj0kf17gT5OCICm4nFyatWR/pI/R8e?=
 =?us-ascii?Q?ZXniecApowFk+W4jupiXHWUPL7q5J/Q0dVRY0RG6giFrqfcCvYVo0UX9c4JH?=
 =?us-ascii?Q?U1UMmz7t8IRDvW7hDFE211BXERMb11p3SIPpJYXrbh/T3vBC5tbxKCRUElIy?=
 =?us-ascii?Q?w0ItH9XTNGVOfE7dGEGdrLwFh0UIEkDNSlOTL/vkeUQofgC99JEAdgMVlpui?=
 =?us-ascii?Q?bRng0ETv8AeSXoo9rRBQ9pFKkbj9Er/zzfw8IUyP2v9tNez/3xyLcXotCt8E?=
 =?us-ascii?Q?lkKQHGev/g1pG8ogSDttQnLH?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <220E4D2AC52D584AA10A5DD677E52EE6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6461
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c817a6a2-942f-4895-eeb5-08d945524607
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ak0LxnG4Mg10plCEf/wkhJzzEOFOJ5S/oDHg8o86tOUoDsqdr4derksoiaaqUKesqMQFlkmBE8M8AS1elgRlPOc2XPu5Z0jCkGOrBPtB62JNa6muwK2W5r1vOrbqXwNiSl8qDvlayYvX/Xw+u2Blk2sdy+xuMwIQC6oN4fc+vHRq9bTh5aG9ViI/3S7CNRKB1vVNaHAY38C0UPXVaNk2SuOfoQfI2z4kp6M+1/8pfJMeyji9l/9i3GlMuS4bVX05yi0yIu1P9J59n6gX2KE755rFo5lY8Q2Odle4K9DBzfHepwqJRrgG8wHc9pJJbJpXYROIa5NZBvUuJO7uPeLgwR/dpSsQimNQh9zKxULCpxBrtnARb0yHrwyG7p0smW17I6QLx5lg6AnqvCOpYyApS0woOLKukmO0+Qkj+zbiFSLd/KI920TdATVVjdpI4EORS9txkO8qNQv4kvqCRAfZG8OaWDMmS023irjIzE+Y5PZQvkbZRCSkfrNs9y5nOjOO8MajVO4/5Gd/G/yrRcLQLcG2JEa8LKJdTqIvjtLdNHB/dGUyuhDBxQgCAxoHXTFSdjuI/IvTB78e3joRTMukzNWbUXy3/UXjy5v7of18X/wo0UYxm6AcM/VW33F9P3qRGGn9MjjnX7B6NzshZAazbDL4IwjOLDgYBVHw/6PZXFkKIvSTU9xla/z6zG3QU/CM7OTXT8Uk4sa9gTLMZBhBnQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39840400004)(376002)(136003)(396003)(346002)(46966006)(36840700001)(316002)(33656002)(47076005)(4326008)(36756003)(81166007)(186003)(478600001)(82310400003)(54906003)(86362001)(36860700001)(2616005)(83380400001)(5660300002)(2906002)(8936002)(26005)(8676002)(70586007)(53546011)(6506007)(356005)(70206006)(6862004)(336012)(6512007)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 16:30:00.3861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6352720-ce8a-4e5a-5821-08d945524b61
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6773

Hi Julien,

> On 12 Jul 2021, at 12:13, Julien Grall <julien@xen.org> wrote:
>=20
>=20
>=20
> On 12/07/2021 12:03, Bertrand Marquis wrote:
>> Hi Julien,
>=20
> Hi Bertrand,
>=20
>>> On 12 Jul 2021, at 11:16, Julien Grall <julien@xen.org> wrote:
>>>=20
>>> Hi Bertrand,
>>>=20
>>> On 29/06/2021 18:08, Bertrand Marquis wrote:
>>>> Define a sanitize_cpu function to be called on secondary cores to
>>>> sanitize the cpuinfo structure from the boot CPU.
>>>> The safest value is taken when possible and the system is marked taint=
ed
>>>> if we encounter values which are incompatible with each other.
>>>> Call the sanitize_cpu function on all secondary cores and remove the
>>>> code disabling secondary cores if they are not the same as the boot co=
re
>>>> as we are now able to handle this use case.
>>>> This is only supported on arm64 so cpu_sanitize is an empty static
>>>> inline on arm32.
>>>> This patch also removes the code imported from Linux that will not be
>>>> used by Xen.
>>>> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
>>>> ---
>>>>  xen/arch/arm/arm64/cpusanitize.c | 236 ++++++++++++++++++++++++------=
-
>>>>  xen/arch/arm/smpboot.c           |   5 +-
>>>>  xen/include/asm-arm/cpufeature.h |   9 ++
>>>>  xen/include/xen/lib.h            |   1 +
>>>>  4 files changed, 199 insertions(+), 52 deletions(-)
>>>> diff --git a/xen/arch/arm/arm64/cpusanitize.c b/xen/arch/arm/arm64/cpu=
sanitize.c
>>>> index 4cc8378c14..744006ca7c 100644
>>>> --- a/xen/arch/arm/arm64/cpusanitize.c
>>>> +++ b/xen/arch/arm/arm64/cpusanitize.c
>>>> @@ -97,10 +97,6 @@ struct arm64_ftr_bits {
>>>>  		.width =3D 0,				\
>>>>  	}
>>>>  -static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap)=
;
>>>> -
>>>> -static bool __system_matches_cap(unsigned int n);
>>>> -
>>>>  /*
>>>>   * NOTE: Any changes to the visibility of features should be kept in
>>>>   * sync with the documentation of the CPU feature register ABI.
>>>> @@ -277,31 +273,6 @@ static const struct arm64_ftr_bits ftr_id_aa64mmf=
r2[] =3D {
>>>>  	ARM64_FTR_END,
>>>>  };
>>>>  -static const struct arm64_ftr_bits ftr_ctr[] =3D {
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_EXACT, 31, 1, 1), /* RES=
1 */
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DIC_SHIF=
T, 1, 1),
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IDC_SHIF=
T, 1, 1),
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR=
_CWG_SHIFT, 4, 0),
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_HIGHER_OR_ZERO_SAFE, CTR=
_ERG_SHIFT, 4, 0),
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_DMINLINE=
_SHIFT, 4, 1),
>>>> -	/*
>>>> -	 * Linux can handle differing I-cache policies. Userspace JITs will
>>>> -	 * make use of *minLine.
>>>> -	 * If we have differing I-cache policies, report it as the weakest -=
 VIPT.
>>>> -	 */
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_NONSTRICT, FTR_EXACT, CTR_L1IP_SHIFT=
, 2, ICACHE_POLICY_VIPT),	/* L1Ip */
>>>> -	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, CTR_IMINLINE=
_SHIFT, 4, 0),
>>>> -	ARM64_FTR_END,
>>>> -};
>>>=20
>>> I don't think this is should be dropped. Xen will need to know the safe=
st cacheline size that can be used for cache maintenance instructions.
>> I will surround those entries by #if 0 instead
>=20
> But, why can't this just be sanitized as the other registers? If this is =
just a matter of missing structure in Xen, then we should add one.
>=20
> The same goes for the other 2 below.

The point of the RFC was to validate the way to go and do the base.

Those require changes out of the cpuinfo and are on my todo list to.

Regards
Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall


