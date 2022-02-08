Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9457F4AD53F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 10:57:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267938.461701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNFS-0004yG-47; Tue, 08 Feb 2022 09:57:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267938.461701; Tue, 08 Feb 2022 09:57:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHNFS-0004vf-0M; Tue, 08 Feb 2022 09:57:22 +0000
Received: by outflank-mailman (input) for mailman id 267938;
 Tue, 08 Feb 2022 09:57:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1FiY=SX=epam.com=prvs=40383cc40e=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nHNFQ-0004vX-Eh
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 09:57:20 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8010a5ef-88c5-11ec-8f75-fffcc8bd4f1a;
 Tue, 08 Feb 2022 10:57:19 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2189rgaQ002968;
 Tue, 8 Feb 2022 09:57:16 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e3p9gr0c6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Feb 2022 09:57:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB6PR03MB2998.eurprd03.prod.outlook.com (2603:10a6:6:34::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 8 Feb
 2022 09:57:12 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::dd31:2fad:89d:fa77%3]) with mapi id 15.20.4951.019; Tue, 8 Feb 2022
 09:57:12 +0000
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
X-Inumbo-ID: 8010a5ef-88c5-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADO1FSrAKn/1KfO9V5NsjP9zXze32SfzPFdZdjbbb+kkfkLRd6iHiVTQQ2hzfpQMNKlOqCZp/kf53bo3rNjMaeeqgS/KgqM6fBF6cBQmHG9auZT+7d2sz4GK7V6WEi5ohWBjOR7qSYZ6Cb3ZKlGvj3Q+65z8g9kPOoY4Fg4DItWfeAZ6Msm5RRx0HXD6fEY/GlFW2+FWzvjbwQ+79RJeyV3Qr9PlKcEd4ksB5N0R0EbLC6yF+0T0NH26DKehW5XlKleJq1spyit1lm81afGTstFbuE9e7xlE1qRKsNGasZQQpN5jt9a1qb5M5h1KOxDHl64oryXelGYCQyLi6Rgf6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/lbE0Vy9LotVTaHSUinpUIrOA45ndVUqXBaJpAX6ik0=;
 b=He/OM70yrJAB5s4CWbwDZOGsROnhHCkc3K5hjLOWfMrVmvDT99ZhBKkFY8j3lWz+GLKc5wMJp+8Vd8yEXjIop0fzuyKbh9yZVZnuRsxByE6wD+Y/AAY7a16AzfrlQm3Jzqe2IcxEvZaYM+RvwqYbSWex8Yt/Bre66OAbLXEEG5OBcS13zCXIqszwda8XCws2NIfNYVfBtW0EhNWn9nBozM1HDHQ1thOTdBnbjgEnFoDGGpmC1+DgWBJOZO9FZs0jjwXTqjZQW42OyYKPPmpr6VXqGM9h2NfOkdwSZCjiCw3q9Ijw5X7no3msjasKTlxwtCun3kRBOIkFPBdVYjzj+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/lbE0Vy9LotVTaHSUinpUIrOA45ndVUqXBaJpAX6ik0=;
 b=EBF1bGB9AMne1xdMTWEor7hcAkDR8YbjHy6PkYvvWeRR2qvPU3eWzH832YGMglIURA7T8ZdctPmpktyzk33cM1ypfkL3nLHz1lwihNiZ70yndkvSiPVZZ/YIR4X4h1Ifw4BdGtWU2gpx5U7uhD8ME8bZQrDHMCbKWLO1bD320DLlnL0JLtkMCpqjmqAeQneRC0vAAFe+pMdO4A4X1qMrLFA65c7alb9LGvaweNII4xLKiq0tpcKnIbrxLySkYaT9oIoEvlniYsttuJTnI2W47zGupqoFbJIQeKxHPBF+4xWKeX1zel/YpOhXBKY1aRYIBp6B/w2F9zMdLzXpqZtTlQ==
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
Subject: Re: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v6 06/13] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHYGZFd6D+qnME8W0+wTH+v8YZ8DayJaJYAgAABnACAAASVAIAAApGA
Date: Tue, 8 Feb 2022 09:57:12 +0000
Message-ID: <6ac5d7ce-96dd-66e1-c8d1-eff7b0a1349e@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-7-andr2000@gmail.com> <YgI3HpFffudiEmNN@Air-de-Roger>
 <498ca523-2642-e35f-b316-0a089f98ca91@epam.com>
 <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
