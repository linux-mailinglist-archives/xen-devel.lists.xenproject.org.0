Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE535749AD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jul 2022 11:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.367191.598249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvVo-0001o8-42; Thu, 14 Jul 2022 09:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 367191.598249; Thu, 14 Jul 2022 09:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBvVn-0001l6-VV; Thu, 14 Jul 2022 09:51:59 +0000
Received: by outflank-mailman (input) for mailman id 367191;
 Thu, 14 Jul 2022 09:51:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lagp=XT=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1oBvVl-0001kx-LE
 for xen-devel@lists.xenproject.org; Thu, 14 Jul 2022 09:51:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2084.outbound.protection.outlook.com [40.107.22.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b2d550-035a-11ed-924f-1f966e50362f;
 Thu, 14 Jul 2022 11:51:56 +0200 (CEST)
Received: from AS9PR04CA0099.eurprd04.prod.outlook.com (2603:10a6:20b:50e::22)
 by AM6PR08MB3109.eurprd08.prod.outlook.com (2603:10a6:209:4c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.25; Thu, 14 Jul
 2022 09:51:52 +0000
Received: from AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50e:cafe::fd) by AS9PR04CA0099.outlook.office365.com
 (2603:10a6:20b:50e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15 via Frontend
 Transport; Thu, 14 Jul 2022 09:51:52 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT028.mail.protection.outlook.com (10.152.16.118) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.15 via Frontend Transport; Thu, 14 Jul 2022 09:51:52 +0000
Received: ("Tessian outbound 13cb25bfb745:v122");
 Thu, 14 Jul 2022 09:51:51 +0000
Received: from 0769022c8349.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5157D8C2-6705-4201-988B-DAD50528093A.1; 
 Thu, 14 Jul 2022 09:51:45 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0769022c8349.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 14 Jul 2022 09:51:45 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by AM9PR08MB6786.eurprd08.prod.outlook.com (2603:10a6:20b:305::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Thu, 14 Jul
 2022 09:51:42 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::f474:4549:1f7a:b89a%4]) with mapi id 15.20.5417.026; Thu, 14 Jul 2022
 09:51:42 +0000
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
X-Inumbo-ID: 98b2d550-035a-11ed-924f-1f966e50362f
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HLqUsFHpphnOft5zKc4KkrJ3cji0v6fhO1uOh4dfdrsP+SlJqI3R31ynlStHDWjr9qp9+2MJjMy9qi7Cr9LyW4tuacpE60tHf79waPeh2++w8piUdoFTqV1V7Ild4cp58LsCJ8fPHN5R8zzEjyrNQbQZ+NovVKAdKMvU7m+PgPaXuU/sHGRGB7/hPR4nH6awRSfkzvxPTnB3YgAnnEg/OytdTP5LUIG8gxQujp6cyYzjeaHJm+F3Zpcz1LNhlFmuFIXUI+RapvzqP5Qv2MuWHbgo4rGm/GQYFdJ864oYSAFr0Wfh5lxMXctadcbOoIEykkWn+24e6TvQ5+kJy1+1TA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nea4bKN61ggX/ruB7EyI5rRgdfsfvJOym339G2AR42U=;
 b=W19N67WQCfwFJ98FkX7jxmfTZnkNIe5WSmVGtt7F5ZxdNtP2NW0HPFoGkbrmDGGK7LVm+2rLexW3X2sGA907/QoInPqgyQkxKfYIjFCUM4ZSZVd7MDrVKWtmYGEmC7UI6A8XgZbjAmGTTNc4A/zCkQkZHUlBfvpIt0w+zB7E+GKo7bRMZZdMBEI+vLQE2xGcVhapbuymprx7QDTv7uBFGWwmiJ7CsKzUOpyFbm713PdkbiptFlR+wvVoD5VyKiQNMJwuN3ZytpFH5ERvHcmMLrnPG2LXkdi2Pw+5HYXustPf52txnJspx2yy41GNjWYXDM+8sI6KDqGH7rEk3B+seg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nea4bKN61ggX/ruB7EyI5rRgdfsfvJOym339G2AR42U=;
 b=kY+4qCNDFPDAwRMSmAzVjvQ/jgOkKhFQ5wzYOauGfUzPvdfdieJzfHtVL2Bef9otF/tosKxR2bB/JqrZEWni0zAALKeCRRU29TsXJcbrodQDOAqDftjFwVu5K5Rt1P+2ULvLJwWYOG6OmbR1lYIfM946sJBvHzCYaQdn1HpVFb8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 41da30b9bb5525c0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqqFfblLygbO4Vnd6xm3j+h2u2W6tmMXryB0A7179Uk6dOKaq5/2wnyDY9tLBwO3E/4ed0kOppTmZnDnjQ4ulTztSrX+I2ONM5bSB6jaA9+xUf0VAfPUtPVHSIKQ+aGuCUIpAwdUH8vMKuVuQR6ATcFSpCZGVhY8vumt5fWYoLLO4D3pWPtRHUdeanXn6GvheiIxCvic74VceDjGxSyh4q52YFHg2hl3I+4l3wF+bCpjDzywUeXgv7HXwahWWYgUFFen3pMc2n82JLQX4VdA2jkKwVxmm4SpYXflkKEi2/aYG2COP7PbS4Z36mPFCZ4ySzJr1o4LjvE3l83hIgzrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nea4bKN61ggX/ruB7EyI5rRgdfsfvJOym339G2AR42U=;
 b=TBKVaBDv5SfXcecyH83EN7HP95n5uBiihlKdoaeHdQ6y2zFLBHca7j6+Hoi5taz+IkUiOnIPXDwbKCnPpGoqBW5MjZYZ+18I2eqhW10XAW2R8qe1pM7Pp07ny7ltV2zmvDhLJ8JSp7TyQ/rlgPyggmv8xgKYf9yX0NnfoqUgUDlhPG2su41nxS1oS7IzssqYyYs/B+wAMQ6AhUadZSjDLInNy9SVdtOqebn4423ghH7UND+r90VyFtxap7XVmqsEJZ/OxokDSEkbZ2oNqgXZPhV0FGsMpYADT5Wcmn/ecQOg2m86BVu9kYzYCZuExCZuluB0MiVEzrbDPwmU7qxKdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nea4bKN61ggX/ruB7EyI5rRgdfsfvJOym339G2AR42U=;
 b=kY+4qCNDFPDAwRMSmAzVjvQ/jgOkKhFQ5wzYOauGfUzPvdfdieJzfHtVL2Bef9otF/tosKxR2bB/JqrZEWni0zAALKeCRRU29TsXJcbrodQDOAqDftjFwVu5K5Rt1P+2ULvLJwWYOG6OmbR1lYIfM946sJBvHzCYaQdn1HpVFb8=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 2/2] xen/arm: add FF-A mediator
Thread-Topic: [PATCH v4 2/2] xen/arm: add FF-A mediator
Thread-Index: AQHYhj32JXXtKHb7m068zMJ/M+86kK19wigA
Date: Thu, 14 Jul 2022 09:51:42 +0000
Message-ID: <2E5B1159-9569-40D9-9BA1-92022378B9C6@arm.com>
References: <20220622134219.1596613-1-jens.wiklander@linaro.org>
 <20220622134219.1596613-3-jens.wiklander@linaro.org>
