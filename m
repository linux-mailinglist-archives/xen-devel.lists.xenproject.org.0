Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A9D459D16
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 08:50:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229154.396591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQZ2-0004Ln-O3; Tue, 23 Nov 2021 07:50:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229154.396591; Tue, 23 Nov 2021 07:50:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpQZ2-0004Ij-K5; Tue, 23 Nov 2021 07:50:04 +0000
Received: by outflank-mailman (input) for mailman id 229154;
 Tue, 23 Nov 2021 07:50:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lRmA=QK=epam.com=prvs=19611c0f38=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1mpQZ0-00040Y-Vk
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 07:50:03 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f53d75ca-4c31-11ec-a9d2-d9f7a1cc8784;
 Tue, 23 Nov 2021 08:50:01 +0100 (CET)
Received: from pps.filterd (m0174676.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1AN7j9Xg006392;
 Tue, 23 Nov 2021 07:49:58 GMT
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3cgv6700es-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Nov 2021 07:49:58 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4883.eurprd03.prod.outlook.com (2603:10a6:208:103::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Tue, 23 Nov
 2021 07:49:55 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::c038:e032:595a:651%8]) with mapi id 15.20.4713.026; Tue, 23 Nov 2021
 07:49:55 +0000
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
X-Inumbo-ID: f53d75ca-4c31-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI84PnZq+D03By66BV+EshIRKHtB78YnblBywBa08E1qKrb5QGSCxyT1VRqmSFfy2p8duDJNsLbgLpv5xhIbk2pSnkye/2Z1wL2mwMYz4bKUeg4qyAkBq63w/NS42NtS/c/NaSxsXbW/I+7kVerG91nWWm+FjfnIoZZrZ9RLzi7EU9bJlqeyBdX4dJAHlweVW+jl3cqyjWGf/M2e6LP6hD7qnVuVXvPhQ+DgY8wgB9oTdULUs4aHCadlxztuUq0gRktCF8GRlXPRtBRHEtHw+K9C9Oui1LtVPv6BFE51Ejw7lvK8BVKL4+ux1QpHwvwi2eS0SPZ5GpXd8uYpdgcOOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q46ah8CYGUsvSqYFYPMvxGjTiEPNA4KXxq5xsnZDOVI=;
 b=PdgDJjpu2MY0ETNh3o0xFCaho7LQqzSNdbhHJIRaCS1WaRjzzHz5XGCeaDpvpQhvmYKjc90h61HU+6NS79uIkbUu7QddK0NhgrrEWwj6nIyjY/c+fYhudyQBIi/idDJZn5n5lxmfrNv/8ndkCo3bnerMBmzuRG/cDBOKrRE9jksNHRRfQUfYaBBJN06d7f1HlLUFBPTt83hZBJvsWmQKpm4F+pbTaajBQ/4D4NTGOEnHJ9mMHSlLUwvLDmjNWET8dBqJJWn1I2ar+sDHENWgoW4diINsfydKkJGMjUaZEm27jZUxIqQKvpVx2HseQPH7wgI+xlhw92dPJp8+A7+SoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q46ah8CYGUsvSqYFYPMvxGjTiEPNA4KXxq5xsnZDOVI=;
 b=kV0rK/Wk68wjtX+2x2HE67htdw3RGTkGfZiReblcCy0IjRs5J8q69MCe/T5cv3p/j1t2WIIbAYiXqgQ5jeS4ZtgrwW4lzZsKpFvYIaTrZOYswICvf+KE/mrKqLTRVyluqtCCapPw0FmeWcJRCLvlBds7g0iCfEwZVmN1YVmhTpePnFKsTgsXbYgJ7couj0RLWVQ/VhdsVbLbNyFoIfLqXTKYLTvIV2x81il4De6xvFrvIB0PF5xY+KQVyWXZpb7HrVmpcD7hAbn3B46IBc1uUi1vkkE6h5jjtHWG7UPdTlZ8lm5/SfXM+SRn7nUbrXbrj9kNj2tQxyQXEW5D1nwsMg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Topic: [PATCH 1/2] rangeset: add RANGESETF_no_print flag
Thread-Index: AQHX34NQb/OdxzJcEUqRnDxd7565ZKwQu1AAgAADEAA=
Date: Tue, 23 Nov 2021 07:49:55 +0000
Message-ID: <b3a0d4c1-8b18-5d63-c70a-8b3db7fd6c84@epam.com>
References: <20211122092825.2502306-1-andr2000@gmail.com>
 <d6b298a2-bc04-8845-eaea-09502e32dcf1@suse.com>
