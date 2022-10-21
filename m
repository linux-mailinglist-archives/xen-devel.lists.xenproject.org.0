Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB20F606FE2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Oct 2022 08:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.427324.676262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollIh-00015q-AL; Fri, 21 Oct 2022 06:14:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 427324.676262; Fri, 21 Oct 2022 06:14:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ollIh-00013T-74; Fri, 21 Oct 2022 06:14:35 +0000
Received: by outflank-mailman (input) for mailman id 427324;
 Fri, 21 Oct 2022 06:14:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gujA=2W=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1ollIg-00013N-6X
 for xen-devel@lists.xenproject.org; Fri, 21 Oct 2022 06:14:34 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20079.outbound.protection.outlook.com [40.107.2.79])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9ff9d13f-5107-11ed-91b5-6bf2151ebd3b;
 Fri, 21 Oct 2022 08:14:31 +0200 (CEST)
Received: from AS9PR06CA0598.eurprd06.prod.outlook.com (2603:10a6:20b:486::32)
 by AM8PR08MB5713.eurprd08.prod.outlook.com (2603:10a6:20b:1dc::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 06:14:27 +0000
Received: from VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:486:cafe::97) by AS9PR06CA0598.outlook.office365.com
 (2603:10a6:20b:486::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.36 via Frontend
 Transport; Fri, 21 Oct 2022 06:14:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT017.mail.protection.outlook.com (100.127.145.12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.19 via Frontend Transport; Fri, 21 Oct 2022 06:14:27 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Fri, 21 Oct 2022 06:14:26 +0000
Received: from eec376f882ea.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CBC63644-DF55-414D-95C6-4B858FDBC2BA.1; 
 Fri, 21 Oct 2022 06:14:20 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id eec376f882ea.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 21 Oct 2022 06:14:20 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com (2603:10a6:20b:570::15)
 by AS8PR08MB7839.eurprd08.prod.outlook.com (2603:10a6:20b:52e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 06:14:18 +0000
Received: from AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339]) by AS8PR08MB7991.eurprd08.prod.outlook.com
 ([fe80::5cdc:31ff:2d2d:339%9]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 06:14:18 +0000
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
X-Inumbo-ID: 9ff9d13f-5107-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=a4pjqNJRiMmalQWG1DwTuGWnJXHxlTbtKI0QmSakQnFJxx8/YjsoP5oX0W1OoRJV+vDfjXR7YjJbxoRjCSMzFYZeJzwZKdvb94uhakjOpw6Di0MtLapRGbmovAn6Pn0H0/2ojxYonysVMDj3jAv1Vp1QXHIpx906L4eOnHJiZsmPKh8Aghs1Xhw2wJoMRVdUoSQU/p6UGaUURhPjfRJJKxXBtpJQhSdcsNprouVMFXxiTnPSoDDMPmbnQJM3noeGSEqjTqXFGcLgl/AmiysVhVNH7KTDBNqzvUDcKCFXPUWqvBJtHJFMFQWw+Lm1UyIXHVG5TkwX1DwU+Z4ZxVutRg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKMx7cjayhGES3G8jN+5b5BKkccbaSW3tboBnzSFJRg=;
 b=PIpnclx+SSmCg9aHql2MiX6F/qPNAbNBUFpu8tfDZQE4StAVVabA0GDZc1nfanOgKr3TcftCR+ZYAYYk5CABPuP4lLCdOXkty/tek0mBGLdGQMXwIdWInx8TVpO+CKumbx+TIS2ipQMJ77ffWjU3jPkhp4Q1039SgmMboPGznWhd7Zk46/LsP8h2wbNCupNXgHVb1zPne3DJ51ygUSoqrZbMeCAErYWG8BYT81oq+64BvBGX49c570RHxOm+wmLvZ0z7xKlobLx4ff2UIvxiTPkDUlFPM/i/w6AJ8TVEHZs/TetfgcbpJbN6tGuIkYbvDWSROxic1/U/MBUbxv+VgQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKMx7cjayhGES3G8jN+5b5BKkccbaSW3tboBnzSFJRg=;
 b=D0CJPh5RV7UvHuf8zKIlVnFIwr2f+XJTM/7o0ft0nV8c+KfZJXz6DPbfXogxo2mfAsY9xI47Uiw7HTu6R3aNMvTXMfzC0qZLWu+QEUEnf3AL7gtx/rU9BfZA63OQnzBw+tmP4E2o5wZsdKKzLGCne0+3ZPo04ru1tlSkzr8Nowo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FkZgtrRVOZZuS1SFAi4nlaJpjsUsJUHMFW+HGIgPGa8JNDpTL93DyfwSMVjOnYWTx89zaBg2yybr568gl4lLliJrcQVWCe1evXsBOWXgCEzIPx7b8fpdOVudQC09aCzFw1B2DfpugC5fg1TtNrN5TXs8zW/CZBFpjbU6ozlQGq2Wz/JMJd36sWjpJCPAxtUgYsbzK8AdpUuXA5W64Wddvc5dPLsfZwP0qzRV/wVO43dJM149kKmDbvlclg8XSqTBquSouarBoWvp+cp7VXaxwE9HAJYFlLdJHyBNniiBXwFzMHwil7tNYQ5L2UAei5E9kbE+x1NtdFTvNDa5kObcBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TKMx7cjayhGES3G8jN+5b5BKkccbaSW3tboBnzSFJRg=;
 b=NFYHhHRwzoDZY/iGjDVRmWsU0OSMEJpXXIptxaw3eZk2mNLsFpurNlA/70S1VOkCxwEBf6WzrTcSUbGQgSTa78t6+RVALU4mSSkIEiozwOdnJO6u1zktjYnINuUitWE9HhDmgNFHr7yAgp1TgM0SHLbksdzMA/9GhHAJ0ALfppsaSuIpY7YSGLwCM1tTGyoVyZNwz+XsUciWp4/G/MPFkplKucxNAjIUFJQWwBDBY7zDQXic4jZeqobvXun99TvMLunnPDYkC9QLVyiz+Sx3mZsGNE5EbGxHEbgY/Z7F0BX7VmcNUf+LJYSXpkyxVin4AUfEzsjodxoKLEw1NSMNaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TKMx7cjayhGES3G8jN+5b5BKkccbaSW3tboBnzSFJRg=;
 b=D0CJPh5RV7UvHuf8zKIlVnFIwr2f+XJTM/7o0ft0nV8c+KfZJXz6DPbfXogxo2mfAsY9xI47Uiw7HTu6R3aNMvTXMfzC0qZLWu+QEUEnf3AL7gtx/rU9BfZA63OQnzBw+tmP4E2o5wZsdKKzLGCne0+3ZPo04ru1tlSkzr8Nowo=
From: Henry Wang <Henry.Wang@arm.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	George Dunlap <george.dunlap@citrix.com>
Subject: RE: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Topic: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
Thread-Index: AQHY5RPn4YgYN4uuDkuaQs+f2Uthxa4YXmcQ
Date: Fri, 21 Oct 2022 06:14:18 +0000
Message-ID:
 <AS8PR08MB7991574CCEAE030A6236F6E2922D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
References: <20221021061042.12083-1-jgross@suse.com>
In-Reply-To: <20221021061042.12083-1-jgross@suse.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ts-tracking-id: 4A04E0102FFAA349A1195F3288038433.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AS8PR08MB7991:EE_|AS8PR08MB7839:EE_|VI1EUR03FT017:EE_|AM8PR08MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 6153487e-333f-4842-61c3-08dab32b81ed
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 LOBIVRxaaaTaxxHPTWXQOytXN+g7cAa+mC/yg4xGNKkP4Oz3AzseCEQpwsJQadKMo3xL8iGXnTbBMHVYSYZyN36oGFFZ2JGMsx9uuZNmfJJkfOgI0wqWhiFXL535djwzNYuBgfl+xRBgSI5OyaK6fB8zg/VGOXLXO6io2L5zxE5xmLrjSVJzWFVwAfEVFS/YC/P+fhzKWf9xKW5h7lI0ghFo3tkwCp3SklxuFkD+APnFeVnGwwrFruFJ8AB6w5QX6TmRYEWbsAP+uRxTaQhlb/LDz2klyGCsG+6sLH/4mAut1fsgNfv0+iRoKJrshSoUdoT5Sg3u6NbuQiR3ouoPHvbYwMHEJXIhy8pnKkOKsH1zsYdg1Trl6TSilzgk7EkNgIPhGbZMDakfdl4Uu3Lqwmz5mRBBNv6tcpMKgSu2iTlYXGAEjmHX2V8+iSgPaYczCmbMv4fKPnspbkLLa83LJlnCWvrVCmQh8k1nkXCQCNP3Tnf8Ngo4RkQf80ThuLRa221nnbL2yUg76NeAjkY9tpk26JWG+vU+QSNZuCSJy+d/xRIGFzOCSJqeW4aAvvTUPyvh1J/eFiB5sdFlx2Z/RWPX4pRSlLIgsAi6fUQL+MnStD7SIjswZdUPHxlpPHMaWvgmHwBwXONqshb0UhM4n2aV4nZImPymCBJOKVNREWL199JheXcpm2zTuAe7BA6ULL2t55WrYmFBdrp+gZ5aHSpDoLSZUibhwel/TqlnQMKs/7IQNjp50+5eGTSFSK5lN1duSTT8Nw+f1eNS379Qaw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB7991.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(110136005)(71200400001)(186003)(83380400001)(38100700002)(38070700005)(8936002)(122000001)(54906003)(2906002)(5660300002)(4326008)(64756008)(8676002)(52536014)(86362001)(41300700001)(7696005)(9686003)(316002)(6506007)(26005)(55016003)(66446008)(66476007)(66946007)(478600001)(66556008)(76116006)(33656002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7839
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9f345de-0abc-46f0-f1e8-08dab32b7ca1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6yIQpPCe6egx7DCbwoBV4LfJ9/+TIkm1TyuvlBWELtFXrRmshe7TQtMJpDk3DqxNolkgWmNe5ZXvmVKQrtQ8AQcxR5V+P2RMZrSNNCWyvXl+crFLexGYSfjaIcwMSe9rNs+1slC/+rH1En2tutnouYFlbF0E6lDzNgn/t9IMqLunIZIKTWreKaWblkb/3VSYXQw+zs4UPdmSfWCA6qffwZF/kW1INBtjxYJMp5jJYx5B4asTGPpuXrYl3Hj0rCqFNX5B9qfPaO8Y5xqoZlZnJMn7wD8aFsWm25STyGxtDGSnBIWMHCst20eo9tJ49goUSrWhR0yLD7nlWbB9U37RmKPnALY4AQ+tHNU47fsxCB6m3d7GsadRxBrVgXH6gar4vuqnXseuMVxWY3QJaKsd1Kxg1YjD8yVgbKb7jeGqfifhxhpEH7M+2c0G6ymTpEwYEnuDWAO1eCbmE8xQwWE9t4uNzw9IwGuzBJ1HDHP/Dlx4HOU4Fhxgs2pSeklWQrOJlmR+GYiJi8CjggyeyQJh8dtxaAo0o+rHPCnvv59hsEcmqIvzoXAB+0H3jftlQkWmW9d0NdGLmtEpsKJfOFjlY+c+3Ry5w3Epf9u5f48SaE5yLtkzSLr3cgMd/jckrxcUaXAUWFcf0EYZohB6lX/tMPbx/zCzN2Ik3ORNvCRNyPx7aGEMI6f8o6Rm68HBLq6l9RLt3oosCxWDXdsbdBLviJTrh9/uKE30E4kWxSAPt4RYRnKxlLD3wOujqxtT+MPr1cod1PhrqKMqtnI3y10o8g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199015)(40470700004)(36840700001)(46966006)(478600001)(82310400005)(82740400003)(81166007)(36860700001)(356005)(110136005)(54906003)(86362001)(316002)(83380400001)(47076005)(107886003)(26005)(9686003)(33656002)(2906002)(186003)(40480700001)(336012)(55016003)(8676002)(4326008)(40460700003)(70586007)(70206006)(8936002)(5660300002)(52536014)(6506007)(41300700001)(7696005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 06:14:27.0192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6153487e-333f-4842-61c3-08dab32b81ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5713

Hi Juergen,

> -----Original Message-----
> From: Juergen Gross <jgross@suse.com>
> Subject: [PATCH-for-4.17] xen/sched: fix race in RTDS scheduler
>=20
> When a domain gets paused the unit runnable state can change to "not
> runnable" without the scheduling lock being involved. This means that
> a specific scheduler isn't involved in this change of runnable state.
>=20
> In the RTDS scheduler this can result in an inconsistency in case a
> unit is losing its "runnable" capability while the RTDS scheduler's
> scheduling function is active. RTDS will remove the unit from the run
> queue, but doesn't do so for the replenish queue, leading to hitting
> an ASSERT() in replq_insert() later when the domain is unpaused again.
>=20
> Fix that by removing the unit from the replenish queue as well in this
> case.
>=20
> Fixes: 7c7b407e7772 ("xen/sched: introduce unit_runnable_state()")
> Signed-off-by: Juergen Gross <jgross@suse.com>

Thanks for the quick fix.

Release-acked-by: Henry Wang <Henry.Wang@arm.com>

Kind regards,
Henry

> ---
>  xen/common/sched/rt.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/xen/common/sched/rt.c b/xen/common/sched/rt.c
> index d6de25531b..960a8033e2 100644
> --- a/xen/common/sched/rt.c
> +++ b/xen/common/sched/rt.c
> @@ -1087,6 +1087,7 @@ rt_schedule(const struct scheduler *ops, struct
> sched_unit *currunit,
>          else if ( !unit_runnable_state(snext->unit) )
>          {
>              q_remove(snext);
> +            replq_remove(ops, snext);
>              snext =3D rt_unit(sched_idle_unit(sched_cpu));
>          }
>=20
> --
> 2.35.3


