Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D445B54B
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 08:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230103.397820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmbx-0000Da-4E; Wed, 24 Nov 2021 07:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230103.397820; Wed, 24 Nov 2021 07:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpmbx-0000Bi-0o; Wed, 24 Nov 2021 07:22:33 +0000
Received: by outflank-mailman (input) for mailman id 230103;
 Wed, 24 Nov 2021 07:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGpx=QL=epam.com=prvs=1962e93d75=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpmbv-0000AT-Ih
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 07:22:31 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 48297d5a-4cf7-11ec-a9d2-d9f7a1cc8784;
 Wed, 24 Nov 2021 08:22:30 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AO78qlm004720;
 Wed, 24 Nov 2021 07:22:28 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cheu6gddv-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Nov 2021 07:22:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3874.eurprd03.prod.outlook.com (2603:10a6:208:6c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 07:22:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 07:22:21 +0000
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
X-Inumbo-ID: 48297d5a-4cf7-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TnLLMhw8c4vPilnR03ui3OgqAWc3T76f2E47q2gteuNroL6DW7wlFRQNnMwgGj8MJXLvOVA2lNZei9PhPh5LDloRk2a73wVZ4gQVSiJH5M3gGkyMPXB2yBNU8Gn65xtx7Mkoso3w6Hn26UmHOdoCHgh6jgRqNwghB+k1yzT8a7l/u1Azsn/pwrbq14wVEL/pO611rerf+2iwIgtEyZQJLaDEZ35ivXZh+iuvcbPzTqPghBdEgG/VGIfHb2VjbVILfMoHhHKbUOJdjDjSibyRX7lDWBCqeod/PFVKUze6SMKr+4LIsHZuom3mAAK5h6MI34E2lR67jHVDPjhN6SZdxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=asvoNZzxpeUVpG979IR6hLaidMY/KzWCfMLeXntLDM4=;
 b=nzkwTuwP7iK5SbSA+7kkmVVD3xEH/O7rGEm6P9xc5+bZdnBh9UmnDMAhRfq1tL6Bef7k91i1zmC3Q5mKdIrSxjhp+5mjuSbbeIjOA4P+0D8bZw7EqxhtrcxFrTgfHZiRpMCy36mHLFTb0WfDfap+6HyZml0mUTYMxGut4R2kEx0fKv7v1FV5MrWVKwbSaJCqLgR+FSK/9aRuYTk+WhPNSMUoLUU0S9X5WKU4h1CBZYLIa1NCxYIXmAI4/kilB9vTS5cr0qnMZpN0SIsglBTkHVptwHojZz/m29RDSNBHdRzvY+XaK4QzwD+XSIDGwHVvyLdnmYSQizpbWE38qjgP1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=asvoNZzxpeUVpG979IR6hLaidMY/KzWCfMLeXntLDM4=;
 b=cVUlUwf+DRQIupBtnqJSiO6255W0WezvVZNtwh05m5ihExPzDY3KYMYRva+WFwC/lKdzIHZ/PrGPmYwAFG00UbGyvsiTqtf7FM4eT4TKv+a4379qZ8ovrkSbIe9H/R/cSM8mEDicCJtn6Ep9YfkijXtW4HFDVXI4SAdQACWEAlqaVZy2sIWzkC/d7zM948OXY02bI88+0zUt9WLXNHEjNc8YqLD4TDL0k4c+qyrjNkntIst06B1fh8rGoUVL1qeI9XOahRvu2R6PZrW9cUp3im0yGgPqHKSOkDA+aRQypDsf1xqAg7mwKl6vCuZamvdd8Ld/zGD0FZIUtmVD+joHZw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>
Subject: Re: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH v6 3/7] xen/arm: setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHX0g8SPRoS2Ac9eEeTcWew1GI8x6wGl6aAgAJfuQCAADeUAIAGu8iAgADgLICAAJqvgIAACEQAgAAEzYCAAPFBAA==
Date: Wed, 24 Nov 2021 07:22:20 +0000
Message-ID: <997b74fc-0a74-80b3-1fa7-dbf38ebddfbd@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-4-andr2000@gmail.com>
 <2eb6b4e8-95e1-9566-3209-c28964b0d643@xen.org>
 <2f414e8f-67d5-d513-74d4-cc21a3a9ed28@epam.com>
 <9f712f79-9660-865a-3002-713950518819@epam.com>
 <117a57d1-aa4f-8153-8bba-2db47c234b81@xen.org>
 <c6232073-b59a-609f-3852-ddcac0859c2c@epam.com>
 <ef17fbe6-9768-9978-fa8f-6be757034234@xen.org>
 <442c853a-5554-9be0-80e4-b1f34cd6adeb@epam.com>
 <12447bb3-e3b4-c1f3-17f7-09704fd8b847@xen.org>
