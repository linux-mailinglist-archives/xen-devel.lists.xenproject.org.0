Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C282C4592EF
	for <lists+xen-devel@lfdr.de>; Mon, 22 Nov 2021 17:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229004.396326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpC69-0008Up-Hr; Mon, 22 Nov 2021 16:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229004.396326; Mon, 22 Nov 2021 16:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpC69-0008SU-EQ; Mon, 22 Nov 2021 16:23:17 +0000
Received: by outflank-mailman (input) for mailman id 229004;
 Mon, 22 Nov 2021 16:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XJrQ=QJ=epam.com=prvs=1960b635ba=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpC67-0008SO-CT
 for xen-devel@lists.xenproject.org; Mon, 22 Nov 2021 16:23:15 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce042bd-4bb0-11ec-a9d2-d9f7a1cc8784;
 Mon, 22 Nov 2021 17:23:13 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AMFQ7Ug022752;
 Mon, 22 Nov 2021 16:23:10 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cgduc0827-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Nov 2021 16:23:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB6883.eurprd03.prod.outlook.com (2603:10a6:20b:282::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 16:23:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 16:23:03 +0000
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
X-Inumbo-ID: 7ce042bd-4bb0-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a15eErSLFQrq9O6f7Yy5WDw0O9/MpwGS5iI0o7ze33AQn8KbflIQmFXtP1iN75f+9gTeboPb6+D25Dt6RLlgrT/ttKnTjkeSdAak5fy4xnSJUgK55o9KgcT1CARgFnLm+xd4qVaylAr6aeO7avB0tiokRyiwlZdu+zC1l4AIJz1zu71O+Vq4YJoQ7Fsrwa5Sx2VsCT5jIAaDlBRe3JpvEwBJAsBxFX4UbdYnBt6b15gkOc5bDtcvxcgpnKhl5pnUECxZlOfCKDk3DcOX+fGseoX65A95Zv//HggzQD+r19HgIWlYhApffi470s3jCOf1ek0J0ahLLuE0zb1zammzyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+7jXsLhrC7RlhB+hb3AwNvEoKkOZxEAN40KnKtNT68=;
 b=A0QK/JY6Hvdam48/5YEZqThe/89ySRSZzdfvwCfT2PohLLUB3p4YlU3gz9SMQoplraE1nz0B4nr7vchBo94y7475vKjMMreM9hWA8jxRnByS4WzJZhdqnGAj26ie4aVVFFudGjbOnm1CIB5EVwpttc+CmTD+guB3dnln1pUdICQUTV8216S+tjvj2+tDHJPCDrh1bq29R96ck9orFqPHqc9BNsNGc4x47MXn6Ivn2z9GAH/VkjUZpxeVSHd4ON/txnTh7AjgdHMinzfTrqYkwNdaEHTYYVCFP/hIPRiI6TU5/weDg4wOWvyZFpErL4bSA05bk3twTEZge0WJ0Fjy4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+7jXsLhrC7RlhB+hb3AwNvEoKkOZxEAN40KnKtNT68=;
 b=SFAmVgEe/qCZZUCfsyQLmJD8NI8blCOP7BhpDNc4lQc86Wrr+/wLEObETLqovrLQBtgvBrnQDPS1pWFoOPYDR1TZqDlAlOPkybS9U1NPUIdJX5euRTcRjd9lUr6WS/DB+gP8RXORsdAQil8lIssVfAL51tlCTLiq5oaVHx2TknTSiXWLgJOrVUX7TkoVfoyqOJU4Z4PNhzc9iW3RymQwOydvlIXPbhEQ86HcUrH+7tYUBc/FHQlsUvxa3aj6nPKjwT3K4KtJmYJiHKA9MVobV5zYuqcScDDPUAsyedjjD/JmOrg9afo2VwQOGnlUEnOucnLNWmY9bi3m4qYV92j46g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Topic: [PATCH v6 2/7] xen/arm: add pci-domain for disabled devices
Thread-Index: 
 AQHX0g8QVTbfP59mVU+LM2unTUGOtawGkRQAgADLYgCAAPUEgIAAofWAgAbUDQCAAA7WAA==
Date: Mon, 22 Nov 2021 16:23:03 +0000
Message-ID: <315b1308-5adc-c4f3-6150-1060dbac5f4f@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-3-andr2000@gmail.com>
 <86cabc8a-cbf2-84d4-4162-7d5591d127c5@xen.org>
 <de155886-d039-4c45-0407-47f38f8cd75d@epam.com>
 <ab95fc39-d1b2-be80-8245-85161a8271e1@xen.org>
 <072848c8-54da-cb73-3b8a-0c35826cc812@epam.com>
 <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
In-Reply-To: <e66c4189-acdf-c32f-4b50-51c8aaab4efd@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af1bba23-8142-4539-b491-08d9add45bdd
x-ms-traffictypediagnostic: AM9PR03MB6883:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB688313049632F7275EFB33FCE79F9@AM9PR03MB6883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 CWL1ytYfQhp/rj1luZKKIf7E/nWCl1rQ77I9sa9qTOTAvyRJO3avRpTAHkXOoE3S0GT8jxchXjRGzprcT1SP38rT/OsC84TKZUT8Z02hxmGHsUvBspLP9zZY325BhI4ZgF5+df6PhQlAHDQK3+FnOFO8tc2swgQsgLktMaYSpEaFwB+p90Txa+X7dAcSOEG64tKyJKkz307g6o72EXGUo6js+o5pmY0D6ck8TTxAxZ4bzTZVBa3gDltmLVoN2OeQdSgU/qrFSUDFaxwIWVRTOsK3ywL+1a64GyOwHXrYhwo4m0d+X3RTVlFAw0jigF/iLt54Zpuu31eJY79Mzy5qzFdfhA7LdFkLWd1ZkEjwmuP1Rbg5svZTZx0vFLzrj0FUIMLar3DmyoN9UygOTldczLcOFj48kiNoNG/ETrPv04E5SU2MQ0srrisdgRgU/B3HNNSjv8BOqnuN2bE4s+Gsx7pDD507P8FjIXuB9fTgk1jIfaqZgoU6Y13yO+DEKPuesyQjqNxLySGjmuDlFUdfJaWMOUmsOOGtnroBc16mLStpM5PfiTk/TwRcHLsukOQtZXckvpHX4tc4dm/i0QK8R226KoFNioPEPgd2h+oS0VDP0g0IXsjoC8wbxK6r8+3IMCAKDqXsiUifvO6BUptBVHyCeHwd7uQGTQbei1vTTbf9n2eZaMYLV+V1MUYUtWNP1m+5t9Vcrz4paaBRvm0EJBEdgoiIJyPibMxF96fnSl2cDLIPI4+maxatZbL1mUHX
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(31686004)(4326008)(2906002)(8936002)(5660300002)(8676002)(66476007)(64756008)(6512007)(2616005)(66446008)(66556008)(76116006)(54906003)(110136005)(86362001)(7416002)(66946007)(91956017)(122000001)(38100700002)(508600001)(6486002)(6506007)(316002)(53546011)(107886003)(38070700005)(186003)(36756003)(83380400001)(31696002)(71200400001)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZUFBcVJMcWJNUzY3M2tNL21WYUZmQ1FyV3h1Yk4rbUFZc2JQWDlHOEtMNS94?=
 =?utf-8?B?eGgySjlwSC9WRngyMUh3ZnJTTUMyN0puYUJJNE1DTGsxZkNVRHVrYnRoUEJp?=
 =?utf-8?B?eTk0QVJsblo4TW1renNCaVdtOHNzeDVndVpjYTZKRjdVQVh2bE5saU9aaUMx?=
 =?utf-8?B?bFR0VmR4U3h1aThXSFl0Y1M1WldHMDFoVUVpcHdscFFjV1dtcFlkUDl3RUtL?=
 =?utf-8?B?Vlo5UzdqbDZzNDBtU0ZRN0NqNHBKeHlNZ1ZmV2xZbnM4eXNnRlEyc0tHb0Za?=
 =?utf-8?B?TUc0NXdkaTNWaHU5UHFsUmRPbkhhL09Ia0NYQTJyNWROKzlzQjFydzZKczNu?=
 =?utf-8?B?VC9QMHB6QnRYeEc1YndNaWJRRUx3RmdxcTlHdXhqaloySjc2RXpEbGF2NVlU?=
 =?utf-8?B?SVYvWHU2QVAzZjBqSWNHWVlDdm9GYVA5NHBvU1NiVFhwSTZ4aGZab05ZT29x?=
 =?utf-8?B?YnMzdFJrbXk3V0FEQy9FeDRKdld6QWJITGFiZm9wZkplV29kUk8vWHcrbm0y?=
 =?utf-8?B?TzZCU2J6OTJhTWZQUkgrSWY0ZWZVaXpybDRxOGI5ZStXVkUrendrWmlGMnlm?=
 =?utf-8?B?Z09DRkFRallPbHRrMGZ5ZTJhS0lSTHZMT2FUTXllWUJsS0JlK1pwNEk3Wmxs?=
 =?utf-8?B?b2Q5bEY2aGhBRDJKc1cyN3dsVG83RXUzVGd5TmkvSHk1TG5KaEE0SDFQSDJa?=
 =?utf-8?B?VEhzbTJRTUVHU1RLVnMzUCt5MlBZV0phWjhJZDNDRElXV0Y4YTAwK1BIMC9B?=
 =?utf-8?B?aEVhU1BqOUFMdGJYY0VCcm9QdzUrUlcyUmJmYUxQMzBBekdObmdEK3ZTN1JI?=
 =?utf-8?B?M1pzbTBSUDJtWUE0d3ZseU11amtKWFNyOUFRekNpVmdoL3BnTEVpeFlteGdZ?=
 =?utf-8?B?aG81M0s4NlBwbnJmOVhFRVd4S3RKejJld3V3a0Q1TFlkbHRZMTgxeEQzMDgr?=
 =?utf-8?B?Y0ZPT1FzY0t6Z1FGY3MvK2NudXVOZlR4VTM0SWlHc09SYzQ1QUtpUHBDZDBk?=
 =?utf-8?B?d1hTQU5pN0p5QytOTnA4S0VmN0Zqby9qRzFNOW1iWWdXMW9MMFN3NHY3cHEx?=
 =?utf-8?B?c3diVmJ6ZWlpOWYzbDJkZFRoaUZwVk1iWm9uSUM4alRIU0lCMUV6NTB2T2NW?=
 =?utf-8?B?cXJSYldsM1dpT0FNajdJMHdhcE1LMlJVRUtwa1oyQUtCUlltbGc2QVRXdm1S?=
 =?utf-8?B?djJDSjVhV1REYkpWTEhVLzM2WHRGZ0RicDhWTGVVdUFXL1BhTXBjeVV3OHBU?=
 =?utf-8?B?cTdad3JGaks5YnBubFY3R3pPdjVQTHh3UTJldnN6blZiMDVSS2VUWmlKQVFG?=
 =?utf-8?B?REMyUmI5SzQyRzR3emxkcHdncEE4b05UUkNTeGxDRTEzbVREcDdadVd6TVdt?=
 =?utf-8?B?ZThqRUl1NDZhRkY1TmVPcUpCcGEwS3lXK3B0WjBtdzBrZjlVZzI1TjlsaERv?=
 =?utf-8?B?UjI1cnFzWGltYytnbEEwMVN1c3BuV1hpVzYzb2J5Y2phcGdtbHJOcVc5NENx?=
 =?utf-8?B?ZHNiZmppaDdPcmI4djRhRmVtZVg3WVk0VW1sYXE5a1dvdFVLZllLWFNzVk9C?=
 =?utf-8?B?Q2N1M2tvZ1B3S0wzVUc5R2R3bGZUcDJXZGJxUXJ3V2tYNzcvbUlaYm84QXRW?=
 =?utf-8?B?TXo1eWZrZWVaelpjQUQvZ2Z0d1Zja1NHM1BJUk9yZjdDc1M0b2lyQm00VHAx?=
 =?utf-8?B?R0xGYldsQ3JsQ0dwTDFMVjlxcXIyZ2FYNVR1NzVleE45Z1BkdzA0SzdhVTVJ?=
 =?utf-8?B?d1lsUTNjUmt1UDFUaDZDaUhDZzlGejRCaU1WTTlTQzRRaDBlUmhlT2YzNnE2?=
 =?utf-8?B?eFpkSjZNUmsvR0dodkdzQVJ6WXErV2U1Q0Q5K2VQdEg2cTJJU1FudlFQQnBx?=
 =?utf-8?B?N1RTbUd6RDllYTNFY3RyMm9HZE9mWWdpY2FIa1F2NkpEb1AwUUdrRzhJcHFo?=
 =?utf-8?B?eFl1YUFpcU8zcFZ1c09wOGJVa0kreEx3eDdYY3k1c3ZDb2pEb3RCZldrRDFJ?=
 =?utf-8?B?TW1DYkxkV21ScVVmYlpYeTU0OEpmUW4wbjJYM2E0K0R2clZmOUdBcXlqRitt?=
 =?utf-8?B?SFB3eExYT0Nxd1VpL2szekR2UGZocHpKSElKSElrRU9GMzJMQ1puN0xTMm5y?=
 =?utf-8?B?T2NSOGJzZkpCQjdXMFc2dUNsT05XTUpGbVhlbmVWa2tlQmV1ZTREbmpvUlY5?=
 =?utf-8?B?VzUrVjNhZTYyV1pyQ1N1OHJlcjlsczM1di9IcUIzV3QvYjZUYXJuV2NudmNv?=
 =?utf-8?B?Nk5uUm9BcWtzbktNZjM1T1kvVlFGd0t0TU83czhOQ3hjVUVGQ3UwMXdhWjR0?=
 =?utf-8?B?VFBDWFlRalB0bGMrZnpsUWI3VW90MTN0bng1a1VrWXpaeXA2bXYrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68D6251A8FAB554B9DBCE6D75D93DB24@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af1bba23-8142-4539-b491-08d9add45bdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2021 16:23:03.3871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EnQQpupQHXgMOjfXiXpXYxCp3wHVPyHzSHiMyfQGMQlAW+Rtw8Simnmb59mcXaq42DG5TvIb1uff3m4ZpUzJ2c8KBqJOS/BxoPYoeGROWL6WBPQX0o1PvatKOyU85xfa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6883
X-Proofpoint-ORIG-GUID: F0s-OZH-L_DIu_Xnwcdt1qnONQIB1lVt
X-Proofpoint-GUID: F0s-OZH-L_DIu_Xnwcdt1qnONQIB1lVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-22_08,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 phishscore=0 bulkscore=0 impostorscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111220083

DQoNCk9uIDIyLjExLjIxIDE3OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+DQo+DQo+IE9uIDE4
LzExLzIwMjEgMDc6MTMsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gSGksIEp1
bGllbiENCj4NCj4gSGkgT2xla3NhbmRyLA0KPg0KPj4gT24gMTcuMTEuMjEgMjM6MzMsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+PiBIaSBPbGVrc2FuZHIsDQo+Pj4NCj4+PiBPbiAxNy8xMS8yMDIx
IDA2OjU2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIEp1bGllbiEN
Cj4+Pj4NCj4+Pj4gT24gMTYuMTEuMjEgMjA6NDgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4+
IEhpIE9sZWtzYW5kZXIsDQo+Pj4+Pg0KPj4+Pj4gT24gMDUvMTEvMjAyMSAwNjozMywgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hj
aGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+DQo+Pj4+Pj4g
SWYgYSBQQ0kgaG9zdCBicmlkZ2UgZGV2aWNlIGlzIHByZXNlbnQgaW4gdGhlIGRldmljZSB0cmVl
LCBidXQgaXMNCj4+Pj4+PiBkaXNhYmxlZCwgdGhlbiBpdHMgUENJIGhvc3QgYnJpZGdlIGRyaXZl
ciB3YXMgbm90IGluc3RhbnRpYXRlZC4NCj4+Pj4+PiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZhaWx1
cmUgb2YgdGhlIHBjaV9nZXRfaG9zdF9icmlkZ2Vfc2VnbWVudCgpDQo+Pj4+Pj4gYW5kIHRoZSBm
b2xsb3dpbmcgcGFuaWMgZHVyaW5nIFhlbiBzdGFydDoNCj4+Pj4+Pg0KPj4+Pj4+IChYRU4pIERl
dmljZSB0cmVlIGdlbmVyYXRpb24gZmFpbGVkICgtMjIpLg0KPj4+Pj4+IChYRU4pDQo+Pj4+Pj4g
KFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPj4+Pj4+IChY
RU4pIFBhbmljIG9uIENQVSAwOg0KPj4+Pj4+IChYRU4pIENvdWxkIG5vdCBzZXQgdXAgRE9NMCBn
dWVzdCBPUw0KPj4+Pj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioNCj4+Pj4+Pg0KPj4+Pj4+IEZpeCB0aGlzIGJ5IGFkZGluZyAibGludXgscGNpLWRvbWFp
biIgcHJvcGVydHkgZm9yIGFsbCBkZXZpY2UgdHJlZSBub2Rlcw0KPj4+Pj4+IHdoaWNoIGhhdmUg
InBjaSIgZGV2aWNlIHR5cGUsIHNvIHdlIGtub3cgd2hpY2ggc2VnbWVudHMgd2lsbCBiZSB1c2Vk
IGJ5DQo+Pj4+Pj4gdGhlIGd1ZXN0IGZvciB3aGljaCBicmlkZ2VzLg0KPj4+Pj4+DQo+Pj4+Pj4g
Rml4ZXM6IDRjZmFiNDQyNWQzOSAoInhlbi9hcm06IEFkZCBsaW51eCxwY2ktZG9tYWluIHByb3Bl
cnR5IGZvciBod2RvbSBpZiBub3QgYXZhaWxhYmxlLiIpDQo+Pj4+Pj4NCj4+Pj4+PiBTaWduZWQt
b2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQo+Pj4+Pj4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBOZXcgaW4gdjYNCj4+Pj4+PiAt
LS0NCj4+Pj4+PiDCoMKgwqAgeGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jwqDCoMKgwqDCoMKg
wqAgfCAxNSArKysrKysrKysrKysrKy0NCj4+Pj4+PiDCoMKgwqAgeGVuL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC1jb21tb24uYyB8wqAgMiArLQ0KPj4+Pj4+IMKgwqDCoCB4ZW4vaW5jbHVkZS9hc20t
YXJtL3BjaS5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA4ICsrKysrKysrDQo+Pj4+Pj4gwqDCoMKg
IDMgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4+
Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMgYi94ZW4v
YXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+PiBpbmRleCA0OTFmNWUyYzMxNmUuLmY3ZmNi
MTQwMGMxOSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMN
Cj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vZG9tYWluX2J1aWxkLmMNCj4+Pj4+PiBAQCAtNzUz
LDkgKzc1MywyMiBAQCBzdGF0aWMgaW50IF9faW5pdCB3cml0ZV9wcm9wZXJ0aWVzKHN0cnVjdCBk
b21haW4gKmQsIHN0cnVjdCBrZXJuZWxfaW5mbyAqa2luZm8sDQo+Pj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVpbnQx
Nl90IHNlZ21lbnQ7DQo+Pj4+Pj4gwqDCoMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFRoZSBub2RlIGRvZXNuJ3QgaGF2ZSAi
bGludXgscGNpLWRvbWFpbiIgcHJvcGVydHkgYW5kIGl0IGlzDQo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAqIHBvc3NpYmxlIHRoYXQ6DQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqwqAgLSBYZW4gb25seSBoYXMgZHJpdmVycyBmb3IgYSBwYXJ0IG9mIHRoZSBob3N0
IGJyaWRnZXMNCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICrCoCAtIHNvbWUgaG9z
dCBicmlkZ2VzIGFyZSBkaXNhYmxlZA0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KiBNYWtlIHN1cmUgd2UgaW5zZXJ0IHRoZSBjb3JyZWN0ICJsaW51eCxwY2ktZG9tYWluIiBwcm9w
ZXJ0eQ0KPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBpbiBhbnkgY2FzZSwgc28g
d2Uga25vdyB3aGljaCBzZWdtZW50cyB3aWxsIGJlIHVzZWQNCj4+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogYnkgTGludXggZm9yIHdoaWNoIGJyaWRnZXMuDQo+Pj4+Pg0KPj4+Pj4g
VGhlIGNoZWNrIGFib3ZlIHdpbGwgY2hlY2sgdGhlIG5vZGUgdHlwZSBpcyAicGNpIi4gQUZBSUNU
LCB0aGlzIHdvdWxkIGFsc28gY292ZXIgUENJIGRldmljZXMuIEkgYW0gbm90IGF3YXJlIG9mIGFu
eSBpc3N1ZSB0byBhZGQgImxpbnV4LHBjaS1kb21haW4iIGZvciB0aGVtLiBIb3dldmVyLCB0aGlz
IGZlZWxzIGEgYml0IG9kZC4NCj4+Pj4+DQo+Pj4+PiDCoMKgRnJvbSBteSB1bmRlcnN0YW5kaW5n
LCBhIFBDSSBkZXZpY2Ugd291bGQgYWx3YXlzIGJlIGRlc2NyaWJlZCBhcyBhIGNoaWxkIG9mIHRo
ZSBob3N0YnJpZGdlcy4gU28gSSB3b3VsZCByZXdvcmsgdGhlICdpZicgdG8gYWxzbyBjaGVjayBp
ZiB0aGUgcGFyZW50IHR5cGUgaXMgbm90ICJwY2kiLg0KPj4+Pj4NCj4+Pj4gV2UgbWF5IGhhdmUg
ImJyaWRnZSAtPiBicmlkZ2UgLT4gZGV2aWNlIiB0b3BvbG9neSBhcyB3ZWxsLg0KPj4+DQo+Pj4g
RG8geW91IGhhdmUgYW4gZXhhbXBsZSBvZiBEZXZpY2UtVHJlZT8NCj4+IE5vLCBJIGRvbid0IGhh
dmUgYXQgaGFuZCwgYnV0IEkgY2FuIGltYWdpbmUgdGhpcyBjYW4gcmVsYXRpdmVseSBlYXN5IGJl
IGRvbmUgd2l0aCBRRU1VID4gRXZlbiBpZiBub3QsIGRvIHlvdSBhc3N1bWUgdGhpcyB0b3BvbG9n
eSBjYW4gbmV2ZXIgaGFwcGVuPw0KPg0KPiBJIHRoaW5rIGl0IGlzIG5vdCBwb3NzaWJsZSB0byBk
ZXNjcmliZSB0aGVtIGluIHRoZSBEZXZpY2UtVHJlZSBiZWNhdXNlIHlvdSB3b3VsZG4ndCBiZSBh
YmxlIHRvIHRyYW5zbGF0ZSB0aGUgInJlZ3MiIG9mIHRoZSBuZXN0ZWQgaG9zdGJyaWRnZSB0byBh
biBhY3R1YWwgTU1JTyBhZGRyZXNzLg0KPg0KPiBJbiBmYWN0LCBsb29raW5nIGF0IGR0X2Rldmlj
ZV9nZXRfYWRkcmVzcygpLCBJIHRoaW5rIFhlbiB3b3VsZCByZWplY3Qgc3VjaCBEVC4NCj4NCj4+
Pg0KPj4+PiBTbywgSSBwcmVmZXIgdG8gaGF2ZSB0aGUgY2hlY2sgYXMgaXQgaXMuDQo+Pj4NCj4+
PiBJIGRvbid0IHJlYWxseSBsaWtlIHRoZSBpZGVhIHRvIHNwdXJpb3VzbHkgYWRkICJsaW51eCxw
Y2ktZG9tYWluIiB0byBQQ0kgRFQgbm9kZS4gQnV0IGlmIHRoZXJlIGFyZSBubyBvdGhlciBzb2x1
dGlvbiwgdGhlbiB0aGlzIHNob3VsZCBhdCBsZWFzdCBiZSBtZW50aW9ubmVkIGluIHRoZSBjb21t
aXQgbWVzc2FnZSBhbmQgY29kZS4NCj4+IEkgYW0gZmluZSB3aXRoIGFueSBzb2x1dGlvbiBoZXJl
LCBJIGp1c3Qgd2FudCB0aGF0IHRvIGJlIGRlZmluZWQgYW5kIGltcGxlbWVudGVkLg0KPj4gUGxl
YXNlIGxldCBtZSBrbm93IHRoZSBmaW5hbCBkZWNpc2lvbiBvbiB0aGlzIGFuZCBob3cgd2UgcHJv
Y2VlZA0KPg0KPiBJIHdvdWxkIHByZWZlciB0byBnbyB3aXRoIG15IHdheS4gVGhpcyBjYW4gYmUg
cmVmaW5lZCBpbiB0aGUgZnV0dXJlIGlmIHdlIGZpbmQgRGV2aWNlLVRyZWUgdGhhdCBtYXRjaGVz
IHdoYXQgeW91IHdyb3RlLg0KT2ssIHNvIGp1c3QgdG8gbWFrZSBpdCBjbGVhcjoNCiA+YSBQQ0kg
ZGV2aWNlIHdvdWxkIGFsd2F5cyBiZSBkZXNjcmliZWQgYXMgYSBjaGlsZCBvZiB0aGUgaG9zdGJy
aWRnZXMuIFNvIEkgd291bGQgcmV3b3JrIHRoZSAnaWYnIHRvIGFsc28gY2hlY2sgaWYgdGhlwqBw
YXJlbnTCoHR5cGXCoGlzwqBub3TCoCJwY2kiDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwN
Ck9sZWtzYW5kcg==

