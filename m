Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB45242C404
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 16:51:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208595.364786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafbP-0005Bc-GZ; Wed, 13 Oct 2021 14:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208595.364786; Wed, 13 Oct 2021 14:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mafbP-00058C-D6; Wed, 13 Oct 2021 14:51:31 +0000
Received: by outflank-mailman (input) for mailman id 208595;
 Wed, 13 Oct 2021 14:51:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GwvX=PB=epam.com=prvs=09201fb8eb=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mafbN-000582-Cg
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 14:51:29 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b1dc929-2c35-11ec-817c-12813bfff9fa;
 Wed, 13 Oct 2021 14:51:28 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19DE3D87005342; 
 Wed, 13 Oct 2021 14:51:22 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2057.outbound.protection.outlook.com [104.47.0.57])
 by mx0a-0039f301.pphosted.com with ESMTP id 3bntyka1m7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Oct 2021 14:51:22 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6068.eurprd03.prod.outlook.com (2603:10a6:208:166::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 14:51:17 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::b034:334a:abf5:223c%7]) with mapi id 15.20.4587.029; Wed, 13 Oct 2021
 14:51:17 +0000
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
X-Inumbo-ID: 0b1dc929-2c35-11ec-817c-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJcGPZb8zGXKYr1ykDL0SXegzhtuZfP2QDJiqAl1gnCJvzQvZsxFAv3+ERPUvCNqCgiFBLTAs9TofnbaRNddsPVkP2F+LghbBnkHCLDJxH9N1IIDzUmr3kq6VeVqYh8KPPD5qLLXubkYf5d3jH0tdwO+qsrgv0kEvPHkvYX1qzsyHUkwew2BihEmt9hKiOdZZ270w+LbfvF5RGOGGTPdppOlOBXDyLdk89EXfEM2VORzdvlkkGVwySKOmFojsmY9Pe/J1ZL6K2GQkO9PULM3VwWu6FLEPHtLXKOUZVdE4XMvnws7d9kfmv54smJpVI6Z0gdBOdDr+HToULAGj5Dkpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oGeBbWoqVYOkNmFbkteVlod7g6FVWoiF5XzTLae9/gg=;
 b=f6eUk0LE6mz3Moqujr8i43r/JWGMUaGrl26xRjnQqmayce8vtvCuz/KI5bMOs7rFH6Lm1DGOiRoVnAUA8hRhBbHMHt8wh3JJVVf53GZwEt23eWUA3FRKG0OJRjsSr2bznvQbIbU/5AYEt02qPvBsLn1JCkeIWjd/4bF9X775Y54i6pYO+MkvbxS1XTQ+ML30zIggQ04tXOYIjO6n0sKkLvcStBDsTrcxJ0YfMNm4ba7Uz5bimPaQ5u2D8K87VlEUbPkmIlx3sZ0aq9kEu0J6KTd+tDgYEi7YwbrVlNh1F+Il5STI5eVX+LZDITbcXawdp9TaiBo3xmUNPSmSA0AaHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oGeBbWoqVYOkNmFbkteVlod7g6FVWoiF5XzTLae9/gg=;
 b=mYtDeDXvGwdHcYwb6f30kODXdtaPb3wUz8B6GvNW2fHyL4YWpYMiGi6/q3l7aJp1Sqo57QwmBCjG2kp3tVqk7PaarTpgsXkdmWF2Izf60g0bz8TlzZTDgODEvarHQ58R9YooUrFyNqdvvscNnyhXU8v8OCKCeq9JF60phYtRMTiYMIf54j8WfaWBH1z0QLV922MRVAcbzX3eo9yuFUYcCotIAKKZ0Hyd9/llYWJJJh5B3lpocDWzf0WXuaVemKLeM4pTXpSstfPO5qvNIAEcJ1mqNHpZQHrPoFdbGBw0Uwo+1L7U2YTy9kKbAZvH30W/OLmVVDFK7TEJSzTAolB6Fw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Rahul Singh <rahul.singh@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        "Andre.Przywara@arm.com"
	<Andre.Przywara@arm.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXwEHGYqS5dHXsYk6KpdKt4d14RQ==