In-Reply-To: <20220622134219.1596613-3-jens.wiklander@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.100.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 9bd5a8ff-75ff-4508-6570-08da657e7a7d
x-ms-traffictypediagnostic:
	AM9PR08MB6786:EE_|AM5EUR03FT028:EE_|AM6PR08MB3109:EE_
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gJAkM1yavwmEtOQGkB8mXoOb0tTVqCW4qHorAqSZCfmDbc5Vu+SiENZy2grgzKtHNhMwSpL6YssDK++dkKMsj2V/Sgncs+MpMMqn+tY8y0E1Y2bcCs+yEmey966WhIEmn/gj9f952ezXJr+l8rltTv1rJ7vWLemM5sy00zagxUdd96/WiNYO+Jg8mwBkEmSJ3ExXo4ctHk1eGbhfKQYyD4wdRx75KRFwICVYX9z9kW1xKwfnwpRqODUOo4KV+ZWJRmvpxizVYrDRVZgmrhFFc5cV6cb7mNCXUEKWofO+PSfSEl7b6u8YEGEPdYVk07Bce0q423RsJLdhFCl6wknrLEaIoLfKn3/x2ztP3aiTxFOV2jKSKVw7dHKokNoRVMRQiNENjYWk7r6V+9NXmSWY/gH7+mKEH+jBGMlnqBqRw5qWxKlytObscH29OQIci2Z6VSe2CuqwGdsVrm8p6HK3CaJ8+RUDNY4DxxcCmq5jX7R+sfR4/kXgPH3BKhavp52YxekZdI2eLiOZC+kULZ3lRDP8O6gir3sk2hX98l6v9AGYbQ5WCRpc6rMb3zuzTN54Qde8qlsgc2EWVQawI/Tmp+HxqjAwycDMMGjTOyBZzl5IN5cGOxs0H31FhEm22Ze1B41wdOKn3X5ZzkaTXMZbsJHmGJTL4UOLS2F81un+I/Mgk2yaRpk5fdeU8Qp2CC2xnWrguvyYISQMTFsEhjEUL9QjRyxm6mx+SJ2nJDyOgNXXOLpmAmV4SQJz7JT6JSbWKzQl4dteBlI3urxRO8g9sXKOZoplJZcLkJ62GJks/v7I/WZWdp+laptC11+g/4SMyLIvOeMDXjWO05T3ngRyXs7cHA9KXVIExNrUd4NDudzXFZm1LRCgx6Ijwkg6WIEK
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(396003)(366004)(376002)(136003)(478600001)(6486002)(53546011)(66476007)(6512007)(6916009)(6506007)(86362001)(54906003)(66946007)(64756008)(66556008)(66446008)(26005)(41300700001)(5660300002)(76116006)(91956017)(966005)(71200400001)(122000001)(316002)(38100700002)(36756003)(38070700005)(83380400001)(8676002)(2616005)(2906002)(8936002)(186003)(30864003)(4326008)(33656002)(45980500001)(579004)(559001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <08BEF9EF1B99234E9F1A1BE52AAEF9B1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6786
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	94217cb2-cf89-49a0-1537-08da657e74c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dFuYpU23sRcnG5MSOB5c75h7CzF81nzLi8OE2znNoIzHdphf5yICrfvH/TTxwWZZ6rCQEV5/6J2X6BP6JULGTZGUKQiLiJUxjJywoNFZqKzS7i0HbwTs2ZxD9XkqUx0uPu4XG7bAXl4zJEY28HmOGLv5bqSduD0NLzW+BfgHDbwPU81W/Lr3moDueRQFd4BGqTXBu3xP5YRHGST6G+7xA1urciOq/f7UxWtKYdcwlRZiWYpLrVgqPYbn+vRAzINHIkMWkJXADhJU4WpF3WFV6aOIxBJzV5DyikpWqLs65O0vVQhA0VHRbnIVLI0uv6TrwuQFv6jocif0OEA0HMBK2REuF22dWlRw4LaJaJKHsZzOr0jEJQJ/G8IwN0D4xq2IQyUKOFrTn81SZi1NyHtnLQ6jRHOMrZw8CwnHPYa0Iv3CvvPJOn/D77+kBPogOSY+RI4WNMwOJKG5n8Hin3bSZ8Ne3sBaZxTyGTdp1hzfN4TNTkeXssFecjlhj+SPYVtUvc7zTR+L6Cla5S1LqPo5S03C7b1FHo6MsYMo4RWj5ArtBOZHNA8tlb0xUhtRb7Glrb0zVfwMl6BHJN2p4y042ZNqrjHSp9Mb1/Iq7sU37ZMMU2v51B/iM/5xWHj8aXLT8e4x0jE9Vz+pW1+wJRrDN6k/dcKB/1kIhqbjjoVMp/NF/xzOr1U8RDJT2q2bqXDpkAtz1FqMrHC5O7R1xIP6Es/FmHxJx9Jxg4Uhuh0awhY1OXIUehwb/SIE78ODOmOfAvPS4UrTwP60SU9EM4WXj0Oe/cOFSluah5K2VXLB5WJvWnwYLl35gyYhVzSruDWW/yj4buzuCW5AZ0rkZwq04ufj7g/JGnmzvN+WXNkY084=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(46966006)(40470700004)(36840700001)(81166007)(966005)(82310400005)(40460700003)(2906002)(30864003)(478600001)(82740400003)(6486002)(356005)(8676002)(70206006)(4326008)(70586007)(41300700001)(6512007)(316002)(83380400001)(107886003)(26005)(336012)(8936002)(36860700001)(54906003)(5660300002)(47076005)(2616005)(53546011)(86362001)(6862004)(6506007)(33656002)(40480700001)(186003)(36756003)(579004)(559001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 09:51:52.0888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd5a8ff-75ff-4508-6570-08da657e7a7d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3109

Hi Jens,

> On 22 Jun 2022, at 14:42, Jens Wiklander <jens.wiklander@linaro.org> wrot=
e:
>=20
> Adds a FF-A version 1.1 [1] mediator to communicate with a Secure
> Partition in secure world.
>=20
> The implementation is the bare minimum to be able to communicate with
> OP-TEE running as an SPMC at S-EL1.
>=20
> This is loosely based on the TEE mediator framework and the OP-TEE
> mediator.
>=20
> [1] https://developer.arm.com/documentation/den0077/latest
> Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>

I spent quite some time on this patch and on the spec and there are far to
much code and concepts introduced here to be able to do a review in one go.

Could you try to split the patch to introduce each concept in a specific pa=
tch ?
I would suggest something like introducing each call in its own patch, havi=
ng
a specific patch for the tool support, etc.

At this stage I am not convinced that there is no issue here where a guest =
could
access information from an other guest and reviewing smaller patches will h=
elp
me following the spec for each subject and ask questions along the way.

Cheers
Bertrand

> ---
> SUPPORT.md                        |    7 +
> tools/libs/light/libxl_arm.c      |    3 +
> tools/libs/light/libxl_types.idl  |    1 +
> tools/xl/xl_parse.c               |    3 +
> xen/arch/arm/Kconfig              |   11 +
> xen/arch/arm/Makefile             |    1 +
> xen/arch/arm/domain.c             |   10 +
> xen/arch/arm/domain_build.c       |    1 +
> xen/arch/arm/ffa.c                | 1683 +++++++++++++++++++++++++++++
> xen/arch/arm/include/asm/domain.h |    4 +
> xen/arch/arm/include/asm/ffa.h    |   71 ++
> xen/arch/arm/vsmc.c               |   17 +-
> xen/include/public/arch-arm.h     |    2 +
> 13 files changed, 1811 insertions(+), 3 deletions(-)
> create mode 100644 xen/arch/arm/ffa.c
> create mode 100644 xen/arch/arm/include/asm/ffa.h
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 70e98964cbc0..215bb3c9043b 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -785,6 +785,13 @@ that covers the DMA of the device to be passed throu=
gh.
>=20
> No support for QEMU backends in a 16K or 64K domain.
>=20
> +### ARM: Firmware Framework for Arm A-profile (FF-A) Mediator
> +
> +    Status, Arm64: Tech Preview
> +
> +There are still some code paths where a vCPU may hog a pCPU longer than
> +necessary. The FF-A mediator is not yet implemented for Arm32.
> +
> ### ARM: Guest Device Tree support
>=20
>     Status: Supported
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index eef1de093914..a985609861c7 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -101,6 +101,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>         return ERROR_FAIL;
>     }
>=20
> +    config->arch.ffa_enabled =3D
> +        libxl_defbool_val(d_config->b_info.arch_arm.ffa_enabled);
> +
>     return 0;
> }
>=20
> diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_ty=
pes.idl
> index 2a42da2f7d78..bf4544bef399 100644
> --- a/tools/libs/light/libxl_types.idl
> +++ b/tools/libs/light/libxl_types.idl
> @@ -646,6 +646,7 @@ libxl_domain_build_info =3D Struct("domain_build_info=
",[
>=20
>     ("arch_arm", Struct(None, [("gic_version", libxl_gic_version),
>                                ("vuart", libxl_vuart_type),
> +                               ("ffa_enabled", libxl_defbool),
>                               ])),
>     ("arch_x86", Struct(None, [("msr_relaxed", libxl_defbool),
>                               ])),
> diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
> index b98c0de378b6..e0e99ed8d2b1 100644
> --- a/tools/xl/xl_parse.c
> +++ b/tools/xl/xl_parse.c
> @@ -2746,6 +2746,9 @@ skip_usbdev:
>             exit(-ERROR_FAIL);
>         }
>     }
> +    libxl_defbool_setdefault(&b_info->arch_arm.ffa_enabled, false);
> +    xlu_cfg_get_defbool(config, "ffa_enabled",
> +                        &b_info->arch_arm.ffa_enabled, 0);
>=20
>     parse_vkb_list(config, d_config);
>=20
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index be9eff014120..e57e1d3757e2 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -139,6 +139,17 @@ config TEE
>=20
> source "arch/arm/tee/Kconfig"
>=20
> +config FFA
> +	bool "Enable FF-A mediator support" if EXPERT
> +	default n
> +	depends on ARM_64
> +	help
> +	  This option enables a minimal FF-A mediator. The mediator is
> +	  generic as it follows the FF-A specification [1], but it only
> +	  implements a small subset of the specification.
> +
> +	  [1] https://developer.arm.com/documentation/den0077/latest
> +
> endmenu
>=20
> menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index bb7a6151c13c..af0c69f793d4 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -20,6 +20,7 @@ obj-y +=3D domain_build.init.o
> obj-y +=3D domctl.o
> obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
> obj-y +=3D efi/
> +obj-$(CONFIG_FFA) +=3D ffa.o
> obj-y +=3D gic.o
> obj-y +=3D gic-v2.o
> obj-$(CONFIG_GICV3) +=3D gic-v3.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df8638..a3f00e7e234d 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -27,6 +27,7 @@
> #include <asm/cpufeature.h>
> #include <asm/current.h>
> #include <asm/event.h>
> +#include <asm/ffa.h>
> #include <asm/gic.h>
> #include <asm/guest_atomics.h>
> #include <asm/irq.h>
> @@ -756,6 +757,9 @@ int arch_domain_create(struct domain *d,
>     if ( (rc =3D tee_domain_init(d, config->arch.tee_type)) !=3D 0 )
>         goto fail;
>=20
> +    if ( (rc =3D ffa_domain_init(d, config->arch.ffa_enabled)) !=3D 0 )
> +        goto fail;
> +
>     update_domain_wallclock_time(d);
>=20
>     /*
> @@ -998,6 +1002,7 @@ static int relinquish_memory(struct domain *d, struc=
t page_list_head *list)
> enum {
>     PROG_pci =3D 1,
>     PROG_tee,
> +    PROG_ffa,
>     PROG_xen,
>     PROG_page,
>     PROG_mapping,
> @@ -1043,6 +1048,11 @@ int domain_relinquish_resources(struct domain *d)
>=20
>     PROGRESS(tee):
>         ret =3D tee_relinquish_resources(d);
> +        if ( ret )
> +            return ret;
> +
> +    PROGRESS(ffa):
> +        ret =3D ffa_relinquish_resources(d);
>         if (ret )
>             return ret;
>=20
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7ddd16c26da5..d708f76356f7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3450,6 +3450,7 @@ void __init create_dom0(void)
>     if ( gic_number_lines() > 992 )
>         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>     dom0_cfg.arch.tee_type =3D tee_get_type();
> +    dom0_cfg.arch.ffa_enabled =3D true;
>     dom0_cfg.max_vcpus =3D dom0_max_vcpus();
>=20
>     if ( iommu_enabled )
> diff --git a/xen/arch/arm/ffa.c b/xen/arch/arm/ffa.c
> new file mode 100644
> index 000000000000..3117ce5cec4d
> --- /dev/null
> +++ b/xen/arch/arm/ffa.c
> @@ -0,0 +1,1683 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A (FF-A) mediator
> + *
> + * Copyright (C) 2022  Linaro Limited
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=
.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <xen/domain_page.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +#include <xen/sizes.h>
> +#include <xen/bitops.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/event.h>
> +#include <asm/ffa.h>
> +#include <asm/regs.h>
> +
> +/* Error codes */
> +#define FFA_RET_OK			0
> +#define FFA_RET_NOT_SUPPORTED		-1
> +#define FFA_RET_INVALID_PARAMETERS	-2
> +#define FFA_RET_NO_MEMORY		-3
> +#define FFA_RET_BUSY			-4
> +#define FFA_RET_INTERRUPTED		-5
> +#define FFA_RET_DENIED			-6
> +#define FFA_RET_RETRY			-7
> +#define FFA_RET_ABORTED			-8
> +
> +/* FFA_VERSION helpers */
> +#define FFA_VERSION_MAJOR		_AC(1,U)
> +#define FFA_VERSION_MAJOR_SHIFT		_AC(16,U)
> +#define FFA_VERSION_MAJOR_MASK		_AC(0x7FFF,U)
> +#define FFA_VERSION_MINOR		_AC(1,U)
> +#define FFA_VERSION_MINOR_SHIFT		_AC(0,U)
> +#define FFA_VERSION_MINOR_MASK		_AC(0xFFFF,U)
> +#define MAKE_FFA_VERSION(major, minor)	\
> +	((((major) & FFA_VERSION_MAJOR_MASK) << FFA_VERSION_MAJOR_SHIFT) | \
> +	 ((minor) & FFA_VERSION_MINOR_MASK))
> +
> +#define FFA_MIN_VERSION		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_0		MAKE_FFA_VERSION(1, 0)
> +#define FFA_VERSION_1_1		MAKE_FFA_VERSION(1, 1)
> +#define FFA_MY_VERSION		MAKE_FFA_VERSION(FFA_VERSION_MAJOR, \
> +						 FFA_VERSION_MINOR)
> +
> +
> +#define FFA_HANDLE_HYP_FLAG             BIT(63,ULL)
> +
> +/* Memory attributes: Normal memory, Write-Back cacheable, Inner shareab=
le */
> +#define FFA_NORMAL_MEM_REG_ATTR		_AC(0x2f,U)
> +
> +/* Memory access permissions: Read-write */
> +#define FFA_MEM_ACC_RW			_AC(0x2,U)
> +
> +/* Clear memory before mapping in receiver */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR		BIT(0, U)
> +/* Relayer may time slice this operation */
> +#define FFA_MEMORY_REGION_FLAG_TIME_SLICE	BIT(1, U)
> +/* Clear memory after receiver relinquishes it */
> +#define FFA_MEMORY_REGION_FLAG_CLEAR_RELINQUISH	BIT(2, U)
> +
> +/* Share memory transaction */
> +#define FFA_MEMORY_REGION_TRANSACTION_TYPE_SHARE (_AC(1,U) << 3)
> +
> +#define FFA_HANDLE_INVALID		_AC(0xffffffffffffffff,ULL)
> +
> +/* Framework direct request/response */
> +#define FFA_MSG_FLAG_FRAMEWORK		BIT(31, U)
> +#define FFA_MSG_TYPE_MASK		_AC(0xFF,U);
> +#define FFA_MSG_PSCI			_AC(0x0,U)
> +#define FFA_MSG_SEND_VM_CREATED		_AC(0x4,U)
> +#define FFA_MSG_RESP_VM_CREATED		_AC(0x5,U)
> +#define FFA_MSG_SEND_VM_DESTROYED	_AC(0x6,U)
> +#define FFA_MSG_RESP_VM_DESTROYED	_AC(0x7,U)
> +
> +/*
> + * Flags used for the FFA_PARTITION_INFO_GET return message:
> + * BIT(0): Supports receipt of direct requests
> + * BIT(1): Can send direct requests
> + * BIT(2): Can send and receive indirect messages
> + * BIT(3): Supports receipt of notifications
> + * BIT(4-5): Partition ID is a PE endpoint ID
> + */
> +#define FFA_PART_PROP_DIRECT_REQ_RECV   BIT(0,U)
> +#define FFA_PART_PROP_DIRECT_REQ_SEND   BIT(1,U)
> +#define FFA_PART_PROP_INDIRECT_MSGS     BIT(2,U)
> +#define FFA_PART_PROP_RECV_NOTIF        BIT(3,U)
> +#define FFA_PART_PROP_IS_PE_ID          (_AC(0,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_INDEP    (_AC(1,U) << 4)
> +#define FFA_PART_PROP_IS_SEPID_DEP      (_AC(2,U) << 4)
> +#define FFA_PART_PROP_IS_AUX_ID         (_AC(3,U) << 4)
> +#define FFA_PART_PROP_NOTIF_CREATED     BIT(6,U)
> +#define FFA_PART_PROP_NOTIF_DESTROYED   BIT(7,U)
> +#define FFA_PART_PROP_AARCH64_STATE     BIT(8,U)
> +
> +/* Function IDs */
> +#define FFA_ERROR			_AC(0x84000060,U)
> +#define FFA_SUCCESS_32			_AC(0x84000061,U)
> +#define FFA_SUCCESS_64			_AC(0xC4000061,U)
> +#define FFA_INTERRUPT			_AC(0x84000062,U)
> +#define FFA_VERSION			_AC(0x84000063,U)
> +#define FFA_FEATURES			_AC(0x84000064,U)
> +#define FFA_RX_ACQUIRE			_AC(0x84000084,U)
> +#define FFA_RX_RELEASE			_AC(0x84000065,U)
> +#define FFA_RXTX_MAP_32			_AC(0x84000066,U)
> +#define FFA_RXTX_MAP_64			_AC(0xC4000066,U)
> +#define FFA_RXTX_UNMAP			_AC(0x84000067,U)
> +#define FFA_PARTITION_INFO_GET		_AC(0x84000068,U)
> +#define FFA_ID_GET			_AC(0x84000069,U)
> +#define FFA_SPM_ID_GET			_AC(0x84000085,U)
> +#define FFA_MSG_WAIT			_AC(0x8400006B,U)
> +#define FFA_MSG_YIELD			_AC(0x8400006C,U)
> +#define FFA_MSG_RUN			_AC(0x8400006D,U)
> +#define FFA_MSG_SEND2			_AC(0x84000086,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_32	_AC(0x8400006F,U)
> +#define FFA_MSG_SEND_DIRECT_REQ_64	_AC(0xC400006F,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_32	_AC(0x84000070,U)
> +#define FFA_MSG_SEND_DIRECT_RESP_64	_AC(0xC4000070,U)
> +#define FFA_MEM_DONATE_32		_AC(0x84000071,U)
> +#define FFA_MEM_DONATE_64		_AC(0xC4000071,U)
> +#define FFA_MEM_LEND_32			_AC(0x84000072,U)
> +#define FFA_MEM_LEND_64			_AC(0xC4000072,U)
> +#define FFA_MEM_SHARE_32		_AC(0x84000073,U)
> +#define FFA_MEM_SHARE_64		_AC(0xC4000073,U)
> +#define FFA_MEM_RETRIEVE_REQ_32		_AC(0x84000074,U)
> +#define FFA_MEM_RETRIEVE_REQ_64		_AC(0xC4000074,U)
> +#define FFA_MEM_RETRIEVE_RESP		_AC(0x84000075,U)
> +#define FFA_MEM_RELINQUISH		_AC(0x84000076,U)
> +#define FFA_MEM_RECLAIM			_AC(0x84000077,U)
> +#define FFA_MEM_FRAG_RX			_AC(0x8400007A,U)
> +#define FFA_MEM_FRAG_TX			_AC(0x8400007B,U)
> +#define FFA_MSG_SEND			_AC(0x8400006E,U)
> +#define FFA_MSG_POLL			_AC(0x8400006A,U)
> +
> +/* Partition information descriptor */
> +struct ffa_partition_info_1_0 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +};
> +
> +struct ffa_partition_info_1_1 {
> +    uint16_t id;
> +    uint16_t execution_context;
> +    uint32_t partition_properties;
> +    uint8_t uuid[16];
> +};
> +
> +/* Constituent memory region descriptor */
> +struct ffa_address_range {
> +    uint64_t address;
> +    uint32_t page_count;
> +    uint32_t reserved;
> +};
> +
> +/* Composite memory region descriptor */
> +struct ffa_mem_region {
> +    uint32_t total_page_count;
> +    uint32_t address_range_count;
> +    uint64_t reserved;
> +    struct ffa_address_range address_range_array[];
> +};
> +
> +/* Memory access permissions descriptor */
> +struct ffa_mem_access_perm {
> +    uint16_t endpoint_id;
> +    uint8_t perm;
> +    uint8_t flags;
> +};
> +
> +/* Endpoint memory access descriptor */
> +struct ffa_mem_access {
> +    struct ffa_mem_access_perm access_perm;
> +    uint32_t region_offs;
> +    uint64_t reserved;
> +};
> +
> +/* Lend, donate or share memory transaction descriptor */
> +struct ffa_mem_transaction_1_0 {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t reserved0;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t reserved1;
> +    uint32_t mem_access_count;
> +    struct ffa_mem_access mem_access_array[];
> +};
> +
> +struct ffa_mem_transaction_1_1 {
> +    uint16_t sender_id;
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +    uint32_t mem_access_size;
> +    uint32_t mem_access_count;
> +    uint32_t mem_access_offs;
> +    uint8_t reserved[12];
> +};
> +
> +/*
> + * The parts needed from struct ffa_mem_transaction_1_0 or struct
> + * ffa_mem_transaction_1_1, used to provide an abstraction of difference=
 in
> + * data structures between version 1.0 and 1.1. This is just an internal
> + * interface and can be changed without changing any ABI.
> + */
> +struct ffa_mem_transaction_x {
> +    uint16_t sender_id;
> +    uint8_t mem_reg_attr;
> +    uint8_t flags;
> +    uint8_t mem_access_size;
> +    uint8_t mem_access_count;
> +    uint16_t mem_access_offs;
> +    uint64_t global_handle;
> +    uint64_t tag;
> +};
> +
> +/* Endpoint RX/TX descriptor */
> +struct ffa_endpoint_rxtx_descriptor_1_0 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_range_count;
> +    uint32_t tx_range_count;
> +};
> +
> +struct ffa_endpoint_rxtx_descriptor_1_1 {
> +    uint16_t sender_id;
> +    uint16_t reserved;
> +    uint32_t rx_region_offs;
> +    uint32_t tx_region_offs;
> +};
> +
> +struct ffa_ctx {
> +    void *rx;
> +    void *tx;
> +    struct page_info *rx_pg;
> +    struct page_info *tx_pg;
> +    unsigned int page_count;
> +    uint32_t guest_vers;
> +    bool tx_is_mine;
> +    bool interrupted;
> +    struct list_head frag_list;
> +    spinlock_t lock;
> +};
> +
> +struct ffa_shm_mem {
> +    struct list_head list;
> +    uint16_t sender_id;
> +    uint16_t ep_id;     /* endpoint, the one lending */
> +    uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
> +    unsigned int page_count;
> +    struct page_info *pages[];
> +};
> +
> +struct mem_frag_state {
> +    struct list_head list;
> +    struct ffa_shm_mem *shm;
> +    uint32_t range_count;
> +    unsigned int current_page_idx;
> +    unsigned int frag_offset;
> +    unsigned int range_offset;
> +    uint8_t *buf;
> +    unsigned int buf_size;
> +    struct ffa_address_range range;
> +};
> +
> +/*
> + * Our rx/rx buffer shared with the SPMC
> + */
> +static uint32_t ffa_version;
> +static uint16_t *subsr_vm_created;
> +static unsigned int subsr_vm_created_count;
> +static uint16_t *subsr_vm_destroyed;
> +static unsigned int subsr_vm_destroyed_count;
> +static void *ffa_rx;
> +static void *ffa_tx;
> +static unsigned int ffa_page_count;
> +static DEFINE_SPINLOCK(ffa_buffer_lock);
> +
> +static LIST_HEAD(ffa_mem_list);
> +static DEFINE_SPINLOCK(ffa_mem_list_lock);
> +
> +static uint64_t next_handle =3D FFA_HANDLE_HYP_FLAG;
> +
> +static inline uint64_t reg_pair_to_64(uint32_t reg0, uint32_t reg1)
> +{
> +    return (uint64_t)reg0 << 32 | reg1;
> +}
> +
> +static void inline reg_pair_from_64(uint32_t *reg0, uint32_t *reg1,
> +                                    uint64_t val)
> +{
> +    *reg0 =3D val >> 32;
> +    *reg1 =3D val;
> +}
> +
> +static bool ffa_get_version(uint32_t *vers)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_VERSION, .a1 =3D FFA_MY_VERSION,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    if ( resp.a0 =3D=3D FFA_RET_NOT_SUPPORTED )
> +    {
> +        printk(XENLOG_ERR "ffa: FFA_VERSION returned not supported\n");
> +        return false;
> +    }
> +
> +    *vers =3D resp.a0;
> +    return true;
> +}
> +
> +static uint32_t get_ffa_ret_code(const struct arm_smccc_1_2_regs *resp)
> +{
> +    switch ( resp->a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp->a2 )
> +            return resp->a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +    case FFA_SUCCESS_64:
> +        return FFA_RET_OK;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static uint32_t ffa_features(uint32_t id)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D { .a0 =3D FFA_FEATURES, .a1 =
=3D id, };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static bool check_mandatory_feature(uint32_t id)
> +{
> +    uint32_t ret =3D ffa_features(id);
> +
> +    if (ret)
> +        printk(XENLOG_ERR "ffa: mandatory feature id %#x missing\n", id)=
;
> +    return !ret;
> +}
> +
> +static uint32_t ffa_rxtx_map(register_t tx_addr, register_t rx_addr,
> +                             uint32_t page_count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +#ifdef CONFIG_ARM_64
> +        .a0 =3D FFA_RXTX_MAP_64,
> +#endif
> +#ifdef CONFIG_ARM_32
> +        .a0 =3D FFA_RXTX_MAP_32,
> +#endif
> +	.a1 =3D tx_addr, .a2 =3D rx_addr,
> +        .a3 =3D page_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static uint32_t ffa_rxtx_unmap(uint16_t vm_id)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_RXTX_UNMAP, .a1 =3D vm_id,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static uint32_t ffa_partition_info_get(uint32_t w1, uint32_t w2, uint32_=
t w3,
> +                                       uint32_t w4, uint32_t w5,
> +                                       uint32_t *count)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_PARTITION_INFO_GET, .a1 =3D w1, .a2 =3D w2, .a3 =3D =
w3, .a4 =3D w4,
> +        .a5 =3D w5,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +    uint32_t ret;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    ret =3D get_ffa_ret_code(&resp);
> +    if ( !ret )
> +        *count =3D resp.a2;
> +
> +    return ret;
> +}
> +
> +static uint32_t ffa_rx_release(void)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D { .a0 =3D FFA_RX_RELEASE, };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
> +                             register_t addr, uint32_t pg_count,
> +                             uint64_t *handle)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_SHARE_32, .a1 =3D tot_len, .a2 =3D frag_len, .a3=
 =3D addr,
