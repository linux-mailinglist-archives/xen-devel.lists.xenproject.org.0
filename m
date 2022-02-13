Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE614B3CF7
	for <lists+xen-devel@lfdr.de>; Sun, 13 Feb 2022 19:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271016.465342 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJJyX-0006Mp-2z; Sun, 13 Feb 2022 18:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271016.465342; Sun, 13 Feb 2022 18:51:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJJyW-0006K1-VV; Sun, 13 Feb 2022 18:51:56 +0000
Received: by outflank-mailman (input) for mailman id 271016;
 Sun, 13 Feb 2022 18:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbK4=S4=epam.com=prvs=4043a61b92=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1nJJyV-0006Jv-1x
 for xen-devel@lists.xenproject.org; Sun, 13 Feb 2022 18:51:55 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 019b1aeb-8cfe-11ec-b215-9bbe72dcb22c;
 Sun, 13 Feb 2022 19:51:53 +0100 (CET)
Received: from pps.filterd (m0174678.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21DHjAwM005287;
 Sun, 13 Feb 2022 18:51:40 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e76n2r2x6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 13 Feb 2022 18:51:40 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AM0PR03MB4945.eurprd03.prod.outlook.com (2603:10a6:208:102::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Sun, 13 Feb
 2022 18:51:36 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::e975:b192:b8cd:4f73%5]) with mapi id 15.20.4975.015; Sun, 13 Feb 2022
 18:51:35 +0000
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
X-Inumbo-ID: 019b1aeb-8cfe-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvZbXnRGsdDtEZ4ukq26kxG9BtpBMtffZi0kH/OJ1bRxtCNSUc4ApJqP3iz8vVLmAvKoS7zNuJdT0lxheUTse+TPgnbeeGodgkWuNabWIr0OCOqII72SESEr0MdlTDq29wAp8YabYRkTQxW0+rg1lQxip0qxsPGUQPkaAWOdQTTW52EBUI8RkbB1wnvgeFJqXh+XGQ3HQzobP435bMFlZ4sLPuZpucxh8rS1rCwbvz2VvXVWDZZIPnCK5rhmd13NxUsHaqyI1X7O7S/4VrSHZa4GTbGY2uuLmC7UTybu7QQPB6pYcW/VX87caAavb5h+p29hO1zyTNuOfQ2eYquS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZXye8hZdmDwQ1nQ06sjz3T3zcN7JDchhKvN/KbavBeA=;
 b=Fpom+oKJuBJ2bAqFVWO0iEnG9oFP2EsqrPUGxd3KhnXKtIgg0u5LWa+q5IsuLolZgB7DR2Hz0N886CfaextRND0f2koeGZ2iU1naxnu8wuVGaSnfk0rDQKDOxh3aZ3eNzeszunl0ckRFCd8SWmHzT80lvXxigs3O9cjCuIZwQwUwvggGoxWLa3fF7l91SxxKb7PFPmDyUipjU/v5zTbOGnGDxoartdThCcWG6legdOkA65/FNocH80xXh79Jlrx+B4xHX1Tj7a3ifPITja1n9qJ0R/tig5s2cn4XJ9FYcyfNbxK1yTob8DRYyi0mooK36dFIdIrF+JYF2nojZHLMGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZXye8hZdmDwQ1nQ06sjz3T3zcN7JDchhKvN/KbavBeA=;
 b=quPDRItBzUfoOpGEqBbOzrPXLlzKlCkJOB6tqDcAOyOfJtBKeNCRCBWlGRizRHDjGpQE767x//N0aZFD0kYSgaYu3FeQ+Kxc25CKSPo1xIITvbwIbKgBiyVvEpTx1sNB+jdunVOhkPph7K0EMscMoc2IrYv/kDJ7H1yVyaMbLPMMbaG0j4/MbUrlnuR9TzY4oK9EToywId3V20s5dFRW14rCvL9bCgtlyFU5+Jq6xRalTwzWCSD3COTIvEL1TbXKgkVCMgXHDi65eHfBSN/P3JYhwauSD8lbUbHdvZlGhhdfinUoTnSrqrJ6lpOG24DfaJLQkJtPcRnhihj8PEWDSA==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: Julien Grall <julien@xen.org>
CC: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Bob Eshleman
	<bobbyeshleman@gmail.com>,
        Alistair Francis <alistair.francis@wdc.com>,
        Connor Davis <connojdavis@gmail.com>
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Thread-Topic: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on
 Arm
