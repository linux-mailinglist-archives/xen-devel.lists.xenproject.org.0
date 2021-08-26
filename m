Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0193F8313
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 09:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172717.315180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9ke-0000Jp-6s; Thu, 26 Aug 2021 07:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172717.315180; Thu, 26 Aug 2021 07:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ9ke-0000H1-20; Thu, 26 Aug 2021 07:24:40 +0000
Received: by outflank-mailman (input) for mailman id 172717;
 Thu, 26 Aug 2021 07:24:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J+8W=NR=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mJ9kc-0000G8-LK
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 07:24:38 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aad569fc-063e-11ec-a9d2-12813bfff9fa;
 Thu, 26 Aug 2021 07:24:37 +0000 (UTC)
Received: from AS8PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:20b:311::14)
 by DB6PR08MB2645.eurprd08.prod.outlook.com (2603:10a6:6:24::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Thu, 26 Aug
 2021 07:24:35 +0000
Received: from AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::85) by AS8PR05CA0009.outlook.office365.com
 (2603:10a6:20b:311::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 26 Aug 2021 07:24:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT048.mail.protection.outlook.com (10.152.17.177) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Thu, 26 Aug 2021 07:24:35 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Thu, 26 Aug 2021 07:24:34 +0000
Received: from b3c2c12f2ce7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 796BEFA8-A639-49BD-8C04-2149992F002C.1; 
 Thu, 26 Aug 2021 07:24:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3c2c12f2ce7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 26 Aug 2021 07:24:24 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DBAPR08MB5782.eurprd08.prod.outlook.com (2603:10a6:10:1b2::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 26 Aug
 2021 07:24:20 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::b06a:b1ca:ba5f:f3b7%8]) with mapi id 15.20.4436.024; Thu, 26 Aug 2021
 07:24:20 +0000
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
X-Inumbo-ID: aad569fc-063e-11ec-a9d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PqQDYoEh5EF88ragy7e47PuG7hC/W+ZvMSex2qHOhs=;
 b=CycTE3kyva+gSGHdT6sr375dNo5T0lbzJafNkQc+iYTuYwPJwFMdA5zm/+NTPHUXXc9GuUdaEIgSo/IWs6DHXlg00UAYopwztNCHusS6Zs4uzVQM/fZ0jq7dmyGUYcBHga0JdWoj13B+1kvShfEdpAo0rU2EAfTbp6Bys7GlChs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G92tyDzjMRTF2mgOTFsXGv6eqLKc1pH0LW/l9aIm5N3A6Vmwnz2oo9DStOEjZXyZWSg+hXJfRFnbVvLZhGc4oREPd8fvdHMou7UJLCJgHeFS/NFa7LmqUpNnk/4lZsLDP6o7mIis42I0P3IP6tbf/fLXoGAgHTXKbzznZnYS9xT0uFOms56t7fQ5yvG9aizbqusOuR1ael/7Jap95V/jWTik7d3+QSyJNkKngsDmwvr7PwNwdYqXJIBSAKscLPJmp60treuuEwjvVilRnpwN3QokcPGM5jZ35X7XDY07GvXx7/w0aeogMsyapcP3zXD3HxpQVKL6NAeZ4ibGQjOEWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PqQDYoEh5EF88ragy7e47PuG7hC/W+ZvMSex2qHOhs=;
 b=UTKhpWFkDMHfteg78KgQirGUmZ4V7YeWx7+U6u6pL8WPnk3I8mfkvR8v6wnhheGoLoVzMgYPoRecI1eFRQPaTYyJ7fbXejYDe78BxIg9PHiXi8UIp3IMysga4v5ZGnV8ZVLalq/32vss5ZXv/BI+6//3Jtr1Eh2p9dMma2eyS9BurMStHsLh6yuHn6qTOv4z94jckkwNAl2wRSu4CMQzGVrsuXDnlg1YivxqkQCvrR5dwVSjOlWs0CmZLBIu6XDPjqG0i64nxiLPXcHg5QPJ1VJLA5SeEuvAvdxPxMIw8Q9NZoUSEeC7DS/rU7FVofhMb2FLop8+L3WmXWCwc9SAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PqQDYoEh5EF88ragy7e47PuG7hC/W+ZvMSex2qHOhs=;
 b=CycTE3kyva+gSGHdT6sr375dNo5T0lbzJafNkQc+iYTuYwPJwFMdA5zm/+NTPHUXXc9GuUdaEIgSo/IWs6DHXlg00UAYopwztNCHusS6Zs4uzVQM/fZ0jq7dmyGUYcBHga0JdWoj13B+1kvShfEdpAo0rU2EAfTbp6Bys7GlChs=
