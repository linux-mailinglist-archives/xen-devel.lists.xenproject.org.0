Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2A36BA10D
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 21:57:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509842.786444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhw-0003vU-Ru; Tue, 14 Mar 2023 20:57:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509842.786444; Tue, 14 Mar 2023 20:57:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcBhw-0003tB-Or; Tue, 14 Mar 2023 20:57:20 +0000
Received: by outflank-mailman (input) for mailman id 509842;
 Tue, 14 Mar 2023 20:57:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ugWp=7G=epam.com=prvs=7437a4d9da=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1pcBhu-0001PG-Vn
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 20:57:19 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce07fcaa-c2aa-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 21:57:18 +0100 (CET)
Received: from pps.filterd (m0174680.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32EKchDk017378; Tue, 14 Mar 2023 20:56:33 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3pb0520156-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Mar 2023 20:56:32 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by PAXPR03MB7967.eurprd03.prod.outlook.com (2603:10a6:102:21a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 20:56:30 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::967e:573a:15a9:176e%4]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 20:56:29 +0000
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
X-Inumbo-ID: ce07fcaa-c2aa-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KC+QS4Tfda97B5JX5EyOp/DUgDilagBhIOp5xaWdvjEVRg7xemXl3oNNm4hmu0io7UjGL6hwYKF+WmND86C4g2H8d9TGBkpJx1bjHTgDFCC+zWckTpqKbuvIXoCOhplU3FSy0KXoxg6D1CDFiB3PkWtrKbXXn0t57GKKEddq2Yb1emTY1rDiaPjW6MhWRNnNEYA4+zBo4+uhx4ziqiMEdufRkZtWidjC5Yhdxsw9Dxf4H95mYcefEP1nuRlE1ObWbhyFE0nH/bQLdUl8XbdtEAi86tRIhvgT57hHXjKjSprKGNINIv4Ob16aARFiAfEtNqn5ErIUP9U2cbPtyRB4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCGo2K1yWc3whjLYAbvm4bc/nJTzqYRDNubeotfQN6s=;
 b=MI1rx/kclSuQB+UaRc5zLWXcXzjNvBEmoyXgEr0PeEC7g5hKHZbfiodoDHpieb+dSyVzZ6f6HdgNAuWyMyG4CT/sFXyxBKTF7Xr0lk0Fb2/s2EaZk9rOWUpwM1goBzcIbnsUIgK5p8ZmN5o5K4NYZMLENJwNhOI9Xga59polvluZIF+uVDMxG0XVjBEsczigp/BADEUV0l6vRDjd2nLmD9m0Ii2HES+a/alKXcgm4Uc8EoykOe6hIpUOf4Q2JvsG2iDED939DhbVNrJCln+rEWLuVCvR07DywzuZrkiEIfZAfSHnb8PSr6Iy3ETn5WIgYg9/1OytkZAICOT07af+YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCGo2K1yWc3whjLYAbvm4bc/nJTzqYRDNubeotfQN6s=;
 b=hWjPEDEQsz9ii/GhH+wpZq5pzG2701hsi6TzRswTwSGEzAfPNaOe/d+Jui108MjiX11pBEnFV8mda9iMzwPG+uDijjffQpeLFrwte3+98bBLIcowF9rs3mJg2Ue6mI7RKyku6QwwAyp2JLToji6VfApSg1RCFDr3yQhrkOcNsm+rf2aTaqmSpcMtkPkudXC9kY3PLoBCPjvKXJxUfNuhIM21m5uIQcTyfQy/uyPV/oeFj1/OuIJ1AJPjC6k+BxNh5gzRx/uE+yJyaJ0U+1y+qtVdORcuY9cqtMhCWFMnhyvto4r1ge6S3PqByKjcfozKRxNawLyBzp+QM0SksRjAYA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Andrew Cooper
	<andrew.cooper3@citrix.com>,
        George Dunlap <george.dunlap@citrix.com>,
        Jan
 Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
        Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
        =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
        Paul Durrant
	<paul@xen.org>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v3 0/6] vpci: first series in preparation for vpci on ARM
