Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A39903338
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 09:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737895.1144395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvdM-0003ZC-Sg; Tue, 11 Jun 2024 07:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737895.1144395; Tue, 11 Jun 2024 07:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGvdM-0003WN-Pc; Tue, 11 Jun 2024 07:09:32 +0000
Received: by outflank-mailman (input) for mailman id 737895;
 Tue, 11 Jun 2024 07:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X7bi=NN=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sGvdK-0003WH-Ip
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 07:09:30 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20610.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89f5f709-27c1-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 09:09:27 +0200 (CEST)
Received: from AM0PR01CA0147.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::16) by GV2PR08MB9925.eurprd08.prod.outlook.com
 (2603:10a6:150:c3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Tue, 11 Jun
 2024 07:09:17 +0000
Received: from AM4PEPF00027A68.eurprd04.prod.outlook.com
 (2603:10a6:208:aa:cafe::86) by AM0PR01CA0147.outlook.office365.com
 (2603:10a6:208:aa::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Tue, 11 Jun 2024 07:09:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A68.mail.protection.outlook.com (10.167.16.85) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7677.15
 via Frontend Transport; Tue, 11 Jun 2024 07:09:20 +0000
Received: ("Tessian outbound 0445a89d5280:v332");
 Tue, 11 Jun 2024 07:09:20 +0000
Received: from cc4cd251fb73.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95E8E8A4-8798-427F-B76A-BD33C8437888.1; 
 Tue, 11 Jun 2024 07:09:14 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cc4cd251fb73.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 11 Jun 2024 07:09:14 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by FRZPR08MB11192.eurprd08.prod.outlook.com (2603:10a6:d10:13c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.37; Tue, 11 Jun
 2024 07:09:12 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 07:09:08 +0000
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
X-Inumbo-ID: 89f5f709-27c1-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=O9hkJGhDPqShSDuVJSwwfbgFQ9kuHxqLWp0evB1QWjQVz9Adj8iLnNNR1xRdqtEUAzaXDDWMGfSVcdmVSXzJUdTm/hqSXIhzegyN452suxul6Ji6qyyWvHVmxoGGNTb3nLUntz/1EP6oovAp2Fs8ECAYWlaXfRCpL6mdiqwSg8cOo782HCHRkf7n3to1C2fQ1gOgqZkrjmM3nxL9phdywElBem/nO8MoiVASX4XHpsqawEz9Rz+kZ0tKShW98fuflavF9H65uV2F9ZPi+NiIUaz7UwuFnYgny0GVSeaMm9S7r+8I4gfcGeO2nUcl0Y/rk5AC2I9/c6oqB2jFkBDbgw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOIwESuqNCQdxuNEAdJsvkDTLrPgkfSnOuwTA5Bkni4=;
 b=HBoLO0KmArR6TlAccCSuH5DOkf1zWi4ZmtDWS9fRcMWU7jn3N8AN8mEXJLH+bD46ae9sWvAEwynPHgq7gK9qsk5HuNyNNbrhgjIfGGB7ggPE9lpsgATOrANlAi1Y5aVNAFiV9rlVjnHDpjb81+zAmv+bBcKJQPXNteTvLj+Fu8OfXD8irJPAMJwxLwJUzbz3QW5E0X4Ue0xcZ9iXrFca6Zp7DCIThHcxi5Cw0VYyS0Qh1IkbSy29P1pEVCq1Sj9kBD3P4VN2SQefADi5FYz6tEINYa+a/4SYTWsh/LoiTsCJPwbV+owfEsKUb+fSGmpfxdyJAF+V3ggCbFP0Z5rxag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOIwESuqNCQdxuNEAdJsvkDTLrPgkfSnOuwTA5Bkni4=;
 b=To6t2fArsygeH2OAGLh7E4b93p3ufcMmragkVdroNvFAggRr7U0UlRAHgG3GexAoNrKsy+OGfBqKLPFTrmvvSYIgKrl41XkocTadD2IGmweb3H6PrRqNB1hYYP747xR20EYdeyh9QWGdOn2WpJVF7EvZ7h33FlIV0hfuC/BEvsw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: edc5ccbdb2b44d33
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etZylHpzGtoeM9+yxzd+tVWj0c75Sn5+M7AtCPqWz9PksBZ9hC3bFaVIBfsFnczIC7QAegWmzy3Us8p10AOblGvwRljzFKB+EVHhl057n8kY6ykyGBKWzYssp3Qtt0QXspsqnOOovIWxUPaBem2pIW64CrR5lQWfbgPriXR3t1nkTd+YZnPtOTiAUKNYMAK9NjINkr2Ku2IeBm2tM0cs7xa3425HHBLNuwqUkre4MQ243ifXo9WUqKRPr8FQV1odHboLnPqKFFDPU0GIKy2mZu2ZF9rADYAlJwTDnXHSWmi5R4BMqcWEnFs3t2NgEb9crcnW/ohp+ZZGcG+iVJV3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xOIwESuqNCQdxuNEAdJsvkDTLrPgkfSnOuwTA5Bkni4=;
 b=oNXOyFvMdzevZvTxYHoPS9rGObsPcF/Myn5FjSNFHfqjMQmlgpCYPDP4IKA0YzyJsfWn+3Mn/Q54wgKDc4XE0Y9Nlg4sN88n0Ghsa3L+BpjrLezoVtc3iR5/wakcGzKkOHs2nsQEXKZELoEVSHdAPGvEfAirPQLynx3MPSyOJF17zV18iO/Axl8c0RYdFCQsbHc6IWkn6DJRs11cY+WCIzPLwDQd/bq4a7uUqw7hDBfX/WxMP5OiFIjJlFDf7dt/muu73uUYEdRRmRYJrqWvAp3yKXmzw9VeIBvYExxB4W4SVY7ywtw3jWvobyOyEWA40B8112LYddX1+u3V1diOjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xOIwESuqNCQdxuNEAdJsvkDTLrPgkfSnOuwTA5Bkni4=;
 b=To6t2fArsygeH2OAGLh7E4b93p3ufcMmragkVdroNvFAggRr7U0UlRAHgG3GexAoNrKsy+OGfBqKLPFTrmvvSYIgKrl41XkocTadD2IGmweb3H6PrRqNB1hYYP747xR20EYdeyh9QWGdOn2WpJVF7EvZ7h33FlIV0hfuC/BEvsw=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>, Oleksii <oleksii.kurochko@gmail.com>
CC: Jens Wiklander <jens.wiklander@linaro.org>, Xen-devel
	<xen-devel@lists.xenproject.org>, "patches@linaro.org" <patches@linaro.org>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: Re: [XEN PATCH v6 0/7] FF-A notifications
Thread-Topic: [XEN PATCH v6 0/7] FF-A notifications
Thread-Index: AQHauwL3zf/sfUoleE2hXc1GLXTtIrHBJtUAgABPbgCAALAvgA==
Date: Tue, 11 Jun 2024 07:09:08 +0000
Message-ID: <8558AEB5-2F38-4F8C-A017-794E32045068@arm.com>
References: <20240610065343.2594943-1-jens.wiklander@linaro.org>
 <3C40228F-21AA-4CBF-A4BE-1C42DE6E94EB@arm.com>
 <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
In-Reply-To: <615f1766-253d-43dc-b0f0-f8e2eb7360b5@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|FRZPR08MB11192:EE_|AM4PEPF00027A68:EE_|GV2PR08MB9925:EE_
X-MS-Office365-Filtering-Correlation-Id: ae00cb4d-15bf-45a7-9763-08dc89e56a76
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|376005|366007|1800799015|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?IpOxQOLeamimOT5f84QOBmz9WsLCkMA9nJLJdOpHomKwChdyL2ZzLNvXyn//?=
 =?us-ascii?Q?ECTKfm3mSRy287/jlXJA9d1hYQupOhM5S7JJGNNpYCM/kgGRxeoHPq0tr9tt?=
 =?us-ascii?Q?ymSbjNxJ0UR7tchHLdd1hKq+l1xGlxgDREDHRoxzXmam5wgnWiq0Yyb/KPKt?=
 =?us-ascii?Q?hUcuWapqauBWIfDlQiClkCUfSAqSg48o3OGEdgZVwr/l9rQv8j4Ei05A4jZe?=
 =?us-ascii?Q?VJZIb2jPbCLyoi9+8/XSORUgiE9K5orfKcCsfhkdYDiT6ohpekAOLDLO1c7V?=
 =?us-ascii?Q?LAc7ghu8k2J0HBD4bUcTpr3pAeIm95c0AYSpnlIKhf/OCLYVG1qCDZaMSxn8?=
 =?us-ascii?Q?6Yz0U2Abl8lm8SmsuIJx0eKti4BCptG0NvbuF99vqJAqYsgcGyRu1+tT8CWs?=
 =?us-ascii?Q?R9vLONpK4HjFzFOlZdsEk6q/gB051nV3KZY0amwTTvt9q4BuJjoFPSZao/n9?=
 =?us-ascii?Q?ccaiq1gl8IyN6kd7+xvZqJwilJNINQL/edpDGE1uPeml+KIGanjGemTSqD2b?=
 =?us-ascii?Q?Q4FlQPcGTvvL90eIF7Bu5U5gdGCOx5+T1h6qldhkuWuIIEJxcrMmJgxOnQkK?=
 =?us-ascii?Q?CsN2Fu0gEJVJniLe++Jt/mm9PR7KyEAYR9g/wovfQG3Ac1v8EuZT1FHP2puj?=
 =?us-ascii?Q?MI8rNKkfAp4xOr0cBgoJEtOG7/gipOHBUnGspDbi0ijPdElaygg4VzK6CPkg?=
 =?us-ascii?Q?swTlIf9cOGKph3aeK/sZILBvNIxNXVrwfjDsHVwXNgHzki1fV/v3/M/WvmLs?=
 =?us-ascii?Q?C819iFjT1UpFxBVlL0t5MMqkgC0XCV7TC4yREBjbD6vHJNIfa/3l5ar8KYLa?=
 =?us-ascii?Q?L0B1QP1jcx8ZyqTeIAdzSLyl8Q/fj4NsbJGfA3dKj2KMC94JAziPEmABq4nR?=
 =?us-ascii?Q?bw9bN+zMR6wOqfo8Q8yoUOkZYMAyMmXm8gRTFow9WV4jv1FYtJi8LSHEmIz+?=
 =?us-ascii?Q?Lcxw/0K/zb8nCK5UdGPeLIRZprnPniA/KF0DkLCnmEvT11D8pvO/mv1qNpg+?=
 =?us-ascii?Q?P9viNl6+u3hLLsPdElY87QnKvejMgOEruXDRyH+Fd6AT1dbJCJLyyRkoqWud?=
 =?us-ascii?Q?9aeqay8XuBGFsbV2KDS8onRph2zRFLZmwANdzW+ZjEdb6LbxfTs+EcQC4FiA?=
 =?us-ascii?Q?DGYZh9E2qhOGuN+8fbJsmsDSunIX5q2X8RNIRAxWO7Av0R2r9S922r5i58m+?=
 =?us-ascii?Q?BWXUrJvdvrzqIos/mcTJhhGLfFSvFaO/+mawaSXecSv7z9xxMQGQjsdxB4S5?=
 =?us-ascii?Q?gqm6P2GuFqk6yCv8uO0NmHdLLqpDOZnLRX0d3k7CDpobhvjZ1ANbfcJ0rBn5?=
 =?us-ascii?Q?r+x9qelk6FkooNcAYNGwDtUs?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4940ADFA46C775449E47820770F079DF@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11192
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	35884d9d-d1de-48f6-6313-08dc89e562fa
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|35042699013|36860700004|82310400017|376005|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mNlhDE79dkinkMapOr0YW9LlFF06qDDfaIqg5sDuhlBEmf4r33x5nv3bdxtc?=
 =?us-ascii?Q?3yj2rnlRVIwwaLQI43nwQq77mRyknGJ/FqLSgDkQGmPKaoq/FVGX1uYZ9k/P?=
 =?us-ascii?Q?g2HXPN7KeoAjVye93S7hr6GZrD21rKCoaz0mkIkC7tkPI70ltP4DvuZy/EsK?=
 =?us-ascii?Q?6dWh1o7ivkm+RJe4NzuKgmaFvNwdtvEW3YlExbfO55fsl06KoNkFA4YrzECQ?=
 =?us-ascii?Q?8oyJVObLch1W5ag+4Q6iH3tROxDdSpUSJJii1YPsN/BKN8qVs8NMDPWIRMmu?=
 =?us-ascii?Q?FnHdLUOhaG2HE5ED2fMeaLswJUqI0tK4uO2gVUb4EXXXjaRMR7TpJpAvQIfc?=
 =?us-ascii?Q?voS6vzbI7dELBHqpRE0G/1UAEuplKSJ6bNTxIwUkjk6ad6g0K4sRSLeQMoSs?=
 =?us-ascii?Q?VBPEFy7YoYDrmJGwzsvNIRusftJOmDMLaJntCnSRB1pd7m4uWNvOVEqwDNd2?=
 =?us-ascii?Q?w9ZHgB1aZ8lpyr96Q77rUwBQtQVdiacSCjozt8ILP2GnDQM5SAzret91Eewc?=
 =?us-ascii?Q?QNZrJ7De/8cUGuR5Ml6QqtmE9H6HqhGqUmy4aV1d+Fr3IVjAzZdUtX6yo5vP?=
 =?us-ascii?Q?WK3+MJWXGRT8RVr+JPrDK3Kr7h3hD/1fY+YbyAJfPO9bu/zj1ntt/DuDUfw2?=
 =?us-ascii?Q?SNPSvteLL1N4WUfJgnXI7jXyo0V2l0XODRxeQYsQ2gLgi9o0ZfDtRBut2Wzi?=
 =?us-ascii?Q?NJSaB6UPmCiB0zdf3LOxGcPt+s1YsTsL/AfAxcbApn+z9G5XCLCggvf039DU?=
 =?us-ascii?Q?72Qn9imljpbi6XU9cO8DyWrjWmnlaTsvvmVF8pOrs8WyDkf1cAySutgsH3XH?=
 =?us-ascii?Q?BXf0ZtAryXCglWIWYseUFtwrlKWdkRJjkmrnfMoIMSk8OiLNheHJ9eQxTijd?=
 =?us-ascii?Q?VQFSglLgWg8HGWz+G9XRy1TQNHnkDrt/5wfhEqnem3VIxIPm5zIc6M7fu5hX?=
 =?us-ascii?Q?atZd9rsnzRO1zfmwcgEgAQxTII0PZ5hgg7PJ5XyA87RlDrAoVcAn0O1X8IDR?=
 =?us-ascii?Q?2lzQYyttMMNw3CaV4P3WLf4pOsQZI5yqXP7YIkU8szlktFCyh88p7h3oEpak?=
 =?us-ascii?Q?fkdErbu2XWfSVZaWWoBGqKfH9jUkctCWMO9PPUkhyfr4jj8zFIQ7OIX0kTNk?=
 =?us-ascii?Q?IPSQtCi0BBSNTR18+WqiISYJ6qjj2OLcfkzwG8HCc0Q7S9Rv/ZRZvvHfjzyx?=
 =?us-ascii?Q?k3f4/dF7gUt/IPNAjO1wNr3//XR/dVMZGf3V4PQrBzLPSVbUB6Rac3pD3zov?=
 =?us-ascii?Q?kcgSNJAg9qWWDuhGGFSu/zQrb9+MNg/zZEqA66opXZdNi8Y8wwXiE9ZxUqUw?=
 =?us-ascii?Q?4sUZzt+pjj+gIRsaz16QR8kx/RctUxk2qdK2c4fgNo5H0pW1xw1wEsCGg1A/?=
 =?us-ascii?Q?f1ZzUr4=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(35042699013)(36860700004)(82310400017)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2024 07:09:20.5972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae00cb4d-15bf-45a7-9763-08dc89e56a76
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A68.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9925

Hi Julien and Oleksii,

@Oleksii: Could we consider having this serie merged for next release ?

It is a feature that is in tech-preview at the moment and as such should no=
t have any
consequences on existing system unless it is activated explicitly in the Xe=
n configuration.

There are some changes in the arm common code introducing support to regist=
er SGI
interrupt handlers in drivers. As no drivers appart from FF-A is trying to =
register such
handlers, the risk is minimal for existing systems.


> On 10 Jun 2024, at 22:38, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 10/06/2024 16:54, Bertrand Marquis wrote:
>> Hi Jens,
>>> On 10 Jun 2024, at 08:53, Jens Wiklander <jens.wiklander@linaro.org> wr=
ote:
>>>=20
>>> Hi,
>>>=20
>>> This patch set adds support for FF-A notifications. We only support
>>> global notifications, per vCPU notifications remain unsupported.
>>>=20
>>> The first three patches are further cleanup and can be merged before th=
e
>>> rest if desired.
>>>=20
>>> A physical SGI is used to make Xen aware of pending FF-A notifications.=
 The
>>> physical SGI is selected by the SPMC in the secure world. Since it must=
 not
>>> already be used by Xen the SPMC is in practice forced to donate one of =
the
>>> secure SGIs, but that's normally not a problem. The SGI handling in Xen=
 is
>>> updated to support registration of handlers for SGIs that aren't static=
ally
>>> assigned, that is, SGI IDs above GIC_SGI_MAX.
>>>=20
>>> The patch "xen/arm: add and call init_tee_secondary()" provides a hook =
for
>>> register the needed per-cpu interrupt handler in "xen/arm: ffa: support
>>> notification".
>>>=20
>>> The patch "xen/arm: add and call tee_free_domain_ctx()" provides a hook=
 for
>>> later freeing of the TEE context. This hook is used in "xen/arm: ffa:
>>> support notification" and avoids the problem with TEE context being fre=
ed
>>> while we need to access it when handling a Schedule Receiver interrupt.=
 It
>>> was suggested as an alternative in [1] that the TEE context could be fr=
eed
>>> from complete_domain_destroy().
>>>=20
>>> [1] https://lore.kernel.org/all/CAHUa44H4YpoxYT7e6WNH5XJFpitZQjqP9Ng4Sm=
Ty4eWhyN+F+w@mail.gmail.com/
>>>=20
>>> Thanks,
>>> Jens
>> All patches are now reviewed and/or acked so I think they can get in for=
 the release.
>=20
> This would need a release-ack from Oleksii (I can't seem to find already =
one).

You are right, i do not know why in my mind we already got one.

>=20
> As we discussed last week, I am fine with the idea to merge the FFA patch=
es as the feature is tech-preview. But there are some changes in the arm ge=
neric code. Do you (or Jens) have an assessment of the risk of the changes?

Agree.

In my view, the changes are changing the behaviour of some internal functio=
ns if an interrupt handler is register for SGI but should not have any impa=
ct for other kind of interrupts.
As there was nothing before the FF-A driver registering such interrupts, th=
e risk of the changes having any impact on existing configurations not acti=
vating FF-A is fairly reduced.

@Jens: do you agree with my analysis.

I made a text for Oleksii at the beginning of the mail.

Cheers

Bertrand

>=20
> Cheers,
>=20
> --=20
> Julien Grall



