Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 378E37EC744
	for <lists+xen-devel@lfdr.de>; Wed, 15 Nov 2023 16:30:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.633746.988796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Hpy-0007tL-NV; Wed, 15 Nov 2023 15:29:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 633746.988796; Wed, 15 Nov 2023 15:29:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3Hpy-0007qY-Kg; Wed, 15 Nov 2023 15:29:54 +0000
Received: by outflank-mailman (input) for mailman id 633746;
 Wed, 15 Nov 2023 15:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ea73=G4=arm.com=Divin.Raj@srs-se1.protection.inumbo.net>)
 id 1r3Hpx-0007qS-JV
 for xen-devel@lists.xenproject.org; Wed, 15 Nov 2023 15:29:53 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2048.outbound.protection.outlook.com [40.107.13.48])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1dc51a3-83cb-11ee-98db-6d05b1d4d9a1;
 Wed, 15 Nov 2023 16:29:51 +0100 (CET)
Received: from AM5PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:206:1::15)
 by AS8PR08MB10247.eurprd08.prod.outlook.com (2603:10a6:20b:629::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Wed, 15 Nov
 2023 15:29:22 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:206:1:cafe::94) by AM5PR04CA0002.outlook.office365.com
 (2603:10a6:206:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18 via Frontend
 Transport; Wed, 15 Nov 2023 15:29:22 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.19 via Frontend Transport; Wed, 15 Nov 2023 15:29:22 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228");
 Wed, 15 Nov 2023 15:29:21 +0000
Received: from 821dd9be5ea1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 485902C7-94E2-4CBD-B43A-E7DF33756486.1; 
 Wed, 15 Nov 2023 15:29:15 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 821dd9be5ea1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 15 Nov 2023 15:29:15 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com (2603:10a6:102:13f::16)
 by DB9PR08MB6684.eurprd08.prod.outlook.com (2603:10a6:10:26d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Wed, 15 Nov
 2023 15:29:10 +0000
Received: from PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96]) by PAXPR08MB6750.eurprd08.prod.outlook.com
 ([fe80::542e:1889:d107:2e96%4]) with mapi id 15.20.6977.029; Wed, 15 Nov 2023
 15:29:10 +0000
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
X-Inumbo-ID: d1dc51a3-83cb-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=VW66i/a/bvPh9nXT7iDvIqJzxyLueP/2Dwsc0lXoQxAYLlKLNy+gCMfc1j9J/9Of9IvoeM0VlG8JtuoXa1boKQjm758DB52i3u1OKlnUBxHyR+R+RYTcYjfKKxU9pZ2kGuEzxgkEPIV3n133RCYjF4JpUrD7391PV2V/D69rUei7z7RH6uFjHo9fP31+OCXP6tYQq8+KXdigyn9HZCWSBCUAZCjWWQ6i1JogIx6ZE90FiuAJhY5s+nPtpObeoHm1UZU9EnrFxBVVdrqGVTSPP+KOT6xt7X0mgEkhExya/vIfrW8msNjUx1QWu/R4M/VZf5za3NpvGFfGh4j8KNKmsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZQ2mIHLRREuZyGjdoydo+TCa2MgPvLwS3KDqPvn0us=;
 b=ijvS9BcIVk30PEfHNc+bnq/k8bqi2BIWW6WaYCqN/iwgWHbL1oZprY1w5XD2edMLlB7eLQ8vcVeeg+gxEZNDiNb2bWDTGtuL5cfHDAiMkcpEoTwuQUaSKHLP/YhEYGJoGE3hoIacuQsYCJQ4vR4n8igN847Dk/L1kvoj/WofLV203gPN3ap2I+kx4HBZdTbX/y2CSc0HsNG7SEcWjz/Cw67vbqRL/wgfEX65qLuZqWzlkLfIlb9wdwfkaJsm2I3MvWb/dxg0pUOSk96dvkNhVrssjUU73zQaQ435MZ+PDir/Cu2iXP/mi/mi+IabEHFSvBG5se4Ot4NY4Xi8BG9WAQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZQ2mIHLRREuZyGjdoydo+TCa2MgPvLwS3KDqPvn0us=;
 b=0vhe5DtID7zpzwpCEQKKe+RCik69mRcPys5dw2mUJcUNarOiHuNivPHzjdpw5OCh6UVgBM61oAJp23Rj2ioiejjJQZLVnXE7RQVY3aiGAvP8UCfXdur4jF0Ts8uYBdirht2cz1T4CGu0bicTD4mTwXyieT41Fihl5kX39GSiOk4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: cbd8597cfb86421e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zva3jQzgR/ZwggQ9Q6b45UqmAjoVxkaOGDm67H/CRcbm2Md7w81V0OpI0YBGunutCxUSBMQlLvF2fFVa0JZtC46arqhWooWoO2lExMNq6hpg8HgWLs2KwbQ9kgn/50UNYpkRGN6/oeTFHTb8xmM4EW6JkCpTIVbjTezdY10p5S2JK7lD3CnfbmDbwO+brSSQZibvZpQMxJ1lnwXetgClHmBo1+ciDI+bE/e7rLrADW1fRr1sKOQBxDyNQ3YdHQPVWWCmdz38MNG6Au1aeY6xr81XKuqlQ/s4Bu9GuqmC2Txgm67YyrDJsm4Ggfcjjx6S7mNv6XA9WgXpezOrIszqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZQ2mIHLRREuZyGjdoydo+TCa2MgPvLwS3KDqPvn0us=;
 b=aujX99K2QpofA7Ndt1n4OSwVBWp4vfz7WLJPd18kNBkEg5etthJPS1/I8TZKp+QR+UHUreknHJEWCYTK/6EFIqf+ZezVXNIVNP/4jwH7ZH1Ary5V47NtR8Ws3VfWDau7sxkYRedHotswaKu85Df/pSIheVz2mRxn5wEAcv1Dkaf3kBj30XK9glpsJxEZuH7o0BLc3U+W53CdCLfrLVsQYsoxkX7tChlvG7tH/sbMBCgWX77qoEl30YN6ka40S3oLtEdm7PExfcIRTscl12R8PFMuDf6a0WvR+pavj27ImEYnSZObSUY4QnhjCXN6Wz15bObtdHsmjoWbdScOsPdE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZQ2mIHLRREuZyGjdoydo+TCa2MgPvLwS3KDqPvn0us=;
 b=0vhe5DtID7zpzwpCEQKKe+RCik69mRcPys5dw2mUJcUNarOiHuNivPHzjdpw5OCh6UVgBM61oAJp23Rj2ioiejjJQZLVnXE7RQVY3aiGAvP8UCfXdur4jF0Ts8uYBdirht2cz1T4CGu0bicTD4mTwXyieT41Fihl5kX39GSiOk4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Content-Type: multipart/alternative;
 boundary="------------angZAYbZFlhxt5znIwG630W8"
