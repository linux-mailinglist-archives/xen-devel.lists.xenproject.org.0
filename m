Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C367DBC8C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:27:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625203.974252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUAq-0000s5-Oz; Mon, 30 Oct 2023 15:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625203.974252; Mon, 30 Oct 2023 15:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxUAq-0000pS-Lt; Mon, 30 Oct 2023 15:27:28 +0000
Received: by outflank-mailman (input) for mailman id 625203;
 Mon, 30 Oct 2023 15:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DIyV=GM=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1qxUAp-0000Z3-8v
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:27:27 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0605.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4203ae9-7738-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 16:27:26 +0100 (CET)
Received: from AS8PR04CA0131.eurprd04.prod.outlook.com (2603:10a6:20b:127::16)
 by PAVPR08MB9258.eurprd08.prod.outlook.com (2603:10a6:102:308::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 15:27:21 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:127:cafe::bb) by AS8PR04CA0131.outlook.office365.com
 (2603:10a6:20b:127::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28 via Frontend
 Transport; Mon, 30 Oct 2023 15:27:21 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.15 via Frontend Transport; Mon, 30 Oct 2023 15:27:19 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 30 Oct 2023 15:27:19 +0000
Received: from d868d0525783.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 65D4F262-D49C-43D0-9452-DEE1DD390069.1; 
 Mon, 30 Oct 2023 15:27:12 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d868d0525783.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 30 Oct 2023 15:27:12 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by DB9PR08MB6635.eurprd08.prod.outlook.com (2603:10a6:10:254::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Mon, 30 Oct
 2023 15:27:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::ce62:ebc6:8559:67e9]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::ce62:ebc6:8559:67e9%4]) with mapi id 15.20.6933.019; Mon, 30 Oct 2023
 15:27:09 +0000
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
X-Inumbo-ID: d4203ae9-7738-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=MapmhiFB3/VsBPGtmezgOXNo2Ei4MPfH8vEev5GUEshvgV2l9KUchQYUYf65yf7+8779NasQu1DgsHQesQQ7s3ZEDXsv80n0rEOOtglhZXrGFuUrpzMHStNouA8c/ZQfsInxNZ50CHHGuKrRkzMqkmImfGFg9HXOIGhMjkyriLEbgumXoINQgMn9F8i7/wRKYc/Yky+nSn5GJE2S7dJYwrzdTvS4PaW3+cKBb0qZK2QJQtOEQCoRof5s5pqaGa/kVRs5Ls1th85vs602Q77QyzzH+v6UIiyNxoy/xEUvpaX8FXystMcU698JmlvpxyXVZWoouGKwpzwYKbn3urevvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1BpK4nmNdwq8973AZFAVqVffbPuHIuOgWx3KVCxSJE=;
 b=EXBPfBZR2PE2whFfaMPGEIlJFYYLBNYhvzLF2PDCuTIWreTNyX5TBRQN053dszx5yfdVy++L3Fi8zIBXg1DzTjojzngZNQTHPEkNDwgirnkqO9DmnXDE7lOpi1nqDtORVvKUot+8zEVaXztlegcNsh5fpjoEb4oHUcyPQ/m3SSKGxtEHb3kZV4U2arCFbWaeKwEu79qvjttRHbelO0kjWOW8RL0IWPbUhF4f3Eqbyr/hV11QCZW85ipV7VsfFKqUzdNL5YZyPjAL5gulz93dG72KFtZ95dnw1e1zXmugVw4gT7kqB2pnnAhnMkiA5QPxcRl2uA9c9+AeARl7HUPxQA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1BpK4nmNdwq8973AZFAVqVffbPuHIuOgWx3KVCxSJE=;
 b=DZpfxd32IxYGf6cLIVNI+5gQFCghX9//ol5OpDpzEn/d6iAcncBR1WEO0AOuBXUoD2ceslQxWnFbypGrWa8mhmk3ksA7M4yk7qHL/pUYBc3vAu576Ko9l5tBO/jES7QEIc9TESqrZl0W0pHVvIpqQcvBnkwEy3mlmSlX4TcWpdE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f78a95aad863e35d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWYr16xpPGJFyAe1x1cTLfOsN8LNDtMs/DQvfcQzVmMxsasFIssxEU6Ip96pZdtvTiXpgAiL4fkE84r9Hc9L2eG5tRuR02LO/2Qs/MuQ18QppvZni9dl5cDwoLK1V+TKa1BB3Hcpfdatl0TKb5hiJsZTWSlpyu9H+LIChXkJVMuua3Bsl3eZf7rj58ErXRj+RGASETBJpLHk3f5lqQrdQjXKRJ2ka0ESuZ65cmTmpX6cFnaHmQPisfd9toKzOf7zB7cJhkGTsMaIq7VSxLyoadbcM8Vf/APafkNA3kBB59EQ63IwXl3xdHSp1K9GIlZ8krXXaHo8CTI/EQ2P5DjEVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B1BpK4nmNdwq8973AZFAVqVffbPuHIuOgWx3KVCxSJE=;
 b=Ofk/WrCFaNddWQAVJmDoB6Dp/CLdjKpJn3vfMlXsA+lFOTOGXzwTEHCR1leN9mpueswgG3k8OyTdtn+uyFHVYFBfVdIHt5vsB8dVUHks1JplWVpB31/PZKQQCeOco3ddO5CO+y9WXuKrWYzwMZCK5NgEJ+6yeTmjyqWV8y+5/yqtr4u98H4EXBKL7d79TSYHmABTt64SdMUdwbufA/bGBc4rGbevPEGJDRXVblMn+DdRxwsFxC0ydCoWk/oonlmnjHnUeNF/tbrQfEibed7U4m7VmYdnfNWFZchzJrlVDV6G/BoASnMM52T5b5Az2rxJsCA61E9ajF9KVUssjrUN0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B1BpK4nmNdwq8973AZFAVqVffbPuHIuOgWx3KVCxSJE=;
 b=DZpfxd32IxYGf6cLIVNI+5gQFCghX9//ol5OpDpzEn/d6iAcncBR1WEO0AOuBXUoD2ceslQxWnFbypGrWa8mhmk3ksA7M4yk7qHL/pUYBc3vAu576Ko9l5tBO/jES7QEIc9TESqrZl0W0pHVvIpqQcvBnkwEy3mlmSlX4TcWpdE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: Re: [PATCH] arch: drop get_processor_id()
