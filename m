Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0A4AD53B
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267928.461690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNDl-0004HX-JN; Tue, 08 Feb 2022 09:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267928.461690; Tue, 08 Feb 2022 09:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNDl-0004F9-GJ; Tue, 08 Feb 2022 09:55:37 +0000
Received: by outflank-mailman (input) for mailman id 267928;
 Tue, 08 Feb 2022 09:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNDk-0004F3-GA
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:55:36 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 41da04cd-88c5-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 10:55:35 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189rkCt002992;
 Tue, 8 Feb 2022 09:55:31 GMT
Received: from eur02-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2056.outbound.protection.outlook.com [104.47.6.56])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3p9gr06j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:55:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PR3PR03MB6363.eurprd03.prod.outlook.com (2603:10a6:102:71::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 09:55:27 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:55:27 +0000
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
X-Inumbo-ID: 41da04cd-88c5-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QcY3BnyU0C76RuHptxdHYDJM4MlsbGsuKaW5vhPVy5auXSpC6EQ3ORfdTsyTxyX3VQsAuNcpUzkDffYKZm3K9e5P+I5ghTBfPFPvEZGRZuT8dkVzg1b4GjxGaje4sXtsdAoPkI8Zpz8J8v8XzvkYpoy9hFavQT6TS31kJAJmQoncngnZNKZV5dtUZnPqOjXncQKOSNHy3ctIUKxNbNLXy8sCh+Ld8XFUNyew4LDaNlH5oXBtkcWnvcfamP6EhygPw8yIJoEKcvPupNxheNBpKNvwJSQe7zlwAu2FB6vc7L4sIUPS4bG9CUgIaibLG9B3lFjGJ3CJyzGBgF6viFcQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELE4ept9w7zonXmv40CfvMpz45CqGkgRm7/PIfSpHXs=;
 b=AYAWhKzwDLWLC2CNXD1Ct2k/+43fCxOGEpoUS617sQtF1yzbX8/tSTBX/4hw0Di88vOvZ3Wpnd/hA+2dQQxzFV99sbmU62dlpwMvrPi5qcB6de/FUAILcizTsIDIrjwt562CoxcGg4Dx7jLfZhfps2HvZObmHd6IsI30XrU/rxJ57LhevIw/aq2J82ktilNf97FO2ZtdKjRFiaJ5xTMyQuiimEK8rogRp6GLisfWEX9DffaZcAtDGQK0oh6nW1yTN/HuT8h6xRksRrmHqv1M1mYwCI8dRmkY7H2uuyjoUecL+OGbNm1B3HkItPaBaZO1sp7HAfw6HYj51GLrnlkmiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELE4ept9w7zonXmv40CfvMpz45CqGkgRm7/PIfSpHXs=;
 b=Gqph0VkXHhBQMiXbhCnr/8NuFOGWFOVW+4qiHHMKGynWaqWbqogg93Xy+9Hju9yfYr7FMm4zS1hbKrDWWV7+rIYTAbAE28iy6xrNHY9xEkngLRuoGnINzsiWx902UL54HAo2k0SjXti6vJNgh3lfhPGcXh688xirJk7vRTvmq19GjqPoD+WciJb/lsBtVb8urOa6j499d5WJ3OSaV3StcqvtRnpj6i0zX1EMn2ZVxDs3ejfKmF37SHx966w6iSfwgcgmjBcsOcHG5LTbJWKAmNC27+Xg/NIZuO1Usl3IGJQAKaKagDtS+zzcOaNCxUcdWG9bkeFdyhHuwsXo5r1ORw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
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
	<xen-devel@lists.xenproject.org>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Topic: [PATCH v6 05/13] vpci: add hooks for PCI device assign/de-assign
Thread-Index: 
 AQHYGZFdYv4W1RdbQkeQtzN+PyKqmqyITGQAgAENNICAAAt2AIAAA+uAgAAEsACAAAMyAA==
Date: Tue, 8 Feb 2022 09:55:27 +0000
Message-ID: <9f58a8ff-44b4-3249-5858-9988644b2d4e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-6-andr2000@gmail.com>
 <16cea1df-3d0f-d404-2b88-aab47ad5548b@suse.com>
 <3fe6dbe3-51c6-f87f-23f9-cf2e1a924326@epam.com>
 <582ee8f9-7b01-4adc-6a8a-ce8b1dffd534@suse.com>
 <e225553b-b29c-0448-fb9f-f8b513d9f77d@epam.com>
 <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
In-Reply-To: <0fd8a0ac-dc91-287e-536e-1684892837ab@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4961d66-d7da-4379-81f6-08d9eae92292
x-ms-traffictypediagnostic: PR3PR03MB6363:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PR3PR03MB636358141310BD29F6D444EFE72D9@PR3PR03MB6363.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JQg6gpmmifsgmbcicKoPDgXCegIgSKNubvEyjSr6KKk2WUlg9R3EytkjMawBvwTDdnCZVlBGYKGAeHIGXPWIMItZbsyT7wlMX3ELDiYisdqYlcdj4r+iDuxEHdGeo+iNoRO3qcTs7xAoc+ptIlMWCR+seskD2xzxluda2Uh8QMp8+YQp51KkPf/m+TVG+oyWxO7ro2lGRomCLZNfeofXn5Spbw/eVu6VCBR6E5d6c7JfDsC+hk8SFU6KkJFn2B5wNVlRp9zzODD0nMINDm2xOBZMsFBWPGWAawGZobYzMk5tKuRY0qC8C+dpuw6ugMSb+wHzKhXeUHzjqY6xUhA67y2p6d4+8mCPGmtmgyofLP72RwIPSaeXz6Ss9lvcXHvFXHsX1AAj5lQB/V08DNrWLuO2cFAAKZkYezOJcc+IJBsTKfhJdeTKmw2LKjI8B0/E5gdQ1uqwQTexL6aTe7hxYMRQYf7n5ZpgYNMf4O3bmKmWiZcxWE7q6Jdb0wSsy9WKZ9vYkjYk+DSTgfUx+ojfEyeFuWZJrHfo6eOxI//FuAJufDWffYvLFYWwnMwgzNFAIgXC33vpk9aRJLNzpL3556v+TATS/JOh8nL5mFK8CeTxdA21wVebuaq3XYW2gIXZVeqxmusB1VE/LjG6fdiJmmM8gsOKecXKWekunAmGCGCNFIo5muxOrIN6YPEcCCHbuWa6mMrV9+jClfcFy+5/2Szl42DGDn66hGddFXA2lPhikmzfX08i/nZypYCfzq2e
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(38100700002)(5660300002)(6506007)(2616005)(55236004)(53546011)(6512007)(7416002)(4326008)(76116006)(66946007)(91956017)(66446008)(36756003)(8936002)(107886003)(54906003)(2906002)(8676002)(26005)(186003)(6486002)(71200400001)(508600001)(38070700005)(6916009)(122000001)(31696002)(31686004)(86362001)(316002)(64756008)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WC9TNWRqdkN5ZnU0Vk9zS01JUUxWNkZjenc1MmRaSkd4RklkN1Z1QXBBdGRj?=
 =?utf-8?B?MHNhd0xiSGJZNFQvenBGVys3c3gxQzlmcHF2VEY4ejJyTlp5c2JRMTcybXpw?=
 =?utf-8?B?MmRua1oyNjZ6VllNd2JYNmpod0pxZEtxVTZKY0cvcWwzeUFVd1RNSitibXBJ?=
 =?utf-8?B?SmVoQkloRjNkYnArVVluMVkzbGhkVzkrRVNkT2pNUEhnNTZvMXRDRld1Zzlx?=
 =?utf-8?B?Y1JSSTcrbFlSYXA2U0xGSFhTMFJnUTFtSGFsNG9MOFlpbE5pU2kxay9vNUZ3?=
 =?utf-8?B?ODRmL25ONzN2YlY1QmxkZkRhczdMdXVidEJhZVNMQVd5MHpMWEcyeDlaa1RR?=
 =?utf-8?B?NnJsYkgxZ3BuQ280bU5oU3RFeWRzU0FQeDFNM3dQT3E4NmdtOWF0U3V0aUY2?=
 =?utf-8?B?UC9US3lxdjBuSVUraXcwbWNjZzBRRi9hM0UyQ1R1T1hxbEphblUvazJSMVNz?=
 =?utf-8?B?aEl6Mm5ac0NRTGJGWVVBcUtveWZJQ2dSa3Q4WStGNG5adUNGb094Z3dnSU9O?=
 =?utf-8?B?a2xwNWpmaFpwbElsT2EwSXNMVVBNdm5DWWJSeUxCZ2dBbmtFVUgrRWNEZ01p?=
 =?utf-8?B?ZExENFdmN3VTYUFTM0N4KzNkbTNDOXdUcmZKcGQrUlF1R0VQUUhjNnN5dkIr?=
 =?utf-8?B?TDZVV3BxNjBHRlA5VGpLTTVCaUM5RUxhWitHTWVyUlhGVWlZQjREanRTdDlI?=
 =?utf-8?B?U3BCbkZSSFpraVlOdDIvL29HR0RJYzVEZTlvWFgyejlZVHdpbU1yS3hMZ1RS?=
 =?utf-8?B?MlFXam5tYzdCajdGaTdpQ2E4aXJmVFg0RTcrUzFteHA3MEQraHNWNDBMKzdN?=
 =?utf-8?B?ZER0UTFDYTlVb1g1R0tIMFRnTHhlei9zUXRQb0l2QWM5ODlqcUtndmN6bElH?=
 =?utf-8?B?clRjbHJJMXBBZHlVaTBDdGQ1Q0EyRUZLSUd6Q0JzVmgyYTlHYlZzVElUNjJm?=
 =?utf-8?B?RzdLTk4vR2x0ZExtSVAwWlU5TEtXUEhSaTJLMFM4enlaMExadjNLN2pHejNX?=
 =?utf-8?B?RDdETUpqQXFSWDc0ZU42eWpacHJuVWVIc3lhK0NSdUFQNXZlbC96MjJnQi9v?=
 =?utf-8?B?Q2l3RVJxMlBPSFZTWHViZkFWT0EvV3lSVXFCL0pvemNjS3NRZ2lpRjdPbjdI?=
 =?utf-8?B?WWExT00vREkxWE0yczhsWGl4czZlNytaS3lmaGttVmpmczlWSUd0dGVaUnZO?=
 =?utf-8?B?cXRDeWd0ZUVMNXlRV3JhT3F0eHBKUCtpV3lmcVg3Y3duZStNb0VhbGl4eGdB?=
 =?utf-8?B?V1Jpd0w2SGxtbncrZ2oxdkQ5bzhhem45MEF0dUw3c294R1VKS20wQ1FrSVVD?=
 =?utf-8?B?cnRySFdzUTlWeWxXTGJ6dXNiM2c5WUNFajU1WVNKeThDd2dhdWVkUWxuVkhz?=
 =?utf-8?B?M3FBOGZPWEk2UUlEc3o5eW41ZHBGVlgwWGRyZ2c5Vm9KNW5hQTB0d0lzVHkx?=
 =?utf-8?B?cHVVeU1PdEJPWVV5dzlIQTA3MGVXSEY0UHBwKy9QNmtwS2wwTkE3dnFNY0F2?=
 =?utf-8?B?Kzd0M0ozWVdtbWNrT2pPYnEvdWRic2paMThsZ2tvWXhXVDBUVkFNaVBra2pJ?=
 =?utf-8?B?bUtLdUtnWUhlTlZ2SnF3M1hiSHdKTTBpU1FPeG5SeGpicXNpWmd1MXcraUZG?=
 =?utf-8?B?NkVjUkpaRE9kZDFKRkRYN00vbUtoTlBRRG1XTHc2Vnl1U1dmTUllYUFLWDFY?=
 =?utf-8?B?b0tseGdYaWVQNkYrTXVBYUhqWjdjcm5HNTJTQmY4UDdSR1FDNzNWa3p1aTE1?=
 =?utf-8?B?M3FidkpITWpBci9NYWsrd1lmY2xIS0dPM1hWU252SXUvN05sUmpOWm9nY1NO?=
 =?utf-8?B?bHkyUURYdG1IZUVsYitvM0pNaGVxRVhNTWI0dVJXV2xTTk11bzczZW1vZEFZ?=
 =?utf-8?B?S083R0g0bzFSVzdmSlh4d2FsL1dIaWQwSmhYU0kvamFHSDRDdW9MeGVSS2Nv?=
 =?utf-8?B?d0h4ZGNpZG9WVWNyZnpDUndNNW1DTjA4WFFwMlNLeXVGcGMxekt1bHRBU2NX?=
 =?utf-8?B?YW56Uk1mVnE2bW0zMGhrejh4OFdxT1JUcitzRDhvaWtvY1FDT2hDMDBYdU1W?=
 =?utf-8?B?Szk1MWtzcVpVdTlEeFZkR3dudkRHTWkyZ0hRaTFXallFN0EzNm1zSFVxNURL?=
 =?utf-8?B?WTFtcnZ0ck4wZEI4OC8xRldFVGRqNW02ZzEvK3FJcE1WOUxvRnhGRGhrTW9D?=
 =?utf-8?B?TExZb3RpdHdsOU1zUVhBS2FpSURZWEFrb0xvNXE3cW1uNVBRbERab2pPbzc5?=
 =?utf-8?B?RTYyRkdLVFY3L041cTFnMzNXbUVXZmdPWjk0WlMvK1VIZjI5UFVKV2d4SExj?=
 =?utf-8?B?WXdhek83ekhnU0NrcEloZndkYTRPWXhscWsvYm9ZM1VVZTFHZkx4WHl3SFo2?=
 =?utf-8?Q?J4V+cRPsElG1+84Y=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23893FAA6DC70D4EB49EAA710C9C8F87@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4961d66-d7da-4379-81f6-08d9eae92292
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:55:27.6536
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /A+Lokq3Bh886jzcgIhIkomsx1rSjv6jScOOGMDloq/GhDCfBviv4MngwnXuvNAfwdUx9du0xYgxqm1mn13NSPYw/TvyGsW1cogowuINX1Nz2HA4s7udUBt1ewhx/GeU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6363
X-Proofpoint-ORIG-GUID: avZZAkafG9LlT4CPTSVvMc9lokojihXk
X-Proofpoint-GUID: avZZAkafG9LlT4CPTSVvMc9lokojihXk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080056

DQoNCk9uIDA4LjAyLjIyIDExOjQ0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMDoyNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwOC4wMi4yMiAx
MToxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDguMDIuMjAyMiAwOTozMiwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IE9uIDA3LjAyLjIyIDE4OjI4LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+IE9uIDA0LjAyLjIwMjIgMDc6MzQsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEBAIC0xNTA3LDYgKzE1MTEsOCBAQCBzdGF0aWMgaW50IGFz
c2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwg
dTMyIGZsYWcpDQo+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV90b19kZXYo
cGRldiksIGZsYWcpOw0KPj4+Pj4+ICAgICAgICAgfQ0KPj4+Pj4+ICAgICANCj4+Pj4+PiArICAg
IHJjID0gdnBjaV9hc3NpZ25fZGV2aWNlKGQsIHBkZXYpOw0KPj4+Pj4+ICsNCj4+Pj4+PiAgICAg
IGRvbmU6DQo+Pj4+Pj4gICAgICAgICBpZiAoIHJjICkNCj4+Pj4+PiAgICAgICAgICAgICBwcmlu
dGsoWEVOTE9HX0dfV0FSTklORyAiJXBkOiBhc3NpZ24gKCVwcCkgZmFpbGVkICglZClcbiIsDQo+
Pj4+PiBUaGVyZSdzIG5vIGF0dGVtcHQgdG8gdW5kbyBhbnl0aGluZyBpbiB0aGUgY2FzZSBvZiBn
ZXR0aW5nIGJhY2sgYW4NCj4+Pj4+IGVycm9yLiBJU1RSIHRoaXMgYmVpbmcgZGVlbWVkIG9rYXkg
b24gdGhlIGJhc2lzIHRoYXQgdGhlIHRvb2wgc3RhY2sNCj4+Pj4+IHdvdWxkIHRoZW4gdGFrZSB3
aGF0ZXZlciBhY3Rpb24sIGJ1dCB3aGF0ZXZlciBpdCBpcyB0aGF0IGlzIHN1cHBvc2VkDQo+Pj4+
PiB0byBkZWFsIHdpdGggZXJyb3JzIGhlcmUgd2FudHMgc3BlbGxpbmcgb3V0IGluIHRoZSBkZXNj
cmlwdGlvbi4NCj4+Pj4gV2h5PyBJIGRvbid0IGNoYW5nZSB0aGUgcHJldmlvdXNseSBleHBlY3Rl
ZCBkZWNpc2lvbiBhbmQgaW1wbGVtZW50YXRpb24NCj4+Pj4gb2YgdGhlIGFzc2lnbl9kZXZpY2Ug
ZnVuY3Rpb246IEkgdXNlIGVycm9yIHBhdGhzIGFzIHRoZXkgd2VyZSB1c2VkIGJlZm9yZQ0KPj4+
PiBmb3IgdGhlIGV4aXN0aW5nIGNvZGUuIFNvLCBJIHNlZSBubyBjbGVhciByZWFzb24gdG8gc3Ry
ZXNzIHRoYXQgdGhlIGV4aXN0aW5nDQo+Pj4+IGFuZCBuZXcgY29kZSByZWxpZXMgb24gdGhlIHRv
b2xzdGFjaw0KPj4+IFNheWluZyBoYWxmIGEgc2VudGVuY2Ugb24gdGhpcyBpcyBoZWxwaW5nIHJl
dmlldy4NCj4+IE9rDQo+Pj4+PiBXaGF0J3MgaW1wb3J0YW50IGlzIHRoYXQgbm8gY2FsbGVyIHVw
IHRoZSBjYWxsIHRyZWUgbWF5IGJlIGxlZnQgd2l0aA0KPj4+Pj4gdGhlIGltcHJlc3Npb24gdGhh
dCB0aGUgZGV2aWNlIGlzIHN0aWxsIG93bmVkIGJ5IHRoZSBvcmlnaW5hbA0KPj4+Pj4gZG9tYWlu
LiBXaXRoIGhvdyB5b3UgaGF2ZSBpdCwgdGhlIGRldmljZSBpcyBnb2luZyB0byBiZSBvd25lZCBi
eSB0aGUNCj4+Pj4+IG5ldyBkb21haW4sIGJ1dCBub3QgcmVhbGx5IHVzYWJsZS4NCj4+Pj4gVGhp
cyBpcyBub3QgdHJ1ZTogdnBjaV9hc3NpZ25fZGV2aWNlIHdpbGwgY2FsbCB2cGNpX2RlYXNzaWdu
X2RldmljZQ0KPj4+PiBpbnRlcm5hbGx5IGlmIGl0IGZhaWxzLiBTbywgdGhlIGRldmljZSB3b24n
dCBiZSBhc3NpZ25lZCBpbiB0aGlzIGNhc2UNCj4+PiBOby4gVGhlIGRldmljZSBpcyBhc3NpZ25l
ZCB0byB3aGF0ZXZlciBwZGV2LT5kb21haW4gaG9sZHMuIENhbGxpbmcNCj4+PiB2cGNpX2RlYXNz
aWduX2RldmljZSgpIHRoZXJlIG1lcmVseSBtYWtlcyBzdXJlIHRoYXQgdGhlIGRldmljZSB3aWxs
DQo+Pj4gaGF2ZSBfbm9fIHZQQ0kgZGF0YSBhbmQgaG9va3MgaW4gcGxhY2UsIHJhdGhlciB0aGFu
IHNvbWV0aGluZw0KPj4+IHBhcnRpYWwuDQo+PiBTbywgdGhpcyBwYXRjaCBpcyBvbmx5IGRlYWxp
bmcgd2l0aCB2cGNpIGFzc2lnbi9kZS1hc3NpZ24NCj4+IEFuZCBpdCByb2xscyBiYWNrIHdoYXQg
aXQgZGlkIGluIGNhc2Ugb2YgYSBmYWlsdXJlDQo+PiBJdCBhbHNvIHJldHVybnMgcmMgaW4gYXNz
aWduX2RldmljZSB0byBzaWduYWwgaXQgaGFzIGZhaWxlZA0KPj4gV2hhdCBlbHNlIGlzIGV4cGVj
dGVkIGZyb20gdGhpcyBwYXRjaD8/DQo+IFVudGlsIG5vdyBpZiBhc3NpZ25fZGV2aWNlKCkgcmV0
dXJucyBhbiBlcnJvciwgdGhpcyB0ZWxscyB0aGUgY2FsbGVyDQo+IHRoYXQgdGhlIGRldmljZSBk
aWQgbm90IGNoYW5nZSBvd25lcnNoaXA7DQpOb3Qgc3VyZSB0aGlzIGlzIHRoZSBjYXNlOg0KIMKg
wqDCoCBpZiAoIChyYyA9IGlvbW11X2NhbGwoaGQtPnBsYXRmb3JtX29wcywgYXNzaWduX2Rldmlj
ZSwgZCwgZGV2Zm4sDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGNpX3RvX2RldihwZGV2KSwgZmxhZykpICkNCmlvbW11X2NhbGwgY2FuIGxlYXZl
IHRoZSBuZXcgb3duZXJzaGlwIGV2ZW4gbm93IHdpdGhvdXQNCnZwY2lfYXNzaWduX2RldmljZS4g
TXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IHRoZSByb2xsLWJhY2sgaXMNCmV4cGVjdGVkIHRvIGJl
IHBlcmZvcm1lZCBieSB0aGUgdG9vbHN0YWNrIGFuZCB2cGNpX2Fzc2lnbl9kZXZpY2UNCmRvZXNu
J3QgcHJldmVudCB0aGF0IGJ5IHJldHVybmluZyByYy4gRXZlbiBtb3JlLCBiZWZvcmUgd2UgZGlz
Y3Vzc2VkDQp0aGF0IGl0IHdvdWxkIGJlIGdvb2QgZm9yIHZwY2lfYXNzaWduX2RldmljZSB0byB0
cnkgcmVjb3ZlcmluZyBmcm9tDQphIHBvc3NpYmxlIGVycm9yIGVhcmx5IHdoaWNoIGlzIGRvbmUg
YnkgY2FsbGluZyB2cGNpX2RlYXNzaWduX2RldmljZQ0KaW50ZXJuYWxseS4NCg0KU28sIGlmIHlv
dSB3YW50IHRoZSB0aGluZ3MgdG8gYmUgY2xlYXJseSBoYW5kbGVkIHdpdGhvdXQgcmVseWluZyBv
biB0aGUNCnRvb2xzdGFjayB0aGVuIGl0IGlzIG5vdCB2cGNpX2Fzc2lnbl9kZXZpY2UgaW50cm9k
dWNlZCBpc3N1ZSwgYnV0IHRoZQ0KZXhpc3Rpbmcgb25lLCB3aGljaCBuZWVkcyAoaWYgdGhlcmUg
aXMgYSBnb29kIHJlYXNvbikgdG8gYmUgZml4ZWQNCnNlcGFyYXRlbHkuDQpJIHRoaW5rIHRoYXQg
bmV3IGNvZGUgZG9lc24ndCBtYWtlIHRoaW5ncyB3b3JzZS4gQXQgbGVhc3QNCg0KPiAgIGluIHRo
ZSB3b3JzdCBjYXNlIGl0IGVpdGhlcg0KPiBvbmx5IG1vdmVkIHRvIHRoZSBxdWFyYW50aW5lIGRv
bWFpbiwgb3IgdGhlIG5ldyBvd25lciBtYXkgaGF2ZSBiZWVuDQo+IGNyYXNoZWQuIEluIG5vIGNh
c2UgaXMgdGhlIGRldmljZSBvd25lZCBieSBhbiBhbGl2ZSBEb21VLiBZb3UncmUNCj4gY2hhbmdp
bmcgdGhpcyBwcm9wZXJ0eSwgYW5kIGhlbmNlIHlvdSBuZWVkIHRvIG1ha2UgY2xlYXIvc3VyZSB0
aGF0DQo+IHRoaXMgaXNuJ3QgY29sbGlkaW5nIHdpdGggYXNzdW1wdGlvbnMgbWFkZSBlbHNld2hl
cmUuDQo+DQo+IEphbg0KPg0KPg0K

