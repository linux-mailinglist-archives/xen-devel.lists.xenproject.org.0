Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A84B519E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272165.466965 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbOi-0003en-HC; Mon, 14 Feb 2022 13:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272165.466965; Mon, 14 Feb 2022 13:28:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbOi-0003bk-Ds; Mon, 14 Feb 2022 13:28:08 +0000
Received: by outflank-mailman (input) for mailman id 272165;
 Mon, 14 Feb 2022 13:28:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YsDI=S5=epam.com=prvs=4044e07e7c=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJbOh-0003bc-9r
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:28:07 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f099c663-8d99-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:28:05 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21EDRi7X020678;
 Mon, 14 Feb 2022 13:28:01 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e7q5h0795-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 13:28:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4676.eurprd03.prod.outlook.com (2603:10a6:208:bf::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 13:27:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.018; Mon, 14 Feb 2022
 13:27:56 +0000
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
X-Inumbo-ID: f099c663-8d99-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjAtXN8Hk/DTTq09w8NoMykrOFjFMga0Z/7CqYagJ56V6oz9r3yoqXt1AuMgf+7lDlDk+5wW7XAEB/LlXTUPs2AROGuYBvhhgJjuReoggVECt1JEXDk4+FMOWuYr+cCJaiM2t6UAcxLwNWhnwZJ6PC1wXZvF0Xy0CbVWEb7l/WrZ5y/3dwXYUG68nI6+goy2E0TWCkISdAg6DOTuaKZWNkbUIinUXJEZaKLpsXVgA0HtppJXpdGOEAyfSM/Z9A4/A5EIsWTUxL+BCRA2ruvoesM78mJSfNLhGAEUpcGYAtF3btDAVfTIXxkjpPdfGtk8/3CEQ3+A+wxN5QKF8TtroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ubQF1YpH9OniJe0kqJ2IukTE0bZys3ZXuX5Sqx17TbA=;
 b=Q/THBrbvg5YEjMGUBjO8eJDBwBBmE8qVgrx2teEn/7/PP13Bjhq7CUVCdkJnPZS5tg1+8Ero3ESsgwhEMgowZhwvddQ6qbNCyRSqHbYN3loY22sW66CCj2d6gWZ6qk5ytpjny9UeXrCRiO0MkVEmaP7lBcRMItIxbV8/hddW7Yoa8q5RvogBj9UDUbocG6reBoMwYkw2VC5Zk9ptBKp1s9HNQ4CcTeqrHnrRvnha5RJoxxPafzalFX5sDSYGcjf/nPXCSenprrwyECLwLNxvhEGwQSW9gUhqbyCPCEgZ5+PPok+ekYK8vjUmZN023d5xttQ3iKt0Vpk46j7+9ww5yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubQF1YpH9OniJe0kqJ2IukTE0bZys3ZXuX5Sqx17TbA=;
 b=N/uA+LdiqAmRuMRo+vjWkyYiR6XndHs7j2JqVl2TeIhGuuaz5t6u+T7d5Myf2K0H4I7noUF+e6Xm+f6P1jiSZk/uAgiymVkjKrAE1HQ37+2VHI6fS7woHqTRDlPPO6pGH6xJT9gJd48tlMcWQDLsDjDMNEt4P1458rP6ih25RX4rTeYWa/D53xLHDG8crIeLYJqjnFeSWS/L2SCySTChCJ5P6rm7i/RBkELrYJF3qHzgFdO3+aiaLC9CNHOZm4pnqW7fixk9E7NUNzbbvJ38wpUXeRl3D6NMvmv20b5Wy/FwdMwWiTciTH4iXNBH+m+WG299Ky0NKRrIEw8Ig/S/VQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] vpci: introduce per-domain lock to protect vpci structure
Thread-Topic: [PATCH] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYHboQT3cBWYI1/EGunE7hOwop6ayM95MAgAD+qQCAAEaDAIAElIcAgAAQEwCAAAV1AIAABOQAgAABMICAAALZgIAAAzmAgAAWXYCAAARtAIAAAoIAgAABpIA=
Date: Mon, 14 Feb 2022 13:27:56 +0000
Message-ID: <ba901778-ce63-12f2-0a54-d56998090200@epam.com>
References: <20220209133627.959649-1-andr2000@gmail.com>
 <YgU6Snk8GTytJXZp@Air-de-Roger>
 <c4666570-666e-6680-5ec2-adf1da51ad06@epam.com>
 <YgZLEMW9US9QjjYG@Air-de-Roger>
 <33fb1095-64ed-29ef-ba6b-cbde21d941f8@epam.com>
 <YgowIg5MvTaf2zsR@Air-de-Roger>
 <d8389a90-00c8-b34a-8488-b0f3fc5bde1b@epam.com>
 <Ygo40L4dMPJjZKRF@Air-de-Roger>
 <746860aa-c403-1eca-0a75-587c5d10c8c2@epam.com>
 <Ygo8M3Y6BLzljn15@Air-de-Roger>
 <114b8578-ee13-b67d-e282-d060187ef509@epam.com>
 <06baf0c8-d7d2-50b8-ea8f-1d422ceac728@suse.com>
 <6ccc7add-c13e-555f-b341-ce37118746e5@epam.com>
 <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
