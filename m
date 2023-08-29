Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A67378D043
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592524.925382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80M-0002gJ-79; Tue, 29 Aug 2023 23:20:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592524.925382; Tue, 29 Aug 2023 23:20:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb80L-0002Qy-I3; Tue, 29 Aug 2023 23:20:13 +0000
Received: by outflank-mailman (input) for mailman id 592524;
 Tue, 29 Aug 2023 23:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb80H-0006kQ-OW
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:20:09 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 975d823e-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:20:07 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9g021983; Tue, 29 Aug 2023 23:19:49 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:48 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:42 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:42 +0000
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
X-Inumbo-ID: 975d823e-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwRFIKQxV/4EBeCnkN+k9tbYlODgl03wOQ507M0uDlnZN9MLrGeTRSY3JYW5n/SXOKSUuwpEZ2IiNO5430mJc6YyAVYiQVm+/RjC0CzNDRlKBG+oy1G8MQRB7JNSKboCpF6RXKaQhX+pMVRcTn0TIabLtXxD0w2KvoF1VicF75z5BWry3QQKRiNuiJJeBHJXh/Zf4NNRYzShPnr573zK3kLgQ73tggDQFH5gZLbt7dLre26zZ8nBw/Na3uxb4+gM2D+zLBvu1a94Au54eAeoocW6YkRwSa7roNwDfUa6ePzNYui/jmsPBYG/HxJ8Biiqm+Bx+bEOl1wszmgOlC3isw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPcQXPgI5mctGtrdP3jDDvVvUOnHDqkbfoeVa86vr+I=;
 b=Kl2MIyHpnRqJOu65xDcql0WPcuKvh/OQw4uB72qc6Nj64CKoZ/0wkrVessRuWh3RyCR1m6VivtrmdRKQVreWMcciySZ+BLgbMl+BxLm9ef+nGD/U8Sg5C1pljkvPNJnSa9ZFF2ghwYqXLw80BBXsFMFsn7FC1CSV69XkYNkDN0MuO3M+qnAUm+XT/XaXjKZGg7SHm4JXHa1fvA5xlB632+8Ty64kilXjp5umCZj5dMirLXH4KBR+J1LUEmNsNonwIaMo99jdajo9NWJIBjxHaVUoFmaN6cpUlitvmF6KRabtHw0x2oqni6qDzuuIbHIVBQupcAFC3D4llMLE74Bgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPcQXPgI5mctGtrdP3jDDvVvUOnHDqkbfoeVa86vr+I=;
 b=YtcZoPlHKsWxfhEJMtyFFDd50kYPOE9XF2bOA7C/rW1DjBfkEETYGytJ/5JxkJiAGg1xoZbxsgGbgnNWinlZbbYCqIW8PzJnmQ7ji07otWABLsDUIg3+Lcz81C2ygtMIKnTdHhPBTf27dGBTb0p1f8OOIqwToSrpa9sXtgw3SYIx3YWbl5AtL1TsJyBYowWJw5iDKsoSXfNUFBWZQ/p1nEJM/8QanoBWunjY+1N0Cs6N4n0OWsmce1qTOeyCWSZNzfHDXurT1HyONl56z86OQWgQPU+VILym4pFuIiXRxcvwozwlr1hcPYhlx7kL+no/vy/TkfgblOrVrp1yO1qvfw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        Paul Durrant <paul@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Kevin Tian
	<kevin.tian@intel.com>,
        Jun Nakajima <jun.nakajima@intel.com>,
        Bertrand
 Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH v9 00/16] PCI devices passthrough on Arm, part 3
