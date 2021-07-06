Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59A53BC86F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 11:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150944.279033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hFv-0004lK-Ci; Tue, 06 Jul 2021 09:20:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150944.279033; Tue, 06 Jul 2021 09:20:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0hFv-0004jQ-8W; Tue, 06 Jul 2021 09:20:39 +0000
Received: by outflank-mailman (input) for mailman id 150944;
 Tue, 06 Jul 2021 09:20:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpqu=L6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m0hFt-0004jI-59
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:20:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::618])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea178be1-8dda-4b5b-969f-372bcbfbdf1b;
 Tue, 06 Jul 2021 09:20:35 +0000 (UTC)
Received: from AM5PR1001CA0003.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::16)
 by DB6PR0801MB1688.eurprd08.prod.outlook.com (2603:10a6:4:3a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.26; Tue, 6 Jul
 2021 09:20:33 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::70) by AM5PR1001CA0003.outlook.office365.com
 (2603:10a6:206:2::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 6 Jul 2021 09:20:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Tue, 6 Jul 2021 09:20:32 +0000
Received: ("Tessian outbound 2e56506fe389:v97");
 Tue, 06 Jul 2021 09:20:32 +0000
Received: from 477289aeabc2.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F9DAC4BA-8457-4167-9A00-1FEB8806067E.1; 
 Tue, 06 Jul 2021 09:20:26 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 477289aeabc2.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 06 Jul 2021 09:20:26 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com (2603:10a6:803:10a::33)
 by VI1PR08MB3424.eurprd08.prod.outlook.com (2603:10a6:803:88::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Tue, 6 Jul
 2021 09:20:24 +0000
Received: from VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918]) by VE1PR08MB5215.eurprd08.prod.outlook.com
 ([fe80::2807:2ff9:e371:2918%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 09:20:24 +0000
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
X-Inumbo-ID: ea178be1-8dda-4b5b-969f-372bcbfbdf1b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JRisGj/Pzaucyme7fnfy2Tqri2vdi7ghvIx0NcGK94=;
 b=mwfCEZGS6x5sDw/EvVyh8xNtNZWGohkH/i9uW4Yj2SYZLvZ+VdBlZyeBDpz9Nfj+ilmXDJGGyZ12bjDnn+DCOKFcDq2qt41u8nLVYgdf5WbehF82stbIGccRo+Mq/6QOqGoQgRiT/YDY08b4HzP59HVTJC5AZrTDqcUpO7WXLA4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cL2LZ9Fhbjck1rIgN18vvSV8d0wPOLNFNzOcgOa2g9Ogeodg5RYYJHov0DISdNBNsBQApTyKq4/wUgl/GaKt6uKd6tw1mRtZbV9Ynwb7cM9DVVCT26EDOPaYotL9v0q/BhP84MKtdgo1dOECoZrgU8Dk7UwMiw8/ScthoBftWYEaJVl94jnDV6i4Hgtk8saRh1KJbGMU2ibD1sPXi0sv21SdMDGQ8inPYoajf2eJA/COg7bcTDTPhFgNjhLAgeh6DKk5hbe/tCm2nQ+CT6vYPQ1KVqraFDI04FFP74sBZKnZ3+xkPcSKUDG5EUpX3a0rl2M9bJ0RHjHpcaF8u1wLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JRisGj/Pzaucyme7fnfy2Tqri2vdi7ghvIx0NcGK94=;
 b=nhglPWR0dB33gDq3RF30oRxFP59gW5I4hZcSDpSM4O29pwGItcpRb3ASzX4iJkIb7RFLN+hUxNA9PfQ7kVe7NTAn+RpBoi9SmUUtphW9CjTEMq3bZ2IPSWFTs8xq+C3uin/plf14ayRTSJ4Jiqkh68MvZCz6+wAY9UszXSWebUX/K3/t+t/6xQYMGwM8wXlvYO4fdEyHcxNVUTQSaMNrr4cdQZ6Qps8T8kUAX4Q2Dv2xj+lNuQTDJ592ZKzibSTU7Y9wo6Yi97MJJU6//ZFl6zplAQuF6tMBfIFH86xVrkRUV6kntjJG72D/sb/+6Q8FehCCh6v6BwtV00JOdEokgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JRisGj/Pzaucyme7fnfy2Tqri2vdi7ghvIx0NcGK94=;
 b=mwfCEZGS6x5sDw/EvVyh8xNtNZWGohkH/i9uW4Yj2SYZLvZ+VdBlZyeBDpz9Nfj+ilmXDJGGyZ12bjDnn+DCOKFcDq2qt41u8nLVYgdf5WbehF82stbIGccRo+Mq/6QOqGoQgRiT/YDY08b4HzP59HVTJC5AZrTDqcUpO7WXLA4=
From: Penny Zheng <Penny.Zheng@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
Subject: RE: [PATCH 4/9] xen/arm: static memory initialization
Thread-Topic: [PATCH 4/9] xen/arm: static memory initialization
Thread-Index: AQHXW0b3OiAcoe7xDE2AVcNY0dwUCqss/50AgAck2tCAAbJdAIAAALLg
Date: Tue, 6 Jul 2021 09:20:23 +0000
Message-ID:
 <VE1PR08MB5215AB836DE8B8943C4A040CF71B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <1c6530bf-a362-0993-c4c5-953ee2afb1bf@xen.org>
 <VE1PR08MB5215D076B85A22DD9991B64CF71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <f4836b6e-cbb3-ef9d-1d15-a6ec75d985d2@xen.org>
In-Reply-To: <f4836b6e-cbb3-ef9d-1d15-a6ec75d985d2@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 9256631E10A4C7488C714A581F28B984.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [203.126.0.111]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: ce843e5c-8cf7-4889-a86d-08d9405f4e50
x-ms-traffictypediagnostic: VI1PR08MB3424:|DB6PR0801MB1688:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB16881EC80236A3E80281F7A8F71B9@DB6PR0801MB1688.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:2887;OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 d7tEAxD7l/ObXwO71uTyvFrNi8MASy3BzGb/f+8Zoc+utQeolRPfgmKk4dwonVFKajoNY+voaWT4ZE/dm24BpnlyfU6UlURur7/GV+VoR+fWD18AvwbSzlwfuxTqbX5KjPQC07PmJ5nb2YGqCLCfNlCIhu18VfzqHHkeC0Vj15NT5gEIoWjNMnPHUsFI81xItViNbKtjKM8vNDi6L/TfaAd6ibum9E+xZC3/7jpRu9b9hEVqDRKKw53X+GeW+5d9bJ7Glk5UF85WAdwaWJB3FiMedIsH5u1c0t56cX7j11dWYIX5PgG0/X/LKLMTDqnC5agwpdihCBMb04HaMV9IWvSfdewDAGdFVutSC+mCh/DyikxISqQ4eExarsskADBR0/103EEDDjUc3RMG/vT6ep/gwKHzANOCeczE6pDuBIV4yBj7LcxIHEUPF/ExKXzc4fWLGYlOhy/2YfUGLtfrzxZFtjsovsOpN8WWtaKJLhLiCJHcKW9BTc0yjrkCqkzfSEWZ2/1FWL9k4UAzGXwc1C9sYDY5LTsSkpPoQm9C9qo9QQQiPcg8s12cjgmmV6kjJz1NwB5TcM4rffrTwzt7P9ryv+ZU951YWVLrPHtZD+SAVc9jtkMVlQLn3lkLyYifqGIP640Lb+tmPcSV9jwUew==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5215.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(39850400004)(396003)(5660300002)(86362001)(53546011)(4326008)(122000001)(6506007)(54906003)(2906002)(52536014)(110136005)(8936002)(38100700002)(478600001)(7696005)(71200400001)(66476007)(316002)(64756008)(186003)(33656002)(76116006)(83380400001)(66446008)(9686003)(26005)(66556008)(66946007)(55016002)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RkVYSjFJQlo5VmU4L0FSUjlYd0E5NnhrU0dkRHJXOWpNUjQzWjVFWFl4dU5k?=
 =?utf-8?B?dC9HK1ltdzYxakxjclllWkwvTm1sRHIzRFVSWWM5a2FZRndFUUJkZGdKN2Qv?=
 =?utf-8?B?VjhUS1FtTFVTT05sNmw5OExRU0NqRkVNQi9PVHRNTktiamZCMmcrZjE3cE1p?=
 =?utf-8?B?T2x1UE45a2dRbWkyVlY0a2FZY0ZyQS9FOC9udE13RmdZMUVxSGR4eExka2FR?=
 =?utf-8?B?UGMyR2J5cDB2RzhXa2U5V0RrWUFTSEhzejF0dDJuemw0aStMeEZ1TUJ1RHly?=
 =?utf-8?B?ck5Fd1I4OWN6eDZpOHJxUkVuMktxaWVuR1VsZDJkd2sxZk5ycEVlVSt1UXRi?=
 =?utf-8?B?blVIOXBHSTVFdk5EdVBtN1RhSTdzOEIxOVNpdmFyaE0ybzVhMng3Q3dXVnRE?=
 =?utf-8?B?NE5IcmdQb3lPT1NLanp3TGhyaWx0dWVsbGljcDVMZ1pJVWtlYkowZ0NWWVpn?=
 =?utf-8?B?ay9kZ3RkWFFmQklGKzFhNGRlZDNXK3dad0ZlcEp3UzNPSllCWC9RWnZQNitX?=
 =?utf-8?B?ZExpcXFxM2xlRkxaT2o1WW1OUTFvN0o1SlcwV1N0TUVteHBWWktTOCt3WmZq?=
 =?utf-8?B?R2NENnplWUJsUEVnV1BXV01KemZDU3V1R1ZHc2dRUFk2aEhBTGF1dzk3M01h?=
 =?utf-8?B?Nkt2M1c3NVEwU1FsTzJRb0xFZ3h3NG91WFFVeVB3NzlPL0NGT1JkbXIyT2pj?=
 =?utf-8?B?WGFLZ3JZMXU2ZjhXMmR1SXhFblE2alA4d25rWGNqKzhzajVMbnZXS2g3U1Jr?=
 =?utf-8?B?aHMrZWVtcGVFL2c3ZG9UajU1STQ0MDdPZU1kTmZ5MWxBandoL3BKVUFoQzZj?=
 =?utf-8?B?UHFURWN6SXFoMGdBZnZtKy9HWjlMU0s1RTh5Y1BOM2VNdUhsRU5NTHAvWTNP?=
 =?utf-8?B?d05FWWVaVXF6a0lkaC96cWJiK2gvajBqZTl0Sk40cFNDMzhVak5ZQUVzZy9L?=
 =?utf-8?B?S09xaWlZSFFpSjN2U21ubzdKd2FEWnpPYkY3QWJFQzBtd2pDKzJUMVNtU0o1?=
 =?utf-8?B?RlhjekRjL1Z5SDUyampZOWZJa1FRVGEycVp6SVNoemxSYmgwSVhsZFQ4eE9H?=
 =?utf-8?B?ck5BUVpVQ0ZadEFNa0tJbDZxYm1VU0czQUlUTXpNK3ZDMlh6S25FMnVEK0E5?=
 =?utf-8?B?S20zSkwrQlVyMG1EQ1lwYnM2NFpMOVl1NHBBYXZ3QmtIdmF5WGpzMWNMdGlX?=
 =?utf-8?B?ODhZeXZsMjczN0dwcnpmRlowRTNSbmJ1TC9KWlRjaEx1bDBQSE5DSDJRNjM4?=
 =?utf-8?B?QkNOaHIzRHFLQk03aUl2ejNhd2dFOXdzWG9OV1lZNit0cDFMTG1GeGVSR0w0?=
 =?utf-8?B?QUtrQ2RiNjB2aGxxazlpVTFnb0ZjVmpPeWYvbjR3dm9HT2p5Z3dwOGoxMTVu?=
 =?utf-8?B?TlJXb0ZpSmJlY3lmajZoSlZub05sWU93dzZwTDdyL1FWS3pEbXBXTkFUUzJq?=
 =?utf-8?B?TTBQQ2J5SnhFc2ZseGMwTWVHbVErY2ZlbE5EdG5rSjB1N3pYT1ZaNDVOMkMr?=
 =?utf-8?B?Y0UrZDFucStUdi9GRDF0NE02a2JyYUNWTGRtamZTbUNLSE9kWEVZWTdveHoz?=
 =?utf-8?B?OUZ6WjdCS0xjMW9pVk1tdlZoWmZSc1Y5YUwrR1cyL3EwMDVxbGpKZzFLdERO?=
 =?utf-8?B?WUJMQ2ttRWlxNUl3YWM3VHl6U1lYQ21zNDVLVk5jMWY2WE1lU1hUMTV6RGpO?=
 =?utf-8?B?aXpCWGYweVUyWU8wYjk5YjZhODUwQzlJZjBVQlNLS3ltaW4yRVVlWHhsb29L?=
 =?utf-8?Q?Z9PZ+qIrTR4HUAqexNSNnpZ4K0/TNhzSW/Dj741?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3424
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	364d91d9-7cc6-44db-26c0-08d9405f490d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dTzhcUOxRX6axLvoD68ze+ZQDOCd15ibOAJXRIWi9/LwfcvRiK/q5o2pzlST0LhtLMM9Xk2Q3RoP5TDzbaAqnZgxm3PrXyXowY2d7WZwaX+1Fv4F575/mJKdhBwUHOcu0Wgs+5VXhKTmco+AsPpQdWPRsyifhsMfCcx41pq9HcmJ0S4fl3oodF0bqVYyysiiskl0JOPUVmvlCJA2SjhFlf+tjmt3vnzToWZp6S6C/9fzLv7VRrGdNjzUqSrG5Vbyc0JRYcXgIC7+oB0bw71m9MKbwLnypV+F+gDZ0M84ah3Pkf6BLfjctWSKL2r6wJ+oLYSXMtJS2iaIT9HXv3ySkMj47CaKT4Qo7j3G5t/fpt+nbwjkGWxh0MG5V7Xn9Q+0po77+dTiqMEOEG46+jzzDlYwSosD8YsddWSlaxOckHqMW6MNnaE3nIaHChLrpZsa4YH5OTQkhbw9M58plRlhI/aYibbcW4wTI/NF+vUkSfP5STqoNwCBK7SmKe7k6UMxepRls81N7hh0C2FsaswSEN7dK97nwweRd2wnlyd1N+Ko0A6Gq+GYsNUz6LSh/O1FlCpdeJQK17u5cR2y1HTuWb17t5k7G3rK3rlFzfBaox8OFVSBGguxsTGWekwidzB9IE/2gOII4wEVPg40htsiUb2Zi6d6a/ljWtJhrA8GHD4Enh1eXUhbJRUTF5DpfcUzX4kjQ8ck8nouFSjwTbtZpQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(46966006)(36840700001)(70586007)(52536014)(6506007)(47076005)(54906003)(8936002)(478600001)(55016002)(9686003)(36860700001)(53546011)(110136005)(70206006)(8676002)(82740400003)(26005)(4326008)(316002)(186003)(7696005)(33656002)(356005)(86362001)(81166007)(336012)(2906002)(83380400001)(5660300002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 09:20:32.8971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce843e5c-8cf7-4889-a86d-08d9405f4e50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1688

SGkgSnVsaWVuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSnVsaWVu
IEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gU2VudDogVHVlc2RheSwgSnVseSA2LCAyMDIxIDU6
MTAgUE0NCj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5aaGVuZ0Bhcm0uY29tPjsgeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOw0KPiBzc3RhYmVsbGluaUBrZXJuZWwub3JnOyBqYmV1bGlj
aEBzdXNlLmNvbQ0KPiBDYzogQmVydHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0u
Y29tPjsgV2VpIENoZW4NCj4gPFdlaS5DaGVuQGFybS5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFU
Q0ggNC85XSB4ZW4vYXJtOiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uDQo+IA0KPiANCj4g
DQo+IE9uIDA1LzA3LzIwMjEgMDg6MjgsIFBlbm55IFpoZW5nIHdyb3RlOg0KPiA+IEhpIEp1bGll
bg0KPiANCj4gSGkgUGVubnksDQo+IA0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiA+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+PiBTZW50OiBUaHVy
c2RheSwgSnVseSAxLCAyMDIxIDI6MTAgQU0NCj4gPj4gVG86IFBlbm55IFpoZW5nIDxQZW5ueS5a
aGVuZ0Bhcm0uY29tPjsNCj4gPj4geGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3Rh
YmVsbGluaUBrZXJuZWwub3JnOw0KPiA+PiBqYmV1bGljaEBzdXNlLmNvbQ0KPiA+PiBDYzogQmVy
dHJhbmQgTWFycXVpcyA8QmVydHJhbmQuTWFycXVpc0Bhcm0uY29tPjsgV2VpIENoZW4NCj4gPj4g
PFdlaS5DaGVuQGFybS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC85XSB4ZW4vYXJt
OiBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uDQo+ID4+DQo+ID4+IEhpIFBlbm55LA0KPiA+
Pg0KPiA+PiBPbiAwNy8wNi8yMDIxIDAzOjQzLCBQZW5ueSBaaGVuZyB3cm90ZToNCj4gPj4+IFRo
aXMgcGF0Y2ggaW50cm9kdWNlcyBzdGF0aWMgbWVtb3J5IGluaXRpYWxpemF0aW9uLCBkdXJpbmcg
c3lzdGVtDQo+ID4+PiBSQU0gYm9vdA0KPiA+PiB1cC4NCj4gPj4NCj4gPj4gVGhlIHdvcmQgIlJB
TSIgbG9va3Mgc3B1cmlvdXMuDQo+ID4+DQo+ID4NCj4gPiBUaHguIEkgY2hlY2sgdGhlICJzcHVy
aW91cyIgaW4gZGljdGlvbmFyeSwgaXQgbWVhbnMgZmFrZT8gU28gSSB3aWxsIGxlYXZlDQo+ICJk
dXJpbmcgc3lzdGVtIGJvb3QgdXAiDQo+ID4gaGVyZS4NCj4gDQo+IFllcywgdGhpcyByZWFkcyBi
ZXR0ZXIuDQo+IA0KPiA+Pj4gMi4gc2NydWIgdGhlIHBhZ2UgaW4gbmVlZCBzeW5jaHJvbm91c2x5
Lg0KPiA+Pg0KPiA+PiBDYW4geW91IGV4cGxhaW4gd2h5IHRoaXMgaXMgbmVjZXNzYXJ5Pw0KPiA+
Pg0KPiA+DQo+ID4gU2luY2UgSSdtIGJvcnJvd2luZyB0aGUgbG9naWMgaW4gZnJlZV9oZWFwX3Bh
Z2VzLCBJJ20gYWxzbyB0cnlpbmcgdG8gY292ZXIgYWxsDQo+IHRoZSBzY2VuYXJpb3MgaGVyZSBs
aWtlIGl0IGRvZXMuDQo+ID4gU28gSSBhc3N1bWUgdGhhdCBmcmVlX3N0YXRpY21lbV9wYWdlIHdp
bGwgbm90IG9ubHkgYmUgdXNlZCBvbiBpbml0aWFsaXphdGlvbiwNCj4gYnV0IGFsc28gd2hlbiBk
ZXN0cm95aW5nL3JlYm9vdGluZyB0aGUgZG9tYWluLg0KPiA+IE9uIHRoZXNlIGNhc2VzLCBpdCBp
cyBuZWNlc3NhcnkgdG8gc2NydWIgdGhlIHBhZ2UsIGlnLg0KPiANCj4gSSB3YXNuJ3QgYXNraW5n
IGFib3V0IHNjcnViYmluZyBzcGVjaWZpY2FsbHkgYnV0IGluc3RlYWQgd2h5IGl0IGlzIHN5bmNo
cm9ub3VzLg0KPiBTb3JyeSBmb3IgdGhlIGNvbmZ1c2lvbi4NCj4gDQoNCkkndmUgcmVhZCBhc3lu
Y2hyb25vdXMgc2NydWJiaW5nIGluIGJ1ZGR5IGFsbG9jYXRvciwgcGFnZXMgdGhhdCBuZWVkIGEg
c2NydWIgYXJlIGFkZGVkIHRvIHRhaWwsIA0KYW5kIHNwZWNpZmljIHdvcmtpbmcgdGhyZWFkIGlz
IHdvcmtpbmcgb24gaXQsIGhtbSwgaW1vLCBJIGRvbid0IHRoaW5rIGl0IGNvdWxkIGJlIHNpbXBs
eSBhcHBsaWVkIGludG8gc3RhdGljDQptZW1vcnkuIDovDQoNClNvIEkgcHV0IGFzeW5jaHJvbm91
cyBzY3J1YmJpbmcgaW4gI1RPRE8uDQoNCj4gQ2hlZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdy
YWxsDQoNCkNoZWVycw0KDQotLQ0KUGVubnkgWmhlbmcNCg==

