Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D6149C54E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:31:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260708.450638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdiE-0006Ql-87; Wed, 26 Jan 2022 08:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260708.450638; Wed, 26 Jan 2022 08:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdiE-0006O2-4m; Wed, 26 Jan 2022 08:31:30 +0000
Received: by outflank-mailman (input) for mailman id 260708;
 Wed, 26 Jan 2022 08:31:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9k5=SK=epam.com=prvs=3025680a51=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nCdiC-0006Nu-OK
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:31:29 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59ab5192-7e82-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:31:26 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20Q5RnBn019233;
 Wed, 26 Jan 2022 08:31:22 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dtxg50kt8-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jan 2022 08:31:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB3772.eurprd03.prod.outlook.com (2603:10a6:5:4::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15; Wed, 26 Jan 2022 08:31:18 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4930.015; Wed, 26 Jan 2022
 08:31:18 +0000
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
X-Inumbo-ID: 59ab5192-7e82-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EKjOCbtEuJW63B0UzZxOsGogDrWDGZg2Ubh0m1OXM32pRt+RN76uEd9LFxc+dRDlmYrzMdjgJx+2yy7LUczyXsrz0ccqgAGMf1YL+yoMZurORdEbf8FQJMcCec+77NmaTq4tRwx8+dVxbrc9zrsDuO71H1uyv9kPfghOJWi7v6WNmL1ldT41JsZmjjO6Lybe8pN6Izg4+xqQHtOfaFH59DEvIO03bixZRtQWz0g2J1Qqzja2FOLPD8daNXmLWL12uJyUS54nz5VHDG4RwpIPRkjLYQIU3T/W4VcaKbCoWcSX+gFQsd+6mrSeFV8J591+Mx4wKYIgSobrRhg4bMRmyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98NS8oYOIuNYFRDjEOsEEDQBEuWTmfbjlUTg5aX3GjM=;
 b=TNypWG6ZretMzf4GHLIC4Pi83++RMnIJLOmFvA6cFuqkfwSHvAfQ9W8b//Wc46RsmxKkdWca6bEbr9DwRWZdwOFoDCuI3eseAakkSgxXbdtZ2sFj+K9l7q7yYS1zkCteAXXFqugTHRuu0ilvDBfaSZP8xGM+LzkTtOdpurVrlraWZNwMY25TH46R18z6NFFF2eMzeV0y1jgT43hMLFcrV2iWCsjkNYzYkcpa7g+9IlB8WHP3yf3JY4ccMOuhiJ3SkkCFs4CCy+ntpJSDh6HLxyCfwU83WNBz9qb+1VUGjcJsI+fLJnqbkFSQXGsmg8gIqUMrH4Wmkivm+gUvBFLQRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=98NS8oYOIuNYFRDjEOsEEDQBEuWTmfbjlUTg5aX3GjM=;
 b=fD4tlk0faLRxJlgbjfXkCxIORY9GDSW9dM2b5clUncjTCxbnGwBrc8g/gPxsn0LtZVoaB4eYVOFiq51h3E8i4XE7JRVKVizHRdaK750nI7lC8eabY6lVqVriWpprQc+lz9xfYz9fJWE5ck4nWhUYE94Sm/dZLwRp0pEWxl4Oe7XQKlBydy6+/dYX89iWf2TuPRicP+EhGnE5tL3F4DceLoZYDld20Cnx/mv1VvB1q5BIYBYLxp1EzcX8FeU1c9s6Scsxy4YdNBMlnYozexiHBScN6Vzq0Fq0D0qL17JlSxUFoOPL4vsxGGyZr4eXYLfiUI7sqwAtk9uRwg0/PnOeIw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
        Rahul Singh <rahul.singh@arm.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Thread-Topic: [PATCH v5 02/14] vpci: fix function attributes for
 vpci_process_pending
Thread-Index: AQHX4ewFDAQe3UpzbkCO75DuGK42PKwsGkWAgADxxACAAApIAIBIRAOA
Date: Wed, 26 Jan 2022 08:31:18 +0000
Message-ID: <2cb7e479-8e25-9531-e01a-7415cd7a3f92@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-3-andr2000@gmail.com>
 <19c43763-966d-e336-9282-ff12b1b3b2c6@xen.org>
 <YbRfRv3x0lxZvPcw@Air-de-Roger>
 <9ecf5a52-4fa8-04c7-d0f4-8d08b07fcf90@epam.com>
In-Reply-To: <9ecf5a52-4fa8-04c7-d0f4-8d08b07fcf90@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e48991ad-5ff5-4c28-1b5d-08d9e0a6397c
x-ms-traffictypediagnostic: DB7PR03MB3772:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB3772F42B240C567AE7FC3F7CE7209@DB7PR03MB3772.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KXYzbIicq+jtPJYillm3X6CYR8PkJzq7EhND6PP7Lv5krRK5Rw+PQd8lOENPdVgm6yDkKrW42L7EvvPssss/dKgYvrpwXIsyUBp1Twzit4IsZdAcK7FULu0I8OoY0LtOcHH2S8AZTFnlySpid/ryueQ/Z3brI3JYzTdSorh1RZGty9BRwkm4aOPcREJRZ/ePAqkfDopXclJJ6KcocdMurfA0b6wFTAlPKOmjZZ4uzkMbMEyG4V5z0ueUy3MzuiuAVtO3DxX+NeOQDUHm+5CY7LN45LxWxkVV/9uieT0TADLn/U0yIn06ZT+VEbpkuGNzF0jTdc/PnvRhSiUYdec5sPROURFM/W9Gl+GRnslDiAiK3QYVSbbrq/mICohXCnLOtA4lB8lHKiM+GpPNZM0hSAigSIfioS7LAdJXPOM3U0TeY9qCHVJe7+6kE/k/DujQUWB+Fuyt+mA5pXzafLCmTKTJHJAJfgBxhnv2tbNeSQ9wn8om+JQuCFnhYynwCA+11RCDS0hePi8BcIFe0ATaM4fPEqP/YF6kT8qFHTmCU0hK/hIkGQ96nv6qsRKYUu9wg7KRhuPutFT8wk9o0zZuKlynR86kV4kZl6g/ALtD3ViwF8vy5S7bLVHBM4FLaVaq1d9pxBzMRIY7QYfhjd5OlguJDHtIChOpJyIr3Bag7LEG55yc5KpsFGZ0SsS0KXje4XcQxo61bejZZu5jSDMYwRIhnDcbj3tMOu1+zRZhvjD3Yywwl0lKI5KZ6sOZrbvO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(4744005)(38100700002)(71200400001)(38070700005)(8676002)(36756003)(5660300002)(7416002)(66946007)(66556008)(66476007)(91956017)(66446008)(316002)(64756008)(8936002)(76116006)(54906003)(31686004)(6506007)(6916009)(4326008)(53546011)(31696002)(508600001)(6512007)(6486002)(2906002)(186003)(86362001)(26005)(2616005)(45980500001)(20210929001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THRMTjZ2MmdvUTVDM241WUVpMkRpaDk1NEt2VENscVpuU2ZYbzhUY25QQW9L?=
 =?utf-8?B?USswRmxxWXFZU1hYRTdLNFFwamFhWFlsSS9mY0txZWFqU1VGNEkrZTNjaVVw?=
 =?utf-8?B?eWlORWFRMnpFemptbStMY0t3VWZHWnFURHlTYjNRTjA4UGJEeE5CVk5RSWFQ?=
 =?utf-8?B?THMwQUg5aXBQMUtrYzQwd20yY1R3eWd5WFd0M01JN0pMWkJrUEh4c0lXb2dv?=
 =?utf-8?B?Vjk3ZDYxeklzTjY2SGNkaGIzYWpwUUhjdTZoYmdjMVBPSmtCc2tTdDBiUjFo?=
 =?utf-8?B?cUVKemtrOG1qZHZzNHhybFpCVkE3YUVxOTVqbTVyY2QwbENUMWpWMmlxZFNy?=
 =?utf-8?B?c01pNWpYMHlPYUQvblUvclZPOTJqRTFKdHZSNSszQkhtS0RoSm1pc09oRUVs?=
 =?utf-8?B?b0M0dE8zSm56ODU0eWZDbmwvMWxSWEdkZUFyZWRsUkJjV3BKNkNZVVhMMFdN?=
 =?utf-8?B?Z1Nmak1YcXVlbU5lOEFuRkJVUDhab3FuNG1yMll4OXJGNE1IV0ZxYnpMUXZi?=
 =?utf-8?B?cHB6RlVKSXFJVGM0cVVnL3AzY0gvSWtLUFpqM3FtdmVRWnJvNGRZRUNGL0JW?=
 =?utf-8?B?QTZkSDhGVTBrbFhIN1F4Q29LVFhDYzdNdzRFL2srZzdTY01WeGxvUHZWejlh?=
 =?utf-8?B?VlZtdkpodzNxR0NPS2VoUFdQME9tMTI3aXppVFJxMGpKejRHN0NQR2tyNWV1?=
 =?utf-8?B?R3FUWE9TalJ1c01zbDdqaUQwWU52TUMxVjZZRVpmS0JvdXN5SHlNeGtnc3hw?=
 =?utf-8?B?QWNIUDI0cTg2VFNSMDZCamF3a3c5RnZtbzdzMXdtUC8zd0dGRXdmRnVPeW8x?=
 =?utf-8?B?ZGxPMEZabURxVm5FWWdrdGc5OTJlOHdnWjR1Q1RLRTBnQjB6aElJZmswUVl4?=
 =?utf-8?B?Y3o1bENxMFRKQ1JwaHF5Z3IzR1dMR0kwZHl0Sm83L1ZGblljcksxLy9EYzBL?=
 =?utf-8?B?VWNZci9zTDljMkgvTHBWeXl3MG1hQXhPamkxOXRURmhQQ1NXeDlQN25uYmJJ?=
 =?utf-8?B?dGhxSitsMmdOZTNMWWowdEVldzl5TnFhUk9jcjV0SjdNdllHUmNLRjZKMFBC?=
 =?utf-8?B?MWhwUzlkVkt4UWNzQnFaWFcwc1lUVUs1L0NFUmhBQmVkVXNra3loQzJvN3FZ?=
 =?utf-8?B?aTR6aFpMaGIzenF3SFM2aW4yVk9maVVMMXZMUC96aE4vWDFOV25NaHR4YWZu?=
 =?utf-8?B?WmN4R05MS2UrM042SkZya1NLQkN6RFlqRHRadnNXa1Z4NWZTbFI4YjRPOVEz?=
 =?utf-8?B?bjVXeUJvZDZpYmJWYlVzNVdsVnBBRDBSNmV1RGROUlFjcjlRTkxsVk85d1NR?=
 =?utf-8?B?NmJ1dFJwangySnB1b0I0OVhRYm5uU0w0VytyVTJhT3JTM2Y0RjI2RGt4ZHMz?=
 =?utf-8?B?MklLbGYxazAxSTE0SXljQzdod2cvUkRZMFdhSkJRRGNoV2ZqZE5hS0pjTVhS?=
 =?utf-8?B?RHJ4cER3SVY5V3V3cXZLaFNQTFZ2Kzh5TngrNkJZR2R5MDdUd3orbkpEQU90?=
 =?utf-8?B?em1KYUY4SGJhRmNuY3Y4N1pITktsNEtqb29HMk5Wem5TMHpodmlCeW5SQ0J4?=
 =?utf-8?B?dGozelpvUmlRTjRrZFBUSWFneS9XcUdwSnRBNlhSN3ptd3pNcDlraWg2aVcw?=
 =?utf-8?B?WEM3ZHB0S3hIdU5KU2lhU0c1Z0VIdzNrTTN2NnB3eEt2Z3Z0YnpjMjhHaFdw?=
 =?utf-8?B?RkJBVVJ2UXRaWjd4ZWQ4RGQxZHA0a0EzQ29sYloxUVc4N1pScGpxOXVxTHRT?=
 =?utf-8?B?SEtDenU1akRGN0IzK1NLemRBYkdkdGo3dytjQTBrUW9xd2w0UmJKbXYzVlA1?=
 =?utf-8?B?bFhQQ2YvY2tTNzhMbm0wRXFnTEk4SVpRZ2tneEdsaENXT0tQdlZPbnRYSVVN?=
 =?utf-8?B?aTg5Z0pJTmpJemRaQzA4cTJqL1ZhWXlBOVlSRFlxQUY4eFBYRVllQkpjWVA0?=
 =?utf-8?B?MjJ0REg3UVpVY1RXVVNWNG96RGx1VHRoOE1RbmJYU0I4QmkrRGkwb2tHOHNi?=
 =?utf-8?B?akx0cEd6L0g4SEJIWGNnNVZZdmY3M2ZxR0ZlZFJORWRsVUlnOE9PbjkzRGNt?=
 =?utf-8?B?VXF0SUlZWXlhSjRPY0g4bkdXVnlEd0MwRS9ZRlBwbDAvUU1WYXlzeVA1cmts?=
 =?utf-8?B?SmJCM1VINDQrYXRadDkzMW41QlFidHBITU5tVnBtRk4zb0d5Z2cvZEkvNm9X?=
 =?utf-8?B?Zld0azc0dVZtZDNwLzkwMndoaFpjWVR3Z1oxVnFPQTdWOGg0dnJFamNGdStH?=
 =?utf-8?B?YkxnOUpnZ0ZDZ3N2ME1GTEdRUzRET2JWd2ZlRGNzMWtjRElSdjlFSlQ1L0Rl?=
 =?utf-8?B?R2JNYjdzdDNNSzlzamhLNW1PZnFtcU55RTg3SUllNHkrZzRVcEQrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8430E4547B70D74EBD7BFEC29AFB1FBE@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e48991ad-5ff5-4c28-1b5d-08d9e0a6397c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2022 08:31:18.2170
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BTXMMU+fkl7Do7C1G+2CG3rRoeQhqMCWGk+CosvPC9KbZmJPRhQ8hXa+g3JbJyLaFygLJJmiUjOpFtRw+RZe6x4FLFMPFWx36ZQ4coqoSMKSiutiKy/6h4Cz3vNcr7x/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3772
X-Proofpoint-ORIG-GUID: 9g7LN9RYID9AtHOYJR2UT3EgZfU2CEY_
X-Proofpoint-GUID: 9g7LN9RYID9AtHOYJR2UT3EgZfU2CEY_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-26_02,2022-01-25_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=922 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201260048

SGksIFJvZ2VyIQ0KDQpPbiAxMS4xMi4yMSAxMDo1NywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
d3JvdGU6DQo+IEhpLCBSb2dlciENCj4NCj4gT24gMTEuMTIuMjEgMTA6MjAsIFJvZ2VyIFBhdSBN
b25uw6kgd3JvdGU6DQo+PiBPbiBGcmksIERlYyAxMCwgMjAyMSBhdCAwNTo1NTowM1BNICswMDAw
LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+Pj4gSGkgT2xla3NhbmRyLA0KPj4+DQo+Pj4gT24gMjUv
MTEvMjAyMSAxMTowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206
IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNv
bT4NCj4+Pj4NCj4+Pj4gdnBjaV9wcm9jZXNzX3BlbmRpbmcgaXMgZGVmaW5lZCB3aXRoIGRpZmZl
cmVudCBhdHRyaWJ1dGVzLCBlLmcuDQo+Pj4+IHdpdGggX19tdXN0X2NoZWNrIGlmIENPTkZJR19I
QVNfVlBDSSBlbmFibGVkIGFuZCBub3Qgb3RoZXJ3aXNlLg0KPj4+PiBGaXggdGhpcyBieSBkZWZp
bmluZyBib3RoIG9mIHRoZSBkZWZpbml0aW9ucyB3aXRoIF9fbXVzdF9jaGVjay4NCj4+Pj4NCj4+
Pj4gRml4ZXM6IDE0NTgzYTU5MDc4MyAoIjdmYmIwOTZiZjM0NSBrY29uZmlnOiBkb24ndCBzZWxl
Y3QgVlBDSSBpZiBidWlsZGluZyBhIHNoaW0tb25seSBiaW5hcnkiKQ0KPj4+Pg0KPj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRyX2FuZHJ1c2hjaGVu
a29AZXBhbS5jb20+DQo+Pj4gUmV2aWV3ZWQtYnk6IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpv
bi5jb20+DQo+PiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+Pg0KPj4gSSB0aGluayB0aGlzIGNhbiBiZSBjb21taXR0ZWQgaW5kZXBlbmRlbnRs
eSBvZiB0aGUgcmVzdCBvZiB0aGUNCj4+IHNlcmllcz8NCj4gSSB0aGluayBzbw0KQ291bGQgeW91
IHBsZWFzZSBjb21taXQgdGhpcyBvbmUsIHNvIEkgZG9uJ3QgaGF2ZSB0byBrZWVwIGl0IGluIHRo
ZSB2NiBvZiB0aGUgc2VyaWVzPw0KDQpUaGFuayB5b3UgaW4gYWR2YW5jZSwNCk9sZWtzYW5kcg0K
Pj4gVGhhbmtzLCBSb2dlci4NCj4gVGhhbmsgeW91LA0KPiBPbGVrc2FuZHINCg==

