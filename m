Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E4E4A6FEE
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 12:27:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264078.457046 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDmk-0000zB-T2; Wed, 02 Feb 2022 11:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264078.457046; Wed, 02 Feb 2022 11:26:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFDmk-0000wd-PM; Wed, 02 Feb 2022 11:26:50 +0000
Received: by outflank-mailman (input) for mailman id 264078;
 Wed, 02 Feb 2022 11:26:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1p3Q=SR=epam.com=prvs=40324c57ab=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFDmi-0000wX-Rw
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 11:26:48 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 016c9ee0-841b-11ec-8f75-fffcc8bd4f1a;
 Wed, 02 Feb 2022 12:26:47 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 212BJJSe005153;
 Wed, 2 Feb 2022 11:26:42 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3dyrypg25u-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Feb 2022 11:26:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by PA4PR03MB7120.eurprd03.prod.outlook.com (2603:10a6:102:e9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22; Wed, 2 Feb
 2022 11:26:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 11:26:26 +0000
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
X-Inumbo-ID: 016c9ee0-841b-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CFu8x3ASkHeYMgH5Q7Qgi4x0j9QhkBJf3LaEUT1D8vQnwLQF95EN676VHONDjAnAfTO3gCE11kClccvnKht3sk8RqNeAd6rWxXxq8fl4Rpbgk6E+24abArDSsGnT/QHu3PdRMJI74+SAqGRUwhOTqFZbc8UyQ7tSxn+mMKX1SQW4UISjX43mpwj0Y/xwataiW8Kk2fmV7zanr07PO527pbkvacOfeTMqilO708IUzw0xDGiM7w0AedoF66vpeu743LIC+BXw+GF2gWgeJB0bRFWvd0ohcplNqLTQWVJoAUzRNfPxNxmFtoB4AiJY0jowsCmmg0YeGWNko5iUrH+qpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3A+7eRfDvBKHyYUPWc+GJ7pS8L/KWZXVM1Pf8myuqM=;
 b=JuXNN326MgyV+w9vKx8j+Mh4IMLR5QiKUt8WIqbeA1jcHF8vOoSBaXcfkrqI/6bI4NHaKPldUEoqtE6UfbyyEp6eHXFxZ3WQ5jnHnJC0FFaA0oUv2MXOAxWXW5t8jcqxx677hIGPRtG4mlpn5ennOe6l8TmUwcJSrLxE72Na9jNCmviLagxKv/X1316V2ecNzUmT1nBn8zO+XM0DvLH7trKtNrDyDyz68/i9GnNJ6obU8pdBbiC6s3vGxghJut8Pk2BuvxwGhkAdKXyOuemVDoB/W0RC4ASwf6TeaXGr8mQjFeWmQGLfZCDVZgJFzqt2kbFswXkURdETodFHCM/Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3A+7eRfDvBKHyYUPWc+GJ7pS8L/KWZXVM1Pf8myuqM=;
 b=cT6yUGahEHcSmw0DCYcVGOfETlJoxFq5iecHkCNa52rjC481Yr2wZfrWb6I+C+4pM0N9m0AuDyjxW3NnQMVy90AKyD1gBRa/6Tny6nWZLWRm4fks7J34vHLKythP2xfRMVTQ1f607Qcu4gcUPWDTattiMf91VOAm9Nxhy+JSVTOzVIs0vRvqpoq/MN2KijRwbqdynWuOOAxv8/4+0eCC39S5glZZrEsIzU7YJyMh4UePO3QFjB9035B9j6iFJME/qAGgwzcJEOfWJTONtMa2bFkc2xngmrTqb2kv+3jxipNrrhBvBOgWEnhBjpWtNaZls3R0iD6OI0MzKroAd5eheA==
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
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 4/4] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH 4/4] vpci: move lock outside of struct vpci
Thread-Index: AQHYF4hPRx/tX4vEOUaqhaVglKUz1ax//dWAgAAcC4CAAAM+gIAAAz8A
Date: Wed, 2 Feb 2022 11:26:26 +0000
Message-ID: <8830b7dc-f75b-25e4-c170-9351a4cd0139@epam.com>
References: <20220201162508.417008-1-andr2000@gmail.com>
 <20220201162508.417008-5-andr2000@gmail.com>
 <fc3df33c-d1e5-8c74-01e9-7ea7cea41521@suse.com>
 <e19a0f7a-651e-09a6-c03d-ea5286fe03ba@epam.com>
 <58209ef8-59e7-129d-c8d5-3edc975892ac@suse.com>
