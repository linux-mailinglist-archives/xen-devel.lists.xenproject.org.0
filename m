Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81A64397CF
	for <lists+xen-devel@lfdr.de>; Mon, 25 Oct 2021 15:47:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215882.375295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0Ju-0002Nx-Sz; Mon, 25 Oct 2021 13:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215882.375295; Mon, 25 Oct 2021 13:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mf0Ju-0002Ku-Ps; Mon, 25 Oct 2021 13:47:22 +0000
Received: by outflank-mailman (input) for mailman id 215882;
 Mon, 25 Oct 2021 13:47:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1v/+=PN=epam.com=prvs=0932af52eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mf0Jt-0002Ki-Cd
 for xen-devel@lists.xenproject.org; Mon, 25 Oct 2021 13:47:21 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1294bc0c-359a-11ec-840f-12813bfff9fa;
 Mon, 25 Oct 2021 13:47:19 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19PCY7Ml013687; 
 Mon, 25 Oct 2021 13:47:18 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bwvjjrbrs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 25 Oct 2021 13:47:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB2832.eurprd03.prod.outlook.com (2603:10a6:800:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 13:47:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 13:47:15 +0000
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
X-Inumbo-ID: 1294bc0c-359a-11ec-840f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GwCcdh47L8HAA3NgVYMpszVp7CNwnSdAJVWreTuguCsEAbxrC9VKCyWZD60cv71lvpUBKL/Q0QtGmH2wjzm5c9MqABPKyfGfP/ieD4cIYw1e5LJs1phdezt8ElN9Cof/9/gjBbnGfKunaIxNtEiGNxvYGRfHJrpp3OD/4X0nnwArfDPxKoHKdyDKeYDFLv0rLe8vtOrwLwlcizEUUpFK6cCG/YkVXyKGNxwktMs7EH4nwFS3IHYTKJ9yqoNFk8pHK76KAt/tgGz8b1lZV0iDLJKWMBGqrh4u34cn/ekaMvbgUsCcayUg+oVXih9hQHEq0q+rwAxTu2OMNQtXHYrqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xyg6wsPFRMKyT8ZrUCcaCtMv3wa/bgZZNuZA7Gj9kpE=;
 b=IzXD7ksWT7y+Cd5ZweW3ps1hhfyKFaUP+SQYayrRvOI6DWKByCpmCJt4FuyPJ642oNqcugG9vffUaC8sqmgFipWHYLQRatZIPffLDEvcdqY/HaUYrWAEgAvEn2E0yWOZHnk67zaqJ3CVp0n/4bxwpNdEKGq6/biiowgy5voFe0iqWsIbf3532jAiHwB5gT8uG7BWzGL7KcJZSS3aPtQtrGP7ULKfR8mddIHlYq666OGWiUY8J0UXMPTDNRgRvfhj2wUsGoDV8qcmWAX37P9BrFmtFhTuGCqWzy/sAyK1Z/cR7KK/qRegQlhPz92BoxPwFFBCjeV7GQHY0gAufxDcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xyg6wsPFRMKyT8ZrUCcaCtMv3wa/bgZZNuZA7Gj9kpE=;
 b=jJbIqTQhhNOd+zivgIOdkwmibDo1azdKcECkrvASoISaKYP4JYk5SuLKrntyzdYpJAtRdetWkW+l1ki8i70vUBfaZtuMvC30SobGcTGboMi+P0M/QN9bWNEvBYkve23n6U4CmzRXxiz5logCVn1c8ktvd5cNQJ6pUrfCiwuWeya1S6VLDxon4cq9UK9PyXCEhgqPnoAiaV84LJqJkB/GaPpjmx6L1rm8n7Lfztw4wa1KsIcL5lPdBsOPBp0eTJG9j65340UiltADMNHpKdJaIJAbOkJjaR44dCartGTzLN7Jbe+yMcp3BnIh1WbKaCRpnUlEZ9reYNIHi6UAcgBfkQ==
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
Subject: Re: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v5 08/10] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXvAknAgtt9sKLd0u6OFwp+HT0w6vQvTaAgBLStoCAAEPJAIAAAdoA
Date: Mon, 25 Oct 2021 13:47:14 +0000
Message-ID: <22f298b7-c502-ff15-3796-117f3599bf7e@epam.com>
References: <20211008055535.337436-1-andr2000@gmail.com>
 <20211008055535.337436-9-andr2000@gmail.com>
 <YWawvYGqIe3DwZfI@MacBook-Air-de-Roger.local>
 <7f2a5875-69c9-b40b-287b-1355698598e5@epam.com>
 <YXaz1G1mvHzZHdxM@MacBook-Air-de-Roger.local>
