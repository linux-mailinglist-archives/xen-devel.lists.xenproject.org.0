Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A54BD60DECA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 12:21:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430421.682113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWY-0005BI-69; Wed, 26 Oct 2022 10:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430421.682113; Wed, 26 Oct 2022 10:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ondWY-00059m-2I; Wed, 26 Oct 2022 10:20:38 +0000
Received: by outflank-mailman (input) for mailman id 430421;
 Wed, 26 Oct 2022 10:20:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ktaj=23=arm.com=Luca.Fancellu@srs-se1.protection.inumbo.net>)
 id 1ondWW-00057W-9I
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 10:20:36 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130079.outbound.protection.outlook.com [40.107.13.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d29b554a-5517-11ed-8fd0-01056ac49cbb;
 Wed, 26 Oct 2022 12:20:32 +0200 (CEST)
Received: from AM6P192CA0076.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:8d::17)
 by DU0PR08MB8495.eurprd08.prod.outlook.com (2603:10a6:10:404::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.23; Wed, 26 Oct
 2022 10:20:29 +0000
Received: from AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8d:cafe::d6) by AM6P192CA0076.outlook.office365.com
 (2603:10a6:209:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Wed, 26 Oct 2022 10:20:29 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT037.mail.protection.outlook.com (100.127.140.225) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Wed, 26 Oct 2022 10:20:29 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130");
 Wed, 26 Oct 2022 10:20:28 +0000
Received: from e82de94c9f3f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 09C7FF23-605D-4A32-811C-9532A5E6707D.1; 
 Wed, 26 Oct 2022 10:20:22 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e82de94c9f3f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 26 Oct 2022 10:20:22 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com (2603:10a6:208:103::16)
 by AS8PR08MB6248.eurprd08.prod.outlook.com (2603:10a6:20b:298::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 10:20:20 +0000
Received: from AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef]) by AM0PR08MB3809.eurprd08.prod.outlook.com
 ([fe80::52d5:6f8c:1348:f8ef%7]) with mapi id 15.20.5746.026; Wed, 26 Oct 2022
 10:20:19 +0000
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
X-Inumbo-ID: d29b554a-5517-11ed-8fd0-01056ac49cbb
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=amzAk+pI2edN+PGuqe4kSybgBwq7/1WyPjyGp5h1H+NKF1o2nLZzbtakFq4yLfu3IElMrlZV/ZFvv84S1s7FpmuBPI0gC/77kl1plFUR3YfzFpJNfov6cgPTDHkUxPmEBS3KHmId1N5B8OLC7xGnP+9lHtJmS6q0IKG62njMyFAzarp5tlB1bB2Hsu+cQKQUfjgOi9Epo/Y3oHuVF6AY64smMZXspJNNn1aR9qiljb33Q79b0KedEIqFEVK7v52zW14s1CBEcNzXBEXgCOylqQ//XAl3l5SB2Mej5bTrxURl07Z1Lc74aB6Wv4mm7fiFhZytIZOPuARpGO1pXv2uzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyXPhPts4Vai/7vpUY1xXhX9z8gky+b/vGUdY4Mn2TA=;
 b=Q28YcjvMyja2CdR3G24dCS27i9j3RZH1svSVYBsfLXmEBTcnmdfddmaI2iNHPYLk7NZmsQFTt5owzLCYCRtkDSTyC35Ro1kfOcSNWm7AMsPko9W7A0eZCITF+PrSiEDsGRhzQPoIXIaffs22hkDQ0Ax+C5g6+yD9KJEioKeFYIwQIvB3mApIdPyWzLn9eXMvQffmYLorTlz218RFOhF3nsgYaYSuHHx6EdJ9PR42y1UTuo7zB220iaXdh4OIN5/qTELJf4vm0eiij6Kcm8Pu7HgMLz2ZRm0SgtsSxlJjL6mQLMhBTTe9HNIdBo1/ikRzp9rm9X3/g+0+6gwBIINQaw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyXPhPts4Vai/7vpUY1xXhX9z8gky+b/vGUdY4Mn2TA=;
 b=o9QOvfW/EcPFjPEKXnt7Qpb+sbDSn7T69t/SES7KPQ5GYWRUxOQ45IATtA7UkG+WtxjeHuKbz8tFtDoZuVz9O7LSaB1UtLbTy6Q9iQWsXesRl3fBjl9+ww3ul1wMvBQskeWY5g3wZ7jBtysw06FVG3cqwMTqBgaVdzRwe6jVFrs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: abf7183d88ed49cf
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu2h26Q0mokWVNuqFEv/DobIH/EfuvwDm/iwCF9uRYtAP5CVuQpZe+2t7PWPjOQk/QiqL6yAQ27B8PmA0pNx2KK7+lsyyLhB2fUuoqSOUg8QPfkxBG51nL3d/BrUc1b6j0F0y6mlXVxMkriCRjZAV5yWY1KfLQdPIdKH+Dd4mpnixGMtRspRHNhuRB4T3vfJk1bjnV38ze/iOfpvZjrV39faqgcOi2F2U74SMmGeOrL4vFdwigzJuBTi2777GLrfVcp1rNkIkOUKkdfWR5hxJsq1vXdZhWiWyyU5yW/KvDFT5NxE6TxDX9tA7Eys1AMi6FZjGzO5coprv5VF5MontA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyXPhPts4Vai/7vpUY1xXhX9z8gky+b/vGUdY4Mn2TA=;
 b=i0Gr4d0WLpT3pX/FP1274WrHWWAxLoAbHaI07Sx/FrDQkCzmkVRPNUfx5fU897zCREujf2f5HkhAGgMnhbwMFCV1q70qs3drleXW6RqcTkc2IamNHsYpaICeoGoFa32Wb1pnwiS9req3W+rCmQBaIp/JZrhQtwTnh65pmOIvyUWr1KIgS0xphuZ/IC7wNBAjzkfvmVoqkUFlwpz1UuqS/0+dXPGsU9eiRGW+lMbY0Xw84/JXEj3AZwir357xHMb4eTzdn1BNepVtSVsRObuydSfHPcS26iovIunrTMp2NvogmZR4hNuzxxIEOeT/mlyo0D9HQqaZLO216zU1kBaJtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RyXPhPts4Vai/7vpUY1xXhX9z8gky+b/vGUdY4Mn2TA=;
 b=o9QOvfW/EcPFjPEKXnt7Qpb+sbDSn7T69t/SES7KPQ5GYWRUxOQ45IATtA7UkG+WtxjeHuKbz8tFtDoZuVz9O7LSaB1UtLbTy6Q9iQWsXesRl3fBjl9+ww3ul1wMvBQskeWY5g3wZ7jBtysw06FVG3cqwMTqBgaVdzRwe6jVFrs=
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Julien Grall <julien@xen.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Bertrand Marquis
	<Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Subject: Re: [v2] Proposal for deviations in static analyser findings
