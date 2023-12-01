Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED40800165
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 03:07:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645206.1007187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8suw-0006ZB-0y; Fri, 01 Dec 2023 02:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645206.1007187; Fri, 01 Dec 2023 02:06:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8suv-0006WO-U2; Fri, 01 Dec 2023 02:06:09 +0000
Received: by outflank-mailman (input) for mailman id 645206;
 Fri, 01 Dec 2023 02:06:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z/b2=HM=epam.com=prvs=6699671c5f=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1r8suu-0006Uc-Qh
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 02:06:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d37939f-8fee-11ee-9b0f-b553b5be7939;
 Fri, 01 Dec 2023 03:06:02 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B11r456022025; Fri, 1 Dec 2023 02:06:00 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3upvgvsqyn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Dec 2023 02:06:00 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (2603:10a6:208:4b::31)
 by AS8PR03MB7815.eurprd03.prod.outlook.com (2603:10a6:20b:34d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 02:05:54 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::8e16:90d9:e422:f352]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::8e16:90d9:e422:f352%7]) with mapi id 15.20.7046.024; Fri, 1 Dec 2023
 02:05:54 +0000
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
X-Inumbo-ID: 2d37939f-8fee-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NT9/ervIgbbWBoQ+UDrO5qhBigb+NNTmYPp8lXwwQqRLeEVzDQxvoLTT9I6lDzcOhmIfbUqi+g6ABdJAH7XTe9oTRVeKi+eNxQKnPteB7LTHImq38EiiDY4noacCxZkYeUjptrmP59fnN4scc5rEJPEZhcKM+gzr35EAzf3Am59aysajj32HiCvRGwBAbqaPtMp1CVzNiAGrvoNSIXUpvpy3Ot12fDiFkr9ep1+dwAhsf30O8V6Uye9UKGI86A07D48Mu3Kpk4JIpJfycYuxc9pQ3TlXg6ezuyFzV9ohHbfL8bzucKiQhgNMAlf4YlevoYCHftmbgp75z8F843pm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWnHXlpbtKjwFyW/OSvOOzWgr2OpALfOywvspc+l5uA=;
 b=GO/SQqQNK2mI98Lp3qXcTY1ruVGotN46zTs4lMP9kEOleybFoOOlmpQot7wcH03eHPytFaP0eoLXI+8DArZO15qN9OuYB0Zybmc3bl/WYz03cDyRw9OE2CaGi4zpybhkqqw4ILUZnLYJMFjKki4zeZqUuvd8HN8qTQeXmq098ZqhtkxlQ48NzBy5fr6sdijfnNHxpuEwS/u832PrbJASSqnJ8rkX008eGnVnINhnRwAVBjsFiYWSf4DkiQJipI0JLBdBqkDTh26F17GD/Q0VCrq1rAePRhWj6hcSlEnXZAfiMMG8vX8TzZwJqFAHb2SQ4k6BAtR4EOpbiZhhIhM7mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWnHXlpbtKjwFyW/OSvOOzWgr2OpALfOywvspc+l5uA=;
 b=cJwVgOlFJ++LOQKe3zOyv+naD1472pR9PTeIoqXt+6scYJjJkNtboBCZ2tgymLtYkHa4PCGMHJMtBSLcdxBrZ+5PUH3pW/ZMK/R6cg49ADIHjzvwUQX1+TwQbrVkBNjHF0BOBeWxzLAgnRvedsIvTIKLtZBiPjrkOCw4o+UfQtJzifMv/bqRp+0bapB7VYwAlPsMPfrZSnfEsNDPemkZQctBAANgqN8NGi8cEa0EU1kMwsjR1pxadzoijypSQxSPn5UNmxu51r47JB8OorIacIX91Uv14ypQ5exV1L4Q4v5JhSbkhPNOiWQs9DXeeR9Ycl26HVgcJjvKi5ctiJtWfw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stewart
 Hildebrand <stewart.hildebrand@amd.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v10 12/17] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHZ/Vi+sHqpo/XMzUSHL9PkKFM5oLCFEBkAgA7qLAA=
Date: Fri, 1 Dec 2023 02:05:54 +0000
Message-ID: <87zfyusmmg.fsf@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-13-volodymyr_babchuk@epam.com>
 <ZVy73iJ3E8nJHvgf@macbook.local>
