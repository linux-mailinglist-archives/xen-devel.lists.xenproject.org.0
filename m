Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98776620B5F
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 09:42:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439791.693844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osKBY-0006Zo-Ki; Tue, 08 Nov 2022 08:42:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439791.693844; Tue, 08 Nov 2022 08:42:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osKBY-0006XB-HJ; Tue, 08 Nov 2022 08:42:20 +0000
Received: by outflank-mailman (input) for mailman id 439791;
 Tue, 08 Nov 2022 08:42:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MuAS=3I=arm.com=Bertrand.Marquis@srs-se1.protection.inumbo.net>)
 id 1osKBX-0006X5-0r
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 08:42:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60072.outbound.protection.outlook.com [40.107.6.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4088db3d-5f41-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 09:42:18 +0100 (CET)
Received: from FR3P281CA0116.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::20)
 by PAWPR08MB9006.eurprd08.prod.outlook.com (2603:10a6:102:33f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 08:42:15 +0000
Received: from VI1EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::dc) by FR3P281CA0116.outlook.office365.com
 (2603:10a6:d10:a3::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12 via Frontend
 Transport; Tue, 8 Nov 2022 08:42:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VI1EUR03FT057.mail.protection.outlook.com (100.127.144.80) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Tue, 8 Nov 2022 08:42:15 +0000
Received: ("Tessian outbound f394866f3f2b:v130");
 Tue, 08 Nov 2022 08:42:14 +0000
Received: from cd498ec1f242.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6F23D40A-F792-4CDF-9175-FD64F57E8016.1; 
 Tue, 08 Nov 2022 08:42:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id cd498ec1f242.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 08 Nov 2022 08:42:07 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com (2603:10a6:20b:85::25)
 by PAXPR08MB6413.eurprd08.prod.outlook.com (2603:10a6:102:de::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Tue, 8 Nov
 2022 08:42:04 +0000
Received: from AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad]) by AM6PR08MB3784.eurprd08.prod.outlook.com
 ([fe80::58db:2a7f:e8f5:92ad%7]) with mapi id 15.20.5813.011; Tue, 8 Nov 2022
 08:42:04 +0000
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
X-Inumbo-ID: 4088db3d-5f41-11ed-8fd1-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UIevRZjnzGE+7GIdLxhUkDPKOvutXW0r2eRhw0NXcTN/wnPhE/jtm0dykxhncYG4+NVnCdi3XkAEpAP//GK5fd/GX5UumUy+zGxqqBsXNUB/tmMIXDJpH/Q0KzgBCenVhyPGSxqXz0eekNvSqXN2vh+Wln37u5+eFqTXu6IN5Q9zY7lhXPj4SagUnbpvIKdjKJg3PPk05uhEtJLR8q+6IDjRYm1pZasY9vvELFJl+TUle3otW1KLaDE3VqV+Dbb7OaXxGGHBpALfibG83CEcH5U08zbxfJPB0wFxKaTMiQWg1NBLCuSEDFOd6XKXSdtLcYYVKt1UpFPQHKFsJ3XxzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTFXpf/o0Bd9v3h4yz6oODoHhqevYb8YgG/KqecYylU=;
 b=LsRxscsCv8OkDXJdkSzKMMuWnL3RcC83s41oUNg+u5uEieKmMdds3w5OMtHNJYWhrgl0yj4yvh/C0k5OTbsHuDd6y1C8R3AwTsLMEgDuvIdUI4KUDUOj0scOd6JykEpA/9XGu/W5Yao1K4EXOhXDm9Vb5pkrYfIUUmVaC+hCrTTlW/uJK97reUIr8tfcgM9QNBwb0XMJZjtQ1cF6JW1TJg24bI2Jt42LUzqVwVNX9fKOupKqAXyX7FJjDErAnw817sOzmNFtKU/+MFAvbmx+kB3QxBOJ0wtYMqtNzrKzr5TzrErtDZOPTFsVvcvuKbUAnEy6i07H9SFuI55GRrvbWg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTFXpf/o0Bd9v3h4yz6oODoHhqevYb8YgG/KqecYylU=;
 b=2GPN9BEqlEhT3lX4jLDgbcxeo5lOz4AdFlfeeKYIQxHP6yLeX+agzv4tA2Jb4Ra8OE7ijUROeVMe4Dkks3h4OzYDJ1Ph3aMR0ZwwMHiiZHko34qX/2bloVABcSJJYMsiFf5U+YG4e2lXz2zE2dZJD1Y7i6WAgoaXQt1vWpACRRg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7571397ea764579f
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m0FNDvs0Cx6/1w1qKIj5xrHXRHfBa765pFD3uaeDkkDxXcaKkwzZ8cPq/8WwBA95tDHPqym+LoVPgKtEWNt/3ZgFSo+WRIpguIqU9ieP/j88MnVy/vPNLiZ/cXlj18Mp9rHcUsAJ9RAinEPjM7MZKgfgTnnXsoHi9trTVuJfQJvBqoVZOnS84sm+r5nXJI80OsVyqN5c0ZP/93gFNGPKXQtA7werM4d3cqCHjlvuod+zPgq8FDRUsltuOtkpesaTcEIYf6D+2G6nsXNOJ3nUEZJtd8t/fu1RyCGcY9PkOxelKWyVUFg1OGjzc6Ia50P6dxMdSjPzukV4dozp+V9qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tTFXpf/o0Bd9v3h4yz6oODoHhqevYb8YgG/KqecYylU=;
 b=TC0YCG7ffNzmaH6NT+LGma8aqejB33oJB0aZRkXPTAj9eiGqkPkJATBQEicn8dK4qMAoZPFvDt6yiPc+0eI6DGdGG1TJE9M4KKfOO1HWE1FkFPagN/SyxBeZKzbCyx9kpgZ/aLVAMzu9ebEIdjGUjIcJIbGuAclmgxaKOiFbLMx9kRvC/r2gLG70MXIxK5Wt4XEP3Q1GJeyLHNLXUVDFRKdijeU1ouQwIsnkft3M9VHmRaH49Z2V2NuBMU/hDH2yJAQKcttQj5HSfpoPwiLmNLADxmkeZMPdNX+RknsFbFqWJ277T9/B1WxF7oAyRm6SsRZF45/jOkDhuVtM1bLlhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tTFXpf/o0Bd9v3h4yz6oODoHhqevYb8YgG/KqecYylU=;
 b=2GPN9BEqlEhT3lX4jLDgbcxeo5lOz4AdFlfeeKYIQxHP6yLeX+agzv4tA2Jb4Ra8OE7ijUROeVMe4Dkks3h4OzYDJ1Ph3aMR0ZwwMHiiZHko34qX/2bloVABcSJJYMsiFf5U+YG4e2lXz2zE2dZJD1Y7i6WAgoaXQt1vWpACRRg=
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Michal Orzel <michal.orzel@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Doug
 Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Topic: [PATCH v3 0/4] Yocto Gitlab CI
