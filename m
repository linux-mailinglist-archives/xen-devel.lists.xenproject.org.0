Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C91406AF2
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 13:44:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184308.332905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOewf-000511-HU; Fri, 10 Sep 2021 11:43:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184308.332905; Fri, 10 Sep 2021 11:43:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOewf-0004yL-Dw; Fri, 10 Sep 2021 11:43:49 +0000
Received: by outflank-mailman (input) for mailman id 184308;
 Fri, 10 Sep 2021 11:43:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOewd-0004yF-Ha
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 11:43:47 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b362b62-122c-11ec-b229-12813bfff9fa;
 Fri, 10 Sep 2021 11:43:46 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18ABeUUg019229;
 Fri, 10 Sep 2021 11:43:41 GMT
Received: from eur01-he1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2054.outbound.protection.outlook.com [104.47.0.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b06pjr0bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 11:43:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6243.eurprd03.prod.outlook.com (2603:10a6:20b:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 10 Sep
 2021 11:43:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 11:43:37 +0000
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
X-Inumbo-ID: 5b362b62-122c-11ec-b229-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e7LpKeCkkjAoXD151bYGd4dasO0GC2hFpu664c6E0p2wtgxfZ4s/5bRVZTYbBN1Ez5uBrQsLWkNs2R2vtRc566jN+duPagSXzviqnx9VwQpZZWKKsmZmvQjACcphu+KHr+xHvngUFW7av4+BH6aXDmZv6mrN22wLvNhkQftkB5EShsdYPxCY8sFrBg3ZGxuSyIT7o/02FTsoEWcApiaEi5ZXebM3+LaDkNrcKJBJym1O+qkoaASsbgXUIRhYUEGxzkVYPpsH2+3+lmPIQCaAEaFPbwRSOxCNAv3E32Lsfx0e/i5k7xHieIvwEVmk44O2I2GMmPuRP3677+gptDFYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=fifWRo+JYpV13ABChztcP0esT8DdC3/q1irASM9cEDQ=;
 b=drLxdoMmoTxzYy5Ml5sHeMtadxGVI3nfMsWY1IIQh7IasR20c7SR375aL2MVz91LU93wDXdp2BEbBlDzqt9rxY6OLzvtreuWSNoarSyu1g50K1QVwYEgcxpk8yTenNnMX1ms9CGmDpWyGWCHSLwTUALw2acDmrX6xDnaxWC9TZ1TYzkLtd185YK5gMYP21tnwMLhTq3ZHOXyCQxwvw0iIu6//VXfc/7XLEMYQUMg2m3EKMOcHgVpq89I0tA50F3X4FwHK3UriXruCu8Z2dOqFvqGHOZhE2jYNElDcrGAbzycKHujfYZqpbiuowNZSzNnXpv5foDN2H/mNA5T3SwIdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fifWRo+JYpV13ABChztcP0esT8DdC3/q1irASM9cEDQ=;
 b=CDjGCFxCwJ5/yMm1+WxXzJ2Gf7UDUSg8qRd5Z5RK9aFhTh9RO6JTCvnOz3tQlZomAzx6Es4OBmtThKiGm9N2hFVNrCNxh/zqJq1jZ8K2jkDYvqtDEb+mt4GHulTJBejGUORSXuZhjdzOUkPhVewQ8XP9cTfZsXI4OXJnlJ7iYiagXjreaPcPHjfmuVJisX477LsXECEsyMgryzrzxm/niWY4KsFqVRP9xLPg0j4aMk8QN7doKTIEhJQ1Tc8Wdz2qVG5R+nXfeJdc/Tpgb3fBw0oVfORGiGJptfpc0A7UTqjCTRHJFrZlTCcTc7LKolenh6Ww8fIbXc3lhpdaLU35/w==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4AA=
Date: Fri, 10 Sep 2021 11:43:36 +0000
Message-ID: <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
In-Reply-To: <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9594fe9d-b503-493b-a26a-08d974503a27
x-ms-traffictypediagnostic: AM0PR03MB6243:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB624364292FA38F4EED29A13DE7D69@AM0PR03MB6243.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GpD66M+wr5H+GQbGY00Jg2ZB/87O3nmi6w7uXIyx5loc7+96CokMXBvfGY/x4S6CrqrtMt4PLQuJKfLjuYckQ00knnEcW7g4Mn2lsiNMbEauQCSKVNZRbfH1HMQb8algEFsFubQhh6NaPZ+su0BeosDuGbx3mFZ3MBQ76lA2V7KiiYuToZuGDLRHvEOmZSy3W0lahzioy/ZPTZHMCITYIWQUw9H/XOTcvLdMn9+0+qB6VFU7waVFfHHN/urdfDGEjsGXt7djJdDD4AxYvFQTqVTRtELZ1klrYBTeV9NpEY0tPnxv0l2oBxf2+3MN3L2cZlpaeFVXg5ufiBBEb8jhmrVIA9q9z9s/ZVMSGlqaTMq0uKkMuOFQygwhwXVOq56TntOGI27o9tDJopKovxmkWGNsLi9zT63o2M8cfTQjyC+gs75/nm4ckiO6TzEKFzLB7wDjhTQYR2LBmrm8yRhKy6jmD2KrzN2jITAIQip64x5pIgJL33+WrxWKKsAm6/lo2xP8xJ1lZD2uNdoT4c5M9a3MLOp1eRaN33u8oGymDLznggzBlYzccKBI76l3x+C8SAbQzlUUBupBs3Hb6FuxfncCSodMdX9iGMBonEWN86LuajZ6nSopu2Eeq1uEBaXk7adwYJfWSdOL5RVJi0rrLZhAzB/+2Mkspq1YzMcs75+HvJGms630wR0+iRPjAUw1tyRAL3Yo282uyy8bYDoIvLD/N9ZLJnZfn9/QRLFHwiA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(4326008)(316002)(36756003)(54906003)(76116006)(66556008)(64756008)(66476007)(38070700005)(53546011)(71200400001)(110136005)(6506007)(26005)(6486002)(2906002)(186003)(8936002)(8676002)(55236004)(478600001)(31686004)(91956017)(2616005)(6512007)(38100700002)(83380400001)(31696002)(122000001)(66446008)(86362001)(5660300002)(66946007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZS9sWlhxd2Z0dmpWRDUyU0UvZktBYngvOUkzZjdGZDRmYit3THNZc2lpdGd2?=
 =?utf-8?B?dTNSM2lsTEFsNWVIRnZieEYyemVDeTNpUTN5c3hsZmk1VEpzS0JhekErRnN6?=
 =?utf-8?B?MGpsV1puUjdKTUJkOUVDb21Bb0RnSmVyVitSNG1VWUtHRnpITjhqWnV1TEFz?=
 =?utf-8?B?Z0xWUWNJbjVjZ0pzTkpsbitWR1BtL1YzNVpLaFFIOVdDM2FURlJrTUVOTkdh?=
 =?utf-8?B?RXV1TVYyUlJ2SkU3Mit1L0x4b0JZNEpqV0lXYklaODByVE9YdFdZUkJhelFy?=
 =?utf-8?B?ZExCNHk4Y1lWV3B1RnQwUE9WRktoTjAwZ085VzQxRUZMeUdCU2ZkbEdvd0pB?=
 =?utf-8?B?blcrM2lnZDNic0VKNldyWWxTK1M1eFI1MEZhazJRVWtmakVMaENDTWVsVFND?=
 =?utf-8?B?MVh6TnFlREdyZ0pIRlJlaUVJaEZYRTJSOStPbjV6WW9LbkFhWjhMR3dOS2x3?=
 =?utf-8?B?bThib1ZZbVNsc1cyZUpkQmVIcGhxeHRFc3d5anBHaUMvY1NrRkUwS25lRVlM?=
 =?utf-8?B?YUpWVldNOTRiVUNxYlczUWJtb0l0ZWlSVXcrVFM0UjFlbmpOZ0hsaVdqUjhX?=
 =?utf-8?B?SmIyVERRSnhZNy9IeGQzZzhuU1hXbnAwMHF4N1FvNk50TmhlS2RDdDhzbzdS?=
 =?utf-8?B?MSs1clpFU20ydVN0MXZzNzVsZzBtY1piQUUwTmdUOUUzL280bXFnMjh1aDVk?=
 =?utf-8?B?cTNpSi9PQkVPTkJzQTRTSFk0elRvd1F6QzJ3YjMvcldNcVk3UUIwdTF6MXFC?=
 =?utf-8?B?a256L1dkR3FsZHZKbW1XbTZHT2dZUTNIS2lIZnE3T2F3RXgwclJzaHR6VzJq?=
 =?utf-8?B?RDdJSFl4d2NPWDJBcFR3ZFp6Mm9mTURla2dCcFozY0p1Y3k3bUwzcktPRmpt?=
 =?utf-8?B?c3pwcnZkcWRjNHExcjZEamhFd3RlcGtlQytTM3NkMFlNOXNMbk1QbENFVktJ?=
 =?utf-8?B?NzRleWJoS2NvdkpMMFE3RWVXQTRleTEzSnJIaGxuc1ZlT3NtSFh0MTVBUGtQ?=
 =?utf-8?B?bVR4RUZobjIraHNDd3BQMHhFMUZmSmZCcGlVS20vQ0tHSlNCd2J2OWNKSHhF?=
 =?utf-8?B?em9HTlJtQzAzWTZLM0pPbFR3VWhIMDdaWE5VcHlqSXRYQUNyMDRXQ0pJSERI?=
 =?utf-8?B?Wm5QKytyL3kzTitMR24wYzlMUWhRbys4bU9kV1A4YUZIdFRxVndRSHlPdTh5?=
 =?utf-8?B?d2VYb05TaStrQ1dzZWRQRTVaN3pOc20xZDRNaWE3d3Z4WHN3bFduV0dtMU5N?=
 =?utf-8?B?ZE5EdmxJTkdXcUU2Vk4xUW9wcVZQRGxhMWtsK0NmTDY0cEJhWlRabVQwZjZE?=
 =?utf-8?B?ZnM2QzZ4NjF3TkZTTFJkWEQ3MmdzRVJrbFJ5MGNEYkVMRU85cEtLMEJGaC9Y?=
 =?utf-8?B?RkR2b2xKT1JtdjdRa3dEYy9JZkJlRFkyTW1FbW9IVWRxdWpFcjhncURzNDYw?=
 =?utf-8?B?dVBYbVJkd3A3QlJtaFFhakVYRzJVS256Zi83eW96YlVMZTA4T0ZySEV3RUhy?=
 =?utf-8?B?ZmsxYVZSU0Y3dkdDRm5QNkhBNHdtNGRJVlVtbVRGa0xON2JGMzdOL3pPd0Nn?=
 =?utf-8?B?eUtLVDlxK2w0Yzd0QkFMemdFdWZ0MTBZYnZLNzk5ckxFQWl2YlQzRE8xVHNN?=
 =?utf-8?B?aE5uSXpJUklzd0hEV2t2ODMvWHVDLzlmbEYrbk96SWZVMytIYXJmd1p3MWQ5?=
 =?utf-8?B?WmE3N1U5aTVRbUEwWFhsTEpOZUxYcE1HSE93WUJzRkNNWWN0UkkxM253cmtS?=
 =?utf-8?B?QXZiM1BmWmNnbjV4NmxFcWJha2t4NTF1UGJqVlFncVpJQm9OdGFHN29MQ0h6?=
 =?utf-8?B?NUN3YXdhNHY4K3J1VzYrQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <47BE6A28DB284E4284C1732E00F077FC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9594fe9d-b503-493b-a26a-08d974503a27
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 11:43:37.0272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LvUVwNRQKBWmf2ll2dqEs1u3ymaooAFKuAl3nSB7i/Ncq6VY1WU146rZijymY3G5j3aZfWN706fshP4wD45DBnNYmkJ4fzuN4oNG8qFs3OVnjwZzLsxionY0E+tM7NX4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6243
X-Proofpoint-GUID: xUOhw-FnYBRUsCOeRlkPR_ZoHoKEfNIC
X-Proofpoint-ORIG-GUID: xUOhw-FnYBRUsCOeRlkPR_ZoHoKEfNIC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100071

SGksIEp1bGllbiENCg0KT24gMDkuMDkuMjEgMjA6NDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAwMy8wOS8yMDIxIDA5OjMzLCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2Fu
ZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+DQo+PiBJbiBvcmRlciB2UENJIHRvIHdvcmsg
aXQgbmVlZHMgYWxsIGFjY2VzcyB0byBQQ0kgY29uZmlndXJhdGlvbiBzcGFjZQ0KPj4gKEVDQU0p
IHRvIGJlIHN5bmNocm9uaXplZCBhbW9uZyBhbGwgZW50aXRpZXMsIGUuZy4gaGFyZHdhcmUgZG9t
YWluIGFuZA0KPj4gZ3Vlc3RzLg0KPg0KPiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgeW91
IG1lYW4gYnkgInN5bmNocm9uaXplZCIgaGVyZS4gQXJlIHlvdSByZWZlciB0byB0aGUgY29udGVu
dCBvZiB0aGUgY29uZmlndXJhdGlvbiBzcGFjZT8NCg0KV2UgbWFpbnRhaW4gaHdkb20ncyBhbmQg
Z3Vlc3QncyB2aWV3IG9mIHRoZSByZWdpc3RlcnMgd2UgYXJlIGludGVyZXN0ZWQgaW4NCg0KU28s
IHRvIGhhdmUgaHdkb20ncyB2aWV3IHdlIGFsc28gbmVlZCB0byB0cmFwIGl0cyBhY2Nlc3MgdG8g
dGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UuDQoNClByb2JhYmx5ICJzeW5jaHJvbml6ZWQiIGlzIG5v
dCB0aGUgcmlnaHQgd29yZGluZyBoZXJlLg0KDQo+DQo+PiBGb3IgdGhhdCBpbXBsZW1lbnQgUENJ
IGhvc3QgYnJpZGdlIHNwZWNpZmljIGNhbGxiYWNrcyB0bw0KPj4gcHJvcGVybHkgc2V0dXAgdGhv
c2UgcmFuZ2VzIGRlcGVuZGluZyBvbiBwYXJ0aWN1bGFyIGhvc3QgYnJpZGdlDQo+PiBpbXBsZW1l
bnRhdGlvbi4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8
b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+PiAtLS0NCj4+IMKgIHhlbi9hcmNo
L2FybS9wY2kvZWNhbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysrKysrKysrDQo+
PiDCoCB4ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jIHwgMTYgKysrKysrKysrKysr
KysrKw0KPj4gwqAgeGVuL2FyY2gvYXJtL3ZwY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8IDEzICsrKysrKysrKysrKysNCj4+IMKgIHhlbi9pbmNsdWRlL2FzbS1hcm0vcGNpLmjC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDggKysrKysrKysNCj4+IMKgIDQgZmlsZXMgY2hhbmdlZCwg
NDggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vcGNpL2Vj
YW0uYyBiL3hlbi9hcmNoL2FybS9wY2kvZWNhbS5jDQo+PiBpbmRleCA5MWM2OTFiNDFmZGYuLjky
ZWNiMmUwNzYyYiAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvZWNhbS5jDQo+PiAr
KysgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPj4gQEAgLTQyLDYgKzQyLDE2IEBAIHZvaWQg
X19pb21lbSAqcGNpX2VjYW1fbWFwX2J1cyhzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2Us
DQo+PiDCoMKgwqDCoMKgIHJldHVybiBiYXNlICsgKFBDSV9ERVZGTihzYmRmX3QuZGV2LCBzYmRm
X3QuZm4pIDw8IGRldmZuX3NoaWZ0KSArIHdoZXJlOw0KPj4gwqAgfQ0KPj4gwqAgK3N0YXRpYyBp
bnQgcGNpX2VjYW1fcmVnaXN0ZXJfbW1pb19oYW5kbGVyKHN0cnVjdCBkb21haW4gKmQsDQo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2hvc3RfYnJpZGdlICpicmlkZ2Us
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVy
X29wcyAqb3BzKQ0KPj4gK3sNCj4+ICvCoMKgwqAgc3RydWN0IHBjaV9jb25maWdfd2luZG93ICpj
ZmcgPSBicmlkZ2UtPnN5c2RhdGE7DQo+PiArDQo+PiArwqDCoMKgIHJlZ2lzdGVyX21taW9faGFu
ZGxlcihkLCBvcHMsIGNmZy0+cGh5c19hZGRyLCBjZmctPnNpemUsIE5VTEwpOw0KPg0KPiBXZSBo
YXZlIGEgZml4ZWQgYXJyYXkgZm9yIGhhbmRsaW5nIHRoZSBNTUlPIGhhbmRsZXJzLg0KDQpEaWRu
J3Qga25vdyB0aGF0Og0KDQp4ZW4vaW5jbHVkZS9hc20tYXJtL21taW8uaDoyNzojZGVmaW5lIE1B
WF9JT19IQU5ETEVSwqAgMTYNCg0KPiBTbyB5b3UgbmVlZCB0byBtYWtlIHN1cmUgd2UgaGF2ZSBl
bm91Z2ggc3BhY2UgaW4gaXQgdG8gc3RvcmUgb25lIGhhbmRsZXIgcGVyIGhhbmRsZXIuDQo+DQo+
IFRoaXMgaXMgcXVpdGUgc2ltaWxhciB0byB0aGUgcHJvYmxlbSB3ZSBoYWQgd2l0aCB0aGUgcmUt
ZGlzdHJpYnVvciBvbiBHSUN2My4gSGF2ZSBhIGxvb2sgdGhlcmUgdG8gc2VlIGhvdyB3ZSBkZWFs
dCB3aXRoIGl0Lg0KDQpDb3VsZCB5b3UgcGxlYXNlIHBvaW50IG1lIHRvIHRoYXQgc29sdXRpb24/
IEkgY2FuIG9ubHkgc2VlDQoNCiDCoMKgwqAgLyogUmVnaXN0ZXIgbW1pbyBoYW5kbGUgZm9yIHRo
ZSBEaXN0cmlidXRvciAqLw0KIMKgwqDCoCByZWdpc3Rlcl9tbWlvX2hhbmRsZXIoZCwgJnZnaWNf
ZGlzdHJfbW1pb19oYW5kbGVyLCBkLT5hcmNoLnZnaWMuZGJhc2UsDQogwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU1pfNjRLLCBOVUxMKTsNCg0KIMKg
wqDCoCAvKg0KIMKgwqDCoMKgICogUmVnaXN0ZXIgbW1pbyBoYW5kbGVyIHBlciBjb250aWd1b3Vz
IHJlZ2lvbiBvY2N1cGllZCBieSB0aGUNCiDCoMKgwqDCoCAqIHJlZGlzdHJpYnV0b3JzLiBUaGUg
aGFuZGxlciB3aWxsIHRha2UgY2FyZSB0byBjaG9vc2Ugd2hpY2gNCiDCoMKgwqDCoCAqIHJlZGlz
dHJpYnV0b3IgaXMgdGFyZ2V0ZWQuDQogwqDCoMKgwqAgKi8NCiDCoMKgwqAgZm9yICggaSA9IDA7
IGkgPCBkLT5hcmNoLnZnaWMubnJfcmVnaW9uczsgaSsrICkNCiDCoMKgwqAgew0KIMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCB2Z2ljX3JkaXN0X3JlZ2lvbiAqcmVnaW9uID0gJmQtPmFyY2gudmdpYy5y
ZGlzdF9yZWdpb25zW2ldOw0KDQogwqDCoMKgwqDCoMKgwqAgcmVnaXN0ZXJfbW1pb19oYW5kbGVy
KGQsICZ2Z2ljX3JkaXN0cl9tbWlvX2hhbmRsZXIsDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWdpb24tPmJhc2UsIHJlZ2lvbi0+
c2l6ZSwgcmVnaW9uKTsNCiDCoMKgwqAgfQ0Kd2hpY2ggSU1PIGRvZXNuJ3QgY2FyZSBhYm91dCB0
aGUgbnVtYmVyIG9mIE1NSU9zIHdlIGNhbiBoYW5kbGUNCg0KPg0KPj4gK8KgwqDCoCByZXR1cm4g
MDsNCj4+ICt9DQo+PiArDQo+PiDCoCAvKiBFQ0FNIG9wcyAqLw0KPj4gwqAgY29uc3Qgc3RydWN0
IHBjaV9lY2FtX29wcyBwY2lfZ2VuZXJpY19lY2FtX29wcyA9IHsNCj4+IMKgwqDCoMKgwqAgLmJ1
c19zaGlmdMKgID0gMjAsDQo+PiBAQCAtNDksNiArNTksNyBAQCBjb25zdCBzdHJ1Y3QgcGNpX2Vj
YW1fb3BzIHBjaV9nZW5lcmljX2VjYW1fb3BzID0gew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIC5t
YXBfYnVzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gcGNpX2VjYW1fbWFwX2J1cywN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAucmVhZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA9IHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
IC53cml0ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSBwY2lfZ2VuZXJpY19j
b25maWdfd3JpdGUsDQo+PiArwqDCoMKgwqDCoMKgwqAgLnJlZ2lzdGVyX21taW9faGFuZGxlcsKg
ID0gcGNpX2VjYW1fcmVnaXN0ZXJfbW1pb19oYW5kbGVyLA0KPj4gwqDCoMKgwqDCoCB9DQo+PiDC
oCB9Ow0KPj4gwqAgZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9u
LmMgYi94ZW4vYXJjaC9hcm0vcGNpL3BjaS1ob3N0LWNvbW1vbi5jDQo+PiBpbmRleCBkMmZlZjU0
NzZiOGUuLmE4OTExMmJmYmI3YyAxMDA2NDQNCj4+IC0tLSBhL3hlbi9hcmNoL2FybS9wY2kvcGNp
LWhvc3QtY29tbW9uLmMNCj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wY2kvcGNpLWhvc3QtY29tbW9u
LmMNCj4+IEBAIC0zMTgsNiArMzE4LDIyIEBAIHN0cnVjdCBkdF9kZXZpY2Vfbm9kZSAqcGNpX2Zp
bmRfaG9zdF9icmlkZ2Vfbm9kZShzdHJ1Y3QgZGV2aWNlICpkZXYpDQo+PiDCoMKgwqDCoMKgIH0N
Cj4+IMKgwqDCoMKgwqAgcmV0dXJuIGJyaWRnZS0+ZHRfbm9kZTsNCj4+IMKgIH0NCj4+ICsNCj4+
ICtpbnQgcGNpX2hvc3RfaXRlcmF0ZV9icmlkZ2VzKHN0cnVjdCBkb21haW4gKmQsDQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
ICgqY2xiKShzdHJ1Y3QgZG9tYWluICpkLA0KPg0KPiBOSVQ6IFdlIHRlbmQgdG8gbmFtZSBjYWxs
YmFjayB2YXJpYWJsZSAnY2InLg0KU3VyZQ0KPg0KPiBDaGVlcnMsDQo+DQpUaGFuayB5b3UsDQoN
Ck9sZWtzYW5kcg0K