In-Reply-To: <58209ef8-59e7-129d-c8d5-3edc975892ac@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 307cc03e-24f3-4e16-9ebe-08d9e63eda04
x-ms-traffictypediagnostic: PA4PR03MB7120:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <PA4PR03MB712095CBB51F70777557D48FE7279@PA4PR03MB7120.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5Pa3c9R6a3z/B2qc1hHc/CnWA7vBvoqqzIjuspcP3TrWuG5LtNUbgjCpnwmr/toQRN2g4aJ6GUQJmlBQDqK/eNeYkzPV2/ZTH4DU/HYheLVVNqXle4usmG6lwrX6McrxkQ5z6vSXIiIUWZ/V0Q8SHz1U2otmgOCRHqX7mWJAPYyVUUIkiL+N2OoWcA8L05bgmdLz8bwnnwEQFYaf2pbUOwPXgpGjyi8jUN/7sjSuNqiJQ3XD/gIRo3mK8ddT8wvEJUy+zUq0O4f789OEvqfJQxvZxd9dN0XA2eOLEn0EMh0mKW5up51djY2/pKb0tM/tWVb6mrE554LeBHm7K45w+3YwRmi/wzEzTXOCGHGUSKyDFyWE6+0Y2T4sU8dq/5Wq1Zbf0OZkPIdB4F5dOITa/p0tPK+mGia8zTPFr9e71/pXrQVKc/0h7wyywztdt6sAisof76FxEHCBAItn2s0yPXfy5uj+hha2UfdRHHTQMpUyjKe2MqW8iTPkJTTL0g+3qs/ORu0n/xYKMXjmd+ZlreRRSoXExZ7Y1378suGuto4596ArT7dlnVUKzulfaDwO2FEn0AvGLXaUYI7eO3xoQlbHRaXcroqz91IAHMVcYS4/Aw6AaiZ6LjySwd4E8XKpG7GYSWCob/sXV/3HCrgv39WIa2GWfauSxOPe6+bzR5nCy6bKjWJ5MK9/qdFBLHhqbTdf01ugNSyepMUPOSt7Lyk8Sv0DUSJOE1WRGLj8c+ku6aKz+We1d7VZyxbRgzray5xnuHMr9ewwgkd//yuvICFwr3Z+6agmxg6OMX9mjnOjGRMjnIre5LM56RMQESbe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(38070700005)(71200400001)(83380400001)(53546011)(6506007)(31696002)(6916009)(2906002)(36756003)(6512007)(54906003)(966005)(316002)(4326008)(107886003)(66476007)(2616005)(66556008)(64756008)(186003)(8936002)(8676002)(76116006)(91956017)(122000001)(66946007)(508600001)(31686004)(7416002)(66446008)(5660300002)(6486002)(26005)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UGcxTlhJd2NFL0YyK0J3QWtOV2V4TDlGb1dFOVBVYzRMSk5VSHdsQm1lUGRR?=
 =?utf-8?B?QmJYYUlqV1JJaXRnZ1l4VW1VOTdkeFFYVkxFZlAyek9TK2xNL1gyWmRNSmEw?=
 =?utf-8?B?SG9ZT3NWakxmZWZoSzdSSVpBaFJCaS83clpvM1AwN0FJMHNxdlVqTjA3M0ZK?=
 =?utf-8?B?SnNXYUs1ZVFqek8xN0twTWpGMFVaZGZvVVppVWpNTWlJdGh1ZGxxS0lDalFr?=
 =?utf-8?B?bnBkcUpGNFVRYm9SeEZsUXpTbkR3aWFrQ055Qmx2bWtmcGtwV3F3cXZ0dHNP?=
 =?utf-8?B?WWN2WXBaSkY3SFdJdkxjWXpXWGNabk9QdVZIUEhjMS9JQ0RVQkJSdkhPRzNF?=
 =?utf-8?B?dVduYzNrNUNBZmlZOTlKM0FXelZWM0hKVUdBRXZZMmdxdUdESGNjMlF3YVNp?=
 =?utf-8?B?OG5FVGhTOTFlcDFRcGVZdU1mUEFDZE9DOWlid1hFZG95aStKNmVnZWNkM0RZ?=
 =?utf-8?B?VXZXaVBmMkFZU1NkOTNmd1BoVFRVdk1sTWRVUEFZSVpna05MRTBBOVZHcUpZ?=
 =?utf-8?B?dUtnME9qVmRHSmk5RGR5ZlRKWVhxbFVxeG1vU09xbEZhOENLRW8yM0lWM0VQ?=
 =?utf-8?B?cmVjQjhZbDltWFhaWmluQk9zSEZPK2NYVDE1VU91RXZodU5tNHJQK1YyWEN1?=
 =?utf-8?B?Q0RuUEdWdGJVckhHYmxNRmN5MklkU0RPcmRFTFlaeVZ6Q1Ntc0ZSaUMvSkFW?=
 =?utf-8?B?cHdoL2RBZHZ0cEpwQmdhajc4QTJTN0NmZXVTTTNNV0VlTmhtMytwSDZqSXJW?=
 =?utf-8?B?S0pPdHFueVVlZXlabEdtZ2JYQW0zSlhTM0RpY1BDL2ZvODhWd2l2ZkVDeWtN?=
 =?utf-8?B?a3oydlROcGJhNTQ5WTlPK1VXS0duRjBNM2hWVmdFblZZZzJGblBVeG5iN3B4?=
 =?utf-8?B?RkF6dFdVQnNsUzVLTEJ4SGFLZVRMdkxvVWlkV0hRMExuUFE4K2FkT0pxUDRv?=
 =?utf-8?B?YUNkdWFiYkxWMkxOSStGczg4dWlIdkhMYisra1B0WUN6anN4K0paMzYraUt6?=
 =?utf-8?B?RXhzRVZOSmI5d0d0czh3SXg3aWdKMjY2Qm5HN0tEdTF6VUJVR05oS253TVZT?=
 =?utf-8?B?SUFxTGk2VytHeEpXQzJPZXcxcE5YY0FPWlM4Z2Z1U3YvSHpVdW9jQ01uT3Jk?=
 =?utf-8?B?UGc1N0l2S2FjblpjRWhJODRHNlpHRkF4VDFrOGFLWnNZaTYxc2VIckp6bWxl?=
 =?utf-8?B?QjJoTjZMcitPaFVGZVo0TTZYOG5melJXdU5MSWV0VEsxTFJ0dTNpWTNmSW82?=
 =?utf-8?B?amdnTWM3VEQ3cjJ4THA2ZXloT1dHSHBHa0hXNFFOUW9HeVRWQ3RCUnhsNG5F?=
 =?utf-8?B?Vmo5OVZvRmRwVC95U3pDWWdnT3c0VkJFQzFJaStPd3hmSGE4b3ZEWkJ5QnpB?=
 =?utf-8?B?RmkweVd3eHdxWVBPSWd0eFNaMHNZeWsvVnVaWm9DU21VMU5GemZRRThpZ0I3?=
 =?utf-8?B?cEdCdEk0eGdBMktXNDZUWkZ4YnNMcGRSS3NJSnJhL0pBVDllZlRmVmxtY05w?=
 =?utf-8?B?Z1hzK3N6bTUySWxhTUNTdzFpYlR3TXRWdVFHOWdFWFpiWGRHdFNTUTJjeW5N?=
 =?utf-8?B?TW1oOVMzQ0gwaDVlVUY1N21jVnJuemZiR0JKbElsQkYrWlErcVdiRC9aYUdH?=
 =?utf-8?B?eUprRVRzV0Z0d2hLWWZlM2laUHRaMEhrdENzVjQ1OWZ4MktxVC9BZkJBdVJF?=
 =?utf-8?B?cFpsV2t4MjNLRzFhZ0Z5YmlxWjdGMFRuQmg2R3A0d2N0Y0JDNUVZVVhja3N2?=
 =?utf-8?B?UzZHa1RuYkxRTXdHQU45bHltNk5xNmsxaUEvS0wzWUR6UHozZk9pTWR3VzJl?=
 =?utf-8?B?OU1yTEUzVytHT3ZobDIyb0s1MzB3MStGUDd5ZlhJUjJQMGNtVU9NZjlXMEg4?=
 =?utf-8?B?RHFOeEplMWNXVWp2MWdTZ28ycUR0bXEzRTVjNjBhbEZMU1dBbUlORXc4VTQ2?=
 =?utf-8?B?R1pPcWxJTXJ1TXNDbkNMVWJhMWRUZ0pnRHZ0TDRmbUphanV2N21KbmQ5SkNH?=
 =?utf-8?B?YVNQSk55RldOWStHV0lOMHk3dExEMVQva2JvTk1pYXFNZ05GeS8yWkw0MXVt?=
 =?utf-8?B?WWc1aHJTbHBLWWlia2l4czFURlV3OU5VOE4zYVN2STFRNGhvbHU5RFp0Y1V3?=
 =?utf-8?B?ek4rMXI2OU4yQ0tGSmZSdW14QTRIT2NtMnFDTkFBQkRxeTZLWjM1dmd2UnFl?=
 =?utf-8?B?MERHd1VnL2x2bm1MUkR6SGtZZjNIRXdhN1dWN1pRVGhvVHFSbmNiNE1BaFpx?=
 =?utf-8?B?SDlqUnpLWVdLUnFpbTJKeWJGRDF4bGUybDZVNTN6ajV5aEpHdkNaZE5Ic2Vs?=
 =?utf-8?B?VXdvdmlkaURSazB1ZEVPM0NnekZOMXhQWkY1Q1ZCejZIMlByWXY4Zz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C44FA22FF59104CB120D48100AE2E23@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 307cc03e-24f3-4e16-9ebe-08d9e63eda04
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2022 11:26:26.9263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpplnLo4gHYPbK4k0P0Buy6CKqnoxSVMTk9lmp7UrM2m97V80M9dWYlU31aGpuc3Aez/i555R4w+U/aSltFMGUE+N7OAZnH2wG47ZU6Qo8qI5SgX7SdfN/Eh6cHiWeyP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7120
X-Proofpoint-GUID: aL2zA0VJhZohaI2iGqrwADLKvwqO1vsk
X-Proofpoint-ORIG-GUID: aL2zA0VJhZohaI2iGqrwADLKvwqO1vsk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-02_05,2022-02-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 mlxlogscore=843 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020060

