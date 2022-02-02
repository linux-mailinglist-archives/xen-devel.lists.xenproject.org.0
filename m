Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E668C4A7128
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 13:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264115.457101 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFDa-0003bC-Rj; Wed, 02 Feb 2022 12:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264115.457101; Wed, 02 Feb 2022 12:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFDa-0003ZN-Nu; Wed, 02 Feb 2022 12:58:38 +0000
Received: by outflank-mailman (input) for mailman id 264115;
 Wed, 02 Feb 2022 12:58:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFFDZ-0003ZH-Ib
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 12:58:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4b7786e-8427-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 13:58:36 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212CsArY019864;
 Wed, 2 Feb 2022 12:58:33 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dytc580pj-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 12:58:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AS8PR03MB7127.eurprd03.prod.outlook.com (2603:10a6:20b:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 12:58:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 12:58:25 +0000
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
X-Inumbo-ID: d4b7786e-8427-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AuWYtvz8EVxAotU53Zl2VRzISAr3CTrstOMUvto+yfeTTgsmN6ZWvVfiWXg0smJYoRNpFOw42gymz4zYuX0ewieIb+gEoMFvKJSUiYsqASbrbhBGZc1z6yAM+pf+JESDRU2wgo/NAs1tz6eto4P1RMqKiPs+0ubQ9Y7X1WpStwKmpwAZNwNen2gLq2Ab/fyyx6sye7bnMF93dAUacY3HbbwZqY6ih+mOVdoYc//PhyE1DToy6aBbX09TSLA80DImRBHTVUo0WYbBitYwxB8CuxSTBMG7QYwN0qXIOrln0NmVCRqwZMYoFW4CfgPg2MtTIId4U57RTCbfKlpyxtMWvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztv0ZcHTX9trR9ppj29bdhj4k1r8U4xU23CcABS6DXU=;
 b=Bm+N/7MTcAZ4JTSqXeqUjnuPR24wPk+h9oQhLTJ51u7N1rLJrTbVb/YEUFwuFbCY7FFQyTLU6afc8g00Fg4zBry7rgHdgnSuL9gAl42RFEoKoG0SKyowYAduEv5XtiYtpaz8i/LxoSl+aY/4m8Kd/JeQqM29kpI/Y5Yl4u1h25XP2EBBOoD/lk0jEdiTsGXvaBz3fW0a3u+uzXuiN39wwJHkP9DzDV4gGF/6x8EiyBK9XGIUXe/ml8oClQTtCBLt+LNKKLfRGSpAqAhVQzLiKcE6MWShSu60XnXPCjaK7IupQneBM2rPJrXyD+4KEdyX0XLb3kK1gnqqy3TTbUmSzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztv0ZcHTX9trR9ppj29bdhj4k1r8U4xU23CcABS6DXU=;
 b=HEwjgc7ZzyaC61j1b47IL7NL35zGcbJ/pnWw/OssJUMeijU1o/LOGDOjkhxrhLKWFrPq5W1D9QMb1rMSZ2rJ4e22Hp7m9hAGDQWCb8bv35G9aPfGQ70YVd5R5dE0HT+Pi560inOBjd8bzbKZEfSSv7jiURi/8MsP55jzrohHyZNeJd7wIIJb1e5OK7kGnkBLdscgVedrJHYV3joYOgtAoMUMhsswvtjjofuft0/9isJSAXxF7a1SDLQqaTjmpTlnY6goufsWHLosZXr8V9VPqcNZjkLRy1JKdshPx5YMXYuetUPmmM605Op/4nmTDydcu8/gPuB2aMyTeAjVY5z1dQ==
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
Subject: Re: [PATCH v5 10/14] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v5 10/14] vpci/header: reset the command register when
 adding devices
Thread-Index: AQHX4ewKKrjJdBpwck6ciSQTpymsh6xhF7QAgB+NkoA=
Date: Wed, 2 Feb 2022 12:58:24 +0000
Message-ID: <7dc49d44-2de2-896a-4d7e-35bffe90f2df@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-11-andr2000@gmail.com>
 <YeAH+h1ngDwze2+c@Air-de-Roger>