In-Reply-To: <5bc96dba-e9b8-de2e-f6aa-ae6c604897e8@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5443a978-31df-46ae-6447-08d9eae960d7
x-ms-traffictypediagnostic: DB6PR03MB2998:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR03MB2998B9D7CA57F5280A6C375AE72D9@DB6PR03MB2998.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YuxF1orCu6iUUFPnmMqpX0MVV7wxRIsw/Q6H5RYkJ8RIfEJVeHt6YOMTZM7A0Km4+HF6HX88a4vnGN7E5cmUyKzGDQWDWLzjkIteWEUq0J/bgsZWsUQA7Fir229kKwGS+r3N+za8iCQj3nnSB+FbNPFtMqnSY+X2+hJnQ9I8u+XMe6LvGi76jnW3zkWRbJngKZCAwOBgzi4TH30nMdgpNdhSfrAgt2IaL1WaoN28vjPbyglOIQNi4qR90byLlqBqj/wn8Qah2nsk6eLOFvb+DZbdBrdWaPXkqBedFF50oDVmoKQjfg82dCB1FMu5SKFiA7jnet4VAqjb4kN9RX8r669qUL8HEOAX9JgBRLpTKJbLQXKt9+sraJisoALYJjMtEEeeM5zL2NOo5MlMTOu5Jko4rLZOw+7P7iv8epRVYrwL0PlobJ9JeiZaTqXaMPaUdspw1aA7DHCIkZF2MSr7KAXh6MnlOTlfxXSJYrlbJVkUftFl2JJvFJ7gjbMUVZqeCpjtG+qW3H7/VMe6t2XsbIr7dWgLJj7sT6GYMoZ/1UqB9KNyDl3H+0V/d3E359q8gyhbbWZIJBUrcq9sMs2AZLrUE03OcgmmPGfc4Y6l3mbgM/w2+RC8CGDunPIcSd5Sa8VCB53cQ4r/kPG6I8/0sRCY1bFnGA4XJNPpSDkFuhrCWRma9+vODsbwzJbH9YiAK50M6j7hhpsCujtFQ0BHf0yCclzmN9IFBS+DF9q+2qacVzkOZZqGFNSFjB3tBlxs
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(31696002)(54906003)(38100700002)(36756003)(76116006)(91956017)(38070700005)(8936002)(8676002)(122000001)(66476007)(66556008)(66946007)(6916009)(4326008)(64756008)(316002)(66446008)(2906002)(83380400001)(5660300002)(6486002)(7416002)(6512007)(508600001)(55236004)(107886003)(6506007)(71200400001)(2616005)(186003)(26005)(31686004)(53546011)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N1YybFBldE1IUXlUTjYyeVpTeFl2N1gvUllCNTlXc1B0czFkZlQrQ09VUnI3?=
 =?utf-8?B?VHhSVzg2QzJiejFhSU5SQ0hPRlZ4Nmo3QTlSRGl2MWRmRjVCVWZBN3ZwVUVt?=
 =?utf-8?B?VmJTZE00bi9IUGpqVzNmcml4bUFmMTQrMGJ0dkI2SXVzZ2dIZTJLL1BzUGxD?=
 =?utf-8?B?NGcrZHhBQ082MW4xQ0QwMTg3RDhnQXBTb1FWRitNbXFpWkV0Q0lvTVBMbGk1?=
 =?utf-8?B?SmtjamxTdnJhQWtmOGNhdklIeTdlbUhmZFhUTEtxZU9hOEpmUTVSTEFCdEdY?=
 =?utf-8?B?SmlTUHNkd0svTDhnTDQ1bVJhVWN4NmpsdmlvaERVbmpTODF0MnplWmVxZG4y?=
 =?utf-8?B?U0tFU3diOFh5VjVqeUgrbXo2Tm5GWjAyMHk3anN5SXl2ODIrZCt2TTBoakpt?=
 =?utf-8?B?UGZWU1lqejRPUHgraVB4U3dyVjhWV2ZOMG9WUWtYZ05rb1ZHUU1NUER0Zy9R?=
 =?utf-8?B?alg0cWlrVVNHQjk0b2pSRkowY0RNZkNjUG44RENjQTVRR2lRVTJ2S2wwRk9O?=
 =?utf-8?B?RjhraUI3ME5yanRONVFLMDYxYlJXTEQ1L0p4TWNzcmNFWUQ4ZU96MHBvTTZN?=
 =?utf-8?B?ZmtGUHdCMlZ2UzV1MmROK011aUN6TjVveTlqcEtHUDZnUzdOSWNQV2hSMXg1?=
 =?utf-8?B?WUZKYmY5OUE3R3k4T1dwb2hoYVJUTm1jMGxBVks1QldKRHJLS1FIY0x1clRO?=
 =?utf-8?B?bVNmb0hSZjQ3OFdzVTlma21nbG5hY2NTMWl2SkJYdDgrdXl1TnlUUnZTT0I5?=
 =?utf-8?B?UWhKZGRjWXJudWhJSUJvam81TmNLNmtJQmVCK2I3YlVxVmtZajRMZkZxdm12?=
 =?utf-8?B?SCsveUd3Y2xabnl1a0hwZzVZOUxHQlQ3NDJsZzBiMU1wUnpGc1JpN2RFc29J?=
 =?utf-8?B?MmlYUDBnUVBnL2dVQkV2RDlLcDZ0M20vYW1tdUF3cUo4eHhndElwbjc3bkZI?=
 =?utf-8?B?eDd6WTRRWUtmaGIySlRFR0xXQndpNGZBS1FMcHc3alRyS3dqUUlZOFdnaVVq?=
 =?utf-8?B?enU5SGl1M3BHYU5kVVdxNjFseTlNcUMrdGpCdmVXT2N6N2h4VUhYWW9IYUIr?=
 =?utf-8?B?eGoyNzFidk9RaFFkZ0FId2Fvb1lyakdZWlAxeklkTXNvQWhwZFpUVENMc3By?=
 =?utf-8?B?WEs0SElqMGg4Mk9xRDZNdWk3bEZvNnpxVlQxOUF4Q3lVcUE0U1l4QTVPV2R2?=
 =?utf-8?B?M1F1K3NZSmFNOExVcXlNelkrMlR2VlU3d0hybUlReWMxOFA2UDB0YTJLQktu?=
 =?utf-8?B?c2FKRUpNZ3lVM1FwaG5KWjdMUjgyVTBHV1hHcmRJZVNQTzc2QWZ3V1daYXdV?=
 =?utf-8?B?OTRSZW92NDdyVHY3VjUwS1ZSNVhwKzUxcFhVTVpFTE1ZcVlmNHNqRTFONnU2?=
 =?utf-8?B?VGJKU2dVREZic0ErZEoxRFJZMGcxZFNPcVdIcGxyRG1naTAxdjlCMkZDcmJS?=
 =?utf-8?B?ak5LUEIxVWJ6ODZWbzNkSFZzMEtBTVJ1azBUcGpDd2d0a0o2eGFHRkovVUZS?=
 =?utf-8?B?WkRnVkV0UUVZOFd5ZnJ3R3ljUnQvUStKQ2VsT25qMjdrd1BYWG1sSExNek0w?=
 =?utf-8?B?SXk5NXkvWmNtckIxKy9nbEhHdjVtWWZ0WTdTR3NVK2FoU2NTQVRDQzF2UVhv?=
 =?utf-8?B?eVZIUmFnTzhveGlCYkovcXF3WlpnZE1WSS8wSzQ2NXJRa1RZT3dyMTdpSFZS?=
 =?utf-8?B?bEtzeUtYV08zUkxwMENXOVNpRExCdldjMGdJNWFyUVhrU0xlOE1mZmVJNzRj?=
 =?utf-8?B?Tms2dFVndHlPZ1MrME8yaFFCM0lFQ2pMUVF4OENaMWROb0JRN24yem9mbVNB?=
 =?utf-8?B?UXVQVXZ5YU83VGlxejhUY2dHdEk3ck9iZVFmdEM5eTFaNGQ4L0t3cStka2Jo?=
 =?utf-8?B?U2MxZCs1K3RpaGo1MzBiRjdhaEJ3Sm9wLzQwZ28zc3FJbnBwOEVaS0xpRk51?=
 =?utf-8?B?V3hSN2ZxYkIxY0dBVEFjNXQxTkVtUFBXMitEK2hLL3ZmUFBJOGU1QUJ0MDJ0?=
 =?utf-8?B?bzlYaWgzT3hPV29rTStsTVp1WEdVUTNlWVlEdzhEcDJGc2dQTWorelhpdXBR?=
 =?utf-8?B?WjhjUGN0MjJhMEYzODNiYWhQdWFoRDdOUUM4eFdiejZGRnZ0QnNkb2U0dERJ?=
 =?utf-8?B?K01nWXNvWnlMY29wV0RRSXlIODBkc1hRRHNyZ2FGcWZweThITmdTcFV0M1lj?=
 =?utf-8?B?c0NqTUZJdXFpZ1pjSjBLc0NLR2ZkaktYSTZBUVpLdmFzNHVncTJGZmlOMDUw?=
 =?utf-8?B?bzVTUHJ5QWNJSGFaOEZYR1M0cERkVS9WVUoxdVhWVnp4c2ozb09NODFsd0Ew?=
 =?utf-8?B?bFZRZGNNSnpSM3NPd0hUbVM4UTJyRTVFYWtWLzB0RXVrM3RweDNWUHh4N2hN?=
 =?utf-8?Q?I+LqH4HdjD+H/Ias=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F3A827095CF4664CB15C0FEEEDC598DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5443a978-31df-46ae-6447-08d9eae960d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Feb 2022 09:57:12.1394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uzgysX5w7LIskfB/INBQVPKouasK/gtI0oYOvMdefH6FhQuARiiWcQ7Nt4HoVd+ywbnPVb/2NHm16OiSLETp+WzKzo6fLPD/h0xGzu2R/22mmUJVNehnkzxz5qS+3haC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR03MB2998
