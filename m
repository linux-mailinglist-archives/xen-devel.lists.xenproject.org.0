Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2221840BF09
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 06:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187198.335981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQMsC-0004Bc-R8; Wed, 15 Sep 2021 04:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187198.335981; Wed, 15 Sep 2021 04:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQMsC-00048e-MU; Wed, 15 Sep 2021 04:50:16 +0000
Received: by outflank-mailman (input) for mailman id 187198;
 Wed, 15 Sep 2021 04:50:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tFB7=OF=epam.com=prvs=9892afeb01=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mQMsA-00048Y-Dj
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 04:50:14 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca53ba9d-58b0-4775-a3f6-4da87a6a5be6;
 Wed, 15 Sep 2021 04:50:13 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18F4nCam016051;
 Wed, 15 Sep 2021 04:50:09 GMT
Received: from eur02-he1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2054.outbound.protection.outlook.com [104.47.5.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b3a4ng020-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 04:50:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB6067.eurprd03.prod.outlook.com (2603:10a6:208:15e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.18; Wed, 15 Sep
 2021 04:50:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%3]) with mapi id 15.20.4523.014; Wed, 15 Sep 2021
 04:50:06 +0000
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
X-Inumbo-ID: ca53ba9d-58b0-4775-a3f6-4da87a6a5be6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lYFbiSrE68zkQMFUiblj/BkwSqmrdZuRN5GgC9qnzFFecjj+XpJtC8glmvbWYuiMk9AZ8yq2SLf0UeUQzwK0dv92yhHDdo4SfmNJqGnzCXvmFSMGRQpHRS5j+bUQeG1F5ZxBHppKCiaAuekFeYSVyPwSgm6G8YEAPU/Q/5iy6xhdJCeEaKCYZGpKSz6KT3FgT2DmKz2YkhQ3dAAxmY8LTDAw4eU7vioCww1OShWOkoDWWJi2WO8LXK9zJPX4S75ta+Ei59D3ynvsjpe0gj9Y8keGh+Yl5lB+oJTvfaAEh/apFatSyQxfUpp+afrrdAOqptm9/KF0ueWlHOyBYV2dqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=YFEIHkrqVx3dzdXzYlJfTvgvrLVAsNPXYEvsCpIhXB4=;
 b=defh8b78xl8NtjsLGCqX2Dn2QCrGKlvJ5ztywNY9NfEKdpA52YHXErNLk7frRIVTyhT29F6Fb9uzQBvsJ2BSWmxqa5V/sauRlrjz+BdbnSO0IeW3Qrx32qmiPuXqWRDYLyLjv7w/OKczpnS5FWtCS21fRBJnpGWVvs3Pf5OqsLefFCHLG70QC4IAulO/KkNHlXepNt3j/hosYzFt2t0XxPXmlSsqH75jfc5OYizlo2zCEF+T6rKvwYaYYSMV8RyneB3iC1KxTflQx4TCsPcGzi165E4AWc2XlH3/M0NlrtYKMn3/Uk5OBlykafTjMEsNKOj00CYht9Yhz3R13/AvKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YFEIHkrqVx3dzdXzYlJfTvgvrLVAsNPXYEvsCpIhXB4=;
 b=T4q49g6557HI+fwE2gJiejbRSSYWo8PBn5jRMGKHdIumrRLtTIR16k+/Ck3T8jD9ukLgDDziTjKzh+DzKJue8H9dFVCD7TSZ38LZ2EqvoIeZxIrLw/+KejEVqVpKX2s9mWo9LaYrlTrnYzPrCW+l6A5Q6YvMuX8q2KsqFBX0v67zPlab+CXauc4nu7X9R8EWMYwFw032tyzMLt4228Eko8h2iF4sv8BEmolEDJ+mSTzrnTNYKr0p2bdVmguIuBx6YztVuLM9n/V4kzjoRJw1qb2oMcySe5L3I0e7o3MrnbbLeQUO44VP+lBOqTLwgc1k4GB55rObTZMO9RN8yxVQ2A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <andr2000@gmail.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4ACAABanAIAAAwIAgAABgYCAAAHPAIAAAcgAgAABzYCABkt1gIAAsi4AgABJ7oA=