In-Reply-To: <ZVy73iJ3E8nJHvgf@macbook.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.10.7; emacs 29.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB3699:EE_|AS8PR03MB7815:EE_
x-ms-office365-filtering-correlation-id: 0ce2415d-f5a2-4b9f-0baf-08dbf2120cd1
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cIKUmRCfSNbPR65XKwR0I6MqHZ2RshapLmlmQwwzyKqXukUdiuo4gaPX3OpVCBINXGlvbZCpqfZloNQPd6z+IsLoN3Fs/yGbbL3KHzaSS4XTMLScaseUrKG1xaH6LREoBwTvEJyh8LxnUCvI8rwDYieU43f2Zd04V3QWGdMLk2xYB9uHfRHbO38MMzaBo2Vj+40Bc94oXvs1wo3OGRNkglEJyZaQCPTUm2Yp6iEo58aj5v0/ZiKDTZCf9UnZ//wMoArWItFHJLhG0rjvfYLpUNzeboBtBcak0Pc2gxO6KlOfd/HYsqofknyGtR/CttjHqOI310KWadDoo7qzgT/MadwghWpSNG7C1jBZzcpg5soTn9C2bhvqiBr5r+xodQOFzKApgJYQ3ACwPjtOG9/npIj+ueZwGUlteoegv2ZXvle4u9MNHLPZ1fGUzRmlfmCfT6ukfnUnKAY58dHrZ/tkkJMLOXMxxGh8zKKlK3WDwmcU+BQJgaRJC3RCnhgzRUNpjenvJiUbNqkHwK2tQokOtUjwua+F7SXqK/xqh9E+s/HgoUR1FGXjcVSd9t7z6AMhv+g83JgecK1OmKYX+RB8YQxW8+y43Eg3lJPYnL9rHFVJeSIKRA0Mm7pxKV6Y4GKf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(83380400001)(26005)(6486002)(478600001)(71200400001)(107886003)(2616005)(6506007)(55236004)(6512007)(110136005)(316002)(66946007)(64756008)(8676002)(66446008)(91956017)(66476007)(54906003)(66556008)(76116006)(8936002)(86362001)(122000001)(38100700002)(4326008)(5660300002)(36756003)(41300700001)(38070700009)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cm0wTFVIazlOSDhiR0lScW1MU09mTTZoTFR3SWJJbERnWVorOWQ3M0Z6dDlZ?=
 =?utf-8?B?WTR1eXBybkwzZTRYc2xKMERYaDRjNHlJL0g5amxvM2s2d0M2YnhGclcwcEUx?=
 =?utf-8?B?QUFkNnM2SXVESVVBanQ1d1cyU25yRmd0Y0E0RmdqbVArMlIza25ZWlRwcVM4?=
 =?utf-8?B?ZjltelFrSnJoWnAxVk15VWxoQ2o5dGFEdkRVMStkZnVRK1ljZ3g5aTQxdE1z?=
 =?utf-8?B?K290aWJNT3JuTlUyMXBabTNYNXZyNVZEUG9OZDJRWDA3SHlhZG9QU0phUXRu?=
 =?utf-8?B?NHF6bWU5MVQwL0tFeU9WRS9SRjl5UXFGbU41T0JEMVFIam41NVZqNlBXV3di?=
 =?utf-8?B?UVFwRXQzeUdrRXNSQnd0aWZsb3cwUUpoVnNYUDhpNkoyU0V0TXpkZFRpSS84?=
 =?utf-8?B?dW0zcjFod0t0MUZSazY0Qk1QWnFoMXpNZFpKdjdKYzJWc00wVGwveU56N1RM?=
 =?utf-8?B?Z2ZMTVN5aVo4YTdXOXp5R1NYRFdZUld2cE5UV0p6UGNXTjFhNzc2MURoMHNp?=
 =?utf-8?B?bnc5UlVwUStaZ1hvanJTYzRkNHVTN3lRdUJzQm5qQk1YSEw3c1lwdDBpV211?=
 =?utf-8?B?d0lnK09rdUhGSCsyNzRRMmo1NkJGVFhkUkVJRnZlMUx1cnZyc1BsenJyZ0RQ?=
 =?utf-8?B?VERIdlNuR1NXLzVUQlY5Qk1hWXNJOHJmYm9oMHhsMlpNbUVXMWFETU1PT1p1?=
 =?utf-8?B?SlBtTUtuYTZCNEdtb0JLaDdMNW1nSzlZY2g0aklMNjFUSEloY0VzNTV6c3dF?=
 =?utf-8?B?cmxTN1Y5YnMyb2JxWW9XVldRZEZwZTVHUm1SZzUvaVYrRDVxdHhaUms1VTNo?=
 =?utf-8?B?YURrR0dmc2Fiek1JTGJoeWN1c25pc2dvd1BtRFVQSFYranhXZldHZ2Q3WEwx?=
 =?utf-8?B?OGVBVzExNE5BaFRGVmlFQXl0bTYvRWpRcC9ERVRYd3Roa2R5dWtHdENBUzU5?=
 =?utf-8?B?MUJYTitvbEJvZ3lPaHg2QytJeldPbkhTa2RvWW9VanZaVTdxenNRSFEzN2o2?=
 =?utf-8?B?YmFiSkFvUldIWDdHaHdxWUV4UzIzUHp2Zi85OWhXNU1GbXN3N3JIMU5Lb0I5?=
 =?utf-8?B?L1BCcnRUWlMybDcxdU04MGV2S2w1V2lQdHBENGdYTjNlR1hOUmYrVGFNVlF2?=
 =?utf-8?B?NmNIcHJyMmRmZVV4Ym5UYXQ0eXY4RTQxcmhWUGZBUVlHcm02Ri9uamE1Q1Vw?=
 =?utf-8?B?MXpkTU9QWXNIOW1lM1NYMC9CUTJHcC81bXRSMERoSjh0Q01BT014WjMwVVQ4?=
 =?utf-8?B?SGtVNktGZU53UjZycFkydG9SbDY1REJVQkxxNk9ubkhwSzFaa29Ud29MMXdG?=
 =?utf-8?B?allMcW9jQmpKc2xRWFZRVjVEVDhETVNHNjdnVFIwajlPY0VFZmNYcUx3WW56?=
 =?utf-8?B?T3BtM3RtbXNxK2JoWkRGS3BVczd6bDZHSER4dVZ2QVZhVWZSRTZmSVdCREZz?=
 =?utf-8?B?QVJpV1dHLzdnMk93TTMxNkZpKzdWWTlxd0FER2pzZVk3NmhWNTFWMWNIQkJk?=
 =?utf-8?B?VU8wNEtWQ20raXFMUzk1R3NrMU1VTUFqUEs3RXpFZzNZSm5hL01jRGUxdnZk?=
 =?utf-8?B?bDNEMWJPTURCWFFnekZqZUNtNVpXRHRxQUJXdUJGemt3dWZRcHpqSi93QjJt?=
 =?utf-8?B?V3hBNllpNDJQV0NkemZPQS94N3QraUFOK0QyQ0lXcHU1R1VGandVSkN0MC9a?=
 =?utf-8?B?Nm53bU9iZ3BLWnc4WVcvenNCNUEzMVpVdCtPOG1vdWhQWEFWZ2srekRNOFdS?=
 =?utf-8?B?N3lQakprLzZRSC9raVNHdUk1cmtPRmExVmtzMUVIcThvYmlQRGF0a1Njcm1z?=
 =?utf-8?B?emo1Wm1mRGMrMVIySVoyNFJabzluZ0JscVVRcExSU291a3dDTzc0eGE1SlZu?=
 =?utf-8?B?bm1ta284OGloRThyYkVNN0hxVDZKMjh3dm9TSjZZdEpmYTN1Qlgzd0xzVGdD?=
 =?utf-8?B?MmxIbW1LK0toM0FrVGFMRzB0ajlhSk9FUitvK2ptY20yTUtyMVltYmdUejA2?=
 =?utf-8?B?VnYyVEZabFBaUVdnSGNobHpuRzBsY2dsUmEzL3habDJUVnJpOXZpYldlSENV?=
 =?utf-8?B?SE9qYTJNUUxFL2huRHNKTXdFSEthTERaSkR1Sm9jeEU5MVlPV280K215L09o?=
 =?utf-8?B?N0NpamNXQVNDVURYZGVnWE1KUjBWWTMvOU5Bd05hWGJOV3JKeEVLZ0FvTTRP?=
 =?utf-8?B?bEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <ECB6F52FF2AFF64BB944F499A2E21822@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ce2415d-f5a2-4b9f-0baf-08dbf2120cd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 02:05:54.0965
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aOyq7BEUQE+iR7ZVOAxwKSrbqNG/aMmzcKCJum0djyoHyr1/+i2CoVmfGk1t7HQPiWDkDYv9JyvaV7lyJIkYNnd3DuICvjBJgzFiijiADlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7815
X-Proofpoint-GUID: 6uJzVPlU5jvfGeXzemS8s44cbGRYn2ve
X-Proofpoint-ORIG-GUID: 6uJzVPlU5jvfGeXzemS8s44cbGRYn2ve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-30_25,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=758
 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312010011

