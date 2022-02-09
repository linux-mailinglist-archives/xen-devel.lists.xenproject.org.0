Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B146B4AEEF7
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 11:08:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268913.462827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHjtt-0008Ov-QL; Wed, 09 Feb 2022 10:08:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268913.462827; Wed, 09 Feb 2022 10:08:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHjtt-0008M3-MK; Wed, 09 Feb 2022 10:08:37 +0000
Received: by outflank-mailman (input) for mailman id 268913;
 Wed, 09 Feb 2022 10:08:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GcOB=SY=epam.com=prvs=403937fcac=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1nHjtr-0008Lv-0w
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 10:08:35 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3bcb5bb4-8990-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 11:08:32 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 219A3qql032203;
 Wed, 9 Feb 2022 10:08:28 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2057.outbound.protection.outlook.com [104.47.6.57])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e4bhbr0qm-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 10:08:27 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by DB6PR0302MB2791.eurprd03.prod.outlook.com (2603:10a6:4:ae::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Wed, 9 Feb
 2022 10:08:23 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73%5]) with mapi id 15.20.4951.019; Wed, 9 Feb 2022
 10:08:23 +0000
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
X-Inumbo-ID: 3bcb5bb4-8990-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U6FD3iUsnzlS4JlTpA+4TjXl4h2uY23PzeyAKZik1XC7J2uBckypTgH896eqYjYFZTvGzgbX10RwgkaYQF3aW0fICTV3h/vDn616r+j6lw4hjZEv44GN8N7o2a9DUbWB1C6b8BGVz0oO9AbgdvcEmTPS0CxixDeU5y/63ngozFLw3UmFOMPsH9uDHCaJShf8NOxKWOxmvcruyPgrw+wSaPAxfptmgddG9Kl9uNAUabt3hJMCQWraQFtGcFQButYEv4Tuo1O6pzZPI3/eFZ53YrLUlcBaxJd0vWJ2x7ojzANFIDix2N3mxJX1ZSE+upP3A4q0y3/ANh7dO9Upxx9cQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wqi903n2MI4PHcd4l6EI4Q7NQWvn2LnDdlKTlj8A1g=;
 b=gKvU1Zt0psL9Tt5zHYRIXKJ47QhLITMxEfJkQYHWTS7bcJGXjGfBGOkjqWtYVvR74HGM0bo8c9kZnmopIighG7SOHLlLBa/kS6TIEu3U6/nR+a6TBz+i0bfWt0XcQyWEJ2iEU6yzeyX7+9NunkrhjjpjNO6MC2Q6UBfZV1hjKNG9k/Mumm1s0k9j552ErlUaB2qtSYKr9xYzplsOBObHLDIA5CqOXGmbxXQSvR3hwHCxpS84G/UWEo6VRCTSimzAl3Cum+y+iw664M2kCM61/0p3IO909EZOs3FqX7JRrVul3iQ28EIssfNqlyMu9pKgoHxysUmzcqsenefeWoTQNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wqi903n2MI4PHcd4l6EI4Q7NQWvn2LnDdlKTlj8A1g=;
 b=VMnerk54QvQwRxcH37UoPHOcrXCVl+qA7OsgGrGBbmsfQvggBPK49h8M8OMm8nPx2HRM/yKcSIV+KIZWE+8MVLOVxz6V81fGdd7cZAgy1sj+bYnC8DRkdICncRp9zVQf443juoMkf/wKXi/d/o62tEmFKQV7i452T2TtqMniYZ6UdPPTqSP/pX5bzLarIhvDrproEiLizY8hoyata3vIx8HYBz/rwSrlF77X9m4sa5Iz0GA+DAcNcgPN+pG+Rky3nJVMgZsylP7AnLhHMf+M2gcZJanIw4zVtUMTsdtSOyhTBC8hV5KCx5lKbIxMvvmsCh1zcM5G2NdHNuvI1oPUpg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bob Eshleman
	<bobbyeshleman@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Thread-Topic: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Index: AQHYAomKM/4d8JNsdEqc8nNA4dib2KyIh6IAgAAs1wCAAQzHgIAADcoAgAFl0gA=
