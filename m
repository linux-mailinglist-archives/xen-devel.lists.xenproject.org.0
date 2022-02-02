Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD3A4A7432
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 16:04:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264288.457342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHB8-0002n4-Gj; Wed, 02 Feb 2022 15:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264288.457342; Wed, 02 Feb 2022 15:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFHB8-0002l5-C4; Wed, 02 Feb 2022 15:04:14 +0000
Received: by outflank-mailman (input) for mailman id 264288;
 Wed, 02 Feb 2022 15:04:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFHB6-0002kO-33
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 15:04:12 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ea3b1c7-8439-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 16:04:09 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212F3h5D011332;
 Wed, 2 Feb 2022 15:04:05 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2053.outbound.protection.outlook.com [104.47.12.53])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3dyv8sg02x-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 15:04:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM7PR03MB6449.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 15:04:00 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:04:00 +0000
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
X-Inumbo-ID: 5ea3b1c7-8439-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SlqyO1fDGvIXvL2HEAYIkf47B+NAq70HFhadsp+Z91jF2TEephe9krstsqJVrK4Q6G+4wT3Go2ZDDFK1Dom5VGmwjZE0cc47cE8dQ6Uxd+GMhK3z9CEYy6MEVSXNOQ6QTQx4c+YWFonOc7kcr49vMofxbphdPolmrpDX7R0TK5pNIBKQ/71QprA0/7/5aeD0f2fTARMFpF3dd4FESkdgCNxD5sh2L8jZKkzMBtRb3zTEfKgHKkb26d+j9w9rDfmq54cmxxig+8i0mozzv9QDCx7ZQS2hvsnu8kv6+7mduppnEMaQEi9Sb4YlFsgmgZUDICp3OV433gvby9dH9AdEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EXQpTdl3vySurWP/Ig0nJ165OAD/mbvn9iQcC5noqc=;
 b=DBUV7D4IAfK2jzfkmkj7xupmqqSZVEBMcIsHkxO8vRDD45M2QffxnCauO+qbmF0Zd6UU/d497Sn+qj4ksjlzoFFTXLLE7F4PlAxH6bFFiZM5wcJb7lYU+fRpV3yXJ5R+vIixQPKdWWCSRhRqK7P4wtrrBWo+ReVNW5V27nXxvd6bloEWTOeowfAHgec0IN7crBvyQNdJcsF9YVpGV3At7zNnWUe2/dfqN82FhMKEawuqAA8fa0s7OfifnaiPJN0hUvegON5gMfAEUTJLyff0Ianz2bbRWlayux0ztwDm3+0A0Gn9IWQ82yAib0l+mshL26xORfDKtogdJeJHa8ww8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3EXQpTdl3vySurWP/Ig0nJ165OAD/mbvn9iQcC5noqc=;
 b=qzX58h5iPTuutOD1pCX5ceq7JB0wJd4l40xAqaR9unXnvYVjXMM5jwfpEo6OwjCij8mi/fmiM86j+uTOpalypvUxIZlGoElbE8iuTDtQbm07DP77qjYF3yJOWSMVZ+9qJj4SiargcaCpUSpmIMvDeuB+FD50pvzHMVuHLvRGeAkv1H7wDk3WXZslfpLEVgndR3D6qgJUgZhQ44zbCO3qP7wR6SUu61Mles7tuLbtnnzLcH5xbjim7sDOnUHo1dTg7qD6ZesBp+ioMa5QhxUrc95X2NfxsplZfEyqQLx9zOBtfwdeWY/TZbXPx0Qb5wYTNn2A5o+BvVcKstmmhqF2Kg==
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
Thread-Index: 
 AQHX4ewK3mPSKCsK30iVfRQpWoVIB6xhEugAgB+P6YCAAAvvAIAABD6AgAAIlwCAAAJMgIAAAWUAgAAJGIA=
Date: Wed, 2 Feb 2022 15:04:00 +0000
Message-ID: <4fb06bb7-442f-e041-ef95-daec81e1d3a0@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-10-andr2000@gmail.com>
 <YeAD9PH9o65o+M+w@Air-de-Roger>
 <6a31eb29-81b6-7553-897f-2e5e54bab9b8@epam.com>
 <d527740a-4d90-4155-13dc-5888e8acfa72@suse.com>
 <b9661d86-f084-9ad1-59d5-538113000393@epam.com>
 <ab68568c-461e-bef5-4218-07db8e837bcc@suse.com>
 <37313b25-ccbe-fbfd-8306-7a96ce83c818@epam.com>
 <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
