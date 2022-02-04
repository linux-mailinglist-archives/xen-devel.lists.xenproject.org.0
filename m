Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A714A9980
	for <lists+xen-devel@lfdr.de>; Fri,  4 Feb 2022 13:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.265486.458865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy5r-0000cH-FJ; Fri, 04 Feb 2022 12:53:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 265486.458865; Fri, 04 Feb 2022 12:53:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFy5r-0000aG-Bo; Fri, 04 Feb 2022 12:53:39 +0000
Received: by outflank-mailman (input) for mailman id 265486;
 Fri, 04 Feb 2022 12:53:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u+82=ST=epam.com=prvs=4034f0a382=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFy5p-0000aA-ME
 for xen-devel@lists.xenproject.org; Fri, 04 Feb 2022 12:53:37 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76c26f98-85b9-11ec-8f75-fffcc8bd4f1a;
 Fri, 04 Feb 2022 13:53:36 +0100 (CET)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 214C38KL006867;
 Fri, 4 Feb 2022 12:53:25 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3e11uerm5b-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Feb 2022 12:53:25 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by DB6PR0301MB2424.eurprd03.prod.outlook.com (2603:10a6:4:5c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Fri, 4 Feb
 2022 12:53:20 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.014; Fri, 4 Feb 2022
 12:53:20 +0000
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
X-Inumbo-ID: 76c26f98-85b9-11ec-8f75-fffcc8bd4f1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuNrJNHgPFLXCUcSd9mLdWVmF6w+49ETHKJEeVyR/bMKaYqnmkLjQdDioyZ9jKDj7/Rvqm9VABFBHXIQjKw1W7heuj98jxlGU+KVKJJTbLzOwasLJKNqe99M9I86wbIBgUAyzkzrvT5cFx+zg1HBr94CnG0RIGFNgSswJF/R911GI/YofnV8Swrt+Z+IlVNMQZ6CvyD74e+oNRNTPOevZuMn0uLcbuvHWgSNlK6bJriJY3l6yZTX8cBc5+y94u+BlZxEGejgFNcQt9QSzG3/1guoEgLYRshQAf4lhETQI+kPdPmpTa5B39aSLSb/coChMCK9x4YOSsewJeW5ii2d/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0CCuKhAuAIHCEyGTt3dgFlQdZ0wyy/ycwvxOjGJv6J8=;
 b=Z+0jKcAxSF88SSFgg94Hb0h3LsOkoBVtCqY+UelPzHY5GLBFWWoA7pI7G34d4Kmpsn3vU68cwsZ1Cf9mqXdeGW7DnlWwpZH+fu42wGMQdR3N1aO1PO0vkidTi/KPFe/7OCjrE9UjgPIifeStoH8Nf5RYghZzKkKUFpnCLAQWn6Nu8wq8Js6IwGrl47GFzU4yc+nhAi5m76uHMKU/IDfu1qI/SNpKz8S7fYx0fChmIS23iiYnAa2u1niqDF0MF67Io3YKgUlZ1SU/lJKB8/ygQ4LJtIMZzEUHPud/S2yketVnFHwhKteIcBSxTvVxPI2pAWZnkSHmeNDNOjI1/uWNTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0CCuKhAuAIHCEyGTt3dgFlQdZ0wyy/ycwvxOjGJv6J8=;
 b=i+iwrX4ZG03GCAvD0vjA2elka6xcxcl3a/bE9qfgCrG15Wih5lkraQ2pMOt9LPp9+3dZu5hXPF3Y28eNHlfpErov4JPxe+5AObK7ijgFaTHRowsm5E5ZU4f01tpUwcvjfpwScJ41HxP75nfhLpiuhFg5fcCkl1mvCqGi6YyPly+xZC4Y8R/Y0PxK0PPw5Cp6E6laGU+J/ditghIN4wPPBBUUnNXwGtsCx5udlkIyJERv5kyIIxgJUS6a4gHUh4020WCB3WqofILpPFo3SwQYrRFHgdwV4CJMrmFK7eVjTGkVBzEcHzpwXsnSdNOpzGIq2XRHJ3ZVVOFNmntO41FFNw==
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
Subject: Re: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Topic: [PATCH v6 03/13] vpci: move lock outside of struct vpci
Thread-Index: 
 AQHYGZFc/MnzQOjwVEeBBUHLSW0md6yDBUkAgAASSACAAATYAIAAD/WAgAAKNgCAAAbfgIAABnuAgAAQvgCAAAMCAIAAAY4A
Date: Fri, 4 Feb 2022 12:53:20 +0000
Message-ID: <deef8468-d607-e49e-f456-6a8013329ca1@epam.com>
References: <20220204063459.680961-1-andr2000@gmail.com>
 <20220204063459.680961-4-andr2000@gmail.com>
 <7209889d-8f17-61cc-72a4-97f6dbc1d54d@suse.com>
 <2cf022f8-b000-11b7-c6b9-90a56bc6e2ea@epam.com>
 <04726915-f39f-9019-436e-4399533c9fc3@suse.com>
 <9ed3f4ac-0a2d-ed45-9872-7c3f356a469e@epam.com>
 <c3a99712-cf7c-37da-aac1-f2ee00e6d53b@suse.com>
 <Yf0KcVD8W05A4fbB@Air-de-Roger>
 <1ed0e342-16cd-2f16-c05c-186667a22762@suse.com>
 <7e3562b5-fc67-f213-e872-f211450d9e2e@epam.com>
 <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
In-Reply-To: <a8fc599c-f620-c4d1-2077-c57068f46a7f@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dff7d1e4-e51c-495b-b04b-08d9e7dd528f
x-ms-traffictypediagnostic: DB6PR0301MB2424:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <DB6PR0301MB24245CB9CFADD09F05B8F7E1E7299@DB6PR0301MB2424.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nXYZ6na4aL8rL5TM349n1Mr0GSgfoQ45ltO6mRYS1PF6AmaGs9i7ahj4PzZQ840cYjP/9ck9xixS+jzsmw+py2DYkvudghQmTemDzj1iPaBAjjClJBVKSkHotJh49brzM7lI7LzdW4mAbIiiHOjdoQB1+lCndhKUXeCCJQa6ewBa4fWm5vozr1SCZFqrAX+7RqUY9avi4YvmsG1awQJEW4Gri/1I9LC6KQMLWOj5X6iOac+SxFCB0aTBDQR/cbNXOa0787y1qdK94hF6j5o2H2gldmOZF/pHMOXAolzLtCgfS6LLmTU2mPRaekmgrCoHt382nXCQKIlWVtNSRbiLEVoahAl0ubNIvHQafr9NOgpr6cv5/jy2Z27xVVPjtpmlDI70xjWiL64XqN2cJLnI422IMQ40za9ECsBMEchLe/tfkuHe9znb0cf7xnLj5Hx5DeJ1jdTxTBCdPI3TApO8prhlq1UWBLctzkBO4qB/3kBWCtwOeJW2BFLE+ZBZS0MdABvjfGfhbpTKIfMrrr3xp/nvIUnfRa3HeHsRWRffKjwQkTzcivq3HziM+U27sK97iDTrU7j9ItW+b96t6OSpLZYCZxc/j/RhDIoMOMnn2bbfChKdrHmIof9AbBiZRXf0HXkxzQi1OPzMqWF+pVPTmyLsfq+ZoUD3t7M7LqGwqevOCNYPrENZvDc+gZe2wYFMj1KFEAK+/aMK9lMIHyK5hH7iEQvoebyZ1c+ieARGG+uIak2Iv75WQFNYD3E4SKpo
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(122000001)(6506007)(53546011)(31696002)(6916009)(316002)(38100700002)(6486002)(86362001)(54906003)(6512007)(8676002)(66446008)(83380400001)(91956017)(4326008)(31686004)(66476007)(7416002)(5660300002)(508600001)(186003)(2616005)(2906002)(36756003)(66946007)(38070700005)(71200400001)(8936002)(76116006)(66556008)(64756008)(26005)(107886003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eFdpUVZFREZZQnRqSS8xeElURFo2REkrYnJTNWJmUmdUVDJlcG1xQVN1VG9T?=
 =?utf-8?B?UVRoYUpIdkFCNm9JdXoxSWFPY2U1YlpmTmh5UE5ORzVPZG9lN2c0c1V5M1M0?=
 =?utf-8?B?MjBBb2h5MmNicjlWN0k2NGpPMzVUK04zeDU3RkdrOFFpYldtRmtZaDlmMTdw?=
 =?utf-8?B?dlRRM1FMSVVLRUYxRHBUU280YWFKREkyLzZvdER5Z0E5eUV3Z2p1RFhlOFZH?=
 =?utf-8?B?SWpORVNHYVRRWWF2VVZaR01KdjRKWUZHckhrWEFnVC9PTnZKQlRURGJqS3ZC?=
 =?utf-8?B?dUhrTm9sRjN6YmZwdmdoL0d0MnVuYVlYc05zbHdDM3ZQUmoxVDNYWk5peDZy?=
 =?utf-8?B?NDhvQnhJTmNXZ1VZRUNJRk5JNjZGT2xsb0VaeTNlQTM2MEYyL0p1Tm0zNDR3?=
 =?utf-8?B?ekRyZGFOajhOT0h6THpVTVBqcHBkNEVERlluTkdVNytEbjdxTDhxWjNaTnps?=
 =?utf-8?B?WC9ueGNFZFpFTjBpR3BrejBVcGZjZzNhTkFRQjI5R21kT08zdEFQcTJJOGRK?=
 =?utf-8?B?NnNZV3pSYXZpTXNBcEFyemZuenlvOXFmTEg1c3EwNGI3RlRIdTZNYVBSejk3?=
 =?utf-8?B?cW1CRlB3bTAyMmp6dHBGR29RYjh2cTZhajNyU2Y4Yy9KdUk2a05XamRDeFZV?=
 =?utf-8?B?OEtoTjVKMmExK0ZHVmJ1dGZNb2MvRVhyOWZES04xbVhtSDg1dXZ3L0JiSE5Y?=
 =?utf-8?B?cFFXT081NHp3UTNYZXFtNHlsdnV3dE9wTjJGWGZJM0FKa01XbnF0eVFTMmVS?=
 =?utf-8?B?MGo2UlF3a2k5KzhBVDV2c1VkZWFyWElId2MrbDlZWWdPUkJmUVdqT2dXOEpJ?=
 =?utf-8?B?dkg4TG5wQXhTQWhramNJcTk4Q2xENzhNYVY1VHdJbjRCSlkxTFFndmREUk1P?=
 =?utf-8?B?OSs4OWFNSmlhMXZ4RXZISmR2TUVUS3cwQ0p1Yml3ck9wblNhaDRPL1NRL0xk?=
 =?utf-8?B?SWhxNEJ3YWpNMEdEU1BnZGxIMk1Tbm5EdzRBTmRrN2VKTzFBd2hOd1ptMUo5?=
 =?utf-8?B?RGlJQklFVCtBL1cxMzR5WTRlRUpGdXRDOE1IR202WXNTZ3JoYlUzNlZSbWNh?=
 =?utf-8?B?bmtmWmxvTGVHRnZjK3FFRE9UNkQ5N0E5ZEk0NENhQmF3V3F2MDFVeEErMkpE?=
 =?utf-8?B?Y3VZSVRoUW9wT2hBNUYrS2JEV0lEL3FiTzdWYVBhdkVTT3ExU0huV21HTzFW?=
 =?utf-8?B?V2h3bHNmc0dFamQ0aE1nY3dwbkl4cmF4TmoyZ1VvMFhsMEhqbjBGUTFmOCt4?=
 =?utf-8?B?ckNHc2J0L3FvTWZmWmRCR25wSTBXaVBmK2ZOOG5LWFAwWjF5VmJqNmpiNERT?=
 =?utf-8?B?MVhlR21qdTkvdmlQWGFaYWxQV0hQcGVndnhSb1JBbEpvQUsrZE5XbXVMVllt?=
 =?utf-8?B?NHFjRHB6YnhQUEM5bEFYbTNiZFBldGk5R2Jia0FKZ2lJSzNRMlM5SUZMV0Np?=
 =?utf-8?B?OUtBWkgyUmxocWkwOWcycEF5aEhiWGlkUEJXdGZuTnZlU2h5b1UvenppWTdQ?=
 =?utf-8?B?aXBwR2VMM2hyU29UT0VScW5FVU9lSS9XNUxsS3d3Si9WL3l4K1YrbGRRdXhy?=
 =?utf-8?B?dUdFMVRrQ0Q2Ym1JSDUyVTlkUjVha0xteE4wVzYrbzZ0L1lNc2hyUDAxM1hN?=
 =?utf-8?B?MDArUWUyNzh3RUVlR2tWNGRFQ0xacFJlakVZUFVid1pLRFlrNXpNenVBK2RV?=
 =?utf-8?B?WXdIaWJNK0F4MEdRN2JJSEJrK0U4T0c0amFKYW1BOXZJRWVEMUdDNnIvUS9y?=
 =?utf-8?B?aWhZM3JiWHB4bjNESUVUTmFOOURjTlNVbTdBSWFEMStweVovOWlJMWtRUUEx?=
 =?utf-8?B?aEF4cURHUHVpZWFiNXlGVnFZamlpS0ZOSE1qeDBETE82WHZnSzhyVjdOVXFv?=
 =?utf-8?B?VVVQbGxpUWVvZ0dwQzVYbjJudTRwNm1oa1BjbzZldm1KWkYycVNjbk9pWDNP?=
 =?utf-8?B?RWRDQ09namZ0QlFYR1FUREZQUkJSdERwOWFvQU5Wc3RpaHFDdDZrVVZ2TE5U?=
 =?utf-8?B?ajNUV3ptTWJoNVZXOUFic3NPb2xncWU1d2tpc1pma211UDhUNEJpenZPelhy?=
 =?utf-8?B?eEpNSzlQRlNqWHlxL0dDd25OcUtSaU5iem5xd3A0SExOc1pITC9VUUozY0ww?=
 =?utf-8?B?bFpIclNxdXBlaFdqakdkQ3Vrdlg0Q2xpbnNHTVNZUGhHTnl1TDgwZlpCa0V5?=
 =?utf-8?B?VFhDVWJEYncxaitqMFRFbnZtUkdqWFpSTDBySnB4ZHpkdFY2OUN2andoVWRB?=
 =?utf-8?B?TnN4V256YTRDTFlicE9CUXBFK2tQNlVMWjJyVFhzUWRnTVBwY04wbmt2T1lK?=
 =?utf-8?B?bHhWcDloNjE2RDVYMnlaWEJUNDFqTm5KL1h6WkhXeVpPU1RnL2xGZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B4DABAA8BFB6D041AC394D88B6D00C9A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dff7d1e4-e51c-495b-b04b-08d9e7dd528f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2022 12:53:20.7636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H3f1hF2mPS2wg0EoIwb7uKZtl49pDiRYuuQZjiFTaIIUjabe9Z24z8z8oIFPUyn6oobNJ5CJjPlyvAmYVjfV6aQ4NK8Zh6OSLVdoDuSziJKUqF0um/XhIJBTM2qHPKVK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0301MB2424
X-Proofpoint-ORIG-GUID: a5AFKxmkkcTIueAI6QRXv7nctyED5BvO
X-Proofpoint-GUID: a5AFKxmkkcTIueAI6QRXv7nctyED5BvO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_04,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 mlxscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202040072

DQoNCk9uIDA0LjAyLjIyIDE0OjQ3LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDQuMDIuMjAy
MiAxMzozNywgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pg0KPj4gT24gMDQuMDIu
MjIgMTM6MzcsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA0LjAyLjIwMjIgMTI6MTMsIFJv
Z2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+Pj4+IE9uIEZyaSwgRmViIDA0LCAyMDIyIGF0IDExOjQ5
OjE4QU0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDQuMDIuMjAyMiAxMTox
MiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMDQuMDIuMjIgMTE6
MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4+PiBPbiAwNC4wMi4yMDIyIDA5OjU4LCBPbGVr
c2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDA0LjAyLjIyIDA5OjUyLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+PiBPbiAwNC4wMi4yMDIyIDA3OjM0LCBPbGVrc2Fu
ZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4+Pj4+Pj4gQEAgLTI4NSw2ICsyODYsMTIgQEAg
c3RhdGljIGludCBtb2RpZnlfYmFycyhjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwgdWludDE2
X3QgY21kLCBib29sIHJvbV9vbmx5KQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+Pj4gICAgICANCj4+
Pj4+Pj4+Pj4gKyAgICAgICAgc3Bpbl9sb2NrKCZ0bXAtPnZwY2lfbG9jayk7DQo+Pj4+Pj4+Pj4+
ICsgICAgICAgIGlmICggIXRtcC0+dnBjaSApDQo+Pj4+Pj4+Pj4+ICsgICAgICAgIHsNCj4+Pj4+
Pj4+Pj4gKyAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZ0bXAtPnZwY2lfbG9jayk7DQo+Pj4+Pj4+
Pj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+Pj4+Pj4+Pj4gKyAgICAgICAgfQ0KPj4+Pj4+
Pj4+PiAgICAgICAgICAgICAgZm9yICggaSA9IDA7IGkgPCBBUlJBWV9TSVpFKHRtcC0+dnBjaS0+
aGVhZGVyLmJhcnMpOyBpKysgKQ0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgew0KPj4+Pj4+Pj4+
PiAgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCB2cGNpX2JhciAqYmFyID0gJnRtcC0+dnBj
aS0+aGVhZGVyLmJhcnNbaV07DQo+Pj4+Pj4+Pj4+IEBAIC0zMDMsMTIgKzMxMCwxNCBAQCBzdGF0
aWMgaW50IG1vZGlmeV9iYXJzKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCB1aW50MTZfdCBj
bWQsIGJvb2wgcm9tX29ubHkpDQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAgICAgcmMgPSByYW5n
ZXNldF9yZW1vdmVfcmFuZ2UobWVtLCBzdGFydCwgZW5kKTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAg
ICAgICAgICBpZiAoIHJjICkNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICB7DQo+Pj4+Pj4+
Pj4+ICsgICAgICAgICAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+dnBjaV9sb2NrKTsNCj4+Pj4+
Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgcHJpbnRrKFhFTkxPR19HX1dBUk5JTkcgIkZhaWxl
ZCB0byByZW1vdmUgWyVseCwgJWx4XTogJWRcbiIsDQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdGFydCwgZW5kLCByYyk7DQo+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgIHJhbmdlc2V0X2Rlc3Ryb3kobWVtKTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KPj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+
Pj4gICAgICAgICAgICAgIH0NCj4+Pj4+Pj4+Pj4gKyAgICAgICAgc3Bpbl91bmxvY2soJnRtcC0+
dnBjaV9sb2NrKTsNCj4+Pj4+Pj4+Pj4gICAgICAgICAgfQ0KPj4+Pj4+Pj4+IEF0IHRoZSBmaXJz
dCBnbGFuY2UgdGhpcyBzaW1wbHkgbG9va3MgbGlrZSBhbm90aGVyIHVuanVzdGlmaWVkIChpbiB0
aGUNCj4+Pj4+Pj4+PiBkZXNjcmlwdGlvbikgY2hhbmdlLCBhcyB5b3UncmUgbm90IGNvbnZlcnRp
bmcgYW55dGhpbmcgaGVyZSBidXQgeW91DQo+Pj4+Pj4+Pj4gYWN0dWFsbHkgYWRkIGxvY2tpbmcg
KGFuZCBJIHJlYWxpemUgdGhpcyB3YXMgdGhlcmUgYmVmb3JlLCBzbyBJJ20gc29ycnkNCj4+Pj4+
Pj4+PiBmb3Igbm90IHBvaW50aW5nIHRoaXMgb3V0IGVhcmxpZXIpLg0KPj4+Pj4+Pj4gV2VsbCwg
SSB0aG91Z2h0IHRoYXQgdGhlIGRlc2NyaXB0aW9uIGFscmVhZHkgaGFzICIuLi50aGUgbG9jayBj
YW4gYmUNCj4+Pj4+Pj4+IHVzZWQgKGFuZCBpbiBhIGZldyBjYXNlcyBpcyB1c2VkIHJpZ2h0IGF3
YXkpIHRvIGNoZWNrIHdoZXRoZXIgdnBjaQ0KPj4+Pj4+Pj4gaXMgcHJlc2VudCIgYW5kIHRoaXMg
aXMgZW5vdWdoIGZvciBzdWNoIHVzZXMgYXMgaGVyZS4NCj4+Pj4+Pj4+PiAgICAgIEJ1dCB0aGVu
IEkgd29uZGVyIHdoZXRoZXIgeW91DQo+Pj4+Pj4+Pj4gYWN0dWFsbHkgdGVzdGVkIHRoaXMsIHNp
bmNlIEkgY2FuJ3QgaGVscCBnZXR0aW5nIHRoZSBpbXByZXNzaW9uIHRoYXQNCj4+Pj4+Pj4+PiB5
b3UncmUgaW50cm9kdWNpbmcgYSBsaXZlLWxvY2s6IFRoZSBmdW5jdGlvbiBpcyBjYWxsZWQgZnJv
bSBjbWRfd3JpdGUoKQ0KPj4+Pj4+Pj4+IGFuZCByb21fd3JpdGUoKSwgd2hpY2ggaW4gdHVybiBh
cmUgY2FsbGVkIG91dCBvZiB2cGNpX3dyaXRlKCkuIFlldCB0aGF0DQo+Pj4+Pj4+Pj4gZnVuY3Rp
b24gYWxyZWFkeSBob2xkcyB0aGUgbG9jaywgYW5kIHRoZSBsb2NrIGlzIG5vdCAoY3VycmVudGx5
KQ0KPj4+Pj4+Pj4+IHJlY3Vyc2l2ZS4gKEZvciB0aGUgM3JkIGNhbGxlciBvZiB0aGUgZnVuY3Rp
b24gLSBpbml0X2JhcnMoKSAtIG90b2gNCj4+Pj4+Pj4+PiB0aGUgbG9ja2luZyBsb29rcyB0byBi
ZSBlbnRpcmVseSB1bm5lY2Vzc2FyeS4pDQo+Pj4+Pj4+PiBXZWxsLCB5b3UgYXJlIGNvcnJlY3Q6
IGlmIHRtcCAhPSBwZGV2IHRoZW4gaXQgaXMgY29ycmVjdCB0byBhY3F1aXJlDQo+Pj4+Pj4+PiB0
aGUgbG9jay4gQnV0IGlmIHRtcCA9PSBwZGV2IGFuZCByb21fb25seSA9PSB0cnVlDQo+Pj4+Pj4+
PiB0aGVuIHdlJ2xsIGRlYWRsb2NrLg0KPj4+Pj4+Pj4NCj4+Pj4+Pj4+IEl0IHNlZW1zIHdlIG5l
ZWQgdG8gaGF2ZSB0aGUgbG9ja2luZyBjb25kaXRpb25hbCwgZS5nLiBvbmx5IGxvY2sNCj4+Pj4+
Pj4+IGlmIHRtcCAhPSBwZGV2DQo+Pj4+Pj4+IFdoaWNoIHdpbGwgYWRkcmVzcyB0aGUgbGl2ZS1s
b2NrLCBidXQgaW50cm9kdWNlIEFCQkEgZGVhZGxvY2sgcG90ZW50aWFsDQo+Pj4+Pj4+IGJldHdl
ZW4gdGhlIHR3byBsb2Nrcy4NCj4+Pj4+PiBJIGFtIG5vdCBzdXJlIEkgY2FuIHN1Z2dlc3QgYSBi
ZXR0ZXIgc29sdXRpb24gaGVyZQ0KPj4+Pj4+IEBSb2dlciwgQEphbiwgY291bGQgeW91IHBsZWFz
ZSBoZWxwIGhlcmU/DQo+Pj4+PiBXZWxsLCBmaXJzdCBvZiBhbGwgSSdkIGxpa2UgdG8gbWVudGlv
biB0aGF0IHdoaWxlIGl0IG1heSBoYXZlIGJlZW4gb2theSB0bw0KPj4+Pj4gbm90IGhvbGQgcGNp
ZGV2c19sb2NrIGhlcmUgZm9yIERvbTAsIGl0IHN1cmVseSBuZWVkcyBhY3F1aXJpbmcgd2hlbiBk
ZWFsaW5nDQo+Pj4+PiB3aXRoIERvbVUtcycgbGlzdHMgb2YgUENJIGRldmljZXMuIFRoZSByZXF1
aXJlbWVudCByZWFsbHkgYXBwbGllcyB0byB0aGUNCj4+Pj4+IG90aGVyIHVzZSBvZiBmb3JfZWFj
aF9wZGV2KCkgYXMgd2VsbCAoaW4gdnBjaV9kdW1wX21zaSgpKSwgZXhjZXB0IHRoYXQNCj4+Pj4+
IHRoZXJlIGl0IHByb2JhYmx5IHdhbnRzIHRvIGJlIGEgdHJ5LWxvY2suDQo+Pj4+Pg0KPj4+Pj4g
TmV4dCBJJ2QgbGlrZSB0byBwb2ludCBvdXQgdGhhdCBoZXJlIHdlIGhhdmUgdGhlIHN0aWxsIHBl
bmRpbmcgaXNzdWUgb2YNCj4+Pj4+IGhvdyB0byBkZWFsIHdpdGggaGlkZGVuIGRldmljZXMsIHdo
aWNoIERvbTAgY2FuIGFjY2Vzcy4gU2VlIG15IFJGQyBwYXRjaA0KPj4+Pj4gInZQQ0k6IGFjY291
bnQgZm9yIGhpZGRlbiBkZXZpY2VzIGluIG1vZGlmeV9iYXJzKCkiLiBXaGF0ZXZlciB0aGUgc29s
dXRpb24NCj4+Pj4+IGhlcmUsIEkgdGhpbmsgaXQgd2FudHMgdG8gYXQgbGVhc3QgYWNjb3VudCBm
b3IgdGhlIGV4dHJhIG5lZWQgdGhlcmUuDQo+Pj4+IFllcywgc29ycnksIEkgc2hvdWxkIHRha2Ug
Y2FyZSBvZiB0aGF0Lg0KPj4+Pg0KPj4+Pj4gTm93IGl0IGlzIHF1aXRlIGNsZWFyIHRoYXQgcGNp
ZGV2c19sb2NrIGlzbid0IGdvaW5nIHRvIGhlbHAgd2l0aCBhdm9pZGluZw0KPj4+Pj4gdGhlIGRl
YWRsb2NrLCBhcyBpdCdzIGltbyBub3QgYW4gb3B0aW9uIGF0IGFsbCB0byBhY3F1aXJlIHRoYXQg
bG9jaw0KPj4+Pj4gZXZlcnl3aGVyZSBlbHNlIHlvdSBhY2Nlc3MgLT52cGNpIChvciBlbHNlIHRo
ZSB2cGNpIGxvY2sgaXRzZWxmIHdvdWxkIGJlDQo+Pj4+PiBwb2ludGxlc3MpLiBCdXQgYSBwZXIt
ZG9tYWluIGF1eGlsaWFyeSByL3cgbG9jayBtYXkgaGVscDogT3RoZXIgcGF0aHMNCj4+Pj4+IHdv
dWxkIGFjcXVpcmUgaXQgaW4gcmVhZCBtb2RlLCBhbmQgaGVyZSB5b3UnZCBhY3F1aXJlIGl0IGlu
IHdyaXRlIG1vZGUgKGluDQo+Pj4+PiB0aGUgZm9ybWVyIGNhc2UgYXJvdW5kIHRoZSB2cGNpIGxv
Y2ssIHdoaWxlIGluIHRoZSBsYXR0ZXIgY2FzZSB0aGVyZSBtYXkNCj4+Pj4+IHRoZW4gbm90IGJl
IGFueSBuZWVkIHRvIGFjcXVpcmUgdGhlIGluZGl2aWR1YWwgdnBjaSBsb2NrcyBhdCBhbGwpLiBG
VEFPRDoNCj4+Pj4+IEkgaGF2ZW4ndCBmdWxseSB0aG91Z2h0IHRocm91Z2ggYWxsIGltcGxpY2F0
aW9ucyAoYW5kIGhlbmNlIHdoZXRoZXIgdGhpcyBpcw0KPj4+Pj4gdmlhYmxlIGluIHRoZSBmaXJz
dCBwbGFjZSk7IEkgZXhwZWN0IHlvdSB3aWxsLCBkb2N1bWVudGluZyB3aGF0IHlvdSd2ZQ0KPj4+
Pj4gZm91bmQgaW4gdGhlIHJlc3VsdGluZyBwYXRjaCBkZXNjcmlwdGlvbi4gT2YgY291cnNlIHRo
ZSBkb3VibGUgbG9jaw0KPj4+Pj4gYWNxdWlyZS9yZWxlYXNlIHdvdWxkIHRoZW4gbGlrZWx5IHdh
bnQgaGlkaW5nIGluIGhlbHBlciBmdW5jdGlvbnMuDQo+Pj4+IEkndmUgYmVlbiBhbHNvIHRoaW5r
aW5nIGFib3V0IHRoaXMsIGFuZCB3aGV0aGVyIGl0J3MgcmVhbGx5IHdvcnRoIHRvDQo+Pj4+IGhh
dmUgYSBwZXItZGV2aWNlIGxvY2sgcmF0aGVyIHRoYW4gYSBwZXItZG9tYWluIG9uZSB0aGF0IHBy
b3RlY3RzIGFsbA0KPj4+PiB2cGNpIHJlZ2lvbnMgb2YgdGhlIGRldmljZXMgYXNzaWduZWQgdG8g
dGhlIGRvbWFpbi4NCj4+Pj4NCj4+Pj4gVGhlIE9TIGlzIGxpa2VseSB0byBzZXJpYWxpemUgYWNj
ZXNzZXMgdG8gdGhlIFBDSSBjb25maWcgc3BhY2UgYW55d2F5LA0KPj4+PiBhbmQgdGhlIG9ubHkg
cGxhY2UgSSBjb3VsZCBzZWUgYSBiZW5lZml0IG9mIGhhdmluZyBwZXItZGV2aWNlIGxvY2tzIGlz
DQo+Pj4+IGluIHRoZSBoYW5kbGluZyBvZiBNU0ktWCB0YWJsZXMsIGFzIHRoZSBoYW5kbGluZyBv
ZiB0aGUgbWFzayBiaXQgaXMNCj4+Pj4gbGlrZWx5IHZlcnkgcGVyZm9ybWFuY2Ugc2Vuc2l0aXZl
LCBzbyBhZGRpbmcgYSBwZXItZG9tYWluIGxvY2sgdGhlcmUNCj4+Pj4gY291bGQgYmUgYSBib3R0
bGVuZWNrLg0KPj4+IEhtbSwgd2l0aCBtZXRob2QgMSBhY2Nlc3NlcyBzZXJpYWxpemluZyBnbG9i
YWxseSBpcyBiYXNpY2FsbHkNCj4+PiB1bmF2b2lkYWJsZSwgYnV0IHdpdGggTU1DRkcgSSBzZWUg
bm8gcmVhc29uIHdoeSBPU2VzIG1heSBub3QgKG1vdmUNCj4+PiB0bykgcGVybWl0KHRpbmcpIHBh
cmFsbGVsIGFjY2Vzc2VzLCB3aXRoIHNlcmlhbGl6YXRpb24gcGVyaGFwcyBkb25lDQo+Pj4gb25s
eSBhdCBkZXZpY2UgbGV2ZWwuIFNlZSBvdXIgb3duIHBjaV9jb25maWdfbG9jaywgd2hpY2ggYXBw
bGllcyB0bw0KPj4+IG9ubHkgbWV0aG9kIDEgYWNjZXNzZXM7IHdlIGRvbid0IGxvb2sgdG8gYmUg
c2VyaWFsaXppbmcgTU1DRkcNCj4+PiBhY2Nlc3NlcyBhdCBhbGwuDQo+Pj4NCj4+Pj4gV2UgY291
bGQgYWx0ZXJuYXRpdmVseSBkbyBhIHBlci1kb21haW4gcndsb2NrIGZvciB2cGNpIGFuZCBzcGVj
aWFsIGNhc2UNCj4+Pj4gdGhlIE1TSS1YIGFyZWEgdG8gYWxzbyBoYXZlIGEgcGVyLWRldmljZSBz
cGVjaWZpYyBsb2NrLiBBdCB3aGljaCBwb2ludA0KPj4+PiBpdCBiZWNvbWVzIGZhaXJseSBzaW1p
bGFyIHRvIHdoYXQgeW91IHByb3Bvc2UuDQo+PiBASmFuLCBAUm9nZXINCj4+DQo+PiAxLiBkLT52
cGNpX2xvY2sgLSByd2xvY2sgPC0gdGhpcyBwcm90ZWN0cyB2cGNpDQo+PiAyLiBwZGV2LT52cGNp
LT5tc2l4X3RibF9sb2NrIC0gcndsb2NrIDwtIHRoaXMgcHJvdGVjdHMgTVNJLVggdGFibGVzDQo+
PiBvciBzaG91bGQgaXQgYmV0dGVyIGJlIHBkZXYtPm1zaXhfdGJsX2xvY2sgYXMgTVNJLVggdGFi
bGVzIGRvbid0DQo+PiByZWFsbHkgZGVwZW5kIG9uIHZQQ0k/DQo+IElmIHNvLCBwZXJoYXBzIGlu
ZGVlZCBiZXR0ZXIgdGhlIGxhdHRlci4gQnV0IGFzIHNhaWQgaW4gcmVwbHkgdG8gUm9nZXIsDQo+
IEknbSBub3QgY29udmluY2VkICh5ZXQpIHRoYXQgZG9pbmcgYXdheSB3aXRoIHRoZSBwZXItZGV2
aWNlIGxvY2sgaXMgYQ0KPiBnb29kIG1vdmUuIEFzIHNhaWQgdGhlcmUgLSB3ZSdyZSBvdXJzZWx2
ZXMgZG9pbmcgZnVsbHkgcGFyYWxsZWwgTU1DRkcNCj4gYWNjZXNzZXMsIHNvIE9TZXMgb3VnaHQg
dG8gYmUgZmluZSB0byBkbyBzbywgdG9vLg0KQnV0IHdpdGggcGRldi0+dnBjaV9sb2NrIHdlIGZh
Y2UgQUJCQS4uLg0KPg0KPiBKYW4NCj4NCj4NCg==

