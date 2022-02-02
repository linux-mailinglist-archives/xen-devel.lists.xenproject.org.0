Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1052A4A71E7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 14:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264199.457210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFz8-0005f7-GQ; Wed, 02 Feb 2022 13:47:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264199.457210; Wed, 02 Feb 2022 13:47:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFFz8-0005cG-D9; Wed, 02 Feb 2022 13:47:46 +0000
Received: by outflank-mailman (input) for mailman id 264199;
 Wed, 02 Feb 2022 13:47:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFFz7-0005cA-8R
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 13:47:45 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1b02b40-842e-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 14:47:44 +0100 (CET)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212DNlD9017992;
 Wed, 2 Feb 2022 13:47:39 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dytsxr3a5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 13:47:38 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB5361.eurprd03.prod.outlook.com (2603:10a6:20b:d2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 13:47:30 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 13:47:30 +0000
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
X-Inumbo-ID: b1b02b40-842e-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OnjhgqQSifvPtAl1+mXtHrrBQwj4YKEvi716pcZNDBxkKDU7gzvMHb+5p5125O14ygJCZsHQkspo7G6w5Jyg43le/WyPH0w0pfSQPGPifT6xAkgnjQLLccAOo7w0pHFzBS9hP6d625PD3ikA+mhfCQJKHa3G23piIIVgkvhRCz0u1ssChR67tymXrtTdCRiVYmvKWp8PheEBHJGz/s97NKSxZ5kRQ9cR/KxhuxI9+hrwfYYIPeUY58n0jzxMxdCReIk8Q4bC1c5iR2i8QBwvZ18QGT42ffGN1DFnJvvnS1vo5dQJwRG8Z46OPG6LH+WKor69vNvow2R1j49W1+4/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s6/lA93fP10M4FAaIluQ/bEW8BXxpm2V0acpTdVAvbw=;
 b=U4xcSTcDLQd6iVgomHKPSTvwaljaoNSrbniZVZKrMF+7cq/AblyNrHCuB+IP3cjD2gyyH08IWleOjkTjSing8um+VWY8M6v/DKAbT0DYcIdMtQma+KkPogY76YXgjadEYlhB/n7WjGsZh/cNIKnFsn1Dhn13EsLsLEJsOMelEcTFXAoPQa7gEywlSpQkVO9oF/FTZLD/SmXWg00xHR5Ngag2PCIdPZqNLGY9IsbkvMGbFO4vJ0odQcYXnV0Dpb2utgGk1mN0l/g9/3nlc2kl5HNPCtwjuQISSJDiSO+SCpkItbkOit+gcIbV9yDM7/dxy38VmKfxZorMVvpQfTh6+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s6/lA93fP10M4FAaIluQ/bEW8BXxpm2V0acpTdVAvbw=;
 b=O/OxHTcXsAIIAa+bwKPCF59ZII1NhSmEzzopTJl+c7gFyiCpGIadqCl/FcuISNmFPZ5NY12/HbOsZ5Zb9uvLAchoObhsW0KNCkcq/PwH+TlgNlLdERoH/VvfBkeD3yFwFNbUAvklha/R6lq83zrqeuS3RabzdSgfaNxqgpZkdU2a8QmB7L/2dFNBF2gSD0N7Gd1skY6779vj36hfr462/zLFDcNFodQLExuiW6ck8uEOshggvBbe8eBz+MTakbN6eJdp+OLqks+lxMF0KHVGw0LD1DAA3If3Mne9v8OqIv3B/xqXyFi6JEmGXtScb/fVtRSzg7hZYjFPlyrEJCOICg==
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
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Topic: [PATCH v5 09/14] vpci/header: emulate PCI_COMMAND register for
 guests
Thread-Index: AQHX4ewK3mPSKCsK30iVfRQpWoVIB6xhEugAgB+P6YCAAAvvAIAABD6A
Date: Wed, 2 Feb 2022 13:47:30 +0000
Message-ID: <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
In-Reply-To: <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2a69c6f-eea4-4fa6-3fd8-08d9e6528e81
x-ms-traffictypediagnostic: AM6PR03MB5361:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB53610669E062815C93F4B66AE7279@AM6PR03MB5361.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Dj9RQmIC/j8QTupKH9sx2T+DuzqJY4omPSGPJgG9WGbgTp/Rp9u6Pdb7ZFKXljSdebvCCSgSGbVxPNxj9rRIN0DkRYBKCKIuTeUxQCyDKk+KfATQKLrKjAwkGWp3NQY3dXjDALUceqlUicNBEQXG5SgsUx6Nhv1j2TTwU50h6+j1r15fVg6tHeOtGr8nzhncMiiLjBhMzRrIcoJFXRSSUZCFuwGow/NKbdDEHWRwQBXK9CPojSyepD+hrLbQGOC+1ajU2Nbx3zfVdd4X+xcohArfFLYYvoZxXT5A9U3qiIRWV3kTky9UFxiz2W7uXpFXvi7Y03DYNvp3DNWoJTeDuJjIpriVAbi9fLN9r5nDvuYyjc5WFtFTshLm5JTO661St+uuZ+pAQfMbFY+9k4QxKFn8xrZcK4H3+hJAA6QiOuHISX2qnzHPyHlZrZZ4aO6GO/hxe7AFUeYMMBCC7b4S6H48xxNBpuOMsnYOoYKjaj2CVTJBDIS5cbPFIaONPU133pPZUYyletvBgHuAavBwFRSmsl/ehzv/u75zsUoQ9ItFVXtdGdOhNefMXciUI3XAteGmTFHH5Azhdam4zHCwSmMZ0UAXSRM4c0yYNUCGyGq8ZMIn8VejqsT/gpZrfZYB3QFm9m1ulQfWVWdalxCK0WGCLALSdNK9841vaS+HVGhOYliffC3S18j0QnCmu5GjEzOCLtlB2K1O9ely3B8w013YzfD8ttytCt7tLbdwqIr1JO7nJQKFSEW32G/0zMWk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2906002)(8676002)(71200400001)(31696002)(38070700005)(8936002)(86362001)(26005)(36756003)(4326008)(186003)(31686004)(83380400001)(2616005)(107886003)(122000001)(7416002)(66556008)(53546011)(5660300002)(66446008)(508600001)(6486002)(38100700002)(54906003)(76116006)(6506007)(64756008)(6512007)(316002)(6916009)(66476007)(66946007)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VWZwd25IbFF1MHdnU1NNY1BZY0RPSmNrR000Zm9qUmN0YU80NmVhSE93S2dm?=
 =?utf-8?B?dWUwSUU5bm15ZkxidUJGQy9ndUU2NWh5d3N5b1VnL2U1TS9UWjY3aFlkcnZO?=
 =?utf-8?B?VDQxSFk3cWU3RHVOSDZjc0cweC82c1lxbkZRcVhBb0VTTGMxRlIxOG5nb1dT?=
 =?utf-8?B?dWhSRjFLVGRtU1l5QnBvbi9jT0FZWVZGSFNQbHdYdENWREZ4SkY0V0dBVjcy?=
 =?utf-8?B?NENybzVWNUJsRGJ1N0t1YmptUUFsWGFFUW9QcjdjVFUxNThHTTNhcm1XWGZC?=
 =?utf-8?B?SnJ3a093VzBKZmJYSWU2amlxT3duNnA1OGE0SVlyUlBXYmlaL3c5K1JYWjE1?=
 =?utf-8?B?ejdaY051UjUvL0RVdDF0eUoreG5yZXlsOTExZ01nQ1RucWVsSFQ3RWJ1blBn?=
 =?utf-8?B?N2ZHcVZ6Z2MwaGZZVXEzU2R1QzE2N09uQUFYbnVMb0pNTERHQUovVXBqdmpz?=
 =?utf-8?B?MmE3ZFdkMzk2L1lxb2NHSVRSenVXZzF6RU1Gc0sxeHRHcVA5VUx0T1ZGUy9Z?=
 =?utf-8?B?YlpoMzZzTm1mdmF4cXVGRVo3VGVmQzI2cEtQK1JtNWE1Y0FJR0wrUTlJMGt5?=
 =?utf-8?B?RE4wclhOaG15VGZkRVlMT05SRWdtdEJieHg5R1pVM2ltSUI3cTY2M1NXbTlv?=
 =?utf-8?B?cEpsZituY2JXeDI0UzI5QzdHTWZOa2ZwMWZFaHFlNE90Uk1ZOXFuRG1pQ2RH?=
 =?utf-8?B?STZhcHV1R3hZVTRiTlN5c1JtSDI5YlhNSytQYk4yL29jakZuajRzclFjVUVI?=
 =?utf-8?B?Z2JmLzdPdWVVaFFxc2pMU0FwUVEyVWliQml4L2JtaHRwaUhYY1FGTGVaR2hE?=
 =?utf-8?B?NHEzUHR5SU1YQXZEYUlQNnFzbys2dVoxaWxPbTlzd2xHREVLbGRSR20zU0ND?=
 =?utf-8?B?Y0tMbG5ZRXRyMGlmWmVsUUZxRUVJdDFmeGNMQXZNcnpLNnVlUlNtY3l4RFNX?=
 =?utf-8?B?M3hoaWFxVFRtRFpBN1dNUEpGem4vK3ZNd05VQUtJZnZFYUFrRWhKTjVKbDdw?=
 =?utf-8?B?UUpxK3FmSXlNTzBXWUZuMFVkeHQ2dVR4K21XUVI3TXorWm5lTXJUQi9LeEhw?=
 =?utf-8?B?b3FBOXo3R05xSjZrNmJ3LzlWaTNEanZBeWJsV0F4SDJ1ZGxiWnpRYi94dDFj?=
 =?utf-8?B?dE9EUVhyc0JyY0VrV1hCUlJYYlQwRkFZQm1jNlB6YzZPb0NUSTVDSHNnOG5n?=
 =?utf-8?B?WFRkV0pVbGUrYXptTmNOMzB6NlVXamJZZ0FJUEpDNXZmRWZtWlJoQ09qRmFw?=
 =?utf-8?B?VFowUEtXaXZJU0k4bEF4cjVac05OL3psSmgxTkt4RjNPOE5EQzVXMkJXalMr?=
 =?utf-8?B?TjVoUjBpVzF1V1BVYjAyc1V5ZVNlZ3IvQVB4UzBTcitHSXB2aGlDUFBnejUz?=
 =?utf-8?B?NUUraFgrcWRtb0pDL0l2MGZSc2NUeGpvd3E5cUR0a3N2T0FvSUtZTkN0TjJr?=
 =?utf-8?B?N2syODhLdzdnMUhRZU5QQmdDbnZ1eEZiQ0I0YThpS2ExcnNub1BGOUtVb3d0?=
 =?utf-8?B?VDk5cUNvZ3REbWYxT0tOQ1MrOW5mR05QL0FabkUwaFdaMXlnZ1JXemZHWjVD?=
 =?utf-8?B?djFlSEcwa1hZVjkvRjhUZU9vOHVwMzdpbVdQekx1UEZKd0J4a2VUZzltdnp2?=
 =?utf-8?B?MmtTejh6aXlERU9adkdMZXByYVN5VzlROGthLzgwNjA4cDVpT3Qyd3N0OTJ4?=
 =?utf-8?B?RERyVHR3STJ1WnI5ZGRTNitub2d2QWs0QUFTakdXRmlWellPNzJTYTI5ektV?=
 =?utf-8?B?ZHVKZHZnUGNxVXl0Y3lxc0hFbUdJTnNOaVlGR3cwaCtqdTRwcXBTY3JhamdV?=
 =?utf-8?B?R2FxMUxmekJzM05UekEvaHZDRWp0U1lQMVNsVjg4bDN5WS84ZzlOSnllVjVY?=
 =?utf-8?B?eVpXNXh5ODQrdC9iZmhSMVF1UFkwb3F0RzhRTENYQkhlRWcwR2lUc3ZrQmhq?=
 =?utf-8?B?Q21uZTFtZThyamF5QzFRcFJnaWdUTDBtYTZKUDk4bkpIQitLbGx1eUFoUm1E?=
 =?utf-8?B?NkhldWh4SW9JVEdGWmlOREt3Zmx2eG1WbnRxVC9OSUJremIxSHlxblY1dzFj?=
 =?utf-8?B?dStYc0ZYSEZoWHZiUGxmQ01PdEg0VTJuSmVOSWc2RVduV09aY1RPcVFwWmhX?=
 =?utf-8?B?d0hXZjFFbXJIVFppR3BiK1N6MENDUGFyZEZDNVlYcVlsK0kyMkJRUEl1ekEz?=
 =?utf-8?B?MnV0aHNWeXlleFVYTXhkeXlCUDZFb0dUZTZYM0x3bDhJaG9MVU83djZmOSts?=
 =?utf-8?B?KzhXMnFncjBJWXBldC81a003ZUNPcHQyaEF5dG1rV0NHcnJVL3NROHJtZ3F2?=
 =?utf-8?B?U2p0cmliaHEyaGs4SFhPSHpOZHhJMVNwU2lxTmRyaVZZbVpBYU9Zdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C34B09810ECF9F419AA156A76CC841B1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a69c6f-eea4-4fa6-3fd8-08d9e6528e81
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 13:47:30.1396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9KKZZniq6OvW2DvlBog3cxUETlHw/MVTtpfHff+O3gsca+7qW4FFkYjZPzf5p0iEozuA7U7PpeCeDpdlFyWl30y3CWxl9l+0X8rILU/Bmo2qjorAfKbba3apuky/yJoY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB5361
X-Proofpoint-GUID: JxdFqVAg8D4GozmnnM_OyeQDhM7gFlDN
X-Proofpoint-ORIG-GUID: JxdFqVAg8D4GozmnnM_OyeQDhM7gFlDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_06,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=835
 adultscore=0 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020075

