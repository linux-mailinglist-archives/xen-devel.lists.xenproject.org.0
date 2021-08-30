Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3340F3FB3F7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 12:39:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174978.318894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKegW-0006Y8-3m; Mon, 30 Aug 2021 10:38:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174978.318894; Mon, 30 Aug 2021 10:38:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKegW-0006Ve-0O; Mon, 30 Aug 2021 10:38:36 +0000
Received: by outflank-mailman (input) for mailman id 174978;
 Mon, 30 Aug 2021 10:38:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kec6=NV=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mKegU-0006VX-7s
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 10:38:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c99f983-46e1-4526-b462-1baa57b31bbb;
 Mon, 30 Aug 2021 10:38:30 +0000 (UTC)
Received: from DU2PR04CA0192.eurprd04.prod.outlook.com (2603:10a6:10:28d::17)
 by VE1PR08MB4877.eurprd08.prod.outlook.com (2603:10a6:802:a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.19; Mon, 30 Aug
 2021 10:38:25 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28d:cafe::24) by DU2PR04CA0192.outlook.office365.com
 (2603:10a6:10:28d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.22 via Frontend
 Transport; Mon, 30 Aug 2021 10:38:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.17 via Frontend Transport; Mon, 30 Aug 2021 10:38:25 +0000
Received: ("Tessian outbound 32695b2df2f8:v103");
 Mon, 30 Aug 2021 10:38:25 +0000
Received: from 2330efd530dc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D9851AE1-4918-478F-9E1B-5AEEA0023AFD.1; 
 Mon, 30 Aug 2021 10:38:18 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2330efd530dc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Aug 2021 10:38:18 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB8PR08MB5146.eurprd08.prod.outlook.com (2603:10a6:10:e7::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.18; Mon, 30 Aug
 2021 10:38:16 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::2c28:50cf:49fd:da32%7]) with mapi id 15.20.4457.024; Mon, 30 Aug 2021
 10:38:16 +0000
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
X-Inumbo-ID: 2c99f983-46e1-4526-b462-1baa57b31bbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5nW/huXgSWIRuHlwC1CbbuYHMGL9+q2u3Sgcn15UI=;
 b=E0yhM8iD2S4qarQ4Aw8JPFNCkuc1bOSgB5zgZBiMA5MABQT667OfvnP9ALader5DUI0FFXAXbd9ES7aYOAMbVEIXLQRtD5+MvIzxlyACHIDS2AtcNBZ+57vFXGJzv6iy9XeTkvNlxYC3tiMObx8eIXrP6RqLiWUHgE64CpdxxDE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GpQjdbRF1PcZHtBKRAPGh35R+5ynMcqY6s58t5ykqnojpODOYUdkzmD+zt+tl3jhl+kaPZjjYsm6ngE/Uoef1pwauZ9/Hy9S/ouSQ+Rn2xtzYw50uCPEmFTId+MnVjBIvI9Paq+5fGHYSXvn+YoECVR8Ni05fb1zDp+wpZNlmSypcRqCm/X1ZCfWCt0tOqyo6xO7zMnMcTwr8rOFnwJFgxpduSTqPgZdWY00OHtBUw3g73LfiNUr65d0o2JN+8ySVLRcCm24c4CK1sb3PNpdgB8uSb/bQZyVbqcLUpt99mnwtczB8MWTmA/IcxGIJEfPShykFLURabnKTlIZaLsxmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5nW/huXgSWIRuHlwC1CbbuYHMGL9+q2u3Sgcn15UI=;
 b=kfJ6W1+D/v6BpDjalwIpbWb/Z7DXV8/Pj9oZStDSyeNbeO2vEP/4VB26rPkI5fmuUmltlYex+4mNyacNDbQNe6+uZ4kKXUWwmMORuthdla93gT1i2pjDLRhhUdtbrF5ZB2IOYygIoAngRU3CWjBQ0zpKZ0iODYWZIuZ0MpJ2mM3UnLAAkbq9W5AofFywMhh4xmM3PSDgn/WkoLJQK7gPb8L1LRRF517AZ50DNFewMkwz5tT6VkzwL6Kmt1IsSHWhY4z8FomLoHwQXNZgXV5esnZJh58Mv7/zKx/QdP/pRFABbnq4VACNzzJbfngknm6kyP73Bi79jLdVChX6S5jKLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ5nW/huXgSWIRuHlwC1CbbuYHMGL9+q2u3Sgcn15UI=;
 b=E0yhM8iD2S4qarQ4Aw8JPFNCkuc1bOSgB5zgZBiMA5MABQT667OfvnP9ALader5DUI0FFXAXbd9ES7aYOAMbVEIXLQRtD5+MvIzxlyACHIDS2AtcNBZ+57vFXGJzv6iy9XeTkvNlxYC3tiMObx8eIXrP6RqLiWUHgE64CpdxxDE=
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
Subject: RE: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Topic: [XEN RFC PATCH 37/40] xen: introduce an arch helper to do NUMA
 init failed fallback
