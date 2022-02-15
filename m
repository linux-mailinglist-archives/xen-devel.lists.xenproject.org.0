Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FFA4B6651
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:40:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272835.467807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtNQ-0004fb-Ap; Tue, 15 Feb 2022 08:40:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272835.467807; Tue, 15 Feb 2022 08:40:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtNQ-0004dl-7F; Tue, 15 Feb 2022 08:40:00 +0000
Received: by outflank-mailman (input) for mailman id 272835;
 Tue, 15 Feb 2022 08:39:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJtNO-0004df-HM
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:39:58 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0e68cc-8e3a-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 09:39:56 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F8dB8J009294;
 Tue, 15 Feb 2022 08:39:45 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e87n3ra77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 08:39:45 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB4272.eurprd03.prod.outlook.com (2603:10a6:803:5b::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 15 Feb
 2022 08:39:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:39:10 +0000
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
X-Inumbo-ID: da0e68cc-8e3a-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RitoJCT30OOU6dbbw/cVLY6gmnL8N23GOVmoxKORYdlVtJr7Gth4/wISZ+D8waSHuLh3DBCkrRVRUUdiwM4TE4wKV85APqsgjm1DxeumQjLca4+QFL3fvUozzyrppSEcQ201pnYu3XydHcqds4UJmw1axV1OwZb2nhAyO6Pe+qC5uoVIlzi89KBMjnWHiUsA7yvw19+77IpUWBEFoNiTAuOvQ7x16SSq5h6xVES3/TOz4CMlha7rf4vrqyJfUkd81NVfSOkTulHVt08RYD+W3vQ/khH2e/3dNZQkdQ7McEcV3NDtMimUW511G1xW3i/oMbAJ5/2MvBu2BxsQi43GwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGzOZK3P9jyQlgkJZoxGfV7/9NOsCNN2B0DcYqsZgPA=;
 b=EsCCn8zV4p3h/TkJEF28yuQa51tGKFLW+SqDCEBzCAcqLBeQSAh6RmyVukcIbcfWhLMIxssa9L7tTiU04RFX0Hqk98G8PMVSEqC4844DJ388z+whInotEiuO14HI9/wEIuqdVeZWNT5QNMglA3gaWefcWNLvKdsYdKd0DJ8HllZUAzCKAqmZl0+9uKJP882gS9sfcOWidJtgYKlxyrwHJ27Rg1wRKR2Qa/SmYnJR9YTcNyeaBKRu0Y+eQLQizLonKjJjGACC0mktEQbeOxj+2QPIc3nZZGksMFUlKjrUBKc76l2P+nimmSpq7fYACJBARL2+mzga0hmhnHoQ9gYbag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGzOZK3P9jyQlgkJZoxGfV7/9NOsCNN2B0DcYqsZgPA=;
 b=PosxUT+NqX3vBEt+csLFqtEH0Zx0UjUhZuJuN21HjgNqs9obODxeAkUFf1BM2QDefFbumJkNu6mji7dbc8PiWDNmrm0miLd2TrDeEQOG5lOMsSE5QZ3R2V4730GG4OErOVXn0NGU1Md03GNqRoWKNeBCJFZmi/6rrpP29D4o8bMAnQBJq77odsLUvfiynbhIh3V7Vfav2RgNwU2BYztFGyenX3ORDFWPowyVaWIPiX8jnA5Mom+PhGrQYzZhw4ME1+Vy4fK3ENUHU/Nlp/GskMBWKk17Gaz9ZNbw4BYYEYN6sRcx2/Pk+YrK0pFdsGLxbv2QiplSFfS5azDNi1qegQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMICAAALZgIAAAzmAgAAWXYCAAARtAIAAAoIAgAABpICAAAWvgIAAA2aAgAE2DQCAAAKFgA==
Date: Tue, 15 Feb 2022 08:39:09 +0000
Message-ID: <ec0c24f5-911b-e347-ba5b-6535e1f92aaa@epam.com>
References: <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
 <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
 <3538350c-0a63-59fb-7bba-fe460c0f1607@suse.com>
 <2a750ae8-9ca7-2e74-b878-11b98fcb4ca0@epam.com>
 <YgtkkAoYZ3MZsygD@Air-de-Roger>
In-Reply-To: <YgtkkAoYZ3MZsygD@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7e5936c-5e16-4791-c2a8-08d9f05ea2eb
x-ms-traffictypediagnostic: VI1PR03MB4272:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB427231E4272C59189835EFACE7349@VI1PR03MB4272.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mrviGQ0c4qg2ZWWsInIGNrdkOPDCqziSTi/sE8joFMVDo5iw6+oBgv4dxmFYnSUheOCds8EsxNDwFHuC8pRsN7kV0qi/wTiPDCr9/nwBpA6pFm/vyY1Y0/HjWsETJapkzRc46VeCoTeOB7kfm7vD99LFHbqs/EoSkgkFsQeFBNid/gF/fWHWl7i++riURiZgdGbcvmWJrkd0hUFf2UEkpNbWrUJ3dpTs7UsAyimUVcAqsSpVCH62TGw7BxeaLAigZcXBJNChiU4h6OsGo98sQrAPjJugSBZRMTivmSz7SWH9lwvtZcEaO57+RddVu548xuPQIfsmAL4Kp7twEjmfkRG98s8XDYnwg/wcH8NiKlYYEj227QE9jML/MJpFt2yJnFuRuK51XI3lcR0rdFOcnKPQttVusEItcGI8Xq0UaLdg2M1aT+H3xJvXT/oWqajWEaWIGcaUTGqO+cwMPtpg0t6uqLazVzPZKyYT2TTkzD/ujquCbk6QFSgu1vFt3fq8Z2UGTn7IHMx9aniZG8nn9GgJNA+SMUs6YaYGJV3PCVTBmS6J0rvF0TouPml2bkLQtqPMI3ep+FgImJk1FjKzvUATq8IQiyPsyfVsaRvyXtR/jVFSqdxatVgw7l7SroyABUC0PfJNt8XIXrJx5OEt+vaxT3BVFvs19S5KvrEcVWRTUqdrN+dyAGI8/KL2fIVmqEx7hBbMwMcbKBKMuXqBrkEp5XR4YzuzSgnjLFbMZaw=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(55236004)(38070700005)(53546011)(186003)(31696002)(2616005)(26005)(71200400001)(6506007)(6512007)(54906003)(508600001)(6916009)(86362001)(6486002)(316002)(66946007)(66556008)(4326008)(107886003)(76116006)(122000001)(83380400001)(38100700002)(8936002)(36756003)(31686004)(8676002)(2906002)(66476007)(66446008)(5660300002)(64756008)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cTdNUHBpVHpYL1duWG5IaDllTG5lcU0rRWR5MWdVRU5COGFHanNJejlpSXBM?=
 =?utf-8?B?MGo1dTYxc0dMVys1em9xTFQwVWJKMW1OcG11NWxmRDA2cGgrbkpSay9pQnhO?=
 =?utf-8?B?L205WkVYT0hyZENFNzJBcG9oUkZkeFFoUmdSTjlsNWZtMHM1L2ZCR3ZPRWw3?=
 =?utf-8?B?MjRsQTR1d0s0SG4wb1NZckVVQm1UTEJ1aGhONWd1ZHpUUE4rSGxBbDYyeVlM?=
 =?utf-8?B?MVczRzhzRW1rcXdhUWFYbExxVDJiWDB6UjQrblM0M2tIYWZSUFFZUkMrZDM5?=
 =?utf-8?B?emY5U3A4ckxVdkMyTWliT2FuS0VyaWRlT1B1Mm53blRYdTlEbXBoQkZHRXFL?=
 =?utf-8?B?UXpVZDBvSUlCWVkxQXdFN044SEVIVkpiTlYrT0QxYlU1TG1XY3FFZG1sbTVG?=
 =?utf-8?B?Wjh4Nyt0K09jcm54S2drRzcra1k5eE9TcCt4MG4xWkFqQWxLMVFpYzQzYzQx?=
 =?utf-8?B?TXV4ZDhQQTJ1WmFHSkcyVXVvVGhmWWtrRVpCM1k0TlI4c2Q2ZFp4Z1JSS2JK?=
 =?utf-8?B?SytCV3dPMnVmWW5VQm5ycHpleVJxbitTZWh2cUtHOHI2L1dsejd2eXhzd3Y2?=
 =?utf-8?B?SUVzUEY1OXlNdGI3MDBYMlVaajdBWGRhSDVXUW9TZVltQ0RCTk83cWtGdTRG?=
 =?utf-8?B?RDg4cmF0YlRZSHBZN2tTMlN3K09tS2QyRjArUHUxTzR5MXVsSnIwRkUyZFFh?=
 =?utf-8?B?SWRieitEMVd6UGV3V1FrTTJIZWtkWERuQWpDY0ZFWVh3MlhuWDBLUnpEMlFU?=
 =?utf-8?B?VEdCSFQ0NmVUVm5tcnc2TFFWQlhKamc1SzlDRytVUUNlTTZxTXZ1WURUSnRI?=
 =?utf-8?B?R1pJbGFYdEJRdytCNFRIcVpRdkx3Q2kvcjJJbm1tWGFpWU1RWVpBS0F0Mzlo?=
 =?utf-8?B?dG9BczFPbmRzRUEyd2JlSlVVZllvUDh4M1JVelZVakNpaWVGS251VE5WOVov?=
 =?utf-8?B?Z2ZBK0g2OHNJT1dzM2ZhSEJoM1V6SnROUzlSOEdtZ0hWVEczUU1jaW9KVldk?=
 =?utf-8?B?OTVIeU1NZG04S3llei9hMm1KSW50TGpYdEpsWW9lZjZBODNRN0pRQVRjVUdD?=
 =?utf-8?B?RmlQNGFZa3VoRFpEQm4wN054Y29LVGxjMXUyOGFXRTZNSGt3MTVPTjF0Wk9M?=
 =?utf-8?B?UE5QSGoxMlBaUVpYdmkrUERlaktTOHR6Mlp6eXI3L1VPb3k1TTZXaGpDbWo2?=
 =?utf-8?B?QXV5ZUVRemwyOExXM2VVQTQwcFRzUGxrdm5SY1YxcjlWV3dnT0tYRmlRTTBz?=
 =?utf-8?B?Y092dFhyZ2VIcHBCL3pzY0ExQVpCcHJZUHVITU00RUdxalVqSCtpNk9velNa?=
 =?utf-8?B?OEYyS1Bpb2xXajdqN3VJSmZxY0tBS0ErQ05VYWlYSGRkcVloUnF4d1ZwZm45?=
 =?utf-8?B?N1NQVWFiS2Jub3kybDdKUnZiYU9na2ZRdXo5VDJEam1OQjh3ZEFwd0FsWDdH?=
 =?utf-8?B?aDFGUE5IczFmSWpHZm1EYnMra0NpdlhwU0xNRkRJMGtrc20zZW9SNXBZVWFL?=
 =?utf-8?B?WVJibzZwOE5CR2krSmtNOGhNWDJUaWpsTjBXSmhFbG5jMkhDbEJwbjdEL2sv?=
 =?utf-8?B?SDJ3ME1Bd1ByenB2ZDUxbWFORk43UWxGRU1YaWNtOURrUlJUUWNkYzczdnpW?=
 =?utf-8?B?Y2tjK3FUcVF1L1haMmdXam5CT3kyN0l0ZlFlVklwejFOSG9UMVZDQitFb0xY?=
 =?utf-8?B?dllOM2pLNGYrTU1MUG9lL0JCaVVwNXF0Vjd5dnVCY0hYcXN2YkpzQzI5czVs?=
 =?utf-8?B?VjlsUzBGZ1hpNkx2UWZUeXlhL2doUEVFU2xYd1JhNHBHbzFxSm9lQmgzTFFN?=
 =?utf-8?B?U1JlYmlGMitsTXdvUElraTRLR0tIY3dsTWFoY1hyZXU2L2VPcGlYQklwRC92?=
 =?utf-8?B?VERhNk51ZlhTUHl3NU1XRHJDZGZPTkhqV1RMK1FTRW5YeVBYR29NR1FydjRV?=
 =?utf-8?B?elBTdlJBTDVQTktJWWZEcklVM24wOU1xT1V5d3pVbjQzdzE0SjZMNVpLVDJP?=
 =?utf-8?B?NENxcGZnVStES0lLZFRhMmZTU1BwYWdTL0MxU2V5dW5TeGFGS2h3L2diRGxp?=
 =?utf-8?B?N0ZiTXl2QmtYT3Z5Q1NWQVFTR3JLL0hHd0EyUDhrd2VxMEcrdlNBbVAxaG9U?=
 =?utf-8?B?U2N0MTdkcndiTVEzdTRIV3Z6MmNUL0JENUpQN1ZTd2p4ZEhuOTR5cG1ETFV6?=
 =?utf-8?B?RUIrS2tJakovaFBVWWd2RE1xQ3pFb0o0SGF6NUtqaVF2TXBDc3d1elNRTTc5?=
 =?utf-8?B?RzBEZyt4SHk3NkdxYVJPaS80Y0lBa0Nibllubyt5NmUvUmE5VmE5d0dxOHcr?=
 =?utf-8?B?eERhUnZEV2VaVEE5SXkyU1VWMURPVVhkTzdIQ0czOEZsb2V0RGNpUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AA01CB8AE28AF6418E04FD4AA5A44BEC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7e5936c-5e16-4791-c2a8-08d9f05ea2eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:39:09.9337
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGN3tqOQlhbHiUqVJ9ivKaJFXf34NlTjALo4j1XSdeUoZ2dQwu0X5btO+9XpBxs4yDA5EiazH5o/hHHSnKwnBqYpjH48IA4y3/SpfO0+1DoGOOZ2WI5qU3HnW3enIYIV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4272
X-Proofpoint-ORIG-GUID: asvTaAbnhKRBLkOY_tfghPfg6xu-rB3Z
X-Proofpoint-GUID: asvTaAbnhKRBLkOY_tfghPfg6xu-rB3Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_03,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=849 spamscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150049

DQoNCk9uIDE1LjAyLjIyIDEwOjMwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBNb24s
IEZlYiAxNCwgMjAyMiBhdCAwMjowMDoyNlBNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IC8qDQo+PiAqIEZJWE1FOiBhcHBseV9tYXAgaXMgY2FsbGVkIGZyb20gZG9t
MCBzcGVjaWZpYyBpbml0IGNvZGUgd2hlbg0KPj4gKiBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVf
YWN0aXZlLCBzbyB0aGVyZSBpcyBubyByYWNlIGNvbmRpdGlvbg0KPj4gKiBwb3NzaWJsZSBiZXR3
ZWVuIHRoaXMgY29kZSBhbmQgdnBjaV9wcm9jZXNzX3BlbmRpbmcuIFNvLCBuZWl0aGVyDQo+PiAq
IHZwY2lfcHJvY2Vzc19wZW5kaW5nIG1heSB0cnkgdG8gYWNxdWlyZSB0aGUgbG9jayBpbiByZWFk
IG1vZGUgYW5kDQo+PiAqIGFsc28gZGVzdHJveSBwZGV2LT52cGNpIGluIGl0cyBlcnJvciBwYXRo
IG5vciBwZGV2IG1heSBiZSBkaXNwb3NlZCB5ZXQuDQo+PiAqIFRoaXMgbWVhbnMgdGhhdCBpdCBp
cyBub3QgcmVxdWlyZWQgdG8gY2hlY2sgaWYgdGhlIHJlbGV2YW50IHBkZXYNCj4+ICogc3RpbGwg
ZXhpc3RzIGFmdGVyIHJlLWFjcXVpcmluZyB0aGUgbG9jay4NCj4gSSdtIG5vdCBzdXJlIHdoeSB5
b3UgbmVlZCB0byBtZW50aW9uIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGhlcmU6DQo+IGFwcGx5X21h
cCBhbmQgZGVmZXJfbWFwIGFyZSBtdXR1YWxseSBleGNsdXNpdmUsIHNvIGdpdmVuIHRoZSBjdXJy
ZW50DQo+IGNvZGUgaXQncyBpbXBvc3NpYmxlIHRvIGdldCBpbiBhIHNpdHVhdGlvbiB3aGVyZSBh
cHBseV9tYXAgaXMgY2FsbGVkDQo+IHdoaWxlIHRoZXJlJ3MgcGVuZGluZyB3b3JrIG9uIHRoZSB2
Q1BVIChpZTogdi0+dnBjaS5tZW0gIT0gTlVMTCkuDQo+DQo+IEFsc28gdGhlcmUncyBubyBuZWVk
IGZvciBhIEZJWE1FIHRhZzogdGhlIGN1cnJlbnQgYXBwcm9hY2ggZG9lc24ndA0KPiByZXF1aXJl
IGFueSBmaXhlcyB1bmxlc3Mgd2Ugc3RhcnQgdXNpbmcgYXBwbHlfbWFwIGluIGEgZGlmZmVyZW50
DQo+IGNvbnRleHQuDQo+DQo+IEhlbmNlIEkgdGhpbmsgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIGFs
b25nIHRoZSBsaW5lcyBvZjoNCj4NCj4gLyoNCj4gICAqIEl0J3Mgc2FmZSB0byBkcm9wIGFuZCBy
ZWFjcXVpcmUgdGhlIGxvY2sgaW4gdGhpcyBjb250ZXh0IHdpdGhvdXQNCj4gICAqIHJpc2tpbmcg
cGRldiBkaXNhcHBlYXJpbmcgYmVjYXVzZSBkZXZpY2VzIGNhbm5vdCBiZSByZW1vdmVkIHVudGls
IHRoZQ0KPiAgICogaW5pdGlhbCBkb21haW4gaGFzIGJlZW4gc3RhcnRlZC4NCj4gICAqLw0KVXJn
aCwgSSd2ZSBqdXN0IHNlbnQgdjIuIEknbGwgbW92ZSB0aGlzIHRoZXJlIGFuZCBhbnN3ZXINCj4N
Cj4gVGhhbmtzLCBSb2dlci4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

