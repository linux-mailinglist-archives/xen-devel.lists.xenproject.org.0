Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468878D04B
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 01:20:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592509.925245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb804-0006tz-LS; Tue, 29 Aug 2023 23:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592509.925245; Tue, 29 Aug 2023 23:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qb804-0006nB-G3; Tue, 29 Aug 2023 23:19:56 +0000
Received: by outflank-mailman (input) for mailman id 592509;
 Tue, 29 Aug 2023 23:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y18t=EO=epam.com=prvs=36058b40d2=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qb803-0006kQ-EA
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 23:19:55 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e3a94bf-46c2-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 01:19:52 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37TFMk9i021983; Tue, 29 Aug 2023 23:19:50 GMT
Received: from eur05-db8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2108.outbound.protection.outlook.com [104.47.17.108])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3ssdvpbm4f-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Aug 2023 23:19:50 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AM7PR03MB6371.eurprd03.prod.outlook.com (2603:10a6:20b:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 23:19:44 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::9d42:8444:f00d:7895%4]) with mapi id 15.20.6699.034; Tue, 29 Aug 2023
 23:19:44 +0000
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
X-Inumbo-ID: 8e3a94bf-46c2-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B4d+f4pv70rXV2sw928uvv07hADPv1MUOhzWAB1MNwYbqKoyCLC3iIn+IQ3gFjEV8S8aSMV2UjgD0M5pgUq07Wkom8VK3iNM+p4gkiKGvLqI7CaM8CQ87O2+V1y7P5HSczFLNUTxKj3UxuKBCbJIz9B/Be+YETf/2v1djj988jn0IRyr8/eT1GohhFuDHQtHGkpgO8RyD1yWl+SXRnKuabWoeu/86xvWxL2c5eYat17+7Y8A6Iha5au+GEYa5heljSXgAjU3gt9sR/zovieOMeiv25eBWECF41Lf9QCxSYTxuulfXc2KCTHZQ7duInlbyDSweXR2PLKiBxQFlfpfRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2ERcj6JUMizs9Szx0x2ffT7vSpYcqMvosqrwubMiSw=;
 b=I3CG+YRWH+GFCXOjVWR5Vg72nYWBzGZMC8NaNMBzwB6RHcFaRmK3gyhpezHNnZ2C8uN4+o1Dat51/SOZnO4I1ymKnhECg2x8CNmM/aY9Ogjhh1XHB3RFO5T4zduAPatn2Rt+rrritzw0I+qm/SlqzrfHif4/BcBmWu//gmKgcPf2//IPxu5y1y7Pbc0elHynSJS4hPV62ELtmamzG4Da+1xq8PzdYRD3hbcim6lR0GpWs251H02EVvwRIe6qo1zyk5cIi7MGe0bRgIjqXkwhq1iZa5BbS1aaV7bSsUcpxjY9bwRtiw8gyAFf0TQRk91dydmQQt3+rYBSpTjZYW971w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2ERcj6JUMizs9Szx0x2ffT7vSpYcqMvosqrwubMiSw=;
 b=GnDZx+c94Y9G2T4CTrSVpsuEGF1HqqXFMbBF/J3NSvSdZmAAKR7WrHIlb7zAWyccCFaMtGSMbmaAjI81I+bH0FHstNaftvLt+C3MhlhKI0OHDX+jJPoOnp3nd4PQgV0Cbs7Uk0buOgMgIvD+VeM4xhZyDfshhzyD9VtuiTj9VGfGndWVeUWamc9WlPUcl0jyObgkxR/khD7MM0rv6BzDfSHwqmVdGvdkvFN+6QRIbw1ggfzZPPdg64oOdFT90/WwrTJ8KpIXU3egldsWMcDvFj2mOZCR6cBFN00ae3dq9cfzRGzzFQHC/Wd3hcsvEFmJSfCAz7ShS72RZkDmruLZXg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v9 05/16] vpci/header: rework exit path in init_bars
