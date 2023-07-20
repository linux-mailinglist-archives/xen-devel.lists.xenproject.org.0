Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DA75A374
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566253.884830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb0-0001L7-OI; Thu, 20 Jul 2023 00:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566253.884830; Thu, 20 Jul 2023 00:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb0-0001JP-LW; Thu, 20 Jul 2023 00:32:42 +0000
Received: by outflank-mailman (input) for mailman id 566253;
 Thu, 20 Jul 2023 00:32:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHay-0001JI-MS
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:40 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed4632e2-2694-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 02:32:38 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiB4017190
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:37 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <xen-devel@lists.xenproject.org>; Thu, 20 Jul 2023 00:32:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:30 +0000
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
X-Inumbo-ID: ed4632e2-2694-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fbF0bKnUtZ9ymR4HbSCROfRaaceHqpUNQBH26ssCKQDdJXaQ2tdz4BCa5cvjXfM+2CXyKx5X3M0ZraS5S2oDx+b085zBUffS9YMef3DZocfgryG9Y12hW20xhfnoKTK42HkUCosQ7zFUV5R5gW6VkB/B/74dee2pwziiVl6eKa/LoCXdnsOtrsEMnh61BlCpGhFStB/yPwSqCLbgeKPyVuBJfkDJA1KhzDV0WfbrMtgx0FF4z9lBEdVHekZOky2dN5cdPFtDZlwNMcmEQkGhcKWLAzG6WN9FXLwqczOJIiw5nQsOqNePn7htz6GJoBAsd8Co6fJ2kkBPj5javY1ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JeowWcWPtPbWi0eZ5zqE5dIolWtWXr+/pLHrvWgkYIw=;
 b=EzPRdT+/Lh86sZc6Eq2rPy90VHag5ZaZm2CTy2jcQ5KGL4eXtRdcKge/fjv8qydsBLcQ4vLG7AC8F4ZN58v+B8jva+6dTpJ06coJeQrn9EAi7g7i0JWdt9l5uZ5k9WeLFWex/MFfJgRjXZKF70ACcFCro5HFRY11wWIjOeh21JJhgdxgR2Aw/aBGHI3s+MVZA/0LAJW4S7i8Sccq991JY48V2C8LCj58M+2IsJcPPc4EkXRvboOd6vTk5pf8F+5QBVMu1gGyjjgMdATiviWXaAsfiLnGG1eSjRQM/sQcvBzkf0GbS8iS9JEtC7g+/M/5Q6J2R58A/QFjdGXGAz1Mkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JeowWcWPtPbWi0eZ5zqE5dIolWtWXr+/pLHrvWgkYIw=;
 b=Ms3+PTMXxzhiQ/YLHmQS9srZJWqfcr7ksM0HqUTk/6gulYAN7WipaptW414VCQXyyTVAyPIQwgDK/S0IUutNtLLTOXo+NVIQ4dMA0sh2Kt7AjyS7z+SHRMO3dpIRozhKv+zmhTqq8D975MwzT44a36cqphgm4m2qbr7ao6nX0oGcPlAyJCTgiOSoTtD7tYo1+QnSpKUCW7vyMqMtrO6gZrcHKDViKqnANvCwH8LZzpiPVj8uTVlzICCMfgQ3YITVRL4+7Aj++d1wBAFkwpK6nfW+iVEg0DE7e5x9hrTPHPCrhXIu+D53LJM9EE7zefXsVvqc3IBG2fJy0Igd7++A0w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v8 00/13] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v8 00/13] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZuqGqn2EU3dWVak6ca3YhrfMkhg==
