Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E188B4A6E50
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 11:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.263982.456914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCT1-0003ML-0w; Wed, 02 Feb 2022 10:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 263982.456914; Wed, 02 Feb 2022 10:02:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFCT0-0003KW-To; Wed, 02 Feb 2022 10:02:22 +0000
Received: by outflank-mailman (input) for mailman id 263982;
 Wed, 02 Feb 2022 10:02:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFCSz-0003KQ-QN
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 10:02:21 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35375cea-840f-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 11:02:20 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2129h6Bv012220;
 Wed, 2 Feb 2022 10:02:09 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dyqgp03f3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 10:02:09 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB7PR03MB3884.eurprd03.prod.outlook.com (2603:10a6:5:31::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 10:02:03 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 10:02:03 +0000
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
X-Inumbo-ID: 35375cea-840f-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W04uuupOcY4ppkBvVBXJG/YHeZJ98M3cABnBdXXhxAbxaycEx0npBlvel4gC7LeBEJrEZwXvOBvD7+5CypWMITd3GohgtNVpy+KWnI3GnkcATQg5S0KKD/vrQ7SwrqOSjkvpbR9LGPEuWGWE6TTCQOsQF/b/kD1A7vaOxHDSbk0lX3pJQ0AJpYVIvhSem2NInNiMLSDf9xRQjGQDASOoiilMqazeyUyj0JsDIvOBQ6LLN3iUSQffBPFyVl4qdmqIyM/nJMC2QIjMT+ByILI6jHGc4Em6KIuvvS8N/JCnS6ND2j2+okzRmlZzinQsb6Chkt25PgQpJkroDmb3LHb/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UVYeBeFZyGtHQvuHSu/itqdBMcmCDHzatlyWxpEYyEc=;
 b=FP+0vPK+GBundmvKNodvWBCjcgFvmz+NdJgODP9bIdyU68qcLMle2CpcKsOz8ZfmWkX5YUXVzLCWHF4PX7yql6WqdDz/QrQhBHADONQl67zD/kvYc6Kyka/ePL9YQFAQUPZj2ej6isWneXuQY6ph/1rCJxvFaQ4Wd8PCmMs5Wbp8PUBC5+h99/xcQtgaMa9+tHVl7bLNvlSyz3Sh/iMLw7CPLQfPvZAhkedLH0sulH45ohIvRvFIB+LZmBDjRJp7OiXk/RhGn1IktuP10YcBM5ps5M+fq+AIaemUb/3ZZ9LX6o3wFv53QFx1pmySLOVoXiOSjQaKBliMP3Can8tfAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UVYeBeFZyGtHQvuHSu/itqdBMcmCDHzatlyWxpEYyEc=;
 b=HQCtaBn6kSfTKRqLHx/kG1VTBlx18lL8KXK9ihsH1AUTxvKhRratmgo69dotMYeDhAYzzU0qh9yxVtOwfdatlAL9ZNN6sA+9YLjSefKXxHM+KDHd9zlrnDTc/ajNJIiwHFqfCLDcvwitxCr2eKgF1/AMX4j6xWB15N+ufMNR7H1Pi6QzMV4nGILIF+QfefvXDtCue6PBGMS9GuPVwce7gsTHIzDiKixcPZ+ZQSaSnPZVDOtdgfRpHdfWNuikAsLYMumijh6CNx8PllySKlJ5oXgEJb3gAXyTEbjLGAFCCfD87wfWH+hxr+DoHsS26nL0IXFbnUH5RHGI9weoXJ5ysQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "julien@xen.org" <julien@xen.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>,
        "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>,
        "paul@xen.org" <paul@xen.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Thread-Topic: [PATCH v5 07/14] vpci/header: handle p2m range sets per BAR
Thread-Index: AQHX4ewHO5mM8SE93ki3ObXvstqjIqxfypkAgCByRICAADWlgIAAAX8A
Date: Wed, 2 Feb 2022 10:02:03 +0000
Message-ID: <2fcfc3a4-0794-21aa-d915-d353cba7354b@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-8-andr2000@gmail.com> <Yd7wjP8WLWQxzLbq@Air-de-Roger>
 <9c8ea4bc-feeb-dfa0-9265-83ff724b216d@epam.com>
 <YfpVWdITDHpz+bW6@Air-de-Roger>
In-Reply-To: <YfpVWdITDHpz+bW6@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4547e705-9d82-4c0c-54c1-08d9e6330feb
x-ms-traffictypediagnostic: DB7PR03MB3884:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB7PR03MB3884A147C193A3E367C1D3F9E7279@DB7PR03MB3884.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 4Fw9M5dWMinxfdRU45/Q1F6DLDF6ChFy0OpR3I70FBKZ+e8G5dLNAPQ1gkjsSnPlElaNTvNTyi8hqoJN8Y2D3W9UuvzRgHUH4zpZHmL+veEKS7jQnTrstVHBJW0vtcrZ3l96OfbZvFCn5KUete4Q1+aOkqkP+2MaCas2T703d1cc2nI5GjUk7QJf8F3YJTHDPqstbFzTUMIS076sIxXGts1CvnpZss8fQ9Z30qM8WUdhn/cegv4JCXKLRvwY9Fh/47RhZfMszLmpNtKhC0Ockjchff7iDOpsTbZHkOOWdlIaJ8HCWrEvfJSy8PhDsjas+SFhZxpmL5E0uXhIO05nuG2WhilVDsH/hYbwaTPP7SYz8ZBkK9aZwu7tpJEPFYFatb+tv50Om3k2Zz9qR2ktuDYTBHtOU8+eaUjTLo/14dTjI2E/Py5DvDeAmAP5nEPJX9/866j6NZO60if9NUenc2oEmf8HHV9cY6+urW1pRX1G5PxNOXb1Kc1zJ5zPk5Nahv95zQ/2la/ypcG4AParomQsJQF+8nAFEUaXUyB/1e8ZanvU9h2/8Dp/hc2dF34QWUX1/NWybTmxKzPde+ZP0JujTE8CVnTMOHVDlPVE9FrAEV8nJF98aZfhks/J9FfT7bnvMgF9AVYj3PNH1/1Bb63ljE5fK66pBlQVr2y2YaUe9VW//yDuSI3uQCm3XBTjmx4eUsdmhHY9UljoEEU8vtXiAGk7WRYj80ckkvPh0oY9Y50laXvuqqsO/+67ejZf
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(122000001)(71200400001)(86362001)(83380400001)(66476007)(6486002)(76116006)(316002)(6916009)(38100700002)(36756003)(64756008)(8936002)(508600001)(66446008)(91956017)(66946007)(54906003)(66556008)(4326008)(8676002)(31686004)(7416002)(107886003)(6512007)(2906002)(6506007)(2616005)(5660300002)(53546011)(38070700005)(186003)(26005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d2dMWlZ2R28yWnc2OGhjMHprNXh5VC9zWnVtNCtpVEN3QjkwS3hQY0s0WWo4?=
 =?utf-8?B?ektBWkxDUmRiVTZ5VUczRTh5a1lXeWhFSmVYd3ZUVlNScTErcGJKRVZnTDlF?=
 =?utf-8?B?Vk52cE16d2lyUXFYaHFaOHdoS0doYW42c2h3Q2l5Q2RMTXRQTmZ0cHNVTW1S?=
 =?utf-8?B?TFc4UU1lM3VoQlU4ZEpKWDd6NU9Ra1pPeVc1Z2NjVWFFcjZXVy9tTHJvczRJ?=
 =?utf-8?B?K0xVOVNhY1N1L3FmbXNPKy9waUtPRkVwMXdEbGlKdURENngrRHQvWWNKVU5J?=
 =?utf-8?B?Qk4yMkVIRS9ZYTR1SGhIRjdxa3ZiV2JmM1lWMEpOUERSRVR6TGVzZEdzMzlI?=
 =?utf-8?B?SDN2bjV3VGlZWWVnVnU0S2tDcGFkTDFCNFZtVDVQNjZyRTcvQU9McWxFYUxo?=
 =?utf-8?B?YndxcEx1UllnZzR3V0tFcE5lRElBdzlNdU9JZTVTdm1xQUxpSitheE5GYXJw?=
 =?utf-8?B?VERTSFJleFpFSWJ6bk4yeWFkNE5WdzF4YVYzWWpZcThOUHNITWlRMzVjK0Zm?=
 =?utf-8?B?RjBFU1pPK0dzZXRRT3ZabnpNanJKQVpiMkVKeFJLNERIOERyVFV4c2EzOW0w?=
 =?utf-8?B?eklJTGhWK0hPb05JQ1cyRjZCWGtNQUtSSG0xVlY3NUhJRW1FSEo4Y3NvVWRU?=
 =?utf-8?B?bVdlOVpGZ3M1NU0zRjR1REVITVVuSGJuc3VENEQxUUJMYWp5ZnhLSWV0b1Vq?=
 =?utf-8?B?MHprUE13SXpBK0hYWCtKWmRBZWovUEVIMU9Pc0ZqWWt5R0dhMUdiZEVKSnZo?=
 =?utf-8?B?Vk1sRk5MMFRETzMvYzFrby9sRFVoVVozNGlneTdEcStINUtkR2w1MDd0MEp4?=
 =?utf-8?B?ZWFLWFlwKzQxeGQyMmI2cmV5NW4yT1hjdm0zMTNlV0hPOVgweVJaQjJURFRH?=
 =?utf-8?B?ci9hOVlTV1FjcnprRlloTTExWTE4SjdDbWdBaFYxeDRBcVY2Q01tU1BVUElC?=
 =?utf-8?B?SmhSUWpMM1RXU05TaUtOaXlpUm94SHZIVTBxM1BaL21hL1R2WDFYYmtMQlRM?=
 =?utf-8?B?eHdOcUZpM1NLeE5VWnpROTNJTnRLaTJiTTQ3S3V3YStsYzZqR3FRVUhZUUIy?=
 =?utf-8?B?cE1RQUhoR2pCZUNsQnJSVE52Rm5BdjVYME93NlZCWUF1cGpGUkNmSURvbnV4?=
 =?utf-8?B?SWQ4YWlVV1dTb0g1U2FtYUNKMWdnT3VpTlhCSVg3SkxNV1J6OEs1V2lFa1cw?=
 =?utf-8?B?NzJ4cGoza3Y4SEV4VmlPcTlhSVo3WGlHM0ZmUjErb0cvclFDNWFpSWtSRUxm?=
 =?utf-8?B?Rmt4WnRrWVEwTmFud2ZyVndpKzVFNmN3dCs5OEs4ZjNMV1VkLzIzSmhSc0to?=
 =?utf-8?B?QmdLbXBWSCsvb2FxZ0xqaXBqeDdGT3RyRStZUTRFWTJLNC9rQW9FQXEzTFRa?=
 =?utf-8?B?OGprSG45Zm5rNWR2dllXNSs5bWJObVBMVkk4djJNRW42djliVmh2WnRCZzZK?=
 =?utf-8?B?ckdDV0JRNVlGcVU3aHJBRXNxRDNmNEtLSFdhVVpQZS9JN3RCTUt3R3B4QU5x?=
 =?utf-8?B?aGtpamptd0E1ZmRvK2ZFT1ZhT1N1WWgzVjdQSXcyR0Zjd2RBY080dG5vU2JE?=
 =?utf-8?B?R0ZTeGd6N0J0Rmd0SW0vQlNKc0dJZnRyT013cysxQ1ViOUNBY1pTbFcxTU9x?=
 =?utf-8?B?TFZWdkVIV3NjN2RUeVh3WDRSd1J2L25uWnNLODBHd1U3N3VqVGU4WVRuZTBk?=
 =?utf-8?B?ZjFDaDNjSHFsS1o0enJyVzRyRE01dmZraGdaNnN3Q1Q5akNTOVkvckJMTS9D?=
 =?utf-8?B?ODhVNUxkS2lNbWlDRWRaMjRDUExCbnZYRFNFeks4Vjk0cnVSd0dYWWRTdHBC?=
 =?utf-8?B?M1VBTldZZk9qTmZ2SkhNMlFmaDFCaWhSMlFhT21vZFFnRFJCM004dTNId050?=
 =?utf-8?B?QmhuL1hYUVNzN3pNYzlqTTU5dC9WOG1VUnRZaVNQeDArWFhDOWZHdHROYzkz?=
 =?utf-8?B?cVkrV1p1OVpnaHEzZkVLVFJBenk0NlVoYzE3U2dKMVV3aXE2NEFZYUxGUlYz?=
 =?utf-8?B?aVZDQ1BzQWZCbXVtZGw0RzVrdlg4RWZEeVFTRDd6TVN1S01RUUFlV2lkNm9B?=
 =?utf-8?B?eHNZN2RPK2tHSjdpamxzSkVmNXBxVyt1UFVKcFZjUitlZFJ6cVgzbHorYjBI?=
 =?utf-8?B?dEFKRXEwblltTld2T1h1WXVKVDJWakxDcnpJVXdaM0VKQzdlNk9iQXJjdVVI?=
 =?utf-8?B?dTdITXNrWXM1RG91OWE5UDZhempjNjlVSS9BQUhOTkdHems0ZTFkcmFpRUtE?=
 =?utf-8?B?ZkpOTkxmNFJwSTE1bHc3UGxoNW9ic3ovTE1Jd2d4QmdXclhsZitxWFVWY2tN?=
 =?utf-8?B?RmRKU3JVemh3bHp2a3ZyMDBmQVlzZnFzemdmV2xoZGhnd2lyOW11QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36535AABA840C446A422D46E6BA859B4@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4547e705-9d82-4c0c-54c1-08d9e6330feb
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 10:02:03.3343
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leYxd5uZXyoMSGDYxVyXDtrUb3ltehYG7AANdWeh906M1Jh0U4TDhb43vEuurE8jZf05gw6oDFwg/pzupGrw3C6MIExRbARV9dLWaeamF/snme5dRKNnUNbDWl/WQswk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3884
X-Proofpoint-GUID: Fi7pHaY4mcF9lA0MEozS7HZYkG3qE8uW
X-Proofpoint-ORIG-GUID: Fi7pHaY4mcF9lA0MEozS7HZYkG3qE8uW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_03,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020052

SGksIFJvZ2VyIQ0KDQpPbiAwMi4wMi4yMiAxMTo1NiwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToN
Cj4gT24gV2VkLCBGZWIgMDIsIDIwMjIgYXQgMDY6NDQ6NDFBTSArMDAwMCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgUm9nZXIhDQo+Pg0KPj4gT24gMTIuMDEuMjIgMTc6
MTUsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4gT24gVGh1LCBOb3YgMjUsIDIwMjEgYXQg
MDE6MDI6NDRQTSArMDIwMCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEBA
IC0xMDgsMTEgKzExNSwzMiBAQCBpbnQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+Pj4+ICAgICAgICBwZGV2LT52cGNpID0gdnBjaTsNCj4+Pj4gICAgICAgIElOSVRf
TElTVF9IRUFEKCZwZGV2LT52cGNpLT5oYW5kbGVycyk7DQo+Pj4+ICAgIA0KPj4+PiArICAgIGhl
YWRlciA9ICZwZGV2LT52cGNpLT5oZWFkZXI7DQo+Pj4+ICsgICAgZm9yICggaSA9IDA7IGkgPCBB
UlJBWV9TSVpFKGhlYWRlci0+YmFycyk7IGkrKyApDQo+Pj4+ICsgICAgew0KPj4+PiArICAgICAg
ICBzdHJ1Y3QgdnBjaV9iYXIgKmJhciA9ICZoZWFkZXItPmJhcnNbaV07DQo+Pj4+ICsgICAgICAg
IGNoYXIgc3RyWzMyXTsNCj4+Pj4gKw0KPj4+PiArICAgICAgICBzbnByaW50ZihzdHIsIHNpemVv
ZihzdHIpLCAiJXBwOkJBUiVkIiwgJnBkZXYtPnNiZGYsIGkpOw0KPj4+PiArICAgICAgICBiYXIt
Pm1lbSA9IHJhbmdlc2V0X25ldyhwZGV2LT5kb21haW4sIHN0ciwgUkFOR0VTRVRGX25vX3ByaW50
KTsNCj4+Pj4gKyAgICAgICAgaWYgKCAhYmFyLT5tZW0gKQ0KPj4+PiArICAgICAgICB7DQo+Pj4+
ICsgICAgICAgICAgICByYyA9IC1FTk9NRU07DQo+Pj4+ICsgICAgICAgICAgICBnb3RvIGZhaWw7
DQo+Pj4+ICsgICAgICAgIH0NCj4+Pj4gKyAgICB9DQo+Pj4gWW91IGp1c3QgbmVlZCB0aGUgcmFu
Z2VzIGZvciB0aGUgVlBDSV9CQVJfTUVNMzIsIFZQQ0lfQkFSX01FTTY0X0xPIGFuZA0KPj4+IFZQ
Q0lfQkFSX1JPTSBCQVIgdHlwZXMgKHNlZSB0aGUgTUFQUEFCTEVfQkFSIG1hY3JvKS4gV291bGQg
aXQgYmUNCj4+PiBwb3NzaWJsZSB0byBvbmx5IGFsbG9jYXRlIHRoZSByYW5nZXNldCBmb3IgdGhv
c2UgQkFSIHR5cGVzPw0KPj4gSSBndWVzcyBzbw0KPj4+IEFsc28gdGhpcyBzaG91bGQgYmUgZG9u
ZSBpbiBpbml0X2JhcnMgcmF0aGVyIHRoYW4gaGVyZSwgYXMgeW91IHdvdWxkDQo+Pj4ga25vdyB0
aGUgQkFSIHR5cGVzLg0KPj4gU28sIGlmIHdlIGFsbG9jYXRlIHRoZXNlIGluIGluaXRfYmFycyBz
byB3aGVyZSBhcmUgdGhleSBkZXN0cm95ZWQgdGhlbj8NCj4+IEkgdGhpbmsgdGhpcyBzaG91bGQg
YmUgdnBjaV9yZW1vdmVfZGV2aWNlIGFuZCBmcm9tIHRoaXMgUE9WIGl0IHdvdWxkDQo+PiBiZSBn
b29kIHRvIGtlZXAgYWxsb2MvZnJlZSBjb2RlIGNsb3NlIHRvIGVhY2ggb3RoZXIsIGUuZy4NCj4+
IHZwY2lfYWRkX2hhbmRsZXJzL3ZwY2lfcmVtb3ZlX2RldmljZSBpbiB0aGUgc2FtZSBmaWxlDQo+
IFRoZSBhbGxvYy9mcmVlIGlzIGFzeW1tZXRyaWMgYWxyZWFkeSwgYXMgdnBjaS0+e21zaXgsbXNp
fSBnZXRzDQo+IGFsbG9jYXRlZCBpbiBpbml0X21zaXt4fSBidXQgZnJlZWQgYXQgdnBjaV9yZW1v
dmVfZGV2aWNlLg0KTWFrZXMgc2Vuc2UsIEkgd2lsbCBpbXBsZW1lbnQgYXMgeW91IHN1Z2dlc3QN
Cj4NCj4gVGhhbmtzLCBSb2dlci4NClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

