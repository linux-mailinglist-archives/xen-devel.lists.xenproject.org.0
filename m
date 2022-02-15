Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639964B6659
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 09:42:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272843.467818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtPB-00065P-Pc; Tue, 15 Feb 2022 08:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272843.467818; Tue, 15 Feb 2022 08:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJtPB-00063S-MU; Tue, 15 Feb 2022 08:41:49 +0000
Received: by outflank-mailman (input) for mailman id 272843;
 Tue, 15 Feb 2022 08:41:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJtPA-00063M-Lj
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 08:41:48 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bb5e6b3-8e3b-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 09:41:47 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21F8Ys7j013269;
 Tue, 15 Feb 2022 08:41:37 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2104.outbound.protection.outlook.com [104.47.18.104])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e886fr74c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 08:41:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7359.eurprd03.prod.outlook.com (2603:10a6:102:108::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 08:41:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 08:41:28 +0000
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
X-Inumbo-ID: 1bb5e6b3-8e3b-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0Ce/8sX+S6isvf37kzvBq46YnK9vpM12tIUR0XNu5Es/vi/DTyqS0LaYBUgVKprKaNO1Gjv79P2xhz+jp1NEqjbI8Gv9qwrsMBn6zZQDHgO9HqyiZvIEpD1WOjUdsafObpakbw7vCOhg8X/YhrCERLW2bAbl8aNa416d/GLsDRjiESoviiPGyw3pVH2DN/RuIt8OJ78HcDqBQY8cIOC6xnUW6Rz/LYMcvpkpQWHs8TcolUTAWg//tIMowUI2z/S3VxU53lAzbWH+V04AVb7nIIG3Nzi+ikNTCly4uCDDjtPzO/beagZk3OJ5pHUIlosSAQoHNhqnq9hbPJP/GwQCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7bIRe9UwptJsB5+qL2+PuymXXE7ASuNAow3USbPVHc=;
 b=ltEoJAXlue+s9ViShoP3509CiF1fknNcNJigCAxySSmae5rxIWewxqlpQaTNSxjB1KmRDP/lSM5a6zBWE3oKdExLKKPM8WzVovQgLQcVsGreZtRZNPZGi/cVN2UrFtv/TKbZcimdejbs+elPBHo4UPkMk7GQiwdwL1HcuqoGIAH7V0aEf1ow/PMvZ24Zb+Pxf/LqJReZZ0sZYHsOTG5So1W/IziPu7o5ccrj+tRi+FTYGxyAMTzAlMCLbhZTIlnls8CA9KXC73++/WD9Tuak/1Cy7gf9yoJ8qJ8V+JqOrISPEKC9/JxM5vwcP+hSamDt1TjnOINx/th3D2f5Op7gNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7bIRe9UwptJsB5+qL2+PuymXXE7ASuNAow3USbPVHc=;
 b=linoGtcmyq/EINhhO1E3txyfbGahqhP4GF3WVqz+AuBBlnt+o/Q7ofbWFiobQwijtBG4TAOTua1G3TN8TxxJaNl+ZXB6t83zCDfzcMCZOJv6MgdfYBfa+sy3Sk9rxxAVnc6vDse6awTnNWVL1jsVDCOatmdIsHB1x/1GJvMdA8/16K9btEZtEVnmFPlw//j91WSEbZSJFHlbdayTrFwdKkY21hXVKpI4J3+EYxNM6tFDMtt1kI0+sex/PwclUd1BL5Zt8j9Qq6xINvf010MQ+JCEgnCDcfvQG6GeAYUiikkCRJhpChedGsqJzrOJhQJWDKM7lqZloPCHaKtUDwIWWg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>
CC: "jbeulich@suse.com" <jbeulich@suse.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUSxyA
Date: Tue, 15 Feb 2022 08:41:28 +0000
Message-ID: <00a41464-3652-7976-51a9-8bbcbb2ab702@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
In-Reply-To: <20220215081135.1497470-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 965dac35-a3ed-4d48-8b38-08d9f05ef558
x-ms-traffictypediagnostic: PA4PR03MB7359:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB7359F04C1241969C32A8F02AE7349@PA4PR03MB7359.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vCnoMOCJXmeTwwPwxopM3xKbtclAvVhMA5lD6DGXpBXwb/0tRGR/cxFWy5/AhRk69Tm7Bb+jCYGFy6B+fmkk890XwFuu2O8xNucRiCMne4VxhECenr+FH4pqNlOUIFE6d3+PTr/wKgsudu55ViqFkw6XsBuAE2OBWMNNKXwlgRQ9YL9yo5Q14lOs7O15oX3w2BlPqyBBWPk5Aqa0dsmeoh8EXw22zYXIuquenhqBLgEDDAfVbNRnEIaMpUnIlf2OvjlKdRXb3DDjn6d+gKyupgjEdtf2bsltBXUnFO54QrZ8vp4fqrwJPfADgcpxDckb9zgflzYr/XQiDBSwIZO+Cw8GBrOU8zclOwYlpfDYOkRfoBUvrA0YCkG2+5czt3ZzNpWiGhFT7Q9gUAf/RqApPMdC9D/mr7dgMPqJFqkaQzjpFMQO31GIpvnmG6LD/zwtz/6rJWGbG/FSgKDpemrfNYHXMBj1TdRfsdv5B7/oA351zvmqKaUxM+EzpImbFWrhi2fbkyADqdbL4YLAVLzLYOG3sPNVFn9SHTETfkfNwO/igQUf7usuuaQWe5x/Ffzpe4HneHqCSfyWu3ei1H+zWHbTGLpzfKYi2rWLaXVtrxw3QyZg24vWlDaOpi0JM8Rs3EsZbpLJfAVrWmvJ7DFDIog87Z79eTj1LaOg9je/LjftUcelrXQthEW9MlvdHQsWvBWIPdnGnCQC+q77GPP3eEMzMShBdNa2VkDV4JdT14D1YGOOo123SvVg90DZjRUb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(4326008)(83380400001)(8936002)(36756003)(31686004)(186003)(5660300002)(2616005)(26005)(76116006)(6512007)(53546011)(55236004)(6506007)(66946007)(508600001)(64756008)(8676002)(316002)(66446008)(54906003)(6916009)(66556008)(86362001)(31696002)(71200400001)(66476007)(6486002)(38070700005)(91956017)(122000001)(38100700002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dGhHaUVJYVl3bEY4dTdtZ0ZYbTN6eVZYc2F6bjlMK3ovdWNnMW03YzdqSjUy?=
 =?utf-8?B?eVRMZ01DaTlVRTM1eW84T0tMcmVqZXhwN2NwbUo1TkFxc09PNExnT3F0SUhi?=
 =?utf-8?B?Q1lNSlQ1MjhicVd4aVlIZmliVm1BdnprM285WWtWL04vZlliNkQvODlCQVBz?=
 =?utf-8?B?VEprQjFMTlhzQ0ZiNkw2cnBvTEwvREhtekpLOXNoemswQkNPVlE2bjRJT0Vy?=
 =?utf-8?B?UGpOcGI2WFRTbHF5QWplRjJmS1lIK09LZGVkNkEwQTBwMnZiUlU2SUpsZVJ1?=
 =?utf-8?B?S0UxSDh0OE1ibVlYS3o3WG15QVIxVWxXanNvZU1KTmF6cHgwWEtYMFNGdndj?=
 =?utf-8?B?QUNYaS9VbVRWL0FkdHY5UDhHMFpFTWlUTGNPZWx6dG9od2traEJPSHlQb2Q4?=
 =?utf-8?B?QXV3OTFpTXQ3NEJGQ2tqUm04K0ErTkVJM0VKaTh6M2hqbStCQVE2NnlyQ0tp?=
 =?utf-8?B?VHptREIydkNYK05kWlB0T0d1OGNTK0N5Zit6amlHREloYk5QRUdjT25iQnhh?=
 =?utf-8?B?RkJkRFJpUTdoRWlHTVcyQXlEZ2V6QTV0OUoxNy90RjRuOFBJYzlpQ0VnL3lS?=
 =?utf-8?B?dmxsZWgwdGo0NjJzc3phaWZiSlM0UDJPdmN3WlB3cytyMi9DWGV6Z0tYZWx4?=
 =?utf-8?B?eWk5bVVIZ00vQi9SUHZiUjRaRFJTY3dJM1d5VlhrVC8wNTIxZUQ4WDFsemlL?=
 =?utf-8?B?cXFLUFkxQUw1R29Fdk9UOW9sakNDV3cwTXIvV0YxNkM4UGs5bTY4UlBSZDA1?=
 =?utf-8?B?dFRSSmNzM0tRTXFQTkVwcGlPWkc2TnF4MVFQQUtjT0FreEpDU0ZEMlA4TXhh?=
 =?utf-8?B?WW1wR1JWS1RiK1d6MXVOQ3pyaU1qQVhOQ2tkNzAwcFFaanVubHRpRENQa1FY?=
 =?utf-8?B?cCtYaDdBQ0JJbHlReHBIUmpIVVlkb3pTUGdvYm9nVU5MUzZwNFd0QkZWcC93?=
 =?utf-8?B?bUtjYlhWVDJBZEl3TFZKRGtBVFd3bk1pMnVEbFd6SFVWS2hrc3VEWkJ4Zjh4?=
 =?utf-8?B?ZUVrQ2xQN1lmMjdtOVduTm8vRDRkc0JOM0JoQWpoOHE4T0xHZkJFMXBzTUR3?=
 =?utf-8?B?bzJkNS94Ykl4b0R2b200OHRjaUF1REg5VnBVdGxZN3J1MVlBVy9DNkxPRWxI?=
 =?utf-8?B?azhkM0lBMHBNTjdUTFFMZ0tCUHpJYlNldHBoQ1JjaUF5NExBK2RIVHVJdDAz?=
 =?utf-8?B?YW9tN0tVQzVNWDBUWkN6dHhnc2Nmd1ZhdUlCendBYWFkcFczeWtyNzlKMzdV?=
 =?utf-8?B?SDV2eWxXVjRoWXZGUjNrZzFTSW1sL25wbXovK2tlTXBVM2o2SmE2NmVsbVFJ?=
 =?utf-8?B?M2xGcXVmbXhSR2xCdFRqN0c1blhtQlR2dnBHYWRmMjlsQlZ2QldXcnhqampL?=
 =?utf-8?B?MDRMRHRJUzI3a1Zwd2MvRTRnNDNvd1NWYTZKUnpXRHBDL0VWbVgvOVFIUFRC?=
 =?utf-8?B?Qy9BUXg5L1R6YVRmRk5TVU5qRStETFZsUDh1OERDTE8rcHd6eEFzWDNaNGo0?=
 =?utf-8?B?bGlUVnFEWktkanZWR3IyazZTc3RYQWhzWnlKbmVIbzgyQjJMT1RXZmQzbGp5?=
 =?utf-8?B?WEFuZit0NDkyMExNVWlDRnpJbFYvcWhtREJwU2szTU1VZWtXQVE2bkxVTCtP?=
 =?utf-8?B?TlFNSnNoejZNYlI0dnY4S1ZmZ3A0WTBmZy9CeEFYcGNYQ0NNVVZJc1FpY1NT?=
 =?utf-8?B?c0hCUzl3enBRNlNuVDBZZ2pmajY0RmlSblc2QklLcDc3azZYUi9sWlBQZ1hI?=
 =?utf-8?B?dXM0ZVdYTTc4WE1FNzJnMkVXQ0JQYkFtT0xrZGcwSEJzbFFseTRMUy9sL1Vm?=
 =?utf-8?B?SUphaFBZTkRBUG9tVGlUV1docVhnRnJobGZuSWpkTkZEbTlTZzVwMHpkTndU?=
 =?utf-8?B?dElUS3JwTmQ2Njg1RG1LRng0TmdYSlNQYUw2Ym9pN1Zlbks2NUsyODV2MlRX?=
 =?utf-8?B?bU52NEx3Q1ZxczQrUUFTUVRGRW1vRUY3YWpGNUZlTjIxUGdybGlWVnhmeU1N?=
 =?utf-8?B?SDBhTDhsYjZFK2tmbWlndWg4Ym51eENxSlQwU3YzOTY4MzE2NGlnQnNFem9h?=
 =?utf-8?B?Z0ZQNmU4Tko0NzgxL3I5UTdxYjlnKy9PTTNBNnBIa3JodUdUekVCYmw0ZDRE?=
 =?utf-8?B?bGNaaVVrRVIzMStZaXczQXdOYXJJSWJhaTRENmdDeHJ1eEt3NWliYlR3bmNP?=
 =?utf-8?B?eTl5cnF4cUVvQ1RYdVhLVm5hbW5xeE1TQmJzMGFlYWZWMUszRTk4Ym5rMThW?=
 =?utf-8?B?MnpCbThvRXV6bEZ6OWgwVkNyNk96OGJQVEhZNkFLbmN4ZmdtSzAvalNrUjUv?=
 =?utf-8?B?VWhRT01RdUx5WWpzZUhZMzd6eWsyWWMyNDZieUlUYzhabXkxMXZXbWRBdlhP?=
 =?utf-8?Q?38JlM9Mea/h6MD3w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2A3FFA7F0DB0D147BBC4FB5A3EFAE9DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 965dac35-a3ed-4d48-8b38-08d9f05ef558
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 08:41:28.2198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1xZojZciX6aVL/qQlOq4ZYOcw3XMfKY6abZRqyczNcNII/U1V+lKGDDvolT1Izd00pVbPEEYD9Ewu5GKdnUg6G3nR9FzmegDLFKTfsdmOsS5b7phC6+nNXw2pdXwzbPR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7359
X-Proofpoint-ORIG-GUID: 9PAsNAC1NTUqC8GsKvNrgvVpufyyN343
X-Proofpoint-GUID: 9PAsNAC1NTUqC8GsKvNrgvVpufyyN343
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_03,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 malwarescore=0 mlxlogscore=924 impostorscore=0 mlxscore=0 adultscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150049

DQoNCk9uIDE1LjAyLjIyIDEwOjExLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4g
RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPg0KPg0KPiBAQCAtMTcxLDggKzE3MywyNCBAQCBzdGF0aWMgaW50IF9faW5pdCBhcHBs
eV9tYXAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAg
ICAgIHN0cnVjdCBtYXBfZGF0YSBkYXRhID0geyAuZCA9IGQsIC5tYXAgPSB0cnVlIH07DQo+ICAg
ICAgIGludCByYzsNCj4gICANCj4gKyAgICBBU1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZkLT52
cGNpX3J3bG9jaykpOw0KPiArDQo+ICAgICAgIHdoaWxlICggKHJjID0gcmFuZ2VzZXRfY29uc3Vt
ZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkNCj4gKyAgICB7
DQo+ICsgICAgICAgIC8qDQo+ICsgICAgICAgICAqIEZJWE1FOiBhcHBseV9tYXAgaXMgY2FsbGVk
IGZyb20gZG9tMCBzcGVjaWZpYyBpbml0IGNvZGUgd2hlbg0KPiArICAgICAgICAgKiBzeXN0ZW1f
c3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlLCBzbyB0aGVyZSBpcyBubyByYWNlIGNvbmRpdGlvbg0K
PiArICAgICAgICAgKiBwb3NzaWJsZSBiZXR3ZWVuIHRoaXMgY29kZSBhbmQgdnBjaV9wcm9jZXNz
X3BlbmRpbmcuIFNvLCBuZWl0aGVyDQo+ICsgICAgICAgICAqIHZwY2lfcHJvY2Vzc19wZW5kaW5n
IG1heSB0cnkgdG8gYWNxdWlyZSB0aGUgbG9jayBpbiByZWFkIG1vZGUgYW5kDQo+ICsgICAgICAg
ICAqIGFsc28gZGVzdHJveSBwZGV2LT52cGNpIGluIGl0cyBlcnJvciBwYXRoIG5vciBwZGV2IG1h
eSBiZSBkaXNwb3NlZA0KPiArICAgICAgICAgKiB5ZXQuIFRoaXMgbWVhbnMgdGhhdCBpdCBpcyBu
b3QgcmVxdWlyZWQgdG8gY2hlY2sgaWYgdGhlIHJlbGV2YW50DQo+ICsgICAgICAgICAqIHBkZXYt
PnZwY2kgc3RpbGwgZXhpc3RzIGFmdGVyIHJlLWFjcXVpcmluZyB0aGUgbG9jay4NCj4gKyAgICAg
ICAgICovDQoNCj4gSSdtIG5vdCBzdXJlIHdoeSB5b3UgbmVlZCB0byBtZW50aW9uIHZwY2lfcHJv
Y2Vzc19wZW5kaW5nIGhlcmU6DQo+IGFwcGx5X21hcCBhbmQgZGVmZXJfbWFwIGFyZSBtdXR1YWxs
eSBleGNsdXNpdmUsIHNvIGdpdmVuIHRoZSBjdXJyZW50DQo+IGNvZGUgaXQncyBpbXBvc3NpYmxl
IHRvIGdldCBpbiBhIHNpdHVhdGlvbiB3aGVyZSBhcHBseV9tYXAgaXMgY2FsbGVkDQo+IHdoaWxl
IHRoZXJlJ3MgcGVuZGluZyB3b3JrIG9uIHRoZSB2Q1BVIChpZTogdi0+dnBjaS5tZW0gIT0gTlVM
TCkuDQo+DQo+IEFsc28gdGhlcmUncyBubyBuZWVkIGZvciBhIEZJWE1FIHRhZzogdGhlIGN1cnJl
bnQgYXBwcm9hY2ggZG9lc24ndA0KPiByZXF1aXJlIGFueSBmaXhlcyB1bmxlc3Mgd2Ugc3RhcnQg
dXNpbmcgYXBwbHlfbWFwIGluIGEgZGlmZmVyZW50DQo+IGNvbnRleHQuDQo+DQo+IEhlbmNlIEkg
dGhpbmsgdGhlIGNvbW1lbnQgc2hvdWxkIGJlIGFsb25nIHRoZSBsaW5lcyBvZjoNCj4NCj4gLyoN
Cj4gICogSXQncyBzYWZlIHRvIGRyb3AgYW5kIHJlYWNxdWlyZSB0aGUgbG9jayBpbiB0aGlzIGNv
bnRleHQgd2l0aG91dA0KPiAgKiByaXNraW5nIHBkZXYgZGlzYXBwZWFyaW5nIGJlY2F1c2UgZGV2
aWNlcyBjYW5ub3QgYmUgcmVtb3ZlZCB1bnRpbCB0aGUNCj4gICogaW5pdGlhbCBkb21haW4gaGFz
IGJlZW4gc3RhcnRlZC4NCj4gICovDQpUaGlzIHNvdW5kcyBnb29kLCB3aWxsIHVzZSB0aGlzDQo+
IA0KPiBUaGFua3MsIFJvZ2VyLg0KDQo=

