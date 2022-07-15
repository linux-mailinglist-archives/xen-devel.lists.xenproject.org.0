Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199455764E0
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 18:01:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368337.599565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNl0-0002R1-4H; Fri, 15 Jul 2022 16:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368337.599565; Fri, 15 Jul 2022 16:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCNl0-0002OO-1W; Fri, 15 Jul 2022 16:01:34 +0000
Received: by outflank-mailman (input) for mailman id 368337;
 Fri, 15 Jul 2022 16:01:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Lfc=XU=epam.com=prvs=9195ef3d5c=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1oCNky-0002OI-7Y
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 16:01:32 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6370782a-0457-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 18:01:30 +0200 (CEST)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26FFtkna011845;
 Fri, 15 Jul 2022 16:01:18 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2105.outbound.protection.outlook.com [104.47.18.105])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hbb3sr1yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Jul 2022 16:01:17 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM0PR03MB6305.eurprd03.prod.outlook.com (2603:10a6:20b:157::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Fri, 15 Jul
 2022 16:01:14 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::d87f:d45e:b2c6:c21%6]) with mapi id 15.20.5417.025; Fri, 15 Jul 2022
 16:01:14 +0000
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
X-Inumbo-ID: 6370782a-0457-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kraK0fSSzdxyopmb4cQHDS+gtBL2XnTpbOoiSe6eAYF4Osy7cufwwcqEtTXaE6AgXOJqARKInxTGR7WJsINchTKW5fgd6ge6kw7y6vCz+l4KwLhIwLwW2xLQgNQ/MRmFITsI9sYxNF6sbxg8m2TKqdeYUlNees6+EglAs+0gySF1/scfVfAlgkg7ppQx48H8VtHoCnY2fLUB9y6oDzKKVjjM4kGzOi57+vm9CSagMTdi/e+8b/UvywCnhMLgeAo2yKw2umu4S8aLqUAAPJXrVa3J84qJNGWChRPh+EPg/h69a5xmUWx2U94O5fYEyPBWzpzGLxbuTRFWfkOuemS7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g1N3b3ss6ufPPPiM5WhnX2Q/E0tcdmdSa5I/vjSC9r0=;
 b=Uqx6sZWmeDuPSIGrJxSUer3npFAKorpscDxYcL6QJwbSOl1aUR9Ezq+zjQzNZp1X0UE3N9+bb5JMXrzkptyclImxOZDlZ/5j/yrOxTVrRhOlxGasKIMfvnm7YlnEB3gjbcebfOlsMQQPsFKayU08IYvCjntjDMUtLdTu5cfsbAaFfZaXhzvwhcPhvI4zu6tDgPcnhfgTQfvWadK5/hY0TyzMoozcl/VW2sSu6R7tGwlVko0hqUpNLULB7neXs1YKsETng9SXs2DQ1kN91oDx5DvNyE+pnRurDeZ110xgyF381g0ZgZT8YZ5gHYjmHjsMvY/yiLG3ZncV7+yvsto3Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g1N3b3ss6ufPPPiM5WhnX2Q/E0tcdmdSa5I/vjSC9r0=;
 b=DyS0ifDfh9CQfPq+SZ1bCJ+Ci3U2LVHTDL07IgaWPZ42I8UtRN7xofqrXtFl0rNfrliJQqPdzov43FmqrvGh71tZpKzpJBXXiSbMP+LvKGWvl8dYd8xtT3hFLN+Jp+iQDrzqbtfPQ8PMkhSzPc0NqhZsn4DdSwNs9LQ/0h8P2hBM37UEt2RtSW0SsyCH6HXTo11n6QWneH4FDXhJnyxuRGe6AgdwZfrfV4GHT9dj13DQPkKuJ5WYfj6RcEGf9laOWhbdHrgp3iwLJHFM3pHncLfEeCfCEpgik19DZy5Aeuxwl51M/Sj3bc2DiQQYrrMOhF783rXi9shh16+pBnTVsg==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: George Dunlap <George.Dunlap@citrix.com>, Juergen Gross <jgross@suse.com>,
        xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
        Nick
 Rosbrook <rosbrookn@gmail.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Oleksandr <olekstysh@gmail.com>
Subject: Re: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Topic: [PATCH V10 1/3] libxl: Add support for Virtio disk configuration
Thread-Index: 
 AQHYf1A6pQ9CS25xdkGDIpueSgv3zq1QiHQAgAAkCwCAAwIqgIAAEjKAgAALK4CACsnJAIABrEAAgAe2TICAE6BaAIAAhq0AgAOgCICAAAosgA==
Date: Fri, 15 Jul 2022 16:01:14 +0000
Message-ID: <8301452f-04ba-9060-9b8c-c4421318469c@epam.com>
References: <62903b8e-6c20-600e-8283-5a3e3b853a18@gmail.com>
 <1655482471-16850-1-git-send-email-olekstysh@gmail.com>
 <9A36692A-8095-4C76-A69B-FBAB221A365C@citrix.com>
 <02648046-7781-61e5-de93-77342e4d6c16@gmail.com>
 <36d4c786-9fb7-4b30-1a4d-171f92cc84d7@gmail.com>
 <CDED6C13-E0BA-4F4F-A739-82611CF5D886@citrix.com>
 <5fa04098-a3a0-a517-ca8c-19d45ecac63e@epam.com>
 <YtGGwUqzgtJYt1Qi@perard.uk.xensource.com>