Thread-Index: 
 AQHYAomKM/4d8JNsdEqc8nNA4dib2KyIh6IAgAAs1wCAAQzHgIAAg9oAgAJ8BQCAAHfAAIAEqUeAgAAuOAA=
Date: Sun, 13 Feb 2022 18:51:35 +0000
Message-ID: <98105196-5f2b-d9a6-5f2a-10bf60d309b0@epam.com>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <79fbf83e-d25e-2634-9769-8e07634bfd63@epam.com>
 <a104d3ea-170e-8175-ac04-abfcebb4ae29@xen.org>
 <f9e3ee5b-0811-8317-42c2-61c8cdbfe254@gmail.com>
 <40ec7063-0c59-02d1-90c7-4cfc9791ad27@xen.org>
In-Reply-To: <40ec7063-0c59-02d1-90c7-4cfc9791ad27@xen.org>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 66c7a59f-199f-443c-7dad-08d9ef21dc51
x-ms-traffictypediagnostic: AM0PR03MB4945:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB4945E79CC29D22B8A31E542386329@AM0PR03MB4945.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 yVsJhWbC/yotMTY7eWLwrXQoDXPKwl0BwO4ABtHQKN0HQQkQPNoN3nsSxNH9vvOgq1mvXlV1volpfkH7BqfAXZglJyPqI6YSLWQeucoT5gu5eYjiia5LttD94Xl1WRGSQXKJCLWBxAJPa/zXwaHzKNm4YGdhs/AeC0F8B1Thcijc+4gEzaiz5+9q/hQwcJMfdnS1tWeFx/Dezsz13qXnEPcpL5NH1dXFf1C6wDFqNufcwp+16eA7fzQ6Mzvf3MRWuEBqhhea24ca4yHxT2pTtgiM73ligfIKdcDsAkB8QcQ+e8fcQm5OgWDbzg81uhR9LBlQ6JbdVYIYNAxsSLexa/mvzn2pECnJWHmFlbPyPOSI0MkLFELpNIz/7r4V96Ik5OAbsjxFoGFfxAx26xM2UNVCMn6aVH7tTNOOXf0Dv0zNAIgoSflMKDc0qZSqQY9u0zEYUvm584A20A2MeQKo24mZo+3KlV+TCKfApKpHj5IVdT9Lq2IjnWur0oCu1NryaA5k+dN125n82sdElJCydU+kd3E8a6GNMbf86AEl9KaLXhCPs0ry+6Ir/eptyfUw39/tbX+ludz5rCMocMS4c4hudr01D7kYAzW/ql50LuZxAO5chaulcqp45/RYPQXBU3pWe5iegN7OeuWZE0SpENgCpFScb98F5y2W2O/soi2niRdpPWOgmkNqU7fMXnrUFEvw8JoX95nBJ6PHs7h/1CGJhaLNWwIG+SDaR5W6iwmnrBO1u5oG4WjS6ljMoAB/Yhe2G2l4npDVN23oaMF3JeCJ0IB7QfCWy60+NvJcG09Knn842rw7MC8OwKM4lHcAVjxRrp31F8LAvHGCm+0TwQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6486002)(38070700005)(7416002)(8676002)(31686004)(8936002)(186003)(64756008)(66476007)(66946007)(66446008)(66556008)(83380400001)(76116006)(4326008)(31696002)(2616005)(26005)(966005)(91956017)(5660300002)(53546011)(508600001)(55236004)(71200400001)(6512007)(6506007)(2906002)(86362001)(38100700002)(54906003)(316002)(6916009)(36756003)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?T3pKMDVCOWpBZVVxU2ZnWXlhR0RSU3ZueVpUTkF2Wk5ER1QrcUt6V1YzRzFX?=
 =?utf-8?B?cE9xR3FGWTNHL0R5WHdJbENzU1lIMEgyY1NZTzJkRVFpN2pEM25TMG01V1FO?=
 =?utf-8?B?MXA5OUp0d1ovZUwxVFZmVjVjS3ovVzRDRHhWMk1WVjdNb1RWSWpkQzhRVitR?=
 =?utf-8?B?SnVQTFdmaW9tNWFxMnd5Z0lIN29KZlZsSmtRdEdkcC9Eb1FVL0Z5cHhiQjhQ?=
 =?utf-8?B?OWk4OHVMWGNVdnlqMzY3WE5XTFA1ZklNNHZZRU9zbHB3eklLckZvanZycnh1?=
 =?utf-8?B?MXNhaUhVL0ZuQmpWOElqb0hpNDdDdHZ5S1djeFZGT21qZDlqMHpLcXd2STIz?=
 =?utf-8?B?cVdjd1hoa2pKVWlaeWRnRFAwZDVjMGJVOGxhN1EzNWNmNG1Qazc2UDBiVjll?=
 =?utf-8?B?eEZkVVQ5MFlIRHlRdEJBeTJjUHEzUVNWenlPaTE0cytBS1NOSWNITDdtQ2tF?=
 =?utf-8?B?MGE5WDBVeWR0RFB2Qld4blhpbzE0MTZvY3NJME93ZExya2hXelNWVlpwSEdn?=
 =?utf-8?B?bmZYdGsyNlBnN3dxbGo4eVU4ZDlTV2p0MVFqZEYyUGVBUFdXSmxzZnpKeXBT?=
 =?utf-8?B?V3ZYQS9pUTk0QlkvSmtTMUxPWEZwNGxSQmg2TkhrYnlBb2w5N05kMXFMUFR6?=
 =?utf-8?B?TGx4eTRad2oyYmFvcGhHYXFITmNMZjhQd1diSWxiZEttVWhPcVlRTVB3SEpC?=
 =?utf-8?B?U2ZDODRBUjBiaVFCOVpZeEtWakN2TUZwcUVaRHhRaW1SVW11VG1wQ3k2VDJn?=
 =?utf-8?B?S0RVWmV4WnFVcjA5TEQ4cVI2RE1sNUliQ1RiaCtvY0hURU9XTGJaNURGWnVK?=
 =?utf-8?B?THM1TVJ3NFQ5Q1hReEpBazRESVZ4ZUxvMy92b1dFbmN5NE9aenhjWDlnNXFW?=
 =?utf-8?B?clY2aHB1V2U5R01QZ1UyZG9PcExzOFdtMnlPQllrYkVqK2dGQ0JGK3RGZENj?=
 =?utf-8?B?ZlJHVEtMalZ5M0ZWQnNUZjBwVkRWZkV4TG41eE5RQ1pTc3k0S1VVRWdEd1hu?=
 =?utf-8?B?WUJFVGs0U0FtNk1WYml5eE5ORGNlUGg3OTJDVlFvVStoNzRRUDFHNVJscWtr?=
 =?utf-8?B?RkZIVzdKK0w4ZkI4VTc0Zmh4MXBFVTVTeUZRTUh4ekJKMVc3eG16ZkE1ajBt?=
 =?utf-8?B?ZGJzSVZkaGVNVS82b2RZS0UrT0R5QVhmQWtGTnJuVjFTUGZtZisrenBpbmtM?=
 =?utf-8?B?b2MwWlRWL0dudHZKZFZiWU1qVTdOZnNHNzJWVjFRL3o1VVk0ZzVtREI5N2p3?=
 =?utf-8?B?VTdWL1doSTVSb3RQOXl2N2FBNTlqWXVCTUNVNVlHUmJ2QzV2NVNHOWZzSU01?=
 =?utf-8?B?MjFnNjlVUjFxeXFGY1VIL3NzQVc1aUIyY0o0em5yanl3MGtZQU9UVlV6T25r?=
 =?utf-8?B?TFZPdWtpUENjbzVVMG1HVUJZWnRiMGtVT3Y1OHVzbE90MEZ3QUROSnp5N0VY?=
 =?utf-8?B?TFdHekVLeS9SeUFZVUJTamVVNUNhZ1dVZjFhNk93ZnFzN1FuRWx0QjBoQ0Vz?=
 =?utf-8?B?SHpWVWM1TFRLVEdQOGxFRVJ1Z0RjOXkxTzVDdUZNZGRMNnpIelFpb0FvZEZs?=
 =?utf-8?B?SnJjQndRVzRMZTc1UVp5T2hlc1pUem5wRUt5bGdINmJkeElVUHJXd1lBYnlw?=
 =?utf-8?B?blgwMkoxWkJVN1ZCc2hnNVR3TmxaVjN1NEhOYVFlNTVIMlIzUnVZWlFoTmI2?=
 =?utf-8?B?cGNnb0pPY0xsNzJUcE9lb3lvYmpQMUVWV0oyU3B5WWJ3RFhHZkN3YWNKYmpm?=
 =?utf-8?B?OWhhWDRMUHF0djROSUFRaXNDVEhnVU5YL2ZDa2QxUGZUd01hWnBDazUxUm11?=
 =?utf-8?B?OVpORmlWSXhRTlNTc2wyZElxT29yYkJMbHdJTjJuNE1tT3VXNC9TZXQ4NjVL?=
 =?utf-8?B?Tm1mVWxXUVNnOGFucWVISDg0MnBDMjZEbEJzSWZBU1g1SHNFNzZ0Y2lDU0c3?=
 =?utf-8?B?bUFJWEsvMTNCbEozWmg3aUN3R0twcVBYSnd4ZERJZXhTa0N1RGRlRXdyaGtB?=
 =?utf-8?B?WW44V1pTMHFnbFZTOEZOYXlyclRuU3dCdENOTUlrOWhkbXo4ZTFwM3ArQThX?=
 =?utf-8?B?ZjVHa1R2YmVXZEVGaEVxVk5ieUYwQVdyQ2Q1cDVzWDVxTzFSZFJDbWsxNlVR?=
 =?utf-8?B?Vjl4anVkVk9mcEZMbmg2YWU4WmdPemNzcVY3QTFrK3JieHVLUk84ZmpUQkNS?=
 =?utf-8?B?TnN4SnNlcTRUQlFaQ0duanREaWp1T2xlNy93SHQ2czFNcUdKMTNlajhMelZx?=
 =?utf-8?Q?SPpz9+9l3LB5oWRjll70rVmzet9zazSuZ1See/9+tk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6DE577D54A7F1A48B490C3E8073542DD@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66c7a59f-199f-443c-7dad-08d9ef21dc51
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2022 18:51:35.7985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BJwObXzUoemjANuG8Vj/oHsxY7Naiyyfpm6aVK1i9JBi0HWhu3CGlQ+5xyP+dCboeAG4lhByu/1LYhU6Gw+aJ+8jrCzXqCNAQlx2Fe8OGo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4945
X-Proofpoint-GUID: 10wRGyhLoii-xf76UeLOUXLbMh4P6JrO
X-Proofpoint-ORIG-GUID: 10wRGyhLoii-xf76UeLOUXLbMh4P6JrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-13_07,2022-02-11_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202130128

