Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ED95F98FD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Oct 2022 09:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.419117.663846 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohmpq-0002Zk-Cj; Mon, 10 Oct 2022 07:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 419117.663846; Mon, 10 Oct 2022 07:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ohmpq-0002WZ-9o; Mon, 10 Oct 2022 07:04:22 +0000
Received: by outflank-mailman (input) for mailman id 419117;
 Mon, 10 Oct 2022 07:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=COA5=2L=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ohmpo-0002WT-UG
 for xen-devel@lists.xenproject.org; Mon, 10 Oct 2022 07:04:21 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bdf5cd7c-4869-11ed-9377-c1cf23e5d27e;
 Mon, 10 Oct 2022 09:04:11 +0200 (CEST)
Received: from AM5PR0402CA0009.eurprd04.prod.outlook.com
 (2603:10a6:203:90::19) by DB9PR08MB8358.eurprd08.prod.outlook.com
 (2603:10a6:10:3da::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Mon, 10 Oct
 2022 07:04:12 +0000
Received: from AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::e9) by AM5PR0402CA0009.outlook.office365.com
 (2603:10a6:203:90::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 07:04:12 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT029.mail.protection.outlook.com (100.127.140.143) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 07:04:12 +0000
Received: ("Tessian outbound 7761be2ecf00:v128");
 Mon, 10 Oct 2022 07:04:12 +0000
Received: from 32af92862b80.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7789DF43-2657-4214-B0B5-BBF05F08952E.1; 
 Mon, 10 Oct 2022 07:04:05 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 32af92862b80.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 10 Oct 2022 07:04:05 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by DBBPR08MB6155.eurprd08.prod.outlook.com (2603:10a6:10:1f5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.24; Mon, 10 Oct
 2022 07:04:02 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::b62d:6e04:1c26:6684%4]) with mapi id 15.20.5676.028; Mon, 10 Oct 2022
 07:04:02 +0000
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
X-Inumbo-ID: bdf5cd7c-4869-11ed-9377-c1cf23e5d27e
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HdZ6D9iXbS7AC/RDyAjKKOXArjxZOrvxxEsjzcrwAymw+dcujx/nzpHyfW5+Z6iT7CEXNDNOA6mbqG1bdAVcDsbiGFs3LCS/KWLGeZphhc8wcb8dlw0DzJLj2k3d3LTOncl2xnKUjTSu2evAS1MWhLduTY6KvnrIUbomjfbLm/Yft/EJHmtkJqPPTBFOhheWaRR2o2Bs3Hp4eBHdqGFHw8OpaFt8HRBVuM4Gur2igZ6sDl9NmvKZtam/tTu559q4UoqDVfCojzNeMT9DNwtSDauK7fbb2yFsMhuKVK8YijHERdd/c7qw57pOMLXhysYhVseqV50OGYOwsjNYNNi/DA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXs+Rw3c07S61ga/EnGPnDlOFegROYKN+yl/244Q074=;
 b=f0TaJXiS3zSf3lYMU9S1dJX3C1BYSd92AFb7Ve00FTkE5aEHcCcdjmtOJd/zAnEMj+vme2N01IB42MIoh9a5Hq8ftZkcKvVYfr6E0kb+vSclRqRoAdJd/mZnEZotSZw4WArLeiNj2vUHyONveInYoWHpJBaMTHRQKHJ1XrlFBd3meBso6rFKf//qNpIAkctXovHWWB+EXRCSezNACWlBHPibW+GtFQFq3KeHjUINuzNST4UetJttpkp6GUAJgqsE0gn3NoKmhX1vCRyAqQ7qy+xXzxU6bJol75hLgUe1TMA9tO9IbrHDk7g+GdPDKSoXdNfzc8WeRMD1/tH0C7PLEg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXs+Rw3c07S61ga/EnGPnDlOFegROYKN+yl/244Q074=;
 b=mt5SMSi6agSZC3lPfGXJ9oTxSod/ntXNptYIjg2w3qxjb/qxjzrMhmOG+ED4DbSw0iQEZbMwpT4mM7gan4Sv7hD86clo0rgYMUPHLkgjplcG1v4nqxYZdhVmvWOk7/F7/k8dwKCMCOO/v1pF60mrxbVOyIPwW4ysENp0q8nwgnI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9f8942d03c47dc84
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mmg+T+vYfwvpz0MXT6pdkoYHIC1wMAzblW0dn++sMjhsxAXAN3C/aNBGKxQYsp6ePPzIxTizaOl1n4mMSzN45iyOxKgxd5FRuU4wrVKhBUfTYOIjSlRqTaKL+8K/bPfxscumGE2zi1ksUVh/5pgH3Iqq+ew9CBa6AKGLCQvIlJmKhHUXBWEMkIetB4Pt77c5F4nv/x/rrkSCAAgH3uLvRGBzqVCg1IdLoeyJbzUN+BJ4NTEWKeDwtohdmkN1tnXzZKxRAmrCITmAx1iWEthiNZhsgb324hvAALnh8OTvKMr8DbZ5wQkLAaCdb/v9O+LeqMSGxRezKE2dTEnPLECq3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RXs+Rw3c07S61ga/EnGPnDlOFegROYKN+yl/244Q074=;
 b=O+ewbCVItR5XmaGceFuixHQAXNgD/pvL08F5N0z8ghRDZcDZWAq9AZPYXINzPyoehqr7YY343bxAtinRBt1SXJFFiICqdTdTKsDI9AzyUCa7+uePJeOg83D4PNa2OpDPWIDoWMyvJBIUqBlSqOj5bUV1pcfaY+RkC9JXFtOScXYRMX981/2SUE/DJ1OFEVS1ir68ezYBS8IdCa9FwnT9KVaelZWmUy/A5Ce09xNL08z6jv/S1lQgKRATIrlu/o7mSakmjkSZnDLqUkiUS8WXoZjSodqr7WiyVTo3i42E2drSBbJugOWn7NQtD1GlF7xU0Vh1tMgQPGv/knnG5uqoGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RXs+Rw3c07S61ga/EnGPnDlOFegROYKN+yl/244Q074=;
 b=mt5SMSi6agSZC3lPfGXJ9oTxSod/ntXNptYIjg2w3qxjb/qxjzrMhmOG+ED4DbSw0iQEZbMwpT4mM7gan4Sv7hD86clo0rgYMUPHLkgjplcG1v4nqxYZdhVmvWOk7/F7/k8dwKCMCOO/v1pF60mrxbVOyIPwW4ysENp0q8nwgnI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <e28f8faf-89fe-1e8f-4b8c-77097c2f2a90@arm.com>