In-Reply-To: <YtGGwUqzgtJYt1Qi@perard.uk.xensource.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43af0be4-75b2-48cd-3c38-08da667b3ed1
x-ms-traffictypediagnostic: AM0PR03MB6305:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 b9QhWMWs0kvvD84ZadbDCEaf9mpyz0zUKdaaN7CFURfMMkLKwOQXaSSA6OvDNvN88sR+bX9rgJokHMR4cmyEurjZOis/PAHgS9a/2s4QnY+mhoCXnLheurPfyUHHIb+wXIuTPrZtSMN24lVSzrzqETDI45/nzP0RGxNEYPWUuruAQYCH2cvZ8D52ucrtK6zcZhHoXxnV+hP7ryieWetguPzWa7b2/XOYtJzDLw8gi1NQp9aYHM2YFmlXXWHcn3CkQiiBIFQTc0zYibiZnvPq38xsfycOUoAqWI0lIs5g+SlgxjPxv0hKgAYBGc2kmrMbuQhyZ7LnkxgOxcRbnpLzFsR2upyBAV/rjfPfPyLNZA+OHpyu+FlHcKwxRBE4hPKzMfKaFktvsrRCezTz+w4TstBkRzgDH3gRWXHEgv+VWkTChmqb4aK/X6AKHyY/jY2920wLAW5Ik1jAzoIbHkXAob20IKLhHJI1PoA+u6j+JfWeRk8y8ph/rCh2oPqWX9E09hFyYMTIMFye0F67oEgIgN6ZN3pL3FUsfyGqm675qiEZbqakXTodcAigo0J55ZFZIJeLVOsKHh//LbLry0TKnn+Q4K48RvjV95TGE3LEtgswdWVuJX9Bp1Kvq45SXDUSyrZvjPIGQQQKJawZSsrtoAFP9qJtZQucJuZbBskSZ3UUkUoZnHPAYReIpjQPpO54XWH7E4vgNqhFTlsFbufPdj6Fs5wCcE4K66K8iaKrjFjsYQgcCya5MecB1tJPym419uv3R9gCVtBM1MdcdaiG6CBRuzXjdbP1D/bVXUcGMsvRCC1mIbPJcxdW7JfiA8Ep+AgDrAFWV4e0wcuimAK6zQp4G5cRIq22tCcXS+JstY4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(39860400002)(136003)(366004)(55236004)(53546011)(2616005)(186003)(83380400001)(26005)(4326008)(5660300002)(6512007)(2906002)(7416002)(6506007)(478600001)(31686004)(71200400001)(41300700001)(36756003)(8936002)(54906003)(6486002)(6916009)(31696002)(38070700005)(316002)(91956017)(66556008)(66476007)(76116006)(122000001)(86362001)(38100700002)(8676002)(66946007)(66446008)(64756008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RTBUNXZpZ1haQjkxM0NOU0thcEFPVEZOSTB0bDgvcHJCREIvVkpGVWJ4TDl6?=
 =?utf-8?B?VGh1a3NORzYzQWE4NndLY1djRlJCSUlMdktFaTgrT0JmZkhCY2djRE42V2Q4?=
 =?utf-8?B?UG53NkVVMjJCV0thSmwyS2h4ZGlMdURIUVBhOVBFakJGa09yYVhwd3BsNnVL?=
 =?utf-8?B?WmhBYnM0T2g3eEtPazc5ZTR3ZENoOHBpRVNyQ0RVck1rTG14OW1YdS9YRk1X?=
 =?utf-8?B?YU5LMVJqYW9ubmUrZ05zelBlZVFNVjQ3UXNuSUh5QkNUcWdyQXZkM1JIcDNJ?=
 =?utf-8?B?MGlmck1DTUxmZE9uQ2NabjloRXUzOGdnYWU3ZHd1YklGUDhNall4ZWNlVUdW?=
 =?utf-8?B?WWJ5bkNSM3JVUkJOMkFmWHJsbzhFbll4OXlndW5JdUQwbXY5MVFKSGxpak1P?=
 =?utf-8?B?cGdxbFB1UTlnWUFyYTNIcXkzRWMrcmdSNHpyMUZBNmZiMFRabEcrdnJJL2JY?=
 =?utf-8?B?R09LdjdIL0JsSVBtYmR1QW5oQkxMNC9jM0dyTDdBWXpKQ2VLb3RIUmNPVzZL?=
 =?utf-8?B?U1d2blcvWWZFY0gwTGJ4YW1NZEVZRlY1QmdwVWlQdCtrWkpmM1BMaXJmM1JB?=
 =?utf-8?B?SklTSGpGV2dGVU5kQjdRTHVuaE9ZczVsMkIzdjIvWjlQSW8xejhIaTdGbXVL?=
 =?utf-8?B?ckFNUVkrYmx2RjNFcHVweDFoQVlyNmRJeFVmejdXWmpPazQrcmxrajVIMDlE?=
 =?utf-8?B?bTJQV29VNUtJS3kvRzhXZC9Oa05sVXFpT2xRdW1LOUJqdmRDQVp4ZU5VT0F5?=
 =?utf-8?B?a1hSZ1BSZjZNelY4b1ZicHdZU1RtUUw5WmJldlNMOXBFUVJ6YzJGcFI1UXo4?=
 =?utf-8?B?clN6VS92aFJ3SHBuaTgrKzlNZUNQYnYzOCtITFVhNk1IT3llb3piaGdUVW54?=
 =?utf-8?B?Y0c4ZXNMN2kwOXg0SFhXaFlaa0dDOHRNTGdzUXhhSW5KbDhNNElyOHlPMnVZ?=
 =?utf-8?B?T0hxNWN1WFl5UzZmL09iK0lVaHpEQmdXY2VLS1dPWVBiK080MklWREtWV0lI?=
 =?utf-8?B?N3M4RGxuN0QzeVpwZ1lZSmk2RS84ZGplRHJ4T0kyL0FYWXF1ZXhSRTFWcGJa?=
 =?utf-8?B?WC9GcFFVZS9aOTVtVDNOWGFJN04yNXNNMGYvZjUrZTNhU0ZNQXRCbUxsM2Zp?=
 =?utf-8?B?aWlZalhURWszaVNtSlJORU9nUDVoZmlHQ3lnY2tUN1JmOG5HR0FkQjlRY2Ry?=
 =?utf-8?B?U0h6cWJvSVg3VXpUeUZSNVF1TGliTndWNGJkQ3R0Vk1vMFZxSzZIRDZsaDYy?=
 =?utf-8?B?T2Evencxd3NScVRwTndNOFFnZno0cG1ubTgwZU4xUGlrTjZldnhPaTUzdTE0?=
 =?utf-8?B?MGY2c2lqTmlYVXZ4YVgyTmhMbWpCenV4RjBaWWRkai9JeEdpdXpEaU1weXBI?=
 =?utf-8?B?SVdraEFDMzRUY3EzWFdGbEQ1c21OdldPZmEvZmZPVnhmQVlJUCtnNGxVK0xu?=
 =?utf-8?B?SlM2a1p1MjJxNFNjQ2ErMTFZaHBVM0NoVno1ZjB4UTVkMlR1bjZ5ZGVSdklP?=
 =?utf-8?B?WkJySjU3UEVackdCdmZFMVQvbDNjQWxLc2ttejVub3NNL1pNRldhL1FaQUI5?=
 =?utf-8?B?Y05JYlluQlhWRHMxRWs4dzRLaTBzb2dNSElVNTlhZ2VIV1ZQcVFuV2VEYVIx?=
 =?utf-8?B?Y3hRbzZEYW5ZWjdyc0NHVEdDT3A2bjFBRC9WUllFa2hGTHZNQ0krZy9KZnZS?=
 =?utf-8?B?dmt6UEIzWXVPQ2EwM1YzR0VLQ1JWYUZHTTNBOXRIUDdVVTltT01SandmckRl?=
 =?utf-8?B?cURPYXJ3N1Uxd3RxYjhNaWxyYTdpcCtCMERTa0dnTmhjd0RoM2JHOFk1ckgv?=
 =?utf-8?B?U1B0TFZrTnY5OVBXZ3lxb1F1TnhzMjBBUld0bERQbUdRNmZ2MTljKzh0UURr?=
 =?utf-8?B?TTBveEpvU3kzUWJQZTZkOXVmbmwvTVpjYjNFelFWTW1EVDkzeEpyS1FYeFhz?=
 =?utf-8?B?UUkzYWJlaitpVnEzdjVxaU5aazh3TEoyb2FHYzNMK2NGSE9LUTU0UnVSRlEr?=
 =?utf-8?B?SFp4VUlLVk1JajdTY2lhOEZXM0tnL1hweUFRRFltUXQ1OUJDbEFxSG1ML3Nl?=
 =?utf-8?B?Wm43Uks4dzF5aHZPdkRRZFRuUDBKazhvRGRLZHZrVzlBc2FpZnYxYnVWSWNh?=
 =?utf-8?B?amgzRmJaNUQ0WThqRlc4ZW4vMExXSnU5TU1Dcmgxdi94dEJlcVVTRG85YlBy?=
 =?utf-8?Q?1EYFDMCNNoYuhyYsPOHs0C0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6491594FCEFAD04A9402D8B0D2EC1079@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43af0be4-75b2-48cd-3c38-08da667b3ed1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2022 16:01:14.6944
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOvMLbbzARV7yK4IkHb8bsm9WLfkyaM+RWGUo5UjlMzF4WChaYDgnJIVH1GWaEge6MzZjL34cLdZ5/tSHi3UaDOcuzCK/S8hEBKhVF9JYVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB6305
X-Proofpoint-GUID: b_2xI2OEdjlMLZDyKniWJJDQCPOFs22a
X-Proofpoint-ORIG-GUID: b_2xI2OEdjlMLZDyKniWJJDQCPOFs22a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-15_09,2022-07-15_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207150071