DQoNCk9uIDAyLjAyLjIyIDEzOjE0LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDIuMDIuMjAy
MiAxMjowMywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBPbiAwMi4wMi4yMiAx
MToyMiwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMDEuMDIuMjAyMiAxNzoyNSwgT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+IEZyb206IFJvZ2VyIFBhdSBNb25uZSA8cm9n
ZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4+DQo+Pj4+IFRoaXMgd2F5IHRoZSBsb2NrIGNhbiBiZSB1
c2VkIHRvIGNoZWNrIHdoZXRoZXIgdnBjaSBpcyBwcmVzZW50LCBhbmQNCj4+Pj4gcmVtb3ZhbCBj
YW4gYmUgcGVyZm9ybWVkIHdoaWxlIGhvbGRpbmcgdGhlIGxvY2ssIGluIG9yZGVyIHRvIG1ha2UN
Cj4+Pj4gc3VyZSB0aGVyZSBhcmUgbm8gYWNjZXNzZXMgdG8gdGhlIGNvbnRlbnRzIG9mIHRoZSB2
cGNpIHN0cnVjdC4NCj4+Pj4gUHJldmlvdXNseSByZW1vdmFsIGNvdWxkIHJhY2Ugd2l0aCB2cGNp
X3JlYWQgZm9yIGV4YW1wbGUsIHNpbmNlIHRoZQ0KPj4+PiBsb2NrIHdhcyBkcm9wcGVkIHByaW9y
IHRvIGZyZWVpbmcgcGRldi0+dnBjaS4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogUm9nZXIg
UGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE9s
ZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4N
Cj4+Pj4gLS0tDQo+Pj4+IENjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXgu
Y29tPg0KPj4+PiBDYzogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0KPj4+PiBDYzog
SnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4+Pj4gQ2M6IFN0ZWZhbm8gU3RhYmVsbGlu
aSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4+Pj4gLS0tDQo+Pj4+IE5ldyBpbiB2NSBvZiB0
aGlzIHNlcmllczogdGhpcyBpcyBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhlIHBhdGNoIHB1Ymxp
c2hlZCBhdA0KPj4+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcveGVuLWRldmVsLzIwMTgwNzE3MDk0ODMwLjU0ODA2LTItcm9nZXIucGF1QGNpdHJp
eC5jb20vX187ISFHRl8yOWRiY1FJVUJQQSFqbW1jZXdZNnk5VXI0cmd2T2dxc2N6OGdCV2FvZDJK
blFPa0h2V3RZS2ducWVVNkJvV0pUcUNOM1VEcEN3M2lvOFluay13QlhoQSQgW2xvcmVbLl1rZXJu
ZWxbLl1vcmddDQo+Pj4+DQo+Pj4+IENoYW5nZXMgc2luY2UgdjU6DQo+Pj4gVGhpcyBpcyBhIGxp
dHRsZSBvZGQgaW4gYSBzZXJpZXMgaW1wbGljaXRseSB0YWdnZWQgYXMgdjEuDQo+Pj4NCj4+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92
cGNpL2hlYWRlci5jDQo+Pj4+IEBAIC0xNDIsMTIgKzE0MiwxMyBAQCBib29sIHZwY2lfcHJvY2Vz
c19wZW5kaW5nKHN0cnVjdCB2Y3B1ICp2KQ0KPj4+PiAgICAgICAgICAgIGlmICggcmMgPT0gLUVS
RVNUQVJUICkNCj4+Pj4gICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7DQo+Pj4+ICAgIA0KPj4+
PiAtICAgICAgICBzcGluX2xvY2soJnYtPnZwY2kucGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+IC0g
ICAgICAgIC8qIERpc2FibGUgbWVtb3J5IGRlY29kaW5nIHVuY29uZGl0aW9uYWxseSBvbiBmYWls
dXJlLiAqLw0KPj4+PiAtICAgICAgICBtb2RpZnlfZGVjb2Rpbmcodi0+dnBjaS5wZGV2LA0KPj4+
PiAtICAgICAgICAgICAgICAgICAgICAgICAgcmMgPyB2LT52cGNpLmNtZCAmIH5QQ0lfQ09NTUFO
RF9NRU1PUlkgOiB2LT52cGNpLmNtZCwNCj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgICFy
YyAmJiB2LT52cGNpLnJvbV9vbmx5KTsNCj4+Pj4gLSAgICAgICAgc3Bpbl91bmxvY2soJnYtPnZw
Y2kucGRldi0+dnBjaS0+bG9jayk7DQo+Pj4+ICsgICAgICAgIHNwaW5fbG9jaygmdi0+dnBjaS5w
ZGV2LT52cGNpX2xvY2spOw0KPj4+PiArICAgICAgICBpZiAoIHYtPnZwY2kucGRldi0+dnBjaSAp
DQo+Pj4+ICsgICAgICAgICAgICAvKiBEaXNhYmxlIG1lbW9yeSBkZWNvZGluZyB1bmNvbmRpdGlv
bmFsbHkgb24gZmFpbHVyZS4gKi8NCj4+Pj4gKyAgICAgICAgICAgIG1vZGlmeV9kZWNvZGluZyh2
LT52cGNpLnBkZXYsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmMgPyB2LT52
cGNpLmNtZCAmIH5QQ0lfQ09NTUFORF9NRU1PUlkgOiB2LT52cGNpLmNtZCwNCj4+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAhcmMgJiYgdi0+dnBjaS5yb21fb25seSk7DQo+Pj4+ICsg
ICAgICAgIHNwaW5fdW5sb2NrKCZ2LT52cGNpLnBkZXYtPnZwY2lfbG9jayk7DQo+Pj4gV2hpbGUg
SSBjZXJ0YWlubHkgc2VlIHRoZSBwb2ludCwgdGhlIGFkZGl0aW9uIG9mIHRoaXMgaWYoKSAoYW5k
IGENCj4+PiBmZXcgbW9yZSBlbHNld2hlcmUpIGlzbid0IGNvdmVyZWQgYnkgdGl0bGUgb3IgZGVz
Y3JpcHRpb24uDQo+PiBUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5czoNCj4+ICJUaGlzIHdheSB0aGUg
bG9jayBjYW4gYmUgdXNlZCB0byBjaGVjayB3aGV0aGVyIHZwY2kgaXMgcHJlc2VudCwgYW5kDQo+
PiByZW1vdmFsIGNhbiBiZSBwZXJmb3JtZWQgd2hpbGUgaG9sZGluZyB0aGUgbG9jaywgaW4gb3Jk
ZXIgdG8gbWFrZQ0KPj4gc3VyZSB0aGVyZSBhcmUgbm8gYWNjZXNzZXMgdG8gdGhlIGNvbnRlbnRz
IG9mIHRoZSB2cGNpIHN0cnVjdC4iDQo+PiBTbywgSSB0aGluayB0aGlzIGlzIGVub3VnaCB0byBk
ZXNjcmliZSB0aGUgZmFjdCB0aGF0IGFmdGVyIHlvdSBoYXZlIGxvY2tlZA0KPj4gdGhlIHByb3Rl
Y3RlZCBzdHJ1Y3R1cmUgbWF5IGhhdmUgZ29uZSBhbHJlYWR5IGFuZCB3ZSBuZWVkIHRvDQo+PiBy
ZS1jaGVjayBpdCBpcyBzdGlsbCBwcmVzZW50Lg0KPiBJJ20gYWZyYWlkIHRoYXQgdG8gbWUgImNh
biBiZSB1c2VkIiBkZXNjcmliZXMgZnV0dXJlIGJlaGF2aW9yLCBhcw0KPiBvcHBvc2VkIHRvIGUu
Zy4gImlzIHVzZWQiLiBJZiB5b3Ugd2FudCB0byBwb2ludCBvdXQgYm90aCBhc3BlY3RzLA0KPiBt
YXliZSAiLi4uIGNhbiBiZSB1c2VkIChhbmQgaW4gYSBmZXcgY2FzZXMgaXMgdXNlZCByaWdodCBh
d2F5KSAuLi4iPw0KVGhpcyBzb3VuZHMgZ29vZCB0byBtZSwgdGhhbmsgeW91IGZvciBzdWdnZXN0
aW5nIHRoYXQNCj4NCj4gSmFuDQo+DQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

