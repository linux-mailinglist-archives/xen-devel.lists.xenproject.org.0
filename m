Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A59983B9F6B
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jul 2021 13:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149110.275623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzGvo-0000oy-2Z; Fri, 02 Jul 2021 11:02:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149110.275623; Fri, 02 Jul 2021 11:02:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzGvn-0000m7-VZ; Fri, 02 Jul 2021 11:01:59 +0000
Received: by outflank-mailman (input) for mailman id 149110;
 Fri, 02 Jul 2021 11:01:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0qe+=L2=arm.com=Luca.Fancellu@srs-us1.protection.inumbo.net>)
 id 1lzGvm-0000m1-KT
 for xen-devel@lists.xenproject.org; Fri, 02 Jul 2021 11:01:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea23cef5-db24-11eb-839e-12813bfff9fa;
 Fri, 02 Jul 2021 11:01:56 +0000 (UTC)
Received: from PR0P264CA0106.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::22)
 by AS8PR08MB6760.eurprd08.prod.outlook.com (2603:10a6:20b:393::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 2 Jul
 2021 11:01:54 +0000
Received: from VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:19:cafe::b7) by PR0P264CA0106.outlook.office365.com
 (2603:10a6:100:19::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22 via Frontend
 Transport; Fri, 2 Jul 2021 11:01:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT035.mail.protection.outlook.com (10.152.18.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 11:01:53 +0000
Received: ("Tessian outbound 71a9bd19c2b9:v97");
 Fri, 02 Jul 2021 11:01:53 +0000
Received: from 003c9c2ec04b.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 311EB26B-1CE6-47B0-B5D5-46A8F6316B03.1; 
 Fri, 02 Jul 2021 11:01:15 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 003c9c2ec04b.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 02 Jul 2021 11:01:15 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com (2603:10a6:102:130::10)
 by PR3PR08MB5723.eurprd08.prod.outlook.com (2603:10a6:102:89::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.27; Fri, 2 Jul
 2021 11:01:13 +0000
Received: from PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025]) by PAXPR08MB6816.eurprd08.prod.outlook.com
 ([fe80::7cfd:a8eb:b25a:f025%7]) with mapi id 15.20.4264.026; Fri, 2 Jul 2021
 11:01:13 +0000
Received: from smtpclient.apple (82.8.129.65) by
 LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.22 via Frontend Transport; Fri, 2 Jul 2021 11:01:13 +0000
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
X-Inumbo-ID: ea23cef5-db24-11eb-839e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uRhU4AslYb7IzQtRiQCkU8K6Wvpoh3wjruFiJ715nI=;
 b=EqjdiY7NLR8H/RhTL2HrQbqn/JKFUS0LjBpYBOrKPEML/Tg7KTjNDHah3WUwy4GqGacEU0IIGE8aOdFLOQ93/fRMrZQ+pwIY8n9tsX5DBC6HHkZhbOKLo+8wKNYtJ/uRL1Gr47BjwjoNxVRDEcI+AH0og57U3VInduB64tNbSN0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 53e80b0f3dae74a7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7hgOx7q9j482y+72cuLBiTRM6XghXxYeCUw4oT0TAQL7GExmYJAX9w/E6KTbsOyVNopeAk1L/z4dW2P6T6unX+qnafOsyxAh7yrkcreEDmd7YLXlXpBDCeZwj9DfpDCnNTnJyO7591BWuUaC96K6iLj7V/xEY1V5tvomeNaa0Ss8WMMGUp0m4j49r/UMiylQR+U6tOldx28bi/a78/xjqeppZomR15ukShnrdQGma2Xmv02/cNJiFlzmub2qKiJvtT4SVCDA1x0khDn0KUCV2vaBqBKuDP99zy5DjjC0LoliutG7jSCfLpYz1YTS8TzLIXaoS8j8VWLeixgsxB4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uRhU4AslYb7IzQtRiQCkU8K6Wvpoh3wjruFiJ715nI=;
 b=jihwjj7qwUpTBDtb8m9/iR3RG/YbFzd/45kMgbBa9aM72Tnd7cWpdZGmmnLH/2JMWlyEKampQ2y6zuRM42BGr3w3kkG+Gw4prY1prO4WvQK/YW1lYvOq9MkvIvX/PSlGSv9cBnPPcfv9Ot1jrrgpXhhkGdTnqlN1mj90IPjjlEGWSa+mUw4riKwykm2DXbALLPvYY4LZ8O6YOCN6Z87mZk857cYPardFewXqKjHEWn/ByBI1UjC5G/6dHV36NBfA50hQ9VP1puUf7vqIcQ2RvBH28W0HoR8j648ZJ9FRzJTaYs2uVN7u5CZ6UyBz1OHMnx1a0HgKmBBzdnZk1ho/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uRhU4AslYb7IzQtRiQCkU8K6Wvpoh3wjruFiJ715nI=;
 b=EqjdiY7NLR8H/RhTL2HrQbqn/JKFUS0LjBpYBOrKPEML/Tg7KTjNDHah3WUwy4GqGacEU0IIGE8aOdFLOQ93/fRMrZQ+pwIY8n9tsX5DBC6HHkZhbOKLo+8wKNYtJ/uRL1Gr47BjwjoNxVRDEcI+AH0og57U3VInduB64tNbSN0=
Authentication-Results-Original: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=utf-8
Subject: Re: [PATCH v6 9/9] docs/doxygen: doxygen documentation for
 grant_table.h
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <alpine.DEB.2.21.2107011043410.9437@sstabellini-ThinkPad-T480s>
Date: Fri, 2 Jul 2021 12:01:06 +0100
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4E85233D-5371-4862-A0A5-2B653C677D54@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>
 <20210510084105.17108-10-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2106231530320.24906@sstabellini-ThinkPad-T480s>
 <31171081-1007-4B4E-91CC-25EA1041EB58@arm.com>
 <alpine.DEB.2.21.2107011043410.9437@sstabellini-ThinkPad-T480s>
To: Stefano Stabellini <sstabellini@kernel.org>
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-Originating-IP: [82.8.129.65]
X-ClientProxiedBy: LO4P123CA0103.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::18) To PAXPR08MB6816.eurprd08.prod.outlook.com
 (2603:10a6:102:130::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ec88e60-a8d7-468f-1b97-08d93d48cd2e
X-MS-TrafficTypeDiagnostic: PR3PR08MB5723:|AS8PR08MB6760:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB67602BADB3BEDA40B7FBD68DE41F9@AS8PR08MB6760.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 iQmreDM5gfMKXoW47LtiF5fKBLuCy0tD3g0xtiroG/R5L94cbj+xR//6BDc62bdmRYoDqg5nC9FDVPTAaaXMiKtQN7atKsSlBomzpDtjwCbVG9ksWjErIWJrKWC46Gbt3zVmwHHWz1V5fozpYvTr5ehmNcduugM5PCYXILqm+HMRNFjTuQLjy0KkotujVCD57r4wwF8fLucA8Lyfh203bMmIcJ1SBjKN4D1oVM/KD4JBz1yXcyOMiQ/Z4QiN0ZeriJwRKwi2j1F4cSQIVg6fllKWBl8LGqgljBCerC72xhNvwpIUn/MXx+tXdDCQgPSc2+plUBkm2D5JxDyiSiYbhjz/YvB2njVCAKyjHgAmvENy0o7iDzf9yK5QbDGecTfbgjPWAWb2lciNTMEyOwFlKr13Z8gN5DHEavOYe1t7jgkK1pV3N/eKUZ8LjvU1/9jtcK9ZnxbEvr/ZowxsSfDOE4ZmDdcwT1CFvbSbxovAUCmU/MVIoLKJSIqn3xbP10bwCotAo8s2nTN4ynqOhz9NMMrAW4UYPbvyMbFS7wOO4bfMMqnNlrpxH4R5brbXO3ED9iiHjW8fm80SeY3dur7NOuQq5VCd2KjKYWT3fkJfapHafedACX/NH2qmAgVgmdV40YwnGKUzy4tmTX+cGbudEPIyAYXt/vb9FiEI1ST7i+XwEaFCuwuDagPAuUpCMirZ8AsFxQKP8VNGafxjsckHWH3CSc3JctmL6vGrEGJvLAck4A5z4CazONATcn63vUdrEoaUvENWK80rx2GxKojnRw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6816.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(376002)(396003)(136003)(346002)(478600001)(5660300002)(66556008)(6916009)(956004)(2616005)(2906002)(66476007)(6486002)(6512007)(4326008)(316002)(44832011)(966005)(6666004)(66946007)(54906003)(26005)(53546011)(6506007)(52116002)(186003)(83380400001)(86362001)(33656002)(8936002)(36756003)(8676002)(16526019)(38350700002)(38100700002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?cDVlczZPMHF3QmUzSk5FNU9yN0ZYdGxyVFRmcVZObnRHdWVnSTVnUVdKekpQ?=
 =?utf-8?B?OFNRelY1dFhQUURmblhvOWlyN2tKaUxwNm94Y2dwWW9hUUE2dnFCNzFIRmpt?=
 =?utf-8?B?eTJGa0NseCt5SUhRdGoyMzJnd0RDMlhLTU1jbXNZaFYrM0lYbFJyMVc0NXhp?=
 =?utf-8?B?eXlxTGl5eHZZQXNVekRtaEFmd1BVUkM5aG9GMGFMSkFpeFdjRVlOQ2s1WHRl?=
 =?utf-8?B?T2JWcDdOMUYweWlpQk11UWtVNFdIMld6WE0vaEFVY0xxSWwrcE1VK2hHOExw?=
 =?utf-8?B?eEIzeStVTWVRYjY3akxleU9nWUpYeHlnR3Bjdk5lMU55VWh3emwzeXl2Z1kx?=
 =?utf-8?B?VHJhdEVrbTYraUp0Ni9jUmsrRGtLcmtWZy9GcTFQVGo1YjdJc3FVL3JCVVEz?=
 =?utf-8?B?QTV4UlkyMUw3aUZtTjU0c09FeElHckx6bGI2WmIxNmxQa0M4QkphcmNNMXV4?=
 =?utf-8?B?K3RPcHlZb2V0MU54V0U5T05jU2QvQW4zT3hseVQ3ejM2QTN4VWFLUG00Qnd4?=
 =?utf-8?B?cjM2aFlJeEpUeVRpRVRINzdjcHZTdTh3TXNLaVc5bDZyMmlhUXI5SzlZeWV0?=
 =?utf-8?B?dldmV3U4QXc5RVVxZE92RG1xb040WVZtTm1LaDM0R1M1S2E2QW91czFIWGMv?=
 =?utf-8?B?aWdJR1l0MFR0M1VNbHhqMVNKTHFqcWVFNG9zZGZ6cFQ1YTdoa0tNSjByb0Ir?=
 =?utf-8?B?UjUyUjAwNTlaaHVTZDN3ejVudCtPT08xVUxkbXBSekZkcnoxd2tmL1JXdlMv?=
 =?utf-8?B?TldWYTRDQTFuQWI5eUFmMUFKc2dDOE9RU2xzMGlSNWRxd25rZjhYeXNuak1m?=
 =?utf-8?B?SmdNV09vSWdYY2NTYzRVRFBTM2lKSkNQMXBqdUdqT0Z4ZVhDNTNNazVVRE1u?=
 =?utf-8?B?OG9nSDFRQXFGbDVHS3FZbjJjZDRGNUhQcXRId2tsYVgvNW9kdkFWejkzWmx4?=
 =?utf-8?B?ZjRRaE4zR05jMG9jWWMrbEpmYUhIKzBadWlPK1pZZW04d3NSc1ZzUWVMZzNU?=
 =?utf-8?B?bzdyMnBYaFlMcEJXczRzTDNmQ3J0RE1TbmhNb3JqUm04bkdkT3EvMDRKaFYr?=
 =?utf-8?B?aG44c09vY3NDd0JQa1pSMW9NL0FKSk5DWC9ybCtydktVVzNiYnF0dGJaRTBt?=
 =?utf-8?B?KzlhZ1ZBQWg5OERHUTRBd2prYVhiayt0ZjlDQjJjbXd2NHh4Yk9YVy9ma05N?=
 =?utf-8?B?UFkyamZtczd1UUloMnZPc1h5L3NIaDhhd0tRSWxlMzZrVVFJMk90eWxMK1No?=
 =?utf-8?B?R1QxYVNNbTFtMVh1MDY2OUJtMHljR3VSeXdxaVRxejF6aTJLT0JoQUlTMDBK?=
 =?utf-8?B?YzM5eUpaRk1ybW5FWmhCTVI2MjZqc3NMY3B5U0Z2SFlGQnJxZDA4cDB4bmlU?=
 =?utf-8?B?bHREamFjQ0hhMURYZVB3ZEt5bi8rNWtjRnYwSThIZlVxaEZkOFcwd3ZWbHhi?=
 =?utf-8?B?djNjMjRabDdhWEVXKzRYd2Uwby9zUWxmakk5aTdnWlZQMzR4TERsa3B5T1pP?=
 =?utf-8?B?a3dnVDVIazJBcTVNT1A5SU1qNzNZcjNiMjc1QjhjTmhIb2JDYWtQRVpldFRC?=
 =?utf-8?B?NnViKzhTYlk4SkdIT2xIS3d0MTZsL0NkbGRGMnRhTHJlRFpTUk83WDRjSjF5?=
 =?utf-8?B?NnVCUGZ3L21mMXFrYTV4UnZQV3R6RVBQdkNobGVrcm53NjRhVVh4Um5FQ2pT?=
 =?utf-8?B?b1dWSmxFZWtoMVhWSWY5eWJDZUF1dGJKN2FuczkyM1ZxbFhvQTV5a3pEMUNS?=
 =?utf-8?Q?PnrFtRltLWXY+ETvSFQm6B1jHrMgqe4s10DBu5k?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5723
Original-Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd3599ae-0382-43c9-a46f-08d93d48b518
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IJa7sfTYtyS9rZ8pTTW8r4Z7miadTkfdfZJZw82uDkONR/5xhRdZOHTmRoWuNoW1wPyDLT8swnRC19X+0jWhN2XLXsh0Cmk3thif6KhVzndP48wMMRw3WQAzYvXd8niJnk5vg/DL/jWSOc01ZioBcjgLpHMlK+bPh3Bbt48UANmBtBjHBMVvdLv6dFSiCPQe6HreIAbrpCh4STBQlHzLB31lohfodbngEmAsQctWXk9HpRsh/0K44Yl2u3IleSCb2dFMuaHZ4sGTyXxbp0Cpu5rDpOXupfnrf5zStaWF9/GJJAbxr47yJage+Tu21Kyqn9AdISFZ5uZ4XCuRObBylanV0RgR/Ocg2xZxeSgFcG4keyijzbHIu3+m8OqQsmYVBibiC0WraoxDpyriOMzj0Nw2agUfl/pxM+uAL80nErIYBNq+EukqIGkepJ5KjqkGWTJfy5Fh/ctrJ9IbU/rn1hKU7K1cRUHIi7/qtIr4mUDLj9pirSe16Tqii1CvGEHJ6riOI+It34YInuxXuo0Yq0lvWH7oeKIJSQwoeG0SzgZJRy9Kv1uB6UHIzOWmjJT9DdPMBCU6mMlJNg+ZgUiRLZUrMmO3sFJ2bL9VcHTpgmrHMmM/Pa44HwsHbylkLxahs9nUE5a1MZorcVtFW5pEQFZgIl1lERP/BcGux5uZTode27ckZT/ZEbeeaGM5wpXXqaYhSogng2FZQ76q1nNgx47xxfMdDTonppQRYSCTzZlZN0NkC+2Vi4TB5B/cuIOO
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39850400004)(46966006)(36840700001)(2616005)(53546011)(6506007)(36756003)(956004)(186003)(33656002)(44832011)(16526019)(478600001)(8676002)(2906002)(26005)(336012)(47076005)(6486002)(86362001)(8936002)(36860700001)(6512007)(966005)(70586007)(82740400003)(6862004)(4326008)(5660300002)(70206006)(356005)(316002)(83380400001)(54906003)(82310400003)(6666004)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2021 11:01:53.7767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ec88e60-a8d7-468f-1b97-08d93d48cd2e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT035.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6760



