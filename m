Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C64A58D92
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 09:03:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906141.1313591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trY6f-0004DT-G3; Mon, 10 Mar 2025 08:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906141.1313591; Mon, 10 Mar 2025 08:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trY6f-0004Aw-Cf; Mon, 10 Mar 2025 08:03:25 +0000
Received: by outflank-mailman (input) for mailman id 906141;
 Mon, 10 Mar 2025 08:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t+uq=V5=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trY6c-0004Ah-P0
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 08:03:23 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20605.outbound.protection.outlook.com
 [2a01:111:f403:2614::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 213a906a-fd86-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 09:03:21 +0100 (CET)
Received: from AM0PR10CA0006.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::16)
 by DB9PR08MB7605.eurprd08.prod.outlook.com (2603:10a6:10:308::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 08:03:14 +0000
Received: from AM3PEPF0000A79A.eurprd04.prod.outlook.com
 (2603:10a6:208:17c:cafe::9b) by AM0PR10CA0006.outlook.office365.com
 (2603:10a6:208:17c::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.26 via Frontend Transport; Mon,
 10 Mar 2025 08:03:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79A.mail.protection.outlook.com (10.167.16.105) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Mon, 10 Mar 2025 08:03:13 +0000
Received: ("Tessian outbound c3a902884497:v585");
 Mon, 10 Mar 2025 08:03:12 +0000
Received: from Ld91c9f086527.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D2279C5-9211-457D-9955-C7EFF641D09E.1; 
 Mon, 10 Mar 2025 08:01:48 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Ld91c9f086527.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 10 Mar 2025 08:01:48 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by DU0PR08MB8397.eurprd08.prod.outlook.com (2603:10a6:10:407::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 08:01:46 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 08:01:45 +0000
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
X-Inumbo-ID: 213a906a-fd86-11ef-9ab8-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dYrD8IEPPNKjZhfV7RzuF01JhirGefiXC7VsD2JdRVDY3omXdSXMtHNv8Y4XnhonUYc5ygzU0XWYbfWHoPOyb7cZXqV8gTLQMBRIVgK2Dx3YSRN9yEYS512IHzzz4blmnGG+xu/hsZ/HLCPBCOe/qZzn+FYtUOpu+II6DGQp7+lMs2X1eQl0uiKytKqKqaCgUYBZ0WJ2YTpIvafCEPUXgbFmGfilalUNbMzX5QKcwg1mK+b95iJ1RsbnO8Uv8oNRl9LH8gdDFUnug27g+wNILtlgSSiSPML+AsZB1PVr9ApJpD4xkPJcNP5n4RVq9aAitsyMZnVdkOCnxNXiu4JkvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOkUF/QJDo4Pm67xoymNLYakN7APMs/mYU9MjFEQ/Q4=;
 b=siB3BYLwBi/xvTuwuGnWO+zPebBn4fLuK0f2OlJ24GwVUvDKeYDwL+0OOYC1GHiF95c8WGeYNUbDR3MXnx37n+ixH63WczjeVrSnjvy+ahG9D9BdwucLsxykPFDJm1IuhNsqvCKfTOnpAH8ibGsQx/Fj8ca9kr02LPUUYBlQVShQIie1ioO0qyDopH3fyhEHX90RZTn+n1cRtjh/UcD7mN9lnKUgzvtoHWdrpSO+6U2tGOSRGhvISzW+sGZaQV8v9YwK1JTKYjejnex+FwUOBD2RY4oxyloBtnfhbhNREbzKDKYWaP4nDZdsFO5PSDszfzOaZ2b3lz0HswDG3B+odA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOkUF/QJDo4Pm67xoymNLYakN7APMs/mYU9MjFEQ/Q4=;
 b=VGWEYVZq0ayvEivKlApsWRqW25eAQLYOP8HH1s0qsQb3iyaNrRxIDTom5jD9+554vBcJ2cdKEdgQkhnM60Vy33wL+fMDP9v2fPxxAiW6FkATeMfz/ycL5dOL7cFm2TB0SMjZOROiKl0sd2Kqk+dw7h3PARN8vXvW3D6hv1pJHso=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c03093578ed4cbfa
X-TessianGatewayMetadata: /AlVOH0jhWNvjkpfIhzDeRSpTMQeVVmy/vGiRgVWePslEO4f/SYA9k97/QWiYWIBvOOmSiyC38wdFTxlE1+9l7Td8Eb6Ew45I+odU/tsxZKgZzYIFaAWyzr8tdOfkSRW3if0Z3EiZ6R1UkvNI0rnvbqWfRum2C6mnRAtBpNP+Mk=
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hMPbfE/5gyafAwqDq9Lyov40f2ATnQMCvGRTiqYDPQUI7wlYGjkvzfmy7T74Zl+eziioAr/JHU8LOX+1qDIFW7k7nTcCYRkZFN9/KvKOm6p1iIPGtYve6h7kMSrcfX2VtJkeezJmvNLn6l+0KWS7QgR++Mp/myKJiyknZIsFFzTDf3lDM/vkzGkL3ugjRKKYm4OhdCiOn5UJqPsaQ4KrgZB4L2nEu1K+uriPXr1Wp8QNr4PghIzxMbnVtaS9O2Zqs7XySeqAiu8kLKxefC38x3awPKqK6jXfDC9YAHSp0Be19Uh89Xb6J1evhPtvPh0pTsrLfpwcsHRurX5CmoEaYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOkUF/QJDo4Pm67xoymNLYakN7APMs/mYU9MjFEQ/Q4=;
 b=e+0+x/qYFYPVCafLBdLYk7qUcZpJou8ix3A5zRvUVwKptj2uKBRwVLyjdmVyZnkP9j9TMJR3j1Llsyqq5yv0MTd2MYJHbwWBEmMfGUK6H9NqNrmRKDB8HS03bkK/sB8jJSYLBsEqk9OmMSMpyY15GbHDgD1qNgMiLYHz9Q2sH8Eb0JyPhcU0C81GiWhRf4k1lgGHsbBMf7RAKO78b/SD0WVnfXtAoCQIOiXrKOB41HHFDjYUJE28OLc+yPfo7j46TgFIqQ5OemQeKOgPZKpzNiMLdlcV6wyubAyM8Dk5hWjHMeocEdEc8VKTFmNLt4Qs3i5eNDWPpFsLEp/+Lqrvkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOkUF/QJDo4Pm67xoymNLYakN7APMs/mYU9MjFEQ/Q4=;
 b=VGWEYVZq0ayvEivKlApsWRqW25eAQLYOP8HH1s0qsQb3iyaNrRxIDTom5jD9+554vBcJ2cdKEdgQkhnM60Vy33wL+fMDP9v2fPxxAiW6FkATeMfz/ycL5dOL7cFm2TB0SMjZOROiKl0sd2Kqk+dw7h3PARN8vXvW3D6hv1pJHso=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
Thread-Topic: [PATCH 05/23] xen/arm: Add capabilities to dom0less
Thread-Index:
 AQHbjuOsEpKBv2XdREGmb6t5T5YNe7NnYSeAgACWFoCAADjQAIAALPwAgADS4ICAAteYgA==
Date: Mon, 10 Mar 2025 08:01:45 +0000
Message-ID: <474C7972-2B67-4FD3-B4F7-39B352301A46@arm.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
 <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
 <92eca43f-1dc8-4eec-a124-e715d118ab03@amd.com>
 <01df1e44-a2cb-4e93-8b9d-99aca914db68@xen.org>
 <09103c2b-a7c0-44d5-8eb5-2d0fcb01c26e@amd.com>
 <cdb05727-fd2f-4b83-9200-d88789ce908e@xen.org>
In-Reply-To: <cdb05727-fd2f-4b83-9200-d88789ce908e@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|DU0PR08MB8397:EE_|AM3PEPF0000A79A:EE_|DB9PR08MB7605:EE_
X-MS-Office365-Filtering-Correlation-Id: c4f0a2b8-df0d-477f-2312-08dd5faa0186
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|10070799003|366016|1800799024|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?Wcy1AG2/+wAuyuOZdGChjyqOtPf6zUv28V55Q1nvlYjjEPhywN+hWNofcL?=
 =?iso-8859-1?Q?/sVFgBIoZo93ZlPPZPTXcdbPO9sSdTEMzpmKGqVufr8OVos/phOsbfMdqj?=
 =?iso-8859-1?Q?0XZDxxBGf2x0u15KbhUoF103yKFM+HWbkrKIQqjv1epeyhWJ+YHDFqEKaW?=
 =?iso-8859-1?Q?KgFCl/cC+ExqcEu9T5IE90kDnjQePUaaqVru6dQJYQZvjFG2wr+GC72HOV?=
 =?iso-8859-1?Q?b/+2HUAC3RvqJlpLRXKs0IkEllLMw7TDmTP4Z0NwJghjfhqSNfwaLoZOPJ?=
 =?iso-8859-1?Q?96tcvVGTmzLZXNMsjgvWsuQMY2lfDW+58K0zYHv+OBMXkgrxG8Ohf0KRqM?=
 =?iso-8859-1?Q?EZyD6pBnGoAfZQ3Wc1XKYoRKYQZ88dMn2/21eAmCzyNgqsn0iiCS2arfyG?=
 =?iso-8859-1?Q?vFEYocIaLbowTKNqfG9Sgcp4tkglkXDwZ4152RVheT8EUnW2tEEplawzCr?=
 =?iso-8859-1?Q?7WXb9Pc9VP1hU9n/AHNQJPQvgw3tt4iIEHYZwKvrb+1TFoKdqtXjBA2Vk9?=
 =?iso-8859-1?Q?uuvwYU8bEhSsP9ywO2Axl8iGJyKHeaCRc79cInnqqJVQ5VYo6SLFOFzFzV?=
 =?iso-8859-1?Q?qcnBkv++SQ8MWYSaflEXJzYG5ni+cgkOP9Rn3MmBniVoaWWmAUid6Kw6IE?=
 =?iso-8859-1?Q?7IneCf2cf7rpnl+Gb0Te8oeWNoy4jpQlHucrFXJXrSB0woCW3HxWlaWvZt?=
 =?iso-8859-1?Q?vQx849PTdSIJHkuABXZf8xjGh+zb1bLibyollgpcQdYg1yuhTjwE+/P6dQ?=
 =?iso-8859-1?Q?8mzdnsTq9azw40ePkKUXYkfQWjGdJAJz74xmQwrgdqxb+MVa+RER3i6xC+?=
 =?iso-8859-1?Q?bSeN/yf/mPkLmLRaBdW7O/+Km2GG+wLdFQA/M9QFvIpSdXF+3sS7fsTmza?=
 =?iso-8859-1?Q?JmoISssF/Z3hdsOr/IzYR1dvl6IYdAq017OyRN40nQXyiPiNWfVvRl+bEd?=
 =?iso-8859-1?Q?2wRuxM5kTFfItp/ogZtynphD8+IH3+CRt9Sb0RQxq+52h7DnZAxZnHhKXi?=
 =?iso-8859-1?Q?kRcsrR8B9p2RpCvvTYYVyG4F7FWVRKJXcbkRRCMsXVfA7qD5kENPUZRyWN?=
 =?iso-8859-1?Q?sDdgHXLUXDduuO9lPIwZusK12Bqn4V7nB2lTCbDaolkXUGW/yfn3veGx3i?=
 =?iso-8859-1?Q?IVdWz4DVjc1LKnp1MXT8nXhkyoD7p7YipAmr9m+v+pJomJmQz61AzfuyUz?=
 =?iso-8859-1?Q?AEULVjKhNKnApQcjXadtuI86vfoai+AKOV6h98lKkBZTxM+uClrP4MQUVZ?=
 =?iso-8859-1?Q?12/vm8NMaODBpN4w3fSh/dUWAaIV6fexxADrnX56k+O49y2uGclOUBMEne?=
 =?iso-8859-1?Q?3s2Fp0G5YQ2EzHRig5OljmF5mHtSyTaPvJs7lclGIdXQbfbU+UyiCPOIyR?=
 =?iso-8859-1?Q?4cCKPdYgzeXjadJdQNEoQW3wAn7lVgdkagAASDsPInL6o00XO2b4T7Td9f?=
 =?iso-8859-1?Q?GR3NiLkBpK+8It0URB50KZZURoKebJTM0FotGzJn01y67Ze3JV1sTBhS8W?=
 =?iso-8859-1?Q?n2w+r0g45If48YEp8bGFwF?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E5A724102F56E04B814339B73EC438CD@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8397
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fe50c25d-b247-42ff-acd6-08dd5fa9cd7e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|14060799003|82310400026|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?DHv1uXHpsxoYUDmul3cTw9tqqKEC7XLIombPPNNgAJUhYFI12bnodGdCl5?=
 =?iso-8859-1?Q?K2Qdlyebp8MYorcRmvkaUMrkERHB/4bKb/gQ7XOa+yhtupX3p8V0LqojAU?=
 =?iso-8859-1?Q?fLa+qQCk0DkdHytSlRUTlYtj7/RC/+ecrrhYwjgNVn29gnJEU/qc0xaE0J?=
 =?iso-8859-1?Q?3MojHgmHVPpJS0pkaflqQPA6OII6P00b+is0ehBkg6yOdV4bGtd8hjezR/?=
 =?iso-8859-1?Q?KoNgW2Nxj2LH7m2en1/dpSPAKHhabVzzIPy3ZxArTHJtRKn71WT1LpWFUe?=
 =?iso-8859-1?Q?5uPpXnNQbDxl0mnrzMPYaSfTFIjdZMSTkezYoWxOkwOyaCcvxWcbY3nSYK?=
 =?iso-8859-1?Q?koNVNo9O7MjwTodEIWHOQTwTLn+uU/N5pwfBxbe90Xtddp+J6Y/CnN+OrR?=
 =?iso-8859-1?Q?Wf6KEy3RbEIYSQy74+zZzcOtJlY0yyRrOdTU/o5T/sMMeXOeebh/enzmS1?=
 =?iso-8859-1?Q?QEVNTZlfaID/9oUoMDDMnrdBdP9NsU1w3OBg3gl8tyrGOsPkNJUT6yvU7s?=
 =?iso-8859-1?Q?7BQGcUd1ZD/5C1jwEXjNcixcBN0NvBD6wOguiD4oSPGYxv/vvX0ZXFhFcM?=
 =?iso-8859-1?Q?H2SL+R61RiKMBN9OA4hYVxJKkelGQIhXrKl4gjxYFFw4xvORUtTcFnqcNc?=
 =?iso-8859-1?Q?7h9dWKp1pQsuJ5cniZeaehhhYriZb4E/CJk9oD7xjFcxgY1Bu2JnX3hBWA?=
 =?iso-8859-1?Q?nSfLBGZhpqKxBp2rGCGUKiz9Ba9W/3e4rxGyGUnEKnisd1W6+pLmiin+fj?=
 =?iso-8859-1?Q?5d2a2LK7fpQ6zO6YFMas6xYr2Tb4qnwc5AQOY1nWBIv9HsiBOxM6SsabOf?=
 =?iso-8859-1?Q?y/tSD/nszoGvenBOtjs1XBMQX3RS+L78wFAOkovNpXRY+IegjtI2Sp0E0q?=
 =?iso-8859-1?Q?GhZtGAgHlGsOUQRhSK1AxNMGDQCYkLNCGJPNypOy3X+Tu7Nz8b+r4mOfW0?=
 =?iso-8859-1?Q?mPbSyjHFDFucdaF8Cz22+ry1E/AMQZvPDYTiQWo7ymLGuqipZPwMOsQCGN?=
 =?iso-8859-1?Q?eSlZGfsvadR9mybkE7IU2W8QtWjDQnl04kZjgcopSDngG99FoNFJpSuVl0?=
 =?iso-8859-1?Q?YBA9SQDPQCfYydGWjvDBCf9AwJXTYn3hQdTDqoPEEN7i2qVzphyRpeKmRo?=
 =?iso-8859-1?Q?cXbRlnUhuG/BmyU0Mw8vLbaS4f4uzP5aFigNUteWTTSoUTyLu6BBmdQ0Fa?=
 =?iso-8859-1?Q?U8PH4W3lZbAp77+yeaVVlCYYkjEwo6dAK/g7LT00Y3RBns36Rntg4odz9F?=
 =?iso-8859-1?Q?0UZGHO7+BeH7IIIz9BpKNXfvMuY/iqy+6aFsXpsiwdBLZsyriSCnJolkpy?=
 =?iso-8859-1?Q?bdqlTlHOixX+SrruCxOMVOh+vTBzIo4Fk5x6YmoedOf15Y2akjhEfo3AmV?=
 =?iso-8859-1?Q?otd9GaSVALcS2FjDRbIxSy0HhZ3eSCgBDOiVDQKzJIXIk8h1guzowVsdM5?=
 =?iso-8859-1?Q?Y8Zkj0EYAgHguMNsqxvW2Cvah8nsKqW4QnHOWSRxIRXLkK6vdLJHF13kUv?=
 =?iso-8859-1?Q?wHrUMpr8J45YrcMuTTDIkELOWMnJZuxn3YVcFz15BWLSYZD/0VHW2T+pHt?=
 =?iso-8859-1?Q?Oqwb4Qc=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(376014)(14060799003)(82310400026)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 08:03:13.0500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4f0a2b8-df0d-477f-2312-08dd5faa0186
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A79A.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7605

Hi,

> On 8 Mar 2025, at 13:37, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Jason,
>=20
> On 08/03/2025 00:02, Jason Andryuk wrote:
>> On 2025-03-07 16:21, Julien Grall wrote:
>>> Hi Jason,
>>>=20
>>> On 07/03/2025 17:58, Jason Andryuk wrote:
>>>> On 2025-03-07 04:01, Julien Grall wrote:
>>>>> Hi,
>>>>>=20
>>>>> On 06/03/2025 22:03, Jason Andryuk wrote:
>>>>>> Add capabilities property to dom0less to allow building a
>>>>>> disaggregated system.
>>>>>>=20
>>>>>> Introduce bootfdt.h to contain these constants.
>>>>>>=20
>>>>>> When using the hardware or xenstore capabilities, adjust the grant a=
nd
>>>>>> event channel limits similar to dom0.
>>>>>  > > Also for the hardware domain, set directmap and iommu.  This bri=
ngs its
>>>>>> configuration in line with a dom0.
>>>>>=20
>>>>> Looking the device tree bindings, a user would be allowed to disable =
"passthrough" or even "directmap". This means, we would never be able to di=
sable "directmap" for the hardware domain in the future with the existing p=
roperty (this is to avoid break backwards compatibility).
>>>>>=20
>>>>> Instead, I think we should check what the user provided and confirm t=
his is matching our expectation for an hardware domain.
>>>>  >
>>>>> That said, I am not entirely sure why we should force directmap for t=
he HW domain. We are starting from a clean slate, so I think it would be be=
tter to have by default no directmap and imposing the presence of an IOMMU =
in the system.
>>>>=20
>>>> Ok, it seems like directmap is not necessary.  It was helpful early on=
 to get things booting, but I think it's no longer necessary after factorin=
g out construct_hwdom().
>>>>=20
>>>> What exactly do you mean by imposing with respect to the iommu? Requir=
e one, or mirror the dom0 code and set it for the hwdom?
>>>>=20
>>>>      if ( iommu_enabled )
>>>>          dom0_cfg.flags |=3D XEN_DOMCTL_CDF_iommu;
>>>=20
>>> I mean requires one. Without it, you would need to set directmap and I =
don't think this should be allowed (at least for now) for the HW domain.
>>>=20
>>>>=20
>>>>> Lastly, can you provide an example of what the hardware domain DT nod=
e would looke like?
>>>>=20
>>>> I've attached a dump of /sys/firmware/fdt from hwdom.  (This is direct=
 mapped).
>>>=20
>>> Sorry if this was not clear, I am asking for the configuration you wrot=
e in the host DT for create the hardware domain. I am interested to know wh=
ich properties you set...
>> I've attached the u-boot fdt commands which generate the DT.  Hopefully =
that works for you.
>>>>=20
>>>>>> --- a/xen/arch/arm/dom0less-build.c
>>>>>> +++ b/xen/arch/arm/dom0less-build.c
>>>>>> @@ -12,6 +12,7 @@
>>>>>>   #include <xen/sizes.h>
>>>>>>   #include <xen/vmap.h>
>>>>>> +#include <public/bootfdt.h>
>>>>>>   #include <public/io/xs_wire.h>
>>>>>>   #include <asm/arm64/sve.h>
>>>>>> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>>>>>>           if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
>>>>>>               panic("No more domain IDs available\n");
>>>>>> +        if ( dt_property_read_u32(node, "capabilities", &val) )
>>>>>> +        {
>>>>>> +            if ( val & ~DOMAIN_CAPS_MASK )
>>>>>> +                panic("Invalid capabilities (%"PRIx32")\n", val);
>>>>>> +
>>>>>> +            if ( val & DOMAIN_CAPS_CONTROL )
>>>>>> +                flags |=3D CDF_privileged;
>>>>>> +
>>>>>> +            if ( val & DOMAIN_CAPS_HARDWARE )
>>>>>> +            {
>>>>>> +                if ( hardware_domain )
>>>>>> +                    panic("Only 1 hardware domain can be specified!=
 (%pd)\n",
>>>>>> +                           hardware_domain);
>>>>>> +
>>>>>> +                d_cfg.max_grant_frames =3D gnttab_dom0_frames();
>>>>>> +                d_cfg.max_evtchn_port =3D -1;
>>>>>=20
>>>>> What about d_cfg.arch.nr_spis? Are we expecting the user to pass "nr_=
spis"?
>>>>=20
>>>> Further down, when nr_spis isn't specified in the DT, it defaults to:
>>>>      d_cfg.arch.nr_spis =3D gic_number_lines() - 32;
>>>=20
>>> Thanks. One further question, what if the user pass "nr_spis" for the H=
W domain. Wouldn't this result to more issue further down the line?
>> I'm not familiar with ARM, so I'll to whatever is best.  I did put the c=
apabilities first, thinking it would set defaults, and then later options c=
ould override them.
>=20
> I am not sure it is related to Arm. It is more that the HW domain is goin=
g to re-use the memory layout of the host (this is including the mapping fo=
r the GIC) and also have all the irqs with pirq =3D=3D virq.
>=20
> I am a bit concerned that letting the users mistakenly tweaking the defau=
lts could prevent attaching devices (for instance if the IRQ ID is above > =
nr_spis).
>=20
>>>>=20
>>>> Dom0 does:
>>>>      /*
>>>>       * Xen vGIC supports a maximum of 992 interrupt lines.
>>>>       * 32 are substracted to cover local IRQs.
>>>>       */
>>>>      dom0_cfg.arch.nr_spis =3D min(gic_number_lines(), (unsigned int) =
992) - 32;
>>>>      if ( gic_number_lines() > 992 )
>>>>          printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded. =
\n");
>>>>=20
>>>> So I think it's fine as-is?  I could add the min() and warning if you =
think it's necessary.
>>>=20
>>> Regardless this discussion, I wonder why we didn't add the min(...) her=
e like for dom0 because we are using the same vGIC emulation. So the max SP=
Is supported is the same...
>>>=20
>>> What I am trying to understand is whether it is ok to allow the user to=
 select "nr_spis", "vpl011" & co if they are either not honored (like for v=
pl011) or could introduce further issue (like for nr_spis as the HW domain =
is supposed to have the same configuration as dom0).
>>>=20
>>> I also don't think it is a good idea to silently ignore what the user r=
equested. So far, on Arm, we mainly decided to reject/panic early if the se=
tup is not correct.
>> Again, I'll do whatever is best.
>=20
> Bertrand, Michal, Stefano, any opinions?

I definitely think that any user configuration mistake should end up in a p=
anic, a warning message is definitely not enough.
Here the user might discover or not at runtime that what he thought was con=
figured is not.
So a panic here would be better from my point of view.

Cheers
Bertrand=20

>=20
> Cheers,
>=20
> --=20
> Julien Grall



