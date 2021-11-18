Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822964555C8
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 08:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227147.392783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbwA-00021g-Pf; Thu, 18 Nov 2021 07:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227147.392783; Thu, 18 Nov 2021 07:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnbwA-0001z0-MZ; Thu, 18 Nov 2021 07:34:26 +0000
Received: by outflank-mailman (input) for mailman id 227147;
 Thu, 18 Nov 2021 07:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HVvB=QF=epam.com=prvs=1956dce401=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mnbw8-0001yu-UD
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 07:34:25 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f2c8f553-4841-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 08:34:23 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AI6Xigi012843;
 Thu, 18 Nov 2021 07:34:20 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2059.outbound.protection.outlook.com [104.47.6.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cdc4kgu7x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Nov 2021 07:34:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4756.eurprd03.prod.outlook.com (2603:10a6:208:ce::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 07:34:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.022; Thu, 18 Nov 2021
 07:34:16 +0000
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
X-Inumbo-ID: f2c8f553-4841-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWazcW0xsDd9MBempGDbtY9Wz121pUgc2FyJt0G/J3SHEm7StJpueUfUJjPxNc2UTaeq0qI0FtXoisDlZ5pgNmQiepglG4unmv7so9GtOEYesF4RnNosPMDzD5edXFIPMmvZn12epFqrXX5iT5dMJ2/IyZKPt+qz8ka26fNt7E5yImBUdQ1ZHnt/mmcRXnaZPYuVZ2VzkvOjHUb6nxBME9ofiyIc97kq9nWuN/fEnyANp2YsDHNOq9JrUzkSvrcHAXADLRSwlN5UWxg70XL89plnagTSdLT/xLUBL6iqSl7Z69mHM0Q90ocAvdoBr6F9GXBlO1P1xpxz36XzLs1zJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sGjDzr3Y8v1+vhYuvlArJy6VhDzMWTGjxM10baeoAMM=;
 b=bUUkQU/j5nvWO/sTHLrIAivzHzor8L2UMx6yfpEUlVVAhVWQs3u2R8J1ep9tTpPLO9okjHQU/X42nZKSRKvKHN5J1ST2q2eVXe/j52cX5xXjv/26ETs10WDsY9uSGRq9otN8C6B4RkZqfPD53Ndu+z6ZLRf2TdNl7o+ztQ+VSCTCVyykY7aLFtFr3AGTO/wCB4zUJVZdgQjeCaXyu9MvXT6SkB4fOcq6+2KaGXBgSo/oN64v44773W7UrdqwhUGoWpRpdrzoLSO5nhoAvQLGsHE3u8Lh5EofkrHeToaYXvvfJgpArNl4gS+rwGsmg9V3EO816IQ9ETSVSnV5CBCTxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sGjDzr3Y8v1+vhYuvlArJy6VhDzMWTGjxM10baeoAMM=;
 b=N2+QoA7Ny4fmfeM/PX1afPFwvPRfkKuqODSWWdHyYWmEe6qwud4mGbx5I4x4VmMPAXm96FUXnqzLg/ErAJ+e1FnCqqhZAhTNnDoYeDZtpBSQNS/+b1UOgR6oqpRTld70zhVQ/4Tz4PtnZmmKUzXKow1lv4yxccmXxenkJ7NZPTk+/roHHjV21TDCh6r+NPra7aClD/pBxIcVbaUq8+4UD+wrbQo8rJ3Bl3qTB7/OWF3aKwje911ogbfQnOtXz6ZNHjIG/1SH1jozeWtaTpIlyVWfC4gXe5mDhQMW3Ysyfml01QWDpCoIIgECYeAiUYl0aTd2tYpx9SoEQRKZWnzahA==
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
Subject: Re: [PATCH v6 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Topic: [PATCH v6 7/7] xen/arm: do not use void pointer in
 pci_host_common_probe
Thread-Index: AQHX0g8VdyW1HUZQoU+rE1C3L5fCpKwIVL2AgACkhIA=
Date: Thu, 18 Nov 2021 07:34:16 +0000
Message-ID: <aa6075bd-3bfc-f49e-e0b9-07ee131c315b@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-8-andr2000@gmail.com>
 <af9d192c-7445-1378-a81d-17101bad7245@xen.org>
In-Reply-To: <af9d192c-7445-1378-a81d-17101bad7245@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 362e05e8-8a31-44f6-effe-08d9aa65d36a
x-ms-traffictypediagnostic: AM0PR03MB4756:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4756090E6484A9AD68878B77E79B9@AM0PR03MB4756.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kMR6ktTle7tjQTOq4ySoXUQYte/PBf3VG84GCBuh/VQSpPkyqxRy3Zj6oCrGeSDZ1qOJP7u06RONssRobzMJGNstRjnFEe88jcRsvAsAI1ADQ0VDDOEj37DRMr5at3oNB8X8rroZ3/J4s/20NdXpMWslLNUHBRKcn6KonTDM57fedAhepzjd3BuFX8h8HqUHND4WNfsHPgGxudY+czHjgewoeCDIQL4f/gMfNugarZzm83Ar5JCN7EtcctQb7JY+JOzhUZA2WCUMbXYCNBTf5rOeENgb+3OmH2lDHo8UdtTDAHH0P7vfm89diYzo4Ym+VLjGxb1lOkqlwcS5649JWg5IjGnvnvbDODo3QoxDt3JELt5L23sM9wHtxAM2aRkN7xhMrmEUE8m2JKZZz55hKxQIPLx0XjLegFo0RJBvx5ICv/tMfQtHJ398ia6rm1DktKYbfLZFalByh5QG0skd/rb5mR3jBGa6Pw+Yq4B+Qz2bQi9Qf6VecygHMLtB4NBIHMyzjW8+h8rr8di3u25yjLa4MQdATxYHTABGYu/FW5d/pRlMmigz3L/AMLp6Kijw1vn4VRgJGvSPWvlWWobfPg/AS9SfkWKY6v/f3lZK6KidIkIinwh4wFDN8YPH9Kb/a4PrwlMJJym0g6ZBp0zt+SP2CTPA3RYZ7KUpARaSnEK/a9xOBRxsxgDhio6Ah4OalgDveWXQJPutNmaqqmZepO8lnhD3aCsBI0KLhedJ3dzD3b+4yLD5usU6W1HcW+9p
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(71200400001)(91956017)(54906003)(110136005)(2906002)(38070700005)(316002)(6486002)(107886003)(38100700002)(8936002)(186003)(83380400001)(6512007)(508600001)(36756003)(66946007)(122000001)(2616005)(66446008)(86362001)(66476007)(7416002)(66556008)(4326008)(64756008)(31696002)(26005)(6506007)(8676002)(53546011)(5660300002)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R2xsektXRGg5UW5FNjJnWnQ3ZDMyTGxhTXlHNzd6SFc5R2NoY0hWRk5tZjhJ?=
 =?utf-8?B?RXdmMXFUeFZ5NXJXbU44aHU5SU9BYW9ibTJyWnpIOTh6aDdyQ0ZHd1BTNE4w?=
 =?utf-8?B?dDVFaEhPenFkc0RqcHJuWGFWRkoxZlc2MVNzYm5uOEl6RDVLOHQwYmVodjk0?=
 =?utf-8?B?T1ovM1NxS2I1TWZ3ZnEwU2RQaWN4NDQ3ay9jT2xONHJjbFlhSUtKY08yRVZQ?=
 =?utf-8?B?WFdmU0I0OEtualRNQVp6dk9Dd2l1Zm1Gcnh4enh2d29ZN2hoVXlINGJtZG1u?=
 =?utf-8?B?RjBRTVh1ajV3eVZRUjk1N1BBNU9WK2ZkTFBUQWd2THk5SzBuYUxlSEFONXVD?=
 =?utf-8?B?Z29KOEZtOU0xNnNOTkxZUFZZQmpwQllCRW9nVlFTNzljQXBzbzdtSTI1YnVO?=
 =?utf-8?B?aVNoVjBXaDlkRTBkRzNLTWllSmg4SHpnQ01QenRiZmhQVVdIZkFhYTMrdmYw?=
 =?utf-8?B?VmJMVjF1N1A5dFJDTnN4QkovNjdwSENTMzd3U0p6eDA1OWI3YUdRQzNXVWNv?=
 =?utf-8?B?NVNnUTJsdk0ybmFYQ0QwY0U2N0c3UXlzTjZmYTczcE5uOUNEdEFEUmdoYkxu?=
 =?utf-8?B?Z1VBbXRoeUQvQzZ0b2tlUmgvUlhVendXd2FoUHhKQWYyaDJ6b3ozdzJ4c3VQ?=
 =?utf-8?B?Yzgwd1NPVHkyaW5GQU1WZzF2ZnBaMkJTbG5FMjZIV2tyekZjeXhQOEx3UHZu?=
 =?utf-8?B?VW10MnNOczlGMFZ3enU1VmpLMjVkelJOTWVTR1hZMHlSZ0ppbWxUOWlTRnNX?=
 =?utf-8?B?RHhMVC9xN3psNG55ZGlBdHpNTmdJY21EbjM1blVSMHFMWm5HSWFPMWtINDdt?=
 =?utf-8?B?bGhmL0tScmRpVnJHeHdUM1ljWUp5UlRCUkozVE5qRFk5MTNwOWQ4RDdGWTRY?=
 =?utf-8?B?V1o0bUl5MjZHendXalFKRXNsWmNya2NIa1FpV2xpVEVKQkVTTmJFMzNIVks1?=
 =?utf-8?B?MzdKL2xYRVZtbXVMcXF6YVladXI1cWFFQzdkRCtjMlVZZ0RHY2ZHcm5TZGhi?=
 =?utf-8?B?UUhHNExEOGNieUZlMUFKTXI5YVhvWXdsTGlQVlgxOGcvZitjODlBOHdaMUkz?=
 =?utf-8?B?ZXhpYU1nU1VxdERxYkVyMHR2Zm1aSG9FNmdZNnBlQS9lczlBTGFtRTArczFI?=
 =?utf-8?B?OVdIOW1SYnQ5MWpZbC9pYXZTck51QUUvditaaEVjZ0pPaXhZMzkzV2tKNGpO?=
 =?utf-8?B?SEpTUUlBSGN3U0dEVGx4UFdxMVNKV1ppd1dOdFpJWWRsSGgza1R5Tm5XbnM4?=
 =?utf-8?B?clh1bmFZdG9mNFhuT1dHV1B2VU1odlcyYzRuMzFJek5Rb2YvUnkxcmdRaTRm?=
 =?utf-8?B?SDMrdXhlc2hpTTFoS2JzRFhaZm03WUMvNXZrQktTb1VVWXU4bHNrbFJ5SjUv?=
 =?utf-8?B?ZWN5YTh3SHNQbjBRR0lJeDQ1RG5IWmg1aTV1ZFVuS3oyS1p0NXZkU0ZpRTBL?=
 =?utf-8?B?a2UyUld4SHI1V2JuZmIvQzZVSFNoc2VPdW5ZSnFJQkxRTUVWUnFiQXZGTGZO?=
 =?utf-8?B?NXZiK3p1c2RDeTd5Q1M4Z25xbHVHN1p0eUwvYWNlUE8yc1hDd2NKY2d5YkJi?=
 =?utf-8?B?ZTVtY1lPTUg0OEFRZUNRZVpvaHFnMTNSS0Y4ejlvWE0vTzFkNkRSVlZQYXlJ?=
 =?utf-8?B?RmRIc2pyUVlkTnBmVVMveHJiR2ZsR3ZNc3c2ZGR3aUhxQ1dvd1NTdmd3NnlU?=
 =?utf-8?B?WjRGNjdmOWJJbGJSejhlQ0RiN0dPQlFiRktBUnFoMC84OENWK28vcGN0R2Mx?=
 =?utf-8?B?dW03ZlBNNFhUNkR5MHBScVBKbXYrbENTSWVpZXhjd21lOC80NS91ZVc1YlRr?=
 =?utf-8?B?Qk1Uc1JjVUFuTFJpMlZRVUIvUlRoNXgzRmx1a1JWQ3piOEEvRlVOY0hLRGIr?=
 =?utf-8?B?c3pUOUt0QzRPMUY1S0dhMzNNUkpsdlUzS1dLZnU5WXRtM2N1S0Zubm1tRElX?=
 =?utf-8?B?MXBkYythR0VrZW1ITDU1VnBjWnZWbDBoUFVPZTkvTVc1MStNajlCVy9kU0tN?=
 =?utf-8?B?cktMbGNHUEltZlRaNS9vYW0ydmZrWCtiTHpMSy93TVpUT20rZjNhZUd4U29S?=
 =?utf-8?B?RjhrMmEwaHIxSUtuOVAvbmQ0eGE1M2xpaFJ6bmJCbWhMZjJYcWh4NEY5TjUw?=
 =?utf-8?B?MVVwOE5nbTQ4UVk4T3A5ZTExeDhkOVNsZDFFNEJJMUVmOTk5MmNseE1KNjNs?=
 =?utf-8?B?UTNLQklKS0tCc1FEU1JudTY1V1VwZkYvYkdWaU1lazJydXZPd00rb0cxS2N4?=
 =?utf-8?B?Z01pNnFycXdaRVZKNEVqUGVXaW5tbUszVFpuK2xBYUZUdStsMlBtMFNHNDZo?=
 =?utf-8?B?cVp0eWltbzRDbGprT0ZNb1NlL2dubFdKa0Z3UnhscWtCb1BIekQzZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94892F10691E4746947711E69DF081CC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 362e05e8-8a31-44f6-effe-08d9aa65d36a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 07:34:16.4010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGJ/eMWReUo3cO8LOL+upxZwYm+x0M1YXYn6DCc8Qm06cznd83LJUUkO/3BkxWJrsv2Em5xRhCsxVQn6dyRhwqWAnL/+RKEwYtDMdb5Wbn3zVep3Dx1mBfNBf0uUKCdB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4756
X-Proofpoint-GUID: 6XM1nbe2HlA246UpfIhuUZ9tLuOCXXT8
X-Proofpoint-ORIG-GUID: 6XM1nbe2HlA246UpfIhuUZ9tLuOCXXT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-18_02,2021-11-17_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111180043

SGksIEp1bGllbiENCg0KT24gMTcuMTEuMjEgMjM6NDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwNS8xMS8yMDIxIDA2OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBUaGVyZSBpcyBubyByZWFzb24gdG8g
dXNlIHZvaWQgcG9pbnRlciB3aGlsZSBwYXNzaW5nIEVDQU0gb3BzIHRvIHRoZQ0KPj4gcGNpX2hv
c3RfY29tbW9uX3Byb2JlIGZ1bmN0aW9uIGFzIGl0IGlzIGFueXdheSBjYXN0ZWQgdG8gc3RydWN0
IHBjaV9lY2FtX29wcw0KPj4gaW5zaWRlLiBGb3IgdGhhdCByZWFzb24gcmVtb3ZlIHRoZSB2b2lk
IHBvaW50ZXIgYW5kIHBhc3Mgc3RydWN0IHBjaV9lY2FtX29wcw0KPj4gcG9pbnRlciBhcyBpcy4N
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+DQo+IEkgd2FzIGdvaW5nIHRvIGFjayBhbmQgcHVz
aCB0aGUgcGF0Y2guIEJ1dCB0aGVuIEkgY291bGRuJ3QgYXBwbHkgdGhlIHBhdGNoLi4uDQo+DQo+
Pg0KPj4gLS0tDQo+PiBOZXcgaW4gdjQNCj4+IC0tLQ0KPj4gwqAgeGVuL2FyY2gvYXJtL3BjaS9l
Y2FtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgNCArKy0tDQo+PiDCoCB4ZW4vYXJjaC9hcm0v
cGNpL3BjaS1ob3N0LWNvbW1vbi5jIHwgNiArKy0tLS0NCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1h
cm0vcGNpLmjCoMKgwqDCoMKgwqDCoMKgwqAgfCA1ICsrKy0tDQo+PiDCoCAzIGZpbGVzIGNoYW5n
ZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPj4gaW5k
ZXggNGY3MWIxMWMzMDU3Li42YWVlYTEyYTY4YmYgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC9h
cm0vcGNpL2VjYW0uYw0KPj4gKysrIGIveGVuL2FyY2gvYXJtL3BjaS9lY2FtLmMNCj4+IEBAIC0y
NCw4ICsyNCw4IEBAIHZvaWQgX19pb21lbSAqcGNpX2VjYW1fbWFwX2J1cyhzdHJ1Y3QgcGNpX2hv
c3RfYnJpZGdlICpicmlkZ2UsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBjaV9zYmRmX3Qgc2JkZiwgdWludDMyX3Qg
d2hlcmUpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIGNvbnN0IHN0cnVjdCBwY2lfY29uZmlnX3dp
bmRvdyAqY2ZnID0gYnJpZGdlLT5jZmc7DQo+PiAtwqDCoMKgIHN0cnVjdCBwY2lfZWNhbV9vcHMg
Km9wcyA9DQo+PiAtwqDCoMKgwqDCoMKgwqAgY29udGFpbmVyX29mKGJyaWRnZS0+b3BzLCBzdHJ1
Y3QgcGNpX2VjYW1fb3BzLCBwY2lfb3BzKTsNCj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IHBjaV9l
Y2FtX29wcyAqb3BzID0NCj4+ICvCoMKgwqDCoMKgwqDCoCBjb250YWluZXJfb2YoYnJpZGdlLT5v
cHMsIGNvbnN0IHN0cnVjdCBwY2lfZWNhbV9vcHMsIHBjaV9vcHMpOw0KPj4gwqDCoMKgwqDCoCB1
bnNpZ25lZCBpbnQgZGV2Zm5fc2hpZnQgPSBvcHMtPmJ1c19zaGlmdCAtIDg7DQo+PiDCoMKgwqDC
oMKgIHZvaWQgX19pb21lbSAqYmFzZTsNCj4+IMKgIGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
cGNpL3BjaS1ob3N0LWNvbW1vbi5jIGIveGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24u
Yw0KPj4gaW5kZXggNmFmODQ1YWI5ZDZjLi4xYWFkNjY0YjIxM2UgMTAwNjQ0DQo+PiAtLS0gYS94
ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiArKysgYi94ZW4vYXJjaC9hcm0v
cGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBAQCAtMTk0LDE1ICsxOTQsMTMgQEAgc3RhdGljIGlu
dCBwY2lfYnVzX2ZpbmRfZG9tYWluX25yKHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqZGV2KQ0KPj4g
wqDCoMKgwqDCoCByZXR1cm4gZG9tYWluOw0KPj4gwqAgfQ0KPj4gwqAgLWludCBwY2lfaG9zdF9j
b21tb25fcHJvYmUoc3RydWN0IGR0X2RldmljZV9ub2RlICpkZXYsIGNvbnN0IHZvaWQgKmRhdGEp
DQo+PiAraW50IHBjaV9ob3N0X2NvbW1vbl9wcm9iZShzdHJ1Y3QgZHRfZGV2aWNlX25vZGUgKmRl
diwNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBjb25zdCBzdHJ1Y3QgcGNpX2VjYW1fb3BzICpvcHMpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKg
IHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZTsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHBj
aV9jb25maWdfd2luZG93ICpjZmc7DQo+PiAtwqDCoMKgIHN0cnVjdCBwY2lfZWNhbV9vcHMgKm9w
czsNCj4+IMKgwqDCoMKgwqAgaW50IGVycjsNCj4NCj4gLi4uIGluIHN0YWdpbmcsIHRoZSBjb2Rl
IGhhcyBhbiB0d28gYWRkaXRpb25hbCBsaW5lcyBoZXJlOg0KPg0KPiDCoMKgwqAgaWYgKCBkdF9k
ZXZpY2VfZm9yX3Bhc3N0aHJvdWdoKGRldikgKQ0KPiDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsN
Cj4NCj4gSXMgdGhpcyBzZXJpZXMgcmVseWluZyBvbiBwYXRjaCB0aGF0IGFyZSBub3QgeWV0IHVw
c3RyZWFtZWQ/DQpZZXMsIEkgbWlzdGFrZW5seSBoYWQgYSBwYXRjaCBiZWxvdyB0aGF0IEkgZGlk
bid0IHdhbnQgdG8gdXBzdHJlYW0gd2l0aA0KdGhpcyBzZXJpZXMsIHNvIHRoaXMgaXMgd2h5LiBT
b3JyeSBhYm91dCB0aGF0Lg0KRnJhbmtseSwgSSBkaWRuJ3QgZXhwZWN0IHBhdGNoZXMgdG8gYmUg
bWVyZ2VkIGZyb20gdGhpcyBzZXJpZXMgbm93IGFzDQoxKSBJIGV4cGVjdCB2Nw0KMikgSSB0aG91
Z2h0IHdlIHdvbid0IHB1c2ggdW50aWwgdGhlIHJlbGVhc2UNCg0KVGhhdCBiZWluZyBzYWlkOiBk
byB5b3UgbWluZCBpZiBJIHB1dCB5b3VyIEFja2VkLWJ5IGluIHRoaXMgcGF0Y2gsIHNvDQppdCBp
cyByZWFkeSBmb3Igdjc/DQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

