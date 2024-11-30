Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C29DEDF8
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 02:11:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846087.1261371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0F-0004p7-04; Sat, 30 Nov 2024 01:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846087.1261371; Sat, 30 Nov 2024 01:10:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0E-0004mR-Sm; Sat, 30 Nov 2024 01:10:30 +0000
Received: by outflank-mailman (input) for mailman id 846087;
 Sat, 30 Nov 2024 01:10:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1+J=SZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tHC0D-00044C-G4
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 01:10:29 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2799066-aeb7-11ef-a0cf-8be0dac302b0;
 Sat, 30 Nov 2024 02:10:27 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7694.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sat, 30 Nov
 2024 01:10:16 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 01:10:16 +0000
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
X-Inumbo-ID: e2799066-aeb7-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJkIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImUyNzk5MDY2LWFlYjctMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTI5MDI3LjQ4MTM3Niwic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dJGgNN3u03vI/zEaAexMLmSK2Zk65WXniXdHACi6cyM8r+F0r2FXdIpV3O5XL7T9DGmqoklF4im4QHVe9TDJz2NqD/6OmtPsDgb2/5JYQP0qgw8zqGsVqH+nM9Q0jkajP7k+07dAhzlJcsAWmWuKHTmh+g+B4DriZ01lZnYzb10vsrCKXOPGMMuTN0N1V71Nf9IzXWbRrL/iefXkQ2Gz46ivOmjqzrsdc8SfdQe1fgEkswMBH4PV4pbmWLV8xU6Gbm5DmfMu4WIUxqeI8KVXyIfUF4Mg+KXKtOFGjVADbWqR9WM7lpAi++XEq3X7mIYe/fEyYbiyhWjfzXhOEVz1Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GsamCxU4DN+NHcKP8lPzqtJEu/j5Oky0k16OeYjFl0=;
 b=lp99NVvkken8eGyMkGD+JrsaN1ZI2NfxRM6h5GFUEFjJA8T5yhh00gZzK2dYRRVUGCYtrmD1G/SOIqocgboZ8ZGdLJwmGBng2PdMxTm4bDGJrEnCwPG4c+nOj4QplbXA1vFs1M/9iLXNQafT+7QlqwZ1UiDHbVkA0+X6ipEVknARbtGiU48yGEknP7muSu2rNXCOB9zu/8++JhN9FxtcLF/OSbg58Vx31cB/kXSMPESgqzOf03B1/4Zqv0L+bWHOzip6oVa267kj9wVGJLs4xPGc2GqmpDr6v/XZbbWqjlfrs2Wm+VIEGCUYXOj6IhrhLzA7gYTK/wLcNP5DHBRN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GsamCxU4DN+NHcKP8lPzqtJEu/j5Oky0k16OeYjFl0=;
 b=ESjXKrQw569T3+U6ohQnUqwuP94i1DzmsjeDPVIfej6Tw0mkRzsJgVxyFMH9N9xClCzmatafnhbM4ZLMosnwUv1kDOjFdTjHHT4nijevx5MU0kW3uz6cpBt6bVz8KDs8OCuxbp4SK4IYJJ5oaebwJo03QdkZZ/a/83RNkHL7+3Z23ySNxRU5czgU2+Jl4ZV/aRlkQ2Z1sEADr4VBWk1Wg0rhW4C6DpRACek2dWP0h0KNt2engewxtyvkQBMTt1vCcrAdt8MLihifG17fIK1XE57QDLUfMaIQtiOlA7DARqEcrHCW3JKlk4HiwvKYylg1b7JoDs8NBBY2FaucDmuH6w==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Topic: [PATCH v2 3/4] xen: arm: enable stack protector feature
