Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B897E3A8682
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 18:29:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142307.262632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBvr-0005Om-6G; Tue, 15 Jun 2021 16:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142307.262632; Tue, 15 Jun 2021 16:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltBvr-0005Ms-27; Tue, 15 Jun 2021 16:28:55 +0000
Received: by outflank-mailman (input) for mailman id 142307;
 Tue, 15 Jun 2021 16:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QkLx=LJ=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1ltBvp-0005Md-0t
 for xen-devel@lists.xenproject.org; Tue, 15 Jun 2021 16:28:53 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9458951-44d2-40ce-a4cc-0d454079171a;
 Tue, 15 Jun 2021 16:28:50 +0000 (UTC)
Received: from AM6P195CA0051.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:87::28)
 by DB9PR08MB6974.eurprd08.prod.outlook.com (2603:10a6:10:2c1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 16:28:42 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:87:cafe::3c) by AM6P195CA0051.outlook.office365.com
 (2603:10a6:209:87::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Tue, 15 Jun 2021 16:28:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 16:28:42 +0000
Received: ("Tessian outbound 94919dbe50f5:v93");
 Tue, 15 Jun 2021 16:28:41 +0000
Received: from 091b633b91c0.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F854707A-4E9D-431C-AC9D-35FC1DA88686.1; 
 Tue, 15 Jun 2021 16:28:30 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 091b633b91c0.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 15 Jun 2021 16:28:30 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10)
 by AS8PR08MB6679.eurprd08.prod.outlook.com (2603:10a6:20b:393::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 16:28:27 +0000
Received: from AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5]) by AS8PR08MB6919.eurprd08.prod.outlook.com
 ([fe80::2de3:452a:87cf:3ff5%7]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 16:28:26 +0000
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
X-Inumbo-ID: a9458951-44d2-40ce-a4cc-0d454079171a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ1jRUoVYT4kD8AIqpCF4g42R3wx0bDOHXejiemdO7c=;
 b=itw+LU3BgtrqnMoo/AF+YI4QHXOTGriFakHaZzdhrX3mAGEPUsdl5pskR0UE9vYN7juW8m7H0lgWmMtjKOkmf+UAbHvGncNq8fAWruQmGGvN+adjuF6Gupoe7/ER3e9MB9iApi/AoQQDxq7PEiikIif6UeTWjoeIp9gJEru9ZHQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 003f35ef77bd73bf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GVMnJj3WAwP7t/RHi2okrVGJpdZIjKO0PCFXlmB+e/boURkHkK9kbdaIjIsegnxhSmz4b49ls44+3aCucbWH+hbNmPYLK7Y7qEee/wSjlqooCffkPwbO8QgVAqWyyHi9GZjaUH00Tz0pZcVrbPtRFtoeZNMEIL3SMGBEDa+2dmlQREJDnefMfJ/AuC1NE55azGzEwbPNAWps+h1PiImJgyQzfqoaXroo/dGw8ciCOj8eWLmfGkecJ1J6cC1jSgL0xojHkqmzgEfrhN7x6Yyu+lKPGL8HPgJMe5Rs3TZZicfa8BgkXdP0U6h/Cyhg7GfCnRR/DU/2bYUMWke5QYLdPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ1jRUoVYT4kD8AIqpCF4g42R3wx0bDOHXejiemdO7c=;
 b=ZlfMdFeVPAgffAbVNSlJ84AkeZgSkatWENDQTimen47we0oIA/6GWGuAx6+6/Cu883GYGycHgCr42SCRnb6tGUnQxBNUBj9SfD9tKMLORtBsXgBm/nHW+H9F02uxdYSwIjN7rdas2f/92BqbUKSyyAfChGQCADmfAZVC32ZSTJadzWmdqfa4nsNfb3rKsQdOLaO+JWwCHH+PM7jdBo+T7SNEbnAFbZFmWJ+adpncOCDO+0hny644yMZ6vkaaKeA5lRmU7Xqp9teGzX4RMaLDHLbUOd8JeLy675NxFWS8Fzou4pmIUXfYgH/rk7sEjHOAcyPSlsfz+TmMEmqLh6F2rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ1jRUoVYT4kD8AIqpCF4g42R3wx0bDOHXejiemdO7c=;
 b=itw+LU3BgtrqnMoo/AF+YI4QHXOTGriFakHaZzdhrX3mAGEPUsdl5pskR0UE9vYN7juW8m7H0lgWmMtjKOkmf+UAbHvGncNq8fAWruQmGGvN+adjuF6Gupoe7/ER3e9MB9iApi/AoQQDxq7PEiikIif6UeTWjoeIp9gJEru9ZHQ=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: "edgar.iglesias@xilinx.com" <edgar.iglesias@xilinx.com>, xen-devel
	<xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>, "fnuv@xilinx.com"
	<fnuv@xilinx.com>
Subject: Re: smmuv1 breakage
Thread-Topic: smmuv1 breakage
Thread-Index: AQHXYY0v3XVdqEOvqESHjaQGLRWMRKsVQ9IA
Date: Tue, 15 Jun 2021 16:28:24 +0000
Message-ID: <791BFC00-6A50-48D2-A208-E529B887441F@arm.com>
References: <alpine.DEB.2.21.2106141840150.24906@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2106141840150.24906@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [80.1.41.211]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 5230cf41-55f1-4ec4-c725-08d9301aa391
x-ms-traffictypediagnostic: AS8PR08MB6679:|DB9PR08MB6974:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB6974E0AC872E72305661C553FC309@DB9PR08MB6974.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 u2sQwtBrcJZmhUP07d5B986mMKw2lAismYTZSw0ilNLKXD7aaIgKeU0C9AKULU2OMaOePnUrSlLnLb2T+qMNn4RRkpKhlKff/WGJXxRel/RYUR0bI8e2zOVe5vcwOJ63TVHg94hWjUcdpchtApPtyCsqJF5sLnMmCWWr44+Blp+qFWN8ih7mNmQFAizsImfyc7TyIS7dMXufOUXYkmoWgyOrR0ZZUieSiAQjswVtO+5FILFxg6dfD76NgZDavzSN2nuukNYTsbKPTSK0XpCGpjlWUQZ1Olmh8+slj+88+XouX3BBQ/G7put4Pd5PQwe+9Z0MHVgZuaD+DHq9LbEH4QRF4E8HbeC4Pdm7a77ePG/ybtH1DSa+gat7Fpj2aSU1z0/pHZQy8iMw/cUBSG8UiJSsELQgESiAtqaqqTi4rjTeOWCgeB14IlpkAmgEHbjbjzyoOTq1DlFa4snWXfJyy28IQoc/IbEQ9/Je6p+0JHgBBOjKwrwFvJSkykmo04yuX59w7lS65h2+xIh8iViP2BKy5e3PtEyrZxTM24Jdst9fhrBKeYptciCmcbJmzUZe7/fX7DA9fOArivQRGfR85Wi+KTwOyqqu1dWI+aK/5BOpLTGpa/Mon9Ki0xt+MzdPID8yJDTdR0hVWL7AM7qE/tH6BmIn24tIVqL9ylD3DARfAI1Kw9EKAoP7O/kr3jImdRpZYa6Iake8UNM45LIDTY6WdnDvY4qOQDCx78ccs5ZG5LPcUh8LQOQu2VrxEyOc6v9pbwN3L8BS51t1/ZrReQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB6919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(376002)(396003)(39850400004)(136003)(346002)(4326008)(54906003)(2906002)(38100700002)(122000001)(66556008)(91956017)(66476007)(76116006)(7116003)(26005)(8676002)(66446008)(186003)(64756008)(86362001)(8936002)(71200400001)(6486002)(36756003)(478600001)(966005)(83380400001)(6512007)(33656002)(66946007)(6506007)(53546011)(316002)(2616005)(5660300002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?WHRGdHlWVkVVK2R1b2lwSnVkT0h6TmZnTDFGdUI0bEZHdGQwSHBaSWFHejZD?=
 =?utf-8?B?bHN3SkY3WXBlSXpKQ1FER24vUlM0Tjh2QmFVNGh1WjFUazk1a3Q4Qnd1VmhB?=
 =?utf-8?B?SEZlWjZFTWVhUW5lTjFvd3JoYzQ1VWl0bTVNSFZRQ2xrdC9HL1crSDZZcWFp?=
 =?utf-8?B?VEsxby9TL0VZTjNOMUhJbUJNTnJraDM2eGowbk1PbW9CQWd1TGJkRzg0VERI?=
 =?utf-8?B?ZXJPdUk5SDdRYmNFZVZMNGM1Wm1KbU4zSk9nVUlva1VwVXNiU3RvcXZHd1Iv?=
 =?utf-8?B?TjlXaTFwanZZbXdqZE1rQWxlVzJwSWV1VWdnelUxMDhUTzN0U29ZQkxZL20z?=
 =?utf-8?B?L2dKMm82eWF3Y0JhU0F5TFlWZ3B5aWNmT2NnVEZlUVhrbFF4UW9RY25qV3px?=
 =?utf-8?B?dk8yUW5VeHI0cEMvenB0QklheEs5Z0dOZHNWajZodUxkVHN1VjYzdFVFRHZk?=
 =?utf-8?B?Z2xKQUlKUzRmQWJqU0VXM2F0a29IaHNBSlhXZi9sL3JyMDkybExvbDFjNlVL?=
 =?utf-8?B?ckxTb2pobllwUEFJQmtUZnJWNElQZFRLZ0hOcnRObjZDTTJXZDcxWVo4VWVJ?=
 =?utf-8?B?c1NPc0VaUjVkSTdObnFoQ2JOVHFqclZOSG9tNDRNVXJoUGNYRTJHUS9LV2pI?=
 =?utf-8?B?TTgxUzl2aDZWWlJ1NmpxazY2M2JMOXJ3WktLRU5XZ0F6Z280ci9Qcm9sVkVY?=
 =?utf-8?B?MVhsaTA5aG1OR293c0V4UllwYjVacnRuSkhLRDlFVk93MWlSanBSSEYrdUx3?=
 =?utf-8?B?a3dzWllzQXhxbVRjRG15cU54dE5DclorRjhwckFzN0RoMmVRUy93WmpXbXJY?=
 =?utf-8?B?bWUrK0hkYm9LYXQxMDRNS1Z6WGs0cHQ0a3pBaTNNVWRzVWZmSVZwUnd5NTBB?=
 =?utf-8?B?eFM0R0ZVTDBpeDJna29mQmdmL1JMTG16NFBKcE96K0FiVkIwVytzMTlsVVpL?=
 =?utf-8?B?c2c2ZXdYV3FscVZhSG5wU2ZHbFpTWlNvTUJybmNhTHkzUHBxalRXRXgxcERE?=
 =?utf-8?B?MlJ2a0NBdlJoMzhWN2wzeTdCaEVrdTJWYVAzZUlYMDZ6N2xEQjY5aDZJb3BR?=
 =?utf-8?B?cE1mK3VHUFR3L2U3WDMrVEZZaXRKVnhVS2ZUVWMxcXVLUVdYVVlYb256NzJt?=
 =?utf-8?B?QU5hbjduRXBHc2xiYVJjSVZnS3lEaGptL1c1NXVvMkpveDRvcjQ0OFY1Q3Iz?=
 =?utf-8?B?T3dzcDFYZFZHc0htNWJKUjhSQklsczFFWnNIZ2hnQlAwZTZsWUs0OWxOWHVa?=
 =?utf-8?B?RFZmc2h2b1MwOGFlYUNlYUU1dUFuL0pBZGgwY3V6RWFWSlhiV29UZ0dLY2Fs?=
 =?utf-8?B?bW5FeHFJNHNMaEIvMXBQVGRMOVlJUXlhb0ZLU2xnTVhTTGZBSGlIRE9BOEJs?=
 =?utf-8?B?Q00yUmJOZXIwbkNZWEM2NXk4aFVwbWloRDl0dWx2WXUxaVh5QnhWcGs4RHlz?=
 =?utf-8?B?QUQvSDZSWFNuZ1BGVk9VU3pwbVoybUdVWGtOWEhtYXFMSHVROGdFNkk5d2RN?=
 =?utf-8?B?bFRnWktPTmpnSlFRVDVWdHlTVno2UkJQSDZpNm8xMlBIbGo4MVM1WTExK1ZO?=
 =?utf-8?B?YUR6aldRWTEvVDBIeVl4cFM3dUJ6VWxLKzdZc3FJVG5mQUZMM21JZzk2NzRm?=
 =?utf-8?B?YjNjTFZDekV4MkxXNkgxN3QvZElQUlN3MXppK2pVZWduR29yM0RwazhYNWpu?=
 =?utf-8?B?cGphaUJvcG1KTVIwamg4eU5PbHlvaHlySnZrQ21xbUJ4ZGxMeEg3Y2hHN3ky?=
 =?utf-8?Q?biUDooPHriA20w2YmU2AzhHYlGGN1Xl2bCB4vqu?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <783BFDF8A47EA24C920B359F49768EAA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6679
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a398a40-aa32-44a3-3134-08d9301a9a4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QG1PjyIkn/c3d+x8bdlYqPAODEkoeht3/P4GNAJ42WU5CcqGR0UKR27xGrXq/fSOq23J38DBuGh6tjkK0/9sz7soNl4FGP5krNU0I9cNeUmKZNPr8elDkHA6W7NzL2b8Wpl1GWD0eTHaxvBC7jGI6FMfK9kQhD+lVOlut2+aVo/kgM7HQH5GER6MCOjz61BM1zgc72kpviBcmQg3mgCADeaoOBntCnG0rjfA0LaGwdykXy0T/B1KZy5OEoKbr1XqYunFsUZncmtYxCw5vDUYrg+IwZxd0A1Q9tj0DuL4tpHoGbZ8fCPMFZz2AFx3+4AJPNSvzRbusLl/s+fd2ZZO4Nw7kyODb+RmseY/zIFCxJq6X2vsVpAqgsH2jNSjkacW27ZgdNontvqvjKtAZlxjX9Wx50+jPM28ICsmOHUrZa/TbsDRMED9xKLAOORGOz1VHEWKQ+4CNApREIiYs9qFz7rxYB5gscuKh1untMkigANASRFjIFvhOS5+17RIQtSVLUwjWXokfWlfVQBCyv+1q7YvOahbxU5m+LraXSUv/Wfr+6j3AkpAbyR4JoWMY9r/x5yfuong5uzSFKIeTVuq+FHemA2FdPchQKs5da3Xi3aL1wuykjwxmGDHsuhw7yepozV04FSLU5r5v/6ilRsK09a2Cm99MRM/7HLzhlB1p6SjPKQ6VrjGhNI3pVN5utvmI0XkRN3JHCAK6kwGEN8q6XiaVtdGjlxkcEwIMEN6Rw5ao6ZaN3UXhmHurFrhl98u8WCeVvfZBhnprSvbtd/1hA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39850400004)(136003)(46966006)(36840700001)(33656002)(47076005)(83380400001)(316002)(70586007)(5660300002)(86362001)(70206006)(82310400003)(82740400003)(8676002)(54906003)(8936002)(966005)(356005)(186003)(478600001)(6486002)(2616005)(107886003)(2906002)(336012)(6862004)(53546011)(4326008)(36860700001)(36756003)(6506007)(7116003)(26005)(6512007)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 16:28:42.0584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5230cf41-55f1-4ec4-c725-08d9301aa391
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6974

SGkgU3RlZmFubw0KDQo+IE9uIDE1IEp1biAyMDIxLCBhdCAzOjIxIGFtLCBTdGVmYW5vIFN0YWJl
bGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gSGkgUmFodWwsDQo+
IA0KPiBVbmZvcnR1bmF0ZWx5LCBhZnRlciBiaXNlY3RpbmcsIEkgZGlzY292ZXJlZCBhIGZldyBt
b3JlIGJyZWFrYWdlcyBkdWUgdG8NCj4geW91ciBzbW11djEgc2VyaWVzIChjb21taXRzIGU4ODk4
MDliIC4uIDNlNjA0N2RkZikgb24gWGlsaW54IFp5bnFNUC4gSQ0KPiBhdHRhY2hlZCB0aGUgRFRC
IGFzIHJlZmVyZW5jZS4gUGxlYXNlIG5vdGUgdGhhdCBJIG1hZGUgc3VyZSB0bw0KPiBjaGVycnkt
cGljayAieGVuL2FybTogc21tdXYxOiBSZXZlcnQgYXNzb2NpYXRpbmcgdGhlIGdyb3VwIHBvaW50
ZXIgd2l0aA0KPiB0aGUgUzJDUiIgZHVyaW5nIGJpc2VjdGlvbi4gU28gdGhlIGVycm9ycyBhcmUg
cHJlc2VudCBhbHNvIG9uIHN0YWdpbmcuDQo+IA0KPiBUaGUgZmlyc3QgYnJlYWthZ2UgaXMgYW4g
ZXJyb3IgYXQgYm9vdCB0aW1lIGluIHNtbXUuYyNmaW5kX3NtbXVfbWFzdGVyLA0KPiBzZWUgbG9n
MS4gSSB0aGluayBpdCBpcyBkdWUgdG8gdGhlIGxhY2sgb2YgYWJpbGl0eSB0byBwYXJzZSB0aGUg
bmV3IHNtbXUNCj4gYmluZGluZ3MgaW4gdGhlIG9sZCBzbW11IGRyaXZlci4NCj4gDQo+IEFmdGVy
IHJlbW92aW5nIGFsbCB0aGUgInNtbXVzIiBhbmQgIiNzdHJlYW0taWQtY2VsbHMiIHByb3BlcnRp
ZXMgaW4NCj4gZGV2aWNlIHRyZWUsIEkgZ2V0IHBhc3QgdGhlIHByZXZpb3VzIGVycm9yLCBldmVy
eXRoaW5nIHNlZW1zIHRvIGJlIE9LIGF0DQo+IGVhcmx5IGJvb3QsIGJ1dCBJIGFjdHVhbGx5IGdl
dCBTTU1VIGVycm9ycyBhcyBzb29uIGFzIGRvbTAgc3RhcnRpbmcNCj4gdXNpbmcgZGV2aWNlczoN
Cj4gDQo+IChYRU4pIHNtbXU6IC9zbW11QGZkODAwMDAwOiBVbmV4cGVjdGVkIGdsb2JhbCBmYXVs
dCwgdGhpcyBjb3VsZCBiZSBzZXJpb3VzDQo+IChYRU4pIHNtbXU6IC9zbW11QGZkODAwMDAwOiAg
ICAgR0ZTUiAweDgwMDAwMDAyLCBHRlNZTlIwIDB4MDAwMDAwMDAsIEdGU1lOUjEgMHgwMDAwMDg3
NywgR0ZTWU5SMiAweDAwMDAwMDAwDQoNCiBUaGlzIGZhdWx0IGlzICJVbmlkZW50aWZpZWQgc3Ry
ZWFtIGZhdWx04oCdIGZvciBTdHJlYW1JRCDigJwgMHg4NzfigJ0gdGhhdCBtZWFucyBTTU1VIFNN
UiBpcyBub3QgY29uZmlndXJlZCBmb3Igc3RyZWFtSUQg4oCcMHg4NzciDQoNCg0KPiBbICAgMTAu
NDE5NjgxXSBtYWNiIGZmMGUwMDAwLmV0aGVybmV0IGV0aDA6IERNQSBidXMgZXJyb3I6IEhSRVNQ
IG5vdCBPSw0KPiBbICAgMTAuNDI2NDUyXSBJUHY2OiBBRERSQ09ORihORVRERVZfQ0hBTkdFKTog
ZXRoMDogbGluayBiZWNvbWVzIHJlYWR5DQo+IA0KPiBEbyB5b3UgdGhpbmsgeW91J2xsIGJlIGFi
bGUgdG8gaGVscCBmaXggdGhlbT8NCj4gDQo+IA0KPiBZb3Ugc2hvdWxkIGJlIGFibGUgdG8gcmVw
cm9kdWNlIHRoZSB0d28gaXNzdWVzIHVzaW5nIFhpbGlueCBRRU1VIChidXQgdG8NCj4gYmUgaG9u
ZXN0IEkgaGF2ZW4ndCB0ZXN0ZWQgaXQgb24gUUVNVSB5ZXQsIEkgd2FzIHRlc3Rpbmcgb24gcmVh
bA0KPiBoYXJkd2FyZSk6DQo+IC0gY2xvbmUgYW5kIGNvbXBpbGUgeGlsaW54IFFFTVUgaHR0cHM6
Ly9naXRodWIuY29tL1hpbGlueC9xZW11LmdpdA0KPiAgLi9jb25maWd1cmUgIC0tdGFyZ2V0LWxp
c3Q9YWFyY2g2NC1zb2Z0bW11DQo+ICBtYWtlDQo+IC0gY2xvbmUgYW5kIGJ1aWxkIGdpdDovL2dp
dGh1Yi5jb20vWGlsaW54L3FlbXUtZGV2aWNldHJlZXMuZ2l0DQo+IC0gdXNlIHRoZSBhdHRhY2hl
ZCBzY3JpcHQgdG8gcnVuIGl0DQo+ICAgIC0ga2VybmVsIGNhbiBiZSB1cHN0cmVhbSBkZWZjb25m
aWcgNS4xMA0KPiANCg0KSSB0cmllZCB0byByZXByb2R1Y2UgdGhlIGlzc3VlIG9uIFhpbGlueCBR
RU1VIGFzIHBlciB0aGUgc3RlcHMgc2hhcmVkIGFib3ZlIA0KYnV0IEkgYW0gbm90IG9ic2Vydmlu
ZyBhbnkgaXNzdWUgb24gWGlsaW54IFFFTVUuDQoNCkkgYWxzbyB0ZXN0ZWQgYW5kIGNvbmZpcm1l
ZCBvbiBRRU1VIHRoYXQgU01NVSBpcyBjb25maWd1cmVkIGNvcnJlY3RseSANCmZvciBzcGVjaWZp
Y2FsbHkgU3RyZWFtSUQg4oCcIDB4ODc34oCdIGFuZCBmb3Igb3RoZXIgc3RyZWFtSURzLg0KDQpJ
IGNoZWNrIHRoZSB4ZW4uZHRiIHNoYXJlZCBieSB5b3UgYW5kIGZvdW5kIG91dCB0aGUgdGhlcmUg
aXMgbm8gInN0cmVhbS1pZC1jZWxsc+KAnQ0KcHJvcGVydHkgaW4gdGhlIG1hc3RlciBkZXZpY2Ug
YnV0IHRoZSAibW11LW1hc3RlcnMiIHByb3BlcnR5IGlzIHByZXNlbnQgaW4gdGhlDQpzbW11IG5v
ZGUuIEZvciBsZWdhY3kgc21tdSBiaW5kaW5nIHdlIG5lZWQgYm90aCAic3RyZWFtLWlkLWNlbGxz
4oCdIGFuZCAibW11LW1hc3RlcnPigJ0uDQpJZiB5b3UgbmVlZCB0byBhZGQgdGhlIG5ldyBzbW11
IGJpbmRpbmcgcGxlYXNlIGFkZCB0aGUgImlvbW11LWNlbGxz4oCdDQpwcm9wZXJ0eSBpbiB0aGUg
c21tdSBub2RlIGFuZCB0aGUg4oCcaW9tbXVz4oCdIHByb3BlcnR5IGluIHRoZSBtYXN0ZXIgZGV2
aWNlLg0KDQpDYW4geW91IHBsZWFzZSBzaGFyZSB0aGUgeGVuIGJvb3QgbG9ncyB3aXRoIG1lIHNv
IHRoYXQgSSBjYW4gZGVidWcgZnVydGhlciB3aHkgdGhlIGVycm9yIGlzIG9ic2VydmVkPyANCg0K
UmVnYXJkcywNClJhaHVsDQoNCg0KPiBDaGVlcnMsDQo+IA0KPiBTdGVmYW5vPHhlbi5kdGI+PGxv
ZzEudHh0PjxxZW11LXJ1bi16eW5xbXAteGlsaW54LXhlbi5zaD4NCg0K

