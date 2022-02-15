Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2C4B6ADC
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 12:30:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273051.468103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJw2Z-0003O2-Nn; Tue, 15 Feb 2022 11:30:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273051.468103; Tue, 15 Feb 2022 11:30:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJw2Z-0003Lj-JU; Tue, 15 Feb 2022 11:30:39 +0000
Received: by outflank-mailman (input) for mailman id 273051;
 Tue, 15 Feb 2022 11:30:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xOiq=S6=epam.com=prvs=4045782cdb=oleksandr_andrushchenko@srs-se1.protection.inumbo.net>)
 id 1nJw2X-0003LV-Go
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 11:30:37 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b13eea2a-8e52-11ec-b215-9bbe72dcb22c;
 Tue, 15 Feb 2022 12:30:36 +0100 (CET)
Received: from pps.filterd (m0174681.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21FBPrxb006717;
 Tue, 15 Feb 2022 11:30:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3e8b9yr0ux-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 11:30:31 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com (2603:10a6:20b:153::17)
 by AM0PR03MB4081.eurprd03.prod.outlook.com (2603:10a6:208:7a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Tue, 15 Feb
 2022 11:30:15 +0000
Received: from AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73]) by AM0PR03MB6324.eurprd03.prod.outlook.com
 ([fe80::fc4d:4749:5d1:eb73%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 11:30:15 +0000
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
X-Inumbo-ID: b13eea2a-8e52-11ec-b215-9bbe72dcb22c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cq1XW1xTQLIeQ2z2+RWP10ULhy9e+VrifKStoD+bjZfEDCmNAJ3R83/S3jJ+eb2q4jzOMUHtAHGUiUSB3eknTLGDqvpaVCzMjR5NObLJa2vbEtiZ4LaqGeDbDkvG9URhdIiAexz3W6KPFSbG+eUH1GmVacX/LTp8u9zxnAESQEJq6l36Lcx1zbGu9rZwEXTn7ZS8XTE+fGkHnH0tFm5TZjJbBNvBCCSXE4fPlli/9rNSHKQSqWLvSwQwRrIxZaCVEOR09LCDITVE9XnpeisgurJP1bEXi3QYynce5UMkTeu+4PGTynal4ceh3EETfhD4hDFciMaVaSpagF7lkJk7iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=742Cnv8Lj8ogmhysj6T2IvuwDHMG6TjprE6oM5U6oPU=;
 b=K61go//pwqQuIzAYDgKugVi3Q4jjl8LMCNtSkH32DSWWGMtNIUHihavT8v5XSFuErxYYbefd9VE3GMAIaShPPNS7s2L6ONbT3xe6HBchVyxMy8AYgIYMVDimrTLAjcL011H1N2PTJuoFkxT2elBITc7XD8nTlhsQUTKUIKVflfoQKf/X3uYPg0MWfLBlkqFXDg7dTztKu5ppwtLsM9TVZVySWt5KdaiY9wNS9YK4vZjRUt8AOjHxwScsGzxEIsJP4ihKgRWAB9BWwLIxu7J9RJYVU/Vtkyql1trXTcd8yBGgxW5fUo8PA/TGf5a/M9chW71wczWPoQjfGO/CDgnJtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=742Cnv8Lj8ogmhysj6T2IvuwDHMG6TjprE6oM5U6oPU=;
 b=KyAYE6XPzqD8//n2fRzOq6XeU/5ZxB7KC4K9psPM0n75oL7uX6gY0xM3FJJ5oD5y2fkxZUvLs9s072f6n0hN07vgfytH+OEGoz7BV9pVjTYmNuo7KFKzlCZplJcGAhFHhqoYWBz7Qno0qjD1vycJtWjvOo1wI7VuzJ7OHYF0MBhh3DcAlf5x4UkZ1McjZylVipM2+7fmuCpVEISTpzi4T1VhKQRN/6JRFGcxLa9VHr/5GTubhHQ6GZVCOAVd8sS5pTc5PxIZhWHHyG0MFKEZ5QX+oqgBZKZBGdegQs0otvqDlRtyrOO2z1UThK9H6qIbp/c0pOvi/tsOvABuEoB3Eg==
From: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
To: "anthony.perard@citrix.com" <anthony.perard@citrix.com>
CC: "wl@xen.org" <wl@xen.org>, "jgross@suse.com" <jgross@suse.com>,
        Oleksandr
 Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
        "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] tools: remove xenstore entries on vchan server closure
Thread-Topic: [PATCH] tools: remove xenstore entries on vchan server closure
Thread-Index: AQHX7cJnOJurcgYme0yvunOBFlJKtayU40cA
Date: Tue, 15 Feb 2022 11:30:14 +0000
Message-ID: <d9432327-24ae-366d-5d56-cc076445fca0@epam.com>
References: <20211210123519.595163-1-andr2000@gmail.com>
In-Reply-To: <20211210123519.595163-1-andr2000@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d0db4dae-8db1-4c63-859c-08d9f0768957
x-ms-traffictypediagnostic: AM0PR03MB4081:EE_
x-microsoft-antispam-prvs: 
 <AM0PR03MB408177082D16ED3422709321E7349@AM0PR03MB4081.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 6UAflzRMEpfkrJILucJxZE2dFzejuc3wCnEvRJUBfYWLIXUO+HxE6sNR00ZNqSpp7L4eEhLl0/svh0siC7oh+FvwJVvv1Cl/le2XlNjD9mYh0Pd5yzNx4VEE2DMHDlIio55cgGp2HiVSqh+cy2uRwyNQpEdF6NSza6nTitOLU0X3+osrWoQRdBVR6iRkM2KTGK17NBBsakImpmTrwQUx9KbughxaSNP314wsD8ZXJPp3Soo+Pqc7FY9n2FyRmVt9j5aFUMPPz+eDIe50n8eFC+eVcC4c66I0m6mrf3rEvfOKToSV1ufZ4YitZXsTn2A5C3qSq++G6q4k9bo4wSrMBPvNSTsGtKsBPyBQuLAMov+3FgNhdwbBTRBGE46re7I17ewA/ZMIwsM35tgk+R5oXW5gglQ1w5M4TaUnwxXVpr9CxkxTj/LZlvEXTRqyY4RkTinNhdSbt+1pRJVtT4QfNhTD52vsxT/4rfFRtcaAOGbTQFNgVhPMtIauzwfh8Gy1xzNvhVx/ubesjTzxf312mblZdmPAweS2Cm46tWQYXEvIENTdREhooHFmnqNWQqYDGOaJG/3N/cmxU7odovZMH2BHUafsGNWw1kJwydnDFnH0F6vccu5L/ItKncqiKDbwOGkpR7942LqINC/G8C0Uy4ajKZaMzm23pLWphNs9rgP1zW9rdTijl5jVL3AWxSfhq3FPYTgDsRinkMvdUitAesd5AFt9Y+13ztwCwhJ6BagJAqkU3xGQp8Aki2jtixirenRFkAjf5AEbv/cJCoWP5iJ2ZVUDfYowd+0qYOOPL7PfgbmjMAacgA/n6o8H3awRmJQFJfuqUZL/QktDGIFuwQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB6324.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(64756008)(38100700002)(66476007)(66446008)(76116006)(66556008)(8676002)(122000001)(66946007)(91956017)(86362001)(31686004)(38070700005)(36756003)(31696002)(2906002)(8936002)(54906003)(186003)(5660300002)(83380400001)(71200400001)(6486002)(508600001)(26005)(53546011)(55236004)(6506007)(6512007)(316002)(6916009)(4326008)(2004002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?OWFNRG5MNXkzZ2lwa1FpYjRHRXZvbGxxK1AvMXFpZDBCT2IxUkRuMVV6dnFL?=
 =?utf-8?B?MmRMd2dUeThSMTNkQXBZcDFlOFBLSUVQaTU3ZXNCWndXVjRKUGozOGl1RXlR?=
 =?utf-8?B?dzBqeEVQZEpYVDR2bFpySUtZWkhhRDZ3UHFpY2JLNTZxNHRlTXFUN1puaWg0?=
 =?utf-8?B?clBYcTFjUmhJVXI1U0p6RmNvRUZOMHAxaDZlTG9hN1ZIZ0k3YS93MGVrZFhh?=
 =?utf-8?B?aEZwQTVyN2JscUtBc2huV0ZrZkdNUmg5YnM3ZjVDVkNqUm5WZytPZXM5T1Fp?=
 =?utf-8?B?MlorM2F5QmRSN1c0YXhJS0p6bmRpTnhFWTFDU0RHc2ZCVHlUY2ZtU3I5blAv?=
 =?utf-8?B?N0NCYStSYStEcTZMRW82OVk4WW5TVEExcDlHV2tKcTYvZzU5ajB5NXJMQlND?=
 =?utf-8?B?TVFGeVpzZWtmS1pWaEVLSE1Bb3hnNitNMG5wVktqUDJSZjNUWFVtWGZERyts?=
 =?utf-8?B?WUVrYXUvV3UzTndKQ00rbkVHdDJ5OVNZbngySjRsQllUcWJIRlIzN01TaWE4?=
 =?utf-8?B?OWx0ZVNoaWt4VmRvM0poL1k5TkJIRnhJQ3loeUgxRGlKVjF1bHJtYkp0eVFh?=
 =?utf-8?B?cVdLUEdQanlqbmNlcnJURC9hOS9NVDRGbWUvRjhLZW9ndVB0clpRK2ZsanVy?=
 =?utf-8?B?a3U4WXJhazZZdTNLWjlrbm05MVdhMFBkVnFPelRCdTZWYzAvTEZpdDdmaU9M?=
 =?utf-8?B?V2FDMGxEWFdnMWswdWRtL1NTTnJQRHV6b0dlczNhT2V3MmdkeUVmQk53RFNE?=
 =?utf-8?B?enpmallsZStaTmhOWHU0V3NYdDRiUC82cDkxOXF5R0tPTWQwczVPZDN5Z1dM?=
 =?utf-8?B?S2E4T3FPK3JWZmFVZDR0aXRWZmNadldLTTZGOG9ST0JUcG1RbUducEdFSis4?=
 =?utf-8?B?eU9BVWszaDI4NTlTSERRVnk4KzBuSXBjOXZnbWJLbXZCL2lyNm1HMTloejJ6?=
 =?utf-8?B?NFV0WHdLYmowR1lObTJySmJLdjVyTy9aQ0NJd3hCaXpWM3NBZ1ZscG8yS3ZI?=
 =?utf-8?B?TnNhQkZzMW03UG04Z0tMd2g5V3BjSkpNTmJnaGExdFU3a2QwU3hNTGdOQ2Vz?=
 =?utf-8?B?S3ZJWEdMYkRyTmhmeTF4dXdBREJiR01Bb2lNc0UzdEtzODhFSFAvMmw4Q21p?=
 =?utf-8?B?aFZ3MS9YS2NrZ3JPMm1TaUVoZUZmMk0rWFk0K1ViUTRMTVdNUlZvUXVlSXJ6?=
 =?utf-8?B?UVdzL3RSam95c29YOC90OW9zYXNlQzhVQUdYajI1cEUwb3RhNXloOFp1dklN?=
 =?utf-8?B?ejZQMlA2MUNET3BhQnpQQnp5K0REZFlOLzhJTjEyM1hnVTIxZ3Y5Yi9kMFl1?=
 =?utf-8?B?R1Z2Mmk2YmxSV0FBaVlHNHZJTlVDd0hSS3VDemNsdFlYOWxTOEF3OVlNU3Bh?=
 =?utf-8?B?Nk9HSmRFNmM3ZmZQMUkrQ05pUVNkcUpnQnNXenR3MmJSZ3NtSWc0Mm5GM0RP?=
 =?utf-8?B?MUdLbzZIOW1hQ213VW51cXVINDBtNnk3ZzZXL015SzFyc01mN1FpYXBqckQ0?=
 =?utf-8?B?NnRqQ2dHdkRCS0JweCtNS1IyY2swSHd4dlRTY3FBUkpWTW5oU1dXSUZTc0gy?=
 =?utf-8?B?WUp5a0VUZ0t1b1RwUHJBak9TdnJPcVFtdzI3bkN3TXgwTGQ5dUVHYkpoc3Bj?=
 =?utf-8?B?WTQ0VFRPd0I5RDVTcEc5UlNYWXVGaGFXSUgwb1d5UXR1OFZ5d2p4ZEFEcmp6?=
 =?utf-8?B?TzQzUU5FdWx6NWFVc2JkUmVPOGNGMmcvd1p2c29SK3JrWms5VjMrcytmMjN0?=
 =?utf-8?B?NXpSZnJpcDJwZUlobE5lSU1KSHlyTmFKMkxRbitlcUJXQlBzNWNzdmsrdXZr?=
 =?utf-8?B?Zlp6a3Z5STR4Y1p3cWVqQVVjUW9ORWxjdXJYZGxWM3g1SDV5UzZjaHlwTWFR?=
 =?utf-8?B?dk9JYks3YXNCZERmRHdpMTBIbUtxUGRaRFNqekcvNTBVRGVWa2FjdElMdnJ2?=
 =?utf-8?B?bmc1VXhXRTh1YzRySDl1VHZFS1BVbEZ2S1ZmOFQrZWhibkRmLytpcFpRTE0r?=
 =?utf-8?B?Q3hMR29Gbko0WUlKamxvT1dDK0RneTlGVjJQek55a2tydmkzTUdKNXNISzly?=
 =?utf-8?B?Mm5hOWJzdHNaMHNkZFdWZVNLR1FnaWFTaElmSmJRY3czSTc1L1drT0dBMUZK?=
 =?utf-8?B?dGQ3U213N1lMb1owU3ZJZWx4YmdwRjBMTlJSczZ2UDh5aUUrYXMzcmhDUUR5?=
 =?utf-8?B?NWRVN2NMMHkxaHVqTkJobWVOR2ZlVytnZVB5SXFSdjBJK3N5TlRaQjc1bUUx?=
 =?utf-8?B?MzM5Nk9SNjFnZm5nWXd1bzZNWHBZWFlhYk5LT0tTQ2ZpZHNUT0szMkZJNng5?=
 =?utf-8?B?ZGpHMzg0VDhyVnJ3aStvbVBjS3I1VVljQzhCTytRdDFnWTVCN3pQUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <264AC9453FBE894FBCBB1FD27703AD0A@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB6324.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0db4dae-8db1-4c63-859c-08d9f0768957
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2022 11:30:15.0188
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xn3quL2K3H80CIashF32AZWJPbG5uUkTZmh9Dt28e3Qsy1GXKM3dyZoBmobENeIrcrD88uDQE81jPjbDt8v8O+M8fDliN8kUZCtgHmZCq41yfXE00HpzQOh5g59Uf3iU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB4081
X-Proofpoint-GUID: 3MCS6p1MoAcvUFJaS2pc4iR8GtLV6Ho9
X-Proofpoint-ORIG-GUID: 3MCS6p1MoAcvUFJaS2pc4iR8GtLV6Ho9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_04,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202150065

QW50aG9ueSwgY291bGQgeW91IHBsZWFzZSB0YWtlIGEgbG9vaz8NCg0KVGhhbmsgeW91IGluIGFk
dmFuY2UsDQpPbGVrc2FuZHINCg0KT24gMTAuMTIuMjEgMTQ6MzUsIE9sZWtzYW5kciBBbmRydXNo
Y2hlbmtvIHdyb3RlOg0KPiBGcm9tOiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5rbyA8b2xla3NhbmRy
X2FuZHJ1c2hjaGVua29AZXBhbS5jb20+DQo+DQo+IHZjaGFuIHNlcnZlciBjcmVhdGVzIFhlblN0
b3JlIGVudHJpZXMgdG8gYWR2ZXJ0aXNlIGl0cyBldmVudCBjaGFubmVsIGFuZA0KPiByaW5nLCBi
dXQgdGhvc2UgYXJlIG5vdCByZW1vdmVkIGFmdGVyIHRoZSBzZXJ2ZXIgcXVpdHMuDQo+IEFkZCBh
ZGRpdGlvbmFsIGNsZWFudXAgc3RlcCwgc28gdGhvc2UgYXJlIHJlbW92ZWQsIHNvIGNsaWVudHMg
ZG8gbm90IHRyeQ0KPiB0byBjb25uZWN0IHRvIGEgbm9uLWV4aXN0aW5nIHNlcnZlci4NCj4NCj4g
U2lnbmVkLW9mZi1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNo
Y2hlbmtvQGVwYW0uY29tPg0KPiAtLS0NCj4gICB0b29scy9pbmNsdWRlL2xpYnhlbnZjaGFuLmgg
fCAgNSArKysrKw0KPiAgIHRvb2xzL2xpYnMvdmNoYW4vaW5pdC5jICAgICB8IDIzICsrKysrKysr
KysrKysrKysrKysrKysrDQo+ICAgdG9vbHMvbGlicy92Y2hhbi9pby5jICAgICAgIHwgIDQgKysr
Kw0KPiAgIHRvb2xzL2xpYnMvdmNoYW4vdmNoYW4uaCAgICB8IDMxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysNCj4gICA0IGZpbGVzIGNoYW5nZWQsIDYzIGluc2VydGlvbnMoKykNCj4g
ICBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvbGlicy92Y2hhbi92Y2hhbi5oDQo+DQo+IGRpZmYg
LS1naXQgYS90b29scy9pbmNsdWRlL2xpYnhlbnZjaGFuLmggYi90b29scy9pbmNsdWRlL2xpYnhl
bnZjaGFuLmgNCj4gaW5kZXggZDYwMTBiMTQ1ZGYyLi4zMGNjNzNjZjk3ZTMgMTAwNjQ0DQo+IC0t
LSBhL3Rvb2xzL2luY2x1ZGUvbGlieGVudmNoYW4uaA0KPiArKysgYi90b29scy9pbmNsdWRlL2xp
YnhlbnZjaGFuLmgNCj4gQEAgLTg2LDYgKzg2LDExIEBAIHN0cnVjdCBsaWJ4ZW52Y2hhbiB7DQo+
ICAgCWludCBibG9ja2luZzoxOw0KPiAgIAkvKiBjb21tdW5pY2F0aW9uIHJpbmdzICovDQo+ICAg
CXN0cnVjdCBsaWJ4ZW52Y2hhbl9yaW5nIHJlYWQsIHdyaXRlOw0KPiArCS8qKg0KPiArCSAqIEJh
c2UgeGVuc3RvcmUgcGF0aCBmb3Igc3RvcmluZyByaW5nL2V2ZW50IGRhdGEgdXNlZCBieSB0aGUg
c2VydmVyDQo+ICsJICogZHVyaW5nIGNsZWFudXAuDQo+ICsJICogKi8NCj4gKwljaGFyICp4c19w
YXRoOw0KPiAgIH07DQo+ICAgDQo+ICAgLyoqDQo+IGRpZmYgLS1naXQgYS90b29scy9saWJzL3Zj
aGFuL2luaXQuYyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW5pdC5jDQo+IGluZGV4IGM4NTEwZTZjZTk4
YS4uYzZiODY3NGVmNTQxIDEwMDY0NA0KPiAtLS0gYS90b29scy9saWJzL3ZjaGFuL2luaXQuYw0K
PiArKysgYi90b29scy9saWJzL3ZjaGFuL2luaXQuYw0KPiBAQCAtNDYsNiArNDYsOCBAQA0KPiAg
ICNpbmNsdWRlIDx4ZW4vc3lzL2dudGRldi5oPg0KPiAgICNpbmNsdWRlIDxsaWJ4ZW52Y2hhbi5o
Pg0KPiAgIA0KPiArI2luY2x1ZGUgInZjaGFuLmgiDQo+ICsNCj4gICAjaWZuZGVmIFBBR0VfU0hJ
RlQNCj4gICAjZGVmaW5lIFBBR0VfU0hJRlQgMTINCj4gICAjZW5kaWYNCj4gQEAgLTI1MSw2ICsy
NTMsMTAgQEAgc3RhdGljIGludCBpbml0X3hzX3NydihzdHJ1Y3QgbGlieGVudmNoYW4gKmN0cmws
IGludCBkb21haW4sIGNvbnN0IGNoYXIqIHhzX2Jhc2UNCj4gICAJY2hhciByZWZbMTZdOw0KPiAg
IAljaGFyKiBkb21pZF9zdHIgPSBOVUxMOw0KPiAgIAl4c190cmFuc2FjdGlvbl90IHhzX3RyYW5z
ID0gWEJUX05VTEw7DQo+ICsNCj4gKwkvLyBzdG9yZSB0aGUgYmFzZSBwYXRoIHNvIHdlIGNhbiBj
bGVhbiB1cCBvbiBzZXJ2ZXIgY2xvc3VyZQ0KPiArCWN0cmwtPnhzX3BhdGggPSBzdHJkdXAoeHNf
YmFzZSk7DQo+ICsNCj4gICAJeHMgPSB4c19vcGVuKDApOw0KPiAgIAlpZiAoIXhzKQ0KPiAgIAkJ
Z290byBmYWlsOw0KPiBAQCAtMjk4LDYgKzMwNCwyMyBAQCByZXRyeV90cmFuc2FjdGlvbjoNCj4g
ICAJcmV0dXJuIHJldDsNCj4gICB9DQo+ICAgDQo+ICt2b2lkIGNsb3NlX3hzX3NydihzdHJ1Y3Qg
bGlieGVudmNoYW4gKmN0cmwpDQo+ICt7DQo+ICsJc3RydWN0IHhzX2hhbmRsZSAqeHM7DQo+ICsN
Cj4gKwlpZiAoIWN0cmwtPnhzX3BhdGgpDQo+ICsJCXJldHVybjsNCj4gKw0KPiArCXhzID0geHNf
b3BlbigwKTsNCj4gKwlpZiAoIXhzKQ0KPiArCQlnb3RvIGZhaWw7DQo+ICsNCj4gKwl4c19ybSh4
cywgWEJUX05VTEwsIGN0cmwtPnhzX3BhdGgpOw0KPiArDQo+ICtmYWlsOg0KPiArCWZyZWUoY3Ry
bC0+eHNfcGF0aCk7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW50IG1pbl9vcmRlcihzaXplX3Qg
c2l6KQ0KPiAgIHsNCj4gICAJaW50IHJ2ID0gUEFHRV9TSElGVDsNCj4gZGlmZiAtLWdpdCBhL3Rv
b2xzL2xpYnMvdmNoYW4vaW8uYyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW8uYw0KPiBpbmRleCBkYTMw
M2ZiYzAxY2EuLjFmMjAxYWQ1NTRmMiAxMDA2NDQNCj4gLS0tIGEvdG9vbHMvbGlicy92Y2hhbi9p
by5jDQo+ICsrKyBiL3Rvb2xzL2xpYnMvdmNoYW4vaW8uYw0KPiBAQCAtNDAsNiArNDAsOCBAQA0K
PiAgICNpbmNsdWRlIDx4ZW5jdHJsLmg+DQo+ICAgI2luY2x1ZGUgPGxpYnhlbnZjaGFuLmg+DQo+
ICAgDQo+ICsjaW5jbHVkZSAidmNoYW4uaCINCj4gKw0KPiAgICNpZm5kZWYgUEFHRV9TSElGVA0K
PiAgICNkZWZpbmUgUEFHRV9TSElGVCAxMg0KPiAgICNlbmRpZg0KPiBAQCAtMzg0LDUgKzM4Niw3
IEBAIHZvaWQgbGlieGVudmNoYW5fY2xvc2Uoc3RydWN0IGxpYnhlbnZjaGFuICpjdHJsKQ0KPiAg
IAkJaWYgKGN0cmwtPmdudHRhYikNCj4gICAJCQl4ZW5nbnR0YWJfY2xvc2UoY3RybC0+Z250dGFi
KTsNCj4gICAJfQ0KPiArCWlmIChjdHJsLT5pc19zZXJ2ZXIpDQo+ICsJCWNsb3NlX3hzX3Nydihj
dHJsKTsNCj4gICAJZnJlZShjdHJsKTsNCj4gICB9DQo+IGRpZmYgLS1naXQgYS90b29scy9saWJz
L3ZjaGFuL3ZjaGFuLmggYi90b29scy9saWJzL3ZjaGFuL3ZjaGFuLmgNCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4gaW5kZXggMDAwMDAwMDAwMDAwLi42MjEwMTZlZjQyZTUNCj4gLS0tIC9kZXYv
bnVsbA0KPiArKysgYi90b29scy9saWJzL3ZjaGFuL3ZjaGFuLmgNCj4gQEAgLTAsMCArMSwzMSBA
QA0KPiArLyoqDQo+ICsgKiBAZmlsZQ0KPiArICogQHNlY3Rpb24gQVVUSE9SUw0KPiArICoNCj4g
KyAqIENvcHlyaWdodCAoQykgMjAyMSBFUEFNIFN5c3RlbXMgSW5jLg0KPiArICoNCj4gKyAqIEBz
ZWN0aW9uIExJQ0VOU0UNCj4gKyAqDQo+ICsgKiAgVGhpcyBsaWJyYXJ5IGlzIGZyZWUgc29mdHdh
cmU7IHlvdSBjYW4gcmVkaXN0cmlidXRlIGl0IGFuZC9vcg0KPiArICogIG1vZGlmeSBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMNCj4gKyAqICBMaWNl
bnNlIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyBlaXRoZXIN
Cj4gKyAqICB2ZXJzaW9uIDIuMSBvZiB0aGUgTGljZW5zZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBh
bnkgbGF0ZXIgdmVyc2lvbi4NCj4gKyAqDQo+ICsgKiAgVGhpcyBsaWJyYXJ5IGlzIGRpc3RyaWJ1
dGVkIGluIHRoZSBob3BlIHRoYXQgaXQgd2lsbCBiZSB1c2VmdWwsDQo+ICsgKiAgYnV0IFdJVEhP
VVQgQU5ZIFdBUlJBTlRZOyB3aXRob3V0IGV2ZW4gdGhlIGltcGxpZWQgd2FycmFudHkgb2YNCj4g
KyAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBVUlBPU0Uu
ICBTZWUgdGhlIEdOVQ0KPiArICogIExlc3NlciBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBt
b3JlIGRldGFpbHMuDQo+ICsgKg0KPiArICogIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNv
cHkgb2YgdGhlIEdOVSBMZXNzZXIgR2VuZXJhbCBQdWJsaWMNCj4gKyAqICBMaWNlbnNlIGFsb25n
IHdpdGggdGhpcyBsaWJyYXJ5OyBJZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vu
c2VzLz4uDQo+ICsgKg0KPiArICogQHNlY3Rpb24gREVTQ1JJUFRJT04NCj4gKyAqDQo+ICsgKiAg
VGhpcyBmaWxlIGNvbnRhaW5zIGNvbW1vbiBsaWJ4ZW52Y2hhbiBkZWNsYXJhdGlvbnMuDQo+ICsg
Ki8NCj4gKyNpZm5kZWYgTElCVkNIQU5fSA0KPiArI2RlZmluZSBMSUJWQ0hBTl9IDQo+ICsNCj4g
K3ZvaWQgY2xvc2VfeHNfc3J2KHN0cnVjdCBsaWJ4ZW52Y2hhbiAqY3RybCk7DQo+ICsNCj4gKyNl
bmRpZiAvKiBMSUJWQ0hBTl9IICovDQo=

