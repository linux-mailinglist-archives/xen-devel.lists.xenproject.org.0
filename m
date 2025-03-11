Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72EA5BC50
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:31:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907526.1314754 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvxA-0000XU-SL; Tue, 11 Mar 2025 09:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907526.1314754; Tue, 11 Mar 2025 09:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvxA-0000Vj-PT; Tue, 11 Mar 2025 09:31:12 +0000
Received: by outflank-mailman (input) for mailman id 907526;
 Tue, 11 Mar 2025 09:31:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=azTi=V6=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1trvx9-0000VX-MZ
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:31:11 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170110001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9166024e-fe5b-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 10:31:11 +0100 (CET)
Received: from AS4P189CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5d7::16)
 by PAXPR08MB6365.eurprd08.prod.outlook.com (2603:10a6:102:156::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:31:09 +0000
Received: from AMS0EPF00000191.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d7:cafe::59) by AS4P189CA0013.outlook.office365.com
 (2603:10a6:20b:5d7::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.27 via Frontend Transport; Tue,
 11 Mar 2025 09:31:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000191.mail.protection.outlook.com (10.167.16.216) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Tue, 11 Mar 2025 09:31:08 +0000
Received: ("Tessian outbound ae00a21450c4:v585");
 Tue, 11 Mar 2025 09:31:07 +0000
Received: from L5a6d3558c43a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F50ABE33-A044-4072-8AC6-C0B0FE7FE832.1; 
 Tue, 11 Mar 2025 09:16:17 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L5a6d3558c43a.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 11 Mar 2025 09:16:17 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com (2603:10a6:10:25a::24)
 by GV1PR08MB7801.eurprd08.prod.outlook.com (2603:10a6:150:58::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:16:13 +0000
Received: from DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a]) by DB9PR08MB6588.eurprd08.prod.outlook.com
 ([fe80::a8fc:ea0d:baf1:23a%6]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 09:16:13 +0000
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
X-Inumbo-ID: 9166024e-fe5b-11ef-9ab9-95dc52dad729
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LeJsH9fSjWW0Y2MtSaVXBmL4GkigJNoqtliAMY9p4PzOg1G9bBdOP/T0p75jm9ZVqWr2byUarN83hmAxfyE3BRZPvyjvgBaVM5LugC9f6cCf5XBiiGzmitSYI1mmhFHN6d6IM+Q2Wy39QzDaYZUh373or3SJUREv0rzvMIylRysN0wBMExrMhB+WUkQHu4eOcghtL2pz2naYpboKFP6ad12J+I6xupvlGpvDzCdpf9mamBMo3EaP5iyd6o60osXF+fWLqj1Vbx+eJ9upE111KgkiYli7gqctyf+oAc4JHriBI8rewTUfgTzcY9Zlxi6bbK5nKSiqhZVA/BZASR2zPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohvof4En0FAIVZaCenEx6GEiQWab9plrAxOwmfnp3QE=;
 b=e10Lc7LbPG7vlxTfHu4Kan9FCwCly35kxO08o4p8Shx3hAKVuxN4AtLkhwXiYR8Qicer7any2z5AelNPFzFVbs2iiTSerYQbgNB8zOhy3CYXuaUUlr5Uq8RujPUqOVWwaotBJo/fe8zKyUMTX4Of5Tr7x57zaVahY1TmI4vtsMDLoYo+JpIpmhuaMCzOttBAc/m/XcWyv1aAK7E0xue7fqcB+l6U82KtCfjiEf2S+SuFmgbm7+GkEwkQgt6q6LqJKbnBHf84d3MxGUR6n0V3B6+pS8r6KpF1c7yguvLGheXeKUdyCn4XJcavKQlznMRNocXrGQbzsHevmPQZzfvPYw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohvof4En0FAIVZaCenEx6GEiQWab9plrAxOwmfnp3QE=;
 b=XJcAFguNXlTmy54gWUgfvcTBHqBHsm8UESTHW1508aGUuRmFuYVxZvgwLMCNmjj7AYEF95EkSMQnCqqAT9Q7k1kYf/fk4Xy+mkZmxtlw95wUhE7b7q3exvImtcjfuAbB2rkjsW73FYEJzG/UY76xsw407wsotlkpKy6I8NgxLw0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7936c80e08063f44
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pn7Le2C24gx4IJ3ZMq7Zwb80MiificDEvH2X5tkwQwiIPMUE5yEp/RDdVUHAI5DU+6CPC87h/hmrj32uk73pF57EnF2vKf505FfqJiaPGWWS8MnB2u8bpw6/CupFHRoxkdvuP5ea+QLWVkfq8DilKBWq8kLH9uoDXdt53ZaSzGINJT0FLEc4nqVE+oAlEjPkRcU82Oo20qiUs5NlW2ZI524Y2ol3cMrGlsxg0Sr/Aytx0T9P+QW3nTE2y2xklU8l/Mk13hSg3zAGUqUhOXn+B0RqomTEhfimM3+ndwoCUUSEtsJINVXy6lf9Dyjp39y6mPw4dgardJjpcQBsSoyDHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohvof4En0FAIVZaCenEx6GEiQWab9plrAxOwmfnp3QE=;
 b=oukzZwdSq/LbUkW5ozSEqcMUA52RKvtcbWFZRYy/1eiSkEDEhGHl9rNpmPl1lmMOEHxVA1M5NiPIDmVPT94oSsLRUfIE9lg75ztJGpLXzdQsXPubQaeFOUaGMptDzhRS8JGyNYsLbvrtRIEKFod5Z1bA/U9qQeOeKutB/JniRYPjOvGRotKd3yQSE6+WxeIgTijAJBvjUa46fJ+3dMcgzMq7mzG1TQBC3vH2OXs9g2LYw/298uAJ7A7CfmkF8eP2idtzNofwvbwSjzB2A6f97M7GyCSCxZMgjCv2zKJCYyI4cCgM78tk+OedEBBUBc8r/OLjOKcbPRKZCN97CbNM1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohvof4En0FAIVZaCenEx6GEiQWab9plrAxOwmfnp3QE=;
 b=XJcAFguNXlTmy54gWUgfvcTBHqBHsm8UESTHW1508aGUuRmFuYVxZvgwLMCNmjj7AYEF95EkSMQnCqqAT9Q7k1kYf/fk4Xy+mkZmxtlw95wUhE7b7q3exvImtcjfuAbB2rkjsW73FYEJzG/UY76xsw407wsotlkpKy6I8NgxLw0=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "jens.wiklander@linaro.org" <jens.wiklander@linaro.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v2 1/5] xen/arm: Create tee command line parameter
