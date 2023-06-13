Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6507B72DF92
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jun 2023 12:33:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547996.855709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KM-0001lj-Kb; Tue, 13 Jun 2023 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547996.855709; Tue, 13 Jun 2023 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q91KM-0001j9-GN; Tue, 13 Jun 2023 10:32:42 +0000
Received: by outflank-mailman (input) for mailman id 547996;
 Tue, 13 Jun 2023 10:32:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aRu4=CB=epam.com=prvs=05285d8c61=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1q91KK-0001il-Ve
 for xen-devel@lists.xenproject.org; Tue, 13 Jun 2023 10:32:41 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d71503e-09d5-11ee-8611-37d641c3527e;
 Tue, 13 Jun 2023 12:32:37 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 35DAO5KY019280;
 Tue, 13 Jun 2023 10:32:33 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3r5yahmgn9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Jun 2023 10:32:33 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DU0PR03MB9706.eurprd03.prod.outlook.com (2603:10a6:10:44e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 10:32:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::6fa2:d7b8:9bd4:1a51%5]) with mapi id 15.20.6455.045; Tue, 13 Jun 2023
 10:32:28 +0000
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
X-Inumbo-ID: 9d71503e-09d5-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ECFcuEJk+JKFmeKInrb/bLSRIwP5S9Bje6ypSBeNHyWg91GQqmm1SIPw/kecxdrr9xHXYNEmGW9vVDX2hikzwTj7xwppk3L7xdeWYkjATDGieq3o3BLyafw8Hld2ALoPoGgThDyUNwVd1L1zwlEZldoDfwYpXuwKI7w0lsCUc79HjINkcFndjDzNQ0/4cUzYRJQEbSd2ifNq81HdQFMcnwIMRDaom1UQGOOjKrI9vN9sI+CJH+EpwYiSqgvdaPhry9cQQZOuZBerWCdWMRUc3CpBaKRP8q/CGG13S6QarTHzV2Lw4OEcgwFlZeTy0DtdPNwFwjN9l0nsEmxB8o9PMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pzQgHIvh4Yevy8ekMSaMLkJ3eNO1G8Dye2joimf+kvw=;
 b=Ra0yTTHywEBTBOL9yYWVFWcjIYwm/FS9zCVQu5wsMinN78qaZSQfO/UOLntd+eSXPWOTAhd/KVHA/XcYjt0yvlYmA6TsoazOZOSw87Po6bLd5klACbfs0aJgxgQGB1ILYDiRrTNyqWlI7obG/QX1875Xx6IU1mIEhtLS7d54Lhh6S8KXlGmGgrwnajH6KlM9bXJMykWAs8INsiC2j+nBUqUHY/8MHq2Fxhh8xJ0pKbFxKXphSRBdUYbsHolzt7RY9xJfu0XmnxQAbhSjVtM68FhHwKomdzJdOw9xmDgo5Mg/OjHbs1NHvDhVSpLM6AUCx7xsa1bgQJbpaGb/eLrEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pzQgHIvh4Yevy8ekMSaMLkJ3eNO1G8Dye2joimf+kvw=;
 b=YAkov4b/MnMMcd6PeiCvlKiTspNK4CZIy4Z4WA1i7B8W+tFvTo9YMYU0c4adTFqLR9OXatLQ7Mnd0S1/EP2i7tpoeij/ZaZbKhqcjYQTsofh2WdZIhmC2Bn6dmOg6OG5AbQEj46IsgXHjBPlvldNpUblYMdkRksppCXX059CusZvDq3sE6fDJYL8EALqRSbvOUbYV3L3DJVev227vFSFrIBYmLF3YY6hwVTC+TNuUQgsW4JoZCE5a3rfOtjgqw1f8eEFz8HxiRBd8sjYjp+6ylwAnA7fG8rCTeOSAOyjayevF1+95cZzPAuZRYOycqqY4p31Uk+JV+h7BLOzysFNow==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v7 02/12] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v7 02/12] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHZneJZ4Y/QK9l300mPh5Vy/DhSyA==
