Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D76CA39B2BA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 08:38:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136739.253393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3SZ-0000ny-NV; Fri, 04 Jun 2021 06:37:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136739.253393; Fri, 04 Jun 2021 06:37:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3SZ-0000kS-JW; Fri, 04 Jun 2021 06:37:35 +0000
Received: by outflank-mailman (input) for mailman id 136739;
 Fri, 04 Jun 2021 06:37:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EDnB=K6=epam.com=prvs=67890d1f51=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1lp3SX-0000kM-Kf
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 06:37:33 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c64b7702-348d-4527-8fad-c4349ede254f;
 Fri, 04 Jun 2021 06:37:32 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1546aAsU010423; Fri, 4 Jun 2021 06:37:31 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52])
 by mx0b-0039f301.pphosted.com with ESMTP id 38ydek88g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Jun 2021 06:37:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7346.eurprd03.prod.outlook.com (2603:10a6:20b:26e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Fri, 4 Jun
 2021 06:37:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b459:9e8c:964b:a3d1%6]) with mapi id 15.20.4195.023; Fri, 4 Jun 2021
 06:37:27 +0000
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
X-Inumbo-ID: c64b7702-348d-4527-8fad-c4349ede254f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpBsH9cS9RUCglzB8fb2ZrCrUHiHongWMEfJ2mCgZ/OkWgieafxjynKMy2QxvyVlnjVsN9SXaVUTqff62hwb7pMjkb+wFz/mEwyeJP14lgkG5m8b6NfX4PNAedqnnOTwCfB0dvmEhikDe0W+R6Ajh0G/mUENcTzWAsepU0rWuLk/XyqFU8/lHGaHyifTOLTih3kujRTS0e+HFsDFMQf+fDf2Ae1unsxIyvnGFD4oMP+IccTxv7WnSuThyvQV99InQu98lAOJZ6s16b2eQs3b81SugNaUentZNZwoW/M38S10ccGaz/lo05M9kjDyTWd8MZHRsoDDsT8HJtY+S0cmvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMV+fFvjKlYiGufHj/nr+yshgJCwxjCERrqo4V6wD0k=;
 b=W6onknEYgr6wssnV8rtVym7ge9fKDgc0yWRfgloK01bsiZKlrxWUK69vneWX52O40GofFpgMJYNP9tsxuMI5A2va0gLYszLzIrgvmU5T8vmCePNkSXb1LehD2L2UbdrPf5eMOGdM2LZqLUbxjKe0N7fNMA9rQBNCyZttWM4ChReLwAT0nEcCtMF7skLflsHg+F8l6sdLw5j8xN2G3GoZXg9TVM+Ec+Pow6KRA5zf8FWj+Qzrb3SV0xXjJzTQS249HrnT/cEf5XoPE5JQVjX81WdITIIdiVDGlpOstlWe7dV/gMConbzPfYnBNQBeGhGjQhCD+kMJc7YyFhJnEwvK6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jMV+fFvjKlYiGufHj/nr+yshgJCwxjCERrqo4V6wD0k=;
 b=n0fcAJ+NRXWjDk0Zzjpb9n20bYyYzw3BfVJpa4lb4e4+Lb1GmYgEuqpZ5Kid+2NLVeN5W7MB4R18HAtR1bhLg0b5cTvqEuPXexENGQplDCfBmOZyBf6bru7MDZNUN25spggxLFJGWhis7ndMLJ1YXetD5VU3ZuKDu3O5EBt8bGge9fuSmeOpVPGqItmUm8L14Gq9bGgaZwZhQ96/xdfNleC238oUBM5kiqbgCSwxYXXDr88T+5TxWY7nZlzWU1XZrNTx2AwvhvFfWWpT6KSkJhsVemz4LVRmDPkwyyTE5ZEZpOuc+DaeHwVxp5QZt9pb24dxqmmqS6GWV+c4A+cRrg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Subject: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Topic: SR-IOV: do we need to virtualize in Xen or rely on Dom0?
