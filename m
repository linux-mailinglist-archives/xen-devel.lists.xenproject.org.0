Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9154758C6
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 13:23:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247360.426523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTJ1-0004vc-42; Wed, 15 Dec 2021 12:22:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247360.426523; Wed, 15 Dec 2021 12:22:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxTJ1-0004sl-0h; Wed, 15 Dec 2021 12:22:47 +0000
Received: by outflank-mailman (input) for mailman id 247360;
 Wed, 15 Dec 2021 12:22:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9HFQ=RA=epam.com=prvs=2983c13036=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mxTIy-0004sZ-Na
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 12:22:44 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3867362-5da1-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 13:22:43 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BFBQZMk002244;
 Wed, 15 Dec 2021 12:22:38 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3cyab5seg5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 12:22:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6322.eurprd03.prod.outlook.com (2603:10a6:20b:15e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Wed, 15 Dec
 2021 12:22:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::7593:b5e4:6534:5e55%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 12:22:32 +0000
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
X-Inumbo-ID: b3867362-5da1-11ec-85d3-df6b77346a89
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffmsccOMbMiM4Y/vkmmomPdx8GVfot+ziwaR8CPAWr1WjG89iGY6a1zAG0l9yptEJkHfNZJSjJt66Xwd1rS9rxSHj0e0rSWH1JIxlxx/KPmwykSR/zPtxm76r4tYl4DAqsGTiMzHKCQ42pXuan6khR4jxeKjppvjHYcS8Z9RBHpA379UWXzhNmRdsRwZqZbs5jyEJS9Eg3bcysjMvUQN3prtlQ1INVx0ABLpi2csF8hP7u4cQC1d4HM+BQL2Yife6rhyFP8FrwbYbcgdrU+lHB8i/PP5yZZqp+qGEDAAOQ8OxUJjz4b1mQ0IP3UFCXRIt0ZD/ULLZez0+BiPj2y17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7Lmew5aTXMFWs8lqfXf2jDqzpQ45MYbLfcf86EDmaI=;
 b=ZLS0dy5y/+jyDyUiC+x8pGEWsI7erEP8nkxmZOKShjO/Sfb1HYnjGfO2VCI0sz8Js9DtyDGPLQ4d24epGpDUmA5SVLOb+hE9sxsnccHj7FDNuDhY0SZAmd/dS1IE1FwYjS8jH32D12GlNiODdgzMY9e+ZOO9LRk/M7msx7N4Q777lF/2lJPFDzQgrgybaPXWfkYJIHKPg3e+kCmifG95GfXrL17osE9IiHQQ1uQuDVZ/iW0WUuYxuxGNf1RX9eGn6LsrbLzmuPYeklQBWAQv39CtoVR/ETS/Cb0jeZVNXyBfTFycSAggqPxrbiVVoPrFv7qmHrOuZIIyoSz/qNm0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7Lmew5aTXMFWs8lqfXf2jDqzpQ45MYbLfcf86EDmaI=;
 b=qG90m6rMGZTWkJEH774v34H6DQQxnxvYJMb7NZkETd//axI/RlgVeaoBr/F69AkrasjHzvOILBdz8rSY3gnEk63Ps7x/n9bCQ7WttWJQIi3W7XCo07n4XCtZ4t8oUQN1c83g77IjhS7iCJnF1pVDF+Wm2znxZMz6u3dxsSm4OtPCSt4xRWotHQiefxmIYM6ljqvhG3rx2pkdLxvUmgkBf1Fu/5hH2MnysiSy6qbReANB1RfOaelPfX7bhIerywoyDtfRGMVo6XfoLKgbUJQUuWTTSfyhPljS9M0zfBX5cGEAcwM5q9niJN2+SKzVedtdiHEqOhDU2ZoxkJ8dNjF8Gg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Wei Liu <wl@xen.org>
Subject: Re: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v5 00/14] PCI devices passthrough on Arm, part 3
Thread-Index: AQHX4ewD/fiBagJockWfLYQGw/ZN1KwzkeKAgAAC9ICAAAQugA==
Date: Wed, 15 Dec 2021 12:22:32 +0000
Message-ID: <1103f95b-3345-f28f-1eed-7f26328d67fa@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <3a9f16d5-f076-92e2-f1b9-33a3c1a3371b@epam.com>
 <79466492-fd58-1be0-c47e-13fc1e17479d@suse.com>
