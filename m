Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B806BA108
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509830.786394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhJ-0001SA-BE; Tue, 14 Mar 2023 20:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509830.786394; Tue, 14 Mar 2023 20:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhJ-0001PM-8P; Tue, 14 Mar 2023 20:56:41 +0000
Received: by outflank-mailman (input) for mailman id 509830;
 Tue, 14 Mar 2023 20:56:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhH-0001PG-JM
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:56:39 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b562f4ea-c2aa-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 21:56:37 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDn017378; Tue, 14 Mar 2023 20:56:34 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:34 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:31 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:31 +0000
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
X-Inumbo-ID: b562f4ea-c2aa-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IUk7j6c2OI3hgPhgnXSR0ytuaFnhExLrKuxPX0pyr6GLtxm//1XFkITbunUKMrghmNd/x0sMYMwg5vG/U2Ab5uV1KepFA9syX4KXNPHN6XOidsVDtoJlPUESNEIn2c7e60AIRlFuqwoXil59+xXotWKjiHfAi/ZS9P9pPZvgSqUe13Nv97Tnj0LkCIXVORB/7M1ab+psB0rvr3tzd3eP+ZT8kPLzh4NGcqzRBXnpkL5ucewt7eCbIqJKeGdfkm5I8X7FsAzWu4bZQiWp53c2KpoEm5e2rwGLGETI4gAyjzVK41ierqWIHvHAjPuwiXIRmN/ibtcjtDkDz43NsFOnHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qbz49nUoSSct90DRuc5faIaPrcHn0RvfZzcOrFLGObg=;
 b=CO6abEhEfnvaEBoIH2hOrG9qsGF/TW+utOQvrpg4iBaeVRVFPvtBW/s2OX9J9EBdmeNEgWj8NC2EChtJPomFW8BSEoyT9egN5L/Ia7TtdCh6oUKlA2+l9qtRrwaaHRnEjquti8UJ7vkXVuq4uKq7/iL7vWqfbnrmdwVC0B+JGePbo1pICp/zTkOK83hHNJCDxbqITbwhYqfI29sxMKHcT1dRnvS11+ywK9hwQ+Ce4+eL+bTlaak0UBNyPF8ly1xpulEol4CYGVNeHVyW8TBAEMc8o/UmJHUqyKr3cbkrq4zef/G5FEp0yLM+ZNaUYeqEvbPLOtoq3BdtePri7rb8xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qbz49nUoSSct90DRuc5faIaPrcHn0RvfZzcOrFLGObg=;
 b=HOz9K0KP5kKC+l5/OL8LaS6lvVvP1CQ8eYfbCNvwB3xkTZPzS/k4DEAPhppjrYdO8SNGhpOVBfPKTux44kcYtdr29KPN/NPDXyGth00WM5XUT/avZE2kvOSlRbfkgIeccgsl39nG4qe+P8U/T1MRUItMt2PQFSiIyYZeamWGXW+3D480x98CjNLyYo6UINmu2JHr8fS3e0A7WAbUJTFBARF0a5abOW9Jgw2iS3rgi2K5kAGyV4PtAlc2YChy+4sA5TaYUTD35tofL+GfDIBHuGSLJnpWApWMYtb1CN6Wq5CEiCtLvlJjB3Ob1EdQhA1hCEhgL65G5MRopFBNJfiT7Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v3 4/6] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v3 4/6] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHZVrdz9O2stZ5aY0OrZqeMa7i3ng==