Thread-Index: AQHXWQwW/O3obtZgqkmpGRvt7ZNDkQ==
Date: Fri, 4 Jun 2021 06:37:27 +0000
Message-ID: <c10e16c9-ec42-336f-e838-caca49b39723@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4d49e6b-6d87-4f66-b7bb-08d9272338ac
x-ms-traffictypediagnostic: AM9PR03MB7346:
x-microsoft-antispam-prvs: 
 <AM9PR03MB73466C2C1DF01BE348B57161E73B9@AM9PR03MB7346.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 v4+QhprZDmamMy8qHI0UXqXtNl2FKTh1zqQncdoF5MUU8N3dzJWry/tO/P9D/7t6zwUMy7+q0e6CGz+7JZLreiHbRFMjpRweID+VMuRxS7ClhRfD2FwL209U1yoz7bxT1q0ozHH+23ITH/bf+5JD7H61a/L5bY3qS++Vqb5B8iOVQUFUoGLxFsZEd4xHVeW2C4RQTq2eFJMlLENvShB/+dfK3sFwsWVnxRlaow2+oO3EawScrdmUs4hAYngEMp5gj0WZsczB3rklrN2GV15fOe7xA/7eUiSTSY7fqf5wZqu5deEr4HG72V5ieZU0m8etHTbqnzuyXPslKW5E3Ez5GXQXPHXaae8P+iWcegEJF3IjdM+/EMbpS7YnVOAVdnNgRXJ38VIqlEjjBB5mgxWtzdaDfllBAWxJbuP2Uw80TibrNX2n7gdA5OoPk7Dqynp4fkHcMQeogu4GLWS/ZOP6/7B83EuO7lSZa9rtlV5UjIWjmMsqWHONa6cLSLjKKwn+lxcYeUIydJDqQVJcipXgdXgv7EZWN9NIpUCSIea6XCRlmORmrFIc5xIFi0XmqcwEo9D/FQQCscs/ffmAYYHTC+L4Yqxx6+M0NDRVbjEQ369xz3BruoYvr9qOAd/mg+nLZN6apOgalGWh8DrPP8bmGmAvbeVxFSErufQiZyZT1tnGFY4iRoZ9x8pNyTEIo1eWh2rPIJCljUV9sVmzUocO4/gH/RPFx896RLYTTkSNBqJTTXHbtyeBNc/6NKqGZ6EuOUojmdp9x82l/b2xhtRZs+JEFu7HNHBCjq5CfcSA5zoi6mgelnzvuoZvgYZik6VV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(966005)(478600001)(38100700002)(122000001)(5660300002)(8676002)(31686004)(8936002)(76116006)(6512007)(6486002)(66476007)(66556008)(66446008)(64756008)(66946007)(71200400001)(4326008)(83380400001)(2906002)(6916009)(36756003)(316002)(26005)(31696002)(2616005)(186003)(6506007)(54906003)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?TDRodFFHV2MrZHUxQjVLcW5OTHlQcjhFcXBkNnhsamYwOVl6am5xUlNEcnVN?=
 =?utf-8?B?b29jeElDYUxYa0xqOWhBR2dmb1hKRjhRL0lISmRCNjRkNTZiVXdTc2ZyR0lZ?=
 =?utf-8?B?QWpGeE1WVTgyTzMyVElvUHlMTEphUERkU0t4bFNZdFRoQWlqUjhwZmhEYmhY?=
 =?utf-8?B?UE5ZQmQ1NjduekMySFpoWnRTOU85Tm1VdWkxMjZzVXhCcVFCWFFLOG1vRGt4?=
 =?utf-8?B?dEhhbVNObktTNlVRdytwbGx6Q09UQ1FkakxoR2pTdWRPaDlpYUdrSThYd3A5?=
 =?utf-8?B?NFlaWFVqOG9nYkRHWllSaFUvT1BHN1hveGRkL2l6bmJ4dWZSZHRYWlQzTk1J?=
 =?utf-8?B?Qk5KNnZoVllsUHVvZlYrYkM4SWExMWp1TUVkMkZKTTkzMUVyVzBrMEFncGxh?=
 =?utf-8?B?NHBpSWlCNGg3QWhRSTMvbStLdnBYVVJEanJialk0SkdtYnI1K2htbm9aaFZm?=
 =?utf-8?B?T2dMSHp4RThlV1oyOVhUcVNteHhxejE5dFIrdWc1YnlsVk5VRGhKeVZscW1h?=
 =?utf-8?B?Q3doazZaMk5CT0RKN1AxYjlkSzQxTUZjUXUrd1d2K1N3R3l4RHZpbmd4OCtX?=
 =?utf-8?B?Uzh2cTlmWVgxVHlsemdZb2hHVmh0dHZWYncvb1JiM2x5R2JVNUNDN2RldDVS?=
 =?utf-8?B?YnB1d1BxSEl2clUyMVBKREp2SHlnSzBBWTNiQWhKV0VGNUhHaytqaU4yU3dE?=
 =?utf-8?B?WnYvZmkvOXFqOUhZVDFkcVZmSzRXYzdGZHFmNTlwWFNJT1RWYWVPZCs3bEtL?=
 =?utf-8?B?ekkxTWhiS2hBellML0dRY0hLS1MxUEcyMlJFS0V2VGhla2M4VjkwbDFBcllw?=
 =?utf-8?B?QlozU2FJN0hvd0hDb1pubEhLV1VTUHZVaTBTZGV3VUFJZGUyeVY5OVQ0ZHhx?=
 =?utf-8?B?S2ZTdlFYWEx2b2RjV1NERzhPak9YSWtLcUU2bnF6ZWJLSUFoQnlseitGdHBE?=
 =?utf-8?B?RlNTUk1wUktVdlI4RnNsQUxJOVVtMzBnR2RFczB2VithWm9PaXF3SDVScWMw?=
 =?utf-8?B?RnRwdENMMzZLaDc0L1N4QWpGWHlNRGQ3WXY4cStYbXpGN3ZFdmdwanR1U1lY?=
 =?utf-8?B?VjBmYndHY3M2S3ZSMmpPdEdoeGhueWNmYTRTcXR2RnNNQzlIQitneE5sMXNH?=
 =?utf-8?B?cVVINlUwbUFoRzh6WmdycXE4aGJCQ0pobG1GZTdsdE1TS05Xd3VGalR3R0hV?=
 =?utf-8?B?Zjc2OVgzNDZOWTZXR3MxQmV4K0ZWOTQyRjhFRVU3Q2tuWC9kTGRPN0dSSUo3?=
 =?utf-8?B?V2djdkpibnY2ekJETGhZblVHRHEzcHMvaTY0clNWYVZ6RGs0L0R3Uzc4Mm9R?=
 =?utf-8?B?bjB2OVB6Rk1ZOU91QWRtZHJHS2dXNGpCVjdwWEZjRStiOW9FRWhNeC94KzZH?=
 =?utf-8?B?Z3RPZThLMEtkQWpXWVRlTFQ1STU2cThpVmtTYlRqaVlzdTZzRFRNQk91a0Nw?=
 =?utf-8?B?dFBTcWQ4aW94Q1hkUjB4eUdNREVCcmFrbzNHdGh0UEtkOTNGMGlUVmhXSm9o?=
 =?utf-8?B?QVJzS3ZwUnQ5dm9XdWpWaDIxSElZRkZUSnJlSVpGbjhLSXRGY0pKeSsxUWVP?=
 =?utf-8?B?L0lkVWlCQVdsNnZCM0xndGZPWlEzZ3J5Wnc4ZGpLRkROSDlZY0d5STBKTUNO?=
 =?utf-8?B?bjBkTEltRVZXOTJFOC9qVUxTR1c0MzlDS2VwVGFzSVVnU2UyS3lIMHFVM0Q3?=
 =?utf-8?B?MnJRZkJUQjd2UlByOHJwOHFBMkVsWEZkdkVTL3dCQ3RXUHlxYzd3QW02OGJx?=
 =?utf-8?Q?l9wuqxchtXuaN584gFK3PyMutOzu6na+QxKp05T?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F2E457ADED1D354A83D5281BC0EA4180@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d49e6b-6d87-4f66-b7bb-08d9272338ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 06:37:27.6881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQ1daDt9J+09kWzwvSKzyl7kP0bayHHtjI+s2XurzbKAyCeVXsT3wiQ6b4LzFFcRSM0b6wV4+FEFcVBB4HajvnzOtbqdq8oufeJMN5680B2/TPOn9V+Qh5cKHsWc5LfD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7346
