Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4114B5342
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 15:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272340.467141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcIx-0002aV-8T; Mon, 14 Feb 2022 14:26:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272340.467141; Mon, 14 Feb 2022 14:26:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJcIx-0002Yf-4x; Mon, 14 Feb 2022 14:26:15 +0000
Received: by outflank-mailman (input) for mailman id 272340;
 Mon, 14 Feb 2022 14:26:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJcIv-0002Vp-8W
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 14:26:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da54466-8da2-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 15:26:10 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EENNuM001516;
 Mon, 14 Feb 2022 14:26:06 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e7rr1g0v4-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 14:26:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB4604.eurprd03.prod.outlook.com (2603:10a6:10:14::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Mon, 14 Feb
 2022 14:26:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 14:26:01 +0000
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
X-Inumbo-ID: 0da54466-8da2-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgQBvioz8Q9DoKPFITG/ZMC7J1hz0oxFTePwIegIGiGnmftn3h73pCSQEwJbYG+zWZ1QstuPdgDbhDPJmwa3IKpr1AoyZtgSPJI4eD0bYqHXT+E3w1uhMas9L962529/kI6Bklp51LnN7gajWpDZg7wB3woh0lgX7JSy10NwRqP9lt/3pvhFwC4DlIGqXeFqx9vJAjIUSOnGOMpfZKj5nm9R9K3iVN844c4uIiODmsgaqDItiCL8RJplWvnPwFDUpn7J+n3CBIJ9bb0XPZIifL1s2CceVdRCq9wDHOFmuo6FXCDTYiBaPDTmHn40v1ggkDX0XUS5pc1YzL7MUMO97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kglRE+Ltomp1uOqZzKumzA6w/VPuR7sg+jHMWcYKaDw=;
 b=bpAlwT5BC94oa3m2GtjuiVTZ7B+Fkgyqap+pJFB2DDtO2i6DE1BpvEH61GPI1wcDszvBXBwvSBENbWxDuzPWdn00e7/n3W2HoT/i2rbTkm4mdtf4LbSs5KG6GQaKqvOODoKhC5TL4SdV1MX8ChKxyb0tVhnv5cAmP4bsYHj7CduDNnTUcz0RuIpjFrconxkokfyowxmCV+Anlg3LdPTKXM596ZbZJn/jZ8ivC1eIwdK8Eg7odApyjEhOcuEY9CWANne5xIvHT/5FxL4GSX0hSfmhCBFDCRwNoNYzZiakGRLoex46VLQrjyA9Xj3iFy/V0IjMbEHicCFo1PV5/9x3qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kglRE+Ltomp1uOqZzKumzA6w/VPuR7sg+jHMWcYKaDw=;
 b=Wgw6LH8gE7dKMMUlJkg/Da3LUBnmH+zEzohwVeEk3mmm4n+IwPYy+7w6z+amtbxQ+nQAo8JSA0wzABvTy52d4ksVfdzmhk/FUXEYesO1yRF2HfOnXMB2TIgbVsd9R3vM/JO+bILGCFfmqzyp6KhdqzEjdb8jah3iPE/FxKRDSdu7QJ7X/EHp107lQHz2QeCMWk+h4ZauaYVYEF+q5lNXTu5lYcJYqTyvlfk95Zx1v/P/7UjZ213Wpi26nhCQdf/97p+ar7tWZqEA/WXJhUEJbFvj+RiG1LdR6OAqYVNLixfOiNO5mIYLKGTXmlAcMDvVIqnlFUQJiDy3l6nx2CMByg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYHboQT3cBWYI1/EGunE7hOwop6ayTIGYAgAABuQA=
Date: Mon, 14 Feb 2022 14:26:01 +0000
Message-ID: <40feb747-c459-2a2d-6ca1-ac9f8fea47e3@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <77f818a7-fe8a-20e5-3f1c-8fb7aef7984b@suse.com>
In-Reply-To: <77f818a7-fe8a-20e5-3f1c-8fb7aef7984b@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 63f77514-3d0c-4917-9200-08d9efc5ed0f
x-ms-traffictypediagnostic: DB7PR03MB4604:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB46045ABB215B1820A78311A6E7339@DB7PR03MB4604.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sC4Dez2JZSM8HeG7GZZKyXBkepfr4bK/qTqvT3pZySwv3aE5YRgc/DTRAAzGjeeyh08PPRGJFezzjb9phOkG31oW7aPYJB6MAYGdyRW+EFsKDg8HUu1xstFQRaCP/tjN74K55NKxogFSbFUZzu0Z9djkqIiuAIncaOMz+Qr5jV6Uz0gMeHICOjaGgvNJNduo2eBDCQytcMD+3d5JpQenIaHYRNZUyq1ehl1nekjIM0i+PlyNHHHUHO4iN1jhrSRBcUWPj+XvxULL4uPt7idftgryNEcJnkgYYdigzRWgN+RYJQrrGb0K4XmzxrpKNY0VDiPg9ORYEYCsLkBmURL29gZ4tIIZDKM9fZ9b/cMMYcDHb10b1R2zt02L84kU+DYIYl+sk9iqFZvV7k7Ld7dqVRKvU6v2umAeRZLGR756q3ZOuuWkWAvd8P5e/lugcLiamYbQ9NUsugSd0RKid/rKU5t7+rWS3LNoyhTaUNrLC5V51VBLplkmGxGazVXqdRCs5Wgwdb9dmO5CyP+/sA6ZDpbnKwVsStTKZ2HyEccaaeGQMTsl7jpo720pTR9693Rk+bUrQAG41TFEYkqAxXAWw4iFuzS2A0zZUTM0RV67RD29hDALKjmkKr6vCnuoVvTVRpa8vnYvLaE24caoGBiiffqbCydJpDLPVKdjE9rTrdqipcorv8EDqHshGic+PNQzk8EMv9mIOybtnkDWo7byNIs6pk5q+CaFBM7ZYIp0Bcf/LXquTMUa3CEy5Vxl1NAO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66946007)(64756008)(66556008)(76116006)(66476007)(66446008)(38100700002)(6512007)(107886003)(31696002)(71200400001)(91956017)(5660300002)(8676002)(8936002)(6506007)(55236004)(53546011)(4326008)(122000001)(83380400001)(54906003)(2616005)(38070700005)(186003)(26005)(508600001)(86362001)(36756003)(2906002)(316002)(6486002)(6916009)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dEt6YVVGaXlkN2E2RGxyK0NwUWVRcFBnWmpDY3RIbFgxc0dYMU5VcUpCbk9h?=
 =?utf-8?B?SHIwQlFnRFZWeWZIaSsxbG1mUHpISXd2SGtDdkRBQjNHaUJaTWV6UmZvdWtJ?=
 =?utf-8?B?aEIxWHgrY1MzVFhuK25rWXdCKzNVU0FJTEIvZGd5MU5BMVh1dk1raEhsdHd4?=
 =?utf-8?B?TDZwaEpCVDVRamhJTk5OcVB1cnFSK2RqSEJJTEpnL01oTyt6NnM4dS85TFkw?=
 =?utf-8?B?c1RuRDJIWS9oTzR3TEV1eWZJYlRSME5zT0htbkJ4QkhucjA4Q1ZXZ3hkai9s?=
 =?utf-8?B?Z3dmSTJ3bzcya2xLQUV0UG5DV2I1LzgrM05tdUxEaUN4Um5zaFNVYmlqcVdN?=
 =?utf-8?B?bGlpRUlHMDVuWjN2VGJ2eEdaZjh3N3p1d3JnZ01WRHpCbmtQT09jbDFqaGlB?=
 =?utf-8?B?VVA5VTR0ZXZ5QTJRRUxaVTZPYVE5YjY2MCtNUzJ2dmQ2ZDczalV4V3FXbmUw?=
 =?utf-8?B?MW1wNXh3VmdLaTg5N2dwQjhnOXBkSmlqYXhRR0hvamR3cmgyWk9BemYwQzJu?=
 =?utf-8?B?a1p3a1lLNUI0Y1RXKzUxalZ3d2dwYWZkTUVSTTUvRW1BNVkxdVIrOEdQeGdk?=
 =?utf-8?B?dWVoSzBtVGpkSmhuRy8wSUFQRDdFbzU1bEVabDZoUi9OTis2MHNjUVhTZEZX?=
 =?utf-8?B?eEY1TUVHKzFyZHZXak9BeCt3YTFkMXc4NVlWUi9zcnZRTlE2MG00TnlNVllp?=
 =?utf-8?B?MWtZcGs2aWtRTit4dlpRcWswVExuWVNFUDdaRlAvMzVXb0NsNnl0cmIrZ3dX?=
 =?utf-8?B?N2sxSG9UQm8xVm9tQVRlM3FpUUhRdisrUGYvOHJNb3ZIeklEbGZ2M20rL1Bp?=
 =?utf-8?B?Y3hGVkhpNEFPbHZHN01qVkFYQU82a0w5V2lhWFpYOFpDYy9EMUJNMVl6VnVt?=
 =?utf-8?B?SWs5OHJWRUdaYjd0ZTdtWnpoQW5DMWdMYmJCRHpUb0c3d0E3TnljN09LTFNw?=
 =?utf-8?B?dnJWeGF5c2luczRaNmZCdGV4MEY5ZEY5UHZoTVd0WXZHSUpDZDUvQStobnlX?=
 =?utf-8?B?WXl6VnJsTGQrRkU4Y2NISVNtaGdncXF5R0RYSjZQVFFUWExmYUZJbEd3NmZF?=
 =?utf-8?B?Y1R6N0NMRitCWkZnaG9BTzJNNHNuMkpmcVlEeVZpR3cxcEZEak1qL1U2V0hW?=
 =?utf-8?B?dTZ0WE0yTzRxcm5DeFZTT2JjMTkxRm8waWdZenpUTGFsWHpCNjQ4WFluOEdu?=
 =?utf-8?B?b3huSmNBZ05LakQycEp3UmoyaGZCekpwdnpXNEU1dXoxK1JjTTVEWHN2OWFF?=
 =?utf-8?B?WW4vbVBaTXpVdzI4cWgySHBIUVFyMVVNVXpWb1NTdTNZUTJ2bFRQRFd6RHNC?=
 =?utf-8?B?QnZqa0N4QUpKS3FDY3dMM3hLZEQ0Vk9QT3Bjbi9ORkIxR0hqZUp3S0lhSWha?=
 =?utf-8?B?ZVNQS01rb2d4Nkk1TG51VW1ob0Zxd1liZkpVaHlXOUNyaHlubzZIWk8yY1Vq?=
 =?utf-8?B?OGpxSEs0RS9qVC9WZWQ5TElTL0JuTHgzcEVIRjNYRnFWSGY5VHFzc0lXMXA1?=
 =?utf-8?B?Rm9uRDFvYU1BcVVESWhlK3pJU3NSZWkwNWJCcjYyWk1qNnAxd3NZR1RsdGNs?=
 =?utf-8?B?S0poSWFYeDhDeVExNXM1eVVxVG5udHVzUHpiM2pHRGx6blZWazNYOGl3SXhT?=
 =?utf-8?B?MllIWC9JaitoS1h0V0c4MGR5R1QxeFVleGY4eHREdDdQYXE2M3YrWDAranZ0?=
 =?utf-8?B?OUNDSHQwNmhlRUdUMjUyR3M0YmZ4eTRXQlJPYmVsbE9yWlpGMjZuYURRT3pK?=
 =?utf-8?B?M3dDWEVkbnVaR0R4dVlHNG1mRy9iYmdvMVc4OWNTY2tNRWdpbEFKVkFDL3JM?=
 =?utf-8?B?ZU04bGQvTyt3Zk91NjZ4cmpVczdhcnFpT0JkOUQwd2h3YzN6ajdhcm1tdWN5?=
 =?utf-8?B?K1p3Z1liZUtUaEpKeXh5RkxoMXFxVktIYnpMd0tZejdWdG5UeEVlM2tPU05l?=
 =?utf-8?B?UDFvYXBDTDk5UnpHbEtDNnltNk5rKzZmTml5d0Z1L3NVMFpGNDViZnllTVhh?=
 =?utf-8?B?NVBXYWw5bHpFc3RWODloODUrWFhEcDd6a3hoZ21OcGdEaDRLajBzWm9PSGRo?=
 =?utf-8?B?a1doTmtpNmpyVTZ3b2VlVEVIb1A4WjVpRzlsVkpTV2gwTDZKYzUzQkZIQnBF?=
 =?utf-8?B?SzN3NTFhZG5WN0c5amxNNm1oWUlMVDVpOVZnVEtHczF1OG1qNllBWTFvQ2ZP?=
 =?utf-8?B?dmlpcEhFZDhmdDhtMFo1d0Y2Qkg4TkFOOFFtb296dWh4ZC9zTmt2U0lsYlFH?=
 =?utf-8?B?Z2pncUVpT0N3aWpYOFdFK1VSNTNCYzlmK3ZvV01EeUozc2Qva3lCbUM4OW9M?=
 =?utf-8?B?Y2ZDZnl2Y29EK0ZEamRuYlFaMjRMdjRCYWw3YUVCazBHUExjYUI5Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EC18F2831D8136489A7238D8C1589C42@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f77514-3d0c-4917-9200-08d9efc5ed0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 14:26:01.3358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h53X5gssYExUlXuCBxgg6OPOm8KdLWXrrrufT2EzkLieIdzaOgudu53YeqsXxvkOtVOsTlcqup21FdxwCPkar9fifqBmLm7t0ploXss80SqfD1tZKf5osizgOXd7YDyW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4604
