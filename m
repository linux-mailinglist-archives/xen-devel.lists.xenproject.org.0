Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C314B43E388
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 16:24:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218094.378397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Jj-0000Wk-Uy; Thu, 28 Oct 2021 14:23:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218094.378397; Thu, 28 Oct 2021 14:23:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg6Jj-0000Uc-Rt; Thu, 28 Oct 2021 14:23:43 +0000
Received: by outflank-mailman (input) for mailman id 218094;
 Thu, 28 Oct 2021 14:23:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg6Ji-0000UW-Bf
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 14:23:42 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a5d64c3a-37fa-11ec-84a3-12813bfff9fa;
 Thu, 28 Oct 2021 14:23:41 +0000 (UTC)
Received: from pps.filterd (m0174683.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 19SEHGq7002155;
 Thu, 28 Oct 2021 14:23:38 GMT
Received: from eur01-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bywg5814q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 14:23:37 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by VI1PR0302MB3373.eurprd03.prod.outlook.com (2603:10a6:803:1b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Thu, 28 Oct
 2021 14:23:34 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 14:23:34 +0000
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
X-Inumbo-ID: a5d64c3a-37fa-11ec-84a3-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TEir9NWfKblRGXYVjYlpc0OhReNpN2UHuyokMe7QHWMi1pzPQTV8CDES2lkr2s5sQwHKKSUUbE3KnzFBdTUa1lCIy/wtSrljofFFE1OZgA7G7dpauOafoqJ7MIpB7Hqk9JrIJKTpU17e9Fe9NBR8Xj37H8FhfSUzMyI3TOrjB1T5sgQilV6emC6YRpwjjlWkQTfQ6q/vqPYiLQP7nxSd/T1S2pFMfurPmzai3HLyYDH3GDN/NaqZOmx78cleiqtuoubj4A8j18QG14Dx7x3fCLBfGnapBQbAF027/Nc2rYnsKh2OOST1ZvvtZdB+ntk4jJ7ldw/Fqfj7+Pu9rcd/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kYDrEAGhyYGrBHM0aibwdt4pNQYhXuWYdvWT8+9790=;
 b=Xz6yKz0uakoc48H0DVXVDQNa/9vKSd8fwZZt+7C84NZpfzy8shNOqy7VWcCs01cK5dY3s/EZ0GTTR+CPpUFoHxWyJ+lt/K3oK6UNYNnyGhzJurRS0IPUoIONu7fIgkkthgu/OUv1+kDd2yvXfXcHh01kHdDlWqwEY9VlDYLr9hlqwvIY1ZubjuUY4/9aITPK27010OdVYnKoguznd540aZA+Wwfoxd4rmaJgU7ccissWrIw/RawLO3fqa2qxVzxTpr1cZk7PV81PS8tZrhgtp0TxkY+ALlKLo6jZEt4sMb5FnTRgn8tz3NRzBRG4Za5ExI4teCazgJ0JqLCoHhwVeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kYDrEAGhyYGrBHM0aibwdt4pNQYhXuWYdvWT8+9790=;
 b=ZQnGE9NzmdDHuKpqkKO+7LkGD5wFQo81s5q3j1veYk3trWfb5SCHri3ToDYjHbOCD2yxppaCCSpczlFd53rkNz1RTm9zJEkT1eiOfyB3kwF9v2BtwBdhzFSdANFl1O35p6K2d5KeFgGufp5/8ZmvrrY9yBehAG+UAjdKibleZB/A0kDGLhKz5tevwKPmPXRDkjQSFAQscU8eZC7xFNHMKJDl8WLqehWvGZR6KYmV2MMk5z3jVveso+xzdfqANHJW1zvw0o8ZgC2j2CXUHGHWMJKlirL2X00WMT2MYZJiWHuIdkStkA1whc0cyklrSyh5kHNg00+unYxhBlMkJvQ/wQ==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "sstabellini@kernel.org"
	<sstabellini@kernel.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Topic: [PATCH] xen/arm: fix SBDF calculation for vPCI MMIO handlers
Thread-Index: AQHXyww6rKHs3LJru0q52eLUia+oNavnHBIAgAE3H4CAABhAgIAADTsA
Date: Thu, 28 Oct 2021 14:23:34 +0000
Message-ID: <3206478e-f230-cd91-5de9-85ef6c251405@epam.com>
References: <20211027082533.1406015-1-andr2000@gmail.com>
 <cb7e9ef7-476e-93c3-d3c9-9a9ebc61003d@xen.org>
 <d63c6e0b-8aa3-9ba3-893c-5e464638a8db@epam.com>
 <YXqnS7iZUvokJby6@Air-de-Roger>
In-Reply-To: <YXqnS7iZUvokJby6@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7800bbb-ad77-4965-3d01-08d99a1e8647
x-ms-traffictypediagnostic: VI1PR0302MB3373:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <VI1PR0302MB33739C3D566AF30FB4447818E7869@VI1PR0302MB3373.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 5enHst3tv3bs64w+ywvsuZu2aTDUR4PElTXDCst6m0h4jjiWDSdcQiTzu9BHSduphe9toUzxfafE7KettBFmN+4qdWmPwhbxd55BhwrxDf2TTvZt7w/0dOes4omGmGnrqBBoWrhVJOlWDn/2hezhvvlgnNhdkEac3kfjGSSNzp9zUNbGZSlTR5RDGgZiX/42geLu2AapybkTKuug/qiYdcNrfXZ6+LZErFKfc6Fj6xVDj6z/yjczBazUUJiKFyi84pd0zKSPKuh+JzUSEoihtLHpON38XeJuOhMAO9qLJuZ1GJeJUdoSB/fxatatqb1VuDzHccInfypjQwU38+hESryFdD4tygXed2BIbxy7pIm1nVVKctF8yZ+8tf21KYEtM+URQqKP5rU211HK+y/Ts0GmVU+1yOO/uj/4/3GYf8dSP43A1f/IvWCG4GZPOgz3JIceeL10R0Jaw630/BhZrBGuNsvbwt/E6/1l/sLyQgZk6odnPYlXQMGaLH0vbA5jCX89VmZoxP28XYZntWLB17niWm066IswHBR1JY4aE8NSz1LtQIUTBC/z6hRiHLX01YK0Vm161wbS0iXIeZcBDN2X8fVEfxp7kM9LSPlT30GNq1GY0HKp3DopOnl4vfer6hTPip/Sx9SoK34aDtXRlDpBHKf1ziHtEdwmRukkSKoh3vSRZ9DQ82xyuXllezSezjpfcR0+sZ6MJ6+uoQPPIWfv6A0lbk0aOz6vg2Dt+XAlDAQDkhSqoXA8fMhZYpIe
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(36756003)(186003)(2906002)(53546011)(5660300002)(66446008)(6506007)(64756008)(4326008)(2616005)(31686004)(316002)(71200400001)(91956017)(66946007)(6512007)(38100700002)(54906003)(38070700005)(6486002)(6916009)(86362001)(83380400001)(31696002)(8676002)(66556008)(508600001)(76116006)(66476007)(8936002)(122000001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUxTd002WmhWTTZGbmRBb0hMY08rUFFSZGp1S090N0hBaWF2NEZGYm1pRitr?=
 =?utf-8?B?NTNJbGZ5VjRWUlhwM0YzMWtueVppU0hJT3B0dWdWbi9HUzNBZWdvbFlhcnR3?=
 =?utf-8?B?d0dVZWZTTUdnUzUyY3BuV0tLcUxOV3ZRQVdyUkNqR21VQVBoZlc2QUlQQVFK?=
 =?utf-8?B?OCt5QksvWlFKSFh5WVZlN1F0Qk51VE5WdXQ0UnFoblFPQndRRWRVeEd2bUxz?=
 =?utf-8?B?THlqbWtVWFRrRVJ6aW9KQzNvTnhjVUgrN0ZmQ1dQOXhURHYweFYrMnZkbGNr?=
 =?utf-8?B?RGc1ekl4OFRGUlBwb2luaGI4NE9odFlnMDNYVFBuWTVYQWFYS0tIS1lCNzZR?=
 =?utf-8?B?Q2VxKzZIU0lxQ1J1RTVlbzNGR1ZWTFJYcjM1cHB3SURPTzl6TWhIZUxaSzl5?=
 =?utf-8?B?S3NGTzBhMEl6N2F3RXN5SklGS1BJbXNsN0FBRjY5cFZHeTdwbWJFVGRQN3F6?=
 =?utf-8?B?VEJWQWVWM3BlcmRrRkd0eU1FSEpRY2RjcnUwUWNkSmI3QjVJWHA1ckE3bkRT?=
 =?utf-8?B?eXhtVW9hMWNTOGZaZHQ0RzRDUnVHQjU0aGRKMkZBOEtqcHJITkVQZHJkdktD?=
 =?utf-8?B?Rm01aUR2aGpJWURlVko1UDNzZXZNci9DUy9KTDM3QzRPTEQ5ZHh5K3NXdUpu?=
 =?utf-8?B?aUhPYkFUS2RRY1BJNklKcnI0WGZEVEtmWGdCNVZtUEVqNjNvWXArSGlnVXlD?=
 =?utf-8?B?NEdJM3Z6Mzl5MSthcXdNOVZKVnpiR3p3SXRyWThkOWlCUXREUkhxRm95SHVr?=
 =?utf-8?B?ejdTT0dYQ0VYZjdUQ0lhZnU1SE5TdEkyd1BoNEFGWFRQcWkwMzV5aGdoWHdi?=
 =?utf-8?B?aDBtZEdBNm5oU253bG5lSGJDN0VleW1HRXdzbUlzSmhvaVJHQ2s4U2MvM3ZV?=
 =?utf-8?B?MkhoOGdvZkF5NUt6T2lIcVhkTXJ4d1lCbjlvaXhvaDZoeTZPbjZwd1pqWEVo?=
 =?utf-8?B?aklaYjd6cERtL2pMQjJCUjB1bWxiYW9oa1R2YW5UaGRiOUQyN2VEckYxS3d5?=
 =?utf-8?B?MDlrQW5XMWNjWldjVEsrcTRpSjEzUUJyMklMOUFUQXRJNndmQTRaRDRzR3NE?=
 =?utf-8?B?ME9pUkZaU0NPTHdiQlVpR1RmemVCVmJHL1Y1b0RFMno5ZmFMSExYSjlaeWF6?=
 =?utf-8?B?YVRMd2Y1VGxjM21sUmF6b0ZVWFdpNlZrL1lWWi9Menh3cThwT3ZpTHZkYVcy?=
 =?utf-8?B?OFYvNzRIU2ZBMmc0OGcvazd0ZWd5NFh6eWF0QmYyVk1Bd05UVTB3TGZaOGFn?=
 =?utf-8?B?VXNONnFsaVRjV0tnTmVLd0JqY1YvNEdaMHlJdXg1UTFKMSsyVTVXMDJ1blgv?=
 =?utf-8?B?ZjRrQVpxd2IyREVBbGFxcWJKL0xmMzRNRTNyZVNpUUdtV0JaRFRsUWlRT3hm?=
 =?utf-8?B?TTdCZG9Wc0lPbHM4QWhROGFkSUc0S0ZXNWt1UnJWb05ibFMwejI3TURKaG1Y?=
 =?utf-8?B?Z0ZRQ2sxbXliOXYwb21kYzlod3ZVSGR3NDdHLy9aSGp0UVFUaUdRblgvZ1ZK?=
 =?utf-8?B?WTlBNW9WMjNNMkRwZnRicXpNR3BpcTFUaW9CZWNoSWlNeCszc2pmRHhDVENx?=
 =?utf-8?B?NWt6NWFKOGFjdFVGZDZkRUFYSTk4SEM5OXhjSXFmdnkzOHd2TmNzUGdERE9U?=
 =?utf-8?B?MDVPbUc1emdwK1pMVDBjamo3M3F4T0QwUGxNbWs1RmtkTE9sN2R5Z2pCdE1p?=
 =?utf-8?B?Y0dQUkJHZXVLL2JEbWg5ZkhnZjdaa3A5MWNJcEwzYzY2VnBDYjdXUUwrcWRE?=
 =?utf-8?B?TFlyd1pzRjg3ckIzeDVYY3ZjWlQ5NWhKZXFCSUthZTVSazR1Rkg4dnF1RnJ3?=
 =?utf-8?B?akM0L0FSTkNCSE1TY2tOdWR6ek9PanFIZ0daTWFTU2VBUE4wUU5tdEJmcU9v?=
 =?utf-8?B?MnR4dEJLYmdyTlNqQ0VBUmNnVmlZRDVkZnF4WTdpcGc0ejBFWVpuUjJmWU5y?=
 =?utf-8?B?eWVmeE9PazV1TGxsaWFoQndoMmRsT1l5bWxUTUcxd0JlRXJhZGp6dHRlYyt0?=
 =?utf-8?B?ZVA0TStPRHM0TUFhSEJXN1hNL0p5UjVTZjhEc0lMQ0UwRStycTRtdlppSXJo?=
 =?utf-8?B?bzRXbWgrNjRQNE1SOE9nM01xTloweXQrUjJCN0Q4SzB0UXBtcUFLTjBrTzA0?=
 =?utf-8?B?aUNxdE9RYk9oZDZSSnE0VzlpM1Y0Znd3VXZ6dDUzaDRmZTFMV3drYzQzSzgz?=
 =?utf-8?B?cEcrbVB2RkZ4R1p1QkU3UVFzUFFNM0JtQWV3VmZodHltU3U2cGVEVXdIWkpJ?=
 =?utf-8?B?Yi93R3AxVWNoVWR3YnpSemtKZkVBZlM3bnVnNDQ2RE42Njc3ejlCMisvMlNj?=
 =?utf-8?B?R2h2WTMyMFRNWnlHdTlYZEFwMUwzcUNzM05KWmJSbk9idWlsWjNYdz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <87D6C0FF8800884EAB3C1A7623A6CCE1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7800bbb-ad77-4965-3d01-08d99a1e8647
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 14:23:34.1052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVnVNwfgJbXUZHLjZ/9YfaFgL3T4z737Zvweczkc020A3hb73qc03kUq/Q2MIIUgggTey4ozs7TG/8huICHNGW4NU4Qcz/2JlFUp48PRPtnjEtNJO8CBjQkeSItU7lbJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0302MB3373
X-Proofpoint-GUID: UB78aQyipW525TRl38J8fSytqGzhiQQi
X-Proofpoint-ORIG-GUID: UB78aQyipW525TRl38J8fSytqGzhiQQi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_01,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2110280080

DQoNCk9uIDI4LjEwLjIxIDE2OjM2LCBSb2dlciBQYXUgTW9ubsOpIHdyb3RlOg0KPiBPbiBUaHUs
IE9jdCAyOCwgMjAyMSBhdCAxMjowOToyM1BNICswMDAwLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+IEhpLCBKdWxpZW4hDQo+Pg0KPj4gT24gMjcuMTAuMjEgMjA6MzUsIEp1bGll
biBHcmFsbCB3cm90ZToNCj4+PiBIaSBPbGVrc2FuZHIsDQo+Pj4NCj4+PiBPbiAyNy8xMC8yMDIx
IDA5OjI1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3Nh
bmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+
Pg0KPj4+PiBXaGlsZSBpbiB2UENJIE1NSU8gdHJhcCBoYW5kbGVycyBmb3IgdGhlIGd1ZXN0IFBD
SSBob3N0IGJyaWRnZSBpdCBpcyBub3QNCj4+Pj4gZW5vdWdoIGZvciBTQkRGIHRyYW5zbGF0aW9u
IHRvIHNpbXBseSBjYWxsIFZQQ0lfRUNBTV9CREYoaW5mby0+Z3BhKSBhcw0KPj4+PiB0aGUgYmFz
ZSBhZGRyZXNzIG1heSBub3QgYmUgYWxpZ25lZCBpbiB0aGUgd2F5IHRoYXQgdGhlIHRyYW5zbGF0
aW9uDQo+Pj4+IGFsd2F5cyB3b3JrLiBJZiBub3QgYWRqdXN0ZWQgd2l0aCByZXNwZWN0IHRvIHRo
ZSBiYXNlIGFkZHJlc3MgaXQgbWF5IG5vdCBiZQ0KPj4+PiBhYmxlIHRvIHByb3Blcmx5IGNvbnZl
cnQgU0JERiBhbmQgY3Jhc2hlczoNCj4+Pj4NCj4+Pj4gKFhFTikgdnBjaV9tbWlvX3JlYWQgMDAw
MDo2NToxYS4wIHJlZyA4YmMgZ3BhIGU2NWQwOGJjDQo+Pj4gSSBjYW4ndCBmaW5kIGEgcHJpbnRr
KCkgdGhhdCBtYXkgb3V0cHV0IHRoaXMgbWVzc2FnZS4gV2hlcmUgZG9lcyB0aGlzIGNvbWVzIGZy
b20/DQo+PiBUaGF0IHdhcyBhIGRlYnVnIHByaW50LiBJIHNob3VsZG4ndCBoYXZlIHVzZWQgdGhh
dCBpbiB0aGUgcGF0Y2ggZGVzY3JpcHRpb24sIGJ1dA0KPj4gcHJvYmFibHkgYWZ0ZXIgIi0tLSIg
dG8gYmV0dGVyIGV4cGxhaW4gd2hhdCdzIGhhcHBlbmluZw0KPj4+IEFueXdheSwgSUlVQyB0aGUg
Z3Vlc3QgcGh5c2ljYWwgYWRkcmVzcyBpcyAweGU2NWQwOGJjIHdoaWNoLCBpZiBJIGFtIG5vdCBt
aXN0YWtlbiwgZG9lc24ndCBiZWxvbmcgdG8gdGhlIHJhbmdlIGFkdmVydGlzZWQgZm9yIEdVRVNU
X1ZQQ0lfRUNBTS4NCj4+IFRoaXMgaXMgZnJvbSBkb20wIEkgYW0gd29ya2luZyBvbiBub3cuDQo+
Pj4gSU1ITywgdGhlIHN0YWNrIHRyYWNlIHNob3VsZCBjb21lIGZyb20gdXNwdHJlYW0gWGVuIG9y
IG5lZWQgc29tZSBpbmZvcm1hdGlvbiB0byBleHBsYWluIGhvdyB0aGlzIHdhcyByZXByb2R1Y2Vk
Lg0KPj4+DQo+Pj4+IChYRU4pIERhdGEgQWJvcnQgVHJhcC4gU3luZHJvbWU9MHg2DQo+Pj4+IChY
RU4pIFdhbGtpbmcgSHlwZXJ2aXNvciBWQSAweDQ2N2EyOGJjIG9uIENQVTAgdmlhIFRUQlIgMHgw
MDAwMDAwMDQ4MWQ1MDAwDQo+Pj4gSSBjYW4gdW5kZXJzdG5hZCB0aGF0IGlmIHdlIGRvbid0IHN1
YnN0cmFjdCBHVUVTVF9WUENJX0VDQU0sIHdlIHdvdWxkIChpbiB0aGVvcnkpIG5vdCBnZXQgdGhl
IGNvcnJlY3QgQkRGLiBCdXQuLi4gSSBkb24ndCB1bmRlcnN0YW5kIGhvdyB0aGlzIHdvdWxkIHJl
c3VsdCB0byBhIGRhdGEgYWJvcnQgaW4gdGhlIGh5cGVydmlzb3IuDQo+Pj4NCj4+PiBJbiBmYWN0
LCBJIHRoaW5rIHRoZSB2UENJIGNvZGUgc2hvdWxkIGJlIHJlc2lsaWVudCBlbm91Z2ggdG8gbm90
IGNyYXNoIGlmIHdlIHBhc3MgdGhlIHdyb25nIEJERi4NCj4+IFdlbGwsIHRoZXJlIGlzIG5vICg/
KSBlYXN5IHdheSB0byB2YWxpZGF0ZSBTQkRGLiBBbmQgdGhpcyBjb3VsZCBiZSBhIHByb2JsZW0g
aWYgd2UgaGF2ZSBhIG1pc2JlaGF2aW5nDQo+PiBndWVzdCB3aGljaCBtYXkgZm9yY2UgWGVuIHRv
IGFjY2VzcyB0aGUgbWVtb3J5IGJleW9uZCB0aGF0IG9mIFBDSSBob3N0IGJyaWRnZQ0KPiBIb3cg
Y291bGQgdGhhdCBiZT8gVGhlIEVDQU0gcmVnaW9uIGV4cG9zZWQgdG8gdGhlIGd1ZXN0IHlvdSBz
aG91bGQgYmUNCj4gdGhlIHNhbWUgYXMgdGhlIHBoeXNpY2FsIG9uZSBmb3IgZG9tMD8NCk9rLCBJ
IGhhdmUgYSBEZXNpZ253YXJlIFBDSSBoaXN0IHdoaWNoIGhhcyAyIEVDQU0gcmVnaW9ucyAoSSBh
bSBzdGFydGluZyB0bw0KaW1wbGVtZW50IHRoZSBkcml2ZXIgZm9yIGl0LCBzbyBJIGNhbiBiZSB3
cm9uZyBoZXJlKToNCi0gUm9vdCBDb21wbGV4IEVDQU0gYXJlYSAoImRiaSIpLCBpdCBpcyBzb21l
dGhpbmcgbGlrZSAweDMwMDAgYnl0ZXMgbG9uZw0KLSAiQ2xpZW50IiBFQ0FNIGFyZWEgKCJjb25m
aWciKQ0KU28gZnJvbSBEb20wIFBPViB3ZSBoYXZlIDIgRUNBTSByZWdpb25zIGFuZCBmb3IgdGhl
IGd1ZXN0DQp3ZSBhbHdheXMgZW11bGF0ZSBhIHNpbmdsZSBiaWcgcmVnaW9uOg0KLyoNCiDCoCog
MjU2IE1CIGlzIHJlc2VydmVkIGZvciBWUENJIGNvbmZpZ3VyYXRpb24gc3BhY2UgYmFzZWQgb24g
Y2FsY3VsYXRpb24NCiDCoCogMjU2IGJ1c2VzIHggMzIgZGV2aWNlcyB4IDggZnVuY3Rpb25zIHgg
NCBLQiA9IDI1NiBNQg0KIMKgKi8NCiNkZWZpbmUgR1VFU1RfVlBDSV9FQ0FNX0JBU0XCoMKgwqAg
eGVuX21rX3VsbG9uZygweDEwMDAwMDAwKQ0KI2RlZmluZSBHVUVTVF9WUENJX0VDQU1fU0laRcKg
wqDCoCB4ZW5fbWtfdWxsb25nKDB4MTAwMDAwMDApDQoNClNvLCB3ZSBoYXZlIHRoZSBiYXNlIGFk
ZHJlc3MgYW5kIHNpemUgb2YgdGhlIGVtdWxhdGVkIEVDQU0gc3BhY2UNCm5vdCBjb25uZWN0ZWQg
dG8gdGhlIHJlYWwgaG9zdCBicmlkZ2UNCj4NCj4gQW5kIGZvciBkb21VcyB5b3UgcmVhbGx5IG5l
ZWQgdG8gZml4IHZwY2lfe3JlYWQsd3JpdGV9IHRvIG5vdA0KPiBwYXNzdGhyb3VnaCBhY2Nlc3Nl
cyBub3QgZXhwbGljaXRseSBoYW5kbGVkLg0KRG8geW91IG1lYW4gdGhhdCB3ZSBuZWVkIHRvIHZh
bGlkYXRlIFNCREZzIHRoZXJlPw0KVGhpcyBjYW4gYmUgdHJpY2t5IGlmIHdlIGhhdmUgYSB1c2Ut
Y2FzZSB3aGVuIGEgUENJIGRldmljZSBiZWluZw0KcGFzc2VkIHRocm91Z2ggaWYgbm90IHB1dCBh
dCAwMDAwOjAwOjAuMCwgYnV0IHJlcXVlc3RlZCB0byBiZSwgZm9yDQpleGFtcGxlLCAwMDAwOjBk
OjAuMC4gU28sIHdlIG5lZWQgdG8gZ28gb3ZlciB0aGUgbGlzdCBvZiB2aXJ0dWFsDQpkZXZpY2Vz
IGFuZCBzZWUgaWYgU0JERiB0aGUgZ3Vlc3QgaXMgdHJ5aW5nIHRvIGFjY2VzcyBpcyBhIHZhbGlk
IFNCREYuDQpJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQo+DQo+Pj4gV2hlbiB0aGVyZSBpcyBhIGRh
dGEgYWJvcnQgaW4gWGVuLCB5b3Ugc2hvdWxkIGdldCBhIHN0YWNrIHRyYWNlIGZyb20gd2hlcmUg
dGhpcyBjb21lcyBmcm9tLiBDYW4geW91IHBhc3RlIGl0IGhlcmU/DQo+PiAoWEVOKSBEYXRhIEFi
b3J0IFRyYXAuIFN5bmRyb21lPTB4Ng0KPj4gKFhFTikgV2Fsa2luZyBIeXBlcnZpc29yIFZBIDB4
NDY3YTI4YmMgb24gQ1BVMCB2aWEgVFRCUiAweDAwMDAwMDAwNDgxZDUwMDANCj4+IChYRU4pIDBU
SFsweDBdID0gMHgwMDAwMDAwMDQ4MWQ0ZjdmDQo+PiAoWEVOKSAxU1RbMHgxXSA9IDB4MDAwMDAw
MDA0ODFkMmY3Zg0KPj4gKFhFTikgMk5EWzB4MzNdID0gMHgwMDAwMDAwMDAwMDAwMDAwDQo+PiAo
WEVOKSBDUFUwOiBVbmV4cGVjdGVkIFRyYXA6IERhdGEgQWJvcnQNCj4+IChYRU4pIC0tLS1bIFhl
bi00LjE2LXVuc3RhYmxlwqAgYXJtNjTCoCBkZWJ1Zz15wqAgTm90IHRhaW50ZWQgXS0tLS0NCj4+
IChYRU4pIENQVTrCoMKgwqAgMA0KPj4gKFhFTikgUEM6wqDCoMKgwqAgMDAwMDAwMDAwMDI2ZDNk
NCBwY2lfZ2VuZXJpY19jb25maWdfcmVhZCsweDg4LzB4OWMNCj4+IChYRU4pIExSOsKgwqDCoMKg
IDAwMDAwMDAwMDAyNmQzNmMNCj4+IChYRU4pIFNQOsKgwqDCoMKgIDAwMDA4MDAwN2ZmOTdjMDAN
Cj4+IChYRU4pIENQU1I6wqDCoCAwMDAwMDAwMDYwNDAwMjQ5IE1PREU6NjQtYml0IEVMMmggKEh5
cGVydmlzb3IsIGhhbmRsZXIpDQo+PiAoWEVOKcKgwqDCoMKgwqAgWDA6IDAwMDAwMDAwNDY3YTI4
YmPCoCBYMTogMDAwMDAwMDAwNjVkMDhiY8KgIFgyOiAwMDAwMDAwMDAwMDAwOGJjDQo+PiAoWEVO
KcKgwqDCoMKgwqAgWDM6IDAwMDAwMDAwMDAwMDAwMGPCoCBYNDogMDAwMDgwMDA3ZmZjNmZkMMKg
IFg1OiAwMDAwMDAwMDAwMDAwMDAwDQo+PiAoWEVOKcKgwqDCoMKgwqAgWDY6IDAwMDAwMDAwMDAw
MDAwMTTCoCBYNzogZmZmZjgwMDAxMWE1ODAwMMKgIFg4OiBmZmZmMDAwMDIyNWEwMzgwDQo+PiAo
WEVOKcKgwqDCoMKgwqAgWDk6IDAwMDAwMDAwMDAwMDAwMDAgWDEwOiAwMTAxMDEwMTAxMDEwMTAx
IFgxMTogMDAwMDAwMDAwMDAwMDAyOA0KPj4gKFhFTinCoMKgwqDCoCBYMTI6IDAxMDEwMTAxMDEw
MTAxMDEgWDEzOiAwMDAwMDAwMDAwMDAwMDIwIFgxNDogZmZmZmZmZmZmZmZmZmZmZg0KPj4gKFhF
TinCoMKgwqDCoCBYMTU6IDAwMDAwMDAwMDAwMDAwMDEgWDE2OiBmZmZmODAwMDEwZGE2NzA4IFgx
NzogMDAwMDAwMDAwMDAwMDAyMA0KPj4gKFhFTinCoMKgwqDCoCBYMTg6IDAwMDAwMDAwMDAwMDAw
MDIgWDE5OiAwMDAwMDAwMDAwMDAwMDA0IFgyMDogMDAwMDgwMDA3ZmY5N2M1Yw0KPj4gKFhFTinC
oMKgwqDCoCBYMjE6IDAwMDAwMDAwMDAwMDA4YmMgWDIyOiAwMDAwMDAwMDAwMDAwOGJjIFgyMzog
MDAwMDAwMDAwMDAwMDAwNA0KPj4gKFhFTinCoMKgwqDCoCBYMjQ6IDAwMDAwMDAwMDAwMDAwMDAg
WDI1OiAwMDAwMDAwMDAwMDAwOGJjIFgyNjogMDAwMDAwMDAwMDAwNjVkMA0KPj4gKFhFTinCoMKg
wqDCoCBYMjc6IDAwMDA4MDAwN2ZmYjkwMTAgWDI4OiAwMDAwMDAwMDAwMDAwMDAwwqAgRlA6IDAw
MDA4MDAwN2ZmOTdjMDANCj4+IChYRU4pDQo+PiAoWEVOKcKgwqAgVlRDUl9FTDI6IDAwMDAwMDAw
ODAwYTM1NTgNCj4+IChYRU4pwqAgVlRUQlJfRUwyOiAwMDAxMDAwMGJmZmJhMDAwDQo+PiAoWEVO
KQ0KPj4gKFhFTinCoCBTQ1RMUl9FTDI6IDAwMDAwMDAwMzBjZDE4M2QNCj4+IChYRU4pwqDCoMKg
IEhDUl9FTDI6IDAwMDAwMDAwODA3YzY2M2YNCj4+IChYRU4pwqAgVFRCUjBfRUwyOiAwMDAwMDAw
MDQ4MWQ1MDAwDQo+PiAoWEVOKQ0KPj4gKFhFTinCoMKgwqAgRVNSX0VMMjogMDAwMDAwMDA5NjAw
MDAwNg0KPj4gKFhFTinCoCBIUEZBUl9FTDI6IDAwMDAwMDAwMDBlNjVkMDANCj4+IChYRU4pwqDC
oMKgIEZBUl9FTDI6IDAwMDAwMDAwNDY3YTI4YmMNCj4+IChYRU4pDQo+PiBbc25pcF0NCj4+IChY
RU4pIFhlbiBjYWxsIHRyYWNlOg0KPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjZkM2Q0Pl0g
cGNpX2dlbmVyaWNfY29uZmlnX3JlYWQrMHg4OC8weDljIChQQykNCj4+IChYRU4pwqDCoMKgIFs8
MDAwMDAwMDAwMDI2ZDM2Yz5dIHBjaV9nZW5lcmljX2NvbmZpZ19yZWFkKzB4MjAvMHg5YyAoTFIp
DQo+PiAoWEVOKcKgwqDCoCBbPDAwMDAwMDAwMDAyNmQyYzg+XSBwY2ktYWNjZXNzLmMjcGNpX2Nv
bmZpZ19yZWFkKzB4NjAvMHg4NA0KPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjZkNGE4Pl0g
cGNpX2NvbmZfcmVhZDMyKzB4MTAvMHgxOA0KPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjRk
Y2Y4Pl0gdnBjaS5jI3ZwY2lfcmVhZF9odysweDQ4LzB4YjgNCj4+IChYRU4pwqDCoMKgIFs8MDAw
MDAwMDAwMDI0ZTNlND5dIHZwY2lfcmVhZCsweGFjLzB4MjRjDQo+PiAoWEVOKcKgwqDCoCBbPDAw
MDAwMDAwMDAyNGU5MzQ+XSB2cGNpX2VjYW1fcmVhZCsweDc4LzB4YTgNCj4+IChYRU4pwqDCoMKg
IFs8MDAwMDAwMDAwMDI2ZTM2OD5dIHZwY2kuYyN2cGNpX21taW9fcmVhZCsweDQ0LzB4N2MNCj4+
IChYRU4pwqDCoMKgIFs8MDAwMDAwMDAwMDI3NTA1ND5dIHRyeV9oYW5kbGVfbW1pbysweDFlYy8w
eDI2NA0KPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAwMDAwMjdlYTUwPl0gdHJhcHMuYyNkb190cmFw
X3N0YWdlMl9hYm9ydF9ndWVzdCsweDE4Yy8weDJkOA0KPj4gKFhFTinCoMKgwqAgWzwwMDAwMDAw
MDAwMjdmMDg4Pl0gZG9fdHJhcF9ndWVzdF9zeW5jKzB4ZjAvMHg2MTgNCj4+IChYRU4pwqDCoMKg
IFs8MDAwMDAwMDAwMDI2OWM1OD5dIGVudHJ5Lm8jZ3Vlc3Rfc3luY19zbG93cGF0aCsweGE0LzB4
ZDQNCj4+IChYRU4pDQo+PiAoWEVOKQ0KPj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKg0KPj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+PiAoWEVOKSBDUFUw
OiBVbmV4cGVjdGVkIFRyYXA6IERhdGEgQWJvcnQNCj4+IChYRU4pICoqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioNCj4gQXJlIHlvdSBleHBvc2luZyBhbiBFQ0FNIHJlZ2lv
biB0byB0aGUgZ3Vlc3QgYmlnZ2VyIHRoYW4gdGhlDQo+IHVuZGVybHlpbmcgb25lLCBhbmQgdGhh
dCdzIHdoeSB5b3UgZ2V0IGNyYXNoZXM/IChiZWNhdXNlIHlvdSBnZXQgb3V0IG9mDQo+IHRoZSBo
YXJkd2FyZSByYW5nZSkNClBsZWFzZSBzZWUgYWJvdmUNCj4gSSB3b3VsZCBhc3N1bWUgcGh5c2lj
YWwgYWNjZXNzZXMgdG8gdGhlIEVDQU0gYXJlYSByZXBvcnRlZCBieSB0aGUNCj4gaGFyZHdhcmUg
ZG9uJ3QgdHJpZ2dlciB0cmFwcz8NCk5vDQo+DQo+IFJvZ2VyLg0KVGhhbmsgeW91LA0KT2xla3Nh
bmRy

