Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B854ABEA9
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 13:52:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266866.460581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Uj-0004eW-4y; Mon, 07 Feb 2022 12:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266866.460581; Mon, 07 Feb 2022 12:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH3Uj-0004cV-1n; Mon, 07 Feb 2022 12:51:49 +0000
Received: by outflank-mailman (input) for mailman id 266866;
 Mon, 07 Feb 2022 12:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F54n=SW=epam.com=prvs=403792ff6c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nH3Ug-0004cO-JN
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 12:51:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae2c2c0c-8814-11ec-8f75-fffcc8bd4f1a;
 Mon, 07 Feb 2022 13:51:35 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 217CkTpJ021665;
 Mon, 7 Feb 2022 12:51:39 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2056.outbound.protection.outlook.com [104.47.2.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e33qkg0mm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Feb 2022 12:51:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7213.eurprd03.prod.outlook.com (2603:10a6:102:bf::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Mon, 7 Feb
 2022 12:51:35 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 12:51:35 +0000
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
X-Inumbo-ID: ae2c2c0c-8814-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WkTgNck5XFF76tB4rLHfNrcm4EPbu4FUm29muvKmt3SDcWE/p57amPYfYc8jOX6QTjBAS9fDtGngxCRWmD3+JAzNoSElA8T6rUkY1iNxYJR6DP7PfuPf3WWjjJKwzrOLs+VRUMbLIkrCijai6gaOVcJaPyH4ciZDsFhI+GgrChhLJ5DyOnNkHx2OuhNZk+PTAN3x6rCeNgoeDiReaYPd081ArSVIl/Et579VuEMWlo5yQ5Y2Ra+leV8M7SxHOmE6U91UVQsJlC0J+rnWr0CGOROIK+DrGamQPbaqbSylCnvKuU7W0X8K2MRkKw5+19yQOzM3Eq4S7c2dOOcifTcfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hFUU194To8W+mV03GI198BEReCHaKlCmeWf+2yC75do=;
 b=EZMCcA2luwiIQiEB6mqFEb9MG9r+PRCj47DqmNlf+sy0/c1dhr4YF0S5rDehTM1mfUlN/jQ2Y8sHV005bOJk4X7vzHOzSK2wslmvOP6O3BYMq4ATbcy/2jQ8o/twpgsxcS/fQLRaBq2DhCGSx4rcVag21VB0ch62oY2WY0Qsb6Bz/xRZuOP+ogqmNGspXhAV+azNyb1u2biFy+fd0IWDyC0/ciMcOSZsOxeETNlEcOgzPFyO+o+ZSaGJyzNmEMiP+90joslzS4xfzeQDdgBGAR4R5m4qI5WZWsRKhsef6lLs9a7l+vDnZkJOIbokMiLobO5FcIcdxZS0Gsz/r9j5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFUU194To8W+mV03GI198BEReCHaKlCmeWf+2yC75do=;
 b=UeY/W4lU0el27imRHjtjvBY6y6ExehFNFs1QwdqB8ueO3gbKdrYqTGle4BYr9i5ztNGWN2XCJ+D4pdw/IzP6GsIqXsxkjizAcfzV5wJaBYvFKZaCXURvWoTNqF0jQ5+UswAAiL7e+1L/xW4rAGKsAQvLWB2okOXtaiQdPW5Z72TaGjmZpixZnBPU86cg6ttUAVqEdu9lYfXVk1AzFhN4kYIYuI5xvK9YeIa+52LGYR+G6C4QRyo3I/p9lzTKG3V0lys4JyUJc1zxezK1uQETevxLcnk5jDEfhY0t+qMN7nsf66W0nT6YiLeBo8aaiTAjzTT5BLcaWtpWIiU1OqohQg==
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
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAA==
Date: Mon, 7 Feb 2022 12:51:35 +0000
Message-ID: <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
In-Reply-To: <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad655505-3d3b-4cf6-7082-08d9ea3892fb
x-ms-traffictypediagnostic: PA4PR03MB7213:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB72137AD0F8E5B64E2B02FE32E72C9@PA4PR03MB7213.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pIWjNUzMiOn1/BlPDKGYeZvRqpKaZcpMzFRR+BReGWfn2XwSf3gkEXaRFBmQ9Zt699zZW7b7Kul4vfXnn22lSrFXlhbWBSbD9VefA0toKZnEIGLL8CWOk8xPD/T75P4Pwh4Wf0w+cUi16sCiDcnlTf+CT/shUAuxWtyG8n8hmf3u66z9YqU9tJeTA6hwBIr8ztzDT+dlAO+lvcBgl2+ibyOfwfXv6cCwEZ0AGAEytSLiiyAga30EBRoRyjBDRlbhzWAus7RTjcQkO8vAqzE5OyQn3Xdn+rUlPBs1xtQMYZTCHp70dnwmFDPyEu8lRXXn9Wa3afIpSQxwlZ5rTTvr5yDA1kivzxmM5s2azO/DydLF9edbVqS+TH8r5+wcoo/G4iRVIJp2YbKHAl2q3zdoeESakUMmHWUbJI5Ilq141QU7SFwulA7I9szqMZ0oAwqKRIIp1RhSbkWzQ2aO2GQi4y1910A4XPH4RT+NowF4KJ1KxGkFAqZSrn6Vx/2acsjrbT6XhwRwkdeqww+Pm0meG3tf8ZFUEacu7Z1OI2NG4zPD7JktaKhsNZkfBtN60gONaCdFGHHrEp1uQUr9kK7ZAxfbOLsLhdKHmCctv+GW/Luly5hgL9lKdRaISXcpqaYJU3WXsL8Zubg7/VZhN2y6zRTjiOIPRmKKQ+/UykjyZQqzYlch4ADv3lEHZ/MFBiQO2dVXKyCIS/8R5B/5BXgdHFEwyfO1//xgLrgr5Yda5SA/UsrHK1bKgfhb5lnhM1sN
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(316002)(7416002)(2906002)(6486002)(38100700002)(6916009)(54906003)(4326008)(86362001)(122000001)(5660300002)(31696002)(38070700005)(6512007)(107886003)(508600001)(8676002)(6506007)(91956017)(76116006)(8936002)(66946007)(55236004)(53546011)(83380400001)(64756008)(36756003)(26005)(186003)(71200400001)(66556008)(66476007)(31686004)(66446008)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MlZxMGRaOXNEVEhCbmRvKzdkbTc1RXBzeHUwSXo4ZkhwVFZnWkExTWNTK3pX?=
 =?utf-8?B?R1FTQXhNclUyYWVwWlpGZXhkM1ROblR5SHA4MDRKdDZ3QmZhbkpEU1dob0RG?=
 =?utf-8?B?Z1ZINmN0OUV5MTZPb0d6RmxaVHlIa3FSZ01xMUFnTTdWMks5Zkl4cmU5OVRP?=
 =?utf-8?B?Y2ZBckt0Vm1kSkhZa0RzREZHVUtPRkFWdSs4ZHN1a0lVVzdnbEZXdE1GaEFt?=
 =?utf-8?B?S0lLN3lBTHdrMDZJM3VoWmFrUVduWVNUeGxnRms4YlE0bXU1V0xSK1Z6Qmp5?=
 =?utf-8?B?VXdZOGFtOHhjbkVEYi9Qczg1YnVDdnBSMnJ4UVhpN0J1VmI5U3RMZTd6M09u?=
 =?utf-8?B?aVl4OEVsTk42a2hMUDlwNTRRcGFnTVdVakJEZUJxdGJtTUI1QzI4SlJybUZ2?=
 =?utf-8?B?V0dicjdaVjRCa1BIMVcyYVJSb2pJR2Yrb3FaUUczUzNQdjN1L0pXcjN0N2JZ?=
 =?utf-8?B?ejZnbmpJQU1ydmRwWnJzZmZLRmZtS1dITy96K1ZmNGcwWHlTdkg3ZkJnVVFq?=
 =?utf-8?B?U1UxQVo4M3o0eUNPQ0VwSStmWmVZSVZWd0VLb2VwaGIrdzRyV1JCbGtReS9J?=
 =?utf-8?B?eWdsVWZCVWlrYWRTSTZ6RHkxMEd6VmVVTDFPaUhTNWRYbTVjZ1k5dCtuaGNk?=
 =?utf-8?B?NGRhRUtReW5UUjYzSTNWWjhnSFlpUW5qV05NUGNJMlZMMVhUZVN4MGlFUXBW?=
 =?utf-8?B?WURzdllUVjdzeG9sZXR4WHd4UG9UdFRaMHEvZEZkKzNpN1FsWWo5N3ZlYTR0?=
 =?utf-8?B?ZzdNeTltek5ScHoyZlVYTzdocDh5azhZWENYMGR0dmR0dXdrQ0xmWllDQTRT?=
 =?utf-8?B?SjQxNkEyN1JKcnFKSER2R2VKT0Q2eWxQTWxKQlAxWmg1Tm5PR3h0eEgyQ2Za?=
 =?utf-8?B?YkRTQlFRMHlWM1VSSFltbllEa0hjak1XM0xjVHEzUVBDNGgzNGpFNnNDTWFR?=
 =?utf-8?B?ZTU1UFVuSFVMVDNscnFRSmlyTFh4MFNnWnRuR0lYTUkzblpYWjEwWERJY1JQ?=
 =?utf-8?B?blNJY3hzNUZtUGl6SWVMczkzM0VyenNHbDRvTlNZem5CN2RMc3lCQlp3K251?=
 =?utf-8?B?aDhlV0dYMEhMSjZqWEdJa0tSVlFUTlFlSy8zN2tNcktwY2dqMnEzMmZ5WEpx?=
 =?utf-8?B?M3BweitYRDR5d3I5bWp2U2Y4YytaY0d6N2l2djRDK3VIS0ozdGNwRDVEK0NI?=
 =?utf-8?B?b2pYejloQWlBNVJ1ZGlGSTBsaXhPMHVxTVk0ODN5bWJPYVV1R2xUOG5jZ1BB?=
 =?utf-8?B?UGR5Nk1wYndlWnlwNDBYY1JOOXZIMldiMy9HQ3U0Q0wzWmNRMnRqK0xnelFj?=
 =?utf-8?B?aUdEa0pMYmRwQUt4UDhhL1BoVTExZnA5ek1yc2V2OHpyMFpDM002cG9ENk9J?=
 =?utf-8?B?ZFpLOU1GS1B6Wkh1Q3VsTmdRbDUwYTJ3Z3dta1o2cXhGaFROY21OOTA3VG5n?=
 =?utf-8?B?N1BSL3NOUEkzT1hCM3BGalkrNGhuM3pXUEluOUlMbnUydVZab3FpVFRUcSs4?=
 =?utf-8?B?dmtweFB6Vm04M2YvRnRDS3ErVU1PbnRBM3QxaktHcERNYW1Cc2k2RmFNYU14?=
 =?utf-8?B?VTVKOXkvWjJWTHp1VllSQ2h2YjdEYnhSQW5QVElRY2hOYXBZaURSdVlEUlND?=
 =?utf-8?B?TmxIeHJJU2NNYjNCNEhESXNlYzlNWXFoS2JreXlWR2lBWFB5Qzk2MlEyNUlX?=
 =?utf-8?B?UnhQaDdseTJGemhJQ1V4QlJlNGhReVYrR0xaL3dJY3FTYlZ2S1oyODJRdEhI?=
 =?utf-8?B?VmFub3g0MzVUNTNCbTRmMUVMbGtCMWthSGwxbUtDTlEvSStzb3UyWlUrTDEw?=
 =?utf-8?B?MHB5U2x0T0ZSZkUxVjBmMkRlZGFwT1B5NmJnTkM1ZEZXekZ3aUN3d1FvejRt?=
 =?utf-8?B?OGM3ZEU3V1R2NERVQmFiYU16L1hYMDZLb2FPTmp6QmlWbFE5RWNqWS9kY3Bz?=
 =?utf-8?B?aWR6RWNTMnBKanBpSWNLM2VaUzdDUFh0Y0pIelZDbmp0Nlh6YnBLakZjZ21F?=
 =?utf-8?B?RlZzS1ZVS1E5bjZzNHRVT29UTCtQWU1sTHBQRG5OelFnSGM4NHNQS1BVV3pw?=
 =?utf-8?B?WE10SXNWem5lalhWU1lLVTBKQWNvbmNyRmY0ZWdoSWhQdnNtV2JJUms4NlZm?=
 =?utf-8?B?T2czUTc3TGErNURCM3F3bjBpZlAvTlIwc1ZGcXlBNjNYMkMyZGdYWitlb0RO?=
 =?utf-8?B?R2JXMG1jb3ZTNzZUN0pjRnVSRHlmMXVWWUFqQnAzTmtaZWxsSm5yQnpxNUxV?=
 =?utf-8?B?c2Y5TzNBZnIvTHVucDRKVFdMN2U3RjRtQ1hkWVZJOEtScTJsV2g1THV1RVZy?=
 =?utf-8?B?N1JRVVNneXdkbkFPamJMaVFXbHBsN2NYTWZaRGpnV1djVlhVUkZWdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2DAC35BDA7B6544BE0D043650236365@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad655505-3d3b-4cf6-7082-08d9ea3892fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 12:51:35.4187
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T0Guc7EJ+Idm2O3gMu0dmI6/i31CvgK96BCPAZpIoRmWzQMN+f3+FffU9AS1rx4CkovaGs9PJmGWJ1CKdQry495skBp3XtyDrijaCESiQ4A7mFdFbHqWvJkyiDT7Wmv8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7213
X-Proofpoint-GUID: z59leMm8dasn8w2fCyQmheSDfR9pCbaX
X-Proofpoint-ORIG-GUID: z59leMm8dasn8w2fCyQmheSDfR9pCbaX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-07_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202070083

DQoNCk9uIDA3LjAyLjIyIDE0OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxMjoyNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDcuMDIu
MjIgMDk6MjksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIwMjIgMTU6MzcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNC4wMi4yMiAxNjozMCwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBSZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciB3aGVu
IGFzc2lnbmluZyBhIFBDSSBkZXZpY2UgdG8gYSBndWVzdDoNCj4+Pj4+PiBhY2NvcmRpbmcgdG8g
dGhlIFBDSSBzcGVjIHRoZSBQQ0lfQ09NTUFORCByZWdpc3RlciBpcyB0eXBpY2FsbHkgYWxsIDAn
cw0KPj4+Pj4+IGFmdGVyIHJlc2V0Lg0KPj4+Pj4gSXQncyBub3QgZW50aXJlbHkgY2xlYXIgdG8g
bWUgd2hldGhlciBzZXR0aW5nIHRoZSBoYXJkd2FyZSByZWdpc3RlciB0bw0KPj4+Pj4gemVybyBp
cyBva2F5LiBXaGF0IHdhbnRzIHRvIGJlIHplcm8gaXMgdGhlIHZhbHVlIHRoZSBndWVzdCBvYnNl
cnZlcw0KPj4+Pj4gaW5pdGlhbGx5Lg0KPj4+PiAidGhlIFBDSSBzcGVjIHNheXMgdGhlIFBDSV9D
T01NQU5EIHJlZ2lzdGVyIGlzIHR5cGljYWxseSBhbGwgMCdzIGFmdGVyIHJlc2V0LiINCj4+Pj4g
V2h5IHdvdWxkbid0IGl0IGJlIG9rPyBXaGF0IGlzIHRoZSBleGFjdCBjb25jZXJuIGhlcmU/DQo+
Pj4gVGhlIGNvbmNlcm4gaXMgLSBhcyB2b2ljZWQgaXMgc2ltaWxhciB3YXlzIGJlZm9yZSwgcGVy
aGFwcyBpbiBvdGhlcg0KPj4+IGNvbnRleHRzIC0gdGhhdCB5b3UgbmVlZCB0byBjb25zaWRlciBi
aXQtYnktYml0IHdoZXRoZXIgb3ZlcndyaXRpbmcNCj4+PiB3aXRoIDAgd2hhdCBpcyBjdXJyZW50
bHkgdGhlcmUgaXMgb2theS4gWGVuIGFuZC9vciBEb20wIG1heSBoYXZlIHB1dA0KPj4+IHZhbHVl
cyB0aGVyZSB3aGljaCB0aGV5IGV4cGVjdCB0byByZW1haW4gdW5hbHRlcmVkLiBJIGd1ZXNzDQo+
Pj4gUENJX0NPTU1BTkRfU0VSUiBpcyBhIGdvb2QgZXhhbXBsZTogV2hpbGUgdGhlIGd1ZXN0J3Mg
dmlldyBvZiB0aGlzDQo+Pj4gd2lsbCB3YW50IHRvIGJlIHplcm8gaW5pdGlhbGx5LCB0aGUgaG9z
dCBoYXZpbmcgc2V0IGl0IHRvIDEgbWF5IG5vdA0KPj4+IGVhc2lseSBiZSBvdmVyd3JpdHRlbiB3
aXRoIDAsIG9yIGVsc2UgeW91J2QgZWZmZWN0aXZlbHkgaW1wbHkgZ2l2aW5nDQo+Pj4gdGhlIGd1
ZXN0IGNvbnRyb2wgb2YgdGhlIGJpdC4NCj4+IFdlIGhhdmUgYWxyZWFkeSBkaXNjdXNzZWQgaW4g
Z3JlYXQgZGV0YWlsIFBDSV9DT01NQU5EIGVtdWxhdGlvbiBbMV0uDQo+PiBBdCB0aGUgZW5kIHlv
dSB3cm90ZSBbMV06DQo+PiAiV2VsbCwgaW4gb3JkZXIgZm9yIHRoZSB3aG9sZSB0aGluZyB0byBi
ZSBzZWN1cml0eSBzdXBwb3J0ZWQgaXQgbmVlZHMgdG8NCj4+IGJlIGV4cGxhaW5lZCBmb3IgZXZl
cnkgYml0IHdoeSBpdCBpcyBzYWZlIHRvIGFsbG93IHRoZSBndWVzdCB0byBkcml2ZSBpdC4NCj4+
IFVudGlsIHlvdSBtZWFuIHZQQ0kgdG8gcmVhY2ggdGhhdCBzdGF0ZSwgbGVhdmluZyBUT0RPIG5v
dGVzIGluIHRoZSBjb2RlDQo+PiBmb3IgYW55dGhpbmcgbm90IGludmVzdGlnYXRlZCBtYXkgaW5k
ZWVkIGJlIGdvb2QgZW5vdWdoLg0KPj4NCj4+IEphbiINCj4+DQo+PiBTbywgdGhpcyBpcyB3aHkg
SSBsZWZ0IGEgVE9ETyBpbiB0aGUgUENJX0NPTU1BTkQgZW11bGF0aW9uIGZvciBub3cgYW5kIG9u
bHkNCj4+IGNhcmUgYWJvdXQgSU5UeCB3aGljaCBpcyBob25vcmVkIHdpdGggdGhlIGNvZGUgaW4g
dGhpcyBwYXRjaC4NCj4gUmlnaHQuIFRoZSBpc3N1ZSBJIHNlZSBpcyB0aGF0IHRoZSBkZXNjcmlw
dGlvbiBkb2VzIG5vdCBoYXZlIGFueQ0KPiBtZW50aW9uIG9mIHRoaXMsIGJ1dCBpbnN0ZWFkIHRh
bGtzIGFib3V0IHNpbXBseSB3cml0aW5nIHplcm8uDQpIb3cgZG8geW91IHdhbnQgdGhhdCBtZW50
aW9uZWQ/IEV4dGVuZGVkIGNvbW1pdCBtZXNzYWdlIG9yDQpqdXN0IGEgbGluayB0byB0aGUgdGhy
ZWFkIFsxXT8NCldpdGggdGhlIGFib3ZlIGRvbmUsIGRvIHlvdSB0aGluayB0aGF0IHdyaXRpbmcg
MCdzIGlzIGFuIGFjY2VwdGFibGUNCmFwcHJvYWNoIGFzIG9mIG5vdz8NCj4gSmFuDQo+DQpUaGFu
ayB5b3UsDQpPbGVrc2FuZHI=