Date: Wed, 13 Oct 2021 14:51:16 +0000
Message-ID: <2b943774-072e-20a1-b97c-d88b24adf340@epam.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <YWaco/UvA4xFE1xW@MacBook-Air-de-Roger.local>
 <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
In-Reply-To: <6d75f604-6938-b185-61e1-a6684d9fca14@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4958c33e-38c6-49f4-ee4c-08d98e58e946
x-ms-traffictypediagnostic: AM0PR03MB6068:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB6068C4BDFD0BAE6152D3E70FE7B79@AM0PR03MB6068.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dkcmmppYS3LvQh/FHO4j2QpSflLOI3w4sHDRRrGUGmsYboJTFnZ9505MHV3JmrB+enNWuXLvgu09c9A+8zaI49G4BMh8scUW4LuTI/DkhILquFkHRw8hgdNM0zTU/2MnScB8eenWP4LCSYl58rxt/r+jFCGApD4QQdCilmsQy85a8yxWUnBgzGY8X+LDUh6tmGjDHUCUYkeGVPbb3y3ME9o7W8LgQnaUYhSAXzpNeu59Ql0pFsCKOOAD6EnaRGfhPXktEyxt+r1a3Te2xI7UEWO4hLyaBu1nTvxh3ShfPRnBOEUS9tVqgQ3lZktcNDkOpzqrURoCmSgODSyvNNtGrnUVywAZ/eMn/RlYDqaq9HRhhU2Tkxa7BAbvJK/z7fuYkwCyGuZpqmZJ74lRxwnwy3tj1M+Bebbp5Oz7hl0t8NOm0bPM/7J+NK4N9RYVrm90PkJxq5rZtEbVtyPNDMmtDBTAa+iiakLdfaIMf1QaEGbf0MCSUKuszV84zVlltHj/LEsILd3F0AFoUhr1fOAgWlcwX64WvFEJDJ+k6EPHn78Xev9IMg4JeAdMA0fAd9NKx/HgbriVYTmwNdnbnKyRs33OD8NOGz9t71R+vyNRx6PABbgfu7e/Uc8psjZPW1xRAxUr/qkNYyyM4UiFubSrxDnqLHY/jqUunBywm8aJnHXGWSI8vOqnQ48A4zznMoso7sKcjYxJXVVd4rTGYvE1z17C+QQnl+XeC03sHQo/OzuqMZi+nbPxzjY4qfhZefUbVbeD4XpbCexi5tdLefLmjg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(53546011)(6506007)(8676002)(71200400001)(508600001)(2616005)(38070700005)(76116006)(91956017)(6486002)(4326008)(83380400001)(5660300002)(316002)(110136005)(54906003)(122000001)(31686004)(7416002)(36756003)(186003)(64756008)(66476007)(2906002)(8936002)(107886003)(86362001)(38100700002)(6512007)(66446008)(26005)(31696002)(66946007)(66556008)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NkZxeW5taHdGQ3RScE55OWU5ZmRsU0dqN2ZHTFFqNHUrU2E5WWRvSEExcTlt?=
 =?utf-8?B?QUpBdW9GSU9Tdm1taVVxL29aenh4S0xWRWZCU0NESUF1Z2xnL24zYk1SeUd3?=
 =?utf-8?B?VzE3UjIxU0ovSkYrZkw3dDZSMFB5blArTEcyNkhmR1JIZXM5ZmxTeS94bmxj?=
 =?utf-8?B?NjlSeUtnSkdpNWRNcWYvVzhzdWVHVk9sNU5SZFVHaWJkcThqUXVtNUw1TUVu?=
 =?utf-8?B?OEMvcnhPM2dJT1dQdi84YWdBQ1Q1THdwSTMrbmZLMCtFTjVXOE5jWEJQWWt2?=
 =?utf-8?B?bmpqVUZOUXVabC9MWWFJaXltTDY4UjFsZmdOMzIzR2xZLytNL0pERjJpSStE?=
 =?utf-8?B?ekZzZTJDbkJGY3ZMUGdTRUw2ZkUzQWNLTjJLL3FubnhhT1JQNVhuUHkrVDFK?=
 =?utf-8?B?S0dMbmRlYWVQb3Bvb3VwVXRrckd2ZmI4RVZLYlovL01xREFRMEM2YytWcWlh?=
 =?utf-8?B?VlBTK1NHWmpaL3pIUGF5c0t6cncwYjl6b1Nib0RJTTlhMzQzUWRaTU1LUTBX?=
 =?utf-8?B?UG8rZ040QWR1dXdzekFqL2RQd3RXWVRYM0RYWkxwT2lLQWI3ZDVrS2RmQnoy?=
 =?utf-8?B?OWVnS0tEeE53Q2hYcnNYQSs2SnluakRkTmpsUERkZTRMaldBSHdNRVMvdXFz?=
 =?utf-8?B?UXJiSklxOVFXWFNiSVIrWGFnTmsyb01QZkhGSFAwM3VZQzlvUHRUcExVck5D?=
 =?utf-8?B?cktKaTlwWERqaG5UaDFidk9kUHNwNEorOTlmK0dVOTZsOWNRSWloQkZCRTB0?=
 =?utf-8?B?VkcvYkVWQ0xHZWp1QkpaVVhMNUg4ck9zODB0ZGUrTlR0THM2YisvVCt5dEVE?=
 =?utf-8?B?ay9Sd0d2aExqTUxOTnp0Wm9ZWTZ1Mm1aMzA4TmsrV0h0ZGR2UTd0c040YmVX?=
 =?utf-8?B?NWVERytXTm0vc01EZU5ZUUdUd05BakJDc2xycFlPZEFwZmtyNDNFQklhRDE2?=
 =?utf-8?B?aHRHcldaSTVMbHpJcFI5UUhlMEdvRVh1N3BBQVRrVWtqVjF2Ty9RUmN3ZkRK?=
 =?utf-8?B?NW13N3F5TGIvTVdUSm1sajczbTJybmphTi9aRy9vZjBYYTZlWDA4bWdaYlp6?=
 =?utf-8?B?S3hhczYvNGdncDVmZnZKR2xLeWE3VFhFV3phTDZGOThMcEl2YjRPU0MwYnk5?=
 =?utf-8?B?c2dUYmxIUHBaT044VFJDekVTTE04TmpCQm1pZGtnTTdXV1I1YmxuSkFjYVdX?=
 =?utf-8?B?Y08xdlZLVFhjV1VRTU9FQW9UaUlCbkVYaWxLanhxd2lkYjhGRXBZajFPenR5?=
 =?utf-8?B?dXlXK2xzREIvQkx6cHVWVVF0dmxCWUxTaFR0Z3ZXc21iYXl3eHNhekRZbVV2?=
 =?utf-8?B?Nm5rYXlzYkJPTVA5S1FKWU1ndUptWmpHbUQzYlpwaDZpRzJrMlJvRU1kK0pW?=
 =?utf-8?B?bWoxeVZMNWNLMWYxNWVFZXZlcHJjdnZ3N29udTVMTld5SkVSWWFiZVlXMjF1?=
 =?utf-8?B?TTBjVjgvM3F0dFBhRjhkaE1KdEpGNE1uUFJyd0loZnErVjhOVWJ1ZFh3RHRp?=
 =?utf-8?B?RTJIekRiSjRTN3pJdnVtMmFGVXVBczVRY1g0OE1LQWt5cmFuRzF3RFBXb2xF?=
 =?utf-8?B?REdLWWFodUEwaUNsMnM0KzlhcktjR3ppTU0vblRIWlJLeEVvYlFjQk9HTXNw?=
 =?utf-8?B?OVI3MnNPYTNRclJzSDN6ZGx5TkF1Y2M5V0d1czArSmljRHcwOVNmMGk4WnRr?=
 =?utf-8?B?cTgySEg0RHNUWXpxSFR3eThxeEdHMzQ3SVpFRDZlQ2NsSE1HQkVyMzY5cWxI?=
 =?utf-8?Q?bcrgygBFFkMr95kvBKjLLODfHLzeQhPbliDChk7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B102ABC94CF4824592521D4C43EA9666@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4958c33e-38c6-49f4-ee4c-08d98e58e946
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 14:51:16.9969
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jtDud21HdJrYTjEITIZ4RsGHItYGk3fy+Re3LAva+CdZc4p8F0EYSF4rnCp/0xFT+AD/E+UnWPqr+MIUG/86vGgjpq+APUgk6E5SpJT+za1dWebYg0e+UwvlyO5tcTzN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6068
X-Proofpoint-GUID: iClcanzWIKpTTDpyJflY4jMy84W5ZHRY
X-Proofpoint-ORIG-GUID: iClcanzWIKpTTDpyJflY4jMy84W5ZHRY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_05,2021-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130098