From: Wei Chen <Wei.Chen@arm.com>
To: Julien Grall <julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: RE: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to NUMA
 system
Thread-Topic: [XEN RFC PATCH 26/40] xen/arm: Add boot and secondary CPU to
 NUMA system
Thread-Index: AQHXjptLf/jfnZiVikStQBDm6XRL0auEh6AAgADr9fA=
Date: Thu, 26 Aug 2021 07:24:20 +0000
Message-ID:
 <DB9PR08MB6857FC8EA8C0D324426408709EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-27-wei.chen@arm.com>
 <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
In-Reply-To: <35a57b18-4fab-522d-f39a-de21017abe57@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 0749047618C9224BB9976CAA7282FE8C.0
x-checkrecipientchecked: true
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 697fc537-4b80-47ad-bb03-08d968628e3b
x-ms-traffictypediagnostic: DBAPR08MB5782:|DB6PR08MB2645:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<DB6PR08MB2645C5DC27480AC9F261034C9EC79@DB6PR08MB2645.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Mcn5LxWWtxcr1hn206gPehALnYO5HxdGZtxrU6U8fJD1aXFXr6tdJvDZkGR34xC8adGmcBEH7QQo6jqzYaFP5meJeXQupRpcVy+c4Q1IjWRPY5hY9etZWGUgOCenDfIIN62FX+eNDVuvQlbtkHPGl7qNE59lFi8mVKr03csHrc+Y0AZTNIruKPW8NsEjpLU0Xnv9xnz4+PRua6kqBQEHfKOGhNbNWJnUrZ3fKKtClCn8kWQbQ2ZV97n1UI8JjFhst52HKIUYLViz1CdGdUpJf3Mf1aKeQRgOwXAvpSbjZIipC3M9ks2p6swOmRaDsqUVn1SLNbyWyAmBu1fkSJAQAJ/G3mD+oCGc4pvHOrHND8CXKaqJ0Tmol4agOONk9UBzZsQ40bk0PnVvwegktqSzADTibeZxrZ4zynUUnZNjWjrQ4BzA1bss9zJR80MV3aliqaUW/of/oQGIX6nBG3FEmzDorcsk7HzJz/ciM+tma1t733N5cM8zxD+RUizvi/I+qaiEqnbMUUBf+4FDtvjzTL/yMw0Ncwr8g+xjbwiAIMFyD9H2VOdIwd9/n4WP/HhtGOMwL/mg4ViGT2VQB+lEo5NdNQtrUG3giBtvn6veGZ8un9TDSgoTLS5xHKtWqZgA+NtIrVYoY6kQC/AnlRduwElgOmO4JEmKPgE6B7GrNqW9olImRytoGW99IpE/nITNwc6i9yreXCrg3lyQFpDIyQ==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(66446008)(64756008)(66556008)(66476007)(8936002)(86362001)(122000001)(83380400001)(71200400001)(6506007)(2906002)(53546011)(76116006)(26005)(38100700002)(66946007)(4326008)(33656002)(38070700005)(52536014)(316002)(186003)(5660300002)(110136005)(8676002)(55016002)(478600001)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VngzcWZFZmpYcGE0ZXZhV1lyV1dKc3J4TzF1dHhiMW5XOVJEZGlaZTg3MTJ3?=
 =?utf-8?B?QWR3dS9KYmd2RWhyRTY3N3FrSjJVelJsMDFDa1doWkRyODFKSHRjajFNc3VO?=
 =?utf-8?B?b2QxV0Z3MTRCNGFaUzh1TUpxOUNLV1R1ckEyVHJJMEo4VnUxVUR4S2w2aGcw?=
 =?utf-8?B?U0NCNzhYVENxdHphN2pQQmxLcTRKWlMxelhPbCtxRHJISHk5YmwvZEh5SGJR?=
 =?utf-8?B?Z1JqUk9VeHk4Ti8weW4vYjloWEJ5MDA4TGFBM1FtZlozdnFlTkFjMys4YjBv?=
 =?utf-8?B?aXh5cEdLeTZ5UUdXOWpPQVlWMGRySzFZMTBtcWJlYXpYcURXQnFQMjl0Q2t3?=
 =?utf-8?B?S2FQSlZlUUozblU2QTJLZ2NaZERSRGVNazV0M1VBTjNPMWp5M1ZWWk4vMkNy?=
 =?utf-8?B?ckFQMkNlK1Y4YldYd2pDb3dISGpVZ244OE8xWE5jNWZCSHp5VXlxbDhzTkpJ?=
 =?utf-8?B?Y3FYbyswMHBrOHl2YkQrWGdsMVE3NWxUenNYdU9ZVUIzNmVhUDJETFJ6SXdv?=
 =?utf-8?B?WUtIcTFGZ0JCSEJvb3E1Ti94T2ovRE81SkVGdHhrOVJJL3AxdHd5dS9MVmRT?=
 =?utf-8?B?TUpyTlUzTytjUmQwaGpsOWUrWXFEOXdCN2wvc0NNcmR4SkZwbzRTZHIvU0dh?=
 =?utf-8?B?Q0hnRXZUU0VOWWlIOGRmTC83NHRNT1g0YUVWcDdTOFJiTTQrb1g1Tmxvb2tI?=
 =?utf-8?B?cm9IUktuZGM0TTlxUFFMWm5RRWhOOGxyU1hmaktaM1hMSVo3Tmdnb3JoaGJ5?=
 =?utf-8?B?blplWmVoNkhORnhUOXZWMzJDSFdQVUQxajl0aHcveitaa3FoaTMrZ0lqTFdk?=
 =?utf-8?B?K0xoZWZFaXpJQXZZNDE0S1RBWUw5NTI4UjcwYmJwOFI1dlBRWkxBTFM3Z2d1?=
 =?utf-8?B?SlBsQWtxdVVZbE9JSU0rQlovM2FVTHRTVEdNSFNjTG5VdXBCK1RPQTNFcDB0?=
 =?utf-8?B?aXlXUS9wSndjSjlWeDhRaWNValJDSmRTbk03K3piM2RrVmpJTUpkZXdzcDNT?=
 =?utf-8?B?MGxSSGhuSis3cG1YU2lSZW9nMGxFVDdQWGFneVY0bE80S0NuVFRiOVhacStw?=
 =?utf-8?B?SUFBYjgrdmxSaUxyZ0hjYzk4L1pkYll3KzFqelZkaUczTmdIK3Z4QW4wVVpD?=
 =?utf-8?B?ZjgySmRjbGNvK09objdNT3VyT1puMFZXTXAxR1ZoZ1hmNkh3b1hTOERkL2lT?=
 =?utf-8?B?RHZCN1BoM1dRV2ZQZVA3Q3VrcDc1M1dUaXJIU2RlbmgwSU9wM29pZUlQQ21z?=
 =?utf-8?B?TnRUN25saE9TUG9JajJ2N0tMLzdhbEtFTnpFNk5zM3RvZ3gxUlYzRzVNbFNJ?=
 =?utf-8?B?WVJ5TUlaUVNxV0QxbjRKanJmUnBsQTFHZnEvcUJjaXBvUm4yaUhFWGtCOU05?=
 =?utf-8?B?eHV3NDNxVWxML1M1VW1vbytiZlllU0VSYzlVTUZyV1JMV1pSSElIb1JZajdp?=
 =?utf-8?B?WkI5dFNhS3QwYjdGOWdmR1ZFYmNYVFk0bkV6ejdWb0dqZk81QStnUEUwblFn?=
 =?utf-8?B?OGZJNEpod1ZNWE5lZnpFTG42bTlDQVRqL1E2K05DRm5VaXJDMGpWelBtZDZm?=
 =?utf-8?B?NW9FZm9VbGVQaVJsWG1nUFFmYW53MDMwRTFmMVVmcHdYcmRpWC8vRDgvNW8v?=
 =?utf-8?B?R1ZGelh0MElLRnhham1nUkRlWXZyV1FxRktaNlhVdTZvclVEQ2NGcEFERkZG?=
 =?utf-8?B?NVZmUWc0Zzc3VHpSOGJycjB3TGtTcDQrd3E5Q0F3anViWWtZZVRPUjFjalJw?=
 =?utf-8?Q?bB4c9AyFfhF/YTPMVn573SghzAsWEa0jyPHA+/5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5782
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	03e8e115-4697-4a86-6674-08d96862859c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hCepLwLhm5m+2zG1nKX4YjwAvF669ABzE+5fSEl4n4jxlHlU4PFjqBqwVSZqUtB3nFeeV/8M702lBpJC0ITL6G0qgmS6ZS5u5jfJLy8R3OZb8TJQ8HPFwdoViYrBuT+sFfkZ+P+ShokYZi7SW7JnZqA2OgpC0TwubutXjqEBbJeh1jDWP+Svr6K2VUr/+aVn+ms3igd6E3iPqsHIZ2FTQYbz3VJP66NnUSVtlkrbW9LdgAiU7vYGzLsPPyY+26imSQCZjInHXwEdbzl9vaVKTC29ATpRt+4H7JgB43uFvMqQLoF0S6zZKj8RgBHV/JnDWYO2swjMqk1IvxCJXubdQ6f1GfPckWVdODaHk9NArZLyfNl4fIvHsVw+KoV9bOrv8mIXvaqrNp08o8i/5rrqmdJhDJGuugGitv1mmrVcZ3z10reFgo8KzqaXUK34oQuPvc5chGRTe3ILRePrsQ1xU5F1wZLTtZdk8NKZsgm+gaNiYsqvOT/7B1Wpk9yHozYvxiO49eNTOuRx2RHEHDlhLeqIbb1TYEmW6fXxayL2jYuxpEUYFRV90ss25WjlY8Tg+8eoaDJga41WB4ngkAULxfW5iwn2WBNkFuTWMoPaS2SWDkAWRczCcWZPXz1dHdBQIarLoTnLR/TCTA11VuzT0YZMOos0uB6NiSJNnN7+RNCQK5dGzgc2JjZT5VY2tmiBkrpdUpE9XBayBG7l5GsrAg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(83380400001)(336012)(4326008)(26005)(55016002)(33656002)(508600001)(7696005)(9686003)(86362001)(110136005)(53546011)(6506007)(70586007)(47076005)(2906002)(81166007)(70206006)(8676002)(52536014)(82310400003)(8936002)(356005)(5660300002)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2021 07:24:35.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 697fc537-4b80-47ad-bb03-08d968628e3b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR08MB2645

SGkgSnVsaWVuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEp1bGll
biBHcmFsbCA8anVsaWVuQHhlbi5vcmc+DQo+IFNlbnQ6IDIwMjHlubQ45pyIMjbml6UgMDo1OA0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmc7DQo+IHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc7IGpiZXVsaWNoQHN1c2UuY29tDQo+
IENjOiBCZXJ0cmFuZCBNYXJxdWlzIDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+DQo+IFN1Ympl
Y3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAyNi80MF0geGVuL2FybTogQWRkIGJvb3QgYW5kIHNlY29u
ZGFyeSBDUFUgdG8NCj4gTlVNQSBzeXN0ZW0NCj4gDQo+IEhpIFdlaSwNCj4gDQo+IE9uIDExLzA4
LzIwMjEgMTE6MjQsIFdlaSBDaGVuIHdyb3RlOg0KPiA+IFdoZW4gY3B1IGJvb3QgdXAsIHdlIGhh
dmUgYWRkIHRoZW0gdG8gTlVNQSBzeXN0ZW0uIEluIGN1cnJlbnQNCj4gPiBzdGFnZSwgd2UgaGF2
ZSBub3QgcGFyc2VkIHRoZSBOVU1BIGRhdGEsIGJ1dCB3ZSBoYXZlIGNyZWF0ZWQNCj4gPiBhIGZh
a2UgTlVNQSBub2RlLiBTbywgaW4gdGhpcyBwYXRjaCwgYWxsIENQVSB3aWxsIGJlIGFkZGVkDQo+
ID4gdG8gTlVNQSBub2RlIzAuIEFmdGVyIHRoZSBOVU1BIGRhdGEgaGFzIGJlZW4gcGFyc2VkIGZy
b20gZGV2aWNlDQo+ID4gdHJlZSwgdGhlIENQVSB3aWxsIGJlIGFkZGVkIHRvIGNvcnJlY3QgTlVN
QSBub2RlIGFzIHRoZSBOVU1BDQo+ID4gZGF0YSBkZXNjcmliZWQuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBXZWkgQ2hlbiA8d2VpLmNoZW5AYXJtLmNvbT4NCj4gPiAtLS0NCj4gPiAgIHhlbi9h
cmNoL2FybS9zZXR1cC5jICAgICAgIHwgNiArKysrKysNCj4gPiAgIHhlbi9hcmNoL2FybS9zbXBi
b290LmMgICAgIHwgNiArKysrKysNCj4gPiAgIHhlbi9pbmNsdWRlL2FzbS1hcm0vbnVtYS5oIHwg
MSArDQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vc2V0dXAuYyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+
ID4gaW5kZXggM2M1OGQyZDQ0MS4uNzUzMTk4OWYyMSAxMDA2NDQNCj4gPiAtLS0gYS94ZW4vYXJj
aC9hcm0vc2V0dXAuYw0KPiA+ICsrKyBiL3hlbi9hcmNoL2FybS9zZXR1cC5jDQo+ID4gQEAgLTkx
OCw2ICs5MTgsMTIgQEAgdm9pZCBfX2luaXQgc3RhcnRfeGVuKHVuc2lnbmVkIGxvbmcNCj4gYm9v
dF9waHlzX29mZnNldCwNCj4gPg0KPiA+ICAgICAgIHByb2Nlc3Nvcl9pZCgpOw0KPiA+DQo+ID4g
KyAgICAvKg0KPiA+ICsgICAgICogSWYgWGVuIGlzIHJ1bm5pbmcgb24gYSBOVU1BIG9mZiBzeXN0
ZW0sIHRoZXJlIHdpbGwNCj4gPiArICAgICAqIGJlIGEgbm9kZSMwIGF0IGxlYXN0Lg0KPiA+ICsg
ICAgICovDQo+ID4gKyAgICBudW1hX2FkZF9jcHUoMCk7DQo+ID4gKw0KPiA+ICAgICAgIHNtcF9p
bml0X2NwdXMoKTsNCj4gPiAgICAgICBjcHVzID0gc21wX2dldF9tYXhfY3B1cygpOw0KPiA+ICAg
ICAgIHByaW50ayhYRU5MT0dfSU5GTyAiU01QOiBBbGxvd2luZyAldSBDUFVzXG4iLCBjcHVzKTsN
Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL3NtcGJvb3QuYyBiL3hlbi9hcmNoL2FybS9z
bXBib290LmMNCj4gPiBpbmRleCBhMWVlMzE0NmVmLi5hYTc4OTU4YzA3IDEwMDY0NA0KPiA+IC0t
LSBhL3hlbi9hcmNoL2FybS9zbXBib290LmMNCj4gPiArKysgYi94ZW4vYXJjaC9hcm0vc21wYm9v
dC5jDQo+ID4gQEAgLTM1OCw2ICszNTgsMTIgQEAgdm9pZCBzdGFydF9zZWNvbmRhcnkodm9pZCkN
Cj4gPiAgICAgICAgKi8NCj4gPiAgICAgICBzbXBfd21iKCk7DQo+ID4NCj4gPiArICAgIC8qDQo+
ID4gKyAgICAgKiBJZiBYZW4gaXMgcnVubmluZyBvbiBhIE5VTUEgb2ZmIHN5c3RlbSwgdGhlcmUg
d2lsbA0KPiA+ICsgICAgICogYmUgYSBub2RlIzAgYXQgbGVhc3QuDQo+ID4gKyAgICAgKi8NCj4g
PiArICAgIG51bWFfYWRkX2NwdShjcHVpZCk7DQo+ID4gKw0KPiANCj4gT24geDg2LCBudW1hX2Fk
ZF9jcHUoKSB3aWxsIGJlIGNhbGxlZCBiZWZvcmUgdGhlIHBDUFUgaXMgYnJvdWdodCB1cC4gSQ0K
PiBhbSBub3QgcXVpdGUgdG9vIHN1cmUgd2h5IHdlIGFyZSBkb2luZyBpdCBkaWZmZXJlbnRseSBo
ZXJlLiBDYW4geW91DQo+IGNsYXJpZnkgaXQ/DQoNCk9mIGNvdXJzZSB3ZSBjYW4gaW52b2tlIG51
bWFfYWRkX2NwdSBiZWZvcmUgY3B1X3VwIGFzIHg4Ni4gQnV0IGluIG15IHRlc3RzLA0KSSBmb3Vu
ZCB3aGVuIGNwdSBicmluZyB1cCBmYWlsZWQsIHRoaXMgY3B1IHN0aWxsIGJlIGFkZCB0byBOVU1B
LiBBbHRob3VnaA0KdGhpcyBkb2VzIG5vdCBhZmZlY3QgdGhlIGV4ZWN1dGlvbiBvZiB0aGUgY29k
ZSAoYmVjYXVzZSBDUFUgaXMgb2ZmbGluZSksICANCkJ1dCBJIGRvbid0IHRoaW5rIGFkZGluZyBh
IG9mZmxpbmUgQ1BVIHRvIE5VTUEgbWFrZXMgc2Vuc2UuDQoNCg0KDQo+IA0KPiA+ICAgICAgIC8q
IE5vdyByZXBvcnQgdGhpcyBDUFUgaXMgdXAgKi8NCj4gPiAgICAgICBjcHVtYXNrX3NldF9jcHUo
Y3B1aWQsICZjcHVfb25saW5lX21hcCk7DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUvYXNtLWFybS9udW1hLmggYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IGluZGV4
IDdhMzU4OGFjN2YuLmRkMzEzMjRiMGIgMTAwNjQ0DQo+ID4gLS0tIGEveGVuL2luY2x1ZGUvYXNt
LWFybS9udW1hLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS9hc20tYXJtL251bWEuaA0KPiA+IEBA
IC01OSw2ICs1OSw3IEBAIGV4dGVybiBtZm5fdCBmaXJzdF92YWxpZF9tZm47DQo+ID4gICAjZGVm
aW5lIF9fbm9kZV9kaXN0YW5jZShhLCBiKSAoMjApDQo+ID4NCj4gPiAgICNkZWZpbmUgbnVtYV9p
bml0KHgpIGRvIHsgfSB3aGlsZSAoMCkNCj4gPiArI2RlZmluZSBudW1hX2FkZF9jcHUoeCkgZG8g
eyB9IHdoaWxlICgwKQ0KPiANCj4gVGhpcyBpcyBhIHN0dWJzIGZvciBhIGNvbW1vbiBoZWxwZXIu
IFNvIEkgdGhpbmsgdGhpcyB3YW50cyB0byBiZSBtb3ZlZA0KPiBpbiB0aGUgIUNPTkZJR19OVU1B
IGluIHhlbi9udW1hLmguDQo+IA0KDQpPSw0KDQo+ID4gICAjZGVmaW5lIG51bWFfc2V0X25vZGUo
eCwgeSkgZG8geyB9IHdoaWxlICgwKQ0KPiA+DQo+ID4gICAjZW5kaWYNCj4gPg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0NCj4gSnVsaWVuIEdyYWxsDQo=