Date: Wed, 15 Sep 2021 04:50:06 +0000
Message-ID: <4e5db370-76ac-d72f-f641-0124518b17c6@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
 <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
 <7263f268-7f90-e561-4679-f78185c88cd8@epam.com>
 <0eb861db-eaf4-0919-4f54-64f448f1cdfe@xen.org>
 <52da7955-ead7-f404-6e51-7d1ee7bc3142@epam.com>
 <a4343670-2d9a-cec2-f093-aa3b0a5e0657@epam.com>
 <alpine.DEB.2.21.2109141716170.21985@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109141716170.21985@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8abe54ef-2e29-4f1b-ce32-08d978044a0e
x-ms-traffictypediagnostic: AM0PR03MB6067:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB606752F5352498D34467433DE7DB9@AM0PR03MB6067.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 U0hrj6JuWIDyklB5QYetOqerMWksV4qEOZysAJ2qxV+WWYM++Fcfj5ZiJOjtbM5bUZOkqGpu7S5cYlNF+FWpNd/jKr9wb2//yVeHKrn1KswXCV7iVigV6YVzRbGEnGt41N/MKecqzpOv1xAED0UwBKXUFFPn/C0Fr9B5urVw2VRgvxjGvB6RYlnneU9PhcZvBNFkMWvnDXZy5wOlPRldeGNqAfaYYGmdEf5lkRgA2J473frP+mw7VTlgmduAmhpvBMY54h3EHK5tYbCggNXp7IrPF1R5so77EKfWSkc5eu0emymQn469XfH2pMDZJa2vkKzH+BkC02ZxXY72I7cvS/jPXOskeW65A05eD6OAf5bvFf7ldIIK1b4tsTCgoyDjJYMLKtpDA1wyAXdV/zopSKuzbm3x/fbcECElo8ufZ6Eaoskt4yZ0UhY1V0cTpb5BzzL+LBiQQx8eSeZhw+rDBgY7H1PF6vYBZB1A9sczC/MwemNiJp/9T/jaCyHWWBkp1t8/l7mVlh6Hpbh95iEncxq+wGXbflwXcnvuxkY/QLelTh7E+oCVzX0gPQSKUjFV0KMelqbbAWcrThYHnrTcBm/+9TXRoKKC5u8vuwnlqj+r2tXopUvlQyhjYtLUI4mljJn13RJ8pHV+QjohW1VU+GNdp2//BeW8ojVSY4TX65pJuvoABHrczPPoipyjw9Rrg3fNTWw/iRJI1D8/gMNu9SnlHYrWRWOEn+ZfTtUwIRvaMhK7OPmYhxZepjoH1Y9D
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(316002)(31686004)(66946007)(38070700005)(6486002)(64756008)(66556008)(66446008)(76116006)(83380400001)(66476007)(54906003)(71200400001)(8676002)(6512007)(86362001)(91956017)(2616005)(508600001)(5660300002)(8936002)(4326008)(53546011)(2906002)(6916009)(55236004)(6506007)(122000001)(38100700002)(26005)(31696002)(36756003)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cDdZdUI5QU1Ld2R0NkpYU3pRakovNmFBK0VRN00xOXNlaDFJcXVtTXRQaXpZ?=
 =?utf-8?B?T3luNlY5MnVaR1N6d2cyaGMwbzgreGxXUlZldnM5eDNMemxGeWVaamdSMXJy?=
 =?utf-8?B?bmxtNGs2cnhFUWt2d3NPWXhodWxZQVVtZkFSaytlTEJpdG5CYzJSeVVqTE5r?=
 =?utf-8?B?VVpWeXl1ZlZWSGlVV2JhTkg1dEF4VytEZGlTTmVUOGgzMVRwV1RJZWRVWFZv?=
 =?utf-8?B?OWEyLzVGQzVlMDNvVmRySmtyOGxZOGpWaEpUL29RSUtlSjdEcXl3K1pLTTkz?=
 =?utf-8?B?MUpIRVpraVI3VVlPaDFmK2dDTzFTbzhqUHN6REhCVlNWaFZmVytpNEFWd2pv?=
 =?utf-8?B?Umw3SXBMVE9HTHFwYXZDbko3KzB5K0FwRTZ0dlBxZmtMTDBUWXZwVGdEeWVs?=
 =?utf-8?B?elFmUWhiYzdQak5PYVFSRlRvanRILzJTOVArVVZvTERZWEFWWHdZSXFDeWRX?=
 =?utf-8?B?NnVPSWRRWXN4NG1GT2QzTk9ULzRrbytKTUFxUDR5UVgxT2pLL0FObC9QNy95?=
 =?utf-8?B?OGFiS3dxZ2pTb2YzbngwWENTU2U4aFVFT2pVUjROTEJFeXlhZ2lXWmV1SEla?=
 =?utf-8?B?NGV6WUFrQlZmaXdIU0FxWEhML1FKWTVrN0pkb2xGYW55cGYrWmRiZWhuaWdV?=
 =?utf-8?B?aXVCcW9RMkMxdlcvQWJxZTVIWWdHWXpmU2l5ZUJUSy8weHA4Y0VjcDdPaXgx?=
 =?utf-8?B?OWQwY3NldzlaTnhKeGpOTUtIODBuWkdNNUs1RG9rVHZyUkw5UWp6bUo0ejM0?=
 =?utf-8?B?dDBTZXF3MDg1QjdxNmNPVTNwaTRuSkRpWUhJVGh2THRMb1pvK0ttMXpiaWtD?=
 =?utf-8?B?b0k0OUpCdDQ4dDByb2JqU1FZOG1vdjBDeVp4bWFwMklrQ0V4L2Mxbm1PL2s1?=
 =?utf-8?B?QTZUQnNXWWt4R1ZmYXV0TE5Ja0tKZVRHd05TY3BJZEQveXdWaEpDV0FNR2FT?=
 =?utf-8?B?bWV0bTB3dkR2emd5NWkvQVgzWDRQY1pKeGxtN2lqTU9ibHlSN0dKd3F6OGRJ?=
 =?utf-8?B?bU5Mc1k5VXhhaW1EZ2Yyd3FRYW5ycFIwNk51VkkwUXJzM2NzcWFjNE1aLzlw?=
 =?utf-8?B?VEFGc3RaK3VTR1haYmlpdXNuMkM3WDF1Zm9GdUZERmN1c1dXTXZMZmFXT0Fy?=
 =?utf-8?B?UVYrcGQ5UUlQRlFlNEw0TGhSK3hBbUs0ckNHaDlQQVFQSWh2bHREdDFFSnJ0?=
 =?utf-8?B?Wml3V1d4WmllS2U5cGhSdlQwSGk3K1RFSHVhdDZPKzF0U0JXYk9sSU1RTWxU?=
 =?utf-8?B?dUowNzg1UThPeU9LNmNCTDNZZTN3SWdxR2x3YkFJdE9nT0lDTHhkTXlqT2R1?=
 =?utf-8?B?aVlaZnlpVWRaMWI0R2U0c0d4cEhLZDNGLzlzUFJyRXpubkROcmNXL2E5TEZY?=
 =?utf-8?B?ekhGTHlmcFRNQTNTTkdCWGJBamFPQTE0SUVUNXFQeW1Id3Uvajh4bFcyc2tV?=
 =?utf-8?B?a2VRWm9naVpHZnYrSkdXSnErVTdrUGQwWVE0aDBidXdzQ2RqeVdaSWZ2Sk5L?=
 =?utf-8?B?SkJkcS8vT0Z0OFlyWVpyY2tUZS9lTTQ4clpYRTZRSUNnd0lFa3ZSaFlWV0RI?=
 =?utf-8?B?aTIvUmZZdnBPSkdWQU5FNEZSZ2ZFOFVUTjR5U2hFNklpV0hNNmZwR25JUDlB?=
 =?utf-8?B?Q0l5cmpZOGtyM2EyKzZGK3hTbDJRWkhnTDJFcXJPOVBwSUxsUzNsNjMrMS90?=
 =?utf-8?B?Q3BOTmJ3Wmo5UCtid0ZiWDdZM01DZDZpcXFpemEvTmdSVS9FajRYczdYeE5R?=
 =?utf-8?B?Tnlvc0k4L1lMdXgwVVNta05NZHp0YlVlS2RKa2RxUDQ1K3RSSG9Oc0dTbjB3?=
 =?utf-8?B?TFplb2VRNk1CSUhoZUVVZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <77B8F6412F73A04C94A3004C389D98D9@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abe54ef-2e29-4f1b-ce32-08d978044a0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2021 04:50:06.5809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RaWENQe2/FKxxFSmxfk/i6Aai6Y9DdDxKGG9G9bnk2F+drbuLlk/LOi9Kz5xlzkSrTMMoLSDBg2K0AwuVG7Pk9a4jI7NAddolqRbelf0fdaLhkj7GAC5Z1U0ZOmbOfEq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6067
