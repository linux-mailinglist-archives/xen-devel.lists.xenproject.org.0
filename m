Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E110764323
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 02:58:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570756.892861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOpJT-0006zv-J1; Thu, 27 Jul 2023 00:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570756.892861; Thu, 27 Jul 2023 00:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOpJT-0006y1-G1; Thu, 27 Jul 2023 00:57:07 +0000
Received: by outflank-mailman (input) for mailman id 570756;
 Thu, 27 Jul 2023 00:57:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q9bz=DN=epam.com=prvs=1572de9637=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qOpJR-0006xv-7H
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 00:57:05 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f326619-2c18-11ee-b246-6b7b168915f2;
 Thu, 27 Jul 2023 02:57:03 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QGP4N6026454; Thu, 27 Jul 2023 00:57:00 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s2wtk3pyj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 00:57:00 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB8394.eurprd03.prod.outlook.com (2603:10a6:20b:526::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 00:56:55 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::68d2:d90f:ac32:7c85%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 00:56:55 +0000
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
X-Inumbo-ID: 7f326619-2c18-11ee-b246-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BChNfXacez+hg2QbzLtDisznDXr3obN5xDPQzc8MQd4OXIW9iwgoEcDvh6CTqgS5RCoZmmuvfO/lR2V5y7cG8edk1jD5Twy4aNBj08JvSNfcNPUtMaOg8esKl3aRjhulnsmcRqclGy8+pz132eGgxTnF9HdJutWMNWtUR7ZgFHoM4TLcdhfVk0M3Bsd8Sq+1TlZYm0bsecvGnGZnF3QVur3uxvemA/GZrnwipL2G2OZJdIi6EXGfAB7d8Fa0+PV+46OF116nacx7LuqdjBWtAX3CAJHGjLUQnk9mpFZz/altfof1P8waDEEF24MhBT+NMognKPNv9rmaU3h2RxkvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4zvYSg9XZJzXH2On3TfL2LgzVK+msbqdA11xLOM0gLQ=;
 b=Dn5OAMsfTe3V3wYcAgLqZ7NHH1n/bW+1y0QMdndmGZrZwXw9gCW94NWU8cNptUZdzrzQSqVlkULP+dY7OScK4iIRXkEKWV5Ns80hT0E24g/4FfF56CP4xb12sUZAdgy0d4BePqRYE2gQnOq3KMFUVqyGdiuv10iDOCbRQm/e0b2dlI5m0nxP14fSXagm9eHA5Ms018hZucb7GzYLhZOPSgYJaRn4Vntag4TXiZbrHwvwwnho4CcPcnXdAKUMTh7yhfN6voJ6qaS1t8+VQhCjVKOg0rvppSMD24wKVPWw7MxGLNKA/9rmVOEHC9/gy+sMevcffkvvuumtX/y3pT6P7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4zvYSg9XZJzXH2On3TfL2LgzVK+msbqdA11xLOM0gLQ=;
 b=GGq5a1C9hTZ9LA7tUQHpRd8IIGfWoEm9Oraq0+uA+1zzq/9V97zkXFPLJeRbd5xLzSjBn5Dzn40QKipvfz2IlSLOIq4/Ha6rutI/EkNvVT52jDVlW7AXVek6z/48qvCzaW0CWOLxg4TNM6/RQisTS/KDwXQm39D2uiYG7UE4f2m9/LMQUXROhX8PVjdZ1FnCyokQtIpO0IbtVH1HfXWa8HKesrYZIoT1WOPvhEGpTlEoNyXqJZGYIVN7t7qpYQxW3kyV0BijgiLq/xaKuzIAglnm7Wa02GIngACA7h4R9rWg/0a5glgPusE3+4q7Sam8qG7zk1bCk2TQOmWLiG9ZDw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>
Subject: Re: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Topic: [PATCH v8 02/13] vpci: use per-domain PCI lock to protect vpci
 structure
Thread-Index: AQHZuqGrLMJPz1ipBEu4urExXp8yi6/CgxUAgAWEoICAA8vwgIAA+VsA
Date: Thu, 27 Jul 2023 00:56:54 +0000
Message-ID: <87y1j2b296.fsf@epam.com>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-3-volodymyr_babchuk@epam.com>
 <ZLkYdhOPLTmogXGq@MacBook-Air-de-Roger.local> <87ila7cvy2.fsf@epam.com>
 <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
In-Reply-To: <ZMDox0WwumxMGnzV@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB8394:EE_
x-ms-office365-filtering-correlation-id: 55481ec9-3e0b-4cb1-4a3f-08db8e3c5f2b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uFd5f0VReXUD4c5Oorugtv8AA3jenA3rRwas33uAeDfROofkRylYbYBclLU9958bi1IVXoHs1O+gCFgn55eMPYvAKUWA73g3ugfy+gKbdj4apXtHtzrZ1ecLwlCHmx5nU5MzEu7OH00SvSfgNedCrzozYvR2oFAFWCcCUPTYMRYin+uY919/VXcN9kbNp2kDnkQS3yIV2zsXKUWPIyyzSX98alrp4ipRvqs49tkcgTINPbJAA6kuKAiE+1VjdfI6HuYo0y2yZo3lGwpA+si9XGAa+fvyDTR9Xup/Bcwl7sI3uY/cvQt4T0qsaKxSXP9nXKUB33qAfOU6MQCPvhBm+yr5CuNvjYLawxF3MgZhWd6yoZVdDN7ui5kiCJh3+P4zVbcfHwqga4hxwMnKXuxJ8X6gFnBw8httMU4Z1P5KzjYXbPKGoLtcp0u2KsvcDE21PRLTuZ6rYegLvI9w22N09y1eY57SiSOqrpZt60gv2HMGkDOa4YCdZCTLeR080wYq1FjRero1rsi8EVeogiPcN8GTLFLTCLWAF/NUOSi+MxXxeGOPVBqPXaQbBiAgi04+MsKY61M6Rk5f2Q1miapkUaPN/+xwEXYFAxMZmYz9sVhmgEQp3Q4/4RieeozRSWup
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(136003)(39860400002)(366004)(451199021)(26005)(2616005)(6506007)(71200400001)(55236004)(186003)(83380400001)(8676002)(64756008)(316002)(41300700001)(66446008)(76116006)(91956017)(6916009)(8936002)(66476007)(4326008)(66556008)(66946007)(5660300002)(6486002)(6512007)(478600001)(54906003)(2906002)(38100700002)(122000001)(36756003)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azRkeTlJYUN0MGVYdll0c3hIa0dmcVBEdFI4d2Zldmt4K0RvM0szYW9EOEVn?=
 =?utf-8?B?WnJ6R3k2R0tIck44VmUvRUVTdmM0Ni9LQkFlUXZwbGd3cENPRk1qOHRDZ3VE?=
 =?utf-8?B?U21PRWVCSy91TVN5NFVDbHpYTnhaakwzN3Yzb0ZEdU11a1pkS280VFVTUGQv?=
 =?utf-8?B?N21zUjkvZDFQR09ja3JJQldVQkF5U2IyR2xVakVzbzRweXE0WHdSNk14ZzMy?=
 =?utf-8?B?OTFKd1VRWE52dHhaMXhWbnREV3Y2NXJUTm95d3VLb0RSRmdjSXViS1R5ODJX?=
 =?utf-8?B?Z1JvcEsrcjl3R1hvZ1o0Qnpxb3ZwK3RlYmkyY2ZGRXZTMDBTWmRFSjk5cEwz?=
 =?utf-8?B?UXViMFJ1aGRjRmp6MEpCWVhzLzhBUzY3MjJaTGpjVVYyU1F6TzNweXpVNUJL?=
 =?utf-8?B?dEthcFlVZ3NiOWU3SUR3K1dKcnhKSXZpYnB3NHFZY2E0SFZjK0NkTkRJdURM?=
 =?utf-8?B?Ty9OOHBDcGxBOEtVR1lZT05qQy9NRGxKTVBFU3Jlejdmb1M1V0xXR0diN1pp?=
 =?utf-8?B?SjZqZ2lZVDlLT0tHMWcyam5HbENjeFhyL1BVS1MrUHZralhYazBwdldvWXBR?=
 =?utf-8?B?NUNuWXRMVG1BNWVCV3N0eXdqZkxvSmNDS2xTTEtXK3ROTEtpcWdGSjM1TXdj?=
 =?utf-8?B?VzJ6cm5hYi9oZ05XNHRPbkk1WFhEdEtXMGtTVEpyZmt3UnpvRzdHSW1MeDhW?=
 =?utf-8?B?a2YwMnFXbFpQaDFUN0NYY2JkNjlFUlJ3MExQbzFaMHV1ZmNMOVQyVXRJQUdB?=
 =?utf-8?B?bVR6Nmk4WitqQVhNc2prT3JrMUh4ck4zMG8vQTNGNGpNQ0haSnRqRlZLRE1D?=
 =?utf-8?B?MHJNZTREK3Fycy9RYytEUGtmWWcrWkJPVWpTS1EzQXk0Uk1hZWlWNHBiZW9N?=
 =?utf-8?B?N0p0MFFycmV2akRlZlIyZk1IMUlvQnAxTE1ZSVowK2pWTmFUc0JsOE5YK1cz?=
 =?utf-8?B?MU1NZk5SOU5XOXlDQmh3Q3B5dVBaN1BTcTNIMXZ1cXYzN05XZzF1NXZBdnVp?=
 =?utf-8?B?bmdJamtPRk1QaEZ3QW0wUHlRVEkwT0FNUWZFZTFkeGZ3cmIyT3ZWV0RWZ0hP?=
 =?utf-8?B?eG1JZEFKTjJ1TnhmRkRDOWtRbTFyL2h2Sy9HWlh4SXpRbkNOUFJhSUw2YjY5?=
 =?utf-8?B?N3FsUUpUWHdxYWVVc08vRUQrTHNTdW1jOXpBck1pUDMwMGJLQllQZWE1dXda?=
 =?utf-8?B?OFpmVWF2S01pQkNCVFRud1Y4clhUQ3dlSGxDTVZWeFFERmhOd3lpcU1CeDB5?=
 =?utf-8?B?OFJIRVRJanNKWnNGc21aQWlPcDJKMFdwTHF3Qmk0QWlnai9KM1JxNDBXREQx?=
 =?utf-8?B?NTluVUtFQUNBWEdMZ1A3aFFJZVBGOHF2TTkzZG41ckhJQ0FKdEZ0dzEyQUJ2?=
 =?utf-8?B?MzRlay9qeUxJeHdaZU5wZUNlZmx6UVU0VklyTHJXNlcrZVNhWDRzZlF5enVP?=
 =?utf-8?B?UmtGeFdHRlArMzNnbXdHV3RpUGN1K09ySW9wZHdLQ2dYcEFNTUI0R0NVVmRx?=
 =?utf-8?B?Rm1oSVY2SndQM2xrYzY4SW1KREtWaUNNcVRnT3pjTDlIMjNneGVSQ09tN25X?=
 =?utf-8?B?R0M3RUJHL1dhb05tTFQ0eWdNdTRSNTc1eUdXV3paalhtNTJ2UUNhaFpmMmYr?=
 =?utf-8?B?ZjgwVkd2WS96dXdxNWR1bjc1dXhlN0hIRXZMdFBDSFIrVDB6QVlJZkNqeHVJ?=
 =?utf-8?B?M0hSZzhWUVB3L2o0a1o5WStodDZUT0pIRGFTMEtDdkU5V2RRU0dvUEY4ZEZV?=
 =?utf-8?B?VDhGNEdlN01MQkpuR3lqNGNUVU0vVUlBRGpJdmJrSlhZN01HZXV3YnNxM3dv?=
 =?utf-8?B?YlFONUI0eHA0eGZMWEhNTFBIR3JjaURPbHFuSUFQcTExZUFaZDE4OS9WbUdp?=
 =?utf-8?B?VG1EV0U3aHFieXNRczNkeU9EYTJTODRZQ1V1SlltMER3L3NtT1dwYUJlVUxR?=
 =?utf-8?B?WUxMaGV1N1NtQXRJS0M1bDVMeml5Z1JHVG1PUU84WVhlb3I5VW4zOUszMEJT?=
 =?utf-8?B?d05zM0JJYUNydHRPUHZXeTM0RXBha21ZbUtjR1BobFZXUndpYUNYdmRPOUNJ?=
 =?utf-8?B?TTJnTjJ3ZVROYUwyWG9qbzF5Nm5LY1NmZXgzbDRKbVhoejh2cFYxWDNqTUpq?=
 =?utf-8?B?bWppOXNZNmhhWkJJWDM2L1BPNjdVaEVCNEdoSHJBWk9abWh3UzFObHNlRnAv?=
 =?utf-8?B?anc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <22DE2E44A749A74584E3C836AF8801CF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55481ec9-3e0b-4cb1-4a3f-08db8e3c5f2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 00:56:54.8665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y+TDRRyqyKSRdmwf+7t+QJMiway1FFoWrMTqlJcmD4tD6hkXki+o2Rs5YdLBTyRzUKF1Tyx9dQjDOq63U0qV7p2XUbl6AzsGjL1BUkz0XYg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8394
X-Proofpoint-ORIG-GUID: HJQvLlpmPw3Pjravn3pQnj1JzHjxH1HJ
X-Proofpoint-GUID: HJQvLlpmPw3Pjravn3pQnj1JzHjxH1HJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=892 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270006

SGkgUm9nZXIsDQoNClJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cml0
ZXM6DQoNCj4gT24gV2VkLCBKdWwgMjYsIDIwMjMgYXQgMDE6MTc6NThBTSArMDAwMCwgVm9sb2R5
bXlyIEJhYmNodWsgd3JvdGU6DQo+PiANCj4+IEhpIFJvZ2VyLA0KPj4gDQo+PiBSb2dlciBQYXUg
TW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4gd3JpdGVzOg0KPj4gDQo+PiA+IE9uIFRodSwg
SnVsIDIwLCAyMDIzIGF0IDEyOjMyOjMxQU0gKzAwMDAsIFZvbG9keW15ciBCYWJjaHVrIHdyb3Rl
Og0KPj4gPj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPj4gPj4gQEAgLTQ5OCw2ICs1MzcsNyBAQCB2b2lkIHZwY2lfd3Jp
dGUocGNpX3NiZGZfdCBzYmRmLCB1bnNpZ25lZCBpbnQgcmVnLCB1bnNpZ25lZCBpbnQgc2l6ZSwN
Cj4+ID4+ICAgICAgICAgIEFTU0VSVChkYXRhX29mZnNldCA8IHNpemUpOw0KPj4gPj4gICAgICB9
DQo+PiA+PiAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5sb2NrKTsNCj4+ID4+ICsgICAg
dW5sb2NrX2xvY2tzKGQpOw0KPj4gPg0KPj4gPiBUaGVyZSdzIG9uZSBpc3N1ZSBoZXJlLCBzb21l
IGhhbmRsZXJzIHdpbGwgY2FsIHBjaWRldnNfbG9jaygpLCB3aGljaA0KPj4gPiB3aWxsIHJlc3Vs
dCBpbiBhIGxvY2sgb3ZlciBpbnZlcnNpb24sIGFzIGluIHRoZSBwcmV2aW91cyBwYXRjaCB3ZQ0K
Pj4gPiBhZ3JlZWQgdGhhdCB0aGUgbG9ja2luZyBvcmRlciB3YXMgcGNpZGV2c19sb2NrIGZpcnN0
LCBkLT5wY2lfbG9jaw0KPj4gPiBhZnRlci4NCj4+ID4NCj4+ID4gRm9yIGV4YW1wbGUgdGhlIE1T
SSBjb250cm9sX3dyaXRlKCkgaGFuZGxlciB3aWxsIGNhbGwNCj4+ID4gdnBjaV9tc2lfYXJjaF9l
bmFibGUoKSB3aGljaCB0YWtlcyB0aGUgcGNpZGV2cyBsb2NrLiAgSSB0aGluayBJIHdpbGwNCj4+
ID4gaGF2ZSB0byBsb29rIGludG8gdXNpbmcgYSBkZWRpY2F0ZWQgbG9jayBmb3IgTVNJIHJlbGF0
ZWQgaGFuZGxpbmcsIGFzDQo+PiA+IHRoYXQncyB0aGUgb25seSBwbGFjZSB3aGVyZSBJIHRoaW5r
IHdlIGhhdmUgdGhpcyBwYXR0ZXJuIG9mIHRha2luZyB0aGUNCj4+ID4gcGNpZGV2c19sb2NrIGFm
dGVyIHRoZSBkLT5wY2lfbG9jay4NCj4+IA0KPj4gSSdsbCBtZW50aW9uIHRoaXMgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlLiBJcyB0aGVyZSBzb21ldGhpbmcgZWxzZSB0aGF0IEkNCj4+IHNob3VsZCBk
byByaWdodCBub3c/DQo+DQo+IFdlbGwsIEkgZG9uJ3QgdGhpbmsgd2Ugd2FudCB0byBjb21taXQg
dGhpcyBhcy1pcyB3aXRoIGEga25vd24gbG9jaw0KPiBpbnZlcnNpb24uDQo+DQo+IFRoZSBmdW5j
dGlvbnMgdGhhdCByZXF1aXJlIHRoZSBwY2lkZXZzIGxvY2sgYXJlOg0KPg0KPiBwdF9pcnFfe2Ny
ZWF0ZSxkZXN0cm95fV9iaW5kKCkNCj4gdW5tYXBfZG9tYWluX3BpcnEoKQ0KPg0KPiBBRkFJQ1Qg
dGhvc2UgZnVuY3Rpb25zIHJlcXVpcmUgdGhlIGxvY2sgaW4gb3JkZXIgdG8gYXNzZXJ0IHRoYXQg
dGhlDQo+IHVuZGVybHlpbmcgZGV2aWNlIGRvZXNuJ3QgZ28gYXdheSwgYXMgdGhleSBkbyBhbHNv
IHVzZSBkLT5ldmVudF9sb2NrDQo+IGluIG9yZGVyIHRvIGdldCBleGNsdXNpdmUgYWNjZXNzIHRv
IHRoZSBkYXRhIGZpZWxkcy4gIFBsZWFzZSBkb3VibGUNCj4gY2hlY2sgdGhhdCBJJ20gbm90IG1p
c3Rha2VuLg0KDQpZb3UgYXJlIHJpZ2h0LCBhbGwgdGhyZWUgZnVuY3Rpb24gZG9lcyBub3QgYWNj
ZXNzIGFueSBvZiBQQ0kgc3RhdGUNCmRpcmVjdGx5LiBIb3dldmVyLi4uDQoNCj4gSWYgdGhhdCdz
IGFjY3VyYXRlIHlvdSB3aWxsIGhhdmUgdG8gY2hlY2sgdGhlIGNhbGwgdHJlZSB0aGF0IHNwYXdu
cw0KPiBmcm9tIHRob3NlIGZ1bmN0aW9ucyBpbiBvcmRlciB0byBtb2RpZnkgdGhlIGFzc2VydHMg
dG8gY2hlY2sgZm9yDQo+IGVpdGhlciB0aGUgcGNpZGV2cyBvciB0aGUgcGVyLWRvbWFpbiBwY2lf
bGlzdCBsb2NrIGJlaW5nIHRha2VuLg0KDQouLi4gSSBjaGVja2VkIGNhbGxzIGZvciBQVF9JUlFf
VFlQRV9NU0kgY2FzZSwgdGhlcmUgaXMgb25seSBjYWxsIHRoYXQNCmJvdGhlcnMgbWU6IGh2bV9w
aV91cGRhdGVfaXJ0ZSgpLCB3aGljaCBjYWxscyBJTy1NTVUgY29kZSB2aWENCnZteF9waV91cGRh
dGVfaXJ0ZSgpOg0KDQphbWRfaW9tbXVfbXNpX21zZ191cGRhdGVfaXJlKCkgb3IgbXNpX21zZ193
cml0ZV9yZW1hcF9ydGUoKS4NCg0KQm90aCBmdW5jdGlvbnMgcmVhZCBiYXNpYyBwZGV2IGZpZWxk
cyBsaWtlIHNiZmQgb3IgdHlwZS4gSSBzZWUgbm8NCnByb2JsZW0gdGhlcmUsIGFzIHZhbHVlcyBv
ZiB0aG9zZSBmaWVsZHMgYXJlIG5vdCBzdXBwb3NlZCB0byBiZSBjaGFuZ2VkLg0KQWxzbyB0aG9z
ZSBmdW5jdGlvbiB1c2Ugb3duIGxvY2tzIHRvIHByb3RlY3Qgc2hhcmVkIHN0YXRlLiBCdXQgYXMg
SU8tTU1VDQpjb2RlIGlzIHF1aXRlIGNvbnZvbHV0ZWQgaXQgaXMgaGFyZCB0byBiZSBzdXJlIHRo
YXQgaXQgaXMgc2FmZSB0byBjYWxsDQp0aG9zZSBmdW5jdGlvbnMgd2l0aG91dCBob2xkaW5nIHBk
ZXZzX2xvY2suIEFsbCBJIGNhbiBzYXkgaXMgdGhhdCB0aG9zZQ0KZnVuY3Rpb25zIGFuZCB0aGVp
ciBjYWxsZWVzIGhhdmUgbm8gQVNTRVJUKHBjaWRldnNfbG9ja2VkKCkpLg0KDQotLSANCldCUiwg
Vm9sb2R5bXly