DQpPbiAxNS4wNy4yMiAxODoyNCwgQW50aG9ueSBQRVJBUkQgd3JvdGU6DQoNCg0KSGVsbG8gQW50
aG9ueQ0KDQo+IE9uIFdlZCwgSnVsIDEzLCAyMDIyIGF0IDA4OjAzOjE3QU0gKzAwMDAsIE9sZWtz
YW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPj4gT24gMTMuMDcuMjIgMDM6MDEsIEdlb3JnZSBEdW5s
YXAgd3JvdGU6DQo+Pg0KPj4gSGVsbG8gR2VvcmdlLCBBbnRob255DQo+Pg0KPj4+DQo+Pj4+IE9u
IDMwIEp1biAyMDIyLCBhdCAyMjoxOCwgT2xla3NhbmRyIDxvbGVrc3R5c2hAZ21haWwuY29tPiB3
cm90ZToNCj4+Pj4NCj4+Pj4NCj4+Pj4gRGVhciBhbGwuDQo+Pj4+DQo+Pj4+DQo+Pj4+IE9uIDI1
LjA2LjIyIDE3OjMyLCBPbGVrc2FuZHIgd3JvdGU6DQo+Pj4+PiBPbiAyNC4wNi4yMiAxNTo1OSwg
R2VvcmdlIER1bmxhcCB3cm90ZToNCj4+Pj4+DQo+Pj4+PiBIZWxsbyBHZW9yZ2UNCj4+Pj4+DQo+
Pj4+Pj4+IE9uIDE3IEp1biAyMDIyLCBhdCAxNzoxNCwgT2xla3NhbmRyIFR5c2hjaGVua28NCj4+
Pj4+Pj4gPG9sZWtzdHlzaEBnbWFpbC5jb20+IHdyb3RlOg0KPj4+Pj4+Pg0KPj4+Pj4+PiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+DQo+
Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgcGF0Y2ggYWRkcyBiYXNpYyBzdXBwb3J0IGZvciBjb25maWd1
cmluZyBhbmQgYXNzaXN0aW5nDQo+Pj4+Pj4+IHZpcnRpby1tbWlvDQo+Pj4+Pj4+IGJhc2VkIHZp
cnRpby1kaXNrIGJhY2tlbmQgKGVtdWxhdG9yKSB3aGljaCBpcyBpbnRlbmRlZCB0byBydW4gb3V0
IG9mDQo+Pj4+Pj4+IFFlbXUgYW5kIGNvdWxkIGJlIHJ1biBpbiBhbnkgZG9tYWluLg0KPj4+Pj4+
PiBBbHRob3VnaCB0aGUgVmlydGlvIGJsb2NrIGRldmljZSBpcyBxdWl0ZSBkaWZmZXJlbnQgZnJv
bSB0cmFkaXRpb25hbA0KPj4+Pj4+PiBYZW4gUFYgYmxvY2sgZGV2aWNlICh2YmQpIGZyb20gdGhl
IHRvb2xzdGFjaydzIHBvaW50IG9mIHZpZXc6DQo+Pj4+Pj4+IC0gYXMgdGhlIGZyb250ZW5kIGlz
IHZpcnRpby1ibGsgd2hpY2ggaXMgbm90IGEgWGVuYnVzIGRyaXZlciwgbm90aGluZw0KPj4+Pj4+
PiB3cml0dGVuIHRvIFhlbnN0b3JlIGFyZSBmZXRjaGVkIGJ5IHRoZSBmcm9udGVuZCBjdXJyZW50
bHkgKCJ2ZGV2Ig0KPj4+Pj4+PiBpcyBub3QgcGFzc2VkIHRvIHRoZSBmcm9udGVuZCkuIEJ1dCB0
aGlzIG1pZ2h0IG5lZWQgdG8gYmUgcmV2aXNlZA0KPj4+Pj4+PiBpbiBmdXR1cmUsIHNvIGZyb250
ZW5kIGRhdGEgbWlnaHQgYmUgd3JpdHRlbiB0byBYZW5zdG9yZSBpbiBvcmRlciB0bw0KPj4+Pj4+
PiBzdXBwb3J0IGhvdHBsdWdnaW5nIHZpcnRpbyBkZXZpY2VzIG9yIHBhc3NpbmcgdGhlIGJhY2tl
bmQgZG9tYWluIGlkDQo+Pj4+Pj4+IG9uIGFyY2ggd2hlcmUgdGhlIGRldmljZS10cmVlIGlzIG5v
dCBhdmFpbGFibGUuDQo+Pj4+Pj4+IC0gdGhlIHJpbmctcmVmL2V2ZW50LWNoYW5uZWwgYXJlIG5v
dCB1c2VkIGZvciB0aGUgYmFja2VuZDwtPmZyb250ZW5kDQo+Pj4+Pj4+IGNvbW11bmljYXRpb24s
IHRoZSBwcm9wb3NlZCBJUEMgZm9yIFZpcnRpbyBpcyBJT1JFUS9ETQ0KPj4+Pj4+PiBpdCBpcyBz
dGlsbCBhICJibG9jayBkZXZpY2UiIGFuZCBvdWdodCB0byBiZSBpbnRlZ3JhdGVkIGluIGV4aXN0
aW5nDQo+Pj4+Pj4+ICJkaXNrIiBoYW5kbGluZy4gU28sIHJlLXVzZSAoYW5kIGFkYXB0KSAiZGlz
ayIgcGFyc2luZy9jb25maWd1cmF0aW9uDQo+Pj4+Pj4+IGxvZ2ljIHRvIGRlYWwgd2l0aCBWaXJ0
aW8gZGV2aWNlcyBhcyB3ZWxsLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBGb3IgdGhlIGltbWVkaWF0ZSBw
dXJwb3NlIGFuZCBhbiBhYmlsaXR5IHRvIGV4dGVuZCB0aGF0IHN1cHBvcnQgZm9yDQo+Pj4+Pj4+
IG90aGVyIHVzZS1jYXNlcyBpbiBmdXR1cmUgKFFlbXUsIHZpcnRpby1wY2ksIGV0YykgcGVyZm9y
bSB0aGUNCj4+Pj4+Pj4gZm9sbG93aW5nDQo+Pj4+Pj4+IGFjdGlvbnM6DQo+Pj4+Pj4+IC0gQWRk
IG5ldyBkaXNrIGJhY2tlbmQgdHlwZSAoTElCWExfRElTS19CQUNLRU5EX09USEVSKSBhbmQgcmVm
bGVjdA0KPj4+Pj4+PiB0aGF0IGluIHRoZSBjb25maWd1cmF0aW9uDQo+Pj4+Pj4+IC0gSW50cm9k
dWNlIG5ldyBkaXNrICJzcGVjaWZpY2F0aW9uIiBhbmQgInRyYW5zcG9ydCIgZmllbGRzIHRvIHN0
cnVjdA0KPj4+Pj4+PiBsaWJ4bF9kZXZpY2VfZGlzay4gQm90aCBhcmUgd3JpdHRlbiB0byB0aGUg
WGVuc3RvcmUuIFRoZSB0cmFuc3BvcnQNCj4+Pj4+Pj4gZmllbGQgaXMgb25seSB1c2VkIGZvciB0
aGUgc3BlY2lmaWNhdGlvbiAidmlydGlvIiBhbmQgaXQgYXNzdW1lcw0KPj4+Pj4+PiBvbmx5ICJt
bWlvIiB2YWx1ZSBmb3Igbm93Lg0KPj4+Pj4+PiAtIEludHJvZHVjZSBuZXcgInNwZWNpZmljYXRp
b24iIG9wdGlvbiB3aXRoICJ4ZW4iIGNvbW11bmljYXRpb24NCj4+Pj4+Pj4gcHJvdG9jb2wgYmVp
bmcgZGVmYXVsdCB2YWx1ZS4NCj4+Pj4+Pj4gLSBBZGQgbmV3IGRldmljZSBraW5kIChMSUJYTF9f
REVWSUNFX0tJTkRfVklSVElPX0RJU0spIGFzIGN1cnJlbnQNCj4+Pj4+Pj4gb25lIChMSUJYTF9f
REVWSUNFX0tJTkRfVkJEKSBkb2Vzbid0IGZpdCBpbnRvIFZpcnRpbyBkaXNrIG1vZGVsDQo+Pj4+
Pj4+DQo+Pj4+Pj4+IEFuIGV4YW1wbGUgb2YgZG9tYWluIGNvbmZpZ3VyYXRpb24gZm9yIFZpcnRp
byBkaXNrOg0KPj4+Pj4+PiBkaXNrID0gWyAncGh5Oi9kZXYvbW1jYmxrMHAzLCB4dmRhMSwgYmFj
a2VuZHR5cGU9b3RoZXIsDQo+Pj4+Pj4+IHNwZWNpZmljYXRpb249dmlydGlvJ10NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gTm90aGluZyBoYXMgY2hhbmdlZCBmb3IgZGVmYXVsdCBYZW4gZGlzayBjb25maWd1
cmF0aW9uLg0KPj4+Pj4+Pg0KPj4+Pj4+PiBQbGVhc2Ugbm90ZSwgdGhpcyBwYXRjaCBpcyBub3Qg
ZW5vdWdoIGZvciB2aXJ0aW8tZGlzayB0byB3b3JrDQo+Pj4+Pj4+IG9uIFhlbiAoQXJtKSwgYXMg
Zm9yIGV2ZXJ5IFZpcnRpbyBkZXZpY2UgKGluY2x1ZGluZyBkaXNrKSB3ZSBuZWVkDQo+Pj4+Pj4+
IHRvIGFsbG9jYXRlIFZpcnRpbyBNTUlPIHBhcmFtcyAoSVJRIGFuZCBtZW1vcnkgcmVnaW9uKSBh
bmQgcGFzcw0KPj4+Pj4+PiB0aGVtIHRvIHRoZSBiYWNrZW5kLCBhbHNvIHVwZGF0ZSBHdWVzdCBk
ZXZpY2UtdHJlZS4gVGhlIHN1YnNlcXVlbnQNCj4+Pj4+Pj4gcGF0Y2ggd2lsbCBhZGQgdGhlc2Ug
bWlzc2luZyBiaXRzLiBGb3IgdGhlIGN1cnJlbnQgcGF0Y2gsDQo+Pj4+Pj4+IHRoZSBkZWZhdWx0
ICJpcnEiIGFuZCAiYmFzZSIgYXJlIGp1c3Qgd3JpdHRlbiB0byB0aGUgWGVuc3RvcmUuDQo+Pj4+
Pj4+IFRoaXMgaXMgbm90IGFuIGlkZWFsIHNwbGl0dGluZywgYnV0IHRoaXMgd2F5IHdlIGF2b2lk
IGJyZWFraW5nDQo+Pj4+Pj4+IHRoZSBiaXNlY3RhYmlsaXR5Lg0KPj4+Pj4+Pg0KPj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29A
ZXBhbS5jb20+DQo+Pj4+Pj4gT0ssIEkgYW0gKnJlYWxseSogc29ycnkgZm9yIGNvbWluZyBpbiBo
ZXJlIGF0IHRoZSBsYXN0IG1pbnV0ZSBhbmQNCj4+Pj4+PiBxdWliYmxpbmcgYWJvdXQgdGhpbmdz
Lg0KPj4+Pj4NCj4+Pj4+IG5vIHByb2JsZW0NCj4+Pj4+DQo+Pj4+Pg0KPj4+Pj4+IEJ1dCB0aGlz
IGludHJvZHVjZXMgYSBwdWJsaWMgaW50ZXJmYWNlIHdoaWNoIGxvb2tzIHJlYWxseSB3cm9uZyB0
bw0KPj4+Pj4+IG1lLsKgIEnigJl2ZSByZXBsaWVkIHRvIHRoZSBtYWlsIGZyb20gRGVjZW1iZXIg
d2hlcmUgSnVlcmdlbiBwcm9wb3NlZA0KPj4+Pj4+IHRoZSDigJxPdGhlcuKAnSBwcm90b2NvbC4N
Cj4+Pj4+Pg0KPj4+Pj4+IEhvcGVmdWxseSB0aGlzIHdpbGwgYmUgYSBzaW1wbGUgbWF0dGVyIG9m
IGZpbmRpbmcgYSBiZXR0ZXIgbmFtZQ0KPj4+Pj4+IHRoYW4g4oCcb3RoZXLigJ0uIChPciB5b3Ug
Z3V5cyBjb252aW5jaW5nIG1lIHRoYXQg4oCcb3RoZXLigJ0gaXMgcmVhbGx5IHRoZQ0KPj4+Pj4+
IGJlc3QgbmFtZSBmb3IgdGhpcyB2YWx1ZTsgb3IgZXZlbiBBbnRob255IGFzc2VydGluZyBoaXMg
cmlnaHQgYXMgYQ0KPj4+Pj4+IG1haW50YWluZXIgdG8gb3ZlcnJ1bGUgbXkgb2JqZWN0aW9uIGlm
IGhlIHRoaW5rcyBJ4oCZbSBvdXQgb2YgbGluZS4pDQo+Pj4+Pg0KPj4+Pj4gSSBzYXcgeW91ciBy
ZXBseSB0byBWNiBhbmQgSnVlcmdlbidzIGFuc3dlci4gSSBzaGFyZSBKdWVyZ2VuJ3MNCj4+Pj4+
IG9waW5pb24gYXMgd2VsbCBhcyBJIHVuZGVyc3RhbmQgeW91ciBjb25jZXJuLiBJIHRoaW5rLCB0
aGlzIGlzDQo+Pj4+PiBleGFjdGx5IHRoZSBzaXR1YXRpb24gd2hlbiBmaW5kaW5nIGEgcGVyZmVj
dCBuYW1lIChvYnZpb3VzLCBzaG9ydCwNCj4+Pj4+IGV0YykgZm9yIHRoZSBiYWNrZW5kdHlwZSAo
aW4gb3VyIHBhcnRpY3VsYXIgY2FzZSkgaXMgcmVhbGx5IGRpZmZpY3VsdC4NCj4+Pj4+DQo+Pj4+
PiBQZXJzb25hbGx5IEkgdGVuZCB0byBsZWF2ZSAib3RoZXIiLCBiZWNhdXNlIHRoZXJlIGlzIG5v
IGJldHRlcg0KPj4+Pj4gYWx0ZXJuYXRpdmUgZnJvbSBteSBQb1YuIEFsc28gSSBtaWdodCBiZSBj
b21wbGV0ZWx5IHdyb25nIGhlcmUsIGJ1dA0KPj4+Pj4gSSBkb24ndCB0aGluayB3ZSB3aWxsIGhh
dmUgdG8gZXh0ZW5kIHRoZSAiYmFja2VuZHR5cGUiIGZvcg0KPj4+Pj4gc3VwcG9ydGluZyBvdGhl
ciBwb3NzaWJsZSB2aXJ0aW8gYmFja2VuZCBpbXBsZW1lbnRhdGlvbnMgaW4gdGhlDQo+Pj4+PiBm
b3Jlc2VlYWJsZSBmdXR1cmU6DQo+Pj4+Pg0KPj4+Pj4gLSB3aGVuIFFlbXUgZ2FpbnMgdGhlIHJl
cXVpcmVkIHN1cHBvcnQgd2Ugd2lsbCBjaG9vc2UgcWRpc2s6DQo+Pj4+PiBiYWNrZW5kdHlwZSBx
ZGlzayBzcGVjaWZpY2F0aW9uIHZpcnRpbw0KPj4+Pj4gLSBmb3IgdGhlIHBvc3NpYmxlIHZpcnRp
byBhbHRlcm5hdGl2ZSBvZiB0aGUgYmxrYmFjayB3ZSB3aWxsIGNob29zZQ0KPj4+Pj4gcGh5OiBi
YWNrZW5kdHlwZSBwaHkgc3BlY2lmaWNhdGlvbiB2aXJ0aW8NCj4+Pj4+DQo+Pj4+PiBJZiB0aGVy
ZSB3aWxsIGJlIGEgbmVlZCB0byBrZWVwIHZhcmlvdXMgaW1wbGVtZW50YXRpb24sIHdlIHdpbGwg
YmUNCj4+Pj4+IGFibGUgdG8gZGVzY3JpYmUgdGhhdCBieSB1c2luZyAidHJhbnNwb3J0IiAobW1p
bywgcGNpLCB4ZW5idXMsIGFyZ28sDQo+Pj4+PiB3aGF0ZXZlcikuDQo+Pj4+PiBBY3R1YWxseSB0
aGlzIGlzIHdoeSB3ZSBhbHNvIGludHJvZHVjZWQgInNwZWNpZmljYXRpb24iIGFuZCAidHJhbnNw
b3J0Ii4NCj4+Pj4+DQo+Pj4+PiBJSVJDLCB0aGVyZSB3ZXJlIG90aGVyIChzdWdnZXN0ZWQ/KSBu
YW1lcyBleGNlcHQgIm90aGVyIiB3aGljaCBhcmUNCj4+Pj4+ICJleHRlcm5hbCIgYW5kICJkYWVt
b24iLiBJZiB5b3UgdGhpbmsgdGhhdCBvbmUgb2YgdGhlbSBpcyBiZXR0ZXINCj4+Pj4+IHRoYW4g
Im90aGVyIiwgSSB3aWxsIGhhcHB5IHRvIHVzZSBpdC4NCj4+Pj4NCj4+Pj4gQ291bGQgd2UgcGxl
YXNlIG1ha2UgYSBkZWNpc2lvbiBvbiB0aGlzPw0KPj4+Pg0KPj4+PiBJZiAib3RoZXIiIGlzIG5v
dCB1bmFtYmlndW91cywgdGhlbiBtYXliZSB3ZSBjb3VsZCBjaG9vc2UgImRhZW1vbiIgdG8NCj4+
Pj4gZGVzY3JpYmUgYXJiaXRyYXJ5IHVzZXItbGV2ZWwgYmFja2VuZHMsIGFueSB0aG91Z2h0Pw0K
Pj4+IFVuZm9ydHVuYXRlbHkgSSBkaWRu4oCZdCBoYXZlIHRpbWUgdG8gZGlnIGludG8gdGhpczsg
SeKAmW0ganVzdCBnb2luZyB0bw0KPj4+IGhhdmUgdG8gd2l0aGRyYXcgbXkgb2JqZWN0aW9uLCBh
bmQgbGV0IHlvdSAmIEp1ZXJnZW4gZGVjaWRlIHdoYXQgdG8NCj4+PiBjYWxsIGl0Lg0KPj4gR2Vv
cmdlLCB0aGFua3MgZm9yIGxldHRpbmcgbWUga25vdy4gSnVlcmdlbiBwcm9wb3NlZCB0byB1c2Ug
InN0YW5kYWxvbmUiDQo+PiBmb3IgdGhlIG5ldyBiYWNrZW5kdHlwZSBuYW1lIHdoaWNoIGlzIGZh
ciBtb3JlIHNwZWNpZmljLiBJIGFncmVlIHdpdGggdGhhdC4NCj4+DQo+Pg0KPj4gQW50aG9ueSwg
d291bGQgeW91IGJlIGhhcHB5IHdpdGggdGhhdCByZW5hbWluZz8NCj4gSSB0cmllZCB0byBmaWd1
cmUgb3V0IHdoYXQgYmFja2VuZHR5cGUgaXMgc3VwcG9zZWQgdG8gbWVhbiwgaG93IGl0J3MNCj4g
dXNlZC4gSSBmZWVsIGl0J3MgcXVpdGUgbWVzc3kgYXQgdGhlIG1vbWVudC4NCj4NCj4gTWFuIHBh
Z2UgeGwtZGlzay1jb25maWd1cmF0aW9uIHNheXMgaXQncyBhIGJhY2tlbmQgaW1wbGVtZW50YXRp
b24gdG8NCj4gdXNlLiBCZXNpZGUgJ3BoeScsIHdoaWNoIEkgZ3Vlc3MgaXMgdGhlIGtlcm5lbCBv
ciBibGtiYWNrLCB0aGUgdHdvIG90aGVyDQo+IHBvaW50IHRvIFFFTVUgKCdxZGlzaycpIGFuZCB0
YXBkaXNrICgndGFwJykuDQo+DQo+IFRoZSwgYmFja2VuZHR5cGUgaXMgdXNlZCB0aHJvdWdob3V0
IGxpYnhsIHRvIGRlYWwgd2l0aCB0aGUgZGlmZmVyZW50DQo+IGJhY2tlbmQgaW1wbGVtZW50YXRp
b24sIGFuZCB0aGUgdmFsdWUgaXMgc3RvcmVkIGluIHRoZSB4ZW5zdG9yZSBrZXkNCj4gInR5cGUi
LiBGcm9tICJibGtpZi5oIiwgInR5cGUiIHNob3VsZCBiZSAnZmlsZScgb3IgJ3BoeScgb3IgJ3Rh
cCcsIGJ1dA0KPiB3ZSBzdG9yZSAncWRpc2snIGZvciAncWRpc2snLi4uIHNvIHRoZSAidHlwZSIg
bm90ZSBpbiB4ZW5zdG9yZSBpcw0KPiBwcm9iYWJseSB1c2VsZXNzIGZvciBxZGlzaywgYnV0IG1h
eWJlIHVzZWZ1bCBmb3IgJ3BoeSc/IChUaGlzICJ0eXBlIg0KPiBub2RlIGlzIG9ubHkgZm9yIHRo
ZSBiYWNrZW5kLCBzbyBwcm9iYWJseSB1c2VsZXNzIGZvciBhIGZyb250IGVuZC4pDQoNCkkgbWln
aHQgbWlzdGFrZSwgYnV0IGV2ZW4gdGhlIHByZXNlbmNlIG9mICJ0eXBlIiBub2RlIChvciBvdGhl
ciBub2RlcykgDQppbiBYZW5zdG9yZSBpcyB1c2VsZXNzIGZvciBzb21lIGJhY2tlbmQgaW1wbGVt
ZW50YXRpb25zLA0KDQp0aGlzIHByb3ZpZGVzIHVzIGFuIGFiaWxpdHkgdG8gcmV0cmlldmUgYWxt
b3N0IHdob2xlIGxpYnhsX2RldmljZV9kaXNrIA0KaW5zdGFuY2UgZnJvbSB0aGUgWGVuc3RvcmUg
KHBsZWFzZSBzZWUgbGlieGxfX2Rpc2tfZnJvbV94ZW5zdG9yZSgpKS4NCg0KPg0KPiBBbnl3YXks
IGl0IHNlZW1zIHRvIG1lIHRoYXQgYmFja2VuZHR5cGUgc2hvdWxkIGJlIHRoZSBuYW1lIG9mIHRo
ZQ0KPiBpbXBsZW1lbnRhdGlvbiBvZiB0aGUgYmFja2VuZCB3ZSB3YW50IHRvIHVzZS4gSXQgaXMg
anVzdCBhIHBhcmFtZXRlcg0KPiB0byB0ZWxsIGxpYnhsIGhvdyB0byBjb21tdW5pY2F0ZSB3aXRo
IHRoZSBiYWNrZW5kLg0KDQpJIGFsc28gdGhpbmsgdGhlIHNhbWUNCg0KDQo+ICAgQXQgdGhlIG1v
bWVudCBsaWJ4bA0KPiB1c2VzIHhlbnN0b3JlIHRvIGNvbW11bmljYXRlcyB3aXRoIGFsbCBiYWNr
ZW5kcyBldmVuIGlmIHRoYXQncyBub3QNCj4gcmVxdWlyZWQsIGJlY2F1c2UgbGlieGwgd29ya3Mg
dGhpcyB3YXkgYW5kIGl0J3MgaGFyZCB0byBjaGFuZ2UuIChXZQ0KPiBjb3VsZCBjb21tdW5pY2F0
ZSB3aXRoIFFFTVUgdmlhIFFNUCByYXRoZXIgdGhhbiB4ZW5zdG9yZSBmb3IgZXhhbXBsZS4pDQo+
DQo+IFNvIEkgZ3Vlc3MgZWl0aGVyIHlvdSBoYXZlIGEgbmFtZSBmb3IgeW91ciBpbXBsZW1lbnRh
dGlvbiwgb3Igc29tZXRoaW5nDQo+IGdlbmVyaWMgd2lsbCBkby4gU28gInN0YW5kYWxvbmUiIGlz
IGZpbmUuDQoNClRoYW5rcyBmb3IgdGhlIGNvbmZpcm1hdGlvbiENCg0KDQo+DQo+IChXZSBwcm9i
YWJseSB3YW50IHRvIGRvY3VtZW50IHNvbWV3aGVyZSB0aGF0IHRoaXMgbmV3IHR5cGUgd291bGQN
Cj4gc2ltcGx5IG1lYW4gIm9ubHktcmVseWluZy1vbi14ZW5zdG9yZS1kYXRhIiBsaWtlIEp1ZXJn
ZW4gaXMgcHV0dGluZw0KPiBpdCwgYW5kIGlzbid0IGJsa2JhY2sgb3IgUUVNVS4pDQoNCkkgd2ls
bCBhZGQgYSBjb21tZW50IGluIGxpYnhsX3R5cGVzLmlkbCB3aGVyZSAiU1RBTkRBTE9ORSIgZW51
bSBpdGVtIGlzIA0KaW50cm9kdWNlZC4NCg0KDQoNCj4NCj4gVGhhbmtzLA0KPg0KLS0gDQpSZWdh
cmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

