Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AA8442BB5
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220000.381082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr7k-0006Fo-NZ; Tue, 02 Nov 2021 10:34:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220000.381082; Tue, 02 Nov 2021 10:34:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhr7k-0006Cj-JZ; Tue, 02 Nov 2021 10:34:36 +0000
Received: by outflank-mailman (input) for mailman id 220000;
 Tue, 02 Nov 2021 10:34:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8XNU=PV=epam.com=prvs=19406420d3=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mhr7j-0006Ca-9x
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:34:35 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 780721ae-3bc8-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 10:34:33 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A29xHhm023073;
 Tue, 2 Nov 2021 10:34:31 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2056.outbound.protection.outlook.com [104.47.0.56])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c336405eb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Nov 2021 10:34:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7489.eurprd03.prod.outlook.com (2603:10a6:20b:272::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Tue, 2 Nov
 2021 10:34:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 10:34:26 +0000
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
X-Inumbo-ID: 780721ae-3bc8-11ec-8555-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oqy6dMLjAyrD7g24R4ynQroTJyA8PNjQrJwmN/XNRAvCnlDsYyuYcusmTzHUY5mKjzEUy9DYQ54cM4L07JEAFpsyqFEKAnYQwcWL7CEMofYROb+jFQlcwumMS9MF86wQIoF01TkOdE5bP+vys426C9e6rkyn9/B0DsQ9vj6adrRsrzd2LUDWhE48zf6SKHGWK8h/xvy32ZLs8yfpuPq+/mgPNj3hCKW1//UqLCgMexfbnlCmWNoQs4eOSVHu0jU9LBIGfFmx9p7Gpu7Czup16dLAnWToXtpm+weOLcPu4SRBDPCDr+1wnGXrWcYS6EnFa1SNItVge+GUImrVyHEUow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jD+BZVfXgeMWFxVUu7RKBW1fryc0fvo5XzxtxDtM22o=;
 b=g+ULV58dBHWF+trVZYEdY2mXIoWtAm+Txx0uHMP76V8LKrUxjYfWv6Fh5PlvS0XDNg+RqrdnueEPAN2YIYJ8CMHfL0x7m2D++CxxRJ4lFui1B3mkAtD4eBucOHhjK7DLglFxQzSq0eDT/fDnJ0X2dECUtD8zy8A/jwGvTNvOUQKBZ9W0PZdN2nxI60h0SsmzZo74uNury1Vxh25aQg9bqGp7DeNmDLyq9t8vSeo3eJuxpv24D4hpC6dWkBMreqok6wsUIvuRnuvDF9P5aVqtUY41dblcRcdgQzFHBbwcw5gH7a6g9zpWSg9gKSpRiGdQ0UPAvMvolP5NWjliOE0+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jD+BZVfXgeMWFxVUu7RKBW1fryc0fvo5XzxtxDtM22o=;
 b=WTZdXtXP5Pks9ZLHxPvF/OQ/cEqW3plf0zTcrB0b2sO8SUXn7xajF2hdm7raZbAQCKigo2yWHS9PjNHvgfYZVjxNsZRYr3AyUS7ViYMx9dKsnTLxHNik2JJddxBumR6upej/QMKXGeb0HUGtxUU7A9olBLTVS0zpHoOJ/ID86z4rpSDt/ISPAtZtaCZoqBlr38wsyvABozCve+zYc1lA1H0g7XPJZdmAjeIULnyaXaxprXeV/ZEIl8FlGxQw0zNQe17D++/MIzqvn1diFcM5DBY3MyOnGafg3mAjpoTfu49ni01tB2YEkcAPgoX5B+TB+xVrYfzqQ6fmDei2OahuJA==
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
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Thread-Topic: [PATCH v3 06/11] vpci/header: Handle p2m range sets per BAR
Thread-Index: AQHXtdAibxRAFQhJuUO1GvFhv7aI/6vlJmuAgAsYXoA=
Date: Tue, 2 Nov 2021 10:34:26 +0000
Message-ID: <3f5cd72e-8096-2628-bc1b-1a4b41d70498@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-7-andr2000@gmail.com>
 <YXfFhZ2/kX15CbLJ@MacBook-Air-de-Roger.local>
In-Reply-To: <YXfFhZ2/kX15CbLJ@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2e248f30-76bb-449d-8791-08d99dec5831
x-ms-traffictypediagnostic: AM9PR03MB7489:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB7489D41C3D589C2E986F22ECE78B9@AM9PR03MB7489.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ow45zbxr2i4FXGyJrjAUgHWn5/K5HcSMF266J2MDLCKUJY3WC4OYzKi9EoGnuyamuqsiJgJl4diKM4+nY5FjvYpZRDFVHwGp6Z4StCwMlq0ThY7Q4cuy24S2+AJNZEtJZED0Oax5qkl7vSuxhW/6TGqI97/oKM7Cp5NiZxeBIrfQ/EQvPCMhq9+JHhEX9xZxarZUD+M/Ux0wsD+M7UHBq3sh2RZdVlObKLc8pUWxM5paHyNLIB3Kt98W9FElNtiCitgVEHcCn+sYzBhiVLvhKfMmnsMfhszTOWP572SpzR0tSH3Tgl0uj+KoafWQxcRNeMVflRzHgzEDSFE6bB13mAf6m/tjGza0xdnvq5hNkJp7iGBwoUBJy9y2EGLAMXpqJqRHGZWgpVmAlWR3VDOGC56pGRgc22C6JshXwOC9SlbFtKnwLSM93ShmzdyeJ0vFlLDZeY0SxklN3a4HyBpGi0DczIRQILXIOvVvTfOab8ULLs3TzL95sLJNFHxuJaIlPBWtEHfskYUbOcXkP3AGQ3zcZGLbHv0C0hwSGi+Xlh3rjilK9CeH26406WIKDllGzX5y+B0QRz79yNKOCb01jH+xRoHma8BQv6lCAzpygIygYp04irziLpV50LLhRWX7jHkk5qVBdlygBbbb7DCtnxiwnhbOdMc8t+XqG5+AvDgaHYJov6RyBiQvICbnJNhLZAFZFyvF5wbjTYiI4e0ExLVbsfYoSVcSNlvmYnzrfu/ICTfN6GuE0ZLUSu5QBp20
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(5660300002)(31686004)(8676002)(38070700005)(4326008)(107886003)(36756003)(122000001)(83380400001)(8936002)(508600001)(30864003)(71200400001)(26005)(6916009)(31696002)(91956017)(6512007)(53546011)(316002)(66946007)(76116006)(54906003)(66556008)(6506007)(2616005)(6486002)(64756008)(66446008)(2906002)(86362001)(66476007)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2ZoN0h1S0JHSHpQZGduMDdWd2RxVGRYNkF2dmdIdE13T0toNVNKZS9INEQv?=
 =?utf-8?B?OUhla1E0NDFVKzVmSlRFeTFXQlhZVVpybmZFZERIYjFhYkJ5RmF2Q3VvWUN3?=
 =?utf-8?B?a2F6VFRaRExJMmQ3WmwxdmYvZTloMmZCQVl1d3hZQk1UaGFUZUZzU21QTjls?=
 =?utf-8?B?MXE0b3Q1V3lMNXpTSThmVFBtWngxNFRhaS9nSG1JTnUyQ05Gb2VRUlJNVjBT?=
 =?utf-8?B?eFdMMlN5Yk82R0ErRnJ4V3JyZ1pYY1FETGptbkF3OFArSW5VaU9jN0lCRTl4?=
 =?utf-8?B?RUhMeXhJd2lwbk1GMzRvTSs0ZjJsamFKOE43K3J0VDNoUFA1aGZ3S3hvaGNK?=
 =?utf-8?B?Vmpuc1M5dkpxVDUrdGxhYVVFanV3YlNWQXRsRE9RYTBNMm5JdmhsT3A5dDFC?=
 =?utf-8?B?NFNpVWw3dUd0bjRyTmk4Uk8xcGJqdllrNUJSeENMc01QODZXQzZza2NIYkR4?=
 =?utf-8?B?WkF3aDAzeENVcWNKK0VHMExwdkJ5VDdhTWVoU25qTTlxY1FiTVZ6QUZZVkV5?=
 =?utf-8?B?UituNUZyN1NaYkhURUF4MXlRc0tzR3dFbHdueStmS2JIT0kzYnVXbGxWSE92?=
 =?utf-8?B?SEJSNnJYSE5VV25RVmZBdVY4ZENQcDdyR1BrdE14UXEwendraGJQYlNmM3V4?=
 =?utf-8?B?cytGZFd2U0NNcHBFbmJiQnVwcXVia3dVV1pLTm5wampMeVhoYlM1U1VzbFNX?=
 =?utf-8?B?MXJpbHZRenUvV3V2dG9vUE8yMUlaWEFoTStLRlV4NVFoS2E4Z0pHOFFidW44?=
 =?utf-8?B?QWEwRS81WndyWTNKL2c3RkV1ODBYWVRkMXdveFVkM24xTXFmNXlhWnQwb0JK?=
 =?utf-8?B?ZW13eEJHNWtGZlJnUVBGbWRVZWNKKzg2aWIwYWtIUW5FUEhTY2M1ZUZKUnNz?=
 =?utf-8?B?Q0YyNFBoVnRKbDZUQ3I2TFZYVEpLOFpaT1dJZ0EycFhnZ1l1TlR2OGZlb1ND?=
 =?utf-8?B?ZHErT3dzSU1qNU1pTE96YkdFeTJ3TlVyaHR0RDhMU0JxUjU3SUVzR09uYU44?=
 =?utf-8?B?OWt4YWUxYloyMnNzL2VmcWxRQnk3MG5qeUdoaXF4L0tIZEdWamtOMFJUdHFj?=
 =?utf-8?B?dTlYa1pXaFNmMkpDcVJiT0tYaVg1Y1JCSFR5Z00zMVVuOWFYWWVwR2gxZ1Nh?=
 =?utf-8?B?NlVnS0xSY3oweElYLytFRS9MeVEyeXZKcVBYRzFlMitTempJaHoxdVl4TEFx?=
 =?utf-8?B?WWtxcVBXR0Z1RUlLZ3VSV2lFTEY3UzdqMFJTNVk0T3hhQ1lFVjZxNnp1Y09G?=
 =?utf-8?B?ZTZqVjhWd2ZUMTFOVjNodURDTnBwb2tMSzNYOXlSd1Q1T2VDQVBrNXlMZ0ZJ?=
 =?utf-8?B?WEUvNUhqVE0rQkhyQUpJWTVHZmRSMEVhRlRPTTQ3dE4rZnRIdW9IcFZEY1pn?=
 =?utf-8?B?dkVDSDFzQnBmU1FJZkZtdGYxQVhXajdabEpwejVIQ0VOS0VzVlB0UjkweUJZ?=
 =?utf-8?B?UlhHWFRQS1lJVTE2cTZMSVRHT0twM1RLT01rbEtYYTJ0Y3JaUjlNZ2RQK0FR?=
 =?utf-8?B?NHFhTXdTRlljaXNFUXppY09jSW04YjdHbHNtaDFJVk9WWGpQb05tZW8rKzlu?=
 =?utf-8?B?ZUtTZURrdjZ0bE50QXFDOFRvYjFPTExkWkc2MTlETHRpZVJZVjdBeGlEQUZu?=
 =?utf-8?B?Q3l4MVZvYWZNZjRZaVZrM2pZUlRZQmNuc0lYUDViR1BQMUdRVHFJeXMyK2E0?=
 =?utf-8?B?cjQ3WU04ZHFmdzZKRFF2bVJYeGg4VlhRVWpER2tDUkxxY0h2RFNib2pRTXFN?=
 =?utf-8?B?azBUbHVEWmZkanlVR0xDazJzV3lVV3hmdXZuQ2s1VTV5YW5hcUxCQ2lJMHN0?=
 =?utf-8?B?OXJwd3BvdkYrMmozVWlia3VaREh2SkF1STF3N1ZnckVIL1pOa3ZHQjBRa1lG?=
 =?utf-8?B?YnR0SDJUWmNhUlAyQTg1VERVK3FmSng3MFJUNTRBS29jTkdySGc5K0s1aXZH?=
 =?utf-8?B?OTBzblZXT01RMzZPcWxxNG1aL0RNVC9rNFZCclRWSnRwMHU1UlNPV2M5d1k1?=
 =?utf-8?B?K3Y2NW9BWU9kWWQ5MnFIQnRwVTF1UGZJMitLM1JlV2xUV1hHWlF4cVB0dDlm?=
 =?utf-8?B?bERBelF0NEJyWHRMejgvYVdBUlRGOXlKcFByN3RJeVNwNGJHN01nQXU1QXlR?=
 =?utf-8?B?MUQrSTdRb0p1TktsMFVxeEQwNmF2UitrQU9XcFMyaTRnMGpEL3NIM0d6QXJ6?=
 =?utf-8?B?Z3ErQWttWEdYa1NCWnlSZkNRS1I5V2Y5bDRWZGZscVJpT0NuTm96YWhpTzRB?=
 =?utf-8?B?cmFhL000Qmxhek9RRzBTSnlYVk1uTzFtUlB6T08yVmcxUXArVzVrTExHbXZr?=
 =?utf-8?B?Q0dkTnkveVZxTm1YSDFUbm53TjZVMUFvUXpqd0xRTmFzb210QUwrZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FC816417F9FADC4A8A29A7A08BEFAAA1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e248f30-76bb-449d-8791-08d99dec5831
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2021 10:34:26.5297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97jpgHUoBD0d2xkQTVs+po0j27FOjys7ae3Oe0Z72M0gvoFCKNS9jRYDfeJC5ks5aV0XyAotGsaVP2UGCz0azn0y3T1sgpYs8wD9hEAidjvUNhohpjVisR/Rfl5wsgJh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7489
X-Proofpoint-ORIG-GUID: EaVF6RVLbITqrTu_QzNPV4j1SEhKApIJ
X-Proofpoint-GUID: EaVF6RVLbITqrTu_QzNPV4j1SEhKApIJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_06,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111020062

SGksIFJvZ2VyIQ0KDQpPbiAyNi4xMC4yMSAxMjowOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMTA6NTI6MThBTSArMDMwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gSW5zdGVhZCBvZiBoYW5kbGlu
ZyBhIHNpbmdsZSByYW5nZSBzZXQsIHRoYXQgY29udGFpbnMgYWxsIHRoZSBtZW1vcnkNCj4+IHJl
Z2lvbnMgb2YgYWxsIHRoZSBCQVJzIGFuZCBST00sIGhhdmUgdGhlbSBwZXIgQkFSLg0KPj4NCj4+
IFRoaXMgaXMgaW4gcHJlcGFyYXRpb24gb2YgbWFraW5nIG5vbi1pZGVudGl0eSBtYXBwaW5ncyBp
biBwMm0gZm9yIHRoZQ0KPj4gTU1JT3MvUk9NLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+
IC0tLQ0KPj4gICB4ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jIHwgMTcyICsrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+PiAgIHhlbi9pbmNsdWRlL3hlbi92cGNpLmggICAg
fCAgIDMgKy0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgNTMgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMg
Yi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+PiBpbmRleCBlYzRkMjE1ZjM2ZmYuLjljNjAz
ZDI2ZDMwMiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+ICsr
KyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IEBAIC0xMzEsNDkgKzEzMSw3NSBAQCBz
dGF0aWMgdm9pZCBtb2RpZnlfZGVjb2RpbmcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVp
bnQxNl90IGNtZCwNCj4+ICAgDQo+PiAgIGJvb2wgdnBjaV9wcm9jZXNzX3BlbmRpbmcoc3RydWN0
IHZjcHUgKnYpDQo+PiAgIHsNCj4+IC0gICAgaWYgKCB2LT52cGNpLm1lbSApDQo+PiArICAgIGlm
ICggdi0+dnBjaS5udW1fbWVtX3JhbmdlcyApDQo+PiAgICAgICB7DQo+PiAgICAgICAgICAgc3Ry
dWN0IG1hcF9kYXRhIGRhdGEgPSB7DQo+PiAgICAgICAgICAgICAgIC5kID0gdi0+ZG9tYWluLA0K
Pj4gICAgICAgICAgICAgICAubWFwID0gdi0+dnBjaS5jbWQgJiBQQ0lfQ09NTUFORF9NRU1PUlks
DQo+PiAgICAgICAgICAgfTsNCj4+IC0gICAgICAgIGludCByYyA9IHJhbmdlc2V0X2NvbnN1bWVf
cmFuZ2VzKHYtPnZwY2kubWVtLCBtYXBfcmFuZ2UsICZkYXRhKTsNCj4+ICsgICAgICAgIHN0cnVj
dCBwY2lfZGV2ICpwZGV2ID0gdi0+dnBjaS5wZGV2Ow0KPj4gKyAgICAgICAgc3RydWN0IHZwY2lf
aGVhZGVyICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+aGVhZGVyOw0KPj4gKyAgICAgICAgdW5zaWdu
ZWQgaW50IGk7DQo+PiAgIA0KPj4gLSAgICAgICAgaWYgKCByYyA9PSAtRVJFU1RBUlQgKQ0KPj4g
LSAgICAgICAgICAgIHJldHVybiB0cnVlOw0KPj4gKyAgICAgICAgZm9yICggaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiArICAgICAgICB7DQo+PiArICAgICAg
ICAgICAgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAmaGVhZGVyLT5iYXJzW2ldOw0KPj4gKyAgICAg
ICAgICAgIGludCByYzsNCj4+ICAgDQo+PiAtICAgICAgICBzcGluX2xvY2soJnYtPnZwY2kucGRl
di0+dnBjaS0+bG9jayk7DQo+PiAtICAgICAgICAvKiBEaXNhYmxlIG1lbW9yeSBkZWNvZGluZyB1
bmNvbmRpdGlvbmFsbHkgb24gZmFpbHVyZS4gKi8NCj4+IC0gICAgICAgIG1vZGlmeV9kZWNvZGlu
Zyh2LT52cGNpLnBkZXYsDQo+PiAtICAgICAgICAgICAgICAgICAgICAgICAgcmMgPyB2LT52cGNp
LmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1PUlkgOiB2LT52cGNpLmNtZCwNCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7DQo+PiAtICAgICAgICBzcGlu
X3VubG9jaygmdi0+dnBjaS5wZGV2LT52cGNpLT5sb2NrKTsNCj4+ICsgICAgICAgICAgICBpZiAo
ICFiYXItPm1lbSApDQo+PiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gICANCj4+IC0g
ICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3kodi0+dnBjaS5tZW0pOw0KPj4gLSAgICAgICAgdi0+dnBj
aS5tZW0gPSBOVUxMOw0KPj4gLSAgICAgICAgaWYgKCByYyApDQo+PiAtICAgICAgICAgICAgLyoN
Cj4+IC0gICAgICAgICAgICAgKiBGSVhNRTogaW4gY2FzZSBvZiBmYWlsdXJlIHJlbW92ZSB0aGUg
ZGV2aWNlIGZyb20gdGhlIGRvbWFpbi4NCj4+IC0gICAgICAgICAgICAgKiBOb3RlIHRoYXQgdGhl
cmUgbWlnaHQgc3RpbGwgYmUgbGVmdG92ZXIgbWFwcGluZ3MuIFdoaWxlIHRoaXMgaXMNCj4+IC0g
ICAgICAgICAgICAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxsIGxp
a2VseSBuZWVkIHRvIGJlDQo+PiAtICAgICAgICAgICAgICoga2lsbGVkIGluIG9yZGVyIHRvIGF2
b2lkIGxlYWtpbmcgc3RhbGUgcDJtIG1hcHBpbmdzIG9uDQo+PiAtICAgICAgICAgICAgICogZmFp
bHVyZS4NCj4+IC0gICAgICAgICAgICAgKi8NCj4+IC0gICAgICAgICAgICB2cGNpX3JlbW92ZV9k
ZXZpY2Uodi0+dnBjaS5wZGV2KTsNCj4+ICsgICAgICAgICAgICByYyA9IHJhbmdlc2V0X2NvbnN1
bWVfcmFuZ2VzKGJhci0+bWVtLCBtYXBfcmFuZ2UsICZkYXRhKTsNCj4+ICsNCj4+ICsgICAgICAg
ICAgICBpZiAoIHJjID09IC1FUkVTVEFSVCApDQo+PiArICAgICAgICAgICAgICAgIHJldHVybiB0
cnVlOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaS0+bG9jayk7
DQo+PiArICAgICAgICAgICAgLyogRGlzYWJsZSBtZW1vcnkgZGVjb2RpbmcgdW5jb25kaXRpb25h
bGx5IG9uIGZhaWx1cmUuICovDQo+PiArICAgICAgICAgICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYs
DQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJjID8gdi0+dnBjaS5jbWQgJiB+UENJ
X0NPTU1BTkRfTUVNT1JZIDogdi0+dnBjaS5jbWQsDQo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICFyYyAmJiB2LT52cGNpLnJvbV9vbmx5KTsNCj4+ICsgICAgICAgICAgICBzcGluX3Vu
bG9jaygmcGRldi0+dnBjaS0+bG9jayk7DQo+PiArDQo+PiArICAgICAgICAgICAgcmFuZ2VzZXRf
ZGVzdHJveShiYXItPm1lbSk7DQo+IE5vdyB0aGF0IHRoZSByYW5nZXNldHMgYXJlIHBlci1CQVIg
d2UgbWlnaHQgaGF2ZSB0byBjb25zaWRlcg0KPiBhbGxvY2F0aW5nIHRoZW0gYXQgaW5pdGlhbGl6
YXRpb24gdGltZSBhbmQgbm90IGRlc3Ryb3lpbmcgdGhlbSB3aGVuDQo+IGVtcHR5LiBXZSBjb3Vs
ZCByZXBsYWNlIHRoZSBOVUxMIGNoZWNrcyB3aXRoIHJhbmdlc2V0X2lzX2VtcHR5DQo+IGluc3Rl
YWQuIE5vdCB0aGF0IHlvdSBoYXZlIHRvIGRvIHRoaXMgb24gdGhpcyBwYXRjaCwgYnV0IEkgdGhp
bmsgaXQncw0KPiB3b3J0aCBtZW50aW9uaW5nLg0KWWVzLCB0aGlzIGlzIGEgZ29vZCBpZGVhLiBJ
IHdpbGwgcmUtd29yayB0aGUgcGF0Y2ggdG8gY3JlYXRlL2Rlc3Ryb3kNCnRoZSByYW5nZXNldHMg
b25jZSBpbiBhZGQvcmVtb3ZlDQo+DQo+PiArICAgICAgICAgICAgYmFyLT5tZW0gPSBOVUxMOw0K
Pj4gKyAgICAgICAgICAgIHYtPnZwY2kubnVtX21lbV9yYW5nZXMtLTsNCj4+ICsgICAgICAgICAg
ICBpZiAoIHJjICkNCj4+ICsgICAgICAgICAgICAgICAgLyoNCj4+ICsgICAgICAgICAgICAgICAg
ICogRklYTUU6IGluIGNhc2Ugb2YgZmFpbHVyZSByZW1vdmUgdGhlIGRldmljZSBmcm9tIHRoZSBk
b21haW4uDQo+PiArICAgICAgICAgICAgICAgICAqIE5vdGUgdGhhdCB0aGVyZSBtaWdodCBzdGls
bCBiZSBsZWZ0b3ZlciBtYXBwaW5ncy4gV2hpbGUgdGhpcyBpcw0KPj4gKyAgICAgICAgICAgICAg
ICAgKiBzYWZlIGZvciBEb20wLCBmb3IgRG9tVXMgdGhlIGRvbWFpbiB3aWxsIGxpa2VseSBuZWVk
IHRvIGJlDQo+PiArICAgICAgICAgICAgICAgICAqIGtpbGxlZCBpbiBvcmRlciB0byBhdm9pZCBs
ZWFraW5nIHN0YWxlIHAybSBtYXBwaW5ncyBvbg0KPj4gKyAgICAgICAgICAgICAgICAgKiBmYWls
dXJlLg0KPj4gKyAgICAgICAgICAgICAgICAgKi8NCj4+ICsgICAgICAgICAgICAgICAgdnBjaV9y
ZW1vdmVfZGV2aWNlKHBkZXYpOw0KPj4gKyAgICAgICAgfQ0KPj4gICAgICAgfQ0KPj4gICANCj4+
ICAgICAgIHJldHVybiBmYWxzZTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIGludCBfX2lu
aXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcmFuZ2VzZXQgKm1lbSwg
dWludDE2X3QgY21kKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBj
bWQpDQo+PiAgIHsNCj4+ICAgICAgIHN0cnVjdCBtYXBfZGF0YSBkYXRhID0geyAuZCA9IGQsIC5t
YXAgPSB0cnVlIH07DQo+PiAtICAgIGludCByYzsNCj4+ICsgICAgc3RydWN0IHZwY2lfaGVhZGVy
ICpoZWFkZXIgPSAmcGRldi0+dnBjaS0+aGVhZGVyOw0KPj4gKyAgICBpbnQgcmMgPSAwOw0KPj4g
KyAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsNCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJB
WV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVj
dCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICAgDQo+PiAtICAgIHdoaWxl
ICggKHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkg
PT0gLUVSRVNUQVJUICkNCj4+IC0gICAgICAgIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcygpOw0K
Pj4gLSAgICByYW5nZXNldF9kZXN0cm95KG1lbSk7DQo+PiArICAgICAgICBpZiAoICFiYXItPm1l
bSApDQo+PiArICAgICAgICAgICAgY29udGludWU7DQo+PiArDQo+PiArICAgICAgICB3aGlsZSAo
IChyYyA9IHJhbmdlc2V0X2NvbnN1bWVfcmFuZ2VzKGJhci0+bWVtLCBtYXBfcmFuZ2UsDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZkYXRhKSkgPT0g
LUVSRVNUQVJUICkNCj4+ICsgICAgICAgICAgICBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsN
Cj4+ICsgICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3koYmFyLT5tZW0pOw0KPj4gKyAgICAgICAgYmFy
LT5tZW0gPSBOVUxMOw0KPj4gKyAgICB9DQo+PiAgICAgICBpZiAoICFyYyApDQo+PiAgICAgICAg
ICAgbW9kaWZ5X2RlY29kaW5nKHBkZXYsIGNtZCwgZmFsc2UpOw0KPj4gICANCj4+IEBAIC0xODEs
NyArMjA3LDcgQEAgc3RhdGljIGludCBfX2luaXQgYXBwbHlfbWFwKHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICB9DQo+PiAgIA0KPj4gICBzdGF0aWMg
dm9pZCBkZWZlcl9tYXAoc3RydWN0IGRvbWFpbiAqZCwgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+
PiAtICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCByYW5nZXNldCAqbWVtLCB1aW50MTZfdCBj
bWQsIGJvb2wgcm9tX29ubHkpDQo+PiArICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGNt
ZCwgYm9vbCByb21fb25seSwgdWludDhfdCBudW1fbWVtX3JhbmdlcykNCj4gTGlrZSBtZW50aW9u
ZWQgYmVsb3csIEkgZG9uJ3QgdGhpbmsgeW91IG5lZWQgdG8gcGFzcyB0aGUgbnVtYmVyIG9mDQo+
IEJBUnMgdGhhdCBuZWVkIG1hcHBpbmcgY2hhbmdlcy4gSWZmIHRoYXQncyBzdHJpY3RseSBuZWVk
ZWQsIGl0IHNob3VsZA0KPiBiZSBhbiB1bnNpZ25lZCBpbnQuDQpib29sIG1hcF9wZW5kaW5nIDox
IHdvcmtzIGdyZWF0DQo+DQo+PiAgIHsNCj4+ICAgICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3Vy
cmVudDsNCj4+ICAgDQo+PiBAQCAtMTkyLDkgKzIxOCw5IEBAIHN0YXRpYyB2b2lkIGRlZmVyX21h
cChzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwNCj4+ICAgICAgICAqIHN0
YXJ0ZWQgZm9yIHRoZSBzYW1lIGRldmljZSBpZiB0aGUgZG9tYWluIGlzIG5vdCB3ZWxsLWJlaGF2
ZWQuDQo+PiAgICAgICAgKi8NCj4+ICAgICAgIGN1cnItPnZwY2kucGRldiA9IHBkZXY7DQo+PiAt
ICAgIGN1cnItPnZwY2kubWVtID0gbWVtOw0KPj4gICAgICAgY3Vyci0+dnBjaS5jbWQgPSBjbWQ7
DQo+PiAgICAgICBjdXJyLT52cGNpLnJvbV9vbmx5ID0gcm9tX29ubHk7DQo+PiArICAgIGN1cnIt
PnZwY2kubnVtX21lbV9yYW5nZXMgPSBudW1fbWVtX3JhbmdlczsNCj4+ICAgICAgIC8qDQo+PiAg
ICAgICAgKiBSYWlzZSBhIHNjaGVkdWxlciBzb2Z0aXJxIGluIG9yZGVyIHRvIHByZXZlbnQgdGhl
IGd1ZXN0IGZyb20gcmVzdW1pbmcNCj4+ICAgICAgICAqIGV4ZWN1dGlvbiB3aXRoIHBlbmRpbmcg
bWFwcGluZyBvcGVyYXRpb25zLCB0byB0cmlnZ2VyIHRoZSBpbnZvY2F0aW9uDQo+PiBAQCAtMjA2
LDQyICsyMzIsNDcgQEAgc3RhdGljIHZvaWQgZGVmZXJfbWFwKHN0cnVjdCBkb21haW4gKmQsIHN0
cnVjdCBwY2lfZGV2ICpwZGV2LA0KPj4gICBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0
cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+PiAgIHsN
Cj4+ICAgICAgIHN0cnVjdCB2cGNpX2hlYWRlciAqaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRl
cjsNCj4+IC0gICAgc3RydWN0IHJhbmdlc2V0ICptZW0gPSByYW5nZXNldF9uZXcoTlVMTCwgTlVM
TCwgMCk7DQo+PiAgICAgICBzdHJ1Y3QgcGNpX2RldiAqdG1wLCAqZGV2ID0gTlVMTDsNCj4+ICAg
ICAgIGNvbnN0IHN0cnVjdCB2cGNpX21zaXggKm1zaXggPSBwZGV2LT52cGNpLT5tc2l4Ow0KPj4g
LSAgICB1bnNpZ25lZCBpbnQgaTsNCj4+ICsgICAgdW5zaWduZWQgaW50IGksIGo7DQo+PiAgICAg
ICBpbnQgcmM7DQo+PiAtDQo+PiAtICAgIGlmICggIW1lbSApDQo+PiAtICAgICAgICByZXR1cm4g
LUVOT01FTTsNCj4+ICsgICAgdWludDhfdCBudW1fbWVtX3JhbmdlczsNCj4+ICAgDQo+PiAgICAg
ICAvKg0KPj4gLSAgICAgKiBDcmVhdGUgYSByYW5nZXNldCB0aGF0IHJlcHJlc2VudHMgdGhlIGN1
cnJlbnQgZGV2aWNlIEJBUnMgbWVtb3J5IHJlZ2lvbg0KPj4gKyAgICAgKiBDcmVhdGUgYSByYW5n
ZXNldCBwZXIgQkFSIHRoYXQgcmVwcmVzZW50cyB0aGUgY3VycmVudCBkZXZpY2UgbWVtb3J5IHJl
Z2lvbg0KPj4gICAgICAgICogYW5kIGNvbXBhcmUgaXQgYWdhaW5zdCBhbGwgdGhlIGN1cnJlbnRs
eSBhY3RpdmUgQkFSIG1lbW9yeSByZWdpb25zLiBJZg0KPj4gICAgICAgICogYW4gb3ZlcmxhcCBp
cyBmb3VuZCwgc3VidHJhY3QgaXQgZnJvbSB0aGUgcmVnaW9uIHRvIGJlIG1hcHBlZC91bm1hcHBl
ZC4NCj4+ICAgICAgICAqDQo+PiAtICAgICAqIEZpcnN0IGZpbGwgdGhlIHJhbmdlc2V0IHdpdGgg
YWxsIHRoZSBCQVJzIG9mIHRoaXMgZGV2aWNlIG9yIHdpdGggdGhlIFJPTQ0KPj4gKyAgICAgKiBG
aXJzdCBmaWxsIHRoZSByYW5nZXNldHMgd2l0aCBhbGwgdGhlIEJBUnMgb2YgdGhpcyBkZXZpY2Ug
b3Igd2l0aCB0aGUgUk9NDQo+PiAgICAgICAgKiBCQVIgb25seSwgZGVwZW5kaW5nIG9uIHdoZXRo
ZXIgdGhlIGd1ZXN0IGlzIHRvZ2dsaW5nIHRoZSBtZW1vcnkgZGVjb2RlDQo+PiAgICAgICAgKiBi
aXQgb2YgdGhlIGNvbW1hbmQgcmVnaXN0ZXIsIG9yIHRoZSBlbmFibGUgYml0IG9mIHRoZSBST00g
QkFSIHJlZ2lzdGVyLg0KPj4gICAgICAgICovDQo+PiAgICAgICBmb3IgKCBpID0gMDsgaSA8IEFS
UkFZX1NJWkUoaGVhZGVyLT5iYXJzKTsgaSsrICkNCj4+ICAgICAgIHsNCj4+IC0gICAgICAgIGNv
bnN0IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICsgICAgICAg
IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICAgICAgICAgICB1
bnNpZ25lZCBsb25nIHN0YXJ0ID0gUEZOX0RPV04oYmFyLT5hZGRyKTsNCj4+ICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGVuZCA9IFBGTl9ET1dOKGJhci0+YWRkciArIGJhci0+c2l6ZSAtIDEpOw0K
Pj4gICANCj4+ICsgICAgICAgIGJhci0+bWVtID0gTlVMTDsNCj4gV2h5IGRvIHlvdSBuZWVkIHRv
IHNldCBtZW0gdG8gTlVMTCBoZXJlPyBJIHRoaW5rIHdlIHNob3VsZCBpbnN0ZWFkDQo+IGFzc2Vy
dCB0aGF0IGJhci0+bWVtID09IE5VTEwgaGVyZS4NCkkgd2lsbCBwdXQgYW4gQVNTRVJUIGhlcmUN
Cj4NCj4+ICsNCj4+ICAgICAgICAgICBpZiAoICFNQVBQQUJMRV9CQVIoYmFyKSB8fA0KPj4gICAg
ICAgICAgICAgICAgKHJvbV9vbmx5ID8gYmFyLT50eXBlICE9IFZQQ0lfQkFSX1JPTQ0KPj4gICAg
ICAgICAgICAgICAgICAgICAgICAgIDogKGJhci0+dHlwZSA9PSBWUENJX0JBUl9ST00gJiYgIWhl
YWRlci0+cm9tX2VuYWJsZWQpKSApDQo+PiAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gICAN
Cj4+IC0gICAgICAgIHJjID0gcmFuZ2VzZXRfYWRkX3JhbmdlKG1lbSwgc3RhcnQsIGVuZCk7DQo+
PiArICAgICAgICBiYXItPm1lbSA9IHJhbmdlc2V0X25ldyhOVUxMLCBOVUxMLCAwKTsNCj4+ICsg
ICAgICAgIGlmICggIWJhci0+bWVtICkNCj4+ICsgICAgICAgIHsNCj4+ICsgICAgICAgICAgICBy
YyA9IC1FTk9NRU07DQo+PiArICAgICAgICAgICAgZ290byBmYWlsOw0KPj4gKyAgICAgICAgfQ0K
Pj4gKw0KPj4gKyAgICAgICAgcmMgPSByYW5nZXNldF9hZGRfcmFuZ2UoYmFyLT5tZW0sIHN0YXJ0
LCBlbmQpOw0KPj4gICAgICAgICAgIGlmICggcmMgKQ0KPj4gICAgICAgICAgIHsNCj4+ICAgICAg
ICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIkZhaWxlZCB0byBhZGQgWyVseCwgJWx4
XTogJWRcbiIsDQo+PiAgICAgICAgICAgICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7DQo+PiAt
ICAgICAgICAgICAgcmFuZ2VzZXRfZGVzdHJveShtZW0pOw0KPj4gLSAgICAgICAgICAgIHJldHVy
biByYzsNCj4+ICsgICAgICAgICAgICBnb3RvIGZhaWw7DQo+PiAgICAgICAgICAgfQ0KPj4gICAg
ICAgfQ0KPj4gICANCj4+IEBAIC0yNTIsMTQgKzI4MywyMSBAQCBzdGF0aWMgaW50IG1vZGlmeV9i
YXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29u
bHkpDQo+PiAgICAgICAgICAgdW5zaWduZWQgbG9uZyBlbmQgPSBQRk5fRE9XTih2bXNpeF90YWJs
ZV9hZGRyKHBkZXYtPnZwY2ksIGkpICsNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZtc2l4X3RhYmxlX3NpemUocGRldi0+dnBjaSwgaSkgLSAxKTsNCj4+ICAgDQo+
PiAtICAgICAgICByYyA9IHJhbmdlc2V0X3JlbW92ZV9yYW5nZShtZW0sIHN0YXJ0LCBlbmQpOw0K
Pj4gLSAgICAgICAgaWYgKCByYyApDQo+PiArICAgICAgICBmb3IgKCBqID0gMDsgaiA8IEFSUkFZ
X1NJWkUoaGVhZGVyLT5iYXJzKTsgaisrICkNCj4+ICAgICAgICAgICB7DQo+PiAtICAgICAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcNCj4+IC0gICAgICAgICAgICAgICAgICAgIkZhaWxl
ZCB0byByZW1vdmUgTVNJWCB0YWJsZSBbJWx4LCAlbHhdOiAlZFxuIiwNCj4+IC0gICAgICAgICAg
ICAgICAgICAgc3RhcnQsIGVuZCwgcmMpOw0KPj4gLSAgICAgICAgICAgIHJhbmdlc2V0X2Rlc3Ry
b3kobWVtKTsNCj4+IC0gICAgICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICAgICAgY29u
c3Qgc3RydWN0IHZwY2lfYmFyICpiYXIgPSAmaGVhZGVyLT5iYXJzW2pdOw0KPj4gKw0KPj4gKyAg
ICAgICAgICAgIGlmICggIWJhci0+bWVtICkNCj4+ICsgICAgICAgICAgICAgICAgY29udGludWU7
DQo+PiArDQo+PiArICAgICAgICAgICAgcmMgPSByYW5nZXNldF9yZW1vdmVfcmFuZ2UoYmFyLT5t
ZW0sIHN0YXJ0LCBlbmQpOw0KPj4gKyAgICAgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAg
ICAgIHsNCj4+ICsgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICJGYWlsZWQgdG8gcmVtb3ZlIE1TSVggdGFibGUgWyVseCwg
JWx4XTogJWRcbiIsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7
DQo+PiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICsgICAgICAgICAgICB9DQo+PiAg
ICAgICAgICAgfQ0KPj4gICAgICAgfQ0KPj4gICANCj4+IEBAIC0yOTEsNyArMzI5LDggQEAgc3Rh
dGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2X3Qg
Y21kLCBib29sIHJvbV9vbmx5KQ0KPj4gICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0
ID0gUEZOX0RPV04oYmFyLT5hZGRyKTsNCj4+ICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBl
bmQgPSBQRk5fRE9XTihiYXItPmFkZHIgKyBiYXItPnNpemUgLSAxKTsNCj4+ICAgDQo+PiAtICAg
ICAgICAgICAgaWYgKCAhYmFyLT5lbmFibGVkIHx8ICFyYW5nZXNldF9vdmVybGFwc19yYW5nZSht
ZW0sIHN0YXJ0LCBlbmQpIHx8DQo+PiArICAgICAgICAgICAgaWYgKCAhYmFyLT5lbmFibGVkIHx8
DQo+PiArICAgICAgICAgICAgICAgICAhcmFuZ2VzZXRfb3ZlcmxhcHNfcmFuZ2UoYmFyLT5tZW0s
IHN0YXJ0LCBlbmQpIHx8DQo+PiAgICAgICAgICAgICAgICAgICAgLyoNCj4+ICAgICAgICAgICAg
ICAgICAgICAgKiBJZiBvbmx5IHRoZSBST00gZW5hYmxlIGJpdCBpcyB0b2dnbGVkIGNoZWNrIGFn
YWluc3Qgb3RoZXINCj4+ICAgICAgICAgICAgICAgICAgICAgKiBCQVJzIGluIHRoZSBzYW1lIGRl
dmljZSBmb3Igb3ZlcmxhcHMsIGJ1dCBub3QgYWdhaW5zdCB0aGUNCj4+IEBAIC0zMDAsMTMgKzMz
OSwxMiBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+PiAgICAgICAgICAgICAgICAgICAgKHJv
bV9vbmx5ICYmIHRtcCA9PSBwZGV2ICYmIGJhci0+dHlwZSA9PSBWUENJX0JBUl9ST00pICkNCj4+
ICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gICANCj4+IC0gICAgICAgICAgICByYyA9
IHJhbmdlc2V0X3JlbW92ZV9yYW5nZShtZW0sIHN0YXJ0LCBlbmQpOw0KPj4gKyAgICAgICAgICAg
IHJjID0gcmFuZ2VzZXRfcmVtb3ZlX3JhbmdlKGJhci0+bWVtLCBzdGFydCwgZW5kKTsNCj4+ICAg
ICAgICAgICAgICAgaWYgKCByYyApDQo+PiAgICAgICAgICAgICAgIHsNCj4+ICAgICAgICAgICAg
ICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJGYWlsZWQgdG8gcmVtb3ZlIFslbHgsICVs
eF06ICVkXG4iLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXJ0LCBlbmQsIHJjKTsN
Cj4+IC0gICAgICAgICAgICAgICAgcmFuZ2VzZXRfZGVzdHJveShtZW0pOw0KPj4gLSAgICAgICAg
ICAgICAgICByZXR1cm4gcmM7DQo+PiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbDsNCj4+ICAg
ICAgICAgICAgICAgfQ0KPj4gICAgICAgICAgIH0NCj4+ICAgICAgIH0NCj4+IEBAIC0zMjQsMTIg
KzM2Miw0MiBAQCBzdGF0aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpw
ZGV2LCB1aW50MTZfdCBjbWQsIGJvb2wgcm9tX29ubHkpDQo+PiAgICAgICAgICAgICogd2lsbCBh
bHdheXMgYmUgdG8gZXN0YWJsaXNoIG1hcHBpbmdzIGFuZCBwcm9jZXNzIGFsbCB0aGUgQkFScy4N
Cj4+ICAgICAgICAgICAgKi8NCj4+ICAgICAgICAgICBBU1NFUlQoKGNtZCAmIFBDSV9DT01NQU5E
X01FTU9SWSkgJiYgIXJvbV9vbmx5KTsNCj4+IC0gICAgICAgIHJldHVybiBhcHBseV9tYXAocGRl
di0+ZG9tYWluLCBwZGV2LCBtZW0sIGNtZCk7DQo+PiArICAgICAgICByZXR1cm4gYXBwbHlfbWFw
KHBkZXYtPmRvbWFpbiwgcGRldiwgY21kKTsNCj4+ICAgICAgIH0NCj4+ICAgDQo+PiAtICAgIGRl
ZmVyX21hcChkZXYtPmRvbWFpbiwgZGV2LCBtZW0sIGNtZCwgcm9tX29ubHkpOw0KPj4gKyAgICAv
KiBGaW5kIG91dCBob3cgbWFueSBtZW1vcnkgcmFuZ2VzIGhhcyBsZWZ0IGFmdGVyIE1TSSBhbmQg
b3ZlcmxhcHMuICovDQo+PiArICAgIG51bV9tZW1fcmFuZ2VzID0gMDsNCj4+ICsgICAgZm9yICgg
aSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+PiArICAgIHsNCj4+
ICsgICAgICAgIHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4gVGhl
cmUncyBubyBuZWVkIHRvIGRlY2xhcmUgdGhpcyBsb2NhbCB2YXJpYWJsZSBBRkFJQ1QsIGp1c3Qg
dXNlDQo+IGhlYWRlci0+YmFyc1tpXS5tZW0uDQpPaw0KPiAgIEluIGFueSBjYXNlIHRoaXMgaXMg
bGlrZWx5IHRvIGdvIGF3YXkgaWYgeW91DQo+IGZvbGxvdyBteSByZWNvbW1lbmRhdGlvbiBiZWxv
dyB0byBqdXN0IGNhbGwgZGVmZXJfbWFwIHVuY29uZGl0aW9uYWxseQ0KPiBsaWtlIGl0J3MgY3Vy
cmVudGx5IGRvbmUuDQpQbGVhc2Ugc2VlIGJlbG93DQo+PiArDQo+PiArICAgICAgICBpZiAoICFy
YW5nZXNldF9pc19lbXB0eShiYXItPm1lbSkgKQ0KPj4gKyAgICAgICAgICAgIG51bV9tZW1fcmFu
Z2VzKys7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgLyoNCj4+ICsgICAgICogVGhlcmUgYXJl
IGNhc2VzIHdoZW4gUENJIGRldmljZSwgcm9vdCBwb3J0IGZvciBleGFtcGxlLCBoYXMgbmVpdGhl
cg0KPj4gKyAgICAgKiBtZW1vcnkgc3BhY2Ugbm9yIElPLiBJbiB0aGlzIGNhc2UgUENJIGNvbW1h
bmQgcmVnaXN0ZXIgd3JpdGUgaXMNCj4+ICsgICAgICogbWlzc2VkIHJlc3VsdGluZyBpbiB0aGUg
dW5kZXJseWluZyBQQ0kgZGV2aWNlIG5vdCBmdW5jdGlvbmFsLCBzbzoNCj4+ICsgICAgICogICAt
IGlmIHRoZXJlIGFyZSBubyByZWdpb25zIHdyaXRlIHRoZSBjb21tYW5kIHJlZ2lzdGVyIG5vdw0K
Pj4gKyAgICAgKiAgIC0gaWYgdGhlcmUgYXJlIHJlZ2lvbnMgdGhlbiBkZWZlciB3b3JrIGFuZCB3
cml0ZSBsYXRlciBvbg0KPj4gKyAgICAgKi8NCj4+ICsgICAgaWYgKCAhbnVtX21lbV9yYW5nZXMg
KQ0KPj4gKyAgICAgICAgcGNpX2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwg
Y21kKTsNCj4gSSB0aGluayB0aGlzIGlzIHdyb25nLCBhcyBub3QgY2FsbGluZyBkZWZlcl9tYXAg
d2lsbCBwcmV2ZW50IHRoZQ0KPiByYW5nZXNldHMgKGJhcltpXS0+bWVtKSBmcm9tIGJlaW5nIGRl
c3Ryb3llZCwgc28gd2UgYXJlIGVmZmVjdGl2ZWx5DQo+IGxlYWtpbmcgbWVtb3J5Lg0KTm90IHJl
YWxseS4gQXMgaW4gY2FzZSBvZiBudW1fbWVtX3JhbmdlcyA9PSAwIHRoZXJlIGFyZSBubyByYW5n
ZXNldHMNCnRvIGZyZWUgYXMgbm9uZSB3YXMgYWxsb2NhdGVkDQo+DQo+IFlvdSBuZWVkIHRvIHRh
a2UgYSBwYXRoIHNpbWlsYXIgdG8gdGhlIGZhaWx1cmUgb25lIGluIGNhc2UgdGhlcmUgYXJlDQo+
IG5vIG1hcHBpbmdzIHBlbmRpbmcsIG9yIGV2ZW4gYmV0dGVyIGp1c3QgY2FsbCBkZWZlcl9tYXAg
YW55d2F5IGFuZCBsZXQNCj4gaXQgZG8gaXQncyB0aGluZywgaXQgc2hvdWxkIGJlIGNhcGFibGUg
b2YgaGFuZGxpbmcgZW1wdHkgcmFuZ2VzZXRzDQo+IGp1c3QgZmluZS4gVGhhdCdzIGhvdyBpdCdz
IGN1cnJlbnRseSBkb25lLg0KU28sIEkgdGhpbmsgdGhpcyBpcyBzdGlsbCB2YWxpZCB0byBicmVh
ayBlYXJseSBhbmQgZG8gbm90IGdvIHdpdGggZGVmZXJfbWFwDQo+DQo+PiArICAgIGVsc2UNCj4+
ICsgICAgICAgIGRlZmVyX21hcChkZXYtPmRvbWFpbiwgZGV2LCBjbWQsIHJvbV9vbmx5LCBudW1f
bWVtX3Jhbmdlcyk7DQo+PiAgIA0KPj4gICAgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArZmFpbDoN
Cj4gV2UgdXN1YWxseSBhc2sgbGFiZWxzIHRvIGJlIGluZGVudGVkIHdpdGggb25lIHNwYWNlLg0K
U3VyZS4gSSBhbSBjb25mdXNlZCBhIGJpdDogdGhlcmUgaXMgbm8gd29yZCBmb3IgdGhhdCBpbiB0
aGUgY29kaW5nDQpzdHlsZSBhbmQgdGhlIHNvdXJjZXMgdXNlIGxhYmVscyB3aXRoIGFuZCB3aXRo
b3V0IHRoZSBzcGFjZS4NCj4NCj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGhl
YWRlci0+YmFycyk7IGkrKyApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIHN0cnVjdCB2cGNpX2Jh
ciAqYmFyID0gJmhlYWRlci0+YmFyc1tpXTsNCj4+ICsNCj4+ICsgICAgICAgIHJhbmdlc2V0X2Rl
c3Ryb3koYmFyLT5tZW0pOw0KPj4gKyAgICAgICAgYmFyLT5tZW0gPSBOVUxMOw0KPj4gKyAgICB9
DQo+PiArICAgIHJldHVybiByYzsNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGljIHZvaWQgY21k
X3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQgcmVnLA0KPj4g
ZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBj
aS5oDQo+PiBpbmRleCBhMDMyMGIyMmNiMzYuLjM1MmUwMmQwMTA2ZCAxMDA2NDQNCj4+IC0tLSBh
L3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgN
Cj4+IEBAIC04MCw2ICs4MCw3IEBAIHN0cnVjdCB2cGNpIHsNCj4+ICAgICAgICAgICAgICAgLyog
R3Vlc3QgdmlldyBvZiB0aGUgQkFSLiAqLw0KPj4gICAgICAgICAgICAgICB1aW50NjRfdCBndWVz
dF9hZGRyOw0KPj4gICAgICAgICAgICAgICB1aW50NjRfdCBzaXplOw0KPj4gKyAgICAgICAgICAg
IHN0cnVjdCByYW5nZXNldCAqbWVtOw0KPj4gICAgICAgICAgICAgICBlbnVtIHsNCj4+ICAgICAg
ICAgICAgICAgICAgIFZQQ0lfQkFSX0VNUFRZLA0KPj4gICAgICAgICAgICAgICAgICAgVlBDSV9C
QVJfSU8sDQo+PiBAQCAtMTU0LDkgKzE1NSw5IEBAIHN0cnVjdCB2cGNpIHsNCj4+ICAgDQo+PiAg
IHN0cnVjdCB2cGNpX3ZjcHUgew0KPj4gICAgICAgLyogUGVyLXZjcHUgc3RydWN0dXJlIHRvIHN0
b3JlIHN0YXRlIHdoaWxlIHt1bn1tYXBwaW5nIG9mIFBDSSBCQVJzLiAqLw0KPj4gLSAgICBzdHJ1
Y3QgcmFuZ2VzZXQgKm1lbTsNCj4+ICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4gICAg
ICAgdWludDE2X3QgY21kOw0KPj4gKyAgICB1aW50OF90IG51bV9tZW1fcmFuZ2VzOw0KPiBBRkFJ
Q1QgVGhpcyBjb3VsZCBiZSBhIHNpbXBsZSBib29sOg0KPg0KPiBib29sIG1hcF9wZW5kaW5nIDog
MTsNCj4NCj4gQXMgdGhlcmUncyBubyBzdHJpY3QgbmVlZCB0byBrbm93IGhvdyBtYW55IEJBUnMg
aGF2ZSBwZW5kaW5nIG1hcHBpbmdzLg0KVGhpcyBpcyB0cnVlDQo+DQo+IFRoYW5rcywgUm9nZXIu
DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

