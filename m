Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFD443ED0
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 09:58:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220613.381942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC5w-0002Xp-JH; Wed, 03 Nov 2021 08:58:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220613.381942; Wed, 03 Nov 2021 08:58:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miC5w-0002VN-Fs; Wed, 03 Nov 2021 08:58:08 +0000
Received: by outflank-mailman (input) for mailman id 220613;
 Wed, 03 Nov 2021 08:58:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UC4I=PW=epam.com=prvs=194164c520=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1miC5u-0002VH-K8
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 08:58:06 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 282f42b2-3c84-11ec-8563-12813bfff9fa;
 Wed, 03 Nov 2021 08:58:05 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A38Q08c029233;
 Wed, 3 Nov 2021 08:58:02 GMT
Received: from eur03-db5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2057.outbound.protection.outlook.com [104.47.10.57])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3c3pwng4d6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Nov 2021 08:58:01 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5796.eurprd03.prod.outlook.com (2603:10a6:208:156::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 3 Nov
 2021 08:57:59 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4669.011; Wed, 3 Nov 2021
 08:57:59 +0000
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
X-Inumbo-ID: 282f42b2-3c84-11ec-8563-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rvf7s76vtWyDzSuAU+fhk2wb6HLalrEI+0g2RiIDfdW2hCSMnTIlsMrZmrJwzHjRYysT7z03+mZ6X0OpKB99GhY3UEPyJRpiybJV1Auj4cKmPYRCE4cdb0FCWfwuPBqPVSaIipiqOQAib7uN5Wf03keGDrNjiAiqZSe+DO7BuDblj31Es+AP5W72FGuozkiykepEz+IQN/9Z9UhJ8w9bF6yYjJPjtkLnWxSdus4Kfm3PzaYu39v0pDbmju3jMpR7zYPOng7y65JVMXC3zUQeLc5C9hKGYaoeQ68qTBXGa34k71QEnfEIxLMbcOnhV84z0OA/q8SnW7eVzGZqaV0XNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abJhIhsTTkiUCMlNEdTW5hx8Z4rICWMfvn5gKhIQIe8=;
 b=Kkowx4Xx/mUGdG9Si1OTP4zFWbyD2EfXItePlv23Nu2Tl6Dyt4wAcSIFy5mStzlYsVR1LASGDIRZO/g6T6FuuWlB/z+LmhxiQ44jQysH30cPIOuSvtJ0OJBQ+YHQiFHhSUedA476Ob7rUFa2Z/XP9QQAvyFL3V0AnFTmQhz9euMMKcYqR2AQMhG/rBSZvGIPbI001vRNu8zjUxQVn6kW2NM7vB4F/6iMe3yMVf3Ag0jZSKPu20CJwzWV6zkBrFtfmqjhGr9+HDHhglSrws9x5Xr3FsPbSaI74CsP7TSKIIHegEDNnapba2cRaXjJfFPCfBzobPXGSgl7482JcSTvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abJhIhsTTkiUCMlNEdTW5hx8Z4rICWMfvn5gKhIQIe8=;
 b=jdxtRBE+ROwj8Fsb/awkvs8DRVobdwfEnjFwA42Ovg5916XG047TBRE+M71dwJRKkFQxajpJQVGzF8Yn9lLUo04/pFffr2/KOg9RHqZaEiOvWAq+zXec9Uow41nd5kyGQBpb95ezcW8r/QWuhBG6lNKxAUWn6TzjPZ6HhcC8nFyX4MSacJRkguglvzjW6jz4l7gfHXAB1q3pABTz/5XXAQV9LAi8x0c5DCd5LvszyYYZ0kAU0eFJW7qnTaPNnhkS3MhQBCnEQv6ym4nyheXT9RxVGcHnx7TRUHAh28vSsyiipdCGHId/fMBqCZvsStT6BelNwBzkTfpAoMhPs67adQ==
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
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Rahul Singh
	<rahul.singh@arm.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Topic: [PATCH v3 10/11] vpci: Add initial support for virtual PCI bus
 topology
Thread-Index: AQHXtdAlOCu2AnkIOUC4Prsocox3sqvlTvCAgAw/FQCAACN9gIAABKkA
Date: Wed, 3 Nov 2021 08:57:59 +0000
Message-ID: <92bea18d-2c33-6cd0-7e68-f04182b5325b@epam.com>
References: <20210930075223.860329-1-andr2000@gmail.com>
 <20210930075223.860329-11-andr2000@gmail.com>
 <YXfng3PqDI6C4yxn@MacBook-Air-de-Roger.local>
 <52b1533d-4aeb-29be-2611-9b50adea3f73@epam.com>
 <5ee482d2-3af5-b49a-facf-6a78ab672cd4@suse.com>
In-Reply-To: <5ee482d2-3af5-b49a-facf-6a78ab672cd4@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23f5d998-26ae-4ff2-fb0e-08d99ea80922
x-ms-traffictypediagnostic: AM0PR03MB5796:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5796D5781F140671FD8356EDE78C9@AM0PR03MB5796.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 RwItz4nBpaRv6+GFDYQ/ePqM4vuZkFA3wdJjbTOirSp8eddmstfa4uz1d87Dyp7sFl7LpzPcKnQ9p7XKUz54Oca9PiPZQINHp3csIHxqx6Cttm9e8XmOhKSXcqsxspDNHWsTJDQiis+vKUB3mfL+xfpct4ofD4GJp/ngT5+9qfBI8kQ17L6WgLgrDgTqmj0KQO4SZQ4cM+WaZnHm0do5ttkZ2ijOGwvRH3IXPHAjrB35HqIhRjlx5QsnrBmaRtswrLFTAB4jgV2QgOsfWdXxxLYRFT1WeCgxICStrDttSiOt6QiWVr9DAimGjQfbmSq7i2UhYmz9MV3xjy0Xqdda0cEnuSEYK2vy6hL0lWPLojZTEGrkoalxYwTWn20OujyygSiDgeA2ftIbUK/mI2AAxgGGZtyz8YMXbNYsFuZjCiA3UfTBikGoRyKOJF3qF7bxtVYiqSPZ8z1iSKB3MIjVNglPTZGGLmF+qRuAzy9EGIwUpx2VqRRqWsGpSQ3tPIlwJ/zfkoxQgRQPBfUyAkOVH8xHWXoB/jA3O8+eLsbMON69+UWclkE/MN+N/CRjIcrbLuKpQoGAOuUI6zBi+IAMgrQY/rX9XEFrCMsLw/EO/cX5aAY/vUh9XBQDHCXJB/kFe1jBnJfjQAX+BrRhMG+ynqZ4EGonN7AhtDzgQ+PiUcFz/JFDbVqfPyjHARcCE3VHRiX8mhSkx5njwXWSSOStm2N9Zulg+OVMzbi2yfhej64cb8q+IuSgufqtav2eu+y5
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(71200400001)(2906002)(26005)(91956017)(76116006)(6512007)(66946007)(38070700005)(36756003)(86362001)(6916009)(54906003)(8676002)(53546011)(83380400001)(6506007)(31686004)(66446008)(38100700002)(122000001)(6486002)(64756008)(508600001)(5660300002)(8936002)(66556008)(316002)(31696002)(4326008)(186003)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OGQyeXoyeENJNzZkemdBRjZtVFZCc3dGaWlBd1NGZW1IbG1VVGl5WFpwazZ1?=
 =?utf-8?B?UEZVREF1akkweXZJNWJtM3cycUpPZVlSUThKaVhIWTJRMXNvS3ZmZUVwQUpD?=
 =?utf-8?B?b1dMZlp3SXczR3R2Z3h0cFhiZ01sTzhudWcxaC9oeHhDYWdMQUtldUxYWG9H?=
 =?utf-8?B?NXBaL3VJOU9IS0Jhc0xHU3E4VmlvTWpaWDFINTJwTldqN0JXckFIRU1KUnNY?=
 =?utf-8?B?NmFMYVhwOTdhRy9jQVFqYkFGSGtubHA0cUgwWXlLazV5Qkp2a1dyczhBVXc5?=
 =?utf-8?B?TmU0MXppdlZHRzVPQlRKWTFHQS95VzIzZ1RsRVZCRGg3MXBQNGE2Nm14bmIv?=
 =?utf-8?B?WG9jb29laFVFcWFyZFhoR0V0OWRwUnNVNUFDTzVRUHFjT0tHR0JYNFJ5a3pN?=
 =?utf-8?B?Um4zQTc1eWNMeGNrUFV5Qlhpd1RLNk1mWGRjWVBJVTNRZFBLeWxacyszS3p3?=
 =?utf-8?B?MVVYVkFoMDFFQXptM0VRMkJ3OHBuRHArMnBxaS9oL0JiQVU1clBVVitTSjZV?=
 =?utf-8?B?Yjc3TTNrZGtXNHJiZDF1bDE4bjgwUGtHeUNNNGEyTnRtb0JQNUR3aWlZSTdm?=
 =?utf-8?B?ZEhjQVR0ZEVKZFRmR2tpYjBTV28rZ1JBUlFXUzhNV09Ed2h0Z1ZLMWZ5UFNP?=
 =?utf-8?B?RWxPbGVldWJSQzRuQWhLRFZ3U3NtSjNDandFbG82M3NmMXhqVHEwVGhUTkFZ?=
 =?utf-8?B?VUxwVWJuak5IRGlHbXAyRXNEQW45NnBzcmY2L0RLSE1VNWdHTlJ6VGNtME1l?=
 =?utf-8?B?VUJucFhxblBTL1BISUE0SkdiUWp2VDd6UXViN0FDN1A4di9lMFhkaFJUQUZp?=
 =?utf-8?B?UHIwTlpSOGpEVjViY1dKT3pXWEhOeXVFQ1BZZU1UTlZRZFZuN0RQc2xuNzZw?=
 =?utf-8?B?QlZNQ2czV2N6cXlaR3BpdkM3QzBZdU9nakI1RDd4SzBNM2pRSVB3OTVQbkZ4?=
 =?utf-8?B?OEF0dGhyc1lYZzYxeS9MbG1MUThjeHJjVFdDRGMzemtvZnlXYlhuMTgzN3Fz?=
 =?utf-8?B?RHBIWmFaVndnYjhpNmU5Z0VTa3QrNTVPQzkwMHBrOFBmQUVXVnNwaFhiTTFs?=
 =?utf-8?B?RDNtT2l6dHMrNjErUkVKRFRvS1JtUkxocG82YTIzQ0Y2WmdYWUFEdzJZRGh4?=
 =?utf-8?B?VmJNUWNYb3FyUDJ6a25VdC85dFpvN0JCUWc2L3lMZDU5cDk3QURRZm52bjBM?=
 =?utf-8?B?NnlhNGVIMk53cThZeHpnMDZtbUo3QytzMnhiaWNHTFNVK1hqUjRibndaZFBN?=
 =?utf-8?B?cHgvdXh5V2oveVJsNEJwNVVmdTZmYUlwQ3c4Z2IyOGtYb3pFMWxQSTJBcENo?=
 =?utf-8?B?NGhxdWx0V3N3Q3NqbjY2WllxOFNjbHdMYVFLUDk4WmU5WXVVclgrdkR0VmZr?=
 =?utf-8?B?aHFWQTNXZHd0Yld1dGorYWR5WDBOWFB4eTJSSlEyYlpIQzI1VGo5ZXpIeXE0?=
 =?utf-8?B?WWg4bXF6bkUySUYyYzUvRWZhTjVUbVBVWUJVb1BkOXc3RHhsck1Za0Q0VHc4?=
 =?utf-8?B?TkVEWmxEa29TUXQzZGZLNGkxZ3R2elVVdElzQWRSd0NaTDVhSmt3ajd4WXlz?=
 =?utf-8?B?cTJIVDJIaHpDcFpxWlNlb3NGYUx0V1Ywdk5FdTlIQU9OYXZIaTJiSGQvTXU1?=
 =?utf-8?B?R1dGb3V1LzhnR1dKNEsydFQvL01LbytiMURBOU9xMDVmSnFCekZRYlp0alVV?=
 =?utf-8?B?Z3d5bHAzbTlmSVRmQzVuMnF4TGd5V01BN2tkY0pEdStObFB2bnhLYXBLRUsv?=
 =?utf-8?B?UGJ3VHdLT2swQ3o3WG9TTWR1MDdGMC94dm1VOTFtcEl1a0VZVlQzTTRYTHg3?=
 =?utf-8?B?cGJrSldvL01Pd2VXNnJ3cGtxR2h0ZlNrL1orN3ZPVmdvbmxGZGNNTXNrUm5k?=
 =?utf-8?B?ZGNxT3BEOEIxajNIS2p6eUdiNTkvVGxUd0IrWVRhNU9HRDdLRno1V2hRN0o4?=
 =?utf-8?B?UVgvOS9NcWIwZENGY3lpTm1JSkJOakx6NVl2cjFQMDdqV0I3ZkVzNUpSUFdu?=
 =?utf-8?B?ajJUWDllcnNFS3FldWJDRnpzaUpaWjFKenc0eWtHMkhJR1lBZmVhbE9uOGZL?=
 =?utf-8?B?ejJ6dFkzenRGKzluN0tOdjJEQWo1U2M5MW5paEZaNi81S3VTQnNta3gzOVYy?=
 =?utf-8?B?Z3ZRT0QrUXJUVUp1VEVTMklzYnNYSWo1NkwvaEY0d21wT0I5OXhUeWdjSS9k?=
 =?utf-8?B?TG9FdWZiRW5HcDZEWUFzWkdGa3JpY2RJYkdhREpXTjdObUlKVzNlbGZRM24z?=
 =?utf-8?B?dXRwcGZxemtnOUlNYjBjNEF5STFjbktNQ0xBbWNNTFNNVXBENGQxZm12cHJa?=
 =?utf-8?B?dzBPQnM2dWZjUkI2YnB3azNycGtuQ0MvRVhjWWtZeDNzNkhDeGhWUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D659BC2427315F46A6F2A86225A1CF25@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23f5d998-26ae-4ff2-fb0e-08d99ea80922
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2021 08:57:59.3412
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: In6VdzC3eNbg8CKrtnZ++O1nSI0qUyXhP+orcuxyjJptN6CCAVPiFTr4qpkMWlCndSzT615fZNps27k4XrrSS1KjSybBv3MmPbIhboIGaHtpgQpxFJZpcJMKS6e0tco8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5796
X-Proofpoint-ORIG-GUID: IM7DbjVdSzppLuM8fcjvMXlPtaR4CXVB
X-Proofpoint-GUID: IM7DbjVdSzppLuM8fcjvMXlPtaR4CXVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-03_02,2021-11-02_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111030052

DQoNCk9uIDAzLjExLjIxIDEwOjQxLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMDMuMTEuMjAy
MSAwNzozNCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBIaSwgUm9nZXINCj4+
DQo+PiBPbiAyNi4xMC4yMSAxNDozMywgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4+PiBPbiBU
aHUsIFNlcCAzMCwgMjAyMSBhdCAxMDo1MjoyMkFNICswMzAwLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pg0KPj4+PiBBc3NpZ24gU0JERiB0byB0aGUg
UENJIGRldmljZXMgYmVpbmcgcGFzc2VkIHRocm91Z2ggd2l0aCBidXMgMC4NCj4+Pj4gVGhlIHJl
c3VsdGluZyB0b3BvbG9neSBpcyB3aGVyZSBQQ0llIGRldmljZXMgcmVzaWRlIG9uIHRoZSBidXMg
MCBvZiB0aGUNCj4+Pj4gcm9vdCBjb21wbGV4IGl0c2VsZiAoZW1iZWRkZWQgZW5kcG9pbnRzKS4N
Cj4+Pj4gVGhpcyBpbXBsZW1lbnRhdGlvbiBpcyBsaW1pdGVkIHRvIDMyIGRldmljZXMgd2hpY2gg
YXJlIGFsbG93ZWQgb24NCj4+Pj4gYSBzaW5nbGUgUENJIGJ1cy4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtv
QGVwYW0uY29tPg0KPj4+Pg0KPj4+PiAtLS0NCj4+Pj4gU2luY2UgdjI6DQo+Pj4+ICAgIC0gcmVt
b3ZlIGNhc3RzIHRoYXQgYXJlIChhKSBtYWxmb3JtZWQgYW5kIChiKSB1bm5lY2Vzc2FyeQ0KPj4+
PiAgICAtIGFkZCBuZXcgbGluZSBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5DQo+Pj4+ICAgIC0gcmVt
b3ZlIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JUIGlmZGVmJ3MgYXMgdGhlIHJlbGV2YW50
IHZQQ0kNCj4+Pj4gICAgICAgZnVuY3Rpb25zIGFyZSBub3cgY29tcGxldGVseSBnYXRlZCB3aXRo
IHRoaXMgY29uZmlnDQo+Pj4+ICAgIC0gZ2F0ZSBjb21tb24gY29kZSB3aXRoIENPTkZJR19IQVNf
VlBDSV9HVUVTVF9TVVBQT1JUDQo+Pj4+IE5ldyBpbiB2Mg0KPj4+PiAtLS0NCj4+Pj4gICAgeGVu
L2NvbW1vbi9kb21haW4uYyAgICAgICAgICAgfCAgMyArKw0KPj4+PiAgICB4ZW4vZHJpdmVycy9w
YXNzdGhyb3VnaC9wY2kuYyB8IDYwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+Pj4+ICAgIHhlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jICAgICAgIHwgMTQgKysrKysrKy0NCj4+
Pj4gICAgeGVuL2luY2x1ZGUveGVuL3BjaS5oICAgICAgICAgfCAyMiArKysrKysrKysrKysrDQo+
Pj4+ICAgIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oICAgICAgIHwgIDggKysrKysNCj4+Pj4gICAg
NSBmaWxlcyBjaGFuZ2VkLCAxMDYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pg0K
Pj4+PiBkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9kb21haW4uYyBiL3hlbi9jb21tb24vZG9tYWlu
LmMNCj4+Pj4gaW5kZXggNDBkNjdlYzM0MjMyLi5lMDE3MDA4NzYxMmQgMTAwNjQ0DQo+Pj4+IC0t
LSBhL3hlbi9jb21tb24vZG9tYWluLmMNCj4+Pj4gKysrIGIveGVuL2NvbW1vbi9kb21haW4uYw0K
Pj4+PiBAQCAtNjAxLDYgKzYwMSw5IEBAIHN0cnVjdCBkb21haW4gKmRvbWFpbl9jcmVhdGUoZG9t
aWRfdCBkb21pZCwNCj4+Pj4gICAgDQo+Pj4+ICAgICNpZmRlZiBDT05GSUdfSEFTX1BDSQ0KPj4+
PiAgICAgICAgSU5JVF9MSVNUX0hFQUQoJmQtPnBkZXZfbGlzdCk7DQo+Pj4+ICsjaWZkZWYgQ09O
RklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4gKyAgICBJTklUX0xJU1RfSEVBRCgmZC0+
dmRldl9saXN0KTsNCj4+Pj4gKyNlbmRpZg0KPj4+PiAgICAjZW5kaWYNCj4+Pj4gICAgDQo+Pj4+
ICAgICAgICAvKiBBbGwgZXJyb3IgcGF0aHMgY2FuIGRlcGVuZCBvbiB0aGUgYWJvdmUgc2V0dXAu
ICovDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jDQo+Pj4+IGluZGV4IDgwNWFiODZlZDU1NS4uNWI5
NjNkNzVkMWJhIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2ku
Yw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+PiBAQCAtODMx
LDYgKzgzMSw2NiBAQCBpbnQgcGNpX3JlbW92ZV9kZXZpY2UodTE2IHNlZywgdTggYnVzLCB1OCBk
ZXZmbikNCj4+Pj4gICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICAgIH0NCj4+Pj4gICAgDQo+Pj4+
ICsjaWZkZWYgQ09ORklHX0hBU19WUENJX0dVRVNUX1NVUFBPUlQNCj4+Pj4gK3N0YXRpYyBzdHJ1
Y3QgdnBjaV9kZXYgKnBjaV9maW5kX3ZpcnR1YWxfZGV2aWNlKGNvbnN0IHN0cnVjdCBkb21haW4g
KmQsDQo+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3Qg
dnBjaV9kZXYgKnZkZXY7DQo+Pj4+ICsNCj4+Pj4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICgg
dmRldiwgJmQtPnZkZXZfbGlzdCwgbGlzdCApDQo+Pj4+ICsgICAgICAgIGlmICggdmRldi0+cGRl
diA9PSBwZGV2ICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiB2ZGV2Ow0KPj4+PiArICAgIHJl
dHVybiBOVUxMOw0KPj4+PiArfQ0KPj4+PiArDQo+Pj4+ICtpbnQgcGNpX2FkZF92aXJ0dWFsX2Rl
dmljZShzdHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+Pj4g
K3sNCj4+Pj4gKyAgICBzdHJ1Y3QgdnBjaV9kZXYgKnZkZXY7DQo+Pj4+ICsNCj4+Pj4gKyAgICBB
U1NFUlQoIXBjaV9maW5kX3ZpcnR1YWxfZGV2aWNlKGQsIHBkZXYpKTsNCj4+Pj4gKw0KPj4+PiAr
ICAgIC8qIEVhY2ggUENJIGJ1cyBzdXBwb3J0cyAzMiBkZXZpY2VzL3Nsb3RzIGF0IG1heC4gKi8N
Cj4+Pj4gKyAgICBpZiAoIGQtPnZwY2lfZGV2X25leHQgPiAzMSApDQo+Pj4+ICsgICAgICAgIHJl
dHVybiAtRU5PU1BDOw0KPj4+PiArDQo+Pj4+ICsgICAgdmRldiA9IHh6YWxsb2Moc3RydWN0IHZw
Y2lfZGV2KTsNCj4+Pj4gKyAgICBpZiAoICF2ZGV2ICkNCj4+Pj4gKyAgICAgICAgcmV0dXJuIC1F
Tk9NRU07DQo+Pj4+ICsNCj4+Pj4gKyAgICAvKiBXZSBlbXVsYXRlIGEgc2luZ2xlIGhvc3QgYnJp
ZGdlIGZvciB0aGUgZ3Vlc3QsIHNvIHNlZ21lbnQgaXMgYWx3YXlzIDAuICovDQo+Pj4+ICsgICAg
dmRldi0+c2VnID0gMDsNCj4+Pj4gKw0KPj4+PiArICAgIC8qDQo+Pj4+ICsgICAgICogVGhlIGJ1
cyBudW1iZXIgaXMgc2V0IHRvIDAsIHNvIHZpcnR1YWwgZGV2aWNlcyBhcmUgc2Vlbg0KPj4+PiAr
ICAgICAqIGFzIGVtYmVkZGVkIGVuZHBvaW50cyBiZWhpbmQgdGhlIHJvb3QgY29tcGxleC4NCj4+
Pj4gKyAgICAgKi8NCj4+Pj4gKyAgICB2ZGV2LT5idXMgPSAwOw0KPj4+PiArICAgIHZkZXYtPmRl
dmZuID0gUENJX0RFVkZOKGQtPnZwY2lfZGV2X25leHQrKywgMCk7DQo+Pj4gVGhpcyB3b3VsZCBs
aWtlbHkgYmUgYmV0dGVyIGFzIGEgYml0bWFwIHdoZXJlIHlvdSBzZXQgdGhlIGJpdHMgb2YNCj4+
PiBpbi11c2Ugc2xvdHMuIFRoZW4geW91IGNhbiB1c2UgZmluZF9maXJzdF9iaXQgb3Igc2ltaWxh
ciB0byBnZXQgYSBmcmVlDQo+Pj4gc2xvdC4NCj4+Pg0KPj4+IExvbmcgdGVybSB5b3UgbWlnaHQg
d2FudCB0byBhbGxvdyB0aGUgY2FsbGVyIHRvIHByb3ZpZGUgYSBwcmUtc2VsZWN0ZWQNCj4+PiBz
bG90LCBhcyBpdCdzIHBvc3NpYmxlIGZvciB1c2VycyB0byByZXF1ZXN0IHRoZSBkZXZpY2UgdG8g
YXBwZWFyIGF0IGENCj4+PiBzcGVjaWZpYyBzbG90IG9uIHRoZSBlbXVsYXRlZCBidXMuDQo+Pj4N
Cj4+Pj4gKw0KPj4+PiArICAgIHZkZXYtPnBkZXYgPSBwZGV2Ow0KPj4+PiArICAgIHZkZXYtPmRv
bWFpbiA9IGQ7DQo+Pj4+ICsNCj4+Pj4gKyAgICBwY2lkZXZzX2xvY2soKTsNCj4+Pj4gKyAgICBs
aXN0X2FkZF90YWlsKCZ2ZGV2LT5saXN0LCAmZC0+dmRldl9saXN0KTsNCj4+Pj4gKyAgICBwY2lk
ZXZzX3VubG9jaygpOw0KPj4+PiArDQo+Pj4+ICsgICAgcmV0dXJuIDA7DQo+Pj4+ICt9DQo+Pj4+
ICsNCj4+Pj4gK2ludCBwY2lfcmVtb3ZlX3ZpcnR1YWxfZGV2aWNlKHN0cnVjdCBkb21haW4gKmQs
IGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+PiArICAgIHN0cnVjdCB2
cGNpX2RldiAqdmRldjsNCj4+Pj4gKw0KPj4+PiArICAgIHBjaWRldnNfbG9jaygpOw0KPj4+PiAr
ICAgIHZkZXYgPSBwY2lfZmluZF92aXJ0dWFsX2RldmljZShkLCBwZGV2KTsNCj4+Pj4gKyAgICBp
ZiAoIHZkZXYgKQ0KPj4+PiArICAgICAgICBsaXN0X2RlbCgmdmRldi0+bGlzdCk7DQo+Pj4+ICsg
ICAgcGNpZGV2c191bmxvY2soKTsNCj4+Pj4gKyAgICB4ZnJlZSh2ZGV2KTsNCj4+Pj4gKyAgICBy
ZXR1cm4gMDsNCj4+Pj4gK30NCj4+Pj4gKyNlbmRpZiAvKiBDT05GSUdfSEFTX1ZQQ0lfR1VFU1Rf
U1VQUE9SVCAqLw0KPj4+PiArDQo+Pj4+ICAgIC8qIENhbGxlciBzaG91bGQgaG9sZCB0aGUgcGNp
ZGV2c19sb2NrICovDQo+Pj4+ICAgIHN0YXRpYyBpbnQgZGVhc3NpZ25fZGV2aWNlKHN0cnVjdCBk
b21haW4gKmQsIHVpbnQxNl90IHNlZywgdWludDhfdCBidXMsDQo+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQ4X3QgZGV2Zm4pDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vZHJp
dmVycy92cGNpL3ZwY2kuYyBiL3hlbi9kcml2ZXJzL3ZwY2kvdnBjaS5jDQo+Pj4+IGluZGV4IDcw
MmY3YjVkNWRkYS4uZDc4N2YxM2U2NzllIDEwMDY0NA0KPj4+PiAtLS0gYS94ZW4vZHJpdmVycy92
cGNpL3ZwY2kuYw0KPj4+PiArKysgYi94ZW4vZHJpdmVycy92cGNpL3ZwY2kuYw0KPj4+PiBAQCAt
OTEsMjAgKzkxLDMyIEBAIGludCBfX2h3ZG9tX2luaXQgdnBjaV9hZGRfaGFuZGxlcnMoc3RydWN0
IHBjaV9kZXYgKnBkZXYpDQo+Pj4+ICAgIC8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGFz
c2lnbmVkIHRvIGd1ZXN0LiAqLw0KPj4+PiAgICBpbnQgdnBjaV9hc3NpZ25fZGV2aWNlKHN0cnVj
dCBkb21haW4gKmQsIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpkZXYpDQo+Pj4+ICAgIHsNCj4+Pj4g
KyAgICBpbnQgcmM7DQo+Pj4+ICsNCj4+Pj4gICAgICAgIC8qIEl0IG9ubHkgbWFrZXMgc2Vuc2Ug
dG8gYXNzaWduIGZvciBod2RvbSBvciBndWVzdCBkb21haW4uICovDQo+Pj4+ICAgICAgICBpZiAo
IGlzX3N5c3RlbV9kb21haW4oZCkgfHwgIWhhc192cGNpKGQpICkNCj4+Pj4gICAgICAgICAgICBy
ZXR1cm4gMDsNCj4+Pj4gICAgDQo+Pj4+IC0gICAgcmV0dXJuIHZwY2lfYmFyX2FkZF9oYW5kbGVy
cyhkLCBkZXYpOw0KPj4+PiArICAgIHJjID0gdnBjaV9iYXJfYWRkX2hhbmRsZXJzKGQsIGRldik7
DQo+Pj4+ICsgICAgaWYgKCByYyApDQo+Pj4+ICsgICAgICAgIHJldHVybiByYzsNCj4+Pj4gKw0K
Pj4+PiArICAgIHJldHVybiBwY2lfYWRkX3ZpcnR1YWxfZGV2aWNlKGQsIGRldik7DQo+Pj4+ICAg
IH0NCj4+Pj4gICAgDQo+Pj4+ICAgIC8qIE5vdGlmeSB2UENJIHRoYXQgZGV2aWNlIGlzIGRlLWFz
c2lnbmVkIGZyb20gZ3Vlc3QuICovDQo+Pj4+ICAgIGludCB2cGNpX2RlYXNzaWduX2RldmljZShz
dHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPj4+PiAgICB7DQo+
Pj4+ICsgICAgaW50IHJjOw0KPj4+PiArDQo+Pj4+ICAgICAgICAvKiBJdCBvbmx5IG1ha2VzIHNl
bnNlIHRvIGRlLWFzc2lnbiBmcm9tIGh3ZG9tIG9yIGd1ZXN0IGRvbWFpbi4gKi8NCj4+Pj4gICAg
ICAgIGlmICggaXNfc3lzdGVtX2RvbWFpbihkKSB8fCAhaGFzX3ZwY2koZCkgKQ0KPj4+PiAgICAg
ICAgICAgIHJldHVybiAwOw0KPj4+PiAgICANCj4+Pj4gKyAgICByYyA9IHBjaV9yZW1vdmVfdmly
dHVhbF9kZXZpY2UoZCwgZGV2KTsNCj4+Pj4gKyAgICBpZiAoIHJjICkNCj4+Pj4gKyAgICAgICAg
cmV0dXJuIHJjOw0KPj4+PiArDQo+Pj4+ICAgICAgICByZXR1cm4gdnBjaV9iYXJfcmVtb3ZlX2hh
bmRsZXJzKGQsIGRldik7DQo+Pj4+ICAgIH0NCj4+Pj4gICAgI2VuZGlmIC8qIENPTkZJR19IQVNf
VlBDSV9HVUVTVF9TVVBQT1JUICovDQo+Pj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94ZW4v
cGNpLmggYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+Pj4gaW5kZXggNDNiOGEwODE3MDc2Li4z
MzAzM2EzYThmOGQgMTAwNjQ0DQo+Pj4+IC0tLSBhL3hlbi9pbmNsdWRlL3hlbi9wY2kuaA0KPj4+
PiArKysgYi94ZW4vaW5jbHVkZS94ZW4vcGNpLmgNCj4+Pj4gQEAgLTEzNyw2ICsxMzcsMjQgQEAg
c3RydWN0IHBjaV9kZXYgew0KPj4+PiAgICAgICAgc3RydWN0IHZwY2kgKnZwY2k7DQo+Pj4+ICAg
IH07DQo+Pj4+ICAgIA0KPj4+PiArI2lmZGVmIENPTkZJR19IQVNfVlBDSV9HVUVTVF9TVVBQT1JU
DQo+Pj4+ICtzdHJ1Y3QgdnBjaV9kZXYgew0KPj4+PiArICAgIHN0cnVjdCBsaXN0X2hlYWQgbGlz
dDsNCj4+Pj4gKyAgICAvKiBQaHlzaWNhbCBQQ0kgZGV2aWNlIHRoaXMgdmlydHVhbCBkZXZpY2Ug
aXMgY29ubmVjdGVkIHRvLiAqLw0KPj4+PiArICAgIGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2
Ow0KPj4+PiArICAgIC8qIFZpcnR1YWwgU0JERiBvZiB0aGUgZGV2aWNlLiAqLw0KPj4+PiArICAg
IHVuaW9uIHsNCj4+Pj4gKyAgICAgICAgc3RydWN0IHsNCj4+Pj4gKyAgICAgICAgICAgIHVpbnQ4
X3QgZGV2Zm47DQo+Pj4+ICsgICAgICAgICAgICB1aW50OF90IGJ1czsNCj4+Pj4gKyAgICAgICAg
ICAgIHVpbnQxNl90IHNlZzsNCj4+Pj4gKyAgICAgICAgfTsNCj4+Pj4gKyAgICAgICAgcGNpX3Ni
ZGZfdCBzYmRmOw0KPj4+PiArICAgIH07DQo+Pj4+ICsgICAgc3RydWN0IGRvbWFpbiAqZG9tYWlu
Ow0KPj4+PiArfTsNCj4+Pj4gKyNlbmRpZg0KPj4+IEkgd29uZGVyIHdoZXRoZXIgdGhpcyBpcyBz
dHJpY3RseSBuZWVkZWQuIFdvbid0IGl0IGJlIGVub3VnaCB0byBzdG9yZQ0KPj4+IHRoZSB2aXJ0
dWFsIChpZTogZ3Vlc3QpIHNiZGYgaW5zaWRlIHRoZSBleGlzdGluZyB2cGNpIHN0cnVjdD8NCj4+
Pg0KPj4+IEl0IHdvdWxkIGF2b2lkIHRoZSBvdmVyaGVhZCBvZiB0aGUgdHJhbnNsYXRpb24geW91
IGRvIGZyb20gcGRldiAtPg0KPj4+IHZkZXYsIGFuZCB0aGVyZSBkb2Vzbid0IHNlZW0gdG8gYmUg
YW55dGhpbmcgcmVsZXZhbnQgc3RvcmVkIGluDQo+Pj4gdnBjaV9kZXYgYXBhcnQgZnJvbSB0aGUg
dmlydHVhbCBzYmRmLg0KPj4gVEw7RFIgSXQgc2VlbXMgaXQgbWlnaHQgYmUgbmVlZGVkIGZyb20g
cGVyZm9ybWFuY2UgUE9WLiBJZiBub3QgaW1wbGVtZW50ZWQNCj4+IGZvciBldmVyeSBNTUlPIHRy
YXAgd2UgdXNlIGEgZ2xvYmFsIFBDSSBsb2NrLCBlLmcuIHBjaWRldnNfe2xvY2t8dW5sb2NrfS4N
Cj4+IE5vdGU6IHBjaWRldnMnIGxvY2sgaXMgYSByZWN1cnNpdmUgbG9jaw0KPj4NCj4+IFRoZXJl
IGFyZSAyIHNvdXJjZXMgb2YgYWNjZXNzIHRvIHZpcnR1YWwgZGV2aWNlczoNCj4+IDEuIER1cmlu
ZyBpbml0aWFsaXphdGlvbiB3aGVuIHdlIGFkZCwgYXNzaWduIG9yIGRlLWFzc2lnbiBhIFBDSSBk
ZXZpY2UNCj4+IDIuIEF0IHJ1bi10aW1lIHdoZW4gd2UgdHJhcCBjb25maWd1cmF0aW9uIHNwYWNl
IGFjY2VzcyBhbmQgbmVlZCB0bw0KPj4gdHJhbnNsYXRlIHZpcnR1YWwgU0JERiBpbnRvIHBoeXNp
Y2FsIFNCREYNCj4+IDMuIEF0IGxlYXN0IGRlLWFzc2lnbiBjYW4gcnVuIGNvbmN1cnJlbnRseSB3
aXRoIE1NSU8gaGFuZGxlcnMNCj4+DQo+PiBOb3cgbGV0J3Mgc2VlIHdoaWNoIGxvY2tzIGFyZSBp
biB1c2Ugd2hpbGUgZG9pbmcgdGhhdC4NCj4+DQo+PiAxLiBObyBzdHJ1Y3QgdnBjaV9kZXYgaXMg
dXNlZC4NCj4+IDEuMS4gV2UgcmVtb3ZlIHRoZSBzdHJ1Y3R1cmUgYW5kIGp1c3QgYWRkIHBkZXYt
PnZwY2ktPmd1ZXN0X3NiZGYgYXMgeW91IHN1Z2dlc3QNCj4+IDEuMi4gVG8gcHJvdGVjdCB2aXJ0
dWFsIGRldmljZXMgd2UgdXNlIHBjaWRldnNfe2xvY2t8dW5sb2NrfQ0KPj4gMS4zLiBMb2NraW5n
IGhhcHBlbnMgb24gc3lzdGVtIGxldmVsDQo+Pg0KPj4gMi4gc3RydWN0IHZwY2lfZGV2IGlzIHVz
ZWQNCj4+IDIuMS4gV2UgaGF2ZSBhIHBlci1kb21haW4gbG9jayB2ZGV2X2xvY2sNCj4+IDIuMi4g
TG9ja2luZyBoYXBwZW5zIG9uIHBlciBkb21haW4gbGV2ZWwNCj4+DQo+PiBUbyBjb21wYXJlIHRo
ZSB0d286DQo+Pg0KPj4gMS4gV2l0aG91dCB2cGNpX2Rldg0KPj4gcHJvczogbXVjaCBzaW1wbGVy
IGNvZGUNCj4+IHByb3MvY29uczogZ2xvYmFsIGxvY2sgaXMgdXNlZCBkdXJpbmcgTU1JTyBoYW5k
bGluZywgYnV0IGl0IGlzIGEgcmVjdXJzaXZlIGxvY2sNCj4gQ291bGQgeW91IHBvaW50IG91dCB0
byBtZSBpbiB3aGljaCB3YXkgdGhlIHJlY3Vyc2l2ZSBuYXR1cmUgb2YgdGhlIGxvY2sNCj4gaXMg
cmVsZXZhbnQgaGVyZT8gQWZhaWN0IHRoYXQgYXNwZWN0IGlzIG9mIG5vIGludGVyZXN0IHdoZW4g
Y29uc2lkZXJpbmcNCj4gdGhlIHBlcmZvcm1hbmNlIGVmZmVjdHMgb2YgdXNpbmcgYSBnbG9iYWwg
bG9jayB2cyBvbmUgd2l0aCBtb3JlIG5hcnJvdw0KPiBzY29wZS4NCkkganVzdCB0cmllZCB0byBm
aW5kIHNvbWUgZXhjdXNlcyBhbmQgZGVmZW5kIHBjaWRldidzIGdsb2JhbCBsb2NrLA0Kc28gZXZl
biBsb2NrJ3MgcmVjdXJzaW9uIGNvdWxkIGJlIGFuIGFyZ3VtZW50IGhlcmUuIFdlYWsuDQpCZXNp
ZGVzIHRoYXQgSSBkbyBhZ3JlZSB0aGF0IHRoaXMgaXMgc3RpbGwgYSBnbG9iYWwgbG9jay4NCj4N
Cj4gSmFuDQo+DQo=

