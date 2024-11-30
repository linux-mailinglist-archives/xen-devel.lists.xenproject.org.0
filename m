Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8359DEDF6
	for <lists+xen-devel@lfdr.de>; Sat, 30 Nov 2024 02:11:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846086.1261361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0C-0004Yn-P2; Sat, 30 Nov 2024 01:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846086.1261361; Sat, 30 Nov 2024 01:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tHC0C-0004X3-Kz; Sat, 30 Nov 2024 01:10:28 +0000
Received: by outflank-mailman (input) for mailman id 846086;
 Sat, 30 Nov 2024 01:10:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1+J=SZ=epam.com=Volodymyr_Babchuk@srs-se1.protection.inumbo.net>)
 id 1tHC0B-00044C-F1
 for xen-devel@lists.xenproject.org; Sat, 30 Nov 2024 01:10:27 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f403:2613::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e142c225-aeb7-11ef-a0cf-8be0dac302b0;
 Sat, 30 Nov 2024 02:10:25 +0100 (CET)
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 (2603:10a6:150:16a::21) by AM9PR03MB7694.eurprd03.prod.outlook.com
 (2603:10a6:20b:41e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Sat, 30 Nov
 2024 01:10:17 +0000
Received: from GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e]) by GV1PR03MB10456.eurprd03.prod.outlook.com
 ([fe80::a41e:5aa8:e298:757e%7]) with mapi id 15.20.8182.018; Sat, 30 Nov 2024
 01:10:17 +0000
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
X-Inumbo-ID: e142c225-aeb7-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjJkIiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImUxNDJjMjI1LWFlYjctMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyOTI5MDI1LjQ3MTA3Nywic2VuZGVyIjoidm9sb2R5bXlyX2JhYmNodWtAZXBhbS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6zrJPiOoYZzJHV1mJopSCls5JIBibHr+mbOEgXnZHiDSxUunWb9ODvMUw6nQDcuohPbUTgS9az8Yu84i1LA/6dvTJHfFDykAtTno8NXadCpsGnQj7kifdmFoHKQgXjlWpGvT4dpyPCXlAFaSiDdAiuMrj8lHiKO/4qdYKajaxGZUUVL1OHEINhNFqqvLbUGcRG3vOeEajpodhdrDEAba+oCoD3AHu0ZXpx1lLfz6LL1vbNjwGatohV5OD+e1ZIquuiOaGTAdzKrltrSAxRdNQPSrte9/jLCkwNNbILIp0HxV9is3hAa2fBaXrHWd1nNdSKiGmhXXhh4OgofwDVzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMLsAsxP2jCKXlPGp2d48OpFc6sgoHg60qnvVOllAa0=;
 b=aEY9T8VKCMjTGIjleNZuRGbY2+jKMaJfgyyUBGYSVW75fh+/IGc3HngvzYFPwf/naj0dSt1SA+ntWF9Em1xJGhI6OuNCtATl3TEburhTj5TRG6n+zyU/g42u34qxiT9iugd1otpMlG/kC7KzEloVZhVfzG/Vrr4eFfyVMa2HBkyJcQMtdL0z3+1XSqJep923te3WTxv5lL6vJorXufoiV/DFmr/TFQTkdiBvOTvmdqRO+tynUx7aEKDj9ASip3TWBPivFVv4M2o6zU5/GEWeHLDNWubddfF44WPP9B/oFngQ9//AdnvYe/Mb4CyYdS49WyjjnOUgQP/PJITug3IBFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMLsAsxP2jCKXlPGp2d48OpFc6sgoHg60qnvVOllAa0=;
 b=rvv9qRw9tXc23DMjcV9jea3tJ3lcW7hrrPAu15DPg2WMMVRlDy4Lg41kTFuxd9PUn/36dl5cgJpXkd8NLRzdxf3Dphu+V8w9slewHJju+mzkElhm2pyHNUTmNvakRozC3cR7U8DCW5fbIZqh5CUa4o4yabNAN5zojJTT41Vm/eXFdPMchEtzHZBVnr4mAgvO/wbdj18b2gc9SzrLq5BC4tdzrZGH99LsLscIjREWS3EQA/PIeA3SPb5Qm1G7t6MB9L4zPc8skzRGm3FcHVrc5swkyX9GwwoPaHzulX9LEyjLG/VXiXanxQ+rPk75SluQ3TUv1cuSeRRS7i+WEEEl3Q==
