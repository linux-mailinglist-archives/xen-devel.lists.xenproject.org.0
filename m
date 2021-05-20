Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A71F38AE7A
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 14:37:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130959.245029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhvg-0001m0-UX; Thu, 20 May 2021 12:37:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130959.245029; Thu, 20 May 2021 12:37:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljhvg-0001k3-P4; Thu, 20 May 2021 12:37:32 +0000
Received: by outflank-mailman (input) for mailman id 130959;
 Thu, 20 May 2021 12:37:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSyT=KP=epam.com=prvs=5774c33267=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1ljhvf-0001iW-BA
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 12:37:31 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95300298-f3ef-44b6-b0f6-f1e624989bd1;
 Thu, 20 May 2021 12:37:30 +0000 (UTC)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14KCabLA003314; Thu, 20 May 2021 12:37:28 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2107.outbound.protection.outlook.com [104.47.17.107])
 by mx0a-0039f301.pphosted.com with ESMTP id 38np2e0g12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 12:37:28 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB5009.eurprd03.prod.outlook.com (2603:10a6:208:105::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Thu, 20 May
 2021 12:37:26 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::3541:4069:60ca:de3d%6]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 12:37:26 +0000
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
X-Inumbo-ID: 95300298-f3ef-44b6-b0f6-f1e624989bd1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nALrMstIlogndlm7C7UlsWHBldekZd8SXOfHQf7Xf6PX5AulIwtbk5uvbk3D1zZqMay/FyndD78+KgdKf5BTBOtgcx9+PRRgjYVVU4vMQVBV8BikEQDv/LN3ZSpiOGQXvoWb+ofd5vXavJQKirVRBF1iHmdOOSFGrf6GY7Lh6kC8toZT09aOUw3NW4v9h/x+gBJVqTiwqhoos6esBv66BxCLAG2RYHrlMK0f432Xgj2XO5o16KhELRWgIM6OqyU5BbjdXLyWAyJ7TvM2rs7UFTWe7JShx4Et/DQYY0HKkJZzMSzK3TqQQtHT77lwLbzgJH5SHCccojXEvCoSWDyaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zDKcSm7p+DfaZQ1ZIrsz7KAPlrbPwXHx3x5bBdujwQ=;
 b=Eabb3bktBUisNzeTK7tl8MaqE06GsARM+WuoJ5jW2d7isd7QGe4SSKFhglt8XnFeQoegy2sZ7yembxL1AFyi/IQV2SiXw7CmnSRkRsalRlsnkKvL4b88Hr/uY6Bbxb1WxlcNHVgW4Xk0B29ZClqyZaONEholBAiQBRxBipUJ+mBX84fQcGvjs5ugKuoUlfmF6U/RfL1fIPTycRgaor7jKNQF9baT6wtXIFxklH4b4OOyxUPmR+lPFWkFzYPcRg9grQrSSKrNvQxNCkVelJMO5Cwg3oTsKl6/6qACek4aMACErK0poHBdagiLtgXAbxHDvHiwn4R0vA+MIZdmQjJK3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zDKcSm7p+DfaZQ1ZIrsz7KAPlrbPwXHx3x5bBdujwQ=;
 b=l/4fvpr5LMvF/l2fOZSHV4P1FZ1r7hXd6cpTNoMFl4xHtZDuTzC2GpeDPS9AQmRxDv8SEBVtoaIrvP2M9oQl2Ki1k7ECvm+MyK7uHg613biCwljrlDWuugVZBU5HXmaxtqA+4OejSCxjBvOpyt1g3h7lOqL2nCZzw0aULUUolECfXuC89WoAJF+rPgx3H7k2q3J5nix8a2RdFWsDtM+epknQP+gLOMZEZkd/9ymhz4Bdk92YhCGv07yl0vWXixVMpaRCFxw5RTqWelRJyFuJbLeEs2adZw8scsuLENJXlrqo4xssCfheAzmSuQdOMj6gFlQo/KfJjagkf+/ptplF0A==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Andrii
 Chepurnyi <Andrii_Chepurnyi@epam.com>
Subject: Re: Hand over of the Xen shared info page
Thread-Topic: Hand over of the Xen shared info page
Thread-Index: 
 AQHXR86B8dxtD5lx60CgXee9ciHSoarhFtmAgAGmygCACItDgIAAMAgAgABnUwCAAEoLgIAAL9yA
