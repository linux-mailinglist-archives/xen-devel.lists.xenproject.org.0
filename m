Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46744532D8
	for <lists+xen-devel@lfdr.de>; Tue, 16 Nov 2021 14:29:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.226271.390952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmyUx-0007hn-Fn; Tue, 16 Nov 2021 13:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 226271.390952; Tue, 16 Nov 2021 13:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmyUx-0007fq-C2; Tue, 16 Nov 2021 13:27:43 +0000
Received: by outflank-mailman (input) for mailman id 226271;
 Tue, 16 Nov 2021 13:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0oQI=QD=epam.com=prvs=1954156bad=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mmyUv-0007fj-Pb
 for xen-devel@lists.xenproject.org; Tue, 16 Nov 2021 13:27:42 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f76f7e39-46e0-11ec-9787-a32c541c8605;
 Tue, 16 Nov 2021 14:27:39 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AGDL7Gv005074;
 Tue, 16 Nov 2021 13:27:34 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ccd97023u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 13:27:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 13:27:29 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 13:27:29 +0000
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
X-Inumbo-ID: f76f7e39-46e0-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QF+4vyTcwLHK5VetUqhuNydD4qy9p+b+N6rbStLDibXnbz9zFGRrlmbfqAFbxf4vw3c6Yl64bL3X/HliXrONZmCsmBgLjeX2oZb52pUsP4YEC4pe3GZo0g0GUPXxb3WREejDmunl4LRFhKVBb9RM6SF9rAJePBBGGkT1B9l1c6KIqZ4/WsArInI3t8FIA/8UulUsP9DT26qwRYqt8FpsW1jJOGFVoNzKH9U9gWYXdS+5pVJIaDUOa4M1tzqpEORtTuNRCNlbsx7uOxMgCn8AJ0YgU6Z/33ak3ifS1rtrBQSCuWVw2/24WO1tVBciO9EjCrc9C/aCla6pB+nlIUNjGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ti70ImF0/SQrtvJIs5aqcQf+tir2MxpPalw/Ty2FmZU=;
 b=dlXxqMu8TRxrya0oGs60SVRPiUirQNArAIgNGIdVzd1veFlOSg3wPhcw2iyOCQaWVf/E7cStxAIxzeeWLRrpea672/gL8iAxwtDrdfv4AgdeOqysH0U82r4/Zt1jrqloqDza81mbGtEQLWUjRUHcejmrmtb1VUT2fOX14V+oi6yr6g2CjaI9JxCeU0jdoAtTqwFnNvUHkWNmgLrCZTrvhKnU7bJfJESqCDR/WwkvMlQ6EJgRxP3Mgr9AcUVVTon2Gky7wowggf0FSdvRPnBWl+p2xwyN1mxqOPHNewZ/16PxD1N+wyFCZdbNpo5lIUhNkYV283u1TXNWfjmjOdLH9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ti70ImF0/SQrtvJIs5aqcQf+tir2MxpPalw/Ty2FmZU=;
 b=WNOJu7dnm0sVWTJftXotkujalvAokAt1y0ZzeXPeqpOBUGw+5EGplXfR8nRsfenRUWgmsT3KR7DhtUWhNiwQgW7gKG34G/Iu/WtjnaT95uRvzCcb3UZN8uRWQZ1vLrdB2No7TOZxA6zTOF/fZ7u+7pWA8ne/QZxwOtbY1G7rWyid4EsoOREeSjVOK26Vrx+feZCOKGOaLm2EnJUsv5XSy/3KYm2zKmdbrMcMuz1N4jVEvMgYQoJ9/CGl1iaBwMaAFqDoXwEQLCYnIkGHwi5qfEcTBcHi+OoCnt2englhhDFzFSeSoiHR06HvLwCHZ8L1Z0ypDllPR8Hyxh7DXT2e8A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Topic: [PATCH v4 02/11] vpci: cancel pending map/unmap on vpci removal
Thread-Index: 
 AQHX0hJIYALl/D9fL0OD6N0XGDJh2awE30EAgAD09oCAAAgGAIAABgyAgAA2qYCAAB5PAA==
Date: Tue, 16 Nov 2021 13:27:29 +0000
Message-ID: <cc7fb79b-5a43-3bdc-4621-097a01982f49@epam.com>
References: <20211105065629.940943-1-andr2000@gmail.com>
 <20211105065629.940943-3-andr2000@gmail.com>
 <5bd70935-4968-b8d4-4d6c-7ec0fc54ee6a@suse.com>
 <4e12f7de-19cb-bc79-4df0-6fb52538a944@epam.com>
 <5b47cd28-5264-9f24-38a0-e9dec6c2c1b4@suse.com>
 <b87a51d2-cd96-d0ac-8718-7f2b2feed531@epam.com>
 <b8de7b20-539b-23e7-1ee4-9a777be296a3@suse.com>
