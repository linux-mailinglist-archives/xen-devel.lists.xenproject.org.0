Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B44A83EE
	for <lists+xen-devel@lfdr.de>; Thu,  3 Feb 2022 13:37:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264671.457852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbLe-0004uS-5y; Thu, 03 Feb 2022 12:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264671.457852; Thu, 03 Feb 2022 12:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFbLe-0004qy-1r; Thu, 03 Feb 2022 12:36:26 +0000
Received: by outflank-mailman (input) for mailman id 264671;
 Thu, 03 Feb 2022 12:36:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ArrP=SS=epam.com=prvs=403311c35b=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nFbLb-0004qc-VJ
 for xen-devel@lists.xenproject.org; Thu, 03 Feb 2022 12:36:24 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ed053d-84ed-11ec-8eb8-a37418f5ba1a;
 Thu, 03 Feb 2022 13:36:21 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 213C2wW3031038;
 Thu, 3 Feb 2022 12:36:10 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2059.outbound.protection.outlook.com [104.47.9.59])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e0cw4gm49-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 12:36:10 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM6PR03MB4453.eurprd03.prod.outlook.com (2603:10a6:20b:10::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 3 Feb
 2022 12:36:06 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::d425:9c9f:10a8:fdf6%3]) with mapi id 15.20.4951.012; Thu, 3 Feb 2022
 12:36:05 +0000
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
X-Inumbo-ID: e3ed053d-84ed-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMuSfnhVGyo/CNGY4O/e+LFkAilnTgZX4WOhohe82W1AovqeEWQkRkUP/AILjRojsZiU83YtTjSbmz5XW3fRHYxFmqnobFBeJz1IT7ckqZ7bsaT5Ojh3l5QPQVzuG5p5oEF3MN+KwYs51zoquCpo5FTUU/ybODGuH6Xd+e+xcXjEt8o9jLUqd2Mrqg7by5PfOEdurYIBUrKxklmpy25jUIbGx+/I30B/25mFfc+w+/LkX2xptl5x4Gv47AKceSvOP0nliqMkxc9nmpaRpVk988Etbk6eZ5H5TFcugmMxR0dxbJTJHtpKXovW5Kn6w1x6kXGRDs07kpRLfCUPJOoudA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qvjXtdrceeDe0zyUuMbF/2QUXRGNXnQyZ4ZyVbFcofA=;
 b=oZ3+oZzviw+qkGdXnjFR9d0keolWzeDXu2dGcQq22FRq6fyBCqSR5PVkize1alEcL+J4Vof6MGh+CkvIl1pRoQgghT7FQYh7nV+7520/1fexu5zPNG0jmr4uXqT3gT+lH7BK6Qaoykzo3C26zx0s0uR5pX3mAKIMkc7eoxGSs7gXhNx0Ug+8cQTtISBbrCkww70UOsbeMley304pjJ3G4o0jaWyiNZYgl951axhoOvD+ROhh4Z76o1O2Wk/AUx2hP+akecO3c7turqLYXPgor6DNiATLNZNRifi1XxMn0zmln+WoSp2RoqCdhWYp2Ijrna/KR1hfVBmWggsbT+Ip+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvjXtdrceeDe0zyUuMbF/2QUXRGNXnQyZ4ZyVbFcofA=;
 b=iugyGtNeVr5lFBr5jpfQFt6o5euQqh6WouRApU0KwaNfTpTWCgWuEQoTFxcfsMETAUy6cNMdXjJHIgC5zd0yQcJ1CS51aOgs635ApBX/oH0Mtm9UxU/zTUKgZdYRnwnxVDsbfzOICbvAaQDxGncqdNVavhdjCciVs6sjp8IY5GTnLE0zLcEi64Jt45XoaSy/EmEW4fof+bbL7uiQ4zJ8zAn21Pat+utmqHivvpCL947Uo6+Yi89DN85n3+hU089wBQYFmvhTqNgRZ8yYsFecTHhsFDJZVKF9StGu1cVszLx/dKnLw7Z3hQjixX9wnKURtgk9Pmr74JyrbjMnxzunUA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Bertrand Marquis <bertrand.marquis@arm.com>,
        "roger.pau@citrix.com"
	<roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>,
        "sstabellini@kernel.org" <sstabellini@kernel.org>,
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
        "paul@xen.org" <paul@xen.org>, Rahul Singh
	<rahul.singh@arm.com>,
        Oleksandr Andrushchenko
	<Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Topic: [PATCH v5 06/14] vpci/header: implement guest BAR register
 handlers
