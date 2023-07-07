Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C59574A8BC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jul 2023 04:03:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560153.875830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaoM-00065J-Cu; Fri, 07 Jul 2023 02:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560153.875830; Fri, 07 Jul 2023 02:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHaoM-00062B-9V; Fri, 07 Jul 2023 02:03:06 +0000
Received: by outflank-mailman (input) for mailman id 560153;
 Fri, 07 Jul 2023 02:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OIXD=CZ=epam.com=prvs=155258fc3f=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qHaoK-000625-Mx
 for xen-devel@lists.xenproject.org; Fri, 07 Jul 2023 02:03:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 670b9bb6-1c6a-11ee-b237-6b7b168915f2;
 Fri, 07 Jul 2023 04:03:03 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 366H7r22008884; Fri, 7 Jul 2023 02:02:58 GMT
Received: from eur02-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur02lp2044.outbound.protection.outlook.com [104.47.11.44])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3rnum72yac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jul 2023 02:02:57 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com (2603:10a6:208:4b::31)
 by AS2PR03MB9646.eurprd03.prod.outlook.com (2603:10a6:20b:5ea::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Fri, 7 Jul
 2023 02:02:52 +0000
Received: from AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3afc:a0ce:1e52:54]) by AM0PR03MB3699.eurprd03.prod.outlook.com
 ([fe80::3afc:a0ce:1e52:54%7]) with mapi id 15.20.6565.016; Fri, 7 Jul 2023
 02:02:52 +0000
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
X-Inumbo-ID: 670b9bb6-1c6a-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YcfhBYcHBvv5GKr+xtACBK6RnonRoM/cYy2inSoMV9vFgmiHhB3ub1ekkJeR6kAXaj+I0jIS9Kf8QSyhHlzfLBsIKbUSSplwwlIEZbwqH6xFo8HBUsuV7GcMH5R3TdA86ls98JkLdo9xTAHi0nuMIOR6KifC5wmlffML3oJAsyIeVC3lmyaMOnhIo4kZTHFG0e0iUGvc69QUgdCiItkd/Gk5sbbKRYEiGvfdpV3FrMWVPbEXwnNXNPQJMnJb5gGUfGkI1C2CIfV72EMVFjWxLgtBDluiO4XhPDCDmn1n8Ida5qNEuQ7aSt+2/VkxqIeXygxLCq0LCAjkFdohqOIiMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=21W7mRXhPafIDi9LiL+vr2WALcOTea1NN1dG8a7Xoq4=;
 b=jM4rWILkYObEiVEqsv366+ye/Rn1rFy6RIL9OUGtKlZn2l43bN34pAzRje2pw4tQW19P7QpQKhhEtRhrzAtOjKrYjureHH2/6gtDaNjjuJD0kNPxtQ2ubt1RG4cbytnRLQLqaFmSWyTCxN1W7qLQs0sgKLRlfGuk90/SKVwEIKTn49z+SyMixPGmX+LKN4AyHFOUp4lfXF72kwLkuOImCGLiQ3TPvlcA/x/MjRYhvjtDuZcxn3sI9rlWv4Pr19ENs5SE8zQQJRKHD1JS7I5hh+RriCCoSMOJpkGcMQpqALlEF1VGfMMzmq1S6Bv5O7E/ETt36UT7AXPl24YSGF2O2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=21W7mRXhPafIDi9LiL+vr2WALcOTea1NN1dG8a7Xoq4=;
 b=eHvrS0F2iU+G1F7YV83g1cF1+uSHP5weYKBOz98+yCC25PSirKAU0WDl0WPC9zj908q1j8bGDJFEyEoRCZYox7KfZZp7Ew2IrKaeUE3/gqSvBSLag/yiilsm4z94TGbbqr6Z+r2DkfKl8N4UucXXUo46UrD3UQoZ84eRtYOGE7KBbsy44Wg6dtAH+234knTOXiWvqn4/ANAsS1z+Ozq1HXSntDpwf/0lhyqWSfrQYWgjdKM3cjl+zJvEyNx+AHznzGSQjKCsmpTMf7VxQvlUk4ZAEKNGkZbwf4Li5nfHeNFfGTmMhKKe+1myYNlAQnsjbqR4C2yPSwQ267yugDzTmQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Julien Grall <julien@xen.org>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v7 01/12] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHZneJZdDE+HOoSO0y6VB9l0x1hDq+No9OAgAgqUACAALl2AIAAzUWAgADPAYCAEhJlgIAArbcAgAAeJQCAAAPogIACp8SA