From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alistair Francis
	<alistair.francis@wdc.com>, Bob Eshleman <bobbyeshleman@gmail.com>, Connor
 Davis <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] xen: riscv: enable stack protector feature
Thread-Topic: [PATCH v2 4/4] xen: riscv: enable stack protector feature
Thread-Index: AQHbQsSdrqhVO8R3/0W5bnSX25z8yw==
Date: Sat, 30 Nov 2024 01:10:16 +0000
Message-ID: <20241130010954.36057-5-volodymyr_babchuk@epam.com>
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
x-ms-office365-filtering-correlation-id: cd6b4f3d-38c6-47e6-1237-08dd10dbc094
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?k3mjZrk9VHb7MObOMvN85ZqNUkvQyQJ7H2Fb/FMmMEj93r4gE49ZJ38yjU?=
 =?iso-8859-1?Q?Dr+w414prgQDAp5wlwOnbW5eEcemHqXTVK92aTxCqcQR9GZP3KXK4ZQLbQ?=
 =?iso-8859-1?Q?kLR44QVHVKertD+sS07H4CJ/BVu/DE/cUIwxSHFgker9t/p7z4x34SukGf?=
 =?iso-8859-1?Q?3zmi6T9BT8Bu0VhEs8+PUA+f/ci90PYNccA1IeleqwO2vICq7HSHVWIGUF?=
 =?iso-8859-1?Q?F4mU2djjxo++Pzif3qLaYhQYkz+8t8qE1Pz3Yo1QF590xrzqAcyNucJtOY?=
 =?iso-8859-1?Q?Inezyc4u2BCvYARAPyB0glYIAgp9bvNFHizppsTkrPJ3Wqjy0XQ8vMvECh?=
 =?iso-8859-1?Q?qAbE0FsGq+iUp3ILPu4uGAn3nPmki64M/5YiiG+gw69QQO2zgDzGN/LfK3?=
 =?iso-8859-1?Q?3pbqnGzLQJoMUKnxN5xxG2fyMvfsQhliybeax21GzeGlKHmYfhaILRjXAu?=
 =?iso-8859-1?Q?v/im0vJT7T5mRYQaubyfvRZKN8vKxCHazBdsyLSmNMB54zjyOpsyNfzfCE?=
 =?iso-8859-1?Q?PcJ8/CDjITAYKkBgZTvRBefdApA8+hJqarBmDBV4V8YK28+3Om5ad4txEZ?=
 =?iso-8859-1?Q?S53JNTOjFNLnu3y5m9cBv8eeWgqzOhO1XwcmqoQWx9Zesmddad4hsPMAgj?=
 =?iso-8859-1?Q?+5kxePpM8nEMCCswPN/M54EDsCM7nd7yW3xx7qHIxFbxaHvF9B4wDHvLfo?=
 =?iso-8859-1?Q?VbVeWz+cXjLU3XQ7tAjiWRoNzxsQa5rGB7VwuBJqmSXuC7Mxg3LgTsve4Z?=
 =?iso-8859-1?Q?DePBHnDknyuSW2tfvx0e2HaY0tK3xK4JEuNMtIT/koIdw2F3okOQRTHPHc?=
 =?iso-8859-1?Q?aRWNSXr8UoUxsmv5nkhnjQQtHqYDXLIeokMTZU8V4e4RryWu90qqlTMk6s?=
 =?iso-8859-1?Q?vacmojnKvqNLFe3rOkBJ/xsh4Eaa2tonwYYvcu/NQ+DZrY9uAJqbxKu1YU?=
 =?iso-8859-1?Q?E0riJ51dNOO9+pvLTa14nAVItJapob5jMihYTGTiHyJo0r9wwJnk7N/0pu?=
 =?iso-8859-1?Q?pTMssbw5QIngguG/U7w2EUJ6G4P7Uavz2k7FUjwudBDeexRLosX2qYuXBF?=
 =?iso-8859-1?Q?H2dp44SF4B+L2MXvaxfJRSkmoYMr50NEe2aGsk1Oj+kuJAJpTMMJIXutkd?=
 =?iso-8859-1?Q?Yl2cgb2PSEQzh/n7r8gqzjvr9Y1gWFqJvt9UkoY/z12Nc3iqCbm5sksvUD?=
 =?iso-8859-1?Q?fBWTninHDgx3IIC/+IKmB7nfJYyPMtsfhGo8oBTFTLd4a+P4TO6lR+mNl/?=
 =?iso-8859-1?Q?VjaIrd60cJYmBI1MvdxGJxpNlDSEKLptjadYnxT26IY3JAb8hFPM9ej68J?=
 =?iso-8859-1?Q?iPQCp51Oxo4BbtLGhb252p9EWEs67c/rOASYvkoN6qs4IvWnzXBRfRLTnD?=
 =?iso-8859-1?Q?yfOScW6Jwo69pXFXR9Kpz4Iiu8yhGbsbpHH7GJHPIWYj47BLudM2VFAZyE?=
 =?iso-8859-1?Q?try/OqTqaE+kWIaIRMEwJWrQy47FB1PV3D0Bkg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR03MB10456.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?1X3XPcbFMFaVlCJOmqJr0uiSPPlahk6n9va9JCIoqHAmNpq+PlvNXExJSJ?=
 =?iso-8859-1?Q?8BnrEGNk8AVDsKgCtcO+FPZZxw3R2FXmJqq97RdvzCkyI6nBWn3nX5CUmq?=
 =?iso-8859-1?Q?PT6KkIhEpayOzI8zzIic9h51oSWSLBLwlvGEjtREJs0XIhzF8tIWrhcWKy?=
 =?iso-8859-1?Q?9DA+ja0jISlgfI7+cEr6znCy5eFaZDizn2vHh/Os6gPwtYwgo91ObEPqqf?=
 =?iso-8859-1?Q?43XLk03uPD3a5oCuvbL0Un+ERLxAltfMPSWHw3XrIfpbGoLJih8y+Z/04B?=
 =?iso-8859-1?Q?GCkNBDDcxg8/4OBfMGaIBWkENAUlmkwGBQhpKA5yRN6h3KoOjre/liu0SR?=
 =?iso-8859-1?Q?xmxqJ0hWG+I4kKdVJdLd1T4Q2GQROljjP7f9jjFeiy4qx7JKrjR7gWODik?=
 =?iso-8859-1?Q?8AzVMHS9gGbMfpJWcyQRfzdOJf6EpCsku90o4wRBiBKxB8ktkRm/Sp6uOz?=
 =?iso-8859-1?Q?nmZIIsTQe2kmF7aaRCb9iLFXg+XPSb5QsV5lmWwt9HdrtLzLXKuhB+lGKF?=
 =?iso-8859-1?Q?ax7eXch0Y0VXY84XS4n1qKn2hpJSLzE63gXs5ZMrMReTTB4GsMm15rEwyr?=
 =?iso-8859-1?Q?SsX6rW5Pg47O2xihffcV5fxlowXc3uehFU55/YLao9aNQ7Nk1mNsUKspzN?=
 =?iso-8859-1?Q?DqppNrsZxXsKj8ifUStvEUEgZ6U24uZwwNI6iRJHeoGFIUPAlF6rZKS4dx?=
 =?iso-8859-1?Q?4O5c5fIzqcdXkAydDX4Sgz0re5/9tMxCgNLbqWFpWxF6F9zo082LXQ8zqI?=
 =?iso-8859-1?Q?5Q2gBGmdP026BYuVw68PW+UJV2PwaXQzIvHDbYNpNtnjrsl7/Kf6NeacuV?=
 =?iso-8859-1?Q?bTTtBR//45ZmSxAB2wpNj0pImwflsFmsiWIPxHUqdgbod0VPohaSTSXUb6?=
 =?iso-8859-1?Q?e/4Y7R6Ck6DVN/WNMhO75GAlPNGfeb0H5YJ8yvhF9+QDtryZMZLCPYl7IC?=
 =?iso-8859-1?Q?R0koNswq3oKZob/hKpFx8sF8DRrJE2W8x9Sqzv2gecMdp/hGd7y1mCxTSp?=
 =?iso-8859-1?Q?lp4mJ61M3wfBq+prLAl88FrRh/cJ8JW6FEbUomB3oK8zttWfuAgO/GBUqW?=
 =?iso-8859-1?Q?XRBU3BaLYJeHVZ4XUdPt3MAJHl+nGE3I5me1nuq4ESn64nI26eTSNE8v1e?=
 =?iso-8859-1?Q?ycbBlFOo2EpvcrXB3MXCtRQ/V51CQxO8eUXBjWBAfRbQAmvWlGymuW4Qqk?=
 =?iso-8859-1?Q?Paw0qEb/aLxgBljc7tOOYycgXfJg9EZa8RoEFhCTBlyZpugk1LGPhrsd8q?=
 =?iso-8859-1?Q?yFvVjb+yvtQXd/abbpsIEbVQ91XQXp/vGBYicoTNGQfhITGHfkBVSQ/iT3?=
 =?iso-8859-1?Q?vr8R660aQOrSSHh19HqN5uybmvWnM/S5uW8Gpj3/mDNKl/DxDd4oVGifW3?=
 =?iso-8859-1?Q?ZVA4+PNBqZQoq88KqoPe+y6cK3xxD5d8dfDVYCrThagxLe+7yMPNXbpa2h?=
 =?iso-8859-1?Q?4+VBJoPYmoLmhMrC9PrGQ8WsA+pxq7E8axx393adTe9HYLqDJCYAGw19rL?=
 =?iso-8859-1?Q?oN/Xc7WCusm/Ve0RmvqtvFkqT4c6qO2nJDg/tfB6/ITLpyvPUmrzlh2H0q?=
 =?iso-8859-1?Q?FtDbr/rnuc44f1xR2L3k7laXWKnm4bH+ryL+VsELSnnHDYsz10QC9gNJYq?=
 =?iso-8859-1?Q?ukmul5f6T2fLLRPdc74JPYd4b5JB4nXbIFIAoJ/shfjnLal03Woxyx1A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR03MB10456.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6b4f3d-38c6-47e6-1237-08dd10dbc094
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2024 01:10:16.5991
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8X8GmRRjURy0XqMk2Shw6ukUfXhf3iq3UNSrXAZZbQI1AhDmi0qfmbXJXvRquAlFNRoK1sCeIcrmW3IN1CPUkOooU7mGRzZ4qyloR9wGUgU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7694

Enable previously added CONFIG_STACK_PROTECTOR feature for RISC-V
platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
function, because it never returns, so stack protector code will not
be triggered because of changed canary.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

---

In v2:
 - Reordered Kconfig entry
 - Added Oleksii's Tested-by tag
---
 xen/arch/riscv/Kconfig | 1 +
 xen/arch/riscv/setup.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 1858004676..79b3b68754 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
 	select HAS_PMAP
+	select HAS_STACK_PROTECTOR
 	select HAS_VMAP
=20
 config RISCV_64
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 9680332fee..59eddb465a 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -7,6 +7,7 @@
 #include <xen/init.h>
 #include <xen/mm.h>
 #include <xen/shutdown.h>
+#include <xen/stack-protector.h>
 #include <xen/vmap.h>
=20
 #include <public/version.h>
@@ -57,6 +58,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
     if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
         BUG();
=20
+    boot_stack_chk_guard_setup();
+
     cmdline =3D boot_fdt_cmdline(device_tree_flattened);
     printk("Command line: %s\n", cmdline);
     cmdline_parse(cmdline);
--=20
2.47.1