In-Reply-To: <12447bb3-e3b4-c1f3-17f7-09704fd8b847@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20152213-4727-448a-7a2d-08d9af1b2786
x-ms-traffictypediagnostic: AM0PR03MB3874:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB38745E172E902BD244D17150E7619@AM0PR03MB3874.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 +r17xmTxZ/l4qZivhOMZSNHj54ktMpyiQLd+6sw6YvZjyeWROGbzN3IV3FNhcVdqruWl0eRw0arJWgYsN20aa/VH/6jHdbuUfkBWI+/fSIwhZ8ccG4+m/NwN+8Y/CPUP4kVu6ow2JLrZYvjJfNGRRDqtKaQHCB1ebDy8X8ORJ8UfT4KSOgwFX6Ztag/uTcqdxd8/nZbU6SleN7nSudk3TvB8GAOEutucmx2X/ZfJvOY3ynqJ3WQGETqbWIygfn4vPAaAyh0CFQtOORy/AC2+V3XB+yRp8oeoQKKz0wnzXSLLs6QdG4Sr2nMNq8Kszg5sVFQCa/Ou/Nh1HNMGTVBAm5K19GDOq+j2/wt45nDyA1BfMtk7yPxFgPZPk9iZPaWgKyYt6rYv6lwUmyhc8xJfgOXwxDJvy0DPunuVGqJW/qncYkOEctfhw6OEYJ0NB18CFCgeHicDKFGhmlv+b83iWUPryNNj+K1GM7pOH/fdDwBTAeD/UZHdX1vvV0eiEAMa3F5hBxkqykqxqf3kfIhkTedJnhXpPSIXHuV3wLHmrP+NvGedskHtaSR2OPvheoD3yXWEnyQcP5+gnUobclpiaZYbV/rvZ+1yxQnCu1Km2kMoHg9fEyhWFgKzgavvJnGFTaY21DXivXFFQX/MJY9rTqque8IPJvgW5dKJHrdxO/RwfcvSQiISmYmb9AtrdXmtkZEEBqQCNSjCtFT9aNnMQw638pXGs86uAVJdeNBb3Khf/m6y2Zo1TbuXKt1Y5an/
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(91956017)(6506007)(38070700005)(31686004)(4326008)(186003)(31696002)(8676002)(2616005)(86362001)(508600001)(76116006)(122000001)(53546011)(66446008)(8936002)(110136005)(316002)(66556008)(38100700002)(64756008)(66946007)(5660300002)(6486002)(66476007)(2906002)(26005)(36756003)(7416002)(6512007)(71200400001)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M2t1MHltYUkrNDZ1azZTbXpwUmErTG5IYmZLZCthd1krYVAwTzF5Z3VKVjdY?=
 =?utf-8?B?cm8wYXIwVGZkTGF6MCs3MVZYREt3T24xZnlNT2lWZVZOM2p3bGZhV1JyenRx?=
 =?utf-8?B?elFlbXlPZXZqR3lMRmM2OWVQeWtzSXVWbEhHdmdIYk9OS1dkWEEycHI1ektY?=
 =?utf-8?B?eXltZGxSRDNIRWN0VW1hak41aGlTZzNJUVBUSkFRQWNXYlVXdFQrTVdzckkx?=
 =?utf-8?B?MnpCQ2QwRGJiOEc4bzJnaWdZalREUW9HRUdmQTlKSkVsOTNJVytTd29WQmRZ?=
 =?utf-8?B?VXFlTDdZWlhOa0RYTzlUUmhEcnp6ZFFKTlFEOGV6cEhnZTNSYnhqNm5KcmY2?=
 =?utf-8?B?b2RuM1RzZ054cVRTbnNlbGw3RXBiWDNJeUFCMUxqb1h5Q1h1Ykl0RnpDMnJx?=
 =?utf-8?B?TnpWVldKS205dStHUzJ5QkhCNHJCbm5POHk2a3RPNlF0L05zREhlTldPd1pv?=
 =?utf-8?B?U2pNMXR6NHZCdVlhaWdQNUVJcVQvdm9qU0tyRzVBV1BkNklOUlNGb29GamJl?=
 =?utf-8?B?K3dmZXlwWmdESHdxem9TNnVKV1J6a1JQVXpVNm1qWTVScGFPb2NNdGtNTnFI?=
 =?utf-8?B?d2tCbDRIbzdhSSt5Q00wYjhVZW9pbzZtLzR5V095REpYK3JlWUJaOUZ5azRa?=
 =?utf-8?B?WjRETGVpTHZTaW1haHdnbUlsZWtVTWFsZ0dTZzlzWXVoSlhrZXVTaEpQNXFp?=
 =?utf-8?B?Z3BudXBUT1FQVUh6cmlacFU5NnR0dWNHQ1VGV2xLTVN0YlNNUjJQRmwzTnB2?=
 =?utf-8?B?djNNQjFESXZFdWtjK2U0R2N1K2lrK09JR1R4ZGRLQzA5OHZWZXZscUNEYUZQ?=
 =?utf-8?B?NlN5WUphWnIyNTZMcmNXUUJXamlSTWJQMU1mV0FVZG5wdmNTQWV1emtWMUJr?=
 =?utf-8?B?NVh3aC93SFRCWDVyYi9qTnpwa2tMMkU4UkZLQW1MT0pxSkZUUVJ0NlJYdWxF?=
 =?utf-8?B?R0RQNThIbENyQVc2dDd6RHJHa3RoeU04SlhCK2tQYU5wV2ExTFI3MDdCc3VG?=
 =?utf-8?B?Wk9wQU9ueUNManhpU3ZyOTduWDB0cVAzMXdDcmliYjlNdXEyakZFbHRGb1Ur?=
 =?utf-8?B?ZjA3Z0xIR1VHUi91QnJrZDVuK1dkWkpKY2ZHU0hpRWlvNFIyR0N6VEJWbUcv?=
 =?utf-8?B?OG50SjlpY2hTNE1MWmx6QXlBK1lvTmY1V1FsZzlDWDJPeUczRElTZk9iMW9Q?=
 =?utf-8?B?VHB3QVQyNGdHMWNaWnFYcUN4K01zV011N3kyejdGSFlOWm42Rms1cVFhSkZm?=
 =?utf-8?B?YTZBTm1HL1oyaHJYWlhBWUZiZW50ZHhWZE54RUpVbEkrbFRZNjYwWHJwME9Y?=
 =?utf-8?B?VCtYL1BheVBkWHhSRTBzNlFBNjhidk4rZDlTK2tKZkFlVHJzUUpqQURkeWFa?=
 =?utf-8?B?Nkd1bDRQZnFmTmtiNFFxcjcrYU1sVk9vSENkRDBoMk90R01QSFBHWU92M21q?=
 =?utf-8?B?SkNFTU1mWks4SHF5bGQvWHhuQkt0UDhPVTJtV1NxZFR6VGluRFh2OEovQ3Y3?=
 =?utf-8?B?c1lnMUFMU09oZUxjOXlXTEUzUWk0TDZSQnA2T1NCSnNSY2xxZ2YvRU54REh5?=
 =?utf-8?B?SHJ3d2c1V29hVm8yZlJ0Y21McDB2MVhIbHhrSDVpT2hTRXYrbUJ6SkhvMmJt?=
 =?utf-8?B?a1phYTNnUDV3YWdCL2pMV0EvVEd0amh5UEh3VVhLbTVXMGQ0cFpvRm1xK3Rs?=
 =?utf-8?B?V1pPN3cyTmxkZ05OMm9DUzlUMEd6M0RPTXB3YTZsRUtvTnVFb2djK3p6bEZo?=
 =?utf-8?B?NVNSaXVZb3hoRkNtempsTWlJaFBXOVJ0YmlqOVNTNG85bDY0aHNwODBwL1Iv?=
 =?utf-8?B?V0xIMk1KN3dJZHg2NUhNMmZMQmxxVWVXUjhNMFpBZ2tkS1pnUWtGNlVhTk1E?=
 =?utf-8?B?OTF3RHprWkFRWkloZUVmN2xhRWhxV3pvdGtwRVZWRER1MzZqenJCOFhjUnFn?=
 =?utf-8?B?azRCc3hrNFlpM0ZyRHFjQ0xQUUc5eFdJYVpNc2VJMFB0WE9IZHJzMzNhc3Nq?=
 =?utf-8?B?b2NIdHBVeGRkTGIyYWRzVFYvWTNwTjhRQTc4eDB6d2o1WXNSQXo2VlpsRTE3?=
 =?utf-8?B?YUxyZGVyakd5a2V4aENpbS9heE1hZ1VWTlFQQVVJMjJuT1JmUXpmTXRtZHNG?=
 =?utf-8?B?WkZXTmk3YmFoOHJ6aTVteXdkYy83V3ptNzc4Tm8yUUJsMEVlcG81T2ZBUTNO?=
 =?utf-8?B?UldkWWc2L0xweW9IcCtFeDUydzU4WkoxUHZpSHhIR3A0SU15V1g1TkRZWjhQ?=
 =?utf-8?B?VUlPa3NQZ0NCRVQyU2x1YzNtOSsydWVjMkFVdzdydDlOQ3Y1Z1RpMDBXRWpG?=
 =?utf-8?B?MzRLalZKUFowM1pwaVJDZ3VhZ1g1ZkxRdjdDZG9ZbzlNeGdwUmdPUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <754563D90EFBBC47B529694DA7CF1495@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20152213-4727-448a-7a2d-08d9af1b2786
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2021 07:22:21.0055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mZnVtD05HfcxkPNmGyoUXTUSdF4aE7cBcRIKO88y//d1fJ9ILLfs579b4iFBK8YBgzD9EFj6lU8Uj9HxcwZ1mJofmHmUOjvH5gjJ7yGYJU2iFvmKPi6YKAouDSrhl4ov
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3874
X-Proofpoint-GUID: tiM5aNjO800xPyKMaylDxXWbLdFu5ZrV
X-Proofpoint-ORIG-GUID: tiM5aNjO800xPyKMaylDxXWbLdFu5ZrV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-24_02,2021-11-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111240041

