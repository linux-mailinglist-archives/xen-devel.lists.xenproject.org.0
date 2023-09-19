Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7332D7A6130
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 13:29:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604612.942098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYuo-00014s-Rk; Tue, 19 Sep 2023 11:29:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604612.942098; Tue, 19 Sep 2023 11:29:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiYuo-000127-OX; Tue, 19 Sep 2023 11:29:14 +0000
Received: by outflank-mailman (input) for mailman id 604612;
 Tue, 19 Sep 2023 11:29:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kB+/=FD=epam.com=prvs=36266dbb07=volodymyr_babchuk@srs-se1.protection.inumbo.net>)
 id 1qiYun-0000lK-9e
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 11:29:13 +0000
Received: from mx0a-0039f301.pphosted.com (mx0a-0039f301.pphosted.com
 [148.163.133.242]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bff723af-56df-11ee-9b0d-b553b5be7939;
 Tue, 19 Sep 2023 13:29:10 +0200 (CEST)
Received: from pps.filterd (m0174677.ppops.net [127.0.0.1])
 by mx0a-0039f301.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JB52cv013085; Tue, 19 Sep 2023 11:28:58 GMT
Received: from eur04-vi1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59])
 by mx0a-0039f301.pphosted.com (PPS) with ESMTPS id 3t6r9ybe6s-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Sep 2023 11:28:58 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com (2603:10a6:803:31::18)
 by AS8PR03MB10084.eurprd03.prod.outlook.com (2603:10a6:20b:628::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21; Tue, 19 Sep
 2023 11:28:54 +0000
Received: from VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f]) by VI1PR03MB3710.eurprd03.prod.outlook.com
 ([fe80::78ef:303c:8f74:957f%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 11:28:54 +0000
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
X-Inumbo-ID: bff723af-56df-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YLeCahHStfI3BUHo5C5Y6DTTFKAs/W+Mx+dRjUPEckXxYQySrcToTa/q9hrxuzMV+w5uHtGLTlO3eN4fa4gSDVACn1YYdOFIPAje1sN12loeOXZIIGCIw9Q3mfTiBTLmKzb7m+qmnkMYOti5I7OUimMjWlcvyc6ru943GQAjt8lmdHBpd+a+6OzYwwIgG/gzK/2qbcx1UQYNJV9Xjpl0sEK/dgEkfIemPzZrIE4+gX0qhbWmemN88pso7gCMRpoQCBM+4AbEbzZJsLwQF04dqsBqzEQJmSlO5xAC7a81432yFrLc7VBMZuvI9A9K4rhpgHQjwV1qYE17v5BjrNhIJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IN0+pTBEp8aKCI0j9DsWywQSvBE4azf66KEfbeD3h7M=;
 b=nZ8pL7YrQB/7b30iXKurwsAz5lvPqMPcDX/Lyymlmnto+jdl9QO1YvzZXD4eq6s1VAOdASn4SuDdollZGnFx/Zfu58cUw85TnpCnXctXecdU+SVh0nEELf1eSbpJGIJ+ILUCd1DtIelfUciHUrDjsizV4C31hcxqaCxrIHA2Ahf/0GioTlrZSuJDXHhQqodoFJaoJ5hNlZEv+Z/1j2M7JYlxIMhK8hddK55A+ED4rUhdYR7gIcbPVMkzykfIdNj0/P3L0QiPj5pbmQaQ7/3m8+lKMkauLCuGCDoiy0b73xTUqHcYZFAZrIt+kNLWcfkeBf11jkGk/Q6EzpAajHCvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IN0+pTBEp8aKCI0j9DsWywQSvBE4azf66KEfbeD3h7M=;
 b=c9yqxS4Tl6DWe3GO/inslCtsAAxHaLY4/mB5hRpQ6o69sYrNuFZbJ7lUQbSSri44xU/J9IqFtA1vHEOHTAboKU2+ewaoCq6twWQdKyo/9z+fVdqQUC2iZ4qldXt7gIlCZTiGzea2D4gK+lStECidHA41c5S9WrOyPZBDnU8HmHqHHMZ/kqnnop4i/kzTV6tUNRBjS/8OxVYuAHQrXNAcdQhx70jExeKb84RneNsdcQ4tExGp01d+85c7Z9z7otO9IQdMtAJ/vPro2a7Zpc3A8ieLrr7pvg25BU35EfIPcEj56HQbrmpFuNnxobSsiL6H2vGqJLO3/mBG2PVgY9fMRQ==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
        Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Bertrand Marquis <bertrand.marquis@arm.com>,
        Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while sending
 a command
Thread-Topic: [PATCH v1 2/3] ARM: GICv3 ITS: do not invalidate memory while
 sending a command
Thread-Index: AQHZ6ux4LpE3chDIj0mOPudUv9951Q==
Date: Tue, 19 Sep 2023 11:28:54 +0000
Message-ID: <20230919112827.1001484-3-volodymyr_babchuk@epam.com>
References: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20230919112827.1001484-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.42.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB3710:EE_|AS8PR03MB10084:EE_
x-ms-office365-filtering-correlation-id: e72eac27-de73-4ec2-5afe-08dbb9039b2b
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 apRStlg45tQcechXum9w8oTwxIoymv+oUQ3SdvEVzgX4RVzW+29+HdCcqp0tKRAeWR2VUNGOPPyXFWzicOQ0ohcGfcCnEnO5aEtOuw0IZaOHT3M5Pslk23B8/+VzsR5dRWt5kaIIXPdiMG5O+6joGgVbWChdPei5MjUD2nuLAaA4f1gCq8HOIJ/Aeu8HjuexonTYyzvDvYX1DVdxHWzGJCjA86+tNmHxudSjI9ICImmQWA3zj6yUYh9PGjfNgYHYb+jrv9dqKKWUnQfY53QKjFPRMNTGiM8cAJXdoS58MzyV6WsPxwk2uAT8iFp3RN2Puiw4n4/rGc1fsAH3DqvxUFKEI+48Z7e2K+nAucz0/TACfyns+7CG9kXHo1Si2KO6rsJ6iFJ9e4MdJv+uG5c6diRk9CyRG3Qrfa3f8hYLDs0VgS9JDNwkCn+HmpIZsPjOLaIhpD+K+pum5vog7fgbjg7cgQrPjEDv6RZMropv44IWLWupc/+q3jIBDPJuXMGZVIq0VuZouB5xgm5HLqSAKfobrDT38OVNSRIe7JFszLccB/YK7xDR3GTQ7A+j+IRMiZbrNOKmwUIsiJ0rO8PK09mLCbLe6e076CJym54ud298+BVZ6B1bH7OCB3/BoX5Q
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB3710.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(186009)(451199024)(1800799009)(66946007)(6486002)(66476007)(6916009)(71200400001)(26005)(107886003)(316002)(2616005)(1076003)(83380400001)(54906003)(41300700001)(76116006)(64756008)(66556008)(91956017)(8936002)(5660300002)(2906002)(55236004)(4744005)(4326008)(6512007)(8676002)(66446008)(6506007)(478600001)(86362001)(122000001)(38070700005)(36756003)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?Uc5mL113vJ6X9ZUSHx5Bh9SbrxscIdw0MgzrWk9oqPnM11+fifcwWnKCsl?=
 =?iso-8859-1?Q?Q2ZEOFHVBLGgLKdoyoA60Mk+XO72HVay338WHhOM7UKo5K1t27KQCVVb6N?=
 =?iso-8859-1?Q?AJvx1DU/71ygQtl8BlP0tG+TmaGdvwZWjAtX6Cp5i4byI4kdY1iXCez89s?=
 =?iso-8859-1?Q?4EexTSNayFnUs980vxjHGhaV7nf3z6YIcfju6U0zNPILzL/F7KMo0QFQEM?=
 =?iso-8859-1?Q?FKv284Gc/mchoB2g5n8KEZDnMFKQYHaSZvqDzzYrqrUQlHQ850LS0YwvQ8?=
 =?iso-8859-1?Q?00vYyxvEH89+jZc/TdxgubONx2v+K2biCJXSEZQ4XKUva0M0Lc4otIWPc0?=
 =?iso-8859-1?Q?C3yRH6nBbF2FFcdtw5ZoSTQdP7Fp7haU+6YTgZjdP3/5/svhsXDPNioEJS?=
 =?iso-8859-1?Q?hZp7w9ke+7hrPlp31ayB/Ru+tftHItKfHbxzMLznccXIqMOhNCvuxU8rTg?=
 =?iso-8859-1?Q?3GWfhJWxDAXW5pKA98yvq15OsqabiXk4LshkkgW8N6Nbn2ZYGGCHI5DqeX?=
 =?iso-8859-1?Q?90kyWr6lbA2y9f9Wj+wwyH1shnQ4vJi+KidY9RLYc7oLUqgUgqLI14d9Dz?=
 =?iso-8859-1?Q?7Cs6jlJF6ZfUi7NiKo8TPf/WfHqewN9lb6UmlNbXwnpL3D+lBuAevsKZNz?=
 =?iso-8859-1?Q?HYC/RQK1efxQx6dzZVgmNOTVMoXL++4pzcTdnumYfCw7mrVxILM6eoziUh?=
 =?iso-8859-1?Q?Z4CUWM9sBna86lVVvBuLz0VrkrHlrpN5doQBwwDIkiMEvIOn0HCUDl3yMf?=
 =?iso-8859-1?Q?R7NrpgfzFi+v1rKKJeGQCEHkPf06H5zVG/sQx7zViBfvm6iuSkS4UD18eX?=
 =?iso-8859-1?Q?snAs/0jGP4ePtAsaQ1BTLJmXo/TjWoJxXjoLs3wF0TcvbcRix9Ad6Q+KQq?=
 =?iso-8859-1?Q?Bm73BFr/gg9zFt9TsePOGFnwGBBjPPR6DGzMqJMQf/pwQz4x8EsZsyZwBT?=
 =?iso-8859-1?Q?10bUykhDGTBPJ7k3qWR7s+Ot7PadjSh142x3+6pCjRu+7h3dbRRCnqvGxU?=
 =?iso-8859-1?Q?0xawtKt9kgEbv/mWdkXGDbzLMuWkOgzT1uxZC/PZIKXr4su43JhFXVK8T+?=
 =?iso-8859-1?Q?ZxY9D9VT9LxLRHRaJ8j8sA59om3NqU/NL62hqtTBE1fluXIJFOcbvSk3Pb?=
 =?iso-8859-1?Q?Fixq5iH5WDI5VmPj6lqrtfg+wb4ww1a7re6XWVjel0imZd3SUgMCiA83R2?=
 =?iso-8859-1?Q?zAs5IWZp2uWqXXYbKLLyOkcL0kyfKeXp2udFwdT8m20QFOA5SEQNO4PD/2?=
 =?iso-8859-1?Q?sRVfCR8jfD6m98PYGBALCXZs/RWbA0uPipfsz/dPOICqsUButBRaUVxgHI?=
 =?iso-8859-1?Q?xJoaPi9XhNJ6SyM33ij2mWjoDVGjXHCIKtfTAtDRW8F5gcAlqZ26aGqNaM?=
 =?iso-8859-1?Q?zpBjsCdbiwZuavbB7BLuurivqEukvDz3PTeZnu0s4eRjBeWWnV8dLTdndl?=
 =?iso-8859-1?Q?dJn5q3M4fAW63lKxgPzpiW10Aowx+Rt94vf9o7h8jfJAkGXX7mnvZ5x+QL?=
 =?iso-8859-1?Q?NkUwuuKUXxQZafNmFP1ZmOq/SizCAQQqec83gq8Wm7hP4oU1Se6DRx/MJf?=
 =?iso-8859-1?Q?eaZ36KknNnq604zfpMoAGABe+OvRBD7cyyT9/PaKI1evZs377Pcigyhzd5?=
 =?iso-8859-1?Q?v86dgmDHkpYPQ6EiwUYaONdU53Vz9Az50baxYhC8nX1ev+8rT+Z+O9CA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB3710.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72eac27-de73-4ec2-5afe-08dbb9039b2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2023 11:28:54.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ePRit3yhhpQuWEeU1Kbu4bVXH4/y9tC47rx2U2bd5d2WqUHCAO3ggWD1LG8AfixrIQcUUoowXvLJ/sMBi25fn/R4wFXBV6jMTx3MAHncx8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB10084
X-Proofpoint-ORIG-GUID: Jw3yNeMFe5uQIR9sL1a6Md38rkS6Okg6
X-Proofpoint-GUID: Jw3yNeMFe5uQIR9sL1a6Md38rkS6Okg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_06,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=885 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190097

There is no need to invalidate cache entry because we just wrote into a
memory region. Writing itself guarantees that cache entry is valid.

But we still need to flush cache line to be sure that ITS sees a
command written into a queue.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/arch/arm/gic-v3-its.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3-its.c b/xen/arch/arm/gic-v3-its.c
index a9c971a55f..72cf318810 100644
--- a/xen/arch/arm/gic-v3-its.c
+++ b/xen/arch/arm/gic-v3-its.c
@@ -108,8 +108,7 @@ static int its_send_command(struct host_its *hw_its, co=
nst void *its_cmd)
=20
     memcpy(hw_its->cmd_buf + writep, its_cmd, ITS_CMD_SIZE);
     if ( hw_its->flags & HOST_ITS_FLUSH_CMD_QUEUE )
-        clean_and_invalidate_dcache_va_range(hw_its->cmd_buf + writep,
-                                             ITS_CMD_SIZE);
+        clean_dcache_va_range(hw_its->cmd_buf + writep, ITS_CMD_SIZE);
     else
         dsb(ishst);
=20
--=20
2.42.0

