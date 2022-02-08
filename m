Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4924AD466
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:11:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267793.461547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMWU-0001A2-KM; Tue, 08 Feb 2022 09:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267793.461547; Tue, 08 Feb 2022 09:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHMWU-00018B-G6; Tue, 08 Feb 2022 09:10:54 +0000
Received: by outflank-mailman (input) for mailman id 267793;
 Tue, 08 Feb 2022 09:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHMWS-00017y-Kx
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:10:52 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02af1f08-88bf-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:10:51 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2187rWRw012539;
 Tue, 8 Feb 2022 09:10:46 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2058.outbound.protection.outlook.com [104.47.10.58])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e3mh50bpy-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:10:46 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3874.eurprd03.prod.outlook.com (2603:10a6:208:6c::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:10:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:10:41 +0000
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
X-Inumbo-ID: 02af1f08-88bf-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dnz2Hv5qhzHyF59BRJkL2iOB6X5q1PkWrr6Tt8JdxNT739CcPz/imTkUwV6g34SovDWdxfPMdi/zIwjeevWllPyTch0Fh7Gx1BNlFXOTuR0BhrG0PpH9YdcTu1Yyp32HXgtTtANCauf20q5IYuejhIpOU8FXveSr3Q1tzb0dQNewEc+/52GAWDYPoHuJW584N6TY/jrxF2w59Mi8xccPIsLbWqkiEs5HlIfLqcT09VzBwAcrX/SCzOxjOwmo0iX/mRDqNWRrv6VdRuJ0gwHmEO5A6xVWliiJzBsaeOlbPyRDmEuqwv+oq2JKp4NOBrx/MLLWoIrGzh5UMgutmQUq/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4XEPiWN+H2PZLedGwfVkcaFefhabpP2eMao3uFr41Q=;
 b=JGl/St+P9oQ050XqwootRZ0pXPVJClrUXrNGlaoFx4TH1zeRfZhCsz4xNB6FFtnCBw/n1wWoQi+vwEYldgPv6IKK/hQYyWh3hsT4IVkvMbuT0Bw6t80H9Sp4LEnKJ+WXATzY3foYYsrXCSIx9zCplJU0O2q4JErrPZSXyml1OTAAexfxp5S9XcPQrdOgxNQFzrJEfyzkazpiBQBM17Xzed9T1KCYOwSlH1YFRExzRe8Ihef0xdr2A/mO15LODgE02xmRqJKDAS0IkZSVnE9yJ1bSam8RwNXzle/tErTHSQBW2X3jRDNykRXLxpmtTDjbT/YCNBL3DFJzKreooxFiGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4XEPiWN+H2PZLedGwfVkcaFefhabpP2eMao3uFr41Q=;
 b=mQVp81ECWe5nlw5FcdMpt7qA4PqUJhp9RnrAhSzwmd4v9AYTTDBBIYu6pPpAMUSp09k/VM8jshPRtZq9fpUJ44djqRHBSox9n79A/KRAToHGsl3V15zBxwooUvsOeoOPlS8Yn06lthsLxwreLcKJMKHpLl7Ol+YL3fp0yx9GY6dhzErGTsehbkT71PQm/0zXw1NzhrnhycIkG0nF71Gqeh/8kWJmnoQ889BfHPbA6N4+jiRdBzPL+23cvxaAuKoNjaTzfLBhZZJPk0Bc4xmlb8MmYXhw03w3a+kuX3+AJ70LSU+MXSsebMqut6lJZgKRX4oQJwLEcwpKRr8JB9aN1Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
Subject: Re: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Topic: [PATCH v6 04/13] vpci: restrict unhandled read/write operations
 for guests
Thread-Index: AQHYGZFbf8/6pUr0mUKzbmboCx8QkqyDbvWAgAADnYCABd4pgIAAEimAgAABdQA=
Date: Tue, 8 Feb 2022 09:10:41 +0000
Message-ID: <8b9c2bf3-f55b-ec94-9581-551c482c5899@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-5-andr2000@gmail.com>
 <b6f091ed-4fa3-e292-9a21-a780ec90ee09@suse.com>
 <f86a43af-1388-6959-3e71-ba796e4a0c63@epam.com>
 <5a87c401-4ebd-1d5c-b98d-1b535f63be65@epam.com>
 <YgIyV9iboIxVrCS3@Air-de-Roger>
In-Reply-To: <YgIyV9iboIxVrCS3@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f04ee07e-7786-428e-b515-08d9eae2e136
x-ms-traffictypediagnostic: AM0PR03MB3874:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3874A2DAB238351E31875E6BE72D9@AM0PR03MB3874.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FAEykMhLU9H9tg6GdfsjKlsZlAJk82+dzBKRbjr4u2LXAwPpF4O7KKq4LfoYmQdmyLALNKnDoyNkHu47ehcdj/FbuIhfH/aBU0ItxuRI4EqJa4VCrtbiu6pX9Zwvz9k3qX3HyhO0jSNLd4UcQumWQlnpKEkBUe115jukuiXLdL+VPvZWCC+4kc7poJtNJE+ZitbQEyHXfnjkUsLkRsalXpnSRem4wypV0l/lRFmahGzm6ke4VPoi6jdbQlqvmdbkzEvsLYeZaww/X9Cknz/44GAq8oeVYcmZ2UxoxsZe55FZfcgw50IAwYR0jxBZu3BlDHD4J+sIip6wceoQqt1CWVx/GYmZxsg2U/JX/w2Q2XdZ1Yw55W8KNQRGxSNUO4+6w+TwT/upFuYAhMeoDhzcMjF9VymEp8P3qeyqRbG0ZNnvwJdjTakPKxArfvtZF+VcfH/BW4Y+QcM7ELetcGTEpgv6r2q1PfQK5cx0oKefD+mbFmbkCOmopxT7IZF0I/VbKjI2IaEHnaj8AANu4Q8qU1Xy6zSnj8sraKHf/YQ5Do8UAZGWWfgBhXRMbFfYVT0mfc4kOsSf1Ic43Xm3I7lYFBnZE9gVaK4BiTWNqdVrBVvZ93W0AaNaHo7Qgl/b2A7rGiups8aDO5Jc6x2bMBXTxlYMymMWEkgRiVFUYRH4N5v2+5kQlOJJzU/xN2x1lYSyf4VFKrdtlssmne/Yu0chH6RXKCMQwJszTRNwNlGw8KpJEl1aN47sqhEoKy2udP01
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(53546011)(5660300002)(55236004)(7416002)(6506007)(26005)(2616005)(186003)(6512007)(38070700005)(8936002)(31686004)(2906002)(83380400001)(66946007)(508600001)(71200400001)(91956017)(66446008)(76116006)(31696002)(54906003)(316002)(38100700002)(107886003)(6916009)(4326008)(122000001)(8676002)(66556008)(66476007)(64756008)(6486002)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Sm82OXNPbU9PaEpoMkpBREU4VEtxZU1abjBJWlBWUnpxVXkzODRtajcra0xM?=
 =?utf-8?B?WllXWit0TGhCVkRrUGFLSFk2N2VyNzVvb2RDSVh1dzRxcmlENGhGM0RTb0NK?=
 =?utf-8?B?My96ME5UMlhCNUc2TjlNbkFzSnZpVXAyUldEeWZuNW4rdDVoOFRFWjBkcmVn?=
 =?utf-8?B?RTVVTmY5alNEZ0J3OTdhbngvWkFhTXAvM00xNU01RkVTMldPRk10STFETWtM?=
 =?utf-8?B?N0VCRy81cTF0eDgvRE1wYjNDVjR2aVdnRXRSYTBxVUtoS2FFejdmVTcyekdN?=
 =?utf-8?B?YUo5dzRaQ01hcFFoSXpFTnVEWTFDWTAxSVVjN1R0NWNqM094ZG5KWWcyQ2xa?=
 =?utf-8?B?OGNHSFJxVVBBT29jZkNUTG5ka0xRd0JBUGw1aGZ0M1ZxZDh3ejJoSTdyU3NS?=
 =?utf-8?B?dnZzQUx4WjNxQmhuWGhnMFhnT1o3ODNCd2dDL204aHBtSzBZbVdLelV3WkJm?=
 =?utf-8?B?enFDKzdUd2txbGlDSW53eFhkNm9KWW9SYmZnbGFBdWVjaTY1VXhFb3ZvOHIx?=
 =?utf-8?B?OFpEOWZtWThqU1UweTgrRUFDMHUwZUtHNGhwZW1OSWN3U2ZPZHRRSUZ1eDNT?=
 =?utf-8?B?ZGhwRVdWK3djeXJlMXRLVTZXRXJrbEtXUEk2VWpCQU9YTHFaY25VdHRuU2xN?=
 =?utf-8?B?VHB3QU13UDBrc0dUV08yMlFYS1Z3VytpYytYZDl5Wnl3cGpZOVBNd1NFVXNx?=
 =?utf-8?B?djZaK2FOb2JCQXNQYUNlVVA3ZXFzd0R5WWhNaExETElQY0E5Q3JIQ3E0Y1J4?=
 =?utf-8?B?c2M4eWdQNW95QU1DaWRwakJJdEZCdVJWZ2tVLzc5VnBwSm5KUDJLVVJodEdo?=
 =?utf-8?B?TnNBNjNlVkVJS21BQjVOY3YxdHZnV3dMUTVGRXRXVzJWU2RtcTNjTGFtTWxQ?=
 =?utf-8?B?RVdEbFpuMnJUendMY1NsUHlibmpBVkVWVkJSSm1UR1U0cmxYRkNCRGYrWHRE?=
 =?utf-8?B?T2FwTlg4VkdLeElVQXZOYnV5UTJYQVpqS2x0RnFZVXdvdVNTVS92ZXdDK0xO?=
 =?utf-8?B?bS9YT0xka3pDZkN5K05UNGhER3JtQmVyclRRT1Z6bEVqV3I0OVRBam4wNkg5?=
 =?utf-8?B?eHNGNHdKYXJ2b3kvRUpmQWEwa2RZYnczclFBWlNLT25ENkRSVVE3ekplRW1Q?=
 =?utf-8?B?clJJbVZBdDdocExUM20vU2FLM1FjbTEwNktsYnNmM2tHRGlVOTdGcTI5NGtR?=
 =?utf-8?B?UmpDYURnanBKU0FRVEE0amNrNzkvS3J2YlVKV0pQdiswN25IeUYrUDV0aVVN?=
 =?utf-8?B?emdsNVRXdngvOHFmYWYvVDZGRXBwR0JJQUFGVDY2WDdvNHB4Z0VHRnY4UzFr?=
 =?utf-8?B?eEtIbk1WUkhnS1M4MlRrWW5UYmtMSm14aUp6Tjh5Ty9mWDZXaEl4UzZrclJV?=
 =?utf-8?B?UFNYVW5zQ0pJdWFTREI4ZE85NHJSZStZU2RsaS9YZXE4TlBCTCt0ZXpNQlJG?=
 =?utf-8?B?OUd3d3NxK3hYOUs3UlRjU1ZCbVhBMzdudlZmME5LUG8zekZ4bVJoSWVwYm53?=
 =?utf-8?B?MnphV0tSUUlqazZDTEJOTWE0ak1MWGtndUlSMUwxUUNFckdYTDlsZi9IcWdq?=
 =?utf-8?B?TTNNbkI5eWZUZDZnbVlyS1Uzakp6YldHSys3WE96N1kxYklSdmFBZ2VUVnJj?=
 =?utf-8?B?MGNydVoxMHduTFdnR01URGdwR08wM2RhRWF0cTdkM3NkZkh5alpsOHczUFl3?=
 =?utf-8?B?dkdIYTMwSm45RFBjcVF1Mk01VkZxUkV2YzZrOE1sQ2Nob09CdWt4Q1Z2U0x1?=
 =?utf-8?B?MmJ5WWYzNE9ZQVZXQWx0TytGWk1JSGw2M1g0U0pBeWNEODFzcEYyYWxkWTc2?=
 =?utf-8?B?c1hHQ3VIWnk4a2FoR3h1ZFEzSE1lNjBud1Bxbmo4K2ZyQmkvSnhMZW5GZDR4?=
 =?utf-8?B?dGl3Nnp4WUJLWWpqZjJnQWlIeG9JYWdZYjliNFE0Uit1ZERjN3VhUVR3Mjkw?=
 =?utf-8?B?Q3dUakNZWFFuSjB3R0NWd3ozUllvNTI3V2hrRTZFa0Y2TWlCSmk2Vm83MExm?=
 =?utf-8?B?RFJLcE12SnRtS0pob3lHZ2NZUENQSnQzNDN5V05PSEpJMFVSblFNZDBBTVFh?=
 =?utf-8?B?QjlpOVVuYWFreVMyNHFRaSs2eE1FTDZTMTQzdmxXNmUzaVgrNEVKaTF6by85?=
 =?utf-8?B?WjJoZDk5Q1Z3K1RGODU3U05hSzJrUXZFSlpPaUwyRTJBdm9rak0wQjVHaGQz?=
 =?utf-8?B?TTlDNWZSSmZzYk1pM09BNElnbXRTYjQ1c2hqU1J6NjZrS3IzZC9wakFnTGNn?=
 =?utf-8?B?RmFxeFVBemUybW9UaFZyMm1sNVF0SlR4TkRqY092ZEFCMkxueS9MaVNSQVEz?=
 =?utf-8?B?bnJEUGFPaWdzNWhWSzFwZ3k5d3pldHpnb3pZSHFQaEtXaEhrQU9UMHRTbzVw?=
 =?utf-8?Q?+fzdXc6gzZpMlMRc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B04ED0FA3AD60549BADAF9EF7289C838@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04ee07e-7786-428e-b515-08d9eae2e136
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:10:41.0665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mR+PwMSgSX4VjWW19F6JQbduH09qFNQr4Uy6pHV+pfpFO6NslKvwBEk+oMADKsgAPRVyNEOs6Om0DRK4hWFbMstmyJbAYTqyur5vT6KvC/w6n9C6OBTlwbb0KGDmaS0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3874
X-Proofpoint-ORIG-GUID: t6Bn3eJwRzrOgrjIv8PqmgZryVNnbzHA
X-Proofpoint-GUID: t6Bn3eJwRzrOgrjIv8PqmgZryVNnbzHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080052

DQoNCk9uIDA4LjAyLjIyIDExOjA1LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUdWUs
IEZlYiAwOCwgMjAyMiBhdCAwODowMDoyOEFNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IE9uIDA0LjAyLjIyIDE2OjI0LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+PiBPbiAwNC4wMi4yMiAxNjoxMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IE9u
IDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4g
QSBndWVzdCBjYW4gcmVhZCBhbmQgd3JpdGUgdGhvc2UgcmVnaXN0ZXJzIHdoaWNoIGFyZSBub3Qg
ZW11bGF0ZWQgYW5kDQo+Pj4+PiBoYXZlIG5vIHJlc3BlY3RpdmUgdlBDSSBoYW5kbGVycywgc28g
aXQgY2FuIGFjY2VzcyB0aGUgSFcgZGlyZWN0bHkuDQo+Pj4+IEkgZG9uJ3QgdGhpbmsgdGhpcyBk
ZXNjcmliZXMgdGhlIHByZXNlbnQgc2l0dWF0aW9uLiBPciBkaWQgSSBtaXNzIHdoZXJlDQo+Pj4+
IGRldmljZXMgY2FuIGFjdHVhbGx5IGJlIGV4cG9zZWQgdG8gZ3Vlc3RzIGFscmVhZHksIGRlc3Bp
dGUgbXVjaCBvZiB0aGUNCj4+Pj4gc3VwcG9ydCBsb2dpYyBzdGlsbCBtaXNzaW5nPw0KPj4+IE5v
LCB0aGV5IGFyZSBub3QgZXhwb3NlZCB5ZXQgYW5kIHlvdSBrbm93IHRoYXQuDQo+Pj4gSSB3aWxs
IHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UNCj4+IEJUVywgYWxsIHRoaXMgd29yayBpcyBhYm91
dCBhZGRpbmcgdnBjaSBmb3IgZ3Vlc3RzIGFuZCBvZiBjb3Vyc2UgdGhpcw0KPj4gaXMgbm90IGdv
aW5nIHRvIGJlIGVuYWJsZWQgcmlnaHQgYXdheS4NCj4+IEkgd291bGQgbGlrZSB0byBoZWFyIHRo
ZSBjb21tb24gYWNjZXB0YWJsZSB3YXkgb2YgZG9jdW1lbnRpbmcgc3VjaA0KPj4gdGhpbmdzOiBl
aXRoZXIgd2UganVzdCBzYXkgc29tZXRoaW5nIGxpa2UgIkEgZ3Vlc3QgY2FuIHJlYWQgYW5kIHdy
aXRlIg0KPj4gZWxzZXdoZXJlIG9yIHdlIG5lZWQgdG8gaW52ZW50IHNvbWV0aGluZyBuZXV0cmFs
IG5vdCBkaXJlY3RseSBtZW50aW9uaW5nDQo+PiB3aGF0IHRoZSBjaGFuZ2UgZG9lcy4gV2l0aCB0
aGUgbGF0ZXIgaXQgYWxsIHNlZW1zIGEgYml0IGNvbmZ1c2luZyBJTU8NCj4+IGFzIHdlIGRvIGtu
b3cgd2hhdCB3ZSBhcmUgZG9pbmcgYW5kIGZvciB3aGF0IHJlYXNvbjogZW5hYmxlIHZwY2kgZm9y
IGd1ZXN0cw0KPj4+Pj4gSW4gb3JkZXIgdG8gcHJldmVudCBhIGd1ZXN0IGZyb20gcmVhZHMgYW5k
IHdyaXRlcyBmcm9tL3RvIHRoZSB1bmhhbmRsZWQNCj4+Pj4+IHJlZ2lzdGVycyBtYWtlIHN1cmUg
b25seSBoYXJkd2FyZSBkb21haW4gY2FuIGFjY2VzcyBIVyBkaXJlY3RseSBhbmQgcmVzdHJpY3QN
Cj4+Pj4+IGd1ZXN0cyBmcm9tIGRvaW5nIHNvLg0KPj4+PiBUYW5nZW50aWFsIHF1ZXN0aW9uOiBH
b2luZyBvdmVyIHRoZSB0aXRsZXMgb2YgdGhlIHJlbWFpbmluZyBwYXRjaGVzIEkNCj4+Pj4gbm90
aWNlIHBhdGNoIDYgaXMgZ29pbmcgdG8gZGVhbCB3aXRoIEJBUiBhY2Nlc3Nlcy4gQnV0IChnb2lu
ZyBqdXN0DQo+Pj4+IGZyb20gdGhlIHRpdGxlcykgSSBjYW4ndCBzcG90IGFueXdoZXJlIHRoYXQg
dmVuZG9yIGFuZCBkZXZpY2UgSURzDQo+Pj4+IHdvdWxkIGJlIGV4cG9zZWQgdG8gZ3Vlc3RzLiBZ
ZXQgdGhhdCdzIHRoZSBmaXJzdCB0aGluZyBndWVzdHMgd2lsbCBuZWVkDQo+Pj4+IGluIG9yZGVy
IHRvIGFjdHVhbGx5IHJlY29nbml6ZSBkZXZpY2VzLiBBcyBzYWlkIGJlZm9yZSwgYWxsb3dpbmcg
Z3Vlc3RzDQo+Pj4+IGFjY2VzcyB0byBzdWNoIHIvbyBmaWVsZHMgaXMgcXVpdGUgbGlrZWx5IGdv
aW5nIHRvIGJlIGZpbmUuDQo+Pj4gQWdyZWUsIEkgd2FzIHRoaW5raW5nIGFib3V0IGFkZGluZyBz
dWNoIGEgcGF0Y2ggdG8gYWxsb3cgSURzLA0KPj4+IGJ1dCBmaW5hbGx5IGRlY2lkZWQgbm90IHRv
IGFkZCBtb3JlIHRvIHRoaXMgc2VyaWVzLg0KPj4+IEFnYWluLCB0aGUgd2hvbGUgdGhpbmcgaXMg
bm90IHdvcmtpbmcgeWV0IGFuZCBmb3IgdGhlIGRldmVsb3BtZW50DQo+Pj4gdGhpcyBwYXRjaCBj
YW4vbmVlZHMgdG8gYmUgcmV2ZXJ0ZWQuIFNvLCBlaXRoZXIgd2UgaW1wbGVtZW50IElEcw0KPj4+
IG9yIG5vdCB0aGlzIGRvZXNuJ3QgY2hhbmdlIGFueXRoaW5nIHdpdGggdGhpcyByZXNwZWN0DQo+
PiBSb2dlciwgZG8geW91IHdhbnQgYW4gYWRkaXRpb25hbCBwYXRjaCB3aXRoIElEcyBpbiB2Nz8N
Cj4gSSB3b3VsZCBleHBlY3QgYSBsb3QgbW9yZSB3b3JrIHRvIGJlIHJlcXVpcmVkLCB5b3UgbmVl
ZCBJRHMgYW5kIHRoZQ0KPiBIZWFkZXIgdHlwZSBhcyBhIG1pbmltdW0gSSB3b3VsZCBzYXkuIEFu
ZCB0aGVuIGluIG9yZGVyIHRvIGhhdmUNCj4gc29tZXRoaW5nIGZ1bmN0aW9uYWwgeW91IHdpbGwg
YWxzbyBuZWVkIHRvIGhhbmRsZSB0aGUgY2FwYWJpbGl0aWVzDQo+IHBvaW50ZXIuDQo+DQo+IEkn
bSBmaW5lIGZvciB0aGlzIHRvIGJlIGFkZGVkIGluIGEgZm9sbG93dXAgc2VyaWVzLiBJIHRoaW5r
IGl0J3MgY2xlYXINCj4gdGhlIHN0YXR1cyBhZnRlciB0aGlzIHNlcmllcyBpcyBub3QgZ29pbmcg
dG8gYmUgZnVuY3Rpb25hbC4NCk9rLCBzbyBsZXQncyBmaXJzdCBoYXZlIHNvbWV0aGluZyBhbmQg
dGhlbiB3ZSBjYW4gZXh0ZW5kIGd1ZXN0J3Mgc3VwcG9ydA0KVGhpcyBjYW4gZ28gaW4gcGFyYWxs
ZWwgd2l0aCBvdGhlciB3b3JrIG9uIEFybSB3aGljaCBzdGlsbCB3YWl0cw0KZm9yIHRoaXMgc2Vy
aWVzIHRvIGJlIGFjY2VwdGVkDQo+DQo+Pj4+PiAtLS0gYS94ZW4vZHJpdmVycy92cGNpL3ZwY2ku
Yw0KPj4+Pj4gKysrIGIveGVuL2RyaXZlcnMvdnBjaS92cGNpLmMNCj4+Pj4+IEBAIC0yMTUsMTEg
KzIxNSwxNSBAQCBpbnQgdnBjaV9yZW1vdmVfcmVnaXN0ZXIoc3RydWN0IHZwY2kgKnZwY2ksIHVu
c2lnbmVkIGludCBvZmZzZXQsDQo+Pj4+PiAgICAgfQ0KPj4+Pj4gICAgIA0KPj4+Pj4gICAgIC8q
IFdyYXBwZXJzIGZvciBwZXJmb3JtaW5nIHJlYWRzL3dyaXRlcyB0byB0aGUgdW5kZXJseWluZyBo
YXJkd2FyZS4gKi8NCj4+Pj4+IC1zdGF0aWMgdWludDMyX3QgdnBjaV9yZWFkX2h3KHBjaV9zYmRm
X3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4+ICtzdGF0aWMgdWludDMyX3QgdnBjaV9y
ZWFkX2h3KGJvb2wgaXNfaHdkb20sIHBjaV9zYmRmX3Qgc2JkZiwgdW5zaWduZWQgaW50IHJlZywN
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBzaXpl
KQ0KPj4+PiBXYXMgdGhlIHBhc3NpbmcgYXJvdW5kIG9mIGEgYm9vbGVhbiB0aGUgY29uc2Vuc3Vz
IHdoaWNoIHdhcyByZWFjaGVkPw0KPj4+IFdhcyB0aGlzIHBhdGNoIGNvbW1pdHRlZCB5ZXQ/DQo+
Pj4+IFBlcnNvbmFsbHkgSSdkIGZpbmUgaXQgbW9yZSBuYXR1cmFsIGlmIHRoZSB0d28gZnVuY3Rp
b25zIGNoZWNrZWQNCj4+Pj4gY3VycmVudC0+ZG9tYWluIHRoZW1zZWx2ZXMuDQo+Pj4gVGhpcyBp
cyBhbHNvIHBvc3NpYmxlLCBidXQgSSB3b3VsZCBsaWtlIHRvIGhlYXIgUm9nZXIncyB2aWV3IG9u
IHRoaXMgYXMgd2VsbA0KPj4+IEkgYW0gZmluZSBlaXRoZXIgd2F5DQo+PiBSb2dlciwgd2hhdCdz
IHlvdXIgbWFpbnRhaW5lcidzIHByZWZlcmVuY2UgaGVyZT8gQWRkaXRpb25hbCBhcmd1bWVudA0K
Pj4gdG8gdnBjaV9yZWFkX2h3IG9mIG1ha2UgaXQgdXNlIGN1cnJlbnQtPmRvbWFpbiBpbnRlcm5h
bGx5Pw0KPiBNeSByZWNvbW1lbmRhdGlvbiB3b3VsZCBiZSB0byB1c2UgY3VycmVudC0+ZG9tYWlu
LiBIYW5kbGVycyB3aWxsDQo+IGFsd2F5cyBiZSBleGVjdXRlZCBpbiBndWVzdCBjb250ZXh0LCBz
byB0aGVyZSdzIG5vIG5lZWQgdG8gcGFzcyBhDQo+IHBhcmFtZXRlciBhcm91bmQuDQpvaywgSSds
bCB1c2UgY3VycmVudC0+ZG9tYWluDQo+DQo+IFRoYW5rcywgUm9nZXIuDQo+DQpUaGFuayB5b3Us
DQpPbGVrc2FuZHI=

