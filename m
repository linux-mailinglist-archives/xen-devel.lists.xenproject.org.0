Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83B17E61CC
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 02:23:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629432.981706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tlT-0004oI-Fd; Thu, 09 Nov 2023 01:23:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629432.981706; Thu, 09 Nov 2023 01:23:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0tlT-0004mM-Ac; Thu, 09 Nov 2023 01:23:23 +0000
Received: by outflank-mailman (input) for mailman id 629432;
 Thu, 09 Nov 2023 01:23:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNjr=GW=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r0tlR-0003f4-Lg
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 01:23:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe13::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9121d2e7-7e9e-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 02:23:20 +0100 (CET)
Received: from AM6PR08CA0045.eurprd08.prod.outlook.com (2603:10a6:20b:c0::33)
 by AS1PR08MB7498.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Thu, 9 Nov
 2023 01:23:16 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:c0:cafe::ce) by AM6PR08CA0045.outlook.office365.com
 (2603:10a6:20b:c0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Thu, 9 Nov 2023 01:23:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.16 via Frontend Transport; Thu, 9 Nov 2023 01:23:16 +0000
Received: ("Tessian outbound 5d213238733f:v228");
 Thu, 09 Nov 2023 01:23:15 +0000
Received: from c87e1befbfc8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1682AE90-D5CD-483B-8A3F-C0281451174E.1; 
 Thu, 09 Nov 2023 01:23:09 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c87e1befbfc8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 09 Nov 2023 01:23:09 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by DU0PR08MB9249.eurprd08.prod.outlook.com (2603:10a6:10:418::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.27; Thu, 9 Nov
 2023 01:23:07 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::c64b:7a3:ac99:25db%2]) with mapi id 15.20.6977.019; Thu, 9 Nov 2023
 01:23:07 +0000
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
X-Inumbo-ID: 9121d2e7-7e9e-11ee-9b0e-b553b5be7939
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=SFEpGK04NPDA35+0I4mI7osxzzUXF0QKYL1T0WmTNTsf0HMjYyhPL+OwW9j9X8WNbn1u7yGZqpFSluUDC9Eu7jJ2Kdzqwl4e890fxihc8uAw99quf9oHU2Mpl/LYniLy3fy3L4xQC/9t1eJprepIUSnqqw6re3LFbo8ABmp8dY2udtt0qFwJSOW9mIT1FNiSr7fQeecWlPXqfn3wWQGC7UukTtxMPFxaO5FifCzdgEPnaaLRZKpC231c2SGROf1GjOdiUrzLQikX/lts7wMcFX+ebqRKfKkZgtTbC7UinSHlVNs3ibI1SRHcThsLT0hYiK9RLACJTNSTbDCWBBdF5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTseFVpQZFQb5crCTE9p85Ab+9GF7e0z+/uZbIi1wvo=;
 b=XghUiAzhyweBFBFX88E0gP96lyM0eyH/l1qOBNQNLrczXGYoarIiAt5y+Q9lbZxBfuCFK7w2aOZDwx8e5PJcsIUturt6mGkbY8J38XMRpGdLFXBEFKCSj2w3w0HA9UAJgrpLBGqToqZGkL48KHbeFNjdWOV6LzDpXIqY19/HJUmYHkFB29zFDPyDEi+ZWFWrCp8CgXwT66X99V6hTwAtP7ckMnU8AmxouCdFGKzwf7500mFM+kHQ5aGbMSo0EJraehQfLVaRAmtFlHvj1iPTiq3U8e5hhx9RtF4QLEmKVyYNUTT8IygC6ahgmkgpjlSREN91hilb6ZZCInDnyxtd9A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTseFVpQZFQb5crCTE9p85Ab+9GF7e0z+/uZbIi1wvo=;
 b=b2qYd/Cz20KVlv5IYzrOhzQDnsWlIIkc3LLndF6jg80LEWYFDm9zYNc7Mvlk9nnvr9hAl9KPZfxWDPuD7/wbdsoTEnlz6WdLcHxh9UHMzFjs3vhMbPiLxqeKjJXd5RuQGlg4w45jVn2apWdjDjTXikiiE0PamXaI4ferFw+zsL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 80807e2a0a5cb3be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBDmjZFzsu5O7CQC1qOHXxK+k7/KWayEXmXQX9v/pPMBtkrDa4VZaZ1ylrz4jA3atEFtGLZKLW6iq7cg/HHCCTNWMrlfDPT8eyMtZ6tpeuea+XO9nqwAZaKmxUuZJ6w0JwwMuUvU/DxIctOSxi1BaOv+D0ssWfBvACRae26u7piCC0fP+YOHyUeFEJvhatDproJu8dYfHrtsMF8G+xz2w5srVSERSozeZOygdDMARofpXC5tPZWTHhvGlmTon09udrxrk6YU1YML/OANQekPUAKN/cq3/EUH6+SMZzuBs6YUBzgqkphwDgn6v/PuEDtHVW/YcTdOgKLkPyJGVZNI0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nTseFVpQZFQb5crCTE9p85Ab+9GF7e0z+/uZbIi1wvo=;
 b=M+oc170BltRHu04ULJ7U37U+T5Op8yJsVy8mxx30ZsgdLtyvthSYPouHvZtsWmpGVHFln2gQ+o8wcdfcB7B6xM3vCIP25p/YnUECgpHX3S0jxxWgV/3Aqs0AG6WootIQBSowjUimNw8DNnZpUpM9fjVTR1ifr8WXRHTosUdyTwd+QYr8WKb84MpHfOlROa0hj9jl0PmqhEXY+tqlQFxsLsN0EK9rgThLGAT2GgLWMp7b/JNAOoNGhMrhTMGe4Y3vuwbmdJDvCAOELPT0b79sfwhtx1TwacarklvHEOvw4o1rIHFQgSZJ2z3epdLpavc7rUYctdhr5JyKqbMrnpGbLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nTseFVpQZFQb5crCTE9p85Ab+9GF7e0z+/uZbIi1wvo=;
 b=b2qYd/Cz20KVlv5IYzrOhzQDnsWlIIkc3LLndF6jg80LEWYFDm9zYNc7Mvlk9nnvr9hAl9KPZfxWDPuD7/wbdsoTEnlz6WdLcHxh9UHMzFjs3vhMbPiLxqeKjJXd5RuQGlg4w45jVn2apWdjDjTXikiiE0PamXaI4ferFw+zsL8=
