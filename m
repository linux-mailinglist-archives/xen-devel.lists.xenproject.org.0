Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F04B87D4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 13:38:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.274100.469449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJZG-0004hW-66; Wed, 16 Feb 2022 12:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 274100.469449; Wed, 16 Feb 2022 12:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKJZG-0004eU-36; Wed, 16 Feb 2022 12:37:58 +0000
Received: by outflank-mailman (input) for mailman id 274100;
 Wed, 16 Feb 2022 12:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wbM1=S7=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1nKJZE-0004eO-4k
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 12:37:56 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe07::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42e96830-8f25-11ec-8eb8-a37418f5ba1a;
 Wed, 16 Feb 2022 13:37:54 +0100 (CET)
Received: from AM5PR1001CA0064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::41) by DB6PR0802MB2390.eurprd08.prod.outlook.com
 (2603:10a6:4:9f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 16 Feb
 2022 12:37:49 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:15:cafe::61) by AM5PR1001CA0064.outlook.office365.com
 (2603:10a6:206:15::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14 via Frontend
 Transport; Wed, 16 Feb 2022 12:37:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Wed, 16 Feb 2022 12:37:48 +0000
Received: ("Tessian outbound 826a6d8e58c3:v113");
 Wed, 16 Feb 2022 12:37:48 +0000
Received: from ffd2aeb60fab.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F640DA0B-878E-4B26-AB88-E69A5AF7C5F2.1; 
 Wed, 16 Feb 2022 12:37:42 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ffd2aeb60fab.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 16 Feb 2022 12:37:42 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23) by AM4PR0802MB2353.eurprd08.prod.outlook.com
 (2603:10a6:200:63::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.14; Wed, 16 Feb
 2022 12:37:40 +0000
Received: from VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e]) by VI1PR0801MB2125.eurprd08.prod.outlook.com
 ([fe80::5531:4c33:a50c:ea0e%9]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 12:37:40 +0000
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
X-Inumbo-ID: 42e96830-8f25-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa2aXVUDyj1ljokgDYvRMRwSkasiXElQNGzhd67PcB4=;
 b=hWCgU0k2nwfxDkOmmMusDTmQn5rRv3J5OUfyFJgU6fMuLVPQ1RsOOqJ2/0RX1Q3IiovqC7a/kRO4DwV/pOX88jxcexWXQGZ7uK2X6eaXoI9wMD3OHe+Fc5WcwmrNCDe8KsbSEHQ9TrnGXQ7VpR8qw2ab+Sh/KNftfGaOqpS4Z+k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 663303f4835f8353
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXUvBbmW3KRE19TTBUgCDIfjsB/OWoCp9ZSMuu7IemLa0iVQxvg5jG+T16+mRN4Y++fDsY0CVsIymvB1Yrne7G/UCxLLT69MSbjI+EELTQ+8BMU7QWfQHJiwKcY5z5bcCt3a6J1r0iOtphHcME1451O9ekiwiovVQBf8/fOFT3nE+8gaVXgO7TMXAju+H19tga1b/RQLd7Eo8FEiqXm1a4Rzy5Ug90DulxTWo8dWP4v/bGrsYz5cao0n7zzfeCPDMin5hBDHBYEDqqkbbg8nGZkNzkZe7Q7TUaHz+quIZE7BYpYum+iJmcL/Ob8OJu4bHlC+Zvy4H6U2ZUH/ZwqV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xa2aXVUDyj1ljokgDYvRMRwSkasiXElQNGzhd67PcB4=;
 b=MCSRvCgPguQfs2n5kNIf+3qrZ6sj2gtr8ozvTWxjTl1XqR4h37zVd7eAI2BrZB0HdC3HPDqzXcDjOVEAyOsLzFQ5B681lepMM5FDm6wfDHAHsek/vAxkZc4WprjOvWrnoPc7vfXiN+PRBcotFe0iuYOqubZIkpHTkWKfueihhb/CQsXq1QL7qlxHa9eh9NERKZC4G/3SBVOFzVDltReYCT3W2GgsrCmEYf1B8CWiop1gTRmNp+FWPVBo/V7hOTOshEEgi2sWrj1CkGYogowIhIHXamxZiOunMhnTvSEyKC2dkupwou3n+OCXlvsjkWvEJksc7h76NYCvvHWfw07D5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xa2aXVUDyj1ljokgDYvRMRwSkasiXElQNGzhd67PcB4=;
 b=hWCgU0k2nwfxDkOmmMusDTmQn5rRv3J5OUfyFJgU6fMuLVPQ1RsOOqJ2/0RX1Q3IiovqC7a/kRO4DwV/pOX88jxcexWXQGZ7uK2X6eaXoI9wMD3OHe+Fc5WcwmrNCDe8KsbSEHQ9TrnGXQ7VpR8qw2ab+Sh/KNftfGaOqpS4Z+k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot time
From: Luca Fancellu <luca.fancellu@arm.com>
In-Reply-To: <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
Date: Wed, 16 Feb 2022 12:37:37 +0000
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Chen <wei.chen@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E99BEEA5-863A-4780-95D0-C22A12263737@arm.com>
References: <20220215101551.23101-1-luca.fancellu@arm.com>
 <20220215101551.23101-5-luca.fancellu@arm.com>
 <d6f36774-ecb5-15f4-b0c0-6114724060e6@suse.com>
 <AC1B6659-FDCF-49A0-AB6E-EF2196C46D8C@arm.com>
 <779968b4-5985-06bc-be35-ce5b0b719930@suse.com>
To: Juergen Gross <jgross@suse.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-ClientProxiedBy: LO2P265CA0464.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a2::20) To VI1PR0801MB2125.eurprd08.prod.outlook.com
 (2603:10a6:800:5b::23)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: adc70230-e4c3-4d94-43d5-08d9f14923f1