DQpIaSBSb2dlciwgU3Rld2FydCwNCg0KUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+IHdyaXRlczoNCg0KPiBPbiBUaHUsIE9jdCAxMiwgMjAyMyBhdCAxMDowOToxOFBNICsw
MDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IA0KPj4gWGVuIGFu
ZC9vciBEb20wIG1heSBoYXZlIHB1dCB2YWx1ZXMgaW4gUENJX0NPTU1BTkQgd2hpY2ggdGhleSBl
eHBlY3QNCj4+IHRvIHJlbWFpbiB1bmFsdGVyZWQuIFBDSV9DT01NQU5EX1NFUlIgYml0IGlzIGEg
Z29vZCBleGFtcGxlOiB3aGlsZSB0aGUNCj4+IGd1ZXN0J3MgdmlldyBvZiB0aGlzIHdpbGwgd2Fu
dCB0byBiZSB6ZXJvIGluaXRpYWxseSwgdGhlIGhvc3QgaGF2aW5nIHNldA0KPj4gaXQgdG8gMSBt
YXkgbm90IGVhc2lseSBiZSBvdmVyd3JpdHRlbiB3aXRoIDAsIG9yIGVsc2Ugd2UnZCBlZmZlY3Rp
dmVseQ0KPj4gaW1wbHkgZ2l2aW5nIHRoZSBndWVzdCBjb250cm9sIG9mIHRoZSBiaXQuIFRodXMs
IFBDSV9DT01NQU5EIHJlZ2lzdGVyIG5lZWRzDQo+PiBwcm9wZXIgZW11bGF0aW9uIGluIG9yZGVy
IHRvIGhvbm9yIGhvc3QncyBzZXR0aW5ncy4NCj4+IA0KPj4gQWNjb3JkaW5nIHRvICJQQ0kgTE9D
QUwgQlVTIFNQRUNJRklDQVRJT04sIFJFVi4gMy4wIiwgc2VjdGlvbiAiNi4yLjINCj4+IERldmlj
ZSBDb250cm9sIiB0aGUgcmVzZXQgc3RhdGUgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgaXMgdHlw
aWNhbGx5IDAsDQo+PiBzbyB3aGVuIGFzc2lnbmluZyBhIFBDSSBkZXZpY2UgdXNlIDAgYXMgdGhl
IGluaXRpYWwgc3RhdGUgZm9yIHRoZSBndWVzdCdzIHZpZXcNCj4+IG9mIHRoZSBjb21tYW5kIHJl
Z2lzdGVyLg0KPj4gDQo+PiBIZXJlIGlzIHRoZSBmdWxsIGxpc3Qgb2YgY29tbWFuZCByZWdpc3Rl
ciBiaXRzIHdpdGggbm90ZXMgYWJvdXQNCj4+IGVtdWxhdGlvbiwgYWxvbmcgd2l0aCBRRU1VIGJl
aGF2aW9yIGluIHRoZSBzYW1lIHNpdHVhdGlvbjoNCj4+IA0KPj4gUENJX0NPTU1BTkRfSU8gLSBR
RU1VIGRvZXMgbm90IGFsbG93IGEgZ3Vlc3QgdG8gY2hhbmdlIHZhbHVlIG9mIHRoaXMgYml0DQo+
PiBpbiByZWFsIGRldmljZS4gSW5zdGVhZCBpdCBpcyBhbHdheXMgc2V0IHRvIDEuIEEgZ3Vlc3Qg
Y2FuIHdyaXRlIHRvIHRoaXMNCj4+IHJlZ2lzdGVyLCBidXQgd3JpdGVzIGFyZSBpZ25vcmVkLg0K
Pj4gDQo+PiBQQ0lfQ09NTUFORF9NRU1PUlkgLSBRRU1VIGJlaGF2ZXMgZXhhY3RseSBhcyB3aXRo
IFBDSV9DT01NQU5EX0lPLiBJbg0KPj4gWGVuIGNhc2UsIHdlIGhhbmRsZSB3cml0ZXMgdG8gdGhp
cyBiaXQgYnkgbWFwcGluZy91bm1hcHBpbmcgQkFSDQo+PiByZWdpb25zLiBGb3IgZGV2aWNlcyBh
c3NpZ25lZCB0byBEb21VcywgbWVtb3J5IGRlY29kaW5nIHdpbGwgYmUNCj4+IGRpc2FibGVkIGFu
ZCB0aGUgaW5pdGlhbGl6YXRpb24uDQo+PiANCj4+IFBDSV9DT01NQU5EX01BU1RFUiAtIEFsbG93
IGd1ZXN0IHRvIGNvbnRyb2wgaXQuIFFFTVUgcGFzc2VzIHRocm91Z2gNCj4+IHdyaXRlcyB0byB0
aGlzIGJpdC4NCj4+IA0KPj4gUENJX0NPTU1BTkRfU1BFQ0lBTCAtIEd1ZXN0IGNhbiBnZW5lcmF0
ZSBzcGVjaWFsIGN5Y2xlcyBvbmx5IGlmIGl0IGhhcw0KPj4gYWNjZXNzIHRvIGhvc3QgYnJpZGdl
IHRoYXQgc3VwcG9ydHMgc29mdHdhcmUgZ2VuZXJhdGlvbiBvZiBzcGVjaWFsDQo+PiBjeWNsZXMu
IEluIG91ciBjYXNlIGd1ZXN0IGhhcyBubyBhY2Nlc3MgdG8gaG9zdCBicmlkZ2VzIGF0IGFsbC4g
VmFsdWUNCj4+IGFmdGVyIHJlc2V0IGlzIDAuIFFFTVUgcGFzc2VzIHRocm91Z2ggd3JpdGVzIG9m
IHRoaXMgYml0LCB3ZSB3aWxsIGRvDQo+PiB0aGUgc2FtZS4NCj4+IA0KPj4gUENJX0NPTU1BTkRf
SU5WQUxJREFURSAtIEFsbG93cyAiTWVtb3J5IFdyaXRlIGFuZCBJbnZhbGlkYXRlIiBjb21tYW5k
cw0KPj4gdG8gYmUgZ2VuZXJhdGVkLiBJdCByZXF1aXJlcyBhZGRpdGlvbmFsIGNvbmZpZ3VyYXRp
b24gdmlhIENhY2hlbGluZQ0KPj4gU2l6ZSByZWdpc3Rlci4gV2UgYXJlIG5vdCBlbXVsYXRpbmcg
dGhpcyByZWdpc3RlciByaWdodCBub3cgYW5kIHdlDQo+PiBjYW4ndCBleHBlY3QgZ3Vlc3QgdG8g
cHJvcGVybHkgY29uZmlndXJlIGl0LiBRRU1VICJlbXVsYXRlcyIgYWNjZXNzIHRvDQo+PiBDYWNo
bGluZSBTaXplIHJlZ2lzdGVyIGJ5IGlnbm9yaW5nIGFsbCB3cml0ZXMgdG8gaXQuIFFFTVUgcGFz
c2VzIHRocm91Z2gNCj4+IHdyaXRlcyBvZiBQQ0lfQ09NTUFORF9JTlZBTElEQVRFIGJpdCwgd2Ug
d2lsbCBkbyB0aGUgc2FtZS4NCj4+IA0KPj4gUENJX0NPTU1BTkRfVkdBX1BBTEVUVEUgLSBFbmFi
bGUgVkdBIHBhbGV0dGUgc25vb3BpbmcuIFFFTVUgcGFzc2VzDQo+PiB0aHJvdWdoIHdyaXRlcyBv
ZiB0aGlzIGJpdCwgd2Ugd2lsbCBkbyB0aGUgc2FtZS4NCj4+IA0KPj4gUENJX0NPTU1BTkRfUEFS
SVRZIC0gQ29udHJvbHMgaG93IGRldmljZSByZXNwb25zZSB0byBwYXJpdHkNCj4+IGVycm9ycy4g
UUVNVSBpZ25vcmVzIHdyaXRlcyB0byB0aGlzIGJpdCwgd2Ugd2lsbCBkbyB0aGUgc2FtZS4NCj4+
IA0KPj4gUENJX0NPTU1BTkRfV0FJVCAtIFJlc2VydmVkLiBTaG91bGQgYmUgMCwgYnV0IFFFTVUg
cGFzc2VzDQo+PiB0aHJvdWdoIHdyaXRlcyBvZiB0aGlzIGJpdCwgc28gd2Ugd2lsbCBkbyB0aGUg
c2FtZS4NCj4+IA0KPj4gUENJX0NPTU1BTkRfU0VSUiAtIENvbnRyb2xzIGlmIGRldmljZSBjYW4g
YXNzZXJ0IFNFUlIuIFFFTVUgaWdub3Jlcw0KPj4gd3JpdGVzIHRvIHRoaXMgYml0LCB3ZSB3aWxs
IGRvIHRoZSBzYW1lLg0KPj4gDQo+PiBQQ0lfQ09NTUFORF9GQVNUX0JBQ0sgLSBPcHRpb25hbCBi
aXQgdGhhdCBhbGxvd3MgZmFzdCBiYWNrLXRvLWJhY2sNCj4+IHRyYW5zYWN0aW9ucy4gSXQgaXMg
Y29uZmlndXJlZCBieSBmaXJtd2FyZSwgc28gd2UgZG9uJ3Qgd2FudCBndWVzdCB0bw0KPj4gY29u
dHJvbCBpdC4gUUVNVSBpZ25vcmVzIHdyaXRlcyB0byB0aGlzIGJpdCwgd2Ugd2lsbCBkbyB0aGUg
c2FtZS4NCj4+IA0KPj4gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIC0gRGlzYWJsZXMgSU5UeCBz
aWduYWxzLiBJZiBNU0koWCkgaXMNCj4+IGVuYWJsZWQsIGRldmljZSBpcyBwcm9oaWJpdGVkIGZy
b20gYXNzZXJ0aW5nIElOVHggYXMgcGVyDQo+PiBzcGVjaWZpY2F0aW9uLiBWYWx1ZSBhZnRlciBy
ZXNldCBpcyAwLiBJbiBRRU1VIGNhc2UsIGl0IGNoZWNrcyBvZiBJTlR4DQo+PiB3YXMgbWFwcGVk
IGZvciBhIGRldmljZS4gSWYgaXQgaXMgbm90LCB0aGVuIGd1ZXN0IGNhbid0IGNvbnRyb2wNCj4+
IFBDSV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQuIEluIG91ciBjYXNlLCB3ZSBwcm9oaWJpdCBh
IGd1ZXN0IHRvDQo+PiBjaGFuZ2UgdmFsdWUgb2YgdGhpcyBiaXQgaWYgTVNJKFgpIGlzIGVuYWJs
ZWQuDQo+DQo+IEZXSVcsIGJpdHMgMTEtMTUgYXJlIFJzdmRQLCBzbyB3ZSB3aWxsIG5lZWQgdG8g
YWRkIHN1cHBvcnQgZm9yIHRoZW0NCj4gYWZ0ZXIgdGhlIHNlcmllcyBmcm9tIFN0ZXdhcnQgdGhh
dCBhZGRzIHN1cHBvcnQgZm9yIHJlZ2lzdGVyIG1hc2tzIGlzDQo+IGFjY2VwdGVkLg0KDQpTdGV3
YXJ0J3Mgc2VyaWVzIGltcGxlbWVudCBtdWNoIGJldHRlciByZWdpc3RlciBoYW5kbGluZyB0aGFu
IHRoaXMNCnBhdGNoLiBXaGF0IGFib3V0IGRyb3BwaW5nIHRoaXMgY2hhbmdlIGF0IGFsbCBpbiBm
YXZvciBvZiBTdGV3YXJ0J3MNCmltcGxlbWVudGF0aW9uPyBJJ2xsIGJlIDEwMCUgb2theSB3aXRo
IHRoaXMuDQoNClsuLi5dDQoNCi0tIA0KV0JSLCBWb2xvZHlteXI=

