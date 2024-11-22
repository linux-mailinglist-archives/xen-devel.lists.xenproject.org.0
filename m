Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D709D6537
	for <lists+xen-devel@lfdr.de>; Fri, 22 Nov 2024 22:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842002.1257466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasR-0007Dn-UT; Fri, 22 Nov 2024 21:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842002.1257466; Fri, 22 Nov 2024 21:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tEasR-0007BQ-R9; Fri, 22 Nov 2024 21:07:43 +0000
Received: by outflank-mailman (input) for mailman id 842002;
 Fri, 22 Nov 2024 21:07:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tm/o=SR=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tEasQ-0006xA-Cp
 for xen-devel@lists.xenproject.org; Fri, 22 Nov 2024 21:07:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20624.outbound.protection.outlook.com
 [2a01:111:f403:2614::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cded252b-a915-11ef-a0cc-8be0dac302b0;
 Fri, 22 Nov 2024 22:07:38 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by PAWPR03MB9738.eurprd03.prod.outlook.com
 (2603:10a6:102:2ed::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Fri, 22 Nov
 2024 21:07:33 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.016; Fri, 22 Nov 2024
 21:07:33 +0000
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
X-Inumbo-ID: cded252b-a915-11ef-a0cc-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjI0IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNkZWQyNTJiLWE5MTUtMTFlZi1hMGNjLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMzA5NjU4LjcxODkwMiwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOhZIL40V/Nn3Nr8jf7dyQjk78wYeb7xRrCxGc/tHb3ui5uRjtOmc1Mno5oZBuCQugk1pomgajMBOZJHTkFExDDjNXZNiTLBq4yPFC5eNg/gR/aH6MnVBbbs0hc8yVOmNRd0bQobbBJfdE786Gb5HUBdPNtaTg5AfnQlOdxAu0upPLbpAauHZbTlVHHp9Y5SOrLeb441Jfkx4yQ8R0yHaLiuEpYqbsNx501ju9fkbpI9Z1cOIaT9D1212Fy4AmRPwLtVbVdN6Tj6QwfQ632bc7a7+P5pHOX4JDHSFdICpvjFk6gjxvQB5xs22DNp7ZHIf2GfTQ+amCHCaFul42ZjzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNlNjXvfJVm1fbN8Mlag5X39oGFDKabRNL8lFdyjINQ=;
 b=ETfWokfsftBTMWlAP2/XzVckgU0HSJ+jX7Lm02TZhCrgq6flzj+s/R0qUfRiyJADrMk9Em8VAgzbDbxrvJ27hFXn2oSdqnhwlxTrR3cTkFrOdYsEQ0Q6zmk9oyvhzBD2pG0WRLroeXyIehvhrcMswsuMSZftbvX2tB45V9E89YqoPDEAW0uIGaPbUFVq5qYRfVZvCGyOn5L74TZTZOVfAUVlomLTat4Fvl0sU7rvUf0ki3EEoeowTlItbRzo4TuiADcBAM+UMQHz/xZRWACBpooEUAzIi8uadYd+x2nRf1y6zsJVdZVwmPKATL7h3904H6GMUcYYNkd4tim0csu7uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNlNjXvfJVm1fbN8Mlag5X39oGFDKabRNL8lFdyjINQ=;
 b=DMMeYNkOxbZ63EYB8U867/Ri28w2iqf4yLgi9C6wnY+3OGD6qda4OZh5YHmOOM8XjkZ6Dn5hFN5ZYh42WGCzGrxQwJNCsB56TWKkXnDVDLiQSruAR37IAMlHlI7i7wlIfa+FMzPCY/1vtBqE8Ry7PhYv9QzXDLg+bo0IRdxzXOyWGlikqnZQ+ep1AL8cXbRueeKZEoLey16nG6Pi05BnEEpDxlonkUyxAB2DH4PhGhZZXidj4ryXEoFLH9fp9MQmTkpZ3c/S3uP0XndDuSvQZaLbdRws8IspzR6tT00uzhpwpoj/OkT3gV3/n2eNTvXE/CVzL5DtYRGdKRrcCYFAng==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Samuel Thibault <samuel.thibault@ens-lyon.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] xen: common: add ability to enable stack protector
Thread-Topic: [PATCH 1/3] xen: common: add ability to enable stack protector
Thread-Index: AQHbPSKKCRg4722UIUuMGLA9PEEyZg==
Date: Fri, 22 Nov 2024 21:07:29 +0000
Message-ID: <20241122210719.2572072-2-volodymyr_babchuk@epam.com>
References: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241122210719.2572072-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|PAWPR03MB9738:EE_
x-ms-office365-filtering-correlation-id: b0bbdf27-da14-4f83-6faa-08dd0b39af00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?DKQUg+TzQpo7IG5DnsdqPQbmPA+uelJ8+lUk/CUrhsgqFveQlfih7Hiyum?=
 =?iso-8859-1?Q?J7a7+WAvqr/PlW83ZNsCRwpeluSwR7tcyW53Wi4ZU/+pe/6olSpTnbTZsO?=
 =?iso-8859-1?Q?FxUqSsj8889gcYw9auQPozOjTQUriMKwIPfp/im/gn51yXHt2F89dR2t7J?=
 =?iso-8859-1?Q?X3KtJDTWzP9t59lRRGuzlUdyZj6fxfLv7uhoG8LSVCzZ5J+2gYSqMQDBho?=
 =?iso-8859-1?Q?p1sfsIxrPWJHNjb/TObyfYW03jly3Llm9Z+PXecGdp1PrfsLT6e1n1DEbl?=
 =?iso-8859-1?Q?OT89yeyT6AcBBTNFNzop28ukPf6p28XbF7JNPdP6VImyvI59Edmuxxo5Fj?=
 =?iso-8859-1?Q?4SrChCQWZXzEYMc46tT6EkePVNxOaj55UMCdg7XoMNrD5JX2vDKGzkym0u?=
 =?iso-8859-1?Q?x8hZORVDjNPdKbGMwTaYGwUWxIEpLkLBpMoV2W7aj6wAZS42Q3bcm4uT9W?=
 =?iso-8859-1?Q?yh7FLvDor26veWeQiUlCgYgNAuDsdzMbbdgeOi6jh8cBJawE0/074oqRhn?=
 =?iso-8859-1?Q?bJzSWrX/vt5jY3TfiG8aqj7JN7nRHmWVqzHELJmXS2PuE97hzT2Kbgq/Qv?=
 =?iso-8859-1?Q?KGsqEtoTwHye/P3bJ2i2OpZQHND0JbQ+PPtG1BvI9TufRL1tcD4VaJ6J93?=
 =?iso-8859-1?Q?HeMocA26fLaCZaGlm7AnxTmJdZNIej+T/MNRkbgw9TPS2pwLT9lUD6QGEz?=
 =?iso-8859-1?Q?tigrb6sqPU1CCJCZALF29ErlsMwifE/CzuKt7f4vrV9eyM3mftcMYs7t5N?=
 =?iso-8859-1?Q?8/h1NR2RiECxNvtd9eFh21W0FYJDg7+y/qEBhpgbq+uKB3IBFMxjXkQjUo?=
 =?iso-8859-1?Q?PO/nZPVBbnwSSNNvIZXjCK84hk6bNuYYGPszqp8veJ+Uxbnqb5h8CaWyaj?=
 =?iso-8859-1?Q?RLIEyWp3xCKAU91i9sQnDepWrM93cRB20DL6SnVfCsKKgmQulqBj9wuXyd?=
 =?iso-8859-1?Q?JWtc91+/l3Q+5vb4LFerhhcCFhPKdYwtrpXf4s5Lhccm495j6l1dEDMbQP?=
 =?iso-8859-1?Q?zAVIK2utkvZbAIhXi3Mbkq7SqJ5KGyvtEtxu50gn4ihddkPbSwNq2HUdNt?=
 =?iso-8859-1?Q?fy9CioL9pnlK7cbEk8q+ddoKi7ufVS4GgDb33vnJGFF2TyAjvPEXPsle5w?=
 =?iso-8859-1?Q?SVTcpVCOW/ZUmcfE7RgTCyKOHZOXEngRsUhlZ7MQ6recSU45Z+18hcBSbR?=
 =?iso-8859-1?Q?NnsDw2cikGZ7etOMNnd04Js6Vh6GjDOQZrGuo1P5euH7To8UFAktIqeYkA?=
 =?iso-8859-1?Q?ccnjZW1ZnmAUO8pwgBpol+x2xncgWqEo7vPqmYpSXwWytx4LjA05OBTVBa?=
 =?iso-8859-1?Q?fC0ja4FpO674WMFeg/BlWy15RiX2A9SM9DnRW09nLdZKM+p3UZrBMethQv?=
 =?iso-8859-1?Q?tJciEK+ZgQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?vj0VqqDdUDo4X3IZXk197zOxV7GKHVIwcibUexws1BOQRvJPwBsOV0vprL?=
 =?iso-8859-1?Q?nNXTlwdri6k53ngQFmUazmb7mJuB2v37vOlxBuuVBqDSjfFPZZTwuSyFah?=
 =?iso-8859-1?Q?RXQNaipwLzEqOJPtPskjPr/HDpK8oGx47wL1d8pt2uRakChgtxyoj87gqT?=
 =?iso-8859-1?Q?1iGchD0E5uZbAcbbAPPRK5REbNwcMDoMbdrFGNoJIYtoQi2EoaR8HbbWNt?=
 =?iso-8859-1?Q?f2b28qOgS3nKqN8CIWUu4BhT3paHQDuFZl895H4aQTe6vmIcfwiO0q+KGU?=
 =?iso-8859-1?Q?Hq1nUyPvqNXU2YIT8gbbifYHZKkVRmdzwXMbj/KZuPkHl+oYY5C/xc502A?=
 =?iso-8859-1?Q?mWiyNTV9T0STyjrE2juKQoSH81hS2+mIynVnF5eyurtjB0+g4kMg1bhOca?=
 =?iso-8859-1?Q?T3ARsBVmvCowKXX4uUPVrkQlnqhjNcfqBQwehHRtiZzHQxbkf7v6YkE2jo?=
 =?iso-8859-1?Q?uCd1BQ2d/ZbYt+2Bveq2SErWKd6GUyP8kTUkq+ZBCdWcEIBBljWKG51TLO?=
 =?iso-8859-1?Q?sedU0MNb16MMARtKnwQgckTeRox3O3zwi7yVj36XqjTyoLHSXuXwAWNEu1?=
 =?iso-8859-1?Q?3QDGR4OInac4UsHVzvgrnyOXmHomzpHN9m4zfxF6cQX5/FEz7YJQ7Br8JE?=
 =?iso-8859-1?Q?zLXeg5a2JPNUN6NEqCSJmaBzuryyImWUlRRlXyDtidBZv67lip7ZH6aHRu?=
 =?iso-8859-1?Q?HErnMApARIUTKdE9ANPSuinszRyp/K3ldXz/plAk4OcQxaF3qX63TuXVYJ?=
 =?iso-8859-1?Q?IIPkvdnpmUeM57O5010zTGfxBo6kWvJWsBAHSD31hI09V554EDOflpIi2L?=
 =?iso-8859-1?Q?qcIvQPsrioF1k+7AqjH1jGAgnADecli2PD17YOgfOXYt3qtY42P4V8BzzV?=
 =?iso-8859-1?Q?AEf8IsIoxHa7gsSCelD8r7MXkamBNPaRUT3kQGwkvnnHvgc+tCCQUU6E+S?=
 =?iso-8859-1?Q?tGRfF4U9Y0CgtGyvI45cGGJWuqeEN3dREtg5QyVKycV8Tk4Gba1FJnEnwq?=
 =?iso-8859-1?Q?ebHDtmxUFjQcaYKJuLjs3hiDiFVvquyvolT7TM+R+tClMzKKD0DjbwsE3h?=
 =?iso-8859-1?Q?JePpFdumyx/nlEE8PLdGRSBlfPzmW0oM2SBBqVIz8tYrVfqsp10wT2wtna?=
 =?iso-8859-1?Q?Ir0wkRMAR/U9SLduOpgkkGOvR3KQTEDjmQdDzIVvJFKt54CbGm5rg9ZyAL?=
 =?iso-8859-1?Q?MPDGoYxB6oPP9t6ClGu4FfioZNSkVootbK2DWPC5aKmckD+ou89uORWb6T?=
 =?iso-8859-1?Q?6MKlcu66KuDUu0GATwKdPRV+xpp+xlBOJyJQJ9GiYOc5KwcrCe2C3xmyst?=
 =?iso-8859-1?Q?IGXNcM65/m+jU2CyE/Q5VnadKbjAYF376fTg1MNVY+Q6e4cO2lGq7G4DJv?=
 =?iso-8859-1?Q?VrYxRKJzO/DxixC1Ylr0ZjYBLNSHdBPwUro5z0rzqON/X3ZfZRqOJegC9l?=
 =?iso-8859-1?Q?z0yFI/kSN/ymGLeLI7b5nVotHJYR7DFhHx8lLD0ccZg/2IdqhC31/kjPIM?=
 =?iso-8859-1?Q?XfmQaS4JTWmcbbmJOANFPIJlufO012/76N2Q9Sp61HZdTr6SL08ED44sS9?=
 =?iso-8859-1?Q?zXdrUo4Wutmg5QsZuSETztNOmiLx3aKknOeWKc4Au4rEpdmujSP6+b7/G+?=
 =?iso-8859-1?Q?Tmoz122NqaoR08no9S74WgRiPO6hHSmqdCcCuPY9kGtL2/AO4Pik0AdA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0bbdf27-da14-4f83-6faa-08dd0b39af00
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 21:07:29.6659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: igXOCkrOe4Tzz2Nto8WxFLZSW9QJuA3B5aSPjw/Qi2duMO3zOp1ofuQrO+6V+PR3YgNhZof61iQQ6cBY8KKuS1CkOt4BYBzJW4yng1xaWhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9738

Both GCC and Clang support -fstack-protector feature, which add stack
canaries to functions where stack corruption is possible. This patch
makes general preparations to enable this feature on different
supported architectures:

 - "-fno-stack-protector" is removed from global config
 - Added CONFIG_HAS_STACK_PROTECTOR option so each architecture
   can enable this feature individually
 - Added user-selectable CONFIG_STACK_PROTECTOR option
 - Implemented code that sets up random stack canary and a basic
   handler for stack protector failures

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 Config.mk                            |  2 +-
 stubdom/Makefile                     |  2 ++
 tools/firmware/Rules.mk              |  2 ++
 tools/tests/x86_emulator/testcase.mk |  2 ++
 xen/Makefile                         |  6 ++++++
 xen/common/Kconfig                   | 13 ++++++++++++
 xen/common/Makefile                  |  1 +
 xen/common/stack_protector.c         | 16 +++++++++++++++
 xen/include/xen/stack_protector.h    | 30 ++++++++++++++++++++++++++++
 9 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 xen/common/stack_protector.c
 create mode 100644 xen/include/xen/stack_protector.h

diff --git a/Config.mk b/Config.mk
index f1eab9a20a..c9fef4659f 100644
--- a/Config.mk
+++ b/Config.mk
@@ -190,7 +190,7 @@ endif
 APPEND_LDFLAGS +=3D $(foreach i, $(APPEND_LIB), -L$(i))
 APPEND_CFLAGS +=3D $(foreach i, $(APPEND_INCLUDES), -I$(i))
=20
-EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie -fno-stack-protector -fno-stack-protec=
tor-all
+EMBEDDED_EXTRA_CFLAGS :=3D -fno-pie
 EMBEDDED_EXTRA_CFLAGS +=3D -fno-exceptions -fno-asynchronous-unwind-tables
=20
 XEN_EXTFILES_URL ?=3D https://xenbits.xen.org/xen-extfiles
diff --git a/stubdom/Makefile b/stubdom/Makefile
index 2a81af28a1..41424f6aca 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -54,6 +54,8 @@ TARGET_CFLAGS +=3D $(CFLAGS)
 TARGET_CPPFLAGS +=3D $(CPPFLAGS)
 $(call cc-options-add,TARGET_CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
+$(call cc-option-add,TARGET_CFLAGS,CC,-fno-stack-protector)
+
 # Do not use host headers and libs
 GCC_INSTALL =3D $(shell LANG=3DC gcc -print-search-dirs | sed -n -e 's/ins=
tall: \(.*\)/\1/p')
 TARGET_CPPFLAGS +=3D -U __linux__ -U __FreeBSD__ -U __sun__
diff --git a/tools/firmware/Rules.mk b/tools/firmware/Rules.mk
index d3482c9ec4..b3f29556b7 100644
--- a/tools/firmware/Rules.mk
+++ b/tools/firmware/Rules.mk
@@ -15,6 +15,8 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
 $(call cc-option-add,CFLAGS,CC,-fcf-protection=3Dnone)
=20
+$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
+
 # Do not add the .note.gnu.property section to any of the firmware objects=
: it
 # breaks the rombios binary and is not useful for firmware anyway.
 $(call cc-option-add,CFLAGS,CC,-Wa$$(comma)-mx86-used-note=3Dno)
diff --git a/tools/tests/x86_emulator/testcase.mk b/tools/tests/x86_emulato=
r/testcase.mk
index fc95e24589..49a7a8dee9 100644
--- a/tools/tests/x86_emulator/testcase.mk
+++ b/tools/tests/x86_emulator/testcase.mk
@@ -4,6 +4,8 @@ include $(XEN_ROOT)/tools/Rules.mk
=20
 $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
=20
+$(call cc-option-add,CFLAGS,CC,-fno-stack-protector)
+
 CFLAGS +=3D -fno-builtin -g0 $($(TESTCASE)-cflags)
=20
 LDFLAGS_DIRECT +=3D $(shell { $(LD) -v --warn-rwx-segments; } >/dev/null 2=
>&1 && echo --no-warn-rwx-segments)
diff --git a/xen/Makefile b/xen/Makefile
index 2e1a925c84..0de0101fd0 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -432,6 +432,12 @@ else
 CFLAGS_UBSAN :=3D
 endif
=20
+ifeq ($(CONFIG_STACK_PROTECTOR),y)
+CFLAGS +=3D -fstack-protector
+else
+CFLAGS +=3D -fno-stack-protector
+endif
+
 ifeq ($(CONFIG_LTO),y)
 CFLAGS +=3D -flto
 LDFLAGS-$(CONFIG_CC_IS_CLANG) +=3D -plugin LLVMgold.so
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 90268d9249..0ffd825510 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -86,6 +86,9 @@ config HAS_UBSAN
 config HAS_VMAP
 	bool
=20
+config HAS_STACK_PROTECTOR
+	bool
+
 config MEM_ACCESS_ALWAYS_ON
 	bool
=20
@@ -516,4 +519,14 @@ config TRACEBUFFER
 	  to be collected at run time for debugging or performance analysis.
 	  Memory and execution overhead when not active is minimal.
=20
+config STACK_PROTECTOR
+	bool "Stack protection"
+	depends on HAS_STACK_PROTECTOR
+	help
+	  Use compiler's option -fstack-protector (supported both by GCC
+	  and clang) to generate code that checks for corrupted stack
+	  and halts the system in case of any problems.
+
+	  Please note that this option will impair performance.
+
 endmenu
diff --git a/xen/common/Makefile b/xen/common/Makefile
index b279b09bfb..a9f2d05476 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -45,6 +45,7 @@ obj-y +=3D shutdown.o
 obj-y +=3D softirq.o
 obj-y +=3D smp.o
 obj-y +=3D spinlock.o
+obj-$(CONFIG_STACK_PROTECTOR) +=3D stack_protector.o
 obj-y +=3D stop_machine.o
 obj-y +=3D symbols.o
 obj-y +=3D tasklet.o
diff --git a/xen/common/stack_protector.c b/xen/common/stack_protector.c
new file mode 100644
index 0000000000..de7c20f682
--- /dev/null
+++ b/xen/common/stack_protector.c
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <xen/lib.h>
+#include <xen/random.h>
+
+#ifndef CONFIG_X86
+/*
+ * GCC uses TLS to store stack canary value on x86.
+ * All other platforms use this global variable.
+ */
+unsigned long __stack_chk_guard;
+#endif
+
+void __stack_chk_fail(void)
+{
+	panic("Detected stack corruption\n");
+}
diff --git a/xen/include/xen/stack_protector.h b/xen/include/xen/stack_prot=
ector.h
new file mode 100644
index 0000000000..97f1eb5ac0
--- /dev/null
+++ b/xen/include/xen/stack_protector.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN__STACK_PROTECTOR_H
+#define XEN__STACK_PROTECTOR_H
+
+#ifdef CONFIG_STACKPROTECTOR
+
+#ifndef CONFIG_X86
+extern unsigned long __stack_chk_guard;
+#endif
+
+/*
+ * This function should be always inlined. Also it should be called
+ * from a function that never returns.
+ */
+static inline void boot_stack_chk_guard_setup(void)
+{
+	__stack_chk_guard =3D get_random();
+	if (BITS_PER_LONG =3D=3D 64)
+		__stack_chk_guard |=3D ((unsigned long)get_random()) << 32;
+}
+
+#else
+
+static inline void boot_stack_chk_guard_setup(void) {}
+
+#endif /* CONFIG_STACKPROTECTOR  */
+
+#endif /* XEN__STACK_PROTECTOR_H */
+
--=20
2.47.0

