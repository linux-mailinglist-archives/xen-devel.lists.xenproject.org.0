Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933C404726
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182776.330535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFbL-0004In-72; Thu, 09 Sep 2021 08:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182776.330535; Thu, 09 Sep 2021 08:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFbL-0004G4-2r; Thu, 09 Sep 2021 08:40:07 +0000
Received: by outflank-mailman (input) for mailman id 182776;
 Thu, 09 Sep 2021 08:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6so6=N7=epam.com=prvs=9886dc581d=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOFbI-00047y-Ry
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:40:05 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 862f073c-1149-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:40:02 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1898cb9u007312; 
 Thu, 9 Sep 2021 08:39:59 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0a-0039f301.pphosted.com with ESMTP id 3ayek8g6qw-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Sep 2021 08:39:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4755.eurprd03.prod.outlook.com (2603:10a6:208:c2::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Thu, 9 Sep
 2021 08:39:56 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 08:39:55 +0000
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
X-Inumbo-ID: 862f073c-1149-11ec-b1a7-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mrh8NkgqkSYE4M4TBb0KfeRb9n7co1/dyL8GBIjiX8BWJxX/kOH/4bDWzW6Jq/xTiXUUbckE9ZZ+Q47CXqA2XVoBvTwRX812VUmz6zp9Rp9Dfnsq28V4dtoiRI6oWfE1ICa/ESoSBDXpOhzHQT1FiqWvnBpkAShk+LB5hNcD8STWQ8qQvwtCq0cJrWH9zNA3XjNgVhVzzDa5SRIbfUHnZAQJLdAm5o3m30d4G9djFz9jO/1V5RguaQpgyPwDQb29iMAuCarlVFALIpp0l6IkZTrz99FnVQ1j/qmnXRYsHGEzFVXz5F/fZo70LLFj6vFeKkALBlCAsnpawMIb7LYnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=W8Jhqkd6vtBgYYxy7gzk21vNw27Kmce0dz8EbMBVHds=;
 b=MJfb3K4D37iVwOAalWZ2CJbQh7ePcozTDjnqRg9Vm6HbCIJ+3+GQQi5jMZRNZWQJwLmojn+G/Oe4W8syTVt9CYFIvtH3BCiLnVgRlo1/o9go/RgKI0+IXd5EVmcQAyclfTNwU1CWd9H1EoeenDDtoh9QpAzoeoDkQ8FwIuqmnAchZyv0GoYLjEZgsHzNg9yQN1S3FAHxOr5xFaTF2DY6LRWVdx+4aw19PlJk5oav1iaslaIj0OYdDc3Dw19uUCTsR/VjjNL81RB4moe4diW25kkxMwRugJMkpwqAyvXpugUVR4FY/wCaTrQOSjwF55q4DziX1yWwNPFRNDzg+wgrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8Jhqkd6vtBgYYxy7gzk21vNw27Kmce0dz8EbMBVHds=;
 b=C0fmE6fuDxU378Qwzyci3NT7W9jCWrq3VnooDKmuLZxkSXA1ncKPqe6a+5CJqEYtMdLwQDLdshTCO5fp2ODABmHKeXd6i0Fh3eNv6NZL5oDCh5aBzUvrL8/akyuGtOQcP4opC0RFUSmuyh1vKrB+GJfaFPPH8C6rSCH3UroxVgAULCKHTdfFvmJ0HXsuZzFTwFd9ecpvRVWqIdjjCuuGjSboIs0EMoeoZ6+AQDjkdjHUeMiIphM8+/5kZVIdDcK034RDRm/wnF6ZfL51afaYpsbSzGE6Vm1Sa+y9KHbvHxOtelf6hUg5pLPOi/xOuqhqNyiBzeu4tbjWT69WQx3kcA==
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
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Topic: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
Thread-Index: 
 AQHXoKxjFI8WSqpeJkWkpzZfft/zi6uXHR6AgAEZm4CAAASsgIAABSgAgAAIrgCAAAT5AIAAA1EAgAAJNYCAAAPZgIADDJuA
Date: Thu, 9 Sep 2021 08:39:55 +0000
Message-ID: <73697ef0-85de-a530-7601-d8b1490ec5b5@epam.com>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
 <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
 <0e3942a5-9105-c99e-f15e-dcf35aae142a@epam.com>
 <c6702cee-9c37-8f0f-77d7-20da718e3e94@suse.com>
 <5d0d345d-db16-f0c5-9a78-4ad5f4733886@epam.com>
 <5ffbd0a6-b34f-4de4-b316-2376211039f1@suse.com>
 <6db7c55c-93c6-7901-6097-687287463c78@epam.com>
 <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
In-Reply-To: <d78f2211-ff79-6bbc-f8ca-95cf07e3d7ae@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.com; dkim=none (message not signed)
 header.d=none;suse.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ae7c8e1c-5260-4133-487e-08d9736d669a
x-ms-traffictypediagnostic: AM0PR03MB4755:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4755F698577669BD9580B290E7D59@AM0PR03MB4755.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 hYqSZ4tqEcNuNHB5ktpkdsL8iAV06sagZA2wSn5V93SgmlAdmpQlMJGfgo7YdRtuo2xkh3NrZDjnSuh8rvNEjO6Re11rhf94cXqjMXIoA7D5a2s9P9+KQqjqv+CanLIZEx+wu7Tafa7hJ5B5kfGBKXIh+PuqXeq0it89YQtea4zB5pON03oAGstRILFvSRopK5DCPjXW9yc6WRrESUCgrN18vgJ6IyMnUNHuohNyeCqskiP++VdeZ3RSRCxA1RkWQCeNlECK+DKMDbGUJ5+0FFyKX2aXXI3TuftOZjBlwaP+TqrL4FBUowkCk+KvUIe2iTwHK7/jasofbfd76qceZB6XQ6oWafnspfzsPy/eOaOZ6KUQ+XAXJZtD+y8PnXp294Qp6G5Ay+HzHT3LADNvO/XWuDhb+3UHowHIsKBPIQVTkSBEAdCAqYia9lLOgUDoczhqnlH5+8y2WvquGFLt4ZgkNvlUcjeiuOYf2GWn+CsLvc/c0Z0wmzeRN1FWmU7IQJVbLOxY1HPNBnw4wE96Crt7fdvXiGbmLc5zFUupj1k4XLrZNiJkcxE8pFIJUHOaAcOBmpb3gIys3arn7JhQqgwWrjmJ7JA6XMJO3Av3f65K2n92YNJnU3UtuGrMTverFob1CcEAvDyJ5PaDyeQfizLDGi0LLhrs5n3rN9aec3V/QJrcpiIPCUGQfdKkfkeExJL/EUql3Q1/h3YRgzzBFCl/xGbvOGvH5qBAQbX0FwPhuUX6F/qvoJHp7TqSL9Aao1LXGQaCFBs8M7Wch4yc3BxsoJihyFaQbB8vObtRj4Od301Vyx/vEhqHYiYbG1mJgsAI+b9Qla6eBJxt6NjKyKHk5JlSxppeeOsqFfDmwtE=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(6512007)(71200400001)(54906003)(86362001)(6486002)(26005)(76116006)(53546011)(6506007)(66946007)(91956017)(8936002)(8676002)(2616005)(64756008)(66476007)(66446008)(66556008)(38070700005)(478600001)(5660300002)(2906002)(186003)(83380400001)(36756003)(31686004)(31696002)(122000001)(316002)(966005)(110136005)(4326008)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NU1SN2hHUkpGT2UyUlFuVE1pM1BvaWVnZXFVazQyVUlIMENibU1PU3p2Zk9X?=
 =?utf-8?B?eUsyNmZyL3UybHo5RGkwQVBxRjRWUURaUTQzQkRJQ2dabVBqT3pRcndVRXRj?=
 =?utf-8?B?VFZ0QVIxSkpNYjRHMUdES0hWRS9IblEwekF0c1lUTit2NHh3MGNRM1FvZmha?=
 =?utf-8?B?TlJKQS9td2lIaStERkF6eHZXdEFUL09VVXRzU1JPY1FiN3l0MjFGS1RiYVBj?=
 =?utf-8?B?RUthZ0JwMmUxRkRsd09SaWQrbXYyeUlzUTJMQlEwbEJQb0thY3pqMFJqR2lv?=
 =?utf-8?B?TmtYVkd3azYyMFc4cGUwU2xYUHR1MFFKUFhIdDV5MWtHdnNVR2g3ODZGK3Zq?=
 =?utf-8?B?dVdsSk4zM2hDSXV6MUN6ZDZNUVVjT1JVRisxckx3aCttY1pmK2V4VEd1ZC9s?=
 =?utf-8?B?dHlKTUF5SzdXeE9OalFxeHBTeXhlVnZvcFVrM294a1FXL0NFMmtVUG1hYzdR?=
 =?utf-8?B?YVNUN0dqT3dYWnZoZE9kdU1oQXRmbmVVL0hqenhXYmJFbHJqR0xIWkVlcnVR?=
 =?utf-8?B?WUN1VUxWZ0ZzTTMwejYwR29XS1RnbmQ5QmhwQklITEc2SWYvbTRPYkx0OHhx?=
 =?utf-8?B?TnYzOVJRREN4bU1BNEttNFBlQXdTUVJXNzNpRHplczNrdmU0YmZzcXZoWk1K?=
 =?utf-8?B?YzIzTGNkNnIrQlIra1gvMzNlcXJNR2tVeUJ4c1VzVFR2S1c1Z1JXdVcwcVZh?=
 =?utf-8?B?TVFuaVpndXlSSWN4Z2xNa0EvNTFwSkVpRFUrYXZwNHJpMEdtaW1WdytGZUtQ?=
 =?utf-8?B?eTZWWWxnOGo2OTRQYjFuMUFENVJKMk9xd1JobVNRSHJTT1VvRGhaekI4TlE4?=
 =?utf-8?B?ZzViRlJTVTd6amdOWXZmQkdOeWdvdUJ3a1lsY1EydjJzTlZKampXOWJPdzl3?=
 =?utf-8?B?cXJEMVBxK1VtS2MrRDdXRXZDeGNZNVRxTUZEdWZCR3NYRnFPMmwzOXF4Yloz?=
 =?utf-8?B?TkNleEYxalg3NmgvVHJIaGF6ZnM2dlBncmtuOExVTGo2S21YNjMzYUlrTXRm?=
 =?utf-8?B?dUpxZWk0U05ZSEtXS3k4ZUhsZEt2YVdoNE9zejgwVTVwVXV2TW5ieVArc2lX?=
 =?utf-8?B?YWtZRGRKRzFkUjBvaGZpajVZTEdvVDE0ZVNzWmd5UmV3ZjlHRUxoamhuMjJw?=
 =?utf-8?B?ZzEwN3JTS3labnJPTHRSczlXZzFmeGFWU3lKdDFNTE9rQ2NoWnZ6djJzZ2R2?=
 =?utf-8?B?eTJla0lHMDhXZGR3b05SdElTbmJUZCs5NlJ5alRnSHVlbysrWkQyNkhEL3hm?=
 =?utf-8?B?eEplQXVSRzVpWDNKSURZSGlWazE4WWkxNUVnTDlHcXRlRHJkbkRPT1MrejE4?=
 =?utf-8?B?Q0d1WjlDL1FsUnJlVkZ5R1EvbVBXTVdNTFZTQzU4L3FYN3lIZlhZcUFMRDBa?=
 =?utf-8?B?eTl1aHlIUTBZU0ZoU2haRXk4VjhPYkR6YTg1ekhqTEE4ZU4vK25lNWJ2SStp?=
 =?utf-8?B?TGRQcjV4d2ZYYkpJQ0dtc2FGR3Q3d1BKUmxMbmZwKyt6YkJVeHowMjU5WElx?=
 =?utf-8?B?enk4czd2YjZMR1hhWUlIcWlLa1NxdVYweEJhVWJPTjIvd2dNRDRSOUVXT3U5?=
 =?utf-8?B?VGhDNTJtRDJsL1JDV1FZMDVZSlRxTHJ5cTNpcEV5L2NONklqTnpZa21IdXZM?=
 =?utf-8?B?eHFQU2RhZURDWDdpVnRHWXdadE9IMDBETWZSUlZhMXAxU0pCM2JQeTA2VnFZ?=
 =?utf-8?B?MjljTnlOcFVBbGtiQ1hZNncwRTJ5M3RqNHBaOXhnNkY2bXZna1BoKzV5RFJp?=
 =?utf-8?Q?Lpvj3Pm/LtUoO9i8JuR1/4iLByDUxytz5kMZZQh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88AE7DBE0D19CB47ADBED3F487FB2254@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae7c8e1c-5260-4133-487e-08d9736d669a
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2021 08:39:55.8278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6ACHRFWyrZ7s6UEhlVJbgkbhv+XBIdGoVGuPR5zoDKP9UHjFXySvE+1hLqL0yHntzKINYqGIg9Ngu2UUXC0DKr0R5hS+AhotDAUUN+vIflpg4ZqAkrLDEZC1MlIo5orc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4755
X-Proofpoint-ORIG-GUID: jclkPhnSXVKAu-xqI44l551K8YNViC8f
X-Proofpoint-GUID: jclkPhnSXVKAu-xqI44l551K8YNViC8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_02,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 clxscore=1015 suspectscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090051

DQpPbiAwNy4wOS4yMSAxMzowNiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+IE9uIDA3LjA5LjIwMjEg
MTE6NTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMDcuMDkuMjEgMTI6
MTksIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA3LjA5LjIwMjEgMTE6MDcsIE9sZWtzYW5k
ciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+PiBPbiAwNy4wOS4yMSAxMTo0OSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+PiBPbiAwNy4wOS4yMDIxIDEwOjE4LCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+PiBTbywgaWYgd2UgaGF2ZSBhIGhpZGRlbiBQQ0kgZGV2aWNlIHdo
aWNoIGNhbiBiZSBhc3NpZ25lZCB0byBhIGd1ZXN0IGFuZCBpdCBpcyBsaXRlcmFsbHkgdW50b3Vj
aGVkDQo+Pj4+Pj4gKG5vdCBlbmFibGVkIGluIERvbTApIHRoZW4gSSB0aGluayB0aGVyZSB3aWxs
IGJlIG5vIHN1Y2ggcmVmZXJlbmNlIGFzICJob3N0IGFzc2lnbmVkIHZhbHVlcyIgYXMNCj4+Pj4+
PiBtb3N0IHByb2JhYmx5IHRoZSBjb21tYW5kIHJlZ2lzdGVyIHdpbGwgcmVtYWluIGluIGl0cyBh
ZnRlciByZXNldCBzdGF0ZS4NCj4+Pj4+IFdoYXQgbWVhbmluZyBvZiAiaGlkZGVuIiBkbyB5b3Ug
aW1wbHkgaGVyZT8gRGV2aWNlcyBwYXNzZWQgdG8NCj4+Pj4+IHBjaV97aGlkZSxyb31fZGV2aWNl
KCkgbWF5IG5vdCBiZSBhc3NpZ25lZCB0byBndWVzdHMgLi4uDQo+Pj4+IFlvdSBhcmUgY29tcGxl
dGVseSByaWdodCBoZXJlLg0KPj4+Pj4gRm9yIGFueSBvdGhlciBtZWFuaW5nIG9mICJoaWRkZW4i
LCBldmVuIGlmIHRoZSBkZXZpY2UgaXMgY29tcGxldGVseQ0KPj4+Pj4gaWdub3JlZCBieSBEb20w
LA0KPj4+PiBEb20wbGVzcyBpcyBzdWNoIGEgY2FzZSB3aGVuIGEgZGV2aWNlIGlzIGFzc2lnbmVk
IHRvIHRoZSBndWVzdA0KPj4+PiB3aXRob3V0IERvbTAgYXQgYWxsPw0KPj4+IEluIHRoaXMgY2Fz
ZSBpdCBpcyBlbnRpcmVseSB1bmNsZWFyIHRvIG1lIHdoYXQgZW50aXR5IGl0IGlzIHRvIGhhdmUN
Cj4+PiBhIGdsb2JhbCB2aWV3IG9uIHRoZSBQQ0kgc3Vic3lzdGVtLg0KPj4+DQo+Pj4+PiAgICAg
Y2VydGFpbiBvZiB0aGUgcHJvcGVydGllcyBzdGlsbCBjYW5ub3QgYmUgYWxsb3dlZA0KPj4+Pj4g
dG8gYmUgRG9tVS1jb250cm9sbGVkLg0KPj4+PiBUaGUgbGlzdCBpcyBub3QgdGhhdCBiaWcsIGNv
dWxkIHlvdSBwbGVhc2UgbmFtZSBhIGZldyB5b3UgdGhpbmsgY2Fubm90DQo+Pj4+IGJlIGNvbnRy
b2xsZWQgYnkgYSBndWVzdD8gSSBjYW4gdGhpbmsgb2YgUENJX0NPTU1BTkRfU1BFQ0lBTCg/KSwN
Cj4+Pj4gUENJX0NPTU1BTkRfSU5WQUxJREFURSg/KSwgUENJX0NPTU1BTkRfUEFSSVRZLCBQQ0lf
Q09NTUFORF9XQUlULA0KPj4+PiBQQ0lfQ09NTUFORF9TRVJSLCBQQ0lfQ09NTUFORF9JTlRYX0RJ
U0FCTEUgd2hpY2ggd2UgbWF5IHdhbnQgdG8NCj4+Pj4gYmUgYWxpZ25lZCB3aXRoIHRoZSAiaG9z
dCByZWZlcmVuY2UiIHZhbHVlcywgZS5nLiB3ZSBvbmx5IGFsbG93IHRob3NlIGJpdHMNCj4+Pj4g
dG8gYmUgc2V0IGFzIHRoZXkgYXJlIGluIERvbTAuDQo+Pj4gV2VsbCwgeW91J3ZlIGNvbXBpbGUg
YSBsaXN0IGFscmVhZHksIGFuZCBJIGRpZCBzYXkgc28gYmVmb3JlIGFzIHdlbGw6DQo+Pj4gRXZl
cnl0aGluZyBleGNlcHQgSS9PIGFuZCBtZW1vcnkgZGVjb2RpbmcgYXMgd2VsbCBhcyBidXMgbWFz
dGVyaW5nDQo+Pj4gbmVlZHMgYXQgbGVhc3QgY2xvc2VseSBsb29raW5nIGF0LiBJTlRYX0RJU0FC
TEUsIGZvciBleGFtcGxlLCBpcw0KPj4+IHNvbWV0aGluZyBJIGRvbid0IHRoaW5rIGEgZ3Vlc3Qg
c2hvdWxkIGJlIGFibGUgdG8gZGlyZWN0bHkgY29udHJvbC4NCj4+PiBJdCBtYXkgc3RpbGwgYmUg
dGhlIGNhc2UgdGhhdCB0aGUgaG9zdCBwZXJtaXRzIGl0IGNvbnRyb2wsIGJ1dCB0aGVuDQo+Pj4g
b25seSBpbmRpcmVjdGx5LCBhbGxvd2luZyB0aGUgaG9zdCB0byBhcHByb3ByaWF0ZWx5IGFkanVz
dCBpdHMNCj4+PiBpbnRlcm5hbHMuDQo+Pj4NCj4+PiBOb3RlIHRoYXQgZXZlbiBmb3IgSS9PIGFu
ZCBtZW1vcnkgZGVjb2RpbmcgYXMgd2VsbCBhcyBidXMgbWFzdGVyaW5nDQo+Pj4gaXQgbWF5IGJl
IG5lY2Vzc2FyeSB0byBsaW1pdCBndWVzdCBjb250cm9sOiBJbiBjYXNlIHRoZSBob3N0IHdhbnRz
DQo+Pj4gdG8gZGlzYWJsZSBhbnkgb2YgdGhlc2UgKHBlcmhhcHMgdHJhbnNpZW50bHkpIGRlc3Bp
dGUgdGhlIGd1ZXN0DQo+Pj4gd2FudGluZyB0aGVtIGVuYWJsZWQuDQo+PiBPaywgc28gaXQgaXMg
bm93IGNsZWFyIHRoYXQgd2UgbmVlZCBhIHlldCBhbm90aGVyIHBhdGNoIHRvIGFkZCBhIHByb3Bl
cg0KPj4gY29tbWFuZCByZWdpc3RlciBlbXVsYXRpb24uIFdoYXQgaXMgeW91ciBwcmVmZXJlbmNl
OiBkcm9wIHRoZSBjdXJyZW50DQo+PiBwYXRjaCwgaW1wbGVtZW50IGNvbW1hbmQgcmVnaXN0ZXIg
ZW11bGF0aW9uIGFuZCBhZGQgYSAicmVzZXQgcGF0Y2giDQo+PiBhZnRlciB0aGF0IG9yIHdlIGNh
biBoYXZlIHRoZSBwYXRjaCBhcyBpcyBub3csIGJ1dCBJJ2xsIG9ubHkgcmVzZXQgSU8vbWVtIGFu
ZCBidXMNCj4+IG1hc3RlciBiaXRzLCBlLmcuIHJlYWQgdGhlIHJlYWwgdmFsdWUsIG1hc2sgdGhl
IHdhbnRlZCBiaXRzIGFuZCB3cml0ZSBiYWNrPw0KPiBFaXRoZXIgb3JkZXIgaXMgZmluZSB3aXRo
IG1lIGFzIGxvbmcgYXMgdGhlIHJlc3VsdCB3aWxsIGJlIGNsYWltZWQgdG8NCj4gYmUgY29tcGxl
dGUgdW50aWwgcHJvcGVyIGVtdWxhdGlvbiBpcyBpbiBwbGFjZS4NCkkgdHJpZWQgdG8gc2VlIHdo
YXQgb3RoZXJzIGRvIGluIG9yZGVyIHRvIGVtdWxhdGUgUENJX0NPTU1BTkQgcmVnaXN0ZXINCmFu
ZCBpdCBzZWVtcyB0aGF0IGF0IG1vc3QgdGhleSBjYXJlIGFib3V0IHRoZSBvbmx5IElOVFggYml0
IChiZXNpZGVzDQpJTy9tZW1vcnkgZW5hYmxlIGFuZCBidXMgbXVzdGVyIHdoaWNoIGFyZSB3cml0
ZSB0aHJvdWdoKS4gUGxlYXNlIHNlZQ0KWzFdIGFuZCBbMl0uIFByb2JhYmx5IEkgbWlzcyBzb21l
dGhpbmcsIGJ1dCBpdCBjb3VsZCBiZSBiZWNhdXNlIGluIG9yZGVyDQp0byBwcm9wZXJseSBlbXVs
YXRlIHRoZSBDT01NQU5EIHJlZ2lzdGVyIHdlIG5lZWQgdG8ga25vdyBhYm91dCB0aGUNCndob2xl
IFBDSSB0b3BvbG9neSwgZS5nLiBpZiBhbnkgc2V0dGluZyBpbiBkZXZpY2UncyBjb21tYW5kIHJl
Z2lzdGVyDQppcyBhbGlnbmVkIHdpdGggdGhlIHVwc3RyZWFtIHBvcnQgZXRjLiBUaGlzIG1ha2Vz
IG1lIHRoaW5rIHRoYXQgYmVjYXVzZQ0Kb2YgdGhpcyBjb21wbGV4aXR5IG90aGVycyBqdXN0IGln
bm9yZSB0aGF0LiBOZWl0aGVyIEkgdGhpbmsgdGhpcyBjYW4gYmUNCmVhc2lseSBkb25lIGluIG91
ciBjYXNlLiBTbyBJIHdvdWxkIHN1Z2dlc3Qgd2UganVzdCBhZGQgdGhlIGZvbGxvd2luZw0Kc2lt
cGxlIGxvZ2ljIHRvIG9ubHkgZW11bGF0ZSBQQ0lfQ09NTUFORF9JTlRYX0RJU0FCTEU6IGFsbG93
IGd1ZXN0IHRvDQpkaXNhYmxlIHRoZSBpbnRlcnJ1cHRzLCBidXQgZG9uJ3QgYWxsb3cgdG8gZW5h
YmxlIGlmIGhvc3QgaGFzIGRpc2FibGVkDQp0aGVtLiBUaGlzIGlzIGFsc28gY291bGQgYmUgdHJp
Y2t5IGEgYml0IGZvciB0aGUgZGV2aWNlcyB3aGljaCBhcmUgbm90DQplbmFibGVkIGFuZCB0aHVz
IG5vdCBjb25maWd1cmVkIGluIERvbTAsIGUuZy4gd2UgZG8gbm90IGtub3cgZm9yIHN1cmUNCmlm
IHRoZSB2YWx1ZSBpbiB0aGUgUENJX0NPTU1BTkQgcmVnaXN0ZXIgKGluIHBhcnRpY3VsYXINClBD
SV9DT01NQU5EX0lOVFhfRElTQUJMRSBiaXQpIGNhbiBiZSB1c2VkIGFzIHRoZSByZWZlcmVuY2Ug
aG9zdCB2YWx1ZSBvcg0Kbm90LiBJdCBjYW4gYmUgdGhhdCB0aGUgdmFsdWUgdGhlcmUgaXMganVz
dCB0aGUgb25lIGFmdGVyIHJlc2V0IG9yIHNvLg0KVGhlIHJlc3Qgb2YgdGhlIGNvbW1hbmQgcmVn
aXN0ZXIgYml0cyB3aWxsIGdvIGRpcmVjdGx5IHRvIHRoZSBjb21tYW5kDQpyZWdpc3RlciB1bnRv
dWNoZWQuDQpTbywgYXQgdGhlIGVuZCBvZiB0aGUgZGF5IHRoZSBxdWVzdGlvbiBpcyBpZiBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEUNCmlzIGVub3VnaCBhbmQgaG93IHRvIGdldCBpdHMgcmVmZXJl
bmNlIGhvc3QgdmFsdWUuDQoNCj4gSmFuDQoNClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQoNClsx
XSBodHRwczovL2dpdGh1Yi5jb20vcWVtdS9xZW11L2Jsb2IvbWFzdGVyL2h3L3hlbi94ZW5fcHRf
Y29uZmlnX2luaXQuYyNMMzEwDQpbMl0gaHR0cHM6Ly9naXRodWIuY29tL3Byb2plY3RhY3JuL2Fj
cm4taHlwZXJ2aXNvci9ibG9iL21hc3Rlci9oeXBlcnZpc29yL2h3L3BjaS5jI0wzMzY=

