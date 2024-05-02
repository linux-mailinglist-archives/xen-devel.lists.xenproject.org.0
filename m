Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD178B989E
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 12:13:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715738.1117592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TR6-0000hV-DL; Thu, 02 May 2024 10:13:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715738.1117592; Thu, 02 May 2024 10:13:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2TR6-0000f9-AZ; Thu, 02 May 2024 10:13:08 +0000
Received: by outflank-mailman (input) for mailman id 715738;
 Thu, 02 May 2024 10:13:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A7KU=MF=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1s2TR5-0000f3-7J
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 10:13:07 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20601.outbound.protection.outlook.com
 [2a01:111:f403:260e::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 906390ad-086c-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 12:13:04 +0200 (CEST)
Received: from DUZPR01CA0051.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::15) by GV1PR08MB7316.eurprd08.prod.outlook.com
 (2603:10a6:150:1f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.26; Thu, 2 May
 2024 10:13:01 +0000
Received: from DB5PEPF00014B93.eurprd02.prod.outlook.com
 (2603:10a6:10:469:cafe::6a) by DUZPR01CA0051.outlook.office365.com
 (2603:10a6:10:469::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34 via Frontend
 Transport; Thu, 2 May 2024 10:13:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B93.mail.protection.outlook.com (10.167.8.231) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.7544.18
 via Frontend Transport; Thu, 2 May 2024 10:13:00 +0000
Received: ("Tessian outbound 9d9bf1c5d85a:v315");
 Thu, 02 May 2024 10:13:00 +0000
Received: from 0c867f77a522.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 032E1BD0-002A-4B0E-A59E-EFA00EBBE484.1; 
 Thu, 02 May 2024 10:12:49 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c867f77a522.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 02 May 2024 10:12:49 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by DB9PR08MB6668.eurprd08.prod.outlook.com (2603:10a6:10:2a9::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Thu, 2 May
 2024 10:12:45 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::6204:b901:9cc6:bf2b%6]) with mapi id 15.20.7519.031; Thu, 2 May 2024
 10:12:45 +0000
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
X-Inumbo-ID: 906390ad-086c-11ef-b4bb-af5377834399
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VVovkJ9uo/P4xx73uz5nzAjFZUidaqbUwqBu74G7hSWUVpRKM6GMJ9Rv+ilVX0t988aA2cNBXjRms7NOl0U1TpxsxlgbNjS95mzbzLqPBe0Ia/0IW9jgN1F6sGQmLX8/l1NZtRq03pj6CKhsYlg2TNzPcIdEjXzC25CzL9BPiNhBdbAnRwjCCPWPxXDUWoqc2Jc6phXSnvfD0Hztml3UyF4Bt3cbaax26It0HE8eoxRda/ieVheSP2ekXuIAczbP0VbbofGle30OVYHsJ1+mgffydX7g0NfRqFeNRF+0uuY40GkGV2kmqrCN1LM+RDgxo0mYABOZVw49v4QAfkPOhA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZG4fzbsBK6H78NSJfjcH/SoVTOvmdzV5mJN/jMVWeI=;
 b=dL1noUEoGCV5reCMnkITXd5iJ4NO5XPOL1uqyvzyz7QqLvl6G5pKyYwaFyHwc0aRkUufOlOeIsvrYJ1OHOHQKsOOD+HwuATrogkakhzyXrQc1MZ7RlbpcnCOusNw9+a0TNQip+wIfUDDGQN4HFfxGwaEIyr5w8ufAFSvU7HsCvgSoBfG8mShlsgBssaXnc9aA/mJKWH8X6T2/zg7D+CZiFJhoYir1x5ZwAYVSzpNC7L4/yY5iRSuLHa1pTo/1Li/3OSkVLysRDi+XJe7rLaSb3cfcAdeHM+czoFkL9dDYXTS6OAM3QYLvqfsPjIaRQILzwKMkoIRGL+tQhqzASatCA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZG4fzbsBK6H78NSJfjcH/SoVTOvmdzV5mJN/jMVWeI=;
 b=LthQDQ02SoZ1JffiQiIBekIZpcXhTyHejtUeyzE8XqmdAE3qTDcUwZHpofrdmKZsvn5SIWOE3GG8iGpy9oakh1qQjHhPYWRNF09A8YXWi+4WVu/2k8IMO1mjp5T3Cd1Z4+1YU7YDjeGiB1fwKp4UcEg3HYi6Cp1WCUdqUqr+HrE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b8003f86866b762
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rso8jZnT4keh+KkjLXBhkONCgR8RnliGNNWHF8YhFeVE7u3aN/2iOVLXxQEj1pehCeDFI7c0m1GGi+PfIxSpCPUv4THJSnieKFJKJCxwFGwxhWptgsxveAsNA4+QXqAO8BykYHw/I8lTunu81bU8R5WaCI0Ma/YvqKexp1rBjd+WErX/kA1/xLFeZQPjMNzWItK3J0cW42thneT/CqHV++O+Me3wcG+6DKo3WNG3z7ipawgiTDvXo2xq4vGvKuiceFgfnihI0ERNqorb5d+XqLzjkF4L+2XhrZmyCZXUHfFDDjxYnlMauUYAzD/jBx8JZXtu26LaW5dpSvgHCGJIpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZG4fzbsBK6H78NSJfjcH/SoVTOvmdzV5mJN/jMVWeI=;
 b=Pk8RI5dM0ZD8xgKWJKR4FvU3RQTXhi5uKWCn6Fral89IbTxitYRcLUB7LS/vkjpHKb4o0IO/0EtvEvCNg7GxOh/NS6FHun3ZtmGCiJjtjV1Ta78oKNE7qlhWycEL/SPHY+dFeXwg6o3DDOcBEUzooo8RP+h36HxXAF4yFHqVkTxDCYVO2rHJDWnrH5KKyyorYXv6FmuUNMk/XlLPpbEtJSK8Hjm0c3tryMro3QpHbXuZBtCJeC5jqEJgapSl3cpPb9S1num07T6z1EdZhgq8qxxRCPXUq+gUNNtdhY2YoHor2PR2g1AUFUAktvzewlB7QAjA01Ij5hIWJhiDYtk7aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZG4fzbsBK6H78NSJfjcH/SoVTOvmdzV5mJN/jMVWeI=;
 b=LthQDQ02SoZ1JffiQiIBekIZpcXhTyHejtUeyzE8XqmdAE3qTDcUwZHpofrdmKZsvn5SIWOE3GG8iGpy9oakh1qQjHhPYWRNF09A8YXWi+4WVu/2k8IMO1mjp5T3Cd1Z4+1YU7YDjeGiB1fwKp4UcEg3HYi6Cp1WCUdqUqr+HrE=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "consulting @ bugseng . com" <consulting@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible array
 member not at the end
Thread-Topic: [PATCH 2/2] xen/arm: Fix MISRA regression on R1.1, flexible
 array member not at the end
Thread-Index:
 AQHamu72Eq1RpEGs60mNp9DIfY8mn7GAr6+AgAFEGQCAAYYzgIAABVAAgAACyoCAABlOgIAAG+eAgAAFWAA=
Date: Thu, 2 May 2024 10:12:44 +0000
Message-ID: <6A50BE71-7F92-4B7B-9A58-1D3A084FDA3C@arm.com>
References: <20240430110922.15052-1-luca.fancellu@arm.com>
 <20240430110922.15052-3-luca.fancellu@arm.com>
 <327c7e42-9b59-4925-b746-0b59dbb5a3fb@suse.com>
 <91B23E5F-7515-4C4E-9FBD-57654980905F@arm.com>
 <de09e134-0150-49ca-8338-a0f4759c218b@suse.com>
 <29573F6B-BE27-4A65-A310-35883A39F989@arm.com>
 <af1116ad-6401-403b-a3b8-abe421e2e3da@suse.com>
 <2DF15520-B0A4-4972-92F6-FCB6BB852292@arm.com>
 <4fee2998-e29b-43bb-855a-8600dbef9f13@suse.com>
In-Reply-To: <4fee2998-e29b-43bb-855a-8600dbef9f13@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3749:EE_|DB9PR08MB6668:EE_|DB5PEPF00014B93:EE_|GV1PR08MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: d258a44f-9ca2-4438-291d-08dc6a90728d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
X-Microsoft-Antispam-Message-Info-Original:
 =?us-ascii?Q?U/Ma4xItv0dVxmznf+H1aJQisNCaW4kqIhVmjFBo18XLcKbjAMPO6FZTvDwD?=
 =?us-ascii?Q?8iTEP6y/ymoivtHgYUUYhn/0i5rG+T2hASJF0ed9jWx5sK+2d75bsOvagdGm?=
 =?us-ascii?Q?469KJySYmm9E/ZS+bJtK6WDe4kABIuPcbenPq328MZoiu9ZLtllsR0w8nUBB?=
 =?us-ascii?Q?uZMoaFidhu7vwM3t/2xxNtu+Oasu3JGgQm1Y9Iu/LzkWvFRov/1PNG2jxmdR?=
 =?us-ascii?Q?T1XwzxGHm8Vhk/BawcDwy3iWCw0sVEQFWHwJH4fOGXrY+Vty0kg4Rq2dHkyL?=
 =?us-ascii?Q?kcQw8+aYcO8lZ7ciy/wJ080g/KdiLE+Q54lzmVHVnX/6FBHrSQi/c+PGkQvB?=
 =?us-ascii?Q?iTBgSQSWotkJ0BCL0CUkKLchgLxEBFpmkQqJmtxkxy4iqJXF9JW7xHTF0IvG?=
 =?us-ascii?Q?rhUmUzEDNJPcyGzl90F7WjDdodOHfJOzMMSc7nPTsErPF8c6tAS4Pfy0zD6N?=
 =?us-ascii?Q?T/NFL9rkturniZv2dN+/dsYl+FN/Z5KFf0vuP6gnNuCSfh8ZNYutla4URRDe?=
 =?us-ascii?Q?b1afYlRIBZVKNNHlkcutYPCFgRAdRp3mPIULoRp58zm678f9peMR7ZbdPral?=
 =?us-ascii?Q?hKYCdPVQSyMgMhAEz8AT31O0/2iEOhRo04xC8zo2avqRyKn1pXax4Io0x78s?=
 =?us-ascii?Q?p6qYuZ7/wuh92JuyXbh9jn/et2RZoddLPYC0GMCc1YAFM1Aya90igZvy5TWE?=
 =?us-ascii?Q?MGiesLjwpLhZRQhmUabFFMKucp+ifyv5gLZIYzQIOfZDyQ3aWioH2gNdolEj?=
 =?us-ascii?Q?kguLiyhHzGiWPWOAM/aQm2ofKq04b/HZ6B5aXP90Kv8zZbCeld7lr4hh2iYZ?=
 =?us-ascii?Q?SLpYkDSzOfiep7dIkovUXDHkxtTyE5HZpLR1zkFyoFoSEwhBIrGXle7FOkKq?=
 =?us-ascii?Q?O4WuApdYEoUPdIFWloQeVokc76rtkc1TkLD5xzbRXMlT797sIRs6aUKBVMaX?=
 =?us-ascii?Q?y5F/NoNAx2mjW4DYnC9XmTFR6Yj2MVEpyMmNP70Hbt/qYmQbldLJUamI8Nlv?=
 =?us-ascii?Q?NXm9/yJCMM6s7CBk3TKlw7Yf7YMy90Vz3Z2c4t+u4kTZGoQMHGgKYElI3+Tb?=
 =?us-ascii?Q?/ztEU5erFG3Np9gFat4N/L/PG8GQwYfnVdABSVzoVQmJPPhRcD+eoOwxLYa2?=
 =?us-ascii?Q?c1HhgptQ+fA1sRd8dYsYTQUOy5mko9C+ADJg8teieQT6k14HaIuUwSfkghsk?=
 =?us-ascii?Q?kHOxpyp1gQWngqQewdSU6gv+dqrLEw++MYPfIQR+UDBfiJd0eQPw/Re731HZ?=
 =?us-ascii?Q?ldt2cbh6adn6bM/gNoANqeSy84bDFHYK+FeH/lc1fA=3D=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F3A0B629EB9473409F21D539B3215503@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6668
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9d952a93-58ef-4dc0-b3a1-08dc6a906917
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vSu1um24WIa2338HZl9uPYMajtFmPAWVDdNO/dtpNYw34G9TjGBtEOx4l/Er?=
 =?us-ascii?Q?8sEaTvYIZrmbYj5TjImpov6p3GtItH9AvGpl9Z84PzeTDbz9eLnqTUJLYZXk?=
 =?us-ascii?Q?qPpHaz9ASM1hEqBxEpLA/PYK8twgoJiWeuQAH3rOqtEVMq4+NlIFp2Z/LCHZ?=
 =?us-ascii?Q?n5sgMkGvWNnaN9l8Luc26fHKrquft076yowxqv81qjkRYoSap+hmnYiJladm?=
 =?us-ascii?Q?TrpIrFQHMGw0CtwGzhASAAp2y38+Ji30DgESL8hbqqs/PFrcI7Y1XhQTCvhD?=
 =?us-ascii?Q?KsSF/zcV9Csikl5P39TQ0GWgu/qxL1/b0TjqxlqhfrSa5AS9OWvgLa81fI7n?=
 =?us-ascii?Q?rk52ZISVOhtA5RPBH+KEG0K5F8/mHgSUMbCeTK9eAesFdRidIWhWauDdPpZC?=
 =?us-ascii?Q?V1wjMeRTBsOHxwhXXDgckoogd9f5SQtJQicnHE+LZ0jUG8jK8R2IA2cy1GXg?=
 =?us-ascii?Q?t5C4j98phjRjAXpCwAiRQq0j7vt5uZ/b6w4nXNiTJzRNatek4dulSKtSOcib?=
 =?us-ascii?Q?wDqjp+jAqq9Sxr2iN603zUGe+7VxDjYS+pHPaXUeTL8+MkX2G5D42rZHWK7/?=
 =?us-ascii?Q?GYf77LqoOeM68KCGVVDymZeihUBzwizg1Zek1jjkskT493XpKIo3on1ul4Lb?=
 =?us-ascii?Q?hpvDrR06qRRx/uVd6ay53HcpnFFo3ZSFLZaeEBo3VwTrPSafZkRGyG3ZZAgX?=
 =?us-ascii?Q?kX7HzuNO7yxryGt9WpSVYpLKr4J45OXiR5L/A3VI4Zqo03vpFqZiTV2rclBe?=
 =?us-ascii?Q?bPOTcHXfLYKX0LqBTiBeaqkF0kPe4TbWBjWWQ60nhaCH0XT+G0YaH0gaOU9I?=
 =?us-ascii?Q?BCu0oZYFSuucZBdhTbh5NHRK6kk3OTt65SFEWRkq3FqTNhpO0J1SJjbEP3Lp?=
 =?us-ascii?Q?HJPpqbhlDrbdZtCCN1FbFu1Ul5oE5OXdItlph2AEbN6bV4UNtaHudtb4PzLC?=
 =?us-ascii?Q?V3FgrtdlzaO6aIl9YXlhOsIeVsYEbZcWKrCKnzV7Z0URfzi3rt4jJOt6N9gA?=
 =?us-ascii?Q?nfijNTr8tx3ogVvyRXMIV8amjpdz7a8MDyT//ObESjhzud5dgM5lS8drfVu9?=
 =?us-ascii?Q?0Ba9yf6EsbRlKyNbzJTofAdo2qEo67Q8x2gmuXPP6A4LmcB/wtO5qUBFjZCd?=
 =?us-ascii?Q?XaicLRIaIhp2qX7auRh1hPoCJI9ExIJCNtzLc1x3TydbAWBYbA5AQCnNQhL5?=
 =?us-ascii?Q?tP46goREjIhbQsi0t++bpDuEKAuTn7h0QbpXKdNbH22+7pASXOnC8eek+ztj?=
 =?us-ascii?Q?Q0qEi9RrRzl9MltKWRALzQViv35DYlmxhGDyuq/vp4PtG4m95sj2XaTj+1Ke?=
 =?us-ascii?Q?+1SJkkIG5oorUwcnwPGjG9CH?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 10:13:00.9300
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d258a44f-9ca2-4438-291d-08dc6a90728d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B93.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7316


>=20
>> In any case it would be used soon also for other architectures using boo=
tinfo.
>=20
> Oh, would it?

PPC people have plans on putting that interface in common:

https://patchwork.kernel.org/project/xen-devel/patch/451705505ff7f80ec66c78=
cc2830196fa6e4090c.1712893887.git.sanastasio@raptorengineering.com/



