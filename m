Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DC9DBE75
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845649.1261023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-0004wE-OB; Fri, 29 Nov 2024 01:49:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845649.1261023; Fri, 29 Nov 2024 01:49:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8L-0004rJ-D4; Fri, 29 Nov 2024 01:49:25 +0000
Received: by outflank-mailman (input) for mailman id 845649;
 Fri, 29 Nov 2024 01:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8K-0004ZT-4U
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:24 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2614::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 273d2816-adf4-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 02:49:21 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAVPR03MB8923.eurprd03.prod.outlook.com
 (2603:10a6:102:32c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.14; Fri, 29 Nov
 2024 01:49:13 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Fri, 29 Nov 2024
 01:49:13 +0000
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
X-Inumbo-ID: 273d2816-adf4-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjFlIiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI3M2QyODE2LWFkZjQtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODQ0OTYxLjQ4Mjg4OCwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDgX81zyQoBybsO0w9cajZTkNvfYZ/li4C8vzWGT3nbnlIdkL6JBo+fQ+gG3k2YN+rh+z1TazodFHLo2ey00ZHuI9LAF/6CndBEiZZefhvtphrAcy7ew5SP8mTMuWmx8Wmolt4DTb2jQWjjD4z6zgBSc593t+uafO5j/amFsrx3FBGOcWtwV9KNpHddwYGEiY8gfLHT0d3EJvlAGcYu1fU3VAX7/TYvORZ7LeMy3OfoVfubD4sz+426YS2kh0akvADDSPMrMxCV/eWOaZuxWxlKo78JUpmjj4Uf8RcfDxUi8j0J1le/5e5C5p62QMd1TOWS0qEIW2OTBn1EJ6sEV2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cT9VoTsV8c2mDTKSh8O3lk/cPOowmpDe2ws18KxovqM=;
 b=j5/WdM5K+5Eo0/8EmIyZPCwxwIpa3noy9SK5kotAifgTOR1bZgC1buxCTffRxV5Zm/pNFdy6uLd6aFWOeXLLKvbO8PRKPPPfcMwiWHfmYOCysPCNXhLojBCJs4wKUSIWAySszA8EOMpiiVgt3nf8P62Fs8MHBOalMri33NXyyPgVYuhaL3yAVpqbRJ33eaH8iCq84LCGbD3Xa6r7AQh5oFbj6I+sdASkiWXyqBKpwTUv1X2pcMwT3LmjsXR8qhKle1siPVvb3+wMDGlZC45MdPecivLqs6KNkkbAGZ1/6Npuga4yq6giw+jvxSYjo66yRujeXLCQHC7oKsXkoxxeZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cT9VoTsV8c2mDTKSh8O3lk/cPOowmpDe2ws18KxovqM=;
 b=YmQN6avDxaVXuHeKlwjxsuUgMn6PFaZXB0VKR656bodv5w5PIJORYtAEfhTJZEkA0/ubyDToSAP8JRRuEd4doTFaSBaPGOdErIIojSzvl9wdw1NF7vm3vTPBhxbN8MaQk0xT++zFdSkuPETZq0j6ke2tpX6jRCQpzL0BqCg3ZEpnrhaLb2ZLI2dymupNiQVS7UaIBHPfn1vzLn/Gl2CQX5uPwDk4l9ggCT7r721BE+GKHhHmXRWrC6A93DnwFF6iBsZ7w/RV8L0nhHaspTAnb88Kozze947bSsn3gA5KtdWUPG/8oIIhPy3y8nudozvwMq9Ri5FyJQ7oOLPFrvXvJg==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 4/5] xen: build: add support for CFLAGS_REMOVE variable