Date: Mon, 10 Oct 2022 15:03:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH v5 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
From: Wei Chen <Wei.Chen@arm.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220920091218.1208658-1-wei.chen@arm.com>
 <20220920091218.1208658-6-wei.chen@arm.com>
 <5ac85819-9a1d-b8bc-d49d-13cb34a3e7e9@suse.com>
 <fc03f565-8c05-e310-fa0a-698ad7c569e3@arm.com>
 <47ec8e01-8ea6-4678-78c2-c67305fe3b7a@suse.com>
 <PAXPR08MB742077FE40B3FB0614787B599E569@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <9c32c4a9-d319-8886-c026-f33820a4f77b@suse.com>
 <PAXPR08MB7420DE5F342F17E77F5483879E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
In-Reply-To: <PAXPR08MB7420DE5F342F17E77F5483879E219@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::18) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB7420:EE_|DBBPR08MB6155:EE_|AM7EUR03FT029:EE_|DB9PR08MB8358:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ba7bb4-078b-4f2e-1c38-08daaa8da2c3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 2pH2ybIUkrqf4y8tz8WndK7EMkJL2NmF16tNARxqjpxoCz3pEgLjuqK0Vgkpi5lvZGEMbDysKkS9HiAuxhYoM6XZrEj34rqj7ODwAZSeKPtDDexpptay2fLiuWUk+XsvaWiaa1Fd00XIBC9Wm478EVlVlFQbu0w87NJwC9j4XMUMPrODPm8ssqKMOTojfSTkLjrsBcqGIEwUMZ7sqIs8LmqqAowAs3mjRi35fxNMrHSITHp3zLYVo9dgR9rWkwIDnqtOQQfEp37AP15sCxcGC+YCQn+ZlRGFuj/7zEScJyKyfNKvMcjhpZPVUh0vdKZEbnwPQ3c48Lxfgqkev+PCLi/xsj1Gc6yAS9+A/z263bLZWSuofsCd23NdYfFfF+/c6H9NkGZhh43VwxZuzp3NbYE9NunsjprBrlDBoRYxkdnCjeyCxPP7Xw0cFBJm43w3P5iLI8aKomYdhb6iQ7jIXuhgSQcyp7FKKQzDIY/F6lZP2oXrqF7APc/S6C8lydrbY28c8IwKyiNEl7U4/ed1puJGk/YHV2I6tDdtd24UOwMb3wgC8JwGX8UWgQF9DyX6U6W3JnmsyFd6x7YPsS4bX2BA2gkxRF3h/gataLQc6i5xc2eyVlL8SIL28gx+E1Za1m6V3c892kXhvMeEuF1sF8Jz4nEo1vBkNZAzTZpZ1m/l65ZKFXh5Dhn2sU8kKF3oc2wgsEkrLYjxYEaJ7pmAWyb7l96PVrgBfDAee1HOcQ9nVtm8YSe2y7mCqRhiiJfJDBbiKzPP5RcacWIMquh/I9pzewnOZ2HpwBBOHnnptFo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(451199015)(36756003)(31686004)(66899015)(86362001)(83380400001)(186003)(31696002)(38100700002)(6486002)(26005)(2906002)(2616005)(478600001)(6512007)(6506007)(316002)(5660300002)(53546011)(41300700001)(8936002)(4326008)(66946007)(66556008)(66476007)(54906003)(8676002)(6916009)(6666004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6155
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a1e4b1c-15c8-4893-9631-08daaa8d9cbf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e2FGSrW9Me7V1F54UnzU785Y/02J2v6N8UA20aSu1U0y0FAfH/q71h+4gJAAbnW2ZHerwvR7DQCsvpLKJzK7q6PeV0db7djaEkvTlJBO/YXohfpDJHkPC8q6mNktZIUSLVCGoK2w48bwOQODM+7RdswprA7XpgjoxALq/89Dh9ksqGMHcoiYPCeN8Uu9K8KBmJ0ok5t04vChRaWMb3bdZ0krqerjRnsGt1QLtUFkbWjPeeL4P4jA2Lsxhohu4OOUQ8Wrr66+5vrSlR0rS6pYK3geMA3Jq/hwtqSgwxO2BNYgnD3vGxZ3FJ89a7nrG6yebojerkQ0rpwThZhw/RXiGrEFS54NkV3lebbXQ81FIBl66pE71Nkbf6HGckuYZZ+QkVdqfA4db14X20zdMv3RW/oVXRrYsY1bKyGCch9aLc6q3n04HKyAtYePpZKttPAbkSPgYyITuJ3Jlcxl2L/JH+jke1HMUQohDaF8Uv3/KusXq8UFmVETtFMBrulyDJpYz5uutcpS0n8ar8Xfl9BP2om68Hf/GHTtLiVFp6eeUPELDuXzPdDsAXtR3yO1P/v5qd5mDS74FkQUzDLIPUpsFjqfnLRz112hqkXpMDjieDldw/KXrk8mTkkuLUszWuP9RI+eELbCYYEV6bKhClWUaYLRb0V42NIm2e1ZO0h6tvn0E2mqJGzoXaSyO/Ob6CQAwLbQtxTJjgcpphjWQg2Koa+HKbTxeExvsjFCq2sKUQZtiZUKAnyW0ga4Lyk81g2kN11JhQDQGoFq1nQmVOHoNeyOb2qjMMxDWm35Pt33fdBM07Wblutrl/a/ndGx5Z+p
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(66899015)(186003)(2616005)(2906002)(82310400005)(31696002)(356005)(31686004)(316002)(70206006)(41300700001)(6666004)(70586007)(40460700003)(40480700001)(6486002)(4326008)(478600001)(8676002)(6512007)(6862004)(8936002)(6506007)(86362001)(36756003)(26005)(53546011)(47076005)(54906003)(82740400003)(336012)(36860700001)(83380400001)(5660300002)(81166007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 07:04:12.3527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ba7bb4-078b-4f2e-1c38-08daaa8da2c3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8358

Hi Jan,

On 2022/10/9 15:25, Wei Chen wrote:
> Hi Jan,
> >
>>>> Even more so an answer to my question would be nice: You'll then have
>>>> CONFIG_HAS_NUMA_NODE_FWID=y even on Arm (using PXM as mandated by ACPI
>>>> when in ACPI mode). But then what's the FWID for DT? I know it was me
>>>> to suggest this build time distinction, but I'm afraid I wasn't doing
>>>> much good with that (and I'm sorry).
>>>
>>> How about introducing a flag for selected NUMA implementation to
>>> set it in runtime?
>>> For example:
>>> bool numa_has_fw_nodeid;
>>>
>>> ACPI NUMA will set this flag to 1, but 0 for DT NUMA.
>>
>> That's an option alongside going back to what you had in an earlier
>> version. Another would be (name subject to improvement)
>>
>> const char *__ro_after_init numa_fw_nid_name;
>>

When I was dealing with this comment, I found that I was still a little 
unclear:

When we were introducing "CONFIG_HAS_NUMA_NODE_FWID", we wanted to 
eliminate the redundant code of:
if ( fwid_name not equal to "node" )
     printk(KERN_INFO "NUMA: Node %u %s %u [%"PRIpaddr"%"PRIpaddr"]%s\n",
            node, fwid_name , arch_nid, start, end - 1,
            hotplug ? " (hotplug)" : "");
else
     printk(KERN_INFO "NUMA: Node %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
            node, start, end - 1, hotplug ? " (hotplug)" : "");

But when I am working with numa_fw_nid_name, I find it's still not
easy to reduce above redundant code. For example:

"NUMA: Node %u %s %u
When numa_fw_nid_name = NULL, we can print "" for %s, but can't reduce
the second %u.

So can we split this message into 3 lines like:
     printk(KERN_INFO "NUMA: Node %u"...);
     if (numa_fw_nid_name)
         printk(KERN_INFO " %s %u"...);
     printk(KERN_INFO "[%"PRIpaddr"%"PRIpaddr"]%s\n"...);

Or another option, we can force each NUMA implementation to assign a
string for numa_fw_nid_name. For example, in DT NUMA, we can assign
numa_fw_nid_name="SOCKET".

Cheers,
Wei Chen

>> which for ACPI would be set to "PXM" (eliminating the need to pass
>> it to certain functions, albeit the fw_nid will continue to need to
>> be passed anyway). I guess I'm not really certain which of this and
>> your earlier approach I prefer; the boolean you suggest above looks
>> less desirable to me, though.
>>
> 
> Ok, I will follow your suggestion.
> 
> Cheers,
> Wei Chen
> 
>> Jan