X-MS-TrafficTypeDiagnostic:
	AM4PR0802MB2353:EE_|AM5EUR03FT051:EE_|DB6PR0802MB2390:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2390932FC63E616DF3F03F0CE4359@DB6PR0802MB2390.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 6VxXpJAM0AVUFyFmI89ycq0UB3ZtFXQ4pZz6itrA15AcRuWKDrmUk45fWBQxwN2F5slJbQri/RUyoeMc2OJqTtNCAY0pmbLBxbtSF7xOxf/IxELY1H13RExLUMY8vloaG8h+gb/n1A4wOCJ197iuC+nHu4a9g9/pN25SCGoLY0Sd3AaWbkMoLjIn2X4Z0yVl6a8TzgvIimXVvFyPL6twUCNQ4uQr4PYYRXAx9+13mdrHJHGRcGsWmzB/uaYqboT8jkp9loD1IwrRgqUNB0gkDZj6QOMduVRadLFG7IgFx+UUpte5fJgig8yWlY+R/h9Fv1DEsdajWInJ4WfiWBlje1xXSgOBxaDzOJWVPJxnPWXz78gwJ8PVdYChK8/rFjJ84R0YkOZsB9eC4NxLeMz1kfIBtpl2sgEV5P7rsbuIUKrlBNvUsZ8ZUTujf2HlWZUPf8EIdoKEKp1EFfjSSW7TmWbv/yb7CIpelQ0UeRVrRHWuE7CF5pNOFhY0iPme7HsY9A1hVEnPeDoCR1NMurZGxwH+G806YxCXQdYDjSNyuevA8BJYshotRenHLGfAGGouk+vQrPUuovxVIypIpoyilJ+IHBlfTJIXs6Ful1O3dMnZXAF2bGnjU9KQkx4QVGHg05rGpfixm3QCyVUay0ZLcKyTFlXAna3xOSe8L0HCVQxQB738fl2qIttdaQe4YdFyvir6vCzy3MTOBBTgSV3S6ZtFGu5W2cU+j5prA/rvkd/h4r2VKTSZENBNBkZSZAsj
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0801MB2125.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(44832011)(66556008)(6486002)(66946007)(86362001)(66476007)(6506007)(2616005)(36756003)(6666004)(6512007)(53546011)(8676002)(26005)(7416002)(4326008)(52116002)(5660300002)(8936002)(2906002)(508600001)(83380400001)(38350700002)(38100700002)(6916009)(316002)(186003)(33656002)(54906003)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2353
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	25fd1a19-d771-4c74-8d8a-08d9f1491e5d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jjk3/558N5EreaeXXbbZkrzfCeJwUDaDNlg2uKuNaBgjbg55tCH5y8PjAotITZqBZfUKxkQn574it9huvcR3S4VI45N1G+TFvLTWoAVWd7XxiDRqXz5Vj94eA7Acoz18/yNBSakMuxt01bW4kqsxWWQv24bdY+oYHI6MfeCt5iM/M1p8jv/D0mu0kt1zm0NpOMYGgimRS+QK0iMz2IP/KMVMzOUqrJAPHUgiTD7B2Ge3RnNzN2DkGZqWz32BwJvAlktEKDYUadgTxvV163JWRwSzzBM4xlH8ueDN2QaP4sBK35m9FuHT3C10LiSRPWzYBiz7vhWomlce3n+ByH9DPmP9JxslzIGTP/dCvoxyFmiZqosMKQ+Th+oXPH+TATtZJFczltqGZJNHF6UuxWMbEGKcZWcnIv8O8Qv1FZIxNJlxm3vc8KiLdz3ZpTWp29FnfbQFt4jRihHqEgyLmR1GfTM374sWrHrtvDcs0rPZX+QsVGG41iwzUAsMDx1UZHG+KmVm4RJU12Fyyuo/rGJ56ZfWaG4QgzqyphZVhodi4H/tPwwfJDgB9Aj4KmEFeXl8o3isfxYNjKhMEWb/Ep5HjTUhcLJLiPFHl3y9xjv7QAUsopQjJhdzIWzUb/149KhjLsFa2Ks3ECB+DfK07NgvXSPooc7fkEXmjtk/c0mGr+2E1C3L2xYU2T3B0F3obI11
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(4326008)(86362001)(70206006)(70586007)(40460700003)(6486002)(508600001)(2616005)(36860700001)(8676002)(107886003)(186003)(44832011)(26005)(6862004)(36756003)(53546011)(6506007)(33656002)(6666004)(82310400004)(356005)(47076005)(336012)(81166007)(5660300002)(6512007)(8936002)(54906003)(83380400001)(316002)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 12:37:48.6462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adc70230-e4c3-4d94-43d5-08d9f14923f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2390