Thread-Index: AQHXjptRsfRkXW8NoUWuJvdR0xpL2KuHguqAgADGK1CAABeL8IADi6MAgAAJadA=
Date: Mon, 30 Aug 2021 10:38:16 +0000
Message-ID:
 <DB9PR08MB68570BE0DBD18707E51445E69ECB9@DB9PR08MB6857.eurprd08.prod.outlook.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-38-wei.chen@arm.com>
 <48a54187-3b6b-f98c-3681-906ee3df1694@xen.org>
 <DB9PR08MB685769E192E0603F3C723FA09EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857B7537C35BBF1CE347A4F9EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <5683d5a6-2694-5842-519a-5e3e3c8224fe@suse.com>
In-Reply-To: <5683d5a6-2694-5842-519a-5e3e3c8224fe@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 20B064392D2A3741A631D885E5A92D19.0
x-checkrecipientchecked: true
Authentication-Results-Original: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: c369baa4-4bc4-445e-4e28-08d96ba24bff
x-ms-traffictypediagnostic: DB8PR08MB5146:|VE1PR08MB4877:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB487728D0B9EFA127867C765B9ECB9@VE1PR08MB4877.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:1775;OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 o+/MITf8AtKwtJw87Y7qz/DwGn+mZOjswQYTv9HAwH5nlvsIVAYpTv5va/o2pSr1uvGHEisBZZjUVNVAON0bwOxyWqL25zps1i+SqyVN4UIoScGll+GxIwOYzTOfgIh/Ylpc7f6jJ/srGYLCkcdSdAGSAxgR7T6OQ681uTDiIVcwCCbkezhZ1DhPzuMnrSYZVldcxUZalk9AtQW9v48fs6zXuK79oOvUCQ0zliBjA9uIZ2NymUemlB6q0J7qFaQ9NJ6RaROvg9EaMyCR1azjlhk3A49cYgMHhwHyK5eSDkiTRx/vVhUiVM+HhdAICkUE9FV4mvHjPHm6gEBlvdw10B89iZ2dBZpdUA8b5tYHzJsQoYgdpIj/PrQENxAfs9s/6anI7kqNzsb+n3cTI8h3HUA+q9s83JGRiu70qStgoz9U4tjq/LWAsqgh+vxtTv2Fx+XT2XgBU1VGzD1CWXbNjoDi943EHY/0BFIThjpPi3oxpYScNfQAQIMTyLlsyLqCsrQ8vobo22cfw2TBVaJ4Vkej0/248Us3JD43R9MR13X2S4nIZn38oc4YP8MZLnMh5p2DwyPxNy0KrA14xlFI6UMB8chpUO+2FDpdJbXo7+rre+SZY7d2JOQahpQhJjRQj5V5Orp4FJREViSUu7eLGF4fqMKHyPoR4Fyea8RLyX+3vYu1Aw+G3hMlcgwMEwHIfpODoAanB+cwAf0dWNvgbw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(186003)(6916009)(2906002)(508600001)(122000001)(53546011)(83380400001)(86362001)(4326008)(38100700002)(26005)(71200400001)(64756008)(66446008)(8936002)(33656002)(7696005)(54906003)(55016002)(38070700005)(76116006)(66476007)(66556008)(66946007)(52536014)(8676002)(6506007)(9686003)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFMvcEFzQlJZaStWQnk3NEdoSmJUcGlGUUdkdllVVU44UlIzOVQxMG52ZG1I?=
 =?utf-8?B?SUZIZVN1ei9ONTB4WnpuR3diYlJSZDVjNUNqZkEycXg2OTlsS1Y1VXE4aEto?=
 =?utf-8?B?UVZKUGRPSWhSV3FMNlZ2RWdRaGJnVUsra1l1YlR4ODlKdEgzeDJ6R1dNWjdR?=
 =?utf-8?B?c0lPL3lwa1d5WDQ1Wms5MTdnSndwNHhqeWszMExWeUZoQVZQRW5GRTh5TTJC?=
 =?utf-8?B?V0tBR0lvRlZiQUdBNm1odSsxQ091Y3JBMCtVSTN0S0xpdlB5V05xbXpORGQ4?=
 =?utf-8?B?WUJNcUptMlVYWVJueDFPK1VDV0tuZ0h2OTRLTU9ZSzJaZ2ZjcWZRd0RENjI2?=
 =?utf-8?B?T1gyQVVXVWlYTFJJZDIwRE54Qmg2VTZ1aitENHVsNFhoWVJSVTdwWG9Bam5y?=
 =?utf-8?B?SCtUaTBadlVIOVNJV1ZBT2RSeW5yS250aHgwOG05TUdTQ240cHV2MG1kSXhV?=
 =?utf-8?B?a29sRG5HdmlUQmhQbWRTd2duVWRwMzlYRUlpeWQ5eDdyNlBzSmZxUEF0dnJX?=
 =?utf-8?B?aGpabnorUktuc3JzOFFGZ0VZUlZlaTRWRFI2ZEV6UE9CNDRVZWtLMEVYUUpz?=
 =?utf-8?B?eTBNcGwvWkpmK0NuU2VXUWlwbVFVUzQyYTFMNDY0K2tUd01HcVlqeWhuTEp5?=
 =?utf-8?B?S0RiaXZlWUNuc0xOVGI5ZkJFbTZXd3ByMzJhaTNHejd3dHFsMVlRd29uNTAy?=
 =?utf-8?B?YXZTL1ZHSjNIZGMveFI4QXRFaTNGRXhscHlyajlKTVIwZ2x4MlN4MjJjUWFi?=
 =?utf-8?B?OERNWWthY1F1dEpPRS92UXErOVlMcVduVVAvWmhaaElEdjkwVUdDc29TdWdR?=
 =?utf-8?B?M1pnU25HRUlXQ3ZTbjl1NVVqVmQ2ekZWK3R3bThic25acUF0UFo5ZVVQQVpn?=
 =?utf-8?B?QVk5YmxhaEhhYldUTkcxb1dVaFJrWHhpaHF0WnJPRU8rMTBsUFBmcjlYSml6?=
 =?utf-8?B?VklnZ2ZkYzlENGtMZ0JvcU1JMGVvT2ZtMG80MURYcTJMbHlyVnR1WS9EZzdN?=
 =?utf-8?B?K3hpemt1V0krNnNSTnkyUk16VkdBM0M4MU9nME9LZ3VFdkdGSGJHcnltRGV2?=
 =?utf-8?B?VnFzNm9HVUpZRVd1YTdFTFlsOHVIbmkrWVM5V3lzL0lHa3pHbTdkN3AvYUhM?=
 =?utf-8?B?cFJVdkY4ZGVLYW54SGxnZTEyWEFRdkVlMTBVUFVuMEZaeklhNmN6RGhWNGh1?=
 =?utf-8?B?QTJFSjAwSkE1QjJZeVZVTU9tbHUyQWNleEJkanlvVHJpemtwaXZUMXpRR21p?=
 =?utf-8?B?OHprN1JYZ0xIb0dPMG1JYWpoZGhXbzRZaXltVjhmaFg1bCtHN3F1SE9xQzV0?=
 =?utf-8?B?aDFwaTRPRk8yUW5kSXdlNU5EZEg0UTNWM1hSbHdONEpCaGN2N0ViTnpXbkk2?=
 =?utf-8?B?djgzZ2Ztam5ieGJOUzNnTzVUOTloL1o0Tk56VFJRWmRXQXJSV0pCTVVCN3RX?=
 =?utf-8?B?Vmx2K0gwL1JEUnhTNVQvMHZzd09SVVk2RDBROXAwUWU2OGhQOFU5eVVoSkI4?=
 =?utf-8?B?aWllV1NydVJLcWNDSzkrUlgrSEFEZTJEUW1KSlhqQllNVEJEdnZRSDN6MU80?=
 =?utf-8?B?OHphK0lXcU5nZDJBc3pBekgzb3BjcEk5NHRVVTRhYjVzTHZMSW5lU0U5Skpz?=
 =?utf-8?B?ekdnNjNnMDl5VmtSOW9QTGV3UnVUTm5KSW5CQVN2NmlTZVRZN3k4WkkraU5Q?=
 =?utf-8?B?S3VsZ25XMCs4RVBwQXFQc1BVVWtSaW5PVnZIQjRsUmF6V1pFazI0SUZuQlcy?=
 =?utf-8?Q?1P/SCanjfLxCMpth5VF25o05bmJoUSmTUcnqty5?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5146
