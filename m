Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B10F1406CE4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 15:27:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184415.333044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgYx-0007Vo-Vd; Fri, 10 Sep 2021 13:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184415.333044; Fri, 10 Sep 2021 13:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOgYx-0007Sg-SO; Fri, 10 Sep 2021 13:27:27 +0000
Received: by outflank-mailman (input) for mailman id 184415;
 Fri, 10 Sep 2021 13:27:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p6NG=OA=epam.com=prvs=9887a95815=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mOgYv-0007SM-Nj
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 13:27:25 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dca78294-4a82-4387-8f62-33d6b88a9b72;
 Fri, 10 Sep 2021 13:27:24 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18ACsh3u006954; 
 Fri, 10 Sep 2021 13:27:22 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54])
 by mx0b-0039f301.pphosted.com with ESMTP id 3b07s684fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Sep 2021 13:27:21 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5555.eurprd03.prod.outlook.com (2603:10a6:208:16d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 13:27:19 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:27:19 +0000
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
X-Inumbo-ID: dca78294-4a82-4387-8f62-33d6b88a9b72
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN4TAwZw4Q7xktTu6jTsA+UKf+/3/x7ox1nX/0qZ3I0eVGjTBqaQ9GpqClhqkrGXGIFrlTnkGyNs6agyZ9MmqL6ZljIx0PONY0qmMMNVcZXUco69zlffNen7SoLfblDFANwjGkl5OGwLx/+OmHPE+BiyzDxitMvrjQhAQHYN5KB9ZlTHF0WGLrYjgkJY+Qjz6tGU3QC0ebaDqmeg4K7mQ0FUtaBFAB5ZF78QEIdpi25VYz/giBKpgn4s8sOeiT0AkdLN/+4Mk/haZeWw/rTe/nWRcTKaq+cBQU4X01bmS/IHLm00+R0e/pFjPajjkXB2KmKL2fhaNY4gbqHl3h4KuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=SqzZ+5bXf5LG+jvRqpxwrpZAT1fbiOEnvBA0HJlkHOg=;
 b=QvKS8YW13/O9y7z0Zwa95ObQunjvyZictDxv3sZ/uct4//iEwcM3NIOD/b84/PcpUHSo+IHzzbINVaiMD9H9GaqJ7G2PdE0azKlRzJ49o/S3NfgkcdHcJjhBzNZoCWvmOIjoG/vmlPpVL3M6uF8OE4HBD9whWXbkaHLvlUOBq62gFYH9nNvP+x81Uu3jpNhFD4QbaTLBRYyzangg04T9JAR4Y8gdLY6nf0Wg3+GeoACkq6PRpOYAXvbpd2/Euy2vDJgtaVRpjuRdRV7AydMhmgIu1/yHNZU7xbNjLEoUXEiHDLs4TA+4H2tTWzkaEM2Hc7tbgB+rN27J6jnHCpza1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqzZ+5bXf5LG+jvRqpxwrpZAT1fbiOEnvBA0HJlkHOg=;
 b=Du59NqAsbmq4amQMAtNdgELaL1/3O9HF9ttT+I5kEJlc8o00vPrfBQObWLFWDtneeSkFSNDrBIkC5iA/DF+AjTKYphBdJMglDIAT79I3iy166IaBmceZ0kjcRTrFI86FXj91fE6I3mUwPEVfDRxJesAjFuNe6kIuU5ZLbvvLkuwnqLqMCl+aeqgd/GvksaebKB/DbzZGx3+23lwuYs1fW8NghnYA1vbb82j7cBoaxkQGNZHBIW/ocM16sKwxa7CcmaGFL4JtZuHXGP7guIZEg1bbqNiND2Zdl1jnDm5dazUJyr5NVGaZY0NkAtWKDr+/ouD1da/RJvQPGL6ZUh+C0Q==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>,
        Oleksandr Andrushchenko
	<andr2000@gmail.com>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: "sstabellini@kernel.org" <sstabellini@kernel.org>,
        Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Artem Mygaiev <Artem_Mygaiev@epam.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Rahul Singh <rahul.singh@arm.com>
Subject: Re: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Topic: [PATCH 09/11] xen/arm: Setup MMIO range trap handlers for
 hardware domain
Thread-Index: 
 AQHXoJ6eIuPEzuAZLUmx1GA90MGEBKucAxCAgAEt4ACAABanAIAAAwIAgAABgYCAAAHPAA==
Date: Fri, 10 Sep 2021 13:27:18 +0000
Message-ID: <7263f268-7f90-e561-4679-f78185c88cd8@epam.com>
References: <20210903083347.131786-1-andr2000@gmail.com>
 <20210903083347.131786-10-andr2000@gmail.com>
 <247bd41c-98e6-f898-8216-e36b22158636@xen.org>
 <8db7ab42-d361-5b20-c648-7af9d0cdaad9@epam.com>
 <d7ecd474-fe0a-2bca-717e-cb82c89358ea@xen.org>
 <ad8ef71c-a834-daff-7ad8-b7c3f718a3e2@epam.com>
 <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
In-Reply-To: <6810eefb-b6d0-9557-7bdd-80ac381e467b@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 17ffaa83-e15d-4568-987c-08d9745eb6ae
x-ms-traffictypediagnostic: AM0PR03MB5555:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM0PR03MB5555694AEF55942738DF9CC7E7D69@AM0PR03MB5555.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0FS06TcNkTeJT7J0zpJWOcU49LNpcKzxthopuCDEb3G3Iy4eKyE7VwI/LP9br/4K4uYx9Bzs2hNADiiDrxeC5SNwgoXlCxJ6+Nha35lbe4ORNkrnBR8pvghdAXmNedduOHbyZwLir6nJdG1RrJ7jAhmGjCYfj3gluEjxUdpi3lJ/48FLbjbDVTKG9qc4qKM4panfH/sLS6AckeaPt4ANpEuxNpE6Hi7h0/+ZCvApHVWoufh6HDK280HVVHEELJAU1kr7miMnBZm7TViCs3jwwOOCeTzkUons5FW3cHUM5wclOPvblsQPqHHuDAA6U8d0iYONn5jnywKtrcXIrVM7NyG6YISpe+N4YvlzBTehx2L/v3LowXq3uZQySwksajuvvImYF82nfQ01s8INPftPCNAQos+MbmoLuijofv2Y/50E2iPQJ9pNTSXn7y7esJe6Q0F3U+7wUm5ZE1fWlYCdQpq2eSuSNTFMNHiP7jwO9dc/4DZIFvsetXyjWEw+yBtm0HXNs3bzN6FhLLv77sMxMatfme6KANmQdFTP6c9Q/84d+qV9FMt6rye4oXvKrYbbhkNs0D30RpWYxFZXSRnYb8wBiNWj+1vNFsQoBHh29aP1JOLrfheZ4Dc0i9JNiKIJ62q2ohiIxYLLW+NqPtNKQ1dyyuihqaansR29CyWtiWZ3Tmn6ax9TdltC1sSocvNWsUzOglqv6+TeyPQvWdMcN41f9d0kg3NtK8vvJO6elOI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(346002)(366004)(31696002)(38100700002)(478600001)(31686004)(71200400001)(76116006)(66446008)(2906002)(66946007)(66476007)(122000001)(54906003)(86362001)(4326008)(8936002)(5660300002)(55236004)(64756008)(66556008)(2616005)(8676002)(6486002)(53546011)(83380400001)(6506007)(91956017)(36756003)(316002)(26005)(38070700005)(6512007)(110136005)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?V2g1UlZCbXp6aXduMG93UFE2clhxMnRYNFJ6TGdoNW0vSEhBVHVxZk0rbTZK?=
 =?utf-8?B?eE9WNUwwWU15cmd0dUNFRWQ1WWNwUFl3RXJNbUViY1dSWW5DQXFKQm1saWpU?=
 =?utf-8?B?Y2JVMERHd0cycGFCOWVBRXhvZHlpbUJJVWo1WHZlOHRXM3Z4UlZNeUtUb0JQ?=
 =?utf-8?B?a0M4V2NzZHB2dUY2YnFwZkg4RFMySDkzeC83RDV3K1I5eHpxanlIQ28rTXdY?=
 =?utf-8?B?cStHTk9UaVh2ZHVrTk53Skc0R3ZLaWNyWVZ1ZExXVFdTSTJxK0pHcTdvdm9M?=
 =?utf-8?B?NHdnNWV5QW4vVUhReEtVT3poeWoxRDVvS2U4ajZTNWN6UUdEaWJIa3lRWXgv?=
 =?utf-8?B?YklXa281RkxiOWp6WUZuemhucy9yL1lFN0FUVzZVU0VyZ1RjUWlZMTdaWE5N?=
 =?utf-8?B?NE9rclpHMkdTVkxsUkNEMnllRVBEakJFaDFIUzYyamNJNlVEUlpZWnVaSTRv?=
 =?utf-8?B?MHpKSFpyUFRUa3MyYWlCRmw5L016c1o1a0E0UWl5VFZrVDJGR1ZvMUJ2SHpC?=
 =?utf-8?B?OUNyT2lpaVNZOTROaEd0UFU4V3lrb2hpUEJmSm90WkdxNGc5TVNzVDljcS81?=
 =?utf-8?B?TGRTeHd1UklhQ1hpUEJKWnJzWkRZS3ZOSDhUNGlsMTlzQi9VUFE4UGFHY0dl?=
 =?utf-8?B?SUlvWkdTNmF2bHhpSitlZGx1enBDRUg1cUpSSnd3RC9FZ2o4TjZ0d2ZVQUVI?=
 =?utf-8?B?TzdWZGZRME1Od2V4MDdEQU1ZNVk5MkxBOUhvSVE3WDBKN25tTm0zYkdRRnUx?=
 =?utf-8?B?czdqVlJsajJKR2JYMHN2MENNT1VxekJseGw4cnFHYUxreUY4c1JlRktLUDVk?=
 =?utf-8?B?QVhPYytNSkxjU2JHTmlvU0dxbG40K3lRSXUxRHF6UzloVk9GZVZOSnl4b3Zq?=
 =?utf-8?B?R2NpVWZKODBWa09Gb1l5aFIrU0xhak1hSnRRS05OaFdvb0VSTTNjUTRMbTg3?=
 =?utf-8?B?VTQxVVNJKzRCaHRBOUt6NmJSRDRESlVNKzVWYVNoZmRRN1hFQk55ZTdIcEcy?=
 =?utf-8?B?RGJvWDR4bitubUxEVHdPNE4yNERNMHpQdmt3UVlUWjJYSk1yeDh1WW8xWFJY?=
 =?utf-8?B?RUNGWmRPR3JFSDRVU2NrblI1K0NDY0lmRHhadlpVeVdOSFRPeDloamtvczdr?=
 =?utf-8?B?cVk1dDBSTTBRTVI4cFJ5dWhjODJIUWNPTWJlQU13Slk3VzU3Uit1WEZBOWg4?=
 =?utf-8?B?d3h2N0RrWTVIdWpQVTZLTFFUQ1B2SVJCREFzS2cxUU1UdHo1b1ozOGp3TlAz?=
 =?utf-8?B?c2pQQ1Jjcno0T1dCYVdrdGJRbkVYUnlkUEJjOGM0Y2d3ZklLWTdtWlplNmt6?=
 =?utf-8?B?OTNiMUVNMHArSmg4eGdBRHV3UUxEYmtEZVVkNXBTQTMvRUJtU2ozMnlDeVVC?=
 =?utf-8?B?ak83d3kvVk14RnVJWjV0WGhhc1g0cGtSRndZZ0M4cDJld3ZjZGFNVzFWQjJ4?=
 =?utf-8?B?WTd6Q3h5eWtqeGluTnR5eXpHQ0oyWnlyTmRUNDRVK0tJelNoYXJvWmJBSXVq?=
 =?utf-8?B?a3owNzJnNEtQVk16bkgzd2xwOXRya0NPSlQrSFhqRnpIRjFEWkZyVGcvdzZB?=
 =?utf-8?B?MktuSndwMWxVTEJ2WVVDRHJiTTBNNTNPSFZvQmxRdUMwYXlYdGw2aHpTMGo0?=
 =?utf-8?B?RWN6VFIycGNLbGFLZ2Z4RkYwSUpNVFFVdHhIL29NdVlGaXFJbGpzSnN2cWoy?=
 =?utf-8?B?S1luOHlqM2c5T2VRaHVSZGM0OUp3K3JqMUxkZjdEUFZXeWtJS1VxOW5ZMml0?=
 =?utf-8?B?WXF3S1pFK2NLTkpENXFsM3g0djRuUlFjUWtjUFd6S2hudGt5NlBhQmdTL01I?=
 =?utf-8?B?L0pGVkIyUWNieE9NS0xyZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9919D1F7A015CB42AFC9E9556F476784@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17ffaa83-e15d-4568-987c-08d9745eb6ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 13:27:18.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y0ta+j2O1ToQXE/aan9n16D6cye3bU9bR1+4LJ8kSQVi0XnfCik833XQpOQTdqvyq5uL6EEUqd0N9uM+15I+2cHyUzKr+BjL1wBzcqA1CGUpzHTwHTl2qyP8LKmUYN2h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5555
X-Proofpoint-GUID: TfTll4-HUvYDpVXpLWza4i-rcYlbsLOK
X-Proofpoint-ORIG-GUID: TfTll4-HUvYDpVXpLWza4i-rcYlbsLOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-10_04,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 phishscore=0 mlxlogscore=999 suspectscore=0
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109100079

SGksDQoNCk9uIDEwLjA5LjIxIDE2OjIwLCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+DQo+DQo+IE9u
IDEwLzA5LzIwMjEgMTQ6MTUsIE9sZWtzYW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4gSGks
IEp1bGllbiENCj4NCj4gSGksDQo+DQo+PiBPbiAxMC4wOS4yMSAxNjowNCwgSnVsaWVuIEdyYWxs
IHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiBPbiAxMC8wOS8yMDIxIDEyOjQzLCBPbGVrc2FuZHIgQW5k
cnVzaGNoZW5rbyB3cm90ZToNCj4+Pj4gSGksIEp1bGllbiENCj4+Pg0KPj4+IEhpIE9sZWtzYW5k
ciwNCj4+Pg0KPj4+PiBPbiAwOS4wOS4yMSAyMDo0MywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+
Pj4gSGkgT2xla3NhbmRyLA0KPj4+Pj4NCj4+Pj4+IE9uIDAzLzA5LzIwMjEgMDk6MzMsIE9sZWtz
YW5kciBBbmRydXNoY2hlbmtvIHdyb3RlOg0KPj4+Pj4+IEZyb206IE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+Pg0KPj4+Pj4+
IEluIG9yZGVyIHZQQ0kgdG8gd29yayBpdCBuZWVkcyBhbGwgYWNjZXNzIHRvIFBDSSBjb25maWd1
cmF0aW9uIHNwYWNlDQo+Pj4+Pj4gKEVDQU0pIHRvIGJlIHN5bmNocm9uaXplZCBhbW9uZyBhbGwg
ZW50aXRpZXMsIGUuZy4gaGFyZHdhcmUgZG9tYWluIGFuZA0KPj4+Pj4+IGd1ZXN0cy4NCj4+Pj4+
DQo+Pj4+PiBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdoYXQgeW91IG1lYW4gYnkgInN5bmNocm9u
aXplZCIgaGVyZS4gQXJlIHlvdSByZWZlciB0byB0aGUgY29udGVudCBvZiB0aGUgY29uZmlndXJh
dGlvbiBzcGFjZT8NCj4+Pj4NCj4+Pj4gV2UgbWFpbnRhaW4gaHdkb20ncyBhbmQgZ3Vlc3QncyB2
aWV3IG9mIHRoZSByZWdpc3RlcnMgd2UgYXJlIGludGVyZXN0ZWQgaW4NCj4+Pj4NCj4+Pj4gU28s
IHRvIGhhdmUgaHdkb20ncyB2aWV3IHdlIGFsc28gbmVlZCB0byB0cmFwIGl0cyBhY2Nlc3MgdG8g
dGhlIGNvbmZpZ3VyYXRpb24gc3BhY2UuDQo+Pj4+DQo+Pj4+IFByb2JhYmx5ICJzeW5jaHJvbml6
ZWQiIGlzIG5vdCB0aGUgcmlnaHQgd29yZGluZyBoZXJlLg0KPj4+IEkgd291bGQgc2ltcGx5IHNh
eSB0aGF0IHdlIHdhbnQgdG8gZXhwb3NlIGFuIGVtdWxhdGVkIGhvc3RicmlkZ2UgdG8gdGhlIGRv
bTAgc28gd2UgbmVlZCB0byB1bm1hcCB0aGUgY29uZmlndXJhdGlvbiBzcGFjZS4NCj4+IFNvdW5k
cyBnb29kDQo+Pj4NCj4+Pj4NCj4+Pj4+DQo+Pj4+Pj4gRm9yIHRoYXQgaW1wbGVtZW50IFBDSSBo
b3N0IGJyaWRnZSBzcGVjaWZpYyBjYWxsYmFja3MgdG8NCj4+Pj4+PiBwcm9wZXJseSBzZXR1cCB0
aG9zZSByYW5nZXMgZGVwZW5kaW5nIG9uIHBhcnRpY3VsYXIgaG9zdCBicmlkZ2UNCj4+Pj4+PiBp
bXBsZW1lbnRhdGlvbi4NCj4+Pj4+Pg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBB
bmRydXNoY2hlbmtvIDxvbGVrc2FuZHJfYW5kcnVzaGNoZW5rb0BlcGFtLmNvbT4NCj4+Pj4+PiAt
LS0NCj4+Pj4+PiDCoMKgwqAgeGVuL2FyY2gvYXJtL3BjaS9lY2FtLmPCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgMTEgKysrKysrKysrKysNCj4+Pj4+PiDCoMKgwqAgeGVuL2FyY2gvYXJtL3BjaS9w
Y2ktaG9zdC1jb21tb24uYyB8IDE2ICsrKysrKysrKysrKysrKysNCj4+Pj4+PiDCoMKgwqAgeGVu
L2FyY2gvYXJtL3ZwY2kuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEzICsrKysr
KysrKysrKysNCj4+Pj4+PiDCoMKgwqAgeGVuL2luY2x1ZGUvYXNtLWFybS9wY2kuaMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgOCArKysrKysrKw0KPj4+Pj4+IMKgwqDCoCA0IGZpbGVzIGNoYW5nZWQs
IDQ4IGluc2VydGlvbnMoKykNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9h
cm0vcGNpL2VjYW0uYyBiL3hlbi9hcmNoL2FybS9wY2kvZWNhbS5jDQo+Pj4+Pj4gaW5kZXggOTFj
NjkxYjQxZmRmLi45MmVjYjJlMDc2MmIgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEveGVuL2FyY2gvYXJt
L3BjaS9lY2FtLmMNCj4+Pj4+PiArKysgYi94ZW4vYXJjaC9hcm0vcGNpL2VjYW0uYw0KPj4+Pj4+
IEBAIC00Miw2ICs0MiwxNiBAQCB2b2lkIF9faW9tZW0gKnBjaV9lY2FtX21hcF9idXMoc3RydWN0
IHBjaV9ob3N0X2JyaWRnZSAqYnJpZGdlLA0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgIHJldHVybiBi
YXNlICsgKFBDSV9ERVZGTihzYmRmX3QuZGV2LCBzYmRmX3QuZm4pIDw8IGRldmZuX3NoaWZ0KSAr
IHdoZXJlOw0KPj4+Pj4+IMKgwqDCoCB9DQo+Pj4+Pj4gwqDCoMKgICtzdGF0aWMgaW50IHBjaV9l
Y2FtX3JlZ2lzdGVyX21taW9faGFuZGxlcihzdHJ1Y3QgZG9tYWluICpkLA0KPj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwY2lfaG9zdF9icmlkZ2UgKmJyaWRnZSwNCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzdHJ1Y3QgbW1pb19oYW5kbGVy
X29wcyAqb3BzKQ0KPj4+Pj4+ICt7DQo+Pj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgcGNpX2NvbmZpZ193
aW5kb3cgKmNmZyA9IGJyaWRnZS0+c3lzZGF0YTsNCj4+Pj4+PiArDQo+Pj4+Pj4gK8KgwqDCoCBy
ZWdpc3Rlcl9tbWlvX2hhbmRsZXIoZCwgb3BzLCBjZmctPnBoeXNfYWRkciwgY2ZnLT5zaXplLCBO
VUxMKTsNCj4+Pj4+DQo+Pj4+PiBXZSBoYXZlIGEgZml4ZWQgYXJyYXkgZm9yIGhhbmRsaW5nIHRo
ZSBNTUlPIGhhbmRsZXJzLg0KPj4+Pg0KPj4+PiBEaWRuJ3Qga25vdyB0aGF0Og0KPj4+Pg0KPj4+
PiB4ZW4vaW5jbHVkZS9hc20tYXJtL21taW8uaDoyNzojZGVmaW5lIE1BWF9JT19IQU5ETEVSwqAg
MTYNCj4+Pj4NCj4+Pj4+IFNvIHlvdSBuZWVkIHRvIG1ha2Ugc3VyZSB3ZSBoYXZlIGVub3VnaCBz
cGFjZSBpbiBpdCB0byBzdG9yZSBvbmUgaGFuZGxlciBwZXIgaGFuZGxlci4NCj4+Pj4+DQo+Pj4+
PiBUaGlzIGlzIHF1aXRlIHNpbWlsYXIgdG8gdGhlIHByb2JsZW0gd2UgaGFkIHdpdGggdGhlIHJl
LWRpc3RyaWJ1b3Igb24gR0lDdjMuIEhhdmUgYSBsb29rIHRoZXJlIHRvIHNlZSBob3cgd2UgZGVh
bHQgd2l0aCBpdC4NCj4+Pj4NCj4+Pj4gQ291bGQgeW91IHBsZWFzZSBwb2ludCBtZSB0byB0aGF0
IHNvbHV0aW9uPyBJIGNhbiBvbmx5IHNlZQ0KPj4+Pg0KPj4+PiDCoMKgIMKgwqDCoCAvKiBSZWdp
c3RlciBtbWlvIGhhbmRsZSBmb3IgdGhlIERpc3RyaWJ1dG9yICovDQo+Pj4+IMKgwqAgwqDCoMKg
IHJlZ2lzdGVyX21taW9faGFuZGxlcihkLCAmdmdpY19kaXN0cl9tbWlvX2hhbmRsZXIsIGQtPmFy
Y2gudmdpYy5kYmFzZSwNCj4+Pj4gwqDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBTWl82NEssIE5VTEwpOw0KPj4+Pg0KPj4+PiDCoMKgIMKgwqDC
oCAvKg0KPj4+PiDCoMKgIMKgwqDCoMKgICogUmVnaXN0ZXIgbW1pbyBoYW5kbGVyIHBlciBjb250
aWd1b3VzIHJlZ2lvbiBvY2N1cGllZCBieSB0aGUNCj4+Pj4gwqDCoCDCoMKgwqDCoCAqIHJlZGlz
dHJpYnV0b3JzLiBUaGUgaGFuZGxlciB3aWxsIHRha2UgY2FyZSB0byBjaG9vc2Ugd2hpY2gNCj4+
Pj4gwqDCoCDCoMKgwqDCoCAqIHJlZGlzdHJpYnV0b3IgaXMgdGFyZ2V0ZWQuDQo+Pj4+IMKgwqAg
wqDCoMKgwqAgKi8NCj4+Pj4gwqDCoCDCoMKgwqAgZm9yICggaSA9IDA7IGkgPCBkLT5hcmNoLnZn
aWMubnJfcmVnaW9uczsgaSsrICkNCj4+Pj4gwqDCoCDCoMKgwqAgew0KPj4+PiDCoMKgIMKgwqDC
oMKgwqDCoMKgIHN0cnVjdCB2Z2ljX3JkaXN0X3JlZ2lvbiAqcmVnaW9uID0gJmQtPmFyY2gudmdp
Yy5yZGlzdF9yZWdpb25zW2ldOw0KPj4+Pg0KPj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgIHJlZ2lz
dGVyX21taW9faGFuZGxlcihkLCAmdmdpY19yZGlzdHJfbW1pb19oYW5kbGVyLA0KPj4+PiDCoMKg
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmVnaW9uLT5iYXNlLCByZWdpb24tPnNpemUsIHJlZ2lvbik7DQo+Pj4+IMKgwqAgwqDCoMKg
IH0NCj4+Pj4gd2hpY2ggSU1PIGRvZXNuJ3QgY2FyZSBhYm91dCB0aGUgbnVtYmVyIG9mIE1NSU9z
IHdlIGNhbiBoYW5kbGUNCj4+Pg0KPj4+IFBsZWFzZSBzZWUgdmdpY192M19pbml0KCkuIFdlIHVw
ZGF0ZSBtbWlvX2NvdW50IHRoYXQgaXMgdGhlbiB1c2VkIGFzIGEgdGhlIHNlY29uZCBhcmd1bWVu
dCBmb3IgZG9tYWluX2lvX2luaXQoKS4NCj4+DQo+PiBBaCwgc28NCj4+DQo+PiAxKSBUaGlzIG5l
ZWRzIHRvIGJlIGRvbmUgYmVmb3JlIHRoZSBhcnJheSBmb3IgdGhlIGhhbmRsZXJzIGlzIGFsbG9j
YXRlZA0KPj4NCj4+IDIpIEhvdyBkbyBJIGtub3cgYXQgdGhlIHRpbWUgb2YgMSkgaG93IG1hbnkg
YnJpZGdlcyB3ZSBoYXZlPw0KPg0KPiBCeSBjb3VudGluZyB0aGUgbnVtYmVyIG9mIGJyaWRnZSB5
b3Ugd2FudCB0byBleHBvc2UgdG8gZG9tMD8gSSBhbSBub3QgZW50aXJlbHkgc3VyZSB3aGF0IGVs
c2UgeW91IGV4cGVjdCBtZSB0byBzYXkuDQoNCk9rLCBzbyBJJ2xsIGdvIG92ZXIgdGhlIGRldmlj
ZSB0cmVlIGFuZCBmaW5kIG91dCBhbGwgdGhlIGJyaWRnZXMsIGUuZy4gZGV2aWNlcyB3aXRoIERF
VklDRV9QQ0kgdHlwZS4NCg0KVGhlbiBJJ2xsIGFsc28gbmVlZCB0byBleGNsdWRlIHRob3NlIGJl
aW5nIHBhc3NlZCB0aHJvdWdoICh4ZW4scGFzc3Rocm91Z2gpIGFuZCB0aGUgcmVzdCBhcmUgdGhl
IGJyaWRnZXMgZm9yIERvbWFpbi0wPw0KDQpJcyB0aGlzIHdoYXQgeW91IG1lYW4/DQoNCj4NCj4g
Q2hlZXJzLA0KPg0KVGhhbmsgeW91LA0KDQpPbGVrc2FuZHINCg==