Date: Tue, 13 Jun 2023 10:32:27 +0000
Message-ID: <20230613103159.524763-3-volodymyr_babchuk@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.40.1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DU0PR03MB9706:EE_
x-ms-office365-filtering-correlation-id: 79d0447c-84d2-47f5-9546-08db6bf97c63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 O2noGJvs/dXZu12yDA5fO3BXQvQbkhuceF/ZQPIFteTvrQDGkIYsxp/ZKrDi29YjuE1YirCXKqI6oE+IbMKsCNep0apkdGDWazvtNVQWe+hHtNbTm7vQ4yXtduQNuXQC592C6//bxNM4LNhFYxT5qiNLCpoj9KXbPwktgYy4qwwJJxVwMYhuKpzdDNSmYh9rh1EZXG24rQ/kGJx11CRszrXdd90sUOFAY0k/vRL3Cnu+ukJ1K+DwOMDX8kRI+ESc1wBf3fxFGiAaoQ2QaeSzRtJn7RIPa4eglLOwHVShUfx4oqOhEnaBS8Dskn0U7tPUlijxEA9ttNLqAODTkOM+OCypCTPPeE8QRK7Bma79Z+YwOnzBRvnPYmlORbSDI2XU7VbCjHV6Np4mvNeDi3aU1ptP+K04mHuB2S2xe5aJygu8B5fYde7OEzpI6b3dC5tkURSd/Pw5oFb0EEesHUEj/ifXStjUOpshjTsllLOc0Irip5QCRMb68XbEqABl58QYrZbnBLZDN3Jn+f8iUlDhMPEzNty8ZONRInNmMYtvHP9eEkNNGw4SUaqDxwGg9ZkmDRXQQdQdjAkfkRZz00Ozl0p+pTdL3P1fGbXOcyr+18KPdQa5d7q2bq61hgeOPLT4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(91956017)(64756008)(76116006)(66556008)(66446008)(4326008)(6916009)(66476007)(71200400001)(5660300002)(66946007)(41300700001)(8936002)(8676002)(316002)(36756003)(54906003)(83380400001)(478600001)(2906002)(6486002)(38100700002)(186003)(6506007)(26005)(1076003)(6512007)(86362001)(55236004)(38070700005)(2616005)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?b3lyZjJicHJnNms0TS9mNzcvUk1LWFdObVlyU0RIVlArcS9oQkEvL2ZrY0FC?=
 =?utf-8?B?OHJjRWh6TWhpYW16M2tMZld2dCtWR3JxRTgwWDdIVDByZEZ1dXNPYWNjQ290?=
 =?utf-8?B?cDZxTGxJZTFQNWdvNnN4TnF4aStrQXRqdkVmd1cxVmV2a2xKMURxazRUU2Js?=
 =?utf-8?B?WG81WXovR2dwYzBsMCs5dW0rWXNjbllVeHlOMC8rNWVrM1lUUzZvQXdIRVVJ?=
 =?utf-8?B?dVhQWnRnQ1BrM2syMzlVbVdhdzNGUVhJd25LOWlkcytxdVhPWDUwQm9JZE9Q?=
 =?utf-8?B?ZFNFWTRnNXgwdlhCVlhpb1RNN2YwZTMzMVNZOXU3RWFzZzU2NENObVpEQVVy?=
 =?utf-8?B?dUZ6VkNTQk1obzVadEE0TDRjSVM4aS9kWmVxR0VaS3RRaTE0K2FXTWZBOCsv?=
 =?utf-8?B?SVJjYVp6SllIbFZiaWVuTExiSDRjeXJMRE9yMzlRWkVnbkxLcTFWajNWQVhx?=
 =?utf-8?B?ZVNGT081dUg1VUEyOUxUVlhTanBaVFVPSCtKM29IdDVTZUxIbC9hbkg4REpH?=
 =?utf-8?B?R3JhdGQ0WVJoQ3Y3aFkvVXhNU1lpUlJZUzkrVjZkZlhJMW8zdE9FbXdXZS9p?=
 =?utf-8?B?SlVOdXBSSzN4NlhTMDBGUFphbTNqNkNZK1Y4K3FjN1gwT3dydUQ5Ykd6VGsw?=
 =?utf-8?B?UUFNdkZkMVpncEc3ME1SbVl2VWJMUm9NdHVnWm94cG9UaUpHbFVic3pTcFNh?=
 =?utf-8?B?QnJJbUd1Tk13ajlxcnY0YUZlWHVBTktaSG03d2ZQczloQWdEUDJHRVFBbjRk?=
 =?utf-8?B?WlBkRDdBRkdWNUNmdWs3VFdIN0oxaThhMGUxc1FKME1heVROcjUyckJ2dVhV?=
 =?utf-8?B?RXpMekRKVDdTUXRzc0Y3eTg5cVh1NVhhZENJemtTTkVqVUQ3SlUwMk82bndS?=
 =?utf-8?B?UjJuY00wV2JnR1pybEZ2cjdkeWZrM2RCOEhUOVlqMzFkN01KYTJJVHd2T0dz?=
 =?utf-8?B?V0ZueDVQR3kzNFlxQVRwcGMvWkNnZjZ4OXovUGFJbndGUldXV202dGZjeFk1?=
 =?utf-8?B?VGoyeGFsc0RhMXpKSXA5ZnpnSXBLemRzOFl4UFZjSGNwTytWbXhaTTcvVzFZ?=
 =?utf-8?B?MWtmNFRJM2VMUThxbndJYTEzanAvbUVaK1dRVUVPRzJGeGhqalFVYithSWJB?=
 =?utf-8?B?ZHphMjExY3hvQU1ZbXlxU3k5eFB2RWFVczNHU04rVVd3VXJLTGkzcEl3UFNZ?=
 =?utf-8?B?cDJVZFpCVjg5Ymt4eURlalZ1QU9YVUZlMXV4Q05CRmVyZFFyaUtuVmIvSXJC?=
 =?utf-8?B?MlQzNlFiTXVJTURXcHZCWVB1YlNCSlR1MG9rK2p4V1dWNGdhVnFUNmNMaEpR?=
 =?utf-8?B?TXhTcXJZc1NyNWVyUkFmczZKajdwTXlEOWpZOU1zSzl4bWJVZUpqMW0yeDA3?=
 =?utf-8?B?VjRGRWtpWTJrb015OFgxUmFJK1Rtb24zM2Jzd2p3T0NKbUZmV09UbEpqM3U2?=
 =?utf-8?B?akJIMDFkN0RtaGlFTHQrb3hzbGdOcTM1TFlhNXZhVFhzV1V3UlU3OUtQMUpD?=
 =?utf-8?B?YVlWRGlCZDNWQ3pZRXloRis0NHVxRXhoM2JSM2tudkg2ZVZFY2J2ZlFkL0RD?=
 =?utf-8?B?OC9rYURVcGRmN0NVL0dIYS85V2I3UEJISFJFaHhZdjRyVGFmVHBESVB0WWpw?=
 =?utf-8?B?SksvK0VZNnNUVmJwYU45a0lMMVE0VVFpbnVIL0dRTGFta0NRSXJ5UFhaZmx4?=
 =?utf-8?B?U1g5ZkEvdXVENVFWWXFhOUMyZHUwbHNKYldSRGZ3dVAzTnNIVWZvbW0xcWF6?=
 =?utf-8?B?UENkRFFFcGdEd1VBL05pa0EyTmovNUdJMmxac1J2Rk9rTWcyOTF1WjhoWEpa?=
 =?utf-8?B?ay9VbGdBdDJyaXczSHNuZEYrMStweDRyNS85ZlUxeTFhdHk0L29tQmxqcVpJ?=
 =?utf-8?B?NXM1ckVTTDhEVXJIM0xneEtvR29DNHNFRjBOejgxamR2L1hKT2hlZTJ2TE9q?=
 =?utf-8?B?djFDWFlqTVNXczhwVjBvWVdsZGtuYUZCME96R3VLWnFRaTNPTTU5M2NJK1lQ?=
 =?utf-8?B?RWZmOTRtYVlDN1l5Tk0yWnhYekJKczFjK3ppZm1HQldXRGs4RVdhZW1BaXNU?=
 =?utf-8?B?c2ZRSWwrcnFEYnBkRElZcjlJTXl1YVpGT2l1MW54TmprY29mYUUyejNGQjR3?=
 =?utf-8?B?L3h6ckRQVENSeml3L1I0UUZmUjJwMXNHb1F0d3E4Z2FCYlN4U0lZL2JzT3hz?=
 =?utf-8?B?OFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FEA209BB4D4D8540AE421993A11836B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d0447c-84d2-47f5-9546-08db6bf97c63
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 10:32:27.2488
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E1YiMFiGL5YgB7NpFXpmEEm/3vvfLOZJrWb6NR3UXzGjLmcfPzg3WF3KY5VcojL4e7okg4LkPVeb8QxWUTGyNpQS/2tw8ZWPEfXUdwRO6BQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9706
X-Proofpoint-GUID: R15PgsG3ft5Sxe8Pli3J6NwUJ4UZDr0z
X-Proofpoint-ORIG-GUID: R15PgsG3ft5Sxe8Pli3J6NwUJ4UZDr0z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_04,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306130093

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KDQpBIGd1ZXN0IHdvdWxkIGJlIGFibGUgdG8gcmVhZCBhbmQgd3JpdGUgdGhvc2Ug
cmVnaXN0ZXJzIHdoaWNoIGFyZSBub3QNCmVtdWxhdGVkIGFuZCBoYXZlIG5vIHJlc3BlY3RpdmUg
dlBDSSBoYW5kbGVycywgc28gaXQgd2lsbCBiZSBwb3NzaWJsZQ0KZm9yIGl0IHRvIGFjY2VzcyB0
aGUgaGFyZHdhcmUgZGlyZWN0bHkuDQpJbiBvcmRlciB0byBwcmV2ZW50IGEgZ3Vlc3QgZnJvbSBy
ZWFkcyBhbmQgd3JpdGVzIGZyb20vdG8gdGhlIHVuaGFuZGxlZA0KcmVnaXN0ZXJzIG1ha2Ugc3Vy
ZSBvbmx5IGhhcmR3YXJlIGRvbWFpbiBjYW4gYWNjZXNzIHRoZSBoYXJkd2FyZSBkaXJlY3RseQ0K
YW5kIHJlc3RyaWN0IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KDQpTdWdnZXN0ZWQtYnk6IFJvZ2Vy
IFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KU2lnbmVkLW9mZi1ieTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KDQot
LS0NClNpbmNlIHY2Og0KLSBkbyBub3QgdXNlIGlzX2h3ZG9tIHBhcmFtZXRlciBmb3IgdnBjaV97
cmVhZHx3cml0ZX1faHcgYW5kIHVzZQ0KICBjdXJyZW50LT5kb21haW4gaW50ZXJuYWxseQ0KLSB1
cGRhdGUgY29tbWl0IG1lc3NhZ2UNCk5ldyBpbiB2Ng0KLS0tDQogeGVuL2RyaXZlcnMvdnBjaS92
cGNpLmMgfCAxMiArKysrKysrKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5j
IGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCmluZGV4IDEyNzAxNzRlNzguLjBiMTFkOWMzZjgg
MTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KKysrIGIveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMNCkBAIC0yMzUsNiArMjM1LDEwIEBAIHN0YXRpYyB1aW50MzJfdCB2cGNpX3Jl
YWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLA0KIHsNCiAgICAgdWludDMy
X3QgZGF0YTsNCiANCisgICAgLyogR3Vlc3QgZG9tYWlucyBhcmUgbm90IGFsbG93ZWQgdG8gcmVh
ZCByZWFsIGhhcmR3YXJlLiAqLw0KKyAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmVu
dC0+ZG9tYWluKSApDQorICAgICAgICByZXR1cm4gfih1aW50MzJfdCkwOw0KKw0KICAgICBzd2l0
Y2ggKCBzaXplICkNCiAgICAgew0KICAgICBjYXNlIDQ6DQpAQCAtMjc1LDkgKzI3OSwxMyBAQCBz
dGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50
IHJlZywNCiAgICAgcmV0dXJuIGRhdGE7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIHZwY2lfd3JpdGVf
aHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwN
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRhdGEpDQorc3RhdGljIHZvaWQg
dnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSwgdWludDMyX3QgZGF0YSkNCiB7
DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHdyaXRlIHJlYWwgaGFy
ZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4p
ICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAgc3dpdGNoICggc2l6ZSApDQogICAgIHsNCiAg
ICAgY2FzZSA0Og0KLS0gDQoyLjQwLjENCg==