From: Henry Wang <Henry.Wang@arm.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>
Subject: Re: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
Thread-Topic: [PATCH for-4.18 3/3] docs/sphinx: Fix indexing
Thread-Index: AQHaElgpkEvfSoQmUk+wgL6JMPzHXrBxMdgA
Date: Thu, 9 Nov 2023 01:23:07 +0000
Message-ID: <916CE5E9-0D04-4BA8-9A3B-E6C9469315B5@arm.com>
References: <20231108152727.58764-1-andrew.cooper3@citrix.com>
 <20231108152727.58764-4-andrew.cooper3@citrix.com>
In-Reply-To: <20231108152727.58764-4-andrew.cooper3@citrix.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3731.700.6)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|DU0PR08MB9249:EE_|AMS0EPF0000019E:EE_|AS1PR08MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: b52ffbdb-3974-482f-5089-08dbe0c27309
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NXq7fadnHV3SkCco6GiJ4f48BhLkYKs7Y9XiZJms+IgCXk9VEJnzfPRJXgBHwnTGwPOpi36Q161v3lilrJoBFikAuSwRxj6m4byXy6RHrsTb84QoCX9UEFwe7t+JV06GXNKkzO27IPWVEBHSRal7s9M8A+cTB6EJq5Dye14Uvr4/DR/opk9pdtq/4u7anBJtZ8vehFKwicIG0rykgqMVdXioiaYNwEBMFivLu9DyXPZ5VUwb5i6++4rGXCqx8BhByIhG1UOT85LuOEqRlXsfVmUdQ8kE1yFKlPMUi7OxW81IjCt6LIlr6LtOJ5E2iLdx5cNCyUjrhjSiJbyvwt9T6ZAKr2pYm9TNOoJc8vmbdxBr70D0eCimoiXlFAuQdh+ex7I9BEJcK0Njxm6FTtVyWY5XQ8N+erxld5UwhwWrEAmCH5K5bfkhwCJ2EXsetDtO/YcSvNqSSBFnlOIakdn4ieTtMVdDXvQyTJyMMSyTpvmTL+aIpNvqDaKySku9y5JBm+APZaSunprIY/1yJM5WpGu09j38epbo0HjJZoRQBNEAtnwijciY9XzLpbH6ykSYFtugLb0rpBwu3+Mx3pw/DYMiZoXNzvdBQVbkJHhEwTOPjYLWcAzazj9IouoiA1o1QPQo7Hj2dd8WnRRjkINRqtW3X38zfSpgai0X4P754JLe63mEfvIu/8buel06pnIm
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(39860400002)(136003)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(8936002)(36756003)(4326008)(8676002)(41300700001)(38100700002)(5660300002)(2906002)(6512007)(53546011)(6486002)(66476007)(33656002)(54906003)(6916009)(66446008)(64756008)(316002)(86362001)(91956017)(66556008)(83380400001)(26005)(2616005)(122000001)(38070700009)(76116006)(66946007)(71200400001)(478600001)(6506007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B5A9BDD879F8A3409574049B686358F0@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9249
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	da4338a9-e419-4623-1594-08dbe0c26dd1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V+G+PJbYALWnuvyNMCjW6FxeCfEQLNUB+VE7soO0kJnZ6Sx+wDRW75dtzGIZQu5icdYEw6+B+vkBwosgBs+RdSaoZCDkcYv/vl0aJDMBtOuTfAcqCUnH+J3MS92Fnw5vJyX8wnSki2Li1s3YFdG5OwdMqZf1CZCTG+6h40auWMr0EtCbtXixvM9F2zrfZuVXxfDEE5IravzHubKRy+Aol2FvjEcCTlQ1xXCOvnTD4uTbKvIT8a0goHr81vwA5N5h0rhB+i1QKCaFbgDHuZbO+NedPufScJvWuh2g5tcTkIVupSFXVbgbieoJ9AXEPZEoP3oZUr2dqaDBXVTEq+wCIVQXMZNBRoWwVKDM5jNsdgtAKhw583JKGv7v8aZhGQOdftASjywX0c4bm8aKf8XGENnw8Khp1stBFF1Gm39c0wzgIqSNFD3edlIWTrY4ZwC6G730b+tH2v4Qv2U/7lSWREOVQDSlCIBdndn8abtMsRYFeljHkt1zJQCmUJ7V9ygzkIcg3rwsqJqL1TcINVkhlk1oCTl/zTAXzya/NteahR6l+0vssrnYJHeBh3dwppOPdqQ0/s9X+ntsjgjpxKHldbw+uwbyatiuS5L5Mn88vxhr4huCSBEcrqDpHYl+IJZTkdhWhF1+3ABFWDGAklqSvDhAOMgUeArDqd32Yg9+9ctLG4MEKyYUwH5HGDxaEfuzB2cItnuT8pztP9xMLYZGH5mYMeBAdkDGSXS13/xrZ64O6dx0Ojiugy41ncEPZRbuL0pzRY7La6ufMIRbQbFI0N0v07S+OYPgWT0O0Qm9kR4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230173577357003)(230922051799003)(230273577357003)(64100799003)(186009)(82310400011)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(36756003)(356005)(8936002)(6862004)(4326008)(8676002)(82740400003)(47076005)(81166007)(36860700001)(41300700001)(83380400001)(26005)(336012)(2906002)(2616005)(6512007)(478600001)(86362001)(53546011)(6506007)(40460700003)(40480700001)(6486002)(70586007)(70206006)(54906003)(33656002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 01:23:16.0855
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b52ffbdb-3974-482f-5089-08dbe0c27309
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7498

Hi,

> On Nov 8, 2023, at 23:27, Andrew Cooper <andrew.cooper3@citrix.com> wrote=
:
>=20
> sphinx-build reports:
>=20
>  docs/designs/launch/hyperlaunch.rst: WARNING: document isn't included in=
 any toctree
>  docs/designs/launch/hyperlaunch-devicetree.rst: WARNING: document isn't =
included in any toctree
>  docs/misc/xen-makefiles/makefiles.rst: WARNING: document isn't included =
in any toctree
>  docs/misra/C-language-toolchain.rst: WARNING: document isn't included in=
 any toctree
>  docs/misra/C-runtime-failures.rst: WARNING: document isn't included in a=
ny toctree
>  docs/misra/documenting-violations.rst: WARNING: document isn't included =
in any toctree
>  docs/misra/exclude-list.rst: WARNING: document isn't included in any toc=
tree
>  docs/misra/xen-static-analysis.rst: WARNING: document isn't included in =
any toctree
>=20
> Create an up-to-date index.rst in misra/ create an "unsorted docs" sectio=
n at
> the top level to contain everything else.  They can be re-filed at a late=
r
> date.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry


