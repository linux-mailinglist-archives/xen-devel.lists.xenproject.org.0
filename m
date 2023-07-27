Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3933765613
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 16:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571141.894275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP28F-0006WF-27; Thu, 27 Jul 2023 14:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571141.894275; Thu, 27 Jul 2023 14:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP28E-0006UT-To; Thu, 27 Jul 2023 14:38:22 +0000
Received: by outflank-mailman (input) for mailman id 571141;
 Thu, 27 Jul 2023 14:38:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn4a=DN=epam.com=prvs=157204e9ea=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1qP28D-0006UN-QA
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 14:38:21 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39ab9da6-2c8b-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 16:38:19 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36RE2p2o019297; Thu, 27 Jul 2023 14:38:09 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3s3p7xsb5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jul 2023 14:38:09 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB8927.eurprd03.prod.outlook.com (2603:10a6:20b:5bf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 14:38:06 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::3a00:d290:e446:d887%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 14:38:05 +0000
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
X-Inumbo-ID: 39ab9da6-2c8b-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVvKDOPxwknbMNaU8T25i3Wz/mkDGtVwHXyWFd+A3sXK2DflBgqZpGVzH0SFsbhrCdri/7FwH/K5AQ0reCikiTJuCOJrsdykXDaMuf0bIo83xbfiw+1b8ynMoGKrq8xwIFDNMlnuOcvs86PMmt9x5yQNS4BmVdh96ZINq/P2XiMiEpe89jysDEzgUHs/OsYLtErmBtuP4GMhGi769+l1ezMpHFKMZj+mr6YsqSCtC2590BJgyRJBU52eAWuTL0AdFVyhg/rtYjtjSgFm2ZL2NvOEzWO0NoZNY+E3MZ8JXLp7zjJcQMKCj9+S+4Xors5RShxLP9QGs7ZK64in/SGdDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2xAfSTh3R/kPZWB06sj7/uK5e9SlxZ/UndJMccvw8w=;
 b=ilA7OY6UO+Vmofvzh9xlt/2wWEfITT71fSJQ4kuSizwpxwi93FJ1sM2hRpV6NyABlFzGYd39Xxge4utdsgBAhWF1C+IcVhNW44ZBgi0tyl8OtDSTG0remG5AbGrdJef8zF4bTx5Rke+yLUcpH2knz6LJZV71t83XRg99nOIY1rNv/LaGro6YEwwzPTyyInJ5gezrBNdq1Fj6z8AyXcfSZ6X5sfiRlSASu+Qb3CnCIzbmMRFxWWZjkuPEoGedzcJsczsKH6Q7wXSHEn2F9O7SluP+0zK2bKPvHdq6MGYY9Hk3jdotK95WADYXQfUKxmUMOJ4TIJy/8gDt7bDWSBdBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2xAfSTh3R/kPZWB06sj7/uK5e9SlxZ/UndJMccvw8w=;
 b=RU4WT8TcJdffOrt0Ltp9F+SkpMwe+f6MqKeBp7CDs/8+tafDYNwlnsofvuU6dLDd+JXBVcLNamYabLxk/HPXe3zzYMQ47cPN/hpJCvVDzqtWqLSiGUoGecE5JgOrpvXMDEqZzCcW3qeDULjAxm4yTz61x2KYHoFckzeqy6NKUamwFSMBRvuxQcxeb51067eIY4V3R4v7qbFR+/OlTn53DEVmXYxxeErPLz72V8WNzrpy7Ji/bbiQrb6bFZLrb3fJvyW9Munmd4UlSz5XrTnbpWhHz9h7u5+dw5QFCv9LMC2k4VKqGtAAf5YOiWu+CfgjUeupRUcDkONVDy+ouFNISw==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Wei Liu
	<wl@xen.org>, Oleksandr Tyshchenko <olekstysh@gmail.com>,
        Juergen Gross
	<jgross@suse.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Topic: [PATCH] libxl: Add missing libxl__virtio_devtype to
 device_type_tbl array
Thread-Index: AQHZv8uYlQiykVHkhkC1aQss9HQu9q/NX+QAgAANWwCAADReAIAADrOA
Date: Thu, 27 Jul 2023 14:38:05 +0000
Message-ID: <3eefac79-a180-ab4f-060a-9010e0c26c09@epam.com>
References: <20230726141459.985463-1-olekstysh@gmail.com>
 <670c22f9-135d-4022-8272-78af3e28c011@perard>
 <5360d7ae-b754-99f9-686f-882bdc33e7eb@epam.com>
 <0bca0a3b-2a74-42c7-96d2-23f6dab7d169@perard>
In-Reply-To: <0bca0a3b-2a74-42c7-96d2-23f6dab7d169@perard>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS8PR03MB8927:EE_
x-ms-office365-filtering-correlation-id: d2b9e9d4-5a33-4cbe-a7e2-08db8eaf16ed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 mzmvZg2D87siUyop0/szklAyYQefzIWupedpyMvcSkOH6RpOSlu7jsdZCq9Y84vcMTXfH2hj408QPRKpA45KuXCKoO2/3R3Vwa7jyeVRVvL8xEFZ4LpylqGeDxRohhV8vn9IXnhQnCpgsbaj7yYdJkRGQJNONm/3jX6kKNXIBLKBPZritbzJMIdSuPO172LTN6gBIzxarnqRMVzu3tUML54KeL6m4z88fVVg16lMn6fxLy+C9mov8EdKME9wYGryPm1mnEojEcu4eoEl9K/0Y7rxUxzCVgqZEycF0f5wFw7y/owp0z1zCyozIsTi6NE5CmOVxnb7+BBsJoJnBa4MMOWpxN0pyixx4ItF1GSZHLEALxbButjnOYyL96jsnV0Dlbcgqyb9n6h+wW1bqo7N1i+ENQ64op1kEyHjua/0nr3oepHJKU7EJyVDZZJsojfQ9dPf0OnGsjPg4DE4WZ+Be8VhFChtqEBk0roCCzY/61+J1VGq9VF5lwTNNvI/fPixbumcQUkathVDbZ9YA00UGQsHuvmS91RG32e25avn4ijvyzVMZMfGWQD657ifoX8hE8pi0en7OGlvuoYNs1FDomfzx6DCLpGNcyiqHr8yoKCi+Hk+kxYmWVbe2848PVCFIFOJ+T6Ode5ol41iT4F1ApaErEJFRWEOu0JgVfHjPv3CQTAX8xcRyt9XyIzwOrR+
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(316002)(66556008)(2616005)(83380400001)(66476007)(66946007)(64756008)(66446008)(6916009)(4326008)(54906003)(6486002)(6512007)(478600001)(71200400001)(26005)(91956017)(53546011)(6506007)(186003)(2906002)(76116006)(38100700002)(86362001)(122000001)(38070700005)(31696002)(36756003)(41300700001)(8936002)(8676002)(5660300002)(31686004)(101420200003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UUFnN2dyOTJGZWNsTE14bHFaYi9sdDZFdXYxUG9taTZrOHIvNUdhL2NGVEEr?=
 =?utf-8?B?SFF6WWhCYXpCZUhSRkJQbWtnSDdkb1prc3ZBa0RidCtVZkIzbDFKcVppcHN1?=
 =?utf-8?B?ZmVXU3hjSisxbjBjanN6L1pYeTNFdjBTYzFoa1FpakI4OHZ2Qnd4aDkwa05M?=
 =?utf-8?B?NEYranRGZ1EzdURZUERrL0VQREhnLzBkZmZ5TnNaeUVQSGNUMkhiWUFSV0Z5?=
 =?utf-8?B?dTM3aVVBTEREVFg4cHBiWGJ1V3lhTThNdEpVdGJFM051UENXd2FSZDFaVGIy?=
 =?utf-8?B?SHZjMmVtV0UyaXFzdHZOcjdab0VRVGR3bU5TT083c0dyQXp6M2NGTHRzbHcw?=
 =?utf-8?B?LzFheUJEZlFuMGExUE84Qnh6eHBXUHBFS1EwNTJRTUtCUkN1aGtKdXJpMlJE?=
 =?utf-8?B?L3FIQmN4eTljM1JhUlJpT2tzMWtDV2d0Y21yVCtWNnl2UzZoQUczUGQxZG1p?=
 =?utf-8?B?RHFaVmMzRXBYZXIveDVXNzgvNXRJb2UzZGhoZC9NbEltbHpLQmhXK0ZEcjlu?=
 =?utf-8?B?V2k4TDVkbXVKeUNXajBsa1FsQmFxdkdXdng4UkNLeGoweTVzdFRMWFdOY2FN?=
 =?utf-8?B?TlJyS016WE8vVHRwdTdwWkdGM1k1OGZqcUZCdU1ObTczM0YrSldzbjN3WVRa?=
 =?utf-8?B?bkttUUFoTDhmd2dUN29NaWE1YXg3Y2NSc09oaktpQWlObFNxc0JzTHJGVWNq?=
 =?utf-8?B?QTZZYWZIL2thZFZkMW05UDIvcENIMHdKQThNMktlTm55T2hya1NLYXBLRFp4?=
 =?utf-8?B?c3M5azBsMG04SW82V2VscmtOV3B5SGZVMXBoZkh5dG1iSjV1RGtZYkpQQVBj?=
 =?utf-8?B?ZWxvZVdFcEdva0ZPRGwveW5jMm8rTTRIbzRJd3lUenJXdEpXSHdUeWZBSmJR?=
 =?utf-8?B?TDFwWSt4OHo0dEFmOUxGNkorRUdTSlM5MzRLVXpKN3B2eUVSaFhTU0RQbDJz?=
 =?utf-8?B?MWVtYk9sZ1VsWXFoL2JLbnYyemdJck44VUJXS1Z5OVo5cWtjNVFZL1BxVXpt?=
 =?utf-8?B?U1pHREx0bngreWJxVkNOTzFFTU85RjJNWEIyQXo1eGpubkJTNXJnTFpyYVBO?=
 =?utf-8?B?bURjMHY1d3BaU1M4bXlXWTZRQllUcHQwTk4xajBpY01ZQXllNXpoVjhEWVV3?=
 =?utf-8?B?RHl4VGxTKzFkbXV6TjB3VlNsRWROaGhkcE8wUGpUem8yaFM2WGpmNlNicUxr?=
 =?utf-8?B?SWtNYUU4cXJyRFhTaUYxcEwzSnM0RG1xa1ZnSHdIN2MzY1ZpdDRZTGhIeDBV?=
 =?utf-8?B?WS9jalhHclQ4Mk1jV0FJNE5pS09nNnFZRERaSkZHZFdYekp1LzMvcVNOTzQ1?=
 =?utf-8?B?R294M2VNYmpIcE1LSW1BSGgxV2NaQzJIMTVUcXhNK2RycStCOXQ1L09rZ3dJ?=
 =?utf-8?B?aGdmUUx2UEljY3BsL2MxTEx4MHpicVNxc2NwYzkrK05vY1A5S0hCOGJCNFE3?=
 =?utf-8?B?bzNZQ2Exa1M3UGZ0M2JxcGxjYWFDenNYN2t3RGdmSmh5bUI4dGlRS3hCVkJz?=
 =?utf-8?B?dzRLR09uRnBRb1ZKZVNSbmdoNXl1TE5nTTN4N3lGaUdDV2xhRjJ5c1VCZ3Zr?=
 =?utf-8?B?ajFrM3RVSkdkdEx4MTBuNEhFUkhhRnhXdWcrUzV6RFV3OWllL05uR2JTU21P?=
 =?utf-8?B?OEY3OXdsVTc4dldnSGVDSzZCTm0yRmFsTmFLcE9OOU13cWdNWWJ6bisrMCtK?=
 =?utf-8?B?cm9zMFd3ZXlvc1IwZmhqZDk0MXJuTzQvNm5ZTjdGWmIvNFJDMXBqNmluQVZM?=
 =?utf-8?B?NnVPeElMV1A4M05SZ2txMlFJYzNxR0xHSVhFWGxvcGg4d3o0SXNJUk9sMWg2?=
 =?utf-8?B?ZHlLVHFvNlo2aTlUY0pFQ1FqZVF0NW5OREE1aDZHREtaSk9KNmQweDJVUW8v?=
 =?utf-8?B?M21mM1AwQ0ZaT2xVb3FWZzh5dXJMQ1h1WDFwOWVIQ1k4Z3RoM0U0dGxFaFhH?=
 =?utf-8?B?aTFzcWN5d0IzNjdBY0VoT2J4T21OcTV4aUJvNlAzQXY1ODBFMktOVzhaUDht?=
 =?utf-8?B?eVRxL0JscjQ3SWxSVWdRZ05NY2pmeG55OUNtZTkyWk9xcFJLN201T1lsRGtr?=
 =?utf-8?B?N1hydHdHcWVEY1RBb09naTV1dXpyNm1wekVSWmVCazJYaFRWc1hEOWI4UWg3?=
 =?utf-8?B?MW5UMndoNmdONDBEQWlMK21KaklwNy9Wc0QrbE9IR2VvK1FTbVFKQzdHVEZy?=
 =?utf-8?Q?3L5NpOUpf2DlRgP9JI+Z/XA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <026FD11FDA5FBB4FAB55CD2E86A44789@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2b9e9d4-5a33-4cbe-a7e2-08db8eaf16ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 14:38:05.8082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FQLRFUWm8B8R/wMZeDEcdC2R54t0FLS6StAN6Le7a3CQpuEBLt/LNS1YEM1jl23P0kn8xb/KSYBupa7XMxALw68CHaDl0l3FS0X9/XEmnvw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8927
X-Proofpoint-GUID: Tzk-Ac4eFvDRnVxtbqoI6Q9pZ7I5Lm2A
X-Proofpoint-ORIG-GUID: Tzk-Ac4eFvDRnVxtbqoI6Q9pZ7I5Lm2A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_07,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=781 spamscore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307270131

DQoNCk9uIDI3LjA3LjIzIDE2OjQ1LCBBbnRob255IFBFUkFSRCB3cm90ZToNCg0KDQpIZWxsbyBB
bnRob255DQoNCj4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTA6Mzg6MDNBTSArMDAwMCwgT2xl
a3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4NCj4+IE9uIDI3LjA3LjIzIDEyOjUwLCBB
bnRob255IFBFUkFSRCB3cm90ZToNCj4+DQo+PiBIZWxsbyBBbnRob255DQo+Pg0KPj4+IE9uIFdl
ZCwgSnVsIDI2LCAyMDIzIGF0IDA1OjE0OjU5UE0gKzAzMDAsIE9sZWtzYW5kciBUeXNoY2hlbmtv
IHdyb3RlOg0KPj4+PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hj
aGVua29AZXBhbS5jb20+DQo+Pj4+DQo+Pj4+IFdpdGhvdXQgaXQgYmVpbmcgcHJlc2VudCBpdCB3
b24ndCBiZSBwb3NzaWJsZSB0byB1c2Ugc29tZQ0KPj4+PiBsaWJ4bF9fZGV2aWNlX3R5cGUncyBj
YWxsYmFja3MgZm9yIHZpcnRpbyBkZXZpY2VzIGFzIHRoZSBjb21tb24gY29kZQ0KPj4+PiBjYW4g
b25seSBpbnZva2UgdGhlc2UgY2FsbGJhY2tzIChieSBkZXJlZmVyZW5jaW5nIGEgcG9pbnRlcikg
Zm9yIHZhbGlkDQo+Pj4+IGxpYnhsX19kZXZpY2VfdHlwZSdzIGVsZW1lbnRzIHdoZW4gaXRlcmF0
aW5nIG92ZXIgZGV2aWNlX3R5cGVfdGJsW10uDQo+Pj4NCj4+PiBEaWQgeW91IG5vdGljZSBhbiBp
c3N1ZSB3aXRoIGl0IGJlZW4gbWlzc2luZyBmcm9tIGRldmljZV90eXBlX3RibFtdID8NCj4+PiBC
ZWNhdXNlIHRvIG1lIGl0IGxvb2tzIGxpa2UgYWxsIHRoZSBmdW5jdGlvbnMgdGhhdCBhcmUgdXNp
bmcNCj4+PiBkZXZpY2VfdHlwZV90Ymwgd2lsbCBqdXN0IHNraXAgb3ZlciB2aXJ0aW8gZGV2dHlw
ZS4NCj4+Pg0KPj4+IGRvbWNyZWF0ZV9hdHRhY2hfZGV2aWNlczoNCj4+PiAgICAgICBza2lwIHZp
cnRpbyBiZWNhdXNlICIuc2tpcF9hdHRhY2ggPSAxIg0KPj4+DQo+Pj4gbGlieGxfX25lZWRfeGVu
cHZfcWVtdToNCj4+PiAgICAgICBza2lwIHZpcnRpbyBiZWNhdXNlICJkbV9uZWVkZWQiIGlzIE5V
TEwNCj4+Pg0KPj4+IHJldHJpZXZlX2RvbWFpbl9jb25maWd1cmF0aW9uX2VuZDoNCj4+PiAgICAg
ICBza2lwIGJlY2F1c2UgImNvbXBhcmUiIGlzICJsaWJ4bF9kZXZpY2VfdmlydGlvX2NvbXBhcmUi
IHdoaWNoIGlzIE5VTEwNCj4+Pg0KPj4+IGxpYnhsX191cGRhdGVfZG9tYWluX2NvbmZpZ3VyYXRp
b246DQo+Pj4gICAgICAgc2tpcCBiZWNhdXNlICJ1cGRhdGVfY29uZmlnIiBpcyBOVUxMLg0KPj4+
DQo+Pj4gU28sIEkgdGhpbmsgdGhlIHBhdGNoIGlzIGZpbmUsIGFkZGluZyB2aXJ0aW8gdG8gdGhl
IGRldmljZV90eXBlX3RibA0KPj4+IGFycmF5IGlzIGdvb2QgZm9yIGNvbXBsZXRlbmVzcywgYnV0
IHRoZSBwYXRjaCBkZXNjcmlwdGlvbiBtYXkgYmUNCj4+PiBtaXNsZWFkaW5nLg0KPj4+DQo+Pj4g
RGlkIEkgbWlzcyBzb21ldGhpbmc/DQo+Pg0KPj4gTm8sIHlvdSBkaWRuJ3QuDQo+Pg0KPj4gSnVz
dCB0byBiZSBjbGVhciwgdGhlcmUgaXMgbm8gaXNzdWUgd2l0aGluICpjdXJyZW50KiB0aGUgY29k
ZSBiYXNlLCBJIGFtDQo+PiBleHBlcmltZW50aW5nIHdpdGggdXNpbmcgZGV2aWNlLW1vZGVsIGJp
dHMsIHNvIEkgaW1wbGVtZW50ZWQNCj4+IGxpYnhsX19kZXZpY2VfdmlydGlvX2RtX25lZWRlZCgp
IGxvY2FsbHkgYW5kIG5vdGljZWQgdGhhdCBpdCBkaWRuJ3QgZ2V0DQo+PiBjYWxsZWQgYXQgYWxs
LCB0aGUgcmVhc29uIHdhcyBpbiBhYnNlbmNlIG9mIGxpYnhsX192aXJ0aW9fZGV2dHlwZSBpbiB0
aGUNCj4+IHNhaWQgYXJyYXkuDQo+Pg0KPj4gRG8geW91IGFncmVlIHdpdGggdGhlIGZvbGxvd2lu
ZyBhZGRpdGlvbiB0byB0aGUgY29tbWl0IGRlc2NyaXB0aW9uPw0KPj4NCj4+ICJQbGVhc2Ugbm90
ZSwgdGhlcmUgaXMgbm8gaXNzdWUgd2l0aGluIGN1cnJlbnQgdGhlIGNvZGUgYmFzZSBhcyB2aXJ0
aW8NCj4+IGRldmljZXMgZG9uJ3QgdXNlIGNhbGxiYWNrcyB0aGF0IGRlcGVuZCBvbiBsaWJ4bF9f
dmlydGlvX2RldnR5cGUNCj4+IHByZXNlbmNlIGluIGRldmljZV90eXBlX3RibFtdLiBUaGUgaXNz
dWUgd2lsbCBhcHBlYXIgYXMgc29vbiBhcyB3ZSBzdGFydA0KPj4gdXNpbmcgdGhlc2UgY2FsbGJh
Y2tzIChmb3IgZXhhbXBsZSwgZG1fbmVlZGVkKS4iDQo+IA0KPiBZZXMsIHRoYXQgd291bGQgYmUg
ZmluZS4gV2l0aCB0aGF0IGFkZGl0aW9uOg0KPiBBY2tlZC1ieTogQW50aG9ueSBQRVJBUkQgPGFu
dGhvbnkucGVyYXJkQGNpdHJpeC5jb20+DQoNCg0KVGhhbmtzIGZvciB0aGUgY2xhcmlmaWNhdGlv
biBhbmQgQS1iLg0KDQo+IA0KPiBUaGFua3MsDQo+IA==