> On 16 Feb 2022, at 06:18, Juergen Gross <jgross@suse.com> wrote:
>=20
> On 15.02.22 18:56, Luca Fancellu wrote:
>>> On 15 Feb 2022, at 10:48, Juergen Gross <jgross@suse.com> wrote:
>>>=20
>>> On 15.02.22 11:15, Luca Fancellu wrote:
>>>> Introduce an architecture specific way to create different cpupools
>>>> at boot time, this is particularly useful on ARM big.LITTLE system
>>>> where there might be the need to have different cpupools for each type
>>>> of core, but also systems using NUMA can have different cpu pools for
>>>> each node.
>>>> The feature on arm relies on a specification of the cpupools from the
>>>> device tree to build pools and assign cpus to them.
>>>> Documentation is created to explain the feature.
>>>> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
>>>=20
>>> IIRC I suggested to have the core functionality in common code in order
>>> to allow using boot time cpupool creation e.g. via commandline for x86,
>>> too.
>> Yes, however I think the parser to handle everything by command line wou=
ld
>> be huge due to input sanitisation and not easy enough as the DT, however
>> I see Hyperlaunch has plans to use DT on x86 so I guess it would be ok t=
o make
>> this feature common once the DT is available also on x86.
>=20
> Everything not being explicitly specific to Arm should be in common
> code. Think of the work in progress for Risc-V.

Ok I will put it in common and I will make the feature depend on HAS_DEVICE=
_TREE.

Thank you.

Cheers,
Luca

>=20
>=20
> Juergen
> <OpenPGP_0xB0DE9DD628BF132F.asc>


