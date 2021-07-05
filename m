Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797373BBA0F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:20:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149971.277364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kld-0001Rp-IF; Mon, 05 Jul 2021 09:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149971.277364; Mon, 05 Jul 2021 09:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kld-0001Oo-En; Mon, 05 Jul 2021 09:19:53 +0000
Received: by outflank-mailman (input) for mailman id 149971;
 Mon, 05 Jul 2021 09:19:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kFf=L5=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1m0Klc-0001Oi-4N
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:19:52 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 365991ed-1566-43ac-8cfc-ea3f69af8f99;
 Mon, 05 Jul 2021 09:19:49 +0000 (UTC)
Received: from DB7PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:10:72::47)
 by DB6PR0802MB2424.eurprd08.prod.outlook.com (2603:10a6:4:a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 09:19:47 +0000
Received: from DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::76) by DB7PR03CA0106.outlook.office365.com
 (2603:10a6:10:72::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.21 via Frontend
 Transport; Mon, 5 Jul 2021 09:19:47 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT043.mail.protection.outlook.com (10.152.20.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Mon, 5 Jul 2021 09:19:47 +0000
Received: ("Tessian outbound 1763b1d84bc3:v97");
 Mon, 05 Jul 2021 09:19:47 +0000
Received: from e20f7bc9831d.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E9B9BAF0-2501-4D08-AEC0-3C921FB15A77.1; 
 Mon, 05 Jul 2021 09:19:41 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e20f7bc9831d.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 05 Jul 2021 09:19:41 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB5391.eurprd08.prod.outlook.com (2603:10a6:803:138::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Mon, 5 Jul
 2021 09:19:40 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 09:19:40 +0000
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
X-Inumbo-ID: 365991ed-1566-43ac-8cfc-ea3f69af8f99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gaTWNqi+pumqiUecLj+Puq7S7mc3t6LC8iqwbHyXaw=;
 b=yyK4onSM2Sfu5RVAEn+xzb2e6MuSjzeOpodWfPauhPWt7VwMaxk3RJ+FBAddZVcvraebTUUEOoAQh5/nwHYyB0LH8dvoAgH4QOjrxVappYuwgnvChFHCDCKJiPLxGsa7P09QkjPJxq4LvUMnB3amXhK6LC30ZBrdaP81dAbGFj8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcZxeB9LoRd21R0CL/dZXQQZTTckIrYudD5EMl16A24gDfLNWdrmh19Gvo22iOmmI+WhbsPny4Cb4d+NuctU708v3bn9BxzgTjxAeZD5oDj4bfPNaOgDH74oLZuWXTpQZSVZ0DO47VNhaPTEcW/nMJZl1YRvBz8FtPe/i8H+n2hJW6NZNcUAObnF+b2u6Vc1yZjXx/POg2MF8EtvLPvjx3Lw4bPJkiHCTXr1d+uJDbTZ2cwi0v/bRv0M4Fl1fWuDLrB/eDiLlv8YFgCzHQKhlf0dTLfDwKap+3wqtIvOLI9ziExfB3xjB0vK1+lR4ztOWhZTcLs9lhcI+eGi8eoZuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gaTWNqi+pumqiUecLj+Puq7S7mc3t6LC8iqwbHyXaw=;
 b=Xxj3XSxzdKHPSWO9VVNVD3oOCdGaFO1eACui5GYYI/jW/XXAdjO5vJf36FOXyFDhdNn345hMWbbZBbBWcApS49H6/WUqrvcB+6InqknbvK7JxHGu+vQiz0ataDz9b/QkVo9mRDSG+w4/V5XRRba2G32MQEq/CMKD1A5ukJKf8RNAiwShz+hJN5fPlZJAN0043IyNn7J1NWTFRSUkGnO8JXzQebHtszJ0c0K72ViTxXZquTqYcGNSTB6n7bannNr5Gi0Emh3lVqOkN2b/9qRx7mOzEfLslEH9O1eXfjJetKKkAf/LLZQB0ZtiahqxUfjo1PUg1mS69FQ/fZkJ5BGtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gaTWNqi+pumqiUecLj+Puq7S7mc3t6LC8iqwbHyXaw=;
 b=yyK4onSM2Sfu5RVAEn+xzb2e6MuSjzeOpodWfPauhPWt7VwMaxk3RJ+FBAddZVcvraebTUUEOoAQh5/nwHYyB0LH8dvoAgH4QOjrxVappYuwgnvChFHCDCKJiPLxGsa7P09QkjPJxq4LvUMnB3amXhK6LC30ZBrdaP81dAbGFj8=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>
Subject: RE: [PATCH 4/9] xen/arm: static memory initialization
Thread-Topic: [PATCH 4/9] xen/arm: static memory initialization
Thread-Index:
 AQHXW0b3OiAcoe7xDE2AVcNY0dwUCqsNAWAAgB/3qYCABuqiQIAANggwgAAUo4CAABh8YA==
Date: Mon, 5 Jul 2021 09:19:40 +0000
Message-ID:
 <VE1PR08MB5215A5D978B1B1D2403C53E2F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <e0a312a1-f430-3ff0-6dd6-fcfe18e58071@suse.com>
 <7f77349f-015e-83d3-d646-af9897e31348@xen.org>
 <VE1PR08MB52150F476CA7E1989F9067C7F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB521538D03677F9CBC6088855F71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <5ce26bab-9ebf-f3c5-44a3-7918227f3afd@suse.com>
In-Reply-To: <5ce26bab-9ebf-f3c5-44a3-7918227f3afd@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: A2A50A4422C42740B82F6382A645C5B3.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.113]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8fa349e3-887c-454e-08b5-08d93f9608dc
x-ms-traffictypediagnostic: VI1PR08MB5391:|DB6PR0802MB2424:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2424810A92BB5EC3881BF1B5F71C9@DB6PR0802MB2424.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +r4k56Wv3vb2mQXryeNGwAG7+TYcDm+8slTDl8Jm+6GuJUWiay7DU+DxmWv3BFf3MuIZoIY9g8XcjGIUs4UwhakJQbmYeBP9l12JCGDdXa3wwsbRyDuSnCGm1SU35opK5VONgDDUQTFs5ha79yx3othXyV1tm1nIipJlKmx9FgIPizZyfm4j2z4IXFV9cPQt6FzwmU+5zhZAjZ2tyWzPFBQTwdPrCk5Q9oAOvpY24IBD1HuDQdQzcc+zXSD3Xe6NwAgD2Ugv2azMZTMBS+Iuhje2zJ+e25pAJSi9QvK03QIKQQiiPlq21cVDJU5buThSHDG82aqI8MlQGY6wAv6S79+1KeqigBYh0/l65k0bi15cTYgCukKyl88Z4N8cJZTQb7mi3A2yp6Zic5G/KdtXtRtWKLIAjY33OdlSfHJOmvDqZUw/sb55Gxl3OMtT6hpL1j/cYFM9B9qJpH2qj5i68dsx42x0gTTQgwJ28h8vltNfmAq8eaHZ5xNw9GTRUz33MjV2KSwtCFiMZZIKHUYTRqI/7GKczI4x4uDzDM7JiG3CMS5CiyQfpAQgLks1XYsVta0hbGlLOX1ho/XZKeburQ81ip3ib8KcDd4S6PwJbPycCXR5tQPUkraRIiJvpOs56dg6n5X/heVnB7evUpDgiA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(396003)(136003)(376002)(346002)(8676002)(4326008)(38100700002)(53546011)(66446008)(316002)(8936002)(6916009)(52536014)(55016002)(86362001)(5660300002)(6506007)(66946007)(66476007)(478600001)(9686003)(33656002)(122000001)(71200400001)(83380400001)(76116006)(54906003)(7696005)(186003)(66556008)(64756008)(2906002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RHpOcXRHZ0pJcnUzVWlLTE1ZR1NHRi9tYjdXSno4MXFwSGcwRmE2Y0hNNmdK?=
 =?utf-8?B?WWlkbEllcStxN1ZPaXNYT1FqL1FlVG5VbW1yUkNmcDdWaUZlVURaWjR5ZUFV?=
 =?utf-8?B?NUJjOWcyTDFocVp0Z1g1YUJUT2tYcHRqZEpjL2MvMmJNKzJkTXdMMWcwVk5T?=
 =?utf-8?B?aXE4Wld6M0Y5QjRlZzhCQlU1NDhQRmFsMEZsUCtLNXBnd1o0VzdqMlBXZUda?=
 =?utf-8?B?Wlc1K2oyQ1ZUMVgwQkp0Q1Z3c1VxNWRoRlcyMFU5TVNCNi9IV2FhdVpiT05G?=
 =?utf-8?B?UlJoQWwxWEErNEhITDlVS1ovem15R1h6SHFzTzlsMGR2aGkzWlN1YWQwM3FY?=
 =?utf-8?B?YTNNb05IODh1OXk1YmhlcnlBaVViQmlCWXRkNlgvcGlUQ1p4QnVyWC9tdi9h?=
 =?utf-8?B?cDgzTXROaXM3ZmNMYTRFSlpwSWVwenhaUkdBNGJoVFJxMlZOamdzK0NQdGJD?=
 =?utf-8?B?dk1UVXNEZi9DQ2U5L1NGNXdidUFpWU1OdWhjb0VEOGl3YU9LYmFML2lRckVF?=
 =?utf-8?B?QUxjTEV4OC9aRXBQd2s5YzRQY09OSEVmMWJGOHBUUDNnckp4VUdzRDJVUGZq?=
 =?utf-8?B?cmV3T1prb0laUzZpcnFOcHpvZm0zaGRZaUM3TUxDdDFNOXBoeGNYVmVHODIv?=
 =?utf-8?B?bXNoQ2VLVWhxbVRrWnVobm0zcHF4dE8ydGkyVU9acDF2Q1dSVUhrd1pjSVht?=
 =?utf-8?B?c29qNXl3OGVoK0h2VW9PanZIaWREN2didEphT3hkZ1lzSHgyekdOZ3RNK25h?=
 =?utf-8?B?RTg1WE11ZEVaSy9xUkQ1emlCWTdqa0ptcmFHaGl4Z1pvSllGTG5JRjR0c1VM?=
 =?utf-8?B?czBtR1dHdjNVTjlvMHE2T3orcDBaYkcvc0REU2E4ZnBSQkh1OTUzSElZbnBl?=
 =?utf-8?B?MHByYkxiTC9VQVlSbnRZTTRKakc4TW5PNU95NDdkN2gzeEFCa0hmUE1EeEFY?=
 =?utf-8?B?eG1FU1p6RVZRUlVKWHl1MkpzbWF4SnFoMlgxMXpHZkVhSXc3WlpiRW1OVFUy?=
 =?utf-8?B?clVhZi85dW55ZGEvMDhjVjVLVHJ6bXJpM2xqZStQS1JZV1dPZmRWaUEwemoy?=
 =?utf-8?B?RTcydE9oR1pFTHdEZElNVm8rbE1xbWU4R1VFdHVvM0NSL0FXYTBsS01YcUxP?=
 =?utf-8?B?Q25mMXF5anBZRmdaZjRKNUtYQmFHVXVkcFIxcHZDV3p6bVJjTmR5cnc2OHlX?=
 =?utf-8?B?aEI3MUdITkt2K2JNN2pRU0ZPM01ocFJ0bG1BRzdBVE5UdFpYSnhUM3ZoTEg0?=
 =?utf-8?B?cjRzMkhBeDNacEpJOTIwMUZzSlZSaW5mandhY3NPTFk2SGRyT0tYT3p5K1Nw?=
 =?utf-8?B?SlVldm9EVHJONnNBaCtWNy9GSmVNRnpydldqZVRxVmh1STFmNzVKOEJ5Um9K?=
 =?utf-8?B?SUxuQVE3NjFqcGZ4aXBkaXBNTDVvY3dDNnJZNkNtOWl0bGFEYmxmRFlrTktE?=
 =?utf-8?B?R291T1lZTHlLcHhib2tDdFBabHFoVGx3dG1mY1JoWnJwbkFoRkkyS04yTk9N?=
 =?utf-8?B?bVF3SXY5bnlPMkVlUkRSTVluYWtNVzBZblNFck1FOEswTml5QThNVVZOZWZk?=
 =?utf-8?B?UVZSUEhXR3p5b0wxOCtocm9lQjNGZjZMQkJKUzdaMmllaVUzbHFhaFlXL0Jq?=
 =?utf-8?B?OVlUTnd4eldFR3UrUWMyUHlxNG11eStWeXF6dnltZmtQTml4emdRcmx5U2Fh?=
 =?utf-8?B?ZHYreHpIMEoxaVBlSGpwRExPVUN6RU4rUGhzV0J4RFU0VVNRMHlGeUtMQXZj?=
 =?utf-8?Q?sEigkywNAKPra2689x172A5RvB40Y6jE94bdLKu?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5391
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d5d60963-af9b-414d-a05d-08d93f960472
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JOIHbRUS3I8JI1qnfYrnfZgu9mcPnxtY1os12YZklCFHDAyTVrtTBM3NMpUFhsmsVQjRgKLb7BcdVM8YhldhsM28fVQJnyIvs0oUE7PjkrOXqZPPrLc95CioZ+XIEG02ZcXGWNfv0TDo2Dm/wyevMvf/yrXD1nKPRyv3aaqNHYadH0RMHTYUTt8Lx1ZjZ8KFE5vPEjYZY+4+MNlnwgCyu1pl79ibzICkj/GopLEG8cui8yNBRA/3lpT11YjB+r/vfeXX+1QNzzUeoAO/hw7E400DvRWJZzVOSCgQeJb7uO/dDsw8NIjoK/7n7s8Se5m13kHgJEKrV8en9DKwMCaWZVHaO3iGkptyOGtdQNIz/UOsXBK7ytlZ9aehS3ma0uVZRwhqOy+AannH5pC78XI8m/alrnMLE569dxKYklJH3459HbsOugJx4AtbCsh/HdBd/kq+U7DvlQKtUB/GXeB+nIxvazNV5nZ3lJR/KdVm8pzFmtTuFmvyvuwGFqPO+bJbFBtyYpB6W6WigkhjZMvfGOuTLH/7bbFNv7uabKb+Cv69G7KtXJsta3J7/V/NVYUdw7XXgBoD1zQOsK4J0oIbg/1buRthDraiBR709Grqs6iJeXpXfcCYetFWSeAUaECar4+CKTAb0R2btjcJE1ViFLzNxLLoS2Z/lba95dfTOI5EHPgRHuDNaRta569se8KsMefysr8bOI+E2ieLs49JUw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39850400004)(346002)(46966006)(36840700001)(26005)(356005)(55016002)(2906002)(9686003)(81166007)(52536014)(186003)(47076005)(53546011)(6506007)(8676002)(82310400003)(82740400003)(70586007)(54906003)(8936002)(4326008)(7696005)(86362001)(478600001)(83380400001)(70206006)(316002)(33656002)(6862004)(336012)(5660300002)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2021 09:19:47.5843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa349e3-887c-454e-08b5-08d93f9608dc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2424

SGkgSmFuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFuIEJldWxp
Y2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPiBTZW50OiBNb25kYXksIEp1bHkgNSwgMjAyMSAzOjUx
IFBNDQo+IFRvOiBQZW5ueSBaaGVuZyA8UGVubnkuWmhlbmdAYXJtLmNvbT4NCj4gQ2M6IEJlcnRy
YW5kIE1hcnF1aXMgPEJlcnRyYW5kLk1hcnF1aXNAYXJtLmNvbT47IFdlaSBDaGVuDQo+IDxXZWku
Q2hlbkBhcm0uY29tPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVs
bGluaUBrZXJuZWwub3JnOyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIDQvOV0geGVuL2FybTogc3RhdGljIG1lbW9yeSBpbml0aWFsaXphdGlvbg0K
PiANCj4gT24gMDUuMDcuMjAyMSAwOToxNCwgUGVubnkgWmhlbmcgd3JvdGU6DQo+ID4+IEZyb206
IFBlbm55IFpoZW5nDQo+ID4+IFNlbnQ6IE1vbmRheSwgSnVseSA1LCAyMDIxIDE6MjIgUE0NCj4g
Pj4NCj4gPj4+IEZyb206IEp1bGllbiBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+ID4+PiBTZW50
OiBUaHVyc2RheSwgSnVseSAxLCAyMDIxIDE6NDYgQU0NCj4gPj4+DQo+ID4+PiBPbiAxMC8wNi8y
MDIxIDEwOjM1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPj4+PiBPbiAwNy4wNi4yMDIxIDA0OjQz
LCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+Pj4gQEAgLTE1MTIsNiArMTUzMCwzOCBAQCBzdGF0
aWMgdm9pZCBmcmVlX2hlYXBfcGFnZXMoDQo+ID4+Pj4+ICAgICAgIHNwaW5fdW5sb2NrKCZoZWFw
X2xvY2spOw0KPiA+Pj4+PiAgIH0NCj4gPj4+Pj4NCj4gPj4+Pj4gKyNpZmRlZiBDT05GSUdfU1RB
VElDX0FMTE9DQVRJT04NCj4gPj4+Pj4gKy8qIEVxdWl2YWxlbnQgb2YgZnJlZV9oZWFwX3BhZ2Vz
IHRvIGZyZWUgbnJfbWZucyBwYWdlcyBvZiBzdGF0aWMNCj4gPj4+Pj4gK21lbW9yeS4gKi8gdm9p
ZCBfX2luaXQgZnJlZV9zdGF0aWNtZW1fcGFnZXMoc3RydWN0IHBhZ2VfaW5mbyAqcGcsDQo+ID4+
PiB1bnNpZ25lZCBsb25nIG5yX21mbnMsDQo+ID4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBib29sIG5lZWRfc2NydWIpIHsNCj4gPj4+Pj4gKyAgICBtZm5fdCBtZm4gPSBw
YWdlX3RvX21mbihwZyk7DQo+ID4+Pj4+ICsgICAgdW5zaWduZWQgbG9uZyBpOw0KPiA+Pj4+PiAr
DQo+ID4+Pj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBucl9tZm5zOyBpKysgKQ0KPiA+Pj4+PiAr
ICAgIHsNCj4gPj4+Pj4gKyAgICAgICAgc3dpdGNoICggcGdbaV0uY291bnRfaW5mbyAmIFBHQ19z
dGF0ZSApDQo+ID4+Pj4+ICsgICAgICAgIHsNCj4gPj4+Pj4gKyAgICAgICAgY2FzZSBQR0Nfc3Rh
dGVfaW51c2U6DQo+ID4+Pj4+ICsgICAgICAgICAgICBCVUdfT04ocGdbaV0uY291bnRfaW5mbyAm
IFBHQ19icm9rZW4pOw0KPiA+Pj4+PiArICAgICAgICAgICAgLyogTWFyayBpdCBmcmVlIGFuZCBy
ZXNlcnZlZC4gKi8NCj4gPj4+Pj4gKyAgICAgICAgICAgIHBnW2ldLmNvdW50X2luZm8gPSBQR0Nf
c3RhdGVfZnJlZSB8IFBHQ19yZXNlcnZlZDsNCj4gPj4+Pj4gKyAgICAgICAgICAgIGJyZWFrOw0K
PiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAgIGRlZmF1bHQ6DQo+ID4+Pj4+ICsgICAgICAgICAg
ICBwcmludGsoWEVOTE9HX0VSUg0KPiA+Pj4+PiArICAgICAgICAgICAgICAgICAgICJQYWdlIHN0
YXRlIHNoYWxsIGJlIG9ubHkgaW4gUEdDX3N0YXRlX2ludXNlLiAiDQo+ID4+Pj4NCj4gPj4+PiBX
aHk/IEEgcGFnZSAoc3RhdGljIG9yIG5vdCkgY2FuIGJlY29tZSBicm9rZW4gd2hpbGUgaW4gdXNl
LiBJT1cgSQ0KPiA+Pj4+IGRvbid0IHRoaW5rIHlvdSBjYW4gYXZvaWQgaGFuZGxpbmcgUEdDX3N0
YXRlX29mZmxpbmluZyBoZXJlLiBBdA0KPiA+Pj4+IHdoaWNoIHBvaW50IHRoaXMgY29kZSB3aWxs
IG1hdGNoIGZyZWVfaGVhcF9wYWdlcygpJ2VzLCBhbmQgaGVuY2UNCj4gPj4+PiBsaWtlbHkgd2ls
bCB3YW50IGZvbGRpbmcgYXMgd2VsbC4NCj4gPj4+Pg0KPiA+Pg0KPiA+PiBZZWFoLCBJIHdhcyBm
b2xsb3dpbmcgdGhlIGxvZ2ljIGluIGZyZWVfaGVhcF9wYWdlcy4NCj4gPj4gSG1tbSwgSSBjb3Vs
ZCBub3QgdGhpbmsgb2YgYW55IHNjZW5hcmlvIHRoYXQgd2lsbCBsZWFkIHRvDQo+ID4+IFBHQ19z
dGF0ZV9vZmZsaW5pbmcsIHRoYXQncyB3aHkgSSB3YXMgbm90IGluY2x1ZGluZyBpdCBhdCB0aGUg
Zmlyc3QgcGxhY2UuDQo+ID4+IEZvciBicm9rZW4gaXNzdWUsIHRiaCwgSSBqdXN0IGNvcHkgdGhl
IGJ1Z19vbiBmcm9tIGZyZWVfaGVhcF9wYWdlcywNCj4gPj4gYWZ0ZXIgcXVpdGUgYSB0aW1lIHRo
aW5raW5nLCBJIGFsc28gY291bGQgbm90IGZpbmQgYW55IHNjZW5hcmlvIHdoZW4NCj4gPj4gYSBw
YWdlKHN0YXRpYyBvcg0KPiA+PiBub3QpIGNhbiBiZWNvbWUgYnJva2VuIHdoaWxlIGluIHVzZS4g
Oy8NCj4gDQo+IEknbSwgYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZC4gVXNpbmcgcGFnZV90b19t
Zm4oKSwgZXhwZW5zaXZlIG9yIG5vdCwgaW4NCj4gQVNTRVJUKCkgaXMgcXVpdGUgZmluZS4gVGhl
IChleHBlbnNpdmUpIGV4cHJlc3Npb24gd29uJ3QgYmUgZXZhbHVhdGVkIGluDQo+IHJlbGVhc2Ug
YnVpbGRzLiBUaGlzIGlzIHNwZWNpZmljYWxseSBkaWZmZXJlbnQgZnJvbSBCVUdfT04oKS4NCj4g
DQoNClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9uLiDwn5iJDQpJJ2xsIHVzZSB0aGUgQVNTRVJU
KCkgdG8gZG8gdGhlIGNoZWNrLg0KDQo+IEphbg0KDQpDaGVlcnMNCg0KUGVubnkgWmhlbmcNCg==

