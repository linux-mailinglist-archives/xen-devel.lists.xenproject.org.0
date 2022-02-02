Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E194A6E0B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 10:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263930.456824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCDh-0006Sp-W9; Wed, 02 Feb 2022 09:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263930.456824; Wed, 02 Feb 2022 09:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCDh-0006PI-SC; Wed, 02 Feb 2022 09:46:33 +0000
Received: by outflank-mailman (input) for mailman id 263930;
 Wed, 02 Feb 2022 09:46:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFCDf-0006NI-AG
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 09:46:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe9f85fc-840c-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 10:46:30 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2129hDSd002309;
 Wed, 2 Feb 2022 09:46:25 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2104.outbound.protection.outlook.com [104.47.17.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyqb383ht-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 09:46:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB6PR0302MB2695.eurprd03.prod.outlook.com (2603:10a6:4:ac::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 09:46:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 09:46:21 +0000
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
X-Inumbo-ID: fe9f85fc-840c-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4ZRstFd4NjMm+0N3pE8pWDGSkydhfhtUXpCeuVEVGabFuC9vqHT+AktvwI9W3yz47FLITOgDs1hbCmY3GyemxhHApKCeB5hL6KyyK2VI7hxrSYaU3p0qpcw/HigH3wlh7HzAaYOZY+7zrqXZ6C8FZzOz6WXFY2IOahLHwx6r1EpzzjmaufLjuWUvKTk9yMX1k0M5Kkr/KbmY9n4e8RGO/iLDpCnvdzp56CoUlmQ+0/HCgJSXdAML7VJR2gbdi2jgeVqzTeph0bEeqL8jj3tAm201ayMuynN6vkeg5UHyyk8xrlldAfgQPIDsoMWR0eGxgkrgL5eep8U2U/CCJZOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iA4LZTax/R3jrd0l/GKf+9pGXojd8gXV7E28ZZHIn3w=;
 b=JEOEBRfKOvYPRhVBkr1BNQHwiVVxQqzxzpgSgQHSjGWy1yjAR3RNN0jIDznkJf5ZSKrJ1d20YyTiSOgv1h9XkU+EYqVZhXYqV0RUczAwkXpMorf/ndUfkGBq2OEI2mJSLwKjzBJUfrfETX75AU6Ffce/f8uU10EoW9f0Sxr64RH3Bao4A8kyMWWoXWmuLRVZ6orJaE6Q+iE65gpVSRluQjMWxgycrbMAdQYuH8HAg6xQJ425CsCotFe2bmBmBILLmva5BLxzlfTsgjBl8pyk6XEdkUTYL8FlyAZ/4iSLnkY/qqgAEHivKlGenEkVG5iZleuFd9u1uAGxoFSppnFDVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iA4LZTax/R3jrd0l/GKf+9pGXojd8gXV7E28ZZHIn3w=;
 b=iDWSmYmMPTAM+Yl1Cg1nJ+YLv/qOU3wo/8dMcLVEvEFDXD1xGkrONbnZM0QOQWfXDLT+0mVyfzJxdc7z1gykGYjBq5KF1u3JWb80oS0Y29WLpRqAX1D8bE21YDxau45VQaLruCa2BJLLo9oqqHQklSBLgT144SPwvW9XWh5hiaBfZEtj6NmjsmGUXGyUjziAixz9J/PipiWszbgsyau1ion8svVW4hLig+jtgjzv609oK05x388QE31YOzFa16TzZm2vZgeJLP7DR2qZtCIA95uYgoplmAjUN3GMBbMNJoLoCkm0V+dHqZZe6B15nVjRUOhLruGHakDoatQmhnmE1w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Index: AQHX4ewInH3i1A85zUqSOqe7J03BoaxhCwuAgB9Nb4CAABckAA==
Date: Wed, 2 Feb 2022 09:46:21 +0000
Message-ID: <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
 <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
In-Reply-To: <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 28e42b1b-0c42-4491-a49a-08d9e630deb2
x-ms-traffictypediagnostic: DB6PR0302MB2695:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR0302MB269536A43D3A58A2B55284C0E7279@DB6PR0302MB2695.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z/3CeMkG0s+HgH6Xrk2upYtvDwyfeO81XsVZvBjZV/jT80V16xcHODwH/WE+WCdIYTRJnoMl/VeG3w/jxuVe5eY11JNRvp4Qfnzc2KqSgud7W+s283+IxsrrFu0r/2O8Re1qq1UBVdOVcHcu6lLxIpX++9J18mCBBXunOFocaF4T1khSRbninE6eMvSolrZAkDk8GweOyQwKeVp4e5SSdOWgQaPwrXf41Zdm8ZAE66jVdHqAqsG922rfb4NbGBGX7c+XoegmSHZe+RAZGra8mn3BdOv+XPebge2kxWsBOkqDrI8wa0kPi9lansp/rxA9qbQ4zh3W4bBVkKm6JHpc54Sb+0frl+M+D4ZGdHVFPUkXHP75ftc3BWFM4p69GICZTkHKdiCPg/8HLdRtU6f7b1cm5KwDAAQ0ny8pe1TvTvOLF1URyUuP7SCBunjwPVDTOy/rfKs2pYHNK2rr4YTCdBa+lJc1u3tBSkV6CmaKRwKPWan7nXYg3NnEOpy0gHXVjwPxZrHPF7LgeGvEkPx0tAws7jGrF08K7i1yE6H+ygBZ9Sq8Xi66OXAm2wan+XhopXcHb3Or4aOk+6xVsi2qn0vCoMMkEr+rrJNHhU3Lghb+CYB/R+3eDrRyZoKuYMfoeQ4qwMwxjMKuvyeIWQmU10W1++ohjc250wrSLG9uiDBIASu3zhwgqZ6YmC3Ph9EtCA4oytHfG0Zt4MX1OKX903pl1RP0PcmqRDBT2No6b3k7dBIeL4unCt6NN7C/lvEW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(71200400001)(107886003)(36756003)(2616005)(6486002)(508600001)(31686004)(26005)(6512007)(6506007)(186003)(2906002)(7416002)(8936002)(8676002)(66446008)(6916009)(66476007)(38070700005)(4326008)(5660300002)(38100700002)(91956017)(76116006)(66946007)(31696002)(64756008)(66556008)(54906003)(316002)(86362001)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TFpJRExXSmFnSDI0RVJjQ2NYYVBySmlNYWl0WlRXNldZTjQ0SU5McU9rZlRw?=
 =?utf-8?B?VjRUZGlJVUQ2cU02UmQzNVhLR2R2MGhldDBQM3hBekN2eitiTVhGakpWUjVV?=
 =?utf-8?B?Q0crcWt3ck9Za2RYT1dSeWVpMGlva2VYanJIb1pCVEpYSTEyVlpzZHdnanNz?=
 =?utf-8?B?SnM1bEJpTTdES0RxdFlqcVZaa2NTR3NIK2VkODhVTTFNSzFDSHNVN01zZERI?=
 =?utf-8?B?TG9RTmlnZ2RZSTNtOVRGeU5YNXVrbVpXRzY2QXNxZ3RvdVM3cVNGSjUvalZv?=
 =?utf-8?B?Z2oxNEczVzU2VkU5OWtLNllhTEZGeEh0eHVYRDQvU1hXM1ZRNmJ1YTdPTTcy?=
 =?utf-8?B?ZHY5dmp2UDJQd0ExV2YydjRBUndQc2UzM1Ywd2dCNVAwRUZ5SllxRzFLa2kx?=
 =?utf-8?B?Yk42REQ5UmoyZjdteW9Uc3BCN2c2bUtqWnlzTnh6UytlTllTVFZQaWV5K2Rx?=
 =?utf-8?B?YkVjN09GdEREakJOQ3I2VThKdzNkWTY5WVBwUmtHZjFONnZ6QVJCV3JZUGNK?=
 =?utf-8?B?dThiZkc5RlQ4cDVzWXNHVW5MVjFrWm1QbGtkT280Q3h6cm1TckJmRzMwclJZ?=
 =?utf-8?B?R0Q4QVlQTWdJOFZYOWhXbHBGMm5EczlNMzRkeGpnSjEvOGVZZjdqYVRSNE9v?=
 =?utf-8?B?dTNRTnhGMHlvOXdXOEJKRWo5WDM2ZjR0Y1hSdUZNOE9ZMlB2UEFENGFJckln?=
 =?utf-8?B?Y2lNWDJvOFM4bmJSenhsWnIyRGRWM2lWbkFsYXRLMHYrcjZMVURxRzdXdUdG?=
 =?utf-8?B?cVJRT2dESTFDTEpZcm5QUCtITmJOcnU2OXhCMkxVSk9UVnVaSFQzNkx3a1o1?=
 =?utf-8?B?QXdpbVk4T3BwV20zWGlWMVZZNko2Tk5pNDVtSlo3dDd1TitTbHgwRVhpMGlC?=
 =?utf-8?B?M3RnZUp4MllKcjMvYk5Qb0cvMzIzcWppeElYQUExSnFmUnhxL0IzclljeWJF?=
 =?utf-8?B?WVBKNFU5VzFqd01vY3BNYmdZNzBNVWcvVzFEMi9PZGtWTUtISi9FNnZSc1E0?=
 =?utf-8?B?MkNoR3JUNUlVbnNSYjZCZFIxc1JtaCsvVWd6WERCdHJBR3pVdGN1Q2Zud2VR?=
 =?utf-8?B?L28wbVdpZk5xWFBuRVEveHl1djhtOUNZcFdtaS9kSUtHeW5aTmQ3MmZBTm80?=
 =?utf-8?B?ZXF4SVNMN05vWTFLTGNpd1c1VkJJQk84UVNrVkhFSGoza1dvdVBsbTRGdGtQ?=
 =?utf-8?B?Z3ozb2VWNXFab3ZiTGdRZUUyTjNTWnRpZ2d2dThwVjhMaU56UEtocFJFd09y?=
 =?utf-8?B?NW4vOU91ZS8zTHVlTUZPSTQ4TmVjb1pzR2kzSHg2ZUdBcFFmWGtlc3pKZ1dt?=
 =?utf-8?B?b3JtdEdhVm1nYnlPZUcwY01iYmI2akdmdzljTEw3WHV5MmxFMVhIKzY3d0hM?=
 =?utf-8?B?SjRRZG50cFdzQ2RWd0J2cnR1N1dzTUtsb3lPUWIrNW9lMWxDNUlPejBqL09B?=
 =?utf-8?B?cmMrMmd3dVR3Q0V4WW9uSEZTOU5Cb0xOTklCU0Vvc0d1QnFSRWFOMnRhNkRz?=
 =?utf-8?B?QXpKSWRTU3lub1pxNWlyNm1mdDFKWGtoMmdBMWZub01VZGJpTlJaRUFoZ1Fk?=
 =?utf-8?B?VVh2WElOU09aNTloVDVrRUVxUEtuMjFNcTJkVTNnN0ZFTTFGcGFjTkZnVXdK?=
 =?utf-8?B?RzF4UXpnWEgzSTdqelRVRHVBMkV3Ui9TRWNvQmliUHFvdzl6MWtuR2dYbHQ4?=
 =?utf-8?B?emJOTTljL29zL1QycXBoNWRObDAxMmorOFRtR0FrS3l6ejdXZUVXTHVKaVJj?=
 =?utf-8?B?d05pbWduN3BWek5KZ2VPRWVHc2VuYjNQQWtDcVVBN0xjaTlMays5NkI2OUlx?=
 =?utf-8?B?UXRQaGZickp1Uk1ibCtqZ2lJRUwzTjFramg5U2l6U3doVHlEcys2YkcwYmVR?=
 =?utf-8?B?YWlvWlAzeUNnSnEvNzcwcmtsN0QwZEJRQURVa2JtUGtHQ1RDODRSVlhyZ3VD?=
 =?utf-8?B?cE82VWIxVWtqNXVHVmRsNE1Kb3BTcHlYTld1RVNZakFaK09EeEQreXYvejVN?=
 =?utf-8?B?UDJvTXR3WG4xdUpQeDEyN0RKYU5CNy9xUC9WVjZzUjEybXduRmM3Z3QzRlpR?=
 =?utf-8?B?cXMwUFd0V2JYbGx6aFJxUnpMZHVXRndzS3J4UmdDTkkxeXlrM2dKOTFNUDVZ?=
 =?utf-8?B?SE1JT05OUVRSWmVIc3VtaWlGbU5uVGRpSnNBU0FqM0Q0VlBKbkRWeVFMQXJi?=
 =?utf-8?B?bXNicURNSUF2ZmJ1RW9QYlA2dXMzNjFFRVk2blljU1JiZzF6QmU3MjdONzFq?=
 =?utf-8?B?RG5tV2ZxYnFKWVlEUHhZamRJb3dCd3A3cmtJK1lsa29UVmppN1ZhWWFYZ0l6?=
 =?utf-8?B?amRyYkNPYmxCV25QTEl0TUppc2FUTlowbE5EWW5aZFlUZXVBUXpVQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <17E953E294306A4596583D6020BB04C8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e42b1b-0c42-4491-a49a-08d9e630deb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 09:46:21.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6OWBWstaJgxA9rZI7XVjz1c05mYEMkV39uSx1RXTJori5huRvYYD8LS6QF5tQIFaLOzBuePmhderw2N+45g+z17FB+rhhXaex6pV+HJenyO9qFeGWbhmJTmY/BCA9nnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2695
X-Proofpoint-GUID: rQ43dJEl3QSHUoqpK2BbUsHpzsipGWKq
X-Proofpoint-ORIG-GUID: rQ43dJEl3QSHUoqpK2BbUsHpzsipGWKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020051

DQo+Pj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0dfREVCVUcsDQo+Pj4gKyAgICAgICAgICAg
ICAgICAgIiVzbWFwIFslbHgsICVseF0gLT4gJSMiUFJJX2dmbiIgZm9yICVwZFxuIiwNCj4+PiAr
ICAgICAgICAgICAgICAgICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgZ2ZuX3goc3RhcnRf
Z2ZuKSwNCj4+PiArICAgICAgICAgICAgICAgICBtYXAtPmQpOw0KPj4gVGhhdCdzIHRvbyBjaGF0
dHkgSU1PLCBJIGNvdWxkIGJlIGZpbmUgd2l0aCBwcmludGluZyBzb21ldGhpbmcgYWxvbmcNCj4+
IHRoaXMgbGluZXMgZnJvbSBtb2RpZnlfYmFycywgYnV0IG5vdCBoZXJlIGJlY2F1c2UgdGhhdCBm
dW5jdGlvbiBjYW4gYmUNCj4+IHByZWVtcHRlZCBhbmQgY2FsbGVkIG11bHRpcGxlIHRpbWVzLg0K
PiBPaywgd2lsbCBtb3ZlIHRvIG1vZGlmeV9iYXJzIGFzIHRoZXNlIHByaW50cyBhcmUgcmVhbGx5
IGhlbHBmdWwgZm9yIGRlYnVnDQpJIHRyaWVkIHRvIGltcGxlbWVudCB0aGUgc2FtZSwgYnV0IG5v
dyBpbiBpbml0X2JhcnM6DQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
IGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KaW5kZXggNjY3YzA0Y2VlM2FlLi45MjQwN2U2
MTc2MDkgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQorKysgYi94ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jDQpAQCAtNTcsMTAgKzU3LDYgQEAgc3RhdGljIGludCBtYXBf
cmFuZ2UodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25nIGUsIHZvaWQgKmRhdGEsDQogwqDC
oMKgwqDCoMKgwqDCoMKgICovDQogwqDCoMKgwqDCoMKgwqDCoCBzdGFydF9nZm4gPSBnZm5fYWRk
KHN0YXJ0X2dmbiwgcyAtIG1mbl94KHN0YXJ0X21mbikpOw0KDQotwqDCoMKgwqDCoMKgwqAgZ2Rw
cmludGsoWEVOTE9HX0dfREVCVUcsDQotwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
IiVzbWFwIFslbHgsICVseF0gLT4gJSMiUFJJX2dmbiIgZm9yICVwZFxuIiwNCi3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgZ2ZuX3go
c3RhcnRfZ2ZuKSwNCi3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPmQpOw0K
IMKgwqDCoMKgwqDCoMKgwqAgLyoNCiDCoMKgwqDCoMKgwqDCoMKgwqAgKiBBUk0gVE9ET3M6DQog
wqDCoMKgwqDCoMKgwqDCoMKgICogLSBPbiBBUk0gd2hldGhlciB0aGUgbWVtb3J5IGlzIHByZWZl
dGNoYWJsZSBvciBub3Qgc2hvdWxkIGJlIHBhc3NlZA0KQEAgLTI1OCw2ICsyNTQsMjggQEAgc3Rh
dGljIHZvaWQgZGVmZXJfbWFwKHN0cnVjdCBkb21haW4gKmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2
LA0KIMKgwqDCoMKgIHJhaXNlX3NvZnRpcnEoU0NIRURVTEVfU09GVElSUSk7DQogwqB9DQoNCitz
dGF0aWMgaW50IHByaW50X3JhbmdlKHVuc2lnbmVkIGxvbmcgcywgdW5zaWduZWQgbG9uZyBlLCB2
b2lkICpkYXRhKQ0KK3sNCivCoMKgwqAgY29uc3Qgc3RydWN0IG1hcF9kYXRhICptYXAgPSBkYXRh
Ow0KKw0KK8KgwqDCoCBmb3IgKCA7IDsgKQ0KK8KgwqDCoCB7DQorwqDCoMKgwqDCoMKgwqAgZ2Zu
X3Qgc3RhcnRfZ2ZuID0gX2dmbihQRk5fRE9XTihpc19oYXJkd2FyZV9kb21haW4obWFwLT5kKQ0K
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA/IG1hcC0+YmFyLT5hZGRyDQorwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDogbWFwLT5iYXItPmd1ZXN0X3JlZykpOw0KK8KgwqDCoMKgwqDCoMKgIG1mbl90IHN0
YXJ0X21mbiA9IF9tZm4oUEZOX0RPV04obWFwLT5iYXItPmFkZHIpKTsNCisNCivCoMKgwqDCoMKg
wqDCoCBzdGFydF9nZm4gPSBnZm5fYWRkKHN0YXJ0X2dmbiwgcyAtIG1mbl94KHN0YXJ0X21mbikp
Ow0KKw0KK8KgwqDCoMKgwqDCoMKgIGdkcHJpbnRrKFhFTkxPR19HX0RFQlVHLA0KK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIlc21hcCBbJWx4LCAlbHhdIC0+ICUjIlBSSV9nZm4i
IGZvciAlcGRcbiIsDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT5tYXAg
PyAiIiA6ICJ1biIsIHMsIGUsIGdmbl94KHN0YXJ0X2dmbiksDQorwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgbWFwLT5kKTsNCivCoMKgwqAgfQ0KKw0KK8KgwqDCoCByZXR1cm4gMDsN
Cit9DQorDQogwqBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQogwqB7DQogwqDCoMKgwqAgc3RydWN0
IHZwY2lfaGVhZGVyICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+aGVhZGVyOw0KQEAgLTQyMyw3ICs0
NDEsMjUgQEAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgdWludDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KIMKgwqDCoMKgIGlmICggIW1hcF9wZW5k
aW5nICkNCiDCoMKgwqDCoMKgwqDCoMKgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJ
X0NPTU1BTkQsIGNtZCk7DQogwqDCoMKgwqAgZWxzZQ0KK8KgwqDCoCB7DQorwqDCoMKgwqDCoMKg
wqAgc3RydWN0IG1hcF9kYXRhIGRhdGEgPSB7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZCA9
IHBkZXYtPmRvbWFpbiwNCivCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC5tYXAgPSBjbWQgJiBQQ0lf
Q09NTUFORF9NRU1PUlksDQorwqDCoMKgwqDCoMKgwqAgfTsNCisNCivCoMKgwqDCoMKgwqDCoCBm
b3IgKCBpID0gMDsgaSA8IEFSUkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCivCoMKgwqDC
oMKgwqDCoCB7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIg
KmJhciA9ICZoZWFkZXItPmJhcnNbaV07DQorDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
IHJhbmdlc2V0X2lzX2VtcHR5KGJhci0+bWVtKSApDQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGNvbnRpbnVlOw0KKw0KK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGF0YS5iYXIgPSBi
YXI7DQorwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYyA9IHJhbmdlc2V0X3JlcG9ydF9yYW5nZXMo
YmFyLT5tZW0sIDAsIH4wdWwsIHByaW50X3JhbmdlLCAmZGF0YSk7DQorwqDCoMKgwqDCoMKgwqAg
fQ0KKw0KIMKgwqDCoMKgwqDCoMKgwqAgZGVmZXJfbWFwKGRldi0+ZG9tYWluLCBkZXYsIGNtZCwg
cm9tX29ubHkpOw0KK8KgwqDCoCB9DQoNCiDCoMKgwqDCoCByZXR1cm4gMDsNCg0KDQpUbyBtZSwg
dG8gaW1wbGVtZW50IGEgc2luZ2xlIERFQlVHIHByaW50LCBpdCBpcyBhIGJpdCBhbiBvdmVya2ls
bC4NCkkgZG8gdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm5zIHRoYXQgInRoYXQgZnVuY3Rpb24gY2Fu
IGJlDQpwcmVlbXB0ZWQgYW5kIGNhbGxlZCBtdWx0aXBsZSB0aW1lcyIsIGJ1dCB0YWtpbmcgbG9v
ayBhdCB0aGUgY29kZQ0KYWJvdmUgSSB0aGluayB3ZSBjYW4gYWNjZXB0IHRoYXQgZm9yIERFQlVH
IGJ1aWxkcy4NCg0KQ291bGQgeW91IHBsZWFzZSBsZXQgbWUga25vdyBpZiBJOg0KMS4gU3RpbGwg
bmVlZCB0byBpbXBsZW1lbnQgKHRoZSBwYXRjaCBhYm92ZSkNCjIuIERyb3AgREVCVUcgcHJpbnRz
ICh0aG9zZSBhcmUgcmVhbGx5IHVzZWZ1bCB3aGlsZSBkZWJ1Z2dpbmcpDQozLiBMZWF2ZSB0aGUg
cHJpbnQgd2hlcmUgaXQgd2FzIGluIG1hcF9yYW5nZQ0KDQpUaGFuayB5b3UgaW4gYWR2YW5jZSwN
Ck9sZWtzYW5kcg==

