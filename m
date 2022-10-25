Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF3560C5BE
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 09:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429611.680687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEde-00053D-BR; Tue, 25 Oct 2022 07:46:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429611.680687; Tue, 25 Oct 2022 07:46:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onEde-0004zl-88; Tue, 25 Oct 2022 07:46:18 +0000
Received: by outflank-mailman (input) for mailman id 429611;
 Tue, 25 Oct 2022 07:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zbGC=22=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1onEdd-0004zf-0V
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 07:46:17 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ae61da5-5439-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 09:46:16 +0200 (CEST)
Received: from ZR0P278CA0061.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:21::12)
 by AS4PR08MB7830.eurprd08.prod.outlook.com (2603:10a6:20b:51a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 07:46:07 +0000
Received: from VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:910:21:cafe::ea) by ZR0P278CA0061.outlook.office365.com
 (2603:10a6:910:21::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Tue, 25 Oct 2022 07:46:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT003.mail.protection.outlook.com (100.127.144.82) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Tue, 25 Oct 2022 07:46:06 +0000
Received: ("Tessian outbound 73ab5f36653e:v130");
 Tue, 25 Oct 2022 07:46:05 +0000
Received: from 833335acbc57.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AFDAA6D0-80C6-42D9-B90E-22FF37AD6AEA.1; 
 Tue, 25 Oct 2022 07:45:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 833335acbc57.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Oct 2022 07:45:59 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAWPR08MB9471.eurprd08.prod.outlook.com (2603:10a6:102:2e5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Tue, 25 Oct
 2022 07:45:56 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 07:45:56 +0000
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
X-Inumbo-ID: 1ae61da5-5439-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cvzFzeMR9Cen0ubs0PesEyqLvbrfDu5hhBVtNgzz3Wjl+xkZdLGCVkzvwcrZAhuDMvU/kj8tgKHiFTKxcVZagM02jbw8Uten1z8KgCl6a/5n7TSsHOoPxTA1OljklaaVL9tpuoj+ijfq7DemGOP5S4IS7erUgatXS0ets8a5HRSGnxiF+qG7WVGv1u+OhbY2/MZ+OkvPQfhlXRA5W4AJKqIKyZqntzaFiECHrcm7BmKBYreC7zessPZupOFN7Nq7G/w04b+OqH/S/3upGuV5ULShZhjZactH0TmJUQYLngDiX5GsB3sXCTA9a8j79qMijaIZkltAKibuDy3dgbYjRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrEkbOUnR6AsXQiT84eQ7FI+jm36E9jr/4TRrok4S8U=;
 b=BJsJRET3cOJTyfonqxGKNqCgxMsXvDBbp+d1PhQat0bpvnyQsajwzL9rMeeTovWvM8f7A+kTKX4JGjPd13At6spRKwQFU2eN2pZT+I0/0AFHf6Y/DBwkTluyfwnL3EHMgq3Yptg8nea1veHSfF/GoVp2ip+K+l0yVenJPKqWzU3E/hAKE9p7yYUWjCFjJardPob5jp/SAbtXT7mMGy6dkgzQJ6UC2ZW5Ohunw51PW6G95hjrvoNOck8uNciV5dTvvPBcK2DdXvzXFvgw5vRRu9qbuaBJ/WdXm19l7vXbJYTVHMHLfRQkradnSyDPQBd7p6bQCf68tn82Y2NH61itAA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrEkbOUnR6AsXQiT84eQ7FI+jm36E9jr/4TRrok4S8U=;
 b=qyOmrbVDtnjsA0toHCTWL9tLW7VF137OWR8uUxirZdqSU7co6kpYON48SigQ+3R1zIXvHIoAa8SlHKMjB6pRwnTv4yz9h9p4WLgWy8HsgUrN8F0Lcfoju+ldKjcqJ490X6rlWf9YHhMC/HJ2YrPtKDas5B3n4NjMIWpX72kRtYs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: a4246da23ea3133d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbeL+UbyL2Jij8NBq5YTcP9SHpiEDy0gGLNfuiZJVL+N6/Fnzfoi3xspvVTVlEAYVSOBEkNuFyqUGdVRikql+rEjn+Z24u2wzUl3t5sYc9lfIUVBdG3uT7ouXflsEbjqVLr4pBkQlxeNKg7HPvTYj5ivuuVKd/LqlD2tLeqkkUkTn6+hWiujgXGjbh2oUb/gQ2ykPeXO0vqrUM/Gj3G6MKcADtj1+Mjgvsie0wawxdtm+MdNPqKRJi1NxnJXC0kjT6fb97gl18wxeDyUKigSa6vn75TBaHpCsoyFjwGJRoIwmRrBVlaYroCwCol7yMbunVD6VAQDDXcr94ILiJW09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrEkbOUnR6AsXQiT84eQ7FI+jm36E9jr/4TRrok4S8U=;
 b=I8O4BrFtAQ+oSfHEscN61KDzd6qCAuqJSnQEndYh2e19U3vlrw9HdEOazp8xcDNWlZOAXcXYR8AgZrmQ14pkAvCNjakRU3rGdVXGgkgsgONfXlA6G5o6sRxCrvBZffThOs/Fbk+EnHQArKOeCp+L7XHxNzXufbluPgbFvADXOst+69HTiC3lAyzwCBxp22dkfeQXi9e2LrR2nXeQAV1Z3cWK71lHdNeR5g1VZvS4FMPn/mCHwAzsZXSMbKK0900L/+hj3T7DK1risiYwZNJwCbcrg+8jke00SgcjRPYeGzpKTKkR3L1Bxsb/I7nCoh23ela2bdh0H8BawJ2taauaGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrEkbOUnR6AsXQiT84eQ7FI+jm36E9jr/4TRrok4S8U=;
 b=qyOmrbVDtnjsA0toHCTWL9tLW7VF137OWR8uUxirZdqSU7co6kpYON48SigQ+3R1zIXvHIoAa8SlHKMjB6pRwnTv4yz9h9p4WLgWy8HsgUrN8F0Lcfoju+ldKjcqJ490X6rlWf9YHhMC/HJ2YrPtKDas5B3n4NjMIWpX72kRtYs=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: Deadcode discussion based on Arm NS phys timer
Thread-Topic: Deadcode discussion based on Arm NS phys timer
Thread-Index:
 AQHY54gZ+lETtnfh9UiF8D+fGFbI5q4dXjCAgAANxICAAB5kgIAAySOAgABfjwCAAAmGgA==
Date: Tue, 25 Oct 2022 07:45:56 +0000
Message-ID: <06D2C614-0F17-4364-BE52-FB0DB51D097B@arm.com>
References: <d55938a3-aaca-1d01-b34f-858dbca9830b@amd.com>
 <8691e100-4548-9752-8e7e-b292643cae83@xen.org>
 <6aefd6d6-45a2-a1f3-24da-8bbbba22fc08@amd.com>
 <aff58db0-646c-6699-48af-033e28c5626f@xen.org>
 <alpine.DEB.2.22.394.2210241819420.1151068@ubuntu-linux-20-04-desktop>
 <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
In-Reply-To: <ed0bf3da-fe9f-e00c-9bc3-35e10840701e@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAWPR08MB9471:EE_|VI1EUR03FT003:EE_|AS4PR08MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: f2a39f5b-f285-4058-bd99-08dab65cf96e
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 YsWyCbvaOUuLVOiR71hfchndD4GSpJIOGI+EF3q/LQ7/JkJQgV+tBqPco+r6UGTtk5KxkFPkRuCjkXqhYl3WTU7MUdZZ4l7sjED1VRHR8g9s11INjFsmIIFymJmDCb+p85BWL6VwVgehy3iqP2mHYxq39Gc9SnPqMTiQN9dUGPHBsZKy6tn1GVE0htSgQNZvT41NuQpIk0QHAKPK2qRGL73c4FgRZPQ5+8z8JaX5r+i/3kl/xlYhAETjLlUflxgMtETdzDrZBwFYqnsuPC0+CL/oEcwOF7PksCfw+jyquSfjvhNmuo2JdSjJyuGglejw4v+LMl7jAydTX1EHExomZ7ABsl5GAt0EvzR+bF0tT4W70rR5xK68AmZ/+Okynk56BmvomaxzmD8xtDSgnlF63AIuibAHPvHT2TXl0St2ET3phVQdOUu3WJyiEcIbdiPOP+iIZn6m8DR+Yr0pvmilUbZCn/p7nsg+9GWrG1MH1fg6ySsBa0rwm65Ow3S96P6QaYHux1FgiPfplzJoYLuIXcvTsP/XVPO8DukR10GMq/0gsat0SZc/9Z52WBdUDh1n/+r8dYMTvp9/2ZmIY66j19gi25Bf+SMuSr+8fw/p9isoWuUSbIoqg3HMrbScGk1AHFK7zeeZKP4KPHCb8JYykq+/YsMwTgqOf8CIYl0o/AoRoZZZl3aXrpkHojonLtxoLSXvm49UtUh3mASVq96bor7baaBle3JSic6l0LQbqyowhxFNSmF2fTEaAYnypVA2IbMStMnSt85aQTADVn9ttJNTkt81vJGzQ1U1PI7Bibs=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199015)(66899015)(41300700001)(54906003)(478600001)(5660300002)(6486002)(33656002)(8936002)(83380400001)(38070700005)(38100700002)(8676002)(2906002)(36756003)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(71200400001)(316002)(6916009)(76116006)(91956017)(6512007)(2616005)(186003)(26005)(122000001)(86362001)(6506007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4F19440A11D6BF4CB6362C26B64F0C1A@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9471
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ca4ac37c-956e-4842-d61e-08dab65cf34e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PGiL5DhRmStOESvBrFiVwJXfvRmppHTxSmb3YMV8NLBmE/2LvWFjJa79KJLWCKZr4VEwd4+nhvwthOMqBktSoG9Rg8jPSW72fdR0LyCjblnJTPwMNr0ByQ9bt9N70H12U9z11OAR9pZ5c7l4mP1+tLsHenuk/+PPTDr6BCLShg+FHZX8i6zhU2GaGPZ2pYWH8jesxeJbDIP4Asl8z74ax9IHe1Go+R+aQOvcYkQNEvoLYwGT7gipmkcoodep19jpeOfwhACWYJ259A/W9GztQRaU90zscMATwbSOaYZk/4ljHTU/LE7sUJnclmh6Jd/UOBtB7E7TsC+YfP+BuHZclXiHEoSuXcqSPZ0I+1tLWqKXP6vN+7BE1OUPhiafKtpXPhMDUc6XpotbTb52j/pcfnWK/28yv7W/VoI2RL16L/v5xkU4fJxmFXYcH1/Vqja5bOKDbTcfjHSEL2tpHOtlPjXf2mknqzF5LDdFWJ+v9tPvBc2s2+LnCePAUMB/Itt/GAaKcXvfoBnjXW0z5aEhEd+CqpJjcZjis4SocLFsscbQvZ/nCQkKRojLtToIIEtWx3TMOkPwS+NM2AAMoh0k7dsDt5CyaBlWbiRdJ7NBARasO/jgOXvP7cK9cZDS4ftiGW1vwYV0HiUc+V0nxcYifB99B/SWgmDGP5xIOVj5ZxTEe72/YvDf9VrjBiorftTm6J8Fz2zoCiyrFKW+Yf2/uNv4HHTI8Q7GwDn3WmaGi03WXUAd6RSNaeHff3Q+96PvEgB32UqqVErgRF9si7l60Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(66899015)(36756003)(186003)(33656002)(83380400001)(8936002)(4326008)(70206006)(8676002)(2906002)(6862004)(70586007)(5660300002)(54906003)(41300700001)(86362001)(40480700001)(316002)(81166007)(2616005)(356005)(6506007)(40460700003)(53546011)(26005)(6512007)(47076005)(82740400003)(36860700001)(336012)(478600001)(6486002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:46:06.2971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2a39f5b-f285-4058-bd99-08dab65cf96e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7830

Hi Michal,

> On 25 Oct 2022, at 08:11, Michal Orzel <michal.orzel@amd.com> wrote:
>=20
> Hi,
>=20
> On 25/10/2022 03:29, Stefano Stabellini wrote:
>>=20
>>=20
>> On Mon, 24 Oct 2022, Julien Grall wrote:
>>>> On 24/10/2022 12:51, Julien Grall wrote:
>>>>> Caution: This message originated from an External Source. Use proper
>>>>> caution when opening attachments, clicking links, or responding.
>>>>>=20
>>>>>=20
>>>>> On 24/10/2022 10:07, Michal Orzel wrote:
>>>>>> Hello,
>>>>>=20
>>>>> Hi Michal,
>>>>>=20
>>>>>> Recently I came across a deadcode in Xen Arm arch timer code. Briefl=
y
>>>>>> speaking, we are routing
>>>>>> the NS phys timer (CNTP) IRQ to Xen, even though Xen does not make u=
se
>>>>>> of it (as it uses the hypervisor timer CNTHP).
>>>>>> This timer is fully emulated, which means that there is nothing that=
 can
>>>>>> trigger such IRQ. This code is
>>>>>> a left over from early days, where the CNTHP was buggy on some model=
s
>>>>>> and we had to use the CNTP instead.
>>>>>>=20
>>>>>> As far as the problem itself is not really interesting, it raises a
>>>>>> question of what to do with a deadcode,
>>>>>> as there might be/are other deadcode places in Xen.
>>>>>=20
>>>>> There are multiple definition of deadcode. Depending on which one you
>>>>> chose, then this could cover IS_ENABLED() and possibly #ifdef. So thi=
s
>>>>> would result to a lot of places impacted with the decision.
>>>>>=20
>>>>> So can you clarify what you mean by deadcode?
>>>> In the timer example, I think we have both a deadcode and unreachable =
code.
>>>> For the purpose of this discussion, let's take the MISRA definition of=
 a
>>>> deadcode which is a "code that can be executed
>>>> but has no effect on the functional behavior of the program". This dif=
fers
>>>> from the unreachable code definition that is
>>>> a "code that cannot be executed". Setting up the IRQ for Xen is an exa=
mple
>>>> of a deadcode. Code within IRQ handler is an unreachable code
>>>> (there is nothing that can trigger this IRQ).
>>>>=20
>>>> What I mean by deadcode happens to be the sum of the two cases above i=
.e.
>>>> the code that cannot be executed as well as the code that
>>>> does not impact the functionality of the program.
>>>>=20
>>>>>=20
>>>>>> One may say that it is useful to keep it, because one day,
>>>>>> someone might need it when dealing with yet another broken HW. Such
>>>>>> person would still need to modify the other
>>>>>> part of the code (e.g. reprogram_timer), but there would be less wor=
k
>>>>>> required overall. Personally, I'm not in favor of
>>>>>> such approach, because we should not really support possible scenari=
os
>>>>>> with broken HW (except for erratas listing known issues).
>>>>>=20
>>>>> The difference between "broken HW" and "HW with known errata" is a bi=
t
>>>>> unclear to me. Can you clarify how you would make the difference here=
?
>>>>>=20
>>>>> In particular, at which point do you consider that the HW should not =
be
>>>>> supported by Xen?
>>>> I'm not saying that HW should not be supported. The difference for me
>>>> between broken HW and
>>>> HW with known errata is that for the former, the incorrect behavior is=
 often
>>>> due to the early support stage,
>>>> using emulators/models instead of real HW, whereas for the latter, the=
 HW is
>>>> already released and it happens to be that it is buggy
>>>> (the HW vendor is aware of the issue and released erratas).
>>>=20
>>> Thanks for the clarification. What I would call broken is anything that=
 can't
>>> be fixed in software. For a not too fictional example, an HW where PCI =
devices
>>> are using the same stream ID. So effectively, passthrough can't be safe=
ly
>>> supported.
>>>=20
>>> Regarding, not yet released HW, I don't think Xen should have workaroun=
d for
>>> them. I wouldn't even call it "broken" because they are not yet release=
d and
>>> it is common to have bug in early revision.
>>>=20
>>>> Do we have any example in Xen for supporting broken HW,
>>>> whose vendor is not aware of the issue or did not release any errata?
>>> I will not cite any HW on the ML. But from my experience, the vendors a=
re not
>>> very vocal about issues in public (some don't even seem to have public =
doc).
>>> The best way to find the issues is to look at Linux commit.
>>>=20
>>>>=20
>>>>>=20
>>>>>> Also, as part of the certification/FUSA process, there should be no
>>>>>> deadcode and we should have explanation for every block of code.
>>>>>=20
>>>>> See above. What are you trying to cover by deadcode? Would protecting
>>>>> code with IS_ENABLED() (or #ifdef) ok?
>>>> I think this would be ok from the certification point of view (this wo=
uld at
>>>> least means, that we are aware of the issue
>>>> and we took some steps). Otherwise, such code is just an example of a
>>>> deadcode/unreachable code.
>>>=20
>>> Thanks for the clarification. So the exact approach will depend on the
>>> context....
>>>=20
>>>>>> There are different ways to deal with a deadcode: > 1. Get rid of it
>>>>>> completely
>>>>>> 2. Leave it as it is
>>>=20
>>> ... this is my preference in the context of the timer.
>>=20
>> From a certification point of view, the fewer lines of code the better,
>> and ideally all the lines of code used for the certified build should be
>> testable and used.
>>=20
>> So I think 2. is the lest useful option from a certification
>> perspective. For this reason, I'd prefer another alternative.
>>=20
>>=20
>>> If the other don't like it, then 1 would be my preference.
>>>=20
>>> In general, my preference would be either 3.3 or 3.2 (see below).
>>=20
>> I also think that 3.2 and 3.3 are good options for the general case. For
>> the timer, I can see why 1 is your (second) preference and I am fine
>> with 1 as well.
> Ok, sounds good to me. Let's still give Bertrand the chance to share his =
opinion.

We need to get rid of dead code and removing it is not always the best solu=
tion.

If the code is or could be useful for someone some day, protecting it with =
ifdef is ok.

In the mid term we will have to introduce a lot more ifdef or IS_ENABLED in=
 the
code so that we can compile out what we do not need and code not applying t=
o
some hardware is a case where we will do that (does not mean that by defaul=
t
we will not compile it in but we will make it easier to reduce the code siz=
e for a
specific use case).

So 3.2 and 3.3 are ok for me.

>=20
>>=20
>>=20
>>>>>> 3. Admit that it can be useful one day and:
>>>>>>    3.1. protect it with #if 0
>>>=20
>>> #if 0 should not be used in Xen code. IMHO this is the worse of all the=
 world.
> I share your opinion here Julien. Unfortunately we still have quite a few=
 examples
> in the Arm code using this either to mark something as TODO or to comment=
 out
> parts of the code waiting for future support. This is mostly in SMMU code=
 that
> was taken from Linux but already diverged quite far (maybe some cleanup i=
s necessary).

Definitely the SMMU code will need some cleaning.
#if 0 are a no go from a certification point of view.

Cheers
Bertrand

>=20
>>>=20
>>>>>>    3.2. protect it with a new Kconfig option (disabled by default)
>>>>>> using #ifdef
>>>>>>    3.3. protect it with a new Kconfig option (disabled by default)
>>>>>> using IS_ENABLED (to make sure code always compile)
>>>=20
>>> I would prefer 3.3 over 3.2. 3.2 would be used if it is too difficult t=
o get
>>> the code compiled when !IS_ENABLED.
>>>=20
>>> Similar to one if this is to move all the affected code in a separate f=
ile
>>> with using obj-$(CONFIG...). That would only work for large chunk of co=
de and
>>> would be preferred over 3.2.
>>=20
>=20
> ~Michal