Thread-Index: AQHbQsSdZeSazgkTckCfCx9gDu8jUA==
Date: Sat, 30 Nov 2024 01:10:16 +0000
Message-ID: <20241130010954.36057-4-volodymyr_babchuk@epam.com>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
In-Reply-To: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: git-send-email 2.47.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR03MB10456:EE_|AM9PR03MB7694:EE_
x-ms-office365-filtering-correlation-id: a3c86f64-0920-46bf-b577-08dd10dbc065
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?bRipTcm2C1tHjSJy+OQ79DxPH5BBdwz4nolXBL/9hMF/CDqAYvcarMCkXq?=
 =?iso-8859-1?Q?yMxzE/Ctk1otpwQGiHDjWA1lkY3bHRZZYrmtxmCCbhlAfYEUH1gLCUoRAZ?=
 =?iso-8859-1?Q?8WY8iYQXDzFXBWY19QrAz9M4EoHNEE6HI2yjnDXefDOdhFdxSxEFK13/Wy?=
 =?iso-8859-1?Q?Mpf/53jrqxkLOgC7+KNp6eSzf3r1OOGE7X/FEQKmcYmbW5t/X2FaKcX48Q?=
 =?iso-8859-1?Q?CdNhXbcuyKy8RF35vdx/1g+JmHUBhBRpoZTozfVRoHp9MqxNBtLKHHK21p?=
 =?iso-8859-1?Q?w4PPY/tBAnnnca6VqQZAGeByCdgPhxGpFtAQbYVuoWf8try4iiUxtHJe2Q?=
 =?iso-8859-1?Q?6NpoG9VZlNDQt7XO9i17kf1EsRN/9QYLV7ND/bp1wD7vG1Ps3t5uNMXrcq?=
 =?iso-8859-1?Q?XpbPdqgyZkkMwp9dPtaRLJjb55c5T7GskME7U0ck46giwyyUc73Ks5tv2F?=
 =?iso-8859-1?Q?k5JSdx3sX6/zFiK+gp/Eu0rPCVdoTeJInmeKebiJqqakqxRxX18AY5PmCH?=
 =?iso-8859-1?Q?YV0B0XekvJHegoGfHDxgxvZjPF7cEaaO2JzL4VjTjCGtzt0ufUmvAvW/eC?=
 =?iso-8859-1?Q?fhHOg78Rx8UnlLP4wlE8JdNBhGs3twFhNCx7+jYIQgjyIkz3bT6i2Fzjps?=
 =?iso-8859-1?Q?2ECCfIwHH/KcTkWZgtKdouAgDHh4+bihasRrcxPmXJ3jaEiNblCo6krpi3?=
 =?iso-8859-1?Q?FSLRtKeMTt0tWvkLD/l8ul2qVuY3KP2okJzMvi818uByAfpPaevYomqAa8?=
 =?iso-8859-1?Q?gXJZr2l0+ddu1XCYR+UvRtFTpzPNZb8wzDha8y6oabym/BeTjB4JCIJ6Vu?=
 =?iso-8859-1?Q?20nxBljGjbPgWUzr9JdksXLntW9czRomkyhWlWiI8EmnVVavcNQsoIR2Pt?=
 =?iso-8859-1?Q?ckheaC4kTbsPJrygzYtOA7pw/od1au6+yLYIO2SVfIAHALlHthYkEsdbqh?=
 =?iso-8859-1?Q?N5MMnG7CrEv1KJHJBa8NjQ+XYeFW/PFtzOfm3VmXpm4xNwWSoIt1BSz2nm?=
 =?iso-8859-1?Q?+Ibv/pchvWRKoLaqbEXsrR3oFQCN0hP7inYECvsEdSpZ+sdtf/HjNRdXHQ?=
 =?iso-8859-1?Q?pZksxO0+haVrmOqDOIG4smBdkTPyaviTSeqakLAQFo036bGW46xBq5rggd?=
 =?iso-8859-1?Q?xLRXJq2Ew9fF2gYgAHyhHXvSh6nI017sy0XAqYlImhUIgF9Mkw2ExlkinJ?=
 =?iso-8859-1?Q?XtaOvezl9umFLo6iEVUljS2Jkq894miFtFW/kLyQfRJEcRKem7DQ/v5ozH?=
 =?iso-8859-1?Q?EwUtIeq2Cl2CwAWlJha4/X9KDI5ekZDqDSonjZkA+dKkltmVQOt9I4EgmS?=
 =?iso-8859-1?Q?9QrWT/hnY0yPHP9w/0LPJxSrMioREQCKju6GbfQmb8tvsKIEXu+3768Srl?=
 =?iso-8859-1?Q?uwCv3jXXJA5WjcpwMFPxzAD5dKuUQixpO5kelUSiVEvR4aq7rxbGg+oQZN?=
 =?iso-8859-1?Q?tvozmcaj4QbKsjHzL2y3Z7Powrguoif7iBBcXA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?nOhroqYjEZr1xhJrVW8pCTk4jsml6Kxveykifqrv0tG2E+W69E7boVcm33?=
 =?iso-8859-1?Q?YvHiRLlQhe6yqA4BWnOt1+I+2iH+pT0ypAJy4ALLbcFgIajqHFV8bTUfN/?=
 =?iso-8859-1?Q?Qwbfe6PIGps2tV+nksYkTcUErusBdY63A3zleVaZh+Ytf22zsjyUlWH6ZS?=
 =?iso-8859-1?Q?aBetpjo9XDQ3e57TdxTXzdWV8dlIFrb+mgxH9z4VDI/ts4uZjg1eFD1I7d?=
 =?iso-8859-1?Q?AbgYtsEgni7gIDXOeJ2+5yBzAMOe7UXxa2rPwqpi9oA0MRuQcPuiLTMZT/?=
 =?iso-8859-1?Q?gahSBxqtsPLP8WINEF6h/ybwyrHQHUnaUD6zbbLozyq1/xqON4dloRXmCX?=
 =?iso-8859-1?Q?h+2TUYIoZJzTh9XduZEAi4cugW9I9FelL0L53OluzFKIH2do33O63Vki5V?=
 =?iso-8859-1?Q?BIwqJjGwdlxE4IDdsWE+yFFaPuPL0KtiBCjLVg4aFztwF843p/Kv0U0Bc6?=
 =?iso-8859-1?Q?DIslb1IcIsbtbzhE/ZYkAV86lKcmc0NoWhlPwWEJfffQoUfHmbY/uR7R1J?=
 =?iso-8859-1?Q?fXCAE/F83K78tAg6rl+LienQPdSZxgfzgvhN86wQ+9SyBpLyz76B+ylxpG?=
 =?iso-8859-1?Q?H/RrTAz+CfwHZ2yoaxlCj6gED9DR/i6zFSlxPjVkGcDIpaKfADoHUz1sqT?=
 =?iso-8859-1?Q?nTa8xR8ZM4BM5086bF5ksIUmXRn1p5RYkLaLELOPiB81p4dqYHDbAWOaZ1?=
 =?iso-8859-1?Q?zGGElP8jo2JVfHjIM/FPx2Y9PUG3c3pxKjNO6GhHiGRou0dCrXa1PCDO0s?=
 =?iso-8859-1?Q?SAYycQbHp8pwSQUkD66/n12w/lBlUUkvAPdrxazjyOlfTk1YbaCJan44hZ?=
 =?iso-8859-1?Q?4mmW06oYhnJzLbGqGXxx188yuHU9nbx035w4UMqf8uDc8GWu0FPu/z/9XG?=
 =?iso-8859-1?Q?MN+kECszwtbeUQ8+Lu3peaJUXNtzmKwx3eYlmy/qcTIKMXjwpZq0BAzlgY?=
 =?iso-8859-1?Q?BUyccuWz/AdexVue6jvrlngrkF5DGr4YUCPaGq0vfy+EoCf42YoMKi9DLw?=
 =?iso-8859-1?Q?UpMwDYs8+Jut0wJMwS0yMSgCFaek5iwvJPKSNRCOTrfuggoprQ8HG283WJ?=
 =?iso-8859-1?Q?BROQROgnJv30yPBhLOxw2iOPW5EvszYRAyDEU0hDSMakKww7WVIPorBMG4?=
 =?iso-8859-1?Q?mqHRACyzR/8rhb8GxSeUG0gou5nQ1jw87TifDxnnWVhCN+bYcLWQQlBge0?=
 =?iso-8859-1?Q?4DiVBWUsNxFyGGWey3TDJmCrTiZ8W+zul5FpXD/PDcb8PtUFHx45nJz4tQ?=
 =?iso-8859-1?Q?QDxillcuRl9DpTGZeh4HZOc9dPZgMeCS39RGpJEgBJwSEmgvyRwmat0JMD?=
 =?iso-8859-1?Q?uZ+/wWDMOFyTspTo0G6tnis+wQll570I4vZawVTvw/hvmOXKHzyiaOUTeI?=
 =?iso-8859-1?Q?MQFZN7LS+qFID8mggSIXW40vE0luQi2V7o9MEHAvNs1iK82kJwH/ognNiw?=
 =?iso-8859-1?Q?sjQ9HSPwGGYd/6dDgXI51tcU3iKf7iH6wONi0HWixQ80SIMGb6x02PYHQi?=
 =?iso-8859-1?Q?DFyL8r4wBnsUrgw+0JYo1j/REWSG1rZG5pH/CUoClCT9EwiiH0YSetP3A9?=
 =?iso-8859-1?Q?LxIOgAaIMsAf4q/CLn/mb0xZgZ4GF1Z39lIZBxaEA6ss1v/7hGh5jCQHrh?=
 =?iso-8859-1?Q?Gvm42T0zkZ7iV8BUoqAHiHyZ/P5D05JC4pCzB2uaPUJyFf5THMS2RC6g?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3c86f64-0920-46bf-b577-08dd10dbc065
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 01:10:16.2832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dTYxlbX7Jb1Qk0SQ0QLzkPO3bKSZbxWLl0LdEcOJrrry+kyGOR39IBbqxxKggknROqf0p8ODu/uv4JQFumc3AYa5Cuhr6/yJs7vAnqIxEuw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

Enable previously added CONFIG_STACK_PROTECTOR feature for ARM
platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
function, because it never returns, so stack protector code will not
be triggered because of changed canary.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

---

In v2:
 - Reordered Kconfig entry
---
 xen/arch/arm/Kconfig | 1 +
 xen/arch/arm/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 23bbc91aad..a24c88c327 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,6 +16,7 @@ config ARM
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
+	select HAS_STACK_PROTECTOR
 	select HAS_UBSAN
 	select IOMMU_FORCE_PT_SHARE
=20
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 2e27af4560..f855e97e25 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -13,6 +13,7 @@
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/types.h>
+#include <xen/stack-protector.h>
 #include <xen/string.h>
 #include <xen/serial.h>
 #include <xen/sched.h>
@@ -341,6 +342,8 @@ void asmlinkage __init start_xen(unsigned long fdt_padd=
r)
      */
     system_state =3D SYS_STATE_boot;
=20
+    boot_stack_chk_guard_setup();
+
     if ( acpi_disabled )
     {
         printk("Booting using Device Tree\n");
--=20
2.47.1

