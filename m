Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD6E6DE739
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:29:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519957.807083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMTK-0001qX-A5; Tue, 11 Apr 2023 22:28:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519957.807083; Tue, 11 Apr 2023 22:28:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMTK-0001oU-7P; Tue, 11 Apr 2023 22:28:18 +0000
Received: by outflank-mailman (input) for mailman id 519957;
 Tue, 11 Apr 2023 22:28:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C0V3=AC=epam.com=prvs=8465a122a0=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pmMTJ-0001oO-0s
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:28:17 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2607fd85-d8b8-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 00:28:15 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 33BH66r3003071;
 Tue, 11 Apr 2023 22:28:00 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pw8jehpd8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 11 Apr 2023 22:28:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB6870.eurprd03.prod.outlook.com (2603:10a6:20b:29f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:27:46 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6277.034; Tue, 11 Apr 2023
 22:27:46 +0000
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
X-Inumbo-ID: 2607fd85-d8b8-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KMfA1SKBtkQTIq0hIBTVNbba8WABg5EJ122/OmR8G+fKHrexC6TSLJWYRc2GZhwVt5pxy7M8BzzUhpc6eyyjl9/lxIjPhZj1zwpyoMtEQMQfugF4JSWUIgSP86g0vVGfNuY0KjKZDA4mgdFAiduAGsStgWunX6nMIwBtHIrjV5TTpEorSoHmwxvFwy1TWHzDUQU+Z2qr0b70a/L2RRRX1fSpBO3GT+bCWzfRFKy68I8Rgyz3X1qcKp+/Rgg7stvnAQGyZDL675ebCZECa8GwHdfZw2JxbYwNDkRrfEDcK1RdYDXHFbCvfyxC0PaalgAktbUIg8nZPJpL1dU502gIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkiCktxs4VSNFb5+LI+rK6V+Cf5t5MxyAXN+OKTAnxI=;
 b=d9OrkvNA6ItuYIfSJOO4TQsKBtkzIdzTYIHbLGWpH0fCO77DNO7W8Teu8rcpl7/uiKtW0+bZg9wGNJz8Ya0aX01Re79UM74AqqqfBe8vlZOPVYucZwEPg5yki6Irx2RBVi1uTuEckze5Db1FChjA89Zf+BYTIGgI9/RFID+zPNoJ695CkgXS7RJkPKoPWYzeUPpChNBL+BNpZeQP+xannzAFCEq2Qhd5AP4vsewcpjs4gNd1ZLy9GJOqo1BxqRsY9ZXwt9j7AMPF6O+m6PIA1RYeihwzRaMrc5hwGUu0Gfmt9TEUL8ZI8nPIloE5c6EPWLasIE6h5pkLIusWFt+95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkiCktxs4VSNFb5+LI+rK6V+Cf5t5MxyAXN+OKTAnxI=;
 b=SD5sjgMZOvEPaEQL22m58WNiijf6em28tO0Bc6ZKnIqn1cWjlJ4p/34NSeWv/NoVMH9mSVIrqTgD++yktJr+ktwnT1Qn6C1FrHkfJC4BogfK/h8uaWpwDACm9MobVWr37Dg1TvYDeMDmo7r2GssgVnTXfjThpzmC0Q9ZHKGGGax/KnyalK2eOw0gKdAI9c65iijGz+Ml0FLnI9uWoGlRkvsgwD6PRuIrZnPURoAfai5XZTbg8uossrRarZIH9rZDFXBT7Kna2CIufHgy6c7M+C+RTddtp9zPpqlIZh8Gxszd5UXs11Q47YMuO7SN4mb95pOMrIVAsmPoFqHVAoV6RQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrew
 Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/6] xen: add reference counter support
Thread-Topic: [PATCH v3 1/6] xen: add reference counter support
Thread-Index: AQHZVrdyBx9pogLqRUq3RbhGdjZNSK79cEwAgClpiQA=
Date: Tue, 11 Apr 2023 22:27:45 +0000
Message-ID: <87h6tmxden.fsf@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-2-volodymyr_babchuk@epam.com>
 <ZBMfpnzW4YdqEiA0@Air-de-Roger>
