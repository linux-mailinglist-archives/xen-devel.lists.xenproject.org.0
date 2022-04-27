Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62A511126
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 08:28:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314382.532428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njb9e-0000lN-F0; Wed, 27 Apr 2022 06:28:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314382.532428; Wed, 27 Apr 2022 06:28:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njb9e-0000im-AR; Wed, 27 Apr 2022 06:28:02 +0000
Received: by outflank-mailman (input) for mailman id 314382;
 Wed, 27 Apr 2022 06:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q6ah=VF=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1njb9c-0000BS-R0
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 06:28:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe06::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ec2378f-c5f3-11ec-8fc2-03012f2f19d4;
 Wed, 27 Apr 2022 08:27:59 +0200 (CEST)
Received: from DB9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::8) by AS8PR08MB6726.eurprd08.prod.outlook.com
 (2603:10a6:20b:39a::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 27 Apr
 2022 06:27:58 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::b2) by DB9PR01CA0003.outlook.office365.com
 (2603:10a6:10:1d8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 06:27:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 06:27:57 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Wed, 27 Apr 2022 06:27:57 +0000
Received: from 4e5aeb66da96.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CA430BC6-F33E-4878-9751-063B18499023.1; 
 Wed, 27 Apr 2022 06:27:51 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4e5aeb66da96.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 27 Apr 2022 06:27:51 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com (2603:10a6:102:2b9::9)
 by VI1PR0802MB2286.eurprd08.prod.outlook.com (2603:10a6:800:9e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.17; Wed, 27 Apr
 2022 06:27:47 +0000
Received: from PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb]) by PAXPR08MB7420.eurprd08.prod.outlook.com
 ([fe80::c9c3:bf08:ecb8:1feb%8]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 06:27:47 +0000
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
X-Inumbo-ID: 2ec2378f-c5f3-11ec-8fc2-03012f2f19d4
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IOpAZbse73k1qE/VI1xBX1kgVEm3meYIwMqXWeD+xOFTSy+MQ1lPshLDeEnjVVz52eAnU3BTyWkOjMnEl2UVIfdv+KR9gm0p/fBLS0qYxyn4L0wGpJBRJgDK6CGuS97x6suV/o1ROGgYWUlkZLzGu6bLG7Fj73guGIrUjZXHnRDyEQF4Ns1poQnQtU5sRh1XDL9Um3MDWUji/jYoMX7t0MnMTBwBtGDJgsEPwpGx83jO2vjrhDMwPEYCAsC0AKsfLnslqdJc3f3VLJgc40KX+H9G+YK1WEkoHe2lAdcGyz5JAmNoUoB65P/GGkJ7XczilYcEKW8TwKgYzqP4Hf/oqA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=If2X0BlV/dg9z6xzoWqRbdLtn4k0nYahiIeBt+aBCRY=;
 b=V0+bLIIgPCShs+GiIoJgQUj5RAbEoG60IXBDxFCL/Oe6XWeAoozeaImguJVPeHYnObBO2LzGvfoRQST269kfsdziG2U5/vnpSUWjxVOLM7MhnDldUL88w74smAJwf5v1ACcaBD0Pa+Qii5fGponAGUnYOITH8VGTf1WCsiUtjkBeV92sVEQ76HN6eBa9aL5O6hQmM6mhukLltzfgpAtCNmJVY4Meim3baJj6rzZOAYD7Lv45INaeo/gNMYUyQTixHWjRvrcQoa3uxpY68T2oQ3GsU5Z7gJ1eoR3A8GWj0H6ugiPsWjKC035xbHXBvI/jiPwNHVtQilh6D2U9KEJchA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If2X0BlV/dg9z6xzoWqRbdLtn4k0nYahiIeBt+aBCRY=;
 b=W5gWy/6jlKf0BcgwNfFr7InvqRFUQU8p/4RnAYhqOUk2/1i4hyTKoS+lB8N4sz/diJ7W88Q+VLy09O5hj1hBNVIYLO3TUkaY/OTUw+7VNtWjyMcjEv4+WLYbAbrD9oItMisUjfJCbYmhsQkmUZuuWvyYph5MjLgwvwhEr7ijDZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8482fed2bc0f6dc2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mvcC7AAvNDFPzijd4lOPHT4vLO5Mtvg2kXIr6mtbmnHMk63bBMOS5nxlHS63rSBhLTSfSDX2IWXnKigrPdSqlhk57u5Ay7yE/E0Vb0aofdOYfXK2K99SxVD9MNxT+9xpoJXISk3ZtDZR/RrBUXJ83oCnUBtBfJSclHpkBMS22eGsJryR4OxLn+rRYWk0Cem9TImwVdsemriJoVrLq/BQRd5uWUGLYhebzkSkzWK/NfO6kyAVFr4t92V8hm2V2nfrVqMBNgh9dpZH/kntbXMqrzN2qq6M04nHyz7uuAuEVP13uDcHYgWYaoK2vSybXwZk6SbrY76hDQ8IhoEHSuVRTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=If2X0BlV/dg9z6xzoWqRbdLtn4k0nYahiIeBt+aBCRY=;
 b=fwhWdk6v0ex5wNoKv7Ek3YUVgAIsFdIus35TwjPNHKCvF9RiAMdpD8QcA1d9H0zBevxRrGqRlQpJJaYHC9q8F3No5yUp5bsS6atDwe0RZcRgvw0XorOznPQgA6zde/qRMd4UhTd1zODgmIBtSTmXPhtq7mI4ZhVtXcDrumhEftFtVSw4Yy6bYyd//U4CpAae7nlyEl/jkZEG3ODtjdGxkzgD18ICWnYNfTCh0WdbxV6bWfFyjVUvqLfHnFRxUPSqmz3UrmR5jjvT+AhFwHcM+rgS3c541KNczllN1Zt/jdjB6CWAaObqR/wYXKpCeaPN9pbnAdE2Thi4XPjXXY+7zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=If2X0BlV/dg9z6xzoWqRbdLtn4k0nYahiIeBt+aBCRY=;
 b=W5gWy/6jlKf0BcgwNfFr7InvqRFUQU8p/4RnAYhqOUk2/1i4hyTKoS+lB8N4sz/diJ7W88Q+VLy09O5hj1hBNVIYLO3TUkaY/OTUw+7VNtWjyMcjEv4+WLYbAbrD9oItMisUjfJCbYmhsQkmUZuuWvyYph5MjLgwvwhEr7ijDZM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Message-ID: <f43f29af-dbc7-e326-dcd3-3fe295101340@arm.com>
Date: Wed, 27 Apr 2022 14:27:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 05/10] xen/x86: Use ASSERT instead of VIRTUAL_BUG_ON
 for phys_to_nid
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: nd <nd@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20220418090735.3940393-1-wei.chen@arm.com>
 <20220418090735.3940393-6-wei.chen@arm.com>
 <6d666aa4-c0d3-b8ed-9fca-e9d2179564d3@suse.com>
 <7d7fc887-20a3-49c3-0754-3bca3442ccce@arm.com>
 <79e3fc8d-7064-e981-b90c-d0f7fa0aafae@suse.com>
 <PAXPR08MB74209F0F6F0B189FA10D04FA9EFA9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <cb36bf58-4c24-7f2e-ba26-980359ad06eb@suse.com>