In-Reply-To: <f93d4d54-a2ac-67c0-8a04-d8321b0828e5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e6b17009-0abb-432f-149e-08d9e65d3e92
x-ms-traffictypediagnostic: AM7PR03MB6449:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM7PR03MB64492AFD46EBFA409207E78EE7279@AM7PR03MB6449.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FhYuWAr+BSNYWYzkkmYqiZFc46pMhj5ZN6WSCQNJzvan3YWc5D1js77I4c0BUMimOxsHzV5xAiLWt2AM//NFySTPMR7EjFIjHguuv/xb0jSC7U6LBMBwiz5JKyqUwbfZh2+n//pA1I40UlYUgvcBaHXEKvyJijqzEpYnjKjwdCKEPG2hnjU8kp6OthF4EY6EGmDz2NScMIZ6fhRDct7ODWxnRQHavS2EKz4boh41RJdu27cYTDl5rzR6SK5965bMCUH9A1wrTXvCaC3zfpbO2X8NUbBe5TFH7oeQWD6HLAPMDj11rUihDHJG5fzJRrMM/AqMmybCOFZGDuPoqW/iOAA0iwDF/XiOrwV4tMj8vg7qhc0x8ph61kds7ngAJuiTi1niS50qYoDVlcYO4HBZq5iPleJseaKHaVFhjFoCqhpfa5TazcWZ2yzle4m2SP6khdDF26bqHnSVlFvF6KL4VvsTHLGppda8IatHI0m4SN2fsLvlH36tB97VxjUhO3/u70APdPnch37VB/K4KFJDWhWTdyM/p2SfHkuJuTEXyWJO3q6lzA4BDUStvaYGve29FzFcC8razuBErQuCWqjROMsQ6E7DYbBYJ9tj74qaUyJfimKaE0nzyCwLm6JTxcGrhUttknHDLd8AFrfm9v2qdQpqLCkVTljKzyxe0ZjA9Odr/1um0DvYcvHo/m3aDnBpuzptJmufICf5uzWk4rNswZaHlIIzq6Z3j1KucjypHoJD+t5qYP7+C1ylLCIccPS9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(66556008)(7416002)(6486002)(5660300002)(66946007)(53546011)(316002)(6916009)(91956017)(66476007)(122000001)(6512007)(38100700002)(54906003)(76116006)(6506007)(66446008)(64756008)(38070700005)(31696002)(8936002)(36756003)(8676002)(2906002)(71200400001)(83380400001)(31686004)(107886003)(2616005)(186003)(26005)(4326008)(86362001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Smk4a2diL00wbzZSOThyMkVZTTNQOVVtYUozSllmTXFFdlVISC93c0FVcW8y?=
 =?utf-8?B?K2tnTU1PSmhua0RwVjFkejB0VURoVzZYMkdGZnlmMDN4YktISnJEcm9UNzF0?=
 =?utf-8?B?SEpKL21mSHNMRllJMDVYKzhxTUxNTkk3WVpFOFVlZjllVW5kb2VTN0gwNnZh?=
 =?utf-8?B?elc2VWI2dlhmNExZZEJYbm9wMUhXSnVqRjF3aXkwcnM2WGlZL2ptdDE5SFds?=
 =?utf-8?B?VTkvbW00L1JnK0wrdEJ6aDVCSGZHbUZGUG5nZVRzZ2lVNXZiNjdWYWs4eUZK?=
 =?utf-8?B?SVdBblh5dzN4cGFJZm93eEUzZTZjbEx5MnVRVUw2dWhLMmIyUGFaM1p5OERP?=
 =?utf-8?B?aW5KNnJGS2lqdkZ6cEdDTWxpbDBSdFhlbkRmdVVqN1pxeVk5aENaSTJNKzZP?=
 =?utf-8?B?Ri9mSzZJOGdxUUc5d05XSXQ1RVZKalVNeDRrdTMrY3J6ekM2VGVqN1dXRW9m?=
 =?utf-8?B?eFhSdFlOQ3R4d1FiMDQzL25FNDNPYUxsS0hmSE9STFJJTXF5ZjN2UVZWQ0lR?=
 =?utf-8?B?SnB1OVVVSkF2Y0J2bktuODJ4d1JnQXZXV3VVbGVMbkxOL2J3ek9IUUtia0FL?=
 =?utf-8?B?c3hBTUF4ZlNvNk16cEU3eS9CVi9DaWdsc1VuQWRwZkxxMEw0M1dNbDcxeXNG?=
 =?utf-8?B?QXJzOGJrdU1qRjAwQ2tVM1B0eThYcHk5ZHg2bVI1UEdhTHZQSmkzeHg5LzJT?=
 =?utf-8?B?RHhzT3dTeGk0MHRvWVl5d0JGTlNzRzByb0xnaFpWMC9kRjEvU21FUS9La2Rh?=
 =?utf-8?B?WmRXU2pRd0JlWldEU0xEL25mRGExcWIyaUQvRnVQeE9YdXY4RUF2VVdxOTlG?=
 =?utf-8?B?Q2JoblRxc2pLZU5BaFVJU3M3ZlFwdzFGaWFKVlVWNTJGdFJhVWtqZWFGR0Fh?=
 =?utf-8?B?U0tQcWRjOUxwdTVwSGlZaitQaVV5S2hvRFo3QThOaFFERzlZUkFYV29hWjlC?=
 =?utf-8?B?UkpmczBmNmtVN29QTWR6eGtrM0dCQ2grNVI0dXA1S0VyTGlLb3hzaGFob2Fo?=
 =?utf-8?B?RHhzeWpNOVhhdEFZYVM0dnk5SEUwa0pSVzNIbE5wdS9JaHdYcEJzRW5ySlFo?=
 =?utf-8?B?cHd3S09MMXJiSzhpeFpVREFnSFFnV1p6V2tWMmdrdWo4Z2ZNZ2xTaldhaURP?=
 =?utf-8?B?T21MSEJGZUlkOUNCRkhsU1dBdXY3c3hTK1hYL3JLTnp1dDNxbGU1dFI1Q1dX?=
 =?utf-8?B?TUhHdEhZVFRQc09veUYvSUFwYTU4WXNzbTY1dXJzZ2I4VVpodjBGQVNRcVdF?=
 =?utf-8?B?dXNOeWUvSkZ0ZkJoa3hHRVZ0SSthbXVhTm1xTEFRTEhPK3k0MVZTSzQ5Y3Vq?=
 =?utf-8?B?Rkw5ZlI4ZUkzck1ybDRIQ1dpN05HdUp5RURrME1BamdWME9CdlF3NlRXbWVu?=
 =?utf-8?B?QkFQazlWWnpkUVZpWDduc1N0cEgvdzZUZUs0b2dTMTg4dlZIazV3YWVVRmJL?=
 =?utf-8?B?RFBHeGJsOHhZcU14RFZVU1BQY1hnTk1LejFaSmtWOU9vUVh1SnQwS1F4WjRF?=
 =?utf-8?B?OG5CVEZBVEhYQXdiMjF3MjZKTmMweWhLWTNIKzdQaDJ2VWIyOWV3UEM0NDk1?=
 =?utf-8?B?NThkT2s0STZVbVdrUmF0Q3hhQjdROTAzeEI1VlZQckJoVVgvN3ZJdHpZSmpW?=
 =?utf-8?B?bFErK05NeGhOaW1sUW5hOWZuUVhzVGR0ZnU0N0hPd3UveVRrZ3hnOXpYZ253?=
 =?utf-8?B?cDIyVUdSc0hFNXZYK3gvbmtiTjJnSjBJWTczeEVkZFVrMUFNWjFiUmdCbDRX?=
 =?utf-8?B?RXl4TEt2ekN3QnFEdytGb1R4RVpsRHpJdGpicTYwYkZSSDA4cXhVbGZpT25L?=
 =?utf-8?B?bFhraUczclBKcSsvMkRHWWVLVHBWeUJEeTJmbWhsOUhoMzBRdGRyOHlmSGNS?=
 =?utf-8?B?dzUyQWZ3VlhPTXVONFFIWUpLSk9pRWtsbGVNcHJWS3R2NUlaUjFKRE15Y2I2?=
 =?utf-8?B?OXJja2VDZHJudXdSaFh4bktSRldta3JkZzByamdoL3RnVTAzditaZ0VsdDFS?=
 =?utf-8?B?amc2SU8wam5tbi9YUDVGOGdmQ3MvNjMxR0NwdHpSNndkdTYwNndxNkx5UkZG?=
 =?utf-8?B?dHFFZWNZaUs1c216VHQ4MWxBcGxuWFFSd1g4TStHQWZOdXdCbWJ5WUppU212?=
 =?utf-8?B?dnVRaHR1V2ptQmlnR0FVYWVLQmZaTXkzMVNwV1BGMTFDNXR2b2p6TGxYTmY1?=
 =?utf-8?B?ZjBvWHJBVlNJRktnT0I5NGxINFhDMVJXWHVSZ215SnhLSzNyRDFHVkpLcE05?=
 =?utf-8?B?cXhvTFpSRGhEb3JRWURZcGh4UkRhbDM3b2RSRjBYRWJrWXplTkVPczg2TTVL?=
 =?utf-8?B?SHFkYjgzeHlCQitpNnIxNEMwZm4wQ0pTVmxER2RNUWF1b1p1eXovZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5E6063C5860074C946135552DF88455@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b17009-0abb-432f-149e-08d9e65d3e92
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 15:04:00.4962
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 34AbWKsBpNsRsqI8W2izk9iHfTWz0MAWddHtEjj+eSk3ZOdebrCKfjUYYgW0hS4RVrjODQtCQ22kWory8KPDol6gr1UN0TGrf+GnBPicOvoouiX4/UGuPMLfZN91o8Zq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6449
X-Proofpoint-ORIG-GUID: L95Nq_gZJjbmkbTtN-LWEYY2szv1eHw9
X-Proofpoint-GUID: L95Nq_gZJjbmkbTtN-LWEYY2szv1eHw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_07,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202020084