Date: Thu, 20 Jul 2023 00:32:30 +0000
Message-ID: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 321a223e-27e2-4bf1-f2db-08db88b8cd7f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 43cJlLMRYqHQR/vpUCi5bRyjhiJgd8a6GBG7gCxq+dCimBww/k91Ufjdbtk0YK7SpttfdwO/il0ESazyVhhXBoqafqa4/EowJG6ppWxO/25tHst30F3A36tWZKP+WPex4dVEym9zaKYcN2uSeFMNLg2Qnv3wo1LQnOa8QwLJ2B9PsxqR1YrGO/4k4J4oRE/WRtTYOQEWEBMABRnJfn5DLM1Lvk5yWIbsFfTg9Ke1ZHTHTISSiyY52rYsrBRz9FXLKTD+54PloHLwva0h05+nuuYVOMTOi+cI7xGwReWkaqlcvIy7ElCt5PM2JU/MO2bIbDS1p8BteLvsA2uerVd2Q2mgtYb4iJy6c7oDnXIdQiV4FzaP2jokPusuxCP1QGhzcgqQJ3TlN+Ur2Wyf/duuMPUGQTU8Aa9FWhTkM79C9ySAi64WkkL+C2jtf5yphceXlEWSytkDUFvX1+pWOo7hg31BiXQuXOqW02tgSo9iVZKQ6Ix+UBvaZD3Jc0gpNhnYKC8haSkUXpAaMxyK7ht3mYaD6pEKt10nEnHmlXjJ4R0v/oMLJjIH4QEq08Q4lIhiQO28vI98WyvpCqtJA6iiOPTJFOOBXpR04ZvBxIpm+ZSQcc+iXcdjjViNmGPxrJv2
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(107886003)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?aytWMGYveDdVWjRpZFpzVllnNGJXR2d2emhYdnBYY0twdzlPa2JOVFQ2VTdD?=
 =?utf-8?B?VmtRbEQvUE56akxQU2NuVFVXbUpZY0k1YzBSeFd0RDNkbjJSYVZHd2JRRldX?=
 =?utf-8?B?eHl2d0dzRGxQaVI2aU5RQTNMNDNJWUxoSGovZXZZbngyQ3FXVlFJWjNhVDlP?=
 =?utf-8?B?NzJWeGlKUC9XUklKbGJ5cVZlTUVweitHNXh5MFozS1dpb2Nnc1FtRlo3Y0xv?=
 =?utf-8?B?WE9mckdHVldlaThiQUhlYy9Nb2dXQjMraVQ5dTZ0VWJPKysvK3gySEJrR2tz?=
 =?utf-8?B?eC9hMFBUSGhudHRqelkwNjB2ZVRSaTBGWXkvVWh6bjJNMFNTMnpHUFZ1UzhM?=
 =?utf-8?B?SUFnT1NVbmQ5d1c5bUdLc2lSQWtzUTkrRHNjY3JSQ2VuaGl2UlJDK2RsNnVQ?=
 =?utf-8?B?WUhsaDBNZTNYZ1BXVmZRWlk0emZYMW96VU1jTWhjMlJET0E0V1dPVE9WTVh6?=
 =?utf-8?B?VFZFblZSQ2lPVHdMSzBlZ0pPM0wrSFg1RnFQYWRIbFl4YkRWTjJBeU9pemZq?=
 =?utf-8?B?RTJ1WUJBU2NjbkMyNjZ6MmYrWjU4emhRUERLYkJjTEV3RmpPWHUwWGI1N3Jk?=
 =?utf-8?B?QTdQR1dxUzc5a0oxdHJxK25HZ3ZBM0d3b28xUHFVY2VsSVF6endlYmprak14?=
 =?utf-8?B?Y3oyNWRrTUF2cjM2K3FWYmo1NFZ5S3N2NUJ1MUVyQmZnZ0hwMGJ6ZW91RHov?=
 =?utf-8?B?ZFIrMEJIUmlkQ0FLNzBFWm91bmpnNUkzNzRkMEdCOWt4VC9Bb2JJVXAyby9K?=
 =?utf-8?B?QWxTa3RsY2RyVFdYUkxUaHh4NkdaVjdraFFieXNnZlJjbUZrUFVtZ3pTWk52?=
 =?utf-8?B?YjRTbjlsTEZ3VEJSWlhrQlpESjBhU2VoYTVXVFYyelkzWWtHTFljVE9UOGNn?=
 =?utf-8?B?TDRVZFUyWnN2R2lRbi9yYXlHVjhkNFk1NjNDY2kxRkNGMk5uSVZ2R0VOb3dq?=
 =?utf-8?B?WEFiQXJBMHRhamY1dlpCZ3cyV0xjT1N2a2VVR0IrZzkwS0JoSlMyU25Wdm9H?=
 =?utf-8?B?RWJlSm9peU95TVpQMHNCMldPTjRTb25xK254TW5zNEtDQTRJbXFkRTZnc2tp?=
 =?utf-8?B?UHkrRTg0Njg1YVRjZGcyNEhIeUk4ME5IRXNGcmJEeTh3bndOdmthRmx2VFBj?=
 =?utf-8?B?UU8zdUNzUGFnNjY3UllRRDA5WXBCakswKzhMelVzdkF0WWFyQkNoaVRnTVJX?=
 =?utf-8?B?RVg3RnY4cWVhZkNZUUc2MnF0OTJZL2ZJT20rTEVHVzlEKzBRdXlKcmdCTnpF?=
 =?utf-8?B?dlRiUU9teVFsNXVKWVpMc1BPaDg5Mml2RE9YblJjV21UK3NyTnB6eEcySG5V?=
 =?utf-8?B?ZXlwQ3ppMjdhMzlicDR5MUZmNjVBV1lpNjVWak9WR3dVT0twNFdCUzF6TldJ?=
 =?utf-8?B?bHFoMkh3YlNTU3B5dnJiNUxhQ0xkUlh1MmdydlNPYnJIekZ3QXBESkwxbktF?=
 =?utf-8?B?K0NaRlgvL0NzZzZaQTR5V1UxUXlIMWtqZlJzYVBYSmRFL3VsK0R2T2pKOUxF?=
 =?utf-8?B?R2ZJZmQwbVl3Zm81VVI4MmlsODNFV3VOZ0dibnQzM0FKdmcyYk91TWY5ckxZ?=
 =?utf-8?B?aHVObDh2TVpzWkUxSkxPL2Y5VEZWQVNQOEV0UWZreXM0ZTdybHVRVDE1Wmp4?=
 =?utf-8?B?U1o1YlJHeUpNUGk3MURmOEJUZnJpQW4ra3lybTJEZ2J3VlNqZFFCLzBEbGRV?=
 =?utf-8?B?SjVVS1U4djllb0lCQUhvVGtpMWV2YUFpVllzYmJHejlyN01aaE9HSVlZcC9G?=
 =?utf-8?B?RjRHcThnNE5oRWtpRnltS05mVUlWY0lHajNlSExPQm1WUHZMNW5HclljRXB5?=
 =?utf-8?B?RFBIU0Z0RjJSNnY2OVA3S1A1THhmTWJqTEVRWDM2c0ZJYTlBTTN4VnF5cFhZ?=
 =?utf-8?B?NDZXVE02WjJkbk1HNExSSlE0aGIyYmdmL3F0cFI2Y1NmL0kvY3pGWmJ3WUoy?=
 =?utf-8?B?eUYyb3h5TCswWDZvbmNSMG8xYXAxV1RTd0swQWNEM0l0NG0wc1lzL2pVU1JB?=
 =?utf-8?B?ZHNzZ0R6eUxHOWFVM1Z3eVluRk1LdnRHeEdRc2JweW1GR0ZSM0hTNmJxZVRJ?=
 =?utf-8?B?SHgzWDZyTG4zeEJ0NGxtcWJhMzY5aCtoV3djd1U4SmV3UUlHL2dLVU1NdVBM?=
 =?utf-8?B?L0F6dUFvZTZqMm5uQWk5SGVQcURZMFRlVURhME9UbDBEb0dqbkdydWs1dWtB?=
 =?utf-8?B?RGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <50EB4D64EAA452418832C6EE22A4DF46@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 321a223e-27e2-4bf1-f2db-08db88b8cd7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:30.5997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FrdkSzRQzh6L9oB1hJZivGbsRzSzmSgnVS6JZ//0Iqw3xO1k2ehiDACqUNCGBrcsHBDy3IaBsji9rU8ZrVNX3lJJx8MZ4oLy3PCKoGuOxLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: IPVgSiLDSK0xNEr2y08kqCCSqaArlJCI