Date: Tue, 14 Mar 2023 20:56:30 +0000
Message-ID: <20230314205612.3703668-5-volodymyr_babchuk@epam.com>
References: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: c2c75151-9880-435d-73ee-08db24ce96c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 wa4gmeoamBJ7kZQJtyqzNdldYAYGXkuFnGB0JtMBdWWknGT18z9mZxt/TvA/wCc4+pOtaRExJnIkofE/uYoo+12Lp2R9nYGV0ZEVIYsLFCCVI7b15GpjOpExw1BX11sJSEatn2SudglpRb39ZOteCkhu2VCidDaMI/Yz/a9/FicfCOZP6WY5KiF4gBf3+chtS4gIuBjx8Fd8d0IgP/mVX0XVCOYuw9UbR76YCvz6I5eBPAL57zpUduQbNDg3CCvTIsGHRKK2UUYlRSa9WqMj15kB9VXJ3C1uzQjo/gMkRnq5CyAanMmRO8+CfTkcI3DwcyOpfgv57JIiWQOzgTRo7FzzJndd2JJM5okxrn0tA3ECsmo2XKAGYphhTvoO907IAkv9BUvqfanlC3Zuc2q/eukHhDbUDXgCgKcBNtjm7aeCf5udh/qkmcQsb1ZlM9r1rez9j0XxrxW+pgyeRUsrzR33Yh2wPQX0LAdOwwnFVaMCMURJerVOuMea71OFTnkqvChCduh5eFtZbOPmNEyeoN043fRW8glKQ+SFGnBv0mVw8YB69v9CkEBe5C/cyWizTL4KJNe1nOsQFBvDGTd5gsFjuhtbBKcPDWlj46ARbgaYZyWIBeoh3JlnZZN/cNqhv7qkev8HNvr8LHzgTqhL7p896G8alPlEG7car4eaHDFWnkQ9OcCnzAFv38tZzLQYmWy8Xlki51DpN7Ch8atzMQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NFREeDlZUGpOTEZMcEVCWjFTNG90cStSZ25ERFVtY2RyV2xZZktDQ2U3VUtr?=
 =?utf-8?B?WmxwY3pzZjBRVkJ0bXVRb0dIOHEwZFFSQm5aTGVKMWhxTEtWYzM2cHpRVjRQ?=
 =?utf-8?B?MlRUWjhkZE5QNXpCeTdsVGNZVFpzSmFIcmZrRzNXd092TjdPY0lEY25jUlow?=
 =?utf-8?B?NklxSXpGOWY4SmdaQzBoOHZaT1NyRm42Z0YrZDdZWFFDdVFzUzJiTy9sZVdE?=
 =?utf-8?B?Nm9UUjB2VzRISWRvTXRnWGJLSmh5UG1sakJDTGgwaE56WHUrUnFVaUR6K29i?=
 =?utf-8?B?QTVSc0Q0YTlsU1ZvYU9XdHk5WHB6ZEU3U0xmcTVmZUpqS1pyUEY4ckprU2Rx?=
 =?utf-8?B?VDY4TkZDNFR3OUV0QVVuU3lkdzRUOW0wdFVZUkxEd3VVUGNvZi91TnVTeURL?=
 =?utf-8?B?UFNQdlpmRkNGQm1YZEpqMzd1NDV0ZTFQUFozcTBTd3pzT21OSGRsYjhOU0JI?=
 =?utf-8?B?bVBNVzJGUnlPVHM1eGtBcFdXSXhoTEhzdUg1ZWlNaW5xMjlNcTJjM2RwTlF4?=
 =?utf-8?B?U3lLOUp2U1hDRHVwb3JIZGhxVGxXWDRXSmFMTW5hWVVGUVQ0RFdMQnF0N2Vm?=
 =?utf-8?B?clg1bUJQbDk2c3pDdGxpdHBvYW0vRUNUR0ZjSmkrZ3MxdmxGVWRIdmZpYTQv?=
 =?utf-8?B?NVBqU2lmQ0RrRlkvMy9wWW9USTc3ZFA4OHl4c2hFdHhLYy9sZms3NFpsQXRq?=
 =?utf-8?B?VCtTS05WZUF3VGlUb29VRzR0S0tQMkFkbEdVM25JMXd2Umw2WVAxS0VmaTRy?=
 =?utf-8?B?K2RsVEUvMVBLMmNkbExmeEk3b0Y0d1lhVFhpb29SS0cvWnRVZXBhY2x2UzNy?=
 =?utf-8?B?NU1aVGZQMHFNeVBKRmVnZjE5R3BFOXpZZ0RjT2V2M2hvNTBaTThub0VKRmts?=
 =?utf-8?B?dG15MW9SYnZWY1VueFVkNGF5ek82UTg3L2grRHYzQWl1bThacVpsN281eXN3?=
 =?utf-8?B?K3hYem40RlpNNmpkZmUzQW14MHNiMXN4ck95TWJXdm8vSlVyRlBlNlBkQlE2?=
 =?utf-8?B?b0o5UFVGRTJLVktWNTZLc2tuYUhLbkU1S05iZVhFV3YrcVRZeTZmc0JqSWV0?=
 =?utf-8?B?NGllT2J0by94STkwTlFIN3NEdkpWaWpSL0Z1cWo5c1VDK0VzZERER1NDQ2hi?=
 =?utf-8?B?dWExZzNoVUFlZms0ekdVYWpydnlEQmsxSWgwb0NEYUptc25sNnIvTTh5Ymc0?=
 =?utf-8?B?dHhiTkR6VDB4OVhrSHRzaHM2TnNlMisvZHFjaWpUcXpIYUdPdmYwSTkxVFEw?=
 =?utf-8?B?Y2l1T3pmTlZ0VnliZjhjYkpCdzJ0WDh0a2xETUxuQmNRN21EVDFkNUhqN2cx?=
 =?utf-8?B?S1ErVWl0QXZLMkQvSU9SQVBLeHFBNGhzQWtmRU1CNGRldGw1UUhCd3ROSmFK?=
 =?utf-8?B?Q1VpL1EwUlNZKzRsaElpdjFOZXFJU2JLVXNwd21ZSm9BNml1QUM5UUFrQ2p0?=
 =?utf-8?B?d2E2dmQzdk5HOTJjUGhwbjVZbENNM0grYm5kWFliTFhFMzVnejRNQ2VyRnp5?=
 =?utf-8?B?OFU5ZzdhSXR0U0V5dS9wa245NlpKN2Q5d3NiUU1tS0hOcnZVWFpWVGhkRVJH?=
 =?utf-8?B?dzZVYkRjTXh0dEFaUStyUUNtc0hrOTExUStRRmNvOTZ4dlhRR2tPVzNDNWdk?=
 =?utf-8?B?RmZ2cDFWbmE5SWtNQS9QL1dFYnNMN1ZIYTczVytkc3NIUTNQQUVxT0Y2NHQw?=
 =?utf-8?B?TGMwc1dLZGd3YVFwdmhpNzZzdHEyUVlzMWNMUWpDVW5KazAzU0YxdjJpR0dj?=
 =?utf-8?B?UDZNWXk0TUhqVDVRN013TXYrclk3bGhkVURrNklEdStaekJtQ1BjbkN1Mmxp?=
 =?utf-8?B?elNvTGhZa2tvVHNybXBuRFAxZUZnY1VIcU9VMldsbVFwVWdyYzhyR0tIekc0?=
 =?utf-8?B?dGtLMlprbjVpTDk2OU5hbmh1aksrL1cwVWhBd0xLYVF5ZkRYUG5Hc01VOWRp?=
 =?utf-8?B?YzZBZzY5SUErRWJwc3YwaENnckJUWmw1K24yOVVaNEI2Q1QzWVJEOXZZQ1Ra?=
 =?utf-8?B?b2N3ZCtyS0szQWhFdDlYVS9pbUo0TmZuempTaVJ4UUlWSXQ2R29HZFlTdjZW?=
 =?utf-8?B?QUZPbTNpT1Q5ZHYzVnNzSnRtblROb1pqc0oySmdFTmlreWt4YjVmNUJWZGp5?=
 =?utf-8?B?MEFKWkRiN3Q1L3NlU094SXZ1ZzFicnV3ZjhLNzdXK0hjeTQ2N0UvR2tPUzN4?=
 =?utf-8?B?dXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BDB06F930CDAEB4184CA8B83A06F40E4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c75151-9880-435d-73ee-08db24ce96c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:30.3233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BeVFOYNB++6ARqohR3O3rI9+aHy3QY0383f08DWTZgGCjG/QVv6mxEPV67ddYkN8Vnh+V67cigIFXCWt/61SbwN4ww8Na+sxMJbL4TgSNHo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: Aw_rLXq1YvBHF0Xoz0t-oX8wAnBrjMxz
