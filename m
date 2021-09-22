Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94698414488
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 11:06:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192300.342680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyCt-0005ep-9o; Wed, 22 Sep 2021 09:06:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192300.342680; Wed, 22 Sep 2021 09:06:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSyCt-0005cA-5c; Wed, 22 Sep 2021 09:06:23 +0000
Received: by outflank-mailman (input) for mailman id 192300;
 Wed, 22 Sep 2021 09:06:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d5Wf=OM=epam.com=prvs=98995dc5f4=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mSyCq-0005c4-KD
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 09:06:20 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5902f6e8-1b84-11ec-b966-12813bfff9fa;
 Wed, 22 Sep 2021 09:06:18 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18M8sHNF027692; 
 Wed, 22 Sep 2021 09:06:16 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2106.outbound.protection.outlook.com [104.47.18.106])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b81cr823d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Sep 2021 09:06:16 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4435.eurprd03.prod.outlook.com (2603:10a6:208:c1::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 09:06:13 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.013; Wed, 22 Sep 2021
 09:06:13 +0000
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
X-Inumbo-ID: 5902f6e8-1b84-11ec-b966-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KB+i6JyYTbztBekKWkwfcraqmOuw+F+7awdsr3BKZ1FYZVmaYUeS+77kE8NHqfc3x76BaXd3s2sVmfHlsOZL1MJdohwjFsBdisNP/h+a42qw7MHUPoecLEf8F3w0FHoNRrwRGyhc+6adVmG0qBQFpdjbZHm4gSDQzBWsI9SWTlkp7VVKHfAzAFw2llkhIFqJkC2pmqFZwvRAl6vh8qiHYjc7EIvR2aHMfo6X4B7OOQ0M4r7sofYIgA9jMbBfRtofC1+N+u57f+ep+Csbmhh3RCO58J2BBNm1oBperAuRpEJfPOKGE5m1/DmoVXvzZwQXEX45vlokSMmwhIAAwFT7qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gq9s4Gvde8S3W8XPUWTZYBzOuh5qowpHN0TABzU/wwk=;
 b=HCboOrPA7gBwoYXbWyn/bfAkK6QtkY6pFPBYXYSXxyKt6AkzZALFf3ZySuqd4oiDsSmO/o2wWP14pchEws3n+nSPZb2omuLzJ4R1ktT05FhJKgKH0/np6SU4d5j0xmJ6fLcyvkXQ7pyasYhzDbylJ6zSp/7yxLRFWlGPRcfGzLkCDnB1A9fMhFb7SygqDSEEZHsYQq4ADaQ09xBhw5BBO4jxnL+mjrgpxtI0wusWlLKGsB6GbnPWW3xy9gP7ekuyLc8Y2qwwIGRLbM4slDQ/i8hn8bca15sUIPY2wymlX/MAciv1VVxrZOEeMIVlwEos2eYyam3Cm13bdKsnTSlSLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gq9s4Gvde8S3W8XPUWTZYBzOuh5qowpHN0TABzU/wwk=;
 b=fz/E5LDYUP8JAvcq0d+ycjQPzxpyrM2/y57EOx2KXd+ql+avfAdXTKe+rUccleCnHkJ7kiOUWh3T/fJp1s0VFGtPVoBJYXrQ7eHOKmwB+o0utxEJtMWQaGIsQFVpnP2oeq97EO8U5rUbI+zV70dCGEVi1TJySNQLGaW0vEfIsODkztNxkFvOylz+yUVMcqolNxJDJA+3kB0V86VzcDMxyeDMqttraJmMkdmYIAYUzeS0RLj9iiExhqE6+xZUoHQWIidg21m3e6WBTcXQFmpcw9ZxtTkVIS0rkdRQmTtGMTjzFDs+t3aGuU+CWhu1wx6ptaqFcNVoSP/OcjgMr36Fvw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>,
        "julien@xen.org" <julien@xen.org>,
        "jbeulich@suse.com" <jbeulich@suse.com>,
        Anastasiia Lukianenko
	<Anastasiia_Lukianenko@epam.com>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Topic: [PATCH] xen-pciback: allow compiling on other archs than x86
Thread-Index: 
 AQHXq8QnOfGIukpGqE2hMWXmS9bdmKuow0KAgAOkhICAAGZ9AIAAAmOAgADCywCAAGXhAIAACLuAgAAEUwCAAAi6AIAAAxMAgAADDgCAAAJlAIAAAheAgADhlwCAAM9XAA==
Date: Wed, 22 Sep 2021 09:06:13 +0000
Message-ID: <9c81d293-1a30-3799-fc69-ba836751d53f@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
 <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
 <7f873e38-0362-1f60-7347-a490c9dc8572@epam.com>
 <alpine.DEB.2.21.2109201444040.17979@sstabellini-ThinkPad-T480s>
 <0f31a1bf-62b1-1aef-7b0f-34a1f6985fdb@suse.com>
 <82e55df9-74d3-6365-ab29-2bdfc4b74a1f@epam.com>
 <9b4962de-61ef-44dc-ffca-c54dd7990c6a@suse.com>
 <a9b98bc4-4c8a-2e7e-6abf-3a68025059c4@epam.com>
 <bb9fa2a8-9cc2-d83c-3659-c66b37781470@suse.com>
 <0b83aa77-aef0-0d98-cc0b-cf5f9c7599bd@epam.com>
 <111389e7-855d-0023-092c-f3e8bc57f4af@suse.com>
 <48a2ef20-02ad-99e4-a8f5-fa144692aadc@epam.com>
 <alpine.DEB.2.21.2109211340470.17979@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109211340470.17979@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2cf25e8d-605d-462a-6524-08d97da83a3b
x-ms-traffictypediagnostic: AM0PR03MB4435:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB4435E30572429BC5E961D1B3E7A29@AM0PR03MB4435.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 vOa1RoPxyf/p0ZLonNHJ0O6QqTOnANmib3Hc5RN+9Xn2OeLfPhnSPVbcQJ/ss/tDhSjJTqVAgSGYwG9SC1pUFDVS1ud5hh/GWkUS9UmqSLhp/ocmAY0n83KAVEM0pqryNkUCWA4bGrbhhGHOJX0BVAbCoTkwGybivUVwzOKGu5FdAikG5xoqEK5jRUnRCb/VnX1lze71+Q9PElArfT1snEo3Zd6lJf5ByHrS18giwlXw/A5K4wTNrFLaWgy6geMf+uooEZ8pwRcnvs1YTfoFiTSab3Imuf46mLryFjXfb3DUqwMEB/GTAF0b6TmCIEZCSua/WqIWZOlsK0GE1oO1vRDssmol+PrV1JCdRI4zwl+8+yTtOIqVyp/PKRnRfjmlMSVFMqlqLErabrm+eSdkvaPzDjaBOsKbJ6PQsOi4jcnQ8Q4iiL7Q9kGWeXj0MvPMMaHBTXQPRKfg7ZMwGTRDb4KIRv/FtqFBaV3+fLa6ERVdhKcc425nLtVRMAfEvfLrbNXYMgoiNmcmIV0oU1fqB4owiXoMrCo2nRhTzdHudhglXSq4TswkWUB6RBR0QfbA0tz0eNvUW1w4nZBpVVKBw+7M0yHZuVAKDo5Qyo/0bkfghWfY3PxPr9qIr+LFAtrIb+TgPJPhkW5YWF/DsXMJxLSE+874Xak/Y7nLQk5QQvSjgnydenBB9kpkqx+8r6NyKaStoQG6u4kKpszBiLAM89NVIwqsh0e9SWz3b18ZL0F/NQUADlRRAR/v4DzHhyVm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(122000001)(5660300002)(2616005)(76116006)(30864003)(2906002)(6486002)(83380400001)(91956017)(4326008)(31686004)(66946007)(64756008)(31696002)(6506007)(86362001)(71200400001)(36756003)(38100700002)(54906003)(186003)(8936002)(26005)(508600001)(316002)(66476007)(8676002)(66446008)(53546011)(6916009)(66556008)(6512007)(55236004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Rk1OQk5TRkg5Umx3VDRVU3lJRmI0QmtCOXAzR0NleWhIMm0vOUFrWkNoNTh1?=
 =?utf-8?B?ZnZIVW0xOUJFTUo2OVFMRXRnVWlhTitwQXkxVWRaaXJ0aHJWeGNoeTF3cWw2?=
 =?utf-8?B?ZHZZMHk0OHJGWDRKVUZFMlV3T3FYUkNud0U3eXJpdU96V3dYc1lJVUFGQUlx?=
 =?utf-8?B?WThtWkNaV0FkdzF4UEcrclhvZjNUNVU1MDBUU25uUzlENndGNzMxUXYvWFpo?=
 =?utf-8?B?aUR6V1FpZHUxQ016MDhGZ2MwaVdtOGtYUy9uWUxDamxnelEwUXdSMVhGUXpl?=
 =?utf-8?B?MW1ia21OeCt5TVRVRE9IZ05xeTdUS2N0U1djM2h0R0FSbTZLbGxMQThFMGdQ?=
 =?utf-8?B?L1ZmYU14d2p3YkdXUDVHazdiQkdvQ2QxS1NyMC9CUmhkWmliSWgxVXRnVkln?=
 =?utf-8?B?bG9mcXNJU2dTMk93SmM4enFlUEVMNlE1THRnblp3aUo1bXZ0cUJnYTNncDIw?=
 =?utf-8?B?Sy9uY0xrVXhGL3ExSHJRUFlsWC9ZajhDRGdXREpmKy8xS2JWbUtkeGozT0Fp?=
 =?utf-8?B?VDlCMGdwQ0ZmNzZVTTN3NkhLWUMrTlYxVTlGQmNUR0NlY0dJc0lPRndRN21C?=
 =?utf-8?B?SVpTTXRNclVDYVJodWhpMWhwUExpRHV0RjNVTHE1RFRJYUR5UjVja2hCdWhu?=
 =?utf-8?B?MEgvbi9sRExSNCtKQk9aWXZqWDBYNzFTeFJUd1FWME44c1dja3I0T2R2Y0tk?=
 =?utf-8?B?elZORWpGY1h3MnRsNkR6ekw0d2srU1U4a3RzQUxwNWJrVWR0bDVTVUxwZzFK?=
 =?utf-8?B?dDBzc05FaWgvcXI1NVNXZlh4OTdTQWtzcENpa21QTS9GQ3NZTzRWVjZMbXFx?=
 =?utf-8?B?dlIzUlJVTVZJSHBOTVNEeTRvbVRXOXBUS0R3bkZOMm5PelJlVVZzdWZ2aGhq?=
 =?utf-8?B?dS96OFdCcHJKZXNzNHIxTnJ1bVhPWS9QQ3Q5REFKZVM3VmxNay91cEc4bE5V?=
 =?utf-8?B?cTVGTDJHS2NRTWpHSUJEemtwRS96bC9tR0tXKzk4WE1hSGtKSU9LWXIxSEgr?=
 =?utf-8?B?RkY2S2s0RUZTY2tlcVJjOXpkeVZ4enFJMW9DNDhoZ2ZVYjlCakdjRWpIRWVY?=
 =?utf-8?B?MlBZcEVRbDlBVmxzcUdOOEJESVhwRTFyOEV2ZzRScEtmZE9hNXFxanFFVlFO?=
 =?utf-8?B?b0htNzNESDRNZld4d3lDblhkSTJ0TEVEZ3hHTzhFbTh4SVlOTGUwOEFzSTIz?=
 =?utf-8?B?aGtXcXN3WHJRZDFmbVI4Q0NyemxjMFJrUXp3MG1EeTdsWFlFNGN3SnF4VXJF?=
 =?utf-8?B?Rk5VM1czZjByMGpMZ0M2WVR4WjN5Wm1FcXBDcHJSVVBKMEFzamZNZUVRN0Zr?=
 =?utf-8?B?RjVjNjNRaWJyTFdZUHhWZEdjUEJWdXhKcTFWWlhSM1lTNnkwcURhWTViVkpU?=
 =?utf-8?B?b1VhTjNYNTRxdEprbno1U09yNVZ3aG1nQUFnYkV2U1Z0VzZKaTlKbnNia2hj?=
 =?utf-8?B?cDRIQ3dsTHlTVmtFNlREWEM4M205MklsOXlRaDRKODluSEVWR2VtbWwrVVpm?=
 =?utf-8?B?dnp5cGpsUlY0M3BsNE9iRU5hVjZoaWpBb0JBTGRiT2tJWitiUkRpTDdqYytT?=
 =?utf-8?B?bEdrSldEanVOaGpFRUJJTUNkd3F5c2FHbVFiREI2L3JnK3pPeFdZTWhDMlpE?=
 =?utf-8?B?UldJUG53S2czOFp3YVpMOThGSVNxcXVZU3UvcWRiMzREVE1kZDdIaElzKzE4?=
 =?utf-8?B?M0t4SEpmR3pkYjBIVlArZmtPSldJdXNTR2crTEFYeDZ5SndmTFgzNWlRb2gx?=
 =?utf-8?B?dE5mNVpMVDgySHNLWkxISWphZ1ZRTGgxWTdudlp2ZWdXQzNxMi9ObnZEeUJn?=
 =?utf-8?B?eWVsUzRwcHZJbXJUOWg1dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0D0C20E792A0BB48A5C940A4D69973D3@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf25e8d-605d-462a-6524-08d97da83a3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2021 09:06:13.3897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3gPpeEZqG8/zKfKhvDr4ngrmdDTzzcSG7uE7NbV2xEkGCg4IV9fTVuTuBt2NyHLMv3aiLY8CtjfuR5EaG88p9aw1AxgNaMLM/0Qp7OxTC8ys41FXUwRv4pJ16YedWQ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4435
X-Proofpoint-ORIG-GUID: 056SdVnT0tFM4h1RxJhz7q1d8QnreGqa
X-Proofpoint-GUID: 056SdVnT0tFM4h1RxJhz7q1d8QnreGqa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-22_03,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109220062

DQpPbiAyMS4wOS4yMSAyMzo0NCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUdWUs
IDIxIFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDIxLjA5
LjIxIDEwOjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDIxLjA5LjIxIDA5OjAwLCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMjEuMDkuMjEgMDk6NDksIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4+PiBPbiAyMS4wOS4yMSAwODozOCwgT2xla3NhbmRyIEFu
ZHJ1c2hjaGVua28gd3JvdGU6DQo+Pj4+Pj4gT24gMjEuMDkuMjEgMDk6MDcsIEp1ZXJnZW4gR3Jv
c3Mgd3JvdGU6DQo+Pj4+Pj4+IE9uIDIxLjA5LjIxIDA3OjUxLCBPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyB3cm90ZToNCj4+Pj4+Pj4+IE9uIDIxLjA5LjIxIDA4OjIwLCBKdWVyZ2VuIEdyb3NzIHdy
b3RlOg0KPj4+Pj4+Pj4+IE9uIDIxLjA5LjIxIDAxOjE2LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+Pj4+Pj4+Pj4+IE9uIE1vbiwgMjAgU2VwIDIwMjEsIE9sZWtzYW5kciBBbmRydXNoY2hl
bmtvIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4gT24gMjAuMDkuMjEgMTQ6MzAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+Pj4+Pj4+Pj4+Pj4gT24gMjAuMDkuMjEgMDc6MjMsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+PiBIZWxsbywgU3RlZmFubyENCj4+Pj4+Pj4+Pj4+
Pj4NCj4+Pj4+Pj4+Pj4+Pj4gT24gMTguMDkuMjEgMDA6NDUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3
cm90ZToNCj4+Pj4+Pj4+Pj4+Pj4+IEhpIE9sZWtzYW5kciwNCj4+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4+Pj4+PiBXaHkgZG8geW91IHdhbnQgdG8gZW5hYmxlIHBjaWJhY2sgb24gQVJNPyBJcyBp
dCBvbmx5IHRvICJkaXNhYmxlIiBhIFBDSQ0KPj4+Pj4+Pj4+Pj4+Pj4gZGV2aWNlIGluIERvbTAg
c28gdGhhdCBpdCBjYW4gYmUgc2FmZWx5IGFzc2lnbmVkIHRvIGEgRG9tVT8NCj4+Pj4+Pj4+Pj4+
Pj4gTm90IG9ubHkgdGhhdA0KPj4+Pj4+Pj4+Pj4+Pj4gSSBhbSBhc2tpbmcgYmVjYXVzZSBhY3R1
YWxseSBJIGRvbid0IHRoaW5rIHdlIHdhbnQgdG8gZW5hYmxlIHRoZSBQViBQQ0kNCj4+Pj4+Pj4+
Pj4+Pj4+IGJhY2tlbmQgZmVhdHVyZSBvZiBwY2liYWNrIG9uIEFSTSwgcmlnaHQ/IFRoYXQgd291
bGQgY2xhc2ggd2l0aCB0aGUgUENJDQo+Pj4+Pj4+Pj4+Pj4+PiBhc3NpZ25tZW50IHdvcmsgeW91
IGhhdmUgYmVlbiBkb2luZyBpbiBYZW4uIFRoZXkgY291bGRuJ3QgYm90aCB3b3JrIGF0DQo+Pj4+
Pj4+Pj4+Pj4+PiB0aGUgc2FtZSB0aW1lLg0KPj4+Pj4+Pj4+Pj4+PiBDb3JyZWN0LCBpdCBpcyBu
b3QgdXNlZA0KPj4+Pj4+Pj4+Pj4+Pj4gSWYgd2Ugb25seSBuZWVkIHBjaWJhY2sgdG8gInBhcmsi
IGEgZGV2aWNlIGluIERvbTAsIHdvdWxkbid0IGl0IGJlDQo+Pj4+Pj4+Pj4+Pj4+PiBwb3NzaWJs
ZSBhbmQgYmV0dGVyIHRvIHVzZSBwY2ktc3R1YiBpbnN0ZWFkPw0KPj4+Pj4+Pj4+Pj4+PiBOb3Qg
b25seSB0aGF0LCBzbyBwY2ktc3R1YiBpcyBub3QgZW5vdWdoDQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+
Pj4+Pj4+Pj4+IFRoZSBmdW5jdGlvbmFsaXR5IHdoaWNoIGlzIGltcGxlbWVudGVkIGJ5IHRoZSBw
Y2liYWNrIGFuZCB0aGUgdG9vbHN0YWNrDQo+Pj4+Pj4+Pj4+Pj4+IGFuZCB3aGljaCBpcyByZWxl
dmFudC9taXNzaW5nL25lZWRlZCBmb3IgQVJNOg0KPj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+
PiAxLiBwY2liYWNrIGlzIHVzZWQgYXMgYSBkYXRhYmFzZSBmb3IgYXNzaWduYWJsZSBQQ0kgZGV2
aWNlcywgZS5nLiB4bA0KPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCDCoMKgIHBjaS1hc3NpZ25h
YmxlLXthZGR8cmVtb3ZlfGxpc3R9IG1hbmlwdWxhdGVzIHRoYXQgbGlzdC4gU28sIHdoZW5ldmVy
IHRoZQ0KPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCDCoMKgIHRvb2xzdGFjayBuZWVkcyB0byBr
bm93IHdoaWNoIFBDSSBkZXZpY2VzIGNhbiBiZSBwYXNzZWQgdGhyb3VnaCBpdCByZWFkcw0KPj4+
Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCDCoMKgIHRoYXQgZnJvbSB0aGUgcmVsZXZhbnQgc3lzZnMg
ZW50cmllcyBvZiB0aGUgcGNpYmFjay4NCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gMi4g
cGNpYmFjayBpcyB1c2VkIHRvIGhvbGQgdGhlIHVuYm91bmQgUENJIGRldmljZXMsIGUuZy4gd2hl
biBwYXNzaW5nIHRocm91Z2gNCj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqAgwqDCoCBhIFBDSSBk
ZXZpY2UgaXQgbmVlZHMgdG8gYmUgdW5ib3VuZCBmcm9tIHRoZSByZWxldmFudCBkZXZpY2UgZHJp
dmVyIGFuZCBib3VuZA0KPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCDCoMKgIHRvIHBjaWJhY2sg
KHN0cmljdGx5IHNwZWFraW5nIGl0IGlzIG5vdCByZXF1aXJlZCB0aGF0IHRoZSBkZXZpY2UgaXMg
Ym91bmQgdG8NCj4+Pj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqAgwqDCoCBwY2liYWNrLCBidXQgcGNp
YmFjayBpcyBhZ2FpbiB1c2VkIGFzIGEgZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBD
SQ0KPj4+Pj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoCDCoMKgIGRldmljZXMsIHNvIHdlIGNhbiByZS1i
aW5kIHRoZSBkZXZpY2VzIGJhY2sgdG8gdGhlaXIgb3JpZ2luYWwgZHJpdmVycyB3aGVuDQo+Pj4+
Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgIMKgwqAgZ3Vlc3QgZG9tYWluIHNodXRzIGRvd24pDQo+Pj4+
Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IDMuIERldmljZSByZXNldA0KPj4+Pj4+Pj4+Pj4+Pg0K
Pj4+Pj4+Pj4+Pj4+PiBXZSBoYXZlIHByZXZpb3VzbHkgZGlzY3Vzc2VkIG9uIHhlbi1kZXZlbCBN
TCBwb3NzaWJsZSBzb2x1dGlvbnMgdG8gdGhhdCBhcyBmcm9tIHRoZQ0KPj4+Pj4+Pj4+Pj4+PiBh
Ym92ZSB3ZSBzZWUgdGhhdCBwY2liYWNrIGZ1bmN0aW9uYWxpdHkgaXMgZ29pbmcgdG8gYmUgb25s
eSBwYXJ0aWFsbHkgdXNlZCBvbiBBcm0uDQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IFBs
ZWFzZSBzZWUgWzFdIGFuZCBbMl06DQo+Pj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+Pj4+IDEuIEl0
IGlzIG5vdCBhY2NlcHRhYmxlIHRvIG1hbmFnZSB0aGUgYXNzaWduYWJsZSBsaXN0IGluIFhlbiBp
dHNlbGYNCj4+Pj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+Pj4gMi4gcGNpYmFjayBjYW4gYmUgc3Bs
aXQgaW50byB0d28gcGFydHM6IFBDSSBhc3NpZ25hYmxlL2JpbmQvcmVzZXQgaGFuZGxpbmcgYW5k
DQo+Pj4+Pj4+Pj4+Pj4+IHRoZSByZXN0IGxpa2UgdlBDSSBldGMuDQo+Pj4+Pj4+Pj4+Pj4+DQo+
Pj4+Pj4+Pj4+Pj4+IDMuIHBjaWZyb250IGlzIG5vdCB1c2VkIG9uIEFybQ0KPj4+Pj4+Pj4+Pj4+
IEl0IGlzIG5laXRoZXIgaW4geDg2IFBWSC9IVk0gZ3Vlc3RzLg0KPj4+Pj4+Pj4+Pj4gRGlkbid0
IGtub3cgdGhhdCwgdGhhbmsgeW91IGZvciBwb2ludGluZw0KPj4+Pj4+Pj4+Pj4+PiBTbywgbGlt
aXRlZCB1c2Ugb2YgdGhlIHBjaWJhY2sgaXMgb25lIG9mIHRoZSBicmlja3MgdXNlZCB0byBlbmFi
bGUgUENJIHBhc3N0aHJvdWdoDQo+Pj4+Pj4+Pj4+Pj4+IG9uIEFybS4gSXQgd2FzIGVub3VnaCB0
byBqdXN0IHJlLXN0cnVjdHVyZSB0aGUgZHJpdmVyIGFuZCBoYXZlIGl0IHJ1biBvbiBBcm0gdG8g
YWNoaWV2ZQ0KPj4+Pj4+Pj4+Pj4+PiBhbGwgdGhlIGdvYWxzIGFib3ZlLg0KPj4+Pj4+Pj4+Pj4+
Pg0KPj4+Pj4+Pj4+Pj4+PiBJZiB3ZSBzdGlsbCB0aGluayBpdCBpcyBkZXNpcmFibGUgdG8gYnJl
YWsgdGhlIHBjaWJhY2sgZHJpdmVyIGludG8gImNvbW1vbiIgYW5kICJwY2lmcm9udCBzcGVjaWZp
YyINCj4+Pj4+Pj4+Pj4+Pj4gcGFydHMgdGhlbiBpdCBjYW4gYmUgZG9uZSwgeWV0IHRoZSBwYXRj
aCBpcyBnb2luZyB0byBiZSB0aGUgdmVyeSBmaXJzdCBicmljayBpbiB0aGF0IGJ1aWxkaW5nLg0K
Pj4+Pj4+Pj4+Pj4+IERvaW5nIHRoaXMgc3BsaXQgc2hvdWxkIGJlIGRvbmUsIGFzIHRoZSBwY2lm
cm9udCBzcGVjaWZpYyBwYXJ0IGNvdWxkIGJlDQo+Pj4+Pj4+Pj4+Pj4gb21pdHRlZCBvbiB4ODYs
IHRvbywgaW4gY2FzZSBubyBQViBndWVzdHMgdXNpbmcgUENJIHBhc3N0aHJvdWdoIGhhdmUgdG8N
Cj4+Pj4+Pj4+Pj4+PiBiZSBzdXBwb3J0ZWQuDQo+Pj4+Pj4+Pj4+PiBBZ3JlZSwgdGhhdCB0aGUg
ZmluYWwgc29sdXRpb24gc2hvdWxkIGhhdmUgdGhlIGRyaXZlciBzcGxpdA0KPj4+Pj4+Pj4+Pj4+
PiBTbywgSSB0aGluayB0aGlzIHBhdGNoIGlzIHN0aWxsIGdvaW5nIHRvIGJlIG5lZWRlZCBiZXNp
ZGVzIHdoaWNoIGRpcmVjdGlvbiB3ZSB0YWtlLg0KPj4+Pj4+Pj4+Pj4+IFNvbWUga2luZCBvZiB0
aGlzIHBhdGNoLCB5ZXMuIEl0IG1pZ2h0IGxvb2sgZGlmZmVyZW50IGluIGNhc2UgdGhlIHNwbGl0
DQo+Pj4+Pj4+Pj4+Pj4gaXMgZG9uZSBmaXJzdC4NCj4+Pj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+Pj4+
IEkgZG9uJ3QgbWluZCBkb2luZyBpdCBpbiBlaXRoZXIgc2VxdWVuY2UuDQo+Pj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4+IFdpdGggdGhpcyBwYXRjaCB3ZSBoYXZlIEFybSBvbiB0aGUgc2FtZSBwYWdl
IGFzIHRoZSBhYm92ZSBtZW50aW9uZWQgeDg2IGd1ZXN0cywNCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+
Pj4+PiBlLmcuIHRoZSBkcml2ZXIgaGFzIHVudXNlZCBjb2RlLCBidXQgeWV0IGFsbG93cyBBcm0g
dG8gZnVuY3Rpb24gbm93Lg0KPj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4+IEF0IHRoaXMgc3RhZ2Ug
b2YgUENJIHBhc3N0aHJvdWdoIG9uIEFybSBpdCBpcyB5ZXQgZW5vdWdoLiBMb25nIHRlcm0sIHdo
ZW4NCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiB0aGUgZHJpdmVyIGdldHMgc3BsaXQsIEFybSB3
aWxsIGJlbmVmaXQgZnJvbSB0aGF0IHNwbGl0IHRvbywgYnV0IHVuZm9ydHVuYXRlbHkgSSBkbyBu
b3QNCj4+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+PiBoYXZlIGVub3VnaCBiYW5kd2lkdGggZm9yIHRo
YXQgcGllY2Ugb2Ygd29yayBhdCB0aGUgbW9tZW50Lg0KPj4+Pj4+Pj4+PiBUaGF0J3MgZmFpciBh
bmQgSSBkb24ndCB3YW50IHRvIHNjb3BlLWNyZWVwIHRoaXMgc2ltcGxlIHBhdGNoIGFza2luZyBm
b3INCj4+Pj4+Pj4+Pj4gYW4gZW5vcm1vdXMgcmV3b3JrLiBBdCB0aGUgc2FtZSB0aW1lIEkgZG9u
J3QgdGhpbmsgd2Ugc2hvdWxkIGVuYWJsZSB0aGUNCj4+Pj4+Pj4+Pj4gd2hvbGUgb2YgcGNpYmFj
ayBvbiBBUk0gYmVjYXVzZSBpdCB3b3VsZCBiZSBlcnJvbmVvdXMgYW5kIGNvbmZ1c2luZy4NCj4+
Pj4+Pj4+IEFzIHRoZSBmaXJzdCBzdGFnZSBiZWZvcmUgdGhlIGRyaXZlciBpcyBzcGxpdCBvciBp
ZmRlZidzIHVzZWQgLSBjYW4gd2UgdGFrZSB0aGUgcGF0Y2gNCj4+Pj4+Pj4+IGFzIGlzIG5vdz8g
SW4gZWl0aGVyIHdheSB3ZSBjaG9zZSB0aGlzIG5lZWRzIHRvIGJlIGRvbmUsIGUuZy4gZW5hYmxl
IGNvbXBpbGluZw0KPj4+Pj4+Pj4gZm9yIG90aGVyIGFyY2hpdGVjdHVyZXMgYW5kIGNvbW1vbiBj
b2RlIG1vdmUuDQo+Pj4+Pj4+IEZpbmUgd2l0aCBtZSBpbiBwcmluY2lwbGUuIEkgbmVlZCB0byB0
YWtlIGEgbW9yZSB0aG9yb3VnaCBsb29rDQo+Pj4+Pj4+IGF0IHRoZSBwYXRjaCwgdGhvdWdoLg0K
Pj4+Pj4+IE9mIGNvdXJzZQ0KPj4+Pj4+Pj4+PiBJIGFtIHdvbmRlciBpZiB0aGVyZSBpcyBhIHNp
bXBsZToNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gaWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+Pj4+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoCByZXR1cm47DQo+Pj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IFRo
YXQgd2UgY291bGQgYWRkIGluIGEgY291cGxlIG9mIHBsYWNlcyBpbiBwY2liYWNrIHRvIHN0b3Ag
aXQgZnJvbQ0KPj4+Pj4+Pj4+PiBpbml0aWFsaXppbmcgdGhlIHBhcnRzIHdlIGRvbid0IGNhcmUg
YWJvdXQuIFNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcw0KPj4+Pj4+Pj4+PiAodW50ZXN0ZWQg
YW5kIHByb2JhYmx5IGluY29tcGxldGUpLg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBXaGF0IGRv
IHlvdSBndXlzIHRoaW5rPw0KPj4+Pj4+Pj4+IFVoIG5vLCBub3QgaW4gdGhpcyB3YXksIHBsZWFz
ZS4gVGhpcyB3aWxsIGtpbGwgcGNpIHBhc3N0aHJvdWdoIG9uIHg4Ng0KPj4+Pj4+Pj4+IHdpdGgg
ZG9tMCBydW5uaW5nIGFzIFBWSC4gSSBkb24ndCB0aGluayB0aGlzIGlzIHdvcmtpbmcgcmlnaHQg
bm93LCBidXQNCj4+Pj4+Pj4+PiBhZGRpbmcgbW9yZSBjb2RlIG1ha2luZyBpdCBldmVuIGhhcmRl
ciB0byB3b3JrIHNob3VsZCBiZSBhdm9pZGVkLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMuYyBiL2RyaXZlcnMveGVuL3hl
bi1wY2liYWNrL3hlbmJ1cy5jDQo+Pj4+Pj4+Pj4+IGluZGV4IGRhMzRjZTg1ZGM4OC4uOTkxYmEw
YTliMzU5IDEwMDY0NA0KPj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94
ZW5idXMuYw0KPj4+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay94ZW5idXMu
Yw0KPj4+Pj4+Pj4+PiBAQCAtMTUsNiArMTUsNyBAQA0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqAgI2lu
Y2x1ZGUgPHhlbi94ZW5idXMuaD4NCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgICNpbmNsdWRlIDx4ZW4v
ZXZlbnRzLmg+DQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCAjaW5jbHVkZSA8eGVuL3BjaS5oPg0KPj4+
Pj4+Pj4+PiArI2luY2x1ZGUgPHhlbi94ZW4uaD4NCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgICNpbmNs
dWRlICJwY2liYWNrLmgiDQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCDCoCAjZGVmaW5lIElOVkFMSURf
RVZUQ0hOX0lSUcKgICgtMSkNCj4+Pj4+Pj4+Pj4gQEAgLTY4NSw4ICs2ODYsMTIgQEAgc3RhdGlj
IGludCB4ZW5fcGNpYmtfeGVuYnVzX3Byb2JlKHN0cnVjdCB4ZW5idXNfZGV2aWNlICpkZXYsDQo+
Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0
IHN0cnVjdCB4ZW5idXNfZGV2aWNlX2lkICppZCkNCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgIHsNCj4+
Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqAgaW50IGVyciA9IDA7DQo+Pj4+Pj4+Pj4+IC3CoMKg
wqAgc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXYgPSBhbGxvY19wZGV2KGRldik7DQo+Pj4+
Pj4+Pj4+ICvCoMKgwqAgc3RydWN0IHhlbl9wY2lia19kZXZpY2UgKnBkZXY7DQo+Pj4+Pj4+Pj4+
ICsNCj4+Pj4+Pj4+Pj4gK8KgwqDCoCBpZiAoIXhlbl9wdl9kb21haW4oKSkNCj4+Pj4+Pj4+Pj4g
K8KgwqDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqAgK8KgwqDCoCBw
ZGV2ID0gYWxsb2NfcGRldihkZXYpOw0KPj4+Pj4+Pj4+IFRoaXMgaHVuayBpc24ndCBuZWVkZWQs
IGFzIHdpdGggYmFpbGluZyBvdXQgb2YgeGVuX3BjaWJrX3hlbmJ1c19yZWdpc3Rlcg0KPj4+Pj4+
Pj4+IGVhcmx5IHdpbGwgcmVzdWx0IGluIHhlbl9wY2lia194ZW5idXNfcHJvYmUgbmV2ZXIgYmVp
bmcgY2FsbGVkLg0KPj4+Pj4+Pj4+DQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgIGlmIChw
ZGV2ID09IE5VTEwpIHsNCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnIg
PSAtRU5PTUVNOw0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHhlbmJ1c19k
ZXZfZmF0YWwoZGV2LCBlcnIsDQo+Pj4+Pj4+Pj4+IEBAIC03NDMsNiArNzQ4LDkgQEAgY29uc3Qg
c3RydWN0IHhlbl9wY2lia19iYWNrZW5kICpfX3JlYWRfbW9zdGx5IHhlbl9wY2lia19iYWNrZW5k
Ow0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqAgwqAgaW50IF9faW5pdCB4ZW5fcGNpYmtfeGVuYnVzX3Jl
Z2lzdGVyKHZvaWQpDQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoCB7DQo+Pj4+Pj4+Pj4+ICvCoMKgwqAg
aWYgKCF4ZW5fcHZfZG9tYWluKCkpDQo+Pj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4g
MDsNCj4+Pj4+Pj4+Pj4gKw0KPj4+Pj4+Pj4+IFVzZSAjaWZkZWYgQ09ORklHX1g4NiBpbnN0ZWFk
Lg0KPj4+Pj4+Pj4gVGhlIHRpdGxlIG9mIHRoaXMgcGF0Y2ggc2F5cyB0aGF0IHdlIHdhbnQgdG8g
YWxsb3cgdGhpcyBkcml2ZXIgZm9yIG90aGVyIGFyY2hzDQo+Pj4+Pj4+PiBhbmQgbm93IHdlIHdh
bnQgdG8gaW50cm9kdWNlICIjaWZkZWYgQ09ORklHX1g4NiIgd2hpY2ggZG9lc24ndCBzb3VuZA0K
Pj4+Pj4+Pj4gcmlnaHQgd2l0aCB0aGF0IHJlc3BlY3QuIEluc3RlYWQsIHdlIG1heSB3YW50IGhh
dmluZyBzb21ldGhpbmcgbGlrZSBhDQo+Pj4+Pj4+PiBkZWRpY2F0ZWQgZ2F0ZSBmb3IgdGhpcywg
ZS5nLiAiI2lmZGVmIENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkRfU1VQUF9QViINCj4+Pj4+Pj4+
IG9yIHNvbWV0aGluZyB3aGljaCBpcyBhcmNoaXRlY3R1cmUgYWdub3N0aWMuDQo+Pj4+Pj4+IFNv
bWV0aGluZyBsaWtlIHRoYXQsIHllcy4gQnV0IEknZCByYXRoZXIgdXNlIENPTkZJR19YRU5fUENJ
REVWX0JBQ0tFTkQNCj4+Pj4+Pj4gYWN0aW5nIGFzIHRoaXMgZ2F0ZSBhbmQgaW50cm9kdWNlIENP
TkZJR19YRU5fUENJX1NUVUIgZm9yIHRoZSBzdHViDQo+Pj4+Pj4+IGZ1bmN0aW9uYWxpdHkgbmVl
ZGVkIG9uIEFybS4gWEVOX1BDSURFVl9CQUNLRU5EIHdvdWxkIGRlcGVuZCBvbiBYODYgYW5kDQo+
Pj4+Pj4+IHNlbGVjdCBYRU5fUENJX1NUVUIsIHdoaWxlIG9uIEFybSBYRU5fUENJX1NUVUIgY291
bGQgYmUgY29uZmlndXJlZCBpZg0KPj4+Pj4+PiB3YW50ZWQuIFRoZSBzcGxpdHRpbmcgb2YgdGhl
IGRyaXZlciBjYW4gc3RpbGwgYmUgZG9uZSBsYXRlci4NCj4+Pj4+PiBIbSwgcGNpYmFjayBpcyBu
b3cgY29tcGlsZWQgd2hlbiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGlzIGVuYWJsZWQNCj4+
Pj4+PiBhbmQgd2Ugd2FudCB0byBza2lwIHNvbWUgcGFydHMgb2YgaXRzIGNvZGUgd2hlbiBDT05G
SUdfWEVOX1BDSV9TVFVCIGlzIHNldC4NCj4+Pj4+PiBTbywgSSBpbWFnaW5lIHRoYXQgZm9yIHg4
NiB3ZSBqdXN0IGVuYWJsZSBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGFuZCB0aGUNCj4+Pj4+
PiBkcml2ZXIgY29tcGlsZXMgaW4gaXRzIGN1cnJlbnQgc3RhdGUuIEZvciBBcm0gd2UgZW5hYmxl
IGJvdGggQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORA0KPj4+Pj4+IGFuZCBDT05GSUdfWEVOX1BD
SV9TVFVCLCBzbyBwYXJ0IG9mIHRoZSBkcml2ZXIgaXMgbm90IGNvbXBpbGVkLg0KPj4+Pj4gTm8s
IEknZCByYXRoZXIgc3dpdGNoIHRvIGNvbXBpbGluZyB4ZW4tcGNpYmFjayB3aGVuIENPTkZJR19Y
RU5fUENJX1NUVUINCj4+Pj4+IGlzIHNldCBhbmQgY29tcGlsZSBvbmx5IHBhcnRzIG9mIGl0IHdo
ZW4gQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCBpcw0KPj4+Pj4gbm90IHNldCAodGhpcyB3aWxs
IGJlIHRoZSBjYXNlIG9uIEFybSkuDQo+Pj4+IEJ1dCB0aGlzIHdpbGwgcmVxdWlyZSB0aGF0IHRo
ZSBleGlzdGluZyBrZXJuZWwgY29uZmlndXJhdGlvbnMgb3V0IHRoZXJlIGhhdmUgdG8gYWRkaXRp
b25hbGx5IGRlZmluZSBDT05GSUdfWEVOX1BDSV9TVFVCIHRvIGdldCB3aGF0IHRoZXkgaGFkIGJl
Zm9yZSB3aXRoIHNpbXBseSBlbmFibGluZyBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5ELiBNeSBw
b2ludCB3YXMgdGhhdCBpdCBpcyBwcm9iYWJseSBkZXNpcmFibGUgbm90IHRvIGJyZWFrDQo+Pj4+
IHRoZSB0aGluZ3Mgd2hpbGUgZG9pbmcgdGhlIHNwbGl0L3JlLXdvcmsuDQo+Pj4gQnkgbGV0dGlu
ZyBYRU5fUENJREVWX0JBQ0tFTkQgc2VsZWN0IFhFTl9QQ0lfU1RVQiB0aGlzIHdvbid0IGhhcHBl
bi4NCj4+IEluZGVlZA0KPj4+PiBJIGFsc28gdGhvdWdodCB0aGF0ICJjb21waWxlIG9ubHkgcGFy
dHMgb2YgaXQgd2hlbiBDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EIGlzIG5vdCBzZXQiDQo+Pj4+
IG1heSBoYXZlIG1vcmUgY29kZSBnYXRlZCByYXRoZXIgdGhhbiB3aXRoIGdhdGluZyB1bndhbnRl
ZCBjb2RlIHdpdGggQ09ORklHX1hFTl9QQ0lfU1RVQi4NCj4+Pj4gSSBhbSBub3QgcXVpdGUgc3Vy
ZSBhYm91dCB0aGlzIHRob3VnaC4NCj4+PiBUaGlzIHdvdWxkIGJlIGEgdmVyeSB3ZWlyZCBzZW1h
bnRpY3Mgb2YgWEVOX1BDSV9TVFVCLCBhcyB0aGUgc3R1YiBwYXJ0DQo+Pj4gaXMgbmVlZGVkIG9u
IFg4NiBhbmQgb24gQXJtLg0KPj4+DQo+Pj4gR2F0aW5nIGNvdWxkIGV2ZW4gYmUgZG9uZSB3aXRo
IFN0ZWZhbm8ncyBwYXRjaCBqdXN0IGJ5IHJlcGxhY2luZyBoaXMNCj4+PiAiIXhlbl9wdl9kb21h
aW4oKSIgdGVzdHMgd2l0aCAiIUlTX0VOQUJMRUQoQ09ORklHX1hFTl9QQ0lERVZfQkFDS0VORCki
Lg0KPj4gTWFrZXMgc2Vuc2UuDQo+Pg0KPj4gQW5vdGhlciBxdWVzdGlvbiBpZiB3ZSBkbyBub3Qg
d2FudCB0aGUgY29kZSB0byBiZSBjb21waWxlZCBvciBub3QgZXhlY3V0ZWQ/DQo+Pg0KPj4gSWYg
dGhlIGxhdGVyIHRoZW4gd2UgY2FuIGRlZmluZSBzb21ldGhpbmcgbGlrZToNCj4+DQo+PiBib29s
IG5lZWRfcHZfcGFydCh2b2lkKQ0KPj4NCj4+IHsNCj4+DQo+PiAgIMKgwqDCoCByZXR1cm4gSVNf
RU5BQkxFRChDT05GSUdfWEVOX1BDSURFVl9CQUNLRU5EKTsNCj4+DQo+PiB9DQo+Pg0KPj4gYW5k
IHRoZW4ganVzdCB1c2UgbmVlZF9wdl9wYXJ0KCkgZm9yIHRoZSBjaGVja3Mgd2hlcmUgaXQgaXMg
bmVlZGVkLg0KPj4NCj4+IFRoaXMgYWxsb3dzIGF2b2lkaW5nIG11bHRpcGxlIGlmZGVmJ3MgdGhy
b3VnaCB0aGUgY29kZQ0KPiBUaGlzIGlzIGV2ZW4gYmV0dGVyLg0KPg0KPiBGb3IgbXkgY2xhcml0
eSwgT2xla3NhbmRyLCBhcmUgeW91IE9LIHdpdGggYWRkaW5nIGEgZmV3IG5lZWRfcHZfcGFydCgp
DQo+IGNoZWNrcyB0aHJvdWdoIHRoZSBjb2RlIGFzIHBhcnQgb2YgdGhpcyBzZXJpZXMgc28gdGhh
dCB0aGUgUFYgUENJDQo+IGJhY2tlbmQgaXMgbm90IGluaXRpYWxpemVkPw0KWWVzDQo+DQo+IEkg
ZG9uJ3QgaGF2ZSBhIGdvb2QgdGVzdCBlbnZpcm9ubWVudCByZWFkeSBmb3IgdGhpcywgc28gSSBj
YW5ub3QgcmVhbGx5DQo+IHZvbHVudGVlciBteXNlbGYuDQo+DQo+IEkgd291bGQgcHJlZmVyIGlm
IHdlIG1hZGUgdGhpcyBjaGFuZ2UgYXMgcGFydCBvZiB0aGlzIHNlcmllcyBzbyB0aGF0IHRoZQ0K
PiBQViBQQ0kgYmFja2VuZCBmZWF0dXJlcyBkb2Vzbid0IGdldCBlbmFibGVkIG9uIEFSTSwgbm90
IGV2ZW4gdGVtcG9yYXJpbHkuDQpPaywgSSB3aWxsIHB1c2ggdjIgdG9kYXkgd2l0aCB0aGUgYWRk
aXRpb25hbCBwYXRjaCBmb3IgUFY=

