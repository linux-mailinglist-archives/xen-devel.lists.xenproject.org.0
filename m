Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6955D519DEF
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 13:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320604.541422 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmD8t-0007xN-Ut; Wed, 04 May 2022 11:26:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320604.541422; Wed, 04 May 2022 11:26:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmD8t-0007v5-Ru; Wed, 04 May 2022 11:26:03 +0000
Received: by outflank-mailman (input) for mailman id 320604;
 Wed, 04 May 2022 11:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mWz8=VM=arm.com=Rahul.Singh@srs-se1.protection.inumbo.net>)
 id 1nmD8r-0007ux-Sy
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 11:26:01 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0603.outbound.protection.outlook.com
 [2a01:111:f400:fe02::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f9641565-cb9c-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 13:26:00 +0200 (CEST)
Received: from DB6PR1001CA0029.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:55::15)
 by VI1PR08MB4063.eurprd08.prod.outlook.com (2603:10a6:803:e8::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Wed, 4 May
 2022 11:25:54 +0000
Received: from DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:55:cafe::8c) by DB6PR1001CA0029.outlook.office365.com
 (2603:10a6:4:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Wed, 4 May 2022 11:25:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT047.mail.protection.outlook.com (10.152.21.232) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Wed, 4 May 2022 11:25:52 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Wed, 04 May 2022 11:25:52 +0000
Received: from 7cbc38927b67.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C29148E5-7BB3-456B-BB61-D5A4B34F0857.1; 
 Wed, 04 May 2022 11:25:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cbc38927b67.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 04 May 2022 11:25:45 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::14) by VI1PR08MB3293.eurprd08.prod.outlook.com
 (2603:10a6:803:41::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Wed, 4 May
 2022 11:25:43 +0000
Received: from AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938]) by AM5PR0801MB2020.eurprd08.prod.outlook.com
 ([fe80::6c39:76a0:c05c:2938%11]) with mapi id 15.20.5206.024; Wed, 4 May 2022
 11:25:43 +0000
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
X-Inumbo-ID: f9641565-cb9c-11ec-8fc4-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Nbq1Nk3qwQrTK+FGEKiUQcJAMEIGb9y46Zb/WYN79oTUVgxkuuxLj56Wv5Nu2w72TBNPSpGv9XqB5hKRF00kfYz9k0sK5HJLVXPEecL2Gloro29dwyWrd1GGl7qqa5Sb0iLmTXHKklJXj/paHzKK+9/qI98Sr9SrySHOdpJAAHHaQB9M/YbIrSrYsgKWpZK0/HrKqkrKOa14fOQyg8RJydS6erAmWdkOcGiUty2W4locS0j562A5artC+WmS7CwQZx45+wuixn4Ikf0q1L0RdKXKqx4xkKRH4ujQt7T7Zm+mAVCyYZVkPCxPrEG21ulRE/WQ+7oSP0QgSKDtf6l0Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxDbL4q+k1vsMqGCv/KwwhS2qPBsrfbNV+N/I0uoJos=;
 b=R6Ten7IUofX73Zry3gw6FAZQGpkk/voedbu7QEEkZeUVCmlOR8ZnH9nAebbKIFdr5fxDXmkxwaoZyWKYr6IUOHNTTcf1h55Bv62b6/ZCopHzoTvS+IxGdlBaSyMRw2KI+rs+W+fscdGVbmBIkXyiCxxev4F9IkD4N29HgkB06qjfT4SSMITkVnJnMumAyaBe9OegY+7UBbT7HYDf3fFHvP4hNs2A93Q6dXVEyluCzPYCLs5XIybvc6eZ0aDVtGYT5FIbSHZ2TTheJPw/ynhIbJkIRe+etAWgOLR904yNPvcLgWTzpdZu0PQ+APcGHu+LbLwYXcx3r8MEuDLG1P9Rzg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxDbL4q+k1vsMqGCv/KwwhS2qPBsrfbNV+N/I0uoJos=;
 b=xhbk4Iqd4raj+kF7wIJgilGr9gjISPFGF4LdY3Jh1N032jOrJdzGslKEETPCjJtyHlW+/b32eluvD6Q2ynfFqOntzJpWkND7WTqTojZgQyo4IwCflSBpqPakbn+qThLF7Wtoxo03AoW9+jKkwVNve0d4J/2QavJyiz05YQbHqJg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 932b0875947538dd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcyoQ3IfqK7tTFQOTB7a1f6cV26jCpRPq5YMuMpvRGPz5UIoNuPDPwMW/tAa+UEZp5vS3bJEyd6Z9fUrsQ8ovPH9+uPgkMqJRFw/KNNdXKKTpwiT0xSTI6Ek0Nsp2Dg1JSi8v+SbfDmbpajGnUpC16en+kwyJ/dT3pPFmMND6l9dOl/jcXSVZbx82ssVgh1roHU8HDll6IQ4cCW7VFE+KoNvwSm+YdIJjaSQsv/99322129i7pEPeHbW3O+xhlVcxeCBSLrVUo4YxHh4GQGJC5UiFShNpC0IlVetHl2xXkuwxSZ5k8THGWHNfleFsf3uDe5rN7n1P50jh60VXpYvww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BxDbL4q+k1vsMqGCv/KwwhS2qPBsrfbNV+N/I0uoJos=;
 b=c2jyTVr9MnV/Axav9/iw8maJw5kS4ykjQoNabcoErREyg6J3JjR+mmBIqnvnUq5FG6exuNI1f39dC7AENwtCcxcErJv1VVFIx1qRo8DV9hgrqiaMW0ZNTzSvo6n575kLDvJ9o7RtuBbdz2+PfytqMZLJBsHc8uYrvMex7vJcR+Vx2f6VPSobXHDQIJ0WocURxHwSOU1Ck1t8cFFoC+TTX6XVU8yXdQNsMxjA7hPAFuuY1F7CyKvFzIOxn9N4KymfSFRkVn6teKBWQNwvvIbtzq2FL1AG3MonqUfulcc/8KQzFlpHXwjxxtM0pZd36wrCLOH6Kw0DApr8KA+Jy6HfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BxDbL4q+k1vsMqGCv/KwwhS2qPBsrfbNV+N/I0uoJos=;
 b=xhbk4Iqd4raj+kF7wIJgilGr9gjISPFGF4LdY3Jh1N032jOrJdzGslKEETPCjJtyHlW+/b32eluvD6Q2ynfFqOntzJpWkND7WTqTojZgQyo4IwCflSBpqPakbn+qThLF7Wtoxo03AoW9+jKkwVNve0d4J/2QavJyiz05YQbHqJg=
