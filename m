Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EED8452F74
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 11:47:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226237.390883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmvyQ-00076e-6V; Tue, 16 Nov 2021 10:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226237.390883; Tue, 16 Nov 2021 10:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmvyQ-00073Y-3H; Tue, 16 Nov 2021 10:45:58 +0000
Received: by outflank-mailman (input) for mailman id 226237;
 Tue, 16 Nov 2021 10:45:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmvyN-00073C-UP
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 10:45:56 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e9b462d-46ca-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 11:45:53 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGAi1ZW003596;
 Tue, 16 Nov 2021 10:45:48 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ccb57r0ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 10:45:48 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5794.eurprd03.prod.outlook.com (2603:10a6:208:157::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 10:45:44 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 10:45:44 +0000
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
X-Inumbo-ID: 5e9b462d-46ca-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3/zrPwv6eA+fVnjpwOHXmQBd0aKFu4RvmwopKPXYQiZXbVk/HoTZP9tx6YlVp1Wi9VKsCDpfP+rrPs66jWDI8ggtnREb5M4k0DOA7eoz03y/s8Qgq4zps+gAT7dI6RqGARHv0dtgzWkjblDZeW11zFgvFL31RCVcLWzIIKlHrUL9HJ5BCzo4WzQ+gcbAgOCzqFb8yIyBWX+WJuheMyuLXTjvI7WGQD3jViOHtAmCpmM2ulweHhJ9Did2w4ka5atELXDt6162aH1nf9RIwm5PrDWR2bppr6aES5eFYLrcEdpjuKnnstPI0jauLiOatYer3zBKFa6sX2kPVUcUrVxqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xd9jVMIXqutzTSzByHQ4Gz4jQ298DCDpvO0GuYHH8Fk=;
 b=Jdf+QczamQsf6I6czfGvdhKxnC0jXtH1EX7wqjHkgyCLejz/cyOyRjNW/Qll0QlAGiclSb/5p5fsyW5Tad7H3VNfn4cBqsSjgHUan7LxqUW33nYHcU4ngKh76eIBFpfYWig07CUSm7tuv2BKA2quWskSatGmfdq8XM2eI+IXMP7JDE4LiCTywFpSdhV3gSzvVC5VXt0VUo6w423rOJ82glBI0huiwpz3DCPM2jqlqjQkkvVoZrFwip+jKinsUdMvNOZkZZLJvqsCPjV/Dvp1EZB89so1Oh13Hm3e0JMHeA9jhEyij4iAZ6j8ZX1goJwUG2vUrbJnKnHyGuiHmomBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xd9jVMIXqutzTSzByHQ4Gz4jQ298DCDpvO0GuYHH8Fk=;
 b=ctcebduvDhrgH1twiIEqr8UvJMQAnwqZDqTIMyv49VNPze49sMQKLzN1WMCC1YcLDBn5ePgx/YioLW4MA/UrwIDs2lHb4/aTq66zP1UTy8Sx/3PPQ83V1mhbAHnUn9GA3Ub9Bg0VticP5KkT+n2BtKeIi8k51lm+p0D5cs6Rc3vHXqtEcPQMZ5QxhVoo5Tb4Iz3lTY0F+OVbE5CaOUYyhLCSqsypNNqBpuz31fE+0qAltOB9W71a1jUfv8RiwWCBsdk/hUAQbps4Lf7P1pHBORPC8mC0kZUtZ4z1BmHD+GFqGnyDw2jsXctjd4xKw0MKOXcL7RtX1joysSxbeEnCfQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Boris Ostrovsky
	<boris.ostrovsky@oracle.com>,
        Juergen Gross <jgross@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "julien@xen.org"
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Jan Beulich
	<jbeulich@suse.com>,
        Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: AQHXy8L4matlcvklF0O8ro+XGa1E1qwGA0aAgAATaYA=
Date: Tue, 16 Nov 2021 10:45:43 +0000
Message-ID: <ab6a44b3-6b56-191a-a653-ce5ace50975d@epam.com>
References: <20211028061341.1479333-1-andr2000@gmail.com>
 <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
In-Reply-To: 
 <CAMuHMdXEGtr5Js4QwyGBMLP_LzG8mk0Ovv9PiOpnU2-VVp+7dg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 473a139d-b018-4dcb-3225-08d9a8ee3db4
x-ms-traffictypediagnostic: AM0PR03MB5794:
x-microsoft-antispam-prvs: 
 <AM0PR03MB5794B71F20F73320E0F44271E7999@AM0PR03MB5794.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p7tzbg3bE3MJbxUlo20MOQRn1bcwmbtGxxY3SgaG9lfOsW8azhdHALsN2Sz4D5xNxoiZXoYSWQhgG+7g3kujloKEBUNPJYEOzwgCCZqhux8znkhsG4ukLWp8+DH90+R3u/7FBcWXWWrpu0kpfkkqnUSKmLExNPCDGzTT/5AQPrTDX7PJJxIbkVMZcyOVRO3JkRW3AYEcE672QXmt9opnDp8FsnMm3gXvcByIaIDZpLc/ZTMeB4cjyFAWisneLRKFhidPJsvh60uCd47g6bTBkak4/6QNzDXJk6zpCTyrhgdld/y8Ihwe4LA3tnrKxhzHE4rUgNKXVb1FtOYJfiajt/MKu/dOxW3A+c3ovtvHFo+VHra3Te/GeKtDBMSgUsqcUIDW5qvob6+zPN14ruTITAUwKE/M4n9YOlu/DXX+OAGxLjEhFHZwFurQC7e7rerYdHGAYI8hn2Szp5G0gJN9WQZ6aqyjsx0N48+2LQ30Xta1o/xpm7yl9j7sK+IUtwqZMu1EscqrJHKS13fo24mWnJ6rzsN7XbALp/q745pJZbDdJieFsO3HojLRa/014sdBhGDYfJcYBnPoyOnOaFuHPoLz0dHqBCij/kxoyczHhbARiaYaEgnry1j4Zf0GOxybwk9BES/9FTw5LEGTwoz+jrRGh997L4mL61rhJpaKmuXnrjiE5jQvqtxy8u52BEr7Lpv5sYtJpgm87EhagsygyQSFWZHFICo8qc0ZX6nsg/vzxIfH75FXVmOevs2xG+pb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(31686004)(316002)(2906002)(86362001)(2616005)(5660300002)(107886003)(36756003)(4326008)(8676002)(122000001)(38100700002)(26005)(76116006)(53546011)(83380400001)(186003)(6506007)(66946007)(508600001)(91956017)(110136005)(6486002)(38070700005)(71200400001)(54906003)(66556008)(6512007)(66446008)(31696002)(66476007)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UVdDSzF2dWllbk1Xd3RvL3ZIVDhZU09TT2diTEIwOGFKMlplTGZIZ04zNDQz?=
 =?utf-8?B?YmdiTVBWVjVSeENPQ21WRlB2YmEwWXBGQWJoM3dyb1RrTFZnZUtWWVBselNq?=
 =?utf-8?B?UE0yNGVEaXIrVUhabTY5bVowNXVWb0hoS3k2MWVKS01rclVFK3RmYXJQaWpY?=
 =?utf-8?B?Q1dEWDJwWUZkU293bVEzY25WcHpsZVI5RmNyVUpDNTMwemVWSzFxc2hhNUUw?=
 =?utf-8?B?S0I0bCthUEE1a2RCazhiYk56WXYxQVRFMzJvQVRybkxZemhxc0Y3d1ZyYWd5?=
 =?utf-8?B?VnRTQ2xDQUlrVVRhMXoxajgrNXNmNVRyVi9tRnU1WHBUOGthWVBEbXFlekhY?=
 =?utf-8?B?VFh0MXFNYUlwOWVkWXhQSmM0TDJIcFZWbnNoR0I5OVNDZGhKOTRnMVRUMXVs?=
 =?utf-8?B?MFdUcGVXWjlLakdrMEJQb0hId2NsMzJodldqN2p4MTNqTmpzWTNDU3Y2MzMr?=
 =?utf-8?B?UzhneHZCemMxaUg4WWZVcXZvS1hPbjR0STN6cm9KR2NOTTRLcDVOQ1hDaUF4?=
 =?utf-8?B?SHdwMHFmTkkrdXMwTGxnODB3cjltNnc3WmR5SzNqUnNPdkhhcjl1cDhYY1ZQ?=
 =?utf-8?B?cDNkY0JLb29FRWxZbXo2UGxYUzFiaW9KenFON2ZGVWNKeTFtcFR4VitSdU5t?=
 =?utf-8?B?N2RXcStqUGlVSFE1VU1OTVh0cytMdHcwQjRDSzlpaDhBOTI4TkUwYkdBYUJj?=
 =?utf-8?B?a1FVT0ZpWk1UQXFETzlmZEY1L2NaazN3Nnp4SVFOUExQSTRCSGpPeXphdVRJ?=
 =?utf-8?B?OXdSNEE2eVBnYThzRG43aEY0V3pXd0tOSURiU3BCZFM0aWE1cnFpN0Uwc2tp?=
 =?utf-8?B?WUxseTVpbzlNb3hPU3ZMQzRqZmZNQjFQS21FZU9JQU4rQXBreGI4Y1JhbzI0?=
 =?utf-8?B?S0Q4RkY2aFp0ai91R0wzYmd3RXh0WjN6VkRqckdjZ3FZUmNQc1FKTnNGNXYz?=
 =?utf-8?B?UldjK0p6S1ZoWVdrQ0FGYm1RVmk0TC9ndDdlOUR3WXhQSHdVbU1keEQ4ZTNi?=
 =?utf-8?B?S3BTVFcyeVQ0eXBQMXU3dFZrNkErVWN1WXg1SkdHcVlOcGc1YzhyY3lEM2Qr?=
 =?utf-8?B?T3NoNTN1K1JETVdSa0xRUFR1YkgvMGZacGRMeTAwK0RBbnNMaWJCa0RwbEFj?=
 =?utf-8?B?MW9IMkE4UHpIc2JMbGJNQ2ppUEl3RUFIcWFQcjdBcWVZUHRZQ3Q4UU0yTjZt?=
 =?utf-8?B?SXhOTmRhQmF3bXEyaGkwRGhaQ1RBRytrZ3hNUEQ4dlhlOWNBTE5NRmFOMUt0?=
 =?utf-8?B?ZFRpMmlYaE12VWd2cGlFRDlJdnhJUWJ3Q2xSczFxZXpGeExJRWl5d29QdVRW?=
 =?utf-8?B?Wm9COG5SMEJrdGp0YWxtZE9kMVhhU0xxQnE2MEtTSHNFNFVGYUFMQzBsU0c0?=
 =?utf-8?B?N2FYSUYreFBSRjd1WmlJWWJuVnpEakx6QmY2bG54bnRBOGo4M29kVWFBSHY5?=
 =?utf-8?B?NnBrYjhYQzZQK2Z1MDljN0FYbzZxaGtZUmRFZUpONHFMZHl1Qm5HblJpYzhF?=
 =?utf-8?B?cEd2TVRmVlhsTm5WVkpaT2VZY1NUSmJUR1FaUWF6M1BqcHgxVlNEc2U0MGdl?=
 =?utf-8?B?Tm9Xb01QTUFWRlNsVEFVZCs1cmlyMTZUSVN2dlRWR0ZRTWJJSW5YY05Rcnc2?=
 =?utf-8?B?S045cWFUekJyS1NGZ2dhS3pZN3dUQmVaR1NwT0NmSVkrNWgyTXlGMTNLazVk?=
 =?utf-8?B?TmExUUwxb2tRdGhGY0pqd0ZrakRJZnRDRHQzUWpxWTBGcTVmY2hBUlBtRHkv?=
 =?utf-8?B?SFFWSUhtdXlCRGVBOVlqbjJVQjRZVHRIUjNOSVlYTVpUYmhrZUtKa3REMGtl?=
 =?utf-8?B?OWkvNzRnWUxEVTZlWDVzTzY4dDZ0azFHU0M3VHoyTDdUcUNhRnpDaktKSDZl?=
 =?utf-8?B?OTZ1Qmk5MUs2RnZtTExrMzZnTFU3TkFlVzR6M08zR2g3aTFBL240RmZBYjFw?=
 =?utf-8?B?bzAvbjdtVWx5VHAxNzdtYlNML0pDR0dMVFMzdGRHbWVLQ0J3WU5Da0ttcXhF?=
 =?utf-8?B?ekkxbWk0VlpMbE9wK3VVOUV3c3MrVmlyWmJlWFp3enVkMXBXRW00VkR4NytX?=
 =?utf-8?B?elR5VGRFYkFYdFVuY0hSc1NPQk5NanE2enZheFVTbWtTMjllVWFzNXAwcis2?=
 =?utf-8?B?WEo5SlZZTmI0c0hHbk93OGdyOWJHTitnVTJSWDNUN1RBRlBwWXZiVTF1ZTU5?=
 =?utf-8?B?Vk1HTHJqMEpXbk5SYkRsa2ZqYm9OTEVLSmJaOW1xZUFRT25Kb0tUNHBZczZB?=
 =?utf-8?B?Rklmakd4Y1JjZWhLdFNtK0ZIUTlhRU5aWnZ0YmR6MGtNRjJ2c3czbDk3UDdp?=
 =?utf-8?B?L0NFSXVNbTl0VG5xSFp2ZE9HaE1oMEVaUHBvRXZXVzdmUDJjWWZDQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C372AB8151DCAB4C983EB234040B6FAC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 473a139d-b018-4dcb-3225-08d9a8ee3db4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 10:45:43.9184
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9fpdl+CwNsJWcMcaVXUtXN793POE5xUFMbcnuQkXwVd/ZI+TfTtB+NK4z1pAQTh9JMXnuBMwBbO07bVDK3qd+XduwSmJP56J1JURRLgqnO4R7bOqfuPN2+RuxyLzYgA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5794
X-Proofpoint-GUID: GyossbfTD6sRIL_6xOFlFjSIESw1VY5P
X-Proofpoint-ORIG-GUID: GyossbfTD6sRIL_6xOFlFjSIESw1VY5P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-15_16,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1011 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160054

SGksIEdlZXJ0IQ0KDQpPbiAxNi4xMS4yMSAxMTozNiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Og0KPiBIaSBPbGVrc2FuZHIsDQo+DQo+IE9uIFRodSwgT2N0IDI4LCAyMDIxIGF0IDg6MTUgQU0g
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28NCj4gPGFuZHIyMDAwQGdtYWlsLmNvbT4gd3JvdGU6DQo+
PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29A
ZXBhbS5jb20+DQo+Pg0KPj4gWGVuLXBjaWJhY2sgZHJpdmVyIHdhcyBkZXNpZ25lZCB0byBiZSBi
dWlsdCBmb3IgeDg2IG9ubHkuIEJ1dCBpdA0KPj4gY2FuIGFsc28gYmUgdXNlZCBieSBvdGhlciBh
cmNoaXRlY3R1cmVzLCBlLmcuIEFybS4NCj4+DQo+PiBDdXJyZW50bHkgUENJIGJhY2tlbmQgaW1w
bGVtZW50cyBtdWx0aXBsZSBmdW5jdGlvbmFsaXRpZXMgYXQgYSB0aW1lLA0KPj4gc3VjaCBhczoN
Cj4+IDEuIEl0IGlzIHVzZWQgYXMgYSBkYXRhYmFzZSBmb3IgYXNzaWduYWJsZSBQQ0kgZGV2aWNl
cywgZS5nLiB4bA0KPj4gICAgIHBjaS1hc3NpZ25hYmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlw
dWxhdGVzIHRoYXQgbGlzdC4gU28sIHdoZW5ldmVyDQo+PiAgICAgdGhlIHRvb2xzdGFjayBuZWVk
cyB0byBrbm93IHdoaWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaA0KPj4gICAg
IGl0IHJlYWRzIHRoYXQgZnJvbSB0aGUgcmVsZXZhbnQgc3lzZnMgZW50cmllcyBvZiB0aGUgcGNp
YmFjay4NCj4+IDIuIEl0IGlzIHVzZWQgdG8gaG9sZCB0aGUgdW5ib3VuZCBQQ0kgZGV2aWNlcyBs
aXN0LCBlLmcuIHdoZW4gcGFzc2luZw0KPj4gICAgIHRocm91Z2ggYSBQQ0kgZGV2aWNlIGl0IG5l
ZWRzIHRvIGJlIHVuYm91bmQgZnJvbSB0aGUgcmVsZXZhbnQgZGV2aWNlDQo+PiAgICAgZHJpdmVy
IGFuZCBib3VuZCB0byBwY2liYWNrIChzdHJpY3RseSBzcGVha2luZyBpdCBpcyBub3QgcmVxdWly
ZWQNCj4+ICAgICB0aGF0IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8gcGNpYmFjaywgYnV0IHBjaWJh
Y2sgaXMgYWdhaW4gdXNlZCBhcyBhDQo+PiAgICAgZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJv
dWdoIFBDSSBkZXZpY2VzLCBzbyB3ZSBjYW4gcmUtYmluZCB0aGUNCj4+ICAgICBkZXZpY2VzIGJh
Y2sgdG8gdGhlaXIgb3JpZ2luYWwgZHJpdmVycyB3aGVuIGd1ZXN0IGRvbWFpbiBzaHV0cyBkb3du
KQ0KPj4gMy4gRGV2aWNlIHJlc2V0IGZvciB0aGUgZGV2aWNlcyBiZWluZyBwYXNzZWQgdGhyb3Vn
aA0KPj4gNC4gUGFyYS12aXJ0dWFsaXNlZCB1c2UtY2FzZXMgc3VwcG9ydA0KPj4NCj4+IFRoZSBw
YXJhLXZpcnR1YWxpc2VkIHBhcnQgb2YgdGhlIGRyaXZlciBpcyBub3QgYWx3YXlzIG5lZWRlZCBh
cyBzb21lDQo+PiBhcmNoaXRlY3R1cmVzLCBlLmcuIEFybSBvciB4ODYgUFZIIERvbTAsIGFyZSBu
b3QgdXNpbmcgYmFja2VuZC1mcm9udGVuZA0KPj4gbW9kZWwgZm9yIFBDSSBkZXZpY2UgcGFzc3Ro
cm91Z2guDQo+Pg0KPj4gRm9yIHN1Y2ggdXNlLWNhc2VzIG1ha2UgdGhlIHZlcnkgZmlyc3Qgc3Rl
cCBpbiBzcGxpdHRpbmcgdGhlDQo+PiB4ZW4tcGNpYmFjayBkcml2ZXIgaW50byB0d28gcGFydHM6
IFhlbiBQQ0kgc3R1YiBhbmQgUENJIFBWIGJhY2tlbmQNCj4+IGRyaXZlcnMuDQo+Pg0KPj4gRm9y
IHRoYXQgYWRkIG5ldyBjb25maWd1cmF0aW9uIG9wdGlvbnMgQ09ORklHX1hFTl9QQ0lfU1RVQiBh
bmQNCj4+IENPTkZJR19YRU5fUENJREVWX1NUVUIsIHNvIHRoZSBkcml2ZXIgY2FuIGJlIGxpbWl0
ZWQgaW4gaXRzDQo+PiBmdW5jdGlvbmFsaXR5LCBlLmcuIG5vIHN1cHBvcnQgZm9yIHBhcmEtdmly
dHVhbGlzZWQgc2NlbmFyaW8uDQo+PiB4ODYgcGxhdGZvcm0gd2lsbCBjb250aW51ZSB1c2luZyBD
T05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGZvciB0aGUNCj4+IGZ1bGx5IGZlYXR1cmVkIGJhY2tl
bmQgZHJpdmVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBBbmRydXNoY2hlbmtv
IDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IEFu
YXN0YXNpaWEgTHVraWFuZW5rbyA8YW5hc3Rhc2lpYV9sdWtpYW5lbmtvQGVwYW0uY29tPg0KPj4g
UmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4N
Cj4+IFJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+IFRoYW5r
cyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93IGNvbW1pdCBhNjdlZmZmMjg4MzJhNTk3DQo+
ICgieGVuLXBjaWJhY2s6IGFsbG93IGNvbXBpbGluZyBvbiBvdGhlciBhcmNocyB0aGFuIHg4NiIp
DQo+IGluIHY1LjE2LXJjMS4NCj4NCj4+IC0tLSBhL2RyaXZlcnMveGVuL0tjb25maWcNCj4+ICsr
KyBiL2RyaXZlcnMveGVuL0tjb25maWcNCj4+IEBAIC0xODEsMTAgKzE4MSwzNCBAQCBjb25maWcg
U1dJT1RMQl9YRU4NCj4+ICAgICAgICAgIHNlbGVjdCBETUFfT1BTDQo+PiAgICAgICAgICBzZWxl
Y3QgU1dJT1RMQg0KPj4NCj4+ICtjb25maWcgWEVOX1BDSV9TVFVCDQo+PiArICAgICAgIGJvb2wN
Cj4+ICsNCj4+ICtjb25maWcgWEVOX1BDSURFVl9TVFVCDQo+PiArICAgICAgIHRyaXN0YXRlICJY
ZW4gUENJLWRldmljZSBzdHViIGRyaXZlciINCj4+ICsgICAgICAgZGVwZW5kcyBvbiBQQ0kgJiYg
IVg4NiAmJiBYRU4NCj4+ICsgICAgICAgZGVwZW5kcyBvbiBYRU5fQkFDS0VORA0KPj4gKyAgICAg
ICBzZWxlY3QgWEVOX1BDSV9TVFVCDQo+PiArICAgICAgIGRlZmF1bHQgbQ0KPiBQbGVhc2Ugbm90
ZSB0aGF0IHRoaXMgbWVhbnMgImRlZmF1bHQgeSIgaWYgQ09ORklHX01PRFVMRVM9bi4NCj4gUGVy
aGFwcyB0aGlzIHNob3VsZCBiZSAiZGVmYXVsdCBtIGlmIE1PRFVMRVMiIGluc3RlYWQ/DQpJIGRv
bid0IHJlYWxseSBoYXZlIHN0cm9uZyBvcGluaW9uIG9uIHRoaXMgYW5kIHdpbGwgbGV0IFhlbiBt
YWludGFpbmVycw0Kc3BlYWs6IEBCb3JpcywgQEp1ZXJnZW4gd2hhdCdzIHlvdXIgcHJlZmVyZW5j
ZSBoZXJlPw0KPg0KPj4gKyAgICAgICBoZWxwDQo+PiArICAgICAgICAgVGhlIFBDSSBkZXZpY2Ug
c3R1YiBkcml2ZXIgcHJvdmlkZXMgbGltaXRlZCB2ZXJzaW9uIG9mIHRoZSBQQ0kNCj4+ICsgICAg
ICAgICBkZXZpY2UgYmFja2VuZCBkcml2ZXIgd2l0aG91dCBwYXJhLXZpcnR1YWxpemVkIHN1cHBv
cnQgZm9yIGd1ZXN0cy4NCj4+ICsgICAgICAgICBJZiB5b3Ugc2VsZWN0IHRoaXMgdG8gYmUgYSBt
b2R1bGUsIHlvdSB3aWxsIG5lZWQgdG8gbWFrZSBzdXJlIG5vDQo+PiArICAgICAgICAgb3RoZXIg
ZHJpdmVyIGhhcyBib3VuZCB0byB0aGUgZGV2aWNlKHMpIHlvdSB3YW50IHRvIG1ha2UgdmlzaWJs
ZSB0bw0KPj4gKyAgICAgICAgIG90aGVyIGd1ZXN0cy4NCj4+ICsNCj4+ICsgICAgICAgICBUaGUg
ImhpZGUiIHBhcmFtZXRlciAob25seSBhcHBsaWNhYmxlIGlmIGJhY2tlbmQgZHJpdmVyIGlzIGNv
bXBpbGVkDQo+PiArICAgICAgICAgaW50byB0aGUga2VybmVsKSBhbGxvd3MgeW91IHRvIGJpbmQg
dGhlIFBDSSBkZXZpY2VzIHRvIHRoaXMgbW9kdWxlDQo+PiArICAgICAgICAgZnJvbSB0aGUgZGVm
YXVsdCBkZXZpY2UgZHJpdmVycy4gVGhlIGFyZ3VtZW50IGlzIHRoZSBsaXN0IG9mIFBDSSBCREZz
Og0KPj4gKyAgICAgICAgIHhlbi1wY2liYWNrLmhpZGU9KDAzOjAwLjApKDA0OjAwLjApDQo+PiAr
DQo+PiArICAgICAgICAgSWYgaW4gZG91YnQsIHNheSBtLg0KPj4gKw0KPj4gICBjb25maWcgWEVO
X1BDSURFVl9CQUNLRU5EDQo+PiAgICAgICAgICB0cmlzdGF0ZSAiWGVuIFBDSS1kZXZpY2UgYmFj
a2VuZCBkcml2ZXIiDQo+PiAgICAgICAgICBkZXBlbmRzIG9uIFBDSSAmJiBYODYgJiYgWEVODQo+
PiAgICAgICAgICBkZXBlbmRzIG9uIFhFTl9CQUNLRU5EDQo+PiArICAgICAgIHNlbGVjdCBYRU5f
UENJX1NUVUINCj4+ICAgICAgICAgIGRlZmF1bHQgbQ0KPj4gICAgICAgICAgaGVscA0KPj4gICAg
ICAgICAgICBUaGUgUENJIGRldmljZSBiYWNrZW5kIGRyaXZlciBhbGxvd3MgdGhlIGtlcm5lbCB0
byBleHBvcnQgYXJiaXRyYXJ5DQo+IEdye29ldGplLGVldGluZ31zLA0KPg0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg0KPg0KPiAtLQ0KPiBH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnDQo+DQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBM
aW51cyBUb3J2YWxkcw0K