In-Reply-To: <d6b298a2-bc04-8845-eaea-09502e32dcf1@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d028fc1-727b-4cb6-8b02-08d9ae55d704
x-ms-traffictypediagnostic: AM0PR03MB4883:
x-microsoft-antispam-prvs: 
 <AM0PR03MB4883DA15DD205AB1D22E987DE7609@AM0PR03MB4883.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a2D6YX1UTByZpe/x93u6pe2P0qaAzEeeK2SkeD34LBSxQLRCiK8z8kgu03jPYbfOwUPdbSdxyZaK4PLFbZ+vf2jtTDAZtIFNYibGTx+z4ZlyftL+lox/JWjQpNtYmng8o+8ETExRrQXOpneP+4uc+X+egHPcca0+nm1hm6EkE3/U381eRkwlX1LqsDw1NCmzDLj2/5HumDskF+Nq2PnYc63aCeBWj1S5oXsqvn0ZjSMAB2X83KU9DlHGB1LZ/EJ8QUGxzU5URQY/iAGxlMd4tMcXkwfbDPsJ+rMwMUmS9ZG6I62nA1lTQG8OCppbWcsM2lhoeQvCEUwFK15kbaYAjpT6UPTjLklpiLCQkiB3maTXm7pX6hjAGXs5rl7aRcGvRIKHZWlb8I80Kr8XCiZdZVVhpDd93qMjwz76D+6HOJuOvyjR7TeEngLOorUzLg+fJ5N9VzBlOFpJWgxuEuenFeaCkOeYKn64ifyg0XZMtPZ4hiSnr93Ee4i48oRg2yYoPKfSvU3/RBAnpU1eg+/qaJDzSjWNj9gnSRVI+KAKsPLgqTQEoobsVTn1lYN4Rue8XppD3uHtW+9NDf7a8zPNHQBQDWiJqf5nnnCoJ1YkwBAJiBWmsaQy9GAfyzrRwdfoNuU2+c1vD3ft+1Q0rPdXnGSiUv8fRVu+ClRUwf1pj96If3ovqY8WV5t6vgaM40XzIQICmVZ3IEQ/+P6mKkQE4COhhntJGEbGayVDYKx2DL8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(36756003)(8936002)(86362001)(6486002)(508600001)(54906003)(26005)(4326008)(83380400001)(2906002)(8676002)(6512007)(6506007)(53546011)(122000001)(5660300002)(107886003)(38100700002)(66476007)(66556008)(31696002)(64756008)(66946007)(91956017)(71200400001)(2616005)(38070700005)(76116006)(6916009)(316002)(66446008)(31686004)(186003)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MUlyVjQyaGUyTitGK1RoUC9aZDRualluVS9FYWcyYTY0eGFQWVdSbk81SS9R?=
 =?utf-8?B?MEx0VFNVWlgxYU51cEFWRTQ0bEsvcXdGc3kxak5MdGtIb2hjT3JmZTFWL3Np?=
 =?utf-8?B?dGhZOS9VTVFnQkJ2ZmxLRlEwRHYxT3JNeWh6UGc2RTlrUTlKQ1B2cnNrNjhK?=
 =?utf-8?B?cTVydlZpZG9iUDI2cWVHMVBFcXVFT2x5by9FaWY2ZWw1aUdFaUlIcThkRGZH?=
 =?utf-8?B?SDNCS29NSUM0R0hnNlByemJlRFRXQ1ZkZmRoS1BFWUs3Y0I1bXh6TnhvclNK?=
 =?utf-8?B?alZXSjZKS2FaRCtBVWxNMG5rM2dBSWc4YmE5VW1iUWZPVFVmQ2V0KzZHK0JF?=
 =?utf-8?B?VUNtNmx1K1dsaGpBR3J1RzlETVJDUklmZWlHZmpKUnlwamM1Zm5TZHl5WWNM?=
 =?utf-8?B?TUphZzEvUXpOcjdIOWcvVHl2bWlJWmlvempRNmhTbENNcllVRUpQNlM0SEpu?=
 =?utf-8?B?UWRRYXg4T2pMTHAraVBkVndRdHI1M2N2SzdLNWRObVo1KzF3UDE0QWIxYk5h?=
 =?utf-8?B?OGowTWg1MW5qTmpZb24zWUFyU3YvQU5ZOEo4WW4xcWJsY1krV1Z2R1lkU2U2?=
 =?utf-8?B?aUVCVk16MEpEcXpCSllwOUF1Sjk4bERlOGVxZGpOeURVRTRrUVdDNHBTWnhL?=
 =?utf-8?B?NG9lZE45WmhNczRFVU9zSWNBSGhDNm5sSXdaTTJsTnE5UVVMQWM2Z0dWdEtk?=
 =?utf-8?B?ei9HVFg1LzQyNDVSOWwvdnNwSDd6WlFkUjl2UVM2TWV5Y3lwenlEREVONDNq?=
 =?utf-8?B?cU1BMlI5WUplbGVKK3VSNWwzNUJFS0R3YXZEMkx2d3BUald6WFpHcEFOMTlI?=
 =?utf-8?B?NkpOaWtpaXh0Snl5ZytxQTdvMWdvZ2FhQXYzVkRwckpubDRKN1EyNWI4Sk5w?=
 =?utf-8?B?RERzZ2dpVHhtNGhaZXc1WFVSUk9CZ1c1SEZsc2xuV3B0Z1Z2eWdJQmtHMDJj?=
 =?utf-8?B?OERFbTM0dFNpYVZXUzNhVkg3VzhkZEVVV2R0WFpENUFuNXhEb0lPdDFtMWp5?=
 =?utf-8?B?d3ZBTzBuZkN3WEo3a3pob1hLRyt4c2ZSckVqVGhOR3F1dkR4SldCZWJ5eWlq?=
 =?utf-8?B?UWkwWFdyS0NaYWRjNXg4OXN1TGxPaXB2RE1ONkZjazJNUDVHRU1INCs1TURS?=
 =?utf-8?B?L2dOM0NLbnM2QkluWlhWU0hyQU4rNE1sRXhJMC9jOXNrKzY0cHlOeCtsWFly?=
 =?utf-8?B?N0F5QlJaaDJWMnRWVEQ0Y2xhZlVlMm5qa3pZZzJ1MnhRTlFkRVJHWXNpcERN?=
 =?utf-8?B?YWd0MTJzajZJeGlyUmxuU29PREhEY1ArM0IxbE5oRzQ1TlNjZVVMOWVUV1lr?=
 =?utf-8?B?bSt3ODQrQS9ZUjFpWFVVbGlhNzhCUFE0Ukk0ZThDVjlCU0tGWmxEdGRkeHRW?=
 =?utf-8?B?cTMwSktKa24xZ0ZtQkhqN0tKSHd6ekZmaGROK0hUUHI0TkQ3U0YwVUpOZ2tN?=
 =?utf-8?B?OFgyak9nbHVFK0toSysrWEFZak80cTVQb3VnRitkVTVlNDhKQ2lQQTJEZzV4?=
 =?utf-8?B?ajZUcThRS1duRmc1cFp1WmJxb29PTGlqTTlXRXFUSFFINlFsUzZIODl4ci9U?=
 =?utf-8?B?OEhXMWxEblR2ZnlJNDRJWm0wUTR3U3FKRHNpd3dTbGZ3bG5UNkZqNW5lTE85?=
 =?utf-8?B?SFEwbnhYUjMyTDZvR1h6N3FyZ1pHYkE0cThKRzJnWjBtRVgrOG81MHNWeTBs?=
 =?utf-8?B?MjFRREJCU2ZQMktRMmZNY2cxdVNEQ3IzdkZOWjR0cXltSkdmUE5ZYmJCQndP?=
 =?utf-8?B?QkFmWWxWcUdqbDlDdXdCOEhXcmFUR1BvWFc3ZGphNmIzY3JqVUp4VDA5TjdN?=
 =?utf-8?B?THV0R21ZMW11NUd1bTdzYW5xb0lQNkc5N2ZOSUFLQ3UyWlJkb0Rja3EyWXRF?=
 =?utf-8?B?ZWpXdSs2c1NqWlMwbDdSNUFneWwycmxIOGU3SzRaVW5oMWc5UzZGWVdEYTg1?=
 =?utf-8?B?aW5KdC82aVJLQjFqeEQ5ZDhGRElJL2pMalNlRFBac25qNHY1dmZ1N3NEK1FY?=
 =?utf-8?B?Z1FuVXoyQU5FMjI1blpnbEFPQlRZNkxxdm1Kby9TbUM5eTdWZXBPVVd1R0lz?=
 =?utf-8?B?WkVWOWVmMWV5NUlvRjVzd1hKWmFYQ0loSjdNT3ExMllFeGJqck1VZkgzU1RL?=
 =?utf-8?B?VlZUOXhBWkZ3aTJhL1lvRVg4bDFrK2ZpUE95Y2xPZTNmTlRyWFJYTGNTTXN4?=
 =?utf-8?B?TVdtRmFWamVuYUNtenM5N0l6YVMrdDBtbUZsQlh1Z2JtTlpsWWtzcUQ3QW1j?=
 =?utf-8?B?bitkSXhsdUZ3R3lrZUtxZGVGME9OQ041RjdDRlN1Nkk2d2VwL3k3Znlac0FO?=
 =?utf-8?B?ZWVvRHp3SEtjMDlkd2NxNnIrU2RaWnllb2ZjU2FWWWVhQU8zQmF4QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D7F79D8ADAC85044A5E1A6D4F31448F8@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d028fc1-727b-4cb6-8b02-08d9ae55d704
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 07:49:55.1761
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: w1hyOEgjar1AgHrCQZQF9LHloWSrWu/bYYQZBhLx0QvHPT9/SQlWSUbPh4y8VdAhpEcxuTGeC53RhkEJouCM3IXl8VoF14H9QRYGWQ14wSudszEccrVSyysOE5b6DZ7g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4883
X-Proofpoint-GUID: MXHGUzrRMmZV3zYHlBY_DwHKm78Uhm4R
X-Proofpoint-ORIG-GUID: MXHGUzrRMmZV3zYHlBY_DwHKm78Uhm4R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-23_02,2021-11-22_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxlogscore=701 malwarescore=0 impostorscore=0
 phishscore=0 adultscore=0 spamscore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2111230040

