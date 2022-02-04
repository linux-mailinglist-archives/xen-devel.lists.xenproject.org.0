Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4134A9882
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 12:38:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265422.458800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwui-00064Z-34; Fri, 04 Feb 2022 11:38:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265422.458800; Fri, 04 Feb 2022 11:38:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFwuh-00062C-Uo; Fri, 04 Feb 2022 11:38:03 +0000
Received: by outflank-mailman (input) for mailman id 265422;
 Fri, 04 Feb 2022 11:38:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFwuf-0005zn-Oc
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 11:38:01 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e725ed57-85ae-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 12:38:00 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214BCcw4021912;
 Fri, 4 Feb 2022 11:37:55 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2051.outbound.protection.outlook.com [104.47.1.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e10hbrqny-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 11:37:54 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5921.eurprd03.prod.outlook.com (2603:10a6:208:159::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.14; Fri, 4 Feb
 2022 11:37:50 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 11:37:50 +0000
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
X-Inumbo-ID: e725ed57-85ae-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aIqKw3ClazqebxYZLJ953QHL3pw/5BH7Nfhj623MyjS6IrebcGRkuJez6nLpfFidLoyQbBN94ygIiKud/NadxJ/5TSgsKIqRJo1ne1qIjS4I7yaXbRAtuYvbu2MXvIQq+dgWQ7Ml7wrGE6bgU0N8ad8AkI4MWgrfvcBeLAymrKABvCSV6tkahDvWyVXN6atG5ZGD7eTUcSQDfyYYFQE2hT38iaRqmsRMt0F5O9uYE7QC280+Nl/ctEq40E9TiFej8g7tgHGVkPpkbvA2DoniWcTeLqQBp1CjNTdF1rJeq0IT1dL2z3yHk0BXuRcV4aFnL4J7pVCoA6ngZF783TrhaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx+6hvdvJTx7ZPDPFskEJfKj8Ep1A1VgE/SYYW6MNpk=;
 b=G3ffurE/yb+9sIzYDMakox0vTJVMKDBG4XR+3Nu5AK+3/8Ixoi5zcjUhFcVc36cFnln2ZiFftLYxqogY0FRzDg5owxsOlcFykqmGAZO9J4CJq7n1LC0ZL5XA8vN0xRx0Yc/HuqvZGBRXhZjvqh854I80WhDVPFmO5uNiAdJypaLTTfr6K3l4tk+I9q9A8F3U4LAdbhbBuWLpBgEcZrYDeekeAgiis3uMHziDF7rUutA1fbwescgakC7kYAngjEnzP94KYde48rV+bko3nm5DP2DmFjtEsFfcmRZyFjodjQUjzyiZiWyRnf2ZVphfHr+0rB4Bc3BJBpK5ZxncSPHkCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx+6hvdvJTx7ZPDPFskEJfKj8Ep1A1VgE/SYYW6MNpk=;
 b=rNkdO431xXTpbhGECOHsYoYNqwdHSESKkvYQqyjS7UfLdD017BcsBtOcPt4U8zwNZJRfYpvbTaYAihUXT0HUUfuDp/xIsqr/5BBgazeovXjei4JPiQXineFlcAHBNYKaRmqq2EcYPD9m8kof90Cwl9R2Gu7JHfcFXOR00FGpuh0uq5ogDJAJQrCdD85Ol/rHU+klD7i1lv9NzYPcZk0+dKEuR1swPYdHaQfcaAzV+Qzl6xk1Ndmjl0ZJ0afCzUkyAxHL56qAVWSSKt+GeKzvhiyvU1yaBfQwyJ7eI8KSalqNPvomFMe9CKaaPfYkQVBIuYpmvLQkZNGaMaxauER58g==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Jan Beulich
	<jbeulich@suse.com>
CC: "julien@xen.org" <julien@xen.org>,
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
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABrEA
Date: Fri, 4 Feb 2022 11:37:50 +0000
Message-ID: <55fc77e8-44c1-8769-f818-d68c05dec987@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
In-Reply-To: <Yf0KcVD8W05A4fbB@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 061f6671-b972-4d60-77bd-08d9e7d2c671
x-ms-traffictypediagnostic: AM0PR03MB5921:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5921942B3CF0044FE47DD454E7299@AM0PR03MB5921.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 l47urjQ2EmOG2jvqeLDn/lHP1K7rqLCUmreE6zcwOlYZ6MsHDVVCzCQFcu7pCYrKWvnFIIt9btrNUcJiiHZshAmGH+Dg8pg5kFJnl0omB7XYctFKL4vI5+OwAMog2OZuGpfZPJGP2VS9FUi5/rnqg+k0miti9IyAVmMepDQbo1b/+qKRitg4wtRjr5YBWpLZdNswWN4m6FjLqN29gNFM9+OjH6BH/ZPNP/tmeivg3ab7SoF42zOqy73+hrcqS1DyTMXYGhtWByGiAylHWy6yLbWQJtOD1/E7VtKZT8FNXdy4ObeE3lNL/JPeaWO7bNwj18JYeAbmjHcmFFFFB25gaWl5ZhrjdMQGUteFAvqN2CayHpBqKpG+VsyxqEvR/exno01V6dR4jA6xThcwKir/6A8p0OclnIY2VmIkP+mfAstxWkCmK8q9G77Vel9E5tUPqNw7JEyIrC2PwtDDOKDmZYY9JCXsq7jo17fvs8g3pEc/mvefl1FerAZt1QhCmkEHLOLq++BC28+hzOcFbHDZcNLc6F1yD+7uOl+6+cbp53cV030obOiNy87Za65JukNnCUjOXXz2Tedr2z6dSptWYXj6/F/+eOYT125y+ZMaZ3J0BULHRKE2O7LDUivhaustAyl0HKPHG1QiJ/3GkXEHp4dL4fMIjpopYknZHHa5pUl0f7xlzM4ks4AhzHUZPmrj9Hg0P0yGH0AXhQyI0CCXi6GbL2kLvbaX/oj71eiFHwbsrsEXoK7fPZ418Ni4QMIb
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38070700005)(36756003)(31696002)(110136005)(122000001)(38100700002)(54906003)(316002)(508600001)(6486002)(7416002)(5660300002)(66946007)(91956017)(6512007)(4326008)(2906002)(83380400001)(64756008)(66446008)(66476007)(66556008)(8936002)(76116006)(8676002)(53546011)(71200400001)(6506007)(2616005)(26005)(186003)(31686004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Qi9XWE55NUJCWURJZUZaNDJYbldVY0lsOGR3WXJUcld2WWhqbW1sNWNGNzhM?=
 =?utf-8?B?WFJ2bHhOQ2JaK280UHRoWXRGYjBCRTVLOEpnVXNoMnl5RjRBcmEvbzFnK3Vv?=
 =?utf-8?B?Ny91U1dCK09jMU1YNFhzTFVqZUd5WVY1NkRGZ1BXRDEvaWFaNmJETXBWdFJw?=
 =?utf-8?B?a0UxajRjYkVWMDFjL2M4dzY5RERLOElOYlRQdTdqSlcwWjUraWtnczhzTzFG?=
 =?utf-8?B?VXljcmJFM0pIdENYYjNvb0ltS2FGcVZ4US9qOWFpdWxFSjRielhVRDhNYkZw?=
 =?utf-8?B?dXFYS0ViVGJMWWE2c3lBM1o1QUJ5WW1Mcnc4ZExMWFBFQ0pQMU5sRUg5Ry9F?=
 =?utf-8?B?eEx5dW1PYUgrY3ZRN3dKUXlkZ2tIdHFoNis5MzMrbDZsNitRcjZTTW81cnNJ?=
 =?utf-8?B?eDZVemRtZW1TVXZUOXFqUnFYTCtJTHloa0dPOTE4b1B1Zk9neXhuMnI2T3RL?=
 =?utf-8?B?c0I1aHRLKzlHOHJiWUhUS0x0elRKekZZUVE5SkxHS015QlJKV3FRTENWeWlu?=
 =?utf-8?B?NUlDYlRoRXZxVmJvYlFNcGxnaERVSjZkYXJWQVV0eVcvTjVDNFZ0ZEtXeWR1?=
 =?utf-8?B?dEdhOTN2dUt6RUkrTG1QdjEzUWFkQThBNndQb0UvdlZVT1AyUzRmNVlFc0xz?=
 =?utf-8?B?STR3bWdIcVFpaGNZVHZBM1lDcm8zZk5Ic2VNWklkMEZuSWRid0V1MTFTRGpT?=
 =?utf-8?B?ZTIrb0M1d3Z4d3RzQ00rRWFUN0MzN1ZNUms5d1ZOQ2djb0lLN0dNYVZyNG54?=
 =?utf-8?B?WFdONnlLT2JZUDIwbkJGdDcvYXZ4Y3lrMDFvckdwcmZScHl0VFNMemdhVkV5?=
 =?utf-8?B?ZTZicnBtcGdmdG1iZGp5blBFRENCa1FmbEhjMFByRFl1ekVkSFRlRmpWYTFJ?=
 =?utf-8?B?V21tT2RKUjJ2VHUvaEE3WEtlRC9EYTNXQ2Z4OGZpV2dEZUR2M2JsakszWWZq?=
 =?utf-8?B?MCtWQUZuUEZCQXgvNndyN2psK3ROMFBPL2FHaU82M1Ira3ltWkhqZEN6VUc5?=
 =?utf-8?B?MXRhdWVaRHFITm5vWGdNeUF1TFJyM0NyUmVnT0MwcVZoMkRoVjg2Skl0WmIz?=
 =?utf-8?B?dlZ5T3dDSVRQT3ZHNHMzd2w2RzBVWlpUbnIzekdhTkVZNkI5MVNMZ3Z3cE52?=
 =?utf-8?B?ZXg1SFZvakVjSWdXVm5HTWZIbWNDTkw2WUF4bkMyb1puWkR3dVpoTHdPMjFL?=
 =?utf-8?B?aGJWV3BqSHZuS3VvZjBLVklEU0VrWUtiWVZncGRZbEFIVW1SQnZoQWgzTjRn?=
 =?utf-8?B?NkM2RmFlMFNCSnI4Vm5Hbk1FaXZSTzR0aXBGZHVEbW1kTHNIajE1TWRhaDNF?=
 =?utf-8?B?TFNtblpNdlBab2dKdXFVa2xNQTVrUHlwS1RyWDFBMXp0N0ZIbHEyeGVrKzlY?=
 =?utf-8?B?UHJSYU1LUWZ0TVo3Mi9NQVZjZlluOE90ZUoySmkwMUVjVjRXaFAxNnBLS2U5?=
 =?utf-8?B?OFlOblNRN0p6MncwTG5ocnBRTGZMTEFkR0pvMTJ5ekpaWW1UamU2MzRwOTVk?=
 =?utf-8?B?OXNES2pWZE5EY3VXYk9aQjcwaXZjTXNPSkMvNnVGcmJ3ZjhVRTdvWFhHVjcr?=
 =?utf-8?B?RSs1RlpETkdScXArYTYxTWNzQ3VuTmFuRzUxTFN5alNLa2JhaUMwMCt0bTRu?=
 =?utf-8?B?cXJJSHRpQW1QN1NDTG9aVElhVEwrcVJCbEdSUjlDcldUc0grTzIwZkd1a3E2?=
 =?utf-8?B?L0V1cTVhQW9UQTJiWTl4bWhINjhLdy9xOGo5TmxYdzM5VXVlMUlrTU5CckFP?=
 =?utf-8?B?SFFxb1dKdmZNclM2WE5kU3B3VzJqZ3RPUXBBcE8reTY3TXZMRkRndzJCcm00?=
 =?utf-8?B?S3l3bjFvak9GRFlEQWNMeHhmamRWTjlxYmVhOFptcjNHOGpuWlZLekJ0QWZ4?=
 =?utf-8?B?dHFDRDh3aGllQlR0cFNqbldvUytkS0dLSW1XYWZNTXNmNXFwNGxyOWJsV3ds?=
 =?utf-8?B?Y3BXbjd2aE1IcmtsSzRyTzRxVkZ4d21UTUVtV3RZZ25xUkZKdEE0Q2R6NGt4?=
 =?utf-8?B?SFBnYzNpaHF4VG9Pa2Z1ekk2TjFHa1FEVEI2NCtxLzZkNmlhU0lFKzZQaWRQ?=
 =?utf-8?B?WWliOGdNM3dKSW9HSU1jQjU3K1pwRXJEcDNGa1BqQ1NmNlN1eTRsd1RGTUI1?=
 =?utf-8?B?YzlMOWd6Mkt2MVUrT2NnMmlFVnZBM2JMV1FrM2NXOVlYOGgwWGc2SDRCTThw?=
 =?utf-8?B?bnhIendLUy9kdkE5ZVNxcVVadXBSZ0RaOVlHMHNXSFhrQkR1K1dzSEFJVjA0?=
 =?utf-8?B?ZndwWXNxaW0wQytIZEVzVm9UQ0Jsb1Q2NWZjNmF5YXFGcVpxemxsa0lRRDNT?=
 =?utf-8?B?cTNramxmYUhuV0pnZ2hCSWc4UXZveEdMNk5qZE14dGtNYVk4ZFRTUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C6ED8DD0E8878146BC9019BA4AC0E890@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061f6671-b972-4d60-77bd-08d9e7d2c671
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 11:37:50.7171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IJpS42gahmqwoaTD0TbpwEbM0Ff8Sb6fcTKAoL5QjhCuESWy/tuTldBm2wjNs/wlaH97h08CzQMxn2BWC/uFB9sJT72sBB3Eavd2wkZInHDmWnkPI8arXkpJixyhEFv2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5921
X-Proofpoint-GUID: 4dtHJKJbAExkwvT47m5MBWQuqzwPmTyE
X-Proofpoint-ORIG-GUID: 4dtHJKJbAExkwvT47m5MBWQuqzwPmTyE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxscore=0 spamscore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040064

DQoNCk9uIDA0LjAyLjIyIDEzOjEzLCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBGcmks
IEZlYiAwNCwgMjAyMiBhdCAxMTo0OToxOEFNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+
IE9uIDA0LjAyLjIwMjIgMTE6MTIsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+
IE9uIDA0LjAyLjIyIDExOjE1LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4gT24gMDQuMDIuMjAy
MiAwOTo1OCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+PiBPbiAwNC4wMi4y
MiAwOTo1MiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gT24gMDQuMDIuMjAyMiAwNzozNCwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4+IEBAIC0yODUsNiArMjg2LDEy
IEBAIHN0YXRpYyBpbnQgbW9kaWZ5X2JhcnMoY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVp
bnQxNl90IGNtZCwgYm9vbCByb21fb25seSkNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsNCj4+Pj4+Pj4gICAgICAgICAgICAgfQ0KPj4+Pj4+PiAgICAgDQo+Pj4+Pj4+ICsg
ICAgICAgIHNwaW5fbG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+PiArICAgICAgICBpZiAo
ICF0bXAtPnZwY2kgKQ0KPj4+Pj4+PiArICAgICAgICB7DQo+Pj4+Pj4+ICsgICAgICAgICAgICBz
cGluX3VubG9jaygmdG1wLT52cGNpX2xvY2spOw0KPj4+Pj4+PiArICAgICAgICAgICAgY29udGlu
dWU7DQo+Pj4+Pj4+ICsgICAgICAgIH0NCj4+Pj4+Pj4gICAgICAgICAgICAgZm9yICggaSA9IDA7
IGkgPCBBUlJBWV9TSVpFKHRtcC0+dnBjaS0+aGVhZGVyLmJhcnMpOyBpKysgKQ0KPj4+Pj4+PiAg
ICAgICAgICAgICB7DQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdnBjaV9i
YXIgKmJhciA9ICZ0bXAtPnZwY2ktPmhlYWRlci5iYXJzW2ldOw0KPj4+Pj4+PiBAQCAtMzAzLDEy
ICszMTAsMTQgQEAgc3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAq
cGRldiwgdWludDE2X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPj4+Pj4+PiAgICAgICAgICAgICAg
ICAgcmMgPSByYW5nZXNldF9yZW1vdmVfcmFuZ2UobWVtLCBzdGFydCwgZW5kKTsNCj4+Pj4+Pj4g
ICAgICAgICAgICAgICAgIGlmICggcmMgKQ0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgew0KPj4+
Pj4+PiArICAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ0bXAtPnZwY2lfbG9jayk7DQo+Pj4+
Pj4+ICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIkZhaWxlZCB0
byByZW1vdmUgWyVseCwgJWx4XTogJWRcbiIsDQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXJ0LCBlbmQsIHJjKTsNCj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICByYW5n
ZXNldF9kZXN0cm95KG1lbSk7DQo+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJj
Ow0KPj4+Pj4+PiAgICAgICAgICAgICAgICAgfQ0KPj4+Pj4+PiAgICAgICAgICAgICB9DQo+Pj4+
Pj4+ICsgICAgICAgIHNwaW5fdW5sb2NrKCZ0bXAtPnZwY2lfbG9jayk7DQo+Pj4+Pj4+ICAgICAg
ICAgfQ0KPj4+Pj4+IEF0IHRoZSBmaXJzdCBnbGFuY2UgdGhpcyBzaW1wbHkgbG9va3MgbGlrZSBh
bm90aGVyIHVuanVzdGlmaWVkIChpbiB0aGUNCj4+Pj4+PiBkZXNjcmlwdGlvbikgY2hhbmdlLCBh
cyB5b3UncmUgbm90IGNvbnZlcnRpbmcgYW55dGhpbmcgaGVyZSBidXQgeW91DQo+Pj4+Pj4gYWN0
dWFsbHkgYWRkIGxvY2tpbmcgKGFuZCBJIHJlYWxpemUgdGhpcyB3YXMgdGhlcmUgYmVmb3JlLCBz
byBJJ20gc29ycnkNCj4+Pj4+PiBmb3Igbm90IHBvaW50aW5nIHRoaXMgb3V0IGVhcmxpZXIpLg0K
Pj4+Pj4gV2VsbCwgSSB0aG91Z2h0IHRoYXQgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgaGFzICIu
Li50aGUgbG9jayBjYW4gYmUNCj4+Pj4+IHVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2Vk
IHJpZ2h0IGF3YXkpIHRvIGNoZWNrIHdoZXRoZXIgdnBjaQ0KPj4+Pj4gaXMgcHJlc2VudCIgYW5k
IHRoaXMgaXMgZW5vdWdoIGZvciBzdWNoIHVzZXMgYXMgaGVyZS4NCj4+Pj4+PiAgICAgQnV0IHRo
ZW4gSSB3b25kZXIgd2hldGhlciB5b3UNCj4+Pj4+PiBhY3R1YWxseSB0ZXN0ZWQgdGhpcywgc2lu
Y2UgSSBjYW4ndCBoZWxwIGdldHRpbmcgdGhlIGltcHJlc3Npb24gdGhhdA0KPj4+Pj4+IHlvdSdy
ZSBpbnRyb2R1Y2luZyBhIGxpdmUtbG9jazogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBmcm9tIGNt
ZF93cml0ZSgpDQo+Pj4+Pj4gYW5kIHJvbV93cml0ZSgpLCB3aGljaCBpbiB0dXJuIGFyZSBjYWxs
ZWQgb3V0IG9mIHZwY2lfd3JpdGUoKS4gWWV0IHRoYXQNCj4+Pj4+PiBmdW5jdGlvbiBhbHJlYWR5
IGhvbGRzIHRoZSBsb2NrLCBhbmQgdGhlIGxvY2sgaXMgbm90IChjdXJyZW50bHkpDQo+Pj4+Pj4g
cmVjdXJzaXZlLiAoRm9yIHRoZSAzcmQgY2FsbGVyIG9mIHRoZSBmdW5jdGlvbiAtIGluaXRfYmFy
cygpIC0gb3RvaA0KPj4+Pj4+IHRoZSBsb2NraW5nIGxvb2tzIHRvIGJlIGVudGlyZWx5IHVubmVj
ZXNzYXJ5LikNCj4+Pj4+IFdlbGwsIHlvdSBhcmUgY29ycmVjdDogaWYgdG1wICE9IHBkZXYgdGhl
biBpdCBpcyBjb3JyZWN0IHRvIGFjcXVpcmUNCj4+Pj4+IHRoZSBsb2NrLiBCdXQgaWYgdG1wID09
IHBkZXYgYW5kIHJvbV9vbmx5ID09IHRydWUNCj4+Pj4+IHRoZW4gd2UnbGwgZGVhZGxvY2suDQo+
Pj4+Pg0KPj4+Pj4gSXQgc2VlbXMgd2UgbmVlZCB0byBoYXZlIHRoZSBsb2NraW5nIGNvbmRpdGlv
bmFsLCBlLmcuIG9ubHkgbG9jaw0KPj4+Pj4gaWYgdG1wICE9IHBkZXYNCj4+Pj4gV2hpY2ggd2ls
bCBhZGRyZXNzIHRoZSBsaXZlLWxvY2ssIGJ1dCBpbnRyb2R1Y2UgQUJCQSBkZWFkbG9jayBwb3Rl
bnRpYWwNCj4+Pj4gYmV0d2VlbiB0aGUgdHdvIGxvY2tzLg0KPj4+IEkgYW0gbm90IHN1cmUgSSBj
YW4gc3VnZ2VzdCBhIGJldHRlciBzb2x1dGlvbiBoZXJlDQo+Pj4gQFJvZ2VyLCBASmFuLCBjb3Vs
ZCB5b3UgcGxlYXNlIGhlbHAgaGVyZT8NCj4+IFdlbGwsIGZpcnN0IG9mIGFsbCBJJ2QgbGlrZSB0
byBtZW50aW9uIHRoYXQgd2hpbGUgaXQgbWF5IGhhdmUgYmVlbiBva2F5IHRvDQo+PiBub3QgaG9s
ZCBwY2lkZXZzX2xvY2sgaGVyZSBmb3IgRG9tMCwgaXQgc3VyZWx5IG5lZWRzIGFjcXVpcmluZyB3
aGVuIGRlYWxpbmcNCj4+IHdpdGggRG9tVS1zJyBsaXN0cyBvZiBQQ0kgZGV2aWNlcy4gVGhlIHJl
cXVpcmVtZW50IHJlYWxseSBhcHBsaWVzIHRvIHRoZQ0KPj4gb3RoZXIgdXNlIG9mIGZvcl9lYWNo
X3BkZXYoKSBhcyB3ZWxsIChpbiB2cGNpX2R1bXBfbXNpKCkpLCBleGNlcHQgdGhhdA0KPj4gdGhl
cmUgaXQgcHJvYmFibHkgd2FudHMgdG8gYmUgYSB0cnktbG9jay4NCj4+DQo+PiBOZXh0IEknZCBs
aWtlIHRvIHBvaW50IG91dCB0aGF0IGhlcmUgd2UgaGF2ZSB0aGUgc3RpbGwgcGVuZGluZyBpc3N1
ZSBvZg0KPj4gaG93IHRvIGRlYWwgd2l0aCBoaWRkZW4gZGV2aWNlcywgd2hpY2ggRG9tMCBjYW4g
YWNjZXNzLiBTZWUgbXkgUkZDIHBhdGNoDQo+PiAidlBDSTogYWNjb3VudCBmb3IgaGlkZGVuIGRl
dmljZXMgaW4gbW9kaWZ5X2JhcnMoKSIuIFdoYXRldmVyIHRoZSBzb2x1dGlvbg0KPj4gaGVyZSwg
SSB0aGluayBpdCB3YW50cyB0byBhdCBsZWFzdCBhY2NvdW50IGZvciB0aGUgZXh0cmEgbmVlZCB0
aGVyZS4NCj4gWWVzLCBzb3JyeSwgSSBzaG91bGQgdGFrZSBjYXJlIG9mIHRoYXQuDQo+DQo+PiBO
b3cgaXQgaXMgcXVpdGUgY2xlYXIgdGhhdCBwY2lkZXZzX2xvY2sgaXNuJ3QgZ29pbmcgdG8gaGVs
cCB3aXRoIGF2b2lkaW5nDQo+PiB0aGUgZGVhZGxvY2ssIGFzIGl0J3MgaW1vIG5vdCBhbiBvcHRp
b24gYXQgYWxsIHRvIGFjcXVpcmUgdGhhdCBsb2NrDQo+PiBldmVyeXdoZXJlIGVsc2UgeW91IGFj
Y2VzcyAtPnZwY2kgKG9yIGVsc2UgdGhlIHZwY2kgbG9jayBpdHNlbGYgd291bGQgYmUNCj4+IHBv
aW50bGVzcykuIEJ1dCBhIHBlci1kb21haW4gYXV4aWxpYXJ5IHIvdyBsb2NrIG1heSBoZWxwOiBP
dGhlciBwYXRocw0KPj4gd291bGQgYWNxdWlyZSBpdCBpbiByZWFkIG1vZGUsIGFuZCBoZXJlIHlv
dSdkIGFjcXVpcmUgaXQgaW4gd3JpdGUgbW9kZSAoaW4NCj4+IHRoZSBmb3JtZXIgY2FzZSBhcm91
bmQgdGhlIHZwY2kgbG9jaywgd2hpbGUgaW4gdGhlIGxhdHRlciBjYXNlIHRoZXJlIG1heQ0KPj4g
dGhlbiBub3QgYmUgYW55IG5lZWQgdG8gYWNxdWlyZSB0aGUgaW5kaXZpZHVhbCB2cGNpIGxvY2tz
IGF0IGFsbCkuIEZUQU9EOg0KPj4gSSBoYXZlbid0IGZ1bGx5IHRob3VnaHQgdGhyb3VnaCBhbGwg
aW1wbGljYXRpb25zIChhbmQgaGVuY2Ugd2hldGhlciB0aGlzIGlzDQo+PiB2aWFibGUgaW4gdGhl
IGZpcnN0IHBsYWNlKTsgSSBleHBlY3QgeW91IHdpbGwsIGRvY3VtZW50aW5nIHdoYXQgeW91J3Zl
DQo+PiBmb3VuZCBpbiB0aGUgcmVzdWx0aW5nIHBhdGNoIGRlc2NyaXB0aW9uLiBPZiBjb3Vyc2Ug
dGhlIGRvdWJsZSBsb2NrDQo+PiBhY3F1aXJlL3JlbGVhc2Ugd291bGQgdGhlbiBsaWtlbHkgd2Fu
dCBoaWRpbmcgaW4gaGVscGVyIGZ1bmN0aW9ucy4NCj4gSSd2ZSBiZWVuIGFsc28gdGhpbmtpbmcg
YWJvdXQgdGhpcywgYW5kIHdoZXRoZXIgaXQncyByZWFsbHkgd29ydGggdG8NCj4gaGF2ZSBhIHBl
ci1kZXZpY2UgbG9jayByYXRoZXIgdGhhbiBhIHBlci1kb21haW4gb25lIHRoYXQgcHJvdGVjdHMg
YWxsDQo+IHZwY2kgcmVnaW9ucyBvZiB0aGUgZGV2aWNlcyBhc3NpZ25lZCB0byB0aGUgZG9tYWlu
Lg0KPg0KPiBUaGUgT1MgaXMgbGlrZWx5IHRvIHNlcmlhbGl6ZSBhY2Nlc3NlcyB0byB0aGUgUENJ
IGNvbmZpZyBzcGFjZSBhbnl3YXksDQo+IGFuZCB0aGUgb25seSBwbGFjZSBJIGNvdWxkIHNlZSBh
IGJlbmVmaXQgb2YgaGF2aW5nIHBlci1kZXZpY2UgbG9ja3MgaXMNCj4gaW4gdGhlIGhhbmRsaW5n
IG9mIE1TSS1YIHRhYmxlcywgYXMgdGhlIGhhbmRsaW5nIG9mIHRoZSBtYXNrIGJpdCBpcw0KPiBs
aWtlbHkgdmVyeSBwZXJmb3JtYW5jZSBzZW5zaXRpdmUsIHNvIGFkZGluZyBhIHBlci1kb21haW4g
bG9jayB0aGVyZQ0KPiBjb3VsZCBiZSBhIGJvdHRsZW5lY2suDQo+DQo+IFdlIGNvdWxkIGFsdGVy
bmF0aXZlbHkgZG8gYSBwZXItZG9tYWluIHJ3bG9jayBmb3IgdnBjaSBhbmQgc3BlY2lhbCBjYXNl
DQo+IHRoZSBNU0ktWCBhcmVhIHRvIGFsc28gaGF2ZSBhIHBlci1kZXZpY2Ugc3BlY2lmaWMgbG9j
ay4gQXQgd2hpY2ggcG9pbnQNCj4gaXQgYmVjb21lcyBmYWlybHkgc2ltaWxhciB0byB3aGF0IHlv
dSBwcm9wb3NlLg0KSSBuZWVkIGEgZGVjaXNpb24uDQpQbGVhc2UuDQo+DQo+IFRoYW5rcywgUm9n
ZXIuDQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