In-Reply-To: <YXaz1G1mvHzZHdxM@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a9d9266-cf8d-4b94-cf8c-08d997bdf432
x-ms-traffictypediagnostic: VI1PR0302MB2832:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB283280E4E746D69A93F00653E7839@VI1PR0302MB2832.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:425;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 pOsZWwDrtZofDQDJn3RpV1pNtS1aWuIkOU0UjY0RM8vQatGo34t7XGF52dD9uKPXFh5GCh3XyDt3KRcLXhnpky+E01FNDNfYpvgA2e56nepo6vad7rbwfKylMh2KuH3Tf8eH6XWdvkBXgnrdMyNoe9QGX3jemi7f5ZWAeVT5Uc+gzDiX13TEpZBtzcUwvb2Ju8ru3UHvPWuzn4IA6gzc55ckcwi1LRt12wznj2DSLmw4L7rZwhRAbpS4dbcqohRQCY0fyK67lBkJh9cpvNcuaUTcE2ezsrAokn9vxWvHBwRbLpynzBrzffkEDbYe/F04Sy02fcSSK50wxRjtujjVN6Ua4M4Rw/XDL1LYMlBivdYzn21hVRthc+AzERMfyJFf9apvkAB5aYS0Rwx5eZm1PviuBve66chHeqX5GdBVXnmh5Ew0EICefTsnJRNGGr4O9U6yopHzvx/ABqPzeHWGGdRDdIQ/ac5uL8EZ0wVAqvilFW0B+QTq3h+xxi9YJbpQDgmW1AA4t5M/i7uHgra9jRFL6naiFdDOEtXmGT2j8AN8pkedQN7vAMEldjhN34xI5zs8E8KbVjdAIzhW5TcYfgNiWl6WoLxGRD/jVVX2OArhid3Kt7gAKLtd+p5m+uNt+knaMrUIuOsY/iBNCiXJYiEocY3ywXSoA3Jbgp7/UDjB+n7E5LVyyok2tOHsvpoyvy66bRJFYbVZ2doVYzjq7jnyT58QgmPdNp7ISKcPsN/1CkOaYdyI/MRX4vqJ+cfo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(31686004)(38070700005)(66556008)(86362001)(316002)(107886003)(6512007)(76116006)(66476007)(6916009)(38100700002)(36756003)(2906002)(64756008)(6506007)(4326008)(54906003)(53546011)(71200400001)(508600001)(26005)(66946007)(122000001)(8936002)(66446008)(91956017)(186003)(8676002)(7416002)(2616005)(5660300002)(83380400001)(31696002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OUwzTzJ6OFVGTzNsOElwZjRSdlZLQUYyWVJ5ZzNheXZucjFkSEVyMjlJc3ZS?=
 =?utf-8?B?SmFVaDBIRVFKblZNcjBOR1pGcVRUTitQdFMxZ1l0eHBwQVp4bi9MSFFiQ3dN?=
 =?utf-8?B?N1RZaTZnNGlPeFNSQXZyaFVWRGRQbW1SR1ZIV01tUEtwakxnSHlTSTNoZmFU?=
 =?utf-8?B?U0lyVjMzOGlkaUtDdmJxdGU1NUV2ZDc5NFkvMEJDMTBiRnJBajdUVnFtUTMy?=
 =?utf-8?B?WmZLRmt3QmtqUVd5WkZsV0IyODk0NFZUN25OZWtzZTV4ZlVQWTdiV0NNaHZJ?=
 =?utf-8?B?eUc2NVFHQ0tkZHlUeDg4WXMrVkZ4NDNqcmxkQ0tzSW9Ed3E5ZTFSR2lLa2w1?=
 =?utf-8?B?MnBOWXNqaDFYRThITVpKSGxLWEtDZmcxbThRdWZVZ2xRQWVqVGhZS0h6cmd1?=
 =?utf-8?B?c2Q0WnZOMnhlOW9MRUZEdkpJbzhEakIvcmllcWp5ODkyL2dLWHRSUUVzWTdj?=
 =?utf-8?B?YlVjUlk5YUFiVmdlTlZVRXdBb2VRVmJwWExWVUlJbXFFN0JKM2dTd25pVm9h?=
 =?utf-8?B?eCt1K09zUFkzSVhhVjZ6RWl0cnVKM244azcxMGFYZmhSMUw3VTAzL3FxU2wr?=
 =?utf-8?B?anA2ckQxb1UxRGYwMmx2RFo3bVNwQ3h5UXlkMnBrMFA1eWIrbFlxYm5mZGVK?=
 =?utf-8?B?ejRPS2tJTmFnVlVTeWt4M0Y4T2xoUkUweWJ1ODZ3emQwS25NLzlxb2RNb3NF?=
 =?utf-8?B?anlTSFJQcW5ncjhPL3oxMHVIU2hUZXlzcEJTWGhDQ1NXOVpBWXVjalBBV2dH?=
 =?utf-8?B?QVpPc2t0RjU4VUVWd256dDBrcVh2VEpFRitkVFNoUHpmMGdDZ2J2T1ZwdmVM?=
 =?utf-8?B?Y0R0ejFiYnM2MWRnY2JTTHNVNm9NeFdoQ1J5c25sQ3JtRW1jT3ZxK1lBOTdB?=
 =?utf-8?B?WFpnSmhQWVA2VmdONzkxV1ZjRjIzVUlPZ1Vua0FzcHdPanQrZVZTbXg5MGJ6?=
 =?utf-8?B?RTE0SjRIOE5ubkNXQnZmM3cwYkp3U1JSRHVBU0IxNWJya2h2Z0o0d2phUTRv?=
 =?utf-8?B?a0s1MFZHT1BGOStyWVJIZjQ0NytQaEtBTEU1UUVMbWp0NjVuUUxKZzlMTzZx?=
 =?utf-8?B?RkRZM2hNRU8zTENRMmNIQlRGcUh6bCttY1ZtZEVZdG5PZ2hId1NONkRSKzJQ?=
 =?utf-8?B?eGh2OUhFMTdRc2U5R0U3bmJKaWs2NFJDNFJIeXg2MG9sNFVRMHkwNTJzVkpS?=
 =?utf-8?B?VWNRMFhvSDNINzFjVk8zYlBrMkZuSDc1RFJTNHkvUi9Fam9Zc3hvc1BFazlQ?=
 =?utf-8?B?eEUxZFdZQWUxY0UxM21CdHhlVXF4NzAvTHVhWVoxYmM1eHE1NHpsQnhydlcz?=
 =?utf-8?B?b3ovbGFMZDhpU29kV0JxU0JmdjNYYlIrRUpjTXE3QkdtSXNPY2didmZhNGc3?=
 =?utf-8?B?SVR5Zk9nWXpoczlSU2FCQ1pZMGx2MFlrQ1pvTmtibFV3bHN4ZC9uS0ZxNUhT?=
 =?utf-8?B?WHdMaHJCZGJ6VzZvaEFGZTVTQytuRUNKdTYwZFc1VXFpOE82UzNKSk0wU2pO?=
 =?utf-8?B?UkE2Yks1NkNBL3hJMUdQL1FiMUZQWHphSzI2TThTQm5iT05hMDJFdk9jbVhK?=
 =?utf-8?B?OXpIbGZVYS9XMEc1UFVFSnp3L250bGw4enJDMlBKQXF6UUZaK3pBV0NCQnlv?=
 =?utf-8?B?UGpxQWhJczRnNUNoRldlSHBGSm5heDlPSjZNTzh1SVZYTzdCQ0huSmhiRCtR?=
 =?utf-8?B?aWg5L1NBTk9wNUFUVnVsSVFDdWxZZ0xuWXNSa1pZV1hFS0w5SG9FMEs0NEpu?=
 =?utf-8?B?SVhwYUZoZG5sU2Rrb1BTSWZEZjRQcnVCVUY5blNMNFZBYWVRaUJQdzV0ODdz?=
 =?utf-8?B?TW1uQTlmVkU1aHVqMVY4Wm4yRGdoU2gzRk96T1VxOFJNcHhSc2JlbFl4Q1R3?=
 =?utf-8?B?M1dla1RJOXorUnVQdS9iTkdRczhtejNCMnEzNVBMRTFPMklyMWNzQmhoenU0?=
 =?utf-8?B?c2VZWVovWXBldGc1UThNOUhlVWx6S3RiYWZwQTlzMXNrbUU5WStpVW1ucmFa?=
 =?utf-8?B?VkM5VnJwRmJkRnk0Z05zVFhGMWM4MEI4eGIwWFJjSzVJc0ZjSWtBSUgvZVdU?=
 =?utf-8?B?UktqWG0yMjFTSUFzdmpnYi9Mb2gxUmJ5bEFyYTFCMXJsbkQ2aW5JYzQ4ckJZ?=
 =?utf-8?B?K255RUVIRTk3aElJdUgxQmx6RHRiWWZCVFlya2xmc1pCNTI1UjZia2pZL0ZY?=
 =?utf-8?B?aVRhcVp3VEJRaUtEbkZ4RjVCVTg4VExOZGd4QmhYTW9saFFPdllBajV2QVJr?=
 =?utf-8?B?MnFkbFg2c1pVeTJyOVFoUWUrV1d2R0hxY0tLQjdGb09zZ2pDZ1JXZzI1Q2Yx?=
 =?utf-8?B?L0VvRnlmWkpGRkVqVFVDQnRhb1NCbVN0dmxOdCs5QXloakxIdi9WZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F321363DFFBF3E4EB0395F59B4C88A0B@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a9d9266-cf8d-4b94-cf8c-08d997bdf432
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2021 13:47:14.9696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xyucWh47CbJIrktIgwnNBh4NRDrIK2ypo8jW2e8Erd1Q3vCa0L1BmNGw7HUcrhj8FDfRGYC/NvYXe2PxHoX1SiYs8pdWUGx5kh5U8bXfBLusBcdFBwW2/TIJDNYDjrh5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB2832
X-Proofpoint-GUID: H4EsjWQTkvT46ppnfhbRQDSak0bQyaVz
X-Proofpoint-ORIG-GUID: H4EsjWQTkvT46ppnfhbRQDSak0bQyaVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_05,2021-10-25_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxscore=0 adultscore=0 clxscore=1015 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110250084

DQoNCk9uIDI1LjEwLjIxIDE2OjQwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IE9jdCAyNSwgMjAyMSBhdCAwOTozODowMEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBSb2dlciENCj4+DQo+PiBPbiAxMy4xMC4yMSAxMzoxMSwgUm9nZXIg
UGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBGcmksIE9jdCAwOCwgMjAyMSBhdCAwODo1NTozM0FN
ICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
Pg0KPj4+PiBJbiBvcmRlciBmb3IgdlBDSSB0byB3b3JrIGl0IG5lZWRzIHRvIG1haW50YWluIGd1
ZXN0IGFuZCBoYXJkd2FyZQ0KPj4+PiBkb21haW4ncyB2aWV3cyBvZiB0aGUgY29uZmlndXJhdGlv
biBzcGFjZS4gRm9yIGV4YW1wbGUsIEJBUnMgYW5kDQo+Pj4+IENPTU1BTkQgcmVnaXN0ZXJzIHJl
cXVpcmUgZW11bGF0aW9uIGZvciBndWVzdHMgYW5kIHRoZSBndWVzdCB2aWV3DQo+Pj4+IG9mIHRo
ZSByZWdpc3RlcnMgbmVlZHMgdG8gYmUgaW4gc3luYyB3aXRoIHRoZSByZWFsIGNvbnRlbnRzIG9m
IHRoZQ0KPj4+PiByZWxldmFudCByZWdpc3RlcnMuIEZvciB0aGF0IEVDQU0gYWRkcmVzcyBzcGFj
ZSBuZWVkcyB0byBhbHNvIGJlDQo+Pj4+IHRyYXBwZWQgZm9yIHRoZSBoYXJkd2FyZSBkb21haW4s
IHNvIHdlIG5lZWQgdG8gaW1wbGVtZW50IFBDSSBob3N0DQo+Pj4+IGJyaWRnZSBzcGVjaWZpYyBj
YWxsYmFja3MgdG8gcHJvcGVybHkgc2V0dXAgTU1JTyBoYW5kbGVycyBmb3IgdGhvc2UNCj4+Pj4g
cmFuZ2VzIGRlcGVuZGluZyBvbiBwYXJ0aWN1bGFyIGhvc3QgYnJpZGdlIGltcGxlbWVudGF0aW9u
Lg0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4+IFJldmlld2VkLWJ5OiBTdGVmYW5v
IFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4+IFJldmlld2VkLWJ5OiBS
YWh1bCBTaW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+Pj4gVGVzdGVkLWJ5OiBSYWh1bCBT
aW5naCA8cmFodWwuc2luZ2hAYXJtLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+IFNpbmNlIHYzOg0KPj4+
PiAtIGZpeGVkIGNvbW1lbnQgZm9ybWF0dGluZw0KPj4+PiBTaW5jZSB2MjoNCj4+Pj4gLSByZW1v
dmVkIHVubmVlZGVkIGFzc2lnbm1lbnQgKGNvdW50ID0gMCkNCj4+Pj4gLSByZW1vdmVkIHVubmVl
ZGVkIGhlYWRlciBpbmNsdXNpb24NCj4+Pj4gLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UNCj4+Pj4g
U2luY2UgdjE6DQo+Pj4+ICAgIC0gRHluYW1pY2FsbHkgY2FsY3VsYXRlIHRoZSBudW1iZXIgb2Yg
TU1JTyBoYW5kbGVycyByZXF1aXJlZCBmb3IgdlBDSQ0KPj4+PiAgICAgIGFuZCB1cGRhdGUgdGhl
IHRvdGFsIG51bWJlciBhY2NvcmRpbmdseQ0KPj4+PiAgICAtIHMvY2xiL2NiDQo+Pj4+ICAgIC0g
RG8gbm90IGludHJvZHVjZSBhIG5ldyBjYWxsYmFjayBmb3IgTU1JTyBoYW5kbGVyIHNldHVwDQo+
Pj4+IC0tLQ0KPj4+PiAgICB4ZW4vYXJjaC9hcm0vZG9tYWluLmMgICAgICAgICAgICAgIHwgIDIg
KysNCj4+Pj4gICAgeGVuL2FyY2gvYXJtL3BjaS9wY2ktaG9zdC1jb21tb24uYyB8IDI4ICsrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+PiAgICB4ZW4vYXJjaC9hcm0vdnBjaS5jICAgICAgICAg
ICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+Pj4+ICAgIHhlbi9h
cmNoL2FybS92cGNpLmggICAgICAgICAgICAgICAgfCAgNiArKysrKysNCj4+Pj4gICAgeGVuL2lu
Y2x1ZGUvYXNtLWFybS9wY2kuaCAgICAgICAgICB8ICA1ICsrKysrDQo+Pj4+ICAgIDUgZmlsZXMg
Y2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+IGluZGV4IDc5MDEy
YmY3Nzc1Ny4uZmE2ZmNjNWU0NjdjIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vYXJjaC9hcm0vZG9t
YWluLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4+IEBAIC03MzMsNiAr
NzMzLDggQEAgaW50IGFyY2hfZG9tYWluX2NyZWF0ZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4+PiAg
ICAgICAgaWYgKCAocmMgPSBkb21haW5fdmdpY19yZWdpc3RlcihkLCAmY291bnQpKSAhPSAwICkN
Cj4+Pj4gICAgICAgICAgICBnb3RvIGZhaWw7DQo+Pj4+ICAgIA0KPj4+PiArICAgIGNvdW50ICs9
IGRvbWFpbl92cGNpX2dldF9udW1fbW1pb19oYW5kbGVycyhkKTsNCj4+Pj4gKw0KPj4+PiAgICAg
ICAgaWYgKCAocmMgPSBkb21haW5faW9faW5pdChkLCBjb3VudCArIE1BWF9JT19IQU5ETEVSKSkg
IT0gMCApDQo+Pj4gSU1PIGl0IG1pZ2h0IGJlIGJldHRlciB0byBjb252ZXJ0IHRoZSBmaXhlZCBh
cnJheSBpbnRvIGEgbGlua2VkIGxpc3QsDQo+Pj4gSSBndWVzcyB0aGlzIG1hZGUgc2Vuc2Ugd2hl
biBBcm0gaGFkIGEgdmVyeSBsaW1pdGVkIG51bWJlciBvZiBtbWlvDQo+Pj4gdHJhcCBoYW5kbGVy
cywgYnV0IGhhdmluZyB0byBkbyBhbGwgdGhpcyBhY2NvdW50aW5nIHNlZW1zIHF1aXRlDQo+Pj4g
dGVkaW91cyBldmVyeSB0aW1lIHlvdSB3YW50IHRvIGFkZCBuZXcgaGFuZGxlcnMuDQo+PiBZZXMs
IEkgdGhpbmsgd2UgbmVlZCB0byBkbyBzbywgYnV0IHRoaXMgaW1wcm92ZW1lbnQgd2FzIG5vdCBt
ZWFudA0KPj4gdG8gYmUgaW4gdGhpcyBwYXRjaC4NCj4gQWNrLCBqdXN0IHdhbnRlZCB0byByYWlz
ZSB0aGF0IHRoaXMgbW9kZWwgc2VlbXMgdG8gYmUgZ2V0dGluZyBtb3JlDQo+IGNvbXBsZXggdGhh
biBqdXN0IHNldHRpbmcgdXAgYSBsaXN0Lg0KPg0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
YXJtL3ZwY2kuYyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+Pj4gaW5kZXggNzZjMTJiOTI4MTRm
Li42ZTE3OWNkMzAxMGIgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+
Pj4gKysrIGIveGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+PiBAQCAtODAsMTcgKzgwLDUxIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVyX29wcyB2cGNpX21taW9faGFuZGxlciA9IHsN
Cj4+Pj4gICAgICAgIC53cml0ZSA9IHZwY2lfbW1pb193cml0ZSwNCj4+Pj4gICAgfTsNCj4+Pj4g
ICAgDQo+Pj4+ICtzdGF0aWMgaW50IHZwY2lfc2V0dXBfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21h
aW4gKmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBw
Y2lfaG9zdF9icmlkZ2UgKmJyaWRnZSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgcGNpX2Nv
bmZpZ193aW5kb3cgKmNmZyA9IGJyaWRnZS0+Y2ZnOw0KPj4+PiArDQo+Pj4+ICsgICAgcmVnaXN0
ZXJfbW1pb19oYW5kbGVyKGQsICZ2cGNpX21taW9faGFuZGxlciwNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgY2ZnLT5waHlzX2FkZHIsIGNmZy0+c2l6ZSwgTlVMTCk7DQo+Pj4gSSdt
IGNvbmZ1c2VkIGhlcmUsIGRvbid0IHlvdSBuZWVkIHRvIHVzZSBhIHNsaWdodGx5IGRpZmZlcmVu
dCBoYW5kbGVyDQo+Pj4gZm9yIGRvbTAgc28gdGhhdCB5b3UgY2FuIGRpZmZlcmVudGlhdGUgYmV0
d2VlbiB0aGUgc2VnbWVudHMgb2YgdGhlDQo+Pj4gaG9zdCBicmlkZ2VzPw0KPj4+DQo+Pj4gQUZB
SUNUIHRoZSB0cmFuc2xhdGlvbiBkb25lIGJ5IHZwY2lfbW1pb19oYW5kbGVyIHVzaW5nIE1NQ0ZH
X0JERg0KPj4+IGFsd2F5cyBhc3N1bWUgc2VnbWVudCAwLg0KPj4gWW91IGFyZSBhYnNvbHV0ZWx5
IHJpZ2h0IGhlcmU6IEkgY2FuIHNldCB1cCBod2RvbSBzcGVjaWZpYw0KPj4gaGFuZGxlcnMsIHNv
IEkgY2FuIHByb3Blcmx5IHRyYW5zbGF0ZSB0aGUgc2VnbWVudC4NCj4+IE9uIHRoZSBvdGhlciBo
YW5kLCB3aGVuIHZpcnR1YWwgYnVzIHRvcG9sb2d5IGFkZGVkLCB0aGUgU0JERg0KPj4gdHJhbnNs
YXRpb24gZnJvbSB2aXJ0dWFsIHRvIHBoeXNpY2FsIFNCREYgcmVzaWRlcyBpbiB0aGUgQXJtJ3MN
Cj4+IHZwY2lfbW1pb197cmVhZHx3cml0ZX0sIGxpa2UgdGhlIGJlbG93Og0KPj4gICDCoMKgwqAg
aWYgKCBwcml2LT5pc192aXJ0X2VjYW0gJiYNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAhdnBjaV90
cmFuc2xhdGVfdmlydHVhbF9kZXZpY2Uodi0+ZG9tYWluLCAmc2JkZikgKQ0KPj4gICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAxOw0KPj4gKEJUVyBKYW4gYXNrZWQgaW4gc29tZSBvdGhl
ciBjb21tZW50IHdoeSBpdCBpcyBBcm0gc3BlY2lmaWM6DQo+PiBJIHRlbmQgdG8ga2VlcCBpdCBB
cm0gc3BlY2lmaWMgdW50aWwgdGhlIHBvaW50IHdoZW4geDg2IHdhbnRzIHRoYXQNCj4+IGFzIHdl
bGwuIFVudGlsIHRoYXQgcG9pbnQgdGhlIGNvZGUsIGlmIG1vdmVkIHRvIGNvbW1vbiwgd2lsbCBi
ZQ0KPj4gdW5uZWVkZWQgYW5kIGFzIEphbiBjYWxscyB0aGF0ICJkZWFkIikNCj4+IFNvLCBJIHRo
aW5rIHRoYXQgSSBjYW4gZXh0ZW5kIHZwY2lfbW1pb197cmVhZHx3cml0ZX0gdG8gYWNjb3VudA0K
Pj4gb24gdGhlIGh3ZG9tIGxpa2UgKHZpcnR1YWwgYnVzIGNvZGUgaXMgdGhlIGZ1dHVyZSBjb2Rl
KToNCj4+DQo+PiBzdGF0aWMgaW50IHZwY2lfbW1pb19yZWFkKHN0cnVjdCB2Y3B1ICp2LCBtbWlv
X2luZm9fdCAqaW5mbywNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcmVnaXN0ZXJfdCAqciwgdm9pZCAqcCkNCj4+IHsNCj4+IC4uLg0KPj4g
ICDCoMKgwqAgc3RydWN0IHZwY2lfbW1pb19wcml2ICpwcml2ID0gKHN0cnVjdCB2cGNpX21taW9f
cHJpdiAqKXA7DQo+Pg0KPj4gICDCoMKgwqAgaWYgKCBwcml2LT5pc192aXJ0X2VjYW0gKQ0KPj4g
ICDCoCDCoMKgIMKgwqAgc2JkZi5zYmRmID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7IC8qIEZvciB2
aXJ0dWFsIGJ1cyB0b3BvbG9neSB0aGUgc2VnbWVudCBpcyBhbHdheXMgMC4gKi8NCj4+ICAgwqDC
oMKgIGVsc2UNCj4+ICAgwqDCoMKgIHsNCj4+ICAgwqAgwqDCoCDCoMKgIHNiZGYuc2JkZiA9IE1N
Q0ZHX0JERihpbmZvLT5ncGEpOw0KPj4gICDCoMKgwqDCoMKgwqDCoCBzYmRmLnNlZyA9IHByaXYt
PnNlZ21lbnQ7DQo+PiAgIMKgwqDCoCB9DQo+PiAgIMKgwqDCoCByZWcgPSBSRUdJU1RFUl9PRkZT
RVQoaW5mby0+Z3BhKTsNCj4+DQo+PiAuLi4NCj4+ICAgwqDCoMKgIC8qDQo+PiAgIMKgwqDCoMKg
ICogRm9yIHRoZSBwYXNzZWQgdGhyb3VnaCBkZXZpY2VzIHdlIG5lZWQgdG8gbWFwIHRoZWlyIHZp
cnR1YWwgU0JERg0KPj4gICDCoMKgwqDCoCAqIHRvIHRoZSBwaHlzaWNhbCBQQ0kgZGV2aWNlIGJl
aW5nIHBhc3NlZCB0aHJvdWdoLg0KPj4gICDCoMKgwqDCoCAqLw0KPj4gICDCoMKgwqAgaWYgKCBw
cml2LT5pc192aXJ0X2VjYW0gJiYNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAhdnBjaV90cmFuc2xh
dGVfdmlydHVhbF9kZXZpY2Uodi0+ZG9tYWluLCAmc2JkZikgKQ0KPj4gICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldHVybiAxOw0KPj4NCj4+IFdpbGwgaXQgd29yayBmb3IgeW91Pw0KPiBSaWdo
dCwgSSBndWVzcyBpdCBjb3VsZCB3b3JrIGFzIGxvbmcgYXMgdGhlIGRpZmZlcmVuY2VzIGJldHdl
ZW4gdGhlDQo+IGhhcmR3YXJlIGRvbWFpbiBhbmQgdGhlIHVucHJpdmlsZWdlZCBvbmVzIGFyZSBu
b3QgdG9vIGJpZy4NCj4NCj4gVGhlIG5pY2UgcGFydCBhYm91dCBoYXZpbmcgZGlmZmVyZW50IGhh
bmRsZXJzIGlzIHRoYXQgeW91IGF2b2lkIGENCj4gYnVuY2ggb2YgY29uZGl0aW9uYWxzIChpZTog
bm8gbmVlZCB0byBjaGVjayBmb3IgaXNfdmlydF9lY2FtKSB3aGljaA0KPiBtYWtlcyB0aGUgY29k
ZSBlYXNpZXIgdG8gZm9sbG93LiBPVE9IIGl0IGNvdWxkIGludHJvZHVjZSBtb3JlIGNvZGUNCj4g
ZHVwbGljYXRpb24uDQpZZXMuIFRoaXMgaXMgd2h5IEkgcHJlZmVyIGNvbmRpdGlvbmFscyBpbiB0
aGlzIHNwZWNpZmljIGNhc2UuIEhhbmRsZXJzDQphcmUgc21hbGwsIHlldCBJIGRvIG5vdCB3YW50
IHRvIGhhdmUgdHdvIHZlcnNpb25zIG9mIHRoZSBzYW1lLg0KVGhlIGhhbmRsZXJzIGJlY29tZSB1
Z2x5IGlmIHdlIHRyeSBkaXZpZGluZyB0aGVtIGludG8gY29tbW9uIHBhcnRzDQpTbywgSSdsbCBw
cm9iYWJseSBpbnRyb2R1Y2UgcHJpdiBpbiB0aGlzIHBhdGNoIGFuZCB1c2UgaXQgZm9yIHRoZSBo
d2RvbSdzDQpzZWdtZW50LiBMYXRlciBvbiwgd2hlbiB2aXJ0dWFsIGJ1cyB0b3BvbG9neSBpcyBh
ZGRlZCBmb3IgdGhlIGd1ZXN0cywNCkknbGwgdXNlIHRoZSBzYW1lIChleHRlbmRlZCkgcHJpdiB0
byBwYXNzIGd1ZXN0J3MgaW5mby4NCj4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9s
ZWtzYW5kcg==

