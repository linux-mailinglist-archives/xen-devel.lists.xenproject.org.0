Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E59761CF
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 08:48:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797029.1206788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sodcD-0006IO-6K; Thu, 12 Sep 2024 06:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797029.1206788; Thu, 12 Sep 2024 06:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sodcD-0006FQ-1d; Thu, 12 Sep 2024 06:47:41 +0000
Received: by outflank-mailman (input) for mailman id 797029;
 Thu, 12 Sep 2024 06:47:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r6oU=QK=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1sodcB-0006FK-4u
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 06:47:39 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20630.outbound.protection.outlook.com
 [2a01:111:f403:260d::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4e3ffc1-70d2-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 08:47:36 +0200 (CEST)
Received: from DUZP191CA0042.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::6) by
 DB9PR08MB9801.eurprd08.prod.outlook.com (2603:10a6:10:462::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.23; Thu, 12 Sep 2024 06:47:24 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::34) by DUZP191CA0042.outlook.office365.com
 (2603:10a6:10:4f8::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Thu, 12 Sep 2024 06:47:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7918.13
 via Frontend Transport; Thu, 12 Sep 2024 06:47:21 +0000
Received: ("Tessian outbound ee7a81b3b7b9:v441");
 Thu, 12 Sep 2024 06:47:21 +0000
Received: from Lec8d245cc2db.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3843F86-76CA-4E24-9339-E0787BBEB987.1; 
 Thu, 12 Sep 2024 06:46:22 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lec8d245cc2db.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 12 Sep 2024 06:46:22 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by VI0PR08MB10485.eurprd08.prod.outlook.com (2603:10a6:800:1b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 06:46:16 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%4]) with mapi id 15.20.7962.016; Thu, 12 Sep 2024
 06:46:14 +0000
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
X-Inumbo-ID: e4e3ffc1-70d2-11ef-99a1-01e77a169b0f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NisGigYWN4DP3Dt/466eP79go8Gy6Sresa936kwoCxNrwSKskTics/ZuLuBb0R1mHYl2BQdM94kh6CtMqxhFO2LxXTlHhb64XzBKvohWj117G7bUezml3vvIirZ9jRHJHn584UIhuUTQGhEZj2IX+25We5s1kGGF9ah5Wmd6XDGStx1tXACJOgIToVNZKgMJu9zxvnf2Wc5x2QHXVrijD7noEtsRL20dVFspvpzN/oPtp4a0WMVRBEZQ2FL2AQFWDFUhHwAfd2V3QRX0JpRlgU/ulObkPVq1uh82P8QTVdb9enuzRAPzNLoE2r26KPYRD94npUdyjw/qtywdXHOjzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGFUlgp5aeB02UooOTDR1oOsQaKtMODKc3eycQxhWao=;
 b=TskfqZwzOZtDadsrHLuNv1+g+YbKb8sZ//Q1PkMutH9gNxc0ZBKnJT20YshpIKArVtAmTDdKQiFEKe/UFLc5NkDJ5dJ2M9xVZOYr9AQ8dkyFrHCkONBgaxC4QQobb9KUCID3EQ6QAOiByuPw340lhy6x/tcdH2HTcvlV3LaLiuhHlKcz4FLSZXmmowImOzvKPZ/sDZ6xYWXcaxOKV9R0V+aqF3x/4NjrNizJPTtTKnP7hPxoU5+T3FuguNeb+kFAreiX36k178Qi/5RtSU2y4YgWODTO4URVli1tYW1Kr7CLVu6GcgRYNez+VW5kLFIpIIS3hxU+fJpXQU9vbybToQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGFUlgp5aeB02UooOTDR1oOsQaKtMODKc3eycQxhWao=;
 b=C6psmtEmALINdFkYlstLGKiZn2ieTw8V7zjB4ljP31dw3mQL09O9EKA06HMjifTq2C9/RlHxegNLXpnNEfS6qmp7V5fprT+Tn+1N/NihWJREpbOXI7Pt97dKCoHL6+o829X2mxJ9wgJ4sP7qPXfuwlDWn+MI8g7upWEdOR7QwlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: df24f7c3eac6f5f1
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggGibXEVrAujEzS1ZC9GwGazpOeZ7AMn8fFKrdCAz+xnVJzyQ3qo1UEr0wQg0r0dcb2dWEpFSUJEi48tSMkvVzmwNuNbb5f9gUM+K3S9igbtmyySOtopUV6FnWi/hwhcNEK6mFqyqtimEvrq2hIeb5o2Gf2e89Teu4RP2MNIkn2T+bGFcTguWl5NwOGakI8saM1yi0FJGsE3CJTe/sGgJ9UqA7QqbZFQOh/dpMJCt5Pga6BWVaFhgRNJEWYlBgQl/NRcgxEBolFxfxkZbpoQIVCk1ODZiB2sRKQfgWnxRLIRjxloOgvm4qUTt4uoAAT7DJAvSNPz/FDGtEAAcd0ZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGFUlgp5aeB02UooOTDR1oOsQaKtMODKc3eycQxhWao=;
 b=LI5ey0mYQGef2aeDbDieSaN//i2ZTfRirOW85N3Y7nWRkxCFmidKy1EVcmuXO1ljJrGQTyrxk2CKRoVgihr9Uy3Q0Lt8cyvnxLAom2aCyQbnrg7w1Lvmp9DP/QlxFOEPBS+vjDXQc2vSCHnTNScRSnnPL6eo8a5xJuwrpmhCSKZQaZnOR3hVAM0y84tnAQIDswp64ptj6KdYPUwghTBuFQKjTpwmfByCcCBxbkmDCePO5t80XQI1SU1DUROtqHry/5J8MK5VoOK4Vq+fPrnvAlsAVfjMPmnoyHYbkP3nCmGb6RwT4131hWHfpx9EPlGt0otRyGlDLjqst4CinavJyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cGFUlgp5aeB02UooOTDR1oOsQaKtMODKc3eycQxhWao=;
 b=C6psmtEmALINdFkYlstLGKiZn2ieTw8V7zjB4ljP31dw3mQL09O9EKA06HMjifTq2C9/RlHxegNLXpnNEfS6qmp7V5fprT+Tn+1N/NihWJREpbOXI7Pt97dKCoHL6+o829X2mxJ9wgJ4sP7qPXfuwlDWn+MI8g7upWEdOR7QwlY=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "S32@nxp.com" <S32@nxp.com>, Andrei
 Cherechesu <andrei.cherechesu@nxp.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
