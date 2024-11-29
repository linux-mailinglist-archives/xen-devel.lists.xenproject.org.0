Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCC69DBE71
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 02:49:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845647.1261004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8I-0004bY-Qq; Fri, 29 Nov 2024 01:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845647.1261004; Fri, 29 Nov 2024 01:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGq8I-0004ZU-Nq; Fri, 29 Nov 2024 01:49:22 +0000
Received: by outflank-mailman (input) for mailman id 845647;
 Fri, 29 Nov 2024 01:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Fhq=SY=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tGq8H-0004ZN-HD
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 01:49:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20607.outbound.protection.outlook.com
 [2a01:111:f403:2614::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24a6ae89-adf4-11ef-99a3-01e77a169b0f;
 Fri, 29 Nov 2024 02:49:17 +0100 (CET)
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
X-Inumbo-ID: 24a6ae89-adf4-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxNDo6NjA3IiwiaGVsbyI6IkVVUjA1LURCOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjI0YTZhZTg5LWFkZjQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyODQ0OTU3LjE1MzA1Mywic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcBursqTkwlaQrLG5sDu2k+Z3UWX2VZyzZMHxUzSSEZ5hC8afwJHFdv67vYoV/yDq/KFB3JXZzGXxtAJPRiI/9II3MuYHg+LhbrVBUJ0ChAFzTW1XEEep+gF3a8CspqR2AZFQRH4G5krpZZZc+FKHZv6y8Fud8rJWghxR/d8nJhD9Qf1uq9f/vJwooTnvXfDWSSW1T2xLlj6P2A5JQwX3VQJ4t0YQx6Sv+RfmhMgn4nDztmru7K2RE8qxyB4syd6hnKsqAJpxny0eYcdfcHGhZruyfQvS5F+tZYTORHhIkQFbSl5aHNbQg4p39azeHqQ1pdlfZQ+hdKzX1ILZDsnCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kqih6yfoliSqu4Tbh2SQlCEAACi38qPHAM/1ieOhAjg=;
 b=Lb8A8nwGOVmAdhyC5Qt8gg3gpcXhOOle2ygdwUYiSnlydq+yVDAJ9rC0BIIBBWTOFS1liyGNRrUFthTL4Ph1RtudbyzG8+WBB2YPuIwKRoLIoj/SQ9NgjgXP9Q6CBawDBeOhJZ0p4mDz72M2ruyNoBz+cn+6mGbxRNqX6RrtNck2w1VmJQ3Q148bbVtB9Wr6sw6f3g+h+/jusXal7Xk0L/unDR7hf+MGmuUnozGIHwVwIKz9xG+7qYZj717q30J+PFEPwXlukaPOIX+eFPCIdwEw7aVwgxX1YBng0wMBqJcTHnIsX3WN29/Qn1iVG/Qq1CTraiZHhiPnM84QsEK4yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kqih6yfoliSqu4Tbh2SQlCEAACi38qPHAM/1ieOhAjg=;
 b=iV+s8dZQGxq8gKdV5CExd25F+91htAFnn2z6Y67EU1y7KyFEaD7XsL5/oj1VOdzKsYlPOBGCcOMiYhEXC0sZ+DpIiU+0qYp9ytPUe55ZZf4NgxwY243uuckc6t/wXjE8VZlwk1voiWQF179+4x0zDD5/45KdylyYUSV6RfTG9FODXVhKpmbuuAeCJcRdlNPc255DXyTzMJK1WNMIEQlSbHn37a69knWjX0YZTd0qrHGYJ/DCVyndadEbQCqIJdlYR3r68aDvboKRJ6rX78Y11XTxkW4YJOHdxjzyO62jfaLxi+YL+mU1OfN3/TC06tmAfpwlnqj3tdjXHWNqlypXEA==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/5] build: arm64: provide -target and -march if using clang
Thread-Topic: [PATCH 3/5] build: arm64: provide -target and -march if using
 clang
