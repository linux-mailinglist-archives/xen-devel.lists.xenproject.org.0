Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB43A43E806
	for <lists+xen-devel@lfdr.de>; Thu, 28 Oct 2021 20:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218222.378561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9q9-0006Kl-4R; Thu, 28 Oct 2021 18:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218222.378561; Thu, 28 Oct 2021 18:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mg9q9-0006II-12; Thu, 28 Oct 2021 18:09:25 +0000
Received: by outflank-mailman (input) for mailman id 218222;
 Thu, 28 Oct 2021 18:09:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ikAZ=PQ=epam.com=prvs=19352d112c=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mg9q8-0006IC-2e
 for xen-devel@lists.xenproject.org; Thu, 28 Oct 2021 18:09:24 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2dc422c4-381a-11ec-84b0-12813bfff9fa;
 Thu, 28 Oct 2021 18:09:23 +0000 (UTC)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19SHwsE6032090; 
 Thu, 28 Oct 2021 18:09:21 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 by mx0b-0039f301.pphosted.com with ESMTP id 3c00qxr1gu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Oct 2021 18:09:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3587.eurprd03.prod.outlook.com (2603:10a6:208:44::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Thu, 28 Oct
 2021 18:09:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%9]) with mapi id 15.20.4649.015; Thu, 28 Oct 2021
 18:09:19 +0000
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
X-Inumbo-ID: 2dc422c4-381a-11ec-84b0-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0n9luGLj/ZXa/p3bMPZq0KBxwMRBG5/UzS8yfi0NuTeaLMDEyJ7B01o1bKXQb2kXLish/s/GioLWN2fIov15fTv+KcI8k7GFiGv+GFCxrR+AgqZB+KkOi9Q3iwUiBvO3s7LveNjALHjs8App3dluTEK4i04Ux2z97pTNRNtY3Gmhe+fMHe0B+HHWgDlAQQIZBwkk6+t4N5qafCmjjwEnthy7VYQmhKSPqsZ1+wcjGYEqi1mY9Ot50Z++RXnEjK7z75JLBL2Gyua5mHUFKerOP2Q3QsWNDqO8+mmCmttcu6MGykHB70AucgHbFmjuONqHKqffyhZtIervfTWinKgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tCVOlmoi5k3p/KxFgnd0uAiN1JjQp/1/AWb1Vk1P7/Y=;
 b=Hy/KeAQCZO6gQa+x7d8UbpN91Kw4UKlIfmvmsWyoPBWRDSTxkWdtr3Q+MbmCi3VOFrq7K48P5mONe3Br/M66BKQLeONrxvWhmiMPCZjc2mY+lCA6/lJ/WYOALxfwOf2zRsPssK9IH8qyuZDsWqRurMCQLLefZXm6MvnVKeQ2o2ZGMzZA+5B0MEmhHv8/wQo6iy1C5X/FeM0xJm0U644Q6vjH+alep3GD6tndS99L7OekoHye1DqdCa4tRpd2H01lcg8/L6EFNRtvHwUa/7W4/NeShJM2dI0AgNkQ+xED45uxasAskr/xsKjDtRukm7xUokk/ZUF04SrO7NOfc+hmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCVOlmoi5k3p/KxFgnd0uAiN1JjQp/1/AWb1Vk1P7/Y=;
 b=PQHjLGfteEdjmbUOolLnia1FxC2WFG7RM9u2rQVz6bvLHRSvaeYg13ap3l0nTzK1VFinA4QL16UaxPsZG8bPLiPjYGnXjfg+uXxK1EwxCU/hu8HaDmmWQb5UVSOkvkhYINIAlEjKnQVJbFLXMXLntqYYQ1FRsNWwmyJ2KFP1afwCJuLtOoUmH9fq91XzHf0XN2GLtvHECLYDMkaGos6Y0Am32yb9o05rXdFu7pc7xC0JdBzYgJGhwSS66vR45xzG7fwaqtDJ/I0mHCy2RvV1FzPEGhHYR1n13RybZdg6ObFjo7ABw7vrPo1bVNWMZreBdrpd2jbvql4UrL4MM0UZWA==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        "iwj@xenproject.org" <iwj@xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Topic: [PATCH] xen/arm: do not try to add pci-domain for disabled
 devices
