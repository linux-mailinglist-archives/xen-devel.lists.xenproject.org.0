Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C252449FB77
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 15:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262049.454103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDS58-0007RT-HZ; Fri, 28 Jan 2022 14:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262049.454103; Fri, 28 Jan 2022 14:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDS58-0007Pc-DB; Fri, 28 Jan 2022 14:18:30 +0000
Received: by outflank-mailman (input) for mailman id 262049;
 Fri, 28 Jan 2022 14:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PBCP=SM=epam.com=prvs=402709c4a7=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nDS56-0006yL-FW
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 14:18:28 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2890107e-8045-11ec-8eb8-a37418f5ba1a;
 Fri, 28 Jan 2022 15:18:27 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SDJJYI023519;
 Fri, 28 Jan 2022 14:18:20 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dvh8vrccc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 14:18:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by HE1PR0301MB2329.eurprd03.prod.outlook.com (2603:10a6:3:67::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Fri, 28 Jan
 2022 14:12:08 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.018; Fri, 28 Jan 2022
 14:12:08 +0000
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
X-Inumbo-ID: 2890107e-8045-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjl5UZckXq7+qdwXVXjN1m2AZu/axoIWsjo1DWBcIe0EacJfE0VcwY5IUJswsGe/pHMaLv1ZMlrWAISTTmVj2NwTmZMi4T89aCf6byGgtB0VVmAV0MzhFc0M+ILTMXrhvirDyjXRL2EQL3Cmsu+0LcjE3Dfgmd9Zj3ELGnWRW+cOWGuqYX070uA7ht+WzKb3xuxCrLCV5Gr+b683QaLxS7+rX8MrWWY7eMVpBKMS1LcxSW1vDZCAd4sqgWvpATAuPcAzIXHDaRFM9xK/y1odPAwgCzxGmWOgF4v0oJ/YtyfHCtucm3TPV26JlWUpDGalF1u2gUfODgbmDjBmlIi3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QzaPvcETCUqZudaltAgvsQI3tavWt45MaUpynIDhhp0=;
 b=hOtZBqlQ8Ed2sFu1jgOGqSBPimU8i+bQrau6BgidxR8t31wl24gsG0rKtPV/xPOH9+L9OkiVfmq0BBfg2ZDNEtbtK/roo7s/sViwGmdAe2DoU0NMqXTyozvGD+IIpXzHOKkb8DBDr293L4lHEKNAnXIVr7b+esGvzFHzMsaFpW8/BdWIdAHQ3GvOuqk03IGnc6yT/Sz+a0eeHbm6iEhx5JCsBWIwwgjQYmS2uHkTjmMejo56L40vC+Al8E8IMNOpQgm17y6dsQsBxgSvINnsPNH0O495lTqHHJsDj/VF/jX6ca9TyGGVNRIQxgtd7SB5TThPVWC38GRkILwyswZG8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QzaPvcETCUqZudaltAgvsQI3tavWt45MaUpynIDhhp0=;
 b=MKvmsBl06JBdAG8wOwWfwQVchdIZDaOn7z4QUaqImaqb0VWHVas7DyQb9H5J2IHOXl3U5TPjiQS9vQeIyrNZRZH/y8qw8dopfcgHngqBmGDsfPa7R8/Mw5LRwl+bLkjpBq+5cYlDqz+vPTaAUSgfLGIFHjb/q/DX7nepj6sVfWlNJvHgnHsAMnMda18NDQPz11AYscSith0acHrYUzyKDvsyOjsRbEHJRkndK2C68J82JLg7bh3qishtcXIhIXdmOrszaHGxb9JGrvTInLo9EwQV98F0nGehZH9xG9VLlG7ZoS1H4896T4gBZFg2ACGqW6OO7+PI5pa9i+fbhtmkwg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v5 03/14] vpci: move lock outside of struct vpci
Thread-Index: AQHX4ewHDku9OOCAtECwEMPLB4JkU6xfxaAAgBkYmIA=
Date: Fri, 28 Jan 2022 14:12:08 +0000
Message-ID: <c1d09f26-d329-fca9-a363-2d8a6e182233@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-4-andr2000@gmail.com>
 <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
