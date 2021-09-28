Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B141A9A7
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197643.350821 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Tp-0007x7-Ay; Tue, 28 Sep 2021 07:24:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197643.350821; Tue, 28 Sep 2021 07:24:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7Tp-0007ua-7R; Tue, 28 Sep 2021 07:24:45 +0000
Received: by outflank-mailman (input) for mailman id 197643;
 Tue, 28 Sep 2021 07:24:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7uFz=OS=epam.com=prvs=0905849383=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mV7To-0007uK-C4
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:24:44 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 264952d0-202d-11ec-bc6f-12813bfff9fa;
 Tue, 28 Sep 2021 07:24:43 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S7Jrq3006951; 
 Tue, 28 Sep 2021 07:24:41 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2112.outbound.protection.outlook.com [104.47.17.112])
 by mx0b-0039f301.pphosted.com with ESMTP id 3bbxjhr0hm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 07:24:41 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB3876.eurprd03.prod.outlook.com (2603:10a6:208:73::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 28 Sep
 2021 07:24:39 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.022; Tue, 28 Sep 2021
 07:24:39 +0000
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
X-Inumbo-ID: 264952d0-202d-11ec-bc6f-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIn+DCEqwBA4dsdV+TQw31EfSUDEkFkK/2stLgYMjLug3C7o8AyW9Chn7X2hpkzqB+TZJn0S3IZtleeYrjy5PM+F0cgZN3TOIBwbjfi7+5WVyYzf2l5nlF2GJ6x7Ik40maHWASA7HQhv9XQpr84RUFqPyP0tKdsKcKAXYVpv8tXhLs5GCT82qofpZqG3SQvYwW95DL7NX+Dft7VtyjEOMMDmV6DIfOF15z1N9wWNhZCleyuYLuXKxK923YxEzq/qQUfDesNHgJBDRcvkh7g0qrzW1iSPdtWJt7U44u0leuruG8xi0I63BZ9oLxzTI4w4mI0wUTiwUxfixJR9pZ6Zrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=sEDVmAc6mgaQQPZ1Vaf2nxtRSHHLsStBrGZTK+4Al9o=;
 b=Zv8GqoTpiCHRMlYkD+iHj0gUckMOJDkIO4c/KAxpWjErv3eY2VMcnuWQzXrgCanKf7G2Dvr7Ja8UIHaGfm4QKEjNx3h9pQ8JrnE01zG9Me1E0Ybl89ZrPz9LeYki+kAOnUMG4UT98Vr3+L1Q7xadDl2RPjiJfXyc6kcPts7KNSHKDig5d/ueJAoONmdZefG+A18+EZcNivSuJFs2msLsdu+WNUchjFSNGTpsPOePBK8MSs8MWfNjYMwsXeRrQymqQ2M1piUWWR484D8sZvaS5tYSzt1PS+OFZBoSGOHF4q9Rl1IDm32wrncDRn/iklkTcGMbTfMHkY4ONRxTNX1Iug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEDVmAc6mgaQQPZ1Vaf2nxtRSHHLsStBrGZTK+4Al9o=;
 b=lEBao8hoQEvCxveK/ryQ84GVxTLFCnYyREs9fspde7qQ6MUuFE609pKDQDdTwnt8Q9cRhMb+63HE7qIoTxwDw+I7XlWMeUZg1HCDaqy7LggWjepVo48sOqol7pywbhSfvsz0/vlgXdj8nPoSHjA8rlbIY/IsiO/tufHFC0Sl3fuXjKu3e18XEZSp+7YnE1e3xv8+HLpUl9QWuU+XAJk7QgHil20wEItCuxD9+kZWtF3rPe/FN91axbh80zkwrkWxehXMDms3haPy0nAAEE30OdrB2wX3rEz0hTp6flJhZci45ltVO+EK8mxHAHtpSk3VVP84s/VSBv/Uo1jno9I34Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
        "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
        "julien@xen.org"
	<julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
Thread-Topic: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and
 PV
Thread-Index: 
 AQHXs20TiZWMfq6cRkakGi7ds9CK56u3ezoAgAACbACAAAVGAIABVeSAgAAoPoCAAAP7gIAAAMWAgAAFAACAAAESAIAAAQ8A
Date: Tue, 28 Sep 2021 07:24:39 +0000
Message-ID: <7e65070c-6899-4277-daf1-1a1aa7ade094@epam.com>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
 <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
 <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
 <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
 <alpine.DEB.2.21.2109280020150.5022@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2109280020150.5022@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6486f299-91ea-4a83-7b9c-08d982510839
x-ms-traffictypediagnostic: AM0PR03MB3876:
x-microsoft-antispam-prvs: 
 <AM0PR03MB3876A9C444408B0D693ACF56E7A89@AM0PR03MB3876.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 NLNkisMiPZzLMHRwa9bhciEkFhXzQF8ElxmGZxLR1pp1aG4ZsXkfGm1WMIK93aAwZu5hK5Vq6X/s+RrC4ZU6HY4FADJYmkdDiAbNxqgzWNPc8JK1Yp+J8ovg6UTZMRVUQzHkf8uvrKLvAv9E7zirlJjFU+vLGA9yYj6NghQoqB/uG6qa+/PHUaDC58J0nQx6HZBQzJnvLniI+s6sJCiClg7ePiVLJIkuU9WbREKaVOTBRvvfNHF3u/8kY5h+A8+GgyNcL8MgLS+ZeHHZoYyzPRllUzjUg+frIOLNvOQD2C6GCX2KII0ETaHes9T5Wl7UiEuYCVtjV+X/LM4/BhSbtNPE+Rkha8PENCKalVrKqgvCSemXqhplDRCZZQWU5wMQDUyfOVtVjDmaJ+i0EnlpwkcvFpFdCb1F4r1d+rFRwDiqFJP0rQCShjnr3P9fQCGn3VLqV/aJ7Vapv2+/iGLJhnLXE68aSDxTTKS7MvwSC5cuAKVMob9EJbX5kwUTDjWuv4eI0RPU+KKz8uqYWINUhHeoIjblcGCDvW67NGNh6t1KGtLgrcPIXlu+V3uTTx+8gP3IBxZUMb3dQvM+8JwyNTCiuNZjY2C5AqrKnw5raYHTDxIcxBuZe5Sedsv0REPGiqbxRfZLzto1u7b9kbvW/+sly5XpFW7SQJ4Rlb26v6f6XNnTfwpSergHaBBeyAQpr9I76Cs/KkIWV31CMHoju6ks2J0bvaQPZ4m5kfvJAi5ZO/6VhgeqHNWjyonotySW
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66556008)(38070700005)(66946007)(91956017)(66476007)(6916009)(66446008)(83380400001)(54906003)(86362001)(64756008)(2906002)(76116006)(2616005)(36756003)(31696002)(4326008)(8936002)(5660300002)(6506007)(53546011)(6486002)(55236004)(8676002)(71200400001)(26005)(186003)(122000001)(31686004)(316002)(6512007)(508600001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?azVCSW9QMVA2QTljd3RIMGl0UktMcXU2QnNTMG8xWGtlYTNkODlXU1FPcDBQ?=
 =?utf-8?B?YWlkeVNrd1BvY3M3SWNEUDlTT2VjSTVOYTIzNFJONlBiYVdCNThPY0tZYjgw?=
 =?utf-8?B?UGd0U3pySVh2dEJKUm8xTndDZ0YzMzdJVDYxQTRpd3I4ZEZRaTc0VHA5aWZt?=
 =?utf-8?B?Tk1oSG9XTnZBOEdmN0FtRVVHVU5CMEZ3UWo4M0p4R1g3d1RudTVJdi95Y1lB?=
 =?utf-8?B?RU1kNEFyMmk0eW1zNEVQMW9VZ1pVTjBuS1J5bUNRVUI2WG9QbHBOb0VmOTFa?=
 =?utf-8?B?bGdnWUFBYVhOVEo5V3RoUURpUWN0Sk1Qa0ZkUTNmajJLVktKbkdBNXdnV2VL?=
 =?utf-8?B?N2V4QkI0bEpZSGprcWk0ZzlGT2dORVlBcHEySkhIT1V3dnZxQ2doOEo1dXg2?=
 =?utf-8?B?c0VjUktSN240UXViMGp2OTJVMnNBZHVHYjFlVnlIeVczcmJoYUU2eUo3aTNs?=
 =?utf-8?B?NEc1cU1kcHl0ZkxlYkc0TVFQVHNaSVdtNjl6VDdSajRraHlpZmp6bGVwV0VG?=
 =?utf-8?B?eVVadEI3akVBSmtlRkdacm9XT3RtYlpYN2MvbnZKZTNlS1hKcHZOODFaR0Qr?=
 =?utf-8?B?T2FOK3pqRVpGV0Z3cXhSVDJva1RXenVKc3pBL01KNkpLMjBPczlxMTZUdi9u?=
 =?utf-8?B?MlNQeFhnU29oZkF1aThKUWJSTW1JVk5lSzluVlgyUnJrM0JxUVBJZm4rY1Bp?=
 =?utf-8?B?cHdCUGUwRHpTVWdnbEkvWjVmMitVMTNLeDJhL25hUTNOOEVDNXpnWmFNTStw?=
 =?utf-8?B?QWFwenBlOUNVNnkybG9rMjJlRWYrVDQ4M25vb3VxZ0IxbFdHVU9jaklGVnU2?=
 =?utf-8?B?M2JoWk9lYlFMUDROMUovSmQzTW5lYlJqb3lNTmtOVnhIMWhmaXk0RHd1OFlk?=
 =?utf-8?B?c1NydUZtbk9DalFBbWRWUmczWjdRZk00T09POGdtRGNPQWJJNjhHcW1vN2s1?=
 =?utf-8?B?T3ZRZmw5SjZtZUR1TE9Fa21VVWJGRmo4Y1FSd29ReEx1cllzY25BOE1NdzMz?=
 =?utf-8?B?SHJtRW83MVdaUlVYNHVQTDBhYndqU3g3RGo2ZmY0ejRsUFB4QVphWWpXZzBY?=
 =?utf-8?B?b05PQVRTRm9DajQ4WkswZ3RYcDVkN3J0bjMzZW9xSTA0MW9aN3czNngvWmRV?=
 =?utf-8?B?R1BHWmVwaWs3ODVXcHJaNS8ydGNCcDVZcTJzNWxnVExieGJHT05PNmpCVndS?=
 =?utf-8?B?TnJzVkNpb0JMa2dzOG9yRUhCWlhVMDI5UkNjL0tHQ3JoUndlNzgvUlowSHFw?=
 =?utf-8?B?cVYzM1g0dmlmT0g2T3hEN0hyeHJkLysyQUxRS1h0cDFSVTdhY282TXpJV2Za?=
 =?utf-8?B?STlHdGtwTm9qck5SQ0cxa040N3QzY2hhZ1pCNlllaC9rSUJDQjdYNWhBaWoz?=
 =?utf-8?B?YVBGV0U1SU5aZGxveXp0YzZwcW1FdVQ5UlRYYVNrcnM2ay85RFNMa2JKRWlM?=
 =?utf-8?B?Z3NnaXBiQUIwTW0zZ2lhRmxXSUxYVkovMnZaM1NGYVBmcHIwWGZxQkVScjFy?=
 =?utf-8?B?dUJQMTQwL3B6ZlgxcXZFNnpQNm5wOWVUWmNxV2xLTlVwcnVlZi9pN3FSSHVp?=
 =?utf-8?B?UUx1T1RMbU4xaGxzTDVaTDhZSitoU1M2L1RXMEJwY3N5blFnSlE1U2VHdWpi?=
 =?utf-8?B?UGlBL1dvODVvaldvWkQ4S2w3R0lrSUh5cFFJK3VXTVdPNDhWc291Y2tpZFU5?=
 =?utf-8?B?c1BwTXQ2d2JSdjBJMktBQjhWV3QxVStIZ2lJYWNSZzFPanAveEFCd2tvTzNX?=
 =?utf-8?B?V1VLNjhyTUFicVVqN1J2QThZV1VHa0kweVRxZE9TMXJoNFk4dW5ieTE3WkZj?=
 =?utf-8?B?bGU5MGtlWnNMcHM0YjFaQT09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F1A27ECF0661B94FB27F706C97BB6A86@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6486f299-91ea-4a83-7b9c-08d982510839
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2021 07:24:39.0646
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpwu7zEM6xTVpq5THYhRVlUmbhN9eGvkJqJIlTlkWvmXTaDuCiFn14y6M2YZVmZPT33Ae9bzr2dgQAFRKQQynhPEyGUVbUk0wJfCx/MyyDOaDbcE1DhgU1XMDo3XUuK+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3876
X-Proofpoint-GUID: V5LmgX9tBloon_ypB1sIDzE6yNsPjYO1
X-Proofpoint-ORIG-GUID: V5LmgX9tBloon_ypB1sIDzE6yNsPjYO1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_04,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109280042

DQpPbiAyOC4wOS4yMSAxMDoyMCwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3RlOg0KPiBPbiBUdWUs
IDI4IFNlcCAyMDIxLCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+IE9uIDI4LjA5
LjIxIDA5OjU5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IE9uIDI4LjA5LjIxIDA4OjU2LCBP
bGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gT24gMjguMDkuMjEgMDk6NDIsIEph
biBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMjguMDkuMjAyMSAwNjoxOCwgU3RlZmFubyBTdGFi
ZWxsaW5pIHdyb3RlOg0KPj4+Pj4+IE9uIE1vbiwgMjcgU2VwIDIwMjEsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6DQo+Pj4+Pj4+IE9uIDI3LjA5LjIxIDA5OjM1LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byB3cm90ZToNCj4+Pj4+Pj4+IE9uIDI3LjA5LjIxIDEwOjI2LCBKYW4gQmV1bGljaCB3cm90ZToN
Cj4+Pj4+Pj4+PiBPbiAyNy4wOS4yMDIxIDA4OjU4LCBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyB3
cm90ZToNCj4+Pj4+Pj4+Pj4gRnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5k
cl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+PiBDdXJyZW50
bHkgUENJIGJhY2tlbmQgaW1wbGVtZW50cyBtdWx0aXBsZSBmdW5jdGlvbmFsaXRpZXMgYXQgYSB0
aW1lLg0KPj4+Pj4+Pj4+PiBUbyBuYW1lIGEgZmV3Og0KPj4+Pj4+Pj4+PiAxLiBJdCBpcyB1c2Vk
IGFzIGEgZGF0YWJhc2UgZm9yIGFzc2lnbmFibGUgUENJIGRldmljZXMsIGUuZy4geGwNCj4+Pj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoCBwY2ktYXNzaWduYWJsZS17YWRkfHJlbW92ZXxsaXN0fSBtYW5p
cHVsYXRlcyB0aGF0IGxpc3QuIFNvLA0KPj4+Pj4+Pj4+PiB3aGVuZXZlcg0KPj4+Pj4+Pj4+PiAg
wqDCoMKgwqDCoMKgIHRoZSB0b29sc3RhY2sgbmVlZHMgdG8ga25vdyB3aGljaCBQQ0kgZGV2aWNl
cyBjYW4gYmUgcGFzc2VkIHRocm91Z2gNCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBpdCByZWFk
cyB0aGF0IGZyb20gdGhlIHJlbGV2YW50IHN5c2ZzIGVudHJpZXMgb2YgdGhlIHBjaWJhY2suDQo+
Pj4+Pj4+Pj4+IDIuIEl0IGlzIHVzZWQgdG8gaG9sZCB0aGUgdW5ib3VuZCBQQ0kgZGV2aWNlcyBs
aXN0LCBlLmcuIHdoZW4gcGFzc2luZw0KPj4+Pj4+Pj4+PiAgwqDCoMKgwqDCoMKgIHRocm91Z2gg
YSBQQ0kgZGV2aWNlIGl0IG5lZWRzIHRvIGJlIHVuYm91bmQgZnJvbSB0aGUgcmVsZXZhbnQNCj4+
Pj4+Pj4+Pj4gZGV2aWNlDQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgZHJpdmVyIGFuZCBib3Vu
ZCB0byBwY2liYWNrIChzdHJpY3RseSBzcGVha2luZyBpdCBpcyBub3QgcmVxdWlyZWQNCj4+Pj4+
Pj4+Pj4gIMKgwqDCoMKgwqDCoCB0aGF0IHRoZSBkZXZpY2UgaXMgYm91bmQgdG8gcGNpYmFjaywg
YnV0IHBjaWJhY2sgaXMgYWdhaW4gdXNlZCBhcyBhDQo+Pj4+Pj4+Pj4+ICDCoMKgwqDCoMKgwqAg
ZGF0YWJhc2Ugb2YgdGhlIHBhc3NlZCB0aHJvdWdoIFBDSSBkZXZpY2VzLCBzbyB3ZSBjYW4gcmUt
YmluZCB0aGUNCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoCBkZXZpY2VzIGJhY2sgdG8gdGhlaXIg
b3JpZ2luYWwgZHJpdmVycyB3aGVuIGd1ZXN0IGRvbWFpbiBzaHV0cw0KPj4+Pj4+Pj4+PiBkb3du
KQ0KPj4+Pj4+Pj4+PiAzLiBEZXZpY2UgcmVzZXQgZm9yIHRoZSBkZXZpY2VzIGJlaW5nIHBhc3Nl
ZCB0aHJvdWdoDQo+Pj4+Pj4+Pj4+IDQuIFBhcmEtdmlydHVhbGlzZWQgdXNlLWNhc2VzIHN1cHBv
cnQNCj4+Pj4+Pj4+Pj4NCj4+Pj4+Pj4+Pj4gVGhlIHBhcmEtdmlydHVhbGlzZWQgcGFydCBvZiB0
aGUgZHJpdmVyIGlzIG5vdCBhbHdheXMgbmVlZGVkIGFzIHNvbWUNCj4+Pj4+Pj4+Pj4gYXJjaGl0
ZWN0dXJlcywgZS5nLiBBcm0gb3IgeDg2IFBWSCBEb20wLCBhcmUgbm90IHVzaW5nIGJhY2tlbmQt
ZnJvbnRlbmQNCj4+Pj4+Pj4+Pj4gbW9kZWwgZm9yIFBDSSBkZXZpY2UgcGFzc3Rocm91Z2guIEZv
ciBzdWNoIHVzZS1jYXNlcyBtYWtlIHRoZSB2ZXJ5DQo+Pj4+Pj4+Pj4+IGZpcnN0IHN0ZXAgaW4g
c3BsaXR0aW5nIHRoZSB4ZW4tcGNpYmFjayBkcml2ZXIgaW50byB0d28gcGFydHM6IFhlbg0KPj4+
Pj4+Pj4+PiBQQ0kgc3R1YiBhbmQgUENJIFBWIGJhY2tlbmQgZHJpdmVycy4NCj4+Pj4+Pj4+Pj4N
Cj4+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28NCj4+Pj4+
Pj4+Pj4gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4+Pj4+Pg0KPj4+
Pj4+Pj4+PiAtLS0NCj4+Pj4+Pj4+Pj4gQ2hhbmdlcyBzaW5jZSB2MzoNCj4+Pj4+Pj4+Pj4gLSBN
b3ZlIENPTkZJR19YRU5fUENJREVWX1NUVUIgdG8gdGhlIHNlY29uZCBwYXRjaA0KPj4+Pj4+Pj4+
IEknbSBhZnJhaWQgdGhpcyB3YXNuJ3QgZnVsbHkgZG9uZToNCj4+Pj4+Pj4+Pg0KPj4+Pj4+Pj4+
PiAtLS0gYS9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+Pj4+Pj4+PiArKysg
Yi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFjay9NYWtlZmlsZQ0KPj4+Pj4+Pj4+PiBAQCAtMSw1ICsx
LDYgQEANCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjANCj4+Pj4+Pj4+Pj4gIMKgwqDCoMKgIG9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tF
TkQpICs9IHhlbi1wY2liYWNrLm8NCj4+Pj4+Pj4+Pj4gK29iai0kKENPTkZJR19YRU5fUENJREVW
X1NUVUIpICs9IHhlbi1wY2liYWNrLm8NCj4+Pj4+Pj4+PiBXaGlsZSBiZW5pZ24gd2hlbiBhZGRl
ZCBoZXJlLCB0aGlzIGFkZGl0aW9uIHN0aWxsIGRvZXNuJ3Qgc2VlbSB0bw0KPj4+Pj4+Pj4+IGJl
bG9uZyBoZXJlLg0KPj4+Pj4+Pj4gTXkgYmFkLiBTbywgaXQgc2VlbXMgd2l0aG91dCBDT05GSUdf
WEVOX1BDSURFVl9TVFVCIHRoZSBjaGFuZ2Ugc2VlbXMNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiB0byBi
ZSBub24tZnVuY3Rpb25hbC4gV2l0aCBDT05GSUdfWEVOX1BDSURFVl9TVFVCIHdlIGZhaWwgdG8g
YnVpbGQgb24gMzItYml0DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gYXJjaGl0ZWN0dXJlcy4uLg0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IFdoYXQgd291bGQgYmUgdGhlIHByZWZlcmVuY2UgaGVyZT8gU3RlZmFu
byBzdWdnZXN0ZWQgdGhhdCB3ZSBzdGlsbCBkZWZpbmUNCj4+Pj4+Pj4+DQo+Pj4+Pj4+PiBDT05G
SUdfWEVOX1BDSURFVl9TVFVCLCBidXQgaW4gZGlzYWJsZWQgc3RhdGUsIGUuZy4gd2UgYWRkIHRy
aXN0YXRlIHRvIGl0DQo+Pj4+Pj4+Pg0KPj4+Pj4+Pj4gaW4gdGhlIHNlY29uZCBwYXRjaA0KPj4+
Pj4+Pj4NCj4+Pj4+Pj4+IEFub3RoZXIgb3B0aW9uIGlzIGp1c3QgdG8gc3F1YXNoIHRoZSB0d28g
cGF0Y2hlcy4NCj4+Pj4+Pj4gU3F1YXNoaW5nIHdvdWxkIGJlIGZpbmUgZm9yIG1lLg0KPj4+Pj4+
ICDCoMKgIEl0IGlzIGZpbmUgZm9yIG1lIHRvIHNxdWFzaCB0aGUgdHdvIHBhdGNoZXMuDQo+Pj4+
Pj4NCj4+Pj4+PiBCdXQgaW4gYW55IGNhc2UsIHdvdWxkbid0IGl0IGJlIGJldHRlciB0byBtb2Rp
ZnkgdGhhdCBzcGVjaWZpYyBjaGFuZ2UgdG86DQo+Pj4+Pj4NCj4+Pj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUgYi9kcml2ZXJzL3hlbi94ZW4tcGNpYmFj
ay9NYWtlZmlsZQ0KPj4+Pj4+IGluZGV4IGUyY2IzNzY0NDRhNi4uZTIzYzc1OGI4NWFlIDEwMDY0
NA0KPj4+Pj4+IC0tLSBhL2RyaXZlcnMveGVuL3hlbi1wY2liYWNrL01ha2VmaWxlDQo+Pj4+Pj4g
KysrIGIvZHJpdmVycy94ZW4veGVuLXBjaWJhY2svTWFrZWZpbGUNCj4+Pj4+PiBAQCAtMSw2ICsx
LDUgQEANCj4+Pj4+PiAgwqDCoCAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+
Pj4+Pj4gLW9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNrLm8N
Cj4+Pj4+PiAtb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfU1RVQikgKz0geGVuLXBjaWJhY2subw0K
Pj4+Pj4+ICtvYmotJChDT05GSUdfWEVOX1BDSV9TVFVCKSArPSB4ZW4tcGNpYmFjay5vDQo+Pj4+
PiBCdXQgdGhhdCB3b3VsZG4ndCBhbGxvdyB0aGUgZHJpdmVyIHRvIGJlIGEgbW9kdWxlIGFueW1v
cmUsIHdvdWxkIGl0Pw0KPj4+PiBFeGFjdGx5LiBJIGZvcmdvdCB0aGF0IHdoZW4gcGxheWluZyB3
aXRoIG1vZHVsZS9idWlsdC1pbiBJIHdhcyBub3QgYWJsZQ0KPj4+Pg0KPj4+PiB0byBjb250cm9s
IHRoYXQgYW55bW9yZSBiZWNhdXNlIENPTkZJR19YRU5fUENJX1NUVUIgd2lsbCBhbHdheXMgYmUN
Cj4+Pj4NCj4+Pj4gaW4gInkiIHN0YXRlLCB0aHVzIGV2ZW4gaWYgeW91IGhhdmUgQ09ORklHX1hF
Tl9QQ0lERVZfQkFDS0VORD1tDQo+Pj4+DQo+Pj4+IHlvdSB3b24ndCBiZSBhYmxlIHRvIGJ1aWxk
IGl0IGFzIG1vZHVsZS4gU28sIEkgd2lsbCBwcm9iYWJseSBwdXQgYSBjb21tZW50DQo+Pj4+DQo+
Pj4+IGFib3V0IHRoYXQgaW4gdGhlIE1ha2VmaWxlIGV4cGxhaW5pbmcgdGhlIG5lZWQgZm9yDQo+
Pj4+DQo+Pj4+IG9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQpICs9IHhlbi1wY2liYWNr
Lm8NCj4+Pj4gb2JqLSQoQ09ORklHX1hFTl9QQ0lERVZfU1RVQikgKz0geGVuLXBjaWJhY2subw0K
Pj4+IEluIGNhc2UgdGhlIHJlYWwgc3BsaXQgYmV0d2VlbiBib3RoIHBhcnRzIG9mIHhlbi1wY2li
YWNrIGlzIGRvbmUgdGhpcw0KPj4+IHdpbGwgYmUgbmVlZGVkIGFueXdheS4NCj4+IFllcywgaXQg
d2lsbA0KPj4NCj4+IFNvLCBJJ2xsIHB1dCBhIGNvbW1lbnQgaW4gdGhlIE1ha2VmaWxlOg0KPj4N
Cj4+ICMgTi5CLiBUaGlzIGNhbm5vdCBiZSBleHByZXNzZWQgd2l0aCBhIHNpbmdsZSBsaW5lIHVz
aW5nIENPTkZJR19YRU5fUENJX1NUVUINCj4+DQo+PiAjIGFzIGl0IGFsd2F5cyByZW1haW5zIGlu
ICJ5IiBzdGF0ZSwgdGh1cyBwcmV2ZW50aW5nIHRoZSBkcml2ZXIgdG8gYmUgYnVpbHQgYXMNCj4+
DQo+PiAjIGEgbW9kdWxlLg0KPj4NCj4+IG9iai0kKENPTkZJR19YRU5fUENJREVWX0JBQ0tFTkQp
ICs9IHhlbi1wY2liYWNrLm8NCj4+IG9iai0kKENPTkZJR19YRU5fUENJREVWX1NUVUIpICs9IHhl
bi1wY2liYWNrLm8NCj4+DQo+PiBXaWxsIHRoaXMgYmUgb2sgb3IgbmVlZHMgc29tZSByZS13b3Jk
aW5nPw0KPiBJIGFtIGZpbmUgd2l0aCBpdCBhbmQgaG9uZXN0bHkgdGhhdCB3YXMgdGhlIG9ubHkg
Y29tbWVudCBJIGhhZCBzbyB5b3UNCj4gY2FuIGFkZCBteQ0KPg0KPiBSZXZpZXdlZC1ieTogU3Rl
ZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPg0KT2ssIHRoYW5rIHlvdQ==