In-Reply-To: <79466492-fd58-1be0-c47e-13fc1e17479d@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b037afab-0e6a-4ed6-f03b-08d9bfc59197
x-ms-traffictypediagnostic: AM0PR03MB6322:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB63225E0049B49222788E2427E7769@AM0PR03MB6322.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tKaFGIv9bHxQ3yGCsSgKPkOtOuCtHWTbtcdt3pI5dqgIj0sooGVr8ZP9eoiuXLgwCht0BD9o0rs2qRSs/0TOo5T5l+SsdumliFu6u4/UO2JkCscj7wt4mQ5Z61TBVi8fkHkseG+HCXfpj3NcsvHh0j/SVnKwjdpEa5lvlooJrI1i18wF650V1UrfZDbk/C4oWmgklpt7hr3ptAqlJVwV+EOEFiBFERmLVasGgKgKMYsyaqlXx4QcDjodp2GFo6qh/3kkfAhH0aQ+UHdlXkfYHXuWGGdLiP5EzYaK+xBAQ6sIxLvXyw+LCdYL17XjxiszUYvubnZXRleANZ7O5ds6Hwdd7wPZ9wfMjnLg3oCKLrq17vetHz/OInYKfpDdC3IMhRiZXxRgAWPz3X1iedag1BYyFkxP/wTIj8NE1RjydpLXBysVbj6Ec/9hhLOt09gtxhWhZ2zNcH971hLCnBV6nTQOV6sFifIkcyPMTi1IG795mYaQs9zBmVbVPsPm6O7iSY1xNUZNieMWg3yq+AvE44yRTwTi8US2wAVpQTaWDAjBrdLGUSOy0OAxKlNzX1MuxtXmcQDaYbDPmyzXhB81UVrB2eh3fR7evjrDpNvEAfqCpDHh/tWJkdDVCDsQ7hAgB2N9McnIuhuAwkrMU0yt9ZnB0egQZjlz03dHF8HDakKtEQmriFMPl01/BmCEBB85DcwG3mARkhWBKzyTmyZNs6TpyWYCHWCLJ0YumezGuDDaVIefAWRhtx+6FiCYplb1p23ns/buVMR/rVrykvVbPSz9v9sV8HHsF7T4u7jo3mlEjTXz+kc2d2yhxiiGTO5lJGr/D/FV7t9Ig6a5y2ZSfA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7416002)(36756003)(38100700002)(8936002)(71200400001)(31686004)(6486002)(186003)(26005)(38070700005)(55236004)(5660300002)(8676002)(966005)(31696002)(86362001)(66946007)(66556008)(66476007)(53546011)(6512007)(6506007)(64756008)(4326008)(2906002)(316002)(6916009)(76116006)(91956017)(2616005)(83380400001)(66446008)(508600001)(122000001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RG5oa1h3Y0g5Y1RTSmV6ZXcrNUZ4dkp6OFN6UElIQjNPcWFabmROdWx6ODNV?=
 =?utf-8?B?YTRIV2RZWndjcEhycXhscjMvcFFUdDZXejZYWW95SDFrcDBJNzQ4VFp5Rmdk?=
 =?utf-8?B?aTFGVFdFeEpSWWhVRWxLemlKeENSTnhjN0JLd1RMc3R5ck9UOVZXZHgzd2gy?=
 =?utf-8?B?NTduc0ExcXNKcVdHMFNDak9nczNuU1g5NXBTNktWVVVIQ2s5WVdPcTg5ajR6?=
 =?utf-8?B?L2syWlUwUksyTkUvTitDWFU5YUIwYXBWUDRtTWZMWC9Nd0ZpeFM0Ri9QQXZO?=
 =?utf-8?B?ejFvZmQ1UnFGKzJTMkViRmxvYytMS0w0bU91MzQ0NCs2Z0JNeVVsd254Qzg0?=
 =?utf-8?B?T2NmczBwb0VJRlJJUzdaQ1d4aXcrYmNJdSthTm9JWllvRjEwTkdISGsyanlr?=
 =?utf-8?B?bC9UdlFBN0xjVEdlb0t2c1ptZFJ1RzV2V2pVM1RJa2l3eVYyYjA2MFFUdTZw?=
 =?utf-8?B?V0d6MW45TmNhN0NpNzJkL0ZBVkRjNG9CMHVLeHkxL2JCNTA4M3dtVnFlRVRq?=
 =?utf-8?B?cUYrdWNmMXkwMHZMMjJsMWVsanRFOFMzaDB3ZVhYcXY5WDZNM2VLd1FvbktX?=
 =?utf-8?B?dFQyL0hUZ0dra3B2YzMxN2czYVNJOG0zenRQTUY3ZGgxZUg2QVNxSXJydExZ?=
 =?utf-8?B?OWVKR2RhdXBuQU5NQlBXZ1VSQWxtSlpUM3V6S0NBWlI5SlNoZUwvQ1M1Qzhs?=
 =?utf-8?B?Q1VyUFY1VCtQbUFKTExSMFFBb1RFc1VvRUpoMXF4YWEzemRUbHVFd2hZVEVE?=
 =?utf-8?B?Q2xEV21oQTM2dzVUejE5SEFFdit6V3VDQmVSRzJqRnlnaE12RkZFM2RuTnI4?=
 =?utf-8?B?Qlp4RE1YbEp4d1pvYXBQYW4wNmRuTzY3RVRCZ3VCVXhaamJmdkpvMk1IZm84?=
 =?utf-8?B?T1IraElLcVcxcGNSbmFtYVNOQUhYZEk5K3J2ZmY4OHg5V2VNNldyK1Q1MVZV?=
 =?utf-8?B?NUJqSVVwRDgxU1lFeUtYMFNHekoweXlOUXNTL0ZLRkp0ZVBlSVJYMUFiQklM?=
 =?utf-8?B?R2V0d0RWdktxN0RmQVh1WmZnZlFkMHB4WDBWbytLeTU3a0U0MUVEaE9RTVE0?=
 =?utf-8?B?V3lSUlpTMEQ2ZnZJZzQzYXljdFU3ZVg3VExNQklueC9zTTUyVzlvK2Q4cXJk?=
 =?utf-8?B?VzNlV1ZjUXUwM3liWkt0enc5LzBXU1hKdllEOUI0VDhtOTR2dWlqdEU1SU03?=
 =?utf-8?B?MUlacVZHUS9YZGRhdVF4SHNYYmd0YWgzWnNQdU51R0hpblI1eDhRdWthaGh6?=
 =?utf-8?B?YnN0NGpvak9kWmxWSlR1MzFTWVpiWHluWVVMWVAxWVlveGlQeGFPaThabUp5?=
 =?utf-8?B?Nkh4Zzg2cjJsangzcXVlbjRsQS9UTWMzMFZNb1hvVW1DT2I1YlJ1NEpQZzRw?=
 =?utf-8?B?U0svU1prWE1DZkNDSjY3Q0JuREk5cDFtZ214Ykk1bXhMbnJscUdSSmM3cmlW?=
 =?utf-8?B?bDJEY085UDk2WUhveFhTRHhXRzJyZVYrbGF0a1FhM1R0R2xJcU0xUTB3ZXQx?=
 =?utf-8?B?RUt3QjFLSU1rYlhWUVJUWTVxd05FOUlweGhlNm16dTExSDlMdU9rZlUxbHkx?=
 =?utf-8?B?V1ZKRmExck1aOHlVVm9kM0trSm8zNTZTTG5SbUFsQldJdzBZa1FUM1YwaGdO?=
 =?utf-8?B?d0RwUjYzbDJOQVcyWkJ1WEhRYkhxV29aN2tCbDY4WWNTTFFCOGJWU1Z3RDRG?=
 =?utf-8?B?d1d0Z3FUWUg0ZGx1MlZXdXZIeDZuZzhtblQ4cDRSYnM0MEV6RS9rSWl4bjhi?=
 =?utf-8?B?RGFIUnpXdFppdWpicWhnbnVQeXF2SERkd2JoQVFheFZJaGpEaWt6YllpTTZh?=
 =?utf-8?B?WjRSaUVITDVjVC9KRWF6NCtHMGIwSEtac2E5S1ZLZzhFNVF4NHBGRE9yMFBD?=
 =?utf-8?B?aFN6L3VrcFdGdTB4SHJnWkdDcDN1VzJyK0JFcWw1eTFxRlg2ZDRMSGtQZEsv?=
 =?utf-8?B?d3NDMVJqdVJ6V2hWd0xYaGEyUFZ6M2RsdHBvU29xaXZuZnEzTTNlNmlxS3FW?=
 =?utf-8?B?V2MrRzM5ZkdESHFWY01VejNMWU45RU0zYmlzdW5KWDBROWF6bmxVa290KzRD?=
 =?utf-8?B?Z0pORHFRVmJXNGdQU2lIMTJJRkJDbDZaTHFXS3Q2cUk1Q0wybXN1cEhYeFdW?=
 =?utf-8?B?U3ZacUFzTW02ZzRKTzhNRFRncHZZcStOQ2Niem05QzNnWmRSRmYyUEo1bmxz?=
 =?utf-8?B?amZUQ0tFdHpNNXBUZ1FXbCtLajYyOU5YT3Q5MXZVQXk3ZVJNQ0sxM3BHT0k3?=
 =?utf-8?B?RHM0bzVTZjJxTUk1Q2ZwdEhRSElaT1paOE9GRWhscU5NVWVSakJtOG00UGRo?=
 =?utf-8?B?VzVlWUwwd2lrTW5ROXBtNjJxSDU3R0U1OSt2VmVzQVk5SzZla1pydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C53BE81991C8DB40917050CC5D1694B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b037afab-0e6a-4ed6-f03b-08d9bfc59197
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Dec 2021 12:22:32.1127
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3fOrcfYjYumA1U2PxNlXYXt92LXP5WjGCqLWm8TvFrkTnBcdnLXharU/9Da74CTl4H9xBM4nZmcFMshoRzBhUOuBSCoaiD9XFffhQPTL2FbH8McWcUE9iRMTzY6cgNKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6322
X-Proofpoint-ORIG-GUID: W6S605BpcYgiDZb2Gk-lrnn3lMjohTyI
X-Proofpoint-GUID: W6S605BpcYgiDZb2Gk-lrnn3lMjohTyI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_08,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150069

SGksIEphbiENCg0KT24gMTUuMTIuMjEgMTQ6MDcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAx
NS4xMi4yMDIxIDEyOjU2LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IERlYXIg
cmVzdCBtYWludGFpbmVycyENCj4+DQo+PiBDb3VsZCB5b3UgcGxlYXNlIHJldmlldyB0aGlzIHNl
cmllcyB3aGljaCBzZWVtcyB0byBnZXQgc3R1Y2s/DQo+IEkgZG9uJ3Qgc2VlbSB0byBoYXZlIGFu
eSByZWNvcmQgb2YgeW91IGhhdmluZyBwaW5nZWQgUm9nZXIgYXMgdGhlIHZQQ0kNCj4gbWFpbnRh
aW5lci4NCk5vLCBJIGRpZG4ndC4gUm9nZXIgaXMgb24gQ0MsIHNvIGhlIG1pZ2h0IHNoZWQgc29t
ZSBsaWdodCBvbiB3aGVuIGl0IG1pZ2h0DQpoYXBwZW4sIHNvIHdlLCB0aG9zZSB3aG8gd29yayBv
biBQQ0kgcGFzc3Rocm91Z2ggb24gQXJtLA0KY2FuIGFsc28gcGxhbiB0aGUgcmVsZXZhbnQgdXBj
b21pbmcgKHJlKXdvcms6IHdlIHN0aWxsIG1pc3MgTVNJL01TSS1YIGFuZA0KSU9NTVUgc2VyaWVz
IHdoaWNoIGRvIGRlcGVuZCBvbiB0aGlzIG9uZQ0KPiAgIEFsc28sIGFzIHNhaWQgb24gdGhlIENv
bW11bml0eSBDYWxsIHdoZW4gZGlzY3Vzc2luZyB0aGlzLA0KPiBJIGRvbid0IHRoaW5rIEknZCB2
aWV3IHRoaXMgc2VyaWVzIGFzIGluIGEgc3RhdGUgd2hlcmUgYW4gZW1lcmdlbmN5DQo+IGZhbGxi
YWNrIHRvIFJFU1Qgd291bGQgYmUgYXBwcm9wcmlhdGUuDQpObyBlbWVyZ2VuY3kgaGVyZSwgYnV0
IHY1IHdpdGhvdXQgYW55IGFjay9uYWNrIG1pZ2h0IHJpbmcgYSBiZWxsDQpXaGljaCBtYWRlIG1l
IHdyaXRlIHRoaXMgZS1tYWlsDQo+ICAgQXMgaW5kaWNhdGVkLCBpbiBwYXJ0aWN1bGFyIEkNCj4g
d291bGRuJ3Qgd2FudCB0byBjb21taXQgYW55IG9mIGl0IHdpdGhvdXQgUm9nZXIncyBiYXNpYyBh
Z3JlZW1lbnQuDQpUaGlzIGlzIGNsZWFyIGFzIGl0IGlzIHVwIHRvIHRoZSByZWxldmFudCBtYWlu
dGFpbmVyIHRvIGNvbW1pdCB3aGljaA0KSSBtaWdodCBub3QgZXhwZWN0IGZyb20gdGhlIHJlc3Qg
bWFpbnRhaW5lcnMNCj4gICBJT1cNCj4gd2hpbGUgUkVTVCBtYWludGFpbmVyIHJldmlld3MgbWF5
IGhlbHAgbWFraW5nIHByb2dyZXNzIChidXQgYXMgbXVjaA0KPiB3b3VsZCByZXZpZXdzIGJ5IGFu
eW9uZSBlbHNlKSwNClRoaXMgaXMgbXkgZ29hbDogdG8gaGF2ZSBhY2svbmFjayBhdCBsZWFzdCBm
cm9tIHRoZSBSRVNUIG1haW5hdGFpbmVycw0KPiAgIHRoZXkgbWF5IG5vdCBwdXQgdGhlIHNlcmll
cyBpbiBhIHN0YXRlDQo+IHdoZXJlIGl0IGNvdWxkIGdvIGluLg0KRmFpciBlbm91Z2gNCj4NCj4g
SW4gYW55IGV2ZW50LCBhcyBhbHNvIHNhaWQgb24gdGhlIGNhbGwsIGFmYWljIHRoaXMgc2VyaWVz
IGlzIGluIG15IHRvLQ0KPiBiZS1yZXZpZXdlZCBmb2xkZXIsDQpBcHByZWNpYXRlIHRoaXMNCj4g
ICBhbG9uZ3NpZGUgYSBmZXcgZG96ZW4gbW9yZSBwYXRjaGVzLiBJJ2xsIGdldCB0byBpdA0KPiBp
ZiBub2JvZHkgZWxzZSB3b3VsZCwgYnV0IEkgY2FuJ3QgcHJlZGljdCB3aGVuIHRoYXQncyBnb2lu
ZyB0byBiZS4NClRoYW5rIHlvdQ0KPiBUaGVyZSdzIHNpbXBseSB0b28gbXVjaCBvdGhlciBzdHVm
ZiBpbiBuZWVkIG9mIHRha2luZyBjYXJlIG9mLg0KU3VyZSwgb3VyIGNvbXBhbmllcyBkbyB3YW50
IHVzIHRvIGRvIHNvbWV0aGluZyB1c2VmdWwgZm9yIHRoZW0gYXMgd2VsbCwgYnV0IHJldmlldw0K
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHINCj4NCj4gSmFuDQo+DQo+PiBUaGFuayB5b3UgaW4gYWR2
YW5jZSwNCj4+IE9sZWtzYW5kcg0KPj4NCj4+IE9uIDI1LjExLjIxIDEzOjAyLCBPbGVrc2FuZHIg
QW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBIaSwgYWxsIQ0KPj4+
DQo+Pj4gMS4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgZm9jdXNpbmcgb24gdlBDSSBhbmQgYWRkcyBz
dXBwb3J0IGZvciBub24taWRlbnRpdHkNCj4+PiBQQ0kgQkFSIG1hcHBpbmdzIHdoaWNoIGlzIHJl
cXVpcmVkIHdoaWxlIHBhc3NpbmcgdGhyb3VnaCBhIFBDSSBkZXZpY2UgdG8NCj4+PiBhIGd1ZXN0
LiBUaGUgaGlnaGxpZ2h0cyBhcmU6DQo+Pj4NCj4+PiAtIEFkZCByZWxldmFudCB2cGNpIHJlZ2lz
dGVyIGhhbmRsZXJzIHdoZW4gYXNzaWduaW5nIFBDSSBkZXZpY2UgdG8gYSBkb21haW4NCj4+PiAg
ICAgYW5kIHJlbW92ZSB0aG9zZSB3aGVuIGRlLWFzc2lnbmluZy4gVGhpcyBhbGxvd3MgaGF2aW5n
IGRpZmZlcmVudA0KPj4+ICAgICBoYW5kbGVycyBmb3IgZGlmZmVyZW50IGRvbWFpbnMsIGUuZy4g
aHdkb20gYW5kIG90aGVyIGd1ZXN0cy4NCj4+Pg0KPj4+IC0gRW11bGF0ZSBndWVzdCBCQVIgcmVn
aXN0ZXIgdmFsdWVzIGJhc2VkIG9uIHBoeXNpY2FsIEJBUiB2YWx1ZXMuDQo+Pj4gICAgIFRoaXMg
YWxsb3dzIGNyZWF0aW5nIGEgZ3Vlc3QgdmlldyBvZiB0aGUgcmVnaXN0ZXJzIGFuZCBlbXVsYXRl
cw0KPj4+ICAgICBzaXplIGFuZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlzIGRvbmUgZHVyaW5n
IFBDSSBkZXZpY2UgZW51bWVyYXRpb24gYnkNCj4+PiAgICAgdGhlIGd1ZXN0Lg0KPj4+DQo+Pj4g
LSBJbnN0ZWFkIG9mIGhhbmRsaW5nIGEgc2luZ2xlIHJhbmdlIHNldCwgdGhhdCBjb250YWlucyBh
bGwgdGhlIG1lbW9yeQ0KPj4+ICAgICByZWdpb25zIG9mIGFsbCB0aGUgQkFScyBhbmQgUk9NLCBo
YXZlIHRoZW0gcGVyIEJBUi4NCj4+Pg0KPj4+IC0gVGFrZSBpbnRvIGFjY291bnQgZ3Vlc3QncyBC
QVIgdmlldyBhbmQgcHJvZ3JhbSBpdHMgcDJtIGFjY29yZGluZ2x5Og0KPj4+ICAgICBnZm4gaXMg
Z3Vlc3QncyB2aWV3IG9mIHRoZSBCQVIgYW5kIG1mbiBpcyB0aGUgcGh5c2ljYWwgQkFSIHZhbHVl
IGFzIHNldA0KPj4+ICAgICB1cCBieSB0aGUgaG9zdCBicmlkZ2UgaW4gdGhlIGhhcmR3YXJlIGRv
bWFpbi4NCj4+PiAgICAgVGhpcyB3YXkgaGFyZHdhcmUgZG9hbWluIHNlZXMgcGh5c2ljYWwgQkFS
IHZhbHVlcyBhbmQgZ3Vlc3Qgc2Vlcw0KPj4+ICAgICBlbXVsYXRlZCBvbmVzLg0KPj4+DQo+Pj4g
Mi4gVGhlIHNlcmllcyBhbHNvIGFkZHMgc3VwcG9ydCBmb3IgdmlydHVhbCBQQ0kgYnVzIHRvcG9s
b2d5IGZvciBndWVzdHM6DQo+Pj4gICAgLSBXZSBlbXVsYXRlIGEgc2luZ2xlIGhvc3QgYnJpZGdl
IGZvciB0aGUgZ3Vlc3QsIHNvIHNlZ21lbnQgaXMgYWx3YXlzIDAuDQo+Pj4gICAgLSBUaGUgaW1w
bGVtZW50YXRpb24gaXMgbGltaXRlZCB0byAzMiBkZXZpY2VzIHdoaWNoIGFyZSBhbGxvd2VkIG9u
DQo+Pj4gICAgICBhIHNpbmdsZSBQQ0kgYnVzLg0KPj4+ICAgIC0gVGhlIHZpcnR1YWwgYnVzIG51
bWJlciBpcyBzZXQgdG8gMCwgc28gdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVuDQo+Pj4gICAgICBh
cyBlbWJlZGRlZCBlbmRwb2ludHMgYmVoaW5kIHRoZSByb290IGNvbXBsZXguDQo+Pj4NCj4+PiAz
LiBUaGUgc2VyaWVzIGhhcyBjb21wbGV0ZSByZS13b3JrIG9mIHRoZSBsb2NraW5nIHNjaGVtZSB1
c2VkL2Fic2VudCBiZWZvcmUgd2l0aA0KPj4+IHRoZSBoZWxwIG9mIHRoZSB3b3JrIHN0YXJ0ZWQg
YnkgUm9nZXIgWzFdOg0KPj4+IFtQQVRDSCB2NSAwMy8xM10gdnBjaTogbW92ZSBsb2NrIG91dHNp
ZGUgb2Ygc3RydWN0IHZwY2kNCj4+Pg0KPj4+IFRoaXMgd2F5IHRoZSBsb2NrIGNhbiBiZSB1c2Vk
IHRvIGNoZWNrIHdoZXRoZXIgdnBjaSBpcyBwcmVzZW50LCBhbmQNCj4+PiByZW1vdmFsIGNhbiBi
ZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jaywgaW4gb3JkZXIgdG8gbWFrZQ0KPj4+
IHN1cmUgdGhlcmUgYXJlIG5vIGFjY2Vzc2VzIHRvIHRoZSBjb250ZW50cyBvZiB0aGUgdnBjaSBz
dHJ1Y3QuDQo+Pj4gUHJldmlvdXNseSByZW1vdmFsIGNvdWxkIHJhY2Ugd2l0aCB2cGNpX3JlYWQg
Zm9yIGV4YW1wbGUsIHNpbmNlIHRoZQ0KPj4+IGxvY2sgd2FzIGRyb3BwZWQgcHJpb3IgdG8gZnJl
ZWluZyBwZGV2LT52cGNpLg0KPj4+IFRoaXMgYWxzbyBzb2x2ZXMgc3luY2hyb25pemF0aW9uIGlz
c3VlcyBiZXR3ZWVuIGFsbCB2UENJIGNvZGUgZW50aXRpZXMNCj4+PiB3aGljaCBjb3VsZCBydW4g
aW4gcGFyYWxsZWwuDQo+Pj4NCj4+PiA0LiBUaGVyZSBpcyBhbiBvdXRzdGFuZGluZyBUT0RPIGxl
ZnQgdW5pbXBsZW1lbnRlZCBieSB0aGlzIHNlcmllczoNCj4+PiBmb3IgdW5wcml2aWxlZ2VkIGd1
ZXN0cyB2cGNpX3tyZWFkfHdyaXRlfSBuZWVkIHRvIGJlIHJlLXdvcmtlZA0KPj4+IHRvIG5vdCBw
YXNzdGhyb3VnaCBhY2Nlc3NlcyB0byB0aGUgcmVnaXN0ZXJzIG5vdCBleHBsaWNpdGx5IGhhbmRs
ZWQNCj4+PiBieSB0aGUgY29ycmVzcG9uZGluZyB2UENJIGhhbmRsZXJzOiB3aXRob3V0IGZpeGlu
ZyB0aGF0IHBhc3N0aHJvdWdoDQo+Pj4gdG8gZ3Vlc3RzIGlzIGNvbXBsZXRlbHkgdW5zYWZlIGFz
IFhlbiBhbGxvd3MgdGhlbSBmdWxsIGFjY2VzcyB0bw0KPj4+IHRoZSByZWdpc3RlcnMuDQo+Pj4N
Cj4+PiBYZW4gbmVlZHMgdG8gYmUgc3VyZSB0aGF0IGV2ZXJ5IHJlZ2lzdGVyIGEgZ3Vlc3QgYWNj
ZXNzZXMgaXMgbm90DQo+Pj4gZ29pbmcgdG8gY2F1c2UgdGhlIHN5c3RlbSB0byBtYWxmdW5jdGlv
biwgc28gWGVuIG5lZWRzIHRvIGtlZXAgYQ0KPj4+IGxpc3Qgb2YgdGhlIHJlZ2lzdGVycyBpdCBp
cyBzYWZlIGZvciBhIGd1ZXN0IHRvIGFjY2Vzcy4NCj4+Pg0KPj4+IEZvciBleGFtcGxlLCB3ZSBz
aG91bGQgb25seSBleHBvc2UgdGhlIFBDSSBjYXBhYmlsaXRpZXMgdGhhdCB3ZSBrbm93DQo+Pj4g
YXJlIHNhZmUgZm9yIGEgZ3Vlc3QgdG8gdXNlLCBpLmUuOiBNU0kgYW5kIE1TSS1YIGluaXRpYWxs
eS4NCj4+PiBUaGUgcmVzdCBvZiB0aGUgY2FwYWJpbGl0aWVzIHNob3VsZCBiZSBibG9ja2VkIGZy
b20gZ3Vlc3QgYWNjZXNzLA0KPj4+IHVubGVzcyB3ZSBhdWRpdCB0aGVtIGFuZCBkZWNsYXJlIHNh
ZmUgZm9yIGEgZ3Vlc3QgdG8gYWNjZXNzLg0KPj4+DQo+Pj4gQXMgYSByZWZlcmVuY2Ugd2UgbWln
aHQgd2FudCB0byBsb29rIGF0IHRoZSBhcHByb2FjaCBjdXJyZW50bHkgdXNlZA0KPj4+IGJ5IFFF
TVUgaW4gb3JkZXIgdG8gZG8gUENJIHBhc3N0aHJvdWdoLiBBIHZlcnkgbGltaXRlZCBzZXQgb2Yg
UENJDQo+Pj4gY2FwYWJpbGl0aWVzIGtub3duIHRvIGJlIHNhZmUgZm9yIHVudHJ1c3RlZCBhY2Nl
c3MgYXJlIGV4cG9zZWQgdG8gdGhlDQo+Pj4gZ3Vlc3QgYW5kIHJlZ2lzdGVycyBuZWVkIHRvIGJl
IGV4cGxpY2l0bHkgaGFuZGxlZCBvciBlbHNlIGFjY2VzcyBpcw0KPj4+IHJlamVjdGVkLiBYZW4g
bmVlZHMgYSBmYWlybHkgc2ltaWxhciBtb2RlbCBpbiB2UENJIG9yIGVsc2Ugbm9uZSBvZg0KPj4+
IHRoaXMgd2lsbCBiZSBzYWZlIGZvciB1bnByaXZpbGVnZWQgYWNjZXNzLg0KPj4+DQo+Pj4gNS4g
VGhlIHNlcmllcyB3YXMgYWxzbyB0ZXN0ZWQgb246DQo+Pj4gICAgLSB4ODYgUFZIIERvbTAgYW5k
IGRvZXNuJ3QgYnJlYWsgaXQuDQo+Pj4gICAgLSB4ODYgSFZNIHdpdGggUENJIHBhc3N0aHJvdWdo
IHRvIERvbVUgYW5kIGRvZXNuJ3QgYnJlYWsgaXQuDQo+Pj4NCj4+PiBUaGFuayB5b3UsDQo+Pj4g
T2xla3NhbmRyDQo+Pj4NCj4+PiBbMV0gaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3hlbi1kZXZlbC8yMDE4MDcxNzA5NDgzMC41NDgwNi0yLXJvZ2Vy
LnBhdUBjaXRyaXguY29tL19fOyEhR0ZfMjlkYmNRSVVCUEEhbnRETFEta2lvc0xMUERMR19EN0M3
U2RlYjFBZDFqLTQzWGp1Q0dUTWdlSk5ib0FOU3RzWUZQNmExaFI0M3M2N0dOdUZBeDdIdWckIFts
b3JlWy5da2VybmVsWy5db3JnXQ0KPj4+DQo+Pj4gT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gKDEz
KToNCj4+PiAgICAgcmFuZ2VzZXQ6IGFkZCBSQU5HRVNFVEZfbm9fcHJpbnQgZmxhZw0KPj4+ICAg
ICB2cGNpOiBmaXggZnVuY3Rpb24gYXR0cmlidXRlcyBmb3IgdnBjaV9wcm9jZXNzX3BlbmRpbmcN
Cj4+PiAgICAgdnBjaTogY2FuY2VsIHBlbmRpbmcgbWFwL3VubWFwIG9uIHZwY2kgcmVtb3ZhbA0K
Pj4+ICAgICB2cGNpOiBhZGQgaG9va3MgZm9yIFBDSSBkZXZpY2UgYXNzaWduL2RlLWFzc2lnbg0K
Pj4+ICAgICB2cGNpL2hlYWRlcjogaW1wbGVtZW50IGd1ZXN0IEJBUiByZWdpc3RlciBoYW5kbGVy
cw0KPj4+ICAgICB2cGNpL2hlYWRlcjogaGFuZGxlIHAybSByYW5nZSBzZXRzIHBlciBCQVINCj4+
PiAgICAgdnBjaS9oZWFkZXI6IHByb2dyYW0gcDJtIHdpdGggZ3Vlc3QgQkFSIHZpZXcNCj4+PiAg
ICAgdnBjaS9oZWFkZXI6IGVtdWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgZm9yIGd1ZXN0cw0K
Pj4+ICAgICB2cGNpL2hlYWRlcjogcmVzZXQgdGhlIGNvbW1hbmQgcmVnaXN0ZXIgd2hlbiBhZGRp
bmcgZGV2aWNlcw0KPj4+ICAgICB2cGNpOiBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvciB2aXJ0dWFs
IFBDSSBidXMgdG9wb2xvZ3kNCj4+PiAgICAgeGVuL2FybTogdHJhbnNsYXRlIHZpcnR1YWwgUENJ
IGJ1cyB0b3BvbG9neSBmb3IgZ3Vlc3RzDQo+Pj4gICAgIHhlbi9hcm06IGFjY291bnQgSU8gaGFu
ZGxlcnMgZm9yIGVtdWxhdGVkIFBDSSBNU0ktWA0KPj4+ICAgICB2cGNpOiBhZGQgVE9ETyBmb3Ig
dGhlIHJlZ2lzdGVycyBub3QgZXhwbGljaXRseSBoYW5kbGVkDQo+Pj4NCj4+PiBSb2dlciBQYXUg
TW9ubmUgKDEpOg0KPj4+ICAgICB2cGNpOiBtb3ZlIGxvY2sgb3V0c2lkZSBvZiBzdHJ1Y3QgdnBj
aQ0KPj4+DQo+Pj4gICAgdG9vbHMvdGVzdHMvdnBjaS9lbXVsLmggICAgICAgfCAgIDUgKy0NCj4+
PiAgICB0b29scy90ZXN0cy92cGNpL21haW4uYyAgICAgICB8ICAgNCArLQ0KPj4+ICAgIHhlbi9h
cmNoL2FybS92cGNpLmMgICAgICAgICAgIHwgIDMzICsrKy0NCj4+PiAgICB4ZW4vYXJjaC94ODYv
aHZtL3Ztc2kuYyAgICAgICB8ICAgOCArLQ0KPj4+ICAgIHhlbi9jb21tb24vcmFuZ2VzZXQuYyAg
ICAgICAgIHwgICA1ICstDQo+Pj4gICAgeGVuL2RyaXZlcnMvS2NvbmZpZyAgICAgICAgICAgfCAg
IDQgKw0KPj4+ICAgIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgIDExICsrDQo+Pj4g
ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyAgICAgfCAzNTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrLS0tLS0tLQ0KPj4+ICAgIHhlbi9kcml2ZXJzL3ZwY2kvbXNpLmMgICAgICAgIHwg
IDExICstDQo+Pj4gICAgeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgICAgICAgfCAgIDggKy0NCj4+
PiAgICB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAgICB8IDI1MiArKysrKysrKysrKysrKysr
KysrKystLS0NCj4+PiAgICB4ZW4vaW5jbHVkZS94ZW4vcGNpLmggICAgICAgICB8ICAgNiArDQo+
Pj4gICAgeGVuL2luY2x1ZGUveGVuL3Jhbmdlc2V0LmggICAgfCAgIDcgKy0NCj4+PiAgICB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCAgICAgICB8ICAgOCArDQo+Pj4gICAgeGVuL2luY2x1ZGUveGVu
L3ZwY2kuaCAgICAgICAgfCAgNDcgKysrKy0NCj4+PiAgICAxNSBmaWxlcyBjaGFuZ2VkLCA2NDQg
aW5zZXJ0aW9ucygrKSwgMTE3IGRlbGV0aW9ucygtKQ0KPj4+DQo=

