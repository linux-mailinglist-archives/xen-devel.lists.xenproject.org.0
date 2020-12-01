Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFCE62CA8D3
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 17:55:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42225.75933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk8vQ-0001yb-Q5; Tue, 01 Dec 2020 16:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42225.75933; Tue, 01 Dec 2020 16:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk8vQ-0001yC-Mi; Tue, 01 Dec 2020 16:54:48 +0000
Received: by outflank-mailman (input) for mailman id 42225;
 Tue, 01 Dec 2020 16:54:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Rbw=FF=epam.com=prvs=0604308a42=volodymyr_babchuk@srs-us1.protection.inumbo.net>)
 id 1kk8vP-0001y7-MA
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 16:54:47 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a738e3bc-4730-4731-9d5c-92d472700c14;
 Tue, 01 Dec 2020 16:54:45 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0B1GjXec025828; Tue, 1 Dec 2020 16:54:41 GMT
Received: from eur05-am6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111])
 by mx0a-0039f301.pphosted.com with ESMTP id 355rbugam7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Dec 2020 16:54:40 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com (2603:10a6:800:17e::20)
 by VE1PR03MB5197.eurprd03.prod.outlook.com (2603:10a6:802:a3::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Tue, 1 Dec
 2020 16:54:37 +0000
Received: from VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51]) by VI1PR03MB6400.eurprd03.prod.outlook.com
 ([fe80::d7a:2503:2ffd:1c51%6]) with mapi id 15.20.3611.031; Tue, 1 Dec 2020
 16:54:37 +0000
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
X-Inumbo-ID: a738e3bc-4730-4731-9d5c-92d472700c14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6xyjSDcH0vCOxPhurgc42zfgZl1+glVTATMyS+u7xzIKRG3JLfBPFW++8b4JgUJbHrwkRIQF3xd2GCMWrp32piXi6L7Auk/2/7KfmDgdb9LgOVUKEfrQYXqqtaySTpHxuWKBmp5AVZoU4cehcaEmnZIzV6caMqweMU4P5L3TSl5jcxQPkjFxobuuh4Wr7oj6fbm1DWMNwmKJELyVl3Xcuq7s8cRH2c5YfoZyCWt+/u/noJGOZjmjIHNMcai6s8LkXoHViV6CV7GTRWSmKvMq7yrHIEgRcRJXsbM2ut+OCTHTqHrlHVapUq51MtRaDeg/6XFbW7DXMmphKW+qdrJRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD7dHSjE0bgxDY7bpnmsWNoqhd5TmDlW6Zky89g0x5w=;
 b=Snjh1fZlQbKPzYVIyf6EQU0LvBGILq936M1rxCEuVciJPt9lLkEB5QRoSmF9rlKYm0XgCA4OfgYaUyAmc6ZYUnVJWrfm5IoX5VEnL/TfiKyBe1qBbxQ8h2o5BM4o95HVT+g2jN9k/Q4j4070FLM/JdH/C93Flx1jjhKbnFOw6Zgc2+HmBZSthlwUBpqpLvb8f8mb3Wftrml/iz7n1bMEmcrqsyjqtDvGEDVyI5QEnpkR70AUa5yDdupgM18PfevpL4HHpOJzCNvI4UPRj07sKiBQ2kYxTS6zRcxfFnA5bVi9VI9/Fl3Val74XhmTgbY9k3K5ZXLNhjbtAHKrK+bJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pD7dHSjE0bgxDY7bpnmsWNoqhd5TmDlW6Zky89g0x5w=;
 b=ARlhCPjjhcvbnUo20YBdK4N+LBUXz2AnefI8cr2BY+FB9zD8K9LbPUbUYd5fNEov6u8WQX5aUmclNRXZLFWYP+TNXrAl8X5ooGDVYDuNZuYCDCVIdtOcf+GRE25GYhtBVL69fw8qKjo2oUwKC7rUstNJ6SpVi69UFPaQvDfS4F1Qs5CnvE+YifNMZq8VaHB55dIEYzpQ4KgzyBsyN9HYcB+E1rEmmpCzUnV7aRLuuXejB0W+rXEZfhcLnafBtTmr4lKxIIlshbc0ZTiiqYHr4Qn+fPd23kTGAfGaK/GiDMC+ylCuNggsS45CQufKbgtyEkgVGvxKQlgWhIr6k9FS/g==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Topic: [PATCH v2 5/7] xen/arm: Add handler for cp15 ID registers