In-Reply-To: <ZBMfpnzW4YdqEiA0@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB6870:EE_
x-ms-office365-filtering-correlation-id: de4f9997-687e-4b4a-5603-08db3adbf973
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TjrnYb+lenGgK2LgbYUoRT+69DB9ECEkUNOzfE19N08uZFgNS0AhGtHK0nI13nUKtlPqMjxxJnDvy6tbMYW7xoDUZ/kEFYYuN/d821rSeJwywfiNLaA9xWuTPgdr46XsCNVSvGB1MLg8j5IEd0kdc8IfpovEA6YyOiZgPCyZNx5n9w40+g/Goeagf1watIpOjklnLL8S/1FnH2t7bHcICzDEPAVC8BKSreQMTYbAfp4m24Q4Bkzj5UYbQAre6nM7GF16kyvSu2h/5Yddj+qDet07W5cl8mh7qu4zsh80I7QbMFh3RgWc9LEeu6UxTXaQOZfJv6QbaeDMl9oWIJB0fMGsyP8aKVUWGwJ33ftl052Owd8glhYX7Rp+xF/lWNS0m8d1y4bmMyfe2wytG9bxRjjvCODjtoZ0/5JGMU4OUfpz+kI/4ggYC4NqKxA5Itq9a0/zzQuN+YYTk7rtvr3MeF0M1mmnRPvfEKqQPW1jhGiAluN2Fttv89v7xK1cV+Df4RaguYIDTIsZRvvS/htdwftsLA439cTCVY5fwNPCDgtZ4jxdQMi1Jnzlvt8ZTcrR63QGq5xRRHVlwj4ymQnuBsJQcQcSrZgNocjR6hnB3bjvktJ6ty39lwADNxG2Oom0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(451199021)(2906002)(38100700002)(6486002)(5660300002)(122000001)(71200400001)(38070700005)(83380400001)(8936002)(55236004)(6512007)(6506007)(41300700001)(26005)(2616005)(66476007)(66446008)(6916009)(66946007)(76116006)(66556008)(86362001)(91956017)(4326008)(8676002)(186003)(316002)(64756008)(36756003)(54906003)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q1U1QjVrS2ZzMFZaMVhRSndhcWtadXFjb0JoNktxRm9IQzJ4WDJVRnYyekh6?=
 =?utf-8?B?OVIyQnl1cTdOVE5CKzlwU3lmQ0ZRTGU5ckpsUXNNSFF5Lzl3WHMrWEhQV2dP?=
 =?utf-8?B?b2duM05mZ3hhMFlKcitBTG5JaVpFOWpSelNVdSs5SmhVb1VQVk9NTVZXcjdi?=
 =?utf-8?B?Um9aNTJDVzU3S2lQWmJzK3c1RHZ6Q0xZVWlFbloyeTUzdFBYczRDZXhOaEhP?=
 =?utf-8?B?ai9YM0ZKb3R1SmViYmNXRVljRFJBbjJ0TVQ2eGgrVVZJZE1zN2RMU21YQVFo?=
 =?utf-8?B?UUZTQ0xHSXUvUjNLd2FIRDhOYlJkUEtLTjBZdGN2byt5MDVMV2xsQW5ZcURx?=
 =?utf-8?B?SmV0QXMxTHBBbnhmYU1kY2U3N0JMdjFVTHJEN1h3RFpTUDdJUWZmbWxJRDkx?=
 =?utf-8?B?MTkxUzVLcDJtS2NtVzlyOE51cC92bEZIWU90L3ZuQ3k4aCtZbDJCVTB6cUJB?=
 =?utf-8?B?NUtiNDErNkprcU5QdkY1NkdHaGZwNDJjdHEyeStMa0d0T096bCt4QkMxWDdJ?=
 =?utf-8?B?N3lCK1ltK2E2VUk3T3JmTEpUTmJEa0pvYzhENkEwQy84ODF2S1ZIajFudFY4?=
 =?utf-8?B?eVBhUVByZTMxcGEzNkwxME9XWVMrMnZ1ZDc3T29hbGpnOG8wUmUyQTh5MWNt?=
 =?utf-8?B?WllmTW5FOTU2ejRvdThiOElJbDFoN0wvblRNQWs0Vkh2NnNGeTJMTlBzZXlF?=
 =?utf-8?B?NGJ0anBHdnRjYWFpeFVuV2xJNlphV01kdEFHWkFZajVKYkV6MVpOY1l1RWZR?=
 =?utf-8?B?OENuVEZZc3k4Z2JvUWlEMGE4RGVQL3J3TzFjWFU3dFIxZUlpR0ZjU21BV2x0?=
 =?utf-8?B?T2trenV6Y2hEeUtVOC9pWnFlTTlmZVVjYVVqR1NkMkdRa2hrZlZlbkdmRC9T?=
 =?utf-8?B?VjdVODJQa3llMFgzV0hkK0dhb1FiZ0JYZ0Vnb2grT1NKRDVhNnFDdXZ5WU5l?=
 =?utf-8?B?T0c3NVp3djRxdXo5Sm1BOFJucjVrUWdiN3EzTVRGOHZhMXlUYXRxWWhZNzZ0?=
 =?utf-8?B?dVZOMWtPRlBpQm5FL2xrNk9TNlFwZldUcWNRY1ppSFhSU29qNUhPUy8wK2Ft?=
 =?utf-8?B?VGlVOW9XU3VTWkEzQ3liOGM5Y055ZjVUR0Z1NCtHU1g1Nng5M1R6S0hJNGpx?=
 =?utf-8?B?djJXQ2lvRjVUQllsajNRSGtSamwyMFlqUFoyZU9Cd1lJM0N6eFAzMEpnVEdY?=
 =?utf-8?B?SjdXekFoK2NUb1JmZ3hPeHgweTN0NDdQYStEd1hNVnlxTTlGZ0J6cjZ2YlVj?=
 =?utf-8?B?eDh4TmtueVBuOXRZVmJuZ3ljNVU2K1FmWFdWeE43NjZ4SHpvUjk0UW9UQUcx?=
 =?utf-8?B?VmxQQWcrUmt5RDZLUVcreUJhVFpZc1AxTDI3a1VUcUg5SmZaQ3pKdVlYenhs?=
 =?utf-8?B?QmVQYVlwT3oraCtPd2huNzFndUN2cklmcUdjQmRsVW1ONmpLQ0V1TStvbGU5?=
 =?utf-8?B?V3NPd0dEYkprbTVrY29ZSExodFlwWFRSQnZhM3h4VjBSNjBtMVBFdnR2Yno3?=
 =?utf-8?B?TTdOZWJoSmRmQ1RFOEVQeXBZVzZXaW5tRDQrY0JXOWZYY2JBb1BRMEtlQXRr?=
 =?utf-8?B?Q0VHL1pnVEtSOTZ0TEYxeWZ4N3c1Q1FlWWZPT2E0ckNZU0RnbnF1TFBGK2t2?=
 =?utf-8?B?WFFjdjh0VlpZRkN2QUFsWDN6YU55SmNONEQyNFhkMEtuVnY2QlNOb290bmo1?=
 =?utf-8?B?Mkxzd3JOZEU1MzA5SmNUcEZRcnRna2xaMjgydE9EN2FnMENiUDdlc0JmVzVL?=
 =?utf-8?B?WkhGbEtKZ2VrWitJYWQremIwRFc4Si9qUVJ1WHl1LzJmMTRyZCtPZmhYR0U0?=
 =?utf-8?B?bjhKS1ozOEdpRnJMSm9SQnF2di94Y2ZhSW1Oc0pPYkthYTkveFVpRmZvaFZC?=
 =?utf-8?B?NjZOazJxNktYdFQxKzA4Z1d3UkMzdnh3Y1pKbjBGNTg1ZFV3aEQ5dTIrVVpV?=
 =?utf-8?B?RGhjeFVRTDgxaTBqWXg3WGpOb0VzWHZNaW9ZWFVtQjkzVHFQdG1QNGlHNDJk?=
 =?utf-8?B?NzgxdWhnYUxQRTlhVEJIWFVCWXlqTDFFWEE4NEdyZEtNNVVCc1MrSVJEeUxk?=
 =?utf-8?B?Ujlid2hlaHBDWXJjdGpZT2hKZzk4dWNmRVJKTC9GdFMxTFAzWitDN3NzMjhm?=
 =?utf-8?B?QUoyc0NYa05VZjgzY2FuVzc0dXpvVkJhd01oQWg5VUx5NW0yN2VnSDJscUJV?=
 =?utf-8?B?aFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5E946897F8C693429C3A38C9D0704C15@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4f9997-687e-4b4a-5603-08db3adbf973
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2023 22:27:46.0247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AfybyA4BX7/UhsfbxqHIPjCf2V0CDwW6cxxvqht+qWYTG1xcA5gc92s7fONUcM2ayIUF4YdInnsq6G5Am7hagxx2YwaPkNyDDowjEEe3BDo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6870
X-Proofpoint-GUID: JuQqmSocrXSbpyv1VGRk_no9VtP0zqXJ
X-Proofpoint-ORIG-GUID: JuQqmSocrXSbpyv1VGRk_no9VtP0zqXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_16,2023-04-11_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1011
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304110202

