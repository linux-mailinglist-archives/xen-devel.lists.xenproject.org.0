Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE75890EEB
	for <lists+xen-devel@lfdr.de>; Fri, 29 Mar 2024 01:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.699208.1091901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo5-0002Gx-AN; Fri, 29 Mar 2024 00:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 699208.1091901; Fri, 29 Mar 2024 00:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpzo5-0002CA-5f; Fri, 29 Mar 2024 00:09:17 +0000
Received: by outflank-mailman (input) for mailman id 699208;
 Fri, 29 Mar 2024 00:09:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZRsJ=LD=epam.com=prvs=0818e5feeb=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1rpzo4-0002Ab-2s
 for xen-devel@lists.xenproject.org; Fri, 29 Mar 2024 00:09:16 +0000
Received: from mx0b-0039f301.pphosted.com (mx0b-0039f301.pphosted.com
 [148.163.137.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 929df10a-ed60-11ee-a1ef-f123f15fe8a2;
 Fri, 29 Mar 2024 01:09:13 +0100 (CET)
Received: from pps.filterd (m0174682.ppops.net [127.0.0.1])
 by mx0b-0039f301.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 42SN0uE0024084; Fri, 29 Mar 2024 00:09:05 GMT
Received: from eur05-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168])
 by mx0b-0039f301.pphosted.com (PPS) with ESMTPS id 3x5huq82q0-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 Mar 2024 00:09:05 +0000 (GMT)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by DBBPR03MB10269.eurprd03.prod.outlook.com
 (2603:10a6:10:536::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Fri, 29 Mar
 2024 00:09:01 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::74c9:2488:1dd7:b976%3]) with mapi id 15.20.7409.028; Fri, 29 Mar 2024
 00:09:01 +0000
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
X-Inumbo-ID: 929df10a-ed60-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=epRbU8yemQ8r+UcDGhLuZxyJrkKrOZOTN4Dr+AL3E+Pi99W109UpPcl81JCHXaHXJbyAweQyb5Yv8A04gFRA0xmopsDAy2OiNaZDkkaJMoQUos2O/bNCSvaL++M/b5o8QK44fTF1vhfwt1tkKwZX/4XjC6tMWJ1KTyagSa1zv01INflDwU8/fT/tcJa6bH1usqMvLqQqpYCek0WFsksMm4YAkpNq8iQwMlerqDJgmDLC48gCRG6D3pRPS7oy5W2iKfbX4z34UbRftCxBIEFPi9GqWYm767T50oxrKGfoCiFgMZjGG24NONkRlItyJeBG6sxECH09HwI4W3iXaHjk2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlWucAXwM4UZFrs5s6iqTywkhsmhUhvRMACIl434bj8=;
 b=kU/99/KDbitMKenbJHZza1uhx0ENEyuvHH3g39dj7CoDRBJu79y+ARyL2xoWiC6Wuq45IMLUF4QtpVn75DWjPEAsn9TtzuutzPLWdQFIeWmU6Me0DFIrkgwVCfmKIpbKL2iF6TtMKZ9HT3nelA5wiy9W3AeNGHFt3UJEg8cH8GK46pVXzRZiRYwhkEzvBYpc/MAvCFb3XZ1xwgGxj9u0Rk5zUEODhNCAKT25F6S0dg1jZLec6o3KMikzwSBF+rH7Wq49qqUeR9DiFGyk5E7hT/gAsSLh+oi/+LRSjCZkgjNW3clLZSwampFWhtIcOW/UNQ2CIdpzMFa/umfys6RT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlWucAXwM4UZFrs5s6iqTywkhsmhUhvRMACIl434bj8=;
 b=cAKHpjakJmApsYxCI+yyPhbPMVLm3aQ9yA09tIeBbsqHfJ+aqiFEdfQaYWZ4PsfHOo3xDnP1kzq6c6dZjA00FYoGbCaGfro9UwkDyIxiApsGUC7ZqHyYcadqb6/4WwYbbFtqSyNJf1BeEWDr0WcEYu8hdlXt0LcRsMQ0CYpgjxpKdb2KYYKviR7/q1IzzTSUGo3YlHaHhR1IrliT9OAeB+nzM7AAsxs33iabz0Z+MICd5qQPmeafEtAqyRtQS471qPRnWkRyPNrsyrVCthDbF6s3ZFhRKyNwKq/EwBPVDvr22OudiYG/BapjOQ0Q16VfCvxwnrCLqna1vwU5pq0Nkw==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
        Julien Grall
	<julien@xen.org>, Rahul Singh <rahul.singh@arm.com>,
        Stefano Stabellini
	<sstabellini@kernel.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Michal
 Orzel <michal.orzel@amd.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/3] arm: smmu: allow SMMU to have more IRQs than context
 banks
