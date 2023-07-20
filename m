Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F32A75A371
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 02:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566254.884841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb3-0001Zl-4i; Thu, 20 Jul 2023 00:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566254.884841; Thu, 20 Jul 2023 00:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMHb2-0001Yc-Sl; Thu, 20 Jul 2023 00:32:44 +0000
Received: by outflank-mailman (input) for mailman id 566254;
 Thu, 20 Jul 2023 00:32:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5z78=DG=epam.com=prvs=156527e6f7=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qMHb0-0001JN-Ok
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 00:32:42 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed2a2834-2694-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 02:32:38 +0200 (CEST)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36JMeiB3017190; Thu, 20 Jul 2023 00:32:36 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rxgyx9k43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Jul 2023 00:32:36 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB7783.eurprd03.prod.outlook.com (2603:10a6:20b:407::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.33; Thu, 20 Jul
 2023 00:32:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6588.035; Thu, 20 Jul 2023
 00:32:32 +0000
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
X-Inumbo-ID: ed2a2834-2694-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=geA3nPDtFETcaj7QB62wA2L8PvdYFtir95WHhhHCjM2J8p1+pIz7CEx4pAHjtCP2X1O1eXAyMevTYCAk2iA+05YMXCKfMKbDQK5gTExYv4+xw79J4Lx22UdlUx3cjy6AKUqzEQ+hC5ByBkLKAFSXv9OmmIE4PjnWsZL3ZE7Iwy0Dk1bpE1Td8X6o13pE8y3YCK7s6LsumslZhvwmXtN6HbKYz5eGSR+3t5IAY1XeZn2NjtisBj85dOGZbXIjMigYiNXfidY6BhNRvCKkaMImeD/iUCwiGxY4pNzRzByitZARRdo/2aSfxLLK4Ub5laqqfOdeidQRn69ma493hpPU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Unt8egmRvwPUu0glZoccRX4BB5aszaqAV25MRw9Jz1w=;
 b=RFFhrRn6a0MspLZ82RZVpuMhd3S+pTc/hUCtnOqx3xLsMExRhWIcS7AekH6O/djArhQodEMx7GEs84A1EN8Z/sYQP0XmVjU2exzsoaZu2+alXB2DYboZ66kPFiKbeU+QgvxqhSDtFDlp749HF+mY1OBHNWeYhs/VdiiNAE5l+E1w+Ttz2hPluvn61J3ISVW76WOFSYXQmnaYvvoMRPbnbrogCg5eCPI908sgzEa8J62BQaG0YB4vpRvvGq43nqg0BO0GsTJRsBzNRh+XMB0AjGezTjKGOzIIaHPPycdhuKAvp/taEh9MqriuluwvZwSqZY/iZox/cbZhvcecagU/Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Unt8egmRvwPUu0glZoccRX4BB5aszaqAV25MRw9Jz1w=;
 b=TmJVbu0/5GJJnLw579OMEjN4V8+nQAmdstF96gdQFjdLHX/U4XQu8wBviwSZoWFx3BDARylSDcokkIXbr9ohQZ/VVBgzeaZdv29I5xUHBPw2KbXorQ63kp6geKoSdbULs0lZSzWAvOgZJx09DDH0pcazW7PHcYeDmstt52VeoDCQjVpCEgbR1DYOPa6nIPexiGaoZWIeaNA5GfMULb7LbeGg/3YHhsTBtnJ7VEFlQ0RZy87t7UpLbjOod6BGmGCAFJN0/LiT+FRrCTdpNTLlvMDoq+gijiP3S8T3kjbM+VuOz+Rfys0ceKl9GK2IEK5qNAaDHuIt/2rKqVDQp37eeA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: [PATCH v8 03/13] vpci: restrict unhandled read/write operations for
 guests
Thread-Topic: [PATCH v8 03/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHZuqGrmAJWEwjbUkyUjUzRXQkJ0A==
Date: Thu, 20 Jul 2023 00:32:31 +0000
Message-ID: <20230720003205.1828537-4-volodymyr_babchuk@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB7783:EE_
x-ms-office365-filtering-correlation-id: 079fc536-4bd1-462a-cae4-08db88b8cec1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YliDazfML/9kzzPYPHo1POb0eObPftuP504X69jE80TnIcyZBqPsLmGon9O1mf+8ZX6q8luDZqtKuQzNfTSRmqbGnnkQvaoUqC87UBfr0ZBfoLYavFPJJao4curMIVYnwJs8xpVkmZ/RzU8LXzhyrXhyklq1LVqpN5il7cwIs2BOcwVASlCIybe6LXzd8xynvhOWFZmF58lThOHiKZZJV8gqj1UoiSJJaIjSv7cIukpX/GqEqZQYAR8V9UoDpsQts3bDNwbayWVINnIfIUHXzquuKBFN6dcYWdrFC5hWHYr0idhNFrWqIhbZsnqWM8LlenhZfcdWh58DORMMiXOMw2BGs5t/sguk2AkRGNZZxAE8c9Ta0AJjuFwd2ipnvxeeAauv1U8Q4ZOUyUXN/GvDvksmfcJv1xJVsFHIdpTSQEXX5LQ5828U6KrEfyh8Mnq1R3uAg0sNCGavWsgkD6zCTk6pqc1xWag/ESubdhNy3UjnE1xVtULlRYN6rZJuufSvfMKfDFbtM0LOg7lOYApXLH25IN5wuHwu0XsAHexnzjS0TZHzKMv2pPln17VM4N9coE/bQX+ess93q+LHXglTUnfRPYbrl2D4sejR3Ajnx/zWfvOVyjnKIS7Zjm9HmE7q
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(366004)(396003)(376002)(451199021)(55236004)(26005)(1076003)(6506007)(41300700001)(316002)(83380400001)(2616005)(186003)(6512007)(6486002)(122000001)(478600001)(66946007)(54906003)(71200400001)(4326008)(64756008)(38070700005)(66556008)(76116006)(66476007)(91956017)(6916009)(38100700002)(86362001)(5660300002)(66446008)(8936002)(8676002)(36756003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UFlHeUJRb2dSMzhkYkRzalJJUWsyZkJwWk41Q0IzYm1jM2w3SlBVNnhyOVo1?=
 =?utf-8?B?YnUvUU54K095NE5RVVB0d1ZNeHpPRFJYVTVXcSthRzEydWhIWSt4QWJuV25J?=
 =?utf-8?B?QS9YWWcraU8vVEtCeDUrdGwrVDA1TEhiRXdmbmN4YVdzY3g5WFZ4UzFGZHg2?=
 =?utf-8?B?VGk4N3lySExBek9VVE1BaHpBeWQyWURWSlhUdm03dFRZWTlwSHF3eXlpUzda?=
 =?utf-8?B?NDdSZnowUnY5cUR0MzVSa2lCOVFPRVI5eGROWDBqaHoxR2xXbkhJaWd2Y0Z0?=
 =?utf-8?B?SVNOZTZpR1owYUdSOVVWQVI5YlRaaUVYSGxuM3pwSC8xVE15TE54VW03OG5v?=
 =?utf-8?B?MDdSMzdGQjRxMGhRQStOaURHbXg0SHk5MHZKVWFoZmFiK2xZSW5yODIwbHRU?=
 =?utf-8?B?TWN3dHJaeVdsRUhaNHlZc0dnNjZkaXF6WjVwN25kajhwRWtGcXF1S216K3Rp?=
 =?utf-8?B?bDNqOCtud0IvMEtUQVpoZHpKWTFvZ2NGUk9WZ1gva1ZyaDJVVEQxSHVud2Ju?=
 =?utf-8?B?M1V1VXhFK2t6Nzc5eTBlQ1dxRGNDa2g3Tnd1YXJycFpTdzlDN3Bvd0lQZ2Ns?=
 =?utf-8?B?NHJvUnovVmtWd1NZdkU1d1JmTktqUCtFS2JrVFJqclpVQUdPcWlYSHRJU1FK?=
 =?utf-8?B?S1BocVRIMmNlTnJQbDVYVi9xYzZSME51dGpmTXBpeUlLWHNxWU92T01vRWdk?=
 =?utf-8?B?TGtnNVM4YXRiU2hhZHVBbWxQU016MVArQWhHZ0ZQTnBNeXdHa2M4cFhpbjhJ?=
 =?utf-8?B?ZU03ZXVHd0dKZ21ZdmRaZ0VZWTMwcElzRXN0ZjdiWlNSckxiTVg3KzI0T08x?=
 =?utf-8?B?L0hNampaZVlFM1FyNndPSzVUTTVPcWFJMnBZTU9ZcGthQ0cxclQ4S3VNVW94?=
 =?utf-8?B?YmVIVlNrSERFZHRNL2txc1hkalo3S2JsTjdSR01JRnJkeU5mbGJnZW1PRWc5?=
 =?utf-8?B?aWFPVTQzN1UyclJMbGFhLzE3N2MwdzFJN0Q2Vlo0dkZjSE5tc1crQWwva1FE?=
 =?utf-8?B?Q0tUUXFKSStBbXZqeHREcEIxOEhxYUVZUmVRRXpacUJ6ZVVGUVhCSzdCTnFW?=
 =?utf-8?B?b2k4cWx6RWxVdUZ4V1hLNjhNSGtXempDbzVPSXVJeWI4TFlGcGRGQmh1bFEz?=
 =?utf-8?B?UWxaUlpjWk1CNWFRTDE0aXFpcGRyK3ErWk4rY0lrZ3Y4TzhSTXdlSldLMUxU?=
 =?utf-8?B?Mk55VTBWQTR4NjFsNnZqY3B6eGtLaUpIVmV1OW44dmRiaWxaUFhrZXdxRTVQ?=
 =?utf-8?B?MmxHcVpFcFgrc0JITldVdm9qSUUwZzNOOGdNb3J0SkQ4bk1URzZYT0Y5QWdU?=
 =?utf-8?B?S2d3anFNck9tSy9icHlqbzZpZ3o1TWZ0Si9DSnFDNHdEUnN4d0hFYXE0bTND?=
 =?utf-8?B?eVA4MFRtb0MxSnhPNnAvbDdzR1RZSlZZbnptSGV5bHNWMjNMQzE5UzBSZ3RF?=
 =?utf-8?B?TFQ5bzNubkdrV1liMTlJVEZBMjFSUENyTjgybkNvZmN5aVdqMUFwbWRqNnVw?=
 =?utf-8?B?dEtyOWh4a0ZmRUFjRVNFTTUzeGR0Q2ZyanpZbFdPcjE0eE1VZjRKa1VXYjJ1?=
 =?utf-8?B?TEljd0lGRCtPdW1tVEp4QWNHd3pERDFUcGZXbjJxcEROSjlXVzNxYkJLaFli?=
 =?utf-8?B?aDF3VlM2cEVpUHBFejFZN2JKTW9GeCtFa3pOMGVXSm9qWUZFYitzQ2xDbEhw?=
 =?utf-8?B?Nzg3ZFBVazYvRzhEMWVSWEczQUxXdllNQzhvVmlLZnBEWmlnZW1sZWIrc0h0?=
 =?utf-8?B?Um5QeGE0ZmZyemI1WDV6RmNGczJ3Ky9ydllDZ0tIQzFMNlg0NXlkM29mTVhi?=
 =?utf-8?B?cmNMVmZtaEFvYnAyampyY2MrVkREMVE3eUFFN1BuQVpEZ3ZDMUUzWC9BN0E5?=
 =?utf-8?B?THlOeWFHZWVERE1YT29naFVNTXNFMW1CVUtId2NWMjF4b0hEQnc2WkRoY3lU?=
 =?utf-8?B?eGZ1cmw2blh5b1hYMnNmMDg1cXpyTHhwdFZoNXhqQ2Qxa2VPTHh0TXNiL1RO?=
 =?utf-8?B?ZVJMbUJ5SVJDZ2QxRHRnZ2w4aHVGOEJVYmlUOFIzTktWeEpuenRNMjdoWG16?=
 =?utf-8?B?OGZoZExreXJrSWhTQ0RaRldzbmNiZ0RSVGM5MFpveUxieUtZaVBxZ2tDNTF0?=
 =?utf-8?B?dmZvSTRKbDNuVHo3bmlITks1M1VMQmk4Yk9RMk9oTTF2QWFCSTNXK09zV0l0?=
 =?utf-8?B?VWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <513FB179A8D41C4180D34D81C8EA2D34@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 079fc536-4bd1-462a-cae4-08db88b8cec1
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 00:32:31.6418
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PMfP3jj2zbhu2X3oFr26LYJtxUYAs6EFDgJAURJWY2iAk93qvuH8CrFJU99K8IQAExkucqwW+DjgOAhjQLyPCABVWZg7KRFTSUGHJ2Cykc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7783
X-Proofpoint-ORIG-GUID: 1Ip4MEnJV-84fShS-NmeYKZyp_1jFr8g
X-Proofpoint-GUID: 1Ip4MEnJV-84fShS-NmeYKZyp_1jFr8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307200002

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
IGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCmluZGV4IGYyMmNiZjIxMTIuLmE2ZDJjZjg2NjAg
MTAwNjQ0DQotLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KKysrIGIveGVuL2RyaXZlcnMv
dnBjaS92cGNpLmMNCkBAIC0yMzMsNiArMjMzLDEwIEBAIHN0YXRpYyB1aW50MzJfdCB2cGNpX3Jl
YWRfaHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLA0KIHsNCiAgICAgdWludDMy
X3QgZGF0YTsNCiANCisgICAgLyogR3Vlc3QgZG9tYWlucyBhcmUgbm90IGFsbG93ZWQgdG8gcmVh
ZCByZWFsIGhhcmR3YXJlLiAqLw0KKyAgICBpZiAoICFpc19oYXJkd2FyZV9kb21haW4oY3VycmVu
dC0+ZG9tYWluKSApDQorICAgICAgICByZXR1cm4gfih1aW50MzJfdCkwOw0KKw0KICAgICBzd2l0
Y2ggKCBzaXplICkNCiAgICAgew0KICAgICBjYXNlIDQ6DQpAQCAtMjczLDkgKzI3NywxMyBAQCBz
dGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50
IHJlZywNCiAgICAgcmV0dXJuIGRhdGE7DQogfQ0KIA0KLXN0YXRpYyB2b2lkIHZwY2lfd3JpdGVf
aHcocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwN
Ci0gICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQzMl90IGRhdGEpDQorc3RhdGljIHZvaWQg
dnBjaV93cml0ZV9odyhwY2lfc2JkZl90IHNiZGYsIHVuc2lnbmVkIGludCByZWcsDQorICAgICAg
ICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgc2l6ZSwgdWludDMyX3QgZGF0YSkNCiB7
DQorICAgIC8qIEd1ZXN0IGRvbWFpbnMgYXJlIG5vdCBhbGxvd2VkIHRvIHdyaXRlIHJlYWwgaGFy
ZHdhcmUuICovDQorICAgIGlmICggIWlzX2hhcmR3YXJlX2RvbWFpbihjdXJyZW50LT5kb21haW4p
ICkNCisgICAgICAgIHJldHVybjsNCisNCiAgICAgc3dpdGNoICggc2l6ZSApDQogICAgIHsNCiAg
ICAgY2FzZSA0Og0KLS0gDQoyLjQxLjANCg==

