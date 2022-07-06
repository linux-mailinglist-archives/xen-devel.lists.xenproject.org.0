Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FD8568350
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 11:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362036.591888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o919t-0008QH-Ba; Wed, 06 Jul 2022 09:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362036.591888; Wed, 06 Jul 2022 09:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o919t-0008O0-8M; Wed, 06 Jul 2022 09:17:21 +0000
Received: by outflank-mailman (input) for mailman id 362036;
 Wed, 06 Jul 2022 09:17:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uO3f=XL=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1o919r-0008Nu-3V
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 09:17:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e7c291f-fd0c-11ec-bd2d-47488cf2e6aa;
 Wed, 06 Jul 2022 11:17:18 +0200 (CEST)
Received: from AS9PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:20b:530::8)
 by HE1PR0801MB1865.eurprd08.prod.outlook.com (2603:10a6:3:4f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Wed, 6 Jul
 2022 09:17:13 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::18) by AS9PR04CA0176.outlook.office365.com
 (2603:10a6:20b:530::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.15 via Frontend
 Transport; Wed, 6 Jul 2022 09:17:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Wed, 6 Jul 2022 09:17:13 +0000
Received: ("Tessian outbound 0ba541f03a2a:v122");
 Wed, 06 Jul 2022 09:17:13 +0000
Received: from cdb71b135737.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C448D74-A95C-45B4-A7F1-EE20F4585913.1; 
 Wed, 06 Jul 2022 09:17:07 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cdb71b135737.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 06 Jul 2022 09:17:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DB6PR0801MB1927.eurprd08.prod.outlook.com (2603:10a6:4:75::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Wed, 6 Jul
 2022 09:17:04 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::502f:a77a:aba1:f3ee%6]) with mapi id 15.20.5395.020; Wed, 6 Jul 2022
 09:17:03 +0000
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
X-Inumbo-ID: 6e7c291f-fd0c-11ec-bd2d-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cvZfBDvEqFEXmbRcsa8DPTt7d1j7Ic8ea/eYm2VIwiOMJCBjzp6Xt1fTfOZrJJ6IaBY57IsU9YEpZ0MTT86TdE6V7kX7rkYHisKNYvXPPmtRTpbiRPV6s+cVO0xjH/ks3FPjjgVXbqv1SZvzNxuWw6ZUSbPAf4fRBWIuQ7QUtCjpXxL3w2bm2ltDsXP6THUeCAgaoKeG4HjWmosUw0c+MXf7ehqDdRfUQePvJ5Bfy05+I/3ABkQub4c/x5yA9Ylwdj4G4GlQePlSN9nk/r2xClsgIYNK+RJTGHjL0rO2N3LNBDGx6yWNPjSupAZS7BRbSGDkewjZcnd07tkXkDRz6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRh2CKYfSGf7kAtuC0LCTobmSz7QZfyUv7M0qmkeChY=;
 b=N/0CJsMphgoTRR2U8s3N0ce3UYFCN5MVZz2xKvpxpwzOhjcs+HZxoFPF8B+HZDi6QeAsamsV/DenI3XWQ2phc4snmfVt1SapFfReyNpJl2pCVCi0pnj5XVoMw88F19AXrGJt7qOb4oULpMlQ3OphcklUo7U8C8iHx4WFRGx3OlwHMoJ3vH8si9G6TSSi+Juili4iKmrvIO4yfiXcwVW4bNfBEN9LtH5Y+arZvC6zXO8+lw3xRGAneEhmZN5rRk3T+P7P9XVJcvsDGfjwVTfMITA06/Rzp8uYtmZvQpkU7wJPraAT0NdLzu5r9E7jj4e4X+/cdfXYSgB8X3DPLeiWdQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRh2CKYfSGf7kAtuC0LCTobmSz7QZfyUv7M0qmkeChY=;
 b=UAIKacxfheSCqsP4IvRO1891araiYpEPOCkPzIMBLturE/gndXYotnURJn+8l7SKmj1rBRgwEtaatHaIJL6ev6lmJi7G/qG/Obwm8312FU56ZTyxxgs2LZW03YriIlgSuM1lDiaFMrFAJVhCsVwFl1uL6Xn6FMgI4pPJ7yINfys=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sc7dwpLz1QKwemOnquPVHQ8Kw/jFfRDOI4AOWWCi+AS1j+zRmFDZx2VFg4mluOLpPg+6C42ZzyABQD9eygjlajpb7LEmBRMVrrdxuDXONJfiLqdUcFhmRdWGXXdHxKBsQ1V82xuk6Yz8PuOVyEyww+HqTFvCpfqVknB0MEM7SCIBlPF0InGlM7Bztgy2Ssq5kw8De1BIo+1pD7bjaaHyd3WC3DXvce51DEojiEj+Re8gIikkjZt8pyC+MV5c4NIECAicWMUdmRj1TwlgByergJ6zLB76IExp8V/FYaVkfjSwqA8W5kLm4uF1NwU4EJjF48askxMoDXtqwYspbVzSQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRh2CKYfSGf7kAtuC0LCTobmSz7QZfyUv7M0qmkeChY=;
 b=HEbJZ1/kigWMAeBqaouIFC2geEmQj8FlmNk5pmpdND4EvHnMsEYcUTg1IcrOOrYKn2uW3dxNMKqgkmM199fkkDFKLX+1EWSIQs1nFgFINsiao89lhBGZZTDf7cN3IwH6KaWSspm72ao6qN7yYk7uQ5G2BLsZMG1BssJQnu/4lpspjd5KAioRqeF9c4ZiE6YaMC2Fe3GnEbr/y66xHArscGJGqDEhnEzJLv+kJNeulXUw++4GqrL6zc9UA15OSS8Hqy0onU4DB7fp08r4p9mmVdkcTqZ7+jdXoD+Ek+NmW9yiwO5G+9v+LW2huqXLX4ZmwmWVttpO8NQx08ofq5bkvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRh2CKYfSGf7kAtuC0LCTobmSz7QZfyUv7M0qmkeChY=;
 b=UAIKacxfheSCqsP4IvRO1891araiYpEPOCkPzIMBLturE/gndXYotnURJn+8l7SKmj1rBRgwEtaatHaIJL6ev6lmJi7G/qG/Obwm8312FU56ZTyxxgs2LZW03YriIlgSuM1lDiaFMrFAJVhCsVwFl1uL6Xn6FMgI4pPJ7yINfys=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Wei Liu (LSG)" <liuwe@microsoft.com>, Wei
 Liu <wei.liu@kernel.org>