In-Reply-To: <b8de7b20-539b-23e7-1ee4-9a777be296a3@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2432cdce-9571-4ecc-a910-08d9a904d6d1
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB2195E3BA546F5AAAD725BA14E7999@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 tyRJSMdhb6/0dEYqxJUZXM0dpTsX2BG8dePyEdo9+4BPdcz82SPouU4VtQGGy1mgm4puB//5kSvqGC2iX1kz3aJ2wssmoPPfPBDvNHKC/s5UadpJhRM/FlVRRN8GPApIhYAq5hyfnUo8wyCR1TFNx4VPLM+ywrGT9+ZPQmwRmyL5Q71+ecpCuMb8qrRfZDyXn8D1aq3OcMLR3ijtuzZ38r2sw3GE8hEuL3oclYzqXY4yKqGoxrJ1oxZ9UtCPk73HElRTs3lDjzDZdigvUUNo6yjhjp0VA2QUZRArD5wuDzay9C9vfl+ibeDR3VkBt+yN4f2Jo5PLMrwvUjHH9OHCIMNL/iq7qzK66Og7pOecnPDb1Hraik0/Gs6w0RauYWCVE/nU3IgiGE9hepXcuAL8Pi4Ms8kXiIbihaU8MmT5LZgpvu6qpk44veLOQAFsuClqSayoyKThVQCtBYHaSO4wBWhJsBkF1r725N7nydSgKJ6l4awTCxpMKlIYfJxpZXfbpWSnPGuVWcShXj1ZvfYwyoOlNriSZvKoLnRvR/Y2emlletCWzOoWMPwu0qbB8iO+1NLFrx4mbeyVqNDUM/jgHPTX3H6VJbp+qOIUIQwbBUvvZYd8WCoK8qCivwFxXxjJOmcom2RAXiGBxYscsljTnqgdljhoSgBQqSFKs05+7fFggoHQ1lh6KLu8pderPc65VdXdCbDjTtiWuC2f0whiBmyAynTMNlJvkf7wS06O0x+vBobUFNJTndvhrTME3P3k
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(83380400001)(2906002)(6506007)(8676002)(4326008)(5660300002)(7416002)(31696002)(66446008)(66556008)(91956017)(66946007)(71200400001)(64756008)(66476007)(76116006)(38070700005)(508600001)(38100700002)(54906003)(122000001)(186003)(31686004)(110136005)(107886003)(86362001)(26005)(6486002)(6512007)(53546011)(2616005)(316002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?enhVUjUzTkN6dzJzaFFkVlhVVzVvNlFzK25FRENWeUVNZnVJRE5lTnFpTG9u?=
 =?utf-8?B?RWJQaVNoTnZNWFVmOERKd3hyWlM3cDVoWEJtY0p5YlJQenBGOVpUUmlBbzJM?=
 =?utf-8?B?Q1dUWDVJTEs4R0N3cXBZUTJCWDIzaXFqTXphTWFQZXA1QWJQRFhjZlc2Z25N?=
 =?utf-8?B?eUNud3o1d05VNnlWM1poTHNLMFo2ekhvWGRJcnRZN2VPNjA4VWJuTEpWWjBT?=
 =?utf-8?B?dnJrOTNHTGUxRjhxMjNoOCtqVFNxSDFabTFidTRzQzc2TU5vVUM3OTRWSW8w?=
 =?utf-8?B?UllSaU5hbS81bytwTjUvS2RVQnltZ2xqaXNaYTdtcUNJTjE5M2c1eTA4VVBK?=
 =?utf-8?B?L0o3VkdaTU5YSjMycUQyOFkyZ1hiRmsvajF6V3ZzYkgxRlY4RC9yQngrc1du?=
 =?utf-8?B?NFpJbTJYVHdhK0xOcE5wZnlSM0owd3ZCV0QveHRPVFNyNXZRTGt3c2NyMDNs?=
 =?utf-8?B?RVQzNlR5WC85dkZGOG1oMC9qMWhiTFlaSFIxb1VHd1NzcHkvWVdab2xnR3FW?=
 =?utf-8?B?Z2wwL2NjSk84bVdGa0NOY1pGUm1hZTJSSGxTNGYydW5xSTBXQnkxRU16UGVm?=
 =?utf-8?B?ZTZZUGNWalpRM3JQcm5PUFZscm9lYnN2ZXpzTjQxaW52cjNpZkFtanc5MHN6?=
 =?utf-8?B?cXp5ODFEVC9sYk1Tbmgrb0tmczlMVHpxOGw1WHNnd3JUSE95T0FVbkg5bXp0?=
 =?utf-8?B?T1J1V1l4THd4aTg3aUhEOUlTeE40Qnd0TDhCelBHSm9WMzVMUEc5a1hGNHli?=
 =?utf-8?B?TituaUhvUkhCV3VCZzNxeG5DUXZoendZN0doZ0kvTUY0eGF6eEZpS2pVK0VU?=
 =?utf-8?B?WEdiSlczS01xVXdVUUhGclJMV1JqVHpJZFU5Q2FDNlZWTThnRXRhUXJ4bVRz?=
 =?utf-8?B?ck5vQWdhRDJqVGNVM2dCZkpLcUY2SnkyRXJuc2NCYjA3cXdDS0RwZ3BDOEpx?=
 =?utf-8?B?VHN0cEw4VlBidUN2bm9sYUVwREJodlYxb1ZObnlySXRicG10QWJ3Mkh1Tmkx?=
 =?utf-8?B?aXhKUzUwYVVsZ1VGMzdOSTZSNVA0RkRDYW5lZXluK250QzUvNG1wRkxnc3hI?=
 =?utf-8?B?SDdid1F0ZWhESkpDcXMyaUE2VTc1cTExZGRwc2FDa21mOFdMeWpWNkNxVzJZ?=
 =?utf-8?B?S3lrTUZXV1NQTVUyWHBUODErT2g1RzB1azgyZndSTndsa2dEbFNidEtOd1p2?=
 =?utf-8?B?eFhOeEs4dUdaalArRUxBb3J0OWJmNHQySk5iZGJwU3Q5NEVvbkQrSVkxek52?=
 =?utf-8?B?TzZ1eEMyWGFVTklrYkdRSUtHemJEOWlLakNCYWtFdXpFT1FqZzlYcldQajhs?=
 =?utf-8?B?eWlMQWJURjFTSyt4OHNUUVdBZzh3T2VJYUFlak8yN2piS2JNajhxOFdGaGRl?=
 =?utf-8?B?UzlmRm13V3o2RE5xUWlTUGc0aG5EVDJlVnhCRjA3N2hMRFdDODJSaVpESUZE?=
 =?utf-8?B?Rzh3MXdoWlM5Yi84aHNJZWRLY1R4WUhrTHcrSEhzZm9TSnlCdkpYNld3Yit2?=
 =?utf-8?B?dk1xenJmZ0ZzK1hmcDBlVUUwRWxzT3NGL2tXS0VuNUk3UXJ0TmJDNkluR2ly?=
 =?utf-8?B?dDZJclByOXdTWlhwZFZrVTZjV2NCeWg3RnNZcEhOVFBXYnhidWZOSzg0NitT?=
 =?utf-8?B?bTdhZmJuR0ZFYWhaVjZYRUxUdGE4UXQvY0h2bzQvZFN0T0JKZlg5RDh0ZnJs?=
 =?utf-8?B?eXAwekN5dmNieVdsNWRoNjg3MGh1a2VDWFF4ekJmV3JwdnRhMWIwb1lQYWgr?=
 =?utf-8?B?RnhSdTZjQ2lRaWxZZDJHRVY3WWlkWVpiWHc4T21pNkhnaUVXR2xobkhxQ09r?=
 =?utf-8?B?VUJyTmJuSDlhcnU2K1hQVWIrK2diV1N2YXpvT0tFSFh0ZkVuTWVURFZ6NW5D?=
 =?utf-8?B?d1VrT21QTHU2T2tpRzRQa0tJRGVLK0VmQU5uNFBseXBRb1NlRUJCZHMzckhZ?=
 =?utf-8?B?Y3B3ZnJrWSt1K2VDYisxRzdTc0JUbzlZWW9xNGlvT1NJeFI3cE1NbWtNcHhT?=
 =?utf-8?B?UmFla0tuUCtHeWFVTHp2eHBPeWhFdWlsc1gwc3RKcXNGbjZyZ0xzUjRMMTd1?=
 =?utf-8?B?K3BHQ0hNMU0wWWVjbUppQndqTnlUWTdhcTlveHh0SWlZMHpvM0hTcjBGaHdq?=
 =?utf-8?B?V2FjRVlEUEt2NGNMZEJHekVRZ1A3ZzQyRW1mZWVuZWRrbTM4c0RDbHpPWkFH?=
 =?utf-8?B?S1lxdStJb0VkOGZPQ05TRE05WDlPUVVRbytMYitVZGtQaDN5NzQzZkdvV251?=
 =?utf-8?B?OGw3V255T2w4TUVqWVdkNyt3MHpJcmY3UHF6UlZXSUNqRE04VFA1R2hXUDZY?=
 =?utf-8?B?RlhYVTdhTWl0S0FHUkxFcmZ4VzN1YUhLTU4wZVRJVkZ4elowWjI3QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4C44341D34DDED4D9FA6531310588E5C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2432cdce-9571-4ecc-a910-08d9a904d6d1
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2021 13:27:29.6801
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /9QqPp+MBspjr80+/q8/j8Z6vQszFsO2qGxqETFOEZO898lJARzqmfYaahplrmusTSYkhvouVxt1Uh3kPFy+5hlsxkaa6u6u024TEkLQ0zohbqYpVVXIw6YhxzD597yw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-ORIG-GUID: GDygQeI9Hp9q-DTbE29c2r86_-NdYnQI
X-Proofpoint-GUID: GDygQeI9Hp9q-DTbE29c2r86_-NdYnQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_02,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160068

DQoNCk9uIDE2LjExLjIxIDEzOjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTYuMTEuMjAy
MSAwOToyMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTYuMTEu
MjEgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE2LjExLjIwMjEgMDg6MzIsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxNS4xMS4yMSAxODo1NiwgSmFu
IEJldWxpY2ggd3JvdGU6DQo+Pj4+PiBPbiAwNS4xMS4yMDIxIDA3OjU2LCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+PiBAQCAtMTY1LDYgKzE2NCwxOCBAQCBib29sIHZwY2lf
cHJvY2Vzc19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+Pj4+ICAgICAgICAgcmV0dXJuIGZh
bHNlOw0KPj4+Pj4+ICAgICB9DQo+Pj4+Pj4gICAgIA0KPj4+Pj4+ICt2b2lkIHZwY2lfY2FuY2Vs
X3BlbmRpbmcoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+Pj4+Pj4gK3sNCj4+Pj4+PiAr
ICAgIHN0cnVjdCB2Y3B1ICp2ID0gY3VycmVudDsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICAvKiBD
YW5jZWwgYW55IHBlbmRpbmcgd29yayBub3cuICovDQo+Pj4+PiBEb2Vzbid0ICJhbnkiIGluY2x1
ZGUgcGVuZGluZyB3b3JrIG9uIGFsbCB2Q1BVLXMgb2YgdGhlIGd1ZXN0LCBub3QNCj4+Pj4+IGp1
c3QgY3VycmVudD8gSXMgY3VycmVudCBldmVuIHJlbGV2YW50IChhcyBpbjogcGFydCBvZiB0aGUg
Y29ycmVjdA0KPj4+Pj4gZG9tYWluKSwgY29uc2lkZXJpbmcgLi4uDQo+Pj4+Pg0KPj4+Pj4+IC0t
LSBhL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBj
aS92cGNpLmMNCj4+Pj4+PiBAQCAtNTEsNiArNTEsOCBAQCB2b2lkIHZwY2lfcmVtb3ZlX2Rldmlj
ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4+PiAgICAgICAgICAgICB4ZnJlZShyKTsNCj4+
Pj4+PiAgICAgICAgIH0NCj4+Pj4+PiAgICAgICAgIHNwaW5fdW5sb2NrKCZwZGV2LT52cGNpLT5s
b2NrKTsNCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgICB2cGNpX2NhbmNlbF9wZW5kaW5nKHBkZXYpOw0K
Pj4+Pj4gLi4uIHRoaXMgY29kZSBwYXRoLCB3aGVuIGNvbWluZyBoZXJlIGZyb20gcGNpX3thZGQs
cmVtb3ZlfV9kZXZpY2UoKT8NCj4+Pj4+DQo+Pj4+PiBJIGNhbiBhZ3JlZSB0aGF0IHRoZXJlJ3Mg
YSBwcm9ibGVtIGhlcmUsIGJ1dCBJIHRoaW5rIHlvdSBuZWVkIHRvDQo+Pj4+PiBwcm9wZXJseSAo
aS5lLiBpbiBhIHJhY2UgZnJlZSBtYW5uZXIpIGRyYWluIHBlbmRpbmcgd29yay4NCj4+Pj4gWWVz
LCB0aGUgY29kZSBpcyBpbmNvbnNpc3RlbnQgd2l0aCB0aGlzIHJlc3BlY3QuIEkgYW0gdGhpbmtp
bmcgYWJvdXQ6DQo+Pj4+DQo+Pj4+IHZvaWQgdnBjaV9jYW5jZWxfcGVuZGluZyhjb25zdCBzdHJ1
Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gew0KPj4+PiAgICDCoMKgwqAgc3RydWN0IGRvbWFpbiAq
ZCA9IHBkZXYtPmRvbWFpbjsNCj4+Pj4gICAgwqDCoMKgIHN0cnVjdCB2Y3B1ICp2Ow0KPj4+Pg0K
Pj4+PiAgICDCoMKgwqAgLyogQ2FuY2VsIGFueSBwZW5kaW5nIHdvcmsgbm93LiAqLw0KPj4+PiAg
ICDCoMKgwqAgZG9tYWluX2xvY2soZCk7DQo+Pj4+ICAgIMKgwqDCoCBmb3JfZWFjaF92Y3B1ICgg
ZCwgdiApDQo+Pj4+ICAgIMKgwqDCoCB7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIHZjcHVfcGF1
c2Uodik7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIGlmICggdi0+dnBjaS5tZW0gJiYgdi0+dnBj
aS5wZGV2ID09IHBkZXYpDQo+Pj4gTml0OiBTYW1lIHN0eWxlIGlzc3VlIGFzIGluIHRoZSBvcmln
aW5hbCBwYXRjaC4NCj4+IFdpbGwgZml4DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIHsNCj4+Pj4g
ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYW5nZXNldF9kZXN0cm95KHYtPnZwY2kubWVtKTsN
Cj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2LT52cGNpLm1lbSA9IE5VTEw7DQo+Pj4+
ICAgIMKgwqDCoMKgwqDCoMKgIH0NCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgdmNwdV91bnBhdXNl
KHYpOw0KPj4+PiAgICDCoMKgwqAgfQ0KPj4+PiAgICDCoMKgwqAgZG9tYWluX3VubG9jayhkKTsN
Cj4+Pj4gfQ0KPj4+Pg0KPj4+PiB3aGljaCBzZWVtcyB0byBzb2x2ZSBhbGwgdGhlIGNvbmNlcm5z
LiBJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+Pj4gU29tZXRoaW5nIGFsb25nIHRoZXNlIGxpbmVz
LiBJIGV4cGVjdCB5b3Ugd2lsbCB3YW50IHRvIG1ha2UgdXNlIG9mDQo+Pj4gZG9tYWluX3BhdXNl
X2V4Y2VwdF9zZWxmKCksDQo+PiBZZXMsIHRoaXMgaXMgd2hhdCBpcyBuZWVkZWQgaGVyZSwgdGhh
bmtzLiBUaGUgb25seSBxdWVzdGlvbiBpcyB0aGF0DQo+Pg0KPj4gaW50IGRvbWFpbl9wYXVzZV9l
eGNlcHRfc2VsZihzdHJ1Y3QgZG9tYWluICpkKQ0KPj4gew0KPj4gW3NuaXBdDQo+PiAgIMKgwqDC
oMKgwqDCoMKgIC8qIEF2b2lkIHJhY2luZyB3aXRoIG90aGVyIHZjcHVzIHdoaWNoIG1heSB3YW50
IHRvIGJlIHBhdXNpbmcgdXMgKi8NCj4+ICAgwqDCoMKgwqDCoMKgwqAgaWYgKCAhc3Bpbl90cnls
b2NrKCZkLT5oeXBlcmNhbGxfZGVhZGxvY2tfbXV0ZXgpICkNCj4+ICAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVSRVNUQVJUOw0KPj4NCj4+IHNvIGl0IGlzIG5vdCBjbGVhciB3aGF0
IGRvIHdlIGRvIGluIGNhc2Ugb2YgLUVSRVNUQVJUOiBkbyB3ZSB3YW50IHRvIHNwaW4/DQo+PiBP
dGhlcndpc2Ugd2Ugd2lsbCBsZWF2ZSB0aGUgam9iIG5vdCBkb25lIGVmZmVjdGl2ZWx5IG5vdCBj
YW5jZWxpbmcgdGhlDQo+PiBwZW5kaW5nIHdvcmsuIEFueSBpZGVhIG90aGVyIHRoZW4gc3Bpbm5p
bmc/DQo+IERlcGVuZHMgb24gdGhlIGNhbGwgY2hhaW4geW91IGNvbWUgdGhyb3VnaC4gVGhlcmUg
bWF5IG5lZWQgdG8gYmUgc29tZQ0KPiByZWFycmFuZ2VtZW50cyBzdWNoIHRoYXQgeW91IG1heSBi
ZSBhYmxlIHRvIHByZWVtcHQgdGhlIGVuY2xvc2luZw0KPiBoeXBlcmNhbGwuDQpXZWxsLCB0aGVy
ZSBhcmUgdGhyZWUgcGxhY2VzIHdoaWNoIG1heSBsZWFkIHRvIHRoZSBwZW5kaW5nIHdvcmsNCm5l
ZWRzIHRvIGJlIGNhbmNlbGVkOg0KDQpNTUlPIHRyYXAgLT4gdnBjaV93cml0ZSAtPiB2cGNpX2Nt
ZF93cml0ZSAtPiBtb2RpZnlfYmFycyAtPiB2cGNpX2NhbmNlbF9wZW5kaW5nIChvbiBtb2RpZnlf
YmFycyBmYWlsIHBhdGgpDQoNClBIWVNERVZPUF9wY2lfZGV2aWNlX2FkZCAtPiBwY2lfYWRkX2Rl
dmljZSAoZXJyb3IgcGF0aCkgLT4gdnBjaV9yZW1vdmVfZGV2aWNlIC0+IHZwY2lfY2FuY2VsX3Bl
bmRpbmcNCg0KUEhZU0RFVk9QX3BjaV9kZXZpY2VfcmVtb3ZlIC0+IHBjaV9yZW1vdmVfZGV2aWNl
IC0+IHZwY2lfcmVtb3ZlX2RldmljZSAtPiB2cGNpX2NhbmNlbF9wZW5kaW5nDQoNClNvLCB0YWtp
bmcgaW50byBhY2NvdW50IHRoZSBNTUlPIHBhdGgsIEkgdGhpbmsgYWJvdXQgdGhlIGJlbG93IGNv
ZGUNCg0KIMKgwqDCoCAvKg0KIMKgwqDCoMKgICogQ2FuY2VsIGFueSBwZW5kaW5nIHdvcmsgbm93
Lg0KIMKgwqDCoMKgICoNCiDCoMKgwqDCoCAqIEZJWE1FOiB0aGlzIGNhbiBiZSBjYWxsZWQgZnJv
bSBhbiBNTUlPIHRyYXAgaGFuZGxlcidzIGVycm9yDQogwqDCoMKgwqAgKiBwYXRoLCBzbyB3ZSBj
YW5ub3QganVzdCByZXR1cm4gYW4gZXJyb3IgY29kZSBoZXJlLCBzbyB1cHBlcg0KIMKgwqDCoMKg
ICogbGF5ZXJzIGNhbiBoYW5kbGUgaXQuIFRoZSBiZXN0IHdlIGNhbiBkbyBpcyB0byBzdGlsbCB0
cnkNCiDCoMKgwqDCoCAqIHJlbW92aW5nIHRoZSByYW5nZSBzZXRzLg0KIMKgwqDCoMKgICovDQog
wqDCoMKgIHdoaWxlICggKHJjID0gZG9tYWluX3BhdXNlX2V4Y2VwdF9zZWxmKGQpKSA9PSAtRVJF
U1RBUlQgKQ0KIMKgwqDCoMKgwqDCoMKgIGNwdV9yZWxheCgpOw0KDQogwqDCoMKgIGlmICggcmMg
KQ0KIMKgwqDCoMKgwqDCoMKgIHByaW50ayhYRU5MT0dfR19FUlINCiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICJGYWlsZWQgdG8gcGF1c2UgdkNQVXMgd2hpbGUgY2FuY2VsaW5nIHZQQ0kg
bWFwL3VubWFwIGZvciAlcHAgJXBkOiAlZFxuIiwNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICZwZGV2LT5zYmRmLCBwZGV2LT5kb21haW4sIHJjKTsNCg0KSSBhbSBub3Qgc3VyZSBob3cg
dG8gaGFuZGxlIHRoaXMgb3RoZXJ3aXNlDQpAUm9nZXIsIGRvIHlvdSBzZWUgYW55IG90aGVyIGdv
b2Qgd2F5Pw0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

