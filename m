Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CCC8681CD
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 21:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685792.1067093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rehOp-0007N0-OL; Mon, 26 Feb 2024 20:16:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685792.1067093; Mon, 26 Feb 2024 20:16:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rehOp-0007LI-Ji; Mon, 26 Feb 2024 20:16:31 +0000
Received: by outflank-mailman (input) for mailman id 685792;
 Mon, 26 Feb 2024 20:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jmZe=KD=epam.com=prvs=8786cae52a=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rehOn-0007LB-A7
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 20:16:29 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea2d8211-d4e3-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 21:16:26 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41QGjnTo017029; Mon, 26 Feb 2024 20:16:21 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3wgq3r2ekj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 20:16:20 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM9PR03MB7012.eurprd03.prod.outlook.com (2603:10a6:20b:2d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 20:16:16 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::82af:59a5:4446:9167%4]) with mapi id 15.20.7316.034; Mon, 26 Feb 2024
 20:16:16 +0000
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
X-Inumbo-ID: ea2d8211-d4e3-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJardXiJnu5oc1atOU31Y0EEXVHIKGlTJPZJOY1vPds0iBghZkcWX6PFxOcHRIvxq6EnooUGIlehYlnS7rg8909PMhA8QrKsfQ4J6W6uXVysLfuacpQ8zV4rBntvtVgc9fkvJ0cNVz7tyHpUBfnVkkiVD1rMovYTMt06pabEd3XkevNxneyztobDYgo/+0TuWnP6TPJ+zJ2XhFxQSp4/dTPrDXGwtWCscL5ZSyv8O8p26iO2HT2jWBf0HbrVwVVP6myPNfWBgnRrerEqW3z97PAuhwwxG54jO6aMn/nDB7bbcjfFeR1z8ddUaPJsvLT3ttJ0DOqxDqDdIHRBw16j/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMiuHiAdxoalaMQOpYHkmbGCocU+YMo5+uL0+5vZYMI=;
 b=Q9SdyKJJH+c1ekahQrudJlBCc2Ws23lQFOyYuoxTsXCb7T0zd/p1TC/xxh+/iLqRfbOr0Ao0zquvY7ao1/GsU3ZKzKzJYHOTV1SPyyZMm5YAOMN0aP1qTxTz64tNEQp58QWKpkTiYMdk1kVrnHXcAzGxQ9/n/Mp/rw+zK2s3RmAexbK2eK22HvJruzAqRrbhVwg93+ItClnhNwmTk4FFgDIXYbN5sCeDFRie+zWnBak3PswFAZgUKPOdsmKK02D5QPbZbmhpzE3RFHJbl2KbHA54PKmFhpgDLP0iamNxZlTGpw2MQ9Lj9naVw3QHcxFtKeFcS1/AKy3Y+ea/wAiyOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UMiuHiAdxoalaMQOpYHkmbGCocU+YMo5+uL0+5vZYMI=;
 b=NGeiceIB4VBUep93d6J5h7vvZmEXD1q/yjfg2qDhoYalVFgmTLsMRhmzudNlIaSqZwQ3VySq/BSwrvFQsQzivfIxrr+SCtgL4qE9YYvFzOS/V9v0NTEff1VYH1Tfu9viKuUr0lehnWUYCtYj847C+ul+2r8FkhNgDtuCUvJ6FYPZag4P3N9vamfnFgIUDQFy2T8OzMKBGt4teUGiqUGNrLK4g3uGeckg7SfXkvMUTguNmEAkc+xRQnTFcnk1WgrAon/APQ9GDvviOPaXXBsNZey/hJoUBijAYisF5BjY58j9nfGZDRnOCDEka5LVit8ABvBf1zLwZg2/shrTQQYDGw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Peng Fan <peng.fan@nxp.com>
CC: Julien Grall <julien@xen.org>,
        "vikram.garhwal@amd.com"
	<vikram.garhwal@amd.com>,
        Leo Yan <leo.yan@linaro.org>, Viresh Kumar
	<viresh.kumar@linaro.org>,
        Stewart Hildebrand <stewart.hildebrand@amd.com>,
        "sgarzare@redhat.com" <sgarzare@redhat.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: Re: question about virtio-vsock on xen
Thread-Topic: question about virtio-vsock on xen
Thread-Index: AdpmUSXKZvg8Aft6RRu9smUwoggtbwAUAHAAACuPlYAARFRfYAAj+0EA
Date: Mon, 26 Feb 2024 20:16:16 +0000
Message-ID: <e391b7fc-bf6f-4c3a-b444-5b320466294c@epam.com>
References: 
 <DU0PR04MB941734DA793D87B7FF3A491488552@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <alpine.DEB.2.22.394.2402231332580.754277@ubuntu-linux-20-04-desktop>
 <ee69684a-5aad-417a-8522-1cd1b5322bbe@epam.com>
 <DU0PR04MB94175684F8B7678A7B885559885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: 
 <DU0PR04MB94175684F8B7678A7B885559885A2@DU0PR04MB9417.eurprd04.prod.outlook.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AM9PR03MB7012:EE_
