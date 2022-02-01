Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD984A57C3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Feb 2022 08:32:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263409.456103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEndj-0008OJ-Qy; Tue, 01 Feb 2022 07:31:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263409.456103; Tue, 01 Feb 2022 07:31:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nEndj-0008LU-N5; Tue, 01 Feb 2022 07:31:47 +0000
Received: by outflank-mailman (input) for mailman id 263409;
 Tue, 01 Feb 2022 07:31:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7bwX=SQ=epam.com=prvs=4031c7af39=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nEndi-0008LO-DW
 for xen-devel@lists.xenproject.org; Tue, 01 Feb 2022 07:31:46 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 010adcd3-8331-11ec-8eb8-a37418f5ba1a;
 Tue, 01 Feb 2022 08:31:44 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VLTix4028338;
 Tue, 1 Feb 2022 07:31:40 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dxqr190mw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 07:31:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM7PR03MB6546.eurprd03.prod.outlook.com (2603:10a6:20b:1bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Tue, 1 Feb
 2022 07:31:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 07:31:32 +0000
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
X-Inumbo-ID: 010adcd3-8331-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHn0coy58Nij7DDErEwdDqKWQ5AVwdmnr3StHo+aEouv9vyWqVccSmGjd4J4cZ0108PArKsN2njscv3P/nsOI1nvbl22iUL8sZL3ct2wEgeApal+MipRR4OztID9xuminMf+Pe1YZsGI/EmZR6ZckJNarr0npx/79jqhncL9dOyTo3L0HRSTMqeKm9Vvs9FlLPrqpWx/3/9mGqUc+TGUvfkhKWmP7m8On5ZoZdcnEMRV603jGCpyxrJEDAGI64pLMxScJg4MsDzow8AYInF8g7kx7zpm9lU11FumgWgHGxKg8nuxRIOiR4XOdQG3Zt5PckqKHnvC/yv0N9f+wPiqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYXmMcxEZyscolsk1qt3re5nHyVHfn2eL1bnW92I+cA=;
 b=nqyXfcyY4gLorWH41bGRdhIBuOHGv4HOJpQc+3YTO7vjx9w0Crb4NZE+Sy2yLGpwaIPGLUIIAGKe+McsvL90kV0Y8s94mxp/Zjp/7ZXth+DzwforqpABCgOYvumAI2qHaGmEPjIxl9qSohBgwPXBotg9hp6X8hWbuCbubMLSiyzDunBUDyouzyuC06GB8yEiheVLgsCoRxogCaeETYV0xhsQfBunfrx4g/8N8uqZao+04x143Z7cupxvVeKupgg0ipeoNa22VrWivvbWHIo+ZNXTzsrmIkA6nWhkZsj/2/235//zoickSK8/mBKmV/nm+dz9YeV59gjAYvpOU+TJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYXmMcxEZyscolsk1qt3re5nHyVHfn2eL1bnW92I+cA=;
 b=U+M4bVSEr+o0aahrAyX9EP1bKwGwIlrGvgwsy5gNjF6NZtLDtflPeX3bcFnlXIDw2UxkR5tqmw4TotbNf8kRG3mq+q/Jr0BRvJEwZGxYius7LkO23d2qNYGT9nHQTFgnnCW2V4I40fsIHj9WkIj/XYB2LO4vaUlFq8l+p2fWa9l9VT0MdPDI0+eYg8fE4WIRrTFt/QDyzghOI8tqXcwZqqvKsDYWPUTgnAdVmQPFvNEgpA+3aGUCh92ITZbJS/2kotjCrbRB2f4sj3wbga6iPWBEifia0FA3fmA0DU2MpKyaS3fbdJK+UctlrrqNgnhgUtOUgZHuOqbgPf2vkJYyfg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
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
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNaxfndGAgB4GiwCAAAxbgIABBueA
Date: Tue, 1 Feb 2022 07:31:31 +0000
Message-ID: <c82f94c4-dadf-7b2d-4d30-a1de2b5f962a@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com> <Yd7K+9fvnBz+WTXA@Air-de-Roger>
 <082ca110-2ab7-60ff-e705-032d2d472547@epam.com>
 <df36767b-e04f-aa29-82af-87e8624bd29c@suse.com>
In-Reply-To: <df36767b-e04f-aa29-82af-87e8624bd29c@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1421744-5630-4268-d339-08d9e554de5e
x-ms-traffictypediagnostic: AM7PR03MB6546:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB6546984CD5809185D336FE5FE7269@AM7PR03MB6546.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 J1gA89T6wU95Ae6iMMtClOGe8C9DSIWJmZ1AnZK5JD5z4w/dLVYJuar+wAkTgc2kGLhOuuM3vACdDxoL1IWX82eGfK6XryAg/dAfBOsf3oW5y36d1OOD3VJxngxEoeT9aFv84MuzdWuXa4l5JCgCgFEnzfNnOPe1XZ2mrDUEHXcDNWUW0bhQlPXjC4sxBTdrYRQssE/mQNlHKF56aDnayEfTafim5HWDb9KCayrSpd5hdaNFYyc2vraFSrdZl1K2CmjEth0LJTXbV+Hv0qhntveRbptYrmarhJNehyRNa2PsxGk/e7iapUp3SulqrPXt8aHp0OrdkQSgkfuJ34bx1KWjk2AyQ+4Y2s5wvaE7una/zFHWltTKwwfpayOw/wmbdbpKDMIdy3/oGTQCBxXnYH8TIYIwaLHJvUx2VjzTQI/k7hZug5EwgQ/X9XLa5iYmQtZzMiAwVFH2g+RpTQmHjMNhA0sl7TaY8mI/HONm5qTHyU9gZWMFsNQWC4CqnOnUlxJfqdoQBAQrdq1dVtUqeu/JeBrEMIKD1VFvRk3RzRQh5xeCfVZJwDnt5Ib1K/jSM2NPCM5RPoeaebj8Mdpcri7JoiwSP7TImsPHvZk9T8Y6fdOkMPTw6xkH1ttxEvJ7iAjtnFils5pyPRarRJn8IS6TrFP3qXDwbwFrDO3pnzbh83YGwIgFlMBs9QUi4X+nST3HtuzenhviJ/Nf1SCSZqIeNk15TXGiIM/fpprmyUEIVRokvPNxf8fEHhPFR1zH
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(122000001)(31696002)(6486002)(26005)(186003)(2616005)(6506007)(6512007)(2906002)(38070700005)(38100700002)(53546011)(31686004)(4326008)(91956017)(316002)(66946007)(66556008)(76116006)(66446008)(66476007)(64756008)(110136005)(54906003)(8936002)(107886003)(86362001)(8676002)(36756003)(5660300002)(7416002)(83380400001)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZFdYdUhmeGRtOGNQVkxFYTBOb0l5QkkrcWE4c3NyS1lkNWxveHJnOTJsMjB0?=
 =?utf-8?B?WDlYNzJLWlk2LzV4Ukl0dFkzSDdnU01CYS9LbGZjL0RKandCNVYrRVdoNE96?=
 =?utf-8?B?bHBXRjJaWW9zWWJScFZvUG1yTnAxUGNZOGZjTVpqZUd3NHFZeVA0K2VOY0Nj?=
 =?utf-8?B?K1IvNHpNajVDMFhNVUZQV1FoaXF0a3FVVDVmTWZrL0ErZ2NqSG10cy9FOWlU?=
 =?utf-8?B?ZUV4cDFZMTNia3JIbUJONmRuRmVUZUtPWlZBMjFIbnJNeHRnWEZtQ1JGa2pL?=
 =?utf-8?B?ZUplanJyaS9Dd2JHZXJzZTU4UVJ5TC9ZU1VmTUkzZ2RuZGQwWEEwOE5Db1JK?=
 =?utf-8?B?WlVlOHNzdDBOT1h5TmFIOEtHSzhOT08rY0ZMM0RJVnF4RFozWlpWWkhGWkIx?=
 =?utf-8?B?N3k5RFlmcnRaMlhPNUdqeW1obmYzMTBpWWVjWjBhSDYrNzk1U3A5Z1dPYWZI?=
 =?utf-8?B?ZzJJZUxZL0dxWjR5T3RPcktmZWtNVlF2SUpHWk1zVzFicEJuNEFNQkl2YkVy?=
 =?utf-8?B?VS9tVVltMDdTSzZNeVVjcFBsd0YvMEEwY09HR3l5bVdUenFoS0IwaE15eXpB?=
 =?utf-8?B?Umh4TTNBYmV1SnZHd0lvL3ZsUnVWemxiRzBnb3kyVFlEWk9iTlNKMG5tZlZw?=
 =?utf-8?B?T21PaFVxMWJWZzFQNjdSb3VNZ3JKcmVYRHVKaVFJR041TmUrL00yaUdrQXM4?=
 =?utf-8?B?K0xFZmNOcDVBNDhsVllZbFdnZ0wvTTVjNnd5YVVsMHZXSnBXTUtQanlTTXBq?=
 =?utf-8?B?bHBUYkpYcUtFai9PUVVIRXlGN01yK05iaW45MDNFc0VGQUk4Mm5WbGlld1Nu?=
 =?utf-8?B?U0tsUVFpMlF2T3M2VlE1c2F6T3R5QXJWMmJ4Vm11eUpSM0hZS3g5dFlJUlBJ?=
 =?utf-8?B?QlJJRGVLUDFqOERlT3cwY2NkMHJXSVJrcUZaOHBoaGpsbmRuNm1FQWhsdVJx?=
 =?utf-8?B?SFZVZWlhRHdzKytsT2wyb3p4QTY3L210a1BaaGhIOGYxZVk2c3A0cS9yRGEy?=
 =?utf-8?B?RTFxSkQxU1RlSVVTU0xwTUpsVVBubTJlbC9CMWtuUTlVUlQ4RXY5VUsvQlpD?=
 =?utf-8?B?ekNIdERCd3Q0Y3dnSnFrdm9CbW1ZNmdmcUN6NmFMeVJLaDhuUUIyWE9BVXha?=
 =?utf-8?B?UmJjMnJMelRkeVRGY2k4MGx3Z28yOGlib2NLUXhocHRid1h6SldFNS9yRHBT?=
 =?utf-8?B?eldWMTNDZ3YrTkVZU0IxS1U2OWl0ck85S2JDZXFDbGk4M2NHd2ZLZkJiWUQ5?=
 =?utf-8?B?ekZYbjhlbk4wb0wvTUxpY1dIcjBIQldJYjg0ZnozQ1htMXJGWUsrejZxOGNs?=
 =?utf-8?B?allMdW5QVm4yZjY0bjAyQzZFSDM1bzAvaDZsc1ZZNWthZkVSTllTVGVTa0pC?=
 =?utf-8?B?SXJtTjI5Ym12cENibWttdUxHUzF1KzhFcHBiNmVEZjFLNzhIUmlXTW5VczQ0?=
 =?utf-8?B?WHAwcU5GSWpFcW9TYXI1MDdkNU1NQXJ4WEROZlRHK3NPS1JCTW10SnVYb3RC?=
 =?utf-8?B?V3lteGFZdnByVUw0KzZ5OHVZeEdPbFRGbXl1cnR6SXdKdHZPSVdpTmg5Mkdn?=
 =?utf-8?B?NjVub3JGR3hLME5ZT0dBRmNudnk1VnpmQkRBQU8yNTg1TWNrSzB1eVBaa0FY?=
 =?utf-8?B?Z2l0czQ4aWRCWTJqOWI5RkxzbThGaVRDdU5XTS82Skw2MWxPeTZTQTRUNlI3?=
 =?utf-8?B?a2JmdXBuK2xreVVjcmtRQllMeHZHOFNBR1UyWWQyZ0QrajlZdHhlRnVnT2pC?=
 =?utf-8?B?WFNUVU5ETHNqV1pjUEhaOFhuT09tK1I2QTI0dmN4ZkRMM0ttMVVnV1Yzc3hU?=
 =?utf-8?B?c01sNW9aQWhjY2d3WXF2alpQN3R1UlRuYVlmZGJNeFE1akZOWWEzTWdQVlhZ?=
 =?utf-8?B?eHhDM0tNajJGRDhoSlBZUjRwYk5uTG5PMnFwNkllRzFvLzEvWXB4TU8vV2FG?=
 =?utf-8?B?N1ZHZ3loSHZJSmpWMmpyRWFQdDJMTFFMQmdva0NLSWJVZmloYXhxZ0pjaTdo?=
 =?utf-8?B?RGpCNUF0cUp5MzU4Q1R4aEZDRjFLeUhNWDVaRXJNMmVjVXgzTllqUGZMR2xh?=
 =?utf-8?B?UWRhSW1rOUtTSjQrUUFWMDBDdWpLWnFZNWFoR0VVejZQVXNXaFBJWjV6OGpL?=
 =?utf-8?B?d0JBdGlRczJHV2FHckRBYjVBd21YZ0E2V1RGaU5xUjYxdDJJc0N5NW5GaGUz?=
 =?utf-8?B?akNnbjJ5S1VSM3F0MEphMWJEVmJleE5mQm0rdmIxcFhkQzAwMUZ4S2gyWlNj?=
 =?utf-8?B?bDhsdm9BWUVPTFh0ZGp1NjUzZ0Nja0lOQWJKY3pvS1R5UzBIZHVoSFkwNkEz?=
 =?utf-8?B?REd4czhmVDNjNTlqS1dXTERsZlR4K1M3MGxsNGFtK3VDWGFMeUM2dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83F5242002E404448D3F6F13B7167D72@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1421744-5630-4268-d339-08d9e554de5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2022 07:31:31.9156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YpnsSWhSeWOkunXDRVGR+T384ROYcWYwMbfserFb5dQZ4Al4XZnEBbVS68TF979RCw+Xj6iLqy1ILMPJyfzn9/Nxn+OjnDaK9PFYTczSR5RWsjYyvxx2oPvHi7HIDWbz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6546
X-Proofpoint-GUID: --UVtJTU9hyr4V-2DXWUutoN3BCYNVC1
X-Proofpoint-ORIG-GUID: --UVtJTU9hyr4V-2DXWUutoN3BCYNVC1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_02,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 malwarescore=0 mlxlogscore=999 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010038

DQoNCk9uIDMxLjAxLjIyIDE3OjUwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMzEuMDEuMjAy
MiAxNjowNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgUm9nZXIhDQo+
Pj4+ICAgICAgICAgICAgICAgIHJvbS0+dHlwZSA9IFZQQ0lfQkFSX0VNUFRZOw0KPj4+PiAgICAg
ICAgfQ0KPj4+PiBkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3ZwY2kuaCBiL3hlbi9pbmNs
dWRlL3hlbi92cGNpLmgNCj4+Pj4gaW5kZXggZWQxMjdhMDhhOTUzLi4wYTczYjE0YTkyZGMgMTAw
NjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi92cGNpLmgNCj4+Pj4gKysrIGIveGVuL2lu
Y2x1ZGUveGVuL3ZwY2kuaA0KPj4+PiBAQCAtNjgsNyArNjgsMTAgQEAgc3RydWN0IHZwY2kgew0K
Pj4+PiAgICAgICAgc3RydWN0IHZwY2lfaGVhZGVyIHsNCj4+Pj4gICAgICAgICAgICAvKiBJbmZv
cm1hdGlvbiBhYm91dCB0aGUgUENJIEJBUnMgb2YgdGhpcyBkZXZpY2UuICovDQo+Pj4+ICAgICAg
ICAgICAgc3RydWN0IHZwY2lfYmFyIHsNCj4+Pj4gKyAgICAgICAgICAgIC8qIFBoeXNpY2FsIHZp
ZXcgb2YgdGhlIEJBUi4gKi8NCj4+PiBObywgdGhhdCdzIG5vdCB0aGUgcGh5c2ljYWwgdmlldywg
aXQncyB0aGUgcGh5c2ljYWwgKGhvc3QpIGFkZHJlc3MuDQo+Pj4NCj4+Pj4gICAgICAgICAgICAg
ICAgdWludDY0X3QgYWRkcjsNCj4+Pj4gKyAgICAgICAgICAgIC8qIEd1ZXN0IHZpZXcgb2YgdGhl
IEJBUjogYWRkcmVzcyBhbmQgbG93ZXIgYml0cy4gKi8NCj4+Pj4gKyAgICAgICAgICAgIHVpbnQ2
NF90IGd1ZXN0X3JlZzsNCj4+PiBJIGNvbnRpbnVlIHRvIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFy
ZXIgaWYgeW91IHN0b3JlIHRoZSBndWVzdCBhZGRyZXNzDQo+Pj4gaGVyZSAoZ2FkZHIsIHdpdGhv
dXQgdGhlIGxvdyBiaXRzKSBhbmQgYWRkIHRob3NlIGluIGd1ZXN0X2Jhcl9yZWFkDQo+Pj4gYmFz
ZWQgb24gYmFyLT57dHlwZSxwcmVmZXRjaGFibGV9LiBUaGVuIGl0IHdvdWxkIGJlIGVxdWl2YWxl
bnQgdG8gdGhlDQo+Pj4gZXhpc3RpbmcgJ2FkZHInIGZpZWxkLg0KPj4+DQo+PiBJIGFncmVlZCBm
aXJzdCB0byBkbyBzdWNoIGEgY2hhbmdlLCBidXQgdGhlbiByZWNhbGxlZCBvdXIgZGlzY3Vzc2lv
biB3aXRoIEphbiBbMV0uDQo+PiBBbmQgdGhlbiB3ZSBkZWNpZGVkIHRoYXQgaW4gb3JkZXIgZm9y
IGl0IHRvIGJlIGVmZmljaWVudCBpdCBpcyBiZXR0ZXIgaWYgd2Ugc2V0dXAgYWxsIHRoZQ0KPj4g
dGhpbmdzIGR1cmluZyB0aGUgd3JpdGUgcGhhc2UgKHJhcmUpLCByYXRoZXIgdGhlbiBkdXJpbmcg
dGhlIHdyaXRlIHBoYXNlIChtb3JlIG9mdGVuKS4NCj4gU21hbGwgY29ycmVjdGlvbjogVGhlIDJu
ZCAid3JpdGUiIHdhcyBsaWtlbHkgbWVhbnQgdG8gYmUgInJlYWQiLg0KWWVzLCB0aGlzIGlzIGNv
cnJlY3QuDQo+ICAgQnV0DQo+IHBsZWFzZSByZWNhbGwgdGhhdCBSb2dlciBpcyB0aGUgbWFpbnRh
aW5lciBvZiB0aGUgY29kZSwgc28gaGUgZ2V0cw0KPiB0aGUgZmluYWwgc2F5Lg0KQWdyZWUsIGJ1
dCB3b3VsZCB2b3RlIGZvciB0aGUgY3VycmVudCBhcHByb2FjaCBhcyBpdCBzdGlsbCBzYXZlcyBz
b21lDQpDUFUgY3ljbGVzIG1ha2luZyB0aGUgcmVhZCBvcGVyYXRpb24gcmVhbGx5IHRpbnkNCj4N
Cj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