In-Reply-To: <YeAH+h1ngDwze2+c@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 73228d1b-7dfa-45cd-5166-08d9e64bb308
x-ms-traffictypediagnostic: AS8PR03MB7127:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AS8PR03MB7127B703B01B65F33E34404CE7279@AS8PR03MB7127.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 z/4ThK9vf4yyZ2S7e/oaOl1zW3ABTSiVwMpAu83tZpQfkGZoGWfNvUfxpDROcv3gi27hbcQLVHfj9G0Wdv4ryotZNElYFACD8n4G/V52Xj1hD5N7gOWTOgEyGE4ARxa/KVPWTDCQBIIZeOmcGPm5aXpz5AgV6O2SDOjMUzZ0l0O/O9zd2UcczQpWxW1l4tdEepglEyrZ2ISmB7CVJSZurxJhmxOVRcfSVqXhTfkBuxG76R4MnDVE8cC+EpjCh/zAH/puWBHk7ZZDJ1HuSI92FzA1OU0kZ9mXC1TyxblOs30fedDwxBRW7CvSoB4yEQxTIOOVGQF0CzPoGFr0FMsxD2uy5ivifPfmMLkMX3cMvjhhTWzN19ogPIL56f5UtfvZDyglYYffs2us5CG3Y5laFsYAYFhMYwT7OGqUKeOKFNmCWHeVv6QYzspEN9S2Y9ZiCn9Oh5eb9l/TJhVjeBKujaTczRlDj2zvWPHJxQO1rCzTSOjMrs8geZTiX/ykxS0zsGGaH4AOa9TMEG2kvnDsVjd/ZCON2c4bQ1d3VTo50AHML7EK/Bj4kNqWDi0ooy/r/eY7/87ruS5UQT57w1IVYDjGHuSALjqdw5oG1RzqL/LS9Q1XnX/lmBE7LBVtTnwbLOAwmWDtCE38ViLZHG92ZSZw1Y8J2xY+wEbG8CHPpO95/+c9eIomoXIQuxt5VsityqhN6cDx5pKY3WHMAYlosjNRDvsS+hv+fLDfo3tLCzMWPdtUmFZLZrAvNsZtHkAO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6512007)(53546011)(2616005)(6506007)(107886003)(71200400001)(26005)(6916009)(54906003)(508600001)(186003)(122000001)(38070700005)(316002)(6486002)(38100700002)(83380400001)(66556008)(66946007)(31696002)(86362001)(8676002)(36756003)(8936002)(4326008)(2906002)(31686004)(91956017)(66476007)(66446008)(64756008)(5660300002)(76116006)(7416002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T1U1T0xkWlh5Ujh2TVZDNkViOWJUbjA1SktiQjliWXNVRDI0aElNdkd1a0Fq?=
 =?utf-8?B?anVCdHVrVWNWYzdxT0RTTmhUMFpmcmxpUkdOaDFLMUpNOGNBSUZRWC9tNDNU?=
 =?utf-8?B?bUdzSXFrOVR0REJDaGlCUWZ6azNlalZYZ0NSdXA2TWRVSVR0N3ovbjhEaS9K?=
 =?utf-8?B?a2Iwd0pEK3g3ZXg2SVR2Z2c3SHhDOE1ZS045bXR6T3hyTWlpNUN6NDdLeGdx?=
 =?utf-8?B?SjVaVTJPVEFOWjVRR2xhaG9ibmRVYVNrc1h5QUJtaHlTbDVoa21Jd1dWbmg0?=
 =?utf-8?B?YVJFVUwxNXdONVdrcno3djdGYS9xOFZTcHlxemFoYTFsVXN3K2ZMcVcwUEVS?=
 =?utf-8?B?ZzRZaFJ3UnVkVDhjWTR4MUxjRlJ3OXdVdkZDZnpsb1RuZEJKYW84WFR1Q1BG?=
 =?utf-8?B?VWVhTThvOS8zWVp0QTVidmZISkN1SXJmbTZUaU9EdTJtb0tqL2FpNXFOMHhL?=
 =?utf-8?B?d3hybTRDZ1pteE50b0hzdE5rV0N1V0djdkYycHppREpLN3BPaW5mNjVvNDk1?=
 =?utf-8?B?WmEzVTJpWE4vVDVoRlZ1dFlaQm9hd2UxTGNQejdodkdSaHQyc1dPWFJjZG54?=
 =?utf-8?B?alFDM2htTkV1YW41UXBBdHVsWEtnbWZqSmRBaWI4SmxjMTFya2lyRTNJSDlN?=
 =?utf-8?B?SDFZY2dGQzBmbEliOTBwaEwxQkVFeDhHdG1tenJ6RThIM1pRUW5YU1ZnY1Jt?=
 =?utf-8?B?VVJzbSsrT3ZaQXpyMWFaeWRmU3huK01NaVRCVGJnU2craFFoelh2WS9DWCt4?=
 =?utf-8?B?R1FwRGRweDdwRFpEcDNVZ2hmb0ExQ1BQdjdwc1B5Ymk0TVVMdHVMNFZCM2FX?=
 =?utf-8?B?TzFZQTVYTGZOZGo5cnhjdmpYUzNMNDNCVkxsTVlGN0x0bjVwVkNtanUwbXlO?=
 =?utf-8?B?TUJjMVJSWGFrNVo0emZBUXJkU0FJMnpERXJCbnVhMkxQeGtBNFQxTVF0UmRX?=
 =?utf-8?B?QnR2bHdrVUkzS1poeWx2KzBMZmw4dW9LTDJGL2xjdjJMaGRlcmtKeHpOV0Nz?=
 =?utf-8?B?eVZFU29LVGlwMWpRSUorOGkwNHUzL2Z2bzFkZnRCT0o1ZzN4Ny9hdTV2WEdY?=
 =?utf-8?B?K2Z0SHNZcFUyb0ZtdytUZGxhaFZrRXBzMzA3bWJkVnVLZXZud3NxQ1dyZnlL?=
 =?utf-8?B?dGY2eVd5Q0R1L3dNMzkyVXpjVFM5V0hydG1DWDBMZlZ4UlVlaVdoQUlEU3pN?=
 =?utf-8?B?YjhnRzZoaXR4eE4xeFJGU2Z6KzBIVkdHdkNXUnpwSXRSaHgyTFA3bWg0ZU9a?=
 =?utf-8?B?Tmp4djNYNGZIV0lxNWFwNVdhWld1ZGpCdkQ1R3lieURLNXRpdm5XWEh1R1pB?=
 =?utf-8?B?TFZ6KzNadDNkVjdQVVlKazVnM1JiWmRBb2szQ0hicjRFNjgvSUUxRlo0YmVG?=
 =?utf-8?B?UFhzOHdQNFFucjZJTzNQY2Z4NXNFcldxS2dUNmJFV3BNYTEva1lmTllxYzZw?=
 =?utf-8?B?U28vcFFDcUN6aUhmRnd5SkxrTWtFRTJrdDFyWkhZMENQb0ZwbUwzay9td2I3?=
 =?utf-8?B?TnB1cDE3aU1zTi9KTEd3ays2RnZSZ0FtcjlLcFBLV3lrYkJudHNmTFhDTVBy?=
 =?utf-8?B?UVErZWRrQjQ1T1UzaklIZ0wvUjNDZStGQ3VFTmo3YlU2blFxSWNYL052dDlz?=
 =?utf-8?B?bmtkaHJuZ1BRY0gvQlFPR0xIdFJDaHZ5M0JJVStpNFo1c1I5a3RVMnp3S3lj?=
 =?utf-8?B?bmxJb2pyenJGR1FETC9Ka2c0ZzNlTmxFZ1VRZHF6bnBOazgyS3hqRHlNT20w?=
 =?utf-8?B?VXgwZ0U1dkpieGtGdTA1NWp3SDhIcHhkaUxqdkh1ZWJYalFOeW1xZ2dOcncv?=
 =?utf-8?B?NTlPRHg1Y01DS2dxbDZQN2thM1V4L1Bkc0l3ZWhIc0JhRlZtREQvOGgxb2wz?=
 =?utf-8?B?QlA0M2NqcjJFV3F6U2lhYlBEQ0Z6SkFIL01Pam1Xa2d6cWdubjZBT0Y0MFBH?=
 =?utf-8?B?RXo0V3R2U0JkN050bFBOV3VYclRhSVUydkZOR2VycjQvM0JNdjV6K1Z2d2VR?=
 =?utf-8?B?eW5TZDJLOEk1MFZ4WTl4V2YySGpGeTlMYjMxbnIrSkJEbGdrSGQySXlQdkI2?=
 =?utf-8?B?TFZZQjFCeWl1VFFINEZ3TElzYnpBdXg0VlpKMHBnM2t4cGJzNjg2aFpGamFU?=
 =?utf-8?B?cmNuTitETjFvNHlBR05WQUd6TmZmYThobVJjc09GeVVDcnY0MzYxZnRlUDFX?=
 =?utf-8?B?anFWVW1SYVRmK2VSS1ozWXgyWDlaZ2dMRDJYd1BsQjh5Skk4WGdCQlpKMUdI?=
 =?utf-8?B?L2ltZW1wbExjTU43TUt4Y3ROcDIvNEhIc1J4VEs1Z21mUnZEWW9TS1FZRnJm?=
 =?utf-8?B?WnVlN0JCVmtRZkhYOGloYUFiOHBKM0RzOGl1R2ZEVlBvbUhhWXpDdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7DDC1329BF341641ADA9F631DCF82296@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73228d1b-7dfa-45cd-5166-08d9e64bb308
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 12:58:24.5551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: N4J84R3rAWM2eHTJ+BoORDGgp+Yyfpb2d8mN1EQwxfvZuQjNok4ycH6EWaZvjuUVAmHIy6K1T/GMLf13yZZZim63bfyb42yFscJY6wS8bo6+0x509g+o05ZQL2gZDBVc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7127
X-Proofpoint-GUID: knZGPBEh3NcNIH9aUXAVh-VGBql7XCoh
X-Proofpoint-ORIG-GUID: knZGPBEh3NcNIH9aUXAVh-VGBql7XCoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=643 adultscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020071

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxMzowNywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDdQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gUmVzZXQgdGhlIGNvbW1hbmQg
cmVnaXN0ZXIgd2hlbiBwYXNzaW5nIHRocm91Z2ggYSBQQ0kgZGV2aWNlOg0KPj4gaXQgaXMgcG9z
c2libGUgdGhhdCB3aGVuIHBhc3NpbmcgdGhyb3VnaCBhIFBDSSBkZXZpY2UgaXRzIG1lbW9yeQ0K
Pj4gZGVjb2RpbmcgYml0cyBpbiB0aGUgY29tbWFuZCByZWdpc3RlciBhcmUgYWxyZWFkeSBzZXQu
IFRodXMsIGENCj4+IGd1ZXN0IE9TIG1heSBub3Qgd3JpdGUgdG8gdGhlIGNvbW1hbmQgcmVnaXN0
ZXIgdG8gdXBkYXRlIG1lbW9yeQ0KPj4gZGVjb2RpbmcsIHNvIGd1ZXN0IG1hcHBpbmdzIChndWVz
dCdzIHZpZXcgb2YgdGhlIEJBUnMpIGFyZQ0KPj4gbGVmdCBub3QgdXBkYXRlZC4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hj
aGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHYxOg0KPj4gICAtIGRvIG5vdCB3cml0
ZSAwIHRvIHRoZSBjb21tYW5kIHJlZ2lzdGVyLCBidXQgcmVzcGVjdCBob3N0IHNldHRpbmdzLg0K
PiBUaGVyZSdzIG5vdCBtdWNoIHJlc3BlY3Qgb2YgaG9zdCBzZXR0aW5nIGhlcmUsIGFyZSB5b3Ug
YXJlIGJhc2ljYWxseQ0KPiB3cml0aW5nIDAgZXhjZXB0IGZvciB0aGUgSU5UWF9ESVNBQkxFIHdo
aWNoIHdpbGwgYmUgc2V0IGlmIE1TSShYKSBpcw0KPiBlbmFibGVkLg0KWWVzLCBhbmQgdGhpcyBp
cyBiZWNhdXNlIHdlIG9ubHkgc3VwcG9ydCBJTlRYIGVtdWxhdGlvbiBhdCB0aGUNCm1vbWVudA0K
Pg0KPiBJIHdvbmRlciB3aGV0aGVyIHlvdSByZWFsbHkgbmVlZCB0aGlzIGFueXdheS4gSSB3b3Vs
ZCBleHBlY3QgdGhhdCBhDQo+IGRldmljZSB0aGF0J3MgYmVpbmcgYXNzaWduZWQgdG8gYSBndWVz
dCBoYXMganVzdCBiZWVuIHJlc2V0IGdsb2JhbGx5LA0KPiBzbyB0aGVyZSBzaG91bGQgYmUgbm8g
bmVlZCB0byByZXNldCB0aGUgY29tbWFuZCByZWdpc3RlciBleHBsaWNpdGx5Lg0KIEZyb20gbXkg
ZXhwZXJpZW5jZSBpdCB3YXMgYSByZWFsIGNhc2Ugd2hlbiB0aGUgZGV2aWNlIHdhcyBub3QNCnJl
c2V0IG1ha2luZyB0cm91Ymxlcy4gSSdsbCByZW1vdmUgdGhpcyBwYXRjaCBmb3Igbm93IGFuZCBz
ZWUgaWYNCkkgY2FuIHN0aWxsIHJ1biB3aXRob3V0IGl0IHJlbHlpbmcgb24gdGhlIGRldmljZSBy
ZXNldCB3aGljaCBtdXN0DQpiZSBpbiBwbGFjZSB3aGlsZSBhc3NpZ25pbmcgYSBQQ0kgZGV2aWNl
IChoZXJlIHdlIHJlbHkgb24gdGhlDQp0b29sc3RhY2ssIHJpZ2h0PykuDQo+DQo+IFRoYW5rcywg
Um9nZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

