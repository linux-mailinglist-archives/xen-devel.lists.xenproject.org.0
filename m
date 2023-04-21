Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 662386EAB2D
	for <lists+xen-devel@lfdr.de>; Fri, 21 Apr 2023 15:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524580.815630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppqPZ-0001U4-Lq; Fri, 21 Apr 2023 13:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524580.815630; Fri, 21 Apr 2023 13:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppqPZ-0001RI-Ig; Fri, 21 Apr 2023 13:02:49 +0000
Received: by outflank-mailman (input) for mailman id 524580;
 Fri, 21 Apr 2023 13:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YfVw=AM=epam.com=prvs=8475e47d9c=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1ppqPX-0001RB-Vk
 for xen-devel@lists.xenproject.org; Fri, 21 Apr 2023 13:02:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd3de100-e044-11ed-8611-37d641c3527e;
 Fri, 21 Apr 2023 15:02:43 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33LA6K2E017901; Fri, 21 Apr 2023 13:02:38 GMT
Received: from eur02-db5-obe.outbound.protection.outlook.com
 (mail-db5eur02lp2107.outbound.protection.outlook.com [104.47.11.107])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3q372hku5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Apr 2023 13:02:37 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6465.eurprd03.prod.outlook.com (2603:10a6:20b:1b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.49; Fri, 21 Apr
 2023 13:02:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9b45:4d32:a743:d5e3%3]) with mapi id 15.20.6298.045; Fri, 21 Apr 2023
 13:02:33 +0000
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
X-Inumbo-ID: cd3de100-e044-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dcc1i3mh3JNbsDdbYgryjrYaY4a9tf0et6CcHqQGaXpegtg6sSVfLd4V2vlYfmskhDbEG7caZwFdmbVRfKkINCz+ez6Z0WrKvJaqoArjghhScNng5cnWUndyV48rm8rGoLx2BcLD58AcKO1q5uxGEmqMHEfL2pyg50qXSc2P6gfTDEiiNTcrgoziVjXxwFGBtgcOUjwtEbTPYXfREVQ2G7EWIF0vgNEAhO6RbUtqDnQa4Be0hgaUzWMW6rPxOcrkOv1z/SQ+ngYXEoHCN98tFZ4aGaAqkXivCpD0YHPjaiMkYBzXqGNHfeMU3S8G0lKjnXskUnRLiYmD4EMbxdqZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUyX2dYvxqrGMER1SUiKatz+f2i6jGdC1T0t6ZOvL+8=;
 b=B3emrQGUJj8WIWBcCt8pPkdXjdhifbPUombIDyCR5hBW4e+D2z+RJRG1qOyn38q3wmhHsfnZ7w9W99+5M8NKM1ZHoKFF/esoCr53P622dz+8H/+5Zm0va33JqW/ef1AdDj5Dv4C33fBrGucX1X8E4zTtA5vSfcMvP4OkpdHoffkZ9VBxwkxWpNTzNuXl8e5oRY+Cw/datVHQOxXNc9XVu3Rbtqvy1gDNsBpSHXpBVllBKjFkmvmqF+L1vx08U8+t5JIim1jQHF4mJ7sv41qMJSIbxnaTTCFuQSeVl2t2xA9TWUZNoWiG1SCDL2Kx6hxDe7BhPIRAmEMwhWOZdNTUVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUyX2dYvxqrGMER1SUiKatz+f2i6jGdC1T0t6ZOvL+8=;
 b=a7Db/1jFI7BDP+F489PyXHtWsQjheYcBpR9RcMj4jQTYoHGnqFtSR+LHJtH1xVSziLZBuqSQsNzds0wyzukYt9cHNMqHTTKcAMrCBML8uLy1pJI6Zp4oZ5Z3Bg9y8MlA+TmxcAdahZs5zH++SV2Xwfj8Tbf0zFw/F1ty88FBOKsLLCab0ZaDgOdnOWjBpl7fnW65gxCN5XFtE8UOdM8fWnWT/vc1CwaTTqGTEpcJqYBFArXuLZ3Ep+ao2qbg0pAMuykuXRIq2sGHpSSWV5BPqW/6TkbArP3pAtNJyNr3AYrqRb/p0mz+OHoDsXtWwYm1LjG5m4TJeisFWrEKxGzixA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George
 Dunlap <george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>, Kevin Tian
	<kevin.tian@intel.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Topic: [PATCH v3 2/6] xen: pci: introduce reference counting for pdev