Thread-Index: AQHbQgDiBM9r6Gu0CEmbvf51boI0mQ==
Date: Fri, 29 Nov 2024 01:49:10 +0000
Message-ID: <20241129014850.2852844-4-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: 165cc14e-36ee-4cab-4c47-08dd10180681
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?k/7F6/V/kCmzyHsrpm+/wJ+JHn8r5zKO93IaroKqugUrcxwS6ITT957PNa?=
 =?iso-8859-1?Q?c4zbhVMKGL6pfzpddxDWShdmdvH/TCdfAAOXdtkiq4E6SNDGSQEAjQ/QX8?=
 =?iso-8859-1?Q?gi1uTuO4ww/4bKm4CdLPe9WMX0LdMwtIc3PRpm0iYMND7VieEhvTc0LyQd?=
 =?iso-8859-1?Q?Z1nq3C/qCC7A/SGtRRoiL3XAJXCfIaVI9UWkT4aosB96iSt2k9TbQ4uZZa?=
 =?iso-8859-1?Q?vIhK/jfi60mQvK50KfvnZ2ewxC0aotvAGDR6BN+tIlmyusB9MXzN4onso2?=
 =?iso-8859-1?Q?EEPtJmBUfYbczafz9cJdKG0//HFFRQIYTE4IW7REpD9Vp47aOUqO7DQ6Vh?=
 =?iso-8859-1?Q?QfWRvCl7Xumn0jJ0FEyFDPwOG6jesxt2Qe1FfELlBn9LI4WcVQjBvNDmbm?=
 =?iso-8859-1?Q?9pIuxSJOrBYz+qQ9S+ckRWUhn+zXNN6pZ5+qJyXdRJcP8uEqyfr5hfgxek?=
 =?iso-8859-1?Q?78YcjGdLwYhQxkMX6kP84sbJLpSQsCSfwFQ1nch2W3Abk85JNMFJuoGp3m?=
 =?iso-8859-1?Q?noBVUkrRxR1X5OmBKCfmygcxMPoXsVHEdUrZp9Zw+YyMCdzURcbL8t63d6?=
 =?iso-8859-1?Q?qQzhuDTOL33/Mkfnlyu1seHzbGoor1cT0sMOOkWLZil1BP8N/E2zHoDOU1?=
 =?iso-8859-1?Q?mp4hbYSeDYdd7hAMOGR4BPYwas+JI9y+MXH4nQUnskJGjRdDSkRQLuNcpG?=
 =?iso-8859-1?Q?PJiaHhRfrFujEOGUi1pa+XJXfJKgI0qvRILEtETlkgfGoF2oXhj3aqcGDn?=
 =?iso-8859-1?Q?EuiSCrQjEuScjjlvkttl/6ZhT8Zvt45CoZtGwFA806aRr7IsPqsbb99uzz?=
 =?iso-8859-1?Q?D4WzD8SqB5yYpdr1s8K2NK13j9dF/NtIUoQ/E+fExPAfnxhG3BUdxEbIJ4?=
 =?iso-8859-1?Q?cBiwcL4un2Loj/hvQqhewra+lfd6IqcCHfh982aRvxF9mqDO0QQOYxVKDz?=
 =?iso-8859-1?Q?oMWTi3VBiUCeUK6drZTuh5MxDotWZo+CWeyOpTezGIvHPD2eC8CQe1viT0?=
 =?iso-8859-1?Q?Hfv4EVxhVlnkGpvX0O1ejl4TF7svJV1gNNTSeeBbUEz9nwoBh4r43cfbb7?=
 =?iso-8859-1?Q?QvV0egHAsdcp8u3Boc/+gg5n8bMpyBvUQoqvwwgpWxZMNl1sx78Y5NS9lO?=
 =?iso-8859-1?Q?0RnL8kTVudQ+gUyZ5YzRvoDn3CF9Ht1vhEf3+WLuNX6nOG/DqYV7em04Mj?=
 =?iso-8859-1?Q?8pl9MPbXx4/bf11txMVOad7ft0/7MOBB4KD9CeGZ5ZHk4vqW6w+/8zj+gJ?=
 =?iso-8859-1?Q?3ROPb+8g8c1q5d/YYcCTZ+FoL6vpHInJF9l3js3y3Ooh/2a3kjjP84+YjE?=
 =?iso-8859-1?Q?/dZfSvZ48ITk85rFHL2UuulBQsZ+QqXqajuiYTMZhSw4PzH5NJY/bkahzD?=
 =?iso-8859-1?Q?OqGOyInAagxzVBPQN0qnP7i2Kl82uoSqAtf6eItX8fNoLw2jpuHsnFfFSK?=
 =?iso-8859-1?Q?/Dk11h+6lnbLuxaDoqkUE06ITiRGAUOTsz28cQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?7Ki0+8o/D1vvq5tR6nMBcswr7bHft881XqevqH5IsvexwoyJ01EvAVhwOO?=
 =?iso-8859-1?Q?eU7+J/gAYtNTqHRpgS+kektFjchUCXWyXymJlLIVc0PX3jjJKcYAKOzuFX?=
 =?iso-8859-1?Q?9T+5unoH/DWchiUvbTJqN4mdzjEI37faUruxL45ZgCgyjPbwcmw0jrVcce?=
 =?iso-8859-1?Q?6hxqXsE8ao0vAzLo+v8il7e30hEWkxhm7IPioNAOL9ZRtV0nlfO1Ak+uRO?=
 =?iso-8859-1?Q?bTK9VOmP8yPgQL703Mob7YWs8pyXxn2nBlCx+v5vgY69/APXprvHpfYdPy?=
 =?iso-8859-1?Q?PC30oWog6747yTicNBB89fWbCD1DxpqwFkf5FzfqAYCZ3O25a3opEsEib8?=
 =?iso-8859-1?Q?eqzgMJbaDD8lRK9Pikh8BKHxT6dvPKEBiDvxo5NDmPz8tfOsJJZ/Anfbon?=
 =?iso-8859-1?Q?yF0U0oa9z7ZDVpjZnfaE//zsK+y1Uvbk6e1kU6oyLEOXpBOvrGeBDPp6EZ?=
 =?iso-8859-1?Q?wLdWPli6Q41St1qoTm1/VFHTDTXN87v0puBxGok8U9E4kz9rJlgaJeWT3i?=
 =?iso-8859-1?Q?/CP4zm/npS2lCo/2Nhe/VPeg3Gq/R0OLijJST/SwTfkj+/8BbM6KikDSJN?=
 =?iso-8859-1?Q?NaIrD5kgE8lecBrblWNvWCI8BvSOUnHC2eglHYh4IgrTGedXy/Xbh+5R05?=
 =?iso-8859-1?Q?qWMyd6dGkdPMQKwlunGsznN27sT8Llr9wrqs1l0UhUwdSvRWSLizLiL9Vf?=
 =?iso-8859-1?Q?9rj1NGjK2jnPCXUlRLCsgC8EdLwm86/L5mwgSffTNpmPWJxgjuxa/ePohQ?=
 =?iso-8859-1?Q?itq8h5mxaw20q/dSaunHbH8T8h6XeDy+UFhA4oiwBLMC6HI80TxasqLNiq?=
 =?iso-8859-1?Q?ZeFjenHQCU8jALuf2KIofw0iaMf5AWCh6VgfrP0izjqGq/ickPanSTp/Jw?=
 =?iso-8859-1?Q?T0fsFc0hsuSVzPfjysZd72r5Cug7FoFkwQfXDO9P91n20CR+WgmYddCcXY?=
 =?iso-8859-1?Q?QpNIIpgB/dIQcYFquAYLbn0mIYCV7WD9EvJJOoKZSvF3EQXI3RgY02EmJv?=
 =?iso-8859-1?Q?c7jF/HmFy/+9YRoIeXk0aIdhftmFittj1ef/0T98n3fZoL/HC4RATIgzDE?=
 =?iso-8859-1?Q?tccyeoddXaswG3xc9JhxRhsSXDclFzSVGiU7ZNI+7nhX0Xm1KW7/gEIDhl?=
 =?iso-8859-1?Q?+xH+qHKNHrJP5OIs9hMb8AZjxvkj4MpEW3idD/FVIQghH74eE3bfLDV1IF?=
 =?iso-8859-1?Q?ftyKtgqdvt/6J9z07l8YnxRn18uRISL47Luos8T3xiIuPJjDVIgFEDfW4T?=
 =?iso-8859-1?Q?DNbEiQFmuiqE97zmE4Drl5nwCGGJfwqmXTdJfu2r7EJx/vreReRmUd1ab2?=
 =?iso-8859-1?Q?1iH/YBXYdOPuecxyC0TOu1czFPiRNKkVMIC3/7aA1Zu/GhDtrw5/313sm2?=
 =?iso-8859-1?Q?jAZbiOukmb9RBWEjV7qgQpS5AHAtBUgjbTatSdoBkIZDlDu5DLZDS3Pyjq?=
 =?iso-8859-1?Q?/6EOz6/Io+PHsBMkfRq/fgAoD8BfOQ5gr4X0JB807bz816AvJdc9kREqJm?=
 =?iso-8859-1?Q?rUrn0Qb3cQ1kvDEsIbr0WOa0zNeQYKGBhMxDeh8/oZl3fX32QUtVbZfmlX?=
 =?iso-8859-1?Q?0dvtdYZKsaOO3tXHGxVg16YzLXwWJElI2S4SuAyzxMULAFaYkM+bK1g2m7?=
 =?iso-8859-1?Q?XFdEKf6cRBS/68qmQEIPKVWCEJmtTikXLukSZ2zKKt1ZT0W1brIwVfCw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 165cc14e-36ee-4cab-4c47-08dd10180681
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2024 01:49:10.0098
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lsiy5oN3ID1qZdSaOKK15xr14+CggKLAV/EPj/NAXqgDf/UldSHAg/3KRpW/93+Vd8lwmHPI5IFAxNrDO9ca4VSCBfq0pnm+lMwQvpONNVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB8923

Provide -target and -march explicitly when building with clang. This
makes cross-compilation much easier, because clang accept this
parameters regardless of host platform. Basically,

  make XEN_TARGET_ARCH=3Darm64 clang=3Dy llvm=3Dy

will behave in the same way if building Xen on x86, or on arm64 or on
any other platform.

-march is required because with default value, clang will not
recognize EL2 registers.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
---
 config/arm64.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/config/arm64.mk b/config/arm64.mk
index c4662f67d0..97eb9a82e7 100644
--- a/config/arm64.mk
+++ b/config/arm64.mk
@@ -5,6 +5,10 @@ CONFIG_XEN_INSTALL_SUFFIX :=3D
=20
 CFLAGS +=3D #-marm -march=3D -mcpu=3D etc
=20
+ifeq ($(clang),y)
+CFLAGS +=3D -target aarch64 -march=3Darmv8-a
+endif
+
 # Use only if calling $(LD) directly.
 LDFLAGS_DIRECT +=3D -EL
=20
--=20
2.47.0

