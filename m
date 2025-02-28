Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BAFA49A89
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 14:31:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898727.1307232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0S4-0001O6-5l; Fri, 28 Feb 2025 13:30:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898727.1307232; Fri, 28 Feb 2025 13:30:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to0S4-0001LM-1T; Fri, 28 Feb 2025 13:30:52 +0000
Received: by outflank-mailman (input) for mailman id 898727;
 Fri, 28 Feb 2025 13:30:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KVOf=VT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1to0S2-0001LE-MY
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 13:30:50 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2612::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 387a352f-f5d8-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 14:30:48 +0100 (CET)
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by AS8PR08MB8659.eurprd08.prod.outlook.com (2603:10a6:20b:563::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.20; Fri, 28 Feb
 2025 13:30:42 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:6:30:cafe::8b) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.23 via Frontend Transport; Fri,
 28 Feb 2025 13:30:42 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with
 Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via
 Frontend Transport; Fri, 28 Feb 2025 13:30:40 +0000
Received: ("Tessian outbound 678e42ac23ee:v585");
 Fri, 28 Feb 2025 13:30:40 +0000
Received: from L4d8172a4ba25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5D24AE77-23E9-49E3-8CE8-4B71463CF781.1; 
 Fri, 28 Feb 2025 13:30:33 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L4d8172a4ba25.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 28 Feb 2025 13:30:33 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB8057.eurprd08.prod.outlook.com (2603:10a6:150:97::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Fri, 28 Feb
 2025 13:30:27 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8489.018; Fri, 28 Feb 2025
 13:30:27 +0000
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
X-Inumbo-ID: 387a352f-f5d8-11ef-9aaf-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WXh8gpifrZ7xs2c3kM/tjGmWYHvMQb14kp30FKhByNpDiMAFtHVsKo7K8eLX2hpXKjYq69Po9bXCC/opCoXA7pK+BCVdxH/q54VSIR/RloTmx4iQqQD3mORNYk1Hgu+zWVRlRXX/ar5r3vtmZqLgyyrreGv4uszfeHAnL/TZwt3WgYtfET8nGAPTggJpGezJGNy8jz4qKEb9C8NnAID5qaUwtk4MIl038NJr5HngjPrciRntr0uAlUJs80IELaNeICoo9YIcXKN2okccS+XFzETCo8E2FM6VAe+amH3uZRw2t5SxkgjeUkExZIlpovTrpPzBPYmepqXsVewK4JabnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/WCmz8dLBaP4DKGQha0sEXLt34j8HtGLCgtrfBPs8s=;
 b=gePhkX9YaCYvQlrYgzPWTNM/T0QiH/BttSItD2TzEFAR5KkXnwsyg8MrlAWkJYpj5C37SpOnB6omsfi9RYf2mXgoBgOoPZItfnQ9EihPm6p+a1b43QmEknMfL3vvbGWVPBGDfObJYIoLNaZ+b9wQ37ZQRFqbvOs+S/NBEw+GqYgkQ47K0I0ykP4DCW9F+xiZXS5J6gTOLvhanQBSbP6h5F/DE2SOWd/gmtmb7Z/ArU/7Av76V6Eb8GFb6sEZNac14oK9awflz/z/rL5fk3BNY16HAnXICJuSW1jSKlcgCaJrBx3BiLx+Bzzlmorpw2Ww/0vaLgIfHJt6C3Flonbynw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/WCmz8dLBaP4DKGQha0sEXLt34j8HtGLCgtrfBPs8s=;
 b=BitaFjyKXkvjgLSqDkCxNeT0cvgcLCOrBKapfygmdqi9Gi3yzVnYwRFhlBxNfZ3HXs7c2AztV8+X3iBe+FVVKAK0k0d9/SWqhGEWadNCBgldg9D8Mj5PJrEA7Bg3ASw4207PbGEP+NBQf21yBBvKb7h1t4xFKkwamyoUydWeZ30=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63210781785fdfb9
X-TessianGatewayMetadata: /bBL6yNwVDYzTe6aXWX5sjRwRJKIF/aD6aZEHc11xhj28WWXnOxI0AP7MXWpyUw3N7V4GrkMRny7EY54dgBa75Dd5DxdBGA8LYUQ0/oi/IqdcPUI6mPxiGi3nq/Whl1YLQX7x4LFDS8K1qv3zowlqal0Nd1Slbs4KeDXw20aMc8=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=la6YDuqfe5vZYQwn5Pv6nyQvCB5OeveGGslR3GKAB+vZFPd25Rv8f+PDqEQu0TC6KMbLpH8Dq+XhWKDpnrKyJ+Whwp49QSezLXxXvrNqrMeRsVzqXfK3edMNGse1DYG2RSr1nDnAwuDwmms58yKNUlfA6HmDGEAQ1LczjGDEv/N4nKOND6dH4NCNQF+V8wh4PqMDjf1noei0lZr0vFmu4kQrt/cZHebNUQvt1LGuv0A/w6wvrThd2VCYpX+lUb7LBrBUemXYRJQFoSX9+RnpapFct4QUJUYvOZD3sXYUZxQmIAmqZZDHMzF6C2UwXVTc4S/MVfsPfbGuw2iNLAAr+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/WCmz8dLBaP4DKGQha0sEXLt34j8HtGLCgtrfBPs8s=;
 b=SQJ6yKAoSRC6jBIT33Ox6xWof3VvaGP4Q/i22qaEdcm1v6vyRnvRVrKbzRcZ/IczWs7EjksVOwvud+dtUQrUfjkgLlS2O8HYc87pOs1eRTNKjgf+CVY9/Ie4Z7w0TlxSd7d6idY6sRe8AThK04Cl1K/gtCmN0FPIzP4ypS4EbVkzyV7V3wCSXlLAz6XixmlRxUnBQ2Xog0nG7wQJMn8esuNh5YNXifSMjtD3vU5LM8YjhwRui56Jy7bEwNQXAOfpFeelDd5xPBNqPgk2h+FZltqLABFPFMluEtC3Qkgwr6k2gVIIqURa+ZQG4HUgXSkgoqO8iv1WnaPB46P1CoND6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/WCmz8dLBaP4DKGQha0sEXLt34j8HtGLCgtrfBPs8s=;
 b=BitaFjyKXkvjgLSqDkCxNeT0cvgcLCOrBKapfygmdqi9Gi3yzVnYwRFhlBxNfZ3HXs7c2AztV8+X3iBe+FVVKAK0k0d9/SWqhGEWadNCBgldg9D8Mj5PJrEA7Bg3ASw4207PbGEP+NBQf21yBBvKb7h1t4xFKkwamyoUydWeZ30=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ayan Kumar Halder <ayankuma@amd.com>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>
Subject: Re: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Topic: [PATCH v2 1/2] docs: fusa: Define the requirements for
 XEN_VERSION hypercall.
Thread-Index: AQHbiSmfhnajI8fAUU6893mrw5oGSLNbZAUAgAAlYACAANBTgIAANd8AgAAn4wA=
Date: Fri, 28 Feb 2025 13:30:27 +0000
Message-ID: <52829E12-4951-4C61-A23D-68CF5CDE25FB@arm.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
 <636358F4-C156-4304-9C75-A8DF36E16F2E@arm.com>
 <3ec73f8f-0a91-46eb-9ea8-461fc6bac373@amd.com>
 <6B6C39FB-E0C5-4873-923D-32D4B277B224@arm.com>
 <4b81d71f-f0bb-4c0a-b1f5-cf5e0a2cf97d@amd.com>
In-Reply-To: <4b81d71f-f0bb-4c0a-b1f5-cf5e0a2cf97d@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB8057:EE_|DU6PEPF0000A7E4:EE_|AS8PR08MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eec0d8c-06c1-47d7-5394-08dd57fc184e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?pOMtibykhZMqdp7H4IIdINIQbiGVoBcvuSHOtoO1xnHXSUAV1QwXsAkwZzjh?=
 =?us-ascii?Q?1DL1vnYgm8atybR9wSOG1j0kjQ9w/IW9UVK2OgHmbl+6QUt1X2GOYA+UVuLP?=
 =?us-ascii?Q?wv/FsZ3t8jbuxVTQbx8h0G2bLv2IUMhhwekE/3C8wKYhbuvzGpK5kK4xcRuw?=
 =?us-ascii?Q?W9HM2dYT9uHmper/Tkt6uFj8gFKWoh5QuSggHio24Sl5MOhB+ZdVXpjaTPWn?=
 =?us-ascii?Q?Fw2ZxJdmwD4L5mKvhAuy2W4tNur35VbdIQwi9fqLSXADSg+3mrBrs392LOjp?=
 =?us-ascii?Q?Q92JyQl/zwwLB+STBnadj1kRXXmJzljRdkHCtBIkcz0BuVVRiE1YkctKj8ca?=
 =?us-ascii?Q?3qJ8B//CmLu/VMjq4eweVCucSBCKQmQEfKYOvhr3iU1KcclPqFPEmMOpnbBs?=
 =?us-ascii?Q?jX/0t195oX4pQd8ZrI+AqNpG05LiU2NzoNknSdP0kt5entSJNwy1oEl/Gztm?=
 =?us-ascii?Q?oqqXRtGxJNY/ep586l9DxglsEDSJ65yKHfSXOi9+mYnuTICfmMunb9A3OlzC?=
 =?us-ascii?Q?9hhl7rMCBwX7MVi/CHPxNmiDWO/YXxE4pBfQMpgTOjohr/1vyW6gT/Yjg1rQ?=
 =?us-ascii?Q?goak1xIdHWvTjzT/EUoiRc+53AU7Nxsq/VpAKto5CyH/T0A1zVYa8KC+hYM2?=
 =?us-ascii?Q?GFjwergZzI0dQgzmI/9mZzo96a0aS4HsyJtPcK7hXYxaJJ+kmI5OHcKPWTAi?=
 =?us-ascii?Q?8mjKKtGor76DxAZwQOxOgnCfPeqixYf9xtCAsjeHl9CWAJ1msh+7a46H74pQ?=
 =?us-ascii?Q?VORayzeEKxkj29XJYQ4mF0U5zdW45FAbYMNAaDC1zWYP64lmJD7xzhtnKroV?=
 =?us-ascii?Q?7xEFEj1S1Ba8HB2ldlE1H2Qd2u3InQd55FSHXKIi2Jl7Z4zurVY25bYB2kYm?=
 =?us-ascii?Q?Mw0F0eB0mCctcjmR9nd+pENFIcN3Gn7Xk7lVpBXhXFR+rsPR/amakHYWMxEt?=
 =?us-ascii?Q?jbfVWaf3EcjTUBVIsVyrqN/b7zqYaZIGycwdzj18bKG2/bX4h/5A8qKkBawh?=
 =?us-ascii?Q?VzGxFFaJTnuU/KLprarfXRv8tQHrlc6TPgBUOV+bHLzcvkcrvS4Ujb3mCqwQ?=
 =?us-ascii?Q?+QpuZWjK8WfGCMwnQS5uhsmNJFqeb4h8EO36351BlZTms7QzFjndHITWjzmo?=
 =?us-ascii?Q?Q1WEuaweOPPipRD8/qyjHAarLIqgopZ8R2eCiCTYjmVJdwHQKxpOrEIcNZpi?=
 =?us-ascii?Q?mu22YrgMKiI1i5t/bhJvwdMZPy9b9Q4/K+XJaHFS7vw0xKfOFAo5gWy3lENW?=
 =?us-ascii?Q?pNmXqEL+WRPHwsrdiDz8YnSsQRUN/nH2jEUVYm8r8q0rbxtXH7YLHokGdRuQ?=
 =?us-ascii?Q?6eKrKTsmdgf6NTnH1mqklCL8p/K2ZPVAIybdsxxkLN9NxzayOvNj73AsYMPc?=
 =?us-ascii?Q?EIGLO2S/ZwK2JvUkvpIvmvTmuMruIo0DeiBrCue94hFepQkCdw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF7197382208E448A343834A8CF451AF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8057
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	24dbaeff-c212-48ab-1b42-08dd57fc1037
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?A83+XX8pIbfoQSPbNqOG3oCvaPn+mwLQ8GkO9oJ1aBfWQUkM1M2hPFb557eU?=
 =?us-ascii?Q?1jHiIj9o2obNSJGi9Y/YFOTznyV/s2L1Urv6UpjYnj8xhc6myhvxsqGui/z8?=
 =?us-ascii?Q?2J1iFdS0+cxIE5wSXnpGnvsMrivStu7KWX8dBjKN7jbTr55fBOe8QLr9/30n?=
 =?us-ascii?Q?zxnie3gYIvlHTosJrPXsexF8oigxccKxoti2OW2KAxxxT/19/FxkUKLsmHZ+?=
 =?us-ascii?Q?brkd076J/KhkvokxoRNX5PdZOL7+ttO8kIXwMvJkV9thrttZVBv9/7HcIXBt?=
 =?us-ascii?Q?R+iw3ZsoHjCyg4XXfvpRsygqKhXavizT22irSBwo4YYpcnYmcPC06utbayhm?=
 =?us-ascii?Q?93rYGk1ZMeB75tCJvwYk7fZeSsE44F0A5DoQb70JKqbcBUff/U5oegjOdnKS?=
 =?us-ascii?Q?MJ8iY0ZOvzj8G3RsY6DQYcvLMKMbhAgt8TD1lfvca6o8j9N+LRw69+lMi6Zi?=
 =?us-ascii?Q?WtEtfw2RLshJ1ZAa3dXTdSD3eEhHxjDQEUIItU0pmhv8uzfZVXGcZgPsSp7/?=
 =?us-ascii?Q?S/nNZG2tXywR9DKW0VG4eh+8B7ZjHJYa719FWo3rFVach0Nuo8U7eIaUdOkc?=
 =?us-ascii?Q?h8+nHGtFpjZmFp9eJCyNIz5NjCgZUCEB2mlGGogYJ9uejyBim1+l71RmoieW?=
 =?us-ascii?Q?68QTh06zib/tIdAtCR8a7cOgT1lU2hf3Zt9jv2Wm0p+HEJSCFEVa/MbSrvZl?=
 =?us-ascii?Q?HrmcFApTo2la1hkElpu91TW7jzKRooRNq28MhX4DmrTEW5oipGUK2pKcLy0l?=
 =?us-ascii?Q?zig4Czv+UTj4x4j98wQqaSSDlHdGGaC+FIfVZPY5e5JBDfNVKmztlLx4uTYr?=
 =?us-ascii?Q?R0AVJEZbl0HjVA3Vk1xTzJRfnsgObtEcDo/C8tFrKYrchYgGEgw1G26egmRG?=
 =?us-ascii?Q?QwMMUFEifI0EjCQcLR7cft4uqvJaCgwwFgEzv7jRt+J4+ErTK4h/pZgbzCsI?=
 =?us-ascii?Q?PwbybYBJF1maPFANfFsaWPuyC1RPF7n1oLM4eF+lv5ANxxqRY7faW6G6bzL8?=
 =?us-ascii?Q?91Ae+kbvXg1sFo9oQXq+KH5m36GyubxJE3wOd51uDoJTiDti6M59JlDy6dxB?=
 =?us-ascii?Q?fTIAKVcNiYYA/9tFgPy8ZOwyTlE4AD7MlccCAqvncR37nR0Yc8ukcRvJBjCJ?=
 =?us-ascii?Q?cpDK232+O/XZt9i9JmOeocUXVIHKuIGhavvKAxqXVMZmE3lJZZvdxjO01qVy?=
 =?us-ascii?Q?g757NlKWeiFi4M68rxiBBxNJPE5BcbXe63PZnDYNju+CWwTZAuomOuWYBh/W?=
 =?us-ascii?Q?rIHK3OXmak/H3fAN26SWaAj0g0P6C+HMQ5KHo+2IXaZCzFSwdj+U0KSbZO9B?=
 =?us-ascii?Q?PkWirBz/ggLz+mtzGnKONbM0LXCINjjHjsq1aKFvTsImgcznzlH8fciujAbZ?=
 =?us-ascii?Q?CNxtK1ygWjnJvkbHoloFL/7RPE3P8oSIR74aYqgxXh5w36MPFG7gIaRRnEwi?=
 =?us-ascii?Q?TArsG5ZOIYo+ttRz+KqIZL0Pm06SsdpA?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2025 13:30:40.7327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eec0d8c-06c1-47d7-5394-08dd57fc184e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8659

Hi Ayan,

> On 28 Feb 2025, at 12:07, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>=20
>=20
> On 28/02/2025 07:54, Bertrand Marquis wrote:
>> Hi Ayan,
> Hi Bertrand,
>>=20
>>> On 27 Feb 2025, at 20:29, Ayan Kumar Halder <ayankuma@amd.com> wrote:
>>>=20
>>>=20
>>> On 27/02/2025 17:15, Bertrand Marquis wrote:
>>>> Hi Ayan,
>>> Hi Bertrand,
>>>=20
>>> I have just some clarifications.
>>>=20
>>>>> On 27 Feb 2025, at 16:09, Ayan Kumar Halder <ayan.kumar.halder@amd.co=
m> wrote:
>>>>>=20
>>>>> In the current patch, we have defined the requirements which are comm=
on for
>>>>> all the commands.
>>>>>=20
>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>> ---
>>>>> Changes from -
>>>>>=20
>>>>> v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does=
 not return
>>>>> 0 for success in all the cases.
>>>>> 2. Reworded the requirements so as to write them from Xen's perspecti=
ve (not
>>>>> domain's perspective).
>>>>>=20
>>>>> .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
>>>>> docs/fusa/reqs/index.rst                      |  2 +
>>>>> docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
>>>>> .../reqs/product-reqs/version_hypercall.rst   | 61 ++++++++++++++++++=
+
>>>>> 4 files changed, 134 insertions(+)
>>>>> create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>>> create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>>>=20
>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fu=
sa/reqs/design-reqs/arm64/hypercall.rst
>>>>> new file mode 100644
>>>>> index 0000000000..ffd883260c
>>>>> --- /dev/null
>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
>>>>> @@ -0,0 +1,55 @@
>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>> +
>>>>> +Hypercall
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +Instruction
>>>>> +-----------
>>>>> +
>>>>> +`XenSwdgn~arm64_hyp_instr~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall treat domain hypercall exception as hypercall requests.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +Hypercall is one of the communication mechanism between Xen and doma=
ins.
>>>>> +Domains use hypercalls for various requests to Xen.
>>>>> +Domains use 'hvc' instruction to invoke hypercalls.
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~version_hyp_first_param~1`
>>>>> + - `XenProd~version_hyp_second_param~1`
>>>>> +
>>>>> +Parameters
>>>>> +----------
>>>>> +
>>>>> +`XenSwdgn~arm64_hyp_param~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall use x0 to read the first parameter, x1 for second paramete=
r and so
>>>>> +on, for domain hypercall requests.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~version_hyp_first_param~1`
>>>>> + - `XenProd~version_hyp_second_param~1`
>>>>> +
>>>>> +Return value
>>>>> +------------
>>>>> +
>>>>> +`XenSwdgn~arm64_ret_val~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall store the return value in x0 register.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenProd~version_hyp_ret_val~1`
>>>>> diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
>>>>> index 1088a51d52..d8683edce7 100644
>>>>> --- a/docs/fusa/reqs/index.rst
>>>>> +++ b/docs/fusa/reqs/index.rst
>>>>> @@ -10,5 +10,7 @@ Requirements documentation
>>>>>    market-reqs/reqs
>>>>>    product-reqs/reqs
>>>>>    product-reqs/arm64/reqs
>>>>> +   product-reqs/version_hypercall
>>>>>    design-reqs/arm64/generic-timer
>>>>>    design-reqs/arm64/sbsa-uart
>>>>> +   design-reqs/arm64/hypercall
>>>>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/mar=
ket-reqs/reqs.rst
>>>>> index 2d297ecc13..0e29fe5362 100644
>>>>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>>>>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>>>>> @@ -79,3 +79,19 @@ Comments:
>>>>>=20
>>>>> Needs:
>>>>>  - XenProd
>>>>> +
>>>>> +Version hypercall
>>>>> +-----------------
>>>>> +
>>>>> +`XenMkt~version_hypercall~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall provide an interface for the domains to retrieve Xen's ver=
sion, type
>>>>> +and compilation information.
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Needs:
>>>>> + - XenProd
>>>>> diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs=
/fusa/reqs/product-reqs/version_hypercall.rst
>>>>> new file mode 100644
>>>>> index 0000000000..03221f70c3
>>>>> --- /dev/null
>>>>> +++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
>>>>> @@ -0,0 +1,61 @@
>>>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>>>> +
>>>>> +Version hypercall
>>>>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>>>> +
>>>>> +First Parameter
>>>>> +---------------
>>>>> +
>>>>> +`XenProd~version_hyp_first_param~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall treat the first argument (as an integer) to denote the com=
mand number
>>>>> +for the hypercall.
>>>> You speak of argument here and parameter earlier.
>>>> I would rephrase to: the first argument of an hypercall exception as t=
he command number for the hypercall.
>>> Ack
>>>=20
>>> Should I do this everywhere ?
>>>=20
>>> s/parameter/argument
>>>=20
>>> That would make it consistent.
>> Yes definitely
>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenMkt~version_hypercall~1`
>>>>> +
>>>>> +Needs:
>>>>> + - XenSwdgn
>>>>> +
>>>>> +Second Parameter
>>>>> +----------------
>>>>> +
>>>>> +`XenProd~version_hyp_second_param~1`
>>>>> +
>>>>> +Description:
>>>>> +Xen shall treat the second argument as a virtual address to buffer i=
n domain's
>>>>> +memory.
>>>>> +
>>>> Same here on argument vs parameter.
>>>>=20
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenMkt~version_hypercall~1`
>>>>> +
>>>>> +Needs:
>>>>> + - XenSwdgn
>>>>> +
>>>>> +Return Value
>>>>> +------------
>>>>> +
>>>>> +`XenProd~version_hyp_ret_val~1`
>>>>> +
>>>>> +Description:
>>>>> +In case the hypercall fails, Xen shall return one of the error codes=
 defined
>>>>> +in http://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/inclu=
de/public/errno.h.
>>>> This is a very imprecise req as it does not states what can fail and w=
hat should be returned exactly.
>>>> Do we want to be that generic ? if yes then this might be a requiremen=
t valid for any hypercall.
>>> Yes, you are correct.
>>>=20
>>> I am thinking of pushing this further up ie have this requirement at ma=
rket level and leave it **unlinked** to any product requirement.
>>>=20
>>> IOW, we don't need to validate each and every error code returned by th=
e hypercall.
>>>=20
>>> Or should we just drop this requirement ?
>> I think you should move this requirement and make it a generic one valid=
 for all hypercalls.
> Yes, I will place it under hypercall.rst.
>>=20
>> Now at some point you might have to describe which error is caused by wh=
at problem as part of your hypercall interface definition.
>> ie: one generic product req and per hypercall design req describing the =
error cases.
>=20
> Agreed.
>=20
> And an example design requirement which will be linked is :-
>=20
> Xen shall return -EFAULT if it encounters an error while copying the extr=
aversion string to domain's buffer.
>=20
> Is this what you have in mind ?

Yes it is.
But is it the only error that can be return by the hypercall ?

Bertrand

>=20
>>=20
>> At the end you should have a test to trigger each error condition and th=
at test will be linked to the design req corresponding.
>=20
> Ack.
>=20
> - Ayan
>=20
>>=20
>> Cheers
>> Bertrand
>>=20
>>> - Ayan
>>>=20
>>>> Cheers
>>>> Bertrand
>>>>=20
>>>>> +
>>>>> +Rationale:
>>>>> +
>>>>> +Comments:
>>>>> +
>>>>> +Covers:
>>>>> + - `XenMkt~version_hypercall~1`
>>>>> +
>>>>> +Needs:
>>>>> + - XenSwdgn
>>>>> \ No newline at end of file
>>>>> --=20
>>>>> 2.25.1



