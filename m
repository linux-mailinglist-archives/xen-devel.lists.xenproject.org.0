Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C536578C90
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 23:16:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.370123.601796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5u-0004VQ-78; Mon, 18 Jul 2022 21:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 370123.601796; Mon, 18 Jul 2022 21:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDY5t-0004Sq-VJ; Mon, 18 Jul 2022 21:15:57 +0000
Received: by outflank-mailman (input) for mailman id 370123;
 Mon, 18 Jul 2022 21:15:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e+2m=XX=epam.com=prvs=91983e950e=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1oDY5r-00043p-P7
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 21:15:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cebd73dc-06de-11ed-bd2d-47488cf2e6aa;
 Mon, 18 Jul 2022 23:15:54 +0200 (CEST)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IImA9P005163;
 Mon, 18 Jul 2022 21:15:44 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2051.outbound.protection.outlook.com [104.47.9.51])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3hcrm7v72d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Jul 2022 21:15:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by VI1PR03MB6288.eurprd03.prod.outlook.com (2603:10a6:800:134::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 21:15:40 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::3db3:dad:7bd7:4488%7]) with mapi id 15.20.5417.035; Mon, 18 Jul 2022
 21:15:39 +0000
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
X-Inumbo-ID: cebd73dc-06de-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OC9zgu3yqwZR5XqSIru2I3ga28LlND5uf5jXSAnCRzCJFYDyVVZwm8prB6ZS8poLcdcw9WhtwNASkm2BFJ3VFsStsgZWgR7kojTUt5wDFXVmTdRuUdo0LjeV0A8i/VhSLxO91fwZ8Q8FW70YV6CXSF6j/W1MD8fmR13fWzRNCShi/McHQdpr+knfv8p0SWr4ieIoNVkX3vmWq3QzI59Ej7SV/nDE6NI27zuAk+149WFFImSxmWxpe4fwRQ53jRLNKrGqHzbgj7QbTVEgsfQ2rqDQGATZWf9Ja2VYQCPVNWNg1BKnI6MWXjre/bwo9kDcV/ctc42z05rOxQF50gj/0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVMURCXF+8xKx1eYG9povulw9IOC6DKljZ6HILZCK2I=;
 b=DLCOVgrg+iBEuI5AMgjr4NTV6r4Sa25v2AEsYgSLBgbprOuWWvPGJazn7W+SXro2Qya67HG/BXgO6piK+IozL8RfG3AjqBEZwafihpDUHSq39Zdtrv28aDomKzy2AWJ+DmF2j3mSTFDLahaFh9B5leuJTxHgro9Os+eJtCU6Xc3dsBdDcDNg8+UEdOHYQhv4ESlI+41/6YjKJtU+YO4F7/aC85tfsMqGoFoBW4eT1zaSpWHEfzu4RoU5/UmHzx/fUNBxJiVJzy5L65NZjcsypaGlcxJDwn+1LsV0i3UH5AM9Kj5wem95/VOgYcRofrazbXCm7eezrWPGv3Q8By91Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DVMURCXF+8xKx1eYG9povulw9IOC6DKljZ6HILZCK2I=;
 b=dgsU0+VJRtS67V+Hxum6prE8spab9owJwsnedF11/kIgYs+OpEuJ40p47qZSqhD3m4+SG8d8j36qyMhYJemi1wnASBJZcNJGOJn1L2Vy3P1hFWLBmOHlbr/+MHRKohXpVFxMBb76rUpOBw8Lzh2k78Y4WdODW/G46chtTSCOFfnrEsXAe7BaYvGtc4mZVMTn17a4nweCjO/wucF8PRNuo5Z3TBZRrbeyo84Q38PeAtwzuNqMr14NT9hmMEWcJNLVRtzAii76nXpyfRYwTJM7YwkI5LwuYF1pX1nMSOE7d2vHNV4UWJxBDtbeUikBarJzPCjyQEtKMSzNtrt93VPwYA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Jan Beulich
	<jbeulich@suse.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
        Julien Grall
	<julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Paul Durrant
	<paul@xen.org>
