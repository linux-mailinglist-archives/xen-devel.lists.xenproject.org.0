Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196775596B0
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:31:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355378.583007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fen-000205-Ef; Fri, 24 Jun 2022 09:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355378.583007; Fri, 24 Jun 2022 09:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fen-0001x7-B2; Fri, 24 Jun 2022 09:31:17 +0000
Received: by outflank-mailman (input) for mailman id 355378;
 Fri, 24 Jun 2022 09:31:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b5tQ=W7=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1o4fel-0001x1-Gk
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:31:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63e66cbb-f3a0-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 11:31:14 +0200 (CEST)
Received: from DB8PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:10:100::38)
 by AM6PR08MB4343.eurprd08.prod.outlook.com (2603:10a6:20b:ba::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Fri, 24 Jun
 2022 09:31:11 +0000
Received: from DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:100:cafe::f7) by DB8PR06CA0025.outlook.office365.com
 (2603:10a6:10:100::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Fri, 24 Jun 2022 09:31:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT033.mail.protection.outlook.com (100.127.142.251) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15 via Frontend Transport; Fri, 24 Jun 2022 09:31:11 +0000
Received: ("Tessian outbound d3318d0cda7b:v120");
 Fri, 24 Jun 2022 09:31:10 +0000
Received: from b6bcc0d5e2ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5C0825DB-A121-4970-A3EA-F080F059132C.1; 
 Fri, 24 Jun 2022 09:31:04 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b6bcc0d5e2ea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 24 Jun 2022 09:31:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB7076.eurprd08.prod.outlook.com (2603:10a6:102:202::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 24 Jun
 2022 09:31:02 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::d9f0:12ef:bfa3:3adb%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 09:31:02 +0000
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
X-Inumbo-ID: 63e66cbb-f3a0-11ec-b725-ed86ccbb4733
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bRBVwSmkSsMfKGqyEu+zzgVgOASaoceZihy1zSb4AcvApCduhXE7191ZO3seHRV9lsaiE4r13Nf8emaKxcxEtgmwkN3K9tdvDKYZCd9twg//vA8/DnF5EG+7MsXMAAGi9Ik3QPF+kPk2R2ZMXsfRX8d/9srrdGwzGII90kDOfSYbG6Jm6NSBJngkaLH0c00u5nSoIlihPC5lpkdBVFPWM0cH8xiW2KpwF5iherouTZPDyUAuxNtmnKGEe/IFr6gWAhrpznJnoS9b7DrKG5fXeeWsytZvKwg8oVOHXBn/n2CPIEVCoyS2ttRbX6XPA5I9P0qoMpALz3aIcLmEbcfVAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kylPXZQgI4kO5a5rykSr2a7fzrXNdksnfQQm5rnP+4=;
 b=Uxo1m0ytMf2S9Jfm2F85TH+nVEhuYjeJxpQlSJy8YZRwFxWFyA15/1bnCA7Hj6IumBpYBVoYcLQIy/1/y4xJhQwTbpFKlgJS62PUosJA7s9OxWrmdYPgVdVOUspNKBR+zHUXvs0kT4qxuWFy8QI9ZdJOnrfxSoc+cAd5PL3De9TOIW4Xf6qd97Wsf1jEwkEQ1bG4usZI+g8N2oFWqjjOp47OTQ45az0CcWsdp2Ob8Wzaff8u+rI4nsSLnePCJL3Zv0m1GN/xI8OtwUIz83UR/sdXojFFRWMLJHz16n8jieCCtx/JcnpPW2d7exbyw4ZzaVdoCwABh3/0eXqo5GcG8g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kylPXZQgI4kO5a5rykSr2a7fzrXNdksnfQQm5rnP+4=;
 b=T+tRvSEXrYGtasqeCi/JHrrJtDiTNFRO1VuXorUYhkFYBm89mtcWg3YZmsE8g5NC8nA31OJvyMXEuQwypt7GhRFVNQpLfRs+GMfLWq7wBjDnVoVDi0Vie0Kxhy8+OijCcSowDK3YjgLbsK5PzQYeTuhNb1asFiwUQ75W5GjgOdA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: fce0faabb4051509
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XrRXBcIYnq7fPVl8SyGaUiP/ycQuMR/mrEZHM8D2tzTQF8vx1DDyetn/4UJd/ebtdpgMviOsiZI7ZybHYrJmPKM0M875UJtGRu0ZakYTUT0bxaiwOLS7cftgWIdKF0PcDcKMqbUsxJjuJHjyTtJc7ywtg89xKO8fa24DqjBie4SMYb4ueqdcGToMDdZwMQh3fieH37rGVymU90bnjN+RGIUIpEXhv6t7gcnaGDHFSu8H8MXb3hqrBig7IIFqyTnLc5+FVt8KxbR913c5kq+Y2SXsMnCwSmi/6gbbAVVfJbLHKhguusKptJDxvKe0nab/+IcpIwlQf9Mo86xVXZvEjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kylPXZQgI4kO5a5rykSr2a7fzrXNdksnfQQm5rnP+4=;
 b=jJ8CHj0CITHZLPsl5YNdBekqLtpMVm1Ui3wxTBP/2yTusyD2TyBzsBJa3FAxHyjhp0erIQAel8gzTc6I76liyq5AKZ9aQq7PpWS1ju41ujyLwVGRDDeuCS7p+PpcK71KUz168HBf1FhSsLB4VB19r1lGSCKY8YnlFVq4AoImXWF5rVl2ObwK1hENJRN/IGrbG96PMjeghP2OJ80qL2vePbuVCsZ7wHg8kV4Sane9+VWK2cyWWZi9ijTUKOX+1WeHiBxNxokQYWDdwwEN4eEwOy8352LLO8NILxrZvnJs9Courb0NmJ0g+4pTE2l+x1qQdrIq1Qs0xj42LK48Wmrc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6kylPXZQgI4kO5a5rykSr2a7fzrXNdksnfQQm5rnP+4=;
 b=T+tRvSEXrYGtasqeCi/JHrrJtDiTNFRO1VuXorUYhkFYBm89mtcWg3YZmsE8g5NC8nA31OJvyMXEuQwypt7GhRFVNQpLfRs+GMfLWq7wBjDnVoVDi0Vie0Kxhy8+OijCcSowDK3YjgLbsK5PzQYeTuhNb1asFiwUQ75W5GjgOdA=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while preparing
 the CPU
Thread-Topic: [PATCH] xen/arm: irq: Initialize the per-CPU IRQs while
 preparing the CPU
Thread-Index: AQHYf9MHjBymRs/pn0u9upJvLeFm3q1eWpcA
Date: Fri, 24 Jun 2022 09:31:02 +0000
Message-ID: <29AAB4EF-6326-41F2-BB51-EED5FFDB26EA@arm.com>
References: <20220614094157.95631-1-julien@xen.org>
In-Reply-To: <20220614094157.95631-1-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 7e567109-d824-41dc-2ece-08da55c44672
x-ms-traffictypediagnostic:
	PAXPR08MB7076:EE_|DBAEUR03FT033:EE_|AM6PR08MB4343:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IqIenAcXztI5zHSo+vxd1fah9qUE1H9D5mn7NbImHL6uCptGH/NHr3/IvT+SAVGGg/1MbAlywpDyj5kGEIJXZnNoDL/1dS+9lS1+62gKCD9zYtaoAZpFxvofuqt+Tx+lPK136Bw0wpngyw6qeSSvYQHjgopSp3d+m0Uau+A4aGjHwxq3jbqn2T2C+l8mJBWs6kvO1vflPO8kTDO/1iXbndyZkxlhXmSacL2lpywAt6XbyRZTRfLFJRAdbVApZcIkTP5L/kAqDhZHIz+49lsR+ZIGstBMAYqnpGht+1iGDnk512vSQ3imc2ZvtIS50+iyUaSFmFyO+wjg26/U1yqxhbgwonu1+ldTbFCJmDjR3XRoda6N4yQRkMCmILd7nyvOecMZkzS0jasmNjxtmsHeSyvcBC4tibx5zmQH7g43e0gDIDGVtUiLSxpFoecgYLzEo/exZQx+9YlgDOgSO7CaPTkrE439W6W7rm251vJQ6MebTkjb2b/p5RsTwSUDTzVHdXeTc0rxD9RTFB+tDI/VCakebiCUXlL1pImkFH5KZ3owwfBBHzOLVvZaRwN6r1Y3O9vAseF89QC4cjnqIw+8slszGQJc5BQ4uhDmHjUjv6PRU8xCXZcJPnTjwnFYY0QDedSf6KdXIFZJHxSrt5ECeFOouUP5+0oI28OWvV1INcD0/RkKcXowLMRWzR+MNg3xsLg0pfb6FsRdGtUkwQT6p5HXAzjTHsGndegypqOkcz08JkWPD2QhDAlSpdRdIJHSXKrhxdtwp+/x7PXSX7wYgY+eWAp6Sir4T8tcZmqRvSOKbE4GKmQoBb+raLozVI0dtz0eCxMzc+MmgUpfnVQ1Jg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(122000001)(6916009)(478600001)(66946007)(54906003)(38070700005)(316002)(83380400001)(36756003)(71200400001)(64756008)(6486002)(38100700002)(2906002)(6506007)(91956017)(66446008)(41300700001)(53546011)(4326008)(26005)(66476007)(33656002)(5660300002)(66556008)(2616005)(76116006)(186003)(86362001)(8936002)(6512007)(8676002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1D307CDC5C53C48BEEEFC2B3FAEB989@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7076
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a313b99c-1e2b-4e02-4ef8-08da55c44171
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YGrQRtrd/GSifW/y/3LT3X29P+a77JNQfQErntC4QQ4TOYA6edCWCCkLJS3GfB7Vx+bOGnAcHsoNJi68BM7AJX5qwzwBHm+3t5YMA5GWEP0IgINy8AoMB1kC5Qhl33nyYDK0nFc2S7QEE6WGeYxzNu8KenPCdIzUYibNEyt5W7w+xWH1oPBpl/YG1O/qq61mtZbU0ZHjhkyoDUvtQUFv+ZAHRqDY7+XhOLZ5dTjYgpzFllwLBHq5QPx2AS9HyzUdylpkSraQgf2FMnpOgjqyzb4OItYLXnJKf+ThJZ1mbjvhT3JfQ2+qsG4sexHuCspg+z2ls0bEajVqUUu97hO9cOe5C8IZhPLD1xHdzu29kHLONWeSFRZlaHXbfV9JvxM7OkJX0tkhHZsSwOJ5KLHbahh3lURrind8JoaykjgKxN/a3LjFvoHYlFU9AJPnsyPTs6eO6q/UwwAWkJxOHbqElASPiFkOfez8rjjHGuSLzUoICTlhF1+LGhwcTmMu7nliH5etH5eby0OmWSahERl2h8T1wQYLo6SZ7Bu0+ex1ZTbyCsqI31f2ul6BIMMkhpcL6VFe8Oc29Q45POI6tajV1wteMuZ/Asb2ZB4tKnNKVExPj7RXvwzgLN36Lg6PFmr+hPWKFgpT/RyxHkbwCAXevfoGYzkRb1TLOi/OxHSUhdhlt8izra3b6sJxUyUrWqxdQgi8iSPSIm7RvxkkBYlcqhUJsx6Ff+B0QnWfnoPQYkMfACnSS23Mm3PNwX2Yan8fD9Ke8tP+1eXDPNVwWQZi4dIXS1jF/cQARLm5d88jJJzcdwk+NiHYHvmg9npzFteK
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(136003)(39860400002)(36840700001)(46966006)(40470700004)(36860700001)(41300700001)(40460700003)(8676002)(8936002)(6862004)(53546011)(54906003)(86362001)(107886003)(5660300002)(40480700001)(478600001)(6486002)(36756003)(70206006)(82740400003)(6512007)(316002)(70586007)(82310400005)(4326008)(33656002)(2616005)(26005)(336012)(83380400001)(356005)(2906002)(6506007)(47076005)(81166007)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2022 09:31:11.0185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e567109-d824-41dc-2ece-08da55c44672
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DBAEUR03FT033.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4343

Hi Julien,

[OFFLIST]

> On 14 Jun 2022, at 10:41, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 5047cd1d5dea "xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in
> xmalloc()" extended the checks in _xmalloc() to catch any use of the
> helpers from context with interrupts disabled.
>=20
> Unfortunately, the rule is not followed when initializing the per-CPU
> IRQs:
>=20
> (XEN) Xen call trace:
> (XEN)    [<002389f4>] _xmalloc+0xfc/0x314 (PC)
> (XEN)    [<00000000>] 00000000 (LR)
> (XEN)    [<0021a7c4>] init_one_irq_desc+0x48/0xd0
> (XEN)    [<002807a8>] irq.c#init_local_irq_data+0x48/0xa4
> (XEN)    [<00280834>] init_secondary_IRQ+0x10/0x2c
> (XEN)    [<00288fa4>] start_secondary+0x194/0x274
> (XEN)    [<40010170>] 40010170
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 2:
> (XEN) Assertion '!in_irq() && (local_irq_is_enabled() || num_online_cpus(=
) <=3D 1)' failed at common/xmalloc_tlsf.c:601
> (XEN) ****************************************
>=20
> This is happening because zalloc_cpumask_var() may allocate memory
> if NR_CPUS is > 2 * sizeof(unsigned long).
>=20
> Avoid the problem by allocate the per-CPU IRQs while preparing the
> CPU.
>=20
> This also has the benefit to remove a BUG_ON() in the secondary CPU
> code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I still have issues after applying this patch on qemu-arm32:

(XEN) CPU0: Guest atomics will try 1 times before pausing the domain^M^M
(XEN) Bringing up CPU1^M^M
(XEN) CPU1: Guest atomics will try 1 times before pausing the domain^M^M
(XEN) Assertion 'test_bit(_IRQ_DISABLED, &desc->status)' failed at arch/arm=
/gic.c:124^M^M
(XEN) ----[ Xen-4.17-unstable  arm32  debug=3Dy  Not tainted ]----^M^M
(XEN) CPU:    1^M^M
(XEN) PC:     0026f134 gic_route_irq_to_xen+0xa4/0xb0^M^M
(XEN) CPSR:   400001da MODE:Hypervisor^M^M
(XEN)      R0: 00000120 R1: 000000a0 R2: 40002538 R3: 00000000^M^M
(XEN)      R4: 40004f00 R5: 000000a0 R6: 40002538 R7: 8000015a^M^M
(XEN)      R8: 00000000 R9: 40004f14 R10:3fe10000 R11:43fefeec R12:40002ff8=
^M^M
(XEN) HYP: SP: 43fefed4 LR: 0026f0b8^M^M
(XEN) ^M^M
(XEN)   VTCR_EL2: 00000000^M^M
(XEN)  VTTBR_EL2: 0000000000000000^M^M
(XEN) ^M^M
(XEN)  SCTLR_EL2: 30cd187f^M^M
(XEN)    HCR_EL2: 00000038^M^M
(XEN)  TTBR0_EL2: 00000000bfffa000^M^M
(XEN) ^M^M
(XEN)    ESR_EL2: 00000000^M^M
(XEN)  HPFAR_EL2: 00000000^M^M
(XEN)      HDFAR: 00000000^M^M
(XEN)      HIFAR: 00000000^M^M
(XEN) ^M^M
(XEN) Xen stack trace from sp=3D43fefed4:^M^M
(XEN)    00000000 40004f00 00000000 40002538 8000015a 43feff0c 00272a4c 400=
02538^M^M
(XEN)    002a47c4 00000019 00000000 0026ee28 40010000 43feff2c 00272b30 003=
09298^M^M
(XEN)    00000001 0033b248 00000001 00000000 40010000 43feff3c 0026f7ac 000=
00000^M^M
(XEN)    00201828 43feff54 0027ac3c bfffa000 00000000 00000000 00000001 000=
00000^M^M
(XEN)    400100c0 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000^M^M
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000^M^M
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000^M^M
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000^M^M
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000 000=
00000^M^M
(XEN)    00000000 00000000 00000000^M^M
(XEN) Xen call trace:^M^M
(XEN)    [<0026f134>] gic_route_irq_to_xen+0xa4/0xb0 (PC)^M^M
(XEN)    [<0026f0b8>] gic_route_irq_to_xen+0x28/0xb0 (LR)^M^M
(XEN)    [<00272a4c>] setup_irq+0x104/0x178^M^M
(XEN)    [<00272b30>] request_irq+0x70/0xb4^M^M
(XEN)    [<0026f7ac>] init_maintenance_interrupt+0x40/0x5c^M^M
(XEN)    [<0027ac3c>] start_secondary+0x1e8/0x270^M^M
(XEN)    [<400100c0>] 400100c0^M^M

Just wanted to signal before you push this out.

I will investigate deeper and come back to you.

Cheers
Bertrand


