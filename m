Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DA34A6FB7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:15:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264064.457035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDbL-0007UX-Qc; Wed, 02 Feb 2022 11:15:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264064.457035; Wed, 02 Feb 2022 11:15:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDbL-0007Rk-MD; Wed, 02 Feb 2022 11:15:03 +0000
Received: by outflank-mailman (input) for mailman id 264064;
 Wed, 02 Feb 2022 11:15:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFDbK-0007QY-Gw
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:15:02 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c1a8253-8419-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 12:15:00 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212AnEBj013947;
 Wed, 2 Feb 2022 11:14:52 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2059.outbound.protection.outlook.com [104.47.4.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyrhh83g1-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 11:14:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB3673.eurprd03.prod.outlook.com (2603:10a6:5:b::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4951.12; Wed, 2 Feb 2022 11:14:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:14:48 +0000
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
X-Inumbo-ID: 5c1a8253-8419-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9W5v1E+WAI8irt+PjgMfm/34LHtU5r6Ep9o8cltoU3owXJkN3kQ7z9HPC7IjZeCBMQ6NabI07/e4lw1BP0hbi7R19Kan9Wx1FKeT47LPa6fZZnsdjcPOOLKNpFGx7+FrZNGgIyyzub/PtSZhigZeNKzm0BSQQQimgJQOPuMOwcSmg+3x7EGY7rpZi721X3Yc4Y8/yNSR/PKsfEnMJ1mgTwq71jFOxcWVOpoK+ISoPNv2cL2VSo/aavhU11D79rWVpm9eqJ/34rKCZZPIW2V5DwA1pzlEzpLdSSnO4hRhNGEQp4kYSqaIa1SiS/H/FXy/29/17w+4PVr7QcvRsmJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEb8Jtri2uE9kdSPgc2OGHiXKPtMXiLg165QYU4HIso=;
 b=SadoGRSlwbQi7vLxhggwidV8scd+7tFFbF7S7fbHpp7U1P5D95ddCdnCkvVXbsnJ6+hMbSj0RtTxqx/x+/CI1qSNfverU2PDgR3J4wAh85APD5h7weAlCCb0uy+STEa6+PeXX9fM179Rn/FMhKSHWJZB9wSEV+vF8fqiZiANKwT7BzK4C2YAvGrv0NNHIICKPhLfPQnzh9TULnkGoLnuOq1z4/mgk05sEAglA9Y9vNKxXRBUvIXmdQ+JIPSYbXXa2gOu/N+JWvcNKKNhz610gWDqR4+7GDFHxnd0vGbUHVkyMP3Qf5AwCs89CRJaUpbYTmY/kP9f5jNL6F47FEIKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEb8Jtri2uE9kdSPgc2OGHiXKPtMXiLg165QYU4HIso=;
 b=JJ8AF3oVOJ5GYtNdT3C5pO04qvyxgR0dgnJEx4vpjY4VuIIIZGwH01BB1Tbq6Q1O4uM7+VVbCM/2pA8Jl6sw0MU/0/Xtf8Kh8SLVd6FceOKCUkcNI+9LfbocyG5WDhMPMr9GZUt3Kc6BVkDlU2aaQEfGyw9HUHcAcDWnoo2MZ1CzENuMAnqpnpit+Ld3I69U4nOwGdJleywneqDIoemtxc0uj7S4vhGA9DNT4hkp4YBwYUMAy1qfhw39cJa3wJGgvsRY3j0y0bpVeVwVoFzqYhZ7eB4Pp1BGTvE948tW9gwB4UU+imlbxLEqXwXJeigZR+jJbnLsztv6QnbshmiAdw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Index: 
 AQHX4ewInH3i1A85zUqSOqe7J03BoaxhCwuAgB9Nb4CAABckAIAADZOAgAACmgCAAAe7AIAAAM6A
Date: Wed, 2 Feb 2022 11:14:48 +0000
Message-ID: <66fc1da2-a4f5-8648-c5dc-beee5e7951c6@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
 <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
 <2282e7c5-ba1b-e2a2-af4a-84a894211870@epam.com>
 <YfpeT+VMWiklDWGf@Air-de-Roger>
 <7d4c128d-f6f0-8dca-8ab4-6138ed6cd61d@epam.com>
 <0161ac2f-e0f2-378a-4931-98e554bd9353@suse.com>
In-Reply-To: <0161ac2f-e0f2-378a-4931-98e554bd9353@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 921fccf2-10c5-4e24-3852-08d9e63d398d
x-ms-traffictypediagnostic: DB7PR03MB3673:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB3673F33633F5E84923D77912E7279@DB7PR03MB3673.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 lRssHSsPhSNn9Pe8VuDGZadvGztVb/j7TzhJM9ZqXiXGqIte7spVo1FqzzKegg7OuXawB6hG0ttYtinNqRuYF30j7LTkAzEWtAerbPq3YdNuLyETgKFXotbQdo7heho8vjv+q+aDre2AZCPhWjKsGMiRUSU0Aiw7GQ5JlUDjXPVhit8lmzr6NgjeVs2fzCmsbm7u3XQ8XLzYaOjuLiongdYuTco/3zY98fFZpdfL3A3+erFSg1qVCsRlEo22yS370XYKdva3m6OeRtpF4Eazj6inbG4WyFhKOj5XYFtB4QPOZNdgjFbRfl2uhsB4ZFv4Dg/gI/ntxIPXK3Ibrjv8qt6ltVZwgAHozTQU+z/dm1uyb2shx1W7butQ734iwLMwagit5bxHxndtIC7R8DQs+h6aKidrruCc7Kv5vxkF9idvJEUFJ3akIWYmSZif123Qt8+n5xXP0wxYAdvHXXm9gYYScpARBXiTdC/KwcZG/yRgPwCRZ+GkSCp+jLHGqfPYLuc+oDf61JvDX0w8vygjNCECwDPpGJF1Y6utDpfZsyWwZk5rtRNmyO/cPJ7eFzbnjQGpIzQffbkAgI4HbJxaTdluRHvvbfXMGzCFRUMbpBTJXLb2uO0a3gMAwBAr9FHnQVY0XWC9ABA4oX0AIKMXo0SyrqeTZwzGmTMS9LD0wi9hrMFpkBsQ+ExHYWscD55X60g72+9KdRBZOiMu6advzia9BqYewJrH1Pk+60F0YZslOJ0TVW8EWndM7FaQCjVO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(107886003)(31686004)(83380400001)(26005)(6506007)(6512007)(186003)(36756003)(71200400001)(53546011)(38070700005)(2616005)(31696002)(8936002)(316002)(4326008)(2906002)(66556008)(64756008)(91956017)(66446008)(66476007)(76116006)(66946007)(6486002)(86362001)(4744005)(7416002)(38100700002)(54906003)(508600001)(5660300002)(8676002)(6916009)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Tjd0NjVjblFjSi8xby94bGMwOTltMWwwNnBWWGNjc0JrSkQwd0tWeWMrLzV3?=
 =?utf-8?B?RC9yY2ZXZTRjcFkvWDBnbGpKT2xBZzdBTVI0WmllNTBwMldXMjFxWWRoUVhV?=
 =?utf-8?B?cm1FSmdtVVZTWnhEdHhoRk9TaHgxWWNSdSttbDNDRXJ3Y0NQNzVUQTRwWEFo?=
 =?utf-8?B?RmZFanYwa3FDZVZ4bTUwU2hySE5WYlExQmdTN3NCc01LNEZ3WFU4SXZ0S2hp?=
 =?utf-8?B?ZVVSVVpNQnl2WmN3M1ZrZ3RURWtuQWxKOVJYeUp4SVhSZWRabjVYeU5HYVRC?=
 =?utf-8?B?aXJhWGVKRjd4U3VhVHVXYWFUMDU5M25uN2V6RE1BYXl3QVVYUFZKdENvSFFQ?=
 =?utf-8?B?ckhzTDBKbFJ6c2FCMHg2L2tZRTVORzBDY3N6MGZIQmdwQ0t6alYzWkh2K0Z5?=
 =?utf-8?B?Q1A2Vlp2K0tiaFJtVjVXaEI3MkRNWExjK2M3R083a0JUVXNPak9VdmtCQmNh?=
 =?utf-8?B?OEIwS3pXMmoweDdnS0ZEMzRTU1NRbmZiN2xlRk1UOGFHaktZa3RJMWJ0bWxy?=
 =?utf-8?B?eVJQZ3BvdHBWZ3MxNEhiaTBuSmpCM1RhWWYyWkJTdElIOXdSOVRFbUwwd2pC?=
 =?utf-8?B?R1BRKytMdi9CWE1tTGpIcHRsQ1dNREdwOWRIN29CNkYwd3FRVll5a2FaVEx1?=
 =?utf-8?B?dkpCMy91UGx5V1VsQkJ3Ykt1dGhQaEdOSTNFT0lKVVpseTk0Z2lyVDlndkg3?=
 =?utf-8?B?Z0orYlJCTjhFemlhUkFhY285UGw5bnVZQVFsVmdzWDVNenJPdHUvVDRtY2FQ?=
 =?utf-8?B?ZnpvS1ZkaUJNRWFRTTFpbUl5dUhLeXZoejUxdGlTRlJmRzVUNnFLeDNWeGJi?=
 =?utf-8?B?dEZRM2RKeFVnWEh2dzlrYkJvaGNUdm4rdTlLZ1h3RWNqanVhNGlaaGIybnY2?=
 =?utf-8?B?ZVhFd2JHcUpiVmZDaDFYa3UvSnFnYU5CMnoxK0V2aWd0bzd1Skg5N0MvV1ps?=
 =?utf-8?B?TVBCM2hDTG13ajdYNFNqTDBMVk0zcHdkdG9HZFY2cDRDM0U4ZnArb0RlcVVO?=
 =?utf-8?B?ZkZ1TWpESUp0a3VvdWFJR3pGNTllN2k1d092N0J1R0xsYUVpVGpLMEpjR0p4?=
 =?utf-8?B?R29UZmpkZWVVbFNySStTQWNYYmVoMXR0RitTQWJ6WFpSTXJWdmQ0REpoaXhu?=
 =?utf-8?B?RjdLL1RkdlloeW1rYW10dzAyd25LeVdieUxiNVBNTEh6NW8xdmZtamZiYzFG?=
 =?utf-8?B?dnFlM20rcmVsWS9RdlB6eXRYSFkvOFE5S292ZUhuRHNSSHREWnUvZGlNNTg1?=
 =?utf-8?B?dW5vYWFSenU3a1VNRzJ1SmQyT2hmK0NnSS9CQzZjU2RTdXNEcytHNjJPNmlm?=
 =?utf-8?B?U0crZHBrRkhVT2lZUVVneENVZXc4MllaMGxBZ0dDVVc0WjVHeVlxMjllL0Ey?=
 =?utf-8?B?OFV6OWRCS3B1dXN1NzZRSktBeWVjaHV0TG8yODBocDJ6WVV2R1RiYS9vWktt?=
 =?utf-8?B?cHkwdkVTMkJVbExjaDZROG02UlhEbGp3MkNqcmk2citxN2Vhb2hVOHRFWGNG?=
 =?utf-8?B?ZWhqeDZzVWR0RGFOVnJBOEN4OGIrRGxpbHB5U3Rxa0Y1cmE3dEszL0xEajE4?=
 =?utf-8?B?MEVoK1B3U0VRODk0Vlh6R0hGRy95bVU1V0JQYXhaWmswTDRiWUVkbnZvTXBy?=
 =?utf-8?B?UU55YmxQdW5XQzduL0lYMCtzL0lwODFtTWl4TVVtQURkOHdYZE5kSEdCQnBT?=
 =?utf-8?B?VC9Fbjg5S3Y5ejJ5c1B3OHl1d0pUUTFLZi9ZalQ3ckp4TS9mUk1jTitnSWEv?=
 =?utf-8?B?clhPdkdDQ3BqVGtIS1Z2akVpMWZxTXl2Q3VCVDREUDhmYWpyV1plWmxxVmJ2?=
 =?utf-8?B?a3B6T0V2NG5uZ1V4NU1kT2VqbmphQ2VBbDRxbFNhMitTK2NQbEoxSWZkSjMr?=
 =?utf-8?B?SEZ5dndFR0txRkRzY28yQStiVktEMEFodDJ5NUFES2pOcEIvL1ZJNzhTZklO?=
 =?utf-8?B?RkIrSVJ2YVlvUHFXOWp0ai80azJYSzhPdHdEUVNyb0p2bTFJTHNUZmFISUJy?=
 =?utf-8?B?RkthM2RkMjVtNEl0K0oyMTN3djFueENyYy92MTdCMnBsem5EN21JaXptOFh3?=
 =?utf-8?B?ckZMRzZDR3RpejdwN1lIRnFvRktmbGlMM2RKbGlZRFpiTDdFRVhtZVJpVkw2?=
 =?utf-8?B?MHJtM3hEcFEzeHhyMmJ0M2pyOC9OM1J2ekEySXJnajhMVFdqaDVJb3dhd1ky?=
 =?utf-8?B?VEt0dnVkVW5Yd1dLdzVnbXJtS2lhWnhEQ1B5d3Q0dmF5TzRmTm54NzFHd1pF?=
 =?utf-8?B?RUpuaTZRODlQckhxdzA2MUxtM1N6ZU5oMlZxZXhvZmNYRktGeFlQWFh5SEF3?=
 =?utf-8?B?a1I2MDNBZk9OTlRrQ1BaRitKUlU4SkI1Q2w5RFMyeURBeElRSUUrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1DB68AC701DF2D409E1F7A46AD7940E7@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921fccf2-10c5-4e24-3852-08d9e63d398d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 11:14:48.2117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pYufOJ73UQDVxW0N8C0AlbDQE+TGpKeRigH1NH/B/3qmGZUEiJj29wgw6PrDkIYkkhuL/3/LNYlLeT2rjnMt0C/1yMob/L4CfvnZf8aakv7CHdMSQYu+8xRPKTo4zffT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3673
X-Proofpoint-GUID: 8gWGFjKLTkwGD0Z0WMPF9dB9STaABY-Z
X-Proofpoint-ORIG-GUID: 8gWGFjKLTkwGD0Z0WMPF9dB9STaABY-Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_05,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=831 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020060

DQoNCk9uIDAyLjAyLjIyIDEzOjExLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxMTo0NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBBZ2FpbiwgSU1PLCBh
ZGRpbmcgc3VjaCBhIGJpZyBwaWVjZSBvZiBERUJVRyBjb2RlIGluc3RlYWQgb2YNCj4+IHByaW50
aW5nIGEgc2luZ2xlIERFQlVHIG1lc3NhZ2UgY291bGQgYmUgYSBiaXQgZXhwYW5zaXZlLg0KPj4g
SSBzdGlsbCBoZWFyIHlvdXIgY29uY2VybnMgb24gKndoZW4qIGl0IGlzIHByaW50ZWQsIGJ1dCBz
dGlsbCB0aGluayB3ZSBjYW4NCj4+IGFsbG93IHRoYXQuDQo+IFlvdSBkbyByZWFsaXplIHRob3Vn
aCB0aGF0IHRoZSBtZXJlIGFjdCBvZiBsb2dnaW5nIGEgbWVzc2FnZSBtYXkgY2F1c2UNCj4gdGhl
IG5lZWQgZm9yIHByZWVtcHRpb24sIGFuZCBoZW5jZSBsb2dnaW5nIG1lc3NhZ2VzIGluIHN1Y2gg
Y2FzZXMgaXMNCj4gZGV0cmltZW50YWwgdG8gZm9yd2FyZCBwcm9ncmVzcz8NClRoZW4gSSB3aWxs
IHByb2JhYmx5IHJlbW92ZSB0aGUgcHJpbnQgYXQgYWxsLiBJdCBpcyBlYXN5IHRvIGFkZCBpZiBu
ZWVkZWQNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