Date: Thu, 20 May 2021 12:37:25 +0000
Message-ID: <343a2710-c0a2-5454-8e1c-2b0a7f263f01@epam.com>
References: <64bc6ab6ec387acebb40c1b4786dfda1050f9d50.camel@epam.com>
 <8ff05bdf-a6c4-6b14-b39c-7d9b3bb9d279@xen.org>
 <1db54c363eae22613280e7181805abee396fe5e9.camel@epam.com>
 <8d1ecf6c-a0d1-d9bc-5daf-d02a34fff1e6@xen.org>
 <alpine.DEB.2.21.2105191604130.14426@sstabellini-ThinkPad-T480s>
 <4b686071-3260-87b1-d240-8d3c2b48f1f8@epam.com>
 <0d502893-f433-30b9-72a5-6842274239f3@xen.org>
In-Reply-To: <0d502893-f433-30b9-72a5-6842274239f3@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [185.199.97.5]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb9e926c-4e3f-401c-3e45-08d91b8c060b
x-ms-traffictypediagnostic: AM0PR03MB5009:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <AM0PR03MB500958C2CDAE9A7A6229FB7CE72A9@AM0PR03MB5009.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 p+ojGHH1npJj/d29sudZ2TIEokC1DQcR40tZ9oziHtUxeSQNZygwIclcRwRqLvFlenl63XgHR223FP0nhpT8tz7nkiFF6y5I2aakp55AcS2rU6FoqFHY5KSc3D+O6byJ522Pi4UigBR788vUxoAQQGNG8RXP0moIsfiv5Q3erdM2oToYsoaMRNtEndAEAZBucPHOHbHhZb/HYURELrjagdvfB23iIAD2o5vuN2Dy9UzzWunYycK1QeActU53voF/VTCvXWwuRzLlbG7ZMgg8p/w0f5wsjZFrv4Hnd+8wkmOoomRfJTUfeDBeJRxEh6MqOTrrsvKeKc7+GXiFURmDAex6E5vD/2m3g8EFCyw9E49h01Mg5ZkK+7MouK2s9E4ylI8jEM0QiHyyVy8ImIZGA3kOWcvD0DGhqwf7CvjiGR+WNqstSPyYWAkOu2MSVAwnclTrvCb9BkTHmhhoJ7mCTV/cKr3T5iemVApjWzGlaVQqK+jheIwBjdWv86E3qojIVtbBjkUd/9bL1oCjVbMfo/i+F+kxmYASVIirykAuoSZBGT01FhofgrT4i6y+kDj5b3JsZR2VQOIYysYqlFmEZPf/DV8ABwIosnXESRBqfcM6XIdSL7j12Zpeo13dlfCVzQqa9poDMs5BJGcg88rnkcFii0yXXAYzow8qitA3Gx8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(6486002)(36756003)(26005)(6506007)(54906003)(83380400001)(110136005)(31696002)(31686004)(6512007)(64756008)(66446008)(66556008)(4326008)(66476007)(2906002)(76116006)(53546011)(66946007)(186003)(107886003)(71200400001)(2616005)(122000001)(478600001)(5660300002)(86362001)(8676002)(316002)(38100700002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?aHpYS29pZDdPZjU1SU01N09OVzYveFpyMHZLc0gyOG04eGxGR1hRQU14UkdG?=
 =?utf-8?B?a1hyMUtUOVVvT1oyMFhEV0hMVXgyZ1BiMndqL0FGZFltQno2b3FUYk9VVTIy?=
 =?utf-8?B?L2RKMUgweVNVMXBKdTFyK2RLTG9NdGVmME9GMi9UVjJnZGJhck54WmRLZnFY?=
 =?utf-8?B?MVd5OVpzUGJLdlVHLzFCM21JYnFKWmxYZm11Q1duUnZUcmE0b2t6YW41dFFm?=
 =?utf-8?B?YTFmakhCb0tITFVGTmtKQ1pVdC9adG1lbE9Qd1g3a0Vwak14VzAyTkQzc2M5?=
 =?utf-8?B?cGZpMXRpZTVSYmFJOGl4ZU0wTENIbVRRNUVrYmFDZUU5cjBGL3RrQ2x2bVhw?=
 =?utf-8?B?YzZEbk5nRzZBdUt2YW5uM2hUblptNXFxcWppMGJmRkF5T3lmdy9BTkhqM08w?=
 =?utf-8?B?c1dxMVNpbWRsUDFwZXJLekU1Y1ZUSjFkeDZWR29senZtMXJKdTBxL29aRFpm?=
 =?utf-8?B?V0ttblMzOVU2enRpU1dVeGkwcEZUNGZCclg3bnYrWjF3WjFMWDN5eDRJeTZK?=
 =?utf-8?B?SUxNV1RnQmRhbmVmZVdVdjBEUEIrN1FUdHNVM3dyUytZSmJNd3NQdUdpaEdU?=
 =?utf-8?B?eEZmaGc2MWd1a3VKV2hVUnIxdS9WdFpFNkNEb3FDMFVnRSt3UGtuSjdpU2JC?=
 =?utf-8?B?SUlyZzNzWEY3aStVMHJoWmszRXpQUnlCTnB6clp6czlsUXRDL3JMZUNQRTls?=
 =?utf-8?B?TjczUXFKajl6NmFnTEUzOHZKY2wrckRGSFd6NnJnZGJIVUV0ZTBDWW0ydlgr?=
 =?utf-8?B?NjZlbW94eHlBMXhOWmdlRkdxZ2xXZjcwN2FmdTY1K3lUSStxcEhvdkFMMXRs?=
 =?utf-8?B?dFVWS0lMT3FZa3ZxY1FxYW9hRkdnbDkwZlQvWjhPRkliVDFrTE1rSjJDdzJE?=
 =?utf-8?B?Yk1LUDl4R1ZFSDRVSHB6ZnloV09iWUluQ1NVVEdrLytycGE1c1dsTnp1QzMy?=
 =?utf-8?B?VXJpN2JVSTI4QUVZT0VYQ2E4KzgzUUx6ZFJ6bWUwRW5idlRvOEhmYUZhNmp2?=
 =?utf-8?B?ejFtOXVOSWpQL0h1RUpIR2RBNFppajIrRi9ITWpJaWwyVnFWR0c3ejR4V1NM?=
 =?utf-8?B?ODJoVHU3amkxNEp1Tm9ISTdNZjg0NGlNb2hqZ2FQbnMrVUlmM2NOUTgzYTlT?=
 =?utf-8?B?TGM5ZFBDRCsrUHhOZG5vd0xEUmhlSE5lYUJwSlQ3d2p1b3dIMnppelpwRm9I?=
 =?utf-8?B?U2V0U2daeWxXSDgzdUJlYzh0aFVYaDB5YVRqSnFGMUdoMVRxa0hvd3JtTkpp?=
 =?utf-8?B?SlBDbkc0cXUzTytrZzJ5cTZtaFZTd3l0ZFdJRmRrb1RJL3lLQnF4VmpNL2hO?=
 =?utf-8?B?Nit1b1NlbGRzVCtQK0xkUDBKbWR6ZEUxSWJHRjBMVUcyN0JFZXVkeVRmQjkv?=
 =?utf-8?B?UGRmQUxmZkhFZVdGUFVsVUlXd0Z5bWxQemdmVUVtd1h3RlRIdWFXb2xWOU1T?=
 =?utf-8?B?WnhjN21lOXVaMkFhUmowcTNXNWhpOUF3OXFKNlBoWnNQT0J6R3JFTEMrbzVq?=
 =?utf-8?B?UEdqYlZGTERST1NoaXUvMXl6WFBrcjhoVHBsRUhJZlBpU01jRkNCTjdUUU1x?=
 =?utf-8?B?TnFRNjFlbUh5d3MzZWJ5cW1yeVdvRW1icXNibEhWYWdSem8xODZYQVVQUm4z?=
 =?utf-8?B?a2ZJZlEyVUhOVUROd0ZLZVVZTnF0SmJWR3ozVkJ0NENVWVpzVHlLU0lpajlD?=
 =?utf-8?B?WjhjWHo0MjY4V1dTRWlUTExJV0xDajF2d1VmNmo1bWo4SXN2eDNWeHFWRkRl?=
 =?utf-8?Q?bJNBXv0Ar5ftWkWyAfnNEl/LEkiTXBgKRfv764J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC037EEF6B276640896AE1E36FC508D0@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9e926c-4e3f-401c-3e45-08d91b8c060b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2021 12:37:25.9182
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PSkABlwcx2GxFrowVSYruJhZo0CRkN6EeBI6rZ0AGvVwT+zEZilDn7T7yt5AoRmd1TP8rCc9gBeEeGEXZCIoU3/6x/cbSCIwlM48zWnlfE+VIx9XzXzArNFxROvZZ8hF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB5009
X-Proofpoint-GUID: e0VB8KoA_woPSpEQsAqZjdz3TGJOkiz_
X-Proofpoint-ORIG-GUID: e0VB8KoA_woPSpEQsAqZjdz3TGJOkiz_
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105200096

SGksDQoNCk9uIDUvMjAvMjEgMTI6NDYgUE0sIEp1bGllbiBHcmFsbCB3cm90ZToNCj4NCj4NCj4g
T24gMjAvMDUvMjAyMSAwNjoyMSwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiBI
aSwgYWxsIQ0KPg0KPiBIaSwNCj4NCj4NCj4+IE9uIDUvMjAvMjEgMjoxMSBBTSwgU3RlZmFubyBT
dGFiZWxsaW5pIHdyb3RlOg0KPj4+IE9uIFdlZCwgMTkgTWF5IDIwMjEsIEp1bGllbiBHcmFsbCB3
cm90ZToNCj4+Pj4gT24gMTQvMDUvMjAyMSAxMDo1MCwgQW5hc3Rhc2lpYSBMdWtpYW5lbmtvIHdy
b3RlOg0KPj4+Pj4gSGkgSnVsaWVuIQ0KPj4+PiBIZWxsbywNCj4+Pj4NCj4+Pj4+IE9uIFRodSwg
MjAyMS0wNS0xMyBhdCAwOTozNyArMDEwMCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4+IE9u
IDEzLzA1LzIwMjEgMDk6MDMsIEFuYXN0YXNpaWEgTHVraWFuZW5rbyB3cm90ZToNCj4+Pj4+PiBU
aGUgYWx0ZXJuYXRpdmUgaXMgZm9yIFUtYm9vdCB0byBnbyB0aHJvdWdoIHRoZSBEVCBhbmQgaW5m
ZXIgd2hpY2gNCj4+Pj4+PiByZWdpb25zIGFyZSBmcmVlIChJT1cgYW55IHJlZ2lvbiBub3QgZGVz
Y3JpYmVkKS4NCj4+Pj4+IFRoYW5rIHlvdSBmb3IgaW50ZXJlc3QgaW4gdGhlIHByb2JsZW0gYW5k
IGFkdmljZSBvbiBob3cgdG8gc29sdmUgaXQuDQo+Pj4+PiBDb3VsZCB5b3UgcGxlYXNlIGNsYXJp
ZnkgaG93IHdlIGNvdWxkIGZpbmQgZnJlZSByZWdpb25zIHVzaW5nIERUIGluIFUtDQo+Pj4+PiBi
b290Pw0KPj4+PiBJIGRvbid0IGtub3cgVS1ib290IGNvZGUsIHNvIEkgY2FuJ3QgdGVsbCB3aGV0
aGVyIHdoYXQgSSBzdWdnZXN0IHdvdWxkIHdvcmsuDQo+Pj4+DQo+Pj4+IEluIHRoZW9yeSwgdGhl
IGRldmljZS10cmVlIHNob3VsZCBkZXNjcmliZWQgZXZlcnkgcmVnaW9uIGFsbG9jYXRlZCBpbiBh
ZGRyZXNzDQo+Pj4+IHNwYWNlLiBTbyBpZiB5b3UgcGFyc2UgdGhlIGRldmljZS10cmVlIGFuZCBj
cmVhdGUgYSBsaXN0IChvciBhbnkNCj4+Pj4gZGF0YXN0cnVjdHVyZSkgd2l0aCB0aGUgcmVnaW9u
cywgdGhlbiBhbnkgcmFuZ2Ugbm90IHByZXNlbnQgaW4gdGhlIGxpc3Qgd291bGQNCj4+Pj4gYmUg
ZnJlZSByZWdpb24geW91IGNvdWxkIHVzZS4NCj4+PiBZZXMsIGFueSAiZW1wdHkiIG1lbW9yeSBy
ZWdpb24gd2hpY2ggaXMgbmVpdGhlciBtZW1vcnkgbm9yIE1NSU8gc2hvdWxkDQo+Pj4gd29yay4N
Cj4+DQo+PiBZb3UgbmVlZCB0byBhY2NvdW50IG9uIG1hbnkgdGhpbmdzIHdoaWxlIGNyZWF0aW5n
IHRoZSBsaXN0IG9mIHJlZ2lvbnM6DQo+Pg0KPj4gZGV2aWNlIHJlZ2lzdGVyIG1hcHBpbmdzLCBy
ZXNlcnZlZCBub2RlcywgbWVtb3J5IG5vZGVzLCBkZXZpY2UgdHJlZQ0KPj4NCj4+IG92ZXJsYXlz
IHBhcnNpbmcgZXRjLiBJdCBhbGwgc2VlbSB0byBiZSBhIG5vdC10aGF0LXRyaXZpYWwgdGFzayBh
bmQgYWZ0ZXINCj4+DQo+PiBhbGwgaWYgaW1wbGVtZW50ZWQgaXQgb25seSBsaXZlcyBpbiBVLWJv
b3QgYW5kIHlvdSBoYXZlIHRvIG1haW50YWluIHRoYXQNCj4+DQo+PiBjb2RlLiBTbywgaWYgc29t
ZSBvdGhlciBlbnRpdHkgbmVlZHMgdGhlIHNhbWUgeW91IG5lZWQgdG8gaW1wbGVtZW50DQo+Pg0K
Pj4gdGhhdCBhcyB3ZWxsLg0KPg0KPiBZZXMsIHRoZXJlIGFyZSBzb21lIGNvbXBsZXhpdHkuIEkg
aGF2ZSBzdWdnZXN0ZWQgb3RoZXIgYXBwcm9hY2ggaW4gYSBzZXBhcmF0ZSB0aHJlYWQuIERpZCB5
b3UgbG9vayBhdCB0aGVtPw0KDQpZZXMsIHNvIHByb2JhYmx5IHdlIGNhbiByZS11c2UgdGhlIHNv
bHV0aW9uIGZyb20gdGhhdCB0aHJlYWQgd2hlbiBpdCBjb21lcyB0byBzb21lIGNvbmNsdXNpb24N
Cg0KYW5kIGltcGxlbWVudGF0aW9uLg0KDQo+DQo+PiBBbmQgYWxzbyB5b3UgY2FuIGltYWdpbmUg
YSBzeXN0ZW0gd2l0aG91dCBkZXZpY2UgdHJlZSBhdCBhbGwuLi4NCj4gWGVuIGRvZXNuJ3QgcHJv
dmlkZSBhIHN0YWJsZSBndWVzdCBsYXlvdXQuIFN1Y2ggc3lzdGVtIHdvdWxkIGhhdmUgdG8gYmUg
dGFpbG9yZWQgdG8gYSBnaXZlbiBndWVzdCBjb25maWd1cmF0aW9uLCBYZW4gdmVyc2lvbiAoY2Fu
IGJlIGN1c3RvbSkuLi4NCj4NCj4gVGhlcmVmb3JlLCBoYXJkY29kaW5nIHRoZSB2YWx1ZSBpbiB0
aGUgc3lzdGVtIChub3QgaW4gWGVuIGhlYWRlcnMhKSBpcyBub3QgZ29pbmcgdG8gbWFrZSBpdCBt
dWNoIHdvcnNlLg0KQWdyZWUgdG8gc29tZSBleHRlbnQNCj4NCj4+IFNvLCBJIGFtIG5vdCBzYXlp
bmcgaXQgaXMgbm90IHBvc3NpYmxlIHRvIGltcGxlbWVudCwgYnV0IEkganVzdCBxdWVzdGlvbiBp
Zg0KPj4NCj4+IHN1Y2ggYW4gaW1wbGVtZW50YXRpb24gaXMgcmVhbGx5IGEgZ29vZCB3YXkgZm9y
d2FyZC4NCj4+DQo+Pj4NCj4+Pg0KPj4+PiBIb3dldmVyLCBJIHJlYWxpemVkIGEgZmV3IGRheXMg
YWdvIHRoYXQgdGhlIG1hZ2ljIHBhZ2VzIGFyZSBub3QgZGVzY3JpYmVkIGluDQo+Pj4+IHRoZSBE
VC4gV2UgcHJvYmFibHkgd2FudCB0byBmaXggaXQgYnkgbWFya2luZyB0aGUgcGFnZSBhcyAicmVz
ZXJ2ZWQiIG9yIGNyZWF0ZQ0KPj4+PiBhIHNwZWNpZmljIGJpbmRpbmdzLg0KPj4+Pg0KPj4+PiBT
byB5b3Ugd2lsbCBuZWVkIGEgc3BlY2lmaWMgcXVpcmsgZm9yIHRoZW0uDQo+Pj4gSXQgc2hvdWxk
IGFsc28gYmUgcG9zc2libGUgdG8ga2VlcCB0aGUgc2hhcmVkIGluZm8gcGFnZSBhbGxvY2F0ZWQg
YW5kDQo+Pj4gc2ltcGx5IHBhc3MgdGhlIGFkZHJlc3MgdG8gdGhlIGtlcm5lbCBieSBhZGRpbmcg
dGhlIHJpZ2h0IG5vZGUgdG8gZGV2aWNlDQo+Pj4gdHJlZS4NCj4+IEFuZCB0aGVuIHlvdSBuZWVk
IHRvIG1vZGlmeSB5b3VyIE9TIGFuZCB0aGlzIGlzIG5vdCBvbmx5IExpbnV4Li4uDQo+Pj4gVG8g
ZG8gdGhhdCwgd2Ugd291bGQgaGF2ZSB0byBhZGQgYSBkZXNjcmlwdGlvbiBvZiB0aGUgbWFnaWMg
cGFnZXMNCj4+PiB0byBkZXZpY2UgdHJlZSwgd2hpY2ggSSB0aGluayB3b3VsZCBiZSBnb29kIHRv
IGhhdmUgaW4gYW55IGNhc2UuIEluIHRoYXQNCj4+PiBjYXNlIGl0IHdvdWxkIGJlIGJlc3QgdG8g
YWRkIGEgcHJvcGVyIGJpbmRpbmcgZm9yIGl0IHVuZGVyIHRoZSAieGVuLHhlbiINCj4+PiBub2Rl
Lg0KPj4NCj4+IEkgd291bGQgc2F5IHRoYXQgcXVlcnlpbmcgWGVuIGZvciBzdWNoIGEgbWVtb3J5
IHBhZ2Ugc2VlbXMgbXVjaA0KPj4NCj4+IG1vcmUgY2xlYW5lciBhbmQgYWxsb3dzIHRoZSBndWVz
dCBPUyBlaXRoZXIgdG8gY29udGludWUgdXNpbmcgdGhlIGV4aXN0aW5nDQo+Pg0KPj4gbWV0aG9k
IHdpdGggbWVtb3J5IGFsbG9jYXRpb24gb3IgdXNpbmcgdGhlIHBhZ2UgcHJvdmlkZWQgYnkgWGVu
Lg0KPg0KPiBJSVVDIHlvdXIgcHJvcG9zYWwsIHlvdSBhcmUgYXNraW5nIHRvIGFkZCBhbiBoeXBl
cmNhbGwgdG8gcXVlcnkgd2hpY2ggZ3Vlc3QgcGh5c2ljYWwgcmVnaW9uIGNhbiBiZSB1c2VkIGZv
ciB0aGUgc2hhcmVkIGluZm8gcGFnZS4NCj4NCj4gVGhpcyBtYXkgc29sdmUgdGhlIHByb2JsZW0g
eW91IGhhdmUgYXQgaGFuZCwgYnV0IHRoaXMgaXMgbm90IHNjYWxhYmxlLiBUaGVyZSBhcmUgYSBm
ZXcgb3RoZXIgcmVnaW9ucyB3aGljaCByZWdpb25zIHVuYWxsb2NhdGVkIG1lbW9yeSAoZS5nLiBn
cmFudCB0YWJsZSwgZ3JhbnQgbWFwcGluZywgZm9yZWlnbiBtZW1vcnkgbWFwLC4uLi4pLg0KPg0K
PiBTbyBpZiB3ZSB3ZXJlIGdvaW5nIHRvIGludm9sdmUgWGVuLCB0aGVuIEkgdGhpbmsgaXQgaXMg
YmV0dGVyIHRvIGhhdmUgYSBnZW5lcmljIHdheSB0byBhc2sgWGVuIGZvciB1bmFsbG9jYXRlZCBz
cGFjZS4NCkFncmVlDQo+DQo+IENoZWVycywNCj4NClRoYW5rIHlvdSwNCg0KT2xla3NhbmRyDQo=