X-Proofpoint-GUID: Aw_rLXq1YvBHF0Xoz0t-oX8wAnBrjMxz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

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
LS0NCg0KdjM6DQogLSBObyBjaGFuZ2VzDQoNCk9sZGVyIGNvbW1lbnRzIGZyb20gYW5vdGhlciBz
ZXJpZXM6DQoNClNpbmNlIHY2Og0KLSBkbyBub3QgdXNlIGlzX2h3ZG9tIHBhcmFtZXRlciBmb3Ig
dnBjaV97cmVhZHx3cml0ZX1faHcgYW5kIHVzZQ0KICBjdXJyZW50LT5kb21haW4gaW50ZXJuYWxs
eQ0KLSB1cGRhdGUgY29tbWl0IG1lc3NhZ2UNCk5ldyBpbiB2Ng0KTW92ZWQgaW50byBhbm90aGVy
IHNlcmllcw0KLS0tDQogeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCAxMiArKysrKysrKysrLS0N
CiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlm
ZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNp
LmMNCmluZGV4IDUyMzJmOTYwNWIuLjE5OWZmNTU2NzIgMTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVy
cy92cGNpL3ZwY2kuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCkBAIC0yMjAsNiAr
MjIwLDEwIEBAIHN0YXRpYyB1aW50MzJfdCB2cGNpX3JlYWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1
bnNpZ25lZCBpbnQgcmVnLA0KIHsNCiAgICAgdWludDMyX3QgZGF0YTsNCiANCisgICAgLyogR3Vl
c3QgZG9tYWlucyBhcmUgbm90IGFsbG93ZWQgdG8gcmVhZCByZWFsIGhhcmR3YXJlLiAqLw0KKyAg
ICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmVudC0+ZG9tYWluKSApDQorICAgICAgICBy
ZXR1cm4gfih1aW50MzJfdCkwOw0KKw0KICAgICBzd2l0Y2ggKCBzaXplICkNCiAgICAgew0KICAg
ICBjYXNlIDQ6DQpAQCAtMjYwLDkgKzI2NCwxMyBAQCBzdGF0aWMgdWludDMyX3QgdnBjaV9yZWFk
X2h3KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCiAgICAgcmV0dXJuIGRhdGE7
DQogfQ0KIA0KLXN0YXRpYyB2b2lkIHZwY2lfd3JpdGVfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNp
Z25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwNCi0gICAgICAgICAgICAgICAgICAgICAg
ICAgIHVpbnQzMl90IGRhdGEpDQorc3RhdGljIHZvaWQgdnBjaV93cml0ZV9odyhwY2lfc2JkZl90
IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQorICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNp
Z25lZCBpbnQgc2l6ZSwgdWludDMyX3QgZGF0YSkNCiB7DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMg
YXJlIG5vdCBhbGxvd2VkIHRvIHdyaXRlIHJlYWwgaGFyZHdhcmUuICovDQorICAgIGlmICggIWlz
X2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4pICkNCisgICAgICAgIHJldHVybjsNCisN
CiAgICAgc3dpdGNoICggc2l6ZSApDQogICAgIHsNCiAgICAgY2FzZSA0Og0KLS0gDQoyLjM5LjIN
Cg==