X-Proofpoint-ORIG-GUID: bqbqXxWb9YXNmV3W1gjbU2LR82LlMKPy
X-Proofpoint-GUID: bqbqXxWb9YXNmV3W1gjbU2LR82LlMKPy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_02,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080056

DQoNCk9uIDA4LjAyLjIyIDExOjQ4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDguMDIuMjAy
MiAxMDozMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwOC4wMi4yMiAx
MToyNSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBGcmksIEZlYiAwNCwgMjAyMiBh
dCAwODozNDo1MkFNICswMjAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4g
QEAgLTUxNiw2ICs1OTQsMTEgQEAgc3RhdGljIGludCBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQo+Pj4+ICAgICAgICAgICAgaWYgKCAodmFsICYgUENJX0JBU0VfQUREUkVTU19TUEFD
RSkgPT0gUENJX0JBU0VfQUREUkVTU19TUEFDRV9JTyApDQo+Pj4+ICAgICAgICAgICAgew0KPj4+
PiAgICAgICAgICAgICAgICBiYXJzW2ldLnR5cGUgPSBWUENJX0JBUl9JTzsNCj4+Pj4gKw0KPj4+
PiArICAgICAgICAgICAgcmMgPSBiYXJfaWdub3JlX2FjY2VzcyhwZGV2LCByZWcsICZiYXJzW2ld
KTsNCj4+PiBUaGlzIGlzIHdyb25nOiB5b3Ugb25seSB3YW50IHRvIGlnbm9yZSBhY2Nlc3MgdG8g
SU8gQkFScyBmb3IgQXJtLCBmb3INCj4+PiB4ODYgd2Ugc2hvdWxkIGtlZXAgdGhlIHByZXZpb3Vz
IGJlaGF2aW9yLiBFdmVuIG1vcmUgaWYgeW91IGdvIHdpdGgNCj4+PiBKYW4ncyBzdWdnZXN0aW9u
cyB0byBtYWtlIGJhcl9pZ25vcmVfYWNjZXNzIGFsc28gYXBwbGljYWJsZSB0byBkb20wLg0KPj4g
SG93IGRvIHdlIHdhbnQgdGhpcz8NCj4+ICNpZmRlZiBDT05GSUdfQVJNPw0KPiBBZmFpYyBiZXR0
ZXIgdmlhIGEgbmV3LCBkZWRpY2F0ZWQgQ09ORklHX0hBVkVfKiBzZXR0aW5nLCB3aGljaCB4ODYg
c2VsZWN0cw0KPiBidXQgQXJtIGRvZXNuJ3QuIFVubGVzcyB3ZSBoYXZlIG9uZSBhbHJlYWR5LCBv
ZiBjb3Vyc2UgLi4uDQpDb3VsZCB5b3UgcGxlYXNlIGJlIG1vcmUgc3BlY2lmaWMgb24gdGhlIG5h
bWUgeW91IHNlZSBhcHByb3ByaWF0ZT8NCkFuZCBkbyB5b3UgcmVhbGl6ZSB0aGF0IHRoaXMgaXMg
Z29pbmcgdG8gYmUgYSBzaW5nbGUgdXNlciBvZiBzdWNoIGENCnNldHRpbmc/DQo+IEphbg0KPg0K
VGhhbmsgeW91LA0KT2xla3NhbmRy

