Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2514A403C92
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182249.329737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzbt-0007Pk-LS; Wed, 08 Sep 2021 15:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182249.329737; Wed, 08 Sep 2021 15:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNzbt-0007Nb-H6; Wed, 08 Sep 2021 15:35:37 +0000
Received: by outflank-mailman (input) for mailman id 182249;
 Wed, 08 Sep 2021 15:35:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0iEI=N6=epam.com=prvs=98850bb71f=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mNzbs-0007NV-JV
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:35:36 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 690beb28-10ba-11ec-b168-12813bfff9fa;
 Wed, 08 Sep 2021 15:35:35 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 188FSiPQ004668; 
 Wed, 8 Sep 2021 15:35:32 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2108.outbound.protection.outlook.com [104.47.18.108])
 by mx0b-0039f301.pphosted.com with ESMTP id 3axyusr0wg-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Sep 2021 15:35:32 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3716.eurprd03.prod.outlook.com (2603:10a6:208:4a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 15:35:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4500.015; Wed, 8 Sep 2021
 15:35:29 +0000
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
X-Inumbo-ID: 690beb28-10ba-11ec-b168-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJOKCfFNsfO6eyg8HXQr2MEpj6QsQu3kY8a3pNpivqMBixsFS4WmKzSY54+faDCJkEHJJ2UtuNgkGhDVof0BycXil8ti7zj4+anLImbaQ6EZ7d8IHIQj8tJEcNd1R1oN54MKH7G+d3QbfCLHnZyE3ZBBxm3Uo2oeZN+khcXofoIUQejGy1NVZp2uEccPzLuzoLGndYS/VnxeNXYKg57bfF/kgyxlqGSuJLhjRirY9AwghdUF4xl3LZVdE0hUfo91kDDzIEiNtkPJnKo2tDP/Fp14ohL1zAa0n++qI081aFDC01sAWcdGZvMBaQVFkatW4E39m1i6mK0UKuqxweY37w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=6pkHIxDai02+KJhR4h/In0HYY9J2Svl375q3OsrMWnc=;
 b=Zap9DTGZnzafuJ2yOJ+MTdLUVY1O9Q/Eecp6RXDQ37u/VfAZDrEtvLSTc/cs/TmR3w1bE3eYq6U9vMuzE1Tw5NrdCzBohHJcCMunNloc8Z5rxciZW3QAotJI8SfT5oeFcecQq/+ICrsANo4ayG4e4kwRp8oCKbzV9H7kFk27r8P3eX+yGoU4oZS81b+9jLjwyLI22o5VVrTVZmPbyJRRggZELBnebouU0IdedGXmwgUU75k/hTxc7XK6IPezbSE4APo9V44R080aC3+8wR11OGaR7+wFCWxL/6ZCyfJGTVHLhtwTDKTvmBQUWjBSRLTGmofSNwanP6fzcwOOMUdq2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6pkHIxDai02+KJhR4h/In0HYY9J2Svl375q3OsrMWnc=;
 b=xiFcLDqSMXMzQ+Y8mxnHRZBH5NdwbZtsvyvCV3cQbetHbbqBe9MCoNPEOdRCcw3KpIEm2IiJaLs+kNiOWL+ZwDD91ECWMqTa1mR/Gv8oLCrmolOYLPZJP4TZB00tTqvkHdqbaVTcXcRyeVhdAVJY4HEZDbA2ktNZcWb0qls78Mh+q7BuXBaxDe0eMZcDggGFOsdPIRJhVcY6ZlV+tlRBimiOV50UPvWqyNXRf5Ihe5DVyO0I0+7QvP8juFhk7tHuvI89oJG4KECvhQH1UfSlWqKlSYmvhG8biCMpS2TEs9NasfFqTjo71ov0aNzsFHiElBMFemYfbse1vZyzovr9qw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Topic: [PATCH 5/9] vpci/header: Implement guest BAR register handlers
Thread-Index: 
 AQHXoKxmxnIdZosa7ESbvTmPlG6KHauXFn+AgAGCLICAADFtgIAAE0qAgAEIooCAAAS6AIAABV4AgAA6yACAABRDgIAACAOAgAAEOQCAAAGQAA==
Date: Wed, 8 Sep 2021 15:35:29 +0000
Message-ID: <d6979910-271a-a37a-886c-9fb90223a1e9@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-6-andr2000@gmail.com>
 <1848521d-4179-f5ee-e3af-f4e6738f60e6@suse.com>
 <eda075b5-eafd-2367-2f1e-7f6b9730beb0@epam.com>
 <2e0c2ff5-7228-a439-c8a6-50f7a022e77b@suse.com>
 <24624eca-766d-6841-dc90-43371f5a39ba@epam.com>
 <983f79a9-d72d-0704-9b04-950f858fbd7e@suse.com>
 <be31cb44-fda1-0413-dae9-412affd6e3f7@epam.com>
 <80de7569-522d-656a-e9e2-9e741511963d@suse.com>
 <dafd3135-ca9f-cd4e-c966-eb51c2a6e9e4@epam.com>
 <2fd6b81e-e5fc-f6d8-b24f-9fbb1db034d7@suse.com>
 <d5ef78d1-253e-26cb-8d24-667d1ce7a671@epam.com>
 <47173d64-781f-ae37-5eee-f483fd74e828@suse.com>
In-Reply-To: <47173d64-781f-ae37-5eee-f483fd74e828@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a40f487-d9a4-4703-fbe0-08d972de4a01
x-ms-traffictypediagnostic: AM0PR03MB3716:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3716DEBBAC433E8B4DC6980EE7D49@AM0PR03MB3716.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kGeHLzZUjQxDcIXDCoBLk5AJWH2EHcqZoO26ZaU6Te2JzR8ZTeHCb6N8jllo9Rix2BCBCo4kHcrKjh0ZqjTTXeqP+Z34pdK4aZu6zu/M67mK6EOW9UMURrFANEujnihQf4UutyYQyU35V+YV5f+giFRgqJIvdJvJb+hosmn3TuPTY5pf/Fecomfie5rbEHnLGWHE8SOFDhcUzsW469VIbHkVnesdBrZtqjxTQy1NjL57Els8mQmyj3c9MnjwI9WgPIIx3m12Run5J2vglRHq2apNQeMbGA2zme338JvJk+0+WWHBFlDzK2husRAcrkjBD/640gYeHGBYH/375CtZGBqU3BjBR9ugOGLAaL+PyJzgiiH3jgicxkWAV7pcEaUmKFNsgS7htJV/JHBwVGPERRtI8HXL0lj1R5Cq04f+RSukLnsk1x2uQ6DcWlWXYy9Q+PAcTp9WTXHwncpQqfk3mZSU4q7fPDB4qdoAkj72oIbq0HFlHT0PwtUh8cu2PJa3+iUHt1K0Z7Q5HEfUhEehTYF+i34Xany42mloqJugOgpiJO+wdYJ9ZN+8Fq0YVkSjnKiNk7r01+7W87OObW49nP6HRTovouSYzVtimhDmDY98FuDrmi3PA1Lhs0ZH1KZ6FWOOBeec18r2koLhhMu38SGwEhLoUb85sN+YR5AYOCpegYmb0g3ZL7zan0vYwZBCJSWYlDHgm+xjvDLYPrUQLh8gpN8BZWEHL4dFHueejvzyWhYFrs9q2FA2zSrtQvSi
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(38070700005)(86362001)(71200400001)(2906002)(6486002)(31696002)(5660300002)(8676002)(478600001)(66476007)(66556008)(64756008)(6512007)(76116006)(66946007)(66446008)(26005)(186003)(122000001)(53546011)(6506007)(8936002)(31686004)(54906003)(316002)(2616005)(36756003)(110136005)(4326008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N3ZZK1JHelZoemZkZWNnZWVVbitaSWJEdmFMUGo0SDU0Z1hWVlVhYlpqTUlM?=
 =?utf-8?B?Q2ZNdUViUGZZU0hlNCtYS2l3U2hIY2U3Q1laYzc4VDZTMHVDWEMzR1MyZ1JH?=
 =?utf-8?B?N2dBOHphNXlVMUNPQzJqT0hIUnJqWlZ5TjNUTnROYjBySkRqQUhTWXE5cGRk?=
 =?utf-8?B?dllUM09GdDROakNBKzZibXRqdHQ0cXNkWCs1YmFyK2c3c2lQczRWSk41SXcw?=
 =?utf-8?B?bG5Vc1dtaFRpcUlMZTNTOU45MW84cmpYL1J2dGFHaHZwdFB2WlEzenlEeExT?=
 =?utf-8?B?UWRwN2JabVJPZWsxM2xvSXpsckZpZzZxQTlFdCtSSkRyS24reXoxbkg2ZHdV?=
 =?utf-8?B?eU9SaE5Zbk5zNFZxOC81cDQxYmoxMUJKU1BhRW9BaDFuMHI4dVJ4UldvM3BS?=
 =?utf-8?B?bDZwMEpnOTNDQ21uUzdYMVJlUzhxb1AwZzNsVlVOMGpTT1RxbzREbGk5OU9L?=
 =?utf-8?B?WFhLWkw3cUorUkNsRW92enA3akdKa3JzMFQxcEMydFFyd2UxWGJRME1xVnNr?=
 =?utf-8?B?cE1SVDJVOGo1WU56VVpxbHJON09ySks2RjU5bXZBNkI4Q2xkTmcwNHNFaVFS?=
 =?utf-8?B?VjI3bVI3SERuLzFxN0hhdkRwamQrWkd3VnI0NVBLK3AxZjR1TTY0WmxlbG5k?=
 =?utf-8?B?eUpydlZFcktNYS9uOVpXRGlOc0U3WmVsK2lCRWhTNUxCaHFESXRTMDNFSm81?=
 =?utf-8?B?NWExQ1AvVmZ4T3h4d2w2MXI5Zm5FSDMzbTlhVG82aUdLdGFQaVpnQ3pvdHZR?=
 =?utf-8?B?U0dNNEEzUFJtMWZrME9TWEdteFpReGRIODZRWWg4RkUzdzZHdHppTGFESkFU?=
 =?utf-8?B?R2NVTHJWRmRLcGJ0bHA3a3V3c2UrSUtHMmlYQmFpSERHQTlRa3FSYzhVUi9V?=
 =?utf-8?B?dGllaDJpNzFxQ0Q3L2NMQmtVWDR1QXdiTWVmZUNYbmRldW4zYzBuN0VHUUE4?=
 =?utf-8?B?QVhRK0pFTGxVeWhaQTZFczdPN2pSdmdiSWJORW81NXc4SGxqVDVqS2FPS3Br?=
 =?utf-8?B?eTdpWmYrb2lVT2RSMWlyK1ZxYzB0VmpTaGlkTzlUbWtzRld3MGlJeDVOaTJk?=
 =?utf-8?B?cVU4bERYODVFc013QkxvWjFFTWJYMU95NnhGZFRxOCtTSlM3VTY2di8zb0Y1?=
 =?utf-8?B?dHFWb3R6WENjdVhoSWF1R1NuTmpSYkNmVndGVm5SUHpYMXBaclc0UFUwOWZL?=
 =?utf-8?B?TU9BTkFXQms2OG5NOGNleklKMlA5ZlRXd1lkRFJmVWNCMndaWjF4QWVSK3gv?=
 =?utf-8?B?RThjNFlHWHlTQUxYQmtqZ21ISTdWbjkxZzN3a3d1emZSS2ZORWxqY1g5QXVZ?=
 =?utf-8?B?U3pVSjh0K0wrZDJCeTlWV3pqNmlyaStVbkRZcVhkY2RYdTZib2FuNjArL1or?=
 =?utf-8?B?V2JtSGxnWC85MHZTMlAwYmhtRjQ0eVA4dkJPVXJNYWxSbStrdHJDUGR6UndB?=
 =?utf-8?B?c2xLRU1TYkkvcWg5V3pDR0F5SmUrYUZYcFNSZVl3eDBDczJaUW1uOTdhNVIv?=
 =?utf-8?B?aU96ZjBuQk5YSVphaXUvVU45MFlNMlJiMlpTVEFGb01KOEZqYUhRVXk1Y0t6?=
 =?utf-8?B?eUpzbzlrWVpvREQ2M1FNNEhLbWZDc0VYaGhiZmJ1bXBUT01xL29nNkpDUUtn?=
 =?utf-8?B?MjdOSGZ3cXZqUzR5QkEzVTJGckwzSUZxckZ2Rmc4em9JV0tISFY3dXpVV2hK?=
 =?utf-8?B?dXNuM3A1M3hiVHF5L2w0UTgxVlVWS3BNbUx6UFFsTUVGNDR1ZmtSeWRtRzI2?=
 =?utf-8?Q?hDDj5Cg227hz/xmD55Kx/ZzvcMyW0boOtywp53h?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <49696A9F0476AE479B033744B7C1B174@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a40f487-d9a4-4703-fbe0-08d972de4a01
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2021 15:35:29.9197
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a3atHkNmq8fArDerBUB+qPgrEUNrsoxkuI6HhPeW1FdeLIaoGQ1jvJz3xWbb7OkTer6c9IPfiooB0OSvwO12jBK6UOtDqhZDMUExEoYARZ12+ydKugQ2tp98cxqkyM2m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3716
X-Proofpoint-GUID: syrIWgGfckKHZFzvPBYhXTIyEgoCQ7AO
X-Proofpoint-ORIG-GUID: syrIWgGfckKHZFzvPBYhXTIyEgoCQ7AO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_06,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxlogscore=884 mlxscore=0 spamscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109080097

DQpPbiAwOC4wOS4yMSAxODoyOSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA4LjA5LjIwMjEg
MTc6MTQsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDguMDkuMjEgMTc6
NDYsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjA5LjIwMjEgMTU6MzMsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBzdGF0aWMgdm9pZCBndWVzdF9iYXJfd3JpdGUo
Y29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVuc2lnbmVkIGludCByZWcsDQo+Pj4+ICAgIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50
MzJfdCB2YWwsIHZvaWQgKmRhdGEpDQo+Pj4+IHsNCj4+Pj4gICAgwqDCoMKgIHN0cnVjdCB2cGNp
X2JhciAqYmFyID0gZGF0YTsNCj4+Pj4gICAgwqDCoMKgIGJvb2wgaGkgPSBmYWxzZTsNCj4+Pj4N
Cj4+Pj4gICAgwqDCoMKgIGlmICggYmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTY0X0hJICkNCj4+
Pj4gICAgwqDCoMKgIHsNCj4+Pj4gICAgwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHJlZyA+IFBDSV9C
QVNFX0FERFJFU1NfMCk7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIGJhci0tOw0KPj4+PiAgICDC
oMKgwqDCoMKgwqDCoCBoaSA9IHRydWU7DQo+Pj4+ICAgIMKgwqDCoCB9DQo+Pj4+ICAgIMKgwqDC
oCBlbHNlDQo+Pj4+ICAgIMKgwqDCoCB7DQo+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgIHZhbCAmPSBQ
Q0lfQkFTRV9BRERSRVNTX01FTV9NQVNLOw0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCB2YWwgfD0g
YmFyLT50eXBlID09IFZQQ0lfQkFSX01FTTMyID8gUENJX0JBU0VfQUREUkVTU19NRU1fVFlQRV8z
Mg0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgOiBQQ0lfQkFTRV9BRERSRVNT
X01FTV9UWVBFXzY0Ow0KPj4+PiAgICDCoMKgwqDCoMKgwqDCoCB2YWwgfD0gYmFyLT5wcmVmZXRj
aGFibGUgPyBQQ0lfQkFTRV9BRERSRVNTX01FTV9QUkVGRVRDSCA6IDA7DQo+Pj4+ICAgIMKgwqDC
oCB9DQo+Pj4+DQo+Pj4+ICAgIMKgwqDCoCBiYXItPmd1ZXN0X2FkZHIgJj0gfigweGZmZmZmZmZm
dWxsIDw8IChoaSA/IDMyIDogMCkpOw0KPj4gRG8geW91IHRoaW5rIHRoaXMgbmVlZHMgdG8gYmUg
MHhmZmZmZmZmZnVsLCBub3QgMHhmZmZmZmZmZnVsbD8NCj4+DQo+PiBlLmcuIHMvdWxsL3VsDQo+
IElmIGd1ZXN0X2FkZHIgaXMgdWludDY0X3QgdGhlbiB1bGwgd291bGQgc2VlbSBtb3JlIGNvcnJl
Y3QgdG8gbWUsDQo+IGVzcGVjaWFsbHkgd2hlbiBjb25zaWRlcmluZyAoaHlwb3RoZXRpY2FsPykg
MzItYml0IGFyY2hpdGVjdHVyZXMNCj4gcG90ZW50aWFsbHkgd2FudGluZyB0byB1c2UgdGhpcyBj
b2RlLg0KT2ssIHRoZW4gSSdsbCBrZWVwIHVsbA0KPg0KPiBKYW4NCj4NClRoYW5rIHlvdSwNCg0K
T2xla3NhbmRyDQo=