X-Proofpoint-GUID: YUW_1-TV_98wmwVQ9J6W-cdO_KCK-VH5
X-Proofpoint-ORIG-GUID: YUW_1-TV_98wmwVQ9J6W-cdO_KCK-VH5
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0 adultscore=0
 mlxlogscore=863 clxscore=1011 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106040051

SGksIGFsbCENCg0KV2hpbGUgd29ya2luZyBvbiBQQ0kgU1ItSU9WIHN1cHBvcnQgZm9yIEFSTSBJ
IHN0YXJ0ZWQgcG9ydGluZyBbMV0gb24gdG9wDQpvZiBjdXJyZW50IFBDSSBvbiBBUk0gc3VwcG9y
dCBbMl0uIFRoZSBxdWVzdGlvbiBJIGhhdmUgZm9yIHRoaXMgc2VyaWVzDQppcyBpZiB3ZSByZWFs
bHkgbmVlZCBlbXVsYXRpbmcgU1ItSU9WIGNvZGUgaW4gWGVuPw0KDQpJIGhhdmUgaW1wbGVtZW50
ZWQgYSBQb0MgZm9yIFNSLUlPViBvbiBBUk0gWzNdIChwbGVhc2Ugc2VlIHRoZSB0b3AgMiANCnBh
dGNoZXMpDQphbmQgaXQgIndvcmtzIGZvciBtZSI6IE1TSSBzdXBwb3J0IGlzIHN0aWxsIFdJUCwg
YnV0IEkgd2FzIGFibGUgdG8gc2VlIHRoYXQNClZGcyBhcmUgcHJvcGVybHkgc2VlbiBpbiB0aGUg
Z3Vlc3QgYW5kIEJBUnMgYXJlIHByb3Blcmx5IHByb2dyYW1tZWQgaW4gcDJtLg0KDQpXaGF0IEkg
Y2FuJ3QgZnVsbHkgdW5kZXJzdGFuZCBpcyBpZiB3ZSBjYW4gbGl2ZSB3aXRoIHRoaXMgYXBwcm9h
Y2ggb3IgdGhlcmUNCmFyZSB1c2UtY2FzZXMgSSBjYW4ndCBzZWUuDQoNClByZXZpb3VzbHkgSSd2
ZSBiZWVuIHRvbGQgdGhhdCB0aGlzIGFwcHJvYWNoIG1pZ2h0IG5vdCB3b3JrIG9uIEZyZWVCU0Qg
DQpydW5uaW5nDQphcyBEb21haW4tMCwgYnV0IGlzIHNlZW1zIHRoYXQgIlBDSSBQYXNzdGhyb3Vn
aCBpcyBub3Qgc3VwcG9ydGVkIA0KKFhlbi9GcmVlQlNEKSINCmFueXdheXMgWzRdLg0KDQpJIGFs
c28gc2VlIEFDUk4gaHlwZXJ2aXNvciBbNV0gaW1wbGVtZW50cyBTUi1JT1YgaW5zaWRlIGl0IHdo
aWNoIG1ha2VzIA0KbWUgdGhpbmsgSQ0KbWlzcyBzb21lIGltcG9ydGFudCB1c2UtY2FzZSBvbiB4
ODYgdGhvdWdoLg0KDQpJIHdvdWxkIGxpa2UgdG8gYXNrIGZvciBhbnkgYWR2aXNlIHdpdGggU1It
SU9WIGluIGh5cGVydmlzb3IgcmVzcGVjdCwgDQphbnkgcG9pbnRlcnMNCnRvIGRvY3VtZW50YXRp
b24gb3IgYW55IG90aGVyIHNvdXJjZSB3aGljaCBtaWdodCBiZSBoYW5keSBpbiBkZWNpZGluZyBp
ZiANCndlIGRvDQpuZWVkIFNSLUlPViBjb21wbGV4aXR5IGluIFhlbi4NCg0KQW5kIGl0IGRvZXMg
YnJpbmcgY29tcGxleGl0eSBpZiB5b3UgY29tcGFyZSBbMV0gYW5kIFszXSkuLi4NCg0KQSBiaXQg
b2YgdGVjaG5pY2FsIGRldGFpbHMgb24gdGhlIGFwcHJvYWNoIGltcGxlbWVudGVkIFszXToNCjEu
IFdlIHJlbHkgb24gUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRkDQoyLiBXZSByZWx5IG9uIERvbWFp
bi0wIFNSLUlPViBkcml2ZXJzIHRvIGluc3RhbnRpYXRlIFZGcw0KMy4gQkFScyBhcmUgcHJvZ3Jh
bW1lZCBpbiBwMm0gaW1wbGVtZW50aW5nIGd1ZXN0IHZpZXcgb24gdGhvc2UgKHdlIGhhdmUgDQpl
eHRlbmRlZA0KdlBDSSBjb2RlIGZvciB0aGF0IGFuZCB0aGlzIHBhdGggaXMgdXNlZCBmb3IgYm90
aCAibm9ybWFsIiBkZXZpY2VzIGFuZCANClZGcyB0aGUgc2FtZSB3YXkpDQo0LiBObyBuZWVkIHRv
IHRyYXAgUENJX1NSSU9WX0NUUkwNCjUuIE5vIG5lZWQgdG8gd2FpdCAxMDBtcyBpbiBYZW4gYmVm
b3JlIGF0dGVtcHRpbmcgdG8gYWNjZXNzIFZGIHJlZ2lzdGVycyANCndoZW4NCmVuYWJsaW5nIHZp
cnR1YWwgZnVuY3Rpb25zIG9uIHRoZSBQRiAtIHRoaXMgaXMgaGFuZGxlZCBieSBEb21haW4tMCBp
dHNlbGYuDQoNClRoYW5rIHlvdSBpbiBhZHZhbmNlLA0KT2xla3NhbmRyDQoNClsxXSANCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJjaGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOC0wNy9t
c2cwMTQ5NC5odG1sDQpbMl0gDQpodHRwczovL2dpdGxhYi5jb20veGVuLXByb2plY3QvZnVzYS94
ZW4taW50ZWdyYXRpb24vLS90cmVlL2ludGVncmF0aW9uL3BjaS1wYXNzdGhyb3VnaA0KWzNdIGh0
dHBzOi8vZ2l0aHViLmNvbS94ZW4tdHJvb3BzL3hlbi9jb21taXRzL3BjaV9waGFzZTINCls0XSBo
dHRwczovL3dpa2kuZnJlZWJzZC5vcmcvWGVuDQpbNV0gaHR0cHM6Ly9wcm9qZWN0YWNybi5naXRo
dWIuaW8vbGF0ZXN0L3R1dG9yaWFscy9zcmlvdl92aXJ0dWFsaXphdGlvbi5odG1sDQo=