Thread-Index: AQHY7TFh2hDh7VPqHUGkPo4tUdJZza4okuGAgAAFoQCACog5gIABoNWA
Date: Tue, 8 Nov 2022 08:42:04 +0000
Message-ID: <DBC5A7D4-2826-4F9A-80C4-CE84679530B7@arm.com>
References: <cover.1667224593.git.bertrand.marquis@arm.com>
 <1220596a-4fe7-5c08-5437-fa98eb14254c@amd.com>
 <D1248F50-542B-474D-B016-A3BF09A21CE8@arm.com>
 <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
In-Reply-To: <6ee0706b-d1b3-187a-1557-c4b8173c6e37@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM6PR08MB3784:EE_|PAXPR08MB6413:EE_|VI1EUR03FT057:EE_|PAWPR08MB9006:EE_
X-MS-Office365-Filtering-Correlation-Id: b6639d57-e698-4065-0a3d-08dac1652327
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /FqUxAvWr/vmnmKXhudWiJ/vrzbGnfttcgzBbIJH+HbXDasJUoTmBZzxscsYWOYl6RZvtxTxglvaloEEMMZhuj9pj40PKG2CN2UXSbHck4L0ExjSenlsS4jz971uG2p3mGy6HLTvCLi/AgNzViBr3t2b5a6F0hQTN4lkpujVsj4LBdJRUuMNB2uJuBiJDnmYtcFJCP7FyWt8ygcWDIeRkzttADwz662E6z3kEQidGqSVimFqcfLgvt2nRwWKJfQmw5HNW15D2lDEJNsoHuIXPBxEZpgyUsxQZZ2ghPm6/2IFR7LFXPu9neG6dIKF0M4F3KNsEyVC95XWy8oVxDPYwUAZlRTJWG7w/O6QDlJ+ckW35S1365njH2qAPL53i/T24NCSNycLkFXUfzirhQr0nzUBtFYX0h6V01G2hmAhFlzjksssOMQ72iU7Iuas/7bhnsqaNj0GgPrEmwir8bJdLHb9A4yKT/9LyTk/Uv4fGh63kuPDlweQ/TilRVwI6oOloBDtXwGXy7LCmugHdiRbP2PQ07k7y+hLNUkr5KcNotVHyYejW5hb1h+3K+H50tKaqtzSTdhr85ZNWqmfo1TNCf+9/Ca5DyZWt4jZiMplNoA49ei2I0DgAYfjLzSdWPATE+bsoz5BTndcWcqrWWgYCJVS7TuX89cGFPaMkrOH0CdOu0quQsU4EBzzYfc8bMjtpUxwhVTclB+764CFNHUA/iInrmxFIIm3cu76VP2wMRQXQnECfz3X923fN7cQdknAN+JatPGNMeG3rkyawhamd8biyoUP+RMbY7ya54UxWVMWoxTNe1udrrcrNHNV4x+XUYEhVp1o1tGWux/BBGko9Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3784.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199015)(4326008)(478600001)(2906002)(66946007)(66446008)(91956017)(76116006)(33656002)(316002)(66476007)(8676002)(64756008)(66556008)(5660300002)(6486002)(8936002)(966005)(71200400001)(41300700001)(38070700005)(83380400001)(54906003)(122000001)(38100700002)(6506007)(86362001)(2616005)(186003)(26005)(6512007)(53546011)(6916009)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA1F5E5D7F150B41B37CB62149A29D49@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6413
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VI1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bedacc5-2997-4ad2-7b75-08dac1651c94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OVMWKU9rYIc4TllVRng/xYzGlPq/iizfUzsJXfDpOiLOFR7EycGO9VXzUaSpAuaDMKGpzWsypuB0jA3hroE7WwJDedkVaK+oUwroaOvnqcMnK96CwILG7tw/cOvbscZSwCNtmrY2Bip/ADc9/uIHY0bq+PQxBdx4hrlAUNOrw261m6YCD2TDavxqvNBIG/VIRRejwnjyHByA3Ms4BzSH6Gefq1IwlFgt4GaL4j4GEXtmzCxcBKrmNu7+7xmZXvRzSemhwH6qGoNs9/Qu1UCFtuxNYesIYkS71rxxXL8CD+XufQoJuaYv2fCLr5rOFaM/5jvEv8OfS0/SAx97+Jcp/g+edgPGYXKe78CCtSdr+VqFryZmo+IiYy9qEjTx+gnJ1NY8TYl0SXX/yY9e43JwZDjMRYA7iykV24wr5tUbLaD2hrLKAJ8MK6ip2MXcAhuUbtg4g1I8on8iH5pbvqRnOJNhM9zNR4UGi3iJiIRM9FtqEI6/1yFOuQvTqgLfhIfrqxrF8oJ1Ru0skWpUSwy2f9df1/w9zaEX1rGUblKUX3C3pSO1uWFc1+QHS7QrLAUd00TVUdBnF0mEeKKUpAWcpQTJX7M+4hMBT4lJqyHxgwM6onRrcbnpsyPUKj4vcTSOeD/9+tEtoOVmHVZlz27gX5dpJ2Tg9NayGFZO1TufrySxLtAiJVxrAt3GKmAqn1rQhilg8YHu6yyZcqGCWmCIcdo2mwCQ8yIRFWSLuNfwiQn7394LiQ9yv2JJIirMUaUxrSClhKXV9i0N/WFfZAnJGV4sKxIhN4YDcpzNe5ZDClaG8CFzPjxrn671Fql8CiSc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(478600001)(966005)(6862004)(6486002)(8936002)(5660300002)(2906002)(53546011)(356005)(40480700001)(26005)(36756003)(107886003)(81166007)(70206006)(4326008)(70586007)(36860700001)(8676002)(2616005)(54906003)(186003)(33656002)(82310400005)(6506007)(6512007)(316002)(83380400001)(86362001)(40460700003)(41300700001)(82740400003)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 08:42:15.0559
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6639d57-e698-4065-0a3d-08dac1652327
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VI1EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9006