> +        .a4 =3D pg_count,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    /*
> +     * For arm64 we must use 64-bit calling convention if the buffer isn=
't
> +     * passed in our tx buffer.
> +     */
> +    if (sizeof(addr) > 4 && addr)
> +        arg.a0 =3D FFA_MEM_SHARE_64;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        *handle =3D reg_pair_to_64(resp.a3, resp.a2);
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        *handle =3D reg_pair_to_64(resp.a2, resp.a1);
> +        return resp.a3;
> +    default:
> +        return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static int32_t ffa_mem_frag_tx(uint64_t handle, uint32_t frag_len,
> +                               uint16_t sender_id)
> +{
> +    struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_FRAG_TX, .a1 =3D handle & UINT32_MAX, .a2 =3D ha=
ndle >> 32,
> +        .a3 =3D frag_len, .a4 =3D (uint32_t)sender_id << 16,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    switch ( resp.a0 )
> +    {
> +    case FFA_ERROR:
> +        if ( resp.a2 )
> +            return resp.a2;
> +        else
> +            return FFA_RET_NOT_SUPPORTED;
> +    case FFA_SUCCESS_32:
> +        return FFA_RET_OK;
> +    case FFA_MEM_FRAG_RX:
> +        return resp.a3;
> +    default:
> +            return FFA_RET_NOT_SUPPORTED;
> +    }
> +}
> +
> +static uint32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
> +                                uint32_t flags)
> +{
> +    const struct arm_smccc_1_2_regs arg =3D {
> +        .a0 =3D FFA_MEM_RECLAIM, .a1 =3D handle_lo, .a2 =3D handle_hi, .=
a3 =3D flags,
> +    };
> +    struct arm_smccc_1_2_regs resp;
> +
> +    arm_smccc_1_2_smc(&arg, &resp);
> +
> +    return get_ffa_ret_code(&resp);
> +}
> +
> +static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
> +                                      uint8_t msg)
> +{
> +    uint32_t exp_resp =3D FFA_MSG_FLAG_FRAMEWORK;
> +    int32_t res;
> +
> +    if ( msg !=3D FFA_MSG_SEND_VM_CREATED && msg !=3DFFA_MSG_SEND_VM_DES=
TROYED )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    if ( msg =3D=3D FFA_MSG_SEND_VM_CREATED )
> +        exp_resp |=3D FFA_MSG_RESP_VM_CREATED;
> +    else
> +        exp_resp |=3D FFA_MSG_RESP_VM_DESTROYED;
> +
> +    do {
> +        const struct arm_smccc_1_2_regs arg =3D {
> +            .a0 =3D FFA_MSG_SEND_DIRECT_REQ_32,
> +            .a1 =3D sp_id,
> +            .a2 =3D FFA_MSG_FLAG_FRAMEWORK | msg,
> +            .a5 =3D vm_id,
> +        };
> +        struct arm_smccc_1_2_regs resp;
> +
> +        arm_smccc_1_2_smc(&arg, &resp);
> +        if ( resp.a0 !=3D FFA_MSG_SEND_DIRECT_RESP_32 || resp.a2 !=3D ex=
p_resp )
> +        {
> +            /*
> +             * This is an invalid response, likely due to some error in =
the
> +             * implementation of the ABI.
> +             */
> +            return FFA_RET_INVALID_PARAMETERS;
> +        }
> +        res =3D resp.a3;
> +    } while ( res =3D=3D FFA_RET_INTERRUPTED || res =3D=3D FFA_RET_RETRY=
 );
> +
> +    return res;
> +}
> +
> +static u16 get_vm_id(struct domain *d)
> +{
> +    /* +1 since 0 is reserved for the hypervisor in FF-A */
> +    return d->domain_id + 1;
> +}
> +
> +static void set_regs(struct cpu_user_regs *regs, register_t v0, register=
_t v1,
> +                     register_t v2, register_t v3, register_t v4, regist=
er_t v5,
> +                     register_t v6, register_t v7)
> +{
> +        set_user_reg(regs, 0, v0);
> +        set_user_reg(regs, 1, v1);
> +        set_user_reg(regs, 2, v2);
> +        set_user_reg(regs, 3, v3);
> +        set_user_reg(regs, 4, v4);
> +        set_user_reg(regs, 5, v5);
> +        set_user_reg(regs, 6, v6);
> +        set_user_reg(regs, 7, v7);
> +}
> +
> +static void set_regs_error(struct cpu_user_regs *regs, uint32_t error_co=
de)
> +{
> +    set_regs(regs, FFA_ERROR, 0, error_code, 0, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_success(struct cpu_user_regs *regs, uint32_t w2,
> +                             uint32_t w3)
> +{
> +    set_regs(regs, FFA_SUCCESS_32, 0, w2, w3, 0, 0, 0, 0);
> +}
> +
> +static void set_regs_frag_rx(struct cpu_user_regs *regs, uint32_t handle=
_lo,
> +                             uint32_t handle_hi, uint32_t frag_offset,
> +                             uint16_t sender_id)
> +{
> +    set_regs(regs, FFA_MEM_FRAG_RX, handle_lo, handle_hi, frag_offset,
> +             (uint32_t)sender_id << 16, 0, 0, 0);
> +}
> +
> +static void handle_version(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t vers =3D get_user_reg(regs, 1);
> +
> +    if ( vers < FFA_VERSION_1_1 )
> +        vers =3D FFA_VERSION_1_0;
> +    else
> +        vers =3D FFA_VERSION_1_1;
> +
> +    ctx->guest_vers =3D vers;
> +    set_regs(regs, vers, 0, 0, 0, 0, 0, 0, 0);
> +}
> +
> +static uint32_t handle_rxtx_map(uint32_t fid, register_t tx_addr,
> +                                register_t rx_addr, uint32_t page_count)
> +{
> +    uint32_t ret =3D FFA_RET_INVALID_PARAMETERS;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    struct page_info *tx_pg;
> +    struct page_info *rx_pg;
> +    p2m_type_t t;
> +    void *rx;
> +    void *tx;
> +
> +    if ( !smccc_is_conv_64(fid) )
> +    {
> +        tx_addr &=3D UINT32_MAX;
> +        rx_addr &=3D UINT32_MAX;
> +    }
> +
> +    /* For now to keep things simple, only deal with a single page */
> +    if ( page_count !=3D 1 )
> +        return FFA_RET_NOT_SUPPORTED;
> +
> +    /* Already mapped */
> +    if ( ctx->rx )
> +        return FFA_RET_DENIED;
> +
> +    tx_pg =3D get_page_from_gfn(d, gaddr_to_gfn(tx_addr), &t, P2M_ALLOC)=
;
> +    if ( !tx_pg )
> +        return FFA_RET_INVALID_PARAMETERS;
> +    /* Only normal RAM for now */
> +    if (t !=3D p2m_ram_rw)
> +        goto err_put_tx_pg;
> +
> +    rx_pg =3D get_page_from_gfn(d, gaddr_to_gfn(rx_addr), &t, P2M_ALLOC)=
;
> +    if ( !tx_pg )
> +        goto err_put_tx_pg;
> +    /* Only normal RAM for now */
> +    if ( t !=3D p2m_ram_rw )
> +        goto err_put_rx_pg;
> +
> +    tx =3D __map_domain_page_global(tx_pg);
> +    if ( !tx )
> +        goto err_put_rx_pg;
> +
> +    rx =3D __map_domain_page_global(rx_pg);
> +    if ( !rx )
> +        goto err_unmap_tx;
> +
> +    ctx->rx =3D rx;
> +    ctx->tx =3D tx;
> +    ctx->rx_pg =3D rx_pg;
> +    ctx->tx_pg =3D tx_pg;
> +    ctx->page_count =3D 1;
> +    ctx->tx_is_mine =3D true;
> +    return FFA_RET_OK;
> +
> +err_unmap_tx:
> +    unmap_domain_page_global(tx);
> +err_put_rx_pg:
> +    put_page(rx_pg);
> +err_put_tx_pg:
> +    put_page(tx_pg);
> +    return ret;
> +}
> +
> +static uint32_t handle_rxtx_unmap(void)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t ret;
> +
> +    if ( !ctx->rx )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    ret =3D ffa_rxtx_unmap(get_vm_id(d));
> +    if ( ret )
> +        return ret;
> +
> +    unmap_domain_page_global(ctx->rx);
> +    unmap_domain_page_global(ctx->tx);
> +    put_page(ctx->rx_pg);
> +    put_page(ctx->tx_pg);
> +    ctx->rx =3D NULL;
> +    ctx->tx =3D NULL;
> +    ctx->rx_pg =3D NULL;
> +    ctx->tx_pg =3D NULL;
> +    ctx->page_count =3D 0;
> +    ctx->tx_is_mine =3D false;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static uint32_t handle_partition_info_get(uint32_t w1, uint32_t w2, uint=
32_t w3,
> +                                          uint32_t w4, uint32_t w5,
> +                                          uint32_t *count)
> +{
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +
> +    if ( !ffa_page_count )
> +        return FFA_RET_DENIED;
> +
> +    spin_lock(&ctx->lock);
> +    if ( !ctx->page_count || !ctx->tx_is_mine )
> +        goto out;
> +    ret =3D ffa_partition_info_get(w1, w2, w3, w4, w5, count);
> +    if ( ret )
> +        goto out;
> +    if ( ctx->guest_vers =3D=3D FFA_VERSION_1_0 )
> +    {
> +        size_t n;
> +        struct ffa_partition_info_1_1 *src =3D ffa_rx;
> +        struct ffa_partition_info_1_0 *dst =3D ctx->rx;
> +
> +        for ( n =3D 0; n < *count; n++ )
> +        {
> +            dst[n].id =3D src[n].id;
> +            dst[n].execution_context =3D src[n].execution_context;
> +            dst[n].partition_properties =3D src[n].partition_properties;
> +        }
> +    }
> +    else
> +    {
> +        size_t sz =3D *count * sizeof(struct ffa_partition_info_1_1);
> +
> +        memcpy(ctx->rx, ffa_rx, sz);
> +    }
> +    ffa_rx_release();
> +    ctx->tx_is_mine =3D false;
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static uint32_t handle_rx_release(void)
> +{
> +    uint32_t ret =3D FFA_RET_DENIED;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +
> +    spin_lock(&ctx->lock);
> +    if ( !ctx->page_count || ctx->tx_is_mine )
> +        goto out;
> +    ret =3D FFA_RET_OK;
> +    ctx->tx_is_mine =3D true;
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    return ret;
> +}
> +
> +static void handle_msg_send_direct_req(struct cpu_user_regs *regs, uint3=
2_t fid)
> +{
> +    struct arm_smccc_1_2_regs arg =3D { .a0 =3D fid, };
> +    struct arm_smccc_1_2_regs resp =3D { };
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t src_dst;
> +    uint64_t mask;
> +
> +    if ( smccc_is_conv_64(fid) )
> +        mask =3D 0xffffffffffffffff;
> +    else
> +        mask =3D 0xffffffff;
> +
> +    src_dst =3D get_user_reg(regs, 1);
> +    if ( (src_dst >> 16) !=3D get_vm_id(d) )
> +    {
> +        resp.a0 =3D FFA_ERROR;
> +        resp.a2 =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    arg.a1 =3D src_dst;
> +    arg.a2 =3D get_user_reg(regs, 2) & mask;
> +    arg.a3 =3D get_user_reg(regs, 3) & mask;
> +    arg.a4 =3D get_user_reg(regs, 4) & mask;
> +    arg.a5 =3D get_user_reg(regs, 5) & mask;
> +    arg.a6 =3D get_user_reg(regs, 6) & mask;
> +    arg.a7 =3D get_user_reg(regs, 7) & mask;
> +
> +    while ( true )
> +    {
> +        arm_smccc_1_2_smc(&arg, &resp);
> +
> +        switch ( resp.a0 )
> +        {
> +        case FFA_INTERRUPT:
> +            ctx->interrupted =3D true;
> +            goto out;
> +        case FFA_ERROR:
> +        case FFA_SUCCESS_32:
> +        case FFA_SUCCESS_64:
> +        case FFA_MSG_SEND_DIRECT_RESP_32:
> +        case FFA_MSG_SEND_DIRECT_RESP_64:
> +            goto out;
> +        default:
> +            /* Bad fid, report back. */
> +            memset(&arg, 0, sizeof(arg));
> +            arg.a0 =3D FFA_ERROR;
> +            arg.a1 =3D src_dst;
> +            arg.a2 =3D FFA_RET_NOT_SUPPORTED;
> +            continue;
> +        }
> +    }
> +
> +out:
> +    set_user_reg(regs, 0, resp.a0);
> +    set_user_reg(regs, 1, resp.a1 & mask);
> +    set_user_reg(regs, 2, resp.a2 & mask);
> +    set_user_reg(regs, 3, resp.a3 & mask);
> +    set_user_reg(regs, 4, resp.a4 & mask);
> +    set_user_reg(regs, 5, resp.a5 & mask);
> +    set_user_reg(regs, 6, resp.a6 & mask);
> +    set_user_reg(regs, 7, resp.a7 & mask);
> +}
> +
> +static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
> +                         struct ffa_address_range *range, uint32_t range=
_count,
> +                         unsigned int start_page_idx,
> +                         unsigned int *last_page_idx)
> +{
> +    unsigned int pg_idx =3D start_page_idx;
> +    unsigned long gfn;
> +    unsigned int n;
> +    unsigned int m;
> +    p2m_type_t t;
> +    uint64_t addr;
> +
> +    for ( n =3D 0; n < range_count; n++ )
> +    {
> +        for ( m =3D 0; m < range[n].page_count; m++ )
> +        {
> +            if ( pg_idx >=3D shm->page_count )
> +                return FFA_RET_INVALID_PARAMETERS;
> +
> +            addr =3D read_atomic(&range[n].address);
> +            gfn =3D gaddr_to_gfn(addr + m * PAGE_SIZE);
> +            shm->pages[pg_idx] =3D get_page_from_gfn(d, gfn, &t, P2M_ALL=
OC);
> +            if ( !shm->pages[pg_idx] )
> +                return FFA_RET_DENIED;
> +            pg_idx++;
> +            /* Only normal RAM for now */
> +            if ( t !=3D p2m_ram_rw )
> +                return FFA_RET_DENIED;
> +        }
> +    }
> +
> +    *last_page_idx =3D pg_idx;
> +
> +    return FFA_RET_OK;
> +}
> +
> +static void put_shm_pages(struct ffa_shm_mem *shm)
> +{
> +    unsigned int n;
> +
> +    for ( n =3D 0; n < shm->page_count && shm->pages[n]; n++ )
> +    {
> +        put_page(shm->pages[n]);
> +        shm->pages[n] =3D NULL;
> +    }
> +}
> +
> +static void init_range(struct ffa_address_range *addr_range,
> +                       paddr_t pa)
> +{
> +    memset(addr_range, 0, sizeof(*addr_range));
> +    addr_range->address =3D pa;
> +    addr_range->page_count =3D 1;
> +}
> +
> +static int share_shm(struct ffa_shm_mem *shm)
> +{
> +    uint32_t max_frag_len =3D ffa_page_count * PAGE_SIZE;
> +    struct ffa_mem_transaction_1_1 *descr =3D ffa_tx;
> +    struct ffa_mem_access *mem_access_array;
> +    struct ffa_mem_region *region_descr;
> +    struct ffa_address_range *addr_range;
> +    paddr_t pa;
> +    paddr_t last_pa;
> +    unsigned int n;
> +    uint32_t frag_len;
> +    uint32_t tot_len;
> +    int ret;
> +    unsigned int range_count;
> +    unsigned int range_base;
> +    bool first;
> +
> +    memset(descr, 0, sizeof(*descr));
> +    descr->sender_id =3D shm->sender_id;
> +    descr->global_handle =3D shm->handle;
> +    descr->mem_reg_attr =3D FFA_NORMAL_MEM_REG_ATTR;
> +    descr->mem_access_count =3D 1;
> +    descr->mem_access_size =3D sizeof(*mem_access_array);
> +    descr->mem_access_offs =3D sizeof(*descr);
> +    mem_access_array =3D (void *)(descr + 1);
> +    region_descr =3D (void *)(mem_access_array + 1);
> +
> +    memset(mem_access_array, 0, sizeof(*mem_access_array));
> +    mem_access_array[0].access_perm.endpoint_id =3D shm->ep_id;
> +    mem_access_array[0].access_perm.perm =3D FFA_MEM_ACC_RW;
> +    mem_access_array[0].region_offs =3D (vaddr_t)region_descr - (vaddr_t=
)ffa_tx;
> +
> +    memset(region_descr, 0, sizeof(*region_descr));
> +    region_descr->total_page_count =3D shm->page_count;
> +
> +    region_descr->address_range_count =3D 1;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE =3D=3D pa )
> +        {
> +            continue;
> +        }
> +        region_descr->address_range_count++;
> +    }
> +
> +    tot_len =3D sizeof(*descr) + sizeof(*mem_access_array) +
> +              sizeof(*region_descr) +
> +              region_descr->address_range_count * sizeof(*addr_range);
> +
> +    addr_range =3D region_descr->address_range_array;
> +    frag_len =3D (vaddr_t)(addr_range + 1) - (vaddr_t)ffa_tx;
> +    last_pa =3D page_to_maddr(shm->pages[0]);
> +    init_range(addr_range, last_pa);
> +    first =3D true;
> +    range_count =3D 1;
> +    range_base =3D 0;
> +    for ( n =3D 1; n < shm->page_count; last_pa =3D pa, n++ )
> +    {
> +        pa =3D page_to_maddr(shm->pages[n]);
> +        if ( last_pa + PAGE_SIZE =3D=3D pa )
> +        {
> +            addr_range->page_count++;
> +            continue;
> +        }
> +
> +        if ( frag_len =3D=3D max_frag_len )
> +        {
> +            if ( first )
> +            {
> +                ret =3D ffa_mem_share(tot_len, frag_len, 0, 0, &shm->han=
dle);
> +                first =3D false;
> +            }
> +            else
> +            {
> +                ret =3D ffa_mem_frag_tx(shm->handle, frag_len, shm->send=
er_id);
> +            }
> +            if ( ret <=3D 0)
> +                return ret;
> +            range_base =3D range_count;
> +            range_count =3D 0;
> +            frag_len =3D sizeof(*addr_range);
> +            addr_range =3D ffa_tx;
> +        }
> +        else
> +        {
> +            frag_len +=3D sizeof(*addr_range);
> +            addr_range++;
> +        }
> +        init_range(addr_range, pa);
> +        range_count++;
> +    }
> +
> +    if ( first )
> +        return ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
> +    else
> +        return ffa_mem_frag_tx(shm->handle, frag_len, shm->sender_id);
> +}
> +
> +static int read_mem_transaction(uint32_t ffa_vers, void *buf, size_t ble=
n,
> +                                struct ffa_mem_transaction_x *trans)
> +{
> +    uint16_t mem_reg_attr;
> +    uint32_t flags;
> +    uint32_t count;
> +    uint32_t offs;
> +    uint32_t size;
> +
> +    if ( ffa_vers >=3D FFA_VERSION_1_1 )
> +    {
> +        struct ffa_mem_transaction_1_1 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D read_atomic(&descr->sender_id);
> +        mem_reg_attr =3D read_atomic(&descr->mem_reg_attr);
> +        flags =3D read_atomic(&descr->flags);
> +        trans->global_handle =3D read_atomic(&descr->global_handle);
> +        trans->tag =3D read_atomic(&descr->tag);
> +
> +        count =3D read_atomic(&descr->mem_access_count);
> +        size =3D read_atomic(&descr->mem_access_size);
> +        offs =3D read_atomic(&descr->mem_access_offs);
> +    }
> +    else
> +    {
> +        struct ffa_mem_transaction_1_0 *descr;
> +
> +        if ( blen < sizeof(*descr) )
> +            return FFA_RET_INVALID_PARAMETERS;
> +
> +        descr =3D buf;
> +        trans->sender_id =3D read_atomic(&descr->sender_id);
> +        mem_reg_attr =3D read_atomic(&descr->mem_reg_attr);
> +        flags =3D read_atomic(&descr->flags);
> +        trans->global_handle =3D read_atomic(&descr->global_handle);
> +        trans->tag =3D read_atomic(&descr->tag);
> +
> +        count =3D read_atomic(&descr->mem_access_count);
> +        size =3D sizeof(struct ffa_mem_access);
> +        offs =3D offsetof(struct ffa_mem_transaction_1_0, mem_access_arr=
ay);
> +    }
> +
> +    if ( mem_reg_attr > UINT8_MAX || flags > UINT8_MAX || size > UINT8_M=
AX ||
> +        count > UINT8_MAX || offs > UINT16_MAX )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Check that the endpoint memory access descriptor array fits */
> +    if ( size * count + offs > blen )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    trans->mem_reg_attr =3D mem_reg_attr;
> +    trans->flags =3D flags;
> +    trans->mem_access_size =3D size;
> +    trans->mem_access_count =3D count;
> +    trans->mem_access_offs =3D offs;
> +    return 0;
> +}
> +
> +static int add_mem_share_frag(struct mem_frag_state *s, unsigned int off=
s,
> +                              unsigned int frag_len)
> +{
> +    struct domain *d =3D current->domain;
> +    unsigned int o =3D offs;
> +    unsigned int l;
> +    int ret;
> +
> +    if ( frag_len < o )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    /* Fill up the first struct ffa_address_range */
> +    l =3D min_t(unsigned int, frag_len - o, sizeof(s->range) - s->range_=
offset);
> +    memcpy((uint8_t *)&s->range + s->range_offset, s->buf + o, l);
> +    s->range_offset +=3D l;
> +    o +=3D l;
> +    if ( s->range_offset !=3D sizeof(s->range) )
> +        goto out;
> +    s->range_offset =3D 0;
> +
> +    while ( true )
> +    {
> +        ret =3D get_shm_pages(d, s->shm, &s->range, 1, s->current_page_i=
dx,
> +                            &s->current_page_idx);
> +        if ( ret )
> +            return ret;
> +        if ( s->range_count =3D=3D 1 )
> +            return 0;
> +        s->range_count--;
> +        if ( frag_len - o < sizeof(s->range) )
> +            break;
> +        memcpy(&s->range, s->buf + o, sizeof(s->range));
> +        o +=3D sizeof(s->range);
> +    }
> +
> +    /* Collect any remaining bytes for the next struct ffa_address_range=
 */
> +    s->range_offset =3D frag_len - o;
> +    memcpy(&s->range, s->buf + o, frag_len - o);
> +out:
> +    s->frag_offset +=3D frag_len;
> +    return s->frag_offset;
> +}
> +
> +static void handle_mem_share(struct cpu_user_regs *regs)
> +{
> +    uint32_t tot_len =3D get_user_reg(regs, 1);
> +    uint32_t frag_len =3D get_user_reg(regs, 2);
> +    uint64_t addr =3D get_user_reg(regs, 3);
> +    uint32_t page_count =3D get_user_reg(regs, 4);
> +    struct ffa_mem_transaction_x trans;
> +    struct ffa_mem_access *mem_access;
> +    struct ffa_mem_region *region_descr;
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    struct ffa_shm_mem *shm =3D NULL;
> +    unsigned int last_page_idx =3D 0;
> +    uint32_t range_count;
> +    uint32_t region_offs;
> +    int ret =3D FFA_RET_DENIED;
> +    uint32_t handle_hi =3D 0;
> +    uint32_t handle_lo =3D 0;
> +
> +    /*
> +     * We're only accepting memory transaction descriptors via the rx/tx
> +     * buffer.
> +     */
> +    if ( addr )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that fragment legnth doesn't exceed total length */
> +    if ( frag_len > tot_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    spin_lock(&ctx->lock);
> +
> +    if ( frag_len > ctx->page_count * PAGE_SIZE )
> +        goto out_unlock;
> +
> +    if ( !ffa_page_count )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out_unlock;
> +    }
> +
> +    ret =3D read_mem_transaction(ctx->guest_vers, ctx->tx, frag_len, &tr=
ans);
> +    if ( ret )
> +        goto out_unlock;
> +
> +    if ( trans.mem_reg_attr !=3D FFA_NORMAL_MEM_REG_ATTR )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out;
> +    }
> +
> +    /* Only supports sharing it with one SP for now */
> +    if ( trans.mem_access_count !=3D 1 )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    if ( trans.sender_id !=3D get_vm_id(d) )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out_unlock;
> +    }
> +
> +    /* Check that it fits in the supplied data */
> +    if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
> +        goto out_unlock;
> +
> +    mem_access =3D (void *)((vaddr_t)ctx->tx + trans.mem_access_offs);
> +    if ( read_atomic(&mem_access->access_perm.perm) !=3D FFA_MEM_ACC_RW =
)
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_offs =3D read_atomic(&mem_access->region_offs);
> +    if ( sizeof(*region_descr) + region_offs > frag_len )
> +    {
> +        ret =3D FFA_RET_NOT_SUPPORTED;
> +        goto out_unlock;
> +    }
> +
> +    region_descr =3D (void *)((vaddr_t)ctx->tx + region_offs);
> +    range_count =3D read_atomic(&region_descr->address_range_count);
> +    page_count =3D read_atomic(&region_descr->total_page_count);
> +
> +    shm =3D xzalloc_flex_struct(struct ffa_shm_mem, pages, page_count);
> +    if ( !shm )
> +    {
> +        ret =3D FFA_RET_NO_MEMORY;
> +        goto out;
> +    }
> +    shm->sender_id =3D trans.sender_id;
> +    shm->ep_id =3D read_atomic(&mem_access->access_perm.endpoint_id);
> +    shm->page_count =3D page_count;
> +
> +    if ( frag_len !=3D tot_len )
> +    {
> +        struct mem_frag_state *s =3D xzalloc(struct mem_frag_state);
> +
> +        if ( !s )
> +        {
> +            ret =3D FFA_RET_NO_MEMORY;
> +            goto out;
> +        }
> +        s->shm =3D shm;
> +        s->range_count =3D range_count;
> +        s->buf =3D ctx->tx;
> +        s->buf_size =3D ffa_page_count * PAGE_SIZE;
> +        ret =3D add_mem_share_frag(s, sizeof(*region_descr)  + region_of=
fs,
> +                                 frag_len);
> +        if ( ret <=3D 0 )
> +        {
> +            xfree(s);
> +            if ( ret < 0 )
> +                goto out;
> +        }
> +        else
> +        {
> +            shm->handle =3D next_handle++;
> +            reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +            list_add_tail(&s->list, &ctx->frag_list);
> +        }
> +        goto out_unlock;
> +    }
> +
> +    /*
> +     * Check that the Composite memory region descriptor fits.
> +     */
> +    if ( sizeof(*region_descr) + region_offs +
> +         range_count * sizeof(struct ffa_address_range) > frag_len )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D get_shm_pages(d, shm, region_descr->address_range_array, ran=
ge_count,
> +                        0, &last_page_idx);
> +    if ( ret )
> +        goto out;
> +    if ( last_page_idx !=3D shm->page_count )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    /* Note that share_shm() uses our tx buffer */
> +    spin_lock(&ffa_buffer_lock);
> +    ret =3D share_shm(shm);
> +    spin_unlock(&ffa_buffer_lock);
> +    if ( ret )
> +        goto out;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_add_tail(&shm->list, &ffa_mem_list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, shm->handle);
> +
> +out:
> +    if ( ret && shm )
> +    {
> +        put_shm_pages(shm);
> +        xfree(shm);
> +    }
> +out_unlock:
> +    spin_unlock(&ctx->lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, trans.send=
er_id);
> +    else if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static struct mem_frag_state *find_frag_state(struct ffa_ctx *ctx,
> +                                              uint64_t handle)
> +{
> +    struct mem_frag_state *s;
> +
> +    list_for_each_entry(s, &ctx->frag_list, list)
> +        if ( s->shm->handle =3D=3D handle )
> +            return s;
> +
> +    return NULL;
> +}
> +
> +static void handle_mem_frag_tx(struct cpu_user_regs *regs)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t frag_len =3D get_user_reg(regs, 3);
> +    uint32_t handle_lo =3D get_user_reg(regs, 1);
> +    uint32_t handle_hi =3D get_user_reg(regs, 2);
> +    uint64_t handle =3D reg_pair_to_64(handle_hi, handle_lo);
> +    struct mem_frag_state *s;
> +    uint16_t sender_id =3D 0;
> +    int ret;
> +
> +    spin_lock(&ctx->lock);
> +    s =3D find_frag_state(ctx, handle);
> +    if ( !s )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +    sender_id =3D s->shm->sender_id;
> +
> +    if ( frag_len > s->buf_size )
> +    {
> +        ret =3D FFA_RET_INVALID_PARAMETERS;
> +        goto out;
> +    }
> +
> +    ret =3D add_mem_share_frag(s, 0, frag_len);
> +    if ( ret =3D=3D 0 )
> +    {
> +        /* Note that share_shm() uses our tx buffer */
> +        spin_lock(&ffa_buffer_lock);
> +        ret =3D share_shm(s->shm);
> +        spin_unlock(&ffa_buffer_lock);
> +        if ( ret =3D=3D 0 )
> +        {
> +            spin_lock(&ffa_mem_list_lock);
> +            list_add_tail(&s->shm->list, &ffa_mem_list);
> +            spin_unlock(&ffa_mem_list_lock);
> +        }
> +        else
> +        {
> +            put_shm_pages(s->shm);
> +            xfree(s->shm);
> +        }
> +        list_del(&s->list);
> +        xfree(s);
> +    }
> +    else if ( ret < 0 )
> +    {
> +        put_shm_pages(s->shm);
> +        xfree(s->shm);
> +        list_del(&s->list);
> +        xfree(s);
> +    }
> +out:
> +    spin_unlock(&ctx->lock);
> +
> +    if ( ret > 0 )
> +            set_regs_frag_rx(regs, handle_lo, handle_hi, ret, sender_id)=
;
> +    else if ( ret =3D=3D 0)
> +            set_regs_success(regs, handle_lo, handle_hi);
> +    else
> +            set_regs_error(regs, ret);
> +}
> +
> +static int handle_mem_reclaim(uint64_t handle, uint32_t flags)
> +{
> +    struct ffa_shm_mem *shm;
> +    uint32_t handle_hi;
> +    uint32_t handle_lo;
> +    int ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_for_each_entry(shm, &ffa_mem_list, list)
> +    {
> +        if ( shm->handle =3D=3D handle )
> +            goto found_it;
> +    }
> +    shm =3D NULL;
> +found_it:
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    if ( !shm )
> +        return FFA_RET_INVALID_PARAMETERS;
> +
> +    reg_pair_from_64(&handle_hi, &handle_lo, handle);
> +    ret =3D ffa_mem_reclaim(handle_lo, handle_hi, flags);
> +    if ( ret )
> +        return ret;
> +
> +    spin_lock(&ffa_mem_list_lock);
> +    list_del(&shm->list);
> +    spin_unlock(&ffa_mem_list_lock);
> +
> +    put_shm_pages(shm);
> +    xfree(shm);
> +
> +    return ret;
> +}
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid)
> +{
> +    struct domain *d =3D current->domain;
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    uint32_t count;
> +    uint32_t e;
> +
> +    if ( !ctx )
> +        return false;
> +
> +    switch ( fid )
> +    {
> +    case FFA_VERSION:
> +        handle_version(regs);
> +        return true;
> +    case FFA_ID_GET:
> +        set_regs_success(regs, get_vm_id(d), 0);
> +        return true;
> +    case FFA_RXTX_MAP_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_RXTX_MAP_64:
> +#endif
> +        e =3D handle_rxtx_map(fid, get_user_reg(regs, 1), get_user_reg(r=
egs, 2),
> +                            get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_RXTX_UNMAP:
> +        e =3D handle_rxtx_unmap();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_PARTITION_INFO_GET:
> +        e =3D handle_partition_info_get(get_user_reg(regs, 1),
> +                                      get_user_reg(regs, 2),
> +                                      get_user_reg(regs, 3),
> +                                      get_user_reg(regs, 4),
> +                                      get_user_reg(regs, 5), &count);
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, count, 0);
> +        return true;
> +    case FFA_RX_RELEASE:
> +        e =3D handle_rx_release();
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MSG_SEND_DIRECT_REQ_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MSG_SEND_DIRECT_REQ_64:
> +#endif
> +        handle_msg_send_direct_req(regs, fid);
> +        return true;
> +    case FFA_MEM_SHARE_32:
> +#ifdef CONFIG_ARM_64
> +    case FFA_MEM_SHARE_64:
> +#endif
> +        handle_mem_share(regs);
> +        return true;
> +    case FFA_MEM_RECLAIM:
> +        e =3D handle_mem_reclaim(reg_pair_to_64(get_user_reg(regs, 2),
> +                                              get_user_reg(regs, 1)),
> +                               get_user_reg(regs, 3));
> +        if ( e )
> +            set_regs_error(regs, e);
> +        else
> +            set_regs_success(regs, 0, 0);
> +        return true;
> +    case FFA_MEM_FRAG_TX:
> +        handle_mem_frag_tx(regs);
> +        return true;
> +
> +    default:
> +        printk(XENLOG_ERR "ffa: unhandled fid 0x%x\n", fid);
> +        return false;
> +    }
> +}
> +
> +int ffa_domain_init(struct domain *d, bool ffa_enabled)
> +{
> +    struct ffa_ctx *ctx;
> +    unsigned int n;
> +    unsigned int m;
> +    unsigned int c_pos;
> +    int32_t res;
> +
> +    if ( !ffa_version || !ffa_enabled )
> +        return 0;
> +
> +    ctx =3D xzalloc(struct ffa_ctx);
> +    if ( !ctx )
> +        return -ENOMEM;
> +
> +    for ( n =3D 0; n < subsr_vm_created_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subsr_vm_created[n], get_vm_id(d)=
,
> +                                     FFA_MSG_SEND_VM_CREATED);
> +        if ( res )
> +        {
> +            printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %=
u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_created[n], res);
> +            c_pos =3D n;
> +            goto err;
> +        }
> +    }
> +
> +    INIT_LIST_HEAD(&ctx->frag_list);
> +
> +    d->arch.ffa =3D ctx;
> +
> +    return 0;
> +
> +err:
> +    /* Undo any already sent vm created messaged */
> +    for ( n =3D 0; n < c_pos; n++ )
> +        for ( m =3D 0; m < subsr_vm_destroyed_count; m++ )
> +            if ( subsr_vm_destroyed[m] =3D=3D subsr_vm_created[n] )
> +                ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(=
d),
> +                                       FFA_MSG_SEND_VM_DESTROYED);
> +    return -ENOMEM;
> +}
> +
> +int ffa_relinquish_resources(struct domain *d)
> +{
> +    struct ffa_ctx *ctx =3D d->arch.ffa;
> +    unsigned int n;
> +    int32_t res;
> +
> +    if ( !ctx )
> +        return 0;
> +
> +    for ( n =3D 0; n < subsr_vm_destroyed_count; n++ )
> +    {
> +        res =3D ffa_direct_req_send_vm(subsr_vm_destroyed[n], get_vm_id(=
d),
> +                                     FFA_MSG_SEND_VM_DESTROYED);
> +
> +        if ( res )
> +            printk(XENLOG_ERR "ffa: Failed to report destruction of vm_i=
d %u to  %u: res %d\n",
> +                   get_vm_id(d), subsr_vm_destroyed[n], res);
> +    }
> +
> +    XFREE(d->arch.ffa);
> +
> +    return 0;
> +}
> +
> +static bool __init init_subscribers(void)
> +{
> +    struct ffa_partition_info_1_1 *fpi;
> +    bool ret =3D false;
> +    uint32_t count;
> +    uint32_t e;
> +    uint32_t n;
> +    uint32_t c_pos;
> +    uint32_t d_pos;
> +
> +    if ( ffa_version < FFA_VERSION_1_1 )
> +        return true;
> +
> +    e =3D ffa_partition_info_get(0, 0, 0, 0, 1, &count);
> +    ffa_rx_release();
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", (int)e=
);
> +        goto out;
> +    }
> +
> +    fpi =3D ffa_rx;
> +    subsr_vm_created_count =3D 0;
> +    subsr_vm_destroyed_count =3D 0;
> +    for ( n =3D 0; n < count; n++ )
> +    {
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED)
> +            subsr_vm_created_count++;
> +        if (fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED)
> +            subsr_vm_destroyed_count++;
> +    }
> +
> +    if ( subsr_vm_created_count )
> +        subsr_vm_created =3D xzalloc_array(uint16_t, subsr_vm_created_co=
unt);
> +    if ( subsr_vm_destroyed_count )
> +        subsr_vm_destroyed =3D xzalloc_array(uint16_t, subsr_vm_destroye=
d_count);
> +    if ( (subsr_vm_created_count && !subsr_vm_created) ||
> +        (subsr_vm_destroyed_count && !subsr_vm_destroyed) )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n"=
);
> +        subsr_vm_created_count =3D 0;
> +        subsr_vm_destroyed_count =3D 0;
> +        XFREE(subsr_vm_created);
> +        XFREE(subsr_vm_destroyed);
> +        goto out;
> +    }
> +
> +    for ( c_pos =3D 0, d_pos =3D 0, n =3D 0; n < count; n++ )
> +    {
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_CREATED )
> +            subsr_vm_created[c_pos++] =3D fpi[n].id;
> +        if ( fpi[n].partition_properties & FFA_PART_PROP_NOTIF_DESTROYED=
 )