x-ms-office365-filtering-correlation-id: a9308b06-fcc4-4eb2-15a2-08dc3707c989
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 X+nKJUQP5rK/GBOHDQyWT7mcZ/pO6XbwxFtZ+8PbC161/FgJ3IaDB3dT4ilul6fhwG9aBbwr4TSIPHttpWA99Dx1ACyAw2DkDrM2mIdAk+JjpAH2z+Fj68TtZrpIJP/pnoDuxVNTYOezyry1RPqd/AbR7Vrswxu4NBWeQQ27KpAM04vKjv2l7LhIJfI6Xe8qCOn5caed629AkewlELRLK3yJvysDNdi/2A1ROLXg1dl22S/rO0G4ztu1IiIfiHzu2bs2evxxd37wj/4iaSpCIklpPvd86NzuAQsbBhXyPYLBh6CHu6nzzbiMT8Gh2cDNWrkkPWPUqg0Ddw+t7pp9rgmngVJ7B9GMlNAywmu4HPx4dPeV/iLXyuM3g2xXyQoXyryTpkFUo8S6kzOsnmEK5YPxPRfIucIoiVb7GRCi9wTlLrhcSMIJ1fvcqOdvYfcCR3sA75ReuHHy2w//VQnQ9l/ekX3mFVQn0TUamhCKcZul0Wht5i6W1up8F7HNbmDtWG1tloiu9B1DxczQO3sf1Yi4/7e/tf/wev5KVr8vE//vWxeB1AexVFu/PC1vgk+p1srDk/ju61oaVZemzG+kZrNRDvNsGBQFrKEr4ZGyWMNAcq7r3tdvEi9kTRIH6xtDRt7ykvinHjJl9rfZ26LIeB4F9mXbMZ0ijaz/6msVy2GW4pIQnl4rGjSdLerS2E5rhVcGpTtimrmtN1vTEvcwGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eEkwVDNoM1RFU21MRjFjNEFBVUozNkZtcld4ZTVBRXZmMU5IY3ZEbkdGUGVT?=
 =?utf-8?B?TVhONDlSaWFkSUNFTXFpcWdCR0s4cDVSK3hPd2kyWUxaWmRuRXFuVHBQN3Bp?=
 =?utf-8?B?QmlNRUd5MSs5bFZLSUlOYU9uYVdwKzlHUm51eXNXTDZUUzRWYy9NZjhTMGtS?=
 =?utf-8?B?eXp2TnZtVEo4T2Y5ZHZjNUhGZlhqOFZtUUJrQVhmTVlwOXlnRUQvZzJFNEZt?=
 =?utf-8?B?Y0tWTExnT2FtVGpJNTdMZERKTkpMSUtLZ3pPY0hGUklqbEw4UXBhRkdtOUxH?=
 =?utf-8?B?cVNrL2xTV2gxZk9palBKWkpoVjkvL0NHOHA0bUFibjE3R0VUeW4xYUVpbm1S?=
 =?utf-8?B?QXNnUGNWZ0Q3SCt3ZVo2VUZ1cDNlTnZkYkh6eFdoZzJQOXQyenVtOFd1b0Ra?=
 =?utf-8?B?clY0WVZoNU53U3JLQ1MxdXorY0hSTS9QYkp2aVJFUGtoUVp5YmtzdzNMNDIw?=
 =?utf-8?B?RlFSVllRT3Z3VG9BcTdkL2h1d1NVczBVVmEveWpwOThFNmxsTzRrRlV4M1E2?=
 =?utf-8?B?T2pYM1RrNmFqWEx5amZwRjk0a2xVYmR2amlydzFqSHpIUUNpanFQcXhEbExH?=
 =?utf-8?B?MElqWUFHVTRNazk2VEhtWHVRV0RqblY5MENaWWEyR3JHNVEyS3lwSkE5UGNC?=
 =?utf-8?B?UXgyb01rMThUL3NKZE5CQ1VXSkJ0bk5RdWhvOVVpeDJ3UXcyaEtrYnRpU2tl?=
 =?utf-8?B?Y0JjazhYZXFxUnRBQXFReHBMS0hKbk9lWTNsaWlRVnFXUm9WRG1ncjdobXVj?=
 =?utf-8?B?NlMzM2N6L1R0ZnJlcm5NTUNnS2NsZ21lM0gzVHl0d2VhbWhjZEJOUE95NHhk?=
 =?utf-8?B?OHQ0Q29ac1hJalBwSkRDNUlwbEJxQVlaS1ZVN0tFbmFEMTMvK0pDbmtwLzYr?=
 =?utf-8?B?WlFmUlIxZ2RIYXVydkptZEFXczBoeE15ZFU4Qml1WTcwSUhUMCtPbnRPOW1l?=
 =?utf-8?B?WUpaUDRVOUNOMzBxWWlKV29SZm0yUW5LYUVjYVlzMWo2TGx1cG1YV1lvbXF3?=
 =?utf-8?B?cDBvL2VCZGZFek9YMGZoejBCUlU0UE9oS2lpV012WXVuMjVBamhKRGd0TGZj?=
 =?utf-8?B?dVVCZ3JmTFdsOU90RzdQbHdTNko0MytkSGcxTHRSd0ZDVFdONnRuWGhBRlFJ?=
 =?utf-8?B?ZmtMaklTQmZ6U1J0Ykh2WkpCMEtuK1M5a1d3V3lCQVc0YkZQWUdHakFBeDNE?=
 =?utf-8?B?Wk42RGY4WkNUY1JKcDZiT3RHYk9zcFlTZW5HY3hDczM4SHFqOEE5bmhYTWhl?=
 =?utf-8?B?RmMzT3d2L011Yks4SUN1dnNGcnE4Mk10NXhPaThmS01YL1FSRFVRUzhhYm1P?=
 =?utf-8?B?Y0IveFE4MkZMcnFPcENtUFB0Y1crb3l1KzdvR1Eyb1hXOWI3OEZENkxYZWg0?=
 =?utf-8?B?WHZsY0w4bEUzV25JcktpaGxMbXZEQlhYVSszamdQZTZwYzk3RE1oSUR2TVZs?=
 =?utf-8?B?RzUvOEVpZncveGpBN0o0R3dwNEV4VEZvUzhGbnNhdGZjY010bjM4TDh5aDFw?=
 =?utf-8?B?U0JQUkwxWG5DeXJRWTh2THI2dks3b0xWWXZMOEdHcEd6SHJQSVlaUFRKS2tk?=
 =?utf-8?B?eEVhVElsQmNPQ3hBR292T1dQLzVLK2dqYTVEa1htSitCVmYrbjRxMGRKRHVY?=
 =?utf-8?B?THpQZk1FWUJ6bWlsY0sxaldvT2Zlalg4UE11V25IWEp2WThZSDV1SEpyZnBY?=
 =?utf-8?B?d2JzV2pTSGE2NHhDR2NLQlpibXhCdGJpaHVrbGVvVEN5b1hBWHh2cEVnQmhv?=
 =?utf-8?B?M1hkeC9EU1ZhNEpRT0hxQUI0SzlTeUdjdzNHYlFmRDU0WmI1RmR3MjBDQ2ZH?=
 =?utf-8?B?c1lrVngxSWlmbmx3STNxcWQwaFBhT2cvS3h5OUxuWE5YaVBIQzVGa3NSMkNY?=
 =?utf-8?B?QlZwdVZEOFVlOWxXamRPY21DckI4NzhqQk1Jc3ZsYnl6M3lsaVBEdStjUS9q?=
 =?utf-8?B?dUFINnVFVkQ0Wm5lNlJjOU10Y0xCcFM2U0tCMzZZNE1kc1FYNFdwbnFWK1VT?=
 =?utf-8?B?OVZNMVlCNDgwa3RtM3dpMWErV0Mzb1h5bnp3NGhxcEIvKzFsdERXMS9SQS9F?=
 =?utf-8?B?WjZFbmR2K0ZhR2dpdmtOWkR0cXM5QjZnMCswcFBwV01sWE81SXVNN3RKaWRx?=
 =?utf-8?B?bE5jd1l0YTZFNDI3bjNGWm0vaXFMdnY5S0kyRDZGSDBjREJnKzRVOTNCbEVC?=
 =?utf-8?Q?kb3rT+mnF2TX/t9zFzWoBoM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42A4B907A6A6B842BEC9107627589EFA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9308b06-fcc4-4eb2-15a2-08dc3707c989
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Feb 2024 20:16:16.5046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AqGVEsvIryxCkectFi1h2eGepB0RvpwDLzxMykB1hYX5bLRNCjgwemaelccAG+o/Jf+lKnmmA5b/mSjSZHKXy/SfOcN339iFHEmrOXOrxwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7012
X-Proofpoint-GUID: urlTz-QlCRM3X0TNka4jqFp0Pg3JWxpK
X-Proofpoint-ORIG-GUID: urlTz-QlCRM3X0TNka4jqFp0Pg3JWxpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-26_11,2024-02-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=934
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260154