X-Proofpoint-GUID: AYZxkk8Fk6jrxCbob78ESn48BnGrt57v
X-Proofpoint-ORIG-GUID: AYZxkk8Fk6jrxCbob78ESn48BnGrt57v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140088

DQoNCk9uIDE0LjAyLjIyIDE2OjE5LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDkuMDIuMjAy
MiAxNDozNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBAQCAtNDEwLDE0ICs0
MjgsMzcgQEAgc3RhdGljIHZvaWQgdnBjaV93cml0ZV9oZWxwZXIoY29uc3Qgc3RydWN0IHBjaV9k
ZXYgKnBkZXYsDQo+PiAgICAgICAgICAgICAgICByLT5wcml2YXRlKTsNCj4+ICAgfQ0KPj4gICAN
Cj4+ICtzdGF0aWMgYm9vbCB2cGNpX2hlYWRlcl93cml0ZV9sb2NrKGNvbnN0IHN0cnVjdCBwY2lf
ZGV2ICpwZGV2LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IHN0YXJ0LCB1bnNpZ25lZCBpbnQgc2l6ZSkNCj4+ICt7DQo+PiArICAgIC8qDQo+PiAr
ICAgICAqIFdyaXRpbmcgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgYW5kIFJPTSBCQVIgcmVnaXN0ZXIg
bWF5IHRyaWdnZXINCj4+ICsgICAgICogbW9kaWZ5X2JhcnMgdG8gcnVuIHdoaWNoIGluIHR1cm4g
bWF5IGFjY2VzcyBtdWx0aXBsZSBwZGV2cyB3aGlsZQ0KPj4gKyAgICAgKiBjaGVja2luZyBmb3Ig
dGhlIGV4aXN0aW5nIEJBUidzIG92ZXJsYXAuIFRoZSBvdmVybGFwcGluZyBjaGVjaywgaWYgZG9u
ZQ0KPj4gKyAgICAgKiB1bmRlciB0aGUgcmVhZCBsb2NrLCByZXF1aXJlcyB2cGNpLT5sb2NrIHRv
IGJlIGFjcXVpcmVkIG9uIGJvdGggZGV2aWNlcw0KPj4gKyAgICAgKiBiZWluZyBjb21wYXJlZCwg
d2hpY2ggbWF5IHByb2R1Y2UgYSBkZWFkbG9jay4gSXQgaXMgbm90IHBvc3NpYmxlIHRvDQo+PiAr
ICAgICAqIHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gc3VjaCBhIGNhc2UuIFNv
LCBpbiBvcmRlciB0byBwcmV2ZW50DQo+PiArICAgICAqIHRoZSBkZWFkbG9jaywgY2hlY2sgd2hp
Y2ggcmVnaXN0ZXJzIGFyZSBnb2luZyB0byBiZSB3cml0dGVuIGFuZCBhY3F1aXJlDQo+PiArICAg
ICAqIHRoZSBsb2NrIGluIHRoZSBhcHByb3ByaWF0ZSBtb2RlIGZyb20gdGhlIGJlZ2lubmluZy4N
Cj4+ICsgICAgICovDQo+PiArICAgIGlmICggIXZwY2lfb2Zmc2V0X2NtcChzdGFydCwgc2l6ZSwg
UENJX0NPTU1BTkQsIDIpICkNCj4+ICsgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKw0KPj4gKyAg
ICBpZiAoICF2cGNpX29mZnNldF9jbXAoc3RhcnQsIHNpemUsIHBkZXYtPnZwY2ktPmhlYWRlci5y
b21fcmVnLCA0KSApDQo+PiArICAgICAgICByZXR1cm4gdHJ1ZTsNCj4+ICsNCj4+ICsgICAgcmV0
dXJuIGZhbHNlOw0KPj4gK30NCj4gQSBmdW5jdGlvbiBvZiB0aGlzIG5hbWUgZ2l2ZXMgKGVzcGVj
aWFsbHkgYXQgdGhlIGNhbGwgc2l0ZShzKSkgdGhlDQo+IGltcHJlc3Npb24gb2YgYWNxdWlyaW5n
IGEgbG9jay4gQ29uc2lkZXJpbmcgdGhhdCBvZiB0aGUgcHJlZml4ZXMNCj4gbmVpdGhlciAidnBj
aSIgbm9yICJoZWFkZXIiIGFyZSByZWFsbHkgcmVsZXZhbnQgaGVyZSwgbWF5IEkgc3VnZ2VzdA0K
PiB0byB1c2UgbmVlZF93cml0ZV9sb2NrKCk/DQo+DQo+IE1heSBJIGZ1cnRoZXIgc3VnZ2VzdCB0
aGF0IHlvdSBlaXRoZXIgc3BsaXQgdGhlIGNvbW1lbnQgb3IgY29tYmluZQ0KPiB0aGUgdHdvIGlm
KCktcyAocGVyaGFwcyBldmVuIHN0cmFpZ2h0IGludG8gc2luZ2xlIHJldHVybiBzdGF0ZW1lbnQp
Pw0KPiBQZXJzb25hbGx5IEknZCBwcmVmZXIgdGhlIHNpbmdsZSByZXR1cm4gc3RhdGVtZW50IGFw
cHJvYWNoIGhlcmUgLi4uDQpUaGF0IHdhcyBhbHJlYWR5IHF1ZXN0aW9uZWQgYnkgUm9nZXIgYW5k
IG5vdyBpdCBsb29rcyBsaWtlOg0KDQpzdGF0aWMgYm9vbCBvdmVybGFwKHVuc2lnbmVkIGludCBy
MV9vZmZzZXQsIHVuc2lnbmVkIGludCByMV9zaXplLA0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCByMl9vZmZzZXQsIHVuc2lnbmVkIGludCByMl9z
aXplKQ0Kew0KIMKgwqDCoCAvKiBSZXR1cm4gdHJ1ZSBpZiB0aGVyZSBpcyBhbiBvdmVybGFwLiAq
Lw0KIMKgwqDCoCByZXR1cm4gcjFfb2Zmc2V0IDwgcjJfb2Zmc2V0ICsgcjJfc2l6ZSAmJiByMl9v
ZmZzZXQgPCByMV9vZmZzZXQgKyByMV9zaXplOw0KfQ0KDQpib29sIHZwY2lfaGVhZGVyX3dyaXRl
X2xvY2soY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBzdGFydCwgdW5z
aWduZWQgaW50IHNpemUpDQp7DQogwqDCoMKgIC8qDQogwqDCoMKgwqAgKiBXcml0aW5nIHRoZSBj
b21tYW5kIHJlZ2lzdGVyIGFuZCBST00gQkFSIHJlZ2lzdGVyIG1heSB0cmlnZ2VyDQogwqDCoMKg
wqAgKiBtb2RpZnlfYmFycyB0byBydW4gd2hpY2ggaW4gdHVybiBtYXkgYWNjZXNzIG11bHRpcGxl
IHBkZXZzIHdoaWxlDQogwqDCoMKgwqAgKiBjaGVja2luZyBmb3IgdGhlIGV4aXN0aW5nIEJBUidz
IG92ZXJsYXAuIFRoZSBvdmVybGFwcGluZyBjaGVjaywgaWYgZG9uZQ0KIMKgwqDCoMKgICogdW5k
ZXIgdGhlIHJlYWQgbG9jaywgcmVxdWlyZXMgdnBjaS0+bG9jayB0byBiZSBhY3F1aXJlZCBvbiBi
b3RoIGRldmljZXMNCiDCoMKgwqDCoCAqIGJlaW5nIGNvbXBhcmVkLCB3aGljaCBtYXkgcHJvZHVj
ZSBhIGRlYWRsb2NrLiBJdCBpcyBub3QgcG9zc2libGUgdG8NCiDCoMKgwqDCoCAqIHVwZ3JhZGUg
cmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gc3VjaCBhIGNhc2UuIFNvLCBpbiBvcmRlciB0byBw
cmV2ZW50DQogwqDCoMKgwqAgKiB0aGUgZGVhZGxvY2ssIGNoZWNrIHdoaWNoIHJlZ2lzdGVycyBh
cmUgZ29pbmcgdG8gYmUgd3JpdHRlbiBhbmQgYWNxdWlyZQ0KIMKgwqDCoMKgICogdGhlIGxvY2sg
aW4gdGhlIGFwcHJvcHJpYXRlIG1vZGUgZnJvbSB0aGUgYmVnaW5uaW5nLg0KIMKgwqDCoMKgICov
DQogwqDCoMKgIGlmICggb3ZlcmxhcChzdGFydCwgc2l6ZSwgUENJX0NPTU1BTkQsIDIpIHx8DQog
wqDCoMKgwqDCoMKgwqDCoCAocGRldi0+dnBjaS0+aGVhZGVyLnJvbV9yZWcgJiYNCiDCoMKgwqDC
oMKgwqDCoMKgwqAgb3ZlcmxhcChzdGFydCwgc2l6ZSwgcGRldi0+dnBjaS0+aGVhZGVyLnJvbV9y
ZWcsIDQpKSApDQogwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7DQoNCiDCoMKgwqAgcmV0dXJu
IGZhbHNlOw0KfQ0KDQp2cGNpX2hlYWRlcl93cml0ZV9sb2NrIG1vdmVkIHRvIGhlYWRlci5jIGFu
ZCBpcyBub3Qgc3RhdGljIGFueW1vcmUuDQpTbywgc2l0dGluZyBpbiBoZWFkZXIuYywgdGhlIG5h
bWUgc2VlbXMgdG8gYmUgYXBwcm9wcmlhdGUgbm93DQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0K
T2xla3NhbmRy

