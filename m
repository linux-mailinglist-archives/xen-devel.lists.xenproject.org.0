Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EEE93ACDE
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 08:59:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763776.1174091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVxQ-0007HD-Gy; Wed, 24 Jul 2024 06:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763776.1174091; Wed, 24 Jul 2024 06:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWVxQ-0007FN-DA; Wed, 24 Jul 2024 06:58:40 +0000
Received: by outflank-mailman (input) for mailman id 763776;
 Wed, 24 Jul 2024 06:58:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hPJw=OY=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sWVxO-0007FH-MR
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 06:58:39 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2607::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2612c0ef-498a-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 08:58:36 +0200 (CEST)
Received: from DUZPR01CA0262.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::24) by AM9PR08MB6019.eurprd08.prod.outlook.com
 (2603:10a6:20b:2da::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.19; Wed, 24 Jul
 2024 06:58:32 +0000
Received: from DB1PEPF000509E3.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::b1) by DUZPR01CA0262.outlook.office365.com
 (2603:10a6:10:4b9::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Wed, 24 Jul 2024 06:58:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF000509E3.mail.protection.outlook.com (10.167.242.53) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7784.11
 via Frontend Transport; Wed, 24 Jul 2024 06:58:31 +0000
Received: ("Tessian outbound cd0b9b5d6f11:v365");
 Wed, 24 Jul 2024 06:58:31 +0000
Received: from Lf8c020d5d75c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 30E89B7C-188E-472D-A4A7-30FCA8EA3E3F.1; 
 Wed, 24 Jul 2024 06:58:24 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lf8c020d5d75c.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 24 Jul 2024 06:58:24 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB7899.eurprd08.prod.outlook.com (2603:10a6:150:5e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.14; Wed, 24 Jul
 2024 06:58:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%7]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 06:58:22 +0000
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
X-Inumbo-ID: 2612c0ef-498a-11ef-bbfe-fd08da9f4363
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XC/3A8/g6IUkry3XG8t3b9Z+hYKtOzlswcJn4T8I22YBy07gNRY+CeixazXY2XqK8ffv2YbrMrymzFZuBlnwp1aiBKSQPZsDb2lbsPl3m5U15dCkVI4WFpKH/Amjslazma6UHSjJubxqks6lI5RZX5AWBEIBvdwHos4pVrMl3BnB5xLM4IQ0cjzl36I1q7ARADvzZUQkx6Ljxn6vq/kp62vTxaOW0k5GZOgwaDCTuIatKeFnvGHPSVK9AvgT/puPZY0Ja7l5fJ4fVp/ZIBqY6z+8Kd4EahRD+De6RKFCrvXvNmFYKrFAMav6BQtS0pfFDNmXZMgbu08oeOXpLP6MKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STMM9gnCdcRI3+WIFUerMS57w76gji1YK6QzXU6p6EM=;
 b=HybZCMjgB9jpIVdR1ija0emPbUVu6siBsqV1hTNb1Y63r9g1MoDA5QFkD+KIcjLp2xfMXWk7C9ebV72bdsPDpwcTwbKPAqJ1UUNDBcGS3NKVJQ/VdBnnP/wY1ARYZcY6gn2ox3748IVNTbrzGD41rpwvGJ+UW46knmrlgOxt3RIaMhm5Mm7Jos+0m9Gc921LiS/C4n4fWOi+e0pE30mO4sQsJVJIsH8XYr9XlB+0WYrxPNSRcxRPANAPhY0kc61jaWCmxLJxr3PNYS6ndfnw7wSqBiEprtLmZzwqVDYGIcJmR0a82W3dyT7CJtg74p0RbgU+H6rruuS2OsC6PUc96w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STMM9gnCdcRI3+WIFUerMS57w76gji1YK6QzXU6p6EM=;
 b=jedbnFY0gUZr2sotbZhy9OQ83dyCTMZaE+VjCLtvtwu6b54pMwFU1ne5pBYtV+2OujNamZptGilzh1qjtMD17ZMK+oB+rXfEyqam7QApcSRLHwqchDPHBwZGNkqdF75AYZh0sPVkiAkXx5bK0Hsg+iY8SMutZXP1zom7pqlI3TI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7ae77e5790761d55
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f049cRIVES87bWIXbBsHeQHVtLHjIaFeKKSfWjBJCabv8LJHpZfUYPmFCY/HKysjczgHsx5HHAqXdygNz42nyXe7lpmwpEFlVFMx2GabT/XUVENmhSYJP+rBvwanrGtL+MCiXQ2fDJJZjtlLDkzUSh/P/ARcLJidQs7H43xoC8m/laAsuL4hNwFqWbv+dwEGwTFDMru/ztr/jHr/T1zwrtejXn2c4HNWkPAYkZPs1y/3VgbqRaf8Vt+WJoa/H0v+UEzGLYZhDPM555tUqC2ezABPm6HyxjUIZiCf1ldU9xagVztZmCCb5zh3F1gtPWMDVZnlZ9TRguvWu4Ey1khvqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STMM9gnCdcRI3+WIFUerMS57w76gji1YK6QzXU6p6EM=;
 b=V622p6lAJBbLnWJiQuPkAQzZNbyPoX+QGwqfav5rmaKDPQle2N1B8YmKiK3eRMr3jWPY7WL/vnicCB1PsBDXJBZKij8vVMeorY+lXr6cTLLaawgocgyavEmh4fqjvIkGGCWYg59skGpyaL+QA3Z2LFJuWbh+IxLfiDTykFT0t3Yz929XzkrrHpbr9A80R42mSogbbsEWjXak8whryKWoC/Zn+wXd1lm92HoGCgbo0riT8vG3/kuYoQ8mJOBW4SU+Hp9JRekkN3KJPRdxia6pn2ZcLTJvDwHG133ZgchHHxY7bTrmWmld1oL8yjDKWOg5GgFXL1Ods6SuM08qAHCZiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STMM9gnCdcRI3+WIFUerMS57w76gji1YK6QzXU6p6EM=;
 b=jedbnFY0gUZr2sotbZhy9OQ83dyCTMZaE+VjCLtvtwu6b54pMwFU1ne5pBYtV+2OujNamZptGilzh1qjtMD17ZMK+oB+rXfEyqam7QApcSRLHwqchDPHBwZGNkqdF75AYZh0sPVkiAkXx5bK0Hsg+iY8SMutZXP1zom7pqlI3TI=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH] docs/misra: add R18.6 to rules.rst