DQoNCk9uIDI2LjAyLjI0IDA1OjA5LCBQZW5nIEZhbiB3cm90ZToNCj4gSGkgT2xla3NhbmRyLA0K
DQpIZWxsbyBQZW5nDQoNCg0KW3NuaXBdDQoNCj4+DQo+PiAgICAgLi4uIFBlbmcsIHdlIGhhdmUg
dmhvc3QtdnNvY2sgKGFuZCB2aG9zdC1uZXQpIFhlbiBQb0MuIEFsdGhvdWdoIGl0IGlzIG5vbi0N
Cj4+IHVwc3RyZWFtYWJsZSBpbiBpdHMgY3VycmVudCBzaGFwZSAoYmFzZWQgb24gb2xkIExpbnV4
IHZlcnNpb24sIHJlcXVpcmVzIHNvbWUNCj4+IHJld29yayBhbmQgcHJvcGVyIGludGVncmF0aW9u
LCBtb3N0IGxpa2VseSByZXF1aXJlcyBpbnZvbHZpbmcgUWVtdSBhbmQNCj4+IHByb3RvY29sIGNo
YW5nZXMgdG8gcGFzcyBhbiBhZGRpdGlvbmFsIGluZm8gdG8gdmhvc3QpLCBpdCB3b3JrcyB3aXRo
IExpbnV4DQo+PiB2NS4xMCArIHBhdGNoZWQgUWVtdSB2Ny4wLCBzbyB5b3UgY2FuIHJlZmVyIHRv
IHRoZSBZb2N0byBtZXRhIGxheWVyIHdoaWNoDQo+PiBjb250YWlucyBrZXJuZWwgcGF0Y2hlcyBm
b3IgdGhlIGRldGFpbHMgWzFdLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcG9pbnRlciwgSSBhbSBy
ZWFkaW5nIHRoZSBjb2RlLg0KPiANCj4+DQo+PiBJbiBhIG51dHNoZWxsLCBiZWZvcmUgYWNjZXNz
aW5nIHRoZSBndWVzdCBkYXRhIHRoZSBob3N0IG1vZHVsZSBuZWVkcyB0byBtYXANCj4+IGRlc2Ny
aXB0b3JzIGluIHZpcnRpbyByaW5ncyB3aGljaCBjb250YWluIGVpdGhlciBndWVzdCBncmFudCBi
YXNlZCBETUENCj4+IGFkZHJlc3NlcyAoYnkgdXNpbmcgWGVuIGdyYW50IG1hcHBpbmdzKSBvciBn
dWVzdCBwc2V1ZG8tcGh5c2ljYWwgYWRkcmVzc2VzDQo+PiAoYnkgdXNpbmcgWGVuIGZvcmVpZ24g
bWFwcGluZ3MpLiBBZnRlciBhY2Nlc3NpbmcgdGhlIGd1ZXN0IGRhdGEgdGhlIGhvc3QNCj4+IG1v
ZHVsZSBuZWVkcyB0byB1bm1hcCB0aGVtLg0KPiANCj4gT2ssIEkgdGhvdWdodCAgdGhlIGN1cnJl
bnQgeGVuIHZpcnRpbyBjb2RlIGFscmVhZHkgbWFwIGV2ZXJ5IHJlYWR5Lg0KPiANCg0KSXQgZG9l
cywgYXMgeW91IHNhaWQgdGhlIHZpcnRpby1ibGstcGNpIHdvcmtlZCBpbiB5b3VyIGVudmlyb25t
ZW50LiBCdXQgDQp2aG9zdCgtdnNvY2spIGlzIGEgc3BlY2lhbCBjYXNlLCB1bmxpa2UgZm9yIHZp
cnRpby1ibGstcGNpIHdoZXJlIHRoZSANCndob2xlIGJhY2tlbmQgcmVzaWRlcyBpbiBRZW11LCBo
ZXJlIHdlIGhhdmUgYSBzcGxpdCBtb2RlbC4gQXMgSSANCnVuZGVyc3RhbmQgdGhlIFFlbXUgcGVy
Zm9ybXMgb25seSBpbml0aWFsIHNldHVwL2NvbmZpZ3VyYXRpb24gdGhlbiANCm9mZmxvYWRzIHRo
ZSBJL08gcHJvY2Vzc2luZyB0byBhIHNlcGFyYXRlIGVudGl0eSB3aGljaCBpcyB0aGUgTGludXgg
DQptb2R1bGUgaW4gdGhhdCBwYXJ0aWN1bGFyIGNhc2Uu

