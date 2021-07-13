Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6CF3C68DD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 05:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154983.286247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m38xj-0003fO-Gj; Tue, 13 Jul 2021 03:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154983.286247; Tue, 13 Jul 2021 03:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m38xj-0003cT-Cu; Tue, 13 Jul 2021 03:19:59 +0000
Received: by outflank-mailman (input) for mailman id 154983;
 Tue, 13 Jul 2021 03:19:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tLs3=MF=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1m38xh-0003c4-JW
 for xen-devel@lists.xen.org; Tue, 13 Jul 2021 03:19:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.53]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 319a88ce-e389-11eb-871b-12813bfff9fa;
 Tue, 13 Jul 2021 03:19:55 +0000 (UTC)
Received: from AS8PR05CA0027.eurprd05.prod.outlook.com (2603:10a6:20b:311::32)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19; Tue, 13 Jul
 2021 03:19:48 +0000
Received: from AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::b7) by AS8PR05CA0027.outlook.office365.com
 (2603:10a6:20b:311::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 03:19:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT013.mail.protection.outlook.com (10.152.16.140) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 03:19:47 +0000
Received: ("Tessian outbound 770f4ae52989:v98");
 Tue, 13 Jul 2021 03:19:47 +0000
Received: from 451d0fd7f54b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BC3AFBC2-0FDD-40CC-89C2-869917590FAD.1; 
 Tue, 13 Jul 2021 03:19:40 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 451d0fd7f54b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 13 Jul 2021 03:19:40 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com (2603:10a6:10:2a2::7)
 by DB9PR08MB6844.eurprd08.prod.outlook.com (2603:10a6:10:2a6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.25; Tue, 13 Jul
 2021 03:19:38 +0000
Received: from DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::c45:7e0b:231:b050]) by DB9PR08MB6857.eurprd08.prod.outlook.com
 ([fe80::c45:7e0b:231:b050%9]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 03:19:38 +0000
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
X-Inumbo-ID: 319a88ce-e389-11eb-871b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE4/j+9ppXS1MAB9BJaWimkipXECDi8DSsGDky5Uqow=;
 b=WD0tkihk5rUfWy1gFQwVplD+AhrEiO1RBs0X4QpuDeD6mGcYILe75Vf5azw7s4Dm/cTifBdA47WtCYEqd5oLqBo5iA+2h+ccW9KV2qyemGlazunRSJbMSXQTB70vY/THfQR6Eq8DrpCvVaEWPw9eMd5kfkWEvbMGfNVEWIShz78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xen.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;lists.xen.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LP9GIMl4+RB10vyGUDUEbhV98Cz4Y81/vJJhapeYQ4NcTT57v/bRhSRUkVKDBxUqBroi1lT3OgrtpLdjX//+3SxQCG9Z6c8lKCY2RA9arJNEuyViXXaBrFNjJVb5Z20SKjozh4ppKYywcNXHIjYPGU9VtDR2wGYxwwSrqpQdO0BppPA7mpOSS8e9ffxnaXKtSVq9nh21d1WVC3X1gLcLQDeqpd9+tEGbwUloFqHuYs1d/W0OODOskri6ayNPgmVkUXmHV3FoRR6m3wxM4q+sv87sLQxbdYzXkk0HeTs+gdrkWxe45lET/s1V3KH5/+ck51stybJ/iXHZ+SHr8zhsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE4/j+9ppXS1MAB9BJaWimkipXECDi8DSsGDky5Uqow=;
 b=cSFjsPzfbVmldRmsYduElN+v8fWO9HuVlgx8YZ7YtBe3SjDDSgQLHuWOZtNWGv0pumP2hYkaG2SZqBeTXeKpJvx5wr2lHU7Qn4e+Ag7wsdNkxgRD47OxZeS5MkxZ5zmc3GvwugPI2FFvxwRsruHLyxl6mQzoNkSj/iLmD6zDhi0vZnPnNTBx9XQzhpeOdJzFCzsII027Ak/zqR6iVPiymfqRhn+/5v0UvlA5ttfFQnJNL5iXTRnK8r9qFvCr9bUo3HRubw21E0x8mLKvmEljf5uHtNSpr1R6HtDRJUgC+v1CYRE3lnXIZkLIS1nc2zDhxNVuZ7pYRgAdyWGUYzsJ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HE4/j+9ppXS1MAB9BJaWimkipXECDi8DSsGDky5Uqow=;
 b=WD0tkihk5rUfWy1gFQwVplD+AhrEiO1RBs0X4QpuDeD6mGcYILe75Vf5azw7s4Dm/cTifBdA47WtCYEqd5oLqBo5iA+2h+ccW9KV2qyemGlazunRSJbMSXQTB70vY/THfQR6Eq8DrpCvVaEWPw9eMd5kfkWEvbMGfNVEWIShz78=
From: Wei Chen <Wei.Chen@arm.com>
To: "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>
Subject: DMA restriction and NUMA node number
Thread-Topic: DMA restriction and NUMA node number
Thread-Index: Add3jZlm0dMwxzV2RvOni5fmVkcvwg==
Date: Tue, 13 Jul 2021 03:19:38 +0000
Message-ID:
 <DB9PR08MB68573DE6333A36646EDC75409E149@DB9PR08MB6857.eurprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4146CE20899D7B4495998E923DBEFF9C.0
x-checkrecipientchecked: true
Authentication-Results-Original: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 6a1de324-22a4-4d5e-5b2e-08d945ad119b
x-ms-traffictypediagnostic: DB9PR08MB6844:|AS8PR08MB6056:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6056B0821AD579C645791AE39E149@AS8PR08MB6056.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:3044;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kbIEFBRHm/Ry9NuukKguthuObQrhpTGYizfCWQEYDCtnD3Y4zD2rF04FlNyJmNAV7NsF3U1X0RQa9MW2OWj3/eJMCbGM6UYSgLQCl2NZKhQ4BcYZeqZFkuOt5R7MX4CUiHXgdTH7zX7rEflZk7B9XL+9m7r6tmeXiDaJTuV4EgKQQTZrQE7mZ3qwIE6PZzPyHFm8dqtLtqDx6pqluyamLk7Zn9xEeHwvMR8tfsqfJXnj64J5BteO9ujB68ofidUbI0d4XkViqLTi8QG71UKMqY4H5MoOHbTT643WkJl9RQId7N8AMQgKu9zEFwoLpx1sU6m6J2fj/mrJYC0Gnvevm9hfhm5tPkQr1Lm63z2TVTjJiX94/LZenkfZrV9CThGfO/s4YBXgKOtesUgswjBn1McApEhPBFTzjdBcXV3TEIwMH7dBr8njE0qJ7OW1hIUlYZIaBBl6TnUPESmVn3VJB2emvukyRWI3JbF/P/VoR9UDdA3ss0mysb24awbsVgYKOXQS53YeLhuembz3dfv9dH8zaI2Ttg/YFGw3VD3mRCl7W2xbfUeeWQRhNo/04583g3YM/yMmmA+NQfYH9NhyUSKrxPUa2cPUSPglufb1GNVIqzN3GRBGyhEucC8mC2f8Pubos/TLhQEX06POFkCma3FcAxSgw9Qm1KN7ZGQKQDJRKk6BrlSWtSYcbLU5Tg3AU7q5nPgBS18dLSmirKj4VUAVCilEY/YLXUAieezYI005i/ncdpz1EjStW3GAMnhFvcZHZGC+sbAPFq6jEnrP4A==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB6857.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(376002)(136003)(396003)(966005)(186003)(26005)(2906002)(38100700002)(33656002)(71200400001)(55016002)(52536014)(9686003)(478600001)(8676002)(5660300002)(64756008)(66556008)(66446008)(76116006)(66946007)(66476007)(83380400001)(6506007)(7696005)(110136005)(316002)(4326008)(122000001)(54906003)(8936002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6tLfSP7e2aaFy+f0njWwmFUPfjn35XuG8iQJX6ohcmy3tXtQ3sMn/w/JEld8?=
 =?us-ascii?Q?PLX0bTwzdEjRAlwXt3HpmCPRBsEAnS/O+lSTukcDMxqneKGU7Y2rUd0SHAxD?=
 =?us-ascii?Q?ZiQ5eBTKNz0jHe0ANID8zFyKB0lKjdP9dJ0XOg7ShYGePlMP7S3bodQnMcK5?=
 =?us-ascii?Q?1ZH3tyE0mEP3kLhcqdUt8B+KzDdwqAJFd1AFN3RSji5Kb87Bt9eG3QDJPs6L?=
 =?us-ascii?Q?YfmynHYcS2Q58H8PORumS4zXV7D7vYsvBnYAyh8fcz6zcNrCs3+8maoJ8BDq?=
 =?us-ascii?Q?z4JsiSQ1kfb9rsR912P4UFiHjs5ia/cXKYl/6KWfS7efPRJQzOr36wxK4fyq?=
 =?us-ascii?Q?zGkOZP6MAnGXfuJlAdN5/Os5bM1RbYpwQF5pn5lU6nnKWCb2wMNgztjNCEyY?=
 =?us-ascii?Q?aHJ0VuSt0lZ8u/eW5HNOGVKPl14br74srBtzMcm99oejjnCoqUuaqDM7BwYS?=
 =?us-ascii?Q?DiyyAADaReceFScJlT6ikY5EXKLnM4hsrpoGhVPyfCVeG1VhCQA4SIz+qSsk?=
 =?us-ascii?Q?bbo+bQ9SP5UIMcSxUsfwtvpTXx0dB5Udhgbe+oacrVjIWEgh4SPgb+BmAZZ2?=
 =?us-ascii?Q?vYQVv7SMAg1u2nvov7zhdTwYTUG5X38bUqwUc7NTFmGnX164PgYVt7walR38?=
 =?us-ascii?Q?f3n8REe9VvYkAbkykgCl1p2EAlNZLsNEL+186SPpmOLIifx69TTiLYiqLZFE?=
 =?us-ascii?Q?+DThDHeo4Ri4vtapQ0YAMIu+kXHjwPgiH1/nOU6CP1c6D1V6AuPB5b7aVr6i?=
 =?us-ascii?Q?hDzoF1lXpfU4rPU3P79zcvxqSYgFfrFLmQ3LxFJZ7XZAFCpc31JpUk6T16+5?=
 =?us-ascii?Q?USx9YFNNlLUTC1lixO7PS3Zg7XQlgm3bMatDjGAFSZAgyBRZj8xEcCVEkckw?=
 =?us-ascii?Q?BY1B5WvaHOXLoJ+f/61/NIJSWaU4sdn48TRGTG8k3efr61kim3AcVrLyZuCa?=
 =?us-ascii?Q?O1JfsdZTRcGPYmI8oABAIAnhcjuVKtjK/pznUIDFHQVqFImJFGk45fmp2n1M?=
 =?us-ascii?Q?+ZLVnSMoKA+Ti9mG4d3Yi2SfVlpB4Mph0miJ54/Ql1tHwca71VQP1kBZdmA0?=
 =?us-ascii?Q?eLUZ1yvcflck6qkfr46zV/G0HIhxeQZfGIb1W0pHzMDZyBM0eK43ufPzUjWi?=
 =?us-ascii?Q?jYlbJ3iuJL7BIbdAs54yqCfxyUi/4D05aTO2ZPHeXUUOYVB5WxWZ60m4MLVp?=
 =?us-ascii?Q?51svlX3yOJb6McA/Ielo/pvq4k4I6tLJaB8ugX0WIN+jUNkpu6JZybxt3UHS?=
 =?us-ascii?Q?AJF8l60sxg58EFmrwjR4ZUtowmL0MYGjM2wqTUJg2NthTTcTQGRUkyv4ZNz3?=
 =?us-ascii?Q?3Qc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6844
Original-Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	eac58736-9881-4b72-2c5b-08d945ad0c4c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YkL3w+ZKIyr4sgYYAcNOFk6zYIqcZiTs2M0lFdIAZf7kO7KFhLutenMc6k3RyGVx+DeAe85Ulb4LRZ/vnB9DIPt9uXvN701CaILupctP0bMu9fJrokPL/wIHW8RtIX5nDRM/4w1eC0im0pVu+FdtDMmiHxL1Ovo7Le8UEcAxtrVSgFKFZIjsROvGNUy5q+8FrZIeR1wSfg41Xow9yKE0i3Cz5nPeLrvk9QuWTZILfdLUDxd+jfAN+Y11Dhp660m60cL3QXFLV3I3QvMzuHAFxii+YFOLB4RhdjQPD9a2oi7Y23z9yhnP6DlpK+j/FHKaYDqLyd28TpzlOExhIG+Umvm6Hcz44H9uuelE21FCPlHy7AakIpveS78xOmMoL77H73T1gbNHql+neAh49k1jzJtqfgMoDt/7FM9k165Ft/z1DXI1QDWRYj97VdXeTwexM60YiKSJO9ZLLsqvmNSLJoZPTybJPWmo6NP/imwFsmmeB0ssfDRJqCmpCmCUjeNEghJtmgo5Gn8D0gokGllExLU/L4md6W6cqgUE4YLdvL1U4jDDXGIjQn4Gw1ZU5yXeykA4rww2nHi59Oo0+sObkpo9U0/X5/+1iuMTB9LEMqbW+8dmbgJSbgfmkNYsQx6zSPcmBKen2xW5tHSN0WSbsxvhbzYdahiCsr1wdy5mMcRGu8THz/R87a9eGLc0rUgrnsxaFrLUUrmRjZGEy5pyMK7VU2p+gKMCF6GwAOy6pBcWCFcxZyCaGqBndrPJeavscYQ8s8vGZoh7JUUN4+O9vuZ7Bn9Zzj/w7VgZWx7oc6Ep8o+JVGr+nHU8d/kt/wW1a5X5wzQhH6OYrqRZpeK4gw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(46966006)(36840700001)(2906002)(47076005)(8936002)(110136005)(356005)(81166007)(316002)(336012)(8676002)(9686003)(186003)(6506007)(55016002)(70206006)(70586007)(26005)(7696005)(478600001)(5660300002)(36860700001)(82310400003)(4326008)(54906003)(52536014)(33656002)(86362001)(83380400001)(966005)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 03:19:47.6148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a1de324-22a4-4d5e-5b2e-08d945ad119b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056

Hi,

I am doing some NUMA testing on Xen. And I find the DMA restriction is
based on NUMA node number [1].
    if ( !dma_bitsize && (num_online_nodes() > 1) )
        dma_bitsize =3D arch_get_dma_bitsize();

On Arm64, we will set dma_bitsize [2] to 0, that means we don't need to
reserve DMA memory. But when num_online_nodes > 1, the dma_bitsize
will override to 32. This may be caused by the Arm64 version
arch_get_dma_bitsize, it may be a simple implementation and not NUMA
aware.

But I still quite curious about why DMA restriction depends on NUMA
node number. In Arm64, dma_bitsize does not change when the NUMA node
changes. So we didn't expect arch_get_dma_bitsize to be called here.

I copied Keir's commit message from 2008. It seems this code was considered
only for x86, when he was working on it. But I'm not an x86 expert, so I
hope Xen x86 folks can give some help. Understanding this will help us to
do some adaptations to Arm in subsequent modifications : )

commit accacb43cb7f16e9d1d8c0e58ea72c9d0c32cec2
Author: Keir Fraser <keir.fraser@citrix.com>
Date:   Mon Jul 28 16:40:30 2008 +0100

    Simplify 'dma heap' logic.

    1. Only useful for NUMA systems, so turn it off on non-NUMA systems by
       default.
    2. On NUMA systems, by default relate the DMA heap size to NUMA node 0
       memory size (so that not all of node 0's memory ends up being 'DMA
       heap').
    3. Remove the 'dma emergency pool'. It's less useful now that running
       out of low memory isn;t as fatal as it used to be (e.g., when we
       needed to be able to allocate low-memory PAE page directories).

[1] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/common/pag=
e_alloc.c;h=3D958ba0cd9256c8270e38585d272be2bf5cc0679e;hb=3Drefs/heads/mast=
er#l1876
[2] https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dblob;f=3Dxen/common/pag=
e_alloc.c;h=3D958ba0cd9256c8270e38585d272be2bf5cc0679e;hb=3Drefs/heads/mast=
er#l226


--
Cheers,
Wei Chen

IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.