From: Rahul Singh <Rahul.Singh@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Topic: [PATCH] arm/its: enable LPIs before mapping the collection table
Thread-Index: AQHYWlHsf41jIOfeQ0mX6M++noloAq0NWJOAgAFGKQA=
Date: Wed, 4 May 2022 11:25:42 +0000
Message-ID: <66A4F1AF-9539-497E-A777-316D1C21E1F4@arm.com>
References:
 <7762e8e35be1f99f2a7ca81aa8cf8fc502030e7b.1651075773.git.rahul.singh@arm.com>
 <ea7e891a-6e4c-50e2-dc3f-82f373640784@xen.org>
In-Reply-To: <ea7e891a-6e4c-50e2-dc3f-82f373640784@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 6f15aa29-b21d-48f6-4c8a-08da2dc0d8fb
x-ms-traffictypediagnostic:
	VI1PR08MB3293:EE_|DB5EUR03FT047:EE_|VI1PR08MB4063:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB40637B7258EDF7627C5FCC5DFCC39@VI1PR08MB4063.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 AnK0FVtcU1tTYuZGqPqZDLW+WBvlEdsXcYdin07q7SYYX5/nkvPy4cDmm1Cr/QuXmuXvd0GlkvOpnrePrrTVVy8HPA7riZfRhcNKD8exPV9/VdbDIo9s4TcvudHI5fPkGFnbXqXih7sCa2KBhujbFmB32clE9RUJ0zMNrpA8IIJ3m02bn65bhY9LeMLrP4miwWA2jbGHVBvf1OO0FQ29feZ5RYoTzI5dtnQP6MjdWROfqu5WpDMumgPn3eVVDay00DqisdlrzyMrgKAL1nGX0NWpL8Rz46eU8TLy4OtRTZ4xhfSD/avh9Ojx78BJT+e8an2tupo9dRwKqQGDQRqc5/HamorQxpGV0pGNrThNjKk6Zle8gr5c8CAYwTzTPjSeAy34maiYHARJElMticsfXi5A1ibHtgXJ1rkDsiv4zbhep0GsdhPCr4wSHxzhFIpZ4EJeE8e4JI16L22PCUOZWZY/tMe/mIEhYuDUjClBLFYOSl9N9aDylZP2+zB5tppXU/wJ0X96su0UzuiRQ3gD/Vm2k+0UWWHvUll1GgMMfbtwfywDok99Mm+Lkj8VA9k0j06xqbtd6F5sVLwlKJFaBVYI5OiX8S+9v+kckuOuSfLjCcA5IM8jqdLA6eQqUTdXJmJyrIJHZhqm2EDOwxrQ6iwKmotFsw1UfzpSjLnv1hh3jkCZ/STeAbHjhqRmUmyDXK4NMNudueZNZeqOoKnOYNDM4BheCHOV6ICL1qh1KrxWP8J/S0yLhrBWytfwiSav
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0801MB2020.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6506007)(86362001)(2616005)(36756003)(66946007)(66556008)(66476007)(83380400001)(33656002)(53546011)(316002)(26005)(8676002)(64756008)(186003)(66446008)(76116006)(91956017)(4326008)(8936002)(6916009)(5660300002)(71200400001)(38070700005)(38100700002)(6512007)(54906003)(508600001)(6486002)(122000001)(2906002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <63EA348529398B448FD651519AAAD7C7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3293
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	20024d50-33ba-418c-8772-08da2dc0d367
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zOSWNLToRmGwG1NNXTv/uK/beWZcUYpxkoNmLGUvi/7efjHwJ6UsgPEaeY2xZCE94vaOh4LnEQNJt9Ng9dnqZ4XD/AjkRZjpjjBn+KFFe3mik/TXvMYWQh3tRIdHB5CVh1eR2UnYs/CkIO02Ifq3Jot+8tX+XSZQVE+43fkig0uyttxQwI/2EirJlnCgwWW+FwF5dP9tD0Mz7FuUsolefoQOorga7PjtMhX3N/7iOZCVvbgRWyEdKd0oE3nYioeSag7mzBR/xbMbDB7esTmbfOJFXeamHybF3ylXepKlNXgLTSe7votMwxE8EySLeHPp4lSew/ImaB0Mv+LkMvvbaynlFC9rMpqpCmqN7i8ZuLVnOmDNcIWBgQgnA7ewsvgD67CjSdXJCTkTOm+F2Hc6ZcewM34xy8EHcDEI7BpRZZjLbmZJjpZpLds+0ZbEfZOabYMpvq3uFjup+ZmV8J0svCtdUawh1X0zj8e5PDhZ5MFkKtUv8r9mvbT4VbXX5tM/ho/R6P6YvXJtXdCP3sKO2D1u5d2JMqu/kfRcxBoBGFOpJ196VfZ0WS8+cfSlC9Dp4Hu6CqrKeEWnDlJ9vhQSEUp1fCZzT9KHr1K+4wJUSzbRnmc+pF3GOQxkBO/vC8FMuldPLURDzv66ijAmeJhl5AdwX7nG9cmGEY/+x9wvX6Yw4rSDhx/Na3xBXcrOkAJa
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(5660300002)(316002)(36860700001)(86362001)(8936002)(83380400001)(54906003)(2616005)(33656002)(186003)(47076005)(336012)(81166007)(36756003)(6506007)(53546011)(2906002)(356005)(82310400005)(6512007)(70586007)(6862004)(4326008)(70206006)(8676002)(6486002)(508600001)(40460700003)(26005)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 11:25:52.3508
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f15aa29-b21d-48f6-4c8a-08da2dc0d8fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT047.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4063

Hi Julien,

> On 3 May 2022, at 4:58 pm, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Rahul,
>=20
> On 27/04/2022 17:14, Rahul Singh wrote:
>> MAPC_LPI_OFF ITS command error can be reported to software if LPIs are
>> not enabled before mapping the collection table using MAPC command.
>> Enable the LPIs using GICR_CTLR.EnableLPIs before mapping the collection
>> table.
>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>> ---
>> xen/arch/arm/gic-v3.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>> index 3c472ed768..8fb0014b16 100644
>> --- a/xen/arch/arm/gic-v3.c
>> +++ b/xen/arch/arm/gic-v3.c
>> @@ -812,11 +812,11 @@ static int gicv3_cpu_init(void)
>> /* If the host has any ITSes, enable LPIs now. */
>> if ( gicv3_its_host_has_its() )
>> {
>> + if ( !gicv3_enable_lpis() )
>> + return -EBUSY;
>=20
> gicv3_enable_lpis() is using writel_relaxed(). So in theory, the write ma=
y not be visible before gicv3_its_setup_collection() send the command.
Agree.
>=20
> So I think we need to add an smp_wmb() to ensure the ordering with a comm=
ent explaning why this is necessary.

Or maybe be we can change the writer_relaxed() to writel() that will also w=
ork.

-    writel_relaxed(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTL=
R);
+    writel(val | GICR_CTLR_ENABLE_LPIS, GICD_RDIST_BASE + GICR_CTLR);
=20


Regards,
Rahul=20


