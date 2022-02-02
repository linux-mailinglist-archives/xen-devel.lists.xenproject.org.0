Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDA04A6CDC
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 09:24:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263836.456679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFAva-0000YY-Ch; Wed, 02 Feb 2022 08:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263836.456679; Wed, 02 Feb 2022 08:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFAva-0000WD-8p; Wed, 02 Feb 2022 08:23:46 +0000
Received: by outflank-mailman (input) for mailman id 263836;
 Wed, 02 Feb 2022 08:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFAvY-0000W7-5X
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 08:23:44 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6d2ba473-8401-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 09:23:42 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2128Muhs010498;
 Wed, 2 Feb 2022 08:23:37 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyp38r1mc-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 08:23:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VE1PR03MB5568.eurprd03.prod.outlook.com (2603:10a6:803:11a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Wed, 2 Feb
 2022 08:23:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 08:23:32 +0000
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
X-Inumbo-ID: 6d2ba473-8401-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHcM9/9sVGB5t6y0lLxaik5ZftcBpZIlug+UdWtwIbxb+FQ+g4MGag2ZzDOcCyc8OYGym/ALRVrxWYFsXt2EhYQdJPjyoTCuG06W3cRgW6a9o8+MKKSO+7q248HaSMguqCn6DNaXq29GNPWCaXfXVjnvDXgc2ZGNT9QfIso+kddIXEofF8FK0d0MeqPRImHIhJDVNTIkOOJH8UUYPYkSmhNaBHmdKtmSXCqNOO5zl1XNax3f0mEIHz+IUUP4vyRQmbnC7fX1aoSt0KzCgms1LhKfiLCIobmWivtFq2V3R5akjWAsB/ahBczu2g8V70ZnCoLUgnNodLPpFtkTZV+9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLB2xqn41dMA3V0oLXKQ/veiWOKFctfhomoTghrNCiE=;
 b=E2ZXeDT81f3GMJ3c8VeOItmT0sjpXbuxbaO8lPibmcv0UkMz9KwOX4rCTqTeNMRm0K4yODje+on50WBUZ/zeIYMl2oV8UZnWnden/FMNCLU5a/enbe2V7p0r/QnDLqmu3K4GRuB/tLqxNnubwXav+BC9+qpru2XGRGv+gOM/cYidgEddz8XihWsv+A63AkHUAp6cbr8mGbp5sFWFvdC4iSBPIFm9yfqY05VgHPnf+Wo+yuZmADoikLXraQo8IP6BrTCQcj8S5Nro3q0bUWNVKVUN9MRx037xJru+8tkCjSbGgl/5WhRYA2t77uANdsJI64aVmylPb7MXULPeRzQnzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLB2xqn41dMA3V0oLXKQ/veiWOKFctfhomoTghrNCiE=;
 b=DKbWfVxipmBegW40ukzObeUdiSbUIkMhDTEknXOT+1Tg9IkVb1biXzlaCILeSAGcOEcaNC0JWloE+zLGwQbgQEQFvAtAHsmUtvjV+hHL5WlctLIlP4diEnTzCQ9AZ5T8tcCwCy63GbV8sfoqxy+ksto/a4LeKUOw4hLWOLWhHU3ha8tUVKANTSnWnQWjnp7JDGGcKuoJqKkEsJvnkFcuDd6yfiGzGUTGpxKG/zmLeA0fw6myFbkEpoKN0+bHxucO5Ce10HnSpagbmj5N4RKR1QJWHquSur/Z1IDFTHEGgKU4gXIOMRInWl0L7QpobHxKaqVwhwY9kghD3XQ2uHmAtw==
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
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Topic: [PATCH v5 08/14] vpci/header: program p2m with guest BAR view
Thread-Index: AQHX4ewInH3i1A85zUqSOqe7J03BoaxhCwuAgB9Nb4A=
Date: Wed, 2 Feb 2022 08:23:32 +0000
Message-ID: <37c2374d-c0f7-23b6-d2f8-e94d1348807c@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-9-andr2000@gmail.com> <Yd/9W7GFO51GE0ch@Air-de-Roger>
In-Reply-To: <Yd/9W7GFO51GE0ch@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a99a6232-fbae-49b6-6696-08d9e6254ceb
x-ms-traffictypediagnostic: VE1PR03MB5568:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VE1PR03MB5568E904F24D282367135FF0E7279@VE1PR03MB5568.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FtOTmkgGHYQaHm35VKOYWDeJtr+cIRinq7x16s6dNzjrAssp/rjSvy93noxeOYxYKq2MfA7j07uIqWUHiKmlszwffDUdj2gh/DyTY3I/T2gOFJJ0F0+0mzTABtjnC+S6YenmkQVIxxZD3dUzFgqyRWloJ7p+E5YbljVfLTTVfiyAspvwWDGpVHtH0YXxYOhX3ihXGOmZ9QOToFdyBTpLHQykXOii8GOw29pwazC10oYpMeNRY/zHVMv6dPBiwdJoxAquo9SIR42UI6aT2/mgJUpBfzr0VWrC1PfMlD0eeIW3Y/jwXLFtQbFWX5FIMw2nNGfLn/Se//fDPw0eLosRXB2WYCSCN9AYuJUEsZEZOq6BdqXzfVVbgxBimT0w57hLzD0LhWwTtjiDJfTBfoIzPLv+D24nzPJhmCjyIUTFeVFvGKlYmJqZdjzeR17Ffga+YKQoqBulBVqPhQke1m9zclF/US70M3AO/LwZtrtqYMujckr8uuis5fGf56izzdRTsUVfJGc+BHrpy8/lHApHgHuwAhkES0YMlM+Sq7IEcOLYjJ72BWtdC79Gqirh5WqBSF9UBGuVVhY0WJxfwDqwgM3V4/0+NT0ITcXbn2r9MH4eVFEvDIYqZ+EXQ6WNYgSL5bR9+XlOle/fvQh2F7t5GFOVb3BTUvD7hIxveQISHDOa6cVQNVzJQO/Kd02eL913DW/YbEb6gwZzJ0YEgf/pt46sPHQd0CCwzColS/4rNCLu9psI7xgHkWamXqicWd0OXKHAdHT2gUYVW3QEb1+kakUwk0despclyXlZ1zL/zeU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31686004)(316002)(6916009)(54906003)(31696002)(508600001)(86362001)(7416002)(38070700005)(36756003)(122000001)(38100700002)(6486002)(66946007)(107886003)(8936002)(66556008)(2906002)(186003)(66446008)(26005)(4326008)(8676002)(53546011)(71200400001)(91956017)(66476007)(76116006)(5660300002)(2616005)(6512007)(64756008)(83380400001)(6506007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dlpOb25HdzJvZXdsZHRZR05FRVcramFDT2pSd0Rqd3lzMks3U1JEam9BaC92?=
 =?utf-8?B?K1QzT09VTEdiZ3BxRWNLUlQ0RjNFczdKeWd1aHBZcEg3R282L1BrVnJ1ampG?=
 =?utf-8?B?ZGIyVkdmMWExd3daSkFrTU94K2V2Z0pFMjBaSTYyb1dQUkxCUkh1RE16TkRR?=
 =?utf-8?B?Q2srRGp2blBBbEVnNUpMd1R1NHdCeXhWRGZNeXMxMXRUb0RQSGZZcU1qRWE2?=
 =?utf-8?B?K3NxbUhOYXRCc3pDRXUwckplbzk2WkhlUnZROXZJMXRsU0VDT3NJYUNBR2VD?=
 =?utf-8?B?N0VpZ1lxN3hnRFFpZTZWRmxkdnVNeDNneEk0a2J3d3RGR3F4Z2NEWWtiakpN?=
 =?utf-8?B?Q21lSWJ5UkNFbXpoNFgybHJoLzZCd251L3lMQzNwTFlUSmdWWDFXWFJYcldH?=
 =?utf-8?B?aXJDbEVjbWN1RENVa216WEVEa0lTZ2trNWZWclltUUk2Vjc4N3Qvc3haLzdG?=
 =?utf-8?B?OU5CNjVtRENQcHZMem92RXl3VzBVOWlkU2NRYk1UUmhzRzRRdFltUXdQR3hq?=
 =?utf-8?B?RmYxa3A3b2t4K0huR2Vhak1sN1JCQnZ6OHpEMVBCdkRzUVRrbkxFdWxrdXcv?=
 =?utf-8?B?c1F3U2ZPdDhCUERnblgxTlFTeFRJUDlqL1JsS21pOTE4ZWJkalVMdm9uYW90?=
 =?utf-8?B?YlZzVlI0eFZ0ZjZiVWZsZEVhY3Q1SFJmZGlWRmFkMWp1VEc3QzBjWllRYjVx?=
 =?utf-8?B?TmVreFhPOGU5MllVbVFZVnNHQ2pZNm02Q1N6WVdyS2hlMitVdllRb2x3Q0h5?=
 =?utf-8?B?N21tSk45STdzbkM2QVZCRUJNNERoVFZpZ3IrOGNGN2I1MUZrQktXaXpEVzlw?=
 =?utf-8?B?dEM2RmdJM0VqdTcxQktMTFFKa0huN21ieGxPNHZ4Z2dJY3dLMjhzankyQTdC?=
 =?utf-8?B?c01aY2g4TTFvdHVEcUpoNUxSaTBIMWpKbmRtS3VqSDhTYUN6MkI0d0czMW5z?=
 =?utf-8?B?VzU1VTRQRXM3eExhcm5UcU9NQjRRRWtWK0NidU81Qk5KeExremxFN3ppK1FC?=
 =?utf-8?B?blkxR3RZVm1lb0xrNVBOWm9sVmtsdUE1TkEwaWNHVk9DNHlLVGU3eGs3UGh3?=
 =?utf-8?B?UFplSVI0NWZhWG1VZlpwa1dSNTA3OVROazNtenNacGM1MU9waGJVSFdidzdX?=
 =?utf-8?B?VldBVEJSdllZcVNzQkZaVVJ4ZGhVcWU2TDVHMEZnaXFqME9xWFJCVHV2WDF4?=
 =?utf-8?B?K0tZSFB5Z2xNZXVMcllSM001dWV6QmVOc1pYdVpYQVcxcmpYVmh4RUU4eUVR?=
 =?utf-8?B?Z0NDWXlycEhBQzdyRTd3U3RqZmkvbXl3K0FTaTZhb0cxeW5Xd1VpUVV0cHhL?=
 =?utf-8?B?KytsRUpRdkI1Q3Q4V0xOeUhYamNJeXMxWmNTcDBTS3JZM3hDcjFpWE5VUjdF?=
 =?utf-8?B?SXczVlZaZVVXdXRsR3lOMi8raWZaTVhFN3h5QzVQWFFLY0dpTlBJc01KQ1Z2?=
 =?utf-8?B?eWFRcGpmdVBDVmRHL3hTeTZpNmVBK0VpMjhISGJMVXVvd2w0a0J3aHYyOGFP?=
 =?utf-8?B?RTZKRjdvNlNhRWl5TWpORnNwVUpDVHYvYXRvMC9NTTFmQThkR0U5ZTJRTmRx?=
 =?utf-8?B?U1FrSjBnRjJTb3A4Q0Z1VGhNWmJ5NjZ0K0FUN3BUbk5jS3dKcVE3bGdoNFlj?=
 =?utf-8?B?Sm44dENVeEw0SkU0ZndLZDg4blBETmZNa05NOWlMckNnV0puZlZNMzgvMERU?=
 =?utf-8?B?b3JLTjFZR0FHSTZrOGpEQTdLOU12OE81dFlnM1Y4S2ptbll0bU51R2ZLYXdB?=
 =?utf-8?B?NGVJeTJCWGNCUzVEOUFZaVBnaVRRM2ZIdlNMN0k4a250STZMdk1HcEpIaE1l?=
 =?utf-8?B?amNwSkNNZlpFTGlHTzIyUWpEblVLWkh5RW1RYkxaYk5jQmczZDU0L1dvRkhB?=
 =?utf-8?B?M2E3YVBOdmp1eXoxSC8wL1V0NGFvOWpzREhVcFZYRGp4OFFwd052U0VmTlZB?=
 =?utf-8?B?SmIxdHN3MXE0NEliQkRDMElXSmZZdnZBR3V5TDcxVklwSEpXSGlINEg3NWI2?=
 =?utf-8?B?TWpJWWNRY2VsQlExampRU3lTTFBMcHAvR0FOMjRqSmRaRkhNNkd6bVVZNFlh?=
 =?utf-8?B?R3lhSFB3a01iOFZtbU13SS9MaXpGSUNsZWRFdzd1ZWViS3F5SDhzRytYQXpr?=
 =?utf-8?B?V0w1Q3M1emhhVUdqRXdWd0NmR0hHMHJCNVdnNUR2YTV0N1YwTFExQkpnS3NI?=
 =?utf-8?B?QlRpS3NyZzVHblVVSGh5TVlIVFowRG5jYmExWXlxa3FpZno5b2VzQjdTZitl?=
 =?utf-8?B?UTZzZFVTaXNRRGNueTVReWVVclFMR2U4QTRFa3lJOHRlbzVqZG1YR1V2c1dU?=
 =?utf-8?B?S1BhZCt2QWlVN29YNHErK2J2RzNaWkl6djBzNWxiZmhQUk0rVGNEQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FDDECC986CE42E4080AB80F54777B7FA@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a99a6232-fbae-49b6-6696-08d9e6254ceb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 08:23:32.7372
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jh072d5CrUkY13hunhuLo4f4RuwKm3t6/s9mOdotJ9wNIL4UGHFHKagQLIiYs9CyKwWdTIL3zIPOdRBOmPvZGTvKUbgmFeuLMshC8vVx63xQhlZY7hNpltvs8nJgAFwm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5568
X-Proofpoint-ORIG-GUID: mxSjUUYPFUpTwzcrL-LzHeVRtVzm34Nt
X-Proofpoint-GUID: mxSjUUYPFUpTwzcrL-LzHeVRtVzm34Nt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020042

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxMjoyMiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDVQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gVGFrZSBpbnRvIGFjY291bnQg
Z3Vlc3QncyBCQVIgdmlldyBhbmQgcHJvZ3JhbSBpdHMgcDJtIGFjY29yZGluZ2x5Og0KPj4gZ2Zu
IGlzIGd1ZXN0J3MgdmlldyBvZiB0aGUgQkFSIGFuZCBtZm4gaXMgdGhlIHBoeXNpY2FsIEJBUiB2
YWx1ZSBhcyBzZXQNCj4+IHVwIGJ5IHRoZSBQQ0kgYnVzIGRyaXZlciBpbiB0aGUgaGFyZHdhcmUg
ZG9tYWluLg0KPj4gVGhpcyB3YXkgaGFyZHdhcmUgZG9tYWluIHNlZXMgcGh5c2ljYWwgQkFSIHZh
bHVlcyBhbmQgZ3Vlc3Qgc2Vlcw0KPj4gZW11bGF0ZWQgb25lcy4NCj4+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBh
bS5jb20+DQo+PiAtLS0NCj4+IFNpbmNlIHY0Og0KPj4gLSBtb3ZlZCBzdGFydF97Z2ZufG1mbn0g
Y2FsY3VsYXRpb24gaW50byBtYXBfcmFuZ2UNCj4+IC0gcGFzcyB2cGNpX2JhciBpbiB0aGUgbWFw
X2RhdGEgaW5zdGVhZCBvZiBzdGFydF97Z2ZufG1mbn0NCj4+IC0gcy9ndWVzdF9hZGRyL2d1ZXN0
X3JlZw0KPj4gU2luY2UgdjM6DQo+PiAtIHVwZGF0ZWQgY29tbWVudCAoUm9nZXIpDQo+PiAtIHJl
bW92ZWQgZ2ZuX2FkZChtYXAtPnN0YXJ0X2dmbiwgcmMpOyB3aGljaCBpcyB3cm9uZw0KPj4gLSB1
c2Ugdi0+ZG9tYWluIGluc3RlYWQgb2Ygdi0+dnBjaS5wZGV2LT5kb21haW4NCj4+IC0gcmVtb3Zl
ZCBvZGQgZS5nLiBpbiBjb21tZW50DQo+PiAtIHMvZCVkLyVwZCBpbiBhbHRlcmVkIGNvZGUNCj4+
IC0gdXNlIGdkcHJpbnRrIGZvciBtYXAvdW5tYXAgbG9ncw0KPj4gU2luY2UgdjI6DQo+PiAtIGlt
cHJvdmUgcmVhZGFiaWxpdHkgZm9yIGRhdGEuc3RhcnRfZ2ZuIGFuZCByZXN0cnVjdHVyZSA/OiBj
b25zdHJ1Y3QNCj4+IFNpbmNlIHYxOg0KPj4gICAtIHMvTVNJL01TSS1YIGluIGNvbW1lbnRzDQo+
Pg0KPj4gLS0tDQo+PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDMwICsr
KysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5z
ZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvdnBjaS9oZWFkZXIuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+IGluZGV4IGNj
NDlhYTY4ODg2Zi4uYjA0OTlkMzJjNWQ4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYw0KPj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4gQEAgLTMw
LDYgKzMwLDcgQEANCj4+ICAgDQo+PiAgIHN0cnVjdCBtYXBfZGF0YSB7DQo+PiAgICAgICBzdHJ1
Y3QgZG9tYWluICpkOw0KPj4gKyAgICBjb25zdCBzdHJ1Y3QgdnBjaV9iYXIgKmJhcjsNCj4+ICAg
ICAgIGJvb2wgbWFwOw0KPj4gICB9Ow0KPj4gICANCj4+IEBAIC00MSw4ICs0MiwyNSBAQCBzdGF0
aWMgaW50IG1hcF9yYW5nZSh1bnNpZ25lZCBsb25nIHMsIHVuc2lnbmVkIGxvbmcgZSwgdm9pZCAq
ZGF0YSwNCj4+ICAgDQo+PiAgICAgICBmb3IgKCA7IDsgKQ0KPj4gICAgICAgew0KPj4gKyAgICAg
ICAgLyogU3RhcnQgYWRkcmVzcyBvZiB0aGUgQkFSIGFzIHNlZW4gYnkgdGhlIGd1ZXN0LiAqLw0K
Pj4gKyAgICAgICAgZ2ZuX3Qgc3RhcnRfZ2ZuID0gX2dmbihQRk5fRE9XTihpc19oYXJkd2FyZV9k
b21haW4obWFwLT5kKQ0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICA/IG1hcC0+YmFyLT5hZGRyDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDogbWFwLT5iYXItPmd1ZXN0X3JlZykpOw0KPj4gKyAgICAgICAgLyogUGh5c2ljYWwg
c3RhcnQgYWRkcmVzcyBvZiB0aGUgQkFSLiAqLw0KPj4gKyAgICAgICAgbWZuX3Qgc3RhcnRfbWZu
ID0gX21mbihQRk5fRE9XTihtYXAtPmJhci0+YWRkcikpOw0KPj4gICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgc2l6ZSA9IGUgLSBzICsgMTsNCj4+ICAgDQo+PiArICAgICAgICAvKg0KPj4gKyAgICAg
ICAgICogUmFuZ2VzIHRvIGJlIG1hcHBlZCBkb24ndCBhbHdheXMgc3RhcnQgYXQgdGhlIEJBUiBz
dGFydCBhZGRyZXNzLCBhcw0KPj4gKyAgICAgICAgICogdGhlcmUgY2FuIGJlIGhvbGVzIG9yIHBh
cnRpYWxseSBjb25zdW1lZCByYW5nZXMuIEFjY291bnQgZm9yIHRoZQ0KPj4gKyAgICAgICAgICog
b2Zmc2V0IG9mIHRoZSBjdXJyZW50IGFkZHJlc3MgZnJvbSB0aGUgQkFSIHN0YXJ0Lg0KPj4gKyAg
ICAgICAgICovDQo+PiArICAgICAgICBzdGFydF9nZm4gPSBnZm5fYWRkKHN0YXJ0X2dmbiwgcyAt
IG1mbl94KHN0YXJ0X21mbikpOw0KPiBXaGVuIGRvaW5nIGd1ZXN0cyBtYXBwaW5ncyB0aGUgcmFu
Z2VzZXQgc2hvdWxkIHJlcHJlc2VudCB0aGUgZ3Vlc3QNCj4gcGh5c2ljYWwgbWVtb3J5IHNwYWNl
LCBub3QgdGhlIGhvc3Qgb25lLg0KU28sIGl0IGRvZXMNCj4gICBTbyB0aGF0IGNvbGxpc2lvbnMg
aW4gdGhlDQo+IGd1ZXN0IHAybSBjYW4gYmUgYXZvaWRlZC4gQWxzbyBhIGd1ZXN0IHNob3VsZCBi
ZSBhbGxvd2VkIHRvIG1hcCB0aGUNCj4gc2FtZSBtZm4gaW50byBtdWx0aXBsZSBnZm4uIEZvciBl
eGFtcGxlIG11bHRpcGxlIEJBUnMgY291bGQgc2hhcmUgdGhlDQo+IHNhbWUgcGh5c2ljYWwgcGFn
ZSBvbiB0aGUgaG9zdCBhbmQgdGhlIGd1ZXN0IG1pZ2h0IGxpa2UgdG8gbWFwIHRoZW0gYXQNCj4g
ZGlmZmVyZW50IHBhZ2VzIGluIGl0J3MgcGh5c21hcC4NClRoZXJlIGlzIG5vIHN1Y2ggcmVzdHJp
Y3Rpb24gaW1wb3NlZA0KPg0KPj4gKw0KPj4gKyAgICAgICAgZ2RwcmludGsoWEVOTE9HX0dfREVC
VUcsDQo+PiArICAgICAgICAgICAgICAgICAiJXNtYXAgWyVseCwgJWx4XSAtPiAlIyJQUklfZ2Zu
IiBmb3IgJXBkXG4iLA0KPj4gKyAgICAgICAgICAgICAgICAgbWFwLT5tYXAgPyAiIiA6ICJ1biIs
IHMsIGUsIGdmbl94KHN0YXJ0X2dmbiksDQo+PiArICAgICAgICAgICAgICAgICBtYXAtPmQpOw0K
PiBUaGF0J3MgdG9vIGNoYXR0eSBJTU8sIEkgY291bGQgYmUgZmluZSB3aXRoIHByaW50aW5nIHNv
bWV0aGluZyBhbG9uZw0KPiB0aGlzIGxpbmVzIGZyb20gbW9kaWZ5X2JhcnMsIGJ1dCBub3QgaGVy
ZSBiZWNhdXNlIHRoYXQgZnVuY3Rpb24gY2FuIGJlDQo+IHByZWVtcHRlZCBhbmQgY2FsbGVkIG11
bHRpcGxlIHRpbWVzLg0KT2ssIHdpbGwgbW92ZSB0byBtb2RpZnlfYmFycyBhcyB0aGVzZSBwcmlu
dHMgYXJlIHJlYWxseSBoZWxwZnVsIGZvciBkZWJ1Zw0KPg0KPj4gICAgICAgICAgIC8qDQo+PiAg
ICAgICAgICAgICogQVJNIFRPRE9zOg0KPj4gICAgICAgICAgICAqIC0gT24gQVJNIHdoZXRoZXIg
dGhlIG1lbW9yeSBpcyBwcmVmZXRjaGFibGUgb3Igbm90IHNob3VsZCBiZSBwYXNzZWQNCj4+IEBA
IC01Miw4ICs3MCwxMCBAQCBzdGF0aWMgaW50IG1hcF9yYW5nZSh1bnNpZ25lZCBsb25nIHMsIHVu
c2lnbmVkIGxvbmcgZSwgdm9pZCAqZGF0YSwNCj4+ICAgICAgICAgICAgKiAtIHt1bn1tYXBfbW1p
b19yZWdpb25zIGRvZXNuJ3Qgc3VwcG9ydCBwcmVlbXB0aW9uLg0KPj4gICAgICAgICAgICAqLw0K
Pj4gICANCj4+IC0gICAgICAgIHJjID0gbWFwLT5tYXAgPyBtYXBfbW1pb19yZWdpb25zKG1hcC0+
ZCwgX2dmbihzKSwgc2l6ZSwgX21mbihzKSkNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgOiB1
bm1hcF9tbWlvX3JlZ2lvbnMobWFwLT5kLCBfZ2ZuKHMpLCBzaXplLCBfbWZuKHMpKTsNCj4+ICsg
ICAgICAgIHJjID0gbWFwLT5tYXAgPyBtYXBfbW1pb19yZWdpb25zKG1hcC0+ZCwgc3RhcnRfZ2Zu
LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZSwgX21m
bihzKSkNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgOiB1bm1hcF9tbWlvX3JlZ2lvbnMobWFw
LT5kLCBzdGFydF9nZm4sDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNpemUsIF9tZm4ocykpOw0KPj4gICAgICAgICAgIGlmICggcmMgPT0gMCApDQo+PiAg
ICAgICAgICAgew0KPj4gICAgICAgICAgICAgICAqYyArPSBzaXplOw0KPj4gQEAgLTYyLDggKzgy
LDggQEAgc3RhdGljIGludCBtYXBfcmFuZ2UodW5zaWduZWQgbG9uZyBzLCB1bnNpZ25lZCBsb25n
IGUsIHZvaWQgKmRhdGEsDQo+PiAgICAgICAgICAgaWYgKCByYyA8IDAgKQ0KPj4gICAgICAgICAg
IHsNCj4+ICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcNCj4+IC0gICAgICAg
ICAgICAgICAgICAgIkZhaWxlZCB0byBpZGVudGl0eSAlc21hcCBbJWx4LCAlbHhdIGZvciBkJWQ6
ICVkXG4iLA0KPj4gLSAgICAgICAgICAgICAgICAgICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywg
ZSwgbWFwLT5kLT5kb21haW5faWQsIHJjKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgIkZhaWxl
ZCB0byBpZGVudGl0eSAlc21hcCBbJWx4LCAlbHhdIGZvciAlcGQ6ICVkXG4iLA0KPj4gKyAgICAg
ICAgICAgICAgICAgICBtYXAtPm1hcCA/ICIiIDogInVuIiwgcywgZSwgbWFwLT5kLCByYyk7DQo+
IFlvdSBuZWVkIHRvIGFkanVzdCB0aGUgbWVzc2FnZSBoZXJlLCBhcyB0aGlzIGlzIG5vIGxvbmdl
ciBhbiBpZGVudGl0eQ0KPiBtYXAgZm9yIGRvbVVzLg0KU3VyZQ0KPg0KPiBUaGFua3MsIFJvZ2Vy
Lg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