Thread-Topic: [v2] Proposal for deviations in static analyser findings
Thread-Index: AQHY6FpvvKvqm6eEhUKW2GdsP99AnK4gbCUAgAAMPQA=
Date: Wed, 26 Oct 2022 10:20:19 +0000
Message-ID: <CD551386-FC55-4624-B4BE-D14DAFA1DC74@arm.com>
References: <83A7652A-3F00-4490-837F-81498808FCC7@arm.com>
 <4ec8b702-aebf-2ce4-78e9-2f72d1b53cc3@xen.org>
In-Reply-To: <4ec8b702-aebf-2ce4-78e9-2f72d1b53cc3@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic:
	AM0PR08MB3809:EE_|AS8PR08MB6248:EE_|AM7EUR03FT037:EE_|DU0PR08MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 8530919e-3f15-4654-dc5e-08dab73bb4d1
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 tmkW1d/Tt85qf3fbMtmTGKZrT+xhD2X9NYRkQfsiRuUq9mQLKd591A0Vr1nWkmsrPFtgN/DIsXaW/md1wrOrvuDwxAsAZHQYktllgsaGlJTtqZKJwpCi4mZHX6IFOJ8b0hAr1PC1xl8R5AKPsFwfibcFCtAeie7AkQUeUMZEW7KwALcJY/y6rXyKx0fcdSDTLQsLhGWI1xmCsSVmH18wlB36x784KWfmLtf9jg5opnCbZfQquz53JrS9iQGkgauNzMtxTurOtUOEKBEXKWS9QWHgF/fONDRmEFWjaIcWGEWZyPnXjuvF+JlswwFEBWKYaI2ariX69qJv+eZ4FgN8Dfoztq+q2B6xc9g8MJsYiqQXXcSO98lwfdmgUjZTfegioCiGYHNKov2egZtFqsFAjtOy5dUH8m+INoHoW7WBZN/4QVzUxYDb9OghPZsu2UcdOjmlKMcJjASHc72ab829b08FIL6z38qHQh0mA3xGqaM4t4kcwTZsvtTpRwdpo4IisiesWf+5nDPlT9GH4OV8Plp9kq5ko5DqyUmKWKjajaVgLHx8RUaIO4OP2jGEzn4O07IpAzilbTv7nu4VAq0uxxdtDYw5DXjSVKBnE/B5Mt1WZcrrPPj7vRCwC9wb7lg1MvuT1MS1t+66CUEhQMpWOZHiMHho87nlrDsZNXGF3Nls3vLCNre84d55pYzINFuUhqyUBNuoRhoxf3xZFrZjhdb4C1Ub7JbawFu7w595NHpjHx0gO+c+Ft3861DWw665E/witCoWHCWkv8hKQ1+lVJShepj2od2BHj5qSwSi2Z+2fKu+2sjVeey275oFPI3hfmLEnR84eaZNiZgDWXF5cDiObEtLyj8s+17FH/MkXvFdh/8OHPX2Q8SEsaTTmorg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR08MB3809.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(39860400002)(396003)(376002)(366004)(451199015)(86362001)(36756003)(33656002)(38070700005)(122000001)(38100700002)(2906002)(83380400001)(5660300002)(8936002)(6506007)(2616005)(186003)(53546011)(6512007)(26005)(54906003)(6916009)(8676002)(316002)(66476007)(71200400001)(478600001)(64756008)(76116006)(91956017)(66446008)(66556008)(66946007)(6486002)(966005)(41300700001)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <0BEAE9B929989449A37B7D43075AE199@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6248
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1d7846e2-0406-478d-0ae3-08dab73baf22
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Th+Myq+c3qBqU+QvZRCBmCPhi/6tE/mDPNMzRlPngFBif68MvEOXx2V5NnG9T2Kk1+WFfWxAZj5CD0Zy6naaB6hWZm/fzj6iKHnyWB+TD8k+0nAvyR1x+N+xR5ACwMdOV+6Z/eUdD4d3gvLN8nJRC8ucxao0DgQHmvpjsAclgUhoJaovh8ecAmKKjCPVGsPdjL+u2jNEYVLZS+qhoVPiOzg/ldw9CW5OTIW+01pFqzSD8IbcgssiXVUgjFdyNJztNHQyHaYwZ27+GU8DaqTQX3u398Rj/kzUcTUndTn5p2QjIlDW3pAmf7ijXiM4Q7FAQOPODDme+lIygH9lAJ1v4OqKIaypIwV8fHZ97EQDo5uoHmDlq2Cfag3UiL/rb/YncxGoHTAX83sYjkmtuAwBD6UL5Zrxji7VgeeoZf2DC8gk1B4APE4AJVT8f30pkKPVXC9zUg/lyG8OhH8rs5HxR5SbsUp+ABmDSNt+HNVvMzWVZwU8lQsJqJWpHeHndAffk7pil06D+/NsQbDPwEDWCPX8fm8J2VHv76/zFwb5DWoYrpezyNlJJ6o3zKiuJVaIAu8D1zTxE3uhnJU8vPG53uCxy9/yt6FrYeUai7hp6zimhCzuzECX5rbhF48DZgN5gTxqC+xjRc1dtrNTeRS0Pt2hGcKnclekf9JP+O0lZUHp2pTAMLJTxQPPkJHxBQmHHzfgEqCikmnc3CW0OAuNOrMY+t0IGveKe2/1LJEi/NHCWbpj/pRq+ZBfMtdBtlOZC91VLvHmbrrfhE2FtdrRNrwiXIAgblwYfmh2wWn7vAvR9tRoBBtoaZyXP9zVMIhZxZJuYTBMwusyDMPJI4PmPg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199015)(40470700004)(46966006)(36840700001)(966005)(478600001)(6486002)(86362001)(83380400001)(70206006)(53546011)(54906003)(6506007)(6512007)(107886003)(8676002)(70586007)(36756003)(4326008)(6862004)(26005)(41300700001)(8936002)(5660300002)(82310400005)(40480700001)(40460700003)(33656002)(2906002)(186003)(2616005)(47076005)(336012)(356005)(81166007)(82740400003)(36860700001)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 10:20:29.0171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8530919e-3f15-4654-dc5e-08dab73bb4d1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8495

