Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1774B0DF2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Feb 2022 13:55:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269835.463960 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI8yG-0007K6-Rv; Thu, 10 Feb 2022 12:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269835.463960; Thu, 10 Feb 2022 12:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nI8yG-0007HE-OH; Thu, 10 Feb 2022 12:54:48 +0000
Received: by outflank-mailman (input) for mailman id 269835;
 Thu, 10 Feb 2022 12:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=06a2=SZ=epam.com=prvs=40400e4a88=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nI8yF-0007H8-Gi
 for xen-devel@lists.xenproject.org; Thu, 10 Feb 2022 12:54:47 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e8d6ee8-8a70-11ec-8eb8-a37418f5ba1a;
 Thu, 10 Feb 2022 13:54:45 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21ACi2CY012339;
 Thu, 10 Feb 2022 12:54:40 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e51tnr97t-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Feb 2022 12:54:40 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7200.eurprd03.prod.outlook.com (2603:10a6:102:100::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Thu, 10 Feb
 2022 12:54:36 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.012; Thu, 10 Feb 2022
 12:54:36 +0000
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
X-Inumbo-ID: 9e8d6ee8-8a70-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgCwno5PLDIVXp5vwERR/x6fiRxNkZZ1/SKD6VZzDSAv9DI8oDsoO6pv3P4Hn8wEVGMDiBTNcLiAhv2W9/WzhaE4TBdNjUZJx5VhqhrS91CQIMeigucKjf+r7uU4/GEkMzv2OkLPev0/gebntVQnym1QpAQVdtGVUNYpXLJNR48V6LGlPcXwSUckDwuB7vop1nqnrGgxzqxaYifK78Gwy2rpOfJEmcun+acLCJoMqlDFvbZf38FiV4+HBeknsSKTkhYN5CaQIW5CfQlVRO5N3e+v8nQHTo5PlzgqK5sQT7+w9M7bVCZVJjlfE6LEFKm4deWVeTDuW4u4RLgrebxzhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OF319WDOBOLg7iDQ5tD/virkZ9tfy3+tlKy89nAktm0=;
 b=Xhbj+VCMCnwNJBId50idA53olbj+20gf6rxmx/DKLu92GwBp3+xqCJd5JyPXIV6sOxWD6Cbu0q8/w8sPVT2wyzCHyt5zb3xZ8xybO2+TPeLSPrx5OsaK1dYplsY/pZh57OClcsAt0RtX9z6hUYG8WmbMNWTcFj3hzq7a7IZ6CHcsNC1o84dOXnQgpgUpv8B1sIuHSvzderlgT16+PyphxeActQTqLe85KSc2xaNpJ67Fn+snsA/aN7ywje3p3MBD7jvnPbMLCGs6itJbGV2BQ/JdACA57nz2wIAHcgkNT7Mde0FP5N/Vz5vSL5ait7Dml/YTfKF9UEd546l0VJ7u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OF319WDOBOLg7iDQ5tD/virkZ9tfy3+tlKy89nAktm0=;
 b=llI/2L8BKCqsgir6ShRWGtzWo8/txyr5s5/tcBf/PRY9G6SiwybrYBWdQBdClQkdD4H7RhzU511NtYC3npNCM8KhhRKq5I89/ovlN2bZ73TKfQe3vyWxYCIu43x3OnXP9bwvnt0n75/pBl0Y07L7mSKZ6hEEZxnD17HcKW1aQuH+GSNq3wWcSm98X1dd6tRmYmSoUQp2D1E0p/wBWq4kMMB6fq1NsknBIfuCxi9u4328gH9AJvk+YXfUO/Uhc3KJOqHLIdGZxAgP1BciuXKingnIWHh2FK2lquyJrrTI0BH9EFWiQ/+u9s0UBgnuTMiI6y17z4YPv6olttStTslJYg==
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
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Topic: [PATCH v6 10/13] vpci/header: reset the command register when
 adding devices
Thread-Index: 
 AQHYGZFg3nazYSvfA0G+yHTbxcxX2ayDdFgAgAAB6wCABD+NgIAAQmgAgAAT4YCAAAOjAIAAAPCAgAAXGICAAAPHAIAEnAeA
Date: Thu, 10 Feb 2022 12:54:35 +0000
Message-ID: <22084dc5-ba16-3e63-8be6-a8c5c79c9cb0@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-11-andr2000@gmail.com>
 <96381d7e-dafc-acee-3abf-f9815deb207c@suse.com>
 <ef76faac-f9d3-1cb8-06b5-189ccd299542@epam.com>
 <6f0a015b-c48f-76ed-9a51-39c045ff5927@suse.com>
 <2ad372d4-a181-9307-ef50-a5adb61dae66@epam.com>
 <49380584-0577-96f2-ef1c-a96eabf0d227@suse.com>
 <fbd410d1-84ad-2309-ca05-b9ac7f95f1f9@epam.com>
 <dbef1c95-818c-427c-1963-75d584843cff@suse.com>
 <f34cc940-7f5f-aebd-60d9-d1a3d85d1283@epam.com>
 <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
In-Reply-To: <8f35e7c5-3193-4b10-ae25-df838e2262c7@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1d086633-1856-4c37-b049-08d9ec947de5
x-ms-traffictypediagnostic: PA4PR03MB7200:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB720029303B1E8C73A97CD05AE72F9@PA4PR03MB7200.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 qb5Tyiy5GZb8pt5we25sh54W1qNLROs1a3kiBtsqZ5trtd7yPPDIGEVcuO3SrX/WX3FGeLWvCWcw/U45yYDRPBadyHk0DVykl7OijtAwtri+NdlbpnfNWfQG/HbeVeGBTl6P//xOMb20i/9ftbVZ1++qMZgY2cF3QGe6jTllLbAr9BuSvAwo0oC5bf3lyjFQLsHmMTWrRofkJeeZrWoL2NRGmKXmg5nnOSesqpVfqtZTSurF4y8foSR32PbX+XVk3UCeDWLC1lfsBJ9tYz12K25FhfxHRUv3mZIEAhxrtp03Y8TcrLf41mz43ecKBUp3/KYm02WH1XmDa/s7GhKfMrvkDeEq5eiUD1VTZnuzeh4uyRqMlsjU1bf1GjQJiELqp1kfTuY1dPkGe9RBfHmDBPTrGsO1P39lY4fpwundGy5Au/hNdi232YMe6QItUl0pAL2gtQVrQLNkcl4J3iVXIyHqCQCOISijCaOw18/1bqCGxbL5k4wM8+n6z72NAeLinAq9PYqmLGLaL7oVFswdPW5nhgnQWzoH5mtzTSQ1lG/5JVwUmUy5Vbc1vRE7H5OP8wxenffA8RamddHCGM/4vpYMPkzP08d70Py43eiad/WPP5fo7SysYR889nOVZb+BmJKAND5ldQhusERCw+cNDX+vsr++g2aw7im3iSIUcyg6MLT9Qn08Pd8MVq/7vBuBe7bz+6Yqom2rWMTt5JxX/FUlrpiRq00/y+ZEwlfY8CnUsIUXWIjCa3fLwa9duM7h
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(76116006)(54906003)(107886003)(53546011)(6506007)(66946007)(316002)(2616005)(6916009)(38070700005)(4744005)(71200400001)(8676002)(31696002)(86362001)(64756008)(91956017)(66476007)(66556008)(66446008)(6512007)(8936002)(186003)(5660300002)(38100700002)(26005)(36756003)(31686004)(122000001)(4326008)(6486002)(7416002)(2906002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MnhHcC9HQ081YVJ0aXdWL1NuNFF2ZDJrR1IvaUdlbGdoQ1hKUjY3dVJHK01Q?=
 =?utf-8?B?cFJWUld4T3pBTUN4YTVtZ2tteTVNaEo3bHcxWGFkNS91MUIrTUxXN1RPeThD?=
 =?utf-8?B?NFZYLzloM21yVDZHMzA3d1FuNjVvdG4wNjE3bGphNTdaaFpOVHoxY3lRME0w?=
 =?utf-8?B?U0dqT0dEejRwYWV2WTdzSHBSUkZEUXg2N2czSjBGWXB6YllISUMwOGpqN1Br?=
 =?utf-8?B?UUJHbmxZb2Era0oxb0E2N2dqZlcwM1J6dlpiRFY2RmJzZUwwek1GcnIvOWFZ?=
 =?utf-8?B?bGdNVWVxQWdnUTlwVER6UmJlMkZqZFRLWkRkcUFSd1EwNlBBaHlKU1g0S3RV?=
 =?utf-8?B?eDR5WnV5K3Zad1VaZ0xBRndpZVFvU2xsWndPVHBoTlNLeEQxUkI2bFdJOHdl?=
 =?utf-8?B?cmV4OVNuU2d1d2lHeXN5WGVFdUZtVURLTmpxeDZjdTc2VU5RdEFnK2JoaWYy?=
 =?utf-8?B?Ukg4YWhJK1l2ZjZWdmU3b3puU2QvWjhVSW5qSS9jdWRpRnpid09Vamh6WkNE?=
 =?utf-8?B?eCtXVzU3WmJ0NFhkVTZMM0xuYjFlci9yV2Q4b2dYUjlwMWd3R2pHcUpUMDEz?=
 =?utf-8?B?cG5qRHR2OXgzZTZ3Y0paczJmcGdha2VBT1pBbElFSDRIeWxPNGp3eU5JVkxG?=
 =?utf-8?B?VTcyb09CTUdISXU1WGc0Y1Irc0pTTWtxemJnalhzY0h5bmFMWW5HUmdUaFRl?=
 =?utf-8?B?MzByNHJwUUZ3UDhhL0VkUW9qL3JuWWoyc1VFWnpobm1aeTJoSWsyTGh6MG00?=
 =?utf-8?B?b0tFbE11VlV5WDRid3JsK0NrYkpPRExYSk84Z0N2TnhNVUdvQ0hrZ1BadTNx?=
 =?utf-8?B?ZUY5bXpySFpXMVRzU094Y2R3cURhVXBJK1dWNHhXMEpaVFdtWHliQjhEU2dz?=
 =?utf-8?B?TVcwYmxiak9oMkdWVWRBT25BNUw4YlVzTnNUVEliUWloVk1aLzBPd1FqVXlD?=
 =?utf-8?B?VFpLQUt1MWFtT3BTMzBXcVpuNmw4cUEzcngrOVlyQnpRZ2F6ZWlaY2dEYzU1?=
 =?utf-8?B?OXBFN2RlYkJlajcvT2tlK2N6RjFJbE5PT2RrMDBDNjFoUk5lMXBTSW1OMEF1?=
 =?utf-8?B?cGNZdmJlbmFoMU14R1RxRXBqL2pYUjVRMzhxTnpRRWxZWEoyaXhNTDFqQWFM?=
 =?utf-8?B?amdTZzJoNFpHRnZlRmY0bkhxOXN6NEkyanIrTVprMDNDY0t4NnRnYWJQNGFP?=
 =?utf-8?B?d2RvYVI2THc3VkM2Q0swc1MrOFB3UUlieWdCbWVMSDFKTk9JRFgxVXJRZEp4?=
 =?utf-8?B?TmxFaTR6RTBCL1hzc2tjeFhXOTgwTjQwWk5tdzJLblJ0N3RmK1liLzY4R3RW?=
 =?utf-8?B?eVpTb3YyQ3I4eWhSWWo0bDZWMndkaHlKZlRxZGtxMGcwRndjVzM5Q2dzL3Yz?=
 =?utf-8?B?NVpaZ3ZXU1VDWlRiVlVNekpxekhGOWtpZU5McDl5dTQyNDFCUG5XMzB3MnNt?=
 =?utf-8?B?RFdJZ21kaWRXUlBSTWh0RitJcU5nWEpCSnUya2pMK09xNjdWWmp3bWwyQnNj?=
 =?utf-8?B?aGh1RFBGbXh4MmVHbkYzamFJR1ZMRzBuWjdXd1ZibXE3WTl6UHk3YlphaHkw?=
 =?utf-8?B?UEU3ajlNRGpWTkVEV2xyeGRNNGJIdTR0OURUeHVnZ3BLYThzbkxhVkUvcXpX?=
 =?utf-8?B?NXpsRzI2T0lHajV0S1QzZWNJU01pdUlzSkhlQU5kWHllaDlGbGIxcHpIZWpE?=
 =?utf-8?B?NTBPOUxRRDBUbi91SlptaUNOajEvMmpGM1J0UGVLeE9uNE9rTm92QWN5aUdr?=
 =?utf-8?B?ZlJxMy9oRmV1SzF3WlVXMHhZbFhoeFN6c0d3Nm5RVUhRR1E2OWNhT2RwSWFO?=
 =?utf-8?B?dHY0LzBDQnlqaWYvNC9SK0dyWXV5SHBBaTZnZm11UmhoTVh3bWxSSHE0OTh3?=
 =?utf-8?B?enIxRDg4WFBLUitMNDV3NVNNV01hNmkrc1I1T3BEVTYzVURaRGRDNXg0RTFK?=
 =?utf-8?B?VnNLL015WWNwU2pQZkMwaG0yUzVvWi9IUHFQdlEweGI5VkNlWGI1MmhDM0Iv?=
 =?utf-8?B?WnRHSVdKbEdTN2MvN2Y0dlJqMmV1bHorMktGdWlRSno3NGEyUGZYVUtGT2My?=
 =?utf-8?B?M01BY0hLT3dwRzZYRDBnRXpaMitmTFlOTjJ1UWI1eHI2TGtWK0ZvSFFKbVRm?=
 =?utf-8?B?dkpsYlkzMVp5dmNERzloaFhJYlRJMjJuZFRNcmJTTk5YTmZ1VjluanFxblhz?=
 =?utf-8?B?WUwxN3JjdzZMNmNGSHhlem9ydk1HZWdtRHZsZnNJRjJTMmlwQkxqV2JVVHlw?=
 =?utf-8?B?SUNsYW03OXEzeHlmaEZaRFgzeXZXV0dZTEQ2UzBFMFlGRTRHcFRMa3JZeUFj?=
 =?utf-8?B?aWdvb2hJRkFHbTFzMGNlaG1uTE5OVEcyZDE4aTkzcGlxdm1RQzdyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <909259C3ACAF6748B0E79071BA3A4C40@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d086633-1856-4c37-b049-08d9ec947de5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2022 12:54:36.0218
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 80jbWvdRpJ1wkO2jhmBw7rbDymr7V2DxdxVAaZnXY4E4QC6gn1nFCBVusoJRYK0KM5Ca6Y7DKJ3i+z4mhVad36IWqp+eK6I/eEhjL8biYNDFrnChroVFU9nvUvH0WdmO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7200
X-Proofpoint-ORIG-GUID: 23GV0yyQDUxt1CTz6I2LNiJQOnBnDxQh
X-Proofpoint-GUID: 23GV0yyQDUxt1CTz6I2LNiJQOnBnDxQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-10_05,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=846
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202100070

DQoNCk9uIDA3LjAyLjIyIDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDcuMDIuMjAy
MiAxNToxNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+IEJ1dDogV2hhdCdzIHN0
aWxsIG1pc3NpbmcgaGVyZSB0aGVuIGlzIHRoZSBzZXBhcmF0aW9uIG9mIGd1ZXN0IGFuZCBob3N0
DQo+IHZpZXdzLiBXaGVuIHdlIHNldCBJTlR4IGJlaGluZCB0aGUgZ3Vlc3QncyBiYWNrLCBpdCBz
aG91bGRuJ3Qgb2JzZXJ2ZSB0aGUNCj4gYml0IHNldC4gT3IgaXMgdGhpcyBtZWFudCB0byBiZSBh
bm90aGVyIChiaWcpIFRPRE8/DQpXaHkgbm90PyBUaGlzIHNlZW1zIHRvIGJlIHdoZW4gYSBndWVz
dCB0cmllcyB0byBib3RoIGVuYWJsZSBNU0kvTVNJLVgNCmFuZCBJTlR4IHdoaWNoIGlzIGEgd3Jv
bmcgY29tYmluYXRpb24uIExldCdzIHByZXRlbmQgdG8gYmUgYSByZWFsbHkNCnNtYXJ0IFBDSSBk
ZXZpY2Ugd2hpY2ggcGFydGlhbGx5IHJlamVjdHMgc3VjaCBQQ0lfQ09NTUFORCB3cml0ZSwNCnNv
IGd1ZXN0IHN0aWxsIHNlZXMgdGhlIHJlZ2lzdGVyIGNvbnNpc3RlbnQgd3J0IElOVHggYml0LiBO
YW1lbHkgaXQgcmVtYWlucw0Kc2V0Lg0KPg0KPiBKYW4NCj4NCj4NCg==

