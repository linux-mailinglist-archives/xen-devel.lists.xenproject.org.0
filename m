Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8F84B6B61
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:45:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273069.468126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwGq-0005bK-6i; Tue, 15 Feb 2022 11:45:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273069.468126; Tue, 15 Feb 2022 11:45:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJwGq-0005YE-2r; Tue, 15 Feb 2022 11:45:24 +0000
Received: by outflank-mailman (input) for mailman id 273069;
 Tue, 15 Feb 2022 11:45:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJwGo-0005Y7-MT
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:45:22 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c06122aa-8e54-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 12:45:21 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FBbBuV021881;
 Tue, 15 Feb 2022 11:45:16 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e89njgend-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 11:45:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR03MB4301.eurprd03.prod.outlook.com (2603:10a6:803:5e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18; Tue, 15 Feb
 2022 11:45:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 11:45:11 +0000
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
X-Inumbo-ID: c06122aa-8e54-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2Rgt8WY0KM4Y/5kVd5Hd5q1vONmD5/0c92w4bYjwEgVsQ/5FQyr44mXc1YzJr4o3usm3CwGzTvSYVESbBjltICFCu7h0JgF8D+skW8BFTb+qHkE2Z2EYZHTK2KFOiNhOEpry8zWLB/gYT/n845oauj8B+IWOek6ZUxfXV9DW7HriZkMHFVYsASWaqHotRAAY1oLC7B376urmBoAJ4vxAn4vy+p0pmT+p2LoDLUOcSJ9N6Hv4JP7aFc3zLXIz94zqg43l1gC3LhQFSlTE5BO+N7XnyBBKi/02eNmJvacQ1llr2S+zx+/rRp5g96o3DrGqdD+yX40jh7D2zq3Z7NJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6guLOEroULM9IKHWLhN0puwOFHN5Z3jUhE3Y1oJbSyM=;
 b=U+H0HxojelU1ZIIPt0wpvjhHc7Qe8dAY6QNfSyVbKBKRFDcvceOVNKoLvJMwsquQ4Dqyhr63PWQqHGqP/ycxb/4ljGo0f6wc40N+UNHZnfKUJPwA24uFowU7yrRyLSOIoolmiJjE8Ul9fRAmODP+IA9FIMSxvmYRw6xswpFZGBuyAZwBxiJJ4Ns5g6SAKwfqsdEIk+7zVQd31YtwWBiG+lcZBKZ56653VJBlSDTF29XeZIQRzMTkdpChXi1dbnjepX+L/2C3oT9uBr3XSK9ETeLpqTd6rn+61wJnTAhuBlJMhGbizKALtDriSAaHfmFHW1a1e5c1LWV7E3zqrcbVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6guLOEroULM9IKHWLhN0puwOFHN5Z3jUhE3Y1oJbSyM=;
 b=Fa4ThfGTC2wxGZU2FAxq7WXH3LK0L4fS7sXcWlmkwe0A7ysECxmuZcE4a7/jO9t3wSP7ebH2abeF90R7nzR4g6StFW70/yQPVWuStSP/z9WRa3BfJB3rbwmRsTW6gAWKmlbQCExa1SSdWgn60HPvYMInNHf0D9wb2OuYrMqLj+F2PYsEMPYx+CCm9p9r+pIlMkLbS/MZQSupMv+k0IJxqUOh7NYO9Te9tfm8AflupgpneN6D1vQPq75KwbMrPNdPcr3A3w2nmr1y8ofvzQYiSncyr3hUt/lq7EjdwLZ40jWDGqYI6OHC+QzKMp7gaP+3oann0NHExfk9m8x9SgOK/g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYCAAAeVgIAAAZQA
Date: Tue, 15 Feb 2022 11:45:11 +0000
Message-ID: <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
In-Reply-To: <YguQ8wfhfYFXTWSU@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e19a421-969f-4ba5-96cc-08d9f0789f9e
x-ms-traffictypediagnostic: VI1PR03MB4301:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR03MB4301F4E9044315AE9CC7E1DFE7349@VI1PR03MB4301.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 cM6ngiRTuDlN1/WTQcG8OImiRPCjXJu6sUoUzibdwg8Fb9+cTzePQeVzDMXlh2Dt+mz+qG78WoIqqrBs10QMOfePV1cDsHuH4smh/ZiR3MDAsjetKKFLc+FTRIhD3vGZwDKhF2nTQ6Te5q8Wk4UrHUaQ2aM/0tOjGu1H0a6MzfUPgGxULBgzBkIgqt9tixYV5lwpxZgAqmzwL+BYmnCPOWc/p2jY+3i8sAHzpFd7lggtcb5/irpvZyUNMwwIqINzh+1xqayYYF1JFDYBMlBq7rRGZ3uw989jOL+eAYYbposNDyNo8srx2s0ZQGLXpgBhobDeG1LBozcEFxH+/+cChOh0hG+fyO0vOpcAFqpIIqvzAzIlVdHJtioBxvGS1hNCkv/RTH0x2CHo0JTWcYHQeuW3XzrpaTI+LaiA7tvV2hsbZ9f6Cbs2HmniWgjvB+VBAkSvMBhy1aESxJPOJLlkAbhfCMR3LW7zLSdWdS9ntJZsIyaFQ2i57Cy8F9dHA9F9zkphi5XnxQvT5S/lqzz33d+3pN47qwzmF8zjjsk1dE1ZUQfgx0QGm/J5pwhB6/H+iYHWx1haGk84/pAVRFpNG80I4ECK8dlhxu0Mpj4KHz+7IVwQv8wWfVik+lJgr4pR5krn8b+GVu+oF55NXPIWE9e/KENGlZc6H+FU+J9xKrkd41FuRTPsRb4Dle823jdjify4xYBB5tIWsw/URVAWzKixrehfCzZyW1upjzY2HHohj3huValohwrHuqMUkFd4
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(53546011)(4326008)(66556008)(86362001)(55236004)(66946007)(31696002)(6512007)(54906003)(316002)(6916009)(71200400001)(8676002)(6506007)(66446008)(66476007)(64756008)(6486002)(91956017)(76116006)(508600001)(83380400001)(38070700005)(8936002)(26005)(5660300002)(31686004)(122000001)(2906002)(186003)(36756003)(38100700002)(2616005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R0g5Z3oybnhheFZaMnExbEYxVG1jMHRUeHJhVks0YmNmeE1MdFpneDkvWUFp?=
 =?utf-8?B?T08wR1RSZ291SW52dm1uMUZiZE1HMG5rM3lncmJyaE1NUjdwWUtyV3h1OEdq?=
 =?utf-8?B?OVhqY2NhNCs4SkM4L3IyRXgrUnFqSndDelFKODZNQjF2Qk1hTmd6aldnMzZx?=
 =?utf-8?B?SGpPbk5NbjZncVIybURwVXVmUjAxeGx6RG9Nd1lKSU4vemwrTkdyd3hTaWNZ?=
 =?utf-8?B?YzJPZEk2QUY3bWdTK0xNTjI1dTNXVE96cEdQSzh1R0tJZllndTFiYU91R1Uy?=
 =?utf-8?B?WTZCcjlIQ1hScTFFK1FLc0U2UDBoUVVRdlZEbFZzcmV4RDIyWlVMT21CeWpK?=
 =?utf-8?B?NHl3MklwMXhaUC9iemhsVlpydDRmVTdsTUNXSWJQSUdRaHVpTlRWemI5VlRr?=
 =?utf-8?B?c2pMTS9Rd0ZIVVZmTGpBZS9ORlVMZ1BDU3g4YnFRQ1p0SmVqRFNHTXV2OTNz?=
 =?utf-8?B?eU1PNGxEZ2RIRWpqdDJPSk44TGpaanpNajF3cWFmWEVMVEM2NVIvN3NnWTBG?=
 =?utf-8?B?aWtUSWVnTFdoT0tYMGdxanduaVhoc1pRNGNLSy9ORTRRSVEwSFB3OEkxSUVC?=
 =?utf-8?B?N3hMVVdYY1pmZ3Y0aXJvclpudWxZbzBIRjc3b0dPNVZJa2VQd1h5UjV0OFFB?=
 =?utf-8?B?OHZMajcwMHJKS0ZqR0JCMUNZc2pOMEdER1l1djRoa3VPRUtDNTEvZ21CMlh4?=
 =?utf-8?B?aWtMemJzcDRLMy90UlRSNEtBclR5YXlrcVFRRVpMOUJvYWk5dytkT09RYkU4?=
 =?utf-8?B?RTk1VGxHbVRxNnU0OG50eEhTRzhGN3o2Ykd2cUwwWWU1STlQeUNUZDlLTWF4?=
 =?utf-8?B?MURPYjJ6anRkYWFzTE9jSVB5KzU0a1F3WTdaMVQ2WDBvSWxyMlgwS1lObVNW?=
 =?utf-8?B?U2tqZ2szY0xydnBRQ2dCdHJMWEZNRWFpV29VM0VtTWZ5VUdCL2p2YytmV2d6?=
 =?utf-8?B?TlBiMVI5M2hVeHRhMEFmemJrRWdTNnM0ajBWSE5jb1pXS1l0ejFWVDM4UjJl?=
 =?utf-8?B?U3dJMEhmT3BDSENYWWs4d2dHb0xiQjVadnVtMTJmY2RVYU9SaHZiY2djTVlq?=
 =?utf-8?B?WFJDQitNSHBhSEoyVTNkL2l2QjRBcm5XdWlqalp0b3dRZGdFSmFrdFZFV1c0?=
 =?utf-8?B?TVFGMEp4R3pXMlprbXYxZ01wZThnRE1Tc0F2SjNqbjVZbnlSU2R1Y3ZOb21l?=
 =?utf-8?B?Zno5ZVlDakFYYzMveEdtbFBpUXhwMndMMXdYOXVzcUFHQVNyOFhVcXlWQzBC?=
 =?utf-8?B?Nks1TU9CUXhLSlVoMzNpVjU3azhGUlE5TlcxVUswMG9nUnJGUjE5b0N1UkdK?=
 =?utf-8?B?c3FXZW1YZE0xbzVnTzg4aFZ5LzdQcTVUVGZDQTJXQzlWSG5zakdsdVpBTHlu?=
 =?utf-8?B?cVpvakN1Q1JjaHpTOEQxWVcwKzRVU2llbUx5NDJaVG1lQ2hyaVQ4WFZ2R2dP?=
 =?utf-8?B?T05nTzVwZ1JBS1hDWTRxcVdWbU5aZG9nY1d1OTZuQVNsT00rWjhMR0U0QmNW?=
 =?utf-8?B?YXlBOXowWDRkOGVyYzhuaDdva2xObW5XOTJYc1EzcUUxZEdJZkZDVDJtbjFD?=
 =?utf-8?B?NU5FTDhXUUFyaUdnWDFtTk1MbGROcnV6TTJQNWJIL1VPSXVscXdxWXVyQXJx?=
 =?utf-8?B?cTNqV3RJWktzeG1US1Vkby8yaFpiM2c4YTJjN3FnbWtxcWNzMDlIVjNwMnVU?=
 =?utf-8?B?bEFGTkdQczRaQnZqY3JWOWF1elFCV2xDemRKUjFvVjY4RE51SjNwdmp6SVpt?=
 =?utf-8?B?cTlZb3NPcklNMVU2WDB2Wjd0MmptWmNPdHVSa0lzdS8xc0VNWkVsZ2xKL3Jy?=
 =?utf-8?B?MWtYcWp5QXYyRWlNbnhnVFpFdEJWNXNXTVhaYWQrb1N4TEZRUTFKSzllQU5s?=
 =?utf-8?B?QjkvMndiM0pKVEJaYjF3Nm9weFVyQ1c0eXRXNHdlc1NMODZWUDE5OWFndm5M?=
 =?utf-8?B?cW14cnZOeTNvTDBOMGhqeHJKTmN5ajNPSEhDaU1Lc0Vpczd1VFQxOGppay84?=
 =?utf-8?B?MllmakM4TTkyUWdZTzdFeDNsMnIzSWh3Q2RuQ1hnT1ZMMkpCQ2hvTUlNWlUx?=
 =?utf-8?B?a0pQekwvSnhWbllHVXpUTll2TGJSY2x0aFJaNEZ5M3FQcStVNG1ORTFjK1Zk?=
 =?utf-8?B?ZTNxeXFkd0NJRFNHZE1ZMGRETEhxQjMwMTBBUzlEcnFUT2hQZ0VuTC8wV0VG?=
 =?utf-8?B?OHpldGxXS3hHS2YzNEhwc3dYR3ZhUnU3S0UvR0VjdGM5VTNxZDM1N3FEaklv?=
 =?utf-8?B?Wkdqd3Jyb2xsRFRvRkJWcFprOHo3V2w0YUY2UXlnV0lKMWpQUHo1cENDeFhC?=
 =?utf-8?B?a0F5NGx3aHhsWmFxZGJxTlRZUmQ2VTlCMUZOMGoyYWU5VkRGbjBCTllOYmtZ?=
 =?utf-8?Q?j2fPAPWGvEugwa+4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4A9536609D2A014CB07ABBE492005FB4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e19a421-969f-4ba5-96cc-08d9f0789f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 11:45:11.2167
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4pBYawPKTNfaqQxXY5wWvFC0GYTlTqutVK05sb6BSAvHvfA4xY5sq1YooRkwBYLAvNQie8AIOq5KznlZ2e6qKc/LYROwIRYZH5nftq87tiPrRNkCdcdZUE6ljklGU35L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4301
X-Proofpoint-ORIG-GUID: ojx-S932iXt1o_4R68xkClRPvOL-kcz9
X-Proofpoint-GUID: ojx-S932iXt1o_4R68xkClRPvOL-kcz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150066

DQoNCk9uIDE1LjAyLjIyIDEzOjM5LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAxNSwgMjAyMiBhdCAxMToxMjoyM0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+DQo+PiBPbiAxNS4wMi4yMiAxMjo0OCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+PiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAxMDoxMTozNUFNICswMjAwLCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pg0KPj4+PiBJbnRyb2R1
Y2UgYSBwZXItZG9tYWluIHJlYWQvd3JpdGUgbG9jayB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMg
cHJlc2VudCwNCj4+Pj4gc28gd2UgYXJlIHN1cmUgdGhlcmUgYXJlIG5vIGFjY2Vzc2VzIHRvIHRo
ZSBjb250ZW50cyBvZiB0aGUgdnBjaSBzdHJ1Y3QNCj4+Pj4gaWYgbm90LiBUaGlzIGxvY2sgY2Fu
IGJlIHVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3YXkpDQo+Pj4+IHNv
IHRoYXQgdnBjaSByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9j
ayBpbiB3cml0ZQ0KPj4+PiBtb2RlLiBQcmV2aW91c2x5IHN1Y2ggcmVtb3ZhbCBjb3VsZCByYWNl
IHdpdGggdnBjaV9yZWFkIGZvciBleGFtcGxlLg0KPj4+Pg0KPj4+PiAxLiBQZXItZG9tYWluJ3Mg
dnBjaV9yd2xvY2sgaXMgdXNlZCB0byBwcm90ZWN0IHBkZXYtPnZwY2kgc3RydWN0dXJlDQo+Pj4+
IGZyb20gYmVpbmcgcmVtb3ZlZC4NCj4+Pj4NCj4+Pj4gMi4gV3JpdGluZyB0aGUgY29tbWFuZCBy
ZWdpc3RlciBhbmQgUk9NIEJBUiByZWdpc3RlciBtYXkgdHJpZ2dlcg0KPj4+PiBtb2RpZnlfYmFy
cyB0byBydW4sIHdoaWNoIGluIHR1cm4gbWF5IGFjY2VzcyBtdWx0aXBsZSBwZGV2cyB3aGlsZQ0K
Pj4+PiBjaGVja2luZyBmb3IgdGhlIGV4aXN0aW5nIEJBUidzIG92ZXJsYXAuIFRoZSBvdmVybGFw
cGluZyBjaGVjaywgaWYgZG9uZQ0KPj4+PiB1bmRlciB0aGUgcmVhZCBsb2NrLCByZXF1aXJlcyB2
cGNpLT5sb2NrIHRvIGJlIGFjcXVpcmVkIG9uIGJvdGggZGV2aWNlcw0KPj4+PiBiZWluZyBjb21w
YXJlZCwgd2hpY2ggbWF5IHByb2R1Y2UgYSBkZWFkbG9jay4gSXQgaXMgbm90IHBvc3NpYmxlIHRv
DQo+Pj4+IHVwZ3JhZGUgcmVhZCBsb2NrIHRvIHdyaXRlIGxvY2sgaW4gc3VjaCBhIGNhc2UuIFNv
LCBpbiBvcmRlciB0byBwcmV2ZW50DQo+Pj4+IHRoZSBkZWFkbG9jaywgY2hlY2sgd2hpY2ggcmVn
aXN0ZXJzIGFyZSBnb2luZyB0byBiZSB3cml0dGVuIGFuZCBhY3F1aXJlDQo+Pj4+IHRoZSBsb2Nr
IGluIHRoZSBhcHByb3ByaWF0ZSBtb2RlIGZyb20gdGhlIGJlZ2lubmluZy4NCj4+Pj4NCj4+Pj4g
QWxsIG90aGVyIGNvZGUsIHdoaWNoIGRvZXNuJ3QgbGVhZCB0byBwZGV2LT52cGNpIGRlc3RydWN0
aW9uIGFuZCBkb2VzIG5vdA0KPj4+PiBhY2Nlc3MgbXVsdGlwbGUgcGRldnMgYXQgdGhlIHNhbWUg
dGltZSwgY2FuIHN0aWxsIHVzZSBhIGNvbWJpbmF0aW9uIG9mIHRoZQ0KPj4+PiByZWFkIGxvY2sg
YW5kIHBkZXYtPnZwY2ktPmxvY2suDQo+Pj4+DQo+Pj4+IDMuIE9wdGltaXplIGlmIFJPTSBCQVIg
d3JpdGUgbG9jayByZXF1aXJlZCBkZXRlY3Rpb24gYnkgY2FjaGluZyBvZmZzZXQNCj4+Pj4gb2Yg
dGhlIFJPTSBCQVIgcmVnaXN0ZXIgaW4gdnBjaS0+aGVhZGVyLT5yb21fcmVnIHdoaWNoIGRlcGVu
ZHMgb24NCj4+Pj4gaGVhZGVyJ3MgdHlwZS4NCj4+Pj4NCj4+Pj4gNC4gUmVkdWNlIGxvY2tlZCBy
ZWdpb24gaW4gdnBjaV9yZW1vdmVfZGV2aWNlIGFzIGl0IGlzIG5vdyBwb3NzaWJsZQ0KPj4+PiB0
byBzZXQgcGRldi0+dnBjaSB0byBOVUxMIGVhcmx5IHJpZ2h0IGFmdGVyIHRoZSB3cml0ZSBsb2Nr
IGlzIGFjcXVpcmVkLg0KPj4+Pg0KPj4+PiA1LiBSZWR1Y2UgbG9ja2VkIHJlZ2lvbiBpbiB2cGNp
X2FkZF9oYW5kbGVycyBhcyBpdCBpcyBwb3NzaWJsZSB0bw0KPj4+PiBpbml0aWFsaXplIG1hbnkg
bW9yZSBmaWVsZHMgb2YgdGhlIHN0cnVjdCB2cGNpIGJlZm9yZSBhc3NpZ25pbmcgaXQgdG8NCj4+
Pj4gcGRldi0+dnBjaS4NCj4+Pj4NCj4+Pj4gNi4gdnBjaV97YWRkfHJlbW92ZX1fcmVnaXN0ZXIg
YXJlIHJlcXVpcmVkIHRvIGJlIGNhbGxlZCB3aXRoIHRoZSB3cml0ZSBsb2NrDQo+Pj4+IGhlbGQs
IGJ1dCBpdCBpcyBub3QgZmVhc2libGUgdG8gYWRkIGFuIGFzc2VydCB0aGVyZSBhcyBpdCByZXF1
aXJlcw0KPj4+PiBzdHJ1Y3QgZG9tYWluIHRvIGJlIHBhc3NlZCBmb3IgdGhhdC4gU28sIGFkZCBh
IGNvbW1lbnQgYWJvdXQgdGhpcyByZXF1aXJlbWVudA0KPj4+PiB0byB0aGVzZSBhbmQgb3RoZXIg
ZnVuY3Rpb25zIHdpdGggdGhlIGVxdWl2YWxlbnQgY29uc3RyYWludHMuDQo+Pj4+DQo+Pj4+IDcu
IERyb3AgY29uc3QgcXVhbGlmaWVyIHdoZXJlIHRoZSBuZXcgcndsb2NrIGlzIHVzZWQgYW5kIHRo
aXMgaXMgYXBwcm9wcmlhdGUuDQo+Pj4+DQo+Pj4+IDguIERvIG5vdCBjYWxsIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcyB3aXRoIGFueSBsb2NrcyBoZWxkLiBGb3IgdGhhdCB1bmxvY2sNCj4+Pj4g
cHJpb3IgdGhlIGNhbGwgYW5kIHJlLWFjcXVpcmUgdGhlIGxvY2tzIGFmdGVyLiBBZnRlciByZS1h
Y3F1aXJpbmcgdGhlDQo+Pj4+IGxvY2sgdGhlcmUgaXMgbm8gbmVlZCB0byBjaGVjayBpZiBwZGV2
LT52cGNpIGV4aXN0czoNCj4+Pj4gICAgLSBpbiBhcHBseV9tYXAgYmVjYXVzZSBvZiB0aGUgY29u
dGV4dCBpdCBpcyBjYWxsZWQgKG5vIHJhY2UgY29uZGl0aW9uDQo+Pj4+ICAgICAgcG9zc2libGUp
DQo+Pj4+ICAgIC0gZm9yIE1TSS9NU0ktWCBkZWJ1ZyBjb2RlIGJlY2F1c2UgaXQgaXMgY2FsbGVk
IGF0IHRoZSBlbmQgb2YNCj4+Pj4gICAgICBwZGV2LT52cGNpIGFjY2VzcyBhbmQgbm8gZnVydGhl
ciBhY2Nlc3MgdG8gcGRldi0+dnBjaSBpcyBtYWRlDQo+Pj4+DQo+Pj4+IDkuIENoZWNrIGZvciAh
cGRldi0+dnBjaSBpbiB2cGNpX3tyZWFkfHdyaXRlfSBhZnRlciBhY3F1aXJpbmcgdGhlIGxvY2sN
Cj4+Pj4gYW5kIGlmIHNvLCBhbGxvdyByZWFkaW5nIG9yIHdyaXRpbmcgdGhlIGhhcmR3YXJlIHJl
Z2lzdGVyIGRpcmVjdGx5LiBUaGlzIGlzDQo+Pj4+IGFjY2VwdGFibGUgYXMgd2Ugb25seSBkZWFs
IHdpdGggRG9tMCBhcyBvZiBub3cuIE9uY2UgRG9tVSBzdXBwb3J0IGlzDQo+Pj4+IGFkZGVkIHRo
ZSB3cml0ZSB3aWxsIG5lZWQgdG8gYmUgaWdub3JlZCBhbmQgcmVhZCByZXR1cm4gYWxsIDAncyBm
b3IgdGhlDQo+Pj4+IGd1ZXN0cywgd2hpbGUgRG9tMCBjYW4gc3RpbGwgYWNjZXNzIHRoZSByZWdp
c3RlcnMgZGlyZWN0bHkuDQo+Pj4+DQo+Pj4+IDEwLiBJbnRyb2R1Y2UgcGNpZGV2c190cnlsb2Nr
LCBzbyB0aGVyZSBpcyBhIHBvc3NpYmlsaXR5IHRvIHRyeSBsb2NraW5nDQo+Pj4+IHRoZSBwY2lk
ZXYncyBsb2NrLg0KPj4+Pg0KPj4+PiAxMS4gVXNlIHBjaWRldidzIGxvY2sgYXJvdW5kIGZvcl9l
YWNoX3BkZXYgYW5kIHBjaV9nZXRfcGRldl9ieV9kb21haW4NCj4+Pj4gd2hpbGUgYWNjZXNzaW5n
IHBkZXZzIGluIHZwY2kgY29kZS4NCj4+PiBTbyBpZiB5b3UgdXNlIHRoZSBwY2lkZXZzX2xvY2sg
dGhlbiBpdCdzIGltcG9zc2libGUgZm9yIHRoZSBwZGV2IG9yDQo+Pj4gcGRldi0+dnBjaSB0byBi
ZSByZW1vdmVkIG9yIHJlY3JlYXRlZCwgYXMgdGhlIHBjaWRldnMgbG9jayBwcm90ZWN0cw0KPj4+
IGFueSBkZXZpY2Ugb3BlcmF0aW9ucyAoYWRkLCByZW1vdmUsIGFzc2lnbiwgZGVhc3NpZ24pLg0K
Pj4+DQo+Pj4gSXQncyBob3dldmVyIG5vdCBPSyB0byB1c2UgdGhlIHBjaWRldnMgbG9jayBpbiB2
cGNpX3tyZWFkLHdyaXRlfQ0KPj4+IGFzLWlzLCBhcyB0aGUgaW50cm9kdWNlZCBjb250ZW50aW9u
IGlzIElNTyBub3QgYWNjZXB0YWJsZS4NCj4+Pg0KPj4+IFRoZSBvbmx5IHZpYWJsZSBvcHRpb24g
SSBzZWUgaGVyZSBpcyB0bzoNCj4+Pg0KPj4+ICAgIDEuIE1ha2UgdGhlIHBjaWRldnMgbG9jayBh
IHJ3bG9jazogc3dpdGNoIGN1cnJlbnQgY2FsbGVycyB0byB0YWtlIHRoZQ0KPj4+ICAgICAgIGxv
Y2sgaW4gd3JpdGUgbW9kZSwgZGV0ZWN0IGFuZCBmaXh1cCBhbnkgaXNzdWVzIHRoYXQgY291bGQg
YXJpc2UNCj4+PiAgICAgICBmcm9tIHRoZSBsb2NrIG5vdCBiZWluZyByZWN1cnNpdmUgYW55bW9y
ZS4NCj4+PiAgICAyLiBUYWtlIHRoZSBsb2NrIGluIHJlYWQgbW9kZSBhcm91bmQgdnBjaV97cmVh
ZCx3cml0ZX0gc2VjdGlvbnMgdGhhdA0KPj4+ICAgICAgIHJlbHkgb24gcGRldiAoaW5jbHVkaW5n
IHRoZSBoYW5kbGVycykuDQo+Pj4NCj4+PiBUaGVzZSBpdGVtcyBzaG91bGQgYmUgYXQgbGVhc3Qg
dHdvIHNlcGFyYXRlIHBhdGNoZXMuIExldCdzIG5vdCBtaXggdGhlDQo+Pj4gY29udmVyc2lvbiBv
ZiBwY2lkZXZzIGxvY2tzIHdpdGggdGhlIGFkZGl0aW9uIG9mIHZQQ0kgc3VwcG9ydC4NCj4+Pg0K
Pj4+IEkgdGhpbmsgd2l0aCB0aGF0IHdlIGNvdWxkIGdldCBhd2F5IHdpdGhvdXQgcmVxdWlyaW5n
IGEgcGVyLWRvbWFpbg0KPj4+IHJ3bG9jaz8gSnVzdCBkb2luZyBsb2NrIG9yZGVyaW5nIGluIG1v
ZGlmeV9iYXJzIHJlZ2FyZGluZw0KPj4+IHRtcC0+dnBjaS0+bG9jayB2cyBwZGV2LT52cGNpLT5s
b2NrLiBOZWl0aGVyIHBkZXYgb3IgdnBjaSBjYW4gZ28gYXdheQ0KPj4+IHdoaWxlIGhvbGRpbmcg
dGhlIHBjaWRldnMgbG9jay4NCj4+Pg0KPj4+IFNvcnRpbmcgdGhlIHNpdHVhdGlvbiBpbiBtb2Rp
ZnlfYmFycyBzaG91bGQgYWxzbyBiZSBkb25lIGFzIGEgc2VwYXJhdGUNCj4+PiBwYXRjaCBvbiB0
b3Agb2YgMS4gYW5kIDIuDQo+PiBTbywgdG8gbWFrZSBpdCBjcnlzdGFsIGNsZWFyOiB3ZSBjYW4g
ZG8gd2l0aCB0aGUgbG9ja2luZyBhcyBpbiB0aGlzDQo+PiBwYXRjaCBhbmQgaW5zdGVhZCB3ZSBu
ZWVkIHRvIGNvbnZlcnQgcGNpZGV2cyBsb2NrIGludG8gcndsb2NrLg0KPj4gTWVhbmluZyB0aGF0
IEkgbmVlZCB0byBkcm9wIHRoaXMgcGF0Y2guDQo+Pg0KPj4gVGhlbiwgMyBwYXRjaGVzIHRvIGZv
bGxvdzoNCj4+IDEuIHBjaWRldnMgYXMgcndsb2NrDQo+PiAyLiB2cGNpX3tyZWFkfHdyaXRlfSBh
bmQgdGhlIHJlc3QgdXNpbmcgbmV3IHBjaWRldnMgcndsb2NrDQo+PiAzLiBsb2NrIG9yZGVyaW5n
IGluIG1vZGlmeV9iYXJzDQo+Pg0KPj4gSXMgaXQgd2hhdCB3ZSB3YW50Pw0KPiBMaWtlbHk/IFRo
ZSBjdXJyZW50IGFwcHJvYWNoIG9mIHRoZSBwZXItZG9tYWluIHJ3bG9jayBzdGlsbCBsZWF2ZXMg
dXMNCj4gd2l0aCBhIHdpbmRvdyBiZXR3ZWVuIHBjaV9nZXRfcGRldl9ieV9kb21haW4gYW5kIHRh
a2luZyBzdWNoIGxvY2sNCj4gd2hlcmUgdGhlIGRldmljZSBjb3VsZCBiZSByZW1vdmVkLg0KPg0K
PiBXZSBhbHNvIG5lZWQgYSBzYWZlIHdheSB0byB1c2UgcGNpX2dldF9wZGV2X2J5X2RvbWFpbiB3
aXRob3V0IHRoZQ0KPiBkZXZpY2VzIGJlaW5nIHJlbW92ZWQgd2hpbGUgdXNpbmcgdGhlbSwgc28g
aXQgd291bGQgc2VlbSB3ZSBuZWVkIHRoZQ0KPiBwY2lkZXZzIGxvY2sgYW55d2F5LCBpbiB3aGlj
aCBjYXNlIGl0IHNlZW1zIHBvc3NpYmxlIHRvIGF2b2lkIGhhdmluZw0KPiB0byBpbnRyb2R1Y2Ug
YSBwZXItZG9tYWluIHJ3bG9jay4NCj4NCj4gSSdtIGhhcHB5IHdpdGggYW55IGFwcHJvYWNoIHRo
YXQgc29sdmVzIHRoZSBpc3N1ZXMgd2UgaGF2ZSBhdCBoYW5kLA0KPiBidXQgdGhpcyBwcm9wb3Nh
bCBoYXMgYSBmdW5kYW1lbnRhbCBmbGF3IG9mIGxlYXZpbmcgYSB3aW5kb3cgYWZ0ZXINCj4gcGNp
X2dldF9wZGV2X2J5X2RvbWFpbiB3aGVyZSB0aGUgZGV2aWNlIGNvdWxkIGJlIHJlbW92ZWQuIEkn
bSBPSyB0bw0KPiBoYXZlIHRoaXMgZml4ZWQgaW4gYSBkaWZmZXJlbnQgd2F5IGlmIHRoZXJlJ3Mg
b25lLCBidXQgaWYgdGhlIHBjaWRldnMNCj4gbG9jayBpcyB1c2VkIGluIHZwY2lfe3JlYWQsd3Jp
dGV9IGl0IG5lZWRzIHRvIGJlIGNvbnZlcnRlZCBpbnRvIGENCj4gcndsb2NrLg0KSSdtIG9uIHlv
dXIgc2lkZSwgSSBqdXN0IHdhbnQgdG8gaGVhciB0aGF0IHdlIGFsbCBhZ3JlZSBwY2lkZXZzDQpu
ZWVkcyB0byBiZSBjb252ZXJ0ZWQgaW50byByd2xvY2sgYWNjb3JkaW5nIHdpdGggdGhlIHBsYW4g
eW91DQpzdWdnZXN0ZWQgYW5kIGF0IGxlYXN0IG5vdyBpdCBzZWVtcyB0byBiZSBhbiBhY2NlcHRh
YmxlIHNvbHV0aW9uLg0KDQpUaGlzIGlzIGdvaW5nIHRvIGJlIHRoZSAzcmQgYXR0ZW1wdCB0byBt
YWtlIHVwIHRoZSBsb2NraW5nIGFuZA0KaXQgYWxsIHRha2VzIHF1aXRlIHNvbWUgdGltZSwgdW5m
b3J0dW5hdGVseS4uLg0KPg0KPiBUaGFua3MsIFJvZ2VyLg0KPg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