Thread-Topic: [PATCH v2 1/5] xen/arm: Create tee command line parameter
Thread-Index: AQHbkcvmWLsPML0q4EaY80wFSeZIVrNtnW6AgAALZQA=
Date: Tue, 11 Mar 2025 09:16:13 +0000
Message-ID: <2418E6A4-E70A-42CC-8131-69A0798BAF40@arm.com>
References: <cover.1741617888.git.bertrand.marquis@arm.com>
 <9313ffc0cf2e8be7e39ba24e8849a27b6bae2526.1741617888.git.bertrand.marquis@arm.com>
 <83f0a115-1a14-4992-91ea-df354c5176fd@suse.com>
In-Reply-To: <83f0a115-1a14-4992-91ea-df354c5176fd@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3826.400.131.1.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	DB9PR08MB6588:EE_|GV1PR08MB7801:EE_|AMS0EPF00000191:EE_|PAXPR08MB6365:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3ce72f-6074-4e22-7b3d-08dd607f7458
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
X-Microsoft-Antispam-Message-Info-Original:
 =?iso-8859-1?Q?b5OVcg5qW7kIYpDHF2yOI4MvGAN32/js6l72xkGrfiztfLX+y6Za7+PCT8?=
 =?iso-8859-1?Q?+m4Xu5CwYyEM811c1wHWx0q/HBmcFsauA1ll2Ns5EuWcdsL5Gzz/sKWrn0?=
 =?iso-8859-1?Q?Cm3xaxX7w906Qv3sw9ZqJxQrQ2EWMxWSRp9MD4G8GZHPgdLETMpsQlupFP?=
 =?iso-8859-1?Q?NDvG8AKat6737/Y+gPwhJqiihy3MijtoyXppWInccGCcRKynrKKl4oH7le?=
 =?iso-8859-1?Q?LfYJ3eomVNtdxVnDfpQnchOSlGzKxS122vtecZJk11IQNnl5LnDu3V70u6?=
 =?iso-8859-1?Q?Ci0Bz6gzhmL8h6HOCdQreR/zojhEwHdBZ0XkU7iC2p7PcEy7p2xk0UFmty?=
 =?iso-8859-1?Q?UWzimRoaGLzCXHx5ubOBF3U+rWulmx7zfRTv33Kv6OPmD8sB3c3fXZNf76?=
 =?iso-8859-1?Q?vd0qxqaK0mdlthIk2caEe1PcGoqn1iFkm8HY3dswMNGNey+nVBn5mRvce6?=
 =?iso-8859-1?Q?j1teji4ntw91V61b17kJcMRMu6QXqo4AWbhYtb/2ketrZeGofqRrvl4LpC?=
 =?iso-8859-1?Q?SA47g1QcJV/5t8TIyvMc3Gj6N2w7p5YmidXxN9W5HZeuiefz1Z6D52IvR1?=
 =?iso-8859-1?Q?Hs1atyroYCLLsL3AeVw5XettCuaErOKiuciP56HBFZxfeXmJ/dXjRvPV9G?=
 =?iso-8859-1?Q?jnJXhADp/w3zcep6jaugQSoel57fXS8UaVSQBjePWdZvdgw18Jhvi/nWzS?=
 =?iso-8859-1?Q?HCI9uGzQ1gTjJ5ErwlD3pbfA3kzhrGl28LflX7toiNwIuSRG63mXx8DqDb?=
 =?iso-8859-1?Q?16NDY9FK3hgPyaEYT3jqoNuUrQVndNsh77TtX9KmaBNztNql6fdCmEsjwt?=
 =?iso-8859-1?Q?6Tnzcxd7Bahkt0rePUKKt7mh8MwGVR/01HOZC/AUKBhdACnF38EvA555sy?=
 =?iso-8859-1?Q?rBlRrYC63YmxbRZaRaSt2jvFTEEZ0BHZSHLl/Q5J/W7a1BG/sX/Yc+Dchi?=
 =?iso-8859-1?Q?2gE7QFrPVp7qu53TrhiLuPHEZZkefWrMt5lUyNZYjE0I0Man8L0WyKXkX3?=
 =?iso-8859-1?Q?mJGlQ7CEiV0g5kVn9vsfNwv7oljxuwGj7EiKnMWmrH+8pKFNo5FuJ4ZZTi?=
 =?iso-8859-1?Q?FQ0gJ5ZChXsMiqxR6KfxXAnAnVT8ltMKzIdlddTimKyEiCxG7dnl4XLskG?=
 =?iso-8859-1?Q?tH8LOPPAJLwGDMmnaVsnof/N7NHCSA+pWG96TAOm6sZuu3zjmXoXo3PK0H?=
 =?iso-8859-1?Q?gdWRvV1gCv0UJjycpp3s4WDO+rBDnnb8FoJ84le5cvkC6pTNZZG6v3DfJQ?=
 =?iso-8859-1?Q?vzXZjEv2Kpz8reeQ2Dh0YvjsSkQF+s/lPXBoNG1AJgtRspFNmPYQ/VViWi?=
 =?iso-8859-1?Q?AalHFdtqJIlCim0EHs+tyJE9L+zpp3cKBSKd9MhvPZrOUdm7fMoZpkNKvh?=
 =?iso-8859-1?Q?roubwWjJsGluTk0QxvgLAsbgAxBNMhTtXWOcBGyl4JC8RAfsuvjyI7toPB?=
 =?iso-8859-1?Q?rwSQWGGZEaBZGK1IKsTS71rZH7LUFPzJrICUnx1BaDxXppnXg2HtGYrP8a?=
 =?iso-8859-1?Q?b6E5IOyCXxj0qUverIpeJx?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6588.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <50A22F7498211F42983B7312E32E916A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7801
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender:
 ip=[2603:10a6:10:25a::24];domain=DB9PR08MB6588.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	97c22eb9-9d91-4ee2-c261-08dd607d5ee9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?AW7wUah6/uq5Y+SjBO4VXqJp1NIHlFreSXtco9VSlSFL2Ye3hPf8B9F/Tp?=
 =?iso-8859-1?Q?xY4uu5NPo2JP0aifwhOmPX3Rscbc7T29uHkeuJYtwQyyQhcY1b45Y8mVNM?=
 =?iso-8859-1?Q?R8cw6yKnXj5qtW2NMdmdE6H5M5SNhZoejwUwTd2Qr38P/xE/8ulUmsH7Vf?=
 =?iso-8859-1?Q?r3HncmIN+ynMIekwE2z/6ye3lZxwLWCzidEWPWcr9d3MV2y+bo+Ca5Hm/r?=
 =?iso-8859-1?Q?xKeBi88DCP+RIKqRwf2CI2MX0tw/ucuaMA2c073pwKkqZv4ML04b6rldsY?=
 =?iso-8859-1?Q?K1h6WQOkUu+xvNPmE24VNVRcPtN0sVrEsIw8MvxfgD3dnzMp9VhrBe41J/?=
 =?iso-8859-1?Q?P8h+qJyeWXokfc2WF1Oz3ORVFVTlMeQtv2bnsFrLjdaCI68u0d3gulMZv0?=
 =?iso-8859-1?Q?uGFndHAEg89B5ohJ4wo6XPbFhBRUWiGAAiNat2TpSp/nrI3YGT0Ce/AAjn?=
 =?iso-8859-1?Q?v76DYJeKK3tHEhqMWouz8vDHg3ZSRhZ9kiLP6dBzJjjAGHltFBicIsopVG?=
 =?iso-8859-1?Q?0jZqnhJVNpP3+W1TKwUEwnf15SEoc3YQHyiYeDJ9+uc4Oovw8hB8cK6w34?=
 =?iso-8859-1?Q?M+1Nd0JvJV5uIf5WrwXl1iOfrDHFH5p9RiJEhFBxf9W9ExFw6PJUuaM9CG?=
 =?iso-8859-1?Q?mVl6pXxvXpkUMGH7SdB929yzqA7teuColtKE6NDNAZZra4ZcTO4ALOJZ7m?=
 =?iso-8859-1?Q?NB3oxemOuA9xp+hVhEj3YDqeOp25wu7WzXjekTC7YubFfIALwnqKPN+HS8?=
 =?iso-8859-1?Q?AuwgaDrT5koYijK3zibP0Y+zmKjCHPvHJGeVuW5VeRq7/oIhE3m1CMT2oK?=
 =?iso-8859-1?Q?jRz5WmWYarXpgCwR/V16dVAiAFiZO/IE4AsZ5jsHUDiA/iLUsMDnHTC21x?=
 =?iso-8859-1?Q?Fkr0BqEq8W7gdWEpD5ysb7afx8+ZnWHHWeXnkpsh7BBT7b+2UHjQ1gWP2I?=
 =?iso-8859-1?Q?LlfvnSfFnC4i4c/WOd+B+O92pgfAmscRoyGXMQmBn4KUcDzHQdMzTNhkYg?=
 =?iso-8859-1?Q?fRiF91wNJ62S+cwOnURN88BOQNWNd4DmIN9hI/J2+9yWqODVdgryztTKbg?=
 =?iso-8859-1?Q?vN/9ZbW420ypQEjDGqVxproS8aqucpyFzTzVAzOS0T7xa1ijQhHWvPWziD?=
 =?iso-8859-1?Q?vl5w8fvER1Ez08QwgvjFGfdhtIlq26jYsXUmDEVdR9w5AtsCKiI+3ZajjL?=
 =?iso-8859-1?Q?onaNZEVOeho5Zejeety+gmC8pNCoyBC6gsvbucuJauxoaizvvSgO4g7rRC?=
 =?iso-8859-1?Q?AGBoK8/1eezCUin48HuiSX4BdtJri3S2xng1OhDNs7vYZc+kDnJCEFFkLT?=
 =?iso-8859-1?Q?x+XYciYjEjPDeA8AtV33GHI0LfeLvP0ll8OLx+byOUduy7aykiGdMa9Lh6?=
 =?iso-8859-1?Q?aqAzIHtvymyb8k+Q8P2b8atlXVYsjS/ssFDHJfh/u1hy1vCwFCJY+PUuD0?=
 =?iso-8859-1?Q?o3i/YOPNVI6LLcLnKIgaBX0niHYsc6iwMIqdc+cXz9+QXXZ8IN7Gyl0UZS?=
 =?iso-8859-1?Q?O9EN3qwD5P2nzO11CXx04EvOf34EiHWnscu/e22SXMkKqoAh94gax4RgU2?=
 =?iso-8859-1?Q?LUHVsTg=3D?=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:64aa7808-outbound-1.mta.getcheckrecipient.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:31:08.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3ce72f-6074-4e22-7b3d-08dd607f7458
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF00000191.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6365

Hi Jan,

> On 11 Mar 2025, at 09:35, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 10.03.2025 15:50, Bertrand Marquis wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2651,6 +2651,20 @@ Specify the per-cpu trace buffer size in pages.
>>=20
>> Flag to enable TSC deadline as the APIC timer mode.
>>=20
>> +### tee
>> +> `=3D <string>`
>=20
> This wants an arch restriction, like we have for other command line optio=
ns
> supported only by one arch.

Oh yes definitely.
I will fix that in the next version.

Thanks
Bertrand

>=20
> Jan
>=20
>> +Specify the TEE mediator to be probed and use.
>> +
>> +The default behaviour is to probe all supported TEEs supported by Xen a=
nd use
>> +the first one successfully probed. When this parameter is passed, Xen w=
ill
>> +probe only the TEE mediator passed as argument and boot will fail if th=
is
>> +mediator is not properly probed or if the requested TEE is not supporte=
d by
>> +Xen.
>> +
>> +This parameter can be set to `optee` of `ffa` if the corresponding medi=
ators
>> +are compiled in.
>> +
>> ### tevt_mask
>>> `=3D <integer>`
>>=20
>=20