Thread-Index: 
 AQHZVrdzsdckomMx4kauxHkZQ597Iq79mAMAgClI2ACAAK/igIAAVGGAgAGe14CAAJvOAIAFXoKAgAAEr4CAAAS6AIAGQ32AgAAf0YCAAAVEAA==
Date: Fri, 21 Apr 2023 13:02:33 +0000
Message-ID: <87v8hp75hz.fsf@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
 <20230314205612.3703668-3-volodymyr_babchuk@epam.com>
 <ZBNA9q5DXJYG3KVp@Air-de-Roger> <873556xa0g.fsf@epam.com>
 <ZDZ2S4OxP2e12oSX@Air-de-Roger> <87v8i0wyv0.fsf@epam.com>
 <ZDgZEZIG89oW6rEw@Air-de-Roger> <87leivw8qp.fsf@epam.com>
 <ZD0cyXLt1knXyUzA@Air-de-Roger>
 <963624f1-a36a-5d48-c34f-552d9d6c4950@suse.com>
 <ZD0krtCOrEwiKMFP@Air-de-Roger> <87354t8pqg.fsf@epam.com>
 <d9ab412f-b1d1-3fef-a956-05373ce76dd2@suse.com>
In-Reply-To: <d9ab412f-b1d1-3fef-a956-05373ce76dd2@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6465:EE_
x-ms-office365-filtering-correlation-id: f303242d-8dde-42c7-fb88-08db4268ac59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vIl5SCmGe0RJu0Qg3cp32rcYwhiL7VlIvxe8PFZl05v2ZXbml2ytoXm8taSCfkfAql7Vp6pprRWI3D0SK88zqTr6pG2EGAbdEMc9hSRbnvc5vWS3TolkD/lyhMxo50Pdop3kG+4/C3YAdHfLYRwX+050NG8BN7XxW3x2Q6QvfjwDRgfod9ysvI3dU0oiCTFM0WaJhampb59jiSfJsKHlVTIZXIhp0vX//SaZRbg+2UN2o23YyPAZG01m8UsKGJcwSckrDWpOEpc6wq2dbaR02POgvUWKg4FB/dOtpeGBAGB6uJuEvwGmhy5bC+OOG+ex7IVSWsT3VHc6j5VR1sEQX7VBjhOvBHKeQZEc3ypm27XXx+pBRiegY1M8abP+yKQA3+o748Qqc498ZKQwgdike+faE5pqQEZITbQzyYULSJtzgzAnZPiKJJVzPk/q/Umm9uUlXSYYXQlr7hqGETlt7ZkqzYig4wVW5jMS7yBKCkbvnCIwXytGjL2t4j59vVyMeSXUYco6CB4i7M6VcC6qs3/4fW9r2OoaK/AaQ3akk4TsG3r1SqiAqluOpbtXU/f9bC0zhhi+VmzOq0/5UZdkjz5NCCKXYRbQd0Gj7FHtBe+CpkQDrQShEJ8ea3hY4brl
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(451199021)(122000001)(64756008)(316002)(6916009)(66476007)(54906003)(76116006)(66446008)(66946007)(66556008)(4326008)(91956017)(6512007)(6506007)(26005)(55236004)(186003)(53546011)(38100700002)(2616005)(83380400001)(8936002)(5660300002)(8676002)(41300700001)(478600001)(71200400001)(6486002)(86362001)(36756003)(2906002)(38070700005)(7416002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?YTRJdnRZaU40OGw4c1dzbUprMmJpelczVzBLVHc5ZGNnTUttOVRoMkUwa25B?=
 =?utf-8?B?dVZLZllJVlphejRldnZ6V094U2pwMlhDRjFFZkZIQTNtRC9JOVlsMEoyZFVW?=
 =?utf-8?B?ZWNSdlVwaG9GTGY1SVdHdGNRVUgzNG0wWmdTTlUxcnpuUWlBUUdQeGhJTlha?=
 =?utf-8?B?MHNadlZKa3RXeDUwWUZqQTd0dTRncS9xS050azZUNUtKVTMzN3dOZDBrK2Fr?=
 =?utf-8?B?bVJHY0pDZnJTTnpWdUo5TEcxWWwyTUYySzdTQjZsMTAzL2xwTUcxVnl1Smhn?=
 =?utf-8?B?ZXJ3SXpuckNOb2lucTVWVUJDUlpQRHpDeW5ITVoxMlcvbjJrOXZDb0RqSUQv?=
 =?utf-8?B?ekNtd1dZMjFWYWViS1FxZUo4R1VlcDBaVit0RzgwZzNLbVAxZlZwQ0srU1hl?=
 =?utf-8?B?M01DSDdHSGMxaHVQMmtJWlNCYVNxV0NFR2YyT01VeXV2U3A1L3kwQUdMSUxi?=
 =?utf-8?B?aEZkR1BjTXhNZUZZdEFtN2NKVVlJdGVoYjFOMytlMmN6andRNjgxZGlCSVpZ?=
 =?utf-8?B?cEp4amNKeTNTV1JKREJodkpPclI3RU4rR3BkVkVEUHE0NnY0dnE5Y1J5ZFVy?=
 =?utf-8?B?MWh2cUpWM3FoSWMwRE82cWpUa0I0ckU1QVdUL3JsREFDbGV1Slg5QytKR24w?=
 =?utf-8?B?eEZPNk1ERmhMeWRlSlQxaytHZGVxZFkvRWxyRzIwU2o5U1N2by9xRFVuOGZx?=
 =?utf-8?B?Y0p2YW80RFJUTGFGdjQrcHF5NzFkZkRVeW5SWTI2SnBVTTFrYThCQzl4Ky9C?=
 =?utf-8?B?YUtSUnE4emxEVUVsdGVac2FEYVZEMC9lU0xvS1grMDVZRXpXM3R3YllOUmZh?=
 =?utf-8?B?K01YeW9OcUlib0hyNUxQaFl3UmdvTU9VZmppWjlmcWFVL3NoWk9DUkR1cEF6?=
 =?utf-8?B?MVBOVk5NeEtUTzA3anNUTkVYMUJ4MUZRZlVkOWRRZW16NTZHa2p4OEpTdVhQ?=
 =?utf-8?B?a3k3M0pvRXYvMlVyd1pieG5GbG1xckg4MUQxaWhKbm5pY0pPZHd5RU5rRjRI?=
 =?utf-8?B?WlRxVlBBTHFIV3hrenU0dkhqajBXcDlyS28yaTFmZVB0MDB1d2lVcXNVenJY?=
 =?utf-8?B?eU1RaC9VdWdabmhWVTVpUGRFYzB5QXdWak1XMjFVaHUwdnhTblRXOWlzSWlL?=
 =?utf-8?B?R3Q3dXh1aUVxZlZEWE5BdXZoNWpKbW5LMGpaSVVNNktmbEc5V2xvTFNIS3pM?=
 =?utf-8?B?NnVNUG1Ed2J2c2xabkJIbWYrbnFla3lmZ2lDT3NhYVZEWG9KWXltaWloQVFC?=
 =?utf-8?B?S1E4WkxrcmxNcFVrVit0ampHWnU1SkVMV2IxQmE4WHpnMlRGQkorN0F5Zmlt?=
 =?utf-8?B?bjV3RDV0UllPSzA1RGlBTGJQZ0dDUGVDc3hkQkgwV1JidFJNNHB4cGEzeW9y?=
 =?utf-8?B?QVdpMFdhYUdreFNnTzVsb2c2a0YxMFFOQXBvcnh4YXhGK3F6cThqRDdhT0Jt?=
 =?utf-8?B?SWZRYlc1MGZWVUEvN2s4Y3U0dEtwclpFa3pzRkYxVU1GeWxidHVQeE96ZnZO?=
 =?utf-8?B?azg0N3RyMDJWdnVQenFrRFNwYzVIR29nTGI4MU5CdCtLbVNSb3AxUUlaS1hG?=
 =?utf-8?B?dldvRERhWS9RK1I1alJuUkxyZnVRc2hDUUlPQmE1ZDlYR2luQVFQdnNja3h0?=
 =?utf-8?B?RWxJT1E1RjVLZElBQkZpa0ZQUmVRazN5U0MxaWQwUjdvSHNNYUJza0xBR215?=
 =?utf-8?B?OUUwekxXWFdwdE9rMmFsbFhIMTVVV0xZazhUQTVHbG9kS29vbVBrZXFmS2pN?=
 =?utf-8?B?OGxxTkhzVTNWYUhzNmpoU1NVcHJxeGtucHoxSXNqRW5wRXBjN0Iwd1FKVll5?=
 =?utf-8?B?UjJNbHVwTEY3cUJrWWFSOVc1bDJCWCtuY1BWbHRKemxGOWYrdXBOaStFNkwz?=
 =?utf-8?B?MFFaNmZ0Q01jYWJycTlPdjRXa2pndnpQSER1ckNtVEhKcWxkenZKTlJuRitx?=
 =?utf-8?B?WndwNEZUNnVsQ2NXcTVEczVEb3hMN1NBV25CcW0vRDU5MWp3R29EaFRpK1or?=
 =?utf-8?B?ZDJCNGNobnpXc1pmalNiWEZIWHdlYnZlYzBLYVNKajZrM2lyZzRqS2xma3RC?=
 =?utf-8?B?bURYN3YzZ0xPUHlFemVXMndZUnRLb1U5aE0wQ293Nnp1clhUemM4SFlkZGIx?=
 =?utf-8?B?M0JYS2xBNXBIRGZlVkdzWVdMZEF2YitDUlRDb2pPVWRCNjFPdUVjYUlhL04y?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AFAFC34D145C5D41A275917467F7D243@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f303242d-8dde-42c7-fb88-08db4268ac59
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2023 13:02:33.8065
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1yTJl8sAQ1tSIdlIuZfJf/OexF4SIuaCTKMVebEYbZU5MsLfIYp8gGx2zwzxEYalUvE1ExX0OuFVQidTQKSi4QwCToVFkPOvHQJVsM5K0xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6465
X-Proofpoint-GUID: Ot-2W9zlodlPxvTyu5iWgxFvM4glXPkV
X-Proofpoint-ORIG-GUID: Ot-2W9zlodlPxvTyu5iWgxFvM4glXPkV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-21_06,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304210113

DQpIaSBKYW4sDQoNCkphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KDQo+
IE9uIDIxLjA0LjIwMjMgMTM6MDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3RlOg0KPj4gDQo+PiBI
ZWxsbyBSb2dlciwNCj4+IA0KPj4gUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+IHdyaXRlczoNCj4+IA0KPj4+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDEyOjM0OjMxUE0g
KzAyMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNy4wNC4yMDIzIDEyOjE3LCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4gT24gRnJpLCBBcHIgMTQsIDIwMjMgYXQgMDE6MzA6
MzlBTSArMDAwMCwgVm9sb2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+Pj4+Pj4gQWJvdmUgSSBoYXZl
IHByb3Bvc2VkIGFub3RoZXIgdmlldyBvbiB0aGlzLiBJIGhvcGUsIGl0IHdpbGwgd29yayBmb3IN
Cj4+Pj4+PiB5b3UuIEp1c3QgdG8gcmVpdGVyYXRlLCBpZGVhIGlzIHRvIGFsbG93ICJoYXJtbGVz
cyIgcmVmY291bnRzIHRvIGJlIGxlZnQNCj4+Pj4+PiBhZnRlciByZXR1cm5pbmcgZnJvbSBwY2lf
cmVtb3ZlX2RldmljZSgpLiBCeSAiaGFybWxlc3MiIEkgbWVhbiB0aGF0DQo+Pj4+Pj4gb3duZXJz
IG9mIHRob3NlIHJlZmNvdW50cyB3aWxsIG5vdCB0cnkgdG8gYWNjZXNzIHRoZSBwaHlzaWNhbCBQ
Q0kNCj4+Pj4+PiBkZXZpY2UgaWYgcGNpX3JlbW92ZV9kZXZpY2UoKSBpcyBhbHJlYWR5IGZpbmlz
aGVkLg0KPj4+Pj4NCj4+Pj4+IEknbSBub3Qgc3RyaWN0bHkgYSBtYWludGFpbmVyIG9mIHRoaXMg
cGllY2UgY29kZSwgYWxiZWl0IEkgaGF2ZSBhbg0KPj4+Pj4gb3Bpbmlvbi4gIEkgd2lsbCBsaWtl
IHRvIGFsc28gaGVhciBKYW5zIG9waW5pb24sIHNpbmNlIGhlIGlzIHRoZQ0KPj4+Pj4gbWFpbnRh
aW5lci4NCj4+Pj4NCj4+Pj4gSSdtIGFmcmFpZCBJIGNhbid0IHJlYWxseSBhcHByZWNpYXRlIHRo
ZSB0ZXJtICJoYXJtbGVzcyByZWZjb3VudHMiLiBXaG9ldmVyDQo+Pj4+IGhvbGRzIGEgcmVmIGlz
IGVudGl0bGVkIHRvIGFjY2VzcyB0aGUgZGV2aWNlLiBBcyBzdGF0ZWQgYmVmb3JlLCBJIHNlZSBv
bmx5DQo+Pj4+IHR3byB3YXlzIG9mIGdldHRpbmcgdGhpbmdzIGNvbnNpc3RlbnQ6IEVpdGhlciBw
Y2lfcmVtb3ZlX2RldmljZSgpIGlzDQo+Pj4+IGludm9rZWQgdXBvbiBkcm9wcGluZyBvZiB0aGUg
bGFzdCByZWYsDQo+Pj4NCj4+PiBXaXRoIHRoaXMgYXBwcm9hY2gsIHdoYXQgd291bGQgYmUgdGhl
IGltcGxlbWVudGF0aW9uIG9mDQo+Pj4gUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3ZlPyAgV291
bGQgaXQganVzdCBjaGVjayB3aGV0aGVyIHRoZSBwZGV2DQo+Pj4gZXhpc3QgYW5kIGVpdGhlciBy
ZXR1cm4gMCBvciAtRUJVU1k/DQo+Pj4NCj4+IA0KPj4gT2theSwgSSBhbSBwcmVwYXJpbmcgcGF0
Y2hlcyB3aXRoIHRoZSBiZWhhdmlvciB5b3UgcHJvcG9zZWQuIFRvIHRlc3QgaXQsDQo+PiBJIGFy
dGlmaWNpYWxseSBzZXQgcmVmY291bnQgdG8gMiBhbmQgaW5kZWVkIFBIWVNERVZPUF9tYW5hZ2Vf
cGNpX3JlbW92ZQ0KPj4gcmV0dXJuZWQgLUVCVVNZLCB3aGljaCBwcm9wYWdhdGVkIHRvIHRoZSBs
aW51eCBkcml2ZXIuIFByb2JsZW0gaXMgdGhhdA0KPj4gTGludXggZHJpdmVyIGNhbid0IGRvIGFu
eXRoaW5nIHdpdGggdGhpcy4gSXQganVzdCBkaXNwbGF5ZWQgYW4gZXJyb3INCj4+IG1lc3NhZ2Ug
YW5kIHJlbW92ZWQgZGV2aWNlIGFueXdheXMuIFRoaXMgaXMgYmVjYXVzZSBMaW51eCBzZW5kcw0K
Pj4gUEhZU0RFVk9QX21hbmFnZV9wY2lfcmVtb3ZlIGluIGRldmljZV9yZW1vdmUoKSBjYWxsIHBh
dGggYW5kIHRoZXJlIGlzIG5vDQo+PiB3YXkgdG8gcHJldmVudCB0aGUgZGV2aWNlIHJlbW92YWwu
IFNvLCBhZG1pbiBpcyBub3QgY2FwYWJsZSB0byB0cnkgdGhpcw0KPj4gYWdhaW4uDQo+DQo+IFNv
IG1heWJlIExpbnV4J2VzIGlzc3Vpbmcgb2YgdGhlIGNhbGwgbmVlZHMgbW92aW5nIGVsc2V3aGVy
ZT8gT3Igd2UgbmVlZA0KPiBhIG5ldyBzdWItb3AsIHN1Y2ggdGhhdCBQSFlTREVWT1BfbWFuYWdl
X3BjaV9yZW1vdmUgY2FuIHJlbWFpbiBwdXJlbHkgYQ0KPiBsYXN0LW1vbWVudCBub3RpZmljYXRp
b24/DQoNCkZyb20gTGludXggcG9pbnQgb2YgdmlldywgaXQgYWxyZWFkeSBjbGVhbmVkIHVwIGFs
bCB0aGUgZGV2aWNlIHJlc291cmNlcw0KYW5kIGl0IGlzIHJlYWR5IHRvIGhvdC11bnBsdWcgdGhl
IGRldmljZS4gWGVuIFBDSSBkcml2ZXIgaW4gTGludXgganVzdA0KZ2V0cyBhIG5vdGlmaWNhdGlv
biB0aGF0IGRldmljZSBpcyBiZWluZyByZW1vdmVkLg0KDQpCVFcsIHhlbl9wY2liYWNrIChBS0Eg
cGNpX3N0dWIpIGRyaXZlciBpbiBMaW51eCB0cmFja3MgdGhhdCBkZXZpY2UgaXMNCmFzc2lnbmVk
IHRvIGFub3RoZXIgZG9tYWluLCBidXQgYWxsIGl0IGNhbiBkbyBpcyB0byBsb3VkbHkgY29tcGxh
aW4gaW4NCmtlcm5lbCBsb2cgaWYgZGV2aWNlIGlzIGJlaW5nIHJlbW92ZWQgd2l0aG91dCBiZWlu
ZyBkZWFzc2lnbmVkIGZyb20NCmFub3RoZXIgZG9tYWluLg0KDQo+DQo+PiBBcyBJIHdvcmthcm91
bmQsIEkgY2FuIGNyZWF0ZSBoeXBlcmNhbGwgY29udGludWF0aW9uIGluIGNhc2UgaWYNCj4+IHBj
aV9yZW1vdmVfZGV2aWNlKCkgcmV0dXJucyAtRUJVU1kuIFdoYXQgaXMgeW91ciBvcGluaW9uPw0K
Pg0KPiBIb3cgd291bGQgdGhhdCBoZWxwPyBZb3UnZCB0aGVuIHNwaW4gcGVyaGFwcyBmb3IgaG91
cnMgb3IgZGF5cyAuLi4NCg0KQXJlIHlvdSBpbXBseWluZyB0aGUgY2FzZSB3aGVuIHdlIGluY3Jl
YXNlIHJlZmNvdW50ZXIgd2hlbiB3ZSBhc3NpZ24gYQ0KUENJIGRldmljZSB0byBhIGRvbWFpbj8g
SW4gdGhpcyBjYXNlIHllcywgaXQgaXMgcXVpdGUgcG9zc2libGUgdGhhdCB3ZQ0Kd2lsbCBzcGlu
IHRoZXJlIGZvciBhbnkgYXJiaXRyYXJ5IGFtb3VudCBvZiB0aW1lLi4uDQoNCi0tIA0KV0JSLCBW
b2xvZHlteXI=