Thread-Index: AQHXyw3lMiQK+jRYtUWdkzZ53OfPJavnJMeAgABhyQCAALX3gIAAZSoAgAAWCQA=
Date: Thu, 28 Oct 2021 18:09:19 +0000
Message-ID: <c90be094-ea45-1388-436c-ccb27801ac5a@epam.com>
References: <20211027083730.1406947-1-andr2000@gmail.com>
 <7a97bbef-68a9-8f52-0c93-88d4e84a07fc@xen.org>
 <alpine.DEB.2.21.2110271649240.20134@sstabellini-ThinkPad-T480s>
 <c3602294-0ab4-10df-77cc-2a9e13ddc73f@xen.org>
 <alpine.DEB.2.21.2110280948190.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110280948190.20134@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43fe67e2-0cda-4e79-d3e3-08d99a3e0fd0
x-ms-traffictypediagnostic: AM0PR03MB3587:
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB3587E16C0FCF99413CA53005E7869@AM0PR03MB3587.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 53wO+AA9XOotcQm/pkoEGA1Xv6Lx6M75qL+XfcXuYfHEySOpTLYNr5y3AKd2g99PvebM8TG0Up1h9aSeQbG+JQCOBrzbRYIs5oFa6vKD5US1ZFccukkS6XWpn+2Tz0RHv4eRFr45UpREyeKpdunDRsGleT5xMwVQBzQHIJyL6iZUJ6XMgrNxiflM0ej7a1sWP5i2JC+HBWEcXCTgnOxRWprEgjag28sh8V22/o5QS3li9Ge8SESmpDcqwSQs0HtBLi4UpkXaqEqkeX8ddnHeLmQjQ4NXVbSp9dqq3tZVZT8ETM+6pin/tHM9OOM68BDk/EodBNjrq2Sg5Cbr2VXzk/1AC62rFM1ZbCyyYAELtP7gbHncVvC5gGO6wz8BHDYkWLaWUh28FUUtoOKbuyzbzROUKcW1nFI7Gzu8AysnPjCd+Bz+XoOGRV6GpUdYOWm+tnWXKx4q2rObZegc1JjjZ8wPbM1rlWWD63XAtMDaDN739RhN4VBv6tOs4kIJ+UaCvTtmJ2PAJxIpDLrHJwEMoVkx/GG7zLnPKAgnmD8mbAtscy3YJfQomw1S+rWPNP7K7KCEqlXYLT2Ff4b7XP/3Noe+wrZ/9k9Zz6nN39gd3kwX+UWkOuhovf3jHxYLYk6SNs6Dl81KpLmEhnch71wCJ3vO39XYyINQjk4/CdW2WjUb0dT8U9a76EVLpS4Vig8iqA1d8cHHSRmfJ0nrH14RASzTTlAqp9mJ6BFu+0HMASE5wxbSX5CS1sBIMx8URS71
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(86362001)(31686004)(122000001)(38070700005)(36756003)(38100700002)(316002)(54906003)(110136005)(2616005)(6486002)(5660300002)(71200400001)(76116006)(26005)(66946007)(91956017)(64756008)(107886003)(4326008)(186003)(53546011)(83380400001)(6506007)(66446008)(508600001)(31696002)(6512007)(2906002)(66476007)(66556008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?a3RabkdGYy85ZzFNZ29PaVNMNFB0d0JZNW02NjJOeGxZRjU3RjFXeTArVXk2?=
 =?utf-8?B?RVRXeXVKTkwzTmhjM05udk9lc0kzNm9hQnB0bThIbncwVE5pSVBtYnpJa1pn?=
 =?utf-8?B?K0VIejlPYncrL1NkeUt6MFdZbTRocDREYVljWXd6akNOUzBWQis0Rk03RWxr?=
 =?utf-8?B?b0NGRDIyUWNvbTlFdmkrK2R4ODhBR3V3aHhzakhnaWtZOXUzWDA2QzdRZHVr?=
 =?utf-8?B?UXlONFF6VGQ2ZzBmNzFDSVR6bkhsMndPdmliR0JNUDNCdW9Bdjlnckt2dlcz?=
 =?utf-8?B?M1FYYkhMTzVHTncvMGQ5RGNwV3BXNkgyK3dSRm5mT3RMRkxqMHVKVElXWHNi?=
 =?utf-8?B?Qzh1UWVtdWJ5ZEJ2R1Q0bVhPYUU3N2lGQXlIMGhKRERRZE9jZ1F1dVprWC9B?=
 =?utf-8?B?SDZwRnAxRDAzcEIwUlRmcTQzZDF5RzZacm9CTU5KS3llMU1qMnU1bzlpQ2N2?=
 =?utf-8?B?TDN3MnZPakNXNk1LVy9YYklBUlpPY2ROSkEwMERpc0FFV0pWU25RYS84alpx?=
 =?utf-8?B?aWRiMmhxL0IxUEFZZ2p3LzJmVEZud2xwTG9nWDZncGkxVnJwOVU3ZmovSU9y?=
 =?utf-8?B?VWEyY3M0ZWkzUDk0SWxhZDR2K0drb2FtcTJ3VE1tZ3ZTaFhZcmh2R1JVcm1G?=
 =?utf-8?B?WnFncDVSSFZscEF0bHl3b0JxYWxoWE13YUVnUjVUYWUxUUNsbG5NTFpZcEhh?=
 =?utf-8?B?NVhYV21kZk9URnZrZ1d1Q0tjSlh6aHlINXgyeEVXZEJHZ0xha3I5LzdIbFAz?=
 =?utf-8?B?ckNQMXFYNyt4VElzUjRFcWJ1M3M4cGJ5RXFwbzZSd0t6QXZYZXdtQjJWRHNM?=
 =?utf-8?B?dmRtRktMRUx6K2ZqUXpYSEQ1WTdXQzhROHFBbzNTdjRNOGVJd29lVGtBWUZy?=
 =?utf-8?B?Vk1LdG13Wkx4dlBvS1pIcEpmNXRreE9VejVobno3dUJSdncwTDZPQjNrUGIz?=
 =?utf-8?B?QkIwaVZWbGo2cllmbHh0TDVOTE5IV2xjVytEYmxNeTJGRGlLVGVoOWpQNkxM?=
 =?utf-8?B?c1FkenJOY1U2cVlPTHRkeXlnUjBsU0t6YkFQT0RDeXVRU013SDl0czlTZG5W?=
 =?utf-8?B?RkQvYzdnNkdSSG9YRUVRL0hML0hHekZuNjR0bWxMaVp5UllPSG5pbU5WSEk5?=
 =?utf-8?B?TFFaeVdQWWJqMDd4SE9rMytPRVJJRDA2aWhubEhvUjFMckpzNmVEMjl1VWlj?=
 =?utf-8?B?Zm1VMUxDZUtYVGExbVBZQU9HTUs3eUdNWk83RFpYRnMrS1hIRjIxVloyYS8z?=
 =?utf-8?B?OTlJdTZCcURDaVI5eGRnSUJuVXMxYUN4THJHZW42bHluc2l2cmU5cHhVVXZE?=
 =?utf-8?B?ZGkvMTF2UFIwSHd4ekE2WmhaVHZrYzlSb3NvUHpucmxuMEwvZlNXdE80YlJO?=
 =?utf-8?B?YkxaaVhsd2lnaEhCcVZSMHdraDREOXErbVk0T3IrZHZ3L1VNUUdTckk2STFn?=
 =?utf-8?B?Y3hjQVg5cHJkRlgvR2dtakFKV2g0NU83dHo0RHMrN0JiOUJWOVdyNnl5VkFY?=
 =?utf-8?B?VW1LZlBjVU93UFl4ZHZhdG5rRzM2b3FwMFJ3d3EzUEN4d2NidGJMQ1hVc0lH?=
 =?utf-8?B?RFJrejdzNzR0bUtxRWl3MWNBemppT1VrUVBudW41ZkxoRmwwMDNDRHN2WGlG?=
 =?utf-8?B?T2FxUjJMQUM4T2FsMThCQ2FhWkpEbXhaZ0xWS0VGTmUrMmlWTjV5S2kya2hU?=
 =?utf-8?B?WkcvZEl3OGovVWczZnFkNkRmbmJsT3FVSTFQcVRkc1k2am9sY2M3MzBQWUFu?=
 =?utf-8?B?ZlZuWDVMS2xXb1ZLSnh5ek5IWmQwZU8zTkFIeFJCZEpVS1d2a0ZDVjZ6V1px?=
 =?utf-8?B?VHUyYlJHZUV6blA2d0lzMHNySzlPaXRTWTRTMFNwNGlNYVM0OGR1U1A4Vysz?=
 =?utf-8?B?L3g1SHQxWS9yNVBURFhDMjZqQWV4R3ErenZIb21CZ2Q3dGhPUUhVenQ0dkZN?=
 =?utf-8?B?NE8vNlJROFY4U1N6ZzZOVHFNdUhjSWs1cUZEQURkdXRqK2tJUWVSdGNiTHRU?=
 =?utf-8?B?cWpjSFdrbGJwTXJLbTJOOFpFTFJ1RlFQOXpIL3loaTZhL2lRMXd0LzJBNXhu?=
 =?utf-8?B?azVHWWVaTis3US9xbENESG1adXAzL3F3Q0RGQjQyQzFNbXRqemlkYkRhV1Iz?=
 =?utf-8?B?Q0VTeVZDTXdWTWlXenhBT1FHb2ZRTHlacUJJSEhtZzUrR2FQVSsvcXluSWxR?=
 =?utf-8?B?ZGkwZXhHYVJ6Z0JYY2JaUkl4cS9GNngwTDNsU284Zy9XU1RmZ1ZzdTVESE1R?=
 =?utf-8?B?V0RvUXlER3p6bkI4eWNWRFJOQW5XUmJjZW0zci9jSUZNMDh3K0dhNFFxUG9L?=
 =?utf-8?B?RUdnU25YV3Uzb1J5WTlzVVd6b3NmeXdyZ2pzVHd6amY3Wm82VHpiQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A8AD10D5685F34BA373F7E5722D0434@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fe67e2-0cda-4e79-d3e3-08d99a3e0fd0
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 18:09:19.2305
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zE382gzVFESq1nny6O4G7/yfprHUkbsSLdaJPxoyo2lktZgkrtkKsVZRomvrp4e3yzHUdSs+fffsC/4Va1vH1TksJr/SRe2pe5in935Kf15iialMLEdSijW1vwcJsA2Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3587
X-Proofpoint-ORIG-GUID: 5h-X1ZxJtJjPCpQF3JEQv3qEnAaZrJxv
X-Proofpoint-GUID: 5h-X1ZxJtJjPCpQF3JEQv3qEnAaZrJxv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-28_04,2021-10-26_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110280096

DQoNCk9uIDI4LjEwLjIxIDE5OjUwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6DQo+IE9uIFRo
dSwgMjggT2N0IDIwMjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIFN0ZWZhbm8sDQo+Pg0K
Pj4gT24gMjgvMTAvMjAyMSAwMDo1NywgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9u
IFdlZCwgMjcgT2N0IDIwMjEsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+Pj4gSGkgT2xla3NhbmRy
LA0KPj4+Pg0KPj4+PiBPbiAyNy8xMC8yMDIxIDA5OjM3LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIDxvbGVrc2FuZHJf
YW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+DQo+Pj4+PiBJZiBhIFBDSSBob3N0IGJyaWRn
ZSBkZXZpY2UgaXMgcHJlc2VudCBpbiB0aGUgZGV2aWNlIHRyZWUsIGJ1dCBpcw0KPj4+Pj4gZGlz
YWJsZWQsIHRoZW4gaXRzIFBDSSBob3N0IGJyaWRnZSBkcml2ZXIgd2FzIG5vdCBpbnN0YW50aWF0
ZWQuDQo+Pj4+PiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyBwYW5pYyBkdXJpbmcgWGVu
IHN0YXJ0Og0KPj4+Pj4NCj4+Pj4+IChYRU4pIERldmljZSB0cmVlIGdlbmVyYXRpb24gZmFpbGVk
ICgtMjIpLg0KPj4+PiBJdCB3b3VsZCBnb29kIHRvIGNsYXJpZnkgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHdoZXJlIHRoZSBlcnJvciBpcyBjb21pbmcNCj4+Pj4gZnJvbS4NCj4+Pj4gSSB0aGluayB0
aGlzIGlzIGZyb20gcGNpX2dldF9ob3N0X2JyaWRnZV9zZWdtZW50KCkuDQo+Pj4+DQo+Pj4+PiAo
WEVOKQ0KPj4+Pj4gKFhFTikgKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPj4+Pj4gKFhFTikgUGFuaWMgb24gQ1BVIDA6DQo+Pj4+PiAoWEVOKSBDb3VsZCBub3Qgc2V0
IHVwIERPTTAgZ3Vlc3QgT1MNCj4+Pj4+IChYRU4pICoqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioNCj4+Pj4+DQo+Pj4+PiBGaXggdGhpcyBieSBub3QgYWRkaW5nIGxpbnV4
LHBjaS1kb21haW4gcHJvcGVydHkgZm9yIGh3ZG9tIGlmIGl0IGlzDQo+Pj4+PiBuZWl0aGVyIGF2
YWlsYWJsZSBub3IgZGV2aWNlIGVuYWJsZWQuDQo+Pj4+ICAgRnJvbSBteSByZWFkaW5nIG9mIHRo
ZSBiaW5kaW5nIFsxXSwgdGhlIHByb3BlcnR5IHNob3VsZCBiZSBwcmVzZW50IGluIGFsbA0KPj4+
PiB0aGUNCj4+Pj4gaG9zdGJyaWRnZXMgaWYgb25lIHNwZWNpZnkgaXQuIElPVywgSSB0aGluayB0
aGUgcHJvcGVydHkgc2hvdWxkIGFsc28gYmUNCj4+Pj4gYWRkZWQNCj4+Pj4gZm9yIGhvc3Ricmlk
Z2VzIHRoYXQgYXJlIG5vdCBhdmFpbGFibGUuDQo+Pj4gSnVzdCB3YW50ZWQgdG8gc2F5IHRoYXQg
SSB0aGluayB5b3UgYXJlIHJpZ2h0Og0KPj4+DQo+Pj4gIiIiDQo+Pj4gSXQgaXMgcmVxdWlyZWQg
dG8gZWl0aGVyIG5vdCBzZXQgdGhpcyBwcm9wZXJ0eSBhdCBhbGwgb3Igc2V0IGl0IGZvciBhbGwN
Cj4+PiBob3N0IGJyaWRnZXMgaW4gdGhlIHN5c3RlbSwgb3RoZXJ3aXNlIHBvdGVudGlhbGx5IGNv
bmZsaWN0aW5nIGRvbWFpbiBudW1iZXJzDQo+Pj4gbWF5IGJlIGFzc2lnbmVkIHRvIHJvb3QgYnVz
ZXMgYmVoaW5kIGRpZmZlcmVudCBob3N0IGJyaWRnZXMuICBUaGUgZG9tYWluDQo+Pj4gbnVtYmVy
IGZvciBlYWNoIGhvc3QgYnJpZGdlIGluIHRoZSBzeXN0ZW0gbXVzdCBiZSB1bmlxdWUuDQo+Pj4g
IiIiDQo+Pj4NCj4+PiBhbmQgSSBhbSByZWFkeSB0byBiZWxpZXZlIGRldmljZSB0cmVlcyB3aXRo
IGRpc2FibGVkIGJyaWRnZXMgbWlnaHQgaGF2ZQ0KPj4+IChpbmNvcnJlY3RseSkgaWdub3JlZCB0
aGUgcnVsZS4NCj4+IExvb2tpbmcgYXQgbGludXgvYXJjaC9hcm02NC9ib290L2R0cy8sIHRoZXJl
IGFyZSBhIGZldyBEZXZpY2UtVHJlZSB0aGF0DQo+PiBjb250YWluIHRoZSBwcm9wZXJ0eSAibGlu
dXgscGNpLWRvbWFpbiIuIEFsbCBvZiB0aGVtIHNlZW1zIHRvIGFsc28gYWRkIGl0IGZvcg0KPj4g
ZGlzYWJsZWQgaG9zdGJyaWRnZXMuDQo+Pg0KPj4gSG93ZXZlciwgSSBhbSB1bmRlciB0aGUgaW1w
cmVzc2lvbiB0aGF0IGl0IGlzIG1vcmUgY29tbW9uIHRvIGhhdmUgYQ0KPj4gRGV2aWRlLVRyZWUg
d2l0aG91dCBhbnkgcHJvcGVydHkgImxpbnV4LHBjaS1kb21haW4iLiBXaGVuIFBDSSBzdXBwb3J0
IGlzDQo+PiBlbmFibGVkLCBYZW4gd2lsbCBnZW5lcmF0ZSB0aGUgZG9tYWluIElEIGZvciB0aGUg
aG9zdGJyaWRnZSBhbmQgd3JpdGUgaXQgdG8NCj4+IHRoZSBEVC4NCj4+DQo+PiBUaGlzIGRvZXNu
J3Qgd29yayBmb3IgZGlzYWJsZWQgaG9zdGJyaWRnZSBhbmQgSSB0aGluayB0aGlzIGlzIE9sZWtz
YW5kcidzDQo+PiBwcm9ibGVtLiBAT2xla3NhbmRyIGNhbiB5b3UgY29uZmlybSBpdD8NCj4+DQo+
Pj4NCj4+Pj4gQUZBSUNULCBMaW51eCB3aWxsIGlnbm9yZSBob3N0YnJpZGdlIHRoYXQgYXJlIG5v
dCBhdmFpbGFibGUuIEJ1dCBpdCBmZWVscw0KPj4+PiB0bw0KPj4+PiBtZSB3ZSBhcmUgdHdpc3Rp
bmcgdGhlIHJ1bGUuIFNvLCBjb3VsZCB3ZSBjb25zaWRlciB0byBhbGxvY2F0ZSBhbiB1bnVzZWQN
Cj4+Pj4gbnVtYmVyPw0KPj4+IEkgdGhpbmsgdGhhdCB3b3VsZCBiZSBmaW5lIGJ1dCBpdCBkb2Vz
bid0IGxvb2sgZWFzeSBmcm9tIHRoZSBjdXJyZW50IFhlbg0KPj4+IGNvZGUgcG9pbnQgb2Ygdmll
dyBiZWNhdXNlIHRoZSBhbGxvY2F0aW9uIGRlcGVuZHMgb24gdGhlIFhlbiBkcml2ZXIsDQo+Pj4g
d2hpY2ggd2UgZG9uJ3QgaGF2ZS4gQnV0IEknbGwgbGV0IG90aGVycyBjb21tZW50IG9uIGl0Lg0K
Pj4gU28gd2hhdCBtYXR0ZXJzIGlzIFhlbiBkb2Vzbid0IG1ha2UgdGhpbmdzIHdvcnNlLiBXZSBo
YXZlIHR3byBjYXNlcyB0byBjYXJlOg0KPj4gICAgMSkgWGVuIG9ubHkgaGFzIGRyaXZlcnMgZm9y
IGEgcGFydCBvZiB0aGUgaG9zdGJyaWdlcw0KPj4gICAgMikgU29tZSBob3N0YnJpZ2VzIGFyZSBk
aXNhYmxlZA0KPj4NCj4+IENhc2UgMSkgd2lsbCBkZWZpbml0ZWx5IGdlbmVyYXRlIGEgRFQgdGhh
dCB3aWxsIG1ha2UgTGludXggdW5oYXBweSBpZiB3ZSBoYXZlDQo+PiBkb24ndCBhZGQgdGhlIHBy
b3BlcnR5IGNvbnNpc3RlbnRseS4NCj4gR29vZCBwb2ludCENClNvLCB0aGUgYm90dG9tIGxpbmU6
IHdlIGFkZCB0aGUgcHJvcGVydHkgcmVnYXJkbGVzcyBvZiB0aGUgc3RhdHVzPw0KQW5kIHRoZSBz
ZWdtZW50IHdlIGFzc2lnbiBmb3IgdGhlIGRpc2FibGVkIG9uZXMgaXMgcGNpX2dldF9uZXdfZG9t
YWluX25yKCk/DQpJIGd1ZXNzIG5vdGhpbmcgYmFkIGhhcHBlbnMgaWYgd2UgaGF2ZSBzYXkgMyBi
cmlkZ2VzOg0Kb2theSAtID4gc2VnIDANCmRpc2FibGVkIC0gPiBzZWcgMQ0Kb2theSAtID4gc2Vn
IDINCg==

