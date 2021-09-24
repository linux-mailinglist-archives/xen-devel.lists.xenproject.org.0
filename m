Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3928D416CC6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:22:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194955.347370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfWJ-0001Ox-Ra; Fri, 24 Sep 2021 07:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194955.347370; Fri, 24 Sep 2021 07:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfWJ-0001Mq-OY; Fri, 24 Sep 2021 07:21:19 +0000
Received: by outflank-mailman (input) for mailman id 194955;
 Fri, 24 Sep 2021 07:21:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Coby=OO=epam.com=prvs=9901c588ba=oleksandr_andrushchenko@srs-us1.protection.inumbo.net>)
 id 1mTfWI-0001Mk-4G
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:21:18 +0000
Received: from mx0a-0039f301.pphosted.com (unknown [148.163.133.242])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca920d28-96cc-467c-9ba4-aae1f7936072;
 Fri, 24 Sep 2021 07:21:16 +0000 (UTC)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18O6hU4w020274; 
 Fri, 24 Sep 2021 07:21:11 GMT
Received: from eur03-ve1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52])
 by mx0a-0039f301.pphosted.com with ESMTP id 3b942g8pa6-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Sep 2021 07:21:11 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM9PR03MB7347.eurprd03.prod.outlook.com (2603:10a6:20b:268::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 07:21:05 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::70f5:8ba9:da74:8994%4]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:21:05 +0000
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
X-Inumbo-ID: ca920d28-96cc-467c-9ba4-aae1f7936072
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myE/3hL2rcKMSkhM1IvCaRvkSW9gM5JNLNcizk9QT3cx0NfA35dHtsF/ucWhEPS6a+u/LAb5GVf3TcbV0iOxPPQHkVtuVWGUM0HSnz+kEHA50NdZbxvR9zvWLZcOJ4jsLVf1RFSMAgCqXyUYHB1JI1KQBNE8LeoCqw5d0sslFLaACw0GLE9JaS0Q4mT5bpTVxrHNuE1k6UzTBlIq+DZV0iR03rToXkgI7xfh0ABQmTjaq8Vd5yKyi+ywCZEGhokWsurjZe57VNcooP0E1z0jFQN14DuofjigV8M9a2JXcHErCxFAUxumI4BuA0H96QhAZcQwtPswklAA0UldRrmaHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5u1zeojJ5FGa2r+z5GcHg6hT6Nv3ZQvaRfrp8iLeq48=;
 b=B6NUC/aKzKSPZ1bp4rQ7e9Dqx7h5x55/R4tsfPWZZI4fPtY1haAl6z8Ql5JM8N1I0+P2H09oEswkTpMBvR9IIbL9SU/BIkkDAePVPOhzKnCgz9vveHwtmOKTPJp1nMP6PWTP1rWwCQO8ATx9paIuFbPyqmdzvaA5G11XSWecDw9T3YU2NMWTTFQMNuRmQBKHpBoqgiYc4UmIYDf0DyIvuwSKcTNllDiVyM67TEHZH+17k0Exx8m1e79OfQSXc25aTeizIfiaNe7P5eL2iRKGdDtLc0Y5Rl+dLYnt3Zega3yEjX6nkgV5kSKeSZdB2S9eNqvEkal+AcAOtdbruNJrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5u1zeojJ5FGa2r+z5GcHg6hT6Nv3ZQvaRfrp8iLeq48=;
 b=j5zMvm40oVoHUuoqEU74kbGA27DNRsLrft5rP5pgc0PYxaiBsMSDdM1P/3itL7PcWaInNXHP/ftGjrH5XTuOsoUw39TqbhJCHxRlYYI8hzOYhs+5wAambYYa2/Vheb7CYbGFXCcb8cpL5DTiT2e6Mojm6axIcGxgcMsGy6akE+9CzoGNPCHsob8Ryr8CmvuSOjFySYUcGPF6gZzLtXBKr1CCS1qHcp3KsusFE0U4Bf0mq9vLo+f6CDbgDPIe+O1wFtmR1M97B8kI+bvCWR5Rzb2Wr49b7JTfhpczd02xBqgzm/MXkGoUkYlpczcclCO8SRNEr75Tacul2VN2YMhOLw==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>