Thread-Topic: [PATCH v9 00/16] PCI devices passthrough on Arm, part 3
Thread-Index: AQHZ2s9JMemQqeQYOU6/+Cr/izf61Q==
Date: Tue, 29 Aug 2023 23:19:41 +0000
Message-ID: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 86d1d6bb-27f4-4868-2a72-08dba8e66c4c
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nCRgzZiwwd18zcYwdD1WeobdHNrvNNjqZUlUO0K00SpLCdIlGciifnzvWKlk0SPdSlQFkZQhaylD1sXNJrbYCh6PqOFIzHlKyhj+q4uRMFLAhpu+7mE9RA9zH1r73FDtkngJpxA5kG8VZ8aU8gE5IVGWibym0L1hqvnKjS/WRPq7YpgfNF62JfD7cL6H0a9P5UU8l7ty01pKj0u4ngCN14jAVeqv5wP7BVVcLeW4ZsfrLzSxUua+PJsJ2NClJt4+GOCwMgvidoFkbMJYRilhrsohTC0sdRYj2womLh8RG7A66uNGP7pWvv55r/AF5Hd9gaqQyJ/TrEkjoPFTdN28a+ARiymMtYT0W22negE9tA55kE7sX/EgJim/56oDDJnuwhaAb6+SF0fZgtOj1sV6MCj8U5+FJoej2ifUrplNaYUCu2ODcu1WqNKX/Wiuk9rdnjo/YS13susXa+zd+yB86mSLdzIN7xGSEOQ/KFVq6cPyWpD+u9xsSz2rhmtsaXpoGLfMdMIXba0FxmZCCCVnxh2ScySNOvtMAsdCpSOAqYdBRPOsnZxdz6THBR9K6x0B195Tb1qlJxeiOeStMWPqht0GkVR8uen1GwwtagEuuJuDA2ri4P0OpsY6OsP8tj9d
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(107886003)(26005)(2906002)(6916009)(64756008)(7416002)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?RFVaNDZabWk2WkVkQjBWN0tMQjVuNEtLd29EUlhrWjFjaHQwR2JjL2tma2V6?=
 =?utf-8?B?Rm5DL1diWVpzV2tLV00zakhEeUx5cU9wTExndHFUVGJDaG5Dek5aYlArNHZm?=
 =?utf-8?B?ZzNyMEZrUTdHYXNJWk9rNzZrYVlJcTBOb1RHLzBhZnhPeDJzQ1JERE1zcGFl?=
 =?utf-8?B?cjlrYUdzUDNXdzkwbTF5VnlQZ1IweGVqWlIzN20yNnhIUHUxWHRwY0NJT00v?=
 =?utf-8?B?MzNmNjdYNzVLQTZvbExUUkREandSYkE5Sjk2WDdtbDNtY0lqOHpsQm9GazRD?=
 =?utf-8?B?Y3B5OXhybkVvODlGTkp1M1Q3dlh1T2psYjh6TjU3VHJicXFxVEwwbnVhYnRw?=
 =?utf-8?B?NWNFWVFtMDBzOG12bmNpRG9qMk5ZYkhPaEozNTZUN0ZvWkdISG5ObDhuYWFR?=
 =?utf-8?B?UWxVOXR4ZmF6UGpUQnN6RGxsQUJraUpBbkx1UVVKYVI4b3lLMVN3MXpHd0Qx?=
 =?utf-8?B?NCtVZ01NdGhzbnFMSkJzM3dCbTB1MEFDZnpCUmVnQk83SEVuam5NZUZ6LzI4?=
 =?utf-8?B?WE1mdzRoZ1gybW5JbEhoVGRQdXJaUTIrQlV2bjdvSXRtT2tCb0xNa0FxN1F6?=
 =?utf-8?B?akZSVU5HdGVTMER1VEEyVUJ1ckc1UzJTUmpDbGVxaldwdDNBRk9Sbm9Ra3Zy?=
 =?utf-8?B?bHZmZjJEYmNPcVlMYkt4NldPdHgva2hOa09YRWFhT1cyZ2Rlc2F0elhUaW1y?=
 =?utf-8?B?ZExEV1crWTBLWFFBblZDWTdNT1ZNUmdUL1dlckt2VkZUbC9UTXdnK1Qzb0ww?=
 =?utf-8?B?WkdMZ0x4NGIvUll1eW55MjdUdGVDR2UxK3N6dE8zdmp1R21kNCthZ0FaZVBw?=
 =?utf-8?B?RnI2bWkvem9idmwxZTdIZFVXcXVobkpuRVMwZzZtMGtFZC90ZzBVblVRZHZM?=
 =?utf-8?B?cjdMWkR5bE5WUHY0elNSclNKSVFEUkNFaTlhV2c5Y2JVRWdaaWpwdm5DSWU0?=
 =?utf-8?B?NVprcTFjUkQ2ZVZFSVJ2N01oUllzT3gyejNNNnhjRWlhNWtZVHJ2RjhyZXJC?=
 =?utf-8?B?Umh2cjdJWjl4UlRVd09meTlZS3ZOQWllS3dyQ2ttWmNhdUtOL21RUTNCUXFj?=
 =?utf-8?B?S25La2dUSER3RSsrUXJGZHZEWlYrejRNTGJhRk5UZ0pZRFUxYU8reHJ3VHQy?=
 =?utf-8?B?ZkdIZmd3WGtBWDBuQWFiNExXWGtGOHhGVE4rYlFXalQzc3pocGN4VTYwR3k3?=
 =?utf-8?B?eVhzT1diTEN4NDVqMzhCdEFjWmtaU2tzaE1NZ0FyMXlTeXRMam5xcSsvMmVW?=
 =?utf-8?B?a3c2eDBOMnY0dHpCNGdMOHdvUVpvNllMWHJEMzh4VkMyQ2pxSXZuM2dja3pE?=
 =?utf-8?B?THFpT2JsSnVQbk81dlhlcGdaY0JwcmdzeTQ4eDlxSUt4RDliM0V2cHZHS01m?=
 =?utf-8?B?amZMVlJLekRWeEZsZjFlSmE5NDRqbmw4aUlBTUYyWkY3UjNTSXdaMTZvYlls?=
 =?utf-8?B?bGF1aCtHcXljdjlyaklFWktjbkFNTDNkRG9xMTdDQ2VQWWRMekRWWmNqWEdJ?=
 =?utf-8?B?cUp2SDBnNGVPU0hFNEpZY3JWOWR1YWQ0RFpYa0JRZ2UrVTh5bCtDODdmMGVF?=
 =?utf-8?B?YlovZklyam5vUFN1OSs5UnNFTUxHMUNpSG5UZTgwbWtBRklLN3F5Rk1DUGRw?=
 =?utf-8?B?R3NZcjB2Q2xwMWNacnZVV1BpZDdhN2MrMUlFY05nRnZFMmxnMyt4OGNxNGdZ?=
 =?utf-8?B?TENMMXloRnVJZ0d1ZkJqZGpCc293TnFnUkp6cVJ3WUd0TWNiWGFmUk1kNlRZ?=
 =?utf-8?B?VVJ2cm9xb0hYbkFkWU5pNW9yODdEbnRZL09TMzA1THdIY3pJcCtZOXN4K3Rk?=
 =?utf-8?B?VVF0d3dXdFUrZU1CdjduYlB2MFJYUmFPMXBwUElDZSszVmhyNkl6S2h1VGtC?=
 =?utf-8?B?KzlEbXFGWUxKMGhLa1ZxQktBbDlaRFJKeGlMZWNBMldzbmxQUEQyaWNkTzNI?=
 =?utf-8?B?bUxKUG5SNEtJZENwT2piTkU0ZmU5MHhLWXVrNlRBR29manEySkpOMlFwVTZm?=
 =?utf-8?B?N0JkdVdpVDU3SG5ZUUNYUWFiVjcrZ3lHNDIyQWlwbzJyVTkrSkZmSnllN1lt?=
 =?utf-8?B?MFBuYnVZcGMvSG1neXVhWlQxc01ENDJTbHRzeEtJUEZzRXlNd05YaDdrZTY2?=
 =?utf-8?B?TUFGMnBNbzZIeFY1OU14WTd2WnVNK1QwRDJkb3duVm04alBxczhNRlJvb0tG?=
 =?utf-8?B?YXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <902A2B3C8CD1274E9B14BE68D5851568@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d1d6bb-27f4-4868-2a72-08dba8e66c4c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:41.5885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fCxFSzy6qpGwpHZbYt5L588kVZ+15oWUc9UAs58UM1Xr1TqSVJnT88ETHOLK2keoLIJAtwQou4OzB7hHn7674fzI0Naee/jc7e9sRlGT/d8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: l7S2BoXKZoQ1lr1tKx84gsci3KbLh4-Y