Date: Wed, 9 Feb 2022 10:08:22 +0000
Message-ID: <d42f0e9f-d60d-8ec4-7053-9ecd1a069925@epam.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <3629d57d-6d89-5ada-1664-cd532342fd0b@suse.com>
In-Reply-To: <3629d57d-6d89-5ada-1664-cd532342fd0b@suse.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3d772a8e-0a6d-4cf0-0eed-08d9ebb41b28
x-ms-traffictypediagnostic: DB6PR0302MB2791:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR0302MB27918D7D107B06ACB27B8450862E9@DB6PR0302MB2791.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mGDSXB6DqZSmxJDQymI/tpjHke2qvnC3zhuG8OHciOjIKOJXq7GfH0cqpd3+yYtPwXv9x7wCWPSGf7zaN9JEkASH9pZF+jhhL2Pyh3ZtAkO3Br9H+86uYD1WG4VpcwtLRgdDBm85MA21tvm8B82uLrENIaHoYNTuD8bzELaKTnbye5YgKeVgtrJH2KAirVv1hKFbvu1OBPDujYBytDpFGwJcVFDHRatxe+qE97/C40X00egwCunz+nh+cBIX3+WP/gBW25GPIs9b2b4fX/O00Sp1y6OgFjffIdoBi7u56Yd7tDuivPft707v+d4WePq/CPtJ1XGEcKGn644SMDEp5cJeM+KffhvLxzzbCWcLgH9K5IhMW9I9x4RuUOmJsF2XwYz7u9um2B2t/M8BOU86etZebrtFxWgk30jQFIiRjm/Kcl5488yCVjhVtXaEMAWOBY6aga8vGppNSMo3NCt0C9BOBfieV2P4FZuQgri6wfH22zga6M/XeHnC/WqYPNBpN4udDRaDb1aYGnRWi0The3jusEUcA4jbsn0CvdTdq3I+TH5naGRFZ62/mdwLkGgPRrt+CSRBYE2M/J1J2bij5be6siWq6oqMod8khR6ezA0xFsvud+jpVwYdGgV9Cfh2EhXWX850P4Zls1k2SKMxmCtFbPfrm5V//i1ioNkVHiyOOFo/4X3FOaji9+mijmnnp0WO2BWhdQ720lzZ6cAJO37Og2jNBwBOVwgPNtM3NvNJEWmYH7l/pjNfHugI5tgM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(76116006)(66556008)(508600001)(8936002)(86362001)(31696002)(64756008)(66946007)(4326008)(66446008)(8676002)(6486002)(110136005)(91956017)(38100700002)(6512007)(6506007)(5660300002)(7416002)(55236004)(36756003)(53546011)(186003)(2616005)(71200400001)(26005)(2906002)(66476007)(122000001)(83380400001)(316002)(54906003)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QWd1cnJmVzZZUWNEMTFReS95c0I1dEhDK2NRdFQvNFc3UGYrUUp6eXNFajRm?=
 =?utf-8?B?blI0Vmp0aVlEb1J6RWJ6VXEwNm5uaFhUT0pnTmJ3bWdpTmFLSmNaK2VUNko5?=
 =?utf-8?B?dGpaaXR1aWFxbWxGUGtoTSt1MjVyVGFmY0NXUmZubkFIRjlpNUppVzIxSkc1?=
 =?utf-8?B?MUYxUS8zTkxSUXhQMW9XUVlVaU80ZDF1UnUxYTBRZGY3OEtEQjdxYTBSelFB?=
 =?utf-8?B?R0FPajczbTFkRTQzMTB4eE5YdFJ1SG9WWnVYRXdIWjFJVFZHMC9LTks3b3JV?=
 =?utf-8?B?c3N3bWwxY3k0VC9sdHhya1pVNzRsNHZQRHd2ZDJMVnd0WTNhZUpZRE5XY0tP?=
 =?utf-8?B?ODNyODNFbm1VL3FRUHcyTFc0SUVTVlJKbTNYZG9jbmJORStuYjFMSHEyV0xm?=
 =?utf-8?B?ZmNiaTFiaTF1L2czdFJaZkpNRFhpeTN0bjZlaEtZNGszcVdLU2FFcFRZMktK?=
 =?utf-8?B?ajhFNEVaY3BqQkRPK3NHT3c2SyttWGtHMkRKSjhMSTRRakJQM1ovYklQck9y?=
 =?utf-8?B?ekxKekR6bWd3L2hENERMZTlSQXpRS2RjU1o0YmNodFk0MVc5Sjk3ekppLzVa?=
 =?utf-8?B?SlA4Vm9kL2NIZHFpUHlaUGtqbGhlcVVyb1JLb3ltbmhtVGhZWjFXZjQ3ZUpn?=
 =?utf-8?B?MWxrblhYczFWSmVGYkxUdlZBd1dTdis0bHRkUnQyRkJSanMzbG9aNFlEeDlE?=
 =?utf-8?B?T0F6UkpiTGY0SVJmZXA0NWoyWlNqRk4rN00xREtaeHZhSWJ1ZTdKUHZKblZ1?=
 =?utf-8?B?VGQxM3YrTVFMNW1GWjRSeHEzbWNNVDB1RWZOZTdQRkJ4Um1QS2s2R1JQNzJq?=
 =?utf-8?B?OFI1RGR6RTlPMWNqR3p5VjA0UVBwMlg0QXlhWllJK1hYRlF1MTJnR3hEMUc0?=
 =?utf-8?B?SE1MY1V1dGhqa2lJNDdqVjdqNnRIOUFreDZ4dGFRWG9KRlNsZ2syQ0U5N0VL?=
 =?utf-8?B?YmNHdEFQZ3loRy9SK0FPRm8wZ0lCY01oZzJITG13cFVSeTc1T0dSaWErc3Vz?=
 =?utf-8?B?VFNsYzF1bHVzWmNxYnpNdzJmd2g2N0pEYTJFUk5SYkRKa0JkNlZmSm9laEhM?=
 =?utf-8?B?dzA1UUl4bXNoT1NtZCtFMDd0a3VUVGJIUFk4K1huYVpQeVhkNXhCQ2lsNkFr?=
 =?utf-8?B?Um8yeUxaaDQzMDJzTStaREs1V2gycGRxTkpZZUEvS2RieG55cEpncnFWWmY3?=
 =?utf-8?B?S2dDbnVYQkh3NG5OcjdvVFphbG9XYlluYUlSZkM1QWl4ZWtuNUhrU2x4UXBR?=
 =?utf-8?B?TU5VTWVULys4VGhvTGZ5QnhENVRMT3pmdzdpK3gzWWxQVmhGTmdtOWEwVG5X?=
 =?utf-8?B?TzZBOEp1cUdUQ1VhK1BEZjJmdElkcCtJb1VFcDk0cGhZVEVBSXFrRE5FeUgv?=
 =?utf-8?B?Q1lja0lvZ01leUpjbUFKRFRHc280RlR2Q2xPR25mMDRxNm1xemllWUV6NFgw?=
 =?utf-8?B?YlJWdHNlY3U0eE5EZ1J5Z2VxelRMSHNFTlh5eFUyVWo1bFMwV1lvYThuZU84?=
 =?utf-8?B?SXdQMWdJK2VNMEZBRkN1SWZKQ2IvMDBIL3JzL0VkV09mc1JLa3IzclVGU0lM?=
 =?utf-8?B?UlByWVl2cWV4RkZTcGVkb2NqZkFCTVVxTWI1QmtBTC9EU3N6T3pGQVBUZXB6?=
 =?utf-8?B?U0pMUDlOdCtVQzhMQTFKeVk0V1VGTXR3Z05uY1NCYjl3Q3loVkFBOFcyMk1E?=
 =?utf-8?B?dk1SbEdPZGhlcUtlSGswdUpQZTR5alZXbjRpRXBGNmNqNTlHT0dvR3pGajFq?=
 =?utf-8?B?MGhTUlk3eG9IQURiZk0yQVkrczVHMjZObTVRb1pUSUszRjBCbW1FbS9PNnNJ?=
 =?utf-8?B?bFRFcGMyWU1tVG9pNGplTTVCaVR3RHpEWVFZQUtBTWtRb3dGT0hLaTcwOHA1?=
 =?utf-8?B?anJ6cnpXak5KWTNUcDZndFZQL1gzdmFoMGZWaFY0dHlBV0E5SEUzZVZBY1Ax?=
 =?utf-8?B?UzdJN2YwZnZaTCtZWU1maG1MTzVyYW1rb3pjUldnNWp6aitOWFk2NCt3VVZu?=
 =?utf-8?B?NG91c0lzUm84UzBHcExjL3lKNFJRRWlScm5uaENjRXhSZDZBUXVsOUE0d2dJ?=
 =?utf-8?B?UXJ0WmlETmZaUVZ5eFRkTWhpRWJkeVViWXRaZUtDRmV1dys2RU1NR1pTM1Bt?=
 =?utf-8?B?UUlHQ3owVWs3azlXdmJKbGRRR3A4T0VGbUp0YkFCWEJOUU1GNkMwSnAydUMv?=
 =?utf-8?B?VE5KMEd6TWttZEdtNkV5eDFMTjM2SVdLYlRRTUhWUzJzZXk0QlIrTzhPTTB2?=
 =?utf-8?Q?MtCwlKLML9fV84+nE44lgfR/77fFsDAAPrszSSJcCI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DFD425AA89DE3143B63D07FBFB95053A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d772a8e-0a6d-4cf0-0eed-08d9ebb41b28
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Feb 2022 10:08:23.1105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vNOBqHFXTyB8huxZGavuhFM4wArBC9T0H3p4kkWe2T0cDZnDpfxxyE2tBSHLdBBxWlACrdWQGveT/ghADBHt86o1sD4qAOOJPNxutweMNGc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0302MB2791
X-Proofpoint-ORIG-GUID: c_ulG4EJg9xRD-2SvVfGOunoJ8WuehHx
X-Proofpoint-GUID: c_ulG4EJg9xRD-2SvVfGOunoJ8WuehHx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090065