DQoNCk9uIDIzLjExLjIxIDA5OjM4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4gT24gMjIuMTEuMjAy
MSAxMDoyOCwgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gd3JvdGU6DQo+PiAtLS0gYS94ZW4vaW5j
bHVkZS94ZW4vcmFuZ2VzZXQuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVuL3Jhbmdlc2V0LmgN
Cj4+IEBAIC01MSw2ICs1MSw5IEBAIHZvaWQgcmFuZ2VzZXRfbGltaXQoDQo+PiAgICAvKiBQcmV0
dHktcHJpbnQgcmFuZ2UgbGltaXRzIGluIGhleGFkZWNpbWFsLiAqLw0KPj4gICAjZGVmaW5lIF9S
QU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4IDANCj4+ICAgI2RlZmluZSBSQU5HRVNFVEZfcHJldHR5
cHJpbnRfaGV4ICAoMVUgPDwgX1JBTkdFU0VURl9wcmV0dHlwcmludF9oZXgpDQo+PiArLyogRG8g
bm90IHByaW50IGVudHJpZXMgbWFya2VkIHdpdGggdGhpcyBmbGFnLiAqLw0KPj4gKyNkZWZpbmUg
X1JBTkdFU0VURl9ub19wcmludCAxDQo+IFRoZXJlJ3Mgbm8gbmVlZCBmb3IgdGhpcywgc28gSSdk
IGxpa2UgdG8gYXNrIHRoYXQgeW91IGFkZCAuLi4NCj4NCj4+ICsjZGVmaW5lIFJBTkdFU0VURl9u
b19wcmludCAgKDFVIDw8IF9SQU5HRVNFVEZfbm9fcHJpbnQpDQo+IC4uLiBqdXN0IHRoaXMuIElu
IGR1ZSBjb3Vyc2Ugd2Ugc2hvdWxkIGRvIGF3YXkgd2l0aA0KPiBfUkFOR0VTRVRGX3ByZXR0eXBy
aW50X2hleCBhcyB3ZWxsICh1bmxlc3MgeW91IHdhbnQgdG8gZG8gc28gcmlnaHQNCj4gYXQgdGhp
cyBvY2Nhc2lvbikuDQpPaywgSSBjYW4gcmVtb3ZlICIjZGVmaW5lIF9SQU5HRVNFVEZfcHJldHR5
cHJpbnRfaGV4IDAiIGFzIHdlbGwNCmFuZCBoYXZlIGJvdGggZmxhZ3MgZGVmaW5lZCBhcw0KIMKg
LyogUHJldHR5LXByaW50IHJhbmdlIGxpbWl0cyBpbiBoZXhhZGVjaW1hbC4gKi8NCiNkZWZpbmUg
UkFOR0VTRVRGX3ByZXR0eXByaW50X2hleMKgICgxVSA8PCAwKQ0KLyogRG8gbm90IHByaW50IGVu
dHJpZXMgbWFya2VkIHdpdGggdGhpcyBmbGFnLiAqLw0KI2RlZmluZSBSQU5HRVNFVEZfbm9fcHJp
bnTCoMKgwqDCoMKgwqDCoMKgICgxVSA8PCAxKQ0KDQpPciB3ZSBjYW4gdXNlIEJJVCBtYWNybyBo
ZXJlOg0KDQovKiBQcmV0dHktcHJpbnQgcmFuZ2UgbGltaXRzIGluIGhleGFkZWNpbWFsLiAqLw0K
I2RlZmluZSBSQU5HRVNFVEZfcHJldHR5cHJpbnRfaGV4wqAgQklUKDAsIFUpDQovKiBEbyBub3Qg
cHJpbnQgZW50cmllcyBtYXJrZWQgd2l0aCB0aGlzIGZsYWcuICovDQojZGVmaW5lIFJBTkdFU0VU
Rl9ub19wcmludMKgwqDCoMKgwqDCoMKgwqAgQklUKDEsIFUpDQoNCldoYXQncyB5b3VyIHByZWZl
cmVuY2UgaGVyZT8NCj4NCj4gSmFuDQo+DQpUaGFuayB5b3UsDQpPbGVrc2FuZHI=