X-Proofpoint-GUID: l7S2BoXKZoQ1lr1tKx84gsci3KbLh4-Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=793
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

SGVsbG8gYWxsLA0KDQpUaGlzIGlzIG5leHQgdmVyc2lvbiBvZiB2UENJIHJld29yay4gQWltIG9m
IHRoaXMgc2VyaWVzIGlzIHRvIHByZXBhcmUNCmdyb3VuZCBmb3IgaW50cm9kdWNpbmcgUENJIHN1
cHBvcnQgb24gQVJNIHBsYXRmb3JtLg0KDQpUaGlzIHZlc2lvbiBpbmNsdWRlcyBhZGRyZXNzZWQg
Y29tbWVudGVzIGZyb20gYSBwcmV2aW91cyBvbmUuIEFsc28gaXQNCmludHJvZHVjZXMgYSBjb3Vw
bGUgcGF0Y2hlcyBmcm9tIFN0ZXdhcnQuIFRoaXMgcGF0Y2hlcyBhcmUgcmVsYXRlZCB0bw0KdlBD
SSB1c2Ugb24gQVJNLiBQYXRjaCAidnBjaS9oZWFkZXI6IHJld29yayBleGl0IHBhdGggaW4gaW5p
dF9iYXJzIg0Kd2FzIGZhY3RvcmVkLW91dCBmcm9tICJ2cGNpL2hlYWRlcjogaGFuZGxlIHAybSBy
YW5nZSBzZXRzIHBlciBCQVIiLg0KDQpDaGFuZ2VzIGZyb20gcHJldmlvdXMgdmVyc2lvbnMgYXJl
IGRlc2NyaWJlZCBpbiBlYWNoIHNlcGFyYXRlIHBhdGNoLg0KDQpPbGVrc2FuZHIgQW5kcnVzaGNo
ZW5rbyAoMTIpOg0KICB2cGNpOiB1c2UgcGVyLWRvbWFpbiBQQ0kgbG9jayB0byBwcm90ZWN0IHZw
Y2kgc3RydWN0dXJlDQogIHZwY2k6IHJlc3RyaWN0IHVuaGFuZGxlZCByZWFkL3dyaXRlIG9wZXJh
dGlvbnMgZm9yIGd1ZXN0cw0KICB2cGNpOiBhZGQgaG9va3MgZm9yIFBDSSBkZXZpY2UgYXNzaWdu
L2RlLWFzc2lnbg0KICB2cGNpL2hlYWRlcjogaW1wbGVtZW50IGd1ZXN0IEJBUiByZWdpc3RlciBo
YW5kbGVycw0KICByYW5nZXNldDogYWRkIFJBTkdFU0VURl9ub19wcmludCBmbGFnDQogIHZwY2kv
aGVhZGVyOiBoYW5kbGUgcDJtIHJhbmdlIHNldHMgcGVyIEJBUg0KICB2cGNpL2hlYWRlcjogcHJv
Z3JhbSBwMm0gd2l0aCBndWVzdCBCQVIgdmlldw0KICB2cGNpL2hlYWRlcjogZW11bGF0ZSBQQ0lf
Q09NTUFORCByZWdpc3RlciBmb3IgZ3Vlc3RzDQogIHZwY2kvaGVhZGVyOiByZXNldCB0aGUgY29t
bWFuZCByZWdpc3RlciB3aGVuIGFkZGluZyBkZXZpY2VzDQogIHZwY2k6IGFkZCBpbml0aWFsIHN1
cHBvcnQgZm9yIHZpcnR1YWwgUENJIGJ1cyB0b3BvbG9neQ0KICB4ZW4vYXJtOiB0cmFuc2xhdGUg
dmlydHVhbCBQQ0kgYnVzIHRvcG9sb2d5IGZvciBndWVzdHMNCiAgeGVuL2FybTogYWNjb3VudCBJ
TyBoYW5kbGVycyBmb3IgZW11bGF0ZWQgUENJIE1TSS1YDQoNClN0ZXdhcnQgSGlsZGVicmFuZCAo
Mik6DQogIHhlbi9hcm06IHZwY2k6IGNoZWNrIGd1ZXN0IHJhbmdlDQogIHhlbi9hcm06IHZwY2k6
IHBlcm1pdCBhY2Nlc3MgdG8gZ3Vlc3QgdnBjaSBzcGFjZQ0KDQpWb2xvZHlteXIgQmFiY2h1ayAo
Mik6DQogIHBjaTogaW50cm9kdWNlIHBlci1kb21haW4gUENJIHJ3bG9jaw0KICB2cGNpL2hlYWRl
cjogcmV3b3JrIGV4aXQgcGF0aCBpbiBpbml0X2JhcnMNCg0KIHhlbi9hcmNoL2FybS92cGNpLmMg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgNzEgKystDQogeGVuL2FyY2gveDg2L2h2bS92bXNp
LmMgICAgICAgICAgICAgICAgICAgICB8ICAyNCArLQ0KIHhlbi9hcmNoL3g4Ni9odm0vdm14L3Zt
eC5jICAgICAgICAgICAgICAgICAgfCAgIDIgLQ0KIHhlbi9hcmNoL3g4Ni9pcnEuYyAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMTUgKy0NCiB4ZW4vYXJjaC94ODYvbXNpLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICA4ICstDQogeGVuL2NvbW1vbi9kb21haW4uYyAgICAgICAgICAg
ICAgICAgICAgICAgICB8ICAgNSArLQ0KIHhlbi9jb21tb24vcmFuZ2VzZXQuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDUgKy0NCiB4ZW4vZHJpdmVycy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA0ICsNCiB4ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9hbWQvcGNpX2FtZF9p
b21tdS5jIHwgICA5ICstDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvcGNpLmMgICAgICAgICAg
ICAgICB8IDEwMyArKystDQogeGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMgICAg
ICAgICB8ICAgOSArLQ0KIHhlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgICAgICAgICAgICAgICAg
ICAgfCA0OTcgKysrKysrKysrKysrKysrKy0tLS0NCiB4ZW4vZHJpdmVycy92cGNpL21zaS5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDMyICstDQogeGVuL2RyaXZlcnMvdnBjaS9tc2l4LmMgICAg
ICAgICAgICAgICAgICAgICB8ICA1NiArKy0NCiB4ZW4vZHJpdmVycy92cGNpL3ZwY2kuYyAgICAg
ICAgICAgICAgICAgICAgIHwgMTU4ICsrKysrKy0NCiB4ZW4vaW5jbHVkZS94ZW4vcmFuZ2VzZXQu
aCAgICAgICAgICAgICAgICAgIHwgICA1ICstDQogeGVuL2luY2x1ZGUveGVuL3NjaGVkLmggICAg
ICAgICAgICAgICAgICAgICB8ICAgOSArDQogeGVuL2luY2x1ZGUveGVuL3ZwY2kuaCAgICAgICAg
ICAgICAgICAgICAgICB8ICAzOSArLQ0KIDE4IGZpbGVzIGNoYW5nZWQsIDg2OCBpbnNlcnRpb25z
KCspLCAxODMgZGVsZXRpb25zKC0pDQoNCi0tIA0KMi40MS4wDQo=

