Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DB9459CB2
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 08:24:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229141.396569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQ9L-0000tr-7U; Tue, 23 Nov 2021 07:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229141.396569; Tue, 23 Nov 2021 07:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQ9L-0000s5-4Q; Tue, 23 Nov 2021 07:23:31 +0000
Received: by outflank-mailman (input) for mailman id 229141;
 Tue, 23 Nov 2021 07:23:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpQ9J-0000rz-Fe
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 07:23:29 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f99e096-4c2e-11ec-9787-a32c541c8605;
 Tue, 23 Nov 2021 08:23:27 +0100 (CET)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7EnN7028610;
 Tue, 23 Nov 2021 07:23:24 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2171.outbound.protection.outlook.com [104.47.17.171])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cguqyr0p0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 07:23:24 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM4PR0301MB2195.eurprd03.prod.outlook.com (2603:10a6:200:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 07:23:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 07:23:19 +0000
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
X-Inumbo-ID: 3f99e096-4c2e-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GcWM2bvzMpY6fxiJh8ZfrDk7xhMfoYznwr48fTMhG3qNYoeJXYuC9lqb1NJiRZPZjhehru6G/HSY0ZjpxvXDT756PAyntLHMJ0w6a762dqhCi7EJxHfCyo4nCoqE9Rt8moeaYxfzubr3nO65y3MYDNl5wtp8YMcIzqyy5ZkKF3QezuIHTn8ZWa5qYElRI02CczuTRvS9yX4LSAKR2UyANyIUByxZLPEhLfRbcZGHfIIKb2DvSfF9vSqSTdCXsTvjqq6Ka2jWXRl1g0/67+mefJCQc+VKTfC+XFVE5/digpTdxWAmAr8gZ0vvnRs/nFtpD/wx3NUfyseAV6Od9TnTkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jWY0T8YJLb5TaLXTMpgWUV9nQsdlu/zO0J/UCvWb+EM=;
 b=Lun4tf7LZ20EwyVBS9Pm9EDoDm9WUpIyXR7mUf7Mowb6OKR/b3WHAMt7WxOQXm2JmGHbI+dl1JCmmcjWnUhWmF0Q8TV9dzhVik3CFNQMyAGY9eGi/IwA8RpE634H1msMaxNh7BPBmcyMyDUZm45c1s6kgQbK0E6ygBn25nlS8sA0uMsNHyCrkGrXhI+yyhEZFEN0xx3BkOfP/nWx4ppdTJUQ8fLyXa7KNNSz+euI/kcKLd570ah+QOpJ0mksT9XNWY1PQmZZ49O+u5aEV62i2nXjLj3dJcSpBLybRtejBFAN7CwwoQlUDE9SCEYvz/tNSE3XRVz+/7QR9y7h+3NJFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jWY0T8YJLb5TaLXTMpgWUV9nQsdlu/zO0J/UCvWb+EM=;
 b=dcs7TLmAAXQgx12gOdtwFVtiOAPPPttVcUErMYbRtUqGqCWFMzi2M6wev9Yx0tehg+upHyU5OKUnrCQ4CzsZJJpya9xWWGC4LiT4/2w+TBfEpe2LZvBt7X0YxiVec9VaFZR+d4CMETKxkopxdVdng2u0nF+DwsNGjyC3XyHZdC60ATTVej2bLyGss5p4beoeAXhinUZNHnwNOzH5fYo8qHA2jKHEPuVDj+E0lxz4seLGNAZNtXCEjvMtwiGhj+FgxD690YojiSNJt8l15Aqlne/BrAeF55I4d5473Sk6NB/Qy33PQJnNxj+hhBzMzxClr+7Vcq2jph9gJzdVSGJBbg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "jbeulich@suse.com"
	<jbeulich@suse.com>,
        "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
        "paul@xen.org"
	<paul@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
Thread-Topic: [PATCH v6 5/7] xen/arm: do not map IRQs and memory for disabled
 devices
Thread-Index: AQHX0g8TzX0nJtcMKUqFWH5LUHUR4awGmpkAgAJVCwCABxtVgIAAxuEA
Date: Tue, 23 Nov 2021 07:23:19 +0000
Message-ID: <0a200067-d6e6-9c55-aa29-8702da6510b3@epam.com>
References: <20211105063326.939843-1-andr2000@gmail.com>
 <20211105063326.939843-6-andr2000@gmail.com>
 <997e2ad5-9b52-73b4-a02d-f255480684d9@xen.org>
 <ffaabc83-9ca7-1f41-23a9-bf2a1e3828ca@epam.com>
 <85923001-363c-277f-ead2-026cea88577c@xen.org>
In-Reply-To: <85923001-363c-277f-ead2-026cea88577c@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87aa7fc9-4b13-473d-4308-08d9ae521ff7
x-ms-traffictypediagnostic: AM4PR0301MB2195:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM4PR0301MB21959E0EFDB81A0C5924CF31E7609@AM4PR0301MB2195.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 K0Jf+n1CbgVP++wj/SiSjr6GV1jjmsC9d5AOeTlvbz+qxqxyiHenEjg1NYIeBHrZ6IB9BNCgWFmB5pWo9Y/xV4XSTtcV1w3/Csz4tFi3OzvhFBNV3782jYxnvU9jfhwPrr3qe9/Vx52udbQ7j06gw0mILsP5nwiZFY/zW/0VfmG/cZuLlqz4jMHjWFYCUQWPxMZwrRCArEBTHQVRFU8bZCCHKqwIEd0Jbix5DfpCpj8JzicF0W7+j7ft4xlw88Is/9CcQr5c0/2NXRG42qSNiMNNcGzRCCrNn3hnlqE8qpJrpXwDYspaPK91xOFhMfe7jtHb6RDG/TfyfEVL3laUiOz0vxACmm0vt3t7d/Q4IQZpnCZoHbZGrAMZsnkudenJkcCEaS77Zp8jHDj0WhIuFbyK845p+KdAz0m9TjMPTj9kic92neyw7yC3XVdZyjg+5Lype/Mf46vqA4PevBXn4uCI/C0Q6QPph/lWpehZlf3pU58XaT4lXC91uajvWliTsOAHANw5OhrJk5I3IDlRL29JpVMQyHc5yPWXdcBfrKaFnEC7B7KlO9a4HcIkYDitQ4Cz0tACDuP/kPu+7RBqiV4AyqkESkrrWAwEYpL34roTdf7qOc8XzIpfDtPTdekVgjuXK1ggu6V+bbE5fluRTUB9dYQtmVMpgAzeuB9GQyp1RI0ce2MKr4XctBwK+IybzMjFNY307lLXhT0LGCS0fPxwznnVy/E2qBCLgXX4r65+PXqDtv/LDpPFgcZ0EEMoVsKEmb7jMEaW6dhoJ4dUPqro/qV4DtgbPy7OcCZIMrbazgzviBnHf+bpFBDECKRCVX64ZnO1AK12niNYXdzkWJEzVdfafjE36/gfVrjGU/0=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(26005)(4326008)(36756003)(186003)(508600001)(66446008)(38070700005)(53546011)(8936002)(83380400001)(7416002)(107886003)(2616005)(6486002)(6506007)(8676002)(6512007)(31686004)(2906002)(122000001)(54906003)(316002)(110136005)(71200400001)(86362001)(31696002)(38100700002)(966005)(66476007)(66556008)(66946007)(64756008)(76116006)(91956017)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cUFMcmJiM2k3TjIrdDFoNEcwL0J1VHRCSUdyL1Rya3JwV3o4b0hOWlpXd1lQ?=
 =?utf-8?B?Y3lmVnkwVkEwdVdjbWJhSksrMFJUODkyVE81NDBCRVRzVFpYNXZpWTVlR2NY?=
 =?utf-8?B?Zk15T2VXVXBMaTdNeVV2dm9wSnloQTRNdStPV0pUQW8vWHFHNWVWWnRnMk9u?=
 =?utf-8?B?SFB5eWZiYitBSmFJanJzOU44UWk4WUtTVk5tU2N2eUxrK29JblZhRkc1c3dG?=
 =?utf-8?B?dTl2TlM4NE1oMFJpbFFxNjA1NVhEUTVSR0VEVnRVajB3RVhtQkRrUGZ0RzBI?=
 =?utf-8?B?ZkovQXM2U2ZyZUo3WFBmdll2NGtKU2JQQlh5SURLREFuT0IvdDJ3ZzJCTWRt?=
 =?utf-8?B?cjRDelBidlpFTTJ4M0xDTG9kbXNqeC9rb2tqUk1BdTVMTXhlajZnYU0yMWlu?=
 =?utf-8?B?QUNyMVBKK0dIY3pGRmlLY2wrQTh0RWgyRWUvanFmK0loSjlmNHNyT0xrUElv?=
 =?utf-8?B?bmFlTm9nYWk5ZkxBNUFkNGFvRHB3dFNLV045WU4xZ3FBbmh6eHUySHg4NGxy?=
 =?utf-8?B?L1djZUdKYTBrSDVaK2tlblU2QTNrNmF1QXppeVVZblFjMzg3M3U1alJoTzNF?=
 =?utf-8?B?NmVYeVgxRHJCckoxdVpBb2U1SVdSK2JBbnUzL0hQMmx5NnJEc1gzZGFBc1RW?=
 =?utf-8?B?dXdnNzVpaEd6OWFtdDVza0VUeDRYYnJPbUZjdzh6NG5rb0REQUZFYTRTVWhy?=
 =?utf-8?B?QWJWVUVVSmFWcjFWYkVDZzFHajl4S3JhTG5yZ1VKVGI0dlF3dnVScVNCak1j?=
 =?utf-8?B?UmFMQUJYWkdYMGxadVhEclNuMzArbUZZcVM0Qm9GR1ZJTEFTSVQyakJMWUdY?=
 =?utf-8?B?K1dTRHVlY2xDb3ZUVlFFNHhPNVZMVDJRMmRZNXNyYnBxbGY1UjRqNmh0MEZE?=
 =?utf-8?B?cC84ZXhIcEJidmRncTdVSlRsOGhxKzJjMXAzdTBrMnpHVTNrNmoyZzdtak1X?=
 =?utf-8?B?WDU4ck15UTdPWHY5NUJTTDl1cTNDSmxEb3hBKzdXWmQ2cURzdGtaRVRaaUZl?=
 =?utf-8?B?VnpLTnpuSUtMVlZsQzg2QXZvNkJHekZzY3dHNGRPOWt0S0NLeTRJZVI2ZzM3?=
 =?utf-8?B?eHUwMXJvSFYyYWo4YVJKTENEOGJIaHQ1cVBsUTUwUkoyUFBCWEY5alJNQ3E3?=
 =?utf-8?B?VUduYlR1cTF3dVIvTjFHN21VRkovbDI3Yk1PMHJCQzBUZmRjQ1dzSTJtTFV3?=
 =?utf-8?B?cXRzMDBtbTFWNTBsVEFvRlIzb2NuSVg2QkdXTVJsL0p2T3ZKdUp2YlF3cUYv?=
 =?utf-8?B?UXd3cTNDZ0ZVd1FnZW9uRytOSmJER1F6S2cxdmRNcWlyeWJpdm5iZFNlOE5S?=
 =?utf-8?B?d3hma3FqWEhBUjhtOHlvaWpSMVBLUmR5TGxUMS9uV1pUaXl0dEsxWjZ6WUdL?=
 =?utf-8?B?SXFLcFhGRFp2TjN6VnpjMjJ1dmdWUGZCUDRSR0VYa0krMkR3dlhybE15dlFL?=
 =?utf-8?B?WTM0NzNnTG4xeTRrNFB1em1zYUZCcVB1cG5DdnpFV2dNMDZpZGk1M0RjZjY3?=
 =?utf-8?B?cVZIb0VaNzRZNXZZMXFOVXBhUVQyYzMybDBMcFdzYjcrNTFnMkJqdTdJOGJE?=
 =?utf-8?B?aS9uajU5VGE2VC9iY2JOTHZsa0F3Ykw1TWtRQmJ2Z2lweFBVZWxGbFZpMlJX?=
 =?utf-8?B?a0VBclBnaEpKUkdCdzI4S09vRE9KYThrQTl0Z3BBZ1NpZHk2VEFvY3grbWc1?=
 =?utf-8?B?RVYzN0FuVlRxbEtKME1mZm5zVzVOdTFQV3JadHNUZWJ5bWJpK3FsU1V0NGJx?=
 =?utf-8?B?Ykl6cEFGM1JjcjRZeW85UXQzWE8rVFRYblgvT1N1Sk43QjJJQnlydUhIL3Ra?=
 =?utf-8?B?QXFYTDFCNU5PRno5c3k1Z3JpeVJRTDRWRGVpM3hFa3FaVllVUkcyRmZsVXRx?=
 =?utf-8?B?ZC9VVXo3NmxtTnRHenJQSEladU94OG1pOTZtYlNXaWR2S1ZxcnRybUVBeGRP?=
 =?utf-8?B?Tk1PeHhGbTVvRTRZZzBVSXR0YWRBYzlDYXZBQlNZQytFT21nU0JaS2pMc3hQ?=
 =?utf-8?B?TDRqd0dwZWZ4Vmk2eG1UeWU1N3dsbkRINGMzTGRSbEJKL1hxZGZaNG9qNU1p?=
 =?utf-8?B?eURabU1JYm4vNnlGMk81M0p3RWFmVjRBcWsxeENldEVTd0d2WTEycEQ4dHdX?=
 =?utf-8?B?QUYwdlNYSWp0SElvU3V2WlplMTZ6RUVnbEhZVTdQSEh0TGVuaWdkTXdmdC84?=
 =?utf-8?B?ZXc5MVROZlFYY1lnQ1Q5L3BiZWFpNENFNGRldlJyR0dWVEtrYVgrRXZwcFg5?=
 =?utf-8?B?eDYwMTZ2UFpZdGdLOTlhaWM0RStZcWFiNGllWk41UmFRL3pIM2M5OUoycWM3?=
 =?utf-8?B?TEI5emsxMXZoU1NsNXhENC9VVGlSUHFMVWVGcEtjcVErR3pDd00wdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <24245CD72E249B428D8B85628BED78F6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87aa7fc9-4b13-473d-4308-08d9ae521ff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 07:23:19.4932
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XM9lvbfvSPV+Dlqd38FzAPojP3+PtFzZdu7UqdTFovN87Uw0OJe/+5O+suxm/JRLHYRGdfAvIesj56r2KRxTidz8tJvL1VQOlm2gGGazVR0d57IuKDwSF7BxNgXGmLyY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2195
X-Proofpoint-GUID: hqkOJnKU00ZY3O6otCwnpxaxu3E3yL5d
X-Proofpoint-ORIG-GUID: hqkOJnKU00ZY3O6otCwnpxaxu3E3yL5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxlogscore=879 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111230036

SGksIEp1bGllbiENCg0KT24gMjIuMTEuMjEgMjE6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4g
SGkgT2xla3NhbmRyLA0KPg0KPiBPbiAxOC8xMS8yMDIxIDA2OjU5LCBPbGVrc2FuZHIgQW5kcnVz
aGNoZW5rbyB3cm90ZToNCj4+IEhpLCBKdWxpZW4hDQo+Pg0KPj4gT24gMTYuMTEuMjEgMjE6MjIs
IEp1bGllbiBHcmFsbCB3cm90ZToNCj4+PiBIaSBPbGVrc2FuZHIsDQo+Pj4NCj4+PiBPbiAwNS8x
MS8yMDIxIDA2OjMzLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTog
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29t
Pg0KPj4+Pg0KPj4+PiBDdXJyZW50bHkgWGVuIG1hcHMgYWxsIElSUXMgYW5kIG1lbW9yeSByYW5n
ZXMgZm9yIGFsbCBkZXZpY2VzIGV4Y2VwdA0KPj4+PiB0aG9zZSBtYXJrZWQgZm9yIHBhc3N0aHJv
dWdoLCBlLmcuIGl0IGRvZXNuJ3QgcGF5IGF0dGVudGlvbiB0byB0aGUNCj4+Pj4gInN0YXR1cyIg
cHJvcGVydHkgb2YgdGhlIG5vZGUuDQo+Pj4+DQo+Pj4+IEFjY29yZGluZyB0byB0aGUgZGV2aWNl
IHRyZWUgc3BlY2lmaWNhdGlvbiBbMV06DQo+Pj4+IMKgwqAgLSAib2theSLCoMKgwqDCoCBJbmRp
Y2F0ZXMgdGhlIGRldmljZSBpcyBvcGVyYXRpb25hbC4NCj4+Pj4gwqDCoCAtICJkaXNhYmxlZCIg
SW5kaWNhdGVzIHRoYXQgdGhlIGRldmljZSBpcyBub3QgcHJlc2VudGx5IG9wZXJhdGlvbmFsLA0K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnV0IGl0IG1pZ2h0IGJlY29tZSBv
cGVyYXRpb25hbCBpbiB0aGUgZnV0dXJlIChmb3IgZXhhbXBsZSwNCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc29tZXRoaW5nIGlzIG5vdCBwbHVnZ2VkIGluLCBvciBzd2l0Y2hlZCBvZmYpLg0K
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBSZWZlciB0byB0aGUgZGV2aWNlIGJpbmRpbmcgZm9y
IGRldGFpbHMgb24gd2hhdCBkaXNhYmxlZCBtZWFucw0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBmb3IgYSBnaXZlbiBkZXZpY2UuDQo+Pj4+DQo+Pj4+IFNvLCAiZGlzYWJsZWQiIHN0YXR1cyBp
cyBkZXZpY2UgZGVwZW5kZW50IGFuZCBtYXBwaW5nIHNob3VsZCBiZSB0YWtlbiBieQ0KPj4+PiBj
YXNlLWJ5LWNhc2UgYXBwcm9hY2ggd2l0aCB0aGF0IHJlc3BlY3QuIEFsdGhvdWdoIGluIGdlbmVy
YWwgWGVuIHNob3VsZCBtYXANCj4+Pj4gSVJRcyBhbmQgbWVtb3J5IHJhbmdlcyBhcyB0aGUgZGlz
YWJsZWQgZGV2aWNlcyBtaWdodCBiZWNvbWUgb3BlcmF0aW9uYWwNCj4+Pg0KPj4+IFJpZ2h0LCB0
aGlzIGNoYW5nZSBlZmZlY3RpdmVseSBwcmV2ZW50IGRvbTAgdG8gdXNlIHN1Y2ggZGV2aWNlIGlm
IGl0IGJlY29tZXMgb3BlcmF0aW9uYWwgaW4gdGhlIGZ1dHVyZS4NCj4+IE9yIGRvZXNuJ3QsIHNl
ZSBiZWxvdw0KPj4+IFNvIHRoaXMgc291bmRzIGxpa2UgYSBiaWcgcmVncmVzc2lvbi4NCj4+Pg0K
Pj4+IEhvdyBkbyB5b3UgcGxhbiB0byBoYW5kbGUgaXQ/DQo+PiBJdCBkZXBlbmRzIGlmIHRoaXMg
aXMgcmVhbGx5IGEgcmVncmVzc2lvbiBvciBpcyBvayBhbmQgImJ5IGRlc2lnbiINCj4NCj4gUXVv
dGluZyB3aGF0IHlvdSB3cm90ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2U6DQo+DQo+ICJJbmRpY2F0
ZXMgdGhhdCB0aGUgZGV2aWNlIGlzIG5vdCBwcmVzZW50bHkgb3BlcmF0aW9uYWwsIGJ1dCBpdCBt
aWdodCBiZWNvbWUgb3BlcmF0aW9uYWwgaW4gdGhlIGZ1dHVyZS4iDQo+DQo+IEkgcmVhZCB0aGF0
IGFzIGl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGhhdmUgYSBkZXZpY2UgdHVybiBvbiBhZnRlciBi
b290Lg0KPiBJbiBmYWN0LCBsb29raW5nIGF0IExpbnV4LCBJIGNhbiBzZWUgc29tZSBjb2RlIGFs
bG93aW5nIHRvIGNoYW5nZSB0aGUgc3RhdGUgb2YgYSBkZXZpY2UgYWZ0ZXIgYm9vdCAoc2VlIFs0
XSkuIFNvIEkgdGhpbmsgd2Ugd2FudCB0byBrZWVwIG1hcHBpbmcgdGhlIHJlZ2lvbnMgaW4gZG9t
MCBhdCBsZWFzdCBmb3Igc29tZSBkZXZpY2VzLg0KPg0KPiBOb3RlLCB0aGF0IG90aGVyIGJpdHMg
b2YgdGhlIERUIG92ZXJsYXkgd291bGQgbm90IHdvcmsuIFRoaXMgc2hvdWxkIGJlIGNvdmVyZWQg
YnkgdGhlIG5ldyBzZXJpZXMgZnJvbSBYaWxpbnggWzVdLg0KPg0KPj4+DQo+Pj4+IGl0DQo+Pj4+
IG1ha2VzIGl0IGltcG9zc2libGUgZm9yIHRoZSBvdGhlciBkZXZpY2VzLCB3aGljaCBhcmUgbm90
IG9wZXJhdGlvbmFsIGluDQo+Pj4+IGFueSBjYXNlLCB0byBza2lwIHRoZSBtYXBwaW5ncy4NCj4+
Pg0KPj4+IFlvdSB3cm90ZSAibWFrZXMgaXQgaW1wb3NzaWJsZSBmb3IgdGhlIG90aGVyIGRldmlj
ZXMiLCBidXQgaXQgaXMgbm90IGNsZWFyIHRvIG1lIHdoYXQncyB3b3VsZCBnbyB3cm9uZyB3aGVu
IHdlIG1hcCBhIGRpc2FibGVkIGRldmljZSAoRG9tMCBzaG91bGQgbm90IHRvdWNoIGl0KS4gRG8g
eW91IGhhdmUgYW4gZXhhbXBsZT8NCj4+IE9rLCBoZXJlIHdlIGdvLiBJbiB0aGUgU29DIEkgYW0g
d29ya2luZyB3aXRoIHRoZSBQQ0llIGNvbnRyb2xsZXIgbWF5IHJ1biBpbiB0d28gbW9kZXM6DQo+
PiBSb290IG9yIEVuZHBvaW50LiBOb3QgY29uZmlndXJhYmxlIGF0IHJ1bi10aW1lLCBzbyB5b3Ug
Y29uZmlndXJlIGl0IGluIHRoZSBkZXZpY2UgdHJlZS4NCj4+IFRoZSBhcmUgdHdvIGRldmljZSB0
cmVlIGVudHJpZXMgZm9yIHRoYXQ6IGZvciB0aGUgcm9vdCBbMV0gYW5kIGZvciB0aGUgZW5kcG9p
bnQgWzJdLg0KPj4gU28sIHdoZW4geW91IHdhbnQgdGhlIGNvbnRyb2xsZXIgdG8gYmUgYSBSb290
IENvbXBsZXggdGhlbiB5b3UgcHV0IHN0YXR1cyA9ICJkaXNhYmxlZCINCj4+IGZvciB0aGUgRW5k
cG9pbnQgZW50cnkgYW5kIHZpc2UgdmVyc2EuDQo+DQo+IFRoYW5rIGZvciB0aGUgZXhhbXBsZS4g
SSB0aGluayB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHNob3VsZCBiZSBleHBsYWluZWQgaW4gdGhl
IGNvbW1pdCBtZXNzYWdlLg0KPg0KPj4NCj4+IElmIHlvdSB0YWtlIGEgbG9vayBhdCB0aGUgbm9k
ZXMgdGhleSBib3RoIGRlZmluZSB0aGUgc2FtZSAicmVnIiBhbmQgImludGVycnVwdHMiLA0KPj4g
ZWZmZWN0aXZlbHkgbWFraW5nIGl0IGltcG9zc2libGUgZm9yIG1lIGluIHRoZSBwYXRjaCBbM10g
dG8gYWN0dWFsbHkgdHJhcCBNTUlPczogPiB3ZSBza2lwIHRoZSBtYXBwaW5ncyBmb3IgWzFdIGFu
ZCB0aGVuLCBiZWNhdXNlIHdlIGFzc3VtZSAiZGlzYWJsZWQiIGlzDQo+PiBzdGlsbCB2YWxpZCBm
b3IgbWFwcGluZ3MsIHdlIGFkZCB0aG9zZSBmb3IgWzJdLg0KPg0KPiBUZWNobmljYWxseSwgeW91
IHdvdWxkIGhhdmUgdGhlIHNhbWUgaXNzdWVzIGlmIHlvdXIgZGV2aWNlIGlzIHNoYXJpbmcgdGhl
IGludGVycnVwdCBvciB0aGUgTU1JTyBwYWdlLg0KPg0KPiBUaGUgZm9ybWVyIGlzIGZhaXJseSBj
b21tb24sIGJ1dCBJSVVDIHlvdSBhcmUgbm90IGVtdWxhdGVkIHRoZSBpbnRlcnJ1cHRzLiBSaWdo
dD8NCj4NCj4gRm9yIHRoZSBsYXR0ZXIsIEkgaGF2ZSBzZWVuIG11bHRpcGxlIFVBUlRzIGluIHRo
ZSBzYW1lIHBhZ2UgKGUuZy4gcGluZTY0KSBidXQgbm90IG11bHRpcGxlIFBDSSBob3N0YnJpZGdl
cy4gSG93ZXZlciwgdGhpcyBpcyBvbmx5IHdpdGggNEtCIHBhZ2UgZ3JhbnVsYXJpdHkuIFdlIG1h
eSBoYXZlIHRoZSBpc3N1ZSBhcmlzaW5nIHdpdGggMTZLQi82NEtCIG9uZXMuIFNvIEkgd291bGQg
c2F5IHdlIGNvdWxkIGlnbm9yZSBpdCBmb3Igbm93Lg0KPg0KPj4NCj4+IFNvLCB0aGlzIGlzIHBy
b2JhYmx5IHdoeSBkZXZpY2UgdHJlZSBkb2N1bWVudGF0aW9uIHNheXMgYWJvdXQgdGhlIGRpc2Fi
bGVkIHN0YXR1cw0KPj4gdG8gYmUgZGV2aWNlIHNwZWNpZmljLg0KPg0KPiBDb3JyZWN0LiBUaGF0
IHNhaWQsIHVudGlsIG5vdywgYWxsIHRoZSBkZXZpY2VzIHdvdWxkIGhhdmUgdGhlaXIgTU1JT3Ny
ZWdpb25zIG1hcHBlZCB0byBkb20wLiBTbyB0aGUgaW50ZXJwcmV0YXRpb24gb2YgImRpc2FibGVk
IiBkaWRuJ3QgbWF0dGVyIHRvbyBtdWNoLg0KPg0KPj4NCj4+IEhvcGUgdGhpcyBkZXNjcmliZXMg
YSB2ZXJ5IHZhbGlkIHVzZS1jYXNlLiBBdCB0aGUgc2FtZSB0aW1lIHlvdSBtYXkgYXJndWUgdGhh
dA0KPj4gSSBqdXN0IG5lZWQgdG8gcmVtb3ZlIHRoZSBvZmZlbmRpbmcgZW50cnkgZnJvbSB0aGUg
ZGV2aWNlIHRyZWUgd2hpY2ggbWF5IGFsc28gYmUNCj4+IHZhbGlkLg0KPg0KPiBXZSBuZWVkIHRv
IGJlIGFibGUgdG8gYWNjZXB0IGFueSAqdmFsaWQqIERldmljZS1UcmVlIHdpdGhvdXQgYW55IG1v
ZGlmaWNhdGlvbi4gQXQgdGhlIHNhbWUgdGltZSwgd2Ugd2FudCB0byBhdm9pZCBicmVhayBwb3Rl
bnRpYWwgZXhpc3RpbmcgdXNlLWNhc2VzLg0KPg0KPiBJIHRoaW5rLCB5b3UgY2FuIGhhbmRsZSB0
aGUgdHdvIGdyYWNlZnVsbHkgYnkgYWRkaW5nIGEgZWxzZSBpbiBwY2lfaG9zdF9icmlkZ2VfbWFw
cGluZ3MoKSB0aGF0IHdvdWxkIHJlbW92ZSB0aGUgUDJNIG1hcHBpbmcgaWYgYnJpZGdlLT5vcHMt
Pm5lZWRfcDJtX2h3ZG9tX21hcHBpbmcoKSByZXR1cm5zIGZhbHNlLg0KPg0KPiBUaGlzIGlzIG5v
dCBwcmV0dHkgYnV0IGl0IHNob3VsZCBkbyB0aGUgam9iIGZvciBub3cuIExvbmcgcnVuLCBJIHRo
aW5rIHdlIHNob3VsZCBjb25zaWRlciB0byBjcmVhdGUgZmFrZSBlbnRyaWVzIGluIHRoZSBQMk0g
Zm9yIGVtdWxhdGVkIHJlZ2lvbnMuDQo+DQo+IFRoZSBhZHZhbnRhZ2UgaXMgd2UgY291bGQgZWFz
aWx5IGZpbmQgY2xhc2ggYW5kIHVzZSB0aGVtIHRvIGlnbm9yZSBtYXBwaW5nIHdoZW4gdGhlIHJl
Z2lvbiBpcyBlbXVsYXRlZC4NCkkgdGhpbmsgSSB3aWxsIGRyb3AgdGhpcyBwYXRjaCBmcm9tIHRo
ZSBzZXJpZXMgZm9yIG5vdzogYWx0aG91Z2ggaXQgaXMgZ29vZCB0byBoYXZlIHRoZSBkZXZpY2Ug
dHJlZQ0KdW5tb2RpZmllZCBJIHN0aWxsIHNlZSBpdCB3YXkgZWFzaWVyIHRvIGRvIHNvLiBJIHdp
bGwgZGVsZXRlIHRoZSBub2RlIGZyb20gdGhlIGRldmljZSB0cmVlIGFzIGluIG15DQpjYXNlIGl0
IGlzIGFueXdheXMgZGVjaWRlZCBhdCBjb21waWxlIHRpbWUgd2hpY2ggZnVuY3Rpb24gdGhlIFBD
SSBob3N0IGJyaWRnZSBpcyBhYm91dCB0byBiZS4NCklmIG5lZWQgYmUgSSdsbCByZS1pbnRyb2R1
Y2UgdGhpcyBwYXRjaCBpbiBzb21lIG90aGVyIGZvcm0uDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5k
cg0KPg0KPiBDaGVlcnMsDQo+DQo+Pj4NCj4+PiBDaGVlcnMsDQo+Pj4NCj4+IFRoYW5rIHlvdSwN
Cj4+IE9sZWtzYW5kcg0KPj4NCj4+IFsxXSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9naXRodWIuY29tL3JlbmVzYXMtcmNhci9saW51eC1ic3AvYmxvYi92NS4xMC40MS9yY2Fy
LTUuMS4zLnJjNi9hcmNoL2FybTY0L2Jvb3QvZHRzL3JlbmVzYXMvcjhhNzc5ZjAuZHRzaSpMODQz
X187SXchIUdGXzI5ZGJjUUlVQlBBIWxlZExTREFYaTZnZ1Bsb29zLVd6MGZXUk0zSWxTa0pWWC1I
NFFyVEJTTTlybFd2Q0l0UTREOGh6TEtIZTdmQnRvVU9uSkRtTW9RJCBbZ2l0aHViWy5dY29tXQ0K
Pj4gWzJdIGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL2dpdGh1Yi5jb20vcmVu
ZXNhcy1yY2FyL2xpbnV4LWJzcC9ibG9iL3Y1LjEwLjQxL3JjYXItNS4xLjMucmM2L2FyY2gvYXJt
NjQvYm9vdC9kdHMvcmVuZXNhcy9yOGE3NzlmMC5kdHNpKkw4OTZfXztJdyEhR0ZfMjlkYmNRSVVC
UEEhbGVkTFNEQVhpNmdnUGxvb3MtV3owZldSTTNJbFNrSlZYLUg0UXJUQlNNOXJsV3ZDSXRRNEQ4
aHpMS0hlN2ZCdG9VUEc4dTJuZ1EkIFtnaXRodWJbLl1jb21dDQo+PiBbM10gaHR0cHM6Ly91cmxk
ZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC94ZW4t
ZGV2ZWwvcGF0Y2gvMjAyMTExMDUwNjMzMjYuOTM5ODQzLTUtYW5kcjIwMDBAZ21haWwuY29tL19f
OyEhR0ZfMjlkYmNRSVVCUEEhbGVkTFNEQVhpNmdnUGxvb3MtV3owZldSTTNJbFNrSlZYLUg0UXJU
QlNNOXJsV3ZDSXRRNEQ4aHpMS0hlN2ZCdG9VUFU3OUV0YUEkIFtwYXRjaHdvcmtbLl1rZXJuZWxb
Ll1vcmddDQo+DQo+IFs0XSBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9naXQu
a2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3Ry
ZWUvZHJpdmVycy9vZi9keW5hbWljLmMqbjExMV9fO0l3ISFHRl8yOWRiY1FJVUJQQSFsZWRMU0RB
WGk2Z2dQbG9vcy1XejBmV1JNM0lsU2tKVlgtSDRRclRCU005cmxXdkNJdFE0RDhoekxLSGU3ZkJ0
b1VQUmcxelVVdyQgW2dpdFsuXWtlcm5lbFsuXW9yZ10NCj4gWzVdIGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy94ZW4tZGV2ZWwvMTYzNjQ0MTM0Ny0x
MzM4NTAtMS1naXQtc2VuZC1lbWFpbC1mbnUudmlrcmFtQHhpbGlueC5jb20vX187ISFHRl8yOWRi
Y1FJVUJQQSFsZWRMU0RBWGk2Z2dQbG9vcy1XejBmV1JNM0lsU2tKVlgtSDRRclRCU005cmxXdkNJ
dFE0RDhoekxLSGU3ZkJ0b1VNZmdzMHNkQSQgW2xvcmVbLl1rZXJuZWxbLl1vcmddDQo+DQo+DQo+
Pg0KPg0K