Subject: RE: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Thread-Topic: [PATCH v2 0/8] x86emul: a few small steps towards disintegration
Thread-Index: AQHYgJ6R51Cg7cLRXES97vjccXbkla1xEZQAgAAcNoCAAADXUA==
Date: Wed, 6 Jul 2022 09:17:03 +0000
Message-ID:
 <AS8PR08MB7991B51CB5B37FA4EF2AB63792809@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <7f5287ad-8442-6c53-d513-f9a8345c4857@suse.com>
 <AS8PR08MB7991F4C747E3520491B9E1A292809@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <fd5b8de5-2478-defd-5133-5560a56a6023@suse.com>
In-Reply-To: <fd5b8de5-2478-defd-5133-5560a56a6023@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 1EB4E6712541D046A6441EEF64B86471.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: ca4ef8e4-32b8-4339-b418-08da5f305013
x-ms-traffictypediagnostic:
	DB6PR0801MB1927:EE_|AM5EUR03FT013:EE_|HE1PR0801MB1865:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /21P8cTIjuBiHqJdPZUy/Vk9qnTMEZICsdT84a4PMFHRTPy2WYin2mULHa8qrxfXkUS4lKCxrx+3X5A3IOhLeoh/u1VSpHe5zBYqZT692QfGLhAq7djIJTJw0OSvR71LwDD7MrOLS4OhIy+AhprJjnjxlHTDJwtDZ6MzJ21EMjarZEB3E6csvMP7FPruFQoKs8KxNFGIfDVxkW3tMB/bINLbwUB1HO1VwttHEKNwz/4TXzri9MfAu3ybgZga+TXWa+kZ+WXbjCvssyxcaVlmEwbxDkEp/ZN+wA134AnWRALvHeOuPHURP44Jmtde2uYMSoLEMQ0ObbAFRLx8JdnAaG+0iIP/NjpHH6cY3PCKvT8gosogI8Op8XQy911PYUBUXkT3E/3vmt98hCnAY75O/+l0NE4mkjpymIg2l8Eq3BTnBWhBuIhXvVVSjYvAT02S/yigiNHnZ06p/aB16d0T2m2D3jVTlr0XnKNxOwq6xulRolsC2e1QmjM3/KHMjwV21EAc4+j0u+3upz40E30NaNEpIPfhT3mg6MY3uZNHMBxGle/Sw+XqQ/xjKVvwz0D9BloXWyE0AnxBONoSI+T34lHCRBnKuGrELb6oLYuLPDGwM+8Al12Ef+ZX5QAxvU68656BFNGAh9Px3HpQOT79mYPlHIEGz7sS7YidNviHdnzFbIuwlVWc1XCdFfDC9ao7+1ujxxg6VylVJfVDb1tfiCsZ5SxnjNo3dfHA4G44a9hUq2pk7a6Og8xnP2cYsl6R8HoYbcYm5c4li8syhd1cfPQ5MbwO7i6kybyDQQEvdTw3fl6LckJ0iNGOKibMrjbg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(5660300002)(83380400001)(52536014)(76116006)(8936002)(66946007)(4326008)(33656002)(53546011)(6506007)(7696005)(9686003)(8676002)(26005)(41300700001)(478600001)(55016003)(110136005)(54906003)(316002)(38070700005)(66556008)(66446008)(186003)(66476007)(64756008)(86362001)(122000001)(71200400001)(38100700002)(2906002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1927
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba7f86e1-82d6-4063-3f60-08da5f304a4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDEHm+zBMQTZK87IP+R4r7WvsB3xZnF2ewh0UZ6ReOYurNoRcxr+qW8Nbd820mwhI4DzfyHo8JyVhV7Hm0OnMF1fe0Kl841YkC/S8bJYq5KXu20CCpwCM7zW17U/vG8+98HmMmRgESQ8T/f29JZIIFRu8sND2tv0VmA+IAkcJB1kYyLT8spGtyOfx9glpF5WmG9GZ3QpKDGENM8+gEoCmkc45chWie/G0YryU/z0ZUJg5D5eGaKQeez6kwnPRdbD8vE1i08JFibUhxrh9PvdYthqvO2iFRGa06S1cU3bt/p+nR9VvZoeDZywGMkdMqUvR5JnpDHIg+a0W4ybadiwnUFRwlIzsar73xNvCnbyPV/3tecdoJrMXCB/gkdt5fPfNiLrxGJiDzHOoYLfbbjJvSwZHPdtzGVNAYEzNTP6NkiOPF2nmzq7RvEnOdjD7PVjYHVp06y4lVAGMtQFBLzdo/e+5P26XgBZ0TSspbC/yKm93n9TmUod6WUxWexYMdNZ1Q64VCr94+4ej9Wpsg9z2MAhPg0Id2VZvMuF9NZ3XWuT4gt1QdwrJMLVQVzOrzasjvh0NpIPpppFh5Yva9Eexd+ZO5EqzQ05VLSJoMT/s0584sl/NW/5qMo15tnM5p+4gXeDk36o9PGrkfN+3SwrkuKb+YKRltPsvYXsiZ/Gooox45sOXyYQ6gybV4ONMqWXRcwKKD9NVw/khwDxXm3L7WYtsktJNN+l9yXEhsLlRvmmyKPrGYBen8jlXCWzPULRam1prMIxMKM3vpvsE9Ky/PCZbMOcC+tmpyrdQ1o/Ny6w2oagr0Ra952l/ZkDNIk0
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(376002)(346002)(39860400002)(46966006)(36840700001)(40470700004)(8936002)(52536014)(107886003)(82310400005)(478600001)(33656002)(86362001)(4326008)(356005)(8676002)(70206006)(9686003)(70586007)(36860700001)(82740400003)(5660300002)(40480700001)(40460700003)(26005)(81166007)(55016003)(186003)(53546011)(47076005)(316002)(7696005)(336012)(2906002)(41300700001)(83380400001)(110136005)(6506007)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 09:17:13.2220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca4ef8e4-32b8-4339-b418-08da5f305013
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1865

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gDQo+IE9uIDA2LjA3LjIwMjIgMDk6MzEsIEhlbnJ5
IFdhbmcgd3JvdGU6DQo+ID4gSXQgc2VlbXMgdGhhdCB0aGlzIHNlcmllcyBoYXMgYmVlbiBzdGFs
ZSBmb3IgbmVhcmx5IGEgbW9udGgsIHdpdGggbm90aGluZw0KPiBoZWFyZA0KPiA+IGZyb20gbWFp
bnRhaW5lcnMuIFNvIEkgYW0gc2VuZGluZyB0aGlzIGVtYWlsIGFzIGEgZ2VudGxlIHJlbWluZGVy
IGZvcg0KPiBtYWludGFpbmVycy4NCj4gDQo+IEEgbW9udGg/IFRoYXQncyBvbmx5IHNpbmNlIHYy
IHN1Ym1pc3Npb24uIFNlZSAuLi4NCg0KT2gsIHllcyBpbmRlZWQuIFRoYW5rIHlvdSBmb3IgdGhl
IGJhY2tncm91bmQgaW5mb3JtYXRpb24sIG5vcm1hbGx5IEkgdXNlDQpwYXRjaHdvcmsgdG8gdHJh
Y2sgc2VyaWVzIEkgZGlkIG1pc3NlZCB0aGUgdjEgYXMgdjEgaXMgc3VwZXJzZWRlZCBieSB2Mg0K
dGhlcmUgKHRodXMgImEgbW9udGgiLCBidXQgaG9uZXN0bHkgdGhpcyBzZXJpZXMgaXMgc3RhbGUg
Zm9yIG1vcmUgdGhhbiBhIHllYXIuLi4pLg0KDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC84XSB4ODZlbXVsOiBhIGZldyBzbWFs
bCBzdGVwcyB0b3dhcmRzIGRpc2ludGVncmF0aW9uDQo+ID4+DQo+ID4+IC4uLiBvZiB0aGUgaHVn
ZSBtb25vbGl0aGljIHNvdXJjZSBmaWxlLiBUaGUgc2VyaWVzIGlzIGxhcmdlbHkgY29kZQ0KPiA+
PiBtb3ZlbWVudCBhbmQgaGVuY2UgaGFzIHRoZSBpbnRlbnRpb24gb2Ygbm90IGluY3VycmluZyBh
bnkgZnVuY3Rpb25hbA0KPiA+PiBjaGFuZ2UuDQo+ID4+DQo+ID4+IEl0IGhhcyBub3cgYmVlbiBh
bG1vc3QgYSB5ZWFyIHNpbmNlIHRoZSB2MSBzdWJtaXNzaW9uLCB3aXRob3V0IGhhdmluZw0KPiA+
PiBoYWQgYW55IGZlZWRiYWNrLg0KDQpUbyBwb3NzaWJseSBtYWtlIHRoZSBwaW5nIGJldHRlciwg
SSB3aWxsIHRyeSBhZGQgV2VpIExpdSdzIGFub3RoZXIgMiBlbWFpbHMgaW4gdGhlDQpDQyBsaXN0
IChJIHdhcyBvbmNlIHRvbGQgYnkgaGltIGluIHRoaXMgd2F5IGhlIHdpbGwgYmUgbW9yZSBsaWtl
bHkgdG8gbm90aWNlIHRoZSBlbWFpbCkNCmFuZCBwdXQgQW5kcmV3IGFzIFRPLg0KDQpLaW5kIHJl
Z2FyZHMsDQpIZW5yeQ0KDQo+IA0KPiAuLi4gaGVyZS4NCj4gDQo+IEphbg0KPiANCj4gPj4gU29t
ZSByZS1iYXNpbmcgd2FzIG5lY2Vzc2FyeSBpbiB0aGUgbWVhbnRpbWUsIGFuZCBhDQo+ID4+IG5l
dyBwYXRjaCAodGhlIGxhc3Qgb25lKSBoYXMgYmVlbiBhZGRlZCAtIGV2ZW4gaWYgc2VlbWluZ2x5
IHVucmVsYXRlZCwNCj4gPj4gaXQgd2FzIGluIHRoaXMgY29udGV4dCB3aGVyZSBJIGRpZCB0aGlu
ayBvZiB0aGF0IHBvc3NpYmxlIGFkanVzdG1lbnQNCj4gPj4gKHdoaWNoIG1heSB3YW50IHRvIGJl
IHZpZXdlZCBzb21ld2hhdCBSRkMsIGFzIEkga25vdyB0aGVyZSBhcmUNCj4gPj4gcmVzZXJ2YXRp
b25zIGFnYWluc3QgdGhlIHVzZSBvZiAtT3MpLg0KPiA+Pg0KPiA+PiAxOiBzcGxpdCBvZmYgb3Bj
b2RlIDBmMDEgaGFuZGxpbmcNCj4gPj4gMjogc3BsaXQgb2ZmIG9wY29kZSAwZmFlIGhhbmRsaW5n
DQo+ID4+IDM6IHNwbGl0IG9mZiBvcGNvZGUgMGZjNyBoYW5kbGluZw0KPiA+PiA0OiBzcGxpdCBv
ZmYgRlBVIG9wY29kZSBoYW5kbGluZw0KPiA+PiA1OiBzcGxpdCBvZmYgaW5zbiBkZWNvZGluZw0K
PiA+PiA2OiBtb3ZlIHg4Nl9lbXVsX2JsaygpIHRvIHNlcGFyYXRlIHNvdXJjZSBmaWxlDQo+ID4+
IDc6IG1vdmUgdmFyaW91cyB1dGlsaXR5IGZ1bmN0aW9ucyB0byBzZXBhcmF0ZSBzb3VyY2UgZmls
ZXMNCj4gPj4gODogYnVpbGQgd2l0aCAtT3MNCj4gPj4NCj4gPj4gSmFuDQo+ID4NCg0K