SGksIEp1bGllbiENCg0KT24gMjMuMTEuMjEgMTg6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGksDQo+DQo+IE9uIDIzLzExLzIwMjEgMTY6NDEsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdy
b3RlOg0KPj4gT24gMjMuMTEuMjEgMTg6MTIsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBPbiAy
My8xMS8yMDIxIDA2OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gdW5z
aWduZWQgaW50IGRvbWFpbl92cGNpX2dldF9udW1fbW1pb19oYW5kbGVycyhzdHJ1Y3QgZG9tYWlu
ICpkKQ0KPj4+PiB7DQo+Pj4+IMKgwqAgwqDCoMKgIGlmICggIWhhc192cGNpKGQpICkNCj4+Pj4g
wqDCoCDCoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+Pj4NCj4+Pj4gwqDCoCDCoMKgwqAgaWYg
KCBpc19oYXJkd2FyZV9kb21haW4oZCkgKQ0KPj4+PiDCoMKgIMKgwqDCoCB7DQo+Pj4+IMKgwqAg
wqDCoMKgwqDCoMKgwqAgaW50IHJldCA9IHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlc19hbmRfY291
bnQoZCwgdnBjaV9nZXRfbnVtX2hhbmRsZXJzX2NiKTsNCj4+Pj4NCj4+Pj4gwqDCoCDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gcmV0IDwgMCA/IDAgOiByZXQ7DQo+Pj4+IMKgwqAgwqDCoMKgIH0NCj4+
Pj4NCj4+Pj4gwqDCoCDCoMKgwqAgLyoNCj4+Pj4gwqDCoCDCoMKgwqDCoCAqIFRoaXMgaXMgYSBn
dWVzdCBkb21haW46DQo+Pj4+IMKgwqAgwqDCoMKgwqAgKg0KPj4+PiDCoMKgIMKgwqDCoMKgICog
MSBmb3IgYSBzaW5nbGUgZW11bGF0ZWQgaG9zdCBicmlkZ2UncyBjb25maWd1cmF0aW9uIHNwYWNl
Lg0KPj4+PiDCoMKgIMKgwqDCoMKgICovDQo+Pj4+IMKgwqAgwqDCoMKgIHJldHVybiAxOw0KPj4+
DQo+Pj4gSSBhbSBhZnJhaWQgdGhhdCBteSBxdWVzdGlvbiBzdGFuZHMgZXZlbiB3aXRoIHRoaXMg
YXBwcm9hY2guIFRoaXMgcGF0Y2ggaXMgb25seSBtZWFudCB0byBoYW5kbGUgdGhlIGhhcmR3YXJl
IGRvbWFpbiwgdGhlcmVmb3JlIHRoZSBjaGFuZ2Ugc2VlbXMgdG8gYmUgb3V0IG9mIGNvbnRleHQu
DQo+Pj4NCj4+PiBJIHdvdWxkIHByZWZlciBpZiB0aGlzIGNoYW5nZSBpcyBkb25lIHNlcGFyYXRl
bHkuDQo+PiBXaGlsZSBJIGRvIGFncmVlIHRoYXQgTVNJIHBhcnQgYW5kIHZpcnR1YWwgYnVzIHRv
cG9sb2d5IGFyZSBub3QgYmVsb25naW5nIHRvIHRoaXMNCj4+IHBhdGNoIEkgY2FuJ3QgYWdyZWUg
d2l0aCB0aGUgcmVzdDogd2UgYWxyZWFkeSBoYXZlIE1NSU8gaGFuZGxlcnMgZm9yIGd1ZXN0IGRv
bWFpbnMNCj4+IGFuZCB3ZSBpbnRyb2R1Y2UgZG9tYWluX3ZwY2lfZ2V0X251bV9tbWlvX2hhbmRs
ZXJzIHdoaWNoIG11c3QgYWxzbyBhY2NvdW50DQo+PiBvbiBndWVzdHMgYW5kIHN0YXkgY29uc2lz
dGVudC4NCj4+IFNvLCBkZXNwaXRlIHRoZSBwYXRjaCBoYXMgImhhcmR3YXJlIGRvbWFpbiIgaW4g
aXRzIG5hbWUgaXQgZG9lc24ndCBtZWFuIHdlIHNob3VsZA0KPj4gYnJlYWsgZ3Vlc3RzIGhlcmUu
DQo+DQo+IFdlIHdlcmUgYWxyZWFkeSByZWdpc3RlcmluZyB0aGUgaGFuZGxlciBmb3IgZ3Vlc3Qg
ZG9tYWluIGJlZm9yZSB5b3VyIHBhdGNoLiBTbyB0aGlzIGlzIG5vdGhpbmcgbmV3Lg0KPg0KPiBB
dCB0aGUgbW9tZW50LCB3ZSBhbHdheXMgYWxsb2NhdGUgYW4gZXh0cmEgMTYgc2xvdCBmb3IgSU8g
aGFuZGxlcnMgKHNlZSBNQVhfSU9fSEFORExFUikuIFNvIHdlIGFyZSBub3QgYnJlYWtpbmcgYW55
dGhpbmcuIEluc3RlYWQsIHRoaXMgaXMgc2ltcGx5IGEgbGF0ZW50IGJ1Zy4NCkFncmVlDQo+DQo+
PiBUaHVzIEkgZG8gdGhpbmsgdGhlIGFib3ZlIGlzIHN0aWxsIGNvcnJlY3Qgd3J0IHRoaXMgcGF0
Y2guDQo+DQo+IFRoZSBpZGVhIG9mIHNwbGl0dGluZyBwYXRjaCBpcyB0byBzZXBhcmF0ZSBidWcg
Zml4IGZyb20gbmV3IGNvZGUuIFRoaXMgaGVscHMgYmFja3BvcnRpbmcgYW5kIHJldmlldy4NCj4N
Cj4gSW4gdGhpcyBjYXNlLCB3ZSBkb24ndCBjYXJlIGFib3V0IGJhY2twb3J0IChQQ0kgcGFzc3Ro
cm91Z2ggaXMgbm8gc3VwcG9ydGVkKSBhbmQgdGhlIGZpeCBhIHNpbXBsZSBlbm91Z2guIFNvIEkg
YW0gbm90IGdvaW5nIHRvIGluc2lzdCBvbiBzcGxpdHRpbmcgdG8gYSBzZXBhcmF0ZSBwYXRjaC4N
Cj4NCj4gSG93ZXZlciwgdGhpcyBjaGFuZ2UgKm11c3QqIGJlIGV4cGxhaW5lZCBpbiB0aGUgY29t
bWl0IG1lc3NhZ2UuDQpJIHdpbGwgYWRkIGEgZGVkaWNhdGVkIHBhdGNoIHRvIGZpeCB0aGF0DQo+
DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