Thread-Topic: [PATCH v3 0/6] vpci: first series in preparation for vpci on ARM
Thread-Index: AQHZVrdy6rMOYMwx706MoeCGqRZxrA==
Date: Tue, 14 Mar 2023 20:56:28 +0000
Message-ID: <20230314205612.3703668-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.39.2
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|PAXPR03MB7967:EE_
x-ms-office365-filtering-correlation-id: b6afa6e5-5d50-4ef7-c676-08db24ce954f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 brxRUYPHkt48aBdvEtqOltztUmC5Pgz/QY8CriXE+BckuqYthMYcvmIOEqPXPwrs+eHzohkQYt44x/FojH/4hkaJM3soy1phpT+XfYYQxzBsGZlZNPsqwEy2LB6gCBTrh/UI4Aay9EoLh8xHFxZfl2QNd0hrBRWOw0hGB2IKKmQkI8nxJGbm0mxXZpBMVq/IqxNxI1PbqlWctTjrG5AdmF51QzNjvU7HJVzZm7fq3O43hd6yB+I1NBNew8OC6v9lgRpSRQ3BjOE3umwkNpe2iSUiGAclwx/QJTP31IkYdm1xcCtMvVrnd9LP53yNOHhZFRIsNXerS/IuwiA6Ae/ZwwOHfvA9L1nEX16fG3xzNk2xo22Ee9KK+uLpidWwhLX0OIHK08CW9r5y0N1ozWKB304m9FBWsusd1qGHgeDt0Ps2UOtndoo1dMW2qPeOaH8tj5n6D5gmkRh5vtHxrWkfIqeZ1nneIq7VnQRNXp63a5JWQkzQfHz/8JkLyt0OhPIMMgtpNgMyfHIW7hgFS4llWUgYeCmGVHATbPbVCD8XB8ZhQxbwJApARCRriAgD/4XAiG+R5shVym5Ehj/NHNWZCQDEfeqod3GpVR+tA0LSbndIDvh92CY+qUCVlQrpu69d4C5kxPklShZYYmYG9/Ilu4vibKCzSuKqyc6mDwelOhgYUVb05aZ7hbfSrVMPG5n8cm3eGHJYjWjdd/sqLftR3A==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199018)(54906003)(316002)(86362001)(36756003)(38070700005)(38100700002)(478600001)(122000001)(55236004)(83380400001)(6512007)(6506007)(2616005)(1076003)(186003)(26005)(7416002)(5660300002)(6486002)(91956017)(41300700001)(6916009)(71200400001)(76116006)(64756008)(8936002)(8676002)(2906002)(66556008)(66476007)(66946007)(66446008)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UWxibFZ5d2VuYlN2eXB1YVB6YmNqTkZndVFCYk1zM3VVS25UN0NyeUhsSlJB?=
 =?utf-8?B?dDh2Vi9ieVVyNExIQnlpdGp2U1dqMUdwZFlTZlBsbHJlZEJTNWw4b3hMTGUv?=
 =?utf-8?B?cjl5by9aaTh1Qk93RDJMbkREK1dkMjhrNVhkaGJoajNnNi9wejB1cnFnd0xP?=
 =?utf-8?B?WUtrNWZHSStRT2xYaERBYko2SWtlWVZlK001VHhmVUJKeWNOL2U0dVVraHla?=
 =?utf-8?B?TVhIcWFpZXdKWG9xTEo3b0I1MlJNd2RrazJkc3kwNm81NDBwK05OQnN2dk4z?=
 =?utf-8?B?OWlFMkh4RWpwYnJuVkhzTnBUdy9abmFkOFBDejRTalNZUU5ObWIzVksyVVE2?=
 =?utf-8?B?L2RnVW9oWktjcG9nNVFvVnhDV0NYWVBXb2xWblR4bXZYSXpYTTdUMDl0YUJY?=
 =?utf-8?B?ZjdNMDg0S2RUeVJmRHNSSjNmR0tVK0hCYjRTc0lCdDk5ek5rNjlYdTVVTVJF?=
 =?utf-8?B?L0h6d2t6a01kckk2Mm9yenVwUDVUazJ5SENKMHpmVHlNM3JoZzcrMG8zNVdZ?=
 =?utf-8?B?VzE0LzBTVm9TendzSHV1ODRoSDUySVJrV0IwektldWtmVGt5dC8wcGozSmlT?=
 =?utf-8?B?UlNPby9YaHNBVTJmd1NpS1VzUm15WFlxd0YzK2ErOEZBWXVmOWJkUUNLQzMv?=
 =?utf-8?B?OTd5T2dhQ2RVWk0rVXM0S0s3VnZJb3BFRnQ5TWp3YUE2cWNDZk41eEZ4b3M2?=
 =?utf-8?B?RzZxSkx1Qm9PMnZ2UVZob0dESmlmOXh2N2JxMlJYU01QZTNIeitnTWx1cUU1?=
 =?utf-8?B?SXRFMlBWQVJqT2pDRVh0dXp3WnM2bnZwbGZ1TjY1V0c0L25zZDBmUFkvNlBY?=
 =?utf-8?B?YVRYa0NtYlg1UjdFaXZlNm5DV29FZGUyR2ZIRmdUbWp3a3lpVkxNNVhINGtK?=
 =?utf-8?B?V1AvOEtyWHNnVzR0d0V5cHJ0bFROMVNNRnFKWWpGaHd4Qm90SG1STkJ2K2pC?=
 =?utf-8?B?NlJIWkZZZXk0ekpENGg2ZFQ0U3ZMbkQxVXg3RFp6OGhnYzRsT1NFU3phMEhM?=
 =?utf-8?B?RFBVazA3WHJvRm1wU0lxaDlSMHhlTUtoU09taHluUDVlZHlyN0ErSGJYYjR1?=
 =?utf-8?B?cTYzemZJVWhBT0JmRUYwcFVyQ0hZRkJDZWJiY0dyRmNlcmo2dmlzWW53UlVU?=
 =?utf-8?B?b2tLYzFSRXVLYTVIN3YrM0pua1ErUWpaK1hiUlN3VkExeW0vSUxDTlN3YW1r?=
 =?utf-8?B?VE9neWJDU1dqNXFoTUZudklRei9aTHYwZWtNWUtoMEdBS3BxdUVhelNla3dw?=
 =?utf-8?B?c3JJYzhPb2Vsb1VOc3F0WjFFamRzRXBBYU1rYTZkcjB3c0ZtcDc1NjVrMGJY?=
 =?utf-8?B?K0xONjRIUnRTQkphT0oya1preGtZSGZ4enI2WkJOTFJYZlNsSTlGZUJlVklV?=
 =?utf-8?B?TW94a05WOWdQT3RMQ1pjYUovQkdJNFQzbTFkUDI2R3ovRU5Db1R5T2QrbE5t?=
 =?utf-8?B?Tnl2ZmEwOTBmdWQzcjAzcDBxTG1pVkMvM01FczNzNDU0OURKRTBIcnIyTUlx?=
 =?utf-8?B?SDRoV1h0dENvS2lYUTEwVDVySjUwRmFmVzNoaDNyZ0FiYURIWG0vdnU0Tjdw?=
 =?utf-8?B?aDVsRld3OTNQdEZNc0FPNXNDclk3Ukk5YkhLcFBMbHYvcGQvUnh1K29USmxP?=
 =?utf-8?B?bVc3dFl6NmMyaGJIRm9TVmJvTlVFMGtXZmRzdFluMmpkMGs4VWQ5Z1M1VTk2?=
 =?utf-8?B?OHUvakFJOGpjS0RxTGpGeXN6NlZFK09WdXBWRE51QXZtS09BaVVDZnNqMGcw?=
 =?utf-8?B?Q1piOVlPVkVLcWl3M1h1bEtDUTJtTUZoQjZnVUJzS3pjNm9mU3JGa1grQUIz?=
 =?utf-8?B?cU1KQVVqVjBhcFJrYkIvemREWGtKajNNMkN5OFQwNlNwVUw1RHVwampsY1JN?=
 =?utf-8?B?U1lUY1NSeWlDb0lLUWFpSnpISWpaeE1CbFp1Ni9zMm9TNzE3MDdqWW1ITjA2?=
 =?utf-8?B?dEdUT3ZQVUJyOUZRRHV5MFBoOEQyNUJyb01PMmpqUXdzM0lFZWhQWW1BWHdx?=
 =?utf-8?B?TElqSWROMVE0QWNlWnh3bFozMzVVSUlQZC9tL3RPT09XUTZBQUFzK1pFWjc5?=
 =?utf-8?B?M1pOWWdiR2E5ODMyU2x0UEYyWTFEZzBYWUNzV1dxQitYV2U5WVJaMUlrTVRN?=
 =?utf-8?B?QlB4dHMyWFhiaWVzcGlqeG03bFJiZGVDWmM5QW9VcnJ0Q0RJUjBOeUtBQ256?=
 =?utf-8?B?NEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1ABC6007A1120C41AAE42EC995A6DEDF@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6afa6e5-5d50-4ef7-c676-08db24ce954f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Mar 2023 20:56:28.9640
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o45o97pj783TykNVoDdyRyOZ85iS/7bPq8S/x4GWgBAswcZEAqlPwnH4PyY8kTg65crELVzZuBKmLeaFNEL8jSFutqGmveHZDxGkJZtTWJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7967
X-Proofpoint-ORIG-GUID: nNE1jLtMnASfCT5Vw66q0yNeR9m3LNI_
X-Proofpoint-GUID: nNE1jLtMnASfCT5Vw66q0yNeR9m3LNI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-14_14,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=385
 priorityscore=1501 suspectscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303140168

