Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8898C4B6FEE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 16:46:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273367.468533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK021-0007D3-Pz; Tue, 15 Feb 2022 15:46:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273367.468533; Tue, 15 Feb 2022 15:46:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nK021-00079A-Lk; Tue, 15 Feb 2022 15:46:21 +0000
Received: by outflank-mailman (input) for mailman id 273367;
 Tue, 15 Feb 2022 15:46:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nK020-00072q-6n
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 15:46:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a1b05ac-8e76-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 16:46:19 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FFX1rH012208;
 Tue, 15 Feb 2022 15:46:15 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2050.outbound.protection.outlook.com [104.47.12.50])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e8ewmg2dg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 15:46:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6307.eurprd03.prod.outlook.com (2603:10a6:20b:15b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 15:46:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 15:46:11 +0000
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
X-Inumbo-ID: 6a1b05ac-8e76-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H8fjpl0AdHJP0uH4w9QhZy2wHLnTiJU/wstWts54Vp/UdK3zcaRuHnSqK61S48wxMUwxlXjLZrZJkz34Y7er77v2D6eGFed5NSqb4pjJhEs1xcWio1bw+4uFPgo/C5jOpZSLhSdSCE5F3J7skgqjQHtWPwxqdswFNf24lC6BBF6AIhDHALA7zZNfpwjpJv5ty8ma3ulfsg1QU4EjlrYE4IvWiYfBqI0HBRFo1TTMgiBj25KXQ+4VoipMtENxFMXTm8SVfP8oQTIRdAEMuhxstxhqhG5jcMYijEJDrAibNQbgZOITMEYpTvZJUvcOpCDumEorJz3QpvlCnwMfH8yqsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KR/c4C5HT2qw5x0YQj8/gbUUTWmkgqFpBI44XSRY1gM=;
 b=AH8XcMqMBToZ7KhsW98346H2X8eXbtktTGfGqVsdq4ZHCZJRgKFi+mf1v5tH3IOJJxvWrh/+aFzUFBG8aRuWjIxQhNdZ51wMSXs7og/DMcXrWRHZpoNp9HkX0J3dnn+HFfAscPr88kkgYVdMJ00GqEEabQfURVtoAe0uQP9qiYisvf0oe2JOS79axtTkAicd0zZCz8w6OWRbHjCKGprs3SE33afMtKiqDT6iJM916W/xoRLfq2F9XMsVE8z7vIon+v1Vxfu6JYoksEe35z+xJqEBV9SLz2M7FCdMtJNcLgQQ6PqrzrlnQ+/U+oDPc/YEEiR6ojj1EvKrNoihrz1xuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KR/c4C5HT2qw5x0YQj8/gbUUTWmkgqFpBI44XSRY1gM=;
 b=CnB6Bl2YCGSxxpzDBFkDrqhC4Z23dnYgW9T7930e46GiejpwvSB/CPj42FFwTCEcmSheXKwb2BetNuJWzjBAlgFodZuICX4wC+p64koQWy+d08mDY2jNZaXBJGSK0bxHabN1316F8m6Bxh9A/islL9kIJ3D07QmMrtc5OQkNgcha63kMsazqQdHILqaQux6WvUWiESMPClqHXOPTDpGgwswqDtWnryrMwdLAk/dE4vreVBuZginoEon5SoK2sGZj2AGtbuwMWV01SMhgekChpYtwuYQQcisCE6gPbSIjkQuqefTaB/Aa9C5LasqacyxXzRk20e7urry5SRzlExuErg==
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
Subject: Re: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Topic: [PATCH v2] vpci: introduce per-domain lock to protect vpci
 structure
Thread-Index: 
 AQHYIkOs9pmsZb0l5kefj1m3qdTVCayUboeAgAAGwYCAAAeVgIAAAZQAgAABlwCAAAEVAIAADewAgAADdICAAC9JAA==
Date: Tue, 15 Feb 2022 15:46:11 +0000
Message-ID: <504327d2-0d82-7f88-e155-e6a45ba11a74@epam.com>
References: <20220215081135.1497470-1-andr2000@gmail.com>
 <YguE7RWOteSnvVNY@Air-de-Roger>
 <c5b9b02c-93f8-d018-6048-9abf2e7de4dc@epam.com>
 <YguQ8wfhfYFXTWSU@Air-de-Roger>
 <70dbd7fd-3f74-d0d3-6e30-c1e1e24fc279@epam.com>
 <0d8f01b2-b015-a08e-dd49-e9c688ff7245@suse.com>
 <bbb36ebc-de66-297d-f82f-abc0e63f20a2@epam.com>
 <22d25499-cab0-00c1-3ad3-bddd74c97a55@epam.com>
 <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
In-Reply-To: <772eb410-be1a-3b5f-3b51-e363c43bc3c6@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5f06fb27-84d4-401f-81a8-08d9f09a4a94
x-ms-traffictypediagnostic: AM0PR03MB6307:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB630742C7197C5E2D90CE878EE7349@AM0PR03MB6307.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 q1m1ItnwW+o7Vc2i18PfCU/Pfe02w1qum6rVdzFEcvjHl9PhHZew8N6o5NGY3nwyT5i+5OJPNQwo5ey2degug6LpObI/OuDGz/g/mMQpEm7dNJAn4VY2hRRqYS5i3p9tR5jKFqN5ZUtYuS5rW9vXUod6zhpAG7B3Ct8PTBB9TMTtBLt21lZ7KxmOMsm6XUgTN2CIguvt0zo36KK0swzzCCTkEPzbb9aXm1cAApbPgpUFd+BV1GvW2DB/X0tvJbbHy5fW9j0d/bhQZNjGRFX8x33BEvxoIPlMBPdkTU7Ob05rsVf4YTCnNOSuwoMd1ehmeVtHQbhZvLSwIkCz6oDDxd4XkHhPlL2oQRXxLQZ3KUyFuW7JuMYmo/udbkphXTb4kTIuGPees5dzQ29X9+3WTWlVhVjuPMwwgHFFZ59unRDJOFel2jGccjucqYzc/VntPmAPpKrNCElh1R8XFXcS2bCb6RxVpiogp0nrqlgOTU8MFy8IhDq9v7ks11VwsfoDFeCC8yzSxj8H5eh2paO2bcupAnRqb3PQIZZhZ95P3m17thNTGqJ5wk6dKJloTxoUsHUtPq4heqbRwSemAIsur+coPtvCZs/RxCzupy/pke/QdM+21bhrFxbRhJH5zH+VxHPFh5JazJ6zSPaeEvO5fd+S8mTkkpkSvrGuSd16ZY+GOyqIoUZ44iyzHJdd8LCZT9Dw7Xt2MnAgAVcdRIsvfXL7XqOB+63bTtF+LPvpMlnJFet5NADfGzeQMLGFMOGx
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(107886003)(5660300002)(83380400001)(8936002)(53546011)(6486002)(26005)(186003)(6506007)(38070700005)(508600001)(91956017)(8676002)(66476007)(122000001)(38100700002)(71200400001)(31696002)(2906002)(54906003)(316002)(31686004)(66946007)(86362001)(6916009)(64756008)(66446008)(4326008)(76116006)(6512007)(66556008)(36756003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dS9uVUtrUXVtbDBlRjg0eXNUQ0NmQlRhbmgrKzRtZzJMdkpERDg4RnJoaTRR?=
 =?utf-8?B?c2NSKy9xUnl3RUlLWXl1SytTbXVxZkl4Z1l5dGZQd05SNklZNGp2bVRrOS9i?=
 =?utf-8?B?R3czNElIWWpWOXdwOW9zMHlZYjEvUlpkSGI2RmZxd2pwWUx0ckg4eXhxZkFS?=
 =?utf-8?B?K0NEVUxaem9VbEZoR1ZIT1hwemhBWUJOd1pNQk5pTXlmdi9OYlczQmxqY1Bk?=
 =?utf-8?B?eHR1QW1uM3lnMDNONVYyUm55ZjlMZGl5b0JtZ0dDeHMwd2h4RXZ2WHEwOCtF?=
 =?utf-8?B?NUZYam16LzdadmNWcGdvaW11VVRWM09YUHpPU3BLa3hNenlLZFQxVW1vVEc0?=
 =?utf-8?B?RlR1SEpEL1o0a0t2R3MxV3pzQU9QVVJwa1diKy9hUWNzLzZXS3VnOEhkdFN2?=
 =?utf-8?B?elVSd3RXMVFNamsvVlFxYytKSlZveU13VHpnMVYrVTU3cy82S21hbGZaK1h6?=
 =?utf-8?B?WTRsUDRzTWlkQXlnZEN0Q1BlOXRUcDB5RHc0bHJHckxWZFE3L3FTMU1admc4?=
 =?utf-8?B?QkJFWmNmVGJHcFdxeEZvbVh4dXJOSXJJUVZ1QVQwOFhRTGMzanNqZjNmVU1U?=
 =?utf-8?B?Uzd6ZWYrNnJmbkJjZ3NoSlJ5Y1B6Y0NJQzd0cWlpNDFjY3hHenk5UVBTMklP?=
 =?utf-8?B?dVlwNnNic0JiWGNtbVVrQXhuQlM3UnRpbWR4WGFBSVJBb1M4V3NkQnBQTmgy?=
 =?utf-8?B?ODFvRkx6blprd3pyV3R2V3pGNlBkM1VCOWwrZGVtd01pRXlWdFRsSzVjbmxm?=
 =?utf-8?B?akRkTmI0dGUya2FZTHN6KzF4cUYvNHlMR2VSdGNHa3FEUThNVXRmZHhZMDBW?=
 =?utf-8?B?TC8vQlJucGZtckFleUhDclJhQXQ5TExnb2FleThxekJreEYrclZQRFc4UDVV?=
 =?utf-8?B?Zm54SGVBa21ja3BwbEJYZzhWUGpIUVgzNVU3ZUk0MDI3OXV2OGltai91SnN3?=
 =?utf-8?B?b0YxWG45NXVWbEtCd2JyS3JjVHJpWllmNEU4WDk3YytmQTVCYVBaN3pRTEFM?=
 =?utf-8?B?bGRlVWkxLzVjR2RidnpueWZrTjk2dzVqVTFjdXFSRkxna21oekpLd2szZjZM?=
 =?utf-8?B?bmRjVmdCTjV5d1RmR3N4cUx3N1BNSmMwVWFCRVRJM1hkQS9oM2pWaDdDVjkz?=
 =?utf-8?B?MkQycWhsaDVSRS9ySEIycmE5TkRwQklYZTU4cEhnV1Y3aHlKZHpuMm5Ya3JI?=
 =?utf-8?B?MEc3bm9sQ1NhR2p0SzhYR3ZqNmUrVTVud3gvdTVEMkVzTG5tWTM4RGNiMmJl?=
 =?utf-8?B?REQ1MXBEMER2RXVUVndKMG10WFZ1OVFKQXN0RVFnckhpRzlYRHNRV0llc0th?=
 =?utf-8?B?ZklxUzRwWXBrbmpQMmgvQy9CcWJhNEladUloZ2Y4Yk5yQUMwVXVienR0dUxK?=
 =?utf-8?B?am5MVjNtWHQySDFTeFRpRlBTdnlkY0c1VzdBNE1YMlplYitHZktoMnA5OXNJ?=
 =?utf-8?B?WEZKNHkrTDhaNlY5aWFqNXpYSWwrbjFNV09lU1pScmNoYkV6YURKOU4wZ2NL?=
 =?utf-8?B?Wml2RDZwcy9zWXZiNUJBaTVQTThyNjhiYWJGUVEybzh4NXYwNWZ3SWtOdXU4?=
 =?utf-8?B?U25kVFZSRXZVZnUrSEM1VFBQb1V0TC9EbFVVRXViOUM3N2tKb050ektNL0o2?=
 =?utf-8?B?NDZFcFZoWVJ5RWRGTjdkQlRQaWlnNWZaWmFySjVTcWcwSDlwdDJtenBxSmNM?=
 =?utf-8?B?azRaZDVVNGQzV0Z5OW9Uamk3VEVtcWxDamkrbWJLWlhwUUdna0FkUnBIblEr?=
 =?utf-8?B?MjljTG1pNnJSQ2orRExBQ3pCeS9semJ5Uks0UGVRbzZ5OEZRQzl2NnpjQitj?=
 =?utf-8?B?aGxWcHZuRG45ZENrVXc1L0wzUHo4cE1ZUGNWcDNEU1pVQmpQNVB4ZnRMd2pm?=
 =?utf-8?B?dlkwckYzNXhpRDE5YnM5cjlyYVlBWi8vTUFxVllqYlFsQzVCSXF1TnBSb0xz?=
 =?utf-8?B?ZGQ5UEpXODhwN1h3enVKZGRsR3NmdjM5R3piUEhkYTV2bXZxSVk2QmhwNmQx?=
 =?utf-8?B?VmFkNUxMS0YzeUdvOUt5bEF2M3hqbFlYaGdYdjdJSFlQQ0MvZVQxQ2Z4VkhB?=
 =?utf-8?B?M1JuTFhGSnN4YklSSlkzbkdXa24rUnBtVkJ2L1E3M05zYXN5MHdvQzZEOTZM?=
 =?utf-8?B?UVVKT3FHK2xRWHBFVDdIMVFvRGVFZFlCQTExQ1ZxdlVxQ0ZTQUtiVG5idzJQ?=
 =?utf-8?B?VmJHWnF0YlN5MW5ZMHJ1SnE4alZKT1FFTm1yTzNuN0x5TVRqWHc3ejJpYVZn?=
 =?utf-8?B?TmRNUXkxWVlhekZJYmNtQ0kvT2FET3QvQlFhYXRoVzdpektsdXZleWsyV2tS?=
 =?utf-8?B?c2NZd0htVGJURFJSSFdTbjdkL3NKZUlGcFA2eU9KWlBaMnkvZVJKQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <14FBCFF1403D0C4A96329BFB50B5B30C@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f06fb27-84d4-401f-81a8-08d9f09a4a94
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 15:46:11.5575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYp43IuWUJ4tgWxK2YHcQBHOprRoJGFAryYHBhASckczxSt1NX5Ok0YPjQBKFh1wo6Iw3dFW9+kt5nyXyoolswy+aRSWFvRfFy5gCFszX0PHbuXdmvb5wHxqVSaESwya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6307
X-Proofpoint-GUID: eTuLysNqJyrYnl4bHs9khPlWEZJlgn3A
X-Proofpoint-ORIG-GUID: eTuLysNqJyrYnl4bHs9khPlWEZJlgn3A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202150092

DQoNCk9uIDE1LjAyLjIyIDE0OjU2LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMTUuMDIuMjAy
MiAxMzo0NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxNS4wMi4yMiAx
Mzo1NCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4gT24gMTUuMDIuMjIgMTM6
NTAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAxNS4wMi4yMDIyIDEyOjQ1LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+IEknbSBvbiB5b3VyIHNpZGUsIEkganVzdCB3
YW50IHRvIGhlYXIgdGhhdCB3ZSBhbGwgYWdyZWUgcGNpZGV2cw0KPj4+Pj4gbmVlZHMgdG8gYmUg
Y29udmVydGVkIGludG8gcndsb2NrIGFjY29yZGluZyB3aXRoIHRoZSBwbGFuIHlvdQ0KPj4+Pj4g
c3VnZ2VzdGVkIGFuZCBhdCBsZWFzdCBub3cgaXQgc2VlbXMgdG8gYmUgYW4gYWNjZXB0YWJsZSBz
b2x1dGlvbi4NCj4+Pj4gSSdkIGxpa2UgdG8gZXhwcmVzcyB3b3JyaWVzIHRob3VnaCBhYm91dCB0
aGUgY29udmVyc2lvbiBvZiB0aGlzDQo+Pj4+IHJlY3Vyc2l2ZSBsb2NrIGludG8gYW4gci93IG9u
ZS4NCj4+PiBDb3VsZCB5b3UgcGxlYXNlIGVsYWJvcmF0ZSBtb3JlIG9uIHRoaXM/DQo+PiBXaGF0
IGlmIHdlIGp1c3QgZG8gdGhlIGZvbGxvd2luZzoNCj4+DQo+PiBzdGF0aWMgc3BpbmxvY2tfdCBf
cGNpZGV2c19sb2NrID0gU1BJTl9MT0NLX1VOTE9DS0VEOw0KPj4gc3RhdGljIHJ3bG9ja190IERF
RklORV9SV0xPQ0soX3BjaWRldnNfcndsb2NrKTsNCj4+DQo+PiB2b2lkIHBjaWRldnNfbG9jayh2
b2lkKQ0KPj4gew0KPj4gICDCoMKgwqAgcmVhZF9sb2NrKCZfcGNpZGV2c19yd2xvY2spOw0KPj4g
ICDCoMKgwqAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmX3BjaWRldnNfbG9jayk7DQo+PiB9DQo+Pg0K
Pj4gdm9pZCBwY2lkZXZzX3VubG9jayh2b2lkKQ0KPj4gew0KPj4gICDCoMKgwqAgc3Bpbl91bmxv
Y2tfcmVjdXJzaXZlKCZfcGNpZGV2c19sb2NrKTsNCj4+ICAgwqDCoMKgIHJlYWRfdW5sb2NrKCZf
cGNpZGV2c19yd2xvY2spOw0KPj4gfQ0KPj4NCj4+IHZvaWQgcGNpZGV2c19yZWFkX2xvY2sodm9p
ZCkNCj4+IHsNCj4+ICAgwqDCoMKgIHJlYWRfbG9jaygmX3BjaWRldnNfcndsb2NrKTsNCj4+IH0N
Cj4+DQo+PiB2b2lkIHBjaWRldnNfcmVhZF91bmxvY2sodm9pZCkNCj4+IHsNCj4+ICAgwqDCoMKg
IHJlYWRfdW5sb2NrKCZfcGNpZGV2c19yd2xvY2spOw0KPj4gfQ0KPj4NCj4+IHZvaWQgcGNpZGV2
c193cml0ZV9sb2NrKHZvaWQpDQo+PiB7DQo+PiAgIMKgwqDCoCB3cml0ZV9sb2NrKCZfcGNpZGV2
c19yd2xvY2spOw0KPj4gfQ0KPj4NCj4+IHZvaWQgcGNpZGV2c193cml0ZV91bmxvY2sodm9pZCkN
Cj4+IHsNCj4+ICAgwqDCoMKgIHdyaXRlX3VubG9jaygmX3BjaWRldnNfcndsb2NrKTsNCj4+IH0N
Cj4gSG1tLCB0aGlzIGlzIGFuIGludGVyZXN0aW5nIGlkZWEuIEV4Y2VwdCB0aGF0IEknbSBub3Qg
c3VyZSBpbiBob3cNCj4gZmFyIGl0J2xsIGJlIHN1aXRhYmxlOiByZWFkX2xvY2soKSB3b24ndCBs
b2NrIG91dCB1c2VycyBvZiBqdXN0DQo+IGxvY2soKSwgc28gdGhlIHNvbHV0aW9uIGxvb2tzIHRh
aWxvcmVkIHRvIHlvdXIgdlBDSSB1c2UgY2FzZS4gWWV0DQo+IG9idmlvdXNseSAoSSB0aGluaykg
cmVhZF9sb2NrKCkgd291bGQgd2FudCB0byBiZWNvbWUgdXNhYmxlIGZvcg0KPiBlLmcuIHNpbXBs
ZSBsaXN0IHRyYXZlcnNhbCBhcyB3ZWxsLCBkb3duIHRoZSByb2FkLg0KDQoxLiBBc3N1bXB0aW9u
OiBfcGNpZGV2c19yd2xvY2sgaXMgdXNlZCB0byBwcm90ZWN0IHBkZXYNCnN0cnVjdHVyZSBpdHNl
bGYsIHNvIGFmdGVyIGNhbGxpbmcgcGNpZGV2c19sb2NrKCksIHBjaWRldnNfcmVhZF9sb2NrKCkN
CmFuZCBwY2lkZXZzX3dyaXRlX2xvY2soKSB3ZSBuZWVkIHRvIGNoZWNrIGlmIHBkZXYgIT0gTlVM
TA0KYXQgYWxsIHNpdGVzDQoNCjIuIF9wY2lkZXZzX3J3bG9jayBpcyBub3QgbWVhbnQgdG8gcHJv
dGVjdCB0aGUgY29udGVudHMgb2YgcGRldjoNCi0gZm9yIHRoYXQgX3BjaWRldnNfbG9jayBpcyB1
c2VkDQotIF9wY2lkZXZzX2xvY2sgZG9lc24ndCBwcm90ZWN0IHBkZXYtPnZwY2k6IGZvciB0aGF0
DQogwqAgcGRldi0+dnBjaS0+bG9jayBpcyB1c2VkLg0KDQozLiBDdXJyZW50IGNvZGUgd2lsbCBj
b250aW51ZSB1c2luZyBwY2lkZXZzX2xvY2soKSBhcyBpdCBpcyBub3cuDQpXaXRoIHRoZSBleGNl
cHRpb24gb2YgdGhlIHdyaXRlcnM6IHBjaV97YWRkfHJlbW92ZX1fZGV2aWNlLg0KVGhlc2Ugd2ls
bCB1c2UgcGNpZGV2c193cml0ZV9sb2NrKCkgaW5zdGVhZC4NCg0KNC4gdlBDSSBjb2RlLCBzdWNo
IGFzIHZwY2lfe3JlYWR8d3JpdGV9IHdpbGwgdXNlDQpwY2lkZXZzX3tyZWFkfHdyaXRlfV9sb2Nr
ICh3cml0ZSBtb2RlIGZvciBtb2RpZnlfYmFycykNCmFuZCBwZGV2LT52cGNpLT5sb2NrIHRvIHBy
b3RlY3QgYW5kL29yIG1vZGlmeSBwZGV2LT52cGNpLg0KVGhpcyBzaG91bGQgYmUgc2FmZSBiZWNh
dXNlIHVuZGVyIHRoZSByd2xvY2sgd2UgYXJlDQpndWFyYW50ZWVkIHRoYXQgcGRldiBleGlzdHMg
YW5kIG5vIG90aGVyIGNvZGUsIGJ1dCB2UENJIGNhbg0KcmVtb3ZlIHBkZXYtPnZwY2kuDQoNCmZv
cl9lYWNoX3BkZXYgYW5kIHBjaV9nZXRfcGRldl9ieV9kb21haW4sIHdoZW4gdXNlZCBieSB2UENJ
LA0Kd2UgdXNlIHBjaWRldnNfcmVhZF9sb2NrIGV4cGVjdGluZyB3ZSBvbmx5IG5lZWQgdG8gYWNj
ZXNzDQpwZGV2LT52cGNpLiBJZiB0aGlzIGlzIG5vdCB0aGUgY2FzZSBhbmQgd2UgbmVlZCB0byBt
b2RpZnkNCmNvbnRlbnRzIG9mIHBkZXYgd2UgbmVlZCB0byBhY3F1aXJlDQogwqDCoMKgIHNwaW5f
bG9ja19yZWN1cnNpdmUoJl9wY2lkZXZzX2xvY2spOw0Kd2l0aCBhIG5ldyBoZWxwZXIgNSkNCg0K
NS4gQSBuZXcgaGVscGVyIGlzIG5lZWRlZCB0byBhY3F1aXJlIHNwaW5fbG9ja19yZWN1cnNpdmUo
Jl9wY2lkZXZzX2xvY2spOw0KVGhpcyB3aWxsIGJlIHVzZWQgYnkgYXQgbGVhc3QgdlBDSSBjb2Rl
IGlmIGl0IG5lZWRzIG1vZGlmeWluZw0Kc29tZXRoaW5nIGluIHBkZXYgb3RoZXIgdGhhbiBwZGV2
LT52cGNpLiBJbiB0aGF0IGNhc2UNCndlICJ1cGdyYWRlIiBwY2lkZXZzX3JlYWRfbG9jaygpIHRv
IHBjaWRldnNfbG9jaygpDQoNClF1ZXN0aW9uOiBjYW4gYW55b25lIHBsZWFzZSBleHBsYWluIHdo
eSBwY2lkZXZzIGlzIGEgcmVjdXJzaXZlIGxvY2s/DQoNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3Ug
YW5kIGhvcGUgdG8gaGVhciB5b3VyIHRob3VnaHQgb24gdGhlIGFib3ZlLA0KT2xla3NhbmRy

