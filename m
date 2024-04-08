Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DAE89CBBF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 20:35:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702040.1096770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rttph-00067C-Tp; Mon, 08 Apr 2024 18:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702040.1096770; Mon, 08 Apr 2024 18:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rttph-00065S-Pw; Mon, 08 Apr 2024 18:35:05 +0000
Received: by outflank-mailman (input) for mailman id 702040;
 Mon, 08 Apr 2024 18:35:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cMR=LN=epam.com=prvs=0828da255d=oleksandr_tyshchenko@srs-se1.protection.inumbo.net>)
 id 1rttpg-00065M-KU
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 18:35:04 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4e1ab3f-f5d6-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 20:35:03 +0200 (CEST)
Received: from pps.filterd (m0174679.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 438EKfds020212; Mon, 8 Apr 2024 18:34:56 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2051.outbound.protection.outlook.com [104.47.14.51])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3xcd2fa91t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Apr 2024 18:34:56 +0000 (GMT)
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com (2603:10a6:10:ed::15)
 by AS2PR03MB9444.eurprd03.prod.outlook.com (2603:10a6:20b:59b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 18:34:53 +0000
Received: from DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::cb1c:3d36:163:e23]) by DB8PR03MB6108.eurprd03.prod.outlook.com
 ([fe80::cb1c:3d36:163:e23%7]) with mapi id 15.20.7409.053; Mon, 8 Apr 2024
 18:34:53 +0000
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
X-Inumbo-ID: b4e1ab3f-f5d6-11ee-afe6-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzj3mbNOiqSV9s79WVhWRymwTo+AlCfNWGprTqZ3q8t9leExzXCYMEnPIGtVaz+Fl6vMOqlvwWPWCFXgXDIFBeVQVbE2vzBbdqBctaFJLeufHdKf40UcVjLOrBMZfC8wDjEGuG99CWmDTkPeDJ+d/V7CdthrY2LXEF7cthJ6SL60NM67lzVCqy8XksKH00yVF/ifZqTQRUoOiIfaATy54L34d2rLdQjORl6FNTy8Yjh3yJXQcr2DK7KPATNLO3zEP8VFpVylx5/b2xLPEHTI3Tzabfw/uET9zMrATttOiGIvWBBTeU6DxMCe8OwYPKRKzl3C4O0vjCtdVontcHnnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9+e9plGSLL7lHhr3tx7Yq9AuyCOFnkurc6sR1BlLJI=;
 b=FHGDUYZH5QLjZH72tfxEVDToVhKw3NZuEdZO3Q6HzCjN5R7QK9QP+SE6f9ncd4wDb/8tmmnkULw4tYfbtD5nMk8n6HhriB3JjBTV7rDEntyxW6vA3cPPs7XZP7FGctSytWSLXi89cad12cEZxlcNM/RCC30apCXIB7nFXDyEtNnJzBPgyfXpYB6IfoxJ2WOcl2fIuwdK4XEruaknPowDt7YFRiY4v5sQJnVCkptP9K8A+PzdtTu2D+PtBiNNe7hHh4sT2F3X8wcSdqD1LnMN55gZl9DCpU4PJEk/DwgoZjr6gnvmM6fXRaHICwntg+CEPDFztibEXgztTtZGJOsKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9+e9plGSLL7lHhr3tx7Yq9AuyCOFnkurc6sR1BlLJI=;
 b=W3GaUtsqCDqEFaX8aIeEuZIoeQ9jBbvVlOx/Uc8e4+0YJaCcsOx3mKOu+gSQJaA/5XEGoPZHh+kSnWEiZ/9C+IrPNjpEq7nPwxf9S45wypLiruLZMZotlvkRewesB5f3eN3frZZG2gR1OeZyesFS+U4JhPOT109N3PriQ2d5tbePOCNzywB6xloDCPB89NZHNYlDsWHjuk4wYg5TiYE7TIBbsUwtpnYwRrbDEMjhi+rd71z71zRHFw/2WwuBbXgp6hV7q+uNBFMgwntv3RlTJ7It+CZUZiOCrYZdxUGXc++wEONUgYIut39VVhCDNYRy843Viu8G1Lpk8E9Qh9MW2w==