In-Reply-To: <c7a9020a-9713-47b6-45bf-5ac2c6d4157c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25f9d8ec-9fbe-436c-88bb-08d9e2682b81
x-ms-traffictypediagnostic: HE1PR0301MB2329:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <HE1PR0301MB23291D43031387516744C39EE7229@HE1PR0301MB2329.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hWimzWH4/EZ1+swKjeEzGax6ynR0a1Cxf4hNTaGX6DqxOE5ETycEyHPsOis+cse1WxQps8SqtI8WbNwhIc5Isz6RnGg9le6OvvIvTLDFq5OUdFaRp+DnoN3tXHwTDr+np/z67uDK2QyjLeiSLwyfgA6WzxFBTWG3b7Mr6uHGqP9WaLCNhqqcwVxQ4Sn62P+L1Vj6qCnYVQHytlEoszr/cvYRU4+LrNztgaYDItHchIT1E/SyJTuy/cRAfZtgFkmb5vB2GvHreWG4pE/TtdeZZ1RTCLib7COlO3Kiet6lsxWyfqlUQZg7BzGK3k/J9Oa9XFQP0xTb3qlRvLJZMx94awxqKpUEX1kBoKaOlzlY12rJuGrjK9DJnkja/aO1++tWmh2F7HJjYmOuGztQwWL91riG5hv/bxUo9AXqxZgvbgrRdxisgS7MGZYwbHaHbAqPHqx4LqwMFKQ8tSsquiFPNUYLiY9Z2JtISwq/0rxDQL7uZzEzaWqxKzkYMZe6XCzj5fL+RWWf7XxDi+BJVXceuLJAPRmEVa2gfVz/PxpSHRrKwWc5/GGvkPyz2Cr5i2mfmlUep20vSrJk/7c9U90emi0eurq9Q6l451OD1K2dsFdm+FngqhOlP8NvxO52b+RtGaPgYfeCd7r0BO1ca5nj7dMYXSZxxiO3q7S6oz/vbpMrLQ4GDp+04KdLRsV+Q1hOLLOqjneIJfhLDMqlB7L2adnm6CMTQ/fFXh+d1Ii/YnBbZdGT9+YD8rIpZp4WIDtM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(7416002)(122000001)(8936002)(4326008)(38070700005)(6506007)(66556008)(66946007)(66476007)(76116006)(64756008)(66446008)(53546011)(8676002)(31696002)(86362001)(2906002)(5660300002)(107886003)(38100700002)(83380400001)(54906003)(6486002)(26005)(91956017)(508600001)(6916009)(2616005)(71200400001)(316002)(36756003)(31686004)(186003)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cmpMTzJKMUJGRmxtaHVQc3k2aHA3cDFXNE12bHI2aVI1VWdaVTdNb3hNcTho?=
 =?utf-8?B?WWE2RzV3ZC9iaENYVjNOdXc2YU90Q3ZrbXY1SkN3UFVMbkI1VmgzRVNELzZR?=
 =?utf-8?B?Tm8waEJQV3F1SmxlSldiTWZ1dUNGeDFhVTBSdjAwdmNrRmR3WkZtT1Y2emla?=
 =?utf-8?B?cGZENXR3REZBcDJaYlFneEFnT2pSak56TGNPSlN1dTBXcHp4ajBRR245VlFL?=
 =?utf-8?B?Z1IralEyR0hyc0RhK3lHTVZ1ZURkTzFRWlo5aXhNcVc2OVdpUXptbUk4amoy?=
 =?utf-8?B?eHV1ZmdjbnFsR3hhT0J6Kzd5c1JHNytPSmFJckFGL3czVG9oaGlQeDhLc2dQ?=
 =?utf-8?B?Z0FZcFk2WldtMVgraUo2M05HWVhvY3FxV1l2TDhCdm8xRWZpMXB6T21Hbzc2?=
 =?utf-8?B?dERtYzVRbEY5Vm5odDE3TFBNanhiWmZpS2ZRQWt1WVFIUEI2b0xabjdrd1lM?=
 =?utf-8?B?L3M2QVBWTjF3cDJtMUdQWTQzdzgrdmR2dHFTdnJTdGpuOW0yTWJPZXRaZm1S?=
 =?utf-8?B?OFBBVGFnN3ViYldMTEowVXlvYUVqWmVjYVBlQ1pZWEcxNXY1Yk50VlVXdnlX?=
 =?utf-8?B?K2R4UklYVmRKT2svMWFkb21rV2JieXJBREsxdjYvbUFSaUhvY09DeW5UTmkw?=
 =?utf-8?B?M1JtRExsbUI0QndFTlZlWkZtSGF4NldKa2RaUWFCbmpwR3RnVFUrV1hKcnNk?=
 =?utf-8?B?eTh5MjJSWWQvNUtOWU1EenZJWFNINjhFcXFCMjFiT3Q4TjFxNW0yZVg2SEpI?=
 =?utf-8?B?S1pQaENKWWh5akVJZzhKQ0g4NGdEMVE4bm5wOE4yY3V1bkcva1RaSy9yZWN6?=
 =?utf-8?B?NS9EWVFNQ2FidlVYbUNjZ3VjM0pzRzVQUzUrRTkxT09lRDF6WVJ4RUhVTVdO?=
 =?utf-8?B?R2pPQXp2c0t2RmZIU1lyT1NVbHhocWpES3N4NCtpTzNveFpYL0NrYmkvMDZJ?=
 =?utf-8?B?cDVXaXJJVitnVnVZRDZkc3NwY2tka2kyUXNGaXQwUmhlWEc2OFpEV3htNTdN?=
 =?utf-8?B?OGpNVmFlUFpRd09PTW1RaFIxWU9Ob1gwSnhvanE4L3EyMTZld1BuSU1Eampt?=
 =?utf-8?B?dk9kaVg0R2JSbkY5MVMyRGE1R0JmT0E4WXZXeVptUkRQZmRrZFVZZFEraEhr?=
 =?utf-8?B?MWd6alI0OHY3VkFEQ2RFbXd6U0I0aTBYdHgzWEtWbWd4Z29naGQxMDNVRHVI?=
 =?utf-8?B?b3pPc2pSQ251c3RENmIxUXJPUGMzdjAxbllVaC9oVVZHZUhacnNCUW5PNm9L?=
 =?utf-8?B?WlVMVG01dk9NV0phbi9pYWZCT0lpQzNQRVlvMWhyRENnb3VkYmMyWERyNXNT?=
 =?utf-8?B?S2hLRmVHSE9Hd3hrV0c1cjYzWDMwRmVDT1lTeEFqUSs5UkU3aVphRXlUNGxi?=
 =?utf-8?B?YmduQ1R0OHVFZlYzTzdZaGdidjNCeklPRjJ4VGxXejlyRzNGaE1WcmR5VFVC?=
 =?utf-8?B?anNPbFkzMDhPN1lsV0FzOFVROHg2V0tSdGJkeGk4YXFUcUU5U25kdHdYZDRJ?=
 =?utf-8?B?TU9JOGxESndkTVB5SEFKS2tZSm03T2dmTVpNV1BYVWZoS0I2MjBCQlplZUFG?=
 =?utf-8?B?NzFsUVl2ekVFbVRyY1FseXp3SzhwM0NLdHluNHFsdXpVOEhxeEtpVlV6MlRK?=
 =?utf-8?B?WDhaclhxQkxzb0drVDlPRzRjVmNBeVd2ZWYwS2tUcmpabDBHbnIwZGw2bUxk?=
 =?utf-8?B?RzZ0b2JzbE96MjE3bnZTeHVvSG9vbmNsMnJocFZaNUpSUjV4eFBVbUkxYWxZ?=
 =?utf-8?B?d05wd2dmV2xiUURoNTZlM3dnYzBFOFd2aEhLdXcrTU1OOVB0Y2ZuTXdDMEho?=
 =?utf-8?B?K2tFS3JvM2d6cjMvOU05MjZVVWttZTZBQVdTYkg2WmNNTDVQdU0xeVBSVmlC?=
 =?utf-8?B?NFMxYlZPYmp4eEFPOGtqcElhQ0oxR0FiMk1UYVYyUVAvMmJrYkxjTkNtUTZK?=
 =?utf-8?B?L1ZncTRLcEhJRDdidFdIUVdFM21Rd3BsTWFDTkNneHdMck1iSTRCSmVVVTB2?=
 =?utf-8?B?N2IrNC9ZUCsrUTRXVWhnQ3hIemxydld0VjU0Zkc4dlFiSk5uRTIzTWZGQnp6?=
 =?utf-8?B?UXdLQ0dvQ3ZHRWNjU3FJOVdmcmlVbUlLL3NvUWd0cUhDeDNuVks3Vk5jbnVV?=
 =?utf-8?B?SWpRMWd4TFM1WHN2OFRDVzhEYzh1OTlodWtWaituSWxFL3FZM3BXdk1DMnYz?=
 =?utf-8?B?Q2I5Yi9DRXdRa0VVV09FRXE4aWdWYTJZVEIzSEZrYllrV1RUblkvakFUa05z?=
 =?utf-8?B?ampsR1BqWnFmcGkrZWVzd1Y3Um1OT1BVZ0ZKUWNrWTRacldIcEJ5czNoVjhE?=
 =?utf-8?B?TEpXelZ6OU1xSDcrM0JEOFl1NFozYnhOcUc5Q2w0TjJsQzdialZTUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F9313B4D16E93F4AAAF96225859748CE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f9d8ec-9fbe-436c-88bb-08d9e2682b81
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 14:12:08.3396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkL0oyWtPT9b6UkPvYc0iHJn4yeSsSZaJRNrqOKotQX7Mqa9duzxKeIhs6EailzHU5SbhFlWH4P5WcWrflqURV20qx7y0aLf5Yni4xpcG2Tz4+6U9Z/tPnXfBdvKxUvi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2329
X-Proofpoint-ORIG-GUID: I9-J-CZSyLCOcZ5a_KmRxqKkM1E2TGHC
X-Proofpoint-GUID: I9-J-CZSyLCOcZ5a_KmRxqKkM1E2TGHC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_04,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 mlxlogscore=852 adultscore=0 spamscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280091