Thread-Topic: [PATCH] arch: drop get_processor_id()
Thread-Index: AQHaCzUe0SAqyX2Ma0ufwbFDL3dTKrBidKAA
Date: Mon, 30 Oct 2023 15:27:08 +0000
Message-ID: <A1FEFBB6-0A72-4B96-A18E-73033886DDDF@arm.com>
References: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
In-Reply-To: <446254b4-8231-f6db-5f18-ed367503454c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|DB9PR08MB6635:EE_|AM2PEPF0001C714:EE_|PAVPR08MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: f01779e6-056d-465e-e10e-08dbd95cb4b2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 A+YTSy0tVNkOR7sAfwySGl+qO8PctCbkyobIqeEJL5+2pckk1vhij3SXXm1lJpv0OUBf/dm6BPtLLE8Xw8sucJpEiA+Eb4HLTxFqPnDl0riYzbX7fx6YmLQRtnzQnwMu5ecIJ0L5HbWJYThFVFv2EpOkxOL4kGw3ba5Qzft0xFu2k1Ic+d8mIgW+TJLV4PA9Cws005EttfjTG/mpPGE1k6gf3p36IrffonREUBSqMcOyAExqitnjpiB6YpgUq03Ic6cFr0DN0qxzjSapmm3vutbwJfdFldZageGNuMELg+4vQzuYF6uViVldKyipElp64Lh506PjkpgujMvwKZi/EClxgw6j7FJWNoNObEzzD6FaPJ+MlKuwLd9QjlyU07Xv5t4u/cUKC0agOmtAX7zC9kds4sMEVnwUHMc4G2DWgfrGf73tb3jzgCh5zstAQQmteFzrijiqCbtwVknQ4fcPcinA4mFUywAtH2iAahErChjI2s2SP1yIUk3UhCTuJevoDlh4hpm90M45T9uRcfgtZ3vzmRaIdMxFwwSmk3rmnZSUnCetVExtB1DlKovpWKB0JjDD2OHDIXBMk0WuweQBVeuREKC2Ilq7kEgSo2VqEkrs3T/EK8MAX+zL8PunrT+3A4ffzEIBbMuDzykZW/lD3g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(186009)(1800799009)(451199024)(64100799003)(54906003)(2906002)(41300700001)(33656002)(38100700002)(76116006)(64756008)(122000001)(478600001)(66946007)(66556008)(316002)(2616005)(71200400001)(66446008)(91956017)(53546011)(6512007)(6916009)(66476007)(6486002)(83380400001)(6506007)(4326008)(36756003)(86362001)(7416002)(5660300002)(8936002)(8676002)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <717148E0D418564AB528D96D8C2D36FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6635
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b96ef698-f9fb-4fb5-b643-08dbd95cae74
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QHPc/F4jHJRwvN5HODiGQCW96ZzYMh5MsteRJngvM3xiI3aaNMzJY4X/HVbdc/jXAEX8bxFtKtCDHZaMzKVHd2Y9N03sXp1sVM0/1uvvKtkZAMteH2km+DBpoL729VQN1g/551HAGRDBPh0+P5Wn2XLmCckxhlumD9Lt2HxuX2jmDWCkfVPyt4qB9+l//mukiivVcki+GBLksAMsLBk6fqNZ1zynZojYUGyDeWXg6XDS9uOF46vQxXFIyUFb8tD6FufTG/0KeHHie941N4pbVTi23f2C7kujqyZ2j8eNDWOBxlZCvRXl+ZMvyH2QgzxnbVmKMYYIC7Z211SP7uEmX3HyHFiig07plkPMCVxZZZ9/6F0RfxvJtLYkvWvPOe6n1dIWvqrbCTTCnXvsDkSPOXvaldW7nBiaUCqXmGUhFj/ZrG01lTFQ+/nwaLKJhUjzcWbVVBK8e46t/o2B19rMHKT9zAaAN2JNoHkvMjJ6VtPFMP9OlMwQnP5Z+FE4xUgCoE/gl4jNnPX+oeuV3SCBBHLmdBA9RDClv7Jd19zH8suyCaDHhoRhgOpZAf5YvTQ1gPXy63j0Adpivkr//micBcAUqsq7vnkayCXAsJmJNadWini4AJSeWDJ2d7iIuAAw40lxWY9JPPpelP5epkBTh5oxL2bOgMSz1CsaBQjUaTKtX4D4GNDdkXTwyU+MlKHJ9Gy/KY4bFD2qQLOsIPrg7wv4vvHl949Hnu3JFsFSwNAHR0BPv98VOhzkbM08EwI9
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(82310400011)(40470700004)(36840700001)(46966006)(6512007)(40480700001)(47076005)(6506007)(478600001)(6486002)(36756003)(336012)(70586007)(26005)(70206006)(356005)(2616005)(36860700001)(82740400003)(83380400001)(53546011)(107886003)(54906003)(316002)(81166007)(8936002)(8676002)(6862004)(4326008)(40460700003)(5660300002)(33656002)(86362001)(2906002)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 15:27:19.4272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f01779e6-056d-465e-e10e-08dbd95cb4b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9258