Thread-Topic: [PATCH v9 05/16] vpci/header: rework exit path in init_bars
Thread-Index: AQHZ2s9KQBAEWRsQM0+8e3gDHK2mZA==
Date: Tue, 29 Aug 2023 23:19:43 +0000
Message-ID: <20230829231912.4091958-6-volodymyr_babchuk@epam.com>
References: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230829231912.4091958-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.41.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AM7PR03MB6371:EE_
x-ms-office365-filtering-correlation-id: 342a1b83-df3f-48ba-e858-08dba8e66df6
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Fdb6/HI8nrT3tUV5/f0SskdHhznmf7e6jDU+2B89BajbLy2lE+lOaSBOmdJnJh6RUrp5qorP+o1adyUOPrPuST1wpAW9TzoU2Rp43pMJ9tzy/54X1GcVirDYbCVT3Vx3XZDboB7IJeqr1597tR8icC/sZTOlyaZSHWozuC3VTe+0H5ZdC+gkChBcRfCxC3WuLMgxN+nWM76yuYk5EBHXNdbHTKbT7rDTzxgJHb2TJlrVqQ0xCuhxjw6egfq0PCI44wPn0LCCeNofl4Nk2kOZcfh6st4NfiO8HI620EiVpUYtGYVg6CLFLnN1T3EHUSverJzhegRqErrFBZ7FaCgG6M+Ua1KhNWBY0BcNJHQDuMPrmm1Enb8+81rsWob4EO3wh8ZY8KSGfP2kuwgbE5LoJFvv7ArxPAECie4nOV/S01j7e837avsrFDguw8/xMu//MFSwCLQnHZbf6A+Z4w51GFWqHNTuKWA7OnnUUnKVqzmuJxbftWbjjCaXYekucCRD7gWbLe1jI2mE/h9V+jhPUXRHxyXVJB9YPUilAmtVAJBcKjrK6f1YbRzPJRb7ABU+0J5lXSwUYMzEkmYQUA9hxxD6it0GBUzFnx+7CQpaEDn2F2jueqcB7pCOshJozPtk
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(376002)(396003)(136003)(366004)(451199024)(1800799009)(186009)(71200400001)(6512007)(6506007)(6486002)(478600001)(55236004)(76116006)(1076003)(2616005)(26005)(2906002)(6916009)(64756008)(66446008)(54906003)(316002)(5660300002)(66476007)(66556008)(91956017)(66946007)(41300700001)(83380400001)(8936002)(4326008)(8676002)(36756003)(38070700005)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZmdQOU5LeVJTQTlsOElCTExzZ3BuZkZKYVQ1L3VzdHRDUU1sUFhSS1UzM0tM?=
 =?utf-8?B?cXZ2UXlJSHV6ZkRHdVlKajNSL1V1Rjl2YnRISHVTM29QbmQ4WHplTFpzcWRv?=
 =?utf-8?B?V0NzMzV1RjZkN1k3VGhWMVREMXphNzBpaFNtNkVRUHdXYmZ5alJaeGE1MWZw?=
 =?utf-8?B?QUR1Vmk2dEk5ZW9Tc1hnTWVkR1VSWlNBbXZYQ1R1SjQ5WmQ0aThlczNzdTNa?=
 =?utf-8?B?VGROWjlEYW55eG1tZUtmRXMrZldtaEpQMlBYSjNsREZPODc4cW9Fd25LaTRE?=
 =?utf-8?B?bGlFck9tbXJQNTJmNTVQTW9TS2s1eXhLVnFvTE9SZW5BR2Y3UkU3UGtpN21m?=
 =?utf-8?B?SlJtMXYwenEwRmR2eTFDVXdaQ1dGdFdGc2ptSHVhZm4rbFZHQkNEVHFtUk14?=
 =?utf-8?B?QUJEelJBN2NQT1h3UWZxbFdqUEdYa29MQk5qam40UDk2M1dmSDgycGxEUTVl?=
 =?utf-8?B?Q1V5ZE5HWHVEUHRveDAzQzJKazZSVFF5SVBRYmRrcXlIUzhZYzJ3aERWRUZ2?=
 =?utf-8?B?NndaNlVqa3F3dGxqY014RFJHQUxPSHFDNzYraEpZbDhqWkNJQUNxYXA2UmJt?=
 =?utf-8?B?d29oN293czlzbW9rUXVHcCtsbnpFRE1FUC9vMEJYT2RHZUhlbngyOWFSa0E2?=
 =?utf-8?B?K3FrbFUra2xLcHJuamhtNjFlZTMwanhKcHZjSHk4V0JKWnJaRlhTdHpNeWk2?=
 =?utf-8?B?YmhYWjBmcFpHbUpkdGtqKzVrVXpRdG9naFhneDhQY2ZkdmtvYmZKd2I4MmxI?=
 =?utf-8?B?QWdPL0J1VFEwY0l0UnJUdWk3Wm0wemhkSjduLzBwMXY3dG54anE3V204YWov?=
 =?utf-8?B?dDNCRi9qbGFUMm9mZjZvMGZKV0J0WEdZbU82S2xYQ0J3dG5JbUFHYzB5L2Vv?=
 =?utf-8?B?eWVpNHRPN1hWd2haWnFBRlVvczlqcjBSUEt5Vmd4QStReGhxMTg1VlZKRFhO?=
 =?utf-8?B?V0ZYQll4YUhMYVB0SW81ZGhFbFMxamw0dm1YUndNTDhYekIzT1lHakh3NGVK?=
 =?utf-8?B?MktVNG1pUW5DK3VtTW93dHl1VkE2elFWeFZEeC9Xb3lvN1RkaE1PNis1ZDZt?=
 =?utf-8?B?T1U2QVg1eEdzZjF6Sm5vU3RiWWU4V3Q2SzZjTlVyS1pwRTV4YVVBUkI2Q1dh?=
 =?utf-8?B?MGpxWmhXVGhLTzUxZlhsV2tCSlZsakJtZWNlbjMxYjljQVk1NkJ5Y2k3cjl4?=
 =?utf-8?B?U3B5SnZvRyt4L0UzWlR1YnpNUGpxVG5RZTgxeDR1bGRWTWc3b29VczFGRERJ?=
 =?utf-8?B?VTZVWnlJT3BPVzhVYU9oamZOcjFzKzR3cW1GWDRpNjhMNU5zdTNobjg3aTRG?=
 =?utf-8?B?NkFBTDlTcENEWmlDeDFiYTZ2VjdBeWE5SXliZmRTdVFnU0pkbm9PazM0THd2?=
 =?utf-8?B?ZU9uZlQvTHNtRmVYZWhxbkx2b1Fad3dYRjJCZVdzS0JXWDM3aWhRbVdMM2h0?=
 =?utf-8?B?cXF5QnRvbUU2cG1kMTZXNDFzbVVGN1BWUmNsRWRnZ3Ayb1dBTDY5WlZyM3k3?=
 =?utf-8?B?ZjlKQXd2dDRZUnowRVhVcUpFNnRyZVh0MkR0NllNWUthTGZ0b2l1Vk40QTBk?=
 =?utf-8?B?NkZYZ2ZydFhTb2oyVE01THU2bEFQWFlJdFhxWlgyYUlBb1RsZkw0YzVCWVFQ?=
 =?utf-8?B?UXE3YmNsL2ZMS1FwVzlyK1FlK3ptMDU2YUZFVTU4SEMydHZvQ2cxa3BZTEtI?=
 =?utf-8?B?V0dQZHBnWTgwRy94eEJwWmx2cnZjVEp6akk3SktLamF0VE9McDJpL3pQQmhY?=
 =?utf-8?B?UmFrZ0xjZkwvVEhBZkJWcUdsdkNObG13NU84Y0J2ME5zL0FTNDRsZ2U5aUxh?=
 =?utf-8?B?LzVWS0xmb2dTK2ExQ0Rod1ViSHNWd3lmWWdONUJXb0w3UTlHQ2pxYjFSK2tj?=
 =?utf-8?B?ajJRVW1keTFlMkxjeUVRTSt6dk1EWVdWTFpVN2NWYmdFemxJcUczSGthYWYx?=
 =?utf-8?B?aEJyK0JYc2h6bnFKdm5Cd3Jyam9xTm40aUJndHVZcXJrZFU1NnhZVXpEdVVl?=
 =?utf-8?B?L0pSWE9vNVBhWmlUT1VXdGM0ZmVWM05IQk9QTmszQnNFYTBkQ1pxaExRR2Rq?=
 =?utf-8?B?MXdVS3B0OWs4ZmFxSXZaTHh5RlZkRnIvS1Q4dDN4RnZ5MFRzeXRRVVBiQmFi?=
 =?utf-8?B?ZE1FOUtpenFMUkJnZDA1RTEwZEZuNGVWcXArSHFMaEI2empsN1RFRmVRVHBH?=
 =?utf-8?B?Ymc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <482FCAA8E5EBBC409D3C030B985467DC@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 342a1b83-df3f-48ba-e858-08dba8e66df6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 23:19:43.4011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g5LzW0cjsghHCCxmKErmsNXkcP8/ruZmWQPdPdYXJzaeM9hbTJXs0+VLNzvIIeTTmqMOTybsnKdp7r6zVc474E4iJLcLiygE51ZioFHnon8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6371
