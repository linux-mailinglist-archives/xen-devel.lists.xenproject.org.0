Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5173303B26
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 12:08:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.74844.134596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCt-0001J4-EN; Tue, 26 Jan 2021 11:08:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 74844.134596; Tue, 26 Jan 2021 11:08:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4MCt-0001I6-3o; Tue, 26 Jan 2021 11:08:23 +0000
Received: by outflank-mailman (input) for mailman id 74844;
 Tue, 26 Jan 2021 11:08:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=55K9=G5=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1l4MCr-00016Q-B5
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 11:08:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13d82b33-11e6-4186-bd08-f1a56581767b;
 Tue, 26 Jan 2021 11:08:14 +0000 (UTC)
Received: from AM6P193CA0128.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::33)
 by HE1PR0801MB1867.eurprd08.prod.outlook.com (2603:10a6:3:53::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 11:08:11 +0000
Received: from AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::ce) by AM6P193CA0128.outlook.office365.com
 (2603:10a6:209:85::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.14 via Frontend
 Transport; Tue, 26 Jan 2021 11:08:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT031.mail.protection.outlook.com (10.152.16.111) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Tue, 26 Jan 2021 11:08:11 +0000
Received: ("Tessian outbound 4d8113405d55:v71");
 Tue, 26 Jan 2021 11:08:10 +0000
Received: from 5d85ceec7953.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C345401A-AC77-459C-9DE3-C5D5C41634E5.1; 
 Tue, 26 Jan 2021 11:08:04 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5d85ceec7953.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 26 Jan 2021 11:08:04 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com (2603:10a6:800:1ae::15)
 by VI1PR08MB4157.eurprd08.prod.outlook.com (2603:10a6:803:e8::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 11:08:03 +0000
Received: from VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6]) by VE1PR08MB5696.eurprd08.prod.outlook.com
 ([fe80::c8bf:1301:3373:94a6%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 11:08:02 +0000
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
X-Inumbo-ID: 13d82b33-11e6-4186-bd08-f1a56581767b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS9BZO/AWk6T2fGjCyXTAi/DZ1AnAwsykCqBwMNESVc=;
 b=RiK5m1OLzr/UoDDqZt8/OdFYzO2W/idLcoxy/CJKIKRxbJBINxH76RVUUOn1Cxdm9QCKjZD4BEttkd4KvCsESC5/ZVFXyBhlxZW2UtwE390TUXBh0q8Hb/FALM1Sfbga0B1Szyg/q27r8GSGmGcVhe2MahYPRd8Fe64vAKk/m5A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5949b070d59e3d0e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XKVwfdBXrl1yVTN0J70eNoM8EpvYZRne3v7zMvyvX5ByZZuaaZduAO7xrIB3lOC8Tbsa5tqyjeks/iIlfuAOqRZwRJb26xJqD/Y8Mw2scFGwQwp00ylkhu/P7UUcSoBhd5LVi5BcKoC3K8dFiC9zCZDvFZ7scEox3OsKL5e6xCYjEuMIECrmy3edI5YJZ7HVGZ4pj7Xv95Zwrn6YK1b2huoaX3aSMoGPrNvgA9o3JVwh2VNZKdxsNjoAVDoFYTHgdLul6kzVWoYQLYX0bkLW0+yrR2A+bCKo5xHCxsTCmhaV3KObUtfN/WeteKb0JhS1ULQtsXhU2O82C/LnYtsAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS9BZO/AWk6T2fGjCyXTAi/DZ1AnAwsykCqBwMNESVc=;
 b=kO+B8yqzv7i4Ym5u1N/CBucK6VKaBFhy9WczqFZ0KVnE7Bbh2lYLHvtkTAHhOwByj6+PuI1Tr8JOm4TeFb5CWKjNRzalavFYbNWSSu0m8272CJ/V3oEijGfcCSpr/+9OkjvsW8IFU6+9RrG9eeuPU9i0VD0IWWI2iG57ND67OCqWCCxNnSEuKjyM5vd/hHE54ayr9KOG3B7+zQnO5q06SAN0B/FnfsSJwusMoqfFzsx/HTks6zHiVHW0W4jQ882nlcnHNuxyCRdwbddMXwXe7DHNq8xZKGy9vVf2byiB8XHXIS8rHUHQMgctpiNXh8CfNA/SHUz8JmAiXBEry210Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AS9BZO/AWk6T2fGjCyXTAi/DZ1AnAwsykCqBwMNESVc=;
 b=RiK5m1OLzr/UoDDqZt8/OdFYzO2W/idLcoxy/CJKIKRxbJBINxH76RVUUOn1Cxdm9QCKjZD4BEttkd4KvCsESC5/ZVFXyBhlxZW2UtwE390TUXBh0q8Hb/FALM1Sfbga0B1Szyg/q27r8GSGmGcVhe2MahYPRd8Fe64vAKk/m5A=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "george.dunlap@citrix.com"
	<george.dunlap@citrix.com>, "iwj@xenproject.org" <iwj@xenproject.org>,
	"jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org" <julien@xen.org>,
	"wl@xen.org" <wl@xen.org>
Subject: Re: [PATCH v4 2/2] xen: add (EXPERT) to one-line descriptions when
 appropriate
Thread-Topic: [PATCH v4 2/2] xen: add (EXPERT) to one-line descriptions when
 appropriate
Thread-Index: AQHW82EXNHb66SNMekqQqd9sHf0/nKo5wEQA
Date: Tue, 26 Jan 2021 11:08:02 +0000
Message-ID: <984D4402-B9E8-4BA5-8866-A9D87BEB7251@arm.com>
References: <alpine.DEB.2.21.2101251321420.20638@sstabellini-ThinkPad-T480s>
 <20210125212747.26676-2-sstabellini@kernel.org>
In-Reply-To: <20210125212747.26676-2-sstabellini@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [86.26.33.241]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0136b1f2-267a-463d-1d05-08d8c1eaab48
x-ms-traffictypediagnostic: VI1PR08MB4157:|HE1PR0801MB1867:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB186719B3C437632F33F9350A9DBC0@HE1PR0801MB1867.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CaDVyzllOFshpmBM09zqoEH8vGJlnlmnPckIL3C2s5AAUX0sD9/E/WpQXZMvt6kf23FIxVzuLGs49rAzNoG5VxeAWBpE7ycI5vEl8eaAcTj0eXAb4v0wZEP7VnrT6fJoVueM1UDyrEYgNJ6Wd+OzkspK6IIjEJ1BxLynpa7uSPr6/UrfC2nJtXNgHa1qb8QOxriRRKYgTuwH99hZdXi4eKD8xFWFMq7KA772SMue9DSYQA/BeMGPwqET7cFnxGLPjPZSN8JbxWFH3YVNlAn5ERXM4Epx/sDcU5m20lST279mWnLBopqskVTXM5+7G3cN5NloAISyPY1piAKHa1Dt4AAttdyDot1lC1sZqRRAwPDVUmWvbc7SMSTlDUT6kXgyI9cXEBTVjpMHZGdD7p9d4G9iKzlrPmctebW5mad2rCAZrdx6fE31V0KEhwFHdVHj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR08MB5696.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(83380400001)(53546011)(66476007)(6506007)(4326008)(66946007)(55236004)(76116006)(86362001)(66556008)(316002)(91956017)(5660300002)(8676002)(186003)(26005)(64756008)(2906002)(8936002)(6486002)(54906003)(71200400001)(6916009)(2616005)(36756003)(33656002)(66446008)(6512007)(478600001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 =?us-ascii?Q?SydAT7DwM5dWoyJNfIgMJYXMkC5jHm3jCY9C2Kvz03da8/ZhKEbKJAKOFoT2?=
 =?us-ascii?Q?oUEQR7ibp+uSILC36ORLtM7d9i3LhIhFdGV9h/1RZCfZRz6XW0YdgzJs+IsJ?=
 =?us-ascii?Q?3TSObWqsHx1NomcjL7eUSdqQUi8DysZQsaZsW/p9dQV0CMXHsNYpXuqqv5Fi?=
 =?us-ascii?Q?nXLelBJx5igLbG7ZzikQC9dOLSFHqvQAJ4iIi7AnbKe6WZIaefGPN4KC+LNL?=
 =?us-ascii?Q?58DPAQFAaMiJyEvSvUFxzI7F9ayGQjRnbmLMv10GwmHfe90whFLdyfvHidky?=
 =?us-ascii?Q?DTbiwxGJszMox2gILwAJnvuyIR++Q8NujX5oZYibyhAO43U1E/13bMHIHWg8?=
 =?us-ascii?Q?SvAnV0n91Gueq3Qe6KStBYQ+lMOPbqegX1YVgKUMNcWBjtd4tuIxNv7dmktB?=
 =?us-ascii?Q?j1rbQqh+McWKlfalfXQvqmLEhX1wZA3TgT00CjZvaffnz6T41ZM3TO0Kkij8?=
 =?us-ascii?Q?bbTHs3SX6iwZazLY5VZYUQG++cLdTtsY8g6Dk4BUyS0kJQ5/+VavM4eKxreO?=
 =?us-ascii?Q?mN6fOiey6jEiOyOGJto1RA7x+1csJY+Jl2v2EcEGVVywogmVWNxHT1fKk4RY?=
 =?us-ascii?Q?30ZE35g5PEp5Y1ad3DibZXHULZzhvJnnCLk8xv4yrTkLiyY6ecVXQkESTopq?=
 =?us-ascii?Q?SV5tRjMXaVB0+eUU3jRdwS45HW+dxooZgXm8zKzSjdJCRsBw/oK/FjLMADuE?=
 =?us-ascii?Q?YhZNcJfhmFu45vO4EqoAGwZvtW4Hx8se1BwpSqnKRrhq3vPLnLQETrQnDupP?=
 =?us-ascii?Q?t8+kHOTDeFEsKzM4gAzabA2tg1iD7488/3fbsPSq5RPccZgsqM1/nv7EjXDW?=
 =?us-ascii?Q?AYwY8uyTyxio7o8hx5ZlGjg7vZiUAfAg1i0viqJIjv/Q7s5T03xBJIOYyGR5?=
 =?us-ascii?Q?m01c64HjebLsC7gpeCNKhGdiuTtBoZIF1GPZPaA1ey8aCKPr+VCvz5djYr1H?=
 =?us-ascii?Q?Q0uvROdpYBn/bipbGz+tgNy2agQTH24tOPZVyM0jh22LO1t9EuBy6lHyHIVw?=
 =?us-ascii?Q?1JIwH/5peJd82gwR+HY64UKXiXu7lir7PhYkxjdndcAAN7TuQXfwAPEfbQa+?=
 =?us-ascii?Q?/GHU1Z8W?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F16F6966E209A248BAEC2F016C77A21C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4157
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	694f3efa-56ef-4e44-ec26-08d8c1eaa650
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E3hJWlG/LfOAvuuvVp5Cad9YWMKH/zpydR9TixWVG2Kvz5/yT7RSU8lR17iy/YqUa9H6p0RbAL2Y67+ioPsKNq1oYOQ+3ZhRkFoQc+LPH1fUhS8ts4nTO/Jbe1oreSZCTl1XFMU/bcEkYKX+AcEPuibmXLBVLShvEm5fQAWvY9NEHZH059rVS7QZ4XfGPuyMRFB3dHx1Q/UNlI6KINm3CqxLeHKF9MYtQsHwqbANkFojITe3vvp/iyy5djpBERO+qSMzo7z5BiLJlLAdCGOqHMJR2BnlxCStfWyYMaUadfuWWf0brBGBRFth4exWTQ4tPsyVmHeZoLJ6t3HPC0Uuh+e7gBkb72aWe2vqyotAKFD0eWD8ZCYatmzJ0SBJQ9qgMCbu6GyEyHIJhnVCKK8ng9P7aD+9T2TrkCNxFkpB6V1lJgFLRCNmSIIayHGqMK1DjOdpKaVgWcKQAyfedHX80Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(46966006)(53546011)(83380400001)(4326008)(8676002)(5660300002)(26005)(186003)(2906002)(82740400003)(2616005)(33656002)(54906003)(6486002)(6862004)(55236004)(336012)(6506007)(47076005)(70586007)(81166007)(478600001)(36756003)(6512007)(356005)(8936002)(82310400003)(86362001)(70206006)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 11:08:11.2449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0136b1f2-267a-463d-1d05-08d8c1eaab48
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1867

Hi,

> On 25 Jan 2021, at 21:27, Stefano Stabellini <sstabellini@kernel.org> wro=
te:
>=20
> Add an "(EXPERT)" tag to the one-line description of Kconfig options
> that depend on EXPERT.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: andrew.cooper3@citrix.com
> CC: george.dunlap@citrix.com
> CC: iwj@xenproject.org
> CC: jbeulich@suse.com
> CC: julien@xen.org
> CC: wl@xen.org

Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
> Changes in v4:
> - new patch
> ---
> xen/arch/x86/Kconfig     |  2 +-
> xen/common/Kconfig       | 12 ++++++------
> xen/common/sched/Kconfig |  2 +-
> 3 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 302334d3e4..3f630b89e8 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -103,7 +103,7 @@ config HVM
> 	  If unsure, say Y.
>=20
> config XEN_SHSTK
> -	bool "Supervisor Shadow Stacks"
> +	bool "Supervisor Shadow Stacks (EXPERT)"
> 	depends on HAS_AS_CET_SS && EXPERT
> 	default y
> 	---help---
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 39451e8350..b49127463d 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -12,7 +12,7 @@ config CORE_PARKING
> 	bool
>=20
> config GRANT_TABLE
> -	bool "Grant table support" if EXPERT
> +	bool "Grant table support (EXPERT)" if EXPERT
> 	default y
> 	---help---
> 	  Grant table provides a generic mechanism to memory sharing
> @@ -151,7 +151,7 @@ config KEXEC
> 	  If unsure, say Y.
>=20
> config EFI_SET_VIRTUAL_ADDRESS_MAP
> -    bool "EFI: call SetVirtualAddressMap()" if EXPERT
> +    bool "EFI: call SetVirtualAddressMap() (EXPERT)" if EXPERT
>     ---help---
>       Call EFI SetVirtualAddressMap() runtime service to setup memory map=
 for
>       further runtime services. According to UEFI spec, it isn't strictly
> @@ -162,7 +162,7 @@ config EFI_SET_VIRTUAL_ADDRESS_MAP
>=20
> config XENOPROF
> 	def_bool y
> -	prompt "Xen Oprofile Support" if EXPERT
> +	prompt "Xen Oprofile Support (EXPERT)" if EXPERT
> 	depends on X86
> 	---help---
> 	  Xen OProfile (Xenoprof) is a system-wide profiler for Xen virtual
> @@ -199,7 +199,7 @@ config XSM_FLASK
>=20
> config XSM_FLASK_AVC_STATS
> 	def_bool y
> -	prompt "Maintain statistics on the FLASK access vector cache" if EXPERT
> +	prompt "Maintain statistics on the FLASK access vector cache (EXPERT)" =
if EXPERT
> 	depends on XSM_FLASK
> 	---help---
> 	  Maintain counters on the access vector cache that can be viewed using
> @@ -344,7 +344,7 @@ config SUPPRESS_DUPLICATE_SYMBOL_WARNINGS
> 	  build becoming overly verbose.
>=20
> config CMDLINE
> -	string "Built-in hypervisor command string" if EXPERT
> +	string "Built-in hypervisor command string (EXPERT)" if EXPERT
> 	default ""
> 	---help---
> 	  Enter arguments here that should be compiled into the hypervisor
> @@ -377,7 +377,7 @@ config DOM0_MEM
> 	  Leave empty if you are not sure what to specify.
>=20
> config TRACEBUFFER
> -	bool "Enable tracing infrastructure" if EXPERT
> +	bool "Enable tracing infrastructure (EXPERT)" if EXPERT
> 	default y
> 	---help---
> 	  Enable tracing infrastructure and pre-defined tracepoints within Xen.
> diff --git a/xen/common/sched/Kconfig b/xen/common/sched/Kconfig
> index 94c9e20139..b6020a83c6 100644
> --- a/xen/common/sched/Kconfig
> +++ b/xen/common/sched/Kconfig
> @@ -1,4 +1,4 @@
> -menu "Schedulers"
> +menu "Schedulers (EXPERT)"
> 	visible if EXPERT
>=20
> config SCHED_CREDIT
> --=20
> 2.17.1
>=20
>=20