From: Wei Chen <Wei.Chen@arm.com>
In-Reply-To: <cb36bf58-4c24-7f2e-ba26-980359ad06eb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0027.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::22) To PAXPR08MB7420.eurprd08.prod.outlook.com
 (2603:10a6:102:2b9::9)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 23ebb044-0c93-439c-9b8e-08da28171209
X-MS-TrafficTypeDiagnostic:
	VI1PR0802MB2286:EE_|DB5EUR03FT046:EE_|AS8PR08MB6726:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB67267FF19CE0316A5D52CAAF9EFA9@AS8PR08MB6726.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sYlE8n7yYrKd9Ff+GxfymmHZtwgjdd9ufA4DstSwDXRsq0UmQkP/hpInRA5/uiweFDv+GB1WeI01FVVi/gq3LI0NCPX46muYkjiOw3izfVKRskYj3BiuVFo5I1TsbT5h3qfxu3whI4t9o2ZNiIC1FtKLGxqD25MNsI+tP7QXosWQWVaHPvsSGkqnuhLm8cxcp6Z/nVxPpKvX+ArvqHDvWVq3HsPtZi9DVM3D6XwBJk31I0sQABdrSje3d92VCpBPcIYt9Uam9Sdp3vbDxCMbIwEtJ7JfWH8fbx39/UiXDO/nomgYD1qEmJO87HuAlve2a8ykUOtVDkCCf3JOjA+WZ/JdZ7JbOA5sDbs4Q8EegvD1MJ4qKI7XBBZzqRH9c+VwmZD0OoBdADCB2YKB0bH4c39pi4P+oMrkdC3VhsX2cdNpztJD0zwWyPR14ay0wEpkPmrhmKIu1Kjo/Wq+oTWh9DXlN4d0cMSFkgyJuQxMm7tSwMYRSFPv8xGBOUddJugPokp+Zr2Gydon7ybAwBn0l8vhHbUDd+XC7kZU1vaDgubC7owyzR83O1S4emJJVH6PYb4YH5qCkEhXIZ4LRc9kcv+QkYlIRgWbE+VHzE/ttRdXn2OloLHAZqwCE1TyG53jsOxxWPrhE58TViq/Se5oCAK75DjgiiWwZ8MiuyZNo7Wgi1Fuqa3yEVk4W8dPIkKVP7gvuAjpQFxA3oe9ZWOUdFGTV0GzEOj73bT3LZruJmM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB7420.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(6486002)(6916009)(38100700002)(54906003)(508600001)(8676002)(66946007)(66476007)(31696002)(4326008)(36756003)(86362001)(31686004)(66556008)(2906002)(8936002)(2616005)(26005)(5660300002)(83380400001)(6512007)(316002)(6666004)(53546011)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2286
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	84c2b984-489e-4294-a9a8-08da28170bca
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9WvpJvOY4/LpoVMKD/AlRK0qfOramiPCNbB9WkED3i+QQUsTkJ0QvfFYZrfiJClVy6GBnnj4IHlqn4EuaTTleFztIFFZkiA5rGudCvw5qelwbMF+Z2qCt1ny01Aeq93ZGmy1oj6Ipd2Y0TjvyjyS2w/ZwiY+V1sqG7JA8LdebXdciQ4o7WUJOOBbWZkEMWWCoFarSMHzcFgasqtIV/++gYhxQPBXnD69bqnXDII4eGZpMizpa5uk77zhaOiwVW3rYiTZntA3JedXDtin+8dwVvZ0iGcelFVTUrYQ2JsMuTE4Ife+ECKeHmvU32Ki5XjEjufjHmki953lpMUziA5HrIEkhPtfHQIDpp8kxos2DlM6hN/K8NDmvZy9uK0zrBg0uFBt5Sn/+QwbFNk6szytQ7bALDl8/Qbq7aKzUNf8Cdzv5l2ye8ED5tJ/1tLjx1aYfqMzyx16O3Zk3i8iLksAM1WUPiGq6aXXlH0odm5gPNYoE83bj9JIQ7bNWfkKU4f0lgQaFmHDwaXC3Wjz5o2gqVDnUtiYnYYsEDb3aVgp2g90AWDtNCUQpr/s34Kx9Hy2sqIhHFayrVMYXPekHQcutqJAfIQY8HTd86qWQTO/YsL6UVp9A25MBm+9CJvFdsKoebKERpIY3DQIfq8o6N9Px0oZMUSqJ0wd2/oTRK0NK5f/51Dpqwq+zfxbACXrZ07OhtCjN8qRaFzuNvbEbu3DOQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(336012)(53546011)(6506007)(8936002)(36756003)(83380400001)(5660300002)(4326008)(31696002)(186003)(36860700001)(2906002)(31686004)(8676002)(6862004)(2616005)(26005)(86362001)(508600001)(47076005)(6486002)(316002)(81166007)(70586007)(70206006)(82310400005)(6666004)(40460700003)(356005)(54906003)(6512007)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 06:27:57.8324
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23ebb044-0c93-439c-9b8e-08da28171209
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6726