From: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr Tyshchenko <olekstysh@gmail.com>
CC: Michal Orzel <michal.orzel@amd.com>,
        Artem Mygaiev
	<Artem_Mygaiev@epam.com>,
        Ayan Kumar Halder <ayankuma@amd.com>,
        Stefano
 Stabellini <stefano.stabellini@amd.com>,
        Mykola Kvach
	<Mykola_Kvach@epam.com>,
        "amd-xen-safety@groups.io"
	<amd-xen-safety@groups.io>
Subject: Re: [amd-xen-safety] [PATCH V4] Add requirements for Device
 Passthrough
Thread-Topic: [amd-xen-safety] [PATCH V4] Add requirements for Device
 Passthrough
Thread-Index: AQHaibd7zNNT6i/2sUuRRwz0/oYCwrFeo88AgAAPdIA=
Date: Mon, 8 Apr 2024 18:34:52 +0000
Message-ID: <ebf316a0-e8e1-4294-b7eb-d1992bb8e4bb@epam.com>
References: <20240408131945.476581-1-olekstysh@gmail.com>
 <33a14c95-c186-48bf-9aa5-cfcac374492a@amd.com>
In-Reply-To: <33a14c95-c186-48bf-9aa5-cfcac374492a@amd.com>
Accept-Language: en-US, ru-RU
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR03MB6108:EE_|AS2PR03MB9444:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 rySGIiAvm6fjNj4vCzBhZvhPxcWX6W0dmz9foU38CKg+C+i+oH0SqZ4Z60Ug7CEPhaxtzKL6ZDu4sMGeYFTNYEMNwrivb0pq4og2iyR77uZ4nkYA8yb7mDZWI0RK03b11ivgqxSID0/7GVP885XZ6pBPrHBeBIpttBkRrNoEskpzmoVq3PEHXH7KNoz2qVDVH3rxEytispz5oc4PLMFPKJagwv0vJcmQ+3B5Zu5Q8a/4NNyYpFQkFtNr7aLn+AB1x0bA9FcqniDXH1HetcrswMi4dXaP/nAbSOLrHKMqNI/tsNqk+X88EkwW9VEsZtb9NiMHahx4GpWj9UHNj/IKaV/o/p+0DygDYorZY+5CEE0MyzSW6Z+5xbb1EjPLMuBd/KQ/SnKCK5IA2m38uaiK4lW3XvPWP7HGfzuhPspyZbIKhc6IQignw4xBcJMUwiPw6yZ+TSgRlZXQwenMsKnNDUUqH2hPKsQL1j8p3G8t9j0rZVy2hbXfl/DOd/dHqPuYR07JLa1Vij45S3/cv2onSF/X4JMsVtlujkNUtL6dE7OKddX3MD6w/9Zywi0wqoTXoypxkr+YOfSLBpRzm5I8Czv2cXLGIICAkTk2rnMsOYY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR03MB6108.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bWRGT1hadXVWajB6M3FzVmJQSytKelZiamZ1MUFyVjFCSSt2SlM1eW5FYlJv?=
 =?utf-8?B?QkZPeGtMVGpwcmZOOFhVUi9GVDBWYjN0WkVSajVtN0M5Y1c4TnpWZ0Njd0N4?=
 =?utf-8?B?MG42RFkvdGFJdzNsendpa2E5anZhRC9oTGZOKzk5dkZPSlphWHh6REREKzQr?=
 =?utf-8?B?U01aOFk5VUFvak9qTTFOU0tXelIzRExkS0szWmJ5Qy9tVFJIeE5LSFpKekdu?=
 =?utf-8?B?SnRua3k0cm5semEvT2pUYUp5ZnZxemQrMEdsc3lDS2pXd2U3dWE2bDhuU3Yx?=
 =?utf-8?B?YjVXbVk0MEs2cG8vVEMrMUwwRkdERlJoSnliNzkrbDVXYVN6YnN0c3J5Q1lO?=
 =?utf-8?B?dzZ6VlpQZEFEdTdUUXlsZEtEb0wwOVJzR2k0c2RoS2hTeUNScWR5Ty9EdnN4?=
 =?utf-8?B?RE9GeVhIazNtYk1RT2VxU3lrRFJXbXB4K0JtRzlVb0FncUtnMDdwd0dZNHZk?=
 =?utf-8?B?VUNuNTdFZjFTdWNHRWZYWXk2cUdkVU4rZFFmcWFhanBad0NMQ0p6cWNCb2VY?=
 =?utf-8?B?RkpBTFRtMTR6MXlnZ05oZVRoSm05ZHdkRjFKekZOK3hGanM2cG1reXU5dEJ3?=
 =?utf-8?B?YzE4UG9Kb0IwYXhOM3RUS0pMS1ppaGYxY1FoWGNKRUNaYVFRQ2d1MEFFR2sz?=
 =?utf-8?B?K0ZnanprTElmSnNHN3ErQllDNXlaM24xbzlNR0FQQUNTLzdubVB2S0ltVnVy?=
 =?utf-8?B?b3lIZ0trekp1aDE1Vjd5YkVrUG85d0lqNkJFUERWMVM1b09tcHgxUTVQTGlt?=
 =?utf-8?B?d2haTHJ0YVFFQzRYQVhkcS9VcjlTcHVMeG1kWm0vRGdvMm52dFVZcEpLTFo3?=
 =?utf-8?B?VXc5NktZeGpZakZNRHl5d0pYdEpGRURDM29adS9xVkJhVWlRMi9IR3k4RWNY?=
 =?utf-8?B?akQ5cGNDZ2F6TzZlZmhzQktHa0V2RE9uWWtjUm5QWVZGaWJ6Q213VVNsM0FH?=
 =?utf-8?B?anhld2ROL3RVTU5EK0RER3dxbHdPb2ZuYTRCVk1JejJGSmxKSVYrTzZUZHI4?=
 =?utf-8?B?aUYvS1c5N05WMEFQTlJuci9oTzdXM0w2MkljNUdqdHgvSC9aMVc5TXVlNWV5?=
 =?utf-8?B?YldLVnRWeXBNaVZUQjJkVTl4TUtUMTRvRjMrd1dJNGdTZzYzZVFjOXpqakNr?=
 =?utf-8?B?N3ZQMEhoemdkZVlGb2RHcmF5QXRkOFVSa0lvaEtDM3l3cXV4YmR1d1NWaWtp?=
 =?utf-8?B?dktHTFB2bWx3dkJFTm1CaVl2V0RtVkpFclVWZUpZY0FoSkozWmVkZG5qTjJn?=
 =?utf-8?B?TzE3VEZJRnU3SWJacmpUZmptTkcyZGNnZEVKNjI2MVgxcUNIaVdqRGF1VDJx?=
 =?utf-8?B?OTZpeXhBcWtERHd6em4yY1NuNGZ5aDVQRWNYOE9ueU9uQ3RMNEdVM2xnZ0Vj?=
 =?utf-8?B?WE51OWlLQUFGU1ZvUGxWVzkzWG0rdXF6T3hBMVo5Q0NnYUJiZ3NxUmlzRWJW?=
 =?utf-8?B?QUNxOW1pcy9ES0VPczJYR0E2Wm9idWNLU1ZPWkpGQnhFcGFHVnphZ0NYb0ht?=
 =?utf-8?B?S04rT0t2SU5yWVRrOEZ0ZWswamsvUEVTbE9NK2FJeXh3cU8xYlhSVDE1UHE0?=
 =?utf-8?B?VWFQV0tlZFFzOExOMlBRT256QUJ0YllXY3QyNDF1TlJRZFIzUTZrV0oyd0Nt?=
 =?utf-8?B?TVJBRzI0YjB5SkF6Qkxoc2FRVjNGVU5kK3NwNjdNaUF4R0V5cWt1QnpUZExK?=
 =?utf-8?B?V05OcmpZb2tYRXg5Sk95THk3Y1BSdHZiWE1zMEkyVGpqSHE4dXNCbC9wc3R4?=
 =?utf-8?B?OElLS2g0akR3Tk8yWGxzM2w3dm16ODZ6M2dkbHhMMkV2UUl5b3BYUDB2bUpK?=
 =?utf-8?B?bDJDY25Oa2dvZjZldXJ2ditRMnFRNFJCbHA2bkJyMFphVW4zVE5mTVdKVDRD?=
 =?utf-8?B?RlFoRk4vazdNVWJjQ21kYndRNFdpZFh6QWNkTUQwZVNoR0IxdENxLzE3UDRq?=
 =?utf-8?B?TERnRVNGd1FpOFBkWFZNQVlub05ic1VMSnJ3RWwzcGlBUlY4K1ZtRVZidjAz?=
 =?utf-8?B?dFBTb1JZZ29pRTAxRnVNWEZlODN1dCtFeUdFR2JlN3BXOVJBM0hTbmF1TTdL?=
 =?utf-8?B?MFBnUUdJdTRrMnlEZ3hXMVBENXRyN0dmN3cxdGx3alJ0c2tGU1QxNTVRL2F1?=
 =?utf-8?B?TGliZkw3WTZoZVhDUGxiYTd5ZFRzUklLUlJXSzhEQWVMd0FoMzNTWmNtL3E0?=
 =?utf-8?Q?+0947lw5RgcTnq+B+uP7qp8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8BCDB7D77F9F3D4AB194DC73EC06A8DF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR03MB6108.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 107ee846-ccc8-4d83-42e4-08dc57fa94d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2024 18:34:53.0130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSNylj5LTvqaSVtsgc5C+ZqU/pkmU6TGP/06pnHzZ6ogDK/sYUNey2M/X+dJbB16uF7SyTtZuWiGWCxUFC7f6VsWEguKrmaBuvaGokkSiJE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9444