DQpPbiAwOC4wMi4yMiAxNDo0NywgSmFuIEJldWxpY2ggd3JvdGU6DQoNCg0KSGkgSnVsaWVuLCBK
YW4NCg0KDQo+IE9uIDA4LjAyLjIwMjIgMTI6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IE9u
IDA3LzAyLzIwMjIgMTk6NTYsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4+IE9uIDA3
LjAyLjIyIDE5OjE1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4+IEhpIE9sZWtzYW5kciwNCj4+
Pj4gT24gMDUvMDEvMjAyMiAyMzoxMSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pj4+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+DQo+Pj4+Pg0KPj4+Pj4gUmV3b3JrIEFybSBpbXBsZW1lbnRhdGlvbiB0byBzdG9yZSBncmFu
dCB0YWJsZSBmcmFtZSBHRk4NCj4+Pj4+IGluIHN0cnVjdCBwYWdlX2luZm8gZGlyZWN0bHkgaW5z
dGVhZCBvZiBrZWVwaW5nIGl0IGluDQo+Pj4+PiBzdGFuZGFsb25lIHN0YXR1cy9zaGFyZWQgYXJy
YXlzLiBUaGlzIHBhdGNoIGlzIGJhc2VkIG9uDQo+Pj4+PiB0aGUgYXNzdW1wdGlvbiB0aGF0IGdy
YW50IHRhYmxlIHBhZ2UgaXMgdGhlIHhlbmhlYXAgcGFnZS4NCj4+Pj4gSSB3b3VsZCB3cml0ZSAi
Z3JhbnQgdGFibGUgcGFnZXMgYXJlIHhlbmhlYXAgcGFnZXMiIG9yICJhIGdyYW50IHRhYmxlDQo+
Pj4+IHBhZ2UgaXMgYSB4ZW5oZWFwIHBhZ2UiLg0KPj4+Pg0KPj4+PiBbLi4uXQ0KPj4+Pg0KPj4+
Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQo+
Pj4+PiBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2FzbS9ncmFudF90YWJsZS5oDQo+Pj4+PiBpbmRl
eCBkMzFhNGQ2Li5kNmZkYTMxIDEwMDY0NA0KPj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL2luY2x1
ZGUvYXNtL2dyYW50X3RhYmxlLmgNCj4+Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9pbmNsdWRlL2Fz
bS9ncmFudF90YWJsZS5oDQo+Pj4+PiBAQCAtMTEsMTEgKzExLDYgQEANCj4+Pj4+ICAgwqAgI2Rl
ZmluZSBJTklUSUFMX05SX0dSQU5UX0ZSQU1FUyAxVQ0KPj4+Pj4gICDCoCAjZGVmaW5lIEdOVFRB
Ql9NQVhfVkVSU0lPTiAxDQo+Pj4+PiAgIMKgIC1zdHJ1Y3QgZ3JhbnRfdGFibGVfYXJjaCB7DQo+
Pj4+PiAtwqDCoMKgIGdmbl90ICpzaGFyZWRfZ2ZuOw0KPj4+Pj4gLcKgwqDCoCBnZm5fdCAqc3Rh
dHVzX2dmbjsNCj4+Pj4+IC19Ow0KPj4+Pj4gLQ0KPj4+Pj4gICDCoCBzdGF0aWMgaW5saW5lIHZv
aWQgZ250dGFiX2NsZWFyX2ZsYWdzKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+PiAgIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgbWFzaywgdWludDE2X3QNCj4+Pj4+ICphZGRyKQ0K
Pj4+Pj4gICDCoCB7DQo+Pj4+PiBAQCAtNDYsNDEgKzQxLDEyIEBAIGludCByZXBsYWNlX2dyYW50
X2hvc3RfbWFwcGluZyh1bnNpZ25lZCBsb25nDQo+Pj4+PiBncGFkZHIsIG1mbl90IG1mbiwNCj4+
Pj4+ICAgwqAgI2RlZmluZSBnbnR0YWJfZG9tMF9mcmFtZXMoKSBcDQo+Pj4+PiAgIMKgwqDCoMKg
wqAgbWluX3QodW5zaWduZWQgaW50LCBvcHRfbWF4X2dyYW50X2ZyYW1lcywgUEZOX0RPV04oX2V0
ZXh0IC0NCj4+Pj4+IF9zdGV4dCkpDQo+Pj4+PiAgIMKgIC0jZGVmaW5lIGdudHRhYl9pbml0X2Fy
Y2goZ3QpIFwNCj4+Pj4+IC0oeyBcDQo+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGludCBuZ2ZfID0N
Cj4+Pj4+IChndCktPm1heF9ncmFudF9mcmFtZXM7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4gLcKgwqDCoCB1bnNpZ25lZCBpbnQgbnNm
XyA9DQo+Pj4+PiBncmFudF90b19zdGF0dXNfZnJhbWVzKG5nZl8pO8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC0gXA0KPj4+Pj4gLcKgwqDCoCAoZ3QpLT5h
cmNoLnNoYXJlZF9nZm4gPSB4bWFsbG9jX2FycmF5KGdmbl90LA0KPj4+Pj4gbmdmXyk7wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+PiAtwqDCoMKgIChndCktPmFyY2gu
c3RhdHVzX2dmbiA9IHhtYWxsb2NfYXJyYXkoZ2ZuX3QsDQo+Pj4+PiBuc2ZfKTvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC3CoMKgwqAgaWYgKCAoZ3QpLT5hcmNo
LnNoYXJlZF9nZm4gJiYgKGd0KS0+YXJjaC5zdGF0dXNfZ2ZuDQo+Pj4+PiApwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC0geyBcDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
d2hpbGUgKCBuZ2ZfLS0NCj4+Pj4+ICnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKGd0KS0+YXJjaC5zaGFyZWRf
Z2ZuW25nZl9dID0NCj4+Pj4+IElOVkFMSURfR0ZOO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgd2hpbGUgKCBuc2ZfLS0NCj4+Pj4+
ICnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKGd0KS0+YXJjaC5zdGF0dXNfZ2ZuW25zZl9dID0NCj4+Pj4+IElO
VkFMSURfR0ZOO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+PiAt
IH0gXA0KPj4+Pj4gLSBlbHNlIFwNCj4+Pj4+IC0gZ250dGFiX2Rlc3Ryb3lfYXJjaChndCk7IFwN
Cj4+Pj4+IC3CoMKgwqAgKGd0KS0+YXJjaC5zaGFyZWRfZ2ZuID8gMCA6DQo+Pj4+PiAtRU5PTUVN
O8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgXA0KPj4+Pj4gLX0pDQo+Pj4+PiAtDQo+Pj4+PiAtI2RlZmluZSBnbnR0YWJfZGVz
dHJveV9hcmNoKGd0KSBcDQo+Pj4+PiAtwqDCoMKgIGRvIHsgXA0KPj4+Pj4gLSBYRlJFRSgoZ3Qp
LT5hcmNoLnNoYXJlZF9nZm4pOyBcDQo+Pj4+PiAtIFhGUkVFKChndCktPmFyY2guc3RhdHVzX2dm
bik7IFwNCj4+Pj4+IC3CoMKgwqAgfSB3aGlsZSAoIDAgKQ0KPj4+Pj4gLQ0KPj4+Pj4gICDCoCAj
ZGVmaW5lIGdudHRhYl9zZXRfZnJhbWVfZ2ZuKGd0LCBzdCwgaWR4LCBnZm4sDQo+Pj4+PiBtZm4p
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+ICh7IFwN
Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpbnQgcmNfID0NCj4+Pj4+IDA7wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4gICDCoMKgwqDCoMKgwqDC
oMKgwqAgZ2ZuX3Qgb2dmbiA9IGdudHRhYl9nZXRfZnJhbWVfZ2ZuKGd0LCBzdCwNCj4+Pj4+IGlk
eCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgaWYgKCBnZm5fZXEob2dmbiwgSU5WQUxJRF9HRk4pIHx8IGdmbl9lcShvZ2ZuLCBnZm4p
DQo+Pj4+PiB8fMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKHJjXyA9IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKGd0KS0+ZG9tYWluLCBv
Z2ZuLA0KPj4+Pj4gbWZuLMKgwqAgXA0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAwKSkgPT0gMA0KPj4+Pj4gKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFwNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgoc3QpID8NCj4+Pj4+IChndCktPmFy
Y2guc3RhdHVzX2dmbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIDogKGd0KS0+YXJjaC5zaGFyZWRfZ2ZuKVtpZHhdID0NCj4+Pj4+IChnZm4pO8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4+IC0gcmNfOyBcDQo+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgKCFnZm5fZXEob2dmbiwgSU5WQUxJRF9HRk4pICYmICFnZm5fZXEob2dmbiwN
Cj4+Pj4+IGdmbikpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqDCoCA/IGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UoKGd0KS0+ZG9tYWluLCBvZ2Zu
LCBtZm4sDQo+Pj4+PiAwKcKgwqDCoMKgwqDCoMKgwqAgXA0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqAgOg0KPj4+Pj4gMDvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+Pj4gR2l2ZW4gdGhhdCB3ZSBhcmUgaW1wbGVtZW50aW5n
IHNvbWV0aGluZyBzaW1pbGFyIHRvIGFuIE0yUCwgSSB3YXMNCj4+Pj4gZXhwZWN0aW5nIHRoZSBp
bXBsZW1lbnRhdGlvbiB0byBiZSBwcmV0dHkgbXVjaCB0aGUgc2FtZSBhcyB0aGUgeDg2DQo+Pj4+
IGhlbHBlci4NCj4+Pj4NCj4+Pj4gV291bGQgeW91IGJlIGFibGUgdG8gb3V0bGluZSB3aHkgaXQg
aXMgZGlmZmVyZW50Pw0KPj4+IEJlaW5nIGhvbmVzdCwgSSBkaWRuJ3QgdGhpbmsgYWJvdXQgaXQg
c28gZmFyLsKgIEJ1dCwgSSBhZ3JlZSB3aXRoIHRoZQ0KPj4+IHF1ZXN0aW9uLg0KPj4+DQo+Pj4g
SXQgZmVlbHMgdG8gbWUgdGhhdCBBcm0gdmFyaWFudCBjYW4gbm93IGJlaGF2ZSBhcyB4ODYgb25l
IChhcw0KPj4+IHhlbm1lbV9hZGRfdG9fcGh5c21hcF9vbmUoKSBub3cgY2hlY2tzIGZvciB0aGUg
cHJpb3IgbWFwcGluZyksIEkgbWVhbiB0bw0KPj4+IHVzZSBJTlZBTElEX0dGTiBhcyBhbiBpbmRp
Y2F0aW9uIHRvIHJlbW92ZSBhIHBhZ2UuDQo+Pj4NCj4+PiBXaGF0IGRvIHlvdSB0aGluaz8NCj4+
IEkgd2lsbCBkZWZlciB0aGF0IHRvIEphbi4NCj4+DQo+PiBKYW4sIElJUkMgeW91IHdlcmUgdGhl
IG9uZSBpbnRyb2R1Y2luZyB0aGUgY2FsbCB0bw0KPj4gZ3Vlc3RfcGh5c21hcF9yZW1vdmVfcGFn
ZSgpLiBEbyB5b3UgcmVtZW1iZXIgd2h5IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4NCj4+IHg4NiBh
bmQgQXJtIHdlcmUgbmVjZXNzYXJ5Pw0KPiBUaGUgY29kZSB3YXMgZGlmZmVyZW50IGJlZm9yZSwg
YW5kIEFybSdzIGJlaGF2aW9yIHdhcyBhbHNvIGRpZmZlcmVudC4NCj4gSGVuY2UgdGhlIHR3byBm
dW5jdGlvbnMgY291bGRuJ3QgYmUgcXVpdGUgc2ltaWxhci4gSWYgQXJtIGJlaGF2aW9yIGlzDQo+
IG5vdyBjb252ZXJnaW5nIHdpdGggeDg2J2VzLCB0aGUgZnVuY3Rpb25zIGJlY29taW5nIG1vcmUg
c2ltaWxhciBpcw0KPiBub3QgZW50aXJlbHkgdW5leHBlY3RlZC4NCg0KSWYgQXJtJ3MgZ250dGFi
X3NldF9mcmFtZV9nZm4gYXBwZWFycyB0byBiZSB0aGUgc2ltaWxhciB0byB4ODYncyBvbmUsIA0K
d2hhdCB3b3VsZCBiZSB0aGUgbmV4dCBzdGVwPw0KDQpJIHRob3VnaHQgb2YgdGhlIGZvbGxvd2lu
ZyBvcHRpb25zOg0KDQoxLiBMZWF2ZSBwZXItYXJjaCBoZWxwZXJzIGFzIHRoZXkgYXJlDQoyLiBN
b3ZlIGhlbHBlciB0byB0aGUgY29tbW9uIGdyYW50X3RhYmxlLmgNCjMuIFJlbW92ZSB0aGUgaGVs
cGVycywgY2FsbCBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKCkgZGlyZWN0bHkgZnJvbSANCnRo
ZSBjb21tb24gZ3JhbnRfdGFibGUuYw0KDQoNCj4NCj4+Pj4+IEBAIC0zNTgsNiArMzcxLDI1IEBA
IHZvaWQgY2xlYXJfYW5kX2NsZWFuX3BhZ2Uoc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSk7DQo+Pj4+
PiAgIMKgIMKgIHVuc2lnbmVkIGludCBhcmNoX2dldF9kbWFfYml0c2l6ZSh2b2lkKTsNCj4+Pj4+
ICAgwqAgK3N0YXRpYyBpbmxpbmUgZ2ZuX3QgcGFnZV9nZXRfeGVuaGVhcF9nZm4oY29uc3Qgc3Ry
dWN0IHBhZ2VfaW5mbyAqcCkNCj4+Pj4+ICt7DQo+Pj4+PiArwqDCoMKgIGdmbl90IGdmbl8gPSBf
Z2ZuKHAtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2dmbl9tYXNrKTsNCj4+Pj4+ICsNCj4+Pj4+
ICvCoMKgwqAgQVNTRVJUKGlzX3hlbl9oZWFwX3BhZ2UocCkpOw0KPj4+Pj4gKw0KPj4+Pj4gK8Kg
wqDCoCByZXR1cm4gZ2ZuX2VxKGdmbl8sIFBHVF9JTlZBTElEX1hFTkhFQVBfR0ZOKSA/IElOVkFM
SURfR0ZOIDogZ2ZuXzsNCj4+Pj4+ICt9DQo+Pj4+PiArDQo+Pj4+PiArc3RhdGljIGlubGluZSB2
b2lkIHBhZ2Vfc2V0X3hlbmhlYXBfZ2ZuKHN0cnVjdCBwYWdlX2luZm8gKnAsIGdmbl90IGdmbikN
Cj4+Pj4+ICt7DQo+Pj4+PiArwqDCoMKgIGdmbl90IGdmbl8gPSBnZm5fZXEoZ2ZuLCBJTlZBTElE
X0dGTikgPyBQR1RfSU5WQUxJRF9YRU5IRUFQX0dGTg0KPj4+Pj4gOiBnZm47DQo+Pj4+PiArDQo+
Pj4+PiArwqDCoMKgIEFTU0VSVChpc194ZW5faGVhcF9wYWdlKHApKTsNCj4+Pj4+ICsNCj4+Pj4+
ICvCoMKgwqAgcC0+dS5pbnVzZS50eXBlX2luZm8gJj0gflBHVF9nZm5fbWFzazsNCj4+Pj4+ICvC
oMKgwqAgcC0+dS5pbnVzZS50eXBlX2luZm8gfD0gZ2ZuX3goZ2ZuXyk7DQo+Pj4+PiArfQ0KPj4+
PiBUaGlzIGlzIG5vdCBnb2luZyB0byBiZSBhdG9taWMuIFNvIGNhbiB5b3Ugb3V0bGluZSB3aGlj
aCBsb2NraW5nDQo+Pj4+IG1lY2hhbmlzbSBzaG91bGQgYmUgdXNlZCB0byBwcm90ZWN0IGFjY2Vz
cyAoc2V0L2dldCkgdG8gdGhlIEdGTj8NCj4+Pg0KPj4+IEkgdGhpbmssIHRoZSBQMk0gbG9jay4N
Cj4+IE9rLiBTbywgbG9va2luZyBhdCB0aGUgY29kZSwgbW9zdCBvZiBjYWxscyB0byBwYWdlX2dl
dF94ZW5oZWFwX2dmbigpIGFyZQ0KPj4gbm90IHByb3RlY3RlZCB3aXRoIHRoZSBwMm1fbG9jaygp
Lg0KPj4NCj4+IChKYW4gcGxlYXNlIGNvbmZpcm0pIElmIEkgYW0gbm90IG1pc3Rha2VuLCBvbiB4
ODYsIGEgcmVhZCB0byB0aGUgTTJQIGlzDQo+PiBub3QgYWx3YXlzIHByb3RlY3RlZC4gQnV0IHRo
ZXkgaGF2ZSBjb2RlIHdpdGhpbiB0aGUgUDJNIGxvY2sgdG8gY2hlY2sNCj4+IGFueSBkaWZmZXJl
bmNlIChzZWUgcDJtX3JlbW92ZV9wYWdlKCkpLiBJIHRoaW5rIHdlIHdvdWxkIG5lZWQgdGhlIHNh
bWUsDQo+PiBzbyB3ZSBkb24ndCBlbmQgdXAgdG8gaW50cm9kdWNlIGEgYmVoYXZpb3Igc2ltaWxh
ciB0byB3aGF0IFhTQS0zODcgaGFzDQo+PiBmaXhlZCBvbiB4ODYuDQo+IFllcywgdGhpcyBtYXRj
aGVzIG15IHVuZGVyc3RhbmRpbmcuDQo+DQo+IEphbg0KPg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVr
c2FuZHIgVHlzaGNoZW5rbw0K

