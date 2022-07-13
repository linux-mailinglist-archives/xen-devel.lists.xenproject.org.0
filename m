Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4378572FFD
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jul 2022 10:03:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.366277.596992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXLO-0002iT-BV; Wed, 13 Jul 2022 08:03:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 366277.596992; Wed, 13 Jul 2022 08:03:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBXLO-0002fq-8W; Wed, 13 Jul 2022 08:03:38 +0000
Received: by outflank-mailman (input) for mailman id 366277;
 Wed, 13 Jul 2022 08:03:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gaH=XS=epam.com=prvs=9193a7828a=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oBXLM-0002fk-8q
 for xen-devel@lists.xenproject.org; Wed, 13 Jul 2022 08:03:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a24f5ae-0282-11ed-924f-1f966e50362f;
 Wed, 13 Jul 2022 10:03:34 +0200 (CEST)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26D830BR019236;
 Wed, 13 Jul 2022 08:03:21 GMT
Received: from eur02-am5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2056.outbound.protection.outlook.com [104.47.4.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3h9f04hftp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Jul 2022 08:03:21 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS8PR03MB6744.eurprd03.prod.outlook.com (2603:10a6:20b:292::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Wed, 13 Jul
 2022 08:03:17 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5417.025; Wed, 13 Jul 2022
 08:03:17 +0000
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
X-Inumbo-ID: 4a24f5ae-0282-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EjMff4rbKfF4dIIcCZVBMlsUj2th3452paZb3CHHdqfJIdnborxgWM7Z7BOzPuNZV4VudoJwqiHunEBhhAeFzoI+PawdbT/1V0eFNSx+U+GkX1JssOrwRRVA1spp8t/kI5zLnmemOp4i59j5M7Lkp8ZnxmGzM9lDo2h5mCPN9s/lpe3+8zwm3HxabdyFxUukfVQIOUKvyL4BfYvacqFcFKQTNPBVftv6YdkMbMXnZm54kEqujhC/4FiZJwrrgoi85NKngxjfzKf0jkPk/Zgn/RsX/N8DjskLFMqQwnHS4De6pMT5HRR/hfT1yLgqGVQhmIcd0CBbrvcRNbIlrXbMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyNgUV/5mVr39DRK6kH9RT7sXF7cYf5nsnGaiX9okSE=;
 b=ckPCt4NRKtK/+104rGxfW3/kYZvI4O6JGFUmRq9Ow+zkWtwChfTBujWoN3jp/5P5+m4hVdIF72/xL5Vw8p8YXGID4jmQ+MRGfHcO5Nlr7MwJExh5R05G2+JGvj6I+tWhvL2S8QEJ8P3dCi4baiT+rdPFIslSq9K6SA/gumsXCsNoIFygKpeQar2KYowBGxtgH1HmcNXnIzqJ9FRccS715FEDA+J3VxiHX4uyZkjW8G6+I79NzsNmsLhh4Hyo3ffCU7wzJTeRpdpkZV9ErC+tVvBYb0d+Hlg94IYI7J9vTTaFBTwUeD8lDHR2pkb2utXexf/48FV6Km+uQRv1RYDUSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cyNgUV/5mVr39DRK6kH9RT7sXF7cYf5nsnGaiX9okSE=;
 b=JZLMxypZjt9aM1pxtHQuqZtz7hhHcipebfSunM3fngKjA6BFPerzYFWwsrzWlcUOrqeb6ivqJQ6ChPKNoDlmsmgRHP7DUYdBeo4ZSDnNkQg9ybVHDgT2gN1l6xuRUcB5BcNw7r6spS3awWoRZO1WRRDRgEd/cHQxdtx1wOvOPOzdI+irdjtQwYmSSn2cMvlkXzE2NzMRGTjEgVroeRyLe5M4YFrC/P0ZdREYWmesrW79S9lx40OtjqSug7qUxk+t2W3w+S3cVZlBlfGjoXfhDvbXhauSCNq/LgB8Kw1V2iTwy5B3A3MvRNOhQ9D8N1Kj3NgAaqfAd3G6uz8GTKglAQ==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: George Dunlap <George.Dunlap@citrix.com>,
        Anthony Perard
	<anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>,
        xen-devel
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
        Nick Rosbrook
	<rosbrookn@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Index: 
 AQHYf1A6pQ9CS25xdkGDIpueSgv3zq1QiHQAgAAkCwCAAwIqgIAAEjKAgAALK4CACsnJAIABrEAAgAe2TICAE6BaAIAAhq0A
Date: Wed, 13 Jul 2022 08:03:17 +0000
Message-ID: <5fa04098-a3a0-a517-ca8c-19d45ecac63e@epam.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
 <CDED6C13-E0BA-4F4F-A739-82611CF5D886@citrix.com>
In-Reply-To: <CDED6C13-E0BA-4F4F-A739-82611CF5D886@citrix.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 644ccc22-4c92-48ca-4db1-08da64a624e5
x-ms-traffictypediagnostic: AS8PR03MB6744:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M8KpPjxyWt5BRmDWa7f3vUiSYRDOxgOx8ZDKbm4RE6gC1mZuLpEb53Q4PJmRZfyzibGt1tjWNgpX6V59ZLsuoX1+6k56vJFbDjvpWaJOvCGzrnxh0M19SvdyEdiL/9NrIJqwqXq9g/hri5waMC4w7mHA3XKi5S3OVM8ySTs+v3PWwaJ5Ri4hmMbLEPgRcz50TEhuFMB/+k6mDn+8uLr6szd21qky4K0CCCLjEkjCi1hfPmzg9JeniH5DbY2GBDZphbUfTKcpXWp8N7XbEr5hQwY4Z8uS1TvzVTboVOuBt0xsvGaq/XA0NdemwWRUiKGUf1PU/ONqmiLQeP2/2FY704Ipikr2nUN46dkwfHLe/T5+33kQgBPVqwSBAmUDfR7zAM4Ijx/WIk+a9g/ciMbYq++mKWYaNSlFyebFrEtsVzUvuvZDdysgCTI+zKcePajUQkTzGJCGtudAMS6dNfNLTdiOq9FEagfFiZwBv3Qp6//K6l8JfpETEXU0Cxn7SMpCd8V8bTkKudhbudyLc3bBMsR6pviQ6w8mKw9ajM4MREix5GSSJd37tKFmxxRgKKKa0tEm8VqOMg9vi9wxg3IDI6ExeLVTA3l2v7hfde0UfpTWARK/AZYSEdfQKcKlEakT3nsfenyh49XivzGylP9/02xFJ5/gy3eqe/zDkW19J2CkxRjhrm4vVMVoQ0fO4nDyHF27ICmrKpOsBjoEKrVi8ei9DYlnxYWylaS8mWSFBpkjbns3FPdxf7yv1kPVcDqGqjGqdiG0Om41W1Iva7nTR60BQJQmykF9LTkfrFA5CnewF9Mr9SWSrlvFtU7QXcLSPXLMEBQmKhv0z+BmJFMoe+8UOaVpe1mBAWYPmoezop0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(26005)(41300700001)(55236004)(53546011)(86362001)(186003)(122000001)(2616005)(6506007)(6512007)(38070700005)(38100700002)(31696002)(316002)(7416002)(83380400001)(54906003)(66946007)(8676002)(64756008)(91956017)(71200400001)(2906002)(4326008)(36756003)(66446008)(66556008)(66476007)(6486002)(110136005)(8936002)(5660300002)(76116006)(31686004)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M1QyemFaMjdxeDB6NE84Rzd2Rno1NVRZcmtSZVo3QUxzNVE1bEpNb2haY2hj?=
 =?utf-8?B?bi91c21wczd3MU5rUTNLdTJFWElvdmo5M1k3cEVOd0NqdU9RbktQZFFFa0hX?=
 =?utf-8?B?YUZIVEx1R2ZaNnBZSVc2YWNCUzhPKzlRVENjQkpFYk9SNUJCRHdkQnh1cFNX?=
 =?utf-8?B?bDB1MkpqN0d2elFTeExtNkNMTkE2R2p1dmM1SnBLdmN5V1pnbE8xU1BkMmNC?=
 =?utf-8?B?T21TZFY5blROYjdxT1NzY2I2WUk2eVZLQ1VMS3E0anVoSWk2aWh5Q2RYSGlJ?=
 =?utf-8?B?c0RtWmFZVTR2b3Y2UHNvNzQ1VlRiZi9YbjI4SUlLazR0a1d5M3daaFl3bG9K?=
 =?utf-8?B?SE82Q3k0cHB3RXpOU0YreUg0Mlk5Ly9aQ3c2TlVncDRFRnpJNXZvTmZzQ205?=
 =?utf-8?B?anhhNzZOQ0tPRzVtYWJETllNMDArYUNqWHVBODl4ZDZBdEpCdVNBWm9qMkJ6?=
 =?utf-8?B?UnFBSEl1d1B6akwxSlRZSjJVMmZqNitrcmFndnRsaEx5VG9rOHNjdEEreFBs?=
 =?utf-8?B?L3lURmtDSEFpNC9UQzdxQXZ2b0lXNVppS2lrcTZ3STB5QncreU96cjBOYXk5?=
 =?utf-8?B?MklqQU1Rb2pIUCtnTTlUbmVDUEhjOHJiclpMdXRXai83SXRTNm5JWE5uQ3ZT?=
 =?utf-8?B?ZThkT1hlYzBGamM0T25HWUZRbWJudFhSMi82V2lTdWZDZ3I0RjAzL1RIaDVL?=
 =?utf-8?B?Ny90THNhcVBpaFc2Q0NUMHZiQytocmhBWU9CNVJaYTR1aEF4c0tVQVJGL2xX?=
 =?utf-8?B?OG85eWlPRU9wdVdjZTBxdXYwQmlSdkxGNU1remlvQXdVc0hWLzFtdDZQN1ZH?=
 =?utf-8?B?dEtUeTg4NEtBMGRWRWZtYmtlQ1ptRHBkOHVJdEtVMHV6a3ZXMXVEV0RpQitG?=
 =?utf-8?B?ZnJqczBOTzAxdUwxN1p1TUhjdWdHN0szdmZzUGpqQk1HWFNhbXVDK1MzVG1h?=
 =?utf-8?B?ZHVOOXVyeFNNSEpkUU9NSGxjT29aUEdjY0d0VE51Z0hWRlNQYWFNa3Z5TVZq?=
 =?utf-8?B?a25meXFOd1V2TWN6RXR6ZnJVR2xZSUZpZnVyTXA1SEkrSkhOL3VWOE04NVls?=
 =?utf-8?B?VmRmMXhIdzZFTjRONnBaVVJNdEpGWm1EYm5YNWNkbDgvRXlncFRwcjB4TVJO?=
 =?utf-8?B?SkVWYUp4N2tOUWg0Ukd1aUw1bFZCUUZnTE5pTXJ3VkFvK3crajhrMXFsWFhB?=
 =?utf-8?B?eGFqQmpGUWFYNUNPOEpYblgrWTBYR3Y4WFIyaVF5cldmeFVRY3N6Vlo1Q1B5?=
 =?utf-8?B?ZTNCVVltYkZMZTIyV2dzYTh0ZDlCakN4U052MXJUWWh2UHpPYzlZQTZEMGcr?=
 =?utf-8?B?ZjNKeXZ0V2VIcHpQRlpJSEhHc1Q2cFJDNlRBdC9JY3BIUzJWaTFzQTVQZVBk?=
 =?utf-8?B?eXdYZEV4SkxuZmtDcmN1c2JlRFBIYndweHVCb0ZQaEJSWWJlZTB2RjNYV3p2?=
 =?utf-8?B?a2VLc0hER2UxOVMrMzB2S1loREY4Vm9neGVSRHlQRjRGRkc0MVUwM2kxbHdQ?=
 =?utf-8?B?N3gzcjV4UGtob2NMaE9ZanlNRlBBV2FYSUhnODc2djkyZWJ1bFJYRldVOFFm?=
 =?utf-8?B?MkdBTmVCcVVBVW8wQnJHbXF5V3dJNDBsUDgxdFFyYnp4RlhldHB6MEhNVlNv?=
 =?utf-8?B?cjRJWlcrZXVCZ25iRGdmeDZSQ3ZqOVB1OVZUVzYxZG83U1A4WnlBWE81R2Jl?=
 =?utf-8?B?L0xmMWJhT01nUU9mSVZoL0NHSmJiRmtteGRIdTdXbVphOHMvbFNoTU8wdUxh?=
 =?utf-8?B?djB4TWwwSHVqN3NhcEpDblorclBabkJ3RUxVMWdqTnhQNmVNd1BqR0RrRzc3?=
 =?utf-8?B?RzNoTTdmZzhsL0VnTzZTNGdVVnhsdHJFVUxubHVwdEhHejkyNVRvTjBpNTNx?=
 =?utf-8?B?cURlWTJDcUdWaDYvenIzb2VrVFg5SzkvbDVZOWc5YisyQWltNVoxMHU2d0Q4?=
 =?utf-8?B?Mm50ZENKdFMwY3J4RE1ZUWw3d0d3ZHdXb0kreXFKdjFGc01HaFpacWRTKzV1?=
 =?utf-8?B?U0hmc1JYNGV2MWNqbnlWNGo5Wk9ndU1aQ0x1ZVBlRGdWM2hFSGl2ZDBHUDlL?=
 =?utf-8?B?TE94Zmtxd3dLdTFhMGZqWXg4ZWxjbVBYU280cmVEMzdBVVRYUHRYZGc5VVhx?=
 =?utf-8?B?RDdYd1hwM01wMzJlb0VweUdRTXlBTVNFZ3c0dTFVS3VBQ1Z5b2luTlNXTnRj?=
 =?utf-8?Q?FpsozvytEhHAtumIcjpTTVI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E2C99FC25E1ED540A27070709DDC55C6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 644ccc22-4c92-48ca-4db1-08da64a624e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2022 08:03:17.2233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IR2rfwDGp65Rg74tyBy3sUU3UKI/ESE70ZtUQ/AMLDd1BoCCn4DHZkKuRkmKn4IotOTz+k3FNiIEmHyF228chGtayENSYFdX1ZUd9zFgyog=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB6744
X-Proofpoint-GUID: xkvqQUUi1xzRXZa_VPGqAvOCPodiuiBS
X-Proofpoint-ORIG-GUID: xkvqQUUi1xzRXZa_VPGqAvOCPodiuiBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_14,2022-07-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207130034

DQpPbiAxMy4wNy4yMiAwMzowMSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCg0KSGVsbG8gR2Vvcmdl
LCBBbnRob255DQoNCj4NCj4NCj4+IE9uIDMwIEp1biAyMDIyLCBhdCAyMjoxOCwgT2xla3NhbmRy
IDxvbGVrc3R5c2hAZ21haWwuY29tPiB3cm90ZToNCj4+DQo+Pg0KPj4gRGVhciBhbGwuDQo+Pg0K
Pj4NCj4+IE9uIDI1LjA2LjIyIDE3OjMyLCBPbGVrc2FuZHIgd3JvdGU6DQo+Pj4NCj4+PiBPbiAy
NC4wNi4yMiAxNTo1OSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4+Pg0KPj4+IEhlbGxvIEdlb3Jn
ZQ0KPj4+DQo+Pj4+DQo+Pj4+PiBPbiAxNyBKdW4gMjAyMiwgYXQgMTc6MTQsIE9sZWtzYW5kciBU
eXNoY2hlbmtvIA0KPj4+Pj4gPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4NCj4+
Pj4+IEZyb206IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFt
LmNvbT4NCj4+Pj4+DQo+Pj4+PiBUaGlzIHBhdGNoIGFkZHMgYmFzaWMgc3VwcG9ydCBmb3IgY29u
ZmlndXJpbmcgYW5kIGFzc2lzdGluZyANCj4+Pj4+IHZpcnRpby1tbWlvDQo+Pj4+PiBiYXNlZCB2
aXJ0aW8tZGlzayBiYWNrZW5kIChlbXVsYXRvcikgd2hpY2ggaXMgaW50ZW5kZWQgdG8gcnVuIG91
dCBvZg0KPj4+Pj4gUWVtdSBhbmQgY291bGQgYmUgcnVuIGluIGFueSBkb21haW4uDQo+Pj4+PiBB
bHRob3VnaCB0aGUgVmlydGlvIGJsb2NrIGRldmljZSBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJvbSB0
cmFkaXRpb25hbA0KPj4+Pj4gWGVuIFBWIGJsb2NrIGRldmljZSAodmJkKSBmcm9tIHRoZSB0b29s
c3RhY2sncyBwb2ludCBvZiB2aWV3Og0KPj4+Pj4gLSBhcyB0aGUgZnJvbnRlbmQgaXMgdmlydGlv
LWJsayB3aGljaCBpcyBub3QgYSBYZW5idXMgZHJpdmVyLCBub3RoaW5nDQo+Pj4+PiB3cml0dGVu
IHRvIFhlbnN0b3JlIGFyZSBmZXRjaGVkIGJ5IHRoZSBmcm9udGVuZCBjdXJyZW50bHkgKCJ2ZGV2
Ig0KPj4+Pj4gaXMgbm90IHBhc3NlZCB0byB0aGUgZnJvbnRlbmQpLiBCdXQgdGhpcyBtaWdodCBu
ZWVkIHRvIGJlIHJldmlzZWQNCj4+Pj4+IGluIGZ1dHVyZSwgc28gZnJvbnRlbmQgZGF0YSBtaWdo
dCBiZSB3cml0dGVuIHRvIFhlbnN0b3JlIGluIG9yZGVyIHRvDQo+Pj4+PiBzdXBwb3J0IGhvdHBs
dWdnaW5nIHZpcnRpbyBkZXZpY2VzIG9yIHBhc3NpbmcgdGhlIGJhY2tlbmQgZG9tYWluIGlkDQo+
Pj4+PiBvbiBhcmNoIHdoZXJlIHRoZSBkZXZpY2UtdHJlZSBpcyBub3QgYXZhaWxhYmxlLg0KPj4+
Pj4gLSB0aGUgcmluZy1yZWYvZXZlbnQtY2hhbm5lbCBhcmUgbm90IHVzZWQgZm9yIHRoZSBiYWNr
ZW5kPC0+ZnJvbnRlbmQNCj4+Pj4+IGNvbW11bmljYXRpb24sIHRoZSBwcm9wb3NlZCBJUEMgZm9y
IFZpcnRpbyBpcyBJT1JFUS9ETQ0KPj4+Pj4gaXQgaXMgc3RpbGwgYSAiYmxvY2sgZGV2aWNlIiBh
bmQgb3VnaHQgdG8gYmUgaW50ZWdyYXRlZCBpbiBleGlzdGluZw0KPj4+Pj4gImRpc2siIGhhbmRs
aW5nLiBTbywgcmUtdXNlIChhbmQgYWRhcHQpICJkaXNrIiBwYXJzaW5nL2NvbmZpZ3VyYXRpb24N
Cj4+Pj4+IGxvZ2ljIHRvIGRlYWwgd2l0aCBWaXJ0aW8gZGV2aWNlcyBhcyB3ZWxsLg0KPj4+Pj4N
Cj4+Pj4+IEZvciB0aGUgaW1tZWRpYXRlIHB1cnBvc2UgYW5kIGFuIGFiaWxpdHkgdG8gZXh0ZW5k
IHRoYXQgc3VwcG9ydCBmb3INCj4+Pj4+IG90aGVyIHVzZS1jYXNlcyBpbiBmdXR1cmUgKFFlbXUs
IHZpcnRpby1wY2ksIGV0YykgcGVyZm9ybSB0aGUgDQo+Pj4+PiBmb2xsb3dpbmcNCj4+Pj4+IGFj
dGlvbnM6DQo+Pj4+PiAtIEFkZCBuZXcgZGlzayBiYWNrZW5kIHR5cGUgKExJQlhMX0RJU0tfQkFD
S0VORF9PVEhFUikgYW5kIHJlZmxlY3QNCj4+Pj4+IHRoYXQgaW4gdGhlIGNvbmZpZ3VyYXRpb24N
Cj4+Pj4+IC0gSW50cm9kdWNlIG5ldyBkaXNrICJzcGVjaWZpY2F0aW9uIiBhbmQgInRyYW5zcG9y
dCIgZmllbGRzIHRvIHN0cnVjdA0KPj4+Pj4gbGlieGxfZGV2aWNlX2Rpc2suIEJvdGggYXJlIHdy
aXR0ZW4gdG8gdGhlIFhlbnN0b3JlLiBUaGUgdHJhbnNwb3J0DQo+Pj4+PiBmaWVsZCBpcyBvbmx5
IHVzZWQgZm9yIHRoZSBzcGVjaWZpY2F0aW9uICJ2aXJ0aW8iIGFuZCBpdCBhc3N1bWVzDQo+Pj4+
PiBvbmx5ICJtbWlvIiB2YWx1ZSBmb3Igbm93Lg0KPj4+Pj4gLSBJbnRyb2R1Y2UgbmV3ICJzcGVj
aWZpY2F0aW9uIiBvcHRpb24gd2l0aCAieGVuIiBjb21tdW5pY2F0aW9uDQo+Pj4+PiBwcm90b2Nv
bCBiZWluZyBkZWZhdWx0IHZhbHVlLg0KPj4+Pj4gLSBBZGQgbmV3IGRldmljZSBraW5kIChMSUJY
TF9fREVWSUNFX0tJTkRfVklSVElPX0RJU0spIGFzIGN1cnJlbnQNCj4+Pj4+IG9uZSAoTElCWExf
X0RFVklDRV9LSU5EX1ZCRCkgZG9lc24ndCBmaXQgaW50byBWaXJ0aW8gZGlzayBtb2RlbA0KPj4+
Pj4NCj4+Pj4+IEFuIGV4YW1wbGUgb2YgZG9tYWluIGNvbmZpZ3VyYXRpb24gZm9yIFZpcnRpbyBk
aXNrOg0KPj4+Pj4gZGlzayA9IFsgJ3BoeTovZGV2L21tY2JsazBwMywgeHZkYTEsIGJhY2tlbmR0
eXBlPW90aGVyLCANCj4+Pj4+IHNwZWNpZmljYXRpb249dmlydGlvJ10NCj4+Pj4+DQo+Pj4+PiBO
b3RoaW5nIGhhcyBjaGFuZ2VkIGZvciBkZWZhdWx0IFhlbiBkaXNrIGNvbmZpZ3VyYXRpb24uDQo+
Pj4+Pg0KPj4+Pj4gUGxlYXNlIG5vdGUsIHRoaXMgcGF0Y2ggaXMgbm90IGVub3VnaCBmb3Igdmly
dGlvLWRpc2sgdG8gd29yaw0KPj4+Pj4gb24gWGVuIChBcm0pLCBhcyBmb3IgZXZlcnkgVmlydGlv
IGRldmljZSAoaW5jbHVkaW5nIGRpc2spIHdlIG5lZWQNCj4+Pj4+IHRvIGFsbG9jYXRlIFZpcnRp
byBNTUlPIHBhcmFtcyAoSVJRIGFuZCBtZW1vcnkgcmVnaW9uKSBhbmQgcGFzcw0KPj4+Pj4gdGhl
bSB0byB0aGUgYmFja2VuZCwgYWxzbyB1cGRhdGUgR3Vlc3QgZGV2aWNlLXRyZWUuIFRoZSBzdWJz
ZXF1ZW50DQo+Pj4+PiBwYXRjaCB3aWxsIGFkZCB0aGVzZSBtaXNzaW5nIGJpdHMuIEZvciB0aGUg
Y3VycmVudCBwYXRjaCwNCj4+Pj4+IHRoZSBkZWZhdWx0ICJpcnEiIGFuZCAiYmFzZSIgYXJlIGp1
c3Qgd3JpdHRlbiB0byB0aGUgWGVuc3RvcmUuDQo+Pj4+PiBUaGlzIGlzIG5vdCBhbiBpZGVhbCBz
cGxpdHRpbmcsIGJ1dCB0aGlzIHdheSB3ZSBhdm9pZCBicmVha2luZw0KPj4+Pj4gdGhlIGJpc2Vj
dGFiaWxpdHkuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIFR5c2hjaGVu
a28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+PiBPSywgSSBhbSAqcmVhbGx5
KiBzb3JyeSBmb3IgY29taW5nIGluIGhlcmUgYXQgdGhlIGxhc3QgbWludXRlIGFuZCANCj4+Pj4g
cXVpYmJsaW5nIGFib3V0IHRoaW5ncy4NCj4+Pg0KPj4+DQo+Pj4gbm8gcHJvYmxlbQ0KPj4+DQo+
Pj4NCj4+Pj4gQnV0IHRoaXMgaW50cm9kdWNlcyBhIHB1YmxpYyBpbnRlcmZhY2Ugd2hpY2ggbG9v
a3MgcmVhbGx5IHdyb25nIHRvIA0KPj4+PiBtZS7CoCBJ4oCZdmUgcmVwbGllZCB0byB0aGUgbWFp
bCBmcm9tIERlY2VtYmVyIHdoZXJlIEp1ZXJnZW4gcHJvcG9zZWQgDQo+Pj4+IHRoZSDigJxPdGhl
cuKAnSBwcm90b2NvbC4NCj4+Pj4NCj4+Pj4gSG9wZWZ1bGx5IHRoaXMgd2lsbCBiZSBhIHNpbXBs
ZSBtYXR0ZXIgb2YgZmluZGluZyBhIGJldHRlciBuYW1lIA0KPj4+PiB0aGFuIOKAnG90aGVy4oCd
LiAoT3IgeW91IGd1eXMgY29udmluY2luZyBtZSB0aGF0IOKAnG90aGVy4oCdIGlzIHJlYWxseSB0
aGUgDQo+Pj4+IGJlc3QgbmFtZSBmb3IgdGhpcyB2YWx1ZTsgb3IgZXZlbiBBbnRob255IGFzc2Vy
dGluZyBoaXMgcmlnaHQgYXMgYSANCj4+Pj4gbWFpbnRhaW5lciB0byBvdmVycnVsZSBteSBvYmpl
Y3Rpb24gaWYgaGUgdGhpbmtzIEnigJltIG91dCBvZiBsaW5lLikNCj4+Pg0KPj4+DQo+Pj4gSSBz
YXcgeW91ciByZXBseSB0byBWNiBhbmQgSnVlcmdlbidzIGFuc3dlci4gSSBzaGFyZSBKdWVyZ2Vu
J3MgDQo+Pj4gb3BpbmlvbiBhcyB3ZWxsIGFzIEkgdW5kZXJzdGFuZCB5b3VyIGNvbmNlcm4uIEkg
dGhpbmssIHRoaXMgaXMgDQo+Pj4gZXhhY3RseSB0aGUgc2l0dWF0aW9uIHdoZW4gZmluZGluZyBh
IHBlcmZlY3QgbmFtZSAob2J2aW91cywgc2hvcnQsIA0KPj4+IGV0YykgZm9yIHRoZSBiYWNrZW5k
dHlwZSAoaW4gb3VyIHBhcnRpY3VsYXIgY2FzZSkgaXMgcmVhbGx5IGRpZmZpY3VsdC4NCj4+Pg0K
Pj4+IFBlcnNvbmFsbHkgSSB0ZW5kIHRvIGxlYXZlICJvdGhlciIsIGJlY2F1c2UgdGhlcmUgaXMg
bm8gYmV0dGVyIA0KPj4+IGFsdGVybmF0aXZlIGZyb20gbXkgUG9WLiBBbHNvIEkgbWlnaHQgYmUg
Y29tcGxldGVseSB3cm9uZyBoZXJlLCBidXQgDQo+Pj4gSSBkb24ndCB0aGluayB3ZSB3aWxsIGhh
dmUgdG8gZXh0ZW5kIHRoZSAiYmFja2VuZHR5cGUiIGZvciANCj4+PiBzdXBwb3J0aW5nIG90aGVy
IHBvc3NpYmxlIHZpcnRpbyBiYWNrZW5kIGltcGxlbWVudGF0aW9ucyBpbiB0aGUgDQo+Pj4gZm9y
ZXNlZWFibGUgZnV0dXJlOg0KPj4+DQo+Pj4gLSB3aGVuIFFlbXUgZ2FpbnMgdGhlIHJlcXVpcmVk
IHN1cHBvcnQgd2Ugd2lsbCBjaG9vc2UgcWRpc2s6IA0KPj4+IGJhY2tlbmR0eXBlIHFkaXNrIHNw
ZWNpZmljYXRpb24gdmlydGlvDQo+Pj4gLSBmb3IgdGhlIHBvc3NpYmxlIHZpcnRpbyBhbHRlcm5h
dGl2ZSBvZiB0aGUgYmxrYmFjayB3ZSB3aWxsIGNob29zZSANCj4+PiBwaHk6IGJhY2tlbmR0eXBl
IHBoeSBzcGVjaWZpY2F0aW9uIHZpcnRpbw0KPj4+DQo+Pj4gSWYgdGhlcmUgd2lsbCBiZSBhIG5l
ZWQgdG8ga2VlcCB2YXJpb3VzIGltcGxlbWVudGF0aW9uLCB3ZSB3aWxsIGJlIA0KPj4+IGFibGUg
dG8gZGVzY3JpYmUgdGhhdCBieSB1c2luZyAidHJhbnNwb3J0IiAobW1pbywgcGNpLCB4ZW5idXMs
IGFyZ28sIA0KPj4+IHdoYXRldmVyKS4NCj4+PiBBY3R1YWxseSB0aGlzIGlzIHdoeSB3ZSBhbHNv
IGludHJvZHVjZWQgInNwZWNpZmljYXRpb24iIGFuZCAidHJhbnNwb3J0Ii4NCj4+Pg0KPj4+IElJ
UkMsIHRoZXJlIHdlcmUgb3RoZXIgKHN1Z2dlc3RlZD8pIG5hbWVzIGV4Y2VwdCAib3RoZXIiIHdo
aWNoIGFyZSANCj4+PiAiZXh0ZXJuYWwiIGFuZCAiZGFlbW9uIi4gSWYgeW91IHRoaW5rIHRoYXQg
b25lIG9mIHRoZW0gaXMgYmV0dGVyIA0KPj4+IHRoYW4gIm90aGVyIiwgSSB3aWxsIGhhcHB5IHRv
IHVzZSBpdC4NCj4+DQo+Pg0KPj4gQ291bGQgd2UgcGxlYXNlIG1ha2UgYSBkZWNpc2lvbiBvbiB0
aGlzPw0KPj4NCj4+IElmICJvdGhlciIgaXMgbm90IHVuYW1iaWd1b3VzLCB0aGVuIG1heWJlIHdl
IGNvdWxkIGNob29zZSAiZGFlbW9uIiB0byANCj4+IGRlc2NyaWJlIGFyYml0cmFyeSB1c2VyLWxl
dmVsIGJhY2tlbmRzLCBhbnkgdGhvdWdodD8NCj4NCj4gVW5mb3J0dW5hdGVseSBJIGRpZG7igJl0
IGhhdmUgdGltZSB0byBkaWcgaW50byB0aGlzOyBJ4oCZbSBqdXN0IGdvaW5nIHRvIA0KPiBoYXZl
IHRvIHdpdGhkcmF3IG15IG9iamVjdGlvbiwgYW5kIGxldCB5b3UgJiBKdWVyZ2VuIGRlY2lkZSB3
aGF0IHRvIA0KPiBjYWxsIGl0Lg0KDQpHZW9yZ2UsIHRoYW5rcyBmb3IgbGV0dGluZyBtZSBrbm93
LiBKdWVyZ2VuIHByb3Bvc2VkIHRvIHVzZSAic3RhbmRhbG9uZSIgDQpmb3IgdGhlIG5ldyBiYWNr
ZW5kdHlwZSBuYW1lIHdoaWNoIGlzIGZhciBtb3JlIHNwZWNpZmljLiBJIGFncmVlIHdpdGggdGhh
dC4NCg0KDQpBbnRob255LCB3b3VsZCB5b3UgYmUgaGFwcHkgd2l0aCB0aGF0IHJlbmFtaW5nPw0K
DQoNCg0KPg0KPiBSZSB0aGUgZ29sYW5nIGNoYW5nZXM6DQo+DQo+IEFja2VkLWJ5OiBHZW9yZ2Ug
RHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+DQoNCg0KVGhhbmtzLg0KDQoNCi0tIA0K
UmVnYXJkcywNCg0KT2xla3NhbmRyIFR5c2hjaGVua28NCg==

