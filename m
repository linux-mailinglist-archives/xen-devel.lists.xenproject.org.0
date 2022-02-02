Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8C34A715D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:18:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264149.457144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFWW-0007rO-GM; Wed, 02 Feb 2022 13:18:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264149.457144; Wed, 02 Feb 2022 13:18:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFWW-0007oU-DB; Wed, 02 Feb 2022 13:18:12 +0000
Received: by outflank-mailman (input) for mailman id 264149;
 Wed, 02 Feb 2022 13:18:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFFWV-0007oO-J8
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:18:11 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 908bc752-842a-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:18:10 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212CsOnK025015;
 Wed, 2 Feb 2022 13:17:51 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2055.outbound.protection.outlook.com [104.47.4.55])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dytc5845b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:17:51 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5489.eurprd03.prod.outlook.com (2603:10a6:208:177::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:17:47 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:17:47 +0000
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
X-Inumbo-ID: 908bc752-842a-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgmVJXvuL101P17SBuCJsEiyd0NUEuZhSLPjrCIkDNPPy1AcbKGWndePjTl6MF3VJuOYPRI3BWFb5mZ3pwCXZS6A6JKSNoX/lrOpGnuke6ouaxXXLlDsea5LzFzR8pNGI1R6HuUoNy2WRmC/7K/Fw74JY4Sz6X1UACySKb3sSYyKcRUupfShtq5X6MGZk4W592h6/+GcsTObt4Mi8GsawLU0lrwSDEe6fnhwXDzzxYgwMF0WuOvn3tiUuw5ozqS2JxSk26FHcfW0LgrTwg1szTc6JnP4mUSn4CzTzNZK4/For0qXNvPkDpJinLMbat7Bs1LFXmOti0vE6CrdLN7jbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efJJ31+sbdYb5kwxlWVyHEgE5bPdrJf6sXYHflpwslQ=;
 b=ceNtzHTGoup0EsSASLVx162hdFVDvxgVuHjjmMty9JHRZXVoN7vhId2SyUZIoBIlDyFfCvfZYTX/jrOu9nOaJPqvdMyEaTVOCXzd152yo+3Sc36B1+L03Nh4AZPfTBg9L79J/e4iqOY1Tvmy37fGqE+FDrmJufEHIGbtFdZkfww2R5E7ZLu2en1m0EczOS7svt6dSY+OnGf8ew86nmE92NOgldkXwWRy7vKRjPLxtR2eavdLi3rDPwhRuTt2TfUTErlEY3jExExpDLR2DPXWLpZWx6b4E+GiHA2HKzIFn01J9dmGaz710SO2KdRgsTn1JUqGajv/E++JmWxH6CA2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efJJ31+sbdYb5kwxlWVyHEgE5bPdrJf6sXYHflpwslQ=;
 b=NZ3Iv9XXcl9omdRYtSRxFYj3VK9Jgc8+uhWI5iXXVYPu/m9OuYUXq/8+iCKZXHY/db5URo3BvieB8MyxBwClzT9Iawwi+kScvOrgLfUM4l/Qcs1rET4Dcy8sbukrY3y5w/mb6YBvd6j6X6iXs3MvvK8FSZu+uzSJ1TrM2XtVm0ey3qDisCdAfgQFgVRzeaan7dovSChoQutP1LY/fdEGZpZuPuix8bs6zbmadpNzOe1vYA9d0lYvYQve0lZoUVEE3m36/iubtOa8MXqCLhqJ1tJW0EheUWX6JM4cQBd1goZ/zRfrb8BpjA7IYXFUHglEE1HkwTw5fzvz3aF4D3C1SQ==
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
Subject: Re: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v5 11/14] vpci: add initial support for virtual PCI bus
 topology
Thread-Index: AQHX4ewLCr4mT3CEwkeKGdBUjNnfXqxhH4IAgB+LLwA=
Date: Wed, 2 Feb 2022 13:17:47 +0000
Message-ID: <d5101222-26b1-f08f-1aee-d1677a2cd483@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-12-andr2000@gmail.com>
 <YeAOhksC1rRuYl4x@Air-de-Roger>
In-Reply-To: <YeAOhksC1rRuYl4x@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a952f78-95fb-45dc-5f6b-08d9e64e67b5
x-ms-traffictypediagnostic: AM0PR03MB5489:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5489DFE7CE1446B2B75A2E45E7279@AM0PR03MB5489.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o4JMg6vnXVd3gX3JUzB0ElWvfneOV+Qvf08abnxdPwG0B3ZiKnTtXoeuJ+YyztjtsgFtsgi/EtVhhob7nKtELe73QktWzHuVyHozDUPlelXJTAwf/2xJyX//okgAQRKbLhRBBpiRSF8fJcmBSdsnFcgAGU9XDaOKqVor+OXYKumW/sXGacerYD6qzX8geFtvRJNdcdI8YPPpv4LxM7BMOG60/tzubbRpy0vmPbd47C9b/IflwcM+BSAYMRahSO7P0I7KqgD7cwLdMBHkLwhZzt5x12Oux49vqfci4IF0a6y+Sw7cFS+fzaY1zNjgamhP3Os8nOrEAhoxuJWuDYfMQm7URQpZSPhFeI4sQ46cG5mKt2ZsLjsbk6DoJBG/blZ44OBpuo6lydmoCFF7N6sF9dOAr7dRmoa/vNiJNPEro8ytN8oUEYXu4A8VQdN44k0PbwTyyU5WrZK0MxYW+w5N0gPKooAXvwJfO7f+UCBD1IR0y3WmrERB7ulHCVw4YPH1G1NSCMcBm6SN/vE5gkM75usVPoHAPoqRdydqKdZ9/goLH8NgILjhe5OSQcXIdHAszQCcqgpKj9pWXXROIXRAGs606vu2IzBMDoHO+vyBOwfiJCoBMRZOKJ7PB09cul/Rr6VTFbvd0RzYbYd2N2zIz4Nm6D9CteX7z106820RI2wGoHm47Q5hHGSV9YuS5vOItZ6tFEih/z/jgUkAAzHjPSDtqsUMPHcSOJt0pKZt0K4GNrhkF6wItvDT8PbmPVQU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(107886003)(26005)(186003)(2616005)(31696002)(71200400001)(83380400001)(4326008)(31686004)(5660300002)(91956017)(36756003)(66446008)(66476007)(8936002)(76116006)(122000001)(66556008)(7416002)(66946007)(2906002)(8676002)(64756008)(38100700002)(38070700005)(508600001)(6512007)(6506007)(53546011)(6486002)(6916009)(316002)(54906003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cUU4anhuNVVqOGRSZEtWbFM1MEIxT21KRGc0d0VRUWpKREtwRlRENVNkc3hX?=
 =?utf-8?B?VCtGcjBGRTFvejcyL2puYmNaaTZSZHcvTjlIa2QxYnk3cTdMWDJJa3dSYi9D?=
 =?utf-8?B?V2ZsWWZaQU00TS9mSjhRVUtyRnlGMkVwOU9DVy9icDZVN3dwNi9OVDBTMU1z?=
 =?utf-8?B?Qk44OC9jdjBSTDRHR25hOFFWekd6WllQQlFyVkNHcjArM2dna1orbXJSc09K?=
 =?utf-8?B?aWYwMllvYzBjOUFiQms3MFdQOXdBSkY2bjdySVk3cDhhY0V5VndvRHN3aVlj?=
 =?utf-8?B?N3p5alB5OGpKMGFjWDN3WFoyRTlzdG9Od2YvMEh0N0FLWm9Mb0xuTGlYVllO?=
 =?utf-8?B?UHpGYkdTOU52N2N3dExZTy92SUx6SkhXTFJBTnpwRzlXQ2hXS2RKWmpacnpp?=
 =?utf-8?B?M1gyQ3Zrdk1XY25kTHBXRGlWY0dFZ0NUa0toS29mQTlMNlN4S0FCbm5ESUVY?=
 =?utf-8?B?QlcvbFk5SVZNcEFMeW9UMzJTN25acnRab1JMaEtEb0hrbWhWeTh1MCsxcFdn?=
 =?utf-8?B?SUhQc3JyOU0xeHcyTWk4L3Y4MXNpTDdSWGV0dkl0Wks2bjIxMDFmWjg2M3NV?=
 =?utf-8?B?WVVmVlJuR0pIc3RrT0dwUnZLNUI2Z0ZFVVBsWjVJaUhGZmxJMFhBd3liRFBu?=
 =?utf-8?B?TUZNbnZYd2FTWklIZTRoQmpCWEJlTWNUbnRNL2NBZGdnRURDVDRjcEFCd0ho?=
 =?utf-8?B?b1BVdS9lWEN2KzJYTW1aZWhpRlc0RHRITElEVHcrcW4vbE5tR0ErWkp0eEx0?=
 =?utf-8?B?TWdnREptazJzMnN0elhidjFBYm5BTmNvaTNQMjBrYjMwQk9PMTVFZFpFclJy?=
 =?utf-8?B?Y0xjeHJXSitqYmUrWnZXT1pFSzk1ZEZxcXNSUy83ZXdWR1lxemtqa1YyTDNo?=
 =?utf-8?B?TkRpdDhoY0NOWjErcHIwZ2RWUWVRL09zQXpJTEhBbHd1QURmaEliNHdHTSt1?=
 =?utf-8?B?Znd5UGVib1lYbUtyYnFPQUlzZ3JxSVNWNWF5VDZESldsUG02OEt2QzVRU1BC?=
 =?utf-8?B?RUtXY2h4SDJiYUpoOWxJQWk4UE1wVFFuQzJ1ZzZhcmpJenhoQ0JLaG9ZczZl?=
 =?utf-8?B?ZkY5TnFTK05yUmJEOFpwYXoyUkZOV2dPSFE4Z0hPSUNBeVR0bnhnaG5DVFpR?=
 =?utf-8?B?WjdJZ3Q1Yytacjl2eHZnTWhSclRRZm1iK0pya09aUElMRHNKdVNTdFd2Q0VO?=
 =?utf-8?B?OGNZTUN4RGR0U0ZWSjcydUdPNFlCSU9DNDR4UUYvWUpmd0VCZHduY1VoWlFq?=
 =?utf-8?B?dm5RN01SZjBCTXNmZXJkaWdJRnFyVmdFTkd3MExac293bDdpZzVVdE5Rakpy?=
 =?utf-8?B?OG01bVVsN2EzNWdqTEtkek56MDZKdTRoZG5WNnd2dWdJMVBab2ZQRW9nQ0Nk?=
 =?utf-8?B?TCtUL0F6cFdQeHNVcWhMWFBldC9Pd1Q1LzhmcDBGNFBIckl4dkt3U0tCcmVD?=
 =?utf-8?B?cWN4YVpOL2RBMEh6dHFKSDhrUnpFdmFlWUFxK1dhUGJKdlpCdHY2UjVHZkpj?=
 =?utf-8?B?czZ3MzRFRU9lWlJhMVFscmVIc1l3SGNzdXBBcFpSM1hjVFluRm10MCtjVDI1?=
 =?utf-8?B?YjRTaHFkNmZzdno1RGFuNlUyTndkUU5FMTJjM01aaXc5ZU1wb2RXQzJkckRZ?=
 =?utf-8?B?ZHltOHNnWmxxM2JleTRWSnMwYWtNWE9TQTdNSTNuRTZUejRraEtKR0pGK3J1?=
 =?utf-8?B?T0t3eGRSWGtNWUZtcFN4MHhDdldsbjVoOUZ5Z2QweVhlYzFLSzd1VFgvUnFT?=
 =?utf-8?B?dTlHSXBUK1FqQ0hEbTVTWmVPbEpORk04aTFuRDVIMC9QQllkL3V0WDd4WXAv?=
 =?utf-8?B?ZzhISU5MT1FLSWFwSXJZTXNwdkxXTHBqcmJqMXZNdEEvOUZLZld3Z0F0MFNU?=
 =?utf-8?B?WXBwVVpRTkJmQUJIOXY4L1FVcmF5S0F1UnlFUDB2eGJXdUVoem1hcmRIdEE4?=
 =?utf-8?B?TGVWdkIwK3NPRFUyckthZDVQNE5yWEJVRkN3ZFExSWR1Z00xYVgreHdiVnBC?=
 =?utf-8?B?aEFvODQxRnpXMDFNbkZ6WDZtbmhIWWFRNlV2THl5NUxRQUMwRURPbEhWQnBW?=
 =?utf-8?B?YWRCRUhSaEdnNnFiZk9nZEVZUjVlWkp2RzdjLzdFd3VGT09RcXZObEg2c21G?=
 =?utf-8?B?Vk5pNndIcXM1Q2hmM2hKaFVaODdGbHQzdnpqT0U0cytoajdNTzBlM1ZHYlRi?=
 =?utf-8?B?bytuUzh3T2VTYnNvK3lsZG8yaTVMS2ZtNGVCRDNuT3hXT0dKb2V0RjlkNEt4?=
 =?utf-8?B?a0Q1aFVsNmZoeGQ0N3JldnoxR1pPLzRqWDdGOW44endmQlcvbk1FVjlISUFG?=
 =?utf-8?B?MWRsZTVlTWxKbzVTR25EbjZ3eTNvQ0xQRVlYZXJzM0dQTFdLWitWZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CD2821F7E198DB4C94E94134DF3DE780@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a952f78-95fb-45dc-5f6b-08d9e64e67b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 13:17:47.0475
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPx8BfRF/FTpB2ckIOpIUqqXF3MqnD0oTDSrL1Dd2BqJvPqDCZPatCsU8MK4RcZJ2lDOi8HucOfufsFeyiShHLv5UoFh8CzJK+h3NcciuV1H32Bnos2Ck4VpNFQgSZBP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5489
X-Proofpoint-GUID: qQQd6bHqZs3QkXf_ThDudl2iMvXApkyr
X-Proofpoint-ORIG-GUID: qQQd6bHqZs3QkXf_ThDudl2iMvXApkyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020073

SGksIFJvZ2VyIQ0KDQpPbiAxMy4wMS4yMiAxMzozNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDE6MDI6NDhQTSArMDIwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xl
a3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pg0KPj4gQXNzaWduIFNCREYgdG8gdGhl
IFBDSSBkZXZpY2VzIGJlaW5nIHBhc3NlZCB0aHJvdWdoIHdpdGggYnVzIDAuDQo+PiBUaGUgcmVz
dWx0aW5nIHRvcG9sb2d5IGlzIHdoZXJlIFBDSWUgZGV2aWNlcyByZXNpZGUgb24gdGhlIGJ1cyAw
IG9mIHRoZQ0KPj4gcm9vdCBjb21wbGV4IGl0c2VsZiAoZW1iZWRkZWQgZW5kcG9pbnRzKS4NCj4+
IFRoaXMgaW1wbGVtZW50YXRpb24gaXMgbGltaXRlZCB0byAzMiBkZXZpY2VzIHdoaWNoIGFyZSBh
bGxvd2VkIG9uDQo+PiBhIHNpbmdsZSBQQ0kgYnVzLg0KPj4NCj4+IFBsZWFzZSBub3RlLCB0aGF0
IGF0IHRoZSBtb21lbnQgb25seSBmdW5jdGlvbiAwIG9mIGEgbXVsdGlmdW5jdGlvbg0KPj4gZGV2
aWNlIGNhbiBiZSBwYXNzZWQgdGhyb3VnaC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAt
LS0NCj4+IFNpbmNlIHY0Og0KPj4gLSBtb3ZlZCBhbmQgcmUtd29ya2VkIGd1ZXN0IHNiZGYgaW5p
dGlhbGl6ZXJzDQo+PiAtIHMvc2V0X2JpdC9fX3NldF9iaXQNCj4+IC0gcy9jbGVhcl9iaXQvX19j
bGVhcl9iaXQNCj4+IC0gbWlub3IgY29tbWVudCBmaXggcy9WaXJ0dWFsL0d1ZXN0Lw0KPj4gLSBh
ZGRlZCBWUENJX01BWF9WSVJUX0RFViBjb25zdGFudCAoUENJX1NMT1QofjApICsgMSkgd2hpY2gg
d2lsbCBiZSB1c2VkDQo+PiAgICBsYXRlciBmb3IgY291bnRpbmcgdGhlIG51bWJlciBvZiBNTUlP
IGhhbmRsZXJzIHJlcXVpcmVkIGZvciBhIGd1ZXN0DQo+PiAgICAoSnVsaWVuKQ0KPj4gU2luY2Ug
djM6DQo+PiAgIC0gbWFrZSB1c2Ugb2YgVlBDSV9JTklUDQo+PiAgIC0gbW92ZWQgYWxsIG5ldyBj
b2RlIHRvIHZwY2kuYyB3aGljaCBiZWxvbmdzIHRvIGl0DQo+PiAgIC0gY2hhbmdlZCBvcGVuLWNv
ZGVkIDMxIHRvIFBDSV9TTE9UKH4wKQ0KPj4gICAtIGFkZGVkIGNvbW1lbnRzIGFuZCBjb2RlIHRv
IHJlamVjdCBtdWx0aWZ1bmN0aW9uIGRldmljZXMgd2l0aA0KPj4gICAgIGZ1bmN0aW9ucyBvdGhl
ciB0aGFuIDANCj4+ICAgLSB1cGRhdGVkIGNvbW1lbnQgYWJvdXQgdnBjaV9kZXZfbmV4dCBhbmQg
bWFkZSBpdCB1bnNpZ25lZCBpbnQNCj4+ICAgLSBpbXBsZW1lbnQgcm9sbCBiYWNrIGluIGNhc2Ug
b2YgZXJyb3Igd2hpbGUgYXNzaWduaW5nL2RlYXNzaWduaW5nIGRldmljZXMNCj4+ICAgLSBzL2Rv
bSVwZC8lcGQNCj4+IFNpbmNlIHYyOg0KPj4gICAtIHJlbW92ZSBjYXN0cyB0aGF0IGFyZSAoYSkg
bWFsZm9ybWVkIGFuZCAoYikgdW5uZWNlc3NhcnkNCj4+ICAgLSBhZGQgbmV3IGxpbmUgZm9yIGJl
dHRlciByZWFkYWJpbGl0eQ0KPj4gICAtIHJlbW92ZSBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQ
UE9SVCBpZmRlZidzIGFzIHRoZSByZWxldmFudCB2UENJDQo+PiAgICAgIGZ1bmN0aW9ucyBhcmUg
bm93IGNvbXBsZXRlbHkgZ2F0ZWQgd2l0aCB0aGlzIGNvbmZpZw0KPj4gICAtIGdhdGUgY29tbW9u
IGNvZGUgd2l0aCBDT05GSUdfSEFTX1ZQQ0lfR1VFU1RfU1VQUE9SVA0KPj4gTmV3IGluIHYyDQo+
PiAtLS0NCj4+ICAgeGVuL2RyaXZlcnMvdnBjaS92cGNpLmMgfCA1MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4gICB4ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCB8
ICA4ICsrKysrKysNCj4+ICAgeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgfCAxMSArKysrKysrKysN
Cj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCA3MCBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+
IGluZGV4IDk4YjEyYTYxYmU2Zi4uYzJmYjRkNGRiMjMzIDEwMDY0NA0KPj4gLS0tIGEveGVuL2Ry
aXZlcnMvdnBjaS92cGNpLmMNCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+PiBA
QCAtMTE0LDYgKzExNCw5IEBAIGludCB2cGNpX2FkZF9oYW5kbGVycyhzdHJ1Y3QgcGNpX2RldiAq
cGRldikNCj4+ICAgICAgIHNwaW5fbG9jaygmcGRldi0+dnBjaV9sb2NrKTsNCj4+ICAgICAgIHBk
ZXYtPnZwY2kgPSB2cGNpOw0KPj4gICAgICAgSU5JVF9MSVNUX0hFQUQoJnBkZXYtPnZwY2ktPmhh
bmRsZXJzKTsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsg
ICAgcGRldi0+dnBjaS0+Z3Vlc3Rfc2JkZi5zYmRmID0gfjA7DQo+PiArI2VuZGlmDQo+PiAgIA0K
Pj4gICAgICAgaGVhZGVyID0gJnBkZXYtPnZwY2ktPmhlYWRlcjsNCj4+ICAgICAgIGZvciAoIGkg
PSAwOyBpIDwgQVJSQVlfU0laRShoZWFkZXItPmJhcnMpOyBpKysgKQ0KPj4gQEAgLTE0NSw2ICsx
NDgsNTMgQEAgaW50IHZwY2lfYWRkX2hhbmRsZXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4g
ICB9DQo+PiAgIA0KPj4gICAjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+
ICtpbnQgdnBjaV9hZGRfdmlydHVhbF9kZXZpY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiAr
ew0KPj4gKyAgICBzdHJ1Y3QgZG9tYWluICpkID0gcGRldi0+ZG9tYWluOw0KPj4gKyAgICBwY2lf
c2JkZl90IHNiZGYgPSB7IDAgfTsNCj4+ICsgICAgdW5zaWduZWQgbG9uZyBuZXdfZGV2X251bWJl
cjsNCj4gSSB0aGluayB0aGlzIG5lZWRzIHRvIGJlIGxpbWl0ZWQgdG8gbm9uLWhhcmR3YXJlIGRv
bWFpbnM/DQo+DQo+IE9yIGVsc2UgeW91IHdpbGwgcmVwb3J0IGZhaWx1cmVzIGZvciB0aGUgaGFy
ZHdhcmUgZG9tYWluIGV2ZW4gaWYgaXQncw0KPiBub3QgdXNpbmcgdGhlIHZpcnR1YWwgdG9wb2xv
Z3kgYXQgYWxsLg0KWWVzLCB0aGlzIHdhbnRzIGFuIGlzX2hhcmR3YXJlX2RvbWFpbiBjaGVjaw0K
Pg0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBFYWNoIFBDSSBidXMgc3VwcG9ydHMgMzIgZGV2aWNl
cy9zbG90cyBhdCBtYXggb3IgdXAgdG8gMjU2IHdoZW4NCj4+ICsgICAgICogdGhlcmUgYXJlIG11
bHRpLWZ1bmN0aW9uIG9uZXMgd2hpY2ggYXJlIG5vdCB5ZXQgc3VwcG9ydGVkLg0KPj4gKyAgICAg
Ki8NCj4+ICsgICAgaWYgKCBwZGV2LT5pbmZvLmlzX2V4dGZuICkNCj4+ICsgICAgew0KPj4gKyAg
ICAgICAgZ2RwcmludGsoWEVOTE9HX0VSUiwgIiVwcDogb25seSBmdW5jdGlvbiAwIHBhc3N0aHJv
dWdoIHN1cHBvcnRlZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICZwZGV2LT5zYmRmKTsNCj4+
ICsgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBu
ZXdfZGV2X251bWJlciA9IGZpbmRfZmlyc3RfemVyb19iaXQoJmQtPnZwY2lfZGV2X2Fzc2lnbmVk
X21hcCwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFZQQ0lf
TUFYX1ZJUlRfREVWKTsNCj4+ICsgICAgaWYgKCBuZXdfZGV2X251bWJlciA+PSBWUENJX01BWF9W
SVJUX0RFViApDQo+PiArICAgICAgICByZXR1cm4gLUVOT1NQQzsNCj4+ICsNCj4+ICsgICAgX19z
ZXRfYml0KG5ld19kZXZfbnVtYmVyLCAmZC0+dnBjaV9kZXZfYXNzaWduZWRfbWFwKTsNCj4gSG93
IGlzIHZwY2lfZGV2X2Fzc2lnbmVkX21hcCBwcm90ZWN0ZWQgZnJvbSBjb25jdXJyZW50IGFjY2Vz
c2VzPyBEb2VzDQo+IGl0IHJlbHkgb24gdGhlIHBjaWRldnMgbG9jayBiZWluZyBoZWxkIHdoaWxl
IGFjY2Vzc2luZyBpdD8NCkl0IGRvZXMgcmVseSBvbiBwY2lkZXZzIGxvY2ssIEknbGwgYWRkIGFu
IGFzc2VydCBoZXJlDQo+DQo+IElmIHNvIGl0IG5lZWRzIHNwZWxsaW5nIG91dCAoYW5kIGxpa2Vs
eSBhbiBhc3NlcnQgYWRkZWQpLg0KPg0KPj4gKyAgICAvKg0KPj4gKyAgICAgKiBCb3RoIHNlZ21l
bnQgYW5kIGJ1cyBudW1iZXIgYXJlIDA6DQo+PiArICAgICAqICAtIHdlIGVtdWxhdGUgYSBzaW5n
bGUgaG9zdCBicmlkZ2UgZm9yIHRoZSBndWVzdCwgZS5nLiBzZWdtZW50IDANCj4+ICsgICAgICog
IC0gd2l0aCBidXMgMCB0aGUgdmlydHVhbCBkZXZpY2VzIGFyZSBzZWVuIGFzIGVtYmVkZGVkDQo+
PiArICAgICAqICAgIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleA0KPj4gKyAgICAg
Kg0KPj4gKyAgICAgKiBUT0RPOiBhZGQgc3VwcG9ydCBmb3IgbXVsdGktZnVuY3Rpb24gZGV2aWNl
cy4NCj4+ICsgICAgICovDQo+PiArICAgIHNiZGYuZGV2Zm4gPSBQQ0lfREVWRk4obmV3X2Rldl9u
dW1iZXIsIDApOw0KPj4gKyAgICBwZGV2LT52cGNpLT5ndWVzdF9zYmRmID0gc2JkZjsNCj4+ICsN
Cj4+ICsgICAgcmV0dXJuIDA7DQo+PiArDQo+PiArfQ0KPj4gK1JFR0lTVEVSX1ZQQ0lfSU5JVCh2
cGNpX2FkZF92aXJ0dWFsX2RldmljZSwgVlBDSV9QUklPUklUWV9NSURETEUpOw0KPiBJJ20gdW5z
dXJlIHRoaXMgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGRvIHZpcnR1YWwgU0JERiBhc3NpZ25tZW50
LCBteQ0KPiBwbGFuIHdhcyB0byB1c2UgUkVHSVNURVJfVlBDSV9JTklUIGV4Y2x1c2l2ZWx5IHdp
dGggUENJIGNhcGFiaWxpdGllcy4NCj4NCj4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8g
ZG8gdGhlIHZpcnR1YWwgU0JERiBhc3NpZ25tZW50IGZyb20NCj4gdnBjaV9hc3NpZ25fZGV2aWNl
Lg0KT2ssIHdpbGwgZG8NCj4NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCB2cGNpX3JlbW92ZV92aXJ0
dWFsX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gK3sNCj4+ICsg
ICAgX19jbGVhcl9iaXQocGRldi0+dnBjaS0+Z3Vlc3Rfc2JkZi5kZXYsICZkLT52cGNpX2Rldl9h
c3NpZ25lZF9tYXApOw0KPj4gKyAgICBwZGV2LT52cGNpLT5ndWVzdF9zYmRmLnNiZGYgPSB+MDsN
Cj4+ICt9DQo+PiArDQo+PiAgIC8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGFzc2lnbmVk
IHRvIGd1ZXN0LiAqLw0KPj4gICBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVjdCBkb21haW4g
KmQsIHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4gICB7DQo+PiBAQCAtMTcxLDYgKzIyMSw3IEBA
IGludCB2cGNpX2RlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWluICpkLCBzdHJ1Y3QgcGNpX2Rl
diAqcGRldikNCj4+ICAgICAgICAgICByZXR1cm4gMDsNCj4+ICAgDQo+PiAgICAgICBzcGluX2xv
Y2soJnBkZXYtPnZwY2lfbG9jayk7DQo+PiArICAgIHZwY2lfcmVtb3ZlX3ZpcnR1YWxfZGV2aWNl
KGQsIHBkZXYpOw0KPj4gICAgICAgdnBjaV9yZW1vdmVfZGV2aWNlX2hhbmRsZXJzX2xvY2tlZChw
ZGV2KTsNCj4+ICAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpX2xvY2spOw0KPj4gICANCj4+
IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oDQo+PiBpbmRleCAyODE0NmVlNDA0ZTYuLjEwYmZmMTAzMzE3YyAxMDA2NDQNCj4+IC0t
LSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oDQo+PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2No
ZWQuaA0KPj4gQEAgLTQ0NCw2ICs0NDQsMTQgQEAgc3RydWN0IGRvbWFpbg0KPj4gICANCj4+ICAg
I2lmZGVmIENPTkZJR19IQVNfUENJDQo+PiAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIHBkZXZfbGlz
dDsNCj4+ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+ICsgICAgLyoN
Cj4+ICsgICAgICogVGhlIGJpdG1hcCB3aGljaCBzaG93cyB3aGljaCBkZXZpY2UgbnVtYmVycyBh
cmUgYWxyZWFkeSB1c2VkIGJ5IHRoZQ0KPj4gKyAgICAgKiB2aXJ0dWFsIFBDSSBidXMgdG9wb2xv
Z3kgYW5kIGlzIHVzZWQgdG8gYXNzaWduIGEgdW5pcXVlIFNCREYgdG8gdGhlDQo+PiArICAgICAq
IG5leHQgcGFzc2VkIHRocm91Z2ggdmlydHVhbCBQQ0kgZGV2aWNlLg0KPj4gKyAgICAgKi8NCj4+
ICsgICAgdW5zaWduZWQgbG9uZyB2cGNpX2Rldl9hc3NpZ25lZF9tYXA7DQo+IFBsZWFzZSB1c2Ug
REVDTEFSRV9CSVRNQVAgd2l0aCB0aGUgbWF4aW11bSBudW1iZXIgb2Ygc3VwcG9ydGVkDQo+IGRl
dmljZXMgYXMgcGFyYW1ldGVyLg0KV2lsbCB1c2UNCj4NCj4+ICsjZW5kaWYNCj4+ICAgI2VuZGlm
DQo+PiAgIA0KPj4gICAjaWZkZWYgQ09ORklHX0hBU19QQVNTVEhST1VHSA0KPj4gZGlmZiAtLWdp
dCBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vdnBjaS5oDQo+PiBp
bmRleCAxODMxOWZjMzI5ZjkuLmU1MjU4YmQ3Y2U5MCAxMDA2NDQNCj4+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCj4+ICsrKyBiL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+IEBAIC0y
MSw2ICsyMSwxMyBAQCB0eXBlZGVmIGludCB2cGNpX3JlZ2lzdGVyX2luaXRfdChzdHJ1Y3QgcGNp
X2RldiAqZGV2KTsNCj4+ICAgDQo+PiAgICNkZWZpbmUgVlBDSV9FQ0FNX0JERihhZGRyKSAgICAg
KCgoYWRkcikgJiAweDBmZmZmMDAwKSA+PiAxMikNCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBNYXhp
bXVtIG51bWJlciBvZiBkZXZpY2VzIHN1cHBvcnRlZCBieSB0aGUgdmlydHVhbCBidXMgdG9wb2xv
Z3k6DQo+PiArICogZWFjaCBQQ0kgYnVzIHN1cHBvcnRzIDMyIGRldmljZXMvc2xvdHMgYXQgbWF4
IG9yIHVwIHRvIDI1NiB3aGVuDQo+PiArICogdGhlcmUgYXJlIG11bHRpLWZ1bmN0aW9uIG9uZXMg
d2hpY2ggYXJlIG5vdCB5ZXQgc3VwcG9ydGVkLg0KPj4gKyAqLw0KPj4gKyNkZWZpbmUgVlBDSV9N
QVhfVklSVF9ERVYgICAgICAgKFBDSV9TTE9UKH4wKSArIDEpDQo+PiArDQo+PiAgICNkZWZpbmUg
UkVHSVNURVJfVlBDSV9JTklUKHgsIHApICAgICAgICAgICAgICAgIFwNCj4+ICAgICBzdGF0aWMg
dnBjaV9yZWdpc3Rlcl9pbml0X3QgKmNvbnN0IHgjI19lbnRyeSAgXA0KPj4gICAgICAgICAgICAg
ICAgICBfX3VzZWRfc2VjdGlvbigiLmRhdGEudnBjaS4iIHApID0geA0KPj4gQEAgLTE0Myw2ICsx
NTAsMTAgQEAgc3RydWN0IHZwY2kgew0KPj4gICAgICAgICAgICAgICBzdHJ1Y3QgdnBjaV9hcmNo
X21zaXhfZW50cnkgYXJjaDsNCj4+ICAgICAgICAgICB9IGVudHJpZXNbXTsNCj4+ICAgICAgIH0g
Km1zaXg7DQo+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUDQo+PiArICAg
IC8qIEd1ZXN0IFNCREYgb2YgdGhlIGRldmljZS4gKi8NCj4+ICsgICAgcGNpX3NiZGZfdCBndWVz
dF9zYmRmOw0KPj4gKyNlbmRpZg0KPj4gICAjZW5kaWYNCj4+ICAgfTsNCj4+ICAgDQo+PiAtLSAN
Cj4+IDIuMjUuMQ0KPj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