Thread-Topic: [PATCH] docs/misra: add R18.6 to rules.rst
Thread-Index: AQHa3UkiFuR/2tGAzkO/R7OVV1IOyLIFcx6A
Date: Wed, 24 Jul 2024 06:58:22 +0000
Message-ID: <FCB77833-0354-4DC4-AF63-3E0280C21B05@arm.com>
References:
 <alpine.DEB.2.22.394.2407231439260.4857@ubuntu-linux-20-04-desktop>
In-Reply-To:
 <alpine.DEB.2.22.394.2407231439260.4857@ubuntu-linux-20-04-desktop>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.600.62)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB7899:EE_|DB1PEPF000509E3:EE_|AM9PR08MB6019:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a33e2e-9c1c-4933-1190-08dcabae0792
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?R8p86fiMIfntUafmh2J9+YFBUq5IQTPBj5bEwGAgzhPJI6yRC73uVJgIzn?=
 =?iso-8859-1?Q?3rmcoByQ3tc0ZWFIuuOL6nRmyq/1xzSgz8iKBkTDDEFwbhO9ahkIJZWbF5?=
 =?iso-8859-1?Q?KvFv11Q99D6WQO4N0Pi5zuZPa9ND1/17OVxCjpCWcMxx67jDipi6J96XmZ?=
 =?iso-8859-1?Q?gLZJ9sqkkr+enSRJLWH+aB0Iwu0sCTGo4tn7MzhbaMvoSrg3qrXsq522kq?=
 =?iso-8859-1?Q?LJJLWpHJP48eKomDL1Wmzlt8ov1pZMBYiyGC0CYrqIcZwlsLzyIMQ0E3JG?=
 =?iso-8859-1?Q?JUm+WU51AmCfCtD/zui/mz0Xun695NlHEQ28upmqTb7cvUss+0tkZHtmUL?=
 =?iso-8859-1?Q?Y0CqQJ74vfD+HVOy50TSAxNCjE8wK+hi1XBMsnwtveIQEWpWtoKDcguXub?=
 =?iso-8859-1?Q?I0FmljUZCRqtloewwngXlHj750hOwT+6ygxqssC/eB6Yksbca2486r+NBi?=
 =?iso-8859-1?Q?oUGMKpJUTM3MATubk+Vs4oa9Th8aj4aX7O9TSdKe1u3YbIrzedGoTbf9kU?=
 =?iso-8859-1?Q?EO5sEfBbLbAAuSnR6v0IJOz8yN0d44S7e9ou4ufJwlVFuTJJVnC5QBm5/J?=
 =?iso-8859-1?Q?k9WcKLpj4evmv/RypF45AFKAXttDRr4tOutml3IIxnCpAstZkeMAcuBGN2?=
 =?iso-8859-1?Q?4Q+kPLLglyeqzEmRcRSACGyWTnjrPbfl5Aywz1pImvyVOGwX2INc5hHCsf?=
 =?iso-8859-1?Q?l5DynjyFW18YxnbKWUViQ/Gl7T4edjTO8oojsblp9oP4CcEt7d4SpZx8o9?=
 =?iso-8859-1?Q?h7x/mMH5rQZ97xJ7pIg17gR94DaBEkesmRpCNQoBF2Nq+DbJlSvP4HZ8gV?=
 =?iso-8859-1?Q?iVgBKEzlInUq+gt014qvaP7DgU3P1YsMyM6tpPViLCZZ5WIgjCB1oeTSru?=
 =?iso-8859-1?Q?qDphwtaG3HsfOyJsj/Os/Y/SbfsMHv7MgQD4u2QkeuZc+iOjf7qYdQVqem?=
 =?iso-8859-1?Q?OYTqmq5JUnYVLs67ZmYEXMfnWuoL+IpQPPqNAEw56OP55YkmNMx5jgcmR4?=
 =?iso-8859-1?Q?rz7VMTGGL3qae3przNjoS8E6m9lPznoBH+lpDIDLZkM5clKR3ESEf8cMYX?=
 =?iso-8859-1?Q?AkUiQVJYMawhMVyXaxd9dPYJG/TTdi39JecxArFwtWRebh8v9vXJ/sHTzv?=
 =?iso-8859-1?Q?cwh+02jfYftlEHJIxpZA+rmYeyJ6zjJkvdIp0zgB5dLdx9/bjMtCeTaQT4?=
 =?iso-8859-1?Q?H7i1qds+cvlzBL5Ir+DF4pEjuVZYrC4MQJmYiACFo87JjK9avgYyrOXQzy?=
 =?iso-8859-1?Q?e3uOC8vs2kMER0DViCem1CQUKefqX834RakjQTdE8Tah5Jgvs+xZfeB+BR?=
 =?iso-8859-1?Q?WegCryVVoE+clJHA6CfcvfSN7HPu4yok3qeolGsuYPCZSrHPEndFrX+6lD?=
 =?iso-8859-1?Q?5nk8EmZ+X9V7ZjpPxsCTW5xdfVDjPrWoLv9bquWJFUJ1XlOuLTvGQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <5FD054957598AD49A76D6C43A6076390@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7899
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ecafff28-4714-4a5f-07dd-08dcabae01b9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|34020700016|36860700013|82310400026|1800799024|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?6gtu9p4Dq01QjCSuw7FDKbjauV2jNHn1gww6uxxlSgdL8rgMU9e17tc118?=
 =?iso-8859-1?Q?/g1GEUy8z5fbuT0aVlIwEQk40fzicAA2ieluICig1bF8W1wYnDGIdAQ1sh?=
 =?iso-8859-1?Q?lLlz3gWVPEBKw8ltGLEi4DciuFBD7B9AFZNVM4vrF9G3/+AtBuQtvvWGXE?=
 =?iso-8859-1?Q?vDKmDkt5FBioM7zY3xFDaXCN//hA+RXAFXIRqZlcnhzBeuyf/WU1UEm5x2?=
 =?iso-8859-1?Q?SL3VykhJxzqphQLnFF6l2P9Ztg8ngJM3rm1ffHlJV9SPJlf6hS02K7XiRN?=
 =?iso-8859-1?Q?scdXdg4T475UIs+oKIk2I7UwMTDDfBYA3GEfGFtI+tTLIVfr30XS6i/GaY?=
 =?iso-8859-1?Q?V2a1igR7v4Ou6VVsfpTqyUnMSFxn/adrEwg9OWcnNNMYA3g9QceoOTTiBl?=
 =?iso-8859-1?Q?kcMEPmZeK0/Vuh6UlePdwxzKH4P771JiikuxoL+jK0gkkEotutIWl38M6B?=
 =?iso-8859-1?Q?A8Xbcdmt/sdTmmEv27CJlj+qjY2RrDlZnXOQJ4Rjqyat8HnMuj2EOOh2d1?=
 =?iso-8859-1?Q?/qsKfD2RgBNTTWerefZDtVrO1E1sJ9w8UPpuJq85Lwoghvjco4ap3A7tX2?=
 =?iso-8859-1?Q?feoN/KMrIKIYfsKStnomfZE3yaby3ZLcnsD2ZusrMp4e/3gAakaYNwF00Q?=
 =?iso-8859-1?Q?5cs00kdpCGn6yD7jqf/P1t0Cer518QFaZkPTiKpEUVA1LQwGwtmWyuNwDO?=
 =?iso-8859-1?Q?9FevWcQ+0DnM10ViMkWEHNHb9t8hPntVgdpI23BXFWG6d29NK4kN0I9ktg?=
 =?iso-8859-1?Q?vZXQvzAzMDe58nYtQIo6nkWkw7ho9x7XzH0oMjxnq/PfQ/CARM4DXWvqhe?=
 =?iso-8859-1?Q?BlhYZ1QvnB0LHYX6XsbFpfxRg+OO3oig/yMA3Bl443yVxp86nNHCcSo1ri?=
 =?iso-8859-1?Q?aHlMWQDlNTPUdxhcOzGh5CYRTsQRKYq7RkY+Qm5k0zvjEvnxGRZd3I4Xox?=
 =?iso-8859-1?Q?jyUPXv2ICFqkgZzmDuDQ+L1FOtSEi1uQfwQS7533byJNZiX++6qYZotCmS?=
 =?iso-8859-1?Q?e+Tv/k4YpVEOK9XocEJRHkxHBo8HTh+osgGCSW3emrXbuGwxZ874Qvvt+F?=
 =?iso-8859-1?Q?iaCEy4i47okbn09Rop2EFll7lQo2qLfzq6EERxJ0ZWf8sp8X8IPXW7OJ3L?=
 =?iso-8859-1?Q?OzG+JDctX48q8mfZiNTqY4xEHBwRBwlKArxTMoWyZh7Ip5dOIgx7J4G0y9?=
 =?iso-8859-1?Q?Gzc3tPq7vWo3LMhNjverpyC4Vjt9hLX1chx2EdxN5n+OoBKWziAGYDP/RC?=
 =?iso-8859-1?Q?6UGn5XF9LlHyuibS4LECxUOONCaSHKSJIqzbaJrZLuwJS99LUlG2BHL9SX?=
 =?iso-8859-1?Q?jiBeFD3dCNh9hy9qo25qXgoQuIP+fY6s6Ta3Vvq/6/FoTHMdGz4Nczcme9?=
 =?iso-8859-1?Q?X7KtikHdUwOb0HAU3hZ7NkSG6jzG/A67qh0HgXNO7T5PiO6/UWDDgZzedy?=
 =?iso-8859-1?Q?Iv6p5wkeR/+mwgBV0uVBwLtLuyX5C3CNIIpMcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(34020700016)(36860700013)(82310400026)(1800799024)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 06:58:31.9440
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a33e2e-9c1c-4933-1190-08dcabae0792
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6019

Hi Stefano,

> On 23 Jul 2024, at 23:41, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> In practice, we are already following R18.6 and we have zero violations
> reported by ECLAIR (there are some cautions being reported.)
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 80e5e972ad..0cb2fb8f24 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -580,6 +580,13 @@ maintainers if you want to suggest a change.
>      - The relational operators > >=3D < and <=3D shall not be applied to=
 objects of pointer type except where they point into the same object
>      -
>=20
> +   * - `Rule 18.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example=
-Suite/-/blob/master/R_18_06_1.c>`_
> +     - Required
> +     - The address of an object with automatic storage shall not be
> +       copied to another object that persists after the first object has
> +       ceased to exist
> +     -
> +
>    * - `Rule 19.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-=
Suite/-/blob/master/R_19_01.c>`_
>      - Mandatory
>      - An object shall not be assigned or copied to an overlapping