In-Reply-To: <f0e202dd-1f6e-4aac-1381-a64a7fd12270@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e0496822-7f84-4e73-4385-08d9efbdd005
x-ms-traffictypediagnostic: AM0PR03MB4676:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4676B1F018C98DFD1B4E8634E7339@AM0PR03MB4676.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 dNDf7jnl7bVPokk6nEHj006FZkFrre1eM4QhRhrCJx07QVxYDNpX42+NVEiRubQXsimXOVLrqmNf2LzUNKPuNFURclvuj2CdtNcDGvPw3ba//LMS1fBaA397igMShLaef3ZtqDEiaY5HlGrlSicFBBeOJJ01S+cMuRawkW78M8joClElHhDSEJKX202InPXfGTkeYRvy9xVb/awlLAbu26eQ6wWSrhwyDIl7zVVNwMIiPtDKOmWs7yH91TJ+tPjzYTDZyzlDJbVoNmFDfUyjhkGv6JE0xMEPuq2ii4X6DYeRaTxiVaZWzTDG+14ojbxMp9M7RAOkOKad7SmcnukRpJucRZGJRBa1qMh2HWCgT024hu7vmbSmvOWpEA40lGNQGlUzhamRseVlQNa2x3vEge1jL9iH6AkEl1gwtg7iXJPrnqf1owjhkMgRzC1mZzUkw9Ilb+bV2FRKzah7TOG85wswuhiB6QibhlNcmJjaN+R2ll2URTL+tq0nXKTknhMZzNkiBeqF4HYWWyNyTs7IMPYSdcl2jYRacgGTJFySaXQmHhEt9T8wCkkgkF+zGyicSvuPv0yjfPe8ec7hlpcUA7ijhKEioQd1RM5XNU7VATo830Fqb47a6Q529uTHnsZ1wK4RSVDC+rqac7Gkm12gYxMfxZT+RTqKrDkcT+f5NdTKLahxEMXB2yy+8InhSdUDj+RTVGwBzBfGenPfsST5DP4ZY5EN18GR5GshebVMHDs+vN+ljlXNpZIOFGuiIIqp
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6916009)(316002)(54906003)(186003)(55236004)(6512007)(83380400001)(53546011)(6506007)(107886003)(86362001)(2616005)(31696002)(6486002)(508600001)(71200400001)(26005)(36756003)(76116006)(64756008)(31686004)(66556008)(66476007)(66446008)(66946007)(91956017)(4326008)(122000001)(2906002)(5660300002)(8936002)(38100700002)(38070700005)(8676002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d2RvQ0o5SFRseVNaakU4UEZpTDViRmkvZlVsK0wvQkJncDJKY282bjlnUXh0?=
 =?utf-8?B?YzB3S0ZaM2dIY3ZFWkNnd1hyQVR0bm1EQTErUXMwK3k0dnJQSnc4YjdtVjNP?=
 =?utf-8?B?YVpFc0JLZDFabkFnd0QrUEhRcVlLRzVYdTh4eW5IYm15UlkvMVFyaGI1T3dB?=
 =?utf-8?B?bm5ZVUpRQXVXMDdSQmwycVJyOHBEd2E1SlBzTkkyWHpmL0ZIYk9xYzUwYTNS?=
 =?utf-8?B?dmoySDgyWmNsV2lRbmZHUnBGeXMza05nVzRXNHZ6TlVzTXFVaFZUY1pYeU05?=
 =?utf-8?B?TEE3eFI4K2Y3UGhYOHlGNW1BY2ZCRWtLOEZNUWJabm5ZS3MwVVNvVTFxMkha?=
 =?utf-8?B?anVkZEQvSUlGalZOM0lLNjJOQk1odVJRaDZ1VXg4RmgweU8zTlEySDlGb1dl?=
 =?utf-8?B?UThESGEvNGxLOVJHNHNuRFFsYmhPSU8yT3RSdlNmUlEySnFsSE1OQnRZUEQv?=
 =?utf-8?B?UmZuVmxEWjU5a2hIMDBYNTl1UGJ1RHlpNGFmYTF1bUNsRGxwYnFtU2gyRGdD?=
 =?utf-8?B?SG9Rd0JLcjA3ZXVIVTRMdGZaWjZRSTlnakFIQ0l0TlRvRUZOUDdWYUgvMlBu?=
 =?utf-8?B?T2duY2NIeVJwTkRmZDN4V2FFNkg4YUxzVVErTUdlV3FvUEEyVFcwbmw1ZVFt?=
 =?utf-8?B?Rm40RWR5U2o5TGl0R0cvTnFUZ0tZMndOcHZFcXl6UHhsbkl6SjBiQ1hVV1pn?=
 =?utf-8?B?dWVBWUJ3U1BQNFdBSVphY2JlR2JwNmJESXMyaCtyeVNQMTFHSVdqeVlGUVcz?=
 =?utf-8?B?RCtCMzVsSGwzcVExdUVzWTBFcDdDMW5WZmpTODgyTGpGUEZ1dklZZEE1NFUx?=
 =?utf-8?B?WWRmb3BneHZ2V04walpQNCt0TmV2b1hUb1pCTWtPQ0NmMGRYVVV3eStOTkkw?=
 =?utf-8?B?REVucG44Q1owZlNhdWluMi9vSlVGalNCanRXNHVMMWVnSDA0a3FrRSt4VW9M?=
 =?utf-8?B?TDI5REFSTU1lLzdDS2RxNkRRdzQrOVRBVEhJc29tRTFRbldkaVhGK1NIL1ly?=
 =?utf-8?B?cStURjdiZytwVU9DWG9WTWtRc0FkUkdlTGMyT3pxZzE0MGg4OTJ5bGVQdUR4?=
 =?utf-8?B?dkNtRWw5V042Zmh3ZXhYTzRHYUdqeHRjbWYrQTBlVXMvSW5KMXNGZitsbVRh?=
 =?utf-8?B?WEk3Z2k2Q0JhZzhWb24vaEJIcVV4VzJJbDQ4WTZGQmhYc1pkQStuZ2s4SFZN?=
 =?utf-8?B?ZTRmb2ZDRjB5am13ZHExcXZWYmlVWHhXb2hiT1krUXJBYk91bmtMVUltYlJC?=
 =?utf-8?B?U1ZUMUppQWVUUldYVytrclNUaFloemY4cTZTTXd5K0dJVnl2R0YrRFNValdw?=
 =?utf-8?B?WFgwRjBZVzV2aUZiUERra2tpbk9YZDVCb1dLbEJzVXpISGF4TWhtYWNlYms3?=
 =?utf-8?B?bTlaSWQ5UmtwY282WFZEWGU5dXNNZjRTVmVTdUdQQUJaZ3F1djNHNXE4UWJs?=
 =?utf-8?B?eHBwWFZ4SVJyM3dLWEVBYzhGSVYzU2xXMlk1REFPUnZtb1NURlhWcEsyN1Rn?=
 =?utf-8?B?RzVYd1pNcUIxRHRtMlVFZVovZ1NxNGxMa1BjQ1d5RWJYbllJbjZtUFhrSFUw?=
 =?utf-8?B?WUdTM0hVYk9RMG5xejFTNFE5ZWt0Rm5jTno4T2NYdkJJVzN5MXE0SEpYQ2Qw?=
 =?utf-8?B?TkszT3lrUHlTclRFOVFMU05RcGpHYjlHSmdOZTB1blAxT3FlWVlibEgvSmRo?=
 =?utf-8?B?cFJhUzRlZEZKOHMxaks5ZjJXMlJxem82a1FYNE96Y09BaWtzNkltaGNkcnh1?=
 =?utf-8?B?bmF1bEFvNUhNT0g2SnI2Y3luc214aW1tckZpaDg0QnZWOW1IMjdpMHYyNzQ0?=
 =?utf-8?B?UzJacXVCSXhXQjlOUHRtV0tES2ppa1Vwa3BUZjBQeXJMWkF2NW9IWUZDQUFx?=
 =?utf-8?B?NVNJY3daT2JZRVlaODFLZFhkMFAxbTdsbTN1dGVRMmR3NmZVbEFDVWJ4L28r?=
 =?utf-8?B?WXZCSTM3bktmVG03U3pUc1daT0hDUm9wZEFEdFB4ZjRQL1JPdE9INmM2bWIx?=
 =?utf-8?B?NXlyVmlSUGo2bDgwQlZVaXhNOWVTQkdmU09OVnVVT1EyT3YyODRPRWhoaVJX?=
 =?utf-8?B?Vkk0aSs2dVJ3SHlVYlRYd3NiTjQxTmRuYWxjMVJ1NC9LQTNSb2hkM2QzTCtJ?=
 =?utf-8?B?eTliZ1I1WmNTdEN5VVBHVFRzVkV2TE45ZUFpaVFLcE5IRzc4b21UcHBnS3Fl?=
 =?utf-8?B?dGZKemtDYjJiS0NmTktTTTNDRUNreVprRTcyaXBCb253TktJSzdsMEVRVk1q?=
 =?utf-8?B?Nm9UbU5zaW50M1h0eDhQbWZMUC9RS01xT1JnV3p0WnZ1Mzc1RzNnNE53QXJB?=
 =?utf-8?B?a3NYQTFyUUtoWVYrb3lVNUVOazV2a1hXcEg3dHhqWGYxTUpjR0REdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B9DED8D43C3486469D90CF2B0896090C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0496822-7f84-4e73-4385-08d9efbdd005
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2022 13:27:56.6093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1GQMmUQ6DT0BhPAC17i9QXcC7Ba71KfhAJJed9h3vBwDTGAbwxXOG0Zt9IQRb0QSSjEa61R9CEF+qBH7Y6+j7HlIwqTcxfSwNBf3+Vcg4C3eKmg8To1EoDGTtgo2AQl2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4676
X-Proofpoint-GUID: oBmZmtH5vrlL8C3MuAferoqFsE9AQgcF
X-Proofpoint-ORIG-GUID: oBmZmtH5vrlL8C3MuAferoqFsE9AQgcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_06,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140082

DQoNCk9uIDE0LjAyLjIyIDE1OjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTQuMDIuMjAy
MiAxNDoxMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMTQuMDIu
MjIgMTQ6NTcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDE0LjAyLjIwMjIgMTI6MzcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAxNC4wMi4yMiAxMzoyNSwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDExOjE1
OjI3QU0gKzAwMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IE9uIDE0
LjAyLjIyIDEzOjExLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPj4+Pj4+PiBPbiBNb24sIEZl
YiAxNCwgMjAyMiBhdCAxMDo1Mzo0M0FNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+Pj4+Pj4+IE9uIDE0LjAyLjIyIDEyOjM0LCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Og0KPj4+Pj4+Pj4+IE9uIE1vbiwgRmViIDE0LCAyMDIyIGF0IDA5OjM2OjM5QU0gKzAwMDAsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+PiBPbiAxMS4wMi4yMiAxMzo0
MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+Pj4+ICsNCj4+Pj4+Pj4+Pj4+Pj4+
ICAgICAgICAgICAgIGZvciAoIGkgPSAwOyBpIDwgbXNpeC0+bWF4X2VudHJpZXM7IGkrKyApDQo+
Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICB7DQo+Pj4+Pj4+Pj4+Pj4+PiAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IHZwY2lfbXNpeF9lbnRyeSAqZW50cnkgPSAmbXNpeC0+ZW50cmllc1tp
XTsNCj4+Pj4+Pj4+Pj4+Pj4gU2luY2UgdGhpcyBmdW5jdGlvbiBpcyBub3cgY2FsbGVkIHdpdGgg
dGhlIHBlci1kb21haW4gcndsb2NrIHJlYWQNCj4+Pj4+Pj4+Pj4+Pj4gbG9ja2VkIGl0J3MgbGlr
ZWx5IG5vdCBhcHByb3ByaWF0ZSB0byBjYWxsIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0KPj4+
Pj4+Pj4+Pj4+PiB3aGlsZSBob2xkaW5nIHN1Y2ggbG9jayAoY2hlY2sgYmVsb3cpLg0KPj4+Pj4+
Pj4+Pj4+IFlvdSBhcmUgcmlnaHQsIGFzIGl0IGlzIHBvc3NpYmxlIHRoYXQ6DQo+Pj4+Pj4+Pj4+
Pj4NCj4+Pj4+Pj4+Pj4+PiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMgLT4gdnBjaV9wcm9jZXNz
X3BlbmRpbmcgLT4gcmVhZF9sb2NrDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+PiBFdmVuIG1v
cmUsIHZwY2lfcHJvY2Vzc19wZW5kaW5nIG1heSBhbHNvDQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4+PiByZWFkX3VubG9jayAtPiB2cGNpX3JlbW92ZV9kZXZpY2UgLT4gd3JpdGVfbG9jaw0KPj4+
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4gaW4gaXRzIGVycm9yIHBhdGguIFNvLCBhbnkgaW52b2Nh
dGlvbiBvZiBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMNCj4+Pj4+Pj4+Pj4+PiBtdXN0IG5vdCBo
b2xkIGQtPnZwY2lfcndsb2NrIGF0IGxlYXN0Lg0KPj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4g
QW5kIGFsc28gd2UgbmVlZCB0byBjaGVjayB0aGF0IHBkZXYtPnZwY2kgd2FzIG5vdCByZW1vdmVk
DQo+Pj4+Pj4+Pj4+Pj4gaW4gYmV0d2VlbiBvciAqcmUtY3JlYXRlZCoNCj4+Pj4+Pj4+Pj4+Pj4g
V2Ugd2lsbCBsaWtlbHkgbmVlZCB0byByZS1pdGVyYXRlIG92ZXIgdGhlIGxpc3Qgb2YgcGRldnMg
YXNzaWduZWQgdG8NCj4+Pj4+Pj4+Pj4+Pj4gdGhlIGRvbWFpbiBhbmQgYXNzZXJ0IHRoYXQgdGhl
IHBkZXYgaXMgc3RpbGwgYXNzaWduZWQgdG8gdGhlIHNhbWUNCj4+Pj4+Pj4+Pj4+Pj4gZG9tYWlu
Lg0KPj4+Pj4+Pj4+Pj4+IFNvLCBkbyB5b3UgbWVhbiBhIHBhdHRlcm4gbGlrZSB0aGUgYmVsb3cg
c2hvdWxkIGJlIHVzZWQgYXQgYWxsDQo+Pj4+Pj4+Pj4+Pj4gcGxhY2VzIHdoZXJlIHdlIG5lZWQg
dG8gY2FsbCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXM/DQo+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+
Pj4+PiByZWFkX3VubG9jaw0KPj4+Pj4+Pj4+Pj4+IHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcw0K
Pj4+Pj4+Pj4+Pj4+IHJlYWRfbG9jaw0KPj4+Pj4+Pj4+Pj4+IHBkZXYgPSBwY2lfZ2V0X3BkZXZf
YnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZmbik7DQo+Pj4+Pj4+Pj4+
Pj4gaWYgKCBwZGV2ICYmIHBkZXYtPnZwY2kgJiYgaXNfdGhlX3NhbWVfdnBjaShwZGV2LT52cGNp
KSApDQo+Pj4+Pj4+Pj4+Pj4gPGNvbnRpbnVlIHByb2Nlc3Npbmc+DQo+Pj4+Pj4+Pj4+PiBTb21l
dGhpbmcgYWxvbmcgdGhvc2UgbGluZXMuIFlvdSBsaWtlbHkgbmVlZCB0byBjb250aW51ZSBpdGVy
YXRlIHVzaW5nDQo+Pj4+Pj4+Pj4+PiBmb3JfZWFjaF9wZGV2Lg0KPj4+Pj4+Pj4+PiBIb3cgZG8g
d2UgdGVsbCBpZiBwZGV2LT52cGNpIGlzIHRoZSBzYW1lPyBKYW4gaGFzIGFscmVhZHkgYnJvdWdo
dA0KPj4+Pj4+Pj4+PiB0aGlzIHF1ZXN0aW9uIGJlZm9yZSBbMV0gYW5kIEkgd2FzIGFib3V0IHRv
IHVzZSBzb21lIElEIGZvciB0aGF0IHB1cnBvc2U6DQo+Pj4+Pj4+Pj4+IHBkZXYtPnZwY2ktPmlk
ID0gZC0+dnBjaV9pZCsrIGFuZCB0aGVuIHdlIHVzZSBwZGV2LT52cGNpLT5pZMKgIGZvciBjaGVj
a3MNCj4+Pj4+Pj4+PiBHaXZlbiB0aGlzIGlzIGEgZGVidWcgbWVzc2FnZSBJIHdvdWxkIGJlIE9L
IHdpdGgganVzdCBkb2luZyB0aGUNCj4+Pj4+Pj4+PiBtaW5pbWFsIGNoZWNrcyB0byBwcmV2ZW50
IFhlbiBmcm9tIGNyYXNoaW5nIChpZTogcGRldi0+dnBjaSBleGlzdHMpDQo+Pj4+Pj4+Pj4gYW5k
IHRoYXQgdGhlIHJlc3VtZSBNU0kgZW50cnkgaXMgbm90IHBhc3QgdGhlIGN1cnJlbnQgbGltaXQu
IE90aGVyd2lzZQ0KPj4+Pj4+Pj4+IGp1c3QgcHJpbnQgYSBtZXNzYWdlIGFuZCBtb3ZlIG9uIHRv
IHRoZSBuZXh0IGRldmljZS4NCj4+Pj4+Pj4+IEFncmVlLCBJIHNlZSBubyBiaWcgaXNzdWUgKHBy
b2JhYmx5KSBpZiB3ZSBhcmUgbm90IGFibGUgdG8gcHJpbnQNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBI
b3cgYWJvdXQgdGhpcyBvbmU6DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9k
cml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQo+Pj4+Pj4+
PiBpbmRleCA4MDlhNmI0NzczZTEuLjUwMzczZjA0ZGE4MiAxMDA2NDQNCj4+Pj4+Pj4+IC0tLSBh
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCj4+Pj4+Pj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Zw
Y2kvaGVhZGVyLmMNCj4+Pj4+Pj4+IEBAIC0xNzEsMTAgKzE3MSwzMSBAQCBzdGF0aWMgaW50IF9f
aW5pdCBhcHBseV9tYXAoc3RydWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBk
ZXYsDQo+Pj4+Pj4+PiAgICAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCByYW5nZXNldCAqbWVtLCB1aW50MTZfdCBjbWQpDQo+
Pj4+Pj4+PiAgICAgIMKgew0KPj4+Pj4+Pj4gICAgICDCoMKgwqDCoCBzdHJ1Y3QgbWFwX2RhdGEg
ZGF0YSA9IHsgLmQgPSBkLCAubWFwID0gdHJ1ZSB9Ow0KPj4+Pj4+Pj4gK8KgwqDCoCBwY2lfc2Jk
Zl90IHNiZGYgPSBwZGV2LT5zYmRmOw0KPj4+Pj4+Pj4gICAgICDCoMKgwqDCoCBpbnQgcmM7DQo+
Pj4+Pj4+Pg0KPj4+Pj4+Pj4gKyBBU1NFUlQocndfaXNfd3JpdGVfbG9ja2VkKCZwZGV2LT5kb21h
aW4tPnZwY2lfcndsb2NrKSk7DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+PiAgICAgIMKgwqDCoMKgIHdo
aWxlICggKHJjID0gcmFuZ2VzZXRfY29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRh
KSkgPT0gLUVSRVNUQVJUICkNCj4+Pj4+Pj4+ICvCoMKgwqAgew0KPj4+Pj4+Pj4gKw0KPj4+Pj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIC8qDQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcyBtYXkgdHJpZ2dlciB2cGNpX3Byb2Nlc3NfcGVuZGluZyB3aGlj
aA0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBtYXkgbmVlZCB0byBhY3F1aXJlIHBkZXYt
PmRvbWFpbi0+dnBjaV9yd2xvY2sgaW4gcmVhZCBtb2RlLg0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqAgKi8NCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCB3cml0ZV91bmxvY2soJnBkZXYtPmRv
bWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+Pj4+Pj4gICAgICDCoMKgwqDCoMKgwqDCoMKgIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcygpOw0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHdyaXRlX2xv
Y2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIENoZWNrIGlmIHBkZXYgc3RpbGwgZXhpc3RzIGFuZCB2UENJIHdhcyBu
b3QgcmVtb3ZlZCBvciByZS1jcmVhdGVkLiAqLw0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChwY2lfZ2V0X3BkZXZfYnlfZG9tYWluKGQsIHNiZGYuc2VnLCBzYmRmLmJ1cywgc2JkZi5kZXZm
bikgIT0gcGRldikNCj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICggdnBjaSBp
cyBOT1QgdGhlIHNhbWUgKQ0KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgew0KPj4+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYyA9IDA7DQo+Pj4+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOw0KPj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQ0KPj4+Pj4+Pj4gK8KgwqDCoCB9DQo+Pj4+Pj4+PiArDQo+Pj4+Pj4+
PiAgICAgIMKgwqDCoMKgIHJhbmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+Pj4+Pj4+ICAgICAgwqDC
oMKgwqAgaWYgKCAhcmMgKQ0KPj4+Pj4+Pj4gICAgICDCoMKgwqDCoMKgwqDCoMKgIG1vZGlmeV9k
ZWNvZGluZyhwZGV2LCBjbWQsIGZhbHNlKTsNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBUaGlzIG9uZSBh
bHNvIHdhbnRzIHByb2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyB0byBydW4gc28gaXQgKm1pZ2h0Kg0K
Pj4+Pj4+Pj4gd2FudCBwZGV2IGFuZCB2cGNpIGNoZWNrcy4gQnV0IGF0IHRoZSBzYW1lIHRpbWUg
YXBwbHlfbWFwIHJ1bnMNCj4+Pj4+Pj4+IGF0ICggc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX2Fj
dGl2ZSApLCBzbyBkZWZlcl9tYXAgd29uJ3QgYmUNCj4+Pj4+Pj4+IHJ1bm5pbmcgeWV0LCB0aHVz
IG5vIHZwY2lfcHJvY2Vzc19wZW5kaW5nIGlzIHBvc3NpYmxlIHlldCAoaW4gdGVybXMNCj4+Pj4+
Pj4+IGl0IGhhcyBzb21ldGhpbmcgdG8gZG8geWV0KS4gU28sIEkgdGhpbmsgd2UganVzdCBuZWVk
Og0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAgd3JpdGVfdW5sb2NrKCZw
ZGV2LT5kb21haW4tPnZwY2lfcndsb2NrKTsNCj4+Pj4+Pj4+ICAgICAgwqDCoMKgwqDCoMKgwqAg
cHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzKCk7DQo+Pj4+Pj4+PiAgICAgIMKgwqDCoMKgwqDCoMKg
IHdyaXRlX2xvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+Pj4+Pj4NCj4+Pj4+
Pj4+IGFuZCB0aGlzIHNob3VsZCBiZSBlbm91Z2gNCj4+Pj4+Pj4gR2l2ZW4gdGhlIGNvbnRleHQg
YXBwbHlfbWFwIGlzIGNhbGxlZCBmcm9tIChkb20wIHNwZWNpZmljIGluaXQgY29kZSksDQo+Pj4+
Pj4+IHRoZXJlJ3Mgbm8gbmVlZCB0byBjaGVjayBmb3IgdGhlIHBkZXYgdG8gc3RpbGwgZXhpdHMs
IG9yIHdoZXRoZXIgdnBjaQ0KPj4+Pj4+PiBoYXMgYmVlbiByZWNyZWF0ZWQsIGFzIGl0J3Mgbm90
IHBvc3NpYmxlLiBKdXN0IGFkZCBhIGNvbW1lbnQgdG8NCj4+Pj4+Pj4gZXhwbGljaXRseSBub3Rl
IHRoYXQgdGhlIGNvbnRleHQgb2YgdGhlIGZ1bmN0aW9uIGlzIHNwZWNpYWwsIGFuZCB0aHVzDQo+
Pj4+Pj4+IHRoZXJlJ3Mgbm8gcG9zc2liaWxpdHkgb2YgZWl0aGVyIHRoZSBkZXZpY2Ugb3IgdnBj
aSBnb2luZyBhd2F5Lg0KPj4+Pj4+IERvZXMgaXQgcmVhbGx5IG5lZWQgd3JpdGVfdW5sb2NrL3dy
aXRlX2xvY2sgZ2l2ZW4gdGhlIGNvbnRleHQ/Li4uDQo+Pj4+PiBJIHRoaW5rIGl0J3MgYmFkIHBy
YWN0aWNlIHRvIGNhbGwgcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIHdoaWxlDQo+Pj4+PiBob2xk
aW5nIGFueSBsb2Nrcy4gVGhpcyBpcyBhIHZlcnkgc3BlY2lmaWMgY29udGV4dCBzbyBpdCdzIGxp
a2VseSBmaW5lDQo+Pj4+PiB0byBub3QgZHJvcCB0aGUgbG9jaywgYnV0IHdvdWxkIHN0aWxsIHNl
ZW0gaW5jb3JyZWN0IHRvIG1lLg0KPj4+PiBPaw0KPj4+Pj4+IEkgdGhpbmsgaXQgZG9lc24ndCBh
cyB0aGVyZSBpcyBubyBjaGFuY2UgZGVmZXJfbWFwIGlzIGNhbGxlZCwgdGh1cw0KPj4+Pj4+IHBy
b2Nlc3NfcGVuZGluZ19zb2Z0aXJxcyAtPiB2cGNpX3Byb2Nlc3NfcGVuZGluZyAtPiByZWFkX2xv
Y2sNCj4+Pj4+IEluZGVlZCwgdGhlcmUncyBubyBjaGFuY2Ugb2YgdGhhdCBiZWNhdXNlIHByb2Nl
c3NfcGVuZGluZ19zb2Z0aXJxcw0KPj4+Pj4gd2lsbCBuZXZlciB0cnkgdG8gZG8gYSBzY2hlZHVs
aW5nIG9wZXJhdGlvbiB0aGF0IHdvdWxkIHJlc3VsdCBpbiBvdXINCj4+Pj4+IGNvbnRleHQgYmVp
bmcgc2NoZWR1bGVkIG91dC4NCj4+Pj4gICAgwqDCoMKgIHdoaWxlICggKHJjID0gcmFuZ2VzZXRf
Y29uc3VtZV9yYW5nZXMobWVtLCBtYXBfcmFuZ2UsICZkYXRhKSkgPT0gLUVSRVNUQVJUICkNCj4+
Pj4gICAgwqDCoMKgIHsNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgLyoNCj4+Pj4gICAgwqDCoMKg
wqDCoMKgwqDCoCAqIEZJWE1FOiBHaXZlbiB0aGUgY29udGV4dCBhcHBseV9tYXAgaXMgY2FsbGVk
IGZyb20gKGRvbTAgc3BlY2lmaWMNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoCAqIGluaXQgY29k
ZSBhdCBzeXN0ZW1fc3RhdGUgPCBTWVNfU1RBVEVfYWN0aXZlKSBpdCBpcyBub3Qgc3RyaWN0bHkN
Cj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoCAqIHJlcXVpcmVkIHRoYXQgcGRldi0+ZG9tYWluLT52
cGNpX3J3bG9jayBpcyB1bmxvY2tlZCBiZWZvcmUgY2FsbGluZw0KPj4+PiAgICDCoMKgwqDCoMKg
wqDCoMKgICogcHJvY2Vzc19wZW5kaW5nX3NvZnRpcnFzIGFzIHRoZXJlIGlzIG5vIGNvbnRlbnRp
b24gcG9zc2libGUgYmV0d2Vlbg0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgICogdGhpcyBjb2Rl
IGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0cnlpbmcgdG8gYWNxdWlyZSB0aGUgbG9jayBpbg0K
Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgICogcmVhZCBtb2RlLiBCdXQgcnVubmluZyBwcm9jZXNz
X3BlbmRpbmdfc29mdGlycXMgd2l0aCBhbnkgbG9jayBoZWxkDQo+Pj4+ICAgIMKgwqDCoMKgwqDC
oMKgwqAgKiBkb2Vzbid0IHNlZW0gdG8gYmUgYSBnb29kIHByYWN0aWNlLCBzbyBkcm9wIHRoZSBs
b2NrIGFuZCByZS1hY3F1aXJlDQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqAgKiBpdCByaWdodCBh
Z2Fpbi4NCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+PiAgICDCoMKgwqDCoMKgwqDC
oCB3cml0ZV91bmxvY2soJnBkZXYtPmRvbWFpbi0+dnBjaV9yd2xvY2spOw0KPj4+PiAgICDCoMKg
wqDCoMKgwqDCoCBwcm9jZXNzX3BlbmRpbmdfc29mdGlycXMoKTsNCj4+Pj4gICAgwqDCoMKgwqDC
oMKgwqAgd3JpdGVfbG9jaygmcGRldi0+ZG9tYWluLT52cGNpX3J3bG9jayk7DQo+Pj4+ICAgIMKg
wqDCoCB9DQo+Pj4gSSdtIGFmcmFpZCB0aGF0J3MgbWlzbGVhZGluZyBhdCBiZXN0LiBhcHBseV9t
YXAoKSBpcyBtZXJlbHkgYSBzcGVjaWZpYw0KPj4+IGV4YW1wbGUgd2hlcmUgeW91IGtub3cgdGhl
IGxvY2sgaXMgZ29pbmcgdG8gYmUgdGFrZW4uIEJ1dCByZWFsbHkgYW55DQo+Pj4gc29mdGlycSBo
YW5kbGVyIGNvdWxkIGJlIGFjcXVpcmluZyBhbnkgbG9jaywgc28gcmVxdWVzdGluZyB0byBwcm9j
ZXNzDQo+Pj4gc29mdGlycXMgY2Fubm90IGV2ZXIgYmUgZG9uZSB3aXRoIGFueSBsb2NrIGhlbGQu
DQo+Pj4NCj4+PiBXaGF0IHlvdSBpbnN0ZWFkIHdhbnQgdG8gZXhwbGFpbiBpcyB3aHksIGFmdGVy
IHJlLWFjcXVpcmluZyB0aGUgbG9jaywNCj4+PiBubyBmdXJ0aGVyIGNoZWNraW5nIGlzIG5lZWRl
ZCBmb3IgcG90ZW50aWFsbHkgY2hhbmdlZCBzdGF0ZS4NCj4+IEhvdyBhYm91dDoNCj4+DQo+PiAv
Kg0KPj4gICDCoCogRklYTUU6IEdpdmVuIHRoZSBjb250ZXh0IGFwcGx5X21hcCBpcyBjYWxsZWQg
ZnJvbSAoZG9tMCBzcGVjaWZpYw0KPj4gICDCoCogaW5pdCBjb2RlIGF0IHN5c3RlbV9zdGF0ZSA8
IFNZU19TVEFURV9hY3RpdmUpIHRoZXJlIGlzIG5vIGNvbnRlbnRpb24NCj4+ICAgwqAqIHBvc3Np
YmxlIGJldHdlZW4gdGhpcyBjb2RlIGFuZCB2cGNpX3Byb2Nlc3NfcGVuZGluZyB0cnlpbmcgdG8g
YWNxdWlyZQ0KPj4gICDCoCogdGhlIGxvY2sgaW4gcmVhZCBtb2RlIGFuZCBkZXN0cm95IHBkZXYt
PnZwY2kgaW4gaXRzIGVycm9yIHBhdGguDQo+PiAgIMKgKiBOZWl0aGVyIHBkZXYgbWF5IGJlIGRp
c3Bvc2VkIHlldCwgc28gaXQgaXMgbm90IHJlcXVpcmVkIHRvIGNoZWNrIGlmIHRoZQ0KPj4gICDC
oCogcmVsZXZhbnQgcGRldiBzdGlsbCBleGlzdHMgYWZ0ZXIgcmUtYWNxdWlyaW5nIHRoZSBsb2Nr
Lg0KPj4gICDCoCovDQo+IEknbSBub3Qgc3VyZSBJIGZvbGxvdyB0aGUgZmlyc3Qgc2VudGVuY2U7
IEkgZ3Vlc3MgYSBjb21tYSBvciB0d28gbWF5IGhlbHAsDQo+IGFuZCBvciB1c2luZyAiYXMgd2Vs
bCBhcyIgaW4gcGxhY2Ugb2Ygb25lIG9mIHRoZSB0d28gImFuZCIuIEkgYWxzbyBkb24ndA0KPiB0
aGluayB5b3UgbWVhbiBjb250ZW50aW9uLCBidXQgcmF0aGVyIGEgcmFjZSBiZXR3ZWVuIHRoZSBu
YW1lZCBlbnRpdGllcz8NCiDCoC8qDQogwqAgKiBGSVhNRTogR2l2ZW4gdGhlIGNvbnRleHQgZnJv
bSB3aGljaCBhcHBseV9tYXAgaXMgY2FsbGVkIChkb20wIHNwZWNpZmljDQogwqAgKiBpbml0IGNv
ZGUgYXQgc3lzdGVtX3N0YXRlIDwgU1lTX1NUQVRFX2FjdGl2ZSkgdGhlcmUgaXMgbm8gcmFjZSBj
b25kaXRpb24NCiDCoCAqIHBvc3NpYmxlIGJldHdlZW4gdGhpcyBjb2RlIGFuZCB2cGNpX3Byb2Nl
c3NfcGVuZGluZyB3aGljaCBtYXkgdHJ5IHRvIGFjcXVpcmUNCiDCoCAqIHRoZSBsb2NrIGluIHJl
YWQgbW9kZSBhbmQgYWxzbyB0cnkgdG8gZGVzdHJveSBwZGV2LT52cGNpIGluIGl0cyBlcnJvciBw
YXRoLg0KIMKgICogTmVpdGhlciBwZGV2IG1heSBiZSBkaXNwb3NlZCB5ZXQsIHNvIGl0IGlzIG5v
dCByZXF1aXJlZCB0byBjaGVjayBpZiB0aGUNCiDCoCAqIHJlbGV2YW50IHBkZXYgc3RpbGwgZXhp
c3RzIGFmdGVyIHJlLWFjcXVpcmluZyB0aGUgbG9jay4NCiDCoCAqLw0KPg0KPiBKYW4NCj4NClRo
YW5rIHlvdSwNCk9sZWtzYW5kcg==