Thread-Index: AQHWxyRSFk5jpSQ9QE+NXR5AM1rL5qnhIUQAgAD/vgCAAAW1AIAAJWwAgAAq4QA=
Date: Tue, 1 Dec 2020 16:54:37 +0000
Message-ID: <87h7p55uwj.fsf@epam.com>
References: <cover.1606742184.git.bertrand.marquis@arm.com>
 <86c96cd3895bf968f94010c0f4ee8dce7f0338e8.1606742184.git.bertrand.marquis@arm.com>
 <87lfei7fj5.fsf@epam.com> <AB32AAFF-DD1D-4B13-ABC0-06F460E95E1C@arm.com>
 <87sg8p687j.fsf@epam.com> <87243486-2A58-4497-B566-5FDE4158D18E@arm.com>
In-Reply-To: <87243486-2A58-4497-B566-5FDE4158D18E@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: mu4e 1.4.10; emacs 27.1
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-originating-ip: [176.36.48.175]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 803075e1-1212-47e2-1a75-08d89619c9bb
x-ms-traffictypediagnostic: VE1PR03MB5197:
x-microsoft-antispam-prvs: 
 <VE1PR03MB5197707B5AA47C0450E568D8E6F40@VE1PR03MB5197.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bTp4CgNX/silfgYUHtrKC491EAoaIlzKl4awA3dDSz2RZ/10lsvXw8Wa0oGmaju/v7ZuUjt9yt3hxOsatmAasjnxwQ2gj6k8iZuggIJ4FSi43rQA6gnScAPJoEd7Fk6cRcgYel1QuTQniFmRC+XdDOU8zwj/VXr1I6SX+tOIn+2sS339QJ9yU8QIZxzRL8eLQUBQd6Bhd7M5a4bz+QUvLVdwWkB2AguP0Lbc/2+6KO6SWu7DL87LgfZlVTLwmXN18YhUFRGAQ4qo/+YL0+msr+/5KOpj8EhXrwv7MkI6rQwH3Wksm3N2N+ZMvgSNFg1Day+nJgZjVkit83UfQbY7LA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB6400.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(83380400001)(6506007)(54906003)(316002)(76116006)(2906002)(36756003)(8676002)(8936002)(186003)(26005)(2616005)(91956017)(6486002)(55236004)(53546011)(66946007)(6512007)(66476007)(71200400001)(66446008)(64756008)(86362001)(5660300002)(4326008)(66556008)(478600001)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?dnduUUJ6MmNsdS9tUGZ6OXRYSVNzeFFXZGtlamhvY2U4Vkl1QUJEaitoL2Z6?=
 =?utf-8?B?U1QvZUs2RXIrN01HUUR0TDlUVnM0TTMwdUM0VFpUUnVMZHdHTGFhUWkvWXZ3?=
 =?utf-8?B?NjdWMlFKN1BnRnUvNU9pNHFTbDdDTUVwK0d5QldnTnFraWVWQUNkdlUraThW?=
 =?utf-8?B?TjJWQ3FHRk8yeTJ1SmRaWDZ0R0pEU2g4a3JSQ01hSU9YVGRwdkdaYWhON3pa?=
 =?utf-8?B?bWgyRGc1eHBNcUN6cCtMWU1KN2hBQmVOb0hadmZUdWd6V0F1VFd0OUJOQXZo?=
 =?utf-8?B?V3crTng4Nzk1UUFZOGNsbmt0c1pMUTJJT1dYaEpVUTFndlBXSzdJMlF2NGY2?=
 =?utf-8?B?NjlTRzhHRjlSVFE1Qk94R0MvQ0tLKzJ1NzZOb3VoNzVWT2JEalZHMFJhUVp3?=
 =?utf-8?B?dDFEMDRhVG5DeCtiNDNZM3NiWVdIdi9jSklJeGdqcTdOMXpYbHg5M2lSVXNm?=
 =?utf-8?B?cUlHZE1Yb1JIUVMrcEJ5SXkzazAweVNCYWY1a2JYcC9UR2xScjIrQldHNWZ4?=
 =?utf-8?B?QnVmMGlmbkJPMUIvVnRzanVoZWZmYVBQUSt6MXN3OE5OdGh3bGVjRDFNS2xs?=
 =?utf-8?B?NlV6WEdqNWwzbk01NFN2TXZPWnh5QkdKTXdGL24xUWx5cWFBemFxWVF4RWd0?=
 =?utf-8?B?c0g2L0FFcStndW9qUXZHWGZtMmlUQ09SbGl1QTVBT2p5ZlR3OXpiZHo2YVdH?=
 =?utf-8?B?K3VDWDlSc1lrNEw0b1JwMnlJbGMwS0RiWU9KejRIQlE5ZTVhNXhsZ0hlTWxM?=
 =?utf-8?B?NXFjOFBOUDRqdFJLc0tqZ2FrV3JZN01OR2s3REZZRkd3a0VMU0t3bXduU1pi?=
 =?utf-8?B?UjRNM3EzbDJvUTBGUkMyQmY1eHdUeDhEMm9xU2dWS0UyeFM3NitiNTF0WWV2?=
 =?utf-8?B?TlNNd2dpcUJJckJUNW93M1pMZkZiTGJIRnBVNmt0YlV1THpHNzk5Qjd4NVZS?=
 =?utf-8?B?ckRXT0xrYWNPTXhmZVdjZlo0Qys2YUVNVnYzSldWSE92bjFDWXNFSU9SYmdm?=
 =?utf-8?B?N0tyWW5ZK2hQVTI5QjdNWi9nK0FlYUduMjJ1cVZSM3BOQWNHV3BzNWhRcnlB?=
 =?utf-8?B?cy9YWlZXZFY2Sk5USElyQnRic1FEMzFwZDBXUEVQbUw3T1JIc2RGNTM0anVw?=
 =?utf-8?B?TlhxQjRWNDNXT09xbE9COE4vNGdVdEswdTZuaExHdFlJaFpHZGJIU28wYTQv?=
 =?utf-8?B?bEEwdW9MaWd5Q0s1ZG5jeUQ3V1dEUDM4T2dDckQ0MHJKOHB0RW8xMlJ3NjBu?=
 =?utf-8?B?MlROWFV1L2tsR3NMN2dsNzJXNTdqZ0wrOUxCNlZWRHk1ZTVtQ0I2SzRPMFRh?=
 =?utf-8?Q?5TF7cFrnCvTAVMgmR2L1ZihKwkRgcIwqmx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E6DA12EE11875C458FB8C750AAD54672@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB6400.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 803075e1-1212-47e2-1a75-08d89619c9bb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 16:54:37.4233
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i+zpgUKg2lZhPV8hH5ayc8gA+6iXCNspAwQVFezWVpgQ7nmrDj0njOOxSfNGnOBS0kSmcJerzmDSVOkUZxAJ9MIGhGAxYA9OG22tYlkbUpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR03MB5197
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-12-01_07:2020-11-30,2020-12-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012010103