X-Proofpoint-ORIG-GUID: e-3EyzFLIVt0iYIGW1tgOo2zYlQBglDm
X-Proofpoint-GUID: e-3EyzFLIVt0iYIGW1tgOo2zYlQBglDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_15,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1011
 mlxlogscore=999 spamscore=0 malwarescore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080143

DQoNCk9uIDA4LjA0LjI0IDIwOjM4LCBIaWxkZWJyYW5kLCBTdGV3YXJ0IHZpYSBncm91cHMuaW8g
d3JvdGU6DQo+IE9uIDQvOC8yNCAwOToxOSwgT2xla3NhbmRyIFR5c2hjaGVua28gd3JvdGU6DQo+
PiBGcm9tOiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5j
b20+DQo+Pg0KPj4gUGxlYXNlIHJlZmVyIHRvIGNoYXB0ZXIgIkRldmljZSBQYXNzdGhyb3VnaCI6
DQo+PiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9ncm91cHMuaW8vZy9hbWQt
eGVuLXNhZmV0eS9tZXNzYWdlLzEzMDBfXzshIUdGXzI5ZGJjUUlVQlBBITNhRmI3ckwzWnR1SXFt
NjBwaW8tbXRaRGNrQ2k4TVlfaTBhMWQ3bmNMS3FRN2hEb1ZrR3VWeWU2OG1YODFic0J3OVkxV1hp
Vklmd1JnM3hoVXlYdzVRYkx2V25ZS05BOGFlZzQkIFtncm91cHNbLl1pb10NCj4+DQo+PiBDcmVh
dGUgY29ycmVzcG9uZGluZyBkaXJlY3RvcnkgYW5kIFJFQURNRSBmaWxlLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlzaGNoZW5rb0BlcGFt
LmNvbT4NCg0KSGVsbG8sDQoNCnRoaXMgd2FzIHNlbnQgdG8gQHhlbi1kZXZlbCBieSBtaXN0YWtl
LCBwbGVhc2UgaWdub3JlLg0Kc29ycnkgZm9yIHRoZSBpbmNvbnZlbmllbmNl