VGhpcyBwYXRjaCBzZXQgaXMgc3Bpcml0dWFsIHN1Y2Nlc3NvciBvZiAiW1BBVENIIHYyIDAvNF0g
dnBjaTogZmlyc3QNCnNlcmllcyBpbiBwcmVwYXJhdGlvbiBmb3IgdnBjaSBvbiBBUk0iLiBCdXQg
bW9zdCBvZiB0aGUgY29udGVudHMgd2FzDQpyZXdvcmtlZC4gTWFpbiBhaW0gb2YgdGhvc2UgcGF0
Y2hlcyBpcyB0byBhbGxvdyB2UENJIE1NSU8gaGFuZGxlcnMgdG8NCndvcmsgd2l0aCBEb21Vcywg
bm90IG9ubHkgd2l0aCBEb20wLiBUbyBkbyB0aGlzLCB3ZSBuZWVkIHByb3RlY3QgcGRldg0KZnJv
bSBiZWluZyByZW1vdmVkIHdoaWxlIHN0aWxsIGluIHVzZS4NCg0KSmFuIHN1Z2dlc3RlZCB0byB1
c2UgcmVmZXJlbmNlIGNvdW50aW5nIGZvciB0aGlzLiBTbyB0aGlzIHNlcmllcw0KaW5jbHVkZSBw
YXRjaGVzIGZyb20gb3RoZXIgc2VyaWVzICgiW1JGQ10gUmV3b3JrIFBDSSBsb2NraW5nIikgdGhh
dA0KaW1wbGVtZW50IHJlZmVyZW5jZSBjb3VudGluZyBmb3IgcGRldnMuDQoNCldpdGggcmVmZXJl
bmNlIGNvdW50aW5nIGltcGxlbWVudGVkLCBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBtYWtlDQpm
dXJ0aGVyIHJld29yayBvZiBQQ0kgbG9ja2luZy4NCg0KT2xla3NhbmRyIEFuZHJ1c2hjaGVua28g
KDEpOg0KICB2cGNpOiByZXN0cmljdCB1bmhhbmRsZWQgcmVhZC93cml0ZSBvcGVyYXRpb25zIGZv
ciBndWVzdHMNCg0KVm9sb2R5bXlyIEJhYmNodWsgKDUpOg0KICB4ZW46IGFkZCByZWZlcmVuY2Ug
Y291bnRlciBzdXBwb3J0DQogIHhlbjogcGNpOiBpbnRyb2R1Y2UgcmVmZXJlbmNlIGNvdW50aW5n
IGZvciBwZGV2DQogIHZwY2k6IGNyYXNoIGRvbWFpbiBpZiB3ZSB3YXNuJ3QgYWJsZSB0byAodW4p
IG1hcCB2UENJIHJlZ2lvbnMNCiAgdnBjaTogdXNlIHJlZmVyZW5jZSBjb3VudGVyIHRvIHByb3Rl
Y3QgdnBjaSBzdGF0ZQ0KICB4ZW46IHBjaTogcHJpbnQgcmVmZXJlbmNlIGNvdW50ZXIgd2hlbiBk
dW1waW5nIHBjaV9kZXZzDQoNCiB4ZW4vYXJjaC94ODYvaHZtL3Ztc2kuYyAgICAgICAgICAgICAg
ICAgIHwgICAyICstDQogeGVuL2FyY2gveDg2L2lycS5jICAgICAgICAgICAgICAgICAgICAgICB8
ICAgNCArDQogeGVuL2FyY2gveDg2L21zaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICA0NCAr
KysrKystDQogeGVuL2FyY2gveDg2L3BjaS5jICAgICAgICAgICAgICAgICAgICAgICB8ICAgMyAr
DQogeGVuL2FyY2gveDg2L3BoeXNkZXYuYyAgICAgICAgICAgICAgICAgICB8ICAxNyArKy0NCiB4
ZW4vY29tbW9uL3N5c2N0bC5jICAgICAgICAgICAgICAgICAgICAgIHwgICA3ICstDQogeGVuL2Ry
aXZlcnMvcGFzc3Rocm91Z2gvYW1kL2lvbW11X2luaXQuYyB8ICAxMiArLQ0KIHhlbi9kcml2ZXJz
L3Bhc3N0aHJvdWdoL2FtZC9pb21tdV9tYXAuYyAgfCAgIDYgKy0NCiB4ZW4vZHJpdmVycy9wYXNz
dGhyb3VnaC9wY2kuYyAgICAgICAgICAgIHwgMTQxICsrKysrKysrKysrKysrKy0tLS0tLS0tDQog
eGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3F1aXJrcy5jICAgICB8ICAgMiArDQogeGVuL2Ry
aXZlcnMvdmlkZW8vdmdhLmMgICAgICAgICAgICAgICAgICB8ICAgNyArLQ0KIHhlbi9kcml2ZXJz
L3ZwY2kvaGVhZGVyLmMgICAgICAgICAgICAgICAgfCAgMTEgKy0NCiB4ZW4vZHJpdmVycy92cGNp
L3ZwY2kuYyAgICAgICAgICAgICAgICAgIHwgIDMxICsrKystDQogeGVuL2luY2x1ZGUveGVuL3Bj
aS5oICAgICAgICAgICAgICAgICAgICB8ICAxOCArKysNCiB4ZW4vaW5jbHVkZS94ZW4vcmVmY250
LmggICAgICAgICAgICAgICAgIHwgIDU5ICsrKysrKysrKysNCiAxNSBmaWxlcyBjaGFuZ2VkLCAy
OTMgaW5zZXJ0aW9ucygrKSwgNzEgZGVsZXRpb25zKC0pDQogY3JlYXRlIG1vZGUgMTAwNjQ0IHhl
bi9pbmNsdWRlL3hlbi9yZWZjbnQuaA0KDQotLSANCjIuMzkuMg0K