Message-ID: <4a54e7e7-c041-44d3-a16e-d331e9fdd414@arm.com>
Date: Wed, 15 Nov 2023 15:29:09 +0000
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@citrix.com, jgross@suse.com,
 Luca Fancellu <Luca.Fancellu@arm.com>,
 "Rahul.Singh@arm.com" <Rahul.Singh@arm.com>
From: Divin Raj <divin.raj@arm.com>
Subject: [Discussion]: Making "LIBXL_HOTPLUG_TIMEOUT" configurable through
 'xl.conf'
X-ClientProxiedBy: LO4P123CA0585.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::19) To PAXPR08MB6750.eurprd08.prod.outlook.com
 (2603:10a6:102:13f::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR08MB6750:EE_|DB9PR08MB6684:EE_|AM2PEPF0001C70F:EE_|AS8PR08MB10247:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e54d11-fa66-42ef-b070-08dbe5efa471
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3cQB4AZW0ZSjptn8lFuYrwGb+UQNYeJKkm2YRqF28xC1m5b2gEy4aZ7+chAfGfG5/dnHHM+QQZihib+RkSACX1d1Rag5fI4uByADE9WudY/VbD3bS8ZF6SqgY2QM2YLnt0W9lg4qyybT6gWBcrTX8RVfhgonDnE2eaXGlT8WfJ02kvGODi/oJHuHl5Vl+ODxRgITpAUrnoIa5qYeF0kOfsfrsBO39smMv/pPAln9vY/Ur3gnCQbhfq+PWGYlacdiFqy+Lrao0dGWjhMHsKxKvdLfVKrvdh8qy9+FKgByB3Fwh2x8kc0IxKcYCRzIpkh52ufP6vmz96G+iGtRmLVV7eVtFHxUZs9yeh4EkqSTI1rlvt1cDXiWLUD2Rexu5sPwHoVog99okkFmcIjCj8dkeiqemfqQwMb8x4YYCoP0wNjuEr14hPOhR9YBShHZVO88suCJa32+TuRKB0dQpXH21p61CI1uKuMFbQAwFiY0jxcZq5UfiYqCpsOq1WtnzT/NvSkiSeAYC04loiFhoWE+CX595bYldlVLLu3eFfE9abWToVdLmqSjKYCWKJc6LXFtk962xeu27R32IBbpWXC8Z23/bAsOogc7TYjl2N9w/qLkFCpiWLVPPgRmxDVBwhsrpwh+hcD3KXObdshGKRTWiA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6750.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(136003)(366004)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(66476007)(44832011)(66556008)(54906003)(316002)(6916009)(41300700001)(8676002)(4326008)(8936002)(66946007)(6486002)(36756003)(86362001)(5660300002)(2906002)(478600001)(38100700002)(31696002)(33964004)(6506007)(83380400001)(26005)(2616005)(6512007)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6684
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17652063-7b1b-46de-9481-08dbe5ef9d4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7HhzXmdh3Zh1FxD6HWeKcYA5aMHZzYrDAKk8t9cXUZlKtTiSb6pdTYEHGJ3myQE8q1J5AweY/QlqIL3Gbot15Stcn4cCc/RkpNCts9aCXhMzTEkwrGBxUuyBsje6xk2UE+G9PAlQLTGIucP6MbpNpr0NrI6Ujh58ErHqcc/VN5/FMFwJpj7QpHgp9OMhKO9VZJ1oEIWn+inL6DlBdDyCJDECPVrHbsUL5KECBEynFAKHdUgkmzBLg6azckgFTGfh2xlWfSxUBEH3J2IUyMPrvoC6MWoUhEGf+12K/KCeQoa5w8j8aL37YQwcUJ6ASiRQzosHGPnjpBb3dVVi8a5y2RiB5U2zFfFmx9qKRu4pU0JhL85Ubqjf2DXuVClu9aV6NHzXuzF8Wz3+OWImOv90+4rEfPZxC1nQbRZr/o7iB3CfKGdy3dkUvELm/c6ghVy+ALXiiq3Xk/55a6VYwJnZgBQxKS7IjPchYKRI0KTrZs0BaH2MZnulZbyL4WolpqAIwSIAFmP80ThOeu//SHcrmnxK/6//zQGm2BunnhHwFPmYH03chw7cbskn3cpcbwp7rju6tZQmo0PktEDUAYnDlgcky1jSy+NyuOcGiX+WzfQz8BaAUXL/4jWT9L7Y3GdeuO5nP4kNbJ5fRH3QEooxwm8Ejhb5I+wa2EOq1dZtPVzDDxKyeestnT9aJs9MFeJRimqQUiaRL+jMeg0iiG/4ZECsGbKA+9xlmL/C+Su0bhZOtH35uriip2+1QS9R2gOFmkgWCtWJ2qX83IvCdC8/3Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(39860400002)(346002)(376002)(230922051799003)(451199024)(64100799003)(82310400011)(186009)(1800799009)(36840700001)(40470700004)(46966006)(47076005)(336012)(2906002)(40460700003)(83380400001)(82740400003)(81166007)(36756003)(356005)(86362001)(31696002)(41300700001)(36860700001)(6506007)(33964004)(44832011)(6512007)(478600001)(6486002)(70206006)(6916009)(70586007)(316002)(8676002)(31686004)(8936002)(54906003)(4326008)(40480700001)(2616005)(26005)(5660300002)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2023 15:29:22.1290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e54d11-fa66-42ef-b070-08dbe5efa471
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10247

--------------angZAYbZFlhxt5znIwG630W8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> Hi Xen community,
>
> On one of our internal projects we came across an issue in the 
> toolstack: when multiple network interfaces are initialized 
> concurrently with other system workloads, the execution time of the 
> hotplug script often exceeds 40 seconds, leading to an error.
> To mitigate this issue, we are considering making 
> “LIBXL_HOTPLUG_TIMEOUT” configurable through ‘xl.conf’, instead of 
> increasing the hard-coded “hotplug timeout”, do you think it could 
> make sense?We would greatly appreciate any feedback, suggestions, or 
> improvements you could provide.
> Thank you for your time and consideration.
>
> Regards
> Divin

--------------angZAYbZFlhxt5znIwG630W8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <blockquote type="cite" class="c-mrkdwn__quote" data-stringify-type="quote" style="box-sizing: inherit; margin: 4px 0px; padding: 0px 0px 0px 16px; position: relative; counter-reset: list-0 0 list-1 0 list-2 0 list-3 0 list-4 0 list-5 0 list-6 0 list-7 0 list-8 0 list-9 0; color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Hi
      Xen community,<br>
      <br style="box-sizing: inherit;">
      On one of our internal projects we came across an issue in the
      toolstack: when multiple network interfaces are initialized
      concurrently with other system workloads, the execution time of
      the hotplug script often exceeds 40 seconds, leading to an error.<br style="box-sizing: inherit;">
      To mitigate this issue, we are considering making
      “LIBXL_HOTPLUG_TIMEOUT” configurable through ‘xl.conf’, instead of
      increasing the hard-coded “hotplug timeout”, do you think it could
      make sense?<span aria-label="" class="c-mrkdwn__br" data-stringify-type="paragraph-break" style="box-sizing: inherit; height: 8px; display: block;"></span>We
      would greatly appreciate any feedback, suggestions, or
      improvements you could provide.<br style="box-sizing: inherit;">
      Thank you for your time and consideration.<br>
      <br>
      Regards<br>
      Divin<br>
    </blockquote>
    <p></p>
  </body>
</html>

--------------angZAYbZFlhxt5znIwG630W8--

