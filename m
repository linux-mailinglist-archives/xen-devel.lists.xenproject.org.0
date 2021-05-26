Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2F63913C3
	for <lists+xen-devel@lfdr.de>; Wed, 26 May 2021 11:31:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.132429.247016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpsy-0006Q4-GF; Wed, 26 May 2021 09:31:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 132429.247016; Wed, 26 May 2021 09:31:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1llpsy-0006Mp-CL; Wed, 26 May 2021 09:31:32 +0000
Received: by outflank-mailman (input) for mailman id 132429;
 Wed, 26 May 2021 09:31:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8HVS=KV=epam.com=prvs=578065f5e4=sergiy_kibrik@srs-us1.protection.inumbo.net>)
 id 1llpsw-0006Mj-AB
 for xen-devel@lists.xenproject.org; Wed, 26 May 2021 09:31:30 +0000
Received: from mx0b-0039f301.pphosted.com (unknown [148.163.137.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c1f7966-8f11-4347-9682-54a2695ca15a;
 Wed, 26 May 2021 09:31:29 +0000 (UTC)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14Q9QNJr023256; Wed, 26 May 2021 09:31:28 GMT
Received: from eur04-he1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2051.outbound.protection.outlook.com [104.47.13.51])
 by mx0b-0039f301.pphosted.com with ESMTP id 38sk4br4pm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 May 2021 09:31:28 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com (2603:10a6:20b:2d8::8)
 by AM0PR03MB4641.eurprd03.prod.outlook.com (2603:10a6:208:cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Wed, 26 May
 2021 09:31:23 +0000
Received: from AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135]) by AM9PR03MB6836.eurprd03.prod.outlook.com
 ([fe80::9151:70c8:8d48:5135%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 09:31:23 +0000
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
X-Inumbo-ID: 2c1f7966-8f11-4347-9682-54a2695ca15a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9RDp1kRPCq97Bwz7V00GwkfKbZFrmHvoooVSTwi+xE+GDFmxmif2tkVL5rvao5Wo1zDsSTaiSqWT8axnWjttLs0TfVPjRgpI9j7sNo0hSJ+1hKnExciIHvWquc3vnNgaaCE//RKAzWn3G81S96Im52ZSPceROabFfzM6DO3HlJvE9sXB2xUYTovmaVr18YxkBv2im+znABia36mzKLtIkzMvBvTWz4ut0/yF/IuXVOmA5IRaUwpowOPIDJazRI2UbHHODsYWR7IUJEqbRjbYladPclEoGbGOSv5DMLn0dZiKK3xfNoeNGymXDbbW8qDiVkKEmLrc0ol89np+eOsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/z7ZfJGX+yXehS429o8PNtFTKLSmkLooC46JXApD3TQ=;
 b=SS++DUzFY/fnZbw8AqHfHykSKNpaYxjK1UedmkgjH3Oy9xz+RQiHzAErc7A8w1GFlZnMEHlgzJZFwwCdWj9WZojH7yIcPhGJ874OWJxAPWZWJnE+oL8ivK4a+4TQcNLmTeNX6MQM6ebVyyg68nriy70QhBFmQ70GYW8iWCLAU1mvemaM86rXL7vDYv0f0zGnNiOOBQ+DPrTbJhivjdM8PgJmGnzEQJow7RsEHyjH78YD9gDVqIAlOWFRgbBvIxO0IVozr/rjwwTUwfa9O5M/D09nPdUEFHlinqh9l9e98KxoB6b6I6MddL0wgs0ewfqzPYwe9zjDD3XJvDEUEqYIXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/z7ZfJGX+yXehS429o8PNtFTKLSmkLooC46JXApD3TQ=;
 b=yDnFlgIKsVLZ3nKyYA9t6rWusygpfOahJ247K1OXQhgaiH8dW6yWFriB+fSc7zi6jNG7WC7pxrOhBZJFC4oDK2gNP6Q8sHeTFx+BGZJ+4ytJZTbJOhS4oHskKUiXQllzamjcwHzpM8dbF4TBEIoVDo2qfOBMnCv8T9gwPbMXVDJMAD9ZcPYDlA2w+bsecODGG3WRWcZ+YYX5+tPauU8MZcxGFGehwyTYF+hFTC/MpwJ7eRfn8lQglvx8P99pXdB5Ld2SxJOUjLnA3CuRGR5TPuDUJyDpU2dpR1CjAC1QaEWwmxepGjPjirfkugyTkYj9CHL0NQsH2PEzM/AumRO2eg==
From: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
To: Julien Grall <julien@xen.org>,
        "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: RE: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
Thread-Topic: [XEN PATCH v1] libxl: use getrandom() syscall for random data
 extraction
Thread-Index: AQHXUJviVlkCcTT7D0WghZSRk2JxUar1gejg
Date: Wed, 26 May 2021 09:31:23 +0000
Message-ID: 
 <AM9PR03MB68362CAC724A6BEE4A50B96AF0249@AM9PR03MB6836.eurprd03.prod.outlook.com>
References: <20210524085858.1902-1-Sergiy_Kibrik@epam.com>
 <13bde708-1d87-a2c7-077f-f08db597ae15@xen.org>
In-Reply-To: <13bde708-1d87-a2c7-077f-f08db597ae15@xen.org>
Accept-Language: en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=epam.com;
x-originating-ip: [95.67.114.216]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 816b6b38-ad95-4345-9abd-08d920290704
x-ms-traffictypediagnostic: AM0PR03MB4641:
x-microsoft-antispam-prvs: 
 <AM0PR03MB464187E41A3E2F14E4853238F0249@AM0PR03MB4641.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o9N2iyDu/RauI4YbukYcXZ7dj24vs3dI5rEb9C0o0Gk5gbqvOrBTLzKF70ZmiTECoSfKcxRmNRiDC1ku2KuQqt4Ngz2FkobgUfOoo//0qM0JhfdL4a6JEn6hwtJGfFEH93gFKu+t/sw5xAdMxYi6M7HH+2f/NkF5BOKWHr0OtpPyeBfIQTIxQClZmD6QIdydgQtD4io+4DHvOslup0MX1lKwgZGI4tffmvaS9PIHbUd6zKYY2D+nBBsEOoGD93hbHBrVAgAaTQ/0O1NASm2xLrEdACKlwM5cGsgLkrgcocCNSFX18ecXHZ6ePQ10kLi1ps32W79FNlOUUcoyoDWz310vnxm1Ip8c++mYJte9UdNC8RtFjZCS2sh1yOujHpHlB/6eqKM6bffpNg5fig9tkGYpYPvAYzdqQCRr0mXmmDHLm2WcOiBrfbBhEs/gffpRmydnNFGnB0d/YXYmR8LtDxc3uYk6hMF7YpBnD4IeIyF/rCOrHI/bEODTj/urN6mW4lJT+/vMWxbH2cEbhcy5vAHdHc2ZaxLC+SPmt5SYECmv4kvpQEa7ylHIZTtOhA5tIUzGKwlXVVExmZFNUgEm+mBdZd+HH6pK4LvVNX52EhI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR03MB6836.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(110136005)(316002)(54906003)(9686003)(2906002)(7696005)(8936002)(71200400001)(33656002)(26005)(4326008)(4744005)(5660300002)(55016002)(478600001)(186003)(86362001)(76116006)(52536014)(66946007)(66476007)(64756008)(38100700002)(8676002)(6506007)(122000001)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?bGpzS3YvbFlGRFQvNHEybkRoNDkwN3NqR3RTbFVYUVVaRm1NV1BzaFRQY1gz?=
 =?utf-8?B?V25PV0l0ZTdleUlacGptVnBRcGl2WXQ5cElISWRqVWlYeGUxTU50elY5aktW?=
 =?utf-8?B?QlhpdnRQdDRZR3VHTHY4RU9KY0FWakRvdHl4emVvYTNsVHZxeWhUeG1Hc2tl?=
 =?utf-8?B?RnBpb1hOOVRDRVBKZHR1andMS1lTb3BYenFOREk1RmtIaE1md1JaMEpsL3Rn?=
 =?utf-8?B?OWphamJ2WDV0TzN1ZHpNdyt2RkhVR2JhYURuWnFURUlMUWdzT3IvWGVuZEdV?=
 =?utf-8?B?YzVFOHdFZ1FJWTR5SWROc1lqWmcvamh4TW5TU3NSSi94M2FOajlyMXFRTFZz?=
 =?utf-8?B?M0toMnMwdktkcFV4dUJJbnVrWFM4Y2RoWjRhbU9EYmU1OHRoczRHaVMrL1lx?=
 =?utf-8?B?SFpVclFuLzNJRFJLcTZTZkladFRYOWNGYWg0MDhCMENxUzN1V3dVcTdWSnFL?=
 =?utf-8?B?cllPUk91SzRsLy9idW9IR1VwYnlRSFpEUmtNY3dlK2lId0pWcllLbC8xcGRH?=
 =?utf-8?B?U2dBWTBYaU9Fc0ZzM3h4SXdwTW1lSlpNVVh6dTJ3TlUzbTg5czR1TWFlVnda?=
 =?utf-8?B?T1ZxSTF0VDB6QkF2akFMVzJBeXdIWlZyK09ZTEt3UitRcXBsUnhqUERKcW40?=
 =?utf-8?B?b3V6ZWtQUmxBeWE2RDJaUGYzM0hEdFh1QnZYenhEVGZmUjJ6N2E2OG9OSFdH?=
 =?utf-8?B?RmJxRUQ0WW1mNHFMVHhKamhMOGhNM2FPZTRYSjAvdFlUTG9KVmRDTFAyNzRr?=
 =?utf-8?B?R2VLVDZFdUR3eFhIRkZqRWhDcnFRYkFGWWY1UHZnVG56bDBSMkE4K0h3NDhv?=
 =?utf-8?B?SFpLMVlxd3dPOVR4V1MrWVA5Q05UWkVkRlJXYnF6NVBoUVBNOS9uVDBpM09y?=
 =?utf-8?B?WlpraWEwMHBuUW02bXo4QjkwTlVRYlRqdDRQRy9XZ3Voejl1Q2hYRW5PeEJL?=
 =?utf-8?B?RlF5eUk0WjNlKzlJbVVyaGx1N09MMzE5cUhBSDViR0Nycis3NHpxM0RtN1Fy?=
 =?utf-8?B?WEkvOU93b0MvWUlJZGVPTFlRRUNHbS8vVVpQZzlIcFlVVm5YcEUrTHZRejFB?=
 =?utf-8?B?SUFqM2xIMVRiWHdlTnNGSGJBS3l2eGoxZzFNWVdYeE1HSjdsUExCVVpBWEw3?=
 =?utf-8?B?bE85L3ZMcWlWNEkzcWZLZEpzSk50NDFjUHJEeFBUaU1kYXlmdDlXY01CcFFR?=
 =?utf-8?B?WS9Gc3NSaDhmaGI0dTNNQi8ycVNoT2FjUHNqRW9RV3V0aW1kSVBhQkVGRzVl?=
 =?utf-8?B?RWxSMlBBZ0cyZXRjMEtSeFBMUmxsQThHMExUeExudXVuMzg0M3lDYkRDTGha?=
 =?utf-8?B?V3RNbzJMTFN5TC8vbVNBSEJGWG16SHc4WitBaGYxcmw3aEx4L1orYURxcmkw?=
 =?utf-8?B?Szh5SGs2djlxN09QbVdGakRMQlNaTEtLZ21jWDhRS21GdFBESkZnSnhYNFNn?=
 =?utf-8?B?YVBxMXlUbTJoUW1pd1FBYW1wV3RmZzJtQjFoMTBBSlk2MFdwd1I3aVczSVJx?=
 =?utf-8?B?R1lyNHdMT3pwNFAvVUVqbk5nREs5VGlOTUEybXYvR1U3OXBHZTJ4STljdWRD?=
 =?utf-8?B?dUxGc2ZYRFh2Nkg5QWRGNHV1SzNwU0lpWkNRQUtpdjJoNWRHUTdBZW56SU1U?=
 =?utf-8?B?eTVQR1ZMMm5LTjhqc1dPdlNFM25PeGRXdzE2cFhVYmk3a3FtZzhJTGEyaWlX?=
 =?utf-8?B?QmQwOUJWVDR4UUxTQk1GVU53YnMzNVMzS2EzTXlCZzhqYTFEc25XaXpycm9s?=
 =?utf-8?Q?AtdFwn94QOshmsaR1Rcwq0qhuV3MdFhfrfHRWC4?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR03MB6836.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 816b6b38-ad95-4345-9abd-08d920290704
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 09:31:23.2020
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkQMGiR/NPdxyzBo8eu1CGw+CLavj6v2EG97QSmi5FQK1OI8H2eacko9DWz9+QTI8Tc+MFTmrXqTlfM+/sCwHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4641
X-Proofpoint-GUID: rW1x8WRWUqU2mjsKGeJAQkfvfpBfBaWs
X-Proofpoint-ORIG-GUID: rW1x8WRWUqU2mjsKGeJAQkfvfpBfBaWs
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=988 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105260062

SGkgSnVsaWVuLA0KDQo+IA0KPiAgRnJvbSB0aGUgbWFuOg0KPiANCj4gVkVSU0lPTlMNCj4gICAg
ICAgICBnZXRyYW5kb20oKSB3YXMgaW50cm9kdWNlZCBpbiB2ZXJzaW9uIDMuMTcgb2YgdGhlIExp
bnV4IGtlcm5lbC4NCj4gICBTdXBwb3J0IHdhcyBhZGRlZCB0byBnbGliYyBpbiB2ZXJzaW9uIDIu
MjUuDQo+IA0KPiBJZiBJIGFtIG5vdCBtaXN0YWtlbiBnbGliYyAyLjI1IHdhcyByZWxlYXNlZCBp
biAyMDE3LiBBbHNvLCB0aGUgY2FsbCB3YXMgb25seQ0KPiBpbnRyb2R1Y2VkIGluIEZyZWVCU0Qg
MTIuDQo+IA0KPiBTbyBJIHRoaW5rIHdlIHdhbnQgdG8gY2hlY2sgaWYgZ2V0cmFuZG9tKCkgY2Fu
IGJlIHVzZWQuIFdlIG1heSBhbHNvIHdhbnQgdG8NCj4gY29uc2lkZXIgdG8gZmFsbGJhY2sgdG8g
cmVhZCAvZGV2L3VyYW5kb20gaWYgdGhlIGNhbGwgcmV0dXJuIEVOT1NZUy4NCj4gDQoNCllvdSBt
ZWFuIGl0cyBhdmFpbGFiaWxpdHkgc2hvdWxkIGJlIGNoZWNrZWQgYm90aCBhdCBidWlsZCBhbmQg
cnVudGltZT8NCg0KLS0NCnJlZ2FyZHMsDQogIFNlcmdpeQ0K