Thread-Topic: [PATCH v1 3/5] xen/arm: platforms: Add NXP S32CC platform code
Thread-Index: AQHbA46dlEAxnG1h+0mUvBXT+IC3wbJRlCCAgAB5N4CAAQgmgIAAokSA
Date: Thu, 12 Sep 2024 06:46:14 +0000
Message-ID: <EA3C41C1-D484-456D-A391-4FB54B51D6CD@arm.com>
References: <20240910143411.178704-1-andrei.cherechesu@oss.nxp.com>
 <20240910143411.178704-4-andrei.cherechesu@oss.nxp.com>
 <f08942b8-3a01-4176-8fad-525ad3261083@xen.org>
 <alpine.DEB.2.22.394.2409102210310.611587@ubuntu-linux-20-04-desktop>
 <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
In-Reply-To: <85acbacc-2557-446c-9025-bdc7eac1cdb1@oss.nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3776.700.51)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|VI0PR08MB10485:EE_|DU2PEPF00028D02:EE_|DB9PR08MB9801:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ece0f42-94f1-44c5-9562-08dcd2f6c0e2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?L1/LRG0xlfEHKO/GPEsARrh5c3AmedmeoBhC7duAFnGLRoEnbli7m2kHxOL9?=
 =?us-ascii?Q?WYagrYUs1Jc3I6v4QKJStoT/eF3eoseiQp5z/f6af35a2eDZFGEgtVPe67qj?=
 =?us-ascii?Q?NcOqd4PIsQkv+g2Ezwvn2VtnNiDB7ywTunjpwc58Z+eI2eKtxFD4RW1PXbAH?=
 =?us-ascii?Q?FpQpfZnvhbuCaSemMjs5fVbPjQ700szGLN02MmfR8WIAwZpL53/5AJU8XZQQ?=
 =?us-ascii?Q?NZl9yv73kTiJZ36k7A8TBwfqdeqDbgeJHVG15clkXX5nXXXXg1iq9RO7MPR9?=
 =?us-ascii?Q?OvyoQIHpAnfL5pK7Fx31mPCzaM8MAIhtPOsvShf5akqOHWJ3ezEO5aIVl6jJ?=
 =?us-ascii?Q?rnwML9hwnctaQb7pJuB3HuJrc4FY1kIBzJ51uuK2frWpwkfZ+ntHwK2bxcef?=
 =?us-ascii?Q?wXPxgaMcDzGhESl5stqADOomRa6rSzwhJBiUZbb1ToaPhIUNi0Uq7EF/owc5?=
 =?us-ascii?Q?4Se9/YTg7rod2ATHJDsqHkfhgX+GawfTt9aVvnegiud2ztwsWWS4/Uh1dlkB?=
 =?us-ascii?Q?1VxQyag0EHLM+BuOlHuy/dF5TmWUN6l1dpiGCXt4e8QLfJZoOfgEMqf8QjOu?=
 =?us-ascii?Q?WbHe5cVpbmFPx2U8vxhS4GvHSW85wOELsI+MGzH8NgLiebjByWJap+ss0Sug?=
 =?us-ascii?Q?PJnbtr7IKXosSmriJx+DR4ajtWhP3FqE0iYwWzu8X3xIGih1TXJyLYiordx+?=
 =?us-ascii?Q?KB9O5aWcFIBIVLIzPx9tOoLTdh35mWUvdmSoKcN00Ohww75URrKDNK5CrKgJ?=
 =?us-ascii?Q?28r9kG3Y+ZiNivvQYd10xdNIlTM7APRISk6QK2roXqOztPeJSP2CoV+f1QZo?=
 =?us-ascii?Q?npXYO+t2V6UMUv5vHhO2GxpNqUDi65KW6yY8YHQQ5eST0MmDaaD3B8s/A1Rc?=
 =?us-ascii?Q?jRagrYg+5PA57/fxzThoYsGm4xMC3bPC+lF0UsyQNPMF6PXho22fbfJckIo8?=
 =?us-ascii?Q?TrTG39H6RBMiljNfgKxaMQbhavC1Uyx7xX+XNxRyzRCPD2viR8/gwrsDe+/i?=
 =?us-ascii?Q?nsZpsGlAo3g3nunSfWSaiPLz9nXxzF71Sgz+fYH0LNYIea/v6bBh0NamV77M?=
 =?us-ascii?Q?EpRbpDFAN7+9+8DZZ+fxLfy6L+MWiTlFtBtEHwHZrU17E4z9BHfjVQ7YSmId?=
 =?us-ascii?Q?lZFX/omYffAsoLFKKUw1br0U9mcXrycAlAhk11kMw5nbxyU6QAZnoyYydlSE?=
 =?us-ascii?Q?DarQLhr8YawW/lS1mmxAHILqhcehI5IughV4ZUW+TNfXGH+l2h/8FLy4YoRN?=
 =?us-ascii?Q?mRYXr6oMrb1v08vCOvcryk9R7XHBrFt7ibt5KFEErMN+Azs81pfO974FVtst?=
 =?us-ascii?Q?N8cdYi8qzmjxZU6qs+dj+nFefF8x0/TUUmbuaGGqoevCY/pRL9A6tEa1ch7P?=
 =?us-ascii?Q?Ry7Q4KIrHqLvvssN3fDvKp6hgnQWslCOLlEgMoaOsT4TtrSrqQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A7602666B7BA2B41B389E3C6DA626CD0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10485
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3f27a4e6-8c2c-4076-d28e-08dcd2f6986a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?erYyArYItfL6AiP1WNZtb7YbJx0jJFUL1a2nRnxcfCteoF7GYK53amfbckxy?=
 =?us-ascii?Q?asDlPdwzzi6hjkLN3LEdLhPCoJmVM0zLFlIJteM81x9eIsrvzG++LCINlyQy?=
 =?us-ascii?Q?7dlS/UH9mPYWR5a5wyvqjNI00RpgdU+Va+LIWPGmP+jn2pOAD69TGFtpQ8Wp?=
 =?us-ascii?Q?qydJpLf3MJQKmRW25QMjmVJpqxFL86j+DJyzZ9q9RDTW7dCKgDH+S3rucsYS?=
 =?us-ascii?Q?RVTJJXcZzXnadhKQQQDuhlnEK1/O/ODXd4G7ZpX+Aq84DFzal1sF0DqyvT7K?=
 =?us-ascii?Q?IO+fmW3G43Sc3kTFFlxwXyqEJ6HPCtyHg7NnK6cPyTj0Goe4/SPtraVf8yz6?=
 =?us-ascii?Q?HoOI5StE4nEbO3bqzHKph2hSJ7hii8fYF9bcqP8O0WelCuMI1D09pKGfOeA9?=
 =?us-ascii?Q?kxm0ieXxan4BSS8oVZK6PgKhwT/sZebc7G6CmfxL3orDpX0TQZR7KFwSis4x?=
 =?us-ascii?Q?m1ducH3WNshpvsLf+Pa5wqWbhtojDQ7arSCd28H1mr+VAAYaR3Jozqtr+J77?=
 =?us-ascii?Q?Kpyyn3nnIWkUDFrYn+jBXdcgR5wAGz4kPSEg4uDAn+Bs87pis6buLLPt/GrG?=
 =?us-ascii?Q?2ZrAvBVbCs75fMztjp5x0T4elvzSs4+wQOVrQiO/r6qwCsr9BX3F9f2+joHK?=
 =?us-ascii?Q?jk1y6v4TiWKgBqXOtXiai904bDlevPUvm6Ui4qSvDDamv2Y9GXiyz1tCXDZB?=
 =?us-ascii?Q?9/vzO2ntUHhnsMT077Fw8lib4ik93V06yRCrB3OUBKoA+669S8ctjJz8QVJp?=
 =?us-ascii?Q?JyonYn1E7KaRDOBoRRpFo5vhp23/4uc+3zU4SCX2/VA8R/nOO+m3IwjMjGyg?=
 =?us-ascii?Q?/hbASG5ovFB+pwFHSsstPdcdoAjHAzUwzQQtHkI/GRYISY7y0NU27D9BXNC/?=
 =?us-ascii?Q?Zl3GweCLvYyzQY4lmxhyTDd6DsUpULDa02QDXDs4K/o/8efWlxDL6ywPluTf?=
 =?us-ascii?Q?xRgOL7vAXa4Sfv/Y0E7waSI9JCY4P+Xgkky2SKT6XErnpWhEXuHNwLNwj1+b?=
 =?us-ascii?Q?Y9yhAOGhtkweNhfmpZFh6AIMzI0C8wM0nYn+QxZ/ankgdIy69PfQZssLrVAL?=
 =?us-ascii?Q?9POUF+M6VAx/HlBTQMACJVInKqTRGR8gdGQ3gNAlX1CAhaNDownemnQCC1NK?=
 =?us-ascii?Q?P8L7IkL4XgjZ188LmmRUbUnHLN7Lo6jjF/ZkdTT3MWOO0FpKzhAX8HlCKXyE?=
 =?us-ascii?Q?087/gwljSmsbrPoisNmrlDmAQx+h/Q3clq/MRZIAQThjY7fvhgOftPVxYta+?=
 =?us-ascii?Q?rJKZEOpiA0ZDsyX5/YP/GKclCL4TMdqUkLvHF7B+u/0vfNozDihAL7/PuSy5?=
 =?us-ascii?Q?N1XvcR/SnhBjV81XoBlNSiIHAvby1hfMxFKuNb/Vsi0EuBvizyBeOeRRBfd0?=
 =?us-ascii?Q?HEuY/j2LrizMVHVpl72cOEaQzIoCxDb3XW0cbOBBpOHGqYSs7iq8rUUEZPeT?=
 =?us-ascii?Q?bVppKDMU/VSrHLBik4UmoT/UuvQucy2F?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 06:47:21.9630
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ece0f42-94f1-44c5-9562-08dcd2f6c0e2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9801

