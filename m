Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDF0391F41
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 20:37:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132691.247415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyOl-00066B-Bj; Wed, 26 May 2021 18:36:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132691.247415; Wed, 26 May 2021 18:36:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llyOl-00063s-79; Wed, 26 May 2021 18:36:55 +0000
Received: by outflank-mailman (input) for mailman id 132691;
 Wed, 26 May 2021 18:36:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8HVS=KV=epam.com=prvs=578065f5e4=sergiy_kibrik@srs-us1.protection.inumbo.net>)
 id 1llyOj-00063j-IH
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 18:36:53 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 229035c7-9a1e-4482-b199-b7d3406db46b;
 Wed, 26 May 2021 18:36:52 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14QIUQT6032086; Wed, 26 May 2021 18:36:50 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2059.outbound.protection.outlook.com [104.47.0.59])
 by mx0b-0039f301.pphosted.com with ESMTP id 38sqgxh4bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 18:36:50 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8)
 by AM0PR03MB3761.eurprd03.prod.outlook.com (2603:10a6:208:45::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Wed, 26 May
 2021 18:36:47 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135]) by AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 18:36:47 +0000
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
X-Inumbo-ID: 229035c7-9a1e-4482-b199-b7d3406db46b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dx9++DZa268rFEuNJMxOnsU/Jhq6muEcAnhauupCpz78gErxhZNLNtxmAIsmU37vP92Q+OKvDZnJQ0iq1yYcJuisiUiARieHDNkCNHx0n6TmTtPcJ1pNlskLP0CeLUaFO4Qb1Oih4SuiijjxKGtbySHUOmbui/dK6IeYtsSEM7llBACIrPhZ4Ou/pWE2Wsgpjd8eDGVry8sTpUT44ZyWrIJT8nWYDaEMNr7Zq4lyoVISyr6CcjS2+QXA3TVb2h+ExFjFZc/w7ZzWSWfo7qNxJwvq3UK46V20woD5/ykskFhUS86aK2z8m6UcHvB8+qT/gAZWtnEG7xGxH5FhjVGtfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZBXk8OvgpaKHkCnTUQDjLbAC5s1kAFtzw2yZftH5k4=;
 b=RkaWTG86X4zgQdWiP3t71lLAv8HlCGt1WuDNcFLaHmAcv+IguCPzc0VIpHtvY5FJ501hdJXt5qtFM43+9CSiFnDdiF3TRgI1iaWmNtKogoUiCzYwz7ywlldLmEETSB2kfG3Bz54z/GxEUmpy64ra/GqeTx2VyrLLUnPq73MRYSbPgQGqGzQGSYqHRA3sUAWzea/0kEBuDepwuuSZpH8F4eA4L1NAchoSBn9a1gFy7cGGyn7RtngxDKyYcYzTelTYpysmWzskpcsxdtztgfGAv/RGKThaJlfTgQbbYgT/pLX2Om804MTP94637P1RonbjKLm8sLOtX9UtCy/WrucTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oZBXk8OvgpaKHkCnTUQDjLbAC5s1kAFtzw2yZftH5k4=;
 b=sQsMLIaXhpjdXM9sPqOVbKn0KEkgVmtof/cCxg5GZdJAPhGxuaEljdjFOVcxSgrQSPX7PQeHo92bYDmjHHol9pUJ451REM43nohnhYjGaK7CUwu3TiAM0UfFPA1No1zUFn1drK8yCTmGwTaDwFNi9iq5ZC1ucoIn9q4oytX0cU+Ufw+pdN2/gwW6Zq0nw+DLMEz8WjTYGsWBZvHwDa2koF+hLqB8ffA+9KGBTlCI95s9frjodtnZgnCBcVPv7GVdgv5ltH+tz7B+qI+Sh1FoZjVtnuxigN2Lut5wt0veqx8Q5cujfajo6TBaXAYq0pGVhT46yHguZAzT7I6JfPFlHA==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v1] libxl/arm: provide guests with random seed
Thread-Topic: [XEN PATCH v1] libxl/arm: provide guests with random seed
Thread-Index: AQHXUJ0pDoWarWZCUEmrgeaODNENvKr1enfAgAB5+ACAACY8wA==
Date: Wed, 26 May 2021 18:36:47 +0000
Message-ID: 
 <AM9PR03MB6836B2CC4729BE5694311918F0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
References: <20210524080057.1773-1-Sergiy_Kibrik@epam.com>
 <a3c51dea-80e5-df92-3757-72809ad96434@xen.org>
 <AM9PR03MB6836B02970F4F1CAEEAEAD78F0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
 <d85d9c25-aff7-43ff-6ae5-04ab394dcd0d@xen.org>