DQoNCj4gT24gMjYgT2N0IDIwMjIsIGF0IDEwOjM2LCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4ZW4u
b3JnPiB3cm90ZToNCj4gDQo+IA0KPiANCj4gT24gMjUvMTAvMjAyMiAxMToxMywgTHVjYSBGYW5j
ZWxsdSB3cm90ZToNCj4+IEhpIGFsbCwNCj4gDQo+IEhpIEx1Y2EsDQo+IA0KPiBTb21lIGNvbW1l
bnRzIGJlbG93IGlmIHdlIHBsYW4gdG8gbWVyZ2UgdGhlIGRvYyBpbiB0aGUgdHJlZS4NCj4gDQo+
PiBUaGlzIGlzIHRoZSBWMiBvZiB0aGUgcHJvcG9zYWwgZm9yIGRldmlhdGlvbnMgdGFnZ2luZyBp
biB0aGUgWGVuIGNvZGViYXNlLCB0aGlzIGluY2x1ZGVzDQo+PiBhbGwgdGhlIGZlZWRiYWNrcyBm
cm9tIHRoZSBGdVNhIHNlc3Npb24gaGVsZCBhdCB0aGUgWGVuIFN1bW1pdCAyMDIyIGFuZCBhbGwg
dGhlDQo+PiBmZWVkYmFja3MgcmVjZWl2ZWQgaW4gdGhlIHByZXZpb3VzIHByb3Bvc2FsIHNlbnQg
b24gdGhlIG1haWxpbmcgbGlzdC4NCj4+IEhlcmUgYSBsaW5rIHRvIHRoZSBwcmV2aW91cyB0aHJl
YWQ6DQo+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMjItMTAvbXNnMDA1NDEuaHRtbCA+DQo+PiBEb2N1bWVudGluZyB2aW9sYXRpb25zDQo+
PiA9PT09PT09PT09PT09PT09PT09PT09DQo+PiBTdGF0aWMgYW5hbHlzZXJzIGFyZSB1c2VkIG9u
IHRoZSBYZW4gY29kZWJhc2UgZm9yIGJvdGggc3RhdGljIGFuYWx5c2lzIGFuZCBNSVNSQQ0KPj4g
Y29tcGxpYW5jZS4NCj4+IFRoZXJlIG1pZ2h0IGJlIHRoZSBuZWVkIHRvIHN1cHByZXNzIHNvbWUg
ZmluZGluZ3MgaW5zdGVhZCBvZiBmaXhpbmcgdGhlbSBhbmQNCj4+IG1hbnkgdG9vbHMgcGVybWl0
IHRoZSB1c2FnZSBvZiBpbi1jb2RlIGNvbW1lbnRzIHRoYXQgc3VwcHJlc3MgZmluZGluZ3Mgc28g
dGhhdA0KPj4gdGhleSBhcmUgbm90IHNob3duIGluIHRoZSBmaW5hbCByZXBvcnQuDQo+PiBYZW4g
d2lsbCBpbmNsdWRlIGEgdG9vbCBjYXBhYmxlIG9mIHRyYW5zbGF0aW5nIGEgc3BlY2lmaWMgY29t
bWVudCB1c2VkIGluIGl0cw0KPj4gY29kZWJhc2UgdG8gdGhlIHJpZ2h0IHByb3ByaWV0YXJ5IGlu
LWNvZGUgY29tbWVudCB1bmRlcnN0YW5kYWJsZSBieSB0aGUgc2VsZWN0ZWQNCj4+IGFuYWx5c2Vy
IHRoYXQgc3VwcHJlc3MgaXRzIGZpbmRpbmcuDQo+PiBJbiB0aGUgWGVuIGNvZGViYXNlLCB0aGVz
ZSB0YWdzIHdpbGwgYmUgdXNlZCB0byBkb2N1bWVudCBhbmQgc3VwcHJlc3MgZmluZGluZ3M6DQo+
PiAtIFNBRi1YLXNhZmU6IFRoaXMgdGFnIG1lYW5zIHRoYXQgdGhlIG5leHQgbGluZSBvZiBjb2Rl
IGNvbnRhaW5zIGEgZmluZGluZywgYnV0DQo+PiAgdGhlIG5vbiBjb21wbGlhbmNlIHRvIHRoZSBj
aGVja2VyIGlzIGFuYWx5c2VkIGFuZCBkZW1vbnN0cmF0ZWQgdG8gYmUgc2FmZS4NCj4+IC0gU0FG
LVgtZmFsc2UtcG9zaXRpdmUtPHRvb2w+OiBUaGlzIHRhZyBtZWFucyB0aGF0IHRoZSBuZXh0IGxp
bmUgb2YgY29kZSBjb250YWlucyBhDQo+PiAgZmluZGluZywgYnV0IHRoZSBmaW5kaW5nIGlzIGEg
YnVnIG9mIHRoZSB0b29sLg0KPj4gU0FGIHN0YW5kcyBmb3IgU3RhdGljIEFuYWx5c2VyIEZpbmRp
bmcsIHRoZSBYIGlzIGEgcGxhY2Vob2xkZXIgZm9yIGEgcG9zaXRpdmUNCj4+IG51bWJlciwgdGhl
IG51bWJlciBhZnRlciBTQUYtIHNoYWxsIGJlIGluY3JlbWVudGFsIGFuZCB1bmlxdWUsIGJhc2Ug
dGVuDQo+PiBub3RhdGlvbiBhbmQgd2l0aG91dCBsZWFkaW5nIHplcm9zLg0KPj4gRW50cmllcyBp
biB0aGUgZGF0YWJhc2Ugc2hvdWxkIG5ldmVyIGJlIHJlbW92ZWQsIGV2ZW4gaWYgdGhleSBhcmUg
bm90IHVzZWQNCj4+IGFueW1vcmUgaW4gdGhlIGNvZGUgKGlmIGEgcGF0Y2ggaXMgcmVtb3Zpbmcg
b3IgbW9kaWZ5aW5nIHRoZSBmYXVsdHkgbGluZSkuDQo+PiBUaGlzIGlzIHRvIG1ha2Ugc3VyZSB0
aGF0IG51bWJlcnMgYXJlIG5vdCByZXVzZWQgd2hpY2ggY291bGQgbGVhZCB0byBjb25mbGljdHMN
Cj4+IHdpdGggb2xkIGJyYW5jaGVzIG9yIG1pc2xlYWRpbmcganVzdGlmaWNhdGlvbnMuDQo+PiBB
biBlbnRyeSBjYW4gYmUgcmV1c2VkIGluIG11bHRpcGxlIHBsYWNlcyBpbiB0aGUgY29kZSB0byBz
dXBwcmVzcyBhIGZpbmRpbmcgaWYNCj4+IGFuZCBvbmx5IGlmIHRoZSBqdXN0aWZpY2F0aW9uIGhv
bGRzIGZvciB0aGUgc2FtZSBub24tY29tcGxpYW5jZSB0byB0aGUgY29kaW5nDQo+PiBzdGFuZGFy
ZC4NCj4+IEFuIG9ycGhhbiBlbnRyeSwgdGhhdCBpcyBhbiBlbnRyeSB3aG8gd2FzIGp1c3RpZnlp
bmcgYSBmaW5kaW5nIGluIHRoZSBjb2RlLCBidXQgbGF0ZXINCj4+IHRoYXQgY29kZSB3YXMgcmVt
b3ZlZCBhbmQgdGhlcmUgaXMgbm8gb3RoZXIgdXNlIG9mIHRoYXQgZW50cnkgaW4gdGhlIGNvZGUs
IGNhbiBiZQ0KPj4gcmV1c2VkIGFzIGxvbmcgYXMgdGhlIGp1c3RpZmljYXRpb24gZm9yIHRoZSBm
aW5kaW5nIGhvbGRzLiBUaGlzIGlzIGRvbmUgdG8gYXZvaWQgdGhlDQo+PiBhbGxvY2F0aW9uIG9m
IGEgbmV3IGVudHJ5IHdpdGggZXhhY3RseSB0aGUgc2FtZSBqdXN0aWZpY2F0aW9uLCB0aGF0IHdv
dWxkIGxlYWQgdG8gd2FzdGUNCj4+IG9mIHNwYWNlIGFuZCBtYWludGVuYW5jZSBpc3N1ZXMgb2Yg
dGhlIGRhdGFiYXNlLg0KPj4gVGhlIGZpbGVzIHdoZXJlIHRvIHN0b3JlIGFsbCB0aGUganVzdGlm
aWNhdGlvbnMgYXJlIGluIHhlbi9kb2NzL21pc3JhLyBhbmQgYXJlDQo+PiBuYW1lZCBhcyBzYWZl
Lmpzb24gYW5kIGZhbHNlLXBvc2l0aXZlLTx0b29sPi5qc29uLCB0aGV5IGhhdmUgSlNPTiBmb3Jt
YXQsIGVudHJpZXMNCj4+IG9mIHRoZXNlIGZpbGVzIGhhdmUgaW5kZXBlbmRlbnQgSUQgbnVtYmVy
aW5nLg0KPj4gSGVyZSBpcyBhbiBleGFtcGxlIHRvIGFkZCBhIG5ldyBqdXN0aWZpY2F0aW9uIGlu
IHNhZmUuanNvbjo6DQo+PiB8ew0KPj4gfCAgICAidmVyc2lvbiI6ICIxLjAiLA0KPj4gfCAgICAi
Y29udGVudCI6IFsNCj4+IHwgICAgICAgIHsNCj4+IHwgICAgICAgICAgICAiaWQiOiJTQUYtMC1z
YWZlIiwNCj4+IHwgICAgICAgICAgICAiYW5hbHlzZXIiOiB7DQo+PiB8ICAgICAgICAgICAgICAg
ICJjcHBjaGVjayI6ICJtaXNyYS1jMjAxMi0yMC43IiwNCj4+IHwgICAgICAgICAgICAgICAgImNv
dmVyaXR5IjogIm1pc3JhX2NfMjAxMl9ydWxlXzIwXzdfdmlvbGF0aW9uIiwNCj4+IHwgICAgICAg
ICAgICAgICAgImVjbGFpciI6ICJNQzNSMS5SMjAuNyINCj4+IHwgICAgICAgICAgICB9LA0KPj4g
fCAgICAgICAgICAgICJuYW1lIjog4oCcUjIwLjcgQyBtYWNybyBwYXJhbWV0ZXJzIG5vdCB1c2Vk
IGFzIGV4cHJlc3Npb24iLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBtYWNybyBwYXJh
bWV0ZXJzIHVzZWQgaW4gdGhpcyBb4oCmXSINCj4+IHwgICAgICAgIH0sDQo+PiB8ICAgICAgICB7
DQo+PiB8ICAgICAgICAgICAgImlkIjrigJ1TQUYtMS1zYWZlIiwNCj4+IHwgICAgICAgICAgICAi
YW5hbHlzZXIiOiB7DQo+PiB8ICAgICAgICAgICAgICAgICJjcHBjaGVjayI6ICJ1bnJlYWRWYXJp
YWJsZSIsDQo+PiB8ICAgICAgICAgICAgICAgICJjb3Zlcml0eSI6ICJVTlVTRURfVkFMVUUiDQo+
PiB8ICAgICAgICAgICAgfSwNCj4+IHwgICAgICAgICAgICAibmFtZSI6IOKAnFZhcmlhYmxlIHNl
dCBidXQgbm90IHVzZWQiLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0Ijog4oCcSXQgaXMgc2FmZSBi
ZWNhdXNlIFvigKZdIg0KPj4gfCAgICAgICAgfSwNCj4+IHwgICAgICAgIHsNCj4+IHwgICAgICAg
ICAgICAiaWQiOuKAnVNBRi0yLXNhZmUiLA0KPj4gfCAgICAgICAgICAgICJhbmFseXNlciI6IHt9
LA0KPj4gfCAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCj4+IHwgICAgICAgICAgICAi
dGV4dCI6ICIiDQo+PiB8ICAgICAgICB9DQo+PiB8ICAgIF0NCj4+IHx9DQo+PiBIZXJlIGlzIGFu
IGV4YW1wbGUgdG8gYWRkIGEgbmV3IGp1c3RpZmljYXRpb24gaW4gZmFsc2UtcG9zaXRpdmUtY3Bw
Y2hlY2suanNvbjo6DQo+PiB8ew0KPj4gfCAgICAidmVyc2lvbiI6ICIxLjAiLA0KPj4gfCAgICAi
Y29udGVudCI6IFsNCj4+IHwgICAgICAgIHsNCj4+IHwgICAgICAgICAgICAiaWQiOiJTQUYtMC1m
YWxzZS1wb3NpdGl2ZS1jcHBjaGVjayIsDQo+PiB8ICAgICAgICAgICAgImFuYWx5c2VyIjogew0K
Pj4gfCAgICAgICAgICAgICAgICAiY3BwY2hlY2siOiAibWlzcmEtYzIwMTItMjAuNyINCj4+IHwg
ICAgICAgICAgICB9LA0KPj4gfCAgICAgICAgICAgIOKAnHRvb2wtdmVyc2lvbuKAnTog4oCcMi43
IiwNCj4+IHwgICAgICAgICAgICAibmFtZSI6IOKAnFIyMC43IHNlY29uZCBvcGVyYW5kIG9mIG1l
bWJlci1hY2Nlc3Mgb3BlcmF0b3IiLA0KPj4gfCAgICAgICAgICAgICJ0ZXh0IjogIlRoZSBzZWNv
bmQgb3BlcmFuZCBvZiBhIG1lbWJlciBhY2Nlc3Mgb3BlcmF0b3Igc2hhbGwgYmUgYSBuYW1lIG9m
IGEgbWVtYmVyIG9mIHRoZSB0eXBlIHBvaW50ZWQgdG8sIHNvIGluIHRoaXMgcGFydGljdWxhciBj
YXNlIGl0IGlzIHdyb25nIHRvIHVzZSBwYXJlbnRoZXNlcyBvbiB0aGUgbWFjcm8gcGFyYW1ldGVy
LiINCj4+IHwgICAgICAgIH0sDQo+PiB8ICAgICAgICB7DQo+PiB8ICAgICAgICAgICAgImlkIjri
gJ1TQUYtMS1mYWxzZS1wb3NpdGl2ZS1jcHBjaGVjayIsDQo+PiB8ICAgICAgICAgICAgImFuYWx5
c2VyIjoge30sDQo+PiB8ICAgICAgICAgICAg4oCcdG9vbC12ZXJzaW9u4oCdOiDigJwiLA0KPj4g
fCAgICAgICAgICAgICJuYW1lIjogIlNlbnRpbmVsIiwNCj4+IHwgICAgICAgICAgICAidGV4dCI6
ICIiDQo+PiB8ICAgICAgICB9DQo+PiB8ICAgIF0NCj4+IHx9DQo+PiBUbyBkb2N1bWVudCBhIGZp
bmRpbmcsIGp1c3QgYWRkIGFub3RoZXIgYmxvY2sge1suLi5dfSBiZWZvcmUgdGhlIHNlbnRpbmVs
IGJsb2NrLA0KPj4gdXNpbmcgdGhlIGlkIGNvbnRhaW5lZCBpbiB0aGUgc2VudGluZWwgYmxvY2sg
YW5kIGluY3JlbWVudCBieSBvbmUgdGhlIG51bWJlcg0KPj4gY29udGFpbmVkIGluIHRoZSBpZCBv
ZiB0aGUgc2VudGluZWwgYmxvY2suDQo+PiBIZXJlIGEgYnJpZWYgZXhwbGFuYXRpb24gb2YgdGhl
IGZpZWxkIGluc2lkZSBhbiBvYmplY3Qgb2YgdGhlICJjb250ZW50IiBhcnJheToNCj4gDQo+IFlv
dSBkb24ndCBzZWVtIHRvIGhhdmUgYSBsb25nZXIgZXhwbGFuYXRpb24gYWZ0ZXJ3YXJkcy4gU28g
SSB3b3VsZCBkcm9wICJicmllZiIuDQoNCk9rIHdpbGwgcmVtb3ZlIGl0DQoNCj4gDQo+PiAtIGlk
OiBpdCBpcyBhIHVuaXF1ZSBzdHJpbmcgdGhhdCBpcyB1c2VkIHRvIHJlZmVyIHRvIHRoZSBmaW5k
aW5nLCBtYW55IGZpbmRpbmcNCj4+ICBjYW4gYmUgdGFnZ2VkIHdpdGggdGhlIHNhbWUgaWQsIGlm
IHRoZSBqdXN0aWZpY2F0aW9uIGhvbGRzIGZvciBhbnkgYXBwbGllZA0KPj4gIGNhc2UuDQo+PiAg
SXQgdGVsbHMgdGhlIHRvb2wgdG8gc3Vic3RpdHV0ZSBhIFhlbiBpbi1jb2RlIGNvbW1lbnQgaGF2
aW5nIHRoaXMgc3RydWN0dXJlOg0KPj4gIC8qIFNBRi0wLXNhZmUgWy4uLl0gXCovDQo+PiAtIGFu
YWx5c2VyOiBpdCBpcyBhbiBvYmplY3QgY29udGFpbmluZyBwYWlyIG9mIGtleS12YWx1ZSBzdHJp
bmdzLCB0aGUga2V5IGlzDQo+PiAgdGhlIGFuYWx5c2VyLCBzbyBpdCBjYW4gYmUgY3BwY2hlY2ss
IGNvdmVyaXR5IG9yIGVjbGFpci4gVGhlIHZhbHVlIGlzIHRoZQ0KPj4gIHByb3ByaWV0YXJ5IGlk
IGNvcnJlc3BvbmRpbmcgb24gdGhlIGZpbmRpbmcsIGZvciBleGFtcGxlIHdoZW4gY292ZXJpdHkg
aXMNCj4+ICB1c2VkIGFzIGFuYWx5c2VyLCB0aGUgdG9vbCB3aWxsIHRyYW5zbGF0ZSB0aGUgWGVu
IGluLWNvZGUgY29tZW50IGluIHRoaXMgd2F5Og0KPj4gIC8qIFNBRi0wLXNhZmUgWy4uLl0gXCov
IC0+IC8qIGNvdmVyaXR5W2NvdmVyaXR5LWlkXSBcKi8NCj4+ICBpZiB0aGUgb2JqZWN0IGRvZXNu
J3QgaGF2ZSBhIGtleS12YWx1ZSwgdGhlbiB0aGUgY29ycmVzcG9uZGluZyBpbi1jb2RlDQo+PiAg
Y29tbWVudCB3b24ndCBiZSB0cmFuc2xhdGVkLg0KPj4gLSBuYW1lOiBhIHNpbXBsZSBuYW1lIGZv
ciB0aGUgZmluZGluZw0KPj4gLSB0ZXh0OiBhIHByb3BlciBqdXN0aWZpY2F0aW9uIHRvIHR1cm4g
b2ZmIHRoZSBmaW5kaW5nLg0KPj4gSGVyZSBhbiBleGFtcGxlIG9mIHRoZSB1c2FnZSBvZiB0aGUg
aW4tY29kZSBjb21tZW50IHRhZ3MgdG8gc3VwcHJlc3MgYSBmaW5kaW5nIGZvciB0aGUgUnVsZSA4
LjY6DQo+PiBFY2xhaXIgcmVwb3J0cyBpdCBoZXJlOg0KPj4gaHR0cHM6Ly9lY2xhaXJpdC5jb206
Mzc4Ny9mcy92YXIvbGliL2plbmtpbnMvam9icy9YRU4vY29uZmlndXJhdGlvbnMvYXhpcy1UYXJn
ZXQvQVJNNjQvYXhpcy1hZ2VudC9wdWJsaWMvYnVpbGRzLzU0OS9hcmNoaXZlL0VDTEFJUi9vdXQv
UFJPSkVDVC5lY2Q7L3NvdXJjZXMveGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oLmh0bWwjUjUwNzQz
XzENCj4gDQo+IEhvdyBzdGFibGUgaXMgdGhpcyBsaW5rPw0KDQpBdCBmaXJzdCBJIHRob3VnaHQg
dG8gZG9u4oCZdCBwdXQgaW4gdGhlIGRvY3VtZW50IHRoZSBleGFtcGxlLCBzbyBJIHdvdWxkIGhh
dmUgZHJvcHBlZCBmcm9tIOKAnEhlcmUgYW4gZXhhbXBsZSBvZiB0aGUgdXNhZ2Ugb2YgdGhlIGlu
LWNvZGUgW+KApl3igJ0sDQpidXQgSSB1bmRlcnN0YW5kIEkgd2FzIG5vdCB2ZXJ5IGNsZWFyIG9u
IHRoYXQsIGFuZCBJIHNlZSB0aGUgZXhhbXBsZSBjb3VsZCBiZSBhbHNvIHVzZWZ1bCwgc28gSSB0
aGluayBJIGNhbiBjcmVhdGUgYSBzZWN0aW9uIGluIHRoZSBkb2N1bWVudA0KbGlrZSB0aGlzIGJl
bG93IGFuZCBJIHdvdWxkIGRyb3AgdGhlIGxpbmsgaW4gZmF2b3VyIG9mIHNvbWUgdGV4dCBmcm9t
IGVjbGFpciByZXBvcnQuDQoNCg0KSnVzdGlmaWNhdGlvbiBleGFtcGxlDQotLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCg0KSGVyZSBhbiBleGFtcGxlIG9mIHRoZSB1c2FnZSBvZiB0aGUgaW4tY29kZSBj
b21tZW50IHRhZ3MgdG8gc3VwcHJlc3MgYSBmaW5kaW5nDQpmb3IgdGhlIFJ1bGUgOC42Og0KDQpF
Y2xhaXIgcmVwb3J0cyBpdCBpbiBpdHMgcmVwb3J0Og0KDQp8IFtlbGNhaXIgcmVwb3J0XSAobm93
IGVjbGFpciBpcyB1bnJlYWNoYWJsZSBmb3IgYW4gaW50ZXJuYWwgZXJyb3IsIEkgd2lsbCB0YWtl
IHRoZSBvdXRwdXQgd2hlbiBpdCB3aWxsIGJlIGJhY2spDQp8IFsuLi5dDQoNCkFsc28gY292ZXJp
dHkgcmVwb3J0cyBpdCwgaGVyZSBhbiBleHRyYWN0IG9mIHRoZSBmaW5kaW5nOg0KDQp8IHhlbi9p
bmNsdWRlL3hlbi9rZXJuZWwuaDo2ODoNCnwgMS4gbWlzcmFfY18yMDEyX3J1bGVfOF82X3Zpb2xh
dGlvbjogRnVuY3Rpb24gIl9zdGFydCIgaXMgZGVjbGFyZWQgYnV0IG5ldmVyDQogZGVmaW5lZC4N
Cg0KVGhlIGFuYWx5c2VycyBhcmUgY29tcGxhaW5pbmcgYmVjYXVzZSB3ZSBoYXZlIHRoaXMgaW4g
eGVuL2luY2x1ZGUveGVuL2tlcm5lbC5oDQphdCBsaW5lIDY4OjoNCg0KfCBleHRlcm4gY2hhciBf
c3RhcnRbXSwgX2VuZFtdLCBzdGFydFtdOw0KDQpUaG9zZSBhcmUgc3ltYm9scyBleHBvcnRlZCBi
eSB0aGUgbGlua2VyLCBoZW5jZSB3ZSB3aWxsIG5lZWQgdG8gaGF2ZSBhIHByb3Blcg0KZGV2aWF0
aW9uIGZvciB0aGlzIGZpbmRpbmcuDQoNCldlIHdpbGwgcHJlcGFyZSBvdXIgZW50cnkgaW4gdGhl
IGRhdGFiYXNlOjoNCg0KfHsNCnwgICAgInZlcnNpb24iOiAiMS4wIiwNCnwgICAgImNvbnRlbnQi
OiBbDQp8ICAgICAgICB7DQp8ICAgICAgICBbLi4uXQ0KfCAgICAgICAgfSwNCnwgICAgICAgIHsN
CnwgICAgICAgICAgICAiaWQiOiAiU0FGLTEtc2FmZSIsDQp8ICAgICAgICAgICAgImFuYWx5c2Vy
Ijogew0KfCAgICAgICAgICAgICAgICDigJxlY2xhaXIiOiAiTUMzUjEuUjguNiIsDQp8ICAgICAg
ICAgICAgICAgICJjb3Zlcml0eSI6ICJtaXNyYV9jXzIwMTJfcnVsZV84XzZfdmlvbGF0aW9uIg0K
fCAgICAgICAgICAgIH0sDQp8ICAgICAgICAgICAgIm5hbWUiOiAiUnVsZSA4LjY6IGxpbmtlciBk
ZWZpbmVkIHN5bWJvbHMiLA0KfCAgICAgICAgICAgICJ0ZXh0IjogIkl0IGlzIHNhZmUgdG8gZGVj
bGFyZSB0aGlzIHN5bWJvbCBiZWNhdXNlIGl0IGlzIGRlZmluZWQgaW4gdGhlIGxpbmtlciBzY3Jp
cHQuIg0KfCAgICAgICAgfSwNCnwgICAgICAgIHsNCnwgICAgICAgICAgICAiaWQiOiAiU0FGLTIt
c2FmZSIsDQp8ICAgICAgICAgICAgImFuYWx5c2VyIjoge30sDQp8ICAgICAgICAgICAgIm5hbWUi
OiAiU2VudGluZWwiLA0KfCAgICAgICAgICAgICJ0ZXh0IjogIiINCnwgICAgICAgIH0NCnwgICAg
XQ0KfH0NCg0KQW5kIHdlIHdpbGwgdXNlIHRoZSBwcm9wZXIgdGFnIGFib3ZlIHRoZSB2aW9sYXRp
b24gbGluZTo6DQoNCnwgLyogU0FGLTEtc2FmZSBbb3B0aW9uYWwgdGV4dF0gKi8NCnwgZXh0ZXJu
IGNoYXIgX3N0YXJ0W10sIF9lbmRbXSwgc3RhcnRbXTsNCg0KVGhpcyBlbnRyeSB3aWxsIGZpeCBh
bHNvIHRoZSB2aW9sYXRpb24gb24gX2VuZCBhbmQgc3RhcnQsIGJlY2F1c2UgdGhleSBhcmUgb24N
CnRoZSBzYW1lIGxpbmUgYW5kIHRoZSBzYW1lICJ2aW9sYXRpb24gSUQiLg0KDQpBbHNvLCB0aGUg
c2FtZSB0YWcgY2FuIGJlIHVzZWQgb24gb3RoZXIgc3ltYm9scyBmcm9tIHRoZSBsaW5rZXIgdGhh
dCBhcmUNCmRlY2xhcmVkIGluIHRoZSBjb2RlYmFzZSwgYmVjYXVzZSB0aGUganVzdGlmaWNhdGlv
biBob2xkcyBmb3IgdGhlbSB0b28uDQoNCg0KPiANCj4gVGhlIHJlc3Qgb2YgdGhlIGRvY3VtZW50
IExHVE0uDQo+IA0KPiBDaGVlcnMsDQo+IA0KPiAtLSANCj4gSnVsaWVuIEdyYWxsDQoNCg==