Thread-Topic: [PATCH 4/5] xen: build: add support for CFLAGS_REMOVE variable
Thread-Index: AQHbQgDi3w2c4ZYqbkyJK+dadw8SYA==
Date: Fri, 29 Nov 2024 01:49:10 +0000
Message-ID: <20241129014850.2852844-5-volodymyr_babchuk@epam.com>
References: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241129014850.2852844-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAVPR03MB8923:EE_
x-ms-office365-filtering-correlation-id: 0d3cf442-6c55-4133-67eb-08dd101806b7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?+1o7mVMWwdo0HqOI04ZnVzfWtTpaugxIdzWButim8uRV4OpefkHesv61dA?=
 =?iso-8859-1?Q?GtetkXoe2aUJ/UwDgjTlBs+cIGRKN7/rXJeekZc6f7t0thbEFaiIKydWFh?=
 =?iso-8859-1?Q?kwJWCWz+sANgSqdtnfyN7YWebf7SFdPc8AJTMEtjqmIqP4XgwlVVD1rzD/?=
 =?iso-8859-1?Q?gvbPmZtSEg1jjMfGhyw6BClTuvGUAryYfbe71vMug20RqJ4Nb4LLMw1xTc?=
 =?iso-8859-1?Q?ET7bLmKuu2NS8dNvZkVwHpYhR/+mTErLHqHg5vr2HfYYHOIVyCFP69WyBW?=
 =?iso-8859-1?Q?ijOzTkrriEGvRCtbIEeOznouv1eajDZNoP4Qv3/sNnMfstNG0FaDntl4ae?=
 =?iso-8859-1?Q?ME8HlCYNma/TxZ39Re3i5i0w34agDo5CPYeFx92yy6ya1fALy7+7bt2Tki?=
 =?iso-8859-1?Q?he53bgRd1ANE96CAU7v/juCcxk2cT2f8uFr/u2PQ7ESHJMcGIthJ5ZGkph?=
 =?iso-8859-1?Q?4Tceqlhg0lxjn8wRSAnK2y49CRmYZ1WU32nsLMRPSRYRjhCfLJb7UnW9Jm?=
 =?iso-8859-1?Q?lCzdj78URorzoiPCed5mvjth82trea6n3WA4HBtKFHPJQKldt2TzmiwVYM?=
 =?iso-8859-1?Q?0I/fiublqTjHDKS3kfkbCdeKsez2iDjF2D8fZ38a1YoSvl/vO/8hLurDSr?=
 =?iso-8859-1?Q?/5kXpTVN4mAgSGLqhBhHMCqFKaTHunmghfVfGngkLDCHDQql2Mz4Sc91hu?=
 =?iso-8859-1?Q?VgPMBJWHOcV1hSjFSv2ZMm15KNi+1nU7xPjGkP9E4EHCoO/0rN2sQe5GmT?=
 =?iso-8859-1?Q?5jQ1GXC2VcTXbBTR1Qw4vPFDd23gwIkV4No9BgDrZBY/YgFKV1up1HJ8Rd?=
 =?iso-8859-1?Q?6KiCKy2aEJ40ve2F0Oq0odnpqBuUA72ZpPB/dnRELjfxL5fguifOKyN0LJ?=
 =?iso-8859-1?Q?/pJdVFGj7D5bsjSpcGHxVCDobPE6av3/ZP0A7NZRSb0FCROcTwSXk+4x0m?=
 =?iso-8859-1?Q?Odsbih5ttyTj0H2JjQbZFGZZWrzJvWlOWRdu8JkW9FMBoXFw50YHc16idU?=
 =?iso-8859-1?Q?sNFVp4jNqFi2XU/UB7532H1lJwvT+AmRvBvl3OltcJGbXoL2EJw8VNW9zH?=
 =?iso-8859-1?Q?QGaK2UU+gmgI/wlbK9IFL7CWjJGQ8OMMT7YTcbXeoeFhI3IjaLuiaA61j2?=
 =?iso-8859-1?Q?juVK8Xbk7sJiZTZPxayegaSpEMiAaoCtOlLEcjlibEVD/t8niSQITOGk6/?=
 =?iso-8859-1?Q?WsagCvBcGs+KzaoStIbN9V1VnHbPgW07fS4AdIO+2SkiYOnh8HyTBWRcj5?=
 =?iso-8859-1?Q?U78Ah1Oikp2wDTtq7KYzWlfsQgX+fIfkzzWW2f4CZj+9oB9e1sXNRe+3ZF?=
 =?iso-8859-1?Q?V32ow+NvGwzYwFklA6OBRwzw40XzsU/erxsQhpk4uWXGV41nbm5bKaeAHS?=
 =?iso-8859-1?Q?/yL8tKGzmgCtwj4fHTX9jiaO6FDL0E9iNNsILTMUsWHzMfEtffmEVP0CaG?=
 =?iso-8859-1?Q?PfozcEfJl4ErH6uP/cpBZtFkFrZmqItJhvCoJg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?o8RwojEdQzIjXEEdFcJkjiqWqurHhXjR73BW0o4HfkiDMNczDjtzhCcuTM?=
 =?iso-8859-1?Q?YS+28eagkDHn1zJ5ld4bYjwyatZp8LkqWVW4qP5xW/h5xVMxXDu17pT03M?=
 =?iso-8859-1?Q?Ik8WiX2E73GqkkX3K0eWGhFTDijdoF3Vjp7miAjVHfSpNr91u2ff/ODmtq?=
 =?iso-8859-1?Q?T5hsP3pCq9CX6STHghzH2lN9w5eN4WofFP0usDH76fjCxYvh+PmOrfBPgG?=
 =?iso-8859-1?Q?r1towqZ65WdrmDXO1KWC1fIYJsj6+eq1mxy74jIH5uMON6p8p9FN6Jt8bP?=
 =?iso-8859-1?Q?SPtrWiSX9s2Q1pum+mxwDuNhbZNN5r7MfkvLsUC/GDqYXgM/V5YoyUsOUK?=
 =?iso-8859-1?Q?HYWMlmHkeEqY5jxFhlLS5EMDl21btjFtq5r+WMyS13Rzcx0F5RVRTtnHH1?=
 =?iso-8859-1?Q?QAZGnWS1Qo6q84LuyxiudCNoKI9Rs4nyLYj1KtvKeKsQTTxR5ddeFbtYoW?=
 =?iso-8859-1?Q?mNUZJGpN3BbOwlPJ4O9dVdXkj48Z8vSrZL89rCEyg53x9ApX8WRSOH6bTo?=
 =?iso-8859-1?Q?hemgYr/F1o7/2ZVDdKBskDWV1WiQIaJmPYXCJ48Rqh6jkyuygE4/V3Dj4P?=
 =?iso-8859-1?Q?yRfpxLPi6lJ61bf7apkQolEnt3EG51uqBPHcNp3HQbzId22CSNIggvmIAZ?=
 =?iso-8859-1?Q?aGUjLwidWAYjQcysCJtoUhxd16X1ySprPkBM+YkCkP9vjGeCqKIO10uTky?=
 =?iso-8859-1?Q?YXvsCJRtKxRHQs9K+Q0eSitmUWZQf/DhWjqUQPHddkMdol97gMLS49JjXK?=
 =?iso-8859-1?Q?EsXNhdff0PmQs/oyC6a9YnQS2uZsBe4AmRGluXit0/5OAZJLcnO/vRffNB?=
 =?iso-8859-1?Q?hK2rNdXE/jXa+NsB1E9GRGIbi8DEB1OmI3kkvD8wpKAoyGFTUaFmuz5hAD?=
 =?iso-8859-1?Q?Nx9nUssv3mffiF7uvP+JunaH9CnsMP0Z0SYg1CisFffchGtDjO5eiZS2FY?=
 =?iso-8859-1?Q?Uwyux1LK0apVc/ayQ2N3IVJqVmn1OPNjF9U2ezSf/HJERdr4Xso4Cqf2eA?=
 =?iso-8859-1?Q?LJsQSbYVFTGqeJD+3FPEQCCYL5j5JFW7GK17VWYVSzgVqJBw7dKWpmufYK?=
 =?iso-8859-1?Q?9zhQLGSeoTUhgqERgM85CgjU9PAiHOuH+Cw66VeGrbuwijPWRhuuTp1wmn?=
 =?iso-8859-1?Q?fD6I4rD2S3XEYwLdz2f/+l9DrHrIeK1y/EGCOIFCnJdKzsmsbjrZql+Dmi?=
 =?iso-8859-1?Q?lztr18s/k+2o87yThz7WLjlDwHdlrLoVdvxT6DwjHh7ha7kKYNKqNJlDV2?=
 =?iso-8859-1?Q?T9Njl8H+Jtdux+IOCAC1DrLpXoYYoRpjc/dQfa+B5Fb6OJgHFwJHGySzI6?=
 =?iso-8859-1?Q?aL5A4ylOXGfE8e+pbkSF64yDdNJJm5sXGSi6QRQO1kc/FBGk1UeSnAMq0r?=
 =?iso-8859-1?Q?M2DOuK28LbtjyfcGTZ4UVS3oIpvKepYVvlx8PHoDv4e2zGdc10hiNiu2nL?=
 =?iso-8859-1?Q?xUtiESmHSZt74WpUlrD4FeIDyXWX79yAxKlrHQLE4hlkwSW0eNwzNnUmY9?=
 =?iso-8859-1?Q?O1pjLnz6XpjYNxKmJp7+G/nbjBl/rQqXlXL5q6ZSqopviCRUvhXwpl2GDO?=
 =?iso-8859-1?Q?vFoI4C+klLl1lpCb9spEfAQrVHMsTNyldcZxnsMoAO6heWwI2D5F8qARdc?=
 =?iso-8859-1?Q?3UAkXBesPQE1WrIgtUGmaopq4NcDV/v/jfUaDllUakVFkjdQY5kV9IiA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3cf442-6c55-4133-67eb-08dd101806b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:10.3550
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q7+/6pc6IkzcQJEu+rBrYKgs/3DsLZwS7rv+LadTdSW0yo+AQw7TGXAz0k9nL0W0RRnlQ9+WJY7UyWPpCYWdx2/K5LPNy71t1VBlFVHYlnQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

This variable can be used in cases when we need to remove certain
CFLAGS for particular object file. One such case is
-mgeneral-regs-only flags that should be omitted when we are building
an object file that uses not only general registers.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 xen/Rules.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index d759cccee3..478318537f 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -179,7 +179,7 @@ cpp_flags =3D $(filter-out -Wa$(comma)% -flto,$(1))
 # Calculation of flags, first the generic flags, then the arch specific fl=
ags,
 # and last the flags modified for a target or a directory.
=20
-c_flags =3D -MMD -MP -MF $(depfile) $(XEN_CFLAGS)
+c_flags =3D -MMD -MP -MF $(depfile) $(filter-out $(CFLAGS_REMOVE),$(XEN_CF=
LAGS))
 a_flags =3D -MMD -MP -MF $(depfile) $(XEN_AFLAGS)
=20
 include $(srctree)/arch/$(SRCARCH)/Rules.mk
--=20
2.47.0

