Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F18047F0E46
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 09:57:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636492.992038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5062-0003Yh-F7; Mon, 20 Nov 2023 08:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636492.992038; Mon, 20 Nov 2023 08:57:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5062-0003W4-CZ; Mon, 20 Nov 2023 08:57:34 +0000
Received: by outflank-mailman (input) for mailman id 636492;
 Mon, 20 Nov 2023 08:57:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r5060-0003Vu-SW
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 08:57:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061a.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d58d18c0-8782-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 09:57:29 +0100 (CET)
Received: from AS8PR07CA0033.eurprd07.prod.outlook.com (2603:10a6:20b:459::21)
 by PA4PR08MB6079.eurprd08.prod.outlook.com (2603:10a6:102:ee::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 08:57:25 +0000
Received: from AMS0EPF000001A6.eurprd05.prod.outlook.com
 (2603:10a6:20b:459:cafe::6d) by AS8PR07CA0033.outlook.office365.com
 (2603:10a6:20b:459::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16 via Frontend
 Transport; Mon, 20 Nov 2023 08:57:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF000001A6.mail.protection.outlook.com (10.167.16.233) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.13 via Frontend Transport; Mon, 20 Nov 2023 08:57:25 +0000
Received: ("Tessian outbound e243565b0037:v228");
 Mon, 20 Nov 2023 08:57:25 +0000
Received: from 160d8c630df4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9C5404F4-A69A-4194-AF7C-6F69EA35F49E.1; 
 Mon, 20 Nov 2023 08:57:18 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 160d8c630df4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Nov 2023 08:57:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS4PR08MB7830.eurprd08.prod.outlook.com (2603:10a6:20b:51a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 08:57:16 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.7002.027; Mon, 20 Nov 2023
 08:57:16 +0000
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
X-Inumbo-ID: d58d18c0-8782-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=RiHCflC8ASv5SaKVj5iRs7b4kC4bYu/ceKcijBl5AK/ioAJwHO0uR1RnjwxlOw9zpEZZ8AlIZ0RatSoqOTu6hOMmvejlhXiRBDWdMksQifCAEL83hI9emtfu4GgkKQ3Mkq3kDTDkTBD9dKjP2njUyKVMpp+0on0GIqWDBrW+Zjpw1sFQmGshLPOV2S9vjkgyuNcVXP07zf8QrRXNkSZzZTCW5VSIp1kFUvtMmWndNcHAMVvDSRhV/qkA1A8Gs71MOp1BOd0+2mELsyGzoZbKk//o+X2Q9exlGHQ0FpkAPqMGKQqj4woQ+ut0YvaP51NDff5Pie5Yw/VbP5S+1Gs4MA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D5mdEXE1U+s/6IsW+X/7D4JtkoeUCYydBttbpDGamw=;
 b=OTR/Z/hcRo6IZLWuPtsADmsu2Mr6d6tWTdjmOLLthoXExYlDgWpcC+kJTwpJl86h+hPKfiWJ6Q8c58sQuRCEzoRmbGN3pzrbzU8PhKNJLwjpUxQnTjGwnbCeuyGnVlYPKJpyiEw0Z24rrRhTUAZ9jZ1j0+iB6yvKY+27XnK6DGKum6Ukga4YmL9rjtEUHsR7ZtPZhilV4e7SZMsHY8yVgjLnoZJE1ajnJAk/OWBF6ijj26R2MbGz0zVpQJocN/cwAKbxntsp+s/oV5TZnHjbeX1sZTh3suXDIRBUGkttL02d7+Dt8cwiJzWJ4pOHRK/ioSR/eWzV6sGfC8MiXE3/wQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D5mdEXE1U+s/6IsW+X/7D4JtkoeUCYydBttbpDGamw=;
 b=nihiSrbDMGMQPfxAlLI0rguwySfhWQQqAPuoyzqwGVWbflZ8sGbT92be5z+H6cNrR5EMhcuh9JHYtKu+CpAbieL3qcDPFKvJR/M6mtvowpLz+aIrXxN6pzfKyRbLaCObqIw2jEDtMicI6UVpM0igmUuXwhOQZuO2wz6rWJPJkU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a00452dde098f69
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M0ZkGvcFwhKgNaRltpU8x6wfntGuN0rfPAl8jxrfz8L0tJ+13UzgVtUolRjBUq7VZ6rkRk71wQTVCms3IkiEHMV7t4k5Hs8aRKpd4bWFdiM2g9et8fazSqHYVaJtPYR544/wzTh3SyI8OmswcvD/Azwl/rkAITxkhjRvGERQE+9SkUxSSRiHSJBYN55/1z2p5o1dOs/aGOZJaawQgVK6Y4K3K9EpXH+uAYHeyBa2dtc1ZD5vLtf33tE7Vz3ne++jXB6uJe81jkpOdeJcbqGZhwUexiRYBR5QkI6Z33AXJ8YjijNcv8JayejpspZ+aXypPEbdcPQlm4f281EODONDCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D5mdEXE1U+s/6IsW+X/7D4JtkoeUCYydBttbpDGamw=;
 b=m3DYIF4chreI8U0Zn9gqxtnNx/A+qWRsd/Zd60oq9b66vSUfJYo7SjAcdfOBOYqDOYlm/OG60YWl1mu0CjcX/mBgzh2ChM1k6DmbFivyhrdjjo2D02nyQvMACtvKUdzAu3k7px/PSRBAHnaCBh35YklQNNiTUhjT93Li3sUU1mRYmtR1WzY3po/4WWnHvDuo4DBFx7zcTamLm6H9Pib695haOfZpjdREw5XoMSbpmKGuHgBFA/WqJTlsowPpoR1/ZeTql0ME4KYbt851oHMHL+DTIAOltVrTc31Zvi6fA7/jyhnY7x16LVp+sOjjZFoIBhk4OSQ44apNJ2oKQ86qsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4D5mdEXE1U+s/6IsW+X/7D4JtkoeUCYydBttbpDGamw=;
 b=nihiSrbDMGMQPfxAlLI0rguwySfhWQQqAPuoyzqwGVWbflZ8sGbT92be5z+H6cNrR5EMhcuh9JHYtKu+CpAbieL3qcDPFKvJR/M6mtvowpLz+aIrXxN6pzfKyRbLaCObqIw2jEDtMicI6UVpM0igmUuXwhOQZuO2wz6rWJPJkU0=
From: Henry Wang <Henry.Wang@arm.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Chen <Wei.Chen@arm.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Julien
 Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 17/17] docs: update numa command line to support Arm
Thread-Topic: [PATCH v6 17/17] docs: update numa command line to support Arm
Thread-Index: AQHaG10aByfSKDcqDUu2sSAjolqOTbCC58sAgAAAiwA=
Date: Mon, 20 Nov 2023 08:57:16 +0000
Message-ID: <4F1E7C67-F55A-42E2-9B61-C71075605AC2@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
 <20231120025431.14845-18-Henry.Wang@arm.com>
 <31fc98d2-6bdb-4d00-94f1-d075b3ccd822@suse.com>
In-Reply-To: <31fc98d2-6bdb-4d00-94f1-d075b3ccd822@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS4PR08MB7830:EE_|AMS0EPF000001A6:EE_|PA4PR08MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 83166039-df47-4217-6668-08dbe9a6b787
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tw7rFPJCGxGvXgYjajj8wOF/InCFuV/jys6vSv7CvoY4G5AQCWMrAcYpXM6MJd3XTVoijKxSgpwqpx2SpKRyqy6TH4gHx8BdtrciBTOft0caZWzXaCSXkRb1vu7UlVgL6jvfZRQcYl9Jb3JiOO3gaEbyEfUxq9LZL86bq/iYctpy1zEkOPbdHY4gVVIidhdEbi7B6X+DZcs81xv4Wllzg+VOBosr+38bO4wELraamDVHugRJBcLFpGm9M1FY0RNqCxt6Vi+UXgzPjONbkjHmYmKABSF5nRi+xzN2u+pTKP0Pq/mIaAr4q2WPuyi5RyWPOXxHYZRK0qga8I/bY8hwcB2Fzlkp69T8jMbJ6dwz3iEF36ogm1bWjjVZjK9mt9S+V4O1WD6rEJIZO/FneyKv4N8AQHyA7Njc5gf+gkCrhm86rYE4JC57tMRwbCKBzzN+MviZz6KP4aUddStri8qWMQ+iccMJSAQPx/x2ieuH9HFLobqbm6+Sc3tzZqRizpoEr1st4yMYHXpfJdaiHOFTgK7gKnbAdrfR3S3v5gf1Dn1YFxjp0nwXif4jY09eaE0oXO/6TPRylFmtzGiYPTpKH9otkJ5o9R949H4dlEUFalXHChBeNX42qZ1Uo05I6OmTGsFtvbdnC+1sC8h0gdwNXhFsWGTxf38AF+tYllmJvvYDlwyVVTBo8pep81YI43G+
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(136003)(396003)(376002)(39860400002)(230922051799003)(230273577357003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(38100700002)(86362001)(36756003)(33656002)(38070700009)(122000001)(6916009)(76116006)(66946007)(91956017)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(8676002)(4326008)(8936002)(41300700001)(5660300002)(4744005)(2906002)(53546011)(6512007)(26005)(2616005)(71200400001)(6486002)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <360AFE920AED2F429F5C997577E4681E@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7830
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c34bdea2-e6e6-41e1-8022-08dbe9a6b21e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5d+cu36YtEgyaLuEVhkiOz7ykD8tdChsXIydcQ019JLHFPct1WzYtd52CpBq3Wafq2AtYEfQcVYOPzAoqHafEwXzIx+eycpmkW2wcvIGky41EpA3Yf8qlV1+cNQ3Bm0qVQBNv6Yr7EmKrWcWXUzE4DKKJuDi4DAl6o6F2NDQWm3M5eQcekDKCG/VH+hLM6brjnLbiIwATDRiCQfcWqXTc8juZU3yithOR3llXcMUDcFNO5sG2ARTxsOI2hkx/bwLd1GqOZaa6YqazPMHhkMQgURymzzaGWh1JN7wlBDOZn8XyioFHZL+0ZFHK0zVw1EBkHV1h6a90SVgaFUKZ2sJBLax1QypWpuTDT3oyDxAcN8Zt05WIvOkaaScyjuL8ecZeBqhRK2eKSoxFMNrBT/7YfjwX7y/7kaxWeKGHLeg6k9MNOnKhYVBj2Y5NPd0Uyp9G5lqaDjWtFNsXyns6ueFQFnONXnC85nbwLb/j3ImZRftdg6b22sVZRvIdSCPzEnG+9Qxz2nvQJW93gQvErMLGx8wZMSrYkawaer+MZoeEZd7WbgxNaIHPwrKQREpEV87Yofng9o83QKAA5L/ECONlTyJ3J2ciqmQswEYhCgWXl7jLbubRGNLKx0sYIvQbMAvXNvj3H9f543mYwLOop5ahuoljUU8T8PrpOYKbbgan7xla9rm0+sCmWV25zKV/tDFw+RoGjIWaXiZPp2NyYdtXPZ1GxUZKUMCLnbxBOdVuoGCcI/Rk/BKJgHw5okrRF3gy7I5tjA8Yfuve0j088AiCQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(136003)(376002)(230922051799003)(230273577357003)(230173577357003)(1800799012)(82310400011)(451199024)(64100799003)(186009)(36840700001)(40470700004)(46966006)(316002)(40480700001)(26005)(336012)(2616005)(41300700001)(54906003)(478600001)(70586007)(70206006)(81166007)(356005)(6506007)(6512007)(53546011)(6486002)(47076005)(8936002)(8676002)(6862004)(4326008)(36860700001)(4744005)(2906002)(5660300002)(36756003)(33656002)(40460700003)(86362001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 08:57:25.5379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83166039-df47-4217-6668-08dbe9a6b787
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6079

Hi Jan,

> On Nov 20, 2023, at 16:55, Jan Beulich <jbeulich@suse.com> wrote:
>=20
> On 20.11.2023 03:54, Henry Wang wrote:
>> --- a/CHANGELOG.md
>> +++ b/CHANGELOG.md
>> @@ -12,6 +12,7 @@ The format is based on [Keep a Changelog](https://keep=
achangelog.com/en/1.0.0/)
>>  - On x86:
>>    - Introduce a new x2APIC driver that uses Cluster Logical addressing =
mode
>>      for IPIs and Physical addressing mode for external interrupts.
>> + - On Arm, NUMA aware scheduling in Xen is supported (Tech Preview).
>=20
> - On Arm:
>   - NUMA aware scheduling in Xen is supported (Tech Preview).

Ah yes that looks indeed better, will do the suggested format in next versi=
on. Thanks.

Kind regards,
Henry

>=20
> Jan
>=20