Hi Jan,

On 2022/4/27 13:56, Jan Beulich wrote:
> On 27.04.2022 05:52, Wei Chen wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 2022年4月26日 22:42
>>>
>>> On 26.04.2022 12:59, Wei Chen wrote:
>>>> On 2022/4/26 17:02, Jan Beulich wrote:
>>>>> On 18.04.2022 11:07, Wei Chen wrote:
>>>>>> 2. error: wrong type argument to unary exclamation mark.
>>>>>>      This is because, the error-checking code contains !node_data[nid].
>>>>>>      But node_data is a data structure variable, it's not a pointer.
>>>>>>
>>>>>> So, in this patch, we use ASSERT instead of VIRTUAL_BUG_ON to
>>>>>> enable the two lines of error-checking code. And fix the left
>>>>>> compilation errors by replacing !node_data[nid] to
>>>>>> !node_data[nid].node_spanned_pages.
>>>>>>
>>>>>> Because when node_spanned_pages is 0, this node has no memory,
>>>>>> numa_scan_node will print warning message for such kind of nodes:
>>>>>> "Firmware Bug or mis-configured hardware?".
>>>>>
>>>>> This warning is bogus - nodes can have only processors. Therefore I'd
>>>>> like to ask that you don't use it for justification. And indeed you
>>>>
>>>> Yes, you're right, node can only has CPUs! I will remove it.
>>>>
>>>>> don't need to: phys_to_nid() is about translating an address. The
>>>>> input address can't be valid if it maps to a node with no memory.
>>>>>
>>>>
>>>> Can I understand your comment:
>>>> Any input address is invalid, when node_spanned_pages is zero, because
>>>> this node has no memory?
>>>
>>> It's getting close, but it's not exactly equivalent I think. A node
>>> with 0 bytes of memory might (at least in theory) have an entry in
>>> memnodemap[]. But finding a node ID for that address would still
>>
>> I have done a quick check in populate_memnodemap:
>> 74          spdx = paddr_to_pdx(nodes[i].start);
>> 75          epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
>> 76          if ( spdx >= epdx )
>> 77              continue;
>>
>> It seems that if node has no memory, start == end, then this function
>> will not populate memnodemap entry for this node.
>>
>>> not mean that at least one byte of memory at that address is present
>>> on the given node, because the node covers 0 bytes.
>>>
>>
>> And back to this patch, can I just drop the unnecessary justification
>> from the commit message?
> 
> Well, you'll want to have _some_ justification for that particular
> aspect of the patch.
> 

Ok.

>> And for the bogus warning message, can I update it to an INFO level
>> message in part#2 series, and just keep:
>> printk(KERN_INFO "SRAT: Node %u has no memory!\n", i);
>> but remove "BIOS Bug or mis-configured hardware?\n", i); ?
> 
> This sounds at least plausible to do.
> 

Ok.

> Jan
> 