DQpPbiAxMy4wMi4yMiAxODowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBPbGVrc2FuZHIs
DQoNCg0KSGkgSnVsaWVuDQoNCg0KDQo+DQo+IE9uIDEwLzAyLzIwMjIgMTY6NTUsIE9sZWtzYW5k
ciB3cm90ZToNCj4+DQo+PiBPbiAxMC4wMi4yMiAxMTo0NiwgSnVsaWVuIEdyYWxsIHdyb3RlOg0K
Pj4+DQo+Pj4NCj4+PiBPbiAwOC8wMi8yMDIyIDE5OjUwLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3
cm90ZToNCj4+Pj4NCj4+Pj4gT24gMDguMDIuMjIgMTM6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToN
Cj4+Pj4gQmVsb3cgdGhlIGRpZmYgSSBoYXZlIGxvY2FsbHk6DQo+Pj4+DQo+Pj4+IGRpZmYgLS1n
aXQgYS94ZW4vYXJjaC9hcm0vcDJtLmMgYi94ZW4vYXJjaC9hcm0vcDJtLmMNCj4+Pj4gaW5kZXgg
NTY0NjM0My4uOTBkNzU2MyAxMDA2NDQNCj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJtL3AybS5jDQo+
Pj4+ICsrKyBiL3hlbi9hcmNoL2FybS9wMm0uYw0KPj4+PiBAQCAtMTMxNSwxMSArMTMxNSwzMiBA
QCBzdGF0aWMgaW5saW5lIGludCBwMm1fcmVtb3ZlX21hcHBpbmcoc3RydWN0DQo+Pj4+IGRvbWFp
biAqZCwNCj4+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWZuX3QgbWZuKQ0KPj4+PiDCoCDCoHsN
Cj4+Pj4gwqAgwqDCoMKgwqAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IHAybV9nZXRfaG9zdHAy
bShkKTsNCj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nIGk7DQo+Pj4+IMKgIMKgwqDCoMKgIGlu
dCByYzsNCj4+Pj4NCj4+Pj4gwqAgwqDCoMKgwqAgcDJtX3dyaXRlX2xvY2socDJtKTsNCj4+Pj4g
K8KgwqDCoCBmb3IgKCBpID0gMDsgaSA8IG5yOyApDQo+Pj4+ICvCoMKgwqAgew0KPj4+PiArwqDC
oMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGN1cl9vcmRlcjsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IGJvb2wgdmFsaWQ7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBtZm5fdCBtZm5fcmV0dXJuID0gcDJt
X2dldF9lbnRyeShwMm0sIGdmbl9hZGQoc3RhcnRfZ2ZuLCBpKSwNCj4+Pj4gTlVMTCwgTlVMTCwN
Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZjdXJfb3JkZXIsICZ2YWxpZCk7ID4gKw0K
Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCB2YWxpZCAmJg0KPj4+DQo+Pj4gdmFsaWQgaXMgYSBj
b3B5IG9mIHRoZSBMUEFFIGJpdCB2YWxpZC4gVGhpcyBtYXkgYmUgMCBpZiBYZW4gZGVjaWRlZCAN
Cj4+PiB0byBjbGVhciBpdCAoaS5lIHdoZW4gZW11bGF0aW5nIHNldC93YXkpLiBZZXQgdGhlIG1h
cHBpbmcgaXRzZWxmIGlzIA0KPj4+IGNvbnNpZGVyZWQgdmFsaWQgZnJvbSBYZW4gUG9WLg0KPj4+
DQo+Pj4gU28geW91IHdhbnQgdG8gcmVwbGFjZSB3aXRoIGEgZGlmZmVyZW50IGNoZWNrIChzZWUg
YmVsb3cpLg0KPj4NCj4+DQo+PiBIbW0sIEkgZ290IGl0LCBzbyAuLi4NCj4+DQo+Pg0KPj4+DQo+
Pj4NCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAoIW1mbl92YWxpZChtZm4pIHx8ICFt
Zm5fZXEobWZuX2FkZChtZm4sIGkpLCANCj4+Pj4gbWZuX3JldHVybikpICkNCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgIHsNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmMgPSAtRUlMU0VROw0K
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIH0NCj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqAgaSArPSAoMVVMIDw8IGN1cl9vcmRl
cikgLQ0KPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgoZ2ZuX3goc3RhcnRfZ2ZuKSAr
IGkpICYgKCgxVUwgPDwgY3VyX29yZGVyKSAtIDEpKTsNCj4+Pj4gK8KgwqDCoCB9DQo+Pj4+ICsN
Cj4+Pj4gwqAgwqDCoMKgwqAgcmMgPSBwMm1fc2V0X2VudHJ5KHAybSwgc3RhcnRfZ2ZuLCBuciwg
SU5WQUxJRF9NRk4sDQo+Pj4+IMKgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcDJtX2ludmFsaWQsIHAybV9hY2Nlc3Nfcnd4KTsNCj4+Pj4gKw0KPj4+PiAr
b3V0Og0KPj4+PiDCoCDCoMKgwqDCoCBwMm1fd3JpdGVfdW5sb2NrKHAybSk7DQo+Pj4+DQo+Pj4+
IMKgIMKgwqDCoMKgIHJldHVybiByYzsNCj4+Pj4NCj4+Pj4NCj4+Pj4gQ291bGQgeW91IHBsZWFz
ZSBjbGFyaWZ5LCBpcyBpdCBjbG9zZSB0byB3aGF0IHlvdSBoYWQgaW4gbWluZD8gSWYgDQo+Pj4+
IHllcywgSQ0KPj4+PiBhbSB3b25kZXJpbmcsIGRvbid0IHdlIG5lZWQgdGhpcyBjaGVjayB0byBi
ZSBvbmx5IGV4ZWN1dGVkIGZvciB4ZW5oZWFwDQo+Pj4+IHBhZ2VzIChhbmQsIHByb2JhYmx5LCB3
aGljaCBQMk0ncyBlbnRyeSB0eXBlIGluIFJBTT8pIHJhdGhlciB0aGFuIGZvcg0KPj4+PiBhbGwg
cGFnZXM/DQo+Pj4NCj4+PiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGZvciB0aGUgcHVycG9zZSBv
ZiB0aGlzIHdvcmssIHdlIG9ubHkgDQo+Pj4gc3RyaWN0bHkgbmVlZCB0byBjaGVjayB0aGF0IGZv
ciB4ZW5oZWFwIHBhZ2VzLg0KPj4NCj4+DQo+PiDCoMKgLi4uIHllcywgYnV0IC4uLg0KPj4NCj4+
DQo+Pj4NCj4+Pg0KPj4+IEJ1dCBJIHRoaW5rIGl0IHdvdWxkIGJlIGEgZ29vZCBvcHBvcnR1bml0
eSB0byBoYXJkZW4gdGhlIFAyTSBjb2RlLiANCj4+PiBBdCB0aGUgbW9tZW50LCBvbiBBcm0sIHlv
dSBjYW4gcmVtb3ZlIGFueSBtYXBwaW5ncyB5b3Ugd2FudCAoZXZlbiANCj4+PiB3aXRoIHRoZSB3
cm9uZyBoZWxwZXJzKS4gVGhpcyBsZWFkIHVzIHRvIGEgZmV3IGlzc3VlcyB3aGVuIG1hcHBpbmcg
DQo+Pj4gd2VyZSBvdmVycmlkZW4gc2lsZW50bHkgKGluIHBhcnRpY3VsYXIgd2hlbiBidWlsZGlu
ZyBkb20wKS4NCj4+PiBTbyBJIHdvdWxkIHNheSB3ZSBzaG91bGQgZW5mb3JjZSBpdCBmb3IgZXZl
cnkgUkFNIG1hcHBpbmcuIA0KPj4NCj4+DQo+PiAuLi4gSSB0aGluayB0aGlzIG1ha2VzIHNlbnNl
LCBzbyB0aGUgcHJvcGVyIGNoZWNrIGluIHRoYXQgY2FzZSwgSSANCj4+IGFzc3VtZSwgc2hvdWxk
IGNvbnRhaW4gcDJtX2lzX2FueV9yYW0oKSBtYWNybzoNCj4NCj4NCj4gQ29ycmVjdCwgcDJtX2lz
X2FueV9yYW0oKSBsb29rcyB0aGUgbWFjcm8gd2Ugd2FudCB0byB1c2UgaGVyZS4NCg0KDQpHb29k
LCB0aGFuayB5b3UgZm9yIHRoZSBjbGFyaWZpY2F0aW9uISBGWUksIEkgaGF2ZSBhbHJlYWR5IHJl
LWNoZWNrZWQgDQp3aXRoIHAybV9pc19hbnlfcmFtKCkuIERvbVUgd2l0aCBQViBkZXZpY2VzIChk
aXNwbGF5LCBzb3VuZCwgbmV0KSBhbmQgDQpWaXJ0aW8gKGJsb2NrKSBib290cyB3aXRob3V0IGFu
eSBpc3N1ZXMsIHRoZSByZWJvb3QgYW5kIGRlc3Ryb3kgYWxzbyANCndvcmsuIFRvIGJlIGNsZWFy
LCBhbGwgYmFja2VuZHMgaW4gbXkgZW52aXJvbm1lbnQgcmVzaWRlIGluIERvbUQuDQoNCg0KPg0K
Pj4+IE5vdGUgdGhhdCwgSSB3b3VsZCBsaWtlIHRvIHNlZSB0aGlzIGNoYW5nZSBpbiBhIHNlcGFy
YXRlIGNvbW1pdC4gSXQgDQo+Pj4gd2lsbCBiZSBlYXNpZXIgdG8gcmV2aWV3Lg0KPj4NCj4+DQo+
PiBvaywgSSB3aWxsIGludHJvZHVjZSB0aGlzIGNoZWNrIGJ5IGEgc2VwYXJhdGUgcGF0Y2guDQo+
DQo+IFRoYW5rIHlvdSENCj4NCj4gWy4uLl0NCj4NCj4+Pj4gSXQgaXMgZ29pbmcgdG8gYmUgYSBu
b24tcHJvdGVjdGVkIHdyaXRlIHRvIEdGTiBwb3J0aW9uIG9mIHR5cGVfaW5mby4NCj4+Pg0KPj4+
IFdlbGwgbm8uIFlvdSBhcmUgdXNpbmcgYSBSZWFkLU1vZGlmeS1Xcml0ZSBvcGVyYXRpb24gb24g
dHlwZV9pbmZvLiANCj4+PiBUaGlzIGlzIG5vdCBhdG9taWMgYW5kIHdpbGwgb3ZlcndyaXRlIGFu
eSBjaGFuZ2UgKGlmIGFueSkgZG9uZSBvbiANCj4+PiBvdGhlciBwYXJ0IG9mIHRoZSB0eXBlX2lu
Zm8uDQo+Pg0KPj4NCj4+IEkgYW0gY29uZnVzZWQgYSBiaXQsIHRvIHdoaWNoIG15IGNvbW1lbnQg
eW91ciBjb21tZW50IGFib3ZlIGJlbG9uZ3MgDQo+PiAodG8gdGhlIGRpZmYgZm9yIHBhZ2Vfc2V0
X3hlbmhlYXBfZ2ZuKCkgYWJvdmUgb3IgdG8gc2VudGVuY2UgcmlnaHQgDQo+PiBhZnRlciBpdCk/
DQo+PiBUaGUgIkl0IGlzIGdvaW5nIHRvIGJlIGEgbm9uLXByb3RlY3RlZCB3cml0ZSB0byBHRk4g
cG9ydGlvbiBvZiANCj4+IHR5cGVfaW5mby4iIHNlbnRlbmNlIGlzIHJlbGF0ZWQgdG8gdGhlIGRp
ZmYgZm9yIGFsbG9jX2hlYXBfcGFnZXMoKSANCj4+IGJlbG93LiBTb3JyeSBpZiBJIGRpZG4ndCBz
ZXBhcmF0ZSB0aGUgY29tbWVudHMgcHJvcGVybHkuDQo+DQo+IE9rLiBTbyBpdCB3aWxsIGJlIGEg
d3JpdGUgb3BlcmF0aW9uLCBidXQgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kIHdoeSANCj4geW91
IHRoaW5rIGl0IGlzIGp1c3QgdGhlIEdGTiBwb3J0aW9uLg0KPg0KPiBUaGUgY29kZSBpcyB1c2lu
ZyAiLi4udHlwZV9pbmZvID0gUEdUX1RZUEVfSU5GT19JTklUSUFMSVpFUiIuIFNvIHRoZSANCj4g
ZnVsbCA2NC1iaXQgKGFzc3VtaW5nIGFybTY0KSB3aWxsIGJlIG1vZGlmaWVkLg0KDQoNCllvdSBh
cmUgcmlnaHQsIEkgd2Fzbid0IHByZWNpc2UsIHNvcnJ5Lg0KDQoNCj4NCj4NCj4gSW4gZ2VuZXJh
bCwgdGhlIEdGTiB0YWtlcyA2MCBvZiB0aGUgNjQtYml0cy4gU28gYW55IHRpbWUgeW91IG5lZWQg
dG8gDQo+IG1vZGlmeSB0aGUgR0ZOIChvciB0aGUgY291bnRfaW5mbyksIHlvdSB3aWxsIGVuZCB1
cCB0byBtb2RpZnkgdGhlIA0KPiBlbnRpcmUgb2YgdHlwZV9pbmZvIChhbmQgdmljZS12ZXJzYSku
IElmIHRoaXMgaXMgYmVjb21pbmcgd2UgcHJvYmxlbSANCj4gKGUuZy4gdGhlIGNvdW50X2luZm8g
aXMgYWN0aXZlbHkgdXNlZCkgd2Ugd2lsbCBuZWVkIHRvIHVzZSBjbXB4Y2hnKCkgDQo+IHRvIG1v
ZGlmeSB0aGUgR0ZOIHBvcnRpb24uDQoNCg0KSSBnb3QgaXQsIGFzIEkgdW5kZXJzdG9vZCBmcm9t
IHlvdXIgZXhwbGFuYXRpb24gYWJvdXQgDQpzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0KCkgYXQg
WzFdIHRoaXMgaXMgbm90IGEgcHJvYmxlbSB5ZXQgd2l0aGluIA0KY3VycmVudCBjb2RlIGJhc2Uu
DQoNCg0KWzFdIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcveGVuLWRldmVsL2ExMDRkM2VhLTE3
MGUtODE3NS1hYzA0LWFiZmNlYmI0YWUyOUB4ZW4ub3JnLw0KDQoNCj4NCj4NCj4gQ2hlZXJzLA0K
Pg0KLS0gDQpSZWdhcmRzLA0KDQpPbGVrc2FuZHIgVHlzaGNoZW5rbw0K

