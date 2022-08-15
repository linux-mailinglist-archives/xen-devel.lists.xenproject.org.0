Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 808BE593337
	for <lists+xen-devel@lfdr.de>; Mon, 15 Aug 2022 18:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.387680.624020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNcv4-00015G-8g; Mon, 15 Aug 2022 16:26:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 387680.624020; Mon, 15 Aug 2022 16:26:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oNcv4-00012s-5r; Mon, 15 Aug 2022 16:26:26 +0000
Received: by outflank-mailman (input) for mailman id 387680;
 Mon, 15 Aug 2022 16:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w1rB=YT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oNcv2-00012k-8Q
 for xen-devel@lists.xenproject.org; Mon, 15 Aug 2022 16:26:24 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20041.outbound.protection.outlook.com [40.107.2.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 003c327a-1cb7-11ed-924f-1f966e50362f;
 Mon, 15 Aug 2022 18:26:22 +0200 (CEST)
Received: from AM5PR0601CA0025.eurprd06.prod.outlook.com
 (2603:10a6:203:68::11) by DB6PR0802MB2168.eurprd08.prod.outlook.com
 (2603:10a6:4:84::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 15 Aug
 2022 16:26:20 +0000
Received: from AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::96) by AM5PR0601CA0025.outlook.office365.com
 (2603:10a6:203:68::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11 via Frontend
 Transport; Mon, 15 Aug 2022 16:26:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT060.mail.protection.outlook.com (100.127.140.216) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11 via Frontend Transport; Mon, 15 Aug 2022 16:26:18 +0000
Received: ("Tessian outbound 6a3290ff1310:v123");
 Mon, 15 Aug 2022 16:26:18 +0000
Received: from 60eadd56704a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0FE1719C-B1D7-4683-8243-B3E0BF5F5053.1; 
 Mon, 15 Aug 2022 16:26:11 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60eadd56704a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 15 Aug 2022 16:26:11 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PA4PR08MB6319.eurprd08.prod.outlook.com (2603:10a6:102:e8::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Mon, 15 Aug
 2022 16:26:09 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5504.025; Mon, 15 Aug 2022
 16:26:09 +0000
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
X-Inumbo-ID: 003c327a-1cb7-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=eVBVrxQkTbOA5nSnUAdjczZCv2rYOCWnAQHhTS9NWaSUKvYSCAvG5v8zzLqk7h6w7sZI5uWAINcoPBHSMmfFdd4Y8lj9F2ouX7AgxaaJkYaANbG/rI8HzgomjTvDQ5SrKkcIEe8ly+UyupLrrkcV1YdEIH21OLL9wwFuChLXHr2CsA8IOfUiSC2VRclFHkzNQ4rYCjr4XPpe8DY8J2aWJ9Ue1EEFNUxATnkMqMk2yVoEaYHsbQDmLBlzSjVcvfevrPkGF4FZIUHYEo9LYC/RCT8exaXVohDBWwL4PWFqSVmZUxycpCMOeoHsMEu9KFKfed8HhyYPWj8F7bj8Ordz2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHUlui5ehqh+eNqBwepYB92QK7qHRIZO+GcpZka7ItQ=;
 b=ETLFk/0XXiR/FOMODbUrHS+l9Bk/Y4c6Ugdi4SsC8+MJc/9/RADtWd6cXQ8xQvuE88SrZbIWrDX9dkIfJ9YLMdeg5dwfamZ2Jdfw34M+04jdZoOZIlhBZCBjIBJsMdfXLwFCASBgdDmxpDNqpO+mq5u1C2/SNjTi1X1rkNHHoWjW6oWcpJ5ErlCx54mZ3pymXAlFHx/Z6Mg17iHvwzSLayYyMmSvOHwQBPB273FrJ76/NdeqQJXFHNX4idnmvkCuA997Q81gS8lHpwm2wbgvHjLCToYGApg9e8MleTpY/S3CcqEO/CvxMOLrL9HgBKT/Tp7dsanMxY2PSBLIIF57SA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHUlui5ehqh+eNqBwepYB92QK7qHRIZO+GcpZka7ItQ=;
 b=h8rhBRR6IJXBRZFwsPKn3OqW9RL3qaWhUgELdjslOwO/0pJN0kh1E7E8tFF3biH24sWha4/9UX4m6/cI5roFM5/8OhgYbMea+qPoabEwv//6TBxjoRBlBt44UdGnTa/agTMJynpfe0HJphX4f/XYhV5KhKW2yB6pvArz76jPSbE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: c831bf9bc458aef4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2Em6iDdWUYdU1nUk4L4531+2i0PiI8R5yIbaGjs3azTMW5LzZBRUE+JndVb6/TFM8HGsqcA/IlSj1T0iCjMSRHxvigN6GIHsFQD7r8rw/djIw4hvm9hKEGJCJGXqVqS29u1YiTZMQn6BXgEy+kfh5CriVIPey1H9OgU7KEfM9sSUd3UUMRNip+CVyT+iFPJy0w8I84V98eJrDaQ/ZQREPsrwsXlosq4sfEbfScEFz+4gYMMmTxoFriUAbx1uf1EuIeuxgaBsb/FZm1QATUWmZG2WOkX4gcOddOUpTSgW0MpwL0M5YJvTOhlo80c4YT4HMWDWQWHmVqMBA0+ylZUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHUlui5ehqh+eNqBwepYB92QK7qHRIZO+GcpZka7ItQ=;
 b=kZVYuPHmQ/eJHSHj7Uis0rb1AVRu+SLugYIUBKbEHfaaUB+tolSMI1ydK6Wv6PDQikrEYIR9JIT3JtWLT6MmVRcckgQxPyaxohTLwjjNEP+lTE8/S240fapwx0e4IgTtnzOW2CLJgGNtG9+h623UeWEEvWAgK8GsnTED6TM8+M79fg+UreqnH6zsgFtA4qTAnpRviWqqK2DMjAb/8aQH87cbSKHHICzV7fsyNLZDqz+yKG1SgCWSteChm5hoOzCZrP37RiJR/Uzuyxp0IdFhvYP0NjCA8DAn4QSIZiq5o+jDplvcTlStXAMPUXzRowWxjekV4ApF82+QZea8Az850w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHUlui5ehqh+eNqBwepYB92QK7qHRIZO+GcpZka7ItQ=;
 b=h8rhBRR6IJXBRZFwsPKn3OqW9RL3qaWhUgELdjslOwO/0pJN0kh1E7E8tFF3biH24sWha4/9UX4m6/cI5roFM5/8OhgYbMea+qPoabEwv//6TBxjoRBlBt44UdGnTa/agTMJynpfe0HJphX4f/XYhV5KhKW2yB6pvArz76jPSbE=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: xen-devel <xen-devel@lists.xenproject.org>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Thread-Topic: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to
 .rodata.str
Thread-Index: AQHYroFE1VxGeWNFD0afucoI1xWJU62wKm8A
Date: Mon, 15 Aug 2022 16:26:09 +0000
Message-ID: <14EC25A8-C363-455B-B858-0298353306C9@arm.com>
References: <20220812192448.43016-1-julien@xen.org>
 <20220812192448.43016-6-julien@xen.org>
In-Reply-To: <20220812192448.43016-6-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 61c1630f-4392-4c16-d459-08da7edae225
x-ms-traffictypediagnostic:
	PA4PR08MB6319:EE_|AM7EUR03FT060:EE_|DB6PR0802MB2168:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0jj1b7mCmgv0GxCVT2tE07YYwkyArinajsdwnsrbYtDcVoMQtxbwGrkGRNclgIZEyz0j32thIo3HxHxMkwDD33pQN18tGz1XBc4rzwhUAiPUNHZR3J8mLDFePo6HG+dbJMP50qb9mfVidziXVHqyDgrFywR2zIcZ6Mb6hnDaRyIHEUvOj6Gn4ShOJISjluOX+FTF60fCecu2M4tV45B3pcwZ+HX56lL5zm+N7nnkeUQE6yiP+F0FfrIV6sYC22MScKJ9t00cRV7NYxN6T2+vyyJ2UTVM607ueXdQiTQ+qcGd+U4NYyKhLiTFm6R0zceyjnwk83vizVfVmLmfA6X9ZZtLwFoMjBHb+pwlLZUhyr8xaFFmWuvP/bSQWhyQ1ZuzQbQwIlWPsex22QbyslJ9yIsciMDGPIpCXWRoJwHmPdXqZpfyTRBvNSPO8teR+S+KT36wTGXGbrLox4T/5n8jneOwstv8PAcHkmmxl1oVHTGG3FkybQaOAnTeSDvmVosABY9vkBd0fb3uFT0yfIprPlLd2axUfdKIeYQrfkr9oT8jQa5d4+uLurvlQbag5cNnWqyx8cPBAbmgSRxZEgf6X0j2KsFCcgjz//Eh4vVy9DzRlq7U3EKY4XiIP0kM2/hGysbDpJ1VkxuTiPHPJsHNbJaVfKmDN3/XBs2wY+zq937Hs7R3OUmR0DdOhe3LniBKhabISG21v0yte1E3Nn68gyJL3aMG856V6afKVw1ZokfhB6Uqh1MtoFN1aJ2q8nv48SyrfWY/2lhznP+tILAHS6BAtd6qUiIYa5gQxRe+9Mrhsi5ArVvGPKyf05DkliNkdSdF50DqEaGIrH8TsM3hbQb8pnk11a+IlgDrCcz0QvM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(83380400001)(8936002)(71200400001)(478600001)(41300700001)(6486002)(54906003)(6916009)(66946007)(66476007)(8676002)(4326008)(64756008)(91956017)(5660300002)(316002)(66446008)(76116006)(66556008)(2906002)(38100700002)(122000001)(33656002)(36756003)(186003)(53546011)(26005)(6512007)(2616005)(38070700005)(86362001)(6506007)(142923001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3223D3CD4412224DA2D625E5272797FB@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	102d646c-8320-44a4-ad66-08da7edadc5a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B0YiPc3ZbCT3sYZJ/yvnonrtyxlfN5/4adMZaqnAVag9oMIZD/l6FVQ3p7YGnk0NusThkUkrwwF4ssBKTP+erlx2/dLHq60UCdOy3Nge/5Pp2KKWv1I0IGRdE26+FK5YBza/SOTlM/kCMGOSZ+FcOFxRB32UGGJfaTsbLP5U5GM7rSntRLGFXZtwxc/iePduk5IA+HQrm3FZkBRKxK5B05LBbZ5FKpyewPnSC3Ks+C3WZ+6lzMeyrIl1dxRRjQr6iVXBnbt1TZjHJuWaPaVkI1W/igJ0zoDGEm3ijpriZhLKvZi/IHq4C0/gqeaZq89YB6dJbMkUinMZmdi1PSEudseFPW3bGiceqdelGq9grsOewiWy0CcVew9q7+XgE9NrzpfgJqW0mIP6L1jdLJzpsRms6iyIC6vJefZxCN8w6MSzFNRP3Vu6Z0P5JJ2+uM29QkQIrrfOUQd1fuSFfFfbKipKG7HUiHtlTLQ1dQaUqzAmBu7Bmje1OAvdb3Hd9OyAxU4Q7ZiaPhg9gtezhvG7GlwgBCJXCVesH0aZRAPitpkNTd/VnJEjCcKWco+hs4lM68mtQG0Mg1CHIfIGvQWPkzQLNPTnfQa+X2YEx+NDMYLTBhECshDkGYb+rlbPkQoaN6Z8nDyuFhk1aLtUELkBiHW1ci9J3Mbu6f/7XizSa5WqhrDp/GN5etg06cghRVhphuRpde8iApSHQscWK/XqO9gLiuiRdqC6UeC858hwEauDyY/Yt+mDS/opb6xlAnf+xKhOVB+xKzXA5u7vEWIltWxw30bq5xPaNTumrdZwTLKVSmO2PfPw/ezGjjSCDZmYdyV18/OXUxSNFJ7hxd68hg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(40470700004)(356005)(40460700003)(82740400003)(81166007)(86362001)(36860700001)(83380400001)(70586007)(54906003)(4326008)(8676002)(70206006)(316002)(8936002)(6862004)(5660300002)(2906002)(82310400005)(26005)(6506007)(6512007)(2616005)(47076005)(107886003)(53546011)(336012)(40480700001)(41300700001)(186003)(6486002)(36756003)(478600001)(33656002)(142923001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 16:26:18.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61c1630f-4392-4c16-d459-08da7edae225
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2168

Hi Julien,

> On 12 Aug 2022, at 20:24, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, the strings are in text right after each use because
> the instruction 'adr' has specific requirement on the location
> and the compiler will forbid cross section label.
>=20
> The macro 'adr_l' was recently reworked so the caller doesn't need
> to know whether the MMU is on. This makes it easier to use where
> instructions can be run in both context.
>=20
> This also means that the strings don't need to be part of .text
> anymore. So move them to .rodata.str.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Tested by enabling early printk on qemu arm32 and it works so:

Tested-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

> ---
> xen/arch/arm/arm32/head.S | 12 ++++--------
> 1 file changed, 4 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 27d02ac8d68f..a558c2a6876e 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -93,13 +93,10 @@
>  */
> #define PRINT(_s)           \
>         mov   r3, lr       ;\
> -        adr   r0, 98f      ;\
> +        adr_l r0, 98f      ;\
>         bl    puts         ;\
>         mov   lr, r3       ;\
> -        b     99f          ;\
> -98:     .asciz _s          ;\
> -        .align 2           ;\
> -99:
> +        RODATA_STR(98, _s)
>=20
> /*
>  * Macro to print the value of register \rb
> @@ -736,7 +733,7 @@ ENDPROC(puts)
>  * Clobbers r0-r3
>  */
> putn:
> -        adr   r1, hex
> +        adr_l r1, hex
>         mov   r3, #8
> 1:
>         early_uart_ready r11, r2
> @@ -749,8 +746,7 @@ putn:
>         mov   pc, lr
> ENDPROC(putn)
>=20
> -hex:    .ascii "0123456789abcdef"
> -        .align 2
> +RODATA_STR(hex, "0123456789abcdef")
>=20
> #else  /* CONFIG_EARLY_PRINTK */
>=20
> --=20
> 2.37.1
>=20