X-Proofpoint-ORIG-GUID: JE7cnbYOniPaHcYiKUpltSoIIoBXpG8c
X-Proofpoint-GUID: JE7cnbYOniPaHcYiKUpltSoIIoBXpG8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-14_10,2021-09-14_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109150029

DQpPbiAxNS4wOS4yMSAwMzoyNSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUdWUs
IDE0IFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gV2hhdCB5
b3Ugd2FudCB0byBrbm93IGlmIGhvdyBtYW55IHRpbWVzIHJlZ2lzdGVyX21taW9faGFuZGxlcigp
IHdpbGwgYmUgY2FsbGVkIGZyb20gZG9tYWluX3ZwY2lfaW5pdCgpLg0KPj4+Pg0KPj4+PiBZb3Ug
aW50cm9kdWNlZCBhIGZ1bmN0aW9uIHBjaV9ob3N0X2l0ZXJhdGVfYnJpZGdlcygpIHRoYXQgd2ls
bCB3YWxrIG92ZXIgdGhlIGJyaWRnZXMgYW5kIHRoZW4gY2FsbCB0aGUgY2FsbGJhY2sgdnBjaV9z
ZXR1cF9tbWlvX2hhbmRsZXIoKS4gU28geW91IGNvdWxkIGludHJvZHVjZSBhIG5ldyBjYWxsYmFj
ayB0aGF0IHdpbGwgcmV0dXJuIDEgaWYgYnJpZGdlLT5vcHMtPnJlZ2lzdGVyX21taW9faGFuZGxl
ciBpcyBub3QgTlVMTCBvciAwLg0KPj4+IE9rLCBjbGVhci4gU29tZXRoaW5nIGxpa2U6DQo+Pj4N
Cj4+PiAgwqDCoMKgIGlmICggKHJjID0gZG9tYWluX3ZnaWNfcmVnaXN0ZXIoZCwgJmNvdW50KSkg
IT0gMCApDQo+Pj4gIMKgwqDCoMKgwqDCoMKgIGdvdG8gZmFpbDsNCj4+Pg0KPj4+ICDCoMKgwqAg
KmZpbmQgb3V0IGhvdyBtYW55IGJyaWRnZXMgYW5kIHVwZGF0ZSBjb3VudCoNCj4+Pg0KPj4+DQo+
Pj4gIMKgwqDCoCBpZiAoIChyYyA9IGRvbWFpbl9pb19pbml0KGQsIGNvdW50ICsgTUFYX0lPX0hB
TkRMRVIpKSAhPSAwICkNCj4+PiAgwqDCoMKgwqDCoMKgwqAgZ290byBmYWlsOw0KPj4+DQo+PiBJ
IGhhdmUgdGhlIGZvbGxvd2luZyBjb2RlIG5vdzoNCj4+DQo+PiBpbnQgZG9tYWluX3ZwY2lfZ2V0
X251bV9tbWlvX2hhbmRsZXJzKHN0cnVjdCBkb21haW4gKmQpDQo+PiB7DQo+PiAgIMKgwqDCoCBp
bnQgY291bnQ7DQo+IGNvdW50IGlzIGluY3JlbWVudGVkIGJ1dCBub3QgaW5pdGlhbGl6ZWQNCkV4
Y2Vzc2l2ZSBjbGVhbnVwIGJlZm9yZSBzZW5kaW5nIDspDQo+DQo+DQo+PiAgIMKgwqDCoCBpZiAo
IGlzX2hhcmR3YXJlX2RvbWFpbihkKSApDQo+PiAgIMKgwqDCoMKgwqDCoMKgIC8qIEZvciBlYWNo
IFBDSSBob3N0IGJyaWRnZSdzIGNvbmZpZ3VyYXRpb24gc3BhY2UuICovDQo+PiAgIMKgwqDCoMKg
wqDCoMKgIGNvdW50ICs9IHBjaV9ob3N0X2dldF9udW1fYnJpZGdlcygpOw0KPj4gICDCoMKgwqAg
ZWxzZQ0KPj4gICDCoMKgwqDCoMKgwqDCoCAvKg0KPj4gICDCoMKgwqDCoMKgwqDCoMKgICogVlBD
SV9NU0lYX01FTV9OVU0gaGFuZGxlcnMgZm9yIE1TSS1YIHRhYmxlcyBwZXIgZWFjaCBQQ0kgZGV2
aWNlDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgKiBiZWluZyBwYXNzZWQgdGhyb3VnaC4gTWF4aW11
bSBudW1iZXIgb2Ygc3VwcG9ydGVkIGRldmljZXMNCj4+ICAgwqDCoMKgwqDCoMKgwqDCoCAqIGlz
IDMyIGFzIHZpcnR1YWwgYnVzIHRvcG9sb2d5IGVtdWxhdGVzIHRoZSBkZXZpY2VzIGFzIGVtYmVk
ZGVkDQo+PiAgIMKgwqDCoMKgwqDCoMKgwqAgKiBlbmRwb2ludHMuDQo+PiAgIMKgwqDCoMKgwqDC
oMKgwqAgKiArMSBmb3IgYSBzaW5nbGUgZW11bGF0ZWQgaG9zdCBicmlkZ2UncyBjb25maWd1cmF0
aW9uIHNwYWNlLiAqLw0KPj4gICDCoMKgwqDCoMKgwqDCoCBjb3VudCA9IFZQQ0lfTVNJWF9NRU1f
TlVNICogMzIgKyAxOw0KPj4gICDCoMKgwqAgcmV0dXJuIGNvdW50Ow0KPj4gfQ0KPj4NCj4+IFBs
ZWFzZSBub3RlIHRoYXQgd2UgY2Fubm90IHRlbGwgaG93IG1hbnkgUENJZSBkZXZpY2VzIGFyZSBn
b2luZyB0byBiZSBwYXNzZWQgdGhyb3VnaA0KPj4NCj4+IFNvLCB3b3JzdCBjYXNlIGZvciBEb21V
IGlzIGdvaW5nIHRvIGJlIDY1IHRvIHdoYXQgd2UgYWxyZWFkeSBoYXZlLi4uDQo+Pg0KPj4gVGhp
cyBzb3VuZHMgc2NhcnkgYSBiaXQgYXMgbW9zdCBwcm9iYWJseSB3ZSB3b24ndCBwYXNzIHRocm91
Z2ggMzIgZGV2aWNlcyBtb3N0IG9mIHRoZQ0KPj4NCj4+IHRpbWUsIGJ1dCB3aWxsIG1ha2UgZC0+
YXJjaC52bW1pby5oYW5kbGVycyBhbG1vc3QgNCB0aW1lcyBiaWdnZXIgdGhlbiBpdCBpcyBub3cu
DQo+Pg0KPj4gVGhpcyBtYXkgaGF2ZSBpbmZsdWVuY2Ugb24gdGhlIE1NSU8gaGFuZGxlcnMgcGVy
Zm9ybWFuY2UuLi4NCj4gSSBhbSBPSyB3aXRoIHRoYXQgZ2l2ZW4gdGhhdCBpdCBkb2Vzbid0IGFm
ZmVjdCBwZXJmb3JtYW5jZSB1bnRpbCB5b3UNCj4gYWN0dWFsbHkgc3RhcnQgY3JlYXRpbmcgdG9v
IG1hbnkgdmlydHVhbCBkZXZpY2VzIGZvciB0aGUgRG9tVS4gSW4gb3RoZXINCj4gd29yZHMsIGZp
bmRfbW1pb19oYW5kbGVyIHJlc3RyaWN0cyB0aGUgc2VhcmNoIHRvIHZtbWlvLT5udW1fZW50cmll
cywgc28NCj4gYXMgbG9uZyBhcyBtb3N0IGVudHJpZXMgYXJlIGFsbG9jYXRlZCBidXQgdW51c2Vk
LCB3ZSBzaG91bGQgYmUgZmluZS4NCg0KT2ssIGZpbmUsIHNvIEknbGwgaGF2ZSB0aGlzIGNoYW5n
ZSBhcyBhYm92ZSBpbiB2Mi4NCg0KVGhhbmtzLA0KDQpPbGVrc2FuZHINCg==