> +            subsr_vm_destroyed[d_pos++] =3D fpi[n].id;
> +    }
> +
> +    ret =3D true;
> +out:
> +    ffa_rx_release();
> +    return ret;
> +}
> +
> +static int __init ffa_init(void)
> +{
> +    uint32_t vers;
> +    uint32_t e;
> +    unsigned int major_vers;
> +    unsigned int minor_vers;
> +
> +    /*
> +     * psci_init_smccc() updates this value with what's reported by EL-3
> +     * or secure world.
> +     */
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_2 )
> +    {
> +        printk(XENLOG_ERR
> +               "ffa: unsupported SMCCC version %#x (need at least %#x)\n=
",
> +               smccc_ver, ARM_SMCCC_VERSION_1_2);
> +        return 0;
> +    }
> +
> +    if ( !ffa_get_version(&vers) )
> +        return 0;
> +
> +    if ( vers < FFA_MIN_VERSION || vers > FFA_MY_VERSION )
> +    {
> +        printk(XENLOG_ERR "ffa: Incompatible version %#x found\n", vers)=
;
> +        return 0;
> +    }
> +
> +    major_vers =3D (vers >> FFA_VERSION_MAJOR_SHIFT) & FFA_VERSION_MAJOR=
_MASK;
> +    minor_vers =3D vers & FFA_VERSION_MINOR_MASK;
> +    printk(XENLOG_INFO "ARM FF-A Mediator version %u.%u\n",
> +           FFA_VERSION_MAJOR, FFA_VERSION_MINOR);
> +    printk(XENLOG_INFO "ARM FF-A Firmware version %u.%u\n",
> +           major_vers, minor_vers);
> +
> +    if ( !check_mandatory_feature(FFA_PARTITION_INFO_GET) ||
> +         !check_mandatory_feature(FFA_RX_RELEASE) ||
> +#ifdef CONFIG_ARM_64
> +         !check_mandatory_feature(FFA_RXTX_MAP_64) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_64) ||
> +#endif
> +#ifdef CONFIG_ARM_32
> +         !check_mandatory_feature(FFA_RXTX_MAP_32) ||
> +#endif
> +         !check_mandatory_feature(FFA_RXTX_UNMAP) ||
> +         !check_mandatory_feature(FFA_MEM_SHARE_32) ||
> +         !check_mandatory_feature(FFA_MEM_FRAG_TX) ||
> +         !check_mandatory_feature(FFA_MEM_RECLAIM) ||
> +         !check_mandatory_feature(FFA_MSG_SEND_DIRECT_REQ_32) )
> +        return 0;
> +
> +    ffa_rx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_rx )
> +        return 0;
> +
> +    ffa_tx =3D alloc_xenheap_pages(0, 0);
> +    if ( !ffa_tx )
> +        goto err_free_ffa_rx;
> +
> +    e =3D ffa_rxtx_map(__pa(ffa_tx), __pa(ffa_rx), 1);
> +    if ( e )
> +    {
> +        printk(XENLOG_ERR "ffa: Failed to map rxtx: error %d\n", (int)e)=
;
> +        goto err_free_ffa_tx;
> +    }
> +    ffa_page_count =3D 1;
> +    ffa_version =3D vers;
> +
> +    if ( !init_subscribers() )
> +        goto err_free_ffa_tx;
> +
> +    return 0;
> +
> +err_free_ffa_tx:
> +    free_xenheap_pages(ffa_tx, 0);
> +    ffa_tx =3D NULL;
> +err_free_ffa_rx:
> +    free_xenheap_pages(ffa_rx, 0);
> +    ffa_rx =3D NULL;
> +    ffa_page_count =3D 0;
> +    ffa_version =3D 0;
> +    XFREE(subsr_vm_created);
> +    subsr_vm_created_count =3D 0;
> +    XFREE(subsr_vm_destroyed);
> +    subsr_vm_destroyed_count =3D 0;
> +    return 0;
> +}
> +
> +__initcall(ffa_init);
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm=
/domain.h
> index ed63c2b6f91f..b3dee269bced 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -103,6 +103,10 @@ struct arch_domain
>     void *tee;
> #endif
>=20
> +#ifdef CONFIG_FFA
> +    void *ffa;
> +#endif
> +
>     bool directmap;
> }  __cacheline_aligned;
>=20
> diff --git a/xen/arch/arm/include/asm/ffa.h b/xen/arch/arm/include/asm/ff=
a.h
> new file mode 100644
> index 000000000000..4f4a739345bd
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/ffa.h
> @@ -0,0 +1,71 @@
> +/*
> + * xen/arch/arm/ffa.c
> + *
> + * Arm Firmware Framework for ARMv8-A(FFA) mediator
> + *
> + * Copyright (C) 2021  Linaro Limited
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without restriction,
> + * including without limitation the rights to use, copy, modify, merge,
> + * publish, distribute, sublicense, and/or sell copies of the Software,
> + * and to permit persons to whom the Software is furnished to do so,
> + * subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT=
.
> + * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
> + * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
> + * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
> + * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#ifndef __ASM_ARM_FFA_H__
> +#define __ASM_ARM_FFA_H__
> +
> +#include <xen/const.h>
> +
> +#include <asm/smccc.h>
> +#include <asm/types.h>
> +
> +#define FFA_FNUM_MIN_VALUE              _AC(0x60,U)
> +#define FFA_FNUM_MAX_VALUE              _AC(0x86,U)
> +
> +static inline bool is_ffa_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D FFA_FNUM_MIN_VALUE && fn <=3D FFA_FNUM_MAX_VALUE;
> +}
> +
> +#ifdef CONFIG_FFA
> +#define FFA_NR_FUNCS    11
> +
> +bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t fid);
> +int ffa_domain_init(struct domain *d, bool ffa_enabled);
> +int ffa_relinquish_resources(struct domain *d);
> +#else
> +#define FFA_NR_FUNCS    0
> +
> +static inline bool ffa_handle_call(struct cpu_user_regs *regs, uint32_t =
fid)
> +{
> +    return false;
> +}
> +
> +static inline int ffa_domain_init(struct domain *d, bool ffa_enabled)
> +{
> +    return 0;
> +}
> +
> +static inline int ffa_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +#endif
> +
> +#endif /*__ASM_ARM_FFA_H__*/
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 6f90c08a6304..34586025eff8 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -20,6 +20,7 @@
> #include <public/arch-arm/smccc.h>
> #include <asm/cpuerrata.h>
> #include <asm/cpufeature.h>
> +#include <asm/ffa.h>
> #include <asm/monitor.h>
> #include <asm/regs.h>
> #include <asm/smccc.h>
> @@ -32,7 +33,7 @@
> #define XEN_SMCCC_FUNCTION_COUNT 3
>=20
> /* Number of functions currently supported by Standard Service Service Ca=
lls. */
> -#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS)
> +#define SSSC_SMCCC_FUNCTION_COUNT (3 + VPSCI_NR_FUNCS + FFA_NR_FUNCS)
>=20
> static bool fill_uid(struct cpu_user_regs *regs, xen_uuid_t uuid)
> {
> @@ -196,13 +197,23 @@ static bool handle_existing_apis(struct cpu_user_re=
gs *regs)
>     return do_vpsci_0_1_call(regs, fid);
> }
>=20
> +static bool is_psci_fid(uint32_t fid)
> +{
> +    uint32_t fn =3D fid & ARM_SMCCC_FUNC_MASK;
> +
> +    return fn >=3D 0 && fn <=3D 0x1fU;
> +}
> +
> /* PSCI 0.2 interface and other Standard Secure Calls */
> static bool handle_sssc(struct cpu_user_regs *regs)
> {
>     uint32_t fid =3D (uint32_t)get_user_reg(regs, 0);
>=20
> -    if ( do_vpsci_0_2_call(regs, fid) )
> -        return true;
> +    if ( is_psci_fid(fid) )
> +        return do_vpsci_0_2_call(regs, fid);
> +
> +    if ( is_ffa_fid(fid) )
> +        return ffa_handle_call(regs, fid);
>=20
>     switch ( fid )
>     {
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.=
h
> index ab05fe12b0de..53f8d44a6a8e 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -318,6 +318,8 @@ struct xen_arch_domainconfig {
>     /* IN/OUT */
>     uint8_t gic_version;
>     /* IN */
> +    uint8_t ffa_enabled;
> +    /* IN */
>     uint16_t tee_type;
>     /* IN */
>     uint32_t nr_spis;
> --=20
> 2.31.1
>=20