DQpIaSwNCg0KQmVydHJhbmQgTWFycXVpcyB3cml0ZXM6DQoNCj4gSGkgVm9sb2R5bXlyLA0KPg0K
Pj4gT24gMSBEZWMgMjAyMCwgYXQgMTI6MDcsIFZvbG9keW15ciBCYWJjaHVrIDxWb2xvZHlteXJf
QmFiY2h1a0BlcGFtLmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gSGksDQo+PiANCj4+IEJlcnRy
YW5kIE1hcnF1aXMgd3JpdGVzOg0KPj4gDQo+Pj4gSGksDQo+Pj4gDQo+Pj4+IE9uIDMwIE5vdiAy
MDIwLCBhdCAyMDozMSwgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVrQGVwYW0u
Y29tPiB3cm90ZToNCj4+Pj4gDQo+Pj4+IA0KPj4+PiBCZXJ0cmFuZCBNYXJxdWlzIHdyaXRlczoN
Cj4+Pj4gDQo+Pj4+PiBBZGQgc3VwcG9ydCBmb3IgZW11bGF0aW9uIG9mIGNwMTUgYmFzZWQgSUQg
cmVnaXN0ZXJzIChvbiBhcm0zMiBvciB3aGVuDQo+Pj4+PiBydW5uaW5nIGEgMzJiaXQgZ3Vlc3Qg
b24gYXJtNjQpLg0KPj4+Pj4gVGhlIGhhbmRsZXJzIGFyZSByZXR1cm5pbmcgdGhlIHZhbHVlcyBz
dG9yZWQgaW4gdGhlIGd1ZXN0X2NwdWluZm8NCj4+Pj4+IHN0cnVjdHVyZS4NCj4+Pj4+IEluIHRo
ZSBjdXJyZW50IHN0YXR1cyB0aGUgTVZGUiByZWdpc3RlcnMgYXJlIG5vIHN1cHBvcnRlZC4NCj4+
Pj4gDQo+Pj4+IEl0IGlzIHVuY2xlYXIgd2hhdCB3aWxsIGhhcHBlbiB3aXRoIHJlZ2lzdGVycyB0
aGF0IGFyZSBub3QgY292ZXJlZCBieQ0KPj4+PiBndWVzdF9jcHVpbmZvIHN0cnVjdHVyZS4gQWNj
b3JkaW5nIHRvIEFSTSBBUk0sIGl0IGlzIGltcGxlbWVudGF0aW9uDQo+Pj4+IGRlZmluZWQgaWYg
c3VjaCBhY2Nlc3NlcyB3aWxsIGJlIHRyYXBwZWQuIE9uIG90aGVyIGhhbmQsIHRoZXJlIGFyZSBt
YW55DQo+Pj4+IHJlZ2lzdGVycyB3aGljaCBhcmUgUkFaLiBTbywgZ29vZCBiZWhhdmluZyBndWVz
dCBjYW4gdHJ5IHRvIHJlYWQgb25lIG9mDQo+Pj4+IHRoYXQgcmVnaXN0ZXJzIGFuZCBpdCB3aWxs
IGdldCB1bmRlZmluZWQgaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLCBpbnN0ZWFkDQo+Pj4+IG9mIGp1
c3QgcmVhZGluZyBhbGwgemVyb2VzLg0KPj4+IA0KPj4+IFRoaXMgaXMgdHJ1ZSBpbiB0aGUgc3Rh
dHVzIG9mIHRoaXMgcGF0Y2ggYnV0IHRoaXMgaXMgc29sdmVkIGJ5IHRoZSBuZXh0IHBhdGNoDQo+
Pj4gd2hpY2ggaXMgYWRkaW5nIHByb3BlciBoYW5kbGluZyBvZiB0aG9zZSByZWdpc3RlcnMgKGFk
ZCBDUDEwIGV4Y2VwdGlvbg0KPj4+IHN1cHBvcnQpLCBhdCBsZWFzdCBmb3IgTVZGUiBvbmVzLg0K
Pj4+IA0KPj4+IEZyb20gQVJNIEFSTSBwb2ludCBvZiB2aWV3LCBJIGRpZCBoYW5kbGUgYWxsIHJl
Z2lzdGVycyBsaXN0ZWQgSSB0aGluay4NCj4+PiBJZiB5b3UgdGhpbmsgc29tZSBhcmUgbWlzc2lu
ZyBwbGVhc2UgcG9pbnQgbWUgdG8gdGhlbSBhcyBPIGRvIG5vdA0KPj4+IGNvbXBsZXRlbHkgdW5k
ZXJzdGFuZCB3aGF0IGFyZSB0aGUg4oCccmVnaXN0ZXJzIG5vdCBjb3ZlcmVk4oCdIHVubGVzcw0K
Pj4+IHlvdSBtZWFuIHRoZSBNVkZSIG9uZXMuDQo+PiANCj4+IFdlbGwsIEkgbWF5IGJlIHdyb25n
IGZvciBhYXJjaDMyIGNhc2UsIGJ1dCBmb3IgYWFyY2g2NCwgdGhlcmUgYXJlIG51bWJlcg0KPj4g
b2YgcmVzZXJ2ZWQgcmVnaXN0ZXJzIGluIElEcyByYW5nZS4gVGhvc2UgcmVnaXN0ZXJzIHNob3Vs
ZCByZWFkIGFzDQo+PiB6ZXJvLiBZb3UgY2FuIGZpbmQgdGhlbSBpbiB0aGUgc2VjdGlvbiAiQzUu
MS42IG9wMD09MGIxMSwgTW92ZXMgdG8gYW5kDQo+PiBmcm9tIG5vbi1kZWJ1ZyBTeXN0ZW0gcmVn
aXN0ZXJzIGFuZCBTcGVjaWFsLXB1cnBvc2UgcmVnaXN0ZXJzIiBvZiBBUk0NCj4+IERESSAwNDg3
Qi5hLiBDaGVjayBvdXQgIlRhYmxlIEM1LTYgU3lzdGVtIGluc3RydWN0aW9uIGVuY29kaW5ncyBm
b3INCj4+IG5vbi1EZWJ1ZyBTeXN0ZW0gcmVnaXN0ZXIgYWNjZXNzZXMiLg0KPg0KPiBUaGUgcG9p
bnQgb2YgdGhlIHNlcmllIGlzIHRvIGhhbmRsZSBhbGwgcmVnaXN0ZXJzIHRyYXBwZWQgZHVlIHRv
IFRJRDMgYml0IGluIEhDUl9FTDIuDQo+DQo+IEFuZCBpIHRoaW5rIEkgaGFuZGxlZCBhbGwgb2Yg
dGhlbSBidXQgSSBtaWdodCBiZSB3cm9uZy4NCj4NCj4gSGFuZGxpbmcgYWxsIHJlZ2lzdGVycyBm
b3Igb3AwPT0wYjExIHdpbGwgY292ZXIgYSBsb3QgbW9yZSB0aGluZ3MuDQo+IFRoaXMgY2FuIGJl
IGRvbmUgb2YgY291cnNlIGJ1dCB0aGlzIHdhcyBub3QgdGhlIHBvaW50IG9mIHRoaXMgc2VyaWUu
DQo+DQo+IFRoZSBsaXN0aW5nIGluIEhDUl9FTDIgZG9jdW1lbnRhdGlvbiBpcyBwcmV0dHkgY29t
cGxldGUgYW5kIGlmIEkgbWlzcyBhbnkgcmVnaXN0ZXINCj4gdGhlcmUgcGxlYXNlIHRlbGwgbWUg
YnV0IEkgZG8gbm8gdW5kZXJzdGFuZCBmcm9tIHRoZSBkb2N1bWVudGF0aW9uIHRoYXQgYWxsIHJl
Z2lzdGVycw0KPiB3aXRoIG9wMCAzIGFyZSB0cmFwcGVkIGJ5IFRJRDMuDQoNCk15IGNvbmNlcm4g
aXMgdGhhdCB0aGUgc2FtZSBjb2RlIG1heSBvYnNlcnZlIGRpZmZlcmVudCBlZmZlY3RzIHdoZW4N
CnJ1bm5pbmcgaW4gYmFyZW1ldGFsIG1vZGUgYW5kIGFzIFZNLg0KDQpGb3IgZXhhbXBsZSwgd2Ug
YXJlIHRyeWluZyB0byBydW4gYSBuZXdlciB2ZXJzaW9uIG9mIGEga2VybmVsLCB0aGF0DQpzdXBw
b3J0cyBzb21lIGh5cG90aGV0aWNhbCBBUk12OC45LiBBbmQgaXQgdHJpZXMgdG8gcmVhZCBhIG5l
dyBJRA0KcmVnaXN0ZXIgd2hpY2ggaXMgYWJzZW50IGluIEFSTXY4LjIuIFRoZXJlIGFyZSBwb3Nz
aWJsZSBjYXNlczoNCg0KMC4gSXQgcnVucyBhcyBhIGJhcmVtZXRhbCBjb2RlIG9uIGEgY29tcGF0
aWJsZSBhcmNoaXRlY3R1cmUuIFNvIGl0IGp1c3QNCmFjY2Vzc2VzIHRoaXMgcmVnaXN0ZXIgYW5k
IGFsbCBpcyBmaW5lLg0KDQoxLiBJdCBydW5zIGFzIGJhcmVtZXRhbCBjb2RlIG9uIG9sZGVyIEFS
TTggYXJjaGl0ZWN0dXJlLiBDdXJyZW50DQpyZWZlcmVuY2UgbWFudWFsIHN0YXRlcyB0aGF0IHRo
b3NlIHJlZ2lzdGVycyBzaG91bGQgcmVhZCBhcyB6ZXJvLCBzbw0KYWxsIGlzIGZpbmUsIGFzIHdl
bGwuDQoNCjIuIEl0IHJ1bnMgYXMgVk0gb24gYW4gb2xkZXIgYXJjaGl0ZWN0dXJlLiBJdCBpcyBJ
TVBMRU1FTlRBVElPTiBERUZJTkVEDQppZiBIQ1IuSUQzIHdpbGwgY2F1c2UgdHJhcHMgd2hlbiBh
Y2Nlc3MgdG8gdW5hc3NpZ25lZCByZWdpc3RlcnM6DQoNCjJhLiBQbGF0Zm9ybSBkb2VzIG5vdCBj
YXVzZSB0cmFwcyBhbmQgc29mdHdhcmUgcmVhZHMgemVyb3MgZGlyZWN0bHkgZnJvbQ0KcmVhbCBy
ZWdpc3RlcnMuIFRoaXMgaXMgYSBnb29kIG91dGNvbWUuDQoNCjJiLiBQbGF0Zm9ybSBjYXVzZXMg
dHJhcCwgYW5kIHlvdXIgY29kZSBpbmplY3RzIHRoZSB1bmRlZmluZWQNCmluc3RydWN0aW9uIGV4
Y2VwdGlvbi4gVGhpcyBpcyBhIGNhc2UgdGhhdCBib3RoZXJzIG1lLiBXZWxsIHdyaXR0ZW4gY29k
ZQ0KdGhhdCBpcyB0cmllcyB0byBiZSBjb21wYXRpYmxlIHdpdGggZGlmZmVyZW50IHZlcnNpb25z
IG9mIGFyY2hpdGVjdHVyZQ0Kd2lsbCBmYWlsIHRoZXJlLg0KDQozLiBJdCBydW5zIGFzIFZNIG9u
IGEgbmV2ZXIgYXJjaGl0ZWN0dXJlLiBJIGNhbiBvbmx5IHNwZWN1bGF0ZSB0aGVyZSwNCmJ1dCBJ
IHRoaW5rLCB0aGF0IGxpc3Qgb2YgcmVnaXN0ZXJzIHRyYXBwZWQgYnkgSENSLklEMyB3aWxsIGJl
IGV4dGVuZGVkDQp3aGVuIG5ldyBmZWF0dXJlcyBhcmUgYWRkZWQuIEF0IGxlYXN0LCB0aGlzIGRv
ZXMgbm90IGNvbnRyYWRpY3Qgd2l0aCB0aGUNCmN1cnJlbnQgSU1QTEVNRU5UQVRJT04gREVGSU5F
RCBjb25zdHJhaW50LiBJbiB0aGlzIGNhc2UsIGh5cGVydmlzb3Igd2lsbA0KaW5qZWN0IGV4Y2Vw
dGlvbiB3aGVuIGd1ZXN0IHRyaWVzIHRvIGFjY2VzcyBhIHZhbGlkIHJlZ2lzdGVyLg0KDQoNClNv
LCBpbiBteSBvcGluaW9uIGFuZCB0byBiZSBjb21wYXRpYmxlIHdpdGggdGhlIHJlZmVyZW5jZSBt
YW51YWwsIHdlDQpzaG91bGQgYWxsb3cgZ3Vlc3RzIHRvIHJlYWQgIlJlc2VydmVkLCBSQVoiIHJl
Z2lzdGVycy4NCg0KDQoNCj4gUmVnYXJkcw0KPiBCZXJ0cmFuZA0KPg0KPg0KPj4gDQo+PiANCj4+
Pj4gDQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBCZXJ0cmFuZCBNYXJxdWlzIDxiZXJ0cmFuZC5tYXJx
dWlzQGFybS5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IENoYW5nZXMgaW4gVjI6IHJlYmFzZQ0KPj4+
Pj4gLS0tDQo+Pj4+PiB4ZW4vYXJjaC9hcm0vdmNwcmVnLmMgfCAzNSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKw0KPj4+Pj4gMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KykNCj4+Pj4+IA0KPj4+Pj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL2FybS92Y3ByZWcuYyBiL3hl
bi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+Pj4gaW5kZXggY2RjOTFjZGY1Yi4uZDBjNjQwNmYzNCAx
MDA2NDQNCj4+Pj4+IC0tLSBhL3hlbi9hcmNoL2FybS92Y3ByZWcuYw0KPj4+Pj4gKysrIGIveGVu
L2FyY2gvYXJtL3ZjcHJlZy5jDQo+Pj4+PiBAQCAtMTU1LDYgKzE1NSwxNCBAQCBUVk1fUkVHMzIo
Q09OVEVYVElEUiwgQ09OVEVYVElEUl9FTDEpDQo+Pj4+PiAgICAgICAgYnJlYWs7ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPj4+Pj4gICAg
fQ0KPj4+Pj4gDQo+Pj4+PiArLyogTWFjcm8gdG8gZ2VuZXJhdGUgZWFzaWx5IGNhc2UgZm9yIElE
IGNvLXByb2Nlc3NvciBlbXVsYXRpb24gKi8NCj4+Pj4+ICsjZGVmaW5lIEdFTkVSQVRFX1RJRDNf
SU5GTyhyZWcsZmllbGQsb2Zmc2V0KSAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+ICsg
ICAgY2FzZSBIU1JfQ1BSRUczMihyZWcpOiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFwNCj4+Pj4+ICsgICAgeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+Pj4+ICsgICAgICAgIHJldHVybiBo
YW5kbGVfcm9fcmVhZF92YWwocmVncywgcmVnaWR4LCBjcDMyLnJlYWQsIGhzciwgICAgIFwNCj4+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIDEsIGd1ZXN0X2NwdWluZm8uZmllbGQuYml0
c1tvZmZzZXRdKTsgICAgIFwNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gdm9pZCBkb19j
cDE1XzMyKHN0cnVjdCBjcHVfdXNlcl9yZWdzICpyZWdzLCBjb25zdCB1bmlvbiBoc3IgaHNyKQ0K
Pj4+Pj4gew0KPj4+Pj4gICAgY29uc3Qgc3RydWN0IGhzcl9jcDMyIGNwMzIgPSBoc3IuY3AzMjsN
Cj4+Pj4+IEBAIC0yODYsNiArMjk0LDMzIEBAIHZvaWQgZG9fY3AxNV8zMihzdHJ1Y3QgY3B1X3Vz
ZXJfcmVncyAqcmVncywgY29uc3QgdW5pb24gaHNyIGhzcikNCj4+Pj4+ICAgICAgICAgKi8NCj4+
Pj4+ICAgICAgICByZXR1cm4gaGFuZGxlX3Jhel93aShyZWdzLCByZWdpZHgsIGNwMzIucmVhZCwg
aHNyLCAxKTsNCj4+Pj4+IA0KPj4+Pj4gKyAgICAvKg0KPj4+Pj4gKyAgICAgKiBIQ1JfRUwyLlRJ
RDMNCj4+Pj4+ICsgICAgICoNCj4+Pj4+ICsgICAgICogVGhpcyBpcyB0cmFwcGluZyBtb3N0IElk
ZW50aWZpY2F0aW9uIHJlZ2lzdGVycyB1c2VkIGJ5IGEgZ3Vlc3QNCj4+Pj4+ICsgICAgICogdG8g
aWRlbnRpZnkgdGhlIHByb2Nlc3NvciBmZWF0dXJlcw0KPj4+Pj4gKyAgICAgKi8NCj4+Pj4+ICsg
ICAgR0VORVJBVEVfVElEM19JTkZPKElEX1BGUjAsIHBmcjMyLCAwKQ0KPj4+Pj4gKyAgICBHRU5F
UkFURV9USUQzX0lORk8oSURfUEZSMSwgcGZyMzIsIDEpDQo+Pj4+PiArICAgIEdFTkVSQVRFX1RJ
RDNfSU5GTyhJRF9QRlIyLCBwZnIzMiwgMikNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZP
KElEX0RGUjAsIGRiZzMyLCAwKQ0KPj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfREZS
MSwgZGJnMzIsIDEpDQo+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9BRlIwLCBhdXgz
MiwgMCkNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX01NRlIwLCBtbTMyLCAwKQ0K
Pj4+Pj4gKyAgICBHRU5FUkFURV9USUQzX0lORk8oSURfTU1GUjEsIG1tMzIsIDEpDQo+Pj4+PiAr
ICAgIEdFTkVSQVRFX1RJRDNfSU5GTyhJRF9NTUZSMiwgbW0zMiwgMikNCj4+Pj4+ICsgICAgR0VO
RVJBVEVfVElEM19JTkZPKElEX01NRlIzLCBtbTMyLCAzKQ0KPj4+Pj4gKyAgICBHRU5FUkFURV9U
SUQzX0lORk8oSURfTU1GUjQsIG1tMzIsIDQpDQo+Pj4+PiArICAgIEdFTkVSQVRFX1RJRDNfSU5G
TyhJRF9NTUZSNSwgbW0zMiwgNSkNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lT
QVIwLCBpc2EzMiwgMCkNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIxLCBp
c2EzMiwgMSkNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIyLCBpc2EzMiwg
MikNCj4+Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVIzLCBpc2EzMiwgMykNCj4+
Pj4+ICsgICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI0LCBpc2EzMiwgNCkNCj4+Pj4+ICsg
ICAgR0VORVJBVEVfVElEM19JTkZPKElEX0lTQVI1LCBpc2EzMiwgNSkNCj4+Pj4+ICsgICAgR0VO
RVJBVEVfVElEM19JTkZPKElEX0lTQVI2LCBpc2EzMiwgNikNCj4+Pj4+ICsgICAgLyogTVZGUiBy
ZWdpc3RlcnMgYXJlIGluIGNwMTAgbm8gY3AxNSAqLw0KPj4+Pj4gKw0KPj4+Pj4gICAgLyoNCj4+
Pj4+ICAgICAqIEhDUl9FTDIuVElEQ1ANCj4+Pj4+ICAgICAqDQo+Pj4+IA0KPj4+PiANCj4+Pj4g
LS0gDQo+Pj4+IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCj4+IA0KPj4gDQo+PiAtLSANCj4+
IFZvbG9keW15ciBCYWJjaHVrIGF0IEVQQU0NCg0KDQotLSANClZvbG9keW15ciBCYWJjaHVrIGF0
IEVQQU0=