DQoNCk9uIDAyLjAyLjIyIDE2OjMxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxNToyNiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDIuMDIu
MjIgMTY6MTgsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAyLjAyLjIwMjIgMTQ6NDcsIE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4gT24gMDIuMDIuMjAyMiAxMzo0OSwg
T2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMTMuMDEuMjIgMTI6NTAs
IFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+Pj4+IE9uIFRodSwgTm92IDI1LCAyMDIxIGF0
IDAxOjAyOjQ2UE0gKzAyMDAsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+
Pj4gLS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gKysrIGIveGVuL2Ry
aXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+Pj4+Pj4gQEAgLTQ5MSw2ICs0OTEsMjIgQEAgc3RhdGlj
IHZvaWQgY21kX3dyaXRlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1bnNpZ25lZCBpbnQg
cmVnLA0KPj4+Pj4+Pj4gICAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwg
cmVnLCBjbWQpOw0KPj4+Pj4+Pj4gICAgICB9DQo+Pj4+Pj4+PiAgICAgIA0KPj4+Pj4+Pj4gK3N0
YXRpYyB2b2lkIGd1ZXN0X2NtZF93cml0ZShjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdW5z
aWduZWQgaW50IHJlZywNCj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWlu
dDMyX3QgY21kLCB2b2lkICpkYXRhKQ0KPj4+Pj4+Pj4gK3sNCj4+Pj4+Pj4+ICsgICAgLyogVE9E
TzogQWRkIHByb3BlciBlbXVsYXRpb24gZm9yIGFsbCBiaXRzIG9mIHRoZSBjb21tYW5kIHJlZ2lz
dGVyLiAqLw0KPj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4gKyNpZmRlZiBDT05GSUdfSEFTX1BDSV9NU0kN
Cj4+Pj4+Pj4+ICsgICAgaWYgKCBwZGV2LT52cGNpLT5tc2ktPmVuYWJsZWQgKQ0KPj4+Pj4+PiBZ
b3UgbmVlZCB0byBjaGVjayBmb3IgTVNJLVggYWxzbywgcGRldi0+dnBjaS0+bXNpeC0+ZW5hYmxl
ZC4NCj4+Pj4+PiBJbmRlZWQsIHRoYW5rIHlvdQ0KPj4+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4+PiAr
ICAgICAgICAvKiBHdWVzdCB3YW50cyB0byBlbmFibGUgSU5UeC4gSXQgY2FuJ3QgYmUgZW5hYmxl
ZCBpZiBNU0kvTVNJLVggZW5hYmxlZC4gKi8NCj4+Pj4+Pj4+ICsgICAgICAgIGNtZCB8PSBQQ0lf
Q09NTUFORF9JTlRYX0RJU0FCTEU7DQo+Pj4+Pj4+IFlvdSB3aWxsIGFsc28gbmVlZCB0byBtYWtl
IHN1cmUgUENJX0NPTU1BTkRfSU5UWF9ESVNBQkxFIGlzIHNldCBpbiB0aGUNCj4+Pj4+Pj4gY29t
bWFuZCByZWdpc3RlciB3aGVuIGF0dGVtcHRpbmcgdG8gZW5hYmxlIE1TSSBvciBNU0lYIGNhcGFi
aWxpdGllcy4NCj4+Pj4+PiBJc24ndCBpdCBlbm91Z2ggdGhhdCB3ZSBqdXN0IGNoZWNrIGFib3Zl
IGlmIE1TSS9NU0ktWCBlbmFibGVkIHRoZW4gbWFrZQ0KPj4+Pj4+IHN1cmUgSU5UWCBkaXNhYmxl
ZD8gSSBhbSBub3QgZm9sbG93aW5nIHlvdSBoZXJlIG9uIHdoYXQgZWxzZSBuZWVkcyB0bw0KPj4+
Pj4+IGJlIGRvbmUuDQo+Pj4+PiBObywgeW91IG5lZWQgdG8gZGVhbCB3aXRoIHRoZSBwb3RlbnRp
YWxseSBiYWQgY29tYmluYXRpb24gb24gYm90aA0KPj4+Pj4gcGF0aHMgLSBjb21tYW5kIHJlZ2lz
dGVyIHdyaXRlcyAoaGVyZSkgYW5kIE1TSS9NU0ktWCBjb250cm9sIHJlZ2lzdGVyDQo+Pj4+PiB3
cml0ZXMgKHdoaWNoIGlzIHdoYXQgUm9nZXIgcG9pbnRzIHlvdSBhdCkuIEkgd291bGQgbGlrZSB0
byBzdWdnZXN0DQo+Pj4+PiB0byBjb25zaWRlciBzaW1wbHkgZm9yY2luZyBJTlRYX0RJU0FCTEUg
b24gYmVoaW5kIHRoZSBndWVzdCdzIGJhY2sNCj4+Pj4+IGZvciB0aG9zZSBvdGhlciB0d28gcGF0
aHMuDQo+Pj4+IERvIHlvdSBzdWdnZXN0IHRoYXQgd2UgbmVlZCB0byBoYXZlIHNvbWUgY29kZSB3
aGljaCB3aWxsDQo+Pj4+IHdyaXRlIFBDSV9DT01NQU5EIHdoaWxlIHdlIHdyaXRlIE1TSS9NU0kt
WCBjb250cm9sIHJlZ2lzdGVyDQo+Pj4+IGZvciB0aGF0IGtpbmQgb2YgY29uc2lzdGVuY3k/IEUu
Zy4gY29udHJvbCByZWdpc3RlciBoYW5kbGVyIHdpbGwNCj4+Pj4gbmVlZCB0byB3cml0ZSB0byBQ
Q0lfQ09NTUFORCBhbmQgZ28gdGhyb3VnaCBlbXVsYXRpb24gZm9yDQo+Pj4+IGd1ZXN0cz8NCj4+
PiBFaXRoZXIgY2hlY2sgb3Igd3JpdGUsIHllcy4gU2luY2UgeW91J3JlIHNldHRpbmcgdGhlIGJp
dCBoZXJlIGJlaGluZA0KPj4+IHRoZSBndWVzdCdzIGJhY2ssIHNldHRpbmcgaXQgb24gdGhlIG90
aGVyIHBhdGhzIGFzIHdlbGwgd291bGQgb25seQ0KPj4+IGxvb2sgY29uc2lzdGVudCB0byBtZS4N
Cj4+IEkgY2FuJ3QgZmluZCBhbnkgYWNjZXNzIHRvIFBDSV9DT01NQU5EIHJlZ2lzdGVyIGZyb20g
dk1TSS92TVNJLVgNCj4+IGNvZGUsIHNvIHdoYXQncyB0aGUgY29uY2Vybj8NCj4gQWdhaW46IE9u
bHkgb25lIG9mIElOVFgsIE1TSSwgb3IgTVNJLVggbWF5IGJlIGVuYWJsZWQgYXQgYSB0aW1lLg0K
VGhpcyBpcyBjbGVhciBhbmQgSSBkb24ndCBxdWVzdGlvbiB0aGF0DQo+IFRoaXMgbmVlZHMgdG8g
YmUgY2hlY2tlZCB3aGVuZXZlciBhbnkgb25lIG9mIHRoZSB0aHJlZSBpcyBhYm91dA0KPiB0byBj
aGFuZ2Ugc3RhdGUuIFNpbmNlIGZhaWxpbmcgY29uZmlnIHNwYWNlIHdyaXRlcyBpc24ndCByZWFs
bHkNCj4gYW4gb3B0aW9uICh0aGVyZSdzIG5vIGVycm9yIGNvZGUgdG8gaGFuZCBiYWNrIGFuZCBy
YWlzaW5nIGFuDQo+IGV4Y2VwdGlvbiBpcyBub3RoaW5nIHJlYWwgaGFyZHdhcmUgd291bGQgZG8p
LCBhZGp1c3Rpbmcgc3RhdGUgdG8NCj4gYmUgc2FuZSBiZWhpbmQgdGhlIGJhY2sgb2YgdGhlIGd1
ZXN0IGxvb2tzIHRvIGJlIHRoZSBsZWFzdCBiYWQNCj4gb3B0aW9uLg0KV291bGQgaXQgYmUgZW5v
dWdoIGlmIEkgcmVhZCBQQ0lfTVNJWF9GTEFHU19FTkFCTEUgYW5kDQpQQ0lfTVNJX0ZMQUdTX0VO
QUJMRSBpbiBndWVzdF9jbWRfd3JpdGUgdG8gbWFrZSBhDQpkZWNpc2lvbiBvbiBJTlRYPw0KDQpP
biB0aGUgb3RoZXIgaGFuZCBtc2ktPmVuYWJsZWQgYW5kIG1zaXgtPmVuYWJsZWQNCmFscmVhZHkg
aGF2ZSB0aGlzIGluZm9ybWF0aW9uIGlmIEkgdW5kZXJzdGFuZCB0aGUNCk1TSS9NU0ktWCBjb2Rl
IGNvcnJlY3RseS4NCg0KT3IgZG8gd2Ugd2FudCBzb21lIGFkZGl0aW9uYWwgY29kZSBpbiBNU0kv
TVNJLVgncyBjb250cm9sX3dyaXRlDQpmdW5jdGlvbnMgdG8gc2V0IElOVFggYml0IHRoZXJlIGFz
IHdlbGw/DQoNCkkgbWVhbiB0aGF0IGluIHRoaXMgZ3Vlc3RfY21kX3dyaXRlIGhhbmRsZXIgd2Ug
Y2FuIG9ubHkgc2VlDQppZiB3ZSB3cml0ZSBhIGNvbnNpc3RlbnQgd3J0IE1TSS9NU0ktWCBQQ0lf
Q09NTUFORCB2YWx1ZQ0KDQpJZiB3ZSB3YW50IHNvbWUgbW9yZSBjaGVja3Mgd2hlbiB3ZSBhbHRl
ciBQQ0lfTVNJWF9GTEFHU19FTkFCTEUNCmFuZC9vciBQQ0lfTVNJX0ZMQUdTX0VOQUJMRSBiaXRz
LCB0aGlzIG1lYW5zIHdlIG5lZWQgYSByZWxldmFudA0KUENJX0NPTU1BTkQgd3JpdGUgdGhlcmUg
dG8gYmUgYWRkZWQgKHdoaWNoIGRvZXNuJ3QgZXhpc3Qgbm93KQ0KdG8gbWFrZSBzdXJlIElOVFgg
Yml0IGlzIHNldC4NCg0KUGxlYXNlIGhlbHAgbWUgdW5kZXJzdGFuZCBob3cgeW91IGdlbnRsZW1l
biB3YW50IGl0DQo+DQo+PiBUaGlzIHNlZW1zIHRvIGJlIHRoZSBvbmx5IHBsYWNlIGluIHZQQ0kg
d2hpY2ggdG91Y2hlcyBQQ0lfQ09NTUFORCByZWdpc3Rlci4NCj4gSG93IGlzIHRoaXMgcmVsZXZh
bnQ/DQo+DQo+IEphbg0KPg0KVGhhbmsgeW91LA0KT2xla3NhbmRy