Hi Andrei,

> On 11 Sep 2024, at 23:05, Andrei Cherechesu <andrei.cherechesu@oss.nxp.co=
m> wrote:
>=20
> Hi Julien, Stefano,=20
> On 11/09/2024 08:19, Stefano Stabellini wrote:
>> On Tue, 10 Sep 2024, Julien Grall wrote:
>>=20
>>> Hi,
>>>=20
>>> On 10/09/2024 15:34, Andrei Cherechesu (OSS) wrote:
>>>=20
>>>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>>>=20
>>>> Added support for NXP S32CC platforms (S32G2, S32G3, S32R45),
>>>> which need SCMI over SMC calls forwarded to the firmware
>>>> running at EL3 (TF-A). Linux relies on the SCMI Platform
>>>> for system services such as clocking, reset, etc.
>>>>=20
>>> Is it SMCI as in the Arm spec? If so, this should not be platform speci=
fic.
> Yes, it is SCMI as defined by Arm. I agree it shouldn't be platform speci=
fic.
>>=20
>>>=20
>>> Furthermore, I was under the impression that we can't blindly forward
>>> everything from a domain to the firmware. While it might be okayish for=
 dom0,
>>> you also seem to give access to all the domains on the system is it int=
ended?
> In our case, only Dom0 has access to the SCMI mailbox. Hence, the other u=
nprivileged domains are not aware of SCMI and do not make any SCMI requests=
 to FW.