X-Proofpoint-GUID: IPVgSiLDSK0xNEr2y08kqCCSqaArlJCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=726 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

SGVsbG8sDQoNClRoaXMgaXMgbmV4dCB2ZXJzaW9uIG9mIHZQQ0kgcmV3b3JrLiBBaW0gb2YgdGhp
cyBzZXJpZXMgaXMgdG8gcHJlcGFyZQ0KZ3JvdW5kIGZvciBpbnRyb2R1Y2luZyBQQ0kgc3VwcG9y
dCBvbiBBUk0gcGxhdGZvcm0uDQoNClRoZSBiaWdnZXN0IGNoYW5nZSBmcm9tIHByZXZpb3VzLCBt
aXN0YWtlbmx5IG5hbWVkLCB2NyBzZXJpZXMgaXMgaG93DQpsb2NraW5nIGlzIGltcGxlbWVudGVk
LiBJbnN0ZWFkIG9mIGQtPnZwY2lfcndsb2NrIHdlIGludHJvZHVjZQ0KZC0+cGNpX2xvY2sgd2hp
Y2ggaGFzIGJyb2FkZXIgc2NvcGUsIGFzIGl0IHByb3RlY3RzIG5vdCBvbmx5IGRvbWFpbidzDQp2
cGNpIHN0YXRlLCBidXQgZG9tYWluJ3MgbGlzdCBvZiBQQ0kgZGV2aWNlcyBhcyB3ZWxsLg0KDQpB
cyB3ZSBkaXNjdXNzZWQgaW4gSVJDIHdpdGggUm9nZXIsIGl0IGlzIG5vdCBmZWFzaWJsZSB0byBy
ZXdvcmsgYWxsDQp0aGUgZXhpc3RpbmcgY29kZSB0byB1c2UgdGhlIG5ldyBsb2NrIHJpZ2h0IGF3
YXkuIEl0IHdhcyBhZ3JlZWQgdGhhdA0KYW55IHdyaXRlIGFjY2VzcyB0byBkLT5wZGV2X2xpc3Qg
d2lsbCBiZSBwcm90ZWN0ZWQgYnkgKipib3RoKioNCmQtPnBjaV9sb2NrIGluIHdyaXRlIG1vZGUg
YW5kIHBjaWRldnNfbG9jaygpLiBSZWFkIGFjY2VzcyBvbiBvdGhlcg0KaGFuZCBzaG91bGQgYmUg
cHJvdGVjdGVkIGJ5IGVpdGhlciBkLT5wY2lfbG9jayBpbiByZWFkIG1vZGUgb3INCnBjaWRldnNf
bG9jaygpLiBJdCBpcyBleHBlY3RlZCB0aGF0IGV4aXN0aW5nIGNvZGUgd2lsbCB1c2UNCnBjaWRl
dnNfbG9jaygpIGFuZCBuZXcgdXNlcnMgd2lsbCB1c2UgbmV3IHJ3IGxvY2suIE9mIGNvdXJzZSwg
dGhpcw0KZG9lcyBub3QgbWVhbiB0aGF0IG5ldyB1c2VycyBzaGFsbCBub3QgdXNlIHBjaWRldnNf
bG9jaygpIHdoZW4gaXQgaXMNCmFwcHJvcHJpYXRlLg0KDQpBcGFydCBmcm9tIGxvY2tpbmcgc2No
ZW1lIHJld29yaywgdGhlcmUgYXJlIGxlc3MgbWFqb3IgZml4ZXMgaW4gc29tZQ0KcGF0Y2hlcywg
YmFzZWQgb24gdGhlIHJldmlldyBjb21tZW50cy4NCg0KT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
KDEyKToNCiAgdnBjaTogdXNlIHBlci1kb21haW4gUENJIGxvY2sgdG8gcHJvdGVjdCB2cGNpIHN0
cnVjdHVyZQ0KICB2cGNpOiByZXN0cmljdCB1bmhhbmRsZWQgcmVhZC93cml0ZSBvcGVyYXRpb25z
IGZvciBndWVzdHMNCiAgdnBjaTogYWRkIGhvb2tzIGZvciBQQ0kgZGV2aWNlIGFzc2lnbi9kZS1h
c3NpZ24NCiAgdnBjaS9oZWFkZXI6IGltcGxlbWVudCBndWVzdCBCQVIgcmVnaXN0ZXIgaGFuZGxl
cnMNCiAgcmFuZ2VzZXQ6IGFkZCBSQU5HRVNFVEZfbm9fcHJpbnQgZmxhZw0KICB2cGNpL2hlYWRl
cjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVINCiAgdnBjaS9oZWFkZXI6IHByb2dyYW0g
cDJtIHdpdGggZ3Vlc3QgQkFSIHZpZXcNCiAgdnBjaS9oZWFkZXI6IGVtdWxhdGUgUENJX0NPTU1B
TkQgcmVnaXN0ZXIgZm9yIGd1ZXN0cw0KICB2cGNpL2hlYWRlcjogcmVzZXQgdGhlIGNvbW1hbmQg
cmVnaXN0ZXIgd2hlbiBhZGRpbmcgZGV2aWNlcw0KICB2cGNpOiBhZGQgaW5pdGlhbCBzdXBwb3J0
IGZvciB2aXJ0dWFsIFBDSSBidXMgdG9wb2xvZ3kNCiAgeGVuL2FybTogdHJhbnNsYXRlIHZpcnR1
YWwgUENJIGJ1cyB0b3BvbG9neSBmb3IgZ3Vlc3RzDQogIHhlbi9hcm06IGFjY291bnQgSU8gaGFu
ZGxlcnMgZm9yIGVtdWxhdGVkIFBDSSBNU0ktWA0KDQpWb2xvZHlteXIgQmFiY2h1ayAoMSk6DQog
IHBjaTogaW50cm9kdWNlIHBlci1kb21haW4gUENJIHJ3bG9jaw0KDQogeGVuL2FyY2gvYXJtL3Zw
Y2kuYyAgICAgICAgICAgICAgICAgICAgICAgICB8ICA2MSArKy0NCiB4ZW4vYXJjaC94ODYvaHZt
L3Ztc2kuYyAgICAgICAgICAgICAgICAgICAgIHwgICA0ICsNCiB4ZW4vY29tbW9uL2RvbWFpbi5j
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiB4ZW4vY29tbW9uL3Jhbmdlc2V0LmMg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICstDQogeGVuL2RyaXZlcnMvS2NvbmZpZyAgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAgNCArDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1k
L3BjaV9hbWRfaW9tbXUuYyB8ICAgOSArLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5j
ICAgICAgICAgICAgICAgfCAgOTYgKysrKy0NCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQv
aW9tbXUuYyAgICAgICAgIHwgICA5ICstDQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAg
ICAgICAgICAgICAgICB8IDQ1MyArKysrKysrKysrKysrKysrLS0tLQ0KIHhlbi9kcml2ZXJzL3Zw
Y2kvbXNpLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMTggKy0NCiB4ZW4vZHJpdmVycy92cGNp
L21zaXguYyAgICAgICAgICAgICAgICAgICAgIHwgIDU2ICsrLQ0KIHhlbi9kcml2ZXJzL3ZwY2kv
dnBjaS5jICAgICAgICAgICAgICAgICAgICAgfCAxNzYgKysrKysrKy0NCiB4ZW4vaW5jbHVkZS94
ZW4vcGNpLmggICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCiB4ZW4vaW5jbHVkZS94ZW4v
cmFuZ2VzZXQuaCAgICAgICAgICAgICAgICAgIHwgICA1ICstDQogeGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmggICAgICAgICAgICAgICAgICAgICB8ICAgOSArDQogeGVuL2luY2x1ZGUveGVuL3ZwY2ku
aCAgICAgICAgICAgICAgICAgICAgICB8ICA0MiArLQ0KIDE2IGZpbGVzIGNoYW5nZWQsIDgyOCBp
bnNlcnRpb25zKCspLCAxMjEgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi40MS4wDQo=