Subject: [PATCH v2 0/4] vpci: first series in preparation for vpci on ARM
Thread-Topic: [PATCH v2 0/4] vpci: first series in preparation for vpci on ARM
Thread-Index: AQHYmuuIRfBsTERtW0qM5QZ/dvYwvw==
Date: Mon, 18 Jul 2022 21:15:39 +0000
Message-ID: <20220718211521.664729-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.36.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bde706c-97a2-4ebf-2c23-08da6902aa85
x-ms-traffictypediagnostic: VI1PR03MB6288:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 3Uv1IQnqx0q/urAbgCyi/uRhSnyqgnxp3So/01+8+Bl3+dL3eOlaxuw/OuoZ44EC1x4wmvI9kNw2aB6ybmIXrgNbDITddvwDPE+/6oJW8ZkVxDzUEoEtAlNqiM4nzgPMkJFZrd23MIxewUf2TYRglUd91q+wT0K1LSOTV1/uYvQusj/1A5FUPwVhHuCLASOIVrU9VVUMKkOaLBH+PFf60rt7n9/T/LJDrCpON/yJBi+u9jcq3Ono9PZCXnzmRXDf1tPTvYNAW4b8F3Es9GFhqy5UV1w1K3zzmTfoy7wvfj+lE0lmdaxCiX0w+WVU0K0XIt+wmsX+eeoUWT62uBtF+chir2Vx08vzQzYo/pxipYlzfbmBO65sJfR4e7wU/7R+GHC0xkVjpZY3GJz3Kjk9jDus221GCP59q+adON8BKwzOE0o+7ima81FtSejz+idnj3c7+brhkz/abfC+D1sAXRPf8aDotcfUkt+XoqKbk8kif3sxqVBOciFrrT/8s3USF5K+FzL5UAekIjzZZY+Pr531XbeI4gnQhl4udzNvBCcaFqx5Bs2DTzsRnvB5Sge97xMNCWdczGJctJiSa6RB3DKUG4RbAhxr67dF7I2t4jjp5+cd5onG5tpaxg0v+/cB4YnMLiA3QKia0sjlUn2IZurqhzB8uOS73MLgIe6iveTud66M8N806QRr6LzfZQGj0LP9h0QWxzyFXR8QWXpKrzcueP6Rlu5bWWBPvz0Ynv+7ZXpW6j+YB58igyjvr7z3eP/jFskXYoA5QaF4vu1QuFk4biYiOjbyh3TcAGD0GZM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(2906002)(5660300002)(8936002)(36756003)(186003)(4326008)(86362001)(91956017)(64756008)(66946007)(66556008)(8676002)(66446008)(66476007)(76116006)(122000001)(6506007)(478600001)(316002)(2616005)(6512007)(6916009)(26005)(54906003)(6486002)(55236004)(1076003)(41300700001)(38070700005)(83380400001)(38100700002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?NmlBejc1OHdFVmR0a1loT1pvYVBUbFExcE1DbkhlRktXcFNsMVd1eDVwUU9i?=
 =?utf-8?B?dGUwc0dmekcraEtRK1M2dVBURnJSVkNzRjhjM1V0bGk5UHNsekJGRUxoMEU1?=
 =?utf-8?B?RG5BR0U4N3JLOGNRc3hTbGVCay9xYjYyaHVLaXpsRmdiTE9aTmEvaFBGUVJX?=
 =?utf-8?B?eVdYanBQMnErN0U3Y1lkWGR2YlI2NVhmVlpoSmxKM01seTMwcHdRVXlHcWhG?=
 =?utf-8?B?NG5PNzF0dmQrRzNzOXdlRjJPZVpkajJ6clJMMGE3ak52Mm9kM0JHbkx4cVJp?=
 =?utf-8?B?RWRuYUk2QjhJSVdWREtmcnAzMm1oSm4yYVR2WVlnQURhbGpHa3FEVEQrZHhF?=
 =?utf-8?B?Q0l0QStGZWdiaXduSVdOWHMxdVF0UlgyQTZpazV6VDUrTmlVMUZCTXV4RUk1?=
 =?utf-8?B?SkZnSGFPN1N4YlNYamgvQlk3WmZSZXEzSDc4MGNZLzJpYVNGU01pRDZKWkJk?=
 =?utf-8?B?VEJoTTdXU0lOVEYyZnJ1UTNqdDIweExrZWlYOWhFM2liZW1OME00RFJxd3No?=
 =?utf-8?B?UEluTWloVURBS21JbTlMR1dkNDc5Z29SNVFBYXhhZ3lkTHEwZ3YxUE40T2Vv?=
 =?utf-8?B?bnh4OXpxRUhRNkk0ZFRsbDlPZ2ozSUVqbXVYZjdCU0RGTzQ1bXAyOWRtTnVM?=
 =?utf-8?B?VUJMOFlneE0rTHBmQ3hnUi9nSE5LREVYNU53MWhqVG5XQTBkRGcyZlBxRDJB?=
 =?utf-8?B?eWVBYThNWnJFZ3NaMDlkWXRhRDAvSUpJb2Z6bmxkdXduT2VLQTh5MnJ6SUlr?=
 =?utf-8?B?MDhMeVg3NTZDcFI0QmxncGdIbnZ2Z2FVNENjS1oxMHZIL1FiTytWUjVNUktI?=
 =?utf-8?B?dDl4U2JSY0JWNnJteDRMbWltdHlkZlRSLzJlMFBsV0RsRnQ1MzJHYUJTL0dj?=
 =?utf-8?B?QXp5bm52YXhFQ2RoMDZXRTY1SzltbHdsUUs1T1g5Z3RzanJQb3BLMkJVTGpK?=
 =?utf-8?B?bnd0MUpSdnByVk1Kc0pGQnFDVFZQMjJkUFNvMUNsYjJGMnhtbGxTRURjOSsx?=
 =?utf-8?B?OEFCOS9NWm1WenlFTCtUa1dxWUgva1NqOEpob0NCcGhwRWxNSXdwZlBRN0I1?=
 =?utf-8?B?eHlMaWxhaGJkZ3Jrc0VMamIxMWhnZEF5SFlkSWI3c0UzY3lqcWkzdzlKZHFF?=
 =?utf-8?B?eCt0ZzgvZ3Fwa3QzN0pQSFJhZThtZWVaMlRQK1MxK1pMczhsZzcvNlVnNnNh?=
 =?utf-8?B?UURUSFA3TW9TN0pXdXZaV0VFalE0LzdqTlU1endVOWw0N0QzTmt1eEUybkxs?=
 =?utf-8?B?YUdaNUdGMThRVHRIbGFxcnZDSHh3OC9PdG5ueVFtRjRGR1c1d3E4RDBGWFpm?=
 =?utf-8?B?VVd4OWJaWU15dEorejJpbmExUmJ2YUp3MmwremFYRjVVZ2N4OUN5SnJONUdx?=
 =?utf-8?B?L3NsZ3IxUjdXV3djTmFJVUYxU0VERmVnem83NE1ZQjZVSWxaTUpGMFBvYTVt?=
 =?utf-8?B?b1dzamFmcFRVNGpheG5LZ05sMmFiWHBHUVI1WnZrWG5tSlNrNWs3c0tLRlZs?=
 =?utf-8?B?Rjl0ellIa2ZKWm1JTzl2eWc0L2ZpbzZrekdyVHJhc09nL1BBanJ4Y3pKa1VM?=
 =?utf-8?B?M2F3TDU0MERvcVJDSDRGbHJYZzNxNzBodjE0WDhwcGprb0E5MVhPMEZYWndk?=
 =?utf-8?B?Yk9KbmRpdUFHYjNmLzVSWlRmTk1UWC9laWtCbG1jVzNIYnBla01nVEVseVZK?=
 =?utf-8?B?MUdYNWxqZTNuT2k4azhBQTJFbG4xVXVBamIrck1XV21PL3p2Q2wya1d2RWpm?=
 =?utf-8?B?WUdRUHFTTVd3SUJWdmIzZEhLeVNnU29qSURqNWZYNjNsM3pQZkpFbjBvdWxn?=
 =?utf-8?B?c3ZyWDFVKzRsZEtKRWJnNzgwY3IvUlNtZ0RmMlNRT1piVXpUUjY4ekxGTzla?=
 =?utf-8?B?N1BTdzF4djZFdkxrcjVMUUJZdUh5YjVjSnFEOHpaeS92V1I0Y2JiMS92QTBu?=
 =?utf-8?B?RmtKa1VFOUo0dnNOUXUvTkxBajI0amdpcjd4VDRzVGZiMHlReVpubVF0TU1X?=
 =?utf-8?B?cnZXekRXZ3hJM3I3dkpDczlSb2ozSzlUL3VNYVkvd1V3NDBmRmFZNElkSUty?=
 =?utf-8?B?UHBFYW9qYUxkWUtQRWptZkFLSmsrSjFheVNFMndPbkVPdTdoRCtFanlySWR0?=
 =?utf-8?B?cC9LamlURHI0U0JmVjYvckE1blJZc0lzU2IxZkF6TU9JTnF5b2tHWkZMVWpE?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D36BC37C79573542BBF84307160B11C1@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bde706c-97a2-4ebf-2c23-08da6902aa85
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2022 21:15:39.7895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9acEArmFjyJxWVHdbvKFkTMraVQNbpr7He9pt0h84Eh5cZahH3LE6xTdO+uOsWPUCZLiLS0nEYV4dWZewkNSrFJkhV6aS4ZcCe8LsdXHwo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6288
X-Proofpoint-GUID: qLpDHAfJOH0v4MFYAdU0qIyRr4MZd4Sw
X-Proofpoint-ORIG-GUID: qLpDHAfJOH0v4MFYAdU0qIyRr4MZd4Sw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=359 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180089

SGVsbG8gYWxsLA0KDQpXaGlsZSBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyBpcyBidXN5IHdpdGgg
bW9yZSBpbXBvcnRhbnQgbWF0dGVycywgSQ0Kd2FudCB0byBjb250aW51ZSBoaXMgd29yayBvbiBw
cmVwYXJpbmcgZGlmZmVyZW50IFhlbiBzdWJzeXN0ZW1zIHRvDQpzdXBwb3J0IFBDSSBvbiBBUk0g
cGxhdGZvcm0uDQoNClRoaXMgcGF0Y2ggc2VyaWVzIGFyZSBtb3N0bHkgZm9jdXNlZCBvbiBuZXh0
IHRha2Ugb2YgUENJIGxvY2tpbmcNCnJld29yay4gSXQgaW50cm9kdWNlcyByZWVudHJhbnQgcmVh
ZC93cml0ZSBsb2NraW5nIG1lY2hhbmlzbSBmb3INCnBjaWRldnMsIHdoaWNoIHdpbGwgYmUgaW1t
ZWRpYXRlbGx5IHVzZWQgdG8gZGVjb3VwbGUgcmVhZGVycyBhbmQNCndyaXRlcnMgaW4gdGhlIFBD
SSBjb2RlLiBUaGVyZSBhcmUgYWxzbyBzb21lIG1pbm9yIGNoYW5nZXMgdG8gYQ0KcmVsYXRlZCB2
cGNpIGNvZGUuDQoNCk9sZWtzYW5kciBBbmRydXNoY2hlbmtvICgzKToNCiAgcGNpOiBhZGQgcnds
b2NrIHRvIHBjaWRldnNfbG9jayBtYWNoaW5lcnkNCiAgdnBjaTogcmVzdHJpY3QgdW5oYW5kbGVk
IHJlYWQvd3JpdGUgb3BlcmF0aW9ucyBmb3IgZ3Vlc3RzDQogIHZwY2k6IHVzZSBwY2lkZXZzIGxv
Y2tpbmcgdG8gcHJvdGVjdCBNTUlPIGhhbmRsZXJzDQoNClZvbG9keW15ciBCYWJjaHVrICgxKToN
CiAgdnBjaTogaW5jbHVkZSB4ZW4vdm1hcC5oIHRvIGZpeCBidWlsZCBvbiBBUk0NCg0KIHhlbi9h
cmNoL3g4Ni9odm0vdm1zaS5jICAgICAgIHwgNDYgKysrKysrKysrKysrKysrKystLS0tLS0tLQ0K
IHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAgICAgIHwgIDggKystLS0NCiB4ZW4vYXJjaC94ODYv
bXNpLmMgICAgICAgICAgICB8IDE2ICsrKystLS0tLQ0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdo
L3BjaS5jIHwgNjUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0NCiB4ZW4vZHJp
dmVycy92cGNpL2hlYWRlci5jICAgICB8IDI0ICsrKysrKysrKysrLS0NCiB4ZW4vZHJpdmVycy92
cGNpL21zaS5jICAgICAgICB8IDIxICsrKysrKystLS0tDQogeGVuL2RyaXZlcnMvdnBjaS9tc2l4
LmMgICAgICAgfCA1NSArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KIHhlbi9kcml2ZXJz
L3ZwY2kvdnBjaS5jICAgICAgIHwgMjkgKysrKysrKysrKysrKy0tLQ0KIHhlbi9pbmNsdWRlL3hl
bi9wY2kuaCAgICAgICAgIHwgMTEgKysrKystDQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAg
ICAgfCAgMiArLQ0KIDEwIGZpbGVzIGNoYW5nZWQsIDIyMyBpbnNlcnRpb25zKCspLCA1NCBkZWxl
dGlvbnMoLSkNCg0KLS0gDQoyLjM2LjENCg==

