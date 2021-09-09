Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9EA4052A5
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 14:49:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183216.331260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUH-0004F6-Kg; Thu, 09 Sep 2021 12:49:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183216.331260; Thu, 09 Sep 2021 12:49:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOJUH-0004Bl-HA; Thu, 09 Sep 2021 12:49:05 +0000
Received: by outflank-mailman (input) for mailman id 183216;
 Thu, 09 Sep 2021 12:49:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOJUG-0004Bd-Dq
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 12:49:04 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11701118-3fbd-49fc-a570-733283234214;
 Thu, 09 Sep 2021 12:49:03 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189COC8M023026; 
 Thu, 9 Sep 2021 12:49:00 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayj8a03aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 12:49:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4578.eurprd03.prod.outlook.com (2603:10a6:208:c9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 12:48:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 12:48:54 +0000
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
X-Inumbo-ID: 11701118-3fbd-49fc-a570-733283234214
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Na0VzoZVjnFr5MeRyQql0zRCU2hw8QFHru31P/px3fdmi3PtsSMvl2V84g7kW9Tocgf1mp44Tmj9ltvSgB2XOL4ulnUbmQlD1x/j4sIExbkLlZRddcUze2Yv69v0vnC65qFQNsWC3IjQoqqj932zDmnPJFrbC+JoP/enufJgkEWCVq5z7tyCkh4Hqsft7EzZNzKDaTFlEtvSFYZOEWAQiiAGblD76XaiZ8+8x3hgpjVgR4C8w2NydmhqOeWwXxsrWlyBTTgmN/LaQ2Svr4n5Q9C28Hh1Pnc+hwYeNIvfQ1jtmixYmn0trmJY8iZnb6LE26ljrEgzpNNDaUtivnh9uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qCCP9O1dEv5PRL6E4RaWiKkWBtZFrCqDDTbgKwZbKIA=;
 b=lA39Qy8uDQDkNa83SIp2E1RIC2TCebvbhA41FBpm2ttDk3hJkfMLgLGUDAfOp/7kzE3BbWlQ4HF0wN9pKUrvkyXWzoG1yFs9kumc4jBcRyNGHflYeye+ydz+AdA30V31HF9oYCL0THpejJvHiuTLYz3/FtDUUroharSCQZH4E052ljAMF1DZQ75sWiqwG7opF6syoKRe89D6qpssAOdf0gi+pXao+KKQV0GPX0mv1H3Iw7npK8upCB6aYDNYscUqShNnGEI4KA0dyivqPm1wn2bfd0PBUOuuxJWA2vG1r6aNZ8DSMmYvqs8GeAg6mUaKMTN7EO8QyYPJUx9hX0EUoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qCCP9O1dEv5PRL6E4RaWiKkWBtZFrCqDDTbgKwZbKIA=;
 b=1n1NLCAWJ8aqqDSUb1ICWblFsggkvg12T3F+iwfiHxqfRrOy2pgcBn7EX/qRY0vxNxZOMb8jKZsuZ4DgOzo0i31ldzUMN82EIA04cGdzeCEZ4iJ9oA41iZPM5cA/NCFQF2yvZFrKDAAlL1aV9lTqBxrOkRIG/O2YMDAUDlPU2ytMKVx1/8dIwMd1/5gbVFjGwtNl+ApC7ozw3B/cSjrNCc+/DMEDvBAxAUISq59O03asNbL9yDHkCn1fNpbYHI6D01tQxG+/guBOmnXSc546PCyRXGbUzsu1Gs0n8z6TnMA53iITqFGI1IdD+Jkk0qI+1vTSEtCwlhh8b3589rjPlg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: 
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuAgAAA+ICAAAH/AIAACKGAgAAo+QCAAAGkAIAADY6AgAABTQCAAACBAA==
Date: Thu, 9 Sep 2021 12:48:54 +0000
Message-ID: <562585c1-d812-7edc-30e5-0c750eb98f40@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
 <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
 <f4758911-0927-f31a-a617-9d8566edd2b1@suse.com>
 <6d8a4bae-cfed-07fb-d6e0-7587eb85069c@epam.com>
 <10bccd76-bbbb-1cb5-b9ad-4298014befd4@suse.com>
 <3ca10b3a-35c9-00b4-f736-293589d641d4@epam.com>
 <06560d04-6d71-bb94-20af-fc43cf686b0a@suse.com>
 <38669583-3e3a-36e2-8714-a4b6a4e10173@epam.com>
 <d2ebd8dc-0dc1-80dc-aa15-45a02b01004f@suse.com>
In-Reply-To: <d2ebd8dc-0dc1-80dc-aa15-45a02b01004f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6263a93d-cdba-4e3f-74be-08d973902ef3
x-ms-traffictypediagnostic: AM0PR03MB4578:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4578DE1423EF0683E023DA29E7D59@AM0PR03MB4578.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 TOni8ak3OTN+0D8NvIw9m9SUim13vNQgk2inySnNaQgxeLkhBx4UwwU3jsGBWPjZW+vesG7T8EEsKPWiyTu7inuiMoh8Ajdd4wc3CtAKEKChlD14K3GWl7WWIxghJJOz0aUDuPjw9VW94U5UK7r3ABGPKeivhgPe5IKgF+Dnv1blz4e6YF1kLCbk6rn7RQuxdG/vpvUJrFEr47V8j/c2WObWJjnxp8ZNLeirLZJQgS4gt4/IML7fpS1dWatqx6znicU9Qm4tt5sSDOz9iyMXXzej4FgjpH9601aj1N7Iv2m+IC8wW0xLEpYKas1MTbRFOlgrVb0SrZIiRn1suYnBFRlKeIINaJdopFfG3ukmWpDIV4ijeyEkybA1RoigTR5tLpQpcDTbDizNALcFeqlHM/jyiWQAE9plBRToPXYn7lyIxoG1knbZpRB5C8XuwEDGt4I/SiEEeCbqNr0EZVsrBTPb4Oq1ybwKcsp7mftxH/CnE9Z5BpxZSyfNs5Ao2GA4v+0FqtkvVeO7cK1j8NxP+M2iubd3jXfvQhP3bGSTL4vXqrFIJrZUCCguF/Ya5riDTQ6OtFvHtWLS3tcwvkgM989NKx5n0L+SDFLSajv3rHgjE0xjEpgrQIWVYlR4FbZP5m3NKYZVmBgeBblCkP7mtIr8/9PmmdpSgx9SLJmW4tIa6D8Dk4CQa/Mwq5aZyws4pUxi+UOeosjY5FoKfxGbPO4IxlaY1zZ0KCME/25ByYrBDY9uK7wzg4r+zjGGi32u
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(76116006)(6512007)(36756003)(86362001)(83380400001)(2906002)(38100700002)(122000001)(8936002)(71200400001)(316002)(110136005)(54906003)(2616005)(31696002)(31686004)(38070700005)(53546011)(4326008)(66946007)(66556008)(8676002)(6506007)(6486002)(508600001)(66446008)(64756008)(66476007)(5660300002)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?emhrUFVVUWt2VFQ3ZUNuV1Fmc3N4dlMrVTJSMW1KZ1BkWDhBQ0Rxb2dFTFlw?=
 =?utf-8?B?cWVDVmFWRHVPQVlnQ01WdVV3YU94QnBGN0dMQlJhYUtpUi93b01RUVN0NGFY?=
 =?utf-8?B?UzRORFd4RFRPNjJMV1FpNjM5SlgxSWkxemRnaS9aWG1CWlUrdFM4cFdpeTZa?=
 =?utf-8?B?NmZJN1kwK1NiMmJ0QW1VTWNNZWwwM2FuTThlb2VoODh1dkh4cEluamszRzkw?=
 =?utf-8?B?SXZEVG5IWFdPNU1RS1ovMUc0SFhzSVE1bndGMlFrckJ1Nk45ZTNaYmd1K2Fu?=
 =?utf-8?B?UXZmdmt6Ui9JY0pVSTlMd2dPRzc4SmtISUl1aVpKN2xJWjVMNENNTVl0cC80?=
 =?utf-8?B?M2d0VzFGNmxtWGlMYnFnd1pFc1RybWVDdk1WeUhDa0I1SjBJQ2k5ZVFRVmFQ?=
 =?utf-8?B?c3hydXVSeWpmcXNoYVFwc0U3clk2Rk5wVzZ3R1h5TEt1WXpsWjEvczNrVStv?=
 =?utf-8?B?N2VFMjN5bm0vdHpQK3J0ZFhDbnZvZVFGOHpqcVBoTVIvNzUyc2V0eHM0WG9Y?=
 =?utf-8?B?RmM1YkJWT2RjVS9mb0orSzZndWNKbnV3S0VXYjFmcmVhV3d4ajlyV3ZKcFZ2?=
 =?utf-8?B?andjeVJzSmdaR3Q0eGo1YzNWeXFvZzVYTjVsaUJ5QldKR2ljSVFWSVR0MnQ5?=
 =?utf-8?B?dzZGUHJzNDhTeld5ek9aYnBtd04rTE1ncGJzZFlhZ3BaQ2Y2bnpodVNEV0Q2?=
 =?utf-8?B?RS9XOURwTlRmbHhZVXpEVTN6Z1FHM08xMS9ZdkVoUGlQL1hsWmErZ2tZaUww?=
 =?utf-8?B?QTM5QVFFQXNhdU8zdks2c0RKb0Vmb1lQNU10K3NSNEY3NVMzUkJTTEJwZ25q?=
 =?utf-8?B?aUFEeitKMTBKR1VWMnRZNDFPYWxvbXZaYlBQYVAyZEJ3ZmZxYXJhV0V4OVBC?=
 =?utf-8?B?WWZ0UGF2Q3g2VnhnSDNIZEQ3N0NXR0hVOUtWT0xRTSswUTgrYmRxaEpxeHda?=
 =?utf-8?B?OUFFRWZoYWl4NkZoVTJ6bVBZUXVZWEY1eDhtZUxPeDdoQTBGYk81bU9Ma0VL?=
 =?utf-8?B?Uk5KUTZrVkIxck11eVVZV2krRXUxd0NGY2x2QlRONHpVVU11Skd0NUtEdFRa?=
 =?utf-8?B?TU50eXJvVmt0Z3ZkMUZaWkdPWWtlZ29oU1lqM2VRMVBqZmorK2RuVWNkQ1Zy?=
 =?utf-8?B?YkZMTGFiQkNHekU1SHhmY2g3bisyUlBEVC9mTDVRbjhZT0ZvcDc2V0pJWURS?=
 =?utf-8?B?TDNvR25ZY3BOT2p0YzJBcW10Y0hONThLNFpJeWw5TC95WlJ3dmVWTGdXcFBY?=
 =?utf-8?B?RHMxeFMyanRFZWVKdjhzWFJiazNGOGk4dDEveFRnalVGSzVIa2Z1MkdiSFk3?=
 =?utf-8?B?aFBTNllNaXNQQ3J1Ukt0MEwzQU0rdXNzRFE1UXg5YjhGemFvd2plc3NOeHNj?=
 =?utf-8?B?VXpNR2xYcE1qVlEyc0luNFVkQjNDWjBwWUI1NFVTdzR1ODBvNG14Z3BWTmVH?=
 =?utf-8?B?Vk5IVmd3TkJpLzhSbWlRbG9kY0tNUkJwNjBKUUZYdFNQblpkUU1RUU1zb2Yr?=
 =?utf-8?B?QXhIdzBCTjBPYTlJSVJJdThBaXF4SlhJQmR2UkJvTG5zMU0zc3czT1ZuS0s5?=
 =?utf-8?B?S1p3bEVWYmVpcXNzU1F4dFpyTStGR0szN3B0am1KalRpeUNYdkR5UkxybTNM?=
 =?utf-8?B?YmlyTXRqSUVrRWtla29QclNKY0NBbDdNcVl1Tng2RTFoQWFZYlNGdDF2cklO?=
 =?utf-8?B?TFlUYjNSWXRPTmk4NU5RcTQrWjZnb0dsWFhqcTdGN1JleTlyMW55aENKYmdJ?=
 =?utf-8?Q?kS3Pm2MSNW5I5v6617G3IFUbg5KSH7bbfaZAHsw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <78F7D9D31597144C88194DB554DA64E6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6263a93d-cdba-4e3f-74be-08d973902ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 12:48:54.8762
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qRssFzKtwImRJijVuP+Svo2VXKzUeCnmgQjLR5DuxJjBsLSSSbyngLOGNWeL9GuyaKo80GvdjGyuIz01Y8P/pvKoRKS7hmi2HahOe4THkzT9IMgnzSjUG7a9I3Pu9FWs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4578
X-Proofpoint-GUID: WWQJHBLZ3VSzD1fvVplRu94znC9myg-f
X-Proofpoint-ORIG-GUID: WWQJHBLZ3VSzD1fvVplRu94znC9myg-f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 impostorscore=0 bulkscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090078

DQpPbiAwOS4wOS4yMSAxNTo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA5LjA5LjIwMjEg
MTQ6NDIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDkuMDkuMjEgMTQ6
NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA5LjA5LjIwMjEgMTM6NDgsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwOS4wOS4yMSAxMjoyMSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBGb3IgdGhlIGJpdCBpbiBxdWVzdGlvbiwgd2hlcmUgdGhlIGdvYWwg
YXBwZWFycyB0byBiZSB0byBoYXZlIGhhcmR3YXJlDQo+Pj4+PiBob2xkIHRoZSBPUiBvZiBndWVz
dCBhbmQgaG9zdCB2YWx1ZXMsIGFuIGFwcHJvYWNoIHNpbWlsYXIgdG8gdGhhdCB1c2VkDQo+Pj4+
PiBmb3Igc29tZSBvZiB0aGUgTVNJIC8gTVNJLVggYml0cyBtaWdodCBiZSBjaG9zZW46IE1haW50
YWluIGd1ZXN0IGFuZA0KPj4+Pj4gaG9zdCBiaXRzIGluIHNvZnR3YXJlLCBhbmQgdXBkYXRlIGhh
cmR3YXJlIChhdCBsZWFzdCkgd2hlbiB0aGUNCj4+Pj4+IGVmZmVjdGl2ZSByZXN1bHRpbmcgdmFs
dWUgY2hhbmdlcy4gQSBjb21wbGljYXRpbmcgZmFjdCBoZXJlIGlzLCB0aG91Z2gsDQo+Pj4+PiB0
aGF0IHVubGlrZSBmb3IgdGhlIE1TSSAvIE1TSS1YIGJpdHMgaGVyZSBEb20wIChwY2liYWNrIG9y
IGl0cyBQQ0kNCj4+Pj4+IHN1c2JzdGVtKSBtYXkgYWxzbyBoYXZlIGEgdmlldyBvbiB3aGF0IHRo
ZSBzZXR0aW5nIG91Z2h0IHRvIGJlLg0KPj4+PiBUaGUgYmlnZ2VyIHF1ZXN0aW9uIGhlcmUgaXMg
d2hhdCBjYW4gd2UgdGFrZSBhcyB0aGUgcmVmZXJlbmNlIGZvciBJTlR4DQo+Pj4+IGJpdCwgZS5n
LiBpZiBEb20wIGRpZG4ndCBlbmFibGUvY29uZmlndXJlZCB0aGUgZGV2aWNlIGJlaW5nIHBhc3Nl
ZCB0aHJvdWdoDQo+Pj4+IHRoYW4gaXRzIENPTU1BTkQgcmVnaXN0ZXIgbWF5IHN0aWxsIGJlIGlu
IGFmdGVyIHJlc2V0IHN0YXRlIGFuZCBJTU8gdGhlcmUgaXMNCj4+Pj4gbm8gZ3VhcmFudGVlIGl0
IGhhcyB0aGUgdmFsdWVzIHdlIGNhbiBzYXkgYXJlICJhcyBob3N0IHdhbnRzIHRoZW0iDQo+Pj4g
SW4gdGhlIGFic2VuY2Ugb2YgRG9tMCBjb250cm9sbGluZyB0aGUgZGV2aWNlLCBJIHRoaW5rIHdl
IG91Z2h0IHRvIHRha2UNCj4+PiBYZW4ncyB2aWV3IGFzIHRoZSAiaG9zdCIgb25lLg0KPj4gQWdy
ZWUNCj4+PiAgICBXaGljaCB3aWxsIHdhbnQgdGhlIGJpdCBzZXQgYXQgbGVhc3QgYXMNCj4+PiBs
b25nIGFzIGVpdGhlciBNU0kgb3IgTVNJLVggaXMgZW5hYmxlZCBmb3IgdGhlIGRldmljZS4NCj4+
IEJ1dCB3aGF0IGlzIHRoZSBJTlR4IHJlbGF0aW9uIHRvIE1TSS9NU0ktWCBoZXJlPw0KPiBEZXZp
Y2VzIGFyZSBub3Qgc3VwcG9zZWQgdG8gc2lnbmFsIGludGVycnVwdHMgdHdvIGRpZmZlcmVudCB3
YXlzIGF0IGENCj4gdGltZS4gVGhleSBtYXkgZW5hYmxlIG9ubHkgb25lIC0gcGluIGJhc2VkLCBN
U0ksIG9yIE1TSS1YLg0KDQpBaCwgdGhhdCBzaW1wbGUgOykgWWVzLCBvZiBjb3Vyc2UNCg0KPg0K
PiBKYW4NCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