In-Reply-To: <d85d9c25-aff7-43ff-6ae5-04ab394dcd0d@xen.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [95.67.114.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e73e630-c08e-4b27-5c2e-08d92075383f
x-ms-traffictypediagnostic: AM0PR03MB3761:
x-microsoft-antispam-prvs: 
 <AM0PR03MB376189927D338E2B8358AF38F0249@AM0PR03MB3761.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kxRADPKfYGNpfI8GVvQK3Z3O/qOYE+IUQA+Z20oaA68hwmxTa1HBLY1qBfPQckKXj8gteLc4f4kr7lSAyI5bTR4cyfjnZkgIxaTWx9qUVhatanHcbvWUVRWrNzlCOb5B5SKqngkdDso9jR5T4Ml5HWdjHRku0mS2NKVAFMCws3t/dQjSrdlUeoH5qkPBfp8JpHv/5Kveu6ZK7FNO3jpDGOhudMRAKkMtSXgy3SS+4HQ3jUmgz6Z0vEEKi2XdZBiPjgX3bgYeuTarhs8HK2BUTheKhB6ggfT4LRsYt6H34Kq4I8LENZd75Ok6TWCUgtNab8uCDJhFTyzMPZnCwDJL8U5UHMXF57isXQ67M8EkefXGQsdVJPgacfrV+8TN0VVoklirU5tS+0dWUZo8vBpe9vYtLWXTOl00Yts5hDFbwaBG0G5Kzclv3udAhk7kx8gTwHEeFL5mrOd7+spjgOCVexZW1Gyj6nGLkErU/QtBvrLT3tava6gapm8ay9/4I9C32AM6rVWsx+yNTl7bvzeJfK92h5xOIBdRj+if7gsDjaM+40+Tp1Y0zKGbRvBDW7pA2Rj16pcyhEXQ4svNGhkRL210ZPtkORhjcXjmJHJ5rJo=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6836.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(346002)(39840400004)(366004)(66476007)(6506007)(26005)(83380400001)(66946007)(66556008)(316002)(71200400001)(76116006)(33656002)(478600001)(55016002)(64756008)(66446008)(52536014)(110136005)(54906003)(2906002)(9686003)(7696005)(5660300002)(38100700002)(558084003)(122000001)(8936002)(4326008)(86362001)(186003)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?L3ZGM2VvOEx4eGZ3NzFiNXlFU2ZJMlJTRkRLRmlobExORjZFTFZQaFNaTFZQ?=
 =?utf-8?B?cEdsclYvdHN3V2l5UjB1eStwWERCNGZEQWluY2s3aWxkSWVyN1JGY1l3YkNR?=
 =?utf-8?B?VFV0K2txR0RkNWhBTVV0TXd0L3ExaXlFZFdqSnhnTVVNZExVV1VIbEQ5SlVI?=
 =?utf-8?B?MDhqanJwT0V2VkY3WlNHKys3Wk14dUpGTzlRbUh6M0RnZXBsRGVWS0pOSERs?=
 =?utf-8?B?RGF2SWgrTTh1cTBaOWxJSFpzVFk3bFlhZ0d6NXNIWWxBdWtUZ25yT0kyZUdO?=
 =?utf-8?B?bHBLQmhDOG9XRDBLbVJPQjBRak5OODZsTzV2OTNxQzFtY2JjRXdzZitLSkFv?=
 =?utf-8?B?Vm1lbDRhSHNTRlpaRTgzZElNZkJOaktsTHB1ZVB6SWNoU0dZV3RvZit0amJI?=
 =?utf-8?B?dGFtZjhwRGxVd0EwNU0rTmExMGhpZHdqdkZWRFJBTXYwckpXdDlWRTJ1MEtH?=
 =?utf-8?B?RENkVlVmK3dNblFkc3dzalBmN1ZJRUVkL0xzN1FZYUtyQWFDang3Q1lRQklR?=
 =?utf-8?B?NHhRbW13RyttZ2JyRUp2a0VFSGpPaVZEdTczeFRYdmExL2pqRXFPd0hRLzZS?=
 =?utf-8?B?TE5uRi9wVXVrSDRIN3pGKzJVQ3VQcS9yL05neWdxTW1aNkJFcUtmeEkwelBa?=
 =?utf-8?B?RG9ISTNPaENaUHB3Slo5TjdITm5Ra0d5SzZUYUVMTW9Mck50b2VmV3JoZC9K?=
 =?utf-8?B?TCs0VEJHS2llZHlNbW5hTXNiU2sxMHRwVEc3MVhYc1pRSkRyU3BUYkluYWpQ?=
 =?utf-8?B?UHh2R1JoekcwREhMc1MxcERueUVRWllLLzlJeUZua2R1aTNqZG9vSFFSY3Vu?=
 =?utf-8?B?S09BczhaajdHRG5RRWd6aDRuNWh6dWlxVVA0ZU5RK24xQmJuZysvblBZbXhZ?=
 =?utf-8?B?dTBFdGFYczMrTUxZS0t4WGZjY21JTHl0dHhaMXczL2QvOHFEWUZhcytnalpz?=
 =?utf-8?B?c0ozcmhJb0dEWWJ3czh5NlNrZDhEb0dJZ1d2anJBRGNtL2IrZDQzNmRXWWJp?=
 =?utf-8?B?RFl0ZHA0bnZIMGdsTloweWdmTG5IaUgxVGVPeDk2NnJLRDIyWFFvMm11TmdS?=
 =?utf-8?B?Y2h5VnRmbTlLUCtVWjI2VzB4eW9lak9wNVVuaTNPeExWQk1IY2tBL2x5Uyt3?=
 =?utf-8?B?VTB0STQyNTBIdktzbTl5S1dYQWNqUGhmcWd0RnorOGF0dWFiazJHUkZLdUhD?=
 =?utf-8?B?TDFpdjJNSkMrU3N6NW5KK2xCQVBmL3YxTVlGd1RTSVMyTnZTVko3U2I2S3hs?=
 =?utf-8?B?YmUrYmJZa0hnRUtQM3o0WXJJbHdqOXpHKytUcW5zYmdRSFVVQlp2cmZxWVdR?=
 =?utf-8?B?VC9wTmtFM2xFdFhrNG5CWjVzT2lrWUgvOS9xRDRzeGZrdVFlYkxwVTlQdnRL?=
 =?utf-8?B?Q0pFUWZwTGZvNGdpYk1VbHRHRWV6aFR3S0JkZWRsWGc0bVBBNitSS0VYT24z?=
 =?utf-8?B?U1N3eTdMb2FBTm9kWUp5dnltOWZTSVYxNXEyRlRyZVEwVGxkWFM5UFlJZjRR?=
 =?utf-8?B?UDU5Y2ppWTAyY1BhTWJ5R0tsWTY3ZWlqTjdtTU8xS0doUG1pT1FNR0gvZnhk?=
 =?utf-8?B?SzkvV05OQmlhcWdObU5IZVhrOUZJSlRjUCs3UkRlZHBVSFR5czdsVkNKN1FH?=
 =?utf-8?B?U1laSnZCVEFUUytWOFpMeGpVOTVqYjRKcHB1UG5YUFJmNnNZQnFzeDAyUW9U?=
 =?utf-8?B?Y1lEMGl2NFpXMXdkMVJzeU0rY0s3WUZvYVZZZzRWNFVTa2p6UzVDMWhWYVh6?=
 =?utf-8?Q?9Wa6j/JJJFVV+lU8iu9RnkwdTOUgJdZuPDUFxwt?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6836.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e73e630-c08e-4b27-5c2e-08d92075383f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 18:36:47.5828
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: km11elCz4zj2MulwnquUw9npJ3Z1FvqCqck72bcDRy5pT0/kbWM9Kog5pOKzjigi4Xwm4cCW00WrNTQ4UO19Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3761
X-Proofpoint-GUID: owOXevxruiuaSCjtx-t8QfgF1zpj7ZMk
X-Proofpoint-ORIG-GUID: owOXevxruiuaSCjtx-t8QfgF1zpj7ZMk
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=867
 impostorscore=0 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105260125

ID4gT2suIENhbiB0aGUgcmVhc29uaW5nIGJlIGRvY3VtZW50ZWQgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlICh3aXRoIGEgc2hvcnQNCj4gc3VtbWFyeSBpbiB0aGUgY29kZSk/IFRoaXMgd291bGQgYmUg
aGVscGZ1bCBpZiBpbiB0aGUgZnV0dXJlIG9uZSBkZWNpZGUgdG8NCj4gY2hhbmdlIHRoZSBzaXpl
IG9mIHRoZSBzZWVkLg0KPiANCg0KU3VyZSwgSSdsbCBkbyB0aGF0Lg0KDQogICAtU2VyZ2l5DQo=