Hi Jan,

> On 30 Oct 2023, at 14:29, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> smp_processor_id() is what we commonly use; there's no need for it to
> have an alias.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

For the arm part:

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> --- a/xen/arch/arm/include/asm/current.h
> +++ b/xen/arch/arm/include/asm/current.h
> @@ -53,7 +53,7 @@ static inline struct cpu_info *get_cpu_i
>=20
> DECLARE_PER_CPU(unsigned int, cpu_id);
>=20
> -#define get_processor_id()     this_cpu(cpu_id)
> +#define smp_processor_id()     this_cpu(cpu_id)
> #define set_processor_id(id)                            \
> do {                                                    \
>     WRITE_SYSREG(__per_cpu_offset[(id)], TPIDR_EL2);    \
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -11,8 +11,6 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_
>=20
> #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
>=20
> -#define smp_processor_id() get_processor_id()
> -
> /*
>  * Do we, for platform reasons, need to actually keep CPUs online when we
>  * would otherwise prefer them to be off?
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -401,7 +401,7 @@ void start_secondary(void)
> /* Shut down the current CPU */
> void __cpu_disable(void)
> {
> -    unsigned int cpu =3D get_processor_id();
> +    unsigned int cpu =3D smp_processor_id();
>=20
>     local_irq_disable();
>     gic_disable_cpu();
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -99,7 +99,7 @@ static inline struct cpu_info *get_cpu_i
> #define set_current(vcpu)     (get_cpu_info()->current_vcpu =3D (vcpu))
> #define current               (get_current())
>=20
> -#define get_processor_id()    (get_cpu_info()->processor_id)
> +#define smp_processor_id()    (get_cpu_info()->processor_id)
> #define guest_cpu_user_regs() (&get_cpu_info()->guest_cpu_user_regs)
>=20
> /*
> --- a/xen/arch/x86/include/asm/smp.h
> +++ b/xen/arch/x86/include/asm/smp.h
> @@ -48,13 +48,6 @@ extern void cpu_exit_clear(unsigned int
> extern void cpu_uninit(unsigned int cpu);
> int cpu_add(uint32_t apic_id, uint32_t acpi_id, uint32_t pxm);
>=20
> -/*
> - * This function is needed by all SMP systems. It must _always_ be valid
> - * from the initial startup. We map APIC_BASE very early in page_setup()=
,
> - * so this is correct in the x86 case.
> - */
> -#define smp_processor_id() get_processor_id()
> -
> void __stop_this_cpu(void);
>=20
> long cf_check cpu_up_helper(void *data);
> --- a/xen/arch/x86/mm/mm-locks.h
> +++ b/xen/arch/x86/mm/mm-locks.h
> @@ -122,7 +122,7 @@ static inline void mm_rwlock_init(mm_rwl
>=20
> static inline int mm_write_locked_by_me(mm_rwlock_t *l)
> {
> -    return (l->locker =3D=3D get_processor_id());
> +    return (l->locker =3D=3D smp_processor_id());
> }
>=20
> static inline void _mm_write_lock(const struct domain *d, mm_rwlock_t *l,
> @@ -132,7 +132,7 @@ static inline void _mm_write_lock(const
>     {
>         _check_lock_level(d, level);
>         percpu_write_lock(p2m_percpu_rwlock, &l->lock);
> -        l->locker =3D get_processor_id();
> +        l->locker =3D smp_processor_id();
>         l->locker_function =3D func;
>         l->unlock_level =3D _get_lock_level();
>         _set_lock_level(_lock_level(d, level));