X-Proofpoint-ORIG-GUID: cFxyDfDyErvBYbpIwdkUT0NTCeuXyww6
X-Proofpoint-GUID: cFxyDfDyErvBYbpIwdkUT0NTCeuXyww6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_16,2023-08-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=943
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308290202

SW50cm9kdWNlICJmYWlsIiBsYWJlbCBpbiBpbml0X2JhcnMoKSBmdW5jdGlvbiB0byBoYXZlIHRo
ZSBjZW50cmFsaXplZA0KZXJyb3IgcmV0dXJuIHBhdGguIFRoaXMgaXMgdGhlIHByZS1yZXF1aXJl
bWVudCBmb3IgdGhlIGZ1dHVyZSBjaGFuZ2VzDQppbiB0aGlzIGZ1bmN0aW9uLg0KDQpUaGlzIHBh
dGNoIGRvZXMgbm90IGludHJvZHVjZSBmdW5jdGlvbmFsIGNoYW5nZXMuDQoNClNpZ25lZC1vZmYt
Ynk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NClN1Z2dl
c3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLQ0KU2lu
Y2Ugdjk6DQotIE5ldyBpbiB2OQ0KLS0tDQogeGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYyB8IDIw
ICsrKysrKystLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5j
IGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KaW5kZXggM2I3OTdkZjgyZi4uZTU4YmJkZjY4
ZCAxMDA2NDQNCi0tLSBhL3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMNCisrKyBiL3hlbi9kcml2
ZXJzL3ZwY2kvaGVhZGVyLmMNCkBAIC01ODEsMTEgKzU4MSw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hl
Y2sgaW5pdF9iYXJzKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQ0KICAgICAgICAgICAgIHJjID0gdnBj
aV9hZGRfcmVnaXN0ZXIocGRldi0+dnBjaSwgdnBjaV9od19yZWFkMzIsIGJhcl93cml0ZSwgcmVn
LA0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNCwgJmJhcnNbaV0pOw0KICAg
ICAgICAgICAgIGlmICggcmMgKQ0KLSAgICAgICAgICAgIHsNCi0gICAgICAgICAgICAgICAgcGNp
X2NvbmZfd3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21kKTsNCi0gICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KLSAgICAgICAgICAgIH0NCi0NCisgICAgICAgICAgICAgICAgZ290
byBmYWlsOw0KICAgICAgICAgICAgIGNvbnRpbnVlOw0KICAgICAgICAgfQ0KIA0KQEAgLTYwNCwx
MCArNjAwLDcgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYg
KnBkZXYpDQogICAgICAgICByYyA9IHBjaV9zaXplX21lbV9iYXIocGRldi0+c2JkZiwgcmVnLCAm
YWRkciwgJnNpemUsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKGkgPT0gbnVtX2Jh
cnMgLSAxKSA/IFBDSV9CQVJfTEFTVCA6IDApOw0KICAgICAgICAgaWYgKCByYyA8IDAgKQ0KLSAg
ICAgICAgew0KLSAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NP
TU1BTkQsIGNtZCk7DQotICAgICAgICAgICAgcmV0dXJuIHJjOw0KLSAgICAgICAgfQ0KKyAgICAg
ICAgICAgIGdvdG8gZmFpbDsNCiANCiAgICAgICAgIGlmICggc2l6ZSA9PSAwICkNCiAgICAgICAg
IHsNCkBAIC02MjIsMTAgKzYxNSw3IEBAIHN0YXRpYyBpbnQgY2ZfY2hlY2sgaW5pdF9iYXJzKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2
LT52cGNpLCB2cGNpX2h3X3JlYWQzMiwgYmFyX3dyaXRlLCByZWcsIDQsDQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICZiYXJzW2ldKTsNCiAgICAgICAgIGlmICggcmMgKQ0KLSAgICAg
ICAgew0KLSAgICAgICAgICAgIHBjaV9jb25mX3dyaXRlMTYocGRldi0+c2JkZiwgUENJX0NPTU1B
TkQsIGNtZCk7DQotICAgICAgICAgICAgcmV0dXJuIHJjOw0KLSAgICAgICAgfQ0KKyAgICAgICAg
ICAgIGdvdG8gZmFpbDsNCiAgICAgfQ0KIA0KICAgICAvKiBDaGVjayBleHBhbnNpb24gUk9NLiAq
Lw0KQEAgLTY0Nyw2ICs2MzcsMTAgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X2JhcnMoc3Ry
dWN0IHBjaV9kZXYgKnBkZXYpDQogICAgIH0NCiANCiAgICAgcmV0dXJuIChjbWQgJiBQQ0lfQ09N
TUFORF9NRU1PUlkpID8gbW9kaWZ5X2JhcnMocGRldiwgY21kLCBmYWxzZSkgOiAwOw0KKw0KKyBm
YWlsOg0KKyAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9DT01NQU5ELCBjbWQp
Ow0KKyAgICByZXR1cm4gcmM7DQogfQ0KIFJFR0lTVEVSX1ZQQ0lfSU5JVChpbml0X2JhcnMsIFZQ
Q0lfUFJJT1JJVFlfTUlERExFKTsNCiANCi0tIA0KMi40MS4wDQo=

