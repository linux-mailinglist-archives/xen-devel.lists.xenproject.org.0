Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4C09BAD18
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 08:28:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.829826.1244728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rV9-00015P-K7; Mon, 04 Nov 2024 07:27:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 829826.1244728; Mon, 04 Nov 2024 07:27:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7rV9-00012h-HU; Mon, 04 Nov 2024 07:27:51 +0000
Received: by outflank-mailman (input) for mailman id 829826;
 Mon, 04 Nov 2024 07:27:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gxyb=R7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1t7rV7-0000WX-R2
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 07:27:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20629.outbound.protection.outlook.com
 [2a01:111:f403:2613::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a385b9d-9a7e-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 08:27:47 +0100 (CET)
Received: from DB3PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:8:1::44) by
 AS2PR08MB8384.eurprd08.prod.outlook.com (2603:10a6:20b:55b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 07:27:44 +0000
Received: from DB1PEPF0003922D.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::7) by DB3PR06CA0031.outlook.office365.com
 (2603:10a6:8:1::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30 via Frontend
 Transport; Mon, 4 Nov 2024 07:27:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922D.mail.protection.outlook.com (10.167.8.100) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8137.17
 via Frontend Transport; Mon, 4 Nov 2024 07:27:42 +0000
Received: ("Tessian outbound 4a86a9c66651:v490");
 Mon, 04 Nov 2024 07:27:42 +0000
Received: from L9c4f441d8d52.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DD54DB0E-DE0A-46F9-A92C-BF28EAF855E3.1; 
 Mon, 04 Nov 2024 07:19:42 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L9c4f441d8d52.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 04 Nov 2024 07:19:42 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DB9PR08MB6410.eurprd08.prod.outlook.com (2603:10a6:10:262::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 07:19:39 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 07:19:39 +0000
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
X-Inumbo-ID: 4a385b9d-9a7e-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjYxMzo6NjI5IiwiaGVsbyI6IkVVUjA1LVZJMS1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjRhMzg1YjlkLTlhN2UtMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzA1MjY3LjgwNzkyOSwic2VuZGVyIjoiYmVydHJhbmQubWFycXVpc0Bhcm0uY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ob2zEJ5MonAxF9nJyHY/7a1WSTZO20hB/I9QBNUmxK0CYjftv8EI+/fQrQftmWW8aGFXGb3dsmdDdWruNUdbp5mybbuvgAOcLuwL9dq5lEdJxYthtAwbzKdOByLiziUmZuOPlIJV2E7JHAjVrLujDSnaeJ1AcKYu0NVzUdfvhpUOcFiWrbWd5/57wSTxODw1IT6vwBs7kUD/IDB0L9bLJ9XuOwrckJjJ/bqml0o1ylWT8zHezvjBzK7a7SEAaM+xg9JQg9th24YAz9KYkA3ARwK/cyQ5DiJBv5BdlEyCyrleXFZQlVoTdiCm2SgI2rc77lCw2KcEOvV4vuy/3itX6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAer2j2yfAENfXDtbg92KNc753V86Vqsdiso/bsldAo=;
 b=mpXIMIjiORkErmJyJNiqzCUqe/API+yJNfHLKZ0MuX5a5WzNg29b/rTw2OLuZr0yp5GtryP0MR4Diba66IDGWRlFkYlUALP070GJ83cdmfO1aOK3uj9DM05uzYM/79ZdLaMC6lRAqXYFBUz07POnAKrBDqwd1Bw/A20sQCtOPqW/wXxAgRuabAw/I+aAnIeKYtNPdVGzXzcEl2JI+OKNJKngBIeYpTtdKvA/qunspmQNNAMgKPXCM11lgzkUiWU9Z2XQWNGgm+WaW2NGM5d5MnloePpqevHzhC0UR80XwOHgUJ/PPI+Wt/ICpqVQxjy4JAqnnmY4Kf4ApZt9qkd46A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=pass (signature was
 verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAer2j2yfAENfXDtbg92KNc753V86Vqsdiso/bsldAo=;
 b=T1jt5kyLn8tS08xFm64H0sElOSJ9tU3Hlen9lMk/0vyukR9Y3JK5gAmwy2TXJJcKALk+AnarrAqTMaRt7f79/Lhbe6y8FVF2vYc2sjxg9OIBRW9faOjcnNXLXcW0TlSPUh5val+05j1nlDc50CVvUwh2/HfSESg28jIzxq5CB9k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 48949eb675998660
X-TessianGatewayMetadata: g8nbg9rvmIKOmJ3DJtPYAhajA65L9cR19SIoFPUg4wR5lzNGHoIMK6jAJV84CFjnVCWS5dFV+1m0z+7gNOZDs3FIZTLfvnq+u6riTgVKiqlm6s+hOfsArqwOOM0Xc+6tDxh2JGgntXRQbYaTLmmTY1bS/isHXXB1UHBwWyPP5+s=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeQtjKkdgIvPTZIOzTkCYqwERtNl/zmG5vlkOulxb0nlB271Q5OfNAloOC7HcJLDkqCpE79Nu44bhG1hbE1m9XfwqLgX9tPQN/yarEj/EiUrpCBDiWMsU4rUjIU1QZ+s22+Kl9dBgJ/cNslq7ByoOr+6gp13gGwrhGrZnSZklHIBiMrzR85wF4IicxQhPOlyFNngzIC+GxDX5PxtwaLID8dcCkcQ9/LDXllL5/N69oL1uaeOgy238ANn1/90hTybdAmhtd0GBlFq4oKrs/nLDmC+z8/AT/EUnkP8YueKwePFltz5/3LvmR9/0TJ7kwKgO17+agra4wyffX8sAhztow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rAer2j2yfAENfXDtbg92KNc753V86Vqsdiso/bsldAo=;
 b=KxlsyPSL1O7sWdjTMzT6cg/2yOivRjMsrWS/gcKmnEk65TsXm1VGropHDIZXiyrE0V9wjXdZAov9daVuWNo5/4zO1E+PsKAH0ylboqn81ifbj/z/5Xptru4PbpU3CMFrRfJki1n+YmupjHNBww0Jhp786exldVJYtR2xOf8D0TeMf8V3peJUWp2zKgpTSFQklZ0AKBbo7e+A8ZaMf1+BL+E6ZMLvVB9j7sH4iAs58qyLTjDemWurM3rDED3kUhKGnycjJud79pc8RG21ErJVW7aEZGJIU2mes3MlSsXYPOa4ztlK/n549lWD7SrA/GKTEvZbS2hRTI15M6oAi2LM6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rAer2j2yfAENfXDtbg92KNc753V86Vqsdiso/bsldAo=;
 b=T1jt5kyLn8tS08xFm64H0sElOSJ9tU3Hlen9lMk/0vyukR9Y3JK5gAmwy2TXJJcKALk+AnarrAqTMaRt7f79/Lhbe6y8FVF2vYc2sjxg9OIBRW9faOjcnNXLXcW0TlSPUh5val+05j1nlDc50CVvUwh2/HfSESg28jIzxq5CB9k=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jens Wiklander
	<jens.wiklander@linaro.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: Re: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
Thread-Topic: [RFC PATCH 1/4] xen/arm: ffa: Introduce VM to VM support
Thread-Index: AQHbH6z3/b07Z+H2iEKVEGebQub3/bKiXKqAgAR3wYA=
Date: Mon, 4 Nov 2024 07:19:39 +0000
Message-ID: <765C7E37-0ECB-4BFC-B98C-57FCE303828B@arm.com>
References: <cover.1729069025.git.bertrand.marquis@arm.com>
 <0475e48ace0acd862224e7ff628d11db94392871.1729069025.git.bertrand.marquis@arm.com>
 <93715b7e-d968-4526-96c5-497a7a1f9dfa@citrix.com>
In-Reply-To: <93715b7e-d968-4526-96c5-497a7a1f9dfa@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DB9PR08MB6410:EE_|DB1PEPF0003922D:EE_|AS2PR08MB8384:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f341a8-c17b-4842-0e25-08dcfca22b96
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?6MU61DKBhVB9Q89On+ib2BrESQ4AhpODl/mksgZ7oRYSUxAZnzXMAJ3ZqGOR?=
 =?us-ascii?Q?eIvIfVMdbhbxJoQSFXlUtoF4H91qi0w4Ha6TABLdNR67NiFX0vf5cXNvfwcD?=
 =?us-ascii?Q?imnUXAfUCL7cKWLLr4BM9mPYYLFvBgV+b8nLV5+Xgbx/O1hr+200OJVhfI5o?=
 =?us-ascii?Q?R98++jlpYxjJxRxX4SrLkB96WCtGfrxNhF5pwemDFS48omYNFxeyloABgfvs?=
 =?us-ascii?Q?ZH2lRgT7lxsR4wqg6nUYCYg0kvEXoH+S4y+MJPBecd2XxwB+vSY4A9okqSbI?=
 =?us-ascii?Q?W2oExYNpX4engClzDlD2O+zsHW8utFY93DP8xJ7jvRf+LIgoSKKbIknzpmL7?=
 =?us-ascii?Q?8J7JtnX4pV9vDSMR4LI7YzrvYvRaJMI2v/xAFQ2ZS+HcQ/crSom+dkKuxlrk?=
 =?us-ascii?Q?+ZKyaBr2DEwmE0shnDA0XjUs2SPGq9vPrfO9m8w6QjHCmo3Lhr+fsjIprixL?=
 =?us-ascii?Q?Y9k+1mCrPNaLIQ6z5iX/J5NmdimHbHvc7SxmcmTM38gnhsKTjy4fvViLZYai?=
 =?us-ascii?Q?za79TVc6GPe0mceylGN9TlPS8TvHZ/BYolRkPqJ7R0BfXjz6pqlswWZAGc7s?=
 =?us-ascii?Q?SghP/WwFlPlO+zZYvGndVuIaRCzePT0KeWskDsVeM2H5Dgo2NUQqzgrmEoFe?=
 =?us-ascii?Q?CMfiK9Nk++SX0RVYlOByQpxIJJYKWdxU/D/VoneyqvozSByx2Tyi8tWs02qY?=
 =?us-ascii?Q?LGZGnTpJoQJs8vUbRtwHBPvqmFdsd/2oYogJuzZmk3ozYDuupRJ4XTPhWJE3?=
 =?us-ascii?Q?BZhtrDBxyMb5sYiqf6ZE9KTPrtS7cpnt4jr0uMpo2NQwMquEKJ5PEFc8KcUO?=
 =?us-ascii?Q?8sMoDztdgRRphDCdsyQVMfKxyjIdQbRvyM5jsR6xKh3u+3YObDPEevlFG6ex?=
 =?us-ascii?Q?eXuviq9DHGoKmVRI7NV+BCc4D8W8/Rc02UBK21oVJ+aWoYEV2r7AlTBV+31J?=
 =?us-ascii?Q?ZFtTYv2ub0a7v4U6DK3iFjP3fQWzRS677PqUZYinDKR1zY+cKvvwu3WfKCE1?=
 =?us-ascii?Q?N1TOXnf5+Qsxmkieqz8gAjXrbHINXWoFtg6bxEqbvi+JbU38G9n6pj4Gz2FT?=
 =?us-ascii?Q?YSjS/lYMlCqrBjOAzKOg/NRIuKdRf6/rGQ46mnWdwgs2LX2qGhj2LRB+sW5j?=
 =?us-ascii?Q?2Q8IcSX629WshDz/lG121A5jiEX9uKc+V1xnYmdm9vJaB3UPDVfQLATy57Ry?=
 =?us-ascii?Q?9qKgTkG8lPzszxuEIVUGSBs5HYNAqF1Cm09w+JZJ+6RdZJ/ZE1IB55Gu02E8?=
 =?us-ascii?Q?/2npsESS6Gj0UfPhewrW80KMIa7i5oKG9WFHjowffglzOR/5mW4Zn1OZE2sE?=
 =?us-ascii?Q?9AYsAfUCG8/pB7MT2fbNuE1ZZyCbVsXb3aOPDwJE2zbDe5lFjdx9Cbggo1PC?=
 =?us-ascii?Q?ZrSm7f4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B1BABBC4E4D5904AACEF549B636146EE@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6410
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	92cd9111-896a-4d60-d06c-08dcfca10bb7
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iguEHOkf9QCK2ICEpxeoJT4gOzzSzKQnPP6fBlJF5z4hXTas189H3LqjKQQx?=
 =?us-ascii?Q?5RbVHMV+AkhJdXKnAiUHWwnytSOMO/MH/ivQylBhma6UfkoEssPNpxWydp3F?=
 =?us-ascii?Q?9H185Rs1zUTE/5Xd0YyUP5aBGhQw2cg3UvmhTZc2wwWtqNBJW4dyGHIvDSh0?=
 =?us-ascii?Q?JVLNJXTJ2+r0aFtHpZB0hW2Nr3tqXzYq1edMVfKJTFfdY3CBWd0wpnHiOhMx?=
 =?us-ascii?Q?h1lIdPBgjg/G4abtvp5FI1Eraw8iprP+0W7TKhW8N9mRtQ9jBFmYlPqTsjTo?=
 =?us-ascii?Q?37oeXDFJ7xyZGbmPr1EOH7kYgW2cPKG2BmUAzK4uTtVGeB2fgjgC3thLSksT?=
 =?us-ascii?Q?RsxBdmw5p1Xdu0tece/aY+PwahPGRkk+chsmW/7dSD499ZevkEobYBMjj13u?=
 =?us-ascii?Q?L0SEh/50oidzD8Ft5IbDV3lEBQTHcLyPMD5oXYhttajS+bED3WQ0JL9/GkQD?=
 =?us-ascii?Q?xhv+A3TU18gvjQ4zVtUF9CYIRVH1HJZqN2ee/n+30FWAObq1FAg0Ct8EH+/c?=
 =?us-ascii?Q?PxJhf6zHT4Rxt9yl+OKmfsp8iBaTedStf1JKTMuuMFEufQcdKppAbPG+k+K/?=
 =?us-ascii?Q?jjp89mTskYBBbr2NBWSOk7d4CnV3zfzcaPgIMg4yw78wLEVPBvUnJYhyf31M?=
 =?us-ascii?Q?sgE7DbhHmMDWIdSX+VYWWpTo2PQZYWF8586HdztIk/NDfLqAIOFeqniYmIzK?=
 =?us-ascii?Q?PJrIAL+jPkqN3E/a+IT/jf+4+HgeS3GdStDjgo8oxUzDJINFY2zwAF+g/j8I?=
 =?us-ascii?Q?jnxYH+WnHIf3aoNgWHWbhAG8+3foMLwhRYEFVMnjv6l4XyIf0pY6kUmHZ6jL?=
 =?us-ascii?Q?AFnxe8S2NG/eT8556bxZYbyTS1Gdbde0xKzkjqhDieH+6fDsPV37TASMJ2Ss?=
 =?us-ascii?Q?IplP5vlK1GyGwq6fhz063x9mXOFGFCOWkCldidzGeS+l6U4PYT6Zvrgmq7BI?=
 =?us-ascii?Q?m0gxFso1fOGeGYtfpAUI18OTvm4XImHrAqprSpeSSBl0GqgsR52rtH9OU2E/?=
 =?us-ascii?Q?lGIAj1ve1uLGXtnN3cbD0/X49ZYjaZ1+RC8EncsEvnFK3IV8iXovm7ASF0Ir?=
 =?us-ascii?Q?ACY3W/OxiXoI6U6oobWg/xIoM2bqgm2hehm5wSHDiC09s7CHDNxiFRBIcHn1?=
 =?us-ascii?Q?/pjm1hfiecGR987qDcfo4X1W3lAbj3/4KPfoN61twG2n0RhV4IDm3mufKFh6?=
 =?us-ascii?Q?nBjB2luW9Yl0wcc7qdTt2W1ib7/BtYXa8aFcX5CzTSFSmqtC/QJRENImdp6J?=
 =?us-ascii?Q?1F9r1SN/AIqqGl6heYimS+p77gAbujdtxMXfuAX0JxXHIidR1oLum6gH1J/w?=
 =?us-ascii?Q?2eNliTFPhghBDaJhEdskvzwVE8i2jx4wH4/me671ZQMnv4ApmC5aSwfTCTPZ?=
 =?us-ascii?Q?wFFN7ufmraBvQgsHGKG17thS7moACWnwNDlv27HOIZPg5U3Oow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 07:27:42.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f341a8-c17b-4842-0e25-08dcfca22b96
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF0003922D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8384

Hi Andrew,

> On 1 Nov 2024, at 12:05, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>=20
> On 16/10/2024 10:21 am, Bertrand Marquis wrote:
>> diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_part=
info.c
>> index fde187dba4e5..d699a267cc76 100644
>> --- a/xen/arch/arm/tee/ffa_partinfo.c
>> +++ b/xen/arch/arm/tee/ffa_partinfo.c
>> @@ -77,7 +77,21 @@ void ffa_handle_partition_info_get(struct cpu_user_re=
gs *regs)
>>     };
>>     uint32_t src_size, dst_size;
>>     void *dst_buf;
>> -    uint32_t ffa_sp_count =3D 0;
>> +    uint32_t ffa_vm_count =3D 0, ffa_sp_count =3D 0;
>> +#ifdef CONFIG_FFA_VM_TO_VM
>> +    struct domain *dom;
>> +
>> +    /* Count the number of VM with FF-A support */
>> +    rcu_read_lock(&domlist_read_lock);
>> +    for_each_domain( dom )
>> +    {
>> +        struct ffa_ctx *vm =3D dom->arch.tee;
>> +
>> +        if (dom !=3D d && vm !=3D NULL && vm->guest_vers !=3D 0)
>> +            ffa_vm_count++;
>> +    }
>> +    rcu_read_unlock(&domlist_read_lock);
>> +#endif
>=20
> ...
> struct domain *dom;
>=20
> if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
> {
>     /* Count the number of VM with FF-A support */
>     rcu_read_lock(&domlist_read_lock);
>     ...
>     rcu_read_unlock(&domlist_read_lock);
> }
>=20
> drops the explicit ifdef.  Hiding function-level variable declarations
> behind an ifdef like that works exactly once, and it doesn't make
> pleasant code.

Ack I will fix that.

Cheers
Bertrand