SGkgTWljaGFsLA0KDQo+IE9uIDcgTm92IDIwMjIsIGF0IDA3OjUwLCBNaWNoYWwgT3J6ZWwgPG1p
Y2hhbC5vcnplbEBhbWQuY29tPiB3cm90ZToNCj4gDQo+IEhpIEJlcnRyYW5kIGFuZCBTdGVmYW5v
LA0KPiANCj4gT24gMzEvMTAvMjAyMiAxNjowMCwgQmVydHJhbmQgTWFycXVpcyB3cm90ZToNCj4+
IA0KPj4gDQo+PiBIaSBNaWNoYWwsDQo+PiANCj4+PiBPbiAzMSBPY3QgMjAyMiwgYXQgMTQ6Mzks
IE1pY2hhbCBPcnplbCA8bWljaGFsLm9yemVsQGFtZC5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IEhp
IEJlcnRyYW5kLA0KPj4+IA0KPj4+IE9uIDMxLzEwLzIwMjIgMTU6MDAsIEJlcnRyYW5kIE1hcnF1
aXMgd3JvdGU6DQo+Pj4+IA0KPj4+PiANCj4+Pj4gVGhpcyBwYXRjaCBzZXJpZXMgaXMgYSBmaXJz
dCBhdHRlbXB0IHRvIGNoZWNrIGlmIHdlIGNvdWxkIHVzZSBZb2N0byBpbg0KPj4+PiBnaXRsYWIg
Y2kgdG8gYnVpbGQgYW5kIHJ1biB4ZW4gb24gcWVtdSBmb3IgYXJtLCBhcm02NCBhbmQgeDg2Lg0K
Pj4+PiANCj4+Pj4gVGhlIGZpcnN0IHBhdGNoIGlzIGNyZWF0aW5nIGEgY29udGFpbmVyIHdpdGgg
YWxsIGVsZW1lbnRzIHJlcXVpcmVkIHRvDQo+Pj4+IGJ1aWxkIFlvY3RvLCBhIGNoZWNrb3V0IG9m
IHRoZSB5b2N0byBsYXllcnMgcmVxdWlyZWQgYW5kIGFuIGhlbHBlcg0KPj4+PiBzY3JpcHQgdG8g
YnVpbGQgYW5kIHJ1biB4ZW4gb24gcWVtdSB3aXRoIHlvY3RvLg0KPj4+PiANCj4+Pj4gVGhlIHNl
Y29uZCBwYXRjaCBpcyBjcmVhdGluZyBjb250YWluZXJzIHdpdGggYSBmaXJzdCBidWlsZCBvZiB5
b2N0byBkb25lDQo+Pj4+IHNvIHRoYXQgc3VzYnNlcXVlbnQgYnVpbGQgd2l0aCB0aG9zZSBjb250
YWluZXJzIHdvdWxkIG9ubHkgcmVidWlsZCB3aGF0DQo+Pj4+IHdhcyBjaGFuZ2VkIGFuZCB0YWtl
IHRoZSByZXN0IGZyb20gdGhlIGNhY2hlLg0KPj4+PiANCj4+Pj4gVGhlIHRoaXJkIHBhdGNoIGlz
IGFkZGluZyBhIHdheSB0byBlYXNpbHkgY2xlYW4gbG9jYWxseSBjcmVhdGVkDQo+Pj4+IGNvbnRh
aW5lcnMuDQo+Pj4+IA0KPj4+PiBUaGlzIGlzIGlzIG1haW5seSBmb3IgZGlzY3Vzc2lvbiBhbmQg
c2hhcmluZyBhcyB0aGVyZSBhcmUgc3RpbGwgc29tZQ0KPj4+PiBpc3N1ZXMvcHJvYmxlbSB0byBz
b2x2ZToNCj4+Pj4gLSBidWlsZGluZyB0aGUgcWVtdSogY29udGFpbmVycyBjYW4gdGFrZSBzZXZl
cmFsIGhvdXJzIGRlcGVuZGluZyBvbiB0aGUNCj4+Pj4gbmV0d29yayBiYW5kd2l0aCBhbmQgY29t
cHV0aW5nIHBvd2VyIG9mIHRoZSBtYWNoaW5lIHdoZXJlIHRob3NlIGFyZQ0KPj4+PiBjcmVhdGVk
DQo+Pj4gVGhpcyBpcyBub3QgcmVhbGx5IGFuIGlzc3VlIGFzIHRoZSBidWlsZCBvZiB0aGUgY29u
dGFpbmVycyBvY2N1cnMgb24gdGhlIGxvY2FsDQo+Pj4gbWFjaGluZXMgYmVmb3JlIHB1c2hpbmcg
dGhlbSB0byByZWdpc3RyeS4gQWxzbywgYnVpbGRpbmcgdGhlIGNvbnRhaW5lcnMNCj4+PiB3aWxs
IG9ubHkgYmUgcmVxdWlyZWQgZm9yIG5ldyBZb2N0byByZWxlYXNlcy4NCj4+PiANCj4+Pj4gLSBw
cm9kdWNlZCBjb250YWluZXJzIGNvbnRhaW5pbmcgdGhlIGNhY2hlIGhhdmUgYSBzaXplIGJldHdl
ZW4gOCBhbmQNCj4+Pj4gMTJHQiBkZXBlbmRpbmcgb24gdGhlIGFyY2hpdGVjdHVyZS4gV2UgbWln
aHQgbmVlZCB0byBzdG9yZSB0aGUgYnVpbGQNCj4+Pj4gY2FjaGUgc29tZXdoZXJlIGVsc2UgdG8g
cmVkdWNlIHRoZSBzaXplLiBJZiB3ZSBjaG9vc2UgdG8gaGF2ZSBvbmUNCj4+Pj4gc2luZ2xlIGlt
YWdlLCB0aGUgbmVlZGVkIHNpemUgaXMgYXJvdW5kIDIwR0IgYW5kIHdlIG5lZWQgdXAgdG8gNDBH
Qg0KPj4+PiBkdXJpbmcgdGhlIGJ1aWxkLCB3aGljaCBpcyB3aHkgSSBzcGxpdHRlZCB0aGVtLg0K
Pj4+PiAtIGR1cmluZyB0aGUgYnVpbGQgYW5kIHJ1biwgd2UgdXNlIGEgYml0IG1vcmUgdGhlbiAy
MEdCIG9mIGRpc2sgd2hpY2ggaXMNCj4+Pj4gb3ZlciB0aGUgYWxsb3dlZCBzaXplIGluIGdpdGxh
Yg0KPj4+IEFzIHdlIGNvdWxkIHNlZSBkdXJpbmcgdjIgdGVzdGluZywgd2UgZG8gbm90IGhhdmUg
YW55IHNwYWNlIHJlc3RyaWN0aW9ucw0KPj4+IG9uIHRoZSBYZW4gR2l0TGFiIGFuZCBJIHRoaW5r
IHdlIGFscmVhZHkgZGVjaWRlZCB0byBoYXZlIHRoZSBZb2N0bw0KPj4+IGludGVncmF0ZWQgaW50
byBvdXIgQ0kuDQo+PiANCj4+IFJpZ2h0LCBJIHNob3VsZCBoYXZlIG1vZGlmaWVkIHRoaXMgY2hh
cHRlciB0byBiZSBjb2hlcmVudCB3aXRoIHlvdXIgbGF0ZXN0IHRlc3RzLg0KPj4gU29ycnkgZm9y
IHRoYXQuDQo+PiANCj4+PiANCj4+PiBJIHdpbGwgZG8gc29tZSB0ZXN0aW5nIGFuZCBnZXQgYmFj
ayB0byB5b3Ugd2l0aCByZXN1bHRzICsgcmV2aWV3Lg0KPiBJIGRpZCBzb21lIHRlc3RpbmcgYW5k
IGhlcmUgYXJlIHRoZSByZXN1bHRzOg0KPiANCj4gSW4gdGhlIGN1cnJlbnQgZm9ybSB0aGlzIHNl
cmllcyB3aWxsIGZhaWwgd2hlbiBydW5uaW5nIENJIGJlY2F1c2UgdGhlIFlvY3RvIGNvbnRhaW5l
cnMNCj4gYXJlIGJhc2VkIG9uICJGcm9tIHVidW50dToyMi4wNCIgKHRoZXJlIGlzIG5vIHBsYXRm
b3JtIHByZWZpeCksIHdoaWNoIG1lYW5zIHRoYXQgdGhlIGNvbnRhaW5lcnMNCj4gYXJlIGJ1aWx0
IGZvciB0aGUgaG9zdCBhcmNoaXRlY3R1cmUgKGluIG15IGNhc2UgYW5kIGluIDk5JSBvZiB0aGUg
Y2FzZXMgb2YgdGhlIGxvY2FsIGJ1aWxkIGl0IHdpbGwNCj4gYmUgeDg2KS4gSW4gR2l0bGFiIHdl
IGhhdmUgMiBydW5uZXJzIChhcm02NCBhbmQgeDg2XzY0KS4gVGhpcyBtZWFucyB0aGF0IGFsbCB0
aGUgdGVzdCBqb2JzIHdvdWxkIG5lZWQNCj4gdG8gc3BlY2lmeSB4ODZfNjQgYXMgYSB0YWcgd2hl
biBrZWVwaW5nIHRoZSBjdXJyZW50IGJlaGF2aW9yLg0KPiBBZnRlciBJIGJ1aWx0IGFsbCB0aGUg
Y29udGFpbmVycyBvbiBteSB4ODYgbWFjaGluZSwgSSBwdXNoZWQgdGhlbSB0byByZWdpc3RyeSBh
bmQgdGhlIHBpcGVsaW5lIHdhcyBzdWNjZXNzZnVsOg0KPiBodHRwczovL2dpdGxhYi5jb20veGVu
LXByb2plY3QvcGVvcGxlL21vcnplbC94ZW4tb3J6ZWxtaWNoYWwvLS9waXBlbGluZXMvNjg2ODUz
OTM5DQo+IA0KPiBIZXJlIGlzIHRoZSBkaWZmIG9uIHBhdGNoIG5vLiAzIHRvIG1ha2UgdGhlIHNl
cmllcyB3b3JrICh1c2luZyB4ODYgdGFnIGFuZCBzbWFsbCBpbXByb3ZlbWVudCB0byBpbmNsdWRl
IG5lZWRzOiBbXSk6DQo+IGBgYA0KPiBkaWZmIC0tZ2l0IGEvYXV0b21hdGlvbi9naXRsYWItY2kv
dGVzdC55YW1sIGIvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sDQo+IGluZGV4IDVjNjIw
ZmVmY2U1OS4uNTJjY2NlYzZmOTA0IDEwMDY0NA0KPiAtLS0gYS9hdXRvbWF0aW9uL2dpdGxhYi1j
aS90ZXN0LnlhbWwNCj4gKysrIGIvYXV0b21hdGlvbi9naXRsYWItY2kvdGVzdC55YW1sDQo+IEBA
IC02NSw2ICs2NSw5IEBADQo+ICAgICBwYXRoczoNCj4gICAgICAgLSAnbG9ncy8qJw0KPiAgICAg
d2hlbjogYWx3YXlzDQo+ICsgIG5lZWRzOiBbXQ0KPiArICB0YWdzOg0KPiArICAgIC0geDg2XzY0
DQo+IA0KPiAjIFRlc3Qgam9icw0KPiBidWlsZC1lYWNoLWNvbW1pdC1nY2M6DQo+IEBAIC0yMDYs
MTkgKzIwOSwxMyBAQCB5b2N0by1xZW11YXJtNjQ6DQo+ICAgZXh0ZW5kczogLnlvY3RvLXRlc3QN
Cj4gICB2YXJpYWJsZXM6DQo+ICAgICBZT0NUT19CT0FSRDogcWVtdWFybTY0DQo+IC0gIHRhZ3M6
DQo+IC0gICAgLSBhcm02NA0KPiANCj4geW9jdG8tcWVtdWFybToNCj4gICBleHRlbmRzOiAueW9j
dG8tdGVzdA0KPiAgIHZhcmlhYmxlczoNCj4gICAgIFlPQ1RPX0JPQVJEOiBxZW11YXJtDQo+IC0g
IHRhZ3M6DQo+IC0gICAgLSBhcm0zMg0KPiANCj4geW9jdG8tcWVtdXg4Ni02NDoNCj4gICBleHRl
bmRzOiAueW9jdG8tdGVzdA0KPiAgIHZhcmlhYmxlczoNCj4gICAgIFlPQ1RPX0JPQVJEOiBxZW11
eDg2LTY0DQo+IC0gIHRhZ3M6DQo+IC0gICAgLSB4ODZfNjQNCj4gYGBgDQo+IA0KPiBOb3csIHRo
ZSBsb2dpY2FsIHdheSB3b3VsZCBiZSB0byBidWlsZCB4ODYgeW9jdG8gY29udGFpbmVyIGZvciB4
ODYsIGFybTY0IGZvciBhcm02NCBhbmQgYXJtMzIgb24gYXJtNjQgb3IgeDg2Lg0KPiBJIHRyaWVk
IGJ1aWxkaW5nIHRoZSBjb250YWluZXIgcWVtdWFybTY0IHNwZWNpZnlpbmcgdGFyZ2V0IGFybTY0
IG9uIHg4Ni4gQWZ0ZXIgMTVoLCBvbmx5IDcwJSBvZiB0aGUgWW9jdG8gYnVpbGQNCj4gd2FzIGNv
bXBsZXRlZCBhbmQgdGhlcmUgd2FzIGFuIGVycm9yIHdpdGggZ2xpYmMgKHRoZSBsb2NhbCBidWls
ZCBvZiB0aGUgY29udGFpbmVyIGZvciB0aGUgaG9zdCBhcmNoIHRha2VzIG9uIG15IG1hY2hpbmUg
bWF4IDJoKS4NCj4gVGhpcyBlbm9ybW91cyBhbW91bnQgb2YgdGltZSBpcyBkdWUgdG8gdGhlIHFl
bXUgZG9ja2VyIGVtdWxhdGlvbiB0aGF0IGhhcHBlbnMgYmVoaW5kIHRoZSBzY2VuZXMgKEkgY2hl
Y2tlZCBvbiAyIGRpZmZlcmVudCBtYWNoaW5lcykuDQo+IA0KPiBTbyB3ZSBoYXZlIDMgc29sdXRp
b25zOg0KPiAxKSBCdWlsZCBhbmQgcnVuIHRoZXNlIGNvbnRhaW5lcnMgZm9yL29uIHg4Nl82NDoN
Cj4gLSBsb2NhbCB1c2VycyBjYW4gYnVpbGQgdGhlIGNvbnRhaW5lcnMgb24gbG9jYWwgbWFjaGlu
ZXMgdGhhdCBhcmUgYWxtb3N0IGFsd2F5cyB4ODYgYmFzZWQsIGluIHNob3J0IHBlcmlvZCBvZiB0
aW1lLA0KPiAtICJldmVyeW9uZSIgY2FuIGJ1aWxkL3B1c2ggdGhlIGNvbnRhaW5lcnMgb25jZSB0
aGVyZSBpcyBhIG5ldyBZb2N0byByZWxlYXNlDQo+IC0gc2xpZ2h0bHkgc2xvd2VyIENJIGJ1aWxk
IHRpbWUNCj4gMikgQnVpbGQgYW5kIHJ1biB0aGVzZSBjb250YWluZXJzIGZvciBzcGVjaWZpYyBh
cmNoaXRlY3R1cmVzOg0KPiAtIGFsbW9zdCBubyBnbyBmb3IgbG9jYWwgdXNlcnMgdXNpbmcgeDg2
IG1hY2hpbmUgKHVubGVzcyB1c2luZyBtb3JlIHRoYW4gMTYgdGhyZWFkcyAod2hpY2ggSSB1c2Vk
KSBhbmQgd2lsbGluZyB0byB3YWl0IDIgZGF5cyBmb3IgdGhlIGJ1aWxkKQ0KPiAtIGZhc3RlciBD
SSBidWlsZCB0aW1lIChhcm02NCBydW5uZXIgaXMgZmFzdGVyIHRoYW4geDg2IG9uZSkNCj4gLSBz
b21lb25lIHdpdGggYXJtNjQgYmFzZWQgbWFjaGluZSAobm90IHRoYXQgY29tbW9uKSB3b3VsZCBo
YXZlIHRvIGJ1aWxkIGFuZCBwdXNoIHRoZSBjb250YWluZXJzDQo+IDMpIFRyeSB0byB1c2UgQ0kg
dG8gYnVpbGQgYW5kIHB1c2ggdGhlIGNvbnRhaW5lcnMgdG8gcmVnaXN0cnkNCj4gLSBpdCBjb3Vs
ZCBiZSBwb3NzaWJsZSBidXQgd2hhdCBhYm91dCBsb2NhbCB1c2Vycw0KDQpJIG1pZ2h0IGhhdmUg
YSBzb2x1dGlvbiA0Lg0KVGhlIGNvbnRhaW5lcnMgd2UgcHVzaGVkIHRvIGdpdGxhYiBhcmUgcHVi
bGljbHkgYWNjZXNzaWJsZSA/DQpTaG91bGRu4oCZdCB3ZSBwdXNoIGJvdGggdmVyc2lvbnMgdGhl
cmUgYW5kIHRoZW4gZG9jdW1lbnQgaG93IHNvbWVvbmUgY2FuIHJldHJpZXZlIGFuZCB1c2UgdGhv
c2UgY29udGFpbmVycyBpbnN0ZWFkIG9mIGJ1aWxkaW5nIHRoZW0gPw0KDQpUaGlzIHdheSB3ZSB3
aWxsIGRvIHRoZSBwdXNoIGJ1dCBhIG5vcm1hbCB1c2VyIHdvdWxkIGp1c3QgcmV0cmlldmUgdGhl
IGNvbnRhaW5lcnMgYW5kIHVzZSB0aGVtIHNvIGJ1aWxkaW5nIHRpbWUgd291bGQgaGF2ZSBsZXNz
IGltcGFjdCBhbmQgd2UgY291bGQgYnVpbGQgYm90aCBmbGF2b3VycyBvZiB0aGUgY29udGFpbmVy
cy4NCg0KPiANCj4gUmVnYXJkbGVzcyBvZiB3aGF0IHdlIGNob3NlLCB3ZSBuZWVkIHRvIGtlZXAg
aW4gbWluZCB0aGF0IHRoZSBiaWdnZXN0IGFkdmFudGFnZSB0byB0aGUgWW9jdG8gYnVpbGQvcnVu
IGlzIHRoYXQNCj4gaXQgYWxsb3dzL3Nob3VsZCBhbGxvdyBsb2NhbCB1c2VycyB0byBwZXJmb3Jt
IGJhc2ljIHRlc3RpbmcgZm9yIGFsbCB0aGUgWGVuIHN1cHBvcnRlZCBhcmNoaXRlY3R1cmVzLiBU
aGlzIGlzIGJlY2F1c2UNCj4gZXZlcnl0aGluZyBoYXBwZW5zIGluIG9uZSBwbGFjZSB3aXRoIG9u
ZSBjb21tYW5kLg0KDQpBZ3JlZS4NCg0KQmVydHJhbmQNCg0KPiANCj4gfk1pY2hhbA0KDQo=