DQpIZWxsbyBSb2dlciwNCg0KU29ycnkgZm9yIHRoZSBsYXRlIGFuc3dlci4NCg0KUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyaXRlczoNCg0KPiBPbiBUdWUsIE1hciAx
NCwgMjAyMyBhdCAwODo1NjoyOVBNICswMDAwLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+
IFdlIGNhbiB1c2UgcmVmZXJlbmNlIGNvdW50ZXIgdG8gZWFzZSB1cCBvYmplY3QgbGlmZXRpbWUg
bWFuYWdlbWVudC4NCj4+IFRoaXMgcGF0Y2ggYWRkcyB2ZXJ5IGJhc2ljIHN1cHBvcnQgZm9yIHJl
ZmVyZW5jZSBjb3VudGVycy4gcmVmY250DQo+PiBzaG91bGQgYmUgdXNlZCBpbiB0aGUgZm9sbG93
aW5nIHdheToNCj4+IA0KPj4gMS4gUHJvdGVjdGVkIHN0cnVjdHVyZSBzaG91bGQgaGF2ZSByZWZj
bnRfdCBmaWVsZA0KPj4gDQo+PiAyLiBUaGlzIGZpZWxkIHNob3VsZCBiZSBpbml0aWFsaXplZCB3
aXRoIHJlZmNudF9pbml0KCkgZHVyaW5nIG9iamVjdA0KPj4gY29uc3RydWN0aW9uLg0KPj4gDQo+
PiAzLiBJZiBjb2RlIGhvbGRzIGEgdmFsaWQgcG9pbnRlciB0byBhIHN0cnVjdHVyZS9vYmplY3Qg
aXQgY2FuIGluY3JlYXNlDQo+PiByZWZjb3VudCB3aXRoIHJlZmNudF9nZXQoKS4gTm8gYWRkaXRp
b25hbCBsb2NraW5nIGlzIHJlcXVpcmVkLg0KPj4gDQo+PiA0LiBDb2RlIHNob3VsZCBjYWxsIHJl
ZmNudF9wdXQoKSBiZWZvcmUgZHJvcHBpbmcgcG9pbnRlciB0byBhDQo+PiBwcm90ZWN0ZWQgc3Ry
dWN0dXJlLiBgZGVzdHJ1Y3RvcmAgaXMgYSBjYWxsIGJhY2sgZnVuY3Rpb24gdGhhdCBzaG91bGQN
Cj4+IGRlc3RydWN0IG9iamVjdCBhbmQgZnJlZSBhbGwgcmVzb3VyY2VzLCBpbmNsdWRpbmcgc3Ry
dWN0dXJlIHByb3RlY3RlZA0KPj4gaXRzZWxmLiBEZXN0cnVjdG9yIHdpbGwgYmUgY2FsbGVkIGlm
IHJlZmVyZW5jZSBjb3VudGVyIHJlYWNoZXMgemVyby4NCj4+IA0KPj4gNS4gSWYgY29kZSBkb2Vz
IG5vdCBob2xkIGEgdmFsaWQgcG9pbnRlciB0byBhIHByb3RlY3RlZCBzdHJ1Y3R1cmUgaXQNCj4+
IHNob3VsZCB1c2Ugb3RoZXIgbG9ja2luZyBtZWNoYW5pc20gdG8gb2J0YWluIGEgcG9pbnRlci4g
Rm9yIGV4YW1wbGUsDQo+PiBpdCBzaG91bGQgbG9jayBhIGxpc3QgdGhhdCBob2xkIHByb3RlY3Rl
ZCBvYmplY3RzLg0KPg0KPiBTb3JyeSwgSSBkaWRuJ3QgbG9vayBhdCB0aGUgcHJldmlvdXMgdmVy
c2lvbnMsIGJ1dCBkaWQgd2UgY29uc2lkZXINCj4gaW1wb3J0aW5nIHJlZmNvdW50X3QgYW5kIHJl
bGF0ZWQgbG9naWMgZnJvbSBMaW51eD8NCg0KV2VsbCwgSSBjb25zaWRlcmVkIHRoaXMuIEJ1dCBp
dCBpcyBtb3JlIGNvbXBsZXguIEl0IGhhcyBzZXBhcmF0ZQ0KcmVmY291bnQgbW9kdWxlLCB3aGlj
aCBqdXN0IGNvdW50cyByZWZlcmVuY2VzICsga3JlZiBjb2RlLCB0aGF0IGlzDQpjYXBhYmxlIG9m
IGNhbGxpbmcgZGVzdHJ1Y3RvcnMuIEkgYW0gbm90IHN1cmUgaWYgWGVuIG5lZWQgdGhpcw0KZGl2
aXNpb24uIEluIGFueSBjYXNlLCBJIHRyaWVkIHRvIHJlcGxpY2F0ZSBMaW51eCBiZWhhdmlvciBh
cyBjbG9zZSBhcw0KcG9zc2libGUuIE9uIG90aGVyIGhhbmQsIEphbiBzdWdnZXN0cyB0byByZXdv
cmsgQVBJLCBzbyBpdCB3aWxsIGJlDQpkaWZmZXIgZnJvbSBMaW51eCBvbmUuLi4NCg0KLS0gDQpX
QlIsIFZvbG9keW15cg==