SGksIEphbiENCg0KT24gMTIuMDEuMjIgMTY6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAy
NS4xMS4yMDIxIDEyOjAyLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IEBAIC02
OCwxMiArODQsMTMgQEAgaW50IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2
KQ0KPj4gICAgICAgLyogV2Ugc2hvdWxkIG5vdCBnZXQgaGVyZSB0d2ljZSBmb3IgdGhlIHNhbWUg
ZGV2aWNlLiAqLw0KPj4gICAgICAgQVNTRVJUKCFwZGV2LT52cGNpKTsNCj4+ICAgDQo+PiAtICAg
IHBkZXYtPnZwY2kgPSB4emFsbG9jKHN0cnVjdCB2cGNpKTsNCj4+IC0gICAgaWYgKCAhcGRldi0+
dnBjaSApDQo+PiArICAgIHZwY2kgPSB4emFsbG9jKHN0cnVjdCB2cGNpKTsNCj4+ICsgICAgaWYg
KCAhdnBjaSApDQo+PiAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiAgIA0KPj4gKyAgICBz
cGluX2xvY2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiArICAgIHBkZXYtPnZwY2kgPSB2cGNpOw0K
Pj4gICAgICAgSU5JVF9MSVNUX0hFQUQoJnBkZXYtPnZwY2ktPmhhbmRsZXJzKTsNCj4+IC0gICAg
c3Bpbl9sb2NrX2luaXQoJnBkZXYtPnZwY2ktPmxvY2spOw0KPiBJTklUX0xJU1RfSEVBRCgpIGNh
biBvY2N1ciBhaGVhZCBvZiB0YWtpbmcgdGhlIGxvY2ssIGFuZCBjYW4gYWxzbyBhY3QNCj4gb24g
JnZwY2ktPmhhbmRsZXJzIHJhdGhlciB0aGFuICZwZGV2LT52cGNpLT5oYW5kbGVycy4NClllcywg
SSB3aWxsIG1vdmUgaXQsIGdvb2QgY2F0Y2gNCj4+ICAgICAgIGZvciAoIGkgPSAwOyBpIDwgTlVN
X1ZQQ0lfSU5JVDsgaSsrICkNCj4+ICAgICAgIHsNCj4+IEBAIC04Myw3ICsxMDAsOCBAQCBpbnQg
dnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAgICAgICB9DQo+IFRo
aXMgbG9vcCB3YW50cyB0byBsaXZlIGluIHRoZSBsb2NrZWQgcmVnaW9uIGJlY2F1c2UgeW91IG5l
ZWQgdG8gaW5zdGFsbA0KPiB2cGNpIGludG8gcGRldi0+dnBjaSB1cCBmcm9udCwgYWZhaWN0LiBJ
IHdvbmRlciB3aGV0aGVyIHRoYXQgY291bGRuJ3QNCj4gYmUgcmVsYXhlZCwgYnV0IHBlcmhhcHMg
dGhhdCdzIGFuIGltcHJvdmVtZW50IHRoYXQgY2FuIGJlIHRob3VnaHQgYWJvdXQNCj4gbGF0ZXIu
DQpPaywgc28gSSdsbCBsZWF2ZSBpdCBhcyBpcw0KPg0KPiBUaGUgbWFpbiByZWFzb24gSSdtIGxv
b2tpbmcgYXQgdGhpcyBjbG9zZWx5IGlzIGJlY2F1c2UgZnJvbSB0aGUgcGF0Y2gNCj4gdGl0bGUg
SSBkaWRuJ3QgZXhwZWN0IG5ldyBsb2NraW5nIHJlZ2lvbnMgdG8gYmUgaW50cm9kdWNlZCByaWdo
dCBoZXJlOw0KPiBpbnN0ZWFkIEkgZGlkIGV4cGVjdCBzdHJpY3RseSBhIG1lY2hhbmljYWwgY29u
dmVyc2lvbi4NCj4NCj4+IEBAIC0xNTIsOCArMTcwLDYgQEAgaW50IHZwY2lfYWRkX3JlZ2lzdGVy
KHN0cnVjdCB2cGNpICp2cGNpLCB2cGNpX3JlYWRfdCAqcmVhZF9oYW5kbGVyLA0KPj4gICAgICAg
ci0+b2Zmc2V0ID0gb2Zmc2V0Ow0KPj4gICAgICAgci0+cHJpdmF0ZSA9IGRhdGE7DQo+PiAgIA0K
Pj4gLSAgICBzcGluX2xvY2soJnZwY2ktPmxvY2spOw0KPiAgRnJvbSB0aGUgZGVzY3JpcHRpb24g
SSBjYW4ndCBkZWR1Y2Ugd2h5IHRoaXMgbG9jayBpcyBmaW5lIHRvIGdvIGF3YXkNCj4gbm93LCBp
LmUuIHRoYXQgYWxsIGNhbGwgc2l0ZXMgaGF2ZSB0aGUgbG9jayBub3cgYWNxdWlyZSBlYXJsaWVy
Lg0KPiBUaGVyZWZvcmUgSSdkIGV4cGVjdCBhdCBsZWFzdCBhbiBhc3NlcnRpb24gdG8gYmUgbGVm
dCBoZXJlIC4uLg0KPg0KPj4gQEAgLTE4Myw3ICsxOTcsNiBAQCBpbnQgdnBjaV9yZW1vdmVfcmVn
aXN0ZXIoc3RydWN0IHZwY2kgKnZwY2ksIHVuc2lnbmVkIGludCBvZmZzZXQsDQo+PiAgICAgICBj
b25zdCBzdHJ1Y3QgdnBjaV9yZWdpc3RlciByID0geyAub2Zmc2V0ID0gb2Zmc2V0LCAuc2l6ZSA9
IHNpemUgfTsNCj4+ICAgICAgIHN0cnVjdCB2cGNpX3JlZ2lzdGVyICpybTsNCj4+ICAgDQo+PiAt
ICAgIHNwaW5fbG9jaygmdnBjaS0+bG9jayk7DQo+IC4uLiBhbmQgaGVyZS4NClByZXZpb3VzbHkg
dGhlIGxvY2sgbGl2ZWQgaW4gc3RydWN0IHZwY2kgYW5kIG5vdyBpdCBsaXZlcyBpbiBzdHJ1Y3Qg
cGNpX2RldiB3aGljaA0KaXMgbm90IHZpc2libGUgaGVyZSwgc286DQoxLiB3ZSBjYW5ub3QgdGFr
ZSB0aGF0IGxvY2sgaGVyZSBhbmQgZG8gZXhwZWN0IGZvciBpdCB0byBiZSBhY3F1aXJlZCBvdXRz
aWRlDQoyLiB3ZSBjYW5ub3QgYWRkIGFuIEFTU0VSVCBoZXJlIGFzIHdlIHdvdWxkIG5lZWQNCkFT
U0VSVChzcGluX2lzX2xvY2tlZCgmcGRldi0+dnBjaV9sb2NrKSk7DQphbmQgcGRldiBpcyBub3Qg
aGVyZQ0KQWxsIHRoZSBjYWxsZXJzIG9mIHRoZSB2cGNpX3thZGR8cmVtb3ZlfV9yZWdpc3RlciBh
cmUgUkVHSVNURVJfVlBDSV9JTklUDQpmdW5jdGlvbnMgd2hpY2ggYXJlIGNhbGxlZCB3aXRoICZw
ZGV2LT52cGNpX2xvY2sgaGVsZC4NCg0KU28sIHdoaWxlIEkgYWdyZWUgdGhhdCBpdCB3b3VsZCBi
ZSBpbmRlZWQgYSBnb29kIGNoZWNrIHdpdGggQVNTRVJUIGhlcmUsDQpidXQgYWRkaW5nIGFuIGFk
ZGl0aW9uYWwgYXJndW1lbnQgdG8gdGhlIHJlc3BlY3RpdmUgZnVuY3Rpb25zIGp1c3QgZm9yIHRo
YXQNCm1pZ2h0IG5vdCBiZSBhIGdvb2QgaWRlYSBJTU8NCg0KSSB3aWxsIGRlc2NyaWJlIHRoaXMg
bG9jayByZW1vdmFsIGluIHRoZSBjb21taXQgbWVzc2FnZQ0KDQpUaGFuayB5b3UsDQpPbGVrc2Fu
ZHI=