CC: xen-devel <xen-devel@lists.xenproject.org>,
        Bertrand Marquis
	<bertrand.marquis@arm.com>,
        Andre Przywara <Andre.Przywara@arm.com>,
        Julien
 Grall <julien@xen.org>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap
	<george.dunlap@citrix.com>,
        Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>,
        Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Topic: [PATCH v2 14/17] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
Thread-Index: AQHXsRS8cqOzQsPJjEGeH6Ub0BW3mw==
Date: Fri, 24 Sep 2021 07:21:05 +0000
Message-ID: <089415bc-71b4-79c0-0028-aac6a75e744f@epam.com>
References: <cover.1632307952.git.rahul.singh@arm.com>
 <06e0cf146ca4d82526282c1960177fad97346ad5.1632307952.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2109221926410.17979@sstabellini-ThinkPad-T480s>
 <438E9A7D-65A3-444C-A24E-87E3A9F92234@arm.com>
In-Reply-To: <438E9A7D-65A3-444C-A24E-87E3A9F92234@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fec98dcf-d894-4696-ca1e-08d97f2bdf1c
x-ms-traffictypediagnostic: AM9PR03MB7347:
x-ms-exchange-transport-forked: True
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-microsoft-antispam-prvs: 
 <AM9PR03MB734783FDA8BE07757C367F7EE7A49@AM9PR03MB7347.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JF7ehJt0DbCq9SJBRojgSBtoqV1axcR9+KpMVK/beGO9Lu3ubpSCEB/EGKfIeqELICz1aztjWyy63DQ/kp5QuorOzDAl0z0JB9bFM5j0O8L4Vkc4rpHRAkKKWF1vZIRkCrIgKEgAsNQvo4ranjM+C5B31zj3na3tBKAL4tuaU+CO/GLXghVQYeSer85uZngxRYN85HOErCu3wl27ivwnxVlPI5fWmXg5RVyr3yEjgp/aocBRfGWVcEz3FqkfAMABqoui72MAyz/WploAjHB6T9IjDOr51yJBmNkHDhalTx6RxuuWyZ/UVwoKoh3JIy+c1P3Pg2v0VFpJ7UqhlykkcwkbPkzJtptUwSSLMV6wux6CPWo7aqbL1j/i0MIwRmXfeD6ebRG2J1eTDoaoiska5wMpddUSJv3hZd5h2tTOutOk5l58DrOInC4cGswj2IBXaBu28E55WRz679X2vl3wj4GKxmGydtkvjnGSgFetdYG7qJnWgGByf5eBKG/4gBH0VuOeeeiI8lrzgSqnAkQVFzT30b1dWsOWp19Orwc3zuVMsnhxja6Vaw90b66pygq3y7QEbLRx8kJFKmRpggW5lr70dGWhyCnrMM1HfSp63xsrdmGotKJcef+oV6LnRqquOF2hHZmiWKzlw9dtKQRgiKxzQCsDVwvSruGxTfZLUl6bjDxtLU9OkMvonmlI9c05NB/S/L/7aiHGlFBm0ZG8eIeunGvvrDJuRcdPd+4YB35+ogm2ww+FgmNJiS82VHZ1
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(55236004)(6506007)(76116006)(66946007)(66476007)(64756008)(186003)(91956017)(83380400001)(38100700002)(66556008)(66446008)(4744005)(5660300002)(38070700005)(7416002)(508600001)(2616005)(6486002)(86362001)(31686004)(122000001)(36756003)(31696002)(71200400001)(4326008)(2906002)(316002)(6512007)(54906003)(110136005)(8676002)(8936002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L2RPTEhGeVhQM3QzdjV5TUVSdXdyN2dnR1JhYU1odHBCbkZXc0EyL3piYjdO?=
 =?utf-8?B?VEJ3SEhSUU5lSnVvaGR6Z2JPK1h4MjFkeU9WcENuREU4NUpkUkhUQW4ra1NF?=
 =?utf-8?B?RWpmVXVjcXExaFVIVXlQeTBkRkhrQVhTSGkySHFjS0prV2IvbUNmRE84K0VQ?=
 =?utf-8?B?T1d3Zng3VnR6c1lQMlZ5TGZZWVpNRERHczZwS3JPdWp3M016Z2hlanZ3cFdG?=
 =?utf-8?B?SnV4TkpWMGp0cGxlQzVRR3RJOHo2N25vTnlqNFpCY25jNlRWSElBS01BaGUy?=
 =?utf-8?B?N2xnRTQ2MHNVWkdENXlTbzN1Y0FLdHlLUmJVT2tpMG5oVk1sc01iZ3Rab3JF?=
 =?utf-8?B?OGRMdTFSRGxYb0tXdEtEMU9lZnhoRDgzM1ZzOEFqSzBKZXBYZXVSZzFKSGdm?=
 =?utf-8?B?WExmRDJtU2I2bU9lT2JoanJpODdYSTZqNnd6RlVmNlZGNjRSTFFtOFBLaXNG?=
 =?utf-8?B?ckp1YTI5NWNtajhxZFB1ZXY0NVBaOGY5SlN6bWljb294Zi92YURMUXFWS3lH?=
 =?utf-8?B?dGlhVk01Q3lEU3ltVnluTGN3UmlJN1puOWd4QTBHWkNndDRDRGFRKzRCK1Vw?=
 =?utf-8?B?YUdqWS9ZNThSOGxieG9MSUNnTENEOFd2eVk1YWZ4eWdGRk44dzFGUUhRNWRO?=
 =?utf-8?B?eU5Ub0xEZDdUNnFXVWMwNmJVR0tJRlVFN3JUZ1dEMHYzcTJXM0dDdDgzRnZN?=
 =?utf-8?B?cWtKVFAvU0p0cmhGWFQ0M1dUbGFibU8vSjZnclBHV3BHbWNBY28xbkZRRlNq?=
 =?utf-8?B?V2pyOHlMQ0ZMR0EwTEk1ek1lMUxxUFh3bHJWczd4MmVlTDVMQmljWUJTa0tw?=
 =?utf-8?B?dXc2emVVYlphbU0vSm5abGplT3B5aTVZaStmZTU4cGpZRjRlSGNmT00zVXVq?=
 =?utf-8?B?L0YxMWtsS3dXU2N3dWxjbFJ3TG5HUFArdnNmTkM1YXdSSVloNlgzQzZMSlA1?=
 =?utf-8?B?V0lDOTVxWmNaNDg1RFo2RzR5WWhjVklQTld4WlErSEVESUVFRTF0cXhNWUZ5?=
 =?utf-8?B?d2V0cEhsVU1ya09BcVhEdDNZM3hialdXL29LUmJqNm95YW5RVGdEdEY4TFlU?=
 =?utf-8?B?T2VoZlBvYTJqc2MwMDFMWmV6b3J5eHkrK0lZTlkzeDZVKzgwelZMVUZXNDZl?=
 =?utf-8?B?ejdpTXJGMXE3UEJRQlovVGVIMkdCQ2F1T2JROVg3a1VleDhYVXFvUE55dWRy?=
 =?utf-8?B?d0trRkdpQ1grcnhxbkUxeThSNnQyNGljTVVuZDkzcGZBQnlhN1U5QkRGS3dO?=
 =?utf-8?B?MmRzdU5oOVM0d0twL1ZMVGpVd0toaVlPTjN2bW01YzhRRUtiWFJSalVxbS93?=
 =?utf-8?B?NGNjNEVoM0tSTEN3ZkNibHFNejZvYmVqcVdvdnpoR2podlhWQUxaV2JIUlJa?=
 =?utf-8?B?ZjZUM3pjRVdQOS8zVklTNnJBTWpjeDljQVVIWWJuZGs4U0pXYU5EZi8rUGJC?=
 =?utf-8?B?TU5QeUFjRnpKSDFDZGwyQWc5UUhMU1phL0M3Y0hLMHNoV3ZodHAvRGVDRzVI?=
 =?utf-8?B?T21aazh4bFRZT3liNnAzdUNhR2tVVElTNlZ5Q2lQSUQ5b1NkY21EeGJHa2E3?=
 =?utf-8?B?c3BYY0E1RTZqckJIYkYwSjV3RGx2Zml0NzhpZzQyckdtMERPUGVWTUR3WWRw?=
 =?utf-8?B?eCtUZ0YrWHFleEk2RUZ3Ny9td2pKT1ZEZFIwZkx6dXllY3VlTjJwVm43RzlY?=
 =?utf-8?B?Y0FsT1daQ0VSVXBnSFEwMFZSK3E1WnlQZUJOcWNORkhZZ1RFZ0h3MHl2SmNL?=
 =?utf-8?B?LzRsdWc4c3dVbFVudGtmTVBrMTVXUmQ2VWlwNjNlREV5T0taTnpEOU14Wk1u?=
 =?utf-8?B?K09OTFZBckhTN0VsTVlKUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C6F5150524ECD489FA4F9C864BD5FB6@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fec98dcf-d894-4696-ca1e-08d97f2bdf1c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 07:21:05.2605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: taYtc1Nr/Uf+PQDyGPBn6/nKtpu7LdJrtFplsJ+y+CvLxpZAN1Ve6M4TRjSqatAOJdir6ugUI/TJN/qerHf2hK/NmqZ3RzGqtmr60LJhXg+/BskB9bwTmAc6a9aJP5mN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7347
X-Proofpoint-ORIG-GUID: zW2iYfPy16wjOXf05k7fn3oLyDZCnWrn
X-Proofpoint-GUID: zW2iYfPy16wjOXf05k7fn3oLyDZCnWrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-24_02,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0 clxscore=1011
 mlxlogscore=783 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109240042

W3NuaXBdDQoNCg0KPj4+IGluZGV4IGQ3NzRhNjE1NGUuLjYzM2U4OWFjMTMgMTAwNjQ0DQo+Pj4g
LS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMNCj4+PiArKysgYi94ZW4vZHJpdmVy
cy9wYXNzdGhyb3VnaC9wY2kuYw0KPj4+IEBAIC03NjcsNiArNzY3LDE4IEBAIGludCBwY2lfYWRk
X2RldmljZSh1MTYgc2VnLCB1OCBidXMsIHU4IGRldmZuLA0KPj4+ICAgICAgZWxzZQ0KPj4+ICAg
ICAgICAgIGlvbW11X2VuYWJsZV9kZXZpY2UocGRldik7DQo+Pj4NCj4+PiArI2lmZGVmIENPTkZJ
R19BUk0NCj4+PiArICAgIC8qDQo+Pj4gKyAgICAgKiBPbiBBUk0gUENJIGRldmljZXMgZGlzY292
ZXJ5IHdpbGwgYmUgZG9uZSBieSBEb20wLiBBZGQgdnBjaSBoYW5kbGVyIHdoZW4NCj4+PiArICAg
ICAqIERvbTAgaW5mb3JtIFhFTiB0byBhZGQgdGhlIFBDSSBkZXZpY2VzIGluIFhFTi4NCj4+PiAr
ICAgICAqLw0KPj4gSSB0YWtlIHRoaXMgaXMgbm90IG5lZWRlZCBvbiB4ODYgYmVjYXVzZSBmb3Ig
dnBjaSBpcyBvbmx5IHVzZWQgYnkgRG9tMA0KPj4gUFZIPyAgSXQgd291bGQgYmUgZ29vZCB0byBj
bGFyaWZ5IGVpdGhlciB3YXkuDQo+ICAgSSBoYXZlIHRoZSBzYW1lIHVuZGVyc3RhbmRpbmcgbGV0
IHNvbWVvbmUgZWxzZSBjb25maXJtcy4NClRoaXMgaXMgbXkgdW5kZXJzdGFuZGluZyB0b28=

