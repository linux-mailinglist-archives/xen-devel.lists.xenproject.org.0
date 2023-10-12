Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A3E7C794E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 00:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616064.957775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-00019T-5D; Thu, 12 Oct 2023 22:09:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616064.957775; Thu, 12 Oct 2023 22:09:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qr3s2-00017L-23; Thu, 12 Oct 2023 22:09:30 +0000
Received: by outflank-mailman (input) for mailman id 616064;
 Thu, 12 Oct 2023 22:09:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hhgq=F2=epam.com=prvs=4649fa389a=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qr3s0-00016v-B4
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 22:09:28 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f71115-694c-11ee-98d4-6d05b1d4d9a1;
 Fri, 13 Oct 2023 00:09:26 +0200 (CEST)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39CKqml9008371; Thu, 12 Oct 2023 22:09:23 GMT
Received: from eur01-db5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3tpr7cr8dp-7
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Oct 2023 22:09:23 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by DBAPR03MB6376.eurprd03.prod.outlook.com (2603:10a6:10:193::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 22:09:17 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::f606:63f7:5875:6076%4]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 22:09:17 +0000
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
X-Inumbo-ID: 00f71115-694c-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h63PPNZt3JfrvOJ4ZdEAarqk8/nnxRj5O2mdCGhqm5fqHBavlVR/wmtDTUMLKcH/LHJtk1u3ok2LZXo3daIt8H83FULAEec96x/1X56riIRTBQdMazCjDT+lg2UFXyksgYFngsJkDJ77XzxUHRlOsBFv/RNfwuo4Ti53Z93g3QR0w+E7fNwY49GcQXzcb4RuHH4O36KohAZZG4KygfO7WdLLVELCVC4hTb5IzSw9D5tK4CchBCC2wLIUmxlGxP2PztHM8hlq93HV8i0Q2fHofuad2eQZ6B+lN0L+9N4+nUAbC8EpQn8cmQP7GgkWeUIbfbAjcVTmtoesco6yBjHNrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zMLvoJ8oLwDDcIwwFQCmO1G6TxLtjEG3z/3WmRJCPC8=;
 b=cj6d/YyEeNdAMACZm8lGafBreEklzgsBPYRNlhhdENjWWgpx4wj53dSSWYNk3efWF6sIiAjZPKZE8dDFbSULrzrHssSSm1oUydkEmRV2+eO4rvrO5QRRAwaZ1Uq8TlQPRm/itiYsZyUhj3r/f0MssnQz0dC9dBNiAR0fFYXnAZ5aPx5JsmdoQoBEtZt4C8r8xcbP7b9otzt9uU2kq95qmprcY3imipkKtJxyhkRmypEstuHD96NdijnTcIUS4EKvuwYIQ7Rmzc5zUbGaf3I6gOdbThuVSnngm1lw4iv7F8qgylAMC7NcsS5aoWez6jY2DRXHf4Gj4oUqiu54fLxdvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zMLvoJ8oLwDDcIwwFQCmO1G6TxLtjEG3z/3WmRJCPC8=;
 b=CtKDOFS4Qamh5MA6OTmYZ/iVQupGqJ4Ayfycsf0H1NlwIKLLDRqGi2OCvx4B9OtXlSTjWAJTGsTutnIBZN/cuK0jhXWw0qm0+0BnZV/aQxNKMr07Q9F9Nd8s3b13ahCpJz3pwE/Gdi7TAskzzrpAOsqFHV2nDc2SOjh8skExjsL9F1+rB970ZmkhtufvgrGItnnE88viMh5eJXAiX3o7jRrAgtfD2ALF8tUhRtubajMPazjc2RXWPgopdvBg4mYfadZjvsJHX2r6B6hwuo9zU/S1cg9geyRNHX5ECRXHcKLlv5ltSThchBW6/GwvQl7WX0U5gDCUl9Je2hVNw5+rPg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>