> On 1 Jul 2021, at 18:44, Stefano Stabellini <sstabellini@kernel.org> wrot=
e:
>=20
> On Thu, 1 Jul 2021, Luca Fancellu wrote:
>> Hi Stefano,
>>=20
>>> On 24 Jun 2021, at 00:34, Stefano Stabellini <sstabellini@kernel.org> w=
rote:
>>>=20
>>> On Mon, 10 May 2021, Luca Fancellu wrote:
>>>> Modification to include/public/grant_table.h:
>>>>=20
>>>> 1) Add doxygen tags to:
>>>> - Create Grant tables section
>>>> - include variables in the generated documentation
>>>> - Used @keepindent/@endkeepindent to enclose comment
>>>>  section that are indented using spaces, to keep
>>>>  the indentation.
>>>> 2) Add .rst file for grant table for Arm64
>>>=20
>>> Why only arm64?
>>=20
>> This is a mistake, it should be just =E2=80=9CAdd .rst file for grant ta=
ble"
>>=20
>>>=20
>>>=20
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>> ---
>>>> v6 changes:
>>>> - Fix misaligned comment
>>>> - Moved comments to make them display in the docs
>>>> - Included more documentation in the docs
>>>> (see output here: https://luca.fancellu.gitlab.io/xen-docs/hypercall-i=
nterfaces/common/grant_tables.html)
>>>=20
>>> It looks much much better. All the info we care about seems to be there=
.
>>> The only things that I noticed missing and might be good to keep is the
>>> small comment about HYPERVISOR_grant_table_op:
>>>=20
>>> /* ` enum neg_errnoval
>>> * ` HYPERVISOR_grant_table_op(enum grant_table_op cmd,
>>> * `                           void *args,
>>> * `                           unsigned int count)
>>> * `
>>> *
>>> * @args points to an array of a per-command data structure. The array
>>> * has @count members
>>=20
>> Where do you want me to put this comment in the html page? In the end of=
 the description in the top of the page?
>=20
> Yeah, that looks like a good place

Great, for a preview, have a look on this: https://luca.fancellu.gitlab.io/=
xen-docs/hypercall-interfaces/common/grant_tables.html