DQoNCk9uIDEzLjEwLjIxIDE2OjAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTMuMTAuMjAy
MSAxMDo0NSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+IE9uIFdlZCwgT2N0IDA2LCAyMDIx
IGF0IDA2OjQwOjM0UE0gKzAxMDAsIFJhaHVsIFNpbmdoIHdyb3RlOg0KPj4+IFRoZSBleGlzdGlu
ZyBWUENJIHN1cHBvcnQgYXZhaWxhYmxlIGZvciBYODYgaXMgYWRhcHRlZCBmb3IgQXJtLg0KPj4+
IFdoZW4gdGhlIGRldmljZSBpcyBhZGRlZCB0byBYRU4gdmlhIHRoZSBoeXBlciBjYWxsDQo+Pj4g
4oCcUEhZU0RFVk9QX3BjaV9kZXZpY2VfYWRk4oCdLCBWUENJIGhhbmRsZXIgZm9yIHRoZSBjb25m
aWcgc3BhY2UNCj4+PiBhY2Nlc3MgaXMgYWRkZWQgdG8gdGhlIFhlbiB0byBlbXVsYXRlIHRoZSBQ
Q0kgZGV2aWNlcyBjb25maWcgc3BhY2UuDQo+Pj4NCj4+PiBBIE1NSU8gdHJhcCBoYW5kbGVyIGZv
ciB0aGUgUENJIEVDQU0gc3BhY2UgaXMgcmVnaXN0ZXJlZCBpbiBYRU4NCj4+PiBzbyB0aGF0IHdo
ZW4gZ3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyB0aGUgUENJIGNvbmZpZyBzcGFjZSxYRU4NCj4+
PiB3aWxsIHRyYXAgdGhlIGFjY2VzcyBhbmQgZW11bGF0ZSByZWFkL3dyaXRlIHVzaW5nIHRoZSBW
UENJIGFuZA0KPj4+IG5vdCB0aGUgcmVhbCBQQ0kgaGFyZHdhcmUuDQo+Pj4NCj4+PiBGb3IgRG9t
MGxlc3Mgc3lzdGVtcyBzY2FuX3BjaV9kZXZpY2VzKCkgd291bGQgYmUgdXNlZCB0byBkaXNjb3Zl
ciB0aGUNCj4+PiBQQ0kgZGV2aWNlIGluIFhFTiBhbmQgVlBDSSBoYW5kbGVyIHdpbGwgYmUgYWRk
ZWQgZHVyaW5nIFhFTiBib290cy4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IFJhaHVsIFNpbmdo
IDxyYWh1bC5zaW5naEBhcm0uY29tPg0KPj4+IFJldmlld2VkLWJ5OiBTdGVmYW5vIFN0YWJlbGxp
bmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+Pj4gLS0tDQo+Pj4gQ2hhbmdlIGluIHY1Og0K
Pj4+IC0gQWRkIHBjaV9jbGVhbnVwX21zaShwZGV2KSBpbiBjbGVhbnVwIHBhcnQuDQo+Pj4gLSBB
ZGRlZCBSZXZpZXdlZC1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPg0KPj4+IENoYW5nZSBpbiB2NDoNCj4+PiAtIE1vdmUgYWRkaXRpb24gb2YgWEVOX0RPTUNU
TF9DREZfdnBjaSBmbGFnIHRvIHNlcGFyYXRlIHBhdGNoDQo+Pj4gQ2hhbmdlIGluIHYzOg0KPj4+
IC0gVXNlIGlzX3BjaV9wYXNzdGhyb3VnaF9lbmFibGVkKCkgaW4gcGxhY2Ugb2YgcGNpX3Bhc3N0
aHJvdWdoX2VuYWJsZWQgdmFyaWFibGUNCj4+PiAtIFJlamVjdCBYRU5fRE9NQ1RMX0NERl92cGNp
IGZvciB4ODYgaW4gYXJjaF9zYW5pdGlzZV9kb21haW5fY29uZmlnKCkNCj4+PiAtIFJlbW92ZSBJ
U19FTkFCTEVEKENPTkZJR19IQVNfVlBDSSkgZnJvbSBoYXNfdnBjaSgpDQo+Pj4gQ2hhbmdlIGlu
IHYyOg0KPj4+IC0gQWRkIG5ldyBYRU5fRE9NQ1RMX0NERl92cGNpIGZsYWcNCj4+PiAtIG1vZGlm
eSBoYXNfdnBjaSgpIHRvIGluY2x1ZGUgWEVOX0RPTUNUTF9DREZfdnBjaQ0KPj4+IC0gZW5hYmxl
IHZwY2kgc3VwcG9ydCB3aGVuIHBjaS1wYXNzdGhvdWdoIG9wdGlvbiBpcyBlbmFibGVkLg0KPj4+
IC0tLQ0KPj4+IC0tLQ0KPj4+ICAgeGVuL2FyY2gvYXJtL01ha2VmaWxlICAgICAgICAgfCAgIDEg
Kw0KPj4+ICAgeGVuL2FyY2gvYXJtL2RvbWFpbi5jICAgICAgICAgfCAgIDQgKysNCj4+PiAgIHhl
bi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyAgIHwgICAzICsNCj4+PiAgIHhlbi9hcmNoL2FybS92
cGNpLmMgICAgICAgICAgIHwgMTAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysN
Cj4+PiAgIHhlbi9hcmNoL2FybS92cGNpLmggICAgICAgICAgIHwgIDM2ICsrKysrKysrKysrKw0K
Pj4+ICAgeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgfCAgMTggKysrKysrDQo+Pj4gICB4
ZW4vaW5jbHVkZS9hc20tYXJtL2RvbWFpbi5oICB8ICAgNyArKy0NCj4+PiAgIHhlbi9pbmNsdWRl
L2FzbS14ODYvcGNpLmggICAgIHwgICAyIC0NCj4+PiAgIHhlbi9pbmNsdWRlL3B1YmxpYy9hcmNo
LWFybS5oIHwgICA3ICsrKw0KPj4+ICAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAg
IDIgKw0KPj4+ICAgMTAgZmlsZXMgY2hhbmdlZCwgMTc5IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgeGVuL2FyY2gvYXJtL3ZwY2kuYw0KPj4+
ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHhlbi9hcmNoL2FybS92cGNpLmgNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS94ZW4vYXJjaC9hcm0vTWFrZWZpbGUgYi94ZW4vYXJjaC9hcm0vTWFrZWZpbGUNCj4+
PiBpbmRleCA0NGQ3Y2M4MWZhLi5mYjljOTc2ZWEyIDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNo
L2FybS9NYWtlZmlsZQ0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS9NYWtlZmlsZQ0KPj4+IEBAIC03
LDYgKzcsNyBAQCBpZm5lcSAoJChDT05GSUdfTk9fUExBVCkseSkNCj4+PiAgIG9iai15ICs9IHBs
YXRmb3Jtcy8NCj4+PiAgIGVuZGlmDQo+Pj4gICBvYmotJChDT05GSUdfVEVFKSArPSB0ZWUvDQo+
Pj4gK29iai0kKENPTkZJR19IQVNfVlBDSSkgKz0gdnBjaS5vDQo+Pj4gICANCj4+PiAgIG9iai0k
KENPTkZJR19IQVNfQUxURVJOQVRJVkUpICs9IGFsdGVybmF0aXZlLm8NCj4+PiAgIG9iai15ICs9
IGJvb3RmZHQuaW5pdC5vDQo+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW4uYyBi
L3hlbi9hcmNoL2FybS9kb21haW4uYw0KPj4+IGluZGV4IDM2MTM4YzFiMmUuLmZiYjUyZjc4ZjEg
MTAwNjQ0DQo+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbi5jDQo+Pj4gKysrIGIveGVuL2Fy
Y2gvYXJtL2RvbWFpbi5jDQo+Pj4gQEAgLTM5LDYgKzM5LDcgQEANCj4+PiAgICNpbmNsdWRlIDxh
c20vdmdpYy5oPg0KPj4+ICAgI2luY2x1ZGUgPGFzbS92dGltZXIuaD4NCj4+PiAgIA0KPj4+ICsj
aW5jbHVkZSAidnBjaS5oIg0KPj4+ICAgI2luY2x1ZGUgInZ1YXJ0LmgiDQo+Pj4gICANCj4+PiAg
IERFRklORV9QRVJfQ1BVKHN0cnVjdCB2Y3B1ICosIGN1cnJfdmNwdSk7DQo+Pj4gQEAgLTc2Nyw2
ICs3NjgsOSBAQCBpbnQgYXJjaF9kb21haW5fY3JlYXRlKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4g
ICAgICAgaWYgKCBpc19oYXJkd2FyZV9kb21haW4oZCkgJiYgKHJjID0gZG9tYWluX3Z1YXJ0X2lu
aXQoZCkpICkNCj4+PiAgICAgICAgICAgZ290byBmYWlsOw0KPj4+ICAgDQo+Pj4gKyAgICBpZiAo
IChyYyA9IGRvbWFpbl92cGNpX2luaXQoZCkpICE9IDAgKQ0KPj4+ICsgICAgICAgIGdvdG8gZmFp
bDsNCj4+PiArDQo+Pj4gICAgICAgcmV0dXJuIDA7DQo+Pj4gICANCj4+PiAgIGZhaWw6DQo+Pj4g
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9kb21haW5fYnVpbGQuYyBiL3hlbi9hcmNoL2FybS9k
b21haW5fYnVpbGQuYw0KPj4+IGluZGV4IGM1YWZiZTJlMDUuLmY0Yzg5YmRlOGMgMTAwNjQ0DQo+
Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4gKysrIGIveGVuL2FyY2gv
YXJtL2RvbWFpbl9idWlsZC5jDQo+Pj4gQEAgLTMwNTMsNiArMzA1Myw5IEBAIHZvaWQgX19pbml0
IGNyZWF0ZV9kb20wKHZvaWQpDQo+Pj4gICAgICAgaWYgKCBpb21tdV9lbmFibGVkICkNCj4+PiAg
ICAgICAgICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfaW9tbXU7DQo+Pj4gICAN
Cj4+PiArICAgIGlmICggaXNfcGNpX3Bhc3N0aHJvdWdoX2VuYWJsZWQoKSApDQo+Pj4gKyAgICAg
ICAgZG9tMF9jZmcuZmxhZ3MgfD0gWEVOX0RPTUNUTF9DREZfdnBjaTsNCj4+PiArDQo+Pj4gICAg
ICAgZG9tMCA9IGRvbWFpbl9jcmVhdGUoMCwgJmRvbTBfY2ZnLCB0cnVlKTsNCj4+PiAgICAgICBp
ZiAoIElTX0VSUihkb20wKSB8fCAoYWxsb2NfZG9tMF92Y3B1MChkb20wKSA9PSBOVUxMKSApDQo+
Pj4gICAgICAgICAgIHBhbmljKCJFcnJvciBjcmVhdGluZyBkb21haW4gMFxuIik7DQo+Pj4gZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92cGNpLmMgYi94ZW4vYXJjaC9hcm0vdnBjaS5jDQo+Pj4g
bmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+PiBpbmRleCAwMDAwMDAwMDAwLi43NmMxMmI5MjgxDQo+
Pj4gLS0tIC9kZXYvbnVsbA0KPj4+ICsrKyBiL3hlbi9hcmNoL2FybS92cGNpLmMNCj4+PiBAQCAt
MCwwICsxLDEwMiBAQA0KPj4+ICsvKg0KPj4+ICsgKiB4ZW4vYXJjaC9hcm0vdnBjaS5jDQo+Pj4g
KyAqDQo+Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlz
dHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5DQo+Pj4gKyAqIGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYXMgcHVibGlzaGVkIGJ5DQo+Pj4gKyAqIHRo
ZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247IGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlIExpY2Vu
c2UsIG9yDQo+Pj4gKyAqIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQo+Pj4g
KyAqDQo+Pj4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0
IGl0IHdpbGwgYmUgdXNlZnVsLA0KPj4+ICsgKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdp
dGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBvZg0KPj4+ICsgKiBNRVJDSEFOVEFCSUxJ
VFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlDQo+Pj4gKyAq
IEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuDQo+Pj4gKyAqLw0K
Pj4+ICsjaW5jbHVkZSA8eGVuL3NjaGVkLmg+DQo+Pj4gKw0KPj4+ICsjaW5jbHVkZSA8YXNtL21t
aW8uaD4NCj4+PiArDQo+Pj4gKyNkZWZpbmUgUkVHSVNURVJfT0ZGU0VUKGFkZHIpICAoIChhZGRy
KSAmIDB4MDAwMDBmZmYpDQo+Pj4gKw0KPj4+ICsvKiBEbyBzb21lIHNhbml0eSBjaGVja3MuICov
DQo+Pj4gK3N0YXRpYyBib29sIHZwY2lfbW1pb19hY2Nlc3NfYWxsb3dlZCh1bnNpZ25lZCBpbnQg
cmVnLCB1bnNpZ25lZCBpbnQgbGVuKQ0KPj4+ICt7DQo+Pj4gKyAgICAvKiBDaGVjayBhY2Nlc3Mg
c2l6ZS4gKi8NCj4+PiArICAgIGlmICggbGVuID4gOCApDQo+Pj4gKyAgICAgICAgcmV0dXJuIGZh
bHNlOw0KPj4+ICsNCj4+PiArICAgIC8qIENoZWNrIHRoYXQgYWNjZXNzIGlzIHNpemUgYWxpZ25l
ZC4gKi8NCj4+PiArICAgIGlmICggKHJlZyAmIChsZW4gLSAxKSkgKQ0KPj4+ICsgICAgICAgIHJl
dHVybiBmYWxzZTsNCj4+PiArDQo+Pj4gKyAgICByZXR1cm4gdHJ1ZTsNCj4+PiArfQ0KPj4+ICsN
Cj4+PiArc3RhdGljIGludCB2cGNpX21taW9fcmVhZChzdHJ1Y3QgdmNwdSAqdiwgbW1pb19pbmZv
X3QgKmluZm8sDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnaXN0ZXJfdCAqciwg
dm9pZCAqcCkNCj4+PiArew0KPj4+ICsgICAgdW5zaWduZWQgaW50IHJlZzsNCj4+PiArICAgIHBj
aV9zYmRmX3Qgc2JkZjsNCj4+PiArICAgIHVuc2lnbmVkIGxvbmcgZGF0YSA9IH4wVUw7DQo+Pj4g
KyAgICB1bnNpZ25lZCBpbnQgc2l6ZSA9IDFVIDw8IGluZm8tPmRhYnQuc2l6ZTsNCj4+PiArDQo+
Pj4gKyAgICBzYmRmLnNiZGYgPSBNTUNGR19CREYoaW5mby0+Z3BhKTsNCj4+PiArICAgIHJlZyA9
IFJFR0lTVEVSX09GRlNFVChpbmZvLT5ncGEpOw0KPj4+ICsNCj4+PiArICAgIGlmICggIXZwY2lf
bW1pb19hY2Nlc3NfYWxsb3dlZChyZWcsIHNpemUpICkNCj4+PiArICAgICAgICByZXR1cm4gMDsN
Cj4+PiArDQo+Pj4gKyAgICBkYXRhID0gdnBjaV9yZWFkKHNiZGYsIHJlZywgbWluKDR1LCBzaXpl
KSk7DQo+Pj4gKyAgICBpZiAoIHNpemUgPT0gOCApDQo+Pj4gKyAgICAgICAgZGF0YSB8PSAodWlu
dDY0X3QpdnBjaV9yZWFkKHNiZGYsIHJlZyArIDQsIDQpIDw8IDMyOw0KPj4+ICsNCj4+PiArICAg
ICpyID0gZGF0YTsNCj4+PiArDQo+Pj4gKyAgICByZXR1cm4gMTsNCj4+PiArfQ0KPj4+ICsNCj4+
PiArc3RhdGljIGludCB2cGNpX21taW9fd3JpdGUoc3RydWN0IHZjcHUgKnYsIG1taW9faW5mb190
ICppbmZvLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICByZWdpc3Rlcl90IHIsIHZv
aWQgKnApDQo+Pj4gK3sNCj4+PiArICAgIHVuc2lnbmVkIGludCByZWc7DQo+Pj4gKyAgICBwY2lf
c2JkZl90IHNiZGY7DQo+Pj4gKyAgICB1bnNpZ25lZCBsb25nIGRhdGEgPSByOw0KPj4+ICsgICAg
dW5zaWduZWQgaW50IHNpemUgPSAxVSA8PCBpbmZvLT5kYWJ0LnNpemU7DQo+Pj4gKw0KPj4+ICsg
ICAgc2JkZi5zYmRmID0gTU1DRkdfQkRGKGluZm8tPmdwYSk7DQo+Pj4gKyAgICByZWcgPSBSRUdJ
U1RFUl9PRkZTRVQoaW5mby0+Z3BhKTsNCj4+PiArDQo+Pj4gKyAgICBpZiAoICF2cGNpX21taW9f
YWNjZXNzX2FsbG93ZWQocmVnLCBzaXplKSApDQo+Pj4gKyAgICAgICAgcmV0dXJuIDA7DQo+Pj4g
Kw0KPj4+ICsgICAgdnBjaV93cml0ZShzYmRmLCByZWcsIG1pbig0dSwgc2l6ZSksIGRhdGEpOw0K
Pj4+ICsgICAgaWYgKCBzaXplID09IDggKQ0KPj4+ICsgICAgICAgIHZwY2lfd3JpdGUoc2JkZiwg
cmVnICsgNCwgNCwgZGF0YSA+PiAzMik7DQo+PiBJIHRoaW5rIHRob3NlIHR3byBoZWxwZXJzIChh
bmQgdnBjaV9tbWlvX2FjY2Vzc19hbGxvd2VkKSBhcmUgdmVyeQ0KPj4gc2ltaWxhciB0byB0aGUg
ZXhpc3RpbmcgeDg2IG9uZXMgKHNlZSB2cGNpX21tY2ZnX3tyZWFkLHdyaXRlfSksIHVwIHRvDQo+
PiB0aGUgcG9pbnQgd2hlcmUgSSB3b3VsZCBjb25zaWRlciBtb3ZpbmcgdGhlIHNoYXJlZCBjb2Rl
IHRvIHZwY2kuYyBhcw0KPj4gdnBjaV9lY2FtX3tyZWFkLHdyaXRlfSBhbmQgY2FsbCB0aGVtIGZy
b20gdGhlIGFyY2ggc3BlY2lmaWMgdHJhcA0KPj4gaGFuZGxlcnMuDQo+IEV4Y2VwdCB0aGF0IHBs
ZWFzZSBjYW4gd2Ugc3RpY2sgdG8gbWNmZyBvciBtbWNmZyBpbnN0ZWFkIG9mIGVjYW0NCj4gaW4g
bmFtZXMsIGFzIHRoYXQncyBob3cgdGhlIHRoaW5nIGhhcyBiZWVuIG5hbWVkIGluIFhlbiBmcm9t
IGl0cw0KPiBpbnRyb2R1Y3Rpb24/IEkndmUganVzdCBncmVwLWVkIHRoZSBjb2RlIGJhc2UgKGNh
c2UgaW5zZW5zaXRpdmVseSkNCj4gYW5kIGZvdW5kIG5vIG1lbnRpb24gb2YgRUNBTS4gVGhlcmUg
YXJlIG9ubHkgYSBmZXcgImJlY2FtZSIuDQpJIGRvIHVuZGVyc3RhbmQgdGhhdCB0aGlzIGlzIGhp
c3RvcmljYWxseSB0aGF0IHdlIGRvIG5vdCBoYXZlIEVDQU0gaW4gWGVuLA0KYnV0IFBDSSBpcyBu
b3QgYWJvdXQgWGVuLiBUaHVzLCBJIHRoaW5rIGl0IGlzIGFsc28gYWNjZXB0YWJsZSB0byB1c2UN
CmEgY29tbW9ubHkga25vd24gRUNBTSBmb3IgdGhlIGNvZGUgdGhhdCB3b3JrcyB3aXRoIEVDQU0u
DQpBdCBsZWFzdCBmb3IgdGhlIG5ldyBjb2RlDQo+IEphbg0KPg0KPg0K