Original-Authentication-Results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2e334e06-7912-4f6f-3ac9-08d96ba246ea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PM+i0HMXDZsy7WrAzAApW6QhTeOFwMqtOpfi/gb+e/Q6lBihBKX139oO3PRMcQaC/H1IjsSMSFeCle75rmlLD++5cmgqhlFZFoIMg328cieuLqy7vuXggdBJqh84QFAbF3dKoiVXEPo0fy/GYpsdXbaMQVCBlqLb4a852pd+EAQbjT4sUFR+7y0CzbwtUd8kOFu1YDkFT4/Fr2rBi5cf1acYR7DAWatjZniiUgBphfja8UEC7pJxC6BvIc2eygzfZz0U6aN7TjnJDH02LpxkKUUm8e3FhcxabFoQsL2rGowN7LAi+4EWrlaGlFcf/5RRXLEyKgxjkBmyM5joJ1g73VwW9nIiTxw5srEYCVo7+LjaeRaP/Ba29/2Z9l5vwe7jReC37abjYGQXoBYMf6MJmIaqS+i1L/aH7Am9CHesN66wu9PbKslL1Pvnp3oNgv1C9pqy5K8fVXB5q5eKJUehZhnjAzaShORKS0ytdv9IfPiafutgWqYS42d8V0MutBmavVQnVL2VUYAGcRYXH8g2j0yNTzGv81/pD9tARmBaXerrMgExna70MoFMbXS7yDMMfsGoFGLBmBrdFV4nAZ4QgttPIcVAkJmPOewuTx1J3WH7EudjHi6fuInmt2xisOaUChgEtThIUpQ3RVUtsklyrH9ElyO4P7Yn4p+VMASsIkOgBPuL4t4CXB8S5spPQDPEVpzVSS0NJlkVQepjmstprA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(8676002)(52536014)(8936002)(26005)(33656002)(36860700001)(336012)(82740400003)(4326008)(2906002)(83380400001)(6506007)(53546011)(47076005)(5660300002)(6862004)(316002)(7696005)(82310400003)(70586007)(107886003)(478600001)(86362001)(9686003)(81166007)(54906003)(55016002)(356005)(186003)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2021 10:38:25.3455
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c369baa4-4bc4-445e-4e28-08d96ba24bff
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4877

SGkgSmFuLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gU2VudDogMjAyMeW5tDjmnIgzMOaXpSAxNzo1Mg0K
PiBUbzogV2VpIENoZW4gPFdlaS5DaGVuQGFybS5jb20+DQo+IENjOiBCZXJ0cmFuZCBNYXJxdWlz
IDxCZXJ0cmFuZC5NYXJxdWlzQGFybS5jb20+OyBKdWxpZW4gR3JhbGwNCj4gPGp1bGllbkB4ZW4u
b3JnPjsgeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBzc3RhYmVsbGluaUBrZXJuZWwu
b3JnDQo+IFN1YmplY3Q6IFJlOiBbWEVOIFJGQyBQQVRDSCAzNy80MF0geGVuOiBpbnRyb2R1Y2Ug
YW4gYXJjaCBoZWxwZXIgdG8gZG8NCj4gTlVNQSBpbml0IGZhaWxlZCBmYWxsYmFjaw0KPiANCj4g
T24gMjguMDguMjAyMSAwNTo0NSwgV2VpIENoZW4gd3JvdGU6DQo+ID4+IEZyb206IFhlbi1kZXZl
bCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0K
PiBXZWkNCj4gPj4gQ2hlbg0KPiA+PiBTZW50OiAyMDIx5bm0OOaciDI45pelIDExOjA5DQo+ID4+
DQo+ID4+PiBGcm9tOiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4ub3JnPg0KPiA+Pj4gU2VudDog
MjAyMeW5tDjmnIgyN+aXpSAyMjozMA0KPiA+Pj4NCj4gPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0v
bnVtYS5jDQo+ID4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL251bWEuYw0KPiA+Pj4+IEBAIC0xNDAs
MyArMTQwLDE2IEBAIGludCBfX2luaXQgYXJjaF9tZW1pbmZvX2dldF9yYW1fYmFua19yYW5nZShp
bnQNCj4gPj4gYmFuaywNCj4gPj4+Pg0KPiA+Pj4+ICAgCXJldHVybiAwOw0KPiA+Pj4+ICAgfQ0K
PiA+Pj4+ICsNCj4gPj4+PiArdm9pZCBfX2luaXQgYXJjaF9udW1hX2luaXRfZmFpbGVkX2ZhbGxi
YWNrKHZvaWQpDQo+ID4+Pj4gK3sNCj4gPj4+PiArICAgIGludCBpLCBqOw0KPiA+Pj4+ICsNCj4g
Pj4+PiArICAgIC8qIFJlc2V0IGFsbCBub2RlIGRpc3RhbmNlIHRvIHJlbW90ZV9kaXN0YW5jZSAq
Lw0KPiA+Pj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBNQVhfTlVNTk9ERVM7IGkrKyApIHsNCj4g
Pj4+PiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IE1BWF9OVU1OT0RFUzsgaisrICkgew0KPiA+
Pj4+ICsgICAgICAgICAgICBudW1hX3NldF9kaXN0YW5jZShpLCBqLA0KPiA+Pj4+ICsgICAgICAg
ICAgICAgICAgKGkgPT0gaikgPyBOVU1BX0xPQ0FMX0RJU1RBTkNFIDoNCj4gPj4gTlVNQV9SRU1P
VEVfRElTVEFOQ0UpOw0KPiA+Pj4+ICsgICAgICAgIH0NCj4gPj4+PiArICAgIH0NCj4gPj4+PiAr
fQ0KPiA+Pj4NCj4gPj4+IC4uLiB0aGlzIGltcGxlbWVudGF0aW9uIGxvb2tzIGZhaXJseSBnZW5l
cmljLiBTbyBjYW4geW91IGV4cGxhaW4gd2h5DQo+IHdlDQo+ID4+PiBuZWVkIGl0IG9uIEFybSBi
dXQgbm90IHg4Nj8NCj4gPj4+DQo+ID4+DQo+ID4+IFRoaXMgaW1wbGVtZW50YXRpb24gaXMgRFQg
b25seSwgZm9yIHg4NiwgaXQncyB1c2luZyBhY3BpX3NsaXQuDQo+ID4+IEZvciBub3csIEkgYW0g
bm90IHF1aXQgc3VyZSBBQ1BJIG5lZWQgdG8gZG8gZmFsbGJhY2sgb3Igbm90Lg0KPiA+PiBPciBz
YXkgaW4gYW5vdGhlciB3YXksIEkgZG9uJ3Qga25vdyBob3cgdG8gaW1wbGVtZW50IHRoZSBmYWxs
YmFjaw0KPiA+PiBmb3IgQUNQSS4gSSBwbGFubmVkIHRvIHNvbHZlIGl0IGluIEFybSBBQ1BJIHZl
cnNpb24gTlVNQSwgc28gSSBsZWZ0DQo+ID4+IGFuIGVtcHR5IGhlbHBlciBmb3IgeDg2Lg0KPiA+
Pg0KPiA+PiBASmFuIEJldWxpY2ggQ291bGQgeW91IGdpdmUgbWUgc29tZSBzdWdnZXN0aW9uIGFi
b3V0IHg4NiBmYWxsYmFjaz8NCj4gPj4NCj4gPj4NCj4gPg0KPiA+IEkgaGF2ZSBhIHF1aWNrIGxv
b2sgaW50byBMaW51eC4gV2hlbiBBcmNoIGRvIG51bWEgaW5pdCBmYWlsZWQsDQo+ID4gdGhlIG51
bWFfZnJlZV9kaXN0YW5jZSB3aWxsIGJlIGludm9rZWQgdG8gcmV2ZXJ0IG51bWFfZGlzdGFuY2Uu
DQo+IA0KPiBEb2VzIHRoaXMgbWF0dGVyIGluIHRoZSBmaXJzdCBwbGFjZT8gRG9uJ3Qgd2UgZmFs
bCBiYWNrIHRvIHNpbmdsZQ0KPiBub2RlIG1vZGUsIGluIHdoaWNoIGNhc2UgdGhlIHNvbGUgZW50
cnkgb2YgdGhlIGRpc3RhbmNlIHRhYmxlDQo+IHdpbGwgc2F5ICJsb2NhbCIgYW55d2F5Pw0KPiAN
Cg0KVGhhbmsgeW91IGZvciBwcm92aWRpbmcgYW5vdGhlciB3YXkgb2YgdGhpbmtpbmcuIFllcywg
b25jZSBOVU1BIGluaXQNCmlzIGZhaWxlZCwgdGhlIHN5c3RlbSB3aWxsIGZhbGwgYmFjayB0byBz
aW5nbGUgbm9kZSBtb2RlLiBJZiB3ZSBjYWxsDQpfX25vZGVfZGlzdGFuY2Ugbm9ybWFsbHksIHdl
IHdpbGwgbm90IHBhc3MgdHdvIGRpZmZlcmVudCBub2RlcyB0bw0KdGhpcyBmdW5jdGlvbi4gRXZl
biBpZiB3ZSBkb24ndCByZXZlcnQgdGhlIHZhbHVlcyBpbiBkaXN0YW5jZSB0YWJsZSwNCndlIHdp
bGwgbm90IHRyaWdnZXIgdGhlIGNvbmRpdGlvbiBvZiAibm9kZV9hICE9IG5vZGVfYiIuIFdlIHdp
bGwNCmFsd2F5cyBnZXQgImxvY2FsIiBmcm9tIF9fbm9kZV9kaXN0YW5jZS4NCg0KQnV0IGZvciBj
bG9zZWQtbG9vcCBvZiBjb2RlLCBJIHRlbmQgdG8gcmV2ZXJ0IGRhdGEgd2hlbiBpbml0aWFsaXph
dGlvbg0KaXMgZmFpbGVkLg0KDQpDaGVlcnMsDQpXZWkgQ2hlbg0KDQo+IEphbg0KDQo=