>>=20
>>>=20
>>> Anyway, there is a series on the ML to add a mediator for SCMI in Xen (=
see
>>> [1]). I think it would be preferable to focus on getting it merged as i=
t would
>>>=20
>>> benefit everyone and increase the security posture (we could restrict a=
ccess).
> I also asked a few months ago on the ML in a virtio related thread if the=
re are any updates regarding=20
> SCMI awareness for Xen and guests, then Stefano CCed Bertrand, but he did=
 not comment [0].
> I'm curious why the SCMI mediator patch series did not progress.
> [0] https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2401111627360.3=
675@ubuntu-linux-20-04-desktop/

Sorry it seems i missed that one.

There are several initiatives ongoing to investigate the global problem of =
clock handling and more specifically
SCMI "sharing".
The SCMI protocol contains some features to have virtual channels and the q=
uestion is how to make a transport
that is hypervisor agnostic to prevent to require the hypervisors to have t=
o "decode" SCMI messages.

Virtio-scmi is not really used for clock management per say at the moment a=
nd more specifically I do not
think it is a good solution to manage clocks of non virtio devices.

In Soafee and in Linaro people are looking at using FF-A as a tansport for =
SCMI.
The idea would be that the hypervisor is configuring the virtual SCMI chann=
els using FF-A as a transport
and then VMs are using FF-A to communicate with an SCMI server (probably si=
tting in secure world, at
least as a proxy). This is an investigation for now.

