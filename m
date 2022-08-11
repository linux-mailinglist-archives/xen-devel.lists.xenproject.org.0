Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8208B58FFD2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 17:35:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384707.620142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMACj-0008IO-Lo; Thu, 11 Aug 2022 15:34:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384707.620142; Thu, 11 Aug 2022 15:34:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMACj-0008Fb-ID; Thu, 11 Aug 2022 15:34:37 +0000
Received: by outflank-mailman (input) for mailman id 384707;
 Thu, 11 Aug 2022 15:34:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8no=YP=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oMACi-0008FV-9Z
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 15:34:36 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2069.outbound.protection.outlook.com [40.107.22.69])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a3eb7f5-198b-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 17:34:35 +0200 (CEST)
Received: from AM5PR1001CA0022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::35)
 by AM5PR0801MB2049.eurprd08.prod.outlook.com (2603:10a6:203:42::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 15:34:33 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::6b) by AM5PR1001CA0022.outlook.office365.com
 (2603:10a6:206:2::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Thu, 11 Aug 2022 15:34:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Thu, 11 Aug 2022 15:34:32 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Thu, 11 Aug 2022 15:34:32 +0000
Received: from 1153db2a4dd8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3C90804C-7B56-4E9A-B919-CBBEC0D4E1C0.1; 
 Thu, 11 Aug 2022 15:34:21 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1153db2a4dd8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Aug 2022 15:34:21 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM0PR08MB3937.eurprd08.prod.outlook.com (2603:10a6:208:12f::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Thu, 11 Aug
 2022 15:34:19 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.024; Thu, 11 Aug 2022
 15:34:19 +0000
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
X-Inumbo-ID: 1a3eb7f5-198b-11ed-bd2e-47488cf2e6aa
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=oZHZb8JMFh6QpZdE1v/Xy+8h/Ei7mZlW2QUR8Z3sy55YXuc4VUl/lnGShGpnfqFymsQuH6YjWgP3CDXKLVZ5XI5kGwynHE/lZjEoeC5jgYVep0+SxEs1rh8oytxpLgkoda0GZ59l8+h0gU5+EXK2WmI1TBnAd+Ipc7oc0tHaIGbPw24UVi9OhQxCe18cy7TqXrmazmb6grqRPlf2vSS+h7Hfo486+zEJbyMp9WBiKPez1ai9LSbQ1+et6oos01SrrU9teoiAn6Nfm9307+iXZcMVQs1v0YyPPiARYJ0g/ll/7TlvHG4H+7cbZht+uGbRuTx5iN98ljMMl8Lm9f8S+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UylbPgWVsDiAONscMv2Fw7L/W3G3d6HeG5/uULIKxoM=;
 b=djni/6HId7quQGxVdx82J70TkZETixZMobPDpCDNWTUNMml4jMACnmeROvUYcLcWe5zb4uQ82p1A0m4tAVcOpzVBHpHjkr2j9IFqPE1OAXM41wbVeRR5JXpzZXfAuIVMbksoPpx4hu+Qv8hf/2A0USWU8WOcXIC24Wb2L8L0+ANi2EtVrxx+2NPEk4OP8AwQNvwPSuCBWkAq+aZVyOU+53470v+7HkZxjDCkgZyX1dRGaWclPPWhoRUfUTnkSIfvESCyXHO1jX+iwLGo9nXuBSC7AEInjOaAy+Xlt0ZJ3CznmkstBu0w1tMxc1LkQDCXJ1fO0XBZIL1XqiKcpmbkjw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UylbPgWVsDiAONscMv2Fw7L/W3G3d6HeG5/uULIKxoM=;
 b=5u3mwfGEU716kMDtr1gQ82p1ccBkJn7xSXy0MxXptwjqyUG0GDFT76N8svgJep++R32DQe2fS+Ifqj8m+aivi6//bQO8FAYtovSOkSRP1ZHZo/QjxhNmUOf+hSfPG4VXGI1upLrKxFBUhLS3f3XoVgSysls4cUI3Tnqouav1nqE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: e88e1fdd1e2fcd85
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh/RH/hPQVb8rTbbSpwITVsPciexg/MAocxvoIqoA4v8StSR1kjAUlnaTBinwf60ZX8FMfECGdx3U/HaE3uaNkCnuRDZI0Wa4Vh5f9qWyORbXm/f7tFy2mvv4bDb5HxhyYcgW/+DUu3VPBTDNvKMhnnYxmKquouFWZaZXJcamELNtuz7oaKCGfn9vfUlcOoVfG6ciOHcW06GYgt4KX7ZswnlVYKHgD0ofUWQSDMScYe9H4Qe99XqXn8PHDiH0o4q0BuSIGjCtb5384c02EH/4eS3Mp4NlP8FIgATezHUILr7WiP6OheG5ZAjEO9XWFPLailVhwmHcKL7XWpAozhqvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UylbPgWVsDiAONscMv2Fw7L/W3G3d6HeG5/uULIKxoM=;
 b=QiH0n2M/ywiJjt3tMfBvXKT3INc71OrT+0nTK9C+0g4QLYwo3OBpsM69vGu1LprvSzImq98sK2GA9Xkw/9ME0Okpn8i1Sr6JT+J2S7JD8xI9D/3laqbjemVQqrFCpaufVs7zZCkZhxfg9R6HNk8/71Tu/IcUhtqKBo+55D2jxjkdA7zb6R/OmcDcOLqtJsV7YQszVynbC5sfuImyHpCSDFqQxuIzLXMgLdBWSPCqQV9aUwAgpS+K5bbWd0PL4XsrREntWztuj2Re6wdKlGh/t7YKWZtOzNaAgvzrXSVfyf3qk/RIWp7frpQcu5vlXB0yxZbSVxOyHtVA3i8lkA/W6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UylbPgWVsDiAONscMv2Fw7L/W3G3d6HeG5/uULIKxoM=;
 b=5u3mwfGEU716kMDtr1gQ82p1ccBkJn7xSXy0MxXptwjqyUG0GDFT76N8svgJep++R32DQe2fS+Ifqj8m+aivi6//bQO8FAYtovSOkSRP1ZHZo/QjxhNmUOf+hSfPG4VXGI1upLrKxFBUhLS3f3XoVgSysls4cUI3Tnqouav1nqE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: "leo.yan@linaro.org" <leo.yan@linaro.org>, xen-devel
	<xen-devel@lists.xenproject.org>, Peter Griffin <peter.griffin@linaro.org>,
	Jerome Forissier <jerome.forissier@linaro.org>, Marc Zyngier
	<maz@kernel.org>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Topic: Question: Enable LINUX_EFI_MEMRESERVE_TABLE_GUID in EFI
Thread-Index:
 AQHYp9oMDnfnppRN40WNR+bqQStYIa2gMcaAgAAFzACACZLNgIAAC6aAgAAB64CAAAf/AA==
Date: Thu, 11 Aug 2022 15:34:19 +0000
Message-ID: <FC36D6D7-C240-45D6-8125-A0FD8EE575F9@arm.com>
References: <20220804081253.GA1219098@leoy-ThinkPad-X240s>
 <D6DDAE40-A8EF-4230-A292-401FBA085EE0@arm.com>
 <EA8A294E-856D-4579-B26E-55F6B7EB477C@arm.com>
 <20220811141707.GB868014@leoy-huanghe.lan>
 <26D200AA-0CCF-4778-A748-36CE448C6AB9@arm.com>
 <CAMj1kXG_koV05iMEX9NgibdLNqVxB-2kwUj+bMXD-2CToQgn3g@mail.gmail.com>
In-Reply-To:
 <CAMj1kXG_koV05iMEX9NgibdLNqVxB-2kwUj+bMXD-2CToQgn3g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 13577f5a-197e-499a-9301-08da7baefd1b
x-ms-traffictypediagnostic:
	AM0PR08MB3937:EE_|VE1EUR03FT044:EE_|AM5PR0801MB2049:EE_
x-ld-processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dJqlNZyeakF3xLytAuO3DF4GTw47qRJIztwXY6GLPurXJgTmtDBvsDViob5otlBboESrJ1o771mH2sVOiZ5v/7vuIY5n98RJFhpR3q6r5J5lGoG/dTjCXJPf79ZeLybETvKEDBhjQ2nCC8qPofmpdYVWc7n6EEuPTYnL2BRtwysdwGn91a1BTJEXCDnIPtbFVefyepK7z4kTTmpJjh7nwt+6hF2Bs4CuA6ob+B3lksquKfVXpdwjg0tNE1oU9iQxwuGNvKOXq6bIq0Rd88ToylPwzhEp+aXVJ6SXrVUY444h7iqWdm06TVyTysayeENmtdjWxOWCeKZcr3Sjqt/Hf/97k/FyRwnVBGQC5IPS9a6+/39VxNn7ngmLJvKOZc9RtqJfuulozXAKa/g5EX4Idrf3AnRT4960U3BjxNT/xTz4LCrOFiAeWkNKZREc352wG3EePuQbPamsQ1FHLhZJK/OqP/Ndm5MRKHQ82v8CK2KKnvsv+GCbkRCrzaz0akNxqo929LExwVPC/vMh1VcSBnqWRg5U52nAaPjJxuew96COx1sOe1cDpNoPwsmbM8bAXvBRf7Fq2KHNDdKAqmZwvsdCEzU6suX529nZEJARQ8+2z2h447fdPrMgpm034hJKhK52BqjkbpNMK/bOE6PeR671H6ZG42c/L9uOI4l6T1U3D4WnvyrDjURGhf6xp5y0PZXXJ6bmV9iIXcM8uawX2Quqi13P9GAeOBl3xJZL/4X0dJLhD1eqdnLSpt0rlZGspUF/pZJ890YCRsTsfPEjTkAM5LHg8fknB+lmAii7gX5Scy6mm6lP6heV9uy8bI4MN/hY5r7M8PRGdCG/hxSHig==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(6512007)(38100700002)(26005)(38070700005)(66556008)(64756008)(122000001)(76116006)(91956017)(66946007)(4326008)(53546011)(66446008)(66476007)(8676002)(478600001)(71200400001)(6486002)(316002)(41300700001)(6506007)(6916009)(54906003)(33656002)(2906002)(36756003)(2616005)(186003)(5660300002)(8936002)(86362001)(83380400001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A555735A5CA2A6438E95E0EB69D4A962@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3937
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a7eec3ba-cf53-48eb-3bdd-08da7baef50f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3N4XQM/CZAUZciILIkN8caNQaR4bqRp2ibZKFuzxtJhI7GM+ZdFvZRgH6szEN9axfsUSv+sWXm5G2Y2COL7ykhWi7TbBTzsLJ91NS5EucWlD09kB63qWW+jUBq9huT+qs9DyaRPYnQbAwJACntBkNLgec2UyrJIEG4FuaYyhycTs7GpLTaWGsFh1X1uymx3g2WW7HXT5+RbMWJvMWlr4voWVHBAUfa3vflbG9aL4tY4huhrIh25TBWZDY0vAXR/09TvzdJC0shCFredCv6m7QfMh2aygSI+exLaCs3lxW6jpwWnnWiAivDqGFjC41FYjxuJFrY72DvkJtbocYDEgBmJuchjxy2ZXk1D9CNTZhOXNBC/uyiuC1DVBBUfczVtd70FWcVFCa0K1YzfkBS1+4dnd5lXE8nIw0MZpC4dTfxfBH+ZqAxclD8UqEApJz0npmIGroHwW4BkyTSjrJHZ1E8tPBg/4VR9kjlDWvp+1R+jUrvb8n/0cFTeCadA4AUFB8EtWohIfJpW2C0Cl71gDSP0vgmnrYcmOeINyWprqpjzhIWiNG0Q/N/jLUrxIVtjw6JQXItHJ/1sR33jDM0nxqkEFpzFURF+V7c0rPyrkfSI+/GbXTkeb309NX0S5EU9pCDXIq1KtilJsJg9hap2cS55dMSUZPVOdN+lCHs0viIKx+QBQP+g4VOUaZFE9OPdpEcYP0a8jLakvMRhfVhkEb7U+k9dLE/fhk3ofyLG+OLpQSl3wbjDjJsOk9Hhc4EagHP1iPrVKbwythBr2X6Ya6gkYMW9mhhC9U9VbORLkQz03GauXOncgGOsKpxkRKstS
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(346002)(136003)(40470700004)(36840700001)(46966006)(316002)(33656002)(41300700001)(356005)(70586007)(2906002)(70206006)(53546011)(4326008)(6506007)(26005)(8676002)(82740400003)(82310400005)(81166007)(6512007)(5660300002)(36756003)(47076005)(186003)(336012)(83380400001)(478600001)(86362001)(8936002)(40460700003)(6862004)(54906003)(40480700001)(36860700001)(6486002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2022 15:34:32.5767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13577f5a-197e-499a-9301-08da7baefd1b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2049

Hi,

> On 11 Aug 2022, at 16:05, Ard Biesheuvel <ardb@kernel.org> wrote:
>=20
> On Thu, 11 Aug 2022 at 16:59, Bertrand Marquis <Bertrand.Marquis@arm.com>=
 wrote:
>>=20
>> Hi Leon,
>>=20
>>> On 11 Aug 2022, at 15:17, Leo Yan <leo.yan@linaro.org> wrote:
>>>=20
>>> Hi Bertrand, Rahul,
>>>=20
>>> On Fri, Aug 05, 2022 at 12:05:23PM +0000, Bertrand Marquis wrote:
>>>>> On 5 Aug 2022, at 12:44, Rahul Singh <Rahul.Singh@arm.com> wrote:
>>>=20
>>> [...]
>>>=20
>>>>>> Looked into the code, the GICv3 driver tries to create persistent
>>>>>> reservations for pending pages, and the persistent reservation table
>>>>>> can be used by kexec/kdump.  For the persistent reservations, it
>>>>>> relies on MEMRESERVE EFI configuration table, but this table is not
>>>>>> supported by xen.efi, I think this is the reason for the above oops.
>>>>>=20
>>>>> Yes, you are right above warning is observed because Xen does not sup=
port
>>>>> memreserve efi table. I also observed a similar warning on the N1SDP =
board.
>>>>>>=20
>>>>>> I checked that if I boot a host Linux (without Xen), then the EFI ha=
s
>>>>>> provided MEMRESERVE configuration table, I can get below log:
>>>>>>=20
>>>>>> #  dmesg | grep MEMRESERVE
>>>>>> [    0.000000] efi: TPMFinalLog=3D0x807f9ef0000 ACPI 2.0=3D0x807fa0d=
0018 ... MEMRESERVE=3D0x807f8141e98
>>>>>>=20
>>>>>> Just want to confirm, is anyone working on enabling MEMRESERVE EFI
>>>>>> configuration table for Xen?  And welcome any comments and
>>>>>> suggestions!
>>>>>>=20
>>>>=20
>>>> No I do not think anybody is working on this at the moment.
>>>> If you want to work on adding support for this in Xen, we can provide =
support
>>>> and help on reviewing and testing as we have several targets on which =
we
>>>> observe this (N1SDP and Ava).
>>>=20
>>> Thanks for your quick response.
>>>=20
>>> I took time to look into the code, below are my conclusions.
>>>=20
>>> For a normal UEFI boot flow, UEFI will invoke Linux kernel's EFI stub,
>>> and the EFI stub will install MEMRESERVE EFI configuration table.
>>> This is accomplished in the Linux function install_memreserve_table().
>>>=20
>>> Secondly, Xen passes DT to kernel, it synthesizes ACPI compatible
>>> nodes in the device tree and finally kernel parses DT and create the
>>> ACPI table.  In this case, Xen doesn't invoke Linux EFI stub.
>>>=20
>>> To be honest, I have very less knowledge for Xen and APCI; just based o=
n
>>> reading code, I think it's hard for Xen to invoke Linux kernel's EFI
>>> stub, this is because Xen needs to provide the EFI runtime services, an=
d
>>> I don't think it's feasible for Xen to pass through UEFI's runtime
>>> service to Linux kernel.  If we implement the EFI runtime services for
>>> Xen, then this would introduce a big implementation.
>>>=20
>>> So another option is we simply add MEMRESERVE EFI configuration table
>>> into device tree, just like Xen does for other ACPI tables (e.g.
>>> RSDP?).  And then in Linux kernel, we need to parse the DT binding and
>>> initialize the corresponding variables in kernel, so we need to add
>>> support in the Linux source drivers/firmware/efi/fdtparams.c.
>>>=20
>>> Before I proceed, just want to check which option would be the right
>>> way to move forward?  And I am open for any other solution and welcome
>>> suggestions.
>>=20
>> When Xen is started using EFI, Linux is then started purely using device=
 tree
>> there is a standard way to define reserved memory to linux using the dev=
ice
>> tree and Xen should decode the Memreserve entry from EFI and add the
>> corresponding entry in the device tree that we give to linux.
>>=20
>=20
> This is not what MEMRESERVE is used for. Specifying reservations for
> the current boot is straight-forward. What MEMRESERVE does is specify
> a reservation that survives kexec and is passed on to the next
> kernel(s), as the table is anchored in a structure that is created by
> the EFI stub on the first boot. This is needed for the GICv3 on some
> platforms, as memory that Linux reserves for its interrupt tables can
> never be released again, even across kexec, which means that the GICv3
> will be DMA'ing into that memory if the kexec kernel wants it or not)
>=20
> I'd strongly recommend against doing any of the things Xen does for
> ACPI boot today: both the ACPI spec and the kernel documentation about
> ACPI support in the arm64 port is 100% clear that EFI boot is the only
> supported boot method. Issues like this one would have never popped up
> if those rules were adhered to. (/pedantic mode off)

I agree with that in the long term we should find a solution to remove this
system and have something more compliant with EFI/ACPI in Xen.

>=20
> In your case, this is a matter of allocating a structure of the right
> type and size, and making it available via the configuration table
> array in the EFI system table that the dom0 kernel receives from Xen
> at boot.
>=20
> Please don't add DT entries for this - we should be able to cover this
> using the existing pseudo-EFI boot flow that Xen uses today.

Currently the EFI system table is passed using a device tree generated
by Xen. To add support right now we would need to make the table
available to dom0 and pass its address inside this device tree.

Cheers
Bertrand

>=20
> --=20
> Ard.