DQoNCk9uIDAyLjAyLjIyIDE1OjMyLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxMzo0OSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAxMy4wMS4yMiAx
Mjo1MCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBUaHUsIE5vdiAyNSwgMjAyMSBh
dCAwMTowMjo0NlBNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jDQo+Pj4+IEBAIC00OTEsNiArNDkxLDIyIEBAIHN0YXRpYyB2b2lkIGNtZF93
cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4g
ICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIHJlZywgY21kKTsNCj4+Pj4g
ICAgfQ0KPj4+PiAgICANCj4+Pj4gK3N0YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25zdCBz
dHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5zaWduZWQgaW50IHJlZywNCj4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB1aW50MzJfdCBjbWQsIHZvaWQgKmRhdGEpDQo+Pj4+ICt7DQo+Pj4+
ICsgICAgLyogVE9ETzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBj
b21tYW5kIHJlZ2lzdGVyLiAqLw0KPj4+PiArDQo+Pj4+ICsjaWZkZWYgQ09ORklHX0hBU19QQ0lf
TVNJDQo+Pj4+ICsgICAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+IFlvdSBu
ZWVkIHRvIGNoZWNrIGZvciBNU0ktWCBhbHNvLCBwZGV2LT52cGNpLT5tc2l4LT5lbmFibGVkLg0K
Pj4gSW5kZWVkLCB0aGFuayB5b3UNCj4+Pj4gKyAgICB7DQo+Pj4+ICsgICAgICAgIC8qIEd1ZXN0
IHdhbnRzIHRvIGVuYWJsZSBJTlR4LiBJdCBjYW4ndCBiZSBlbmFibGVkIGlmIE1TSS9NU0ktWCBl
bmFibGVkLiAqLw0KPj4+PiArICAgICAgICBjbWQgfD0gUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxF
Ow0KPj4+IFlvdSB3aWxsIGFsc28gbmVlZCB0byBtYWtlIHN1cmUgUENJX0NPTU1BTkRfSU5UWF9E
SVNBQkxFIGlzIHNldCBpbiB0aGUNCj4+PiBjb21tYW5kIHJlZ2lzdGVyIHdoZW4gYXR0ZW1wdGlu
ZyB0byBlbmFibGUgTVNJIG9yIE1TSVggY2FwYWJpbGl0aWVzLg0KPj4gSXNuJ3QgaXQgZW5vdWdo
IHRoYXQgd2UganVzdCBjaGVjayBhYm92ZSBpZiBNU0kvTVNJLVggZW5hYmxlZCB0aGVuIG1ha2UN
Cj4+IHN1cmUgSU5UWCBkaXNhYmxlZD8gSSBhbSBub3QgZm9sbG93aW5nIHlvdSBoZXJlIG9uIHdo
YXQgZWxzZSBuZWVkcyB0bw0KPj4gYmUgZG9uZS4NCj4gTm8sIHlvdSBuZWVkIHRvIGRlYWwgd2l0
aCB0aGUgcG90ZW50aWFsbHkgYmFkIGNvbWJpbmF0aW9uIG9uIGJvdGgNCj4gcGF0aHMgLSBjb21t
YW5kIHJlZ2lzdGVyIHdyaXRlcyAoaGVyZSkgYW5kIE1TSS9NU0ktWCBjb250cm9sIHJlZ2lzdGVy
DQo+IHdyaXRlcyAod2hpY2ggaXMgd2hhdCBSb2dlciBwb2ludHMgeW91IGF0KS4gSSB3b3VsZCBs
aWtlIHRvIHN1Z2dlc3QNCj4gdG8gY29uc2lkZXIgc2ltcGx5IGZvcmNpbmcgSU5UWF9ESVNBQkxF
IG9uIGJlaGluZCB0aGUgZ3Vlc3QncyBiYWNrDQo+IGZvciB0aG9zZSBvdGhlciB0d28gcGF0aHMu
DQpEbyB5b3Ugc3VnZ2VzdCB0aGF0IHdlIG5lZWQgdG8gaGF2ZSBzb21lIGNvZGUgd2hpY2ggd2ls
bA0Kd3JpdGUgUENJX0NPTU1BTkQgd2hpbGUgd2Ugd3JpdGUgTVNJL01TSS1YIGNvbnRyb2wgcmVn
aXN0ZXINCmZvciB0aGF0IGtpbmQgb2YgY29uc2lzdGVuY3k/IEUuZy4gY29udHJvbCByZWdpc3Rl
ciBoYW5kbGVyIHdpbGwNCm5lZWQgdG8gd3JpdGUgdG8gUENJX0NPTU1BTkQgYW5kIGdvIHRocm91
Z2ggZW11bGF0aW9uIGZvcg0KZ3Vlc3RzPw0KDQpJZiBzbywgd2h5IGRpZG4ndCB3ZSBoYXZlIHRo
YXQgYmVmb3JlPw0KSWYgaXQgd2FzIG9rIGJlZm9yZSwgdGhlbiBJIGd1ZXNzIHRoZSBjb2RlIEkg
YWRkIGRvZXMgZW5zdXJlIElOVFgNCmlzIHNldCBpZiBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQg
fHwgcGRldi0+dnBjaS0+bXNpeC0+ZW5hYmxlZA0Kd2hpY2ggaXMgZW5vdWdoIGF0IGxlYXN0IGZv
ciBQQ0lfQ09NTUFORCB3cml0ZXMuDQoNClNvcnJ5IGlmIEkgc3RpbGwgZGlkbid0IGdldCB0byB0
aGUgcG9pbnQgaG93IHRvIGRvIHRoYXQNCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2Fu
ZHI=