Subject: [PATCH v10 06/17] vpci/header: rework exit path in init_bars
Thread-Topic: [PATCH v10 06/17] vpci/header: rework exit path in init_bars
Thread-Index: AQHZ/Vi9WQzEUKFClEWKXSReXuWjGg==
Date: Thu, 12 Oct 2023 22:09:16 +0000
Message-ID: <20231012220854.2736994-7-volodymyr_babchuk@epam.com>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|DBAPR03MB6376:EE_
x-ms-office365-filtering-correlation-id: 7c11578c-7fcc-47a4-4889-08dbcb6fe075
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 M/D5Wx0CEZKab6dvl8nUSy9VRijS0vZ3VQwpXXpaXVwKMLRfwfzhrjzdyjTtzq3VqNjR1S0fxJWfzzG9Gt6G6d06Vqes/QR9IMjJxPt1oBvpqrViEJojt1lpEcVKFr/tm1d4MwR7kt2+NyH01Et3U9vN2BmmwLif7fo/LNXkGbexK57r1W66Xx84ftGlruFWWPBe+5MfkcK9DKqXLpFhyRQiHvtjnLMY+Ha2M2K5lJTsBA3ugvHD2ja6pjL5vKdViDEmhdUxZaA8zpArHMPNEviFK67q1eJ24p8Si67ztsqzKRPGCCH6SigfdnoNw5b73yDQcQiieskBrvc22XadTRgy+Dm09HSgJnX/fMin3GoQVRb/TKa5WqZrtf1UtPnyF8O177WeLcqdVqcPqrePvLqPuWaHpfkxMoE9TyllPr97Z+l/2EYZXNgHjNZyCJalHupAjSZF9hOHJMZr8jWRAeRxvulnx9L4bx0/tVfcnqnXZDutd6tWLT3CMIaSkMwK8n/86P4BSDBre+56jKA1gsPBoTYx5z9AnS78yhF4/hMLT7U/TvWqHWHy9u0UWDA903HKhSKy46/vOPKcidd67GLPuZo3XsxBHHh8ML1rlBoVmrpZumhRIFEzeLRR0R95
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(396003)(346002)(366004)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(2616005)(71200400001)(26005)(6512007)(6506007)(55236004)(36756003)(86362001)(38100700002)(38070700005)(122000001)(1076003)(83380400001)(91956017)(41300700001)(64756008)(316002)(76116006)(54906003)(66946007)(66446008)(6916009)(66556008)(66476007)(2906002)(8936002)(5660300002)(8676002)(4326008)(6486002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y3puZ1FTREN2TFFPdkpQRjJ0dURXZm9PUW8wcy82bW9MR1dvTFBBa3VNeEtX?=
 =?utf-8?B?TEhBSzJOam9rbXp4eW52ODZCNmpiQUtBVmZUSjR5QnJpYUhpZzRFRVEzRTdi?=
 =?utf-8?B?cjZZVnZYRlpNNVo3MVpIeDl4L0I5YlpFTlROR2VCdFk5YlFEN3dhTCtLY1Nw?=
 =?utf-8?B?Skp1TXVZQ0k0K1FEbjVaalZKR0c1MTVqVm9vUzZPei9rRG8wT3JuM1hzdWxj?=
 =?utf-8?B?anJsR0NwZzlMTnVSMW5jaGk5dDZLNkk4OHJtWHlnVmQwT1paNWQ1bXYxTkRM?=
 =?utf-8?B?TmFtdTFINlVmYzRsWDBBK2lRZGhuY1N3Z0ttWGd2OVlYL0RiVHVXbmNOTGNB?=
 =?utf-8?B?blBqa3pWb1RWR3RTTmlaYlB1RVFoMExhUXV3VExQNEdQYkkxRDJTZG95STdM?=
 =?utf-8?B?YnlBcTM5S1gxdHRpR2pOcFpRRHR0eks1cktHMFJpYzJ2YzM1VytEY3N5THky?=
 =?utf-8?B?bTl2Rng4bHRFdUd1R0JON1QzaWt6MVhoajJDOWo1UDVtNFZXYmI1d2txQkRu?=
 =?utf-8?B?RmMxeVFsZGxtS0NIRGhUK2JUbTIxNHRROVp6RGkxeXh5QUp1bEM5Um8xbkN2?=
 =?utf-8?B?MkdJQUtDYjFxaDVreUcwSy9yVlgvTFNJQ0VHaXUrQXQ1RmdFT05PVjVLTXBY?=
 =?utf-8?B?VGF4RnJNNHJCTFBuMS9CQUhqcy9yeEpaQjY4ZlZPWXRqKzUxMFJkRzFFODJS?=
 =?utf-8?B?M213eXhqZXl4UjFaZEZGeFR2L0E1dkFSQ0JGdWtqRzlQaWFkRFBvWE4yWlA4?=
 =?utf-8?B?NENNUHhONzRMcTlETkZhclk1NWF3SldEM2s4YVEzc09PMldHWmJhNXNjcXNG?=
 =?utf-8?B?MjFHalZ3VUxkUjlsL0lCT2YvYmhrcHpqRU5XVTdCWjFCR0FXbk9hbTUvZGY1?=
 =?utf-8?B?cG13Q2xCSHpuU1hISE9yZVpkbVJEb1lweVVKck90dUtEcmhaaE1MR1ZvM2dm?=
 =?utf-8?B?ZTBjZW9vbHZNbWlXMEEvUVEwRkw4eGV1UHV6MEh4NzNPSEZWR3ZTNjZRcXl6?=
 =?utf-8?B?K1VOZ01SNGhyNTYxQ1dzQUN0TC9lOVlwa2xncDljc01UZWNqSm9LZGtZU2ZW?=
 =?utf-8?B?VE9SS2NpUTc4dlVXRUp2RkFaNHBPR3h2T2ZrR3lvdVFLc0s0ZGR2RDBCZmY2?=
 =?utf-8?B?R1ZEOUFWcFU0VUVYZExadHZZeDhyd3I1UHJpYXloekk2OUU5QXl2RDY5TytI?=
 =?utf-8?B?NVNjRjR4L2VZTUdUbHkxUzB5OFlMVnE3a2FSd2F5TFdiR2FYdm5JMnAzZXpm?=
 =?utf-8?B?L2huNEVmTnRJWmlGb01DdDdZN0p3cWRseXUycG9KUFlKTjJtK2NqNncwV0Ja?=
 =?utf-8?B?Q0tJc0UxU3h2N1hLQ295T083NW95ZjliS1I0blNQQW9kUUcydUFwcDRKdXlr?=
 =?utf-8?B?T0c4MjNqK2N6N0M3a2E2L1hMdDBJWEtqNmRsYXovUkZkb0srTVBlN3NuVDM1?=
 =?utf-8?B?VG1Wb0x6b2I1YjlWMzFZZWRPSStmcEdaTExjQjYvcVNab2RSeTV4L25SekhB?=
 =?utf-8?B?YXRhS085VEhsSkdHeWoyM3Q1amhKTVBGL1FrUlFDQjc2NFQzajFMVElsU256?=
 =?utf-8?B?WSt6OCtPOE9hMzhQWlNnTGhvQTZrOWlrMUVlZDVEWDk2VXl3dlhwM28yWnRT?=
 =?utf-8?B?SlBSb2dETTJOcFRLRStyNXRSRHNnUE9LdnJIa0RucXhaZ0RNUjRINEFxRWRI?=
 =?utf-8?B?RkFSOHV3NWNBejRwQkV5TWVrUG9wZDJvMXczVThpSmtCSVYxRWlnOHdYajZl?=
 =?utf-8?B?ZDJ3Z1dIY2lpWWlwYW84V09vQ21TWUFNdjVtUGl4VmtSdGdENG9NTDZPMlBO?=
 =?utf-8?B?RTc2dWg2V2taeHZKcXptVFVwalJSSFBkRU9wWmJNOVAyd0N0R2lUSTd5MzYx?=
 =?utf-8?B?cnEyWDdzQXRBeUZteE5HMk9TQjdCaGREMFhjRnY2REdkcTNOOEdSKytHNmhp?=
 =?utf-8?B?TkRzWC9jWnhPR2hBdWZkU0dWZC8raTc0a1hYYnhSRjNabGRFR1Y2Vm8zS09r?=
 =?utf-8?B?S2dBWE5hbUlnTEIrVkNDNFRxTzRwTkRWazZlckhVSGNneVVpZllOUGkzL1ZC?=
 =?utf-8?B?NkVCUVpJYTJ4WVoyK0FiU1g4UVdXd2tPaUlDUk5aZ1RBd2N1b2xwSHdrc2Zt?=
 =?utf-8?B?Z2E4UzM2ZDZtdS81UzNhRHBEa1hoY0htUmFBSTR3SkZONUttbXFmbm13VnFP?=
 =?utf-8?B?ZWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C02E46285954F4D8569410BCEA0378F@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c11578c-7fcc-47a4-4889-08dbcb6fe075
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2023 22:09:16.3254
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1pIvwGhVxGNY7O5U3lPKRBNrTuZ2o0XunhKF1Y2fdlCAPsOoapOtgSwEyRGVFtNkDJvUSjwu+rk4mH1LvBLTKK2jAqjSaUM0miXV9Fi9Ezg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6376
X-Proofpoint-GUID: s1xqamOyCo_cF0K__10qdjW3KjxVfRg-
X-Proofpoint-ORIG-GUID: s1xqamOyCo_cF0K__10qdjW3KjxVfRg-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_14,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120186

SW50cm9kdWNlICJmYWlsIiBsYWJlbCBpbiBpbml0X2JhcnMoKSBmdW5jdGlvbiB0byBoYXZlIHRo
ZSBjZW50cmFsaXplZA0KZXJyb3IgcmV0dXJuIHBhdGguIFRoaXMgaXMgdGhlIHByZS1yZXF1aXJl
bWVudCBmb3IgdGhlIGZ1dHVyZSBjaGFuZ2VzDQppbiB0aGlzIGZ1bmN0aW9uLg0KDQpUaGlzIHBh
dGNoIGRvZXMgbm90IGludHJvZHVjZSBmdW5jdGlvbmFsIGNoYW5nZXMuDQoNClNpZ25lZC1vZmYt
Ynk6IFZvbG9keW15ciBCYWJjaHVrIDx2b2xvZHlteXJfYmFiY2h1a0BlcGFtLmNvbT4NClN1Z2dl
c3RlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQpBY2tlZC1i
eTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQotLQ0KSW4gdjEwOg0K
LSBBZGRlZCBSb2dlcidzIEEtYiB0YWcuDQpJbiB2OToNCi0gTmV3IGluIHY5DQotLS0NCiB4ZW4v
ZHJpdmVycy92cGNpL2hlYWRlci5jIHwgMjAgKysrKysrKy0tLS0tLS0tLS0tLS0NCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBh
L3hlbi9kcml2ZXJzL3ZwY2kvaGVhZGVyLmMgYi94ZW4vZHJpdmVycy92cGNpL2hlYWRlci5jDQpp
bmRleCAxNzZmZTE2YjlmLi4zM2RiNTg1ODBjIDEwMDY0NA0KLS0tIGEveGVuL2RyaXZlcnMvdnBj
aS9oZWFkZXIuYw0KKysrIGIveGVuL2RyaXZlcnMvdnBjaS9oZWFkZXIuYw0KQEAgLTU4MSwxMSAr
NTgxLDcgQEAgc3RhdGljIGludCBjZl9jaGVjayBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBk
ZXYpDQogICAgICAgICAgICAgcmMgPSB2cGNpX2FkZF9yZWdpc3RlcihwZGV2LT52cGNpLCB2cGNp
X2h3X3JlYWQzMiwgYmFyX3dyaXRlLCByZWcsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICA0LCAmYmFyc1tpXSk7DQogICAgICAgICAgICAgaWYgKCByYyApDQotICAgICAgICAg
ICAgew0KLSAgICAgICAgICAgICAgICBwY2lfY29uZl93cml0ZTE2KHBkZXYtPnNiZGYsIFBDSV9D
T01NQU5ELCBjbWQpOw0KLSAgICAgICAgICAgICAgICByZXR1cm4gcmM7DQotICAgICAgICAgICAg
fQ0KLQ0KKyAgICAgICAgICAgICAgICBnb3RvIGZhaWw7DQogICAgICAgICAgICAgY29udGludWU7
DQogICAgICAgICB9DQogDQpAQCAtNjA0LDEwICs2MDAsNyBAQCBzdGF0aWMgaW50IGNmX2NoZWNr
IGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCiAgICAgICAgIHJjID0gcGNpX3NpemVf
bWVtX2JhcihwZGV2LT5zYmRmLCByZWcsICZhZGRyLCAmc2l6ZSwNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAoaSA9PSBudW1fYmFycyAtIDEpID8gUENJX0JBUl9MQVNUIDogMCk7DQog
ICAgICAgICBpZiAoIHJjIDwgMCApDQotICAgICAgICB7DQotICAgICAgICAgICAgcGNpX2NvbmZf
d3JpdGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21kKTsNCi0gICAgICAgICAgICByZXR1
cm4gcmM7DQotICAgICAgICB9DQorICAgICAgICAgICAgZ290byBmYWlsOw0KIA0KICAgICAgICAg
aWYgKCBzaXplID09IDAgKQ0KICAgICAgICAgew0KQEAgLTYyMiwxMCArNjE1LDcgQEAgc3RhdGlj
IGludCBjZl9jaGVjayBpbml0X2JhcnMoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQogICAgICAgICBy
YyA9IHZwY2lfYWRkX3JlZ2lzdGVyKHBkZXYtPnZwY2ksIHZwY2lfaHdfcmVhZDMyLCBiYXJfd3Jp
dGUsIHJlZywgNCwNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmJhcnNbaV0pOw0K
ICAgICAgICAgaWYgKCByYyApDQotICAgICAgICB7DQotICAgICAgICAgICAgcGNpX2NvbmZfd3Jp
dGUxNihwZGV2LT5zYmRmLCBQQ0lfQ09NTUFORCwgY21kKTsNCi0gICAgICAgICAgICByZXR1cm4g
cmM7DQotICAgICAgICB9DQorICAgICAgICAgICAgZ290byBmYWlsOw0KICAgICB9DQogDQogICAg
IC8qIENoZWNrIGV4cGFuc2lvbiBST00uICovDQpAQCAtNjQ3LDYgKzYzNywxMCBAQCBzdGF0aWMg
aW50IGNmX2NoZWNrIGluaXRfYmFycyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCiAgICAgfQ0KIA0K
ICAgICByZXR1cm4gKGNtZCAmIFBDSV9DT01NQU5EX01FTU9SWSkgPyBtb2RpZnlfYmFycyhwZGV2
LCBjbWQsIGZhbHNlKSA6IDA7DQorDQorIGZhaWw6DQorICAgIHBjaV9jb25mX3dyaXRlMTYocGRl
di0+c2JkZiwgUENJX0NPTU1BTkQsIGNtZCk7DQorICAgIHJldHVybiByYzsNCiB9DQogUkVHSVNU
RVJfVlBDSV9JTklUKGluaXRfYmFycywgVlBDSV9QUklPUklUWV9NSURETEUpOw0KIA0KLS0gDQoy
LjQyLjANCg==