Requiring Xen to act as a mediator is also a solution but might require a l=
ot of platform specific code
which i think we should prevent.

For now having a solution in Xen where SCMI calls through SMC are only allo=
wed by Dom0 is the only
short term solution I think.

Cheers
Bertrand


>>=20
>> Hi Andrei, Julien,
>>=20
>> SCMI is very flexible and can be configured in a number of ways. In
>> general, Julien has a point that typically forwarding to firmware all
>> SCMI requests from Xen domains is not the desired behavior.
>>=20
>> An an example, imagine the case where device1 is assigned to domain1 and
>> device2 is assigned to domain2. Now imagine that they both share a
>> clock. Domain1 and domain2 could fight over the clock frequency settings
>> using SCMI to change it, without being aware of each other activities.
>> It is likely that the system would malfunction.
> I completely agree and we are aware of the possible resource contention. =
Another (simpler?) scenario where access control is needed, besides the one=
 you described, is when Domain1 would directly try to perform some requests=
 for some resources that affect Device2 (owned by Domain2). If Domain1 know=
s the clock IDs used by Device2, for example, without any access control it=
 could perform a SCMI clock request affecting Device2's clocks, which shoul=
d be out of his control.
>>=20
>> If this kind of situations can happen on NXP S32CC platforms, then this
>> patch might not be a good idea. As Julien suggested, you might want to
>> have a look at Oleksii's approach. We could probably allow Dom0 to make
>> all SCMI calls. If you think that is OK, you need to add a
>> (is_hardware_domain(d)) check.
>> On the other hand, if your SCMI server implementation has a way to
>> prevent possible harmful activities from happening, or maybe all clocks
>> are fixed-clocks so there are actually no SCMI operations to control the
>> clocks, then it could be possible that this patch might be fine. I admit
>> it is unlikely because there is a number of ways SCMI could be used by
>> one domain to hurt another domain.
>>=20
>> Can you please give us a brief overview on how SCMI is expected to work
>> on NXP S32CC?
> Well, we normally rely on most SCMI protocols to access system-level reso=
urces from agents: Base, Power Domain, System Power, Performance Domain, Cl=
ock, Reset Domain. Linux jumps to EL3 via SMC carrying an SCMI message, and=
 FW running at EL3 decides how to handle it. Basically, Linux cannot direct=
ly control most system-level resources.
>=20
> With Xen, we currently don't allow unprivileged Domains to do SCMI reques=
ts. The SMCs are of course trapped at EL2 and that's why we enabled forward=
ing to EL3 without any access control, knowing it shouldn't break anything,=
 and to let everything function as normal. In some passthrough scenarios th=
e unprivileged domains rely on settings already made by firmware (for clock=
s, pins, etc) that their assigned devices require, and in DT we replace the=
m with e.g. fixed-clock for clocks.
>=20
> An "is_hardware_domain(d)" check should be enough for the moment to harde=
n the code, but I agree that this should not be something platform-specific=
 in the future, and the handling must be done in a generic way.
> So I would proceed with this approach for this patch series, if that's ok=
 for you, and I will also take a look at Oleksii's approach.
>=20
> Regards,
> Andrei C
>=20
>=20
>=20
>=20