Date: Fri, 7 Jul 2023 02:02:52 +0000
Message-ID: <87mt08mqb9.fsf@epam.com>
References: <20230613103159.524763-1-volodymyr_babchuk@epam.com>
 <20230613103159.524763-2-volodymyr_babchuk@epam.com>
 <ZIyOCan//39V3bdy@MacBook-Air-de-Roger.local> <87352kpj04.fsf@epam.com>
 <ZJQDGOrP1I3hR5Jj@MacBook-Air-de-Roger.local> <87ilbfnqmo.fsf@epam.com>
 <ZJVc77SwvyKOEdnJ@MacBook-Air-de-Roger.local> <87wmzfmltd.fsf@epam.com>
 <ab79bcb6-6fc8-c68f-65bf-16ce7316c3ae@suse.com>
 <ZKUw2MPBhOSgG-Eg@MacBook-Air-de-Roger.local>
 <a964cffa-fb42-b0e0-e60a-1044d8794193@suse.com>
In-Reply-To: <a964cffa-fb42-b0e0-e60a-1044d8794193@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.8.9; emacs 28.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR03MB3699:EE_|AS2PR03MB9646:EE_
x-ms-office365-filtering-correlation-id: 39c5f112-9ea1-43b6-41e5-08db7e8e45c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 sTl+f+6FdSpLEVev5EbVJdbAxZccxvaB45onGY1MSf4b7pWPazgg3nAZAPwEa2pmIA56LiQcF5ccyxKElePwW9K4zMBagqEGEF46idZdd/72iNp+ic8ncWq472wh+pH/I016TvWaBf1qyTphFQHb5vFBkmtRh5/jQx2dRb9vz1CF+q0g4gEVbg2Jxfe3ZPgsgksBB8mk55RQeUMl87Jy3zlfoUM75VJBWuRNXuTvrzbmDSXWYnLWLLICnY7wVO+i7MZHSnrC8t6am26QUsJBM8Sdb1zmWmFlm62viatlU3am+d5vacnHS2tgWQgbGJWjASeJJtNUnVyzmxWFL2jHdGH6jzoJKbujCHk8FHCFo9HMkrG3zPeG7ahAkeVqrlJOXZWOnq/NLZZjRiqbq3TLrmpR2HKxQngaO/2twqHhMEhrxukMz7aIwH55xkc19cZNa/dS6PSQKwttZjij0OPY3stYs8iq+6UeDXUGKNXMx7PXYaP5J3L4ULkrOFbhOfcWbgR52KFZmbkI+Rt2mE7Ovpo5xcOklfyseF4gVppsS+/gi5cS4JC/9MTsWql2IlwBW0etaF2TfpNeFALDQh6p4mGp3beVqi0P71n7/hfj42a8DBFCWNJUw6ppzEO5ZHH0
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB3699.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(451199021)(122000001)(38100700002)(6916009)(2616005)(64756008)(66446008)(66476007)(66946007)(316002)(76116006)(91956017)(5660300002)(8676002)(4326008)(66556008)(86362001)(6486002)(41300700001)(38070700005)(36756003)(2906002)(186003)(8936002)(83380400001)(53546011)(54906003)(55236004)(6506007)(26005)(6512007)(71200400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ajhLU3dmNzgxSWtSYk1GeWZQN3kydGhpZXZkR3QzRkFsaDFlYmxRRFVqZkpP?=
 =?utf-8?B?SWNock42dVEyV2ZwUFNBcFhjU3NUKzJnQi96bWVvbkd5bkZKRnRJZVJJMUg5?=
 =?utf-8?B?N1JhMzRtSXFkTkhQaEZ1R2UwWE40U0ZXa3FUREJMQkFlL0FIZmdxajFNd3BJ?=
 =?utf-8?B?c0s0M1VhYS9LTkRZSEMwamc2QW9ZWWFOR0RSRTZ4aEwyZGx5bCtYR1M1TE9F?=
 =?utf-8?B?VWJrK1pzVVk3Z055WUExdmF0aWxiOGhZV0c2SXBFdVNwcE9qcE9YeW5QM1Vy?=
 =?utf-8?B?SFVvaE0rZXJyVG9qTU5JUmh5cko2RXlwUGcvVGtvZFh5ZTRIT2NaQzhGWFlN?=
 =?utf-8?B?dVh6SW1YVFhWWkxia2ZFeE96dTl1THNkQllhRGQxN1JUVzcrTkZtb2N3Q3RC?=
 =?utf-8?B?a3UzYk5vMEEvTjZpemdrR0daRUQ1ME1CQW9DMVk5TFMxbnEwaDZ2dVhmTG1V?=
 =?utf-8?B?SnA1SmxMWXlNNlpJTGJCRE1KQVpMendaWUNrUyt2bWpiNGVjMnFGbkRNbXF0?=
 =?utf-8?B?bWtDcG4zQmxVKzZYNnFUcGRUd24wTkR1ZTRMeHNmQXF3RHU0K1ZmUStzeHk0?=
 =?utf-8?B?MFVIMmVoRGd2YzUrUTRWR2RaejFEWFl2eHRReXJENUxPOFh5b2FHektxNjhL?=
 =?utf-8?B?VWVNSW9ZVVNuVnNhak1OS2wranRiSi9tWGVpUkFscjFUWDdrZkczbDc5Nmhn?=
 =?utf-8?B?VnpFeVRZK1JsN1AvbjhDQ3pkVEVFWlFZUnNueGRUbXFQR3BHQzEvdzJzaWJC?=
 =?utf-8?B?YW9pL210MFo1bWdkRGJ5WEl0N3hPRVZaZEc1amV5bk1BVTlXUFVTZGdmd3dw?=
 =?utf-8?B?UTNuanJwRmJMTTdXL2RFdndMbDFxQmIyNUlleFEvY3hLRWlla0VYZld1ZS9s?=
 =?utf-8?B?UzUzc01pcVNlRFdHSnNVMndPbW42U1V4RnVtNGc2Qk56a1NKMytlZCs3R2li?=
 =?utf-8?B?UkJrMERBSDdBSW9FL0JycWk1am0yOFNIOXloRnpKVWRtWmkyaHBydEsvSFgw?=
 =?utf-8?B?NFJHWU1QSEFSa2tCYkNuTkxiQTA4a3NSZHI2WTJzSzgzNFRIdXMrbmtFSzIw?=
 =?utf-8?B?MjhTWE5teTQ4NmhkZTlxVEc3aFEyN1ZRVFlWaFdmU0NYSm1ycDBxV3VvOFd4?=
 =?utf-8?B?WGVYeGx0OUZ0bDdSVFdtdGtzdzVrNm1IeGtmNUVGSGhyVGY5ems2aVRVTzFK?=
 =?utf-8?B?Z1BaQ2VLeVN1c09TSEtFRTJITHVHZVg5K2V0Qnhqcy9GbFRrckFDSWYyTEhr?=
 =?utf-8?B?VUIweG0wNExqdEFUL25QejgxWmYzK3NBc0Fvendsam1TSExFS3Y4RTZKeTNE?=
 =?utf-8?B?RWlkZEMzZmowMTYxZGx6U1hlNlpiSEh0R3NIOGtGQ0FFVnNmSi9aejFwTDZK?=
 =?utf-8?B?UmdGS3JGaHVxNmxoWlBqdm9wb3BvZ1NkK29tTGM5NjBXbUhqMk1pODVydzZT?=
 =?utf-8?B?QVhkMGtTMzhteXVwWTFkY1JXanFqQnNHd2wwZHlCNjl1OXRZOFB3WUppb29U?=
 =?utf-8?B?OXZqZEhBRkJqY2kzcGR0VVQvZ0ZhZ0t1aitSWC93U1R3OHpEaExYTklsZmZU?=
 =?utf-8?B?S1BmcWlsWTVsNFlCTVBoS3UyYUtueGdIeFgrZnE0SU1IZHV6YnEyZWova09F?=
 =?utf-8?B?SFRSMDN3anVYTGtxSHBiaGc1S1MxNW5ZazhSYnBWNjdVeW5Ndmk3K0FhaFpx?=
 =?utf-8?B?UG0rS2s2QlFIb25kNE1DRy9HTm1PMkJGZVpDbEp6Ry8wd05aRXAvRnd0aHV5?=
 =?utf-8?B?dFE5MXZCbjJ6R2dPU2YzOUtRWkVFZWFTRVBFOXh2MDg3czVXd0dYQ0o2QU10?=
 =?utf-8?B?bmtPVWlxSm9Ocy9VaGtGQlNwSWlUd2pPQzhFNHdHaGRCblBlRFRRUHppM1Er?=
 =?utf-8?B?UmtMQzFPQllmN3p4NVpKOWRVa3dFMWVvTmR2QzZORE4wNTJ6UEdianB3aW01?=
 =?utf-8?B?ZHRZcW5uOENPRTlWN09FMGwvaE9Oay9vOWVMRFdFQTBlWHRkOTA0bitPVFFo?=
 =?utf-8?B?WUFaV3ZJMkowbjZCRnpwNnRTVnp2ZG1zOXJnbW9uNm1JbUhLVFEwOGtEMTgv?=
 =?utf-8?B?ZS91QWdUWlpqZkpkTTR4bjBNeEk0VnJSanhYUkdXR242YXBLbm51MlcwTmhm?=
 =?utf-8?B?ZElwNm9rWk5RbXpSNHNidTljVFRVRitaWkxiNGFEZzdRWnRReFdGVlY3NFhV?=
 =?utf-8?B?K0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <715ECC0196C4614B81FFC58A1FDAEAF6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB3699.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39c5f112-9ea1-43b6-41e5-08db7e8e45c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2023 02:02:52.3788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t5y6RRNgFbaBdxm6GptWn/zoldFERXaYXIYd4hmGVS0xtHj18c68k96zMwiRuS5GESYLvwp5bOpdHCompgxwGoyXOXD4c7/7IRi5Fj5bdxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9646
X-Proofpoint-GUID: 2YZZPvosN1yKmQ6B5L7DHYtVjDJuzheU
X-Proofpoint-ORIG-GUID: 2YZZPvosN1yKmQ6B5L7DHYtVjDJuzheU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_17,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307070016

DQpIaSBKYW4sDQoNCkphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4gd3JpdGVzOg0KDQo+
IE9uIDA1LjA3LjIwMjMgMTA6NTksIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+PiBPbiBXZWQs
IEp1bCAwNSwgMjAyMyBhdCAwOToxMToxMEFNICswMjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
PiBPbiAwNC4wNy4yMDIzIDIzOjAzLCBWb2xvZHlteXIgQmFiY2h1ayB3cm90ZToNCj4+Pj4gSSBh
bSBjdXJyZW50bHkgaW1wbGVtZW50aW5nIHlvdXIgcHJvcG9zYWwgKGFsb25nIHdpdGggSmFuJ3MN
Cj4+Pj4gc3VnZ2VzdGlvbnMpLCBidXQgSSBhbSBmYWNpbmcgQUJCQSBkZWFkbG9jayB3aXRoIElP
TU1VJ3MNCj4+Pj4gcmVhc3NpZ25fZGV2aWNlKCkgY2FsbCwgd2hpY2ggaGFzIHRoaXMgcGllY2Ug
b2YgY29kZToNCj4+Pj4NCj4+Pj4gICAgICAgICBsaXN0X21vdmUoJnBkZXYtPmRvbWFpbl9saXN0
LCAmdGFyZ2V0LT5wZGV2X2xpc3QpOw0KPj4+Pg0KPj4+PiBNeSBpbW1lZGlhdGUgY2hhbmdlIHdh
czoNCj4+Pj4NCj4+Pj4gICAgICAgICB3cml0ZV9sb2NrKCZwZGV2LT5kb21haW4tPnBjaV9sb2Nr
KTsNCj4+Pj4gICAgICAgICBsaXN0X2RlbCgmcGRldi0+ZG9tYWluX2xpc3QpOw0KPj4+PiAgICAg
ICAgIHdyaXRlX3VubG9jaygmcGRldi0+ZG9tYWluLT5wY2lfbG9jayk7DQo+Pj4+DQo+Pj4+ICAg
ICAgICAgd3JpdGVfbG9jaygmdGFyZ2V0LT5wY2lfbG9jayk7DQo+Pj4+ICAgICAgICAgbGlzdF9h
ZGQoJnBkZXYtPmRvbWFpbl9saXN0LCAmdGFyZ2V0LT5wZGV2X2xpc3QpOw0KPj4+PiAgICAgICAg
IHdyaXRlX3VubG9jaygmdGFyZ2V0LT5wY2lfbG9jayk7DQo+Pj4+DQo+Pj4+IEJ1dCB0aGlzIHdp
bGwgbm90IHdvcmsgYmVjYXVzZSByZWFzc2lnbl9kZXZpY2UgaXMgY2FsbGVkIGZyb20NCj4+Pj4g
cGNpX3JlbGVhc2VfZGV2aWNlcygpIHdoaWNoIGl0ZXJhdGVzIG92ZXIgZC0+cGRldl9saXN0LCBz
byB3ZSBuZWVkIHRvDQo+Pj4+IHRha2UgYSBkLT5wY2lfbG9jayBlYXJseS4NCj4+Pj4NCj4+Pj4g
QW55IHN1Z2dlc3Rpb25zIG9uIGhvdyB0byBmaXggdGhpcz8gTXkgaWRlYSBpcyB0byByZW1vdmUg
YSBkZXZpY2UgZnJvbSBhDQo+Pj4+IGxpc3Qgb25lIGF0IHRpbWU6DQo+Pj4+DQo+Pj4+IGludCBw
Y2lfcmVsZWFzZV9kZXZpY2VzKHN0cnVjdCBkb21haW4gKmQpDQo+Pj4+IHsNCj4+Pj4gICAgIHN0
cnVjdCBwY2lfZGV2ICpwZGV2Ow0KPj4+PiAgICAgdTggYnVzLCBkZXZmbjsNCj4+Pj4gICAgIGlu
dCByZXQ7DQo+Pj4+DQo+Pj4+ICAgICBwY2lkZXZzX2xvY2soKTsNCj4+Pj4gICAgIHdyaXRlX2xv
Y2soJmQtPnBjaV9sb2NrKTsNCj4+Pj4gICAgIHJldCA9IGFyY2hfcGNpX2NsZWFuX3BpcnFzKGQp
Ow0KPj4+PiAgICAgaWYgKCByZXQgKQ0KPj4+PiAgICAgew0KPj4+PiAgICAgICAgIHBjaWRldnNf
dW5sb2NrKCk7DQo+Pj4+ICAgICAgICAgd3JpdGVfdW5sb2NrKCZkLT5wY2lfbG9jayk7DQo+Pj4+
ICAgICAgICAgcmV0dXJuIHJldDsNCj4+Pj4gICAgIH0NCj4+Pj4NCj4+Pj4gICAgIHdoaWxlICgg
IWxpc3RfZW1wdHkoJmQtPnBkZXZfbGlzdCkgKQ0KPj4+PiAgICAgew0KPj4+PiAgICAgICAgIHBk
ZXYgPSBsaXN0X2VudHJ5KCZkLT5wZGV2X2xpc3QsIHN0cnVjdCBwY2lfZGV2LCBkb21haW5fbGlz
dCk7DQo+Pj4+ICAgICAgICAgYnVzID0gcGRldi0+YnVzOw0KPj4+PiAgICAgICAgIGRldmZuID0g
cGRldi0+ZGV2Zm47DQo+Pj4+ICAgICAgICAgbGlzdF9kZWwoJnBkZXYtPmRvbWFpbl9saXN0KTsN
Cj4+Pj4gICAgICAgICB3cml0ZV91bmxvY2soJmQtPnBjaV9sb2NrKTsNCj4+Pj4gICAgICAgICBy
ZXQgPSBkZWFzc2lnbl9kZXZpY2UoZCwgcGRldi0+c2VnLCBidXMsIGRldmZuKSA/OiByZXQ7DQo+
Pj4+ICAgICAgICAgd3JpdGVfbG9jaygmZC0+cGNpX2xvY2spOw0KPj4+DQo+Pj4gSSB0aGluayBp
dCBuZWVkcyBkb2luZyBhbG1vc3QgbGlrZSB0aGlzLCBidXQgd2l0aCB0d28gbW9yZSB0d2Vha3Mg
YW5kDQo+Pj4gbm8gbGlzdF9kZWwoKSByaWdodCBoZXJlIChmaXJzdCBhbmQgZm9yZW1vc3QgdG8g
YXZvaWQgbmVlZGluZyB0bw0KPj4+IGZpZ3VyZSB3aGV0aGVyIHJlbW92aW5nIGVhcmx5IGlzbid0
IGdvaW5nIHRvIHN1YnRseSBicmVhayBhbnl0aGluZzsNCj4+PiBzZWUgYmVsb3cgZm9yIGFuIGVy
cm9yIGNhc2UgdGhhdCB3b3VsZCBlbmQgdXAgd2l0aCBjaGFuZ2VkIGJlaGF2aW9yKToNCj4+Pg0K
Pj4+ICAgICB3aGlsZSAoICFsaXN0X2VtcHR5KCZkLT5wZGV2X2xpc3QpICkNCj4+PiAgICAgew0K
Pj4+ICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSBsaXN0X2ZpcnN0X2VudHJ5
KCZkLT5wZGV2X2xpc3QsIHN0cnVjdCBwY2lfZGV2LCBkb21haW5fbGlzdCk7DQo+Pj4gICAgICAg
ICB1aW50MTZfdCBzZWcgPSBwZGV2LT5zZWc7DQo+Pj4gICAgICAgICB1aW50OF90IGJ1cyA9IHBk
ZXYtPmJ1czsNCj4+PiAgICAgICAgIHVpbnQ4X3QgZGV2Zm4gPSBwZGV2LT5kZXZmbjsNCj4+Pg0K
Pj4+ICAgICAgICAgd3JpdGVfdW5sb2NrKCZkLT5wY2lfbG9jayk7DQo+PiANCj4+IEkgdGhpbmsg
eW91IG5lZWQgdG8gcmVtb3ZlIHRoZSBkZXZpY2UgZnJvbSB0aGUgcGRldl9saXN0IGJlZm9yZQ0K
Pj4gZHJvcHBpbmcgdGhlIGxvY2ssIG9yIGVsc2UgcmVsZWFzZSBjb3VsZCByYWNlIHdpdGggb3Ro
ZXIgb3BlcmF0aW9ucy4NCj4+IA0KPj4gVGhhdCdzIHVubGlrZWx5LCBidXQgc3RpbGwgaWYgdGhl
IGxvY2sgaXMgZHJvcHBlZCBhbmQgdGhlIHJvdXRpbmUNCj4+IG5lZWRzIHRvIG9wZXJhdGUgb24g
dGhlIGRldmljZSBpdCBpcyBiZXR0ZXIgcmVtb3ZlIHN1Y2ggZGV2aWNlIGZyb20NCj4+IHRoZSBk
b21haW4gc28gb3RoZXIgb3BlcmF0aW9ucyBjYW5ub3QgZ2V0IGEgcmVmZXJlbmNlIHRvIGl0Lg0K
Pj4gDQo+PiBPdGhlcndpc2UgeW91IGNvdWxkIG1vZGlmeSByZWFzc2lnbl9kZXZpY2UoKSBpbXBs
ZW1lbnRhdGlvbnMgc28gdGhleQ0KPj4gcmVxdWlyZSB0aGUgY2FsbGVyIHRvIGhvbGQgdGhlIHNv
dXJjZS0+cGNpX2xvY2sgd2hlbiBjYWxsaW5nIHRoZQ0KPj4gcm91dGluZSwgYnV0IHRoYXQncyB1
Z2x5IGJlY2F1c2UgdGhlIGxvY2sgd291bGQgbmVlZCB0byBiZSBkcm9wcGVkIGluDQo+PiBvcmRl
ciB0byByZWFzc2lnbiB0aGUgZGV2aWNlIGZyb20gc291cmNlIHRvIHRhcmdldCBkb21haW5zLg0K
Pj4gDQo+PiBBbm90aGVyIG9wdGlvbiB3b3VsZCBiZSB0byBtb3ZlIHRoZSB3aG9sZSBkLT5wZGV2
X2xpc3QgdG8gYSBsb2NhbA0KPj4gdmFyaWFibGUgKHNvIHRoYXQgZC0+cGRldl9saXN0IHdvdWxk
IGJlIGVtcHR5KSBhbmQgdGhlbiBpdGVyYXRlIG92ZXINCj4+IGl0IHdpdGhvdXQgdGhlIGQtPnBj
aV9sb2NrLiAgT24gZmFpbHVyZSB5b3Ugd291bGQgdGFrZSB0aGUgbG9jayBhbmQNCj4+IGFkZCB0
aGUgZmFpbGluZyBkZXZpY2UgYmFjayBpbnRvIGQtPnBkZXZfbGlzdC4NCj4NCj4gQ29uY2VwdHVh
bGx5IEkgbGlrZSB0aGlzIGxhc3QgdmFyaWFudCwgYnV0IGxpa2UgdGhlIGluZGl2aWR1YWwgbGlz
dF9kZWwoKQ0KPiBpdCByZXF1aXJlcyBhdWRpdGluZyBjb2RlIGZvciBubyBkZXBlbmRlbmN5IG9u
IHRoZSBkZXZpY2Ugc3RpbGwgYmVpbmcgb24NCj4gdGhhdCBsaXN0LiBJbiBmYWN0IGRlYXNzaWdu
X2RldmljZSgpJ3MgdXNlIG9mIHBjaV9nZXRfcGRldigpIGRvZXMuIFRoZQ0KPiBmdW5jdGlvbiB3
b3VsZCB0aGVuIG5lZWQgY2hhbmdpbmcgdG8gaGF2ZSBzdHJ1Y3QgcGNpX2RldiAqIHBhc3NlZCBp
bi4NCj4gWWV0IHdobyBrbm93cyB3aGVyZSBlbHNlIHRoZXJlIGFyZSB1c2VzIG9mIHBjaV9nZXRf
cGRldigpIGx1cmtpbmcuDQoNCk9rYXksIHNvIEkgY2hhbmdlZCBkZWFzc2lnbl9kZXZpY2UoKSBz
aWduYXR1cmUgYW5kIHJld29ya2VkIHRoZSBsb29wDQppbiBwY2lfcmVsZWFzZV9kZXZpY2VzKCkg
aW4gYSBzdWNoIHdheToNCg0KICAgIElOSVRfTElTVF9IRUFEKCZ0bXBfbGlzdCk7DQogICAgLyog
TW92ZSBhbGwgZW50cmllcyB0byB0bXBfbGlzdCwgc28gd2UgY2FuIGRyb3AgZC0+cGNpX2xvY2sg
Ki8NCiAgICBsaXN0X3NwbGljZV9pbml0KCZkLT5wZGV2X2xpc3QsICZ0bXBfbGlzdCk7DQogICAg
d3JpdGVfdW5sb2NrKCZkLT5wY2lfbG9jayk7DQoNCiAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5X3Nh
ZmUgKCBwZGV2LCB0bXAsICZ0bXBfbGlzdCwgZG9tYWluX2xpc3QgKQ0KICAgIHsNCiAgICAgICAg
cGRldiA9IGxpc3RfZW50cnkoJmQtPnBkZXZfbGlzdCwgc3RydWN0IHBjaV9kZXYsIGRvbWFpbl9s
aXN0KTsNCiAgICAgICAgcmMgPSBkZWFzc2lnbl9kZXZpY2UoZCwgcGRldik7DQogICAgICAgIGlm
ICggcmMgKQ0KICAgICAgICB7DQogICAgICAgICAgICAvKiBSZXR1cm4gZGV2aWNlIGJhY2sgdG8g
dGhlIGRvbWFpbiBsaXN0ICovDQogICAgICAgICAgICB3cml0ZV9sb2NrKCZkLT5wY2lfbG9jayk7
DQogICAgICAgICAgICBsaXN0X2FkZCgmcGRldi0+ZG9tYWluX2xpc3QsICZkLT5wZGV2X2xpc3Qp
Ow0KICAgICAgICAgICAgd3JpdGVfdW5sb2NrKCZkLT5wY2lfbG9jayk7DQogICAgICAgICAgICBm
dW5jX3JldCA9IHJjOw0KICAgICAgICB9DQogICAgfQ0KDQoNCkFsc28sIEkgY2hlY2tlZCBmb3Ig
YWxsIHBjaV9nZXRfcGRldigpIGNhbGxzIGFuZCBmb3VuZCB0aGF0IHN0cnVjdA0KZG9tYWluICh0
aGUgZmlyc3QgcGFyYW1ldGVyKSBpcyBwYXNzZWQgb25seSBpbiBoYW5kZnVsIG9mIHBsYWNlczoN
Cg0KKioqIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jOg0KdnBjaV9yZWFkWzUwNF0gICAgICAgICAg
ICAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoZCwgc2JkZik7DQp2cGNpX3JlYWRbNTA2XSAgICAg
ICAgICAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihkb21feGVuLCBzYmRmKTsNCnZwY2lfd3Jp
dGVbNjIxXSAgICAgICAgICAgICAgICBwZGV2ID0gcGNpX2dldF9wZGV2KGQsIHNiZGYpOw0KdnBj
aV93cml0ZVs2MjNdICAgICAgICAgICAgICAgIHBkZXYgPSBwY2lfZ2V0X3BkZXYoZG9tX3hlbiwg
c2JkZik7DQoNCioqKiB4ZW4vYXJjaC94ODYvaXJxLmM6DQptYXBfZG9tYWluX3BpcnFbMjE2Nl0g
ICAgICAgICAgcGRldiA9IHBjaV9nZXRfcGRldihkLCBtc2ktPnNiZGYpOw0KDQoqKiogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvcGNpLmM6DQpYRU5fR1VFU1RfSEFORExFX1BBUkFNWzE3MTJdICAg
cGRldiA9IHBjaV9nZXRfcGRldihkLCBtYWNoaW5lX3NiZGYpOw0KDQpUaGUgbGFzdCBvbmUgaXMg
ZHVlIHRvIG15IGNoYW5nZSB0byBkZWFzc2lnbl9kZXZpY2UoKSBzaWduYXR1cmUuDQoNCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KDQpkLT5wZGV2X2xpc3QgY2FuIGJlIGFjY2Vzc2Vk
IHRoZXJlOg0KDQoqKiogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUu
YzoNCnJlYXNzaWduX2RldmljZVs0ODldICAgICAgICAgICBsaXN0X2FkZCgmcGRldi0+ZG9tYWlu
X2xpc3QsICZ0YXJnZXQtPnBkZXZfbGlzdCk7DQoNCioqKiB4ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYzoNCl9wY2lfaGlkZV9kZXZpY2VbNDYzXSAgICAgICAgICBsaXN0X2FkZCgmcGRldi0+
ZG9tYWluX2xpc3QsICZkb21feGVuLT5wZGV2X2xpc3QpOw0KcGNpX2dldF9wZGV2WzU2MV0gICAg
ICAgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmZC0+cGRldl9saXN0LCBkb21h
aW5fbGlzdCApDQpwY2lfYWRkX2RldmljZVs3NTldICAgICAgICAgICAgbGlzdF9hZGQoJnBkZXYt
PmRvbWFpbl9saXN0LCAmaGFyZHdhcmVfZG9tYWluLT5wZGV2X2xpc3QpOw0KcGNpX3JlbGVhc2Vf
ZGV2aWNlc1s5MTddICAgICAgIGxpc3Rfc3BsaWNlX2luaXQoJmQtPnBkZXZfbGlzdCwgJnRtcF9s
aXN0KTsNCnBjaV9yZWxlYXNlX2RldmljZXNbOTIyXSAgICAgICBwZGV2ID0gbGlzdF9lbnRyeSgm
ZC0+cGRldl9saXN0LCBzdHJ1Y3QgcGNpX2RldiwgZG9tYWluX2xpc3QpOw0KcGNpX3JlbGVhc2Vf
ZGV2aWNlc1s5MjhdICAgICAgIGxpc3RfYWRkKCZwZGV2LT5kb21haW5fbGlzdCwgJmQtPnBkZXZf
bGlzdCk7DQpfc2V0dXBfaHdkb21fcGNpX2RldmljZXNbMTE1NV0gbGlzdF9hZGQoJnBkZXYtPmRv
bWFpbl9saXN0LCAmY3R4dC0+ZC0+cGRldl9saXN0KTsNCg0KKioqIHhlbi9kcml2ZXJzL3Bhc3N0
aHJvdWdoL3Z0ZC9pb21tdS5jOg0KcmVhc3NpZ25fZGV2aWNlX293bmVyc2hpcFsyODE5XSBsaXN0
X2FkZCgmcGRldi0+ZG9tYWluX2xpc3QsICZ0YXJnZXQtPnBkZXZfbGlzdCk7DQoNCioqKiB4ZW4v
aW5jbHVkZS94ZW4vcGNpLmg6DQpmb3JfZWFjaF9wZGV2WzE0OV0gICAgICAgICAgICAgbGlzdF9m
b3JfZWFjaF9lbnRyeShwZGV2LCAmKGRvbWFpbiktPnBkZXZfbGlzdCwgZG9tYWluX2xpc3QpDQpo
YXNfYXJjaF9wZGV2c1sxNTFdICAgICAgICAgICAgI2RlZmluZSBoYXNfYXJjaF9wZGV2cyhkKSAo
IWxpc3RfZW1wdHkoJihkKS0+cGRldl9saXN0KSkNCg0KPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09DQoNCkFuZCBoYXNfYXJjaF9wZGV2cygpIGlzIHVzZWQgdGhlcmU6DQoNCioqKiB4ZW4v
YXJjaC94ODYvaHZtL2h2bS5jOg0KaHZtX3NldF9jcjBbMjM4OF0gICAgICAgICAgICAgIGhhc19h
cmNoX3BkZXZzKGQpKSApDQoNCioqKiB4ZW4vYXJjaC94ODYvaHZtL3ZteC92bWNzLmM6DQp2bXhf
ZG9fcmVzdW1lWzE4OTJdICAgICAgICAgICAgaWYgKCBoYXNfYXJjaF9wZGV2cyh2LT5kb21haW4p
ICYmICFpb21tdV9zbm9vcA0KDQoqKiogeGVuL2FyY2gveDg2L21tLmM6DQpsMV9kaXNhbGxvd19t
YXNrWzE3Ml0gICAgICAgICAgIWhhc19hcmNoX3BkZXZzKGQpICYmIFwNCg0KKioqIHhlbi9hcmNo
L3g4Ni9tbS9wMm0tcG9kLmM6DQpwMm1fcG9kX3NldF9tZW1fdGFyZ2V0WzM1Ml0gICAgaWYgKCBo
YXNfYXJjaF9wZGV2cyhkKSB8fCBjYWNoZV9mbHVzaF9wZXJtaXR0ZWQoZCkgKQ0KZ3Vlc3RfcGh5
c21hcF9tYXJrX3BvcHVsYXRlX29uX2RlbWFuZFsxNDA0XSBpZiAoIGhhc19hcmNoX3BkZXZzKGQp
IHx8IGNhY2hlX2ZsdXNoX3Blcm1pdHRlZChkKSApDQoNCioqKiB4ZW4vYXJjaC94ODYvbW0vcGFn
aW5nLmM6DQpwYWdpbmdfbG9nX2RpcnR5X2VuYWJsZVsyMDhdICAgaWYgKCBoYXNfYXJjaF9wZGV2
cyhkKSApDQoNCioqKiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYzoNCnJlYXNz
aWduX2RldmljZV9vd25lcnNoaXBbMjc3M10gaWYgKCAhaGFzX2FyY2hfcGRldnModGFyZ2V0KSAp
DQpyZWFzc2lnbl9kZXZpY2Vfb3duZXJzaGlwWzI4MDddIGlmICggIWhhc19hcmNoX3BkZXZzKHRh
cmdldCkgKQ0KcmVhc3NpZ25fZGV2aWNlX293bmVyc2hpcFsyODI1XSBpZiAoICFoYXNfYXJjaF9w
ZGV2cyhzb3VyY2UpICkNCg0KDQpoYXNfYXJjaF9wZGV2cygpIGJvdGhlcnMgbWUgbW9zdCwgYWN0
dWFsbHksIGJlY2F1c2UgaXQgaXMgbm90IGFsd2F5cw0Kb2J2aW91cyBob3cgdG8gYWRkIGxvY2tp
bmcgZm9yIHRoZSBjYWxsZXJzLiBJIGFtIHBsYW5uaW5nIHRvIHJld29yayBpdA0KaW4gdGhlIGZv
bGxvd2luZyB3YXk6DQoNCiNkZWZpbmUgaGFzX2FyY2hfcGRldnNfdW5sb2NrZWQoZCkgKCFsaXN0
X2VtcHR5KCYoZCktPnBkZXZfbGlzdCkpDQoNCnN0YXRpYyBpbmxpbmUgYm9vbCBoYXNfYXJjaF9w
ZGV2cyhzdHJ1Y3QgZG9tYWluICpkKQ0Kew0KICAgIGJvb2wgcmV0Ow0KDQogICAgcmVhZF9sb2Nr
KCZkLT5wY2lfbG9jayk7DQogICAgcmV0ID0gaGFzX2FyY2hfcGRldnNfdW5sb2NrZWQoZCk7DQog
ICAgcmVhZF91bmxvY2soJmQtPnBjaV9sb2NrKTsNCg0KICAgIHJldHVybiByZXQ7DQp9DQoNCkFu
ZCB0aGVuIHVzZSBhcHByb3ByaWF0ZSBtYWNyby9mdW5jdGlvbiBkZXBlbmRpbmcgb24gY2lyY3Vt
c3RhbmNlcy4NCg0KDQotLSANCldCUiwgVm9sb2R5bXly