Thread-Topic: [PATCH 1/3] arm: smmu: allow SMMU to have more IRQs than context
 banks
Thread-Index: AQHagW1LqEDvA9goAU2CqI9xrHsnFw==
Date: Fri, 29 Mar 2024 00:08:57 +0000
Message-ID: <20240329000822.3363568-2-volodymyr_babchuk@epam.com>
References: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20240329000822.3363568-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.43.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|DBBPR03MB10269:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 riPSEmfKsqKfo9u5KxdcQ+pJBzeXx1zXzBGX+AW7oirXMqg3S0KGysRfR0tHft/NQNtDCSOR9g26PCoP7WPk+2KFMUPNiUeOxWgrkO1zSLY4Lm39nkduQsP5Myw7y/6gsEov78Eq3u4Sxmfp5CmQxUYYJueX0cR35zRGfuJVIm+KPI9ObKcybvwSp1bWXiz0UOJn5zLHG73JEB6eM9iPqhbMzNVshl0ibDNXPewShSsmHYkZEVnnpAkN3JQ5BXW3ehMys6AvPl+LQVDPckczo6WRm8aJxBx10WEhUwguxesESbRh6K+xGmOl8uAE+GHsT/AW81qO/qpAfGenleZvPr0578Yy/72fiicUeAEBl/2xH7Z+teOU+BmEc5zy/LzOr76kjmSTrrXDzaDGSlBUcmp0LMLzy+/70XplRqUs5NB1VXcbkJQGXEBbNqGmCbFlOkNzMTlMr+Lw3cYUFY2BNT+uVwCpDLMaixD3ASmNSd6hgYEgdaRLc+/Vbt71+YEpvK2MEsmn+hwGzbvFY+dmc15OkDrosFDAD9dNsMkJpydVLC3c74ABKcBLcZyBNDYgoq6MsU7MjTWbLujiwHarBIxaCvrAMNxBTC1jKluNy2r/W4/tAZxkFyJs8UM3WuiLqayadw5OgUcI/YL8ub4HKy5bt++1nRiP/lPaozVP4is=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?K4Y0LI6i1UQVDKuTbIa/8+ouS9lkpC9tUv0Px/e1JqIwjKQcGLKRYzwPrN?=
 =?iso-8859-1?Q?45k2BiLNz2h/yyYWq8lR8J8E7sjnorydHVkVuU3cweiKLDQWd9NuErT+EX?=
 =?iso-8859-1?Q?kDAB8PUO7TXzJMazsVhV4htQujv5/b0Oow7iXZHogOjcTEsHXzlq8SPFvP?=
 =?iso-8859-1?Q?6CBPYu6ShflfoDN5cc8YGrNgpVjhdqd/F5Rqo21XLznnCZvM7fr+DaEc3s?=
 =?iso-8859-1?Q?Y1+QhwovNRnS1glx1dqP4Z+UW8sE/fTzOEsfS9KISoFrDimM1ARPEyw9y9?=
 =?iso-8859-1?Q?h1BctH+ig2kbbIZQ3E6BChjgr+cF+PWixZVZt9ROFJ0KAAJ27Qzz8HZhMP?=
 =?iso-8859-1?Q?ZryG8dfSqnozMdtKyTTtwzmYxHZkO2kbWrxhRk05/xwdVMQLArW2rCB9PQ?=
 =?iso-8859-1?Q?1QXBJfjtPpFC3lfufeOZs8sujjVsio99xedkeDDG2NtY3GhqXT8bTyFd7+?=
 =?iso-8859-1?Q?BOZeY1MVWO9vAJco2+2SIRLWLojsGLZdug1wNUrw3lR7slnhL7yOaLSD0S?=
 =?iso-8859-1?Q?kA5cwzq3diC2keQ/9a72EquC9fP2QcmGMu45oacOYw1mwu2llUr9aXGMq0?=
 =?iso-8859-1?Q?YLBbSFtCU01j3a1Le3O4yY0nvBpbbrqeqqIgDSQ44eMAiCDHK3K/YG4pPi?=
 =?iso-8859-1?Q?k11v7IvENdYlS8dQFZWdgLcte82HPoBpEnOfIrviCMu1yPWxfqf0x58LBB?=
 =?iso-8859-1?Q?VavSydp5fyBgf7Y9rak+wtZIBwvQe5b6NmBoUtHoj6lhDUURJnBs9SEeLB?=
 =?iso-8859-1?Q?2Hofhk2DmHpDCCodl9Nvop87nU/noHGPJOesd8PuqDCg9+6Mt+c6wxngPg?=
 =?iso-8859-1?Q?3CLOsDx4+MdI9e/GpAGnC+2kWxze0VWTqu8NEzvurPvos4OjQ7Modpp6pi?=
 =?iso-8859-1?Q?oTyp5//8/FEajmSZCCybK9126FIJ2KV9A6irkf6ZTZsjRDbCMCXScYhOO4?=
 =?iso-8859-1?Q?79Ddnw207g1K/vuBfOe7i4nOU76njSiQ+Prd78Xel7+iu+ZjuwMb6FMz9J?=
 =?iso-8859-1?Q?MHb8pKCo+ZLt0TbKYPbN1uZa4T0RsVSDajz/I9WT/2vpo0625vcKE2JTaP?=
 =?iso-8859-1?Q?29mt7ChuzYnexgJERXzYbWeKwWtQugd7c5eYa3oGhmOeoBscC87GgQvJPq?=
 =?iso-8859-1?Q?ULEEDi6MpWNFBk2dhQAnV1gRZRdvh7cu5z5vEng9Eb4MzuPNAJ+z/MB8DE?=
 =?iso-8859-1?Q?Vd/QZZeHvpfquxCzdiDA6e+RQW33b7/NYlryKAiDYb7IkCd4xVHt55x9WY?=
 =?iso-8859-1?Q?Ouw1ru/K65X9ug3YV08Z61IKSWcCh04f0cbuBmrcirr6EA5kArndb85LeZ?=
 =?iso-8859-1?Q?5+jpi18ODtx9Uv+cWNOVc/ZiMXE1x3QgDwMArVA8WjdJWPj7/vfzpHNDpH?=
 =?iso-8859-1?Q?/p8t98JfoqxS7Gbo0GqbvzIsLay6iFZ9bRouiaktVM7z/y4OKGyKvG1KH5?=
 =?iso-8859-1?Q?sNliwtJKN0o9wmUgXL4m6pSoRi9h0s13OjJ4sztkHEpRu0u+cELPy4jE8D?=
 =?iso-8859-1?Q?qoN6LRegjMFznmlwPC4w95antxoho+F5gCkMSsluwnZ7VxFVN2jHIcH1B8?=
 =?iso-8859-1?Q?qT7oNAst0gOMYcY2wVeLmKMEsav0UPazuPu47Yaomten932nOrVJOd+BsH?=
 =?iso-8859-1?Q?UrIw7zg6XdNa46Oxf3/Bk5o17i/dfNT7hw+12p22RCynE2m80hrySfdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 102089bb-6aac-403d-cdbc-08dc4f847030
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2024 00:08:57.2766
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VKs5qExzsYUnNgS8n6uQ1dSxQdQEskQDJt9xz2RbOqo3lAd7WMTGACFrCAQ7qV3elpzr7YFgWfAbNxa6dD5/xR9nwaPzZbyEDFqBvhgrW4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB10269
X-Proofpoint-ORIG-GUID: j_28EHeptQbZUYd5OiP8O5MfnE6eOnGP
X-Proofpoint-GUID: j_28EHeptQbZUYd5OiP8O5MfnE6eOnGP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_18,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 mlxlogscore=947 suspectscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280176

I encountered platform, namely Qualcomm SA8155P where SMMU-compatible
IO-MMU advertises more context IQRs than there are context banks. This
should not be an issue, we need to relax the check in the SMMU driver
to allow such configuration.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/drivers/passthrough/arm/smmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/a=
rm/smmu.c
index 32e2ff279b..2dd3688f3b 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -2550,7 +2550,7 @@ static int arm_smmu_device_dt_probe(struct platform_d=
evice *pdev)
 	parse_driver_options(smmu);
=20
 	if (smmu->version > ARM_SMMU_V1 &&
-	    smmu->num_context_banks !=3D smmu->num_context_irqs) {
+	    smmu->num_context_banks > smmu->num_context_irqs) {
 		dev_err(dev,
 			"found only %d context interrupt(s) but %d required\n",
 			smmu->num_context_irqs, smmu->num_context_banks);
--=20
2.43.0