Thread-Index: AQHX4ewHyWAyD811HEGp8pIjUuVWNawUby8AgAFMuICAbHV4AA==
Date: Thu, 3 Feb 2022 12:36:05 +0000
Message-ID: <571d7660-c091-ac41-5e3c-441b4c5a1679@epam.com>
References: <20211125110251.2877218-1-andr2000@gmail.com>
 <20211125110251.2877218-7-andr2000@gmail.com>
 <34FC3FE6-EBA8-4A5C-A1F3-1E9F98C0337F@arm.com>
 <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
In-Reply-To: <a6ee236b-5a00-8116-c744-6c94fcf46ae1@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 633b124f-4fb3-45c4-3e5c-08d9e711bf3f
x-ms-traffictypediagnostic: AM6PR03MB4453:EE_
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM6PR03MB4453B6A392810E74B6BE8AD1E7289@AM6PR03MB4453.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YTUoddm0Xl2uIcB3KlKIcoJuzAq1yzvOwGIs4QClW5V8/dLPoTMSqj0TxNzCe3RrWmKtI2X1K2lyYO8pf/AJ0C6HVqBqLVF5NHjJfwuxHxhbDahLuozb9/Up1smgg81Lmx2cSBu0pWP9GVU4Jx0Fmr5zOreQf4AdSmjPwv1DvQ+Vhz60WSYOfs2RfGzfo8e5YQid0V186/QjJ0oamVLXEIRIyZWSf3XYEYQwjXW4diqtz4jB6U/Tza3g7ZWw/IKEG4w1/Y8/JajwQkGyU+0lX9kEj6zppy/kz2ZG0K6bmjSefxfCpXZOGOlnJ/CTgmLe5NZ3r2XPS7Zhv+SsP+Ga30iHmDQjvFOkfcUFbGyYPNX5LfN3g6kJ00HdmlduYSznDAy1PFvtVd1bMQYfnz5eeXMbpoNYx9IGYAqgrQV0nJR/N8boWpYt9pUJ73/2aqAhCcgWqdMXg4VnOSg5/jkRfc7IrsjXRnp0pxiHZ2sR0nCjl40gMQijE4p8HwZ67edyD7aN0x+crqLbWh+s9gBubRy646botAbmfm6mTk4ueL7WUtR++a+oxm8c6thLqt5WsM0RpA6sqyTucbJaOEBXZzefXHN6mwsmOcH9Xtj/zUjsaPn+gbojFBuTIvVJh7EOV54lso5F5W2ttRKhyfHmNNP3A3LKeFA2ONWI7/QHpirmfgflrdvGMEsQ9D2MGYc0b1HjBJcmdsDIQxgAInhRQmDOMZZVbcf/aQbthkdQYi31S0RrC99a3vAJV6HERST9
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(26005)(31686004)(71200400001)(8676002)(5660300002)(36756003)(316002)(38100700002)(66446008)(2616005)(76116006)(64756008)(110136005)(8936002)(54906003)(4326008)(66476007)(66946007)(186003)(107886003)(91956017)(83380400001)(66556008)(6486002)(7416002)(6506007)(31696002)(53546011)(86362001)(122000001)(508600001)(38070700005)(2906002)(6512007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cVpPMzJHbEZYeUZXa1crYnhkVjh3MUZOZHJobHFxcXB5K05EbUlWZURpdVF3?=
 =?utf-8?B?NWVLWlE4K1RNVzVPY3M4TWN6S0lxaVB2ZWMvZTJQQ3dIam1zU0UxclEzeXRY?=
 =?utf-8?B?Vy9jd0hwandFQ2Y5Nk9XNlFoZFhFVTgvNmlXSFJjb2E4eHU3c0xpUS8wdmFD?=
 =?utf-8?B?MDgzTXRkWDhKMk1KRVZxODdsOFYyTjhqMGJ1TGd5NHVJVG1HdGJsYUtZaG9O?=
 =?utf-8?B?c1VTSnZkK3k0alJTcDVkZXhqTGgwempUVW1qbytJWU9rZEdPblJGY25aNUti?=
 =?utf-8?B?TmM2eWxuQ3BqTUNyMUlmMkM4dGJya3RueU4xek5PZnNHYkJ3MmhhVEJyZGNn?=
 =?utf-8?B?dnJKY2dFR2RGR0s2aW94T3FwTXM4Mlg0WjlWZ1pWYklLUUU1TlBVL214cjNN?=
 =?utf-8?B?MjRpT0FRZUs2emt0NDZVdEdRMVJhekp3Y3cvaG83dE1GT2pwb0JhNmNLaXVU?=
 =?utf-8?B?RWMyZ3YxdzYzSHJXOE45eHp3OFRObm1mSXhGc2FRRUx6bHR2THo3YXJyNWVk?=
 =?utf-8?B?M203M05RU2I3VmlHTGJRc3NiRGxYY3pTOTZRM2RVSjE0ZmtFTDF6QjRVb21s?=
 =?utf-8?B?RVVLS1Y4K3dSak9xb0p4UDRMemozZ2VLV1NiTExLQ0R2WW1hbkYvWHNHRUU0?=
 =?utf-8?B?cXNkYStORmRaUzlqNm1hRjNVZ1JTVXU5SHdpd3R0SkJWUm1RK3N0aC9hWGFW?=
 =?utf-8?B?MUNNVnZEN1FZZkhKam4wTWRUWTdiT3dhL0YxTHU0QWpMdFY2NVRGaktWOENM?=
 =?utf-8?B?TTRQRGJBNlVOcnpvelFHL2puQjEwQjFxS3hCM0RLemMzS01idWNhNUNoeWxS?=
 =?utf-8?B?SzJiQXgxbkdZYktwVXNnM3lNalRLbDZFV25DSnpvTGx4eXdqZ3pnclJ1Z01m?=
 =?utf-8?B?b01YRVh1MS9zbWVyVGRiUXRNNGdqRWttR0Zib1RJenNBRWtNT1AwMHVxRDNX?=
 =?utf-8?B?c0R1OTlnQWlsYzRuKy9lT2ZMTXlTM0hGc0dJTkE5NEM4eW1zc0U4SE5udHFM?=
 =?utf-8?B?SU8yTkFrang4RzA1ZFJmU3I0M2NseCtGbEpRUzh4MHFpcE8rRFF1OTZmU0FL?=
 =?utf-8?B?VUZYaVE1ZTJyRjcxWXJlMTJ4dTlpYWYyQXhFMUx3dDdKbTIzRGowRWNXTWVO?=
 =?utf-8?B?M1lqYkk3dTZOTHd4WTNjY2lVaWFpeVBRbENwN04rTFJBakNtNzBkckg5ckg5?=
 =?utf-8?B?cUdzZktzUDBQWW1WYjZxaWxUNDB6akVzMUZyUzVCSGVLNEw3NE9CWXNLVk14?=
 =?utf-8?B?MlR6OW5hL3BOL1pvU1NDOUQrM1c1RGxmY0FwTHhGSXBpMUhCSS9rcXoyYUtL?=
 =?utf-8?B?YXRxUU5Xcnh1WXF0YW5yemRpZklIVFQ0ZGZPRXNZTnVxeUtGWTBiNWJucTBw?=
 =?utf-8?B?aUVvUHRaL2NOK2NpbjJjc0RKdzB4eE9HTWRMcHZXNFVjSGFLTlc5SVY0NzAr?=
 =?utf-8?B?WDJQUkVyYk5ZMzlPVVZCazllMHF2VkR5TTQzSEMweVJrVlJUQXVNVDZKT3Bx?=
 =?utf-8?B?YXQ1VGhWbStwWm53ZnF3WlZCeTJZVXVmQU14YndmMU9TOVczR1JaTjAzeVhF?=
 =?utf-8?B?TDA5em5vZFhvUUF2Uk1JQ0ZCc1JtZTVld3ROcUE3dEFaS1ZGTFAycXJteDFV?=
 =?utf-8?B?elhzU2I1ekZvK2dMSFM2VUVBQXJnWjlVbWdnOU1FSUFITWVrTlBHajhSYnFD?=
 =?utf-8?B?RFhKM1VkenJOKzF1NEkvaDRmT0huVTdFa1dRcDloL2lOVTVKMUdXMVhhZ0RX?=
 =?utf-8?B?UW5ldmdKTzNyeUlqWTZhRms5azl2OVBoRnFFWXdLZlVlMnNqV09BVmlCRGRJ?=
 =?utf-8?B?RW9tdVI1bHByV3c2M2RwSGRJUWZkMnIxTThIR3U2L1Jra1NFY0xSUXNWeFVJ?=
 =?utf-8?B?cUdNOW5PZnNVdGZtMVJnTy9tNXZNNnRoVDVZN0VYVnpMamRMc2dpeWxJTmFV?=
 =?utf-8?B?SzFrek1Qa1dpS1FkTXBkczJCN3VwY011NitpQS9LQmhQQ2VzVXdUV1FYUkZU?=
 =?utf-8?B?WEJaSHU1djFvcEo3RHh5SG12MU4vNU03UGpHREtOSnB3RFB4RjhYNmtoTTBV?=
 =?utf-8?B?b2w3Q0kybytraG5vU0xzRWovMHkrb0FJMmxsTVR0eHAyWGlvOGZIOUtWTjVj?=
 =?utf-8?B?alZ5dXZNWUN3SXhlUnI3a1pNN0hkMjdlRUNWMzBJVWxDRVpCQkxzVlRzOXRC?=
 =?utf-8?B?NEo5a2FIbThFUDZ5TjhLenhGZW1DblVaQ1R0QzkycksvbmRURVpnM3NMckps?=
 =?utf-8?B?dmxYdVg3dUdMZzN6VENhVWpNakxCY05URndnRmNTK3lYQVVpT1R5RmNXUVNj?=
 =?utf-8?B?SkozSURCMHkxSm04bVVEaXNvdFBROTVUL1kzaWJvR3hTUXNYdi9FZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <342FD43ED91F3847B5F751C6392DF18F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633b124f-4fb3-45c4-3e5c-08d9e711bf3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2022 12:36:05.6458
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhB+c1KIALG6TezDqtL5H5tsymSUxmi4PxrL5O+PXxkZWQ5tLbDCWLg4SUsR8deGt2dJpKdiDPFyKbGi/BMEk9AVn3jmDJu6UT69co/fUWojhblDbz8jh63kL/deGSNW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR03MB4453
X-Proofpoint-GUID: zTM6uJ4pH-AfPbJzZYBN1D0NIERqKVDy
X-Proofpoint-ORIG-GUID: zTM6uJ4pH-AfPbJzZYBN1D0NIERqKVDy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=334 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030078

SGksIEJlcnRyYW5kIQ0KDQpPbiAyNi4xMS4yMSAxNDoxOSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gd3JvdGU6DQo+IEhpLCBCZXJ0cmFuZCENCj4NCj4gT24gMjUuMTEuMjEgMTg6MjgsIEJlcnRy
YW5kIE1hcnF1aXMgd3JvdGU6DQo+PiBIaSBPbGVrc2FuZHIsDQo+Pg0KPj4+IE9uIDI1IE5vdiAy
MDIxLCBhdCAxMTowMiwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPGFuZHIyMDAwQGdtYWlsLmNv
bT4gd3JvdGU6DQo+Pj4NCj4+PiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3Nh
bmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+Pj4NCj4+PiBBZGQgcmVsZXZhbnQgdnBjaSBy
ZWdpc3RlciBoYW5kbGVycyB3aGVuIGFzc2lnbmluZyBQQ0kgZGV2aWNlIHRvIGEgZG9tYWluDQo+
Pj4gYW5kIHJlbW92ZSB0aG9zZSB3aGVuIGRlLWFzc2lnbmluZy4gVGhpcyBhbGxvd3MgaGF2aW5n
IGRpZmZlcmVudA0KPj4+IGhhbmRsZXJzIGZvciBkaWZmZXJlbnQgZG9tYWlucywgZS5nLiBod2Rv
bSBhbmQgb3RoZXIgZ3Vlc3RzLg0KPj4+DQo+Pj4gRW11bGF0ZSBndWVzdCBCQVIgcmVnaXN0ZXIg
dmFsdWVzOiB0aGlzIGFsbG93cyBjcmVhdGluZyBhIGd1ZXN0IHZpZXcNCj4+PiBvZiB0aGUgcmVn
aXN0ZXJzIGFuZCBlbXVsYXRlcyBzaXplIGFuZCBwcm9wZXJ0aWVzIHByb2JlIGFzIGl0IGlzIGRv
bmUNCj4+PiBkdXJpbmcgUENJIGRldmljZSBlbnVtZXJhdGlvbiBieSB0aGUgZ3Vlc3QuDQo+Pj4N
Cj4+PiBST00gQkFSIGlzIG9ubHkgaGFuZGxlZCBmb3IgdGhlIGhhcmR3YXJlIGRvbWFpbiBhbmQg
Zm9yIGd1ZXN0IGRvbWFpbnMNCj4+PiB0aGVyZSBpcyBhIHN0dWI6IGF0IHRoZSBtb21lbnQgUENJ
IGV4cGFuc2lvbiBST00gaGFuZGxpbmcgaXMgc3VwcG9ydGVkDQo+Pj4gZm9yIHg4NiBvbmx5IGFu
ZCBpdCBtaWdodCBub3QgYmUgdXNlZCBieSBvdGhlciBhcmNoaXRlY3R1cmVzIHdpdGhvdXQNCj4+
PiBlbXVsYXRpbmcgeDg2LiBPdGhlciB1c2UtY2FzZXMgbWF5IGluY2x1ZGUgdXNpbmcgdGhhdCBl
eHBhbnNpb24gUk9NIGJlZm9yZQ0KPj4+IFhlbiBib290cywgaGVuY2Ugbm8gZW11bGF0aW9uIGlz
IG5lZWRlZCBpbiBYZW4gaXRzZWxmLiBPciB3aGVuIGEgZ3Vlc3QNCj4+PiB3YW50cyB0byB1c2Ug
dGhlIFJPTSBjb2RlIHdoaWNoIHNlZW1zIHRvIGJlIHJhcmUuDQo+PiBJbiB0aGUgZ2VuZXJpYyBj
b2RlLCBiYXJzIGZvciBpb3BvcnRzIGFyZSBhY3R1YWxseSBza2lwcGVkIChjaGVjayBjb2RlIGJl
Zm9yZQ0KPj4gaW4gaGVhZGVyLmMsIGluIGNhc2Ugb2YgaW9wb3J0cyB0aGVyZSBpcyBhIGNvbnRp
bnVlKSBhbmQgbm8gaGFuZGxlciBpcyByZWdpc3RlcmVkIGZvciB0aGVtLg0KPj4gVGhlIGNvbnNl
cXVlbmNlIHdpbGwgYmUgdGhhdCBhIGd1ZXN0IHdpbGwgYWNjZXNzIGhhcmR3YXJlIHdoZW4gcmVh
ZGluZyB0aG9zZSBCQVJzLg0KPiBZZXMsIHRoaXMgc2VlbXMgdG8gYmUgYSB2YWxpZCBwb2ludA0K
U28sIHdpdGggdGhlIGFwcHJvYWNoIHdlIGhhdmUgZGV2ZWxvcGVkIHRoZXNlIGRheXMgd2Ugd2ls
bCBpZ25vcmUgYWxsIHdyaXRlcw0KYW5kIHJldHVybiB+MCBmb3IgcmVhZHMgZm9yIGFsbCB1bmhh
bmRsZWQgb3BzLCBlLmcuIHRob3NlIHdoaWNoIGRvIG5vdCBoYXZlIGV4cGxpY2l0DQpyZWdpc3Rl
ciBoYW5kbGVycyBlbXBsb3llZC4gVGh1cywgdGhpcyBjYXNlIHdpbGwgZmFsbCBpbnRvIHVuaGFu
ZGxlZCBjbGF1c2UuDQoNClRoYW5rIHlvdSwNCk9sZWtzYW5kcg==

